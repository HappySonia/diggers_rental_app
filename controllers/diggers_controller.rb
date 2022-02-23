get '/' do
    diggers = run_sql('SELECT * FROM diggers')
    erb :'diggers/index',locals:{
        diggers:diggers
    }
end
    
get '/diggers/new' do    
    erb :'diggers/new'
end

post '/diggers/add' do
    brand = params['brand']
    model = params['model']
    img_url=params['img_url']
    rental_startdate=params['rental_startdate']
    rental_enddate=params['rental_enddate']
    rate=params['rate']

    run_sql('INSERT INTO diggers(brand,model,img_url,rental_startdate,rental_enddate,rate)VALUES($1,$2,$3,$4,$5,$6)',[brand,model,img_url,rental_startdate,rental_enddate,rate])   
    redirect '/'
end

get '/diggers/edit' do
    id=params['id']
    digger = run_sql('SELECT * FROM diggers WHERE id = $1',[id])[0]
    erb :'diggers/edit',locals:{
        digger:digger
    }
end

patch '/update/:id' do
    id=params['id']
    brand = params['brand']
    model = params['model']
    img_url=params['img_url']
    rental_startdate=params['rental_startdate']
    rental_enddate=params['rental_enddate']
    rate=params['rate']
    run_sql('UPDATE diggers SET brand = $2,model=$3,img_url=$4,rental_startdate=$5,rental_enddate=$6,rate=$7 WHERE id=$1',[id,brand,model,img_url,rental_startdate,rental_enddate,rate])   
    
    redirect '/'
end

post '/delete' do
    id = params['id']
    run_sql("DELETE FROM diggers WHERE id =$1",[id])
    redirect '/'    
end

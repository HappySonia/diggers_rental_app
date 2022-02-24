get '/' do
    diggers = all_diggers
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

    create_digger(brand,model,img_url,rental_startdate,rental_enddate,rate)
    
    redirect '/'
end

get '/diggers/edit' do
    id=params['id']
    digger = get_digger(id)
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
    update_digger(id,brand,model,img_url,rental_startdate,rental_enddate,rate)   
    
    redirect '/'
end

post '/delete' do
    id = params['id']
    delete_digger(id)
    redirect '/'    
end

def all_diggers
    run_sql("SELECT * FROM diggers ORDER BY id;")
end

def get_digger(id)
    run_sql('SELECT * FROM diggers WHERE id = $1',[id])[0]
end

def create_digger(brand,model,img_url,rental_startdate,rental_enddate,rate)
    run_sql('INSERT INTO diggers(brand,model,img_url,rental_startdate,rental_enddate,rate)VALUES($1,$2,$3,$4,$5,$6)',[brand,model,img_url,rental_startdate,rental_enddate,rate])   
end

def update_digger(id,brand,model,img_url,rental_startdate,rental_enddate,rate)
    run_sql('UPDATE diggers SET brand = $2,model=$3,img_url=$4,rental_startdate=$5,rental_enddate=$6,rate=$7 WHERE id=$1',[id,brand,model,img_url,rental_startdate,rental_enddate,rate])    
end

def delete_digger(id)
    run_sql("DELETE FROM diggers WHERE id = $1",[id])
end
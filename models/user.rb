def create_user(first_name,last_name,email,mobile,password)
    password_digest = BCrypt::Password.create(password)
    run_sql('INSERT INTO users(first_name,last_name,email,mobile,password_digest)VALUES($1,$2,$3,$4,$5)',[first_name,last_name,email,mobile,password_digest]) 
end


def find_user_by_email(email)
    users = run_sql('SELECT * FROM users WHERE email = $1',[email])
    if users.to_a.length > 0
        users[0]
    else
        nil
    end
end

def find_user_by_id(id)
    users = run_sql('SELECT * FROM users WHERE id = $1',[id])[0]   
end
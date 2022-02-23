
get '/weather/details' do   
    erb :'/weather/details'
end

get '/weather/result' do
    city = params['city']
    duration = params['duration']

    # url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=3e4e9811f1372c72678cc60e76137f0d&units=metric"

    # url = "https://api.openweathermap.org/data/2.5/forecast/daily?q=#{city}&appid=3e4e9811f1372c72678cc60e76137f0d&units=metric"

    

    url_GEO = "https://api.openweathermap.org/geo/1.0/direct?q=#{city}&limit=5&appid=3e4e9811f1372c72678cc60e76137f0d"

    result = HTTParty.get(url_GEO).parsed_response

    lat = result[0]['lat']
    lon = result[0]['lon']

    weather_url="https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{lat}&lon=#{lon}&cnt=#{duration}appid=3e4e9811f1372c72678cc60e76137f0d"


    api_result =  HTTParty.get(weather_url).parsed_response
    
    erb :'weather/result', locals: {            
        description: api_result['weather'][0]["description"],
        temp: api_result['main']['temp'],
        humidity: api_result['main']['humidity'],
        visibility: api_result['visibility'],
        city:city
    }
end
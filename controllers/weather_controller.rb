
get '/weather/details' do   
    erb :'/weather/details'
end

get '/weather/result' do
    city = params['city']    
    
    # url_geo = "https://api.openweathermap.org/geo/1.0/direct?q=#{city}&limit=5&appid=3e4e9811f1372c72678cc60e76137f0d"

    url_geo = "https://api.openweathermap.org/geo/1.0/direct?q=#{city}&limit=5&appid=#{ENV['OPENWEATHER_API_KEY']}"
   

    result_geo = HTTParty.get(url_geo).parsed_response

    lat = result_geo[0]['lat']
    lon = result_geo[0]['lon']

    # url_weather = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=current,minutely,hourly,alerts&appid=3e4e9811f1372c72678cc60e76137f0d&units=metric"

    url_weather = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=current,minutely,hourly,alerts&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric"


    result =  HTTParty.get(url_weather).parsed_response
    
    erb :'weather/result', locals: {
    city: result['timezone'],     
    results:result['daily']
    }
end
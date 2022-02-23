
get '/weather/details' do   
    erb :'/weather/details'
end

get '/weather/result' do
    city = params['city']    

    url_geo = "https://api.openweathermap.org/geo/1.0/direct?q=#{city}&limit=5&appid=3e4e9811f1372c72678cc60e76137f0d"

    result_geo = HTTParty.get(url_geo).parsed_response

    lat = result_geo[0]['lat']
    lon = result_geo[0]['lon']

    url_weather = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=current,minutely,hourly,alerts&appid=3e4e9811f1372c72678cc60e76137f0d&units=metric"

    result =  HTTParty.get(url_weather).parsed_response
    
    erb :'weather/result', locals: {
    city:result['timezone'],  
    icon:result['daily'][0]['weather'][0]['icon'],          
    temp:result['daily'][0]['temp']['day'],
    humidity:result['daily'][0]['humidity'],
    wind_speed:result['daily'][0]['wind_speed'],
    description:result['daily'][0]['weather'][0]['description'],

    icon2:result['daily'][1]['weather'][0]['icon'], 
    temp2:result['daily'][1]['temp']['day'],    
    humidity2:result['daily'][1]['humidity'],
    wind_speed2:result['daily'][1]['wind_speed'],
    description2:result['daily'][1]['weather'][0]['description'],

    icon3:result['daily'][2]['weather'][0]['icon'], 
    temp3:result['daily'][2]['temp']['day'],    
    humidity3:result['daily'][2]['humidity'],
    wind_speed3:result['daily'][2]['wind_speed'],
    description3:result['daily'][2]['weather'][0]['description']
    }
end
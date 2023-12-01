class WeatherClient
  include HTTParty

  def initialize(user)
    @longitude = user.longitude
    @latitude = user.latitude
    @api_key =ENV["WEATHER_API_KEY"]
  end

  def get_weather
    url = "https://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&appid=#{@api_key}&units=metric"
    self.class.get(url)
  end

end

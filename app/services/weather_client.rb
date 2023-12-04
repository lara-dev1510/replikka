class WeatherClient
  include HTTParty

  def initialize(user)
    @longitude = user.longitude || '2.349'
    @latitude = user.latitude || '48.853'
    @api_key = ENV.fetch('WEATHER_API_KEY', nil)
  end

  def call
    self.class.get(url)
  end

  def url
    @url ||= "https://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&appid=#{@api_key}&units=metric"
  end
end

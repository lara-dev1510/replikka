import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="openweather"
export default class extends Controller {
  static targets = [
    'city',
    'description',
    'temp',
    'icon'
  ]

  apiKey = 'f3bcd203a9a7baa8b23f373b9394e36f'

  connect() {
    console.log('Controller openweather connected!');
    this.geolocalisation()
  }

  geolocalisation() {
    navigator.geolocation.getCurrentPosition((data) => {
      const urlWithCoordinates = `http://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=${this.apiKey}&units=metric`;
      // console.log({ lat: data.coords.latitude, lon: data.coords.longitude })
      // console.log(urlWithCoordinates)

      fetch(urlWithCoordinates)
        .then(response => response.json())
        .then(data => {
          console.log(data);
          this.cityTarget.innerText = data.name
          this.city = data.name
          console.log(data.main.temp);
          this.temp = Math.round(data.main.temp)
          this.tempTarget.innerText = this.temp
          console.log(data.weather[0].description);
          this.descriptionTarget.innerText = data.weather[0].description
          this.description = data.weather[0].description
          console.log(data.weather[0].icon)
          this.iconTarget.src = `https://openweathermap.org/img/wn/${data.weather[0].icon}.png`
          this.icon = data.weather[0].icon
        })
    });
  }
}

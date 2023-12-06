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
    this.geolocalisation()
  }

  geolocalisation() {
    navigator.geolocation.getCurrentPosition((data) => {
      const urlWithCoordinates = `https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=${this.apiKey}&units=metric`;

      fetch(urlWithCoordinates)
        .then(response => response.json())
        .then(data => {
          this.city = (data.name).split(' ')
          this.cityTarget.innerText = this.city[0]
          this.temp = Math.round(data.main.temp)
          this.tempTarget.innerText = this.temp
          this.descriptionTarget.innerText = data.weather[0].description
          this.description = data.weather[0].description
          this.iconTarget.src = `https://openweathermap.org/img/wn/${data.weather[0].icon}.png`
          this.icon = data.weather[0].icon
        })
    });
  }
}

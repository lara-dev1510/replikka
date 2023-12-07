import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["input", "results"]

  connect() {}

  search(event) {
    // On vide
    const query = this.inputTarget.children[0].value
    // On prépare l'url (endpoint)
    const url = `/generate?query=${query}`
    // On fait la requête
    this.fetch(url)
  }

  fetch(url) {
    fetch(url, {
      method: "GET",
      headers: {"Accept": "application/json"}
    }).then((answer) => {
      return answer.json()
    }).then((data) => {
      this.resultsTarget.innerHTML = data.results
    })
  }

}

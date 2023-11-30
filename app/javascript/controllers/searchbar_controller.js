import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    console.log("Hello")
  }

  search(event) {
    console.log(event.key)
    // this.event.innerText = " "
    // this.currentTarget.innerText = this.event
    // this.currentTarget.innerText = this.input
    // this.event = this.key.currentTarget
  }
  // const drawResponseList = (data) => {
  //   results.innerHTML = '';
  //   data.words.forEach((word) => {
  //     results.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
  //   });
  // };
}

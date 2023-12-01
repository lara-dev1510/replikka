import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark-button"
export default class extends Controller {

  static targets = [
    'bookmarked'
  ]

  connect() {
    console.log("hello")
  }

  bookmark(event) {
    const button = event.currentTarget
    button.hidden = true
    this.bookmarkedTarget.hidden = false
    console.log(button);
  }
}

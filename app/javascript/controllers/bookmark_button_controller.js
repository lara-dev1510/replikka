import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark-button"
export default class extends Controller {

  static targets = [
    'bookmarked',
    'unbookmarked'
  ]

  connect() {}

  bookmark(event) {
    const button = event.currentTarget
    // button.classList.toggle('favorited')
    // button.classList.toggle('icon-card-favorited')
    button.hidden = !button.hidden
    this.bookmarkedTarget.hidden = !this.bookmarkedTarget.hidden
    this.bookmarkedTarget.classList.toggle('favorited')
  }

}

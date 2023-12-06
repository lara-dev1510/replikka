import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["input", "results"]

  connect() {}

  search(event) {}
}

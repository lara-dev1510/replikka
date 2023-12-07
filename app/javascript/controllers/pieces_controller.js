import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['category', 'list', 'return', "form"]

  connect() {}

  toggleList() {
    this.listTarget.classList.toggle('d-none')
    document.querySelector(".grid-today").classList.toggle('d-none')
    document.querySelector('.search-bar').classList.toggle('d-none');
    document.querySelectorAll("[data-pieces-target=category]").forEach((category) => {
      category.classList.toggle('d-none')
    })
  }
}

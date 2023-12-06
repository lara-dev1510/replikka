import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="explore"
export default class extends Controller {

  connect() {
    console.log('yo');
    console.log(this.categoryTargets);
  }

  checkChecked(event) {
    const card = event.currentTarget
    const checkbox = card.nextElementSibling
    const container = card.closest('.explore-swiper')
    const checkboxes = container.querySelectorAll('input[type=checkbox]:checked')
    const arr_checkboxes = Array.from(checkboxes)
    const checked = arr_checkboxes.filter(checkbx => checkbx !== checkbox)
    checked.forEach((chckbx) => {
      chckbx.checked = false
      checkbox.classList.remove('.selected-piece')
    })
  }
}

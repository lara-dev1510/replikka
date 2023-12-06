import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "thumbnail",
    "slider",
    "matchingImage"
  ]

  connect() {
  }

  switchDisplay() {
    this.thumbnailTarget.classList.toggle('thumbnail');
    this.thumbnailTarget.classList.toggle('full_page_image');
  }

  slide(event) {
    if (event.currentTarget.value == 100) {
      this.sliderTarget.remove()
      this.thumbnailTarget.children[0].classList.add('confirmed')
      this.matchingImageTargets.forEach( (target) => {
        target.children[0].classList.add('confirmed')
      })

    }
  }
}

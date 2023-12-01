import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["thumbnail", "matchingPieces", "title", "slider", "matchingImage"]

  connect() {
  }

  switchDisplay() {
    this.thumbnailTarget.classList.toggle('hidden');
    this.matchingPiecesTarget.classList.toggle('hidden');
    if (this.thumbnailTarget.classList.contains("hidden")) {
      this.titleTarget.innerHTML = 'Look'
    } else {
      this.titleTarget.innerHTML = 'Outfit'
    }
  }

  slide(event) {
    console.log('coucou');
      if (event.currentTarget.value == 100) {
        // window.location.href = '/today'
        this.sliderTarget.remove()
        this.thumbnailTarget.children[0].classList.add('confirmed')
        this.matchingImageTargets.forEach( (target) => {
          target.children[0].classList.add('confirmed')
        })

      }

  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["thumbnail", "matchingPieces", "title"]

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
}

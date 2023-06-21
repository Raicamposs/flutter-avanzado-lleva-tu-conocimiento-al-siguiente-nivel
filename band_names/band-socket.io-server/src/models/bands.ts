import { Band } from './band'

export class Bands {
  private bands: Band[]

  constructor() {
    this.bands = []
  }

  addBand(band?: Band) {
    this.bands.push(band ?? new Band())
  }

  getBands() {
    return this.bands
  }

  deleteBand(id: string) {
    this.bands = this.bands.filter((band) => band.id !== id)
    return this.bands
  }

  voteBand(id: string) {
    this.bands = this.bands.map((band) => {
      if (band.id === id) {
        band.votes++
        return band
      } else {
        return band
      }
    })
  }
}

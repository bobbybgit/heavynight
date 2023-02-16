import PlacesAutocomplete from 'stimulus-places-autocomplete'

export default class extends PlacesAutocomplete {

  
  connect() {
    super.connect()
    console.log('Do what you want here.')

    // The google.maps.places.Autocomplete instance.
    this.autocomplete
    console.log(this.autocomplete)
  }

  // You can override the `initAutocomplete` method here.
  initAutocomplete() {
    super.initAutocomplete()
  }

  // You can override the `placeChanged` method here.
  placeChanged() {
    super.placeChanged()
    let place = this.autocomplete.getPlace()
    this.longitudeTarget.value = place.geometry.location.lng()
    this.latitudeTarget.value = place.geometry.location.lat()
  }

  updateGeo(){
    let place = this.autocomplete.getPlace()
    if (typeof place !== 'undefined'){
    console.log(place.geometry.location.lng())
    this.longitudeTarget.value = place.geometry.location.lng()
    this.latitudeTarget.value = place.geometry.location.lat()
    }else{
      this.longitudeTarget.value = null
      this.latitudeTarget.value = null
    }

  }

  // You can set the Autocomplete options in this getter.
  get autocompleteOptions() {
    return {
      fields: ['address_components', 'geometry'],
    }
  }
}
import PlacesAutocomplete from 'stimulus-places-autocomplete'

export default class extends PlacesAutocomplete {

  
  connect() {
    super.connect()
    console.log('Places controller connected.')

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
    console.log(place.address_components)
    if (place.address_components){
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
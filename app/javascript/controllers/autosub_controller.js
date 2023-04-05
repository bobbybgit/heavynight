import Autosave from 'stimulus-rails-autosave'

export default class extends Autosave {

  connect() {
    super.connect()
    console.log('Autosub Connected')
  }

  save() {
    super.save()
    console.log('Saving')
  }

  initialize(){
    super.initialize()
    console.log("Autosave Initialised")
  }



 

}
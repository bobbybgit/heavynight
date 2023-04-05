module PresenceCheck
  def self.game_image(image)
    image && (image.count > 0) && (image[0].is_a?(String)) ? true : false
  end

  def self.array(array)
    array && (array != []) ? true : false
  end

  def self.string(string)
    string && (string != "") ? true : false
  end
end
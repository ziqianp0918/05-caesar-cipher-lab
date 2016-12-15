$array_abc_low = [*?a..?z]#array which includes all of the lower abc
$array_abc_up = [*?A..?Z]#array that includes all of the upper abc


def caesar_encode(string,offset)
  string.split("").map do |characters|#take the user string and split it into different character
    if $array_abc_low.include?(characters)#check if the within the lower abc array there is the characters
      new_character = $array_abc_low[($array_abc_low.index(characters)+offset)%26]#if there is set it to a new character with the new offset and %26 so you can get the new index of the character.
      elsif
      $array_abc_up.include?(characters)#check if the within the up
      new_character = $array_abc_up[($array_abc_up.index(characters)+offset)%26]
    else characters
  end
end.join("")
end

caesar_encode("hi there",2)


def caesar_decode(string,offset)
  string.split("").map do |characters|
    if $array_abc_low.include?(characters)
      new_character = $array_abc_low[($array_abc_low.index(characters)-offset)%26]
      elsif
      $array_abc_up.include?(characters)
      new_character = $array_abc_up[($array_abc_up.index(characters)-offset)%26]
    else characters
  end
end.join("")
end

caesar_decode("hi there",2)
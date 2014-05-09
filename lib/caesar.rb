def caesar(string, offset, &block)
  return string if (offset % 26).zero?

  translation = alphabet_translation(offset)

  alpha_range = to_range(alphabet)
  translation_range = to_range(translation)

  upper_alpha_range = alpha_range.upcase
  upper_translation_range = translation_range.upcase

  block.call(alpha_range, translation_range, upper_alpha_range, upper_translation_range)
end

def caesar_encode(string, offset)
  caesar(string, offset) do |alpha_range, translation_range, upper_alpha_range, upper_translation_range|
    string.tr(alpha_range, translation_range).tr(upper_alpha_range, upper_translation_range)
  end
end

def caesar_decode(encoded_string, offset)
  caesar(encoded_string, offset) do |alpha_range, translation_range, upper_alpha_range, upper_translation_range|
    encoded_string.tr(translation_range, alpha_range).tr(upper_translation_range, upper_alpha_range)
  end
end

# Helpers
def to_range(letters_array)
  if letters_array.first == 'a'
    "a-z"
  elsif letters_array.first == 'z'
    "za-y"
  else
    "#{letters_array.first}-za-#{letters_array.last}"
  end
end

def alphabet_translation(offset)
  alphabet.cycle.take(offset + 26).to_a[offset...(offset + 26)]
end

def alphabet
  [*'a'..'z']
end

def alpha_range
  "#{alphabet.first}-#{alphabet.last}"
end

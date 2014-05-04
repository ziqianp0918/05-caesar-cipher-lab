def caesar(string, offset, &block)
  alpha = ('a'..'z')
  translation = alpha.cycle.lazy.take(offset + 26).to_a[offset...(offset + 26)]
  alpha_range = "#{alpha.first}-#{alpha.last}"
  translation_range = "#{translation.first}-za-#{translation.last}"
  upper_alpha_range = "#{alpha.first.upcase}-#{alpha.last.upcase}"
  upper_translation_range = "#{translation.first.upcase}-ZA-#{translation.last.upcase}"
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

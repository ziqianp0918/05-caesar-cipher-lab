def caesar_encode(string, offset)
  alpha = ('a'..'z')
  translation = alpha.cycle.lazy.take(offset + 26).to_a[offset...(offset + 26)]
  alpha_range = "#{alpha.first}-#{alpha.last}"
  translation_range = "#{translation.first}-za-#{translation.last}"
  upper_alpha_range = "#{alpha.first.upcase}-#{alpha.last.upcase}"
  upper_translation_range = "#{translation.first.upcase}-ZA-#{translation.last.upcase}"
  string.tr(alpha_range, translation_range).tr(upper_alpha_range, upper_translation_range)
end

def caesar_decode(encoded_string, offset)
  alpha = ('a'..'z')
  translation = alpha.cycle.lazy.take(offset + 26).to_a[offset...(offset + 26)]
  alpha_range = "#{alpha.first}-#{alpha.last}"
  translation_range = "#{translation.first}-za-#{translation.last}"
  upper_alpha_range = "#{alpha.first.upcase}-#{alpha.last.upcase}"
  upper_translation_range = "#{translation.first.upcase}-ZA-#{translation.last.upcase}"
  encoded_string.tr(translation_range, alpha_range).tr(upper_translation_range, upper_alpha_range)
end

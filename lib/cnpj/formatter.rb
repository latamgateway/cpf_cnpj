# frozen_string_literal: true

class CNPJ
  class Formatter
    STRICT_REGEX = %r{[/.-]}.freeze
    LOOSE_REGEX = /[^A-Za-z\d]/.freeze

    def self.format(number)
      stripped = strip(number)
      stripped.gsub(/\A([A-Z\d]{2})([A-Z\d]{3})([A-Z\d]{3})([A-Z\d]{4})(\d{2})\Z/i, "\\1.\\2.\\3/\\4-\\5")
    end

    def self.strip(number, strict = false)
      number.to_s.gsub(strict ? STRICT_REGEX : /[^A-Za-z\d]/, "")
    end
  end
end

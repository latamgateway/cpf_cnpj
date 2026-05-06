# frozen_string_literal: true

class CNPJ
  class VerifierDigit
    ASCII_BASE = "0".ord

    # Accepts an array of characters (strings) or integers.
    # For alphanumeric CNPJ, each character's value is (char.ord - 48).
    def self.generate(chars)
      values = chars.map do |c|
        c.is_a?(Integer) ? c : (c.ord - ASCII_BASE)
      end

      index = 2

      sum = values.reverse.reduce(0) do |buffer, value|
        (buffer + (value * index)).tap do
          index = index == 9 ? 2 : index + 1
        end
      end

      mod = sum % 11
      mod < 2 ? 0 : 11 - mod
    end
  end
end

# frozen_string_literal: true

class CNPJ
  require "cpf_cnpj"
  require "cnpj/formatter"
  require "cnpj/verifier_digit"

  attr_reader :number, :strict

  # Formatted: XX.XXX.XXX/XXXX-DD (X = alphanumeric, D = digit)
  REGEX = %r[\A[A-Z\d]{2}\.[A-Z\d]{3}\.[A-Z\d]{3}/[A-Z\d]{4}-\d{2}\Z]i.freeze
  # Stripped: 12 alphanumeric chars + 2 numeric digits
  VALIDATION_SIZE_REGEX = /\A[A-Z\d]{12}\d{2}\Z/i.freeze
  NUMBER_SIZE = 12

  BLACKLIST = %w[
    00000000000000
    11111111111111
    22222222222222
    33333333333333
    44444444444444
    55555555555555
    66666666666666
    77777777777777
    88888888888888
    99999999999999
  ].freeze

  def self.valid?(number, strict: false)
    new(number, strict).valid?
  end

  def self.generate(formatted = false)
    number = CpfCnpj::Generator.generate(NUMBER_SIZE, VerifierDigit)
    cnpj = new(number)
    formatted ? cnpj.formatted : cnpj.stripped
  end

  def initialize(number, strict = false)
    @number = number.to_s
    @strict = strict
  end

  def number=(number)
    @stripped = nil
    @formatted = nil
    @characters = nil
    @number = number
  end

  def stripped
    @stripped ||= Formatter.strip(number, strict)
  end

  def formatted
    @formatted ||= Formatter.format(number)
  end

  def valid?
    normalized = stripped.upcase
    return false unless /\A[A-Z\d]{12}\d{2}\Z/.match?(normalized)
    return false if BLACKLIST.include?(normalized)

    chars = normalized[0...12].each_char.to_a
    dv1 = VerifierDigit.generate(chars)
    chars << dv1.to_s
    dv2 = VerifierDigit.generate(chars)

    "#{dv1}#{dv2}" == normalized[-2, 2]
  end

  def ==(other)
    super || (other.instance_of?(self.class) && other.stripped == stripped)
  end
  alias eql? ==

  private def characters
    @characters ||= stripped.upcase.each_char.to_a
  end
end

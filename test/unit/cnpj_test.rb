# frozen_string_literal: true

require "test_helper"

class CnpjTest < Minitest::Test
  test "blacklists common numbers" do
    refute CNPJ.valid?("00000000000000")
    refute CNPJ.valid?("11111111111111")
    refute CNPJ.valid?("22222222222222")
    refute CNPJ.valid?("33333333333333")
    refute CNPJ.valid?("44444444444444")
    refute CNPJ.valid?("55555555555555")
    refute CNPJ.valid?("66666666666666")
    refute CNPJ.valid?("77777777777777")
    refute CNPJ.valid?("88888888888888")
    refute CNPJ.valid?("99999999999999")
  end

  test "rejects blank strings" do
    refute CNPJ.valid?("")
  end

  test "rejects nil values" do
    refute CNPJ.valid?(nil)
  end

  test "validates formatted strings" do
    number = "54.550.752/0001-55"

    assert CNPJ.valid?(number)
  end

  test "validates unformatted strings" do
    number = "54550752000155"

    assert CNPJ.valid?(number)
  end

  test "validates messed strings" do
    number = "54550[752#0001..$55"

    assert CNPJ.valid?(number)
  end

  test "generates formatted number" do
    assert_match %r[\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}\z], CNPJ.generate(true)
  end

  test "generates stripped number" do
    assert_match(/\A\d{14}\z/, CNPJ.generate)
  end

  test "validates alphanumeric CNPJ formatted" do
    assert CNPJ.valid?("12.ABC.345/01DE-35")
  end

  test "validates alphanumeric CNPJ unformatted" do
    assert CNPJ.valid?("12ABC34501DE35")
  end

  test "validates all-letters CNPJ" do
    assert CNPJ.valid?("ABCDEFGHIJKL80")
  end

  test "validates alphanumeric CNPJ case insensitive" do
    assert CNPJ.valid?("12.abc.345/01de-35")
  end

  test "rejects alphanumeric CNPJ with invalid DV" do
    refute CNPJ.valid?("ABCDEFGHIJKL81")
  end

  test "rejects alphanumeric CNPJ with letter in DV position" do
    refute CNPJ.valid?("0000000000019L")
    refute CNPJ.valid?("000000000001P1")
  end

  test "rejects invalid format strings" do
    refute CNPJ.valid?("aa.bb.ccc/dddd-ee")
  end

  test "rejects invalid format strings (strict)" do
    refute CNPJ.valid?("aa.bb.ccc/dddd-ee", strict: true)
  end

  test "rejects zeroed alphanumeric CNPJ" do
    refute CNPJ.valid?("00.000.000/0000-00")
  end

  test "compare objects by their numeric value" do
    one = CNPJ.new("54550752000155")
    other = CNPJ.new("54550752000155")
    different = CNPJ.new("32228235377")

    assert_equal one, other

    refute_equal one, different
    refute_equal other, different
  end
end

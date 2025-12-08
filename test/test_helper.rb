# frozen_string_literal: true

# SimpleCov should be loaded before any application code
if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/test/"
    add_filter "/vendor/"
  end
end

require "bundler/setup"
Bundler.require

require "minitest/utils"
require "minitest/autorun"

require_relative "support/capture_syscall"

# frozen_string_literal: true

require "timeout"
require "stringio"

module CaptureSyscall
  def capture_syscall
    exit_status = nil

    stdout, stderr = Timeout.timeout(5) do
      capture_subprocess_io do
        yield
        exit_status = $CHILD_STATUS.exitstatus
      end
    end

    [exit_status, stdout, stderr]
  end

  def capture_cli(document_class, arguments)
    stdout = StringIO.new
    stderr = StringIO.new
    stdin = StringIO.new
    # Mock stdin to behave like a TTY
    stdin.define_singleton_method(:tty?) { true }
    exit_status = 0

    begin
      cli = CpfCnpj::CLI.new(document_class, arguments, stdin, stdout, stderr)
      cli.start
    rescue SystemExit => error
      exit_status = error.status
    end

    [exit_status, stdout.string, stderr.string]
  end
end

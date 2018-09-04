Code.load_file("secret_handshake.exs", __DIR__)

defmodule SecretHandshakeTest do
  IO.inspect SecretHandshake.commands(1) #== ["wink"]
  IO.inspect SecretHandshake.commands(2) #== ["double blink"]
  IO.inspect SecretHandshake.commands(4) #== ["close your eyes"]
  IO.inspect SecretHandshake.commands(8) #== ["jump"]
  IO.inspect SecretHandshake.commands(3) #== ["wink", "double blink"]
  IO.inspect SecretHandshake.commands(19) #== ["double blink", "wink"]
  IO.inspect SecretHandshake.commands(24) #== ["jump"]
  IO.inspect SecretHandshake.commands(16) #== []
  IO.inspect SecretHandshake.commands(15) #== ["wink", "double blink", "close your eyes", "jump"]
  IO.inspect SecretHandshake.commands(31) #== ["jump", "close your eyes", "double blink", "wink"]
  IO.inspect SecretHandshake.commands(0) #== []
  IO.inspect SecretHandshake.commands(32) #== []
end

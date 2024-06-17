require 'js'

input = JS.global[:document].getElementById("input")
run = JS.global[:document].getElementById("run")
output = JS.global[:document].getElementById("output")

run.addEventListener("click") do |_event|
  user_code = input[:value].to_s
  output[:value] = eval(user_code)
end

run[:disabled] = false

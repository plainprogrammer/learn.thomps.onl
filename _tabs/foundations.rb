require 'js'

fieldsets = JS.global[:document].querySelectorAll("fieldset.code")

fieldsets.forEach do |fieldset_element|
  input = fieldset_element.querySelector("input.input")
  run = fieldset_element.querySelector("button.run")
  output = fieldset_element.querySelector("input.output")

  run.addEventListener("click") do |_event|
    user_code = input[:value].to_s
    output[:value] = eval(user_code)
  end

  run[:disabled] = false
end

BootstrapFormBuilder.setup do |config|
  # The error messages partial to render with the form
  config.error_partial = "bootstrap_form_builder/error_messages"

  # The default class to give generated forms.
  # The different types can be found here: http://twitter.github.com/bootstrap/base-css.html#forms
  config.default_form_layout = "form-horizontal"
end
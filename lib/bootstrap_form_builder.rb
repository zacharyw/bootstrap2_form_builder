require 'rails'
require 'bootstrap_form_builder/form_builder'

module BootstrapFormBuilder
  mattr_reader :error_partial
  mattr_writer :error_partial
  @@error_partial = nil

  mattr_reader :default_form_layout
  mattr_writer :default_form_layout
  @@default_form_layout = nil


  def self.setup
    yield self
  end

  module BootstrapFormHelper
    def bootstrap_form_for(name, *args, &block)
      options = args.extract_options!

      target = name
      if target.kind_of?(Array)
        target = name[1]
      end

      #Default form class to form-horizontal.
      form_html = {:html => {:class => BootstrapFormBuilder.default_form_layout}}

      #Work our default class back into the form options. Defer to whatever is passed in if present

      options.merge!(form_html) do |html_key, passed_in_html, default_html|
        passed_in_html.merge(default_html) do |key, oldval, newval|
          oldval
        end
      end

      partial_location = BootstrapFormBuilder.error_partial || "bootstrap_form_builder/error_messages"

      render(partial_location, :target => target) + form_for(name, *(args << options.merge(:builder => BootstrapFormBuilder::FormBuilder)), &block)
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include BootstrapFormBuilder::BootstrapFormHelper
end
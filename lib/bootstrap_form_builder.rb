require 'bootstrap_form_builder/form_builder'

module BootstrapFormBuilder
  mattr_reader :error_partial
  @@error_partial = nil

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

      partial_location = BootstrapFormBuilder.error_partial || "bootstrap_form_builder/error_messages"

      render(partial_location, :target => target) + form_for(name, *(args << options.merge(:builder => BootstrapFormBuilder::FormBuilder)), &block)
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include BootstrapFormBuilder::BootstrapFormHelper
end
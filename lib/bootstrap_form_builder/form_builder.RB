class FormBuilder < ActionView::Helpers::FormBuilder
	#Replace form submit input with styled buttons
	def submit(label, *args)
		options = args.extract_options!
		new_class = options[:class] || "btn btn-primary"
		@template.content_tag("div",
		  super(label, *(args << options.merge(:class => new_class))), :class => "form-actions")
	end

=begin
Generates form fields that work with Twitter Bootstrap. Automatically marks required things as required and places errors
on matching inputs.
=end
	def self.create_tagged_field(method_name)
		define_method(method_name) do |label, *args|
			options = args.extract_options!

			custom_label = options[:label] || label.to_s.humanize
			label_class = options[:label_class] || "control-label"

			if @object.class.validators_on(label).collect(&:class).include? ActiveModel::Validations::PresenceValidator
				if label_class.nil?
					label_class = "required"
				else
					label_class = label_class + " required"
				end
      end

      control_group_class = "control-group"
      if @object.errors.messages[label]
        control_group_class = control_group_class + " error"
      end

      @template.content_tag("div",
		@template.content_tag("label",
								custom_label,
								:for => "#{@object_name}_#{label}", 
								:class => label_class)  +
			@template.content_tag("div", 
									super(label, *(args << options)) + @template.content_tag("p", options[:help_inline], :class => "help-block"), 
									:class => "controls"), 
									:class => control_group_class)
		end
	end

	field_helpers.each do |name|
		create_tagged_field(name)
	end
end

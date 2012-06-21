module BootstrapFormHelper
	def bootstrap_form_for(name, *args, &block)
		options = args.extract_options!

		target = name
		if target.kind_of?(Array)
		  target = name[1]
		end

		content_tag("div",
			render("bootstrap_form_builder/error_messages", :target => target) +
			form_for(name, *(args << options.merge(:builder => StandardFormBuilder)), &block),
			:class => "form-horizontal")
	end
end

module BootstrapFormBuilder
	ActionView::Base.send :include, BootstrapFormHelper
end
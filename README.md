# Bootstrap2FormBuilder

## Install

After bundling the gem run 

```console
rails g bootstrap2_form_builder:install
```

This will create a partial called error_messages that will contain formatted errors on the object the form is for. This
generator also takes an option to use HAML (it uses erb by default):

```console
rails g bootstrap2_form_builder:install -t haml
```

## Usage

Lets say you have a Person model with required attributes name and email, and an optional attribute of website.
In your persons_controller in the new action you would set a variable @person = Person.new, which would be handed off
to your view.

In your view, call bootstrap_form_for just like you would a regular form_for, except leave out labels and most other
typical markup.

For exmaple:

```ruby
<%= bootstrap_form_for @person do |form| %>
	<%= form.text_field :name %>
	<%= form.text_field :email %>
	<%= form.text_field :website %>
<% end %>
```

This will generate HTML like this:

```html
<form accept-charset="UTF-8" action="/people" class="new_person" id="new_person" method="post">
<div style="margin:0;padding:0;display:inline">
<input name="utf8" type="hidden" value="✓">
<input name="authenticity_token" type="hidden" value="Edx7gjTOLinEOXqab7LweFhWlJh5uO6Js2l6exeCrwA="></div>
	<div class="control-group">
	    <label class="control-label required" for="person_name">Name</label>
	    <div class="controls">
	        <input id="person_name" name="person[name]" size="30" type="text">
        </div>
    </div>
	<div class="control-group">
	    <label class="control-label required" for="person_email">Email</label>
	    <div class="controls">
	        <input id="person_email" name="person[email]" size="30" type="text">
        </div>
    </div>
	<div class="control-group">
	    <label class="control-label" for="person_website">Website</label>
	    <div class="controls">
	        <input id="person_website" name="person[website]" size="30" type="text">
        </div>
    </div>
```

See how it automatically generates labels for your inputs? It also marks them as required if there is a
presence validator for that attribute on the model.

It also adds some options to all of the form helpers (form.text_field, form.text_area, etc)

* :label - Lets you define a custom label
* :label_class - Lets you define a custom class for your clabel
* :help_block - A block of text that should appear below your input
* :help_inline - A line of text that should appear next to your input

For example:

```ruby
<%= form.text_field :name, :label => "Nickname", :label_class => "important", 
:help_block => "What do your friends call you?" %>
```

##Configuration

When you run the install generator it will create an initializer at config/initializers/bootstrap2_form_builder.rb

Here you can customize certain aspects of the form builder. Check the generated file for the most up to date documentation
and exmaple options.

## About

This gem adds a helper to all of your views called bootstrap_form_for, which generates a form for a given model object
and fields with HTML and CSS markup that works with the [Twitter bootstrap](http://twitter.github.com/bootstrap/)  
library.

This project uses MIT-LICENSE.
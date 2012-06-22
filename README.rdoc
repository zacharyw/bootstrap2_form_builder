= BootstrapFormBuilder

== Install

After bundling the gem run <tt>rails g bootstrap_form_builder:install</tt>

This will create a partial called error_messages that will contain formatted errors on the object the form is for. This
generator also takes an option to use HAML (it uses erb by default):

<tt>rails g bootstrap_form_builder:install -t haml</tt>

== Usage

Lets say you have a Person model with required attributes name and email, and an optional attribute of website.
In your persons_controller in the new action you would set a variable @person = Person.new, which would be handed off
to your view.

In your view, call bootstrap_form_for just like you would a regular form_for, except leave out labels and most other
typical markup.

For exmaple:

<tt>
<%= bootstrap_form_for @person do |form| %>
	<%= form.text_field :name %>
	<%= form.text_field :email %>
	<%= form.text_field :website %>
<% end %>
</tt>

This will generate HTML like this:

<form accept-charset="UTF-8" action="/people" class="new_person" id="new_person" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="Edx7gjTOLinEOXqab7LweFhWlJh5uO6Js2l6exeCrwA="></div>
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
</form>

See how it automatically generates labels for your inputs? It also marks them as required if there is a
presence validator for that attribute on the model.

It also adds some options to all of the form helpers (form.text_field, form.text_area, etc)

<tt>:label</tt> Lets you define a custom label
<tt>:label_class</tt> Lets you define a custom class for your clabel
<tt>:help_block</tt> A block of text that should appear below your input

For example:

<%= form.text_field :name, :label => "Nickname", :label_class => "important", :help_block => "What do your friends call you?" %>

== About

This gem adds a helper to all of your views called bootstrap_form_for, which generates a form for a given model object
and fields with HTML and CSS markup that works with the twitter bootstrap library.

This project uses MIT-LICENSE.
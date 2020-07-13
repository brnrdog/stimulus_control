# StimulusControl

Rails form validations powered by Stimulus controllers.

## Usage

Use `stimulus_form_with` helper to build form in your Rails views:

```erb
<%= stimulus_form_with url: '/register' do |form| %>
  <%= form.text_field :name, "", label: "Name", required: true, min_length: 2 %>
  <%= form.email_field :email, "", label: "Email", required: true, pattern: "^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$" %>
  <%= form.password_field :password, "", label: "Password", required: true, min_length: 4 %>
  <%= form.text_area_field :bio, "", label: "Bio", max_length: 250 %>
  <%= form.submit %>
<% end %>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stimulus_control'
```

### Webpack

Soon.

### Rails asset pipeline

Run the following to add stimulus control javascript files into your application:

```sh
rails generate stimulus_control:install
```

Add stimulus_control to your javascript manifest file:

```js
//= require stimulus_control
```

Setup Stimulus Control controllers for you Stimulus application:

```js
const application = Stimulus.Application.start();
application.register("StimulusControlForm", StimulusControl.FormController);
application.register("StimulusControlField", StimulusControl.FieldController);
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

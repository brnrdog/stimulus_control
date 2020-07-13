# StimulusControl

Short description and motivation.

## Usage

How to use my plugin.

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

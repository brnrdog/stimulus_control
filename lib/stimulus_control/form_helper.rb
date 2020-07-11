require "stimulus_control/form_builder"

module StimulusControl
  module FormHelper 
    include ActionView::Helpers::FormHelper

    def stimulus_form_with(**options, &block)
      options[:builder]           ||= StimulusControl::FormBuilder
      options[:data]              ||= {}
      options[:class]             ||= form_class
      options[:data][:controller] ||= data_controller

      form_with(**options, &block)
    end

    private

    def data_controller
      { controller: "stimulus-control" }
    end

    def form_class
      "stimulus-control-form"
    end
  end
end


ActiveSupport.on_load(:action_view) do
  include StimulusControl::FormHelper
end
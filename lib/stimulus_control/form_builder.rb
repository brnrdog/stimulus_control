module StimulusControl
  class FormBuilder < ActionView::Helpers::FormBuilder
    def text_field(object_name, method, options = {}, &block)
      field_tag(:text_field_tag, object_name, method, options, &block)
    end
  
    def password_field(object_name, method, options = {}, &block)
      field_tag(:password_field_tag, object_name, method, options, &block)
    end
  
    def text_area_field(object_name, method, options = {}, &block)
      field_tag(:text_area_tag, object_name, method, options, &block)
    end
  
    private
  
    def label_tag(label)
      @template.label_tag(label, nil, class: "block mb-2 font-semibold text-sm", data: { target: "field.label" })
    end
  
    def field_tag(method_name, object_name, method, options, &block)
      label = options[:label] || method.capitalize
  
      @template.content_tag(:div, 
        label_tag(label)+@template.public_send(method_name, 
          object_name, 
          method,
          data: { 
            action: 'input->field#touch input->field#resetValidation blur->field#validate',
            target: 'field.input',
            min_length: options[:min_length],
            max_length: options[:max_length],
            pattern: options[:pattern],
            required: options[:required]
          },
          class: "px-2 py-1 text-sm block outline-none focus:outline-none focus:shadow-outline border border-gray-600",
          &block)+@template.content_tag(
            "div", 
            nil, 
            data: {
              target: 'field.error'
            },
            class: 'text-sm text-red-600 mb-4'
          ),
        data: {
          controller: 'field',
          i18n: I18n.t("sform").to_json.camelize(:lower)
        }
      )
    end
  end
end
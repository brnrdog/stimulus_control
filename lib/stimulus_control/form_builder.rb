module StimulusControl
  class FormBuilder < ActionView::Helpers::FormBuilder

    @@label_class = "label"
    @@field_class = "field"
    @@error_class = "error"


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
      @template.label_tag(label, nil, class: @@label_class, data: { target: "field.label" })
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
          class: @@field_class,
          &block)+@template.content_tag(
            "div", 
            nil, 
            data: {
              target: 'field.error'
            },
            class: @@error_class
          ),
        data: {
          controller: 'field',
        }
      )
    end
  end
end
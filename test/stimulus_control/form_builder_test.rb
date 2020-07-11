require 'test_helper'

class StimulusControl::FormBuilderTest < ActionView::TestCase
  include StimulusControl::FormHelper
  
  test "text_field" do
    result = ""
    stimulus_form_with url: '/' do |f| 
      result = f.text_field :email, ""
    end

    expected = %{<div data-controller=\"field\"><label class=\"label\" data-target=\"field.label\"></label><input type=\"text\" name=\"email\" id=\"email\" value=\"\" data-action=\"input-&gt;field#touch input-&gt;field#resetValidation blur-&gt;field#validate\" data-target=\"field.input\" class=\"field\" /><div data-target=\"field.error\" class=\"error\"></div></div>}
    
    assert_equal expected, result
  end

  test "password_field" do
    result = ""
    stimulus_form_with url: '/' do |f| 
      result = f.password_field :password, ""
    end

    expected = %{<div data-controller=\"field\"><label class=\"label\" data-target=\"field.label\"></label><input type=\"password\" name=\"password\" id=\"password\" value=\"\" data-action=\"input-&gt;field#touch input-&gt;field#resetValidation blur-&gt;field#validate\" data-target=\"field.input\" class=\"field\" /><div data-target=\"field.error\" class=\"error\"></div></div>}

    assert_equal expected, result
  end

  test "text_area_field" do
    result = ""
    stimulus_form_with url: '/' do |f| 
      result = f.text_area_field :textarea, ""
    end

    expected = %{<div data-controller="field"><label class="label" data-target="field.label"></label><textarea name="textarea" id="textarea" data-action="input-&gt;field#touch input-&gt;field#resetValidation blur-&gt;field#validate" data-target="field.input" class="field">\n</textarea><div data-target="field.error" class="error"></div></div>}

    assert_equal expected, result
  end
end
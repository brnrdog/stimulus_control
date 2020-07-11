require 'test_helper'

class StimulusControl::FormHelperTest < ActionView::TestCase
  include StimulusControl::FormHelper
  tests ActionView::Helpers::FormHelper

  test "stimulus_form_with(url: '/')" do
    result = stimulus_form_with url: '/' do |f| 
    end
    expected = %{<form class="stimulus-control-form" data-controller="{&quot;controller&quot;:&quot;stimulus-control&quot;}" action="/" accept-charset="UTF-8" data-remote="true" method="post"></form>}
    
    assert_dom_equal(expected, result)
  end

  test "stimulus_form_with(url: '/', class: 'custom-class')" do
    result = stimulus_form_with url: '/', class: 'custom-class' do |f| 
    end
    expected = %{<form class="custom-class" data-controller="{&quot;controller&quot;:&quot;stimulus-control&quot;}" action="/" accept-charset="UTF-8" data-remote="true" method="post"></form>}
    
    assert_dom_equal(expected, result)
  end

  test "stimulus_form_with(url: '/', data: { controller: 'custom-controller' })" do
    result = stimulus_form_with url: '/', data: { controller: 'custom-controller' }do |f| 
    end
    expected = %{<form class="stimulus-control-form" data-controller="custom-controller" action="/" accept-charset="UTF-8" data-remote="true" method="post"></form>}
    
    assert_dom_equal(expected, result)
  end
end

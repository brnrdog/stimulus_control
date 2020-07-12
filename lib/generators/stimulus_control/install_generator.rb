module StimulusControl
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creating StimulusControl assets files..."
      source_root File.expand_path('../templates', __FILE__)

      def copy_assets
        copy_file "stimulus_control.js", "vendor/assets/javascript/stimulus_control.js"
      end
    end
  end
end
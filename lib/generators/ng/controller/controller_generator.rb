module Ng
  class ControllerGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)
    
    argument :dependencies, type: :array, default: []
    
    def variables
      @class_name = name.classify
      @file_name = name.underscore
      @deps = dependencies.unshift("$scope")
    end
    
    def create_controller
      template "controller.js.erb", "app/angular/controllers/#{@file_name}_controller.js"
    end
    
  end
end
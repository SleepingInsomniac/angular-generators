module Ng
  class ModelGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)
    
    argument :dependencies, type: :array, default: []
    
    def variables
      @class_name = name.classify
      @file_name = name.underscore
      @deps = dependencies.unshift("$resource")
      @url = Rails.application.routes.url_helpers.send("#{name.underscore.pluralize}_path")
    end
    
    def create_controller
      template "model.js.erb", "app/angular/models/#{@file_name}.js"
    end
    
  end
end

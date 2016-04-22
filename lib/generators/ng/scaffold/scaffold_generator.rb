require_relative '../model/model_generator'
require_relative '../controller/controller_generator'

module Ng
  class ScaffoldGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)
    
    def model
      invoke ModelGenerator, [name]
      invoke ControllerGenerator, [name, name.classify]
    end
  end
end
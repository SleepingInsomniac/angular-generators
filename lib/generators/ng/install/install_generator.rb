module Ng
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    class_option :description, default: "An angular app"
    class_option :author, default: `git config user.name`.chomp
    
    class_option :npm, type: :boolean, default: true
    
    def vars
      @name        = Rails.application.class.parent_name.camelize
      @dir_name    = @name.underscore
      @title_name  = @name.titleize
      @description = options[:description]
      @author      = options[:author]
    end

    def structure
      empty_directory "./app/angular/models"
      empty_directory "./app/angular/directives"
      empty_directory "./app/angular/controllers"
      empty_directory "./app/angular/config"
    end
    
    def npm
      template "package.json.erb", "package.json"
      run 'npm i' if options[:npm]
    end
    
    def files
      template "index.html.erb", "public/index.html"
      template "app_config.js.erb", "app/angular/config/app_config.js"
      template "routes.js.erb", "app/angular/config/routes.js"
      template "app_controller.js.erb", "app/angular/controllers/app_controller.js"
  
      template "gulpfile.js.erb", "gulpfile.js"
      template "gulp.yml.erb", "config/gulp.yml"
      directory "gulp_tasks", "gulp_tasks"
      copy_file "babelrc", ".babelrc"
      copy_file "eslintrc", ".eslintrc"
  
      template "manifest.scss.erb", "app/assets/styles/manifest.scss"
      template "global.scss.erb", "app/assets/styles/_global.scss"
      create_file "app/assets/styles/_#{@dir_name}.scss"
    end

    private
    
    def name
      Rails.application.class.parent_name
    end
    
  end
end

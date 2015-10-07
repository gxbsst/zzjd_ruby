# encoding: utf-8
module RailsAdmin
  module Config
    module Actions
      class  PublishProductionOrder < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:object].class == Productions::ProductionOrder
        end
        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'icon-eye-open'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          # true
          false
        end

        register_instance_option :controller do
          Proc.new do
            # Note: This is dummy code. The thing to note is that we aren't
            # rendering a view, just redirecting after taking an action on @object, which
            # will be the user instance in this case.
            @object.action_start
            flash[:notice] = "发布成功"
            # redirect_to back_or_index
          end
        end
      end
    end
  end
end

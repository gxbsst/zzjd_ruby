# encoding: utf-8
require 'i18n'
#I18n.default_locale = 'zh-CN'

require Rails.root.join('lib', 'rails_admin', 'publish_production_order.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::PublishProductionOrder)


RailsAdmin.config do |config|
  config.excluded_models << "Location"
  config.main_app_name = %w(郑州机器人)

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    # show
    edit
    delete
    publish_production_order

    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    config.model 'Productions::ProductionOrder' do
      list do
       field :name
        field :product do
          searchable :name
        end
        field :status
      end
      edit do
        field :name do
          label "名称"
        end
        field :production_no do
          label "生产编号"
        end
        field :product do
          label "产品"
        end
        field :status do
          label "编号"
        end
        field :orders do
          label "工单"
        end
        field :one_tcs_order do
          label "AGV 调拨单"
        end
        field :logistics_chains
        field :transport_orders
      end
    end
  end
end

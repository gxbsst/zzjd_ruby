# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151009150402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_config_settings", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.boolean  "module_google_drive"
    t.boolean  "module_base_import"
    t.integer  "write_uid"
    t.boolean  "module_portal"
    t.boolean  "module_google_calendar"
    t.datetime "write_date"
    t.boolean  "module_share"
    t.integer  "font"
    t.boolean  "module_auth_oauth"
    t.boolean  "module_multi_company"
  end

  create_table "base_import_import", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.string   "file_type",   limit: 255
    t.string   "file_name",   limit: 255
    t.integer  "write_uid"
    t.binary   "file"
    t.string   "res_model",   limit: 255
  end

  create_table "base_import_tests_models_char", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_noreadonly", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_readonly", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_required", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_states", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_stillreadonly", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_m2o", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_m2o_related", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_m2o_required", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "value",       null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_m2o_required_related", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_o2m", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_o2m_child", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "value"
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_preview", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "othervalue"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "somevalue",               null: false
  end

  create_table "base_language_export", force: :cascade do |t|
    t.string   "lang",        limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.string   "format",      limit: 255, null: false
    t.integer  "write_uid"
    t.string   "state",       limit: 255
    t.datetime "write_date"
    t.binary   "data"
  end

  create_table "base_language_import", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 5,   null: false
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.binary   "data",                    null: false
    t.boolean  "overwrite"
  end

  create_table "base_language_install", force: :cascade do |t|
    t.string   "lang",        limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "state",       limit: 255
    t.datetime "write_date"
    t.boolean  "overwrite"
  end

  create_table "base_module_configuration", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "base_module_update", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "updated"
    t.integer  "added"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "state",       limit: 255
    t.datetime "write_date"
  end

  create_table "base_module_upgrade", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.text     "module_info"
  end

  create_table "base_setup_terminology", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "partner",     limit: 255, null: false
  end

  create_table "base_update_translations", force: :cascade do |t|
    t.string   "lang",        limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "board_create", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",           limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "menu_parent_id",             null: false
  end

  create_table "bus_bus", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "message",     limit: 255
    t.string   "channel",     limit: 255
  end

  create_table "change_password_user", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "user_login",  limit: 255
    t.string   "new_passwd",  limit: 255
    t.integer  "wizard_id",               null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "user_id",                 null: false
  end

  create_table "change_password_wizard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "decimal_precision", force: :cascade do |t|
    t.integer  "digits",                  null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "decimal_precision", ["name"], name: "decimal_precision_name_index", using: :btree
  add_index "decimal_precision", ["name"], name: "decimal_precision_name_uniq", unique: true, using: :btree

  create_table "decimal_precision_test", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.decimal  "float_2"
    t.float    "float"
    t.decimal  "float_4"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "ir_act_client", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage",        limit: 255
    t.string   "type",         limit: 255, null: false
    t.string   "name",         limit: 255, null: false
    t.string   "res_model",    limit: 255
    t.binary   "params_store"
    t.string   "tag",          limit: 255, null: false
    t.string   "context",      limit: 255, null: false
  end

  create_table "ir_act_report_xml", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage",                   limit: 255
    t.string   "type",                    limit: 255, null: false
    t.string   "name",                    limit: 255, null: false
    t.string   "parser",                  limit: 255
    t.boolean  "header"
    t.string   "report_type",             limit: 255, null: false
    t.string   "attachment",              limit: 255
    t.binary   "report_sxw_content_data"
    t.string   "report_xml",              limit: 255
    t.binary   "report_rml_content_data"
    t.boolean  "auto"
    t.string   "report_file",             limit: 255
    t.boolean  "multi"
    t.string   "report_xsl",              limit: 255
    t.string   "report_rml",              limit: 255
    t.string   "report_name",             limit: 255, null: false
    t.boolean  "attachment_use"
    t.string   "model",                   limit: 255, null: false
    t.integer  "paperformat_id"
  end

  create_table "ir_act_server", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage",                  limit: 255
    t.string   "type",                   limit: 255, null: false
    t.string   "name",                   limit: 255, null: false
    t.text     "code"
    t.integer  "sequence"
    t.integer  "crud_model_id"
    t.string   "condition",              limit: 255
    t.string   "ref_object",             limit: 128
    t.string   "id_object",              limit: 128
    t.string   "crud_model_name",        limit: 255
    t.string   "use_relational_model",   limit: 255, null: false
    t.string   "use_create",             limit: 255, null: false
    t.integer  "wkf_field_id"
    t.integer  "wkf_model_id"
    t.string   "state",                  limit: 255, null: false
    t.string   "id_value",               limit: 255
    t.integer  "action_id"
    t.integer  "model_id",                           null: false
    t.integer  "sub_model_object_field"
    t.boolean  "link_new_record"
    t.integer  "wkf_transition_id"
    t.integer  "sub_object"
    t.string   "use_write",              limit: 255, null: false
    t.string   "wkf_model_name",         limit: 255
    t.string   "copyvalue",              limit: 255
    t.string   "write_expression",       limit: 255
    t.integer  "menu_ir_values_id"
    t.integer  "model_object_field"
    t.integer  "link_field_id"
  end

  create_table "ir_act_url", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage",       limit: 255
    t.string   "type",        limit: 255, null: false
    t.string   "name",        limit: 255, null: false
    t.string   "target",      limit: 255, null: false
    t.text     "url",                     null: false
  end

  create_table "ir_act_window", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage",          limit: 255
    t.string   "type",           limit: 255, null: false
    t.string   "name",           limit: 255, null: false
    t.string   "domain",         limit: 255
    t.string   "res_model",      limit: 255, null: false
    t.integer  "search_view_id"
    t.string   "view_type",      limit: 255, null: false
    t.string   "src_model",      limit: 255
    t.integer  "view_id"
    t.integer  "auto_refresh"
    t.string   "view_mode",      limit: 255, null: false
    t.boolean  "multi"
    t.string   "target",         limit: 255
    t.boolean  "auto_search"
    t.integer  "res_id"
    t.boolean  "filter"
    t.integer  "limit"
    t.string   "context",        limit: 255, null: false
  end

  create_table "ir_act_window_group_rel", id: false, force: :cascade do |t|
    t.integer "act_id", null: false
    t.integer "gid",    null: false
  end

  add_index "ir_act_window_group_rel", ["act_id", "gid"], name: "ir_act_window_group_rel_act_id_gid_key", unique: true, using: :btree
  add_index "ir_act_window_group_rel", ["act_id"], name: "ir_act_window_group_rel_act_id_index", using: :btree
  add_index "ir_act_window_group_rel", ["gid"], name: "ir_act_window_group_rel_gid_index", using: :btree

  create_table "ir_act_window_view", force: :cascade do |t|
    t.integer  "create_uid"
    t.boolean  "multi"
    t.datetime "create_date"
    t.integer  "sequence"
    t.integer  "view_id"
    t.integer  "write_uid"
    t.string   "view_mode",     limit: 255, null: false
    t.datetime "write_date"
    t.integer  "act_window_id"
  end

  add_index "ir_act_window_view", ["act_window_id", "view_mode"], name: "act_window_view_unique_mode_per_action", unique: true, using: :btree

  create_table "ir_actions", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage",       limit: 255
    t.string   "type",        limit: 255, null: false
    t.string   "name",        limit: 255, null: false
  end

  create_table "ir_actions_todo", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "sequence"
    t.integer  "write_uid"
    t.text     "note"
    t.string   "state",       limit: 255, null: false
    t.datetime "write_date"
    t.string   "type",        limit: 255, null: false
    t.integer  "action_id",               null: false
  end

  add_index "ir_actions_todo", ["action_id"], name: "ir_actions_todo_action_id_index", using: :btree

  create_table "ir_attachment", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "description"
    t.string   "url",         limit: 1024
    t.string   "res_model",   limit: 255
    t.integer  "file_size"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.string   "res_name",    limit: 255
    t.binary   "db_datas"
    t.string   "datas_fname", limit: 255
    t.datetime "write_date"
    t.string   "type",        limit: 255,  null: false
    t.integer  "res_id"
    t.string   "store_fname", limit: 255
    t.string   "name",        limit: 255,  null: false
  end

  add_index "ir_attachment", ["res_model", "res_id"], name: "ir_attachment_res_idx", using: :btree

  create_table "ir_config_parameter", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.text     "value",                   null: false
    t.integer  "write_uid"
    t.string   "key",         limit: 255, null: false
  end

  add_index "ir_config_parameter", ["key"], name: "ir_config_parameter_key_index", using: :btree
  add_index "ir_config_parameter", ["key"], name: "ir_config_parameter_key_uniq", unique: true, using: :btree

  create_table "ir_config_parameter_groups_rel", id: false, force: :cascade do |t|
    t.integer "icp_id",   null: false
    t.integer "group_id", null: false
  end

  add_index "ir_config_parameter_groups_rel", ["group_id"], name: "ir_config_parameter_groups_rel_group_id_index", using: :btree
  add_index "ir_config_parameter_groups_rel", ["icp_id", "group_id"], name: "ir_config_parameter_groups_rel_icp_id_group_id_key", unique: true, using: :btree
  add_index "ir_config_parameter_groups_rel", ["icp_id"], name: "ir_config_parameter_groups_rel_icp_id_index", using: :btree

  create_table "ir_cron", force: :cascade do |t|
    t.string   "function",        limit: 255
    t.integer  "create_uid"
    t.text     "args"
    t.integer  "user_id",                     null: false
    t.string   "name",            limit: 255, null: false
    t.string   "interval_type",   limit: 255
    t.integer  "numbercall"
    t.datetime "nextcall",                    null: false
    t.integer  "priority"
    t.string   "model",           limit: 255
    t.boolean  "doall"
    t.datetime "write_date"
    t.boolean  "active"
    t.datetime "create_date"
    t.integer  "interval_number"
    t.integer  "write_uid"
  end

  create_table "ir_default", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "uid"
    t.string   "ref_table",   limit: 255
    t.integer  "company_id"
    t.string   "value",       limit: 255
    t.integer  "ref_id"
    t.datetime "write_date"
    t.string   "field_tbl",   limit: 255
    t.integer  "write_uid"
    t.string   "field_name",  limit: 255
    t.string   "page",        limit: 255
  end

  create_table "ir_exports", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "resource",    limit: 255
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "create_date"
  end

  add_index "ir_exports", ["resource"], name: "ir_exports_resource_index", using: :btree

  create_table "ir_exports_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "export_id"
  end

  add_index "ir_exports_line", ["export_id"], name: "ir_exports_line_export_id_index", using: :btree

  create_table "ir_fields_converter", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "ir_filters", force: :cascade do |t|
    t.string   "model_id",    limit: 255, null: false
    t.text     "domain",                  null: false
    t.integer  "user_id"
    t.string   "name",        limit: 255, null: false
    t.integer  "create_uid"
    t.integer  "write_uid"
    t.boolean  "is_default"
    t.text     "context",                 null: false
    t.datetime "write_date"
    t.datetime "create_date"
    t.integer  "action_id"
  end

  add_index "ir_filters", ["model_id"], name: "ir_filters_name_model_uid_unique_action_index", unique: true, using: :btree
  add_index "ir_filters", ["name", "model_id", "user_id", "action_id"], name: "ir_filters_name_model_uid_unique", unique: true, using: :btree

  create_table "ir_logging", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.string   "level",       limit: 255
    t.string   "line",        limit: 255, null: false
    t.string   "dbname",      limit: 255
    t.integer  "write_uid"
    t.string   "func",        limit: 255, null: false
    t.datetime "write_date"
    t.string   "path",        limit: 255, null: false
    t.text     "message",                 null: false
    t.string   "type",        limit: 255, null: false
  end

  add_index "ir_logging", ["dbname"], name: "ir_logging_dbname_index", using: :btree
  add_index "ir_logging", ["level"], name: "ir_logging_level_index", using: :btree
  add_index "ir_logging", ["type"], name: "ir_logging_type_index", using: :btree

  create_table "ir_mail_server", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "smtp_encryption", limit: 255, null: false
    t.datetime "create_date"
    t.string   "name",            limit: 255, null: false
    t.integer  "sequence"
    t.integer  "smtp_port",                   null: false
    t.string   "smtp_host",       limit: 255, null: false
    t.integer  "write_uid"
    t.string   "smtp_pass",       limit: 64
    t.boolean  "smtp_debug"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "smtp_user",       limit: 64
  end

  add_index "ir_mail_server", ["name"], name: "ir_mail_server_name_index", using: :btree

  create_table "ir_model", force: :cascade do |t|
    t.string   "model",       limit: 255, null: false
    t.string   "name",        limit: 255, null: false
    t.string   "state",       limit: 255
    t.text     "info"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "ir_model", ["model"], name: "ir_model_model_index", using: :btree
  add_index "ir_model", ["model"], name: "ir_model_obj_name_uniq", unique: true, using: :btree

  create_table "ir_model_access", force: :cascade do |t|
    t.integer  "model_id",                null: false
    t.boolean  "perm_read"
    t.string   "name",        limit: 255, null: false
    t.integer  "create_uid"
    t.integer  "write_uid"
    t.boolean  "active"
    t.datetime "write_date"
    t.boolean  "perm_unlink"
    t.boolean  "perm_write"
    t.datetime "create_date"
    t.boolean  "perm_create"
    t.integer  "group_id"
  end

  add_index "ir_model_access", ["group_id"], name: "ir_model_access_group_id_index", using: :btree
  add_index "ir_model_access", ["model_id"], name: "ir_model_access_model_id_index", using: :btree
  add_index "ir_model_access", ["name"], name: "ir_model_access_name_index", using: :btree

  create_table "ir_model_constraint", force: :cascade do |t|
    t.datetime "date_init"
    t.datetime "date_update"
    t.integer  "module",                  null: false
    t.integer  "model",                   null: false
    t.string   "type",        limit: 1,   null: false
    t.string   "name",        limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "ir_model_constraint", ["model"], name: "ir_model_constraint_model_index", using: :btree
  add_index "ir_model_constraint", ["module"], name: "ir_model_constraint_module_index", using: :btree
  add_index "ir_model_constraint", ["name", "module"], name: "ir_model_constraint_module_name_uniq", unique: true, using: :btree
  add_index "ir_model_constraint", ["name"], name: "ir_model_constraint_name_index", using: :btree
  add_index "ir_model_constraint", ["type"], name: "ir_model_constraint_type_index", using: :btree

  create_table "ir_model_data", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.boolean  "noupdate"
    t.string   "name",        limit: 255, null: false
    t.datetime "date_init"
    t.datetime "date_update"
    t.string   "module",      limit: 255, null: false
    t.string   "model",       limit: 255, null: false
    t.integer  "res_id"
  end

  add_index "ir_model_data", ["model"], name: "ir_model_data_model_index", using: :btree
  add_index "ir_model_data", ["module", "name"], name: "ir_model_data_module_name_index", using: :btree
  add_index "ir_model_data", ["module"], name: "ir_model_data_module_index", using: :btree
  add_index "ir_model_data", ["name", "module"], name: "ir_model_data_module_name_uniq", unique: true, using: :btree
  add_index "ir_model_data", ["name"], name: "ir_model_data_name_index", using: :btree
  add_index "ir_model_data", ["res_id"], name: "ir_model_data_res_id_index", using: :btree

  create_table "ir_model_fields", force: :cascade do |t|
    t.string   "model",                  limit: 255,                  null: false
    t.integer  "model_id",                                            null: false
    t.string   "name",                   limit: 255,                  null: false
    t.string   "relation",               limit: 255
    t.string   "select_level",           limit: 255,                  null: false
    t.string   "field_description",      limit: 255,                  null: false
    t.string   "ttype",                  limit: 255,                  null: false
    t.string   "state",                  limit: 255, default: "base", null: false
    t.string   "relation_field",         limit: 255
    t.boolean  "translate",                          default: false
    t.integer  "serialization_field_id"
    t.string   "domain",                 limit: 255
    t.datetime "create_date"
    t.datetime "write_date"
    t.string   "on_delete",              limit: 255
    t.integer  "write_uid"
    t.string   "selection",              limit: 255
    t.integer  "size"
    t.integer  "create_uid"
    t.boolean  "readonly"
    t.string   "complete_name",          limit: 255
    t.boolean  "selectable"
    t.boolean  "required"
  end

  add_index "ir_model_fields", ["complete_name"], name: "ir_model_fields_complete_name_index", using: :btree
  add_index "ir_model_fields", ["model"], name: "ir_model_fields_model_index", using: :btree
  add_index "ir_model_fields", ["model_id"], name: "ir_model_fields_model_id_index", using: :btree
  add_index "ir_model_fields", ["name"], name: "ir_model_fields_name_index", using: :btree
  add_index "ir_model_fields", ["state"], name: "ir_model_fields_state_index", using: :btree

  create_table "ir_model_fields_group_rel", id: false, force: :cascade do |t|
    t.integer "field_id", null: false
    t.integer "group_id", null: false
  end

  add_index "ir_model_fields_group_rel", ["field_id", "group_id"], name: "ir_model_fields_group_rel_field_id_group_id_key", unique: true, using: :btree
  add_index "ir_model_fields_group_rel", ["field_id"], name: "ir_model_fields_group_rel_field_id_index", using: :btree
  add_index "ir_model_fields_group_rel", ["group_id"], name: "ir_model_fields_group_rel_group_id_index", using: :btree

  create_table "ir_model_relation", force: :cascade do |t|
    t.datetime "date_init"
    t.datetime "date_update"
    t.integer  "module",                  null: false
    t.integer  "model",                   null: false
    t.string   "name",        limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "ir_model_relation", ["model"], name: "ir_model_relation_model_index", using: :btree
  add_index "ir_model_relation", ["module"], name: "ir_model_relation_module_index", using: :btree
  add_index "ir_model_relation", ["name"], name: "ir_model_relation_name_index", using: :btree

  create_table "ir_module_category", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.string   "name",        limit: 255, null: false
    t.text     "description"
    t.integer  "sequence"
    t.boolean  "visible"
  end

  add_index "ir_module_category", ["name"], name: "ir_module_category_name_index", using: :btree
  add_index "ir_module_category", ["parent_id"], name: "ir_module_category_parent_id_index", using: :btree

  create_table "ir_module_module", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "website",           limit: 255
    t.string   "summary",           limit: 255
    t.string   "name",              limit: 255,                 null: false
    t.string   "author",            limit: 255
    t.string   "icon",              limit: 255
    t.string   "state",             limit: 255
    t.string   "latest_version",    limit: 255
    t.string   "shortdesc",         limit: 255
    t.integer  "category_id"
    t.text     "description"
    t.boolean  "application",                   default: false
    t.boolean  "demo",                          default: false
    t.boolean  "web",                           default: false
    t.string   "license",           limit: 255
    t.integer  "sequence",                      default: 100
    t.boolean  "auto_install",                  default: false
    t.text     "menus_by_module"
    t.text     "reports_by_module"
    t.string   "maintainer",        limit: 255
    t.text     "contributors"
    t.text     "views_by_module"
    t.string   "published_version", limit: 255
    t.string   "url",               limit: 255
  end

  add_index "ir_module_module", ["category_id"], name: "ir_module_module_category_id_index", using: :btree
  add_index "ir_module_module", ["name"], name: "ir_module_module_name_index", using: :btree
  add_index "ir_module_module", ["name"], name: "ir_module_module_name_uniq", unique: true, using: :btree
  add_index "ir_module_module", ["name"], name: "name_uniq", unique: true, using: :btree
  add_index "ir_module_module", ["state"], name: "ir_module_module_state_index", using: :btree

  create_table "ir_module_module_dependency", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "name",        limit: 255
    t.integer  "module_id"
  end

  add_index "ir_module_module_dependency", ["name"], name: "ir_module_module_dependency_name_index", using: :btree

  create_table "ir_property", force: :cascade do |t|
    t.text     "value_text"
    t.float    "value_float"
    t.datetime "create_date"
    t.string   "name",            limit: 255
    t.integer  "create_uid"
    t.string   "type",            limit: 255, null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "fields_id",                   null: false
    t.datetime "value_datetime"
    t.binary   "value_binary"
    t.datetime "write_date"
    t.string   "value_reference", limit: 255
    t.integer  "value_integer"
    t.string   "res_id",          limit: 255
  end

  add_index "ir_property", ["company_id"], name: "ir_property_company_id_index", using: :btree
  add_index "ir_property", ["fields_id"], name: "ir_property_fields_id_index", using: :btree
  add_index "ir_property", ["name"], name: "ir_property_name_index", using: :btree
  add_index "ir_property", ["res_id"], name: "ir_property_res_id_index", using: :btree
  add_index "ir_property", ["type"], name: "ir_property_type_index", using: :btree

  create_table "ir_rule", force: :cascade do |t|
    t.integer  "model_id",                 null: false
    t.text     "domain_force"
    t.string   "name",         limit: 255
    t.integer  "create_uid"
    t.boolean  "global"
    t.integer  "write_uid"
    t.boolean  "active"
    t.boolean  "perm_read"
    t.boolean  "perm_unlink"
    t.boolean  "perm_write"
    t.datetime "create_date"
    t.boolean  "perm_create"
    t.datetime "write_date"
  end

  add_index "ir_rule", ["model_id"], name: "ir_rule_model_id_index", using: :btree
  add_index "ir_rule", ["name"], name: "ir_rule_name_index", using: :btree

  create_table "ir_sequence", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",             limit: 64
    t.datetime "create_date"
    t.string   "name",             limit: 64,  null: false
    t.integer  "number_next",                  null: false
    t.string   "implementation",   limit: 255, null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "padding",                      null: false
    t.integer  "number_increment",             null: false
    t.string   "prefix",           limit: 255
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "suffix",           limit: 255
  end

  create_table "ir_sequence_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 32,  null: false
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "ir_sequence_type", ["code"], name: "ir_sequence_type_code_unique", unique: true, using: :btree

  create_table "ir_server_object_lines", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "server_id"
    t.datetime "create_date"
    t.text     "value",                   null: false
    t.integer  "col1",                    null: false
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "type",        limit: 255, null: false
  end

  create_table "ir_translation", force: :cascade do |t|
    t.string  "lang",     limit: 255
    t.text    "src"
    t.string  "name",     limit: 255, null: false
    t.integer "res_id"
    t.string  "module",   limit: 255
    t.string  "state",    limit: 255
    t.text    "comments"
    t.text    "value"
    t.string  "type",     limit: 255
  end

  add_index "ir_translation", ["comments"], name: "ir_translation_comments_index", using: :btree
  add_index "ir_translation", ["module"], name: "ir_translation_module_index", using: :btree
  add_index "ir_translation", ["name", "lang", "type"], name: "ir_translation_ltn", using: :btree
  add_index "ir_translation", ["res_id"], name: "ir_translation_res_id_index", using: :btree
  add_index "ir_translation", ["src"], name: "ir_translation_src_hash_idx", using: :hash
  add_index "ir_translation", ["type"], name: "ir_translation_type_index", using: :btree

  create_table "ir_ui_menu", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.binary   "web_icon_data"
    t.boolean  "needaction_enabled"
    t.datetime "create_date"
    t.string   "name",                limit: 255, null: false
    t.string   "icon",                limit: 64
    t.integer  "sequence"
    t.string   "web_icon_hover",      limit: 255
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.string   "web_icon",            limit: 255
    t.datetime "write_date"
    t.integer  "create_uid"
    t.binary   "web_icon_hover_data"
  end

  add_index "ir_ui_menu", ["parent_id"], name: "ir_ui_menu_parent_id_index", using: :btree
  add_index "ir_ui_menu", ["parent_left"], name: "ir_ui_menu_parent_left_index", using: :btree
  add_index "ir_ui_menu", ["parent_right"], name: "ir_ui_menu_parent_right_index", using: :btree

  create_table "ir_ui_menu_group_rel", id: false, force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "gid",     null: false
  end

  add_index "ir_ui_menu_group_rel", ["gid"], name: "ir_ui_menu_group_rel_gid_index", using: :btree
  add_index "ir_ui_menu_group_rel", ["menu_id", "gid"], name: "ir_ui_menu_group_rel_menu_id_gid_key", unique: true, using: :btree
  add_index "ir_ui_menu_group_rel", ["menu_id"], name: "ir_ui_menu_group_rel_menu_id_index", using: :btree

  create_table "ir_ui_view", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",          limit: 255, null: false
    t.integer  "inherit_id"
    t.datetime "write_date"
    t.text     "arch",                      null: false
    t.integer  "write_uid"
    t.integer  "priority",                  null: false
    t.string   "mode",          limit: 255, null: false
    t.boolean  "active"
    t.string   "model",         limit: 255
    t.integer  "model_data_id"
    t.string   "type",          limit: 255
    t.string   "field_parent",  limit: 255
  end

  add_index "ir_ui_view", ["inherit_id"], name: "ir_ui_view_inherit_id_index", using: :btree
  add_index "ir_ui_view", ["model", "inherit_id"], name: "ir_ui_view_model_type_inherit_id", using: :btree
  add_index "ir_ui_view", ["model"], name: "ir_ui_view_model_index", using: :btree

  create_table "ir_ui_view_custom", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "user_id",     null: false
    t.integer  "ref_id",      null: false
    t.text     "arch",        null: false
  end

  add_index "ir_ui_view_custom", ["ref_id"], name: "ir_ui_view_custom_ref_id_index", using: :btree
  add_index "ir_ui_view_custom", ["user_id", "ref_id"], name: "ir_ui_view_custom_user_id_ref_id", using: :btree
  add_index "ir_ui_view_custom", ["user_id"], name: "ir_ui_view_custom_user_id_index", using: :btree

  create_table "ir_ui_view_group_rel", id: false, force: :cascade do |t|
    t.integer "view_id",  null: false
    t.integer "group_id", null: false
  end

  add_index "ir_ui_view_group_rel", ["group_id"], name: "ir_ui_view_group_rel_group_id_index", using: :btree
  add_index "ir_ui_view_group_rel", ["view_id", "group_id"], name: "ir_ui_view_group_rel_view_id_group_id_key", unique: true, using: :btree
  add_index "ir_ui_view_group_rel", ["view_id"], name: "ir_ui_view_group_rel_view_id_index", using: :btree

  create_table "ir_values", force: :cascade do |t|
    t.integer  "model_id"
    t.integer  "user_id"
    t.string   "name",        limit: 255, null: false
    t.integer  "create_uid"
    t.string   "key2",        limit: 255
    t.integer  "company_id"
    t.text     "value"
    t.integer  "write_uid"
    t.string   "key",         limit: 255, null: false
    t.datetime "write_date"
    t.datetime "create_date"
    t.string   "model",       limit: 255, null: false
    t.integer  "res_id"
    t.integer  "action_id"
  end

  add_index "ir_values", ["company_id"], name: "ir_values_company_id_index", using: :btree
  add_index "ir_values", ["key", "model", "key2", "res_id", "user_id"], name: "ir_values_key_model_key2_res_id_user_id_idx", using: :btree
  add_index "ir_values", ["key"], name: "ir_values_key_index", using: :btree
  add_index "ir_values", ["key2"], name: "ir_values_key2_index", using: :btree
  add_index "ir_values", ["model"], name: "ir_values_model_index", using: :btree
  add_index "ir_values", ["res_id"], name: "ir_values_res_id_index", using: :btree
  add_index "ir_values", ["user_id"], name: "ir_values_user_id_index", using: :btree

  create_table "mj_base_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.binary   "file"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "owner_type",  limit: 255
    t.integer  "owner_id"
    t.string   "resource_no", limit: 255
  end

  create_table "mj_bill_of_material_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "bill_of_material",    limit: 255
    t.string   "bill_of_material_no", limit: 255
    t.integer  "product_id"
  end

  create_table "mj_dashboard_dashboard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "mj_duiduoche_task_queues", force: :cascade do |t|
    t.integer "work_order_id"
    t.string  "task",          limit: 255
    t.string  "state",         limit: 255
  end

  create_table "mj_material_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "number"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "bill_of_material"
    t.integer  "bom_id"
    t.integer  "product_id"
    t.integer  "bill_of_material_id"
  end

  create_table "mj_product_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",                limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "status",              limit: 255
    t.integer  "project"
    t.string   "product_name",        limit: 255
    t.string   "product_no",          limit: 255
    t.string   "remark",              limit: 255
    t.integer  "product_type_moved0"
    t.string   "product_type",        limit: 255
    t.string   "uuid",                limit: 255
    t.string   "standard",            limit: 255
    t.string   "unit",                limit: 255
    t.integer  "project_id"
  end

  create_table "mj_production_base", force: :cascade do |t|
    t.string   "status",             limit: 255
    t.integer  "create_uid"
    t.string   "remark",             limit: 255
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "production_plan"
    t.integer  "write_uid"
    t.string   "production_no",      limit: 255
    t.datetime "write_date"
    t.datetime "create_date"
    t.integer  "parent_id"
    t.integer  "product_id"
    t.string   "name",               limit: 255
    t.integer  "production_plan_id"
  end

  create_table "mj_production_plan_base", force: :cascade do |t|
    t.string   "status",             limit: 255
    t.integer  "create_uid"
    t.integer  "product"
    t.date     "begin_date"
    t.string   "name",               limit: 255
    t.date     "end_date"
    t.string   "production_plan_no", limit: 255
    t.string   "remark",             limit: 255
    t.integer  "write_uid"
    t.integer  "product_number"
    t.datetime "write_date"
    t.datetime "create_date"
    t.string   "plan_type",          limit: 255
    t.integer  "product_id"
  end

  create_table "mj_project_base", force: :cascade do |t|
    t.string   "status",      limit: 255
    t.integer  "create_uid"
    t.date     "begin_date"
    t.string   "name",        limit: 255
    t.date     "end_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "create_date"
    t.string   "project_no",  limit: 255
    t.text     "remark"
  end

  create_table "mj_project_user_base", force: :cascade do |t|
    t.string   "duty",        limit: 255
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "project"
    t.integer  "user"
    t.datetime "write_date"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "mj_routing", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 255
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "product"
  end

  create_table "mj_routing_operation", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "workstation_moved0", limit: 255
    t.datetime "create_date"
    t.string   "name",               limit: 255
    t.float    "time_cost"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "routing_id"
    t.string   "technology_arg",     limit: 255
    t.integer  "workstation"
  end

  create_table "mj_stock_tray_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "location"
    t.datetime "write_date"
    t.integer  "tray"
  end

  create_table "mj_tcs_order_base", force: :cascade do |t|
    t.string   "status",                limit: 255
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "production"
    t.datetime "write_date"
    t.string   "no",                    limit: 255
    t.string   "order_name",            limit: 255
    t.string   "execution_success_ful", limit: 255
    t.integer  "production_id"
    t.string   "vehicle",               limit: 255
  end

  create_table "mj_tcs_order_task_base", force: :cascade do |t|
    t.string   "status",                 limit: 255
    t.string   "intendedVehicle",        limit: 255
    t.datetime "create_date"
    t.string   "no",                     limit: 255
    t.string   "order_name",             limit: 255
    t.integer  "write_uid"
    t.string   "locationName",           limit: 255
    t.integer  "tcs_order"
    t.datetime "write_date"
    t.string   "action",                 limit: 255
    t.integer  "create_uid"
    t.string   "executionSuccessful",    limit: 255
    t.string   "current_position",       limit: 255
    t.string   "intended_vehicle",       limit: 255
    t.string   "destination_name",       limit: 255
    t.string   "execution_success_ful",  limit: 255
    t.boolean  "vehicle_type_available"
    t.string   "operation",              limit: 255
    t.integer  "tcs_order_id"
    t.string   "location_name",          limit: 255
  end

  create_table "mj_technology_arg", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 255
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "mj_technology_arg_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "mj_technology_arg_id"
    t.datetime "create_date"
    t.string   "name",                 limit: 255
    t.integer  "sequence"
    t.string   "low_value",            limit: 255
    t.string   "value",                limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "high_value",           limit: 255
  end

  create_table "mj_tm_operation", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "workstation_id"
    t.float    "time_cost"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "routing_id"
    t.string   "technology_arg", limit: 255
    t.string   "name",           limit: 255
    t.integer  "equipment_id"
    t.text     "note"
    t.integer  "sequence"
    t.string   "program_no",     limit: 255
  end

  create_table "mj_tm_operation_material", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",         limit: 255
    t.integer  "qty"
    t.datetime "write_date"
    t.integer  "operation_id"
    t.integer  "write_uid"
    t.integer  "product_id"
  end

  create_table "mj_tm_operation_product_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "number"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "operation"
  end

  create_table "mj_tm_routing", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.datetime "create_date"
    t.integer  "product_id"
    t.integer  "create_uid"
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "name",        limit: 255
  end

  create_table "mj_tray_product_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "number"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "tray"
  end

  create_table "mj_vehicle_workstations", force: :cascade do |t|
    t.string   "workstation_no", limit: 255
    t.string   "vehicle_no",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "mj_work_order_base", force: :cascade do |t|
    t.string   "status",               limit: 255
    t.integer  "create_uid"
    t.date     "begin_date"
    t.integer  "takes"
    t.date     "end_date"
    t.string   "operation_content",    limit: 255
    t.integer  "write_uid"
    t.integer  "production"
    t.integer  "user"
    t.datetime "write_date"
    t.integer  "routing_operation"
    t.string   "operation_name",       limit: 255
    t.datetime "create_date"
    t.string   "work_order_no",        limit: 255
    t.integer  "work_station"
    t.integer  "sequence"
    t.integer  "routing_operation_id"
    t.integer  "work_station_id"
    t.integer  "production_id"
    t.integer  "user_id"
  end

  create_table "mj_workcenter_equipment", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.string   "no",          limit: 255
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.string   "e_type",      limit: 255
    t.string   "type",        limit: 255
  end

  create_table "mj_workcenter_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "owner_type",     limit: 255
    t.integer  "owner_id"
    t.integer  "workstation_id"
    t.string   "name",           limit: 255
  end

  create_table "mj_workcenter_workcenter", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 255
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.string   "no",          limit: 255
    t.integer  "parent_id"
    t.string   "state",       limit: 255
  end

  create_table "mj_workcenter_workstation", force: :cascade do |t|
    t.integer  "create_uid"
    t.float    "time_start"
    t.string   "name",          limit: 255
    t.float    "time_stop"
    t.string   "no",            limit: 255
    t.integer  "write_uid"
    t.text     "note"
    t.float    "cost_hour"
    t.float    "costs_cycle"
    t.integer  "workcenter_id"
    t.datetime "write_date"
    t.datetime "create_date"
    t.float    "time_cycle"
    t.string   "state",         limit: 255
    t.string   "type",          limit: 255
  end

  create_table "multi_company_default", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",            limit: 255, null: false
    t.integer  "sequence"
    t.integer  "field_id"
    t.integer  "company_id",                  null: false
    t.integer  "object_id",                   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "company_dest_id",             null: false
    t.string   "expression",      limit: 255, null: false
  end

  create_table "osv_memory_autovacuum", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "productions_logistics_chains", force: :cascade do |t|
    t.integer  "production_order_id"
    t.string   "owner_type",          limit: 255
    t.integer  "owner_id"
    t.integer  "sequence"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "status",              limit: 255
  end

  add_index "productions_logistics_chains", ["owner_id", "owner_type"], name: "index_productions_logistics_chains_on_owner_id_and_owner_type", using: :btree
  add_index "productions_logistics_chains", ["production_order_id"], name: "index_productions_logistics_chains_on_production_order_id", using: :btree

  create_table "productions_work_order_executions", force: :cascade do |t|
    t.integer  "work_order_id"
    t.string   "type",          limit: 255
    t.string   "state",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "rel_modules_langexport", id: false, force: :cascade do |t|
    t.integer "wiz_id",    null: false
    t.integer "module_id", null: false
  end

  add_index "rel_modules_langexport", ["module_id"], name: "rel_modules_langexport_module_id_index", using: :btree
  add_index "rel_modules_langexport", ["wiz_id", "module_id"], name: "rel_modules_langexport_wiz_id_module_id_key", unique: true, using: :btree
  add_index "rel_modules_langexport", ["wiz_id"], name: "rel_modules_langexport_wiz_id_index", using: :btree

  create_table "rel_server_actions", id: false, force: :cascade do |t|
    t.integer "server_id", null: false
    t.integer "action_id", null: false
  end

  add_index "rel_server_actions", ["action_id"], name: "rel_server_actions_action_id_index", using: :btree
  add_index "rel_server_actions", ["server_id", "action_id"], name: "rel_server_actions_server_id_action_id_key", unique: true, using: :btree
  add_index "rel_server_actions", ["server_id"], name: "rel_server_actions_server_id_index", using: :btree

  create_table "report", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "report_paperformat", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "page_width"
    t.datetime "create_date"
    t.string   "name",           limit: 255, null: false
    t.string   "format",         limit: 255
    t.boolean  "default"
    t.boolean  "header_line"
    t.integer  "header_spacing"
    t.integer  "dpi",                        null: false
    t.integer  "write_uid"
    t.integer  "margin_right"
    t.integer  "margin_top"
    t.integer  "margin_left"
    t.datetime "write_date"
    t.integer  "margin_bottom"
    t.integer  "page_height"
    t.string   "orientation",    limit: 255
  end

  create_table "res_bank", force: :cascade do |t|
    t.string   "city",        limit: 255
    t.string   "fax",         limit: 255
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.string   "zip",         limit: 24
    t.integer  "create_uid"
    t.integer  "country"
    t.string   "street2",     limit: 255
    t.string   "bic",         limit: 64
    t.integer  "write_uid"
    t.string   "email",       limit: 255
    t.string   "phone",       limit: 255
    t.integer  "state"
    t.string   "street",      limit: 255
    t.datetime "write_date"
    t.boolean  "active"
  end

  create_table "res_company", force: :cascade do |t|
    t.string   "name",             limit: 255, null: false
    t.integer  "partner_id",                   null: false
    t.integer  "currency_id",                  null: false
    t.text     "rml_footer"
    t.datetime "create_date"
    t.text     "rml_header",                   null: false
    t.string   "rml_paper_format", limit: 255, null: false
    t.integer  "write_uid"
    t.binary   "logo_web"
    t.integer  "font"
    t.string   "account_no",       limit: 255
    t.integer  "parent_id"
    t.string   "email",            limit: 64
    t.integer  "create_uid"
    t.boolean  "custom_footer"
    t.string   "phone",            limit: 64
    t.text     "rml_header2",                  null: false
    t.text     "rml_header3",                  null: false
    t.datetime "write_date"
    t.string   "rml_header1",      limit: 255
    t.string   "company_registry", limit: 64
    t.integer  "paperformat_id"
  end

  add_index "res_company", ["name"], name: "res_company_name_uniq", unique: true, using: :btree
  add_index "res_company", ["parent_id"], name: "res_company_parent_id_index", using: :btree

  create_table "res_company_users_rel", id: false, force: :cascade do |t|
    t.integer "cid",     null: false
    t.integer "user_id", null: false
  end

  add_index "res_company_users_rel", ["cid", "user_id"], name: "res_company_users_rel_cid_user_id_key", unique: true, using: :btree
  add_index "res_company_users_rel", ["cid"], name: "res_company_users_rel_cid_index", using: :btree
  add_index "res_company_users_rel", ["user_id"], name: "res_company_users_rel_user_id_index", using: :btree

  create_table "res_config", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "res_config_installer", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "res_config_settings", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "res_country", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",           limit: 2
    t.datetime "create_date"
    t.string   "name",           limit: 255, null: false
    t.binary   "image"
    t.integer  "write_uid"
    t.integer  "currency_id"
    t.text     "address_format"
    t.datetime "write_date"
  end

  add_index "res_country", ["code"], name: "res_country_code_uniq", unique: true, using: :btree
  add_index "res_country", ["name"], name: "res_country_name_uniq", unique: true, using: :btree

  create_table "res_country_group", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "res_country_res_country_group_rel", id: false, force: :cascade do |t|
    t.integer "res_country_id",       null: false
    t.integer "res_country_group_id", null: false
  end

  add_index "res_country_res_country_group_rel", ["res_country_group_id"], name: "res_country_res_country_group_rel_res_country_group_id_index", using: :btree
  add_index "res_country_res_country_group_rel", ["res_country_id", "res_country_group_id"], name: "res_country_res_country_group_res_country_id_res_country_gr_key", unique: true, using: :btree
  add_index "res_country_res_country_group_rel", ["res_country_id"], name: "res_country_res_country_group_rel_res_country_id_index", using: :btree

  create_table "res_country_state", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 3,   null: false
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "country_id",              null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "res_currency", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.decimal  "rounding"
    t.string   "symbol",      limit: 4
    t.integer  "company_id"
    t.integer  "write_uid"
    t.boolean  "base"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "position",    limit: 255
    t.integer  "accuracy"
  end

  add_index "res_currency", ["name", "company_id"], name: "res_currency_unique_name_company_id", unique: true, using: :btree
  add_index "res_currency", ["name"], name: "res_currency_unique_name_company_id_idx", unique: true, using: :btree

  create_table "res_currency_rate", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "name",        null: false
    t.integer  "write_uid"
    t.integer  "currency_id"
    t.decimal  "rate"
    t.datetime "write_date"
  end

  add_index "res_currency_rate", ["name"], name: "res_currency_rate_name_index", using: :btree

  create_table "res_font", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.string   "family",      limit: 255, null: false
    t.integer  "write_uid"
    t.string   "mode",        limit: 255, null: false
    t.datetime "write_date"
    t.string   "path",        limit: 255, null: false
  end

  add_index "res_font", ["family", "name"], name: "res_font_name_font_uniq", unique: true, using: :btree

  create_table "res_groups", force: :cascade do |t|
    t.text     "comment"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "category_id"
  end

  add_index "res_groups", ["category_id", "name"], name: "res_groups_name_uniq", unique: true, using: :btree
  add_index "res_groups", ["category_id"], name: "res_groups_category_id_index", using: :btree

  create_table "res_groups_action_rel", id: false, force: :cascade do |t|
    t.integer "uid", null: false
    t.integer "gid", null: false
  end

  add_index "res_groups_action_rel", ["gid"], name: "res_groups_action_rel_gid_index", using: :btree
  add_index "res_groups_action_rel", ["uid", "gid"], name: "res_groups_action_rel_uid_gid_key", unique: true, using: :btree
  add_index "res_groups_action_rel", ["uid"], name: "res_groups_action_rel_uid_index", using: :btree

  create_table "res_groups_implied_rel", id: false, force: :cascade do |t|
    t.integer "gid", null: false
    t.integer "hid", null: false
  end

  add_index "res_groups_implied_rel", ["gid", "hid"], name: "res_groups_implied_rel_gid_hid_key", unique: true, using: :btree
  add_index "res_groups_implied_rel", ["gid"], name: "res_groups_implied_rel_gid_index", using: :btree
  add_index "res_groups_implied_rel", ["hid"], name: "res_groups_implied_rel_hid_index", using: :btree

  create_table "res_groups_report_rel", id: false, force: :cascade do |t|
    t.integer "uid", null: false
    t.integer "gid", null: false
  end

  add_index "res_groups_report_rel", ["gid"], name: "res_groups_report_rel_gid_index", using: :btree
  add_index "res_groups_report_rel", ["uid", "gid"], name: "res_groups_report_rel_uid_gid_key", unique: true, using: :btree
  add_index "res_groups_report_rel", ["uid"], name: "res_groups_report_rel_uid_index", using: :btree

  create_table "res_groups_users_rel", id: false, force: :cascade do |t|
    t.integer "gid", null: false
    t.integer "uid", null: false
  end

  add_index "res_groups_users_rel", ["gid", "uid"], name: "res_groups_users_rel_gid_uid_key", unique: true, using: :btree
  add_index "res_groups_users_rel", ["gid"], name: "res_groups_users_rel_gid_index", using: :btree
  add_index "res_groups_users_rel", ["uid"], name: "res_groups_users_rel_uid_index", using: :btree

  create_table "res_lang", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.string   "code",          limit: 16,  null: false
    t.string   "date_format",   limit: 255, null: false
    t.string   "direction",     limit: 255, null: false
    t.datetime "create_date"
    t.integer  "create_uid"
    t.string   "thousands_sep", limit: 255
    t.boolean  "translatable"
    t.integer  "write_uid"
    t.string   "time_format",   limit: 255, null: false
    t.datetime "write_date"
    t.string   "decimal_point", limit: 255, null: false
    t.boolean  "active"
    t.string   "iso_code",      limit: 16
    t.string   "grouping",      limit: 255, null: false
  end

  add_index "res_lang", ["code"], name: "res_lang_code_key", unique: true, using: :btree
  add_index "res_lang", ["code"], name: "res_lang_code_uniq", unique: true, using: :btree
  add_index "res_lang", ["name"], name: "res_lang_name_key", unique: true, using: :btree
  add_index "res_lang", ["name"], name: "res_lang_name_uniq", unique: true, using: :btree

  create_table "res_partner", force: :cascade do |t|
    t.string   "name",                  limit: 255, null: false
    t.integer  "company_id"
    t.text     "comment"
    t.string   "ean13",                 limit: 13
    t.datetime "create_date"
    t.integer  "color"
    t.binary   "image_small"
    t.binary   "image"
    t.date     "date"
    t.string   "street",                limit: 255
    t.string   "city",                  limit: 255
    t.string   "display_name",          limit: 255
    t.string   "zip",                   limit: 24
    t.integer  "title"
    t.string   "function",              limit: 255
    t.integer  "country_id"
    t.integer  "parent_id"
    t.boolean  "supplier"
    t.string   "ref",                   limit: 255
    t.string   "email",                 limit: 255
    t.boolean  "is_company"
    t.string   "website",               limit: 255
    t.boolean  "customer"
    t.string   "fax",                   limit: 255
    t.string   "street2",               limit: 255
    t.boolean  "employee"
    t.float    "credit_limit"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "tz",                    limit: 64
    t.integer  "write_uid"
    t.string   "lang",                  limit: 255
    t.integer  "create_uid"
    t.binary   "image_medium"
    t.string   "phone",                 limit: 255
    t.string   "mobile",                limit: 255
    t.string   "type",                  limit: 255
    t.boolean  "use_parent_address"
    t.integer  "user_id"
    t.string   "birthdate",             limit: 255
    t.string   "vat",                   limit: 255
    t.integer  "state_id"
    t.integer  "commercial_partner_id"
  end

  add_index "res_partner", ["company_id"], name: "res_partner_company_id_index", using: :btree
  add_index "res_partner", ["date"], name: "res_partner_date_index", using: :btree
  add_index "res_partner", ["display_name"], name: "res_partner_display_name_index", using: :btree
  add_index "res_partner", ["name"], name: "res_partner_name_index", using: :btree
  add_index "res_partner", ["parent_id"], name: "res_partner_parent_id_index", using: :btree
  add_index "res_partner", ["ref"], name: "res_partner_ref_index", using: :btree

  create_table "res_partner_bank", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "owner_name",  limit: 255
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.string   "zip",         limit: 24
    t.integer  "sequence"
    t.boolean  "footer"
    t.integer  "country_id"
    t.integer  "company_id"
    t.string   "bank_name",   limit: 255
    t.integer  "write_uid"
    t.string   "state",       limit: 255, null: false
    t.string   "street",      limit: 255
    t.string   "city",        limit: 255
    t.datetime "write_date"
    t.integer  "state_id"
    t.string   "bank_bic",    limit: 16
    t.integer  "partner_id"
    t.integer  "bank"
    t.string   "acc_number",  limit: 64,  null: false
  end

  add_index "res_partner_bank", ["partner_id"], name: "res_partner_bank_partner_id_index", using: :btree

  create_table "res_partner_bank_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",          limit: 64,  null: false
    t.datetime "create_date"
    t.string   "name",          limit: 255, null: false
    t.integer  "write_uid"
    t.text     "format_layout"
    t.datetime "write_date"
  end

  create_table "res_partner_bank_type_field", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",         limit: 255, null: false
    t.boolean  "required"
    t.integer  "write_uid"
    t.boolean  "readonly"
    t.datetime "write_date"
    t.integer  "bank_type_id",             null: false
    t.integer  "size"
  end

  create_table "res_partner_category", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",         limit: 255, null: false
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.boolean  "active"
  end

  add_index "res_partner_category", ["parent_id"], name: "res_partner_category_parent_id_index", using: :btree
  add_index "res_partner_category", ["parent_left"], name: "res_partner_category_parent_left_index", using: :btree
  add_index "res_partner_category", ["parent_right"], name: "res_partner_category_parent_right_index", using: :btree

  create_table "res_partner_res_partner_category_rel", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "partner_id",  null: false
  end

  add_index "res_partner_res_partner_category_rel", ["category_id", "partner_id"], name: "res_partner_res_partner_category_rel_category_id_partner_id_key", unique: true, using: :btree
  add_index "res_partner_res_partner_category_rel", ["category_id"], name: "res_partner_res_partner_category_rel_category_id_index", using: :btree
  add_index "res_partner_res_partner_category_rel", ["partner_id"], name: "res_partner_res_partner_category_rel_partner_id_index", using: :btree

  create_table "res_partner_title", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "domain",      limit: 255, null: false
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.string   "shortcut",    limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "res_request_link", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.string   "object",      limit: 255, null: false
    t.integer  "write_uid"
    t.integer  "priority"
    t.datetime "write_date"
  end

  create_table "res_users", force: :cascade do |t|
    t.boolean  "active",                     default: true
    t.string   "login",          limit: 64,                 null: false
    t.string   "password",       limit: 255
    t.integer  "company_id",                                null: false
    t.integer  "partner_id",                                null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.date     "login_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.text     "signature"
    t.integer  "action_id"
    t.string   "password_crypt", limit: 255
    t.string   "access_token",   limit: 255,                null: false
  end

  add_index "res_users", ["login"], name: "res_users_login_key", unique: true, using: :btree
  add_index "res_users", ["login_date"], name: "res_users_login_date_index", using: :btree

  create_table "resource_calendar", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "manager"
    t.datetime "write_date"
  end

  create_table "resource_calendar_attendance", force: :cascade do |t|
    t.string   "dayofweek",   limit: 255, null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.date     "date_from"
    t.integer  "write_uid"
    t.float    "hour_from",               null: false
    t.float    "hour_to",                 null: false
    t.datetime "write_date"
    t.integer  "calendar_id",             null: false
  end

  add_index "resource_calendar_attendance", ["dayofweek"], name: "resource_calendar_attendance_dayofweek_index", using: :btree
  add_index "resource_calendar_attendance", ["hour_from"], name: "resource_calendar_attendance_hour_from_index", using: :btree

  create_table "resource_calendar_leaves", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255
    t.integer  "resource_id"
    t.datetime "date_from",               null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "date_to",                 null: false
    t.integer  "calendar_id"
  end

  create_table "resource_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.float    "time_efficiency",             null: false
    t.string   "code",            limit: 16
    t.integer  "user_id"
    t.string   "name",            limit: 255, null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "calendar_id"
    t.boolean  "active"
    t.datetime "create_date"
    t.string   "resource_type",   limit: 255, null: false
  end

  create_table "rule_group_rel", id: false, force: :cascade do |t|
    t.integer "rule_group_id", null: false
    t.integer "group_id",      null: false
  end

  add_index "rule_group_rel", ["group_id"], name: "rule_group_rel_group_id_index", using: :btree
  add_index "rule_group_rel", ["rule_group_id", "group_id"], name: "rule_group_rel_rule_group_id_group_id_key", unique: true, using: :btree
  add_index "rule_group_rel", ["rule_group_id"], name: "rule_group_rel_rule_group_id_index", using: :btree

  create_table "sale_config_settings", force: :cascade do |t|
    t.integer  "create_uid"
    t.boolean  "module_web_linkedin"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.boolean  "module_sale"
    t.datetime "write_date"
    t.boolean  "module_crm"
    t.boolean  "module_mass_mailing"
  end

  create_table "wizard_ir_model_menu_create", force: :cascade do |t|
    t.integer  "menu_id",                 null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "wkf", force: :cascade do |t|
    t.string   "name",        limit: 255,                 null: false
    t.string   "osv",         limit: 255,                 null: false
    t.boolean  "on_create",               default: false
    t.datetime "create_date"
    t.integer  "create_uid"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  add_index "wkf", ["on_create"], name: "wkf_on_create_index", using: :btree
  add_index "wkf", ["osv"], name: "wkf_osv_index", using: :btree

  create_table "wkf_activity", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "kind",        limit: 255, null: false
    t.datetime "create_date"
    t.string   "name",        limit: 255, null: false
    t.string   "join_mode",   limit: 3,   null: false
    t.boolean  "flow_stop"
    t.integer  "write_uid"
    t.integer  "subflow_id"
    t.string   "split_mode",  limit: 3,   null: false
    t.datetime "write_date"
    t.text     "action"
    t.integer  "wkf_id",                  null: false
    t.string   "signal_send", limit: 255
    t.boolean  "flow_start"
    t.integer  "action_id"
  end

  add_index "wkf_activity", ["wkf_id"], name: "wkf_activity_wkf_id_index", using: :btree

  create_table "wkf_instance", force: :cascade do |t|
    t.string  "res_type", limit: 255
    t.integer "uid"
    t.integer "wkf_id"
    t.string  "state",    limit: 255
    t.integer "res_id"
  end

  add_index "wkf_instance", ["res_id", "wkf_id"], name: "wkf_instance_res_id_wkf_id_index", using: :btree
  add_index "wkf_instance", ["res_type", "res_id", "state"], name: "wkf_instance_res_type_res_id_state_index", using: :btree
  add_index "wkf_instance", ["wkf_id"], name: "wkf_instance_wkf_id_index", using: :btree

  create_table "wkf_transition", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "trigger_model",   limit: 255
    t.string   "signal",          limit: 255
    t.integer  "sequence"
    t.integer  "write_uid"
    t.integer  "act_from",                    null: false
    t.string   "condition",       limit: 255, null: false
    t.datetime "write_date"
    t.string   "trigger_expr_id", limit: 255
    t.integer  "group_id"
    t.integer  "act_to",                      null: false
  end

  add_index "wkf_transition", ["act_from"], name: "wkf_transition_act_from_index", using: :btree
  add_index "wkf_transition", ["act_to"], name: "wkf_transition_act_to_index", using: :btree

  create_table "wkf_triggers", force: :cascade do |t|
    t.integer "instance_id"
    t.integer "workitem_id",             null: false
    t.string  "model",       limit: 255
    t.integer "res_id"
  end

  add_index "wkf_triggers", ["res_id", "model"], name: "wkf_triggers_res_id_model_index", using: :btree

  create_table "wkf_witm_trans", id: false, force: :cascade do |t|
    t.integer "inst_id",  null: false
    t.integer "trans_id", null: false
  end

  add_index "wkf_witm_trans", ["inst_id", "trans_id"], name: "wkf_witm_trans_inst_id_trans_id_key", unique: true, using: :btree
  add_index "wkf_witm_trans", ["inst_id"], name: "wkf_witm_trans_inst_id_index", using: :btree
  add_index "wkf_witm_trans", ["trans_id"], name: "wkf_witm_trans_trans_id_index", using: :btree

  create_table "wkf_workitem", force: :cascade do |t|
    t.integer "act_id",                 null: false
    t.integer "inst_id",                null: false
    t.integer "subflow_id"
    t.string  "state",      limit: 255
  end

  add_index "wkf_workitem", ["act_id"], name: "wkf_workitem_act_id_index", using: :btree
  add_index "wkf_workitem", ["inst_id"], name: "wkf_workitem_inst_id_index", using: :btree
  add_index "wkf_workitem", ["state"], name: "wkf_workitem_state_index", using: :btree
  add_index "wkf_workitem", ["subflow_id"], name: "wkf_workitem_subflow_id_index", using: :btree

  create_table "wms_location", force: :cascade do |t|
    t.integer  "no_max_transport_units"
    t.boolean  "counting_active"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.boolean  "incoming_active"
    t.integer  "create_uid"
    t.string   "area",                           limit: 255, null: false
    t.boolean  "considered_in_allocation"
    t.string   "check_state",                    limit: 255
    t.datetime "last_access"
    t.float    "maximum_weight"
    t.text     "description"
    t.boolean  "location_group_counting_active"
    t.integer  "location_group"
    t.integer  "plc_state"
    t.boolean  "outgoing_active"
    t.datetime "write_date"
    t.integer  "location_type"
    t.string   "aisle",                          limit: 255, null: false
    t.string   "y",                              limit: 255, null: false
    t.string   "x",                              limit: 255, null: false
    t.string   "z",                              limit: 255, null: false
    t.integer  "no"
  end

  create_table "wms_location_group", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "parent"
    t.boolean  "location_group_counting_active"
    t.string   "name",                           limit: 255, null: false
    t.integer  "state_out_locker"
    t.integer  "state_in_locker"
    t.string   "group_state_in",                 limit: 255
    t.float    "max_fill_level"
    t.string   "system_code",                    limit: 255
    t.datetime "write_date"
    t.string   "group_state_out",                limit: 255
    t.boolean  "no_locations"
    t.integer  "write_uid"
    t.string   "group_type",                     limit: 255
    t.text     "description"
  end

  add_index "wms_location_group", ["name"], name: "wms_location_group_name_index", using: :btree
  add_index "wms_location_group", ["name"], name: "wms_location_group_wms_location_group_name_unique", unique: true, using: :btree

  create_table "wms_location_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "description"
    t.integer  "height"
    t.integer  "width"
    t.integer  "length"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "type",        limit: 255, null: false
  end

  add_index "wms_location_type", ["type"], name: "wms_location_type_type_index", using: :btree
  add_index "wms_location_type", ["type"], name: "wms_location_type_wms_location_type_type_unique", unique: true, using: :btree

  create_table "wms_location_wms_message_rel", id: false, force: :cascade do |t|
    t.integer "wms_location_id", null: false
    t.integer "wms_message_id",  null: false
  end

  add_index "wms_location_wms_message_rel", ["wms_location_id", "wms_message_id"], name: "wms_location_wms_message_rel_wms_location_id_wms_message_id_key", unique: true, using: :btree
  add_index "wms_location_wms_message_rel", ["wms_location_id"], name: "wms_location_wms_message_rel_wms_location_id_index", using: :btree
  add_index "wms_location_wms_message_rel", ["wms_message_id"], name: "wms_location_wms_message_rel_wms_message_id_index", using: :btree

  create_table "wms_message", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "message_no",   limit: 255
    t.string   "message_text", limit: 255
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "wms_product", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "description"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "name",        limit: 255, null: false
  end

  add_index "wms_product", ["name"], name: "wms_product_name_index", using: :btree

  create_table "wms_transport_order", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "transport_unit",                    null: false
    t.datetime "end_date"
    t.integer  "problem_message_no"
    t.integer  "source_location"
    t.integer  "target_location_group"
    t.datetime "problem_occurred"
    t.string   "priority",              limit: 255
    t.string   "state",                 limit: 255
    t.integer  "target_location"
    t.datetime "start_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.text     "problem_message"
    t.integer  "production_order_id"
  end

  create_table "wms_transport_unit", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "parent"
    t.float    "weight"
    t.integer  "transport_unit_type"
    t.string   "barcode",             limit: 255, null: false
    t.integer  "write_uid"
    t.datetime "inventory_date"
    t.string   "state",               limit: 255
    t.integer  "target_location"
    t.datetime "actualLocation_date"
    t.datetime "write_date"
    t.integer  "product_quantity"
    t.integer  "inventory_user"
    t.integer  "actual_location"
    t.boolean  "empty"
    t.integer  "product_id"
  end

  add_index "wms_transport_unit", ["barcode"], name: "wms_transport_unit_barcode_index", using: :btree
  add_index "wms_transport_unit", ["barcode"], name: "wms_transport_unit_wms_transport_unit_barcode_unique", unique: true, using: :btree

  create_table "wms_transport_unit_type", force: :cascade do |t|
    t.float    "weight_max"
    t.datetime "create_date"
    t.text     "description"
    t.integer  "create_uid"
    t.float    "payload"
    t.string   "compatibility", limit: 255
    t.integer  "height"
    t.integer  "width"
    t.integer  "length"
    t.datetime "write_date"
    t.float    "weight_tare"
    t.integer  "write_uid"
    t.string   "type",          limit: 255, null: false
  end

  add_index "wms_transport_unit_type", ["type"], name: "wms_transport_unit_type_type_index", using: :btree
  add_index "wms_transport_unit_type", ["type"], name: "wms_transport_unit_type_wms_location_unit_type_type", unique: true, using: :btree

  create_table "wms_transport_unit_wms_unit_error_rel", id: false, force: :cascade do |t|
    t.integer "wms_transport_unit_id", null: false
    t.integer "wms_unit_error_id",     null: false
  end

  add_index "wms_transport_unit_wms_unit_error_rel", ["wms_transport_unit_id", "wms_unit_error_id"], name: "wms_transport_unit_wms_unit_e_wms_transport_unit_id_wms_uni_key", unique: true, using: :btree
  add_index "wms_transport_unit_wms_unit_error_rel", ["wms_transport_unit_id"], name: "wms_transport_unit_wms_unit_error_rel_wms_transport_unit_id_ind", using: :btree
  add_index "wms_transport_unit_wms_unit_error_rel", ["wms_unit_error_id"], name: "wms_transport_unit_wms_unit_error_rel_wms_unit_error_id_index", using: :btree

  create_table "wms_unit_error", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "error_no",    limit: 255
    t.text     "error_text"
  end

  create_table "workcenters_equipment_daq", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "equipment_id"
    t.string   "address",      limit: 255
    t.string   "value",        limit: 255
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "workcenters_workstation_task_items", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "no",         limit: 255
    t.string   "name",       limit: 255
    t.integer  "step"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "workcenters_workstation_tasks", force: :cascade do |t|
    t.integer  "workstation_id"
    t.string   "name",           limit: 255
    t.string   "no",             limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "base_config_settings", "res_font", column: "font", name: "base_config_settings_font_fkey", on_delete: :nullify
  add_foreign_key "base_config_settings", "res_users", column: "create_uid", name: "base_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_config_settings", "res_users", column: "write_uid", name: "base_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_import", "res_users", column: "create_uid", name: "base_import_import_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_import", "res_users", column: "write_uid", name: "base_import_import_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char", "res_users", column: "create_uid", name: "base_import_tests_models_char_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char", "res_users", column: "write_uid", name: "base_import_tests_models_char_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_noreadonly", "res_users", column: "create_uid", name: "base_import_tests_models_char_noreadonly_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_noreadonly", "res_users", column: "write_uid", name: "base_import_tests_models_char_noreadonly_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_readonly", "res_users", column: "create_uid", name: "base_import_tests_models_char_readonly_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_readonly", "res_users", column: "write_uid", name: "base_import_tests_models_char_readonly_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_required", "res_users", column: "create_uid", name: "base_import_tests_models_char_required_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_required", "res_users", column: "write_uid", name: "base_import_tests_models_char_required_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_states", "res_users", column: "create_uid", name: "base_import_tests_models_char_states_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_states", "res_users", column: "write_uid", name: "base_import_tests_models_char_states_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_stillreadonly", "res_users", column: "create_uid", name: "base_import_tests_models_char_stillreadonly_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_stillreadonly", "res_users", column: "write_uid", name: "base_import_tests_models_char_stillreadonly_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o", "base_import_tests_models_m2o_related", column: "value", name: "base_import_tests_models_m2o_value_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_related", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_related_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_related", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_related_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required", "base_import_tests_models_m2o_required_related", column: "value", name: "base_import_tests_models_m2o_required_value_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_required_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_required_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required_related", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_required_related_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required_related", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_required_related_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m", "res_users", column: "create_uid", name: "base_import_tests_models_o2m_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m", "res_users", column: "write_uid", name: "base_import_tests_models_o2m_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m_child", "base_import_tests_models_o2m", column: "parent_id", name: "base_import_tests_models_o2m_child_parent_id_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m_child", "res_users", column: "create_uid", name: "base_import_tests_models_o2m_child_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m_child", "res_users", column: "write_uid", name: "base_import_tests_models_o2m_child_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_preview", "res_users", column: "create_uid", name: "base_import_tests_models_preview_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_preview", "res_users", column: "write_uid", name: "base_import_tests_models_preview_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_export", "res_users", column: "create_uid", name: "base_language_export_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_export", "res_users", column: "write_uid", name: "base_language_export_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_import", "res_users", column: "create_uid", name: "base_language_import_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_import", "res_users", column: "write_uid", name: "base_language_import_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_install", "res_users", column: "create_uid", name: "base_language_install_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_install", "res_users", column: "write_uid", name: "base_language_install_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_configuration", "res_users", column: "create_uid", name: "base_module_configuration_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_configuration", "res_users", column: "write_uid", name: "base_module_configuration_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_update", "res_users", column: "create_uid", name: "base_module_update_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_update", "res_users", column: "write_uid", name: "base_module_update_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_upgrade", "res_users", column: "create_uid", name: "base_module_upgrade_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_upgrade", "res_users", column: "write_uid", name: "base_module_upgrade_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_setup_terminology", "res_users", column: "create_uid", name: "base_setup_terminology_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_setup_terminology", "res_users", column: "write_uid", name: "base_setup_terminology_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_update_translations", "res_users", column: "create_uid", name: "base_update_translations_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_update_translations", "res_users", column: "write_uid", name: "base_update_translations_write_uid_fkey", on_delete: :nullify
  add_foreign_key "board_create", "ir_ui_menu", column: "menu_parent_id", name: "board_create_menu_parent_id_fkey", on_delete: :nullify
  add_foreign_key "board_create", "res_users", column: "create_uid", name: "board_create_create_uid_fkey", on_delete: :nullify
  add_foreign_key "board_create", "res_users", column: "write_uid", name: "board_create_write_uid_fkey", on_delete: :nullify
  add_foreign_key "bus_bus", "res_users", column: "create_uid", name: "bus_bus_create_uid_fkey", on_delete: :nullify
  add_foreign_key "bus_bus", "res_users", column: "write_uid", name: "bus_bus_write_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "change_password_wizard", column: "wizard_id", name: "change_password_user_wizard_id_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "create_uid", name: "change_password_user_create_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "user_id", name: "change_password_user_user_id_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "write_uid", name: "change_password_user_write_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_wizard", "res_users", column: "create_uid", name: "change_password_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_wizard", "res_users", column: "write_uid", name: "change_password_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision", "res_users", column: "create_uid", name: "decimal_precision_create_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision", "res_users", column: "write_uid", name: "decimal_precision_write_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision_test", "res_users", column: "create_uid", name: "decimal_precision_test_create_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision_test", "res_users", column: "write_uid", name: "decimal_precision_test_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_client", "res_users", column: "create_uid", name: "ir_act_client_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_client", "res_users", column: "write_uid", name: "ir_act_client_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "report_paperformat", column: "paperformat_id", name: "ir_act_report_xml_paperformat_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "res_users", column: "create_uid", name: "ir_act_report_xml_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "res_users", column: "write_uid", name: "ir_act_report_xml_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model", column: "crud_model_id", name: "ir_act_server_crud_model_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model", column: "model_id", name: "ir_act_server_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_server", "ir_model", column: "sub_object", name: "ir_act_server_sub_object_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model", column: "wkf_model_id", name: "ir_act_server_wkf_model_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model_fields", column: "link_field_id", name: "ir_act_server_link_field_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model_fields", column: "model_object_field", name: "ir_act_server_model_object_field_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model_fields", column: "sub_model_object_field", name: "ir_act_server_sub_model_object_field_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model_fields", column: "wkf_field_id", name: "ir_act_server_wkf_field_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_values", column: "menu_ir_values_id", name: "ir_act_server_menu_ir_values_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "res_users", column: "create_uid", name: "ir_act_server_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "res_users", column: "write_uid", name: "ir_act_server_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "wkf_transition", name: "ir_act_server_wkf_transition_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_url", "res_users", column: "create_uid", name: "ir_act_url_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_url", "res_users", column: "write_uid", name: "ir_act_url_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "ir_ui_view", column: "search_view_id", name: "ir_act_window_search_view_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "ir_ui_view", column: "view_id", name: "ir_act_window_view_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "res_users", column: "create_uid", name: "ir_act_window_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "res_users", column: "write_uid", name: "ir_act_window_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window_group_rel", "ir_act_window", column: "act_id", name: "ir_act_window_group_rel_act_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window_group_rel", "res_groups", column: "gid", name: "ir_act_window_group_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window_view", "ir_act_window", column: "act_window_id", name: "ir_act_window_view_act_window_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window_view", "ir_ui_view", column: "view_id", name: "ir_act_window_view_view_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window_view", "res_users", column: "create_uid", name: "ir_act_window_view_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window_view", "res_users", column: "write_uid", name: "ir_act_window_view_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions", "res_users", column: "create_uid", name: "ir_actions_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions", "res_users", column: "create_uid", name: "ir_actions_create_uid_fkey1", on_delete: :nullify
  add_foreign_key "ir_actions", "res_users", column: "write_uid", name: "ir_actions_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions", "res_users", column: "write_uid", name: "ir_actions_write_uid_fkey1", on_delete: :nullify
  add_foreign_key "ir_actions_todo", "res_users", column: "create_uid", name: "ir_actions_todo_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions_todo", "res_users", column: "write_uid", name: "ir_actions_todo_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_attachment", "res_company", column: "company_id", name: "ir_attachment_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_attachment", "res_users", column: "create_uid", name: "ir_attachment_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_attachment", "res_users", column: "write_uid", name: "ir_attachment_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_config_parameter", "res_users", column: "create_uid", name: "ir_config_parameter_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_config_parameter", "res_users", column: "write_uid", name: "ir_config_parameter_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_config_parameter_groups_rel", "ir_config_parameter", column: "icp_id", name: "ir_config_parameter_groups_rel_icp_id_fkey", on_delete: :cascade
  add_foreign_key "ir_config_parameter_groups_rel", "res_groups", column: "group_id", name: "ir_config_parameter_groups_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "ir_cron", "res_users", column: "create_uid", name: "ir_cron_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_cron", "res_users", column: "user_id", name: "ir_cron_user_id_fkey", on_delete: :nullify
  add_foreign_key "ir_cron", "res_users", column: "write_uid", name: "ir_cron_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_default", "res_company", column: "company_id", name: "ir_default_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_default", "res_users", column: "create_uid", name: "ir_default_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_default", "res_users", column: "uid", name: "ir_default_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_default", "res_users", column: "write_uid", name: "ir_default_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports", "res_users", column: "create_uid", name: "ir_exports_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports", "res_users", column: "write_uid", name: "ir_exports_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports_line", "ir_exports", column: "export_id", name: "ir_exports_line_export_id_fkey", on_delete: :cascade
  add_foreign_key "ir_exports_line", "res_users", column: "create_uid", name: "ir_exports_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports_line", "res_users", column: "write_uid", name: "ir_exports_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_fields_converter", "res_users", column: "create_uid", name: "ir_fields_converter_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_fields_converter", "res_users", column: "write_uid", name: "ir_fields_converter_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_filters", "res_users", column: "create_uid", name: "ir_filters_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_filters", "res_users", column: "user_id", name: "ir_filters_user_id_fkey", on_delete: :cascade
  add_foreign_key "ir_filters", "res_users", column: "write_uid", name: "ir_filters_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_logging", "res_users", column: "write_uid", name: "ir_logging_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_mail_server", "res_users", column: "create_uid", name: "ir_mail_server_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_mail_server", "res_users", column: "write_uid", name: "ir_mail_server_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model", "res_users", column: "create_uid", name: "ir_model_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model", "res_users", column: "write_uid", name: "ir_model_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_access", "ir_model", column: "model_id", name: "ir_model_access_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_access", "res_groups", column: "group_id", name: "ir_model_access_group_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_access", "res_users", column: "create_uid", name: "ir_model_access_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_access", "res_users", column: "write_uid", name: "ir_model_access_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "ir_model", column: "model", name: "ir_model_constraint_model_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "ir_module_module", column: "module", name: "ir_model_constraint_module_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "res_users", column: "create_uid", name: "ir_model_constraint_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "res_users", column: "write_uid", name: "ir_model_constraint_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_data", "res_users", column: "create_uid", name: "ir_model_data_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_data", "res_users", column: "write_uid", name: "ir_model_data_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_fields", "ir_model", column: "model_id", name: "ir_model_fields_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_fields", "ir_model_fields", column: "serialization_field_id", name: "ir_model_fields_serialization_field_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_fields", "res_users", column: "create_uid", name: "ir_model_fields_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_fields", "res_users", column: "write_uid", name: "ir_model_fields_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_fields_group_rel", "ir_model_fields", column: "field_id", name: "ir_model_fields_group_rel_field_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_fields_group_rel", "res_groups", column: "group_id", name: "ir_model_fields_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_relation", "ir_model", column: "model", name: "ir_model_relation_model_fkey", on_delete: :nullify
  add_foreign_key "ir_model_relation", "ir_module_module", column: "module", name: "ir_model_relation_module_fkey", on_delete: :nullify
  add_foreign_key "ir_model_relation", "res_users", column: "create_uid", name: "ir_model_relation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_relation", "res_users", column: "write_uid", name: "ir_model_relation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_category", "ir_module_category", column: "parent_id", name: "ir_module_category_parent_id_fkey", on_delete: :nullify
  add_foreign_key "ir_module_category", "res_users", column: "create_uid", name: "ir_module_category_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_category", "res_users", column: "write_uid", name: "ir_module_category_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module", "ir_module_category", column: "category_id", name: "ir_module_module_category_id_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module", "res_users", column: "create_uid", name: "ir_module_module_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module", "res_users", column: "write_uid", name: "ir_module_module_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module_dependency", "ir_module_module", column: "module_id", name: "ir_module_module_dependency_module_id_fkey", on_delete: :cascade
  add_foreign_key "ir_module_module_dependency", "res_users", column: "create_uid", name: "ir_module_module_dependency_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module_dependency", "res_users", column: "write_uid", name: "ir_module_module_dependency_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_property", "ir_model_fields", column: "fields_id", name: "ir_property_fields_id_fkey", on_delete: :cascade
  add_foreign_key "ir_property", "res_company", column: "company_id", name: "ir_property_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_property", "res_users", column: "create_uid", name: "ir_property_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_property", "res_users", column: "write_uid", name: "ir_property_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_rule", "ir_model", column: "model_id", name: "ir_rule_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_rule", "res_users", column: "create_uid", name: "ir_rule_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_rule", "res_users", column: "write_uid", name: "ir_rule_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence", "res_company", column: "company_id", name: "ir_sequence_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence", "res_users", column: "create_uid", name: "ir_sequence_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence", "res_users", column: "write_uid", name: "ir_sequence_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence_type", "res_users", column: "create_uid", name: "ir_sequence_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence_type", "res_users", column: "write_uid", name: "ir_sequence_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_server_object_lines", "ir_act_server", column: "server_id", name: "ir_server_object_lines_server_id_fkey", on_delete: :cascade
  add_foreign_key "ir_server_object_lines", "ir_model_fields", column: "col1", name: "ir_server_object_lines_col1_fkey", on_delete: :nullify
  add_foreign_key "ir_server_object_lines", "res_users", column: "create_uid", name: "ir_server_object_lines_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_server_object_lines", "res_users", column: "write_uid", name: "ir_server_object_lines_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_translation", "res_lang", column: "lang", primary_key: "code", name: "ir_translation_lang_fkey_res_lang"
  add_foreign_key "ir_ui_menu", "ir_ui_menu", column: "parent_id", name: "ir_ui_menu_parent_id_fkey", on_delete: :restrict
  add_foreign_key "ir_ui_menu", "res_users", column: "create_uid", name: "ir_ui_menu_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_menu", "res_users", column: "write_uid", name: "ir_ui_menu_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_menu_group_rel", "ir_ui_menu", column: "menu_id", name: "ir_ui_menu_group_rel_menu_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_menu_group_rel", "res_groups", column: "gid", name: "ir_ui_menu_group_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view", "ir_model_data", column: "model_data_id", name: "ir_ui_view_model_data_id_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view", "ir_ui_view", column: "inherit_id", name: "ir_ui_view_inherit_id_fkey", on_delete: :restrict
  add_foreign_key "ir_ui_view", "res_users", column: "create_uid", name: "ir_ui_view_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view", "res_users", column: "write_uid", name: "ir_ui_view_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view_custom", "ir_ui_view", column: "ref_id", name: "ir_ui_view_custom_ref_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view_custom", "res_users", column: "create_uid", name: "ir_ui_view_custom_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view_custom", "res_users", column: "user_id", name: "ir_ui_view_custom_user_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view_custom", "res_users", column: "write_uid", name: "ir_ui_view_custom_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view_group_rel", "ir_ui_view", column: "view_id", name: "ir_ui_view_group_rel_view_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view_group_rel", "res_groups", column: "group_id", name: "ir_ui_view_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "ir_values", "ir_model", column: "model_id", name: "ir_values_model_id_fkey", on_delete: :nullify
  add_foreign_key "ir_values", "res_company", column: "company_id", name: "ir_values_company_id_fkey", on_delete: :cascade
  add_foreign_key "ir_values", "res_users", column: "create_uid", name: "ir_values_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_values", "res_users", column: "user_id", name: "ir_values_user_id_fkey", on_delete: :cascade
  add_foreign_key "ir_values", "res_users", column: "write_uid", name: "ir_values_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_base_resource", "res_users", column: "create_uid", name: "mj_base_resource_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_base_resource", "res_users", column: "write_uid", name: "mj_base_resource_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "mj_product_base", column: "product", name: "mj_bill_of_material_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "mj_product_base", column: "product_id", name: "mj_bill_of_material_base_product_id_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "res_users", column: "create_uid", name: "mj_bill_of_material_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "res_users", column: "write_uid", name: "mj_bill_of_material_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_dashboard_dashboard", "res_users", column: "create_uid", name: "mj_dashboard_dashboard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_dashboard_dashboard", "res_users", column: "write_uid", name: "mj_dashboard_dashboard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "mj_bill_of_material_base", column: "bill_of_material", name: "mj_material_base_bill_of_material_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "mj_bill_of_material_base", column: "bill_of_material_id", name: "mj_material_base_bill_of_material_id_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "mj_product_base", column: "product", name: "mj_material_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "mj_product_base", column: "product_id", name: "mj_material_base_product_id_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "res_users", column: "create_uid", name: "mj_material_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "res_users", column: "write_uid", name: "mj_material_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_product_base", "res_users", column: "create_uid", name: "mj_product_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_product_base", "res_users", column: "write_uid", name: "mj_product_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "mj_production_base", column: "parent_id", name: "mj_production_base_parent_id_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "mj_production_plan_base", column: "production_plan", name: "mj_production_base_production_plan_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "mj_production_plan_base", column: "production_plan_id", name: "mj_production_base_production_plan_id_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "res_users", column: "create_uid", name: "mj_production_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "res_users", column: "write_uid", name: "mj_production_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "mj_product_base", column: "product", name: "mj_production_plan_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "mj_product_base", column: "product_id", name: "mj_production_plan_base_product_id_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "res_users", column: "create_uid", name: "mj_production_plan_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "res_users", column: "write_uid", name: "mj_production_plan_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_base", "res_users", column: "create_uid", name: "mj_project_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_base", "res_users", column: "write_uid", name: "mj_project_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "mj_project_base", column: "project", name: "mj_project_user_base_project_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "mj_project_base", column: "project_id", name: "mj_project_user_base_project_id_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "create_uid", name: "mj_project_user_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "user", name: "mj_project_user_base_user_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "user_id", name: "mj_project_user_base_user_id_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "write_uid", name: "mj_project_user_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "mj_product_base", column: "product", name: "mj_routing_product_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "res_users", column: "create_uid", name: "mj_routing_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "res_users", column: "write_uid", name: "mj_routing_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing_operation", "mj_routing", column: "routing_id", name: "mj_routing_operation_routing_id_fkey", on_delete: :nullify
  add_foreign_key "mj_routing_operation", "res_users", column: "create_uid", name: "mj_routing_operation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing_operation", "res_users", column: "write_uid", name: "mj_routing_operation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "res_users", column: "create_uid", name: "mj_stock_tray_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "res_users", column: "write_uid", name: "mj_stock_tray_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "wms_location", column: "location", name: "mj_stock_tray_base_location_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "wms_transport_unit", column: "tray", name: "mj_stock_tray_base_tray_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_base", "res_users", column: "create_uid", name: "mj_tcs_order_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_base", "res_users", column: "write_uid", name: "mj_tcs_order_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_task_base", "mj_tcs_order_base", column: "tcs_order", name: "mj_tcs_order_task_base_tcs_order_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_task_base", "mj_tcs_order_base", column: "tcs_order_id", name: "mj_tcs_order_task_base_tcs_order_id_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_task_base", "res_users", column: "create_uid", name: "mj_tcs_order_task_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_task_base", "res_users", column: "write_uid", name: "mj_tcs_order_task_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_technology_arg", "res_users", column: "create_uid", name: "mj_technology_arg_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_technology_arg", "res_users", column: "write_uid", name: "mj_technology_arg_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_technology_arg_line", "mj_technology_arg", name: "mj_technology_arg_line_mj_technology_arg_id_fkey", on_delete: :nullify
  add_foreign_key "mj_technology_arg_line", "res_users", column: "create_uid", name: "mj_technology_arg_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_technology_arg_line", "res_users", column: "write_uid", name: "mj_technology_arg_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation", "mj_tm_routing", column: "routing_id", name: "mj_tm_operation_routing_id_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation", "res_users", column: "create_uid", name: "mj_tm_operation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation", "res_users", column: "write_uid", name: "mj_tm_operation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_material", "mj_product_base", column: "product_id", name: "mj_tm_operation_material_product_id_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_material", "mj_tm_operation", column: "operation_id", name: "mj_tm_operation_material_operation_id_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_material", "res_users", column: "create_uid", name: "mj_tm_operation_material_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_material", "res_users", column: "write_uid", name: "mj_tm_operation_material_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_product_base", "mj_product_base", column: "product", name: "mj_tm_operation_product_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_product_base", "mj_tm_operation", column: "operation", name: "mj_tm_operation_product_base_operation_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_product_base", "res_users", column: "create_uid", name: "mj_tm_operation_product_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_operation_product_base", "res_users", column: "write_uid", name: "mj_tm_operation_product_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_routing", "mj_product_base", column: "product_id", name: "mj_tm_routing_product_id_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_routing", "res_users", column: "create_uid", name: "mj_tm_routing_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tm_routing", "res_users", column: "write_uid", name: "mj_tm_routing_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tray_product_base", "mj_product_base", column: "product", name: "mj_tray_product_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_tray_product_base", "res_users", column: "create_uid", name: "mj_tray_product_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tray_product_base", "res_users", column: "write_uid", name: "mj_tray_product_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tray_product_base", "wms_transport_unit", column: "tray", name: "mj_tray_product_base_tray_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "mj_production_base", column: "production", name: "mj_work_order_base_production_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "mj_production_base", column: "production_id", name: "mj_work_order_base_production_id_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "res_users", column: "create_uid", name: "mj_work_order_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "res_users", column: "user", name: "mj_work_order_base_user_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "res_users", column: "user_id", name: "mj_work_order_base_user_id_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "res_users", column: "write_uid", name: "mj_work_order_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_equipment", "res_users", column: "create_uid", name: "mj_workcenter_equipment_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_equipment", "res_users", column: "write_uid", name: "mj_workcenter_equipment_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_resource", "res_users", column: "create_uid", name: "mj_workcenter_resource_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_resource", "res_users", column: "write_uid", name: "mj_workcenter_resource_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_workcenter", "res_users", column: "create_uid", name: "mj_workcenter_workcenter_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_workcenter", "res_users", column: "write_uid", name: "mj_workcenter_workcenter_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_workstation", "mj_workcenter_workcenter", column: "workcenter_id", name: "mj_workcenter_workstation_workcenter_id_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_workstation", "res_users", column: "create_uid", name: "mj_workcenter_workstation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_workcenter_workstation", "res_users", column: "write_uid", name: "mj_workcenter_workstation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "multi_company_default", "ir_model", column: "object_id", name: "multi_company_default_object_id_fkey", on_delete: :nullify
  add_foreign_key "multi_company_default", "ir_model_fields", column: "field_id", name: "multi_company_default_field_id_fkey", on_delete: :nullify
  add_foreign_key "multi_company_default", "res_company", column: "company_dest_id", name: "multi_company_default_company_dest_id_fkey", on_delete: :nullify
  add_foreign_key "multi_company_default", "res_company", column: "company_id", name: "multi_company_default_company_id_fkey", on_delete: :nullify
  add_foreign_key "multi_company_default", "res_users", column: "create_uid", name: "multi_company_default_create_uid_fkey", on_delete: :nullify
  add_foreign_key "multi_company_default", "res_users", column: "write_uid", name: "multi_company_default_write_uid_fkey", on_delete: :nullify
  add_foreign_key "osv_memory_autovacuum", "res_users", column: "create_uid", name: "osv_memory_autovacuum_create_uid_fkey", on_delete: :nullify
  add_foreign_key "osv_memory_autovacuum", "res_users", column: "write_uid", name: "osv_memory_autovacuum_write_uid_fkey", on_delete: :nullify
  add_foreign_key "rel_modules_langexport", "base_language_export", column: "wiz_id", name: "rel_modules_langexport_wiz_id_fkey", on_delete: :cascade
  add_foreign_key "rel_modules_langexport", "ir_module_module", column: "module_id", name: "rel_modules_langexport_module_id_fkey", on_delete: :cascade
  add_foreign_key "rel_server_actions", "ir_act_server", column: "action_id", name: "rel_server_actions_action_id_fkey", on_delete: :cascade
  add_foreign_key "rel_server_actions", "ir_act_server", column: "server_id", name: "rel_server_actions_server_id_fkey", on_delete: :cascade
  add_foreign_key "report", "res_users", column: "create_uid", name: "report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "report", "res_users", column: "write_uid", name: "report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "report_paperformat", "res_users", column: "create_uid", name: "report_paperformat_create_uid_fkey", on_delete: :nullify
  add_foreign_key "report_paperformat", "res_users", column: "write_uid", name: "report_paperformat_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_country", column: "country", name: "res_bank_country_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_country_state", column: "state", name: "res_bank_state_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_users", column: "create_uid", name: "res_bank_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_users", column: "write_uid", name: "res_bank_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company", "report_paperformat", column: "paperformat_id", name: "res_company_paperformat_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_company", column: "parent_id", name: "res_company_parent_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_currency", column: "currency_id", name: "res_company_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_font", column: "font", name: "res_company_font_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_partner", column: "partner_id", name: "res_company_partner_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_users", column: "create_uid", name: "res_company_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_users", column: "write_uid", name: "res_company_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company_users_rel", "res_company", column: "cid", name: "res_company_users_rel_cid_fkey", on_delete: :cascade
  add_foreign_key "res_company_users_rel", "res_users", column: "user_id", name: "res_company_users_rel_user_id_fkey", on_delete: :cascade
  add_foreign_key "res_config", "res_users", column: "create_uid", name: "res_config_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config", "res_users", column: "write_uid", name: "res_config_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_installer", "res_users", column: "create_uid", name: "res_config_installer_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_installer", "res_users", column: "write_uid", name: "res_config_installer_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_settings", "res_users", column: "create_uid", name: "res_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_settings", "res_users", column: "write_uid", name: "res_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country", "res_currency", column: "currency_id", name: "res_country_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_country", "res_users", column: "create_uid", name: "res_country_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country", "res_users", column: "write_uid", name: "res_country_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_group", "res_users", column: "create_uid", name: "res_country_group_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_group", "res_users", column: "write_uid", name: "res_country_group_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_res_country_group_rel", "res_country", name: "res_country_res_country_group_rel_res_country_id_fkey", on_delete: :cascade
  add_foreign_key "res_country_res_country_group_rel", "res_country_group", name: "res_country_res_country_group_rel_res_country_group_id_fkey", on_delete: :cascade
  add_foreign_key "res_country_state", "res_country", column: "country_id", name: "res_country_state_country_id_fkey", on_delete: :nullify
  add_foreign_key "res_country_state", "res_users", column: "create_uid", name: "res_country_state_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_state", "res_users", column: "write_uid", name: "res_country_state_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency", "res_company", column: "company_id", name: "res_currency_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_currency", "res_users", column: "create_uid", name: "res_currency_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency", "res_users", column: "write_uid", name: "res_currency_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_currency", column: "currency_id", name: "res_currency_rate_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_users", column: "create_uid", name: "res_currency_rate_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_users", column: "write_uid", name: "res_currency_rate_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_font", "res_users", column: "create_uid", name: "res_font_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_font", "res_users", column: "write_uid", name: "res_font_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_groups", "ir_module_category", column: "category_id", name: "res_groups_category_id_fkey", on_delete: :nullify
  add_foreign_key "res_groups", "res_users", column: "create_uid", name: "res_groups_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_groups", "res_users", column: "write_uid", name: "res_groups_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_groups_action_rel", "ir_actions_todo", column: "uid", name: "res_groups_action_rel_uid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_action_rel", "res_groups", column: "gid", name: "res_groups_action_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_implied_rel", "res_groups", column: "gid", name: "res_groups_implied_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_implied_rel", "res_groups", column: "hid", name: "res_groups_implied_rel_hid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_report_rel", "ir_act_report_xml", column: "uid", name: "res_groups_report_rel_uid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_report_rel", "res_groups", column: "gid", name: "res_groups_report_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_users_rel", "res_groups", column: "gid", name: "res_groups_users_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_users_rel", "res_users", column: "uid", name: "res_groups_users_rel_uid_fkey", on_delete: :cascade
  add_foreign_key "res_lang", "res_users", column: "create_uid", name: "res_lang_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_lang", "res_users", column: "write_uid", name: "res_lang_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_company", column: "company_id", name: "res_partner_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_country", column: "country_id", name: "res_partner_country_id_fkey", on_delete: :restrict
  add_foreign_key "res_partner", "res_country_state", column: "state_id", name: "res_partner_state_id_fkey", on_delete: :restrict
  add_foreign_key "res_partner", "res_partner", column: "commercial_partner_id", name: "res_partner_commercial_partner_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner", column: "parent_id", name: "res_partner_parent_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner_title", column: "title", name: "res_partner_title_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "create_uid", name: "res_partner_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "user_id", name: "res_partner_user_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "write_uid", name: "res_partner_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_bank", column: "bank", name: "res_partner_bank_bank_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_company", column: "company_id", name: "res_partner_bank_company_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_bank", "res_country", column: "country_id", name: "res_partner_bank_country_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_country_state", column: "state_id", name: "res_partner_bank_state_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_partner", column: "partner_id", name: "res_partner_bank_partner_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_bank", "res_users", column: "create_uid", name: "res_partner_bank_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_users", column: "write_uid", name: "res_partner_bank_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank_type", "res_users", column: "create_uid", name: "res_partner_bank_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank_type", "res_users", column: "write_uid", name: "res_partner_bank_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank_type_field", "res_partner_bank_type", column: "bank_type_id", name: "res_partner_bank_type_field_bank_type_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_bank_type_field", "res_users", column: "create_uid", name: "res_partner_bank_type_field_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank_type_field", "res_users", column: "write_uid", name: "res_partner_bank_type_field_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_category", "res_partner_category", column: "parent_id", name: "res_partner_category_parent_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_category", "res_users", column: "create_uid", name: "res_partner_category_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_category", "res_users", column: "write_uid", name: "res_partner_category_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_res_partner_category_rel", "res_partner", column: "partner_id", name: "res_partner_res_partner_category_rel_partner_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_res_partner_category_rel", "res_partner_category", column: "category_id", name: "res_partner_res_partner_category_rel_category_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_title", "res_users", column: "create_uid", name: "res_partner_title_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_title", "res_users", column: "write_uid", name: "res_partner_title_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_request_link", "res_users", column: "create_uid", name: "res_request_link_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_request_link", "res_users", column: "write_uid", name: "res_request_link_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_users", "res_company", column: "company_id", name: "res_users_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_users", "res_partner", column: "partner_id", name: "res_users_partner_id_fkey", on_delete: :restrict
  add_foreign_key "res_users", "res_users", column: "create_uid", name: "res_users_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_users", "res_users", column: "write_uid", name: "res_users_write_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar", "res_company", column: "company_id", name: "resource_calendar_company_id_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar", "res_users", column: "create_uid", name: "resource_calendar_create_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar", "res_users", column: "manager", name: "resource_calendar_manager_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar", "res_users", column: "write_uid", name: "resource_calendar_write_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_attendance", "res_users", column: "create_uid", name: "resource_calendar_attendance_create_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_attendance", "res_users", column: "write_uid", name: "resource_calendar_attendance_write_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_attendance", "resource_calendar", column: "calendar_id", name: "resource_calendar_attendance_calendar_id_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_leaves", "res_company", column: "company_id", name: "resource_calendar_leaves_company_id_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_leaves", "res_users", column: "create_uid", name: "resource_calendar_leaves_create_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_leaves", "res_users", column: "write_uid", name: "resource_calendar_leaves_write_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_leaves", "resource_calendar", column: "calendar_id", name: "resource_calendar_leaves_calendar_id_fkey", on_delete: :nullify
  add_foreign_key "resource_calendar_leaves", "resource_resource", column: "resource_id", name: "resource_calendar_leaves_resource_id_fkey", on_delete: :nullify
  add_foreign_key "resource_resource", "res_company", column: "company_id", name: "resource_resource_company_id_fkey", on_delete: :nullify
  add_foreign_key "resource_resource", "res_users", column: "create_uid", name: "resource_resource_create_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_resource", "res_users", column: "user_id", name: "resource_resource_user_id_fkey", on_delete: :nullify
  add_foreign_key "resource_resource", "res_users", column: "write_uid", name: "resource_resource_write_uid_fkey", on_delete: :nullify
  add_foreign_key "resource_resource", "resource_calendar", column: "calendar_id", name: "resource_resource_calendar_id_fkey", on_delete: :nullify
  add_foreign_key "rule_group_rel", "ir_rule", column: "rule_group_id", name: "rule_group_rel_rule_group_id_fkey", on_delete: :cascade
  add_foreign_key "rule_group_rel", "res_groups", column: "group_id", name: "rule_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "sale_config_settings", "res_users", column: "create_uid", name: "sale_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "sale_config_settings", "res_users", column: "write_uid", name: "sale_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "ir_ui_menu", column: "menu_id", name: "wizard_ir_model_menu_create_menu_id_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "res_users", column: "create_uid", name: "wizard_ir_model_menu_create_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "res_users", column: "write_uid", name: "wizard_ir_model_menu_create_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf", "res_users", column: "create_uid", name: "wkf_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf", "res_users", column: "write_uid", name: "wkf_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf_activity", "ir_act_server", column: "action_id", name: "wkf_activity_action_id_fkey", on_delete: :nullify
  add_foreign_key "wkf_activity", "res_users", column: "create_uid", name: "wkf_activity_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf_activity", "res_users", column: "write_uid", name: "wkf_activity_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf_activity", "wkf", column: "subflow_id", name: "wkf_activity_subflow_id_fkey", on_delete: :nullify
  add_foreign_key "wkf_activity", "wkf", name: "wkf_activity_wkf_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_instance", "wkf", name: "wkf_instance_wkf_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_transition", "res_groups", column: "group_id", name: "wkf_transition_group_id_fkey", on_delete: :nullify
  add_foreign_key "wkf_transition", "res_users", column: "create_uid", name: "wkf_transition_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf_transition", "res_users", column: "write_uid", name: "wkf_transition_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wkf_transition", "wkf_activity", column: "act_from", name: "wkf_transition_act_from_fkey", on_delete: :cascade
  add_foreign_key "wkf_transition", "wkf_activity", column: "act_to", name: "wkf_transition_act_to_fkey", on_delete: :cascade
  add_foreign_key "wkf_triggers", "wkf_instance", column: "instance_id", name: "wkf_triggers_instance_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_triggers", "wkf_workitem", column: "workitem_id", name: "wkf_triggers_workitem_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_witm_trans", "wkf_instance", column: "inst_id", name: "wkf_witm_trans_inst_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_witm_trans", "wkf_transition", column: "trans_id", name: "wkf_witm_trans_trans_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_workitem", "wkf_activity", column: "act_id", name: "wkf_workitem_act_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_workitem", "wkf_instance", column: "inst_id", name: "wkf_workitem_inst_id_fkey", on_delete: :cascade
  add_foreign_key "wkf_workitem", "wkf_instance", column: "subflow_id", name: "wkf_workitem_subflow_id_fkey", on_delete: :nullify
  add_foreign_key "wms_location", "res_users", column: "create_uid", name: "wms_location_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_location", "res_users", column: "write_uid", name: "wms_location_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_location", "wms_location_group", column: "location_group", name: "wms_location_location_group_fkey", on_delete: :nullify
  add_foreign_key "wms_location", "wms_location_type", column: "location_type", name: "wms_location_location_type_fkey", on_delete: :nullify
  add_foreign_key "wms_location_group", "res_users", column: "create_uid", name: "wms_location_group_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_location_group", "res_users", column: "write_uid", name: "wms_location_group_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_location_group", "wms_location_group", column: "parent", name: "wms_location_group_parent_fkey", on_delete: :nullify
  add_foreign_key "wms_location_group", "wms_location_group", column: "state_in_locker", name: "wms_location_group_state_in_locker_fkey", on_delete: :nullify
  add_foreign_key "wms_location_group", "wms_location_group", column: "state_out_locker", name: "wms_location_group_state_out_locker_fkey", on_delete: :nullify
  add_foreign_key "wms_location_type", "res_users", column: "create_uid", name: "wms_location_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_location_type", "res_users", column: "write_uid", name: "wms_location_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_location_wms_message_rel", "wms_location", name: "wms_location_wms_message_rel_wms_location_id_fkey", on_delete: :cascade
  add_foreign_key "wms_location_wms_message_rel", "wms_message", name: "wms_location_wms_message_rel_wms_message_id_fkey", on_delete: :cascade
  add_foreign_key "wms_message", "res_users", column: "create_uid", name: "wms_message_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_message", "res_users", column: "write_uid", name: "wms_message_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_product", "res_users", column: "create_uid", name: "wms_product_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_product", "res_users", column: "write_uid", name: "wms_product_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_order", "res_users", column: "create_uid", name: "wms_transport_order_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_order", "res_users", column: "write_uid", name: "wms_transport_order_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_order", "wms_location", column: "source_location", name: "wms_transport_order_source_location_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_order", "wms_location", column: "target_location", name: "wms_transport_order_target_location_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_order", "wms_location_group", column: "target_location_group", name: "wms_transport_order_target_location_group_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_order", "wms_transport_unit", column: "transport_unit", name: "wms_transport_order_transport_unit_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "res_users", column: "create_uid", name: "wms_transport_unit_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "res_users", column: "inventory_user", name: "wms_transport_unit_inventory_user_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "res_users", column: "write_uid", name: "wms_transport_unit_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "wms_location", column: "actual_location", name: "wms_transport_unit_actual_location_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "wms_location", column: "target_location", name: "wms_transport_unit_target_location_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "wms_product", column: "product", name: "wms_transport_unit_product_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "wms_transport_unit", column: "parent", name: "wms_transport_unit_parent_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit", "wms_transport_unit_type", column: "transport_unit_type", name: "wms_transport_unit_transport_unit_type_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit_type", "res_users", column: "create_uid", name: "wms_transport_unit_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit_type", "res_users", column: "write_uid", name: "wms_transport_unit_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_transport_unit_wms_unit_error_rel", "wms_transport_unit", name: "wms_transport_unit_wms_unit_error_re_wms_transport_unit_id_fkey", on_delete: :cascade
  add_foreign_key "wms_transport_unit_wms_unit_error_rel", "wms_unit_error", name: "wms_transport_unit_wms_unit_error_rel_wms_unit_error_id_fkey", on_delete: :cascade
  add_foreign_key "wms_unit_error", "res_users", column: "create_uid", name: "wms_unit_error_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wms_unit_error", "res_users", column: "write_uid", name: "wms_unit_error_write_uid_fkey", on_delete: :nullify
end

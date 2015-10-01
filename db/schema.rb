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

ActiveRecord::Schema.define(version: 20151001082646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_account", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.string   "code",          limit: 64, null: false
    t.datetime "create_date"
    t.boolean  "reconcile"
    t.integer  "user_type",                null: false
    t.integer  "write_uid"
    t.integer  "create_uid"
    t.integer  "company_id",               null: false
    t.string   "shortcut",      limit: 12
    t.text     "note"
    t.integer  "parent_id"
    t.string   "type",                     null: false
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "currency_id"
    t.string   "name",                     null: false
    t.integer  "level"
    t.string   "currency_mode",            null: false
  end

  add_index "account_account", ["active"], name: "account_account_active_index", using: :btree
  add_index "account_account", ["code", "company_id"], name: "account_account_code_company_uniq", unique: true, using: :btree
  add_index "account_account", ["code"], name: "account_account_code_index", using: :btree
  add_index "account_account", ["name"], name: "account_account_name_index", using: :btree
  add_index "account_account", ["parent_left"], name: "account_account_parent_left_index", using: :btree
  add_index "account_account", ["parent_right"], name: "account_account_parent_right_index", using: :btree

  create_table "account_account_consol_rel", id: false, force: :cascade do |t|
    t.integer "child_id",  null: false
    t.integer "parent_id", null: false
  end

  add_index "account_account_consol_rel", ["child_id", "parent_id"], name: "account_account_consol_rel_child_id_parent_id_key", unique: true, using: :btree
  add_index "account_account_consol_rel", ["child_id"], name: "account_account_consol_rel_child_id_index", using: :btree
  add_index "account_account_consol_rel", ["parent_id"], name: "account_account_consol_rel_parent_id_index", using: :btree

  create_table "account_account_financial_report", id: false, force: :cascade do |t|
    t.integer "account_id",     null: false
    t.integer "report_line_id", null: false
  end

  add_index "account_account_financial_report", ["account_id", "report_line_id"], name: "account_account_financial_report_account_id_report_line_id_key", unique: true, using: :btree
  add_index "account_account_financial_report", ["account_id"], name: "account_account_financial_report_account_id_index", using: :btree
  add_index "account_account_financial_report", ["report_line_id"], name: "account_account_financial_report_report_line_id_index", using: :btree

  create_table "account_account_financial_report_type", id: false, force: :cascade do |t|
    t.integer "report_id",       null: false
    t.integer "account_type_id", null: false
  end

  add_index "account_account_financial_report_type", ["account_type_id"], name: "account_account_financial_report_type_account_type_id_index", using: :btree
  add_index "account_account_financial_report_type", ["report_id", "account_type_id"], name: "account_account_financial_report__report_id_account_type_id_key", unique: true, using: :btree
  add_index "account_account_financial_report_type", ["report_id"], name: "account_account_financial_report_type_report_id_index", using: :btree

  create_table "account_account_tax_default_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "tax_id",     null: false
  end

  add_index "account_account_tax_default_rel", ["account_id", "tax_id"], name: "account_account_tax_default_rel_account_id_tax_id_key", unique: true, using: :btree
  add_index "account_account_tax_default_rel", ["account_id"], name: "account_account_tax_default_rel_account_id_index", using: :btree
  add_index "account_account_tax_default_rel", ["tax_id"], name: "account_account_tax_default_rel_tax_id_index", using: :btree

  create_table "account_account_template", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",              limit: 64, null: false
    t.datetime "create_date"
    t.string   "name",                         null: false
    t.integer  "currency_id"
    t.integer  "user_type",                    null: false
    t.integer  "chart_template_id"
    t.string   "shortcut",          limit: 12
    t.integer  "write_uid"
    t.text     "note"
    t.integer  "parent_id"
    t.boolean  "nocreate"
    t.datetime "write_date"
    t.boolean  "reconcile"
    t.string   "type",                         null: false
  end

  add_index "account_account_template", ["code"], name: "account_account_template_code_index", using: :btree
  add_index "account_account_template", ["name"], name: "account_account_template_name_index", using: :btree

  create_table "account_account_template_tax_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "tax_id",     null: false
  end

  add_index "account_account_template_tax_rel", ["account_id", "tax_id"], name: "account_account_template_tax_rel_account_id_tax_id_key", unique: true, using: :btree
  add_index "account_account_template_tax_rel", ["account_id"], name: "account_account_template_tax_rel_account_id_index", using: :btree
  add_index "account_account_template_tax_rel", ["tax_id"], name: "account_account_template_tax_rel_tax_id_index", using: :btree

  create_table "account_account_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",         limit: 32, null: false
    t.datetime "create_date"
    t.string   "name",                    null: false
    t.integer  "write_uid"
    t.text     "note"
    t.string   "close_method",            null: false
    t.string   "report_type",             null: false
    t.datetime "write_date"
  end

  add_index "account_account_type", ["code"], name: "account_account_type_code_index", using: :btree

  create_table "account_account_type_rel", id: false, force: :cascade do |t|
    t.integer "journal_id", null: false
    t.integer "account_id", null: false
  end

  add_index "account_account_type_rel", ["account_id"], name: "account_account_type_rel_account_id_index", using: :btree
  add_index "account_account_type_rel", ["journal_id", "account_id"], name: "account_account_type_rel_journal_id_account_id_key", unique: true, using: :btree
  add_index "account_account_type_rel", ["journal_id"], name: "account_account_type_rel_journal_id_index", using: :btree

  create_table "account_addtmpl_wizard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "cparent_id",  null: false
  end

  create_table "account_aged_trial_balance", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id",    null: false
    t.integer  "period_length",       null: false
    t.integer  "period_to"
    t.date     "date_from"
    t.string   "direction_selection", null: false
    t.string   "result_selection",    null: false
    t.string   "filter",              null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",         null: false
  end

  create_table "account_aged_trial_balance_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_aged_trial_balance_journal_rel", ["account_id", "journal_id"], name: "account_aged_trial_balance_journal_re_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_aged_trial_balance_journal_rel", ["account_id"], name: "account_aged_trial_balance_journal_rel_account_id_index", using: :btree
  add_index "account_aged_trial_balance_journal_rel", ["journal_id"], name: "account_aged_trial_balance_journal_rel_journal_id_index", using: :btree

  create_table "account_analytic_account", force: :cascade do |t|
    t.string   "code"
    t.datetime "create_date"
    t.float    "quantity_max"
    t.integer  "write_uid"
    t.integer  "currency_id"
    t.integer  "partner_id"
    t.integer  "create_uid"
    t.integer  "user_id"
    t.date     "date_start"
    t.datetime "message_last_post"
    t.integer  "company_id"
    t.integer  "parent_id"
    t.string   "state",             null: false
    t.integer  "manager_id"
    t.string   "type",              null: false
    t.text     "description"
    t.datetime "write_date"
    t.date     "date"
    t.string   "name",              null: false
    t.integer  "template_id"
  end

  add_index "account_analytic_account", ["code"], name: "account_analytic_account_code_index", using: :btree
  add_index "account_analytic_account", ["date"], name: "account_analytic_account_date_index", using: :btree
  add_index "account_analytic_account", ["parent_id"], name: "account_analytic_account_parent_id_index", using: :btree

  create_table "account_analytic_balance", force: :cascade do |t|
    t.date     "date1",       null: false
    t.integer  "create_uid"
    t.date     "date2",       null: false
    t.datetime "create_date"
    t.boolean  "empty_acc"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_analytic_chart", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "write_date"
  end

  create_table "account_analytic_cost_ledger", force: :cascade do |t|
    t.date     "date1",       null: false
    t.integer  "create_uid"
    t.date     "date2",       null: false
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_analytic_cost_ledger_journal_report", force: :cascade do |t|
    t.date     "date1",       null: false
    t.integer  "create_uid"
    t.date     "date2",       null: false
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_analytic_inverted_balance", force: :cascade do |t|
    t.date     "date1",       null: false
    t.integer  "create_uid"
    t.date     "date2",       null: false
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_analytic_journal", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 8
    t.datetime "create_date"
    t.string   "name",                  null: false
    t.integer  "company_id",            null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "type",                  null: false
  end

  create_table "account_analytic_journal_name", id: false, force: :cascade do |t|
    t.integer "journal_line_id",  null: false
    t.integer "journal_print_id", null: false
  end

  add_index "account_analytic_journal_name", ["journal_line_id", "journal_print_id"], name: "account_analytic_journal_name_journal_line_id_journal_print_key", unique: true, using: :btree
  add_index "account_analytic_journal_name", ["journal_line_id"], name: "account_analytic_journal_name_journal_line_id_index", using: :btree
  add_index "account_analytic_journal_name", ["journal_print_id"], name: "account_analytic_journal_name_journal_print_id_index", using: :btree

  create_table "account_analytic_journal_report", force: :cascade do |t|
    t.date     "date1",       null: false
    t.integer  "create_uid"
    t.date     "date2",       null: false
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_analytic_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "user_id"
    t.integer  "account_id",                   null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.decimal  "amount",                       null: false
    t.float    "unit_amount"
    t.date     "date",                         null: false
    t.datetime "create_date"
    t.datetime "write_date"
    t.string   "name",                         null: false
    t.string   "code",               limit: 8
    t.integer  "general_account_id",           null: false
    t.integer  "product_uom_id"
    t.integer  "journal_id",                   null: false
    t.integer  "currency_id"
    t.integer  "product_id"
    t.decimal  "amount_currency"
    t.string   "ref"
    t.integer  "move_id"
  end

  add_index "account_analytic_line", ["account_id"], name: "account_analytic_line_account_id_index", using: :btree
  add_index "account_analytic_line", ["date"], name: "account_analytic_line_date_index", using: :btree
  add_index "account_analytic_line", ["journal_id"], name: "account_analytic_line_journal_id_index", using: :btree
  add_index "account_analytic_line", ["move_id"], name: "account_analytic_line_move_id_index", using: :btree

  create_table "account_automatic_reconcile", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "power",           null: false
    t.float    "max_amount"
    t.integer  "unreconciled"
    t.integer  "reconciled"
    t.integer  "journal_id"
    t.boolean  "allow_write_off"
    t.integer  "writeoff_acc_id"
    t.integer  "period_id"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_balance_report", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.string   "display_account",  null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_balance_report_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_balance_report_journal_rel", ["account_id", "journal_id"], name: "account_balance_report_journal_rel_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_balance_report_journal_rel", ["account_id"], name: "account_balance_report_journal_rel_account_id_index", using: :btree
  add_index "account_balance_report_journal_rel", ["journal_id"], name: "account_balance_report_journal_rel_journal_id_index", using: :btree

  create_table "account_bank_accounts_wizard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "bank_account_id", null: false
    t.string   "acc_name",        null: false
    t.integer  "write_uid"
    t.integer  "currency_id"
    t.datetime "write_date"
    t.string   "account_type"
  end

  create_table "account_bank_statement", force: :cascade do |t|
    t.datetime "create_date"
    t.decimal  "balance_start"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "create_uid"
    t.integer  "user_id"
    t.datetime "message_last_post"
    t.integer  "journal_id",           null: false
    t.string   "state",                null: false
    t.integer  "period_id",            null: false
    t.decimal  "total_entry_encoding"
    t.datetime "write_date"
    t.date     "date",                 null: false
    t.string   "name"
    t.datetime "closing_date"
    t.decimal  "balance_end"
    t.decimal  "balance_end_real"
  end

  add_index "account_bank_statement", ["date"], name: "account_bank_statement_date_index", using: :btree

  create_table "account_bank_statement_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.text     "note"
    t.datetime "create_date"
    t.integer  "statement_id",     null: false
    t.string   "name",             null: false
    t.integer  "sequence"
    t.string   "partner_name"
    t.string   "ref"
    t.integer  "journal_id"
    t.decimal  "amount_currency"
    t.integer  "company_id"
    t.integer  "currency_id"
    t.decimal  "amount"
    t.datetime "write_date"
    t.integer  "bank_account_id"
    t.date     "date",             null: false
    t.integer  "journal_entry_id"
    t.integer  "write_uid"
    t.integer  "partner_id"
    t.integer  "account_id"
  end

  add_index "account_bank_statement_line", ["sequence"], name: "account_bank_statement_line_sequence_index", using: :btree
  add_index "account_bank_statement_line", ["statement_id"], name: "account_bank_statement_line_statement_id_index", using: :btree

  create_table "account_cashbox_line", force: :cascade do |t|
    t.integer  "bank_statement_id"
    t.datetime "create_date"
    t.integer  "create_uid"
    t.decimal  "pieces"
    t.integer  "number_closing"
    t.datetime "write_date"
    t.integer  "number_opening"
    t.integer  "write_uid"
  end

  create_table "account_central_journal", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.boolean  "amount_currency"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_central_journal_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_central_journal_journal_rel", ["account_id", "journal_id"], name: "account_central_journal_journal_rel_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_central_journal_journal_rel", ["account_id"], name: "account_central_journal_journal_rel_account_id_index", using: :btree
  add_index "account_central_journal_journal_rel", ["journal_id"], name: "account_central_journal_journal_rel_journal_id_index", using: :btree

  create_table "account_change_currency", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "currency_id", null: false
    t.datetime "write_date"
  end

  create_table "account_chart", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "period_to"
    t.integer  "write_uid"
    t.integer  "period_from"
    t.datetime "write_date"
    t.string   "target_move", null: false
    t.integer  "fiscalyear"
  end

  create_table "account_chart_template", force: :cascade do |t|
    t.integer  "property_account_income_opening"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "currency_id"
    t.boolean  "visible"
    t.integer  "tax_code_root_id"
    t.integer  "property_account_income"
    t.integer  "create_uid"
    t.boolean  "complete_tax_set"
    t.integer  "property_account_payable"
    t.integer  "parent_id"
    t.integer  "bank_account_view_id"
    t.integer  "property_account_expense_categ"
    t.integer  "property_account_expense_opening"
    t.datetime "write_date"
    t.integer  "property_account_income_categ"
    t.integer  "code_digits",                      null: false
    t.string   "name",                             null: false
    t.integer  "property_account_expense"
    t.integer  "property_account_receivable"
    t.integer  "account_root_id"
  end

  create_table "account_common_account_report", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.string   "display_account",  null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_common_account_report_account_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_common_account_report_id", null: false
    t.integer "account_journal_id",               null: false
  end

  add_index "account_common_account_report_account_journal_rel", ["account_common_account_report_id", "account_journal_id"], name: "account_common_account_report_account_common_account_report_key", unique: true, using: :btree
  add_index "account_common_account_report_account_journal_rel", ["account_common_account_report_id"], name: "account_common_account_report_account_journal_rel_account_commo", using: :btree
  add_index "account_common_account_report_account_journal_rel", ["account_journal_id"], name: "account_common_account_report_account_journal_rel_account_journ", using: :btree

  create_table "account_common_journal_report", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.boolean  "amount_currency"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_common_journal_report_account_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_common_journal_report_id", null: false
    t.integer "account_journal_id",               null: false
  end

  add_index "account_common_journal_report_account_journal_rel", ["account_common_journal_report_id", "account_journal_id"], name: "account_common_journal_report_account_common_journal_report_key", unique: true, using: :btree
  add_index "account_common_journal_report_account_journal_rel", ["account_common_journal_report_id"], name: "account_common_journal_report_account_journal_rel_account_commo", using: :btree
  add_index "account_common_journal_report_account_journal_rel", ["account_journal_id"], name: "account_common_journal_report_account_journal_rel_account_journ", using: :btree

  create_table "account_common_partner_report", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.integer  "period_to"
    t.date     "date_from"
    t.string   "result_selection", null: false
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_common_partner_report_account_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_common_partner_report_id", null: false
    t.integer "account_journal_id",               null: false
  end

  add_index "account_common_partner_report_account_journal_rel", ["account_common_partner_report_id", "account_journal_id"], name: "account_common_partner_report_account_common_partner_report_key", unique: true, using: :btree
  add_index "account_common_partner_report_account_journal_rel", ["account_common_partner_report_id"], name: "account_common_partner_report_account_journal_rel_account_commo", using: :btree
  add_index "account_common_partner_report_account_journal_rel", ["account_journal_id"], name: "account_common_partner_report_account_journal_rel_account_journ", using: :btree

  create_table "account_common_report", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_common_report_account_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_common_report_id", null: false
    t.integer "account_journal_id",       null: false
  end

  add_index "account_common_report_account_journal_rel", ["account_common_report_id", "account_journal_id"], name: "account_common_report_account_account_common_report_id_acco_key", unique: true, using: :btree
  add_index "account_common_report_account_journal_rel", ["account_common_report_id"], name: "account_common_report_account_journal_rel_account_common_report", using: :btree
  add_index "account_common_report_account_journal_rel", ["account_journal_id"], name: "account_common_report_account_journal_rel_account_journal_id_in", using: :btree

  create_table "account_config_settings", force: :cascade do |t|
    t.date     "date_stop",                            null: false
    t.integer  "sale_journal_id"
    t.boolean  "module_account_voucher"
    t.boolean  "module_account_asset"
    t.string   "period",                               null: false
    t.integer  "write_uid"
    t.boolean  "module_account_accountant"
    t.boolean  "module_account_followup"
    t.integer  "purchase_journal_id"
    t.datetime "create_date"
    t.boolean  "has_chart_of_accounts"
    t.integer  "sale_refund_journal_id"
    t.integer  "create_uid"
    t.boolean  "complete_tax_set"
    t.boolean  "module_account_budget"
    t.date     "date_start",                           null: false
    t.integer  "purchase_refund_journal_id"
    t.integer  "company_id",                           null: false
    t.boolean  "group_check_supplier_invoice_total"
    t.boolean  "group_multi_currency"
    t.boolean  "group_proforma_invoices"
    t.integer  "default_purchase_tax"
    t.boolean  "module_product_email_template"
    t.boolean  "has_default_company"
    t.float    "purchase_tax_rate"
    t.integer  "decimal_precision"
    t.integer  "default_sale_tax"
    t.boolean  "has_fiscal_year"
    t.boolean  "module_account_payment"
    t.integer  "sale_tax"
    t.integer  "purchase_tax"
    t.boolean  "module_account_check_writing"
    t.integer  "code_digits"
    t.datetime "write_date"
    t.float    "sale_tax_rate"
    t.integer  "chart_template_id"
    t.boolean  "group_analytic_accounting"
    t.boolean  "module_payment_paypal"
    t.boolean  "module_payment_buckaroo"
    t.boolean  "module_payment_adyen"
    t.boolean  "module_payment_ogone"
    t.boolean  "module_purchase_analytic_plans"
    t.boolean  "group_analytic_account_for_purchases"
  end

  create_table "account_financial_report", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",              null: false
    t.integer  "sequence"
    t.integer  "account_report_id"
    t.integer  "style_overwrite"
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.string   "display_detail"
    t.integer  "sign",              null: false
    t.string   "type"
    t.integer  "level"
  end

  create_table "account_fiscal_position", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "country_group_id"
    t.datetime "create_date"
    t.string   "name",             null: false
    t.integer  "sequence"
    t.integer  "country_id"
    t.integer  "company_id"
    t.boolean  "auto_apply"
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.boolean  "vat_required"
    t.boolean  "active"
  end

  create_table "account_fiscal_position_account", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "position_id",     null: false
    t.integer  "write_uid"
    t.integer  "account_dest_id", null: false
    t.datetime "write_date"
    t.integer  "account_src_id",  null: false
  end

  add_index "account_fiscal_position_account", ["position_id", "account_src_id", "account_dest_id"], name: "account_fiscal_position_account_account_src_dest_uniq", unique: true, using: :btree

  create_table "account_fiscal_position_account_template", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "position_id",     null: false
    t.integer  "write_uid"
    t.integer  "account_dest_id", null: false
    t.datetime "write_date"
    t.integer  "account_src_id",  null: false
  end

  create_table "account_fiscal_position_tax", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "position_id", null: false
    t.integer  "tax_src_id",  null: false
    t.integer  "write_uid"
    t.integer  "tax_dest_id"
    t.datetime "write_date"
  end

  add_index "account_fiscal_position_tax", ["position_id", "tax_src_id", "tax_dest_id"], name: "account_fiscal_position_tax_tax_src_dest_uniq", unique: true, using: :btree

  create_table "account_fiscal_position_tax_template", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "position_id", null: false
    t.integer  "tax_src_id",  null: false
    t.integer  "write_uid"
    t.integer  "tax_dest_id"
    t.datetime "write_date"
  end

  create_table "account_fiscal_position_template", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",              null: false
    t.integer  "chart_template_id", null: false
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
  end

  create_table "account_fiscalyear", force: :cascade do |t|
    t.integer  "create_uid"
    t.date     "date_stop",                       null: false
    t.string   "code",                  limit: 6, null: false
    t.datetime "create_date"
    t.string   "name",                            null: false
    t.integer  "end_journal_period_id"
    t.date     "date_start",                      null: false
    t.integer  "company_id",                      null: false
    t.integer  "write_uid"
    t.string   "state"
    t.datetime "write_date"
  end

  create_table "account_fiscalyear_close", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "journal_id",  null: false
    t.string   "report_name", null: false
    t.integer  "fy2_id",      null: false
    t.integer  "period_id",   null: false
    t.datetime "write_date"
    t.integer  "fy_id",       null: false
    t.integer  "write_uid"
  end

  create_table "account_fiscalyear_close_state", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "fy_id",       null: false
  end

  create_table "account_general_journal", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.boolean  "amount_currency"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_general_journal_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_general_journal_journal_rel", ["account_id", "journal_id"], name: "account_general_journal_journal_rel_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_general_journal_journal_rel", ["account_id"], name: "account_general_journal_journal_rel_account_id_index", using: :btree
  add_index "account_general_journal_journal_rel", ["journal_id"], name: "account_general_journal_journal_rel_journal_id_index", using: :btree

  create_table "account_installer", force: :cascade do |t|
    t.integer  "create_uid"
    t.date     "date_stop",           null: false
    t.datetime "create_date"
    t.date     "date_start",          null: false
    t.string   "charts",              null: false
    t.integer  "company_id",          null: false
    t.string   "period",              null: false
    t.datetime "write_date"
    t.boolean  "has_default_company"
    t.integer  "write_uid"
  end

  create_table "account_invoice", force: :cascade do |t|
    t.text     "comment"
    t.date     "date_due"
    t.decimal  "check_total"
    t.string   "reference"
    t.integer  "payment_term"
    t.string   "number"
    t.datetime "message_last_post"
    t.integer  "company_id",              null: false
    t.integer  "currency_id",             null: false
    t.datetime "create_date"
    t.integer  "create_uid"
    t.integer  "fiscal_position"
    t.decimal  "amount_untaxed"
    t.integer  "partner_bank_id"
    t.integer  "partner_id",              null: false
    t.string   "supplier_invoice_number"
    t.string   "reference_type",          null: false
    t.integer  "journal_id",              null: false
    t.decimal  "amount_tax"
    t.string   "state"
    t.integer  "move_id"
    t.string   "type"
    t.string   "internal_number"
    t.integer  "account_id",              null: false
    t.boolean  "reconciled"
    t.decimal  "residual"
    t.string   "move_name"
    t.date     "date_invoice"
    t.integer  "period_id"
    t.datetime "write_date"
    t.integer  "user_id"
    t.integer  "write_uid"
    t.string   "origin"
    t.decimal  "amount_total"
    t.string   "name"
    t.boolean  "sent"
    t.integer  "commercial_partner_id"
  end

  add_index "account_invoice", ["date_due"], name: "account_invoice_date_due_index", using: :btree
  add_index "account_invoice", ["date_invoice"], name: "account_invoice_date_invoice_index", using: :btree
  add_index "account_invoice", ["move_id"], name: "account_invoice_move_id_index", using: :btree
  add_index "account_invoice", ["name"], name: "account_invoice_name_index", using: :btree
  add_index "account_invoice", ["number", "company_id", "journal_id", "type"], name: "account_invoice_number_uniq", unique: true, using: :btree
  add_index "account_invoice", ["state"], name: "account_invoice_state_index", using: :btree
  add_index "account_invoice", ["type"], name: "account_invoice_type_index", using: :btree

  create_table "account_invoice_cancel", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_invoice_confirm", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_invoice_line", force: :cascade do |t|
    t.string   "origin"
    t.integer  "create_uid"
    t.integer  "uos_id"
    t.datetime "create_date"
    t.integer  "account_id",          null: false
    t.integer  "sequence"
    t.integer  "invoice_id"
    t.decimal  "price_unit",          null: false
    t.decimal  "price_subtotal"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.decimal  "discount"
    t.integer  "product_id"
    t.datetime "write_date"
    t.integer  "account_analytic_id"
    t.integer  "partner_id"
    t.decimal  "quantity",            null: false
    t.text     "name",                null: false
    t.integer  "purchase_line_id"
  end

  add_index "account_invoice_line", ["invoice_id"], name: "account_invoice_line_invoice_id_index", using: :btree
  add_index "account_invoice_line", ["product_id"], name: "account_invoice_line_product_id_index", using: :btree
  add_index "account_invoice_line", ["purchase_line_id"], name: "account_invoice_line_purchase_line_id_index", using: :btree
  add_index "account_invoice_line", ["uos_id"], name: "account_invoice_line_uos_id_index", using: :btree

  create_table "account_invoice_line_tax", id: false, force: :cascade do |t|
    t.integer "invoice_line_id", null: false
    t.integer "tax_id",          null: false
  end

  add_index "account_invoice_line_tax", ["invoice_line_id", "tax_id"], name: "account_invoice_line_tax_invoice_line_id_tax_id_key", unique: true, using: :btree
  add_index "account_invoice_line_tax", ["invoice_line_id"], name: "account_invoice_line_tax_invoice_line_id_index", using: :btree
  add_index "account_invoice_line_tax", ["tax_id"], name: "account_invoice_line_tax_tax_id_index", using: :btree

  create_table "account_invoice_refund", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "filter_refund", null: false
    t.datetime "create_date"
    t.string   "description",   null: false
    t.integer  "journal_id"
    t.integer  "period"
    t.datetime "write_date"
    t.date     "date"
    t.integer  "write_uid"
  end

  create_table "account_invoice_tax", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "account_id",          null: false
    t.integer  "sequence"
    t.integer  "company_id"
    t.integer  "invoice_id"
    t.boolean  "manual"
    t.decimal  "base_amount"
    t.integer  "write_uid"
    t.integer  "tax_code_id"
    t.decimal  "amount"
    t.decimal  "base"
    t.datetime "write_date"
    t.integer  "account_analytic_id"
    t.decimal  "tax_amount"
    t.integer  "base_code_id"
    t.string   "name",                null: false
  end

  add_index "account_invoice_tax", ["invoice_id"], name: "account_invoice_tax_invoice_id_index", using: :btree

  create_table "account_journal", force: :cascade do |t|
    t.string   "code",                      limit: 5,  null: false
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "loss_account_id"
    t.integer  "currency"
    t.integer  "internal_account_id"
    t.integer  "create_uid"
    t.integer  "user_id"
    t.boolean  "cash_control"
    t.boolean  "centralisation"
    t.integer  "company_id",                           null: false
    t.integer  "profit_account_id"
    t.string   "type",                      limit: 32, null: false
    t.integer  "default_debit_account_id"
    t.integer  "default_credit_account_id"
    t.integer  "sequence_id",                          null: false
    t.datetime "write_date"
    t.boolean  "allow_date"
    t.boolean  "update_posted"
    t.string   "name",                                 null: false
    t.integer  "analytic_journal_id"
    t.boolean  "with_last_closing_balance"
    t.boolean  "entry_posted"
    t.boolean  "group_invoice_lines"
  end

  add_index "account_journal", ["code", "company_id"], name: "account_journal_code_company_uniq", unique: true, using: :btree
  add_index "account_journal", ["company_id"], name: "account_journal_company_id_index", using: :btree
  add_index "account_journal", ["internal_account_id"], name: "account_journal_internal_account_id_index", using: :btree
  add_index "account_journal", ["name", "company_id"], name: "account_journal_name_company_uniq", unique: true, using: :btree

  create_table "account_journal_account_vat_declaration_rel", id: false, force: :cascade do |t|
    t.integer "account_vat_declaration_id", null: false
    t.integer "account_journal_id",         null: false
  end

  add_index "account_journal_account_vat_declaration_rel", ["account_journal_id"], name: "account_journal_account_vat_declaration_rel_account_journal_id_", using: :btree
  add_index "account_journal_account_vat_declaration_rel", ["account_vat_declaration_id", "account_journal_id"], name: "account_journal_account_vat_d_account_vat_declaration_id_ac_key", unique: true, using: :btree
  add_index "account_journal_account_vat_declaration_rel", ["account_vat_declaration_id"], name: "account_journal_account_vat_declaration_rel_account_vat_declara", using: :btree

  create_table "account_journal_accounting_report_rel", id: false, force: :cascade do |t|
    t.integer "accounting_report_id", null: false
    t.integer "account_journal_id",   null: false
  end

  add_index "account_journal_accounting_report_rel", ["account_journal_id"], name: "account_journal_accounting_report_rel_account_journal_id_index", using: :btree
  add_index "account_journal_accounting_report_rel", ["accounting_report_id", "account_journal_id"], name: "account_journal_accounting_re_accounting_report_id_account__key", unique: true, using: :btree
  add_index "account_journal_accounting_report_rel", ["accounting_report_id"], name: "account_journal_accounting_report_rel_accounting_report_id_inde", using: :btree

  create_table "account_journal_cashbox_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "journal_id",  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.decimal  "pieces"
  end

  add_index "account_journal_cashbox_line", ["journal_id"], name: "account_journal_cashbox_line_journal_id_index", using: :btree

  create_table "account_journal_group_rel", id: false, force: :cascade do |t|
    t.integer "journal_id", null: false
    t.integer "group_id",   null: false
  end

  add_index "account_journal_group_rel", ["group_id"], name: "account_journal_group_rel_group_id_index", using: :btree
  add_index "account_journal_group_rel", ["journal_id", "group_id"], name: "account_journal_group_rel_journal_id_group_id_key", unique: true, using: :btree
  add_index "account_journal_group_rel", ["journal_id"], name: "account_journal_group_rel_journal_id_index", using: :btree

  create_table "account_journal_period", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "company_id"
    t.integer  "journal_id",  null: false
    t.string   "state",       null: false
    t.integer  "period_id",   null: false
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "write_uid"
  end

  create_table "account_journal_select", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_journal_type_rel", id: false, force: :cascade do |t|
    t.integer "journal_id", null: false
    t.integer "type_id",    null: false
  end

  add_index "account_journal_type_rel", ["journal_id", "type_id"], name: "account_journal_type_rel_journal_id_type_id_key", unique: true, using: :btree
  add_index "account_journal_type_rel", ["journal_id"], name: "account_journal_type_rel_journal_id_index", using: :btree
  add_index "account_journal_type_rel", ["type_id"], name: "account_journal_type_rel_type_id_index", using: :btree

  create_table "account_model", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "journal_id",  null: false
    t.integer  "company_id"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.text     "legend"
  end

  create_table "account_model_line", force: :cascade do |t|
    t.integer  "analytic_account_id"
    t.integer  "model_id",            null: false
    t.datetime "create_date"
    t.integer  "account_id",          null: false
    t.string   "name",                null: false
    t.integer  "sequence",            null: false
    t.integer  "write_uid"
    t.integer  "currency_id"
    t.decimal  "credit"
    t.string   "date_maturity"
    t.datetime "write_date"
    t.decimal  "debit"
    t.float    "amount_currency"
    t.integer  "partner_id"
    t.integer  "create_uid"
    t.decimal  "quantity"
  end

  add_index "account_model_line", ["model_id"], name: "account_model_line_model_id_index", using: :btree

  create_table "account_move", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "partner_id"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "journal_id",  null: false
    t.string   "state",       null: false
    t.integer  "period_id",   null: false
    t.datetime "write_date"
    t.text     "narration"
    t.date     "date",        null: false
    t.decimal  "balance"
    t.string   "ref"
    t.boolean  "to_check"
  end

  add_index "account_move", ["date"], name: "account_move_date_index", using: :btree

  create_table "account_move_bank_reconcile", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "journal_id",  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_move_line", force: :cascade do |t|
    t.datetime "create_date"
    t.integer  "statement_id"
    t.integer  "company_id"
    t.integer  "currency_id"
    t.date     "date_maturity"
    t.integer  "partner_id"
    t.integer  "reconcile_partial_id"
    t.boolean  "blocked"
    t.integer  "analytic_account_id"
    t.integer  "create_uid"
    t.decimal  "credit"
    t.string   "centralisation",       limit: 8
    t.integer  "journal_id",                     null: false
    t.string   "reconcile_ref"
    t.integer  "tax_code_id"
    t.string   "state"
    t.decimal  "debit"
    t.string   "ref"
    t.integer  "account_id",                     null: false
    t.integer  "period_id",                      null: false
    t.datetime "write_date"
    t.date     "date_created"
    t.date     "date",                           null: false
    t.integer  "write_uid"
    t.integer  "move_id",                        null: false
    t.string   "name",                           null: false
    t.integer  "reconcile_id"
    t.decimal  "tax_amount"
    t.integer  "product_id"
    t.integer  "account_tax_id"
    t.integer  "product_uom_id"
    t.decimal  "amount_currency"
    t.decimal  "quantity"
  end

  add_index "account_move_line", ["account_id"], name: "account_move_line_account_id_index", using: :btree
  add_index "account_move_line", ["date", "id"], name: "account_move_line_date_id_index", order: {"date"=>:desc, "id"=>:desc}, using: :btree
  add_index "account_move_line", ["date"], name: "account_move_line_date_index", using: :btree
  add_index "account_move_line", ["date_created"], name: "account_move_line_date_created_index", using: :btree
  add_index "account_move_line", ["date_maturity"], name: "account_move_line_date_maturity_index", using: :btree
  add_index "account_move_line", ["journal_id", "period_id"], name: "account_move_line_journal_id_period_id_index", using: :btree
  add_index "account_move_line", ["journal_id"], name: "account_move_line_journal_id_index", using: :btree
  add_index "account_move_line", ["move_id"], name: "account_move_line_move_id_index", using: :btree
  add_index "account_move_line", ["partner_id"], name: "account_move_line_partner_id_index", using: :btree
  add_index "account_move_line", ["period_id"], name: "account_move_line_period_id_index", using: :btree
  add_index "account_move_line", ["reconcile_id"], name: "account_move_line_reconcile_id_index", using: :btree
  add_index "account_move_line", ["reconcile_partial_id"], name: "account_move_line_reconcile_partial_id_index", using: :btree
  add_index "account_move_line", ["statement_id"], name: "account_move_line_statement_id_index", using: :btree
  add_index "account_move_line", ["tax_amount"], name: "account_move_line_tax_amount_index", using: :btree

  create_table "account_move_line_reconcile", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.decimal  "writeoff"
    t.integer  "write_uid"
    t.decimal  "credit"
    t.datetime "write_date"
    t.decimal  "debit"
    t.integer  "trans_nbr"
  end

  create_table "account_move_line_reconcile_select", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "account_id",  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_move_line_reconcile_writeoff", force: :cascade do |t|
    t.string   "comment",         null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "writeoff_acc_id", null: false
    t.integer  "journal_id",      null: false
    t.integer  "analytic_id"
    t.datetime "write_date"
    t.date     "date_p"
    t.integer  "write_uid"
  end

  create_table "account_move_line_relation", id: false, force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "line_id", null: false
  end

  add_index "account_move_line_relation", ["line_id"], name: "account_move_line_relation_line_id_index", using: :btree
  add_index "account_move_line_relation", ["move_id", "line_id"], name: "account_move_line_relation_move_id_line_id_key", unique: true, using: :btree
  add_index "account_move_line_relation", ["move_id"], name: "account_move_line_relation_move_id_index", using: :btree

  create_table "account_move_line_unreconcile_select", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "account_id",  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_move_reconcile", force: :cascade do |t|
    t.integer  "create_uid"
    t.date     "create_date"
    t.string   "name",                   null: false
    t.boolean  "opening_reconciliation"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "type",                   null: false
  end

  create_table "account_open_closed_fiscalyear", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "fyear_id",    null: false
  end

  create_table "account_partner_balance", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "display_partner"
    t.integer  "chart_account_id", null: false
    t.string   "result_selection", null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_partner_balance_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_partner_balance_journal_rel", ["account_id", "journal_id"], name: "account_partner_balance_journal_rel_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_partner_balance_journal_rel", ["account_id"], name: "account_partner_balance_journal_rel_account_id_index", using: :btree
  add_index "account_partner_balance_journal_rel", ["journal_id"], name: "account_partner_balance_journal_rel_journal_id_index", using: :btree

  create_table "account_partner_ledger", force: :cascade do |t|
    t.integer  "create_uid"
    t.boolean  "initial_balance"
    t.integer  "chart_account_id", null: false
    t.boolean  "page_split"
    t.integer  "period_to"
    t.date     "date_from"
    t.string   "result_selection", null: false
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.boolean  "amount_currency"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_partner_ledger_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_partner_ledger_journal_rel", ["account_id", "journal_id"], name: "account_partner_ledger_journal_rel_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_partner_ledger_journal_rel", ["account_id"], name: "account_partner_ledger_journal_rel_account_id_index", using: :btree
  add_index "account_partner_ledger_journal_rel", ["journal_id"], name: "account_partner_ledger_journal_rel_journal_id_index", using: :btree

  create_table "account_partner_reconcile_process", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "next_partner_id"
    t.datetime "create_date"
    t.float    "to_reconcile"
    t.integer  "write_uid"
    t.float    "today_reconciled"
    t.datetime "write_date"
    t.float    "progress"
  end

  create_table "account_payment_term", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.boolean  "active"
  end

  create_table "account_payment_term_line", force: :cascade do |t|
    t.integer  "payment_id",   null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "days2",        null: false
    t.integer  "days",         null: false
    t.string   "value",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.decimal  "value_amount"
  end

  add_index "account_payment_term_line", ["payment_id"], name: "account_payment_term_line_payment_id_index", using: :btree

  create_table "account_period", force: :cascade do |t|
    t.integer  "create_uid"
    t.date     "date_stop",                null: false
    t.string   "code",          limit: 12
    t.datetime "create_date"
    t.string   "name",                     null: false
    t.date     "date_start",               null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "fiscalyear_id",            null: false
    t.string   "state"
    t.datetime "write_date"
    t.boolean  "special"
  end

  add_index "account_period", ["fiscalyear_id"], name: "account_period_fiscalyear_id_index", using: :btree
  add_index "account_period", ["name", "company_id"], name: "account_period_name_company_uniq", unique: true, using: :btree

  create_table "account_period_close", force: :cascade do |t|
    t.integer  "create_uid"
    t.boolean  "sure"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_print_journal", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.string   "sort_selection",   null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.date     "date_to"
    t.boolean  "amount_currency"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "account_print_journal_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_print_journal_journal_rel", ["account_id", "journal_id"], name: "account_print_journal_journal_rel_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_print_journal_journal_rel", ["account_id"], name: "account_print_journal_journal_rel_account_id_index", using: :btree
  add_index "account_print_journal_journal_rel", ["journal_id"], name: "account_print_journal_journal_rel_journal_id_index", using: :btree

  create_table "account_report_general_ledger", force: :cascade do |t|
    t.integer  "create_uid"
    t.boolean  "initial_balance"
    t.string   "target_move",      null: false
    t.integer  "chart_account_id", null: false
    t.string   "display_account",  null: false
    t.date     "date_from"
    t.integer  "period_to"
    t.integer  "write_uid"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.string   "sortby",           null: false
    t.datetime "write_date"
    t.date     "date_to"
    t.datetime "create_date"
    t.boolean  "amount_currency"
    t.boolean  "landscape"
  end

  create_table "account_report_general_ledger_journal_rel", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "journal_id", null: false
  end

  add_index "account_report_general_ledger_journal_rel", ["account_id", "journal_id"], name: "account_report_general_ledger_journal_account_id_journal_id_key", unique: true, using: :btree
  add_index "account_report_general_ledger_journal_rel", ["account_id"], name: "account_report_general_ledger_journal_rel_account_id_index", using: :btree
  add_index "account_report_general_ledger_journal_rel", ["journal_id"], name: "account_report_general_ledger_journal_rel_journal_id_index", using: :btree

  create_table "account_sequence_fiscalyear", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "fiscalyear_id",    null: false
    t.integer  "write_uid"
    t.integer  "sequence_id",      null: false
    t.datetime "write_date"
    t.integer  "sequence_main_id", null: false
  end

  create_table "account_state_open", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_statement_from_invoice_lines", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_statement_operation_template", force: :cascade do |t|
    t.string   "amount_type",         null: false
    t.integer  "analytic_account_id"
    t.datetime "create_date"
    t.integer  "account_id"
    t.string   "name",                null: false
    t.integer  "create_uid"
    t.string   "label"
    t.decimal  "amount",              null: false
    t.datetime "write_date"
    t.integer  "write_uid"
    t.integer  "tax_id"
  end

  create_table "account_subscription", force: :cascade do |t|
    t.integer  "model_id",     null: false
    t.integer  "period_nbr",   null: false
    t.datetime "create_date"
    t.string   "name",         null: false
    t.integer  "create_uid"
    t.date     "date_start",   null: false
    t.integer  "write_uid"
    t.integer  "period_total", null: false
    t.string   "state",        null: false
    t.string   "period_type",  null: false
    t.datetime "write_date"
    t.string   "ref"
  end

  create_table "account_subscription_generate", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.date     "date",        null: false
  end

  create_table "account_subscription_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.date     "date",            null: false
    t.integer  "subscription_id", null: false
    t.integer  "move_id"
  end

  add_index "account_subscription_line", ["subscription_id"], name: "account_subscription_line_subscription_id_index", using: :btree

  create_table "account_tax", force: :cascade do |t|
    t.string   "domain"
    t.datetime "create_date"
    t.integer  "account_analytic_paid_id"
    t.integer  "ref_tax_code_id"
    t.integer  "sequence",                      null: false
    t.integer  "account_paid_id"
    t.integer  "write_uid"
    t.decimal  "base_sign"
    t.boolean  "child_depend"
    t.boolean  "include_base_amount"
    t.integer  "create_uid"
    t.decimal  "ref_tax_sign"
    t.string   "applicable_type",               null: false
    t.integer  "company_id",                    null: false
    t.integer  "tax_code_id"
    t.integer  "parent_id"
    t.text     "python_compute_inv"
    t.text     "python_applicable"
    t.string   "type",                          null: false
    t.decimal  "ref_base_sign"
    t.string   "description"
    t.string   "type_tax_use",                  null: false
    t.integer  "base_code_id"
    t.integer  "account_analytic_collected_id"
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "ref_base_code_id"
    t.string   "name",                          null: false
    t.integer  "account_collected_id"
    t.decimal  "amount",                        null: false
    t.text     "python_compute"
    t.decimal  "tax_sign"
    t.boolean  "price_include"
  end

  add_index "account_tax", ["name", "company_id"], name: "account_tax_name_company_uniq", unique: true, using: :btree
  add_index "account_tax", ["parent_id"], name: "account_tax_parent_id_index", using: :btree

  create_table "account_tax_chart", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "period_id"
    t.datetime "write_date"
    t.string   "target_move", null: false
  end

  create_table "account_tax_code", force: :cascade do |t|
    t.text     "info"
    t.integer  "create_uid"
    t.string   "code",         limit: 64
    t.datetime "create_date"
    t.string   "name",                    null: false
    t.integer  "sequence"
    t.integer  "company_id",              null: false
    t.float    "sign",                    null: false
    t.boolean  "notprintable"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  add_index "account_tax_code", ["parent_id"], name: "account_tax_code_parent_id_index", using: :btree

  create_table "account_tax_code_template", force: :cascade do |t|
    t.text     "info"
    t.integer  "create_uid"
    t.string   "code",         limit: 64
    t.datetime "create_date"
    t.string   "name",                    null: false
    t.integer  "sequence"
    t.float    "sign",                    null: false
    t.boolean  "notprintable"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  add_index "account_tax_code_template", ["parent_id"], name: "account_tax_code_template_parent_id_index", using: :btree

  create_table "account_tax_template", force: :cascade do |t|
    t.string   "domain"
    t.datetime "create_date"
    t.integer  "ref_tax_code_id"
    t.integer  "sequence",             null: false
    t.integer  "write_uid"
    t.float    "base_sign"
    t.boolean  "child_depend"
    t.boolean  "include_base_amount"
    t.string   "applicable_type",      null: false
    t.integer  "create_uid"
    t.integer  "ref_base_code_id"
    t.string   "name",                 null: false
    t.integer  "tax_code_id"
    t.integer  "parent_id"
    t.text     "python_compute_inv"
    t.float    "ref_tax_sign"
    t.string   "type",                 null: false
    t.float    "ref_base_sign"
    t.string   "description"
    t.string   "type_tax_use",         null: false
    t.integer  "base_code_id"
    t.datetime "write_date"
    t.text     "python_applicable"
    t.integer  "account_paid_id"
    t.integer  "account_collected_id"
    t.integer  "chart_template_id",    null: false
    t.decimal  "amount",               null: false
    t.text     "python_compute"
    t.float    "tax_sign"
    t.boolean  "price_include"
  end

  add_index "account_tax_template", ["parent_id"], name: "account_tax_template_parent_id_index", using: :btree

  create_table "account_template_financial_report", id: false, force: :cascade do |t|
    t.integer "account_template_id", null: false
    t.integer "report_line_id",      null: false
  end

  add_index "account_template_financial_report", ["account_template_id", "report_line_id"], name: "account_template_financial_re_account_template_id_report_li_key", unique: true, using: :btree
  add_index "account_template_financial_report", ["account_template_id"], name: "account_template_financial_report_account_template_id_index", using: :btree
  add_index "account_template_financial_report", ["report_line_id"], name: "account_template_financial_report_report_line_id_index", using: :btree

  create_table "account_unreconcile", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_unreconcile_reconcile", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "account_use_model", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "account_use_model_relation", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "model_id",   null: false
  end

  add_index "account_use_model_relation", ["account_id", "model_id"], name: "account_use_model_relation_account_id_model_id_key", unique: true, using: :btree
  add_index "account_use_model_relation", ["account_id"], name: "account_use_model_relation_account_id_index", using: :btree
  add_index "account_use_model_relation", ["model_id"], name: "account_use_model_relation_model_id_index", using: :btree

  create_table "account_vat_declaration", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "chart_account_id", null: false
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "period_to"
    t.string   "filter",           null: false
    t.integer  "period_from"
    t.integer  "fiscalyear_id"
    t.datetime "write_date"
    t.string   "based_on",         null: false
    t.boolean  "display_detail"
    t.datetime "create_date"
    t.integer  "chart_tax_id",     null: false
    t.integer  "write_uid"
    t.string   "target_move",      null: false
  end

  create_table "accounting_report", force: :cascade do |t|
    t.integer  "period_to_cmp"
    t.integer  "chart_account_id",  null: false
    t.integer  "period_from_cmp"
    t.integer  "account_report_id", null: false
    t.integer  "period_to"
    t.date     "date_to_cmp"
    t.integer  "write_uid"
    t.integer  "fiscalyear_id"
    t.datetime "create_date"
    t.integer  "create_uid"
    t.integer  "fiscalyear_id_cmp"
    t.date     "date_from"
    t.integer  "period_from"
    t.string   "label_filter"
    t.string   "filter_cmp",        null: false
    t.boolean  "enable_filter"
    t.datetime "write_date"
    t.date     "date_to"
    t.string   "filter",            null: false
    t.date     "date_from_cmp"
    t.boolean  "debit_credit"
    t.string   "target_move",       null: false
  end

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
    t.string   "alias_domain"
    t.boolean  "auth_signup_reset_password"
    t.boolean  "auth_signup_uninvited"
    t.integer  "auth_signup_template_user_id"
  end

  create_table "base_import_import", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.string   "file_type"
    t.string   "file_name"
    t.integer  "write_uid"
    t.binary   "file"
    t.string   "res_model"
  end

  create_table "base_import_tests_models_char", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_noreadonly", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_readonly", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_required", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value",       null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_states", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "base_import_tests_models_char_stillreadonly", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "value"
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
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "somevalue",   null: false
  end

  create_table "base_language_export", force: :cascade do |t|
    t.string   "lang",        null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.string   "format",      null: false
    t.integer  "write_uid"
    t.string   "state"
    t.datetime "write_date"
    t.binary   "data"
  end

  create_table "base_language_import", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 5, null: false
    t.datetime "create_date"
    t.string   "name",                  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.binary   "data",                  null: false
    t.boolean  "overwrite"
  end

  create_table "base_language_install", force: :cascade do |t|
    t.string   "lang",        null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.string   "state"
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
    t.string   "state"
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
    t.string   "partner",     null: false
  end

  create_table "base_update_translations", force: :cascade do |t|
    t.string   "lang",        null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "board_create", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",           null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "menu_parent_id", null: false
  end

  create_table "bus_bus", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "message"
    t.string   "channel"
  end

  create_table "cash_box_in", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.decimal  "amount",      null: false
    t.datetime "write_date"
    t.string   "ref"
  end

  create_table "cash_box_out", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.decimal  "amount",      null: false
    t.datetime "write_date"
  end

  create_table "change_password_user", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "user_login"
    t.string   "new_passwd"
    t.integer  "wizard_id",   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "user_id",     null: false
  end

  create_table "change_password_wizard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "crm_case_section", force: :cascade do |t|
    t.string   "code",               limit: 8
    t.decimal  "working_hours"
    t.integer  "color"
    t.integer  "write_uid"
    t.datetime "create_date"
    t.integer  "create_uid"
    t.integer  "user_id"
    t.datetime "message_last_post"
    t.text     "note"
    t.integer  "parent_id"
    t.string   "complete_name",      limit: 256
    t.datetime "write_date"
    t.boolean  "active"
    t.boolean  "change_responsible"
    t.string   "name",               limit: 64,  null: false
    t.string   "reply_to",           limit: 64
  end

  add_index "crm_case_section", ["code"], name: "crm_case_section_code_uniq", unique: true, using: :btree

  create_table "decimal_precision", force: :cascade do |t|
    t.integer  "digits",      null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
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

  create_table "email_template", force: :cascade do |t|
    t.datetime "create_date"
    t.datetime "write_date"
    t.boolean  "auto_delete"
    t.integer  "mail_server_id"
    t.integer  "write_uid"
    t.string   "partner_to"
    t.integer  "ref_ir_act_window"
    t.string   "subject"
    t.integer  "create_uid"
    t.integer  "report_template"
    t.integer  "ref_ir_value"
    t.boolean  "user_signature"
    t.string   "null_value"
    t.string   "email_cc"
    t.integer  "model_id"
    t.integer  "sub_model_object_field"
    t.text     "body_html"
    t.string   "email_to"
    t.integer  "sub_object"
    t.string   "copyvalue"
    t.string   "lang"
    t.string   "name"
    t.integer  "model_object_field"
    t.string   "report_name"
    t.boolean  "use_default_to"
    t.string   "reply_to"
    t.string   "model"
    t.string   "email_from"
  end

  add_index "email_template", ["model"], name: "email_template_model_index", using: :btree

  create_table "email_template_attachment_rel", id: false, force: :cascade do |t|
    t.integer "email_template_id", null: false
    t.integer "attachment_id",     null: false
  end

  add_index "email_template_attachment_rel", ["attachment_id"], name: "email_template_attachment_rel_attachment_id_index", using: :btree
  add_index "email_template_attachment_rel", ["email_template_id", "attachment_id"], name: "email_template_attachment_rel_email_template_id_attachment__key", unique: true, using: :btree
  add_index "email_template_attachment_rel", ["email_template_id"], name: "email_template_attachment_rel_email_template_id_index", using: :btree

  create_table "email_template_preview", force: :cascade do |t|
    t.datetime "create_date"
    t.integer  "sub_object"
    t.boolean  "auto_delete"
    t.integer  "mail_server_id"
    t.integer  "write_uid"
    t.string   "partner_to"
    t.integer  "ref_ir_act_window"
    t.string   "subject"
    t.integer  "create_uid"
    t.integer  "report_template"
    t.integer  "ref_ir_value"
    t.boolean  "user_signature"
    t.string   "null_value"
    t.string   "email_cc"
    t.string   "res_id"
    t.integer  "model_id"
    t.integer  "sub_model_object_field"
    t.text     "body_html"
    t.string   "email_to"
    t.datetime "write_date"
    t.string   "copyvalue"
    t.string   "lang"
    t.string   "name"
    t.integer  "model_object_field"
    t.string   "report_name"
    t.boolean  "use_default_to"
    t.string   "reply_to"
    t.string   "model"
    t.string   "email_from"
  end

  add_index "email_template_preview", ["model"], name: "email_template_preview_model_index", using: :btree

  create_table "email_template_preview_res_partner_rel", id: false, force: :cascade do |t|
    t.integer "email_template_preview_id", null: false
    t.integer "res_partner_id",            null: false
  end

  add_index "email_template_preview_res_partner_rel", ["email_template_preview_id", "res_partner_id"], name: "email_template_preview_res_pa_email_template_preview_id_res_key", unique: true, using: :btree
  add_index "email_template_preview_res_partner_rel", ["email_template_preview_id"], name: "email_template_preview_res_partner_rel_email_template_preview_i", using: :btree
  add_index "email_template_preview_res_partner_rel", ["res_partner_id"], name: "email_template_preview_res_partner_rel_res_partner_id_index", using: :btree

  create_table "employee_category_rel", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "emp_id",      null: false
  end

  add_index "employee_category_rel", ["category_id", "emp_id"], name: "employee_category_rel_category_id_emp_id_key", unique: true, using: :btree
  add_index "employee_category_rel", ["category_id"], name: "employee_category_rel_category_id_index", using: :btree
  add_index "employee_category_rel", ["emp_id"], name: "employee_category_rel_emp_id_index", using: :btree

  create_table "fetchmail_config_settings", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "fetchmail_server", force: :cascade do |t|
    t.datetime "create_date"
    t.integer  "write_uid"
    t.boolean  "active"
    t.integer  "port"
    t.integer  "create_uid"
    t.text     "configuration"
    t.string   "script"
    t.integer  "object_id"
    t.integer  "priority"
    t.boolean  "attach"
    t.string   "state"
    t.string   "type",          null: false
    t.integer  "action_id"
    t.string   "user"
    t.datetime "write_date"
    t.datetime "date"
    t.string   "password"
    t.string   "name",          null: false
    t.boolean  "is_ssl"
    t.string   "server"
    t.boolean  "original"
  end

  add_index "fetchmail_server", ["state"], name: "fetchmail_server_state_index", using: :btree
  add_index "fetchmail_server", ["type"], name: "fetchmail_server_type_index", using: :btree

  create_table "hr_config_settings", force: :cascade do |t|
    t.integer  "create_uid"
    t.boolean  "module_hr_contract"
    t.boolean  "module_hr_holidays"
    t.boolean  "module_hr_timesheet"
    t.boolean  "module_hr_payroll"
    t.boolean  "module_hr_timesheet_sheet"
    t.boolean  "module_hr_attendance"
    t.integer  "write_uid"
    t.boolean  "module_hr_evaluation"
    t.boolean  "module_hr_expense"
    t.datetime "write_date"
    t.boolean  "module_hr_gamification"
    t.datetime "create_date"
    t.boolean  "module_account_analytic_analysis"
    t.boolean  "module_hr_recruitment"
  end

  create_table "hr_department", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.text     "note"
    t.integer  "parent_id"
    t.integer  "manager_id"
    t.datetime "write_date"
  end

  add_index "hr_department", ["company_id"], name: "hr_department_company_id_index", using: :btree
  add_index "hr_department", ["parent_id"], name: "hr_department_parent_id_index", using: :btree

  create_table "hr_employee", force: :cascade do |t|
    t.integer  "address_id"
    t.datetime "create_date"
    t.integer  "coach_id"
    t.integer  "resource_id",                   null: false
    t.integer  "color"
    t.datetime "message_last_post"
    t.binary   "image"
    t.string   "marital"
    t.string   "identification_id"
    t.integer  "bank_account_id"
    t.integer  "job_id"
    t.string   "work_phone"
    t.integer  "country_id"
    t.integer  "parent_id"
    t.integer  "department_id"
    t.string   "otherid"
    t.string   "mobile_phone"
    t.integer  "create_uid"
    t.date     "birthday"
    t.datetime "write_date"
    t.string   "sinid"
    t.integer  "write_uid"
    t.string   "work_email",        limit: 240
    t.string   "work_location"
    t.binary   "image_medium"
    t.string   "gender"
    t.string   "ssnid"
    t.binary   "image_small"
    t.integer  "address_home_id"
    t.string   "passport_id"
    t.string   "name_related"
    t.text     "notes"
  end

  create_table "hr_employee_category", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.datetime "write_date"
  end

  add_index "hr_employee_category", ["parent_id"], name: "hr_employee_category_parent_id_index", using: :btree

  create_table "hr_job", force: :cascade do |t|
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "create_uid"
    t.text     "requirements"
    t.datetime "message_last_post"
    t.integer  "company_id"
    t.string   "state",                null: false
    t.integer  "expected_employees"
    t.integer  "department_id"
    t.text     "description"
    t.datetime "write_date"
    t.string   "name",                 null: false
    t.integer  "no_of_recruitment"
    t.integer  "no_of_hired_employee"
    t.integer  "no_of_employee"
  end

  add_index "hr_job", ["name", "company_id", "department_id"], name: "hr_job_name_company_uniq", unique: true, using: :btree
  add_index "hr_job", ["name"], name: "hr_job_name_index", using: :btree

  create_table "ir_act_client", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage"
    t.string   "type",         null: false
    t.string   "name",         null: false
    t.string   "res_model"
    t.binary   "params_store"
    t.string   "tag",          null: false
    t.string   "context",      null: false
  end

  create_table "ir_act_report_xml", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage"
    t.string   "type",                    null: false
    t.string   "name",                    null: false
    t.string   "parser"
    t.boolean  "header"
    t.string   "report_type",             null: false
    t.string   "attachment"
    t.binary   "report_sxw_content_data"
    t.string   "report_xml"
    t.binary   "report_rml_content_data"
    t.boolean  "auto"
    t.string   "report_file"
    t.boolean  "multi"
    t.string   "report_xsl"
    t.string   "report_rml"
    t.string   "report_name",             null: false
    t.boolean  "attachment_use"
    t.string   "model",                   null: false
    t.integer  "paperformat_id"
  end

  create_table "ir_act_server", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage"
    t.string   "type",                               null: false
    t.string   "name",                               null: false
    t.text     "code"
    t.integer  "sequence"
    t.integer  "crud_model_id"
    t.string   "condition"
    t.string   "ref_object",             limit: 128
    t.string   "id_object",              limit: 128
    t.string   "crud_model_name"
    t.string   "use_relational_model",               null: false
    t.string   "use_create",                         null: false
    t.integer  "wkf_field_id"
    t.integer  "wkf_model_id"
    t.string   "state",                              null: false
    t.string   "id_value"
    t.integer  "action_id"
    t.integer  "model_id",                           null: false
    t.integer  "sub_model_object_field"
    t.boolean  "link_new_record"
    t.integer  "wkf_transition_id"
    t.integer  "sub_object"
    t.string   "use_write",                          null: false
    t.string   "wkf_model_name"
    t.string   "copyvalue"
    t.string   "write_expression"
    t.integer  "menu_ir_values_id"
    t.integer  "model_object_field"
    t.integer  "link_field_id"
    t.integer  "template_id"
  end

  create_table "ir_act_url", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage"
    t.string   "type",        null: false
    t.string   "name",        null: false
    t.string   "target",      null: false
    t.text     "url",         null: false
  end

  create_table "ir_act_window", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "help"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "usage"
    t.string   "type",           null: false
    t.string   "name",           null: false
    t.string   "domain"
    t.string   "res_model",      null: false
    t.integer  "search_view_id"
    t.string   "view_type",      null: false
    t.string   "src_model"
    t.integer  "view_id"
    t.integer  "auto_refresh"
    t.string   "view_mode",      null: false
    t.boolean  "multi"
    t.string   "target"
    t.boolean  "auto_search"
    t.integer  "res_id"
    t.boolean  "filter"
    t.integer  "limit"
    t.string   "context",        null: false
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
    t.string   "view_mode",     null: false
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
    t.string   "usage"
    t.string   "type",        null: false
    t.string   "name",        null: false
  end

  create_table "ir_actions_todo", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "sequence"
    t.integer  "write_uid"
    t.text     "note"
    t.string   "state",       null: false
    t.datetime "write_date"
    t.string   "type",        null: false
    t.integer  "action_id",   null: false
  end

  add_index "ir_actions_todo", ["action_id"], name: "ir_actions_todo_action_id_index", using: :btree

  create_table "ir_attachment", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "description"
    t.string   "url",         limit: 1024
    t.string   "res_model"
    t.integer  "file_size"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.string   "res_name"
    t.binary   "db_datas"
    t.string   "datas_fname"
    t.datetime "write_date"
    t.string   "type",                     null: false
    t.integer  "res_id"
    t.string   "store_fname"
    t.string   "name",                     null: false
  end

  add_index "ir_attachment", ["res_model", "res_id"], name: "ir_attachment_res_idx", using: :btree

  create_table "ir_config_parameter", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.text     "value",       null: false
    t.integer  "write_uid"
    t.string   "key",         null: false
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
    t.string   "function"
    t.integer  "create_uid"
    t.text     "args"
    t.integer  "user_id",         null: false
    t.string   "name",            null: false
    t.string   "interval_type"
    t.integer  "numbercall"
    t.datetime "nextcall",        null: false
    t.integer  "priority"
    t.string   "model"
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
    t.string   "ref_table"
    t.integer  "company_id"
    t.string   "value"
    t.integer  "ref_id"
    t.datetime "write_date"
    t.string   "field_tbl"
    t.integer  "write_uid"
    t.string   "field_name"
    t.string   "page"
  end

  create_table "ir_exports", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "resource"
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "create_date"
  end

  add_index "ir_exports", ["resource"], name: "ir_exports_resource_index", using: :btree

  create_table "ir_exports_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
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
    t.string   "model_id",    null: false
    t.text     "domain",      null: false
    t.integer  "user_id"
    t.string   "name",        null: false
    t.integer  "create_uid"
    t.integer  "write_uid"
    t.boolean  "is_default"
    t.text     "context",     null: false
    t.datetime "write_date"
    t.datetime "create_date"
    t.integer  "action_id"
  end

  add_index "ir_filters", ["model_id"], name: "ir_filters_name_model_uid_unique_action_index", unique: true, using: :btree
  add_index "ir_filters", ["name", "model_id", "user_id", "action_id"], name: "ir_filters_name_model_uid_unique", unique: true, using: :btree

  create_table "ir_logging", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.string   "level"
    t.string   "line",        null: false
    t.string   "dbname"
    t.integer  "write_uid"
    t.string   "func",        null: false
    t.datetime "write_date"
    t.string   "path",        null: false
    t.text     "message",     null: false
    t.string   "type",        null: false
  end

  add_index "ir_logging", ["dbname"], name: "ir_logging_dbname_index", using: :btree
  add_index "ir_logging", ["level"], name: "ir_logging_level_index", using: :btree
  add_index "ir_logging", ["type"], name: "ir_logging_type_index", using: :btree

  create_table "ir_mail_server", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "smtp_encryption",            null: false
    t.datetime "create_date"
    t.string   "name",                       null: false
    t.integer  "sequence"
    t.integer  "smtp_port",                  null: false
    t.string   "smtp_host",                  null: false
    t.integer  "write_uid"
    t.string   "smtp_pass",       limit: 64
    t.boolean  "smtp_debug"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "smtp_user",       limit: 64
  end

  add_index "ir_mail_server", ["name"], name: "ir_mail_server_name_index", using: :btree

  create_table "ir_model", force: :cascade do |t|
    t.string   "model",       null: false
    t.string   "name",        null: false
    t.string   "state"
    t.text     "info"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "ir_model", ["model"], name: "ir_model_model_index", using: :btree
  add_index "ir_model", ["model"], name: "ir_model_obj_name_uniq", unique: true, using: :btree

  create_table "ir_model_access", force: :cascade do |t|
    t.integer  "model_id",    null: false
    t.boolean  "perm_read"
    t.string   "name",        null: false
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
    t.integer  "module",                null: false
    t.integer  "model",                 null: false
    t.string   "type",        limit: 1, null: false
    t.string   "name",                  null: false
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
    t.string   "name",        null: false
    t.datetime "date_init"
    t.datetime "date_update"
    t.string   "module",      null: false
    t.string   "model",       null: false
    t.integer  "res_id"
  end

  add_index "ir_model_data", ["model"], name: "ir_model_data_model_index", using: :btree
  add_index "ir_model_data", ["module", "name"], name: "ir_model_data_module_name_index", using: :btree
  add_index "ir_model_data", ["module"], name: "ir_model_data_module_index", using: :btree
  add_index "ir_model_data", ["name", "module"], name: "ir_model_data_module_name_uniq", unique: true, using: :btree
  add_index "ir_model_data", ["name"], name: "ir_model_data_name_index", using: :btree
  add_index "ir_model_data", ["res_id"], name: "ir_model_data_res_id_index", using: :btree

  create_table "ir_model_fields", force: :cascade do |t|
    t.string   "model",                                   null: false
    t.integer  "model_id",                                null: false
    t.string   "name",                                    null: false
    t.string   "relation"
    t.string   "select_level",                            null: false
    t.string   "field_description",                       null: false
    t.string   "ttype",                                   null: false
    t.string   "state",                  default: "base", null: false
    t.string   "relation_field"
    t.boolean  "translate",              default: false
    t.integer  "serialization_field_id"
    t.string   "domain"
    t.datetime "create_date"
    t.datetime "write_date"
    t.string   "on_delete"
    t.integer  "write_uid"
    t.string   "selection"
    t.integer  "size"
    t.integer  "create_uid"
    t.boolean  "readonly"
    t.string   "complete_name"
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
    t.integer  "module",      null: false
    t.integer  "model",       null: false
    t.string   "name",        null: false
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
    t.string   "name",        null: false
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
    t.string   "website"
    t.string   "summary"
    t.string   "name",                              null: false
    t.string   "author"
    t.string   "icon"
    t.string   "state"
    t.string   "latest_version"
    t.string   "shortdesc"
    t.integer  "category_id"
    t.text     "description"
    t.boolean  "application",       default: false
    t.boolean  "demo",              default: false
    t.boolean  "web",               default: false
    t.string   "license"
    t.integer  "sequence",          default: 100
    t.boolean  "auto_install",      default: false
    t.text     "menus_by_module"
    t.text     "reports_by_module"
    t.string   "maintainer"
    t.text     "contributors"
    t.text     "views_by_module"
    t.string   "published_version"
    t.string   "url"
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
    t.string   "name"
    t.integer  "module_id"
  end

  add_index "ir_module_module_dependency", ["name"], name: "ir_module_module_dependency_name_index", using: :btree

  create_table "ir_property", force: :cascade do |t|
    t.text     "value_text"
    t.float    "value_float"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "create_uid"
    t.string   "type",            null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "fields_id",       null: false
    t.datetime "value_datetime"
    t.binary   "value_binary"
    t.datetime "write_date"
    t.string   "value_reference"
    t.integer  "value_integer"
    t.string   "res_id"
  end

  add_index "ir_property", ["company_id"], name: "ir_property_company_id_index", using: :btree
  add_index "ir_property", ["fields_id"], name: "ir_property_fields_id_index", using: :btree
  add_index "ir_property", ["name"], name: "ir_property_name_index", using: :btree
  add_index "ir_property", ["res_id"], name: "ir_property_res_id_index", using: :btree
  add_index "ir_property", ["type"], name: "ir_property_type_index", using: :btree

  create_table "ir_rule", force: :cascade do |t|
    t.integer  "model_id",     null: false
    t.text     "domain_force"
    t.string   "name"
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
    t.string   "name",             limit: 64, null: false
    t.integer  "number_next",                 null: false
    t.string   "implementation",              null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "padding",                     null: false
    t.integer  "number_increment",            null: false
    t.string   "prefix"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "suffix"
  end

  create_table "ir_sequence_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 32, null: false
    t.datetime "create_date"
    t.string   "name",                   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  add_index "ir_sequence_type", ["code"], name: "ir_sequence_type_code_unique", unique: true, using: :btree

  create_table "ir_server_object_lines", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "server_id"
    t.datetime "create_date"
    t.text     "value",       null: false
    t.integer  "col1",        null: false
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "type",        null: false
  end

  create_table "ir_translation", force: :cascade do |t|
    t.string  "lang"
    t.text    "src"
    t.string  "name",     null: false
    t.integer "res_id"
    t.string  "module"
    t.string  "state"
    t.text    "comments"
    t.text    "value"
    t.string  "type"
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
    t.string   "name",                           null: false
    t.string   "icon",                limit: 64
    t.integer  "sequence"
    t.string   "web_icon_hover"
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.string   "web_icon"
    t.datetime "write_date"
    t.integer  "create_uid"
    t.binary   "web_icon_hover_data"
    t.integer  "mail_group_id"
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
    t.string   "name",          null: false
    t.integer  "inherit_id"
    t.datetime "write_date"
    t.text     "arch",          null: false
    t.integer  "write_uid"
    t.integer  "priority",      null: false
    t.string   "mode",          null: false
    t.boolean  "active"
    t.string   "model"
    t.integer  "model_data_id"
    t.string   "type"
    t.string   "field_parent"
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
    t.string   "name",        null: false
    t.integer  "create_uid"
    t.string   "key2"
    t.integer  "company_id"
    t.text     "value"
    t.integer  "write_uid"
    t.string   "key",         null: false
    t.datetime "write_date"
    t.datetime "create_date"
    t.string   "model",       null: false
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

  create_table "ledger_journal_rel", id: false, force: :cascade do |t|
    t.integer "ledger_id",  null: false
    t.integer "journal_id", null: false
  end

  add_index "ledger_journal_rel", ["journal_id"], name: "ledger_journal_rel_journal_id_index", using: :btree
  add_index "ledger_journal_rel", ["ledger_id", "journal_id"], name: "ledger_journal_rel_ledger_id_journal_id_key", unique: true, using: :btree
  add_index "ledger_journal_rel", ["ledger_id"], name: "ledger_journal_rel_ledger_id_index", using: :btree

  create_table "mail_alias", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "alias_parent_thread_id"
    t.text     "alias_defaults",         null: false
    t.string   "alias_contact",          null: false
    t.integer  "alias_parent_model_id"
    t.integer  "write_uid"
    t.integer  "alias_force_thread_id"
    t.integer  "alias_model_id",         null: false
    t.datetime "write_date"
    t.datetime "create_date"
    t.integer  "alias_user_id"
    t.string   "alias_name"
  end

  add_index "mail_alias", ["alias_name"], name: "mail_alias_alias_unique", unique: true, using: :btree

  create_table "mail_compose_message", force: :cascade do |t|
    t.datetime "create_date"
    t.boolean  "no_auto_thread"
    t.integer  "mail_server_id"
    t.integer  "write_uid"
    t.boolean  "notify"
    t.string   "active_domain"
    t.string   "subject"
    t.string   "composition_mode"
    t.integer  "create_uid"
    t.boolean  "is_log"
    t.integer  "parent_id"
    t.integer  "subtype_id"
    t.integer  "res_id"
    t.string   "message_id"
    t.text     "body"
    t.string   "model",             limit: 128
    t.string   "record_name"
    t.datetime "write_date"
    t.datetime "date"
    t.integer  "author_id"
    t.boolean  "use_active_domain"
    t.string   "type",              limit: 12
    t.string   "reply_to"
    t.string   "email_from"
    t.integer  "template_id"
  end

  add_index "mail_compose_message", ["author_id"], name: "mail_compose_message_author_id_index", using: :btree
  add_index "mail_compose_message", ["message_id"], name: "mail_compose_message_message_id_index", using: :btree
  add_index "mail_compose_message", ["model"], name: "mail_compose_message_model_index", using: :btree
  add_index "mail_compose_message", ["parent_id"], name: "mail_compose_message_parent_id_index", using: :btree
  add_index "mail_compose_message", ["res_id"], name: "mail_compose_message_res_id_index", using: :btree
  add_index "mail_compose_message", ["subtype_id"], name: "mail_compose_message_subtype_id_index", using: :btree
  add_index "mail_compose_message", ["template_id"], name: "mail_compose_message_template_id_index", using: :btree

  create_table "mail_compose_message_ir_attachments_rel", id: false, force: :cascade do |t|
    t.integer "wizard_id",     null: false
    t.integer "attachment_id", null: false
  end

  add_index "mail_compose_message_ir_attachments_rel", ["attachment_id"], name: "mail_compose_message_ir_attachments_rel_attachment_id_index", using: :btree
  add_index "mail_compose_message_ir_attachments_rel", ["wizard_id", "attachment_id"], name: "mail_compose_message_ir_attachments_wizard_id_attachment_id_key", unique: true, using: :btree
  add_index "mail_compose_message_ir_attachments_rel", ["wizard_id"], name: "mail_compose_message_ir_attachments_rel_wizard_id_index", using: :btree

  create_table "mail_compose_message_res_partner_rel", id: false, force: :cascade do |t|
    t.integer "wizard_id",  null: false
    t.integer "partner_id", null: false
  end

  add_index "mail_compose_message_res_partner_rel", ["partner_id"], name: "mail_compose_message_res_partner_rel_partner_id_index", using: :btree
  add_index "mail_compose_message_res_partner_rel", ["wizard_id", "partner_id"], name: "mail_compose_message_res_partner_rel_wizard_id_partner_id_key", unique: true, using: :btree
  add_index "mail_compose_message_res_partner_rel", ["wizard_id"], name: "mail_compose_message_res_partner_rel_wizard_id_index", using: :btree

  create_table "mail_followers", force: :cascade do |t|
    t.string  "res_model",  null: false
    t.integer "res_id"
    t.integer "partner_id", null: false
  end

  add_index "mail_followers", ["partner_id"], name: "mail_followers_partner_id_index", using: :btree
  add_index "mail_followers", ["res_id"], name: "mail_followers_res_id_index", using: :btree
  add_index "mail_followers", ["res_model", "res_id", "partner_id"], name: "mail_followers_mail_followers_res_partner_res_model_id_uniq", unique: true, using: :btree
  add_index "mail_followers", ["res_model"], name: "mail_followers_res_model_index", using: :btree

  create_table "mail_followers_mail_message_subtype_rel", id: false, force: :cascade do |t|
    t.integer "mail_followers_id",       null: false
    t.integer "mail_message_subtype_id", null: false
  end

  add_index "mail_followers_mail_message_subtype_rel", ["mail_followers_id", "mail_message_subtype_id"], name: "mail_followers_mail_message_s_mail_followers_id_mail_messag_key", unique: true, using: :btree
  add_index "mail_followers_mail_message_subtype_rel", ["mail_followers_id"], name: "mail_followers_mail_message_subtype_rel_mail_followers_id_index", using: :btree
  add_index "mail_followers_mail_message_subtype_rel", ["mail_message_subtype_id"], name: "mail_followers_mail_message_subtype_rel_mail_message_subtype_id", using: :btree

  create_table "mail_group", force: :cascade do |t|
    t.integer  "menu_id",           null: false
    t.datetime "create_date"
    t.text     "description"
    t.integer  "create_uid"
    t.datetime "message_last_post"
    t.binary   "image"
    t.integer  "alias_id",          null: false
    t.integer  "group_public_id"
    t.integer  "write_uid"
    t.string   "public",            null: false
    t.binary   "image_small"
    t.binary   "image_medium"
    t.datetime "write_date"
    t.string   "name",              null: false
  end

  create_table "mail_group_res_group_rel", id: false, force: :cascade do |t|
    t.integer "mail_group_id", null: false
    t.integer "groups_id",     null: false
  end

  add_index "mail_group_res_group_rel", ["groups_id"], name: "mail_group_res_group_rel_groups_id_index", using: :btree
  add_index "mail_group_res_group_rel", ["mail_group_id", "groups_id"], name: "mail_group_res_group_rel_mail_group_id_groups_id_key", unique: true, using: :btree
  add_index "mail_group_res_group_rel", ["mail_group_id"], name: "mail_group_res_group_rel_mail_group_id_index", using: :btree

  create_table "mail_mail", force: :cascade do |t|
    t.integer  "mail_message_id",     null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.boolean  "notification"
    t.boolean  "auto_delete"
    t.text     "body_html"
    t.integer  "write_uid"
    t.text     "email_to"
    t.text     "headers"
    t.string   "state"
    t.text     "references"
    t.datetime "write_date"
    t.string   "email_cc"
    t.integer  "fetchmail_server_id"
  end

  add_index "mail_mail", ["fetchmail_server_id"], name: "mail_mail_fetchmail_server_id_index", using: :btree

  create_table "mail_mail_res_partner_rel", id: false, force: :cascade do |t|
    t.integer "mail_mail_id",   null: false
    t.integer "res_partner_id", null: false
  end

  add_index "mail_mail_res_partner_rel", ["mail_mail_id", "res_partner_id"], name: "mail_mail_res_partner_rel_mail_mail_id_res_partner_id_key", unique: true, using: :btree
  add_index "mail_mail_res_partner_rel", ["mail_mail_id"], name: "mail_mail_res_partner_rel_mail_mail_id_index", using: :btree
  add_index "mail_mail_res_partner_rel", ["res_partner_id"], name: "mail_mail_res_partner_rel_res_partner_id_index", using: :btree

  create_table "mail_message", force: :cascade do |t|
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "mail_server_id"
    t.integer  "write_uid"
    t.string   "subject"
    t.integer  "create_uid"
    t.integer  "parent_id"
    t.integer  "subtype_id"
    t.integer  "res_id"
    t.string   "message_id"
    t.text     "body"
    t.string   "model",          limit: 128
    t.string   "record_name"
    t.boolean  "no_auto_thread"
    t.datetime "date"
    t.integer  "author_id"
    t.string   "type",           limit: 12
    t.string   "reply_to"
    t.string   "email_from"
  end

  add_index "mail_message", ["author_id"], name: "mail_message_author_id_index", using: :btree
  add_index "mail_message", ["message_id"], name: "mail_message_message_id_index", using: :btree
  add_index "mail_message", ["model", "res_id"], name: "mail_message_model_res_id_idx", using: :btree
  add_index "mail_message", ["model"], name: "mail_message_model_index", using: :btree
  add_index "mail_message", ["parent_id"], name: "mail_message_parent_id_index", using: :btree
  add_index "mail_message", ["res_id"], name: "mail_message_res_id_index", using: :btree
  add_index "mail_message", ["subtype_id"], name: "mail_message_subtype_id_index", using: :btree

  create_table "mail_message_res_partner_rel", id: false, force: :cascade do |t|
    t.integer "mail_message_id", null: false
    t.integer "res_partner_id",  null: false
  end

  add_index "mail_message_res_partner_rel", ["mail_message_id", "res_partner_id"], name: "mail_message_res_partner_rel_mail_message_id_res_partner_id_key", unique: true, using: :btree
  add_index "mail_message_res_partner_rel", ["mail_message_id"], name: "mail_message_res_partner_rel_mail_message_id_index", using: :btree
  add_index "mail_message_res_partner_rel", ["res_partner_id"], name: "mail_message_res_partner_rel_res_partner_id_index", using: :btree

  create_table "mail_message_subtype", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "description"
    t.integer  "sequence"
    t.boolean  "default"
    t.string   "res_model"
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.string   "relation_field"
    t.boolean  "hidden"
    t.string   "name",           null: false
  end

  create_table "mail_notification", force: :cascade do |t|
    t.boolean "is_read"
    t.boolean "starred"
    t.integer "partner_id", null: false
    t.integer "message_id", null: false
  end

  add_index "mail_notification", ["is_read"], name: "mail_notification_is_read_index", using: :btree
  add_index "mail_notification", ["message_id"], name: "mail_notification_message_id_index", using: :btree
  add_index "mail_notification", ["partner_id", "is_read", "starred", "message_id"], name: "mail_notification_partner_id_read_starred_message_id", using: :btree
  add_index "mail_notification", ["partner_id"], name: "mail_notification_partner_id_index", using: :btree
  add_index "mail_notification", ["starred"], name: "mail_notification_starred_index", using: :btree

  create_table "mail_vote", id: false, force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "mail_vote", ["message_id", "user_id"], name: "mail_vote_message_id_user_id_key", unique: true, using: :btree
  add_index "mail_vote", ["message_id"], name: "mail_vote_message_id_index", using: :btree
  add_index "mail_vote", ["user_id"], name: "mail_vote_user_id_index", using: :btree

  create_table "mail_wizard_invite", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "res_model",   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.text     "message"
    t.integer  "res_id"
    t.boolean  "send_mail"
  end

  add_index "mail_wizard_invite", ["res_id"], name: "mail_wizard_invite_res_id_index", using: :btree
  add_index "mail_wizard_invite", ["res_model"], name: "mail_wizard_invite_res_model_index", using: :btree

  create_table "mail_wizard_invite_res_partner_rel", id: false, force: :cascade do |t|
    t.integer "mail_wizard_invite_id", null: false
    t.integer "res_partner_id",        null: false
  end

  add_index "mail_wizard_invite_res_partner_rel", ["mail_wizard_invite_id", "res_partner_id"], name: "mail_wizard_invite_res_partne_mail_wizard_invite_id_res_par_key", unique: true, using: :btree
  add_index "mail_wizard_invite_res_partner_rel", ["mail_wizard_invite_id"], name: "mail_wizard_invite_res_partner_rel_mail_wizard_invite_id_index", using: :btree
  add_index "mail_wizard_invite_res_partner_rel", ["res_partner_id"], name: "mail_wizard_invite_res_partner_rel_res_partner_id_index", using: :btree

  create_table "make_procurement", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "product_id",   null: false
    t.date     "date_planned", null: false
    t.decimal  "qty",          null: false
    t.integer  "warehouse_id", null: false
    t.integer  "uom_id",       null: false
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "message_attachment_rel", id: false, force: :cascade do |t|
    t.integer "message_id",    null: false
    t.integer "attachment_id", null: false
  end

  add_index "message_attachment_rel", ["attachment_id"], name: "message_attachment_rel_attachment_id_index", using: :btree
  add_index "message_attachment_rel", ["message_id", "attachment_id"], name: "message_attachment_rel_message_id_attachment_id_key", unique: true, using: :btree
  add_index "message_attachment_rel", ["message_id"], name: "message_attachment_rel_message_id_index", using: :btree

  create_table "mj_base_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.binary   "file"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "resource_no"
  end

  create_table "mj_bill_of_material_base", force: :cascade do |t|
    t.string   "bill_of_material_no"
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "mj_dashboard_dashboard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "mj_material_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "number"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "bill_of_material"
  end

  create_table "mj_procution_plan_base", force: :cascade do |t|
    t.string   "status"
    t.integer  "create_uid"
    t.integer  "product"
    t.date     "begin_date"
    t.string   "name"
    t.string   "production_plan_no"
    t.string   "remark"
    t.integer  "write_uid"
    t.integer  "product_number"
    t.datetime "write_date"
    t.datetime "create_date"
  end

  create_table "mj_product_base", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "status"
    t.string   "remark"
    t.integer  "product_type_moved0"
    t.integer  "project"
    t.string   "product_no"
    t.string   "product_type"
    t.string   "uuid"
    t.string   "standard"
    t.string   "unit"
  end

  create_table "mj_product_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.binary   "file"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "mj_production_base", force: :cascade do |t|
    t.string   "status"
    t.integer  "create_uid"
    t.string   "remark"
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "production_plan"
    t.integer  "write_uid"
    t.string   "production_no"
    t.datetime "write_date"
    t.datetime "create_date"
    t.integer  "parent_id"
  end

  create_table "mj_production_plan_base", force: :cascade do |t|
    t.string   "status"
    t.integer  "create_uid"
    t.integer  "product"
    t.date     "begin_date"
    t.string   "name"
    t.date     "end_date"
    t.string   "production_plan_no"
    t.string   "remark"
    t.integer  "write_uid"
    t.integer  "product_number"
    t.datetime "write_date"
    t.datetime "create_date"
  end

  create_table "mj_project_base", force: :cascade do |t|
    t.string   "status"
    t.integer  "create_uid"
    t.text     "remark"
    t.date     "begin_date"
    t.string   "name"
    t.date     "end_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "create_date"
    t.string   "project_no"
  end

  create_table "mj_project_user_base", force: :cascade do |t|
    t.string   "duty"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "project"
    t.integer  "user"
    t.datetime "write_date"
  end

  create_table "mj_routing", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "product"
    t.integer  "product_id"
  end

  create_table "mj_routing_operation", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "workstation_moved0"
    t.datetime "create_date"
    t.string   "name"
    t.float    "time_cost"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "routing_id"
    t.string   "technology_arg"
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
    t.string   "status"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "no"
    t.string   "order_name"
    t.integer  "write_uid"
    t.integer  "production"
    t.datetime "write_date"
    t.string   "execution_success_ful"
  end

  create_table "mj_tcs_order_task_base", force: :cascade do |t|
    t.string   "status"
    t.integer  "create_uid"
    t.string   "current_position"
    t.datetime "create_date"
    t.string   "no"
    t.string   "order_name"
    t.integer  "write_uid"
    t.string   "action"
    t.integer  "tcs_order"
    t.datetime "write_date"
    t.string   "intended_vehicle"
    t.string   "destination_name"
    t.string   "execution_success_ful"
  end

  create_table "mj_technology_arg", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "mj_technology_arg_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "mj_technology_arg_id"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "sequence"
    t.string   "low_value"
    t.string   "value"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "high_value"
  end

  create_table "mj_tm_operation", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "workstation_id"
    t.float    "time_cost"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "routing_id"
    t.string   "technology_arg"
    t.string   "name"
    t.integer  "equipment_id"
    t.integer  "sequence"
    t.string   "program_no"
    t.text     "note"
  end

  create_table "mj_tm_operation_material", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
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
    t.integer  "create_uid"
    t.string   "code"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.text     "note"
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "product_id"
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
    t.string   "workstation_no"
    t.string   "vehicle_no"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "mj_work_order_base", force: :cascade do |t|
    t.string   "status"
    t.integer  "create_uid"
    t.integer  "work_station"
    t.date     "begin_date"
    t.integer  "takes"
    t.date     "end_date"
    t.string   "operation_content"
    t.integer  "write_uid"
    t.integer  "production"
    t.integer  "user"
    t.datetime "write_date"
    t.integer  "routing_operation"
    t.string   "operation_name"
    t.datetime "create_date"
    t.string   "work_order_no"
  end

  create_table "mj_workcenter_equipment", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "name"
    t.string   "no"
    t.text     "note"
    t.string   "e_type"
  end

  create_table "mj_workcenter_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "workstation_id"
    t.string   "name"
  end

  create_table "mj_workcenter_workcenter", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "code"
    t.string   "name"
    t.text     "note"
    t.string   "state"
    t.string   "no"
    t.integer  "parent_id"
  end

  create_table "mj_workcenter_workstation", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.float    "time_start"
    t.string   "name"
    t.float    "time_stop"
    t.string   "no"
    t.text     "note"
    t.float    "cost_hour"
    t.float    "costs_cycle"
    t.integer  "workcenter_id"
    t.float    "time_cycle"
    t.string   "state"
  end

  create_table "multi_company_default", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",            null: false
    t.integer  "sequence"
    t.integer  "field_id"
    t.integer  "company_id",      null: false
    t.integer  "object_id",       null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "company_dest_id", null: false
    t.string   "expression",      null: false
  end

  create_table "osv_memory_autovacuum", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "payment_acquirer", force: :cascade do |t|
    t.integer  "create_uid"
    t.float    "fees_dom_fixed"
    t.float    "fees_dom_var"
    t.string   "name",              null: false
    t.boolean  "fees_active"
    t.integer  "company_id",        null: false
    t.integer  "write_uid"
    t.text     "post_msg"
    t.boolean  "website_published"
    t.float    "fees_int_var"
    t.integer  "view_template_id",  null: false
    t.datetime "write_date"
    t.string   "provider",          null: false
    t.datetime "create_date"
    t.text     "pre_msg"
    t.string   "validation"
    t.float    "fees_int_fixed"
    t.string   "environment"
  end

  create_table "payment_transaction", force: :cascade do |t|
    t.text     "state_message"
    t.datetime "create_date"
    t.string   "reference",          null: false
    t.integer  "write_uid"
    t.datetime "date_create",        null: false
    t.integer  "acquirer_id",        null: false
    t.decimal  "fees"
    t.integer  "partner_id"
    t.integer  "create_uid"
    t.string   "partner_reference"
    t.string   "partner_name"
    t.datetime "message_last_post"
    t.string   "partner_phone"
    t.string   "state",              null: false
    t.string   "type",               null: false
    t.integer  "partner_country_id", null: false
    t.string   "acquirer_reference"
    t.string   "partner_address"
    t.string   "partner_email"
    t.string   "partner_lang"
    t.datetime "write_date"
    t.string   "partner_zip"
    t.integer  "currency_id",        null: false
    t.datetime "date_validate"
    t.string   "partner_city"
    t.decimal  "amount",             null: false
  end

  create_table "portal_wizard", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "welcome_message"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "portal_id",       null: false
  end

  create_table "portal_wizard_user", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "wizard_id",               null: false
    t.integer  "write_uid"
    t.string   "email",       limit: 240
    t.datetime "write_date"
    t.boolean  "in_portal"
    t.integer  "partner_id",              null: false
  end

  create_table "pricelist_partnerinfo", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.decimal  "price",        null: false
    t.integer  "suppinfo_id",  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.float    "min_quantity", null: false
  end

  create_table "procurement_group", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.string   "move_type",   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "partner_id"
  end

  create_table "procurement_order", force: :cascade do |t|
    t.string   "origin"
    t.datetime "create_date"
    t.integer  "product_uom",       null: false
    t.float    "product_uos_qty"
    t.integer  "write_uid"
    t.decimal  "product_qty",       null: false
    t.integer  "product_uos"
    t.integer  "create_uid"
    t.datetime "message_last_post"
    t.integer  "company_id",        null: false
    t.string   "priority",          null: false
    t.string   "state",             null: false
    t.datetime "write_date"
    t.text     "name",              null: false
    t.integer  "product_id",        null: false
    t.datetime "date_planned",      null: false
    t.integer  "group_id"
    t.integer  "rule_id"
    t.integer  "move_dest_id"
    t.integer  "location_id"
    t.integer  "partner_dest_id"
    t.integer  "orderpoint_id"
    t.integer  "warehouse_id"
    t.string   "invoice_state"
    t.integer  "purchase_line_id"
  end

  add_index "procurement_order", ["date_planned"], name: "procurement_order_date_planned_index", using: :btree
  add_index "procurement_order", ["priority"], name: "procurement_order_priority_index", using: :btree

  create_table "procurement_order_compute_all", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "procurement_orderpoint_compute", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "procurement_rule", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",                     null: false
    t.integer  "sequence"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.string   "action",                   null: false
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "group_id"
    t.string   "group_propagation_option"
    t.integer  "partner_address_id"
    t.integer  "location_id"
    t.integer  "location_src_id"
    t.integer  "picking_type_id"
    t.integer  "delay"
    t.integer  "warehouse_id"
    t.boolean  "propagate"
    t.string   "procure_method",           null: false
    t.decimal  "route_sequence"
    t.integer  "route_id"
    t.integer  "propagate_warehouse_id"
    t.string   "invoice_state"
  end

  create_table "product_attribute", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "product_attribute_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.integer  "product_tmpl_id", null: false
    t.integer  "attribute_id",    null: false
    t.datetime "write_date"
  end

  create_table "product_attribute_line_product_attribute_value_rel", id: false, force: :cascade do |t|
    t.integer "line_id", null: false
    t.integer "val_id",  null: false
  end

  add_index "product_attribute_line_product_attribute_value_rel", ["line_id", "val_id"], name: "product_attribute_line_product_attribute_val_line_id_val_id_key", unique: true, using: :btree
  add_index "product_attribute_line_product_attribute_value_rel", ["line_id"], name: "product_attribute_line_product_attribute_value_rel_line_id_inde", using: :btree
  add_index "product_attribute_line_product_attribute_value_rel", ["val_id"], name: "product_attribute_line_product_attribute_value_rel_val_id_index", using: :btree

  create_table "product_attribute_price", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.decimal  "price_extra"
    t.integer  "product_tmpl_id", null: false
    t.integer  "value_id",        null: false
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "product_attribute_value", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",         null: false
    t.integer  "sequence"
    t.integer  "attribute_id", null: false
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  add_index "product_attribute_value", ["name", "attribute_id"], name: "product_attribute_value_value_company_uniq", unique: true, using: :btree

  create_table "product_attribute_value_product_product_rel", id: false, force: :cascade do |t|
    t.integer "att_id",  null: false
    t.integer "prod_id", null: false
  end

  add_index "product_attribute_value_product_product_rel", ["att_id", "prod_id"], name: "product_attribute_value_product_product_rel_att_id_prod_id_key", unique: true, using: :btree
  add_index "product_attribute_value_product_product_rel", ["att_id"], name: "product_attribute_value_product_product_rel_att_id_index", using: :btree
  add_index "product_attribute_value_product_product_rel", ["prod_id"], name: "product_attribute_value_product_product_rel_prod_id_index", using: :btree

  create_table "product_category", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",                null: false
    t.integer  "sequence"
    t.integer  "write_uid"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.string   "type"
    t.integer  "removal_strategy_id"
  end

  add_index "product_category", ["name"], name: "product_category_name_index", using: :btree
  add_index "product_category", ["parent_id"], name: "product_category_parent_id_index", using: :btree
  add_index "product_category", ["parent_left"], name: "product_category_parent_left_index", using: :btree
  add_index "product_category", ["parent_right"], name: "product_category_parent_right_index", using: :btree
  add_index "product_category", ["sequence"], name: "product_category_sequence_index", using: :btree

  create_table "product_packaging", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "rows",                       null: false
    t.datetime "create_date"
    t.text     "name"
    t.float    "weight"
    t.string   "ean",             limit: 14
    t.integer  "ul_qty"
    t.integer  "sequence"
    t.float    "qty"
    t.integer  "product_tmpl_id",            null: false
    t.integer  "ul",                         null: false
    t.string   "code"
    t.datetime "write_date"
    t.integer  "ul_container"
    t.integer  "write_uid"
  end

  add_index "product_packaging", ["product_tmpl_id"], name: "product_packaging_product_tmpl_id_index", using: :btree

  create_table "product_price_history", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "company_id",          null: false
    t.datetime "datetime"
    t.float    "cost"
    t.integer  "product_template_id", null: false
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "product_price_list", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "price_list",  null: false
    t.integer  "write_uid"
    t.integer  "qty1"
    t.integer  "qty2"
    t.integer  "qty3"
    t.integer  "qty4"
    t.integer  "qty5"
    t.datetime "write_date"
  end

  create_table "product_price_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",                   null: false
    t.integer  "write_uid"
    t.integer  "currency_id",            null: false
    t.string   "field",       limit: 32, null: false
    t.datetime "write_date"
    t.boolean  "active"
  end

  create_table "product_pricelist", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "currency_id", null: false
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "type",        null: false
  end

  create_table "product_pricelist_item", force: :cascade do |t|
    t.decimal  "price_round"
    t.integer  "create_uid"
    t.decimal  "price_min_margin"
    t.datetime "create_date"
    t.decimal  "price_discount"
    t.string   "name"
    t.integer  "sequence",          null: false
    t.decimal  "price_max_margin"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "product_tmpl_id"
    t.integer  "product_id"
    t.integer  "base",              null: false
    t.integer  "base_pricelist_id"
    t.integer  "price_version_id",  null: false
    t.integer  "min_quantity",      null: false
    t.datetime "write_date"
    t.integer  "categ_id"
    t.decimal  "price_surcharge"
  end

  add_index "product_pricelist_item", ["price_version_id"], name: "product_pricelist_item_price_version_id_index", using: :btree

  create_table "product_pricelist_type", force: :cascade do |t|
    t.string   "key",         null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "product_pricelist_version", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "name",         null: false
    t.date     "date_end"
    t.date     "date_start"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "pricelist_id", null: false
    t.boolean  "active"
    t.datetime "create_date"
  end

  add_index "product_pricelist_version", ["pricelist_id"], name: "product_pricelist_version_pricelist_id_index", using: :btree

  create_table "product_product", force: :cascade do |t|
    t.string   "ean13",             limit: 13
    t.datetime "create_date"
    t.string   "default_code"
    t.string   "name_template"
    t.integer  "create_uid"
    t.datetime "message_last_post"
    t.integer  "product_tmpl_id",              null: false
    t.binary   "image_variant"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.boolean  "active"
  end

  add_index "product_product", ["default_code"], name: "product_product_default_code_index", using: :btree
  add_index "product_product", ["name_template"], name: "product_product_name_template_index", using: :btree
  add_index "product_product", ["product_tmpl_id"], name: "product_product_product_tmpl_id_index", using: :btree

  create_table "product_putaway", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "method",      null: false
  end

  create_table "product_removal", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "method",      null: false
  end

  create_table "product_supplier_taxes_rel", id: false, force: :cascade do |t|
    t.integer "prod_id", null: false
    t.integer "tax_id",  null: false
  end

  add_index "product_supplier_taxes_rel", ["prod_id", "tax_id"], name: "product_supplier_taxes_rel_prod_id_tax_id_key", unique: true, using: :btree
  add_index "product_supplier_taxes_rel", ["prod_id"], name: "product_supplier_taxes_rel_prod_id_index", using: :btree
  add_index "product_supplier_taxes_rel", ["tax_id"], name: "product_supplier_taxes_rel_tax_id_index", using: :btree

  create_table "product_supplierinfo", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "product_code"
    t.datetime "create_date"
    t.integer  "name",            null: false
    t.integer  "sequence"
    t.string   "product_name"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "delay",           null: false
    t.datetime "write_date"
    t.float    "min_qty",         null: false
    t.decimal  "qty"
    t.integer  "product_tmpl_id", null: false
  end

  add_index "product_supplierinfo", ["company_id"], name: "product_supplierinfo_company_id_index", using: :btree
  add_index "product_supplierinfo", ["product_tmpl_id"], name: "product_supplierinfo_product_tmpl_id_index", using: :btree

  create_table "product_taxes_rel", id: false, force: :cascade do |t|
    t.integer "prod_id", null: false
    t.integer "tax_id",  null: false
  end

  add_index "product_taxes_rel", ["prod_id", "tax_id"], name: "product_taxes_rel_prod_id_tax_id_key", unique: true, using: :btree
  add_index "product_taxes_rel", ["prod_id"], name: "product_taxes_rel_prod_id_index", using: :btree
  add_index "product_taxes_rel", ["tax_id"], name: "product_taxes_rel_tax_id_index", using: :btree

  create_table "product_template", force: :cascade do |t|
    t.float    "warranty"
    t.integer  "uos_id"
    t.decimal  "list_price"
    t.decimal  "weight"
    t.integer  "color"
    t.binary   "image"
    t.integer  "write_uid"
    t.string   "mes_type"
    t.integer  "uom_id",                          null: false
    t.text     "description_purchase"
    t.datetime "create_date"
    t.decimal  "uos_coeff"
    t.integer  "create_uid"
    t.boolean  "sale_ok"
    t.integer  "categ_id",                        null: false
    t.integer  "product_manager"
    t.datetime "message_last_post"
    t.integer  "company_id"
    t.string   "state"
    t.integer  "uom_po_id",                       null: false
    t.text     "description_sale"
    t.text     "description"
    t.decimal  "weight_net"
    t.float    "volume"
    t.datetime "write_date"
    t.boolean  "active"
    t.boolean  "rental"
    t.binary   "image_medium"
    t.string   "name",                            null: false
    t.string   "type",                            null: false
    t.binary   "image_small"
    t.boolean  "track_all"
    t.string   "loc_row",              limit: 16
    t.boolean  "track_outgoing"
    t.string   "loc_rack",             limit: 16
    t.string   "loc_case",             limit: 16
    t.boolean  "track_incoming"
    t.float    "sale_delay"
    t.boolean  "purchase_ok"
  end

  add_index "product_template", ["company_id"], name: "product_template_company_id_index", using: :btree
  add_index "product_template", ["name"], name: "product_template_name_index", using: :btree

  create_table "product_ul", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.float    "weight"
    t.float    "height"
    t.float    "width"
    t.float    "length"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.string   "type",        null: false
  end

  add_index "product_ul", ["name"], name: "product_ul_name_index", using: :btree

  create_table "product_uom", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.decimal  "rounding",    null: false
    t.integer  "write_uid"
    t.boolean  "active"
    t.datetime "write_date"
    t.decimal  "factor",      null: false
    t.string   "uom_type",    null: false
    t.integer  "category_id", null: false
  end

  create_table "product_uom_categ", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "productions_work_order_executions", force: :cascade do |t|
    t.integer  "work_order_id"
    t.string   "type"
    t.string   "state"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "project_account_analytic_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "write_date"
  end

  create_table "purchase_config_settings", force: :cascade do |t|
    t.boolean  "group_uom"
    t.integer  "create_uid"
    t.boolean  "module_purchase_analytic_plans"
    t.datetime "create_date"
    t.boolean  "module_stock_dropshipping"
    t.boolean  "group_costing_method"
    t.boolean  "group_purchase_pricelist"
    t.boolean  "module_purchase_requisition"
    t.boolean  "group_advance_purchase_requisition"
    t.integer  "write_uid"
    t.boolean  "module_purchase_double_validation"
    t.boolean  "group_analytic_account_for_purchases"
    t.datetime "write_date"
    t.string   "default_invoice_method",               null: false
    t.boolean  "module_warning"
  end

  create_table "purchase_invoice_rel", id: false, force: :cascade do |t|
    t.integer "purchase_id", null: false
    t.integer "invoice_id",  null: false
  end

  add_index "purchase_invoice_rel", ["invoice_id"], name: "purchase_invoice_rel_invoice_id_index", using: :btree
  add_index "purchase_invoice_rel", ["purchase_id", "invoice_id"], name: "purchase_invoice_rel_purchase_id_invoice_id_key", unique: true, using: :btree
  add_index "purchase_invoice_rel", ["purchase_id"], name: "purchase_invoice_rel_purchase_id_index", using: :btree

  create_table "purchase_order", force: :cascade do |t|
    t.string   "origin"
    t.datetime "create_date"
    t.integer  "company_id",           null: false
    t.integer  "currency_id",          null: false
    t.string   "partner_ref"
    t.datetime "date_order",           null: false
    t.integer  "partner_id",           null: false
    t.integer  "dest_address_id"
    t.integer  "create_uid"
    t.integer  "fiscal_position"
    t.decimal  "amount_untaxed"
    t.integer  "picking_type_id",      null: false
    t.integer  "location_id",          null: false
    t.datetime "message_last_post"
    t.integer  "journal_id"
    t.decimal  "amount_tax"
    t.string   "state"
    t.date     "bid_validity"
    t.integer  "pricelist_id",         null: false
    t.integer  "incoterm_id"
    t.date     "bid_date"
    t.integer  "payment_term_id"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.date     "date_approve"
    t.decimal  "amount_total"
    t.string   "name",                 null: false
    t.text     "notes"
    t.string   "invoice_method",       null: false
    t.boolean  "shipped"
    t.integer  "validator"
    t.date     "minimum_planned_date"
    t.integer  "related_location_id"
  end

  add_index "purchase_order", ["company_id"], name: "purchase_order_company_id_index", using: :btree
  add_index "purchase_order", ["date_approve"], name: "purchase_order_date_approve_index", using: :btree
  add_index "purchase_order", ["date_order"], name: "purchase_order_date_order_index", using: :btree
  add_index "purchase_order", ["minimum_planned_date"], name: "purchase_order_minimum_planned_date_index", using: :btree
  add_index "purchase_order", ["name", "company_id"], name: "purchase_order_name_uniq", unique: true, using: :btree
  add_index "purchase_order", ["name"], name: "purchase_order_name_index", using: :btree
  add_index "purchase_order", ["shipped"], name: "purchase_order_shipped_index", using: :btree
  add_index "purchase_order", ["state"], name: "purchase_order_state_index", using: :btree

  create_table "purchase_order_group", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "purchase_order_line", force: :cascade do |t|
    t.datetime "create_date"
    t.integer  "product_uom",         null: false
    t.decimal  "price_unit",          null: false
    t.integer  "write_uid"
    t.decimal  "product_qty",         null: false
    t.integer  "partner_id"
    t.boolean  "invoiced"
    t.integer  "create_uid"
    t.integer  "company_id"
    t.string   "state",               null: false
    t.integer  "account_analytic_id"
    t.integer  "order_id",            null: false
    t.datetime "write_date"
    t.text     "name",                null: false
    t.integer  "product_id"
    t.date     "date_planned",        null: false
  end

  add_index "purchase_order_line", ["date_planned"], name: "purchase_order_line_date_planned_index", using: :btree
  add_index "purchase_order_line", ["order_id"], name: "purchase_order_line_order_id_index", using: :btree

  create_table "purchase_order_line_invoice", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "purchase_order_line_invoice_rel", id: false, force: :cascade do |t|
    t.integer "order_line_id", null: false
    t.integer "invoice_id",    null: false
  end

  add_index "purchase_order_line_invoice_rel", ["invoice_id"], name: "purchase_order_line_invoice_rel_invoice_id_index", using: :btree
  add_index "purchase_order_line_invoice_rel", ["order_line_id", "invoice_id"], name: "purchase_order_line_invoice_rel_order_line_id_invoice_id_key", unique: true, using: :btree
  add_index "purchase_order_line_invoice_rel", ["order_line_id"], name: "purchase_order_line_invoice_rel_order_line_id_index", using: :btree

  create_table "purchase_order_taxe", id: false, force: :cascade do |t|
    t.integer "ord_id", null: false
    t.integer "tax_id", null: false
  end

  add_index "purchase_order_taxe", ["ord_id", "tax_id"], name: "purchase_order_taxe_ord_id_tax_id_key", unique: true, using: :btree
  add_index "purchase_order_taxe", ["ord_id"], name: "purchase_order_taxe_ord_id_index", using: :btree
  add_index "purchase_order_taxe", ["tax_id"], name: "purchase_order_taxe_tax_id_index", using: :btree

  create_table "reconcile_account_rel", id: false, force: :cascade do |t|
    t.integer "reconcile_id", null: false
    t.integer "account_id",   null: false
  end

  add_index "reconcile_account_rel", ["account_id"], name: "reconcile_account_rel_account_id_index", using: :btree
  add_index "reconcile_account_rel", ["reconcile_id", "account_id"], name: "reconcile_account_rel_reconcile_id_account_id_key", unique: true, using: :btree
  add_index "reconcile_account_rel", ["reconcile_id"], name: "reconcile_account_rel_reconcile_id_index", using: :btree

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
    t.string   "name",           null: false
    t.string   "format"
    t.boolean  "default"
    t.boolean  "header_line"
    t.integer  "header_spacing"
    t.integer  "dpi",            null: false
    t.integer  "write_uid"
    t.integer  "margin_right"
    t.integer  "margin_top"
    t.integer  "margin_left"
    t.datetime "write_date"
    t.integer  "margin_bottom"
    t.integer  "page_height"
    t.string   "orientation"
  end

  create_table "res_bank", force: :cascade do |t|
    t.string   "city"
    t.string   "fax"
    t.datetime "create_date"
    t.string   "name",                   null: false
    t.string   "zip",         limit: 24
    t.integer  "create_uid"
    t.integer  "country"
    t.string   "street2"
    t.string   "bic",         limit: 64
    t.integer  "write_uid"
    t.string   "email"
    t.string   "phone"
    t.integer  "state"
    t.string   "street"
    t.datetime "write_date"
    t.boolean  "active"
  end

  create_table "res_company", force: :cascade do |t|
    t.string   "name",                                             null: false
    t.integer  "partner_id",                                       null: false
    t.integer  "currency_id",                                      null: false
    t.text     "rml_footer"
    t.datetime "create_date"
    t.text     "rml_header",                                       null: false
    t.string   "rml_paper_format",                                 null: false
    t.integer  "write_uid"
    t.binary   "logo_web"
    t.integer  "font"
    t.string   "account_no"
    t.integer  "parent_id"
    t.string   "email",                                limit: 64
    t.integer  "create_uid"
    t.boolean  "custom_footer"
    t.string   "phone",                                limit: 64
    t.text     "rml_header2",                                      null: false
    t.text     "rml_header3",                                      null: false
    t.datetime "write_date"
    t.string   "rml_header1"
    t.string   "company_registry",                     limit: 64
    t.integer  "paperformat_id"
    t.integer  "expense_currency_exchange_account_id"
    t.boolean  "expects_chart_of_accounts"
    t.string   "paypal_account",                       limit: 128
    t.text     "overdue_msg"
    t.string   "tax_calculation_rounding_method"
    t.integer  "income_currency_exchange_account_id"
    t.integer  "internal_transit_location_id"
    t.integer  "propagation_minimum_delta"
    t.float    "po_lead",                                          null: false
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
    t.string   "name",                     null: false
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
    t.string   "name",        null: false
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
    t.string   "code",        limit: 3, null: false
    t.datetime "create_date"
    t.string   "name",                  null: false
    t.integer  "country_id",            null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "res_currency", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.decimal  "rounding"
    t.string   "symbol",      limit: 4
    t.integer  "company_id"
    t.integer  "write_uid"
    t.boolean  "base"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "position"
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
    t.string   "name",        null: false
    t.string   "family",      null: false
    t.integer  "write_uid"
    t.string   "mode",        null: false
    t.datetime "write_date"
    t.string   "path",        null: false
  end

  add_index "res_font", ["family", "name"], name: "res_font_name_font_uniq", unique: true, using: :btree

  create_table "res_groups", force: :cascade do |t|
    t.text     "comment"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "category_id"
    t.boolean  "share"
    t.boolean  "is_portal"
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
    t.string   "name",                     null: false
    t.string   "code",          limit: 16, null: false
    t.string   "date_format",              null: false
    t.string   "direction",                null: false
    t.datetime "create_date"
    t.integer  "create_uid"
    t.string   "thousands_sep"
    t.boolean  "translatable"
    t.integer  "write_uid"
    t.string   "time_format",              null: false
    t.datetime "write_date"
    t.string   "decimal_point",            null: false
    t.boolean  "active"
    t.string   "iso_code",      limit: 16
    t.string   "grouping",                 null: false
  end

  add_index "res_lang", ["code"], name: "res_lang_code_key", unique: true, using: :btree
  add_index "res_lang", ["code"], name: "res_lang_code_uniq", unique: true, using: :btree
  add_index "res_lang", ["name"], name: "res_lang_name_key", unique: true, using: :btree
  add_index "res_lang", ["name"], name: "res_lang_name_uniq", unique: true, using: :btree

  create_table "res_partner", force: :cascade do |t|
    t.string   "name",                                null: false
    t.integer  "company_id"
    t.text     "comment"
    t.string   "ean13",                    limit: 13
    t.datetime "create_date"
    t.integer  "color"
    t.binary   "image_small"
    t.binary   "image"
    t.date     "date"
    t.string   "street"
    t.string   "city"
    t.string   "display_name"
    t.string   "zip",                      limit: 24
    t.integer  "title"
    t.string   "function"
    t.integer  "country_id"
    t.integer  "parent_id"
    t.boolean  "supplier"
    t.string   "ref"
    t.string   "email"
    t.boolean  "is_company"
    t.string   "website"
    t.boolean  "customer"
    t.string   "fax"
    t.string   "street2"
    t.boolean  "employee"
    t.float    "credit_limit"
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "tz",                       limit: 64
    t.integer  "write_uid"
    t.string   "lang"
    t.integer  "create_uid"
    t.binary   "image_medium"
    t.string   "phone"
    t.string   "mobile"
    t.string   "type"
    t.boolean  "use_parent_address"
    t.integer  "user_id"
    t.string   "birthdate"
    t.string   "vat"
    t.integer  "state_id"
    t.integer  "commercial_partner_id"
    t.string   "notify_email",                        null: false
    t.datetime "message_last_post"
    t.boolean  "opt_out"
    t.integer  "section_id"
    t.string   "signup_type"
    t.datetime "signup_expiration"
    t.string   "signup_token"
    t.datetime "last_reconciliation_date"
    t.boolean  "vat_subjected"
    t.float    "debit_limit"
  end

  add_index "res_partner", ["company_id"], name: "res_partner_company_id_index", using: :btree
  add_index "res_partner", ["date"], name: "res_partner_date_index", using: :btree
  add_index "res_partner", ["display_name"], name: "res_partner_display_name_index", using: :btree
  add_index "res_partner", ["name"], name: "res_partner_name_index", using: :btree
  add_index "res_partner", ["parent_id"], name: "res_partner_parent_id_index", using: :btree
  add_index "res_partner", ["ref"], name: "res_partner_ref_index", using: :btree

  create_table "res_partner_bank", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "owner_name"
    t.datetime "create_date"
    t.string   "name"
    t.string   "zip",         limit: 24
    t.integer  "sequence"
    t.boolean  "footer"
    t.integer  "country_id"
    t.integer  "company_id"
    t.string   "bank_name"
    t.integer  "write_uid"
    t.string   "state",                  null: false
    t.string   "street"
    t.string   "city"
    t.datetime "write_date"
    t.integer  "state_id"
    t.string   "bank_bic",    limit: 16
    t.integer  "partner_id"
    t.integer  "bank"
    t.string   "acc_number",  limit: 64, null: false
    t.integer  "journal_id"
  end

  add_index "res_partner_bank", ["partner_id"], name: "res_partner_bank_partner_id_index", using: :btree

  create_table "res_partner_bank_type", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",          limit: 64, null: false
    t.datetime "create_date"
    t.string   "name",                     null: false
    t.integer  "write_uid"
    t.text     "format_layout"
    t.datetime "write_date"
  end

  create_table "res_partner_bank_type_field", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",         null: false
    t.boolean  "required"
    t.integer  "write_uid"
    t.boolean  "readonly"
    t.datetime "write_date"
    t.integer  "bank_type_id", null: false
    t.integer  "size"
  end

  create_table "res_partner_category", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",         null: false
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
    t.string   "domain",      null: false
    t.datetime "create_date"
    t.string   "name",        null: false
    t.string   "shortcut"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "res_request_link", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.string   "object",      null: false
    t.integer  "write_uid"
    t.integer  "priority"
    t.datetime "write_date"
  end

  create_table "res_users", force: :cascade do |t|
    t.boolean  "active",                                   default: true
    t.string   "login",                         limit: 64,                null: false
    t.string   "password"
    t.integer  "company_id",                                              null: false
    t.integer  "partner_id",                                              null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.date     "login_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.text     "signature"
    t.integer  "action_id"
    t.string   "password_crypt"
    t.string   "access_token"
    t.integer  "alias_id",                                                null: false
    t.boolean  "display_groups_suggestions"
    t.integer  "default_section_id"
    t.boolean  "share"
    t.boolean  "display_employees_suggestions"
  end

  add_index "res_users", ["login"], name: "res_users_login_key", unique: true, using: :btree
  add_index "res_users", ["login_date"], name: "res_users_login_date_index", using: :btree

  create_table "resource_calendar", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "manager"
    t.datetime "write_date"
  end

  create_table "resource_calendar_attendance", force: :cascade do |t|
    t.string   "dayofweek",   null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.date     "date_from"
    t.integer  "write_uid"
    t.float    "hour_from",   null: false
    t.float    "hour_to",     null: false
    t.datetime "write_date"
    t.integer  "calendar_id", null: false
  end

  add_index "resource_calendar_attendance", ["dayofweek"], name: "resource_calendar_attendance_dayofweek_index", using: :btree
  add_index "resource_calendar_attendance", ["hour_from"], name: "resource_calendar_attendance_hour_from_index", using: :btree

  create_table "resource_calendar_leaves", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "resource_id"
    t.datetime "date_from",   null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "date_to",     null: false
    t.integer  "calendar_id"
  end

  create_table "resource_resource", force: :cascade do |t|
    t.integer  "create_uid"
    t.float    "time_efficiency",            null: false
    t.string   "code",            limit: 16
    t.integer  "user_id"
    t.string   "name",                       null: false
    t.integer  "company_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "calendar_id"
    t.boolean  "active"
    t.datetime "create_date"
    t.string   "resource_type",              null: false
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
    t.boolean  "group_multi_salesteams"
  end

  create_table "sale_member_rel", id: false, force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "member_id",  null: false
  end

  add_index "sale_member_rel", ["member_id"], name: "sale_member_rel_member_id_index", using: :btree
  add_index "sale_member_rel", ["section_id", "member_id"], name: "sale_member_rel_section_id_member_id_key", unique: true, using: :btree
  add_index "sale_member_rel", ["section_id"], name: "sale_member_rel_section_id_index", using: :btree

  create_table "share_wizard", force: :cascade do |t|
    t.string   "domain"
    t.datetime "create_date"
    t.string   "user_type",                      null: false
    t.integer  "write_uid"
    t.string   "email_2",             limit: 64
    t.string   "email_3",             limit: 64
    t.string   "email_1",             limit: 64
    t.string   "record_name"
    t.text     "message"
    t.integer  "create_uid"
    t.boolean  "embed_option_title"
    t.text     "new_users"
    t.string   "access_mode",                    null: false
    t.integer  "action_id",                      null: false
    t.boolean  "invite"
    t.string   "view_type",                      null: false
    t.boolean  "embed_option_search"
    t.datetime "write_date"
    t.string   "name",                           null: false
  end

  create_table "share_wizard_res_group_rel", id: false, force: :cascade do |t|
    t.integer "share_id", null: false
    t.integer "group_id", null: false
  end

  add_index "share_wizard_res_group_rel", ["group_id"], name: "share_wizard_res_group_rel_group_id_index", using: :btree
  add_index "share_wizard_res_group_rel", ["share_id", "group_id"], name: "share_wizard_res_group_rel_share_id_group_id_key", unique: true, using: :btree
  add_index "share_wizard_res_group_rel", ["share_id"], name: "share_wizard_res_group_rel_share_id_index", using: :btree

  create_table "share_wizard_res_user_rel", id: false, force: :cascade do |t|
    t.integer "share_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "share_wizard_res_user_rel", ["share_id", "user_id"], name: "share_wizard_res_user_rel_share_id_user_id_key", unique: true, using: :btree
  add_index "share_wizard_res_user_rel", ["share_id"], name: "share_wizard_res_user_rel_share_id_index", using: :btree
  add_index "share_wizard_res_user_rel", ["user_id"], name: "share_wizard_res_user_rel_user_id_index", using: :btree

  create_table "share_wizard_result_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.boolean  "newly_created"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "user_id",                    null: false
    t.string   "password",        limit: 64
    t.integer  "share_wizard_id",            null: false
  end

  create_table "stock_change_product_qty", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "product_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "lot_id"
    t.decimal  "new_quantity", null: false
    t.integer  "location_id",  null: false
  end

  create_table "stock_change_standard_price", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.decimal  "new_price",   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "stock_config_settings", force: :cascade do |t|
    t.boolean  "group_uom"
    t.integer  "create_uid"
    t.boolean  "module_procurement_jit"
    t.boolean  "group_stock_packaging"
    t.datetime "create_date"
    t.boolean  "module_claim_from_delivery"
    t.boolean  "group_stock_multiple_locations"
    t.boolean  "module_stock_picking_wave"
    t.integer  "decimal_precision"
    t.boolean  "module_product_expiry"
    t.integer  "company_id",                      null: false
    t.integer  "write_uid"
    t.boolean  "group_stock_adv_location"
    t.boolean  "group_stock_tracking_lot"
    t.datetime "write_date"
    t.boolean  "group_stock_production_lot"
    t.boolean  "module_stock_dropshipping"
    t.boolean  "group_stock_tracking_owner"
    t.boolean  "group_uos"
    t.boolean  "module_stock_landed_costs"
    t.boolean  "group_stock_inventory_valuation"
    t.boolean  "module_stock_invoice_directly"
  end

  create_table "stock_fixed_putaway_strat", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "putaway_id",        null: false
    t.integer  "sequence"
    t.integer  "write_uid"
    t.integer  "fixed_location_id", null: false
    t.datetime "write_date"
    t.integer  "category_id",       null: false
  end

  create_table "stock_incoterms", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "code",        limit: 3, null: false
    t.datetime "create_date"
    t.string   "name",                  null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.boolean  "active"
  end

  create_table "stock_inventory", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "location_id", null: false
    t.integer  "company_id",  null: false
    t.integer  "write_uid"
    t.string   "state"
    t.datetime "write_date"
    t.integer  "lot_id"
    t.datetime "date",        null: false
    t.integer  "package_id"
    t.integer  "partner_id"
    t.string   "filter",      null: false
    t.integer  "product_id"
    t.integer  "period_id"
  end

  add_index "stock_inventory", ["company_id"], name: "stock_inventory_company_id_index", using: :btree
  add_index "stock_inventory", ["state"], name: "stock_inventory_state_index", using: :btree

  create_table "stock_inventory_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "prodlot_name"
    t.string   "product_name"
    t.integer  "location_id",     null: false
    t.integer  "prod_lot_id"
    t.string   "location_name"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "inventory_id"
    t.integer  "package_id"
    t.datetime "write_date"
    t.decimal  "product_qty"
    t.decimal  "theoretical_qty"
    t.integer  "product_uom_id",  null: false
    t.string   "product_code"
    t.integer  "partner_id"
    t.integer  "product_id",      null: false
  end

  add_index "stock_inventory_line", ["company_id"], name: "stock_inventory_line_company_id_index", using: :btree
  add_index "stock_inventory_line", ["inventory_id"], name: "stock_inventory_line_inventory_id_index", using: :btree
  add_index "stock_inventory_line", ["location_id"], name: "stock_inventory_line_location_id_index", using: :btree
  add_index "stock_inventory_line", ["package_id"], name: "stock_inventory_line_package_id_index", using: :btree
  add_index "stock_inventory_line", ["product_id"], name: "stock_inventory_line_product_id_index", using: :btree

  create_table "stock_invoice_onshipping", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "journal_type"
    t.date     "invoice_date"
    t.integer  "journal_id",   null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.boolean  "group"
  end

  create_table "stock_location", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.text     "comment"
    t.integer  "putaway_strategy_id"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.integer  "location_id"
    t.integer  "removal_strategy_id"
    t.integer  "create_uid"
    t.integer  "partner_id"
    t.integer  "company_id"
    t.string   "complete_name"
    t.string   "usage",                    null: false
    t.string   "loc_barcode"
    t.boolean  "scrap_location"
    t.integer  "posz"
    t.integer  "posx"
    t.integer  "posy"
    t.boolean  "active"
    t.string   "name",                     null: false
    t.integer  "valuation_in_account_id"
    t.integer  "valuation_out_account_id"
  end

  add_index "stock_location", ["company_id"], name: "stock_location_company_id_index", using: :btree
  add_index "stock_location", ["loc_barcode", "company_id"], name: "stock_location_loc_barcode_company_uniq", unique: true, using: :btree
  add_index "stock_location", ["location_id"], name: "stock_location_location_id_index", using: :btree
  add_index "stock_location", ["parent_left"], name: "stock_location_parent_left_index", using: :btree
  add_index "stock_location", ["parent_right"], name: "stock_location_parent_right_index", using: :btree
  add_index "stock_location", ["usage"], name: "stock_location_usage_index", using: :btree

  create_table "stock_location_path", force: :cascade do |t|
    t.integer  "location_from_id", null: false
    t.integer  "create_uid"
    t.decimal  "route_sequence"
    t.datetime "create_date"
    t.string   "name",             null: false
    t.integer  "picking_type_id",  null: false
    t.string   "auto",             null: false
    t.integer  "sequence"
    t.integer  "company_id"
    t.integer  "warehouse_id"
    t.integer  "delay"
    t.integer  "route_id"
    t.integer  "location_dest_id", null: false
    t.datetime "write_date"
    t.boolean  "active"
    t.boolean  "propagate"
    t.integer  "write_uid"
    t.string   "invoice_state"
  end

  add_index "stock_location_path", ["auto"], name: "stock_location_path_auto_index", using: :btree
  add_index "stock_location_path", ["location_dest_id"], name: "stock_location_path_location_dest_id_index", using: :btree
  add_index "stock_location_path", ["location_from_id"], name: "stock_location_path_location_from_id_index", using: :btree

  create_table "stock_location_route", force: :cascade do |t|
    t.integer  "supplier_wh_id"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",                     null: false
    t.integer  "sequence"
    t.boolean  "warehouse_selectable"
    t.integer  "company_id"
    t.integer  "supplied_wh_id"
    t.boolean  "product_selectable"
    t.boolean  "product_categ_selectable"
    t.datetime "write_date"
    t.boolean  "active"
    t.integer  "write_uid"
  end

  add_index "stock_location_route", ["company_id"], name: "stock_location_route_company_id_index", using: :btree

  create_table "stock_location_route_categ", id: false, force: :cascade do |t|
    t.integer "categ_id", null: false
    t.integer "route_id", null: false
  end

  add_index "stock_location_route_categ", ["categ_id", "route_id"], name: "stock_location_route_categ_categ_id_route_id_key", unique: true, using: :btree
  add_index "stock_location_route_categ", ["categ_id"], name: "stock_location_route_categ_categ_id_index", using: :btree
  add_index "stock_location_route_categ", ["route_id"], name: "stock_location_route_categ_route_id_index", using: :btree

  create_table "stock_location_route_move", id: false, force: :cascade do |t|
    t.integer "move_id",  null: false
    t.integer "route_id", null: false
  end

  add_index "stock_location_route_move", ["move_id", "route_id"], name: "stock_location_route_move_move_id_route_id_key", unique: true, using: :btree
  add_index "stock_location_route_move", ["move_id"], name: "stock_location_route_move_move_id_index", using: :btree
  add_index "stock_location_route_move", ["route_id"], name: "stock_location_route_move_route_id_index", using: :btree

  create_table "stock_location_route_procurement", id: false, force: :cascade do |t|
    t.integer "procurement_id", null: false
    t.integer "route_id",       null: false
  end

  add_index "stock_location_route_procurement", ["procurement_id", "route_id"], name: "stock_location_route_procurement_procurement_id_route_id_key", unique: true, using: :btree
  add_index "stock_location_route_procurement", ["procurement_id"], name: "stock_location_route_procurement_procurement_id_index", using: :btree
  add_index "stock_location_route_procurement", ["route_id"], name: "stock_location_route_procurement_route_id_index", using: :btree

  create_table "stock_move", force: :cascade do |t|
    t.string   "origin"
    t.decimal  "product_uos_qty"
    t.datetime "create_date"
    t.integer  "move_dest_id"
    t.integer  "product_uom",             null: false
    t.float    "price_unit"
    t.decimal  "product_uom_qty",         null: false
    t.integer  "company_id",              null: false
    t.datetime "date",                    null: false
    t.decimal  "product_qty"
    t.integer  "product_uos"
    t.integer  "location_id",             null: false
    t.string   "priority"
    t.integer  "picking_type_id"
    t.integer  "partner_id"
    t.text     "note"
    t.string   "state"
    t.integer  "origin_returned_move_id"
    t.integer  "product_packaging"
    t.datetime "date_expected",           null: false
    t.integer  "procurement_id"
    t.string   "name",                    null: false
    t.integer  "create_uid"
    t.integer  "warehouse_id"
    t.integer  "inventory_id"
    t.boolean  "partially_available"
    t.boolean  "propagate"
    t.integer  "restrict_partner_id"
    t.string   "procure_method",          null: false
    t.integer  "write_uid"
    t.integer  "restrict_lot_id"
    t.integer  "group_id"
    t.integer  "product_id",              null: false
    t.integer  "split_from"
    t.integer  "picking_id"
    t.integer  "location_dest_id",        null: false
    t.datetime "write_date"
    t.integer  "push_rule_id"
    t.integer  "rule_id"
    t.string   "invoice_state",           null: false
    t.integer  "purchase_line_id"
  end

  add_index "stock_move", ["company_id"], name: "stock_move_company_id_index", using: :btree
  add_index "stock_move", ["create_date"], name: "stock_move_create_date_index", using: :btree
  add_index "stock_move", ["date"], name: "stock_move_date_index", using: :btree
  add_index "stock_move", ["date_expected"], name: "stock_move_date_expected_index", using: :btree
  add_index "stock_move", ["invoice_state"], name: "stock_move_invoice_state_index", using: :btree
  add_index "stock_move", ["location_dest_id"], name: "stock_move_location_dest_id_index", using: :btree
  add_index "stock_move", ["location_id"], name: "stock_move_location_id_index", using: :btree
  add_index "stock_move", ["move_dest_id"], name: "stock_move_move_dest_id_index", using: :btree
  add_index "stock_move", ["name"], name: "stock_move_name_index", using: :btree
  add_index "stock_move", ["picking_id"], name: "stock_move_picking_id_index", using: :btree
  add_index "stock_move", ["product_id", "location_id", "location_dest_id", "company_id", "state"], name: "stock_move_product_location_index", using: :btree
  add_index "stock_move", ["product_id"], name: "stock_move_product_id_index", using: :btree
  add_index "stock_move", ["purchase_line_id"], name: "stock_move_purchase_line_id_index", using: :btree
  add_index "stock_move", ["state"], name: "stock_move_state_index", using: :btree

  create_table "stock_move_operation_link", force: :cascade do |t|
    t.integer  "reserved_quant_id"
    t.datetime "create_date"
    t.integer  "create_uid"
    t.float    "qty"
    t.datetime "write_date"
    t.integer  "operation_id",      null: false
    t.integer  "write_uid"
    t.integer  "move_id",           null: false
  end

  create_table "stock_move_scrap", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "product_id",      null: false
    t.integer  "product_uom",     null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.decimal  "product_qty",     null: false
    t.integer  "location_id",     null: false
    t.integer  "restrict_lot_id"
  end

  add_index "stock_move_scrap", ["product_id"], name: "stock_move_scrap_product_id_index", using: :btree

  create_table "stock_pack_operation", force: :cascade do |t|
    t.datetime "create_date"
    t.integer  "result_package_id"
    t.integer  "write_uid"
    t.integer  "currency"
    t.integer  "package_id"
    t.float    "cost"
    t.decimal  "product_qty",       null: false
    t.integer  "lot_id"
    t.integer  "location_id",       null: false
    t.integer  "create_uid"
    t.decimal  "qty_done"
    t.integer  "owner_id"
    t.datetime "write_date"
    t.datetime "date",              null: false
    t.integer  "product_id"
    t.integer  "product_uom_id"
    t.integer  "location_dest_id",  null: false
    t.string   "processed",         null: false
    t.integer  "picking_id",        null: false
  end

  create_table "stock_picking", force: :cascade do |t|
    t.string   "origin"
    t.datetime "create_date"
    t.datetime "date_done"
    t.integer  "write_uid"
    t.integer  "partner_id"
    t.string   "priority",             null: false
    t.integer  "backorder_id"
    t.integer  "picking_type_id",      null: false
    t.string   "move_type",            null: false
    t.datetime "message_last_post"
    t.integer  "company_id",           null: false
    t.text     "note"
    t.string   "state"
    t.integer  "owner_id"
    t.integer  "create_uid"
    t.datetime "min_date"
    t.datetime "write_date"
    t.datetime "date"
    t.string   "name"
    t.boolean  "recompute_pack_op"
    t.datetime "max_date"
    t.integer  "group_id"
    t.string   "invoice_state",        null: false
    t.boolean  "reception_to_invoice"
  end

  add_index "stock_picking", ["backorder_id"], name: "stock_picking_backorder_id_index", using: :btree
  add_index "stock_picking", ["company_id"], name: "stock_picking_company_id_index", using: :btree
  add_index "stock_picking", ["date"], name: "stock_picking_date_index", using: :btree
  add_index "stock_picking", ["max_date"], name: "stock_picking_max_date_index", using: :btree
  add_index "stock_picking", ["min_date"], name: "stock_picking_min_date_index", using: :btree
  add_index "stock_picking", ["name", "company_id"], name: "stock_picking_name_uniq", unique: true, using: :btree
  add_index "stock_picking", ["name"], name: "stock_picking_name_index", using: :btree
  add_index "stock_picking", ["origin"], name: "stock_picking_origin_index", using: :btree
  add_index "stock_picking", ["priority"], name: "stock_picking_priority_index", using: :btree
  add_index "stock_picking", ["state"], name: "stock_picking_state_index", using: :btree

  create_table "stock_picking_type", force: :cascade do |t|
    t.string   "code",                     null: false
    t.datetime "create_date"
    t.integer  "sequence"
    t.integer  "color"
    t.integer  "write_uid"
    t.integer  "create_uid"
    t.integer  "default_location_dest_id"
    t.integer  "warehouse_id"
    t.integer  "sequence_id",              null: false
    t.datetime "write_date"
    t.boolean  "active"
    t.string   "name",                     null: false
    t.integer  "return_picking_type_id"
    t.integer  "default_location_src_id"
  end

  create_table "stock_production_lot", force: :cascade do |t|
    t.datetime "create_date"
    t.string   "name",              null: false
    t.integer  "create_uid"
    t.datetime "message_last_post"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "ref"
    t.integer  "product_id",        null: false
  end

  add_index "stock_production_lot", ["name", "ref", "product_id"], name: "stock_production_lot_name_ref_uniq", unique: true, using: :btree

  create_table "stock_quant", force: :cascade do |t|
    t.datetime "create_date"
    t.float    "qty",                null: false
    t.integer  "propagated_from_id"
    t.integer  "package_id"
    t.float    "cost"
    t.integer  "lot_id"
    t.integer  "reservation_id"
    t.integer  "create_uid"
    t.integer  "location_id",        null: false
    t.integer  "company_id",         null: false
    t.integer  "owner_id"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.integer  "product_id",         null: false
    t.integer  "packaging_type_id"
    t.integer  "negative_move_id"
    t.datetime "in_date"
  end

  add_index "stock_quant", ["company_id"], name: "stock_quant_company_id_index", using: :btree
  add_index "stock_quant", ["in_date"], name: "stock_quant_in_date_index", using: :btree
  add_index "stock_quant", ["location_id"], name: "stock_quant_location_id_index", using: :btree
  add_index "stock_quant", ["lot_id"], name: "stock_quant_lot_id_index", using: :btree
  add_index "stock_quant", ["owner_id"], name: "stock_quant_owner_id_index", using: :btree
  add_index "stock_quant", ["package_id"], name: "stock_quant_package_id_index", using: :btree
  add_index "stock_quant", ["product_id", "location_id", "company_id", "qty", "in_date", "reservation_id"], name: "stock_quant_product_location_index", using: :btree
  add_index "stock_quant", ["product_id"], name: "stock_quant_product_id_index", using: :btree
  add_index "stock_quant", ["propagated_from_id"], name: "stock_quant_propagated_from_id_index", using: :btree
  add_index "stock_quant", ["qty"], name: "stock_quant_qty_index", using: :btree
  add_index "stock_quant", ["reservation_id"], name: "stock_quant_reservation_id_index", using: :btree

  create_table "stock_quant_move_rel", id: false, force: :cascade do |t|
    t.integer "quant_id", null: false
    t.integer "move_id",  null: false
  end

  add_index "stock_quant_move_rel", ["move_id"], name: "stock_quant_move_rel_move_id_index", using: :btree
  add_index "stock_quant_move_rel", ["quant_id", "move_id"], name: "stock_quant_move_rel_quant_id_move_id_key", unique: true, using: :btree
  add_index "stock_quant_move_rel", ["quant_id"], name: "stock_quant_move_rel_quant_id_index", using: :btree

  create_table "stock_quant_package", force: :cascade do |t|
    t.integer  "parent_left"
    t.integer  "parent_right"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "company_id"
    t.integer  "write_uid"
    t.integer  "ul_id"
    t.integer  "parent_id"
    t.datetime "write_date"
    t.integer  "packaging_id"
    t.integer  "location_id"
    t.integer  "owner_id"
  end

  add_index "stock_quant_package", ["company_id"], name: "stock_quant_package_company_id_index", using: :btree
  add_index "stock_quant_package", ["location_id"], name: "stock_quant_package_location_id_index", using: :btree
  add_index "stock_quant_package", ["name"], name: "stock_quant_package_name_index", using: :btree
  add_index "stock_quant_package", ["owner_id"], name: "stock_quant_package_owner_id_index", using: :btree
  add_index "stock_quant_package", ["packaging_id"], name: "stock_quant_package_packaging_id_index", using: :btree
  add_index "stock_quant_package", ["parent_left"], name: "stock_quant_package_parent_left_index", using: :btree
  add_index "stock_quant_package", ["parent_right"], name: "stock_quant_package_parent_right_index", using: :btree

  create_table "stock_return_picking", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.boolean  "move_dest_exists"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "invoice_state",    null: false
  end

  create_table "stock_return_picking_line", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "product_id",  null: false
    t.integer  "wizard_id"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.integer  "lot_id"
    t.integer  "move_id"
    t.decimal  "quantity",    null: false
  end

  create_table "stock_route_product", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "route_id",   null: false
  end

  add_index "stock_route_product", ["product_id", "route_id"], name: "stock_route_product_product_id_route_id_key", unique: true, using: :btree
  add_index "stock_route_product", ["product_id"], name: "stock_route_product_product_id_index", using: :btree
  add_index "stock_route_product", ["route_id"], name: "stock_route_product_route_id_index", using: :btree

  create_table "stock_route_warehouse", id: false, force: :cascade do |t|
    t.integer "warehouse_id", null: false
    t.integer "route_id",     null: false
  end

  add_index "stock_route_warehouse", ["route_id"], name: "stock_route_warehouse_route_id_index", using: :btree
  add_index "stock_route_warehouse", ["warehouse_id", "route_id"], name: "stock_route_warehouse_warehouse_id_route_id_key", unique: true, using: :btree
  add_index "stock_route_warehouse", ["warehouse_id"], name: "stock_route_warehouse_warehouse_id_index", using: :btree

  create_table "stock_transfer_details", force: :cascade do |t|
    t.integer  "picking_id"
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "stock_transfer_details_items", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "sourceloc_id",      null: false
    t.integer  "destinationloc_id", null: false
    t.integer  "result_package_id"
    t.integer  "product_uom_id"
    t.integer  "owner_id"
    t.integer  "write_uid"
    t.datetime "date"
    t.integer  "package_id"
    t.integer  "packop_id"
    t.datetime "write_date"
    t.integer  "transfer_id"
    t.integer  "lot_id"
    t.decimal  "quantity"
    t.integer  "product_id"
  end

  create_table "stock_warehouse", force: :cascade do |t|
    t.integer  "crossdock_route_id"
    t.datetime "create_date"
    t.integer  "lot_stock_id",                     null: false
    t.integer  "wh_pack_stock_loc_id"
    t.integer  "company_id",                       null: false
    t.integer  "pick_type_id"
    t.string   "code",                   limit: 5, null: false
    t.integer  "partner_id"
    t.integer  "create_uid"
    t.integer  "mto_pull_id"
    t.integer  "reception_route_id"
    t.integer  "wh_input_stock_loc_id"
    t.string   "delivery_steps",                   null: false
    t.integer  "default_resupply_wh_id"
    t.integer  "view_location_id",                 null: false
    t.integer  "wh_qc_stock_loc_id"
    t.string   "reception_steps",                  null: false
    t.boolean  "resupply_from_wh"
    t.integer  "pack_type_id"
    t.integer  "wh_output_stock_loc_id"
    t.datetime "write_date"
    t.integer  "delivery_route_id"
    t.string   "name",                             null: false
    t.integer  "write_uid"
    t.integer  "in_type_id"
    t.integer  "out_type_id"
    t.integer  "int_type_id"
    t.integer  "buy_pull_id"
    t.boolean  "buy_to_resupply"
  end

  add_index "stock_warehouse", ["code", "company_id"], name: "stock_warehouse_warehouse_code_uniq", unique: true, using: :btree
  add_index "stock_warehouse", ["company_id"], name: "stock_warehouse_company_id_index", using: :btree
  add_index "stock_warehouse", ["name", "company_id"], name: "stock_warehouse_warehouse_name_uniq", unique: true, using: :btree
  add_index "stock_warehouse", ["name"], name: "stock_warehouse_name_index", using: :btree

  create_table "stock_warehouse_orderpoint", force: :cascade do |t|
    t.decimal  "product_max_qty", null: false
    t.integer  "create_uid"
    t.decimal  "qty_multiple",    null: false
    t.datetime "create_date"
    t.string   "name",            null: false
    t.integer  "location_id",     null: false
    t.integer  "company_id",      null: false
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "logic",           null: false
    t.boolean  "active"
    t.integer  "warehouse_id",    null: false
    t.decimal  "product_min_qty", null: false
    t.integer  "group_id"
    t.integer  "product_id",      null: false
  end

  create_table "stock_wh_resupply_table", id: false, force: :cascade do |t|
    t.integer "supplied_wh_id", null: false
    t.integer "supplier_wh_id", null: false
  end

  add_index "stock_wh_resupply_table", ["supplied_wh_id", "supplier_wh_id"], name: "stock_wh_resupply_table_supplied_wh_id_supplier_wh_id_key", unique: true, using: :btree
  add_index "stock_wh_resupply_table", ["supplied_wh_id"], name: "stock_wh_resupply_table_supplied_wh_id_index", using: :btree
  add_index "stock_wh_resupply_table", ["supplier_wh_id"], name: "stock_wh_resupply_table_supplier_wh_id_index", using: :btree

  create_table "temp_range", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "validate_account_move", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "validate_account_move_lines", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  create_table "wizard_ir_model_menu_create", force: :cascade do |t|
    t.integer  "menu_id",     null: false
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "name",        null: false
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "wizard_multi_charts_accounts", force: :cascade do |t|
    t.boolean  "only_one_chart_template"
    t.float    "purchase_tax_rate"
    t.boolean  "complete_tax_set"
    t.integer  "code_digits",             null: false
    t.datetime "create_date"
    t.integer  "create_uid"
    t.integer  "chart_template_id",       null: false
    t.integer  "sale_tax"
    t.integer  "company_id",              null: false
    t.integer  "purchase_tax"
    t.integer  "currency_id"
    t.datetime "write_date"
    t.float    "sale_tax_rate"
    t.integer  "write_uid"
  end

  create_table "wizard_validate_account_move_journal", id: false, force: :cascade do |t|
    t.integer "wizard_id",  null: false
    t.integer "journal_id", null: false
  end

  add_index "wizard_validate_account_move_journal", ["journal_id"], name: "wizard_validate_account_move_journal_journal_id_index", using: :btree
  add_index "wizard_validate_account_move_journal", ["wizard_id", "journal_id"], name: "wizard_validate_account_move_journal_wizard_id_journal_id_key", unique: true, using: :btree
  add_index "wizard_validate_account_move_journal", ["wizard_id"], name: "wizard_validate_account_move_journal_wizard_id_index", using: :btree

  create_table "wizard_validate_account_move_period", id: false, force: :cascade do |t|
    t.integer "wizard_id", null: false
    t.integer "period_id", null: false
  end

  add_index "wizard_validate_account_move_period", ["period_id"], name: "wizard_validate_account_move_period_period_id_index", using: :btree
  add_index "wizard_validate_account_move_period", ["wizard_id", "period_id"], name: "wizard_validate_account_move_period_wizard_id_period_id_key", unique: true, using: :btree
  add_index "wizard_validate_account_move_period", ["wizard_id"], name: "wizard_validate_account_move_period_wizard_id_index", using: :btree

  create_table "wizard_valuation_history", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.datetime "date",        null: false
    t.boolean  "choose_date"
  end

  create_table "wkf", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "osv",                         null: false
    t.boolean  "on_create",   default: false
    t.datetime "create_date"
    t.integer  "create_uid"
    t.datetime "write_date"
    t.integer  "write_uid"
  end

  add_index "wkf", ["on_create"], name: "wkf_on_create_index", using: :btree
  add_index "wkf", ["osv"], name: "wkf_osv_index", using: :btree

  create_table "wkf_activity", force: :cascade do |t|
    t.integer  "create_uid"
    t.string   "kind",                  null: false
    t.datetime "create_date"
    t.string   "name",                  null: false
    t.string   "join_mode",   limit: 3, null: false
    t.boolean  "flow_stop"
    t.integer  "write_uid"
    t.integer  "subflow_id"
    t.string   "split_mode",  limit: 3, null: false
    t.datetime "write_date"
    t.text     "action"
    t.integer  "wkf_id",                null: false
    t.string   "signal_send"
    t.boolean  "flow_start"
    t.integer  "action_id"
  end

  add_index "wkf_activity", ["wkf_id"], name: "wkf_activity_wkf_id_index", using: :btree

  create_table "wkf_instance", force: :cascade do |t|
    t.string  "res_type"
    t.integer "uid"
    t.integer "wkf_id"
    t.string  "state"
    t.integer "res_id"
  end

  add_index "wkf_instance", ["res_id", "wkf_id"], name: "wkf_instance_res_id_wkf_id_index", using: :btree
  add_index "wkf_instance", ["res_type", "res_id", "state"], name: "wkf_instance_res_type_res_id_state_index", using: :btree
  add_index "wkf_instance", ["wkf_id"], name: "wkf_instance_wkf_id_index", using: :btree

  create_table "wkf_transition", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.string   "trigger_model"
    t.string   "signal"
    t.integer  "sequence"
    t.integer  "write_uid"
    t.integer  "act_from",        null: false
    t.string   "condition",       null: false
    t.datetime "write_date"
    t.string   "trigger_expr_id"
    t.integer  "group_id"
    t.integer  "act_to",          null: false
  end

  add_index "wkf_transition", ["act_from"], name: "wkf_transition_act_from_index", using: :btree
  add_index "wkf_transition", ["act_to"], name: "wkf_transition_act_to_index", using: :btree

  create_table "wkf_triggers", force: :cascade do |t|
    t.integer "instance_id"
    t.integer "workitem_id", null: false
    t.string  "model"
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
    t.integer "act_id",     null: false
    t.integer "inst_id",    null: false
    t.integer "subflow_id"
    t.string  "state"
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
    t.string   "area",                           null: false
    t.boolean  "considered_in_allocation"
    t.string   "check_state"
    t.datetime "last_access"
    t.float    "maximum_weight"
    t.text     "description"
    t.boolean  "location_group_counting_active"
    t.integer  "location_group"
    t.integer  "plc_state"
    t.boolean  "outgoing_active"
    t.datetime "write_date"
    t.integer  "location_type"
    t.string   "aisle",                          null: false
    t.string   "y",                              null: false
    t.string   "x",                              null: false
    t.string   "z",                              null: false
  end

  create_table "wms_location_group", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "parent"
    t.boolean  "location_group_counting_active"
    t.string   "name",                           null: false
    t.integer  "state_out_locker"
    t.integer  "state_in_locker"
    t.string   "group_state_in"
    t.float    "max_fill_level"
    t.string   "system_code"
    t.datetime "write_date"
    t.string   "group_state_out"
    t.boolean  "no_locations"
    t.integer  "write_uid"
    t.string   "group_type"
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
    t.string   "type",        null: false
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
    t.string   "message_no"
    t.string   "message_text"
    t.integer  "write_uid"
    t.datetime "write_date"
  end

  create_table "wms_product", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.text     "description"
    t.integer  "write_uid"
    t.datetime "write_date"
    t.string   "name",        null: false
  end

  add_index "wms_product", ["name"], name: "wms_product_name_index", using: :btree

  create_table "wms_transport_order", force: :cascade do |t|
    t.integer  "create_uid"
    t.datetime "create_date"
    t.integer  "transport_unit",        null: false
    t.datetime "end_date"
    t.integer  "problem_message_no"
    t.integer  "source_location"
    t.integer  "target_location_group"
    t.datetime "problem_occurred"
    t.string   "priority"
    t.string   "state"
    t.integer  "target_location"
    t.datetime "start_date"
    t.datetime "write_date"
    t.integer  "write_uid"
    t.text     "problem_message"
  end

  create_table "wms_transport_unit", force: :cascade do |t|
    t.integer  "create_uid"
    t.integer  "product"
    t.datetime "create_date"
    t.integer  "parent"
    t.float    "weight"
    t.integer  "transport_unit_type"
    t.string   "barcode",             null: false
    t.integer  "write_uid"
    t.datetime "inventory_date"
    t.string   "state"
    t.integer  "target_location"
    t.datetime "actualLocation_date"
    t.datetime "write_date"
    t.integer  "product_quantity"
    t.integer  "inventory_user"
    t.integer  "actual_location"
    t.boolean  "empty"
  end

  add_index "wms_transport_unit", ["barcode"], name: "wms_transport_unit_barcode_index", using: :btree
  add_index "wms_transport_unit", ["barcode"], name: "wms_transport_unit_wms_transport_unit_barcode_unique", unique: true, using: :btree

  create_table "wms_transport_unit_type", force: :cascade do |t|
    t.float    "weight_max"
    t.datetime "create_date"
    t.text     "description"
    t.integer  "create_uid"
    t.float    "payload"
    t.string   "compatibility"
    t.integer  "height"
    t.integer  "width"
    t.integer  "length"
    t.datetime "write_date"
    t.float    "weight_tare"
    t.integer  "write_uid"
    t.string   "type",          null: false
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
    t.string   "error_no"
    t.text     "error_text"
  end

  create_table "workcenters_equipment_daq", force: :cascade do |t|
    t.string   "name"
    t.integer  "equipment_id"
    t.string   "address"
    t.string   "value"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "workcenters_equipment_states", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "address"
    t.string   "state"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workcenters_workstation_task_items", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "no"
    t.string   "name"
    t.integer  "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workcenters_workstation_tasks", force: :cascade do |t|
    t.integer  "workstation_id"
    t.string   "name"
    t.string   "no"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "account_account", "account_account", column: "parent_id", name: "account_account_parent_id_fkey", on_delete: :cascade
  add_foreign_key "account_account", "account_account_type", column: "user_type", name: "account_account_user_type_fkey", on_delete: :nullify
  add_foreign_key "account_account", "res_company", column: "company_id", name: "account_account_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_account", "res_currency", column: "currency_id", name: "account_account_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_account", "res_users", column: "create_uid", name: "account_account_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_account", "res_users", column: "write_uid", name: "account_account_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_account_consol_rel", "account_account", column: "child_id", name: "account_account_consol_rel_child_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_consol_rel", "account_account", column: "parent_id", name: "account_account_consol_rel_parent_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_financial_report", "account_account", column: "account_id", name: "account_account_financial_report_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_financial_report", "account_financial_report", column: "report_line_id", name: "account_account_financial_report_report_line_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_financial_report_type", "account_account_type", column: "account_type_id", name: "account_account_financial_report_type_account_type_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_financial_report_type", "account_financial_report", column: "report_id", name: "account_account_financial_report_type_report_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_tax_default_rel", "account_account", column: "account_id", name: "account_account_tax_default_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_tax_default_rel", "account_tax", column: "tax_id", name: "account_account_tax_default_rel_tax_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_template", "account_account_template", column: "parent_id", name: "account_account_template_parent_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_template", "account_account_type", column: "user_type", name: "account_account_template_user_type_fkey", on_delete: :nullify
  add_foreign_key "account_account_template", "account_chart_template", column: "chart_template_id", name: "account_account_template_chart_template_id_fkey", on_delete: :nullify
  add_foreign_key "account_account_template", "res_currency", column: "currency_id", name: "account_account_template_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_account_template", "res_users", column: "create_uid", name: "account_account_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_account_template", "res_users", column: "write_uid", name: "account_account_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_account_template_tax_rel", "account_account_template", column: "account_id", name: "account_account_template_tax_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_template_tax_rel", "account_tax_template", column: "tax_id", name: "account_account_template_tax_rel_tax_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_type", "res_users", column: "create_uid", name: "account_account_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_account_type", "res_users", column: "write_uid", name: "account_account_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_account_type_rel", "account_account", column: "account_id", name: "account_account_type_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_account_type_rel", "account_journal", column: "journal_id", name: "account_account_type_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_addtmpl_wizard", "account_account", column: "cparent_id", name: "account_addtmpl_wizard_cparent_id_fkey", on_delete: :nullify
  add_foreign_key "account_addtmpl_wizard", "res_users", column: "create_uid", name: "account_addtmpl_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_addtmpl_wizard", "res_users", column: "write_uid", name: "account_addtmpl_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance", "account_account", column: "chart_account_id", name: "account_aged_trial_balance_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance", "account_fiscalyear", column: "fiscalyear_id", name: "account_aged_trial_balance_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance", "account_period", column: "period_from", name: "account_aged_trial_balance_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance", "account_period", column: "period_to", name: "account_aged_trial_balance_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance", "res_users", column: "create_uid", name: "account_aged_trial_balance_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance", "res_users", column: "write_uid", name: "account_aged_trial_balance_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_aged_trial_balance_journal_rel", "account_aged_trial_balance", column: "account_id", name: "account_aged_trial_balance_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_aged_trial_balance_journal_rel", "account_journal", column: "journal_id", name: "account_aged_trial_balance_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_analytic_account", "account_analytic_account", column: "parent_id", name: "account_analytic_account_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "account_analytic_account", column: "template_id", name: "account_analytic_account_template_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_company", column: "company_id", name: "account_analytic_account_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_currency", column: "currency_id", name: "account_analytic_account_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_partner", column: "partner_id", name: "account_analytic_account_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_users", column: "create_uid", name: "account_analytic_account_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_users", column: "manager_id", name: "account_analytic_account_manager_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_users", column: "user_id", name: "account_analytic_account_user_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_account", "res_users", column: "write_uid", name: "account_analytic_account_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_balance", "res_users", column: "create_uid", name: "account_analytic_balance_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_balance", "res_users", column: "write_uid", name: "account_analytic_balance_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_chart", "res_users", column: "create_uid", name: "account_analytic_chart_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_chart", "res_users", column: "write_uid", name: "account_analytic_chart_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_cost_ledger", "res_users", column: "create_uid", name: "account_analytic_cost_ledger_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_cost_ledger", "res_users", column: "write_uid", name: "account_analytic_cost_ledger_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_cost_ledger_journal_report", "res_users", column: "create_uid", name: "account_analytic_cost_ledger_journal_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_cost_ledger_journal_report", "res_users", column: "write_uid", name: "account_analytic_cost_ledger_journal_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_inverted_balance", "res_users", column: "create_uid", name: "account_analytic_inverted_balance_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_inverted_balance", "res_users", column: "write_uid", name: "account_analytic_inverted_balance_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_journal", "res_company", column: "company_id", name: "account_analytic_journal_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_journal", "res_users", column: "create_uid", name: "account_analytic_journal_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_journal", "res_users", column: "write_uid", name: "account_analytic_journal_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_journal_name", "account_analytic_journal", column: "journal_print_id", name: "account_analytic_journal_name_journal_print_id_fkey", on_delete: :cascade
  add_foreign_key "account_analytic_journal_name", "account_analytic_journal_report", column: "journal_line_id", name: "account_analytic_journal_name_journal_line_id_fkey", on_delete: :cascade
  add_foreign_key "account_analytic_journal_report", "res_users", column: "create_uid", name: "account_analytic_journal_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_journal_report", "res_users", column: "write_uid", name: "account_analytic_journal_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "account_account", column: "general_account_id", name: "account_analytic_line_general_account_id_fkey", on_delete: :restrict
  add_foreign_key "account_analytic_line", "account_analytic_account", column: "account_id", name: "account_analytic_line_account_id_fkey", on_delete: :restrict
  add_foreign_key "account_analytic_line", "account_analytic_journal", column: "journal_id", name: "account_analytic_line_journal_id_fkey", on_delete: :restrict
  add_foreign_key "account_analytic_line", "account_move_line", column: "move_id", name: "account_analytic_line_move_id_fkey", on_delete: :cascade
  add_foreign_key "account_analytic_line", "product_product", column: "product_id", name: "account_analytic_line_product_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "product_uom", name: "account_analytic_line_product_uom_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "res_company", column: "company_id", name: "account_analytic_line_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "res_currency", column: "currency_id", name: "account_analytic_line_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "res_users", column: "create_uid", name: "account_analytic_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "res_users", column: "user_id", name: "account_analytic_line_user_id_fkey", on_delete: :nullify
  add_foreign_key "account_analytic_line", "res_users", column: "write_uid", name: "account_analytic_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_automatic_reconcile", "account_account", column: "writeoff_acc_id", name: "account_automatic_reconcile_writeoff_acc_id_fkey", on_delete: :nullify
  add_foreign_key "account_automatic_reconcile", "account_journal", column: "journal_id", name: "account_automatic_reconcile_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_automatic_reconcile", "account_period", column: "period_id", name: "account_automatic_reconcile_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_automatic_reconcile", "res_users", column: "create_uid", name: "account_automatic_reconcile_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_automatic_reconcile", "res_users", column: "write_uid", name: "account_automatic_reconcile_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report", "account_account", column: "chart_account_id", name: "account_balance_report_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report", "account_fiscalyear", column: "fiscalyear_id", name: "account_balance_report_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report", "account_period", column: "period_from", name: "account_balance_report_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report", "account_period", column: "period_to", name: "account_balance_report_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report", "res_users", column: "create_uid", name: "account_balance_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report", "res_users", column: "write_uid", name: "account_balance_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_balance_report_journal_rel", "account_balance_report", column: "account_id", name: "account_balance_report_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_balance_report_journal_rel", "account_journal", column: "journal_id", name: "account_balance_report_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_bank_accounts_wizard", "res_currency", column: "currency_id", name: "account_bank_accounts_wizard_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_accounts_wizard", "res_users", column: "create_uid", name: "account_bank_accounts_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_bank_accounts_wizard", "res_users", column: "write_uid", name: "account_bank_accounts_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_bank_accounts_wizard", "wizard_multi_charts_accounts", column: "bank_account_id", name: "account_bank_accounts_wizard_bank_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_bank_statement", "account_journal", column: "journal_id", name: "account_bank_statement_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement", "account_period", column: "period_id", name: "account_bank_statement_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement", "res_company", column: "company_id", name: "account_bank_statement_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement", "res_users", column: "create_uid", name: "account_bank_statement_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement", "res_users", column: "user_id", name: "account_bank_statement_user_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement", "res_users", column: "write_uid", name: "account_bank_statement_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "account_account", column: "account_id", name: "account_bank_statement_line_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "account_bank_statement", column: "statement_id", name: "account_bank_statement_line_statement_id_fkey", on_delete: :restrict
  add_foreign_key "account_bank_statement_line", "account_journal", column: "journal_id", name: "account_bank_statement_line_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "account_move", column: "journal_entry_id", name: "account_bank_statement_line_journal_entry_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "res_company", column: "company_id", name: "account_bank_statement_line_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "res_currency", column: "currency_id", name: "account_bank_statement_line_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "res_partner", column: "partner_id", name: "account_bank_statement_line_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "res_partner_bank", column: "bank_account_id", name: "account_bank_statement_line_bank_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "res_users", column: "create_uid", name: "account_bank_statement_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_bank_statement_line", "res_users", column: "write_uid", name: "account_bank_statement_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_cashbox_line", "account_bank_statement", column: "bank_statement_id", name: "account_cashbox_line_bank_statement_id_fkey", on_delete: :cascade
  add_foreign_key "account_cashbox_line", "res_users", column: "create_uid", name: "account_cashbox_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_cashbox_line", "res_users", column: "write_uid", name: "account_cashbox_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal", "account_account", column: "chart_account_id", name: "account_central_journal_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal", "account_fiscalyear", column: "fiscalyear_id", name: "account_central_journal_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal", "account_period", column: "period_from", name: "account_central_journal_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal", "account_period", column: "period_to", name: "account_central_journal_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal", "res_users", column: "create_uid", name: "account_central_journal_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal", "res_users", column: "write_uid", name: "account_central_journal_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_central_journal_journal_rel", "account_central_journal", column: "account_id", name: "account_central_journal_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_central_journal_journal_rel", "account_journal", column: "journal_id", name: "account_central_journal_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_change_currency", "res_currency", column: "currency_id", name: "account_change_currency_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_change_currency", "res_users", column: "create_uid", name: "account_change_currency_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_change_currency", "res_users", column: "write_uid", name: "account_change_currency_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_chart", "account_fiscalyear", column: "fiscalyear", name: "account_chart_fiscalyear_fkey", on_delete: :nullify
  add_foreign_key "account_chart", "account_period", column: "period_from", name: "account_chart_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_chart", "account_period", column: "period_to", name: "account_chart_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_chart", "res_users", column: "create_uid", name: "account_chart_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_chart", "res_users", column: "write_uid", name: "account_chart_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "account_root_id", name: "account_chart_template_account_root_id_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "bank_account_view_id", name: "account_chart_template_bank_account_view_id_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_expense", name: "account_chart_template_property_account_expense_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_expense_categ", name: "account_chart_template_property_account_expense_categ_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_expense_opening", name: "account_chart_template_property_account_expense_opening_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_income", name: "account_chart_template_property_account_income_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_income_categ", name: "account_chart_template_property_account_income_categ_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_income_opening", name: "account_chart_template_property_account_income_opening_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_payable", name: "account_chart_template_property_account_payable_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_account_template", column: "property_account_receivable", name: "account_chart_template_property_account_receivable_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_chart_template", column: "parent_id", name: "account_chart_template_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "account_tax_code_template", column: "tax_code_root_id", name: "account_chart_template_tax_code_root_id_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "res_currency", column: "currency_id", name: "account_chart_template_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "res_users", column: "create_uid", name: "account_chart_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_chart_template", "res_users", column: "write_uid", name: "account_chart_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report", "account_account", column: "chart_account_id", name: "account_common_account_report_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report", "account_fiscalyear", column: "fiscalyear_id", name: "account_common_account_report_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report", "account_period", column: "period_from", name: "account_common_account_report_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report", "account_period", column: "period_to", name: "account_common_account_report_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report", "res_users", column: "create_uid", name: "account_common_account_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report", "res_users", column: "write_uid", name: "account_common_account_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_account_report_account_journal_rel", "account_common_account_report", name: "account_common_account_report_account_common_account_repor_fkey", on_delete: :cascade
  add_foreign_key "account_common_account_report_account_journal_rel", "account_journal", name: "account_common_account_report_account_j_account_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_common_journal_report", "account_account", column: "chart_account_id", name: "account_common_journal_report_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_journal_report", "account_fiscalyear", column: "fiscalyear_id", name: "account_common_journal_report_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_journal_report", "account_period", column: "period_from", name: "account_common_journal_report_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_common_journal_report", "account_period", column: "period_to", name: "account_common_journal_report_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_common_journal_report", "res_users", column: "create_uid", name: "account_common_journal_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_journal_report", "res_users", column: "write_uid", name: "account_common_journal_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_journal_report_account_journal_rel", "account_common_journal_report", name: "account_common_journal_report_account_common_journal_repor_fkey", on_delete: :cascade
  add_foreign_key "account_common_journal_report_account_journal_rel", "account_journal", name: "account_common_journal_report_account_j_account_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_common_partner_report", "account_account", column: "chart_account_id", name: "account_common_partner_report_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_partner_report", "account_fiscalyear", column: "fiscalyear_id", name: "account_common_partner_report_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_partner_report", "account_period", column: "period_from", name: "account_common_partner_report_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_common_partner_report", "account_period", column: "period_to", name: "account_common_partner_report_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_common_partner_report", "res_users", column: "create_uid", name: "account_common_partner_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_partner_report", "res_users", column: "write_uid", name: "account_common_partner_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_partner_report_account_journal_rel", "account_common_partner_report", name: "account_common_partner_report_account_common_partner_repor_fkey", on_delete: :cascade
  add_foreign_key "account_common_partner_report_account_journal_rel", "account_journal", name: "account_common_partner_report_account_j_account_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_common_report", "account_account", column: "chart_account_id", name: "account_common_report_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_report", "account_fiscalyear", column: "fiscalyear_id", name: "account_common_report_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_common_report", "account_period", column: "period_from", name: "account_common_report_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_common_report", "account_period", column: "period_to", name: "account_common_report_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_common_report", "res_users", column: "create_uid", name: "account_common_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_report", "res_users", column: "write_uid", name: "account_common_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_common_report_account_journal_rel", "account_common_report", name: "account_common_report_account_jou_account_common_report_id_fkey", on_delete: :cascade
  add_foreign_key "account_common_report_account_journal_rel", "account_journal", name: "account_common_report_account_journal_r_account_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_config_settings", "account_chart_template", column: "chart_template_id", name: "account_config_settings_chart_template_id_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_journal", column: "purchase_journal_id", name: "account_config_settings_purchase_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_journal", column: "purchase_refund_journal_id", name: "account_config_settings_purchase_refund_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_journal", column: "sale_journal_id", name: "account_config_settings_sale_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_journal", column: "sale_refund_journal_id", name: "account_config_settings_sale_refund_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_tax", column: "default_purchase_tax", name: "account_config_settings_default_purchase_tax_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_tax", column: "default_sale_tax", name: "account_config_settings_default_sale_tax_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_tax_template", column: "purchase_tax", name: "account_config_settings_purchase_tax_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "account_tax_template", column: "sale_tax", name: "account_config_settings_sale_tax_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "res_company", column: "company_id", name: "account_config_settings_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "res_users", column: "create_uid", name: "account_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_config_settings", "res_users", column: "write_uid", name: "account_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_financial_report", "account_financial_report", column: "account_report_id", name: "account_financial_report_account_report_id_fkey", on_delete: :nullify
  add_foreign_key "account_financial_report", "account_financial_report", column: "parent_id", name: "account_financial_report_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_financial_report", "res_users", column: "create_uid", name: "account_financial_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_financial_report", "res_users", column: "write_uid", name: "account_financial_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position", "res_company", column: "company_id", name: "account_fiscal_position_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position", "res_country", column: "country_id", name: "account_fiscal_position_country_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position", "res_country_group", column: "country_group_id", name: "account_fiscal_position_country_group_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position", "res_users", column: "create_uid", name: "account_fiscal_position_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position", "res_users", column: "write_uid", name: "account_fiscal_position_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account", "account_account", column: "account_dest_id", name: "account_fiscal_position_account_account_dest_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account", "account_account", column: "account_src_id", name: "account_fiscal_position_account_account_src_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account", "account_fiscal_position", column: "position_id", name: "account_fiscal_position_account_position_id_fkey", on_delete: :cascade
  add_foreign_key "account_fiscal_position_account", "res_users", column: "create_uid", name: "account_fiscal_position_account_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account", "res_users", column: "write_uid", name: "account_fiscal_position_account_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account_template", "account_account_template", column: "account_dest_id", name: "account_fiscal_position_account_template_account_dest_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account_template", "account_account_template", column: "account_src_id", name: "account_fiscal_position_account_template_account_src_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account_template", "account_fiscal_position_template", column: "position_id", name: "account_fiscal_position_account_template_position_id_fkey", on_delete: :cascade
  add_foreign_key "account_fiscal_position_account_template", "res_users", column: "create_uid", name: "account_fiscal_position_account_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_account_template", "res_users", column: "write_uid", name: "account_fiscal_position_account_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax", "account_fiscal_position", column: "position_id", name: "account_fiscal_position_tax_position_id_fkey", on_delete: :cascade
  add_foreign_key "account_fiscal_position_tax", "account_tax", column: "tax_dest_id", name: "account_fiscal_position_tax_tax_dest_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax", "account_tax", column: "tax_src_id", name: "account_fiscal_position_tax_tax_src_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax", "res_users", column: "create_uid", name: "account_fiscal_position_tax_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax", "res_users", column: "write_uid", name: "account_fiscal_position_tax_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax_template", "account_fiscal_position_template", column: "position_id", name: "account_fiscal_position_tax_template_position_id_fkey", on_delete: :cascade
  add_foreign_key "account_fiscal_position_tax_template", "account_tax_template", column: "tax_dest_id", name: "account_fiscal_position_tax_template_tax_dest_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax_template", "account_tax_template", column: "tax_src_id", name: "account_fiscal_position_tax_template_tax_src_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax_template", "res_users", column: "create_uid", name: "account_fiscal_position_tax_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_tax_template", "res_users", column: "write_uid", name: "account_fiscal_position_tax_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_template", "account_chart_template", column: "chart_template_id", name: "account_fiscal_position_template_chart_template_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_template", "res_users", column: "create_uid", name: "account_fiscal_position_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscal_position_template", "res_users", column: "write_uid", name: "account_fiscal_position_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear", "account_journal_period", column: "end_journal_period_id", name: "account_fiscalyear_end_journal_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear", "res_company", column: "company_id", name: "account_fiscalyear_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear", "res_users", column: "create_uid", name: "account_fiscalyear_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear", "res_users", column: "write_uid", name: "account_fiscalyear_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close", "account_fiscalyear", column: "fy2_id", name: "account_fiscalyear_close_fy2_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close", "account_fiscalyear", column: "fy_id", name: "account_fiscalyear_close_fy_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close", "account_journal", column: "journal_id", name: "account_fiscalyear_close_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close", "account_period", column: "period_id", name: "account_fiscalyear_close_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close", "res_users", column: "create_uid", name: "account_fiscalyear_close_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close", "res_users", column: "write_uid", name: "account_fiscalyear_close_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close_state", "account_fiscalyear", column: "fy_id", name: "account_fiscalyear_close_state_fy_id_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close_state", "res_users", column: "create_uid", name: "account_fiscalyear_close_state_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_fiscalyear_close_state", "res_users", column: "write_uid", name: "account_fiscalyear_close_state_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal", "account_account", column: "chart_account_id", name: "account_general_journal_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal", "account_fiscalyear", column: "fiscalyear_id", name: "account_general_journal_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal", "account_period", column: "period_from", name: "account_general_journal_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal", "account_period", column: "period_to", name: "account_general_journal_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal", "res_users", column: "create_uid", name: "account_general_journal_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal", "res_users", column: "write_uid", name: "account_general_journal_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_general_journal_journal_rel", "account_general_journal", column: "account_id", name: "account_general_journal_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_general_journal_journal_rel", "account_journal", column: "journal_id", name: "account_general_journal_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_installer", "res_company", column: "company_id", name: "account_installer_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_installer", "res_users", column: "create_uid", name: "account_installer_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_installer", "res_users", column: "write_uid", name: "account_installer_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "account_account", column: "account_id", name: "account_invoice_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "account_fiscal_position", column: "fiscal_position", name: "account_invoice_fiscal_position_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "account_journal", column: "journal_id", name: "account_invoice_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "account_move", column: "move_id", name: "account_invoice_move_id_fkey", on_delete: :restrict
  add_foreign_key "account_invoice", "account_payment_term", column: "payment_term", name: "account_invoice_payment_term_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "account_period", column: "period_id", name: "account_invoice_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_company", column: "company_id", name: "account_invoice_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_currency", column: "currency_id", name: "account_invoice_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_partner", column: "commercial_partner_id", name: "account_invoice_commercial_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_partner", column: "partner_id", name: "account_invoice_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_partner_bank", column: "partner_bank_id", name: "account_invoice_partner_bank_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_users", column: "create_uid", name: "account_invoice_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_users", column: "user_id", name: "account_invoice_user_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice", "res_users", column: "write_uid", name: "account_invoice_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_cancel", "res_users", column: "create_uid", name: "account_invoice_cancel_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_cancel", "res_users", column: "write_uid", name: "account_invoice_cancel_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_confirm", "res_users", column: "create_uid", name: "account_invoice_confirm_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_confirm", "res_users", column: "write_uid", name: "account_invoice_confirm_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "account_account", column: "account_id", name: "account_invoice_line_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "account_analytic_account", column: "account_analytic_id", name: "account_invoice_line_account_analytic_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "account_invoice", column: "invoice_id", name: "account_invoice_line_invoice_id_fkey", on_delete: :cascade
  add_foreign_key "account_invoice_line", "product_product", column: "product_id", name: "account_invoice_line_product_id_fkey", on_delete: :restrict
  add_foreign_key "account_invoice_line", "product_uom", column: "uos_id", name: "account_invoice_line_uos_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "purchase_order_line", column: "purchase_line_id", name: "account_invoice_line_purchase_line_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "res_company", column: "company_id", name: "account_invoice_line_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "res_partner", column: "partner_id", name: "account_invoice_line_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "res_users", column: "create_uid", name: "account_invoice_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line", "res_users", column: "write_uid", name: "account_invoice_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_line_tax", "account_invoice_line", column: "invoice_line_id", name: "account_invoice_line_tax_invoice_line_id_fkey", on_delete: :cascade
  add_foreign_key "account_invoice_line_tax", "account_tax", column: "tax_id", name: "account_invoice_line_tax_tax_id_fkey", on_delete: :cascade
  add_foreign_key "account_invoice_refund", "account_journal", column: "journal_id", name: "account_invoice_refund_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_refund", "account_period", column: "period", name: "account_invoice_refund_period_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_refund", "res_users", column: "create_uid", name: "account_invoice_refund_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_refund", "res_users", column: "write_uid", name: "account_invoice_refund_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "account_account", column: "account_id", name: "account_invoice_tax_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "account_analytic_account", column: "account_analytic_id", name: "account_invoice_tax_account_analytic_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "account_invoice", column: "invoice_id", name: "account_invoice_tax_invoice_id_fkey", on_delete: :cascade
  add_foreign_key "account_invoice_tax", "account_tax_code", column: "base_code_id", name: "account_invoice_tax_base_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "account_tax_code", column: "tax_code_id", name: "account_invoice_tax_tax_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "res_company", column: "company_id", name: "account_invoice_tax_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "res_users", column: "create_uid", name: "account_invoice_tax_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_invoice_tax", "res_users", column: "write_uid", name: "account_invoice_tax_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "account_account", column: "default_credit_account_id", name: "account_journal_default_credit_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "account_account", column: "default_debit_account_id", name: "account_journal_default_debit_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "account_account", column: "internal_account_id", name: "account_journal_internal_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "account_account", column: "loss_account_id", name: "account_journal_loss_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "account_account", column: "profit_account_id", name: "account_journal_profit_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "account_analytic_journal", column: "analytic_journal_id", name: "account_journal_analytic_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "ir_sequence", column: "sequence_id", name: "account_journal_sequence_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "res_company", column: "company_id", name: "account_journal_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "res_currency", column: "currency", name: "account_journal_currency_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "res_users", column: "create_uid", name: "account_journal_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "res_users", column: "user_id", name: "account_journal_user_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal", "res_users", column: "write_uid", name: "account_journal_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_account_vat_declaration_rel", "account_journal", name: "account_journal_account_vat_declaration_account_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_account_vat_declaration_rel", "account_vat_declaration", name: "account_journal_account_vat_dec_account_vat_declaration_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_accounting_report_rel", "account_journal", name: "account_journal_accounting_report_rel_account_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_accounting_report_rel", "accounting_report", name: "account_journal_accounting_report_rel_accounting_report_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_cashbox_line", "account_journal", column: "journal_id", name: "account_journal_cashbox_line_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_cashbox_line", "res_users", column: "create_uid", name: "account_journal_cashbox_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_cashbox_line", "res_users", column: "write_uid", name: "account_journal_cashbox_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_group_rel", "account_journal", column: "journal_id", name: "account_journal_group_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_group_rel", "res_groups", column: "group_id", name: "account_journal_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_period", "account_journal", column: "journal_id", name: "account_journal_period_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_period", "account_period", column: "period_id", name: "account_journal_period_period_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_period", "res_company", column: "company_id", name: "account_journal_period_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_journal_period", "res_users", column: "create_uid", name: "account_journal_period_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_period", "res_users", column: "write_uid", name: "account_journal_period_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_select", "res_users", column: "create_uid", name: "account_journal_select_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_select", "res_users", column: "write_uid", name: "account_journal_select_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_journal_type_rel", "account_account_type", column: "type_id", name: "account_journal_type_rel_type_id_fkey", on_delete: :cascade
  add_foreign_key "account_journal_type_rel", "account_journal", column: "journal_id", name: "account_journal_type_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_model", "account_journal", column: "journal_id", name: "account_model_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_model", "res_company", column: "company_id", name: "account_model_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_model", "res_users", column: "create_uid", name: "account_model_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_model", "res_users", column: "write_uid", name: "account_model_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_model_line", "account_account", column: "account_id", name: "account_model_line_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_model_line", "account_analytic_account", column: "analytic_account_id", name: "account_model_line_analytic_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_model_line", "account_model", column: "model_id", name: "account_model_line_model_id_fkey", on_delete: :cascade
  add_foreign_key "account_model_line", "res_currency", column: "currency_id", name: "account_model_line_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_model_line", "res_partner", column: "partner_id", name: "account_model_line_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_model_line", "res_users", column: "create_uid", name: "account_model_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_model_line", "res_users", column: "write_uid", name: "account_model_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move", "account_journal", column: "journal_id", name: "account_move_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_move", "account_period", column: "period_id", name: "account_move_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_move", "res_company", column: "company_id", name: "account_move_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_move", "res_partner", column: "partner_id", name: "account_move_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_move", "res_users", column: "create_uid", name: "account_move_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move", "res_users", column: "write_uid", name: "account_move_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_bank_reconcile", "account_journal", column: "journal_id", name: "account_move_bank_reconcile_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_bank_reconcile", "res_users", column: "create_uid", name: "account_move_bank_reconcile_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_bank_reconcile", "res_users", column: "write_uid", name: "account_move_bank_reconcile_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_account", column: "account_id", name: "account_move_line_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_move_line", "account_analytic_account", column: "analytic_account_id", name: "account_move_line_analytic_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_bank_statement", column: "statement_id", name: "account_move_line_statement_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_journal", column: "journal_id", name: "account_move_line_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_move", column: "move_id", name: "account_move_line_move_id_fkey", on_delete: :cascade
  add_foreign_key "account_move_line", "account_move_reconcile", column: "reconcile_id", name: "account_move_line_reconcile_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_move_reconcile", column: "reconcile_partial_id", name: "account_move_line_reconcile_partial_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_period", column: "period_id", name: "account_move_line_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_tax", name: "account_move_line_account_tax_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "account_tax_code", column: "tax_code_id", name: "account_move_line_tax_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "product_product", column: "product_id", name: "account_move_line_product_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "product_uom", name: "account_move_line_product_uom_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "res_company", column: "company_id", name: "account_move_line_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "res_currency", column: "currency_id", name: "account_move_line_currency_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "res_partner", column: "partner_id", name: "account_move_line_partner_id_fkey", on_delete: :restrict
  add_foreign_key "account_move_line", "res_users", column: "create_uid", name: "account_move_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line", "res_users", column: "write_uid", name: "account_move_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile", "res_users", column: "create_uid", name: "account_move_line_reconcile_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile", "res_users", column: "write_uid", name: "account_move_line_reconcile_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_select", "account_account", column: "account_id", name: "account_move_line_reconcile_select_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_select", "res_users", column: "create_uid", name: "account_move_line_reconcile_select_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_select", "res_users", column: "write_uid", name: "account_move_line_reconcile_select_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_writeoff", "account_account", column: "writeoff_acc_id", name: "account_move_line_reconcile_writeoff_writeoff_acc_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_writeoff", "account_analytic_account", column: "analytic_id", name: "account_move_line_reconcile_writeoff_analytic_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_writeoff", "account_journal", column: "journal_id", name: "account_move_line_reconcile_writeoff_journal_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_writeoff", "res_users", column: "create_uid", name: "account_move_line_reconcile_writeoff_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_reconcile_writeoff", "res_users", column: "write_uid", name: "account_move_line_reconcile_writeoff_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_relation", "account_move_line", column: "line_id", name: "account_move_line_relation_line_id_fkey", on_delete: :cascade
  add_foreign_key "account_move_line_relation", "account_statement_from_invoice_lines", column: "move_id", name: "account_move_line_relation_move_id_fkey", on_delete: :cascade
  add_foreign_key "account_move_line_unreconcile_select", "account_account", column: "account_id", name: "account_move_line_unreconcile_select_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_unreconcile_select", "res_users", column: "create_uid", name: "account_move_line_unreconcile_select_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_line_unreconcile_select", "res_users", column: "write_uid", name: "account_move_line_unreconcile_select_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_reconcile", "res_users", column: "create_uid", name: "account_move_reconcile_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_move_reconcile", "res_users", column: "write_uid", name: "account_move_reconcile_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_open_closed_fiscalyear", "account_fiscalyear", column: "fyear_id", name: "account_open_closed_fiscalyear_fyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_open_closed_fiscalyear", "res_users", column: "create_uid", name: "account_open_closed_fiscalyear_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_open_closed_fiscalyear", "res_users", column: "write_uid", name: "account_open_closed_fiscalyear_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance", "account_account", column: "chart_account_id", name: "account_partner_balance_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance", "account_fiscalyear", column: "fiscalyear_id", name: "account_partner_balance_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance", "account_period", column: "period_from", name: "account_partner_balance_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance", "account_period", column: "period_to", name: "account_partner_balance_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance", "res_users", column: "create_uid", name: "account_partner_balance_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance", "res_users", column: "write_uid", name: "account_partner_balance_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_partner_balance_journal_rel", "account_journal", column: "journal_id", name: "account_partner_balance_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_partner_balance_journal_rel", "account_partner_balance", column: "account_id", name: "account_partner_balance_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_partner_ledger", "account_account", column: "chart_account_id", name: "account_partner_ledger_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_partner_ledger", "account_fiscalyear", column: "fiscalyear_id", name: "account_partner_ledger_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_partner_ledger", "account_period", column: "period_from", name: "account_partner_ledger_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_partner_ledger", "account_period", column: "period_to", name: "account_partner_ledger_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_partner_ledger", "res_users", column: "create_uid", name: "account_partner_ledger_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_partner_ledger", "res_users", column: "write_uid", name: "account_partner_ledger_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_partner_ledger_journal_rel", "account_journal", column: "journal_id", name: "account_partner_ledger_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_partner_ledger_journal_rel", "account_partner_ledger", column: "account_id", name: "account_partner_ledger_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_partner_reconcile_process", "res_partner", column: "next_partner_id", name: "account_partner_reconcile_process_next_partner_id_fkey", on_delete: :nullify
  add_foreign_key "account_partner_reconcile_process", "res_users", column: "create_uid", name: "account_partner_reconcile_process_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_partner_reconcile_process", "res_users", column: "write_uid", name: "account_partner_reconcile_process_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_payment_term", "res_users", column: "create_uid", name: "account_payment_term_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_payment_term", "res_users", column: "write_uid", name: "account_payment_term_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_payment_term_line", "account_payment_term", column: "payment_id", name: "account_payment_term_line_payment_id_fkey", on_delete: :cascade
  add_foreign_key "account_payment_term_line", "res_users", column: "create_uid", name: "account_payment_term_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_payment_term_line", "res_users", column: "write_uid", name: "account_payment_term_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_period", "account_fiscalyear", column: "fiscalyear_id", name: "account_period_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_period", "res_company", column: "company_id", name: "account_period_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_period", "res_users", column: "create_uid", name: "account_period_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_period", "res_users", column: "write_uid", name: "account_period_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_period_close", "res_users", column: "create_uid", name: "account_period_close_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_period_close", "res_users", column: "write_uid", name: "account_period_close_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal", "account_account", column: "chart_account_id", name: "account_print_journal_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal", "account_fiscalyear", column: "fiscalyear_id", name: "account_print_journal_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal", "account_period", column: "period_from", name: "account_print_journal_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal", "account_period", column: "period_to", name: "account_print_journal_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal", "res_users", column: "create_uid", name: "account_print_journal_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal", "res_users", column: "write_uid", name: "account_print_journal_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_print_journal_journal_rel", "account_journal", column: "journal_id", name: "account_print_journal_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_print_journal_journal_rel", "account_print_journal", column: "account_id", name: "account_print_journal_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_report_general_ledger", "account_account", column: "chart_account_id", name: "account_report_general_ledger_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_report_general_ledger", "account_fiscalyear", column: "fiscalyear_id", name: "account_report_general_ledger_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_report_general_ledger", "account_period", column: "period_from", name: "account_report_general_ledger_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_report_general_ledger", "account_period", column: "period_to", name: "account_report_general_ledger_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_report_general_ledger", "res_users", column: "create_uid", name: "account_report_general_ledger_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_report_general_ledger", "res_users", column: "write_uid", name: "account_report_general_ledger_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_report_general_ledger_journal_rel", "account_journal", column: "journal_id", name: "account_report_general_ledger_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "account_report_general_ledger_journal_rel", "account_report_general_ledger", column: "account_id", name: "account_report_general_ledger_journal_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_sequence_fiscalyear", "account_fiscalyear", column: "fiscalyear_id", name: "account_sequence_fiscalyear_fiscalyear_id_fkey", on_delete: :cascade
  add_foreign_key "account_sequence_fiscalyear", "ir_sequence", column: "sequence_id", name: "account_sequence_fiscalyear_sequence_id_fkey", on_delete: :cascade
  add_foreign_key "account_sequence_fiscalyear", "ir_sequence", column: "sequence_main_id", name: "account_sequence_fiscalyear_sequence_main_id_fkey", on_delete: :cascade
  add_foreign_key "account_sequence_fiscalyear", "res_users", column: "create_uid", name: "account_sequence_fiscalyear_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_sequence_fiscalyear", "res_users", column: "write_uid", name: "account_sequence_fiscalyear_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_state_open", "res_users", column: "create_uid", name: "account_state_open_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_state_open", "res_users", column: "write_uid", name: "account_state_open_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_statement_from_invoice_lines", "res_users", column: "create_uid", name: "account_statement_from_invoice_lines_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_statement_from_invoice_lines", "res_users", column: "write_uid", name: "account_statement_from_invoice_lines_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_statement_operation_template", "account_account", column: "account_id", name: "account_statement_operation_template_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_statement_operation_template", "account_analytic_account", column: "analytic_account_id", name: "account_statement_operation_template_analytic_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_statement_operation_template", "account_tax", column: "tax_id", name: "account_statement_operation_template_tax_id_fkey", on_delete: :restrict
  add_foreign_key "account_statement_operation_template", "res_users", column: "create_uid", name: "account_statement_operation_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_statement_operation_template", "res_users", column: "write_uid", name: "account_statement_operation_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_subscription", "account_model", column: "model_id", name: "account_subscription_model_id_fkey", on_delete: :nullify
  add_foreign_key "account_subscription", "res_users", column: "create_uid", name: "account_subscription_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_subscription", "res_users", column: "write_uid", name: "account_subscription_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_subscription_generate", "res_users", column: "create_uid", name: "account_subscription_generate_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_subscription_generate", "res_users", column: "write_uid", name: "account_subscription_generate_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_subscription_line", "account_move", column: "move_id", name: "account_subscription_line_move_id_fkey", on_delete: :nullify
  add_foreign_key "account_subscription_line", "account_subscription", column: "subscription_id", name: "account_subscription_line_subscription_id_fkey", on_delete: :nullify
  add_foreign_key "account_subscription_line", "res_users", column: "create_uid", name: "account_subscription_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_subscription_line", "res_users", column: "write_uid", name: "account_subscription_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_account", column: "account_collected_id", name: "account_tax_account_collected_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_account", column: "account_paid_id", name: "account_tax_account_paid_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_analytic_account", column: "account_analytic_collected_id", name: "account_tax_account_analytic_collected_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_analytic_account", column: "account_analytic_paid_id", name: "account_tax_account_analytic_paid_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_tax", column: "parent_id", name: "account_tax_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_tax_code", column: "base_code_id", name: "account_tax_base_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_tax_code", column: "ref_base_code_id", name: "account_tax_ref_base_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_tax_code", column: "ref_tax_code_id", name: "account_tax_ref_tax_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "account_tax_code", column: "tax_code_id", name: "account_tax_tax_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "res_company", column: "company_id", name: "account_tax_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "res_users", column: "create_uid", name: "account_tax_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax", "res_users", column: "write_uid", name: "account_tax_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_chart", "account_period", column: "period_id", name: "account_tax_chart_period_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_chart", "res_users", column: "create_uid", name: "account_tax_chart_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_chart", "res_users", column: "write_uid", name: "account_tax_chart_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code", "account_tax_code", column: "parent_id", name: "account_tax_code_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code", "res_company", column: "company_id", name: "account_tax_code_company_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code", "res_users", column: "create_uid", name: "account_tax_code_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code", "res_users", column: "write_uid", name: "account_tax_code_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code_template", "account_tax_code_template", column: "parent_id", name: "account_tax_code_template_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code_template", "res_users", column: "create_uid", name: "account_tax_code_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_code_template", "res_users", column: "write_uid", name: "account_tax_code_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_account_template", column: "account_collected_id", name: "account_tax_template_account_collected_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_account_template", column: "account_paid_id", name: "account_tax_template_account_paid_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_chart_template", column: "chart_template_id", name: "account_tax_template_chart_template_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_tax_code_template", column: "base_code_id", name: "account_tax_template_base_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_tax_code_template", column: "ref_base_code_id", name: "account_tax_template_ref_base_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_tax_code_template", column: "ref_tax_code_id", name: "account_tax_template_ref_tax_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_tax_code_template", column: "tax_code_id", name: "account_tax_template_tax_code_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "account_tax_template", column: "parent_id", name: "account_tax_template_parent_id_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "res_users", column: "create_uid", name: "account_tax_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_tax_template", "res_users", column: "write_uid", name: "account_tax_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_template_financial_report", "account_account_template", column: "account_template_id", name: "account_template_financial_report_account_template_id_fkey", on_delete: :cascade
  add_foreign_key "account_template_financial_report", "account_financial_report", column: "report_line_id", name: "account_template_financial_report_report_line_id_fkey", on_delete: :cascade
  add_foreign_key "account_unreconcile", "res_users", column: "create_uid", name: "account_unreconcile_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_unreconcile", "res_users", column: "write_uid", name: "account_unreconcile_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_unreconcile_reconcile", "res_users", column: "create_uid", name: "account_unreconcile_reconcile_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_unreconcile_reconcile", "res_users", column: "write_uid", name: "account_unreconcile_reconcile_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_use_model", "res_users", column: "create_uid", name: "account_use_model_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_use_model", "res_users", column: "write_uid", name: "account_use_model_write_uid_fkey", on_delete: :nullify
  add_foreign_key "account_use_model_relation", "account_model", column: "model_id", name: "account_use_model_relation_model_id_fkey", on_delete: :cascade
  add_foreign_key "account_use_model_relation", "account_use_model", column: "account_id", name: "account_use_model_relation_account_id_fkey", on_delete: :cascade
  add_foreign_key "account_vat_declaration", "account_account", column: "chart_account_id", name: "account_vat_declaration_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "account_vat_declaration", "account_fiscalyear", column: "fiscalyear_id", name: "account_vat_declaration_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "account_vat_declaration", "account_period", column: "period_from", name: "account_vat_declaration_period_from_fkey", on_delete: :nullify
  add_foreign_key "account_vat_declaration", "account_period", column: "period_to", name: "account_vat_declaration_period_to_fkey", on_delete: :nullify
  add_foreign_key "account_vat_declaration", "account_tax_code", column: "chart_tax_id", name: "account_vat_declaration_chart_tax_id_fkey", on_delete: :nullify
  add_foreign_key "account_vat_declaration", "res_users", column: "create_uid", name: "account_vat_declaration_create_uid_fkey", on_delete: :nullify
  add_foreign_key "account_vat_declaration", "res_users", column: "write_uid", name: "account_vat_declaration_write_uid_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_account", column: "chart_account_id", name: "accounting_report_chart_account_id_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_financial_report", column: "account_report_id", name: "accounting_report_account_report_id_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_fiscalyear", column: "fiscalyear_id", name: "accounting_report_fiscalyear_id_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_fiscalyear", column: "fiscalyear_id_cmp", name: "accounting_report_fiscalyear_id_cmp_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_period", column: "period_from", name: "accounting_report_period_from_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_period", column: "period_from_cmp", name: "accounting_report_period_from_cmp_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_period", column: "period_to", name: "accounting_report_period_to_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "account_period", column: "period_to_cmp", name: "accounting_report_period_to_cmp_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "res_users", column: "create_uid", name: "accounting_report_create_uid_fkey", on_delete: :nullify
  add_foreign_key "accounting_report", "res_users", column: "write_uid", name: "accounting_report_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_config_settings", "res_font", column: "font", name: "base_config_settings_font_fkey", on_delete: :nullify
  add_foreign_key "base_config_settings", "res_users", column: "auth_signup_template_user_id", name: "base_config_settings_auth_signup_template_user_id_fkey", on_delete: :nullify
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
  add_foreign_key "cash_box_in", "res_users", column: "create_uid", name: "cash_box_in_create_uid_fkey", on_delete: :nullify
  add_foreign_key "cash_box_in", "res_users", column: "write_uid", name: "cash_box_in_write_uid_fkey", on_delete: :nullify
  add_foreign_key "cash_box_out", "res_users", column: "create_uid", name: "cash_box_out_create_uid_fkey", on_delete: :nullify
  add_foreign_key "cash_box_out", "res_users", column: "write_uid", name: "cash_box_out_write_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "change_password_wizard", column: "wizard_id", name: "change_password_user_wizard_id_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "create_uid", name: "change_password_user_create_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "user_id", name: "change_password_user_user_id_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "write_uid", name: "change_password_user_write_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_wizard", "res_users", column: "create_uid", name: "change_password_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_wizard", "res_users", column: "write_uid", name: "change_password_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "crm_case_section", "crm_case_section", column: "parent_id", name: "crm_case_section_parent_id_fkey", on_delete: :nullify
  add_foreign_key "crm_case_section", "res_users", column: "create_uid", name: "crm_case_section_create_uid_fkey", on_delete: :nullify
  add_foreign_key "crm_case_section", "res_users", column: "user_id", name: "crm_case_section_user_id_fkey", on_delete: :nullify
  add_foreign_key "crm_case_section", "res_users", column: "write_uid", name: "crm_case_section_write_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision", "res_users", column: "create_uid", name: "decimal_precision_create_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision", "res_users", column: "write_uid", name: "decimal_precision_write_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision_test", "res_users", column: "create_uid", name: "decimal_precision_test_create_uid_fkey", on_delete: :nullify
  add_foreign_key "decimal_precision_test", "res_users", column: "write_uid", name: "decimal_precision_test_write_uid_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_act_report_xml", column: "report_template", name: "email_template_report_template_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_act_window", column: "ref_ir_act_window", name: "email_template_ref_ir_act_window_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_mail_server", column: "mail_server_id", name: "email_template_mail_server_id_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_model", column: "model_id", name: "email_template_model_id_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_model", column: "sub_object", name: "email_template_sub_object_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_model_fields", column: "model_object_field", name: "email_template_model_object_field_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_model_fields", column: "sub_model_object_field", name: "email_template_sub_model_object_field_fkey", on_delete: :nullify
  add_foreign_key "email_template", "ir_values", column: "ref_ir_value", name: "email_template_ref_ir_value_fkey", on_delete: :nullify
  add_foreign_key "email_template", "res_users", column: "create_uid", name: "email_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "email_template", "res_users", column: "write_uid", name: "email_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "email_template_attachment_rel", "email_template", name: "email_template_attachment_rel_email_template_id_fkey", on_delete: :cascade
  add_foreign_key "email_template_attachment_rel", "ir_attachment", column: "attachment_id", name: "email_template_attachment_rel_attachment_id_fkey", on_delete: :cascade
  add_foreign_key "email_template_preview", "ir_act_report_xml", column: "report_template", name: "email_template_preview_report_template_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_act_window", column: "ref_ir_act_window", name: "email_template_preview_ref_ir_act_window_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_mail_server", column: "mail_server_id", name: "email_template_preview_mail_server_id_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_model", column: "model_id", name: "email_template_preview_model_id_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_model", column: "sub_object", name: "email_template_preview_sub_object_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_model_fields", column: "model_object_field", name: "email_template_preview_model_object_field_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_model_fields", column: "sub_model_object_field", name: "email_template_preview_sub_model_object_field_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "ir_values", column: "ref_ir_value", name: "email_template_preview_ref_ir_value_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "res_users", column: "create_uid", name: "email_template_preview_create_uid_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview", "res_users", column: "write_uid", name: "email_template_preview_write_uid_fkey", on_delete: :nullify
  add_foreign_key "email_template_preview_res_partner_rel", "email_template_preview", name: "email_template_preview_res_partn_email_template_preview_id_fkey", on_delete: :cascade
  add_foreign_key "email_template_preview_res_partner_rel", "res_partner", name: "email_template_preview_res_partner_rel_res_partner_id_fkey", on_delete: :cascade
  add_foreign_key "employee_category_rel", "hr_employee", column: "emp_id", name: "employee_category_rel_emp_id_fkey", on_delete: :cascade
  add_foreign_key "employee_category_rel", "hr_employee_category", column: "category_id", name: "employee_category_rel_category_id_fkey", on_delete: :cascade
  add_foreign_key "fetchmail_config_settings", "res_users", column: "create_uid", name: "fetchmail_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "fetchmail_config_settings", "res_users", column: "write_uid", name: "fetchmail_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "fetchmail_server", "ir_act_server", column: "action_id", name: "fetchmail_server_action_id_fkey", on_delete: :nullify
  add_foreign_key "fetchmail_server", "ir_model", column: "object_id", name: "fetchmail_server_object_id_fkey", on_delete: :nullify
  add_foreign_key "fetchmail_server", "res_users", column: "create_uid", name: "fetchmail_server_create_uid_fkey", on_delete: :nullify
  add_foreign_key "fetchmail_server", "res_users", column: "write_uid", name: "fetchmail_server_write_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_config_settings", "res_users", column: "create_uid", name: "hr_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_config_settings", "res_users", column: "write_uid", name: "hr_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_department", "hr_department", column: "parent_id", name: "hr_department_parent_id_fkey", on_delete: :nullify
  add_foreign_key "hr_department", "hr_employee", column: "manager_id", name: "hr_department_manager_id_fkey", on_delete: :nullify
  add_foreign_key "hr_department", "res_company", column: "company_id", name: "hr_department_company_id_fkey", on_delete: :nullify
  add_foreign_key "hr_department", "res_users", column: "create_uid", name: "hr_department_create_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_department", "res_users", column: "write_uid", name: "hr_department_write_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "hr_department", column: "department_id", name: "hr_employee_department_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "hr_employee", column: "coach_id", name: "hr_employee_coach_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "hr_employee", column: "parent_id", name: "hr_employee_parent_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "hr_job", column: "job_id", name: "hr_employee_job_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "res_country", column: "country_id", name: "hr_employee_country_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "res_partner", column: "address_home_id", name: "hr_employee_address_home_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "res_partner", column: "address_id", name: "hr_employee_address_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "res_partner_bank", column: "bank_account_id", name: "hr_employee_bank_account_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "res_users", column: "create_uid", name: "hr_employee_create_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "res_users", column: "write_uid", name: "hr_employee_write_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_employee", "resource_resource", column: "resource_id", name: "hr_employee_resource_id_fkey", on_delete: :cascade
  add_foreign_key "hr_employee_category", "hr_employee_category", column: "parent_id", name: "hr_employee_category_parent_id_fkey", on_delete: :nullify
  add_foreign_key "hr_employee_category", "res_users", column: "create_uid", name: "hr_employee_category_create_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_employee_category", "res_users", column: "write_uid", name: "hr_employee_category_write_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_job", "hr_department", column: "department_id", name: "hr_job_department_id_fkey", on_delete: :nullify
  add_foreign_key "hr_job", "res_company", column: "company_id", name: "hr_job_company_id_fkey", on_delete: :nullify
  add_foreign_key "hr_job", "res_users", column: "create_uid", name: "hr_job_create_uid_fkey", on_delete: :nullify
  add_foreign_key "hr_job", "res_users", column: "write_uid", name: "hr_job_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_client", "res_users", column: "create_uid", name: "ir_act_client_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_client", "res_users", column: "write_uid", name: "ir_act_client_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "report_paperformat", column: "paperformat_id", name: "ir_act_report_xml_paperformat_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "res_users", column: "create_uid", name: "ir_act_report_xml_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "res_users", column: "write_uid", name: "ir_act_report_xml_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "email_template", column: "template_id", name: "ir_act_server_template_id_fkey", on_delete: :nullify
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
  add_foreign_key "ir_ui_menu", "mail_group", name: "ir_ui_menu_mail_group_id_fkey", on_delete: :nullify
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
  add_foreign_key "ledger_journal_rel", "account_analytic_cost_ledger_journal_report", column: "ledger_id", name: "ledger_journal_rel_ledger_id_fkey", on_delete: :cascade
  add_foreign_key "ledger_journal_rel", "account_analytic_journal", column: "journal_id", name: "ledger_journal_rel_journal_id_fkey", on_delete: :cascade
  add_foreign_key "mail_alias", "ir_model", column: "alias_model_id", name: "mail_alias_alias_model_id_fkey", on_delete: :cascade
  add_foreign_key "mail_alias", "ir_model", column: "alias_parent_model_id", name: "mail_alias_alias_parent_model_id_fkey", on_delete: :nullify
  add_foreign_key "mail_alias", "res_users", column: "alias_user_id", name: "mail_alias_alias_user_id_fkey", on_delete: :nullify
  add_foreign_key "mail_alias", "res_users", column: "create_uid", name: "mail_alias_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_alias", "res_users", column: "write_uid", name: "mail_alias_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "email_template", column: "template_id", name: "mail_compose_message_template_id_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "ir_mail_server", column: "mail_server_id", name: "mail_compose_message_mail_server_id_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "mail_message", column: "parent_id", name: "mail_compose_message_parent_id_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "mail_message_subtype", column: "subtype_id", name: "mail_compose_message_subtype_id_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "res_partner", column: "author_id", name: "mail_compose_message_author_id_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "res_users", column: "create_uid", name: "mail_compose_message_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_compose_message", "res_users", column: "write_uid", name: "mail_compose_message_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_followers", "res_partner", column: "partner_id", name: "mail_followers_partner_id_fkey", on_delete: :cascade
  add_foreign_key "mail_followers_mail_message_subtype_rel", "mail_followers", column: "mail_followers_id", name: "mail_followers_mail_message_subtype_rel_mail_followers_id_fkey", on_delete: :cascade
  add_foreign_key "mail_followers_mail_message_subtype_rel", "mail_message_subtype", name: "mail_followers_mail_message_subtyp_mail_message_subtype_id_fkey", on_delete: :cascade
  add_foreign_key "mail_group", "ir_ui_menu", column: "menu_id", name: "mail_group_menu_id_fkey", on_delete: :cascade
  add_foreign_key "mail_group", "mail_alias", column: "alias_id", name: "mail_group_alias_id_fkey", on_delete: :restrict
  add_foreign_key "mail_group", "res_groups", column: "group_public_id", name: "mail_group_group_public_id_fkey", on_delete: :nullify
  add_foreign_key "mail_group", "res_users", column: "create_uid", name: "mail_group_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_group", "res_users", column: "write_uid", name: "mail_group_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_mail", "fetchmail_server", name: "mail_mail_fetchmail_server_id_fkey", on_delete: :nullify
  add_foreign_key "mail_mail", "mail_message", name: "mail_mail_mail_message_id_fkey", on_delete: :cascade
  add_foreign_key "mail_mail", "res_users", column: "create_uid", name: "mail_mail_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_mail", "res_users", column: "write_uid", name: "mail_mail_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_message", "ir_mail_server", column: "mail_server_id", name: "mail_message_mail_server_id_fkey", on_delete: :nullify
  add_foreign_key "mail_message", "mail_message", column: "parent_id", name: "mail_message_parent_id_fkey", on_delete: :nullify
  add_foreign_key "mail_message", "mail_message_subtype", column: "subtype_id", name: "mail_message_subtype_id_fkey", on_delete: :nullify
  add_foreign_key "mail_message", "res_partner", column: "author_id", name: "mail_message_author_id_fkey", on_delete: :nullify
  add_foreign_key "mail_message", "res_users", column: "create_uid", name: "mail_message_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_message", "res_users", column: "write_uid", name: "mail_message_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_message_subtype", "mail_message_subtype", column: "parent_id", name: "mail_message_subtype_parent_id_fkey", on_delete: :nullify
  add_foreign_key "mail_message_subtype", "res_users", column: "create_uid", name: "mail_message_subtype_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_message_subtype", "res_users", column: "write_uid", name: "mail_message_subtype_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_notification", "mail_message", column: "message_id", name: "mail_notification_message_id_fkey", on_delete: :cascade
  add_foreign_key "mail_notification", "res_partner", column: "partner_id", name: "mail_notification_partner_id_fkey", on_delete: :cascade
  add_foreign_key "mail_wizard_invite", "res_users", column: "create_uid", name: "mail_wizard_invite_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mail_wizard_invite", "res_users", column: "write_uid", name: "mail_wizard_invite_write_uid_fkey", on_delete: :nullify
  add_foreign_key "make_procurement", "product_product", column: "product_id", name: "make_procurement_product_id_fkey", on_delete: :nullify
  add_foreign_key "make_procurement", "product_uom", column: "uom_id", name: "make_procurement_uom_id_fkey", on_delete: :nullify
  add_foreign_key "make_procurement", "res_users", column: "create_uid", name: "make_procurement_create_uid_fkey", on_delete: :nullify
  add_foreign_key "make_procurement", "res_users", column: "write_uid", name: "make_procurement_write_uid_fkey", on_delete: :nullify
  add_foreign_key "make_procurement", "stock_warehouse", column: "warehouse_id", name: "make_procurement_warehouse_id_fkey", on_delete: :nullify
  add_foreign_key "mj_base_resource", "res_users", column: "create_uid", name: "mj_base_resource_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_base_resource", "res_users", column: "write_uid", name: "mj_base_resource_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "mj_product_base", column: "product", name: "mj_bill_of_material_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "res_users", column: "create_uid", name: "mj_bill_of_material_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_bill_of_material_base", "res_users", column: "write_uid", name: "mj_bill_of_material_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_dashboard_dashboard", "res_users", column: "create_uid", name: "mj_dashboard_dashboard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_dashboard_dashboard", "res_users", column: "write_uid", name: "mj_dashboard_dashboard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "mj_bill_of_material_base", column: "bill_of_material", name: "mj_material_base_bill_of_material_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "mj_product_base", column: "product", name: "mj_material_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "res_users", column: "create_uid", name: "mj_material_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_material_base", "res_users", column: "write_uid", name: "mj_material_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_procution_plan_base", "mj_product_base", column: "product", name: "mj_procution_plan_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_procution_plan_base", "res_users", column: "create_uid", name: "mj_procution_plan_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_procution_plan_base", "res_users", column: "write_uid", name: "mj_procution_plan_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_product_base", "res_users", column: "create_uid", name: "mj_product_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_product_base", "res_users", column: "write_uid", name: "mj_product_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_product_resource", "res_users", column: "create_uid", name: "mj_product_resource_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_product_resource", "res_users", column: "write_uid", name: "mj_product_resource_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "mj_production_base", column: "parent_id", name: "mj_production_base_parent_id_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "mj_production_plan_base", column: "production_plan", name: "mj_production_base_production_plan_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "res_users", column: "create_uid", name: "mj_production_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_base", "res_users", column: "write_uid", name: "mj_production_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "mj_product_base", column: "product", name: "mj_production_plan_base_product_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "res_users", column: "create_uid", name: "mj_production_plan_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_production_plan_base", "res_users", column: "write_uid", name: "mj_production_plan_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_base", "res_users", column: "create_uid", name: "mj_project_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_base", "res_users", column: "write_uid", name: "mj_project_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "mj_project_base", column: "project", name: "mj_project_user_base_project_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "create_uid", name: "mj_project_user_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "user", name: "mj_project_user_base_user_fkey", on_delete: :nullify
  add_foreign_key "mj_project_user_base", "res_users", column: "write_uid", name: "mj_project_user_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "mj_product_base", column: "product", name: "mj_routing_product_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "mj_product_base", column: "product_id", name: "mj_routing_product_id_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "res_users", column: "create_uid", name: "mj_routing_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing", "res_users", column: "write_uid", name: "mj_routing_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing_operation", "mj_routing", column: "routing_id", name: "mj_routing_operation_routing_id_fkey", on_delete: :nullify
  add_foreign_key "mj_routing_operation", "res_users", column: "create_uid", name: "mj_routing_operation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_routing_operation", "res_users", column: "write_uid", name: "mj_routing_operation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "res_users", column: "create_uid", name: "mj_stock_tray_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "res_users", column: "write_uid", name: "mj_stock_tray_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "wms_location", column: "location", name: "mj_stock_tray_base_location_fkey", on_delete: :nullify
  add_foreign_key "mj_stock_tray_base", "wms_transport_unit", column: "tray", name: "mj_stock_tray_base_tray_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_base", "mj_production_base", column: "production", name: "mj_tcs_order_base_production_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_base", "res_users", column: "create_uid", name: "mj_tcs_order_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_base", "res_users", column: "write_uid", name: "mj_tcs_order_base_write_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_tcs_order_task_base", "mj_tcs_order_base", column: "tcs_order", name: "mj_tcs_order_task_base_tcs_order_fkey", on_delete: :nullify
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
  add_foreign_key "mj_work_order_base", "res_users", column: "create_uid", name: "mj_work_order_base_create_uid_fkey", on_delete: :nullify
  add_foreign_key "mj_work_order_base", "res_users", column: "user", name: "mj_work_order_base_user_fkey", on_delete: :nullify
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
  add_foreign_key "payment_acquirer", "ir_ui_view", column: "view_template_id", name: "payment_acquirer_view_template_id_fkey", on_delete: :nullify
  add_foreign_key "payment_acquirer", "res_company", column: "company_id", name: "payment_acquirer_company_id_fkey", on_delete: :nullify
  add_foreign_key "payment_acquirer", "res_users", column: "create_uid", name: "payment_acquirer_create_uid_fkey", on_delete: :nullify
  add_foreign_key "payment_acquirer", "res_users", column: "write_uid", name: "payment_acquirer_write_uid_fkey", on_delete: :nullify
  add_foreign_key "payment_transaction", "payment_acquirer", column: "acquirer_id", name: "payment_transaction_acquirer_id_fkey", on_delete: :nullify
  add_foreign_key "payment_transaction", "res_country", column: "partner_country_id", name: "payment_transaction_partner_country_id_fkey", on_delete: :nullify
  add_foreign_key "payment_transaction", "res_currency", column: "currency_id", name: "payment_transaction_currency_id_fkey", on_delete: :nullify
  add_foreign_key "payment_transaction", "res_partner", column: "partner_id", name: "payment_transaction_partner_id_fkey", on_delete: :nullify
  add_foreign_key "payment_transaction", "res_users", column: "create_uid", name: "payment_transaction_create_uid_fkey", on_delete: :nullify
  add_foreign_key "payment_transaction", "res_users", column: "write_uid", name: "payment_transaction_write_uid_fkey", on_delete: :nullify
  add_foreign_key "portal_wizard", "res_groups", column: "portal_id", name: "portal_wizard_portal_id_fkey", on_delete: :nullify
  add_foreign_key "portal_wizard", "res_users", column: "create_uid", name: "portal_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "portal_wizard", "res_users", column: "write_uid", name: "portal_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "portal_wizard_user", "portal_wizard", column: "wizard_id", name: "portal_wizard_user_wizard_id_fkey", on_delete: :cascade
  add_foreign_key "portal_wizard_user", "res_partner", column: "partner_id", name: "portal_wizard_user_partner_id_fkey", on_delete: :nullify
  add_foreign_key "portal_wizard_user", "res_users", column: "create_uid", name: "portal_wizard_user_create_uid_fkey", on_delete: :nullify
  add_foreign_key "portal_wizard_user", "res_users", column: "write_uid", name: "portal_wizard_user_write_uid_fkey", on_delete: :nullify
  add_foreign_key "pricelist_partnerinfo", "product_supplierinfo", column: "suppinfo_id", name: "pricelist_partnerinfo_suppinfo_id_fkey", on_delete: :cascade
  add_foreign_key "pricelist_partnerinfo", "res_users", column: "create_uid", name: "pricelist_partnerinfo_create_uid_fkey", on_delete: :nullify
  add_foreign_key "pricelist_partnerinfo", "res_users", column: "write_uid", name: "pricelist_partnerinfo_write_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_group", "res_partner", column: "partner_id", name: "procurement_group_partner_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_group", "res_users", column: "create_uid", name: "procurement_group_create_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_group", "res_users", column: "write_uid", name: "procurement_group_write_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "procurement_group", column: "group_id", name: "procurement_order_group_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "procurement_rule", column: "rule_id", name: "procurement_order_rule_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "product_product", column: "product_id", name: "procurement_order_product_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "product_uom", column: "product_uom", name: "procurement_order_product_uom_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "product_uom", column: "product_uos", name: "procurement_order_product_uos_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "purchase_order_line", column: "purchase_line_id", name: "procurement_order_purchase_line_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "res_company", column: "company_id", name: "procurement_order_company_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "res_partner", column: "partner_dest_id", name: "procurement_order_partner_dest_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "res_users", column: "create_uid", name: "procurement_order_create_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "res_users", column: "write_uid", name: "procurement_order_write_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "stock_location", column: "location_id", name: "procurement_order_location_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "stock_move", column: "move_dest_id", name: "procurement_order_move_dest_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "stock_warehouse", column: "warehouse_id", name: "procurement_order_warehouse_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order", "stock_warehouse_orderpoint", column: "orderpoint_id", name: "procurement_order_orderpoint_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_order_compute_all", "res_users", column: "create_uid", name: "procurement_order_compute_all_create_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_order_compute_all", "res_users", column: "write_uid", name: "procurement_order_compute_all_write_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_orderpoint_compute", "res_users", column: "create_uid", name: "procurement_orderpoint_compute_create_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_orderpoint_compute", "res_users", column: "write_uid", name: "procurement_orderpoint_compute_write_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "procurement_group", column: "group_id", name: "procurement_rule_group_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "res_company", column: "company_id", name: "procurement_rule_company_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "res_partner", column: "partner_address_id", name: "procurement_rule_partner_address_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "res_users", column: "create_uid", name: "procurement_rule_create_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "res_users", column: "write_uid", name: "procurement_rule_write_uid_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "stock_location", column: "location_id", name: "procurement_rule_location_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "stock_location", column: "location_src_id", name: "procurement_rule_location_src_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "stock_location_route", column: "route_id", name: "procurement_rule_route_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "stock_picking_type", column: "picking_type_id", name: "procurement_rule_picking_type_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "stock_warehouse", column: "propagate_warehouse_id", name: "procurement_rule_propagate_warehouse_id_fkey", on_delete: :nullify
  add_foreign_key "procurement_rule", "stock_warehouse", column: "warehouse_id", name: "procurement_rule_warehouse_id_fkey", on_delete: :nullify
  add_foreign_key "product_attribute", "res_users", column: "create_uid", name: "product_attribute_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute", "res_users", column: "write_uid", name: "product_attribute_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_line", "product_attribute", column: "attribute_id", name: "product_attribute_line_attribute_id_fkey", on_delete: :restrict
  add_foreign_key "product_attribute_line", "product_template", column: "product_tmpl_id", name: "product_attribute_line_product_tmpl_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_line", "res_users", column: "create_uid", name: "product_attribute_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_line", "res_users", column: "write_uid", name: "product_attribute_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_line_product_attribute_value_rel", "product_attribute_line", column: "line_id", name: "product_attribute_line_product_attribute_value_rel_line_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_line_product_attribute_value_rel", "product_attribute_value", column: "val_id", name: "product_attribute_line_product_attribute_value_rel_val_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_price", "product_attribute_value", column: "value_id", name: "product_attribute_price_value_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_price", "product_template", column: "product_tmpl_id", name: "product_attribute_price_product_tmpl_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_price", "res_users", column: "create_uid", name: "product_attribute_price_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_price", "res_users", column: "write_uid", name: "product_attribute_price_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_value", "product_attribute", column: "attribute_id", name: "product_attribute_value_attribute_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_value", "res_users", column: "create_uid", name: "product_attribute_value_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_value", "res_users", column: "write_uid", name: "product_attribute_value_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_attribute_value_product_product_rel", "product_attribute_value", column: "att_id", name: "product_attribute_value_product_product_rel_att_id_fkey", on_delete: :cascade
  add_foreign_key "product_attribute_value_product_product_rel", "product_product", column: "prod_id", name: "product_attribute_value_product_product_rel_prod_id_fkey", on_delete: :cascade
  add_foreign_key "product_category", "product_category", column: "parent_id", name: "product_category_parent_id_fkey", on_delete: :cascade
  add_foreign_key "product_category", "product_removal", column: "removal_strategy_id", name: "product_category_removal_strategy_id_fkey", on_delete: :nullify
  add_foreign_key "product_category", "res_users", column: "create_uid", name: "product_category_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_category", "res_users", column: "write_uid", name: "product_category_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_packaging", "product_template", column: "product_tmpl_id", name: "product_packaging_product_tmpl_id_fkey", on_delete: :cascade
  add_foreign_key "product_packaging", "product_ul", column: "ul", name: "product_packaging_ul_fkey", on_delete: :nullify
  add_foreign_key "product_packaging", "product_ul", column: "ul_container", name: "product_packaging_ul_container_fkey", on_delete: :nullify
  add_foreign_key "product_packaging", "res_users", column: "create_uid", name: "product_packaging_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_packaging", "res_users", column: "write_uid", name: "product_packaging_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_price_history", "product_template", name: "product_price_history_product_template_id_fkey", on_delete: :cascade
  add_foreign_key "product_price_history", "res_company", column: "company_id", name: "product_price_history_company_id_fkey", on_delete: :nullify
  add_foreign_key "product_price_history", "res_users", column: "create_uid", name: "product_price_history_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_price_history", "res_users", column: "write_uid", name: "product_price_history_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_price_list", "product_pricelist", column: "price_list", name: "product_price_list_price_list_fkey", on_delete: :nullify
  add_foreign_key "product_price_list", "res_users", column: "create_uid", name: "product_price_list_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_price_list", "res_users", column: "write_uid", name: "product_price_list_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_price_type", "res_currency", column: "currency_id", name: "product_price_type_currency_id_fkey", on_delete: :nullify
  add_foreign_key "product_price_type", "res_users", column: "create_uid", name: "product_price_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_price_type", "res_users", column: "write_uid", name: "product_price_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist", "res_company", column: "company_id", name: "product_pricelist_company_id_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist", "res_currency", column: "currency_id", name: "product_pricelist_currency_id_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist", "res_users", column: "create_uid", name: "product_pricelist_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist", "res_users", column: "write_uid", name: "product_pricelist_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_item", "product_category", column: "categ_id", name: "product_pricelist_item_categ_id_fkey", on_delete: :cascade
  add_foreign_key "product_pricelist_item", "product_pricelist", column: "base_pricelist_id", name: "product_pricelist_item_base_pricelist_id_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_item", "product_pricelist_version", column: "price_version_id", name: "product_pricelist_item_price_version_id_fkey", on_delete: :cascade
  add_foreign_key "product_pricelist_item", "product_product", column: "product_id", name: "product_pricelist_item_product_id_fkey", on_delete: :cascade
  add_foreign_key "product_pricelist_item", "product_template", column: "product_tmpl_id", name: "product_pricelist_item_product_tmpl_id_fkey", on_delete: :cascade
  add_foreign_key "product_pricelist_item", "res_company", column: "company_id", name: "product_pricelist_item_company_id_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_item", "res_users", column: "create_uid", name: "product_pricelist_item_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_item", "res_users", column: "write_uid", name: "product_pricelist_item_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_type", "res_users", column: "create_uid", name: "product_pricelist_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_type", "res_users", column: "write_uid", name: "product_pricelist_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_version", "product_pricelist", column: "pricelist_id", name: "product_pricelist_version_pricelist_id_fkey", on_delete: :cascade
  add_foreign_key "product_pricelist_version", "res_company", column: "company_id", name: "product_pricelist_version_company_id_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_version", "res_users", column: "create_uid", name: "product_pricelist_version_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_pricelist_version", "res_users", column: "write_uid", name: "product_pricelist_version_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_product", "product_template", column: "product_tmpl_id", name: "product_product_product_tmpl_id_fkey", on_delete: :cascade
  add_foreign_key "product_product", "res_users", column: "create_uid", name: "product_product_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_product", "res_users", column: "write_uid", name: "product_product_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_putaway", "res_users", column: "create_uid", name: "product_putaway_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_putaway", "res_users", column: "write_uid", name: "product_putaway_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_removal", "res_users", column: "create_uid", name: "product_removal_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_removal", "res_users", column: "write_uid", name: "product_removal_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_supplier_taxes_rel", "account_tax", column: "tax_id", name: "product_supplier_taxes_rel_tax_id_fkey", on_delete: :cascade
  add_foreign_key "product_supplier_taxes_rel", "product_template", column: "prod_id", name: "product_supplier_taxes_rel_prod_id_fkey", on_delete: :cascade
  add_foreign_key "product_supplierinfo", "product_template", column: "product_tmpl_id", name: "product_supplierinfo_product_tmpl_id_fkey", on_delete: :cascade
  add_foreign_key "product_supplierinfo", "res_company", column: "company_id", name: "product_supplierinfo_company_id_fkey", on_delete: :nullify
  add_foreign_key "product_supplierinfo", "res_partner", column: "name", name: "product_supplierinfo_name_fkey", on_delete: :cascade
  add_foreign_key "product_supplierinfo", "res_users", column: "create_uid", name: "product_supplierinfo_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_supplierinfo", "res_users", column: "write_uid", name: "product_supplierinfo_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_taxes_rel", "account_tax", column: "tax_id", name: "product_taxes_rel_tax_id_fkey", on_delete: :cascade
  add_foreign_key "product_taxes_rel", "product_template", column: "prod_id", name: "product_taxes_rel_prod_id_fkey", on_delete: :cascade
  add_foreign_key "product_template", "product_category", column: "categ_id", name: "product_template_categ_id_fkey", on_delete: :nullify
  add_foreign_key "product_template", "product_uom", column: "uom_id", name: "product_template_uom_id_fkey", on_delete: :nullify
  add_foreign_key "product_template", "product_uom", column: "uom_po_id", name: "product_template_uom_po_id_fkey", on_delete: :nullify
  add_foreign_key "product_template", "product_uom", column: "uos_id", name: "product_template_uos_id_fkey", on_delete: :nullify
  add_foreign_key "product_template", "res_company", column: "company_id", name: "product_template_company_id_fkey", on_delete: :nullify
  add_foreign_key "product_template", "res_users", column: "create_uid", name: "product_template_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_template", "res_users", column: "product_manager", name: "product_template_product_manager_fkey", on_delete: :nullify
  add_foreign_key "product_template", "res_users", column: "write_uid", name: "product_template_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_ul", "res_users", column: "create_uid", name: "product_ul_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_ul", "res_users", column: "write_uid", name: "product_ul_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_uom", "product_uom_categ", column: "category_id", name: "product_uom_category_id_fkey", on_delete: :cascade
  add_foreign_key "product_uom", "res_users", column: "create_uid", name: "product_uom_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_uom", "res_users", column: "write_uid", name: "product_uom_write_uid_fkey", on_delete: :nullify
  add_foreign_key "product_uom_categ", "res_users", column: "create_uid", name: "product_uom_categ_create_uid_fkey", on_delete: :nullify
  add_foreign_key "product_uom_categ", "res_users", column: "write_uid", name: "product_uom_categ_write_uid_fkey", on_delete: :nullify
  add_foreign_key "project_account_analytic_line", "res_users", column: "create_uid", name: "project_account_analytic_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "project_account_analytic_line", "res_users", column: "write_uid", name: "project_account_analytic_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_config_settings", "res_users", column: "create_uid", name: "purchase_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_config_settings", "res_users", column: "write_uid", name: "purchase_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_invoice_rel", "account_invoice", column: "invoice_id", name: "purchase_invoice_rel_invoice_id_fkey", on_delete: :cascade
  add_foreign_key "purchase_invoice_rel", "purchase_order", column: "purchase_id", name: "purchase_invoice_rel_purchase_id_fkey", on_delete: :cascade
  add_foreign_key "purchase_order", "account_fiscal_position", column: "fiscal_position", name: "purchase_order_fiscal_position_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "account_journal", column: "journal_id", name: "purchase_order_journal_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "account_payment_term", column: "payment_term_id", name: "purchase_order_payment_term_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "product_pricelist", column: "pricelist_id", name: "purchase_order_pricelist_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_company", column: "company_id", name: "purchase_order_company_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_currency", column: "currency_id", name: "purchase_order_currency_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_partner", column: "dest_address_id", name: "purchase_order_dest_address_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_partner", column: "partner_id", name: "purchase_order_partner_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_users", column: "create_uid", name: "purchase_order_create_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_users", column: "validator", name: "purchase_order_validator_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "res_users", column: "write_uid", name: "purchase_order_write_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "stock_incoterms", column: "incoterm_id", name: "purchase_order_incoterm_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "stock_location", column: "location_id", name: "purchase_order_location_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "stock_location", column: "related_location_id", name: "purchase_order_related_location_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order", "stock_picking_type", column: "picking_type_id", name: "purchase_order_picking_type_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_group", "res_users", column: "create_uid", name: "purchase_order_group_create_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_group", "res_users", column: "write_uid", name: "purchase_order_group_write_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "account_analytic_account", column: "account_analytic_id", name: "purchase_order_line_account_analytic_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "product_product", column: "product_id", name: "purchase_order_line_product_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "product_uom", column: "product_uom", name: "purchase_order_line_product_uom_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "purchase_order", column: "order_id", name: "purchase_order_line_order_id_fkey", on_delete: :cascade
  add_foreign_key "purchase_order_line", "res_company", column: "company_id", name: "purchase_order_line_company_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "res_partner", column: "partner_id", name: "purchase_order_line_partner_id_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "res_users", column: "create_uid", name: "purchase_order_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line", "res_users", column: "write_uid", name: "purchase_order_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line_invoice", "res_users", column: "create_uid", name: "purchase_order_line_invoice_create_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line_invoice", "res_users", column: "write_uid", name: "purchase_order_line_invoice_write_uid_fkey", on_delete: :nullify
  add_foreign_key "purchase_order_line_invoice_rel", "account_invoice_line", column: "invoice_id", name: "purchase_order_line_invoice_rel_invoice_id_fkey", on_delete: :cascade
  add_foreign_key "purchase_order_line_invoice_rel", "purchase_order_line", column: "order_line_id", name: "purchase_order_line_invoice_rel_order_line_id_fkey", on_delete: :cascade
  add_foreign_key "purchase_order_taxe", "account_tax", column: "tax_id", name: "purchase_order_taxe_tax_id_fkey", on_delete: :cascade
  add_foreign_key "purchase_order_taxe", "purchase_order_line", column: "ord_id", name: "purchase_order_taxe_ord_id_fkey", on_delete: :cascade
  add_foreign_key "reconcile_account_rel", "account_account", column: "account_id", name: "reconcile_account_rel_account_id_fkey", on_delete: :cascade
  add_foreign_key "reconcile_account_rel", "account_automatic_reconcile", column: "reconcile_id", name: "reconcile_account_rel_reconcile_id_fkey", on_delete: :cascade
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
  add_foreign_key "res_company", "account_account", column: "expense_currency_exchange_account_id", name: "res_company_expense_currency_exchange_account_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "account_account", column: "income_currency_exchange_account_id", name: "res_company_income_currency_exchange_account_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "report_paperformat", column: "paperformat_id", name: "res_company_paperformat_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_company", column: "parent_id", name: "res_company_parent_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_currency", column: "currency_id", name: "res_company_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_font", column: "font", name: "res_company_font_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_partner", column: "partner_id", name: "res_company_partner_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_users", column: "create_uid", name: "res_company_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_users", column: "write_uid", name: "res_company_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company", "stock_location", column: "internal_transit_location_id", name: "res_company_internal_transit_location_id_fkey", on_delete: :nullify
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
  add_foreign_key "res_partner", "crm_case_section", column: "section_id", name: "res_partner_section_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_company", column: "company_id", name: "res_partner_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_country", column: "country_id", name: "res_partner_country_id_fkey", on_delete: :restrict
  add_foreign_key "res_partner", "res_country_state", column: "state_id", name: "res_partner_state_id_fkey", on_delete: :restrict
  add_foreign_key "res_partner", "res_partner", column: "commercial_partner_id", name: "res_partner_commercial_partner_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner", column: "parent_id", name: "res_partner_parent_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner_title", column: "title", name: "res_partner_title_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "create_uid", name: "res_partner_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "user_id", name: "res_partner_user_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "write_uid", name: "res_partner_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "account_journal", column: "journal_id", name: "res_partner_bank_journal_id_fkey", on_delete: :nullify
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
  add_foreign_key "res_users", "crm_case_section", column: "default_section_id", name: "res_users_default_section_id_fkey", on_delete: :nullify
  add_foreign_key "res_users", "mail_alias", column: "alias_id", name: "res_users_alias_id_fkey", on_delete: :restrict
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
  add_foreign_key "sale_member_rel", "crm_case_section", column: "section_id", name: "sale_member_rel_section_id_fkey", on_delete: :cascade
  add_foreign_key "sale_member_rel", "res_users", column: "member_id", name: "sale_member_rel_member_id_fkey", on_delete: :cascade
  add_foreign_key "share_wizard", "ir_act_window", column: "action_id", name: "share_wizard_action_id_fkey", on_delete: :nullify
  add_foreign_key "share_wizard", "res_users", column: "create_uid", name: "share_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "share_wizard", "res_users", column: "write_uid", name: "share_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "share_wizard_res_group_rel", "res_groups", column: "group_id", name: "share_wizard_res_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "share_wizard_res_group_rel", "share_wizard", column: "share_id", name: "share_wizard_res_group_rel_share_id_fkey", on_delete: :cascade
  add_foreign_key "share_wizard_res_user_rel", "res_users", column: "user_id", name: "share_wizard_res_user_rel_user_id_fkey", on_delete: :cascade
  add_foreign_key "share_wizard_res_user_rel", "share_wizard", column: "share_id", name: "share_wizard_res_user_rel_share_id_fkey", on_delete: :cascade
  add_foreign_key "share_wizard_result_line", "res_users", column: "create_uid", name: "share_wizard_result_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "share_wizard_result_line", "res_users", column: "user_id", name: "share_wizard_result_line_user_id_fkey", on_delete: :nullify
  add_foreign_key "share_wizard_result_line", "res_users", column: "write_uid", name: "share_wizard_result_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "share_wizard_result_line", "share_wizard", name: "share_wizard_result_line_share_wizard_id_fkey", on_delete: :cascade
  add_foreign_key "stock_change_product_qty", "product_product", column: "product_id", name: "stock_change_product_qty_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_change_product_qty", "res_users", column: "create_uid", name: "stock_change_product_qty_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_change_product_qty", "res_users", column: "write_uid", name: "stock_change_product_qty_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_change_product_qty", "stock_location", column: "location_id", name: "stock_change_product_qty_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_change_product_qty", "stock_production_lot", column: "lot_id", name: "stock_change_product_qty_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_change_standard_price", "res_users", column: "create_uid", name: "stock_change_standard_price_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_change_standard_price", "res_users", column: "write_uid", name: "stock_change_standard_price_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_config_settings", "res_company", column: "company_id", name: "stock_config_settings_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_config_settings", "res_users", column: "create_uid", name: "stock_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_config_settings", "res_users", column: "write_uid", name: "stock_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_fixed_putaway_strat", "product_category", column: "category_id", name: "stock_fixed_putaway_strat_category_id_fkey", on_delete: :nullify
  add_foreign_key "stock_fixed_putaway_strat", "product_putaway", column: "putaway_id", name: "stock_fixed_putaway_strat_putaway_id_fkey", on_delete: :nullify
  add_foreign_key "stock_fixed_putaway_strat", "res_users", column: "create_uid", name: "stock_fixed_putaway_strat_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_fixed_putaway_strat", "res_users", column: "write_uid", name: "stock_fixed_putaway_strat_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_fixed_putaway_strat", "stock_location", column: "fixed_location_id", name: "stock_fixed_putaway_strat_fixed_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_incoterms", "res_users", column: "create_uid", name: "stock_incoterms_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_incoterms", "res_users", column: "write_uid", name: "stock_incoterms_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "account_period", column: "period_id", name: "stock_inventory_period_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "product_product", column: "product_id", name: "stock_inventory_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "res_company", column: "company_id", name: "stock_inventory_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "res_partner", column: "partner_id", name: "stock_inventory_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "res_users", column: "create_uid", name: "stock_inventory_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "res_users", column: "write_uid", name: "stock_inventory_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "stock_location", column: "location_id", name: "stock_inventory_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "stock_production_lot", column: "lot_id", name: "stock_inventory_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory", "stock_quant_package", column: "package_id", name: "stock_inventory_package_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "product_product", column: "product_id", name: "stock_inventory_line_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "product_uom", name: "stock_inventory_line_product_uom_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "res_company", column: "company_id", name: "stock_inventory_line_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "res_partner", column: "partner_id", name: "stock_inventory_line_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "res_users", column: "create_uid", name: "stock_inventory_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "res_users", column: "write_uid", name: "stock_inventory_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "stock_inventory", column: "inventory_id", name: "stock_inventory_line_inventory_id_fkey", on_delete: :cascade
  add_foreign_key "stock_inventory_line", "stock_location", column: "location_id", name: "stock_inventory_line_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "stock_production_lot", column: "prod_lot_id", name: "stock_inventory_line_prod_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_inventory_line", "stock_quant_package", column: "package_id", name: "stock_inventory_line_package_id_fkey", on_delete: :nullify
  add_foreign_key "stock_invoice_onshipping", "account_journal", column: "journal_id", name: "stock_invoice_onshipping_journal_id_fkey", on_delete: :nullify
  add_foreign_key "stock_invoice_onshipping", "res_users", column: "create_uid", name: "stock_invoice_onshipping_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_invoice_onshipping", "res_users", column: "write_uid", name: "stock_invoice_onshipping_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "account_account", column: "valuation_in_account_id", name: "stock_location_valuation_in_account_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "account_account", column: "valuation_out_account_id", name: "stock_location_valuation_out_account_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "product_putaway", column: "putaway_strategy_id", name: "stock_location_putaway_strategy_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "product_removal", column: "removal_strategy_id", name: "stock_location_removal_strategy_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "res_company", column: "company_id", name: "stock_location_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "res_partner", column: "partner_id", name: "stock_location_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "res_users", column: "create_uid", name: "stock_location_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "res_users", column: "write_uid", name: "stock_location_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location", "stock_location", column: "location_id", name: "stock_location_location_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_path", "res_company", column: "company_id", name: "stock_location_path_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_path", "res_users", column: "create_uid", name: "stock_location_path_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location_path", "res_users", column: "write_uid", name: "stock_location_path_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location_path", "stock_location", column: "location_dest_id", name: "stock_location_path_location_dest_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_path", "stock_location", column: "location_from_id", name: "stock_location_path_location_from_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_path", "stock_location_route", column: "route_id", name: "stock_location_path_route_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_path", "stock_picking_type", column: "picking_type_id", name: "stock_location_path_picking_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_path", "stock_warehouse", column: "warehouse_id", name: "stock_location_path_warehouse_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_route", "res_company", column: "company_id", name: "stock_location_route_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_route", "res_users", column: "create_uid", name: "stock_location_route_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location_route", "res_users", column: "write_uid", name: "stock_location_route_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_location_route", "stock_warehouse", column: "supplied_wh_id", name: "stock_location_route_supplied_wh_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_route", "stock_warehouse", column: "supplier_wh_id", name: "stock_location_route_supplier_wh_id_fkey", on_delete: :nullify
  add_foreign_key "stock_location_route_categ", "product_category", column: "categ_id", name: "stock_location_route_categ_categ_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_route_categ", "stock_location_route", column: "route_id", name: "stock_location_route_categ_route_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_route_move", "stock_location_route", column: "route_id", name: "stock_location_route_move_route_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_route_move", "stock_move", column: "move_id", name: "stock_location_route_move_move_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_route_procurement", "procurement_order", column: "procurement_id", name: "stock_location_route_procurement_procurement_id_fkey", on_delete: :cascade
  add_foreign_key "stock_location_route_procurement", "stock_location_route", column: "route_id", name: "stock_location_route_procurement_route_id_fkey", on_delete: :cascade
  add_foreign_key "stock_move", "procurement_group", column: "group_id", name: "stock_move_group_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "procurement_order", column: "procurement_id", name: "stock_move_procurement_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "procurement_rule", column: "rule_id", name: "stock_move_rule_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "product_packaging", column: "product_packaging", name: "stock_move_product_packaging_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "product_product", column: "product_id", name: "stock_move_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "product_uom", column: "product_uom", name: "stock_move_product_uom_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "product_uom", column: "product_uos", name: "stock_move_product_uos_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "purchase_order_line", column: "purchase_line_id", name: "stock_move_purchase_line_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "res_company", column: "company_id", name: "stock_move_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "res_partner", column: "partner_id", name: "stock_move_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "res_partner", column: "restrict_partner_id", name: "stock_move_restrict_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "res_users", column: "create_uid", name: "stock_move_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "res_users", column: "write_uid", name: "stock_move_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_inventory", column: "inventory_id", name: "stock_move_inventory_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_location", column: "location_dest_id", name: "stock_move_location_dest_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_location", column: "location_id", name: "stock_move_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_location_path", column: "push_rule_id", name: "stock_move_push_rule_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_move", column: "move_dest_id", name: "stock_move_move_dest_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_move", column: "origin_returned_move_id", name: "stock_move_origin_returned_move_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_move", column: "split_from", name: "stock_move_split_from_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_picking", column: "picking_id", name: "stock_move_picking_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_picking_type", column: "picking_type_id", name: "stock_move_picking_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_production_lot", column: "restrict_lot_id", name: "stock_move_restrict_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move", "stock_warehouse", column: "warehouse_id", name: "stock_move_warehouse_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move_operation_link", "res_users", column: "create_uid", name: "stock_move_operation_link_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_move_operation_link", "res_users", column: "write_uid", name: "stock_move_operation_link_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_move_operation_link", "stock_move", column: "move_id", name: "stock_move_operation_link_move_id_fkey", on_delete: :cascade
  add_foreign_key "stock_move_operation_link", "stock_pack_operation", column: "operation_id", name: "stock_move_operation_link_operation_id_fkey", on_delete: :cascade
  add_foreign_key "stock_move_operation_link", "stock_quant", column: "reserved_quant_id", name: "stock_move_operation_link_reserved_quant_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move_scrap", "product_product", column: "product_id", name: "stock_move_scrap_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move_scrap", "product_uom", column: "product_uom", name: "stock_move_scrap_product_uom_fkey", on_delete: :nullify
  add_foreign_key "stock_move_scrap", "res_users", column: "create_uid", name: "stock_move_scrap_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_move_scrap", "res_users", column: "write_uid", name: "stock_move_scrap_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_move_scrap", "stock_location", column: "location_id", name: "stock_move_scrap_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_move_scrap", "stock_production_lot", column: "restrict_lot_id", name: "stock_move_scrap_restrict_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "product_product", column: "product_id", name: "stock_pack_operation_product_id_fkey", on_delete: :cascade
  add_foreign_key "stock_pack_operation", "product_uom", name: "stock_pack_operation_product_uom_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "res_currency", column: "currency", name: "stock_pack_operation_currency_fkey", on_delete: :cascade
  add_foreign_key "stock_pack_operation", "res_partner", column: "owner_id", name: "stock_pack_operation_owner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "res_users", column: "create_uid", name: "stock_pack_operation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "res_users", column: "write_uid", name: "stock_pack_operation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "stock_location", column: "location_dest_id", name: "stock_pack_operation_location_dest_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "stock_location", column: "location_id", name: "stock_pack_operation_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "stock_picking", column: "picking_id", name: "stock_pack_operation_picking_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "stock_production_lot", column: "lot_id", name: "stock_pack_operation_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "stock_quant_package", column: "package_id", name: "stock_pack_operation_package_id_fkey", on_delete: :nullify
  add_foreign_key "stock_pack_operation", "stock_quant_package", column: "result_package_id", name: "stock_pack_operation_result_package_id_fkey", on_delete: :cascade
  add_foreign_key "stock_picking", "procurement_group", column: "group_id", name: "stock_picking_group_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "res_company", column: "company_id", name: "stock_picking_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "res_partner", column: "owner_id", name: "stock_picking_owner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "res_partner", column: "partner_id", name: "stock_picking_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "res_users", column: "create_uid", name: "stock_picking_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "res_users", column: "write_uid", name: "stock_picking_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "stock_picking", column: "backorder_id", name: "stock_picking_backorder_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking", "stock_picking_type", column: "picking_type_id", name: "stock_picking_picking_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "ir_sequence", column: "sequence_id", name: "stock_picking_type_sequence_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "res_users", column: "create_uid", name: "stock_picking_type_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "res_users", column: "write_uid", name: "stock_picking_type_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "stock_location", column: "default_location_dest_id", name: "stock_picking_type_default_location_dest_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "stock_location", column: "default_location_src_id", name: "stock_picking_type_default_location_src_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "stock_picking_type", column: "return_picking_type_id", name: "stock_picking_type_return_picking_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_picking_type", "stock_warehouse", column: "warehouse_id", name: "stock_picking_type_warehouse_id_fkey", on_delete: :cascade
  add_foreign_key "stock_production_lot", "product_product", column: "product_id", name: "stock_production_lot_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_production_lot", "res_users", column: "create_uid", name: "stock_production_lot_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_production_lot", "res_users", column: "write_uid", name: "stock_production_lot_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "product_packaging", column: "packaging_type_id", name: "stock_quant_packaging_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "product_product", column: "product_id", name: "stock_quant_product_id_fkey", on_delete: :restrict
  add_foreign_key "stock_quant", "res_company", column: "company_id", name: "stock_quant_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "res_partner", column: "owner_id", name: "stock_quant_owner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "res_users", column: "create_uid", name: "stock_quant_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "res_users", column: "write_uid", name: "stock_quant_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "stock_location", column: "location_id", name: "stock_quant_location_id_fkey", on_delete: :restrict
  add_foreign_key "stock_quant", "stock_move", column: "negative_move_id", name: "stock_quant_negative_move_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "stock_move", column: "reservation_id", name: "stock_quant_reservation_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "stock_production_lot", column: "lot_id", name: "stock_quant_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "stock_quant", column: "propagated_from_id", name: "stock_quant_propagated_from_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant", "stock_quant_package", column: "package_id", name: "stock_quant_package_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_move_rel", "stock_move", column: "move_id", name: "stock_quant_move_rel_move_id_fkey", on_delete: :cascade
  add_foreign_key "stock_quant_move_rel", "stock_quant", column: "quant_id", name: "stock_quant_move_rel_quant_id_fkey", on_delete: :cascade
  add_foreign_key "stock_quant_package", "product_packaging", column: "packaging_id", name: "stock_quant_package_packaging_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "product_ul", column: "ul_id", name: "stock_quant_package_ul_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "res_company", column: "company_id", name: "stock_quant_package_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "res_partner", column: "owner_id", name: "stock_quant_package_owner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "res_users", column: "create_uid", name: "stock_quant_package_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "res_users", column: "write_uid", name: "stock_quant_package_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "stock_location", column: "location_id", name: "stock_quant_package_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_quant_package", "stock_quant_package", column: "parent_id", name: "stock_quant_package_parent_id_fkey", on_delete: :restrict
  add_foreign_key "stock_return_picking", "res_users", column: "create_uid", name: "stock_return_picking_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking", "res_users", column: "write_uid", name: "stock_return_picking_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking_line", "product_product", column: "product_id", name: "stock_return_picking_line_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking_line", "res_users", column: "create_uid", name: "stock_return_picking_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking_line", "res_users", column: "write_uid", name: "stock_return_picking_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking_line", "stock_move", column: "move_id", name: "stock_return_picking_line_move_id_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking_line", "stock_production_lot", column: "lot_id", name: "stock_return_picking_line_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_return_picking_line", "stock_return_picking", column: "wizard_id", name: "stock_return_picking_line_wizard_id_fkey", on_delete: :nullify
  add_foreign_key "stock_route_product", "product_template", column: "product_id", name: "stock_route_product_product_id_fkey", on_delete: :cascade
  add_foreign_key "stock_route_product", "stock_location_route", column: "route_id", name: "stock_route_product_route_id_fkey", on_delete: :cascade
  add_foreign_key "stock_route_warehouse", "stock_location_route", column: "route_id", name: "stock_route_warehouse_route_id_fkey", on_delete: :cascade
  add_foreign_key "stock_route_warehouse", "stock_warehouse", column: "warehouse_id", name: "stock_route_warehouse_warehouse_id_fkey", on_delete: :cascade
  add_foreign_key "stock_transfer_details", "res_users", column: "create_uid", name: "stock_transfer_details_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details", "res_users", column: "write_uid", name: "stock_transfer_details_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details", "stock_picking", column: "picking_id", name: "stock_transfer_details_picking_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "product_product", column: "product_id", name: "stock_transfer_details_items_product_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "product_uom", name: "stock_transfer_details_items_product_uom_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "res_partner", column: "owner_id", name: "stock_transfer_details_items_owner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "res_users", column: "create_uid", name: "stock_transfer_details_items_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "res_users", column: "write_uid", name: "stock_transfer_details_items_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_location", column: "destinationloc_id", name: "stock_transfer_details_items_destinationloc_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_location", column: "sourceloc_id", name: "stock_transfer_details_items_sourceloc_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_pack_operation", column: "packop_id", name: "stock_transfer_details_items_packop_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_production_lot", column: "lot_id", name: "stock_transfer_details_items_lot_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_quant_package", column: "package_id", name: "stock_transfer_details_items_package_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_quant_package", column: "result_package_id", name: "stock_transfer_details_items_result_package_id_fkey", on_delete: :nullify
  add_foreign_key "stock_transfer_details_items", "stock_transfer_details", column: "transfer_id", name: "stock_transfer_details_items_transfer_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "procurement_rule", column: "buy_pull_id", name: "stock_warehouse_buy_pull_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "procurement_rule", column: "mto_pull_id", name: "stock_warehouse_mto_pull_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "res_company", column: "company_id", name: "stock_warehouse_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "res_partner", column: "partner_id", name: "stock_warehouse_partner_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "res_users", column: "create_uid", name: "stock_warehouse_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "res_users", column: "write_uid", name: "stock_warehouse_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location", column: "lot_stock_id", name: "stock_warehouse_lot_stock_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location", column: "view_location_id", name: "stock_warehouse_view_location_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location", column: "wh_input_stock_loc_id", name: "stock_warehouse_wh_input_stock_loc_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location", column: "wh_output_stock_loc_id", name: "stock_warehouse_wh_output_stock_loc_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location", column: "wh_pack_stock_loc_id", name: "stock_warehouse_wh_pack_stock_loc_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location", column: "wh_qc_stock_loc_id", name: "stock_warehouse_wh_qc_stock_loc_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location_route", column: "crossdock_route_id", name: "stock_warehouse_crossdock_route_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location_route", column: "delivery_route_id", name: "stock_warehouse_delivery_route_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_location_route", column: "reception_route_id", name: "stock_warehouse_reception_route_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_picking_type", column: "in_type_id", name: "stock_warehouse_in_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_picking_type", column: "int_type_id", name: "stock_warehouse_int_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_picking_type", column: "out_type_id", name: "stock_warehouse_out_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_picking_type", column: "pack_type_id", name: "stock_warehouse_pack_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_picking_type", column: "pick_type_id", name: "stock_warehouse_pick_type_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse", "stock_warehouse", column: "default_resupply_wh_id", name: "stock_warehouse_default_resupply_wh_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse_orderpoint", "procurement_group", column: "group_id", name: "stock_warehouse_orderpoint_group_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse_orderpoint", "product_product", column: "product_id", name: "stock_warehouse_orderpoint_product_id_fkey", on_delete: :cascade
  add_foreign_key "stock_warehouse_orderpoint", "res_company", column: "company_id", name: "stock_warehouse_orderpoint_company_id_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse_orderpoint", "res_users", column: "create_uid", name: "stock_warehouse_orderpoint_create_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse_orderpoint", "res_users", column: "write_uid", name: "stock_warehouse_orderpoint_write_uid_fkey", on_delete: :nullify
  add_foreign_key "stock_warehouse_orderpoint", "stock_location", column: "location_id", name: "stock_warehouse_orderpoint_location_id_fkey", on_delete: :cascade
  add_foreign_key "stock_warehouse_orderpoint", "stock_warehouse", column: "warehouse_id", name: "stock_warehouse_orderpoint_warehouse_id_fkey", on_delete: :cascade
  add_foreign_key "stock_wh_resupply_table", "stock_warehouse", column: "supplied_wh_id", name: "stock_wh_resupply_table_supplied_wh_id_fkey", on_delete: :cascade
  add_foreign_key "stock_wh_resupply_table", "stock_warehouse", column: "supplier_wh_id", name: "stock_wh_resupply_table_supplier_wh_id_fkey", on_delete: :cascade
  add_foreign_key "temp_range", "res_users", column: "create_uid", name: "temp_range_create_uid_fkey", on_delete: :nullify
  add_foreign_key "temp_range", "res_users", column: "write_uid", name: "temp_range_write_uid_fkey", on_delete: :nullify
  add_foreign_key "validate_account_move", "res_users", column: "create_uid", name: "validate_account_move_create_uid_fkey", on_delete: :nullify
  add_foreign_key "validate_account_move", "res_users", column: "write_uid", name: "validate_account_move_write_uid_fkey", on_delete: :nullify
  add_foreign_key "validate_account_move_lines", "res_users", column: "create_uid", name: "validate_account_move_lines_create_uid_fkey", on_delete: :nullify
  add_foreign_key "validate_account_move_lines", "res_users", column: "write_uid", name: "validate_account_move_lines_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "ir_ui_menu", column: "menu_id", name: "wizard_ir_model_menu_create_menu_id_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "res_users", column: "create_uid", name: "wizard_ir_model_menu_create_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "res_users", column: "write_uid", name: "wizard_ir_model_menu_create_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "account_chart_template", column: "chart_template_id", name: "wizard_multi_charts_accounts_chart_template_id_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "account_tax_template", column: "purchase_tax", name: "wizard_multi_charts_accounts_purchase_tax_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "account_tax_template", column: "sale_tax", name: "wizard_multi_charts_accounts_sale_tax_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "res_company", column: "company_id", name: "wizard_multi_charts_accounts_company_id_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "res_currency", column: "currency_id", name: "wizard_multi_charts_accounts_currency_id_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "res_users", column: "create_uid", name: "wizard_multi_charts_accounts_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_multi_charts_accounts", "res_users", column: "write_uid", name: "wizard_multi_charts_accounts_write_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_validate_account_move_journal", "account_journal", column: "journal_id", name: "wizard_validate_account_move_journal_journal_id_fkey", on_delete: :cascade
  add_foreign_key "wizard_validate_account_move_journal", "validate_account_move", column: "wizard_id", name: "wizard_validate_account_move_journal_wizard_id_fkey", on_delete: :cascade
  add_foreign_key "wizard_validate_account_move_period", "account_period", column: "period_id", name: "wizard_validate_account_move_period_period_id_fkey", on_delete: :cascade
  add_foreign_key "wizard_validate_account_move_period", "validate_account_move", column: "wizard_id", name: "wizard_validate_account_move_period_wizard_id_fkey", on_delete: :cascade
  add_foreign_key "wizard_valuation_history", "res_users", column: "create_uid", name: "wizard_valuation_history_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_valuation_history", "res_users", column: "write_uid", name: "wizard_valuation_history_write_uid_fkey", on_delete: :nullify
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

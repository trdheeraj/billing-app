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

ActiveRecord::Schema.define(version: 2018_12_31_035613) do

  create_table "addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "district"
    t.string "state"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_transactions", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "date"
    t.string "payment_type"
    t.float "amount"
    t.float "balance_amount"
    t.integer "sales_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_transactions_on_customer_id"
    t.index ["sales_invoice_id"], name: "index_customer_transactions_on_sales_invoice_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.bigint "mobile"
    t.string "email"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["email"], name: "index_customers_on_email"
    t.index ["mobile"], name: "index_customers_on_mobile"
    t.index ["name"], name: "index_customers_on_name"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.float "rate"
    t.string "hsn"
    t.string "gst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name"
  end

  create_table "purchase_invoices", force: :cascade do |t|
    t.integer "bill_number"
    t.integer "supplier_id"
    t.datetime "date"
    t.float "discount"
    t.string "payment_type"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_number"], name: "index_purchase_invoices_on_bill_number"
    t.index ["supplier_id"], name: "index_purchase_invoices_on_supplier_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer "purchase_invoice_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchase_orders_on_product_id"
    t.index ["purchase_invoice_id"], name: "index_purchase_orders_on_purchase_invoice_id"
  end

  create_table "sales_invoices", force: :cascade do |t|
    t.integer "bill_number"
    t.integer "customer_id"
    t.datetime "date"
    t.float "discount"
    t.string "payment_type"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_number"], name: "index_sales_invoices_on_bill_number"
    t.index ["customer_id"], name: "index_sales_invoices_on_customer_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.integer "sales_invoice_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_orders_on_product_id"
    t.index ["sales_invoice_id"], name: "index_sales_orders_on_sales_invoice_id"
  end

  create_table "supplier_transactions", force: :cascade do |t|
    t.integer "supplier_id"
    t.datetime "date"
    t.string "payment_type"
    t.float "amount"
    t.float "balance_amount"
    t.integer "purchase_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_invoice_id"], name: "index_supplier_transactions_on_purchase_invoice_id"
    t.index ["supplier_id"], name: "index_supplier_transactions_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.bigint "mobile"
    t.string "email"
    t.integer "address_id"
    t.string "tin_number"
    t.string "gst_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_suppliers_on_address_id"
    t.index ["email"], name: "index_suppliers_on_email"
    t.index ["mobile"], name: "index_suppliers_on_mobile"
    t.index ["name"], name: "index_suppliers_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

require_relative 'test_helper'
require_relative '../lib/sales_engine'


class IntegrationTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new('test/fixtures/')
  end

  def test_can_find_and_convert_item_ids_to_items
    skip
    invoice = sales_engine.invoice_repository.entries.first
    invoice_items = invoice.items
    assert_equal 1, invoice_items.count
    assert_instance_of Array, invoice_items
    assert_instance_of Item, invoice_items.first
  end

  def test_it_can_find_the_merchant_with_the_most_revenue
    skip
    sales_engine = SalesEngine.new
    assert_equal "Dicki-Bednar", sales_engine.merchant_repository.most_revenue(1).first.name
    assert_equal ["Dicki-Bednar", "Kassulke, O'Hara and Quitzon"], sales_engine.merchant_repository.most_revenue(2).map { |merchant| merchant.name }
  end
end

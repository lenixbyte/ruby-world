require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # POST /products
  def test_create_product
    post '/api/products', params: { name: 'Test Product', price: '10.99', short_description: 'Test Description' }
    assert_response :success
    assert_equal 'success', JSON.parse(response.body)['status']
  end

  # GET /products/:id
  def test_read_product
    product = Product.create(name: 'Test Product', price: '10.99', short_description: 'Test Description')
    get "/api/products/#{product.id}"
    assert_response :success
    assert_equal product.name, JSON.parse(response.body)['name']
    assert_equal product.price.to_s, JSON.parse(response.body)['price']
  end


  # PUT /products/:id
  def test_update_product
    product = Product.create(name: 'Test Product', price: '10.99', short_description: 'Test Description')
    put "/api/products/#{product.id}", params: { name: 'Updated Product', price: '12.99', short_description:'abc'}
    assert_response :success
    assert_equal 'success', JSON.parse(response.body)['status']
    assert_equal 'Updated Product', product.reload.name
    assert_equal '12.99', product.reload.price.to_s
  end

  # DELETE /products/:id
  def test_delete_product
    product = Product.create(name: 'Test Product', price: '10.99', short_description: 'Test Description')
    delete "/api/products/#{product.id}"
    assert_response :success
    assert_equal 'success', JSON.parse(response.body)['status']
  end

end

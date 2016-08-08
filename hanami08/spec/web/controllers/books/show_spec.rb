require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/show'

describe Web::Controllers::Books::Show do
  let(:action) { Web::Controllers::Books::Show.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

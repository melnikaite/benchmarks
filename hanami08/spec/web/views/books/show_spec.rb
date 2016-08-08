require 'spec_helper'
require_relative '../../../../apps/web/views/books/show'

describe Web::Views::Books::Show do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/show.html.erb') }
  let(:view)      { Web::Views::Books::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end

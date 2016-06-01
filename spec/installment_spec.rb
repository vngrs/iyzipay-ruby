# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should retrieve bin number' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        binNumber: '454671',
        price: '1',
    }
    installment_info = Iyzipay::Model::InstallmentInfo.new.retrieve(request, @options)
    begin
      $stderr.puts installment_info.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end
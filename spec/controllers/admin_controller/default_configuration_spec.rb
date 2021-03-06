require 'spec_helper'

describe AdminController, '#default_configuration' do

  let(:admin_user) { Factory.create(:admin_user) }

  before(:each) { login_as(admin_user) }

  context 'when the request is POST' do
    it 'flashes an error when configuration data is already loaded' do
      flash.stub(:sweep)
      post(:default_configuration)
      flash[:error].should match(/could not be loaded/)
    end
  end

  context 'when the request is not POST' do
    it 'redirects to admin_controller/index' do
      get(:default_configuration)
      response.should redirect_to(:controller => :admin, :action => :index)
    end
  end

end

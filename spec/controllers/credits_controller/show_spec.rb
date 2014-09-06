require 'spec_helper'

describe CreditsController do

  before :each do
    controller.stub(:require_admin)
  end

  describe '#show' do
    it 'finds a credit object' do
      Credit.should_receive(:find).with('52').and_return('fake credit')
      get(:show, :id => 52)
      assigns(:credit).should == 'fake credit'
    end
  end

end
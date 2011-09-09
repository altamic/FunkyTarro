require 'spec_helper'

describe FacebookController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'logout'" do
    it "should be successful" do
      get 'logout'
      response.should be_success
    end
  end

  describe "GET 'menu'" do
    it "should be successful" do
      get 'menu'
      response.should be_success
    end
  end

end

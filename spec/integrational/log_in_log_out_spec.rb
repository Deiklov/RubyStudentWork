require 'rails_helper'

RSpec.describe "InOutFlow", type: :feature do

  describe "registration form" do
    it "render register form" do
      visit new_user_session_path
      expect(page.body).to include("Sign up")
    end

    it "register new user and sign in" do
      visit root_path

      click_link 'Sign up'
      fill_in :user_email, :with => 'steposiuser@gmail.com'
      fill_in :user_password, :with => 'password'
      fill_in :user_password_confirmation, :with => 'password'
      click_button 'sign up'

      expect(page.body).to include("Welcome! You have signed up successfully.")
    end
  end

  describe "Page work ok" do

    it "register new user and sign in" do
      visit new_user_registration_path
      fill_in :user_email, :with => 'xexmda@gmail.com'
      fill_in :user_password, :with => 'password'
      fill_in :user_password_confirmation, :with => 'password'
      click_button 'sign up'
      click_link 'Logout'
      click_link 'Login'
      fill_in :user_email, :with => 'xexmda@gmail.com'
      fill_in :user_password, :with => 'password'
      click_button 'Log in'
      click_link 'Andrey company'
      click_link 'Articles'
      expect(page.body).not_to include("You need to sign in or sign up before continuing.")
    end
  end
end

require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url, as: :json
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { confirmed_by: @profile.confirmed_by, confirmed_profile: @profile.confirmed_profile, desc: @profile.desc, email: @profile.email, email_token: @profile.email_token, inviter: @profile.inviter, phone: @profile.phone, phone_token: @profile.phone_token, revoke_profile: @profile.revoke_profile, revoked_by: @profile.revoked_by, structure_id: @profile.structure_id, user_id: @profile.user_id, username: @profile.username } }, as: :json
    end

    assert_response 201
  end

  test "should show profile" do
    get profile_url(@profile), as: :json
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { confirmed_by: @profile.confirmed_by, confirmed_profile: @profile.confirmed_profile, desc: @profile.desc, email: @profile.email, email_token: @profile.email_token, inviter: @profile.inviter, phone: @profile.phone, phone_token: @profile.phone_token, revoke_profile: @profile.revoke_profile, revoked_by: @profile.revoked_by, structure_id: @profile.structure_id, user_id: @profile.user_id, username: @profile.username } }, as: :json
    assert_response 200
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile), as: :json
    end

    assert_response 204
  end
end

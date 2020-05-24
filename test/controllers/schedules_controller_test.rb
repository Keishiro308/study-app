require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:ken)
    @other_user = users(:sam)
    @question = questions(:one)
    @schedule = schedules(:schedule_1)
  end

  #index
  test 'cannot access index without login' do
    get schedules_url
    assert_redirected_to new_user_session_url
  end

  #new
  test 'cannot access new when schedule has already existed' do
    sign_in(@user)
    get new_schedule_url(date: @schedule.date)
    assert_redirected_to schedules_url
  end

  test 'cannot access new without login' do
    get new_schedule_url(date: '2020-05-16')
    assert_redirected_to new_user_session_url
  end

  #create
  test 'cannot create without login' do
    assert_no_difference "Schedule.count" do
      post schedules_url,
        params: {
          schedule: {
            schedule_1: {
              predicted_time: 30,
              body: 'test',
              priority: 1
            }
          }
        }
    end
  end

  test 'can create with login' do
    sign_in(@user)
    assert_difference "Schedule.count", 1 do
      post schedules_url,
        params: {
          schedule: {
            date: '2020-05-24',
            schedule:{
              schedule_1: {
                predicted_time: 30,
                body: 'test',
                priority: 1
              }
            }
          }
        }
    end
  end

  #completed
  test 'cannot complete schedule without login' do
    patch completed_schedule_url(@schedule),
      params: {
        schedule: {
          actual_time: 40,
          review: 'test'
        }
      }
    assert_redirected_to new_user_session_url
  end

  test 'other user cannot complete schedule' do
    sign_in(@other_user)
    patch completed_schedule_url(@schedule),
      params: {
        schedule: {
          actual_time: 40,
          review: 'test'
        }
      }
    assert_redirected_to root_url
  end

  test 'can complete schedule with login' do
    sign_in(@user)
    patch completed_schedule_url(@schedule),
      params: {
        schedule: {
          actual_time: 40,
          review: 'test'
        }
      },
      xhr: true
    assert_response :success
  end

end

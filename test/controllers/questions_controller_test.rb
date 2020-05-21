require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:ken)
    @other_user = users(:sam)
    @question = questions(:one)
  end

  #create
  test 'can create question with login' do
    sign_in @user
    assert_difference "Question.count", 1 do
      post questions_url,
        params: {
          question: {
            question: 'body',
            answer: 'answer',
            user_id: @user.id,
            use: true,
            tag_names: ''
          }
        }
    end
  end

  test 'also create tag when create question' do
    sign_in @user
    assert_difference "Tag.count", 1 do
      post questions_url,
        params: {
          question: {
            question: 'body',
            answer: 'answer',
            user_id: @user.id,
            use: true,
            tag_names: 'other_tag'
          }
        }
    end
  end

  test 'cannot create question without login' do
    assert_no_difference "Question.count" do
      post questions_url,
        params: {
          question: {
            question: 'body',
            answer: 'answer',
            user_id: @user.id,
            use: true,
            tag_names: ''
          }
        }
    end
  end

  #他のユーザーのIDを送信してもちゃんとログインしている人のIDに修正される
  test 'other user cannot create question without login' do
    sign_in @other_user
    assert_no_difference "@user.questions.count" do
      post questions_url,
        params: {
          question: {
            question: 'body',
            answer: 'answer',
            user_id: @user.id,
            use: true,
            tag_names: ''
          }
        }
    end
  end

  #update
  test 'can update question with login' do
    sign_in @user
    assert patch question_url(@question),
      params: {
        question: {
          question: 'body',
          answer: 'answer',
          user_id: @user.id,
          use: true,
          tag_names: ''
        }
      }
  end


  test 'cannot update question without login' do
    patch question_url(@question),
      params: {
        question: {
          question: 'body',
          answer: 'answer',
          user_id: @user.id,
          use: true,
          tag_names: ''
        }
      }
      assert_redirected_to new_user_session_url
  end

  #他のユーザーのIDを送信してもちゃんとログインしている人のIDに修正される
  test 'other user cannot update question without login' do
    sign_in @other_user
    patch question_url(@question),
      params: {
        question: {
          question: 'body',
          answer: 'answer',
          user_id: @user.id,
          use: true,
          tag_names: ''
        }
      }
    assert_redirected_to root_url
  end

end

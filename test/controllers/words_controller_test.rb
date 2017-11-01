require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word = words(:one)
  end

  test "should get index" do
    get words_url
    assert_response :success
  end

  test "should get new" do
    get new_word_url
    assert_response :success
  end

  test "should create word" do
    assert_difference('Word.count') do
      post words_url, params: { word: { chinese: @word.chinese, english: @word.english, mnemonic: @word.mnemonic, part_of_speech: @word.part_of_speech, pinyin: @word.pinyin, times_correct: @word.times_correct, times_tested: @word.times_tested, user_id: @word.user_id } }
    end

    assert_redirected_to word_url(Word.last)
  end

  test "should show word" do
    get word_url(@word)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_url(@word)
    assert_response :success
  end

  test "should update word" do
    patch word_url(@word), params: { word: { chinese: @word.chinese, english: @word.english, mnemonic: @word.mnemonic, part_of_speech: @word.part_of_speech, pinyin: @word.pinyin, times_correct: @word.times_correct, times_tested: @word.times_tested, user_id: @word.user_id } }
    assert_redirected_to word_url(@word)
  end

  test "should destroy word" do
    assert_difference('Word.count', -1) do
      delete word_url(@word)
    end

    assert_redirected_to words_url
  end
end

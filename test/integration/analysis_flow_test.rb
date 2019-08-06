require 'test_helper'

class AnalysisFlowTest < Capybara::Rails::TestCase 
  test 'uploading_document_without_removing_stop_words'  do
    visit root_path
    attach_file('analysis[document]', Rails.root + "test/fixtures/files/sample.txt")
    click_button 'Analyze'

    assert page.has_content?("capybara")
    assert page.has_content?("off")
    assert page.has_no_content?("99")
  end
  
  test 'uploading_document_removing_stop_words'  do
    visit root_path
    attach_file('analysis[document]', Rails.root + "test/fixtures/files/sample.txt")
    check 'analysis[stop_word]'
    click_button 'Analyze'

    assert page.has_content?("capybara")
    assert page.has_no_content?("off")
    assert page.has_no_content?("99")
  end
  
  test 'visit_previously_created_analysis'  do
    visit root_path
    attach_file('analysis[document]', Rails.root + "test/fixtures/files/sample.txt")
    click_button 'Analyze'
    visit root_path
    click_link 'sample.txt'

    assert page.has_content?("capybara")
    assert page.has_content?("off")
    assert page.has_no_content?("99")
  end

end

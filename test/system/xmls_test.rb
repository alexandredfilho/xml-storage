require "application_system_test_case"

class XmlsTest < ApplicationSystemTestCase
  setup do
    @xml = xmls(:one)
  end

  test "visiting the index" do
    visit xmls_url
    assert_selector "h1", text: "Xmls"
  end

  test "should create xml" do
    visit xmls_url
    click_on "New xml"

    click_on "Create Xml"

    assert_text "Xml was successfully created"
    click_on "Back"
  end

  test "should update Xml" do
    visit xml_url(@xml)
    click_on "Edit this xml", match: :first

    click_on "Update Xml"

    assert_text "Xml was successfully updated"
    click_on "Back"
  end

  test "should destroy Xml" do
    visit xml_url(@xml)
    click_on "Destroy this xml", match: :first

    assert_text "Xml was successfully destroyed"
  end
end

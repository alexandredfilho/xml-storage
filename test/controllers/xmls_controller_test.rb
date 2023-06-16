require "test_helper"

class XmlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xml = xmls(:one)
  end

  test "should get index" do
    get xmls_url
    assert_response :success
  end

  test "should get new" do
    get new_xml_url
    assert_response :success
  end

  test "should create xml" do
    assert_difference("Xml.count") do
      post xmls_url, params: { xml: {  } }
    end

    assert_redirected_to xml_url(Xml.last)
  end

  test "should show xml" do
    get xml_url(@xml)
    assert_response :success
  end

  test "should get edit" do
    get edit_xml_url(@xml)
    assert_response :success
  end

  test "should update xml" do
    patch xml_url(@xml), params: { xml: {  } }
    assert_redirected_to xml_url(@xml)
  end

  test "should destroy xml" do
    assert_difference("Xml.count", -1) do
      delete xml_url(@xml)
    end

    assert_redirected_to xmls_url
  end
end

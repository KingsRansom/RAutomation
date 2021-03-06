require 'spec_helper'

describe "MsUia::TextField", :if => SpecHelper.adapter == :ms_uia do

  it "check for text field class" do
    RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "checkBox").should_not exist
    RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textField").should exist
  end

  it "enabled/disabled" do
    RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textField").should be_enabled
    RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textField").should_not be_disabled

    RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textBoxDisabled").should_not be_enabled
    RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textBoxDisabled").should be_disabled
  end

  it "cannot set a value to a disabled text field" do
    lambda { RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textBoxDisabled").set "abc" }.should raise_error

    lambda { RAutomation::Window.new(:title => "MainFormWindow").text_field(:id => "textBoxDisabled").clear }.should raise_error
  end

  it "can set the value of a multi line text field" do
    text_field = main_form.text_field(:id => "multiLineTextField")

    # initial
    text_field.set "some dater'"
    text_field.value.should eq("some dater'")

    # overwrite
    text_field.set "overwrite with this dater'"
    text_field.value.should eq("overwrite with this dater'")
  end

end

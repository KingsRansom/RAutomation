require 'spec_helper'

describe "WinFfi::RadioButton", :if => SpecHelper.adapter == :win_ffi do
  it "#exist?" do
    RAutomation::Window.new(:title => "MainFormWindow").radio(:value => "Option 1").should exist

    RAutomation::Window.wait_timeout = 0.1
    expect {RAutomation::Window.new(:title => "non-existent-window").
            radio(:value => "Option 1")}.
            to raise_exception(RAutomation::UnknownWindowException)
  end

  it "#set? & #set" do
    radio = RAutomation::Window.new(:title => "MainFormWindow").radio(:value => "Option 1")
    radio.should_not be_set

    radio.set
    radio.should be_set
  end

end
require 'test_helper'

class WickedTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Wicked
  end

  test "protected steps" do
    error = assert_raise WickedProtectedStepError do
      class ProtectedBadStepsController < ApplicationController
        include Wicked::Wizard

        steps :whatever, :finish
      end
    end
    assert_equal "Protected step detected: 'finish' is used internally by Wicked please rename your step", error.message
  end
end

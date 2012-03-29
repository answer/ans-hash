# vi: set fileencoding=utf-8

require 'spec_helper'

describe Ans::Hash do
  include Ans::Feature::Helpers::ActionHelper

  describe "::sha256 引数=>" do
    before do
      @value = "answer"
      @now = Time.local(2012,01,01,00,00,00)
      class AnsHashSpec
        extend Ans::Hash
        def self.salt
          "salt"
        end
      end
    end
    context "マイクロタイムなし、ソルトなし" do
      before do
        @hash = Digest::SHA256.hexdigest(@value) 
        the_action do
          AnsHashSpec.sha256(@value,false,false)
        end
      end
      it "で正しく生成されること" do
        the_action.should == @hash
      end
      it "で引数が変更されないこと" do
        the_action
        @value.should == "answer"
      end
    end
    context "マイクロタイムあり、ソルトなし" do
      before do
        @hash = Digest::SHA256.hexdigest(@value + @now.to_f.to_s) 
        stub(Time).now{ @now }
        the_action do
          AnsHashSpec.sha256(@value,true,false)
        end
      end
      it "で正しく生成されること" do
        the_action.should == @hash
      end
      it "で引数が変更されないこと" do
        the_action
        @value.should == "answer"
      end
    end
    context "マイクロタイムなし、ソルトあり" do
      before do
        @hash = Digest::SHA256.hexdigest(@value + "salt") 
        the_action do
          AnsHashSpec.sha256(@value,false,true)
        end
      end
      it "で正しく生成されること" do
        the_action.should == @hash
      end
      it "で引数が変更されないこと" do
        the_action
        @value.should == "answer"
      end
    end
    context "マイクロタイムあり、ソルトあり" do
      before do
        @hash = Digest::SHA256.hexdigest(@value + @now.to_f.to_s + "salt") 
        stub(Time).now{ @now }
        the_action do
          AnsHashSpec.sha256(@value,true,true)
        end
      end
      it "で正しく生成されること" do
        the_action.should == @hash
      end
      it "で引数が変更されないこと" do
        the_action
        @value.should == "answer"
      end
    end

  end
end

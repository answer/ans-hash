# vi: set fileencoding=utf-8

require 'spec_helper'

describe Ans::Hash do

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
      end
      it "で正しく生成されること" do
        AnsHashSpec.sha256(@value,false,false).should == @hash
      end
    end
    context "マイクロタイムあり、ソルトなし" do
      before do
        @hash = Digest::SHA256.hexdigest(@value + @now.to_f.to_s) 
        stub(Time).now{ @now }
      end
      it "で正しく生成されること" do
        AnsHashSpec.sha256(@value,true,false).should == @hash
      end
    end
    context "マイクロタイムなし、ソルトあり" do
      before do
        @hash = Digest::SHA256.hexdigest(@value + "salt") 
      end
      it "で正しく生成されること" do
        AnsHashSpec.sha256(@value,false,true).should == @hash
      end
    end
    context "マイクロタイムあり、ソルトあり" do
      before do
        @hash = Digest::SHA256.hexdigest(@value + @now.to_f.to_s + "salt") 
        stub(Time).now{ @now }
      end
      it "で正しく生成されること" do
        AnsHashSpec.sha256(@value,true,true).should == @hash
      end
    end
  end
end

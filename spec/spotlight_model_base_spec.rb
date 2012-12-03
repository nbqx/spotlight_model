# -*- coding: utf-8 -*-
require 'spec_helper'

describe SpotlightModel::Base do

  context "use class methods" do
    before do
      class Item < SpotlightModel::Base; end
    end

    it "should be .superclass == SpotlightModel::Base" do
      Item.superclass.should equal SpotlightModel::Base
    end

    describe "#find" do
      context "with no scope" do
        it "should be NoScopesError" do
          expect{Item.find('kMDItemKind == "JPEG image"','kMDItemPixelHeight < 500')}.to raise_error(SpotlightModel::NoScopesError)
        end
      end

      context "with scope" do
        it "should return 1" do
          Item.with_scope(fixtures_path).find('kMDItemKind == "JPEG image"','kMDItemPixelHeight < 500').size.should eql 1
        end
      end

    end

    describe "#find_with_scope" do
      
      context "with args" do
        it "should return 1" do
          Item.find_with_scope(fixtures_path, 'kMDItemKind == "JPEG image"','kMDItemPixelHeight < 500').size.should eql 1
        end

        it "should return 2" do
          Item.find_with_scope(fixtures_path, 'kMDItemFSName == "test"cdw').size.should eql 2
        end
      end

    end
  end

  context "instance methods" do
    
    before do 
      class Item < SpotlightModel::Base
        with_scope fixtures_path
      end
      @item = Item.find('kMDItemFSName == "test.txt"cdw').first
    end
  
    it "should be SpotlightModel::Base" do
      @item.should be_an_instance_of Item
    end

    it "should be array of attributes" do
      @item.attributes.should be_an_instance_of Array
    end

    it "should include ':kMDItemFSName'" do
      @item.attributes.should include(:kMDItemFSName)
    end

    it "should get 'test.txt'" do
      @item.kMDItemFSName.should eql "test.txt"
    end

  end

end

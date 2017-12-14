require 'rspec'
require 'tdd'

describe "tdd" do

  describe "Array" do
    describe "#my_uniq" do
      it "removes duplicates from an array" do
        expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
      end
    end

    describe "#two_sum" do
      it "finds all index pairs where elements sum 0" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
      end
    end
  end

  describe "#my_transpose" do
    it "swaps rows and columns of a matrix" do
      matrix = [[0,1,2],[3,4,5],[6,7,8]]
      transposed = [[0,3,6],[1,4,7],[2,5,8]]
      expect(my_transpose(matrix)).to eq(transposed)
    end
  end

  describe "#stock_picker" do
    context "best day to buy is before best day to sell" do
      it "finds best day to buy & best day to sell a given stock" do
        stock_prices = [1, 2, 0.5, 4, 1]
        expect(stock_picker(stock_prices)).to eq([2,3])
      end
    end

    context "best day to buy after best day to sell" do
      it "finds best day to buy & best day to sell a given stock" do
        stock_prices = [1, 2, 1, 4, 0.5]
        expect(stock_picker(stock_prices)).to eq([0,3])
      end
    end
  end
  describe "TowersOfHanoi" do
    subject(:towers){TowersOfHanoi.new}
    describe "#initialize" do
      it "creates a 3x3 array" do
        expect(towers.towers).to eq([[3,2,1], [], []])
      end
    end

    describe "#move" do
      it "moves a plate to an empty tower" do
        towers.move(0,1)
        expect(towers.towers).to eq([[3,2],[1],[]])
      end
      it "doesn't allow you to place larger plate on smaller plate" do
        towers.move(0,1)
        expect { towers.move(0,1) }.to raise_error("Cannot move larger onto smaller")
      end
      it "does move smaller plate onto larger plate" do
        towers.move(0,1)
        towers.move(0,2)
        towers.move(1,2)
        expect(towers.towers).to eq([[3],[],[2,1]])
      end
    end

    describe "#won?" do
      it "recognizes a winning arrangement" do
        towers.move(0,1)
        towers.move(0,2)
        towers.move(1,2)
        towers.move(0,1)
        towers.move(2,0)
        towers.move(2,1)
        towers.move(0,1)
        expect(towers.won?).to eq(true)
      end
    end
  end
end

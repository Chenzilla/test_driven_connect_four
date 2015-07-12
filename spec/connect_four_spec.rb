require_relative '../connect_four.rb'

describe 'board' do

  before :all do
    @game = Board.new
  end

  it 'should be empty at start' do
    expect(@game.grid).to eq [['empty']*7]*6
  end
  context 'the piece is the first in the column' do
    it 'should place a piece in the first slot of the correct column' do
      @game.place_piece(0, 'red')
      expect(@game.grid).to eq [['red']+['empty']*6]+[['empty']*7]*5
    end
  end

  context 'the piece is not the first piece in the column' do
    it 'should place a piece above an existing piece in the correct column' do
      @game.place_piece(0, 'black')
      expect(@game.grid).to eq [['red', 'black']+['empty']*5]+[['empty']*7]*5
    end
  end

  
end

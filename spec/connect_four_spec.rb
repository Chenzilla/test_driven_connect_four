require_relative '../connect_four.rb'

describe 'board' do

  before :each do
    @game = Board.new
  end

  it 'should be empty at start' do
    expect(@game.grid).to eq [['empty']*6]*7
  end

  describe 'piece behavior' do
    context 'when the piece is the first in the column' do
      it 'should be in the first slot of the correct column' do
        @game.place_piece(0, 'red')
        expect(@game.grid).to eq [['red']+['empty']*5]+[['empty']*6]*6
      end
    end

    context 'when the piece is not the first piece in the column' do
      it 'should be above an existing piece in the column' do
        @game.place_piece(0, 'red')
        @game.place_piece(0, 'black')
        expect(@game.grid).to eq [['red', 'black']+['empty']*4]+[['empty']*6]*6
      end
    end

    context 'when there are aready the max number of pieces in a column' do
      it 'should be unable to be placed in the column' do
        6.times { @game.place_piece(0, 'red') }
        expect(@game.place_piece(0, 'red')).to be false
      end
    end
  end

  describe 'game status behavior' do
    context 'when there are three pieces in a row' do
      it 'should not be game over' do
        3.times { @game.place_piece(0, 'black') }
        expect(@game.game_over?).to be false
      end
    end

    context 'when there are four pieces in a row vertically' do
      it 'should be game over' do
        4.times { @game.place_piece(3, 'black') }
        print @game.grid
        expect(@game.game_over?).to be true
      end
    end

    context 'when there are four pieces in a row horizontally' do
      it 'should be game over' do

      end
    end
  end
end

require_relative 'card'
require_relative 'player'
require_relative 'game'
require_relative 'printer'
require_relative 'hand'
require_relative 'card_board'

class Main
  DEALERS = ['Eran', 'Tema', 'Rovshik', 'Mishel']

  def initialize
    @hands = {player: Hand.new, dealer: Hand.new}
    @game = Game.new
    @turns = []
  end

  def load_menu
    loop do
      Printer.show_base_actions 
      user_choise = gets.chomp.downcase
      break if user_choise == 'q'
      start_game if user_choise == 'n'
    end
  end

  private
  def start_game
    @game_over = false
    player = create_player
    dealer = create_dealer
    @players_identy = @game.players.dup
    @turns = @players_identy.cycle
    deal_card(player, 2)
    deal_card(dealer, 2)
    define_turns
  end

  def create_player
    name = DEALERS.sample
    player = Player.new(name, type)
    @game.add_player(player)
    player
  end

  def create_dealer
    name = DEALERS.sample
    dealer = Player.new(name, type)
    @game.add_player(dealer)
    dealer
  end

  def deal_card(player, count = 2)
    @game.deal_cars(player, count)
    Printer.show_cards(player)
    Printer.show_bank(@game.bank)
  end

  def get_player_score(player)
    player_score = @hands[player.type].total_score(player.cards)
    Printer.show_score(player, player_score)
    player_score
  end

  def define_turns
    loop do 
      break if @game_over
      player = @turns.next
      player_action(player)
    end
  end

  def player_action(player)
    if player.cards.count == 3
      see_result
      return
    end

    Printer.show_chiose(player)
    chise = gets.to_i

    case choise    
      when 1 then hit(player)
      when 2 then stay(player)
      when 3 then see_result
      when 0 then @game_over = true
    end
  end

  def hit(player)
    @game.deal_cards(player, 1)
    Printer.show_card(player)
  end

  def stay(player)
    Printer.show_card(player)
    @players_identy.delete(player)
    see_result if @players_identy.count == 0
  end

  def see_result
    player_score, dealer_score = @game.players.map do |player|
      get_player_score(player)
    end
    @game.is_winner(dealer_score, player_score)
    finsish_game
  end

  def finsish_game
    Printer.print_message("Game Over!!!")
    @hands = Hand.new
    @game = Game.new
    @turns = []
    @game_over = true
  end
end

start = Main.new
start.load_menu
#Representacion del estado del juego
module Model
    module Direction
        UP = :up
        RIGHT = :rigth
        DOWN = :down
        LEFT = :left
    end
    #Coordenada
    class Coord < Struct.new(:row, :col)        
    end
    #Comida
    class Food < Coord
    end
    #Serpiente
    class Snake < Struct.new(:positions)
    end
    #Grilla
    class Grid < Struct.new(:rows, :cols)
    end
    #Estado
    class State < Struct.new(:snake, :food, :grid, :curr_direction, :game_finished)
    end
    #Estado inicial del juego
    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(4, 4),
            Model::Grid.new(8, 12),
            Direction::DOWN,
            false
        )
    end
end
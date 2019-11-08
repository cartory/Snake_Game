require 'Ruby2D'

module View
    class Ruby2dView
        #constructor
        def initialize
            @pixel_size = 50
        end
        # pinta el escenario
        def start(state)
            extend Ruby2D::DSL
            set(
                title: "Snake",
                width: @pixel_size * state.grid.cols, 
                height: @pixel_size * state.grid.rows
            )
            show
        end
        #renderiza segun el estado
        def render(state)
            render_snake(state)
            render_food(state)
        end
        
        private
        #repintar la serpiente
        def render_snake(state)
            @snake_positions.each(&:remove) if @snake_positions
            extend Ruby2D::DSL
            snake = state.snake
            @snake_positions = snake.positions.map do |pos|
                Square.new(
                    x: pos.col * @pixel_size,
                    y: pos.row * @pixel_size,
                    size: @pixel_size,
                    color: 'green',
                )
            end
        end
        #repintar la comida
        def render_food(state)
            @food.remove if @food
            extend Ruby2D::DSL
            food = state.food
            @food = Square.new(
                x: food.col * @pixel_size,
                y: food.row * @pixel_size,
                size: @pixel_size,
                color: 'yellow',
            )
        end
    end
end
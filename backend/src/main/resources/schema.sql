CREATE TABLE game (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    board_size INT NOT NULL,
    last_move INT NOT NULL,
    total_moves INT NOT NULL,
    forward_diagonal_sum INT NOT NULL,
    backward_diagonal_sum INT NOT NULL,
    status VARCHAR
);

CREATE TABLE game_line (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    game_id BIGINT,
    is_row bool NOT NULL,
    line_id INT NOT NULL,
    line_sum INT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES game(id)
);

CREATE INDEX game_line_lookup ON game_line(game_id, is_row, line_id);

CREATE TABLE game_grid_square (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    game_id BIGINT,
    grid_row INT NOT NULL,
    grid_col INT NOT NULL,
    grid_val INT,
    FOREIGN KEY (game_id) REFERENCES game(id)
);

CREATE INDEX game_grid_square_lookup ON game_grid_square(game_id, grid_row, grid_col);
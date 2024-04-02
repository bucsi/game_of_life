import gleeunit
import gleeunit/should
import game_of_life.{evolve}
import gleam/result
import gleam/list

const alive = 1

const dead = 0

const invalid = -999

pub fn main() {
  gleeunit.main()
}

pub fn board_of_just_dead_cells__returns_same__test() {
  let board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

  evolve(board)
  |> should.equal(board)
}

pub fn small_board_of_just_dead_cells__returns_same__test() {
  let board = [[0, 0], [0, 0], [0, 0]]

  evolve(board)
  |> should.equal(board)
}

pub fn solitude__solo_cell_dies__test() {
  let board = [[0, 0, 0], [0, alive, 0], [0, 0, 0]]

  let assert Ok(middle_row) =
    evolve(board)
    |> list.at(1)

  let assert Ok(middle_cell) =
    middle_row
    |> list.at(1)

  middle_cell
  |> should.equal(dead)
}

pub fn stasis__test() {
  let board = [[alive, alive, 0], [alive, alive, 0], [0, 0, 0]]

  evolve(board)
  |> should.equal(board)
}

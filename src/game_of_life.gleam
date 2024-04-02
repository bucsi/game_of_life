import gleam/io
import gleam/list
import gleam/result

pub fn main() {
  "Hello from game_of_life!"
  |> io.println
}

pub fn evolve(board: List(List(Int))) {
  board
  |> list.map(fn(row) { list.map(row, fn(elem) { 0 }) })
}

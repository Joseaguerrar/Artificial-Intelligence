#include "State.hpp"
#include <algorithm>

const std::vector<std::vector<int>> State::GOAL = {
    {1, 2, 3}, {4, 5, 6}, {7, 8, 0}};

State::State() : board(GOAL) { locateZero(); }

State::State(const std::vector<std::vector<int>> &initialBoard)
    : board(initialBoard) {
  locateZero();
}

bool State::isGoal() const { return board == State::GOAL; }

std::string State::toString() const {
  std::string boardAsString;
  for (int r = 0; r < ROWS_NUMBER; r++) {
    for (int c = 0; c < COLUMNS_NUMBER; c++) {
      // Save 0 as "_" instead.
      boardAsString += (board[r][c] == 0 ? "_" : std::to_string(board[r][c]));
      boardAsString += " ";
    }
    boardAsString += "\n";
  }

  return boardAsString;
}

std::vector<State> State::getNeighbors() const {
  std::vector<State> neighbors;

  // Possible moves for the empty space: up, down, left, right.
  const std::vector<std::pair<int, int>> moves = {
      {-1, 0}, {1, 0}, {0, -1}, {0, 1}};

  // Go through every possible move.
  for (auto [dr, dc] : moves) {
    int newEmptyRow = emptyRow + dr;
    int newEmptyColumn = emptyColumn + dc;

    // Check if it is a valid move (it is inside of the board).
    if (newEmptyRow >= 0 && newEmptyRow < ROWS_NUMBER && newEmptyColumn >= 0 &&
        newEmptyColumn < COLUMNS_NUMBER) {
      State nextState = *this;
      // Swap the empty space with another number.
      std::swap(nextState.board[emptyRow][emptyColumn],
                nextState.board[newEmptyRow][newEmptyColumn]);

      nextState.emptyRow = newEmptyRow;
      nextState.emptyColumn = newEmptyColumn;
      neighbors.push_back(nextState);
    }
  }
  return neighbors;
}

State State::randomState(int steps) {
  // Goal state.
  State current(State::GOAL);

  std::random_device rd;
  std::mt19937 gen(rd());

  for (int i = 0; i < steps; i++) {
    // Get neighbors from the goal state.
    auto neighbors = current.getNeighbors();
    std::uniform_int_distribution<int> dist(0, neighbors.size() - 1);
    current = neighbors[dist(gen)]; // Choose a random neighbor.
  }

  return current;
}

void State::locateZero() {
  for (int r = 0; r < ROWS_NUMBER; r++) {
    for (int c = 0; c < COLUMNS_NUMBER; c++) {
      if (board[r][c] == 0) {
        emptyRow = r;
        emptyColumn = c;
        return;
      }
    }
  }
}

std::string State::key() const {
  std::string boardKey;
  boardKey.reserve(9); // Save 9 spaces
  for (auto &row : board) {
    for (int value : row) {
      // Convert to char.
      boardKey.push_back(char('0' + value));
    }
  }
  return boardKey;
}

#include "State.hpp"
#include <iostream>

int main() {
  std::cout << "=== Probando clase State ===\n";

  State newBoard;
  std::cout << "New empty board:\n" << newBoard.toString() << "\n";

  newBoard = newBoard.randomState();
  std::cout << "Random board generated:\n" << newBoard.toString() << "\n";

  // Check if it is goal.
  if (newBoard.isGoal()) {
    std::cout << "It is goal state.\n";
  } else {
    std::cout << "It is not goal state.\n";
  }

  // Get a new neighborhood.
  auto neighbors = newBoard.getNeighbors();
  std::cout << "Number of neighbors generated: " << neighbors.size() << "\n";
  for (size_t i = 0; i < neighbors.size(); i++) {
    std::cout << "Neighbor " << i + 1 << ":\n"
              << neighbors[i].toString() << "\n";
  }

  return 0;
}

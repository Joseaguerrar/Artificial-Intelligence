#include "State.hpp"
#include <iostream>

int main() {
  std::cout << "=== Generating board ===\n";

  State newBoard;
  std::cout << "New goal board:\n" << newBoard.toString();
  std::cout << "The goal's key is: " << newBoard.key() << "\n\n";

  newBoard = newBoard.randomState();
  std::cout << "Random board generated:\n" << newBoard.toString();
  std::cout << "The board's key is: " << newBoard.key() << "\n\n";

  // Check if it is goal.
  if (newBoard.isGoal()) {
    std::cout << "It is goal state.\n\n";
  } else {
    std::cout << "It is not goal state.\n\n";
  }

  // Get a new neighborhood.
  auto neighbors = newBoard.getNeighbors();

  std::cout << "Number of neighbors generated: " << neighbors.size() << "\n";
  for (size_t i = 0; i < neighbors.size(); i++) {
    std::cout << "Neighbor " << i + 1 << ":\n"
              << neighbors[i].toString() << "Key:" << neighbors[i].key()
              << "\n\n";
  }

  return 0;
}

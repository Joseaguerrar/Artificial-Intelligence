#include <random>
#include <string>
#include <utility>
#include <vector>

#define ROWS_NUMBER 3
#define COLUMNS_NUMBER 3

/// @brief Class that represents the state of the game.
class State {
public:
  /// @brief Vector of vector of ints that represents the board with numbers
  /// from 0-8.
  std::vector<std::vector<int>> board;

  /// @brief The row where the empty space is located (0).
  int emptyRow;

  /// @brief The column where the empty space is located (0).
  int emptyColumn;

  /// @brief Default constructor. Builds a 3x3 matrix full of 0's.
  State();

  /// @brief Constructor given a initial board.
  /// @param initialBoard Parent matrix.
  State(const std::vector<std::vector<int>> &initialBoard);

  /// @brief Checks if the board's state is equal to the goal's.
  /// @return True: is equal, False: is not equal
  bool isGoal() const;

  /// @brief Translates the ints board to a string in order to print.
  /// @return The board as a string.
  std::string toString() const;

  /// @brief Generate new neighbors from the current state of the board.
  /// @return A vector with the neighbors.
  std::vector<State> getNeighbors() const;

  /// @brief Generate a random board state from the goal one.
  /// @param steps Number of iterations in order to randomize.
  /// @return A random state.
  State randomState(int steps = 20);
};

from eight_puzzle_solver import EightPuzzleSolver
import sys

def main():
  """
  Main function for program that solves an 8 puzzle using the following
  algorithms: Breadth First Search (BFS), Greedy Breadth First Heuristic Search
  (GBFHS), Iterative Deepening Search (IDS), Iterative Deepening Heuristic
  Search (IDHS).
  """
  # Read iterations count from the command line.
  try: 
    iterations_count = int(sys.argv[1]) if len(sys.argv) > 1 else 20
  except:
    iterations_count = 20

  print(f"Number of iterations: {iterations_count}\n")
  # Solve the 8 puzzle using the BFS, GBFHS, IDS, IDHS algorithms.
  solver = EightPuzzleSolver(iterations_count)
  solver.run()

if __name__ == "__main__":
    main()
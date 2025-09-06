from abc import ABC, abstractmethod
import time

class SearchAlgorithm(ABC):
  def __init__(self):
    self.elapsed_times = []

  def run(self, initial_state):
    start_time = time.time()
    self.solve(initial_state)
    end_time = time.time()
    elapsed_time = end_time - start_time
    self.elapsed_times.append(elapsed_time)

  @abstractmethod
  def solve(self, initial_state):
    pass
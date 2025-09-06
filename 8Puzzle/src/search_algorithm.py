from abc import ABC, abstractmethod
import time

class SearchAlgorithm(ABC):
  def __init__(self):
    self.elapsed_times = []

  def run(self, initial_state):
  
  @abstractmethod
  def solve(self, initial_state):
    pass
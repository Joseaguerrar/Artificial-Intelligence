from abc import ABC, abstractmethod

class SearchAlgorithm(ABC):
  def __init__(self, iterations_count):

  def run(self):

  @abstractmethod
  def solve(initial_state):
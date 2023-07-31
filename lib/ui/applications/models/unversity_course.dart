enum ProgramState {
  from,
  pending,
  submitted,
  approved,
  rejected,
}

extension ProgramStateValue on ProgramState {
  // Overload the [] getter to get the name of the Program
  operator [](String key) => (name) {
        switch (name) {
          case 'Open':
            return ProgramState.pending;
          case 'Under Review':
            return ProgramState.submitted;
          case 'In Progress':
            return ProgramState.approved;
          case 'Closed':
            return ProgramState.rejected;
          default:
            return ProgramState.pending;
        }
      }(key);

  String get text {
    if (index == 1) {
      return "Open";
    }
    if (index == 2) {
      return "Under Review";
    }
    if (index == 3) {
      return "In Progress";
    }
    if (index == 4) {
      return "Closed";
    }
    return "Open";
  }
}

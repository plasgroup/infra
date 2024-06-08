let
  faculties = import ./faculties.nix;
  students = import ./students.nix;
in
# all users exported via `lib`, check `./lib/users.nix` for details
faculties // students 

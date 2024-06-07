let
  faculties = import ./faculty.nix;
  students = import ./student.nix;
in
# all users exported via `lib`, check `./lib/users.nix` for details
faculties // students 

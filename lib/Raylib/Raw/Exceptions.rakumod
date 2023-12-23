use v6;

class X::Raylib::InvalidObject is Exception {
  has $!object is built;

  method message { "Invalid object { $!object.^name } used!" }
}

class X::Raylib::OutOfRange is Exception {
  method message { "Index out of range!" }
}

class X::Raylib::UnknownType is Exception {
  has $!value is built;

  method message { "Do not know how to handle { $!value.^name }!" }
}

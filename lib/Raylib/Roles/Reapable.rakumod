use v6;

use NativeCall;

use Raylib::Raw::Exceptions;

my %reapable-objects;

role Reapable {
  has Bool $!reapable = False;

  method addReapable ($object) {
    my $pointer = nativecast(Pointer, $object);
    $!reapable = True;

    %reapable-objects{ +$pointer } = $object;
  }

  method checkMalloc ($pointer is copy) is export {
    X::Raylib::InvalidObject.new( object => $pointer ).throw
      unless $pointer.REPR eq <CStruct CUnion CPointer>.any;

    $pointer = nativecast(Pointer, $pointer);
    return False unless %reapable-objects{ +$pointer };
    True;
  }
}

use v6;

use Method::Also;

use Raylib::Bindings;

use Raylib::Roles::Reapable;

class Raylib::Vector4 does Reapable {
  has Vector4 $!v4 handles(*) is built;

  method Raylib::Bindings::Vector4
    is also<Vector4>
  { $!v4 }

  multi method new (Vector4 $v4) {
    return Nil unless $!v4;
    self.bless( :$v4 );
  }
  multi method new (Num() $xx, Num() $yy, Num() $zz, Num() $ww) {
    my num32 ($x, $y, $z, $w) = ($xx, $yy, $zz, $ww);

    my $v4 = Vector4.init($x, $y, $z, $w);
    return Nil unless $!v4;
    my $o = self.bless( :$!v4 );
    $o.addReapable($v4);
    $o;
  }

}

use Raylib::Bindings;
use NativeCall;

sub MAIN ( :$write = False ) {
  for MY.WHO
        .pairs
        .grep( *.key.starts-with("\&") )
        .values
        .categorize(
          *.value.signature.params.head.type.^name
         )
        .pairs
        .sort( *.key )
  {
    say "\nInvocant: { .key }";

    my ($subs, $methods);
    for .value.pairs.sort( *.value.value.name ) {
      given .value.value {
        my ($r, $s) = .returns.^shortname;
        $s = .signature
             .params
             .map({ "    { .type.^shortname } { .name }" })
             .join(",\n");

        my $nc-sig = .name.starts-with('term:')
          ?? '()'
          !! "(\n{ $s }{ $r ne "Mu" ?? "\n    --> { $r }" !! "" }\n  )";
        my $nc-sym = '';
        $nc-sym = "\n    is symbol(\"{ .native_symbol }\")\n"
          if .^can('native_symbol');

        $subs ~= qq:to/SUB/;
          sub { .name } { $nc-sig }{ $nc-sym }
            is native(LIBRAYLIB) \{*\};

          SUB

        my $mn = .name.subst("-{ .signature.params.head.type.^shortname }", '');

        # my $call-signature;
        # my (%collider, %vars);
        # for .signature.params {
        #   %vars{ .name } = %(
        #     type => do given .type {
        #       when    .^shortname.starts-with('int')    { 'Int()'            }
        #       when    .^shortname.starts-with('uint')   { 'Int()'            }
        #       when    .^shortname.starts-with('num')    { 'Num()'            }
        #       when    .^shortname.starts-with('CArray') { .^shortname        }
        #       when    .^shortname eq <Pointer>          { .^shortname        }
        #       default                                   { .^shortname ~ '()' }
        #     },
        #     # ...
        # }

        $methods ~= qq:to/METHOD/;
          method { $mn } (\n{ $s }\n) \{
            { .name }(...);
          \}

          METHOD
      }
    }

    if $write {
      my $raw = "lib/Raylib/Raw/{ .key }.rakumod".IO;
      $raw.spurt($subs) unless $raw.r;

      my $obj = "lib/Raylib/{ .key }.rakumod".IO;
      $obj.spurt($methods) unless $obj.r;
    } else {
      say $subs;
      say $methods;
    }
  }
}

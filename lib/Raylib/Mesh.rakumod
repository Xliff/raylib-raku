use v6;

use NativeCall;
use Raylib::Bindings;
use Raylib::Model;

class Raylib::Mesh {
  has Mesh $!mesh handles(*) is built;

  method Raylib::Bindings::Mesh { $!mesh }

  multi method new (Mesh $mesh) {
    return Nil unless $mesh;
    self.bless( :$mesh );
  }
  multi method new (
    Int() $vertexCount,
    Int() $triangleCount,
    Num() $vertices,
    Num() $texcoords,
    Num() $texcoords2,
    Num() $normals,
    Num() $tangents,
    Int() $colors,
    Int() $indices,
    Num() $animVertices,
    Num() $animNormals,
    Int() $boneIds,
    Num() $boneWeights,
    Int() $vaoId,
    Int() $vboId
  ) {
    my int32 ($v, $t, $va, $vb) =
      ($vertexCount, $triangleCount, $vaoId, $vboId);

    my num32 ($ve, $tc, $tc2, $n, $tn, $av, $an, $bw) = (
      $vertices,
      $texcoords,
      $texcoords2,
      $normals,
      $tangents,
      $animVertices,
      $animNormals,
      $boneWeights
    );

    my uint8 ($c, $bi) = ($colors, $boneIds);

    my int16 $i = $indices;

    self.bless(
      mesh => Mesh.init(
        $v,
        $t,
        $ve,
        $tc,
        $tc2,
        $n,
        $tn,
        $c,
        $i,
        $av,
        $an,
        $bi,
        $bw,
        $va,
        $vb
      )
    );
  }

  method draw (Material() $material, Matrix() $transform) {
    draw-mesh($material, $transform);
  }

  method draw-instanced (
    Material() $material,
    Matrix()   $transforms,
    Int()      $instances
  ) {
    my int32 $i = $instances;

    draw-mesh-instanced ($!mesh, $material, $transforms, $i)
  }

  method get-bounding-box ( :$raw = False ) {
    my $bb = get-mesh-bounding-box($!mesh);
    return $bb if $raw;
    Raylib::BoundingBox.new($bb);
  }


  method export (Str() $fileName) {
    export-mesh($!mesh, $fileName);
  }

  method export-as-code (Str() $fileName) {
    export-mesh-as-code ($!mesh, $fileName);
  }

  method upload ( :$dynamic = False ) {
    upload-mesh($!mesh, $dynamic);
  }

  method gen-tangents {
    gen-mesh-tangents($!mesh)
  }

  # method load-model ( :$raw = False )  {
  #   my $m = load-model-from-mesh($!mesh);
  #   return $m if $raw;
  #   Raylib::Model.new($m);
  # }

  method update-buffer (
    Int()   $index,
    Pointer $data,
    Int()   $dataSize,
    Int()   $offset
  ) {
    my int32 ($i, $d, $o) = ($index, $dataSize, $offset);

    update-mesh-buffer($!mesh, $i, $data, $d, $o)
  }

  method unload {
    unload-mesh($!mesh)
  }

}

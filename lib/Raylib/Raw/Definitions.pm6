use v6.c;

unit package Raylib::Raw::Definitions;

constant R is export = %?RESOURCES;

subset ResourceFile is export of Mu
  where IO | Distribution::Resource;

constant LIBRAYLIB is export = R<libraries/raylib>;

constant MAX_MATERIAL_MAPS is export = 12;

class rlRenderBatch is repr<CPointer> is export { }

role StructSkipsTest[$reason = 'Skipping test'] is export {
  method reason { $reason }
}

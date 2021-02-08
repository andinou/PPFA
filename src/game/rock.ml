open Component_defs
open System_defs

let create name x y =
  let e = Entity.create () in
  (* components *)
  Position.set e {x = x; y = y };
  Box.set e {width = 23 ; height = 23};
  Velocity.set e { x = 0.0; y = -100.0 };
  Mass.set e infinity;
  Name.set e name;
  Surface.set e Texture.red;

  (* systems *)
  Collision_S.register e;
  Control_S.register e;
  Move_S.register e;
  Draw_S.register e;
  e
let launch e =
  Velocity.set e { x = 0.0; y = -100.0 }
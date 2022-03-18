{
  description = ''A wrapper for LMDB the Lightning Memory-Mapped Database'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-lmdb-0_1_2.flake = false;
  inputs.src-lmdb-0_1_2.owner = "FedericoCeratto";
  inputs.src-lmdb-0_1_2.ref   = "refs/tags/0.1.2";
  inputs.src-lmdb-0_1_2.repo  = "nim-lmdb";
  inputs.src-lmdb-0_1_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-lmdb-0_1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-lmdb-0_1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}
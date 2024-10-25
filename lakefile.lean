import Lake
open Lake DSL

package "TenCert" where
  -- add package configuration options here

require SHerLOC from git
  "https://github.com/leanprover/SHerLOC.git" @ "main"

require NKL from git
  "https://github.com/leanprover/NKL.git" @ "main"

require TensorLib from git
  "https://github.com/leanprover/TensorLib.git" @ "main"

lean_lib «TenCert» where
  -- add library configuration options here

@[default_target]
lean_exe "tencert" where
  root := `Main

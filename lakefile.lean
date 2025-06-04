import Lake
open Lake DSL

package "TenCert" where
  -- add package configuration options here

def moreLinkArgs :=
  let all := #["-lz"]
  if System.Platform.isOSX then
    all ++ #[
      "-L/opt/homebrew/opt/zlib/lib",
      "-L/usr/local/opt/zlib/lib"
    ]
  else
    -- TODO: figure out how to properly compile/link with ssp turned on
    all ++ #[
      "-fno-stack-protector"
    ]

require SHerLOC from git
  "https://github.com/leanprover/SHerLOC.git" @ "main"

require KLR from git
  "https://github.com/leanprover/KLR.git" @ "main"

require TensorLib from git
  "https://github.com/leanprover/TensorLib.git" @ "main"

lean_lib "TenCert" where
  defaultFacets := #[LeanLib.staticFacet]

@[default_target]
lean_exe "tencert" where
  nativeFacets := fun _ => #[Module.oFacet]
  root := `Main
  moreLinkArgs := moreLinkArgs

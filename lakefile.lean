import Lake
open Lake DSL

package "TenCert" where
  -- add package configuration options here

lean_lib «TenCert» where
  -- add library configuration options here

@[default_target]
lean_exe "tencert" where
  root := `Main

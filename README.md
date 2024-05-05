# My NixOS configuration

Generate user password by `mkpasswd` and put hashed password into `secrets.nix`:

```nix
{ hashedPassword = "<your_hashed_password>"; }

```

Run rebuild:

```shell
nixos-rebuild switch --flake path:///path/to/config/directory/#default
```

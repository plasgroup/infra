lib:

extraConfig: # an attrset with extra global nixpkgs config
{ allowUnfree = true; allowUnfreePredicate = (_: true); } // extraConfig

local cm = import '../../../lib/cm/cm.libsonnet';
local schema = import '../../../schemas/order-allocation/fake-cache-profiles.json';

local cacheProfile(name, localTtl, remoteTtl) = {
  ProfileName: name,
  LocalCacheTtlSeconds: localTtl,
  RemoteCacheTtlSeconds: remoteTtl,
};

cm()
  .config({
    FakeCacheProfilesConfiguration: {
      Default: cacheProfile("Default", 1, 2),
      Faster: cacheProfile("Faster", 3, 4),
      Longer: cacheProfile("Longer", 3, 6),
      RemoteOnly: cacheProfile("RemoteOnly", 7, 8),
      LongerRemoteOnly: cacheProfile("LongerRemoteOnly", 9, 10),
    },
  })
  .schema(schema)
  .build()
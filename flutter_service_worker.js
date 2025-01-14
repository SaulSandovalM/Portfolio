'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b5605809a5a626af9e1e31e2f193fabb",
"version.json": "711679ff19b309634bd50dfb162108cb",
"index.html": "76cd8332082432bd94224d0b7fba5da4",
"/": "76cd8332082432bd94224d0b7fba5da4",
"main.dart.js": "62a0974241bb269b7e3d469b9d6b19df",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "40155711392f0271e059f6a85962f1e4",
"icons/Icon-192.png": "b6a7390a3bfb0c72b0185e5767cac446",
"icons/Icon-maskable-192.png": "b6a7390a3bfb0c72b0185e5767cac446",
"icons/Icon-maskable-512.png": "355b1511d2c709f69f9ce95e2ddb317d",
"icons/Icon-512.png": "355b1511d2c709f69f9ce95e2ddb317d",
"manifest.json": "a1ec19e6befc2710ff878d22153600ae",
"assets/AssetManifest.json": "9c2a3b30ff9b72ecb344c262eae3853a",
"assets/NOTICES": "2169d3a848e4f3a915bc3f8bc0c9313d",
"assets/FontManifest.json": "81e4ce22ea4cb22fed649949a7f8addd",
"assets/AssetManifest.bin.json": "16668664592d58e0397f11b89618bc8d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "217fe852b653f2991050293d61a16b61",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "896e9a386b3b0a1cbd6614d7d21953d1",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/unity.png": "b3137aecf520924c88d244202866601a",
"assets/assets/images/contact_test.png": "ec45cf8fbe0e1fd9f6d93a40dc7dc250",
"assets/assets/images/python.png": "e68601f6d88712d28e9b384d93d55a7a",
"assets/assets/images/instagram.png": "02c7721e097a6bb001d00fa61750bc81",
"assets/assets/images/github.png": "0cce1aed89993dc5fb1615e8ebaaf585",
"assets/assets/images/firebase.png": "eae574cf9d98db7c69a14792078d4503",
"assets/assets/images/android.png": "8893a29782d09e7668c0dd4cecdac5b8",
"assets/assets/images/project_01.png": "db3f1db7a2a4de1cd3653d4052e414a1",
"assets/assets/images/javascript.png": "8040c1574b577a3b171f5d35dedff826",
"assets/assets/images/conference.png": "79dcecfbf0b28b3d583aa29294af838b",
"assets/assets/images/logo.png": "bf8610f5342370bafb52edbcdef0c4fc",
"assets/assets/images/html.png": "a4b34a437f75e3e809def48996f23918",
"assets/assets/images/linkedin.png": "e4d142586676a80b3927d899d3584148",
"assets/assets/images/react.png": "52fffe61f2ac6f9acf9a2c116045747d",
"assets/assets/images/profile.jpg": "ce6a873afb6d0b6605b7eca7fbb032f3",
"assets/assets/images/c++.png": "e592576a0679b626b5fde92df4f364cf",
"assets/assets/images/typescript.png": "3d822eca0c03c5a84b9bd76851bedb64",
"assets/assets/images/css.png": "530490522a67e3e6f572028f0fd0c89f",
"assets/assets/images/facebook.png": "fa74fe1619d75d68df1f0db7c654e39a",
"assets/assets/images/dart.png": "65206a62d3cf7d7d2e63dee3d529dcc1",
"assets/assets/fonts/Montserrat-Regular.ttf": "38712903602f88435ddddec98862f8b8",
"assets/assets/fonts/Montserrat-Italic.ttf": "5128267cb132ae4a1a9e1d8ed61c1834",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

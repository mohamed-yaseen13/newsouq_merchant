'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "05addd2fcc82b765fffa30809dbb67c1",
"assets/AssetManifest.bin.json": "2f8c5341f6ebd0e11d4c92c0135e111d",
"assets/AssetManifest.json": "7f3ba423c25d2c15f4bd365854841510",
"assets/assets/icons/arrow-left-double-line.svg": "410aafbfe0100f258379804ccd40cd6a",
"assets/assets/icons/arrow-right-double-line.svg": "e970da06af01d07a7ac34ebdebb5d852",
"assets/assets/icons/bag.svg": "54cc354df56509d517e68bc76a38c53c",
"assets/assets/icons/chat.svg": "af5f3019ba37c3e5ac169bf023a16f4f",
"assets/assets/icons/Check.svg": "aa5b51d21ee325bfa6a2cdadcef5b6dc",
"assets/assets/icons/chevron-down.svg": "5da6693d0548bba50b4da4f3d3e077de",
"assets/assets/icons/customers.svg": "93345ac1e25f34937961233dd598afb3",
"assets/assets/icons/customers_icon.svg": "f0e2a440fd7a1455f04e0315746aa992",
"assets/assets/icons/dashboard.svg": "faafa9e825f5c8689e7f87dfe9a61d0f",
"assets/assets/icons/dollar_sign.svg": "263feb2fa4cc12d033ae677483d21648",
"assets/assets/icons/dot.svg": "5ec64681daf9e3ab38e025dfcc46d667",
"assets/assets/icons/eye-off.svg": "efa2289d6af712d9870846ff6358814e",
"assets/assets/icons/Eye.svg": "f3de8e4335a424887fc076b4f87805cc",
"assets/assets/icons/filter.svg": "f378048691fc042a6f16b3ac9dea520d",
"assets/assets/icons/folder.png": "a372ca747b779f66276ce1d92325f2af",
"assets/assets/icons/folder.svg": "c312b17e7545db0c846621f28cb01b5a",
"assets/assets/icons/Home.svg": "a214de6dd502ca8615c2186a50cda6b3",
"assets/assets/icons/image.svg": "afb0afd64829d416e172c64993cb3eb4",
"assets/assets/icons/inventory.svg": "91e2d175bd743836fa27f627e6a7643e",
"assets/assets/icons/inventory_icon.svg": "964634278660f3a8e71f199e05faed8d",
"assets/assets/icons/lock.png": "d3cad69ec8747b945962e779526dba42",
"assets/assets/icons/logo.svg": "89cbcc2024f4d98379294bb347266381",
"assets/assets/icons/message.png": "a9ad4fcb82a6fc29397d78d5c43dba86",
"assets/assets/icons/Notification.svg": "b5ce62799488c96c2e79bf250ea5bcb7",
"assets/assets/icons/orders_icon.svg": "462533d81fa6adf394370a1f3f51730c",
"assets/assets/icons/Profile.png": "d7705905ccef9019f1e1019248ac3fac",
"assets/assets/icons/recent_orders_icon.svg": "66716735241c9d12e03973366ad867bd",
"assets/assets/icons/sales_icon.svg": "f15f365a12f5c8d12f4fab81a40a337c",
"assets/assets/icons/search.png": "f64c5dabe16afddcd6d65ecf3f8d42a1",
"assets/assets/icons/search.svg": "d268dede36a55b77fa6cd31b429a4a1a",
"assets/assets/icons/selected_bag.svg": "9708d1b54074c8d1b8fe25598f72d0f0",
"assets/assets/icons/selected_chat.svg": "521aff60ff39ca90cf085c656b769de4",
"assets/assets/icons/selected_customers.svg": "8ff7b1fc395b8bb7cd63fa1bf08db11e",
"assets/assets/icons/selected_dashboard.svg": "ecf05a8057de37e6f5f33c0373a602ad",
"assets/assets/icons/selected_inventory.svg": "dc60a57bca6b112d7d1e925b1ea7b62c",
"assets/assets/icons/selected_settings.svg": "152a378b52cb55556cb0bc6e4822c6ef",
"assets/assets/icons/settings.svg": "089b972e3f9054b2f86d118296374e51",
"assets/assets/icons/upload.svg": "9ed83b86e2af3ae242e273beb472bd14",
"assets/assets/icons/upload_excel_file.png": "53bee654ca5ad2c57c90bfba328c1dd3",
"assets/assets/icons/upload_file.svg": "0413d429f4f16c7bd976638f8544cb2a",
"assets/assets/icons/warning.svg": "cfe25ce457e985d6d0f4524f0e5b7234",
"assets/assets/icons/WarningCircle.svg": "6cb299b866b150f0ca4769de1e9bb185",
"assets/assets/images/image_placeholder.svg": "7014f5184b67635bd1500d94f2eaeafd",
"assets/assets/images/iphone13.png": "e24b1f3c0567e277f89e881d2c71b6a7",
"assets/assets/images/upload_additional_image.svg": "a1e9071ce95bd5b6852e17226a96b342",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "43786d406f81b88889c1f9d5d8877805",
"assets/NOTICES": "c93f5925d0d275e4efb5f56f6bad39d1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "a373816d991e13ddfdb2e0189bb606de",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5ab547b037312249e50f73d27d5cba31",
"/": "5ab547b037312249e50f73d27d5cba31",
"main.dart.js": "ac50c0990a4fd3ad32655e8b2241896a",
"manifest.json": "4901024b740fce46c9e22da264307cf5",
"version.json": "c40fe57abf64f9a931e088085ec35d51"};
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

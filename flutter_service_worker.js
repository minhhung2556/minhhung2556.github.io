'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "67f3aa081b4fa6fa8e12ee3466b4d7f4",
"index.html": "6ba251cc08eab8c4f50a6e2e35db4844",
"/": "6ba251cc08eab8c4f50a6e2e35db4844",
"main.dart.js": "df0f74bc4445403262068ca09b45dda3",
"favicon.png": "1febf57da596ee5e57bab0f2c232d5df",
"icons/Icon-192.png": "2044a82c479c3cbf19829b6ce646540e",
"icons/Icon-512.png": "d6c3a21dd684231969dbe686ca415a50",
"manifest.json": "1d0e13a638ac4026b1b265047727afa1",
"assets/asset/ic_linkedin.png": "d5734b55ccf39c9be561ef8540cae89e",
"assets/asset/ic_dartpub.png": "d0fb8a38321aebff9d9be19b7d47a468",
"assets/asset/work_sendo.jpg": "a8b74151b3cf434713db6a401e30f422",
"assets/asset/work_icarebenefits.jpeg": "284d16b92f3c5f2b872c484f99baa09e",
"assets/asset/work_senpay.jpg": "600442cf5d008428f87c58d2fa0db9b4",
"assets/asset/work_mecorp.jpg": "7b24adba927540b9400b1c3e1e95e1cd",
"assets/asset/logoapple.png": "0cea61654d604a311091b38912a03797",
"assets/asset/ic_skype.png": "6e8372dd1d02bb07e3b645deef2f5b6a",
"assets/asset/ic_facebook.png": "e53c31b2d8af8d4f2ef1540059672b2e",
"assets/asset/work_homecredit.jpg": "273c57b926c3926e6c56f830cd0d5c87",
"assets/asset/ic_gitlab.png": "7e6df0bd06fdf585325ec5c37e748520",
"assets/asset/ic_github.png": "a0f715ce20075bd3c2967d4ad521fdf2",
"assets/asset/avatar.jpg": "2132fd289e99ec8c8aa1b65c0b105b79",
"assets/asset/ic_medium.png": "6b6688b952a6dded6ea1318587778762",
"assets/asset/ic_gmail.png": "360e04a14359127804ef640fe1cacf2a",
"assets/asset/avatar1.jpg": "5b6fe373bfd9e434010118b915a2e103",
"assets/asset/digital1.png": "2dd63c1a3062daec02ee3c99190ef96c",
"assets/asset/logoflutter.png": "efa5e8370c235bd0e4df4ccaece43457",
"assets/AssetManifest.json": "ade4f0031507cd1839b0d4b31105643d",
"assets/NOTICES": "d408711e07b7a1acf3c8434b1c115f3b",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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

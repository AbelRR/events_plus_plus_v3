# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "object-assign", to: "https://ga.jspm.io/npm:object-assign@4.1.1/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@17.0.2/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.20.2/index.js"
pin_all_from "app/javascript/components", under: "components"

# @apollo/client
pin "@apollo/client", to: "https://ga.jspm.io/npm:@apollo/client@3.5.10/index.js"
pin "@wry/context", to: "https://ga.jspm.io/npm:@wry/context@0.6.1/lib/context.esm.js"
pin "@wry/equality", to: "https://ga.jspm.io/npm:@wry/equality@0.5.1/lib/equality.esm.js"
pin "@wry/trie", to: "https://ga.jspm.io/npm:@wry/trie@0.3.1/lib/trie.esm.js"
pin "graphql", to: "https://ga.jspm.io/npm:graphql@16.3.0/index.mjs"
pin "graphql-tag", to: "https://ga.jspm.io/npm:graphql-tag@2.12.6/lib/index.js"
pin "optimism", to: "https://ga.jspm.io/npm:optimism@0.16.1/lib/bundle.cjs.js"
pin "symbol-observable", to: "https://ga.jspm.io/npm:symbol-observable@4.0.0/lib/index.js"
pin "ts-invariant", to: "https://ga.jspm.io/npm:ts-invariant@0.9.4/lib/invariant.esm.js"
pin "ts-invariant/process/index.js", to: "https://ga.jspm.io/npm:ts-invariant@0.9.4/process/index.js"
pin "tslib", to: "https://ga.jspm.io/npm:tslib@2.3.1/tslib.es6.js"
pin "zen-observable-ts", to: "https://ga.jspm.io/npm:zen-observable-ts@1.2.3/module.js"
pin "tailwindcss", to: "https://ga.jspm.io/npm:tailwindcss@3.0.23/lib/index.js"
pin "@nodelib/fs.scandir", to: "https://ga.jspm.io/npm:@nodelib/fs.scandir@2.1.5/out/index.js"
pin "@nodelib/fs.stat", to: "https://ga.jspm.io/npm:@nodelib/fs.stat@2.0.5/out/index.js"
pin "@nodelib/fs.walk", to: "https://ga.jspm.io/npm:@nodelib/fs.walk@1.2.8/out/index.js"
pin "acorn", to: "https://ga.jspm.io/npm:acorn@7.4.1/dist/acorn.js"
pin "acorn-node", to: "https://ga.jspm.io/npm:acorn-node@1.8.2/index.js"
pin "acorn-node/walk", to: "https://ga.jspm.io/npm:acorn-node@1.8.2/walk.js"
pin "acorn-walk", to: "https://ga.jspm.io/npm:acorn-walk@7.2.0/dist/walk.js"
pin "ansi-styles", to: "https://ga.jspm.io/npm:ansi-styles@4.3.0/index.js"
pin "braces", to: "https://ga.jspm.io/npm:braces@3.0.2/index.js"
pin "camelcase-css", to: "https://ga.jspm.io/npm:camelcase-css@2.0.1/index-es5.js"
pin "chalk", to: "https://ga.jspm.io/npm:chalk@4.1.2/source/index.js"
pin "color-convert", to: "https://ga.jspm.io/npm:color-convert@2.0.1/index.js"
pin "color-name", to: "https://ga.jspm.io/npm:color-name@1.1.4/index.js"
pin "cssesc", to: "https://ga.jspm.io/npm:cssesc@3.0.0/cssesc.js"
pin "defined", to: "https://ga.jspm.io/npm:defined@1.0.0/index.js"
pin "detective", to: "https://ga.jspm.io/npm:detective@5.2.0/index.js"
pin "didyoumean", to: "https://ga.jspm.io/npm:didyoumean@1.2.2/didYouMean-1.2.1.js"
pin "dlv", to: "https://ga.jspm.io/npm:dlv@1.1.3/dist/dlv.umd.js"
pin "events", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.21/nodelibs/browser/events.js"
pin "fast-glob", to: "https://ga.jspm.io/npm:fast-glob@3.2.11/out/index.js"
pin "fastq", to: "https://ga.jspm.io/npm:fastq@1.13.0/queue.js"
pin "fill-range", to: "https://ga.jspm.io/npm:fill-range@7.0.1/index.js"
pin "glob-parent", to: "https://ga.jspm.io/npm:glob-parent@6.0.2/index.js"
pin "is-extglob", to: "https://ga.jspm.io/npm:is-extglob@2.1.1/index.js"
pin "is-glob", to: "https://ga.jspm.io/npm:is-glob@4.0.3/index.js"
pin "is-number", to: "https://ga.jspm.io/npm:is-number@7.0.0/index.js"
pin "merge2", to: "https://ga.jspm.io/npm:merge2@1.4.1/index.js"
pin "micromatch", to: "https://ga.jspm.io/npm:micromatch@4.0.5/index.js"
pin "normalize-path", to: "https://ga.jspm.io/npm:normalize-path@3.0.0/index.js"
pin "object-hash", to: "https://ga.jspm.io/npm:object-hash@2.2.0/dist/object_hash.js"
pin "picomatch", to: "https://ga.jspm.io/npm:picomatch@2.3.1/index.js"
pin "picomatch/lib/utils", to: "https://ga.jspm.io/npm:picomatch@2.3.1/lib/utils.js"
pin "postcss-js", to: "https://ga.jspm.io/npm:postcss-js@4.0.0/index.js"
pin "postcss-nested", to: "https://ga.jspm.io/npm:postcss-nested@5.0.6/index.js"
pin "postcss-selector-parser", to: "https://ga.jspm.io/npm:postcss-selector-parser@6.0.10/dist/index.js"
pin "postcss-selector-parser/dist/util/unesc", to: "https://ga.jspm.io/npm:postcss-selector-parser@6.0.10/dist/util/unesc.js"
pin "queue-microtask", to: "https://ga.jspm.io/npm:queue-microtask@1.2.3/index.js"
pin "quick-lru", to: "https://ga.jspm.io/npm:quick-lru@5.1.1/index.js"
pin "reusify", to: "https://ga.jspm.io/npm:reusify@1.0.4/reusify.js"
pin "run-parallel", to: "https://ga.jspm.io/npm:run-parallel@1.2.0/index.js"
pin "stream", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.21/nodelibs/browser/stream.js"
pin "supports-color", to: "https://ga.jspm.io/npm:supports-color@7.2.0/browser.js"
pin "to-regex-range", to: "https://ga.jspm.io/npm:to-regex-range@5.0.1/index.js"
pin "util", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.21/nodelibs/browser/util.js"
pin "util-deprecate", to: "https://ga.jspm.io/npm:util-deprecate@1.0.2/browser.js"
pin "xtend", to: "https://ga.jspm.io/npm:xtend@4.0.2/immutable.js"
pin "react-number-format", to: "https://ga.jspm.io/npm:react-number-format@4.9.1/dist/react-number-format.es.js"
pin "postcss-import", to: "https://ga.jspm.io/npm:postcss-import@14.1.0/index.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.22/nodelibs/browser/buffer.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.22/nodelibs/browser/fs.js"
pin "function-bind", to: "https://ga.jspm.io/npm:function-bind@1.1.1/index.js"
pin "has", to: "https://ga.jspm.io/npm:has@1.0.3/src/index.js"
pin "is-core-module", to: "https://ga.jspm.io/npm:is-core-module@2.8.1/index.js"
pin "nanoid/non-secure", to: "https://ga.jspm.io/npm:nanoid@3.3.2/non-secure/index.cjs"
pin "os", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.22/nodelibs/browser/os.js"
pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.22/nodelibs/browser/path.js"
pin "path-parse", to: "https://ga.jspm.io/npm:path-parse@1.0.7/index.js"
pin "picocolors", to: "https://ga.jspm.io/npm:picocolors@1.0.0/picocolors.browser.js"
pin "pify", to: "https://ga.jspm.io/npm:pify@2.3.0/index.js"
pin "postcss", to: "https://ga.jspm.io/npm:postcss@8.4.12/lib/postcss.js"
pin "postcss-value-parser", to: "https://ga.jspm.io/npm:postcss-value-parser@4.2.0/lib/index.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.22/nodelibs/browser/process-production.js"
pin "read-cache", to: "https://ga.jspm.io/npm:read-cache@1.0.0/index.js"
pin "resolve", to: "https://ga.jspm.io/npm:resolve@1.22.0/index.js"
pin "source-map-js", to: "https://ga.jspm.io/npm:source-map-js@1.0.2/source-map.js"
pin "sugarss", to: "https://ga.jspm.io/npm:sugarss@4.0.1/index.js"
pin "url", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.22/nodelibs/browser/url.js"

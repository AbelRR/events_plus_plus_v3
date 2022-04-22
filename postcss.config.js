const tailwindcss = require('tailwindcss');
const atImport = require("postcss-import")
module.exports = {
    plugins: [
      atImport,
      tailwindcss('./tailwind.config.js'),
      require('autoprefixer')
    ],
};

// const tailwindcss = require('tailwindcss');
// const atImport = require("postcss-import")
// module.exports = {
//   plugins: [atImport, tailwindcss('tailwind.config.js'), require('autoprefixer')],
// };

// // module.exports = {
// //   plugins: [
// //     require('tailwindcss'),
// //     require('autoprefixer')
// //   ]
// // }
/* app/javascript/stylesheets/tailwind.config.js */
module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.vue",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        mplus700: "'M PLUS 1p', 'sans-serif'",
        shippori: "'Shippori Mincho', 'serif'",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};

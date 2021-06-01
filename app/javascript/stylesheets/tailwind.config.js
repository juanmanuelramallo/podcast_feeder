module.exports = {
  purge: {
    content: [
      './app/views/**/*.html.erb',
      './app/views/**/*.html'
    ],
    options: {
      safelist: [
        'hidden'
      ]
    }
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

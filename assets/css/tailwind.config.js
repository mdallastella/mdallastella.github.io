module.exports = {
  content: [
    "./layouts/**/*.html",
    "./content/**/*.html"
  ],
  theme: {
    fontFamily: {
      sans: ['Iosevka Term SS04', 'monospace'],
      serif: ['Iosevka Term SS04', 'monospace'],
      mono: ['Iosevka Term SS04', 'monospace']
    },
    extend: {
      backgroundImage: {
        "personal_image": "url('/img/me.svg')"
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    /* require('@tailwindcss/aspect-ratio'),
     * require('@tailwindcss/forms'),
     * require('@tailwindcss/typography'), */
  ]
}

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      fontFamily: {
        // use inter for font family
        sans: ['Inter', 'sans-serif'],
        serif: ['DM Serif Display', 'serif'],
      },
      colors: {
        // DAISY UI - Winter theme
        'color-scheme': 'light',
        primary: '#0070ed',
        'primary-content': '#d2e4ff',
        secondary: '#463AA2',
        'secondary-content': '#d5d7ef',
        accent: '#C148AC',
        'accent-content': '#0e020b',
        neutral: '#021431',
        'neutral-content': '#c5cbd3',
        'base-100': '#FFFFFF',
        'base-200': '#F2F7FF',
        'base-300': '#E3E9F4',
        'base-content': '#394E6A',
        info: '#93E7FB',
        success: '#81CFD1',
        warning: '#EFD7BB',
        error: '#E58B8B',
      },
    },
  },
  plugins: [],
}

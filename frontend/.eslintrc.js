module.exports = {
  extends: ['airbnb', 'prettier', 'prettier/react'],
  plugins: ['prettier'],
  rules: {
    'react/jsx-filename-extension': [
      1,
      {
        extensions: ['.js', '.jsx']
      }
    ],
    'react/prop-types': 0,
    'no-underscore-dangle': 0,
    'import/imports-first': ['error', 'absolute-first'],
    'import/newline-after-import': 'error',
    'array-bracket-spacing': [2, 'never'],
    'block-spacing': 2,
    'comma-spacing': [2, { before: false, after: true }],
    'key-spacing': ['error', { beforeColon: false }],
    'no-multiple-empty-lines': [2, { max: 2 }],
    'object-curly-spacing': ['error', 'always'],
    'keyword-spacing': 2,
    'space-before-blocks': 2,
    'space-in-parens': ['error', 'never'],
    'space-infix-ops': 'error'
  },
  globals: {
    window: true,
    document: true,
    localStorage: true,
    FormData: true,
    FileReader: true,
    Blob: true,
    navigator: true
  },
  parser: 'babel-eslint',
  env: {
    browser: true,
    es6: true
  }
};

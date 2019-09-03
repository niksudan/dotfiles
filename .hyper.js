module.exports = {
  config: {
    fontFamily: 'FiraCode-Regular, monospace',
    fontSize: '18',
    fontWeight: 400,
    termCSS: 'x-screen x-row { font-variant-ligatures: contextual; }',
    padding: '12px 14px',
    backgroundColor: 'rgba(20, 20, 20)',
    shell: '/bin/zsh',
    shellArgs: ['--login'],
    env: {},
  },
  plugins: ['hyper-hide-title', 'hypercwd', 'hyper-statusline'],
};

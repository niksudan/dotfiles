module.exports = {
  config: {
    fontFamily: 'FiraCode-Regular, monospace',
    fontSize: '16',
    fontWeight: 400,
    padding: '12px 14px',
    shell: '/bin/zsh',
    shellArgs: ['--login'],
    env: {},
  },
  plugins: [
    'hyper-hide-title',
    'hypercwd',
    'hyper-statusline',
    'hyper-one-dark',
  ],
};

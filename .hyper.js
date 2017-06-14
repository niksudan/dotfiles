module.exports = {
  config: {
    fontFamily: 'FiraCode-Regular, monospace',
    fontSize: '12',
    termCSS: 'x-screen x-row { font-variant-ligatures: contextual; }',
    padding: '12px 14px',
    backgroundColor: 'rgba(40, 42, 54, 0.5)',
    colors: {
      black: '#000000',
      red: '#D62341',
      green: '#9ECE58',
      yellow: '#FAED70',
      blue: '#396FE2',
      magenta: '#BB80B3',
      cyan: '#2DDAFD',
      white: '#d0d0d0',
      lightBlack: 'rgba(255, 255, 255, 0.2)',
      lightRed: '#FF5370',
      lightGreen: '#C3E88D',
      lightYellow: '#FFCB6B',
      lightBlue: '#82AAFF',
      lightMagenta: '#C792EA',
      lightCyan: '#89DDFF',
      lightWhite: '#ffffff'
    },
    shell: '/bin/zsh',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND',
    bellSoundURL: 'https://dl.dropboxusercontent.com/u/53826881/Notification.wav'
  },
  plugins: [
    'hyper-snazzy',
    'hyper-hide-title',
    'hypercwd',
    'hyper-statusline',
  ],
};

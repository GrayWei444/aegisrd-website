/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,md,mdx,ts,tsx}'],
  theme: {
    extend: {
      colors: {
        // 沿用現行品牌色（舊站 CSS 變數）
        ink: '#0d1b2a',        // 主背景深藍
        panel: '#13253a',      // 卡片底
        line: '#1e3a5f',       // 邊線
        fg: '#e8ecf4',         // 主文字
        dim: '#93a4bd',        // 次文字
        accent: '#26c6da',     // 青色主 accent
        ok: '#22c55e',
        info: '#3b82f6',
        warn: '#f59e0b',
        danger: '#ef4444',
      },
      fontFamily: {
        sans: ['"Noto Sans TC"', 'Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
};

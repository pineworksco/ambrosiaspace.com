import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig(({command}) => ({
    base: command === 'serve' ? '/' : '/dist/',
    plugins: [tailwindcss()],
    build: {
        manifest: true,
        rollupOptions: {
            input: {
                app: 'src/js/app.js',
            }
        },
        outDir: 'web/dist'
    },
    server: {
        port: 5173,
        host: '0.0.0.0',
        strictPort: true,
        cors: {
            origin: /https?:\/\/([A-Za-z0-9\-\.]+)?(localhost|\.local|\.test|\.site)(?::\d+)?$/
        },
        origin: "https://craftcms-vite-tailwind.ddev.site:5173",
        watch: {
            ignored: ['./storage/**', './vendor/**', './web/**'],
        }
    }
}));
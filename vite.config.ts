import { defineConfig } from "vite";

export default defineConfig({
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
        watch: {
            ignored: ['./storage/**', './vendor/**', './web/**'],
        }
    }
});
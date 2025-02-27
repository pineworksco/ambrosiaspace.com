import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import ViteRestart from 'vite-plugin-restart';
import viteCompression from 'vite-plugin-compression';
import checker from 'vite-plugin-checker';

export default defineConfig(({command}) => ({
    base: command === 'serve' ? '/' : '/dist/',
    plugins: [
        tailwindcss(),
        ViteRestart(
            {
                restart: ['./templates/**/*']
            }
       ),
        viteCompression({
            filter: /\.(mjs|json|css|map)$/i,
        }),
        checker({
            eslint: {
                lintCommand: 'eslint "./src/**/*.{js,ts}"',
                useFlatConfig: true,
                dev: {
                    overrideConfig: {
                        cache: true,
                    }
                }
            },
        })
    ],
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
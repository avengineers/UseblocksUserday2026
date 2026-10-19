import os from "node:os";
import { defineConfig } from "vite";

export default defineConfig({
  server: {
    port: 3000,
    open: true,
    host: true,
    // Vite rejects requests whose Host header is not an IP or localhost.
    // Allow this machine's own name, so http://<hostname>:3000/ works on the network.
    allowedHosts: [os.hostname()],
    watch: {
      usePolling: true,
      interval: 300,
      ignored: ["**/node_modules/**", "**/.*/**"],
    },
    hmr: {
      overlay: true,
    },
  },
  plugins: [
    {
      name: "reload-on-file-change",
      handleHotUpdate({ file, server }) {
        // Special handling for markdown files
        if (file.endsWith(".md")) {
          console.log(`Markdown file changed: ${file}`);
          server.ws.send({
            type: "full-reload",
            path: "*",
          });
          return [];
        }
        // Special handling for images
        if (/\.(png|jpg|jpeg|gif|svg|webp)$/i.test(file)) {
          console.log(`Image file changed: ${file}`);
          server.ws.send({
            type: "full-reload",
            path: "*",
          });
          return [];
        }
        // Log all other file changes
        console.log(`File changed: ${file}`);
      },
    },
  ],
  build: {
    outDir: "dist",
    assetsDir: "assets",
    rollupOptions: {
      input: {
        main: "./index.html",
      },
    },
  },
  base: "./",
});

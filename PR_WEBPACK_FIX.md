This PR adds `/* webpackIgnore: true */` comments to all dynamic `require` calls in `asciidoctor-kroki`. 

### **Reasoning:**
When `asciidoctor-kroki` is used in a Webpack or Vite environment (e.g., inside a VS Code Web extension or a React/Vue app), the bundler flags dynamic requirements as "Critical dependencies". While these requirements are intentional (e.g., switching between browser and node implementations, or loading optional adapters), the warnings clutter build logs and can be confusing for developers.

### **Changes:**
- Added `/* webpackIgnore: true */` to all internal `require` calls in `src/asciidoctor-kroki.js`.
- This ensures that bundlers skip static analysis for these calls without impacting runtime behavior.

**Verified:** This correctly suppresses warnings in downstream projects like `asciidoctor-vscode`.

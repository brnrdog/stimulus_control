import resolve from "@rollup/plugin-node-resolve";

export default {
  input: "./src/stimulus_control.js",
  output: {
    file: "./lib/generators/stimulus_control/templates/stimulus_control.js",
    format: "iife",
    globals: {
      stimulus: "stimulus",
    },
  },
  plugins: [resolve()],
};

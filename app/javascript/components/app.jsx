import React from "react";
import { createRoot } from "react-dom/client";
import Table from "./table";

export default function App() {
  return <Table />
}

// Render your React component instead
const app = createRoot(document.getElementById("app"));

if (app) {
  const root= createRoot(app)
  root.render(<App />);
}

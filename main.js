const { app, BrowserWindow, Menu } = require("electron");
const path = require("path");

Menu.setApplicationMenu(null);

function createMainWindow() {
  const win = new BrowserWindow({
    width: 760,
    height: 600,
    title: "System Process",
    autoHideMenuBar: true,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
    },
  });
  win.loadFile("busy_screen.html");
  return win;
}

app.whenReady().then(() => {
  createMainWindow();

  app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) createMainWindow();
  });
});

app.on("window-all-closed", () => {
  if (process.platform !== "darwin") app.quit();
});

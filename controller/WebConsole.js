var driver, ssh;
const { NodeSSH } = require("node-ssh");

ssh = new NodeSSH();

const sshConfig = {
  host: "localhost",
  username: "ubuntu",
  privateKey: "topkek99",
};

module.exports = async (ws, req) => {
  console.log("connected");
  try {
    await ssh.connect(sshConfig);
  } catch (error) {
    console.log(error);
  }

  const shellStream = await ssh.requestShell();
  ws.on("message", (msg) => {
    const data = JSON.parse(msg);
    switch (data.method) {
      case "command":
        shellStream.write(data.command.trim() + "\n");
        break;
    }
  });
  // listener
  shellStream.on("data", (data) => {
    const d = JSON.stringify({
      jsonrpc: "2.0",
      data: data.toString(),
    });
    ws.send(d);
  });
  shellStream.stderr.on("data", (data) => {
    const d = JSON.stringify({
      jsonrpc: "1.0",
      data: data.toString(),
    });
    ws.send(d);
  });
};

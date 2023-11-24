const scriptPath = './autocommit.sh';
const { exec } = require('child_process');
const runEvery5Mins = () => {
    const random = Math.floor(Math.random() * (300 - 100) + 100);
    const command = `bash ${scriptPath} ${new Date().toISOString()} ${random}`;
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
    });
}
setInterval(()=>{
    runEvery5Mins();
},60000*5)

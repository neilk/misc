const { promisify } = require('util');
const { exec } = require('child_process');
const shell = promisify(exec);
const sleep = promisify(setTimeout);

const MS_PER_SECOND = 1000;
const command = (process.argv.slice(2)).join(' ');

let sleepSeconds = 1; // 1 second to start

const main = async () => {
  while(true) {
    try {
      await shell(command);
      break;
    } catch(e) {
      console.error(`Sleeping ${sleepSeconds} seconds before retry...`);
      await sleep(sleepSeconds * MS_PER_SECOND);
      sleepSeconds *= 2;
    }
  }
};

main().then(process.exit);

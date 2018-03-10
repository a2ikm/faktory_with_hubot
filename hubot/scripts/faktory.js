const Faktory = require("faktory-client")
const faktory = new Faktory()
faktory.connect()

module.exports = (robot => {
  robot.hear(/hello/i, async res => {
    jid = await faktory.push({
      jobtype: "Hello",
      queue: "hello",
      args: [res.message.user, res.message.text]
    })
    res.send(`jid = ${jid}`)
  })
})

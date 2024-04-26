const fs = require('fs')
const path = require('path')

console.log('pwd', process.cwd())

const jsonPath = path.join(process.cwd(), 'node_modules/@mapbox/node-pre-gyp/lib/util/abi_crosswalk.json')
const json = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'))

json['18.13.0'] = {
    "node_abi": 108,
    "v8": "10.2"
}

fs.writeFileSync(jsonPath, JSON.stringify(json, null, 2))

console.log(fs.readFileSync(jsonPath, 'utf-8'))
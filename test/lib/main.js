"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const core = __importStar(require("@actions/core"));
const { execSync } = require('child_process');
function run() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            execSync("gem install bundler", { stdio: 'inherit' });
            execSync("bundle install --jobs 4 --retry 3", { stdio: 'inherit' });
            execSync("bundle exec $(bundle exec rake -T | grep services:up | sed 's/\\w*#.*//')", { stdio: 'inherit' });
            execSync(`timeout 300 bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:9200)" != "200" ]]; do sleep 1; done' || false`, { stdio: 'inherit' });
            execSync(core.getInput('command'), { env: Object.assign(process.env, { CI: true }), stdio: 'inherit' });
        }
        catch (error) {
            core.setFailed(error);
        }
    });
}
run();

#!/usr/bin/env node

import { program } from 'commander';
import { execSync } from 'child_process';
import inquirer from 'inquirer';
import fs from "fs";

// Define available project templates (branches)
const templates = ['flutter-template', "node-template"];

program
    .description('Generate project from template')
    .parse(process.argv);

async function run() {
    let root;
    const { template } = await inquirer.prompt([
        {
            type: 'list',
            name: 'template',
            message: 'Choose project template:',
            choices: templates,
        },
    ]);

    if (template !== "flutter-template") {
        const input = await inquirer.prompt([
            {
                type: 'input',
                name: 'root',
                message: 'Enter project root folder name:',
                default: 'new-project',
            },
        ]);
        root = input.root
    }

    const repoURL = `https://github.com/Subrata-Rajak/QuickStartCLI.git`;

    try {
        if (template === "flutter-template") {
            execSync(`git clone -b ${template} ${repoURL} lib`);
            fs.unlinkSync('lib/README.md');
            console.log(`Add the necessary packages in your pubspec.yaml file`);
        } else {
            execSync(`git clone -b ${template} ${repoURL} ${root}`);
        }
        console.log(`Project generated from ${template} template.`);
    } catch (err) {
        console.error('Error:', err.message);
        process.exit(1);
    }
}

run();

## QuickQuestions
![GitHub](https://img.shields.io/github/license/karimerobles/quickquestions)
![Travis (.org)](https://img.shields.io/travis/karimerobles/quickquestions)
[![codecov](https://codecov.io/gh/karimerobles/quickquestions/branch/master/graph/badge.svg?token=RF1QLASAI6)](undefined)

Collaboration with flp2111 on an iOS Quiz-style game app using a customizable open trivia database. User incentive is to always have a readliy avaibale trivia game. Users can set the number of questions, cateogry, and difficulty of any trivia quiz they want to have. Each game ends with showing them their results to incentives them to do better next time.

### Key features
- Highly customizable trivia
- Simple and intutive UI
- Easy to implement new quiz databases
- Built with Swift and Xcode for easier development onboarding

### Database
Quick questions uses an open database to gather an almost endless amount of questions to always have new questions ranging from different themes and difficulty. Quiz database: https://opentdb.com/api_config.php. View developer documentation for adding new quiz databases.

## Usage
1. Have Xcode 12.0+.
2. Download and open the project
3. Press "Run" to build and run the app on a simulator or physcial device

## Developer Documentation
### Automation
- Travis for automated testing. Travis runs the quick questions Unit and UI tests from the Xcode project
- Codecov for code coverage
- SwiftLint for linting

### Adding new databases
Quick questions is highly customizable to fit any quiz database you like. The current database used is to show how simple it is to add one.
To add your own quiz database, all you need to do is to make sure the data will conform to the Quiz and Question models.


### Release notes / Roadmap
Coming soon.

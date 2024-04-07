/**
* This exposes the native AllAppModule module as a JS module. This has a
* function 'getInstalledApps' which takes the following parameters:

* 1. String name: A string representing the name of the event
* 2. String location: A string representing the location of the event
*/
import {NativeModules} from 'react-native';
const {AllAppModule} = NativeModules;

interface AllAppModuleInterface {
  getInstalledApps(callback: (installedApps: string[]) => void): void;
}

export default AllAppModule as AllAppModuleInterface;

import {SafeAreaView, NativeModules, Button} from 'react-native';
import React from 'react';

const {AllAppModule} = NativeModules;

const App = () => {
  return (
    <SafeAreaView>
      <Button
        title="Show Alert"
        onPress={() => AllAppModule.getAllApp('testName', 'testLocation')}
      />
    </SafeAreaView>
  );
};

export default App;

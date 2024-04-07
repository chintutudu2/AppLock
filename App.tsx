import {SafeAreaView, Button, FlatList, Text} from 'react-native';
import React, {useState} from 'react';
import NativeAllAppModule from './src/NativeModules/NativeModule';

const App = () => {
  const [apps, setApps] = useState<string[]>([]);
  return (
    <SafeAreaView style={{flex: 1}}>
      <Button
        title="Show Alert"
        onPress={() =>
          NativeAllAppModule.getInstalledApps(callback => {
            console.log(callback);
            setApps(callback);
          })
        }
      />
      <FlatList
        data={apps}
        renderItem={({item}) => (
          <Text style={{marginVertical: 10}}>{item}</Text>
        )}
      />
    </SafeAreaView>
  );
};

export default App;

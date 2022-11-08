import React from 'react';
import {
  Text,
  View,
  Button,
  TextInput,
  StyleSheet,
  Image,
  TouchableOpacity,
} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
  img: {
    width: 100,
    height: 100,
    margin: 50,
    borderRadius: 50,
  },
  buttonRow: {
    flexDirection: 'row',
    justifyContent: 'space-evenly',
    width: 300,
    marginBottom: 20,
  },
  textRow: {
    flexDirection: 'row',
    justifyContent: 'space-evenly',
    marginTop: 30,
    width: 400,
    paddingLeft: 20,
  },
  text: {
    textAlignVertical: 'center',
  },
  input: {
    width: 150,
  },
});

const lab1 = () => {
  const [text, onChangeText] = React.useState('example@domain');
  return (
    <View style={styles.center}>
      <Image
        style={styles.img}
        source={{
          uri: 'https://reactnative.dev/img/tiny_logo.png',
        }}
      />
      <View style={styles.buttonRow}>
        <Button title="BUTTON" color="#c7c7c7" />
        <Button title="BUTTON" color="#c7c7c7" />
      </View>
      <View style={styles.buttonRow}>
        <Button title="BUTTON" color="#c7c7c7" />
        <Button title="BUTTON" color="#c7c7c7" />
      </View>
      <View style={styles.textRow}>
        <Text style={styles.text}>Email</Text>
        <TextInput
          style={styles.input}
          onChangeText={onChangeText}
          value={text}
        />
      </View>
    </View>
  );
};

export default lab1;

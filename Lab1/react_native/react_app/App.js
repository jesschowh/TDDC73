import React from 'react';
import {Text, View, Button, TextInput, StyleSheet, Image} from 'react-native';

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
    width: 300,
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
        <Button
          title="BUTTON"
          color="#c7c7c7"
          text-color="#00000"
          onPress={() => Alert.alert('Simple Button pressed')}
        />

        <Button
          title="BUTTON"
          color="#c7c7c7"
          onPress={() => Alert.alert('Simple Button pressed')}
        />
      </View>
      <View style={styles.buttonRow}>
        <Button
          title="BUTTON"
          color="#c7c7c7"
          onPress={() => Alert.alert('Simple Button pressed')}
        />
        <Button
          title="BUTTON"
          color="#c7c7c7"
          onPress={() => Alert.alert('Simple Button pressed')}
        />
      </View>
      <View style={styles.textRow}>
        <Text>Email</Text>
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

// /**
//  * Sample React Native App
//  * https://github.com/facebook/react-native
//  *
//  * @format
//  * @flow strict-local
//  */

// import React from 'react';
// import type {Node} from 'react';
// import {
//   SafeAreaView,
//   ScrollView,
//   StatusBar,
//   StyleSheet,
//   Text,
//   useColorScheme,
//   View,
// } from 'react-native';

// import {
//   Colors,
//   DebugInstructions,
//   Header,
//   LearnMoreLinks,
//   ReloadInstructions,
// } from 'react-native/Libraries/NewAppScreen';

// /* $FlowFixMe[missing-local-annot] The type annotation(s) required by Flow's
//  * LTI update could not be added via codemod */
// const Section = ({children, title}): Node => {
//   const isDarkMode = useColorScheme() === 'dark';
//   return (
//     <View style={styles.sectionContainer}>
//       <Text
//         style={[
//           styles.sectionTitle,
//           {
//             color: isDarkMode ? Colors.white : Colors.black,
//           },
//         ]}>
//         {title}
//       </Text>
//       <Text
//         style={[
//           styles.sectionDescription,
//           {
//             color: isDarkMode ? Colors.light : Colors.dark,
//           },
//         ]}>
//         {children}
//       </Text>
//     </View>
//   );
// };

// const App: () => Node = () => {
//   const isDarkMode = useColorScheme() === 'dark';

//   const backgroundStyle = {
//     backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
//   };

//   return (
//     <SafeAreaView style={backgroundStyle}>
//       <StatusBar
//         barStyle={isDarkMode ? 'light-content' : 'dark-content'}
//         backgroundColor={backgroundStyle.backgroundColor}
//       />
//       <ScrollView
//         contentInsetAdjustmentBehavior="automatic"
//         style={backgroundStyle}>
//         <Header />
//         <View
//           style={{
//             backgroundColor: isDarkMode ? Colors.black : Colors.white,
//           }}>
//           <Section title="Step One">
//             Edit <Text style={styles.highlight}>App.js</Text> to change this
//             screen and then come back to see your edits.
//           </Section>
//           <Section title="See Your Changes">
//             <ReloadInstructions />
//           </Section>
//           <Section title="Debug">
//             <DebugInstructions />
//           </Section>
//           <Section title="Learn More">
//             Read the docs to discover what to do next:
//           </Section>
//           <LearnMoreLinks />
//         </View>
//       </ScrollView>
//     </SafeAreaView>
//   );
// };

// const styles = StyleSheet.create({
//   sectionContainer: {
//     marginTop: 32,
//     paddingHorizontal: 24,
//   },
//   sectionTitle: {
//     fontSize: 24,
//     fontWeight: '600',
//   },
//   sectionDescription: {
//     marginTop: 8,
//     fontSize: 18,
//     fontWeight: '400',
//   },
//   highlight: {
//     fontWeight: '700',
//   },
// });

// export default App;

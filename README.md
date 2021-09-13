 # Senior Contacts

This simple mobile app allows Alzheimer's patients to create a digital contact book of friends and loved ones to help strengthen their memory.
## MVP

At the minimum, this app will contain:
1) A Camera Page:
    * Allows users to scan a person they want forgot
    * Photo will be used in the machiene learning algorithm, to recognize faces
2) A Contact Book Page (main):
    * Will show a basic contact book of people that have been added to the book (likely to be the home page)
3) A Contact Info Page
    * When neededing more information about a contact in the book, users will be taken to this window
    * Information displayed will include:
        * Name
        * Photo
        * Relationship to the User
        * Any important facts that may allow the user to remember that contact
4)  A Flashcard Page
    * Will generate flashcards for each contact in the book to help the user train to remember important contacts
## Stretch Goals

- Create more functionality to remind userse of certain daily activities they may forget (taking meds, etc)
## Tech Stack Resources

 * IDE : [Android Studio](https://developer.android.com/studio)
    - You can really use any text editor you prefer (VSCode, etc) but I really like Android Studio, I've used it for many projects and find it very reliable especially when for making cross compatible mobile apps    
* Machine Learning Algorithm:
  * Make our own complete models using [TenserFlow Lite](https://www.tensorflow.org/lite). 
    * Note it will be written using python
    * Will likely use Goggle Kollab to make and train the algorithm
    * [Getting starte with Tensorflow Lite](https://www.tensorflow.org/lite/guide/get_started)
    * [Tensorflow lite with Flutter](https://medium.com/flutterdevs/implementing-tensorflow-lite-in-flutter-c21738e9d35c) 
    * [Image recognition with Flutter and Tenserflow Lite](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjjpcjcpdvuAhWRAZ0JHTETAm4QFjAEegQIBRAC&url=https%3A%2F%2Fheartbeat.fritz.ai%2Fbuilding-a-cross-platform-image-classifier-with-flutter-and-tensorflow-lite-c7789af9b33a&usg=AOvVaw0rYWR_gbhCyWdS45mfuTxN)
  * I recommend selecting our dataset from [Kaggle](https://www.kaggle.com/_), lots of pre-existing data sets for facial recogntion exist
  * [Flutter](https://flutter.dev/docs):
     * Uses [Dart](https://dart.dev/) as a language
     * Has LOTS of [documentation](https://flutter.dev/docs)
     * [Using the camera with flutter](https://www.raywenderlich.com/4333657-using-the-camera-on-flutter)
* Flashcards:
    * We can either try to use [Quizlet's API](https://www.programmableweb.com/api/quizlet-flashcards), but from my extensive research, I'm just not sure how compatible it is with Dart
    * The safe option would just to build a simple flash card game with [Flutter](https://junjizhi.medium.com/build-a-flashcard-app-with-flutter-d2e71f47fd4e)
* Database:
  * Used to store our contacts
  * [Firebase](https://firebase.google.com/), made by google, also has services making it easier to train our ML Models
  * [Firebase and flutter](https://www.youtube.com/watch?v=sfA3NWDBPZ4&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
* [Gitbash](https://gitforwindows.org/)
  * A very useful [Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf) of commands you will use
* Some random tutorials you may find useful!
  * https://medium.com/@estebanuri/real-time-face-recognition-with-android-tensorflow-lite-14e9c6cc53a5
  * https://medium.com/@saidakbarp/real-time-face-recognition-tflite-3fb818ac039a
  * https://towardsdatascience.com/using-facenet-for-on-device-face-recognition-with-android-f84e36e19761







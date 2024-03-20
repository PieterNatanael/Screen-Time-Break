//
//  ContentView.swift
//  Screen Time Break
//
//  Created by Pieter Yoshua Natanael on 18/03/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
   @State private var isTimerRunning = false
   @State private var countdown: Int = 20 * 60 // 20 minutes in seconds
   let speechSynthesizer = AVSpeechSynthesizer()

   var body: some View {
       VStack {
           Text("Screen Time Break")
               .font(.title)
           
           Button(action: {
               isTimerRunning.toggle()
               if isTimerRunning {
                   startTimer()
               } else {
                   pauseTimer()
               }
           }) {
               Text(isTimerRunning ? "Pause" : "Start")
           }
           
           Text("Time remaining: \(countdown / 60) minutes \(countdown % 60) seconds")
               .font(.subheadline)
       }
       .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
           if isTimerRunning {
               countdown -= 1
               if countdown <= 0 {
                   speakAnnouncement()
                   resetTimer()
               }
           }
       }
   }
   
   func startTimer() {
       countdown = 20 * 60 // Reset countdown to 20 minutes
   }
   
   func pauseTimer() {
       // No action needed for pausing in this simplified example
   }
   
   func resetTimer() {
       countdown = 20 * 60 // Reset countdown to 20 minutes
   }
   
   func speakAnnouncement() {
       let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
       let speechUtterance = AVSpeechUtterance(string: message)
       speechSynthesizer.speak(speechUtterance)
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}

/*/
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var countdown: Int = 20 * 60 // 20 minutes in seconds
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Screen Time Break")
                .font(.title)
            
            Button(action: {
                isTimerRunning.toggle()
                if isTimerRunning {
                    startTimer()
                    speakAnnouncement()
                } else {
                    pauseTimer()
                }
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
            }
            
            Text("Time remaining: \(countdown / 60) minutes \(countdown % 60) seconds")
                .font(.subheadline)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if isTimerRunning {
                countdown -= 1
                if countdown <= 0 {
                    speakAnnouncement()
                    resetTimer()
                }
            }
        }
        .background {
            // This empty background view ensures that the timer continues in the background
        }
    }
    
    func startTimer() {
        countdown = 20 * 60 // Reset countdown to 20 minutes
    }
    
    func pauseTimer() {
        // No action needed for pausing in this simplified example
    }
    
    func resetTimer() {
        countdown = 20 * 60 // Reset countdown to 20 minutes
    }
    
    func speakAnnouncement() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .mixWithOthers)
            let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
            let speechUtterance = AVSpeechUtterance(string: message)
            speechSynthesizer.speak(speechUtterance)
        } catch {
            print("Failed to set audio session category.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var countdown: Int = 20 * 60 // 20 minutes in seconds
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Screen Time Break")
                .font(.title)
            
            Button(action: {
                isTimerRunning.toggle()
                if isTimerRunning {
                    startTimer()
                    speakAnnouncement()
                } else {
                    pauseTimer()
                }
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
            }
            
            Text("Time remaining: \(countdown / 60) minutes \(countdown % 60) seconds")
                .font(.subheadline)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if isTimerRunning {
                countdown -= 1
                if countdown <= 0 {
                    speakAnnouncement()
                    resetTimer()
                }
            }
        }
    }
    
    func startTimer() {
        countdown = 20 * 60 // Reset countdown to 20 minutes
    }
    
    func pauseTimer() {
        // No action needed for pausing in this simplified example
    }
    
    func resetTimer() {
        countdown = 20 * 60 // Reset countdown to 20 minutes
    }
    
    func speakAnnouncement() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .mixWithOthers)
            let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
            let speechUtterance = AVSpeechUtterance(string: message)
            speechSynthesizer.speak(speechUtterance)
        } catch {
            print("Failed to set audio session category.")
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/
/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var countdown: Int = 20 * 60 // 20 minutes in seconds
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Text("Screen Time Break")
                .font(.title)
            
            Button(action: {
                isTimerRunning.toggle()
                if isTimerRunning {
                    startTimer()
                } else {
                    pauseTimer()
                }
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
            }
            
            Text("Time remaining: \(countdown / 60) minutes \(countdown % 60) seconds")
                .font(.subheadline)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if isTimerRunning {
                countdown -= 1
                if countdown <= 0 {
                    speakAnnouncement()
                    resetTimer()
                }
            }
        }
    }
    
    func startTimer() {
        countdown = 20 * 60 // Reset countdown to 20 minutes
    }
    
    func pauseTimer() {
        // No action needed for pausing in this simplified example
    }
    
    func resetTimer() {
        countdown = 20 * 60 // Reset countdown to 20 minutes
    }
    
    func speakAnnouncement() {
        let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    let speechSynthesizer = AVSpeechSynthesizer()
    @State private var countdown: Int = 20 * 60 // 20 minutes in seconds

    var body: some View {
        VStack {
            Text("Screen Time Break")
                .font(.title)
            
            Button(action: {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
            }
            
            Text("Time remaining: \(countdown / 60) minutes \(countdown % 60) seconds")
                .font(.subheadline)
        }
        .onReceive(timer ?? Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if isTimerRunning {
                countdown -= 1
                if countdown <= 0 {
                    speakAnnouncement()
                    resetTimer()
                }
            }
        }
    }
    
    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countdown -= 1
            if countdown <= 0 {
                speakAnnouncement()
                resetTimer()
            }
        }
    }
    
    func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        countdown = 20 * 60
    }
    
    func speakAnnouncement() {
        let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Text("Screen Time Break")
                .font(.title)
            
            Button(action: {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            pauseTimer()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 20 * 60, repeats: true) { _ in
            // Code to speak 20-20-20 message
            let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
            speak(message)
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func speak(_ message: String) {
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Text("Screen Time Break")
                .font(.title)
            
            Button(action: {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
            }
        }
        .onReceive(timer ?? Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            // Timer logic
            // Update UI or trigger speech announcement every second
        })
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 20 * 60, repeats: true) { _ in
            // Code to speak 20-20-20 message
            let message = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
            speak(message)
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func speak(_ message: String) {
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/
/*
import SwiftUI

struct ContentView: View {
    @State private var timerValue = 1200 // 20 minutes in seconds
    @State private var isTimerRunning = false
    @State private var isInitialAnnouncement = true
    
    let announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds. Blink slowly once, twice, thrice, four times, five times, six times, seven times, eight times, nine times, ten times. Break time done, see you in 20 minutes."
    
    var body: some View {
        VStack {
            Text("Timer: \(formatTimer(timerValue))")
                .font(.title)
                .padding()
            
            Button(isTimerRunning ? "Pause" : "Start") {
                if isTimerRunning {
                    stopTimer()
                } else {
                    startTimer()
                }
            }
            .padding()
            
            Text("Announcement: \(announcement)")
                .padding()
        }
    }
    
    func formatTimer(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
    
    func startTimer() {
        if isInitialAnnouncement {
            isInitialAnnouncement = false
            // Trigger initial announcement here
        }
        
        isTimerRunning = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timerValue > 0 {
                timerValue -= 1
            } else {
                stopTimer()
                // Trigger announcement and restart timer here
            }
        }
    }
    
    func stopTimer() {
        isTimerRunning = false
        // Stop the timer
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/
/*

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 80))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < 60  {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let totalSeconds = self.hours * 3600 + self.minutes * 60 + self.seconds
            self.updateTime(totalSeconds: totalSeconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        if totalSeconds >= 24 * 3600 {
            pauseTimer()
        } else {
            hours = totalSeconds / 3600
            minutes = (totalSeconds % 3600) / 60
            seconds = totalSeconds % 60

            if (totalSeconds % (20 * 60) == 0 || totalSeconds == 3) && totalSeconds <= 24 * 3600 {
                speakMessage()
            }
            if totalSeconds % 40 == 0 && totalSeconds <= 24 * 3600 {
                     speakYes()
                 }
        }
    }
    
    private func speakYes() {
        let message = "yes"
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }

    private func speakMessage() {
        let message = "screen time break......... look at something 20 feet for 20 seconds,I repeat,look at something 20 feet for 20 seconds. Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.see you in 20 minute"
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/



/*

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 80))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < (20 * 60) {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let totalSeconds = self.hours * 3600 + self.minutes * 60 + self.seconds
            self.updateTime(totalSeconds: totalSeconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        if totalSeconds >= 24 * 3600 {
            pauseTimer()
        } else {
            hours = totalSeconds / 3600
            minutes = (totalSeconds % 3600) / 60
            seconds = totalSeconds % 60

            if totalSeconds % (20 * 60) == 0 && totalSeconds <= 24 * 3600 {
                speakMessage()
            }
        }
    }

    private func speakMessage() {
        let message = "screen time break, look at something 20 feet for 20 seconds,I repeat,look at something 20 feet for 20 seconds. Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.see you in 20 minute"
        
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 */

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerCount = 0
    @State private var isTimerRunning = false
    @State private var announcement = ""
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerCount))")
                .font(.title)
                .padding()
            
            Button(action: {
                if isTimerRunning {
                    timer.upstream.connect().cancel()
                    speechSynthesizer.stopSpeaking(at: .immediate)
                    announcement = "Timer paused."
                } else {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds."
                    speak(announcement)
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
            }
            
            Button(action: {
                timer.upstream.connect().cancel()
                timerCount = 0
                isTimerRunning = false
                announcement = ""
                speechSynthesizer.stopSpeaking(at: .immediate)
            }) {
                Text("Reset")
                    .font(.title2)
                    .padding()
            }
            
            Text(announcement)
                .font(.title2)
                .padding()
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                timerCount += 1
                if timerCount % (20 * 60) == 0 {
                    announcement = "Blink slowly once, blink slowly twice, blink slowly thrice, blink slowly four times, blink slowly five times, blink slowly six times, blink slowly seven times, blink slowly eight times, blink slowly nine times, blink slowly ten times. Break time done, see you in 20 minutes."
                    speak(announcement)
                    // Schedule the next announcement after 20 minutes
                    DispatchQueue.main.asyncAfter(deadline: .now() + 20 * 60) {
                        speak("Screen Time Break: Look at something 20 feet away for 20 seconds.")
                    }
                }
            }
        }
    }
    
    func formattedTime(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func speak(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = 0.5 // Adjust speech rate as needed
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerCount = 0
    @State private var isTimerRunning = false
    @State private var announcement = ""
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerCount))")
                .font(.title)
                .padding()
            
            Button(action: {
                if isTimerRunning {
                    timer.upstream.connect().cancel()
                    speechSynthesizer.stopSpeaking(at: .immediate)
                    announcement = "Timer paused."
                } else {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds."
                    speak(announcement)
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
            }
            
            Button(action: {
                timer.upstream.connect().cancel()
                timerCount = 0
                isTimerRunning = false
                announcement = ""
                speechSynthesizer.stopSpeaking(at: .immediate)
            }) {
                Text("Reset")
                    .font(.title2)
                    .padding()
            }
            
            Text(announcement)
                .font(.title2)
                .padding()
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                timerCount += 1
                if timerCount % (20 * 60) == 0 {
                    announcement = "Blink slowly once, blink slowly twice, blink slowly thrice, blink slowly four times, blink slowly five times, blink slowly six times, blink slowly seven times, blink slowly eight times, blink slowly nine times, blink slowly ten times. Break time done, see you in 20 minutes."
                    speak(announcement)
                }
            }
        }
    }
    
    func formattedTime(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func speak(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = 0.5 // Adjust speech rate as needed
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 80))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIApplication.willResignActiveNotification,
                object: nil,
                queue: .main) { _ in
                self.backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: {
                    UIApplication.shared.endBackgroundTask(self.backgroundTaskID!)
                })
            }
            
            NotificationCenter.default.addObserver(
                forName: UIApplication.didBecomeActiveNotification,
                object: nil,
                queue: .main) { _ in
                if let taskID = self.backgroundTaskID {
                    UIApplication.shared.endBackgroundTask(taskID)
                    self.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            startTimerInBackground()
        }
    }

    private func startTimerInBackground() {
        if timer == nil || !timer!.isValid {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                let totalSeconds = self.hours * 3600 + self.minutes * 60 + self.seconds
                self.updateTime(totalSeconds: totalSeconds + 1)
            }
            RunLoop.current.add(timer!, forMode: .common)
        }
    }

    private func startTimer() {
        isTimerRunning = true
        startTimerInBackground()
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        if totalSeconds >= 24 * 3600 {
            pauseTimer()
        } else {
            hours = totalSeconds / 3600
            minutes = (totalSeconds % 3600) / 60
            seconds = totalSeconds % 60

            if (totalSeconds % (20 * 60) == 0 || totalSeconds == 3) && totalSeconds <= 24 * 3600 {
                speakMessage()
            }

        }
    }

    private func speakMessage() {
        let message = "screen time break, look at something 20 feet for 20 seconds,I repeat,look at something 20 feet for 20 seconds. Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.see you in 20 minute"
        
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 80))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < (20 * 60) {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let totalSeconds = self.hours * 3600 + self.minutes * 60 + self.seconds
            self.updateTime(totalSeconds: totalSeconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        if totalSeconds >= 24 * 3600 {
            pauseTimer()
        } else {
            hours = totalSeconds / 3600
            minutes = (totalSeconds % 3600) / 60
            seconds = totalSeconds % 60

            if totalSeconds % (20 * 60) == 0 && totalSeconds <= 24 * 3600 {
                speakMessage()
            }
        }
    }

    private func speakMessage() {
        let message = "screen time break, look at something 20 feet for 20 seconds,I repeat,look at something 20 feet for 20 seconds. Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.see you in 20 minute"
        
        let speechUtterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/


/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerCount = 0
    @State private var isTimerRunning = false
    @State private var announcement = ""
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerCount))")
                .font(.title)
                .padding()
            
            Button(action: {
                if isTimerRunning {
                    timer.upstream.connect().cancel()
                    speechSynthesizer.stopSpeaking(at: .immediate)
                    announcement = "Timer paused."
                } else {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds."
                    speak(announcement)
                    scheduleAnnouncements()
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
            }
            
            Button(action: {
                timer.upstream.connect().cancel()
                timerCount = 0
                isTimerRunning = false
                announcement = ""
                speechSynthesizer.stopSpeaking(at: .immediate)
            }) {
                Text("Reset")
                    .font(.title2)
                    .padding()
            }
            
            Text(announcement)
                .font(.title2)
                .padding()
        }
    }
    
    func formattedTime(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func speak(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = 0.5 // Adjust speech rate as needed
        speechSynthesizer.speak(speechUtterance)
    }
    
    func scheduleAnnouncements() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 20) {
            speak("Blink slowly once, blink slowly twice, blink slowly thrice, blink slowly four times, blink slowly five times, blink slowly six times, blink slowly seven times, blink slowly eight times, blink slowly nine times, blink slowly ten times. Break time done, see you in 20 minutes.")
            DispatchQueue.main.async {
                self.timerCount = 0
            }
            DispatchQueue.global().asyncAfter(deadline: .now() + 20 * 60) {
                speak("Screen Time Break: Look at something 20 feet away for 20 seconds.")
                scheduleAnnouncements()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerCount = 0
    @State private var isTimerRunning = false
    @State private var announcement = ""
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerCount))")
                .font(.title)
                .padding()
            
            Button(action: {
                if isTimerRunning {
                    timer.upstream.connect().cancel()
                    speechSynthesizer.stopSpeaking(at: .immediate)
                    announcement = "Timer paused."
                } else {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds."
                    speak(announcement)
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
            }
            
            Button(action: {
                timer.upstream.connect().cancel()
                timerCount = 0
                isTimerRunning = false
                announcement = ""
                speechSynthesizer.stopSpeaking(at: .immediate)
            }) {
                Text("Reset")
                    .font(.title2)
                    .padding()
            }
            
            Text(announcement)
                .font(.title2)
                .padding()
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                timerCount += 1
                if timerCount % (20 * 60) == 0 {
                    announcement = "Blink slowly once, blink slowly twice, blink slowly thrice, blink slowly four times, blink slowly five times, blink slowly six times, blink slowly seven times, blink slowly eight times, blink slowly nine times, blink slowly ten times. Break time done, see you in 20 minutes."
                    speak(announcement)
                    // Schedule the next announcement after 20 minutes
                    DispatchQueue.main.asyncAfter(deadline: .now() + 20 * 60) {
                        speak("Screen Time Break: Look at something 20 feet away for 20 seconds.")
                    }
                }
            }
        }
    }
    
    func formattedTime(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func speak(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = 0.5 // Adjust speech rate as needed
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerCount = 0
    @State private var isTimerRunning = false
    @State private var announcement = ""
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerCount))")
                .font(.title)
                .padding()
            
            Button(action: {
                if isTimerRunning {
                    timer.upstream.connect().cancel()
                    speechSynthesizer.stopSpeaking(at: .immediate)
                    announcement = "Timer paused."
                } else {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds."
                    speak(announcement)
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
            }
            
            Button(action: {
                timer.upstream.connect().cancel()
                timerCount = 0
                isTimerRunning = false
                announcement = ""
                speechSynthesizer.stopSpeaking(at: .immediate)
            }) {
                Text("Reset")
                    .font(.title2)
                    .padding()
            }
            
            Text(announcement)
                .font(.title2)
                .padding()
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                timerCount += 1
                if timerCount % (20 * 60) == 0 {
                    announcement = "Blink slowly once, blink slowly twice, blink slowly thrice, blink slowly four times, blink slowly five times, blink slowly six times, blink slowly seven times, blink slowly eight times, blink slowly nine times, blink slowly ten times. Break time done, see you in 20 minutes."
                    speak(announcement)
                }
            }
        }
    }
    
    func formattedTime(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func speak(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = 0.5 // Adjust speech rate as needed
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/

/*
import SwiftUI

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerCount = 0
    @State private var isTimerRunning = false
    @State private var announcement = ""
    
    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerCount))")
                .font(.title)
                .padding()
            
            Button(action: {
                if isTimerRunning {
                    timer.upstream.connect().cancel()
                    announcement = "Timer paused."
                } else {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    announcement = "Screen Time Break: Look at something 20 feet away for 20 seconds."
                }
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
            }
            
            Button(action: {
                timer.upstream.connect().cancel()
                timerCount = 0
                isTimerRunning = false
                announcement = ""
            }) {
                Text("Reset")
                    .font(.title2)
                    .padding()
            }
            
            Text(announcement)
                .font(.title2)
                .padding()
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                timerCount += 1
                if timerCount % (20 * 60) == 0 {
                    announcement = "Blink slowly once, blink slowly twice, blink slowly thrice, blink slowly four times, blink slowly five times, blink slowly six times, blink slowly seven times, blink slowly eight times, blink slowly nine times, blink slowly ten times. Break time done, see you in 20 minutes."
                }
            }
        }
    }
    
    func formattedTime(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var timerValue = 0
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    private var timerPublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Every second
    private var cancellables: Set<AnyCancellable> = []

    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerValue))")
                .font(.title)
                .padding()

            Button(action: {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(isTimerRunning ? Color.red : Color.green)
                    .cornerRadius(25.0)
            }

            Button(action: {
                resetTimer()
            }) {
                Text("Reset")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25.0)
            }
        }
        .onReceive(timerPublisher) { _ in
            if isTimerRunning {
                timerValue += 1
                if timerValue == 1 {
                    speakAnnouncement("Screen time break, look at something 20 feet away for 20 seconds.")
                }
            }
        }
        .onAppear {
            pauseTimer() // Ensure timer doesn't start automatically
        }
    }

    private func startTimer() {
        isTimerRunning = true
    }

    private func pauseTimer() {
        isTimerRunning = false
    }

    private func resetTimer() {
        isTimerRunning = false
        timerValue = 0
    }

    private func formattedTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func speakAnnouncement(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
/*
import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var timerValue = 0
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    private var timerPublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Every second
    private var cancellables: Set<AnyCancellable> = []

    var body: some View {
        VStack {
            Text("Timer: \(formattedTime(timerValue))")
                .font(.title)
                .padding()

            Button(action: {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
            }) {
                Text(isTimerRunning ? "Pause" : "Start")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(isTimerRunning ? Color.red : Color.green)
                    .cornerRadius(25.0)
            }

            Button(action: {
                resetTimer()
            }) {
                Text("Reset")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25.0)
            }
        }
        .onReceive(timerPublisher) { _ in
            if isTimerRunning {
                timerValue += 1
            }
        }
        .onAppear {
            pauseTimer() // Ensure timer doesn't start automatically
        }
    }

    private func startTimer() {
        isTimerRunning = true
    }

    private func pauseTimer() {
        isTimerRunning = false
    }

    private func resetTimer() {
        isTimerRunning = false
        timerValue = 0
    }

    private func formattedTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
 
 annouce well but UI is different
 
import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var isTimerRunning = false
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    private var timerPublisher = Timer.publish(every: 20 * 60, on: .main, in: .common).autoconnect() // Every 20 minutes
    private var cancellables: Set<AnyCancellable> = []

    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Button(action: {
                    if isTimerRunning {
                        pauseTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Text(isTimerRunning ? "Pause" : "Start")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(isTimerRunning ? Color.red : Color.green)
                        .cornerRadius(25.0)
                }
            }
        }
        .onReceive(timerPublisher) { _ in
            self.performEyeStrainReliefSequence()
        }
        .onAppear {
            pauseTimer() // Ensure timer doesn't start automatically
        }
    }

    private func startTimer() {
        isTimerRunning = true
        performEyeStrainReliefSequence() // Start immediately when user presses start
    }

    private func pauseTimer() {
        isTimerRunning = false
        timerPublisher.upstream.connect().cancel() // Stops the timer
    }

    private func performEyeStrainReliefSequence() {
        let initialAnnouncement = "Screen time break, look at something 20 feet away for 20 seconds."
        speakAnnouncement(initialAnnouncement)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            let blinkInstructions = (1...10).map { "Blink slowly \($0.timesWord)." }.joined(separator: " ")
            self.speakAnnouncement(blinkInstructions)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                let endBreakAnnouncement = "Break time done, see you in 20 minutes."
                self.speakAnnouncement(endBreakAnnouncement)
            }
        }
    }

    private func speakAnnouncement(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }
}

extension Int {
    var timesWord: String {
        switch self {
        case 1: return "once"
        case 2: return "twice"
        case 3...: return "\(self) times"
        default: return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/
/*
import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @StateObject private var timerCancellable = TimerCancellable()
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 80))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                registerBackgroundTask()
            }
        }
    }
    private func startTimer() {
        isTimerRunning = true
        timerCancellable.startTimer(updateTime: updateTime, speakAnnouncement: speakAnnouncement, speakBlinkInstructions: speakBlinkInstructions)
    }

//    private func startTimer() {
//        isTimerRunning = true
//        timerCancellable.startTimer(updateTime: updateTime, speakAnnouncement: speakAnnouncement, speakBlinkInstructions: speakBlinkInstructions)
//    }

    private func pauseTimer() {
        isTimerRunning = false
        timerCancellable.pauseTimer()
    }

    private func resetTimer() {
        isTimerRunning = false
        timerCancellable.resetTimer()
        hours = 0
        minutes = 0
        seconds = 0
    }

    private func updateTime() {
        seconds += 1
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        if minutes == 60 {
            hours += 1
            minutes = 0
        }

        if minutes % 20 == 0 && seconds == 0 {
              speakAnnouncement("Screen time break, look at something 20 feet away for 20 seconds.")
              DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                  self.speakBlinkInstructions()
              }
          }


        if hours == 24 {
            pauseTimer()
        }
    }
    
    private func speakBlinkInstructions() {
        let instructions = "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times."
        speakAnnouncement(instructions)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.speakAnnouncement("Break time done, see you in 20 minutes.")
        }
    }

//    private func speakBlinkInstructions() {
//        let instructions = "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times."
//        speakAnnouncement(instructions)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            self.speakAnnouncement("Break time done, see you in 20 minutes.")
//        }
//    }

    private func speakAnnouncement(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(utterance)
    }
    
    private func registerBackgroundTask() {
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
            self.backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                UIApplication.shared.endBackgroundTask(self.backgroundTaskID!)
                self.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { _ in
            if let bgTaskID = self.backgroundTaskID {
                UIApplication.shared.endBackgroundTask(bgTaskID)
                self.backgroundTaskID = nil
            }
        }
    }
}

class TimerCancellable: ObservableObject {
    private var timerCancellable: AnyCancellable?
    
    func startTimer(updateTime: @escaping () -> Void, speakAnnouncement: @escaping (String) -> Void, speakBlinkInstructions: @escaping () -> Void) {
        self.timerCancellable = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink { _ in
            updateTime()
        }
        speakAnnouncement("Screen time break, look at something 20 feet away for 20 seconds.")
    }
    
    func pauseTimer() {
        timerCancellable?.cancel()
    }
    
    func resetTimer() {
        timerCancellable?.cancel()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?
    var timerCancellable: AnyCancellable?

    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 80))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                registerBackgroundTask()
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        self.timerCancellable = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink { _ in
            self.updateTime()
        }
        speakAnnouncement("Screen time break, look at something 20 feet away for 20 seconds.")
    }

    private func pauseTimer() {
        isTimerRunning = false
        timerCancellable?.cancel()
    }

    private func resetTimer() {
        isTimerRunning = false
        timerCancellable?.cancel()
        hours = 0
        minutes = 0
        seconds = 0
    }

    private func updateTime() {
        seconds += 1
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        if minutes == 60 {
            hours += 1
            minutes = 0
        }

        if minutes % 20 == 0 && seconds == 0 {
            speakAnnouncement("Screen time break, look at something 20 feet away for 20 seconds.")
            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                self.speakBlinkInstructions()
            }
        }

        if hours == 24 {
            pauseTimer()
        }
    }

    private func speakBlinkInstructions() {
        let instructions = "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times."
        speakAnnouncement(instructions)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.speakAnnouncement("Break time done, see you in 20 minutes.")
        }
    }

    private func speakAnnouncement(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        speechSynthesizer.speak(utterance)
    }
    
    private func registerBackgroundTask() {
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
            self.backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                UIApplication.shared.endBackgroundTask(self.backgroundTaskID!)
                self.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { _ in
            if let bgTaskID = self.backgroundTaskID {
                UIApplication.shared.endBackgroundTask(bgTaskID)
                self.backgroundTaskID = nil
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d", minutes, seconds)) // Changed time format to include hours
                    .font(.system(size: 99))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                var cancellable: AnyCancellable?
                
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    // Check the remaining time before starting the background task
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < 30 {
                        // Less than 30 seconds remaining, end the task
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }

                cancellable = Timer.publish(every: 1, on: .main, in: .default)
                    .autoconnect()
                    .sink { _ in
                        if isTimerRunning {
                            updateTime(totalSeconds: self.minutes * 60 + self.seconds + 1)
                        }
                    }
                
                self.cancellable = cancellable
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTime(totalSeconds: minutes * 60 + seconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        let remainingSeconds = max(0, totalSeconds)
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = (remainingSeconds % 3600) % 60

        self.minutes = minutes
        self.seconds = seconds

        if totalSeconds % (20 * 60) == 0 && totalSeconds <= 24 * 60 * 60 {
            announceBreak()
        }

        if totalSeconds >= 24 * 60 * 60 {
            pauseTimer()
        }
    }

    private func announceBreak() {
        let speechUtterance = AVSpeechUtterance(string: "Screen time break, look at something 20 feet away for 20 seconds.")
        speechSynthesizer.speak(speechUtterance)

        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            let blinkUtterance = AVSpeechUtterance(string: "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.")
            self.speechSynthesizer.speak(blinkUtterance)

            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                let breakDoneUtterance = AVSpeechUtterance(string: "Break time done. See you in 20 minutes.")
                self.speechSynthesizer.speak(breakDoneUtterance)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*

import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?
    private var cancellable: AnyCancellable?

    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d", minutes, seconds)) // Changed time format to include hours
                    .font(.system(size: 99))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    // Check the remaining time before starting the background task
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < 30 {
                        // Less than 30 seconds remaining, end the task
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }

                self.cancellable = Timer.publish(every: 1, on: .main, in: .default)
                    .autoconnect()
                    .sink { _ in
                        if isTimerRunning {
                            updateTime(totalSeconds: minutes * 60 + seconds + 1)
                        }
                    }
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTime(totalSeconds: minutes * 60 + seconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        let remainingSeconds = max(0, totalSeconds)
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = (remainingSeconds % 3600) % 60

        self.minutes = minutes
        self.seconds = seconds

        if totalSeconds % (20 * 60) == 0 && totalSeconds <= 24 * 60 * 60 {
            announceBreak()
        }

        if totalSeconds >= 24 * 60 * 60 {
            pauseTimer()
        }
    }

    private func announceBreak() {
        let speechUtterance = AVSpeechUtterance(string: "Screen time break, look at something 20 feet away for 20 seconds.")
        speechSynthesizer.speak(speechUtterance)

        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            let blinkUtterance = AVSpeechUtterance(string: "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.")
            self.speechSynthesizer.speak(blinkUtterance)

            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                let breakDoneUtterance = AVSpeechUtterance(string: "Break time done. See you in 20 minutes.")
                self.speechSynthesizer.speak(breakDoneUtterance)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d", minutes, seconds)) // Changed time format to include hours
                    .font(.system(size: 99))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    // Check the remaining time before starting the background task
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < 30 {
                        // Less than 30 seconds remaining, end the task
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }
            }
        }
        .onReceive(timer ?? Timer.publish(every: 1, on: .main, in: .default).autoconnect()) { _ in
            if isTimerRunning {
                updateTime(totalSeconds: minutes * 60 + seconds + 1)
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTime(totalSeconds: minutes * 60 + seconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        let remainingSeconds = max(0, totalSeconds)
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = (remainingSeconds % 3600) % 60

        self.minutes = minutes
        self.seconds = seconds

        if totalSeconds % (20 * 60) == 0 && totalSeconds <= 24 * 60 * 60 {
            announceBreak()
        }

        if totalSeconds >= 24 * 60 * 60 {
            pauseTimer()
        }
    }

    private func announceBreak() {
        let speechUtterance = AVSpeechUtterance(string: "Screen time break, look at something 20 feet away for 20 seconds.")
        speechSynthesizer.speak(speechUtterance)

        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            let blinkUtterance = AVSpeechUtterance(string: "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.")
            self.speechSynthesizer.speak(blinkUtterance)

            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                let breakDoneUtterance = AVSpeechUtterance(string: "Break time done. See you in 20 minutes.")
                self.speechSynthesizer.speak(breakDoneUtterance)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/

/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier?

    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(String(format: "%02d:%02d", minutes, seconds)) // Changed time format to include hours
                    .font(.system(size: 99))
                    .padding()
                HStack {
                    Button(action: resetTimer) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(25.0)
                    }
                    .padding()

                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Pause" : "Start")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                    }
                    .padding()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIApplication.willResignActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    backgroundTaskID = UIApplication.shared.beginBackgroundTask {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                    }
                    // Check the remaining time before starting the background task
                    if backgroundTaskID != .invalid, UIApplication.shared.backgroundTimeRemaining < 30 {
                        // Less than 30 seconds remaining, end the task
                        UIApplication.shared.endBackgroundTask(backgroundTaskID!)
                        backgroundTaskID = .invalid
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIApplication.didBecomeActiveNotification,
                    object: nil,
                    queue: .main) { _ in
                    if let backgroundTaskID = backgroundTaskID {
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        self.backgroundTaskID = nil
                    }
                }
            }
        }
        .onReceive(timer ?? Timer.publish(every: 1, on: .main, in: .default).autoconnect()) { _ in
            if isTimerRunning {
                updateTime(totalSeconds: minutes * 60 + seconds + 1)
            }
        }
    }

    private func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTime(totalSeconds: minutes * 60 + seconds + 1)
        }
    }

    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }

    private func resetTimer() {
        isTimerRunning = false
        timer?.invalidate()
        minutes = 0
        seconds = 0
    }

    private func updateTime(totalSeconds: Int) {
        let remainingSeconds = max(0, totalSeconds)
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = (remainingSeconds % 3600) % 60

        self.minutes = minutes
        self.seconds = seconds

        if totalSeconds % (20 * 60) == 0 && totalSeconds <= 24 * 60 * 60 {
            announceBreak()
        }

        if totalSeconds >= 24 * 60 * 60 {
            pauseTimer()
        }
    }

    private func announceBreak() {
        let speechUtterance = AVSpeechUtterance(string: "Screen time break, look at something 20 feet away for 20 seconds.")
        speechSynthesizer.speak(speechUtterance)

        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            let blinkUtterance = AVSpeechUtterance(string: "Blink slowly once, Blink slowly twice, Blink slowly thrice, Blink slowly four times, Blink slowly five times, Blink slowly six times, Blink slowly seven times, Blink slowly eight times, Blink slowly nine times, Blink slowly ten times.")
            self.speechSynthesizer.speak(blinkUtterance)

            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                let breakDoneUtterance = AVSpeechUtterance(string: "Break time done. See you in 20 minutes.")
                self.speechSynthesizer.speak(breakDoneUtterance)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 */*/

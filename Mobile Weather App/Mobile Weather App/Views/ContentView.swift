//
//  ContentView.swift
//  Mobile Weather App
//
//  Modified by Michael Peek from code Created by Stewart Lynch on 2021-01-18.
//  Prior code was based on an older API and JSON file no longer available.
//  Additional features and information were added available from the newer API's.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    @StateObject  var forecastListVM = ForecastListViewModel()
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        Picker(selection: $forecastListVM.system, label: Text("System")) {
                            Text("°C").tag(0)
                            Text("°F").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 100)
                        .padding(.vertical)
                        Text("Select preferred units")}
                    HStack {
                        TextField("Enter Location", text: $forecastListVM.location,
                                  onCommit: {
                                    forecastListVM.getWeatherForecast()
                                  })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay (
                                Button(action: {
                                    forecastListVM.location = ""
                                    forecastListVM.getWeatherForecast()
                                }) {
                                    Image(systemName: "xmark.circle")
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal),
                                alignment: .trailing
                            )
                        Button {
                            forecastListVM.getWeatherForecast()
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.title3)
                        }
                    }
                    List(forecastListVM.forecasts, id: \.day) { day in
                            VStack(alignment: .leading) {
                                Text(day.day)
                                    .fontWeight(.bold)
                                    .padding(.horizontal)
                                HStack(alignment: .center) {
                                    WebImage(url: day.weatherIconURL)
                                        .resizable()
                                        .placeholder {
                                            Image(systemName: "magnifyingglass.circle.fill")
                                        }
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    VStack(alignment: .leading) {
                                        Text(day.overview)
                                            .font(.title2)
                                        HStack {
                                            Text(day.high)
                                            Text(day.low)
                                        }
                                        HStack {
                                            Text(day.clouds)
                                            Text(day.pop)
                                        }
                                        Text(day.humidity)
                                        Text(day.wind)
                                    }
                                } .background(Color.accentColor)
                            } .background(Color.orange)
                            .cornerRadius(10)
                            .frame(minWidth: 400)
                        }
                        .listStyle(PlainListStyle())
                }
                .padding(.horizontal)
                .frame(minWidth: 400, maxHeight: 600)
                .navigationTitle("Peek Weather App")
                .alert(item: $forecastListVM.appError) { appAlert in
                    Alert(title: Text("Error"),
                          message: Text("""
                            \(appAlert.errorString)
                            Please try again later!
                            """
                            )
                    
                    )
                }
            }
            if forecastListVM.isLoading {
                ZStack {
                    Color(.white)
                        .opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView("Fetching Weather")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground))
                        )
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

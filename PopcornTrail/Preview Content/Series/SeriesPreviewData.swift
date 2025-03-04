//
//  SeriesPreviewData.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

extension Serie {
	/// Datos de prueba para usar en previews
	static let sampleSeries: [Serie] = [
		Serie(
			id: 1396,
			name: "Breaking Bad",
			originalName: "Breaking Bad",
			overview: "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
			posterPath: "/ineLOBPG8AZsluYwnkMpHRyu7L.jpg",
			backdropPath: "/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg",
			firstAirDate: "2008-01-20",
			genreIDs: [18, 80],
			originalLanguage: "en",
			popularity: 658.027,
			voteAverage: 8.924,
			voteCount: 15130,
			originCountry: ["US"]
		),
		Serie(
			id: 131378,
			name: "Adventure Time: Fionna & Cake",
			originalName: "Adventure Time: Fionna & Cake",
			overview: "Fionna and Cake – with the help of the former Ice King, Simon Petrikov - embark on a multiverse-hopping adventure and journey of self-discovery. All the while a powerful new antagonist determined to track them down and erase them from existence, lurks in the shadows.",
			posterPath: "/fi1b6U1kp73xheECzqwzMn8u3mX.jpg",
			backdropPath: "/7BzmK4MWc0cj4hCxwWURt6TS6UR.jpg",
			firstAirDate: "2023-08-31",
			genreIDs: [16, 10765, 10759, 35],
			originalLanguage: "en",
			popularity: 53.227,
			voteAverage: 8.9,
			voteCount: 208,
			originCountry: ["US"]
		),
		Serie(
			id: 94605,
			name: "Arcane",
			originalName: "Arcane",
			overview: "Amid the stark discord of twin cities Piltover and Zaun, two sisters fight on rival sides of a war between magic technologies and clashing convictions.",
			posterPath: "/fqldf2t8ztc9aiwn3k6mlX3tvRT.jpg",
			backdropPath: "/wQEW3xLrQAThu1GvqpsKQyejrYS.jpg",
			firstAirDate: "2021-11-06",
			genreIDs: [16, 10765, 18, 10759],
			originalLanguage: "en",
			popularity: 191.815,
			voteAverage: 8.78,
			voteCount: 4933,
			originCountry: ["US"]
		),
		Serie(
			id: 209867,
			name: "Frieren: Beyond Journey's End",
			originalName: "葬送のフリーレン",
			overview: "After the party of heroes defeated the Demon King, they restored peace to the land and returned to lives of solitude. Generations pass, and the elven mage Frieren comes face to face with humanity’s mortality. She takes on a new apprentice and promises to fulfill old friends’ dying wishes. Can an elven mind make peace with the nature of life and death? Frieren embarks on her quest to find out.",
			posterPath: "/dqZENchTd7lp5zht7BdlqM7RBhD.jpg",
			backdropPath: "/96RT2A47UdzWlUfvIERFyBsLhL2.jpg",
			firstAirDate: "2023-09-29",
			genreIDs: [16, 10759, 10765, 18],
			originalLanguage: "ja",
			popularity: 129.509,
			voteAverage: 8.776,
			voteCount: 390,
			originCountry: ["JP"]
		),
		Serie(
			id: 94954,
			name: "Hazbin Hotel",
			originalName: "Hazbin Hotel",
			overview: "In attempt to find a non-violent alternative for reducing Hell's overpopulation, the daughter of Lucifer opens a rehabilitation hotel that offers a group of misfit demons a chance at redemption.",
			posterPath: "/rXojaQcxVUubPLSrFV8PD4xdjrs.jpg",
			backdropPath: "/tuCU2yVRM2iZxFkpqlPUyvd6tSu.jpg",
			firstAirDate: "2024-01-18",
			genreIDs: [16, 35, 10765],
			originalLanguage: "en",
			popularity: 108.122,
			voteAverage: 8.8,
			voteCount: 1229,
			originCountry: ["US"]
		),
		Serie(
			id: 60059,
			name: "Better Call Saul",
			originalName: "Better Call Saul",
			overview: "Six years before Saul Goodman meets Walter White. We meet him when the man who will become Saul Goodman is known as Jimmy McGill, a small-time lawyer searching for his destiny, and, more immediately, hustling to make ends meet. Working alongside, and, often, against Jimmy, is “fixer” Mike Ehrmantraut. The series tracks Jimmy’s transformation into Saul Goodman, the man who puts “criminal” in “criminal lawyer\".",
			posterPath: "/zjg4jpK1Wp2kiRvtt5ND0kznako.jpg",
			backdropPath: "/t15KHp3iNfHVQBNIaqUGW12xQA4.jpg",
			firstAirDate: "2015-02-08",
			genreIDs: [80, 18],
			originalLanguage: "en",
			popularity: 286.518,
			voteAverage: 8.69,
			voteCount: 5476,
			originCountry: ["US"]
		)
	]
	
	/// URL de ejemplo para probar la carga de pósters en la preview.
	static let posterURL = URL(string: "https://image.tmdb.org/t/p/w500/ineLOBPG8AZsluYwnkMpHRyu7L.jpg")
}

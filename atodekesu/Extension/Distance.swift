import Foundation

func haversineDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let radius = 6371000.0 // 地球の半径（メートル）

    // 緯度・経度をラジアンに変換
    let dLat = (lat2 - lat1) * .pi / 180
    let dLon = (lon2 - lon1) * .pi / 180
    let radLat1 = lat1 * .pi / 180
    let radLat2 = lat2 * .pi / 180

    // ハーバサインの公式の計算
    let a = sin(dLat / 2) * sin(dLat / 2) + cos(radLat1) * cos(radLat2) * sin(dLon / 2) * sin(dLon / 2)
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    let distance = radius * c

    return distance
}

module GeoDistance
    def distance(lat1, lon1, lat2, lon2, unit)
        if (lat1 == lat2) && (lon1 == lon2)
            return 0
        else
            theta = lon1 - lon2
            dist = Math.sin(lat1 * Math::PI / 180) * Math.sin(lat2 * Math::PI / 180) + Math.cos(lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180) * Math.cos(theta * Math::PI / 180)
            dist = Math.acos(dist)
            dist = dist * 180 / Math::PI
            miles = dist * 60 * 1.1515
            unit = unit.upcase
        
            if unit == 'K'
            return miles * 1.609344
            elsif unit == 'N'
            return miles * 0.8684
            else
            return miles
            end
        end
    end
end

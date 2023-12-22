
require 'rspec'
require_relative 'challenge'

describe 'Challenge' do
  let(:two_photos_same_city) do 
    "photo.jpg, Krakow, 2013-09-05 14:08:15\nmyFriends.png, Krakow, 2013-09-05 14:07:13"
  end

  let(:two_photos_same_city_same_time) do 
    "photo.jpg, Krakow, 2013-09-05 14:08:15\nmyFriends.png, Krakow, 2013-09-05 14:08:15"
  end

  let(:full_example) do
    "photo.jpg, Krakow, 2013-09-05 14:08:15\nMike.png, London, 2015-06-20 15:13:22\nmyFriends.png, Krakow, 2013-09-05 14:07:13\nEiffel.jpg, Florianopolis, 2015-07-23 08:03:02\npisatower.jpg, Florianopolis, 2015-07-22 23:59:59\nBOB.jpg, London, 2015-08-05 00:02:03\nnotredame.png, Florianopolis, 2015-09-01 12:00:00\nme.jpg, Krakow, 2013-09-06 15:40:22\na.png, Krakow, 2016-02-13 13:33:50\nb.jpg, Krakow, 2016-01-02 15:12:22\nc.jpg, Krakow, 2016-01-02 14:34:30\nd.jpg, Krakow, 2016-01-02 15:15:01\ne.png, Krakow, 2016-01-02 09:49:09\nf.png, Krakow, 2016-01-02 10:55:32\ng.jpg, Krakow, 2016-02-29 22:13:11"
  end

  it 'organizes two photos in the same city' do
    expect(solution(two_photos_same_city)).to eq("Krakow2.jpg\nKrakow1.png")
  end

  it 'returns the correct result for the example input' do
    expect(solution(full_example)).to eq(
        "Krakow02.jpg\nLondon1.png\nKrakow01.png\nFlorianopolis2.jpg\nFlorianopolis1.jpg\nLondon2.jpg\nFlorianopolis3.png\nKrakow03.jpg\nKrakow09.png\nKrakow07.jpg\nKrakow06.jpg\nKrakow08.jpg\nKrakow04.png\nKrakow05.png\nKrakow10.jpg"
    )
  end

  it 'fails when receiving gibberish' do
    expect{ solution('this is gibberish') }.to raise_error(Gallery::InvalidInputError)
  end

  it 'expects 1 to 100 photos' do
    expect{ solution('') }.to raise_error(Gallery::OutOfRangeError)
    expect{ solution(nil) }.to raise_error(Gallery::OutOfRangeError)
    expect{ solution(
      "a.jpg, Rio, 2020-01-01 00:00:01\na.jpg, Rio, 2020-01-02 00:00:01\na.jpg, Rio, 2020-01-03 00:00:01\na.jpg, Rio, 2020-01-04 00:00:01\na.jpg, Rio, 2020-01-05 00:00:01\na.jpg, Rio, 2020-01-06 00:00:01\na.jpg, Rio, 2020-01-07 00:00:01\na.jpg, Rio, 2020-01-08 00:00:01\na.jpg, Rio, 2020-01-09 00:00:01\na.jpg, Rio, 2020-01-10 00:00:01\na.jpg, Rio, 2020-01-11 00:00:01\na.jpg, Rio, 2020-01-12 00:00:01\na.jpg, Rio, 2020-01-13 00:00:01\na.jpg, Rio, 2020-01-14 00:00:01\na.jpg, Rio, 2020-01-15 00:00:01\na.jpg, Rio, 2020-01-16 00:00:01\na.jpg, Rio, 2020-01-17 00:00:01\na.jpg, Rio, 2020-01-18 00:00:01\na.jpg, Rio, 2020-01-19 00:00:01\na.jpg, Rio, 2020-01-20 00:00:01\na.jpg, Rio, 2020-01-21 00:00:01\na.jpg, Rio, 2020-01-22 00:00:01\na.jpg, Rio, 2020-01-23 00:00:01\na.jpg, Rio, 2020-01-24 00:00:01\na.jpg, Rio, 2020-01-25 00:00:01\na.jpg, Rio, 2020-01-26 00:00:01\na.jpg, Rio, 2020-01-27 00:00:01\na.jpg, Rio, 2020-01-28 00:00:01\na.jpg, Rio, 2020-01-29 00:00:01\na.jpg, Rio, 2020-01-30 00:00:01\na.jpg, Rio, 2020-01-31 00:00:01\na.jpg, Rio, 2020-02-01 00:00:01\na.jpg, Rio, 2020-02-02 00:00:01\na.jpg, Rio, 2020-02-03 00:00:01\na.jpg, Rio, 2020-02-04 00:00:01\na.jpg, Rio, 2020-02-05 00:00:01\na.jpg, Rio, 2020-02-06 00:00:01\na.jpg, Rio, 2020-02-07 00:00:01\na.jpg, Rio, 2020-02-08 00:00:01\na.jpg, Rio, 2020-02-09 00:00:01\na.jpg, Rio, 2020-02-10 00:00:01\na.jpg, Rio, 2020-02-11 00:00:01\na.jpg, Rio, 2020-02-12 00:00:01\na.jpg, Rio, 2020-02-13 00:00:01\na.jpg, Rio, 2020-02-14 00:00:01\na.jpg, Rio, 2020-02-15 00:00:01\na.jpg, Rio, 2020-02-16 00:00:01\na.jpg, Rio, 2020-02-17 00:00:01\na.jpg, Rio, 2020-02-18 00:00:01\na.jpg, Rio, 2020-02-19 00:00:01\na.jpg, Rio, 2020-02-20 00:00:01\na.jpg, Rio, 2020-02-21 00:00:01\na.jpg, Rio, 2020-02-22 00:00:01\na.jpg, Rio, 2020-02-23 00:00:01\na.jpg, Rio, 2020-02-24 00:00:01\na.jpg, Rio, 2020-02-25 00:00:01\na.jpg, Rio, 2020-02-26 00:00:01\na.jpg, Rio, 2020-02-27 00:00:01\na.jpg, Rio, 2020-02-28 00:00:01\na.jpg, Rio, 2020-02-29 00:00:01\na.jpg, Rio, 2020-03-01 00:00:01\na.jpg, Rio, 2020-03-02 00:00:01\na.jpg, Rio, 2020-03-03 00:00:01\na.jpg, Rio, 2020-03-04 00:00:01\na.jpg, Rio, 2020-03-05 00:00:01\na.jpg, Rio, 2020-03-06 00:00:01\na.jpg, Rio, 2020-03-07 00:00:01\na.jpg, Rio, 2020-03-08 00:00:01\na.jpg, Rio, 2020-03-09 00:00:01\na.jpg, Rio, 2020-03-10 00:00:01\na.jpg, Rio, 2020-03-11 00:00:01\na.jpg, Rio, 2020-03-12 00:00:01\na.jpg, Rio, 2020-03-13 00:00:01\na.jpg, Rio, 2020-03-14 00:00:01\na.jpg, Rio, 2020-03-15 00:00:01\na.jpg, Rio, 2020-03-16 00:00:01\na.jpg, Rio, 2020-03-17 00:00:01\na.jpg, Rio, 2020-03-18 00:00:01\na.jpg, Rio, 2020-03-19 00:00:01\na.jpg, Rio, 2020-03-20 00:00:01\na.jpg, Rio, 2020-03-21 00:00:01\na.jpg, Rio, 2020-03-22 00:00:01\na.jpg, Rio, 2020-03-23 00:00:01\na.jpg, Rio, 2020-03-24 00:00:01\na.jpg, Rio, 2020-03-25 00:00:01\na.jpg, Rio, 2020-03-26 00:00:01\na.jpg, Rio, 2020-03-27 00:00:01\na.jpg, Rio, 2020-03-28 00:00:01\na.jpg, Rio, 2020-03-29 00:00:01\na.jpg, Rio, 2020-03-30 00:00:01\na.jpg, Rio, 2020-03-31 00:00:01\na.jpg, Rio, 2020-04-01 00:00:01\na.jpg, Rio, 2020-04-02 00:00:01\na.jpg, Rio, 2020-04-03 00:00:01\na.jpg, Rio, 2020-04-04 00:00:01\na.jpg, Rio, 2020-04-05 00:00:01\na.jpg, Rio, 2020-04-06 00:00:01\na.jpg, Rio, 2020-04-07 00:00:01\na.jpg, Rio, 2020-04-08 00:00:01\na.jpg, Rio, 2020-04-09 00:00:01\na.jpg, Rio, 2020-04-10 00:00:01"
    ) }.to raise_error(Gallery::OutOfRangeError)
  end

  it 'fails for photos without name' do
    expect{ solution(", Krakow, 2013-09-05 14:08:15") }.to raise_error(Gallery::InvalidInputError)
  end

  it 'fails for photos with long names' do
    expect{ solution("veryveryveryverylongphotoname.jpeg, Krakow, 2013-09-05 14:08:15") }.to raise_error(Gallery::InvalidInputError)
  end

  it "doesn't count the extension in photo name length" do
    expect(solution("abcdefghijklmnop.jpeg, Krakow, 2013-09-05 14:08:15")).to eq("Krakow1.jpeg")
  end

  it 'fails for empty city names' do
    expect{ solution("a.jpg, , 2013-09-05 14:08:15") }.to raise_error(Gallery::InvalidInputError)
  end

  it 'fails for long city names' do
    expect{ solution("a.jpeg, VeryveryveryverylongCityName, 2013-09-05 14:08:15") }.to raise_error(Gallery::InvalidInputError)
  end

  it 'fails for city names not starting with capital letters' do
    expect{ solution("a.jpeg, cityName, 2013-09-05 14:08:15") }.to raise_error(Gallery::InvalidInputError)
  end

  it 'fails for extensions other than jpg, jpeg and png' do
    expect{ solution("a.psd, cityName, 2013-09-05 14:08:15") }.to raise_error(Gallery::InvalidInputError)
  end

  it 'fails when two photos in the same city have the same timestamp' do
    expect{ solution(two_photos_same_city_same_time) }.to raise_error(Gallery::BrokenSpaceTimeError)
  end
end

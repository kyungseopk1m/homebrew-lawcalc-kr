cask "lawcalc-kr" do
  version "0.10.0"
  sha256 "9e5dfb1579702d4188192d60d191180b539f0f701d498a80ed1467e3672e5416"

  url "https://github.com/kyungseopk1m/lawcalc-kr/releases/download/v#{version}/LawCalc.Korea_#{version}_universal.dmg"
  name "LawCalc Korea"
  desc "한국 법률 실무 계산 워크벤치 (이자·상속·소송비용·변제충당·손해배상)"
  homepage "https://github.com/kyungseopk1m/lawcalc-kr"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "LawCalc Korea.app"

  zap trash: [
    "~/Library/Application Support/com.lawcalc.kr.desktop",
    "~/Library/Caches/com.lawcalc.kr.desktop",
    "~/Library/Preferences/com.lawcalc.kr.desktop.plist",
    "~/Library/Saved Application State/com.lawcalc.kr.desktop.savedState",
    "~/Library/WebKit/com.lawcalc.kr.desktop",
  ]

  caveats <<~EOS
    v#{version}은 Apple notarization을 아직 진행하지 않았습니다.
    처음 실행할 때 Gatekeeper 경고가 표시되면
    시스템 설정 → 개인정보 보호 및 보안에서 "확인 없이 열기"를 눌러 실행을 허용하세요.
  EOS
end

Movie Info App 🎬

Flutter 기반의 영화 정보 앱입니다.
인기 영화, 평점, 상세 정보를 확인할 수 있으며, 영화 목록을 탐색하고 클릭하면 상세 페이지로 부드러운 애니메이션과 함께 이동할 수 있습니다.

주요 기능
	•	🏆 인기 영화: 가로 스크롤로 인기 영화 목록과 랭킹 숫자 표시
	•	🎥 현재 상영중: 현재 극장에서 상영 중인 영화 목록
	•	⭐ 평점 높은 영화: 높은 평점을 가진 영화 목록
	•	📅 개봉 예정 영화: 다가오는 영화 개봉 정보
	•	💨 Hero 애니메이션: 영화 클릭 시 부드러운 화면 전환
	•	🖼️ 반응형 UI: 둥근 모서리 카드, 그라디언트 오버레이, 다양한 화면 크기 대응

폴더 구조

lib
├── detail
│   ├── detail_page.dart
│   └── detail_theme.dart
├── home
│   └── home_page.dart
├── main.dart
└── ui
    ├── detail
    │   └── widgets
    │       ├── genre_chips.dart
    │       ├── movie_header.dart
    │       ├── overview_section.dart
    │       ├── poster_card.dart
    │       ├── stats_section.dart
    │       └── studios_section.dart
    └── home
        └── widgets
            ├── movie_card.dart
            └── movie_section.dart

실행 방법
	1.	저장소 클론:

git clone https://github.com/kk20192073/Movie_Info_App.git

	2.	프로젝트 폴더로 이동:

cd Movie_Info_App

	3.	의존성 설치:

flutter pub get

	4.	앱 실행:

flutter run

참고 사항
	•	앱은 Hero 위젯을 사용하여 화면 전환 애니메이션을 구현했습니다.
각 Hero는 **고유한 태그(tag)**를 가져야 런타임 오류가 발생하지 않습니다.
	•	네트워크 이미지로 https://picsum.photos를 사용하고 있습니다.
인터넷 연결이 필요합니다.

라이선스

MIT License

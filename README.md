# ERD

erDiagram
    User ||--o{ Challenge : creates
    User ||--o{ Solution : submits
    User ||--o{ Comment : writes
    User ||--o{ Vote : casts
    
    Challenge ||--o{ Solution : has
    Challenge ||--o{ ChallengeTag : has
    ChallengeTag }o--|| Tag : belongs_to
    
    Solution ||--o{ Comment : receives
    Solution ||--o{ Vote : receives

    User {
        integer id PK
        string email
        string encrypted_password
        string reset_password_token
        datetime reset_password_sent_at
        datetime remember_created_at
        datetime created_at
        datetime updated_at
    }

    Challenge {
        integer id PK
        string title
        text description
        string difficulty_level
        integer user_id FK
        datetime created_at
        datetime updated_at
    }

    Solution {
        integer id PK
        text code
        text explanation
        integer user_id FK
        integer challenge_id FK
        datetime created_at
        datetime updated_at
    }

    Comment {
        integer id PK
        text content
        integer user_id FK
        integer solution_id FK
        datetime created_at
        datetime updated_at
    }

    Vote {
        integer id PK
        integer value
        integer user_id FK
        integer solution_id FK
        datetime created_at
        datetime updated_at
    }

    Tag {
        integer id PK
        string name
        datetime created_at
        datetime updated_at
    }

    ChallengeTag {
        integer id PK
        integer challenge_id FK
        integer tag_id FK
        datetime created_at
        datetime updated_at
    }

    JwtBlacklist {
        integer id PK
        string jti
        datetime exp
        datetime created_at
        datetime updated_at
    }

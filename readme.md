Private repo x GitHub Packages の Gem サンプル
===

# 手順

https://docs.github.com/ja/packages/working-with-a-github-packages-registry
を参考に記載

## 前準備

**各設定値**

変数 | 値
--- | ---
`${GITHUB_TOKEN}` | 個人アクセス用のトークン
`${ORGNIZATION}` | Orgnization 名
`${USER_NAME}` | GitHub アカウント名
`${REPO}` | リポジトリ名

```ruby
# hello.gemspec
Gem::Specification.new do |s|
  s.metadata = { "github_repo" => "ssh://github.com/${ORGNIZATION}" }

  # レポジトリに紐付けたい場合
  # s.metadata = { "github_repo" => "ssh://github.com/${ORGNIZATION}/${REPO}" }
end
```

```bash
# ~/.gem/credentials
---
:github: Bearer ${GITHUB_TOKEN}

# ~/.gemrc
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- https://rubygems.org/
- https://${USER_NAME}:${GITHUB_TOKEN}@rubygems.pkg.github.com/${ORGNIZATION}/
:update_sources: true
:verbose: true  
```

## Gem(GitHub Packages) の build / push

```bash
# build
gem build private-repo-github-package-for-gem.gemspec
# output: private-repo-github-package-for-gem-0.0.0.gem

# push
gem push --key github --host https://rubygems.pkg.github.com/zakizaki-ri9 private-repo-github-package-for-gem-0.0.0.gem
```

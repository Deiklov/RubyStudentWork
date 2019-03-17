require "rails_helper"

describe Article, User do
  it "create article with sort name" do
    beforeqount=Article.count
    Article.create(title: "test title", body: "test text ")
    expect(Article.count).to eq(beforeqount)
  end

  it "create real article and find it" do
    Article.create(title: "test title", body: "testtesttesttesttesttesttesttesttesttesttesttesttesttest")
    expect(Article.find_by(title: "test title", body: "testtesttesttesttesttesttesttesttesttesttesttesttesttest")).to be_present
  end

  it "destroy article and not find it" do
    Article.create(title: "test title", body: "testtesttesttesttesttesttesttesttesttesttesttesttesttest")
    Article.find_by(title: "test title").destroy
    expect(Article.find_by(title: "test title")).not_to be_present
  end
end

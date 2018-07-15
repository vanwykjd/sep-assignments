include RSpec

require_relative 'graph'

RSpec.describe BaconGraph, type: Class do
  let (:graph) { BaconGraph.new }
  let (:kevin) { Node.new("Kevin Bacon") }

  
  let (:elvis) { Node.new("Elvis Presley") }
  let (:judy_tyler) { Node.new("Judy Tyler") }
  let (:bob_troup) { Node.new("Bobby Troup") }
  let (:asner) { Node.new("Edward Asner") }
  let (:mckellen) { Node.new("Ian McKellen") }
  let (:fassbender) { Node.new("Michael Fassbender") }
  let (:mcavoy) { Node.new("James McAvoy") }
  let (:jane_doe) { Node.new("Jane Doe") }
  let (:ricky_rick) { Node.new("Ricky Rick") }
  let (:bob_bobby) { Node.new("Bob Bobby") }

  describe "Node#add_film(data)" do
    it "properly adds a new hash key and assigns data as key to a new array" do
      kevin.add_film("JFK")
      kevin.add_film("X-Men: First Class")
      expect(kevin.film_actor_hash["JFK"]).to eq []
      expect(kevin.film_actor_hash["X-Men: First Class"]).to eq []
      expect(kevin.film_actor_hash.length).to eq 2
    end
    
    it "properly adds a new hash key and assigns data as key to a new array" do
      elvis.add_film("Change of Habit")
      elvis.add_film("Jailhouse Rock")
      expect(elvis.film_actor_hash["Change of Habit"]).to eq []
      expect(elvis.film_actor_hash["Jailhouse Rock"]).to eq []
      expect(elvis.film_actor_hash.length).to eq 2
    end
    
    it "properly avoids adding duplicate hash keys" do
      elvis.add_film("Change of Habit")
      elvis.add_film("Jailhouse Rock")
      elvis.add_film("Jailhouse Rock")
      expect(elvis.film_actor_hash.length).to eq 2
    end
  end
  
  describe "#add_actor(data)" do
    it "properly adds a new node to the graph's list of nodes" do
      graph.add_actor(kevin)
      graph.add_actor(elvis)
      expect(graph.actor_list.length).to eq 2
    end
    
    it "properly avoids adding duplicate nodes" do
      graph.add_actor(kevin)
      graph.add_actor(elvis)
      graph.add_actor(kevin)
      graph.add_actor(elvis)
      graph.add_actor(judy_tyler)
      graph.add_actor(bob_troup)
      expect(graph.actor_list.length).to eq 4
    end
  end
  
  describe "#add_related_cast(data)" do
    it "properly finds nodes with same hash keys and properly assigns nodes as values to associated keys" do
      kevin.add_film("JFK")
      elvis.add_film("JFK")
      elvis.add_film("Change of Habit")
      asner.add_film("Change of Habit")
      graph.add_actor(kevin)
      graph.add_actor(elvis)
      graph.add_actor(asner)
      expect(elvis.film_actor_hash["JFK"]).to eq [kevin]
      expect(kevin.film_actor_hash["JFK"]).to eq [elvis]
      expect(elvis.film_actor_hash["Change of Habit"]).to eq [asner]
      expect(asner.film_actor_hash["Change of Habit"]).to eq [elvis]
    end
  end
  
  describe "#set_degree_of_bacon" do
    it "properly assigns nodes the degree of relation to Kevin Bacon" do
      kevin.add_film("JFK")
      asner.add_film("JFK")
      asner.add_film("Change of Habit")
      elvis.add_film("Change of Habit")
      graph.add_actor(kevin)
      graph.add_actor(elvis)
      graph.add_actor(asner)
      graph.set_degree_of_bacon
      expect(kevin.degree_to_bacon).to eq 0
      expect(asner.degree_to_bacon).to eq 1
      expect(elvis.degree_to_bacon).to eq 2
    end
  end
  
  describe "#find_kevin_bacon(data)" do
    specify {
      expected_output = "Elvis Presley was in 'CHANGE OF HABIT' with Edward Asner\nEdward Asner was in 'JFK' with Kevin Bacon\nDegree to Bacon: 2\n"
      kevin.add_film("JFK")
      asner.add_film("JFK")
      asner.add_film("Change of Habit")
      elvis.add_film("Change of Habit")
      graph.add_actor(kevin)
      graph.add_actor(asner)
      graph.add_actor(elvis)
      expect { graph.find_kevin_bacon(elvis) }.to output(expected_output).to_stdout
    }
    
    specify {
      expected_output = "Bobby Troup was in 'BOP GIRL GOES CALYPSO' with Judy Tyler\nJudy Tyler was in 'JAILHOUSE ROCK' with Elvis Presley\nElvis Presley was in 'CHANGE OF HABIT' with Edward Asner\nEdward Asner was in 'JFK' with Kevin Bacon\nDegree to Bacon: 4\n"
      kevin.add_film("JFK")
      elvis.add_film("Change of Habit")
      elvis.add_film("Jailhouse Rock")
      judy_tyler.add_film("Jailhouse Rock")
      judy_tyler.add_film("Bop Girl Goes Calypso")
      bob_troup.add_film("Bop Girl Goes Calypso")
      asner.add_film("Change of Habit")
      asner.add_film("JFK")
      graph.add_actor(kevin)
      graph.add_actor(elvis)
      graph.add_actor(judy_tyler)
      graph.add_actor(bob_troup)
      graph.add_actor(asner)
      expect { graph.find_kevin_bacon(bob_troup) }.to output(expected_output).to_stdout
    }
    
    specify {
      expected_output = "Ian McKellen was in 'X-MEN: DAYS OF FUTURE PAST' with Michael Fassbender\nMichael Fassbender was in 'X-MEN: FIRST CLASS' with Kevin Bacon\nDegree to Bacon: 2\n"
      kevin.add_film("X-Men: First Class")
      mckellen.add_film("X-Men: Days of Future Past")
      fassbender.add_film("X-Men: Days of Future Past")
      fassbender.add_film("X-Men: First Class")
      mcavoy.add_film("X-Men: Days of Future Past")
      mcavoy.add_film("X-Men: First Class")
      graph.add_actor(kevin)
      graph.add_actor(mckellen)
      graph.add_actor(fassbender)
      graph.add_actor(mcavoy)
      expect { graph.find_kevin_bacon(mckellen) }.to output(expected_output).to_stdout
    }
  end
  
end
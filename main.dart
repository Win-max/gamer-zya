import 'package:flutter/material.dart';

void main() => runApp(const GamerHub());

class GamerHub extends StatelessWidget {
  const GamerHub({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamer Hub',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF090B12),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int tab = 0;
  final games = const [
    ['MLBB','Mobile Legends: Bang Bang','🎮'],
    ['Roblox','Games, tips & settings','🟥'],
    ['Standoff 2','FPS settings & sensitivity','🔫'],
    ['PUBG Mobile','Graphics & FPS guide','🪖'],
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      _home(),
      const Center(child: Text('🎮 Games', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
      const Center(child: Text('👥 Community', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
      const Center(child: Text('👤 Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('GAMER HUB', style: TextStyle(fontWeight: FontWeight.w900))),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i)=>setState(()=>tab=i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label:'Home'),
          NavigationDestination(icon: Icon(Icons.sports_esports_outlined), selectedIcon: Icon(Icons.sports_esports), label:'Games'),
          NavigationDestination(icon: Icon(Icons.people_outline), selectedIcon: Icon(Icons.people), label:'Community'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label:'Profile'),
        ],
      ),
    );
  }

  Widget _home() => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(colors:[Color(0xFF5B21B6),Color(0xFF2563EB)]),
        ),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text('LEVEL UP YOUR GAME', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900)),
          SizedBox(height:8), Text('Settings • FPS • Tips • Community'),
        ]),
      ),
      const SizedBox(height:22),
      const Text('Popular Games', style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
      const SizedBox(height:12),
      ...games.map((g)=>Card(
        child: ListTile(
          leading: CircleAvatar(child: Text(g[2],style:const TextStyle(fontSize:20))),
          title: Text(g[0],style:const TextStyle(fontWeight:FontWeight.bold)),
          subtitle: Text(g[1]),
          trailing: const Icon(Icons.chevron_right),
          onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>GamePage(name:g[0]))),
        ),
      )),
      const SizedBox(height:10),
      const Text('Quick Tools', style: TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
      Wrap(spacing:8, runSpacing:8, children:[
        _chip('⚡ FPS Guide'), _chip('🎯 Sensitivity'), _chip('📱 Phone Setup'), _chip('💾 Saved'),
      ]),
    ]),
  );

  Widget _chip(String t)=>ActionChip(label:Text(t), onPressed:(){});
}

class GamePage extends StatelessWidget {
  final String name;
  const GamePage({super.key, required this.name});
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title:Text(name)),
    body: ListView(padding:const EdgeInsets.all(16), children:[
      Text('$name Settings',style:const TextStyle(fontSize:28,fontWeight:FontWeight.w900)),
      const SizedBox(height:18),
      _item('🎯','Sensitivity','Recommended sensitivity settings'),
      _item('⚡','FPS & Graphics','Smooth gameplay configuration'),
      _item('🎮','Controls','HUD and control tips'),
      _item('💡','Tips','Useful gameplay tricks'),
    ]),
  );
  Widget _item(String icon,String title,String sub)=>Card(
    child:ListTile(
      leading:Text(icon,style:const TextStyle(fontSize:28)),
      title:Text(title,style:const TextStyle(fontWeight:FontWeight.bold)),
      subtitle:Text(sub),
      trailing:const Icon(Icons.chevron_right),
    ),
  );
}

#include "../header/collision.h"
#include "../header/util.h"
#include "../header/player.h"
#include "../header/bullet.h"
#include <iostream>
#include <Box2D/Box2D.h>
#include <typeinfo>

MyContactListener::MyContactListener(){}

void MyContactListener::BeginContact(b2Contact* contact){

  b2Fixture* f1 = contact->GetFixtureA();
  b2Fixture* f2 = contact->GetFixtureB();

  b2Body* b1 = f1->GetBody();
  b2Body* b2 = f2->GetBody();

  void* o1 = b1->GetUserData();
  void* o2 = b2->GetUserData();

  Colider* c1;
  Colider* c2;

  if(o1 && o2){
    c1 = static_cast<Colider*>(o1);
    c2 = static_cast<Colider*>(o2);

    if(c1->getClassID() == PLAYER && c2->getClassID() == BULLET){
      int dmg = static_cast<Bullet*>(c2)->m_dmg;
      static_cast<Player*>(c1)->takeDmg(dmg);
    }

    if(c2->getClassID() == PLAYER && c1->getClassID() == BULLET){
      int dmg = static_cast<Bullet*>(c1)->m_dmg;
      static_cast<Player*>(c2)->takeDmg(dmg);
    }

    //DEBUGGING collision detection
    std::cout<< c1->getClassID() << " :: " << c2->getClassID() << std::endl;

  }



}
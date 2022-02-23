import oscP5.*;
import netP5.*;
import mqtt.*;

MQTTClient client;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  client = new MQTTClient(this);
  client.connect("mqtt://datt3700:datt3700experiments@datt3700.cloud.shiftr.io", "Lynx");
  //client.subscribe("piano");
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}
void draw(){
}
int fireFlag=-1;
int count=0;
void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  String addr=theOscMessage.addrPattern();
  print(addr);
  if(addr.contains("/0")) {
    count++;
    if(count==2){
      fireFlag=0;
      println(fireFlag);
      count=0;
    }
  }else if(addr.contains("/1")) {
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "1");
    }
  }else if(addr.contains("/2")) {
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "2");
    }
  }else if(addr.contains("/3")) {
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "3");
    }
  }else if(addr.contains("/4")) {
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "4");
    }
  }else if(addr.contains("/5")) { 
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "5");
    }
  }else if(addr.contains("/6")) {
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "6");
    }
  }else if(addr.contains("/7")) {
    count++;
    if(count==2){
      count=0;
      client.publish("piano", "7");
    }
  }
}
void messageReceived(String topic, byte[] payload) {
  println( topic + ": " + new String(payload));
}

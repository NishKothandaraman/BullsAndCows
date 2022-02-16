open(DATA1,"<Webpage.txt");
open(DATA2,">Dictionary.txt");

while(<DATA1>)
 { my $wordCount = 0;
   while($_=~m/(href="\/word\/(\w+)\/">\w+<\/a>)/)
     {
      my $count = 0;
      my $word = $2;
      my $write_word = $word;
      #$_=~s/$word//g;
      $_=~s/href="\/word\/$word\/">$word<\/a>//g;
      $word=~m/(\w)(\w)(\w)(\w)(\w)/;
      my $first_word = $1;
      my $second_word = $2; 
      my $third_word = $3;
      my $fourth_word = $4;
      my $fifth_word = $5;
      if($word=~s/$first_word//)
        {
	        $count++;
        }
      if($word=~s/$second_word//)
        {
	        $count++;
        }
      if($word=~s/$third_word//)
        {
          $count++;
        }
      if($word=~s/$fourth_word//)
        {
          $count++;
        }
      if($word=~s/$fifth_word//)
        {
          $count++;
        }
      if($count == 5)
        {
          print DATA2 $write_word;
          print DATA2 "\n";
        }
     }
 }

close DATA1;
close DATA2;


#This is the Part where the Frequency of alphapbets are calculated

open(DATA1,"<Dictionary.txt");
open(DATA2,">Frequency_one.txt");
open(DATA3,">Frequency_two.txt");
open(DATA4,">Frequency_three.txt");
open(DATA5,">Frequency_four.txt");
open(DATA6,">Frequency_five.txt");

my @alphabet_list = ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
my %frequency_hash_first = {}; #Stores frequency of alphabets when they occur as the first character
my %frequency_hash_second = {}; #Stores frequency of alphabets when they occur as the second character
my %frequency_hash_third = {}; #Stores frequency of alphabets when they occur as the third character
my %frequency_hash_fourth = {}; #Stores frequency of alphabets when they occur as the fourth character
my %frequency_hash_fifth = {}; #Stores frequency of alphabets when they occur as the fifth character
my $line; #To get the individual lines

#To get First Alphabet
while(<DATA1>)
 {
   $line = $_;
   foreach $alpha (@alphabet_list)
     {
       if($line=~m/^$alpha\w\w\w\w/)
        {
          $frequency_hash_first{$alpha} = $frequency_hash_first{$alpha} + 1;
        }
     }   
 }   

seek(DATA1,0,0);

my $frequency = 0;
foreach $key (sort keys %frequency_hash_first)
 { 
   $frequency = ($frequency_hash_first{$key}/8913) * 100;
   print DATA2 "$frequency\n"
 } 


#To get Second Alphabet
while(<DATA1>)
 {
   $line = $_;
   foreach $alpha (@alphabet_list)
     {
       if($line=~m/\w$alpha\w\w\w/)
         {
           $frequency_hash_second{$alpha} = $frequency_hash_second{$alpha} + 1;
         }
     }
 }

seek(DATA1,0,0);

my $frequency = 0;
foreach $key (sort keys %frequency_hash_second)
 {
   $frequency = ($frequency_hash_second{$key}/8913) * 100;
   print DATA3 "$frequency\n"
 }


#To get Third Alphabet
while(<DATA1>)
 {
   $line = $_;
   foreach $alpha (@alphabet_list)
     {
       if($line=~m/\w\w$alpha\w\w/)
         {
           $frequency_hash_third{$alpha} = $frequency_hash_third{$alpha} + 1;
         }
     }
 }

seek(DATA1,0,0);

my $frequency = 0;
foreach $key (sort keys %frequency_hash_third)
 {
   $frequency = ($frequency_hash_third{$key}/8913) * 100;
   print DATA4 "$frequency\n"
 }

 #To get Fourth Alphabet
while(<DATA1>)
 {
   $line = $_;
   foreach $alpha (@alphabet_list)
     {
       if($line=~m/\w\w\w$alpha\w/)
         {
           $frequency_hash_fourth{$alpha} = $frequency_hash_fourth{$alpha} + 1;
         }
     }
 }

seek(DATA1,0,0);

my $frequency = 0;
foreach $key (sort keys %frequency_hash_fourth)
 {
   $frequency = ($frequency_hash_fourth{$key}/8913) * 100;
   print DATA5 "$frequency\n"
 }



#To get fifth Alphabet
while(<DATA1>)
 {
   $line = $_;
   foreach $alpha (@alphabet_list)
     {
       if($line=~m/\w\w\w\w$alpha/)
         {
           $frequency_hash_fifth{$alpha} = $frequency_hash_fifth{$alpha} + 1;
         }
     }
 }

seek(DATA1,0,0);

my $frequency = 0;
foreach $key (sort keys %frequency_hash_fifth)
 {
   $frequency = ($frequency_hash_fifth{$key}/8913) * 100;
   print DATA6 "$frequency\n"
 }
 

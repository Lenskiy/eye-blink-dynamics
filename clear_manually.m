function [session_raw_fp1_fp3, session_raw_fp2_fp4] = clear_manually(session_raw_fp1_fp3, session_raw_fp2_fp4)
    pseudo_std = 20;
    %manually remove artifacts
    %replace original signals with manually cleaned up ones
    session_raw_fp2_fp4{1}(21,6900:7650) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(21,6900:7650), pseudo_std);
    session_raw_fp2_fp4{1}(19,12000:14000) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(19,12000:14000), pseudo_std);
    session_raw_fp2_fp4{1}(19,46240:46340) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(19,46240:46340), pseudo_std);
    session_raw_fp2_fp4{1}(22,74000:74380) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(22,74000:74380), pseudo_std);
    session_raw_fp2_fp4{2}(19,74400:74650) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(19,74400:74650), pseudo_std);
    session_raw_fp2_fp4{2}(19,2000:2800) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(19,2000:2800), pseudo_std);
    session_raw_fp2_fp4{2}(2,77600:79400) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(2,77600:79400), pseudo_std);
    session_raw_fp2_fp4{2}(5,47750:48000) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(5,47750:48000), pseudo_std);
    session_raw_fp2_fp4{2}(6,20300:20450) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(6,20300:20450), pseudo_std);
    session_raw_fp2_fp4{2}(26,56950:57100) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(26,56950:57100), pseudo_std);
    session_raw_fp2_fp4{3}(26,5600:5900) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(26,5600:5900), pseudo_std);
    session_raw_fp2_fp4{3}(26,21330:21480) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(26,21330:21480), pseudo_std);
    session_raw_fp2_fp4{3}(26,16350:16450) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(26,16350:16450), pseudo_std);
    session_raw_fp2_fp4{4}(26,50850:51050) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(26,50850:51050), pseudo_std);
    session_raw_fp2_fp4{5}(26,41660:42150) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(26,41660:42150), pseudo_std);
    session_raw_fp2_fp4{3}(28,20600:22300) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(28,20600:22300), pseudo_std);
    session_raw_fp2_fp4{1}(28,42525:43000) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(28,42525:43000), pseudo_std);
    session_raw_fp2_fp4{1}(28,25300:25900) =  replaceWithBrownNoise(session_raw_fp2_fp4{1}(28,25300:25900), pseudo_std);
    session_raw_fp2_fp4{3}(28,20600:22300) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(28,20600:22300), pseudo_std);

    session_raw_fp2_fp4{3}(25,67600:69200) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,67600:69200), pseudo_std);
    session_raw_fp2_fp4{3}(17,55500:56300) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(17,55500:56300), pseudo_std);
    session_raw_fp2_fp4{3}(17,74650:74800) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(17,74650:74800), pseudo_std);
    session_raw_fp2_fp4{3}(1,28550:28700) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(1,28550:28700), pseudo_std);
    session_raw_fp2_fp4{3}(21,43400:43550) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(21,43400:43550), pseudo_std);
    session_raw_fp2_fp4{3}(19,10800:11100) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(19,10800:11100), pseudo_std);
    session_raw_fp2_fp4{3}(24,74600:75000) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(24,74600:75000), pseudo_std);
    session_raw_fp2_fp4{3}(24,56400:57000) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(24,56400:57000), pseudo_std);
    session_raw_fp2_fp4{3}(24,58800:59100) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(24,58800:59100), pseudo_std);
    session_raw_fp2_fp4{5}(24,9850:10250) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(24,9850:10250), pseudo_std);
    session_raw_fp2_fp4{1}(25,29600:30300) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(25,29600:30300), pseudo_std);
    session_raw_fp2_fp4{1}(25,32790:33500) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(25,32790:33500), pseudo_std);
    session_raw_fp2_fp4{1}(25,60000:61000) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(25,60000:61000), pseudo_std);
    session_raw_fp2_fp4{2}(25,47600:47750)  = replaceWithBrownNoise(session_raw_fp2_fp4{2}(25,47600:47750), pseudo_std);
    session_raw_fp2_fp4{3}(25,2980:3100)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,2980:3100), pseudo_std);
    session_raw_fp2_fp4{3}(25,63050:63450)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,63050:63450), pseudo_std);
    session_raw_fp2_fp4{3}(25,67600:69200)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,67600:69200), pseudo_std);
    session_raw_fp2_fp4{3}(25,66460:66560)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,66460:66560), pseudo_std);
    session_raw_fp2_fp4{4}(25,58350:58700) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(25,58350:58700), pseudo_std);
    session_raw_fp2_fp4{5}(25,16600:17100) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(25,16600:17100), pseudo_std);
    session_raw_fp2_fp4{5}(28,68675:75000) = session_raw_fp2_fp4{5}(28,62350:68675);


    session_raw_fp2_fp4{4}(22,40140:40220) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(22,40140:40220), pseudo_std);
    session_raw_fp2_fp4{4}(19,21300:21650) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(19,21300:21650), pseudo_std);
    session_raw_fp2_fp4{4}(2,20500:20700) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(2,20500:20700), pseudo_std);
    session_raw_fp2_fp4{4}(9, 30200:30800) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(9, 30200:30800), pseudo_std); %50
    session_raw_fp2_fp4{4}(14, 54600:54900) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(14, 54600:54900), pseudo_std);
    session_raw_fp2_fp4{4}(15, 72500:75000) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(15, 72500:75000), pseudo_std); %50
    session_raw_fp2_fp4{5}(20, 72500:73300) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(20, 72500:73300), pseudo_std);
    session_raw_fp2_fp4{5}(20, 70400:71600) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(20, 70400:71600), pseudo_std);

    session_raw_fp2_fp4{5}(9, 64500:66500) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(9, 64500:66500), pseudo_std); % 50
    session_raw_fp2_fp4{5}(2,64940) = session_raw_fp2_fp4{5}(2,64941); %because of NaN
    session_raw_fp2_fp4{5}(2,65000:end) = session_raw_fp2_fp4{5}(2,55000:65000);
    session_raw_fp2_fp4{5}(1,64445) = session_raw_fp2_fp4{5}(1,64446); %because of NaN
    session_raw_fp2_fp4{5}(1,65000:end) = session_raw_fp2_fp4{5}(1,55000:65000);
    session_raw_fp2_fp4{5}(15, 44500:46500) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(15, 44500:46500), pseudo_std); % 50
    session_raw_fp2_fp4{5}(17, 48400:50600) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(17, 48400:50600), pseudo_std);
    session_raw_fp2_fp4{5}(18,40900:41000) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(18,40900:41000), pseudo_std);
    session_raw_fp2_fp4{5}(18,68671:end) = session_raw_fp2_fp4{5}(18, 62342:68671);
    session_raw_fp2_fp4{5}(18, 68676) = session_raw_fp2_fp4{5}(18, 68677);
    session_raw_fp2_fp4{5}(9, 46000:48000) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(9, 46000:48000), pseudo_std); % 50
    session_raw_fp2_fp4{5}(9, 63650:64000) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(9, 63650:64000), pseudo_std); % 50
    session_raw_fp2_fp4{5}(21,36940:37750) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(21,36940:37750), pseudo_std);


    session_raw_fp1_fp3{1}(4,5000:6200) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,5000:6200), pseudo_std);
    session_raw_fp1_fp3{1}(4,58000:58350) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,58000:58350), pseudo_std);
    session_raw_fp1_fp3{1}(4,39600:39900) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,39600:39900), pseudo_std);
    session_raw_fp1_fp3{1}(4,24200:24400) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,24200:24400), pseudo_std);
    session_raw_fp1_fp3{1}(1,28550:28700) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(1,28550:28700), pseudo_std);
    session_raw_fp1_fp3{1}(18,21750:22250) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(18,21750:22250), pseudo_std);
    session_raw_fp1_fp3{2}(19,74390:74531) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(19,74390:74531), pseudo_std);
    session_raw_fp1_fp3{2}(19,147100:147450) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(19,147100:147450), pseudo_std);
    session_raw_fp1_fp3{2}(19,145040:145160) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(19,145040:145160), pseudo_std);
    session_raw_fp1_fp3{4}(19,21350:21532) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(19,21350:21532), pseudo_std);
    session_raw_fp1_fp3{5}(19,18380:18520) =  replaceWithBrownNoise(session_raw_fp1_fp3{5}(19,18380:18520), pseudo_std);
    session_raw_fp1_fp3{5}(19,24444:24560) =  replaceWithBrownNoise(session_raw_fp1_fp3{5}(19,24444:24560), pseudo_std);

    session_raw_fp1_fp3{2}(6,20300:20450) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(6,20300:20450), pseudo_std);
    session_raw_fp1_fp3{3}(11,73200:73800) = replaceWithBrownNoise(session_raw_fp1_fp3{3}(11,73200:73800), pseudo_std);
    session_raw_fp1_fp3{3}(19,10800:11400) = replaceWithBrownNoise(session_raw_fp1_fp3{3}(19,10800:11400), pseudo_std);
    session_raw_fp1_fp3{3}(19,45700:46150) =  replaceWithBrownNoise(session_raw_fp1_fp3{3}(19,45700:46150), pseudo_std);
    session_raw_fp1_fp3{3}(19,37440:37540) =  replaceWithBrownNoise(session_raw_fp1_fp3{3}(19,37440:37540), pseudo_std);


    session_raw_fp1_fp3{4}(4,35100:35900) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(4,35100:35900), pseudo_std);
    session_raw_fp1_fp3{4}(4,60200:60700) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(4,60200:60700), pseudo_std);
    session_raw_fp1_fp3{4}(11,800:1200) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(11,800:1200), pseudo_std);

    session_raw_fp1_fp3{5}(11,41986:42120) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,41986:42120), pseudo_std);
    session_raw_fp1_fp3{5}(11,65230:65870) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,65230:65870), pseudo_std);
    session_raw_fp1_fp3{5}(11,34800:35300) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,34800:35300), pseudo_std);
    session_raw_fp1_fp3{5}(11,60300:61070) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,60300:61070), pseudo_std);
    session_raw_fp1_fp3{5}(11,72750:73695) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,72750:73695), pseudo_std);
    session_raw_fp1_fp3{5}(11,28500:29000) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,28500:29000), pseudo_std);
    session_raw_fp1_fp3{5}(11,46840:47375) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,46840:47375), pseudo_std);
    session_raw_fp1_fp3{5}(11,38144:39000) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,38144:39000), pseudo_std);
    session_raw_fp1_fp3{5}(11,52140:52320) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,52140:52320), pseudo_std);
    session_raw_fp1_fp3{5}(11,42100:42900) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,42100:42900), pseudo_std);
    session_raw_fp1_fp3{5}(1,64441:end) = session_raw_fp2_fp4{5}(1,64441:end);
    session_raw_fp1_fp3{5}(2,65000:end) = session_raw_fp1_fp3{5}(2,55000:65000);
    session_raw_fp1_fp3{5}(4,23200:23700) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,23200:23700), pseudo_std);
    session_raw_fp1_fp3{5}(4,32150:32500) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,32150:32500), pseudo_std);
    session_raw_fp1_fp3{5}(4,44400:44700) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,44400:44700), pseudo_std);
    session_raw_fp1_fp3{5}(4,49300:49990) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,49300:49990), pseudo_std);
    session_raw_fp1_fp3{5}(4,54420:54600) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,54420:54600), pseudo_std);
    session_raw_fp1_fp3{5}(4,57600:57750) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,57600:57750), pseudo_std);
    session_raw_fp1_fp3{5}(4,61200:61350) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,61200:61350), pseudo_std);
    session_raw_fp1_fp3{5}(18,40900:41200) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(18,40900:41200), pseudo_std);
    session_raw_fp1_fp3{5}(18,68671:end) = session_raw_fp2_fp4{5}(18, 68671:end);
    session_raw_fp1_fp3{5}(28,68675:75000) = session_raw_fp1_fp3{5}(28,62350:68675);
    session_raw_fp1_fp3{5}(20,70500:73500) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(20,70500:73500), pseudo_std);

    session_raw_fp1_fp3{5}(26,41400:42105)  = replaceWithBrownNoise(session_raw_fp1_fp3{5}(26,41400:42105), pseudo_std);
    session_raw_fp1_fp3{5}(21,37000:37420)  = replaceWithBrownNoise(session_raw_fp1_fp3{5}(21,37000:37420), pseudo_std);
end
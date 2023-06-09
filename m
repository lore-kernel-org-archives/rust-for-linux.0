Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25089C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 08:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238327AbjFIIme (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 04:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241098AbjFIImI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 04:42:08 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 01:41:57 PDT
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5362C3588
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=998; q=dns/txt; s=iport;
  t=1686300117; x=1687509717;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lKtTMky3RpPT7TzP11vumz+V+r8WUlSatTllD1aFQWA=;
  b=VcD7QuFmYc4c+H6+LnhQ/pJUo3BdqbtoVsvXRbpsEQbOjFpk6380IXHU
   ZU1lFTuupVcXn2EbjC+cp4wnKUgs0JYv52S1Lw1jjBlDMkyUj7p5kRVXC
   UT7RexVi/xdRMhFQj7AUXwJ81jGFUZnbRx5j/KlhkZJT3mJ5A0RJQWmIX
   M=;
X-IPAS-Result: =?us-ascii?q?A0AZAAB/5IJkmIQNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBXFJzAlkqEkeEUYNMA4ROX4hVi1GSGoElA1YPAQEBDQEBOwkEA?=
 =?us-ascii?q?QGBU4MzAhaFXgIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBA?=
 =?us-ascii?q?QEBAQEBAR4ZBQ4QJ4VoDYYEAQEBAQMSEREMAQEsCwEPAgEIEQQBAQECAiYCA?=
 =?us-ascii?q?gIfERUICAIEDgUIGoJcAYIoAzEDARCgbAGBPwKKJHqBMoEBgggBAQYEBYFRD?=
 =?us-ascii?q?5pwDYJJAwaBFS0Bh1WBZINehEgnG4FJRIFYgmg+giBCAoFgAoNZOYIMIo4zj?=
 =?us-ascii?q?yiBKW+BHoEifwIJAhFBJoEKCFyBc0ACDVQLC2OBHYJVAgIRKRMUUnsdAwcEA?=
 =?us-ascii?q?oEFEC8HBDIfCQYJGBgXJwZTBy0kCRMVQgSDWQqBEEAVDhGCXCoCBzY4NwNEH?=
 =?us-ascii?q?UADC209NRQfBQQ/K4FXMECBDAIiJJ5GA4N+NggImRSZGZNhcAqECIt8jxOGJ?=
 =?us-ascii?q?xepVZgWjVqDc5Y/AgQCBAUCDgEBBoFjOoFbcBU7gmdSGQ+OIBmDW495dQI5A?=
 =?us-ascii?q?gcBCgEBAwmLRgEB?=
IronPort-PHdr: A9a23:h7aRnhKyDCfrHCWyZNmcuakyDhhOgF28FgcR7pxijKpBbeH6uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1o2t2qjPx1tEd3lL0bXvmX06DcTHhvlMg8gL+H0EZPWht+f3OGp8JqVaAJN13KxZLpoJ
 0CupB7K/okO1JJ/I7w4zAfIpHYAd+VNkGVvI1/S1xqp7car95kl+CNV088=
IronPort-Data: A9a23:YOz9lqyNzT6HcDWMFBd6t+cgxirEfRIJ4+MujC+fZmUNrF6WrkVRy
 zNNXD2EPa6JYWOgeo92YdyxpxxSucfQx9BlHAA4+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJloCCea/H9BC5C5xZVG/fngqoHUVqicYkideSc+EH160Uw7y7Zi6mJVqYHR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyV94KYkGE2EByCQrr+4sQKNb
 72rILmRpgs19vq2Yz+vuu6TnkYiGtY+MeUS45Zbc/DKv/RMmsA9+oEiMtYDYGRJsAumgeJD8
 41x6qCgewh8a8UgmMxFO/VZOyh6OasD87jdLD3m6YqYzlbNdD3nxPAG4EMeZNJDvL0pRzgVs
 6VDcljhbTjb7w6y6Lu+S+Jxgs04BMLqJ4gY/HpnyFk1CN5/GM6eGfibuYQwMDEYlPFXLdzya
 cwgcCNLdhP/RkZOJ01OF8dr9AuvriCvL2IHwL6PnoIt/nPPiQJ2yv3pMdzIavSUSshP2EWVv
 GTL+yL+GB5yCTCE4TOB9nTpjejVkGaiAMQZFaaz8bhhh1j7KnEv5AM+ckK9jeawqVCFZf1BG
 X4vohZxkbgA+xn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopY4BS7EVgDoqRYcNLQbWN8KqS8Cj
 QXZwo+1bdB7mPjEFy/Mp+/8QSaaZHB9EIMUWcMToeLpCfHMqZs3hxTDJjqIOPHo1oGucd0cL
 szjkcTTr7wXichO3KKh8BWe23Snp4PCSUg+4QC/soOZAuFROdHNi2+AsAezARN8wGCxEgPpU
 J8swJf20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4AvmsidR8yYptVI1cFh
 XM/XysPv/e/21P3PcdKj36ZUKzGMIC5T42+D6CIBjawSsEoJFTvEN5Sib64hjCxzxdEfVAXM
 paAesHkFmcBFali11KLqxQ1j9cWKtQF7TqLH/jTlk3/uZLHPSL9YeleajOmMLtmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidyNiWMir9ZUIKYZu4GNOQQkcNhMY+pt4E6RNlKVOneCO9
 Xa4MnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:wjlNJ62yzH0JV+8r0lafygqjBR1yeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5uxoWJPrfZvdnaQFhrX5To3SIjUO31HYY72KjLGSjwEIfhefygcz79
 YaT0ETMqyUMbE+t7eH3ODaKadv/DDkytHTuQ629R4EJm0aCNAD0+46MHfnLqQcfnghOXNNLu
 vl2iMxnUvYRZ14VLXeOpACZYX+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKevapzbgpAicxrXBQ/e2VFM
 lwrjikX109N2KaoMzwiuK4JC1Chw66p2EvnvUUiGEaWYwCaKVJpYha509NFowcdRiKo7zPPd
 MeRf003swmOW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7djDlhCy8rBrZbQQFm+oQoV4rmdSt0kc7jmZ8
 o=
X-Talos-CUID: 9a23:crw84mDivqKSANf6Ew5+8mILE+M7SUPy0kXiGBeEVlp5erLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AU7Tsiw5v9BYino8EwB+3qcuHxox60r2eImwDl6w?=
 =?us-ascii?q?fou2eMhNVYDaAlm2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 08:40:54 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
        by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 3598erjv010098
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <rust-for-linux@vger.kernel.org>; Fri, 9 Jun 2023 08:40:53 GMT
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=amiculas@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="2797851"
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
  by alln-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 08:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbfE0yaV+14FJYhrdPAhEAY/dgwcrjCSHVbcUCbExTdP6uukFwgFJWy8vGTsWMH6DYvTi9L3zw0vxF6KsQf8p3T5ivawgc87RCBVZ5B/Qvm+EwO0MhLE6D01BmTjL9BVVhp68FQieWp4w+8JDqwo551aIzMnZO8rPOPPoSR/p4NFSRPNZSUaA/YNZJeQIjWHqpkmCLLjmcktgj4ao1vnD3BvE232k5/eAVF1ATOdK4X52Ld0SWsFv9U/nlC0zwajwHNU7yMzFjukPL4jzcanNZ538CQMRLEXCwGXK7XxnLl0SQtvqrINJ14uubon53Z5cDxtxvdbVYwN68oXBX36bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKtTMky3RpPT7TzP11vumz+V+r8WUlSatTllD1aFQWA=;
 b=WuNwGeTLVZ9457Y2aAtJK6ku6zBPzooPgknbd251Q6jtnxX60S4tt3Xx7VKWUVNlsleOxFCQLMQ5jRXHDtgHNpssZp2luv2GGJB9y+8uWxIE95OOt/3zXUC53QwWAA2QZ2WzRnzwMyArClF3AxoH6k3fGkUGFul2zJwaFd44AxynOukZLAQKsrqbDTV3PrKSgdMjRQjkYbEVuXiKu8ZNfowi8UgDxINM1w4DJulBe+0mo0gVE5SMic698fi1YJBvCOqsR7n+w/s+L06MU8eiLmorPo3+pID48iNUPWS1B1HmuHmmcsve6tvutmd5L1OhVN/fk7rstWcVe3lHfJe/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKtTMky3RpPT7TzP11vumz+V+r8WUlSatTllD1aFQWA=;
 b=i5BYAwlgZLOfX6KpMNM1Scr5f/pLKxkKmls8Ow8T9vuP2MH7t0jN2TYLpj06z4+eBpFd7eKLb/8WMRORMKRk9CjKyXlW1EnPAe8BYvGC8ZghDzrUORNzhg8VeaB9wtsJT5bitibDA3xXiJfxMsqknKvmFU4BosjTctcW2gKrWX8=
Received: from CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 08:40:53 +0000
Received: from CH0PR11MB5299.namprd11.prod.outlook.com
 ([fe80::d6a3:51ad:f300:ebae]) by CH0PR11MB5299.namprd11.prod.outlook.com
 ([fe80::d6a3:51ad:f300:ebae%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 08:40:53 +0000
From:   "Ariel Miculas (amiculas)" <amiculas@cisco.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Thread-Topic: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Thread-Index: AQHZmqLC7vAFQ7pnkkmqa4yjge9BG6+CI/6AgAACmIs=
Date:   Fri, 9 Jun 2023 08:40:53 +0000
Message-ID: <CH0PR11MB52992DCAF6D5CD552DAFDC6ACD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
References: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
 <CANiq72njK=6TYt1z8WBpRFhPJY=yVtxytxDUi=_Jtp1dZ3hKLQ@mail.gmail.com>
In-Reply-To: <CANiq72njK=6TYt1z8WBpRFhPJY=yVtxytxDUi=_Jtp1dZ3hKLQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5299:EE_|MW3PR11MB4666:EE_
x-ms-office365-filtering-correlation-id: a5eeaa29-7891-40f0-8846-08db68c53c3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQ9cBfdQEd2lyznK0NR1NJ+LxGcb3OaMs6lZf+uo+5iASjvaYsrFHhSU/wRwM70ZspZSWgKpuiLMa76gD89saLQHmNKn0Kfl8M0HjJ/COI2EciUy/XooMA9G7QYdQaJLsBFpmUIoHdP8XFHyc9RYm2NWCv0IHrqoVYYOEjOo1ib1YBhDkpE6V3OeajMXde8j8eySEPT4wzI2PcwObFQUM5ge3/ZDmmfpz/Ea7Rs2YrqUmzkWSevHiYMlvnbfpj4ZAs7XuiBnUSb07womERhV61peVSb55uwYMFW3L6vOuunbUAXox9c/+YZBwzk54n2KlC/HcIekGFoBK97eCJWetBTA/tDSDptJM3Z4rzsCGQl23my/7fxKXsGnd9LVtRpN40KQdicVKfANwwiHnG3hKiLELs4w+ObmFb9HAQ1ZTo6e4FwdAgQXD+oP+xfdRLQKmxECUQE8XkCciycWumPLGRaphCTsg63uLmWUEM87SrwGMlHxoK/0xl4Nj+4KohEEkl9G69NOUpHLKHn+n4NGvjZPqPnPxW5hWHPvCCO/I82wrMlqZHTv3B7YRt7m8BV3xa55DKIktKsbt4jWw+gnzUg+dAVJBTUUO2CFcx1Qobg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5299.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199021)(8676002)(4326008)(8936002)(478600001)(966005)(55016003)(41300700001)(52536014)(7696005)(316002)(71200400001)(5660300002)(186003)(91956017)(66476007)(66556008)(66946007)(76116006)(66446008)(9686003)(53546011)(6506007)(6916009)(64756008)(4744005)(2906002)(122000001)(38100700002)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0w0c3JPcUNHQ2UrOUlsT2hmaDMxbHR5NTI4NmZvS3NMakhhSzNVL1dqbUFR?=
 =?utf-8?B?V3IxUU92RFpwY3QvdWNOSmNObnh0YUNjVnRrb1J1RTM2UzlKRzNUMDVuYmFl?=
 =?utf-8?B?MFplY3RwQlQxbzRxa2pYR1MzWno4Vmd4VUtkQUdqdElOU0lJb1VPV09GQ3Jw?=
 =?utf-8?B?UnM1TTVST2k1V3pTb3ZOK2FVL1MvK1hEN0xlTUtYZjhzTnNoNUdLTllTMGN0?=
 =?utf-8?B?RDVIblVqa3lSZndFY2w4Q1VteVBtR1dHZ1BkUjJGdDhqR0ZDYk5mMWg2WGFw?=
 =?utf-8?B?TFErZ3dwMkwrQjZyRU44OWxoRStEMkhTWG1oTHpyWDhTTHpjdE1DdzBNbk50?=
 =?utf-8?B?QTBscGFhUUNYUjJjUit6MGJWZlQzYnh1dEJvcWpHWFlZcmt1V2VYRkExbDhy?=
 =?utf-8?B?cHlMT0RjTHRySTdoRGxJYzNzVThSY09WUGFzL1ZQdTdwaURIbkxSc1lpN2Jx?=
 =?utf-8?B?aXlDdjRmK1VlVzRQR0p5UmUrTWJvS3AwQXdCR0VOdFNLNlk5em1Rajd0QTZD?=
 =?utf-8?B?OGI0U2x2OThDZVdVS0owdW1BMVY0V1VDVHNhbzAxZ3NZcDFIS3VaY3ZvVWM2?=
 =?utf-8?B?enJ6anYzejhiWFd6c0ZRbGkvZm16cjd2TE15YjNNdFNBOXVjODVSRTJ0bkdW?=
 =?utf-8?B?TkhlckczYWhPVHZsNW40Tlp0d1YrWmZoRENFamFoMDhkOVM5MzVxUGpmOURF?=
 =?utf-8?B?c2F1MFdyUk1Rd1F1dlpJaVdjS0dpQWZEU25ZMjlDcjUwWWVCU2dsaVlYRVgx?=
 =?utf-8?B?eGk3b2tsRFE2dzlzSUJQK1U2WlE2WkhJYUpCWk5ERmZyK3hwUlE1NjRuNDJo?=
 =?utf-8?B?UTBFeHJiRW52eE5oWDc2VHdNdVdTQ255R2FsSVVQMUtMcXpWTjBwTmprdm9L?=
 =?utf-8?B?cko4L0o0Skl1WlcreHVsR2xsRkNVclJvZys3UlFGeDhEbjl4NFBUUDhhMWJs?=
 =?utf-8?B?V2ZhMklHVUxxdGFXYjg4d1pnRkpBRlp6WXlMeldNcVRkeDl6cXhJTUNEM0VM?=
 =?utf-8?B?MWhaS0JHQm5TeE5iTHRzNi8yZGJSUElYR3lReXFuYUpkQUVxWUNBbG96Nk83?=
 =?utf-8?B?b3VMU1QvaklteHhscHVUejFhM0dPNDE5bjFvTjRNdjFnbkdsTnp2Q2Y4ajhZ?=
 =?utf-8?B?OUZDOE5RUlBMaWJmZXJ4bkxIWGJKdkJLaVNYUjJCR2g5d09abXVMd3dLMkpU?=
 =?utf-8?B?aSttMld3bXBxV3N1eGNKeEhWUUN0TzdyaGp0S3Z1NXNuYzE5MmlBUjdRZFJl?=
 =?utf-8?B?akFBaVVUalFCNXJwQnUxME9OVUVzdXV6VTUxbUFHOGFCUTltQzYvMTdpNEJ2?=
 =?utf-8?B?b0w2Z0FXRkh1WFpSN2NrQ0NLeFplenNFRllpUklZUUEzdWNGU3NtM2daZDFP?=
 =?utf-8?B?NzBMU2pEYXFmNmJmRWZJcHQwSk4rdGVIZWV6TlpueUl6QVI1eTBicHZESlpj?=
 =?utf-8?B?Q09mT0pFSjU5UFV2aVhzY21aNGxqSldaUmF3KzRWUWVjV2dzTDEvRERnZGZi?=
 =?utf-8?B?b29OK000Y2E5cUFubXVnZjI1VUpGMkJ6VkE5TG9xRTA0NzNJT3Y0VlNIeGpP?=
 =?utf-8?B?ZnFQR2psQnpvcWZPVGJGUXVxeW4wTmRMT29UK3hCMSswWnQzSlRZd1JlYXVC?=
 =?utf-8?B?ZkQvZ0dEK1NDR0hIYnRTN2JuVVNhUVowamFpeitPa3dFRHdTVzlZdjBueERj?=
 =?utf-8?B?TUtsazdlK3NGZFREbExwaFpIQW8rOG1DWE0xQWxSLzZlb3lqOUR3NzFlQ2pp?=
 =?utf-8?B?SU4vcktSV1Z0aHFhUnZQZlRIY29HMHJnQTNDYUVscHhJRFBMVkdJa0pEbjRC?=
 =?utf-8?B?clFGM0hwZnlrMjJPMkRTTDZUWlhycjNWMXlzRWROZFFFQ21zSityMUZHdHVS?=
 =?utf-8?B?T0ZDU25vQ0FQbWhERm12VTRTNkFYbXpCek9rSWNOU0FMeWFGMi9PUENxcGpa?=
 =?utf-8?B?WmVvd3VXZlJVOXVHeGFzSUlxQ1c4RHZZSjk5Yis3ZlFVRllFRk11RmZNS3ll?=
 =?utf-8?B?UFlkUTZsdC8wanVzSmxIWURvVUFjRFhZbVhJTnNMWGErZHJVMTgzZkF3U2wz?=
 =?utf-8?B?ejA2dEszeUlEMEE3QWxJWVp2cmZXdDN0d1RodWI4QzlITy9tUUVsVE1QaS9v?=
 =?utf-8?B?Ym41VHRZR0diQW5yWThSRHpEV2pFMk5VeUVmTXFtNWpuSmZCTjJicnBnMXU2?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5299.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eeaa29-7891-40f0-8846-08db68c53c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 08:40:53.1093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4hg0BcQGkJONqOXBiYGIn241t8uNRGyp0lD0oXosrdOb2Vb9/J8MuoCZ7SN6IwtWF1n0TOFYIcZT3kkmnnyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

VGhhbmtzLCBnb29kIHRvIGtub3chCgpSZWdhcmRzLApBcmllbAoKCkZyb206IE1pZ3VlbCBPamVk
YSA8bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4KU2VudDogRnJpZGF5LCBKdW5lIDks
IDIwMjMgMTE6MzAgQU0KVG86IEFyaWVsIE1pY3VsYXMgKGFtaWN1bGFzKSA8YW1pY3VsYXNAY2lz
Y28uY29tPgpDYzogcnVzdC1mb3ItbGludXhAdmdlci5rZXJuZWwub3JnIDxydXN0LWZvci1saW51
eEB2Z2VyLmtlcm5lbC5vcmc+ClN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAwLzgwXSBSdXN0IFB1
enpsZUZTIGZpbGVzeXN0ZW0gZHJpdmVyIArCoApPbiBGcmksIEp1biA5LCAyMDIzIGF0IDk6Mzfi
gK9BTSBBcmllbCBNaWN1bGFzIChhbWljdWxhcykKPGFtaWN1bGFzQGNpc2NvLmNvbT4gd3JvdGU6
Cj4KPiBTb21lIG9mIHRoZSBwYXRjaGVzIHdlcmUgYm91bmNlZCBieSB0aGUgcnVzdC1mb3ItbGlu
dXggbWFpbGluZyBsaXN0LCB5b3UgY2FuIHNlZSBhbGwgdGhlIGNvbW1pdHMgaGVyZToKPiBodHRw
czovL2dpdGh1Yi5jb20vUnVzdC1mb3ItTGludXgvbGludXgvY29tcGFyZS9ydXN0LW5leHQuLi5h
cmllbC1taWN1bGFzOnB1enpsZWZzX3JmY192MQoKVG8gZW5zdXJlIExvcmUgc2VlcyB0aGVtLCB5
b3UgY2FuIGFkZCBhIENjIHRvIHBhdGNoZXNAbGlzdHMubGludXguZGV2CmZvciBmdXR1cmUgc3Vi
bWlzc2lvbnMuCgpIb3BlIHRoYXQgaGVscHMhCgpDaGVlcnMsCk1pZ3VlbA==

Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE233C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbjFIKrd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237522AbjFIKrG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:47:06 -0400
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35962121
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=798; q=dns/txt; s=iport;
  t=1686307565; x=1687517165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mheNBO9RYrGIfL5FYivl/UJOUrUIlLZM6g1Z6ZWNV7A=;
  b=ZrnqN+xQIwJj6bsf1r06s5W7mZHm1OfOfkExUcDCD/c97sjlWPwG5H3W
   tmWzxigJ1wMEBTKE3sKB/h83uRnlbIlt8XLBzFgoHBVm8G0R4s/2HW8f6
   O3p4YZ9Vej3e/J0Xqaeq1yXbUsvx+8QmoXqBUJI34b8ewowBTVFR6WTOJ
   A=;
X-IPAS-Result: =?us-ascii?q?A0AfAABFAYNkmIkNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBXFJzAlkqEkeEUYNMA4ROX4hVi1GSGoElA1YPAQEBDQEBMRMEA?=
 =?us-ascii?q?QGBU4MzAhaFXgIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBA?=
 =?us-ascii?q?QEBAQEBAR4ZBRAOJ4VoDYYEAQEBAQMSEREMAQE3AQ8CAQgRBAEBAQICJgICA?=
 =?us-ascii?q?h8RFQgIAgQOBQgaglwBgigDMQMBoTMBgT8CiiR6gTKBAYIIAQEGBAWBUQ+ac?=
 =?us-ascii?q?A2CSQmBFS0Bh1WBZIgmJxuBSUSBWIJoPoIgQgKBJzkCg1k5gi6OM48ogSlvg?=
 =?us-ascii?q?R6BIn8CCQIRQSaBCghcgXNAAg1UCwtjgR2CVQICESkTFFJ7HQMHBAKBBRAvB?=
 =?us-ascii?q?wQyHwkGCRgYFycGUwctJAkTFUIEg1kKgRBAFQ4RglwqAgc2ODcDRB1AAwttP?=
 =?us-ascii?q?TUUHwUEPyuBVzBAgQwCIiSeRoMNgQ6ZQKx6cAqECIt8jxOGJxeDbqVnLpdok?=
 =?us-ascii?q?U2EeJFHAgQCBAUCDgEBBoFjOoFbcBWDIglJGQ+OIBmDW4YViWR1AjkCBwEKA?=
 =?us-ascii?q?QEDCYhsgloBAQ?=
IronPort-PHdr: A9a23:ykdNQxO/ooMwjTrKAd0l6nfLWUAX0o4cdiYc7p4hzrVWfbvmptLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgrDmgKUYAIM/lfBXJp2GqqzsbGxHxLw1wc+3wG4XPi82s/+uz4JbUJQ5PgWn1bbZ7N
 h7jtQzKrYFWmd57N68rwx3Vo31FM+hX3jZuIlSe3l7ws8yx55VktS9Xvpoc
IronPort-Data: A9a23:ZpXfhqD364/q0RVW/yLjw5YqxClBgxIJ4kV8jS/XYbTApGxxhmZUz
 zZNDGvQM/qDYTTxLYgkOozl9kMD7ZOHzdMxOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4WGdIZuJpPljk/F3oLJ9RGQ7onWAOKkYAL4EnopH1Q8Fn9w0UsLd9MR2+aEv/DoW2thh
 vuqyyHvEAfNN+lcaz98Bwqr8XuDjdyq0N8qlgVWicNj4Dcyo0Io4Kc3fsldGZdXrr58RYZWT
 86bpF2wE/iwEx0FUrtJmZ6jGqEGryK70QWm0hJrt6aebhdqgR0b7PckGcslV1pNkzKRwfJ7z
 N5rjMnlIespFvWkdOU1Wh1cFWR1OrdLveOBKnmkusvVxErDG5fu66wxVwdtY8tBoaAuWj4mG
 f8wcFjhajiKguO93bayUcFnh98oK4/gO4Z3VnRIkmmFVKh7Ecurr6Pi/v5x4QUVoctyF9nfO
 dJeMGRqUCnQWkgaUrsQIMtuwLj37pXlSBVCtUmJ4KQw+S3XzQpswJDzP9fPPN+HX8NYmgCfv
 G2uwojiKhgeMNrawj2f/zfwwOTOhij8HokVEdVU68KGnnW090UtWQI7ZGKFvOOhjVbgedhbI
 Gotr39GQbcJyGSnSdz0XhudqXGCvwIBV9c4LwHcwFzdokYzy1vFblXoXgKte/R97p9rGWBCO
 kuh2oK3WG0+6NV5XFrArt+pQSWO1T/5xIPoTQANVw8M5dWLTGob0U+XEo0L/EJYcrTI9dzYy
 jSOqm01gK8eyJJN3KSg9leBiDWpznQocuLXzliJNo5GxlomDGJAW2BOwQSBhRqnBN3GJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/p2r3py/7JtANsWsWyKJV3iAsJ2SBj
 Kj75FM52XOvFCDCgVJfOtjoUJ16kcAM6/y8D6CPBjaxXnSBXFbXoH4xDaJh92vsi0Mr2bouI
 ouWdN3EMJrpIfoP8dZCfM9EieVD7nlnnQv7HMmrpzz5iuD2TCDOFt843K6mM7pRAFWs+luFq
 r6y9qKiln1ibQEJSnOHrNZKfAhbfSBT6FKfg5U/S9Nv6zFOQQkJI/TQ2rgmPYdimsxoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:GQRB4K89Ibeov1sEd7Vuk+F3db1zdoMgy1knxilNoENuE/Bwxv
 rBoB1E73DJYW4qKQ4dcLC7UpVpQRvnhPlICPoqTMmftW7dySSVxeBZnMffKljbexEWmdQtrp
 uIH5IObeEYSGIK8foSgzPIXerIouP3ipxA7N22pxwAPGIaCZ2IrT0JdzpzeXcGIjWucKBJbK
 Z0kfA33gZIF05nCvhTAENpY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNUMH4oJ69PJkm13imgsdVBUW6t
 MQ44pf3KAnVi8pkEnGlqv1fgAvmUyurXU4l+kPy3RZTIsFcbdU6ZcS5UVPDf47bWnHAa0cYa
 BT5fvnlb5rWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsueDcTYciFdryKJmYRrPvHm
X-Talos-CUID: =?us-ascii?q?9a23=3Ae/PsVmit4CZ/QOdbe25e2RB6aTJuVUz08ibPDn6?=
 =?us-ascii?q?BN3tzULqNF32a/KhCqp87?=
X-Talos-MUID: 9a23:cq0w+QYHKxS8quBTrB7FuQNHE8xU6YuvVlhKyMsDh/SUDHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 10:46:04 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 359Ak4hK026905
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <rust-for-linux@vger.kernel.org>; Fri, 9 Jun 2023 10:46:04 GMT
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=amiculas@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,229,1681171200"; 
   d="scan'208";a="2802783"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
  by alln-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 10:46:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1K2BsnSUyA/1tyscBHrQZThFBSD6XzhcjOYwr3Qihxid5VlhKdR3NKD4LPTyXreJMuQtK4FjyDhY/rXZnotATbAgS+CbUrTpJXq+LOUm/k9rQvLuFjChhn86FSp2t764v1qI1Xb5k7ZA7iLnEe7TVdUXaN9OJbXUVMr08RUWeyo/CfksI4VekmpE2KtErQlKZ20+OpyPXGUXjGD7Sda+VcM53w4g22B2FOUo0qM6usXgJ7Leod4lSbMlHx/3TPiSV10MKIis+H89fCcpwYFqLzUjHJx2eF8wWZJZgaNwj6xvCoTlflRVVbhjJAkTAhmqYNQiMf0Pm7ZoXt1X14Jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mheNBO9RYrGIfL5FYivl/UJOUrUIlLZM6g1Z6ZWNV7A=;
 b=cZafI/Mb6UzCL8w3M0siY+4lwqrKLq+zcpQEmAdR2OkfOz1bSC4Qx2YQWetmJVUJcGEo/HLB/Y9l/vjcsmoOZc+iP2QHpCMiBBd/EFfV0/PeOStgjmVKQwiijCqiJY6y9ZHy6TTKi45paZ14dRHJepfMHYgTgezr0QQW3PQrrUgkl5bTkje20ZrEkPD/rzrUB6aYk0g5tvUQiu8Uxg20ISx/l2TMHrGqCBWe6o2PtCHIIDTuwEqjEcU8iZvWgYITL3A9hMOzI/VOiDR4eynABBHq9WQOt+ktNazFl65sQx2RJcTHi2+TU88/7jV3EXZkAq3bTMa5emc7YK7PgGljwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mheNBO9RYrGIfL5FYivl/UJOUrUIlLZM6g1Z6ZWNV7A=;
 b=fleFKdn6488KuBl35s+qBd1cxGHMOg0oMzPtt9HF7dNyE3295rjJ13YFSk3lqaFFPfHGeT7RTV15qQwst2RXiyqlqEIwd0NJum+NrUe7yoYqOG0D4ZNxYBkpDIiUUpE45Nwmb0KEdBDIO1jJiavx1KU7al6SenjbJo19yqwAWYI=
Received: from CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 by PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 10:46:03 +0000
Received: from CH0PR11MB5299.namprd11.prod.outlook.com
 ([fe80::d6a3:51ad:f300:ebae]) by CH0PR11MB5299.namprd11.prod.outlook.com
 ([fe80::d6a3:51ad:f300:ebae%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 10:46:03 +0000
From:   "Ariel Miculas (amiculas)" <amiculas@cisco.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 12/80] drop: Add crate::pr_warn declaration
Thread-Topic: [PATCH 12/80] drop: Add crate::pr_warn declaration
Thread-Index: AQHZmpwOnAkGnqWonEqOOmMKsawYLa+CNI+AgAAVJzs=
Date:   Fri, 9 Jun 2023 10:46:03 +0000
Message-ID: <CH0PR11MB5299F993211FC5AB87DA6AD1CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-13-amiculas@cisco.com>
 <CANiq72nUhVTUJKyfsPJshZ0hL40-GK=O4JuPyBCy_1cd_j1CtA@mail.gmail.com>
In-Reply-To: <CANiq72nUhVTUJKyfsPJshZ0hL40-GK=O4JuPyBCy_1cd_j1CtA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5299:EE_|PH7PR11MB6796:EE_
x-ms-office365-filtering-correlation-id: 66e25f09-3425-4285-dd60-08db68d6b8e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZayOiBsPT0TngCFMrjXDkgfkCnfuDn0SgB7gA4dq8LgShUGLDrO97cxgUC6CsXZomaOvygEsfChx82/WJ2SjH7zQIDG+6KzZHLQnRbEifg2v7ExAgO2PQxpsV7sPYrXqlf7d/Jp7hGKdszuoqKTsDW3vS/ZDjZPZ3xAKikhh8OCEbiM9rZylWRpyhEcachlixwkZg4wx0jkjQ7i3vqDj4G8pdgJ4urr1LAxiidZZv4btpuDvdjtkJhy9n/CBG5rptyGrMh83KNHeHg6lBwxY9/sgBF/yvmHVTRAKlrVnj/H+2Gl17VoJgz158nGu/oyhDSmMjSrELsahH7XuNnicLdOVaLs9ssRSbHN+H6SjIWYYYsCUlrrzybMwkS6Y2qcX4zYfzRNiMOsxSnsot86XiLgKnNpoo3ZVBMSvb7odg2Y1wuolZ3RlD80EyIw+Vl9AM18kXcwCZzpFLx+9bDu5aUyJO9JWDqKNmBwdBFIFnB+Co4btkonhRswJCxTOSj63jSSQtjSmIbLo4H91+TuXHFEyBtHFZT1t9WN2kH9tznPnJi7aHlO7z0IwVZsprumVM4F/xqcqwXetUkn5H8QY4op0zrsg9xb7LFvxpXRFKAoFOOD8J+sbjDg3qDRHkkKd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5299.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(7696005)(71200400001)(83380400001)(38100700002)(86362001)(38070700005)(122000001)(33656002)(6506007)(9686003)(53546011)(55016003)(186003)(8676002)(2906002)(4744005)(8936002)(41300700001)(316002)(5660300002)(52536014)(6916009)(4326008)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(91956017)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFpnZXVpWExYTE0rWmdKY0pXeWF5T0RydXpucmp2WlRKVkNMNExNa215dXdQ?=
 =?utf-8?B?NUdTY3ZndTN6VGNjbUVXQzAzZklwV0tISkw2WTBVMDJBRUhESE04OHlnTDJS?=
 =?utf-8?B?RVcvbjBKV0hid05VVmlvN2QxSjFhR2JLc2l2ejg1alNoYytjb2lZK3llL1Az?=
 =?utf-8?B?R0VSVFZ3WXpQZmE4RXRvc3lGcHhpbW1hVG1sc1NLbFAvYkFITUQ1MXg4TDB2?=
 =?utf-8?B?bGZldDkyN2ZMY0JxRE81a3dqWVpITHdidzFjMHhXM3JEUndDcEVtL1R0Y0x0?=
 =?utf-8?B?cWJHb1ppcW1tU2huVkJCc3MyWHJuVVJJWU9mU1lKUFBtOHQxM1hqRytoY1Vj?=
 =?utf-8?B?QU5TOXFDWWZMTjZoSnp3T2JGNW9NQUIwWWlNa1FrWWtBU3BLUXV0d1pGeXFv?=
 =?utf-8?B?M3Q1U1l3K3NhdnZGcld4bWk0Nk5mWnNheHQwL2syOWlTdllTdUJCbm5LRjg4?=
 =?utf-8?B?UkhHSFFSRU8rVXpkdDgwYzdxN2RaOUpnWnlhS0xZK1pxdnd0WjUzYmdsdjdp?=
 =?utf-8?B?dDBRUlBJcnZVRkwvNjFpTlBTVXdBME00dnl6Y3pOZnpPaVZpQVY5SWNwVWoy?=
 =?utf-8?B?RXdVV1hFUXZRakFmeFBtaFZMcEpVeDdCb0NXVFVwZHhpR2oyU2F2eGR2OGkw?=
 =?utf-8?B?VldTNStvakNRRHNqbGNxODYrMWJyTEl3OTdOc3kxU0h3RUdRempJcUd6RXZR?=
 =?utf-8?B?YUR2cDFXSnhkaFBjRG0weEh4SnIvSTBHVmtYbFhPaEVQL1Y5Zkg3Ym9DTTZG?=
 =?utf-8?B?L1NIUU5INGhINUgvQkNRa1BiQmNHRWZpSlNuQVJPQmpHMTFZOWwyVkpUV3VN?=
 =?utf-8?B?bEc0emxMbmFGRmJGbXd6bHUxUEpwSHB4VnhGVk1POTZTamNKVHJWQ2dKQzZ4?=
 =?utf-8?B?c3FqWDJ1aDNWUE1Fd29wQW9KNXBPelFlcjAzUDA3dzRxTERSdlFobTB5U29m?=
 =?utf-8?B?K1QrUURFK0dEckJ4YS83YWtGV0pDS3V0YXloK0xEc01JaTNwYkk3c0M3czNy?=
 =?utf-8?B?RDdvY2FyNjhlOEhEdlhkb0NRby9ncnFaVjE2UklPY3Q4eUVnMGV4cGxhSVM3?=
 =?utf-8?B?bnQ3Z2I3a3NodDBScFRIY2pMVVdlUWdQVXdNakJWUnBkWFFOUHZ3cE1ESzlm?=
 =?utf-8?B?NEsrRHJjdVFtYUgxc1NxSk1pU1h2bGIxQjZVZGlod0dmWW0wdlFudTNTUnd5?=
 =?utf-8?B?V21qcTc2UWs5MVN3V0xqakdHZTZrUVhkNFB2SEVINjhPVDJORXhteDA2aHQ5?=
 =?utf-8?B?Wi94VzRsWXMrcE5CODJnRlVETnZ5Wm1pNHY3bFZPYzN4ZGsvd1hQbzJoR2Zn?=
 =?utf-8?B?THkvbU40Wm1HWVdVVmpxcVJKaTJoWDlyY3FQK3QrWlNRUFQzUDRYdHM2cnNO?=
 =?utf-8?B?dlBBOHVLRGxSVnBhU3YrZmUwR3ZQV1FhNDFOeDNuZkphSlRhSm8xZnkzem0r?=
 =?utf-8?B?c2htWDFoZ3h2VDBjZFdPQWRpazFzazg4SEk3Q2sxTlFjeTYvbTF2bHBjeUFw?=
 =?utf-8?B?MHdwWGorVFA3SS9MczNPYkNmN0VxU2MvZ3Y3RjVqaXcvcmxDWFFLK0hpRFZw?=
 =?utf-8?B?cm1MM1U2U1gxSHIrK21kbnpGem9OWFpnTHJkZ001L20wVkxCcURDQXdlZysv?=
 =?utf-8?B?UWFMNXRIMkpGYmJUa3Iya3BIYW1oWlhwZU4wbzVQR084OTV2aTVXUHF6Tlgz?=
 =?utf-8?B?bnlzU3oySW9SUWNod21Cc1ZlMU1LWHJEUXpITUt1WGVNdmV0WlpYZDN6TzBz?=
 =?utf-8?B?djIxclZqQTkvTGNpQjdNSWhyTFNXVHJhMXdEcW1IQWhBYVMwMk0ySkdQV0Nq?=
 =?utf-8?B?TVNIcGNVQ3AyOUNNV0NRVnlGTDVWbittYk94V29YK3lyK0MvOUFJNW9ZM3FQ?=
 =?utf-8?B?cmZhMlFOZ3p4TUowVnppNmhPVG9ub1pMNWN0K3JhWDhJWWJxSldHQ2ttZnJY?=
 =?utf-8?B?eUY1YWJzRUkwSzVYakVqRUQ5c2RsVEluK0JPRzg5Z1E4enFqNWhPTjBjbTMx?=
 =?utf-8?B?MW5yd1J5dW1SOE4yL3hEK1J1cU1mWWI4cWRaZE5iRHJmVkw2VEVhb0V2cXps?=
 =?utf-8?B?Mll3ZDdxWFJIV0VVSjZMYnlodkN0akJJN2xtNU5xUk9mRXo1VjRaNUtkS0VV?=
 =?utf-8?B?QWdDQmhJU0h1Z0lTOTBGSmhoT3FUTmVGdnh4WkFXR2Y2NW0vYm9mTEZyZzVH?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5299.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e25f09-3425-4285-dd60-08db68d6b8e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 10:46:03.7108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmsY6XIy1yMivrr5uIK4Hox76rLPdtkDlltRdsSBokTmqb6mIN9X+sHJ/OutZSnPsmb2hlTEmHHGlrjkWoRNng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6796
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

WWVzLCBJIHNob3VsZCBoYXZlIGRyb3BwZWQgdGhpcyBjb21taXQsIHRoYXQncyB3aHkgaXQgc2F5
cyAiZHJvcCIgaW4gdGhlIG1lc3NhZ2UuCgpSZWdhcmRzLApBcmllbAoKRnJvbTogTWlndWVsIE9q
ZWRhIDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgpTZW50OiBGcmlkYXksIEp1bmUg
OSwgMjAyMyAxMjoyOSBQTQpUbzogQXJpZWwgTWljdWxhcyAoYW1pY3VsYXMpIDxhbWljdWxhc0Bj
aXNjby5jb20+CkNjOiBydXN0LWZvci1saW51eEB2Z2VyLmtlcm5lbC5vcmcgPHJ1c3QtZm9yLWxp
bnV4QHZnZXIua2VybmVsLm9yZz4KU3ViamVjdDogUmU6IFtQQVRDSCAxMi84MF0gZHJvcDogQWRk
IGNyYXRlOjpwcl93YXJuIGRlY2xhcmF0aW9uIArCoApPbiBGcmksIEp1biA5LCAyMDIzIGF0IDk6
MDXigK9BTSBBcmllbCBNaWN1bGFzIDxhbWljdWxhc0BjaXNjby5jb20+IHdyb3RlOgo+Cj4gLS0t
Cj7CoCBydXN0L2tlcm5lbC9mcy5ycyB8IDEgLQo+wqAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCkVtcHR5IHBhdGNoLCBwcm9iYWJseSBkdWUgdG8gcmViYXNpbmcgZnVuPyA6KQoKQ2hl
ZXJzLApNaWd1ZWw=

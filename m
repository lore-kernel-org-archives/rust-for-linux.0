Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24375C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 07:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238380AbjFIHU5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 03:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbjFIHUv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 03:20:51 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 00:20:47 PDT
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0F6194
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=41371; q=dns/txt;
  s=iport; t=1686295247; x=1687504847;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=gi39zM0zxJkGctGKdgMZ0I0+g2pE5QnXVFPKt2DJ2rk=;
  b=hwGvlDR5zyW70gvSopxADqlntkoNXCYLadMH5rrH22hnRHfVoPMXGyJK
   UznEDPVLs+LcrscqAbpLG0npJBIhyc6MdNEFJq/tOiVGCHY0MHg+KQHRG
   s47jJKiPvvnGXY1kFPc2PYLmcErON/BKmbLbLg+oDXfzwG8TmUvczpLmc
   Q=;
X-IPAS-Result: =?us-ascii?q?A0A/AgCh0YJkmJRdJa1XA4EJJYEqgV0qKHMCWSoSR4gdA?=
 =?us-ascii?q?4UtiFIDgROYU4QFgSUDVg8BAQENAQE7CQQBAYFTgzMChXQCJTQJDgECAgIBA?=
 =?us-ascii?q?QEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaAEMhgQBA?=
 =?us-ascii?q?QIDEggmAQEsDBEBCBEEAQFhHQoEEwgaggRYAYJcAwEQBqEAAYE/AolVGjV4g?=
 =?us-ascii?q?TSBAYIIAQEGBAWBTgMPL50XCYFCjS2EMycbgUlEgRVDgjA4PoJiAQEBARiBR?=
 =?us-ascii?q?gIfERWDTYIMIos5DQuCYoMKgkqJVIEpb4EegSJ/AgkCEWeBCghcgXNAAg1UC?=
 =?us-ascii?q?wtjgR2CVQICESkTFFJ7HQMHBAKBBRAvBwQyHwkGCRgYFycGUwctJAkTFUIEg?=
 =?us-ascii?q?1kKgRBAFQ4RglwqAgc2ODcDRB1AAwttPTUUHwUEaoFXMECBDAJGnkYDgQSBE?=
 =?us-ascii?q?wElRgcBMAYhCQIRBxMBByICBR0rAUMOAToGHQccBxQCCy8DkhImARofjlOBN?=
 =?us-ascii?q?KELCoQIi3yVOheEAYFWkgKRfJgWIIRehGxTRoJXiGuMHiCFCQIEAgQFAg4BA?=
 =?us-ascii?q?QaBYzqBW3AVO4IzAQEyCQkNMxkPjisOCYEGAQiBZV6CZIFtCDuBAYlkdQIBO?=
 =?us-ascii?q?AIHCwEBAwmLRgEB?=
IronPort-PHdr: A9a23:MmXMMR86vFJtS/9uWO3oyV9kXcBvk6//MghQ7YIolPcUNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqPA90LfnxE5X6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:imU3i6ieY5BtUdly5lyOa8oYX161HxAKZh0ujC45NGQN5FlHY01je
 htvXGmPM/jfYTamLYsjPIjkoBxSvZXTx4JrSlRq+CgwH3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKkYAL/En43HVcMpBsJ00o5wLZn2t4w2rBVPivU0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMq
 0kv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOjzAazhHe3JrXO9IfcmptuR7XnOsti
 8lBt8SfExU5IYblzbF1vxlwS0mSPIVc87PBZHO4q8HWlheAeHr3yPIoB0YzVWEa0r8oWicVq
 rpJc3ZUMkDra+GemNpXTsFlg8UoMc3iJ6sUu2prynfSCvNOrZXrHfybtIYBh2ZYasZmQ+/uW
 +5IWydVVgnGUQd+AlUcGp81tbL97pX4W2QI9A3KzUYt2EDJ0RdtlbbqKp/Re9qXVe1LkUuC4
 GHL5WL0BlcdLtP39Nae2miniumKliThVcdLTvuz9+VhhxuYwWl75AAquUWTouKUsHyVBdFkd
 w8I9ih2gvIg5FOAZ4yoN/Gnm0KsshkZUttWNuQ17gCR16bZizp14EBZHlatj/R76KcLqSwWO
 kyhxIy2WGQ+2FGBYTfMqefO9GLa1T09dDdaPUc5oR05D84PSbzfYzrVRdplVaWylNCwQGu2y
 DGRpy94jLIW5SLq60lZ1Q6e695PjsGZJuLQ2ukxdj77hu+eTNX0D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3t6jfbGyE2g4yTsNJG9GRF5iLI9s4DNZWeRcBDyr4UWSBj
 LL74FkIv8YDYBNGk4cuOtLqYyjV8UQQPY21Cq+LBja/SpNwbwSAtDp/flKd2nuFraTfuf9XB
 HtvSu71VSxyIf0+lFKeHr5BuZd1nXpW7T2IGvjGI+GPjOD2iIi9E+lVaTNjr4kRscu5neki2
 4wEbpbSlksGD7KWj+u+2dd7EG3m5EMTXPjeg8dWbeWEZAFhHQkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:ulWPbKBerd/BSY3lHegQsceALOsnbusQ8zAXPh9KKCC9I/b3qy
 nxppsmPEfP+UwssREb8+xoS5PwPE80kqQFq7X5XI3SFzUO3VHJEGgM1/qb/9SNIVyaygc/79
 YsT0EdMqyKMbESt6+Ti2XIcKdD/DDtytHOuQ6q9QYVcegcUdAH0+4WMHf+LqRxfmR7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3ScFkzOQrwrGrUWShWNxRRDY0JXErPVQMbsGuWpUHyGplXYIrZVy1r
 lG0HmesIcSBRTcnD7l79yNTB1ykFGoyEBS59L7okYvJbf2UoUh2rA37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjBrdy32CnQqq4iQyXxbjXp5x0wXyIgWmWoB7os0T91B6/
 7fOqplmblSRosdbL57Bu0GXcyrY1a9CC7kISaXOxDqBasHM3XCp9r+56g0/vijfNgSwJ47iP
 36ISZlXK4JCjDT4OG1re52G0r2MRSAtBzWu7Fj26Q=
X-Talos-CUID: 9a23:DwKw7m3T+3Y+Wlg/KV3b07xfGdsISE/2knTrfwykBWQxZ+eHWUC70fYx
X-Talos-MUID: 9a23:0a761gYk7dJTPOBT6SbcuBUzBtpS2bmoOlo8qZcNqcSPHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 07:19:43 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
        by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 3597JhsU015749
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <rust-for-linux@vger.kernel.org>; Fri, 9 Jun 2023 07:19:43 GMT
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=amiculas@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="2766088"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:19:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG+xLvAeyDBWq/FSEaKYfpnkqdCqUNwzNY26/5XBL6zl//pLxzVl2e4CmtD0S9zn42Wa2qXuoBXFOiAwYZUN1Yr1WBiBD0H49UDsRQobtO1DMH3ByXk8n1XvLH0akSiOqmioUAiNu+Ck9C+Ox2/zqkz+fByr/h0myygZ8rt+fHxLawYeTq0I7S677TiUAUSBLUd6MusxdYbgLJwLQ4H4mf0lJx9eSiHRxSoAN9qO4W5J1z4lLVWD7Q8iMcW7pmBrvW2bKZIjkwNOkYdmqJt65QiaX9sFgh+0f1SsAYSJsRnXqxdZYuHThNEhq0pm62e5jkrDHvChYXOkbEpMunhUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi39zM0zxJkGctGKdgMZ0I0+g2pE5QnXVFPKt2DJ2rk=;
 b=K80ZsMlvm+4uEMc36i/DWl/uEUGXS9En81qAvlLLEeJGFFGIRZvCkGeerJfZjXzqbhu1QI2744jnaBXAVYT9Z7nc74i555KTnHqtMTSG45spXrtAFQUpo2QIyXfUGecQywmNnQ04CU3JIxNAWINspoZr4LbWrHoLAl8s70f37cXUa5JB2CFmo3IeaDyiousvaNsEFOJn23TuU6o9mP7Nk7aCBAXLqtma6alROjjtZa6jAp2civzdVBAgQLSE1gKY/tP+j0RZ5yDzld+TzGoDhK/wkohSFqhVL9ZvBrOpZmT0GOgjQuRpRFgDEo6vVFrzC1v0hRRqQl/eU8RXBsAudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi39zM0zxJkGctGKdgMZ0I0+g2pE5QnXVFPKt2DJ2rk=;
 b=UH8IKTfaDh+PNru9zPIjnqif/UstX63YBUFW7IWCYEkEyHzvrWJ1eXcLsORXrYVrJPCb8VFWM3R0KU5K/3Lgv0VOcARQmqS0ajoyuGmmdOAxhu274ymzxPVX9RIZ47W2kR30CdS2SPROhHQHL2IvY6YFguGHshPkZxv82i6jdrM=
Received: from CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Fri, 9 Jun
 2023 07:19:42 +0000
Received: from CH0PR11MB5299.namprd11.prod.outlook.com
 ([fe80::d6a3:51ad:f300:ebae]) by CH0PR11MB5299.namprd11.prod.outlook.com
 ([fe80::d6a3:51ad:f300:ebae%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 07:19:42 +0000
From:   "Ariel Miculas (amiculas)" <amiculas@cisco.com>
To:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Thread-Topic: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Thread-Index: AQHZmqLC7vAFQ7pnkkmqa4yjge9BGw==
Date:   Fri, 9 Jun 2023 07:19:42 +0000
Message-ID: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5299:EE_|DS7PR11MB7906:EE_
x-ms-office365-filtering-correlation-id: 320c4c0f-6cca-49d8-5542-08db68b9e501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AwLAVsSe3Bc3PrDmMWn1vOxiFzTrWhWt613pr6IefqavhJmCRvNzHJJfCkrSFnDyuIABLE6IzVnAw72QljP9YlEU5xP43xzuF8o/fo3YuEcE9lzgdrHpIKVdwf//lleV9YwFWTlmZddUp5pMtUhBdGeG49Bzni/h2v0uwlHDM0l5pq6zPR60ZmYwPbij3s9GcmWPbQh1Z+RRpipRPtrrThu5hSJ3FoNc8x6DSaOWlHkGYX/1XJTKGMpAzAd4ckm8QqjXl/lCnoFIOkuUhxtkZkPsauaHZV4A1ce9AaABpq2bgVq/agX4QLn+B9Xf450VrMXy2WFWoypZ2/TfGz046oam0Srth3Y/OqnZdaQRYSPJ3/OC15TVPW4d7gSFw9dk2L7csulUYZDl6P8mxIOH3McBiTTDN/pDvVJgDNk2s34uCSHZ3Bpoj6yd1ytYVQPGs2PJErtKLS6pMoHmNZKCDMvNkvie1Ttm2NXq3RsXv6Oqx9aLkDofipDtAxZpKaFq4TtpPQ6fyJeYcThbkqyMn8cZlluyD5LTixdbfUUtOKLqhAwLbE1ld5liwY2bGquqHiIVGfKKOWeUpBaJg0ZRPKZl1GjKVE/yInTJkWjEiP7D0CRc4i5MJ9XOmS/Jbn4H/aBfTUYbazdH/9dgFPeHwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5299.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199021)(186003)(38070700005)(2906002)(71200400001)(86362001)(66446008)(66556008)(76116006)(91956017)(64756008)(66476007)(66946007)(30864003)(6916009)(122000001)(9686003)(6506007)(53546011)(83380400001)(52536014)(8676002)(8936002)(33656002)(41300700001)(40140700001)(966005)(5660300002)(55016003)(478600001)(38100700002)(316002)(7696005)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y0rSg8J/Ylj3n5IBq9z+fF04N6ajAr0qCVUBTgQWWSG5Gh2yxQUwUHz/U/?=
 =?iso-8859-1?Q?jxe4uDRyWoF3LvEkv233dpfqYLTyDVt5cWEaikvzW05kczr1cNAMgTdvg1?=
 =?iso-8859-1?Q?DEuirQ75Hu3exVlCGl7PjB1CYGJpf+PTpP9ZkLt72zhjZRlyp4sBGsx0Kk?=
 =?iso-8859-1?Q?aCbLVWnOv3kzuvfiLBSjWx0r8v5Vn5elzcvyt3RUJeLNLAnZt4rddAdjkg?=
 =?iso-8859-1?Q?nQw2oE77EdZ9OsLNTvuibO2T2kryrH4/AyfySp0wjF0M1AGFsgIUshydYc?=
 =?iso-8859-1?Q?6fjnmBxpb34u/sCShana08CoSKSLuLBc8SSfMxvaBrSxR78UJ8QT8UcgXj?=
 =?iso-8859-1?Q?HGTU8G0llcEkJfK/DyE2AjzN5owra/DUbXGkClcsLovbNPayBEf+FYpOVF?=
 =?iso-8859-1?Q?3uOp/wrc3o+weNmqlrRjZPW6WH+Bb8S0+V03mBGhEReu9H67raiHkU7NdQ?=
 =?iso-8859-1?Q?9oMJAzLrsa0kFiTIWlfen+KAmFqqGTvtQvfKtd+j0mN8mk0B+C+osptq/E?=
 =?iso-8859-1?Q?5PwQr5XbN5IT61TrBhi1yGawgvmhfmP0iSZvb85H/Prjkm+NlF9xK5DZq0?=
 =?iso-8859-1?Q?dHmw/GXtJbM5E+3OnkhQWhO4k8ZpglcMP4OxNNMd+wrUm8zmeP+5QyGHph?=
 =?iso-8859-1?Q?F/DVZOcZDhbrx1M35C0p/hnSnHk9p942B17nspxj/rcwgo//VKW8xQbXDh?=
 =?iso-8859-1?Q?dI9U3pze07dq9uaDPcdQt6iD39bqhHk8paX+bOlyh4D2Xee82sfhd4nOqe?=
 =?iso-8859-1?Q?VJf1rytjufarMiLJqA5f63SjL5bOH7jfxOQcCtvZmtXqZo+MDXbAH6GI2F?=
 =?iso-8859-1?Q?sFBWTYm0t45rh2+jKxKQjLk/jDbZTfE3riQBzKrc5Ph/TERzeg/Jrh5SOr?=
 =?iso-8859-1?Q?AHwK2OXsBly7jx0Tr0WfRv+Y54+atuCFnP8Kbom0/d7eTJgWnxWR7vvl/U?=
 =?iso-8859-1?Q?3QAB8b4HGil3dQf+y8R8AMZADGe3u4g/1Bg5HxNUh64bBQr2uFl5FwckPr?=
 =?iso-8859-1?Q?LCwicl+fl2fGpeqkz9XB5Kc7OuaTpMMJV9FbsJbrUQcGvkvq7uvtOy2m8W?=
 =?iso-8859-1?Q?jK3OSBWctMzTTG+wAVP7jVPR4Fy82egQs3f83OJ2GNE6TX0K0pBZaD7hU3?=
 =?iso-8859-1?Q?vSHuck6TVjRGXRFtJkYDaTqC8PI8LqphUWWjSGOrP/kgeQIdAn+eflU3So?=
 =?iso-8859-1?Q?u7np5IZ/Suio617CzXS1EG32xixskoYi0hCLG/4Hu0+8GzKGtRARIJiB72?=
 =?iso-8859-1?Q?v5VLoROhiB55HsIA5PACJRUjfrtKhewtA/1GE9DZIVgVojiSqsyD/bVgmQ?=
 =?iso-8859-1?Q?Gj2WEksayzKVIewiuJSL9yW/5mbFEC3WgsPiYe47NLHaBNbdwKNg75i3og?=
 =?iso-8859-1?Q?5I8osx6Cu1+zc+rvKrEmbGRTnah7tdJg1QFRnVMWhqi8XNKo6b1lvCEeur?=
 =?iso-8859-1?Q?+SVdIgRnjiwjM9mLswIWI/21VV6BmaIn2dh0O+N1QDxHGDeDgBytMI8wZf?=
 =?iso-8859-1?Q?8fhWVpIOrCvPyY1huCj5o59rwrviHHJY1koLhSGPmwbU0+yEe9+jo3s+Sp?=
 =?iso-8859-1?Q?CDV5Qhd8RkbGNvKVrmZK1spxvENGU5ZdbXbPMUMjvTslTt74ZtMEN1R/TN?=
 =?iso-8859-1?Q?5NVwN1rCpOl0YUJQrk6/0fg9gWtX4W1hhK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5299.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320c4c0f-6cca-49d8-5542-08db68b9e501
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 07:19:42.2997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/O0tKukFHVd/juo4kp1o0nicgboAUSBlt1OFNspng6/5r+YYeayBFPwnXPBCg20gPE3R/x5ARtFlW5yLD4+nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Some of the patches were bounced by the rust-for-linux mailing list, you ca=
n see all the commits here:=0A=
https://github.com/Rust-for-Linux/linux/compare/rust-next...ariel-miculas:p=
uzzlefs_rfc_v1=0A=
=0A=
Regards,=0A=
Ariel=0A=
=0A=
=0A=
From: Ariel Miculas <amiculas@cisco.com>=0A=
Sent: Friday, June 9, 2023 9:29 AM=0A=
To: rust-for-linux@vger.kernel.org <rust-for-linux@vger.kernel.org>=0A=
Cc: Ariel Miculas (amiculas) <amiculas@cisco.com>=0A=
Subject: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver =0A=
=A0=0A=
Hi all!=0A=
=0A=
This is a proof of concept driver written for the PuzzleFS=0A=
next-generation container filesystem [1]. I've included a short abstract=0A=
about puzzlefs further below. This driver is based on the rust-next=0A=
branch, on top of which I've backported the filesystem abstractions from=0A=
Wedson Almeida Filho [2][3] and Miguel Ojeda's third-party crates=0A=
support: proc-macro2, quote, syn, serde and serde_derive [4]. I've added=0A=
the additional third-party crates serde_cbor[5] and hex [6]. Then I've=0A=
adapted the user space puzzlefs code [1] so that the puzzlefs kernel=0A=
module could present the directory hierarchy and implement the basic=0A=
read functionality.=0A=
For some additional context, puzzlefs was started by Tycho Andersen and=0A=
it's the successor of atomfs. This FOSDEM presentation from 2019 [12]=0A=
covers the rationale for a new oci image format and presents a higher=0A=
level overview of our goals with puzzlefs.=0A=
I've split the rest of the cover letter in following sections (using a=0A=
markdown style):=0A=
* Example: it describes a practical example of what was achieved=0A=
* Limitations: it presents the existing limitations of this POC=0A=
* Upstreaming steps: it describes the steps needed for upstreaming this=0A=
=A0 driver=0A=
* Setup: it shows how to setup the necessary environment for testing the=0A=
=A0 puzzlefs driver=0A=
* Puzzlefs abstract: it provides a short overview of puzzlefs=0A=
=0A=
# Example=0A=
An example is provided below:=0A=
=0A=
```=0A=
~ # cat /proc/filesystems | grep puzzlefs=0A=
nodev=A0=A0 puzzlefs=0A=
~ # mount -t puzzlefs -o oci_root_dir=3D"/home/puzzlefs_oci" -o image_manif=
est=3D"2d=0A=
6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b" none /mnt=
=0A=
~ # ls -lR /mnt/=0A=
/mnt/:=0A=
total 0=0A=
drwxr-xr-x=A0=A0=A0 2 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0 Jun=A0 8 12:26 dir-1=0A=
drwxr-xr-x=A0=A0=A0 2 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0 Jun=A0 8 12:26 dir-2=0A=
drwxr-xr-x=A0=A0=A0 2 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0 Jun=A0 8 12:26 dir-3=0A=
drwxr-xr-x=A0=A0=A0 2 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0 Jun=A0 8 12:26 dir-4=0A=
-rw-r--r--=A0=A0=A0 1 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0 Jun=A0 8 12:26 file1=0A=
-rw-r--r--=A0=A0=A0 1 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0 Jun=A0 8 12:26 file2=0A=
=0A=
/mnt/dir-1:=0A=
total 0=0A=
=0A=
/mnt/dir-2:=0A=
total 0=0A=
=0A=
/mnt/dir-3:=0A=
total 0=0A=
=0A=
/mnt/dir-4:=0A=
total 0=0A=
~ # cat /mnt/file2=0A=
ana are mere bla bla bla=0A=
~ # wc /mnt/file1=0A=
=A0=A0=A0=A0=A0 202=A0=A0=A0=A0=A0=A0 202=A0=A0=A0=A0=A0 5454 /mnt/file1=0A=
```=0A=
=0A=
In this example, /home/puzzlefs_oci is the puzzlefs oci directory:=0A=
```=0A=
~ # ls -lR /home/puzzlefs_oci/=0A=
/home/puzzlefs_oci/:=0A=
total 8=0A=
drwxr-xr-x=A0=A0=A0 3 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0 Jun=A0 8 14:33 blobs=0A=
-rw-r--r--=A0=A0=A0 1 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2=
66 Jun=A0 8 14:33 index.json=0A=
-rw-r--r--=A0=A0=A0 1 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 37 Jun=A0 8 14:33 oci-layout=0A=
=0A=
/home/puzzlefs_oci/blobs:=0A=
total 0=0A=
drwxr-xr-x=A0=A0=A0 2 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0 Jun=A0 8 14:33 sha256=0A=
=0A=
/home/puzzlefs_oci/blobs/sha256:=0A=
total 16=0A=
-rw-------=A0=A0=A0 1 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 89 Jun=A0 8 14:33 2d6602d678140540dc7e96de652a76a8b16eb=0A=
-rw-------=A0=A0=A0 1 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 9=
25 Jun=A0 8 14:33 4df03518eea406343dbb55046720f6a478881=0A=
-rw-------=A0=A0=A0 1 1000=A0=A0=A0=A0 1000=A0=A0=A0=A0=A0=A0=A0=A0=A0 5479=
 Jun=A0 8 14:33 d86a87b19bd9a2fec0d31687c1d669cdb59eb=0A=
```=0A=
=0A=
`2d6602d678140540dc7e96de652a76a8b16eb` is the puzzlefs image manifest=0A=
hash for the first_try tag:=0A=
```=0A=
$ cat /tmp/oci-simple/index.json | jq .=0A=
{=0A=
=A0 "schemaVersion": -1,=0A=
=A0 "manifests": [=0A=
=A0=A0=A0 {=0A=
=A0=A0=A0=A0=A0 "digest": "sha256:2d6602d678140540dc7e96de652a76a8b16e8aca1=
90bae141297bcffdcae901b",=0A=
=A0=A0=A0=A0=A0 "size": 89,=0A=
=A0=A0=A0=A0=A0 "media_type": "application/vnd.puzzlefs.image.rootfs.v1",=
=0A=
=A0=A0=A0=A0=A0 "annotations": {=0A=
=A0=A0=A0=A0=A0=A0=A0 "org.opencontainers.image.ref.name": "first_try"=0A=
=A0=A0=A0=A0=A0 }=0A=
=A0=A0=A0 }=0A=
=A0 ],=0A=
=A0 "annotations": {}=0A=
}=0A=
```=0A=
=0A=
I will describe how to build a puzzlefs image in the `Setup` section, at=0A=
step 5.=0A=
=0A=
# Limitations=0A=
One limitation is that the puzzlefs driver doesn't implement any lookup=0A=
functionality and instead it inserts every directory entry into the=0A=
dcache during init (see the `DCACHE_BASED` constant). This is similar to=0A=
how the sample `rust_fs` driver works, but the goal is to implement=0A=
proper lookup functions.=A0 However, more filesystem abstractions need to=
=0A=
be implemented before this can be achieved.=0A=
=0A=
# Upstreaming steps=0A=
Before the puzzlefs driver can be upstreamed, the following need to be=0A=
merged:=0A=
* Wedson's filesystem abstractions [3]=0A=
* the necessary third-party crates [4] (with the preliminary discussion=0A=
about whether this is desirable)=0A=
=0A=
# Setup=0A=
My setup is based on Wedson's tutorial [8]. Next, I will describe the=0A=
necessary steps to build an initrd and run a custom kernel under qemu.=0A=
=0A=
1. Get the linux rust-next branch [9] and apply this patchset=0A=
=0A=
2. Follow the rust quickstart guide [10]=0A=
=0A=
3. configure and build the kernel=0A=
```=0A=
$ make LLVM=3D1 allnoconfig qemu-busybox-min.config rust.config=0A=
$ make LLVM=3D1 -j$(nproc)=0A=
```=0A=
=0A=
4. setup busybox=0A=
```=0A=
git clone git://git.busybox.net/busybox=0A=
cd busybox=0A=
make menuconfig # enable 'Build static binary' config=0A=
make=0A=
make install=0A=
```=0A=
This will create the `_install` directory with the rootfs inside it.=0A=
=0A=
5. create a home directory in the rootfs and copy a puzzlefs oci=0A=
directory in home/puzzlefs_oci=0A=
To create a puzzlefs oci directory:=0A=
* download this custom puzzlefs repository [11] (it's custom because we=0A=
=A0 want to build an image without verity data)=0A=
* run `make release`=0A=
* create a simple filesystem structure with a few directories and files=0A=
=A0 (I've created one at ../test-puzzlefs/simple_rootfs)=0A=
* build a puzzlefs oci image at=0A=
=A0 `~/work/busybox/_install/home/puzzlefs_oci` (replace this path with=0A=
=A0 your busybox path) with the tag `first_try`:=0A=
```=0A=
$ target/release/puzzlefs build --omit-verity \=0A=
../test-puzzlefs/simple_rootfs ~/work/busybox/_install/home/puzzlefs_oci \=
=0A=
first_try=0A=
```=0A=
* get first_try's image manifest from index.json (inside `puzzlefs_oci`)=0A=
```=0A=
$ cat index.json | jq . | grep digest=0A=
=A0=A0=A0=A0=A0 "digest": "sha256:2d6602d678140540dc7e96de652a76a8b16e8aca1=
90bae141297bcffdcae901b",=0A=
```=0A=
=0A=
6. add the following 'init' script in the busybox rootfs (rootfs path=0A=
defaults to `./_install'):=0A=
```=0A=
#!/bin/sh=0A=
mount -t devtmpfs none /dev=0A=
mkdir -p /proc=0A=
mount -t proc none /proc=0A=
=0A=
ifconfig lo up=0A=
udhcpc -i eth0=0A=
=0A=
mkdir /mnt=0A=
mount -t puzzlefs -o oci_root_dir=3D"/home/puzzlefs_oci" -o \=0A=
image_manifest=3D"2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffd=
cae901b" \=0A=
none /mnt=0A=
=0A=
setsid sh -c 'exec sh -l </dev/ttyS0 >/dev/ttyS0 2>&1'=0A=
```=0A=
=0A=
Make sure to replace the `image_manifest` with your own digest. This=0A=
init script will be passed to rdinit in the kernel command line.=0A=
=0A=
7. generate the initramfs=0A=
=0A=
Assuming busybox is in `~/work/busybox`:=0A=
```=0A=
cd ~/work/busybox/_install && find . | cpio -H newc -o | gzip > ../ramdisk.=
img=0A=
```=0A=
This will generate a compressed ramdisk image in=0A=
`~/work/busybox/ramdisk.img`.=0A=
=0A=
8. run with qemu (this assumes the linux tree is at '../linux' and busybox=
=0A=
is at '../busybox'):=0A=
```=0A=
qemu-system-x86_64 \=0A=
=A0=A0=A0 -accel kvm \=0A=
=A0=A0=A0 -cpu host \=0A=
=A0=A0=A0 -m 4G \=0A=
=A0=A0=A0 -initrd ../busybox/ramdisk.img \=0A=
=A0=A0=A0 -kernel ../linux/arch/x86/boot/bzImage \=0A=
=A0=A0=A0 -nographic \=0A=
=A0=A0=A0 -append 'console=3DttyS0 nokaslr debug rdinit=3D/init' \=0A=
=A0=A0=A0 -nic user,model=3Drtl8139 \=0A=
=A0=A0=A0 -no-reboot=0A=
```=0A=
=0A=
9. Check whether puzzlefs has been successfully mounted=0A=
```=0A=
~ # mount | grep puzzlefs=0A=
none on /mnt type puzzlefs (rw,relatime)=0A=
~ # ls /mnt/=0A=
dir-1=A0 dir-2=A0 dir-3=A0 dir-4=A0 file1=A0 file2=0A=
```=0A=
=0A=
=0A=
# Puzzlefs abstract=0A=
Puzzlefs [1] is a container filesystem designed to address the=0A=
limitations of the existing OCI format. The main goals of the project=0A=
are reduced duplication, reproducible image builds, direct mounting=0A=
support and memory safety guarantees, some inspired by the OCIv2 design=0A=
document [7].=0A=
=0A=
Reduced duplication is achieved using the content defined chunking=0A=
algorithm FastCDC. This implementation allows chunks to be shared among=0A=
layers. Building a new layer starting from an existing one allows=0A=
reusing most of the chunks.=0A=
=0A=
Another goal of the project is reproducible image builds, which is=0A=
achieved by defining a canonical representation of the image format.=0A=
=0A=
Direct mounting support is a key feature of puzzlefs and, together with=0A=
fs-verity, it provides data integrity. Currently, puzzlefs is=0A=
implemented as a userspace filesystem (FUSE). A read-only kernel=0A=
filesystem driver is underway.=0A=
=0A=
Lastly, memory safety is critical to puzzlefs, leading to the decision=0A=
to implement it in Rust. Another goal is to share the same code between=0A=
user space and kernel space in order to provide one secure=0A=
implementation.=0A=
=0A=
=0A=
[1] https://github.com/anuvu/puzzlefs=0A=
[2] https://github.com/wedsonaf/linux/tree/fs=0A=
[3] https://github.com/Rust-for-Linux/linux/issues/1004=0A=
[4] https://github.com/Rust-for-Linux/linux/pull/1007=0A=
[5] https://docs.rs/serde_cbor/latest/serde_cbor/=0A=
[6] https://docs.rs/hex/0.4.3/hex/=0A=
[7] https://hackmd.io/@cyphar/ociv2-brainstorm=0A=
[8] https://www.youtube.com/watch?v=3DtPs1uRqOnlk=0A=
[9] https://github.com/Rust-for-Linux/linux/tree/rust-next=0A=
[10] https://docs.kernel.org/rust/quick-start.html=0A=
[11] https://github.com/ariel-miculas/puzzlefs/tree/support-no-verity-data=
=0A=
[12] https://archive.fosdem.org/2019/schedule/event/containers_atomfs/=0A=
=0A=
Ariel Miculas (58):=0A=
=A0 rust: kernel: add libraries required by the filesystem abstractions=0A=
=A0 rust: kernel: backport the delay module from the rust branch=0A=
=A0 rust: kernel: add container_of macro=0A=
=A0 rust: kernel: add offset_of macro=0A=
=A0 drop: Add crate::pr_warn declaration=0A=
=A0 rust: kernel: rename from_kernel_errno to from_errno=0A=
=A0 rust: kernel: Rename from_pointer to from_foreing and into_pointer to=
=0A=
=A0=A0=A0 into_foreign=0A=
=A0 rust: kernel: add count_paren_items macro, needed by define_fs_params=
=0A=
=A0=A0=A0 macro=0A=
=A0 rust: helpers: add missing rust helper 'alloc_pages'=0A=
=A0 kernel: configs: add qemu-busybox-min.config=0A=
=A0 rust: kernel: format the rust code=0A=
=A0 samples: puzzlefs: add initial puzzlefs sample, copied from rust_fs.rs=
=0A=
=A0 kernel: configs: enable rust samples in rust.config=0A=
=A0 Add SAMPLE_RUST_SERDE in rust.config=0A=
=A0 rust: kernel: fix compile errors after rebase to rust-next=0A=
=A0 rust: serde_cbor: import crate=0A=
=A0 rust: serde_cbor: add SPDX License Identifiers=0A=
=A0 rust: serde_cbor: add no_fp_fmt_parse support=0A=
=A0 rust: Kbuild: enable serde_cbor=0A=
=A0 samples: rust: add cbor serialize/deserialize example=0A=
=A0 rust: serde_cbor: add support for serde_cbor's from_slice method by=0A=
=A0=A0=A0 using a custom alloc_kernel feature=0A=
=A0 rust: serde: add support for deserializing Vec with kernel_alloc=0A=
=A0=A0=A0 feature=0A=
=A0 rust: file: Replace UnsafeCell with Opaque for File=0A=
=A0 rust: kernel: implement fmt::Debug for CString=0A=
=A0 samples: puzzlefs: rename RustFs to PuzzleFs=0A=
=A0 samples: puzzlefs: add basic deserializing support for the puzzlefs=0A=
=A0=A0=A0 metadata=0A=
=A0 rust: file: present the filesystem context to the open function=0A=
=A0 rust: kernel: add an abstraction over vfsmount to allow cloning a new=
=0A=
=A0=A0=A0 private mount=0A=
=A0 rust: file: add from_path, from_path_in_root_mnt and read_with_offset=
=0A=
=A0=A0=A0 methods to File=0A=
=A0 samples: puzzlefs: pass the Vfsmount structure from open to read and=0A=
=A0=A0=A0 return the contents of the data file inside /home/puzzlefs_oci=0A=
=A0 rust: file: move from_path, from_path_in_root_mnt and read_with_offset=
=0A=
=A0=A0=A0 methods to a RegularFile newtype=0A=
=A0 rust: file: ensure RegularFile can only create regular files=0A=
=A0 rust: file: add get_pos method to RegularFile=0A=
=A0 rust: file: add methods read_to_end, get_file_size and update_pos to=0A=
=A0=A0=A0 RegularFile=0A=
=A0 rust: file: define a minimal Read trait and implement it for=0A=
=A0=A0=A0 RegularFile=0A=
=A0 samples: puzzlefs: add cbor_get_array_size method=0A=
=A0 samples: puzzlefs: add KernelError to WireFormatError and implement=0A=
=A0=A0=A0 From conversion=0A=
=A0 samples: puzzlefs: implement new for MetadataBlob=0A=
=A0 samples: puzzlefs: build puzzlefs into the kernel, thus avoiding the=0A=
=A0=A0=A0 need to export rust symbols=0A=
=A0 rust: alloc: add try_clone for Vec<T>=0A=
=A0 rust: alloc: add from_iter_fallible for Vec<T>=0A=
=A0 samples: puzzlefs: implement to_errno and from_errno for=0A=
=A0=A0=A0 WireFormatError=0A=
=A0 samples: puzzlefs: add TryReserveError (and from conversion) to=0A=
=A0=A0=A0 WireFormatError=0A=
=A0 samples: puzzlefs: add higher level inode related functionality=0A=
=A0 samples: puzzlefs: populate the directory entries with the inodes from=
=0A=
=A0=A0=A0 the puzzlefs metadata file=0A=
=A0 rust: hex: import crate=0A=
=A0 rust: hex: add SPDX license identifiers=0A=
=A0 rust: Kbuild: enable `hex`=0A=
=A0 rust: hex: implement FromHex trait and hex::decode using a custom=0A=
=A0=A0=A0 kernel_alloc feature=0A=
=A0 rust: hex: add encode_hex_iter and encode_hex_upper_iter methods=0A=
=A0 rust: puzzlefs: add HexError to WireFormatError and implement the From=
=0A=
=A0=A0=A0 conversion=0A=
=A0 rust: puzzlefs: display the error value for=0A=
=A0=A0=A0 WireFormatError::KernelError=0A=
=A0 samples: puzzlefs: add Rootfs and Digest structs to types.rs=0A=
=A0 samples: puzzlefs: implement the conversion from WireFormatError to=0A=
=A0=A0=A0 kernel::error::Error=0A=
=A0 rust: puzzlefs: read the puzzlefs image manifest instead of an=0A=
=A0=A0=A0 individual metadata layer=0A=
=A0 rust: puzzlefs: rename PuzzleFs to PuzzleFsModule to avoid confusion=0A=
=A0=A0=A0 with the PuzzleFS struct=0A=
=A0 rust: puzzlefs: add support for reading files=0A=
=A0 rust: puzzlefs: add oci_root_dir and image_manifest filesystem=0A=
=A0=A0=A0 parameters=0A=
=0A=
Miguel Ojeda (15):=0A=
=A0 rust: proc-macro2: import crate=0A=
=A0 rust: proc-macro2: add SPDX License Identifiers=0A=
=A0 rust: proc-macro2: remove `unicode_ident` dependency=0A=
=A0 rust: quote: import crate=0A=
=A0 rust: quote: add SPDX License Identifiers=0A=
=A0 rust: syn: import crate=0A=
=A0 rust: syn: add SPDX License Identifiers=0A=
=A0 rust: syn: remove `unicode-ident` dependency=0A=
=A0 rust: serde: import crate=0A=
=A0 rust: serde: add `no_fp_fmt_parse` support=0A=
=A0 rust: serde: add SPDX License Identifiers=0A=
=A0 rust: serde_derive: import crate=0A=
=A0 rust: serde_derive: add SPDX License Identifiers=0A=
=A0 rust: Kbuild: enable `proc-macro2`, `quote`, `syn`, `serde` and=0A=
=A0=A0=A0 `serde_derive`=0A=
=A0 rust: test `serde` support=0A=
=0A=
Wedson Almeida Filho (7):=0A=
=A0 rust: add definitions for ref-counted inodes and dentries=0A=
=A0 rust: add ability to register a file system=0A=
=A0 rust: define fs context=0A=
=A0 rust: add support for file system parameters=0A=
=A0 rust: allow fs driver to initialise new superblocks=0A=
=A0 rust: add `module_fs` macro=0A=
=A0 WIP: rust: allow fs to be populated=0A=
=0A=
=A0Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 14 +-=0A=
=A0arch/x86/configs/qemu-busybox-min.config=A0 |=A0=A0 11 +=0A=
=A0kernel/configs/qemu-busybox-min.config=A0=A0=A0 |=A0=A0 56 +=0A=
=A0kernel/configs/rust.config=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 11 +=0A=
=A0rust/.gitignore=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 1 +=0A=
=A0rust/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 232 +-=0A=
=A0rust/alloc/vec/mod.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 48 +=0A=
=A0rust/bindings/bindings_helper.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 14=
 +=0A=
=A0rust/bindings/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0=A0 5 +=0A=
=A0rust/helpers.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 76 +=0A=
=A0rust/hex/error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0=A0 78 +=0A=
=A0rust/hex/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 506 +++=0A=
=A0rust/hex/serde.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 104 +=0A=
=A0rust/kernel/cred.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 46 +=0A=
=A0rust/kernel/delay.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 104 +=0A=
=A0rust/kernel/driver.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 28 +=0A=
=A0rust/kernel/error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 52 +-=0A=
=A0rust/kernel/file.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 1117 ++++++=0A=
=A0rust/kernel/fs.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 1478 ++++++++=0A=
=A0rust/kernel/fs/param.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 558 +++=0A=
=A0rust/kernel/io_buffer.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 153 +=0A=
=A0rust/kernel/iov_iter.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 81 +=0A=
=A0rust/kernel/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 83 +=0A=
=A0rust/kernel/mm.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 149 +=0A=
=A0rust/kernel/mount.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 66 +=0A=
=A0rust/kernel/pages.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 144 +=0A=
=A0rust/kernel/str.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0=A0 6 +=0A=
=A0rust/kernel/test_serde.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 26 +=0A=
=A0rust/kernel/test_serde/de.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 439 +++=0A=
=A0rust/kernel/test_serde/error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 73=
 +=0A=
=A0rust/kernel/test_serde/ser.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 4=
66 +++=0A=
=A0rust/kernel/user_ptr.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 175 +=0A=
=A0rust/proc-macro2/detection.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 77 +=0A=
=A0rust/proc-macro2/fallback.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 10=
04 ++++++=0A=
=A0rust/proc-macro2/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 | 1341 ++++++++=0A=
=A0rust/proc-macro2/marker.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 20 +=0A=
=A0rust/proc-macro2/parse.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 874 +++++=0A=
=A0rust/proc-macro2/rcvec.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 144 +=0A=
=A0rust/proc-macro2/wrapper.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 996 ++++++=0A=
=A0rust/quote/ext.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 112 +=0A=
=A0rust/quote/format.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 170 +=0A=
=A0rust/quote/ident_fragment.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 88 +=0A=
=A0rust/quote/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 1436 ++++++++=0A=
=A0rust/quote/runtime.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 440 +++=0A=
=A0rust/quote/spanned.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 45 +=0A=
=A0rust/quote/to_tokens.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 211 ++=0A=
=A0rust/serde/de/format.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 32 +=0A=
=A0rust/serde/de/ignored_any.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 246 ++=0A=
=A0rust/serde/de/impls.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 2755 +++++++++++++++=0A=
=A0rust/serde/de/mod.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 2313 +++++++++++++=0A=
=A0rust/serde/de/seed.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 21 +=0A=
=A0rust/serde/de/utf8.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 48 +=0A=
=A0rust/serde/de/value.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 1718 ++++++++++=0A=
=A0rust/serde/integer128.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 84 +=0A=
=A0rust/serde/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 351 ++=0A=
=A0rust/serde/macros.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 238 ++=0A=
=A0rust/serde/private/de.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 2997 ++++++++++++++++=0A=
=A0rust/serde/private/doc.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 161 +=0A=
=A0rust/serde/private/mod.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 52 +=0A=
=A0rust/serde/private/ser.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 1316 +++++++=0A=
=A0rust/serde/private/size_hint.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 23=
 +=0A=
=A0rust/serde/ser/fmt.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 180 +=0A=
=A0rust/serde/ser/impls.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 987 ++++++=0A=
=A0rust/serde/ser/impossible.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 218 ++=0A=
=A0rust/serde/ser/mod.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 1992 +++++++++++=0A=
=A0rust/serde/std_error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 50 +=0A=
=A0rust/serde_cbor/de.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 1370 ++++++++=0A=
=A0rust/serde_cbor/error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 320 ++=0A=
=A0rust/serde_cbor/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 371 ++=0A=
=A0rust/serde_cbor/read.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 647 ++++=0A=
=A0rust/serde_cbor/ser.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 748 ++++=0A=
=A0rust/serde_cbor/tags.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 224 ++=0A=
=A0rust/serde_cbor/value/de.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 168 +=0A=
=A0rust/serde_cbor/value/mod.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 158 +=0A=
=A0rust/serde_cbor/value/ser.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 447 +++=0A=
=A0rust/serde_cbor/write.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 177 +=0A=
=A0rust/serde_derive/bound.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 408 +++=0A=
=A0rust/serde_derive/de.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 | 3148 +++++++++++++++++=0A=
=A0rust/serde_derive/dummy.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 46 +=0A=
=A0rust/serde_derive/fragment.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 76 +=0A=
=A0rust/serde_derive/internals/ast.rs=A0=A0=A0=A0=A0=A0=A0 |=A0 204 ++=0A=
=A0rust/serde_derive/internals/attr.rs=A0=A0=A0=A0=A0=A0 | 1908 +++++++++++=
=0A=
=A0rust/serde_derive/internals/case.rs=A0=A0=A0=A0=A0=A0 |=A0 199 ++=0A=
=A0rust/serde_derive/internals/check.rs=A0=A0=A0=A0=A0 |=A0 445 +++=0A=
=A0rust/serde_derive/internals/ctxt.rs=A0=A0=A0=A0=A0=A0 |=A0=A0 64 +=0A=
=A0rust/serde_derive/internals/mod.rs=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 30 +=0A=
=A0rust/serde_derive/internals/receiver.rs=A0=A0 |=A0 287 ++=0A=
=A0rust/serde_derive/internals/respan.rs=A0=A0=A0=A0 |=A0=A0 18 +=0A=
=A0rust/serde_derive/internals/symbol.rs=A0=A0=A0=A0 |=A0=A0 71 +=0A=
=A0rust/serde_derive/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 112 +=0A=
=A0rust/serde_derive/pretend.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 203 ++=0A=
=A0rust/serde_derive/ser.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 1342 ++++++++=0A=
=A0rust/serde_derive/this.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 34 +=0A=
=A0rust/serde_derive/try.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 26 +=0A=
=A0rust/syn/attr.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 664 ++++=0A=
=A0rust/syn/await.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 4 +=0A=
=A0rust/syn/bigint.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 68 +=0A=
=A0rust/syn/buffer.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 400 +++=0A=
=A0rust/syn/custom_keyword.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 255 ++=0A=
=A0rust/syn/custom_punctuation.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 302=
 ++=0A=
=A0rust/syn/data.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 495 +++=0A=
=A0rust/syn/derive.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 276 ++=0A=
=A0rust/syn/discouraged.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 196 ++=0A=
=A0rust/syn/error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 430 +++=0A=
=A0rust/syn/export.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 41 +=0A=
=A0rust/syn/expr.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 | 3560 +++++++++++++++++++=0A=
=A0rust/syn/ext.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 141 +=0A=
=A0rust/syn/file.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 127 +=0A=
=A0rust/syn/gen/clone.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 2243 ++++++++++++=0A=
=A0rust/syn/gen/debug.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 3044 +++++++++++++++++=0A=
=A0rust/syn/gen/eq.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 2197 ++++++++++++=0A=
=A0rust/syn/gen/fold.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 3343 ++++++++++++++++++=0A=
=A0rust/syn/gen/hash.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 2871 ++++++++++++++++=0A=
=A0rust/syn/gen/visit.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 3788 +++++++++++++++++++++=0A=
=A0rust/syn/gen/visit_mut.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 3788 +++++++++++++++++++++=0A=
=A0rust/syn/gen_helper.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 156 +=0A=
=A0rust/syn/generics.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 1339 ++++++++=0A=
=A0rust/syn/group.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 284 ++=0A=
=A0rust/syn/ident.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 103 +=0A=
=A0rust/syn/item.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 | 3315 ++++++++++++++++++=0A=
=A0rust/syn/lib.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 985 ++++++=0A=
=A0rust/syn/lifetime.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 156 +=0A=
=A0rust/syn/lit.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 | 1602 +++++++++=0A=
=A0rust/syn/lookahead.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 171 +=0A=
=A0rust/syn/mac.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 221 ++=0A=
=A0rust/syn/macros.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 179 +=0A=
=A0rust/syn/op.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 236 ++=0A=
=A0rust/syn/parse.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 1316 +++++++=0A=
=A0rust/syn/parse_macro_input.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1=
81 +=0A=
=A0rust/syn/parse_quote.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 169 +=0A=
=A0rust/syn/pat.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 929 +++++=0A=
=A0rust/syn/path.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 856 +++++=0A=
=A0rust/syn/print.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0=A0 18 +=0A=
=A0rust/syn/punctuated.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 1070 ++++++=0A=
=A0rust/syn/reserved.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 46 +=0A=
=A0rust/syn/sealed.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0=A0 6 +=0A=
=A0rust/syn/span.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 69 +=0A=
=A0rust/syn/spanned.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 116 +=0A=
=A0rust/syn/stmt.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 351 ++=0A=
=A0rust/syn/thread.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 43 +=0A=
=A0rust/syn/token.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 1015 ++++++=0A=
=A0rust/syn/tt.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 109 +=0A=
=A0rust/syn/ty.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 | 1288 +++++++=0A=
=A0rust/syn/verbatim.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 35 +=0A=
=A0rust/syn/whitespace.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 67 +=0A=
=A0samples/rust/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 28 +=0A=
=A0samples/rust/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0=A0 3 +=0A=
=A0samples/rust/local_data_format/de.rs=A0=A0=A0=A0=A0 |=A0 422 +++=0A=
=A0samples/rust/local_data_format/error.rs=A0=A0 |=A0=A0 73 +=0A=
=A0samples/rust/local_data_format/ser.rs=A0=A0=A0=A0 |=A0 443 +++=0A=
=A0samples/rust/puzzle.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0=A0 4 +=0A=
=A0samples/rust/puzzle/error.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 91 +=0A=
=A0samples/rust/puzzle/inode.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 150 +=0A=
=A0samples/rust/puzzle/oci.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 71 +=0A=
=A0samples/rust/puzzle/types.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 389 +++=0A=
=A0samples/rust/puzzle/types/cbor_helpers.rs |=A0=A0 50 +=0A=
=A0samples/rust/puzzlefs.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 220 ++=0A=
=A0samples/rust/rust_fs.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 105 +=0A=
=A0samples/rust/rust_serde.rs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 125 +=0A=
=A0scripts/Makefile.build=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0=A0 4 +-=0A=
=A0160 files changed, 89204 insertions(+), 29 deletions(-)=0A=
=A0create mode 100644 arch/x86/configs/qemu-busybox-min.config=0A=
=A0create mode 100644 kernel/configs/qemu-busybox-min.config=0A=
=A0create mode 100644 rust/hex/error.rs=0A=
=A0create mode 100644 rust/hex/lib.rs=0A=
=A0create mode 100644 rust/hex/serde.rs=0A=
=A0create mode 100644 rust/kernel/cred.rs=0A=
=A0create mode 100644 rust/kernel/delay.rs=0A=
=A0create mode 100644 rust/kernel/driver.rs=0A=
=A0create mode 100644 rust/kernel/file.rs=0A=
=A0create mode 100644 rust/kernel/fs.rs=0A=
=A0create mode 100644 rust/kernel/fs/param.rs=0A=
=A0create mode 100644 rust/kernel/io_buffer.rs=0A=
=A0create mode 100644 rust/kernel/iov_iter.rs=0A=
=A0create mode 100644 rust/kernel/mm.rs=0A=
=A0create mode 100644 rust/kernel/mount.rs=0A=
=A0create mode 100644 rust/kernel/pages.rs=0A=
=A0create mode 100644 rust/kernel/test_serde.rs=0A=
=A0create mode 100644 rust/kernel/test_serde/de.rs=0A=
=A0create mode 100644 rust/kernel/test_serde/error.rs=0A=
=A0create mode 100644 rust/kernel/test_serde/ser.rs=0A=
=A0create mode 100644 rust/kernel/user_ptr.rs=0A=
=A0create mode 100644 rust/proc-macro2/detection.rs=0A=
=A0create mode 100644 rust/proc-macro2/fallback.rs=0A=
=A0create mode 100644 rust/proc-macro2/lib.rs=0A=
=A0create mode 100644 rust/proc-macro2/marker.rs=0A=
=A0create mode 100644 rust/proc-macro2/parse.rs=0A=
=A0create mode 100644 rust/proc-macro2/rcvec.rs=0A=
=A0create mode 100644 rust/proc-macro2/wrapper.rs=0A=
=A0create mode 100644 rust/quote/ext.rs=0A=
=A0create mode 100644 rust/quote/format.rs=0A=
=A0create mode 100644 rust/quote/ident_fragment.rs=0A=
=A0create mode 100644 rust/quote/lib.rs=0A=
=A0create mode 100644 rust/quote/runtime.rs=0A=
=A0create mode 100644 rust/quote/spanned.rs=0A=
=A0create mode 100644 rust/quote/to_tokens.rs=0A=
=A0create mode 100644 rust/serde/de/format.rs=0A=
=A0create mode 100644 rust/serde/de/ignored_any.rs=0A=
=A0create mode 100644 rust/serde/de/impls.rs=0A=
=A0create mode 100644 rust/serde/de/mod.rs=0A=
=A0create mode 100644 rust/serde/de/seed.rs=0A=
=A0create mode 100644 rust/serde/de/utf8.rs=0A=
=A0create mode 100644 rust/serde/de/value.rs=0A=
=A0create mode 100644 rust/serde/integer128.rs=0A=
=A0create mode 100644 rust/serde/lib.rs=0A=
=A0create mode 100644 rust/serde/macros.rs=0A=
=A0create mode 100644 rust/serde/private/de.rs=0A=
=A0create mode 100644 rust/serde/private/doc.rs=0A=
=A0create mode 100644 rust/serde/private/mod.rs=0A=
=A0create mode 100644 rust/serde/private/ser.rs=0A=
=A0create mode 100644 rust/serde/private/size_hint.rs=0A=
=A0create mode 100644 rust/serde/ser/fmt.rs=0A=
=A0create mode 100644 rust/serde/ser/impls.rs=0A=
=A0create mode 100644 rust/serde/ser/impossible.rs=0A=
=A0create mode 100644 rust/serde/ser/mod.rs=0A=
=A0create mode 100644 rust/serde/std_error.rs=0A=
=A0create mode 100644 rust/serde_cbor/de.rs=0A=
=A0create mode 100644 rust/serde_cbor/error.rs=0A=
=A0create mode 100644 rust/serde_cbor/lib.rs=0A=
=A0create mode 100644 rust/serde_cbor/read.rs=0A=
=A0create mode 100644 rust/serde_cbor/ser.rs=0A=
=A0create mode 100644 rust/serde_cbor/tags.rs=0A=
=A0create mode 100644 rust/serde_cbor/value/de.rs=0A=
=A0create mode 100644 rust/serde_cbor/value/mod.rs=0A=
=A0create mode 100644 rust/serde_cbor/value/ser.rs=0A=
=A0create mode 100644 rust/serde_cbor/write.rs=0A=
=A0create mode 100644 rust/serde_derive/bound.rs=0A=
=A0create mode 100644 rust/serde_derive/de.rs=0A=
=A0create mode 100644 rust/serde_derive/dummy.rs=0A=
=A0create mode 100644 rust/serde_derive/fragment.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/ast.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/attr.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/case.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/check.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/ctxt.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/mod.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/receiver.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/respan.rs=0A=
=A0create mode 100644 rust/serde_derive/internals/symbol.rs=0A=
=A0create mode 100644 rust/serde_derive/lib.rs=0A=
=A0create mode 100644 rust/serde_derive/pretend.rs=0A=
=A0create mode 100644 rust/serde_derive/ser.rs=0A=
=A0create mode 100644 rust/serde_derive/this.rs=0A=
=A0create mode 100644 rust/serde_derive/try.rs=0A=
=A0create mode 100644 rust/syn/attr.rs=0A=
=A0create mode 100644 rust/syn/await.rs=0A=
=A0create mode 100644 rust/syn/bigint.rs=0A=
=A0create mode 100644 rust/syn/buffer.rs=0A=
=A0create mode 100644 rust/syn/custom_keyword.rs=0A=
=A0create mode 100644 rust/syn/custom_punctuation.rs=0A=
=A0create mode 100644 rust/syn/data.rs=0A=
=A0create mode 100644 rust/syn/derive.rs=0A=
=A0create mode 100644 rust/syn/discouraged.rs=0A=
=A0create mode 100644 rust/syn/error.rs=0A=
=A0create mode 100644 rust/syn/export.rs=0A=
=A0create mode 100644 rust/syn/expr.rs=0A=
=A0create mode 100644 rust/syn/ext.rs=0A=
=A0create mode 100644 rust/syn/file.rs=0A=
=A0create mode 100644 rust/syn/gen/clone.rs=0A=
=A0create mode 100644 rust/syn/gen/debug.rs=0A=
=A0create mode 100644 rust/syn/gen/eq.rs=0A=
=A0create mode 100644 rust/syn/gen/fold.rs=0A=
=A0create mode 100644 rust/syn/gen/hash.rs=0A=
=A0create mode 100644 rust/syn/gen/visit.rs=0A=
=A0create mode 100644 rust/syn/gen/visit_mut.rs=0A=
=A0create mode 100644 rust/syn/gen_helper.rs=0A=
=A0create mode 100644 rust/syn/generics.rs=0A=
=A0create mode 100644 rust/syn/group.rs=0A=
=A0create mode 100644 rust/syn/ident.rs=0A=
=A0create mode 100644 rust/syn/item.rs=0A=
=A0create mode 100644 rust/syn/lib.rs=0A=
=A0create mode 100644 rust/syn/lifetime.rs=0A=
=A0create mode 100644 rust/syn/lit.rs=0A=
=A0create mode 100644 rust/syn/lookahead.rs=0A=
=A0create mode 100644 rust/syn/mac.rs=0A=
=A0create mode 100644 rust/syn/macros.rs=0A=
=A0create mode 100644 rust/syn/op.rs=0A=
=A0create mode 100644 rust/syn/parse.rs=0A=
=A0create mode 100644 rust/syn/parse_macro_input.rs=0A=
=A0create mode 100644 rust/syn/parse_quote.rs=0A=
=A0create mode 100644 rust/syn/pat.rs=0A=
=A0create mode 100644 rust/syn/path.rs=0A=
=A0create mode 100644 rust/syn/print.rs=0A=
=A0create mode 100644 rust/syn/punctuated.rs=0A=
=A0create mode 100644 rust/syn/reserved.rs=0A=
=A0create mode 100644 rust/syn/sealed.rs=0A=
=A0create mode 100644 rust/syn/span.rs=0A=
=A0create mode 100644 rust/syn/spanned.rs=0A=
=A0create mode 100644 rust/syn/stmt.rs=0A=
=A0create mode 100644 rust/syn/thread.rs=0A=
=A0create mode 100644 rust/syn/token.rs=0A=
=A0create mode 100644 rust/syn/tt.rs=0A=
=A0create mode 100644 rust/syn/ty.rs=0A=
=A0create mode 100644 rust/syn/verbatim.rs=0A=
=A0create mode 100644 rust/syn/whitespace.rs=0A=
=A0create mode 100644 samples/rust/local_data_format/de.rs=0A=
=A0create mode 100644 samples/rust/local_data_format/error.rs=0A=
=A0create mode 100644 samples/rust/local_data_format/ser.rs=0A=
=A0create mode 100644 samples/rust/puzzle.rs=0A=
=A0create mode 100644 samples/rust/puzzle/error.rs=0A=
=A0create mode 100644 samples/rust/puzzle/inode.rs=0A=
=A0create mode 100644 samples/rust/puzzle/oci.rs=0A=
=A0create mode 100644 samples/rust/puzzle/types.rs=0A=
=A0create mode 100644 samples/rust/puzzle/types/cbor_helpers.rs=0A=
=A0create mode 100644 samples/rust/puzzlefs.rs=0A=
=A0create mode 100644 samples/rust/rust_fs.rs=0A=
=A0create mode 100644 samples/rust/rust_serde.rs=0A=
=0A=
-- =0A=
2.40.1=0A=

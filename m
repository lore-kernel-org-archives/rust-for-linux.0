Received: from mail2.hpi.uni-potsdam.de (mail2.hpi.uni-potsdam.de [141.89.225.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77481B87F3
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=141.89.225.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232948; cv=fail; b=b26MtywuCG6qJMtcCaZeFi8O++O+BUVRUOErcsMDaLk75jxg8KtKqP4KriqOZ9yLQ8JLhEX6Hqb6K+8q1Ojq+Q2NfYSIlgjvHjUQhwYLX/XsaFpfKlUn6PCSfXJ+6kQqa8aXYWoE9dGxKvnefCf2Sm4znu7q10QVIeYkyLOxz+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232948; c=relaxed/simple;
	bh=KqhvgZGfGPEwHHDXGlbJq7/5uY1a+SBvNu1SfW8btlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=If4Wb9pSy7PSKD2cO9w09b9FH2TxakRnZbHHz1ZmfbWF7NGIm9fYZyhs1UNAfYBT8J5C+uxiSBOLgHPlNQkTGm9R+eKJmc00XEHqBYvShIHHhS94KvW49zz63b3W5iKifhKGh7OxMw/NBaEdu8DxjTJv+9JutCzFzxNKyvYcHLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.hpi.uni-potsdam.de; spf=pass smtp.mailfrom=student.hpi.uni-potsdam.de; dkim=pass (2048-bit key) header.d=hpi.uni-potsdam.de header.i=@hpi.uni-potsdam.de header.b=Yz44FHs8; dkim=pass (1024-bit key) header.d=hpiunipotsdamde.onmicrosoft.com header.i=@hpiunipotsdamde.onmicrosoft.com header.b=YRev3Mr7; arc=fail smtp.client-ip=141.89.225.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.hpi.uni-potsdam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.hpi.uni-potsdam.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpi.uni-potsdam.de header.i=@hpi.uni-potsdam.de header.b="Yz44FHs8";
	dkim=pass (1024-bit key) header.d=hpiunipotsdamde.onmicrosoft.com header.i=@hpiunipotsdamde.onmicrosoft.com header.b="YRev3Mr7"
Received: from MX2018-DAG2.hpi.uni-potsdam.de (unknown [192.168.32.22])
	by mail2.hpi.uni-potsdam.de (Postfix) with ESMTPS id C5CC04445F;
	Thu, 30 Jan 2025 11:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hpi.uni-potsdam.de;
	s=201701; t=1738232539;
	bh=KqhvgZGfGPEwHHDXGlbJq7/5uY1a+SBvNu1SfW8btlE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Yz44FHs8TQsxv+iFRAoFutJ1GaacYbtVdj4wV6zVpeoQYxS0FKwavOjIhc+UsTFwt
	 PSTt3Tm3A+YDKP28RJJW7faA03yxYP4wF3W+6EBDgusZKrphG+7ZrXH+kNweLZvFhJ
	 JLGJcFAzlv/bAl1QZYNA+pekLUvByRybAMv08jRz16K3NZwJTwZY3qZmfBbSU5r025
	 LwcPnRiRfuo9W+VtUm9twHSFFwLESPVIFAXAqeLFkEXUmvdQmWuFStP2KqL2dqeXu9
	 lfjYLaMGsdr+S/r2bodjv1BygLTqTW8+YOWIhrhJbujkWPa4gKshtp9tgEP8MKEgi1
	 V3U/0i4+iMGUA==
Received: from MX2018-DAG1.hpi.uni-potsdam.de (2001:638:807:200::b:b) by
 MX2018-DAG2.hpi.uni-potsdam.de (2001:638:807:200::b:16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 Jan 2025 11:22:19 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.112)
 by MX2018-DAG1.hpi.uni-potsdam.de (192.168.32.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39 via Frontend Transport; Thu, 30 Jan 2025 11:22:19 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhS08VxJUC+hU3/VVZq+pzq+VJARUkfUH/pOZisTkbq49nJ6jICy2FysQJUUCPb2Ri/M3u0zH7XYrcN/5GTAZE3f7T9hcUtPRYn1Hx83mKdJWXJr5VbsqAa4BAlUHxHo50M3OyS0m+gowNLWFOCW+a57AZK1oZQ7HHFlxuFJ97VeyeAyKgTmewSu0qKQpLkukzFQWYqA5H3WB40y+6e2zIjO4fntSbRhkDd+0Gs18fNPGQjxRW6f3diSyNE/vvazR9WpegW8zGg2Z7nDrsi4BKz015hVceXH4/+W08Vho/tQDsgn42uBux9wPjAKaJbRT+xTEnRyK/gmfYkmNgizCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqhvgZGfGPEwHHDXGlbJq7/5uY1a+SBvNu1SfW8btlE=;
 b=E2bDIsER6OYF6zM84GScs0Ef0rRUExDsv0gvXUekg+2m/PzXQRSJGjaf3ECxsR9U9X9mccQQJOhKMawSbaZu9iklCyTQSW5JPrZWPTqDIuUPO6GXjv/E5fb5ppeMubbQubhBftkRslyyqS1NPgYTpFAEiuQQf7qlG9vHXlXXdab111DaxcYgBGHCj9R15lOx4ynK1Jx/xthM8XcUv1qFFyMIL+mUkUh5tn9pmtcPsMfzVpPzDiuazqHN3ZBo7Ki0zFHnu42RcwoibhR/SaLE6ajTMh4mJX03Lukauo1Keiiai/gCKFGbI+KPpa64aIgsNMA9T1LOaDiCx8iczpzcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.hpi.uni-potsdam.de; dmarc=pass action=none
 header.from=student.hpi.uni-potsdam.de; dkim=pass
 header.d=student.hpi.uni-potsdam.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hpiunipotsdamde.onmicrosoft.com;
 s=selector1-hpiunipotsdamde-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqhvgZGfGPEwHHDXGlbJq7/5uY1a+SBvNu1SfW8btlE=;
 b=YRev3Mr7AWEePj4P6T6Cz5SABLB7vCA5bleZZB3oBV3n/IZT4UO4ZIiZ89s36nsiDQjmtIGDC1KgbcX6X+knrUOEKl1VhpMq5iBCySkcS8uRI2SPBf2xsy4DC1VabavzQvY1K8IZzb0iQsCRPytDHY+aaFjStvmH4x8SRGvE1E0=
Received: from VI1PR09MB6686.eurprd09.prod.outlook.com (2603:10a6:800:1d2::11)
 by AS8PR09MB5782.eurprd09.prod.outlook.com (2603:10a6:20b:535::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 10:22:12 +0000
Received: from VI1PR09MB6686.eurprd09.prod.outlook.com
 ([fe80::d320:bcd9:7515:37be]) by VI1PR09MB6686.eurprd09.prod.outlook.com
 ([fe80::d320:bcd9:7515:37be%4]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 10:22:12 +0000
From: "Raediker, Florian" <florian.raediker@student.hpi.uni-potsdam.de>
To: "git@flra.eu" <git@flra.eu>, "aliceryhl@google.com" <aliceryhl@google.com>
CC: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
	<benno.lossin@proton.me>, "Tiedt, Clemens" <Clemens.Tiedt@hpi.de>,
	"gary@garyguo.net" <gary@garyguo.net>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "ojeda@kernel.org"
	<ojeda@kernel.org>
Subject: Re: [PATCH] rust: kernel: update `container_of` to not require unsafe
 blocks
Thread-Topic: [PATCH] rust: kernel: update `container_of` to not require
 unsafe blocks
Thread-Index: AQHbcwDT0vpjCRtNQEi6wD0EE0uCEQ==
Date: Thu, 30 Jan 2025 10:22:12 +0000
Message-ID: <8afd86b5d2d280b2347dfc4c6bf346f932da294f.camel@student.hpi.uni-potsdam.de>
References: <20250130101115.124132-1-git@flra.eu>
	 <CAH5fLgjR3H4TXncHfRpsmeFTv-wy+nKbLZognPWY+JukY=h0pA@mail.gmail.com>
In-Reply-To: <CAH5fLgjR3H4TXncHfRpsmeFTv-wy+nKbLZognPWY+JukY=h0pA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=student.hpi.uni-potsdam.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB6686:EE_|AS8PR09MB5782:EE_
x-ms-office365-filtering-correlation-id: fa710be1-0e70-4af3-8edc-08dd4117f5f5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SFNVK05GWEYvNlE5NnUvZWh0d3pFZFBCYk01SkNHQm9IN2JxcEFZYjRxbEZL?=
 =?utf-8?B?NlowQXBBaFFDcWNtSERwZ05WNkVJMVlDVlFuTFljQWhqRjZGR3k3UkdSRVRU?=
 =?utf-8?B?MXpnZEJaaWtkbjJhcnRqYTNFU3MyTldtaVZaTGdYb0lXek5LQ0hicm9LZERP?=
 =?utf-8?B?Zjk2L0FTK0grUHhZaXBNK29jam9YVmp1QndDVnI4MXBOdHB4NE5pT281Qk9h?=
 =?utf-8?B?V2ZUZFd3VkZxZWUwbU0ySUhHMUtsdVBuRVNpUlhZTTQyZ0NuY2lHajFRazJt?=
 =?utf-8?B?cHBsbkQ0YmQ4dUdDZjdpUTUzOXFzQUpBL0tUdXFldS9qNW1PeVB4SE05a2dC?=
 =?utf-8?B?K3hOMXpta0NQMlpwRC8vMi8wb0pMUXBmWUUrNHkxRE5vbSsvS2gwUXE3R1I0?=
 =?utf-8?B?ajcxQ3RXS3dOenM0dDJmR2o3bFVrY2RBTEExQkVoOWF0MTJZUUdaUm1Ucmpt?=
 =?utf-8?B?OUl0dzVnV2s0R0VoOTM0akw1b0szWkQ0eTU5cXhKdlQvN0hUSCtYMDRZR09B?=
 =?utf-8?B?YVoxdnFjZjVLZVJWemFscENMQmVBQktyR1pMVU4xSG1RNFRjNmN1TEEzZXdO?=
 =?utf-8?B?QWZoMW1EdGtzTE1VSXhoVGxlMUpicHVRT2lqWVdNSlNucndSSTZUczkrTEx6?=
 =?utf-8?B?TytCTkM0U3B6U3pQVUtzV2FLZUNFYUtsbnllSEZDNFIzQ0d3WlUyb3ZISUo1?=
 =?utf-8?B?RFlxbTE0VSs0clEzMEljZ2kzQ25YZlpCQjUvREU0a3RHK09mWjhjRkYvWjFD?=
 =?utf-8?B?cnZ1dTRMQXBrRTN6ZlJoNGE5Y21BZURMZUgwbENuUXNMNWVlU3kwaUJKcXMz?=
 =?utf-8?B?UXFnOTgrK3VPN1ZKVzJuaXViWDgvZTh5TTl1cTlFUkphRVpRcFVNRTFydkpW?=
 =?utf-8?B?MEUwT3dLU0R2bk1ac2hxUk80RVZTblV2NGloR3czemd1cWozUlVNWUJ6VFor?=
 =?utf-8?B?ZDBvSDZHSTBOdStFSXM4bkIwZEhqaGtoOWZHcDF3SDNqbFFLbTR3OWNxbmow?=
 =?utf-8?B?TmdMS0RGU3I5SHdUMmN4bDdzZ3VhVnlNdGFHOEtJbGtTWVJhdlgwT05ySkZj?=
 =?utf-8?B?aEg5a2NJZGhDSlM0WlF1VmVlcW51RUVicGNkQ2lnWTNxWVNJSFpQL0VkZElS?=
 =?utf-8?B?azloY2pqVDRncVR5SHE0WmFncVpBeUxWWTB3VGZtMmVpdUZHR0dVOVdNaGxt?=
 =?utf-8?B?NURzRWNJV0dWUGZOdG8wRHVIUjZXUlRVUWFBWFpEU3dTODFzSG9Janp1THp3?=
 =?utf-8?B?VGdpdWFQUEU5Ry91dlI4SGk5Zk43cGs5QllCWC9XQThtVWwvdHk4bW8zTklZ?=
 =?utf-8?B?Sm1lK3hLRG9DR1pVRjZrby9KaVRRaUs0UWNzMit4Q0lLT2JOSVNRajJkYjAy?=
 =?utf-8?B?WHZZaVk5Y3QycjFlem5UcG8xMjlNSEQ4TGJuZmNLb01wUEZHMnJyNFUxZkhQ?=
 =?utf-8?B?N2ljbmNGenpjVVo4dFhLOE1LczlpdmtFdVhZWXk2ZHZzeVRHVktxUmNmUXE5?=
 =?utf-8?B?U1FZcGVwOVdiNkhqUlNLTEhQUWVTR1h2bGtCR294LzNXZVNkUlRSTTdsemhL?=
 =?utf-8?B?Tm0zSGxiVUhDcVI3OXplODFHajVsems5QnVLcXJvYnQyRmt5cXVld0Z4T3lj?=
 =?utf-8?B?eXNrdldRK2ZjdlRrUW9VWis3bFkwcWg3Qk1zSW1IaWNMVXBESFFoWUZCOWVu?=
 =?utf-8?B?NzdPSjMyU3lITSt6eW1HRHdmZHl3c3ZjcTIvVW0yNTU4d1pqOEN3bGxiWnJO?=
 =?utf-8?B?TXFSclp1M2F3ZEdMYzgzZjdEb1VIM05lUHVKRzExbFcwVHo0SSs5M3JaeXRu?=
 =?utf-8?B?YzhENU5DZjcvNDJibFlZNzRFL2xWUEtMdTcyUnU2RlZBL1lCOFowMHIwTGg1?=
 =?utf-8?B?QkFmd05ZMGlYRzg4QkJZMnpGUEhaeUxYM2ZHZGgyNWYvL3hrVkJUSFA0VGZ0?=
 =?utf-8?Q?8s16cOZZyGxOpBO00cAS4VT4tarmyqNy?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB6686.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ui84Yi8zOG1tQ0hMb09WMkVkUVdRUWhGLysxTzVrV0d0NjVtZUFhejR4ZWVN?=
 =?utf-8?B?SWhTTnY4TEd6VTgvWHk5bFVSdHhkam9ydEZEZHVmY1luanRNM0EvSklmRGZm?=
 =?utf-8?B?UnRxZ0R4TU5SeWRHL0c0ZHc0dGMwcVVxdWU5c1lUcG9aTlVqS2JMVUhRN2sz?=
 =?utf-8?B?aGFpMVNCb01kU280ZzNQVkw0VDlBMEdzRFVzdHJXNFZjSEluM1ZtUS9VUDQr?=
 =?utf-8?B?QmdUME1Tb2x3cHdWUk14SWpiT0k2ZU1DbUhZbm9BWjhJZGZSWmxjbXVDNnE1?=
 =?utf-8?B?UlQ2UGJXdkpuU0tTbDdYY1YwTjNtVERVYVVpUWhtWjhhOUIwT0ZuRkswcTlQ?=
 =?utf-8?B?czJwOVF0VHU0TUxpVkY0MFR0R0pEbWg0dGZWRlhLS0xZSVR4K2kyMW5OVEFG?=
 =?utf-8?B?ZnFRSFpJZ1BienB6ekdPeDF3amQ5US93NTIrTmpYSkdpSU0yaDZ0Nk5sZXdE?=
 =?utf-8?B?RjVRdXdVOFNJbXdGdkJId3BuWllvYlFXT3cyZytuQ3dHaEZpamFPbm52NWQw?=
 =?utf-8?B?MWZsNG5obVBVaWg3b2pxNDFpKzRYUUkwOTVwZTh1ZWRndnVEVjhSa2swTWdI?=
 =?utf-8?B?dXBhelppQUZNMHpYTVRmU2lTWEZCMHpid3h0VUVTcnFsYU03WkoxaEtHVDBN?=
 =?utf-8?B?Z2V0T1oyam44RnFnZEgwYW5qQ1g4SWdOc1ZiK0pYN0N3VUVpR0xwOVluN2Nz?=
 =?utf-8?B?MFl1a2lIRzlMaml6OWkvWGxhRVg1SzA0QnQxNlhON3NVaWJLNE9FRyt5bGVt?=
 =?utf-8?B?cFpYSUMzak1PeWo4RFZjdzRXVmFZTVR1OTZNOHdYeFhSaGVJaUQ0RU5OS0o2?=
 =?utf-8?B?ZndpNC9DZmxsTzlPUXROd210MmhLYWtJS2diUVFSd0RkaEsvcWRjYjMxQ0dx?=
 =?utf-8?B?L2QrbUNoSFZzNi96Q2dpK0liUm5lRTl3MnFTWmRlTWJ3Ty9zRkRMK25pQ3V2?=
 =?utf-8?B?M1p5MEZEWmVHczlvSGJvaU9ET3ZCbi9FVFAwTGFoMDQrQ091cXJTTmxtTjRz?=
 =?utf-8?B?RDhQMzZ0U01pM1FJZW5QbFUvMjdROGtPNGJkajRoL1VDUkx0WFllZnZET2gx?=
 =?utf-8?B?cDVxV0xGMmYyN2lwbzlkRGdWTjdxdXJ1cTFkTnQ4OUlxRWpSRUI0cDhvM2VW?=
 =?utf-8?B?NUJlM0RPS3RPYSsreDk1aGhtbmlmNGljcldsWmZQaVlIYjBxUExlMUhtQlNy?=
 =?utf-8?B?VVZXYlFJb1dpeDVPRUFUODk2KzNKQnY4dWN0Rnk0MkNBYUtzUUFkNXhpbWtQ?=
 =?utf-8?B?R2pJaHdISjh1WnZNSCtTT2lmWDdQdGpsNG1oY0s3QmpNaHNpdnR1RERjQmQr?=
 =?utf-8?B?QzhEeXBJVGR6OEp3Ukw1aTJWRkxVZGY1QmRrTjR1a2lmUXJ0V1VxZUY4VG1P?=
 =?utf-8?B?VXcyV095empYVkhsVmV1aHNEdTJ2cGZPanpVM0xnMFl5MVpaZy9mT1VCNXAy?=
 =?utf-8?B?UXdQaml6L3IxbFZqTVFDcmNnc3M1TXF0ekZQUTMzVTNNdjZ5YVZaelJCQ1dO?=
 =?utf-8?B?a25RQTIwaDI5TDdXSmh0V0R0UEVIK0dBMlJtQ3VEcjY4S2cxQm5IWGxMZGNX?=
 =?utf-8?B?MHpLMXp6cTFzQjJWZG9qcG5TUi9RQkRmNlFwZXppd3ljWVk4aURDcTUrWmZD?=
 =?utf-8?B?YitNcEtaWmY0N3c4WHBzbzJDbnNlQktmRFJFQTZsdkg4WTI1ODFRRWhnbXBU?=
 =?utf-8?B?QzN0RWNSb3Q1NXFCeWIzdkEvNFRkTGZ2OE42M1dMMGtJbE5JY1JNSG55QlpZ?=
 =?utf-8?B?dGNnWjFPWUpnVzBCWUpRekdSSnUvZXdWRHh5VkQ4UjY1U1I3Wm9QaEN3ajA4?=
 =?utf-8?B?ZmZaWXVybERwd0RURkdmOTI3ZGh3QXQzbXFJY1c2RUpERDVlcG5TeWJOSy9D?=
 =?utf-8?B?eXFNRHViQnJMaVd1K05NNnhqcnd1UzFDMFBhWjM5UVMzZm1ENjN0ZmE3T0U0?=
 =?utf-8?B?VCtiZ0IzbEN6cmU5SG11OUIyWDFZMFlYTEZQdWdrWDBMNlM4WnIvR3JzNElH?=
 =?utf-8?B?RVo4Q0hRZUtReVA0SzZWakE1dkxIRnFVMFRDZytHcGdwZlV3aWNRSnBjU05X?=
 =?utf-8?B?eThydENpSjFMKzBmU0FXa1h1TXg4cTNJZEJNajR5VFZGZkd1eEIwZFQwTmp2?=
 =?utf-8?B?ME1ENWI3YzBLbzZSRDRXWTBzbmh6RjNUMmQ4L2Z1Z1FIOVBRSGFsOEdhRkVK?=
 =?utf-8?B?bzdlZmI2UVZuVmRRRUwyWTFKVjJCNit0dnlYSm1Jb2w0cFZmQUVOaG5Venhk?=
 =?utf-8?Q?OSv0AqNFFa/QLzjdS4E6ywcNdEUjlGPP4plYGy7aaQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15299F4D61EADE48B1C88855A2871B26@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB6686.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa710be1-0e70-4af3-8edc-08dd4117f5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 10:22:12.2933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 58f71140-1f49-4890-83d1-dc7bee3634fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NN2yhm9kdrdoc5FyOgjmlfempqNX/BTk8HYZ5LgT2dA8xPMqoXepiwVUXF2g+5fXclLZWeJZd83KxuwrE9Y5ktvcrFu7Z+uxFAZoKQWy0yGrgzRF/ih66JQNODa350G6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5782
X-OriginatorOrg: student.hpi.uni-potsdam.de

T24gVGh1LCAyMDI1LTAxLTMwIGF0IDExOjE1ICswMTAwLCBBbGljZSBSeWhsIHdyb3RlOg0KPiBX
aGVuIHdlIGFkZGVkIGNvbnRhaW5lcl9vZiEgdG8gdGhlIGtlcm5lbCwgSSBhcmd1ZWQgdGhhdCBp
dCBzaG91bGQgYmUNCj4gdW5zYWZlLiBJdCBoYXMgdGhlIGFkdmFudGFnZSBvZiB1c2luZyBwb2lu
dGVyOjpzdWIgaW5zdGVhZCBvZg0KPiB3cmFwcGluZ19zdWIsIHdoaWNoIGdpdmVzIG1vcmUgaW5m
b3JtYXRpb24gdG8gdGhlIGNvbXBpbGVyIHRoYXQgaXQgaXMNCj4gYmV0dGVyIGFibGUgdG8gb3B0
aW1pemUuIFRoZSB1bnNhZmUgaXMgcmFyZWx5IGEgcHJvYmxlbSBpbiBwcmFjdGljZSwNCj4gc2lu
Y2UgeW91J3JlIGFsd2F5cyBnb2luZyB0byBpbW1lZGlhdGVseSBkZXJlZmVyZW5jZSB0aGUgcG9p
bnRlciBhZnRlcg0KPiBwZXJmb3JtaW5nIHRoZSBjb250YWluZXJfb2Ygb3BlcmF0aW9uLCBzbyB5
b3UgbmVlZCB3aGF0IGl0IHJlcXVpcmVzIHRvDQo+IGJlIHRydWUgZWl0aGVyIHdheS4NCg0KVGhh
bmtzIGZvciB0aGUgZXhwbGFuYXRpb24hDQoNCj4gPiBIaSwNCj4gPiANCj4gPiB0aGlzIGlzIG15
IGZpcnN0LWV2ZXIgcGF0Y2ggc3VibWlzc2lvbiA6KQ0KPiA+IEkgdGhvdWdodCB0aGlzIG1pZ2h0
IHNlcnZlIGFzIGEgImdvb2QgZmlyc3QgaXNzdWUiLg0KPiANCj4gV2FzIHRoaXMgbGlzdGVkIGFz
IGEgZ29vZCBmaXJzdCBpc3N1ZSBvbiB0aGUgaXNzdWUgdHJhY2tlcj8gSSBob3BlIG5vdCAuLi4N
Cg0KTm8sIEkgd2FzIHNpbXBseSB3b3JraW5nIHdpdGggV2Vkc29uJ3MgVkZTIGFic3RyYWN0aW9u
cyBhbmQgdGhvdWdodCB0aGlzIHNtYWxsZXINCmNvbW1pdCBtaWdodCBiZSBhIGdvb2QgZmlyc3Qg
c3VibWlzc2lvbi4NCg0KQmVzdCwNCmZscmENCg==

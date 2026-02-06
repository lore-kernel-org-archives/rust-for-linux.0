Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A1426D23;
	Fri,  6 Feb 2026 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770404614; cv=fail; b=VJIVdG7Y/B3VGu7468Ot+eBETLp8gGeqM2WWBZaBQrczChScTdzwG7R7a6mh+2fhjEr0wr0/xfX5tgQzPA2OTgp2HoPEDrM91ekYx54ZOX+0C+J7lU5I0nreLNN6ClJ2DuCR4k7vbFRn1k94UVH6SPPzPXTVPPpCQAOPcRh8fRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770404614; c=relaxed/simple;
	bh=mttz5NxxEUfcO5IIh1SDGUTwr/LxsWSdI83LLUySjYk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JMDPcigYuU+hcInckNnczUqcgX6RonmwJsvDWC8t+DgzpPb96OP+3SGubccigTusyCJ2RiHUIX8dSQp4IVVaeNQByhZz1pvXFhtKefPWok4dxckxZipVTsvPcceS7z3Kz/79g8wVzZhza2OrML1sFtlzJ2LdmA4PzcyNzYDb8b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RpJnHPKJ; arc=fail smtp.client-ip=40.93.196.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RpJnHPKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odLbAAGKufD70uKUzZ/wwjwyVxzFn2/RancnS06YoYSw9ruTNG431KXZ4UvvHtXuIMMqZJ8XVkv2PUisVYHiKOPH8SK6R3YxVbHKT/izqcyhvhogtkIY6BXRiR5BYAhP6U6QmcHJLd7d93TORIQBDpjxILIns/fJ5oJtRe4lM4E0eHqI6IS9jkT2/v+R/9DDciP8ZPePiK/O8MlowknYqyRjiSGCs/8eW9s8CTaFtRuzqIpjRdGeUQRVvd0lJJKJ4GAY4MSZvuVObKVuIzkidWIAcfFNFFMQPXGwgYx4W15xm0oqiTu800T3dluooJU5TbpEzBwRGS/BRviw9MqWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mttz5NxxEUfcO5IIh1SDGUTwr/LxsWSdI83LLUySjYk=;
 b=Fd38KrhE+ZAIwgJMRUNYk+CNI6VM+fIJzkqvnOAv3KCr7ie91r0UJGSN/v3PPlVSLpBoWcB6Yg+cPmD+Wr3rhTWOavO4ELImLQZaFKb0K5NOkhreXWs30PW6dsGTDitPfOjxLRB/s25Mh/rO4GhTwlhmd7vrJmApH3RImzXOUT8oLnRDfPoqNa1rRvVwoLr3NJUK5Xlr3UVSIIl8o9sKWZDLwfWhRZdwBVUUoGFHxFODUM82E8TE/71ELcwtVI2zoyB+8yparP60mJI2k+iFEuFXFqDltPt+3lujpaNN3Q780W62MgPOmychL8DtcP3HbpCSDnsY1LHVt5nWBPZROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mttz5NxxEUfcO5IIh1SDGUTwr/LxsWSdI83LLUySjYk=;
 b=RpJnHPKJTbfgPAK24HIBLQs0BRZUefoDgLqEMn7pZAtFYF1PY4NP0O8B7Z2irOlukU2DIqE86IeUeJg9W9o4Ap5WoRSmGmCrAVskmEAzupHKtocuXc6pX+BTXB9yhAVQ3W7JnzCkKIOrs1ftgbmlrUa5IoD+fQX6hOv4K9JN541wWthJUX6slFBTvesoOP3N50YE7aG3fX7ugRgBWohUBxRraojglf5ItHBxoR95lbqhd9MDkmqQJVdRM42Azl44zWnZTdW147+dUMkH5hoYdMsxpjP4TUVRASW9ndZJsX42AE7Hk+VUkbXS1jnrItLkXXjLq8zkhn+9mcj8j1WMnA==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by CH3PR12MB8725.namprd12.prod.outlook.com (2603:10b6:610:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 19:03:24 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 19:03:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "aliceryhl@google.com" <aliceryhl@google.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 25/30] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
Thread-Topic: [PATCH v3 25/30] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
Thread-Index: AQHclyAkmWK0RAA+JE69UBdCxdqUebV2CEYA
Date: Fri, 6 Feb 2026 19:03:23 +0000
Message-ID: <6ae11f5dc8fb4058fd4f05ec7dafd493a6df5f22.camel@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
	 <20260206042123.303281-26-jhubbard@nvidia.com>
In-Reply-To: <20260206042123.303281-26-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|CH3PR12MB8725:EE_
x-ms-office365-filtering-correlation-id: 23b3b967-6e12-4254-1892-08de65b266e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RDdRT0FNSzc4UDJOWGV2OHYxa0dVckFRMHNlKzBmaEtCUkk3N0tkeEQ4Rk9l?=
 =?utf-8?B?SWVqSk1OVkVLaWRsb2xSQ1didlRTMXFuWUV2cnVDampVSG5yNHBaRUVIQmZu?=
 =?utf-8?B?TXVvVHdIT2JNTDVhSUJacys1cktBcnE5WEphY0xLeTkzYW1GWHhVbUllVFpR?=
 =?utf-8?B?RG9ZWE1LUDJ5cWdJMjBSTkZjd0Juc1MydmN5VThiU1NoNVlkUHdjVStxNnhj?=
 =?utf-8?B?Ym00aGVXMjEvQnYzaDY2NU9lRUhFRHhRckRWODArR1dPU3AvS3JHLzVHNldn?=
 =?utf-8?B?NTM2dkNPaXpqdGhkVnZjcmQwK0xyT2p4Qm9SMjVTbmw2VU5nRUJ0SjcyZW1m?=
 =?utf-8?B?OFNTbzBTY2hYdDRpVVB0c3BEbkhTZkQ5WlcxK0lvTFNkMUtzNXlZR2NIVXpG?=
 =?utf-8?B?WnovYi9YdVNCcVYwWlUxVW1Bak5vWHpGakphL1ZtczJ3Q3hveURwWk5rRXBy?=
 =?utf-8?B?cEIrRFJSeERKQmlld0MybTIxUnNqL1dPUno4KytxSFE5NitvRTVsTzF1aTYv?=
 =?utf-8?B?c0RIVGN3MTlSeEF0OUZqUksrTzZnUFNlUUpYbjFqMDRyVHpjM0M0QUZqN1ND?=
 =?utf-8?B?TWZvTEpCZnY5QTNvZ1pKcXhjUXpydU9VL2M4d0lFeFpMclhiQWs5RXNiS0ZX?=
 =?utf-8?B?aWIwejhUU2FqbzI5dXlpaGhUUXlkdlFyUVpuakJOajM5LzNpUnFZZm5IcWtl?=
 =?utf-8?B?WG1DVWprL1Vwb3BCb2JBc1JaeDRIQUQ1eUhidWQzWUwxSFpKZXFLVUEzOWJF?=
 =?utf-8?B?TGtyd0NCYTl5TnhXSHdjOW5wOTV4c051TzhXRmdVQUZSeWpVN3pKeXd1c1Ro?=
 =?utf-8?B?TjFXVDZlVk9SK2h3L3Y1SjB2aGl5b05xSFVjOXpFcDF2UnYzaXFVRlYrTjdq?=
 =?utf-8?B?NjdWdlhmUEU2WWFwdVU5TTdKRHZ2QUlRQ2V4NXZCY25qVGZTUi9Rc1lXbE8w?=
 =?utf-8?B?K0ZzbWdaN0FsUHRaKytGemF3anUzL0JzUjZSTEwzTWtBNGZpL0JTUUpFWWZD?=
 =?utf-8?B?ckQyQktpdFgzeWg4ZDhVVVlUOHM4cTNnTjdFVEh3WE1oYVFHMFFQTCtqR2lj?=
 =?utf-8?B?Y0YvMzdQSDJFQ01XdDZGUHp4RXRhSTNXVktiUk03b1BwcFZvMm4yWFZQRXJI?=
 =?utf-8?B?bm9YeGNMRHI3SHNDUWNaQzlZOFNqb2FGR3pYemNhN3JSOFhqb3ByWTR1VUFX?=
 =?utf-8?B?OCt6ci9abWNxY1l3RytoSVozaFlMeEZ3b1RsTzcrblI5R3hac3RRS0Fld0xr?=
 =?utf-8?B?M0czaTRMN3VLeWp6VEsxejJCZmxBbFJIRkNMUlVWbEZpL2ZzSzJIclNWdHlr?=
 =?utf-8?B?VEdaenFjOHVPVFhYUFpCeEdaZHY3UjgzWjVaSTVuMjdFaGZYYWJwTlVUNkVB?=
 =?utf-8?B?aTBrZDV0WU8ySGU2Mms2WlRWZFc4cFF4ZXV6N0FLUEpKQXhJbjhrRUZsa0pl?=
 =?utf-8?B?ampwZ1MzQ2JFZHNtRlVPSHJzRVRHSEFKZzloQkdGRmhEV3V6NzZGSkh3K3FQ?=
 =?utf-8?B?NXdodGx1U1ZMWWdPdUQ0VFFhcUV1SGgrQ1BmSzByU1kzNzFmbWNsMVltMG1I?=
 =?utf-8?B?U0w1ejJaME9oZXVudmNEM0xOaHo3ZExpc2FKU0RncDF5eUFhcWtCalI3MmdT?=
 =?utf-8?B?eVVSVkNZQzBkR1VPaWl5RzN4aGtlN1FFNG1uMENtVWlaMXdJdjVjbUxnZURn?=
 =?utf-8?B?bXJ4anhReFlidUlPaTVFYVVibTlMZ3lhb2N3VnlxTVRieTI5dWVod1p5dkJh?=
 =?utf-8?B?aklldVJBZ1pzNlM0UVNPTk4zT01jQnc0b1hUQ3QyWmRFUnFLbnN0ZVVZUnZ2?=
 =?utf-8?B?WE1YOTFuczBNeXAzSjZYZ0ZETlhhSzlibzlna1JmOHVtb1VvQ2dtVnRPbmhu?=
 =?utf-8?B?SG1vN2FMNElpMGl5bmJsSFpsZFZ6SzRMNXhTblNwVWE3VkgwQkVxNVRvcUZW?=
 =?utf-8?B?ZnBWa282RkxLaEhOOGtKaFlaaVpNWjFzNzVBVnNpTmZ3ekYyWTdnNXM1TkhM?=
 =?utf-8?B?MWZmY2FORldGWDZmMk1ITU9Pemh6OHpOZ2xYS3FpNEhFT2R0UlFGSktKNm9t?=
 =?utf-8?B?bnhYUVFzTWZMU2xIMWlhb3k0OGRPZ1NqM2t1R2JQTFhWK21WY0FMaXp1M0dC?=
 =?utf-8?B?TVNyTmgvQnhEWDBseEw2bjBPcTFMWVlqT3VselJQOC9QbEhpY0xrbWlodjJS?=
 =?utf-8?Q?tiQR8sXNsC/r5lHrqKBPPYw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHpoTVZXbUpIbE1rdjFnMElSaWFqUEs5ZnFQeFpJbzJSMGVURzBSSVJ3NnRr?=
 =?utf-8?B?cUliK0s0dmNCek5oeERGd1lnMWlDOWFRdjI4UFhuYmt5K2NUM1lrNGhtTnB6?=
 =?utf-8?B?RjBaOGZiL1R4RW9ic20wWktRZXlBZHIzN25PNmQ1N1EyZzB3NWtKazBUKzNk?=
 =?utf-8?B?aFU5QWxMaVFIZXUrcHBtdERGdHVOQndNWUZoMHU2U08wbTJ0UmwrRVk0VFE1?=
 =?utf-8?B?MjZxUFQvYzgyVXRFWk03VVVHWWVaclUvOWtjaFZvdDliR1VBQ3pNbW1VdEhF?=
 =?utf-8?B?U0lqYm0xRFgwVGZkU2l5alBCVndReS93VTQ4K0RLSURlTU5TNDVXVHRSSWM5?=
 =?utf-8?B?N0dKNk0xd0dXMkRDbGZueDlETHRNZUZmSGo0TWZOL3ZrM29YQmk3cDdON2Uw?=
 =?utf-8?B?bysxMmxJeDZoQmZWcUx4bUgydklnWGtXam4vRnJKalFOZkVGaFZPWGVxV3Nq?=
 =?utf-8?B?SDBtUGxUUDNTOHZ6WmRVR1FacXJ0aXFuYkN1OExBM0gxbUFiNFBaaGl1dFlR?=
 =?utf-8?B?MFVVdUpLdGh0VzA4VzlsRVpXV1BnRFRnRjNRWVIwSVJhc0ZzSjFRQ3RkSVRW?=
 =?utf-8?B?QXpyWWNIa0VWdGp2ei8vZ1FlVEt5MEFHMi9BYkxWNndqcEwvOTFPV0tLLzh0?=
 =?utf-8?B?YXphb1BFR2pUY2NUS09neklzUFV5SlVTdk1rMHNlbjRtMlRFYmdETmNoaEF3?=
 =?utf-8?B?ak41QkNuamxTNloxK3ZZNzk0MVFXMVdxcldhKzZUcVYzQVFJWmVPdFE4RmRR?=
 =?utf-8?B?QVRwL1RpeEFqR3FsSy9XOFVIK2ZHOXlSYU5OK2NHVHBmRWhsMENXQlFFazNs?=
 =?utf-8?B?emRvektZcy9QK1loblJXZDZCdndlbnoranVFVllzcmw3Yit3WlF5ek1kMUdI?=
 =?utf-8?B?R0JOTTBScm5qQXZvS0cwemdpRG16NTdIQUhkMGdZZVhCRm5MNUxBcC9YWEYy?=
 =?utf-8?B?SkhuZEo4SnVXREN6Z2lONnI2QUFqWDNJZ0xiL3AxWndWaGk3OWhZc2kvbXRn?=
 =?utf-8?B?VGhwNXR0UHZoVkhsNmlkT25CYTUrUHVzUnd3VGhwZnpQczdFcWNkMUdCVlVV?=
 =?utf-8?B?QUhjMmRGdldUV3YyNkY5c3NUV2Q1eEZ5d3hPcjBRaWZIZ1NlSXd3M3BWV1Rv?=
 =?utf-8?B?bVBsaFZuaUFCc1RLSmF2bmR0WHRvN1pZR09UVlZSeWxHelBHdzNCQnhMNmlK?=
 =?utf-8?B?L09CbUdjczNnMVpFZDF2RFR3a3dzcHpnL3pVWFh2R0ZkOFNtR2Y2cVpUTjg1?=
 =?utf-8?B?WGhIa25tQWxycnhmclcvNkNTT29rYy9jbUEyenBFYWlQajYvSnNWdjlQV01Z?=
 =?utf-8?B?c2NNRHhIMTIzN0N5WFVOdDk0bXFzZDFCTFZVYnRNdTB5YlhISmF5SWdzNVE5?=
 =?utf-8?B?ZXlhNzdIaE40dU5aK0tTR2RoUGNlR2tOTThLbms3TlVzOG9NaFRuUThsdm5w?=
 =?utf-8?B?ZXBTR0xiNmY4OGNRd1l3Wjl5VmRMYkYvRldVUExRcDhkRTd0Y3BQUnBvTUdY?=
 =?utf-8?B?OWxBNTJ4R2p4aU4zTTZERWVINXVMbFMxSC96endONHMySkxDNldCZDdkQWJy?=
 =?utf-8?B?MnpuamNJZ3BuN3Mxa24rRk5qaDFnS3d3MWs5THowSmF1cXp5cVg3dUVneUVx?=
 =?utf-8?B?b1NwZCtrM2p5NkhEZnBOb0lTUHpJMVRCOHo1MEc2bnR0YlEvMzRPYUZTdVpk?=
 =?utf-8?B?RGVLSS9aNXh5ODdzRE9sNVlOVHd0YU5xeVNmZlJZM3duTGQ3WHg0TUlLL0RB?=
 =?utf-8?B?bXRwSG1BeDJPUHlrWW9TdXBWOHZHVmFmcis1eDA2cHVCRFlweGNXOWRvQnZh?=
 =?utf-8?B?allNNkpEMkVZRk9XdFFGNG5UdzVPL1BadlFaeDMwWStwRGFGb2RGYUJLRmVx?=
 =?utf-8?B?WnFFT3puQnUrcmE0eWhmZlZOdkZ3TTlKWFZ6bTJ2MWNsVEZPeDgyYlN5N3RO?=
 =?utf-8?B?Qk1DeFZibHVabkkyTTEvSE9FKytvQnFRcWRVUEN3d3daSlMxTXl2VE9OaWZh?=
 =?utf-8?B?SjZ3bjU3ZldpOUU5V2RNL1V5VG1hZ3MxTXF1enlNSmdUVFd0NGZkVVcrcThy?=
 =?utf-8?B?T2FzRlEyaXZvTndsTlpXU3BMOHZwR1dLVldyb3Blb0tBSVo1SWVvL2NodTRK?=
 =?utf-8?B?Y1pqQUcyT2N1S3JjQm1YWFBuNU5mOGJUakV0ZUpVRzlGUHU1MkxxdXk4YmZz?=
 =?utf-8?B?c3J0Zk44cEh2RXFzNWllYVZyVEtabEJxZ3A5K2hTS0hmcFRaYnFhZTRLK3Qy?=
 =?utf-8?B?aDFtZ29tRTRBQmpUTkF5UVFxRStwM2orRWR2ZEIzYjFROGp5VUEzaXJUbnFD?=
 =?utf-8?B?ZngvdG4yMUVMMXcxVmgxYktrUjB3MENxS0hXcXR3YlNOQUQxVU1PQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AE9AB974CFC1B4D8D162B162F96AD2A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b3b967-6e12-4254-1892-08de65b266e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 19:03:23.7443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDsGgbtgjdosEGrIiWwXkMwtMouhmQ/KbldH9c4LjjeaDDgnICCPXldOwOUJZsN3ap9rj0x0mqzrwKnTazYtLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8725

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDIwOjIxIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K8KgwqDCoCBmbiBjbGllbnRfYWxsb2Nfc2l6ZShjaGlwc2V0OiBDaGlwc2V0KSAtPiB1NjQgewo+
ICvCoMKgwqDCoMKgwqDCoCBpZiBjcmF0ZTo6ZmI6OmhhbDo6ZmJfaGFsKGNoaXBzZXQpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLm5vbl93cHJfaGVhcF9zaXplKCkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuaXNfc29tZSgpCj4gK8KgwqDCoMKgwqDCoMKgIHsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBHU1BfRldfSEVBUF9QQVJBTV9DTElFTlRfQUxMT0NfU0laRV9HSDEwMAo+ICvC
oMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NDo6ZnJv
bShiaW5kaW5nczo6R1NQX0ZXX0hFQVBfUEFSQU1fQ0xJRU5UX0FMTE9DX1NJWkUpCj4gK8KgwqDC
oMKgwqDCoMKgIH0KPiArwqDCoMKgwqDCoMKgwqAgLmFsaWduX3VwKEdTUF9IRUFQX0FMSUdOTUVO
VCkKPiArwqDCoMKgwqDCoMKgwqAgLnVud3JhcF9vcih1NjQ6Ok1BWCkKCkkgdW5kZXJzdGFuZCBu
b3Qgd2FudGluZyB0byByZXR1cm4gYSBSZXN1bHQ8PiBmb3IgaW1wb3NzaWJsZSBzaXR1YXRpb25z
LCBidXQgSSBkb24ndCBrbm93IGlmIHRoaXMgaXMKdGhlIGFuc3dlci4gwqBGb3Igb25lIHRoaW5n
LCB0aGVyZSBpcyBubyB3YXkgd2UgY2FuIGFsbG9jYXRlIGEgaGVhcCB0aGF0IGxhcmdlLiAgCgpN
YXliZSB3ZSBuZWVkIHRvIGhhdmUgc29tZSBraW5kIG9mIGluZmFsbGlibGUgYWxpZ25fdXAoKSB2
YXJpYW50LCBidXQgaW4gdGhpcyBjYXNlLCBJIHdvdWxkIHNheSBhCnBhbmljIGlzIHdhcnJhbnRl
ZC4K

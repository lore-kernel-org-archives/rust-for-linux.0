Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3843056B81
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165614; cv=fail; b=jlIN/e6sKDL3k/IO/JsbIvHlPi/9asmTHp0drsNM1Tp/fH6HQ5H/JfjbwbY4ZgpA17+GBN7yEfDn2o8P4A5dDa7Kc0FkTXSg06NyEWGfnfV/LdrA/hDnXpMKB7ef+DECeYzaN4Q01TAuF7uLgO18KjI9S+1LnZf+weLLOK2ltJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165614; c=relaxed/simple;
	bh=Hgc14xKX2TxcfMHlJBQOMRdJRrtzVUBXzkPopmRxPxk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KiuXnr6evVFI0fYFht+dH+ty8Xc2snxUMCLW/wCMNYD9tdr/C+/3pdUjPne2fRrdH83KAGZcSseUudaQ788reZ1Yv4rkklblbVUn+xiEppQW2qbl4PjQfmZVg4ubccMg6m1RU521/Fr7qIjCYgs+ipyJPJE1vRS5P7yHDW+3O+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mG+HGaui; arc=fail smtp.client-ip=52.101.62.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mG+HGaui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0aNmQlO8SoCzI0vX9mLDE/+YM5sgkwS8bPZxlR6qmgwuKx7dSUjkO2JjQ0ervxCSYDbpNGaW/57749riITSs09ibXUCjwvrUMs/VF2FjDyyPynY6HpAzRmlY6DdbAUgaimgzv1d6sj9y9FsqU0VQmWEcd4OjxHjCbGAwxr3ZvIr37Xbkh5nzT9qYO5wp2Dvhjsu3JfPorTi1Uh/b/IOBl1ONB81Ch4xSdbGZTZfu6oFu0N3V4W6/UE4zfNvENcgeb3kV0y26xEsIdXccXQtpt3An0fmj+jVbORASIej8flQHXyD1/jyvefr8bjJOXbHQR5mHbd/DXaVgMhSLu2aNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+6LqUXmY2xlto29lxYJs3sEeo51JQgzok08m5kxsMQ=;
 b=NkLmfXdEzl+0h+2m87ISQkLJU/m43iU1U1nUpIOCqPxVYEWV9keACOXXWju88gx35BnuhdUMoFocXhuY3QgoQ8DCqq/4byYWZlHZhGR0RHo6rEuwgwRefh2SHfQYfAjj9X+rUwDymElLSzWswc2hiuF/J+jJBOI9Qgtc56ot1O1WYEc9HRTa645NsSQGMMzEpqidQL9STzczKL5GKCbOhkGDSPe+lpJaNqldm4hy1YwWpt/28nsZtcuQg6vANrhVcUQZbpP7xtnAM+syrlWl+FtyNKQdFzWAXFMDESnN0n7vvJOP6370ou2tesAzfbKNOqZUBZrcixY01iIv3e8Xhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+6LqUXmY2xlto29lxYJs3sEeo51JQgzok08m5kxsMQ=;
 b=mG+HGaui0yAPPY5Dc6mgx7gg5UzAmgfxtk1Zj28GrhAv0upzEIAJ1JlXT3ZXpGbVoW91GNCmmLz82G7EoB5RLs2hQp3zAUrlM0iV05nwtnCvGpDi+yzslSNpMfDjFsURO8EHgx1DJFQhWSypkfK91cj98DHUq2saXu9D8rISEDQM9+yWR76VLfVblxzFlRxmzCNuf28W2UeKBjJInTsdeHRcToeJu3512kAYS78SQM0em3fcyNCMW7GI6Mr+8FZpd+hSIGezYoyE9SoWybTd8UqiDIGLFe+GmmCsz+wCUzMfp99RQ9IWe5WDudIidh6u0qE+9JYPoAYxg1WFJSVa0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:00:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:00:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 23:00:00 +0900
Message-Id: <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
Cc: <bshephar@bne-home.net>, <dakr@kernel.org>, <joelagnelf@nvidia.com>,
 <jhubbard@nvidia.com>, <airlied@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <brendan.shephard@gmail.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com> <aSbOWhKIpCBm0NKL@google.com>
 <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com> <aScCSnRIsRjLrccU@google.com>
In-Reply-To: <aScCSnRIsRjLrccU@google.com>
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: d6edc315-d381-4aae-a236-08de2cf4193d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEhvUlFTTG1sOTYvYnBGZm9MMTZlQUlQYnN0QThHRHg0RC9nV2pjYnZTSURM?=
 =?utf-8?B?QTR2SURkeExnS3BKcnRpRmc0RHl5ZkxjQ2NiWnVqSzVjVEJJa0VtaS9zdjdT?=
 =?utf-8?B?akhQc0N3aFFVeFJPcXFhSGYxd3VhZWQ1anpXZTdsR0NScUkwQ0w2ejE2eXJX?=
 =?utf-8?B?ZUNJQ1hhaDBwa3N1anJoTmYwNEdVVytQMmh4OGZ3THhDSzBKVGRVbVNaY1NN?=
 =?utf-8?B?cVgvK0IzMVlISW9xcEMrV1Uvd25senpkZFZyMmlIRzRjYVcyTVdGWjR6RFd6?=
 =?utf-8?B?bXhmbHhSdXNNWTA5ZGg4enF4MkhkemN1SUh2RVlKdGZXTmRXN21ZVEdDa3kx?=
 =?utf-8?B?T0RRUzVONFJld1lzb1VZTWtJNXk3K1E1cFB2S2FjK3RUcW14MU1xN0h0R1Nx?=
 =?utf-8?B?MkJyb0d5ZEs5TnlvQW5oMzROTE1vUzZxalh5MnNlUUpUWitZZDhzT01uSGNQ?=
 =?utf-8?B?UTBLRkcvSDlMWEgrTDhjWjdUam9OTmczbTl6MkJ1Q3pNZGtzUjVrSUQrcEZR?=
 =?utf-8?B?azdhR09aY1NZeXZpbjFPcVpCVG40N2ZhQkxXYWdaUkVjZHBXOUN3ODY1Qitt?=
 =?utf-8?B?YS9YRjNhMjQrK1g4RDV2d3dYc2dlZWZONHZKMGcvS2hBOEo4TkZZb05CbndZ?=
 =?utf-8?B?Q3BtdDBEV1lCbkJ5dHN4WllBYm96cXhYYXdFL2ZIVHR5YTdFVkxEWXpQNGZi?=
 =?utf-8?B?RVloc0MrZkdXMXpYOE1OcHVKdDNzOHFGZXgzWlZlMTFrZU14aEZsaGltbFVR?=
 =?utf-8?B?MG1DZi9aVFlOMGJrUGE4dzV3dlJpWnhqTUJYdEx3VFcwWkhKY3NtTnhiNGtY?=
 =?utf-8?B?QlExUDdZMTVDY1dKOVozNWtUam9Ua2VyNU1CS0xiOERxRmFyS2Jham9kU3k4?=
 =?utf-8?B?YkJROTVDZDZmR1ZiZXZWOU5IdlRrQklWV0lzTUFBRnEyZkcvTUNVY3BSN1NI?=
 =?utf-8?B?YUsrOGdwenhrZFVmNUFjTm5wMmdoR0tKYldPY2ZERWtPOEk0WGxmZzE2TDIz?=
 =?utf-8?B?cndMb2ZReEZvY2xnT3BHRjJVOXlJQ0EvcEQxN1JLVmVBUXdVQmovNmZDK25t?=
 =?utf-8?B?SENjN0d6TzRQTjRBd0NOTzJaZ1lHeWdjUmwxbmtYNFhPaVlqNXJGR295QXhi?=
 =?utf-8?B?aEdZbXhMYlhVRlU3ZnFUWk80M0RJZGxTTDJZWHZzRVhqc3RGRnZrSmtIYzZj?=
 =?utf-8?B?UEVhdW14alZrWTVuNmQwYUVERHVYUjI1YzBiT2ppbEJVS0NyQVhxalFCWk1w?=
 =?utf-8?B?aDVrdXo2VWZJaHdFb3p1NE5EdUkzWGxwQUNja3ZmSGR6QWpQOUlST3poR3U3?=
 =?utf-8?B?MWdab3ZLek4ydWd3TEg4cXhTT3Y2YVlWRERGc1p0NDNRSm5MMENuZ2RvS0hL?=
 =?utf-8?B?TGpwcE12dStRRnFWUTFHc3VsSXhYVFpZMW5wbEF4VEx6dkl2Ty9ITU1OSGZ1?=
 =?utf-8?B?UnNRYitFTlZwTXlseU9wYUpzYTcwSzVwU3NnRE9KQmNGUVFOODJpbWEzWG5R?=
 =?utf-8?B?SGF1VWdtVlJUNkxMVmxqSyt2K2hERGhXdEY2VWQ1U2ViZFg0VTBkQXFWR0Ny?=
 =?utf-8?B?UFR4MjBWYmREbzNuN2pIdkYzT3pvbXlhUFMwWThMbkIwQzNiWnJ6ckY4cG13?=
 =?utf-8?B?S0tJcEhQSzI1c1pTaHc2K1BpUkZremtXKzJ6QUkwemFSeUlZTFFVdXdSenhm?=
 =?utf-8?B?Tk04V1J0cm1rYW9jN050Y3h1ejgwRGE1R3BLNW9Rc3JmZkcrSFFFWXBJR2Ey?=
 =?utf-8?B?V1JvdEF6RERJZFRsUEZjRUhqaUFQSENieHVlTEZzbzdjbFduYVhQYUMwcTIz?=
 =?utf-8?B?VTNNdzlpNFFhZlF2U093VEQ5UEp5UGhaUTVKYzZCckZMWS9WVGEwQnh2eFdK?=
 =?utf-8?B?dWVCRmJXV29Fb0lkUnVjR2dOWWZJcWI2VEJkMVNQd0NBRzN5WUI1VUZ1WDYx?=
 =?utf-8?Q?7IA3uQ7KtVQIzrLvPfkWEWT7reB3eHc3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2dWbVduWkdHZ0ZUK1l2eDFPVEcrSStIcGdQbXprWDVMTk9xYUNLTzdwNFRZ?=
 =?utf-8?B?Nm9WeHJaczRyT01XU0l1SzdpaTNLYkRJWkpxeG03amtXMTFkWlRjNjZqR0k2?=
 =?utf-8?B?dkRjblFKMmZWWGdsdVEwN2ZyM1JISDNER05kTEhNcTBKdyttTkR5dWVjYWJU?=
 =?utf-8?B?MHRUL1krQm8yMnhDWlNlRzNOSCtVWHdHNURXRkxJOWJsOW1PNzdyM0g1UWNs?=
 =?utf-8?B?ZjlKSmZsL1Y1aGdhRWl5Wk9HZjhvdDlYNk9KcTZYanQ1dnpJTTB6REpnSzJV?=
 =?utf-8?B?WDJ2K04vLzkva05aT2YyWEE1MXJUaU1ubUFPT0xDZTNuc01RSmRiR1ZMcTlr?=
 =?utf-8?B?cE5xaVFUVThtUXRNWnRRRGI2UnBDQkZSREFrZ3oxWE9aemI0UFoyN1FXUDUz?=
 =?utf-8?B?MzI4YkJUVEdpYitxSmkwRmVxL3YxallxR3d4dWwvZFJ0YW1yZzZzeDBGckxX?=
 =?utf-8?B?ZFF2YityRHJlZWMrUkNFa2RoWHVQNXhFSUk4dXllaWxhbCs1dXc1NHNoLzhJ?=
 =?utf-8?B?K2tXRXpid1RxTnIzU2tNT2o2QWMrd1lIdUNtZGVkYWVpb2c3SW00NjlhR1NH?=
 =?utf-8?B?VzFYVkcxUHJuYy9mOEZ3Q3ZTeStiTUFtU2kyNEZWRnp4eWY3QVlWa0dKZUh5?=
 =?utf-8?B?RUtVSUNkMnJpVEZMb3BLaHJQMmJNNGxxMm4ySW1LL0ZPMjkvQnljdjBjRHY2?=
 =?utf-8?B?UC8wR3U4RXk5YmxoUmppbzBDWHVuSzdVSitQNW12OWRndWYraE04TStrM0Ny?=
 =?utf-8?B?N1huOC82VmV4N3JTZEJYL3RYQzlkVmcvODB6UEczaFBYSkFueW55YjRDcnMy?=
 =?utf-8?B?Sk1aWC9PZ1NPQ0Y5bzlkbVBScGxNd0RrS3FJOEpSSEdxNGFFcDNtNzFKbk5L?=
 =?utf-8?B?Sld1dHV6eFgzVnFaWUJwRjBiUk43eTN2TW9KcFUxelZFanRsalNHZzA5bjlu?=
 =?utf-8?B?TE9KSXFVME9CN0VJdE5XMzdrT0pEd2ZaWUJmNlkvNnl5SVB6QXVSS0FQMmo0?=
 =?utf-8?B?WUR1eXFzbU1xRlRlaHN6OVhDeUpqc1lpd0hlL2lWWWU2TU0rRWRWNzF1dXR3?=
 =?utf-8?B?QzlYaG9iWWtZRDlhRVhXNHNLWUNJdE8zVHlDU2RZcEdjeTBqcHBjTTFPK1Vk?=
 =?utf-8?B?Qi83VjNxNWNlUzFXU1N6RTVBRGU4dWxZMVkray9rWncvZTZBMGxRajlBdUZX?=
 =?utf-8?B?d3QzeVlFc0dlWThuN0hnL3AwQkRGbDRCUjRRNGpqSUJ1a3dBcktnU2FPaXM0?=
 =?utf-8?B?WmtYazlVWW5NSHUwLzVLekxxa3RRQTFGZWRLakJ6MHFrOVFBRGxaL24wcE1M?=
 =?utf-8?B?a1p6ckZyUW9EUmxQR205NFQxSzU3dFovSnZjZTIzVTVHdnBvQkNvcXZQL3pS?=
 =?utf-8?B?ZWlIQk1DcTV0SEkzVGx4U3pVeS9MNWxjYWVXRjVoeW9hWm9ZRGNXeWFPNnQ5?=
 =?utf-8?B?dlFJZWJvNUl0YlBMTHhDS2dMalhGcis1TXcwaUErT2RqZFdYMmMrM2F3NHhm?=
 =?utf-8?B?Y0JOMW9VSU01U3phdVRhZGRscDFyMGNGTHh0NW5xbmlZVDJHRHFEVXB5ZytR?=
 =?utf-8?B?NHZ6UEVFSkRnNU9qMFcyQlR1VFB4SDhsaDJrVGhXUldGa1NOMjlIM1lJbjdD?=
 =?utf-8?B?UUU3Z09qelVwcFZGVU1CcWJFMmpQeDc1ZXk1UFNSaDJZYVJOdFRYMWVYekNk?=
 =?utf-8?B?cE5sc0RseDc0Szl4c1ZaOU9iSW1ueGdhY3JxeUI3RTdHNEs4WVJRNFBzdU1P?=
 =?utf-8?B?ZjdBbm11SkRhcG1jZ1kySTlKUnVMd0toZ29UUzVOZFgxV3dGK3o2RjZUYldR?=
 =?utf-8?B?WWgralNVcnp4bXp5dldoOTdzR1d6OHdNSzU1c3FsTlIwaDZLYkNablQvV3ly?=
 =?utf-8?B?MlVpVE9uT1hnZ0oyVnNTbXBOdjdsbHVQazBNYzdCUXl1R3V6OHZUcWdWUThs?=
 =?utf-8?B?dzEyZnVoZDBtOHprdTlNTlRnNTlQUmtia0tUNXFmUDdHV05XVitGellEMm91?=
 =?utf-8?B?M08yVUc2M3hpVmIyWFhOeTBFYzNjSlpzM1lZbnFTU05UU1k2VUlLMU9vSnJD?=
 =?utf-8?B?c3IxUHhPalBvYjkwRGF1RUxIN3ZDQkVaNE9ORFV5a3Q4QlRhcDZUTTNVY0dw?=
 =?utf-8?B?SkhUdm9RcnAvU1R4QzBuRzhnYUg1WXJYSkpGUkZxMVowTnFDekU4dnYxbEds?=
 =?utf-8?Q?KQaatxm25B+KzIXzgMjJam7YjwAlTiQ6HtAsBbCDv+bh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6edc315-d381-4aae-a236-08de2cf4193d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:00:04.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgM3VGQ4TSLo0ReFJJ1TYGY9dVnRB/CpMH/hFrXe8C1hrxGEG761c2SLDnT4xaKzIPjirD4AqVc2B/k+L/xObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375

On Wed Nov 26, 2025 at 10:36 PM JST, Alice Ryhl wrote:
> On Wed, Nov 26, 2025 at 10:22:14PM +0900, Alexandre Courbot wrote:
>> On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
>> > On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
>> >> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
>> >> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot=
@nvidia.com> wrote:
>> >> >>
>> >> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
>> >> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acour=
bot@nvidia.com> wrote:
>> >> >> >>
>> >> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
>> >> >> >> >              return Err(EINVAL);
>> >> >> >> >          }
>> >> >> >> >
>> >> >> >> > +        let aligned_size =3D page_align(size);
>> >> >> >>
>> >> >> >> `page_align` won't panic on overflow, but it will still return =
an
>> >> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which=
 let's
>> >> >> >> you return an error when an overflow occurs.
>> >> >> >
>> >> >> > The Rust implementation of page_align() is implemented as (addr =
+
>> >> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on ove=
rflow
>> >> >> > if the appropriate config options are enabled.
>> >> >>
>> >> >> That's right, I skimmed its code too fast. ^_^; All the more reaso=
n to
>> >> >> use `Alignment`.
>> >> >
>> >> > Alignment stores values that are powers of two, not multiples of PA=
GE_SIZE.
>> >>=20
>> >> Isn't PAGE_SIZE always a power of two though?
>> >
>> > Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
>> > It sounds like you have something different in mind than what I though=
t.
>>=20
>> I thought we could just do something like this:
>>=20
>>     use kernel::ptr::{Alignable, Alignment};
>>=20
>>     let aligned_size =3D size
>>         .align_up(Alignment::new::<PAGE_SIZE>())
>>         .ok_or(EOVERFLOW)?;
>>=20
>> (maybe we could also have that `Alignment<PAGE_SIZE>` stored as a const
>> in `page.rs` for convenience, as it might be used often)
>
> If you're trying to round up a number to the next multiple of PAGE_SIZE,
> then you should use page_align() because that's exactly what the
> function does.
>
> If you think there is something wrong with the design of page_align(),
> change it instead of reimplemtning it.

In that case I would suggest that `page_align` returns an `Option`
instead of potentially panicking. Does that sound reasonable? I cannot
find any user of it in the Rust code for now.

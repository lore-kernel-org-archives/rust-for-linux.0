Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020094.outbound.protection.outlook.com [52.101.195.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF5346FB6;
	Wed, 21 Jan 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011175; cv=fail; b=QUwDj5L4P/qBilpsNG++8FlxwQVrbrEuaiPELevwqgVcwlAt3TtGuUF7zcgWFxD9fKokIifyZ0F0gJRgK3UWjmqF6SUiH2kcbFw3OBpQTYlnACqFboi8D1S74JlAKYOUpd+C09+d4rfPX0XY2k1nI2fpdu2uunJF5oCckYBh1jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011175; c=relaxed/simple;
	bh=GikcxS2VuNDBmK6M8H0x3c11u10jbEWb7qGdaN52npY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IrQG7UyK+H/k0b7lQlYpQDRpZ8XQSFiYza+QU9oMUixMsT4OliKtgE0OGHI9iEG/eIiSTT6JsRrl1iDRzR4VnSseEzAi1ueZJPoMsR2i4+amaDH//CCfZEUBqszKDeDTtr5Be1bot2LH/ZKi045hng6jXxb1ZRMrrKGoK83pZu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OnmaVpMM; arc=fail smtp.client-ip=52.101.195.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OnmaVpMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ms5VVvYyOkg+Omxnp6T45H+F52S3bdcmBeI+bakCJ4yoZeHueUcqoSfqJNjqluVKgJ0lyP9/XxVhLynobmRgBUG/0LaoyvhqixQBOoP55Cnvh34/3oDmaaSlnAg0GEXvWwkV0HSFSyfOdeyxGuxZZ3I5HrN8MG9Pli5hfIwxh9NejMVnCCjpVPHOBdBP2r1Aps3QAMd75b0yXcuJNcn+wZv1OrunVsOLheTBkde5abi2cOpZhesV2EcDVTv43bNO0TPWbVLIzM0pb2OiZ04HGvV3rnWUOxTBXaUeTB6J2IuoE8kp0i5jSa82bVQKd3V/acXCSb4wbovhuNvBC3nkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxdBlzhWEMC62RPKj7Lle9HyB8GM0dzsycXu0AzggYc=;
 b=I/iYEHAKBMufDEp3h9bXn1EntA/lB3wqCLanRk3yJz/hmv4mW9usDibnv8rkw47KMNVKhJ1dPWgPFa56SCEDiQKftz4A/22fHM320fYdmAjJveRhekI+VejuMZC3EJu8bZiFy1ohrG0PNt9sV29zlz0iv2ioQiDgLrhDpwgrim6o+4iouiPVLdd47IeZ52yx8W18becVSN+x7+SbooY/Wdgc0TWe/GIRjFGTIHdUBx3SxSVlG+TG3STS4Q6reBwbUCRi8YrDI1wb/9UBc2EE+cVWPX8eBn7tyMHm8d6dYpUyuIigXM4jOwZvCvJtTr0nTywNBkHuzTJfFPdND0U2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxdBlzhWEMC62RPKj7Lle9HyB8GM0dzsycXu0AzggYc=;
 b=OnmaVpMMlegrPjG09wnfpaW+svxWM2SukztlFpkx5qke/A9vXp55aVNe1E2xZpfpvS6KDhd1ag0ZG5cqmpp27gSZm7xjP05QAC+cyY0UkPXeTs4jiiTMgUQVpEjXRUIt2WM6LQyIPdIH8p4GDRRqZlTxEjp3Tkt2m2R5Rojk4LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5750.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:59:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:59:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 15:59:27 +0000
Message-Id: <DFUE4FBOIF4Z.22DLDSQS06LO4@garyguo.net>
Cc: "Daniel Gomez" <da.gomez@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
X-ClientProxiedBy: LO4P123CA0304.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1c12eb-4880-47ee-e634-08de59060e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFE4VHdaNlBpQkNhWVhlMTlWZ0pPanNRR1lJZzdRcDUwbFh4ZTVqZy9CbStq?=
 =?utf-8?B?ckttWkVpbzdkWGJ3dDhrM21QNFQ4RG93ZUFDWlROSVNvTnVqbmJRZVJNcHdH?=
 =?utf-8?B?Qkg5emZyQ2tNY0I2bXJuWTM1Z0wxMlAyUklwQzNkY2xBSzFHQzZ5WWxIdXJO?=
 =?utf-8?B?UW1lbHJvaS9FUjlCM3NXMzRUZDcyZ2hVblI3RjlXZVBySjlZbVdxdXRnY0xx?=
 =?utf-8?B?WWpydGoraEF1Ym9ma3A1Y0dIdjd1MHhZbmhWVUF6d0Z3Ry9sWGgvWDg5YXBL?=
 =?utf-8?B?clRuSzBCSllEVDhKUndwazYxYjlTL1cvNXlBZ3lIQ1JPQmt6MzF0K2RpbVVV?=
 =?utf-8?B?czFMZEVWUzY4TzJZSFNadHg2SDF3cWdDVHlrYVBaTmRGbUhKY3V5LzdsdVRX?=
 =?utf-8?B?T2VVaFVKVmNyTlBFWWZyaEJkZkNvaER5VGtaTDhCeHVFM2JyWlBrb01DY2xX?=
 =?utf-8?B?b1o3UUNyTzV1VmZkMklDT1pYTHNxREs4N0NuRnRNVHI1RmJnOFM1MHl5UXRy?=
 =?utf-8?B?cjRXZ3Z3dXl3WUsyelBFT0UxY1kzMzh6L0VIMkQyMHVIYXZrMzJCL0h4RjlP?=
 =?utf-8?B?cGVxS2w3dHEyb1p1cVp1RVdMMndReFEzSUVQaDRGTEx1TytsV0dHS0RSTnRi?=
 =?utf-8?B?Tmk5eXBxaktONzd5dkhFN3BFM0JFRG0rRGtLMWRXa2pKTE1penZZWnVKU3hx?=
 =?utf-8?B?N0NubDdITnR1cEV3MmJJRWRmZmNjR3VNT2RIZWFpaUNkZ1Y5aVBVOU11TTgr?=
 =?utf-8?B?U09yZ0lDQk1NckdkZ1l1dUhpOEJ0Nk1zdTc3aTgyY1M3WllxYW5pTG0rTHJi?=
 =?utf-8?B?QVAvd29CeUNMcVExdW5ROXdaT1BETjdMb1dFTFUzSld3T1hKb2hnM3ZicmlN?=
 =?utf-8?B?MklJSnE2eERCVVFqMFhmWmVTdDdEbzByTkE3cFVaL29mM2c1YnZ3S3lZQ3Yr?=
 =?utf-8?B?dStxYUgxY2ZKSUVaYUxtYjFPTUYvZ25MaDNROWE5dUlac0hqVDl0eEd6Z1dn?=
 =?utf-8?B?NDROMWZMbkdjdVI4dEV4MmdHbnhueE9qcGVnUDNDSXgxZ1JNajBSVlRFOThK?=
 =?utf-8?B?cDU5RCtOLzhkTUtLb0lsSlZTekdxeTlCMG9naXdiYmVHOVpNSEczTXU5VW5L?=
 =?utf-8?B?RjVuRklLclByYTVYakZSL3Nuci82L0dpSjZ5WHRkekFBNFRyMGdxK2NZdGJT?=
 =?utf-8?B?ZXhKdkVIWnFhY0tuenlyaWNPOVArWlNCbUZRUkhDdlE1eFdnSGZIb0RaUEov?=
 =?utf-8?B?NHhXK0dDd2djbzdXUEdabko2SDJQSkNRNUtEaWZMOU91OUkzZjdPbGdQcmh5?=
 =?utf-8?B?TmdFcS9veStzbUFzQ1Flanh1VXdCWXVtOHFHNmZyRFFYVDV1YzdUN2NPWFlk?=
 =?utf-8?B?RE9HNk5xakRyM29vS1FVZ0xDa3lpYnRUek83S0pzRFZSdU0xYlF2UCtkN0Rp?=
 =?utf-8?B?QXdyWlVrb2h0czB1QkpvUVc0eUZFODdNcFY2QjkyQkhvUmxRUDVYWG9qWTFk?=
 =?utf-8?B?aGk0ejB4K21SWCtlelV0TzA1c3ZqbVo5SnZoNzJicGwxL3ZVWVNEVjRzam1h?=
 =?utf-8?B?MEp1QjNtNWo3MTVHWG41MzBGY1B0Z2o2enVDOWRoRk1GMktVV3htQ2dWY1lO?=
 =?utf-8?B?WEkySmhKcHNZSFJJajM1aXVQdUl3QXJoNTIxWEdjYTNQUitvN056UFVudE1n?=
 =?utf-8?B?RldNd1hlbHArZ21SWmxuVkNYcGFxd1prWng0RmxSWmUxdmdNWlFwRlNmVktv?=
 =?utf-8?B?ZVNDMkRUUVhGMWxUWDRubjBmeUlVYUI4TzFjRzg1MGJkbGF6MXBhSEs2R1A0?=
 =?utf-8?B?ZHNaU3p0d3VBZDlJT1Irakg0M2YzbUdqbkl6eXhXQVM2MmtpcE5UbmpPUkdk?=
 =?utf-8?B?MXliOXpYTnFyR1lWQ2NDTHRBTVJkMmltYjJJeTBXVzl3NEg3WGw3aGpseXBP?=
 =?utf-8?B?cGRvRHVJN21xUEo1a0VMb0grWGVkQm5oTHFGTGxRWkcwejhFbjJubk9mdGVK?=
 =?utf-8?B?WWFBc0QveFZMZWttQ3RiaHRFaVdtNFMvc1VFYUMvaVhxcENhSGVBZmtCVWZv?=
 =?utf-8?B?NW81LzUzOWdZYVYzazBIVzNHejMxcEN5NVgveUY3bUdWUmtMb0xPNlhadGRG?=
 =?utf-8?B?eERHdXV3NlVUR2p5QVhnRkNmaC90ck9rNFgrb2FieWJoTndwam41ZHZkSVlM?=
 =?utf-8?B?aXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2djWTJMcUplYXlEVFBSTGZ3ODNrU3RPbkZtWHVtL2owM0laK0o3czQ1SHJI?=
 =?utf-8?B?d1JuRjdWcUtzUFNVandnUEhRb2RRdGpNcS9wK01QclZvbHErTzdlSHFYc1Q4?=
 =?utf-8?B?SHRRSmUvcW9WM1lINVpBZEJnVGZZbVdlVkRlVytoNHVHSTVJdHNxUEpqVWFl?=
 =?utf-8?B?bzB5c0wxOE1GaThvVWlrTlJmdjJrN0JhUlR4NWg0bjBhUHFRSU15RVROUFNy?=
 =?utf-8?B?aWlid1Uzb0Y4UFZQSzRoMjR6azRYOTJoaWRUU3RITURqUnRzb2RDdlFCKzRk?=
 =?utf-8?B?TldjS1hGRnNZOGtQejZrTHpHVERCS2RrN2V5NHk1MUkvRGpkQWFWOS8xZkUw?=
 =?utf-8?B?ZE1sN2cvdjZjS1A4K0hoaWdRSEQxY2tSSDJMbmVEQkVmVm1VekJDblZIUjgw?=
 =?utf-8?B?YWFJaHdpaklBbWpPaFBWNFBWSUdiYmN0MDNmS3JEU2tKdUEwR1Z2VXJ5RmYz?=
 =?utf-8?B?dUlqeERyNlExQmRMdTMxdm53RDJHa3pyeEdGd3RrbFhhUnBCRjFHSEV3aElW?=
 =?utf-8?B?VUwxam9PZmhvbzJEcTJON3FLOVdNT2k0ZWNMOTg1VDVwYzRlallpQXJhcExk?=
 =?utf-8?B?U2JPdUVPZW4yUFgva0FjOS9VRjBtcnVKRHJlMzBGLzhIQy85cDlvY1phMEIv?=
 =?utf-8?B?ZExrYkY2b1VLc0hqdkRxQVdxdG1jTDZucDZlemVrUzZFS1RiaUxJQmphemZJ?=
 =?utf-8?B?RGFIR0puZU8ybDNYMDFkUTVZNjgxN0lMT3VocDRBdFhjUXRFQmxSUUtDZ0dQ?=
 =?utf-8?B?dFJrWWNTZEFqOXIwUTlXNEJRUW0wNUR5NFFPMldoYWtnZzYxZk9tRms4eVUw?=
 =?utf-8?B?TzFPVENkRmRITUc1dkFOaFpGZUNJRS9xZFJoaklNZ3VYSW5FWEJQQlJyVnZs?=
 =?utf-8?B?UUE4amtjVWlxdmxaeUdzRmpjKzF5WjVyK2pjVjNicnFDYk9sR2ZtM1JHZnV6?=
 =?utf-8?B?SERldUVWZEpxWlh0ZExMQ0FaTUp5NjdSOWRDZngzRXA2RVZGaWw0NWs5UTg1?=
 =?utf-8?B?UktVN2llRWRqZkJQSDVrZzBoa3ZMaGRyc25oTVd1c2wwK2pTY2MxckhrSXF6?=
 =?utf-8?B?NktLR1BYQjdQYWw5ZTVnZDg2K0M2b1A3Y2JxRVh2MnR3N25KWGxBSUF6NUx6?=
 =?utf-8?B?NHBvT2J4RHI4c0lGUFV5UFNiOTVNSVlXb1FzOCs5OExTMzJDMnpPQVpBL3hi?=
 =?utf-8?B?Ymd5RldsUFZmYXdvVjVXRTMxdTBVQkp6OURIQ1RSNmdFZGRET0ZSQm5EWjU5?=
 =?utf-8?B?SVd5L29JMG40WXIwaEZqVGQzMjhDbnRCTy9pVTNFUWM2UmNIaVJFcU5qRGZN?=
 =?utf-8?B?RXhsOUwvOEZ2SzczVlJITjVzc2drQjZnNnBOcHNuTkppKzNpZFhCVGNyaWg0?=
 =?utf-8?B?SGt0WEZxZmRyc01PRG84c2E5OURqaXFmQmRyeEpDTDJmZ2JtZnRwUzEwTlhM?=
 =?utf-8?B?aGpUMzBmUGZMVmZsWTUyYUF0am92SmJwUlZNR2tlTWpJNE5VR1RGc1FSaUJD?=
 =?utf-8?B?aDBBdGlSTHQ2OS9iRm1WRk9vVWhJRVV4aktDWWNHTlhPdGVXNGhQZDRrelh4?=
 =?utf-8?B?WWJOZGxrazlxVW91QzA3MUw4QS9GYVVNRG92Z0gxeWhkaVowNnIrUnloMEtK?=
 =?utf-8?B?dkljSjYvWkR2UWtkMW9ZUlVGdkt1RUFxWCtDYnJhTUV6U2QvRWNCUXBtZmQ4?=
 =?utf-8?B?R1F6UTJLellEMVJUTTdxVEd4OVRBQXZzcVA3V0FHU3BvaURSa1NvaXJpU1NM?=
 =?utf-8?B?QlFoRExkSHpjOW0zeU5td2F0MHFySHBJVkRqK0phT1NLVkc2QldIdUdoNHRK?=
 =?utf-8?B?ODdsajM0dVJRWE55b1R1c3ZHWldMam1lYm1CVmVOcU1GU3lFUFNSSy9HdVlX?=
 =?utf-8?B?UmJlSlJsSEd1SCtGU3daREFTR0pHQW9VNWVIdFpWTHNvTWlIWm05SUdSMFdL?=
 =?utf-8?B?YWx6QXBYWEdzeG5yZ1VvdEpiZExsdkZHdkYvSk42QVdyRlhjaHIzc09YYVY2?=
 =?utf-8?B?b0FZV21RZUhxanZlZEtnZERGRUJOeHE1ZDQzWnRWTUJVQ1dKejAyMzNzOTRm?=
 =?utf-8?B?cURTNFB0WFF6Z1ozaVNoYzNJeFpHc1g2TEVOQWJnWWFzc0kyNUVKTk9HRk43?=
 =?utf-8?B?WmpOUDdJSzhka2Fnc1lDTi9ZMXd1UHBCQnREZ3NuRnVGUmNVU2E4TWFJYVJJ?=
 =?utf-8?B?dlFJYmdxWmxaOUNMWVNuOGlJejlTV1BwWSt4bVJiNFZWZUNybFIxajNiMnd3?=
 =?utf-8?B?OHo5QmxtUERRQWNlNkI5UkVtZUtselozMWpJTVdiaXludGF0M0ZVbWdHRFY0?=
 =?utf-8?B?ekdLaEJyRmxnOU9PZHRtdkdySU5EWVB3MVNueEVxblgweEpnaW9Jdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1c12eb-4880-47ee-e634-08de59060e77
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:59:28.1157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpt3i43fzCe37PqiPBqJo3MC6zoZigU9NDsVO3jCDQFNUb72he0BQ0abZ8e3kjW0hSDQ/DTA6oNFM7y6aJpuMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5750

On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
> Replace the `xa_init_flags` helper with direct initialization of XArray
> structures using `__spin_lock_init`. This allows each XArray to have
> its own lock class key for lockdep, preventing false positive warnings
> about lock ordering violations.
>

Isn't this potentially a problem on the C side as well? `xa_init_flags` is =
a
static inline function, which means that the lock class is going to be the =
same
if a single C compilation unit initializes multiple xarrays -- unlike when =
you
use spin_lock_init, where each callsite gets a different lock class.

Best,
Gary

> Add a `new_xarray!` macro that automatically generates a unique lock
> class key for each XArray instantiation site. The macro accepts an
> optional name parameter and uses the `optional_name!` and
> `static_lock_class!` macros to generate appropriate names and lock
> classes.
>
> Update the `XArray::new` method signature to accept explicit name and
> lock class key parameters. This enables proper lockdep tracking while
> maintaining flexibility for advanced use cases.
>
> Remove `rust_helper_xa_init_flags` as it is now dead code.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/helpers/xarray.c       |  5 ---
>  rust/kernel/xarray.rs       | 74 +++++++++++++++++++++++++++++++++------=
------
>  rust/kernel/xarray/entry.rs | 55 ++++++++++++++++++---------------
>  3 files changed, 86 insertions(+), 48 deletions(-)

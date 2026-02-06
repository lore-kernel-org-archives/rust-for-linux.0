Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DC2EBB81;
	Fri,  6 Feb 2026 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770406895; cv=fail; b=Fr8bJ4Z0F7LXtO2ypr7yXKZ9ceXjDXPanF3aug3bITmNEmFKwY6MoMnro4LmfuQ2DjmVx/lMbdkeGGMJvou7oBlRKkyw2GDb5a/0JAbmZJpS7zqI+/CDkgyiDBSaL494fO/LM2SluQE9PsVOqgu1QIYqMpaGvuSxZZMRy96o/6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770406895; c=relaxed/simple;
	bh=SNUBf8HPM82hAtZQxNvW6W1wls7Iyfx5zdTkNF7TUSw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EetD01G2empT/h3EqHiI93m0kbvE209Dblkr0eFYgpkG38su8Fvw9CMW8IM6FEr9j9LJQn+ArZliG5CKD+z70CUvanoKOR4PVvj+nqEfC5VDBWU9Tzda8AXoVldrK/eiYjVOwWA9qk99bPeA0zs/nNOwqgCX1IO/3VyxXbxreS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F2d1g6y1; arc=fail smtp.client-ip=52.101.48.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F2d1g6y1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0siBPgOTOtXN5OrrZEPrJsv+6E00dcI9OBu5KKpVX04Lm9n8BQadqWqeUX8lE9CwF3+QrsQ/pBKzd20rsuK83MJlxzc6kxzVQclGuHwjT9W8PGuW94SQc0jDFyBbCrrEdibbyj5uSbSN3gn4yzjinEmlf0Teb2pk0ZPM2PeU4blYThv9WgfdKLf3q7gC+UZEr0Civj3NTots18zICqqTHb4hRWr4gO/vxo8Cymu/QShXEyA8Ml3RvZLcjj12U8K+sBjyELQnV92z0pS9Dm9RFFY8yzqBW71FM0ksbcFmD+/kogJ+WR8wuQ0ToWmqC7BMp114Cx9eAjXAYElpAXz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNUBf8HPM82hAtZQxNvW6W1wls7Iyfx5zdTkNF7TUSw=;
 b=hGatRMM6pap6oD3ePQBm4av4ZQvgu8jvhRRKrQuXF3Hs7oGzCRfDDLEvi+AgFErginKYqmzbdH4KOnuvQOLlA0Nupp22w+fy4IqrSnSoHlopkFY9sk7QgAm0wyBK2sKb1me0kjYUNLE15yW3RHmADnawXa8rFKxpJorwsuli9vCgkLawYHrlWbD6y2yoweNUKRBZ9h4OtRwes38T1/1Ok+4gZXxqeGW16NnpgL/3wynufU0+zotfYiePxoN4oOc8i9E/20/VFpSd7qAj4ZMLvbdH2f3sES2TYeoFVDIfe1NlYP1pNHvsa8Jffc4CuyOfETEFrjPusQHHfs18zYXCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNUBf8HPM82hAtZQxNvW6W1wls7Iyfx5zdTkNF7TUSw=;
 b=F2d1g6y17uXBWOOYsh+92QRVcll+l9fX1WtWXqyH5A1L2ceKiKfY5t61T8rIfZ/pE5d4RBuDi0iE9UQ0fjXRJ1VaUM4+klfhCZKddTpyzCpm0HlXriKNWa3BGLkw30/at41MtAuNsl7r6Gj9RXdPr9ioOjMmqvjczdU0snfNT15xbH/38ZGtM3J0e0d2fwP6hw6rVqPszlbCWxBslDPwn+bfuVmc5AgUWUey6C9kuroW9+tuhISmYFqD5c6eWnjRxVeBuGhpRaC9bDIKjNIt/h5+ApygmkdTa4mTGs/Ej/5EmiM+Y5dYHw1u0R/Yao4j1u3MNaE2Mm5zZh7TLu2uzQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 19:41:30 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 19:41:30 +0000
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
Subject: Re: [PATCH v3 20/30] gpu: nova-core: Hopper/Blackwell: add FSP
 message structures
Thread-Topic: [PATCH v3 20/30] gpu: nova-core: Hopper/Blackwell: add FSP
 message structures
Thread-Index: AQHclyAg67wU9FByBEamzarLR3Y6t7V2EuyA
Date: Fri, 6 Feb 2026 19:41:30 +0000
Message-ID: <5dc22163e8a6aee95e1c476428696d17b78673a5.camel@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
	 <20260206042123.303281-21-jhubbard@nvidia.com>
In-Reply-To: <20260206042123.303281-21-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SA1PR12MB8920:EE_
x-ms-office365-filtering-correlation-id: f863b4db-af88-4bae-f8ca-08de65b7b9c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|7142099003;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkdmOVpiNjd5aUVZVDlxK1VMN0J3QXUxb3I1WE0yR1BDVWgzN0tleU8yU2k4?=
 =?utf-8?B?SmdIaHEwc3E4WmdJTEZOWHpBVnZocFNwSVpGSVRycnRlNXNKWm1JV0N6bkxJ?=
 =?utf-8?B?WmMxTGFHR1BNVnRkZ1RLQU5jRGVzdkQrYVpNbGpEWGhDMkN0OVlCaFY3Mm9G?=
 =?utf-8?B?SWtBeVdaVFBqb1pXVWZnZlNhNjhtNElEWHAwMFRNMHBaSnpNU1Nkc3YvWlN3?=
 =?utf-8?B?NGRVQlBJRkM3K3dyWFlDdlZFQkxZNDRmajhHWDhuZHp0aWFtVFlCaDhxNzU4?=
 =?utf-8?B?dHpMRjZmUmFXRncyU1UydUhjei9lMUNZZmZLaGZTUzkxalF0U25kUFR0SEhK?=
 =?utf-8?B?bzc1ZGtsaTBHdkxZd2dMQVNVS0FTZXA5YVlucmtyZU1RTzZSdEFrNEp6T3B5?=
 =?utf-8?B?YUdjdFcwQ0gvSExFeWVOc1FtUCtDeXBaTDNkU1JRVm5vODAybU54NnZnYjRD?=
 =?utf-8?B?eFU2STVFZWRGTVZSWmEzSmxVaElLUk5Xek9heTltQVFNQXJZN29ENFhSWkNl?=
 =?utf-8?B?dGVpcHk0UkRDaFZUMzE3MmduV0pmSExMeU56TWtnbkpKZG1uemF4bXlOKzI2?=
 =?utf-8?B?Q3pmcjJKTTFKWTQ0RWFwTEk2U1V1ZW1mV20zc1JXZ0x0U01nVy95VzhnWUsz?=
 =?utf-8?B?ci9QYmVmbTZ2U2xjZ1JCdXRaaXd1RzVCUXlRVnBya2N4NVcvM29laVpReUYr?=
 =?utf-8?B?dkZIMFUxbGFPSFQ3M3ZSWW5lV2drMHpYU2VYNjBhK2RKanNvWWp4SkZqVVBI?=
 =?utf-8?B?RGo1R0NKOE9mYnkxMFhndDJ6SDZTT3dSZFRkaktOZ0Fhbk9DTjdZTDlKZ0VN?=
 =?utf-8?B?M2VhelpONUp1anpwRnBuYTNFNG13RTFCYnRubjJqamluRmlWa2pqV25QK2Zp?=
 =?utf-8?B?OVFvSVJZU3hXMDF2MXBqNG9HekR6RnBnYzFMUVJPWDZYbEVzQ2ZKVGxaUlpz?=
 =?utf-8?B?TXkvWlJXRzRDbXkzRXkvUGhRVlFUUnV1UGpMS25vUHZiZUhtalkzaHJNYU16?=
 =?utf-8?B?amZjU2FjcG90U0ptcmdjQ2dvL0dndHBZVmlWalB1ZTVhSkdnN05vQnBTNys4?=
 =?utf-8?B?dGZKRVBRajNQV2JXcGptN1REVWZmV3p4aTdzVkNONGxlSm5CbU5aMFd2NFRw?=
 =?utf-8?B?bm5aYitjbWVVa1FBTHc4aHRuVDhsVWpXYysxZzZRam5zdHhqTExyTHluTTJP?=
 =?utf-8?B?QWRWUUdsUitRS3hoZ1granZMckh5UmYyK3FXV1BaRWhnZVgyNThUN0UrUitK?=
 =?utf-8?B?ZytQc0ZodWtJZEtKY25keUpIcUJlcnM2OGhjSlpMQndBZ1FYU0orM2c5Qk9D?=
 =?utf-8?B?U0ZlOFJKS2RTdDZJVFNJRGdpRXlDb1pHeUdoOVYzUW9xOUdlQ3VFWU9zd3Nt?=
 =?utf-8?B?Um5zajllSUNQOG9leEVWaDVxNVVyMjRsVm0xcUNiOTk1SjdjVTFlblZRL2h6?=
 =?utf-8?B?K0xtODl1alVySmxwRVp0bHE0WDhXN1JkM2JIZGZ1WVRka2pDc2U2NTdHL0h4?=
 =?utf-8?B?R0xCZVBmalZjWVdxNWxMV2JaN2ttL3p0R0s1Qm5WS2RESi8vRnprZ1dZbDY3?=
 =?utf-8?B?dFdmWGlCNnRDTTZiOWl1NG5hMDVmcUwzWnl6eG1wTExiOG03amtRZ0h2cjl6?=
 =?utf-8?B?YmlGL2VxTVB5Q1ZFU3BnaENJWTlMQyt5U0tVeE0rcFNEd2xVSmFhNTRwZ0Zl?=
 =?utf-8?B?YnVaVkt0U0x6Yk9pNFpIbFJ4QTJHY05sRlhXMnJHVEVvSEJ1UGJqNkQ5ZjI2?=
 =?utf-8?B?UCt1Zm43aFE2aTZkWGErRU1mbjBhakdxdFVSOVJhYzNscUtXa3ppRmRRVEVX?=
 =?utf-8?B?TXo0T3hBVHJnS3Vyc3pDUGVUVTlDSTRvZFhPZVErejZTNjVhTlBOajFRZ2Vz?=
 =?utf-8?B?ZTZRU29lUHcwZVNleWh0QUNYMlNRUWhRRmZ2UFZUSnFyN1hZODUzdXM5Rzhi?=
 =?utf-8?B?bHJHaUNWZTBtL0F1S01Ya2xoRmdrbU9oSFBlemNJaGI5UllzcjBSSStyaVBU?=
 =?utf-8?B?OW1RVnpyK3ZnL2M0SVBrVHVsV2UyVVhmSzJyQjZkbWhERUdBWk5NWUZtOGRJ?=
 =?utf-8?B?ajlra1VyNTRnUEdQMWhsSk9aWERQNUpGVUwvL2tTelZKbWtlN2VZNW5iZm5k?=
 =?utf-8?B?SElFZXRJcFhMbnM0dUorZmVYL1BiUUhPa01WUGtWOGw2QWloV2FsaDNXMVJv?=
 =?utf-8?Q?FOglQWK8a39gLu0WGC6v4ZM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2oyb1I4czBxaXpYUURXNkhqaFRJVWlxc1FRa3d6RWVyaHhIUFNFTXkvc0RN?=
 =?utf-8?B?N3hIZWR4WkZoVTVhQk1ReTVxQzVxanVSd0Zzd2l4ZS9aU0Z2TGc2SjdwMnJ3?=
 =?utf-8?B?M1JRNEN5UlhIREdVd1AyUWlvdGJZdHZldGovS3hCUTdKVk5vMGpuQlNaMjFY?=
 =?utf-8?B?dnlmMklWcEFpSGN1SVdaR3hEMGJoYXNJNDJBWFNvVVppck9wMndiVjFHdnJZ?=
 =?utf-8?B?d0RFeDdYN2pla2xtYlMxMWVuRVFOYk1JbWQxR3lKQ2I1VXI4ak54ckFiZm9I?=
 =?utf-8?B?YlBqbmZSMmJ1VzE4eUljUm05c2FDTGx3MnZTSXlINEJJUVAxQ1NBRkdab3Fk?=
 =?utf-8?B?YndKczJoQlB4UHlvWVRHVlpoTWJ3SnNGWnJ5Tlh6Z2JraTljMkM5ZmVxakpG?=
 =?utf-8?B?ckh1U3VuU0tOY1BadXAxU2tJbEFPR004dVN1MnJEVGZ5c1NqNjVRLzd0LzhK?=
 =?utf-8?B?cjVNbXBpSkc5c0gxRDQ2WFpVRXpIS2l0WDVJS1VabFBLeGtTT2wva0FQSlRH?=
 =?utf-8?B?L05tekl4Sy9SSVQrczRlQUdEb2tYNjRHcWpTMzNxMy9kUXI3c2pCd2VVWFpt?=
 =?utf-8?B?Tk9YV0dxak9xSjBHT1Ftc0JxRERMcUR5UG5KVGZLU0xLSHRFWnlCd2FtSFFH?=
 =?utf-8?B?dHF1MEJLa05xNWIxQnBUOUlPcWNsMHRNMEs1cFEvWkx0cS8rd2ZqS3ZNMG03?=
 =?utf-8?B?Q09FQkxmMTV1U1BsQWFxcFQwWVU0eHYwd3g2WnQwUitvdm9NdjYzQno0bWRz?=
 =?utf-8?B?QzhlTlJGME9reVh5RS9MZnpMZHZoMFRyV0NwR3hmNzEyRWFGR2RmQ05LQ055?=
 =?utf-8?B?VFV1NmVOTVFoWkxZSlNNMVNIUXdUTjhGSmZYc0xEcmMxQkZxb1gxaktjNGJF?=
 =?utf-8?B?a0xySVNzdGhvL1JIVWxiVDJpci85a3dlM3NHNytRb2FKSERtQ2hpRjBjaW5v?=
 =?utf-8?B?K0JkbU1hUnNKZWNtV3hlTHBOSUltZTQ5M29VSlU5T09FTkYvL2JjTkI0K2NX?=
 =?utf-8?B?UCs5Q1NaTHFlVjdIS29MdG5iZmRLbytySjA3b2VzcTJXUDBYb1N3OFBsOFRJ?=
 =?utf-8?B?M1krRXVCZW5kb3RmUkFPaDlxUjlRdEJZL3FDZkx5NlArN1cvOTJtWHlmdUN4?=
 =?utf-8?B?VGtreE9qN0c1SmZjRm5hOXBCNCs4cGp4TWJUeUNRL0VPZmZ2TVVnTWMzQUpJ?=
 =?utf-8?B?SVZjUWVKNkNMM05VVStsNGRPQmdNNWVZUXhsMVdVVG1WSUJtMDlvUEVGZnRY?=
 =?utf-8?B?UFhSRWVPY240citvZ0hoZmhIY1c1SUVnM0wxVmI0ZnA3NXMzR0piTjZVMGJp?=
 =?utf-8?B?OEZGR0JDSUk3Y1hNNTBSSFowL1dNcnFRMnRDUGlhRS95SjJhSkFvWUZFeDZ3?=
 =?utf-8?B?TFpXQmV4RStUM052d1FXdGp1VXB1WExBSHNWcmZZcG8wK01oalovNmNTYkJi?=
 =?utf-8?B?dC9NNEQyNE5lVGdsQytzRmhBUmhMVllycnZ5Q240b2lyMm0rMW81MldlTnBr?=
 =?utf-8?B?RVRaUEw5UENwVXVRWXhvNHJucXI3ZDVnSmUzaStJZk1iNXNraWRpUTRGR2Jx?=
 =?utf-8?B?VndnRFpndG5GVk8wV09HTVdOYmF5RWlqWGM3bThyWHVpMUxrWHplT2QzcnBj?=
 =?utf-8?B?Vmk2ZVlLSmJqQ0hHSEtqM1lzVW1BU1BkWDU1Y3pwTGx2S04ydlpSM1BLa0M1?=
 =?utf-8?B?T0pSdmNPeFlWZWRQNGRKYXNiaGFhVWMrR2pHZ2lkL2plSmFlcFRiVUJqeEZu?=
 =?utf-8?B?T2pDdUQrVWxjK09aOHIwakxBTXI0bjY1OERxNnRtYTBraFdKcG5OMFlSaGt2?=
 =?utf-8?B?cGFmdGZsQkMvK0wvMVc1ZFk0cU5KdkxvYks3cDFNMHdsMHFzcndrVjVlVHZ3?=
 =?utf-8?B?U0dFbXB5WUY3dDFNcnAzazh6aTlzMTljcUhrbDFkM0pTdlFDb0hjZS91MitR?=
 =?utf-8?B?cXdEL3grUlFuQ3c2UzhDWDRvaFZwNEFxek91cWJHZWtoY2ZVZ2FRV1I1M0NR?=
 =?utf-8?B?S3lPMUNjYzU5bldvdzNWTFFTSGlsbGJpVGNINlljRUEwUFU3VVVEbENOVjlB?=
 =?utf-8?B?NTllcEJPb2tiWWowdU9WZXVmd2lONkhSVHgyN3NLVkhIaTZIUm92a2U2b2RC?=
 =?utf-8?B?VXpOWXhzekYyRFZqeU9DR3lKcS9xY2NJVm1kTmRuSHU2SThZdDhXMU1WU2Ey?=
 =?utf-8?B?VDZNaUszVS95L1FsUU02d0RCYmxicjhmZWo3cmhvaWN1YURWVE9ycXVhMFhE?=
 =?utf-8?B?M3N2QlJ2Y0c3TDVvSUFVcGZwYnZxaERUL0JxbUhzUHBxekoyYyt4QThySmVt?=
 =?utf-8?B?bHAwUXJHckQ5MUpiLzNxSyt3ejAwT0R0QnYvSkhjMEdIbDlqNTN1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03B80E08D5A8DC48831821370901E092@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f863b4db-af88-4bae-f8ca-08de65b7b9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 19:41:30.2511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q37FVHDBd91zq0yIITQMD5hTRz/uuiSPf1HbfwjFKlusfqqevHUCc2glZ8mGPFa9CALKuoQSN6NekNx62B2Faw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDIwOjIxIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICtwdWIoY3JhdGUpIHN0cnVjdCBGbWNTaWduYXR1cmVzIHsNCj4gK8KgwqDCoCBoYXNoMzg0OiBb
dTMyOyAxMl0swqDCoMKgIC8vIFNIQS0zODQgaGFzaCAoNDggYnl0ZXMpDQo+ICvCoMKgwqAgcHVi
bGljX2tleTogW3UzMjsgOTZdLCAvLyBSU0EgcHVibGljIGtleSAoMzg0IGJ5dGVzKQ0KPiArwqDC
oMKgIHNpZ25hdHVyZTogW3UzMjsgOTZdLMKgIC8vIFJTQSBzaWduYXR1cmUgKDM4NCBieXRlcykN
Cj4gK30NCg0KWW91J3JlIG5vdCB0cmVhdGluZyB0aGlzIGZpZWxkcyBhcyBhcnJheXMgb2YgMzIt
Yml0IGludGVnZXJzIChhbmQgc2VtYW50aWNhbGx5LCBJIGRvbid0IHRoaW5rIHRoZXkNCmFyZSBk
ZWZpbmVkIHRoYXQgd2F5IGFueXdheSksIHNvIHdoeSBkZWZpbmUgdGhlbSBhcyBzdWNoPyAgSWYg
eW91IGNoYW5nZSB0aGVtIHRvIFt1ODsgdGhlbiB5b3UgbWlnaHQNCm5vdCBuZWVkIC5hc19ieXRl
c19tdXQoKSBpbiB0aGUgbmV4dCBwYXRjaC4gIFRoaXMgYWxzbyBhdm9pZHMgYW55IGVuZGlhbiB3
ZWlyZG5lc3MgdGhhdCBjYW4gb2NjdXIuIA0KUGx1cywgeW91J2xsIGJlIGFibGUgdG8gZG8gdGhp
czoNCg0KCWhhc2gzODQ6IFt1ODsgRlNQX0hBU0hfU0laRV0NCg==

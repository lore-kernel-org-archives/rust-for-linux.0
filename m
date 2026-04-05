Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azhn15012014.outbound.protection.outlook.com [52.102.136.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141C19D8BC
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.136.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775401308; cv=fail; b=T3MLvBpTbgLX2KWq95iPj+inE1uI7ZeiSUIJqndVlHlrlGMSpWKjWlJmrojn4OUE+vXmIDAy5cYw1Ogav64elcvg1AkMbYZatsfKegl/Ab7cnunm6FRsw6vGI5WS9jBrQKkEsczIkVSKUvBpIeAs4GRTFg8gjoyFqbgO6uqfJ7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775401308; c=relaxed/simple;
	bh=iugVix5JYGX4PpgHt/hqbkNkvMeqaOrAlbKP089vYKM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=q0MVXVhXv10mJBoQEmZwByZ9fvQs58kCAG7SmI6p09UcFFaIe3qrXIwmhB9cFt6xN6ODA4gQOBhsXav29CH9AahHvF0rAhb6uPPfFu6WuTSpEdalnkZYV0iE5zqWmTi9vZ6XR/RWQGcoED2v2E5C5QmyGjoRst0rEFmcmI5ylik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UgulOlLg; arc=fail smtp.client-ip=52.102.136.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UgulOlLg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe1nLFCTZ46QgZ4424RVZLOBreduKRCyjf8cphRh8YpKcTIUm0yaRLnUXSIuK5xH8QISCjd7wcZ9RCExN/+1OwdTlJ3jqswJ6saLgQzJbzWrrLRiZRV7dzaIWzHYLrW94a8WEHuUupZWujvIW4RReKYRaWrlzNBpJ+jqj80MDFbDiCRvN/8S8u5Xu277lEOqYFtSRCYY4vkmLxuNswz+RCnwW3sGsuQIbX+W+7qfcxN34NFWtKWdUfAZ4pb+/HqOp6H+efHv83tRl5uw7m52G2hXeppSdc77Cpzj9+T76AHDsV3M9IbLuqRKlklmss1F+lv9w/a3Lu0qkqluJQ0X5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYQfUmBJYh1PURjqx0gTH7FnWS/kpQ+Ne5bKfhTiGjA=;
 b=g8Rwq3B4CZjfXhpSNPy4RNxcwzZMpLrtPUFyWjLMAZMFsrmE/RGbAoVeEOhMxQCK9RcErXGodg92vyq2TZItkG6O6kNIBRLrLKXmO6KdRibnchBk9WgXtDUbwJiaQ6n3NtX/yLubN+GKJSV3IgZqBiCavXa4+RBwqV6FOY+BCQsLpJz23IonOj97/o1GEcxX9XlMcTcq0FjJhPf3vh5t3zzYpIyCQCR+7Y/XbU41Eux+rXSlKOqsm9AyBEF7jEqxsG2LwT9JVt5OExdKD0qvukQyL8h6qrL2UvrOdsfR6WBebXygpEPKWg5Uv174+CcCYOzSXL/SWFfRyP/Bgxtszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYQfUmBJYh1PURjqx0gTH7FnWS/kpQ+Ne5bKfhTiGjA=;
 b=UgulOlLgE5LG3THWwJmjfL02yn6q9mNIwcf8ta2OmRXU/rhMwfX1Qv6yMVmeDU6dM522VfBdXCF5tftavPjGGXKpZ/75Sji2emyOJgYrb2s640kTVSPgM3GcA6Ho5pCkfOpXFzhzYVC5XQd20Er7Pn/X5jV/fXQtc7OiIr4fAiuMUpFhrfkOPwiuWuJNInGA2ZasNwLhFnVGb1hlXqtBrHRpInAvZQpNOFhuWvaKA8/vxIAtaNAQd/TRBKUfRQdirc4cJBD87xyvLxtFsR1lEbJrUioHMgkKbnJdd0qbxoEjCn/YojkVf6x1Ch7B5aYEGMJCEN/X653zmPjgk0pPbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6117.namprd12.prod.outlook.com (2603:10b6:8:9b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Sun, 5 Apr 2026 15:01:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Sun, 5 Apr 2026
 15:01:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 00:01:39 +0900
Message-Id: <DHLB8H63S0R6.1RP67M1C8S5G4@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/8] I/O type generalization and projection
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
In-Reply-To: <20260323153807.1360705-1-gary@kernel.org>
X-ClientProxiedBy: TYCPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2b3c70-9c37-46dd-50a4-08de93243f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFVtOFlVSWxCS1gxN1hTaVdidW90cW1YTVZGUTA5V3pURmZyeEx5aVM0UGN1?=
 =?utf-8?B?cm1meDF0N3JTNmlrSzAxcThNQUMvZlhwSTdBL21BWHNodWhrVmgxb2g1QzVi?=
 =?utf-8?B?eFN6bGN2YkhaMG4waW1CTmgzWTRwTjZ1Q3FDeFdUOUlpeGlFZDBXY0t0Q0Jp?=
 =?utf-8?B?WnRHV1Y2RnBpZ0VacW1JTThURklaQ0RMS2ZWaWkrYzNFRW81QW9qajVaUTNn?=
 =?utf-8?B?Y3VMSDJZRVJTaUtzNmxnRk01elVVM1BZRE9IVnIzMFJFR3pOcjRjTlpzOGFl?=
 =?utf-8?B?ci9hc0IydG1qdnZ2QktZdWx2ZFM1d2ZnSnBtYXBRTHlXUnVVTWZTUStpVnYy?=
 =?utf-8?B?QURQekZqSUQ4SUtpVWhYeHFNQ2dQV2s5Rm5TQzFwaDQvc2FOcHFEMWRkOFZB?=
 =?utf-8?B?YWgwT0FaZjhJKzlvTDlnVnhkTkhZQ01zdi9lWGc3RkhDR3lrMXZya2ljVEpY?=
 =?utf-8?B?cUFUTU51LzA3ZUpYSWJiZlRhZHVvYjRzenRJcExLUmpNTlRBeEpyU0tQeExN?=
 =?utf-8?B?WW5Lc052aDdXcVVGdVBVUWU0SHpHcUdKZnFrS2hIKy9yKytncXRvNngrVktB?=
 =?utf-8?B?TDMxRnFYclB6WHhyNDZaRFZNVGNRTnNHYlNtQWNVRHlibko5WU5JK3lQdE0y?=
 =?utf-8?B?enI0bkp6WnNLNXljL3pGbEhyNDk0anJuQW1VTW04SVJUeWNDVzdOK25zRE9D?=
 =?utf-8?B?QXU5QzZ2T3RERlZ2N3B1TUcyaGFqeVJqNGN0dHg5d1VEd2dMNm5udnhkbVhq?=
 =?utf-8?B?SUZXL3E0SVpIdDQxMWpVZzZLUVBKREZ1ZWFBMTNsdkRZNUpnNytJN0ZlbjRW?=
 =?utf-8?B?MXVxQjMxNVM1UHZ3aVQ4RHRLY1FZSHhVcWF3cTZvTi9Qei9VSzc2ZXJITFRQ?=
 =?utf-8?B?dDdqbFVjZi9DTHNlL2pOLzBjYnZQLzV4K3lEN1FwWnRvOVJwRC94TlBncHF1?=
 =?utf-8?B?WmNXa1A3Rnd5SktWTEtwM3JoNTZuUlZGMnJhSEt0T2d2ZFN3YzlMeGljZGx2?=
 =?utf-8?B?TjY5MDM1VzJiTnRTaGRHYlZpYzBHbVB6MHl6bWlGTDZVK1l2Rm9LV1o4S2V4?=
 =?utf-8?B?cUJOUVFERm4xS2ZwVFFOb2VNZHRWR0Vvai8zdlRodzJDUG01N0JKOFdXc0FD?=
 =?utf-8?B?N2dpNzF4SUNoSDZEalZDMTJReVlSUVk4SW9ja3Y3VHRtU1pzYTRtWXRrZE9w?=
 =?utf-8?B?M3Q5Wkt0ODc5cjRQWTVid0c5M3VGN0pqQ2pIYlhMK3dRQXp1Z09GZ01tdDN0?=
 =?utf-8?B?RzBUVHJXM2lXY0JXb0s1MU9iRi94L29uYjIyTlNrajlFSjBsRkdqVTFGWno0?=
 =?utf-8?B?dGJmNVo2Wng4UU01bmVSNit4Y2tXZzN4VTNibVBwOUVwTUNNY2FWUFJvbHpi?=
 =?utf-8?B?elpRbDhWOUhMQ2hxMlpML2NQSEg5dE9rUzdqTEdUTjdjOFVyK2tZSktIU1dq?=
 =?utf-8?B?aDFFb2JIZk00a2lUMFV0em5UeFdEYTlKQUpTUHQvWlF6aVIxNkticUVDTTVU?=
 =?utf-8?B?S0R1OU1oaEQvR0QxVFVDL3pDUTF2M2ZQTVN3MHZueGFNc29DbHRKR1k2a3Rm?=
 =?utf-8?B?eDhld2NmSXRldVJTekRpZFliTWNIQU91bjJ2Y29weWlUZnRVLzFmSmhqRk9p?=
 =?utf-8?B?bnh4UFFjV1NvSUYyZGJwRFlJQi9nRXNDRGVDTDFSZXVIRkxvaGVpRnZLY0Jk?=
 =?utf-8?B?Zmt3VmhzWHBlLzdXUjROdTk5cFFEUjR2QUZteVRIVFJTbysrUmU1RFZxYVNM?=
 =?utf-8?B?elRhVmpoNWo2TCtsdkJyNjZ4TWEzWUw0NDdXRmxLR2g5WUR3b281S3dnVjBi?=
 =?utf-8?Q?68gZCplBtL+FYF6lAdcLU3woQEddHivx6dWQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0lWb0FNTXA4YXpVSGx3R1AxZmhNNlA3blFhMEN6Q1Vwc0V5bnJaeVRieXgw?=
 =?utf-8?B?aC84UzRuQkpKZTF6SE9HMGRSSlFWY3FkY0l2bkUyVytNeDlCOFlwWjJpZSth?=
 =?utf-8?B?djNkL1RrYlA3eEJRSU5ocktmdmQ1Tm8xbTVRMWJ4WFFvZlVYRm1sMlo5QjAy?=
 =?utf-8?B?K2JuR0theVFNR3VsS3NpMUxwSTJ2RVNQT0Z3MHI2QW9hWFRvYzNVbWtXY3Z0?=
 =?utf-8?B?OGFPSE8zWE9RcnFvYUZSVXRzbGg3MXJBbWtybW4yWlhjMUhCeEtjRFJaWENw?=
 =?utf-8?B?SlRSa2U3K2lybEFwT1RCUUpoaFFvNURFVjJ1endiY3FqUjFBS1puQTBDTjIy?=
 =?utf-8?B?OCtSeWx6Z3ZuWWZlTkZva3NWVXFJU25KT0hUZm5jK2VVT29SZXM1R3U1cTA0?=
 =?utf-8?B?OUNqUnZDT3U1eUVZazNWYVpjdGJVL2hacE90emQ4TWwvQUVPTFYrYVJaUkRD?=
 =?utf-8?B?YjByeDQydXFEbUlMc29VaUswRXQ4NE1Kd1VaYTYxZGRUWnFsUW1mMS9KcjNJ?=
 =?utf-8?B?b05BaVdyV0dzWXBWeU9yMXdFeHhOVEVMTEY1NUh4eUNOMDJuSVl2YjZOTXZK?=
 =?utf-8?B?Y28wZ2NHTXRMdE9TOEZYeE1yOTlhMEVnYjhsb1RqME5DTzdtcGQrWFRTUVZG?=
 =?utf-8?B?NksxRzZsejRIWXliZjUyTTVWeDMvT1Z2S1JJb3ltOFJGaFRKeHVlNStkcmtE?=
 =?utf-8?B?SzV4WUVpQ3d2T1JUVnRjb2kvbkVpbm5iMjVvZG5WanZHMkNDeVlnS3o2emVl?=
 =?utf-8?B?RmlWSWFNdnNrYnJ2eEhtb216TDBHK1MxM3MyMDZJa0cxajhVOVlJeEpNT082?=
 =?utf-8?B?ZHh3WjAxY1BhMzMxVUpNRlRDUXNjQjl1c2pwUWQrU2VEZWtVZG1IdjI1TUFT?=
 =?utf-8?B?N3p5RGtMbzdyNW56NkRuMTFvQ0pUWldiUjVRVCs2T0pSa2IvbWFyZnFIZVY3?=
 =?utf-8?B?SVdWVmJxSlVac21sSjNJbEovRDNGOVZNZW5NQkVRUFBqalo1bjVyRmhEaGps?=
 =?utf-8?B?T2lOSFhZVlRyVUZnRmdVUTFzYnhrZjdMYUlDVFQydmRvTGlZSDFoZnFZam9j?=
 =?utf-8?B?d0sxQVNJM3kxWnIwQVE1dHF2bWNjOGdidStpR2FTOWhGdEVJaFJPNi9xNlFa?=
 =?utf-8?B?RVdyWk9nQTVTcWZlVjh0OGRPb1hnUHlDZEwrejV5WjkxbXViVXJSWWFGYThU?=
 =?utf-8?B?NDB0SG1WWjR1eG4vVU5MbVpPV3VyWjA1SGx2a0VieTNIakJmejJJWjdmOGhD?=
 =?utf-8?B?aUMveVJSSWZJUXMzRHBBcHYyRGUwSXZMaVpIcmEyZXNwc2dwQjFITnlyVVk1?=
 =?utf-8?B?dVNkUXU1K1dHYkRmN0k1ai85S1JJTGJKdmIrbkVISTQ2dTB5NWtZMUJCdDdY?=
 =?utf-8?B?V3NzQkxqMUh1dVJIOTRybmNmVGFialFxUlhqckNGQkhlUktjY2hHZjBiTHh6?=
 =?utf-8?B?SDE2d3dhQ0RERk9jUGJVK2xrRWdsZHhFODRaMFlKZlpzaVU5V0F0WE1yZHE2?=
 =?utf-8?B?T1JhdVVJQ0tsYjRmVmY5SFNrV2dTUDE5MkdRMDJiTVoxbkt1N2p6Sy93bFFy?=
 =?utf-8?B?ZFg5Nk1hZENObG1CeFExNGtHZ3RTRHpCUVBtVWhGUU1oNFY0ZjNWK2QweGtT?=
 =?utf-8?B?eS9mM016U2FEbVdnUFJlNUZBZEVoOUJzVW9RV0tJZ1J4REdVVjQ5K2FvUnEx?=
 =?utf-8?B?VmtjYm5rWC95Z0tqNElCK0M4TkRUQXFvS1lVNHdQL0MzMWo4Zzh4VEgxY0pZ?=
 =?utf-8?B?d3FPUEJKNWx1NGxkU0xvMzFmbkJ6amtKQ24vNll2dHNWaG8vY3FGcUJZaVRy?=
 =?utf-8?B?d25HNEU5cWtqV0luRGJyVWpZYWVjVUw0ZHpmdDhCcGNGcTdVb0F2VkoxcXo4?=
 =?utf-8?B?YnMwVjBuSDJzNlEwNGJaQ21EUE13RkwwbWVZbGJLS1NubzRXeks2N2g4djF6?=
 =?utf-8?B?NXhyUWNzbXFZUG55cHYrSUE3T3NOYXdlTmx1VWxqMy81OUZDTVhvamR2NWpZ?=
 =?utf-8?B?TVlEMU9yYWUyME5RRmNKcVA1Tm1kZGhiWVpraFRJUzNUeUhoRWlIY09RbFFa?=
 =?utf-8?B?czFPZjFVV0NrbmtPK0ZzT3NjNzY2a3BWSW9jSlh5L04yU2V2QzdYNTEyRm5u?=
 =?utf-8?B?QmdwN2ZEZ2xhYzVveEwwdkh3azNlNHFFa2JkR0VMZzQ4SDg3cmt2RzZNaFky?=
 =?utf-8?B?bTZucEhXUkpON1Z1cDd0Kzg1bjBoS3pHTzF5UjRRSXZ3S09CcUZvZ21tcFdi?=
 =?utf-8?B?VXQ5ajBHMFdCNjN0ejdaaGNoOWlZS2R0MHNxbDBKMDY4V0xBNkUybzB4SVZk?=
 =?utf-8?B?NkZieTN6NUZEYzFBZ29xY0dhcks1V05waVlGZGhkc2pxT1RNRW15b0Jwc0p6?=
 =?utf-8?Q?t/wZrHZBAP0uHEDSDjNMu4L/cqTCRAWRkbak/9glsHc6B?=
X-MS-Exchange-AntiSpam-MessageData-1:
	2cgd+sM4XcB8tAJao6xSnA8V5nLdyTm6NQooNeaSQVgxLvdUCP0q7frZmEBja+mpTTL4B4ti3rRNQNf3txnaEacuXkncunWTzfz+vdj0t9KsbRTLO7r6m+chXlyT5ZtiG4EG8Lly0qHI8EH+qAPL2JWIYD8wv/mRVkw=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2b3c70-9c37-46dd-50a4-08de93243f45
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2026 15:01:42.4313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vV2d9t/thbAi92UT6V7SPCsecr/eCW/KUbXf/fDM4dngEutwtaS96Lh/O2gdjXp0BjNllpHghhwGq8bY/YwfjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6117

On Tue Mar 24, 2026 at 12:37 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This series generalize `Mmio`/`MmioRaw` type from just an untyped region
> to typed representations (so `MmioRaw<T>` is `__iomem *T`). This allows
> us to remove the `IoKnownSize` trait; the information is sourced from
> just the pointer from the `KnownSize` trait instead.
>
> This enables us to implement `Io` trait for `Coherent<T>`, enabling
> unified handling of MMIO and DMA coherent memory. It also paves the way
> to uniformly support shared system memory, which Tyr will likely need
> [1].
>
> Built on this generalization, this series also add a `io::View` type
> which represents a subview of a bigger I/O region, and a `io_project!()`
> macro that provides a safe way to perform this. Some Nova code has been
> converted in this series to demonstrate cleanups possible with this
> addition.
>
> This series depend on the Coherent API rework series [2].
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/Generic.20I.2FO.20backends/near/572377073 [1]
> Link: https://lore.kernel.org/rust-for-linux/DH87CCNRR5EC.2SK3IT6N6Q8V5@n=
vidia.com/ [2]

I'm getting quite a few clippy warnings when applying this series:

    warning: lint `clippy::invalid_null_ptr_usage` has been renamed to `inv=
alid_null_arguments`
      --> ../rust/kernel/pci/io.rs:78:9
      |
    78 |         clippy::invalid_null_ptr_usage,
      |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use the new name: `inv=
alid_null_arguments`
      |
      =3D note: `#[warn(renamed_and_removed_lints)]` on by default

    warning: lint `clippy::invalid_null_ptr_usage` has been renamed to `inv=
alid_null_arguments`
      --> ../rust/kernel/pci/io.rs:94:9
      |
    94 |         clippy::invalid_null_ptr_usage,
      |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use the new name: `inv=
alid_null_arguments`

    warning: macro has unnecessary safety comment
        --> ../rust/kernel/io.rs:1045:1
        |
    1045 | macro_rules! io_project {
        | ^^^^^^^^^^^^^^^^^^^^^^^^^
        |
    help: consider removing the safety comment
        --> ../rust/kernel/io.rs:1034:8
        |
    1034 | /// // SAFETY: Instances of `MyStruct` have no uninitialized por=
tions.
        |        ^^^^^^^
        =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment
        =3D note: requested on the command line with `-W clippy::unnecessar=
y-safety-comment`

    warning: macro has unnecessary safety comment
        --> ../rust/kernel/io.rs:1086:1
        |
    1086 | macro_rules! io_read {
        | ^^^^^^^^^^^^^^^^^^^^^^
        |
    help: consider removing the safety comment
        --> ../rust/kernel/io.rs:1077:8
        |
    1077 | /// // SAFETY: Instances of `MyStruct` have no uninitialized por=
tions.
        |        ^^^^^^^
        =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment

    warning: macro has unnecessary safety comment
        --> ../rust/kernel/io.rs:1118:1
        |
    1118 | macro_rules! io_write {
        | ^^^^^^^^^^^^^^^^^^^^^^^
        |
    help: consider removing the safety comment
        --> ../rust/kernel/io.rs:1109:8
        |
    1109 | /// // SAFETY: Instances of `MyStruct` have no uninitialized por=
tions.
        |        ^^^^^^^
        =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment

    warning: 5 warnings emitted

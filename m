Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022112.outbound.protection.outlook.com [52.101.96.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CE359F98;
	Fri,  9 Jan 2026 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960185; cv=fail; b=XWczwCGGIHgLSkb82dz+yz4IiwnAXNiJ9HOGVc7nSyxCRKR0N3huKJljidi02iRtyq4Vq7aPRs21xRtQhotd4KLHcA1z9jgqqcklkzlN0sGRqf8tKoHrAHEjYFKDcdcYOGbsm1q7kFS5369e9QPvQW6EGZfb1KuU1kDq7z3uXnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960185; c=relaxed/simple;
	bh=zuYbv5JtQIoGZOADINKJIm9fee21PIDFWZbmuP+zk/0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=c90+FHOn9Maw+UdR23BDZnlR+SlJCEsON4d+xLIAyxv6tDINr0R5yRcHWQMhEuTeSYPlyQISIBwsNmRSauOfT0jfzWKy+3ItPzy1XGUTLc9QhfyU4MSK34b1E6gs9slwbITATAtj6VYsNf5ddwQbKrGOkH+sMR4uevEa5ctVLHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ya9PHBpm; arc=fail smtp.client-ip=52.101.96.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ya9PHBpm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVIqjy9/gbBmBbuFvRLtxGmmLn4/I+BFtgXJWTYg5Lkz/KE0PH3ITK7cmfzDPiKxK9o0cvug3RSOsedBVBdp+zgaamecXUa+GXjfROKy+dm60Zvwa3WP46fJrwMmREK8Oz3crrbNOcPq4hn5IJH0M9Y2ChYn5sKvwjqcMeYyld3lbjRVvJCFMRfJGZk1wERcPCWiOPo67A0VUGUCcZKp5L3cYmLcjglTp1i8yc+owBtrS75P3Ecr8RNraCKYmJnQLZbyP3AJGhzehYoKO8+vqePfW38Z+kOGq5ZsG40fkJEDR+Dy9VQUEiKy2cg80LMaZ6YCQ33VkV7Fs8YVuZuG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEFpWfzQGzkJse269/1vsCFKbxgGCIWYMeT1zwBKcRI=;
 b=Jx7ostSQJbSBjllSvlXRwmM5guDx4DLtfvqwpVgIzDzM6zLktfqqOba9e59esRFJTpOlRfcmlAdG0WOV4DzXphaL7sBHNxaWm/WBlHmp7lo6UAGdh/erKTrXJsgWMBImW3IqRLe2az5joDo1c1EJPjA7+n5PbFszACcbS2f4rhA7+kaEHA3zRD47v8LXLO7nEBzXQGL8FKXzOPHbhYM6J6RSX/u2A7bEUgcMX3K+8In9eJMavdyT30oVYC0SamTokHMfyH6GAA5168Ep5XA+w78iF587U7uD4xqFk7mvFL1IokGYaLT+2EQDLHhIGppATTHEHiJicKuv4weooLYNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEFpWfzQGzkJse269/1vsCFKbxgGCIWYMeT1zwBKcRI=;
 b=ya9PHBpmua6P4rSCM63Vc8HcQHsM2IYCyqMJX4QvQMVCC0FzsEXAAmxrT70Qfx+cpjS3rM2QdoW2/dI3aW46XYApz5pPBAbcmfAyI1aJiL8lrwsS9Bfy4ObiYkpe+XfrDfK3LGaGW/85y4tXbdaYj6OIP9vOW+XhWLwfeSmz3qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5767.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 12:02:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:02:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 12:02:57 +0000
Message-Id: <DFK1KT28KH9S.QV7VCG9O9VGV@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] rust: pin-init: rewrite `derive(Zeroable)` and
 `derive(MaybeZeroable)` using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-5-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-5-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 975e6174-d1c0-4c4a-d191-08de4f770791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7142099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTJEcmFCM3d0U2RGeG5GMFlEVlZGQ0pNUVJjVWNnUGc3Uzdad3MyVDRDWDVY?=
 =?utf-8?B?TGFYcWhHdnVyTTY0dzhYTUR3SDNoeVRJUGdTRW1LU2ZlZUt0S0NHblBpckxh?=
 =?utf-8?B?eUY3UDNRekNsdmQwRCtVaGcwZXNOYWdXYVIraWl0RTFYaDFWTjVqaDAvNTA2?=
 =?utf-8?B?QnpObzBzMFhiMVBCN2dHZDN5NnlsaGVlYy8zak1DOVRaeThKTkxVZ2Fwcmc1?=
 =?utf-8?B?TWpKTDhaYW9aYXdPMGJEVGN5SGl1N0l4RTR6WElXODlPa1hOd1hOVFRkbUxp?=
 =?utf-8?B?R3libFRaK3h2ODBqVGdiSXpXNUVBYS9RaEpHUGQ1VHJRaWVUVzd4N2dxeWZU?=
 =?utf-8?B?MnZMekpGOWh2QXVqVlo5U1VqM1lIeG9jMUFPQSszS3F3Zi96dTBDUzRDVmxa?=
 =?utf-8?B?VFRqeUVQVmxYMExBYisvb1BmUHJzMmM2V2xySTdsYm5NZVBBTjBHa05QVEd5?=
 =?utf-8?B?MVN6eW1zbXFHZHNwOFVjRFIyS0liazhFbjRBK0NWSlBSbmI4aHVOb0NZdzNP?=
 =?utf-8?B?dFZ3MFVKZmdFdVJYcXNVcnhxV05EaHRxYzdYc1BRT1JFaXQ3Zy8wSjhyd3NU?=
 =?utf-8?B?aDNaNVlsdkdOS1JPNGhBcEVyaXA4VzN0aHJ4R3ZTUnVVeFl5SmRTSHluMmFH?=
 =?utf-8?B?UTVZMGpGd2w1OUsrcGt1WlNRMTFmbVZJRzBJM1U1T0s3cjJ3RVZUcThwanFR?=
 =?utf-8?B?cUw3R2VpZGhwQldNYVl1NEhVR0ZSSjZEWWIrczFzWC95TkxSVGQvVVQ0bUhk?=
 =?utf-8?B?aGVJYjNiSmF0S3NiK21xTnpTR08rRHl3S2lIYnovZzdyNGc0RVozRm5ielpU?=
 =?utf-8?B?cGFrVnJqVmFNWHllVVRRZ3pzMDBFMmU2MmhvWmJTd0g2cGthOUdQSEJ2TUNt?=
 =?utf-8?B?YzI0SlI5YVhUV2trSkJCWmYrZXJ1QUc3Yi9zTjgzS3d3RUE0K0JrS3ZQOGNi?=
 =?utf-8?B?U1crU3JQZmpqaFZqZzlnYVRCQTFZV2JWN2tveXlRVDR0aWtXQzZCYzhlc2ZZ?=
 =?utf-8?B?bXl2VVRSNmF4Sm5YaDdpWjB6VHdXVnVpdTZCVVNPMUN4bzkrUmRUdnV1K09n?=
 =?utf-8?B?SlZ4MnErdHIyZHZ6NFdzOHZtTWNGVHFFVVE1YWpaVXFVenVMdmVGQ0s4L25M?=
 =?utf-8?B?UkFyRHM5SlJDVTZmS2dsa05MRWRhRWcxNzJVZjB0UUVmWEZZRjRIZkRPN0hG?=
 =?utf-8?B?L1ZTUGI3YW9kS3BLMWlWbitMamkyYnpqNCs4Q3UxQjdUcFZOclN3ZmxYZHln?=
 =?utf-8?B?SzZnaTNaekFBTGRCL2R0TWhrZVRCblhMR3h3OGovZW5kbEdnZlRkUTY0NVZT?=
 =?utf-8?B?Q21qNGVNN2tlSzJiTUFyQjhCekZ4cWlqL1RVQTFzTnBlMmVZYmxGbzg4aFlF?=
 =?utf-8?B?dEZDajBwcnVHUDVnVHhvODEwUVhpUlY0L211aG93MTNPTld6djJObkxiVllI?=
 =?utf-8?B?bG12OHNLVXdEWXdjRXpYNy9wNG14Mm9RNnhBcG53bnZHSEgreDVTWklSL1BT?=
 =?utf-8?B?ZUhLSTd5Q09FMDhxOVhudjQ3VGk3aHpNdUprdjV4enNKdGJXQi9XRmZpWW14?=
 =?utf-8?B?SEJvV1Nad0dRNGRGaXFGTDhSdHZIT0prYkUxeXYyRzF3OUI1L0dyRDBSc0VI?=
 =?utf-8?B?dW9EdGcrdGJtU3l3eW03MGd6Ujk5Rk5JQ2dqbDZMd0RRV0VxOFhzUEF0LzBC?=
 =?utf-8?B?YWRwdVBDekhXbGpDd2hBcGVyaC8rUGxUM21Mc091NVBuM1Vwd1RQcVRneWV6?=
 =?utf-8?B?RzAwR2d3WjFFRkxYaHVsWG5MVHcwNGU5QWdTY1cwdkwzcytzVE9rUmlQYVU4?=
 =?utf-8?B?K1V5cy9NM2x5ZGIxbndaaERrWjBLNGxhNE03dUZzMTVac1owbHUwK0JDdzJL?=
 =?utf-8?B?R1o1TWNhc0xQVTZUTWNsNE1vaGtYUzltZnJ4RmRYWktSTmcrdEprUzRnU2J5?=
 =?utf-8?B?Ym1zM2dTQm9PQ1VtckFaYnZ6SWUrdU5EQTVYdnRjUDA2RGFsL0szOUJ3bExy?=
 =?utf-8?Q?OZepteslkJWpdMACK9VNCm3kBEgrIg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7142099003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3RaVVJGbTVhd1FrUlBmTDdDNnM5dHpiWThHTjk5Wit5cWFJYWtPek0vdFBr?=
 =?utf-8?B?Z0o3bStEUjZHa0ZZaGVzdlRITjNhcEJhaGZoekxCdDJCY2prUWxnVVd4Tksy?=
 =?utf-8?B?QThQc0puYkxncVJaWnMreDVBUjJjTEpCN1ZUNTJraWd0bXAxMGlvcDJOOWU0?=
 =?utf-8?B?ZUF3WEFIL3VXL1owUFlSMDZTSmZIOFprRkUwNjBBRUczcnFaZWk2N1lIdnlV?=
 =?utf-8?B?TEF6NmZLVUI3QlZSUWhoclpyNTFrU004UVVkZXk4bHNBY3ZaUytBMG5ZTHdo?=
 =?utf-8?B?U3NBNFRNdXBKYkl3ZjNTSDFsYXdLSWp2UTRDTkM5OFFjdm1oVG9mTk1HRWFM?=
 =?utf-8?B?Z2J5RE5mTHNKaXVvTHB3cHp3c0lTakNYWDNsa0J3cjlVRGhHOWxhRU9PaVNM?=
 =?utf-8?B?SUdRYm82dHFEQmpwcitvQzNCbzB6U0RPUk5TL2lIUTNCYzM1SGdhUXl4d2E4?=
 =?utf-8?B?OXhvcllqYkxLTFJrV3NPaDJFd3VFemRPNGVEaXdpL2JnLy9IL1U4ZnhtcHlG?=
 =?utf-8?B?WjRoQ1RvMkJaenluelRha0lzR2UvVW14ajJwZlV2cEYvbCtNM3RpeE9pNjhN?=
 =?utf-8?B?ZjF2eGliaFJMa0QveEhhcytsY3hvWFVaa2MxYkV5YjVtQlhUUTc1OUdJWitr?=
 =?utf-8?B?ZmtxeTZVYmdVdlVmRnRwd2lQT0RBN216YjBjZzI5OGVPTDNIT2NHUXJVSDdH?=
 =?utf-8?B?a3BMNGVNVzJOUkVUaWZZVXZ3SysyK3pkSHd4enNiTHJWN3VEVTZHbVd4MFBp?=
 =?utf-8?B?b08yKzBMbG1jMlZUU1ROVzJWTDhENHo0dlNkNDNuSDNJQzYyZlBmVER6eCsz?=
 =?utf-8?B?UEh0dTZvT01oK1BRZ0p0K0VEZUtrU1ZmVWU0L01kcnN5cC9WdnpxTEQ5Z3l2?=
 =?utf-8?B?N2JFNzhCT2hEQ2FoSzdieWhJMS9MN1B4UTVqL20wOCsrNlViNVAzQTlCdVJY?=
 =?utf-8?B?bTFXOUo4d0RWam9Dem00b2tkU3F2aCtJNmtrQWhIWUpQU1JVMHJGTm9PU1FH?=
 =?utf-8?B?YW94RHR6cndTT0dTaEFXTy9odjVTWTIxSStzR1BpbmJtVTRKMmNjTzUyWSt0?=
 =?utf-8?B?dzBzZzR6djBlcmRxZHU0TkVLKy9vZUhGSWhlLzZuaysxT2M4elJQOWttNlc0?=
 =?utf-8?B?aWRqUzdzVkZ4WkxEVVhKT2tPb2dmYkV6RjdsbEppV2FxSTJYbnRxbXJQWW5z?=
 =?utf-8?B?eStGb25ERDZHUDRPd1FRdGs0dFZEVENhcHg0N0wrb1k0NzFGdlErRDFNa2xJ?=
 =?utf-8?B?ZVpKU09MYXdSMTJCZFBTeENGdlo5aE12VmNWc05iUkNsb2hDT3VpdkZLRktO?=
 =?utf-8?B?TEVpZExHOUw0L1ZjLytjMlNqNlJWYU96eVljUlQ1alZmSWp2MmR3VTFtODB0?=
 =?utf-8?B?b0c0NVlMVnZyYUpmUjJZU0pyOHFuOXYvTWxKeStNMkwyemgrcXdMbXpKZHJ3?=
 =?utf-8?B?Yng5a0hLUmxDM3J1RmJwSmN3YXRlYnUvR3VvaUY4YTFCdjhWSzhHbkMyMDRW?=
 =?utf-8?B?NXIvNnpOYVdoNGlBQkFya3NBWnRhU0RTQXNONEorWUNSVkF1YVNyYUV0RDN5?=
 =?utf-8?B?c25mZ0JPazFsVUtRT1JyTHdtUURwaE42TWtZY2VmTDcxTS81eFhYbk01azVR?=
 =?utf-8?B?RU1OQXluK29nNDZwR3JHWTIzUWtlODhrakNJY1EzeTdLMHlsa3RoQmJDS0Uv?=
 =?utf-8?B?M0RaaWduN0pCQk0xbXZ3S0E2eStGOEh1NzVOZEFuWXdwL01UWlQxOGJMcjFW?=
 =?utf-8?B?V2hRM3NqU0hnSTFoNlBKWkhzK0hkdDNzNThWVStxQmszUFhZNjd6MXk5WEVI?=
 =?utf-8?B?TDZBTWdGbkFTMHVZL3o1WTY1OURIMStVYnBtdWtrdEh5ejhOQnMrc1Z3ZStl?=
 =?utf-8?B?RjduYVRobTZCK3NBc1Uyd01xbU85eG5qalBpZWpLZXIrdWZJWnYzTGR3MjYz?=
 =?utf-8?B?OVpXQXN2T0h5V3I1U1Nncmt5dWZETExiQldndUJtQ1hYMGt5dWpySWZDR3pj?=
 =?utf-8?B?Z1QzMVpUQjNZeGk0VVJMSWx6QTFEclBQeCs4bXZTekhNMWt3QXBpeHBYSTNP?=
 =?utf-8?B?TktJc0EwOHZ4WEt1aWVPWnVXdGh3NEhmZkx3QlJjZDhKUmJ4Qm9PNStndXY0?=
 =?utf-8?B?L2JqTnVxWXpoM3RyVUhUdm1iT3h3bk5Lcjg4ZzVMcDU0Q1VaV1JMaHc3MmJj?=
 =?utf-8?B?aVA4YVJQMFNneUdCOGEvRXRRZE0wQVYxZjNSZE9EeVpKaGdib05WRXNHUlhP?=
 =?utf-8?B?bmthQ1pCemd0ZXRVSytkTmt5c21lZDBYR2dZSTk5MW03NDdBK041SXhKOVhO?=
 =?utf-8?B?RG5ScXRFcVRWVWVMOFF1TS8vQkZqdmF2U2VTdjVYNkhDZXFuY29yQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 975e6174-d1c0-4c4a-d191-08de4f770791
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:02:58.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+TA534fTloEc07w0I5pjFpgp+K+NyXPMeExJS6KZdWuhCyUdFqD0m3RsEdQgTAaXyNaKVrBHfFuRq17BGADAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5767

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> Rewrite the two derive macros for `Zeroable` using `syn`. One positive
> side effect of this change is that tuple structs are now supported by
> them. Additionally, syntax errors and the error emitted when trying to
> use one of the derive macros on an `enum` are improved. Otherwise no
> functional changes intended.
>
> For example:
>
>     #[derive(Zeroable)]
>     enum Num {
>         A(u32),
>         B(i32),
>     }
>
> Produced this error before this commit:
>
>     error: no rules expected keyword `enum`
>      --> tests/ui/compile-fail/zeroable/enum.rs:5:1
>       |
>     5 | enum Num {
>       | ^^^^ no rules expected this token in macro call
>       |
>     note: while trying to match keyword `struct`
>      --> src/macros.rs
>       |
>       |             $vis:vis struct $name:ident
>       |                      ^^^^^^
>
> Now the error is:
>
>     error: cannot derive `Zeroable` for an enum
>      --> tests/ui/compile-fail/zeroable/enum.rs:5:1
>       |
>     5 | enum Num {
>       | ^^^^
>
>     error: cannot derive `Zeroable` for an enum
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/internal/src/lib.rs      |   5 +-
>  rust/pin-init/internal/src/zeroable.rs | 149 ++++++++++---------------
>  rust/pin-init/src/macros.rs            | 124 --------------------
>  3 files changed, 65 insertions(+), 213 deletions(-)

Yay! the updated code is much more readable.

>
> diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/s=
rc/lib.rs
> index 4c4dc639ce82..ec593362c5ac 100644
> --- a/rust/pin-init/internal/src/lib.rs
> +++ b/rust/pin-init/internal/src/lib.rs
> @@ -11,6 +11,7 @@
>  #![allow(missing_docs)]
> =20
>  use proc_macro::TokenStream;
> +use syn::parse_macro_input;
> =20
>  mod helpers;
>  mod pin_data;
> @@ -29,10 +30,10 @@ pub fn pinned_drop(args: TokenStream, input: TokenStr=
eam) -> TokenStream {
> =20
>  #[proc_macro_derive(Zeroable)]
>  pub fn derive_zeroable(input: TokenStream) -> TokenStream {
> -    zeroable::derive(input.into()).into()
> +    zeroable::derive(parse_macro_input!(input as _)).into()

This can just be

    zeroable::derive(parse_macro_input!(input)).into()

same for the below.

>  }
> =20
>  #[proc_macro_derive(MaybeZeroable)]
>  pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
> -    zeroable::maybe_derive(input.into()).into()
> +    zeroable::maybe_derive(parse_macro_input!(input as _)).into()
>  }
> diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/inter=
nal/src/zeroable.rs
> index d8a5ef3883f4..0328c3bdfceb 100644
> --- a/rust/pin-init/internal/src/zeroable.rs
> +++ b/rust/pin-init/internal/src/zeroable.rs
> @@ -1,99 +1,74 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use crate::helpers::{parse_generics, Generics};
> -use proc_macro2::{TokenStream, TokenTree};
> -use quote::quote;
> +use proc_macro2::TokenStream;
> +use quote::{quote, quote_spanned};
> +use syn::{parse_quote, Data, DeriveInput, Field, Fields};
> =20
> -pub(crate) fn parse_zeroable_derive_input(
> -    input: TokenStream,
> -) -> (
> -    Vec<TokenTree>,
> -    Vec<TokenTree>,
> -    Vec<TokenTree>,
> -    Option<TokenTree>,
> -) {
> -    let (
> -        Generics {
> -            impl_generics,
> -            decl_generics: _,
> -            ty_generics,
> -        },
> -        mut rest,
> -    ) =3D parse_generics(input);
> -    // This should be the body of the struct `{...}`.
> -    let last =3D rest.pop();
> -    // Now we insert `Zeroable` as a bound for every generic parameter i=
n `impl_generics`.
> -    let mut new_impl_generics =3D Vec::with_capacity(impl_generics.len()=
);
> -    // Are we inside of a generic where we want to add `Zeroable`?
> -    let mut in_generic =3D !impl_generics.is_empty();
> -    // Have we already inserted `Zeroable`?
> -    let mut inserted =3D false;
> -    // Level of `<>` nestings.
> -    let mut nested =3D 0;
> -    for tt in impl_generics {
> -        match &tt {
> -            // If we find a `,`, then we have finished a generic/constan=
t/lifetime parameter.
> -            TokenTree::Punct(p) if nested =3D=3D 0 && p.as_char() =3D=3D=
 ',' =3D> {
> -                if in_generic && !inserted {
> -                    new_impl_generics.extend(quote! { : ::pin_init::Zero=
able });
> -                }
> -                in_generic =3D true;
> -                inserted =3D false;
> -                new_impl_generics.push(tt);
> -            }
> -            // If we find `'`, then we are entering a lifetime.
> -            TokenTree::Punct(p) if nested =3D=3D 0 && p.as_char() =3D=3D=
 '\'' =3D> {
> -                in_generic =3D false;
> -                new_impl_generics.push(tt);
> -            }
> -            TokenTree::Punct(p) if nested =3D=3D 0 && p.as_char() =3D=3D=
 ':' =3D> {
> -                new_impl_generics.push(tt);
> -                if in_generic {
> -                    new_impl_generics.extend(quote! { ::pin_init::Zeroab=
le + });
> -                    inserted =3D true;
> -                }
> -            }
> -            TokenTree::Punct(p) if p.as_char() =3D=3D '<' =3D> {
> -                nested +=3D 1;
> -                new_impl_generics.push(tt);
> -            }
> -            TokenTree::Punct(p) if p.as_char() =3D=3D '>' =3D> {
> -                assert!(nested > 0);
> -                nested -=3D 1;
> -                new_impl_generics.push(tt);
> -            }
> -            _ =3D> new_impl_generics.push(tt),
> +pub(crate) fn derive(input: DeriveInput) -> TokenStream {
> +    let fields =3D match input.data {
> +        Data::Struct(data_struct) =3D> data_struct.fields,
> +        Data::Union(data_union) =3D> Fields::Named(data_union.fields),
> +        Data::Enum(data_enum) =3D> {
> +            return quote_spanned! {data_enum.enum_token.span=3D>
> +                ::core::compile_error!("cannot derive `Zeroable` for an =
enum");
> +            };

Even if it's currently just one place that could error, I would still proba=
bly
use `syn`'s Error type as it's easier to extend in the future.

Best,
Gary

>          }
> +    };
> +    let name =3D input.ident;
> +    let mut generics =3D input.generics;
> +    for param in generics.type_params_mut() {
> +        param.bounds.insert(0, parse_quote!(::pin_init::Zeroable));
>      }
> -    assert_eq!(nested, 0);
> -    if in_generic && !inserted {
> -        new_impl_generics.extend(quote! { : ::pin_init::Zeroable });
> -    }
> -    (rest, new_impl_generics, ty_generics, last)
> -}
> -


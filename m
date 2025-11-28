Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013070.outbound.protection.outlook.com [40.93.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AD13C8E8;
	Fri, 28 Nov 2025 00:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764290051; cv=fail; b=u+17M985q53JO7lO55V5YC5VkbM2aluGxEJh3neFcF/MEE5KHvtyQiwS/ii4mZ73/5fUNg9jcFOsSBqPNJ149/KuragQDc6en1TcCleJTXR3IYw1qUBFX/KzcF0biaFDRS5hUXPILJvkKXxNzr15JRWbZ8eGIfG+YwKQzoKe6vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764290051; c=relaxed/simple;
	bh=gdcyB84WsmjtBh4OgzB2ko9xWXR3C8ydOcWe3Ge1bks=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=qToz0Dp/jFQIeqqwRdW9x+1baB94yQua+vFQxoaWsJq5uA1Q54phtM1kU3PhzCndm8qm+ZXvnq4MZlhOlzn3pbvQB0+OeX72dHGiyWdmrqEJvwxo/Vu1pUvRzv+AVElRv+JrSYEHmDmZvCIc7YUcHyllG8MUcr85O/Aals5wj04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QzBtBpFF; arc=fail smtp.client-ip=40.93.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QzBtBpFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir9LMeZfJQe4QLRS0TIrxEkbVljkUVc42gYTD43P1Ym5pMCOpZlm7CoJDp43QhePxYggt94sg6Wr6FPhkIXb2QtjuX4QjYorktcnYK/mhAFI478bm5/+ed3qGh7gYrfyuqm0f9GNEdjHhwVzdZZpZsAQs1r9EC+iVeP11Oo24IyS8Z49PY9WWb8k0+eJxzC34iW/kgi/jnSXeaA3cVVeDWev1XE3OuCLJ+TQ9Jqn3aHdxW1Wti9D613muhueWAPqbn5KXE8YFyNxaDS/ULlesjyW4ZQzVBoAce4ucfRvEd/iItOYhd/y3mGaoXIrl+vFbvcv6YGkZdRxVg8ScApEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhy9fxssJZW7cR4d3R5FcxWmvvNF83rOJT4xp8NUP4s=;
 b=od2HbpNHFKzSZoUhFkhOcFqDNbU9TNdJ+MgxLOscKbRIY7E+U577rGy+A1A9sDOySK3feXTwGaUqdoeEN3pizOJNVXECemL/72Y6Q3gMPTBUdnkfvTnRtc33OQvr5kXdbqXhakgr5qmSJfmffQXUj8yw+MOpjn/gb8DfeK54xbzHHcQk7wuCeqaf6lU6iBSVXsegROdMBfu0oTaqfndtaGietf9D96RhryxOOhYa5Xr/hkZd6/MtAvVXyR5jGUxbEJzqznI38N7JQmVvDGHOOHAlLNtmkWZjsuG/JRDz87GFvIeHRa9zJba6GkAwLIWBoZcbuj++BnusyNj48ZX+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhy9fxssJZW7cR4d3R5FcxWmvvNF83rOJT4xp8NUP4s=;
 b=QzBtBpFFuK4BGfop9L+sukoma6R2KeAiFpk9LG3FW0vAgN2ZR5iT+4+nyk/x5NQCQHMqu+JI5m+QsP3H/ZZ5PvcAmtC/mRNa9ccNbupb73dI/Ax4PDavDICYQl3ZIRYs6nmU2AFthrC5S3Gmb2x5+fMBT4ZlFbgN1lXIhkZmwPVy3L51Pk0+JaQ6NuL0DYA49kzH7CNmgcS9eoYialFnkksXW36RZHaABz83yifrsVyW9I5zcXr3RYg+nzti8uZdbUjWJ3s6tvkBtHLTzUZ+MYDhjcm/e6OpyHgEcr2FS1VZENsucKoN7AkadBgcoyQW4LEEhZYw20m+SLOo+SnJvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 00:34:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 00:34:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 09:34:00 +0900
Message-Id: <DEJWMFHGUBJ0.1P3BVC9J7QEVQ@nvidia.com>
Subject: Re: [PATCH] rust: io: always inline methods leading to build_assert
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251127-io-build-assert-v1-1-04237f2e5850@nvidia.com>
 <A1A280D4-836E-4D75-863E-30B1C276C80C@collabora.com>
 <DEJWHLBKP2OS.2EI14OGPEERJ0@nvidia.com>
In-Reply-To: <DEJWHLBKP2OS.2EI14OGPEERJ0@nvidia.com>
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb70078-867f-42ba-54c4-08de2e15d5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG9UbU1iMjZLQ1VjM2tqVkd2aC9uc2JiY092QUI2Z1NoQjVTUEVXb2lmaUI0?=
 =?utf-8?B?ZlUrUzZTQWY1Y29QSWlQeFZZM3BRVGVzZTZlVVdqTktqSCtmUkRnaTVRVUV3?=
 =?utf-8?B?Z2VhQUEvTjhyUHRrOVcrWXRrTU5qRmRCZDdPRlBjWFdQeTJ1YXZ4dllBamNX?=
 =?utf-8?B?Y0ppYUUvWDFVOUdMT0N5UXFISWE3U0V0V0w0Q1JNVThUZkRDZ0VuOHJ5YXVh?=
 =?utf-8?B?NVVtMDNoZzBUQ2ZlbXhxQ2U0SjhKWVZONDJXSlRVTnJpb2QvK1R0aGZNeDlL?=
 =?utf-8?B?cWx3RTJPYkJhaWpZeWxTb0RhMXZXU0wzU2dITEFKZzFYUnZEZmUwUk5PQjhF?=
 =?utf-8?B?b1A4cmpNd25sODAwUWk0VkNnOHlPWGxRejZENm85UXdPcDJ3a3NCMTJvcTA2?=
 =?utf-8?B?bDRjYXcraytxRjlsRTd6eHZCTG9NL3pwc2pwdzVoYXBia3ZHcldTbG1qalA0?=
 =?utf-8?B?UEM4aVBzYkpTd1JwUVp5ZjdZbGxveTM0eHRnVHM5akhNWk9RKys5Q2dlME5p?=
 =?utf-8?B?QTBxeS9NbHM4WmI1bENTVFBnZ28rSXo3L3dGTThrMEVrVVdWTExrM0h6S2dO?=
 =?utf-8?B?TGp1OGh0Qyt3UWtUdUEwdmJzQTRwSFVpRmZJRjZQcHZiWWFXTzhIVzVhWDkz?=
 =?utf-8?B?VWlUMUdKVjNrUTkvdityV3piTlVGYkJXUGFDVk1lRVhwek84V3E4Y1Z2VmVD?=
 =?utf-8?B?SytuQjMwY042RXM1bTFmYTQzQVI2WWNncExMVXJ6TXpSUWRaUDhhT3pTNExu?=
 =?utf-8?B?dGIxODBhNjF4SVFmUnh3SG1pNURISUxBbXZqR0RjVEE2aWhNRlArNTIwZk0y?=
 =?utf-8?B?bXpvNEJmRWI3MlZGSTJRZHNTcW5oUWJSN2V5ZXlJT3lDYlIvT3FLZnZUQ01B?=
 =?utf-8?B?dXlXbEV0amZsQjZUVnRVVGJWNEw4eWZLbldBY0huR29NNVFOS0xCc21wby9s?=
 =?utf-8?B?OGs4R0lYbFNyTE12ZkltMHEycGhldGFKQUpJalJTRWJ6RHhaTUdjYkNvdk00?=
 =?utf-8?B?TWdQVHY2VUQ2MjNmWTFvdHBXWlhsc3dWM1VDRlE0WnU2bmltUVdzUUNNc2Qz?=
 =?utf-8?B?WGJ0djJQVXhhSkFJa1l4b3cwc2JPcHh2Rkg4cm1EbUtCSURkKzFCVE9yMFp5?=
 =?utf-8?B?ZUNjL3VBTzdUTFBHcXVqQm96NmNJa2ZiUTh3M0tYZ0MzdFZPT3dVYURUaEc5?=
 =?utf-8?B?cTMrTVdrNmVrK3ZqelAzOHd1ZmxTdkJsbHhEN0lPN0ZHZjgxSTFVSitjTnVZ?=
 =?utf-8?B?bGxMVEVBaGFXR1RxNzdsRzQ3S2NVRWlkSllVVEsweVNndDhkOEdvY3Z1NGh4?=
 =?utf-8?B?cStoOUlQZk9CZm9aaUoxMW81alpkazVraE0xQVR6QmJzYjNLRmhmRE9BZnBk?=
 =?utf-8?B?eHdsdVNVOGhrN3p2MVNwYU9haklQQVhpellsRkdET2ZGYTM3UFJRM1hQTzNS?=
 =?utf-8?B?Wm1wZnVDZlROOUNSSEpVQkIxL0p3MTRNVUtwM1kvV25BaUN5aHROWHdxdG5V?=
 =?utf-8?B?M3FOMmZpSVI3Z2ZocjN1TW9wbWFIRk1kR3dtemh2bFR6a3FJUHJqZTU3RTRp?=
 =?utf-8?B?OXU1WThFZURXQ0IyZE9CV0p5cUlFYmduWFowMHJZcWExcHlORzBERjZ3SWJv?=
 =?utf-8?B?OE1ja28zOWNYT3czZms1VnIzMENjQUFaYURmQkI0ZWNWN09INVBhZzV5S1FN?=
 =?utf-8?B?SDlkdnNxUTZ1QUxzcFQ5RXR1VjlvZXJ5dUlxZmRsVFp1bkVIN3hoUHhQYnVh?=
 =?utf-8?B?ZzNVdHRuUmgrZDZyWjVOTmtnVEdPdkc0VjJQOG9OekNZVEphWksvcWVFVDM0?=
 =?utf-8?B?cGNNdUYrcEF5MTNBVjRGTGtvT0Y1bXcrSnpDUTFUa3hrT0dVQzVtSW5UaWp5?=
 =?utf-8?B?UWUrV2NLREpuY2lmWE1jblRRM01BOUVFaDdObWdkdFMzY082UzFnQnBRSTBN?=
 =?utf-8?B?RTNaSEVjeFN2bE02VlRlLytJZTB0dTJWbnJ4YmFWOU1PSHhtVHRwWi9EVUE2?=
 =?utf-8?B?THlOZWptL1ZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9ZVmJySnZpM095SVZMTmtwUU1iT280dTYyQTRVcytpdXZIYndvVUc3V2Fo?=
 =?utf-8?B?cDdNVTNPNW5vRng3Rit5MXJ4Vzl3ZTQ5MVB1T2R4a1BXS0l2anN3NDVzd0ll?=
 =?utf-8?B?V3VUMC8vQnl3aUZ0V3NZV0kxblVTZ0lEcEFvZG1lZENJNUk5SEQycmlFSEFJ?=
 =?utf-8?B?ZmIzeFA5eXBzaXVrdXZ3UytCYU4xQkt4Q3VVRkFPUUZLcVd6NW9hdEJxREM0?=
 =?utf-8?B?YUlyTkVCbDBQbzA0R21Ld1dJS1hPNFAzMVBsV0FsRHVGVmxwZmVmRUxDR21t?=
 =?utf-8?B?SW5idGgxNnBMZHhJdGpWS2R2QzNzYU9xa2ZUWHBXK2hZUjdzT3ZYOHgvZzht?=
 =?utf-8?B?cjVJUmpSYndiMlh5cmdYSmJWSm55YVBPaEMyVm5LczdRZm9PcEw3ZExZY05s?=
 =?utf-8?B?RjlFYkJHZjhvNlZwV1RzUU5LckZ5U3JZcFJwQXhCQ3RRQUxRUnMzRE5ZVTRK?=
 =?utf-8?B?cnVVcWhOTlZVOGs5SnFla2QzdGFjTXhEczl6RzAydk9wcVVaOEx6RlFqYlZp?=
 =?utf-8?B?b1hpYTh6ZVUvUExqNFdjUUd6Ukl5VnllMkowTTBEb2pOc2NQbDVSOVZMZC9E?=
 =?utf-8?B?ckxVVndvVC82THNnYXlMZnF1UGswQ2k1VUdvZnRpNks0aGpBZUhLWGhVcFFy?=
 =?utf-8?B?cFcwbnpodHk4TUthK1RPV2JZV2lNbHh2NlRFQ0RRaFFmMWo5UGxtcjlRRG4z?=
 =?utf-8?B?N2toNjdFdVBxeGhkV25rSWFsRkIvaDE0ZHZjaDVDYkRMMG5UQUtzdzd5d3lp?=
 =?utf-8?B?cmpIeUJFRm8vVWtTWW16TG92UUtMelRINk9GT2RMTnVlem95b09tQXU0b09Y?=
 =?utf-8?B?N1VwMDNGY3BRSWFwVlo1OWhYQlVLQTZYVXdUckVNbzNCVjNkOHJWcVNOM3V2?=
 =?utf-8?B?K1RGU2UwOHdLMXN4YW1tcUFJZlppV01LWDU2K1haa3F2Y1MvSFh5aDVtZUs5?=
 =?utf-8?B?Nm1oY3VjSEk5OEJNQ3g0SWZVKzhRMm9QWUdmakdOejJEblViQkh2WU93dXZq?=
 =?utf-8?B?ZkVkSkRvWUlyUVd2LzFrWk81TTFpbHdaTzBrN28zN0RJUVhjblFHZkhtYnl4?=
 =?utf-8?B?d2dIak9IazQrV3B0TlBZOXFlelBvQU9sd1duRHI5QkR6andSWUZhVFc0aUdC?=
 =?utf-8?B?YVVhUEF1MkREZFNlVmEzRElhcWVFdFdxT1BNd25ZQ0IyNGJSRXJOb1pjTnJQ?=
 =?utf-8?B?UHhoOHV5N1M2QjJibjdwTmJMTnRlOHVCY1hrb0Qwby9CN3YwVzA3ZWFLVVNk?=
 =?utf-8?B?cnhOSC9aRHZwMm5KZ293eWl5UXAzVVJTbVFVeWk4V2MwNUZRUG90N2pjb2Y4?=
 =?utf-8?B?V3BhMkdYejhBWW9iVGE4aCt5T21RbkdnaDJXYmpFbS84bkNmKzBQdWZjMVN4?=
 =?utf-8?B?ZlpoUENvampnbWxFdHZ0aXJpbmNDTVoxd3libHlTaTdnc1BXOHlpalI3bkNT?=
 =?utf-8?B?dUs2WXJkemxLcnBld01wdU5nNnBrZWo2WUNCZFUrb1JYSGV3cnFpQ3BNbEUw?=
 =?utf-8?B?bmJzZldOcmduSVNLYmlyem96Z1ZMSFU4cE00UHdjVmJRd0htSjkrQ2ZmMXNG?=
 =?utf-8?B?dCtVbjNVdDRxSEZYRjNPcHhGUFFJVGJ0UUlFb1hQdTRCYUloSHJ1MHV0alVk?=
 =?utf-8?B?RTBWLzFXa0R0TzdOL29JN3pHZTJsOS81UFVaWUpIenp2R1FxSCt6R2pPLzlo?=
 =?utf-8?B?SkI1ZkZmV09pd3BFVXpGd2JtSUUrTHV1UDdsUnVLUko4cGczL0JydWdlN3M2?=
 =?utf-8?B?RmZEMWRJamRaYlV4ZithcG8wTWJLY29GSG8rOFVCWGhYbWtSbk9YR2lwVkZw?=
 =?utf-8?B?UGNOem5xczJ4RmttYS9JZzB1b0loS1dSZUprY1VJSHgyMFVYSmQrc3FtcVlZ?=
 =?utf-8?B?bFFreU9YZThQSCtqaFk3VzZadWc1TGxnRWpia0JENXhWTjltQnFOUEUyNnZr?=
 =?utf-8?B?Q2ZzZ0dIUFRnMFNnQUFLaHVPTU4wbmpSZG1KZ2VGZnBiaEZWbDNiaGhnRCs5?=
 =?utf-8?B?NHFGT3dBSVU1ZmNDcHVRYWs3M3ZOaWlidVU0RmRyT0J6MEljSERkQmJHTm9V?=
 =?utf-8?B?SUtUeVU0ZFpwS3VKRitGcXF6c0svSWxyMXJHWkFJVDd0b1l4MmFtOWJiOVdO?=
 =?utf-8?B?ZGZRN2k5ZExvNnVFSnB0VUxuc3lDbXBVeURTOE1QRm41ckthaDhOVHlIRity?=
 =?utf-8?Q?EjvmGToU1trPasuITv1TqhyGN4q/2Aw+qR1QddLJGcvh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb70078-867f-42ba-54c4-08de2e15d5df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 00:34:05.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3M/WJBXjmLDvvzlo6FpsG8VFVGH48zPaX64Fhr2e4O5dhji71e6dR+wzZO18RSMRgde3YLLCSzChTKTjsSYKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048

On Fri Nov 28, 2025 at 9:27 AM JST, Alexandre Courbot wrote:
> On Thu Nov 27, 2025 at 11:53 PM JST, Daniel Almeida wrote:
>>
>>
>>> On 27 Nov 2025, at 10:30, Alexandre Courbot <acourbot@nvidia.com> wrote=
:
>>>=20
>>> `build_assert` relies on the compiler to optimize out its error path,
>>> lest build fails with the dreaded error:
>>>=20
>>>    ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.=
ko] undefined!
>>>=20
>>> It has been observed that very trivial code performing I/O accesses
>>> (sometimes even using an immediate value) would seemingly randomly fail
>>> with this error whenever `CLIPPY=3D1` was set. Removing the CLIPPY opti=
on
>>> makes the error go away, but that's obviously not a great workaround.
>>> Clippy appears to influence the way the compiler optimizes things,
>>> making it on occasion generate a method where we would need it to inlin=
e
>>> in order to satisfy a `build_assert`.
>>>=20
>>> Fix this by instructing the compiler to always inline the methods
>>> leading to `build_assert`. This stronger directive is effective even
>>> when `CLIPPY=3D1` is specified, which gets rid of this error.
>>>=20
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>> This is the same fix as for another build error triggered by the use of
>>> `build_assert` [1], which signals that all callers of this macro should
>>> all be tagged with `#[inline(always)]`, as inlining is a requirement fo=
r
>>> `build_assert` to perform properly anyway.
>>>=20
>>> [1] https://lore.kernel.org/all/DEEUYUOAEZU3.1J1HM2YQ10EX1@nvidia.com/
>>> ---
>>> rust/kernel/io.rs | 9 ++++++---
>>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>> index 98e8b84e68d1..f161ec8056ce 100644
>>> --- a/rust/kernel/io.rs
>>> +++ b/rust/kernel/io.rs
>>> @@ -142,7 +142,8 @@ macro_rules! define_read {
>>>         /// Bound checks are performed on compile time, hence if the of=
fset is not known at compile
>>>         /// time, the build will fail.
>>>         $(#[$attr])*
>>> -        #[inline]
>>> +        // Always inline so the error path of `io_addr_assert` is opti=
mized out.
>>> +        #[inline(always)]
>>>         pub fn $name(&self, offset: usize) -> $type_name {
>>>             let addr =3D self.io_addr_assert::<$type_name>(offset);
>>>=20
>>> @@ -171,7 +172,8 @@ macro_rules! define_write {
>>>         /// Bound checks are performed on compile time, hence if the of=
fset is not known at compile
>>>         /// time, the build will fail.
>>>         $(#[$attr])*
>>> -        #[inline]
>>> +        // Always inline so the error path of `io_addr_assert` is opti=
mized out.
>>> +        #[inline(always)]
>>>         pub fn $name(&self, value: $type_name, offset: usize) {
>>>             let addr =3D self.io_addr_assert::<$type_name>(offset);
>>>=20
>>> @@ -239,7 +241,8 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize=
> {
>>>         self.addr().checked_add(offset).ok_or(EINVAL)
>>>     }
>>>=20
>>> -    #[inline]
>>> +    // Always inline so the error path of `build_assert!` is optimized=
 out.
>>> +    #[inline(always)]
>>>     fn io_addr_assert<U>(&self, offset: usize) -> usize {
>>>         build_assert!(Self::offset_valid::<U>(offset, SIZE));
>>>=20
>>>=20
>>> ---
>>> base-commit: ea34511aaf755349999a1067b2984a541bee1492
>>> change-id: 20251127-io-build-assert-3579a5bfb81c
>>>=20
>>> Best regards,
>>> --=20
>>> Alexandre Courbot <acourbot@nvidia.com>
>>>=20
>>>=20
>>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>
>> I also faced this with genmask, by the way, i.e.: using genmask with an
>> in-bounds constant would trigger a build error. Very confusingly, this w=
ould be
>> randomly solved by moving the genmask invocation around in the code.
>>
>> I wonder if the same fix is needed for it as well?
>
> What you described is exactly the symptoms I was experimenting (notably
> the "moving around sometimes fixes it" thing) so yeah, I think this also
> applies to `bit_*` and `genmask_*` (and anything that invokes
> `build_assert`, really).

... anything that invoke `builds_assert` with one of its arguments as
parameter, that is. There are uses in e.g. `locked_by.rs` that validate
valid properties rather than function arguments, and they are not
affected by this.

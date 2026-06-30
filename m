Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020134.outbound.protection.outlook.com [52.101.195.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC603F5BD9
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816321; cv=fail; b=b2cLphY4Yc3gUj8RxJu72lyinBHbOrlZdc9TBBMm24u6S+QuaqjROfboJF7xjxWlKGDNvVX+LEa5bfrZ6Nd+3RdfDguyDpYRTW6qE79yIeNlPCRtvz+eQSM7Z6DsV7XR24GSxBoAGXq2M1rIjf+e0CdGT3qr1vqDVN3isA7Ls8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816321; c=relaxed/simple;
	bh=aPhJNl9u/aAVBJGbpAJ2VORVo4urzob6jmEYcZCJEfA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AeflnKpjoagPP55oXr8nGSGc4olwkexPwa1DCm1GfFdRBM9no8DXTRN03xZMokR7iA4nsrT87tKcMq09YxO0v4LqFzh7Y0jLnhojkTXNwZPK0A8Beye6l6N33SM/nGA+6D/+U8XK0ltD4W24ilmOXyQLPm1vtYKqZ3JS5KQ0XXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NCFnEFf7; arc=fail smtp.client-ip=52.101.195.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NCFnEFf7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i11c0j2vs/zvDMibs7kL6VftjtrgoAbpP9+CybENW1YwsscNPucP0v/WW2fXc/xDZKASpveP8k8/Ieqsf0jl96PPJZfZOrotF5+6s5nyEg6MQ60JGO2DOMWHUyWU32ynCsWTmHRmNoHZ8BA57Y7SMMNkcNbntV2AxH28IGnykD3YvY4OdKRtz6qJh+hyQ4OBbYCzfuMNcQxU9aWsij46RZO0Zk1t8NQnqbvkNBnduQPTuBCBonXzYSPGSfYXlJnsoRzrVaGVTp8DEo0GRrvZ1Io1tt9w0fta5coVGSlKLoCoz3epODowc/SyEl25IF9ijkkBa2g84HV3y7NA+WgKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V44cVpiVdQC6h8GyfxvHk+SfW5mNLL3PsbwLX7cCBX0=;
 b=d8KggNNZ5ATUMQcffGzoojwLGO/+ell+iQM1coDYsyF6DjW/mMaHZjDAgs7biEFz3oB5CmU9+UvzJ7YWZWcdywdMv6BehP/N/pQiJrRuro2E24Jn9vsJUSfawRHmgl2185dNpBBAxEv4QPpSGcFP2YclszY1gnzgoZI8+lrLk7yu1ER0ZeOamtDnkzMeE1lvIBD09eQFGtk6jMWt7YfyAtjfM+8xxU+u1oTMhQMUKc88CZs+547uc+HHt/RYGjHUFHJQGzbiKjJlGuiK9qglXvPbsQZXdMNCXmfreBDwPQdzHq65u++G1lIhPP0zTvMBMydL+Sogw8Jh6IG1Hb9k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V44cVpiVdQC6h8GyfxvHk+SfW5mNLL3PsbwLX7cCBX0=;
 b=NCFnEFf77bhlT6pWQwC0mR6rEKNYrLuJK3hnGKPcaKJEUZEC6XNQWRTH7bfzhIEc03Wh1SgjOwlhP2vRtc1VBLGVG0DCHbC10wCOGc8HygOUOU38n2W5SulLGNrF23HBDMacN1PJ8BTR5Ywh5FEWZC2IxXCMaRZ3H1Za9/oCGWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB9145.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 10:45:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:45:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 11:45:11 +0100
Message-Id: <DJMBMYQ0QXRF.1XLCEP317MQKZ@garyguo.net>
Subject: Re: [PATCH] rust: error: add remaining error codes
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260629183022.2709524-1-ttabi@nvidia.com>
In-Reply-To: <20260629183022.2709524-1-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0427.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d124cb-e608-4b50-57a4-08ded694a96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|1800799024|366016|921020|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	v/7/EXqroDu3ySqar3cFq9sQBg0/G9USBgf2WEkTaGXKo6+ZgGvK/5h1TrR0k5mXK13YU91dAS/Yov3P/t8JvbbGQRB0ZfncRUZMCVX6Fmy3ZkZQJWd9km1cHGJ3rMNXqbSQVilPcb271Y3iDWivVOoucmMS1ziUmA6nI9vmCIfzgii/CuQseBgSLR577YGLCSRntd3c36TqNZ9v4j04bXK/SxJ1ei5mjn2nXfeaSVY/NY5isv3lUto8EOX5hy/X1HP0nrjGZ9UDquNS12IM7JfD/4Hb05Qpb5+mS5y7iX0yYcvdMpy+73PGSJk+8PmyrtnpQKU/9+3QZAVW0WqWaX1Qwjh59eWVScZ8e7a31frVWgA3MgxQLmBFG6MOq9l/OgsXPpXfYAKx9DlEO3RUa9hFeRE/iARy+5MD6iIyUiDjQaP6JSXtshBfjWxlGt29ZW6CXDOXfZTE9BAeU/MRTFICJzt+01F4rBmGeL0nTGkbPahkrLD4aI+d/5eJJK3N1tZnbPYHaSNDR9tRrZTpsFHJSH52VE8FquMpu/pziYkrelbudxv/JK1nA+JkXEz3u7FaxG2qkO0LuY+kjSBMqllcmqcBhvMoOhXcn4c69NaPmZ4ZHS1kEhMeTrVg1e6eVsbT/9xGMb+MHi5RZn0V5Ds6a5KTimHw1+a3pSDB+jaIjg8Ib39owtHzJDxp2qIYbL5Syx9i7bzFt6z2B4PgMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(1800799024)(366016)(921020)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tMT1ZqNVdBM0lBbkJLc291eGVHczJqaGZDcmRMWU4yclRvWll4cHMyOWJy?=
 =?utf-8?B?MHo4bnR2MXYvUzIvbEZIWHVDa2MvcTRld2NnMGFySm5ERWlxMHYveGRpY3Uw?=
 =?utf-8?B?RGp3dWQyOWZoNk5JaUVZajNSNFZYcFEwTjRNdC9pNXV1VEZFME8vamlkb25G?=
 =?utf-8?B?Qzh4TVFqQWloc1NneXVEZU1KMnVHRE42bjJlV2RSZGp6a1pDaUVpZ2Z1ZzRB?=
 =?utf-8?B?VUdIYUhpbk5vR003MnpwZlJVMU5Ka2N3RXdLdmowRDJkaWxLdkRDM2ErNUVH?=
 =?utf-8?B?SXpPVXRjTnJ6aE81YWd5cDJ2dDM4K2hUYmJCczcvK1QrT3N3Qk1PT1J1NVRa?=
 =?utf-8?B?VGVMd3ljS2wvYWxwZE1YbTgvWGtleVNPaXdiYW5lVVQyUUFGMmt4cmxFT3c0?=
 =?utf-8?B?dlFIbVE4TkpDbkRsNnl3dnhLSFhNanVTZUpaUzAxNUQrVUpLY2RZbGZmdFZI?=
 =?utf-8?B?ekJSZzB0MmFoNk5hZ2pDUDNzWlhKS3RiNUw2VHJSMTc4U1JxZEcveXNWMDR5?=
 =?utf-8?B?V083QlVMSkdlS1ZxNTArSURka012di9PRGtXSHNJMFRKakg3RGhkVjY1bHhP?=
 =?utf-8?B?VnEwVjZIQm9POCttaFF0QnY0QlRreGN1ZzUvV0szQ1E2TVAyWjd6OEFRYThG?=
 =?utf-8?B?Y3ZxUWpPSjN6S2YwQWVrZEEyclZkUzZyWnpwVEN2L2dmYnFIYTJqME9iSzJK?=
 =?utf-8?B?UyswUzRxSEZaOHpldzEyaktNOFhyckhhdGtMcFJnWDBXUjFpUW1IOGRpV0ZQ?=
 =?utf-8?B?UlFwM2pBQjZMRitvenkxaFpZNnNMY0ZrRmd0cHJOYTJMZnJ4OUlFNklwelA0?=
 =?utf-8?B?UjRraFZNTEFVdTVCV0o4dWtjYy9SMGhZbjdhcGNsUi9Qbk5wOE5ucjBBeDZP?=
 =?utf-8?B?c0ZMZzh5TnZUbTBKbE9BcVRvZk5Vb2kzNG03cEM1c0RlcDEwZHYyZ21STGls?=
 =?utf-8?B?Nm5wcVd4Wk45MXdsdjRSUTJTQkkzV29NN3dIYkR5Ukpqb2Z1bi8rdHdNZ2dB?=
 =?utf-8?B?M0FuVmNaUTdCZjBJVldSVm8vREo2KzlXcmkxVkFhTmZacHNRcVRpelk1SlB6?=
 =?utf-8?B?MUZSYTVVRVIrTnZXZnJIUGJpTVBGMlF6ZDRkcWhNaDRXR3UxRi8wcm50akll?=
 =?utf-8?B?bVVWMTRvZzQvNlAyc2dZMjdjVEdyaHVrSysvdXVRZHVBZ3pWVVRZUzJVbGNZ?=
 =?utf-8?B?SmhwdFlpQWVUTU1ZbFRCVUZRMFMvTDRCWFJuOHdZTHdrOTdKR0d4MUJQV3Rq?=
 =?utf-8?B?L24rRXdRWmJ2ejhOSzVNem9zc3ZMenNGODliTDNYakdnWVpUblQwTHpvSmdI?=
 =?utf-8?B?Sk1EcnpBTGFWb3RSWXE3Q0c0K3Y4NFF6d08wc3U4U2xSa2FJYnI5TDJUOU1t?=
 =?utf-8?B?aTFvMnB4bzFwK1UxUEt4UlUvKy9kcUtNdDVGZ3JZcTZtdmRrSzBMb3hWVFJn?=
 =?utf-8?B?aGRwTFBvN0xjeHFyVmtxL0c2Z0ZRT1RvYlQxU1BmckNhaG14N2RTNFhMaGN2?=
 =?utf-8?B?bzEzT3I3bGZUNTNSWlpYSTY0MmcrZ3ZkYzNWN3lQdTBwR1JDeTFWY3ZVV1p6?=
 =?utf-8?B?ZFRkN3FtelpNSUdYeHVYa1kvc2pTbUtNY3BoNXYwZ1ZXNXEwOGoyN2JEY0Rn?=
 =?utf-8?B?VWc2VzR0aGhlZVNHZERsYmVwNVMxQkR4OGNBSmlGcUMwbS9ab2NoV3VZbU56?=
 =?utf-8?B?cncwQmxzbEsrajI5UXBnU1gxa25jRjdOdmhWdW53K2pKSEtYUFZmRjNqSzBk?=
 =?utf-8?B?NWJpMTEyVW9DMVJrRnQvcHRvUzZVNHJaL2dNZVJra0xHRVZVR2FNb3ZMMnJy?=
 =?utf-8?B?MmlLb3k1NEwxUGNDZFgrQWN1ZFNxVXBqTytFM2VSdnR6Wk5MRU5WbmRCRXRs?=
 =?utf-8?B?THZFTTYrZGVMNElnSGx2a1lxRkw3M25Ddk1xQ0ZLSXI1b0t2QWNUeTBjaExJ?=
 =?utf-8?B?enpoOTdlckpmMUpGRFEyYTV2eFZzT1dGODZTNW1qK3E2NENpKzF6UlVicVFa?=
 =?utf-8?B?TUlzQ3VIbUJwVlp1b3JhdEJFNFpRZEh0NUQ5YVpaZVh3bGM1L3JnUENPTU0z?=
 =?utf-8?B?eDh6am9hWFQvQjdxQXROQW9makp6ZjBiQWhWbW90WThIc3ZCcm84YzE5YWJR?=
 =?utf-8?B?QTR6UTlOdE82bzJ0YkNRL2FUVkJrTCtYMWJjN0V4bmN0OS9qc1JXVEZzUGk1?=
 =?utf-8?B?eTl4OEhid3ZSUm5DU29MclFBb0hLU0l6ZGlpYjNvRnV3bW1pbDNlOGt3VXZp?=
 =?utf-8?B?M2RlYXZ5MnZYNzBmQ2JSeVdwQzJsMFV3d2xWT0hmSi91VElKSlV6SEdtRi9w?=
 =?utf-8?B?cE1OVXJiNmRRZldTRGdrQk1HNUlYTWZ5K2VDTmx6RjYyV25ZQTk2QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d124cb-e608-4b50-57a4-08ded694a96b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:45:12.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAqa3a/IQloRyFWaDKiKR0h8ecehqBLEO1fyIT1gFZFWfzDhUpQiRpV9z1ypwhlu6I/BVDoXSv7kaf8Q32aX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9145

On Mon Jun 29, 2026 at 7:30 PM BST, Timur Tabi wrote:
> Add all of the remaining error codes from include/uapi/asm-generic/errno.=
h.
>=20
> Previous updates to error.rs have been piecemeal -- adding single error
> codes as needed.  Instead, we can avoid future problems by adding all
> the remaining error code in one swoop.
>=20
> EDEADLOCK and EWOULDBLOCK are intentionally left out: they are just
> deprecated compatibility aliases of EDEADLK and EAGAIN, kept around for
> non-Linux/POSIX code, and have no use in new kernel code.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/error.rs | 105 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)


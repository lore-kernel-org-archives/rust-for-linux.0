Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4A17AE11;
	Mon,  6 Apr 2026 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775435894; cv=fail; b=u4ObS25nPsDD5yrPbVrMVBk04Vy1t9SE6ztT0VcNkLtqx18o/+eF02LIi7xodN8wugRLcIZGj68a4JIPDiN9hPJPOYJ84dasza4Cec565XJugaC59UKC9H7JTtHJVIkOF9XVKpnkpvhfvHeCDkyTWyj6jBzqkPdy/H50DUU1Jf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775435894; c=relaxed/simple;
	bh=voH88QRzdj9Hyu+UNSx/1BcICJPd9guL4nlx8rP48Fs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oKtLufzAV6U3QO7A07a12vzMig5iGUL3C6sSX8OvM4nFn0C99I1S9vExHCw7eJ2xO/Wmnsagd0CX67RoSmiJ5dGha4T49jA3EyhqdqidfhkQU0JzcRNDRZzxQyXXmIRN+WnNBS9+WFF8xJDlM1DUXhbIqmxVvul9XoReHSXwwfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GnTry2JC; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GnTry2JC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7XOAA5U+54JXbJHKGWfxAkaVUVLRsQvTjCOrGYdiEfOQkYsiD4AnPdtXhOqLRcfjnwJ9iOBwxfPJ0eh+GRyCJSqvbjfBmQ68Wg8t8L4zmFH0DqrQyQ3qwwCy9MYq0xww24vpUl6h1NCFiKtlLQq1r0t5145jdQ3xE6SRdVIx0DBQa09sI57mY7Pk1JlnLneFF17em7wWgxgLaAAOoz2LmFIahHbEYf406eoNX8d9QYPOYvcqxaCSJnuB2qKQ0t2fWQXqN9p8YdjdD7nnDvzracWFlnkHK6f8qeaJjjcsNgFoHXU20sd98Pg3RCeLmLwa69QpJlVk2Z2VLOpr/+iRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voH88QRzdj9Hyu+UNSx/1BcICJPd9guL4nlx8rP48Fs=;
 b=SGAnyG7gR3gyoNzbFHZSbCTCeaQQ3daTW3Ye5v4cYqBS2hSYHz/0GM5AEIWQSBduXeieT14gJoHmsixFfSY9XI6ooG5zFRu5QdonrLXE9aS4+NuhgRIIk3/DAX2c1ws//8hjE74gZrrnrHAuMX1OhL+6bgA1vuIhkNjgIN4slN83E0k1mOYjv03885tN0fQIAG7o5H7Si8jhUOx8crCph+QDGmeyByFfmVGgwxWfLikfCHWcryr6a2K/t2Wz6ei5dYl4Owd1LFbV1edXL24hKxzhz2MTW+JZT8ApRkr1u7v3I2gOhS2hyE5PPH/zHWsMle76PDjpzDtgOlKZDCM28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voH88QRzdj9Hyu+UNSx/1BcICJPd9guL4nlx8rP48Fs=;
 b=GnTry2JCb3mRP97d8QScA0ddMbqpKjegQ4xO2D0DMfCOTMFZ2oP+/saxPUJ+P1TBfkwmPQmCBMofQ/q1FhCe58WP2mNFImEiuhcApcZqWaZHSB2+ft7mihwThVWZi+yupXaDkTJj6y/PUc6bfRz19+Ca6TzJIKXRVqnebHU1sXxLOi5kebmS3MPMovAQdZjmUtiQgA2VL9tLfO0Q0ZopnGblrbt0oR25/R7QwKTCB0CLh5T3Wb9NtQEjHFn7baG+E53H/e/dWweuaC9jUuWHKfQPN9Gvuh8AtK+M8Sy9Q3dKwst4Yei5yNnhCdr5pnDF1uVWXmFab5fIDKwXbPrAcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 00:38:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 00:38:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 09:38:02 +0900
Message-Id: <DHLNHSTUF9PG.47MNGX8MGRY@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] gpu: nova-core: fb: fix clippy::precedence
 warning in read_sysmem_flush_page_ga100()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-3-jhubbard@nvidia.com>
 <33128320-a33c-4020-89cf-9b8313b7d9fc@nvidia.com>
 <DHL6ZYVYIHI3.2SXJQ5VWKIU5T@nvidia.com>
 <DHL828PQQVVP.3H1SIQV8XK43B@kernel.org>
In-Reply-To: <DHL828PQQVVP.3H1SIQV8XK43B@kernel.org>
X-ClientProxiedBy: TYCP286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1b1cdf-fd05-4d53-9e86-08de9374c576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ed6/RdZBJD0H9wrhvl9dFoXtsGB8V0CW+Bv6u8JDEydVbngOXFsk1Aaphj2QRx9cMT624hM+RxQCesj4i+tkQLkRN4/3AlOY6yJAAB1UZJxDQpm/qM0fALroMd4WtL68ZVJK5M6ZIzUXqxQQlGQaiL26QIb+MApVSb3qhqbOOr0xHpr7D4e4mUFui3yJqLotHHAsQKrY03DgilNUFPKnEhQRe2j50uyAXRFjaZMaGJuLv+dmjYcD1MagFUC6iGSsdR6B/ZbiZDadXG3Gp1TEJ8jMVRm5qF6GfNIj1wSSojTbffc081+PE3qTOOOjB5ZVCbv6le1AJTyGyMBOfoXJR1tX5oFzfrHcfrlEWqjXLF78HsMq76yiW9WvrYEk7KVvoC5earK7bXOAfYe1xzpfym8nR5bzyRJe8gKs7GtHPYR/aT9W2N8xLfpG0Th6JtQW47xHzQ1GWOuRwHlRt1+PDwszIe8390HcMXHuugqfNlkLW9C75bfUWVsw6S6C5vFlLGaKkuPq7DiVJQeNZqfMm1bYF9sl74ZNlY23hLmcKrpPffH8aVrkUgPEQ1VFAGLj6wf95Sfn/mCO189TR2IyyHRP5cQyZmGQw+8KSgRzljdAnJlAz4cuu3Hmsr/tIhKncvG5xG58afOOMvjsmJ5Zjx0gqEp3Qe4+JJEtMXYr90mskxEPU8V7KDxbEfsWTkZ/Ir/otKJeSTOgRUAJz3vRe1EQFWuPsqkHqKLwQfyMO6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUtWbnc5UFBoT01yNmdjZk84dkVoOU5CeWNLN2N2cnhZSllUeC9ISGU4K2Fu?=
 =?utf-8?B?Mm9ZU3FBeERMMHNkVG1LTitDRXVLUFdUWjdnMWQ3WTRlNytUQ0hIRDZDVjJu?=
 =?utf-8?B?YndIVU51MWo0b0tHckxUb0YyYmZKdk5OTHlhdXVIaTdsNUx2bERmMG90Vjlp?=
 =?utf-8?B?LzhIQWpPNWw3aUVBOC9jK2lxaGU0WGkxS2JqQklRczVIaTA2Rlc1QVY1K2RI?=
 =?utf-8?B?RlNHOGgwcEtNa09xWjJkVndibTNENUgxSDdVWXpLNit2SjVjWDdpVnFpZjM4?=
 =?utf-8?B?a0VueU02L0t4d1VlbTU2aEYxR1k2OEFkOXJOSEF3cUd3Z2ZtbFhOc2NxRzBB?=
 =?utf-8?B?eXZucHhIOWZVS0ltakRKNlp6QlhNVWtGRXA0eXRnNTJUdDdzbTlEcEVReTMv?=
 =?utf-8?B?Qy8xcjlkZDd5UjZQT3JiYzJtY2VUVEFkdWxxYnlLWTB4NDNTL3IzTCtDUVdn?=
 =?utf-8?B?RmtaQmhiWGc3YWJSWnlDQUlFbEJQVDJpekRMRXRUZElrTTNEQ1dOc3NIWnZv?=
 =?utf-8?B?YVJQR1c1MFlyUldSNnlhUlhaejFLaUtRdzdaakV2R2lpYm5Vc3g3S3JqMUtJ?=
 =?utf-8?B?Y3RZdTNxVGNGdzVVWS9MRU11RW5pSWJmWmRrK1NNZ0wwVlQ4S1cwVEtaOEhL?=
 =?utf-8?B?MndtMlRpVjlQQjRHSUozUnh6L1A3Q1lkZHZrMVQ4aWhpblB4K21sd0Job0xY?=
 =?utf-8?B?bHk1U2xYRVZna2JtZWJMUkFOa0VrMWRWcW1kWjhMdXJhQTdNWkZXN09LaXhV?=
 =?utf-8?B?MzZnaDlPRmx2MktkeUdOQVdOZXNSY2toM3k2UXJmYnAxb0VVUCtaYk05WGZV?=
 =?utf-8?B?TmsvOGxPQWxlMWxLR1pLcDdHT3I1MGFMaG9yM2E2czBwcHhNbGlZTlkzUFdB?=
 =?utf-8?B?aVNJNTNCODdVc3IycU5BbmZZNnVHT1FicWc3dmFHd0ZycFJMRS9GZGdRelRI?=
 =?utf-8?B?VUtNMkozZ2R6Q0ttaVN0QUdmZE5YZFNlQ2l5WlNWTUluYmlXSFRZZUZpVjNZ?=
 =?utf-8?B?U1VKd0RFb09VNG1ZYzROSU1mVXBVRHlVdGtGc3VDRTMvbW1VWHVtbkg2T3Y0?=
 =?utf-8?B?T3hkbnUwS1ZJdlZKU0NQNk40TDF3RHZMeFR4Nlp6TmlySnN2RmZuSmx4VGdT?=
 =?utf-8?B?VGdpZHpoTUF5RzVIdHh5OGs3cThNVFR3anM3RjNBT1pwcGJWVHUwRjdhcWs5?=
 =?utf-8?B?LzNqckZ2SW5PZTROU0V0Q3hISFRsV3dTSzl3aXFQS1JJQ0xudUFrbWxSTUFU?=
 =?utf-8?B?eW44M2R5SGRQZVM2akF3ZXhDM1NHby9KUWxick0wRlVTejRURVduYzlMZU1h?=
 =?utf-8?B?K2t2ZHNBQ3BqRUYvcGYrNjNuTURPNXh0eVJuLzRYcytOMXFDNUxFaGtLTmdj?=
 =?utf-8?B?VU4zZzkvUGtpMUFPS1YzMElOTnBCa2QyblJrRGhTd2dhc1MxY0VwVXpXZDVP?=
 =?utf-8?B?di92NWlJU3c2SXoxY0JMWkR1MkhRVDljOXo1NFlnTWQwblVNOU9DTlpJMVFC?=
 =?utf-8?B?NWlXQlJRMU4zYkVwSmh4NEltK1E3OWpidFJYR1ZXWnFEUVpiQ3ljMzYzNFNx?=
 =?utf-8?B?N0ZUbHJzTTQxYXJJMDUvUUlRbktPemE3eGNzMnRRWi92MkNRWUR4ajdhQkJ0?=
 =?utf-8?B?MDZmNFozc0pjajczT1luT3FEc3V0cE9rbGxrdy9TVHRQTjNuNzhTUVIyUXNM?=
 =?utf-8?B?U1QzOTFOdS90WlNPRVp1OUlJeERPNmlGRGtFQ3VmWVlmd2MydFR0N0J5b0Iv?=
 =?utf-8?B?UHpTQk9Ra0F1WGQwbEsrMzd2dnVzMXhzSlNPL3RnVWFiS01VOVBSOEdYQmJT?=
 =?utf-8?B?akw3YTdjVkphdENJa3NvNHB4VzNuK2FIbnhSV1NlWkIySEJHeUkvV2tSWGh2?=
 =?utf-8?B?MDJDN1IwZlg2K1RsLzVkZUNCZkZCQ3dZWEZlY1V6YVl4L3B6VjI4NmhlM2k1?=
 =?utf-8?B?Ry9iaVloV1FWZ1MvZWxzWk1sWHdhdUs2YTJHVFBQek5GV0EyYlZITzRRRkti?=
 =?utf-8?B?MjF6S3FRWWtLUXIzQ2M4b3FHTVY5QnlyMnVZZ2tJWHlyWTFSZHg2YlU4ZVVs?=
 =?utf-8?B?L1pWam9QdnBtMmh4Vndjc3gxa21qSU1PVVJ5Yy80YlZJeXg0RVc5VzhMUTJE?=
 =?utf-8?B?akhOa0dHMGQ3MGp6RzBjTUtqRWt1UDd1ZjhQd01yN1RuVFVGSmVNVDFCZzZJ?=
 =?utf-8?B?c1k3cmNnU3l2QzdLWWNqdG5GVkUxeC9tZ01kay9jMFkvdm82VFFQaTZWczkv?=
 =?utf-8?B?SXQySzMwbEpOUU1sNUpuWHV1QW1lR1pSZG5rYmFBcTROcnJUNloyRm4xNXlw?=
 =?utf-8?B?NGUyRFlnSW5NUEl6RFZWeGgwS3g5ckQxallrdU1zVFZvV01vVXZLSTl1QjBm?=
 =?utf-8?Q?M0ixwSEicQeN+nJpZY/tKeD11HjuE4c7gYngJSQpxnVEA?=
X-MS-Exchange-AntiSpam-MessageData-1: q+xbHcS/lZ+gRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1b1cdf-fd05-4d53-9e86-08de9374c576
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:38:07.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wYZsJQztl1ezM5G1PXo/aN36E5tW8hBBH3tFHxNS7ZJSolZ5FRWhE/UiWpYwIw4nFrsgvoS5afqUS5+hbuc5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

On Sun Apr 5, 2026 at 9:32 PM JST, Danilo Krummrich wrote:
> On Sun Apr 5, 2026 at 1:42 PM CEST, Alexandre Courbot wrote:
>> On Sun Apr 5, 2026 at 6:35 AM JST, John Hubbard wrote:
>>> On 4/4/26 2:28 PM, John Hubbard wrote:
>>>> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
>>>> because the relative precedence of << and | is easy to misread.
>>>>=20
>>>> Add explicit parentheses to silence the warning.
>>>
>>> Please disregard (drop) this patch 2/3, because Miguel is removing
>>> the associated lint, so we won't need it.=20
>>
>> I'm tempted to consider it anyway, because it is a readability
>> improvement. Any objection?
>
> I'd rather not. If we have the lint disabled - and I think having it enab=
led is
> a bit too much - then I don't want to set a precedence for unnecessary ch=
urn
> like adding or removing unnecessary braces.

Alright - dropping it for now then, thank you (and Miguel) for the input.

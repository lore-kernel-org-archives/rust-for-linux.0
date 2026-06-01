Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0336DA08;
	Mon,  1 Jun 2026 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295844; cv=fail; b=IZobr0nVoLm28bfob57cRhT+iwRzTIqJGwwEfd+UnbwCfM685BJEJ0qPnlqgeX3kuPMCSmP99f/uACKlARThSLvNpjYsNF2Q2QSpRzzpJwpzhcPfa3cH45c/MBZ+rS+oJyyxYTmbUXx20u9aZoI/OdcSDYZCdZjS6wmcu8XSSkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295844; c=relaxed/simple;
	bh=rTYtclH+5unaUMQ8NmlJozP4JAXMxE/nim7i8Y8iZY4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YAEko1iexM9PVnebVzjHqcXIY20KsHopaYha/2u8LkMfCxIkoPRDIxQjcbiHg5KJcFgO/s8jMG3qgbcfhbLontr01bZiu2cw24JWn+apberYpZtlMNRZDOklsCzkopR5zak0UL7rA5XhmTQA9uYTGw7nKTEAl6uIe1ZoPR6cAxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tX5gWvjN; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tX5gWvjN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7BjgMtMiBtu8cnjhX5FERU4sKNKI+CPew+prM1qizHAqb6LAs0W9WCNUnCl/jw8zNgun8DrWuj8GjUKzNFWJ6cBpfnz+HBBenbQlh8uIevtSspXIPhmnwF31vAo2tNyE9AMfZCT50SpNqAAOvLzL+6zwkYreNCd9XKFQXJ/GN3AbAscb9Lh0OjqD9U3Yv8+Xm+cLFpoGcE//Op4sUQB1r63oLHYrVUVdAR47BmyMebKrHYQLfW9/NfM1nXTzmbGF5fl+AfD3qjOSjJ/lNniB6j2yFs14LFtHlSsFGX/q1nJIcuJy/y5d9lto+l4AHmrYCrYBy6nfBuohtS1sEVO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTYtclH+5unaUMQ8NmlJozP4JAXMxE/nim7i8Y8iZY4=;
 b=HhJ0hiFIUKpGXFRDE4oue53+LvqL8SAyEpiqqOWnMeIihzz3cpfLmJpmkPsKzlgqr4AdnPjkHrvnsv3cws44U5YdQUN16Kv//s6PqBuD6+A1D8hrAE8dWDOEhXaL4gXS3c5cT1Z2ylXFimFUqdrPrVsdSr98oyAfVJn7l8OWiERYxgiERBg6UCr+PPMz4+30Kjc9Fq9/oz4K20ToOeG9r5k7QVTRRSaKxpjlsvAqwVJBsPm6l10JmatQOLroJiqb4ddVFfNqxAs9FwNt6YAUba0oMNc1lPtHEGbuy2Tk+sBZH14Ng/k3PIeJGyuoeq0rOY8YwfLoDBS8807oAFYNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTYtclH+5unaUMQ8NmlJozP4JAXMxE/nim7i8Y8iZY4=;
 b=tX5gWvjN8k3Yvk1bpwl2Px/sc+FFmjKvhpeavDE+EcIHcJkgYCHFcMj+fet4wNG1CzW+/SvsFaLvzxjLdY+PMVsQXANCOUplXqsJwm9OXBHSoovF1vxbnpHdl+qdAiGUdrnyxTTJV0aTMc910l/MhgCZiQRmvld3BeuxlE7kvwng6oFgGY7gas/V83qhmRLOgLQ/4MIEIjvOq6SIJNTBcsygoKlhZ674z5TgvXHMicVnM1YH//c/9kBemzOCsud8QWzYZW0YwVvsB2ZIFJ01K8yhFziS6K/ncxfFPsglUyo9z4AW7ZgP0sfvMyfE5Zxzhez/m5v5f9IVHePQUGlydA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 06:37:19 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:37:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 15:37:15 +0900
Message-Id: <DIXI7BZ2ZMPU.20OWIN50F4K36@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 08/22] gpu: nova-core: add support for 32-bit
 firmware images
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-9-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-9-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe1fb72-35b7-4952-ac5b-08debfa83a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	d+zXCvQuF15WT1Jn3EFQcmcoYMSN6ivTg+lFBMOV+Aq1RLcA0uPJc9TP+ZlYDi6lL/dmDQ6duO3TvZtZU+HRePZaDHD6RUU1tBj/u+qN0t7qWl5hZFPMxJIcwZ4StXuHKvRDLQUbY29A3oTKMU10XRvUuxOxmp330EkM9xFnhkGZg74olwvs5xWmLh0SKYu2YIzdoqc6HjijIVStLkQUoZqRCjRL5ypWg81vGYmlc5XRJTinIKTge0qiutpFUT/AgLgA/Krb8iH9KLERz0qhiC9E3fe2RUUhBf2lf69rkWXuTacETeXWS4iwMyYTt/doIolwyt6dpVH3AfevDbLOzisoB39LobeJaRE5MxJ9jMqPOlltxcKwQIY3Lqo1AeDsJ/AETLTv0qUWdIPwxGj0hQP9x1Yj3idmeNCvKUEZCSVyRVQfq5O1wkkzXLRZf3Ygx14dSh9uA+piAl5ztXST7GdXO6Lp63EY+KPH7K8d58oGmub1EsnHLGy/mE0lPxau10X3SBvtwCSS1inWdHNTaNGHZDp3BhGgyt0T8JqV4H/XMdhEOcH5y95NxRvXU0Jq+vI0g9sPDsx+LbYTYpvsRV2Jec3CwvRZwJLKHc8YZzCByhwZFBVnRvfljq6PfaZgWa/LfRpggE+quhkeXi41CtIRcJiFvvG3wyEi8laS+q/mVaqISFVqkKKuftGsq3fO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU5ucUdGMGRjZHU1MGM0Vlk1Ly9vbU1wOE5yZG93OEUzYVFDMVllMXZvYlBW?=
 =?utf-8?B?bWhqOTROS3Z5bVAvS1lGYU1jZXVWR3QrdGtCdC9LUHlEWFNxdmUwZnpxc1Jq?=
 =?utf-8?B?NE9HN0JvYW1QcnZkdlBtcXRTZitlckNWcTJCUUxzRG5iSUxhZEZuZXZodlhu?=
 =?utf-8?B?bklVcVBUK3pYNWpkTnZqSkQrYmpDMW0wYUprU05Va3lCVDFrZ3o5bFBJYXBR?=
 =?utf-8?B?V2YwQ0Rqd0ZkZVo3SGR0bGdpOVNFU2p5aVM3K09NazhPVU1PR0dRbmg3bWlG?=
 =?utf-8?B?L2FYNEVWaG1hRkhtWDdVVERjUzlibzFVL0pRNzlKYlhwNjFDSjZ2MVl4OXdR?=
 =?utf-8?B?L1p3MUFXTk5wcUw4WlZCN3lBMzdId21POWM1N08veG0vOURScWZuVlZzUWx5?=
 =?utf-8?B?RU5rWnZGa3I1ampRVUFLT1I4UlB0K3k2YjVnOXh3ak1sMnVNeldXTGMzNVB1?=
 =?utf-8?B?WVlaeTVySkJBb0cxWVlic3JBYXRDc3NkVlJTVnlsUUhxTDkraUhrMkVoUEZB?=
 =?utf-8?B?blgrbEQ2NU1venczODJuVWI0N0FJeWZZd0w1STQzeXVSa3IvYjZzS1hNL1pV?=
 =?utf-8?B?dktvZHRpK1M5RnpoRy93eEYrK1FYZkVvY3lhU0F3K25RYjBkUXFLSGF2eUZT?=
 =?utf-8?B?TTVKOW1UY3Bua2VTam1FdFdTVXBwUnJsK3pUOS9CMlVTN1JzY3RsUWFTZDFW?=
 =?utf-8?B?ZDEzVmRmQkFaZmJTc2VMSXpKVkV3ZlR1TTFUL2w5UEFzYmQrYW00WTVpemxj?=
 =?utf-8?B?VUJzZkRaRmltdDh6QUNEY2NLNDlZdWMrNXJTU01WV0h1ZkVSbUhFeTJrbERj?=
 =?utf-8?B?Z2kzWGtPeDBKUjUyZk9YVllTY01rbG52NFZUeVAzdG0vcHRyODZBcXRzclJX?=
 =?utf-8?B?Y1JENzlLVUhVZzZrVkxDTHZpYm5pRXBKVnBuT3RSb2FtZHhkNFh1UmFXV3ZK?=
 =?utf-8?B?VnVTbTJncnlJMmdTbnZTVVhablZRdGtpOEw0VDBOUGRXTVZFOE5GK2RSR1Fw?=
 =?utf-8?B?S2xRSSt4azd3U0dYU01ucVArYkdUNDJtc2RpdU1oUGVTVFE1alc5WXJyeUMz?=
 =?utf-8?B?ZXVnanovcUFPcjJUKzNnbkVyZGdsV0RlbmhwaTFINDE1U3pwbS9RZWZNRGNn?=
 =?utf-8?B?eDcwYml2OWZMUExWTStydXJzZnQ2bTIvMm80U1dOMEVwU2lRSmNlZXZ1V014?=
 =?utf-8?B?T0VKdnVib3Bpd2ttWmNJU25uMDA3anFhUENMTitWczJCTHoxeTVBT0NwR3Js?=
 =?utf-8?B?MmtxdUZibW1SVzZxSTBSby93ZXFoTFVXMXVxK1UzZUFuNU5CRTZ2aEIyTjBl?=
 =?utf-8?B?S3JlZ3RrTzhmK2Y4dVZzbDNPZ1JmS1pKS3VWMitjcVhacm50bUFrWXgyUjIy?=
 =?utf-8?B?VEZoL1VHUkV4YkR0VUlPSytSMGVUODhLWmJIaWRoMjVoY2gramZKcGtNNGZT?=
 =?utf-8?B?Ym1ycXo4NTZ1OGtORFY2d2lhNE8xM3cva0xDRDltSWplNTI4RjhsT0JlYnhp?=
 =?utf-8?B?cHBzR01zdkNqN0Q1aVdySmdoaTBibEhXekRFbTRjbDZ4RUdyNHFnWHhSTVhN?=
 =?utf-8?B?OE1QVjBtVksrYlJIZnpNUHlZL0NEcVpBd29vV0ludXo3cUhmeXI5a2Q5alZC?=
 =?utf-8?B?WkxId0g5UlMwRUxhOHFNL1VUS0tDVDdLQmdhOXRNOXphRnZCT3d3N0xkVmpY?=
 =?utf-8?B?NWdxTGFlSkZ2bnE4NTgySXR4dzV3QXpkQXNLQVB0MDZtdGlmRWQveHBqMXBp?=
 =?utf-8?B?eDBjdHIzWXdBUytaWkxXSEI1dmp3QlpLOHZxZGtnenRoVy9zUVZwU2dsY0l1?=
 =?utf-8?B?RXBnUHBwYWRtMUFTdk9GTk5NM0RuMXZZejNKVFRMZUtMZHFSVHk0UEdDK0tK?=
 =?utf-8?B?NjBNY0hUazlRWHRteTNaMnRqOE9jRE80ejFZTjhXZWdDMGdCSTd4WDJKS3dH?=
 =?utf-8?B?VFRmUy90TXRBdUFPa0o4OFlLclBwQ0d3L3UzZldEb3lZSVRMbXJCRXQ1eWdD?=
 =?utf-8?B?UWVKWWRQRFFaaHAwNlF4cm10MlBvY25zZEROVFI0ZXM4bXltUUZvbXVENk0v?=
 =?utf-8?B?YXZKZUdnMHN4TDlIRVZ4RCtYTlA0NThsSFpQc1lzTk9qTzUzRGhtUWNKZDhw?=
 =?utf-8?B?Z0xHZGR0N3pnY2pPSmRaLzRyazVXWml3eWtra0x4WmFYSTZ5RlFhMGQ5cjkx?=
 =?utf-8?B?TURGM1Vsbzd1RWV6bUxUdlNSMDJHN2xpLzZTVml3eTVVV3BBR052YmNHeUFG?=
 =?utf-8?B?bUNEeGlZUlZBbFdTaDVkQ1J2M2lVVnk4MS8zTVpLZEZvNXNjbUVPeUdTdVJu?=
 =?utf-8?B?anlQNUtWaC9IQVNQWXpna1NRUE02V3dkcVZIOW15Z0xBcUVzOFRnR3pydlhE?=
 =?utf-8?Q?70RAMRm8aQK+FwFtmgQeh65XIT0HE7xJAEUkf/A/yyo40?=
X-MS-Exchange-AntiSpam-MessageData-1: H7Wwjy4RgxuflA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe1fb72-35b7-4952-ac5b-08debfa83a79
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:37:19.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeBybyheSAQ7ko87kNgUHfKxkqj0zpsJGsyG/diffluubKbgViRxPiBPqmGwKKFKduXyisv88Dxw5jNsuFmwNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Some GPU firmware images are packaged as 32-bit ELF rather than 64-bit.
> Add a 32-bit implementation of the shared ELF section-parsing
> abstraction so those images can be parsed alongside the existing 64-bit
> path.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

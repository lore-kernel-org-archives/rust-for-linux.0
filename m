Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FD3161BF;
	Thu,  2 Apr 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140782; cv=fail; b=SH9fQ5AoAFVWD0e/WoKcgo35typwlDKmrjwxgQzyAjXWq1UXuZEmkRHq1966KI4UEogvfDFfIp0KDUpS+lF9L/FtNnqdSOQsduLSIZYu4FWP0OzrozENP7BisIyVW706tFrGxGh392/pdTlV5mrcK40s16Cpw1wMv9QPw5pFZIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140782; c=relaxed/simple;
	bh=L50f9PhqwWWpa755zsydz7ROrryhU66SRfE8A10eong=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ZL2KztM7yqFwewwXTyCfdHon8EY84JeE3le+tBUykkGNa2sNZ9nevJcge2pBZwaHm5/zOdvxdnzWs9okIRs38HedQmb6UWTzmvpPTT0f4SD8xUG+VEVRgCu0W3nSnWqJPUjjNQV7LjuBDluk9WMgXDOCqk5d+5+UxTCYlLc3V+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pWqZ/O6W; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pWqZ/O6W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDQCM6XfZTZiPrItuhKVlUqQu1+O7RhPX9g2/jq6qtLyR1Cwe4tsYKAaIrEP4HpmQmsJCIIs2OJW5DyQy9YNr8CKf27KGgCiFFiQ46gyKkb5wtseTUUV9nO9wSg4fXH4hjkSUPdLE/AHJg48jZrbaTU6Zzw53+ZzIQ+JHD3nDMgfkAOSlk0BOm29JgaCimsrVEkdRUpsn16lc6tvCB3BIvraxh47L74GUnO33kVRdpCERyGn5ytz65SVX/+t+70YIVONBb5XsXalcjVyHj4WZvVISpSC2wSm5fvnGhdvMkGsdqbT8apfLR1ex3dnuig3T0HKo5ke9BgfJ+AVZjNTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRgdV4y9WckxFIpy+EZ2xIW0ANRgSY/yP2TzdLEabDU=;
 b=GJ9CIv5nNIDMNQMpyEqfKprzqtvlr5Lpr3NW+nsKQq6m1cnQW6mfIo50ePElX1na7cjzmZY7ZIZeX1sZprB+nFEeJBHFJzAWMwD9lQ/PTlUxttMvT36Byc9ZZ5Yk42RXfnRxyks3VzDAzUt73cefUqdAGLSYhHp2gQzkTHBemgLoUYQ9BUyJkgupRI3yQog0Nt95SgKLErpr9A6Zuli1JX/n2QdDkm/iDXyeqlArscvRSr8blBefjMa73/6MPF5jEedeXwRtTEzpc+WuEkdlCAK6fvjoh5AHN2vducVLYnMxetwmZequB6Yimga0dHuLXEU53q0BuY162Mpu7TzItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRgdV4y9WckxFIpy+EZ2xIW0ANRgSY/yP2TzdLEabDU=;
 b=pWqZ/O6WQUgqk0GS+awLJBXH/6YHqKgUSSXpgeqwpuFuypgRxoj7I1yCX5xmGmk5lWWt+r47rIrxEuDSEZTIvdpZubvDliWTFJOvJP752XftMmxk8j94rBApa+k3VDXT8Hu9M1f1aGI6HEjmjm/XJAlNVczCEmg5gVDBXVZbARA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2451.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 14:39:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 14:39:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 15:39:34 +0100
Message-Id: <DHIQVXT1S754.231VKJWTK7GE@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
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
Subject: Re: [PATCH v4 0/2] rust, nova-core: add DeviceSize trait for SZ_*
 constants
X-Mailer: aerc 0.21.0
References: <20260401222743.148710-1-jhubbard@nvidia.com>
In-Reply-To: <20260401222743.148710-1-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2451:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e95c78-55d4-41e7-8e14-08de90c5a8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HbFJ9TLsa5eqn7jjMwLJdjDpsbXPVTB5rXJmPM4vKST9lKn8jDh7P/cJWjzqmBkJMDYc0YGTzsVYzl3yLgD5gUkBnyAc+DwonDGl6eWoZFWOQUdfg+fLn7km537u2a8G3STTC+ts/YDeWr4Ncf3wf1E9EJLzHCpj9HiDx2qdLm5fKBTQDMoh8NYu8GOR+nWUN06AQ75tAN6f4z8VhiEDTrgkqr4cqEdfJJF34+Qsmoh1mpc2GARupu2zKkhP16B0Qu4w/7WVz1bFD5qtc7AOytbo3KIw0W3T8d9qOMIHIEa61ekeSlUs53VJAD1IAitBVDUpG5KxA5ahTeLbc2/b9QeaCc9QGcOlTk2EQijF5NozLMk7xGuVYaHwMum0gBuKBdGh0qr9ZH2vzW0eLP+sXwmhFGmF1n96iMxblA3nFrXwmmEAykHlY1kaLlZ/NLD+52rKdydk6fx7AaaDbQDP1Ml34jbeyZzLrvvm0+iY/YCKbH5iwNOykU1lwKeyP34IZiHny2/KUu9/lFzpv8nEbeq1eSYFYwmYd5wLhh+RGNm56GDKGmmUQaZUoLhir4/C9Wt5KrO8tDz7pl8cJ3IA2bvt/mSo9PU6POMcDqKhq3DFu8/qx3B/3gr523AZ5zV8Ha/X5S1iOCCDIHfIwQTsy+I8ugzNNzWaoJremqbcqMbrDGjqwhfhsQ75k8x8l6TWasqvLx2d+0qhED/6B8151gJd0E2soNa8E3uhweR4I30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWMwUEJQZGFzUmNrNjdNMHlaem94MVdSSXV6eTg1V0NwVW8zMllQSkxXMXdY?=
 =?utf-8?B?K1p4MGJpdTdNR1NvVm5PZG8wbDlxUWFYZWxGamNHbGoxcXlrWjd0TXFHTUtL?=
 =?utf-8?B?eWc2MVQ5UzZadWc0UzdycFNlVFFPbC9uYWFBTFo2cUFxUFlYVjlSTGJWMnhE?=
 =?utf-8?B?ZVNKeDZJUGNjd3Y2Z0lwY1pFajlCdlRGeG1HRTVjU0tLYmcxQ3Nsb1lJa1ph?=
 =?utf-8?B?VVFvSzRJSjBJMDRsRmZWM0hkVGhHL2pJUnIvZ0RoUFBtWlpUYVRMUGNCUVht?=
 =?utf-8?B?QzVOUzdKcWFSN1JGKzRwdnFGVTRDSlJwcjVyMXRWTFJIcHVwdHNRV1Y3OTl6?=
 =?utf-8?B?MzlJd245MGo3UEFlY0xRUGNCM3hkUlRpRkVhOGlOV29TWFd5anNBUVNieXdX?=
 =?utf-8?B?bkJzSGliSHowT0hnQWVFS2wwN0YvNnJvRFp4SlJ3bnZsVXJtUXNqRzJPcXB1?=
 =?utf-8?B?blJFU3RacUFCa1d1aGdMZHh2YjhEZm1tWkhRb0tZTmZQS3pYRGJCL3dFWUZ5?=
 =?utf-8?B?ZnZ3YXlVSm5weVhFRVdtZnZ2RVJGN3d2d0o3WDJ1SnlrdlJoaWZCVVZicGdN?=
 =?utf-8?B?RGpNMjN3UmNCeGZIYmJoUkt5NWR0UGxPRmF2Z1M4YmIrUXRFWW5HUUJjcG4z?=
 =?utf-8?B?UEl5OUEvMmZxM1VKVWxPZU1FTEpnOUpjeXVRRGF4cGt1b0F2ZURVMGpadGRE?=
 =?utf-8?B?a0NwcHFqOXprdzBKYW9NY1JqZENnb1h4ZnNUUzdwcFJSblZzWkJGcWZGa1ln?=
 =?utf-8?B?cUhNdm44YVFLckgyOHdDd1d6TlEvUHlBK0NINnpaSE1HejJLY21qYXJuNFE1?=
 =?utf-8?B?TTdZNDJ0ZnBKWVFOWkVMWHdzZjZ5T1BmTkV3WWhaTTlmVDd4VEFLM1c3UTlX?=
 =?utf-8?B?S1BORm5lZXFDTkFyOU80NWcyMWhjd2Y3ckJ0YXZiKzdqSDlvTjBnSW9EdHRX?=
 =?utf-8?B?cDZRY3N3MUJNWnlrSHhranNCbUZXbEU0ZEhSa0o2TEl1RUJHa0I5cDY2eHBI?=
 =?utf-8?B?aHRZeXdnaDVIRXFaSTBXbmNLeGhJSFMvMEhBSFhMajM5Ykk0ZDBqelNIUXQ2?=
 =?utf-8?B?K1pLa1RYbWxmVEZ1OFdaRW11YXk2Y0F2Nyt2N1htYmZ1MlNGY2FGNjJsL0My?=
 =?utf-8?B?ZnF0UHpHd3J4TWw1T2VQN1hXMm8xajF0QmRQbzA1MWVGZW9jbkJoRWYzK01t?=
 =?utf-8?B?a0VHRHgwdkthT2JZVEorSThqZFRlaFdmdHZTWXlLaHVub0I0ckJhekhMZDZn?=
 =?utf-8?B?QXJFSTQwUk92bDkxYWpwMHNZVTlkU3pmOUV1TktMTE5FdXhyUzVvd1RGeTgx?=
 =?utf-8?B?QS8zRUgwckxYNEE4QWwySjBCNW1HdlBqT21zL1JhWUhYNTRpSCtMRS95L1ho?=
 =?utf-8?B?MWRxcjR3cldTb2w1T0xYZmFvMUdOaWRHUG5JTjIyOFNEcXlIdml5bE9DZ0I0?=
 =?utf-8?B?SlBYTzJHaHlVM1poZXVxVHRJNEJPUGVXZk1JT05ONVA1SnBwZDRlSTJlcGNK?=
 =?utf-8?B?cTdueHkzSUlqbEduZVBVZmxqRmwwRC9zWFdxVlFlNDlwaS82NlJodkJFQTkv?=
 =?utf-8?B?UWtoTjBsNGEwQ2NWS1dnajlKQ1BxN1c0NUt5Mk1wRkFPcUJuZktydVl3SlV6?=
 =?utf-8?B?UUpKUmI5WXEzNk03NnEvSEdHenNDUjBGNTZKaHFGemNzcEs1eW02ZVcvTjdr?=
 =?utf-8?B?cTNqU2hVMkFJbUlsWFBvclJab1hWMUI4NUw1Q0swWVVFUWtFMndxVHpDQ2xD?=
 =?utf-8?B?NlpKN3E5dDVnTGVBZHV4S0ZLUHlGSkJ3Njl5V28rdkRnRFZROGFMc2tOdmRJ?=
 =?utf-8?B?K1RoeUovZWQwWVBVTDN4Wk9pM294ZkhqSW9nS0Z3cFdyWnptWUNyMGgrdWJD?=
 =?utf-8?B?NmlnYWNYTnRKTzd5aEhHZXdWTktPSkE1M1NSVUwvTnF0WG8wcnY4ekRWRysz?=
 =?utf-8?B?ZmtsNDJyYkhTbEhZZW5pZ1FJU1RQYVFBOTc0dytLUko4MWFpcmpZWkFudHZy?=
 =?utf-8?B?VXlmeWVNcUt5U0hlaEJ1VDBlcldjcExHU3hRNXlXVWRyVEhjY0dtWXUvSXJz?=
 =?utf-8?B?cHR4RGU5WThvbUdqZjE5UHJuWHZJRWZqQWFKSFlwb2NWZlBIcXFBb2R5VUsy?=
 =?utf-8?B?Mm91RXZ3WFF2djJlUDBHemx6SGFIV3A5VDF6Wjk1RkxlSWVrdkdqNTI5U1Jy?=
 =?utf-8?B?bWorcmhMekdWWjdqUXVLNER2USs2WVN2ai9CM3hpMDl5STBNbkJOUE5CK05a?=
 =?utf-8?B?NjIwdHBodEhadjRQWTJsZVlpSithamtwV2JneXpRZlNaSUdhUnMrUGJmbUcv?=
 =?utf-8?B?c1JBaytSNXBORkMzWlRYTm1yY0RhZ05xeVdsdDJWQ0FxQTdYanpWUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e95c78-55d4-41e7-8e14-08de90c5a8e7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:39:35.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqDcFZls3VEnSXIucmTDqgTkH0+N02YWQOl/Mdti0qqOQDhPxTPFRIv8Ffh98zAZ4R+dcULF5MKbhvIxQiy82Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2451

On Wed Apr 1, 2026 at 11:27 PM BST, John Hubbard wrote:
>
> John Hubbard (2):
>   rust: sizes: add SizeConstants trait for device address space
>     constants
>   gpu: nova-core: use SizeConstants trait for u64 size constants

Acked-by: Gary Guo <gary@garyguo.net>

>
>  drivers/gpu/nova-core/fb.rs     |  21 ++--
>  drivers/gpu/nova-core/gsp/fw.rs |  15 ++-
>  drivers/gpu/nova-core/regs.rs   |   7 +-
>  rust/kernel/sizes.rs            | 167 +++++++++++++++++++++++---------
>  4 files changed, 142 insertions(+), 68 deletions(-)
>
>
> base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067


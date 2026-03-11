Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A83F3E63B2
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255254; cv=fail; b=jBZf3V93KmpGUMmLMORnwsO2CI+hSmmwSa27QIG5x8Fls2KL2GF5BwLimuAo9uHtX8/AdBAyURJp81nz3a2oqolTVcZFpC/dVv3H6NuueFYs9dv3WLNrUmjIAknYZR1GOlyNX4G6Tg6MFSylH7yvEz6tFW+F+471I3pB8gRxqOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255254; c=relaxed/simple;
	bh=L83CTxJXeFqOmNMni9aWNsMGQl4ebSdb7Wd7ih2dkBE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=TNZ6JGB9maOoPkxt2xK1HaiPy+yO7SWs96x/xXy7qUhLBotnpqYBzhuD+kPb0Mu1VQcvoMFEvQ++ZJOfnOkMTBTYX3fX2X5axvDU3f1GZf0oXbluOV86bprHVjkW2LKX6NCm/o0gkDCcf2tMym0HW6825wqM1ZXHvrEQT8FkMbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rjzqiS/h; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rjzqiS/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feu5FCIsWzMjGwL4ha+4NUNWGIHSrm51szThn2srLTMBPBeoHnqreB5VFQZRR+G2fJOiCj0ty3HfonZOcgT+i9Vo8PhTcgBwvF0adzg8Voa3ioScEZ+x51VrR3+D/URaeAQy0CKzk2cITQDLqiIgqApiRQZhxQGRG/5Ytbinvnlsp/30UiqI08f1WFQbvT4Sngy5Un5qpkVrJ6VUY2aEzcnB1aAmBGgqG+FLc29hquYl+/Od1pQh3LGkgU/Wl3XNy8WDGdy+UQvYI1F798WV4lxb7kg5GVmPT0+xL5D1fx+SpKE77RMBgziNYBVcRuonl4QEZjSSuNFlbgn3TccgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9GapgMjNTSqnvplX/ESBlO63eugI5wgEqCIBCahIO8=;
 b=Bmm18ijNbMcXHjnC+Ia+RNfCfuNhi0lt+3lb4NuS9xC6Pqjik+zZrC3WsYQ+LJIZ9BSP9UVBX83F8BmmAdLceXAm6CAoVUcqTprwMDWLS/LDvjIyPK9G16lYtkaDOBi6wcondH0fHZ/6qXzch8UA/w+slzu3VJw97lD2CoUnSfr8ZTCm1dwk1y8f6rRRTPshypyogvq9cF/QzJbmHjumrrxJQOUKQjoEwTUKhJUnfGZCRnttJHKynhUgwA5Vqjl1+29m0HHDq9SrTAmuNF9PtY4U2QNDi7c1QjpMa5I/fyozjLzCScCTHLT7rWh9ncmf1OgfU9p8oAGIevMjNG+aCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9GapgMjNTSqnvplX/ESBlO63eugI5wgEqCIBCahIO8=;
 b=rjzqiS/h4ZfgmgLch4BAicSqX13YZjJaTh564JDj7ZfFR+qI9hpi7qG/YnqobrbbXjzHYNbZY2mMNzie9kU2s44PR4vU4gSmIU3HNsP1egEkICny/mcQXMduVXCs4lwKRvZjzHa6Et2JJuYvyzm+QyeVD17aay90FDUBbDjhq3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3553.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 11 Mar
 2026 18:54:08 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:54:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 18:54:07 +0000
Message-Id: <DH06IUHXSE3Y.2ZFEO07HSJ089@garyguo.net>
Subject: Re: [PATCH RESEND v11] rust: fmt: add safe pointer formatting
 support
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260311-hashedptr-v11-1-dd1b8e8b0fb0@kylinos.cn>
In-Reply-To: <20260311-hashedptr-v11-1-dd1b8e8b0fb0@kylinos.cn>
X-ClientProxiedBy: LO4P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a14e8d-3c16-48bd-c71f-08de7f9f92ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|56012099003|18002099003|22082099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	cfy/lltS+S2PCyfbz2CdVhQoxUInrta94oLifsbmI9pBLZSVhvaWLJFwPLqIz1Pu3ZpgJHVbrCk6AKkC/FUdEBhm2K+TtTFpxQddjlRjkRw1Phv5DswoIfGfdjM7iIyccpwnl0EnRm4Kz7MNHudTqJsNEMf/93Bm6fm1FEVlAK5evT9kIyiDYjhr1UsjejKINZ25nZgUfzgZfPtWtat03vTuuZlyKqqGqwruYx0Pys2CO6dN/BKGXi8CYdMkrKcqqa2kjRFSdNtIm2IAqjmMX5jjWtYKxgAABUkAaMxSDz5aGruCdL5YN+D2UtatVF/7mMeM/4xAN/SZjyyQmmXUKkQ4QNE0+umlfzl30wJrdTFcyV+eKwb5A9bIPKO1+6lpYy+uDYc2plgR8XUvLHjOZwdsb/6SXDPBx0F5Ljj2iXtTCtP7q8/ybG7zyZJm881FEvj0NUoSLMPtiQr42Kh16NhUXIMiSNguMZTvts+wgJMf9GJnvOLKTe9PoACyrItrv1f7sZCcCca7RVJP557OQVVGHwYroGphWK/v4lk/7V/kO4PaaOIfJLfpdV4XsI59hLxWiLSsn+YggMZW55oxp0UythlkvjFtDTx01JM/KKsj5iS/6G8Jl9HCLeOEcXOtC+eSGrATIN67YDjVJ0uZJEQck4jTBqztdTz9OoCZW60TO+YwPhBOZWJKvLUewj4z4l7hInJCFvC1aklRs8tt0OIAPblHnn/qdwu93XPuPgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBqY01pMlcwM29valUxU1I5U1VkUFFBc3NNSU9nL0VJQzF1dWg4RXk2UmJB?=
 =?utf-8?B?VTNQc0Z1M0VLejZWd3NZRU5lMVNCUmtzdjlJOVMwNHk4WlloTHlZY1NBeVVl?=
 =?utf-8?B?ZVIvMDFzdzNkaFVnaGN1V0h1Rk1HNWVETE1EUC9GYTI5ZnEzTFI4SFRGY1dB?=
 =?utf-8?B?L2p3dStTUW5wQTRXcWVIakNpTHlFNVh1dUxOWnZWbjRBMFdueFBJMFZqcmxL?=
 =?utf-8?B?VVFObWNHekI3WGt5YzJDTE1PcGNoaGZGUFF3eEdDblRHN1VhYi9MVVhNeDdB?=
 =?utf-8?B?c21VbGI3UkZLM2tESnRKd0F3QXVTWlorbE01dy9KcElPZUdUdHhFd3VXeHVk?=
 =?utf-8?B?UnF4azI4VHYvMFU5bjlEeGloVmtSU0s4a0pQVU13aXpLT1kzaVZVOExJTEpi?=
 =?utf-8?B?MU9GbEpXRlVSUFpSYjU4VlVkd1ZGY01zcDN4Q0tRbWFuK0N5dzNqdm54NVpE?=
 =?utf-8?B?cnAyMUczQnBGY0ovbzNjbmEyWEI0RThGNFBjOVV1Smo2c0ZPN0pCZHFUZVZv?=
 =?utf-8?B?Ti94U1pUN1FaejhyL284VTduU2NGV1RTMTJuN20rV09WVml4QUthV0RvMWxx?=
 =?utf-8?B?WVcybHhaZER5ckxEbEFmVUJWeDVmSXhnY3NNSWloaU5DZVlEdkhzc0pmZFJU?=
 =?utf-8?B?MWlkTE1WM2REdGhKTXdCaVI5N3pVVEhLZEM2QlBva2tXYmd3dEVsam9GMEJK?=
 =?utf-8?B?VlJOTU5lSDNMYmJVV05LWEY0bVJ6cHJVSUFrRDNRRzNzbjZRRGl0WTRaZUE4?=
 =?utf-8?B?Y0hvMElGV0xQb0tmS2pZUENzR0ZBRTdmKzAra05zV2V1VWJzK1luaU16UjZv?=
 =?utf-8?B?VTE2NkJvTmRqdDByQldDUFNvZThhVGsvaFlKdUhhc1ZpakVwaGZQMWozajJs?=
 =?utf-8?B?bUw0SWs1dFRvZU4wL1ArL1RMWU5kb2YvVEp3OTJHUTBOcWNZOVdyOEhkNFlL?=
 =?utf-8?B?RHJocmxPRmc0ZnlCcDRUK1orSGJLZnBkR1NUY1BjRU8xZVNBbHBVZUtNTnM0?=
 =?utf-8?B?b3F2My9NUHVjR2dCMkVIUkgyUHliNktmMFhRSFJudTF4ODJvYjhWbTVOQ2R0?=
 =?utf-8?B?S2s0ZUNmSmhCL0V3S01wZEdtZTVqWTN5YWRJeUZRbzBIYjlwWnBUUmhnY1BT?=
 =?utf-8?B?b0NGbXBqYlhvTG9wNGdjcTRUbjYwb3ZoRFh1ak9WaFE2WUJMUVlaRTg2V0c1?=
 =?utf-8?B?cUIxNExYbEVJWlFEdmRkZlZvV1dZZzZBZWcwb3FOelBTc0FSVCtQTGpMVnpv?=
 =?utf-8?B?QTFJU2Q2Q3pob0hHWm9HcU1CY1JrR2dVUDJxeTZtTFR3Z2YyZStmZ2VJd0lj?=
 =?utf-8?B?eHM0dEVNNDU1NVBtdVlBM3pZT0JWYmlHYXowMzJlSTlmZFNzaUJ3NXBFdGhs?=
 =?utf-8?B?Syt6L2tTM25JT3RNbE9IMjNMOXo5eFE2dmV0QklUbkJRQ1RCa1pEL0l6empM?=
 =?utf-8?B?NWlhTDZxdGErOW9VZnFhRnZRSzZ0UHhVanpuSDV0c0ovVFU5V2Fwck5BTnd1?=
 =?utf-8?B?WlhtUjMvV1ZMM2tEMVNRMU1aTUZ2M0VmazJ0cmtEZjZRSnNkOHYwc1BFNHU1?=
 =?utf-8?B?ckRHRUh4V0FRd2R2SHR1c3FveS9VZVhna3JFWlhuT2JBV2lndlA2ZC83ckpo?=
 =?utf-8?B?MUNwbkpCS05DN29zUHA0YjBSUGN4QWt4M1kyTllwVStjcmdYdmYzaElDbjNG?=
 =?utf-8?B?Snd5bkF1bk1pSXFKOVowdWhhc0FPejJyNGtDZ1FJcVdkM3JaUldVdE1ydlIx?=
 =?utf-8?B?QVJmL2NsVHlFZzRSUFpRL2oxb3VBUHdCdytsTFl5QWQxQTgxU0w3d1JLSk1k?=
 =?utf-8?B?bnc4WkpoYzczMFR3YXhKTTBmb2hNL29BK3E2SXB2bzRPS2VTMzlmbW1NVEZI?=
 =?utf-8?B?SWZPOW1nRXkwdUF6dFM1dVBZdzYreXdGVC83Ukh6Q0p4UEh0dWhFVjhjNXBS?=
 =?utf-8?B?cHZTM3NUMWZ5dURRVnhUZTU2WUp1WkNKYjI5aC9OQ0pMZHZBZ2ZBcWNRWllG?=
 =?utf-8?B?ZkVya2R3dCt6SUs4N1JpUFpmbG9pWmN6dmVVUUFqWVY2aXgvVDMzalBvQWFv?=
 =?utf-8?B?N3JGQ3Bka0pGSTBEM3BKZXBlblgwNncvdlk5N2Ywd1diVFhES055RUZZUzJq?=
 =?utf-8?B?R2tyK3gzTXY4MG5IN1VFV3FyT2xLaHExUnIrZUJGUHlLelEvdEVYUm0wM3Fh?=
 =?utf-8?B?L0xDc2wxUXJvYVdZemNUWVY1UDVnU1pTZnZrUk54bEgyZ1dRSkg3S2owbzlS?=
 =?utf-8?B?bXJTWUgrdzlwSy9DNHBpMDFmZjJPcFo1eExHUVZubE8xeU5jY1ZxL0pIck9Z?=
 =?utf-8?B?MHM0ckVkWnZpRzhjR0JsVjBSYkpLZTNwV2NRYlFrc3JVQ25iM0NRdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a14e8d-3c16-48bd-c71f-08de7f9f92ee
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:54:07.6062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOsq7ueG2HlVmYB4lf7HVs3L8MJcXNIDdyOrDsNr2y3Cz3iXTQRAkVL0NLQO/Z2GS0wqMl8jWk6UhioYOPVK8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3553

On Wed Mar 11, 2026 at 8:46 AM GMT, Ke Sun wrote:
> Add Pointer trait and HashedPtr pointer wrapper type for safe pointer
> formatting:
>
> - Pointer trait: A copy of core::fmt::Pointer that, together with the
>   Adapter type and fmt! macro, ensures raw pointers are automatically
>   formatted using HashedPtr instead of being formatted directly.
>
> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>   This is now the default behavior when formatting raw pointers with
>   "{:p}", preventing kernel memory layout information leakage.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1219
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
> v11:
> - Fix inaccurate or inappropriate descriptions in comments
> - Use as_char_ptr instead of as_ptr so that a *const u8 pointer is
>   always passed to scnprintf on all architectures
> - Per Tamir's suggestion, replace doctests with mod tests and adjust
>   test content to make the tests more meaningful
> - Remove the RawPtr wrapper type: it and HashedPtr use different
>   formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would
>   call core's Pointer impl directly). This series focuses on fixing the
>   issue that without it {:p} would output the pointer's stack address,
>   and on using HashedPtr to safely format raw pointers and avoid leaking
>   kernel address space layout information
>
> v10: https://lore.kernel.org/rust-for-linux/20260121050059.2315091-1-sunk=
e@kylinos.cn/
> - Merge all patches into a single patch
> - Improve `kernel::fmt::Pointer` trait implementation
>
> v9: https://lore.kernel.org/rust-for-linux/20260119033006.1453006-1-sunke=
@kylinos.cn/
> - Refactor implementation to use Pointer trait and Adapter pattern
>   instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use
>   scnprintf directly in Rust for pointer hashing, eliminating the
>   need for C function export
> - Move pointer wrapper types from rust/kernel/ptr.rs to
>   rust/kernel/fmt.rs
> - Split implementation into more granular patches: Pointer trait
>   foundation, HashedPtr type, raw pointer default behavior, and
>   RawPtr type
> - Remove documentation patch, integrate examples into code doctests
> - Simplify API and improve code organization following Display trait
>   pattern
>
> v8: https://lore.kernel.org/rust-for-linux/20260101081605.1300953-1-sunke=
@kylinos.cn/
> - Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
>   EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
>   pointer wrapper types (HashedPtr, RawPtr) for %p and %px
> - Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct
>   construction
>
> v7: https://lore.kernel.org/rust-for-linux/20251229072157.3857053-1-sunke=
@kylinos.cn/
> - Refactor kptr_restrict handling: extract kptr_restrict_value() from
>   restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
>   improve RestrictedPtr::fmt() implementation to directly handle
>   kptr_restrict_value() return values (0, 1, 2, -1) for better code
>   clarity
> - Remove Debug derive from pointer wrapper types (HashedPtr,
>   RestrictedPtr, RawPtr)
>
> v6: https://lore.kernel.org/rust-for-linux/20251227033958.3713232-1-sunke=
@kylinos.cn/
> - Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`
>   in format_hashed_ptr(), ensuring width, alignment, and padding options
>   are correctly applied to PTR_PLACEHOLDER
>
> v5: https://lore.kernel.org/rust-for-linux/20251226140751.2215563-1-sunke=
@kylinos.cn/
> - Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs
>   using kernel vertical style with alphabetical ordering
> - Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed
>   Clippy warning)
> - Update type ordering to alphabetical (HashedPtr, RawPtr,
>   RestrictedPtr) in fmt.rs macro invocation
>
> v4: https://lore.kernel.org/rust-for-linux/20251225225709.3944255-1-sunke=
@kylinos.cn/
> - Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve
>   formatting options (width, alignment, padding characters)
> - Improve code structure: reduce unsafe block scope, use early return
>   pattern
> - Add doctests with formatting option tests for all pointer wrapper
>   types
> - Enhance documentation with detailed formatting options section,
>   including examples for width, alignment, and padding
> - Fix RestrictedPtr example to use pr_info! instead of seq_print! in
>   docs
>
> v3: https://lore.kernel.org/rust-for-linux/20251224081315.729684-1-sunke@=
kylinos.cn/
> - Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
> - Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
>   rust/kernel/ptr.rs corresponding to %p, %pK, and %px
> - Make raw pointers automatically use HashedPtr when formatted with {:p}
> - Add documentation for pointer wrapper types
>
> v2: https://lore.kernel.org/rust-for-linux/20251223033018.2814732-1-sunke=
@kylinos.cn/
> - Disabled {:p} raw pointer printing by default to prevent accidental
>   information leaks
>
> v1: https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke=
@kylinos.cn/
> - Initial implementation that directly printed raw pointers
> ---
>  rust/kernel/fmt.rs | 145 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 143 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 1e8725eb44ed7..11a0508a7fd08 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -5,6 +5,7 @@
>  //! This module is intended to be used in place of `core::fmt` in kernel=
 code.
> =20
>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
> +use kernel::str::CStrExt;
> =20
>  /// Internal adapter used to route and allow implementations of formatti=
ng traits for foreign types.
>  ///
> @@ -27,8 +28,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      };
>  }
> =20
> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, Up=
perHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Poin=
ter, LowerExp, UpperExp);
> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);
> =20
>  /// A copy of [`core::fmt::Display`] that allows us to implement it for =
foreign types.
>  ///
> @@ -90,3 +91,143 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
> +
> +/// A copy of [`core::fmt::Pointer`] to prevent raw pointers from being
> +/// formatted directly.
> +///
> +/// Together, the [`Adapter`] type, [`fmt!`] macro, and this trait ensur=
e
> +/// that raw pointers (`*const T` and `*mut T`) are automatically
> +/// formatted using [`HashedPtr`] instead of being formatted directly,
> +/// preventing kernel memory layout information leakage.
> +///
> +/// [`fmt!`]: crate::prelude::fmt!
> +pub trait Pointer {
> +    /// Same as [`core::fmt::Pointer::fmt`].
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
> +}
> +
> +impl<T: ?Sized + Pointer> Pointer for &T {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(*self, f)
> +    }
> +}

This doesn't look right. pointer formatting for a reference should be print=
ing
its address, not the pointee.

Best,
Gary

> +
> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(t) =3D self;
> +        Pointer::fmt(t, f)
> +    }
> +}


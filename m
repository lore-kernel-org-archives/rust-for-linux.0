Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FF79CD
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767340652; cv=fail; b=SpmhpEv+P0DhdyMbt1ZrB3LDGQg3BE6jo/8fxoxuA3qPkDSJ8TXAd6wWxMu8yZpXeLJ/A//C2DEQIE0KPYNUApo6/w+Zfuef592cbUUGZYgYMQMkI18VwgkWf2q3UtEmvlZ+ZO3Zxmr8PUelyU9nL9GVktvb3E90zcaPzMzKVkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767340652; c=relaxed/simple;
	bh=w5gahKUhBOwxXYf7T1IVUKHJu4FI9HYDuC4524wkzio=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XFLHYsHE/37H+Wrd1wiBTGedrFLrf460TwRyNnSl+3pm0op3GEqlEgsPO5pVdG9ne9Ak75lSWWB1uQuglIZ1sZG70/832XIgKvph56ymd4bBApr09hltDl1/jW6yXNFPiPJBwzUAgQDhs6TerqnI1qdds5owsG5FGEY/XgOP83I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=D1D2dnjx; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="D1D2dnjx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnQH/XK2rCrTmKsXe+l1tHHhobG3IJzp2Ufxy7C/M9cRIVMp5eMcwbpCx5lfZOYaOOdwRQp4R6mZOLPwQSA6NQbsJ5reFcUOcYWSvwNDIfFhbA/yK0OVK67dk6kFqfnX7xaEnveIbn1yn4NHcxBxdfgphEj8ZLAU1ldNUqqjrxey7olWbM80/sxSjlrtu5KOpspN60IhfBYUIdjEXfOHB2AvuYnno5HcrAKLvJnEKYsqd+NYkxJMHjO6iOPgUn9YzE3Q6DuudLZfUg0jEScQlRp/TkZJuuwVNy7urWVEiCSF7la0oZ92WnphSN7RLC53QToWnQUL/yS8H+rzsHAqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT4SDeNS1uigTG0R+2jyeYJigS+OPbaUvJbxhSDebIQ=;
 b=qTbUcjtiRvdwMb3kZLQH8rpvkN75N3bMO0v1v5ZNqlGM2LqCkX/XBfEzirZ9nq0Rv5RWEiJFc7mozHgfItY0xsHsluU26zgJZYMskTiu6T7LtsE6oKm2dssR+qYSgLAegFSdSFgzvfFG7vk/FCJgTTAEJbM1irNj4UuEvIZpOmYIgSxu/a25fQF4qtoz/5ngkRQLLb1nSU8DkQ6X0OKBobp1kSRRSDp2IhWNQiOPoyKcdS5heKRpALMGqYgaQt0VTU5FYMPCvhgMIF3Vpx9e/wM/E669aRdIdPl7ntLWghSibAwUxoO91uciZSGw4scRMy9aOzOixnUION8JA8ZUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kylinos.cn smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT4SDeNS1uigTG0R+2jyeYJigS+OPbaUvJbxhSDebIQ=;
 b=D1D2dnjxOnlkiXNizVQ/0WKCTGHUpFkQxGuldtjQN2At7SkLFhapnErGlCLEQvYMKY8UOrHFdEj2xM71Pdk/7oXvDaCR7Ph+DF8VukGPiCqyBzo7Jx1aNDPeWSj2gsUgVHAwn0fVq7Heu9PJ0x/IIX3WlVGr8NWs/NSXHOovhI6buxdPgrmDuHNOhjcZ1TmGLnAKear/KLqtz7xPVzBiPtj70kDUF9Z1Nn3lD5Tw1240c4rlD5R+K0Wh67IxCr6+J10TbiHV58YAFZCjtYh48gYAz+aQI6XYmFr06PB49/IFEfBLmZkaow7fR3CRh7O8UCtp/YsZQXTzphFE4Vc8TQ==
Received: from AS9PR06CA0284.eurprd06.prod.outlook.com (2603:10a6:20b:45a::27)
 by PAWPR10MB8188.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:385::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 07:57:24 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::8) by AS9PR06CA0284.outlook.office365.com
 (2603:10a6:20b:45a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Fri, 2
 Jan 2026 07:57:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Fri, 2 Jan 2026 07:57:23 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 2 Jan
 2026 08:57:17 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 2 Jan
 2026 08:57:17 +0100
Message-ID: <4ef1abd2-e9df-4e75-b203-5b7fece3bb7e@de.bosch.com>
Date: Fri, 2 Jan 2026 08:57:16 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Ke Sun <sunke@kylinos.cn>, Dirk Behme <dirk.behme@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek
	<pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Timur Tabi
	<ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin
	<lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
CC: John Ogness <john.ogness@linutronix.de>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, "Gary
 Guo" <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, Ke Sun
	<sk.alvin.x@gmail.com>, <rust-for-linux@vger.kernel.org>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-3-sunke@kylinos.cn>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260101081605.1300953-3-sunke@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|PAWPR10MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: b59d9af0-2ed9-42c1-d7cb-08de49d49078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|7053199007|13003099007|7142099003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzZCS001WEdES0M2cVNJSHpZZGJzNm5MY2d1N3R4TUZzK1hBNElZMlRpazlW?=
 =?utf-8?B?UzVObU1pakJBVXdCdElGdVBRZjIrRHZvNDdJTUVGdkZINmZXc3B0VjMxdDNK?=
 =?utf-8?B?ZHpxYjJnYkptamNmdVJsdmE5WjNwWG9RNXhYVFFETElTU2JnSDkyblFjTlNQ?=
 =?utf-8?B?bk40ZTMyWHFLMGd6NnFLZnEvSk1RSkd5U3dXUUlEWUtlZGMvSEZpdFpKMzI0?=
 =?utf-8?B?TmhCWHE1eEpxQUQ5anp3Wi80ZDNDL2c1bldva0I2MzlsR3B5WE83WDBOU2x6?=
 =?utf-8?B?cUM2UHhSYWw5Z2p6R0dRbUJkM3NHRTBnQUFRc3NhQVkxWlVGZEljQ2RhamRh?=
 =?utf-8?B?b04vbnB4bXg1MkdXN2NNL1FON3QzL083ZXR2a2hCT3FZbEFFRW5JMlZhQ2x0?=
 =?utf-8?B?Y2VrL2xyN3piRTFWU1J4R2JLREpreXdvd3RxdWpYa0x6SzFkcUFFQnFTSk5n?=
 =?utf-8?B?Q1ZIcTZtUEI5NjFWYXFSWUtLVTJzM3RjeHFab3JlTUxtdWlHeUZ6cVN3Rzln?=
 =?utf-8?B?c0RTS2YxV20wOVJSbUlGYzFLclA3V1RPUDVqQTlhaFRNeCtJT0NRNTVWZG9z?=
 =?utf-8?B?emFZckJTMnNKRUhvWUUycnJudE5OT2EyYWRSQ29RU0dRTDM2UVdKMW45c3pP?=
 =?utf-8?B?dnVKajNUZFZQNWMvYWZ0R3RuSlk2Uk9ZRnVtZndLZ1AyZUNNekJIeC9OamZ0?=
 =?utf-8?B?V0R6cDVBTnlzdVhoTnpkZmNwbUJycVJZR0MwMW9mRENaanBMSThtWFQvT0xh?=
 =?utf-8?B?ZHg1cE9lenl1VTMxT0JTMStQNDg5YzErWEVjUCsrUyt5bHVpdHo3ZE82YmhY?=
 =?utf-8?B?cC9KMWZpY3F3NGZ3WjBTTHNRb1UzQTh6ZHAwTE8yMVVHTFhBVktNc1dCTk5q?=
 =?utf-8?B?TC9nQTlDaTczUFhxRlcvRU1UNEFJS2lMdlUzaGwyUUo0MmhrK0ZkNmZERjdh?=
 =?utf-8?B?ZmplblR6VGFybDFwTG9VT2VJNklCOGxBVTZvL0tnZGtwYTVTL0R5OXF3aE9C?=
 =?utf-8?B?Q3dMb0Rhc0c2cmI1TFVDZjJqVUZNeEFScFh6RjdHanNGLy9FSXBOTEtNMlAr?=
 =?utf-8?B?UXB5aHVRMXQ3aEJ6VGc2WFBzYklEcDBERFJ6M1h5UktIb2k5WmZaRDdpUEJJ?=
 =?utf-8?B?b05pRVgvTS84MUVaTzlULzBmUXdmbWN2NkV1eDY3SktOQ0c5MFFDYmhMNGh0?=
 =?utf-8?B?WFVGdGJFaDJjbjF1RmRVVk11VVVPYU5OZ2RabUhFWm9zVzlmTmVYZ1hxN0RS?=
 =?utf-8?B?TWZHbFp0NWJtbEY3U1A3WHpCYTZQTEQ2SHJ0S3E0RXJ5QkNDMU1oY0VxWk9a?=
 =?utf-8?B?akNyMklOR29QUUhDOU1yWlRMTGxFRFgreHBqRUJOKy9iZW80b1ZPRHNCWk1n?=
 =?utf-8?B?bFNzYjhwNDNFMGxBeFRUa3Ava1VPeXNXaFlFL0FaQmFab2w5MSsxWXBUV0F1?=
 =?utf-8?B?RHZXSW43NGxCWWVnV3d1VDFMdTRkYWpwNGxXM3FNV2lUQkI1Yk9UR3FWcjha?=
 =?utf-8?B?Y1dueWZWeHhjbU81RExDVjZkak54SWlMUDNKTDJxQWRpb2YvTkJZV2dFTG9N?=
 =?utf-8?B?am5rTGdWRGt1YVdaRjNhQWFnVkVIUUEzWkxyL3l5TXRsbkpMUUxjTG9ZYXRr?=
 =?utf-8?B?aG95VE1jVkgxUm9YRnJaRUJTYUQ0UC9sUXpVb1lzbDBvdi9sUzY1ZTY2dUs2?=
 =?utf-8?B?ZEtVM2lwZ21RSHVVSENFMmVpYkUrTEFOTGhINXVJYjllZ0hHRjBNcFdRbEg3?=
 =?utf-8?B?RGNCZnkva1FKQmFpK2NwYkE0VWtuVDZuazlWeHJkSFhtSjBJVTdaYzVKMmRK?=
 =?utf-8?B?SEp6eGNZeE42OEFEdHVSK1BXOVJQcEhyQ3NreEUxMlAxRWxISVdreEQ4UzI3?=
 =?utf-8?B?Z1Nsc29QVE11bmVPV1Y2OHh5UDFqei80NkNmRDRKMmhaRzNNMnI0NkhtaWlv?=
 =?utf-8?B?cUs2cTZML280ajJpT3lsWkttU3BURm01SUd5dElEa0Fpcm9nNjRHeUdCaTgr?=
 =?utf-8?B?dVNpUzc0TFVHZjZkazVBeFEwRSt4SVpTZmo2emxGYVJ1aWI5SEFZSXBNY1NV?=
 =?utf-8?B?b3NpSVBadzFBbE54NEV0M2Rqd1JDajN6QnlSZDMzK1lTdzdMS2g1b1U2ZWZR?=
 =?utf-8?Q?XZGOtPS5/vSD+vVHDbJTPVha2?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(7053199007)(13003099007)(7142099003)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 07:57:23.8171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59d9af0-2ed9-42c1-d7cb-08de49d49078
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8188

On 01/01/2026 09:16, Ke Sun wrote:
> Add two pointer wrapper types (HashedPtr, RawPtr) to rust/kernel/ptr.rs
> that correspond to C kernel's printk format specifiers %p and %px. These
> types provide type-safe pointer formatting that matches C kernel patterns.
> 
> These wrapper types implement core::fmt::Pointer and delegate to the
> corresponding kernel formatting functions, enabling safe pointer
> formatting in Rust code that prevents information leaks about kernel
> memory layout.
> 
> Users can explicitly use these types:
>      pr_info!("{:p}\n", HashedPtr(ptr));
>      pr_info!("{:p}\n", RawPtr(ptr));
> 
> HashedPtr uses ptr_to_hashval() to hash pointers before printing,
> providing the default safe behavior for kernel pointers. RawPtr prints
> the raw address and should only be used for debugging purposes.
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> Suggested-by: Dirk Behme <dirk.behme@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   rust/kernel/ptr.rs | 133 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 130 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index e3893ed04049d..77132eaaef73b 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -1,11 +1,22 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
>   //! Types and functions to work with pointers and addresses.
> +//!
> +//! This module provides wrapper types for formatting kernel pointers that correspond to the
> +//! C kernel's printk format specifiers `%p` and `%px`.
>   
> -use core::mem::align_of;
> -use core::num::NonZero;
> +use core::{
> +    fmt,
> +    fmt::Pointer,
> +    mem::align_of,
> +    num::NonZero, //
> +};
>   
> -use crate::build_assert;
> +use crate::{
> +    bindings,
> +    build_assert,
> +    prelude::*, //
> +};
>   
>   /// Type representing an alignment, which is always a power of two.
>   ///
> @@ -225,3 +236,119 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
>   }
>   
>   impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Placeholder string used when pointer hashing is not ready yet.
> +const PTR_PLACEHOLDER: &str = if size_of::<*const c_void>() == 8 {
> +    "(____ptrval____)"
> +} else {
> +    "(ptrval)"
> +};
> +
> +/// Helper function to hash a pointer and format it.
> +///
> +/// Returns `Ok(())` if the hash was successfully computed and formatted,
> +/// or the placeholder string if hashing is not ready yet.
> +fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +    let mut hashval: crate::ffi::c_ulong = 0;
> +    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
> +    // hashing. This is safe as long as ptr is a valid pointer value.
> +    let ret = unsafe { bindings::ptr_to_hashval(ptr, &mut hashval) };
> +
> +    if ret != 0 {
> +        // Hash not ready yet, print placeholder with formatting options applied
> +        // Using `pad()` ensures width, alignment, and padding options are respected
> +        return f.pad(PTR_PLACEHOLDER);
> +    }
> +
> +    // Successfully got hash value, format it using Pointer::fmt to preserve
> +    // formatting options (width, alignment, padding, etc.)
> +    Pointer::fmt(&(hashval as *const c_void), f)
> +}
> +
> +/// A pointer that will be hashed when printed (corresponds to `%p`).
> +///
> +/// This is the default behavior for kernel pointers - they are hashed to prevent
> +/// leaking information about the kernel memory layout.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::HashedPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = HashedPtr(0x12345678 as *const u8);
> +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 = cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct HashedPtr<T>(pub *const T);
> +
> +impl<T> fmt::Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers - print them directly
> +        let ptr = self.0.cast::<c_void>();
> +        if ptr.is_null() {
> +            return Pointer::fmt(&ptr, f);
> +        }
> +
> +        format_hashed_ptr(ptr, f)
> +    }
> +}
> +
> +/// A pointer that will be printed as its raw address (corresponds to `%px`).
> +///
> +/// **Warning**: This exposes the real kernel address and should only be used
> +/// for debugging purposes. Consider using [`HashedPtr`] instead for production code.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::RawPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = RawPtr(0x12345678 as *const u8);
> +///
> +/// // Basic formatting
> +/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +/// let formatted = cstr.to_str()?;
> +/// assert_eq!(formatted, "0x12345678");
> +///
> +/// // Right align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
> +/// let right_zero = cstr.to_str()?;
> +/// assert_eq!(right_zero, "000000000000000000000x12345678");
> +///
> +/// // Left align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
> +/// let left_zero = cstr.to_str()?;
> +/// assert_eq!(left_zero, "0x1234567800000000000000000000");
> +///
> +/// // Center align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
> +/// let center_zero = cstr.to_str()?;
> +/// assert_eq!(center_zero, "00000000000x123456780000000000");
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct RawPtr<T>(pub *const T);


In the thread "[PATCH] gpu: nova-core: bitfield: use &mut self setters 
instead of builder pattern" [1] Gary proposed to add `#[must_use]`. 
Would that be an option here as well?

Thanks

Dirk

[1] 
https://lore.kernel.org/rust-for-linux/20260101042851.08576bdb.gary@garyguo.net/

> +
> +impl<T> fmt::Pointer for RawPtr<T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        Pointer::fmt(&self.0.cast::<c_void>(), f)
> +    }
> +}


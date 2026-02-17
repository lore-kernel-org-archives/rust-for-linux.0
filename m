Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021105.outbound.protection.outlook.com [52.101.100.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2C2F618B;
	Tue, 17 Feb 2026 23:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771369821; cv=fail; b=Gxpl7JOSs3vcW8LW/YUyB0dKYNrQ17kLR2uyxVkFNqmOSpVtqec7bto9F20Op9iYULY3qC2bMRN5yIQBwwMtHNirbAoNI4rqPP/LjwL22E7h6OmeEtcSHS6p0OFCSKJPFFtXzGTQu8iU+ItCsIDuP6LGXttkzqolT/nNBmh1hCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771369821; c=relaxed/simple;
	bh=+uZroC1nVX11if+4Uove303x5mMU7HKJCZIDkOcNcaM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=qXJG3K/DeuYgTFwlE6wjmOa0WNCm+W6Y2wLUhq7oO8SqF2E+U9VZZpMBxnmbuuUvkejtWqYdEOjaUEaLE67SLbZGtNe2hDlIf1BQtaJRhiJJ9ZA9qzm4pre1k5zBbJwT7D2GeOpFWEfQyT2TOuc8WCv1or3XIgcQch+jUGtSBk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zdT7Tbja; arc=fail smtp.client-ip=52.101.100.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zdT7Tbja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td5TLQYBfN1tl//5fv4fqOBV/RHA4vqA15/LtWfE5RZ239w2AslAQi7IY9A1DMBjfKstBNSXw0O9FpYQj2F7SYQdSBHGfHaQ5sv1VAekpQln3wy2SZDotyHm60XB2qSbOkSItU1VXc4gNwbK9w1BAjZSwNSFpi0pNhakDX8AFAFczRNy3jAqYmd4VsrSmnnvvnc7q/9upW07h2PbhIJkmmkJyAFM6UoEky5zmp4G91+bLFrNP7S+bh0kQhvNBWeKNDYxxXnDqu6TkmxJP6ltxz5GUc8/nlOVk2RN1YmudpZmgMu7UW1Q46BbjGbYShmdQxHLGLjc9Bo57scuizgTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohfp26LYU7w6E4Nr2mL0oPm6XVCM5ZCmOdJW/FeZGQk=;
 b=xzTqUcvtfhxJ30qoZq5/IkTYCuTgtfF7SD3gPm4mgdSikVwlBcTbCKN8tgOC2WtaPYXHInBCI8B7QIs8UzQ10eh6Xc95Wi/fJ0k6bQY9Lx2vQz2/y8Ltdc65V+SV+mqyThMq4IxstGE6SPGUT3968d6qlJooyizIGAqnTMjcMOqeWOOXP8CH+qe4UmaTg2881Z2hbOEg4rXOtwkSh91su5jo09vk9XRvZSzXgFRLyQZbehUEXQ35kMgCh+4hJUg+DM5vjjhU0zaAQQlKzI+kooh5R2X8DCloulEzGaBdMdTARUGoA59KauoP50mE9r3poxpERLfCtNpGlEf751nBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohfp26LYU7w6E4Nr2mL0oPm6XVCM5ZCmOdJW/FeZGQk=;
 b=zdT7Tbjag8A56r2nmwgJmKI+NYMJc4l6JAK6saK5RRTSsq2TXu6lhso48naO+0Fti3LIDiEkQoI4rvsKe10hW90RmYT/bdmfZVwRZV/1YUAmwfKKt63oblAaXRjz2YiXByDwUx9+3j1qRsf9sP9vdwtJ7PYU5nE6SPipeYsCaVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB3472.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 23:10:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 23:10:16 +0000
Date: Tue, 17 Feb 2026 23:10:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <aZRY9HthKwVJrAf1@google.com>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aZRY9HthKwVJrAf1@google.com>
Message-ID: <67aea464d25c8cafb3113eea62c8221b@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0558.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB3472:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aaff4d4-dcb7-4bb8-760f-08de6e79b63e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6M1ywZ5iT+xK8XA6Hz7rKKo1UogbhO6eoCHEqb5/mIGIzaSkHwHK65ntOBfx?=
 =?us-ascii?Q?Dh/Kn+ia4h/h2HmKRWcoK8L2j6tTdwNzwEJpvZdsiQovNnC3AmVHzwuJ88sA?=
 =?us-ascii?Q?luUUzUV5A78YCh21OWsQ8BQYAJGnlmQxm9q9m+yCn0oH2MDRavldBUNOUBRi?=
 =?us-ascii?Q?TF/XXM3gFHSt2XdZ17YbWycaF98RGw+w9z5JV+8ySxBlELEyIiUvp782vlWy?=
 =?us-ascii?Q?9sbE35ZymOH/8FR0NL6f5ELJWxhHO/UOU3bOszREML3YDte/z0sKrGev3vv4?=
 =?us-ascii?Q?IGPFMgLFBW/2jRBQCJ/OI63Jb+3+lGJg3xj33ZX+oq76F+3VJTRt+0kaBSTW?=
 =?us-ascii?Q?90FZaFIZq5DP3sfV5RzVoIUfTHLFz/Epy52Hka0ZSa7ZBOCUj/YZs8qyM6my?=
 =?us-ascii?Q?jFcICsG5FM2PdtuKb1JTMsQxMmKMBdQboNsZhave9S+w9ghFi+lIjskrosum?=
 =?us-ascii?Q?Nmx3lN+9XSFRhjZu4IgwqmtMF3KOV//ivYrnDnVOL/o4+aqFn7teQ1MoZwWw?=
 =?us-ascii?Q?52IgxC3da4w7Ymo3ngLKC6Yg5PLVMTq+eGPatLBgA5MXxJ+Y+YBpDKRSjR//?=
 =?us-ascii?Q?u1fit8uKOrm4E90qilx1ArlJ+ltJTv+8of55MCVPgMSM6ffyYR/ggio8pKxu?=
 =?us-ascii?Q?tUyP362E3BVK1gCKbvWipxrIV1jsWsdWu3JRgTycGhfpqGK79XY0OFeQwsj0?=
 =?us-ascii?Q?UVWN+RW4v0yIpw7up8W+xAhJOV69ao0hl71TZ9iqXqVH8o6z6pJD65chi1ra?=
 =?us-ascii?Q?E8qVoOYpWvr0c7S0zLgKmmx0mrkO7/rlp2mksOYyTPBgLGJcUo3FwFG71U3/?=
 =?us-ascii?Q?axrxV2Uca86XcC2b+hSQqNfjnOcSJeiHqMVPrlqVvo2GPdFse29jfKa+N6Q7?=
 =?us-ascii?Q?b1+k8nAcYJ/GAfagCkmENZYuYCwsyCW6XhnnktN9Pj6XSVf+TEq0HBr7qesh?=
 =?us-ascii?Q?82NBRU1VakryYWa9QCafGxH6KTGVhHhzuLDgSQxzJJahpqNz2VMiVoaJTSCB?=
 =?us-ascii?Q?yLqKQOOHvWKLEDPNxW/k3wl8KW43og2fgvohGHvncjrXQBON49FARftnQgEU?=
 =?us-ascii?Q?x+Qsue4w9ZGYdgMoYOhso0euIcKX1AVNDh0dKFdCGurXMZlZHjce+VOPXaI0?=
 =?us-ascii?Q?z4QDFBGd0xsl5tX/ysKeXj4FwM5l8oYnKfbSlZ8+Zdk9c91FFfuJc9Ngzpwo?=
 =?us-ascii?Q?166QmoUd4MRhxu1+r0b3GWvccneQob5CRLhPKOMJqM8GvtXxGZ6boSuyTOmS?=
 =?us-ascii?Q?atKVr5S6yzdkEn/9RBjzze0CoylJqoEq/PIHgy/xByEHmxv7V09Zg5Imk9EP?=
 =?us-ascii?Q?vxd8bCJiVDx2Fb1HJOAT1ndfK9SuJRX9qq7G4uX1MkZ+95mM+Q5NoQ1R3U1f?=
 =?us-ascii?Q?g6xvmFMwRitq9GuybUDjy/GisLb0Tdui2XKUKWDWFKUs07sCSD5BienArJYv?=
 =?us-ascii?Q?0hkFfFpjSKmRuzV2svGLREzK3AvJyXf0sMcQTLEtoGsQae6ZtoTsp/l8Eunu?=
 =?us-ascii?Q?V4bxI0IBhbCInWmP2kohvxCkOd9RJlXMCVIN4ojrjkIVSy45acWrd/YyJMPb?=
 =?us-ascii?Q?uJZRvWJR6kcSmEkvtQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Opao/MkDXM4yoPy+TLuAYQxbKtpe8CzqJv9uSUjkTI8bik3xy1nfkd4/Veeq?=
 =?us-ascii?Q?xpNgPypJ6IxW+n27i9vlGoJr1FDhLts8Uwg6Xl/cIvg3+UM3IA+HDJyNC1SD?=
 =?us-ascii?Q?r75tWj9TLIpCRFulpWbRUrYYKNuqjI9eohwTGK8emUnYBm6PspdXKX4B75yp?=
 =?us-ascii?Q?vCxACnxNRzT2KvhERyMwiwTEx/CYoZ/ep4fhysF0SztZQp2qP5/Q3bqduH4h?=
 =?us-ascii?Q?4QqCDVae9tm3gXhnBKogJ9JlHirTpl+OyzGQrb2aoK+G4eQz6WFxi1/NgFjV?=
 =?us-ascii?Q?DVhdpHb93uME8BRkNg+27gJtRhzIqpEfQdGFIJdWUoCery7IKFl648hJI4ot?=
 =?us-ascii?Q?rynMHCx933ErCpLb3YTdh/f88xSkAFBmTpOgx6n7MXhXUrVGuTdx5pzsvSmk?=
 =?us-ascii?Q?pBpYXfzs7m+YnSE7w4uRlG/qdAffjoEfj5GdKvQmfelC6ykPAnT8gKW4kc6D?=
 =?us-ascii?Q?eQSAeu6obb5D2KyCawPEMgpCSclBtsM/SVTnasuSwt9I3S8eBjNK2+erFfVf?=
 =?us-ascii?Q?haSb81llA7PTBjVJBSvwx0kuIaS5fnRmsvdJGSrGHSsDi8mQ6ukacvPafBhE?=
 =?us-ascii?Q?/Wb8w7A7sHNYHVfAKwgPV8rnMAUhHKs562FMWrlf3NFjm8wF3DAoCo7kcB5K?=
 =?us-ascii?Q?+mURWlII8Zi7UBZyan0GbYFE7a522iRnHtPbgxDgzc/vXW43lBihCQ0pCfSH?=
 =?us-ascii?Q?bRru6r7om/wjAPIOmk5VIBdY6soFp1agJLEQ2GWe58Z/4sB7PwFx3CuCyDp6?=
 =?us-ascii?Q?NEWyj90rnpo+Hui8QcN2a+5c+TRh9iUoOicdakrvX+WJXiU+k9QhKcNShD2D?=
 =?us-ascii?Q?4q8ZX2eNJWS8cJ19j4zC8P8PP5EYU75+sV3dlp8Alinhd7JNKXWgrhulcq5e?=
 =?us-ascii?Q?IQdCBVZZqfJI8YHzG/sZS7Tq4mJY1aci8wlSDyRhVCG346Qbjfff5xSoDlza?=
 =?us-ascii?Q?Yc6SRyuXitsi/bwledX+pAgjaAoMir51+ARud58gztosuQKb7tPPHHTTLJqS?=
 =?us-ascii?Q?iEKokN2o4QCUwPOjE/KYQU2rvzZe+WgAcZqpmH9OrmFTS76fgUU5nglPVo8z?=
 =?us-ascii?Q?NpAXgZNfv2KMNCVO1zcuXZ1meS1fOhKDUBOVaYs6ZSV0zRLVsPk2GLrjhpiZ?=
 =?us-ascii?Q?lqnXILA7kLP2P0y8vRUv9zXyUCu7NyUmi6b32gJ71mZiY1NOIVQ5G9S/Cu5a?=
 =?us-ascii?Q?VQESaupn+ABHs9R7CSfbmpTheDZVMreWzEq6asi/QpKNDwFVwCuPBzmekXuc?=
 =?us-ascii?Q?fRTKcRkOPLgUCpSLJyUUBKzvqBn3kTUON2j2hCVfXMrZuqfTWpedkWHKli8V?=
 =?us-ascii?Q?QbNEJhyAybr6ZI899JY71DdGkf0+dFMhulBW4njChMfTGrqVV4BMzrVZZj0+?=
 =?us-ascii?Q?ZxZeM8W/il2yINnuI2qL9SF61fi4zg3aRACIoFUk8geCRFa6mgct889p/pq4?=
 =?us-ascii?Q?es6WeHaIDLMAlAF5YVPtLqN/kXwoPnBYfOcrB48V5ieLwQJV89bP7jxNL+4Y?=
 =?us-ascii?Q?VQC8FHidKN0ghdwq1bMj1oqw8+CvkFm2DVCYmaoJqWMIcS6Fr6CP6iB6A+hS?=
 =?us-ascii?Q?3+EJteW7EGGY+7rEhjvSHduyEFvUdAUx/O3n1O0G0GbCNUoX6jAek7d5mFM7?=
 =?us-ascii?Q?bd/Sbq3i1iZGZ61TjuQxCJF70tSP+ejrDLX0sCrbBuYWBmgPmplihmgocRC2?=
 =?us-ascii?Q?C5+05gUVCeH+Pr4JQ2y32sq7cuU3cOogaMAERcMNo3rWoddypVsEglZ5WwKv?=
 =?us-ascii?Q?Q9F4cyufBw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aaff4d4-dcb7-4bb8-760f-08de6e79b63e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 23:10:16.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqKNrJsWk+FvkBdLl92Riyca/C/R0SHnga6sjqfzWVnsQhY3aB/f/z2MlD7a6avImS1FBYVmde2WInkWK/hxbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3472

On 2026-02-17 12:03, Alice Ryhl wrote:
> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
>> When copying data from buffers that are mapped to user space, it is
>> impossible to guarantee absence of concurrent memory operations on 
>> those
>> buffers. Copying data to/from `Page` from/to these buffers would be
>> undefined behavior if no special considerations are made.
>> 
>> Add methods on `Page` to read and write the contents using byte-wise 
>> atomic
>> operations.
>> 
>> Also improve clarity by specifying additional requirements on
>> `read_raw`/`write_raw` methods regarding concurrent operations on 
>> involved
>> buffers.
>> 
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> 
>> +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic 
>> operations.
>> +///
>> +/// This copy operation is volatile.
>> +///
>> +/// # Safety
>> +///
>> +/// Callers must ensure that:
>> +///
>> +/// - `src` is valid for reads for `len` bytes for the duration of 
>> the call.
>> +/// - `dst` is valid for writes for `len` bytes for the duration of 
>> the call.
>> +/// - For the duration of the call, other accesses to the areas 
>> described by `src`, `dst` and `len`,
>> +///   must not cause data races (defined by [`LKMM`]) against atomic 
>> operations executed by this
>> +///   function. Note that if all other accesses are atomic, then this 
>> safety requirement is
>> +///   trivially fulfilled.
>> +///
>> +/// [`LKMM`]: srctree/tools/memory-model
>> +pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, 
>> len: usize) {
>> +    // SAFETY: By the safety requirements of this function, the 
>> following operation will not:
>> +    //  - Trap.
>> +    //  - Invalidate any reference invariants.
>> +    //  - Race with any operation by the Rust AM, as 
>> `bindings::memcpy` is a byte-wise atomic
>> +    //    operation and all operations by the Rust AM to the involved 
>> memory areas use byte-wise
>> +    //    atomic semantics.
>> +    unsafe {
>> +        bindings::memcpy(
>> +            dst.cast::<kernel::ffi::c_void>(),
>> +            src.cast::<kernel::ffi::c_void>(),
>> +            len,
> 
> Are we sure that LLVM will not say "memcpy is a special function name, 
> I
> know what it means" and optimize this like a non-atomic memcpy?

This "treating special symbol name as intrinsics" logic is done in 
Clang,
and won't be performed once lower to LLVM IR, so Rust is immune to that 
(even
when LTO'ed together with Clang generated IR). So calling to bindings is 
fine.

> 
> I think we should consider using the
> 
> 	std::intrinsics::volatile_copy_nonoverlapping_memory
> 
> intrinsic until Rust stabilizes a built-in atomic per-byte memcpy. Yes 
> I
> know the intrinsic is unstable, but we should at least ask the Rust
> folks about it. They are plausibly ok with this particular usage.

If we have this in stable, I think it's sufficient for LKMM. However for 
Rust/C11 MM
says that volatile ops are not atomic and use them for concurrency is 
UB.

I recall in last Rust all hands the vibe at discussion is that it's 
desirable to define
volatile as being byte-wise atomic, so if that actually happens, this 
would indeed be
what we want (but I think semantics w.r.t. mixed-size atomics need to be 
figured out first).

Best,
Gary

> 
> Alice

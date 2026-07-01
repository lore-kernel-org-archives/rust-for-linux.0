Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022139.outbound.protection.outlook.com [52.101.96.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD46C3603C0;
	Wed,  1 Jul 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922561; cv=fail; b=EarFNGnX4Yx+/Wv6C/5rPES/FQV71I1pjUf+2IOPdl1M7DGxbJici8ZohAhdddxI/doekvueHQ4CAId1zyCUy1JFU65QCNTFss1TRjo+URtS+Es1vNVtoMzvcAq/bS3kE+7HxfI5Qa/a4W0obSDHl7B/nPpFkM7sGgFo7+Djh9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922561; c=relaxed/simple;
	bh=YtB7WlTLFJLTk1aw0PG/mTZ7rL23uJ2Er2UnAP2Zano=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pB/ExMg53hCifasYYybQ1M8uZwEp+Z0bnw7fd0GHEFzUwgKr7ZxRhfYJYSXg0uJl9cEf2Q8FfhEIHwoGUVf7JaQX8LbJOwsYBEgE5PRSXsC7BLXdaGvPCBqortBOObiUGGLlRvjpFCOMEOzwzYY0Da4/PbRnD+35a4Q+wp6Uotg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GerJJ4YK; arc=fail smtp.client-ip=52.101.96.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GerJJ4YK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYJbIUlyKHUmsPnktB+1RX+gPenhDuBisiy6kDLoOTHqd/ycaFm5H1eZTKGkG3ZYFTGTtRrPqScjPvqJSwae1iWm8owRxqRbSASmyijAJwEgKAzwLNiCciGvYjiglsLWT06L6NS6KKMusGKYEwrSLMu3m8/AI3Vf2yKeOZ7+PxzwoFfi+mKLAmALjSPoHE7SxxU/JAFrbWdiT+z+2l2xzHKgTuhy1Dq/ym+FxyMNwjwx1bXP/Mw61t6cU5M/4u2VpIlkMwUObYpZUtQRidFERJNfXoMYId05iRLZmgV2m78g29S1wfQfnlrnIaKMwsPPe3mIWw41pJdA7o3n9xdpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0K8/+9rZVNTMHffDfnR+ROle86KQABgu8jgvbIOBQM=;
 b=WuiIP6FuepQ1uM+StLolWv2HYJTBfqF7guychHDIgI5q7XSiPos983o85b2zE6QSk7FnoekwgCb7VmgchgIrik/P1SK6AtsZrAeQEzdg4lX5BJKSop5OH7uJY33WdnkmHNWQckR0iy8DOzuHktuMWxLIqHyW5Wu2YZ17EydYpf//Xy964CAzgH4r7vOke16bvWQC/PE6GRUr/FpAN5C4wGjr7RfcTmppHt7DouP7sKgxvNYK4IG/Nom1xRoBPHcsAQ421ZSHqY+wZhNklTFrQn7cnWrgreMIWtUfD72LPPsa5f1ApCPjSUKP82KKljGfuUdAXrky1bstvXznf2TGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0K8/+9rZVNTMHffDfnR+ROle86KQABgu8jgvbIOBQM=;
 b=GerJJ4YKM2vrBmZAn9fLjItKWsGmmTnwLm4dTfyxRmxplkS/RtmTh/z4yuW4xkm7ZFRdTF5vxkRANdavAnolF/eannETIG2MZw2zlPWmVvciKtvpfgpS0aZn7jmAWU5IIgeL53g5Yv+CC9xJ2A0a4hP16vDNmNmSCm+92pXOSaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7620.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:40d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:15:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 16:15:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:15:55 +0100
Message-Id: <DJNDAQX71WG8.3UILF89WQD532@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Lyude Paul"
 <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Trevor Gross" <tmgross@umich.edu>, "Waiman Long"
 <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for
 raw_spinlock_t
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com>
In-Reply-To: <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com>
X-ClientProxiedBy: LO4P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c3c2e7-6cba-4b41-c501-08ded78c0817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|7416014|1800799024|376014|18002099003|22082099003|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	sbAQn27O15D7Kh71CoOhSn3It7ONazV/CsO796uea6YwROe3JzYexV6TE08q/qXUnHNjpQesw/7C6nL9siwhPlK3C0f1zS2OqAdHjlOqcV9+uIQYiQfavZVY7rnWbrdykiU8LdQ04Crho5F9c/35zq75QhdSHZi9XieBo324Pcsv4s4KRzay03q+YdFQYk/gqcjMamT2CapM0c863pBqcIdrwOhATziHSwT9ky3pi0Ad0BDNGymYDg68HyB6HtqV/u5Sc4sYVchFTTMVQUEeplK28MAOlVIKLetnM715w64QIhrn1eqNyCA/nkaQm4NqBk+rFSo95/U748Hc1/wR3eP37atIrKyfr9Kc3XNou9vUBpw1BjJVc8ZGaoFvGNbtgZPTaKYKnhRbTQ+Hg8riOdxiv1k3wHqHsxtnV6jFx7q6rAyyvitGrhMO69rTonWAd1BLxIGk+uKd7QSOyLPDTcSdooHaEwp+9J6WfTmTpJPiDetbBc8vi9qseTJFyOFN7UyqGW1IVPzZZ94xX1KubejOsn013SHGmf95qGnAf+qMkc497E4OcdvJzwtPEV7oHCqD2wDVUW024fjEg6bkksVV9I4yfWTPdgfDefO+yPSFZ0EpPpqW2mwormDDee4dBUvN2V2V95A78mFyvGSD6FuMLPaB9GV1Le6Viar5Tyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdvbDFpNmZNVTVzaWpWS1FIV0t3VWVzcXovMi93b2FtRlZXQ09tbDhoeHRH?=
 =?utf-8?B?bUtONERFY3RRT1N3WXdkaHhzVDNwS1FkRE13ZHloUm1QbG0zZmg2L1ltOFNC?=
 =?utf-8?B?OG5oeFhuNVRLNTNsL0UvSy8zV1BtMGNlMGJwckRsZVNOSGVSdmpMcDd2NmlU?=
 =?utf-8?B?ajkzSEhnMWxkZklEazVoRC9EN0swWGI4OXNoV2htRGoyY0o4WW9Ia1ZheE5P?=
 =?utf-8?B?UlFIYmh2RGxlZE1OK3F0WFhIeU5NOGVkTEd6SEpQM1pWNXBNRlN2QWMyQ0hu?=
 =?utf-8?B?a0dlZ0d5cll2TitON2dNdnFkcmRJYm5veVBMcmtrczkrckE3b0UrVkRLTElG?=
 =?utf-8?B?VmRRMkFhQ3hoUDBVN2hvaU0wMnFXK3NvZHg2OVFiYWV0cTNMVCtTS2xEdW9X?=
 =?utf-8?B?eEcwQUgzeHRraHk5QUdDaDhuS244REV5Q1d5ejdqY09rVTVZRmk5cnduRkhv?=
 =?utf-8?B?RE9lVUVZUDQvTWdZZjBNdTdiUEpWc1lIcU41N0tnQ1gwZlRvNHBqOGRUS0Rx?=
 =?utf-8?B?MkRGU0VwdWFwQ0p0ZDRmSlBuZDdiYmZLRGJSOXNKZUVpOFNjV0xHcEpaMGw4?=
 =?utf-8?B?Q2JNQ3Frc3B1MGxCck5FNEp0L3U1NCtTLzMwb3I0dThBQkx1TmhKdlE1OG5t?=
 =?utf-8?B?dUJyTjlLMzRjNTVaSFB4S1hDZGkvL0RXU0xlSHRwcUxvZjRpSkNpNXhmTlBH?=
 =?utf-8?B?SFpnZGVwcFlLWEkxN1NhSGpXc21DeGxEQ25MbnlucXRvOUx3RnJjQUtXTlMy?=
 =?utf-8?B?bjRZSUt1SXdGQlgxSFl1ck83SlE2ZEd5N2Q4RDNYY2RhTXlLVTdkek5zUjhH?=
 =?utf-8?B?a1pyY1dKVkszS2w1eVpoQTdWK1dhY3NsZFYxNEVBTWZOaEtRay83blYwRW5Z?=
 =?utf-8?B?WHZLV1NTOGF4dEt6TE5LeFc1OCtkMWJHcVorVjRFVUZKUStRK1lYNHBRV0Vp?=
 =?utf-8?B?V3B5aytCdW0vOVllNXkvV3VHWHk0TlQ2c0NBbHlCblVrZE9KU3lMWFNYQTNr?=
 =?utf-8?B?UVFRRkdENVhkOWdCbHJJZnM5dmhTdUtRTW93MG4zMzZYNzhlZmc4T2p5ZnJh?=
 =?utf-8?B?SExIbnYwUmNvV3Zldm5CZHRmdFA4cy9ybFRRT1ZhWVlxTVhvUkdCTHBMS3BI?=
 =?utf-8?B?UHFmNm5NSGpvLzArSTFPdXFycTgrOGpDSWwreFF5ZTRvUlA5NkRlR3o0WUFV?=
 =?utf-8?B?S1hRWjBOTE4rLys4R05xVUI0bTd5b3dRUjkyRnRQRTJ6OG9FOWZCMlYyMVdP?=
 =?utf-8?B?ektjUUU5Ynp4T2V2NGY1RXJ1eWNFT1VZMXJqOVltSDdTczJ1Ukl4blNZYzdU?=
 =?utf-8?B?ZGY3ZkxBc2g4KytmdGl3QlF5and5bkZ3eVY3clZsanRVYnVRbkx0bDdwcEJF?=
 =?utf-8?B?YU5mcFY1U0FLb3lkSUNPaFc2VnpMcjNQTEUwem1SUUx4ekFSbkVmTFlhUnBo?=
 =?utf-8?B?QSsrS08valk0VXFRdjNyN2tQVnhxNmZTbUZ3cWUyWXZVdmNFTitWdjJVRFFt?=
 =?utf-8?B?Uk9JR3c0TW1VdlVKbml2Mjg2cGVta0YxWWYzM2svYnE3bkZUcHdGU0Mya3Zh?=
 =?utf-8?B?cFl6aFlLTWJOTkR3cG92OFhBaFhJNDYrWmh5N3ZUVXFLQWRUekM3RkhvUWRS?=
 =?utf-8?B?c0VrNjgwSkxxNFN5N2wwQU1KTUNVdGlhT2orSFUvQitRVklNcE1FcDJSSjZ0?=
 =?utf-8?B?MzA3MzhXTGt6N3FQcjZQd1c4ZlJHanlIZ0cwd1FvOFZXcXl4Q0hGYUZtS0k1?=
 =?utf-8?B?Ly9reEkrRHQrSmNRa1JEQkFseG0zZFVBTFlHU1ZoZ2M4QUord3F6eDZVdzAr?=
 =?utf-8?B?N2wzNllKUGwvWjVTOEFBQlF6T3RDR1hoRmVPaURNSjZmNE13WERQY081bTVV?=
 =?utf-8?B?QmpCU2xtTnlKc2I3cDM4V3VYS1d0alpFdm9zTEVTQjdmbkRka1VzMXFTN2p4?=
 =?utf-8?B?RjBobGhSN25OZGxmUjVnQjJyQmh0d1JqQ0dFN2ZtR0FPaHlJNVVuem8va0ZI?=
 =?utf-8?B?ajA1OVFJeEN2emRmVXY1Zzc4NGVyVTdnOFlCWkZsenlVWGdDd3lhN3BiTHZU?=
 =?utf-8?B?ZkdDT1o3Y2NnUXhWZjdyQ2pTd2tzT21aOFhiL2t2RzNZTGtGQUZSbjJUdDdm?=
 =?utf-8?B?S05INFc5YmNiUW5pZWhGUStSQTBKUFFHYXZHNjJ3NStCQ1hUS1FGR016V0du?=
 =?utf-8?B?SVpBdVdjOXcwTnV2eGxtUEphQjU2WWVDRzFGQkZPSm81SlF3Snc5RCsxU0ht?=
 =?utf-8?B?ZjRNL28yeWJLLy91ZFgyMy8yVGQ2bTVSTUNjRTlaaDBTYzBHbHlqR3BQNmJt?=
 =?utf-8?B?aU1YSHZNRHRXSHVEOC8rUC9UaXp0NnJMZEQvOGVJakFSWm1PTGhrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c3c2e7-6cba-4b41-c501-08ded78c0817
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:15:56.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSwhNTGI166GNZ9zVU980cKgE3MI2pDQ0GcI6/J1sNot8cvthcuZfUsoI0IVimxljXGv/KioRYf3DmJORZ79sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7620

On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> The abstractions for pr_*_ratelimited! need to construct a global
> `struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thus,
> add a const constructor for the `raw_spinlock_t` type.
>
> The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
> because bindgen generates a 'static mut' instead of a constant from the
> pointer constant.,
>
> The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
> because it's a define for a struct without type annotations, so it's
> explicitly declared in Rust.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  include/linux/spinlock_types_raw.h |  4 ++++
>  rust/bindings/lib.rs               | 24 ++++++++++++++++++++++++
>  rust/kernel/sync/lock/spinlock.rs  | 29 +++++++++++++++++++++++++++++
>  rust/kernel/sync/lockdep.rs        | 22 ++++++++++++++++++++++
>  4 files changed, 79 insertions(+)
>
> diff --git a/include/linux/spinlock_types_raw.h b/include/linux/spinlock_=
types_raw.h
> index e5644ab2161f..942c229c90bb 100644
> --- a/include/linux/spinlock_types_raw.h
> +++ b/include/linux/spinlock_types_raw.h
> @@ -11,6 +11,10 @@
> =20
>  #include <linux/lockdep_types.h>
> =20
> +/*
> + * Keep in sync with rust/kernel/sync/lock/spinlock.rs
> + */
> +
>  context_lock_struct(raw_spinlock) {
>  	arch_spinlock_t raw_lock;
>  #ifdef CONFIG_DEBUG_SPINLOCK
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 854e7c471434..adde41e41edc 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -77,3 +77,27 @@ mod bindings_helper {
>          None
>      }
>  };
> +
> +// Explicitly list architectures where this logic is checked correct.
> +#[cfg(any(
> +    CONFIG_ARM,
> +    CONFIG_ARM64,
> +    CONFIG_LOONGARCH,
> +    CONFIG_PPC,
> +    CONFIG_RISCV,
> +    CONFIG_S390,
> +    CONFIG_X86,
> +))]
> +pub const __ARCH_SPIN_LOCK_UNLOCKED: arch_spinlock_t =3D {
> +    // SAFETY: The `arch_spinlock_t` type can be zeroed.
> +    #[allow(unused_mut)]
> +    let mut lock: arch_spinlock_t =3D unsafe { core::mem::zeroed() };
> +
> +    #[cfg(not(CONFIG_SMP))]
> +    #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +    {
> +        lock.slock =3D 1;
> +    }
> +
> +    lock
> +};
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/sp=
inlock.rs
> index ef76fa07ca3a..8babfb79098f 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -4,6 +4,8 @@
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
> =20
> +use kernel::prelude::*;
> +
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-c=
reated lock class.
>  ///
>  /// It uses the name if one is given, otherwise it generates one based o=
n the file name and line
> @@ -144,3 +146,30 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>          unsafe { bindings::spin_assert_is_held(ptr) }
>      }
>  }
> +
> +/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
> +///
> +/// For use in statics containing raw spinlocks.
> +pub const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::ra=
w_spinlock_t {

These functions (incl. raw_lockdep_map) should really be private functions.

Best,
Gary

> +    // Silence unused variable warnings.
> +    #[cfg(not(CONFIG_DEBUG_LOCK_ALLOC))]
> +    let _ =3D name;
> +
> +    bindings::raw_spinlock_t {
> +        raw_lock: bindings::__ARCH_SPIN_LOCK_UNLOCKED,
> +
> +        #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +        magic: bindings::SPINLOCK_MAGIC,
> +        #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +        owner_cpu: u32::MAX,
> +        #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +        owner: usize::MAX as *mut c_void,
> +
> +        #[cfg(CONFIG_DEBUG_LOCK_ALLOC)]
> +        dep_map: kernel::sync::lockdep::raw_lockdep_map(
> +            name,
> +            kernel::sync::lockdep::LD_WAIT_SPIN,
> +            kernel::sync::lockdep::LD_WAIT_INV,
> +        ),
> +    }
> +}
> diff --git a/rust/kernel/sync/lockdep.rs b/rust/kernel/sync/lockdep.rs
> index 784821cc2a39..c0f8b196c084 100644
> --- a/rust/kernel/sync/lockdep.rs
> +++ b/rust/kernel/sync/lockdep.rs
> @@ -137,3 +137,25 @@ macro_rules! optional_name {
>          $crate::c_str!($name)
>      };
>  }
> +
> +/// Not checked, catch all.
> +pub const LD_WAIT_INV: u8 =3D bindings::lockdep_wait_type_LD_WAIT_INV as=
 u8;
> +/// Spin loops, `raw_spinlock_t` etc
> +pub const LD_WAIT_SPIN: u8 =3D bindings::lockdep_wait_type_LD_WAIT_SPIN =
as u8;
> +
> +/// Helper for declaring a raw `struct lockdep_map` for locks in statics=
.
> +///
> +/// It's up to the caller to use the returned `struct lockdep_map` corre=
ctly.
> +#[cfg(CONFIG_LOCKDEP)]
> +pub const fn raw_lockdep_map(
> +    name: &'static CStr,
> +    wait_type_inner: u8,
> +    wait_type_outer: u8,
> +) -> bindings::lockdep_map {
> +    // SAFETY: All zeros is valid for this type.
> +    let mut map: bindings::lockdep_map =3D unsafe { core::mem::zeroed() =
};
> +    map.name =3D kernel::str::as_char_ptr_in_const_context(name);
> +    map.wait_type_inner =3D wait_type_inner;
> +    map.wait_type_outer =3D wait_type_outer;
> +    map
> +}



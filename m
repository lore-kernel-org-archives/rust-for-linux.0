Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020097.outbound.protection.outlook.com [52.101.195.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE33E7166;
	Tue, 29 Sep 2026 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699216; cv=fail; b=DsOi83ziJa/WEapOfr30gLA0NmlO+hqM/fkaYqNswbfPaZMWGTzX/wvfQ3Cox9DI4BfJTxvtW5vr+XWEQZeQwdqo4lkT87REPoWgCDzqY46Nq1GaC5peS6wT2y4ZIPBrQbywm2//N7s8u7XWHqKYfFDKzHV9Un8O9kgxjG1Brk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699216; c=relaxed/simple;
	bh=9/udrK+hqKakiq3E6sxCk4GHhPdcylUmn2qfAXNIog0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=W5Uc3XLLWDgPktWegA9wDrzFsv8ogDYUOypVCthCfewEuu7qhoIzM/aCm2ZpD+rq6hOK2Stbahnzwj94y5eMnBCYzKEObPulvkHVRyMKjJL8K408WlQyzlq5JnB608XTxV4AN3y33U/Pnhu+mIpOhf3edrAnmA8Awo3gWc3uZec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nAKRR3x5; arc=fail smtp.client-ip=52.101.195.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nAKRR3x5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEIUQmfYZCQF/sijjnqPMpJX1HpQL86g5BhHVuFYGxuj25VYWxTF2JKUN2adXjncQJY0xtZOAguhlmcYwa/LzLymjLmsrlxwq6yvFtrcV0JxJ4C0Q11zChIMEX4aazyHLVWmYvfIBxhw0CG9NLwsWN9UeqQLxbxEkKGH7/9qkey5vN2gIK67VstLrvNb8pztxUi5nRqofwAtlsfZpvD0cqto6o57hbBtoyds1V04OV0omBcToEpqv8pvfi0o5DBtBxWXu+fgbEigny6ilBtXwGWX7mfBGn5vmLAfVA5PF3Rb0SfO6da4i3a+0aojznXsGyCrGOuFBbW4wjf6iUX/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4f5F6RHKUGcpKj5NeE+H2FH9gYfVGoaM/TEfd4XEGc=;
 b=HzJb6/q4AxxBrs5FrhdwHWoqVwVRhao2Vzd93Y7+7cksfJLlrZ/9eUMk5JoQ/x1DCpE1H73Cy52lMQRmp6gQEcWPOwFFESPx3PzQIdO0Z8tBogDlHljx7x7hxu6Clt6u3bhQX3mQRzIEtX9pNENckAAL78rwnazTG0AY836AXAw7XN8GZffCi3jSi+Q1HQqDOBLB1GNYYPvmW4WatoATflzmk0yhQ+CiowXiQbRcNAmK7UYLGr0xxSLssBmAg9+VuPeiq5ugCvZLWwep4hFCjc+eFguELN26RRZcdwX8lIzjkwibBhAv3xQXfnZMO0six52cpgeONqgruySoLygx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4f5F6RHKUGcpKj5NeE+H2FH9gYfVGoaM/TEfd4XEGc=;
 b=nAKRR3x5S5V4+LGp8bXw/X1lM9AcO7T2U4StLUnKpP7C35+RhjJ4heHCg4JxR3me/1k6fJ5bI/vbvl6QKh5+PCnJmZ9X31x1bIwSX32WhpLF9wpbvjpOHrRVMiPk1ShnJ7YOKkSMtZicFWS7Tp1usUixowXwAglTCi3eU46M4o8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB7159.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:335::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:26:47 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 16:26:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 17:26:46 +0100
Message-Id: <DLRXW31Y0IVK.3A3NJVS2BG39M@garyguo.net>
Subject: Re: [PATCH v3] rust: sync: export lock::do_unlocked
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich"
 <dakr@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
In-Reply-To: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
X-ClientProxiedBy: LO4P123CA0646.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: ed410f31-bdc9-45d6-2797-08df1e467566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|10070799003|7416014|1800799024|921020|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	w6MIJdUNB44mWfAaABhFM4+Vq/ba6EH+qiflOo78hVLXk2Jh8J6e5XWL9/iniI1JcFsO0OaTKR/Ky/N5v8SYy0FrCEOHbwFXXe5tU1Z4+o8Wt3wLpU3zLrWyi8OOqP0yYQs3+hzgzw9TeKHL5jAXzw4XmyA1KrEcHaFSdaaP89VIapUuIu65D9hoICx6GLL/I+YoETiVkzo7VshGYv+9LLI18lRZ3QxMysl/fGTUsUwy7X9tqtcv2MPd8tupK/rPt9cr7Bk0lCQia9qv1H7yjjLttIp6Er4tojXcvdVttskAPM2l3byI3h54qroQ3PB2dMm3QiP/wMmDy8j9pQlLraXLsy2vAlx+QtfYTxOffzLkY+Em0FCzIpIrRz9qlJcbo5Lfz1X8NPEVpWqr0+y1IQ5kcyDf3A4ymeEUoW6bAYcbz4PavBReEnoupYKo+5e19FqoapavQ+Yr9C55RTxuUpCQx/b6qraR3dM5Xg9rDgqYQJV8finkToXFlfcSNurJ+ISD57Hb0U5w4HFim5DH6JU/CydUGt7Rmf8cZ2mroEkvtzou8FHPECcRKoX/SaPxXhKJ/FPL4G+jOLttEkEmpSi0vVMif5HvYaABMoOfbygurP/hXvqueYJaXzh+n+/vEZkKOdEINZG10na+CVzf0VqHj1xywoVDqLXcc471Pes=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(10070799003)(7416014)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZRWEYwUE1vdEtYNmRTeEdVMHBFblliS3BoSjJsQTQrWHRkK045a1hBT09T?=
 =?utf-8?B?SG1EZm9nTnUrRU1yR0NiL09PN0kxeDJIMDlSYWM4OERNNW9oT2ZwbTU2anJH?=
 =?utf-8?B?c1VlMGZ0U0k4Y2htVTYyd1JzOXJIR1dpOUlTMkJLb1dzZmxJRGRoT0FpKzl4?=
 =?utf-8?B?eWZCMkd3d3Y0emJyaWlCMEVhNDhiRC9RbllWMTVVQzNqUVJzNnRJWmtWeEhl?=
 =?utf-8?B?a1YrTXNrR3RmeVJ4NzU1K1Q2RUNaUHVwSWFtby9ORktkYXU3ODJ5SUxPTllz?=
 =?utf-8?B?RExSamZCbGJBYkt5dmp3N2Urd3lpYUtPSmlLVHdFYzJzNkNvR2VoV043QzNa?=
 =?utf-8?B?MVIzcTMwUFJMN2kvYXpDaVJNWVgzQnFOSVNsR0owLzNSZ2tyODFNRTBuWWFq?=
 =?utf-8?B?TE5uMzlxeWlVdzZRUFZVNWNOREszWHNNcndSUGZuRDl1THRzVHJ4NEYxQkhB?=
 =?utf-8?B?NHBrWGFNbldIVk9kQjd5L3VQRnp2MnYxaU1TZFl5YjNPMEpxWmdTWEtzeW4w?=
 =?utf-8?B?Y1N6UzA4ZC9LTkhYbzhtTHM4VXdpaTJscS8vc05LVStDN29pcCs1QlNkNkJy?=
 =?utf-8?B?MFNxbGgwK3FHRnppU01OaHZ1eTgyV1BnTEE3OG1wUGw3ZmlEbklBaVJUbFJK?=
 =?utf-8?B?TnVQR3hnTko4Vyt1UzI0TitBSHFtbEtVY2dOa1VvdmVNdTB5UUc2T1hkUGpH?=
 =?utf-8?B?NlNJSzFDNlN2blNYU0lnZXNiOXJPRVhvYzN3Q0E5RFlNSUNwdjQvbFV1T2hw?=
 =?utf-8?B?RFh4RlFtcmh4U2hyNWdFWnBsK0hBWWNqY3RrTUd6R0txTUtWdXA0RWlwNksz?=
 =?utf-8?B?V1hoYk5qdzFSQmtSRzRCclZHZEhQSzYvNEtKb2Z6aDE0a1ZZdnRqWjdsTWtu?=
 =?utf-8?B?T283clFLTXNNeTd6dDRTaEkzYkQyYk94VHcrbmZSclVaNFdOWnFKNEJ5VU9D?=
 =?utf-8?B?UnBJdjA1ZGp4amJROFA5U3R2WkZQV0pFZ0R0S0ljNjIvTWxYTnlZOTFiSEpm?=
 =?utf-8?B?cjFhYlhZR2Q5b0xFY0V3TzkrMEo5THlNdHJ1cjE4RDR4MWtSK3VzQytNaTdT?=
 =?utf-8?B?VGp5dTFhUm1XSGtqeDNneWpnSDN4L1BURVVPUXVteGpKNVp2eUpsWDBsS2Uz?=
 =?utf-8?B?TEJ1WElzV0hhajkzU00vMUp6NzZxOVlJM0dudHFGZ1ZCZHJCUnNodm1FaWlG?=
 =?utf-8?B?Tjgzby9qSGpSc3NXWG85RnVXbm5kL1l4VGh1RmRVcVFkZzhqMGJ4YThMVnFw?=
 =?utf-8?B?YzlYZUlMQ1pjaHMzN3B5RWJtYnVwMi9FVnJsOXV4WjZoWTAyVkpzYUlaa3Q5?=
 =?utf-8?B?RDh2MHc0eVJza2ppaGlpOWI0TlQ0ZWoydzlSNkRtQldzN3JhQytpWld3SXhB?=
 =?utf-8?B?Q1hOV3YxMEZvVGF0NXAwOVhhaGkwQWRKMVV5TUI1dXBqZitYdGIzRFJkU2tE?=
 =?utf-8?B?RHdwaWV4NFVCWnJxYlZsemVlQmYwbEM3YzBNLzNYbnNHQjA1dXoyZThOS3du?=
 =?utf-8?B?cEtmdXRBVXJFbW9IVWVvTHYrVVpKN1VZU0FLZXNKVWFTZ1hRRnpnNDh4b3Yr?=
 =?utf-8?B?VzY5eWtsN0l2WWxPZ2NzUFY3dHZpVDlBdHBSb3g4cnNRWGVpZVN2anI1b2Z5?=
 =?utf-8?B?SUoyWGZBeVJybGcrWDNKVXlJV1R1Smpxd2kwNGRaWW1iQVhOdnB2Nk1remV5?=
 =?utf-8?B?dWxBVFlreTlNWjVGMzhQd2habFk0TzRCajBMODcyODJCVi9qbk5hM1JobitS?=
 =?utf-8?B?Z2tRRmt2dkRVUGNBYmdRS0hlSDlFek1idnhNUWFTdVJOWWV3bFFjb3hqZnRo?=
 =?utf-8?B?OEFWcC9NdTRwaEM0QWNwMHFNbFkvazhmbTFFZm5vMUZza0t5VWlGa1AvMDVh?=
 =?utf-8?B?QThqY29uOWxNckJhTm5Cc2h2bFplWS9Fajd2SjNaYlk5WGhuaXZnOG41NTdq?=
 =?utf-8?B?NWV0UkptSlNBaDZXTVY2RWx5SUtqYVg0UFVQUnBiUjFHSTVGY09MempET2hD?=
 =?utf-8?B?b0pIdnlwcmx0Lys2UWpMM3haRjN5OTMxOXQwV3lveTQrdTMyRHpzTGpXU0Mz?=
 =?utf-8?B?YkFxNXNHY3cvaThkRGZuYkU0MlovSWs2YURYbHVHR3hPUGg3VEZ3cGwyU2Nr?=
 =?utf-8?B?djBMYXR5dWVqMHJIcFpURm1aQUFUN0VCTy9yV0tjYW9zelg2blNhandzK0Jx?=
 =?utf-8?B?L3ZjeUdyL0hlQUxNRmp5QWVFOGJ3MzA3T29UaXd3WC8zb091b2l2T0V4dmdu?=
 =?utf-8?B?bHdJTUkwTjJ5OHB4b1V3dmwwQmtXMHVTdmRkOGpqcG52N3ZnVFRja1dhOE44?=
 =?utf-8?B?S3ZoQkNmRkRsLzV3NFNpL3JkVFZlWUpSR1d6ZnRIZTQ5N0Z3UG5pdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ed410f31-bdc9-45d6-2797-08df1e467566
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:26:47.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spQn7DfHEK0RVvxOndoKUo7iHqdDJTEciOsZHr+UA8rPEJiv5GVAzqdQJ7ef6R1jo3pgufeyUFRl3aDDVwPifw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7159

On Tue Sep 29, 2026 at 3:45 PM BST, Andreas Hindborg wrote:
> Export lock::do_unlocked publicly. Add documentation for the method.
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes in v3:
> - Rebase on v7.3-rc5.
> - Do not import prelude in example (Alice).
> - Link to v2: https://msgid.link/20260605-export-do-unlocked-v2-1-e230013=
90231@kernel.org
>
> Changes in v2:
> - Drop spurious space before `guard.do_unlocked` in the doc example (Benn=
o).
> - Un-hide the imports in the doc example so the rendered docs no longer h=
ave a spurious blank line after them (Alice).
> - Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5cd220=
3b20f@kernel.org
> ---
>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024..edfff9e10199 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
>          self.lock
>      }
> =20
> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U=
 {
> +    /// Temporarily unlock the lock to execute the given closure.
> +    ///
> +    /// This method unlocks the lock before calling the closure `cb`, an=
d re-locks it afterwards.
> +    /// This is useful when you need to perform operations that are not =
allowed while holding
> +    /// certain locks, such as allocating memory (which is prohibited wh=
ile holding a spinlock).
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::new_spinlock;
> +    /// use pin_init::stack_pin_init;
> +    ///
> +    /// stack_pin_init!{
> +    ///     let lock =3D new_spinlock!(())
> +    /// }
> +    ///
> +    /// let mut guard =3D lock.lock();
> +    /// let mut buffer =3D KVec::new();
> +    /// // Temporarily unlock to allocate memory, which should not be do=
ne while holding a spinlock.
> +    /// guard.do_unlocked(|| {
> +    ///     buffer.push(5u32, GFP_KERNEL)
> +    /// })?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {

Do we want to keep the name `do_unlocked` now this is public?

I think we can drop "do_" and just call this `unlocked`, consistent with po=
pular
Rust ecosystem crates like parking_lot and spin.

Best,
Gary


>          // SAFETY: The caller owns the lock, so it is safe to unlock it.
>          unsafe { B::unlock(self.lock.state.get(), &self.state) };
> =20
>
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260215-export-do-unlocked-00a6ac9373d4
>
> Best regards,
> -- =20
> Andreas Hindborg <a.hindborg@kernel.org>



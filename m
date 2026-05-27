Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020125.outbound.protection.outlook.com [52.101.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AE43C051;
	Wed, 27 May 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902431; cv=fail; b=IWknSvN8EfmR9VS3Nbx+wEeFSObvXMoSCZTXY1er6R7j4FNwV8OqFHPeTglrQ8jSGL3aHNQ2m7sFmVAlUa4oVLwqTVoQE7mUyV1RnzwGKodlu9NOIVTT5iu81e4Ffy6tsevs1to5jrvDSyuXMPqx5lcOqKYejD39A3QE9XoIf/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902431; c=relaxed/simple;
	bh=MjQFSz2PbR0NaJrNhtBpGxFU5eqkE8VyzPV6FKi9OVQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Uc5G2kkuUbMUe1ADQSE/DYrIGoZGzxokyVo3xJCOHo5shdjmc3EkzcxfUVVP3YW2uh24GimI1Ka/GDvUpEbPhkyWzXroIBsag3EvfRkENkmPcKLeLXqUVOJpTCFW7luGifk2F0Ckd3xuMkmMe00XwJ9HR94WKykIOdnjO++VHe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=L0I3g73r; arc=fail smtp.client-ip=52.101.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="L0I3g73r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbiUs5GSB23ZmiMVCwRLXqTxbXW76CqF/mPCrj1TtGIC9ii58X4v297KUmxAmunI1dX2nGfRguNrOtxCC8FGTGbKXGttx8VDrxinPh/6zJNlMezE3jZIkkfTy1ZbaQ8+G9n5Lb2UwjXQE8WDQG8QFWacANxojaXORZwR7u5RfuVd2fEMG0hphvaj57WZiozF6ISJrfC3Zc32IzW0URKq8tI2ccvXWTNnrgo5gSKvjMlF8jidWJNkqWtfkBynGswYtCw5nUCIhSdhjVcAg1/4SDEnWP0SXC0zEvCOYAdU3M9L/6E0jXL3hsJbdkTD3n3lmH7AR0p86TUR2sJivKM16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/r/mvq9ctJ7Q6ic+5EHYlhMYTG1o58XZrE+OPv5GwI=;
 b=eqSF78yI8U/QkR0vwR1kpvkPc4jU/VU8nO+uuv8NBeeMeQ+8K9UnlTMQYmN/Jhwo/uDLEtP4A87K8NN6fF5YGsOaOBcUF+HATUdqfrG1I5wtSTLIcUfdaLHI4SgkXkHHpSFh4wCzjVjg77wqzpC4Gomj8/IJuUokc5Eq3RVQd7kn8SF8f8CTZFcCLHXE7RVYVhyLCh2GCIrocomOBvaO27KH1L8UUb9bYXC5W2GMBsI3T9EBwzGggDOhosTAjGdkbKNIC7k84GeHM5iAjUqPGPQhMdxo6AkhJV0ZV3bB5WfsAs7a1tWdRT8J3dKXue8lccawewsbT1vE7hHglPfApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/r/mvq9ctJ7Q6ic+5EHYlhMYTG1o58XZrE+OPv5GwI=;
 b=L0I3g73riIZDiHrgM2MJ08fzV3ZSBVTfdr7G57BwrsYYwSQxxAmVfhqPu1cai1MPM6iUMjFvfOot1iyG6+WYEB4oI/mwsQz7k3nXFsLt4AzAHyXOJwe4O6CMMiq2wS/2QvDjJbGymJkdL+8t+qn3cSVgTK8iMY647C0jAOGNAkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:07 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:07 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:57 +0100
Subject: [PATCH 6/8] rust: pin-init: remove `E` from `InitClosure`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-6-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=1840;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=MjQFSz2PbR0NaJrNhtBpGxFU5eqkE8VyzPV6FKi9OVQ=;
 b=4EVVAsm/h/CCdAs5HUtVXg0Mm2MZddEaqH08AD9sPHmOI5vUoS0jn+NKPpOY21aXb9vMW5kmY
 TixcM16c9xYAQVqb3FmzlXTnS4i+O34Ynx/7EcBp0rn/lQzKiOM/SAb
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 393e8e94-c669-4318-f120-08debc143315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PMm7R+8eHKGgU0EYuwXaqIG1SinXABrd//vnqQwhQQPBBaAgZV6GjybndNcXhVvQkeLPp7FUbqWPMUJRuvffClWS4a4/Lt1cf0XIz5I44wYKSMIh0JaGy8Pd5uja+0KoO0EHP1SlknIIU53h4gyOoIpJm6Wg5/DSaSXPCO35OEG/QR4r9Qiz6zzOKW99nhq5dDj9luxwH1yeTaniV8FqiNUJctRG7HgYQgJ5avOzRKPoyFl6BphQlhQHpDDEviUbQW1dXURK3/MjzYMNvzFwzo3DhvVT0TNtbtn29vV2rcAhKsmAjMlhoC/sMpgYSsg0R/relymSX8CUH+d1oXSOFfjFQZHAblckU/s0/KeHumXRUmWPuKfpqwzgDOzlj1X5lNIuCiT3AELodNCK+D03jBphYLpSCzVyUzh2Zrgi/fMNsSn4jKp9i7mfrLF4XH0zxjfkq0VSMs0e1ENT1wfqvn7mrRh15c2PWDRwHzFsn42phnHqqozQAVKeA2CYqzcttUglorfeZyOmxS/n9cv3GTWSlzUH8HkdRx2kh9RwzDP9ByiFkLTEvJ1qLaQDwnSJJf5wtTZNZ70nIVGHDYDWPacUh7CxH68MxMRK6KotbxNkHQbQKNm8EWItuwMQqigwInSm9LZ9+PepKqyW4QKIT0qNp8FFwKVo+MCs7vZOHL1GA+4xyitNvgEgpnni7The
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2IwR3Y3dG5WTWwrcWF6OU9IbHlmUGhjQ2c4OU5vY0tqYXdLZkc1Uko4akFl?=
 =?utf-8?B?VncyMmNBbEd1OFVBSnpUc0o4VGdnZHhZbEJtSzFLWHVBVnllWmRuTnREV21l?=
 =?utf-8?B?VEpLamNUS0lYRXUxUlE1WFVhM3V5Z1M4ZllKcFFqOWhXbmQwNE5yNWk2Nmd2?=
 =?utf-8?B?RGo3Nnc4RW9YamE3KzNYVHdzTExuUkJTWDhTSW1wSytJNFBnRDFDTjA2eUpv?=
 =?utf-8?B?MDgrNytlYWZocnowQWJGeWwvZFFMY3BSL2FyUEhFOHFEdnNYUzREUzlVUnBS?=
 =?utf-8?B?NW5CYnB2Y0tTRUpyand5TDVBZ3I4YzV0Y1NjLzZJdmZrZWI4SEJxWU8yS3py?=
 =?utf-8?B?eU5xMndDTFhOVTdTWGk1RTNtbWZWVWVhOWVLNUVGdXVMT296UTN1ZFZBMEF3?=
 =?utf-8?B?QnU0N3BQaXlncmlhMnE1M3hRaVIxZHdOdnFMNFo2Z1V5UWZ0b05oSTRNalgw?=
 =?utf-8?B?QUlPUGpDRGY5cGZVRm9QazVobldRVkYyMVhtRVRPTGViM3JTUEZ1YlZCeGZi?=
 =?utf-8?B?OTNDblNncTVEaGQ2b2ZuUE1vRzJjTUxTaXZYQUh1R2JYNk9DdE01bnhuZ0cr?=
 =?utf-8?B?aE1ncnN2NWR2WnA1NjEvV1pGQktQc2NydGdkVXIwZFl4NnRySy9OL0k2OTFk?=
 =?utf-8?B?eEl4OFIvaGd2UjVDbXE2NnFnUHUvZFdRcVBvbUgxWUJqNWY2bzNuRS9OQ1VW?=
 =?utf-8?B?dTQyanI3Vld1aEgyNDd6ai9CaTh1Z3JOS0taN21IMXVveFhCbWZOMXd5MTZF?=
 =?utf-8?B?SWZSeE1sRzBCeStUaExDT1BiT2xTcGR3cFJSRUZJbDhqUDRMOEVrRHpQWVFT?=
 =?utf-8?B?MkJ1dVJkUGlSUnIybFZHaEFzdVg5VzBIMUdhekh3NHZ0UC8zVUVrWlVGajR0?=
 =?utf-8?B?TUh3UjBpeTBiRFRsaEZoVjRuN0cxN0pXYWIvYkRTbFhTTTRkR291Qkc1a1dG?=
 =?utf-8?B?eHJRblg2amFmV3lLT2kwQmZocEhaWm5HMmxQSWwzblZNTWY2bzhjL25SMlZU?=
 =?utf-8?B?NDNwQnVOc1NzZ0tKVnp6a2FSK25mM2oxY2N5N3dGRXhXT3JUZFJUUVhZWFBQ?=
 =?utf-8?B?bzJId2hNYkRJM2NuMXhFSzFXOFNuM2psZlZ2UmZ0Y2RHNWVzUTh0eUEyd2ZH?=
 =?utf-8?B?TWZTdUQyS1JDbzVFb2FFdnFoaS9aMWU0VXVuSU83bFJ6M0MzWUxTYmswNHVu?=
 =?utf-8?B?YkdjWEtEU1hxOGhUKzk0dDFCMm9KK1o4Rm50ZlNmZ0VIMDNYYm1PY24wWVFM?=
 =?utf-8?B?M05NVEJHUy9ZZWxlL2NBTk1lYzdtaklDMUU3b2xoaUxXN2ZmY2hEQWc2dDlM?=
 =?utf-8?B?dVdIVU1HTkIvUzIyek9CWUNQS0RnOTdadlBOM3ZoK3IyVkE2SW5pSHVIUTdU?=
 =?utf-8?B?bGN0L1lLaFgwZ0F6elRkZDUxWU1aQjkwTnh4dHBKZ0MvUHR3Z2J0SVA2eHVO?=
 =?utf-8?B?U1kwa0I2Ukk3YzJQZTlaYXhzdmU0VThGR0dDVzN0TUZNdjVPNDVWV0VoYW5Q?=
 =?utf-8?B?SDdhT2drV1BRYkFhbUVTc0xOaEhxZjcxR0RoeHpyNWpoQ2RhajlsNVJ6Nnp6?=
 =?utf-8?B?cjl3RVN6RTJlZWhCWU1LbzF0T3NDcG5ON2xreERmTUtSQWpua2lDMjN5Q2ZB?=
 =?utf-8?B?d2R0L2d6M1V4WTA1dyt4dzBnWkN1dWJZeHA1ODV6cCtqKzc2NWh3KzdsWUFP?=
 =?utf-8?B?MjcrL09PSGZicEZ5aDlmMGxaTUtFYkk3V0ZqRTRIYkUvR3pGK3pYbENBVzhr?=
 =?utf-8?B?MnBpazN4alRZU2NaYWg4SEF1bUxEV21NQ0lEcnhKNzJuUW9HT3lqTDNkNEF0?=
 =?utf-8?B?eElSZm9UU3RpaUQ4Q0lHSEUzUFNCRGV2dVJpU1FBbmFFQ1dDeGgveXlSY0hl?=
 =?utf-8?B?WGRDOEVnb3ZiQ3hwTFdEL3MxZmQzVHVWam1KNHdhTW1DVEZONnFoMHY5cVcw?=
 =?utf-8?B?bzBTelcvSHg2OWxxeUNXeEtEZnhvQXUra3VGM1ZrdlFhbjI0bXJsSllxc2lE?=
 =?utf-8?B?UDdZeVlQc3dyTHNtZytPV21lZjdydXVVcXRzS2p5WDRZVVFqZUN5Z0FqR3oy?=
 =?utf-8?B?cFQ0Qnc2OFlrb3Ywb2N2ai9ZK3UrK0thZXV4YzZtK0VMNXNqQmlMV3FVSG9i?=
 =?utf-8?B?aGNLNzJETWhCdmlWSDczWFBNMURkanUwWlVOY2J4UDhBRTJXU0lJV3dZdHVn?=
 =?utf-8?B?czI4NUVTdk1xakFwWno3OUdpWVIzRExDREpUTitKZGNUT3VDUXBuZ3BxZ1gz?=
 =?utf-8?B?Zi95bWdKbThJdGU1QlkwblNUYlQwZU5QVnErZzZQWmpmTnJlZmtmVVozald5?=
 =?utf-8?B?NjdGbm9SRHdMY2xDVFR1WXJNRHNNZDlJaytURmpyV1VaUndkUTIzdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 393e8e94-c669-4318-f120-08debc143315
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:07.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzNBW9RozGzvuGEQ3I3+V1tFruKR0NLSxz8Vck7OYhDuVzLG8mw/h89LvsToTg9oYeJocuV4+Kh7g51hcwDZ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

Move `E` from type to trait impl block. This greatly shortens the
monomorphized type names. The `__pinned_init` function name is only
slightly shortened as it still encodes the `E` as part of `PinInit<T, E>`
in the symbol.

`T` cannot be moved to trait impl block otherwise it will start to conflict
with the `impl Init<T> for T` as Rust cannot deduce that there're no types
that fulfill `T: FnOnce(*mut T)`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 9732af32795c..fd40c8f244a1 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1096,11 +1096,11 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 ///
 /// It is unsafe to create this type, since the closure needs to fulfill the same safety
 /// requirement as the `__pinned_init`/`__init` functions.
-struct InitClosure<F, T: ?Sized, E>(F, __internal::PhantomInvariant<(E, T)>);
+struct InitClosure<F, T: ?Sized>(F, __internal::PhantomInvariant<T>);
 
 // SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
 // `__init` invariants.
-unsafe impl<T: ?Sized, F, E> Init<T, E> for InitClosure<F, T, E>
+unsafe impl<T: ?Sized, F, E> Init<T, E> for InitClosure<F, T>
 where
     F: FnOnce(*mut T) -> Result<(), E>,
 {
@@ -1112,7 +1112,7 @@ unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
 
 // SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
 // `__pinned_init` invariants.
-unsafe impl<T: ?Sized, F, E> PinInit<T, E> for InitClosure<F, T, E>
+unsafe impl<T: ?Sized, F, E> PinInit<T, E> for InitClosure<F, T>
 where
     F: FnOnce(*mut T) -> Result<(), E>,
 {

-- 
2.54.0


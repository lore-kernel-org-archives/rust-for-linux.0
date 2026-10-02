Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022101.outbound.protection.outlook.com [52.101.101.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2BA47F3C4
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935248; cv=fail; b=WBw3KtQi6hInkK7lOgL51uJ0HIjr+7heZvogCGv2nB5qpCacg+n4r//l3f60YZJ36niy06uU/i6dNQaMABqizpvC0DrgTIG/8YzyQNGYSRLlRH9W5j3STx1gsjFI27EFYPZyHxHi2Rxg1pRkByBc9lhEAoIuPy9Q96VwaZs7eR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935248; c=relaxed/simple;
	bh=OCvw/l/KdLdMb1JfkBdzbnymkBn7PVoSaZyK6B/BJFM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=a78KxnPwqbSx4D30j8J75uHf7pqt5RndndVaozKihERZ3mGRiX6AcIhLIpnMaae2KLHhoWsul2Hx5AmF2zIINdDq3VPaE7uPZDadH2kowt9GDV1Imrag77hZSzN8WMxe80pU78qfeuFDtsFAfOWze+3ihS1XUd/AB9Uaf/tczJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DQjS2Y3Z; arc=fail smtp.client-ip=52.101.101.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DQjS2Y3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xjx7OjZ5TOrcGco3k2VB1S64maZL50DG6HKeCuibUzd9RWDyC+hg8J1rrzMcXyhbwg6atw4AEucKXUsCcugEMLKoaS/rNawI+iANhlaKpfQbvQnH9OepBLI81mT1518gC1RMYA4UBdqdTU5cPdZb8/vKzljPO/VtJoqgenK4hn9KgkttoAWBtHYJnZWFBk7+AczFNCKy2uEwi06ckXSFXyfo6X0ubj2Gk/4m7oGmimibHKiMw/T2NFAYVviYw5uMDp+oDuCi8FilFe4chibmA9SBvxj/iWWRgS6w++BBDTZz2L/QkYRSk3lHZHORdKaaNtsLZvjcyV7rfMnZS4OS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vs3+8nWfXMVYgeUNt7GjT/BoH03SkfviJLlj98oR2UE=;
 b=mTdtFizKRylG7LB/FND99GnaubLW4yzZRUxuX8d9a7e5rcsu3FLS/MUZMMzgnPNyKIROgDn85sOkpPDJfAKb+PdPvaCZ9gjQ509f+OOkDPfUU+GUbkD+jilA2pNgE6kjTW4ICCgiTVdlYo6/WNh++Dox8ly9J+TnfZpJBtKadVgjdvJRjjwzWHORVw6+X2lioAIrDZ0tlqnmmBfvOyIpUa87nKvXalKcgh6yl5mLizKhjMLtmKe2hJX3lJgPR7txGi64tTMnquCSEcEg2B0BMMAgkJk6HH8U1ATt+fnERcRVvOV1Q+Fp1L6poRyxMfgUOPnW7A+b3AMs2TawvtL8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vs3+8nWfXMVYgeUNt7GjT/BoH03SkfviJLlj98oR2UE=;
 b=DQjS2Y3ZQsyLSOmIRGXiKkOPmNT+FQFhxZ7vPGpLLjAA9xczmp+TKxiGPGmhmulllvNPC4pdrx4Z+jeu9t8nsNsSeMZK4ubKchMSB7Kn6BzhhFHXKRIZlc8ElhRIlFFBkh7q4lSP/1XlzjvknIfcacNJpRIAB3B8w6Haj6243x4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB3249.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 10:00:41 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:00:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:00:40 +0100
Message-Id: <DLU9K3JPSWCD.36FZ6DPB6B3NQ@garyguo.net>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <markus.probst@posteo.de>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v8 4/4] rust: sync: condvar: use Delta<Jiffy> for
 timeout and result
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tj@kernel.org>,
 <tkjos@android.com>
X-Mailer: aerc 0.22.0
References: <20261002050428.2746277-1-tomo@flapping.org>
 <20261002050428.2746277-5-tomo@flapping.org>
In-Reply-To: <20261002050428.2746277-5-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB3249:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cba6f3d-30f2-4828-87d8-08df206c049c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|376014|7416014|18002099003|22082099003|921020|4143699003|10067099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	/9F7QlZI6U2NhauHMNG1J5eWo0tKlan6jmBMpY9GTvVU9dLgn2HJy82ibvdch1osXAhe9uSnbgGcvXbCvL6rXb1dK2g24IMF5C25O7pcf3Ks+jRabxAbpTCCII/lJZ9ZkCRnwJz6CTyWI3wWSND6IVoqgVq+nQhS9+VT07sYwMB0ONRhJPQngaiXs6yUVjKzrSKs9cmLRaXMb0HArvN1AqUe/kDnD49mWvPgyOEiqrnzgRo4otLhUaCaHxH8K76z6XOJ/aegCJyvdknHzDjeqG9g/Xi5MNRROkBpk5hf2I3Q6JOHvjet3qqCLhuJbHzFztekV2Gb6sxD5w3Om3+6Ed0eDnpNC7LHlLPSPUdGj1hqWBzztk3g3WymLAJD+U/vso2Z532ClGxEH05/LCOHEKqtcgE2BErS+NTIWWCGyYSn5w+BsTEPnp2gYG1Ss80joE4DUe3HreQtRWni7ZKIyfBIq/but+YsI40fiufsGQO4BvFoO5XW7TE7SsrPFJBaGwD/0b5XixmNNYiAhq3WqLLBPRhbMG+lixMMH+YjbXUL+e/eQ0sZLaOAdGSZbf0ZzpxOllP7FuO/tFWJAvZxlorAmqNJAfnMNW2OAihS7lFaH3/UCW0l28jqo/cq5au6AvSAQ9Ry5ijt9mjsld4qg8hf8WDriBpvqD5GRRv5AaUbj3JrYG36ebyexLAFrPkEkAJDsiGPRA7NA9krRadpPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(7416014)(18002099003)(22082099003)(921020)(4143699003)(10067099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS91VHlrWnlRWmJML3psaENvOHpLbFZ4NThYOUk5TXpEVWdYeWZYM3AydnNw?=
 =?utf-8?B?MzE5L0hzS0F3cmpMdWNMWXJzTldDSnJBUFZuT0tHM1Z6cVRhYTZYdVBVaDdP?=
 =?utf-8?B?MmlOeUdTL1FzUkIzMzBpeERURUFaWFYrMk5jTFFlSytOd1JaMW0wdHpCeWl0?=
 =?utf-8?B?bUV5UHgrVE02a25BNU1zNWJLNEZ6cFVibHJOWnVvdzFKUkFsUEdMSWtWRzJD?=
 =?utf-8?B?SVpYRVgrKzF1SzVrcU9LUExVdStIRjNINGg1ZWJKOTU4aHJIMXNnSVNVREJT?=
 =?utf-8?B?eDY1eVQ4MGthZWRBeTdrZmU4NStWR1Myc3E1cUphck51UEJPMG5SSkV2SFp4?=
 =?utf-8?B?aFJGeDVaQ1h2aExSVEY3QllnZHJtbVJIQWJIWTAxcWhPL29Tczh5bG9jOFhL?=
 =?utf-8?B?VDdqUnlsVVA3SHBIWStWRkl1QUlVdENEMWRzS2grY052V3BCcmJGcDZxeWhP?=
 =?utf-8?B?WDdVWFdFQlY1dE50Lzk0WC8zUHBVQ0paNC8reUY0UG9nSWMwODk3NTJXN1By?=
 =?utf-8?B?alAydmRWZXFnOVAvYXVlT0phUUh5cUozVTF3dXJMQUVBS051UnFjRit2SkNM?=
 =?utf-8?B?NW0yUC9wTjVuSHBkNE5yQ0hnU2grb29KeGtwVStFU3loMDN6QzR1L2Yxb2pB?=
 =?utf-8?B?aktra3Jpbkl6UFppWnRadW1LSkFaZllicFVCbitSb0pUOEtsTjUxWFNBYUJU?=
 =?utf-8?B?OTBQMnd5d1FkKytOWXdVQk8yTzVmNHVGVG1nTFVDMFlDZUFvUEZwZUx2M2Rw?=
 =?utf-8?B?WGh6MVp1eTRWQXp1TWorbXlyaXJCejFuYmh1TUp2czllMm1GWFlpQUFNdkRy?=
 =?utf-8?B?c1MrdlJyVG1wL2p3ZEp4RmxqcFdJNXBRQmdVNjRielA4YVlIWmdsYzU1SEFD?=
 =?utf-8?B?eENraDJaNFpOVUx2UDhKUWcvN1RFeGdqZW00ZHZMd2Z4RFRQRU5GUE00Z29C?=
 =?utf-8?B?bGM1ZWJ1K0NyYWdubEhOVDE4UWhDVWRXU3p4TmVjL1JBUzNhNnpTZnZOWWVm?=
 =?utf-8?B?RWlRWUZOR1FJMW5wVitwU21RcHJLNTZSM2lwR29QOTJRVWUzNXpEQWQzeWZG?=
 =?utf-8?B?MGtaY0pUR0E1V21ucGlJOVhiOU1SUWZIdGFUVVJpOVlEejdudUs0M1RheEp0?=
 =?utf-8?B?V1NmMkxUc1FhRTRKVEJqR2s4TTkwWkZ3bFFhczJ5R1RBNzg2M0dneE15ODFp?=
 =?utf-8?B?ZDdEd0pTcWZmTy9iR1BOQnJ5b3FNOHIwZU1IdmZUd0dYbmRkV05WeUhqcnNM?=
 =?utf-8?B?UkR2eEZPT3dRVVA1VHFNUkNhY24xQlhuMjdWT3Ewclh3VzRGS3FIbkRQMEhK?=
 =?utf-8?B?NmhhbkZHRi9VQ05rc1IwZ3V2ZjRwMy9RSVlCUlVaWm5OUm0xSSs4NFp6bms0?=
 =?utf-8?B?NzdTSUUxanA0TWk0dHhhVDV1Y2tYckZoM01aSG9QL0pOQjU0TktiWWlLTHJV?=
 =?utf-8?B?clJHa0FmaXhuYmlySUNjSHFoK0ozeUNvN0ppbGRnNi8vQ3RVejFqTjBTNjM3?=
 =?utf-8?B?aHJXRXROTDBPT2VpNzlURWtlamptV2c5elF5MGZ5Smh0MHRSWGZrQ1JNZ2pr?=
 =?utf-8?B?a1AzdmkrdS9tK2tFcFBzbS9MMWdpa3ZzZFMrYURsclgyQng1VDRkTlRRVWpy?=
 =?utf-8?B?c04ranJVYkhIU0RzOUdQeHorcE84RmFJZCtuYk1BUFNXdi9mV3M5MXExdUZN?=
 =?utf-8?B?YXh3ejh5aFVWeUlzdVlpVk5WNFo5eGFVU1U5T1U2Q2JLRlAvbU9kSWdmbWtC?=
 =?utf-8?B?azRlWDMxTDRxRGk0U3pHWE9tSkpEcVVlc3NKcndrNlkzL0hmc3ZJK2JBb3ln?=
 =?utf-8?B?SEo2UW1EUXY5VHlRcG8rTXRmWllZOURmZGpzT01xc2VGd1dwN01Wd1RUN2FY?=
 =?utf-8?B?MjB2WjdoZTlBanFEcDZaZ0tXcHgybm4rUDlMSGpvT2VKRldoaEozczJUYWVU?=
 =?utf-8?B?eXEwZmF5NkY4UmQycHVXZTBTV0JIQ09hNmN0VG5RMmdXK0Y5R2REWnJ1cURK?=
 =?utf-8?B?bWRUdCtCQmZrSTQ1UzhJQ2FQTUpmdURmYmVPN0hWK0ZsM3dVQW1kYUxyTkxL?=
 =?utf-8?B?dUNrVnFEK3o4TW0zTEp5QnlvUUZGNGpXS1d4T1J5bTlESk9PMzBERThEM2Vy?=
 =?utf-8?B?aHBHd0tkeE93RE12SnYrU3FteGtMdmNIV3NzcUo2MXZyak90SHlxeGZVWUxr?=
 =?utf-8?B?Y3I5WDVqdTRJMW9SMm9LOVhVRkNXMWZOdXlEWEg2WlhqMUQ5eEptNUdWR09S?=
 =?utf-8?B?bEJCdEYwM283cGw4UFhqQVFhRDc1WWJnUDJDL0IvV0YzSGYwQ0ZDanAzUlpr?=
 =?utf-8?B?QzBPLzVrQS9vOEZETlArK3RlRHJRUVdQRzNsTTJsdU83by9scXVaZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cba6f3d-30f2-4828-87d8-08df206c049c
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:00:41.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8EH20OKz7cgZbNs2UiHiyebZf2BsIItBmKHk0DYJDgaGeqRC/TwqDD/G5da/y0gdUolg4Q10+kGqc35uC459w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3249

On Fri Oct 2, 2026 at 6:04 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> wait_interruptible_timeout() takes the timeout as a raw Jiffies, and
> CondVarTimeoutResult reports the remaining time as a raw Jiffies. The
> type does not show the unit.
>
> Switch the parameter and the result fields to Delta<Jiffy>, in the
> same way as enqueue_delayed().
>
> Delta<Jiffy> is signed, but schedule_timeout() prints an error and a
> stack dump for a negative timeout. Clamp a negative timeout to zero, so
> it means an immediate timeout.
>
> Update the only user, binder. It now converts the freeze timeout with
> Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
> up, so a short timeout does not become zero. They differ only for a
> very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
> 2^31 ms (about 24.9 days) or more, but to_jiffies_timeout() converts
> such a value like any other value.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/android/binder/process.rs |  7 ++++---
>  rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
>  2 files changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index 5372bfbd93b3..2edd3dcd4edc 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -35,6 +35,7 @@
>          Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SetOnce, SpinLock=
, UniqueArc,
>      },
>      task::{Pid, Task},
> +    time::Delta,
>      uaccess::{UserSlice, UserSliceReader},
>      uapi,
>      workqueue::{self, Work},
> @@ -1549,8 +1550,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFree=
zeInfo) -> Result {
>          inner.is_frozen =3D IsFrozen::InProgress;
> =20
>          if info.timeout_ms > 0 {
> -            let mut jiffies =3D kernel::time::msecs_to_jiffies(info.time=
out_ms);
> -            while jiffies > 0 {
> +            let mut jiffies =3D Delta::from_millis(info.timeout_ms.into(=
)).to_jiffies_timeout();
> +            while jiffies.as_jiffies() > 0 {
>                  if inner.outstanding_txns =3D=3D 0 {
>                      break;
>                  }
> @@ -1567,7 +1568,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFree=
zeInfo) -> Result {
>                          jiffies =3D remaining;
>                      }
>                      CondVarTimeoutResult::Timeout =3D> {
> -                        jiffies =3D 0;
> +                        jiffies =3D Delta::ZERO;
>                      }
>                  }
>              }
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index 69d58dfbad7b..ae70e91eca94 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -12,7 +12,10 @@
>      task::{
>          MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_N=
ORMAL, TASK_UNINTERRUPTIBLE,
>      },
> -    time::Jiffies,
> +    time::{
> +        Delta,
> +        Jiffy, //
> +    },
>      types::Opaque,
>  };
>  use core::{marker::PhantomPinned, pin::Pin, ptr};
> @@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: B=
ackend>(
>      /// Atomically releases the given lock (whose ownership is proven by=
 the guard) and puts the
>      /// thread to sleep. It wakes up when notified by [`CondVar::notify_=
one`] or
>      /// [`CondVar::notify_all`], or when a timeout occurs, or when the t=
hread receives a signal.
> +    ///
> +    /// A negative timeout is treated as zero.
>      #[must_use =3D "wait_interruptible_timeout returns if a signal is pe=
nding, so the caller must check the return value"]
>      pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>          &self,
>          guard: &mut Guard<'_, T, B>,
> -        jiffies: Jiffies,
> +        delta: Delta<Jiffy>,
>      ) -> CondVarTimeoutResult {
> -        let jiffies =3D jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOU=
T);
> -        let res =3D self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffie=
s);
> +        let jiffies =3D delta.as_jiffies();
> +        let res =3D self.wait_internal(
> +            TASK_INTERRUPTIBLE,
> +            guard,
> +            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),

I suppose this can be `delta.as_jiffies_unsigned()` too, although the clamp
makes it more explicit?

Best,
Gary

> +        );
> =20
> -        match (res as Jiffies, crate::current!().signal_pending()) {
> -            (jiffies, true) =3D> CondVarTimeoutResult::Signal { jiffies =
},
> +        match (res, crate::current!().signal_pending()) {
> +            (jiffies, true) =3D> CondVarTimeoutResult::Signal {
> +                jiffies: Delta::from_jiffies(jiffies),
> +            },
>              (0, false) =3D> CondVarTimeoutResult::Timeout,
> -            (jiffies, false) =3D> CondVarTimeoutResult::Woken { jiffies =
},
> +            (jiffies, false) =3D> CondVarTimeoutResult::Woken {
> +                jiffies: Delta::from_jiffies(jiffies),
> +            },
>          }
>      }
> =20
> @@ -248,11 +261,11 @@ pub enum CondVarTimeoutResult {
>      /// Somebody woke us up.
>      Woken {
>          /// Remaining sleep duration.
> -        jiffies: Jiffies,
> +        jiffies: Delta<Jiffy>,
>      },
>      /// A signal occurred.
>      Signal {
>          /// Remaining sleep duration.
> -        jiffies: Jiffies,
> +        jiffies: Delta<Jiffy>,
>      },
>  }



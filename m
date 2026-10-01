Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021083.outbound.protection.outlook.com [52.101.100.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E826656D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 00:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815847; cv=fail; b=owcR4rZMLeQBmyhiTJMwkJYMN3xBFd8wymkLiB4AdPo3h/9EXfDSmhlIKhTsISlbe57rDrX6/6eDfxxaIfnlb0UCYX4jy5pXEtBwZaQGZMBd6z6cWSD6D15yLxZ23phz1T+wJx/b4thqCfq9JWSJ85M0hTxw6EMKRf83+Rhpp1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815847; c=relaxed/simple;
	bh=8OWYUi8YHan1TTh/8B6V1xqHtUn9AsEAkCiooJyG7gE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kB0ijPczmwvDQc7wKSvRGEOK3zdIo8DBApp0E4Utu7GtOfpmG3gEuO7tVK7xJAVputdmiJJgkIZ1ZI63DSigQxK/flKML8RzqV0qQvIa/775k2/HVvpgI8V3fZuwq+6ZQhZuOdTMnL8PiCJmMnjjBL0u6Qh15a+wedJ0d3VNnUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MpEHBkI9; arc=fail smtp.client-ip=52.101.100.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MpEHBkI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek3/5/6bXMFuKEc15Ol6rd0opc/QNsDuoxBOgVun42S874s7GiHMCGz+pzTrLwNXMp3/hlPnVDQ2H4l9L9G5y02LyRO1fx+PJANJ2b1FDdFOksl7fQtyWqyKcuk4snCjDNTaIfkJGnWNiWrzuCSlkcWKxTduKefISMdxwvLLD6NQJ+LdRlFV6ons5J3+4dH7PG7R5eGaqE7+tSG5kSLxdZRvfHPNzbzLa4oB7TQRYHDgxiPlt4OZ6tTsm9XrpbUcTJTq3PWLZ00MjgddF+jfhzAl+Grlz9PSsmibSCLFBc79ztLt1c3djNWz1Dc99R47RjHIKzIdWwgFSPVz823I4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNONbWq+d+eedAig2DWIr85EdshJD2Vw59OhpD+caPI=;
 b=XWGp+gM/n7NRreCZUT/rXymjW+HPOrKKiIJbAL2p+z4p9NiKOY5Hn6ncKYxZPe/lSOcXwfX5QtcVIFmbwfh6+tkq0fE4EoaCOyJ8N+wC3XVUVcT0e4FyBzUUCI0ljRdte8WWLwadB2Ou7TdzwaWLp+6corzvta3E0Wusn5ocYdH56DZ52Tj2Y+1vq5NVcf6tlZ+XjYnG0RYABsTh3CW71VG5W46sfyXn77iunP0aYPDWC+eiUKAs6cbctjckUQPt7ncwZ3bbrdoZJbJ1qvBjOefGeZbxF0lRRUREJVAg6X6FMkgJQrFgXoPRgXj6UY3rTNkNwwZTAHMTOEpH/6p0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNONbWq+d+eedAig2DWIr85EdshJD2Vw59OhpD+caPI=;
 b=MpEHBkI9EOQwQ2+cv5thtoIT5+8xY77MDEgLAv9O0UkSgRX0lnmjCt1Q8+iMDV+vp/ZENDdYSJ0KeLnTU4j5jKosNjOT5j1sJaQH1B7bCF13hRvKf5HkCGHmUpp+7X2QmwiqgFxAOnJGepyk8mW0Pec4MPd5TxW2pjW18a0MHXA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB9375.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:28c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Thu, 1 Oct
 2026 00:50:42 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Thu, 1 Oct 2026
 00:50:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 01:50:41 +0100
Message-Id: <DLT38GATZIIR.1LX8EXAFFGJX9@garyguo.net>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jiangshanlai@gmail.com>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tamird@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v7 2/2] rust: sync: condvar: use Delta<Jiffy> for
 timeout and result
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>,
 <tj@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260930014124.1454138-1-tomo@flapping.org>
 <20260930014124.1454138-3-tomo@flapping.org>
In-Reply-To: <20260930014124.1454138-3-tomo@flapping.org>
X-ClientProxiedBy: LO0P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: 337c3ae8-2a4d-48cb-7424-08df1f560502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|7416014|1800799024|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	0H+O389A4mwxgFtDxGUP5z5yzhYXbeVzXD20tbSKzt/X2Vx1bzZ/rpd2QKsL4yRm2poZwq65RJfMypXRsG38KDBeDBWiCbZwwdCk4hCE2ZPtGKJIO5wFe7qtoBYLGp+YLsCI0Iyw78UOwHiCkdhCuLsoZAkkAak4jQM2A2x8PEOwqPer5F3lBPT4C2Dculu0549/Panr0ZCLnact/FRg/G6rA6IMIbCtvuuBoKTBeVpY+CmHhKEpVtTJYqKJxyZ8YbGJSIMIybsbnLMg9iwzGEip1V05/6toUZJhfxZBrlK/FKW4YAxy6bryp/HnTL++4bt9JTlhYmUvuu514tw7wgDpKXXx/IoWvaF3Cyqt/zUmYUaonYhT87C3XrYZFOq7HWHzQvS5qEhNeCf6fX6KWvolXXAhQo33+OEU4yw/tXWfLizPGa2oP9b7xiZXVdrviOMZ6G0ldoY58m3qjbg7Bp7+s2lR8jD6ZgoxJJ/Cgh5UVOBuks0hpAbbNuTnd/6MIjZZ7Q/KYbcR3XJWjbq7nVmITQUIlO00kvggSwKoXosTIa6975Ctl87HI+VcPCwr+Y6iJm8UDBQn0FTWS8zW2n1Ugty6ZCf+o86OgPfiOinsW9zTdWr1NKDG2WuR4qI0ntRDow6WtxxLsHnRVvvi/PWRNWSYZtnFRw4Dcm/bCyMhvUt/u1Jmrj/RZx75cB3gz7IHGNnbSvQPS1nDaFBbjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(7416014)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjRiODFZUFNtQWoyaDVka0RQV3ZDWENPYytkQTZjMENOMy9tWEhMVWtJdjFG?=
 =?utf-8?B?NEx1cUk3VityK1NiaTkrR3dYM2NHcU11YzFVTCsraGpXNUJMY0dRUXBTV0Q1?=
 =?utf-8?B?ZEpNem1UVzFDRDdqVjZkNlJQSlJZNzRCcHNEWDZtWHc5dzFYenFtQW15ZUhw?=
 =?utf-8?B?TXBjMVR2bEozUE9xL0d6cThjbDc5alUvcHhPbGlBNWdmbkhOUHQ0bllNYVJs?=
 =?utf-8?B?VkVXelgvaHFhOSt6KzBkcVZqQXJOSllGUUhDZ1NpTFJqREFxaG5VWllNUERk?=
 =?utf-8?B?dzluKzN3Zmd0VDY0WFU3bDdHUDJEQk1zY2RmaU90dTRyOFlHSk9tcmFPTTJM?=
 =?utf-8?B?NXFlQ1VadGF1SkFqczJBTzNRc0lGUVRmS3hjZ3A2OWtRMERVblAwT2hrcUk2?=
 =?utf-8?B?a1EwVWc5My9heHJHNlhrcG01K09oRklvT1F5V2Y3dXFqWFI3TjA5elRxd3k1?=
 =?utf-8?B?YXBDbTdlV0RsQjdqb2t2YUU4THNRSXJXRnRpRXdtZUpGUXNIR1RxV0JVSVdz?=
 =?utf-8?B?UjNnR09xYTZGWUc4QzViendNMU43UnlNbGdObmlxUzJmWnc2ZHVPbEdMc25i?=
 =?utf-8?B?dytOdE5HRTJxdHF3Tzl3TUlySVpaMzMwbGFGS1NNeHpmUXkvbFozMTAyWnFN?=
 =?utf-8?B?L2xmb2Z0N2YxUC9TTWFrbTZMeERlU1lEajdNVDU5ak1aRlRrNi9NWFhhVmhI?=
 =?utf-8?B?Qkkyc3Z5TVZndms1elg2SU1uRUUxcjNLaUdidzhPVitMYlQ3TnlaN3N6QXNN?=
 =?utf-8?B?UGRRbHd0RzFHTzBTTWdiZ2hKZjQzTzlBZFI5bVZWU0pCd3NPcU9MbGxtcWZO?=
 =?utf-8?B?RkZiMEVuTEVBOW1MclZpcWtLNk5zM3FYK1ovNW5SNk5mdTN1SkM0dHhWSEZL?=
 =?utf-8?B?Q0RJTW52SkpJVE5KdnF6ZXJqV3RTdHROUmtRSE5oWHl5TlBnMFlRTFUxVFRq?=
 =?utf-8?B?SFVRcHlXS2VpTlIxVFdmSkFDaXpRM0VoV0VtOUlSMDZJejJ6WTdmOVhEU3B5?=
 =?utf-8?B?aDRvUVg0Q21Eb25mOEFtK1JUSTFiamtMcEZ4ZUNUU3FvU1Rjakh0dlJFWkk2?=
 =?utf-8?B?NENMK3V0OXRkUnFNamM3Vml6VUNROVl1S3RqU0dPWW14YzhqSzdoSzllNUd5?=
 =?utf-8?B?SkJSOUh1V2txWDdlWUp5clY2UVJGcURXRHoxTGExdEdGbTVWL3JOOVJleWxk?=
 =?utf-8?B?NlIwbGtIMjFyWEhEcGN1bzB1ajNIRk02cUxocUlkYW55UkkxNms5b1dPclZ5?=
 =?utf-8?B?R3FrSFhwK0tSV1N6djU3TVY1Zkw3K1NBbEJ2OVRtbWU1MlViT1haU3E4NkhJ?=
 =?utf-8?B?b2JqRzdZV05kSStLdlVnMXJhSHkrcy9QOUVoYnV1Qy9IZHY1b2ZGZHRLL2hz?=
 =?utf-8?B?NHV3QWxweEhkTFlONXV0cDROY04yMklXbWl5SEhSZytYU0MzUDdLck50MWNv?=
 =?utf-8?B?SHBzS2FHcTNHQ096RlZlZEV4Ni96d1hkanVWZk9sbUh2eVFSZVhOaUJFenUz?=
 =?utf-8?B?dWt0RmtPL3pqK0IvRzlVTmFTenF4dmdCUkpYdWU5K08xc0FaTXdzK0Vja3Iv?=
 =?utf-8?B?NEIyYzU5QzZTSFJDUFNUdllsalUvZUtnRk5qRTVFMVZNaG9ocGV1b2c4cU45?=
 =?utf-8?B?Y1RvNmZlUllaTTl2bmFucmpldU92S3oyMUdNQ1NscXlkT3phbzV0N1oySGI0?=
 =?utf-8?B?R3ZDUmNIYnBrbUZCeE02SUh5VTg5VGVNU1NFSXNsQzY1LzB4UFk4OXpmMHB5?=
 =?utf-8?B?bm5kT3poZERHYXJ0Y1ZiMEpxNkhMVmlwNGlaMHk1MVJFUldoSWVhTFZLZjhi?=
 =?utf-8?B?UmkrUldFOWN5eSthMkgrZVMzSmtxTUZLUk5CNktJVnNTVEYvb3JkMnN4QmNW?=
 =?utf-8?B?SDdabHBFT0pzY3pRdk05U0YxRldaSk9wOXQrNWZFY0pwU2NKdTFqVHFWM3kz?=
 =?utf-8?B?R3FsTVE1dDQxV0EyTmZySzJ4UHIxWG02TU9oR25USWxqOFFYeFo3ZENFL2Jq?=
 =?utf-8?B?MUwrUmtOZitjdjFvc3NOVmN6cUJuNHhJV29RWUJDaXNucVpzeFRWNGlhd3Rq?=
 =?utf-8?B?SHZYK0ZjeHBjT3pwTyt0SWVOcUdUbFJjYTlra0RwRGtkZmJoUXY3TUF3OHY4?=
 =?utf-8?B?dU5MMFMwSWg1elBVcEJNQUpma01qZ3NQb0xtSEpUb3FZWmNvYlZsTWVHd29h?=
 =?utf-8?B?UUhNaFNWOWZZSjJ6Uk5QMG54KzVoVkQwU2FSSFVxVWJNdlZldWo3WU5aQ2d6?=
 =?utf-8?B?U1VwQ3MyMThHWm50SlZwUno4d0xleHlDQXF4d2c2VzRzQ2M4ZFZxRU15ZDZG?=
 =?utf-8?B?SGlBRnlrdkZHWjJaQk40d1IvYXVCR2FwaWdxcFg3cThiNDRkYVg1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 337c3ae8-2a4d-48cb-7424-08df1f560502
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 00:50:42.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GF8pCwwqZkEEZM4w5R05xHrVIwtLwoyzKiEUJqzwgRDfRKDvWoht7pd53J8/RUzIeWeDZNjLfC1IbgIyAsxHFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9375

On Wed Sep 30, 2026 at 2:41 AM BST, FUJITA Tomonori wrote:
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
> index 5372bfbd93b3..ca944a50c6eb 100644
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
> +                        jiffies =3D Delta::from_jiffies(0);

Hmm, we should make `Delta::ZERO` work for jiffies too.

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

This pattern shows up many times..

Makes me wonder if we want a `Duration` type that is `Delta` but unsigned (=
value
range restricted between 0..isize::MAX (or i64::MAX for Nsec).

Or just have a `as_jiffies_unsigned()` which does the clamp.

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



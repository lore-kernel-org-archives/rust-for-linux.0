Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020100.outbound.protection.outlook.com [52.101.196.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446763AF66E
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784388016; cv=fail; b=vBRG2Y781YpudaRXDK5VEP1uEizaAuFxtIEAWAS7TazZJOcr/rsqAm7ufVa8iIYYeIAzE+cLx55/xH86Ne7lc9uTr+TLzfLNLdhR+GmvJ+3iED2n5MHf01ZIRuLxlI5ulhXZ6uPJPVV6q7Qs0W5K9y2hvRVoT3hALCfSbiGNDn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784388016; c=relaxed/simple;
	bh=xHnF8irPY8PCzJH9y92a8cDLMwdH3ChS0ZauxM01Hnk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=nLavV7fa3vt9SrqYFlTpewCIJWFiV+ikxwwX6f6mkp2quaHuB72oruiRAG8C7/DWgra31TVDrcrIzkN6OTf3XDkwG0dxjxsoIa7PvLFyn05GMO5KZ9GI8A6ZMKt4JVB8OqW7fzS0iQzUwhzUwcsMGLdfsTaxC07eJUVKep4LvQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qjeyHw6k; arc=fail smtp.client-ip=52.101.196.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qjeyHw6k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOKmRxjH2BJrVRhNxvvUrIRdBW1CXSQEdAhTqDf5FOw7DrJErzNCxPKUsUarHGYncs2tCG7ytw49hOgBr4LgnC80mFllA5u0SnLx4nQc0h/LRV0zgERSG3as8i1Gutane56cHqD1IlLcDnphSPZXq2/BI2XJmZDT/fVc7HvwonIZWk1/1tfWF5JlGB8ayxW0mbHphZujcO2Junqdckb9HoqvWgfchquEM2dDXACAEP7Sck6q8TK7k6lVASaoJb+1WqXnPVh09eEesUM3P6ERxie+F/XMWS9z6bDwzy0LWpj+xedyQfUwW1IUX747Xvk+2AtlqfrqERhR7XXwJc1bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/26xfbKbqtJs3hXJDb0cSs4c5O9813obaPEcwZWcKgE=;
 b=Gik0drYev+w12gl9iY+Pol3Ngb0Thrxtu/p0eT72D9Af7c7byGWwFt4f+vrQraW/6tgrw9b4o3KCilF0vrPlrYBXlNrKKpmu3qBOmuxBiF/lV71tiwTUAwq3xtxfd0k0Na2bj9Mbh9HPuzp2yFqsCZyblsObilZeKtxR/MtY3J0I4gxLPK3GH2roCMBOBdO6xdNLgX41LbqCwgGisnZRjbXt1y2eJclPlDgJH2jKnv33E0oPFdJo5mfvLQjIgzu2ezgsmsNCoTkkNCG0wlvgAj+ji+ze8B3P9N3bgYxgzHaq0pttchbR/4fI/brRjt20MgWkYVM3fNiT8bj5pOxDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/26xfbKbqtJs3hXJDb0cSs4c5O9813obaPEcwZWcKgE=;
 b=qjeyHw6kO1CWqoLvphVgslp5y9PrvqBIBMDy3HqzB10RjPuHrH95QrO6aBC0+Rab+DJlCrh9JH2gqTDzBai+u2WUZY1Lxu8RHMKE2ftzNLJdJ4AIQxau+2+Xst36/JOzUNqWDrgkBJgZC9Eyvc+a8rQ9QehiqyXgfvOh/RB0CuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3389.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 15:20:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 15:20:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 16:20:10 +0100
Message-Id: <DK1SRBA3315M.32N4T8QQBUOER@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for
 timeouts and delays
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260717042247.3634961-1-tomo@flapping.org>
 <20260717042247.3634961-3-tomo@flapping.org>
In-Reply-To: <20260717042247.3634961-3-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0418.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3389:EE_
X-MS-Office365-Filtering-Correlation-Id: fa179ece-2b73-4b3f-76a9-08dee4e00ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|23010399003|6133799003|4143699003|3023799007|56012099006|22082099003|18002099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	K0pMQ4A7QnFuEcjXyet1EOWfkrpYl47rlFY0Gb4n/7ZBkoshrAuP9LfPJUQ4uMycw6pNfQqu24fmqiLhFrIpPBo3N0J5GokF1V0DYpWnwNpjNj2MQIHGwZZdZLv0s7SNRKZFMitZbXsoS6LIIAZqX9HccVlW2qX+S4PtCI/Cz5cQtNeqlJd2vXDf8fcYTZC0Y/FI8YAc9ANzaZxVvXdzYbLXZQTWviOMtp8x0OPFcMydXx41L7iiflFZo7rLwf6ACnNVQ3QHwxqxJnHF+vXJaa6G3GNEKEeHc9eKov/h23RmgkgN4znIScTDBQzHJGqLHq6oB44xB/DxQ4cHiMX4IaaLPkk2AiWOtuxFakVH7R3OoboUujCwCKcjNisTgaIl95V06MFLhFaH7nIh0psIjdnewNI1g7KNDQFckGsImigoTxtGGTq/TL1EIiSWX6sSJS0vZub77Cs0UwhJFH1SXFhosEBubaZ0OMk5TzD/rTp9Y7n2scICjKtXANe7w4CZnJA4ZkmETkb78hikhzfOdy25NBFG/WIRvVOEENM0apcOebTIn3tvOyZn5iOy8TNLwVAKkeOnqZULcwlQnsXi41GFmVbRcYZvvXac59zAV5InYmDlMtIGZi+hCdXHHyVdVc69k2gMjoJgwQHjeD+lMCyFO8cagmH4rV3sk4c8AqHEZJj3BQ5lXkYWAr4ZDWATrGRVjPIx0OgPfcm5qH97IQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(4143699003)(3023799007)(56012099006)(22082099003)(18002099003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlltbzkybjdQUFZ5Zk02MVJSOEI0S1g1ZTJjOFdWSlpOWE1WcFljNjJ6aE1Y?=
 =?utf-8?B?eTBKa2I0NzNzYWZlbUcvQXdmYVdvMm90ejZtVWgrcTBnK1ZRK3V2dlZpRmhu?=
 =?utf-8?B?bGFqVk5ON0ZRTnM1Q3B1WWR3ZitqdUozMkVmUUdIVHpaU255aDAzbU1BRFBN?=
 =?utf-8?B?dWoyT3lwVkNndmEyRmtIbHFqSzh1ckloTnNPeEI4a05Cc3dkVUxHdklSM204?=
 =?utf-8?B?Rk9PUXkxVVo3clpES0xWWFFhdDR2K0xaNEhUWmN1ZUlxenF2a2hHN1pWaXNl?=
 =?utf-8?B?SG9SbjQweFgvUXFmUVFWb1hwcHV3WXZtZEpRYWM2UlZSWjJPWnE4V1N4bGxv?=
 =?utf-8?B?SnoxVlFiajJkd3RSSUM0Nys3djgxSXFCL25DOFJJTTIwZ2MxZ3lvbHBERWJ2?=
 =?utf-8?B?OXBtcmg4QUlwYk1RVi92L0lzWWhaenkxQ1VMbVpNc2VBcE9ZSmJ6SjUwTER6?=
 =?utf-8?B?S2NUUEpjN3JYMTR5cjFlUTlUOUdwNUhQekJiTkRHNTZQQWRLQk93TENseHpG?=
 =?utf-8?B?SzdzT1FTMDUwbzM4N2kwNXJsbk9jVVB3anpOVlNteHg1WDcxNzZ5V0xIWlNH?=
 =?utf-8?B?Nllld1Q3RjhCc0J4emdhYUN5VytGVlpHMzBiYzFLK1VMR0xRWUFGZjJUeHV2?=
 =?utf-8?B?dXFvY3R1ZlJPT3dFdzhGSVdiaFpiVjNaaEt3cXk5YzNPWnNwYlVwd2FRNVp1?=
 =?utf-8?B?aVdhVXQzR0ZuNnh3aDFXbGk1TTgrYmFsMHVKRi84Y0gyYktRZHFaOVFHcDd1?=
 =?utf-8?B?d0VIZE9FQ25KZTQ2K3Y4YkdiWGRJTUFQcHpKLzgwTHd1ZEYzM08wS1FHcUZ2?=
 =?utf-8?B?NU54UnpuMkdac0ZDbEtuV2NET3lnaFo2clJjaWpQOGlPa1dTeWhmK0NGdExw?=
 =?utf-8?B?U00zUzNybzZkY29OZzh6QnZEQU5mZ3BTQUxuUTNNNy90d3RVbXFnb1lYZVFx?=
 =?utf-8?B?VEs1RDFtZ2dTSzZod0s5WlozTzE5a2NSV3RsRDVPUWlzMTdKV0NkYUZZdmQv?=
 =?utf-8?B?U241VVFXbFd0UXI2YUNTT3Niak1sdk5VbnVENE81alVYRWMyUk1xWlNHb1hq?=
 =?utf-8?B?SjJUa1JSekwzRisyM1BtNmpqRXY0ZjhyTnZHS0p6clpXQm9UMDI3a1BnRDQ1?=
 =?utf-8?B?OE5FMDB3MXI4amdPckMyZk90UDEyZ0tvMUlFTE5STDNtMW5tMUR5bWZQUG9K?=
 =?utf-8?B?YkY2VEl2WjRuMFQ5MzBUcHFSYWdrL21HYml0UWpubWVjemE4Nlkvbzhwbmhm?=
 =?utf-8?B?ZUY1VXJzQWRXcDV6SFljbXRlSnhvcXQ0NUNSNFBUaHVVV2dUT1A3TlJIMjBr?=
 =?utf-8?B?WVl6Rk1sWVhycXJRMEk3akI2RXM4c2xQYWRSSnkxQ2VkeC9nSWRpTEtVLzRa?=
 =?utf-8?B?dUlJd29GWWlLVzVPOWlPb2NFWDdCR2dDQUZGeHpTa2VGR0M0MkZic2tldnRL?=
 =?utf-8?B?N21vOUJlSVcvRlRYQkZtaDg3T3BVSnVrcnllUVdVNldOWDVuRXM3Wlpka0xV?=
 =?utf-8?B?dUM3TWlWbWJ4Wmx2V0VESlZFdTkzdWVJM1VWcVY5aVk1K0QvZzhmYmgvOVNR?=
 =?utf-8?B?N2NibVZMcFVzRFN1eE5UVFlsMzNQRVlVdFREektqamFMcGZMK0Y3b0V2ZnhX?=
 =?utf-8?B?Mi9zbDVjSXFNaElDT2YwR1BUYmJ2ZjVWV0hEOSsyOUVneXR0RC9JZzlLQy9M?=
 =?utf-8?B?dUZkZ0RGdzBCWnI2SWp0MzcyMXhMR0R1dXJNcU1wbncxOFp3R0YzK2Q2K3Fh?=
 =?utf-8?B?aG5oZlZ2UWp2dVNlUGpzTkEzVk8xM1lCb29LcGhNWG5IRW1sNmllZDRxVE9P?=
 =?utf-8?B?a0t3aDlRR2pBZFo2azB5eUVpYmx6QjhDU0lZOW1BbERYUi8vUXNsdUVZdmkw?=
 =?utf-8?B?OFFncGNOd0hYVUYvY0lZUnErMnRJWUJGUzE4Z2NEVVFlbzRtbFU5ZVhTU216?=
 =?utf-8?B?Q0lrUTJpaUlvRkQ2ODdPMXV5NW5hTmFMTDBWUDhXOFBXYmM4emtONUhZZStm?=
 =?utf-8?B?d1IvVTdiWm91SGVzV2VDcy95S2lnVTlISmszS01wV2piTERtMFdXcG5PL3E2?=
 =?utf-8?B?MjlBR01OVHg2WklUOURYVjd3VGZRbGtUZEU5VHVqbFovcWpSZUZSaEl2ZXJE?=
 =?utf-8?B?WnhKZmVoRUFJc2hoYVNOUFV2Ui9EQmlaYWtucFJZZzF0YW1tYzhlelVFZnF1?=
 =?utf-8?B?c2ZJR215RzFkaEh6NXlDVm5ueGNVQ2JSTlcxeWh4blV4N282aUNqbXIyWWhH?=
 =?utf-8?B?dHdMMFFZVm4xU2JnTUpvN1ppaW5ObHRtL3dXWmI2d2YycVBvVWZjSlVIS2Z5?=
 =?utf-8?B?SGtBZU9RUCtHbVZ4V0s4S1A3ZElZOHpUS2tpR01CNUJla3dDdGY3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fa179ece-2b73-4b3f-76a9-08dee4e00ee5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 15:20:10.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMkXMzTMKjQbypVu5IXDHrDbmuiTrkzbAV3Ll6ovn2R3Tk+ojDynnD/aakTfkWiujIXo2ij+Zn533AWID0o5/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3389

On Fri Jul 17, 2026 at 5:22 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Turn Jiffies into a distinct newtype and let these APIs take
> impl Into<Jiffies>. A caller can now pass a Delta, the duration type
> already used elsewhere, so the unit is part of the type rather than a
> caller convention. A caller that already holds a jiffies count can
> still pass Jiffies directly, avoiding a lossy jiffies -> Delta ->
> jiffies round trip.
>
> Update CondVar::wait_interruptible_timeout() and
> Queue::enqueue_delayed(), which took a raw jiffies count through a
> bare c_ulong alias with no type safety. Callers had to know on their
> own that the value meant jiffies and convert to and from it
> themselves, which is easy to get wrong.
>
> Once callers express timeouts and delays as Delta, msecs_to_jiffies()
> and the Msecs alias have no remaining users, so remove them.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/android/binder/process.rs |  7 +++---
>  rust/kernel/sync/condvar.rs       | 21 +++++++++++-----
>  rust/kernel/time.rs               | 41 ++++++++++++++++++++++++-------
>  rust/kernel/workqueue.rs          | 11 ++++++---
>  4 files changed, 59 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index cdd1a9079726..5230ea492a75 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1482,8 +1482,9 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFree=
zeInfo) -> Result {
>          inner.is_frozen =3D IsFrozen::InProgress;
> =20
>          if info.timeout_ms > 0 {
> -            let mut jiffies =3D kernel::time::msecs_to_jiffies(info.time=
out_ms);
> -            while jiffies > 0 {
> +            let mut jiffies: kernel::time::Jiffies =3D
> +                kernel::time::Delta::from_millis(info.timeout_ms.into())=
.into();
> +            while !jiffies.is_zero() {
>                  if inner.outstanding_txns =3D=3D 0 {
>                      break;
>                  }
> @@ -1500,7 +1501,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFree=
zeInfo) -> Result {
>                          jiffies =3D remaining;
>                      }
>                      CondVarTimeoutResult::Timeout =3D> {
> -                        jiffies =3D 0;
> +                        jiffies =3D kernel::time::Jiffies::ZERO;
>                      }
>                  }
>              }
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index 69d58dfbad7b..e215f83825e4 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -7,7 +7,7 @@
> =20
>  use super::{lock::Backend, lock::Guard, LockClassKey};
>  use crate::{
> -    ffi::{c_int, c_long},
> +    ffi::{c_int, c_long, c_ulong},
>      str::{CStr, CStrExt as _},
>      task::{
>          MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_N=
ORMAL, TASK_UNINTERRUPTIBLE,
> @@ -186,15 +186,24 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: B=
ackend>(
>      pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>          &self,
>          guard: &mut Guard<'_, T, B>,
> -        jiffies: Jiffies,
> +        duration: impl Into<Jiffies>,
>      ) -> CondVarTimeoutResult {
> -        let jiffies =3D jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOU=
T);
> +        let raw_jiffies: c_ulong =3D duration.into().as_raw();
> +        let jiffies =3D c_long::try_from(raw_jiffies).unwrap_or(MAX_SCHE=
DULE_TIMEOUT);

This is existing problem, but this code pretty much assumes that
`MAX_SCHEDULE_TIMEOUT =3D=3D c_long::MAX`, which is true but would be bad c=
ode. So I
would expect this to be just a compare, or would eventually become
`saturating_cast_signed` (once it's stable) which explicitly relies on that
assumption.

>          let res =3D self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffie=
s);
> =20
> -        match (res as Jiffies, crate::current!().signal_pending()) {
> -            (jiffies, true) =3D> CondVarTimeoutResult::Signal { jiffies =
},
> +        match (res, crate::current!().signal_pending()) {
> +            (jiffies, true) =3D> CondVarTimeoutResult::Signal {
> +                // CAST: `wait_internal()` never returns negative,
> +                // so it is safe to cast `jiffies` to `c_ulong`.
> +                jiffies: Jiffies::new(jiffies as c_ulong),
> +            },
>              (0, false) =3D> CondVarTimeoutResult::Timeout,
> -            (jiffies, false) =3D> CondVarTimeoutResult::Woken { jiffies =
},
> +            (jiffies, false) =3D> CondVarTimeoutResult::Woken {
> +                // CAST: `wait_internal()` never returns negative,
> +                // so it is safe to cast `jiffies` to `c_ulong`.
> +                jiffies: Jiffies::new(jiffies as c_ulong),
> +            },
>          }
>      }
> =20
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 23ef5c77383f..206296b6b6ea 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -40,17 +40,40 @@
>  pub const NSEC_PER_SEC: i64 =3D bindings::NSEC_PER_SEC as i64;
> =20
>  /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
> -pub type Jiffies =3D crate::ffi::c_ulong;
> +#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
> +pub struct Jiffies(crate::ffi::c_ulong);

Hmm, I feel that we are again making the same mistake that we had for `ktim=
e_t`
abstraction, namely that we use the same type for instant and delta, albeit=
 this
time the measure unit is jiffies and not nanoseconds. The reason that signe=
d and
unsigned casts is needed in the above code basically is this.

Arguably, your earlier version don't have this issue, but then we are
introducing costly divisions implicitly in many places which is bad for
different reason.

I wonder if we should have time types being generic over units. So you can =
have
`Delta<Nsec>` and `Delta<Jiffy>` and `Instant<Nsec>`, `Instant<Jiffy>`, wit=
h the
generic default being set to `Nsec`.

    Delta::new(42) // Delta<Nsec>
    Delta::new_jiffies(42) // Delta<Jiffy>

Thoughts?

Best,
Gary

> =20
> -/// The millisecond time unit.
> -pub type Msecs =3D crate::ffi::c_uint;
> +impl Jiffies {
> +    /// A jiffies value of zero.
> +    pub const ZERO: Self =3D Self(0);
> =20
> -/// Converts milliseconds to jiffies.
> -#[inline]
> -pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
> -    // SAFETY: The `__msecs_to_jiffies` function is always safe to call =
no
> -    // matter what the argument is.
> -    unsafe { bindings::__msecs_to_jiffies(msecs) }
> +    /// Create a new [`Jiffies`] from the C side's `jiffies` value.
> +    #[inline]
> +    pub const fn new(jiffies: crate::ffi::c_ulong) -> Self {

Given that this is a public API not just for binding code, I think it's bet=
ter
to use `usize`.

> +        Self(jiffies)
> +    }
> +

This function can be `pub`.

> +    #[inline]
> +    pub(crate) const fn as_raw(self) -> crate::ffi::c_ulong {
> +        self.0
> +    }
> +
> +    /// Return `true` if the [`Jiffies`] has a value of zero.
> +    #[inline]
> +    pub fn is_zero(self) -> bool {
> +        self.0 =3D=3D 0
> +    }
> +}
> +
> +impl From<Delta> for Jiffies {
> +    #[inline]
> +    fn from(delta: Delta) -> Self {
> +        let millis =3D u32::try_from(delta.as_millis_ceil().max(0)).unwr=
ap_or(u32::MAX);
> +        // SAFETY: The `__msecs_to_jiffies` function is always safe to c=
all no
> +        // matter what the argument is.
> +        let jiffies =3D unsafe { bindings::__msecs_to_jiffies(millis) };
> +        Self(jiffies)
> +    }
>  }
> =20
>  /// Trait for clock sources.
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..41fa1a9eb9d7 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -136,6 +136,7 @@
>  //! ```
>  //! use kernel::sync::Arc;
>  //! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_wor=
k, DelayedWork, WorkItem};
> +//! use kernel::time::Jiffies;
>  //!
>  //! #[pin_data]
>  //! struct MyStruct {
> @@ -171,7 +172,7 @@
>  //! /// This method will enqueue the struct for execution on the system =
workqueue, where its value
>  //! /// will be printed 12 jiffies later.
>  //! fn print_later(val: Arc<MyStruct>) {
> -//!     let _ =3D workqueue::system().enqueue_delayed(val, 12);
> +//!     let _ =3D workqueue::system().enqueue_delayed(val, Jiffies::new(=
12));
>  //! }
>  //!
>  //! /// It is also possible to use the ordinary `enqueue` method togethe=
r with `DelayedWork`. This
> @@ -303,7 +304,11 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::=
EnqueueOutput
>      /// This may fail if the work item is already enqueued in a workqueu=
e.
>      ///
>      /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> -    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies=
) -> W::EnqueueOutput
> +    pub fn enqueue_delayed<W, const ID: u64>(
> +        &self,
> +        w: W,
> +        delay: impl Into<Jiffies>,
> +    ) -> W::EnqueueOutput
>      where
>          W: RawDelayedWorkItem<ID> + Send + 'static,
>      {
> @@ -328,7 +333,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W,=
 delay: Jiffies) -> W::Enqu
>                      bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_=
int,
>                      queue_ptr,
>                      container_of!(work_ptr, bindings::delayed_work, work=
),
> -                    delay,
> +                    delay.into().as_raw(),
>                  )
>              })
>          }



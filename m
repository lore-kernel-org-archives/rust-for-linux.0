Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022097.outbound.protection.outlook.com [52.101.101.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC7376BFD
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106165; cv=fail; b=qc9CssmiCFgJWXQ3p/dIGwxOPTC1j5MAvU7leyTYB7CrRdh/PBE4l94mC+Ay+/XaQd+PAE6GVryn18s+cjTcFJE98W2xBanaIgHM2COYsU5rtJ/bCHmwHk9POilbnzvWHVYFLaauEsjfsrmOF4zEKTQPyTCi6blDSKUYXNv9Nlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106165; c=relaxed/simple;
	bh=eXHXe28Po3a+9exFuq/8YLJSDcsD2qChQxv8RBFvqw0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=g2fbD0SAWlu2wJGkWDDDOMoowVC3/DYL5Lgf8PiO4M+uLTOKwwJk+8jbtp4H9DTUpkPSXHg/irj+v+MJdBo6ro4SkgMJoagvr4xVSQzPE81LSMjd8lc0+fRcN/ErlsBVuVrV8oND3kEjcoipgihtLoSjRf2W1ZZbbUoIbx9qj5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=aMXKZBUL; arc=fail smtp.client-ip=52.101.101.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="aMXKZBUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss+oV+C8J24sv+dMo5WGaWpONKWaqesTZ127epJpw56b5kDT4AZlW1xi2WP2yInMpsd8xs6ke8GyPi2gAZL1+Ci8rjSzPIGxfv5y6xdTelp9gH7/83mhfZ4ZfvfhT980q27D2lvY7Xg1OrJkTFFd0JhTKzCqDQBavKyJ6PvIRCe0RmEjhrt0F9hBrO8BsW31QXRHgExAAixhpoc6AUGEIaAK3MwAadXnMMf/3GTVGzap3j86mNFnKFYDjGkbgXFECkmrycZS3pi+vbI2WEeBklpJ6fQfZU2O1FleDuPbK0K1cL57xVEnIwt2v3JwVY26Zw/3mVwwK6v5fYdK7OEliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLF+2MA49VpgMFef9L9V2O7ftyCD1ddkBEXv8AANjo8=;
 b=fn8qRXpNjaI3nYcrP6PdIM6r7mxLM33+b8G4U44Dry2HnJZMaenCVTCrCUhJZhut0xjp+ishQjrson4lqJK/ltsoSbmtmYzSZIgPX3xoPa/qHnsP7XFt55GVGTy5K2ktJY8FnB+hoJ6GmfPV/cpFCooGhin7LPUr/O7Qfeu6+jp0AX4tYnDTBI48THA6otDMpa/N45c1t0vJUuR/pn8+7A400Ohoo1eZZ4nq9xJCnzcvSdmr48TSEBQYPWRWS8MpU9Hk4YHCnI2rvzBXCfWBrtY/zzI1Thvu+l+t5sb8irVz+r4c1cl3tpxKM66u2U5KtYljb24HZcYzVtsAjm3ldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLF+2MA49VpgMFef9L9V2O7ftyCD1ddkBEXv8AANjo8=;
 b=aMXKZBULlMtRd+3Tpy7R/xA2breSuCGVcOcfVpC9quHnKnLZMRghn+m+yUB/H1GQ4J4Yoaj/gf3YZ/AEDKx134dCp9yu947cip0+R7LHEId3way8xmDyMlWxIcWtb69PwAUbIP4OuYjfRIxiAU3bgGPzLdwV4ZLXxv1Ky2NMiRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8833.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 11:42:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 11:42:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 11:42:39 +0000
Message-Id: <DGOV7EXV8VO9.QR9UN9EV6DZK@garyguo.net>
Cc: <dirk.behme@de.bosch.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <frederic@kernel.org>, <gary@garyguo.net>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tglx@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260224132507.315637-1-tomo@aliasing.net>
In-Reply-To: <20260224132507.315637-1-tomo@aliasing.net>
X-ClientProxiedBy: LO4P123CA0557.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 455a0ae6-888c-4da7-7044-08de752c2577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	6jvRMANJNonop3K8vDoVhevxwwxZI+T6EqNf4qP1lKBkoS2kypGShOkXfu0KpdTY7EtdGC7vUAUN7MI1yr0q5aN1R4kHPXcpFy1luJhTkJCh9rEJJ2OC8Wfxe+LmwFduhsMctnYUQixMogN6dbR3cBGD+qYW8x5uL7suJuJ1/y7AqizdYbXa08eN84InI4SFQKwW9tYZMzdtccCq+wfv7HZNZxS0u3WPi7LQYW/xH5BzTimbk6CbHl5TWf2k5K1N+M/NmedMumx60BgAVvRtav2PTfh3XO3Vte9cH+SOZCwHEnKeUNw4+tpnzrYEBwAOvNmR3ZIVNmTODUSwKFVar5nll1H/JrrwBfKLQRqHVayg0AsYCTuC0BO3+uKwNyxEnK9JvwYMTVulun++Z0119H4uDDPxfB2PY40Fw1EKABrAvQUIRD9F9ESXC5AZenlOE0eAIMYmfaXPhk4voDvi95jCIAtKWtEpw0ZZR3JzVyzyLL8p8eWKgbAnn6f54GyiQVACNhrIEEwbKhRj8kCN8DXrC8Co2d0rjr2362xHzFXiN5xQkXPVUTIUNUqMed5apbEmL1zPhWJmN1Nc5nmyK8qS8jzNztNA+oxJkaW4/Xw5pLrDws8VpqsqU2yskDOwx9jFESf0QBdISQ2ecbBXVRJ08CMDXUzJ8Jw68H/mE0Lu07ckKmYKrwEHkOYCXMWWHHSQlUTICiSolLpyBoQsqYv6y7mqAbRxrvObjAPJ1vk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0ZJZUg5OG1MOVg4WnFMZmgwM2xhcVBTVFdqZExacHZCWW1YZWdOSko1MzlS?=
 =?utf-8?B?aXBxTnA4UG5jRVZoUUVSOGZSWEZNdWU0c01SMDh2TENxWmRCY2JSSXVpOGQ1?=
 =?utf-8?B?Nis4NG9raHc1RmVFNlMyV0lWaEJZcFU1RFZCR2FOcTdFa1o5T3NOVmJEWnhR?=
 =?utf-8?B?djlFNmxMbncvNGVCQmhkT0dwTHl2anc1cDRzazU5Q2MxOXNlRUM4QlU0VlN2?=
 =?utf-8?B?dU82Ui96OGxaZGpGTjNobllGSnJVMzZqb0g5ZCtwN1pGUThXTHFMS05RRklo?=
 =?utf-8?B?L2xVbDJDTTZOV0pxSG5EM2JXT0hkbEtZSjJEZDFkVUhBbU5rVnk1eGtreThw?=
 =?utf-8?B?WGJyZFBmalRPZGV2NFBMQVhaTjJ4VEQwTnVTYUtDaC9mSnppaWYyK1l3YnhL?=
 =?utf-8?B?K002ZDdBZG52MUZxU29oSVA4Y1hLMFBockF3YVVqUzgvSk9zTms3YlVlWnFQ?=
 =?utf-8?B?VmRzQWh0dTJIRzB3YjBxZnVHS3NYOGRvRXRZV0g3a0JvNGU0Zlh2bjFCTW8x?=
 =?utf-8?B?Zk4vR3pyWFhaS2gyc04vOHlIZmd3eEhRWHRsa3FFSnpWdTlKK2JKL25pZ1lM?=
 =?utf-8?B?ZHR1S3VZZHZEcFhPczk2a2tvME9YcyswKys0Ty9KbCtZQTlDL1VhakIycGtw?=
 =?utf-8?B?VmhqRFh2bmN2T0VNUHNZL1B2bWtNaSt5NUZROHlwY0VmdnluT3FmQjVITFhO?=
 =?utf-8?B?YWZ0RGxla1FTOVlKbTlqRk1nb2lSU21ZWXR5Vllldk9scXZmN1NZQndLSUx3?=
 =?utf-8?B?MnJTdjduT0JBS2ZYbjNrb1Z2SlE4RXhIN1FKVTgzMVg4NEJKZTR5MWI5WnlO?=
 =?utf-8?B?bVRhR0M5UC8yT2htK1JRREpkRVVkY245ZGtuOEJNVVRHUVUzNGhQS1BWV3hI?=
 =?utf-8?B?bm5WQUJPeG55b3hEMk9XajdvZDExUjlTbUpaVnlkSXc4bXo1bFQybmdqaUZQ?=
 =?utf-8?B?cC9leVJ2elZoOFZkZzhvQmFJbjJTSnQrRlRtVklSeXZlRGR0OUZoYlB0UmVr?=
 =?utf-8?B?MFlZUHlBUlRiOGEzUmdOYlpRb3dRWUFWMWlZNTRKUmMxZmVYa1pJeUV3cU5a?=
 =?utf-8?B?S1hIeS85d2pFUUhDOWJNeGtDcEd5THVDMS8yV09lV2FuOU1JelFWRUlwVXRz?=
 =?utf-8?B?RWIxdUNudmtsS1BBZS9LcmJjbFU1bG1wM0VYdVUzRnZWNTZ1SmNNVVpWUjdx?=
 =?utf-8?B?VERtLzNzbFQxeTJYSjM5T29PbHNmRDZxT3FneDh2TEl6NmdlYUR5OVR6Y2NW?=
 =?utf-8?B?RXdIaldWUWhUemJuOU1TbzIyalF5dG90SEQ2RCtpb3pUcmpoRjFYVjVyaDdw?=
 =?utf-8?B?d0duaHVWNEExVWR5UFNRZEZldmwvNDNTWldZVytKYjNPb2lCQllkYUhCL0Z6?=
 =?utf-8?B?bGZJcTlOejhOSTE1aTV1OHl6S1A1NU9aYzgwTjRHV1JTR3plTHlpc081Z0pz?=
 =?utf-8?B?aDQwTFFQbmtjdmg2dndIVFJES0NTclcxbGNlS1U5NnlWMGI5YTVreEttRXVl?=
 =?utf-8?B?VTFtSTdzQkVjK2hrZ0EzUW5pUTBPMUZSb2VxenE5aVRVUzlnOUhENW4vVVMr?=
 =?utf-8?B?RDBzVFhwUjAvRWZ0bnloZEJPYlp0TVJid2FwVGNoOXVhc1FzUE1OaHN3d0ZU?=
 =?utf-8?B?VW5BWmlkNU4yeUZYK2lGczg4eEpRTlhVRjBFUGlzUTYyY1UySGhuYTFqQVdG?=
 =?utf-8?B?Vlc4bkRjY3RoVU8rSlNHdEIyZjNCRHJZTU1NU01wM2NvcjlIQVZnenJIdURC?=
 =?utf-8?B?bzBubFVZQ0VWU3hMc2gweHhqL1lqZUJtK3hDbFRqTEk4Q3FOOUJJWXlaR2FJ?=
 =?utf-8?B?UDgxaWZNeUNEM0JhUFZGSHFpOUhIN3ZqM2FBcXR5UEROR1BNVTlmR3hEOGJx?=
 =?utf-8?B?bWxGc3h4eXhORXg3WUlLZVVrTTRMeDNhMkQxRktMZCs4dGovZm9lNXVheFZC?=
 =?utf-8?B?enRDVi9CQUNkRndrY04xR1FXT0NacHNVSGx2V1Frd1Y0YjVjVWdNbUY1RTc5?=
 =?utf-8?B?UUh4YlkveVMxUGJLMlVnTnFtZ0hiVkFUY0RLOEV3YWo2eXBiZTRvejgySU55?=
 =?utf-8?B?WlQzQ213TVhXUERUdDV3cXBjbUhJQ0VVNkJRdGNCbCtwa1VwclRXb0NLR3VU?=
 =?utf-8?B?SHM1YXAwMEZZUFA1V3hqOENBYjhKc084b2pkUGhwbTQxZjNaeXArdWVzeWl6?=
 =?utf-8?B?bDlNcFdERmZ1RzYvRlZYeFgyejlRbTFqUlNqNmpIRVYwQjN3RThHZUhvaVRW?=
 =?utf-8?B?TG5kOTBvOWVIMldoSVpqbi83WEtLZi94RjhNTmtDMlFFOUxQQSs3QU1QTGJm?=
 =?utf-8?B?ZkczRmRkb21UUkxWT1Y1U2VkVE5KM2NMWUhWZmFTMnNDbktidzkzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 455a0ae6-888c-4da7-7044-08de752c2577
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:42:40.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWhwtxveVFD78KC+BhzI/UXLWtOwKAOBu19UKTqj+Hi2qx3c0fS4LWd+HqHGgJIRRZ1Th2a08rLNMxujNQcNWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8833

On Tue Feb 24, 2026 at 1:25 PM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> HrTimer::expires() previously read node.expires via a volatile load, whic=
h
> can race with C-side updates. Rework the API so it is only callable with
> exclusive access or from the callback context.
>
> Introduce raw_expires() with an explicit safety contract, switch
> HrTimer::expires() to Pin<&mut Self>, add
> HrTimerCallbackContext::expires(), and route the read through
> hrtimer_get_expires() via a Rust helper.
>
> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-h=
ost-address-is-not-set/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
> v2:
> - Add Fixes and Closes tags
> - Fix and improve comments
> v1: https://lore.kernel.org/rust-for-linux/20260110115838.3109895-1-fujit=
a.tomonori@gmail.com/
> ---
>  rust/helpers/time.c         |  6 +++++
>  rust/kernel/time/hrtimer.rs | 49 +++++++++++++++++++++++++++----------
>  2 files changed, 42 insertions(+), 13 deletions(-)
>
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> index 32f495970493..ef8999621399 100644
> --- a/rust/helpers/time.c
> +++ b/rust/helpers/time.c
> @@ -2,6 +2,7 @@
> =20
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
> +#include <linux/hrtimer.h>
>  #include <linux/timekeeping.h>
> =20
>  __rust_helper void rust_helper_fsleep(unsigned long usecs)
> @@ -38,3 +39,8 @@ __rust_helper void rust_helper_udelay(unsigned long use=
c)
>  {
>  	udelay(usec);
>  }
> +
> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtim=
er *timer)
> +{
> +	return hrtimer_get_expires(timer);
> +}
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00..78e2343fd016 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: =
Delta) -> u64
>          self.forward(HrTimerInstant::<T>::now(), interval)
>      }
> =20
> +    /// Return the time expiry for this [`HrTimer`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `self_ptr` must point to a valid `Self`.
> +    /// - The caller must either have exclusive access to the data point=
ed to by `self_ptr`, or be
> +    ///   within the context of the timer callback.
> +    #[inline]
> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>

I guess the signature of this can also be

`unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove th=
e
first safety requirement.

Best,
Gary

> +    where
> +        T: HasHrTimer<T>,
> +    {
> +        // SAFETY:
> +        // - The C API requirements for this function are fulfilled by o=
ur safety contract.
> +        // - `self_ptr` is guaranteed to point to a valid `Self` via our=
 safety contract.
> +        // - Timers cannot have negative `ktime_t` values as their expir=
ation time.
> +        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(Self:=
:raw_get(self_ptr))) }
> +    }
> +
>      /// Return the time expiry for this [`HrTimer`].
>      ///
>      /// This value should only be used as a snapshot, as the actual expi=
ry time could change after
>      /// this function is called.
> -    pub fn expires(&self) -> HrTimerInstant<T>
> +    pub fn expires(self: Pin<&mut Self>) -> HrTimerInstant<T>
>      where
>          T: HasHrTimer<T>,
>      {
> -        // SAFETY: `self` is an immutable reference and thus always poin=
ts to a valid `HrTimer`.
> -        let c_timer_ptr =3D unsafe { HrTimer::raw_get(self) };
> +        // SAFETY: `raw_expires` does not move `Self`.
> +        let this =3D unsafe { self.get_unchecked_mut() };
> =20
> -        // SAFETY:
> -        // - Timers cannot have negative ktime_t values as their expirat=
ion time.
> -        // - There's no actual locking here, a racy read is fine and exp=
ected
> -        unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a R=
EAD_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when avail=
able on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node=
.expires)),
> -            )
> -        }
> +        // SAFETY: By existence of `Pin<&mut Self>`, the pointer passed =
to `raw_expires` points to a
> +        // valid `Self` that we have exclusive access to.
> +        unsafe { Self::raw_expires(this) }
>      }
>  }
> =20
> @@ -729,6 +741,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, in=
terval: Delta) -> u64 {
>      pub fn forward_now(&mut self, duration: Delta) -> u64 {
>          self.forward(HrTimerInstant::<T>::now(), duration)
>      }
> +
> +    /// Return the time expiry for this [`HrTimer`].
> +    ///
> +    /// This function is identical to [`HrTimer::expires()`] except that=
 it may only be used from
> +    /// within the context of a [`HrTimer`] callback.
> +    pub fn expires(&self) -> HrTimerInstant<T> {
> +        // SAFETY:
> +        // - We are guaranteed to be within the context of a timer callb=
ack by our type invariants.
> +        // - By our type invariants, `self.0` always points to a valid `=
HrTimer<T>`.
> +        unsafe { HrTimer::<T>::raw_expires(self.0.as_ptr()) }
> +    }
>  }
> =20
>  /// Use to implement the [`HasHrTimer<T>`] trait.
>
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f


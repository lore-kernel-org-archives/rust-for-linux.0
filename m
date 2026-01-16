Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2D342CBA;
	Fri, 16 Jan 2026 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544468; cv=fail; b=snqZw3itknIueItOwQVC+HBobve3cEbqvrOdl3zuS4/COvN+uBZZtVf6ofLXGRMNkTOOGedmhCy0YXmnd3pRadDJgoE9+HMnVVUX42PJozQthOIX37dIrj0/g9RCPg69NRucGkz7VyaapN+A+jvjwouBBRdScPQL0t20Z4+EutM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544468; c=relaxed/simple;
	bh=SnINAmM/K9tx/LoTMxfGdfueH+WnMzg8f8IDot9Mvi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QA5wGUzWXMqS1M+NEC4TJfq5s3RwMIjngXG4Ss3qWiQTgwKrH91erbXhUdVgrhfhL6M/B43hWJ3cvb0b9rBhSx8oUrFCzYvrPmgOMhLWLTemdlNgSVw5pSV7EsCEKkdOZjk4pBnD5lhBxsr+0JBMXa2xXo2Ad5JDhAwibhdpaBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=hkjWtafE; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="hkjWtafE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CENXCyYjAoEjura26V76DFzfc4r0yGCQjiofqpUe1gmg3AqW9TEkQ/LECV7p6vDaOgJuOSyNdyIHoUS0vT1k46nSpVq7HnfNXEr5slBFQ++GXYEw/FoCNN37VrWqWOsoo1/7A8gH12WUVrzDtqZJl4XQSGo4lcth5BismSZDnvswRb8vRHTDL5tO54yG3Y6HAHr/BQLLKSw89U0eZhuIF+jpuHlQIsC+iQIaLXvGKogiVf0zveypqwSzGtL8bOSxOzMWoUB0V1onlgxDS2ebuiddeVYt6aGYWRcWU4eJU5pSdJp+FIunax1jf24RwrC6q0pMQsczvtsx77NgDckwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXO6nuR90eR5t5LfklR6pQwMFeFbNIr+7W+9VVIqN1E=;
 b=hoZ0ffSoS7S6JzOtTH53OWKJhHfhBQIVJVc8K9ERB4+QI9a3S13faBuH/yYJV6RvZy3F+EvUkYKTTAP/vrTOHXdU1ctl/937pq/SwqiQ9Uq+Hr0P5d5CS/FMbJZZy3Ub/7W1RMybKngfD4a4JK7eMs+FxOxQZ7oVfBlpoDzjUt4+Ju3LVM5gYsBpWtlNevPlwjaxA+xmVKTLi5030J1zC+wv2ZiCfwx8vKnybRl/+apqwO6nItITfG02D9qRnwsCAAjEPr1GuJsPf9OoKB9S/ObdWi9DYN2H8UcY932pOZ0wAWO88L/vc19/qrJk0RDLSm452rSxN4CN2la4amiuLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXO6nuR90eR5t5LfklR6pQwMFeFbNIr+7W+9VVIqN1E=;
 b=hkjWtafE/B6V43ne9w5AZSHcg4phA3qRpAy7vaVMiyHZRvcmSXdIC1YRrnhfT8BLX6ZZDueUFmKnZ7KqWeg9DRr/I0b58tJWQnzmpSPEub5mi/FaUlvoArwdTMaWJBM80uDsq1U5V8qU5CVlzgKfV+MXwbiuRLwD1GPE2dhQzyk+yqzYUb/wj/WOhvlCg8I3BA26U/Afb41jTp8HZqpvDvT53gvDC01/mshH5i2EOI0CWWlmt3S7PSlF8L1mUQkkaqDGIpOkdWwZIgjFZ3cbKKtm+5Ofpi75XHnrg+lf91VZXvj+Be9gSeeYAWc1mv7f0MUSK8826ftdgJxrggRh5Q==
Received: from AS4PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::17)
 by GVXPR10MB9061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 06:21:00 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::de) by AS4PR10CA0027.outlook.office365.com
 (2603:10a6:20b:5d8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 06:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 06:20:59 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 16 Jan
 2026 07:20:52 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 16 Jan
 2026 07:20:52 +0100
Message-ID: <d817b1db-7f49-4220-ba82-1c8a750c84f1@de.bosch.com>
Date: Fri, 16 Jan 2026 07:20:44 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, <a.hindborg@kernel.org>,
	<ojeda@kernel.org>, <lyude@redhat.com>
CC: <aliceryhl@google.com>, <anna-maria@linutronix.de>,
	<bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <dakr@kernel.org>,
	<frederic@kernel.org>, <gary@garyguo.net>, <jstultz@google.com>,
	<lossin@kernel.org>, <sboyd@kernel.org>, <tglx@linutronix.de>,
	<tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
References: <20260110115838.3109895-1-fujita.tomonori@gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260110115838.3109895-1-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA1:EE_|GVXPR10MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb82e90-770b-4228-80e8-08de54c76ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|30052699003|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFFRRVhucmh5enBJeWxDbHZZOEFFOFpGQ2tzNlVVTUJhVUZTQkpjTlhpRFg0?=
 =?utf-8?B?U2hOWERJSHJDeTFaemJiSXU0RzduYUJNWk00NExhT0EwT05hNDVYbUs0TXQz?=
 =?utf-8?B?OGhKRmVya2dEODRKbkxTczhnSVJjODJtSE5McnZsTGJWa2d0YlhiZE11NjY1?=
 =?utf-8?B?STRxemlINGllSWNmc0pBZWhUaTZVa1BpMVV0WXV5bUZvKzY1aGpPZmlEYlFj?=
 =?utf-8?B?SGo2blZFV1NKcUM3dURaU1hJQjlaM1FjUlBlclJkcU1kbmJDcmpNcUw3by81?=
 =?utf-8?B?RXVTVmpMeVowRjJ1cWp5ZmpJZFBheUcwUzhDZkNLYjlGcXhnZkxUOW9OOVJC?=
 =?utf-8?B?TnFMc3E5bnIwR0pwSFVieVE2bDkzek1MKytTQ3RDUmVOdENNdm9DdGlGdDJV?=
 =?utf-8?B?U3NEUUMwZFFNZmtOYWs2ZlVnVjJmNzBnajh2ZHdpSksxQm83emcrQyt3MHBW?=
 =?utf-8?B?VUhhTksvUVdDMCtaeUdvZEhDSGZnOWNsbWpCaUg3clBHM2tNUEhhRTJ3K2lk?=
 =?utf-8?B?OVVNSjdFMmRLbC9YVjRNbE43LzlUNXo4YlA0ZjdkRzhOY3RmRjBaNTEyQ2ho?=
 =?utf-8?B?NXc1UjFwQTl1QjJZMUU3L2VHVmJ4UkptQmdwcDZBOWxnL2p3aXBUdkMxZUdw?=
 =?utf-8?B?eFVOTS9RSkpvNGFWOXlNOEtmT1pJZjcwdE5Eb3c5YzJoeVhrZnBucGphSWlB?=
 =?utf-8?B?V3MycFloL1NEaHhNTTVmMVlydmxHUDF6UzZ1a0Q1OXVRL0N1cDBWNXBWOUhG?=
 =?utf-8?B?dTJGT3dpekNpNkV6cXZDUGdzRDUvUWNaZlNsWXhtYmpkZU5HckVqQjVhQlBi?=
 =?utf-8?B?R1RuV1NRdjZXbzRta0t5YTREUVlnK3NpNkVjTW9naWpOcTIrZC9YUHlKdzE0?=
 =?utf-8?B?bXcveldaY3RpTE8vQlVVY2ZrTFVyUFlweHY4WUJNSEh5T1l0Y2k4SnZBYzNW?=
 =?utf-8?B?UTBTUEpKYmJadENpWHJyWS9xSzZydVpiVkwvV3c1QTVUTlhabUJrUzB2c0pV?=
 =?utf-8?B?bHZzK1kzdTB6T2EwWjRKbEhOOEsyajQ5VW1xQ2FxZzh2R3B6RUFvdDBNemVO?=
 =?utf-8?B?K25WUWxuVGlUNmM0MzVubE40eXdsRE5zS3FWZ0NBR1lwK2lITmlKdzFnai96?=
 =?utf-8?B?L01YV0NqZGI0VjBDNkg3S0hHdkRYZ0Fpem9ISDVhUVBUMjM0ZkVIaUg1T3d6?=
 =?utf-8?B?cHFUT1cwWW1uckZtSGRlY3FqbzNDaXRvRVdEbHFuT3pwVzgwNzRPVE5wd25Q?=
 =?utf-8?B?WFh1T3hMV3ljMnRtME1XL2RkejlpRW5QajJ6TFJSVVZZT3Z5YWdFenl6UkNi?=
 =?utf-8?B?VS82UFZtcGw1TExnRHdMeXNFU3lSamxyZGtHTGpzUmpHQUFFait3dmQrM0Uy?=
 =?utf-8?B?MG15UzA4NzVWY2NndDBLdUdJWkpJKzlFanU1ZllORFpERFpCQ25hQ0RSY3Yr?=
 =?utf-8?B?c0d5U0orZE1NdktYaExmMDBvbnBUTkNIZGVtN0h6eGxYdHZvVmFjUU84TkZa?=
 =?utf-8?B?b1NITTU4U05vdUlscDV6ZmZqODBDcWJaOGYrdjhoZFo5YWJaUG8vSkVXYXQ1?=
 =?utf-8?B?bHN0ekZMYWRzUUw3R09JcnZGRmN2Mzd5UEd5OTIwSUFEOFEyRUJnaFhTTW5N?=
 =?utf-8?B?cXN0YVhOV01lZ0lURENsMTJZNC9rSlVkeDhBQmZMU253bVdNVjRMcHhZalE0?=
 =?utf-8?B?eUpza3U4R0tYVUxpR1lkQ1VuMnpWNFpGS284Wm95cEQ1cmNmaFUwK3BKbHRv?=
 =?utf-8?B?Kys4bi9ENDVFWE00bG84M0FHQ0FjQ2VNanJTTU4zeHZ5STJocGJkWVl4VUJY?=
 =?utf-8?B?VFZDR3dCME5xbVdJNUZBQWhaRkdXMHJ0Ylo0aGFlb1lGUlJ6UVFoTXFQaTB0?=
 =?utf-8?B?c2FjRExkZmZOa1pSaGRLMmUyVDNRMy8rZ3RFam8zREYzeUl3aWgwSExFTUZX?=
 =?utf-8?B?UTF2cU9xRHhTMGtlcURmazBneFA1TTBzWEp4eXZJRkE1RW5yUURVOUo2YmJF?=
 =?utf-8?B?Y0M1NVA1QVNBd253aUtzQnkxUHJKeFhWb3VRbzhVUzhOSEpweVhhRUg0OU9S?=
 =?utf-8?B?L3JTR0FYTmc5cHV3VVZ0VGpTM3RKc1BzRjZrcjBmY2k5azl1RG9YMHY4R3RQ?=
 =?utf-8?B?czFVT1NJNFBwWlI1ZzNtU2RmZUZYVlZ2ZTd2ZkFWdzI4WHhzVm9ZSmtHOFNi?=
 =?utf-8?B?Z21tZUFYRHVIUnk2YW5xM3owdzFsYnM2VkF3aXFsRkxkMHpBR1Q4K0xFcFM2?=
 =?utf-8?B?Wmw3ai9nM04zc2daeHpuUFNwQi9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(30052699003)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 06:20:59.9694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb82e90-770b-4228-80e8-08de54c76ad0
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9061

On 10/01/2026 12:58, FUJITA Tomonori wrote:
> HrTimer::expires() previously read node.expires via a volatile load, which
> can race with C-side updates. Rework the API so it is only callable with
> exclusive access or from the callback context.
> 
> Introduce raw_expires() with an explicit safety contract, switch
> HrTimer::expires() to Pin<&mut Self>, add
> HrTimerCallbackContext::expires(), and route the read through
> hrtimer_get_expires() via a Rust helper.


Do we want some tags here? E.g.:

Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
Closes: 
https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/

Some quite minor nits below (which might be fixed while applying?):

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>   rust/helpers/time.c         |  6 +++++
>   rust/kernel/time/hrtimer.rs | 49 +++++++++++++++++++++++++++----------
>   2 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> index 67a36ccc3ec4..5be4170dc429 100644
> --- a/rust/helpers/time.c
> +++ b/rust/helpers/time.c
> @@ -2,6 +2,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/ktime.h>
> +#include <linux/hrtimer.h>
>   #include <linux/timekeeping.h>
>   
>   void rust_helper_fsleep(unsigned long usecs)
> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>   {
>   	udelay(usec);
>   }
> +
> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> +{
> +	return hrtimer_get_expires(timer);
> +}
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00..2c6340db1a09 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
>           self.forward(HrTimerInstant::<T>::now(), interval)
>       }
>   
> +    /// Return the time expiry for this [`HrTimer`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `self_ptr` must point to a valid `Self`.
> +    /// - The caller must either have exclusive access to the data pointed at by `self_ptr`, or be

Would "... pointed to ..." be better than "... pointed at ..."?

> +    ///   within the context of the timer callback.
> +    #[inline]
> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
> +    where
> +        T: HasHrTimer<T>,
> +    {
> +        // SAFETY:
> +        // - The C API requirements for this function are fulfilled by our safety contract.
> +        // - `self_ptr` is guaranteed to point to a valid `Self` via our safety contract.
> +        // - Timers cannot have negative ktime_t values as their expiration time.

ktime_t -> `ktime_t` ?

> +        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(Self::raw_get(self_ptr))) }
> +    }
> +
>       /// Return the time expiry for this [`HrTimer`].
>       ///
>       /// This value should only be used as a snapshot, as the actual expiry time could change after
>       /// this function is called.
> -    pub fn expires(&self) -> HrTimerInstant<T>
> +    pub fn expires(self: Pin<&mut Self>) -> HrTimerInstant<T>
>       where
>           T: HasHrTimer<T>,
>       {
> -        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
> -        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
> +        // SAFETY: `raw_expires` does not move `Self`

Missing period at the end

> +        let this = unsafe { self.get_unchecked_mut() };
>   
> -        // SAFETY:
> -        // - Timers cannot have negative ktime_t values as their expiration time.
> -        // - There's no actual locking here, a racy read is fine and expected
> -        unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> -        }
> +        // SAFETY: By existence of `Pin<&mut Self>`, the pointer passed to `raw_expires` points to a
> +        // valid `Self` that we have exclusive access to.
> +        unsafe { Self::raw_expires(this) }
>       }
>   }
>   
> @@ -729,6 +741,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
>       pub fn forward_now(&mut self, duration: Delta) -> u64 {
>           self.forward(HrTimerInstant::<T>::now(), duration)
>       }
> +
> +    /// Return the time expiry for this [`HrTimer`].
> +    ///
> +    /// This function is identical to [`HrTimer::expires()`] except that it may only be used from
> +    /// within the context of a [`HrTimer`] callback.
> +    pub fn expires(&self) -> HrTimerInstant<T> {
> +        // SAFETY:
> +        // - We are guaranteed to be within the context of a timer callback by our type invariants.
> +        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
> +        unsafe { HrTimer::<T>::raw_expires(self.0.as_ptr()) }
> +    }
>   }
>   
>   /// Use to implement the [`HasHrTimer<T>`] trait.

Best regards

Dirk


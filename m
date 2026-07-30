Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021099.outbound.protection.outlook.com [52.101.95.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099A37EFEC
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417007; cv=fail; b=U5SevL0XCOPIh1lzK7mQZRxUu3a8VnWZjCB6oLQVYzmsPerixK/qDChQcV1ahGD0sQ6tBgX77//3S47jleVubZO1R9eJpXkxqYZag9opo1l0sutIolazz2KFwRoEtuGNx4rbA2f45ToJlwRihQNAwCIhbDhtM8I72J0OQR994p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417007; c=relaxed/simple;
	bh=dUzMQvPBaebKkBHBinoZjDF+AOnWsEgMVTmJPMzLFZE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=i8clC1h1DyGtGNDaP4Ai4FA1hBvihOVVxHUszu96w692B1lyVy9wsK5/J0iyL0a1NaIkifS+OQhu/Ev8b/8cMYp08rdN5jRhcOok/h+otkRpq5z8acNN/lHXxrxaehL35DLlZFR7WGcH1R7a5NKYKOZpO9imUw7ltwtdrnXF4Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=R5RYJtQB; arc=fail smtp.client-ip=52.101.95.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="R5RYJtQB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjqZW7h8QFqGzd4PJGhDjxj8p7OlRj2rL71z15MOetuw/HqfyM1t2PuHxW/SfQPjQ7rkeOUVomaKdLdKep7lhsdZ69MsnAEnrLgXqC8UEU80LVwYIF1MlbA8ilXrbPmi+cj7049UvKkDCBN7h+bbefEOXQQc47efwgI3etjB9NVPX8kA8NIvWDEbMM0HfQRiVWtDKR94s9MoX9PT45XLPWAalsp0DFVq5DbE5eoPfEOzW3CZuG2pLbBrwOdwJTT43qRX4TQ0HqIz8KTwNiD/zcRRwQOZNB9Hi3JhffoUd2FqBy00nCMTFtiqmJvfhxmPHhrrcFtnmEizYt++FmPG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+WaMuqvbqyMbyPlxpqiGmFihKcLR053/5gajRsN1B4=;
 b=yaAqbQpEzvGF1zfE4VBTIFB0Bs65cq9R/mNFkiVmV042iZ21VVvV8b2Llu8I8CxH+pG321i9SMf42WzquR8mrx+0OPdZv9S5e4u0FDyRRvP9tr2gOg/pvcCKnAZjEAvsBDJeSeAeN8KBkbkT6KdoGzmLB8X96ZVzDvELTWZo4uRnjVHdp28TPAX2vBuxDDdOEtZIR6Er+3yXfnm0aYS+VH3SJ8R9IOHvu/9aCkA814VbanWK+d4F92h3lc+nGmX29xjfLEQ3+1dHdVE6Pq2tRgaObF983fT1Fg0J6M+NcIFHZFYxQ5akbGFpdULWciT3z6EMrRI3u4iuKyu65UguZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+WaMuqvbqyMbyPlxpqiGmFihKcLR053/5gajRsN1B4=;
 b=R5RYJtQBGcOa0ffHE3iO+LPyakz5DLKA3UOW4GemGEhXbOPTVqmy2MBZBQMDFU7XBtbz1ZbtmaeBcGB5OH4VA4v6fnNiV7xawR0JyDg8wZzP94TnfkiFoQUbCW4c6LPMhPjp8LySHeVYoERY9kM7bSP+VJNADHH2tlCQCK86hg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB7241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 13:10:01 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 13:10:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 14:09:59 +0100
Message-Id: <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
From: "Gary Guo" <gary@garyguo.net>
To: <a.hindborg@kernel.org>, "FUJITA Tomonori" <tomo@flapping.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>
X-Mailer: aerc 0.21.0
References: <20260722214951.72941-1-tomo@flapping.org>
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b03d5c-f563-4f56-31ab-08deee3bdcca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|10067099003|6133799003|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	SHTBx+G7WSFj7fKqCHvLKUcJz6hp7pl4sG7NtpSFTOcUgAttYX/HQ8JZJ5LelZfWc7XDdTVGVTS20nNF2jrT8hj3fdDUkBWOm2PX4K8SiwuQ4FbBcEc9/lZYPx7eJgsmGrKAdQXUAPBYRIqVQMzG/IntuRPJCpjIT9WDnyaQCUKZ9ELHCxu4ds/mF65ZybZnQWKVxFx7a8Nygb135vRKP2Xxo7jgcybqsrEzueGfT5T4HEO+HzzFCStt7p17l1vi4lzRlIDPaGmXq6z8JXeMFGWwLJRkML55SK4qyvuVauL28l0n7YL4A/3E9fSDPcPMuik2igdMTQY8Cd9YgGXCWTauwRBtKx+tolDQxxkICz0wXWV0b7bCuqcVavqTngd1FQEKn+zKG6Nul3Fa/LAFZFDPZprpp3S0c1+yXgq3cH26G2z0T754F8yOv/6xuhTMPuOQ5o8XmDFofjSuYFEtAMwhx5cFpoBUPCSvz0XicYcl8WGU6IkoQgnEPcksX+CME3mPabaX0kajyuBs1nAIjCskVQn1XWx78phcXBjP2Dq2MpK0p+4HYC4qovMdk+Af1v28XjbHGqSS7ExsZFA9ssIXg+5Ogf5XISYH3dElNk1TrxexgZh7tc6XUAbWxi6SpOe3bwblsm3Xo+fAkNsaeaRE3UoF+OcwIy1gFrEMNDSJJkZzQyjgcnJMcKcXlsKHKFeNvY/ErXkC3mHQWo26XA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T20vREpVRThOTnRyYzllTk1YQnV3SG8wYXVDUHgrR2JtWEt4Z1U4M244K0dC?=
 =?utf-8?B?ak1PdHBqS1hZelFGZWsrTmN1VzFyaGFBVGJhRWhFWXJIM3d1Wm1XeVFwRmNt?=
 =?utf-8?B?TTROcEhpMGxWQzFyM1BZTXBIY3hSQUNDdzZEVUMxdTJsME81T0c1YU9TdmVu?=
 =?utf-8?B?d3A2b291NnNJTU9TVFprZXpwUGVFbG4vWkNRL05aT2lpa1BsQUltZkphYlVN?=
 =?utf-8?B?Si9uS3FDMGVBK28wY1RSZnlkNG5FQ1hkT1pKODdrY0NpMFR3SnI2UHc0Y0xa?=
 =?utf-8?B?LzZTOG5PQU9SazljRjNUcUJxci9PMWtFWkZBdEVEZGQ1Q0VCbTlISWpmOUVP?=
 =?utf-8?B?blFkbUJNYkdaQnUxeHIxRUNzYWM5b01sbkV2enZoK2xwblVFeUNlWE1LU0Rv?=
 =?utf-8?B?a3BUdkwyM2dLQ093cENqTUt0S1Z1dGRzNzBLQlZLL3Rpd3IxREU1dHpXaXUx?=
 =?utf-8?B?SlZGd3FxS2sxUnN1eFZDbkRTdDgvVXVJWnNhUVNGWXM3dWNra1loNEVoeGgz?=
 =?utf-8?B?RGRoUkxiWlVsc21QOElpYkZDSGh0ektpSzhLVy9NaGZRMVZEWHlWb3JiVHpp?=
 =?utf-8?B?bFQzblJHL25BSEk3ZE8raS9iMThnVU9IMVcwcjg0VG15TW4yeTZoRENSK2Yz?=
 =?utf-8?B?dlVkMUhEd2xPZE1UOVZIaHpKQmNHUWpwWDFFZmhUcjFXVWVzZ1VMUlJRMTRN?=
 =?utf-8?B?RElxUCtCYnNFMDM5bGRXdFZRZTIvRG9sVm0xRkkybEQ2ajd6cmtOOGxoQTZE?=
 =?utf-8?B?eWlJOVIwamdPbm80UW9DbXFwdmljRGZ1VUJJUm91OEg3czhodXlGaFZVL1c5?=
 =?utf-8?B?eWRpS0RpSHlqang0NGxWTFFpMHNWYW0xcnFBMFZ4ajQyMlY3Mkx5VjZDYmVK?=
 =?utf-8?B?dk15L25UWU5aNWFHMUFVNUFpbWI3cWJ4eG8rM01RR3FyODRCQ2drd3JnbDJ4?=
 =?utf-8?B?eGRBVXZ5aHdac1oxcW51cnNYcmR2cU56VmtXbS9sZGV0ZUJyci8wSEVXNUl2?=
 =?utf-8?B?b3p1eGtmeFVXUDJ6eUM4UHdVRUJ0U2JTVG0zdnVGWTVTN3hzOVk3c1RtaWF1?=
 =?utf-8?B?bGJ5NFRweUZiL2tyclpXWHNvUEpCUmUrdVhmTXJYYk0yU0RJbjBkeXVCTW5Q?=
 =?utf-8?B?WkxRcVk3akZrUzg0RGl1amo2Tnc4Q0RSZjB4YmM4cVE4ZmE3bjl0dTRXV1U2?=
 =?utf-8?B?d1JkN1FWK2MwU0NzWHR3bEhUVWNFQ1R3VE85bEp6RXRteFloMmI0NzdqcVhK?=
 =?utf-8?B?dHhGWURLWVNnSkYzdUJRSDRZVHdKNGpkQkRnYUNKOHRqZ05GMHdKdTVVSVhu?=
 =?utf-8?B?czc3Um5zQ2Fndm8zSm9OWW9zbkVjMmJBb3VXb3pxeGo4SHpHVDV1cWFWNmJ5?=
 =?utf-8?B?bGh1Vk9qWEVUZklTMU1udHBIV0hXRDJuaWY0NC9jU3VpdmJEb2hWVnJkNWpz?=
 =?utf-8?B?WlBlbitIYWRzZytRZ0JDVXE3TmVuaWU5OENvdXpLSjNNSDNkdi9pNVFqNzlO?=
 =?utf-8?B?WFZEYWZ4WTVidkF2ZkVVcDErQi9pdDE3WHY2elFla2tLdTJRVGllc2hmTzV4?=
 =?utf-8?B?bEhUaUpmR1Nhbml3Z2xiT0xpd1crem0vZjRtL3JFWGkyc3Z6dVdPSHgrbmZN?=
 =?utf-8?B?R0FncTBCaG9JdnN0azdvL3VKMUs0bFBocHpqYVFZdkJGYnRXQko3V24ra0pY?=
 =?utf-8?B?QkhmSXBDd0hsdFhJTVJYRSt6NFBCbEE3SFB2aFBaSm1Fbm1VeDVzVmNLV2lo?=
 =?utf-8?B?bHJFRndlTVhaVVNzQUIrQzI3cC85dUk3eHpOMWpIK0xXa1J1djhib09IRkU2?=
 =?utf-8?B?LzBRbTRaTGN1NlVIazZZempLd0F5MmNISmRldjdkV2hxcDMwQUhUYkRhRGFU?=
 =?utf-8?B?RXdaVG5BeGJPYVhBVlBQR0dKODdmdXpZU0Ftb3FvWXVGeHFvOFNqdXBzRk9s?=
 =?utf-8?B?cEk2Q092ZlFhUFFLMjFqL0QxWDExamhZUUpObnVSZEo2ZXpMVDQ1bWZ4bjFr?=
 =?utf-8?B?aWRQSHkrSXhyeU5tN0lIR0tTMXJ3YmFpQTljNVAwVW1uL0VuZFZRUUZ5Z0xK?=
 =?utf-8?B?WWtXSktMQzJxQWJHT21QQkg1UzdWV05KU3RnaEt1TWJkSFdIYS9ZRlRMM09R?=
 =?utf-8?B?Y2tHV3lSSmp2cmJIdm9OUEpwVlRveW5YNVNFN2p0eTIrTTF4bjFyeEZIMkF0?=
 =?utf-8?B?TmFSM0l5czZ2T0pwNUV3T0lNd2JPNXVKMHVFcnp5RElhM0lFZlpFTGtsV3lw?=
 =?utf-8?B?UW9EOEtTMmx4S1NNd3IwZjBYcTdmRXh2dlNYRE1zR0NXTE5pQitxZGV2MWdl?=
 =?utf-8?B?amJWaXJKTnhub2NlYWdjT1RDYzduQTgxVEJCMjMvRjNqdm82UXZqUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b03d5c-f563-4f56-31ab-08deee3bdcca
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:10:01.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16+3mhgT8j174jsn2Nc27o4X81owsnfy/lrCIwgtitDj+RWo67aoEdxGk0nxiQPpG+1oc9VzvOeb1n5kWYn03A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7241

On Wed Jul 22, 2026 at 10:49 PM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
> a raw jiffies count (a plain c_ulong alias with no type
> safety). Callers have to know on their own that the value meant
> jiffies and convert to/from it themselves, which is easy to get wrong
> (e.g. passing a millisecond value where a jiffies value is expected).
>
> Both APIs just take a span of time so, they can use the Delta type
> instead.
>
> This series makes Delta generic over its time unit with Nsec and Jiffy
> types, switches CondVar and Queue to use Delta instead of raw jiffies
> (updating binder's ioctl_freeze(), the only caller of
> wait_interruptible_timeout()), and then removes the now-unused Jiffies
> and Msecs type aliases.

There are more jiffy users being added so we should take this sooner than l=
ater:
https://lore.kernel.org/rust-for-linux/20260726223613.1242940-1-dakr@kernel=
.org/#t

Andreas, any plan on taking this via timekeeping-next? I suppose Boqun
could also be taken via rust-sync tree if you give an ack?

(This is obviously a new design so additional reviews are also welcome).

Best,
Gary

>
> ---
> v4:
> - Make Delta generic over its time unit with Nsec and Jiffy types
> v3: https://lore.kernel.org/rust-for-linux/20260717042247.3634961-1-tomo@=
flapping.org/
> - Add new Jiffies type and convert the APIs to take impl Into<Jiffies>
> v2: https://lore.kernel.org/rust-for-linux/20260712235246.3069713-1-tomo@=
flapping.org/
> - Fix potential overflow in from_jiffies()
> - Fix inflating bug in as_jiffies_ceil()
> - Add a patch to convert enqueue_delayed()
> - Add a patch to remove Jiffies/Msecs aliases
> v1: https://lore.kernel.org/rust-for-linux/20260704132558.2253275-1-tomo@=
aliasing.net/
>
> ---
> FUJITA Tomonori (7):
>   rust: time: make Delta generic over its time unit
>   rust: time: add jiffies time unit for Delta
>   rust: time: add Delta::as_millis_ceil()
>   rust: time: add Delta::to_jiffies() for timeout conversion
>   rust: workqueue: take a Delta<Jiffy> for the enqueue delay
>   rust: sync: condvar: use Delta<Jiffy> for timeout and result
>   rust: time: remove unused Jiffies/Msecs helpers
>
>  drivers/android/binder/process.rs |   6 +-
>  rust/kernel/sync/condvar.rs       |  29 ++++--
>  rust/kernel/time.rs               | 156 ++++++++++++++++++++++--------
>  rust/kernel/workqueue.rs          |  12 ++-
>  4 files changed, 150 insertions(+), 53 deletions(-)
>
>
> base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a



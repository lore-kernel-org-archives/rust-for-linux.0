Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701D353A67
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935283; cv=fail; b=fl+P3x9hYf/yINFgXggvbGoaJCehI60Yz6lGQHNLyjGXtE5bi6uW9Pzas+jOXwTUauuycd8Vo1JBtn6Vyc1F6hxLjIJwohOKj51hn82xlh2PHQu/YBpavY7ohI4dOSoAWZp6xIC1bVXzjBfUthyG/AKZ1ddodpbimh5JuugMDfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935283; c=relaxed/simple;
	bh=XgwoFXOEEF4C/utFfa/xlBJu6+bT8BGiJqGJTUNMw24=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=A6nJ3cxHu32TrbTnod1ruiWzJnDMTgQn9EFxVsCL4Qf68QcYbBqfNQXtqVgQVXqBXNKAYeQGyiaefJAoD7NaYONX/m1QiwV9XvDKS59B69/+m34ot7OXbbhBqs4xZNOKBjHOyQaddPt6RNkSoILnS+nZaRy9jKxZnncjdBTs6dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ixi1UCT1; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ixi1UCT1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVsImdt+VkEY/5mxuBFEEMmOtEKFRvVzuw6SGJBNr+o+p8x8UIhRkG5Vq508cWye2ErbrZoAw8kXC+uk5BxDqZxk+T4CIc33LBmAiDaNYJg5Hlk1vCk8TPFe+iLx5/vRrXcJr52FRAH5ldqGH0K6zBYG+CentovoCs7yrU/NSMQXfsbFvEUMb7PbFMwJUjjd/9v+ygV25LUYEhfKPTEctBuB3eGbCfO1+vJ0so/dd8Xl7ubQX1omySJr/pG4uWzvbddapEjiLKpPpMgGMmBWofxu15mt8dISuBvFoL4cRI7G+RWOZ78XSH+EyY8cKn+hpmL3mxMSi2RpZfdQl9pzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emKHlsMlxBvU3cQjatZs1bWXo8oJ7NA22Wv6rsfSE/A=;
 b=FxXrIbvdb2YJF1qmpn9vK9rO9SXfinzNgQIzEnMwEMdZ4aZOuygfkOuGnk6tWGOSS51ABAAcerEEp3b4t/gFWJOUv4V1+IwkkJ0TZ9DBjSE7bLofzGtIbv+iAlF0JO+gyVBrdobdy5Ly0UbkeZ8fGC2+nK0HYu34hm84D6l9QnhDZMUKFiq+7zfqw/mPSQtDYAwmP9yTLRKg1SD43e/TXodm4PKwXV+n3kVKHOYkTXi0l2g1mCL/YzP4AsSKNn3h3IXJB0OhKW8JERCLIgdvvHaJt9ody0W3oxVBfPsMjDbECbPezixHEgI106lSYttBw7dWLnWxhVHbO/LexV0dCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emKHlsMlxBvU3cQjatZs1bWXo8oJ7NA22Wv6rsfSE/A=;
 b=Ixi1UCT1pYEK4YJ+f1x6LA0yEoR+kjskXbha58ipUX2RWe/hmBj8aOwoV0dBUt450svnCbsFfcr/kCCPBKGR2pu8LBOcSD56ddS8WI4+qVK3bedHAUnuCMgDmXpjE8C4q+C8HJ8dginKreTWhooUmo3+B7TaYKIePBbvibOFEBY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8492.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:464::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 10:01:18 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:01:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:01:17 +0100
Message-Id: <DLU9KKCZG28T.2D6SQPKERV0X4@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tj@kernel.org>,
 <tkjos@android.com>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <markus.probst@posteo.de>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v8 0/4] rust: use Delta instead of raw jiffies for
 timeouts and delays
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261002050428.2746277-1-tomo@flapping.org>
In-Reply-To: <20261002050428.2746277-1-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0577.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3c8ee4-4914-45b9-5214-08df206c1a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|7416014|18002099003|22082099003|921020|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vF+aN4mNGCensKW4Rqumr0AqmuGGUmnJMejS2ko2R6f8fSdUnhdMkd4Pw3S1cV1/CTtNYGJxDwFU0VpfeqYRKW8RlOXGK7JnfZbIcI9SH66dccgQWFiZAZt73SxHfZNnL8CdkRLhbSqmucQeiR1ahALEiBsy1FyMRpA2JXrJuFOl46gioDMZBC/d78Lj2hq/QMdIS0I7MaryAM+kqOjyNYc3SWzWQKqNQYdxX+Z/pzFeGJ00rPywGzT9T7ZmZuno3l0oPUwwkgpfGQIV2CF1LPRwJ3/e5THxwDpohAqYfZ8fG2vuLXzHf76wI3BkPpn/8ER+K3eFdSqQtQ8R10E0CR/v0R9lyaie2BbWrHcOd5FHW6fBWrFDxxnJQsl6Wx1jfWb0L65pBQt9Hly8KeyA4TD9FflXzCZRO/8ynPMGpNFQ7pRRBmlgNnROTsDPgELmikGhPJe89m20jCwqyYpBtuv6rfpH2w2z59nRsPeEisyHSuYKL91zEQbrZE/xpw1KylERjoWpBuZrgT8KkwJ5XmX/3t8sRhcw8lyi6SScG0CSoaQB2JMyltiKWZvZEyypRGWZk3gLNvRJ8nctzGNa1P2byG2aYRnriS1Jd9ZkHcXhA9DcdcnevSCKleAoYHtgogmWlxtv//Kplp8NksBJ+Jvf4VvXFlf9p8wplKQrP4/CQ4iICnLjhHHm7PbeMTNOLrOmoF5iKKPO4ZlBo3bbFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(921020)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1dpbzVnL0VldnE5djdSMHZHRk10T0ZMVjIxUkFZMkFXTUFPbzRvTFVHbUxH?=
 =?utf-8?B?bmlnSnkvL0JMZmlMRjJFaXUwZlR2WmJuVDJGL2hvNWxseGdrWlBxQXYyYURZ?=
 =?utf-8?B?TVdMWDZ3VW9GN00vVWlWcys5Tko0UmZib2o2YW5sTVFLM2gvcndiUEhLdVZ4?=
 =?utf-8?B?RU5LcFJvTlh1c0lHT3A3REdoRDBoblFtWElxelZFallGVjF6VXlJZGNBL043?=
 =?utf-8?B?cXV3OTFqQ0RUbzlMbGNuU2E0Q2I5MlR4S2toTEdOTWl0UDk4VnAxM01GTUNh?=
 =?utf-8?B?R3lWdG5BUG8wWDQ4ZmFxSVZpN2FBaFEvVkZwYmdxZFordHJHY2E1OUc2OEQz?=
 =?utf-8?B?YkRXSHVuUDJpNnYvdzdNU2VQa0FwZE9PaUZ2dEhrbnA5dHZsYnlkaThjZXB6?=
 =?utf-8?B?Wm9vMlpFM0VnS0hRdlF5MWgxaERRYUgyL1dvRytiRDN2ZWY1UWM0ZzJDMGIy?=
 =?utf-8?B?dm90SWZBR0J1cWVGMk9yaXl5SVZ5YUtnblZVUURPWkRyUXlPb0dwSHVLeHdx?=
 =?utf-8?B?bmwxYUVlUHRWNDJGVDZxcmNGdVlkN0dad0dTSDFQenk2RWF5UG9UY0JxNTg2?=
 =?utf-8?B?WVBPT3lmejY2S082SGtIcDJkSGViUWJ1aTBDKzZqWGhsUHlmb0JoNkRxY1Jv?=
 =?utf-8?B?eTYxV1hPZnZ1c29hdC9oWVZ5a2VjS1JtRmZFQXI5UE43ZGZTZk04Z2JQMUJ5?=
 =?utf-8?B?Y2gzMHRmU214c000cG43NGw4akZod2k1dmxHMm40aDNHejEzaFRtNUthM1ln?=
 =?utf-8?B?cy9JOElGcFJEQmVCUVdGd2RVcWVmQm9sTlk1TExUcG44SDVHQUkrSis2OHd5?=
 =?utf-8?B?QStvdmF2OW9HbWhkOTZKTVBGL1RLMTdlc0poRXNEN0lvRGw2NVdlb0FHQzZt?=
 =?utf-8?B?RmljWXRJcXJzbERPbzNHeUtBazFJZStaZzgwQTc1eVdBV1VKYjhCVEpVcUY5?=
 =?utf-8?B?NUdHcWlpMHBLcmh5bTdZV3ZoVjFxaHFYTkhsTU01ZGNYMXNTdzE2TlBFeDND?=
 =?utf-8?B?dzBrMXF0U1RpeGE1LzhxaG5PRENuSUZreEd3TDRRa2tNV3gyVnVObDhVeGxU?=
 =?utf-8?B?aHprVyt1b1k4S0xEdzVxbFdpMjVhOFNjVTB0OTRKY1MvMXp3NVExbjVTaGdx?=
 =?utf-8?B?bWxpUXNmYXdhZEFRUldzaUpUVVkxM3F6dTliQ2M4N2lENlZJS2phT3U4Mngz?=
 =?utf-8?B?RjdITGxVVXN1WVNtYk5YOVpmT1haTngwNW93TDlEd01EYWZjNVorenVqV0Va?=
 =?utf-8?B?NlYyNVR5cUtqSlVSM1dpM0Vlb1NuaDdvRHNDV2lnMFBUZHNpc0FHQWpPYk45?=
 =?utf-8?B?b2g0STl5TmZsZzdlYzFPSFFsT2NxdlZ1R2ZBSDI2N0FoV01LWUhxaTJpMUcw?=
 =?utf-8?B?Uzc2SWxkOW95M3pWNHdkdElja1hQbFZYOFowTTg2aHFLMERzOTFzNnRyK3FZ?=
 =?utf-8?B?clU1UTcrbi94SEMrVE5EY3J1N0psc2JHdzBrcElOeFBRcnhJQ2dMYjBRd3ZZ?=
 =?utf-8?B?TERXMkk1UGNvRUxKanllNGk5MmttN1k5dzNwRmk1a3FWVTh6MUZiOXNpQnAw?=
 =?utf-8?B?N0ZDS0g4cmxnVkR4VE5ZMjB5T3Y0dU9UQ250dm1ITU15RGp5Ujd3WnBQTm4w?=
 =?utf-8?B?YlYrSXpWa1dNaE01TXl2WFp5NXZJYUJ4Wjl6QVoyUGVKWVJmbFkwM1BTc2k2?=
 =?utf-8?B?eVRXVDd3YVVBbWMwdzI5ZlRWQkoxb24rR2hQc2NzL0V6ZXNSU3lqTExYeCs0?=
 =?utf-8?B?ek1KME1sUldqckJ6VVVUckQxenUvdDdKNVM1elR2dEE5SHRmU3QvK2dEaGlT?=
 =?utf-8?B?OUgvUExkRkt3MnhRSkhaZ1o2ckF0NDFMb3AveDdOVE8rMnRqSGJnUzU0Z1dr?=
 =?utf-8?B?blBmaUw4MEtmeGZJS2NsUnZXVU05TmxweTFCVENJS05acklVc2c0VGN1YTZQ?=
 =?utf-8?B?RHlSVEhLbWNyYWxWbE5GY3FyaFlPYnhpalFWQXZvUitqejZtRERWTVpVZHFT?=
 =?utf-8?B?Y1JQRXVSMTNWd2N6OHBsQXJPTjhFeGZYMTMyK3VxUHNMamhmbEJjMGE2eHNS?=
 =?utf-8?B?ejBlTDVHclRqU21OYkxLQWxldCtYd0MvdzdxeVZGK0RqSjlpMmJVQWt0NExM?=
 =?utf-8?B?YlgyT0tjNnJmekdQeW9wVHM3RTQ5Um0rMnpCUVMxK1FwVUU2Ny9icXNpaDBY?=
 =?utf-8?B?RlRhRnVTOUd5QUc5MmFTL0FQSlFpNEw3bzNlcjFMenE5VjQ3aVdGSUluWUFH?=
 =?utf-8?B?Ylc2M29UcEpaKzJqSmo1WmtXSEFiQXJDa2x1Q2EzSlE0cllJeDdYNnZ6WDV2?=
 =?utf-8?B?NWpvTFlBem00MXlyL3p5TzBNQzY4a0dmRzFVQmUwZ293STcxQ1JCQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3c8ee4-4914-45b9-5214-08df206c1a67
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:01:18.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNEYBj33kGNMos7DyfXuBEf+9SeV0YpBNpvTPElMqbeIUUYELC1La3Z1q0lyCBVJ6klR7BXgHsDsO3SMSsFgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8492

On Fri Oct 2, 2026 at 6:04 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
> a raw jiffies count (a plain c_ulong alias with no type safety).
> Callers have to know on their own that the value means jiffies and
> convert to/from it themselves, which is easy to get wrong (e.g.
> passing a millisecond value where a jiffies value is expected).
>
> Both APIs just take a span of time, so they can use Delta<Jiffy>
> instead. The condvar patch also updates binder's ioctl_freeze(), the
> only caller of wait_interruptible_timeout().
>
> This series is based on timekeeping-next, because the binder change
> uses Delta::to_jiffies_timeout(). The workqueue patch conflicts with
> Danilo's workqueue series [1], which also changes the signature of
> enqueue_delayed(). The conflict is trivial.
>
> Binder and workqueue maintainers, could you take a look at the changes
> to your code? Andreas and Boqun, which tree should this series go
> through?
>
> [1] https://lore.kernel.org/rust-for-linux/20260807165252.3849875-1-dakr@=
kernel.org/
>
> ---
> v8:
> - Add a patch to make Delta::ZERO generic over the time unit (Markus, Gar=
y)
> - Add a patch to add Delta::as_jiffies_unsigned() (Gary)
> - workqueue: use as_jiffies_unsigned()
> - condvar: use Delta::ZERO in binder (Gary)
> v7: https://lore.kernel.org/rust-for-linux/20260930014124.1454138-1-tomo@=
flapping.org/
>
> FUJITA Tomonori (4):
>   rust: time: make Delta::ZERO generic over the time unit
>   rust: time: add Delta::as_jiffies_unsigned()
>   rust: workqueue: take a Delta<Jiffy> for the enqueue delay
>   rust: sync: condvar: use Delta<Jiffy> for timeout and result

For the series:

Reviewed-by: Gary Guo <gary@garyguo.net>

>
>  drivers/android/binder/process.rs |  7 ++++---
>  rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++--------
>  rust/kernel/time.rs               | 34 ++++++++++++++++++++++++++++---
>  rust/kernel/workqueue.rs          | 13 ++++++++----
>  4 files changed, 66 insertions(+), 19 deletions(-)
>
>
> base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38



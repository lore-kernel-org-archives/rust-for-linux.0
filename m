Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021078.outbound.protection.outlook.com [52.101.95.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2A493650
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946222; cv=fail; b=LvKYO67z5iv8y0dbNdOc4CCO80wc8+nMDZ377ifdzvY/ukzVlAGpBX6uLAjEbezWsJs4XxQvRLSmiBVkV2/qsBpkk1HOiMlhFN/rtGgERxZo7wm8/vouaN1dSyFAuXqnmY23CadEvhVjiIXkZFSz9TIg3Rxx+3PerSbzOxZ1cXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946222; c=relaxed/simple;
	bh=5Gb50U6ByGtBr6gyAhBPSzqc60YkYWq/JE/JSa2BkqY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=YEhwPErehnrV9RIAd3nShtM37NEKwTfS5aiZ+KdrDIUlnyNSm03v/B3jGRM87Ny8zrsQau8/OsMlQtKyVAEVxYJYX73B43aSzwn3vCyynkXHpCEZE55Reb58qjnHN/w5ESa7mBHxpO5LW94tOUNwEsv4qt2b/ipZM0NE+VDVkQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=czAXIixd; arc=fail smtp.client-ip=52.101.95.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="czAXIixd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/atya9LXS4NiYd2qwroyO7aRvR05vf5sicJx9YDW/EKy/QnfGkdyfm49n3i/ypGhMYHz+9+htJj9PycwLaib3P2Bqma7UStqjN/aWg94kOarMGb+G9Fx0nZxygwvrMhy12iEU/aZBUZkWLyw1ks3Co9LvXQ3gQ1be3hvJA7EmXVYShS2QG6paxu6XTwu6Z8Mq+btHCYjFRsQa+FIS1frPhyhdssIU7ghkUnsTwD7ddRnz3o16TvE/vgKo5rsCjQvbUG+mq9ZBx96L9ewVGkNgCGjvMLlYsegHRhREDxVItsdI4QRpm3jOmbYWx25Lo3MKNdIbeNUbBvMY08XBi5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTa9vKzcp16ZmqWJdVCTT1WmM6ZAP0HlN6eFTQRcw6c=;
 b=cfRMH4NE+QAecSdSidrI7GfXKKYEqyCYw/oM5nXM4ju7m/u8xfzD/2hl+hdtbcNy6TOeVXaxCR8yiQq+veZAj5y0M5taEPv16FyNgRFhWn7ICFRsr0x/yz6gjVxdRAS9SE72ntz6t5Adpgb30v44UHk5PxwSNg7sqUK55WBLYNqY74TtvZHmxY7bkMOM+Ce7C/QFF1z+DwFWEQi1kKuTnoiqZGjQR6fi7UnL8e/2cPI2J9WkLUxgVPcJP1ADDlzEATm+pZdGlCYLErojNZLpOem6La8aq2tTkSVDQMLCyxA2dgQAR6tfgmQ9a3e/LbBMVnJXrXsB2f7g27T9wM0+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTa9vKzcp16ZmqWJdVCTT1WmM6ZAP0HlN6eFTQRcw6c=;
 b=czAXIixd5ZZ1cwilkqK9R39K6Wwdmq9Ey3S8ylPeAY7s0KXjIyv5SY44l4XL5IFTiO4njBEDzCzachobzQ9UmVj+yQGfSboqLNUBiGaj94Zuay9+buqnGcuZxt7OvIANyEzahtEPcLR5hF6eYYck61EJh/gDd/FbuwwEqa4DMz0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB1941.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 13:03:30 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 13:03:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 14:03:30 +0100
Message-Id: <DLUDG2TH77RI.ZQ0T5MH7Q573@garyguo.net>
Subject: Re: [PATCH v8 4/4] rust: sync: condvar: use Delta<Jiffy> for
 timeout and result
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>, <arve@android.com>,
 <boqun@kernel.org>, <brauner@kernel.org>, <cmllamas@google.com>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tj@kernel.org>,
 <tkjos@android.com>, <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <markus.probst@posteo.de>, <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261002050428.2746277-1-tomo@flapping.org>
 <20261002050428.2746277-5-tomo@flapping.org>
 <DLU9K3JPSWCD.36FZ6DPB6B3NQ@garyguo.net>
 <20261002.200545.48892805627139274.tomo@flapping.org>
In-Reply-To: <20261002.200545.48892805627139274.tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB1941:EE_
X-MS-Office365-Filtering-Correlation-Id: 395f6132-79f2-47c6-6d63-08df20858ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Cl6Sfs4BO60+v+ILBJ58lvA4xGYr8gAYZGDej5rplpfJBnxt/W1w6bF4YCY2qcy1Gb++V70kEyooOuasQw8PuN6UOq3wBSgmfogtnMT3WL0Cy0kjDvN+o9vD3yyqNsDzdFaC2ylrmqMrMgudEZQ7ENKPt/tah5Sk64a/tqylecZqQUiPPaYBhEx8z/HxtVcLqGA41GYQfLeLuu3rUe7FMWi0JB9qCc4n0YrJpQ5WeX81BoS2Bj4HAERv/7lqkRshcgLupfmxzXewhh9FJM2Q8fIwFiM66CIiQV6nFYiRx7uWST1t+/jdR4AaGW14o76mZw2IxCujJz2974aa4kgdpesXYlJiNO1Ze1wQWNV1z7x5rivAbCJqW+M/aIjGdPhogRz0ij0mqptB4hblVFutJ9pm7C1Oci73AJigYde9RZt5tsrncEYImgANVLMkbp6K/EG75dImXx6yo2l7KbB7BWYUXLRnZzJV/PPWvbT4hCESAtRrhKZ1VvQFwyU4lI2ODs8kICqTTuzPB9njPn7zzjPYCCLghv9UOq5XSOjsrGvd6hSH0mEF45KhH9Toz6FYcC/1eC9so7lDJzO/yYnTlePgOHTIJqJTl1Uny0Hfu632jQUDZTkV6JbB5S+Uy3/486MFZuGTbsm62eMmx59/iSMyyooqhW+dSBg4P0DoO00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pSamZqOGRIWFRkRUUyc1YxV2dWZVRnU0d1aXVhWW0zZzFQeVdKUnFxMi9t?=
 =?utf-8?B?ejVGUDAvSWsxT1lwQllkWTNPbCsyWVpEbWgvQ0d2eVA3NjlFMXVkQjlRUFNY?=
 =?utf-8?B?MkFvNkhxUmk2TzAvSDlGQkJQSzlVTUJiYUlqMjliSnExZlprc3MvbHkwK1N0?=
 =?utf-8?B?R3hrSHVWZE9uM0ZRMUxza0FDc0czVmpOMmJwb1FIS2JyODl1M0JqK1VYaWRP?=
 =?utf-8?B?Z2pXNFVpQ1VWM3ZoS3Q5VWtkMS9iQ1IwMzB2TXFFNTJXbW9kbmIrYUJZb1Vl?=
 =?utf-8?B?UGVlRjJ3czdDUWhOMGVwTXZhcFBWc2hpTjlpditUZkg5aVd1c2EzamYxVjB1?=
 =?utf-8?B?aTFDNGtjSGVKTy9vYkkydEkvOEViSzkzV0N3WnlwT2NkM2dkOHQ0NWh4RERU?=
 =?utf-8?B?d0FFbG5IRGkyZ1IwTzU3eFBaRXdPNW9Yc251Um1WdnNwU3FPeVg3a0p2ZEdm?=
 =?utf-8?B?SUdRdE1ocFFXVWdJNDlvNkhkWGVpTHN6VEFXbDJRTklsRGFwemlmT2RQMHIz?=
 =?utf-8?B?Ym5scGw0REZZOStka0gyTlhuR21mbEhUMnpDT0NhdElEbDRtK3VlWSs1R3NO?=
 =?utf-8?B?ZjlmS0hRc204L0gwc2dmUExLbWcvVmhWQmpEd01pVkxXNVhuMkwyWWF0d2xh?=
 =?utf-8?B?dHdUNVVEZGp3K2dCd3AyQ05lQ0xFRUFxRWdnNWlVbDFMQ2JRVmorS0Z4WTVr?=
 =?utf-8?B?clpEcStXTERlZHRaVyttVVBJSm9hanFHcXdLMVRYbXI5M3JZRGRzR0lYZjI5?=
 =?utf-8?B?YjBlR1NORDRqcjFTeUNFT0QwMTdTTk02WHlOOUkwSkMrNjFGNUtvZEtCcEE4?=
 =?utf-8?B?Zk42NERZNkJKWVpwSFBSUHFDdFFMOTVTQ2dqdE04VmpRWVhxbTlsSEJUK1Zi?=
 =?utf-8?B?dDF0RU51VkdqMjVnQnZ5ZUpUY2h3NEdUVDZYWDRQbzVoeXcrWjBsdVlDZGx0?=
 =?utf-8?B?RmdhVWFuZUVlMXpXN2NqTG9JL0tXeW5SQzYrUUZRTEJWOUpTMkgwYXRvWWxs?=
 =?utf-8?B?cEVvTmJIeG8yTDk3bFJsZUdCMWJpY0lSVC9GODFnVUZuSjdYakUvYmpnQmJl?=
 =?utf-8?B?b0xRWkJjd0lPT0ppbFU4SU41UDlYdDZQT1MyNUk1ZlhEd1BjbVVETmQ1Sks5?=
 =?utf-8?B?SVlTQWV5UTIyTmo1MUZ3a0FZMmk3aU9UczZ0T1FBSTZTemZSNFNWM2FMUXNC?=
 =?utf-8?B?dEFmTE1CRkpQRlRXbU9IeEl1OGFELzJWNDYzVUlTTVFvL3ZFL2xEcHFkKzBX?=
 =?utf-8?B?RVVUTjVha2tRWmorMzJ6ZGk2OElkelk3RjZ2cGU2T0ZxTUZ2UGpiR1BzVllS?=
 =?utf-8?B?QlR5SVlqZjdTQW5tWGtHQ3hIVFRsM1hzczBnWnVvUGN6SmFyaVB4SG10M0p4?=
 =?utf-8?B?aitJd2FmN0NhUFFzSkhsSnc0U3BDRlJVMldMcUg4VkYweXFsMktTUjdyT1NZ?=
 =?utf-8?B?UnhsTEhvUjRPMVV2THhuTmduUE9hNWRpOHdvZHFxTWY4RzFmYzRhNjNIYVQw?=
 =?utf-8?B?NkNyamZ5dG5WOVpYZWlwNUd5dlI3bTg3b3ZFVUtsMFgwQklqcnFFQlJJaXhP?=
 =?utf-8?B?QWZpWk5EcnBrQ0hFVlhxZnVMVjdDUkFNL0VNMnArMHFlaDc3U244ajVWYlhi?=
 =?utf-8?B?MGxrQlJ3ZDZmM2tiT2JaMFNKM3diTFVlZEp3YUZCRXY4bW92Sk9BaXhLN09m?=
 =?utf-8?B?ZWFXVTlidGdvMklKUFROQ2NYYTU4dmtvYjF3UnRWK1FOeUVnK2J5Y0pkMWNO?=
 =?utf-8?B?Vk5LOXJvT2xWK0t1L010S1FYazNRVUFJVDZCUmRqK1lhRGhUMmRqK3cvTVVN?=
 =?utf-8?B?SUtHWmJHaGRKNEU4dWpNZFVUa0Fwd1RhV3J0NXlEejRucHB2Y1NYbWFrMjNr?=
 =?utf-8?B?WWg5L3pkNlpsOUhNd2ZmTW5pUlltNDNMSVUyZHIwa2I0c3VzT2pyejdoQ3lo?=
 =?utf-8?B?bkFQOFgva3pLa3cyMTlGZS9YZ09EUTRPU3JkWkhvelM1Qy9VRm52d1BwbzVt?=
 =?utf-8?B?N3V2RnF0Mm9HQjdZdzUyZGJncjRlaVNMQzlKVXM4emlLdUZVUTQveGZhNE40?=
 =?utf-8?B?Njl4Yit5NFhCRHliWk5iQTcxVXJoL0hIT0VleXRwTEhTRW1COGFJM3pUZlFt?=
 =?utf-8?B?a0hxeFp3YVBVeGVoQXRtcWlxbEFmdlphTVZEUndXbzk3THVKTWhKUk5pczc3?=
 =?utf-8?B?RzFPbm43KzNtKzd1RVVPSGVwdjJmRThseTBHOVFNMHpJbkFXbDErbTZxN00r?=
 =?utf-8?B?MGk4ZXgxN1k3UXEzRmkrSHUybi82TjJvdzVEcVM4NUJSTTRKN3NSY1hMRkZP?=
 =?utf-8?Q?AJph4TU0v60nkM05Hk?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 395f6132-79f2-47c6-6d63-08df20858ec5
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:03:30.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4GKa5hJRPUVYcMos9iuT2bFYKICBylr1qHY2Ui5UNFEQHLpnzGC1K/FRvtBjvJ1K4rA/kk9+HpDrFiRI4a83w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1941

On Fri Oct 2, 2026 at 12:05 PM BST, FUJITA Tomonori wrote:
> On Fri, 02 Oct 2026 11:00:40 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Fri Oct 2, 2026 at 6:04 AM BST, FUJITA Tomonori wrote:
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> [...]
>
>>> @@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B:=
 Backend>(
>>>      /// Atomically releases the given lock (whose ownership is proven =
by the guard) and puts the
>>>      /// thread to sleep. It wakes up when notified by [`CondVar::notif=
y_one`] or
>>>      /// [`CondVar::notify_all`], or when a timeout occurs, or when the=
 thread receives a signal.
>>> +    ///
>>> +    /// A negative timeout is treated as zero.
>>>      #[must_use =3D "wait_interruptible_timeout returns if a signal is =
pending, so the caller must check the return value"]
>>>      pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>>>          &self,
>>>          guard: &mut Guard<'_, T, B>,
>>> -        jiffies: Jiffies,
>>> +        delta: Delta<Jiffy>,
>>>      ) -> CondVarTimeoutResult {
>>> -        let jiffies =3D jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIME=
OUT);
>>> -        let res =3D self.wait_internal(TASK_INTERRUPTIBLE, guard, jiff=
ies);
>>> +        let jiffies =3D delta.as_jiffies();
>>> +        let res =3D self.wait_internal(
>>> +            TASK_INTERRUPTIBLE,
>>> +            guard,
>>> +            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
>>=20
>> I suppose this can be `delta.as_jiffies_unsigned()` too, although the cl=
amp
>> makes it more explicit?
>
> wait_internal() takes isize, so with as_jiffies_unsigned() we
> need to cast the value back:
>
> | // CAST: `as_jiffies_unsigned()` returns at most `isize::MAX`, so the
> | // value fits in `isize`.
> | let jiffies =3D delta.as_jiffies_unsigned() as isize;
> | let res =3D self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
>
> The clamp needs no cast, so I'd keep it.

Right, sounds reasonable. This can also be `isize::max(delta.as_jiffies(), =
0)` I
suppose, but `clamp` reads fine too.

Best,
Gary


Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1730FF30
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195532; cv=fail; b=Aclk0J59/+D3kPDHEVY6pycwbWtj/0xls2h99n7IMLUm50EOGEA6brQZUDqBXy6lOR3BJK0nbMp7OYZgY4qniEvTGCbFjFov7pls0ik8KmFB2/rtMGjlxuUDB4LpMPSOslnrXf9h0f/Z/WlZ0CCvMUNQ/u/sFm05X4pckgzmMGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195532; c=relaxed/simple;
	bh=Ni5Su0I+JfWsT2CFShMg3ATHtBr39qM+bdXfAnLA/pg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YYPQHt3XzVEdoi5or7WLJkvV7e23HBt25TcY2Lbv4oNeMx16AecSjfcHekWP28+PrHUufqlsiLLxqyjUthXxfiD7aC02o4o4NPDRtVWRPhy2zhK8fHxyUzLcvCiWOOHVBFSBhLEtxB1iy1SB4qybIRfSaBuqfvKU7r1BiE/NuGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fPmlTzeA; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fPmlTzeA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHreNhhKwTPNWr2mPua1xYN+QubTFuu7eI9i6uMpKstOssffxVxmcEP1Rq5tymdeiEVUmwXAmL030+bAmEOxFOExwi/s/QQuXlkhTAhI5y14+7VMgRkfw3qNORmdQ/NYS7rv05jz3YYM0mbhRqmTmWlxr9KaX2tZsmVlPD7hC3bcEQDgkk/QF+S9JWF4ChwwAlY5bsmX7ogXWOZznKgU/8AUlEWO3Y3YYecxdiv2T+lvR9gjMoRT2Tm3bq47J324N4Pfrh6JOFDaLzv6l7ECq6YhGt0JaNADaAxlbiL4Qmt5O6TdgG1bcSoYP1JBdu/MsPeik9gdZFF6PBFFaJC0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbdhtq0usgmWFi3RCxLkZzn88WiaRoQrKniI+wy3trY=;
 b=fsfukOmKSm5cN/l18oNCveWusBUsriN5305+ZV4c/QXymMgXLAv9JLEEZCMkrTzP5eq6uNqQg0sHFocOFQ/9gQ0MhVTk9VWQHaDb//8adNQDS8xjIHbYBLs3IpcLcCMNMNonCJsdMPk7DeCTCzIZFbpJlTNIWkXqGRryklzqA0PPx+SaTx6RgsFzrqKJLcDzZqINw5nn+J2m53UA/phEclbCt46sagntD8V9CgHRgsqlTYZcadiqqeMg5B0q3wkvLektVh1r21TD62nDUi6akl1lKLHTEi64FvFnfeVp/X/vrZQuqNVWfZQOHNyjveDiitOCJx8+lwSDjRDuEx12sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbdhtq0usgmWFi3RCxLkZzn88WiaRoQrKniI+wy3trY=;
 b=fPmlTzeAxLJgXjvlqU18BfwbVf5h2l1Q8i2VfH07xPeXPPB4/jzFOzDFa9LUMHzj3IP78WBX/EIXvkrlQ2zXpRxyxa4cjDIDQ8NAeHmKgh+syZhjOmMMPW4Y44JYEX983oRbGLkjTuh5+uZFapoVYGHa7hXDkmL9i/1JpG4AnTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7806.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:32:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:32:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:32:05 +0000
Message-Id: <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
Cc: <ojeda@kernel.org>, <dirk.behme@de.bosch.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <frederic@kernel.org>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "FUJITA Tomonori" <tomo@aliasing.net>
X-Mailer: aerc 0.21.0
References: <20260226.215052.2040587083248816676.fujita@bee>
 <1772111941.36504110-faee-4088-a465-c0faad81a43b@kernel.org>
 <6ZuBTDotWZ75XfiP0PdEZNqM4Xg1prviuRKstdR1zcM56HCe4_7IdUT0APcrVZ3RTSNHjVqI-sBXgWdE2qjI2g==@protonmail.internalid> <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net> <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: a3fc1051-b1f6-454b-1e27-08de75fc3771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	s9/ZVwnmBLm4BlzsYyBowbtNtCIZ4XUkimgDfSZ4ONc4aPQckYZ002jRyZjTY/m70Iv8L4FveUfK3AmZ3daj56n1BRkT843y2P8nid8PjCzCC7Coen+zcDhKQO88OTgEKX1si1O8vzNWsmRnfHf5Cl5GThfjiPcmx7Jxo3rNwWWKv2WaXXLvsOTajA+j/xITQQKK/TYuzGOYIdeh0zMubWpeVUK1Ulpc+mYLEm4ANadht2IlM7rL2eYprityAzsbeNsKgNl9CcvA6aFfc7ZSdkBcyQv+6ArvglVC3IoYOCjN3DdS96sElwY7x5uhdCKPWZyF3yxkA5KLbWAZbRqpw5vghFI48cqjHoEWae8twiJu2QzpCNptdCu3waEliSAT9f7AA+HV9HhxYVMNHJXANDsuQgnzzxmvuLTBoVjiFjeZ37k+JoFYH+pK9oIGxqr+dWDiAJNbulS2kGbXT4SR5nuS2aCPo2+FO5g0OuKuamDgGg8aH2kg4jaY276JMqaorMD+GuEqPLrvuYAiCnOUCjVYCRoqIcxq/+4gvI7Vl9panAS8CbDqMj2168z/qyBtwj2hzo9h257R7Ev8uI4djEi55ZauQUIjzWp+2296V2/zDOGNu+Q5ArngnoSG3202DexLN6S2238qs712wUXsi/9xsvDpBo7GeCUkEOUmi/2wz7Yq7y7NSrmjqijhCdwB4XeMIyYccOfFMHcbdqA1P7Q5MPoKEe0mYmY/PzVkRUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NiszYUhRWWZYSEk5NlViTTNXMDd3UXJMYk5QVWZMZFArb3FYT1VsODl5U0xY?=
 =?utf-8?B?Z05JS0wyZ3Naa2txS25POGZGK3B4SWk2b0xYN1VRUDBOcjVySSs5VU5rRFE0?=
 =?utf-8?B?a3NNRlZ1YnZlMXhJSzFMVkNXSER6TWdSTlA1c05BangzRlZ2eUJxZ3phYUVz?=
 =?utf-8?B?b2pGci95eDhwNDIvS01yUkZkZ0ZzeVZsNDZPaU10VCt4Smo4dzdPU1UyUXND?=
 =?utf-8?B?NHdQZTJRMDNJZk0zQ3Zhcml5WlBnYUtabG5zdWh5MWw3UWxDOFRlVEVRUGt4?=
 =?utf-8?B?SHZuWm5DbExlVXoyYytWZWxILzAvYU9DUlplZjlkTVJaSnhFUE16QWwwQ1lz?=
 =?utf-8?B?NlhoelFhMjRvaHpqdnZ6ajdMbENDcjlxZ0xZOEM0cUZ1Ny9qTkZQenRGem5v?=
 =?utf-8?B?VTE5RU45VkhBbW44SUdTUEFSMm5rUy9NK1VQOGJIMmNKVms4QXdhL2VzQUQ2?=
 =?utf-8?B?RDZ3bkF1Tmw0Q2NwUGV1S0l5SlcwOWN0WDBzZmIvUHhPajFZelczbTR5dHNv?=
 =?utf-8?B?MjRrc3QzSi9vVjIzM05EenVKN3NGWFcrbUpqUS93bVNGYVdaT3crYUhoMUhF?=
 =?utf-8?B?dkJzME9PdEdoYlhwNGtOZ2dKOEFSSU9lZlB4ZUxzODJkejNYNTNEUGxzRGc4?=
 =?utf-8?B?NGJXWEJTRTJrUTNqN1YrUjROQzQ2Mmtrd3FWT1BQWG02aE91bTYrSSttVWlv?=
 =?utf-8?B?bHJDbmZIQjFkeGhSY1h2ZG55KzArSmJoNmQvY3A3d3VoQW42VlY0RHBzclVn?=
 =?utf-8?B?MWtOZWszT245czR2cHBwWE1Ta3BocldPTFFiaWU4Sk95Mk5ubkNiWkJIUFRL?=
 =?utf-8?B?Rk1hOEtGWThvMU41d3dwODVHMldNc0gvYmJuSkV0L1l0azQyTUxlK0lnb2JW?=
 =?utf-8?B?QzdoZWJJMkN2R056SlJ6U0JaMFNsYUdXaUtCZFNaMkYyb21MTGdMaTNFSkVK?=
 =?utf-8?B?UzZ4TldWampsTTBCeW9QZ1hodjVrMWhiNC9GRWk0OFpZbkZEeHBRMmN2NlM5?=
 =?utf-8?B?dW15ZWJ4emhJS0NoVVFrMlNCQnJnU015MTU5OE55NjBISE01UERGYi9vanB5?=
 =?utf-8?B?Ymg1S3pOK1lnM0EweW9FcVBaWWtoY2lXTHNMR2ZNdkNmVklwSnNuOEVrS0lm?=
 =?utf-8?B?Y0FibVdpbmQrc2hYOGY5V0xDTkdUY21lUjZkcy9TbHh5S3RHYTRXRStpczNQ?=
 =?utf-8?B?SDNsQ3QwZUIvcnNoRmhIT3ltekpaeU9ZR0JZTU5oN2I3dEpZUkxrbzdvV01W?=
 =?utf-8?B?eFBBQW5HVEFDWXBQT1c5L1VOSlhRK1FXblltMXV1NzFSbTJKOEl1WDdyU0c1?=
 =?utf-8?B?OGdiSnZkaWJmNS9JQTVlY2Y0cG5oSDFPSlJiY0VjalhXNXlFWmtXbkJraGxK?=
 =?utf-8?B?YXhEaWhESjdoVU1QNG1oeGNUSkxWdFlDcmd2c1E4N2FJRjhnMUt4bnFrZHg3?=
 =?utf-8?B?TGNhQldvUURwL3JaTitMQUJPUjBjMHJrdDUyU3d4N3ZCT1VGTExQQVo4QmNj?=
 =?utf-8?B?RURDZmR1ODVCYWFFNm5TZmRsUVkxNWxyTU04SHJDK2xRdDBsNzFHTEtnRnJI?=
 =?utf-8?B?K1NhaHJLR2tka2N3QjlDK0djbHNOdUgrcU15NDBBaU5NWGpQRTBuZlRUeFRY?=
 =?utf-8?B?UStSaEcxY1p6eS81TDdYRTdsNlB5cTNkd0wyOG44c2g4MEpSYlpYVVVjMHo5?=
 =?utf-8?B?bFVEQS9mVlpRS0I1WGlESnMwZmxVTDh2azhuYVh1bUxiK05ndjM2YS9MNmpy?=
 =?utf-8?B?bDFOVHRWRk12cFdFVEpMRGw3b0FjN01aWldBYk95M1RIMk4xRDNCcTd6L2JC?=
 =?utf-8?B?dVlXczZBT2pDL0ZyaElOOGpkS0NhMUlrTm1lV1I3azdCQnpZSUxLbE1USWMx?=
 =?utf-8?B?S3h1cGtKS3pBVDNwWG1Hc1J6dFE1SVJ6Sk5hYktGbmk5RFBVU0EzUi9weGYr?=
 =?utf-8?B?T2hOVXhqcW5GLzlrU2dQdXlHdUJXdVpEWXF4RTV3Q2diTmpoYm0xVGRtYWlS?=
 =?utf-8?B?VFpJTG9hcTR4elcwN1VjK0JnZTA5eHBsREl0NzA5cHFiZHJUeVp3b0NPeHZm?=
 =?utf-8?B?Nk1qTCtZZGRSdlo5eFQ1ZTVJSERGaEpxK3R6cFRkRnBiaVlBK0krbmFPN2JH?=
 =?utf-8?B?UjhrVmN1enNPWVMrbFVEU2RJVjhoM3NWNjZUVUlkVTBnQWVoQUxMT2xOY0J2?=
 =?utf-8?B?MWlvOGsyUWRwRmhpVVBVWTAvQVV4d0pvVEFzdGhqajlhZmNObjYwd0hNWkVm?=
 =?utf-8?B?WWg3VXU1SDM4R0tOajYxMkJWZ1k5ejdUVXpTWWNIVzQ4c29qM2ZPQ0FJUUlp?=
 =?utf-8?B?UnBKTUZWbENyL1IvemlYbVJzWm1TcW1QbmNnVDZHSDNwOEliNk9Gdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fc1051-b1f6-454b-1e27-08de75fc3771
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:32:05.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdSKw3qBLwA5xWeuotyTEWHCloj/6H8qdjMFrF60unxIUkszFaYjaUsfWm5J4Nf4C7mFwRYXvapl7BdQhrorOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7806

On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
>>> FUJITA Tomonori <tomo@aliasing.net> writes:
>>>
>>>> On Thu, 26 Feb 2026 11:42:39 +0000
>>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>>
>>>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer=
.rs
>>>> >> index 856d2d929a00..78e2343fd016 100644
>>>> >> --- a/rust/kernel/time/hrtimer.rs
>>>> >> +++ b/rust/kernel/time/hrtimer.rs
>>>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, inte=
rval: Delta) -> u64
>>>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>>>> >>      }
>>>> >>
>>>> >> +    /// Return the time expiry for this [`HrTimer`].
>>>> >> +    ///
>>>> >> +    /// # Safety
>>>> >> +    ///
>>>> >> +    /// - `self_ptr` must point to a valid `Self`.
>>>> >> +    /// - The caller must either have exclusive access to the data=
 pointed to by `self_ptr`, or be
>>>> >> +    ///   within the context of the timer callback.
>>>> >> +    #[inline]
>>>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant=
<T>
>>>> >
>>>> > I guess the signature of this can also be
>>>> >
>>>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can re=
move the
>>>> > first safety requirement.
>>>>
>>>> Thanks, I've updated the signature to use &self.
>>>>
>>>> Andreas, this breaks the consistency with raw_forward. Is this
>>>> acceptable?
>>>
>>> If we do this, we get to argue that the NonNull we have in the callback=
 context
>>> is convertible to a reference. Either way is fine with me.
>>>
>>> If you change this to a reference, then I think we should rename the fu=
nction to
>>> `expires_unchecked`. The `raw` usually refers to operations on pointers=
 rather
>>> than references.
>>
>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTim=
er<T>)`?
>
> I assume you mean `HrTimerCallbackContext`.
>
> Could it be a mut reference? We are supposed to have exclusive access
> when we have the context.

If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
`HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to the ca=
llback?

Best,
Gary

>
>
> Best regards,
> Andreas Hindborg


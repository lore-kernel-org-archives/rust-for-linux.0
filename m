Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022088.outbound.protection.outlook.com [52.101.101.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976A225F7A9
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772283736; cv=fail; b=MPvMv8yvKiy0vT+MHiYDiOJO6xRZFHynfTVMGKPXc98X0rdDmEJYhHWDMosOD+UBMhySPI+WoBg+SbCTcU8eWqKD8/vfXSq7idb1ISjMzrFVt4c2Tfsf/Eh56Vnl0ZMtdI1mv+ziijgvDqWJMsmlaK01qU/gTUpMdaSHTDYwb8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772283736; c=relaxed/simple;
	bh=hfwJTHIjlfHL4N9ka9nYW2msoSsJYQJq/HpLMqb3lKc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rw1mSVoj5kuCtHIp1wl7lMvra0140xU0xM58eEN77/FxcevKy53Vh3WXRrvWFzRXEwuAIEqIrjR858UHaI1U6Pc8edH0VvZ9MteOvpm9LOnx5irwRzXf7IEuwOGo/RgawJe0ifOBZLyUmKCFSP2J4O12ZcZbbQmigyCB3S5eTZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qPlIiiLd; arc=fail smtp.client-ip=52.101.101.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qPlIiiLd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlQswFhWEdzkRl/kVufdCeDgpNrYm3/rjNs0fmJ3pg55iYG+VQvANIJZH6Fwi92LkS0iGJutxp9gtUnxsdPWnNlYiX9hQQCjqO59ge6M40kpuKCjcWNK9L3KbqbDwTYw9GxL1HBvNDOreV5zzJI72ApJYg+wdWMh90f+4C24DH255JFRqzxRAdA8OaequcSM1OYzOhCbnmwu2ogKH6LXmNlmkf8IFtbDlJwzbGX4rEr7d2zTVqW2WPzBiRRbTMS/mJp9xBnPTkfYmfrcS56jPRoYhb//zsMvv23vRdxhAAumC07pAmBr7o2bI8O8NEuX2iMj6qtcFVtKaRcOjHTUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfSnV91zT4riCBDOizZCGmmLJ4P+yHQ5sBhTXpnPPHc=;
 b=Er47DkubZ3aH2kAMm5p5qpcOO38gvba4DYR8ikLIGIhEhIUrFOeoMPw0np9NKRETaYa0kMC1dN07Co5VX0+fpTJ9ayEXIPjIH9AwCBk+BPWCQp5j9A0S8w+qST0IV17Pd7lutkXpRg4TD+jDRL3bPtpESMpxpzut8jM121T0jKHdpmOBXteFIrqLdsYiOKeOrQc+3zJWvmMrgUJYIpcYDtj3uTr+12yVPoyz+jMIVyhKfg7ovEv/oj2GmKoTipzGqUG21O1BeXCeJUtot4DncCRu1wUQ4j7aU0VkBrwBQQMjEhmWpPJ9jvsI2SN08cyjfTiBPDduwRVgrAiQ2seJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfSnV91zT4riCBDOizZCGmmLJ4P+yHQ5sBhTXpnPPHc=;
 b=qPlIiiLdwdP++wS8thi2R3WlPv6S9IX7mTmZPjsEawXIj3JgpVDC7ZNEtIb/viX+aI05aqIW+/qJk6bZjIhVanu0+LOw6CQvVWj41L60XNPawesY8jDG30+KObrvX/FfvZSShu3Mpw7nbCBD+R8VPjWT++5gyPIdZwshUoPJNJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3138.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 13:02:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 13:02:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 13:02:10 +0000
Message-Id: <DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
Cc: <a.hindborg@kernel.org>, <ojeda@kernel.org>, <dirk.behme@de.bosch.com>,
 <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <frederic@kernel.org>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
 <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
 <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
 <20260228.102641.702865761508670909.fujita@bee>
In-Reply-To: <20260228.102641.702865761508670909.fujita@bee>
X-ClientProxiedBy: LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3138:EE_
X-MS-Office365-Filtering-Correlation-Id: b6acc728-0f85-483d-331c-08de76c99625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	UT1aLKKW7Ib6wPEJpQn0+msvSB2srBdqY2WX6Wo4fbSnY7i95QOPaJD/3JJVl7svPJxBG13//RjaAKyHRX0G7Oht7asNX07AN0TN4YGTLEvy25tR1OZn8XdtTaIbBwv4XUuCwlphlqPhXE6YY011jEzJjnb4vXkX/29ERV57TdKg/zgtSzeGIxK7R45A+0dzUU1tm/uGwnnJ7pW6/edIqCTfSjfpEqnYJO1XXfMsydxPB7avwinocApLdC5q3gIQHWK7AzGKrUFe+MOHquJT1/YFsh0+1YGvfDlHH67CsgFeJhfDlrrff4ohcKu5IwXBx8oVCXzRScDjdvrUzUoXCjxzlBuC5z16z/XTFLh5IgoutCOUa+dch7596t4JxDTv9om19n20gOr6DA/N8Tpv5sMvTXV0fxd+4ntTkW4eG/ynk6KiBcDlpLH+aFQmavH2X08THG0Opaotk7WTSXu7LizEvG052SsExBjk1GzsjulCY7W/+hsuT2neR8rwVs4gZj5SAtUN/pzrxxDBJVmqiK6M+Cj5J10dfUcHtlxxL3dsJdhRO6eEGagKAIKTsS5zZQL0/qR+d/RsyMfVw62E2qbIG9492G57qq0HJ3fQeePjtpLHox/x494E7llExzecnskjIUz2o28PELfahfKv3flknF5vdN1nZHuvdVre162dC48N9tLDYRm3IAEjIanNaoa8ZeRs1y3GD6uF115mNnI3cBmS7WR4LPsphs+aGlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2s3dzl5N2tEQUs2d21ibFpGK2ZXYkwxUXIyYlBBOVZlcTN1NDI4QjExVmIr?=
 =?utf-8?B?NkF3SStRendVVXNEd3V0Zk1CV3B0VVBMaEZweWdWTEc1QzBweHFFZ0dXWXov?=
 =?utf-8?B?MVNoa0pvQ2Jrai8vVGIvcTUxK1lHM29teFVTbTlzT3NRMWNaTmJ5UWdZcFdm?=
 =?utf-8?B?NkU3NHdVaEVkS0Vndm0xbVo0SmplT1ErV2E3Wko5d3MvRG11NkxtRWw3SGpx?=
 =?utf-8?B?Sm1Cdk9VWUFNY2o4VHNKSnozbDBNT1VJWUdvSE4wRlowNEp1ZGdDVXpsMHJF?=
 =?utf-8?B?Z3VUc1RGa2tQTUVSZEFCdHRjVGZnZENmN3dpYUs4VFlzOUFmUi9RTkFuMzk2?=
 =?utf-8?B?YkFlM2hVLzR0OE9qdi9LM3N3RnRUTWhmakwzTUVhbGFZWE1CWEY3TnJ0NVp6?=
 =?utf-8?B?YjVUSVJYRXdEUHlVTkJUUitpK2hJczg1NTdxSi84aHVDV2JjS2xmWFh2cVBl?=
 =?utf-8?B?clkrN1F3aUpPWmFMRjdVakVtbFkxYTdQalhMUUZHSUVLUXRxWjZXQ043N1Rp?=
 =?utf-8?B?bjdpblV2Y3pkMmNFRU42ME8yUGZIYXhkMWV4MU9INmQ3UU1QelIxZXM2UVAy?=
 =?utf-8?B?Z285ejJwK3o3WHRLUHFRMDA1eFVvMjdxSkV2UFpiTUs0S1ZSSFFEdHZzZ3Vw?=
 =?utf-8?B?MXJ0cU9CUHA0eW9lblFhSjYwSjJQbFZjR3MrRUkxVmJMZUM3UlpxR25vWWFr?=
 =?utf-8?B?L1UvYWdJZlVxOEJ5ZXRmSVM5QmtSUFdDZWw4UHRTWnZhUElKV1RqcS9lalFK?=
 =?utf-8?B?QkVtQjZDdFBzM3N4TEJjYkdLM1RyMzluZVU2MVFYR3Z1UnF5V3VTVlBNTk1D?=
 =?utf-8?B?QmJoZU45RnlzMHFFcjh1NEJKWm9JSVFPR091RjJ2S0lCWkpKUEFad3FKbVJs?=
 =?utf-8?B?NU01bmZ6cUJidC81SGsyeU8rSE1xNytjc1Y4UFpMNTI3MURUazRxNnJSRjMx?=
 =?utf-8?B?NmQ0TGhLYVdIc1ltWGRhQ2FRMnZvWk5qSUNlTzFkOWlHYnR4eTJ3Q1ZiQ1dE?=
 =?utf-8?B?T0MzUC9GdDdQa2RnaDlHYlE1NEFScTdEUmp5YkVmS0ZVYXY1bGV3RUdGVFNu?=
 =?utf-8?B?bUdiWWtNTlg0T01OaTFOM2Y3Mnc4YmVPbWVPcHZNWFM5VDROdVEwdEtrTVBa?=
 =?utf-8?B?RWpadGpHM2IzdDlGZHFMaHVzRnpucUZ0RmMxTyszUTZyRW9TK2ZrSExiOEJ4?=
 =?utf-8?B?cTZGejRCSmozY2FSTEZMZnJBYnNMbVRxQXBsVW5tcTJVVTJIQlg2STBxTmk3?=
 =?utf-8?B?ZWhmejdObi84dFQxWXF5Zm5qVGtjRmMrRnhBb1I3ZTZNM1RGblp2S2ViN0J0?=
 =?utf-8?B?WG02ZUVyR2tvQXlYcVV5dEhTNmRCRWVlQzNiWUdja3FUcUt4K0Y1UGtuY0Qw?=
 =?utf-8?B?Tk1LOTRZT0NFanNRVFRVcnU0bTNDSWpFTzZLYUZTMVJJWE5LZE1kWXF1c2N6?=
 =?utf-8?B?aTNNanFuVGZ1cXpCdHQzcElPc05uYld2SkQyMjhHWVR0MHgwK1NRR3ZBaW0w?=
 =?utf-8?B?NFhIOUlKekNzWEw4c3RoSUlBZmFUOTJwcGR0dnUwdVZWTFc1N3BPMzZQd21m?=
 =?utf-8?B?Q1ZYeTIyR2FQUkxkSlAzc0Fwd0pJb0NwaTNjNDhGbThIN09EWllibFNnTFpz?=
 =?utf-8?B?N3lwL09zMEQ1dGx6K3dqSmFOa3VFQmtwSGp0a3NuVGdCczREWWYyUFNZMGdt?=
 =?utf-8?B?SlpDRk52cWx5cDh5b0V0M2xSMlZDQ0VWYktHdE5hV1IvaDRGVktNKzk5Q1Nv?=
 =?utf-8?B?U2lOa2dCOGl0OFArYWpnVzVYTUpzQ1MydVJGUERzbGdIeWJFRjNsQjdrbmpL?=
 =?utf-8?B?OHJ5eW9ja1lPWUQ4UE1BL1FJSGJOdVBseE9YdjFiQ1BrR3RzR0pYQmc1Q0Fk?=
 =?utf-8?B?QmRSZDIvdDFNWUZkVXZNTk9UcjNabTJ2aGdIRzRNaU5BNjZTTXM4c1JxT0Zv?=
 =?utf-8?B?V2RNemlrQWxkZnMwdXdncFl5TVBBSWgyRlVPeGlnRW5tWDhaMHFqM0JQNzJ2?=
 =?utf-8?B?QUpWcjFsV2N0WCtENWFaa2o2TjVob1ZRR3RaaDFoaVpCVU5JSVV3VFEyZjBW?=
 =?utf-8?B?MytzbXVtQk5xeG1adkVENFFyNmtaa2M5RlBpSjRBNHhKSEE2MlgvUWExb21G?=
 =?utf-8?B?eWxuV2tiK0FVNXVzNFVnY2lkMWJGQXYyZU1DbDY2UVVqazF1dHRwU0k2WG5n?=
 =?utf-8?B?TDR3UlAxVTRieVIvWTB0Y1ZPMVVYenNuMXIvQzlyZkQ2QUtrUXd0Z2dzbEhF?=
 =?utf-8?B?V0JYUWdZdFBCM3J5WmNzdTltT1lzZlVCYU5xZkIxL2NWUVBXSmFwUU9pdU4y?=
 =?utf-8?B?d0Uxd3FOd0ZTTWVqRnlRclhwU093c3RRUklhK0RhQ09DQ1lGa0E1QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b6acc728-0f85-483d-331c-08de76c99625
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 13:02:11.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33BagT7j0LfylI7iM7f3OkAJjyLsd9a+jpyaAXzmvFUAaDkq4wOJF3BQ9L/ymPFxpuRsHh2BlTBBBTPmK81IrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3138

On Sat Feb 28, 2026 at 1:26 AM GMT, FUJITA Tomonori wrote:
> On Fri, 27 Feb 2026 12:32:05 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
>>> "Gary Guo" <gary@garyguo.net> writes:
>>>
>>>> On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
>>>>> FUJITA Tomonori <tomo@aliasing.net> writes:
>>>>>
>>>>>> On Thu, 26 Feb 2026 11:42:39 +0000
>>>>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>>>>
>>>>>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtim=
er.rs
>>>>>> >> index 856d2d929a00..78e2343fd016 100644
>>>>>> >> --- a/rust/kernel/time/hrtimer.rs
>>>>>> >> +++ b/rust/kernel/time/hrtimer.rs
>>>>>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, in=
terval: Delta) -> u64
>>>>>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>>>>>> >>      }
>>>>>> >>
>>>>>> >> +    /// Return the time expiry for this [`HrTimer`].
>>>>>> >> +    ///
>>>>>> >> +    /// # Safety
>>>>>> >> +    ///
>>>>>> >> +    /// - `self_ptr` must point to a valid `Self`.
>>>>>> >> +    /// - The caller must either have exclusive access to the da=
ta pointed to by `self_ptr`, or be
>>>>>> >> +    ///   within the context of the timer callback.
>>>>>> >> +    #[inline]
>>>>>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInsta=
nt<T>
>>>>>> >
>>>>>> > I guess the signature of this can also be
>>>>>> >
>>>>>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can =
remove the
>>>>>> > first safety requirement.
>>>>>>
>>>>>> Thanks, I've updated the signature to use &self.
>>>>>>
>>>>>> Andreas, this breaks the consistency with raw_forward. Is this
>>>>>> acceptable?
>>>>>
>>>>> If we do this, we get to argue that the NonNull we have in the callba=
ck context
>>>>> is convertible to a reference. Either way is fine with me.
>>>>>
>>>>> If you change this to a reference, then I think we should rename the =
function to
>>>>> `expires_unchecked`. The `raw` usually refers to operations on pointe=
rs rather
>>>>> than references.
>>>>
>>>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrT=
imer<T>)`?
>>>
>>> I assume you mean `HrTimerCallbackContext`.
>>>
>>> Could it be a mut reference? We are supposed to have exclusive access
>>> when we have the context.
>>=20
>> If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
>> `HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to the=
 callback?
>
> During the callback, ArcTimerHandle still holds Arc<T>, and the
> callback receives ArcBorrow<T>. Creating Pin<&mut HrTimer<T>> would
> cause aliasing between &HrTimer<T> and &mut HrTimer<T>?

This is fine from an aliasing POV as `Opaque` cancels the noalias requireme=
nt
of `&mut` already.

As long as we can guarantee that no method on `Pin<&mut HrTimer<T>>` can ra=
ce
with methods on `&HrTimer<T>` it should be okay.

Best,
Gary

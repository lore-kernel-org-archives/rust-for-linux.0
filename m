Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021109.outbound.protection.outlook.com [52.101.100.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DC3A6F14
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269695; cv=fail; b=atm4OOORxAuvYQg0Lx2DZoN+FAX04+EQNYRioSSVcL9v+Q/jUeosY9IH6T/mUv4kynPtEvkk1wfdmu2HCV75aRYYqeyhd1asnrXWP2N4sqJDyMtcVK2KDndd+N8cUcHXbr8kCYXcHyOsecVGn9IdXJ+bQzHY4V6Q5Kgze2DYxjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269695; c=relaxed/simple;
	bh=UwiNtDBuPucPzZn3U+SCULHNkdm4Mr0+8O1wYY196Vs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=CMn50LzG3p2J+GqKH+bx6HzCOLHpChUtscOoiTdsUflQGHmEi80fMo4yGF1BfA5yS03ewJCPHXi/r9WNYlis3G7oS7CdwCbTfQcmsNwyoxnRgUA9zQ5whnE/ia7oJBNG5rwgwbKF+UEM8SmkdDlBc0ZfVw483lhyr1d73vLoBsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=k0LNAQka; arc=fail smtp.client-ip=52.101.100.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="k0LNAQka"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vja6uUtp/u2IeMTItbJCxLO3t1o+sz0Vv9+uKpnS+iJwSmlPbdE7j+h0BSkw4U2jHDe99itDZYdH9dYxAjA08DPRe8AmgvJLZDWnonAe9IOfH46xVsKLsIa4DQP6owJYUHe2VY3RJcFRoNYmcKEqxCRMCruLxHWA35bgqMzH9I5yPs489jkdhmzF7Qb33p8VKvRLBjC5fAgH1qEXUF095phFtA8WVQecetoykujn1NxJqvupM5SpXC9HAQYhmeaTTEEGgf+I61x/8BqQO+ok4BeDRzZHbL3h0t/HvX7odNaMPE4yegcsO8T5msd8c6iU2Gok+JXsVigEDxCSclfRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJHQdNM+IWQMNoj6ml9mmogOuXmTa2zUNSc88VTcEE4=;
 b=nX/bXvQA4MKMpRf5NmnKt0PkDV3oy5/AYkjl7Vmxx/FQ8i9SsDU7i7dyhK+7A8m4FTS19KMDHABEi6nK1ZURNgRBi2BzYQ71DYOA3EmqOHDsUJLs0YvAkg89e11t11z5D/YlxVOTwZ++8Y6W8VOAxXB30LQo0eFQ68UR5JwyjHJQ0FBBcHvdPBpW/oZ2evq3HMaeZnSKpVsPSx8x/0CyOIeXAHxrKZ1ljJ9BYph62lgGChMxGJhSsmmqZ52Zgss369mvaAYhqTVy2L0YLCBtrvDCELXhrcCADMfILUTJK0M9Yq81s49dNl8ZFBtsNi1S/8RPbXQ/4Sd1MluGWDd+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJHQdNM+IWQMNoj6ml9mmogOuXmTa2zUNSc88VTcEE4=;
 b=k0LNAQkaw9mto4+W8QdVooIVh655J1Rw/VIhMSXX/admYdZ09qhC8HiT68SV8zlW+lyerI6/E09fiGg2R6eHKBsg5HVKjZPZ37R8D88/IsTH90hCwqxe4Pxu6965GCmiAa1bFWs2NXLGDq4ik/FPR8208EZ8qEDvV3yA0IJY+mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2685.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 12:41:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 12:41:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 12:41:30 +0000
Message-Id: <DHA643CROTOZ.X3N2KZKS8HB5@garyguo.net>
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "FUJITA Tomonori" <tomo@aliasing.net>
Cc: <ojeda@kernel.org>, <dirk.behme@de.bosch.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <frederic@kernel.org>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.21.0
References: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
 <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
 <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
 <20260228.102641.702865761508670909.fujita@bee>
 <DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
 <87ldg0m6rp.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ldg0m6rp.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2685:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d650299-dbf3-4c92-1423-08de88d98256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kaN5MAVpy5oJf0J4AR6PjreNWJXI7Pp+6yLSLY0Hbc49QW2iWQ/TrR2/Hv7YRT9fmNkmwGUuTlYqxxbLxG2TP++h+h3pA5Jlk1vPVOrH/fbJF5T2fBfy+qjCE7xkYrIW2s38OzXr1pp+MvaBfR7cun5YGQ4Jsn1WD3EUkWfr5zFA1/hHzU1ecHYPQlMvZ7xeCNhJARFb1MZGqhPl7ckkjcYSOBS+S1wa/h38NxpKqLqKiP3H/W+A57iv86w1ydeBug38DkfL/LsRi8XAmmrwuHv0zbFiv10WNrebBXIMYSiT0WWDDSS8qs9LVgUtjLCUmYlEGXW4FituijCLwFDG8YQTSf2R1sRF+fudbCSuy8vuRMEYNYmswO6MMxJtZzjsphRYSz5Gne3ZBwufLEKdgh/ukFO/MRYLI75uoL8RyraN0eNYoL5hHeH6o4irETwDE23pkr9Y7dT7/7+scya2tKib6aRO++IB4sx9g5CID4MLFH1tyhDriPezNd7oRzAc03UyB4uoegpAiF0q69rElGUfUA7mrlpey0bcKxr1j0t8HTnEQiDNgeYjQDcV+5Ffr90mcZym1imyFRtIDxcrEAIFZ+sERLtdW25e9MwP9xs0R9ATKwCcb5diufbNCr9TKLYxaqJBHH/OALY1KmB1CTmdbXUqtkB8azdSB4bDtHeIFVhXD4v58o45CgyaHt6i0P5MoyDltdQdAub9cI3k2gFS1xOx1rhvXuMoFCwENhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajMrVzkzcmhCRDNSSXNFVDRXZUFqY0hUQzBGM05ISGZ4VmplUFNhdm9URmZ6?=
 =?utf-8?B?V2lmVHlNc01hSmdiMW1IcXpWOTlQU3lwMWxNQS9iU1dtS3VXNG1GTTQ2QkZ6?=
 =?utf-8?B?L0pjSEpiQ0NSc1VRUWgybDA0SVcyK0Rpd1pvd3g4UTgwOFovaHpJS2RyaURw?=
 =?utf-8?B?TnBYMXQ5T2tGejdOd1FQWHNobXh4USt3V2tHd0NaR2JQblVsb3ZvYmFVOTBO?=
 =?utf-8?B?TFcwRDdDNytQY1YvRVlPZlZiTE92bzlVVnhZUEQrYk9uUTNISldsY21aY0pQ?=
 =?utf-8?B?K0hIN3IzMnYrQkREUVRsbUE1bSsvUW00NE5GQ0g2MnVBQlpyZjVwRCtpZWpI?=
 =?utf-8?B?WnIzNEpKcXJWNVVSQnd0U21QbUxVMm9QZlFROTRpZEJzbUlBRHVweHhrTnFB?=
 =?utf-8?B?Rk1vd2RHUmVzODlGWW14cTR6aTdaZS9SSGpLNzIvMTRCMzB1OFZFQ2tZK2V1?=
 =?utf-8?B?aG5lQzhvVWREdTlEb2xkQVhYRDlodHc3bGREWXlXNEprOHRPMkQzNW16QlhN?=
 =?utf-8?B?UTNaOHBGdFU0c2VWUms1NWt5UmlJcERKMmZUNXF6S2JtdDdMNzc4VHV3N3dz?=
 =?utf-8?B?SWs5R1EvbE1SdVhPc0hhR0NWcmV4bmIxdzVRVTZJbDhOM0hueXEzTGtzbFhh?=
 =?utf-8?B?VkNGdVFDdmFMR0w1SDRyd3VseVcya0RUUU9BQ2J6NU5aRUdDK1hpTzNDNElR?=
 =?utf-8?B?ZDdmclJGeFB4YVhXeVJLSThydXNkdVBxMDZmdXhheDJsWng1K2ExR0RJZG96?=
 =?utf-8?B?dWZMemtHclJLeEIyUWtKMDBvWEk2em5ZRmFzTlFqbWRJbmVTLzJ0MG9URGpz?=
 =?utf-8?B?djNQclpsSjFRK0dEOTdqR2tiaG83MUdMMlJobHlCVER2cC95bjhjdHF4V0l2?=
 =?utf-8?B?SHEvNGxDemRoYzBUNGRGUjJmYWVzSVdwM09mU0lqeU1BNXQ0dmJvOHBLUHlx?=
 =?utf-8?B?ZFJneDRwMWxieFBVK3I2M3lMUkJYVFh5NUVEQ3huSEVBS2xPTFh3eFpnSWZ5?=
 =?utf-8?B?NmtBTmNJbnhhaFFBcUsvUlpRVlZobFpsYkVDVjYreEwxOHlSNzdhWWRieGxq?=
 =?utf-8?B?eWNsMjMvc1JZdXNDWkd0WERGMUNmN0I0SGwzTVNkempUM2xyNDhnR3lhOUxn?=
 =?utf-8?B?ZU52K2FsZ2xZQ2ZNYnRiL0xocVBOelg0QUdHanFaRHJ1THlxUVVjSTdWSTFl?=
 =?utf-8?B?TFpxSHBCMGtaN1Y2bFJ5eERGZ0RXWllRS1BSMGNodXl1RXl2cGRUV05VWHQ2?=
 =?utf-8?B?SnE3d2Z5Y2FNbTJEWmV6eCtCamNkMlFWaVB6UzhKTEVWOWJzZ254bXJibTFx?=
 =?utf-8?B?K29yYU5GSHY3NXVVWHZVOTE1WWF5WHdFSDNiS0VSSjZabkp5SnkveGd1Sity?=
 =?utf-8?B?Q1VmMTNnbXJtQkNPSHVSci91clFjVnA4MnUrQlV5RnJsSW1vM2dnRE0xR1hw?=
 =?utf-8?B?TTN4S1ZOVU1PTmptb0dibEtLQldENFAzcy9kVXB3MTNqVUV6Q0llczVUVEI2?=
 =?utf-8?B?dXNaWDcyZkxSRHBrdnh5VThFU1ZhK21qT1lzNVpMNGxVQXZCV1pzWWlmWTZp?=
 =?utf-8?B?Y0RwZ1lucUZ3VVEwQnVpbzBuckt3Q2dyeDJ0VVFLVlY0K0FaUlFORm4rRGY1?=
 =?utf-8?B?S21FMjdoVTdaWWIzZUJRR2crY1I5SnBBRDg1V2J6bHJZTHdKSnhWVTVIT2NS?=
 =?utf-8?B?WkZHT0oyYWRVQmlrcHhTeUZUYm12TWpzSXg3TUpFSDdRWlEzZ2hRVmFWNEI3?=
 =?utf-8?B?dmt2U0UzSm5MWmd4UlFQZjFDWTdZSExjMnFyYTVpZDZZVGlndWRGdzVEbU5R?=
 =?utf-8?B?U3VnbDBhTEU0MTljK0ZJdzFDQTc5amFyWlJxaVNEZFRmME9JekNOQUdKU1U1?=
 =?utf-8?B?TnNpWVM1WTFQaXE4Yjk3ZXk2Tkk4MjRxL3J6MzZiMDdiQ1U4R0V2Tk90UmFC?=
 =?utf-8?B?Q2QxTEh1djVVNlltUHN4Z1ppM0drZWc4K0FXTzdJMjNnaDBiSkI1SysvYThw?=
 =?utf-8?B?Z2tSUWt2MVFsSEFWcjRMNXRIYXYyV1hVS3RGbDBZR1dZNzc5RkNiNi9zUThi?=
 =?utf-8?B?S1Vkb1Q0Zk5oRkg4YkYzc2xkNWhXamlEaVpLMUpPRUNsd2JCSWFMRnpua0J3?=
 =?utf-8?B?Tzk0SDdNbE5CdFYwMi9SZ2NXM0IvcC9pbld2eVdmaU1MR2Ryamg2TDM0WU9a?=
 =?utf-8?B?cG9tSGNKUTRlb1MwdFVjeXRhY2RyMW5HNFM3MnpNUDNEVVZLZ3QyakpmVUky?=
 =?utf-8?B?WWlmWTZLbDhaZ21tbUozbms1ZENYeFY2SXdiampKOERzWUYzUWlYQ1p4Qnl4?=
 =?utf-8?B?WE5BaUZYUkVrZVdMa0FzZU1XNHNoV0tOU01NcDRBSnVuYnJaZ3FBZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d650299-dbf3-4c92-1423-08de88d98256
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 12:41:31.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2jhBmW/c7Q7Rd7d5gIPyCzOAi1XMabrJCLqHxrKMUdw/b6fLu/vPoIy86y15dPCAsaVRULNOuaDQymld/TX8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2685

On Tue Mar 10, 2026 at 8:24 AM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Sat Feb 28, 2026 at 1:26 AM GMT, FUJITA Tomonori wrote:
>>> On Fri, 27 Feb 2026 12:32:05 +0000
>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>
>>>> On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
>>>>> "Gary Guo" <gary@garyguo.net> writes:
>>>>>
>>>>>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a H=
rTimer<T>)`?
>>>>>
>>>>> I assume you mean `HrTimerCallbackContext`.
>>>>>
>>>>> Could it be a mut reference? We are supposed to have exclusive access
>>>>> when we have the context.
>>>>=20
>>>> If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
>>>> `HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to t=
he callback?
>>>
>>> During the callback, ArcTimerHandle still holds Arc<T>, and the
>>> callback receives ArcBorrow<T>. Creating Pin<&mut HrTimer<T>> would
>>> cause aliasing between &HrTimer<T> and &mut HrTimer<T>?
>>
>> This is fine from an aliasing POV as `Opaque` cancels the noalias requir=
ement
>> of `&mut` already.
>>
>> As long as we can guarantee that no method on `Pin<&mut HrTimer<T>>` can=
 race
>> with methods on `&HrTimer<T>` it should be okay.
>
> Is this really OK?
>
> struct Foo {
>   timer: HrTimer<Foo>,
> }
>
> Surely it cannot be OK to hold both `&Foo` and `Pin<&mut HrTimer<Foo>>`,
> even though the internals of `HrTimer<_>` is an `Opaque` field?

It's not UB to hold both, otherwise you cannot write intrusive data structu=
res.

It might be useful to think the mutable reference that the hrtime callback
receives is th same as getting a reference to mutex content, while others c=
an
still reference the mutex.

We can probably have two types, where one can have shared refs (for startin=
g the
timer) and the other is exclusive only?

Best,
Gary

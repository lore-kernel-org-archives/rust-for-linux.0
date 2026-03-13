Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021086.outbound.protection.outlook.com [52.101.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3C397E7E;
	Fri, 13 Mar 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408320; cv=fail; b=Q9wbmIR1QjHXmzo+JqFH2Ubq42Xv7bPElf35THpQtO27MTjL1JTGFGjUHtQdXGZYxhJe99QeqF+bxdybX1301Mfl3vwVC+rome8uWJIMYHQAlUtG8y9r5AofWO1dXeEJkWGVg7zEO84E0CVmKuz4vfOmxvMmhnGKsw7fHP5pacI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408320; c=relaxed/simple;
	bh=sK5IQYneRkSxUWNL2516FnIQlJDqhBqjv4/vLzylumw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=BMlWNBtOus5WxrIKhxlxcOjRbxXW3MVjMut5L1ejdmOsE2b0PSm47Ag8W0NwORPGlYtMO9Y2leISGU/8p8Uwk9nOLi0qekoGGoDy8evnAKOfzUVaa2oixa3mPJLcEJaG7yYxDXpmJGzzzBoAKQyRRG6R7tdJXvoClxuXns8zXPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ik65Lr32; arc=fail smtp.client-ip=52.101.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ik65Lr32"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2Tc6oFSUg4853hqZzeBmrK8CcdQ0EHN0M2QnPYkTg1Ux7EJxM6Oe74Sc6/mV9P6SN52rMnrQUR30VbZNNYCIzifdmYxqV2VKbZeoMx8qnH1R97TwK2WEnmODpo+sl7PLShLbLenHFf8TMSmzhZZfoPRpDjWzJKYH34LJGM6Js6svOKIiGiRf+1pAlItOcqyuqLSBH/cuMUDLczYFbNP8AS4PcNBfKz4TUQI+1dyHCivdjVGQTJ2SBRD9DYnnUIKs9lpc6UXeQ8rPpdT5Oc2eBf3hRaUB+8a0QRwygfRs7b3HMr6wI9RrrFNMvBXxHpv/hQLnNGL97cFJGf69s3qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EfpDBgnSbHKQj9kouiKumtvWN2usn7Ypts5Ui8HRas=;
 b=ahmWORgvAq1S6nzejqC6NJr02BMCrLhICY+0WI10/OUnq5dFGPep+cGgyR8BquN4n9CIN7/DnjfjVUcVl/ynSPsazweUwMYrkZoEPzF3S8IwV7KZS8u/qb6mOTv/XRveHm8wCbYbRvlWn3xyrLGheIYGEG9TLvp2xQskIl8X726vJr5xc4NgQStIF9YdYAhlqqq5QP4EUmGKNXxvHICC6U1XHu0XUWd30anOJbVj9vjK1llBEQCcg8f/NXRC/N2bTMjAFX/mV/6yRdUAveDfj/UgPomnvpneZaFCYXaWxY0Ju16QU0vf6jyA9WWADugmhl78eDQPaNc2sf3+PISrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EfpDBgnSbHKQj9kouiKumtvWN2usn7Ypts5Ui8HRas=;
 b=Ik65Lr32pNNfvLELwTqiJOsf5UWH8BVKgr78Wj7Rjm/4q31p+LEwpyoE15LEFead0GUalAgTOw41SI6R+zSgTfQz3OP6HvdGyCUoWV93deEaFcXm+TI2GSjv6rl1pw56EoxzsWcObmHDyywP+9PoLNDnSzhoqtD9EFb/Nxks0fM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6568.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:309::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 13:25:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 13:25:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 13:25:14 +0000
Message-Id: <DH1OS4RI52DR.165D2P9C5AW9Z@garyguo.net>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
 <DH0Y9Y1KIOQO.MECK7D06XFXP@garyguo.net> <abNEoZAoRT8G1Umv@google.com>
In-Reply-To: <abNEoZAoRT8G1Umv@google.com>
X-ClientProxiedBy: LO4P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f2d5f8-d536-4fb4-61c6-08de8103f65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	e6c6orfxufQe8u9tGkW4LWJPHIeM+g9cLS6h9fOIvxoINZ+Z9hR4+yfxYL3CTXecbRhKss6KjjkCEIz/9lVY/eVryQXmntQo//FAxJ3XyFPgmZEiFH9WSjGOb4oOW+p3zNa5/UUWR5oq6o9vskFFHnJ4BSXFPN5EAAUCMmRQhCDpMKKeS/hgr9Ps97YgDfkYTqQXK5kMryG+WT8WpXouoXU1lwzdejbL8v312CL7PzK86oVwXVaCwjSVXOAV6rIQ/XT756Om0RS2rsD+VIBxe5dkS9L26qdQDEofGqw6olKylNatiulHeKZohtPC1jWq2QhHvW2x5TPHzn5225dr/SfblLh4Vi4TO/nZB0L6j04m0i0BWRgdIdwTeSic5zoOmdTycUNNdeSo4YYhPqrfqtLIrNiabYqLIjMhVERSlV3jBSEdnvbHWWaXWgfkFgKZi8+yNbCAYF9qoOSB8l9Mz08BO3ZOEU+jIDH5yqU9z6V2u5bhTWnRR+DQgCOOum7QIze+LvzGBlKcg5YzHEGASgGOX5EoUe/HhTX2/b1O6PDiCivZXt8bt78QFFyPmu0eD9vX8reluRUffoz4CMuw9nTA6s1m4u6SKLtzSCyATC2duluc4JxxeAOJkgSw81HsTccl+j3n+wvfRfmp+GKmlwWTtkXn7O9YuSvIQ8HKE2nCparl0uJl4losVVTf9O6IM5HrSbiV7+bHSDuu8hGFsEBJDgKPYofW/o2szcEPqrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnRheklaSmVSTHc5bDBsQXRDRmdZUlNzMEYvd05EUnc3dUw2UlFtMys2OGlm?=
 =?utf-8?B?ZXlYRG5hbzA0djhuSFIyYmU5YXBmbXlaRUNVVGVsV2hHK3pCVWxWajY3d3F1?=
 =?utf-8?B?LzJ3L0l6ZW0vMnZpVTFibnNIVkFsTHRIYUJIOFJGbWpKMVFRTlQydE5yS1RE?=
 =?utf-8?B?Rys1Q294MkdCTGErQklZaFMwbGNFMXVoWWl0SFJpbUtZajJRQXBhR3M1Z1JL?=
 =?utf-8?B?NThacG54b0NxY0lYakpWTDlObmg5WTRUZ052cTB5NysraVc4dk0wQ0N4N0tJ?=
 =?utf-8?B?bnNNTVlmdHBVQ0Z2N3hWbWN4SzI1b01ndzczVnNDSlpOVW9CQmIrK0pxY0l4?=
 =?utf-8?B?Q0VIMDhrNmh6dnZWYTVSVnRaaFN4Rms5Z1BLY0ZMUGthYWhwUUo5c3BXY0h1?=
 =?utf-8?B?ckgzMmJyQkMraWVXaDUzRWE4RXFzNTlEOE14Nk5UbG1FZzZRblBZcVhwZ2FY?=
 =?utf-8?B?dU1xMTJKN0l5OFliaHFTZ2YyUWhEc2dUck1jaGl1dkVrZFNxZ3BCVGJSZmVS?=
 =?utf-8?B?MDIrcmdzK0h1RGc2ZkVScnZ3SnJQd25YaTBwUkp5WmpvNTh0a3dMVElFK2Nm?=
 =?utf-8?B?bVZjZ3k5VzNxL29JMjdGeTAzenAvczhYMTRXRFFxUzlwTDQ1ODIrMzNkRmhn?=
 =?utf-8?B?QmhTMUV5ekxYc01GVFZDa2w1Sm1IZWZBSGh2WVhJeVhPK09wRGhic1FweDc3?=
 =?utf-8?B?ZWNNVEJXZEZFemJLOVB3cDBRUGJCNTNEeU9sTno3N3dqd1Y2aEY3eWNnblhC?=
 =?utf-8?B?Sy8vOWN4aGwxNWFCWWUwRXZwMVVVQzNmWlZMR3UrUGQ3TkJRVEtxTnNBUmVa?=
 =?utf-8?B?eUdCTG90bWVBcFBKT09SN0xYQUtTYUN2cUR4WC9GSUcrcUJXVytZb1ZCVHFY?=
 =?utf-8?B?bXFpUng0aFRoTzlwNEF4b2JWei9URkpLemFuN1dVQUVmalRDTDZvaXA1V2pT?=
 =?utf-8?B?RnJGTWxOeFdha05qeVhSQ0x2OWsyWWxpQ0swMXpxN2tCSzZ2NGRSZzVWTDQ4?=
 =?utf-8?B?TzBIZ0JmeXVHZzFBTk4rZ1dEZU1oN2VyMlN2b0JtZUd0MFFXMnBMS1RKcVNK?=
 =?utf-8?B?M1BIL3Bac2tkdzBTbWtJVmdnWHo5ZWZFWUFobHJ3UlZIV3NFZ1YvSFVhRVJY?=
 =?utf-8?B?S1pSRmpmTUVkTEs4YUFXNHZKQkJuV0lTemN1QmxoMFlWZDVjRi9udUJuR1hl?=
 =?utf-8?B?MHJVMGljVmhFdUJtRTNtcFBSdWVrdXE4ZlpyaFlacVFldUpUUHh3YXpBZHJw?=
 =?utf-8?B?cndFNWg2NzhYTlk1L0E3Y05OWXpCQlRsdVh1Sk5kTFh1WnY3dzNyRlhBeFlN?=
 =?utf-8?B?TVBqQ1gyYzU3bWRmdXZYN2hYTCtLb2ZJb2l6ZXB0MmZUWWoweEdEejlYMUF5?=
 =?utf-8?B?WDhpTEZBd21xUnRvaXJaRzBiY1VoTlRYVVI5VmJQTE5PNGluR3E0SDFJQzdP?=
 =?utf-8?B?aFN5djJxdjRDd0trWDByUEFSSUVhSXRYZlYwWmRmdjg5cHQxRjJWeS92UURD?=
 =?utf-8?B?RGFJYnhXV2paenhtS1VOQlhUQjdnbnNoSWZVZDAzTXI3TFNycUJ2aE9YbG1F?=
 =?utf-8?B?ZUg2dGViUWhRRXpPbW9RVnFsZkRMdWNTVmljUGwvazFGOHo1RmFNZ00wdUt2?=
 =?utf-8?B?eC9zTkNQdlpwU0lJMmRjNFkwNmt2d0RLK0lCRUp0bEZEc0thT1pUTW5ZUHhB?=
 =?utf-8?B?clNUZU5hNTl6MFpQMmI0U2dxQk5yeHB0OFI0MHNOV04reng5empReitVeVkz?=
 =?utf-8?B?ZFBndk4xMVNySmU5dGIzbDV4ZGFyWW93TUQ4aThVMm5vcmQ2UCtuQlZoOFpV?=
 =?utf-8?B?aWZWZDgyVTJhaWoxN2xsbnRUUGgwUTl1MHRYbG1zOEdnRnZpbGtlemtTUG13?=
 =?utf-8?B?ZjU2YkVobWM1Q1RSS2paWEttZklIR3JmZy8rZjdYYmpnYlpYRndqNEpFeklm?=
 =?utf-8?B?Y3pFYkFsTi9YZnVVRlpNRlJYWTlnOGcxTUhqSGZnRXZJczZMUmdXUTMvS3FW?=
 =?utf-8?B?OHB0MThpTnNFT21yWnB6L21sK3lFOUxlUjRGcFZqUE9yZDVCUW02ZVBkdXE4?=
 =?utf-8?B?MHNnbGVlMm9iSFY1RnFXdVRsNEJCMURGR2JTOVllZlF4YThId05hc0pkL0lY?=
 =?utf-8?B?dEpJWHhhd244M1ZwMjNYb0lVRGtSb1NqV2I2eWQ2cC93TnREbXd1cFZoOWVt?=
 =?utf-8?B?OEJaK0hrVUxpazlPNjgzeG1mbEpaVkVwUmNLYmFrUVBlQTBmWm94cWtER3A4?=
 =?utf-8?B?Mkl6bmdrcVJxZElBYjFkREpDZk5mSGFDV2xEREtOc0xHTVNlT1ZWS0ZLOGJt?=
 =?utf-8?B?M0xQcXBGc0NKZm82TTlseHRBWFNvZnhaSVFXV0J1Z1hReGVBTVFHUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f2d5f8-d536-4fb4-61c6-08de8103f65c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:25:15.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnbtiA9txZ4wnqE8xXCio/bu6/adLJ/Zb1JFLFzdxd1hDQc3o0aUTwjrfGmWGExNTE9at5ksAdT2Quz1MaSI7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6568

On Thu Mar 12, 2026 at 10:56 PM GMT, Alice Ryhl wrote:
> On Thu, Mar 12, 2026 at 04:39:00PM +0000, Gary Guo wrote:
>> > +    flags: bindings::wq_flags,
>> > +    max_active: i32,
>> > +    _type: PhantomData<T>,
>>=20
>> Hmm, it is somewhat awkward to me that we are having a `PhantomData<T>` =
here,
>> as `PhantomData` is documented to "behave as it it owns a `T`", but all =
the
>> possible `T`s that we use here are uninhabited.
>
> I don't think this is an issue.

Fair. I also don't think it's an issue, just awkward.

I would rather make the uninhabited enums be just unit structs, though (lik=
e what we do
for atomic ordering and device contexts).

>
>> > +    /// Build a single-threaded workqueue that executes jobs in order=
.
>> > +    ///
>> > +    /// # Examples
>> > +    ///
>> > +    /// ```
>> > +    /// use kernel::workqueue::Queue;
>> > +    ///
>> > +    /// let wq =3D Queue::new_ordered().build(c"my-wq")?;
>> > +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq")=
)?;
>> > +    /// # Ok::<(), Error>(())
>> > +    /// ```
>> > +    #[inline]
>> > +    #[doc(alias =3D "alloc_ordered_workqueue")]
>> > +    #[doc(alias =3D "__WQ_ORDERED")]
>> > +    pub fn new_ordered() -> Builder<TypeOrdered> {
>> > +        Builder {
>> > +            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags=
___WQ_ORDERED,
>> > +            max_active: 0,
>>=20
>> This should be 1 instead of 0.
>
> Hmm, it's weird that the doc-test didn't catch this.

It seems that there's no check for this in the __alloc_workqueue (which I g=
uess
makes sense, because there's a C macro for allocating ordered workqueue whi=
ch
doesn't take max_active and pass 1 along).

The only assertion is in workqueue_set_max_active to prevent changing it af=
ter
creation.

Best,
Gary

>
>> > +/// An owned kernel work queue.
>> > +///
>> > +/// Dropping a workqueue blocks on all pending work.
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// `queue` points at a valid workqueue that is owned by this `OwnedQ=
ueue`.
>> > +pub struct OwnedQueue {
>> > +    queue: NonNull<Queue>,
>> > +}
>>=20
>> This looks like something that can become `Owned<Queue>` when Andreas' s=
eries
>> land?
>
> That's right.
>
> Alice


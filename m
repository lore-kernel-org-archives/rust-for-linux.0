Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021079.outbound.protection.outlook.com [52.101.100.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC43A4527;
	Fri, 13 Mar 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408586; cv=fail; b=G0ef7HtgYPqqtysal33ryvcGBBXZ+hwJ/N2jentbqFmaL5G35FCtRfcgeOksBq6Xl+EvOT92wbjQ81mZObawo6VbtCx81IOHM5Eo8ctN9/PnL2Z8Vtd+zlUQPSHODdPtG4FJEa666IRK5fsEIAYEeanzQNQuxnKwsJ8sG7KCLZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408586; c=relaxed/simple;
	bh=jtgo0onya1nrgQx5CDRbsCLHSbDTeXPcqxSBCTbjQcQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fAdAawFEkPH7H4C3fEH/zezmabeXzz8diuxUMOkFE8Lznlp9GwJ95oKn5HLYAyF6APv+tT4aJrJOt5jnZT4Eozkafl687LXWZ6GjPW6Iz7G1u+2t/qLBiLUVZjGno6+57hCWGRAICd1eMCob7AQx+Edb818nxmG3vGOIlXrMuCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dNXmJBSx; arc=fail smtp.client-ip=52.101.100.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dNXmJBSx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eshoR2GPAKAWqxJN59w+onQqdDIVEcfuIAjOhFXE92N4BOUqggg7YLjpeFpeW+Rd6HypBL4nZVcQg9zTpHRW4g7FitiNZsmXYfjXn0cKkM6sEk8K3mFf62l/S6kMhZ+m7kY3FFgAb3DmvOtynDaBnQunbnZ5PsZojQv9Z4iviSjcYS4xsU79g+R6YoWXL6W+ZYv5VUHAlqaB4EqlIrKJEuyrNxYZt6Y2O6lvP2ZqbU/tisgtnQ9xI31ghuBE2eRF8nQ1id5/H1iIpKzkOXxvcOsf8YBfYFoGSXZt7m8HASdoGT2CP6g9Ykx8l9Z8o9i8l3WnB6UyS1z9t05U43TDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkICI8Izkq1NwImF9DbXMZ6RfqMkJRLh7bxvAY2Kjj4=;
 b=yLhbqizMcdwY1qHfDD/0OnlrbB3Uz0Vwz15vkoUeltmmCKM2crQTSWARd9oFMeeQ0+Ooiik3vSau02nqYAQjWd/CSPTyZ5WykuV93S2UAbwu3vWdnk5swRdwHtY6YNzgH1ZuucYQWx7GiB46YsqtY9wYlNDKK1gQ8PyZ4x9vlSJqmcViSiCEGNXw9o3DUXmjaJncfsY1w3bqtHIqU8hUzYFp6eeh9GmnZ5REE7iS5sd5UZ7MbCPXfPiBBqRiZdaG+ENgXoVBrm9ws/Dbk8L2+Qp8tgu1LNK0X7javLdybykkDZJ8VVYs36iNboAkWLCTpfbnYcHrtPW4rsygcjAS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkICI8Izkq1NwImF9DbXMZ6RfqMkJRLh7bxvAY2Kjj4=;
 b=dNXmJBSxFf5Ef6v/nU9U5s93CRpcFrlcJc4Fa1B9DGvT52aiDNrxzYltqKwqK+1GiWNaqyClC30PA42Rr9EukdTNQSGT0oi2+oknfmab+LbfqVuGjT7X15RC6bMTnauV7d0Xu8GDyDgt4iUh/HFBlnitNQEfaLbi5FJ8NULb0kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2068.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 13:29:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 13:29:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 13:29:41 +0000
Message-Id: <DH1OVJDQ3B1B.302K37FK77JPC@garyguo.net>
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
 <DH0Y9Y1KIOQO.MECK7D06XFXP@garyguo.net> <abNEoZAoRT8G1Umv@google.com>
 <DH1OS4RI52DR.165D2P9C5AW9Z@garyguo.net>
In-Reply-To: <DH1OS4RI52DR.165D2P9C5AW9Z@garyguo.net>
X-ClientProxiedBy: LO4P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2068:EE_
X-MS-Office365-Filtering-Correlation-Id: 830784e7-22c8-4b99-29ad-08de81049565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oXG7tmRYrO6KjN1fTmfclXXlRSx4il5/PsF6TvZjsoV5gOsJyiuj1tsz13Q/xI462PBATRD27kT06VhseUz60/+6uFplyBc6oB8yxCIQmFL719RYqr4RJalreKKbwl6ne/XOI53WkqdhGQ6OyjP+7OqZMPDnxLicIGsziMGUl/rfBRUAy6kFpalPKmXq/U208LR8rqQ5wODeGNc3jUe95mModOPvXDHh0hRQLDOI7EByFW5kjMjbV/SRe+9wiNSk3Ah2MNX5pRt1fq6raz/uufIWVUA5ej7rybWU/RnYYrO4WJfIEhA6tKPQJ5X3vz8EWZqGYaF1+mKJbo8SSY1Y4ZT3N+S52g0wTOHbBBwgtdRLfAQonq8Axv+WKhCyngTjvy8lazLkZnjcFfwNWJSfJIvT4xndQJyZsJNgE0hR2qBvaC2fl+GR27nQDIa9fIiQxdd1CU77QNBNI3D2K7GUnQ5lQ1zSBqluDvShkhu6u/k6AOQUtX/+7JcyHc0G9VkAeD5+Nn3GLeOM68aEcOCWYXGyg1E0v29LlhL+II71wHhB2AkCg01P0//cOIifD+X15nz6p084lzYByakRnqwkZW6ATWqbjC1KUTwfHct+zTZKEApAoLCZbslmhu8N58wn1SmWkTbG2hkUln5UUWWDgQkwT5gSdJ0KlGg9ojLH/L3rAjsDxF8+OgqlvI52Wp3vioccYtvWc787wS/sR/Gq5NmGWOG85i6BkUfY7zrntaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHYvRE9WdnJ4dTlOVzZmYW0yaTlTY2RISFRQQmVHMnJRTS9CTldXM2tvU21R?=
 =?utf-8?B?dVhZcDAzbUhOYkIwbnU4NXgrR0R2cDhxMVNxZndBQ1BjSGlQQ0toNVUzM0FV?=
 =?utf-8?B?ZWQwc2UxZW1pRjRPaFFIMjZWZXpJZmVUcCttV1puQWp6cmp5a2RQTEltTkFP?=
 =?utf-8?B?S3hTbjJPNGJDQUpCNjMxYXRKN0J1L2xkbTU4dDUzQnU3VkV4QlFuL3c5SExY?=
 =?utf-8?B?VnBtNXdZaTh6UVdKc0Vua1pJL290RzFGV3V4QXViTkJqeHR3M0lqOWpKVVVZ?=
 =?utf-8?B?OHByUHV6cWRNRGtDcGVTM3VtaGZraFpJZC9aOUpMekg4U3VjQm01TFNIaFEx?=
 =?utf-8?B?WU1Hb0g4N3Y2dHN6RWJIbHBxOHBiVzBpTnc5cUZURzh4UXVBcElEdEtFQTlo?=
 =?utf-8?B?aElMWVJxZXdqbktTYVFjbVhsUWRyeHAyZ0tIMktCdXRJUWdZclBaNUdSLzRC?=
 =?utf-8?B?bEtWSkxnOEVEbHZrekJ0NW5zSXNERi9FN0xaa3RLaE4wYit2cUlqcWJwdGNh?=
 =?utf-8?B?QlNVcituT1NkRUFTSkFVTmorYldNY1pGSk9FZFZkOW43MTJGRDVWR293MkE4?=
 =?utf-8?B?UTdYZ285UHE0cnNkUTRZMnM3dnl4NGlXNGFGOXA4R3h3aTJnV2JqMlI1U0Np?=
 =?utf-8?B?NHhIQ2s4dHBRMmEyb2ErODdzTk5NckVHWW1TQUpNZDlwa0UyMldoM00zWGxq?=
 =?utf-8?B?Ukt1ZFladkRkSmdsazUzck1OZlJQNzBIM0l6bVVQOG9uUUc1VXRZQlk4WnRC?=
 =?utf-8?B?YnJ0bXZzR3lPSWRlQThJeSt5QkNndWx3OWN0VVRWVUl0QTJqcFJaZ0l5NmRX?=
 =?utf-8?B?Vlk1S1I0bjRsSHB4NWlQV0JHQ3BNRllvZWo4NkVXcU00OWsrdzNhUW4rTHMy?=
 =?utf-8?B?MWJpdFI1VkVla1lkZmRyZkMzVkJhWGoyYjV2QmZJYlFRcjBLY2p1VzBnS3Rm?=
 =?utf-8?B?bEQxSDdEQkVpVndLSzd4NEVSZnd6QWNRNUpZVUxjeWxhYWtmNmFzRHBJc1dw?=
 =?utf-8?B?Wnl4QWV3dEQrN2pTVUduK3pSazl2WVprcS9BVDRHTStwUnV4enQ4blp2d29K?=
 =?utf-8?B?c0VMeVNsWTJWYnZaU2ZBbEphWXF6bjJDcUl2dFVUWUdCNm1HR1Evem1WUy9x?=
 =?utf-8?B?RlZwdERpUTh1L2JDUlpvTGZTdHVDS0F1SlB2eElpby9PeFpocFd3MVFzSXRI?=
 =?utf-8?B?cmJnT3pZRnlteEtHbmdIVG1mbHpGYk1BSC91TDdHZVlCc3BXbnozbVlOUWhS?=
 =?utf-8?B?bEM2cko4OUt6TXhuMk54d3piMXhnNXE3S2VaYisvSGFnZ2lJb244NW1rWlM3?=
 =?utf-8?B?dnJ5WFI1dk56NzdqYm5ScVRmelUvWXRuTTA0Q1dRemc0VDd4SXpRdWlZUUlD?=
 =?utf-8?B?YVdKYkN5VDRrZUJkNWdYYjRLdytsTkFsMjc4dk5od21xZlQzZHphamdvYW9K?=
 =?utf-8?B?YkVnREUyTTlBMWc0TnN2eDI4dXR2ZGpQd3VZYnA4U2dkRVRPVkhRTGVxTXpN?=
 =?utf-8?B?V0s4V0pEZWVBM1lYSWNHKzRnTVBzS2F0enlpK2g1OUdBeUJlMjhBeXNhTDll?=
 =?utf-8?B?K1UxMStpQmJHek5WUGdTZXRuMHBDbjd1eHdiVlBYdEgxTVlod0FCdy9WMnhB?=
 =?utf-8?B?SWNCV3RkTVZmVXZkcGl2ZzJ1aXphU2hTaUtvMEExYUlmZUZkb2tROCtiTTdU?=
 =?utf-8?B?ZXpLUmoyczArWlVlSzU1QkcwVU5JcERYY3NSK1U4V1pyRzlsL3hsbVd0NGc4?=
 =?utf-8?B?QTJIelRUNVJqUEJ6U051Q09HYzlqOFJ1RW5rU1oyNmdTQWxRWkc0ZzloT1ZI?=
 =?utf-8?B?S3ZTR1dTYWljVm9DeU5VOERFb2ViNG5EREE4WUhkVU9nS1luRzlpdUcvRFFx?=
 =?utf-8?B?RjBrUjl6TC9CWUFYaHo1RVY1Qis3Um1Sb2JjUVpxSTMyZGlYQ0dyMm11YXNU?=
 =?utf-8?B?UFhOemxnangzYjZ1N0pvU00ya3Q4RUVlZ0RrOXdpTEJCU1psc2dObmtaLzlX?=
 =?utf-8?B?NXR4WHNGTmliSlk5NlErYll3ZmJyVWszZ0E0SGV4WVZGN21XSFp0WDVXTmlt?=
 =?utf-8?B?T2VvSGo1ODNkNHhpdit0NVU1MjVJUnpKSXJkWFNtalhZN09qaTlpRmVUcDQw?=
 =?utf-8?B?SkwwSWszbXBDalhSMnh1UFpseUFaMGY1NngzVmhWRVM3TDNrRWN1VE1GaWdt?=
 =?utf-8?B?ODZVWXU3Tk5hYnlqd3M3RnM4dkJmdncveW05bDMxY0JDZ0NjVXQ2cHBEQW1k?=
 =?utf-8?B?M3V0dk1lbVlWTVRKRUVkSmluRFRNTTNzaGgzK1l4d25ydEtwK2FXZ1h2T1JY?=
 =?utf-8?B?OTd3Y3E4MVluaUR0VWJhNzAyWnFFeVA0OVFaWmc4N2R1TGtxT0ZJdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 830784e7-22c8-4b99-29ad-08de81049565
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:29:42.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGhLp+gvroyXOnDLsqkPnmS/TAniK7y665+CBhMX++1rgFmt50hsp3nuPO+Ivdiw5fUZ5yLiIZkaCSoj1ABmsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2068

On Fri Mar 13, 2026 at 1:25 PM GMT, Gary Guo wrote:
> On Thu Mar 12, 2026 at 10:56 PM GMT, Alice Ryhl wrote:
>> On Thu, Mar 12, 2026 at 04:39:00PM +0000, Gary Guo wrote:
>>> > +    flags: bindings::wq_flags,
>>> > +    max_active: i32,
>>> > +    _type: PhantomData<T>,
>>>=20
>>> Hmm, it is somewhat awkward to me that we are having a `PhantomData<T>`=
 here,
>>> as `PhantomData` is documented to "behave as it it owns a `T`", but all=
 the
>>> possible `T`s that we use here are uninhabited.
>>
>> I don't think this is an issue.
>
> Fair. I also don't think it's an issue, just awkward.
>
> I would rather make the uninhabited enums be just unit structs, though (l=
ike what we do
> for atomic ordering and device contexts).

One interesting idea with unit structs, is to allow the type to be passed i=
n as
argument rather than having multiple new_ variants:

    Queue::builder(wq::TypeUnbound).max_active(..).build(...)

This is the trick that we use to make atomic API looks nice, although in th=
is
case it seems that it's not worth the hassle as it needs an extra import...

Best,
Gary

>
>>
>>> > +    /// Build a single-threaded workqueue that executes jobs in orde=
r.
>>> > +    ///
>>> > +    /// # Examples
>>> > +    ///
>>> > +    /// ```
>>> > +    /// use kernel::workqueue::Queue;
>>> > +    ///
>>> > +    /// let wq =3D Queue::new_ordered().build(c"my-wq")?;
>>> > +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"=
))?;
>>> > +    /// # Ok::<(), Error>(())
>>> > +    /// ```
>>> > +    #[inline]
>>> > +    #[doc(alias =3D "alloc_ordered_workqueue")]
>>> > +    #[doc(alias =3D "__WQ_ORDERED")]
>>> > +    pub fn new_ordered() -> Builder<TypeOrdered> {
>>> > +        Builder {
>>> > +            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flag=
s___WQ_ORDERED,
>>> > +            max_active: 0,
>>>=20
>>> This should be 1 instead of 0.
>>
>> Hmm, it's weird that the doc-test didn't catch this.
>
> It seems that there's no check for this in the __alloc_workqueue (which I=
 guess
> makes sense, because there's a C macro for allocating ordered workqueue w=
hich
> doesn't take max_active and pass 1 along).
>
> The only assertion is in workqueue_set_max_active to prevent changing it =
after
> creation.
>
> Best,
> Gary
>
>>
>>> > +/// An owned kernel work queue.
>>> > +///
>>> > +/// Dropping a workqueue blocks on all pending work.
>>> > +///
>>> > +/// # Invariants
>>> > +///
>>> > +/// `queue` points at a valid workqueue that is owned by this `Owned=
Queue`.
>>> > +pub struct OwnedQueue {
>>> > +    queue: NonNull<Queue>,
>>> > +}
>>>=20
>>> This looks like something that can become `Owned<Queue>` when Andreas' =
series
>>> land?
>>
>> That's right.
>>
>> Alice


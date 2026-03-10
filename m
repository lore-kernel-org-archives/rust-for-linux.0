Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020118.outbound.protection.outlook.com [52.101.196.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CD2F6193;
	Tue, 10 Mar 2026 02:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108249; cv=fail; b=QbCLbWG6HDl6PIDgvtDS4gtfFBnstJD/wo8WXQB9RySGXLOGxnLR45BoLPzoGpTRV31znfsqm/SWeo0w+U8CAcFcstYkJakah0dufZDDL6sQT/JpdW8jtGDz9g6oTl5H/onlEugRHoPitDXin4E9yJjY/qWAJ8tZjc+cBBp9X2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108249; c=relaxed/simple;
	bh=JwsCBQR0WKBmfvNSnsR3HmFKqjs8tQHThnOCmlAn+5s=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=DZ5wwwvcdY0Su2tTohV4GdnTBlHJdBYDIxU5AafdSU47G8ImAG0SURqEsz6fj5q/NyPSLsnCN1dOOAdRnzhoc05ne86M0JiimiwoIruRbQp0FQoVHOz4wftv/Wu768OAKffGIFPKHW0XZrUBoanmdNgSyUH02fz/zO2q4agtBOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=X/E4Z2f6; arc=fail smtp.client-ip=52.101.196.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="X/E4Z2f6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJXLh8AEC0LUv0yOYsSfUsexqjM6Qj5fI1PvqB3Yi9xt3iClgM8SMxDCvhfYiTA300jfhnX5XDUtsr7i/vzmZOUSqm4oukFMxs1LfCIkSZMIjBsXMoGMcxRKIKyV9/bykK+IGMVEzc+ZBQZna+8NespiTbZRc+IsJOcZfiyCspZSjpPjPTn2mSNtqqOgyxrPqY4DOzqAIN2iwwXY5Igayq2nTHl93BqFLu/yoFIVoN6rw1pZN0b5rr91CG45du5iOLy1hSYRfXup0DDylu3LLgkBl3aCq8noUGt/xPImsek8NljkjhN8g/WH35R8mYF5CYUEddhh3P53XyDdPQz9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE9Uu0MkHkX7nsZCSieXXy1Gp4m6e4tHtv0cRIFQ3/A=;
 b=XtmRbkjsQ7bpoZtLjXHgvTj2l3ChmjK6cINYh+aIZcpMX8J0R76027Q0APFZFezdgas/IVVC1qWRJ+EVhUnl6wB/qCReZX0f4T7ChPqoFBnoWX6JFLzRV6V6ksMdw8MRMAE0xCQ7MAFa4TU/wCpQm6A5TmJtWxxSglmRAYrUQrjTS3uxqGjebx0aEDkAuccbqzU6c1xtO4wpIO4f6o7i40Co/AO/scEepiulaKEq01pnciXRGHO8nb7irR+4s1JExdcbVubEQMT+GsYh2zsUF/l6UWQ5wULNKagno6izlLFP/vs2MblBqmFo3PbSW+Cf9B+4Mo4FinDHVtiHddSh7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE9Uu0MkHkX7nsZCSieXXy1Gp4m6e4tHtv0cRIFQ3/A=;
 b=X/E4Z2f6woPNr4WJvM8QkbtDlD5FRtLHd6/Gt4QGgRlQqIvpX3DLvuGiLGXQ/FCz1KhDo6n9BtVPwyiinadR3YQHLGt7EH78pOE2OVsiR1OevYTdlOrUwX2gDcYA1sBDViclRcwLPd9ZyTYu/dWuOB8tu6FPnKPDqHmTZjX8yS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5608.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 02:04:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 02:04:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 02:04:05 +0000
Message-Id: <DGYQEYSEHOWD.AWMH40F4V5FW@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 06/10] rust: io: use generic read/write accessors for
 primitive accesses
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-6-424f80dd43bc@nvidia.com>
 <DGYCWW4AUI1Y.29UXVO4XOFCOA@garyguo.net>
 <DGYQA2AH0NDH.2VNSFLDEJGXYT@nvidia.com>
 <DGYQB3CDARJD.1A7709F52GRT0@nvidia.com>
In-Reply-To: <DGYQB3CDARJD.1A7709F52GRT0@nvidia.com>
X-ClientProxiedBy: LO4P123CA0617.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 692faee7-9993-4796-6bec-08de7e494f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	UbbeBpnyMYNnVeuITJx/zUtt1EpVFOQJRFMOblgi1zQeDxs6OKZ9y0Vy08xFc8lh9LJ3sPh0j5HFsDg1WKQxDeGSmnZt0/CCXtfhD8mcDdZV/f1VN1L2yutDy4dY/QbuvfvVpGy/W+635gMR8VmOvG9JOU+ro6Nhy/qC28706SPNSz2i8Ti/AK/FiSD2iVBRiTMUhj+aZIS9Og12moeAaQi+68k07F2fKhHRm4TmEnYH1Ijg7ZafUMG1BYfS865jvQkxQdX3+YRHXCZMmJAEn7XXbTovaC/WA4fSF4WWS3H/CAQQI8UOWLwWAAItwyPf4iSwiMk45NvAcc3e1XNJEaGOJekwiRKyZvhKhmOZjDGCf0cqzM4a6cUGDfig2GkGNZJaBzbCk17SzgLnLQyTN87Ta3uEII0vhbcFDmjvwutl7THDSSIc+/brGbl9p4MMF23fh50s6gVz47CCk61cTKlNiDvyUIvozmnBEErCpvaUS/IdETxWUuMD3uPuWMt6Y6x9BTpo05qHnkXAk7GYRuJa1IwDME6jweojBkdFSjumO9ml3dUX1kZMh+Spo3KiTnwTLJ48urCJFpUtukM0F5DOWpd4659YH8RyWho6AkE1W//hPE7234I6PxxOv2u4cHgo4aXU/vKTBJV43ucKIT3B1m94Bv76hNGCz9a/qcyf/Ipg4TNMVHTS1RKM+9AVlBLLhbUgd/PIlAW//aObjSc80eYOU/XF7bwA6fl5UA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEEvRU9ma2xUY2w1U3B3VWFOOUFZeFhlMFlhWnVvWFBCNVM5d1d2U0lPOG5x?=
 =?utf-8?B?RTVjSGZqLzFjWkQrT3hHMGJFTll5Yk1LUEpBc3BkdE9xK29LNkZ5SEF1NHB0?=
 =?utf-8?B?UEltVXRIRWNvT2o1ams4bmFISVNPMjJNc25kOU81ZTY3Z0U2dzFHM2NmK1hq?=
 =?utf-8?B?bFRTTG9OSlZjejJUVHJzM1VWTlJ2ZFNZVWpNSy9PbmdXYk5UeW1vbCtMMFhX?=
 =?utf-8?B?cTFCc3ROY3BiSHdQc0lRRTBTN3IzOGxDSC9ZSXFFeWpDTml3TmhQdkptWFB4?=
 =?utf-8?B?N21DK1Q5WUNLUUdSZEhBY3F5Q1dCYTdVTzMwSjNZTmdPSlhpSHVIYWJsRnYr?=
 =?utf-8?B?aVZLZ1hJcnFvNVJpSXFlL1VYVnlmcUZQSHc0TDg0N0dweUNFTU1PMmNMYVRa?=
 =?utf-8?B?SER4QlYraHNrNmJkV2RaVUpZdXNlLzFBR05RL1R3SmY3NzFiU0ZPODUwSC9C?=
 =?utf-8?B?MG9Jd3BsZUlLSmp3aU9JYUwzSVN5MjFmaWVxditScmxSVTRBaHIxYk10eW1o?=
 =?utf-8?B?U0prcytKOFhsSHRGOS92b0xieVE1ZkV4MkRzQXJ1OGpFSWJKWFluM0g5ODdG?=
 =?utf-8?B?blhwN2pZWlVaejNKb2RtY1d0UEFTaDhzZzJQTlludVM0M2ZJT2N2Zmp2Y0hY?=
 =?utf-8?B?a3NLRTF4K2hlUmtlTk9IdXhxMStnTWVlZSsxajhxMmVQVk4rc2MxZjBwSkE0?=
 =?utf-8?B?SUkwaDJtQnBFUGd5NHlrSTZ0WVZZQk8wNUVXS212TkdSSCtYRC9PSCtueHRB?=
 =?utf-8?B?WHRsd1IyQ2hJSnlyNUZOSzA1dk1SbUJWc1J0NTVuaTRkN0JNeW1lMjFxd3VZ?=
 =?utf-8?B?QSs4cnNIRHVUSGUyNGp5SDFPaGs1YzAzTXJXK1B5VDlBOEQzbzZLSmQrVjZo?=
 =?utf-8?B?K1FnU1BEQW4zZFlxWVRnQzhyTmt2TVBKSlp5NFNKNXVpK1pkeHhYSHFyNFJL?=
 =?utf-8?B?Y1N3ZWxoblpLZVZwdWVxWWdzLzQ5Z0NQK0xzWG00cHAwemFENmo1ZEd5c1Ay?=
 =?utf-8?B?Z0Mxd3pBRTk3VVJGQUpXc0N2Wms0RDE4QmRYbkJPMjNZeGdoUkwzcCtkNHZT?=
 =?utf-8?B?VmgzU2FPUTVaakpoV3NxWDc2RERyb3BBSkQ3cU5UZUs0L3E1TDRWZVNFU0V0?=
 =?utf-8?B?TnpydXYrZThyOW5OQ0lMM3RqWmMrUUdTV3VCRk1YemRWWkZQQVJYQWZkanpp?=
 =?utf-8?B?UnJTUjlub0ZKNnJNM0lUZ3dqeG5JSldmZWJMTUowTy9Jb2NNMVpodTlrQUk3?=
 =?utf-8?B?ZkIvdkRRSEMxOEkvdGxqaUtKeHJaQ0NBSzFqeWNxYVIxWTBsNlFrenBYZFNl?=
 =?utf-8?B?SlZQNnVKMkdpNXNWQjdCZTZPUlJmb2RpMjlpTGRocFZ0YmxVTHVhbllWbzBC?=
 =?utf-8?B?VFZPOEI2WFpjWDVobmdZdEd5VWRxeTFNNm1WL2dmdXRGY2l6RjlJemgrS3dY?=
 =?utf-8?B?dHk4cWRpSHZJa0JYSUpFSjhrNHQ5TzE1eml0czl2Vmh5ZFZyUWErblJnSXRo?=
 =?utf-8?B?Ulk4dTZ6RWVTZ2FXczJXRm9PdFNVVVR4dloxVW1OUmpjY2hJRWtFc2ppc1VR?=
 =?utf-8?B?WnZ1a1FHWnZmWjJFUFF1R2dYWUFrOXd6Y3gzUTNoNE1xWEJWeTB0aHplbkg2?=
 =?utf-8?B?NTVEMDM1UVNTd3R2blZ3dEF4L2FSbjNDRUdpVUNNNVV4YTJCRGpZOXpwMFhS?=
 =?utf-8?B?bHN5K28vUmxBY0pkMmZtUUdsWDJrTzZLSVdZMUtGMFpWUXQ0UVVlYXIvTWxB?=
 =?utf-8?B?SUpEOUZjMWsyaDRjcXlid0krVmJzUzYxM01tYVV6UWU1MU94OUpSZ3RsQzU5?=
 =?utf-8?B?Sm9ObWR6bXRRVktaOS8xc3BwaDhpR08wbjZzTjNBb2xXTGx2dTlTaGV1M0dJ?=
 =?utf-8?B?RVVpUTZncXAvVXpWR0ZoM3NqOGpWeDg0QmVVM2FhTk9hNitzbUNiL0E3OFVU?=
 =?utf-8?B?UWdJUW5IN3RML0FiLzdrYmQyc1BxVm53NFBUaGlua0hJajlPaU1PRXRYSGxh?=
 =?utf-8?B?eU5rOWltZWNheGVkUzJNenpla0lxYlBHU0ZTb1JFRzFOVkJaVStvY1FxaXYr?=
 =?utf-8?B?Vm52aDlrc1JwM3hvWlRUM3V3RXlhbE1rS05zYmV5b1JhcU5DOXRDc0J0bDND?=
 =?utf-8?B?TmY1TzZyQ0JLRVlJVHpTYWVLTTRuMU9ZVEpYSXgxdUlRZ3pHYThMSVBLZkpH?=
 =?utf-8?B?S3NRMmlJclZES1diK0gwMG5MVnZvSzBtSEJCU2YxVWNqTlp0TFNzR0JFOXZQ?=
 =?utf-8?B?d2F6cElaMmVyd09ISFcvb3VDWWwvR2FLTkVPOVBZaWJSZHJFbm54RUltcG9n?=
 =?utf-8?B?UEZsSWd1aVlTQlR2em1HNWhTTndMTG9xL0ZMTlhVbFlLNFk3YlRMQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 692faee7-9993-4796-6bec-08de7e494f03
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:04:05.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kH+E3Elcdkuhr95eJzouX+dcAQXJEPLiF8FxrvxUViAW62sdeUrxkXPg1W3koV93Zp2XZ+xQ9lG6xw2YnSDC5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5608

On Tue Mar 10, 2026 at 1:59 AM GMT, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 10:57 AM JST, Alexandre Courbot wrote:
>> On Tue Mar 10, 2026 at 12:29 AM JST, Gary Guo wrote:
>>> On Mon Mar 9, 2026 at 3:14 PM GMT, Alexandre Courbot wrote:
>>>> By providing the required `IoLoc` implementations on `usize`, we can
>>>> leverage the generic accessors and reduce the number of unsafe blocks =
in
>>>> the module.
>>>>
>>>> This also allows us to directly call the generic `read/write/update`
>>>> methods with primitive types, so add examples illustrating this.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>>  rust/kernel/io.rs | 199 +++++++++++++++++++++++++++++++++++----------=
---------
>>>>  1 file changed, 131 insertions(+), 68 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>>> index 1db6572f4a42..ed6fab001a39 100644
>>>> --- a/rust/kernel/io.rs
>>>> +++ b/rust/kernel/io.rs
>>>> @@ -197,6 +197,25 @@ pub trait IoLoc<T> {
>>>>      fn offset(&self) -> usize;
>>>>  }
>>>> =20
>>>> +/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` =
as a parameter of
>>>> +/// [`Io::read`] and [`Io::write`].
>>>> +macro_rules! impl_usize_ioloc {
>>>> +    ($($ty:ty),*) =3D> {
>>>> +        $(
>>>> +            impl IoLoc<$ty> for usize {
>>>> +                type IoType =3D $ty;
>>>> +
>>>
>>> #[inline(always)]
>>>
>>> the fact that this is a pointer is somewhat uneasy to me. I wonder if C=
lippy
>>> with its inlining tweak would cause optimisation failure here.
>>>
>>> Could this be just `fn offset(self)`?
>>
>> Yes, this was a remnant from a previous design where I needed to either
>> make `IoLoc` require `Copy` or use a reference here, so I opted for the
>> latter.
>>
>> With the current code though we are using `IoLoc`s exactly one time, so
>> we can consume `self` without requiring `Copy`.
>
> I also guess this method should be renamed `into_offset` then?

Calling this `offset` is fine, given that this is a trait method and is for=
 I/O
plumbing and not really conversion. But I'm fine with `into_offset` too.

Also, most of the `IoLoc` types would be `Copy` anyway (even if it's not
required as a bound), neither makes a difference.

Best,
Gary

Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020076.outbound.protection.outlook.com [52.101.196.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04A3B3C03;
	Mon,  2 Mar 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456034; cv=fail; b=Je7BKQsqxuFfL2FR4NY401M75uyHVKdN+7G19KhoUYZMEQMHlrB4VTfm8ZaqZ21VTNCQozfKWdikgvL6Wuluglb0y9N85LJhx8BgygG1+EGtVaRDvQuv0WzdLl/wiaGbbcsYAe/deXlovuulUUiQw7QFYKcbucuUXa2qJX0SIYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456034; c=relaxed/simple;
	bh=xJNLfNtbF5CIV49QwVxxhFC4Pp8IyNoeDenyIsSwJfY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qaM8LbgzEZFpWFU8acoumaqKAOQf0DxnhpyU1ndEF9gvplTj8JCuj3+FARUzgvjC0Hcyqkr8RGPj/dC20pBeeIr56Wxbnu3+yXcvhevabvrWD+K96yW4piAQgibsE1Fmrw9YP7cuPHNnSGslSvtIrFjoEcEnv5rtwu9aMpUPiqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cpdU0aDh; arc=fail smtp.client-ip=52.101.196.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cpdU0aDh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPAO9VPt62uDEP5vRR2r28PU8sM9mAMM3YVFO1Ab7dc6Izp6OPLzXoGEiiDGREN1pvoTtyrUtYIAYaZUU6jAO7NQYDA8U0IdF8mIA7GCykL5dYd+10R3RU8uzrrfNq5KHRU8nGe/VUNtrXILrTCZeYdAXtwjkue0+xglT2SunD1RIdNDbo3qJXOm25kIv1jqEiQr3bddcFVgsvdcLQBTfwtdiMufMMqkGz7sBFMc/A7SD0NHW+CKdmL8AdDbd0f2sklVyfhCm2SxyOxa46qyBbyKtqCyROtjKHObvluiOgPWKzEacetN1YSqOUGMHRc7TM0LSeVg+klGZpuhZv5biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUVtrfNFWhezoaeJ/LF+RLFBuoZQK9Pr95D4jiJ9f1M=;
 b=Q8IC8jS2pmX87BOGahZTGF5y9rKRAFGcZxzo7cZUMQME3i/7mTjgqQWv7nJ7KL/OrrPk9KprlmCodnP3/lOs4loITHmOUVGjMs5OZgI0y2blhAZoDrGk5/WLBbVHHVz7GRe/Y6/kMMTpcWzHL+szR+95REJTDU0pGQrFNTGZujpOZXU0N9xk4GS3HLWvHhvcY6rWqluXY48qRQ8ODUaCsyxW39kFXAy1+ToKjFjdN6BlubHqWS+mkps9MFWWp25Faj7QC8KFDo0HoZbdVyaNh8pG8NAn8qTcnBUFUPqP+H7/E0Jvp35ZSlciFioRkXpi4X+IqSxVYHZuJ3RIclhPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUVtrfNFWhezoaeJ/LF+RLFBuoZQK9Pr95D4jiJ9f1M=;
 b=cpdU0aDhrPi5sRsAXEuyWAaZPZdmC1FKbRpor588PY31p/d1wiobWUS09h2YzwYuMcvZ1WI9L8xBKoIIUY3nSM4tKJ2sViUcfkcdivdq2uQKD1UodboDfsfBe6KTSooxOBuOprivycOGCIT6b6RdLlu0hWouzkjVT81YtteOkk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 12:53:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 12:53:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 12:53:47 +0000
Message-Id: <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
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
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
In-Reply-To: <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
X-ClientProxiedBy: LO4P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ab35d6-ccdd-46ca-9c65-08de785abee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	0DBnSNG3pfaL0aLDjmKiCxeYc4y2VJ48z1NrlMzQQjHAQIX1oprj/RGdhYraFCPt4a2v5bBjvIz+eGHD9kUog9wbB3IclrrNGMO8Hkhk36IPSfPx6uCHywCm4ZAWDVgNjoO0D7SNP0KHbDPWn7VvBDuHCxvOda27+uVnej5QCqVKU9ZyFU6S1C161zRHlrBuZXQ20sKl16BjkRKCYwCGDfuGRf0KRsuIYdBQNA1T+eDyIxG54BGpq4qX+cebsTNajt1CZ6i1neEM6RvKdVge3CmIJleWy7dzmqF75xpsS5F+XSYqls3OvTGcfUfvrfAcrtu4YbvExRqyywy9QvbcF77mT2FP4hUgdogpBCANT4elwEf3nW7eDF5lbcE+TgvqpH/1OUvWRd4+A3NBumUCMzBfb8y5DjipL/G7NqrXgnWAph19pzVoqBd+goNdtRxQ2BNcXuVQf45r92RARfq0j2AWmyewTvroxOqqL3Vlv5EnDwerCKa5DRRDQ+tcGOTbg1TVyrdoucTYrYKLQWOtE1ylIXkOHNsh0zi9fIYW007IHnmxvq03FRBOul+fKEMELccG+y3k0EFyJKlJPE/A3JxAefuIm+7AwtZbWWG1w69/5XVmQ5e9PdoBwRJNHr6hK0SPiUrmSgZxZl+DdWzE7Yut+3rJQ2vMPC0BwPXdyrah6lG29W9CuS9vxP/2+dll+x8/ST1Mz6EkqYWb7YGXTqFvcBpaLdmX7iceEHKZ35U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnBPeWp6amVoNlJRSDVJWkpSS0dzUGxSMmpOanhWSEovVUh2cFZ2RDVsdk5v?=
 =?utf-8?B?MlZGRGJVbzR0aGZCcXpEWXh0c1M3bHFCRnZJM29GVXhjTHdoUnU0aVpwUGpZ?=
 =?utf-8?B?V0IwUFRnVFJ0N3U2ZXRON2loa2N6OVBmNXRoQVYzVjBtRVMwQ252a2JUY1JG?=
 =?utf-8?B?dnFrVTBnakZSZFNYTE1KMEdYNzlOaFpHZkZ6YmZxcmVLckM4aFJBQnRzcTV3?=
 =?utf-8?B?Nm5Gd3dBNVpTU044VnA2eXRlaU5NK1laeUJDb05lVlB6ZE5KeC9WbFI1K1FV?=
 =?utf-8?B?MW5FZlVyUDRBV3NpeXUrK3FKeUt3a1MrWUpHWWpOYkFMdnRoaHJ0dEVBZW4r?=
 =?utf-8?B?QWkweVM5c1FrL0V1czdjM0V1dkJ3SW5sTFBMc0d1NC9EVnYzckh1THA4b28r?=
 =?utf-8?B?dUNnbWpmMGh1blZ0TklnUTZVbEd5SDF0bFArT2szZkFEb08yWlRuRm50bGhG?=
 =?utf-8?B?UGVyR2Jvd25Tc254QjZNYjNZMm15N2w0ZW9VSDF0bmVRTlMyZlR0NE9xWFFi?=
 =?utf-8?B?a1BLeTJYYzdJb0dPSVM1Zk1Ob1pReWJ6L3VVbEx2aU1BVEg5QTZNU3VhZ2ti?=
 =?utf-8?B?Rjl4NExoM0xMQ2IzWXh2U1RsYjVhSFpWZ3ZpVTJGWmJQeS9qN2tMTDBia2xU?=
 =?utf-8?B?a0g3OU1jUWtVVWliNjAzaUxIRExtMnU0Ti9TVnZ5cmpidVlxY3dPMTNYSUVt?=
 =?utf-8?B?WVc4YlZtMzZrOWpMTXpyWmJGQmU1Y3drVGdsMFE0YXZXdVRWdXEyQS9PVXpk?=
 =?utf-8?B?NDlmdEdaV0hoeFZmb0xHbnJaUlFnUlFxcDhmdk82WnlrWFoxZkxWNGc0STB0?=
 =?utf-8?B?K2N1cWFvaUJ3UVcvUnFMSStlejVoOGhpaDhtNnRSV3ZnaEU1Qlk4cmhVTWs0?=
 =?utf-8?B?TW94aUN2QU9ZUlBobGlzUDJORFBSSVNwd2ZwSjIvV2c3b2lUMlJJUDNjeDhM?=
 =?utf-8?B?aDIrcFdGL3NkY2VJTGVHUC9Ua3JPZGdqdjNrVjNGRE1Ta08yWjV4Ly9KNzda?=
 =?utf-8?B?cjhnNWRlUFY4YmVBUzU1M3Z0ckhWWk1FWHhYd0NqUU9vNm5WbnNZY1FGSjNL?=
 =?utf-8?B?azhTaUdjTWtnRjI4RGx2VmFEd2RDZXd6RGNKaFVmZklPUHRvZFlpOGs5ODcv?=
 =?utf-8?B?aWc3YVRIRGY0bnAzam02NzlTbzd4T1VJdVlidDAzL1NVWDFMZW5OZkg1Y1Nj?=
 =?utf-8?B?QWFnbnRlbXFVSWJUNFVwMFIzNlNKUnBibGtZQVdnNTJvVm9Ddk1XNWpJSXVs?=
 =?utf-8?B?bGtqdW1sTlZqL3MzMmlRUlBzRFpnc2N6dHZRbXZhQnh1ZE8zYXBDODRCeFlz?=
 =?utf-8?B?RkxQTFR6U01BcWJZR004RGhQRHMxQ0pJQzh0YnN0dkViSys1STQ4RjVEWVFn?=
 =?utf-8?B?N0g2eFpuekRuLzFhKzVZOWVsTmt5cVJUVlg3MTJHL3lFQ2g3WnJ4cDlNVzQ3?=
 =?utf-8?B?L3RNaXJRVU9YWndJZGl6eTdKNXV4TWJSWEpLRWhTbnQ4NkFvWDdXbGdhZENQ?=
 =?utf-8?B?NTRwTGxnYWhEbUNSVXcyS25RMElYeG5MeEUyS0ZWZjFKanlKTjk3ZTBIZFVT?=
 =?utf-8?B?cHFyeXE5NWd3dWFxbWlUYk13MFVEL2pVTldUNmNqbWhZOFFueXhWNnhMUUlx?=
 =?utf-8?B?dUxUdVZjYS9ZdDlkNGRuNm1hYTRTZ0VPSm9jQVNwNG1DM1ZZR09jM0Y1WDZm?=
 =?utf-8?B?bWFic1k5MUxZaGc1a3RZb3RwKzFVc2VsVktNcHVmK3RKMko5Vlc2dm52Ump4?=
 =?utf-8?B?ckNzY0FoeThJTnY0dkxsQ01PTnN6alRSQU84Wmo1Y2l3OGNkKzVoUm1JSWlG?=
 =?utf-8?B?SC9CN3crUWM3QlZKMzZQM3hoTnZtbmlYekYxdENUWHhGbUcxaWgvaEs2dVZo?=
 =?utf-8?B?SlhmNWp3b0pDYnpYSW9YRWlsTzY3aG1wZ1FwZ3pEc2FDRENHQ1dwRWVpTXVJ?=
 =?utf-8?B?OVBsUElYOEdhTHhudjllSnhPZFBmd1dMZnMzSXhSaWl4VEgrcklEakNnNFc3?=
 =?utf-8?B?N0dtQTFGUE5aMDZUTkEwN1dLaXN5ZmxiR01xV1RGdUhOZlJZakhQVzk0OGFn?=
 =?utf-8?B?SVd1ZktORWhZbFprOWRxSmFtTys3bDUwNEg5OXFFb1VQanpJRmEzc1dhaEY0?=
 =?utf-8?B?TS9IU0U4UmlKV1lrS2NGWm41M1pIdy96ZGZndkloNHZFcGpzK1RYSDlBSHhm?=
 =?utf-8?B?dE90MW11WkZ3NDBqa1ZvTW5vaFhOa0c3SGpMalp2dGxXUGZqeFcyVElHeXlr?=
 =?utf-8?B?bzY0cnNHTUpLbHUxclRCc2xVSWFSZ2xBMmZJV1pEZURQa085dmo2V3Y0NVRt?=
 =?utf-8?B?aGpTOHVCWHViVy9oRDdRL1N3OFpSUG1zeEdNOXhDcGxsVmt4TlYwQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ab35d6-ccdd-46ca-9c65-08de785abee4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 12:53:47.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09oyjt33lKuuVZ4I8U4BRxoH7mWQjtO8bzfKuE/R35HFFmEPC0rwCTlDHlgBHH26EiyL3xNIQk13ai3fgzJ0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7551

On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
> On Mon Mar 2, 2026 at 12:11 AM JST, Gary Guo wrote:
>> On Sat Feb 28, 2026 at 12:33 AM GMT, Alexandre Courbot wrote:
>>> On Sat Feb 28, 2026 at 3:02 AM JST, Gary Guo wrote:
>>> <snip>
>>>>> +/// A pending I/O write operation, bundling a value with the [`IoLoc=
`] it should be written to.
>>>>> +///
>>>>> +/// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`]=
, [`IoLoc::init`], or
>>>>> +/// [`IoLoc::init_default`], and consumed by [`Io::write`] or [`Io::=
try_write`] to perform the
>>>>> +/// actual write.
>>>>> +///
>>>>> +/// The value can be modified before writing using [`IoWrite::update=
`] or [`IoWrite::try_update`],
>>>>> +/// enabling a builder pattern:
>>>>> +///
>>>>> +/// ```ignore
>>>>> +/// io.write(REGISTER.init(|v| v.with_field(x)));
>>>>> +/// ```
>>>>
>>>> Thinking about this again, I think we might still want to write
>>>>
>>>>     io.write(REGISTER, value)
>>>
>>> This was the original design, but as you point out below this makes the
>>> very common case of writing a register value built from scratch more
>>> verbose than it needs. Real-world examples are significantly worse, e.g=
:
>>>
>>>     bar.write(
>>>     regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>>>         .try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?,
>>>     );
>>
>> My main dissatisfaction with this is with the function call
>>
>> I wonder if we can just have
>>
>>     io.write(loc, value)
>>     io.write_with(loc, updater)
>>
>> where the latter simply is a function that does
>>
>>     io.write(loc, updater(T::zeroed()))
>>
>> then the example would be
>>
>>     bar.write_with(
>>         regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(),
>>         |r| r.try_with_offs(load_offsets.dst_start + pos)
>>     )
>
> That should be doable. Note that we currently support `zeroed` and
> `default` as initializers, so having the same level of coverage would
> require two `write` variants. I'd like to hear what Danilo thinks.

I looked at current Nova changes, it looks like they all just use the zeroe=
d
version.

I wonder if just providing a single version that starts with
`Default::default()` should be sufficient? For most users, zeroed version i=
s the
default version anyway. For those where default is not zero, it perhaps mak=
es
more sense to start with default anyway; if explicitly zeroing is needed th=
ey
can always do an explicit `::zeroed()`.

I think with this we can make the API look nice for the common case, removi=
ng
most of API complexity that the current design have, and still preserve the
ability do full custom things, with perhaps just a little more verbosity in
code.

>
>>
>> [ Note: it's possible to have write_with that works with both fallible a=
nd
>> non-fallible callbacks. You can define a trait like a monad (well, not f=
ully
>> a monad, because this just has a map, not a return and a bind):
>>
>> trait Map<T> {
>>     type Mapped<U>;
>>    =20
>>     fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U>;
>> }
>>
>> impl<T> Map<T> for T {
>>     type Mapped<U> =3D U;
>>    =20
>>     fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U> {
>>         f(self)
>>     }
>> }
>>
>> impl<T, E> Map<T> for Result<T, E> {
>>     type Mapped<U> =3D Result<U, E>;
>>    =20
>>     fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U> {
>>         Ok(f(self?))
>>     }
>> }
>>
>> impl Io {   =20
>>     fn write_with<R: IoLoc<T>, U: Map<T>, T: Zeroable, F: FnOnce(T) -> U=
>(&self, loc: R, f: F) -> U::Mapped<()> {
>>         f(T::zeroed).map(|x| self.write(loc, x))
>>     }
>> }
>>
>> then this returns `()` if closure cannot fail, and returns `Result<()>` =
if it
>> fails).
>
> This approach look like it could also be used for I/O in general - right
> now we do not handle bus errors, but we definitely should.
>
>>
>> end of note ]
>>
>> BTW, I am also not very happy with the `::<E>()` syntax. I think with th=
e I/O
>> projection upcoming, we might be able to get rid of relative offseting
>> completely by requiring user to first project into `View<'_, .., FalconB=
ase>` and then have
>> some registers that can only be used on `Io<Type =3D FalconBase>` but no=
thing else.
>
> That's something we can always update once I/O projection is available
> if it can indeed be applied (using a two-steps approach if necessary). I
> can already hear the pitchforks if we don't deliver some basic register
> support for 7.1. :)

Yeah, don't treat the above as "I don't like this so please fix before merg=
e". I
am just pointing out things that can be in general improvements and there's=
 no
need to make everything perfect from the get go.

Best,
Gary

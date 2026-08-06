Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022136.outbound.protection.outlook.com [52.101.96.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E9377AAF;
	Thu,  6 Aug 2026 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040352; cv=fail; b=YcIK2KVmaJwFGBqp+qf0fLvd+TE0tjeLYh79AOrWT+b83w4EO6mqgm6Bgtl+lw9Lf0VFe/F6lrfFLYGtUe2cZb4l4tEQAJovUJu845MHca4oqSifRe0asKGkCuzBXLWBOp8iMoLPpWhufW0Ow6hdjM4yAeOfBntubfxM5EPNicQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040352; c=relaxed/simple;
	bh=Ls9lE479/eXzWvBd94a1j98Mup94Vp08Wnkf2QTjUwg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WsvbqDR/rl/j7mgKjPA8RTkxGQKdle85nj/UXPFU629n2Jxa+H4COSUNMZ/7fj90kexjfOisLQNVtGFfR29yCDBLwkJN4z1AFhslqhDioOHyroWNIJuzW3F/+3lswjPMBXqU8sKKU7rO74/CveuqiutbRZc7PbQFgYMjvm1rdg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=u+lgllSF; arc=fail smtp.client-ip=52.101.96.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="u+lgllSF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAwMJT9eRTw9uPWl5ptGWO2wFXfZRLqkeLGWuO/+ubop9YUVhBVNqv6PlaxHTTA5ob1m14CJ60y4JC5HaGT+MYCArXdJelOhsVHbnHWturCY1r3QxvOsp7A9sXicaD73JjE5bAdliZrhMDarvITFzRZWhijV4HXDh39Jekh+IctAqm5pFg0e6bg1uxT0kAPaGXfAeY1nmKck1eehYyRmup4/y2oDJi4z5jcjh4rZtdiqR4ExwBiakJ8jjl3rEKeZLkKiM3l1s5p10ut5r/jfzQYpY2uC6LZs2G1QXOX1UVIJ3B/jdyDTSDtAlVEtPivKAoE/nfBVtf/hdvgRkpmGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDm3Dhg+i1hLWTR70h4dyrZWKzKMTqzt2xp1H80M/dY=;
 b=o1JqBQ+FnRj6QDuM9Obe+kFlx501EiexDaKTqv9Zv6YTokIIiRQqO4oGTzDkdh/hnEVWnj/cP0nthloASGYfllTyl0Xd/CMO7ZnUvDIAiF49XNvWrqF1ozmoLyIywwjSEdrE4WYCmEb6gagC/LN6/haV2EtdfAwB4uPUdkHTbeL0B5iMjI1+9A3W7XpTPTw5knQ5lZvPO16qYw1i1gQ8jCfv4M6OZVOjJPlELxcf+3qh1D2TsEQWhB0Z2xXTsFvxCMCPxaNVg14awXEwI9y8Gt3frEtbW9ZlUUrgWynRVJpeLVNEjjNdEju/jbM24MM+9b75tRX2CVUC05+gtu1lNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDm3Dhg+i1hLWTR70h4dyrZWKzKMTqzt2xp1H80M/dY=;
 b=u+lgllSFV0rseZWG52mDp/8nTRT+DmwCrCiIOsvUQt0mncpFFBUKC1VXv3rzJo77XdV4CoFMCtYjpSANhRhsIW5ZMBHdFrvP6q/58TyHZLiKJ87EPCaviNVWpcZ6j924aFs+VJeKhjvji83d+usKEkesYyS7qtSW/ZKIa/FSWUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB7339.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 18:19:06 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 18:19:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 19:19:05 +0100
Message-Id: <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net>
Cc: <linux-next@vger.kernel.org>, <a.hindborg@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>,
 <boqun@kernel.org>, <dakr@kernel.org>, <daniel.almeida@collabora.com>,
 <gary@garyguo.net>, <lossin@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, <gary@kernel.org>, "Mark Brown"
 <broonie@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260805190012.2934907-1-gary@kernel.org>
 <20260806170101.67544-1-ojeda@kernel.org>
In-Reply-To: <20260806170101.67544-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0257.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: bce326de-7a28-4893-c265-08def3e73386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|10070799003|376014|4143699003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NrTyfXc6V97r8fI40K+R4DzEIIbR0r0ZvAQdcm2No0yc68kc+Csz6ApdWSB+S5tKLzybYwFvGVXgJ3qu1pKEvHBbV9ymrrpzvTaWBQkp2ZBGVTrtK2lTBTNNZ6oIBCoqfuetrlsp9IvO+mcFXqgPoVuJcWU8T6D5PGbfN//F/N5MKp6gaQLH6EopHUmFH7qs3xsq/U5zWHKUsoxbZrxVV6Rv+WzJNOpSUX0FQObxez9F1nD0UL4H9S68ZWySMUyZj9ciBMIgE3cw0uLNDRwpxTyi+fw16xjdXKNGjWDJ8SzboLyahovXhfPrOw7ufXZ7BdJoSsQbfl6Z1TZM5NdkcKWUiXYJt+IkSqwz+mtlSd/dql4V/AOh7qbvGAHRqBWmVvD6wVkIPDShncXDynNm4wLhUMSYavWJxjYZ3KruG/XHHiTRMsRdWOaP1V8WUtLv79qlYhWBFteiM5IN8YPOf9hyOMVcSkA3ApVuFDksYzuBHn4V74d34x4Cwxw8z0jDMCnKyrtd0MvxzR++9/L8GZ6DUCpvVlY700Yl16euVOxHWxny5i7KBWvupfhhQqi2Z45W+7y1yuksGYsGIf8qXcpjEfD95Fd4KWMkR0Zrfl08OQuUmPKIkZruj+VLV13O7omtKI5qM2cQq/H40ZgqQ7LtX4KS14q7iQvtc7DOHqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(10070799003)(376014)(4143699003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1daRW92Mk4wdFRTUVFMYVd1S04wVFNOSVEwRnZOZVZHdWt6WHJ1dHVBeGxB?=
 =?utf-8?B?R29XSk9DY0VtQ2RNR05sVEo5eXl2RG5LRHdhczU1MThOc0hPdjA1ZTgzZUF2?=
 =?utf-8?B?L3RjOGpNckM1YmM2dTRJc1dyQVVZa3U1QnNHYjRoWW5BQzdMZ04yNVJvUVpv?=
 =?utf-8?B?QitWK2RwbGoxZ0cyRm45TXlxUDFMSVBTbDk5NVFqSjlzZmtrOEhUUWlSbWdx?=
 =?utf-8?B?YkZicXlsYkdqa1pzcjY5WlR2cE4rcGpQUWFkQTdyeXlMSG04cG1adEdEMzJY?=
 =?utf-8?B?RUUvdFRvR0dUSEgxT2hSU2RDUWlwbERYOVBuemErUGNaRXdKM2JPR0JIRkVl?=
 =?utf-8?B?dTJ0Tk5Zdnc1eUdrQUlNTXhqZVFjK0xhTGc5VXdYWURzQ0RXRjZPL2M3djFP?=
 =?utf-8?B?b1lZZ1QxdU9tZjhPSytGSXZ4RU81eStTK2N1U1JjNTh2R25zSm5oZUhoL1FD?=
 =?utf-8?B?RWlWcWRlTmlWTzh4QTRsMkZMWVFOTWJKWkxFY3dhL0lySTJPaUs4Si9pNVZK?=
 =?utf-8?B?VTZ4QXZYL094RFBwbmM3Z0ZqMjJiU1Ezb25ESTdQdXJsUmZiNjZGOUY5Zy85?=
 =?utf-8?B?V3c5N05hdzZiVi9KREZCdFpPVE5zRGNkYjlqRnpSMTgyQzVwV3FCdGNZazk0?=
 =?utf-8?B?YzRlYkFKcFBQOXZ1a05MdEhIRDRDRWVTSlZXOVllRUlHNkJJcmJwR3hJZWVM?=
 =?utf-8?B?VHJSRE5aWkwzZ292SnVPTVZZWDU5NHQwekpEejV1YlVOZGJSZXlWUTNZMHZp?=
 =?utf-8?B?M2crQWE3VzFwNnJvajhXc3FkNUppUGtQb3JQY2ZvOGpVODhhcmI2UytGdytI?=
 =?utf-8?B?bUg0KzVEQ3ErZWJqZU1PVWZZNmN2aHZaNEI3M0VDQythU0JNS0tDQ3lFUlF6?=
 =?utf-8?B?SVJlc2dBT0RMRDNuNEM1RWpucEQvTVF5RzY0Q1dGNGI3ZUtwWTFGNkNRSm9S?=
 =?utf-8?B?L2hUY3JMSERBTW96VmkxMVN2QmhpV2cxWVhtM3VTUmFtc3EyRzZCYjl1R21F?=
 =?utf-8?B?bmJxL3BLaFNnS29yTTJBVVFyZEhsWVlIY0M3Ti9KZWVPbCtCd1dJdkJGS3Vt?=
 =?utf-8?B?MVY5NXE3ZnZETGphbHR2TW1Yc2lhaGQ2OUh2d1g2WTl2L09WT0VTNVZyLzNH?=
 =?utf-8?B?bGdVbzZHUG1kdTEyYmhzM1hYU3pKYkxqQlFCaTZwamFTRkk2MkpJbjVBaHJ1?=
 =?utf-8?B?dmVxVkpYamNPM1ZGdzZDak1wTlBPYUZCUk5WUUo0THlCY09HYk5KblNHelpK?=
 =?utf-8?B?dUZTWjBlRzA0SGFPeUVPa1BNN2cxS01tRDJpY29rOXdqR2FiSGJyaDZDR0tv?=
 =?utf-8?B?dWl0L2RWMXRNRlVtV2N0b3pPbkgzNWFVam1DeTNoZW5ZU2k4b0hQZzh3c09D?=
 =?utf-8?B?YnA2eWFkMTQwUDBEQjh0eGFMRXMxcXhuMU9UM0Zya2dUUi8vZkJ3WWJXclpk?=
 =?utf-8?B?dDNXeGNKUVVSWi9RM0tpMWtUN3BoenpmZFRuU0ZOd3FtazUyZEkyQkdpemVE?=
 =?utf-8?B?RGdnbDU1dy9XY1ptU2RTZGl6M3l6ZHZ3eDRqZWZ1ODB3WVdmNXZCK2FIQ3Nj?=
 =?utf-8?B?R1d0TmVsZlk4NkRnQlRvM0J6ank2SU9KSklxMG5UVGdUQmJzZlJKZzhuZDFP?=
 =?utf-8?B?OERZbDNFTEhRK0krNVR0bGszYVhJYUYvaGVIZjBZdjljcDI1ZWI1Mi9WYitz?=
 =?utf-8?B?T1hvMzJscnd6QlU0RWRCU2QxTkRCMTl3MGNPblVCVUFGUSsyZjZFczd5MUd0?=
 =?utf-8?B?MFc4WFJ3MEd4a21BR3M3RC92QVNtU2ErU1dPblNLc2tZVnI5aytZSUh1OGt2?=
 =?utf-8?B?WkxqdnhibmVpdzhPZ0dDcFNvUUxZODh5cXpKTVRTU1JueUYzc2dFTXJ4R2VY?=
 =?utf-8?B?ZFlSUEJhYVlFbjVnNldFcnZTVktsdVBHYjl4R1JXeCtqLzVRcXJzcUNOM1pm?=
 =?utf-8?B?dVRMVlJNME9uOERxU01HQ3JNeHBHV00xL0NDelo2ZkUxWnlXYk5BcUJzWXZo?=
 =?utf-8?B?K09LQmJZc3JOb0tTbHdpMVJrWW0rUlFpazNwZitvVFJxTTV5b05BTU5OYk10?=
 =?utf-8?B?Zmo2WFhmUWw1ZmdKS1V4TDdkNDdZcWdQVFVXNmV0M0tZSHpsSHhxTjZRQnJ5?=
 =?utf-8?B?TzgrVDJLRmZZMThyT2pTdGJsZ21rTEUrNU5Qd3JhV2cyQjl4NEZqMy9ObG9q?=
 =?utf-8?B?bzdLLzJKT2RneXFpSzhSOWNNTlAzL2N5cmtWU09WTDhRTWs3Mnl3UkpObm5q?=
 =?utf-8?B?TTJKOUZVWjErT0FKQkx0YTZOcmpCOWRjTVRybkdzSjFweUxHSTRXWGVCb1k5?=
 =?utf-8?B?RE1EbnZSa3lRZ1pGM1VtbUYyODJXTm9hSWJtWk5uVUpteGVWdnRsZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bce326de-7a28-4893-c265-08def3e73386
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 18:19:06.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SEu88PZeGzG5ch2kVZd67fFuYFKnM24gSXSzFEkcbiT2bBoXW0kGbBXnSdSIjv39/H/jj4W9XZ9L3apw88sFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7339

On Thu Aug 6, 2026 at 6:01 PM BST, Miguel Ojeda wrote:
> On Wed, 05 Aug 2026 20:00:07 +0100 Gary Guo <gary@kernel.org> wrote:
>>
>> Still more of refactors this cycle and not much feature updates. Tuple s=
truct
>> still doesn't made it as there are some complexity related to `#[cfg]`s,=
 but
>> the cfg-related internal refactoring are picked so hopefully we can land=
 it the
>> next one.
>>
>> I did a late rebase today to rename the API based on Benno's feedback. I=
t does
>> made it into today's linux-next (2026-08-05). Feel free to wait for a fe=
w more
>> rounds before pulling if you see fit.
>
> Thanks Gary -- we will need this on the merge commit in linux-next due
> to the changes from driver-core-next (Cc'ing Mark):
>
> diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> index c0cd24481ee3..a4927452016e 100644
> --- a/rust/kernel/serdev.rs
> +++ b/rust/kernel/serdev.rs
> @@ -197,7 +197,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::ser=
dev_device) -> kernel::ffi:
>              // SAFETY:
>              // - `driver.as_mut_ptr()` is a valid pointer to uninitializ=
ed data.
>              // - `private_data.driver` is pinned.
> -            let result =3D unsafe { data.__pinned_init(driver.as_mut_ptr=
()) };
> +            let result =3D unsafe { pin_init::raw_try_init(driver.as_mut=
_ptr(), data) };
>
>              *active =3D result.is_ok();
>
> Cheers,
> Miguel

Thanks Miguel, the semantic conflict resolution looks correct to me.

Best,
Gary

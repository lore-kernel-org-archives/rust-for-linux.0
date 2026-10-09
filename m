Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022117.outbound.protection.outlook.com [52.101.101.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576047126D;
	Fri,  9 Oct 2026 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555092; cv=fail; b=Vk7iV+aZ+0C+0dJaTHtPpICyNI9bRBbEq3RKovWUL3VDwpwfp1DHwMg82WyyEsGBKgqWH2qdYZP1WVAfG8QyGIbD7DbmcfBgow0KYT08GwNFymD1n0XGsNyV4SwBfsACl68vNUHtyTJNbD4Ge+YKYlMVYH+SdGbb/eAjqZVEW/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555092; c=relaxed/simple;
	bh=zxwCsfXA7tUvrkRoFDnG8sCr4CPeuKmG5u3i6HCviIo=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=mD13hlteY88gQPUTl3zIh4kc7qHgLX3uOEzJnPml9z6x+Ufmoxr9zQ+gVyUtbuf6fERn94F3M2CIMyB5EF5/ZGbI/D2UOgx5WnDfhlkXsGWFs44cGXRq5AVi26V5oaF8CRYnpx4Acl/mAP6aY+xYZsEmXUpv3phh0RDHJ5GmEBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=s/Ebh1AF; arc=fail smtp.client-ip=52.101.101.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="s/Ebh1AF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BX12BKor8BWWFtcOh0Ce9NupkAP6rpVV5y7uo7LD9T7UrSRIdNUVYjx9E4P+s+QBqFhLimHWFxkJHqRRv2uyWKHmNeFr+Xg7/zkffQRJB+/UaxilqMDVWi92LDcuBbDJ1J5rvW9tXvHhoVxM8PcYwh3EUpJWDNWaxo5l3PyLq/OxQ4A5HYzisVaMGsTqeM1q4bG5hb2NbgctVQ6PvvY+K25ddIr7Qwi8DWSiD91WnCrRU3lflWQHTmWdzp67CgMrr1MGRjXIxEQjwysxNmfWT9xQ44aSt39GiU51A+eyk+wGQ0oMrVVGj38DVVWKVn3WDU4J3WAfHqKVrhKtZ81qFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDkInDRgULduSamGqUWHTl3IiKl+E00czi51d2XSk80=;
 b=i4k5RAQgKP6U3yHVd/qaZEXeTHSWrIIEYj2BedKEg1wvSvlHxbJKyZN2T8TNiLbo7yTuh3Ypd/Q37f/V3aKz568LVXcdHXqRcM7SaIjp5fSnDaDf9TKBh7KX9kS4f+Qahi20aejrt7GZ0qTiEH49FJIzl63DGdWYVhGcPjLRElMncxwJXfbvIZyVwrLEYTrUPgPIVPlpE9e75n4bfN2Cl7EvNJmHcHnExInzOpgC2BxPfHmPbpavENLkBBxJgg1tJlIG488hwzssLd8mlpoze50CwKUvw02dkmI6EEO+vNxlna5BCZvQ9cq6OGsMyJKgeCzVMxjR5ZvWZigrWDEfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDkInDRgULduSamGqUWHTl3IiKl+E00czi51d2XSk80=;
 b=s/Ebh1AF4JEDm9d53prtEdLizSjma/+4po8ZYQQeTSkPA0qKhQFEyZagSeBy/OZF5JuiJ/Qj2NJsj+0pmm8ckT5ZQWa/FJrc/TO3EmIc6iFEp6I0501V7tkg24SV16cfiBQPCFkimOpr88mo8049Klz2uPuoiMvkAOF4MziyEZo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB3495.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 14:11:20 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 14:11:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 15:11:19 +0100
Message-Id: <DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Thorsten Blum" <blum@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in
 strcpy_into_buf()
X-Mailer: aerc 0.22.0
References: <20261008061326.177841-2-blum@kernel.org>
 <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com> <asflx_blsGkQ7Obn@kernel.org>
 <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
 <DM0C9ZEJA9EF.12IOGM4R4QG3E@nvidia.com>
In-Reply-To: <DM0C9ZEJA9EF.12IOGM4R4QG3E@nvidia.com>
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB3495:EE_
X-MS-Office365-Filtering-Correlation-Id: 754979bc-068f-4d50-0818-08df260f30fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|7416014|1800799024|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jrt5NKHNGo6mrxt+gMa086T6qCl/vRXEmK5+Z1aZ7QDysLi9+dMS8MYKFwsP09AsBlptZan7lbn0wzTvm8BZU5saM9QbEkwJdiKKyr8SeWzgNx9mdBxTIwR7HjyJ20RdG3f3rGI2mxDh2yKSiLj484GsAtnr76YQ4lnVSyWcaM9XUrHwc7WxjDk0OMTKq0F7gFe7A/mUGl+o0nLQaH9UA7Tkk9k6vIgLWc+9YxgwvZ14pgoP//4yVoHbiDX+8A/r27eX/7K1oGga0SF7Fqjbu11QCexMyIBMWyA+QSyENyxD6INeLbKClc7lTl+ik2vzntGlgdB+M0yaeQCYHS/YPhmT8lWu0sBXZR+9obb21GbcqaZpUnVtmP4TKKqksaqafl4Zd3/Yid0/KbWSYW95dcnv/X1io020X8SMiptCC/b8xi0PuuVGhHlrV18HZJE7VAU52gXxle++4Efmy14vFdD7NpwPorv0QixgSskf/Qpz7IvD9c3mKVUFdgE+uXI4aUlnxhJKnNiUwcyclJhdq14IFtLQ2Qy0FkiJ2S7pQWBk9kJLzPP896vm79NoYVbRSQ0u1hC/BPuYUlmwrVlGO7rbQGr3xuYPb4QeEubyFYz/sip1nrNmUwPjJb0T0LtVt6mQo0WYjeKS4GiyvNyzV6HSxGSCAe+0OkOr3JeV9Rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(1800799024)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnE3TzRlbDhvUkNReDB3RkEvTmRDWDMvNkNYOTY0VEt6OGJBWFZ6T2dheEVM?=
 =?utf-8?B?bTlJTWt3bzBaVGlPNjliOVlFbWFTSENSaTF6RHc3QnlmYm5mTWE0UHFjR2Js?=
 =?utf-8?B?Sm13dE1TNzhqRmtQcUZmUS9vNElWczNKWkRUL0VkcjNnTXo0YTNtckppUXpR?=
 =?utf-8?B?ZFp6SVUwWVVSdmU2NWl1RSs5NnRUNlhYZG1pT0tFZ1ZyVzhkVUdxNUoweGhz?=
 =?utf-8?B?Z3RhUFJkK0FiUzJISzlOSG1IRDVod0dJVjQrYXpqUEtZdU5RR1FjOWl2VnZl?=
 =?utf-8?B?emJYS1NvV0dMZU9IRy94U3I0UmhoYUx4OUZDV1A5bndRbXovejF6U042OEV1?=
 =?utf-8?B?VWJlQ0JxaWVlN084Y3NQWGszU0g5R05tVGhhZm1rSlhwT1h3eEpWMnArY0Ft?=
 =?utf-8?B?YVR5K0xmcVlyZXBMblVkTU8wT1RQL2N2M3pUYUtZUjdkZTcvV2M2RUxNWnRY?=
 =?utf-8?B?a0RqbFlVeitMRHhvTEhmOXl1V0pLNUgvVjZxTHZjRmFIeHYxSXd4aENlTk9O?=
 =?utf-8?B?WXU5ckNRRitCSTIrUFMzR2FDM0RwWjU5UHNtbHJvTHNPeUhFWXZpVWppR0lV?=
 =?utf-8?B?MXVGRXo3cVRMK0ZIZ1BMSTBOZVdIWVFrbTlmcWQ4Y3VSKzVOZ3RqN2VFTHA3?=
 =?utf-8?B?VWlqR2dKNU9RdmpWbGU3UXVNMTM0N3ZKOTNhZXBjQzRYVE42RW4wWGFHbEMv?=
 =?utf-8?B?WTBVYUpFbHJ4dVoxYVcyTEV2K3dKVlNXQWxhL0FBSERocGR3V01EZVFOM1lj?=
 =?utf-8?B?K0pYUXg1MVFKQUYxd0V4V3RzOGVwQUd1ZVh5MkRiajJtaVhNNFZNQXdkODdm?=
 =?utf-8?B?a2lUTkdaV2NLaVRUYWxoT2NrWXZ1V25FSGN0MGMyWCtsUVVBemRpdVFTM0g0?=
 =?utf-8?B?SFl3bEg5ZXBJZVpxRWJ0YzR5aFJGMHBmdTI4QkpyeUhRVUxFczB1dzFObkIz?=
 =?utf-8?B?YXR1L1ZhU1ZHVHJSRUJIZ3ZWdWhYeXQwK1JMOUMrdTh5Z1lBakJVQmJSZUVJ?=
 =?utf-8?B?REdIV2ZZR2Q3M0ZyTFJPQkFmblFIUEZBd3FlUHVWY3E0dEN0TzZTQ1JFQllQ?=
 =?utf-8?B?czlHaXhVWVFzYzNaNm1nb1BJVFdENUgyenBQbHplWE1Nb1dBL1MxK2NUR21Q?=
 =?utf-8?B?Y0NZa2pQb3cxWStaSFVwTHZlOGE2SnBENDdGQ0xMYXZ1M0lYamJaZ1kydUpM?=
 =?utf-8?B?djFYcVRySStNRFVCYVJnUzBTZng0ZDNtSm1JVHplTmJnYzl0TU1Gd0pQekhM?=
 =?utf-8?B?SjF4S0JwSXk1cytidTkwTnBjMzlmWGNRN0t4Y09QcjVBUnJEeERUZEZrV0d4?=
 =?utf-8?B?ZHlkMGtucG0rY2VMaDdGL2R3bTkrNDNWaTdpUGY2cWlRY3YyV1Exdjk0S1hL?=
 =?utf-8?B?ZFJlS3NzbUlnVlBPN2lqVmd6TGgyVmQ4aTl0Mm9LQWdTbXpNemx3aDZIUHJR?=
 =?utf-8?B?dnY0VHZ4THV0bCt6T1lXcVdYRTc2NzN0bzhza1VtUWFyc3ZjNDZhempud054?=
 =?utf-8?B?QzVVMnBVMDdRSm1pRWlKN1hSUHZVNVpjUGEyc2ljbms2TkVYWmZ6UnJ2dFlp?=
 =?utf-8?B?RlUveEgzaGZhKy9CT2lDbVpKR2xkdTB6dEh1VzMyMENmblFDTW1pTlFTK1dn?=
 =?utf-8?B?T29ZeFhqSHBlU01jVC9MejA2Z0ZXV0hIdVpLQUoydzVrRXhyQzkzUUtURUcw?=
 =?utf-8?B?RSs5N1BVZlhaczBEbDZNbWdocFowZkR1K05TK0ZXeHZsVmJBUWR2TXdsay9M?=
 =?utf-8?B?ZXlyWEZkc2Zta1h5Z0hlV1VmZGhGbXY2b0krOUJ0akFsR01ZNDliRmFnL0FG?=
 =?utf-8?B?cTN5T0prYWhOQmZab3h0SEZ5cjFuVjNxMmRhTjh0dTBkdXU1cHFqeDRkMzFL?=
 =?utf-8?B?TDE5REVpMUtpZTlqSUpjekFOYmZnTmh2MmxLVkNqMjhIWk5PWUZZMnVjdTdW?=
 =?utf-8?B?bGtnem00QTROWnU4bkZkUFY4NjdiNWpuaGZ3RzdQaGVJbmdUajUycEt3d1BC?=
 =?utf-8?B?K3BEVHRuVExrY0E1Y3hPanRZa0V1aDk3UVF6MExSK0d4eU5zK1h2UTRKME9K?=
 =?utf-8?B?RnBLV0h6bWJpTTl5VlQ0Y2lsRGZwZjY4anRhOTc3NTNTODBObVltalFYbTBX?=
 =?utf-8?B?Rm1yRUFtR1Y3YWNaN3JyVGFweno1amZwcTdiVGk4TTQ5U2IzcE1GM09GcGl5?=
 =?utf-8?B?YllaQUs5c1lsMUZWdklyTlY4dWN5ZjFWQzU1dHhlTENoOXh0RlpUTXpFRTJD?=
 =?utf-8?B?Zk1weTFyRjFNRFNXWGhhU1NMcTJ1RW5LSGNuTXpmL2pTYVlSazRWTFhMUmpj?=
 =?utf-8?B?ZHgyeXZhemtVektxcGV0eHpCYTh6ektUUmMxTys0eERUNXdyaUc4Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 754979bc-068f-4d50-0818-08df260f30fa
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 14:11:19.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6Qqso5KsDddXFrHRX5QyCQic2Ih+NWFBQO+aug2eWFUFS4xxp+emGEtPPVathCrGpMBUDdzLE3V3qR99EvvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3495

On Fri Oct 9, 2026 at 2:24 PM BST, Alexandre Courbot wrote:
> On Fri Oct 9, 2026 at 4:23 AM JST, Gary Guo wrote:
>> On Thu Oct 8, 2026 at 7:49 PM BST, Thorsten Blum wrote:
>>> On Thu, Oct 08, 2026 at 10:15:49PM +0900, Alexandre Courbot wrote:
>>>> On Thu Oct 8, 2026 at 3:13 PM JST, Thorsten Blum wrote:
>>>> > Since strcpy_into_buf() already rejects empty buffers, use ok_or()
>>>> > instead of unwrap_unchecked() when NUL-terminating the buffer.
>>>> >
>>>> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>>>> > ---
>>>> >  rust/kernel/uaccess.rs | 4 +---
>>>> >  1 file changed, 1 insertion(+), 3 deletions(-)
>>>> >
>>>> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>>>> > index 5f6c4d7a1a51..2a0af795e75d 100644
>>>> > --- a/rust/kernel/uaccess.rs
>>>> > +++ b/rust/kernel/uaccess.rs
>>>> > @@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mu=
t [u8]) -> Result<&'buf CStr> {
>>>> >              // This means that we filled the buffer exactly. In thi=
s case, we add a NUL-terminator
>>>> >              // and return it. Unlike the `len < dst.len()` branch, =
don't modify `len` because it
>>>> >              // already represents the length including the NUL-term=
inator.
>>>> > -            //
>>>> > -            // SAFETY: Due to the check at the beginning, the buffe=
r is not empty.
>>>> > -            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>>>> > +            *buf.last_mut().ok_or(EINVAL)? =3D 0;
>>>>=20
>>>> I am not sure this gives us much - we are trading an unsafe statement
>>>> that is well-controlled (enforced by the first two lines of the method=
)
>>>> for a runtime check. I'd say this is working as intended here.
>>>
>>> I checked the generated code before and after the patch and it is
>>> identical since the compiler is able to remove the additional check.
>>> Therefore, this removes an unsafe block without adding runtime cost.
>>>
>>> It also avoids relying on the buf.is_empty() check to prevent undefined
>>> behavior.
>>
>> Adding an error returning path is worse for something that cannot happen=
 is
>> worse than invoking unsafe in my opinion.
>>
>> Why not just unwrap?
>>
>>     *buf.last_mut().unwrap() =3D 0;
>
> I guess the author of the code decided to avoid `unwrap` for the same
> reason they avoided a runtime error: the first two lines of the method
> guarantee that the access is valid. Now I wish we could keep the
> enforcing statement closer to the unsafe block relying it, but I cannot
> find a better way to write that method. `unwrap` would just switch the
> `SAFETY` statement for a `PANIC` one.
>
> Honestly I think this code is fine as it is.

A `NonEmptySlice<T>` which is `[T]` but `first`/`last` can just not return
`Option`?

Best,
Gary

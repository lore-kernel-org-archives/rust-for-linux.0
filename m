Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022096.outbound.protection.outlook.com [52.101.101.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D252BE5C;
	Thu, 15 Oct 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073308; cv=fail; b=OArlw+FLpp4q/7+wqPwyXK3EFLxpwv573PycssG+MO/O8JbwTcajmIwdA4NfwC/r/xpxlWz2UfuzovdFHpTgxlNrhJnGOH8cAzUD6ZtZ4oFfygUQo6wsQHap/QhSeLoTM4WX8yCvKc78VVYZ04aT3s1QL/ZEMt7H9bFgVjLBe5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073308; c=relaxed/simple;
	bh=zcBgD3e8bPAoREQyzFwm0HxA2xY3cV+cW9i26QQcrXc=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=OUWjUAb06Lvp71AesEqfRIqTBilwFWPRDxGJDR1TbCj32G4xHjughA3Yl7ZLO+6dZoG+78Vk/IiHA73g6CeQFjxMWBabGsmxpXKz5tvlCcH/hlzRvvF8Q5Ny7LxFnY2/Uf7eorJlvQI4G/lsMPEoD++iOJhdGKXlNz7l9L/8OKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=E8LO4Q7J; arc=fail smtp.client-ip=52.101.101.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="E8LO4Q7J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEjpFXwiIO8AohdCTCJmkGBmtxrz7VAJxeMs5WDbiRs1tHWnMfSro6XLhjSZzeKyOiiTYfq0ojkYxSHHWOZYPHYRQQOhiRRd9o/ZQreqaP54jkRn6jNVivjWkoE6MMpPfZfrrOC7efOkVDvHCeOPGi0QIQfT34IYvnhHoJkilRY9VW6XMABcWdA7NhV3qZ0PUHjVxWAAoaUZOXoM9iIUQc0+aRN2rd7JqyKfGcZQaJdL8k2o1MW0gC0Kf5NuWHldTYU1R8dcFEENsi5DB5z20Cxl68pgagGHtfWJM8lAkZm+3NVh5lkyktKVUB0oGoIz2WVR+MfpZIrO2tZkYhioZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Fv0ooJibu0MDP7t3gDB2Y1S93jrcDeFla80jd2MwzA=;
 b=jCYW1dcOMPLWcR0cSoDwgYNPhTfIWPUjdLard/g4t/W+St5ltLkpKud4uSeHyfTycAMHSzlw95LmC9CCo98RhYMSwJL92hmi7hCcpYSJqsct4GLTjhU21C+w0uH9DIC/80oIGKpfw8u22p0jbwta4++h7KBfx3DiUBuIRMCQWfWlp/1wbqXYM3VsUtnKDW+GD99+6LNxJCjqPwmp0M6WeBPb9n3QI3EBw51X16wxak/H3MB4W7uAyLw30aNQsO7Gy1ZJzChvyYgDqKcZ6uFxWM0TeX3cUAvXTPKyPy2V5lDjC7cq8EUH1K9ddLa/S9/opf6yhMeBSnHOBVff3xfN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fv0ooJibu0MDP7t3gDB2Y1S93jrcDeFla80jd2MwzA=;
 b=E8LO4Q7JHlxjMfKnGHO1zs9BlKZD9y4+c35IGLax9qcnG3dXEMoubl+4VCiR0hYBp9ynx3+1mWKdcSAWyTFKeGgYE0YkiGt3asSp906Ezr5iJOloKVI1f3902z6i2zHb1svaXOgIfU5o+4bqPyQkzsVt8w8RinNBaNk9dHDNBj4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB9382.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:08:23 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 14:08:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:08:22 +0100
Message-Id: <DM5GYU1H0Q9I.308S84Y1RV33P@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Lorenzo Delgado"
 <lnsdev@proton.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 0/2] rust: add NonEmpty
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <DM5FG6VMG3U7.1XMZW8RJI2KLM@nvidia.com>
In-Reply-To: <DM5FG6VMG3U7.1XMZW8RJI2KLM@nvidia.com>
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB9382:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bb1340-0ae2-49e8-d3ec-08df2ac5c64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|10070799003|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1uUAObK7s7rJARojME/1bVCnJjFtH57wCaSzXadP+4RTCd98aUsKRzpg+A5pwt/RNFZdKsnPqv/gPDP9g7UQMZD436IBNh9lvZBL0ZORwLzFj5fa2KsmC0HyoOWpDPGfNTRdgqMMABlQH9baxMTCrXec9EQqJkPgb6FsfNDYuQ+72sd4aCJohG8Mu3/EaUYgvkNBZsZgUbxO4Cfhy3Y5RqoLfPtiw4eSCGE4iMNQzBs3XLdc/NB90i8aHxDoAkHMVezdaEnMc5QuWX1saaf6zpZaJZ9jC7G3FcDRx+9ZO5WLbd44fcPwE/dSSaTqGxCZG5Fv4CW1DInVD87o7zqC+gJjWN3LS6aKt9zn2WsnWkI7+p5l2ouPWokWLewgsD2/TlwgnX3AM31vpwx0nRpuIo1zVkRMoyikXODdIWxgO4KO79gTSDTGLlVbSyhDBSAqIM1zCS4YW0HL8gXzER4wHZjdlDJsXNi7Oer5CctU58JcgXJNWopsThXVYWl2TW1+8KE48hbjOFxbtstCHMJdG5rTltr9SgzSGGg1jIAOKDlJ32A5WY8TrgLnK/k0UJ7v6JEPxDhmnySqwJxsLvzc0JghOLOnDT5VnVTsinDZO6JHJSWc/6UycxPDnETmkiDhYEnr7dNipp/y7o8Z3xIWIx1/zU3vhHtt9oa8jOlX9Mg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9KOTFwc0NrQ0daN1B2cmxkTkx6Z29tUEVrcWhuL3BjL1BFRXNZc2E3enZl?=
 =?utf-8?B?Q1Ywd2dZbk9lQ1NHbDhzd0hIVTFGQ2dRb1R2Ukp2YmhpaTU4RkJ2TTM0b0lO?=
 =?utf-8?B?VXdGdkx3REZLQXM3azVjNGFUVTBXMXYzK2xqdGZvYzBSaXhEeHA4c1hsVnhM?=
 =?utf-8?B?bEFIUGtkdWozKzJlUlIrWlk0WEh0c0pQSjVKZXdOOUlKQjhOTnFhTkxhQTRx?=
 =?utf-8?B?eEJrTmdkU2N1eTBaZXFhbEMxNFBmZFZSTjMrVUV1M2NxZFU0Qm9QakFkMHVI?=
 =?utf-8?B?UUl5OFVPNzZZRUU4MXRvaHh6dnhqN1BrMVVKTXZUcUh0NlI0K1lNTHNVZ3VV?=
 =?utf-8?B?d3o3TmNyaW1Mc3VuQ1pxN2lHVEVaemhkTHpMVG9oTllZb01vOXpGTnJENU5V?=
 =?utf-8?B?RW9LYnhjUHRldDVBb3NMZmFPekE2WXI1Yi9FQTI3UG9WS2t1cklNLzlnenAv?=
 =?utf-8?B?M1NrWHBJdWRKN1E5anM2dy91N3dHYzNGc1lNMTBZTmRFYmlUUVZjdmNNV1p2?=
 =?utf-8?B?azJMcWRqMlppNFZOLzZkK3dxclVKMDI2dTdOd2JZbFdmdWFBMnkvRVJPb3Jt?=
 =?utf-8?B?TGt6QytxbjRXVUVpaGtLaFRLWEhXY005YnNvYVJsS3pkY01KaHZkRXREZ3Iv?=
 =?utf-8?B?WjNWOHBHbVo1SjNmMHJrRWNiQXdSVStXdmtZY2JyUUR0cE9SZGc3Y2lrOWVV?=
 =?utf-8?B?K0xrYVFCOXZkMWZScHJGUXNCSzMyRnk3bVdhZUh1bS9FOGVhazJYRWlIcEhV?=
 =?utf-8?B?TGs4SmlYTngxQmV4SjJSTFpSVHRWZHZBSkdpVDdWbGtpOWtyMUdlNTVsTHh2?=
 =?utf-8?B?L1htWUZUdURQZy9QQnZybHJBTVZ1NGlBUTZtaFhJSkVLYWpxT2VOZlQ2QXB0?=
 =?utf-8?B?ZWdXTW92Y29HTzZyR1IxY2dUdDhXSmdMYi9IOTdhbUUxWEZRc2grMU9qZUVX?=
 =?utf-8?B?c0JEYTBBZ1ZrYWEraGhCa1E5NEpnTzhzRkF6d3VLUWM4VGEzL1JUdXRnZ0JF?=
 =?utf-8?B?RlFKb3kxODcxNHJLTE1pV3NwK0pRbWh5aW1SODgxU3prNGJ0RW0zQ3VNcE1F?=
 =?utf-8?B?T0t0aUhxRXJMalQ1MmcwT1JpcGd3Q0dkbGp6cUxUTmdEU1ArYmlXTEs2Yjd3?=
 =?utf-8?B?V0Y3dXRzVXhaZjU3d1d6YjJiblBMaW1RRnQxZVRkWFZpYU5xdldwTjI3aUJG?=
 =?utf-8?B?cDhKQ1o0a0NXcEJvRmtGSm5kWmxRZWVlNjJMZFRCeWZUUWlVdVYrbFF6WjNt?=
 =?utf-8?B?a0NNbzBBc2tqTGdubWRmenVYd0xQelBvWDU2VTl6ampXdldpRVlXNkhMQ3Nx?=
 =?utf-8?B?U0UwVThGTmZIVnh6bUg5L1BvTi9ZWTVuSWhEV2d5OTZjRzcwQ3BiWWE1cWZX?=
 =?utf-8?B?TEFtbzU2S0xCUnZwai80WE5qeE05dlJ0d3ZkNm5wVk0xRzRhZUxDWnBXTzR2?=
 =?utf-8?B?aXJJcy8vR0lqSlcwa1NJOCtFRDA1d09KRTNveHFnSTlUa2I3ZHlGY2s1YjZ3?=
 =?utf-8?B?YXlSdjRjdmp4dGFGckFGdC9kRm5Ed2ZtQWpLZDI2c2xLS2JEWk9XZTh1b0d1?=
 =?utf-8?B?dklKcVJNYlZ1akdPMU00M0hkVnpFcUd4N0hIVlhCVTY0OVpXVHEvSjBBNUYx?=
 =?utf-8?B?Qk9ab3lLRHpiVWFiT2M3U280VjJ3c2FCZkovM0E3dkFPVTZ0VWlvQUZ3YlZJ?=
 =?utf-8?B?aUFFZERHWTlRSGlTNE5pWTRBcjRzVHlpbGUxSkI3OW84aFZlVktPV1paM2Ju?=
 =?utf-8?B?Z2J3NUdDR2JZcmhlM2JyNVFGRUNMYmZxVXcxb0NsZGdLOWJHM0NqdTFTWDhq?=
 =?utf-8?B?TGoycHg1OW1KbTlKVlpzUm5oODJ5THZvMWMxT2Y3RlV6QnFVN3liaTJUbTJT?=
 =?utf-8?B?N0lONisxMzRWY1g1VFFiTW9ITjdqM3ZxdEkwSWlVQWJMUzQ3aW4vaDhMc24w?=
 =?utf-8?B?eGRtUWh1Rjl2ZzVhOXh2RlY0SEN4cm1MaFF1RExQSnpieWo1OW9ObjcwbFB2?=
 =?utf-8?B?aUZNaVY1SFpseXR6N3Jsdm5wM3JaMmNjSWZXQ3ZGbFNxN3JNTVdQb2t1a0lv?=
 =?utf-8?B?cStxUDlMNmNpSU9uZWdpY3dSZlA4Q3BiQlhpbTV4ZlIvV2dZRXZxYVZtR0t0?=
 =?utf-8?B?aGI1OStaZzlFc2oyazBnaDhsaEtzRkFMK011bkk3SmJ6M0dHZUV5dFNqQlNU?=
 =?utf-8?B?ZWNMYUlDcTRyK1RDMWxSSkVxSmNJNVg3T211T050MWUzcnJHMXRhMGQ2VVZF?=
 =?utf-8?B?MWlFbnZGWm50TDVGbk92ZFZJZGpWYUE5Z0o1aERHNkpIODVpTDFENjgzVU43?=
 =?utf-8?B?WmEzdWJiU3k3TUpGV1ByQ3R4VDFOeVc2Nm80NE9JZkxRL2MzcGRQUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bb1340-0ae2-49e8-d3ec-08df2ac5c64d
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:08:23.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+MDMwQLdbsX+PlspUvnq6gjS+tPcxCEQNQP0Ds+9nlEMKsl4/dDpIX7TKpiMcmq5ny0pKoO9Q/r0iRrpX1fag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9382

On Thu Oct 15, 2026 at 1:57 PM BST, Alexandre Courbot wrote:
> On Wed Oct 14, 2026 at 5:30 PM JST, Lorenzo Delgado wrote:
>> Some functions check that a container is not empty and later rely on it
>> through `unwrap_unchecked()`, `unwrap()` or an error path that can't be
>> taken. Gary suggested a non-empty type for this while reviewing Thorsten
>> Blum's uaccess patch [1], and Miguel filed it as #1262 [2].
>>
>> Patch 1 adds `NonEmpty<C>` in `kernel::non_empty`, with only what the
>> first user needs: slices, `try_from_mut()`, `from_mut()` for arrays
>> and `last_mut()`. Patch 2 makes `strcpy_into_buf()` take a
>> `NonEmpty<[u8]>`, which drops an `unsafe` block and the `EINVAL` case.
>>
>> Some notes:
>>
>> - `IsEmpty` is a safe trait. Unsafe code only relies on the
>>   implementations in `kernel::non_empty`, and the docs require the
>>   result not to change while the container is only reachable through a
>>   shared reference. If a generic accessor ever needs to rely on it, it
>>   can become an `unsafe trait` then.
>>
>> - Since APIs aren't added without users, other accessors (`first()`,
>>   `try_from_ref()`, ...) and containers are left for later. I plan to
>>   send follow-ups for `net/phy.rs` and `scatterlist.rs`, which both
>>   reject an empty slice and then rely on it.
>
> Having `last` without `first` is weird. Please add the minimal set that
> makes sense from the get-go, these are `pub` anyway so clippy won't
> complain if they are unused.
>
>>
>> - I put it in its own `kernel::non_empty` module. Would a broader home
>>   like `kernel::collections` be better?
>
> `kernel::types` sounds like a proper place? Or if we want a dedicated
> module, `kernel::slice` to match the standard library? `non_empty` is
> too ad-hoc and specific.

`kernel::types` is too generic and becomes a dumping ground of things. I wo=
nder
if we should group things that are new types with just range restrictions
(together things like NonZero, Bounded, and perhaps eventually Range, NonNe=
g and
others).

Best,
Gary


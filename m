Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022109.outbound.protection.outlook.com [52.101.96.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AFC36D9F0;
	Wed,  4 Mar 2026 18:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772649607; cv=fail; b=NL67U3/NgIPfzZNlhntx3C3Xy1otYq6THnF/vZca+FslJYWpD/UUCMb+d+ZKyJjxBWwYSwFYcA0w6KZp+tsaBNgEd7pl9aVx4u/6D4HN1P/Y1J38OlqfWjJMgUkCbDS9i/H2Gx+GnbXNqw/i92euwpR/uKa3R2BjUlJLtkeYEL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772649607; c=relaxed/simple;
	bh=Qnv55CQQxoCtnVClUD5V2lvl9ZxLt1M0/381kKr2IGY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BYHOr5mjchfgizvBdsOxdnQnwwwB8wrxLJUwOjyvW05cj5zWHcOzR208H5voCnuvrJV7QxrZQkyCpm8mpYHOyKzwjvCQeeN/EGajbtBeGbSU9AU1E5QtQI6ko+I8LentLcpHlsCfAgF9aa5EksYQsl+guXDBAT/pu/4SMkrH5ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FD98NUHq; arc=fail smtp.client-ip=52.101.96.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FD98NUHq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fruY1eWtaGZ3E+pgs+Cm2E4MHnMy3X7f+e3Qdge9LcIzTHzPNYgmHGVF4G+ocfZk2uHwcnVwF0VJ7Q5aY0rZJgbGxf5j//AfSjrrBrjjl5ezrfT++U1LXedIZNPW+7ZdkX6aKIW+MHMVqcr+QrYOqWTsj+cczpnHg64BLUYnr5iqHf+YtIbBJbIsN9buxAcGaZyN6utdy/Bqhhiy1bYIdd3po9SNbv4nzRXs8v/DUBgJ8i3COIY/kOBaViYNnlpUaP5q0Px8a2t1QUb0A2kwmv4ImyoTZndUpSfLtpRh4+XiJr7vn1Q3yHucxkdvGfMToVq6DoiYpmGArnxVPt6DgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3qdxGo5hPr3oKH6T+wLagrbFGT04nZTcvRTQv/I3q4=;
 b=ZYdzbgolDimZajrApRZ3VU9uuzbbkw2XzcFiLBwtiLfRoi0xIaLsJ4X2naC7emkCxqxxMMzAqmJxORYBJlN7SzT7fm4oB5BLEQGt4FRt/Dmj+n3mP0M1j9dACAB8S8GunaFBXq17+QtQo+G68D3uHu/46sx9dQdqzA/QQ05lBuzAxs+jijJ2re+cdHrhHqvsx2dwjHXZg0HCHuJUk+CI6CGFZr71KA106HXh3mta8mUk4yYtrLuFv0lgwnZr8hJ7ZSgQy+W1MpxdDULOXnDuNBUsz6rf+HmL7JvuybPCvwE7eg4rHWOAxrVMOS58LuJEvmDD0TyOxb+wlm5NrcllSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3qdxGo5hPr3oKH6T+wLagrbFGT04nZTcvRTQv/I3q4=;
 b=FD98NUHqYm/fYAwQUcFAsCb/b1Bg3t/cynICk86oYBsgWUyf11/j3Q81pxZ151wL6qEsweuqXAIG6jOHUYeqa67gQSUl+frsuyErgflvMvyd4XIwbY76ghTwB7m6myoTAwIeIJ8P/nluFrY9YB/pzH0ogrPry26A7IXzenlQnDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7417.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 18:40:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:40:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:39:59 +0000
Message-Id: <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
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
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
In-Reply-To: <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
X-ClientProxiedBy: AM6P194CA0092.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::33) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: f54dd21a-a1f7-4f29-3472-08de7a1d719c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	h9Yi2R7vk+UtiWgh60brUsNQbQIBexGAYqXaygf0yh6/h7XfOZQXcJIvxmCAu9THKOs7oNTXu8SVRRv4EmFQl8C4ipH22XwvG94Ov+J4MunF0CoNXJSzvoaNCROzFnSt+gptKSdJl8jBZsug6Bg5hpRzv7mwtP/KcxddSGf3iyTF2g8vlJFGvYakEu21W+boV5fhhHWbpqsUoHz8zJc4yr7g7i1M9jBhAmwverOnmFgvwXRL3TksVNsZGHAL9iNeyPL21LS26gdcx2OpRp4MGRZugmpoCvvTn3SxWCvo4P9mw+mKk9O7TXPxBN347mcWEm8iWyz2KbYi2BAKVEqBlgMdXR3A9JTwIOAlk9LeoT2OJdTpmmhgWuFBH/UijbH1bUMcSYP20iTRAkpFVmxnzWgAQb8M0wPtI0RYhJ6zuBst9V6PIgP2e+n2rfXjpl+BfQMIBcJ7LkK/ITGC91IECQ9VVvQLDYytwBNfzU0+Xa8kOss8f4GRM0fakFlpcd1RKn7uneI0/n0UjKVajVMdlmwYYqSelwctVq7+SlXi8LNuPh8JupY1cprJ76skC68LAmTSFcAXHGxZPdg1LezRtip9wV+xjkuIXYAQqDBmEJAHgOMLUnMfZAvqyxdWes8jAZfPLAs/Q5y9Ha6XaDgmg12ecfBU5bIYrd9CKBUTJ9mukRo+EVxgGVRvFAbt6/NS1AGSuqB3dzjGtD0mle5CSC01jZjBqJ0916gddIjoDIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGRwNDZSajMzbFNiYmFaTlFqQjZ4KzR2V3hvODJLcFRVSUdqNlV2RlN5blNZ?=
 =?utf-8?B?Y2JpRFg3NFdVSGNxV1BzOVJoTnNjcVBEVE4wT1RjNU5yRzZwQk5VOExROElB?=
 =?utf-8?B?VTNJMjAxV3JFUEo5RmNSK09NcUoya1JpejZPdHlRNzNTbTlzRXdnS3BNeFc3?=
 =?utf-8?B?bFJ5aGZRbWRwVVZKZXNaSzBJZDNMOHFZSy9DbGZ3TFNwVURSbHQwNVgyVVMw?=
 =?utf-8?B?SkY4Vzk0dU1QSDRrUnZvMzdVVG8rME5xQ0c0UGQrVmYxL29KRVFqbStlOEVR?=
 =?utf-8?B?WklDUVhsNmYvcThFTEd4dFp2MVpWZ2M0YnR3aFhMQ2p5Z2VsOGpjTk1JQUhm?=
 =?utf-8?B?M0FGN2NSNGt0Mi9PL01nWURZOEpMTVVpMGpzS0ZwdXZxMzdaZFdOR1hhcC9C?=
 =?utf-8?B?Qld0VzZnZ1A0dk05VnBQYnlPL3Jpakowd05ENEgvaXlUbm5aVjQ1bU10cjlR?=
 =?utf-8?B?QjFyRGVlVlcvU1ZxQ0dBQkpTbDV0ZGJlL0xSbXVxWncxaU5hdzNrUzNkOHN5?=
 =?utf-8?B?bE9yQjJZUkxQSzRWbjQ5dnJaQUFreGpPblBWYjBLY2pWN2lpaXZUVmJPMTN2?=
 =?utf-8?B?RVlsa0ZQaklHd1gzS3pmb0xHSUFmdHhDV1NZOUx4bEFUU3dmZkxwR3pES2JR?=
 =?utf-8?B?dnoycHBMWU03V2hmTjh2RWkvZm5md3IzMkQ5OC8vbUhoeS9yMGthYjhSRkJV?=
 =?utf-8?B?RGNiS1lYUnVOR1Q5cVZRd1Nyd21PY3U0RlFFOEhVa21zM1pOYXJ3aVlDVTZ1?=
 =?utf-8?B?TlRUV3Zyb2xYdVR5SzlqZGRmSFdSRzRaNXNxSFJMOFhkYUhRczFNZzJzcERE?=
 =?utf-8?B?YWpqa0Jqbk01OVRLRVloVVcra2hkdFFuaHBxa1B4T2tIcHZiY1V6ZDFuTSs5?=
 =?utf-8?B?OU1UOVc0bThlOG5FK3Y2MHE2ZE00d0tYL05scG1BWVk5VTlNSC9qZEZuKzNw?=
 =?utf-8?B?c3FiSk1yeWg2ODkzM1FzcmNNVU01MUxLLytYYm9xMytIeU4yYUhsUkhYQ1hV?=
 =?utf-8?B?UFhrS1o1Rm5XR0J6WkdkL2tKQzBhc1gzNjlCMXRTMHo0Qm43a3V4WEJRei9W?=
 =?utf-8?B?UEcybDhCVUhodXVrbTNsdHhWd3J0UG9BSVdyVjljU0EzaVhzQ1Bvbmt4d3Fy?=
 =?utf-8?B?L0ErTjh0VXBQdWVuSnN6dzZ4Q3RodjMvZGtBOCtKVHZmRTZ0MzNaWHF3MWhJ?=
 =?utf-8?B?RGV2c0xQMUdjOGtUTnc3czFkMzNXQk9PeGZFTFJhdVlteDA0VmtrMEVsTDBk?=
 =?utf-8?B?VXNPbHlHWWY3NGFKc2d4VlFad2pDSGt5VXpGWnc5UXpOS3ZXMm1VdnFkcFdG?=
 =?utf-8?B?a09pNXUrQkNBeFhuQm1zMUxUU053eEMvZmdHcmNybjYrK2prQ1pFb0FkRWM4?=
 =?utf-8?B?ZE9TWjU0MDFYa09HQ2JzTXljak1EV2d1Y3dHeU9TZVE5bjhiNjNEZTNtdGVZ?=
 =?utf-8?B?cmlZeU95WUQ4YWtVMFlGVkhWYytWNGFjUllzdmdCNU5NR0FZZFllR1p5L2py?=
 =?utf-8?B?d0FwQ2hSZmtFRXE3cE1vb3ZPbldoSndHc3Jxajk0TStPODVyTGlFMzFmcWs5?=
 =?utf-8?B?djl6NktrTm1GT2dBRklWQnpDMko3eDRNdkJhbmJJWGpTc3ppN2t0b3ROTkRF?=
 =?utf-8?B?ekhUb0dzNDlvMjNwcXh0Tkl0b0xaYldlUFFpOXNXR1gvSFRHSkdUOEYxb1JW?=
 =?utf-8?B?ekF4SS9EZWFseUx0ZzRKclQ0N1hrbnFidGpxS0xtQVF0cFZBTUtzaVM2VlJR?=
 =?utf-8?B?RjlId3RGQ0wvSHpGemJkb2lJOTNBRHV3Z3BQdDY1THAvUXRuVjNReC9HaVo3?=
 =?utf-8?B?TGZ2RVBBb1NrSTM4RGxJdVNTU1BZZ3Y0OVNmejJpOU53OUJPanZ6ZUg4eGZW?=
 =?utf-8?B?cUVkZ1lFUmF2RE5pU2JZWVNZYmJ3ZVdEcHhTamgwK2ozK08reXhtQk9iR3NH?=
 =?utf-8?B?RTJwTDFLSVUybzh6bCtEdkhaTkFPNitMbVFLa29BU3hSS3AzQk5MN0YwWlVo?=
 =?utf-8?B?SlprT3JFYmw5OXZxRDg2eEZZcGZjN0dBZU5NL1pETFM3MVptaUpSQVU1RVBG?=
 =?utf-8?B?cXVQbXlzNTZlVTNnK2NXQnZKNnQ2aVMzOG15cHI0eThRL0xZVXlqMElBcDN6?=
 =?utf-8?B?TVRZZjJDYWdYaFN4cXluOWhGMjY5Q3JIVXZicDA0UE5NbkdCVTd0RE1qQ0w0?=
 =?utf-8?B?ekhqZnpaemZRV3V4SlFOMDlKRk5UQ21SOEoxYjlpWUVodm4yQXp0NUVWc2Nn?=
 =?utf-8?B?VEpJY2JDQlcwWUtFY2w4M08reUhwTVY0M2RqOVpkbnV3V0dmSllSUEJsZ21L?=
 =?utf-8?B?TkpmUzEvejRQUjd2MjFrQkdxNnovazJLQVJycks1QXVOZGNibm1YUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f54dd21a-a1f7-4f29-3472-08de7a1d719c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:40:01.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryfCwaO5ruvVv1uVVMUmtmRkJD5pOjCxhILEgSsiSqEeTax7xkVZ6knpgNiET92qi4v1f6DA7q+bga9s0gEKQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7417

On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>> So, to get a better idea of these two options I have converted this
>> patchset to use the 2-arguments `write_with` method. Here is the
>> difference between the two - it is particularly interesting to see how
>> nova-core changes:
>>
>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:regi=
ster_2args
>
> This looks good to me, but the fact that this turns out nicely has nothin=
g to do
> with write() now taking two arguments. I.e. there is no reason why we cou=
ldn't
> have the exact same write_with() method together with the single argument
> write() method.
>
> The contention point for me with a two arguments write() method still rem=
ains
> that the arguments are redundant.
>
> I.e. you first have the location in form of an object instance of a ZST (=
which
> in the end is just a "trick" to pass in the type itself) and then we have=
 the
> object that actually represents the entire register, describing both the
> location *and* the value.
>
> So, let's say a driver creates a register object with a custom constructo=
r
>
> 	let reset =3D regs::MyReg::reset();
>
> then the two argument approach would be
>
> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>
> whereas the single argument approach would just be
>
> 	(2) bar.write(regs::MyReg::reset());

That's only for bit field registers that has unique types. I still believe =
types
of registers should not be tightly coupled with name of registeres.

Allowing a value of register to be directly used for `write` is also confus=
ing
if a value is not created immediately before written to.

>
> So, if I would have to write (1), I'd probably be tempted to implement a =
reset()
> function that takes the bar as argument to hide this, i.e.
>
> 	regs::MyReg::reset(bar);
>
> I also can't agree with the argument that the notation of write(loc, val)=
 - or
> write(val, loc) as the C side does it - is common and we should stick to =
it.
>
> This notation is only common because it is necessary when operating on
> primitives or when the two representing types are discrete.
>
> But this isn't the case here, a register object is already distinct in te=
rms of
> its location and value.

I see no reason why register values for different locations have to be dist=
inct
in terms of value types.

Even Nova today has quite a few registers that are just bitfields of a sing=
le
field that spans all bits. I think many simple driver would probably want t=
o
just operate on primitives for these.

Another example is that if there're multiple registers where fields have th=
e
same meaning (e.g. a device address), then a user might want to just have t=
he
same type for all these values. We've already have an example of register a=
rrays
that share types, and I see no reason to forbid non-array registers from al=
so
sharing types.

Forcing all registers to have different types is a design direction that I =
don't
want to take.

Best,
Gary

>
> So, unless there is a strong argument why this improves anything on the u=
ser
> side of the API, I still feel like we should keep write() as is with a si=
ngle
> argument; having an additional write_with() method seems fine though.


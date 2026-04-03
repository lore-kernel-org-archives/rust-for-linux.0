Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021078.outbound.protection.outlook.com [52.101.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B83AA512;
	Fri,  3 Apr 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220508; cv=fail; b=dhDrnIDyItIxhZUDNwIH+XP+ZS7/rZr+wbzgX/9oKqKVMby9oEhvl1YV/4U3Am7Dy6Y61FNn71AlPFj3S0NE9QyrDbtnsuZOcT9Wb0I1oNnBY8PHsvvyrCVLXhJ540JbnEnV+FlYPzJnHcG+ZlKaQf6WBm3VKkjt2i1H0UiS0J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220508; c=relaxed/simple;
	bh=wUz6Nb5CVFFCwu9TmcBBafzljlO4d5QbpeaSEgm+ZbE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mkcLyYHZ6El095jT7hZbUips0i2J8Oa/JIwBn2W1+pAvKfINIEl5uTtWq/flMygGWLshyEwu4w0q9uVkNrTR4xwwWqArO4f6tELG6bWR/g8esZJjdauXHmzn0yRNrjZXDx09poHEyYows++dLcPbtBKKIEMsVXmoBG2AI18yFs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WIVnXfuA; arc=fail smtp.client-ip=52.101.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WIVnXfuA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akABBZZ++nw/uGQqRybti4GJ+IRqRTyugzbagoZPYpmt/GzXosiDk5ejrUcmZhbYa87gy8kYWPbWJ/GHx2BlW1Qv9EBBqnyS/pcES6zDnGSpizNFUjL2yjqMMqmXspUup2crku0nVUsrjblJojUn6R0vlUqa6OWfVH+2opiN8FieLv3WdukaSgKlQuVFcKSc/iFRCG03tSxz+hSNXUetp8shL+6kommP+rye3/CRSv+vkoSp/S2mUxFsHqXJuEiHI2AtdUqk3h5XKnypGXnyUGcaroOpSXoImvv66AnNjn3cOKn9qRgXvC8gzUf+nRYT4tKuVgKS/549yq7c3GhRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1H1EnCDAszlQHqB/f9N0bUKHPPLDA184SkmObIzl9M=;
 b=Jc/BiBK7v70Tu1oKClMYiJ8mzeoWFg5/f/3ct3C8dwz4egDlBPS2XVxlkvwg8AJ20OXi4O8hCVBQBCbatPLDs0kN+klvvuMPpR9Crc0uINDiD6JUDUJc9L5EloG8M1MxaTuGfoVlBMUy2tFBFREmRQpenVV9igqLlPlSisiBHPvcTOtnCZo24h2HQQx8jkpFI37fkGPDaScrVfaCwfzHCjiP46mtc1VHjT/JBO9rVNUTjrIWDnQQACP8KuryUAcLq7XtMf2K6r0HpgLG8A786VR9xWU6ZY5FaXox1yv3c9bzPhYfK2ZGJWURranS6ZZLvhsQzBwPit1Jc40rkJ1GFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1H1EnCDAszlQHqB/f9N0bUKHPPLDA184SkmObIzl9M=;
 b=WIVnXfuA1ekMxyIRFJJVE2HesG/0OP01vWdX1le9dkhMxdm4o9HPxH/6/oJEZryfZcbJ4I8ZXb7a/RAJGnKiRwDcHCf/+V0nyqr5HHW0Ei3+Ol8/Fm+Z0LvUkEC52UdcQjKz/7uOF7x3ao8g2RiGv7QWoFOSK6+wqKUn/+UeEIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 12:48:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 12:48:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 13:48:16 +0100
Message-Id: <DHJJ59GIJ16B.2TSQW73T2JWAL@garyguo.net>
Cc: "Rudraksha Gupta" <guptarud@gmail.com>, "Ard Biesheuvel"
 <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Christian Schrrefl"
 <chrisi.schrefl@gmail.com>, "Russell King" <rmk+kernel@armlinux.org.uk>
X-Mailer: aerc 0.21.0
References: <20260331190053.482607-1-ojeda@kernel.org>
 <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
In-Reply-To: <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
X-ClientProxiedBy: LO4P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: 98414ee5-5487-4bdb-4c36-08de917f46d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e97NvqRtdaT7Y+JVTIRrHz1PbXDrkIeyg9wIDf23Gc7sQG62qe/iDCXuDtYNTb9wCLhyJd31nswvjdWJZ10cbb8mzwRfXmQ1EALAoTcb4uewe/8bJGeYliJTC/YsBQPgNl3cCItbi8q401hJ/Ba+2cHw7d/wTfg7jlzybN6RVlJy1BtqRwDdfOPjmof5ufwrMDSu+jk/hZnmdkgFGqFS9SVJO40KXqKxrr1s5f1shkrFHAxjusZpfmRT8dRpl+mpwibl6/kRfcwNPkQwec2wIaBzGrAjfuaEFXTh7PzuY7A9LsLJOm1QlFFYjhd+ymo3dy7xP7POPUq83bh2NFVhacOTtRGFw62Hlu1SMCazkmXaBiuzMsONeEbczzo3uRvhuL2Ss4vbv5wk7ZvTGgMFiNz600O/X4EcRoa5mzBmQUqjcAO8jks8Xmel6vJ3tRy65evqVz1B9GM0ZJtmJ+f0GlooOsyHjpiYnB23iRy8a+7KEIHtCmreyEAcdT6l+7svmQSTAtIsZpJisBnfVkYVCynYAZ0oCjAcbZZjTObmqPwaGLxrxKcMz09Tz9ls/lLPPWSuRIyQTXFcak7k/oQI5mtedY+UMvKeQ7c/Z17o3sNaigONGkQx/N/cJ0be3cf+3Tnmgc/O2u2dI6b7vaP2tinv208GjquqtbltcLpQC4lxoghFa5oDutwpqPx5EO9qbW59Ww5nSNhuuncCx2s/PXEqFgzGZPF4nEdcoDHs6co=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajJCZGtQdDMzNGxHT0JPZkoxR0Q2amtqMTJLa1ZOOHA4enpsQlY5MlcxbnpM?=
 =?utf-8?B?TURDeDFkRnZVdmVDZ2J2Q1ZPVkNVZE1pcHpLWkFHeGJKY2JpLzQvd2VlWlRS?=
 =?utf-8?B?cllyTDcybElCQ25ScjlCQ29laWFqZEFvMHJILzl0aXROSmwzN3dDR1pxQi9B?=
 =?utf-8?B?VmlPdEJOSk5yS2dsRTRHVmczYmxVMFhDb1o3cVRsWjE2V0lVVUppQ2taQ3hU?=
 =?utf-8?B?OXFQazNXMEsvMm5lclJzZmpHMmlMaW5yYzI0OWJmNjkrc21KWjhwVEJnK2NJ?=
 =?utf-8?B?cXZINWd1cGV6T2hHMWNjd28rZ2V3QkxWQUp4OFJSd0Q5ZkVMYTdUdFJqTmJL?=
 =?utf-8?B?WEVBbGJqTGxrbWh6aGlGRll0SnQ5VnlGa3NCNnBseGpxdkRYTHhKTnFYZzR0?=
 =?utf-8?B?aGdnakNQblVneTlnTU5wZmtEbjdRVFRtWEZ5OGVLZzhzeE1QRXhWVytkeiti?=
 =?utf-8?B?Z0k2OEJNNzA2TXNnZ2g4SUVBVmIzNkFxMk5FenhCVXhWUE9mZzdNcWNvTXFu?=
 =?utf-8?B?N0xVSEZHcmFMVzU2ZkFJTUVLb0pzemc3RE8rTk1uM2NKYkU0enhmTFdsMzdn?=
 =?utf-8?B?UVZKQ2p0U3pLV1VFY0Y4cEFpOG1LN0p3aGc5b2Q3d3NDQlU5a1pxLzV6MDRw?=
 =?utf-8?B?Rk1WUVlPYjEyZHBlQnNBeHZlM2tvdG9pTUdRQlhLTmZxcnJZclZPVURJZncv?=
 =?utf-8?B?VDl3TVpVRDFRM3JoMithUGVvNU5LK01zQTRsVXdsVjhtZXJPN0QrajczRGZJ?=
 =?utf-8?B?M20ralNnUElOK2p3YmgrKzVKR01NT28rRmtGVWMybW9Uam1XQ3FkbVY0ZDRs?=
 =?utf-8?B?b3VpeUFIVTJUMG1EUmFoOTFGeW02S2ZmSDl6bWdhWkgrVUY3NHNiMUVSOUZq?=
 =?utf-8?B?L1JDZTFyWXlSRHNqVXkwTTdyM29vaUdVSXF4QVZyTERuKzM3alplNDE2TG1K?=
 =?utf-8?B?VjlrUC8vbVBCMmRRdFNYc3V3VmFjdkxpUzRJL1VkT0tsNWVheHJQWnQyNW5p?=
 =?utf-8?B?bDRkVXpxbFNiU0U1aHgrVnZyMC9GWWRxWlMvdzFNUXZhNitYN2tNaENuRFlK?=
 =?utf-8?B?MSszTzhPMk54ZjNpYzdhS1FVOGFUbjYvckVleExMWTFwUWNmMDlPRzBEUEZ0?=
 =?utf-8?B?akU0WkthazN3eTVZS0pKcjQ0am1BT200bXVtM01ILzZtQnVKRm1WbjhjdWh0?=
 =?utf-8?B?ZDlmS0NZaldyT3A3SUN3d0xRd29PZ0VPY2tHQWFOTFgzODM4SWFxSnZWcURn?=
 =?utf-8?B?ZHJ3R09qM2hjTlVtc0luNDUxMFVIQzRWTW1RVGx1MUFYZ3BzS1UxL0dDQW96?=
 =?utf-8?B?MFVFNHQ0TEozM1E2c2Z2MHRqUmRFVlZhMXMwZXZRbFN2ZCtSZHlUVEhoTU0r?=
 =?utf-8?B?T0NqdHpXSTRsN2ZONUF1U1ZCZjJzRlFxQVFYYmtPazk2d1M3aFlwL3NvUzhC?=
 =?utf-8?B?a29qZytyNWViTjRpQUJyTWRRZ1pYNll6VnM3R3JKYldLN01qL1pUVllDVnFh?=
 =?utf-8?B?K0NvYkRFTHRLcEt0ck9kZUxOL2laNGN2emNIZ1VGcE9uRm40b01OeXEwV0pS?=
 =?utf-8?B?L3AyTVBwZTUyUENQbnRpY045dEU5YWZQeWlsbjVUQStjeG1Qa0IzWXBXV3lE?=
 =?utf-8?B?Z3plRjNQbTg3QjBxWUprdmxzMW9UOXNjTVhmMGtUY0lLbHcwMDB6RzMxZHhW?=
 =?utf-8?B?c3VYN3cvRjE2dVZPVVhiK01SemRDdVkwcXFlUUxCMkZXQ0U0NEExSFJ6QjlR?=
 =?utf-8?B?RCt6a3d4b1BYc04xbjFVWVZUWmtwVmVweU00MFJ2L1hJWFNwSHBwVzJSU3dO?=
 =?utf-8?B?MFZobWVpcDgwVmt2c2IrWWxHRmxqYzBTa0Q0cC9icXAvVGxPUElQWUlmbGJQ?=
 =?utf-8?B?TTV1eEZtSkFocWlLRm1rc0dnOXhtM1JKbTB1RElIVHY1MUl5c1ljZHR4bElT?=
 =?utf-8?B?ZTlPUHh2MHppbkt3Q2lqZ0QvVjZtZmhNcEZ3OWRoeXB6aU5ZZXNsZk9Jb1c3?=
 =?utf-8?B?a2lmTE9jUUJpN3M3REhDWWtJcEtFVWp0YjZuempTaE1KNVhMLzhUUUxYNmhm?=
 =?utf-8?B?S1RlV0pjclFubEpxcDJKU0dFTWwzMnN6NDFFSzNzbGs3YVU1Y01iZEZmY0VZ?=
 =?utf-8?B?OVJoL2dMVEgvbEJzelhmbDF6aVFXV2owTmpoUWQvNUh5ajRCak5ka0hmc2pZ?=
 =?utf-8?B?R1IwVFI4UUVDVTYzMnhGNkVITlNmZHZXK3FMcFJtSXdPYUZYbFNoam9RVkdE?=
 =?utf-8?B?UXM1dGZXQmtGR3ZIWm45blo2d0RQQ2lrcmlFcVJGVzdzektsNmJWaEJHRDR0?=
 =?utf-8?B?MVp0ejl1ZmE2NGNxL1RSZGFqa2FLSlpMUHlOQmpQaUM1aC85MEpjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 98414ee5-5487-4bdb-4c36-08de917f46d8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 12:48:16.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8N3raFdI5nD7RUqGIQMfVHSxdbNIjrSghc4iIqcP1UzX+7xBf7DyqFpE+sJ8tRHxD6vIXoFq0Gr3csYbX1iGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2471

On Fri Apr 3, 2026 at 9:12 AM BST, Fabian Gr=C3=BCnbichler wrote:
> On Tue, Mar 31, 2026, at 9:00 PM, Miguel Ojeda wrote:
>> Hi Christian, Russell, arm, Fabian,
>>
>> For Rust 1.85.0, for arm32, for the `rustdoc` target (i.e. all those
>> combined), I am seeing:
>>
>>       RUSTDOC  =20
>> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/sr=
c/lib.rs
>>     error: target feature `fp-armv8` cannot be toggled with=20
>> `#[target_feature]`: Rust ties `fp-armv8` to `neon`
>>         -->=20
>> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/sr=
c/../../stdarch/crates/core_arch/src/arm_shared/neon/generated.rs:7538:48
>>          |
>>     7538 | #[cfg_attr(target_arch =3D "arm", target_feature(enable =3D=20
>> "fp-armv8,v8"))]
>>          |                                               =20
>> ^^^^^^^^^^^^^^^^^^^^^
>>
>> The issue is [1], was introduced in Rust 1.85.0 and was fixed already in
>> Rust 1.85.1 [2]:
>>
>>   Link: https://github.com/rust-lang/rust/issues/137366 [1]
>>   Link: https://github.com/rust-lang/rust/pull/137632 [2]
>>
>> It is unfortunate since our minimum is going to be 1.85.0 since that is
>> what Debian Stable has (even if patches may be on top) -- I generally
>> test the latest patch versions for each minor, but I noticed this since
>> I also test the actual minimum, and I am bumping it to 1.85.0.
>>
>> To be clear, it is likely almost no one actually cares about this, since
>> nobody complained yet, and this can easily be fixed using the already
>> released Rust 1.85.1.
>>
>> By the way, what is Debian's policy on upstream Rust patch versions?
>
> In unstable, we pull them in usually by virtue of lagging behind a bit an=
yway.
>
> In stable there is no policy per se - both importing a new smallish impor=
tant
> upstream release, or cherry-picking patches are options in general. A few
> packages with clear upstream LTS policies are updated often (systemd, gli=
bc,
> the kernel itself, firefox-esr and chromium would be the most popular
> examples). If there is no upstream stable release series that matches Deb=
ian
> stable policies, the usual approach is to do a targeted backport of just =
the
> fixes.
> lack of rustc LTS, usually there are no point releases for the version to=
 be
> included in Debian stable anyway.
>
> It's up to the stable release managers how big of a delta is acceptable.
>
> I will check how the full diff for 1.85.1 looks like compared to just pic=
king
> the rustdoc fix referenced above, and then file a stable update request. =
AFAIU
> either option works for you?

You can check diff here:
https://github.com/rust-lang/rust/compare/1.85.0...1.85.1

The change is not much, there is a library change although that's for Windo=
ws
only. The compiler and rustdoc changes are usually pretty harmless to backp=
ort.

I guess for Debian you cared about binary compatibility; in which case you
probably want to keep the compiler version number at 1.85.0, so the compile=
r
verison hash stays unchanged.

Best,
Gary

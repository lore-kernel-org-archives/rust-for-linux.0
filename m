Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021105.outbound.protection.outlook.com [52.101.95.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB2A1DED40;
	Sat,  4 Jul 2026 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187200; cv=fail; b=ZklooRcY4x1dRBnB7wxJvu5h0DDU2sDADVy8OEkuOHXSijbu8GZdvBxsEZhuu+jrD7U2dP7FWQhAl9KDx8ZVRUZlg6+3N6N6dgsogfztsERr9OnIbZfNB4eJSiL9j8LEmSJQ222l5W80HfkAcK0Gy7hoJpoWCfsovcspQv4ZOWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187200; c=relaxed/simple;
	bh=WnesFMKsQ0x43Bzbn3+PdE796o0M73jel083ZaNvxhY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bCfF4jwtbDi0BeI0y3EBlnmFTsVsS/EaAtZr8c/Cqn99Dt4XVR07Zu9bBwRr0c/uVrDq7zPUH5sH4VRigeqwn+JyvBvtN8iZnr969iZQkUSJuiyWqlJ196ED6lx0qiewm927ymRQK9ANE36LGtykzdGM0CLHSwmY8KU5HwsVedQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=p4nR9Kn6; arc=fail smtp.client-ip=52.101.95.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="p4nR9Kn6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HehpCcxEJTTGs/11ZK98y7MOIzt76SVrVo0BSlolPI+d0d8YIgB9hojijIg/XH92lYcMAPqdVW1NnWJkOPwu5kGg7zQdYkZGyo2l7u1UV1fAXJultIw3wPu0x9UL+fTY3l6C7MZ+hzEO5wUkAdbeTM6jjT3LPBSOLwKwA6mAeL8/SzHfTBallltPNk7MxUyb33DzI6p39g0eqM/1bFB5ZfCsX21D8Yq5Rgt0bJpr78C52t3c061pu41jn/6sjE6oQjQUwu2/uiAs+q0VMW3Ee0vnR9ju3+/v2KgQv9b7oeeGKVFQ+yPpt0nQCyLWUAVQA8sGpSY87+xmmbNR+fLT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmlIfWzzSfrEuRLlkgBsk+RqQaDInP6taCtyFFD/Uyc=;
 b=djTSdOxdFRP6JUVjMQqUIRPOG3nF1iLHPTf2VSig7gtDHxkPvEfC6JHr/HP/kFymq0H6lGxUG/75GDdl5/2iOnQ6Tc0NLPI+5pHUG69Ca3ozAUGrOk8KBUx3GtciQWqG5yyP28CQ7OoxoOEE7bf0FOHuFPiJFMfWd/N3CCa5p8aANLmClzyhgDCzLRmAP9EE/XsmqQn+/Y4srQ8h3aB9LKDlRa8kQGFLALvZPEu5dMiH0uTsqSkjwfKOwMDYFqZm7+FyzLTlcgwKPNeQvl5QwoxgnJ6EhYs2C0wKxlhJMZvTs8WC1+uAN9ILA23cRp6TqQ6FvLem56+en8LRDzIzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmlIfWzzSfrEuRLlkgBsk+RqQaDInP6taCtyFFD/Uyc=;
 b=p4nR9Kn6ceblyj8ifHHXBbR3eKSKhZ3HBRWaMjzlvc8pdlrFV3ZiUF64xg5EbGo7Xp3pMfQVKK5lVed8ol4rPTvsBxvwMX+5q7MOCaNBSJWVLjRe1kwkVuGhlLs0VoRuA1uCxXQ697ba/he9JdViucehssO4jc9Ud5DNBhnqmpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB7170.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sat, 4 Jul 2026
 17:46:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Sat, 4 Jul 2026
 17:46:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Jul 2026 18:46:33 +0100
Message-Id: <DJPZ3RKZWJZS.1EOKOZA3WE6GZ@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman
 Long" <longman@redhat.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
From: "Gary Guo" <gary@garyguo.net>
To: "Peter Zijlstra" <peterz@infradead.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
 <20260703140140.GE651302@noisy.programming.kicks-ass.net>
 <DJP06ILK15W3.2XGWM3VAKNF04@garyguo.net>
 <20260703223242.GS751831@noisy.programming.kicks-ass.net>
 <DJPXYGA9HD3B.30I15MLPUM7DR@garyguo.net>
 <20260704171042.GT751831@noisy.programming.kicks-ass.net>
In-Reply-To: <20260704171042.GT751831@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: a603ec67-04a3-470d-70ae-08ded9f4302b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZZDIUxbNa924eFNdLdxwBZZ0xu6F/p8Ytj7EjEmju9PVapajQfwsOE+VANm5yt9iWa+83CPHDz5e5Q/r7A5cup1Tash/JkdftqBkBTFqEBRDA9zTnCLOuZk9jrpfJa//KeVP6OkwkCOOZdf2w2uhjCIAGmHyBmPZppcqUhLyT9P+zpEO0tdS/0FWdVy7EPpILqGu8KP6Bp+jk1HLWqPhhotb3q/Pd6tJiqOwM0UojMQspFFrIGYxcr8k0jTXPIo9eI3a388ZmwYNn3q8CZCL63bc+kLw5eKvl3FpGWYmNLq2y1BHD/xSEvvAbsFjTGFBPexDv3Drm+PKO12A6o2tzUoI9rSraC9o/i0UnNywlsIzwTYRIor58G+i7F8eWGMfsALKuPdtgJ2l1StzwHnlEVojLz5KFGqlsg1xgIQUc0eiGFDNW/2QohLSDl4jvUCaLOctjs/N6oEzSFzmcRCFwqQjUGTHop441z5SDifjulYBOiqqB3b8+gPsEAxu+Advy6tY0HvkaUfCgcJaMLjJ7IdL5LPn+HKd8KRJfmqeQpPkluJfMgoeOeichPfzxbEXilQu6HMG4azWrRNgpylc+84l0iBeekmXiImrVkoW1t/0Q/HHMGD4fKYWTtWCgw+rzDY94hAgeb6h1m6i6YRdfhf+v+EoMCJssPg6T/ZcC3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZzaHBPYXVpRE4zd3VHWHlBczNNMk5QeEtVQ2pCZUFpT2xVb3NUaFZVSzV2?=
 =?utf-8?B?djBzczY0K3FZWExFSENRNWQwaUwvZGNoSzY1ekRpS01KbVNKc3ZGQWsrNHln?=
 =?utf-8?B?bEJNL1hmM0k0TllyaXgrbmFhc3BDRTIwdUtvZkd3WWx6dHRPUEh0dGwySVpO?=
 =?utf-8?B?Rmd1Y1Q0TnJseXo5K2c4ZWVDY282dmsxeHcvenZhc2lGdmNSQjRCRkkrdXhE?=
 =?utf-8?B?YnFjb3pSdnE0T2RxYXVOemJxNUw5UVNuREFpUjUxc3NRS2x0VVhYQWt5Zitr?=
 =?utf-8?B?NWhkQ2dYUG42WnJoRFFKaGNBeUZ5eWFVNHIydlgwYWh6L0RpcUpJOFh4eTQ2?=
 =?utf-8?B?SHBkK2k5c01ReDFlamlBZXdzK2RvT2ZxMjFMaXFFR1dKcmZyUEFIbk5Fa1pn?=
 =?utf-8?B?UHhMMVdGeFlDZURwdkN5Y2FxbUFXOFVkN0crUnpxMjZ5dU5lWUN2cUtvTVBk?=
 =?utf-8?B?MS93WDRXVXlEaFJ3WGJlWFphT2lURkxweXBtNlpndk5DY1c4SmdxRXBZZUl5?=
 =?utf-8?B?SVc1SEh2dGVTOUxLWUpFRU1ZMGF4YjRmcEtFdHRmYU40QXcvWWdrNW5KMllv?=
 =?utf-8?B?aTNjMzByMVVvaWoyckU4YmV1cVVTWE1oNGRhWXllSTJFczY2d1YwaktueDgv?=
 =?utf-8?B?elIwS0gweGplbldWRlBndThnOVRzdUhBZDlMUWc4bTRVVmZDM0IrdndiL0xs?=
 =?utf-8?B?VWRrVmFrWE00V3VJYTBqVDJtWUJoTHUyVGpwYUJiLy9UQ3M3TmEzZ3BHS2Vx?=
 =?utf-8?B?aW9WWnVlVEFJOGhKSFVNd3dVK0hSLzFtRzl3ZGlFTWxmRFRJMm9UU0RLc3JG?=
 =?utf-8?B?QWpsaUlmSTYyS24zRm9ZcTV3STJhVWJEenJrVWJWdkxaWDlOVmN4aXRaSUFS?=
 =?utf-8?B?S0xkTWNOZTV1bVI3V2UxMy94VDluUWM4eVlZYnZaeWVYMDhWb0xRU2tjR3ZU?=
 =?utf-8?B?OW9KSFpqYTZvRE9sNUhiV28vKzl4bzdhZ3liMHRoMXNvdzhwb2VGeXI3NnQ1?=
 =?utf-8?B?WUN4K0xzQ1hmZm95UlhCUCtYNHd3RlVXVjZUYmQ5Q0IvbDkxMGwyNERZSFZU?=
 =?utf-8?B?bm8xcVlCaTU4K0t6VmZoNEp3SlZua0daUUVVK2VOUWp2K2dhV1JYdjlJa2Jh?=
 =?utf-8?B?VnE4S05zMVRnREdSeDZYdXVNOHBhOVdsb3lpVTQ4YyszRytLY2N2U29lanBC?=
 =?utf-8?B?Nm9SRDZicXh4U2Rvblg5YWNqalh1bmVNT0hBZmpCUERvWDRGVm5iUHA5VXRw?=
 =?utf-8?B?ck8vZnBJUlVocmMyNGE1d1lpRXRuZWJRQXFYbWFkMVR3TjZMc3FOMkJwYXRY?=
 =?utf-8?B?eWp6WEZjTEJIZ0lubFk1RDI5MUZRUVJqRExxdUdZOE5jWlowaVBsQ1haQzFS?=
 =?utf-8?B?ZEFac3Y2OGl4cUFoVklzdVBYU2ltMmEvNURBWnlrZmYxSmt3aGk5Y3RIS0FS?=
 =?utf-8?B?a1JROW5JT0hJM2NVaTlVL05GNkk5R0NkaEp0azIxY1ByMU5xbm50ckFtQ05m?=
 =?utf-8?B?UDVBTEFvT3lXb25XY3htZEl3NGprSGJ1SmZpSDU0UDhuK1VhNm5ONTFuSWE3?=
 =?utf-8?B?VHZYYzBydnBVNUlESCtSUWhXbnp6MjRtTzFrZkRaNDdWeHpkRmlYNXYyZUxT?=
 =?utf-8?B?NGxSZkNhbzZTSEwzWDc5dnlENDdUclZkNS9tQzgvUnR4ZzJLTnlJV2QwWmJF?=
 =?utf-8?B?NXBCbVJnR0dwWGU4dkFDV1Rlbnd3M3piVUlLMXo5cWgyNW1pSklsSDc3N2tW?=
 =?utf-8?B?Z2pKV3hVZFZ6eWdncGFBR2N2anMwUW1NSmRGMkduU0VGTFU3VU9kVnRpK0c2?=
 =?utf-8?B?N1VuQzR3U1JkbSsyaTZwVUFYdWw0MmZsNjFmSC94aTNXbFVyK0FTRmhHbTdD?=
 =?utf-8?B?QXN3UzFMMmtYcE84UTRQbUtaSTE0d095dTBoeU5KOVViRmFJSi91VDlKa2tw?=
 =?utf-8?B?TEFWQURIKzJPVmJNcVptdlhRKy82ckQwNktmYkwvcFBQVTlUYVVVS2cyTW9O?=
 =?utf-8?B?czVnYmZvdGllaXBNV0JhakZWVWdvQWZBYUFVUFdKQ3kvNncrd0VmWWYwYzU2?=
 =?utf-8?B?ZUhnV29JcFhTSlQ3NWZOc0RKUklhNnJqSzdMdmhuUGZnN2FzY0U1ZmJ1MTRB?=
 =?utf-8?B?OXlXRzZ3aUVacFVsUDNod0F6NEdtUFdmWjV0YnVvMk5sbTBrMGFreXF6Njh4?=
 =?utf-8?B?VkNHVmRYV1p6YThrNGhNRkttVVdWbnZoQVlQQS9vdzdDaFVNb1RGdG15RUtC?=
 =?utf-8?B?clpIdkRma0M1eFBBV1ByUkp6eUhzTk40OGRvbzBrdWZTSXJITG9GTmVlTkJx?=
 =?utf-8?B?YVJHbFo1aTdyUFhyTGRrdDdGTUZWbmthYUR6ZXpDLzd2YWNVK1Bvdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a603ec67-04a3-470d-70ae-08ded9f4302b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2026 17:46:33.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cBvrSaZD9hhzkqmydT308PEopgNSVCw0bNAFugFyl47SJUDFy1wQrJ9vt4GHG7m/rPqcH9AfD2TPwUv3xpVuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7170

On Sat Jul 4, 2026 at 6:10 PM BST, Peter Zijlstra wrote:
> On Sat, Jul 04, 2026 at 05:52:35PM +0100, Gary Guo wrote:
>> On Fri Jul 3, 2026 at 11:32 PM BST, Peter Zijlstra wrote:
>> > On Fri, Jul 03, 2026 at 03:24:29PM +0100, Gary Guo wrote:
>> >> [snip] On the lockdep side,
>> >> essentially the name will be "(rust)", while the actual name can be r=
etrieved
>> >> from the lock class key.
>> >>=20
>> >> So for
>> >>=20
>> >>     let foo =3D KBox::pin_init(Mutex::new(42));
>> >>=20
>> >> in, say, foo.c:123
>> >>=20
>> >> it will eventually call
>> >>=20
>> >>     struct rust_location *loc =3D /* static generated by the Rust com=
piler */;
>> >>     mutex_init_lockdep(foo, "(rust)", (struct lock_class_key *)loc)
>> >>=20
>> >> And when "(rust)" is encountered as lock class name, instead of print=
ing the
>> >> string as is, lockdep will call
>> >>=20
>> >>     lockdep_print_rust_name(loc)
>> >>=20
>> >> which will be doing essentially
>> >>=20
>> >>     pr_cont("foo.c:123");
>> >
>> > That seems quite terrible. The C names are based on the expression use=
d
>> > to initialize the class and are thus somewhat descriptive. But file:li=
ne
>> > combos are horrid identifiers for locks.
>> >
>> > Why would you want to do this?
>>=20
>> I do think this is not ideal, however the current code is already doing =
this.
>> This RFC series isn't changing the name at all, just represent this in a
>> different way.
>>=20
>> The reason that file:line is used for names is due to the fundamental di=
fference
>> between initialization in C and Rust. In C you create something uninitia=
lized
>> first, and then initialize it, and it'll be UB if the value is used befo=
re
>> initialization or (for some types) initialize a value twice. In Rust we =
use
>> pin_init to ensure that a value cannot be used uninitialized.
>>=20
>> The way the syntax is write out currently is something like
>>=20
>>     pin_init!(MyStruct {
>>         my_mutex <- new_mutex!(initial_data),
>>     })
>>=20
>> [
>>     which this series is turning it to
>>=20
>>     pin_init!(MyStruct {
>>         my_mutex <- Mutex::new(initial_data),
>>     })
>> ]
>>=20
>> as you can see the `new_mutex!` or `Mutx::new` does not know where it is=
 going
>
> To be frank, no I don't see. I have absolutely no frigging clue what any
> of that means :-(
>
>> to be initialized to, because we prevent people from being able to name =
a
>> yet-to-be-initialized place.
>>=20
>> It is possible to use the C approach (which early days of Rust-for-Linux=
 does
>> use), but doing so require a lot of unsafe keywords because you are rely=
ing on
>> the programmer to not mess things up, instead of having the compiler che=
ck.
>>=20
>> So the best alternative that we can use for the name under this constrai=
nt is
>> the file:line combo. It is less descriptive, but at least it does tell y=
ou where
>> the lock class is used, so you can still trace it back. Given lockdep is=
 a
>> debugging feature, I think the less descriptive name, albeit inconvenien=
t, is
>> not a dealbreaker.
>
> People already struggle to make sense of lockdep reports, this isn't
> going to make it better :/
>
>> The trade off here is the convenience of creating a lock (safely) vs the
>> descriptiveness of the name, and I think the former is more important. I=
t is
>> still possible to explicit give a name if it helps (Binder is actually d=
oing
>> this already), but this currently cannot be implicitly created.
>
> Like I said, Rust is still line noise to me, and I really don't
> understand anything you've just tried to tell me.=20
>
> Now, I do speak (some) C++, and the new thing you mention got me
> thinking you're talking about a constructor. Are you trying to say that
> since the invocation of the constructor is somewhat implicit, there is
> no good way to stringize the structure member name and store it?

It's indeed somewhat similar to a C++ constructor (the actual mechanism is
different, but conceptually they're similar). You do get explicit invocatio=
n
(there's no implicit invocation of constructors like C++, you can see this =
as
similar to C++'s constructor with "explicit" keyword).

But the gist here is correct, there's no good way to stringify the structur=
e
member name.

> That said, in C++ you can mandate a string be handed to the constructor;
> this would mean everybody would need to explicitly provide a descriptive
> name, surely Rust can do this same? Every !debug build could then
> instantly ignore that string, but at least it'd be there.

It's certainly possible to give explicit names (this is what patch 1/2's
"new_with_name" function is for). To mandate names being provided we just n=
eed
to remove the constructor function without the name. That said, I am not su=
re
that we want everyone to explicitly give names. Especially for types like
delayed_work where it needs two lock classes and names, it's somewhat
leaky abstraction if the constructor asks to user to provide a name for its
work completion and a name for its timer (as it's not possible to concat st=
rings
without allocation without using macros).

Best,
Gary

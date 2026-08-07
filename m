Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020141.outbound.protection.outlook.com [52.101.196.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2A42D76C
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107579; cv=fail; b=SJ1+zFIFekGH7nb1NactpHKNe2cJmI6tex8CybNbtOt6Zr5pY42mhOnJX+QXSgf9cPCPjNpNUyXC162ANfvEIExGQmX9lKDAAmPP4gJDz4RHhCdNkpPX3ITNdqyzV6zQEQFGEasEpIrFWnXQPnzBzJmoMMWG+YnGT100Ay5hbXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107579; c=relaxed/simple;
	bh=VeZcgDouwEctxRBPcxHrNm9YSDNm7q4/5PeOS7Ax4L4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JbB7I2RtSjFY3ptY8/RusPpoxwrt1U2jbM7FwK6GXWS2OY4RCSoebaWPkSL2AOfPycnNdBlhgxwwCXM28ce7SGjIDVq6YebBONjAu14yi6Qv1XE24lFALhzkoJDt9irpWvZw9ZvucPXnV6GEuHXWtp5aXQkskOErYbz/nxzQQY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kZGmJdsN; arc=fail smtp.client-ip=52.101.196.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kZGmJdsN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ki4oF5QhncOP1B2F+pqi8kXmCvXvjrHwMMGANaI+rg8/rSSsoZn1kWCo0z2hJ8u2jao84GGT1hjTc3OSJsCalv28bFeeiEE4C/BEb66L5Rkn0UOnKhnzNb8TWOC0wtPlPbfWejoF4mL9Nz3c19c7yWGux9zRiZAERfDm3iXIYsFI45oC64/i+rtRIliXoVKXHGr6qHUNu9OiFHKEg+2F96+z9zKwM7ZYi015hRNz6ABKbDQ/pxyywkRriURMCb4YQCyKOFTdXKZ3yobvbUeI5tXn0n/p8FMR8cEVvbJe1Kxu63La1D04Ma9TO7HFtLWWFWTryYBypOtBmFByAtOz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tbjBscoSegrce17cnHyCNK8LWYHG1me24k+rCGH4hw=;
 b=SNn0veJdZJEB+/UwMRjv5mPYOlcax53T6MEfTyNuZLfHEBXIB5AtBzYnJ0Fz1A8hJY+o2Z/RliL0fCtecexQqXr392dWkYQNJH3Ad6ODJgylVp8tKiI9e6VswETYCBCAFE6fR9lFRo9xzCJ5DdLMvPImuZbcNlcvdnnconJdcxt207qRMQFq8d0mF+AQuEGjbDDl9RX3bqq8c6s8qHD4sOiiRK5jMGzakT189rrahP+5e76xCdd8QW8NZhUqTb2bXCxT05Tk30slmOmtMFM6p5Yeanca3FRYLNnegk2uiRLha3lPZ+Pe39RBikrVXEcF+ozZ7GPR950vipBcGIS3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tbjBscoSegrce17cnHyCNK8LWYHG1me24k+rCGH4hw=;
 b=kZGmJdsN4LxiEjSyOb43PGYrYIkONKOER+oI7Jk2f3/txH8g7wYHAOOa7/uOAtj6SSk6AnErNz/st2U+nJ29E8RtlsDjIb00Nw3R1ZTr+4BuJJkj/Hnygj6vNrIk9eHG8AGF6z+28K+xhXLe96SOfSLNfqtxA4EcaSARxpFxQ/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB7290.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 12:59:22 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 12:59:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 13:59:20 +0100
Message-Id: <DKIQAE0F6ZVF.3BFDX69JGNUI8@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>, <arve@android.com>,
 <boqun@kernel.org>, <brauner@kernel.org>, <cmllamas@google.com>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>,
 <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v5 4/7] rust: time: add Delta::to_jiffies() for timeout
 conversion
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-5-tomo@flapping.org>
 <DKHU7G936M2Z.3A8B6AQLWLEN2@garyguo.net>
 <20260807.213837.477414639891260460.tomo@flapping.org>
In-Reply-To: <20260807.213837.477414639891260460.tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0162.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::23) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f35cc0-0ed3-4727-80f0-08def483b32f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Sy12JgdHv3ZQCa6J7k4S2Zff2TBZpip0wY8fTlpHH/1Y6yfYhfih4XJCc6Y3EB8H86ifdJbNzQUVAZajE9PDqlnQWKvJTzFG3vG/fmZ5qkcITTGuQI3AJYS4S0Huy+UeqGx61P9uO0e533SBR2hLnO/Ty7wnnzZof7/PHsZkJWYh1mQmcuaffQxkpX3UtpfzWNLPc4IkaFd6lk8y0AmXLJOdX/fGCbeP94oJWWHRVeuQgf1STBS/NlD/9kzKH5qnLADxIdPrnorF/FocpwYsB/To/E/pTWnZQ4hjLybEtgtszywaPSByCXHcOAAS5K+UAfQWGV0Gt1fSBaZNSJWusxQUF82NZvGkq4Xnd9qhncr/Jk+mPuxaOS4mcfs0TZHjuk3v6qnyMXHKY8qmolO3SQJsVyWSBbo1ZKj9fte5BhQUzZp2Bv5YuBuCMU0UKDuC7oEOW1Acy14HmSmfpTsDflk/D4C6DL6YW7qOWKsGSDQUR1gn49ChtMWGRysDwH8hVU6RGwfq1lzFR1jpaLNVUrpeyl2T3KJFe65AKJ8cAgHZ6UH4iGKOa0WdJGpJOi2RzW8zweZDVF38/LaxJH/Dk6tU+cXJ44SKQrNpWwiMmT9mEFlxiH5ryFHfTLHq+t6Ug8cZvtnw6JvYSOHk2wM/zZDoBT00F7J6qNsLUo1VSzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHR0Nmtya0Z6K2FPN1M0SVI5T09ObXBCVnhBeXgvbjUzYmx4dWIxRk1ONXFi?=
 =?utf-8?B?SlpSYTRqU3B0cWgwbnFneXUxZytOcGFkU0tZMmh5M255SVVJZEFUdExqM2hS?=
 =?utf-8?B?Smk1QlkzNE05azJLQjdjOURVMFlJOW56MDMxSDZYZDVtRzVUbHAxNmJWSlV1?=
 =?utf-8?B?aTNVQ21PWXd3NDZRb0N2bVRya1huUEwxQXVJaHFPMDVQOTc0Y0NLZVg1WTRM?=
 =?utf-8?B?V0txMEJoMzRJTFNkQUp4aGsrRm42aFcwcTlMZ0NwRXd4OFM3LzJYVk9XVHRt?=
 =?utf-8?B?Y0l3b1Z0bTlFOWMvcWowUndhbzdQQWhoQUNBei9CSWc1TkNtSmhoenJqYk5S?=
 =?utf-8?B?MXZTNjBZQXRHVFJ3elRVbW9vN3JHOTYzSzFzVEc5N1BOSEZhSk5kTTlmUXY1?=
 =?utf-8?B?c0x5L01XbkFvdkcwYnNiOWt4Y25HVzR4RFh4My9rZTB3NkV3UU9YT1BMdmQw?=
 =?utf-8?B?NnBoa1ZTdENUdzh3VzFUOWNlaFBHTlNVTG1IcDRMUGZjdWpOV0F4ZlNaaUtM?=
 =?utf-8?B?b1JwUk5Wd3BKY3JrUWtJdUdpSmNob0FRTVNwazVwbWRiamZRUHlqVDB0T2t2?=
 =?utf-8?B?WFdGRDVQbG50NEdFcGNQZGFSbnpkZEpUbEdOcnVIWldxYXFQNHAyZElFNCtx?=
 =?utf-8?B?ekE2UGg1ZzBVL3RnbEVuVDQ1RnFSR2ZOVitJQ29PT1J1cFZnREw1YlUyS09X?=
 =?utf-8?B?NGtYTk96TGpKZS9qR0xZWVEwZENjSXUwMlVZd3h2TWxjWDFiaVZWaU1RbER0?=
 =?utf-8?B?Y1diQy9kaXBQUGxyTGFDb2lqdFo0Z3hLUlV2Z1ZSbTh1amNKZlREdkRUVzZG?=
 =?utf-8?B?WUtONXdyZmR4RXlZNEVNMkhEOStYbmp6ZWVtcndDaXl1d1dTOEN3Z1VYd3d3?=
 =?utf-8?B?QVErUHlXY0RaMmxnRnk5WTFjU240S0IvM1hqaWRlRFljLzBlbkJBQkhNQ3Yv?=
 =?utf-8?B?aExaK1puVFcxMm0xQVBIT3dadVJIRlZhSTBva1J0KzUrZmdqUFVhNVRUeTdD?=
 =?utf-8?B?N2NySjRhQnVkalFFLzVaVFFGeGhoR2JtMVRBTWZ5Vk5UWE9mdkw3V1R6c2RP?=
 =?utf-8?B?RjF0WDVxTm5hRkpJMmJQSGh4Vm9wRUtBU0lQRHV6THFPLzc3b2dubFV5QXVw?=
 =?utf-8?B?M2tvTitIY2NPY2xpTDZuOWVTaHF1ajhTMWYybTdNbHlMMm9IZkNnSE9nQXFD?=
 =?utf-8?B?SU1kUk43SXJDSjZCRzlKYXIySkx2RXZ1dURSa0wrbitJZlR5ZHJXVzg4c05S?=
 =?utf-8?B?Z3Q2cTRNQ0tsbkVtejArUkZJZ282cU44b2IyYjQwdXNGWUNtRDdoNnFYemFo?=
 =?utf-8?B?NnRSdEJBQ1A1OWxJVTA4MjVSejhTdHgyeXh3SFVpb2lUZkdDUGh1bVp5ZlVB?=
 =?utf-8?B?TmNJOTIzTzZYUkY1cSswZ0FiNkhlc2ZKaXJta3Y0K3FBQ0xuTEpOMjh1YVFG?=
 =?utf-8?B?eEdscXlkcWZDRW45eHlaNDVJRkVMdUpJWFdVL1N3cS9SRkllWDNlUG5pUEs1?=
 =?utf-8?B?REd3amlBaTR6L29wcGZIbERwVTBzOEJnU3JYdjhrYmF4Z1pmZm9rcVRycHU5?=
 =?utf-8?B?QVlhaDRzSHhia1dDQ2lJSnkyLzFFVWZxUTY3Y1RFTFQ1eTdhdml6Z2hvb2VN?=
 =?utf-8?B?TFdIRkZFekNEeVpmR0pOVjlMaWwvTkRieGpvSWJLYllyNm5VQlNSd3ZZaE9p?=
 =?utf-8?B?UzVRLzFabUdnbStweHZNYkdhT3dQcU5DTjVUOHQyUFB1S3B4cXZUYXJLMGVz?=
 =?utf-8?B?djRQaEI3aHgrZEJEb1JSTWtRbUZpbnJMVzViMmFQYmJ6QStXRDJnaWhLdFNl?=
 =?utf-8?B?M0t6S1ErYVJFVDA0WFAzRFVheHA5cmtIaWpoeDVKdzJNa0FOdU4vSkdiU2p0?=
 =?utf-8?B?dDdvN0JJaUJDVEZpYTVETTRxVU5ERHJpM250WmNzRzZIR3Y0UERrNEFjMXBZ?=
 =?utf-8?B?SWhWWHJEOU9Xa3U2OWlER0ExR3NEWG40OUFhNldpUy9kQ3RWM25EUlJaOG5x?=
 =?utf-8?B?bWtwUUdiVGptZjJiR3k4Q28wN3NFaGp1VCsyUm1VSW0wU2xRRlJnTU5vek9C?=
 =?utf-8?B?N0VjTFpOMFhlRkFDNEkrc0thZmMvbW1NL1doQ1g2U0FHV0F3Y2hZU3ZYVGNk?=
 =?utf-8?B?emNLYXJrRjhXRTZSeUdWK0hmeDFGN0VId2FIalpLWWN0Vy94TG43cWFJN1VD?=
 =?utf-8?B?NDNvYW9FRy9oQ3hnRFhEMjA5bjVGNFZnb3ZIRVdSNEhXQ0QzcjhpWmhaQnBH?=
 =?utf-8?B?SjVvR3RaQ2U4SEo4OFh5RFdLV3hxUDBuYjRrenhkd3REdzdYbGxpM2l3WnZn?=
 =?utf-8?B?L1R2c29XUjFFS0toVkNSekVyanFDZWlKTC95R2tHWkFKOTBPZDBLUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f35cc0-0ed3-4727-80f0-08def483b32f
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:59:21.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S2eIQz8vNxiWNcmrbFcAp6vVBXwfy0IpVvI7FPc9XzYmE5HAgfmHfMQxdbVyvhjufA6L5+oihQjx9jFhG8zcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7290

On Fri Aug 7, 2026 at 1:38 PM BST, FUJITA Tomonori wrote:
> On Thu, 06 Aug 2026 12:50:55 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Thu Aug 6, 2026 at 8:32 AM BST, FUJITA Tomonori wrote:
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> Add Delta<Nsec>::to_jiffies() conversion that rounds up so the
>>> resulting timeout is never shorter than the requested span, clamps a
>>> negative span to an immediate timeout, and saturates an overlong span
>>> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>>>
>>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/kernel/time.rs | 21 +++++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>
>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>> index 9d65a6c1992a..5844ee985a7b 100644
>>> --- a/rust/kernel/time.rs
>>> +++ b/rust/kernel/time.rs
>>> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>>>          }
>>>      }
>>> =20
>>> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a =
timeout.
>>> +    ///
>>> +    /// The value is rounded up to the next whole jiffy, so the result=
ing
>>> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` =
does).
>>> +    /// A negative span clamps to zero jiffies (an immediate timeout).
>>> +    #[inline]
>>> +    pub fn to_jiffies(self) -> Delta<Jiffy> {
>>> +        let msecs =3D self.as_millis_ceil();
>>> +
>>> +        // CAST: `msecs` is clamped to `0..=3Dc_uint::MAX`, so it is n=
on-negative and
>>> +        // fits in `c_uint`.
>>> +        let msecs =3D msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX=
)) as crate::ffi::c_uint;
>>> +
>>> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
>>> +        let jiffies =3D unsafe { bindings::__msecs_to_jiffies(msecs) }=
;
>>> +
>>> +        // CAST: `__msecs_to_jiffies()` returns a value in `0..=3DMAX_=
JIFFY_OFFSET`, i.e.
>>> +        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well wit=
hin `isize`.
>>> +        Delta::<Jiffy>::from_jiffies(jiffies as isize)
>>> +    }
>>=20
>> This should be using nsec_to_jiffies?
>
> nsecs_to_jiffies() is documented as unsuitable here, time.c says:
>
>     Unlike {m,u}secs_to_jiffies, type of input is not unsigned int but
>     u64.  And this doesn't return MAX_JIFFY_OFFSET since this function
>     is designed for scheduler, not for use in device drivers to
>     calculate timeout value.
>
> It also truncates, so it's not suitable for a timeout.
>
> __msecs_to_jiffies() is the timeout-oriented helper: it rounds up and
> saturates to MAX_JIFFY_OFFSET, which is what a timeout wants.

Which sounds like is what exactly is suitable here. What you want should be=
 a
different named function that does the ceiling and clamping?

Best,
Gary

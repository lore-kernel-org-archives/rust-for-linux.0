Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020126.outbound.protection.outlook.com [52.101.196.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C531A5B84;
	Sat, 14 Feb 2026 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771061822; cv=fail; b=FiJHauFTu8pnxBnJrFBAkLvCx9nIH7pVJ+M4tRJrgBENZLkzcTWhh/yVPWjZNJ1yDG6Xu4g851DgQMxpWF1NvOBmohnzBYPnhtcf4s9hsoxpaqTzFRZsttvfypPKWK9yQfQWf8fJrjDB1TcV0JJtNKa8VgBZbtOXTBf3A/L3KjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771061822; c=relaxed/simple;
	bh=uKrPLJXjTHACo4OKJ0GixoHvqFpRKKEUKIGSa8XJQ6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=oHvrmEiP96OBy5n/MxuadW1d3OUkzduT2aLvEk4V/ZzN8loh/8MDmRE7y4cpWfZba+cc0BPS+Nj1X37Xt/6YasY1bdIDZ5nsoBBKRoGlO+qquJvZtLTsXiOBz7baWLaP/mF86YnVEYeqQ98JPUVpbgBykTKJVajXWiG8bpVhJZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=o/E0/5tp; arc=fail smtp.client-ip=52.101.196.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="o/E0/5tp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czMCcOLBHLhI3Q292ktgwCAagPQcZzPbveEg2SQIxZbnNKRoButbMqn1LPtrxqC+ylUm1b4ddu3iZnFgyL3ncoksa72KIeA28mwOgCtCR9HpbHgNj+oPCBB/ZXJ9gkv9dSSDhPOzM460gwcwGZs/R8MEVby77zXoSNMFwhR7AZZnhhtbePCNvxBs56z/S7XvUpuycw7G5Ta6DB6kVX5+s9Js2BptJD8bJ5CUc2cOY3jM3D15OWlniEf1nzCGRjnsh5KXqA4o9sLRrE9fRgq1v/SwPYdbuqv91AmjmyVo4D5up7QSgdl6TvgKeI7kHefeh4eXYGQFHnjMqe2Y0uuPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwlKD//SJf1H/FEeu2bRIiAvipgRYf/CRW4Jusp/2j4=;
 b=fkAXHS/PFW1qxrCeE9Yb7AFzbfHDSeCGAqgdJs3P1KUuTwPg+o2Y3eejoi7h/iGPt3x/J9ZNnAcdKcfi+Bk9RNupvJp3T5jroDfXwgFmDU6pYsfuu3qbTV4o54HZhq+fuRm6y4bbl4xl6yRtFrDVEDspoI1vPRjgS4PmpGQmyWC3AJFzgzH1V3brF25wWkygmoqEf3NZZYclq3CEKrmriowqHg0LUIdu48Tk8H4XwKn0EvvM84s1Hxf8VqA5lcsDs6LivhlNcaR+V8u1fUSGBIDJrlg6+DPoSYWt2iGBNLIX+VjgGgGJhmjdZsSoahv0O0NTeOzu7Priwg6crbl9Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwlKD//SJf1H/FEeu2bRIiAvipgRYf/CRW4Jusp/2j4=;
 b=o/E0/5tpZGVMc+12U5K3PhE6EuiXQwVI/vRRN2jsc+YH9CP+fZnUapEJ5CRli5SQNEwxNfZnyMJeYZN/5lujzKyF3B/jeYJ9zRY+RCmn8pIJPinKlmlHCKquIWFN543vKVNKSydGDSw3mluuM6klGdYRtfUEm4I6b9fdfKcygl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:495::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 09:36:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 09:36:59 +0000
Date: Sat, 14 Feb 2026 09:36:58 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: impl_flags: add method to return underlying integer
In-Reply-To: <87zf5bsqfi.fsf@kernel.org>
References: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
 <b3388ec6cbd8f42532e876737e015e15@garyguo.net> <87zf5bsqfi.fsf@kernel.org>
Message-ID: <5571a8bb387ca68b3f6f50d52509da52@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee343c3-72c5-42a9-3e16-08de6bac99d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ubqH9Aimxk7A8M+cUKFPhMsn69KMvz8hW9Pm0mWsgDmy2aeay1xPqeA6JJYx?=
 =?us-ascii?Q?WF+di4emo6vt8CAxNZpmNQyrSwosoE890sYI/BFEARHMfxtuKzdhlgfZmAi6?=
 =?us-ascii?Q?W2TDECR0afzinwWrMs44R3HWO8fqpnE/pgYJwap71Flu3am1pheCowJDTdD7?=
 =?us-ascii?Q?zTodqXzHiKXOWtzX3fno0CNLs/3MzDCFCi05Gbwr1ADUlaDHxfV66/7c5N0b?=
 =?us-ascii?Q?ae0HLHgQi7VB/VYUZC1Cs4/4b1yD5Pck3ZXUaponLTQ2XNgym09AiECm3qLx?=
 =?us-ascii?Q?+F+wTC1wstWlSr9RrrYjeQ7zmhKiiCZyf8+whQjv/uVZF12mraNWg2vcwchn?=
 =?us-ascii?Q?x73hnvjJ1IfmnGOlQxtlgnm+lZDp/2GO8qL2YB1ZlcBftZc7PgPeF6abNW2e?=
 =?us-ascii?Q?CWzJcOjKl8rmxKNWGBactyzkPjWiy5xnBr9QTXWiW7z3Aq/uwqxsDgVsmuoR?=
 =?us-ascii?Q?yhSo2Mb2lQYZJRiUIvvU83ZXcR/5sNTa4ZYwhPjx8udT6Xatcvyj+KUMkuOu?=
 =?us-ascii?Q?NOSwWqegBa4HALR4lSkyjWXF2OUVE7wqJm0zyZ32q2L5ZxFCz231PgG/SFqS?=
 =?us-ascii?Q?fRpSBURahsxBYldTZwQp9Npm/41b6zpPcWBx/ZALEU8teXzbYmGrWjopgzve?=
 =?us-ascii?Q?gVM4ktVZW3q3eRDoe7BhTQCO/4EkIbPxOrpLBMjB9BCI2VCm02+WB0YH5+CO?=
 =?us-ascii?Q?GhkNU42xAsxDNhqKPuiElw/zfXt5vvkIEmMDOWnVDqdrUCpQ6C/qEiIKeyv8?=
 =?us-ascii?Q?jvaHVGmZrmEv1TdxaDJfk3+LN/VcplBvTmev8JhhXe5YHP0aiRTRqLTBUuX7?=
 =?us-ascii?Q?vmP2dLzTtHY7rciBO+BqZtNppU7PTDdJVsLPlQy/0v9v1QeAXltdst3dHD4G?=
 =?us-ascii?Q?VpPW6wUbOr7DZUBwPIM94C4FjCg3cv/OCzqyhrE0+I5/2CjHBlyrrsHttR6k?=
 =?us-ascii?Q?zA3qP9M5XCrZ2w43HWi1OJgJtWgA+nUqFxtIU08FtIzi6w6FGfN72nh7UedL?=
 =?us-ascii?Q?k9+PbOnlEzXfPpZdw7ewo+X3pXQTas5NxGLxW+OqQs/lmq/vG2VKDLSoz5tA?=
 =?us-ascii?Q?G3P67KYNeyo5ZGZ5JZbdXw5bCNIEC5t091jvPJ1uATgxQ4cal7/pvE8ySAIG?=
 =?us-ascii?Q?mVwTEX8emnhzvd50s4XIPfvc0DXjY9eh2pHOiq+icoFtgsnzze6CksbK24lp?=
 =?us-ascii?Q?vLIEkedlZxyeKzYFDyLTGJeCZUTc1sUbT2XgFp+Mr2XDL70OsZNvFyPetnRn?=
 =?us-ascii?Q?ApdjYaZ2ANHBzhv5i3S2V1R+eFp9OyIzgYPFaYmMykjkWj5kCm60ZAISyi6E?=
 =?us-ascii?Q?9h33UnX6WwxmAthSl4TYDPtxUu26MWJCw7ghBKyDNVDNi6+tTAHLI1w+h/wQ?=
 =?us-ascii?Q?AVB52XO5tK6/0Qqv3gxd45mXGuQPuoxO9beDVrG9h/SPBe2QJWkKk02xKq8e?=
 =?us-ascii?Q?efIN5pKQtoh5lBvF6hfVH4rtxre2lIXX1T9X1o63NoqZFJQtjdDAtPDCHhRL?=
 =?us-ascii?Q?r6RhisYDHsAJxo3pW/lcZ8ps/ALCTWwcRFzI19bkX7qBO54XmGZmF1jDwltF?=
 =?us-ascii?Q?3tOPezlTqpV+WPzNdfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XH30IJxrC3cTLhxD1rfV0JFon1db3QMgO2QV2OV/TCZWgjizpqrUvJeGqPmu?=
 =?us-ascii?Q?NhGx70o0947+VF6R4ys8MFMUjs5HJxPrVqkT5nbTqwb2/bZC8UH+V/GmdMip?=
 =?us-ascii?Q?SDVy2Qk5dz+Hb2yZ7gkJTrKkt2/HZVb0yTHYHUoPawUadljmFdX5XlekMSUu?=
 =?us-ascii?Q?Hiku3rR9idUp6tRPvpSjPfjIdn24HZXIUPzNL3ciRdRkhMKIa899sDeDAC4T?=
 =?us-ascii?Q?HPKQXwFn7SE/WB5TocQLSVsLDawxCMNMGLftYua8UVjlEjdxh+gRvMGfApSv?=
 =?us-ascii?Q?Ej2tWXpRXrralLnoZM3l4nQRQnSIshj9nwHFvQvpwOt22ZVlML8NBgiWHZjA?=
 =?us-ascii?Q?r2zbWr7JTYyz8yKtw2XcbLvvOmPTev2OyIt1P7YS6Q30u7MIlR8DCtlllVBa?=
 =?us-ascii?Q?E4NworZre5RKxoHfj+rxkgXeQfqrTooNhXP6SwUILmI8AW9LCunFL+QAFHcy?=
 =?us-ascii?Q?9nh4CpWKPr5N2WAYZDJnW0EbhVbGY7OdkzvifrCM2Qh3ySWeRTgmHVVnFVst?=
 =?us-ascii?Q?KyF5bDqXZflNyOUFwedTWuTVNrqERbChrimtkbcBzLZ+mQZG+FyUVxLm0U0U?=
 =?us-ascii?Q?CtM+kAQeDfXOFnXUOyas7aS/DtMJctfR2+Ulw0W7S3WywNkZrqlAofTLu8bo?=
 =?us-ascii?Q?MJJcVDVt3xKs+47D1an1Kq28QIgCydteQJKelEO/Vxgi4I7Ajgv1lJz/MOp5?=
 =?us-ascii?Q?tvlD2uhtjL//vZAHL8UY808mmn+gk8/M18QPEtDkgkoRo9jnGM2sDe+Pnkoq?=
 =?us-ascii?Q?TpYA1wiXeMdBR9owJtkb/DrqcVtujSUnNxcVBod6GUCzHsKftlDyb5p/ZaPu?=
 =?us-ascii?Q?C+FHT9dHoZRZ9sqHdzIYBg/oMAEbfFjrmjlWOxlYNtZFZCk1v2CK/7yf+zE9?=
 =?us-ascii?Q?gGCCkWwKyRAtCbAaBXhjEBnKb+mtm2ro7um+FpF+LwbwTeTUHV1PvVmYTbAo?=
 =?us-ascii?Q?zuESE7f3I4O9WD25jVLRzGanrg8Q7/lhRxNewaaEr0GbZEc0BjZeaG8LgfE7?=
 =?us-ascii?Q?Q3hHv2Aidek4++NBmZq3zdtbYKObETBYUpbZz2lHZE2Xyn8bBXc5cBkHm5ey?=
 =?us-ascii?Q?Vy5kGNi1M5vh2+3HQ17/POtLRu6I8IfLzaDwJUOxlxIR1qFr4djvSyHHjBp4?=
 =?us-ascii?Q?lKKKaNriOcY4wEaxMqFDPBXs5/kQpXokk+E9wn0JeXa1yYnTISOrgRgxJ3xL?=
 =?us-ascii?Q?eKA8EIzHh4jLfyGSJTEC5kkXeUg+V0KPMgtuNBI4q9fKM9IkPFwtzn3kQMue?=
 =?us-ascii?Q?T/mo35yZYrz0t4ZWM6qjrGmMZZB/oA5H8fZUj8XQtGDdFgLwq4WXDF2PWbM2?=
 =?us-ascii?Q?9ipiuTTPG//QpgfdL9DiiOYYXoR8x6nVpvhYZI7Vp2U9Ebc1qEYIa7Rha3bj?=
 =?us-ascii?Q?atchvQalcCXCePPfKApF/tLY5+y6kMQ6yOOKfvrcQIsWvQSo6DZOdl01LrPe?=
 =?us-ascii?Q?DAjCA8jcwhajkLysp3gUu32sgiUpd+gu5p/47UtCD+wV3IoeqwuuMmpOy9de?=
 =?us-ascii?Q?j34fzquIxGGSZEp7STz3vDUPRtHUcTMr8PC6DwSU2/vlG467WEJtdyLjBB8j?=
 =?us-ascii?Q?yF0+gv+3S9ad/B0yS1dQ2n+iDT6ugNCcFVv+LqicUEs5HfHR7A5xJuhIrie9?=
 =?us-ascii?Q?EPOqDi6WZzqtdU90VNMVEm/nQpfr1xwPeXd3lIzoZO0xtU2d6GHXzS2m1V8A?=
 =?us-ascii?Q?37Ycck4WU5XsLsIonH0NUzZ3oIE/FoXiTu7ZjimbH7nO5kG8ZBRemdg3ma3+?=
 =?us-ascii?Q?bR6sAVA0JA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee343c3-72c5-42a9-3e16-08de6bac99d3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 09:36:59.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWHAAFueDeYKZY5mM011DRUUEvtnpsITDqYthQATkIAvN28LP4RzHm55TV1K12t2Rswy0rrtGgq5ZgEf0BBnOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9301

On 2026-02-14 08:02, Andreas Hindborg wrote:
> Gary Guo <gary@garyguo.net> writes:
> 
>> On 2026-02-12 16:02, Andreas Hindborg wrote:
>>> Add a method to return the underlying integer used for flags. This is
>>> useful when using the flags with C APIs.
>>> 
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> I am not sure if we want to actually expose the underlying representation
>> for all flags. It should be something up to the caller of `impl_flags` to
>> decide.
>>
>> Would it make sense to add visibility the wrapped raw type so that you
>> can do
>>
>> impl_flags! {
>>     pub struct Foo(pub u32);
>>     ...
>> }
>>
>> to make the inner accessible?
> 
> I don't see how that is better?
> 
>                 bindings::blk_mq_tag_set {
>                     ...
>                     flags: flags.into_inner(),
>                     ...
>                 }
> 
> vs
> 
>                 bindings::blk_mq_tag_set {
>                     ...
>                     flags: flags.0,
>                     ...
>                 }
> 
> 
> I would prefer the first one.

How about we expand `($inner_vis:vis $ty:ty)` to be

    $inner_vis fn into_inner(self) -> $ty {}

? This way unless you explicitly put `pub` there, users outside the module
cannot query the bit pattern.

> 
> We are going to need to be able to pass these flags into C APIs. I feel
> like adding a method to do this is the best way to go about this. We can
> call it something else if that communicates the purpose better.

I think `bitflags` crate call this `bits`, which I think is indeed
slightly better than `into_inner`.

Best,
Gary

> 
> Best regards,
> Andreas Hindborg

Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020128.outbound.protection.outlook.com [52.101.196.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC063749E3;
	Tue, 22 Sep 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084139; cv=fail; b=Kyh7XPp9K6P8bmSFn5Op6s3JthC7WFAKamCYXiN21z5MvLZOCR0UrQVv78kTVNtnhyXwSaFg+6RIPLeeGGJ0Px4M9zToJlDxAuUB+lWVm8fTk1zd1wpq7FMnX5JOG9+e9Z9kz8RJ9mOq34re1L7rDYMJUdF43kG8u0/8es5/4TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084139; c=relaxed/simple;
	bh=0TqHePDfklZwYDl2PNCkkz8/sKuNnuXaFYpQXUXl2sA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kdcgsDtdGnijsN83WdNjRwIlEH7UT8U8vwDrbgQab08fXOE1FBSSO0FzyMZ2+QEP8+ow30YbLZm8TFA5kEcaWFfDcAp9sFo95qQo5c1Svr21KL4fXhjXeh4bZarTcwYoAEs7T5MnEjisGNvAsp8cqBfyhFwKb0ITiYMUFypevDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LRXBWL51; arc=fail smtp.client-ip=52.101.196.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LRXBWL51"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlZ2yG7qyDEZ9ynkBvH7VSljLCq2W6LKh4AfjXourCpIASNJ1ANsr34BhXXb1zXx1z3Eg4rRZdw6HLWm5OMweGSZi6T3m98kLXo7ZHB2S3uk6bUBpOePfTpJsc0WXq0Wp1KU8g0t1IMSK7/+TcEaE8XVs8f104kEJBmb2NyNKrK4ceYPqhr3SbP804sJoOil00zi7QeLcEa0wvud9/v6tamlp7klywhDSIjGIWzw5LyUeh7xOoHT+WC4TwlqvpSwr+HN+XEgcbA/LeY2Xh6UC016STsd1dsu3jp50o4UjEuw0pQ0w+HB7l1cfxdsVPZWiywXpnTDNxM6rnAqqmQ5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqG+APlDHrAl79d7egWwThDnuq+1bxHPdWLsbhcslSU=;
 b=py5Zp/6jPNnFg/q29IymL4/QXo54bzVvfoxr+xCjyDSXHPdmP/MqYi7FVU/go+4+lo8MlvSk0rtbF1LnDulQhfsUx/p9Pgd76I6nCjLQfpxYRLflv3HNosIdtWXeCovHr57SWoeeB6WKtjx+faiVBSbKk58UbcU/ahTLdqyKUvtju+DQBfRuV2ZnGYkbcD4kLO+4eoM68SxO3gtxcCSMMl6dc/q0FFjX/nwzarf+zCXggqDEt+R9zHhFwqxruB/UHoLnyedDCzpLXy0jjffwjJ9lXkzTL5+B57/EpNM4nDWHq4i56DnqPr+Ply8NKz3xHOc2/3xSzZgFYI2aPxLUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqG+APlDHrAl79d7egWwThDnuq+1bxHPdWLsbhcslSU=;
 b=LRXBWL517saWiAbD9k01abjiTTTDKELl63WOX7VfazxoAiyc7NO/XQIxsFu1Q6O2w3jbhwQsQCvI92LT9260vIO5PCefuJ4YGCuDYirkM6f0ToVxc84OcABBXjAmE5YQl6t6BoSXTw5aGUdtwc5LumScLgFUSX9M0EzD8DgZma4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6628.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 13:35:34 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 13:35:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:35:33 +0100
Message-Id: <DLLVV64UIC5E.10C9AB66BOEXV@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH RFC 0/3] rust: kunit: #[should_panic] and same test name
 with different #[cfg(...)] support
From: "Gary Guo" <gary@garyguo.net>
To: "David Gow" <david@davidgow.net>, =?utf-8?q?Nicol=C3=A1s_Antinori?=
 <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Burak
 Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
 <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>
In-Reply-To: <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>
X-ClientProxiedBy: LO3P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::16) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 8054b994-0638-494c-dc94-08df18ae60e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|7416014|376014|56012099006|6133799003|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RyFbqY/585SaWT9CWXYiiFy6KavcHDXEtReZfWxamRLf6tqZ33LSGhit0TPm2Ht5Iy2Qrz+JWB1dYTD4U4FVLjnC6zMenxx7TXbC2FrDKOGXyLUxF3OJe3RvRkMzUDYlS8zRLotoFGZ5IF8f+hg2y012blR+BqFG+Z/ybnncvFB0A+yVo7OubtkLRony5HIRD81uQUaPdDmxf9vMPA6lk6zEBANdWjnCw9XVKXJ5GyVwkZNsiI31jfCp69VfA1b0K3wevnRC/lvrEPVKcVu+jlw9lTdY3NJiPl9RklVz+UnK4bujHfYNDjVU4jKJSUAKaC0mE/x+u6AN5wuzoBr6aIoNiTvBfLq0FC6MFSUjJ8Sc+WR9QO9LzHv6DxWUsUTK/MHGJBGqvDW7fiWXrtN8ZFGjDEflYBVem4Th72sh7DO/ahPgoMHOmCAIqzs8dKgvf/0B1eoAWqNbK/7edHLthSFpPyZugvynFZ6cIvBDua7L/pDA6NGh8LJRxqmPi+nfYtOWKqAf6r3wSDbeOvIMGI1kUxYbak7R2w2olde+tDp54UWxtdGHGulv4tZMAvJzG40jCFvWYbnlsG4lLFYawAYQbgnLQEHynag8RCu57IxGuoWJuwl0douKc8OWIopbwBBP90Oon1BNS2VnDgggzPP5JMlu2JG8leNeoWybjuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(7416014)(376014)(56012099006)(6133799003)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE9qYXZQVFhtc3QyamtnUjlEWTJPR1l6dkJ5OEp1K1FCRVFBUlQ4Q1ZPYmxo?=
 =?utf-8?B?YStNbm55RVFqNEVZWHhmTGJZdyt6cHh5YWxJaFRWZmdvY1VqN0k3LzVRTVBx?=
 =?utf-8?B?MDZLaS9ZcGZYSjYyWS83TzhuVmM5Yko4aGpuc1p3NFg1RUFwN1RzWE9yTmRR?=
 =?utf-8?B?MzFNRkMyeC9pWEtxTTI0UFZRYkpZUXpNSWxsVkhTclowQmRRcnk5WnNvYmxh?=
 =?utf-8?B?elhYaHJGTTZiVWJsWWU4c2MzMU5SZWhka3FtaEpVQTFMcU5HbHN2N2IrYnU0?=
 =?utf-8?B?N1VMeTQvZFR4TkVhSzJNMVVEdXN6Q3htZngrZHdDYkdQYXp0bzRwY1hNVzJo?=
 =?utf-8?B?dDNNaWlEMWNBTGVhQ0tXeDF6NVFYNks0RGxMeXZuM0x6SUtNRnhlWUlONXhE?=
 =?utf-8?B?UUNNRkZsci9KaUtJNTNya2FMYmthaW1qb2x3SGFsd2JPbFRodWRpUHhBNFBi?=
 =?utf-8?B?dksxK1Nnbno3ZEtrekZscjM0RGl5eWFsZzdTUVlWem0wMlZZR2podjZaT292?=
 =?utf-8?B?bCtpNm1Yb0kvOWJLeUZibS9scndEaVJwTVNKMWpQcnZ4d3oxQW1QOGRaUkhR?=
 =?utf-8?B?NnRTamJ6YmhZdXVZWHVjczNZTnQzZ3lnR0dyWjVRdVlIWDh4b0kxZ1VickZZ?=
 =?utf-8?B?b0VnQTNVdFhtNDh6RGkwd1JTT25zdlMzVUptU1IrdXVZSVlkYlh5ckZMV3Rt?=
 =?utf-8?B?alVneXhoNHoyRWEza01UbWdXNVBjQUw5RXpxa21RQno4amRtQzhTc21LcWcv?=
 =?utf-8?B?NG5tcGZmMm51dWpzenJLMDIwU0R5enJtWGF5aC9ncUdycVZobndzalY0N2hO?=
 =?utf-8?B?OW11ckppdVY5WFVvYUFJMGdKOU8zYXhjblQ3ZE43czArUjdQZ21BaGZ1WUVS?=
 =?utf-8?B?Y1cwaHJ3UjFlTC9TR3NWK2xLQnNadlREdVEvNEJldWEvTTh0Z084T2ZiaXBW?=
 =?utf-8?B?amVUdnU4VXo5dTBzU3FWdUFCNGZTV0NKY0tTSjNiam9Zc2g5dlhCaFNZQjI2?=
 =?utf-8?B?VE9LNnBFQXVsakdYUXN2QnQ3dTc5R1IyQ3AvUU8xNngwOVl4SUhDU1FPdmYz?=
 =?utf-8?B?N3ZlT1BGVUUyc3Y5elRzTTNDZFRHTHVMWWhJNVNTTkRUOWE2Z09ReTI1am1M?=
 =?utf-8?B?bGkzSXZndVZIczJsMzEwSnMrcGRaR3RyYjhlNXdKUndsWkpyNVJVZWR5azBO?=
 =?utf-8?B?T0s2VXBrWFZ4OEJSUHVsZzlTbXJKRjBHVjBGQnlCRTNvcS9nRFBYZXo3TVkz?=
 =?utf-8?B?cVJ3STdGSHJQdWxsckUvYWdzaGtPWVZ4OGk5VU1lcWt4dU84bVNnQjBnbnpp?=
 =?utf-8?B?SWUvSndlY2t1NHBrVTdFTmJJam5mRTArWWYrTTdCSzlmNVBZRDNBMTN3NXdJ?=
 =?utf-8?B?Z28yWUlkOGFsODV4MzBjNk9lNXlyekNBb0xYeXR6Y251SFZSc21jc3MzUCtr?=
 =?utf-8?B?SUhIa3lvVk9zQnZvdHhWUUY2blV4T3lLZDA4amZwVVZGRHNoc2hKY1kremNH?=
 =?utf-8?B?bzFSM2cvRkd5aWxSVlUyMUVESzZFZmN6NUUzY05JZzdEdnZUVjdyb05JdmNQ?=
 =?utf-8?B?WEo4Y3ZtVUJjYmQwNnZKNzRqTXk0clR1Y2FPMWpQRk9xbVZNOEliSGtZWk1j?=
 =?utf-8?B?Zy9jKzdOSExJc3BJeWRrTDNMUlF3TWZMcXpkbVN3T1QvNStvcjNIL1Zjalc1?=
 =?utf-8?B?eXU5aHJ5Y01mTFZxV3pkY2dOMFphQ2tFMGQ4ZWZvNUErSk5BOVFzNUM1Ry9L?=
 =?utf-8?B?cmtSOFBnK1M2YUhRYlZob25kMVIwNXN0NEcrNGtnWm9yTk9rU1kvclAxQUtC?=
 =?utf-8?B?Vmh3c3RGUGdDc1JJbUxwTThwblkyWnBKbDVlWXZNWHZLK056QkNxQUs1empw?=
 =?utf-8?B?RWsvdGNpVjhXVWhhKzJ0MURRYmFpcm1vWWlvVWhnMGJWNlNLaTYxT1VUS3JU?=
 =?utf-8?B?dS9RbVV2amt1bTF5b3NBa3VjSkZWR3hJUEhqMi9CM0xMVzhKMWdua1g5T2Nv?=
 =?utf-8?B?RFMxUVZBVkZhUlI1TUl2UU55NXpjYVV6VFpGSExpcDZ1OUZVOUs3R0tORFN0?=
 =?utf-8?B?a0ZvdERyNXhGVWFldFJPUmx4bUhiUGgxTzRmSGw0eGdmSHMzYmo4YktkNXQ3?=
 =?utf-8?B?a3FteHRFVlJza1FNRGRxUThPRlJjN25HQUJuZFl1dm45Y3NmMmV4djgvZTVt?=
 =?utf-8?B?NDhMeGVFVFNuemg3eU1DbkZIQjVjK1lpSFdUQlVFbXdpZ1BjSkp0UHZsOENE?=
 =?utf-8?B?enNSUlcvVUZ5WDl1RHo1b3BLNVBIcU1lTWNxTUZmUzhnZ3hFK2YzZm5tYUZC?=
 =?utf-8?B?UmhHaWNrc1BrZExwenRZYXBUYmljS0RzTDI4cVVCVFViaUszNzBDUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8054b994-0638-494c-dc94-08df18ae60e1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:35:33.9755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1Q3hSRDuqn7ozC92I1CUPbfo0s1w6yCELJDy7RPNa0LzQ9JQHjsLEY5if9wn94CRPctgCeKmT8RyUoGGA9GTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6628

On Tue Sep 22, 2026 at 8:56 AM BST, David Gow wrote:
> Le 16/09/2026 =C3=A0 03:33, Nicol=C3=A1s Antinori a =C3=A9crit=C2=A0:
>> - Is it ok to 'stringify' the configuration so it can be distinguished
>>    in the report? Would you prefer something like `_case_1` `_case_2` ..
>>    instead?

I also don't like the stringifcation of cfgs.

>
> I don't _like_ this: my preference would be for us to keep the same=20
> name, and just not emit a test_case for anything which should be=20
> compiled out with cfg. Unfortunately, implementing that is a bit harder=20
> than would be ideal: we need a way of evaluating the cfg() arguments in=20
> a proc macro, I think. (Ultimately, because otherwise there's no way of=20
> statically determining the length of the TEST_CASES array?)

This is possible with a trick. In pin-init we have a similar need, so what =
I do
is for

    #[macro]
    struct Foo {
        #[cfg(a)]
        bar: u32,
    }

to be expanded to

    #[cfg(a)]
    #[macro]
    struct Foo {
        bar: u32
    }

    #[cfg(not(a))]
    #[macro]
    struct Foo {
    }

However, for kunit I don't think that's needed. Deduplicating the names
should be sufficient?

Best,
Gary

>
> Unless you've got a good idea how to fix this, though, I'm happy to put=20
> up with adding the configs to the name for now. Though if there's a nice=
=20
> way to make the names shorter=20
> (rust_test_kunit_parse_cfg_in_kunit_test_cfg_config_rust_kunit_selftest_e=
quals_n=20
> is definitely too long a test name, for instance), that'd be best.


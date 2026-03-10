Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268FA2BF3E2;
	Tue, 10 Mar 2026 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109359; cv=fail; b=l0h2htE0d2C7Be5VF7sgVeI7X+OtkHusQYuMikJCrfpa6HWl9V4kasLhRYINrL6UupEwCQyDSB1rM0TtHMw/Z9zEn4RjiKN0bodxMJ2drU7ThQpGGAD33/wzN9iAsyPjN6yTke0tGzA3r62na1QpCneMeHLJjl088IgtDTGZ0p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109359; c=relaxed/simple;
	bh=dAERJlIRvii1xAKmNIVeuAiNjmr4VWy+wfeojd20sd0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=HvbHGtMrBf+3S7F1D81MXLlDdzoSvoCjEzukmTDspw0OITAQsw35i9Si0UqXCzXup/14Y6UUorkL0j3sBXwuoZ/POgNiUtDt56Kp3lXcsjFYntSpg2JcB+RSgbMR1QA8jfpNk3WnFLHkGg8r0ktFBdsZax4qe4R/iGuYbNbblII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G0gt11e+; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G0gt11e+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWLsBTUA4gxnts1NEOklHdW8chdox0i9/U8rnrYSymjm1wwZ9bivLWIHZlM4pOrGPVzgw1AibC2r5ug2gCYkxOO2sCyJF2faVXzfGyQIQjy5BD7QrRPgBOnPens2VNTmPWvVPMdtKue0YpsROUF9eKMlsLcuoRmtcX5vFmll+uFnejigSkYo6Odzd5Gah4WGi53N4H3zpIG8C6+LSJ5j+B3G6iuK8Tz2jJmKl932el8HG3s7HVh39OknWWpSiJd10/5oMqaEdsx17dydl+2EzwEqtGA6QRtWpCeQEKTk/ItlsDk7cXR2Qh3D0LDA5JCgI8e/9ryfIWzog6IgjXJHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mzTET7on+i8D4aSu14vDRwWkVh2SbvVUOJzZlHiAwo=;
 b=Wb80rZ8+VQ0Mewpc4tTtc//5c0du9Vy8GiJmwEIvxN04HJQVhkbVV/rsFs43jzi99oN6XWujI4wEL2gaZ/XLXRfNzQAEtZ8jhaIf9tjESE0LqcsB9J3uIbUmkWN79h5wZANU4NauCQrVfcfvLFiTHNOqMJQ1FW5XpfIhX8RH5Gcs6OGG0oWJMlBuM/gCvGU+8U+lct2oAVQwsxdx8MmmUhJ1qUghjEulIFdculT0ElQcZeKzBjQNaGMAl26adr3DPSLHhC4gaXWFOdwoxW7trcjHiYKfwMINlNBZBjH+hyTZqWJG817mqH+NmqlUfaAnVMZzFDgPh5t0c/CL5oeE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mzTET7on+i8D4aSu14vDRwWkVh2SbvVUOJzZlHiAwo=;
 b=G0gt11e+1Hzv0s7eapGdgD/C22JKiQocApt2ClZw5qHLKP+/ZEUadMe9jDsURIwE3CZM8D2l0jJNBPv6pVjLJ71E6A61WR+Ai3/m0An572k6FCFZ0VTGAwP0q3cidQ6IzxIafCpFYNq/X0CCsUoUjmt2GMcYTCeEx+SEA/VJacD+FPByVUNoEuYxtOVQ/8CIMcHsFAZJZOK4qtzOpYGSxgEJcCuXxAQuSdRhCOannwTStNWT6G6CrIv/IfcseF+0tBLMUHTPf0bzDbArg41Umix4AcjuZ6IqXhrp73hucSHTYdus3j8Tf00W7gQfjffch1DI3XKdMG3OdSBrJ+xUOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Tue, 10 Mar
 2026 02:18:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 02:18:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:18:26 +0900
Message-Id: <DGYQPYIZ6NG9.2WSCVV1RMLYXH@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
In-Reply-To: <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
X-ClientProxiedBy: TY4P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3c17ec-5b96-4a05-d5e0-08de7e4b521c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	QzaXV/NWEeE7o9J1yw4vQW9aqJZcBlwYOySnsdhzs/vmOoqN4Ch5U/ayXMku3ht9tXzDZEsGBoSNa/0iBmi/Pw/kH8+UMFb3XVCnNEV/YRKMrOaqTzpQrB922tlz1oh1Y2BhN4US+j+4jFnsFXhP0+D+Crsg7eVDm/sc5iX8/Ff2cBk7Sjp+UIwftd9aVlzu/NKaUzhZ1EzKOuFngsPeGtFmOwrRF5ROJHKWuYWS3zAsG+wTA4MiE+09366L7TQAYPzGKBO0n2GvXyE4dQ73EKIpLbDVjae64C+3rWLraW+83PumzQXVQ0HcB0ztbVLRBCh3zm+/GL2GZMBlHUa2Cgvu/QiZw6qLR2was8yAOhvUicZDEAJ3EuqLoc3pwHmg8E+Z58hUienGsevm+H9FQIGto2IJ9d0yAxRtV4lCrJQScfEhPp9bzfcYQLdj+dP3WnGKzRzJ60WkLnyvQG5D68mrmekEGi2ONZMW/46ud3UbiuTk7ooeDJnyPAPh4d5W4fZw5kWp5djTFWJZrhfjdwvpd3T4s22Np1THhVFwiUIAMnpu9SLzu8YfUr58Oqe9KzKKdIEuyU6Oi4qODJN8VFNpY1bFonqxRB+5NDjRHkoxrjwj5eXCSB4HiVOdfbOLdQYwf8PoGlEn67uAVX8tkldDL9Bye/OG4YNG5+5vxOj5UTZtbK6l7FAW6FC3HlWCNXzXpt+ydT7aTHHPge70Ziuj7GqNsxwaSe8GctkDqxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0FDcEdib0M0cVZqY0hxRFJHQ3Mram5iVzZUSnJQQzhIK3ZDR3Nmb1UxWmJG?=
 =?utf-8?B?NW9ZWFJyNHFFSkVSTldIWTlIaXJySndadE5FN2FPQlhGc1dXbTNGaUZ5bndJ?=
 =?utf-8?B?UnY0K3ZPTGR5WjJHMnlhSHN5dFJmSmd0OGdrcHVleWdPYmVYTmJwd2t4bmEx?=
 =?utf-8?B?K1huL3JLNFJCTjdpUkhqWldwaXdIQ1RVdXdCS1pPdGFHQllHZnNjWTNTNkxz?=
 =?utf-8?B?S1I2UW5wTDYrcXJIc29sYTNJaWN2YXd0ZjJXLzYrVzN2MUNEb2U3MW84MGVG?=
 =?utf-8?B?R3UvK0UwV0hZTmNKV2J0Z0hSY3dzckM5SlVRMGp0YkJvMmlNdVl6T2NIVDlv?=
 =?utf-8?B?L0ZQdENQT0NSUGdwWExVaFZNdmdjMWFHK0I5U01Jb3ZRdXNTNW8za3JCZDZq?=
 =?utf-8?B?dXdGdHJsaS9VSDV4Yk9vREs2R3RRYjFIT2NYZldCeWRyNThIMjcvcjBkUXZ1?=
 =?utf-8?B?K3JBbDlLNVYxNUFSRmc2VU9HNkNFZ2NTVjFTMEl1djI2TEVKU0Y5aGxQRDA0?=
 =?utf-8?B?N0c1bDhLdmJaL0pKckJlU3JGclBxeUtyOTIxWnAxSnhhNVVXTDd4VDhncGtL?=
 =?utf-8?B?Yko0RDhTS3JqTW5sb1p3SGpjYituVTJDUytTcGRyTWh3Z1JTbGJMdEJROC9G?=
 =?utf-8?B?OUtram5JelR5bFUzV1p4TWxNUEtoZGZIKzdRbktQM0NmeXo1NG5sVDBvRHEz?=
 =?utf-8?B?d2VrTk9yVUxNQ3J3emwrRHYyblU0eDlzNkxnVEpudFQxbXBDSE5YZzMyejJz?=
 =?utf-8?B?TzFLQ1Z6Mmh1RVNIb1FOL1l2dUFSSExSTWRIVjkwZFhaYjhzakZQN0hrUExl?=
 =?utf-8?B?Y21objQ5Ky9Qc3JyTEtYKzltb0cyRytJclFIdHJsUjNHUjlLcXgyRHBZWTdJ?=
 =?utf-8?B?T0ZkWXJZUVNxRDd1bm9yWHhZSTd0dlpRVDc2bXNMVjVGQVJJUHpaTndWaFBV?=
 =?utf-8?B?VXVZK05pY09FT1JBUWlRanlFL2JOaWc2RDNxdi9sUVFmaUhnZmN2TDdycjhU?=
 =?utf-8?B?a3JlbDVDd21nUjdVZ2VoZUZrR0xmaU16dkxHRkRTTzVXYVhISURlbnFlU2p6?=
 =?utf-8?B?TUZBbkJuUFRxZmlEQ0VhTW0zZStqd2VRdStMVkhGMmxMampja2FEYTE0Rndz?=
 =?utf-8?B?d0FwRzJ5MU16RWwrWEs5NWFQbUVWbmp0VWNWL0hIeXJyVjJWeG5mdEJQNlFr?=
 =?utf-8?B?Qjd0WXJPMk5EZHpWdE1RVERyb28xeXdkM0lKSkdHQ3NNeXNiSE1oUjg1cEcv?=
 =?utf-8?B?MWxzTzFEL0lETS9UMDg3UG1mZnU2M0R4bG40UGJYc3FjMzNmemhORnZRdmhN?=
 =?utf-8?B?Q2xyYmV4STVyUlNmWXc5ZWx5VU52TVNWSVhoMU11clFTeGhpeWZSNThUaVNr?=
 =?utf-8?B?L3BlRmszdUFqeWdzR0lvbHZsRE8rOE9hM3N0WWZOY2xqc2U3ajA4MFNvQWFq?=
 =?utf-8?B?aW9xMUFVMHNLUnM3RlJ5dmI1L0NOVEY3WWEvWitTZlNoTmZsZ1hsa0p0SUVX?=
 =?utf-8?B?b29FT3dwaHJJMDI2WTdDK0xwYjdpRWRoNWp0UHE2d0RzWmFyZzBrcTFzUkJ1?=
 =?utf-8?B?UFN2V0ZxWWhPZHRrTlh2R21LZHhidHE2RHhtOWpzUEE1ZGdLRTEzMkZzOXRJ?=
 =?utf-8?B?dm5TNlRXQ3Yvc1g1WFRFUThVUGt3YW1wMVFmT2dTdXlTdlNLKzZiS1hTMzRv?=
 =?utf-8?B?VEJEQlZPV3ppN1luV1RwdFlSVytaWEZHeDJxR0w4M3NtR0MyWFoxaXNYYXpa?=
 =?utf-8?B?L1ZsZEVzWjQ3MHNqcjBRN2ROUzlKWXJRRlQvc0dwV0dRbS85NkVWTjU2M3dr?=
 =?utf-8?B?aGJvNWdVR29BY0tVYzJTaW1WREJlVDdnZkIxKzZjb3lBKzhZdWdkcHY5ckhJ?=
 =?utf-8?B?dmMzc1VKTzdFNjJ2elBScndjRy9LV0ZVVWlpQ2NUMENRczVVcm5xRFFLODNO?=
 =?utf-8?B?N0d4cEY3WGsxVWIyMHg5NTl6MlpVVmJXdHUvci9acjk1Y2l5RWNCdnR0SThl?=
 =?utf-8?B?aGdlc2Q2SytXb3BJdEtJS2llaGNGOWI2c1NGNm92bnZFMGE3M1B1SGRZQnRY?=
 =?utf-8?B?aVQvNGhuczJDSmZtRWhSSDFiSGVzZ0JaWkJ5NWVwNjhVSzNWZTI1WEhVRlJ6?=
 =?utf-8?B?d0ZWVFM1SDBFRlJ3L2VVRnJSZmRtVWlQRi8rcDQ0a1pVVW1TY3R1cExYQ21w?=
 =?utf-8?B?amc0Q05HbUxXVmY2Wm12RGtoZmsxM1h2Yms5QlhlYnlaZ1lPZkt1WmZpend5?=
 =?utf-8?B?ZnU5d1RpZEdDek55aStRWEJCbEc3Y3BTK3pLZmxoeVB6ZmZWak5HRTZqdGl4?=
 =?utf-8?B?SkU2S1l6amtrZHpRdGc2Yk9ZT2VaeHlrUm5hUWJSNmFlTk5LNnFobzZKS1Vu?=
 =?utf-8?Q?vhRsz+4C3WSNuanDOlWyvpLB4N33Vzas3UaSyLG3HRk4W?=
X-MS-Exchange-AntiSpam-MessageData-1: a3SoINjSDihRyw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3c17ec-5b96-4a05-d5e0-08de7e4b521c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:18:30.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EPSyDM2RcKoNyb064z4VyKI8jUCx1hL9pxtpw5OJNH1BUXtr5jUlLuvLJ2cN72/8/0o/IHwHLDVhG9s0OPqpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149

On Tue Mar 10, 2026 at 12:43 AM JST, Joel Fernandes wrote:
>
> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>
>> @@ -797,26 +792,30 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<(=
)> {
>>      /// Writes values to the mailbox registers if provided.
>>      pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>=
, mbox1: Option<u32>) {
>>          if let Some(mbox0) =3D mbox0 {
>> -            regs::NV_PFALCON_FALCON_MAILBOX0::default()
>> -                .set_value(mbox0)
>> -                .write(bar, &E::ID);
>> +            bar.write(
>> +                WithBase::of::<E>(),
>> +                regs::NV_PFALCON_FALCON_MAILBOX0::zeroed().with_value(m=
box0),
>> +            );
>>          }
>> =20
>>          if let Some(mbox1) =3D mbox1 {
>> -            regs::NV_PFALCON_FALCON_MAILBOX1::default()
>> -                .set_value(mbox1)
>> -                .write(bar, &E::ID);
>> +            bar.write(
>> +                WithBase::of::<E>(),
>> +                regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(m=
box1),
>> +            );
>>          }
>>      }
>
> TBH, this is quite a readability hit, the previous was much more readable=
 IMHO.
>
> Why doesn't the previous caller-side syntax still work?

Looking down the discussion is looks like almost everyone found a way to
work with this API that they like, but here are the reasons for the
record.

The previous caller-side syntax had many problems:

* Every register must have its own ~6 (try_)read/write/update methods
generated by the macro, creating a rift in how I/O is used only for
registers.
* The number of arguments these methods take is dependent on the
register type, which is awkward.
* The I/O type is passed as an argument, meaning we cannot use
Deref coercion on it, further complicating things when we have more than
one layer of indirection. For instance, it didn't work well with both
Nova and the Rust PCI driver sample (one of them had to `&` or `*` its
I/O type with every call).

With the current revision, there is only one site where I/O methods are
defined (io.rs), to which registers cleanly integrate like any other I/O
type (i.e. registers are not "special"). Deref coercion on the `Io` type
can be used without limitation. There is much less code generated by the
register macro, which has become much simpler as a result.

This syntax might require one more line here and there, but after
working with it a bit I think it is actually much more readable and
well-formatted than before. It makes it clear from the get go what kind
of register you are accessing, and we *do* want to be meticulous when
working with registers.

It looks better both on the inside and the outside, and I hold that view
not as an opinion, but an objective fact. :)

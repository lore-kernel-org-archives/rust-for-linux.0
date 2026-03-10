Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5042730CD89;
	Tue, 10 Mar 2026 02:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108360; cv=fail; b=sYDeqRa1fYzLb701JHbucA8NzEQyNxLrQhwbHmFOuI/V1iKFkpLA+RHjMxHBcp9GsJLk581i/rvVRNlc8rWhl+CDtCA+GiQ/yNR3he3j9m22+TTNLPLBCO28OTtjBmUO3R5LjlSCyJw8f2IPe0+VEEUOnWNwxW92kLAsN2oJrw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108360; c=relaxed/simple;
	bh=T8gxkkqwKhDV53+Xlb2QJIS+oy/l4GgLR3NL1nLGGy4=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=EUMSuAmn5xMmTFryN0rkDwJC3fUeef9YMU1WTLsoQA1iTAzBFJX/gqi2BQqLxnyVEmUJaVvUoYJyf77hPe4HWHRWPXPjdh0aE8zs3AeVZ0fADvM/aeWE963nhAZl+22g8Ptteg650HotX8/gnzvjulz2XAkOmPhKtvqWWFfun8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A6b8eDoT; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A6b8eDoT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzOLQ7hPmPi1TfECyMh0i0Ys3fR5yCQC3edrGCIYxn7SuwnG61rhd3MHiZBsH72Tb0HpeAB4gfDG6HhqMWJ/qIWB/1yqEzj7IsJxLT2WNM+zTjs/1xnGeGRkotieOsDjnepQwVCaaYJQDsXI2wpg6QRVcE0XOJyVTmuorSNxYtiVd9BKT8vlANYZYK0Ku6WeAkbEohpW8qKqscBnncfAs2YFomAmSLSabkNICVZ/KPZDCBecwqdQeqPqEPOl+/R9LilEghlJzJkl4Ie9iq3uWsFF4miKoSiBoD3PEHQwuVjZPd5r1/5AqgQzZpHuWoN3LkagIHmAvvZ4XbeENIcplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0V6o7NfQ1oqWuXPEx8iHHF3E0693D4VtZv2ph1ETIIQ=;
 b=u9E20Zx2QDLSoGHL5treFcc+tryh7CB14+2geHusE1y8TuGVYnRUk393tTOLia8B8hT826SS7temDeixbpGExAsuDo8vKF1KCS+E109Om6ue651tHdQ+pUCGmYvoFxEf0Znl/OVkeuNlJKdJChXBHq4xB4+f7tjv5wt9mpD4qx/g3w1vbGL6hZ3mW3dBqBk+3dgfwEaaF/tbqNSyKM5bAnLNnPDCc0MSiKFDM5hQL5qLpEGsBR/KiUw3NwjsVXPQY92Y3mnj5cHXgl1uMZA+iCP9ubwrWzNge1lLrCSceIyYbyxOh/1+U6LhD18NHKpL3yfK2FJcAnamFWMQHS0Gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V6o7NfQ1oqWuXPEx8iHHF3E0693D4VtZv2ph1ETIIQ=;
 b=A6b8eDoTydlmh+JN5tsFMyWQFRhDmPtW4SQrKa8iJMvcDs20i80adF5SD1jo0X8EByDeEM6SgjO4pt68yPcUD8ChoY9WTr4OO+6HaUKHiZeWWGCfZ5NYhIxyPdYVQxsZpxmqA0Fm851+mlQxNwdOBGnO/fD4pWG15p9JIAQCkUnZm3KQm0R5HbV1Tn/B7OWE/kUXiFhz7lPOkbvW7I3CZKCUyFUZQ917zI1IdQVzSfHQ3+BjuUfhtg4bV1g54w6Lyl3tSCTa4JXJ2YrpUQruD7mrj/omGRduPch5QQclpUt2yjxTTDiZIvaw+DQZhoaNu57lasvd0bxO/+er+K6sCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 02:05:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 02:05:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:05:50 +0900
Message-Id: <DGYQGB9NCHT1.1IU821055E3S1@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGYCXZ3BGN5X.1ZDK1YSNDXWRU@garyguo.net>
In-Reply-To: <DGYCXZ3BGN5X.1ZDK1YSNDXWRU@garyguo.net>
X-ClientProxiedBy: TY4P301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 586f37a1-dd66-4a40-afa9-08de7e498fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	vZ9hlgKwqr/sX58pqYOcOVcCxalsCiEcRt0KUm5dKQWaqYXCEPcPXNKQ3ZcjZq45CleBMj/hRzRXHTdMMtrfYaDUH9ZAgzQHac7uaMp2hVVTtzLSlXykF8MYpNvz1gXeE72CWDtfEechgwQQgSauyH8v7t5U+f/7BQkR7GcAIPOqEJBWgji3mwVEKqmsQuLlvl3ys/auIOnYzQAUnskaWufNjGt2448gmw21MBxkC87kG78XPdIb5ijhanw+ZMTLChM26hDAGDefWb4xOznxjMMbO2SWWOOrAlwYwsa7Nczjh+fGtXR0gV89Tu2A2CBTe//Hlfd445rwZVDRuXDeKSxvLGv9B8Vz6tMLboipAzq593/2P9XPd2hzOBI2tGwwWNRKmI++xYGM2RJ8kU35NFQAtxXE/MXKrz04NSp5MfdTiJw30tk6OqM3EdyD0LsKsrffOOzd0xmX4f+mPvgMKstFg67AyWgtLk67r1+ZT2AGYNoKygsecBs69KUQRI2gmwnZNC7c2DU0DKAXvGw2CT2ErcZIHATPk6IpTtxDkB1zcrBYbkfjTBGlDVYRd24pNbPrVES6CvefRHCg6ZaFDtq+DSuz6qfbeWsEv41lhirrFHO2W/6f5D+vyvhf2gYNh6JHpxxa/HOH/QxfMVYn4IymlMx5EJYLVmOh81MuRE0r9KIDMBcfn/7gJpd2fgbJWIMeABxxq34L/dYmVqdrlYbkYwkEFmGCFmQQ7wKJJOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xjUTljeHFMdjRZVzFLNHRIaUZDd1JwU3dReTloZWtySTRiRDYzOE1JSUdi?=
 =?utf-8?B?T0FRbkVoSlRTSnlSaDZqcHFIOWRNY29KaDNLYkk2UW1sc0F1ZFBwYmJFeDJB?=
 =?utf-8?B?SGkvUlJnOXpvSjlVQXFlN0M1MFFYQXZEYml1bVVwTmJPbk81Ly9jeTJUUE1t?=
 =?utf-8?B?MVBHVy9GKzV1YmhrQW9kRU1GekdSUE5tcjlhd3dMUmM0VmFJNHF6eHBmMmR1?=
 =?utf-8?B?anFyd0FYTTdRTlhMRWdzZEtBNUF2SmF4UVMweUJxUjhHWVRsRlI3SDQrSDRh?=
 =?utf-8?B?QjRpbUYrWFNUMkNDNTFDUjA5Y2pIUGVXOWlMdGVRUDd1cVR2QUxaSzR3QjMy?=
 =?utf-8?B?WlpYL2V4L1MwdjI3akQ0VTVSQm5DVThqdjlsVEtHK1FwRnZTajRtRDRHZGJN?=
 =?utf-8?B?cGRjaGpPM0FTeDRiMTZERjhDZ2xjVndYR1lGbGtOYUtqRGpiYklLY1E5STE0?=
 =?utf-8?B?VEoyTkwrOVlsZjdJUXpWdGhQNzZCS29tN3duSnlhYm1KSWYwbUpHYm00TUlm?=
 =?utf-8?B?a01WdHlXcHp1dGorR3pRZEhSLzlIamhvNUc3T2VvcHIwOUI1WkEraWhZbU1u?=
 =?utf-8?B?cjV0SU5jazZOVnltTHhIZ2lidFpoNml3SVNKb1pXNHFQeVhCR3o5aUhPemVq?=
 =?utf-8?B?a2lVVjczem9Lc3dnRGthaWhnVkYwZ2lOa0RLS3A4aVNQak0rOXc1ajlqWXZT?=
 =?utf-8?B?UXdkMXoyY1NxQlhicm53SkhhelFicUgvbjU0eU0rRkc5UkphS2xYaGNHc0FY?=
 =?utf-8?B?eXVsRXhOcXM5bWM1bGJRT05rSGN2Nm9MM2x0dmxwM1VqNTEweEZYend3TkNT?=
 =?utf-8?B?NW5JRDlWQU1hMmRkbHFDM2VkdFhMODhtL0RZT0xmWGFBT0puWmkxMWk2dm1C?=
 =?utf-8?B?eHJRdVBsMXFFcVQvVitRRTZURWdRRC9CenlnWFdxSE15WFc5YW11RVNqUUVB?=
 =?utf-8?B?Ukdvd0wyTDB0eG4rclFFdWQwdzQwQ0FpL2RvbnpLN2VQY1lnM3BxZVZ3YUNi?=
 =?utf-8?B?MkVBcE52NnZoQSs5M0ZKZjJzNXpVVm5acG80dGhGVk1ESGh1S2w2LzFrbnVa?=
 =?utf-8?B?ZU0zbW5uSHFuZno1OVBIYk9jOWFBOW1qSURNRFh3bVhVR3dDd3Mxd3BuaFVL?=
 =?utf-8?B?aERMVjRVTlJuUit4bXN4eDNuL0xMN0FVdDhmMWtWL3hqMFF5YkZOWVc3czJD?=
 =?utf-8?B?OThIUDFQQTUwN0ZKbFgxVXp5STgrcC9XRitZZkpZSXZaRmpCaTRuVEFkTEFH?=
 =?utf-8?B?NUhQVHlTcm5VUDVXdVBLekprYzRhVzU4c2J0bWRwTFJwMGVpZktXVGJqdnJj?=
 =?utf-8?B?Z0dDdWpSeU1TZjVhUjFENHdpdTh4K01RQ1RndHZoOSt2RG5YR1hqUnZmSFFu?=
 =?utf-8?B?UTNRNUQyVXZuVFhMdzcxM2pFNFZCczNkSjNqVnFycVRIR1pXTUV0NjlsYzBS?=
 =?utf-8?B?aDUvcnBOR3JkWXFuTTVXRXNybTJPQ2l1em1RcHUrb21mV3B3QUpuMmxvNHY0?=
 =?utf-8?B?WEZ3YnRyM01ieWhHb00wT0VjN3FIdjZDeTRFbnNZNHV2cEpRS3dWclpudng0?=
 =?utf-8?B?TXZybzBaRHNCT0xuQTN1dzgxR3dtdDJUY2tHdzAzVWVKZFF1TjNLVUpsM0c5?=
 =?utf-8?B?QVFGa21jaVVFYXA2QitSeTNQZWQ4dkhaMnVzWXhpQ2ZmTUl1eWVCTFRQNlI2?=
 =?utf-8?B?c2MyNEF3WWN2ZDZQUEw3ZlRLMVpxRmFTTUp1Mjl5VThRc2xsa21kNDJJV0Rm?=
 =?utf-8?B?dFcyNzAvTTdIdkhJZitZQnZxOEsvY1dHSk5hN2VvcjJQU2x1Z05lNUFtN1RV?=
 =?utf-8?B?enA0dFRURmlSWTJYdnFmR2diUlpMU0I0b0puQ2FCUUZOVWZGMHhKcmNCY2NN?=
 =?utf-8?B?MFZRYjIydVBoY2FYdTl2RGcxeS9XdWpCZWZOb0UrV3o2VXVEMFhVY2t5R2FV?=
 =?utf-8?B?Nk5KQTZIbld4bjVlTWs4NjRYbkRQTisraVhGSHdTYzcyeTRoR255ak4wRVNM?=
 =?utf-8?B?OXcvcVJ1NWJVSllEcklMOVVGYUYyQU1YTi9VMFRGSWU5N3B1THg1a0pqSUlC?=
 =?utf-8?B?UVlySEt6cmkyd2c0eTdWZEhiVk9kY1dEd1Z3dFdVMmIxNGRNaUJuSERnRlJZ?=
 =?utf-8?B?bkJ5YTh2ZnJmYXhTMFoxbEdBYWZJRENWck5oRmd2Wkt0VXRxT1lEbjV5Slpl?=
 =?utf-8?B?WDdPQTRlY3BzRmw0d2V1SnlFOU9XVDlUaXEzb3FFSlVPNGZWTzNzeXhWNXFU?=
 =?utf-8?B?OXBnQk0xQnFSYy9sTDVYTzdrb1JPVzdIVStmOWVQZStZM2s2S2kwdDNueXRp?=
 =?utf-8?B?YUxrNm5Ed1hJYnlyY2FlVW1ZQWpaTmhGWExxcFNsS2hxcEcybUl2a1lBM01N?=
 =?utf-8?Q?E0ofgCtJc35OM+CeTOH1tmXhklH8VTcYDjXdVg4mwjOUh?=
X-MS-Exchange-AntiSpam-MessageData-1: PysdLJ74MR1hCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586f37a1-dd66-4a40-afa9-08de7e498fa7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:05:54.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xzw+oCN+FlaSs3DxkJwqJmkhUljlbEFOHwjeBym/nWnT2bN67KNSgCodeVif8MHjoZwNe7cqhBXDeF9MgLSrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307

On Tue Mar 10, 2026 at 12:30 AM JST, Gary Guo wrote:
> On Mon Mar 9, 2026 at 3:14 PM GMT, Alexandre Courbot wrote:
>> Some I/O types, like fixed address registers, carry their location
>> alongside their values. For these types, the regular `Io::write` method
>> can lead into repeating the location information twice: once to provide
>> the location itself, another time to build the value.
>>
>> Add a new `Io::write_val` convenience method that takes a single
>> argument implementing `IntoIoVal`, a trait that decomposes implementors
>> into a `(location, value)` tuple. This allows write operations on fixed
>> offset registers to be done while specifying their name only once.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs | 68 ++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index ed6fab001a39..09a0fe06f201 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -216,6 +216,22 @@ fn offset(&self) -> usize {
>>  // Provide the ability to read any primitive type from a [`usize`].
>>  impl_usize_ioloc!(u8, u16, u32, u64);
>> =20
>> +/// Trait implemented by items that contain both an I/O location and a =
value to assign to it.
>> +///
>> +/// Implementors can be used with [`Io::write_val`].
>> +pub trait IntoIoVal<T, L: IoLoc<T>> {
>
> Is this generics instead of associative types for some reason? If so, ple=
ase
> mention it in the commit mesasge.

Associated types sound better in that situation, I don't think we can
have several implementors with different returned types for the same
value anyway.

>
>> +    /// Consumes `self` and returns a `(location, value)` tuple describ=
ing a valid I/O write
>> +    /// operation.
>> +    fn into_io_val(self) -> (L, T);
>> +}
>> +
>> +/// `(location, value)` tuples can be used as [`IntoIoVal`]s.
>> +impl<T, L: IoLoc<T>> IntoIoVal<T, L> for (L, T) {
>
> Missing inline annotations.

Fixed, thanks! (and elsewhere in this series as well)

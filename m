Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020091.outbound.protection.outlook.com [52.101.195.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029172D780A;
	Fri, 27 Feb 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203108; cv=fail; b=beYznjq4tpzguSwwJ7uKRmM6/iCs4XNb3d+K/KyvvnbBu8T0mQonFtmMFwKDAmaQFoWYjZlOic78/LyQGY6KblU79kNFqHs6MyGp3Ap4Fo7CCjbNH9Voc6MD5LxliGzT1jt7a9F36osC2W/ujX//FjJaXQ17vbV5ysZC62uLViM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203108; c=relaxed/simple;
	bh=PX7PDQYZuW0NZSvmhxQ1n3M1uPAPRld5yfpU+X7RPGc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DAcTjxX7uOCi/wqiEbHxsIcoXoMy9xbO+P5sCeMfHBIMKlzErjcOZsXkDUS2eKZgkQLHL1Zs4Vz/44t9pLZaIXtkKGFWUlJStpOqOTMmyN5joOoMw93iW3lXBFeCBGEc1H6K5vcn5YINEC4M2PTBIgt906RDv6ZCRgF7pjgOTTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JxxUMePX; arc=fail smtp.client-ip=52.101.195.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JxxUMePX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1pBv6rNbXQZslgpQueFThSp28CP+8JU9ukNy0XtsgzIHRSvSWsfP8PyqPFRu8w1bvlRNo/wLI+OOY5dp5kHhmdt1nOhtZ9mXSNTr62IxArx5sevd/EVN5m8Tr39imcBBHbiBtTJeJv2oBJniJh5oy5SzePV+yXS8wPC39Dx1V/jzY0aExypUy7PRkVdL2tC0dCftNap34U4yHWJnQCFzTe7wOJqt4Wy0MZGwoZ+RaL9jC37IF6hpXOzTuSNW5shVVhNBydkdjn0iBe5iAOQW5xespoOhVjb0HVHsW/ySnbkkF8KLrpso9Ik1oOe4+mI4/rpKOSGRvr0v+NgfnuYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPNf/rpzfKZeUDIG2pBwd25N6iWXGgD1ojuysh9M6YU=;
 b=Yvxiqjtz34BvW4VNm8w61mxjD0Z1pyY/itbuFVanwwcgzs77N1usVLB2+WcaiL+ycoCEbND5N1VhNPYWa4wmR3S3mOu2KdMc4yXC6kBKrumNpm2nt5VC2VXcWrbLJ3yhl3jlpY2rkEz3o6mc0tG92xUoTWIAiRWztrgvWPEe9dfEkxn8HGdi5+fJ9adqreo0Ohv7F7C+6afX8YJRzx/ZNYzzCIXWqXcikOpsZjQMHccUzivlhaI33wljIQLPH7iAoH2bpAd5+jwFeE5Dt2y1zEShYTTkUFk4kPi32Dmt3N1lPU3xBI8xQkxD8czDaFS6ak/4OdRYbRknk5mHmgu+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPNf/rpzfKZeUDIG2pBwd25N6iWXGgD1ojuysh9M6YU=;
 b=JxxUMePXI9mcWjai709Wioc/bn3lKZdUbfDS/jJR2me4dhymndXw453h9gCdUT/QQCZNMcuuZyoW+AO84/0B+0V3et48P0End+GWOGuAWSW7QBJvRP0Sf4Oh7AhBfhIZF4NhmGyLBUIbBlluINcAvLo58JKga2znHjCqdyUXBaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2696.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Fri, 27 Feb
 2026 14:38:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:38:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:38:18 +0000
Message-Id: <DGPTKG9OT59O.1N5K1CSI1KJMV@garyguo.net>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
 <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>
 <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>
 <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>
In-Reply-To: <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2696:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f0fd19-d26d-4678-cc24-08de760ddb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	ZqbAb2PbDXeLEBRtywpfWYJU78qiKlzRIay+q5OYmQB9wktv4TroTBEhtpJQDR8AETjFskryH8gGJzDGF1ldnC7bAMhl6cP95q3VgtJu5s4b2HHeGeHSI0kamOBq2he0ImPp9e8HYfyljNzAdfNwgpYGhzz1qHcnybt3Itm1fwF6Rx05imepo5B1iX2REKxenOF2KmUQNoovrR8zMZ2Wu8PbaYSvoq+y3XM8F8mbQv6Ruhwq+UUf8/GBZWsSN3XDNxX7kj93Fp8JhJeNJTTYAToOPflVnV3MuRRtGu9UjS0yJD1qhLiwsD7NRHqBF2zT24rRTkMdhveg8y2U5/bK6zFdFJBl5FHekJtVf1RMW0/N6R8FL0twlNJYI70UdPb1w0kuA5tahzGovDnJxUZrE697WgSZpk92a8v3MqCLs0k4O0D+X6eodKm+1oJjgwUrXxsCIGYpa0+Y8+VrH817dkFerjcaGVzacyjPMRpw797ye65hgDcHzL8tNp9njbWrXTFRy3YksYtkDtmL08y6MXf5U29v5uyZOrdNg8eLH6zdoZiYMsUxUvfMVXLqaHwfS5MBXlSQydsCfhMnPCJEIStdOHMZ4PbaCXT495vBVYg29c+ojR6gNgqlxeM4t2+rObmtT9Idx1eA/lJkvsPYdK6z6Plp1Um1VM8vun1ztLO70lqclmJyUC0+fTzWy7IO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW03bHl2M2hkMytOeWRqSHZZUllEaUlMdTdxRmhDL2p4Mmg1VGtZK29kUFhy?=
 =?utf-8?B?a2ZHRDhGWldTMEg3TnVGSXZjcjNreWRzUUJmaDNrbFFKbkpiR2RPdGd4R2R1?=
 =?utf-8?B?emQwaGFhV3hTTStLOW5LNkZYQjNoekdPcHBjN2pkL2RRRldNRUl0QjFZYW1M?=
 =?utf-8?B?NXVWYnJvay9PblN4cGpGOTlFWno0eXNBOG9EWk1LN3BmSWpMYmhGbGUyN2JM?=
 =?utf-8?B?d0JoTStrM25iQ01idE8yMGFsSW9yUDRwYWZMK3BGd29XZ28ycENaR3NkOFV4?=
 =?utf-8?B?WHNBWjltQTQxMGsrL0c5ZjNtcTI2b1pKYVIrcWQyamtXakYycWh3WU5qZDgz?=
 =?utf-8?B?cVU2RGdPTGZkSzYzM2JjWkpjb0svLzdscHZXamNkbGlGM1Q2TkJxVkJ6d1Zl?=
 =?utf-8?B?alVCREg4N0lqR21RSmc0eXRMNE5QeERnbWFIVXJMTHByc0daZ3ZHZEJ3dkdM?=
 =?utf-8?B?Z0RpY1VQRXRKNFRCd1Z4cUJXYkRld1ZvbGR0QUZBZVNUZmd6eCtDczgyWTNN?=
 =?utf-8?B?S2ZQZkJ2OEtzR0x0UzVvb3E2bElVd0d2MUltNUxENUNTSkNyT016SzNFQUVp?=
 =?utf-8?B?N0kzeURiZ2l5MXR0QkdJdTZpR1d3dkNzbVFXQnVxN3Y5STRnc0E4UDJ0R09a?=
 =?utf-8?B?S1VZNjRCeldvbEVzZ2hZK2FuaEpyVmwzNHJ4ek96MVR3TDl5L3BySTl1MkZ4?=
 =?utf-8?B?QkRIWWRONDc1SDlyQ2VoenVRMTI3NTdwT3dSWDJvaXpCcTh0ZU94cjJpdCtl?=
 =?utf-8?B?YXZCT2NMZjlOYXBKSXFoMlluY25PMTdvQjNoWnd4d1J4NGplRWU3Rit3YVRK?=
 =?utf-8?B?ZFk3RFU3a0xVbldMUEQxTC84UHNLT2x0K1AydVFxYlVRdGZPMHA5S0s2NW5r?=
 =?utf-8?B?Y01hNHFESDRBQ3dERXRBbWVpc3JtT3I2ck5PYmMvYUpBenZtcW0wR2RONk56?=
 =?utf-8?B?cEc3V0taa1UxNkxHa3RoYWsxVEFvMnk1VmhFeU9nbjFnYkVRNTFoQkVlMmJY?=
 =?utf-8?B?ampSN1FSV1JyN01qRHljV2cyWFJyQ1ZIZTFqZTlobEFLOEdIcGVTNEZVYkR1?=
 =?utf-8?B?UUR1RWhCdTJFVGtNTWEwbGI2U1VHSWRJUHJFd3NDenkwc2VVM3dUeHFsYkFn?=
 =?utf-8?B?UHB2OEtTSW93ZVRYbGlHSmpYNjhVTVFNU2tqNm9lTURFVHc0Q2JLOXFaYWNS?=
 =?utf-8?B?RjBRcXRtQnROc3JlSUtqZC9LQ3pSYWVWOExwM2lHd0V0b3hlenhQM0lycEdN?=
 =?utf-8?B?WUhPNk5WYk9PSzZ3bUNFYndSYm1yNWRNYUdKbTE2WGtjS3RJbHFrWUxZaVFz?=
 =?utf-8?B?WlI0R2puVDlLeVk1ZnlpR2JIVXlyL0ovWE5uWjdMWDA4NDlzaEc3VWgwTjVK?=
 =?utf-8?B?bVBWcDh6YmREaDMrQjRUWFdpSldaSGo1UCtnYUZHQkRRWkoxWVNaRU90Y2VW?=
 =?utf-8?B?aTAxWEFHenJHUEU5QkFvWjFaWGFoUVhCZzVMLzlXQmlJSUZUUFNEc0NrNC8v?=
 =?utf-8?B?QjVSQ3Y1TDNjNkVoSHlmVnJRb3FMbUE2TWpqcEJoZ2JHZ0RuaGxSWHZNbVI5?=
 =?utf-8?B?ZFNvNCtNZkZMeWMyVW1aNTNNL0pxdVZmalI0M29veE9la2VzWnAvMXhoVG5k?=
 =?utf-8?B?cFhueHhlUDBlZ1VldHV1MzVqdXl5UXZqMytNTFRTN1B1dmxOWm5Sa2tyaUdB?=
 =?utf-8?B?Nm1HbkZqQWg1OGk5Mm1WbXRwVkxLSGhDZDJlUlh0ZHdpTlpBeTUwek9ZbzMx?=
 =?utf-8?B?MjZESXZTRGJ3U0ZaZUtZRDRHaWNMY21HTkJIWTJpdzBzLys2dXEyUjBCek5y?=
 =?utf-8?B?R3RTbEhvRFJQMlVkMHdYbHFVb2VmbVRhbnZRMEN4cVZNSlY2dFg2Mzhvb2Qv?=
 =?utf-8?B?YlMxTnhjNUxLTEZvM1JVcTQ3c2NHZnRnUmpvRWJ6RTByY2dWdlFFcks1YnR1?=
 =?utf-8?B?dVpsZWtZZmlNdS9ORTNIanc4c0lKcFhUb2dzRzJkeG1XNnJvZ0NFV3NkNFE4?=
 =?utf-8?B?cDM1NTg4dFJSNE1EeFkzTDFUaHVKdzlEaENzNThoRkNhNEt6SExKaWhHTnll?=
 =?utf-8?B?NEVCV1VaMHhGYjZHalZ3eXBVQ0ZSUUxrY1JpRi9MVzhuaGZqK3RNTlVENDBP?=
 =?utf-8?B?dFd4UnBnZmVwMjQ0SmNja1JXZjNGTlRQMCs4Vm81U2JWUDhNT3FpQ1dGWjRw?=
 =?utf-8?B?S1JaaGFYcVV1aXU3WGNwS2VZL01XYXYrVWxTUUt3MENMeWFySGNxRzczNmVx?=
 =?utf-8?B?TmVLdEk4dDZzam5heXhlM0hEeGR5OUdCdFk3UUxTdFkvR3lRdUVsd24wQ0c1?=
 =?utf-8?Q?5+MemHZamZMX88+WNs?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f0fd19-d26d-4678-cc24-08de760ddb88
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:38:22.4001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLTgLOgv/Ns78KKqsE+seY/iTBPokXK4tyvmq0pjJwnzwOFDM3Ndgp2CxOrin9q4Z6/g51NpGTJQp+hayoezgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2696

On Sat Feb 14, 2026 at 2:56 PM GMT, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 3:40 PM CET, Benno Lossin wrote:
>> On Sat Feb 14, 2026 at 3:17 PM CET, Danilo Krummrich wrote:
>>> On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
>>>> @@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box=
<T, A>>, AllocError>
>>>>      /// assert_eq!(s[3].d.lock().a, 20);
>>>>      /// # Ok::<(), Error>(())
>>>>      /// ```
>>>> -    pub fn pin_slice<Func, Item, E>(
>>>> +    pub fn pin_slice<Func, Item, E, E2>(
>>>>          mut init: Func,
>>>>          len: usize,
>>>>          flags: Flags,
>>>>      ) -> Result<Pin<Box<[T], A>>, E>
>>>>      where
>>>>          Func: FnMut(usize) -> Item,
>>>> -        Item: PinInit<T, E>,
>>>> -        E: From<AllocError>,
>>>
>>> I think we should keep this bound and just add:
>>
>> The `Into` trait bounds are the idiomatic ones for functions consuming
>> things. See https://doc.rust-lang.org/std/convert/trait.Into.html:
>>
>>     Prefer using Into over From when specifying trait bounds on a
>>     generic function to ensure that types that only implement Into can
>>     be used as well.
>
> Yeah, but isn't this only because of [1], which does not apply to the ker=
nel
> because our minimum compiler version is 1.78 anyways?
>
> I.e. are there any cases where we can't implement From in the kernel and =
have to
> fall back to Into?
>
> [1] https://doc.rust-lang.org/std/convert/trait.Into.html#implementing-in=
to-for-conversions-to-external-types-in-old-versions-of-rust

There's one benefit in using `From` in trait bound -- you can call both `Fr=
om::from`
and `Into::into` inside the function. If you only have `Into` bound, then
`From::from` is not callable. A very minor benefit, though.

Another interesting observation is that `?` operator (i.e. impl of the unst=
able
`FromResidual` trait on `Result`) uses `From` instead of `Into`. I cannot f=
ind a
reason why this is done this way, though.

Best,
Gary

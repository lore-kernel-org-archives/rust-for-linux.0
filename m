Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020117.outbound.protection.outlook.com [52.101.195.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997D425CC5;
	Sat, 28 Feb 2026 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772280239; cv=fail; b=Eg1SLGR/C99O+SOCgVMcOfsHsj+XpGVMpqHfair2CBw+UX0uHib7LQP/TLUZMMOVfru+IVbTEHoBWteqR/ODhsCWRzQSMW5CNKCJhvoqie/aCQZBV1tyXhCKygC4buSYgDtbCrscjNuScqOScjS47SgXHh0ky5h0z4NhuYP1R3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772280239; c=relaxed/simple;
	bh=VblW3Ml4NbD5U85407nr4KjIJiUwi9YhgahyBhzqaR0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GLAZBakm+BFXo0awAkCVftZMGWT6BnmJcpRrNFlytYgOZqPI9o40IhZAwyCd/hE5LAdndLLKGqriexr+yDuvp2jsPohy9PkI+pxtT0MZCcJ2F+Ey+jt9alyZ/F0f4a+AY2fqQJV13tXSpKMM6JWjdrHHlFRzQ1Lv6op0HKfUsjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fJcMzlO9; arc=fail smtp.client-ip=52.101.195.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fJcMzlO9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhT0sCjK29uR9bwQF80PvlDu8ZdZvx6XDx24tgnXdXIKWMUEkjZWhwJj7nEMRr28TMHqE6rPvHz2R+xx+VXbX4FVUfgqvbOO9Luw46tZF36dvkZa7hQI3CplI+im/CqzRePIlRU8boWKVPys0yxYQ2+3fCBjze97toBEe9XxQ9Si03GhkSAzozsXKzZa/qYFG4CDHB0eLeWr+dZDj6y1Q0DzyE90J8I17Yr14nQ6NekxH42wEE8ijsKH2DNNg1hxo/aaXCLD3sWtSVMLXdurKWNzbWvW9XoSD8xg6gGZrx2P2DKsqLmcwKy2y1ve+GClV+MKOohlIGJSexD14k8Bcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjIR7NkojXl+lpbzz+T1lQNx1swGz39UW/hZxAFZQ0w=;
 b=hA8BcxZur3g+YWlF/e75DHDXPdhhtpeg/60/lGtD9LTvIEJrkw1yCnOYBSuazFy1sLjCWgM+fccgptMffh+nOdUscXslW/YGJfMPiqhWVGi+LdThK7rx7aLqgO0488UdvEvidpl1JaDNrAytMnFg77qViKpwA8rN27jS6GLHJDOZdb061grrJkY+C8GJglibR9lryXPR7a1OhS2FiAnuHOqwdo3JR1VdutYeYIvBjbiAam8puuZ4rUaPpdbr9wIoE2UfJ/LA9tfP8vnVSRvmIkyTxM7VYnoF87NJSOMgXmHLVKmQqaxlmJ4qJncLH9T/W+ipIkQospTsu+kfKVvuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjIR7NkojXl+lpbzz+T1lQNx1swGz39UW/hZxAFZQ0w=;
 b=fJcMzlO9e4O2WLRie3i6fAAbPT9HmXDpgxW21JEJJxjtPuDuU3eVBWRQf4JGGKcbp1jSCGx8aB7EBjwFVTwmUREXEOHjOnyM59RHsUW8+QdviXhuuxLfH1DQKKBkohrFJ+7Yu29V8Z9fL1AmhyZtpo6W8PgRyaPml77QkNj2Boo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6444.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 12:03:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 12:03:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 12:03:54 +0000
Message-Id: <DGQKWRTZ6SK8.2RDGJN91OW0TM@garyguo.net>
Cc: "Janne Grunau" <j@jannau.net>, <asahi@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260228113713.1402110-1-lossin@kernel.org>
In-Reply-To: <20260228113713.1402110-1-lossin@kernel.org>
X-ClientProxiedBy: LO4P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcf7313-69cf-4d91-5e7d-08de76c1720e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	sUYVUUwhIRFc4Za4BAIPsMyqeWbK2h4GfeU76SHZMjhFRTE8/uVmAzIz+CJnR9HDFks//5VH8ArxoGd6tAABfs00N2gPBMt8DPckNsGrStW+b+03JmHkN+AQw97Cn6kKV/nuQ+vacRp5hox9fVz9hR8rtTrzHSK99PpqCHYXgvnRHT5LJLtaIPcKOY6ZirSOc1B3J9IkMPV4PKv/VVZ4AICzJAFgLDmfnWL73y85DGk58q0XVR2XixsZM4b45IgR64SBqg0ixvIHMt5ikAwKTwW8DHbwQ0ZGbH+3y+wiRzV50oD6eMHrefckqDviSf/nnHuvXPTpQpCnh21P54AZ+5hkKk1ZeuBS0VQJjIJKLdX0ihrJw4h611SFkFDVsUkPLdFbvXak0dwkhe+xU7qryfyKQjs0CfCcSaXLZjUOS9LKU3AcCYMao6nG6CVcdG9gH1cH+VB96j10WZkJCQGM4bYLFO9sBhgAvGQnwA1YpXSaPe8QjJFUoCg34vnRTtdv0y47xO1zO+s30ANYYhBFwKYL4fVPoFHbhd6ML8oiBbKTNEfYFAvwSeZ7vStOE+L/MgAP5WSAjye0cmRVBm/lOzQoAgc2b0aMLIZqtuUGfisBbgBHKXWUjvKU7XWo7EJKhlHmwST5/z4ni5OebQk7gHTMeJJ2gNumpyyKu4M96C5RXTxsZU9ny0bQ+LFTK8nX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDFNZEUrS1d2L0hnWXhRZXBsWE53RHV6ZUxrbWRTQXBQcEp5RjA1K0VHOXVG?=
 =?utf-8?B?OGhqaVV1bkowV1hSK00ybjdjblBtaHNZUlk4Q1dqaytUdW5PZEt2U0Y4OXp2?=
 =?utf-8?B?Rnp5TjFLc3k1VkRZY0JmUUdFS3g3OTdQbFdQVnAxTVN4SnBTRDYybnR2YmZv?=
 =?utf-8?B?YzJRVzBNSE9aMUV2MUF1aERzSE5oNHhVWGliT0xZMG9yNzZMbjFnV2FZa1Zn?=
 =?utf-8?B?N2hDR1BXQ3ZSZUp2cElXN2VvRktVVjhseHQ5ZGtzNHVVYWlNeTZSMStnWURM?=
 =?utf-8?B?SWQwSnp2OElhVGNGVmNNNW5ISmRERXYxNHRaYTVFd0diMDVqcWZvbEZuYTNw?=
 =?utf-8?B?cnlvbnlqMm9vSG02NTdwaVVQRkgxeUxkWURmSGl5SFhlMGZoZU9rOWJUYmtp?=
 =?utf-8?B?M2Z1UFU3UFlXamIvTkxkdXpVSFZmU3BXQzdybEpCMWF4aXV0U243TWQvOW1t?=
 =?utf-8?B?S0ZJbUI2bmxuL2NVWDZoTjE1b3A5YUh2Q21UNjBnaTZxUU5LUFp4dVVtSGV1?=
 =?utf-8?B?Q0p0bzM1NXd6WktNeTgvWklQNkNHMXRuc1JTWlZtcTRPeTRXaFlxOFZ6VzRU?=
 =?utf-8?B?U0NDc0taZHgzZ2Y1QXNUTWw3VjVUNzRRSEpsd2ppNFBXRkxnbFc3MUdCV0d5?=
 =?utf-8?B?U3dmbGJJMmovdGxRdFAxUFZuS1JvcHZnWnFKRGRWclgxZnJIaHJncGJoK1U3?=
 =?utf-8?B?T1dLM0FaZFA5RHFYSFJmOGs4Vll5K1FIbW9PYUR4RmJPRThTZkIyN25vaXBS?=
 =?utf-8?B?YnZ3M2JIRmhyS1c2T2ZteFpPQmM3Rm5pU3U1QXNuNFhEZnVDd1pRRjBrYlo1?=
 =?utf-8?B?aDhxVyt0eTM0WWJoMmd1TU1oOUZvUUw0T28wTEpzRkRuWmRRWUFKY3MvUXRX?=
 =?utf-8?B?eVY1ejNhNWE5cEdmemltZkZnSGhQeEwwZXluR2I5aURuVFdxcjE1WFhJdmZu?=
 =?utf-8?B?VVpNZGNSS3crc0M2SFFzV1NTUVVXckdOK1drcndJQjdVanRZdDZSck0zRDZS?=
 =?utf-8?B?MFdYeEZscDhubzBFM1Y5SjVqSUFnTk1FUHlGSnJnOGd4aWVmS3Fiamh1WFEz?=
 =?utf-8?B?YzFrQTFzYWZlVXRkenhvUm5Ib2NZT2YrTXZHUXprZlRXVHJobTQ4RFV4MVVz?=
 =?utf-8?B?L3drYzc4NVkvblMzU3NDNjlzU2RBczZPeEJBRzR2MllQYTY0K2lzR2UwOWF4?=
 =?utf-8?B?V25nMzl6ZGhwSDhuaG9zcFN0c2FlcVo1ZXJCSGJGZXVMcU1zTE44c3l0TSt2?=
 =?utf-8?B?UlRzRzl5MlJyUU5xd0tkVmpzeC9VMmNOcGRuSVVUcHBHWnpMQnJBR0Jnbjh4?=
 =?utf-8?B?b3B0U1dGaTJXd0c2QzdJY0FFVGhFV0JIYXFkUkx3VVg2Vnl6VVhZOWk2cFRC?=
 =?utf-8?B?TlFQN3huWklSdlM2b2x5UENjNnVFNkVOdGZVNTV0d3ZWaGo5WmJERGdicFY5?=
 =?utf-8?B?Zmt1a1RHWmhscVE5b2JwL0NYd1dlclVWUngzVW9KRmVuT1hhU1BzZE1DWXM1?=
 =?utf-8?B?ZEJjMWZ5emVjajBkcDZOQ3FVdDFadmdKajFRd0pzcUcyY0xJa1M2dE14bWNM?=
 =?utf-8?B?OUs3UzF4aVZtbENnL0ZTYlBLTGJqRUNNcjJlNkFscDMvcGFIamdBOWhCakZF?=
 =?utf-8?B?ajdNOHhrdTVYVnNHSjdoaEVMbWE4aGZpbm10VHhtY0dNaGJvYkFSb2V6cmFw?=
 =?utf-8?B?YTA2T2l0cWV1dW1PSytzSTI4aGxMNVFXUHlzVEdaaGIzbUNNclRkN29mT1Bj?=
 =?utf-8?B?aGFsTU83YUpSMkt4eDBWVlNUQnVJaHZQd0JrY2JLZ3VnZjludnBjSVRURzRk?=
 =?utf-8?B?QlZVZER2TEs1KzNEMDVXSnZjQS82Ty90RHlMQnZJdmlwRGNBUCtBMU9iTGxs?=
 =?utf-8?B?Qzl2VTkyUVZSVTV5TjM5WUJwbDJVMExzL3lhMkhZSCtnc2RDdjhaUUprVGNl?=
 =?utf-8?B?ektGY1pDRFNHU3ErRU9OQkQ5azBya0xHRkdKTTRHUkpOMDhKM3FxWjRFWEhn?=
 =?utf-8?B?Q3JheWF1Q2w2aGtXYTFFV0FTYzdSVXg5MGtEWmtDaGJKandtV1BFdXEvTlda?=
 =?utf-8?B?dExwSjJ3U2F2cHFldGpMV0ZIdU1HcE1ZV3d2M3RubC8vQjk1ZE1BOGY0azdP?=
 =?utf-8?B?ZWNSZnkrNzlKZ2dsSjZKTVJPOXpWMW54R0RGaGlsWDlIcTdBSENQdUxWRXVq?=
 =?utf-8?B?UDVLOWNIU2ZwNnQ1eFltcnMxK2tiSExIU1htbnlEUlZUcTA0bEJiREtzbE45?=
 =?utf-8?B?Z1FqMHE2TjlmdXJoSElObDljaVJ2MDlFNDMvVTBIdU9VdXNXSlM3NmhuUU5u?=
 =?utf-8?B?Tnl5VEw3NFBkWUJCNE8ySnJ3Yk1OeTBNWmxwd212VURJN1ZJQWt3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcf7313-69cf-4d91-5e7d-08de76c1720e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 12:03:54.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xovhgu8b4OwkzPD+HrJAWlD/UeWyj4RMvbtVU7jF51TrsXy6k7KOcEU2ROSe9P1AXgy+YSmaDe/oLz0Dor7kFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6444

On Sat Feb 28, 2026 at 11:37 AM GMT, Benno Lossin wrote:
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support packed struct, since they use operations that

This is better read as "unaligned field", rather than "packed struct". The
packed struct can be initialized as a whole by moving it into place.

After all, a value of a packed struct is itself a valid initializer and is
sound.

If you have

#[derive(Zeroable)]
struct Foo {
   x: u8,
   y: u16,
   z: u8,
}

it is also valid to have `pin_init!(Foo { x: 1, ..Zeroable::zeroed() })`

> require aligned pointers. This means that any code using packed structs
> and pin-init is unsound.
>=20
> Thus remove the `#[disable_initialized_field_access]` attribute from
> `init!`, which is the only safe way to create an initializer of a packed
> struct.
>=20
> In the future, we can add support for packed structs by changing the
> trait infrastructure to include `UnalignedInit` or hopefully another
> mechanism.

I guess the comment can be reworded a bit, to hint that this won't be added
unless there's a compelling need, e.g.

    If support for in-place initializing packed structs is required in the
    future, we can ...

Personally I think this won't be neeeded, as there are many ways around
supporting unaligned fields, e.g. by creating and moving the entire packed
structs. Another way is to use `Unaligned<T>` type for fields that needs
pin-init, similar to what zerocopy have.

Best,
Gary

>=20
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-ini=
t/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch fo=
r referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> This commit does not need backporting, as ceca298c53f9 is not yet in any
> stable tree.
>=20
> However, the unsoundness still affects several stable trees, because it
> was unknowingly fixed in commit 42415d163e5d ("rust: pin-init: add
> references to previously initialized fields"). Before then, packed
> structs compiled without any issues with pin-init and thus all prior
> kernel versions with pin-init that do not contain that commit are
> affected.
>=20
> We introduced pin-init in 90e53c5e70a6 ("rust: add pin-init API core"),
> which was included in 6.4. The affected stable trees that are still
> maintained are: 6.17, 6.16, 6.12, and 6.6. Note that 6.18 and 6.19
> already contain 42415d163e5d, so they are unaffected.
>=20
> I will prepare a separate patch series to backport 42415d163e5d to each
> of the affected trees, including the second patch of this series that
> documents the fact that field accessors are load-bearing for soundness.
>=20
> @asahi folks, let me know if I should prioritize a solution for packed
> structs. Otherwise I'd like not support it at the moment, as that
> requires some deeper changes to the internals of pin-init. I'm tracking
> the status of packed structs in:
>=20
>     https://github.com/Rust-for-Linux/pin-init/issues/112
> ---
>  rust/pin-init/internal/src/init.rs | 39 ++++++------------------------
>  1 file changed, 8 insertions(+), 31 deletions(-)


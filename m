Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020134.outbound.protection.outlook.com [52.101.195.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFF353EF7;
	Wed,  4 Mar 2026 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662794; cv=fail; b=Ychvcgq0kRg/6cY0CK4pQVb1Ry/upFOoPP81xlX54Qoc1oYjoTwq6K2ebRqiFVxdl+OnXRVlP1SqKaF/wEUosR9UMr1ThWpxygby41XJmtf6eKj75r/bPC73QYMTH8U3K58Geapmo1lGev8u651y+1k1TPZ+f+vJ09J7i7YaJEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662794; c=relaxed/simple;
	bh=88XjUjZA+7I89eivWwrorT/+Y1NcA/p0JQag7RBnL3M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=M5aiieS/osQDFO7HK+lNWT1QivguztBCrOfiyafSbuwoo5cYGbAWg95v91inDKSeymBoRJDKN8uS4cc39HP0Wvb19SVxgJ0/bRrHAPCGwRo+j/La9+QJfNHmovlewhRVBNA9e+EEjIfTR+DaJ08HpGIOFmHQSPKeo4lbxjGy9Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hwvcoopA; arc=fail smtp.client-ip=52.101.195.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hwvcoopA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZMeerA/HpyTwr9WPDYpaldnoVaSS2WlgZbNh3Yf7rgBqawN+5BmwzRvxHfAI52qwlAQRObHFqEwvZSeLEHdDBm3u6N/ztqU6uBeWqx/xfYOWDfvxW9BkMggFEu0+bPU3XKB3GR0Dtw64xViMW86N9n9W8req9nSvUPg+UDT4NbFl+3C4MTtRGiD7tHwrh6bx7K9austO82tDHYaBt5E53y4CzBsAeNhDXIVMYVmCX/V2msWzFOAVuvmY1fTHoiBrRnFN4PoiMRBasITVGKNkwltBh3LHeJleN1ujnq2UI3i4DyxlnZ4tX7qxZG/EYus9mS8tgyIYiqxfzhynEKcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fZ32ucULwmZw6ioDWqPfCQgupReJ5lJju726uKNuHM=;
 b=JqbgTXh0K3UduhKcuVGmMOhglahOpWuUT3sJFXLyrALVhXsuUJ/PzcBiiXAFgY2M3a3akLFMrx7MNETTM+HlEuqTb15QLUva768zpT+5C83gnPqXPcpuxfc2/Fqgdyk/raX/a3q6kwDzmdOhSjrSFlth4zINmZazKs3BPgwtuzqf/eij4yqhOWBsXduO+jTDeL2bFame2cZJpN6NV2HhXzoc+JEVtMYJ3E1yNAj9GBTvEW8DslGz1d9zalaKlXpOWxEz02RxjLkjXHqf0FWkhtJosjFObN0HygNXIEHwu5lzDFvcjc8LOC6uWkcUlcKiPttoGxIkGeNotgmhypdfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fZ32ucULwmZw6ioDWqPfCQgupReJ5lJju726uKNuHM=;
 b=hwvcoopAMUwnIr54P60ghTAzIg9P1OxcJXtrPWQkymlOEk6TykFZcjcredqxHmPp86d8bLyBhaj3UclmLYYpcpreLPBD40BP6FyE7s2ofhgoxbk533tL6DeJp8/8Qa0qNNxRfyAti1A8Eku+OOH1BpeE4ml50JHV4a7jG/iIR7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3528.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 22:19:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Wed, 4 Mar 2026
 22:19:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 22:19:49 +0000
Message-Id: <DGUCIJBOF218.1Y1GXJOZRZ7J0@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-5-aad44f760f33@nvidia.com>
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7c8ad3-1c3b-4e85-b08c-08de7a3c26da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	smk9e3oia7Gk3XjnYsrOSBsE0OrwF807sSjh5w7/Qx/tphJwzeQisJTW8hU5Sb8+wHYgXXvJYBqwlnB36VgEYU0sQnh9dMF3vmoj5vx64Hg67u3dhxTTYursFyzvSCggh2LxrYZe3ERj/3aPttboS4nYg3PwpOxTqQxRDR8+3tPT1Ej0Zno59nbdXARTPKpt/G0taGnXqLs/H+QxC83RMf0TY1RWvM63Zs4IDqU/wV4wzXLgEw3lJbUyOWICNOCFqQqCwgO1EReIF1+Z2dcy2I7k0a6zkLR3xfkA6Naof67i1k5yY50KGIREKk2CEezecSM9LK9zEwUx87s/E4d9VPZ5n/WuOah7wwNZlU+lszeCnDCf+UcH3qoCGNrw/1Oe+ZauXACpAYq0GJsFNP+SAd7pXG/W5SlP1N8+21OEpq2BEfr8wVnvKTPiFmwKKahDqS62xtLLNV1zyWpSpF324+8PgoKolhh81zvOFmlQMV/y15bgw3Ag9KoPWThsxNdTRNNl3LJ+dmGxxqmZrdzUvKiJRIZeIUyvIso5gSPrkaGLJYhuL4EFVlJ2SFpqRADpm0UXUkAh0z80dB463oVtTJmmFzBkFIzbvAMgdR6fExQuZVay9Fy9jSg5Dz7BerNcms+RIOTDg4syqZ+/CCM6diCQXI3f1cCZTsk/iCHWvNM6QM15fGUzlb40vta1ToUKK+xjFhLUcsqFAZGlZLti/VoWte7Uy8ByuJhRnCgZ8aCAHX28mR8NWz9msi3RCpn16pgM4BuIAATqOlgw3AKZ8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDY5S1U3ZGJWcUVWaVRIbXBRK3FhemtiQ0FwZVFvK2QzL3YzemIzUnB3S2gz?=
 =?utf-8?B?SjlhcVYzVm10S0JPWkl2b2V3eTROZ05OMEZtSTRJNVBmNjQ1ZXR1WU03dkIx?=
 =?utf-8?B?NTNOT2RqVjRRUWhvTjJmcm9UZ0E2VmxpL25na2g3ZkFFVGQrUVBBdEk0aU9K?=
 =?utf-8?B?NjBuY3U5L1hpSFVhU1hQYnVKWjFqZzd1R3RmK2hlSU5rZVpHaXExMkZUcVZN?=
 =?utf-8?B?dXJWYzY3RFpEa0NwU2Q4TEpWYVlvUmtFWWpPa204VW5lY3NpVUFFUGlFMVhE?=
 =?utf-8?B?OGRIQWhFRGJ0dVhqckNpUEZEYkh0QnM2Z1ZnMHVncGpwS21kWDBoaEZDSEFF?=
 =?utf-8?B?dmJrRFJCWGliT0hXaE5uNWtrYWVQUnczKzNqTEFkVEdCQU5ldEdrYVd6V3dX?=
 =?utf-8?B?Yi9UaEk1cGF0UHVldEhsY29nYlZPYUxEeGxNVGlrNWduQ1pxdFFsRXArM0JW?=
 =?utf-8?B?NXE0M2dpVzJiWVp0Z251NTRHUXhORDVzQk9rbVlndVFCRVhBOHNFWkhqQS9R?=
 =?utf-8?B?bFAwaU9sT3laUkZ6Wlh1U1g0MDVZWWxpZzR1V1FYTk5na08zZjZRdlBEVVoy?=
 =?utf-8?B?ZWNxZ3lZOWhCYjM2RVFScUZBR2NESUR2UHFMTkwvOFBYcDE1WmdmcmRpY1hS?=
 =?utf-8?B?U2RFZ1p3ZmJaZ1ZBVlNab2l1QW1tcHdiRkllVlZIT09DQXFoVlJWN1ZnOHpu?=
 =?utf-8?B?amNVWDNZSm5tOUhjQlVOY2lJV09QRGZ4TXJJQUNIeXM2d0NsTFlFcnd2bGVt?=
 =?utf-8?B?UnpQek83UVVUekd5c2xBZ0RzMmtOUENYbXNwUHJLbFZ5VHlXK3plY3IwQ0hT?=
 =?utf-8?B?Q2tWN2ZBY1RTK1JDQ1ZnbjJ5aEF1ajcwcWNlVUhBTzR4YWdGN0I2SzdMRCtP?=
 =?utf-8?B?a2wzclFPTitESVZmankyQzQzOEF3NTR6RlBNOERqeW1BTSs4ZjJHbEFlWS9Z?=
 =?utf-8?B?NHZTZXN0ZktaaTVEL0c2L05iNDNja21PUEVXN083cFBEbDUzR0lPbitmOTlj?=
 =?utf-8?B?bGdLK0Z3dFNtRVROTm1pd0RZd1Y2elVRcXExWS9SNHNsQ2ZTREJMS0FjZnln?=
 =?utf-8?B?R1pFVmorbWNDaXg2dW1kZnpweFNmZ2cyY09tYjZQSXpRZ0tsemVEMkhiMnkr?=
 =?utf-8?B?Vlc5eG95V0pEdEg1bmxwMzhQQmdHUUIvQ2RaT3pvL29iSE9TSy9QVUlsOThB?=
 =?utf-8?B?VlpjZVB5WUxuaHJTemE5Z2c1K0EvYjNjZUxWNHRPMHY4SERRWHN2VWtRaldk?=
 =?utf-8?B?MjloNTZFWWZnSVBvUVBsU1E4dHBQaGFkd2MyQ3pJbUNPejVIMWs4TjVxNTc3?=
 =?utf-8?B?RHNWNzlVNTNBek5qL0d4RWtuZGgzN0dTT01mR3RLL1R3NlpoVnduaGFUdndt?=
 =?utf-8?B?QWROODBNT2pyWkZjNDZhNVA0SlBGT2VFRkY4NEJreFhpaGlNRW13WllOOHhF?=
 =?utf-8?B?dnk2ZmlKai9RR2xJMFIrZ2twL1p6VVVtcW1tbG1oSjVLV2YvMDB3TEtaeVpM?=
 =?utf-8?B?SzZ5SWRvQ2Voc2FvdHRrNU9ZcXJMMnpxdjZOenRqZW1aZVJXbytMamZqNG5v?=
 =?utf-8?B?VWo1MGx4NkhzUXVEMUxzUWo3cWNkRlA4YTNrN0JpUmhnK3RMMGkxR3J2OHJv?=
 =?utf-8?B?NkRMOTNiczl2bXhINnRUTXY0ZmUxME9mcnZVVEt0K3A4QUdCUjZGVFd2VHdX?=
 =?utf-8?B?aHNlcFlyRWR2eUhSVVloTWlXYU9zbk50RHJuUkY1WUozS0tsNHpVSUJ0enFl?=
 =?utf-8?B?YVZScVB4dnk4UVl0SlhhdXB6YWQxa0dpeFhxZ0dnb24zMC9mREkyS1VpWGdI?=
 =?utf-8?B?eHV6cTRtQ0QxMGlqbU9ncVVQczhXZjh2YWxpb2NmcVdleUI5VVM2eGxGQ2NL?=
 =?utf-8?B?OURyN0tad0NVQmd1aUhDTkxVU0laNWM1ZUUvcWtMekYwdlFkT0txL01ScGcw?=
 =?utf-8?B?d2ZCOUhSeTN0M0oyVFR4Q1NPakRIdmJvYW55N0JqZ0R5YmRJY1l2S2hzczFM?=
 =?utf-8?B?T1lvQlgwbTBoTitOS00xUm1lV2NYSC8xUk84czBSekV1T1A3V2tGbk5pYUNY?=
 =?utf-8?B?anVtUi9jWGc0UXcyMEdRT0IwMWlJM3ZqazMyVmY3WGx4RG51QnM2akw5TTlz?=
 =?utf-8?B?TnNkNFJUQlBPM3hQMWNYRkorV3crWHlubjFOUmZVa1JWVnE2eWtxZlZnenND?=
 =?utf-8?B?S1NJc2xnZHRuenY3Qk1iNzlGTlYxNHhXT1ZUNlI2cXFEVXg4aDcyampRc3hz?=
 =?utf-8?B?SWNCUzFCbnR2QXJ3MnVJSG05cUVNam9SYlJZZmJEaHBnTFJRL3VsUFRvblQw?=
 =?utf-8?B?MWozWE9KMzd6ek1td0laUnMzcGNYMkNtc3JBYWtZK2JSc3hzQi9NZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7c8ad3-1c3b-4e85-b08c-08de7a3c26da
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 22:19:50.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdHRBQFh7WqK7Gnk+Xl6IdgbaRBNcg+K3BPnIehUkDOCzIEB8yl5ZGvSfMJlLpIvWJh6XqWu95ZAMR3786gnNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3528

On Tue Feb 24, 2026 at 2:21 PM GMT, Alexandre Courbot wrote:
> I/O accesses are defined by the following properties:
>
> - For reads, a start address, a width, and a type to interpret the read
>   value as,
> - For writes, the same as above, and a value to write.
>
> Introduce the `IoLoc` trait, which allows implementing types to specify
> the address a type expects to be accessed at, as well as the width of
> the access, and the user-facing type used to perform the access.
>
> This allows read operations to be made generic with the `read` method
> over an `IoLoc` argument.
>
> Write operations need a value to write on top of the `IoLoc`: fulfill
> that purpose with the `IoWrite` type, which is the combination of an
> `IoLoc` and a value of the type it expects. This allows write operations
> to be made generic with the `write` method over a single `IoWrite`
> argument.
>
> The main purpose of these new entities is to allow register types to be
> written using these generic `read` and `write` methods of `Io`.
>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs | 241 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 241 insertions(+)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index b150743ffa4f..fdd2549d8e13 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -173,6 +173,158 @@ pub trait IoCapable<T> {
>      unsafe fn io_write(&self, value: T, address: usize);
>  }
> =20
> +/// Describes a given I/O location: its offset, width, and return type.
> +///
> +/// This trait is the key abstraction allowing [`Io::read`], [`Io::write=
`], and [`Io::update`]
> +/// to work uniformly with both raw `usize` offsets (for primitive types=
 like `u32`) and typed
> +/// ones.
> +///
> +/// An `IoLoc<T>` carries three pieces of information:
> +///
> +/// - The offset to access (returned by [`IoLoc::offset`]),
> +/// - The width of the access (determined by [`IoLoc::IoType`]),
> +/// - The type `T` in which data is returned or provided.
> +///
> +/// `T` and `IoType` may differ: for instance, a typed register has `T` =
=3D the register type with
> +/// its bitfields, and `IoType` =3D its backing primitive (e.g. `u32`), =
with `Into` conversions
> +/// between them.
> +///
> +/// An `IoLoc` can be passed directly to [`Io::read`] or [`Io::try_read`=
] to obtain a value, or
> +/// turned into an [`IoWrite`] via [`IoLoc::set`] to be passed to [`Io::=
write`] or
> +/// [`Io::try_write`].
> +pub trait IoLoc<T>: Copy
> +where
> +    T: Into<Self::IoType>,
> +    Self::IoType: Into<T>,
> +{
> +    /// Size (`u8`, `u16`, etc) of the I/O performed on the returned [`o=
ffset`](IoLoc::offset).
> +    type IoType;

You should move the where bound on the trait type to here.

A where bound on the trait is something that needs to be proved when refere=
ncing
the trait, rather than something that can be assumed (which is the case for
bounds in assoc types), which is why you need the extra `Into` bounds on `I=
o`
functions.

If you use

    type IoType: Into<T> + From<T>;

then you can remove the `Into` bound from all `Io` methods.

(You would need to update the impl side though, with something like

 impl<T> IoLoc<T> for FixedRegisterLoc<T>
 where
-    T: FixedRegister + From<T::Storage> + Into<T::Storage>,
+    T: FixedRegister + From<T::Storage>,
+    T::Storage: From<T>,
 {
     type IoType =3D T::Storage;

Best,
Gary


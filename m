Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720E37F8AA
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786130073; cv=fail; b=YF/hCetqKGAU7S8wCA56FpWk6PtBbQwA2y0B/owWA+632FwTVWaIqbFO1MrIFe6TqeSUj9KJZmheaydmbq8gBwwsWdW2esNDPQsYvb4gnqSIECOK7i1sGWtjm2rtKFsxo/7WlIARRsMAw6nFpWi49Q9ShUo9VTmDYGfSY2t4BD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786130073; c=relaxed/simple;
	bh=pXmmiEIuBZw2LI0aTNnCP/KK9PhCKtMST8GDkh7j5TQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Bdr4I10TixZtQrBh16XijnjlMWDOQ2YDo5pMYByRcVUSJ2qKGLoAXrrlfnKVJdT6H04+ZBertGSFN1jN7FyS8Xnuyur0R8tfDhL7yl+fSWwMIu87Z+7REIzHgiu3Dl+3rrbW7yBnzHuIAqvBSpH8/0K8whbcAnwGJbwV+FVqKPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jFnU4kJB; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jFnU4kJB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4CJ5qRaWIWCtbL7XOsmO48xrTskWf+0vydP/RBOFl5ODYlwaf77DIJGd8W9AU7r0kRpTk2Hd/BXwELilOl1fPTwH/UX1OuxScnyS9QKsDpka2J4O8pH9wXCJAlG19JbFQxdcGhvGEjyUPYg51KLXBRpEl77F6kEglEOfdUJLPZ33CN0UIFbNPh7wCrf++SLzzMKOoKFq4ZtHSSPODDfY3XsqGeFiRZABv9QNfEYALGm2Pdu62pSU4DU1xpuF1X+L5R9Strfcp+C9piJtsiIWgDJBUyXcMJr3HZscZ3XD6iLyrTLO1ZXzv38fL2jyDhpkhiIR6i+owDhpDchtW0G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ7zH3m1tzA+zORMQL87C6owwMAbMm5KpHl2mM/1Nlw=;
 b=ULl6SGDq/dW+17yLEuMqzS+HYdGsUh4lcJ9R7FV7Bv7wlBhzi12e/UUHrYHQyAzWcdmweZTTZ+0RibM1+q8Sj50VVw1+qRBeA6SJ5SmNzNaBTfP052ACHAXPv/9zRAOdcJjoff+AqDtt4iJoMjK1cIJV9pZUgoUn1Y4cKfdkQaTG/qPWSyCQz6ZfYJN/Ny2522oAZR8HL9l64dJPGkj8etNr9+JjWORJPlcTNEuM7UJmYs49KuHZTvWo+tmK7UcBS+ejBQti6PHzSVejGfOmRIOGv/7upBbYp3fYQiWGwbldwcPAQ6Vx2Nam0dHQeHHs7589kti4pXqrmgc35E/nFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ7zH3m1tzA+zORMQL87C6owwMAbMm5KpHl2mM/1Nlw=;
 b=jFnU4kJBtmp2O5ph/HAnLwcA2UVOlKFUWQXLTaIHe3ZAeVSSsjGFzikl0qQcjLFNmD+xYvKoFABnY5pyOzPjFNBbDK0R8uY61pE0Hfj99Urkr2/ZasGB94VO+VkHoHmHLg0hl1f5u/5oDFRDD9flDN5s7y1nqXh1CqO+znoY6/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB9118.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:270::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 19:14:28 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:14:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 20:14:27 +0100
Message-Id: <DKIY9L8O1POV.Z0GAOL11LELQ@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, <rust-for-linux@vger.kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Antoni Boucher"
 <bouanto@zoho.com>
Subject: Re: [PATCH] rust: bitfield: always inline test conversions
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260807175012.142083-1-ojeda@kernel.org>
In-Reply-To: <20260807175012.142083-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0577.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: eddcb919-904a-49a5-c1c3-08def4b819d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|23010399003|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AZ1KFub2CW1K3mcvyY/lQNRQ0TW2HUf2YAkZwN3bNT1k/YIi4rq1s2aBatuB4K3Rznhr9j7zkQXJshAf89tuiQP5PWCnfTxIIcJuUATbxDfQXvWRj85kChLk5gBxWXwtdOQDDIwoayDTq2CmoR9bKN213iacogN5uzb4IiYHqCy5lsVovClyaimiUQp3+i2c785AcRQrjJwvW66/dVTMkM0C9u7FR9C3sUwDZfVTnSPwJ5Aws+5PDAeDE4CVlQswumgSF3DfUPN97rpR7Xrk/eodD0r9CaUxVsi9+qu5JuGRJ3kcrgyuGje7y9FYMbOIrcXWjNTW9Kax6NxVuTM3Ko59QwC+90ABPxiTLeI386oHVNnnfYEzmJ1/1z2ZVazhQn3cjNcLNts9yF4uIr8Z16vDHe95hybK56yVFgp+4GYhN9SZtY5n0MTMk7oTY396uAPpU2yJUitBt5Xk0TzBhSQiYZuSf1MnWDUMQHG6N7O8gFURc01yHYUn51MNTHmkjes/scIrb5zhzeB6RXfDwLkE1PKYhcj6w1x1XfruIFcL8AJE6zTfZWkLLIqfwEy6MYaI8YWLM5xsKyvcMPTZOazt49bD3NA8biv6MAre2zj2xpXtFcdZp2XrR+kjFpgnlVpfK9ZGLRjsIH7Jgcmf6/MNWIIL9cVbnbqx0IsDdcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHhqUWtBNFptbk5OT1RXQUFzWlpwSlpRbXZLOTI4RUFwbkU3SFo1dWY4V2V5?=
 =?utf-8?B?QlNselQ1R0RxUldXUWUxK21OQkFQWmsrcWw3cVlzRzgrYjViRHdPVVRCck80?=
 =?utf-8?B?ZzB3MkNncUtzS1grU3ZnOE9RTml1ZzU2ZXpJSmdsK0dzN2NsSjBMZElNL2pa?=
 =?utf-8?B?NnpaTUl3RWxBWUkxa2NXanJSdE5ERTdzQjkrOGg1dW5WejkzK1RGckFzOUZq?=
 =?utf-8?B?eC84UVJBOUpIRGVVUk5RZDRnUHB3MEp5cFhxeFVBa3NyV1NSaGlzVFN0S0Nv?=
 =?utf-8?B?bTNYamdKcTArVko3ZlFXWUE2c2w5Tjk2cjZPVGRiQm5MS0N6em1FaGRyNHVo?=
 =?utf-8?B?aHAzRlFQaEM2NUpKOVMyeENxbnY0ckxPTExWVW9TbjNhNlQ2L1hId042dkgv?=
 =?utf-8?B?TDhUVzVuNFZwV0RwZVNPTWcyaTJQck5DTmxPbDdKY1phZFZZNkxyRHZ6S0Jy?=
 =?utf-8?B?a21lTFFnYWg2TEdFU2RZSXpmckQzcUhIOVFIR0w4VXFaWGRUTis1a2lSWG1s?=
 =?utf-8?B?TDNWbG01SHNjYlltL3ZvQjhPYXF6cW00aWZoRmgxbEJ0aHhUUFZFVkVnUWlB?=
 =?utf-8?B?Ykhmeml6eS9QbG50Zy9ta3YxS3VabjlCWWJXVVdGbGtzNzFoV2FyNDhsWS8y?=
 =?utf-8?B?ZTdwekhMYytwWWJ4RkN1OUVYUUhQT0MzRWpqQWIxd3VzREdXZHpRL1oxVE1Q?=
 =?utf-8?B?VlFhNDBtRWthd3IxUkxicmllSnV4UlUza1BrSVAyWmU3Q0xBNjNleEJGNWZR?=
 =?utf-8?B?MDI0SDNXMmNKY1lLNysrcElUMElKUVpTaXB1RnNMRmd0TGxyVDJpajlLaHY2?=
 =?utf-8?B?dnpJb0xUQXB5RmpjYWp5c0RhN0FzTEd2ZThGRzd1cGNLM3NsMnhCa2pmL21X?=
 =?utf-8?B?YjJRajd6djd4dldtU2FuLzVUaGJLenpUVUVNVjhYVk9vUEJIa0pDTkduamh6?=
 =?utf-8?B?VHg3UnNhb2ZNSzBJNVBOd08zMkNPT0FROEk2TTZkN0JiQmxUeVd3NjhOT0Vu?=
 =?utf-8?B?djllWFIwczBmRjZFNUYrT2p0NjBDV0lKWFN1Qnl2amlSdkQ5elQybWhLSkh1?=
 =?utf-8?B?TThlaFduSGV1bG1WN2NqZEVFcmtQZG1TaFkwQTZTWkN2UHpZWHFYVHlOdklV?=
 =?utf-8?B?a2o5M2Nkdkg3b2lQcWcxUTd6bkJoeStVSkY0Y0c1Qk5uZ2dUcE8vSFVMeUxu?=
 =?utf-8?B?UkZPZHhLMzc5dk1YcDFPaDNCbjk4OHNVNTJTRVZ0OG5ZckprMDZiRE9aK3FH?=
 =?utf-8?B?ckczSFdVRko0VFliekVRbmVPdHpmenB6TGFQN05zbkpuc0JHdlBEYTZNc0p4?=
 =?utf-8?B?OXJrVVY5NDB6b2lVcTlNbHU3bEpqT1krWkgycmgrRVpTeDU2RmE5cWRtZDBv?=
 =?utf-8?B?U0wraTk3TVF0TmhzUjBmWGsrRDVuU240ZUE2UDNlSHA1WmcxZnVTanBoVmZW?=
 =?utf-8?B?SUtQdkZnZmNuaWpNS2J1MFVqc1l4M3h0bDNjd0xmMHVWSEY0WGt3ZkhCSjFL?=
 =?utf-8?B?RnRkbnRjc2pTREYwMkZ0enFFaXIzK0VhZCt1a25NVXNXb2YzNTdEOHU1QW9r?=
 =?utf-8?B?OHRQcGpRYUZUSC8vcHd3UHJyN3c4NTRrUmZObzVZODRJcXRTQWEvdllPZHVR?=
 =?utf-8?B?b2JUK3VNaWRlbzBKTXUrVE5YN0tsQ0RKb01ON0hyYmJyd1FNWEE4SEV4SlhT?=
 =?utf-8?B?VldnVGN1K0RxZmxkUTRrd0lSQ3V3OVJ1ajJKeThmWDNtVnEzNXRvcDJxMlpL?=
 =?utf-8?B?MkF0OWl0Ny8zVDYrUUd6U2c3QXp0WWdIem9yYndvTmoxb2hndlNBMXJ3bFZx?=
 =?utf-8?B?MGtrWjdXT1BjcFAxSGx4dHdOc2Q0cHU1VWdka1lDaHJpQ3BoUVhQQlZXZFdo?=
 =?utf-8?B?MHR1eDU5VWxuYkYrQzI3SVNrNU8yREFwelBwM2dwZEgxUWU2YWdlN2IwS1N4?=
 =?utf-8?B?TXlNV0ZHRkxQS0ZSbnVBckYwN29aa01xeFZCc25ZenpvYk5FN3NlSUJROXBk?=
 =?utf-8?B?a05UUTVCS1dWaEJ5TytnWWI1VWYxUitYR1d3ZzJFTTI0aFgyYXNqajNYY1pr?=
 =?utf-8?B?UzViOXhXQXNXWUN6Uno2Z1g1dTNQMENaajlVYnRQa29vR2ppZFpkT21vUHoy?=
 =?utf-8?B?MVpTbDROdFM1NDhIU3hKQm5FcWtubW1KK3BuQlExKzROd3c0aGhjd21VMjdH?=
 =?utf-8?B?eXVZZytMWC9NSnoxaEIyUGV5cDlZSmxabDZyZjZCMG0xdnk4NzlNMGJoK1l5?=
 =?utf-8?B?R3FIdmtYeHBrK0FoOWQ0ZTM3L0VBd3V3aWtIYk9ZTHBPNDdKalUrYklDNkpJ?=
 =?utf-8?B?a21jYlhXVzN3QWxvTFZuWjdtUWJPWFNUVGtVdCt4RHRuTWpFdXlpUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eddcb919-904a-49a5-c1c3-08def4b819d3
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:14:27.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NavS/kULtl68YDlJXMcR+5/P/8mDpQyls5yVhsSxQeNVr+UD6wtnnnkrGrnFockg7E7texitPXpAwkt/fs/EZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9118

On Fri Aug 7, 2026 at 6:50 PM BST, Miguel Ojeda wrote:
> From: Antoni Boucher <bouanto@zoho.com>
>=20
> When using the Rust GCC backend (i.e. `rustc_codegen_gcc`), GCC does not
> inline enough these `Bounded::from_expr` calls:
>=20
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u16, 2> as core::convert::From<kernel::bitfield::te=
sts::Priority>>::from':
>     fake.c:(.text.unlikely+0x7be): undefined reference to `rust_build_err=
or'
>=20
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u64, 4> as core::convert::From<kernel::bitfield::te=
sts::MemoryType>>::from':
>     fake.c:(.text.unlikely+0x90d): undefined reference to `rust_build_err=
or'
>=20
> Thus, similar to commit bc197e24a3ac ("rust: num: bounded: Always inline
> fits_within and from_expr"), mark them as `#[inline(always)]`.
>=20
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Antoni Boucher <bouanto@zoho.com>
> [ Reworded to add the error and to follow our usual style and sent on
>   behalf of Antoni, who found this during his work to support Rust for
>   Linux with the GCC backend, i.e. with `rustc_codegen_gcc`.- Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/bitfield.rs | 2 ++
>  1 file changed, 2 insertions(+)


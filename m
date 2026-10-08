Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022103.outbound.protection.outlook.com [52.101.101.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C57C3A5431;
	Thu,  8 Oct 2026 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487444; cv=fail; b=K9U2obFP6aHqepA2EWbwv+KrRb0H5N72p6NPCahvm3pVsbZNf+OPvipWd7rLbAb20CT/rsJ+lWG47eNnViG5B23AbSou5LefD5tl2QIuoup6hZS+7U8TdY5tL7qPf5Thg3SPUMGJ38f4q8ZPCpcF4CngjOZ8Qgi/LVAmBjsVh9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487444; c=relaxed/simple;
	bh=diJh+/hVdxqrwg+GBdTnRYznwUTunUcjYT5B6DX/KJA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BWdpnXdrOSe6doW8xob+X3jqSxA6aDfBOyU+rX3dL+TJJMrMx1eEqvSjZeM2c5Vl5cOF5mZt4d+R+rVkdnuZ0XAXa3uNfgQ6wcvoWXrturjORUv6DQOtEMzYuJKrxraoxAq1EvUOueUT0wv1cKCk1Ml+XHtrnjGwfXQPPkZx/uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VBvdNbTh; arc=fail smtp.client-ip=52.101.101.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VBvdNbTh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai+CsKU9na4v7eeMOjfKxeHcUEoRBKJa4nho2q6FdubwiKW5+4/WTLvM8P8pcBRzOJjmNNY1E3xupU9Dj3wqJkD12sO57vZ1LJC1Do+aJEP0PqXody2IwZOVQw+c4kg4nvJ30fQe7GB0MNiQX7gAIw66EqsBdHmPjqKT+So6+hOTR2oGvEH6LaKVE5/7Tfcna8vIwLSq6NTVGJ2QeY12lohFPn/p8zTpDWLlBPyRMCq+BJF1WfWWZr7aUvGpXVW4lzF0TwzdO4tRYvm2yRN64qSEfWi9CL2V9ItJnNzEUcxfTmwsgDunrpdjh4RntzGhDeiUxQEQrnhPiB5C4SMfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgsfhn7OX5czbLBwPNQJAhAaZ6nzbwSH2Ji4VQUUGIs=;
 b=D8c8WK72U5unOYBlxL9GlA4NPXOqYGpIoqzS4S7g0wqzWORPwxDFrHjkWN5quPeiZpGAzEkffJvaIoK74t1H5hb7ovGsemuLqulXmrdBD0ByMxH/X5aXYSuwCzoPxE5xv3RR//1A2s+XY4J/hGf73LDK/fCr5V9HVUeSSQqwEj12AvC49VIcH8J0U+ZrivL1oZjroNH0lsbT5R/wcrO7tg97r/ODLosLDEPwdKCVrNpauKwoiP2487RFDdzjDZoROnqd3Wbca2DB5cLM8HwgCa7TVcg5462dkU2D2TmXUBoLoQKuGMqA/phY8AKq3+SOw9u97FQNORKTTDcWxDstyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgsfhn7OX5czbLBwPNQJAhAaZ6nzbwSH2Ji4VQUUGIs=;
 b=VBvdNbThpj0rclqUKDK7EaKzuRcHTxDZWUZ9h8e/gdB/6s0a8mCB+4dya7s5dMM6ycmtDI4jRGzzwNAqFZiHVhA0VAx8f6CaBzlJ5grwB7mwCdRNhRnyM1gDHAKXM9EZB0Ygxphu/9eIVwBDw1Wi0dKKVVeEmd2RKjmTmJ8JB8s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB5864.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 19:23:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:23:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 20:23:55 +0100
Message-Id: <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in
 strcpy_into_buf()
From: "Gary Guo" <gary@garyguo.net>
To: "Thorsten Blum" <blum@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261008061326.177841-2-blum@kernel.org>
 <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com> <asflx_blsGkQ7Obn@kernel.org>
In-Reply-To: <asflx_blsGkQ7Obn@kernel.org>
X-ClientProxiedBy: LO6P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0bd491-57ef-4e27-dbdc-08df2571b1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|7416014|56012099006|4143699003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	JdnliNs/rj2jIw+IjfWziam+ZWvErXgPSFcFmPBXTwhGYw4YqgFjCMu/oX/TzsfLs+Tbsdp4JHuCrVNFXp6PhWo/jkLc5KPNVYNXlPAFLPq/eSUsOSLGcmhbl3IithDo09s+jQWk1XLMMgXLOwotBRUwulK0QbyhYBd1VIOypATCS7h/ljAUvEu6HGQd/xm+QBwcatpg18CcwAGRZSXQhZkn0cDmk/VYaoowMCgRz6iteoj9ESb2qw0batrKgyKVFBiwyRektR4mozHLglgD4EGra+5PFbQdKvz1ExfZMrDSUVzOiDzJ95pSBgjpJZRG/OzUDt4IUEEgEHPCQuubl2CV/n+vs/67Ak4sXFwxHVETGlGu+PKP15oiKeOxiXVOmEoyAMBdq2WdxXrMm633iqes0LaVAekFY58RKL8BfnsgtbyQSL8ef8EQ0cGNWZ+vf6egEVwytZzBu4Dln+MWrB39QIR+2CN6Z+2h9n3sbUsr9h82Ivh9DoTxbn54aMAD78V6hnrbbeDrdSsU8Co2KTp2u5dKi7MiGvXUy78g4BtvNKuTyyoaKloNJClbE7mHWM9pxXMvZlv3nwJIBa3OHFvPfDgoHuKxMVtqW5CHxKimRlkppEzAUbT3CjYFiets3Av2UiJcjuh77XXJLJ5AnbnPXWEq8MhkgwGfdhJDomA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(7416014)(56012099006)(4143699003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDhkbHQyYlI5d3Jsa202UzBFZlIrKysxWnB6VHhQUUZTWis5NkxLMVlmZlZS?=
 =?utf-8?B?a1hGVEdKQXZTS3czN1dxOW1kTmZ2NmZyNmN2RlJTdEpPc2hHVVpFWnlVamdW?=
 =?utf-8?B?Mkw5M3BjMHBWcmcydnppSStuRHNrM2dHcDFIMCtZZjYvNDVYLzlEVTh5OGwv?=
 =?utf-8?B?UkI0bTVDVzZUOVRQbDVtQzRNaWV5NVBOYityMVNqbTBjTUp6SExqQm01U3pD?=
 =?utf-8?B?UjhjWUhQeE9GRnhwa0cyaTdmYytMWkt6TEdYazFlN1VLS25xOHUzckV1R1c2?=
 =?utf-8?B?SEZlUGdwMnhnRlhJZmlvb2ZoVnRzOCthVkxxUW43ZzZTY2l2UG5XZVFsM0tT?=
 =?utf-8?B?WU1SNjc4OG0zKzRVRkZXbVBSenJhQU9taFZKN3I2ZmZVZHBRNXBLSTVXZ3Z6?=
 =?utf-8?B?cEpmK1VMSWJTUFVHSzk5dzZ4TGl6OERiTUlqcC9IYUtlOW9xbWtvR1EvRm8z?=
 =?utf-8?B?YU1GN1BudkxGenZKM3Nkai8wdDB0cFl3VjFldzdPU2crOWpIeVlVQml4Yzl4?=
 =?utf-8?B?SFQ3MCtoelRnRGpOSUNsQkpWQnBJS0FwOE83NEw5Sy8rMlQvZzdkVzRsbCt1?=
 =?utf-8?B?T1kyR1d2eldCZDhmZHdMOHZyQXpsRTBxL2F6NGtCbVpFWnZSd0dyQUFQbGJS?=
 =?utf-8?B?d2d5a04xQkVCSkY4YVJ6MDVaWlZRZ2ZQdGZPZnRGZEJnSXVCck1aWFlzbTFD?=
 =?utf-8?B?THk5TElUUjRmbXN0cWdpb3JUcjc5U1VwaW9wOWV1ck82VmlwREtKVStab2RU?=
 =?utf-8?B?SUlPa2ZkeG5reGt4N0pYNWZCSlFtM0hHMHNsR1p0amw2cGRKWU5TZGNEMTlw?=
 =?utf-8?B?ZWtYVUl0YVpCdG5mdTNIanhzQzU0bnN2NmFDR1ZJSkRtT1NlVUFIdURTWklB?=
 =?utf-8?B?SHBSNHhUbmFPRXV3dlRXMlRKS1QrMElsWmhYc2dKWUJNbDcreFJQRjlaMlBZ?=
 =?utf-8?B?ZFpSbWVyY0U1M2dITVlaMExWekNkUWRDa3czaTdhRzMzOXBBZTZ1M0JWYkFq?=
 =?utf-8?B?bEFoQkovNThva3Z2Uy9Zd3Nnc1dGVU9GWThLNUhHYjdrQ0s0ZlB1Y3hLb1FK?=
 =?utf-8?B?T25hcXVndCtkc1haZmwybGZ5SHMzUTQ2VGhHcHJlNk1iVTZDQ1pYdnJLV0lB?=
 =?utf-8?B?VmZsSFNETTB5S00wSVhZTTVVRi9hbGJROWRWenZIbGM5QU5MKzZpY210WVZB?=
 =?utf-8?B?Szd3WXpjZytpWG9EMTN6TWpSSHFCZkt4UzkreitYQXU4bWQyV0lWOFprWm16?=
 =?utf-8?B?VU8yOUdpVTNHSmcyZjBaaUQ4V0k0M3BDNE9NMW0veTEwMTV4QzB0czFCZUg3?=
 =?utf-8?B?cVYwLzUxN3JlNWpCMHlDR2xOSUdHYzZvZEZGTTNtMFc0NmlueE5IYkVHRmFy?=
 =?utf-8?B?Q1R3Q1oyUTZaNzk5cS9PUXdJTGxFa2UvMFNtbkhuOHRVa01BaHpITFlyRWNE?=
 =?utf-8?B?OWh0QlRWUkVyVDlzakFRblk2c2hRMGllUDgxbDdqRUNTWFJYamVPWVBlWXd2?=
 =?utf-8?B?SEVad1JVU0dYREZvb3BJbk96WkdwSDRpWUh3M1JkcnNRYk4rUDFna0JZbTF2?=
 =?utf-8?B?dmtWUDFXOWEwVG81aDZjVEs4ckMrR0VFcW5qVktSUGU3Q0gxRUt3MHV5SHBs?=
 =?utf-8?B?VFlaOWlXZXRuVmtoTHFzZjFrS1JhV283Z2Nac1VOc3g2NW9jdDc1Nk5CMU9z?=
 =?utf-8?B?MnlrWTlSbGsyWlpkWXZVekJuVjN4SmZYKzJzTndHZmdzeklKd2NPOWE0dVE3?=
 =?utf-8?B?TUN5ZTFleFYyR0htRUowK0hvNk5UTzhwS2xwV21tVlY3Z1VZU3haZjF1ZjlP?=
 =?utf-8?B?b2JUSk9vTjR0MGJrT2YvcTdJMnlpdU5VblEySVBaL0gycjRhY3BQSkErZ2Ev?=
 =?utf-8?B?cTIya3RQcmh2REFnT2d2VnRNcVV0czhkT3c0MGJqQndFQ1RJTVo3dHo2NzRp?=
 =?utf-8?B?NkIwaGJvdHN6SkJpSG01cENPQjJmeUhXY3o1UjdSQmdsOWszRUZNajNWcTVt?=
 =?utf-8?B?QnJaQTNWV1gydzU2TVNBTzY3U1NvR3V0RFNDOFJyNTZOMVpYOXhVWnBVUWti?=
 =?utf-8?B?RjZ4WlRGMzlrYWEzZU5OcXRNWXZlMzZBaGRzRVFOVElLemJBTUFoaDBXYmdy?=
 =?utf-8?B?Z1BUZjczWUtHTWRwdDU4Mk5jalFoc0E1K2JSaURmS0VFemJSM0Ixd250UzRR?=
 =?utf-8?B?NU5Zdkduend2d1Z4KzRUY3Q1UnZQY3BaR3JrUFVITStXdXI5TlBodUFzR3E1?=
 =?utf-8?B?TlB5aFh6MlFjN2pWUk5Ba1R1WXZZVjFEVXBKUDRoMHcyRkEzWW1zMjd0bzh1?=
 =?utf-8?B?UlBwcFdtb01NSHJyYnhTR0ZPdUMwZm0xQUFFSld0a04wR0FlQzVwSlBRcVdk?=
 =?utf-8?Q?XT14i8DPQ2kxHzWtJ75XFgKfrlly4NkPtfUEY?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0bd491-57ef-4e27-dbdc-08df2571b1e8
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:23:55.7193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJkGM0EuPgPF0WYXalIYsDjzEcz3bAfgy7ejI5aEHhuB8R6yOmC4Lmwx3I7hXH6ohlba9fYPf3+rG4VVwjuN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5864

On Thu Oct 8, 2026 at 7:49 PM BST, Thorsten Blum wrote:
> On Thu, Oct 08, 2026 at 10:15:49PM +0900, Alexandre Courbot wrote:
>> On Thu Oct 8, 2026 at 3:13 PM JST, Thorsten Blum wrote:
>> > Since strcpy_into_buf() already rejects empty buffers, use ok_or()
>> > instead of unwrap_unchecked() when NUL-terminating the buffer.
>> >
>> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>> > ---
>> >  rust/kernel/uaccess.rs | 4 +---
>> >  1 file changed, 1 insertion(+), 3 deletions(-)
>> >
>> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> > index 5f6c4d7a1a51..2a0af795e75d 100644
>> > --- a/rust/kernel/uaccess.rs
>> > +++ b/rust/kernel/uaccess.rs
>> > @@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut =
[u8]) -> Result<&'buf CStr> {
>> >              // This means that we filled the buffer exactly. In this =
case, we add a NUL-terminator
>> >              // and return it. Unlike the `len < dst.len()` branch, do=
n't modify `len` because it
>> >              // already represents the length including the NUL-termin=
ator.
>> > -            //
>> > -            // SAFETY: Due to the check at the beginning, the buffer =
is not empty.
>> > -            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>> > +            *buf.last_mut().ok_or(EINVAL)? =3D 0;
>>=20
>> I am not sure this gives us much - we are trading an unsafe statement
>> that is well-controlled (enforced by the first two lines of the method)
>> for a runtime check. I'd say this is working as intended here.
>
> I checked the generated code before and after the patch and it is
> identical since the compiler is able to remove the additional check.
> Therefore, this removes an unsafe block without adding runtime cost.
>
> It also avoids relying on the buf.is_empty() check to prevent undefined
> behavior.

Adding an error returning path is worse for something that cannot happen is
worse than invoking unsafe in my opinion.

Why not just unwrap?

    *buf.last_mut().unwrap() =3D 0;

Best,
Gary

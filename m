Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020108.outbound.protection.outlook.com [52.101.195.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9FF466B5E;
	Tue, 18 Aug 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058725; cv=fail; b=thZELYwIgjR/IM720mZp7u8LbZxp1ElelQ53ail3E+WeLm6t5EeXhBm+elCvjeL4imX9ZNiCSK5tS4d1bay41HGrBNpHlVfXKUIoDjDuT/kiH3jakVvrzAcInpblN812Ay9Hvl45gT6+kfa2Sjakbcfgfb3ByZGr1BOtp4vcQRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058725; c=relaxed/simple;
	bh=bngsKKvUGiV+DjVq2R+qk/2bbOkrnGLsPl6+x3nyWM4=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Yr2igDSoZXI2pINSaneUE3NJJ4ItCgO9M76EHL8p4AmSq2W4aKlRFYATHc4BspYSvmazHOncGwlx/3QbEXLGPekjv+UIM8owri5BBlX68uaf4dSbhNIxNoT87leTpTyRRuiic1e9ixq5PJqReddWEma4cFGN8dC9SFBvIkRTNqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=h7TOhUnz; arc=fail smtp.client-ip=52.101.195.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="h7TOhUnz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJvBeExBdd7Y23D/feVN3GoKTRWXAtPHxph5kMrOk9QuBHTo2lhDiBjSnniTB77ucapIk6IODyOvFoErTOTYZmhwhO5Fmj4jAnlIQkzlEvV1CWOam3nTQm11dASdbj9gsW1Tzt9LWJM41KoOBejZVMBiQrFfYxoUCAw2MIox2wz1DrkfpYjUpBeNGMNr+Grl/NpE0VBApG0JoVPN8221wqoV6EJ55yk0GDkV7jMLLeCRh1Hb1E48DcFBwgciHFMfCoUsqIyha3fJ6+cnZ78vzyLZZpXXgDbjy7aDd81xHcHVo0GCqpfno4XVajXnokM6vhmplw6ppT1xpMpKsJfk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBVtOKJG85tptBONubHRUU4EYHBf42yVeqwH+bc+7Y8=;
 b=WD6LwSEr6nUqGtrgPMkqD/kOUflShWfKQhT2wY4wJYxI4jJugr3Cx2WxU1StzvfPGqQbtSwcGnGUWoA6AkLapc4HxDxpncvRgEFSypaBkUcVj91iaVBgpOgrjhtdGNQDi+i73Pjt8EsZE6yYsIUsaaeOT0SYBEVUiRn7ZXrCj1/dBR16dJgjf2I9bgR7rSSCBrXy6OpaOGcyY6SYFUYyEJdyGC5do4Eu5eL9GroU96ZVnYJW9+wOuFdYYZ/T+CGP+PjhXjNGwupf/6BL7KaaXPa6gviHhxSuS4inavSC0/pXBpLgJX6XV8yWI1rz6TvIDIcmY/YON9i7jwlMe13scg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBVtOKJG85tptBONubHRUU4EYHBf42yVeqwH+bc+7Y8=;
 b=h7TOhUnz73y7StORjqOSAxiyCi7v6LY72sIV2GbFovKCB24e3nLDzEBZbXvNehdordgMdNSCRTgudkvrp9eLP5RvxGrPlxW/WgY/Hk/cEy33kNcd1ddR/VXjANltYQUh5+n67WLIwg5jmAfTQ9dxRi2xgdaMN7snEGyGTmeSn/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB3485.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 13:11:59 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 13:11:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 14:11:57 +0100
Message-Id: <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Dave Jiang" <dave.jiang@intel.com>,
 "Saeed Mahameed" <saeedm@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <linux-next@vger.kernel.org>, "Jonathan Cameron" <jic23@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com>
In-Reply-To: <20260818125558.GB5432@nvidia.com>
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB3485:EE_
X-MS-Office365-Filtering-Correlation-Id: f84b87a4-a7de-48e1-e6f0-08defd2a48cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7416014|23010399003|10067099003|56012099006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aLtlk7HTCw5p/zPlDmGdDuZNOfDeatJgb3HlNhthtB1NI6WdgZ78XR4btcGzaj30VICEaSwRJh99RCNvnPl7ppmVV3snp5UbUUAuUA0cNuCKlSNMpeoAGPWmtMEvPatT+FTMhTVo1Chss8V5lgfSh5VEtEC1qfmWkeYs99bCKBnLnJISu2q9FKei9Y7XEbDmg3kQvxKzqGoCGTdxbQe8tfv0nds75rk7AVpHSczSy0FmdJ8DC+yXIFP31zmjCF6AiPzrvfdk3WYsqmcXRamp5bVbAhceB0gZbvibVgAgvkfZt6qKR3D40EtlOWgGlIU4d2NsNNSlgKa0ctNhHxqCkGeW6dsTBCSiKLzoOCBVc/m9ZAqhmyzrDU2+hl4+RMgXUC+pR2M6vQRtUeKNzaVJ2oci8LoTV04OtI5IRoL/5J7NXwF2j8/7rHKzc7zJg+OXRZk14P1fPQxDwx0fI2eMv71wHFkXQXUj8TBtnBdXwDcq2/+/r1LGh4Vo042hLSy0a46d0YbA+ZbniejN7qJ0X/WUcR3mOVtS1WFvA4Nopp+Jh8W9RFSuftExag1H5h3K2USH2cAj1s06gLCvTbtrtOAn+hsTRVlgf8tL4jmCJVpT5MtcPJcz7JgOi0Xvgd/r5MgCPUQwlSPgIL+ZEGOjFLbKxUpJuPyW8nEqDpu8s7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlMT3VSWnZYQWZoQ2QwQkdVOHR3U1FHckg4UEtsY3AvRmt3WEJjYWhqT1NE?=
 =?utf-8?B?TXZBZ2g2TnpTc1RGWXhYVjFwVGMvMWlBTy9qaTJTN3hBV29CYTFGRGxHTGY1?=
 =?utf-8?B?T2hhemJ0aTI4TmZsUzJ0SUhVQktBZXY2ZWxUNXlLUVFVbEtDZWl6T1N3RTlS?=
 =?utf-8?B?M1d3SFRkdkkwUEVJckU1RWw3S2gvTndFYUZzTVNETE5ZY2ZtSHRoeFh5Vktr?=
 =?utf-8?B?ZysvVW5kZ3hMRjNmWGVQeldPcVR5d0o2Z2NPN09MNVppOUMrNFFUN2Y1a0hR?=
 =?utf-8?B?WDRpK2szSjhGYStEeWJNRmxlUE1LU2t0NGQvS2YwSlpseTBocU1ZdSs1STJn?=
 =?utf-8?B?b3ZhL0o0dkxIOERZYlErRFRKd2dpTEc1OVAyZml4dnNnaVM5N0lKSHRxQnVD?=
 =?utf-8?B?OEYrUE5Qd05obG84U3YxRUJPTVBveGFOOERyWi9CTkxnVkhIT3JoTDlQOWMz?=
 =?utf-8?B?VmZxQUtvdk9Pd3pPQWRJQXhCNXdFeTRYY2k0TUFMdncrMTNkN0tUWGpZaGxK?=
 =?utf-8?B?cDN0OGVpOTNKRXh5Z0svMVlWK2VmbGZVUG1EejNqVkVueGM4QVN5VWlXdmtj?=
 =?utf-8?B?bGoxNFJlbTZ5c21MU2laczBlZUV5ZG9SdGFGdzg0V2RSMlJuOTlhdmJaTStY?=
 =?utf-8?B?ZTZhR1BhQk4rbmRIbWFsTVlxOGFvRVlsaklIL2t1Z0VZMFlzb3hWaGtFdlhL?=
 =?utf-8?B?Ym8xRHRkanhlSlprM2pHa1J2K1NwQ3B0M0ljVWdRWkJpeEZ3YmpMaU5NcmYv?=
 =?utf-8?B?dXQybEtSRHRwSHJ3VUVCZ2VUMzh2RFR6b0psR21Eb0J3ckdoQ3oyMjhXRDVB?=
 =?utf-8?B?RTg4MVQwKzJVcE9Qa00rUFN4ajg5V2NxaHM1S2xLVFVMTzF4ZlY0UDUrRTdK?=
 =?utf-8?B?TjBUVFdSbjVLRjd2dDhrR1Mra1VLa0hqVUhzRmhzUmJpSGo1SXVVTUUweG13?=
 =?utf-8?B?L203ZStZNnd4Tm9MMk1nbU1aWmxGNlNnZGNNR1BkbzZMd0lmWUU2Q3ZGdFBi?=
 =?utf-8?B?b0VhZEs4cnBKckZlRlRld1dQcXNDTkwyamJaNlltT1F4ZURWdm5iejNMS3dL?=
 =?utf-8?B?c2lRZ2g4R3JCZ0FPZFc5ckFycCtYSkJadTBjVCtkZ2VlV2Y4ZVJwMzdZMlFn?=
 =?utf-8?B?WnQ0ODNsOHNXbnVSL2JhT0xmMTVZVjVnWVJxaCtRWFQwbTcvMm95QjhMbERV?=
 =?utf-8?B?NVVDL0kvME1adlJwN3FUd2xxY05NcjltV2FaN3VoaC95akNFV2RWOGFRa3ll?=
 =?utf-8?B?RTZEWTBEdkhVNU5xYVA5NWpGaU5yYXdQSnA3dU1hemc1Mm1rTkhZdUpBdUsx?=
 =?utf-8?B?ZE5EVWc2bVJuQml0NkJTRDRBZUZmaTVhcjhIWkYwVmR1YkRJTUo3Qk5xeUhZ?=
 =?utf-8?B?ZGExVmpOTCtienZrR05haTZ3Rm1qWUQwWVlnRW1CMCtTSThZVGNQcmRtNGZ3?=
 =?utf-8?B?Wk1iT1J4QWEyRVZPZ24wQkc2ZnBvam84VlFiOG03WWRtZFZPekVjRklaak9N?=
 =?utf-8?B?a2FLZWhDZjRUaGFOTkdtVStEWHdYcjJhV2NxTE1FZHR2dTRHMFpqeXpWWXNJ?=
 =?utf-8?B?dXNwZHVEMm5sMEoxWHZCMnNaSy9qZW9zNm5zQ2ZManhyS0NWU0crbGFuamlR?=
 =?utf-8?B?b0RPVkc0akNKdlFzSm1xK25halh6RWQ3UzNZekJ6Y1ZLUnRxS0dwb2ZOb1l2?=
 =?utf-8?B?dEozb254NWIzbnd6ZW53QmtiNmNoZVB6Y2lyRkRSamhaV2dGV3pHV2lEenhq?=
 =?utf-8?B?UnlMUTRyU3RSekI2NkJzNVlCYXNCTWZFTUdLVmQ3eTJLTDhlcGVVTmU0a2E1?=
 =?utf-8?B?VjBlbGxET3lQb2swTTNmNFphbmRhK3BUeTdIRzdiVFdybE5ndE5wVWdYYWM2?=
 =?utf-8?B?VFBDeTZIOGQrNXdvbWxqeEdqRzBlN2YvUUFpVEN0Sy9QTUkvemFSR3JxWUpG?=
 =?utf-8?B?SzdobWFnaG9Rb3FDT0VxSVJ2UTlWbGR1dWhCV0tJN2dKZkROWlNQd05rVDRt?=
 =?utf-8?B?SUlsR0dkMTdhS1l5dURzS2Q5RWpocVpJOFF0TTk0blpURlRXUkRETTk5MjJT?=
 =?utf-8?B?WXYzODlvSGhFZmJUZ0FsS25FTURQTDVsNEtSOWRBMVUvTHZRS1IxUllIWE5r?=
 =?utf-8?B?ZTJBTGNDa2U3Vy9aQUlCamFROWVURFpXN1poWFRVNEN1djk3V3Bkc05RWGxJ?=
 =?utf-8?B?K1hqbkdaSDM4ZzR2d3ZvV09UR2R6b2pHYkVqeEN4YktvSGJFQ3llRTIyQVhZ?=
 =?utf-8?B?S1NGZGZESmllUWtiSUlBVnV1MHBpR3FKdHMxeGRiMENUZklYVThXS3p5b1hp?=
 =?utf-8?B?VlZ4ckhKS1JRY24wRmdzWnlBZTRqNkhKTGFVMUVBL0hmb0RNeXZtUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f84b87a4-a7de-48e1-e6f0-08defd2a48cf
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:11:58.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQe+AP0WXEAUmJGkxsjdTKUr8DFh6bNwfIyuirK2rHiBBI39JqgCxYWupJMfqmB1yOVrwvUMZyJ3qp7J7EGzIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3485

On Tue Aug 18, 2026 at 1:55 PM BST, Jason Gunthorpe wrote:
> On Tue, Aug 18, 2026 at 12:53:50PM +0200, Miguel Ojeda wrote:
>> Commit
>>=20
>>   ea7da3116015 ("rust: treewide: replace `__pinned_init` with `raw_[try_=
]init`")
>>=20
>> from the pin-init tree replaced the method before removing it, but commi=
t
>>=20
>>   e052daab94ee ("rust: introduce abstractions for fwctl")
>>=20
>> from the fwctl tree added a new use.
>>=20
>> Thus replace that one as well to fix this error in next-20260817:
>>=20
>>     error[E0599]: no method named `__pinned_init` found for associated t=
ype `impl pin_init::PinInit<T, error::Error>` in the current scope
>>        --> rust/kernel/fwctl.rs:465:49
>>         |
>>     465 |                 match T::open(device, reg_data).__pinned_init(=
uctx_ptr) {
>>         |                                                 ^^^^^^^^^^^^^ =
method not found in `impl pin_init::PinInit<T, error::Error>`
>
> If you delete functions like this then you break everyone elses branches =
:|

I'm not sure how this break everyone elses' branches? It only breaks linux-=
next
but that's why it exists in the first place, to catch tree conflicts.

>
> I can't use this patch:
>
> 465 |              match pin_init::raw_try_init(uctx_ptr, T::open(device,=
 reg_data)) {
>     |                              ^^^^^^^^^^^^ not found in `pin_init`
>
>
> Linus will have to fix this as a merge conflict.

This patch is sent as a semantic conflict resolution so yes it should be ap=
plied
by Linus.

For the removal of the function: Initially I plan to do this removal for
multiple cycles. However when I apply this near rc6 there wasn't any new us=
ers
introducing the usage of it so I proceed to remove it the same cycle.

If we want to do a cycle's grace period then reverting commit 1f7fa1374d3b
("rust: pin-init: remove `__pinned_init` method for `cfg(kernel)`") should =
be
sufficient. That said, I am not sure it's worth doing.

Best,
Gary

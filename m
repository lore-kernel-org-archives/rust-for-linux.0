Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010000.outbound.protection.outlook.com [40.93.198.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115FE3A6EE9;
	Mon,  9 Mar 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069263; cv=fail; b=JqorZIB/ghZnnWbsTrQf7+C7GulOEOq2sP1RT2E7Dd5FvWGyD5QoP4PvVUP+kwEFiE3UIU7Q2d1wo9GN1t3ePmLCS3tvDFMGIBG21hM5YIYg69F3mxWksdVjzhBRsuuLXqCBaFyCqUg4dmf4fesFqkhsjvOx4HUIEjN4abpUSYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069263; c=relaxed/simple;
	bh=L9Ti1epZLVgrYyVuuWEflvs7n2iVdN+Wfx1AcMnwNsk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JxxOrVWYlNuGOATqN1972TLkTRkYophpWTozjmYdmpxMDTwWo+aAN+e8R0Q0q/r/3WbKUZD3Gys26xW9e9zKrQGY85w/S3dut8eSV9eECEsUPGhvmCGRum4FN69odgxzm74rspE2OIyIznwrZp7NxDdMs6Ea4J4TyEWLJAPRGVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QC+f3ikI; arc=fail smtp.client-ip=40.93.198.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QC+f3ikI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKGN6WX+xWoJpYdkDcCXmLagwL/Ypzs8TaF4L/1mH84Vqha9k5e2DgKhfTNCcGjchtoQngDTV6UOrIHcKsLsz80fyYDjY9IEScSCNuWpuuQbflFgP6wR1juaUHGlir9o/s+/QxlWD56H5Z2BdK7+mnmOqesisCrGss/UhX+ZBdA5Fjfm7Pa7lnrgBa6D858B3D5NQ+VS+kAYiDXhkGRuDM1F6apJwrmHLNwh9Om9UFIbOFQFZH7QhcsjXrErGRn3WqtUCYattgBYw4sIgUoPC+8m/zCEt/hBe0rP/FC7h6ldf6dVlrDnZtgDVfIFgVNEoLh2nTQpTcGIPqNm/SXVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VljOMhcQRN1+cY1Em4PzOfOSSyNmHoLS/1BsKTu9t44=;
 b=Ke5HIh7fY8aXYjeae5snSKAw85P14zmyfDwBtsIy5VV9KESlFI+AhkAcFcVjnZi3tlfLZ9ZAoE48EPpIgosd8mrJuyP28oAzuffKV7w1SyxXl0q9yoTnBZr+no4i0BziP9B66HJ+ALaNwJAmVDh+7EnXn45TzvmICzKIgSLBDRufxQ2lnfMGHISrBLt8riSDwDa34q6PaFNg7l3iD6dSU+S7A2vDjlnsS4PehjLfjiCrFo0Drcxaxy1TPtifZmGHXDHLQUXc7rMVpe9yiI7oaA/HX6j1Soj6KOTP5OxkvL6yuur3cLN3b0vtKHkhvcNqIfVC2+0oH53kyO7vRamOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VljOMhcQRN1+cY1Em4PzOfOSSyNmHoLS/1BsKTu9t44=;
 b=QC+f3ikIHGTqR0zu7Al1kYxCRNix8joEEAA9clz9EXcn+HnvmpWBmMq3o1It1OnUR71t3NBujs1DAiV+zj4CSJYTrWOfz1Vz7mVW/J25tjvXWq0g/PcgLE1/I2WMy8pgjIcCH/SVeYyOu0KcCNoWvSF1gDiHrR8lA9u5yhs1E6bDIYMDKrAz4z8O+qToKrY/rHyEBVzgMIA/sqCcwbqMDTijq3P5kg9MH+SqI+v5ojYeDVR4Xuee580GC9C/J0XPahD+/hH8owEQAYjh4oUvlUQUGN/EWv63da/YOR24Hs7X7tXLQMl1Z68hPA7Yb4upDfbRiLRZWcTXjDG0X59Ojg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v8 00/10] rust: add `register!` macro
Date: Tue, 10 Mar 2026 00:13:57 +0900
Message-Id: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOz2rDMAwG8FcpPi/Dkvwn3mnvUXZwbKX1YclwR
 ugoefc5ZVCNoNMn9PvQXS1cCy/q7XRXldeylHlqoX85qXSN04W7kltWqNFpAN9VvpTlm2uXUhw
 iZAQPpNr5V+Wx3B5V54+Wr+1srj+P5hX27V8J6mfJCp3uPFIEb2iw1r9Pa8klvqb5U+0tK0oJQ
 uIuQw5Dny2TiwdJUjohqUkk7KMN2RPgQRopeyFNk5GZIlEOzoSDtFIGIW2Tydjep6DRgjlI95Q
 I8lvXJHMK0WQObQ7SC4lGSL9/G7Mxo3d6JPont237BZc19W79AQAA
X-Change-ID: 20260117-register-ccaba1d21713
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 79203575-0b12-4d7f-f9e9-08de7dee85f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	zhpzHkcvSuJkjL+V3uspKls6Q/2dpCgmkq+cC9dRjsyjvW4dk19oP/M76RNKEjAN1I1wNJLnMUT6CCO1Fzu1VBtX2oaPkJjCqkvkaNbY3UCuYpiuaiofRLEnRqTcg82gBno7XXAZvq859Kd6ebhfzC56aOZwwh9UKlj/CTJe3sBVx1ENyutiPXl6GWBOglkSxomoB5zERYdZdSR1Qu9ZKpTPD6R/W+ZLbLoJAFVv2tMC48Fxtr5dAAYeKHR6A6+AaRwRPMu+ckFgPVV+nSF5WHKU2fR+jmaKEP0gp/UX0j6SRcsVryEuHwxF7w9F0W3mKy8PSI6c5Jv6NHv2ZRiz589fxpXsBMEfe6/5Ongy536HFVTfAaBJsWVHhYP0DfQkUfcCYrAdjJMG4cy7VF0++VHE3hAlIT+eqBCvx1pfikYhbf5bYa9X1sBN65X8qzLo5fgJiM8IuY84YXerBbG71ao44Go7JWU5MUrW1Fir47XO6YHOWYNu9AJJ3/NsH6KNpeAY//aFZez1z/6h3Fbd82EAyTLdmTiCTO68ETUhtgDqt/rFt5adMxTY0YJl0us9QxcPjWxbaA9Lt2sl5VQxGTrDRzNF3K1jQC10bf4+K8CnnQ7F65yzWSKIKq0Hn4PO9q+/PM8IcIOUDsn0cZXxrRRA1rQgQgEbUWsUF6VbnBnKOs5iF+NDSQhli+fH0xWiwCKXjx2bgIzy71CD1keJGyryC1WWVNFXUde/AtAWuyoV4LMluHJrJsH/RYs5eBT5x6szXk6UzMCOlocNpkqJ8/Hewc+K3K7/nGwujb6c25w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2xoQkRUVFRYTG1yNzFkc0dkRWNOQzEzTUVCTFRScHRpY3VYRDB0SkN0eXQ1?=
 =?utf-8?B?RlcxMmdoQ210MHV3VmtpRHBoaitkcGVUUUVHdFREeVpzdHhEZFA4ejhYK3pK?=
 =?utf-8?B?dGlQbDRMVGFtREQ5SGFGazNqS0lxSzFOODg2aENzcVV1L3RETm9vK1Nrek9a?=
 =?utf-8?B?ekM1VzhTRWc5RWpQWStQRldrbFFRRWhQM0hkTCtyTFd5Zm01NjFqZzl4R2hT?=
 =?utf-8?B?clFHd2M2eFUzYVZtcmNaK0pLc2NxckFvcG5KSjF6T1dnRERqdmJXdVBBcUpG?=
 =?utf-8?B?UHlZZE9ITHgxV0FIQnNZdTd1enI4WUdGbEZyUy9xVzAxU3dkRlRvRlRvUTM2?=
 =?utf-8?B?QzFKSFZiTHdqc2xhYk94WDBOZkZKczY3ampXc0kvQVYrMU9hMEdoaEo0cXAv?=
 =?utf-8?B?Z3hBNjFwUGc1eEowY0hOaGxlT2VuWVIxTXVvdDJHaGprYnR2eFU5TDIxUld5?=
 =?utf-8?B?R0gzYUxySUNJaDlseURVQVN0OWpZQ1MxWGxqd1FaSXZVcTA3bE5sUFBMR3B5?=
 =?utf-8?B?eXFWUkVNWDUvTy83b0VXQks2QlNhaXVHWXg5d2pLY1ZaWFMwakN6eXN2SytV?=
 =?utf-8?B?Z3grOUZXa3dzSlMwR0d2aGs5cUVDYXVvUFlDV1J3eExiaXNHZkYzeC9YcHVv?=
 =?utf-8?B?MEJLM0hucGdHb0FkSUs2dVZERDBQeHdRcFJmYWJ3ZVdyRWR6RW4yNnNCTGs3?=
 =?utf-8?B?ajBqby90Y2phcktUZXRrdzNQaXlFKytzNG5MWWY3aXRoVHNBQU1lYklXbnlp?=
 =?utf-8?B?V1R5Z3YwWnpaT0tNYmJuWlVzOGNrdVRHVTNzYW1KRjVjNTk5RzZDd0crNkZu?=
 =?utf-8?B?ZFZRV01ZYjZNUTdiMG5BTkQweHBEVzJ1STBZbWxwNEpNejZLMEhmQ0svMXZr?=
 =?utf-8?B?TThJc0k0b3g4c2RQaE8wYlhMOHVjemlmRi9oZEk1eHhtY1lLalpKMXg2SXl3?=
 =?utf-8?B?aDNOU2w1bmdVSWh0TTFzdTN3R1NjVVJqZHJwbnRvNmV1ZVp2Vks1RlhFb1Fj?=
 =?utf-8?B?R0hGaDV4NzVnRmZJUFRZTUIwc3ZxR1dkditjeTVtQjVSS0pKSENqd3MwaDZa?=
 =?utf-8?B?b3JBZ3FHbDJwSDFXMUgzbE1nNlN6VXhkcEE3VDRWdzNsbDZLbFlFbEgwOWln?=
 =?utf-8?B?ektHUklONG02d3pWVWlScTJ1SWlOVjAvbUFWTnVUM2lXWEZMK3BNcU9RTzNa?=
 =?utf-8?B?ZDN1dTFYTUNhTjNXWlk3OGlmdzFWTnZsNEZOMEpDdUo3Q3A4cEZpNHFKOWFz?=
 =?utf-8?B?dHVwS284QUcxRkZXR0FTeVFqRGVvUStsWDhSU0c0L0RwZEt2U1p4cHlFUUZH?=
 =?utf-8?B?VUtRUG1KOWs0V2V4bktqQXF0ZmM1ZWVSa1dDZTNZRkZSaFd4VzZEY0l6Tklr?=
 =?utf-8?B?VTFOdlpnRXhmdnpkQ0o3M1g5QnlEVUJMUzloTEF5eXg5MERRSzlqeW82SC9D?=
 =?utf-8?B?WjZpNkFPTXgyL2V0RVhCdDNaQ3huM2ptSzdyb3hRc3dHTjZabjNEQU9QcW84?=
 =?utf-8?B?TmFFWGJyMG9XSnhKeS9BWXFEdVlxVDlWY3RjaUIxbmtNWmtTeS9KRjZSMVlm?=
 =?utf-8?B?YTJERVpWdlRBbm1PcHl6ckQ3RFZXeHJHVkhOQitSWHZib2RpMWdhbkMyU1Jy?=
 =?utf-8?B?Rk4wMGFlbjNlRHNidHJobkN5ZHd5NzNUM0FjdDVTQnQrbmdkaSt0L25HWGpR?=
 =?utf-8?B?VklCZGF3ajVXcmpNai9NVzVGTHVqTGRnVzFzK3lxb2hsR3I1SWRSdkM4RElJ?=
 =?utf-8?B?aHRLc1NhUVUveDZ2ZTFZOThtOWtPNUFmTG92MHdobXlZYXAyQktaWnlkUkVh?=
 =?utf-8?B?bzlyKzRhWnlvWVorWVlkVEM5enRDSmpoL2pjRWprWXdZZURnTUhQOTJlS21P?=
 =?utf-8?B?anh3S2tzeVJIVG5sWWZ0TGNIWlhQVFY0bWtEcXV5TWVUbXd5bmxNU0lSMEFr?=
 =?utf-8?B?VHZoSkFMN0JvS202a2lXRHhPTFliQjlFSHlVdU1ISTJuT2dTTmJ0SGY0dDZD?=
 =?utf-8?B?ejZYOTBzdUo4L3l4OFhRYlpXL1dSREpVSTBvYjJ4cmtXMFI5TzlZNS9aa2xD?=
 =?utf-8?B?aHpiRmZhVFdlN1lWcU1hd1FCVFZVMkN0YnFhYjdIaDJUbi9lSVE1dnRTaHBV?=
 =?utf-8?B?bEJweTFtREhCZ1JzdHRpdHh6NjNLdGM1dUZSYjJPRThrZlJFNmxGV1lNOUV6?=
 =?utf-8?B?OXo3OENpbGNlUy9tdTdPQlExZ0N0b2FjbFpTdlVRL0QxbVhJdEVycmMzUkFW?=
 =?utf-8?B?d1c4WXdUOGJvM3R0ZUxmT0hkMDMxMC9HYXlUZUtWaVR5bkN2eFpCYlpyQTNU?=
 =?utf-8?B?eXlXMzlHRU5VeXg2UnVWQTcvOE9IeU1GM2trUmppNk5hT2xIWFBIQkJrd0da?=
 =?utf-8?Q?Di2OhRuTcLIohBcggytqh3wWD73D+uEPji31x6IGoqOoR?=
X-MS-Exchange-AntiSpam-MessageData-1: 6g/ora7gdLgDtw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79203575-0b12-4d7f-f9e9-08de7dee85f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:13.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVwHFtoho5p5HXjsiGKQF8aLQtvQzeyMAGRHPTmCC7J52bEeAxnBrmrduF2pTePmVOvd6EiOawI+B56xZOJEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Another revision, another redesign.

This one eschews closures completely for write operations, and defaults
to a two-argument `write` method backed by a single-argument `write_val`
one to avoid register name repetition. The two-argument version can now
be used in most cases thanks to a clever use of traits (thanks Gary!).

We went from this syntax:

  bar.write_with(regs::NV_PFALCON_FALCON_DMATRFFBOFFS::of::<E>(), |r| {
      r.with_offs(src_start + pos)
  });

to this one:

  bar.write(
      WithBase::of::<E>(),
      regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_start + pos),
  );

While slightly more verbose, it is also much easier to read, as the
location and value are properly formatted into their own line, and the
confusing closure syntax is gone. Getting rid of closures also allows
any register value constructor to be used, not just a set of fixed ones.
The supporting code in the register module also doesn't spill on `io` at
all.

This design also trims more generated code from the register macro:
almost everything is provided through traits and generic code, and the
macro only implements the traits relevant to the register type (while
also embedding the bitfield feature which will eventually move to its
own macro).

The `register` macro documentation and top patch should give a good idea
of how this is used.

This revision is based on `driver-core-next` as of 2026-03-09. The top
patch also depends on `drm-rust-next`, but it is only here to illustrate
how client code looks like.

A tree with this series and its dependencies is available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/register

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Changes in v8:
- Use two-arguments `Io::write` with a convenience single-argument
  `Io::write_val`.
- Remove the `IoWrite` type, all helper methods of `IoLoc`, and stop
  relying on closures to write values.
- Add traits for specifying relative and array register locations.
- Improved documentation and examples.
- Link to v7: https://patch.msgid.link/20260224-register-v7-0-aad44f760f33@nvidia.com

Changes in v7:
- Use `RES + SHIFT >= N` instead of `RES >= N - SHIFT` in
  `Bounded::shr`.
- Rename `IoRef` to `IoLoc` and all related types
  accordingly.
- Use `Into` trait bounds in both directions on `IoLoc`.
- Add RFC patch allowing fixed register values to be used directly with
  `write`.
- Link to v6: https://patch.msgid.link/20260216-register-v6-0-eec9a4de9e9e@nvidia.com

Changes in v6:
- Remove Tested-by tags as the code has considerably changed.
- Make `Bounded::get` const so it can be used with registers.
- Use the `pin_init::zeroed()` const function instead of defining our
  own method.
- Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
  make registers use these as well.
- Use the more natural pattern of having the `Io` type perform the I/O
  access instead of the register type.
- Convert the whole PCI driver example, and not only the PCI
  configuration space.
- Rename `Bounded::as_bool` to `Bounded::into_bool`.
- Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
- Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c902514@nvidia.com

Changes in v5:
- Rename all setters to `with_*` and `with_const_*`.
- Use `, stride = ` to specify the stride of register arrays.
- Remove `Deref` requirement on the `RegisterIo` trait and make it
  `#[doc(hidden)`.
- Simplify the top dispatch rule a bit.
- Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com

Changes in v4:
- Add `with_` const field setter methods (removing the need to call
  `Bounded::new` for constant field values).
- Add `into_inner` const method for `Bounded`.
- Add `from_raw` and const `zeroed` method to create initial register
  values.
- More documentation improvements.
- Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com

Changes in v3:
- Sort the Rust features list alphabetically.
- Rebase on top of latest `driver-core-next` including the new Io trait.
- Allow several registers to be defined from the same macro invocation.
- Remove references to `bitfield!` macro.
- Fix doccomment of `shr` and `shl`.
- Use `+` syntax for relative register offsets.
- Move register arrays size and stride to after the backing type declaration.
- Use regular doccomments to document registers and fields (thanks Gary!).
- Remove `Default` implementation and implement the more predictable
  `Zeroable` instead.
- Improve doccomments a bit.
- Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com

Changes in v2:
- Remove `bitfield!` and put its rules into `register!` to give it more
  time to get reviewed.
- Allow output type larger than strictly required for `shr` and `shl` on
  `Bounded`.
- Enable the `generic_arg_infer` feature, required for rustc < 1.89.
- Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com

---
Alexandre Courbot (10):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `into_bool` method to `Bounded`
      rust: num: make Bounded::get const
      rust: io: add IoLoc type and generic I/O accessors
      rust: io: use generic read/write accessors for primitive accesses
      rust: io: introduce `IntoIoVal` trait and single-argument `write_val`
      rust: io: add `register!` macro
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs                    |  330 +++---
 drivers/gpu/nova-core/falcon/gsp.rs                |   25 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   70 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |   12 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |   17 +-
 drivers/gpu/nova-core/fb.rs                        |    6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs              |   37 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs              |    7 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs              |   17 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   16 +-
 drivers/gpu/nova-core/gfw.rs                       |   11 +-
 drivers/gpu/nova-core/gpu.rs                       |   36 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |   11 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |    9 +-
 drivers/gpu/nova-core/regs.rs                      |  612 +++++-----
 drivers/gpu/nova-core/regs/macros.rs               |  739 ------------
 rust/kernel/io.rs                                  |  391 +++++--
 rust/kernel/io/register.rs                         | 1190 ++++++++++++++++++++
 rust/kernel/lib.rs                                 |    3 +
 rust/kernel/num/bounded.rs                         |   70 +-
 samples/rust/rust_driver_pci.rs                    |   84 +-
 scripts/Makefile.build                             |    3 +-
 22 files changed, 2319 insertions(+), 1377 deletions(-)
---
base-commit: a985880eb0f73b0d497d30dcce73e537f787b6c0
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


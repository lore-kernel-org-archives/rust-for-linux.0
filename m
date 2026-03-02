Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020129.outbound.protection.outlook.com [52.101.196.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2091A30E0D4;
	Mon,  2 Mar 2026 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772480573; cv=fail; b=dwiw9BDaTw7/qJY6SOmw3KxlF/iy5+KGkPQn4/TrQD6edX6ffSpk0mTMhfs0hDSy+YEBa20RSkLFemVtAAFI6XZbs1vr6H83jWQBSfntItQZ8GANtEj0n05NWTuUYYeVn/1fv/Bt8KaH37YR92qsi063NVTq4hvg+Zajwu1xzKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772480573; c=relaxed/simple;
	bh=iXQzMU1k3/nmu5zJYojPBVNmPoSSK2PrCf4TI80tN68=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=F5AnaM8CyNHevQ4DbN/hhLUu4qDzh9SK18OJUKIG++mimMf5HXzSXxEQNRe9WHknGfMe0HXvRh3q9sp0r+sCVFbwN8hQCtSpXyGj5ZcVNLoD5fvdClE58BC0Nc9h53WJZzqf2KClC0hwFwfHWSvbjthHtuGaY/AI+b0G4w2xic4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=v3QmHZIZ; arc=fail smtp.client-ip=52.101.196.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="v3QmHZIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIf1PztyNNVEYLQcwE9mPosv9rDGGpEah+Z4vnAktwVh8+m45MnJYInkf0gbcPo5+l+nfHAPkaS8KfNlJUwyqjqSyn7G+oixgjGfn704u6lXeD6eCyA2XNV1Vbh1h8StxKUHS6qgU9hjhSUUrZO9U7rfiY9SkctVYy3qPvhrbLtGMkk+IZ5S+Uod43yIv7d8fgG47V2iXeSURe+OLiAQwxCiMDzIsD+g2ZeO5/XcrgDlm7nn8OotWFj5r3lrzNB6iwLVkrbImjzj8CNN28daUIKD3j963di/2wVnHrhMKWK6rLTJExomY63VZ412lhs+cgPEnJfpSDM/3JMfbDC+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwWeX6Qr2xGkgFqCLbYCJwc7t0zQIIr7I3G3DsV/jPQ=;
 b=AH1r7MK0SQGMg5vDgHNI6yKdammMCRVVntLVFli+SGFNHhUMaIT+SBnAnJBt3xr6OSu8n0KEI9Gc1rRvMdVIu9xMOYNKuPG2sZKtEqnFsNuAA2jbwjWYquL3Ln8iKlXzOMQhy2+eb+/zxvC5oNOJGmgAX1wF2BlAGogrpwSbzusaE1Nb5FG4og4WhROM6TmSdcTU9JWqq3peGjZyfTeTQ8WdVE28vSWuvzgUfHPUEckh010TmkiomReTIa0a2cy3Q7A5Gv5V9uPzDJ3FmPx9XIxUN1PurvAqMZams8637sNm1Im/he+K/OtwhWA+f94uZkVFO/ZCAc+vYg6nMOCu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwWeX6Qr2xGkgFqCLbYCJwc7t0zQIIr7I3G3DsV/jPQ=;
 b=v3QmHZIZgYnURdXPweqY0VAxys+tTpQsEKmobHds3QQVuSwT5vhA9jfqOB3PWz0xaw0fkuhBTCAoUoeg03sfghd4Z2CM/Cwbl+yQagv1MqnC0572b7KLgeIadpNyG662UcdYEsi79ag35Jtqw+UgJ042+sFTOGKNbvF4w/6hwMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3110.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 19:42:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:42:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 19:42:45 +0000
Message-Id: <DGSJX6W0J0KI.3PSYU2YJN0AHL@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302164239.284084-1-gary@kernel.org>
 <20260302164239.284084-2-gary@kernel.org>
 <DGSIYA7A879T.2XI2BBJGPRC34@kernel.org>
In-Reply-To: <DGSIYA7A879T.2XI2BBJGPRC34@kernel.org>
X-ClientProxiedBy: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3110:EE_
X-MS-Office365-Filtering-Correlation-Id: f37c580f-416c-4751-ac81-08de7893e102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	0j/+O0Vb2c/Z7gmCsoz8qgpAi0V+nM2PItltFfPlgjmybgnUf0AtArFPokFlkTgA4w7C9w2dIURudZj3W/QhHnAfnpf2oQ6PMYiywx7n+i6JjP8JH+D5U0VLJQYR2xM5DPf9/amWiQq2Sr+8jDQyuCnNOOiAvALzufhMn5yr3if/u05dEGPpyAJZIQJ8O93noZxQlNQhI+N3qMVjKCHlSFeHj7o6MkOeAVV+rqqf+jsr8q+RlrYdo4TA9iKnDplOQ+CLLxcWEf4h7OlIv8G4nrv81TbEf58/iwtPR1C5yU4bnSelk5nu2m09ZSU6i4EdQMynhMzxkKbRqYNSnLjifqeuYk/3xU4k0wJeVNC4/HgLsYjkM+DM8wZItaxNk1q1yCMJgKFZMsfi/7nk2p2n+QJPge7jcu+aWvaCbxdvppbBjxLK1iMY75oWReB6SyWLvmQu49w0eIFDFlqF4ftAbHs1+ryxJnK3I1sMIY+O/fqgvE3k3RXbtu3vfb6ZwUVxuaFps7eBAlHu3EcMa932kokNFF/M3nSHIE51wZsbl/iMUliOd1hpsVWA5163Ld6hDu+qHwopWc0SF5OOQNkkcv+8RgOuPFiCVHHjzRaZaJpUhvwfGZYJ2BkN9DCOLGFXWl90Uhlu3mHQLoPIvWf05mMwiZOiDOO0sbRJqHnWwdD7OqHo8KfO+hjQyLkQWzTVUGyWo8IIsVP6Tx9DSipL4KxhROOQ6TnKkd2StHfIbD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWlEaWJpcG5sTFFXUUQxRTIxZlpybzFKbytPZHJ0QjZuZjJEWTFtVXBoWHgx?=
 =?utf-8?B?b1hpY2h6QWU5ZmdHN1dZV2w4MklHa1FjcGdJYU8weDBEYXZSUzlXcVVHUndD?=
 =?utf-8?B?TmlESmFlUncwcXpVa01pVS9kYkpwMERVUXBNWVhmZE5lK1FDbURXZlErYVJI?=
 =?utf-8?B?RXlhbW5sc3RLWU5iVWJtQlpnRThySXZldUhuTFhZUVNVak1IdGtxbEhKNW42?=
 =?utf-8?B?UFNNZzZETXliN0lQVW53bldLai9VRVR0d0p0L29TTmI2bmVPamFBeklvUW92?=
 =?utf-8?B?SEx4RWF6RlRlSC9FajJyaVBmQzUwWktCUG1wRnFWKy9aTlRWUUV4NFRwY3Fq?=
 =?utf-8?B?aktsUEIwNmhkMWIxak1Cd3E1Y0tOck9vV0xPbEZVNzhPSkc5c2EvOVJXdkht?=
 =?utf-8?B?U0ttdGZ6U0J3OG93UVV4Yk5DVFdORWZLTUJETGJyVlhrN1NsNmdFNUR2RnU2?=
 =?utf-8?B?YjA0ZE84S3BzWHJYRkNFcnEwd3NRdVMwaTZBR1FzbzV2SkVuTUpDK2I4WDh1?=
 =?utf-8?B?c0lGYUZjV0ZjOXV5djI2YjRVcHVoQ0lmbGdxbWRzU09FWXJ0aXNJYldUTm9X?=
 =?utf-8?B?T1pjZkYyc1o3WDBUSDc2RFpoOGorK0RTZW9wTEpkSmpsNEtwY0V3Q2E0eVBn?=
 =?utf-8?B?TTBCazdsYmwrZGxZQnlRemI2a0ZVRjFVYTNzOFNGTUhLV1RCNGk2djh5N1Y4?=
 =?utf-8?B?K3FaZjFyTGRPS1BReXVYdVBlbTNPa09kZ3lTdHpRbXRoY2k5cTZuK3JPajNJ?=
 =?utf-8?B?dWpUL2JPdklxQi9ORDdTQVhxS3hnRnZBU0VoeXZyYzRRZUg0OFVySVB6WmpN?=
 =?utf-8?B?T0xyT2JjOHhrNjJpRDgrUDRHTUx3bW15OWdhckVwMENPclVDMWtVMTBGb0FT?=
 =?utf-8?B?VU1UV0xXTExhclNjZ3RiTXJ1TDZ0RVJibVBhZHAxZ0tJQUtyRFNaM1JpRXVG?=
 =?utf-8?B?U2tVbnRvRnJKcDZUNDNadzRnVGgrSE1FWVJTMU9GSHk5b2NPUWJHUlVNTVZT?=
 =?utf-8?B?OHR5b0phSGFkQWZSQU9SZWtMZlN0UWY4SDB5aWQwM3lxNTNoSGZQT3d3Nlhs?=
 =?utf-8?B?NFJxakN0SVBsTjR2clk0bXM3MVZUMGRpRkdjV2ZRVGwxM2VNSlltNFl0ZW5J?=
 =?utf-8?B?R3ZORE00VGlPd2ZQMFhLeFRzZDAxcXhZQTlGSElVWGY2bk90N0xJaGUxanVw?=
 =?utf-8?B?SlRXUjR3OEg3bUVnYk1WazV5emlGMmdZdnFGNnNWVjg3WVAyS0t5OGZrbVlM?=
 =?utf-8?B?dldzNGxUU1pBWHRaZVJoVGNEdHFObmRVWURJL0o2TWlVTnB6WEcxQURya25s?=
 =?utf-8?B?T3NXbWJrSDRVMGE4STV4LytCVW5FN0F1N0hCNnk2OVRUcjlDRkhRWmtBVVZZ?=
 =?utf-8?B?dkk2OVNpWlI0SUVkRExnMTg1NHJKNVhlNmVoYXhuTVZOcGFVazZCY3pDZDF0?=
 =?utf-8?B?NGkyRXM3cmdKMTVjSUtGZHNOdEJkL2d0NkZjdEU2MFdvOWpNTUJqcytjaE1w?=
 =?utf-8?B?eGRXK0hOcGxuVVhPUTFDV1FRNWdzWDJqU0NtSlNKR3p6c2RyV2RDd3AxYUpw?=
 =?utf-8?B?YjkrMzE2L3dOUUxSRzRpWFZ5d1V3WU5iZ2orLy9WTXA5dEh3eHV4aTdFbVdN?=
 =?utf-8?B?YitYQllVKzBSZ08weXNPVURYK3FnNVZXWDF3MFliNUYwQ0MvU0tsK1ZwSGRh?=
 =?utf-8?B?M3RnTDBuZjFUY1hicFB4aTl5UlRlR1lMZ0FnQWU2OElyaEFXUHErVUhydWIy?=
 =?utf-8?B?aHMzRTd0TlVQcWtJTEtldUJyMFdGb0N6NGZXelhDNHBjZWxSMGppWGJIZ0tR?=
 =?utf-8?B?Ly9rd1p2d05KcXBsSmJCeWYvVnlzRGdzWGJPZThLd1NsdnFxekxiMFBlb1NV?=
 =?utf-8?B?Rk8wSkxHRi84UHdDcWNaVVpWUDdSb1JWRWlrbmNzckdEWkVqcStOZW81N3dh?=
 =?utf-8?B?aU9aT29JU24vU1Y0ejRYMWtHNUR0V3FWUHRoWHFrbUc0RVJjQkk3dHVHem1k?=
 =?utf-8?B?UzZxNVN5ZGpURGRJL3dBbzhCbnQzR0RpQ043T1BRemRHd2dUWERSa3dSMnYr?=
 =?utf-8?B?TllVRUxFZElEc0R2WmZyTVBnMGMybzRZaVhPMEp5M1pFQVdmTktPZTJYT1NZ?=
 =?utf-8?B?YTJJUDVYdXlDbVZQMDNNTjQxOVA5em1EdWVWUi9YQ0Nhd2dYc1B6OFlLc2Vy?=
 =?utf-8?B?NlJDUmZkbFhHczVBNHpmSHpOckFYOU9VQ1pNSm1ob1cyUG40dzRMQmtEeHhG?=
 =?utf-8?B?c1BCc1FUT2VETTNJckU1MlBESi81RzZYejFLdHJ2Y2ZGVEdqK1FwWWs1OW5y?=
 =?utf-8?B?dzc5ZHMyMytDY0lZYjk2VVhCN1B2eHlnUmc2a0M3bUJxVElNa25PZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f37c580f-416c-4751-ac81-08de7893e102
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:42:46.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94jYom8TVw51ME/mGbSKUAqSGMRJQqBBFPIbOZg5rRfUSUcael69f6Ae/SEiSkZo86JcMFa3f1bxTMcaj1RP1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3110

On Mon Mar 2, 2026 at 6:57 PM GMT, Benno Lossin wrote:
> On Mon Mar 2, 2026 at 5:42 PM CET, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> Add a `KnownSize` trait which is used obtain a size from a raw pointer's
>> metadata. This makes it possible to obtain size information on a raw sli=
ce
>> pointer. This is similar to Rust `core::mem::size_of_val_raw` which is n=
ot
>> yet stable.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/kernel/lib.rs |  1 +
>>  rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 3da92f18f4ee..510cc7fe4961 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -20,6 +20,7 @@
>>  #![feature(generic_nonzero)]
>>  #![feature(inline_const)]
>>  #![feature(pointer_is_aligned)]
>> +#![feature(slice_ptr_len)]
>
> Oh and this is also missing a stability comment.

I don't see anything missing here? This is in the same group as other featu=
res
that are stable in 1.79.

Best,
Gary

>
> Cheers,
> Benno
>
>>  //
>>  // Stable since Rust 1.80.0.
>>  #![feature(slice_flatten)]


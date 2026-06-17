Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022094.outbound.protection.outlook.com [52.101.96.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1CA43637A;
	Wed, 17 Jun 2026 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705578; cv=fail; b=BMmgwRQgKXCik/kICPEOK3kMV4OACgWQY7aeBtTvNh0YdSmsxUo7AyW2QEFqj+m9nw20BDlxHbIV7cUqwlpQ61w+aZvjb90+VM/vbD9mg7nkwH25AIEjx9OvBxsOBySaiSX5oeQOyFxTbtp08J8AzJF1Ju641u+ce03ns+t59so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705578; c=relaxed/simple;
	bh=yYkORmoKZVKn/iDROlsIZ+J0FfFuYwMvCxW0e1ueqcg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hsANMBqLw79yFMCVa2oKOdlFLPFuKpotsmVVw8r30cPntsZytVM7hoNpKQRi7Yc0qSeu2QB58c9yyuQRpvvNqEIO0SLaAdSdEtTT5+aGuanDzZwEVfVGYmckNLR15KlU0jcInSINbV3m3kOxqTeMWliLzZjS9DxTC5lf6YB5xTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fWpVRZlP; arc=fail smtp.client-ip=52.101.96.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fWpVRZlP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q24Bo6ADmttoqbvTTHZQZR5G+3AS1z3zNpZodxctwva92rFq1WMFnwXpFU0+mKKgL3GfYNaGWMFsvaLVhcdknht9K8YvSqRUbPOVCpA0yYOGFkun2cX+6kIaAULly+a9W3CEmgW1JhZXvyJecrz/WKDcsAah/omeny0/NEwmWm/WqvZcLTXpu/W2qadjEPr6veQJ9MFxTFMy+ErkbFTCzB1KrZc0hnTXU115r/CBiKSrB6IAmoH4vx7r2rpUcbSHoBTj0GxdnLyXCYh9lLf2o8I65yko5ivPMUbs2AR05m+ifXImnyAgovSFKrI6AigXk7+3IQ6/sXebrnOr1u1ZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+p7L5SzIqRhJ1GpsNaC+U0ePd977IIWul9j+zr3Bos=;
 b=CgEWCgZDjyFYNaabF0aEZIftoa7lclik1SUwhbes37FOqArEbQ7dmQ4AZ1bIEWgKHMXiPBRFZlZp185+Bf3KpaSuVjXeXnZMmX+DoCZDqICpHvtHdBZ9pqNv++iB/KpxrA5b1hks/6kASUYAEnPdgqENF59VpegJmPfnsJZxEU/pVz+f3TwuQKk8/YOK439pa0ITr5tQV2rcbmXAz0nl5I1it3D/c2cUW92Ol/V8AVCEh2cUfpinViha9LnSQCMeYjAq2t8X+5WHZk0u1NG32JoDMLG97Mh0xx9Z5nt6b1XZbBVAhIUnCmc3prufbaglEbfUuoMPfU8CsF36dnaGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+p7L5SzIqRhJ1GpsNaC+U0ePd977IIWul9j+zr3Bos=;
 b=fWpVRZlPXlRhmyZ5pCROKRWH2jJ2yKzghXZwGbzTMfa0Fb+5BWomDNMECVuI4AFi8nSaJ3fso6p8nHYUxxn/KDKN4ddKiyKkbyCtCM9+m5tNAF9avPL/vBNoZ0pbR9W6FHgXTgZ6be4kUdVpDLL/dGUsFaUQW4tMClIfTvsWmpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2111.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:12:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 14:12:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 15:12:51 +0100
Message-Id: <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir Duberstein"
 <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel-mentees@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Igor
 Korotin" <igor.korotin@linux.dev>
X-Mailer: aerc 0.21.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260615201141.8920-1-nico.antinori.7@gmail.com>
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2111:EE_
X-MS-Office365-Filtering-Correlation-Id: 639513c5-0276-476b-5013-08decc7a84a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	5fFYS9sco70ahKs/0L4cylv30mJsLyeFOPmx9eqlv5L43MdPGf+k5o6RmGRklxVN2R0+2LyzZfE3P8ETyhYKiLc2nLxyF82KbYN8dWdPJpyj85ZmO2Rs56hyLZHgZ23f8mKiWPRFjkeYkqtk7NpR6t7AEguyhSwN+4MndUdBUk/KXF0LfZsnlj7z593lxI75cRyPduLGP+eag8y7AtxpDQ+d3QXUQaQp6hpQZLNxucslG1tlyJOKAbVswi/MwNS7ocrx1sw8s3ekNhIKZ69ADaIFlCv30jxuk5CxKclEsjUJ6brywSjUONj0orrwkKdzpDYj3H06z3x5TZBuA6G3wKvnu72nsTqSPJhfZ6F5cHRuGvl5nq8GyoWtiXf97PIZ1It8mKAxwCS9xpwMZVdST1iZIM6flsNZ43qXuGbfw2qnwqyWdHkHUx8FXlwAD1lh3gaR7LmOKfnwmLvkK4E+tC/3ed+IXPPQWpgC3MFzlYubLqIVKqbkfyWLvjzsMErmxUECKEnliAXFkx4cnfDwJ9gzljghWp/tJ3NSUS4/K4+APjlKrQKEjj6lW7w39TVSvpibGZjFbsW/V4pJ2p8DQXSPDNkjDfkLzWBPRawVFO+OS6gq/Wc0OAoPtq3stzv4aPsPqQf7Odr6kAKHl2VfgAMmrlErf33Zp+Cx/UK2BgfwEkmnDTO3qHz4Dr+VbC8V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b003aXBLTCthT1hrTE5GRVhrUjliWHMvZTdBamc3QWdCV0kvbHNtNnRjclNL?=
 =?utf-8?B?aS9OWGpnNEViaFBFWWljaW9vV3hWd1FjNmEyTkVIMFlSSEsxdnRyaWFKajUx?=
 =?utf-8?B?MUNudmYvN3J6bWJBbmpvZzFITHJtSzIxclBRVmVETklZREtrRGJtOFc5WVQw?=
 =?utf-8?B?ODNpQmRuK2R0U2pWU1BsV2JSN0xwRVVDaDVmc2FZSXJuNVQvZ00waXpOT2Vv?=
 =?utf-8?B?MlVzWW1pbXRRVmQ2R0VRcExsVTV3UjdiWEJLS1ZKV1hjTkFYbTQ5ckxxLy9o?=
 =?utf-8?B?WVhOTHF5ZWR2dVJXaHR1RHVqcFA1T1FSbVZDU0t0aEZYelNQRFNJT0NKeTU3?=
 =?utf-8?B?MjJvQThUYmdVVVcxUlozN0xMblozYmMwUHhYS1l6WmZ6c05PRzZVTGVScU0y?=
 =?utf-8?B?NFVHeGs5OURUUVdyc0VWS1I1UmRKVHdPTUorYkdoVjl0aDZwbUU1bHppYU5w?=
 =?utf-8?B?bWlYMXprWHZuQTczK051U3JXREdpdmY4RXp2UUNVSG0xZ0ZKdUFuSk5DQU5O?=
 =?utf-8?B?a3Exb2I4YnB1L3RvYXl5NmJLWks2Z21GSUNOb21vaHZLalU2NThXc0hyRFlN?=
 =?utf-8?B?b0lDT29MaGp3V3VmaFU4TnVNOWxKM1NqWmFZT3pkelhJMktsbENDcEh1Yjhv?=
 =?utf-8?B?azJsbnhjamdQWkd3VUR2L3ZEMG1PUldQaG9SM2RwZTVmNG1hRXdPNkNPb2N4?=
 =?utf-8?B?NzdYc0hIZHZ1WkxBc3d4NCt1SFl6c0hPcGVoaGxVZDZ1SklWZHpQM2dmajRF?=
 =?utf-8?B?UlZOMkR2M3U2MUg4N1Bnemc3cU5RTGRBU1daMzRNeTZ1eUt5YW4rRGZ4VVlJ?=
 =?utf-8?B?MlVFSmV2bWFCN3BWVWRDanAzL3RISW5aVE1MRzExaG4reTRxRjNqaW5lL0FP?=
 =?utf-8?B?ZWpMczhyQUtOQzIvQytYTTFIeU43ZmliWVg1a2xacWRhUWVaMjVMc1V5a2ZC?=
 =?utf-8?B?OXhhQitGejYzYU5NWEw5K3VZa2FHUGJHVGwzVXZDK1gxQ2FsM0dSNjVqcHNi?=
 =?utf-8?B?YkFkUzdWSUt2M1NSUStid2dsL05kVWtKQ0RMU2p5YnNuVnBiR1crRU42Skxs?=
 =?utf-8?B?RWZkK3lpZzNQdFpKcGUrc3RlL0NtS09XUjFIYUpxeVJmTDB3OU1Rek5HK3lH?=
 =?utf-8?B?bFFNQmZwTnkvcjNiWjREd0krV0FsNzhjemp1ek5OSkQwVXhGcFZHanU1Z1Z1?=
 =?utf-8?B?ai9FeHVEWjhyd0RFMy8yMzhmOHZGMnJWWVJYU21kQXJna1lYSEdWNjFraEN3?=
 =?utf-8?B?aUlGU0c5RFlLeEpjRm5ZaDRNeGp0MkVBVjVwUmFoaU9KZ2xOaVV4WkkvN1dY?=
 =?utf-8?B?cENQTnhaSFFFSDI2NVJwcEdSQzJPQkk1Ny9Lb0UwNk5xVUluREJjRUp3Wjlw?=
 =?utf-8?B?TWduTStYZ3JNU3ZnclE1K0YxYU1xd2dGNU0xWU96R0crVVl0dkZXK2V4MFJq?=
 =?utf-8?B?UW41eUhaRXNWOFhtbUgwNHVWUVl5a1FJZ29Lcnc0Y0hjc0J0dUptWG0wYlBT?=
 =?utf-8?B?SStYMGFKeGdzdXZka0t6d1YrbmNXLzVrRVRHa1dOblVyL3Y3SlVyOWw0Q0lq?=
 =?utf-8?B?YVE1Y3VFSGdTbFpOdkVxTmthV3RQYmFyRjBRcEQ2cGNkaWhralhnOTlObzZD?=
 =?utf-8?B?eUgyYlZZc3R4SDhHWm44UzNwWC9vK1lzUnRkREhCTUpUbEEwV20rZnptaXFL?=
 =?utf-8?B?VXQ0UGN5WlM2Z1JVNXpFWmFjU0h2NENqSjZJVkhtZ1lZdkpuckQ2VzJLYU1r?=
 =?utf-8?B?THZIWEdKRXRXZlJFZHI4Z0ZibnJnU2pqdTNLaERWd3hVdFJFVEhZS01iMVhv?=
 =?utf-8?B?ODlxVC9TSjd0QVNoTVB5UVhacUdzZXRNZEJsSEFiZjVlU29sNHo2NXVyUkk0?=
 =?utf-8?B?N2wySEhQZW42Tkt1RzMvbFlrdXhQV0JWWkxqY0pieVIvUmpVb21MRnlZWnhJ?=
 =?utf-8?B?NmFnQTNnbG5KUUZnVmdZdUZqNVRTNmJ5VlJPdnlJZ0R3L3dldFYvNnJCWmE0?=
 =?utf-8?B?aXp6VEJnT1JKd0dnc1RSb1lFcDdHYkdQMG1xZzlSTUEwSmRObXlyeHMxVjJ2?=
 =?utf-8?B?UEt1R3JteGIxQy9hVk1DM1JWejJEZHpOUzI2NWhQOFdkNjg3QTNZOWs5QWVt?=
 =?utf-8?B?c2hTSWNDOGt1bEZCakg5NHg1dXN6N3BlNzUyVDZNR0NRR0U1UTJMM2d0SnNl?=
 =?utf-8?B?ZlhRWXdaTnlPUHkzNGViQjlwbjlCRU5heFJITU9XYUF4Ykx6clMrTzYzNGk3?=
 =?utf-8?B?OFRvZUlVMG9LL0hQaTdRRk1IeDVodjcweHJmQ2loUjZHcU1Sb1RqZFN1SzY5?=
 =?utf-8?B?K2xlaFpRalAxZ081MHJRT2hUM2hMSmpMakkwZEJnWHZJNDZ3eUZGZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 639513c5-0276-476b-5013-08decc7a84a6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:12:51.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+URHnWWQdbPSKeVfQ94qb8VVt6uU+7flOnjwRyARZ5MPIzyiNNuifgWnPkOtwLbY8656kW8L12tkwB0mmuVBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2111

On Mon Jun 15, 2026 at 9:10 PM BST, Nicol=C3=A1s Antinori wrote:
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 624b971ca8b0..d89c42691dfe 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>  unsafe impl AlwaysRefCounted for I2cAdapter {
>      fn inc_ref(&self) {
> -        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> -        unsafe { bindings::i2c_get_adapter(self.index()) };
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcounts are non-zero.
> +        unsafe {
> +            bindings::__module_get((*self.as_raw()).owner);
> +            bindings::get_device(&raw mut (*self.as_raw()).dev);

Instead of open coding this sequence, it would be better to add a C API tha=
t
does exactly this (getting another reference from existing one).

That said, is there an actual user that needs this, or are we just implemen=
ting
AlwaysRefCounted preemptively?

Best,
Gary

> +        }
>      }
>
>      unsafe fn dec_ref(obj: NonNull<Self>) {
> --
> 2.47.3



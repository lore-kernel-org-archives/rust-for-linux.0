Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020132.outbound.protection.outlook.com [52.101.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81293BB9F7;
	Thu, 23 Jul 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830829; cv=fail; b=n/ZR15dkUGEv7+b42z1+Hd6zc1w48ObHZGhDZsraEeZoRobqo987N2CHh0kfhcX3bLem9+LUFSBrahlC0xehpWo/nQ+GKZ6eVXQMKKs7b/a40YWLYQSZERDKCGqrT0OVWMMpZ+1SJeZCmbuzK+lrwN3GYUvskY/GgAFNOGUv8lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830829; c=relaxed/simple;
	bh=7css306sgrdJeV2+YFTROdCI8hodSyeHljpWzK5Vzv4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FX5e/sJ28dFup8J69G56rLBwoO/R9kQIcgzKwEy0xYrlzPBvQL46Z++yevJ2OcZJvLvvaN4Pp0ju4oNyYLRw3XXBgoeU8l2RXx7QCUJk2SCo4uLKBZ6EybO5TZ154hnGJZZOocuiLRBVjTYfSohvQXFGWfj5TycwHNS4wXgJx3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MFTwVm+D; arc=fail smtp.client-ip=52.101.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MFTwVm+D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUVl6tvvSsT2kyZTQDa/gJrJW18dcwwnApImy5V+G2uRxq/k73g/SDerR1XhM9ij5IZdzgiJ8DcDxYsXKAGY9/2+PCmjPE8LN6MUnc31D+awugSRTX7IR3FxfrL73x86aPCaDpUu4u5tztpIkmZAUUmpxGlJfuzfswinmCGHkaZR/9emMTuc7a4iMPZRfLskhh2nJVCIm/u+Ai5hRgn6iHrwsdRyfKhIZjUYGT7ivjuyLpo46SCygfn3SnR26+vlLTfeLXOfF7Qq4OV/yeZAFG4O2Ju8lJIj1fZk3jHkaLYxLfl+C0fGYHg/5KWOPSFL1Dbk4sbKLN+O1cZ0BCPv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNJeCrgH1rz45kdi/tuR+rYUtiEEXma/MATu1kaQ2t4=;
 b=ZF7J5zLt9Y4YlLOKntJ9jLSENpzMvYZ/4GmygzdQNUSWNfC76Id6sJjiSgYEy2UirECBg7A7U0bRM8+2evdrwrQVT8bkMu34E1yqoEr1x9VQNnUoTu1CqCa5vRC0PUMXXkQDRbvTMRF1m2ROXkoJHhyYJBvpmRz+tRwMeM2S5JMyRM2WuYSWgJIrUR65/fL+m1C5W5RjG/fkuklIl+SdZX2TrcIZ1eV+WwuAubjwfu5GpEBtPjTlf4jZQ3+AbYm6qj16VVrYgs2ORX0553QSO0XN44Q6Xd8Uo8/TR7iLAUHmxZcc5g5Ol33pZUXZpv9mSFyZWGQp8lni2Co2tF9ZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNJeCrgH1rz45kdi/tuR+rYUtiEEXma/MATu1kaQ2t4=;
 b=MFTwVm+D4hQkxMANwwikC6b1HP9m4sFIO6XzHbARKh0a1RKfUACznTGXxGZOTZml0w+5sS2YVAKNp4LPrejsTCHnFWnrfTDL8LQCysWQIBvesYwGv6vvvEt7J23BF24XU7mdbwxkFrro0VshnPqOKIpOuhZTevsquuZEuVHPgWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2549.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:19:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 18:19:52 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 23 Jul 2026 19:19:46 +0100
Subject: [PATCH 3/3] rust: pin-init: mark `pin_init::zeroed` and
 `Zeroable::zeroed` as `#[inline]`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-pin-init-sync-v1-3-dabe7f902cef@garyguo.net>
References: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
In-Reply-To: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784830791; l=1175;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=gMfjoDWcA8CQOtvOwGpRy8lWOHXXcb8+pOUzUzU3gSU=;
 b=ixHuMmHAXbIIb9TfpCEsX6zNXlyMacOpOHjWbhUsBMiaL1QaFW9NnsoCL9PA6qEIkf6fFYscj
 oOoMlZ7MsPqCXbvbzQSFWbcvN4tj6EW2UjWyvXaIziWjm9JeuJco/oZ
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO3P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2549:EE_
X-MS-Office365-Filtering-Correlation-Id: 6072b307-2bb2-418e-8344-08dee8e6fd55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|7416014|921020|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZgjJuGvTD2vbg65uUctIWIhTU9IFyjTeW1Bx8LXVVtV5NePqfNyUulIugTcLfowRhC5EbtWzEE72uNykFoxZWua41E0iVZWTxkOk+o4OH6wEaMY+1kuNp2um6eepubEcZxIf039+uxgpEfHpb7tlu4VRXG2mFocBSZMjhZ3t6VAi1eN8iQGlge4pGmMe+J7fWgorI8hCIxgfypNzkNZpiykQG9Tie8bBFjB/+IFrq//zpusI2vHPxeHR4RKn5jsS+qNKqEWb49145RamkX6QKLMsrQVXULN5V07L0b5m0/zwF0VjDu2wx9UZhzG+7BrzFTwopG9LrSgV38J3TWNfMsTl6T5ZtIR1SGQe3DyVP+kicAlUtP+ON7B2Auk68eCL6f5lR6CZNY1f/kkqav2DYKm+okhAdLU6/JpnBtcgEDnOt2m37T270BYj1y22MZfGcXr761XoqK8WZ5+HST8sSDJTDfm7LUmEm8cNAfp7E+9JHb/PamzGCe25MOS963H2Qewvvw0YvIaszKjtJZZIxExN5UM1bZRzyKfGA2Vmqv5y1T24UcNvKLxQ1lE8eZYBmAmGzWw39XoABGhpLsPX/ICMTsBn3reRS4kwx5fgV1PLZbAj0iNqyTxe3Aoj2a97vyp2EB6oL84UWGiNuIgemf9iKjyFDAQSw2QG9QsB/WAIXwis19tag0eWsSkUNhcxSYUHC6PzlQpnVQ7wFyAWMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(7416014)(921020)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlIUGZXTVM3MkZiWW5qdU5hdnBCc3A3ZzVWVmVvSXNIaTJOZ3k4cW9SWHoy?=
 =?utf-8?B?Sm8zMnI4aDhkL09zeVIzeXlUWXRJcmliaEJucWxDT1lodkxKTmVrT1ExYUFK?=
 =?utf-8?B?dnNhOWxJeGdvbjFWZmFQK2hwVjJ1SmRNSno1QzQ5TWNpaDBHdGZKc1d0YStm?=
 =?utf-8?B?QUhsVUM4cWwwWVU3Y1F5Y0FBY09HNTVjOHNpU2JzcFN2M3ZuWkJyVVVXbkdG?=
 =?utf-8?B?SjZWVjFUcEJiSDBoelVtUGpBd0dveTBzcDFJZzBlQkhNME5nZzJ3cUovMGpR?=
 =?utf-8?B?bkQ5anFmRUFHVkJmU3ZmMGtGSlhnSDRocEZRUFRnQlNFSzZlUlY1ckh3RXFL?=
 =?utf-8?B?S0xVb0lNcytvWmNTQ3NKbHNtSFVwTzJqd3ozVnMyUXRSdEQrRWVWMExmekFl?=
 =?utf-8?B?OG9xRUFkL1BIc291cXN2dndCYlZpdG96UzRLTkY4aGptdkdHZXFGQUtYNDNX?=
 =?utf-8?B?UDRWU1JBZ05YN1FrR0RGMG9CamloKy9sUHBoSUpxcXovWjlUVXhKMld2T1Zn?=
 =?utf-8?B?bmFtbysxb2g4QjRSam1uVzl5cTMzdWJjaTNIbUNydlhSR3pkWUZkLzJnK2lO?=
 =?utf-8?B?TEZhcmluWE1RRy9RWENxUnJva2NLVHYvZmFld0FHaDlUVXhYN0EyY0tkRE9y?=
 =?utf-8?B?NmNzSVJ3bWRDZkdwenJyRXg1bHptRWlBU1k0YnlTRTdCVkFEQ1hTbllybmdj?=
 =?utf-8?B?S3pxOHMreUJPREx3aXJ6V1VwMzdVMTdkaGxEYTRwTDJudU9jTWZZRjVRRkZ5?=
 =?utf-8?B?SVozWUp6cXFBTEZ6blZPcmsxa3pOTGV0RnRIUXAxb3Q4MGsxR1A1SXVNSXJ5?=
 =?utf-8?B?VEU5OEZxVHJ6MVVaaXRkRkNIYzJoL0hITEY1NTFYWlFvTi9Za3JDbTRldEg2?=
 =?utf-8?B?TGRzZkZHNXNySzRyek82YldMNzBaL2pTaWpoYnE2aWZzOUFmdFl2aEkrb05Y?=
 =?utf-8?B?M2duS2IySmJvQStLcFFFalFCbHdYUGw2U29pMnE4NXpDa1E0VW5aVklOWjVW?=
 =?utf-8?B?eU5yUGdRWmdsM2RvYXJLUFhGRnM3U1N0cytza3dOMWhxVTYwK1VhRGh3MVNV?=
 =?utf-8?B?MW8wNTBkQ2p2bCtxZUdvMUJUU3dPU05aLzJ1bHpoZ0V3a1R3YzBUMEJoNmIr?=
 =?utf-8?B?V0NFWi9ERXVpQVNNQ1FUZjZpZ005OUJKYXFjQlM3aGNxZWw1T2ptblV3Q1lN?=
 =?utf-8?B?Y0pWZmV4RDVSR2Fxa0lidzA0eUFaV0FMd29xbTR2eTFmRmlTVkpPendPcDZG?=
 =?utf-8?B?dlhzZHFVTkNlTFYzY3B0VWt0V2IwN2tYcU5qSXZ4VzU1bW5OeW5PN1A5ZTVr?=
 =?utf-8?B?elBHeng0MmR1VWRCM3ROUGlISGY1L2N1YkJJOUhTN2pzQit3K3B4cTYxT3pP?=
 =?utf-8?B?T2xtRFM1LzUrVytqMUYydDk2VDMrZ1RxOWlGTEF2Z2c1SUlOdkVDU1Z0K1M5?=
 =?utf-8?B?ZFZjTkxXV2pYVGpOcFhtcHNZNDZJZm10dmtYMnZQRitydzBaejFVdVUxcHZr?=
 =?utf-8?B?Y1UwQ0VBZU0xcUNROGgydzRvS2R0NDZKNGUwRVpNN0dzOU9QR1Q5VFg4VXho?=
 =?utf-8?B?bm5VQlZBdExGeFVWZEErZGxWMlFuSUZ2alAzSldRNWJRdC8vNE0ydEFIQXJ5?=
 =?utf-8?B?MEgvWTNBWkozRHVXWVlDYXM5WXg3V3BpeUNteklTSnlPQWEyUUR6K3cyVks3?=
 =?utf-8?B?aE01VFBGSmNtL1RpWitjaWIycFNXYlN5NXNsdUhDSUVEQkhjeTdsNFBuUTdQ?=
 =?utf-8?B?N1RicVpGVCtUTTNSbjJxaWZYRm0xZHp4NUZ0bXZrNTh4THlqWXZpakg4MmJp?=
 =?utf-8?B?L1JvbS9jV08ycytFOC9xdlJJcHFCUlJkc0pKTzRzUUNLeVZzaDJBWUYzNWRK?=
 =?utf-8?B?TlMxWXEwbUIxZEI4di9MOEkzdy9pNmVJWVVrT3dheG5ITWNpZUtTTDJMd3dH?=
 =?utf-8?B?U1V1TmRmL3NGcUl0SVpJYjRnRnBSakxBQytKMmg4TGJFM1NvMGplbU54c2JH?=
 =?utf-8?B?OWdYcHJuSDMrOERsWmlTK1daU3llOXFwa0pmc3JPRnF3SndKUnJmRmsyTjly?=
 =?utf-8?B?bytuNy9tNUM4L3hyNklOWDFQMG9uS1d5OXFhWUM1RHhvaHFRN2RtbXQvM2Nw?=
 =?utf-8?B?eTRWMER2Rkw0S2tOVDNwbHpIbzREOEdqWUxkKzc1T25XMTlCYmorY2NGVFA3?=
 =?utf-8?B?T1RqUEI2NmVEaHdQdU1hOUwyRG1US0k5L0RrdE1EYklqcWVrTHlNaHY0aVRi?=
 =?utf-8?B?SnpoOXJFS1R2ZlJDcFZJOVg1NU9GckxVODk5dkQvQWI1cHpkdmxoTlN6WUF3?=
 =?utf-8?B?VTlHSHBEenFPa3BNNUdnWDlLRFR4ako0ajFZUTlncnphRzRkdWw2QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6072b307-2bb2-418e-8344-08dee8e6fd55
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:19:52.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHj5vf0QSHxJUL5mJcl6imHr9Un/Hon5PijI1OM8OnSuRwXeKOG0Op2XO+Q03JXdSrppuk+3NqH3w0P7E5FtNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2549

From: Nicolás Antinori <nico.antinori.7@gmail.com>

The `pin_init::zeroed` function is a trivial wrapper around
`unsafe { core::mem::zeroed() }`, whereas `Zeroable::zeroed` is a trivial
wrapper around `pin_init::zeroed`. Mark them both as `#[inline]` to avoid
generating unnecessary symbols for them.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 1f5005c110cd..f4ccb0e87200 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1557,6 +1557,7 @@ fn init_zeroed() -> impl Init<Self>
     /// assert_eq!(point.x, 0);
     /// assert_eq!(point.y, 0);
     /// ```
+    #[inline]
     fn zeroed() -> Self
     where
         Self: Sized,
@@ -1603,6 +1604,7 @@ pub fn init_zeroed<T: Zeroable>() -> impl Init<T> {
 /// assert_eq!(point.x, 0);
 /// assert_eq!(point.y, 0);
 /// ```
+#[inline]
 pub const fn zeroed<T: Zeroable>() -> T {
     // SAFETY:By the type invariants of `Zeroable`, all zeroes is a valid bit pattern for `T`.
     unsafe { core::mem::zeroed() }

-- 
2.54.0


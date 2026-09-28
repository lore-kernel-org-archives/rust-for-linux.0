Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022083.outbound.protection.outlook.com [52.101.101.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B92D4E06FC;
	Mon, 28 Sep 2026 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616764; cv=fail; b=oNhvwkCdL7sxckIGEvTb26Pcg84nPPm+31id0uEm7wvzpK+rvQr6V/yIb7PfyZ7BnN/61uACXG1Oas3KqIZ8YHL9jDaZgWwfrJz5sz307sVqf6oRcBQlig3x46Ff+ce+vYvlWagAph7BDiY9trgxbh3Mq6Zrv42cBxxH5qRaKrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616764; c=relaxed/simple;
	bh=YOHNQwheROhSL58+Lxk8HvxRrEyRgzJv58DAyUkRUDo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kBuFtAQWicWRSS2vk0o47Qsah6dnXmYRLDzyPH1dLBPhyKoKY0HlWf0duh31xqKuPhg6Aq9Me++vpXR0nGBCViJq9w+helR6jeHwM2L0RJaCRHJkuDoN2AvzhGSRkCMBzHFLOcU6eE3HMgsOrfEUtF8LADvsRgI4NleSYSFdHp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AaSypvF6; arc=fail smtp.client-ip=52.101.101.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AaSypvF6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jvk+DnCZvtlLiy/GEccfpJg7y4xGDVzQu5b5K3Cok2WflKOBij3UUxpIJWDdgjuMtNoR7P2aiWH2NLo58rkF6f0Ntc8pBulBZjW2GTbJdyHQNqI5ARyeZxtgcuHbjIM6mzRokPjokg+2WLFYgWOx6XS1QY5yMlfl6jy2HUEVDF6lRUko429Vn+powT0QTwt9lxu/FCxJ014VwiPvDhPlXFDAx83KHVfD//6R9gMOaPbSYSo3yibTCLYe8GdwR4ZoZ8JozdbGvt+IRFcnQTXmHN+tfGGuLbOKvr/nlRpQoahAEi3iBNAOQ9f6NiC6FTyFPC0gcnoMDfepmJVxclcbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN+Auxpljzv0iK1knjYzB4IkXuuF4mSbJA8mCQcNovM=;
 b=EMR6ujdpKyJYRK52aWScnXUoigVu3TOL2J6OdYpCfcTYbWAtdiAAJr0WWmJvwjlBYs0MtJ2a+4kzBoxU3L2gGxoixcAUaTb6qPxqHG2FV/GVFmnemSB90eFbHcx8re62SwW5iUvvnvSyfxpYDQmN+37xfTdfeSdmH7NBDHhbEOytX9kn/j4ad60PmcKLUB8T9Coa8zobpAhOwjwlw7tO34w5K+PV1VxceGWUJQuf0AoCTu/GTzWDgkdBZWtVkSeD5CDvrZVjwtCRqSM6OR+c1g31hTa+FYExB16uBMJjwUMLACMFhPwkkvoLw/3zCDqA9hLo1sISCKnM2hI0gddB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN+Auxpljzv0iK1knjYzB4IkXuuF4mSbJA8mCQcNovM=;
 b=AaSypvF6A3Y4mGcEf0vpXVkqeKd2JBcdZ0QFGCjRzRxYpUGX74rQQeFHJWxPQb71Gz6u/HnzCE3w82BF3Ypl71wyFXAtaCWuekpmAXSxnCukMpr83HjcvhCj/X4SbhUpUYs1tUyyFHTaOzO8f5cX+R+XBl7TE27yd/FsHpqsUOM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:348::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:32:29 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:32:29 +0000
From: Gary Guo <gary@garyguo.net>
Date: Mon, 28 Sep 2026 18:32:21 +0100
Subject: [PATCH 3/3] rust: pin-init: internal: init: use span of `<-` or
 `:` for the init/write call.
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dev-pin-init-sync-v1-3-e591c8e9cf0e@garyguo.net>
References: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
In-Reply-To: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
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
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790616744; l=5339;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=YOHNQwheROhSL58+Lxk8HvxRrEyRgzJv58DAyUkRUDo=;
 b=Jcg6sw+mleS5WvL4TZAj5iwTYPgfvSP3VvE/gjcns+i3JADSqmlT1NxkY1P+2cmTWCxtpfZDB
 TSxTFZyZMZIB4BG6faZ2/uLAQlCMjFUiE2Cn5b6SC7Bq56cPo5gfo/F
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fadd37-1bc6-470b-08d4-08df1d8676aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|376014|7416014|921020|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G54opo1ZbP3E6Ain97/d+MrGDkRLevAKY2ATLcQZjl9d2YHqYoSkWY0d1p4QFC6VIZ35MOmRpnOCPaA5pkPkdQS7r+Lb0/RGDsGa/bIC25KKwLy3nJ65gsrPNWDus08FPhGdD3ZxA1z9odt+I6R+zzKoFrUWMtkZX8A9gjBaGAWs4P3epsKlIk0N3lpCUHQaZqo0iyCXiP3uI6DMlAACemcRJS2K94Obc7n0POUMSf4BoRKZ9It2gHiKkp/whvl0+0XrNb2it9YJzvcBnihJP6OJP2sjpBWpfTmunRqOMm27W0akLH45wdr6idojoQd/+8RYh1046qdNgI2PRidV7V6yd1Ln+gcuxW4lgjtibGzBS480a0Ow46B9MUJjveG+PZ2kmktdG0bEr2Bb8oYSVrZvCDSYKr/R+i5nUfS/yJXonOQjfG6FMhYe1JGEmF9bG+FDbPETg8oJ10Rm8e+jcpwMBjaElrlam8PsNCHR3gHQMDXdhQ/2cMqMrYCRRX/hcnRFYonnmksJHtk5RbYumYO3bmgSlPdeTEcq1DxtN4Hf/nQ4mZYCbxv2BLIny4nMjr+/Q8jFWT2YipqU0lnz5ell7+vdN98Nynh0SMMdRCezRQIv2CaDICW/6VTduMOcsNQjEe2Slm0S/6rKAdylR0vJiY2mjkq04WADaAYqV1JYg7zGhbxoBrL1zedxV8DCQUuUTpCSnXiNda9+umO4fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(7416014)(921020)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXFIOHpaKytiOFIzWVowZW9VWWJZeThaOUFIMVVoWXc3VkRiL3dtZlI1b0JW?=
 =?utf-8?B?UmpZdS81VlZnUm1vTGhFL2svbTloWFR6dlVNVFE1V0FDWmx4Qnh3emxHQkpr?=
 =?utf-8?B?ZUxTUDFERnN1OGZGTk9IVk9nd3RCOVFNQitIMTRHdnNHb3JDVSt1R1JMV2s0?=
 =?utf-8?B?MmZ1Rmp6cml3MWJmRkRMOHV3NFVMZE54d2VLYWUyYlpid3RDOGY4aDJlQTRw?=
 =?utf-8?B?M0RCRVFvdkxTQVlhZk9SUjdwbkUvS2I4WmZUMjEvU3I3NnhQNmw4NTV1QTBG?=
 =?utf-8?B?eitHbysrSkZoZjZrVWVRYUpydlZvcDErYzY1dmU4QkFYNWpjUlF0REVJQllz?=
 =?utf-8?B?U2s1cHpkQUp3dU9SdjhUWDNiWTJ0bi83bGJpdlBZYlEwQTlBTkx5VFh4VzVW?=
 =?utf-8?B?bU5MUmNINEV5YnVVSFp4dzYzVGkzbXhlZjFVMUE5S3lHa2xaOU9aVlJzblZ6?=
 =?utf-8?B?NWhsKzM2VlpUbjJoZEpmdXduWk5sZVhSWm9TQWdhOHhnUkh3MEdSNTlPYWlB?=
 =?utf-8?B?YUcwbmpDOXc5cnRxZVRBWDlxM3JmcFkwWWJLRHB4WDhMcENSZU14eEJic3c2?=
 =?utf-8?B?VHBYTE41M0lMNlFQS2FFcGIrclFFVGVTN045OEExOEFZWU56TktoTmg3OEpB?=
 =?utf-8?B?Y1d4aUprTWd1bzZMQ2RGUG95azZOUmtmZ2ZxNGQzYjJVY2czSThPeGRMdW5i?=
 =?utf-8?B?Q1R2Z1FZNkFGVXAzM09Jd3NnTjBtaldyMHk5eWxNbFBLZEFXa0ZIN3doTEFn?=
 =?utf-8?B?dzBleFl5Q1BQMWtCZFdPTk5NRGw2dm9HazFOY3EySXJlR3dzMGxvU1VGRVAw?=
 =?utf-8?B?V1MvTkM5T2QxM0s1Y1I4VEtuaDlSSFh1MHdic2pyYzFKZTF0NGgzcUN4amhO?=
 =?utf-8?B?WEk0SzdJQktBNzFOa1BrSkhocDZZRmJWRmpzMXptZkQ0clpKYXF1SmFPeml2?=
 =?utf-8?B?SU5uall3TENpU3pyV2RaZnA3L3JEZC96akNYRlJsUFAxQnBtTWx3NTV6d0ZV?=
 =?utf-8?B?bG5EZG11YktJM3E4NktRMG5MajBvNjd4SmlyQTl4ekZRQjFlZTREWFdCL1RI?=
 =?utf-8?B?c0tQdFc5UHdNRXFKdDFOb1F5eVVUUnFuS3JhNmZmeTVNbzFvU2NlK0JKelhI?=
 =?utf-8?B?dUZFTk40NFpXMXJZOCtaWGdyYnBTZGpGekM4a1lTZC8yZ2dIWGZ6cmJUNlhC?=
 =?utf-8?B?U2pkTGlmKzZtWmszdUc1Wk9tQVkwenllVDZqY1NBT0lxcGpOMWFkRlJjcDhi?=
 =?utf-8?B?OVpoQ0VuUEFSQ1pMdlN3ZHAxcDh1cTR2Zm9FVXA0alIzVXluZTIvS1VkdHdJ?=
 =?utf-8?B?QmVxTzJFcWVUZWNiNnRVL0d3bzg3bm1PZXVqdGYrMUlyWml3Mmt3R3FLMllP?=
 =?utf-8?B?a2M1Y3VGRG5XSERobGlDZTlDR1hONU0vT0FwSGgxVnJSZ0J0WjVocXovbEo3?=
 =?utf-8?B?akJ6M0FLS2dlblQ4OHB3b2dlL1M3enBVaE1kdDY4V1NycFpMcU5hRVBXUkFr?=
 =?utf-8?B?SWI2M25TL0xIRzJ6RUt1QVczSzRUc2FWZjFFMmpiQkNsM1loN21ZbG81ZUFm?=
 =?utf-8?B?OENxT0hhT1dxNWtwcFdSQUwrUnZTemQxRjdvdU84UUo4ZUg1TG8yVTY2WGEv?=
 =?utf-8?B?czM4NElaSWFDS2VjN040VENQbkh0TUJYa0pSa3dhTlBCbnp0ejQ1N1FjSndw?=
 =?utf-8?B?eUM3NWE2NFBjUzJRZWxTSS8wOXhFQVRJMGhXUllTSm9PMG05KzRMbXVDcWFa?=
 =?utf-8?B?TmNOcEliMzVVREJjaDVuNlMvVE1weVRhUm5Hb1JJdHo1WDJIM1dMdzJ2SGt1?=
 =?utf-8?B?NEV2c1J4VXQxM2k1Uk5sY2UzSThPNi9LZ2JGa2Y3Ujh2Q2x6c0dseml4ZlM1?=
 =?utf-8?B?b0hOK29ZT0Y4QThqd0Z5bmtER2hNendBc2FsZ05XOElYQ1lLSzFTdlNYTm51?=
 =?utf-8?B?Q0NmMjNyenQxcTZDeGZIM1ZqVm9ZVUwrL0Fmd1ZqQW1IWVdOejRoUTVpREw5?=
 =?utf-8?B?bGh4TzQ0T1llV0dSZ3BSTHAwdGZPQ0FsbGhGTGNCTVk1YndSZ1ozSys5azRp?=
 =?utf-8?B?dENoTHNOeWZUUnd5V0p1VXdodWRXTU9qOHhIMWl2V1ljbUIxOWE5VllpOVlI?=
 =?utf-8?B?M0U1SnErL2k2Nm5tUDRMOS9XUEdNTmQ2K2diSDQrR3doT0JKeUpyMlcrVG1t?=
 =?utf-8?B?NHBqNnA3N0RDNlNYMlNHUG5BcVdvNEtXMjFkbExOWUpRdHJMK0lWRXlzUys3?=
 =?utf-8?B?VVNzQzFUNUJSZGVYL3Y1dkNQbDlRMXRESWVrcFhzRUtwVlJDSU5NM3Iyc3V2?=
 =?utf-8?B?ekIvdVlkWGo1RmFqMjJFM0ptb0lRN0NacGdhSlhleVlGZytHaFV3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fadd37-1bc6-470b-08d4-08df1d8676aa
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:32:26.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoGO6d5tZE0LbnvKNEry+JcByJVi8w6OIWobdb2bMc4+xCuA7n96qGnYK/G5cwgko6/TmbO//p1GTQt3+NAi2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6824

Currently we use the full span of the field initializer as the span of the
generated init call. This produces overlapping spans for type mismatch
errors, which is hard to read.

Use the span of `<-` or `:` for the method name, which wll cause type
mismatch errors or trait bound not implemented error to be appear from the
`<-` or `:` token, which declutter the output a bit and make it easier to
read.

Before the change:

    error[E0277]: `impl pin_init::PinInit<Bar>` cannot be used to movably initialize `Bar` with error `_`
      --> tests/ui/compile-fail/init/invalid_init.rs:19:16
       |
    19 |         bar <- Bar::new(),
       |         -------^^^^^^^^^^
       |         |      |
       |         |      the trait `Init<Bar, _>` is not implemented for `impl pin_init::PinInit<Bar>`
       |         required by a bound introduced by this call
       |
       = note: if your type implements `PinInit` but not `Init`, you might be forgetting a `#[pin]` annotation on fields

After the change:

    error[E0277]: `impl pin_init::PinInit<Bar>` cannot be used to movably initialize `Bar` with error `_`
      --> tests/ui/compile-fail/init/invalid_init.rs:19:16
       |
    19 |         bar <- Bar::new(),
       |             -- ^^^^^^^^^^ the trait `Init<Bar, _>` is not implemented for `impl pin_init::PinInit<Bar>`
       |             |
       |             required by a bound introduced by this call
       |
       = note: if your type implements `PinInit` but not `Init`, you might be forgetting a `#[pin]` annotation on fields

Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index f6f3e2f8cda6..6605e04d49df 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -101,7 +101,7 @@ enum InitializerKind {
     },
     Init {
         member: Member,
-        _left_arrow_token: Token![<-],
+        left_arrow_token: Token![<-],
         value: Expr,
     },
     Code {
@@ -415,24 +415,40 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
 
         // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
         let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
-        let full_span = kind.span();
+        let full_span = kind.span().resolved_at(Span::mixed_site());
 
         let init = match kind {
             InitializerKind::Value { value, .. } => {
-                let value = value
+                let (colon_span, value) = value
                     .as_ref()
-                    .map(|(_, value)| quote!(#value))
-                    .unwrap_or_else(|| quote!(#member));
+                    .map(|(colon_token, value)| (colon_token.span(), quote!(#value)))
+                    .unwrap_or_else(|| (member.span(), quote!(#member)));
+
+                // Use `:` as the span of the method name, so the type requirement appears to come
+                // from `:`.
+                let write =
+                    format_ident!("write", span = colon_span.resolved_at(Span::mixed_site()));
 
                 quote_spanned! { full_span =>
                     #(#attrs)*
-                    let mut #guard = #slot.write(#value);
+                    let mut #guard = #slot.#write(#value);
                 }
             }
-            InitializerKind::Init { value, .. } => {
+            InitializerKind::Init {
+                value,
+                left_arrow_token,
+                ..
+            } => {
+                // Use `<-` as the span of the method name, so the trait bound appears to come from
+                // `<-`.
+                let init = format_ident!(
+                    "init",
+                    span = left_arrow_token.span().resolved_at(Span::mixed_site())
+                );
+
                 quote_spanned! { full_span =>
                     #(#attrs)*
-                    let mut #guard = #slot.init(#value)?;
+                    let mut #guard = #slot.#init(#value)?;
                 }
             }
             InitializerKind::Code { .. } => unreachable!(),
@@ -690,7 +706,7 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         if lh.peek(Token![<-]) {
             Ok(Self::Init {
                 member,
-                _left_arrow_token: input.parse()?,
+                left_arrow_token: input.parse()?,
                 value: input.parse()?,
             })
         } else if lh.peek(Token![:]) {
@@ -819,11 +835,11 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
             }
             Self::Init {
                 member,
-                _left_arrow_token,
+                left_arrow_token,
                 value,
             } => {
                 member.to_tokens(tokens);
-                _left_arrow_token.to_tokens(tokens);
+                left_arrow_token.to_tokens(tokens);
                 value.to_tokens(tokens);
             }
             Self::Code {

-- 
2.54.0


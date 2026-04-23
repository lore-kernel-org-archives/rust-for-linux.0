Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7436C0C3;
	Thu, 23 Apr 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947832; cv=fail; b=D0gGIEhVvQ5L1+O+/8KgCpWHZSGGCg+jcxdGisyWcA6gseIHFIMOYYZB1tLsgbOCsziQUCqMckzWAAiKdlo5lYQRuZXJbDXJ3iUNB1I3QodNTeyhnhfAz96gW2vz/N18B4xciRL/jEvSArS4jAnsY9ICU66kwsNsPvmfM2ov3UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947832; c=relaxed/simple;
	bh=k13bTQvmbk2OwiarQpCuoUTmeHmQpZLAbmzntTu20zI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=BPTv6dIz4DzgSIDgbwymMmp5ZowB1DeZu9UD1Gh3Tdje516HpFmkmsn+X2hzpJFUDIJyha0aUbmNiYQp4+/mzi7DUoSCdrVsppchHXVYSuADcm0/XO7UKuESqNwhOmcSF1boJWVL1ofxoxMBQwTwtcZZClWPxX0jPDCQeHgg8/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WAE3rGN6; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WAE3rGN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfiCUX/NERJBQgMVmR6CJThbfu8eV7SN43Di1BloPrCAO5Y8fAhqNCCjFbfMoHWfVfium3/f0KhNrf0Ymoz+izKMjL8BtHu8NyNN4qTMe+12kT0DOCcgKL54cqVf6Jc+TieihxcSXXA6+IbeVaSWc4l4lDXhSfR/sRpQEH5nFxGOrGfQzZYjt5V1s2r5DuzrWjQ7IYzoqaHH2rbDEoptyiLiK2DujPoVEUm4lf8kcqki7XqTuMChpn0Pdfwv4IxvsYJE1juFVRwIGtmscCaDisTsAR8eavZp7mXIBXg0xfN1IPI3hcVu6LFjFuUgvMLnbSAbAmJHU737dwNILDId8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8aQiM95Th/iIXPBdIO0FBpG8U5ukiD/BRzhHtwNk9s=;
 b=MuLEbjrDgOLvvr+5nJ63ACue6c1qWuAZn/bCbpvBB+f2B44V6aaKssfutPd02uRgfQ86Sj09U6JMOKlIAM2TJmUBvEWF20mwsGdQZq5QNNjogM0d8R3ioPSQ5eJD5r08lyhbnvKjSw4ykfQtm+ZrJAyfD1ipMTmlmaHqJzAtAl/Cl/Fza/ACiFqUmbwvzGFjikOpMaVNU9Q947RY+8LXJkIortM/gP87K82v1IjnoQ3VBCDLrYPXyn74qwwY5h2rXKoRv49kQ60bV/AGzs/pyH5L6imy7u8msvuARFauZca4afzVCmAsIOz5xhYJoRKJcpOTIDfou9uVMybqobkrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8aQiM95Th/iIXPBdIO0FBpG8U5ukiD/BRzhHtwNk9s=;
 b=WAE3rGN64M2V6xeRPOpmT3qeh622tad60mkATOUm3wk+KjE8Mn1I9Z6vLbbQLG3OsUfkDUYfI+a0jfXzI3BW6RquW79hXxasgwUbgpgFYvEoB3xAQUjkHpy0lTLR1+EWPj7QaEYO2DzH9lis09RVJYD6CsMmfHSuTD7+e3qX7ccXhbV0u+JVtzdMAtzyoqeWUTkrf4Tle5ZYrz3j8iE3gBVZoGALlp3PE6XWQxWh6d++hMoRS6JBLQUntrMBee2ucb7Ne4R68Fd/2PNwvkISmEMlw/yQqNSKJtRvbV9hI95L6bH1iKoVXfRreca5tTdSfcbOVjsjTdm6kjxqqmR1uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 12:37:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 12:37:00 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 23 Apr 2026 21:36:52 +0900
Subject: [PATCH] rust: drm: gem: clean up GEM state in init failure case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-fix-gem-1-v1-1-e12e35f7bba9@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNj3bTMCt301FxdQ12zZDOLJMu0RANLcyMloPqColSgJNis6FgIv7g
 0KSs1uQRkgFJtLQAdw7+UbQAAAA==
X-Change-ID: 20260423-fix-gem-1-6c68b9fa0972
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY1PR01CA0189.jpnprd01.prod.outlook.com (2603:1096:403::19)
 To BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: b20aa07e-0ca4-442a-e89a-08dea1350403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	met8Coh18KlkCto73at+cwBHo8OJbGbcQX+YQhl+UpprQhQaB4f8nvTZHnSf58CEuXLsOxQtZ/eAjPINuv58bOihtutDw2bUTWoq3sa2o1dJbcPMrAvM0HYNugC21KPUe1SIM2GeQSLqnZvi9Bs0AK5cqIaIW8rqGDW0DNrAP5DNQ+vsMces7+VABg5FBheOqEomPkHYnjybAuX9/NC8U4LzPSN+7LS2w+QMEV3dL5ZcTsTNw41oejeo+AQadEDnoElcUjslPB/Bzk/Bpm7O8wReZJCOdpaYjpYhS6Ees3bLM7yJOYJ0TYWZpg8kmFMwS16+BTnbyZZ9RfZs0vErHreUz/7NGf5KRQDgK82Ah+WYQHkQsViKh0uA687IwArZv1fj5z1ds0cd9JFYZoSWQbGTqVIB0wozRw78r744hMbG9OYzeYUNZebrZkf7Uw877eN3LnYhrnmBvFpshfDLcDoMtHGKXZebS8R9SNSQQeboHp3KKtpZhsjdG3ibfBAmgMWz5zHYqgcQiquI98kf2RYq4Cx02iIBOs6JzxNd4Cp75F4qW2sVbkY6fTCK0hkv9JRe2sgcWwTsGqUUkUxXRxdPBg9fII6Pl8Qus6bkkCGvGlfRhvmuFjWh8inofHqnBwnfB+LXqOKiVLJnxZbDydrve5pBvmCKZedam0/CUH6UcHeoWt691PB8RFtmc+DOLidxS/fTgkss6XG90iR0oVsfRk0KH7lKyM9NU6StZf16/T8lZMdiGcmdS1SjI1Tr1lZEdrz5RVrUgw/ve5GmGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRRaWNBSDBFRzMzTEhsbnJ4SmV3YnZHNk9TNnNxcnZhOGZMYnFyMUU0cEpz?=
 =?utf-8?B?R29FYlZBZ2FYdjlHVWtUM0lJVWhreGdYMS9DNkpIVHNGY0ZJOUhaQjgxQTBG?=
 =?utf-8?B?ejJPc2VPMVRzMzZFMDc1N054a3FLcjRmaEhlTmVHUmtOWC9hRm5HL2JYczFz?=
 =?utf-8?B?UUMvRVpnR1pad3M4MzNDVDcrVTJPUWIwRURLWUZIZlAzRlh5MTNwa1Z1UEYv?=
 =?utf-8?B?SkxaMkJIalhyK1htS1lHb1lJYkQzRUZ1b3orOVl4aUsyZjdFUUltRFNkeUhr?=
 =?utf-8?B?MjFNWndsUHYvVDdKd1ZxcGw5WXBkQkQzVU01MFJ4bDNMY1R5WGpvTVV6bjBl?=
 =?utf-8?B?MGs2R09lamx5MThId3pINi9LZlFyRkJ2c0Y4SGJxZDR4clZ4WXdjdDE2K2tx?=
 =?utf-8?B?bnBLS2lxbENTYnNSeGlZUVVwcE1pUncwRUhyamozekVocVB6WWZaRVNoNEdX?=
 =?utf-8?B?TnZ3WERJZzY4K2h3R3JNcmgxV2ZZVkVEejN4YXJMU0ZzSHpERERZR1VwN2dI?=
 =?utf-8?B?S0R5KzJvZ1dkbjdySi9ITWg3ZWxHUUQrTzNXVDJseXlTWjNOaUVONkRlN3U1?=
 =?utf-8?B?d0VXSWhONXRyTEhjV1k0YU5HRDUvSEswdlpRSkx0aHlwdDFzV1FVRkFCZElo?=
 =?utf-8?B?YnNWYUtON0MweDA1aFVaUzNMNzNPK1Q0akZNOVVPNjF0MXF5TTJBUlg5ZG9p?=
 =?utf-8?B?aC9hYWZaNFIrU3ZONzJRREwrV1duYzErMHdJNnJ4bDYzRUVRcmJsVHUyOStx?=
 =?utf-8?B?cjB6alFKL1FLd3poUFpYNWVkazBHdlZBcDkyVTUvOGYrSEkxdkVyczN2Rjly?=
 =?utf-8?B?bXN0UjFzZ2o3T01pdlBEK2Q2em1zREhaM0FITzVTRm1wWDg2SFU2UGQzUkFo?=
 =?utf-8?B?bDJyRzU1bTd3RzhPY25XQVdUM2NCWXh1Vytvanl0cWlMSEVsWEI0Nk51eTRL?=
 =?utf-8?B?YVRYc1FFL3JnWTM4ei8yVldHSDBmcnh1M05wckZidEJweDdoajdncnVSTEZH?=
 =?utf-8?B?VjlUQjJQajNqMkxlajFnZkRiZExNdHJkRUcwN1dFQzgyc3Q3NFEzaEdLK1dp?=
 =?utf-8?B?ZDFuSDlPRkh0MFlDWHNMNFJHUlBEWmlQSlNmcjhpV2tSeXY0U0w1bDZRVjNV?=
 =?utf-8?B?cW9VTHIwUXcxU2xuSGU5dkN5dnBHcEhLY3RHeXIyZUhaRSs3Q1EzUmVJWUhW?=
 =?utf-8?B?YlZjOFNJaXkrNTcrTmRNMXZYSWJNMmxLTzJ4dW1xN0oxWFl2YXZidi9JT2Vo?=
 =?utf-8?B?Nk5KRzl2VHNTcjBzblBmWThuelhZWmhnbXk1dndOY2ZWMUV2UE4wcUwyVURh?=
 =?utf-8?B?UlExNHZrN0ppYXB2c0htYldkdnlHSnltMzJNQ3J5diswZmpQVmJCUHNBdS9x?=
 =?utf-8?B?aThDVTVsWGNsVEkwT3VYaTVReUNXUEVLK1Y1b094ekQyc3BTL0N6NnF2aFdG?=
 =?utf-8?B?cWNsRGFEcUdBcHN0TTdhcitPeTd4VTNXbVgxSTJtck1JNVBzUWM3R1Y0Mm11?=
 =?utf-8?B?WmJuZEIydGZISk55WWxYSUpKQWhwWTlBaWRSTmlxZVpldE5Vbng1YzlsMlZQ?=
 =?utf-8?B?R09qNDJ2K0JTS2RheGd4eVh2Vjlpb01FNVpEWFhOT0c4MVg0dlJtRUZxcFBa?=
 =?utf-8?B?SjNObHRNOUdpelU2T0gyRHJFL2VCWjU4b2Z0dEl5SkxGWmUyOVRCSjR2SEI2?=
 =?utf-8?B?NmY5ODl0aEhNYjBOcG0veC92Q3ZkdFJRWHUyQ1BYUzMrQjNzR080Q24xeUlx?=
 =?utf-8?B?Qlc1dFRZVGMrUm00bjR6UmtUcW9VL3hJNmhkMFVtdXFYSE5tU2Y5R3JIaTQ4?=
 =?utf-8?B?ZmlmcElYbjZRWWludHFuUEdGZUkxMzc5VkZuWHlWQXZVdnRlem4xaWlKTXVm?=
 =?utf-8?B?WVI0T3VZNGZUVHVuNU9tUlNwcUJEcEpLOUhic29pVStja1dFUjFoSjQzQk5V?=
 =?utf-8?B?NHUwUVVMZnE2Mks5OGRVelNFTndhazZuSzhSYlliNnBRZDlSSkp2a1hRY0p4?=
 =?utf-8?B?Ky8xc0hlUmVZYjZIWEVod1g0UldnTEdvVzdqYStjNVBGNDlmTG13UHZvVzRR?=
 =?utf-8?B?b1NSWnRiUUpXb1J1NldOUHdZRThGWGxmSytnSERXa2JDNUgwSnJNSTU1Y2Rx?=
 =?utf-8?B?ZW1WMDBDM1lnaHNUbjJGS1k0ZVdFVVdocVI0VThaaXh0M0hzNkxPNHVuQ3Ew?=
 =?utf-8?B?ZHd4cjJhL3NXRm5oRGNQdHBTejNVU2Fjb3J4TWpPRUNQYjdHUWNEc1E3Y0Vz?=
 =?utf-8?B?Z2hGYXNGR1E4dTRDRHgwWit0Q2Z5UXBqTnIwMTJSTUZjRnRlOWpkQ1VGeEJJ?=
 =?utf-8?B?NHZidTJDVHh0NDR6clVQWFdBTmVwazRXbXovREZwczlaQkttb05lUkhRVzRY?=
 =?utf-8?Q?VxzhX8aDWIzLiIW3wTZbR7RnXQqhbgBIQVYVgpOMYXdEP?=
X-MS-Exchange-AntiSpam-MessageData-1: eioGpP4PwdiDAQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20aa07e-0ca4-442a-e89a-08dea1350403
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:37:00.7725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfCQCwdh0kXQXB27cLFPoxcuhF2R/uko4779CIADp39aS0PrLBwFMRe+/BKrbyOrG6d5oasE6fLOf5PEbxS1Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530

Currently, if `drm_gem_object_init` fails, the object is freed without
any cleanup. Perform the cleanup in that case.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
I looked at `drm_gem_shmem_init` for an example, and it seems like the
correct cleanup here is to do `drm_gem_private_object_fini` if
`drm_gem_object_init` fails. Other C drivers do different things, but
looking at the implementation of `drm_gem_object_init`, this looks like
the only thing we need to clean up.
---
 rust/kernel/drm/gem/mod.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 75acda7ba500..7b6a085ace27 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -278,7 +278,14 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: T::Args) -> Result<A
         unsafe { (*obj.as_raw()).funcs = &Self::OBJECT_FUNCS };
 
         // SAFETY: The arguments are all valid per the type invariants.
-        to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
+        if let Err(err) =
+            to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })
+        {
+            // SAFETY: `drm_gem_object_init()` initializes the private GEM object state before
+            // failing, so `drm_gem_private_object_fini()` is the matching cleanup.
+            unsafe { bindings::drm_gem_private_object_fini(obj.obj.get()) };
+            return Err(err);
+        }
 
         // SAFETY: We will never move out of `Self` as `ARef<Self>` is always treated as pinned.
         let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(obj) });

---
base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
change-id: 20260423-fix-gem-1-6c68b9fa0972

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>


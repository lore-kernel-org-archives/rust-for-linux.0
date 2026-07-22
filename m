Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4D345CB2;
	Wed, 22 Jul 2026 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746239; cv=fail; b=r2A2nXN3ElEdhzwZs16Mkgl/M3j3Q+DWts/f3Y6LuB3aOU1yHPns5xeEkNfT5QnirVpnnVEIQ+uvg2hB4c06FsAv+S/t6Z0yvbFGtkepb1iYnJRPbGoL8RLFprac6/P7Q1HLcZ/AAtWuIUyPYMaZ4pKPD8GvQcvJKausA0nOd/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746239; c=relaxed/simple;
	bh=ccBzhz7pNkSAhvUsWVM8L4/e8oB9w2GAPULx90uVvE0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Is8iaGcPfyqfuj9r1D4Gi9jpSDg1fQ/sauxePcdqNHuo+cCHzioVLrVz9lUXMTy96W7zAO/utjgRpo1P+xEGIvFeC4ZxL/qpc6UsUrQV3ugAouHkVu5+ZFZuu9adPbfhubq5P4/UDtE1MWiLgZQx/Hh2aTz3cSNtlS0Z0G4h3/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lbAN1me1; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lbAN1me1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJeep5L9/Re+PQ2TfZfsno4hHJErh7mLIx6gL2LN9i4jCfq1/fzOGYTckccPUnUGuHec3th7FDrK9wnoW0CP0HOL6RqoZoS9qj63jYaiQupLyxI4K47wfYfHRWR/6Rd9yzoIs6Xg4bsNjGrP4GWJl+AxR5hqVZMmHW6DuXyDyRcpu2++q2XoSjxo+0+cmIs2+c+l73+gbw97ff3WhYO3uY+GwF4eW/nrII005T5FKqzX7YEgF9sBBEA7tfe4qCUgfPeyTcKO2jT/AyuAhpYknn+9f+PxbvA6uJr+ohNwOugvB6YCDzJwit4ZVnzvYbvvMl59Q4ZwzYJZ4TZ8et3lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYP4DWtnBYnPDKnqLjFUEIsEahM95DFBrZn0Pdkw/NU=;
 b=LOWhU8B5jmJRNIvbDJ4fGGjUM+7fcQC0vl7ZrfS4aswxQFJApbWov96N4QozTUjmYbFxaI29AnG+33XOuQDIQ0MEKMfhuANkaKYAYbECi7C8Pu3HLAuc9pjWBppAxDMpkJAEbVJLglc2ZLc3TWbCP+/kIBCLyudkpKYNschl4j/ef942c9RiADp5Ct3aZUKHnctT/CUSxz5F18iTjGyTfRagbwXj5eXMXJ6u4new59P2RSreViZI1W7ebal3sT1r6r0Ri4Ia7EakbHGVKZFOT6eP1MztDtWXvCMfoSb9vfiw55EWdKxJSkrYXiILVBd0NJAeLdh1MMcZHhhbXtIyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYP4DWtnBYnPDKnqLjFUEIsEahM95DFBrZn0Pdkw/NU=;
 b=lbAN1me165Kwn3tfPyUh7eDGBC1f2JUmkwjTcppotgIfmBELAflkQVSoqNBao3KCyXIhyEkIaGboNTo3tRORlJOpfD8v4SCDnmspWtgBk4WjJFJJFUboV9Mk7tu3AaxzuiU0bePgmYcr1tRKSWml9eKKktrsEef3CEadRQ+MwA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:50:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 18:50:30 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 22 Jul 2026 19:50:16 +0100
Subject: [PATCH 2/4] rust: devres: use `cast_pin_init` instead of manual
 reimplementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-merge-init-v1-2-d4594de76538@garyguo.net>
References: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
In-Reply-To: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784746228; l=1000;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=ccBzhz7pNkSAhvUsWVM8L4/e8oB9w2GAPULx90uVvE0=;
 b=rdE/WnkUJkhnD1N1yQb6gWdFu1smCDboJVP19lrxfGpamOfzU7UJawMlXyV4NteGuaH1daylq
 aclPjFz9/FkBBta19o+mgIZrN1M0O36g179R3ZsYxcR8CMX15OY174K
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb8f16b-37fc-4061-d5e5-08dee8221a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|56012099006|10067099003|921020|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hiicb3GVTKU4eHqxzUmnrS7Lh2KTfT+H7IOIhMu2GuODpluikt1vdfxHJvVBl06PnIOTMAFN1LPRUYpCye5AuTOWIpdaVzoaNI20ik3fD4vkL/q+fv2cs+hroQKkNhaqESH4frvLE0EwvWnq0rq+vjhpcSRQdMe0e9ERyvcWDrN47S9Syt7sL1JiPGoMMDSE/hujXBVVa6/HOcj9Ed9t/LaGj5rKw+fXZZerKQ4CUG7XLj4XmScPz7DYYoJaQSxQo0CL+E/rS2iTxeZ1xcN5rH0UMuWI3iNKaMDxf5CzZvVHYiwqnh/h0yuPmCRLRkkCQyBJxY6aU0dgROyamw2Tjnzk/ZCSS2KbsqjJk0eHDFA8gr9R7zUUm1+m5QWtmMEYHjrCfR6B6WxzbmGf/h3WkeNxX5N7/HqDCU4sNxa6GTXqw+FfNp7Y0zzHK9M0wLeLUCP7cZ+YCylEiNeb3kE17LqvzJZ7D/r/u0iD6xtVnSeo95rYe4xZiwKo5WlBLua7tstYDntklSJL75lrLCzeTWAG5eVU6xSjFPkIhxTQnzzlyBzo3zjCvJmW0VM5Q/A9A5PkMjX+5dq3G122tSgVz5oa/WqmaXFc84dkdDRNDbqR9jQ/45G7x9S7/rbPeCu2TlcHgU9eikAVSX/ZKLD+t9H+PcE5vXcVe93JlM8EGOk576Lo3p9fJSAUIFPET+4o/2eg/m01RguoEX74ZzisVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(56012099006)(10067099003)(921020)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUZybDdtVnUxd3dNbndCREpvTnR0cnFSanNZN3lzdGhWZE9zMm95K1FkeTdB?=
 =?utf-8?B?ZzFmM3lrQUhDUTFGSDRXcVFkUnpXWDNDTG1iMjBpeVhoNzFpeG9Cbjk2UDYz?=
 =?utf-8?B?dDNRVDNpTm5IY3lnYXMxekY4Nmo1VGNGZWFHNGYvL3ZJSEQxTklScmcvcnVM?=
 =?utf-8?B?MEJSMTNPc3RBQUJDcGEwYWtjM1NaSkxmNi8ybDVRMFg2TW12bDU5V1ZQZUo3?=
 =?utf-8?B?WDRXSmlPQkpzRUVVZ3hpa1ErQ2xyR2ZFd3hqYk9oSDJSQW4xMk9QUHRJSVZV?=
 =?utf-8?B?VlUzNFJpUzJMNG9RajFwTTIzQ3hPQ0t1cUxTeVp1M21vc05DaDBqNGk1RU10?=
 =?utf-8?B?K1VVbHFLc28wZ0VVTUs0UVdMaUZPekUyTVk5UUxpT04zQ21sbytiWHRPRy9V?=
 =?utf-8?B?emNNMWNBcC9XZ0JhaHM3ekYvdlprb1kwQmo2emxXWnJsVDdGeDdsRlhtdy9i?=
 =?utf-8?B?OGt2ZG4rMk5YdjFWbk9ndTNWYmZaaU11SGQ2UkNDZU1MUk0vMVNLL3pFdXlw?=
 =?utf-8?B?YXNySm45Nkc0QjF2MzBhSGdLT2JybmkvbXdlUWhYOG5rUGpiNmx6cnVxU3Y3?=
 =?utf-8?B?ZXQxeVprbnc2UXRiZ2ZuM292bjFYaExuRVd1MjJRUlNELzgrWmlsMnlFWVVK?=
 =?utf-8?B?N3BhY2xrV0diZHhwc1FOTExLZlFyKy9ZTDBiM3JXeGVJb2NJY0s1MTRDSjJY?=
 =?utf-8?B?Rk9tN1YrejA3OEIzVTBGZ3lNR1hiNG9IelBpNDhjeUcxRDRFYkZjNldqZGM1?=
 =?utf-8?B?MkVPOHBCSlRTU0ozeVB6WDFtaXBtTks5eVZwNlRVT3EzTU9nSTJSdWVhWEJM?=
 =?utf-8?B?aGl2TFhnYlYzb29IRGNhTU5obFpEYndXSzJMR2JlaDVPQWJzWndFNHIzandC?=
 =?utf-8?B?U05yd1dpMWR0dFVnRXBZaXJ1WUlGdy9yOWhLSlZkTk5tcitONWVpMVVjKzhP?=
 =?utf-8?B?QlhTSFIwTjFYUlYzMUprZWxFNzBaZmszQ2E0UUZhYjJjbWJqalhNUEx5bXdF?=
 =?utf-8?B?RmkxQ1VZekJCOHBWaXJiRitrNWRpZE9SeTRBYTR3ajRncTFMa2F5RUYxZ3hR?=
 =?utf-8?B?UXQrZHpUc1poV25KSnlrem1lSFFPOERLZUVWaGZrVDBTSzFvbFIwTDJsL0FD?=
 =?utf-8?B?UERXWGxCa2tLUk8rTGw1eXlPVllqcFhHbVdlOHJIdk9rWGxXZlc3ZjN1dE5X?=
 =?utf-8?B?dXRodU0wcEM2SGdkVU9RdFYyNDFWUFJydmlXb3phNjk0VzhFaUJxUHpzbFZD?=
 =?utf-8?B?WmpMdnhGSW41ZkQzSXppOHpUMkhzTUF2bzFIM2lQKzh3V1FNUVlzYWtNbW1w?=
 =?utf-8?B?a3JIcy8ydWJ0RFpwOU1lemwyUUJVelhwTjRrcVZJWnNnaWJZMk9hNGRFbjFD?=
 =?utf-8?B?M0JZOERPUmVsOFVzSmpKeHlzMXhrWGg4ZGdwajRpWVZFQVBKNkZTOU1mbUJR?=
 =?utf-8?B?eGZMSFlQaUhEQzhVcDNQMnpUYkhsSTNGbzlERW9jY0hqdk9hTnBOZ09yT3ov?=
 =?utf-8?B?RkxnNCtOc2gyRU0zcUxEYldEbnpnNHpCS2orUWFGTG5kd21DV3RuSUNUdVE4?=
 =?utf-8?B?TlJXTFBDZ2tuLy9GQ3BNVGpCWi9ld0g1L2VIU3M4NVdZYnR4YksvcHNRZWJR?=
 =?utf-8?B?aWV1Um95UHlTTTRlVk1ZUTdjc1F0by80ZThmTy9VOHIxTk5iTFgwaEU0RnpT?=
 =?utf-8?B?Y2EvVWh5b25SMmJaQk1NTlZnYU9haDVLTGVQZDBJQVMvUitLV1ErUjRabFZm?=
 =?utf-8?B?cXhkSThvWnFla2JudUNHMjJlSjliQzc5Uy9WRytSTWtEWVMrU2s1QlAzOUxT?=
 =?utf-8?B?Tjk4NGdJYXUrV3JodTZzZllZQ1I1VE80dkVMQlpzcnZvWlZTSXhrYUE5alVG?=
 =?utf-8?B?NXdEbkJVbXdRN2tTeXVCRlNuNytGV1JqSldRcUhnL1VHWHgzdWFZd2l4OWJk?=
 =?utf-8?B?VjdkaHJiTkVKSUpaNkxHTDlXS1FzdUNVUmRHVnZsNUcxdFRtQnVzWDV4QUtH?=
 =?utf-8?B?TDRlOXNzaURCeUFTc0tINVRWMkVyeVpzZ21zZEZ5aFpmV3g3YjNTeEdzbFBj?=
 =?utf-8?B?QkMwNG9za09vLzlnc2VuYWtnQ1R3aVJyMFF0SHFsWGkrN1h6Y2dVSVhML08r?=
 =?utf-8?B?YXNlRVppZE4vL1lUY2pEWkRjd3VHM3ZwdXNLd0hXQTI5cVRKUWtzQW5JN29Z?=
 =?utf-8?B?eldtM3Y1MmFQLzNLdlZ4ZDhGSk4zS0czZGJYMlVVYTU3TkVtRXM1MmtnQ29T?=
 =?utf-8?B?VitTU1NNVzJkYkoxQkJvVFFUL3VVTU9aMjlMVk5VaWhWVEtkY2lCMmVEcjlC?=
 =?utf-8?B?VUpVaHl0SE5kVkFhZVNyQ2tkbWRkUWhmcEVuc2hXNmI1dm5JeWE4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb8f16b-37fc-4061-d5e5-08dee8221a1b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:50:29.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEaTkH9svbsxPfAjJZJhNKnGif1TsJqso1cc01Ohm910Dinif93YhP/YQOEE2QnBfNqYu2aGq6R4qcVoB2k9KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2471

Remove the manual type-casting which is already available as
`cast_pin_init`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/devres.rs | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index ebb5c19e851e..aecc8906de2c 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -435,11 +435,7 @@ pub unsafe fn new<'a, E>(
         // SAFETY: The caller guarantees the data is valid for the device's full bound scope.
         // Lifetimes do not affect layout, so F::Of<'a> and F::Of<'static> have identical
         // representation; casting the slot pointer is sound.
-        let data = unsafe {
-            pin_init::pin_init_from_closure::<F::Of<'static>, E>(move |slot| {
-                data.__pinned_init(slot.cast())
-            })
-        };
+        let data = unsafe { pin_init::cast_pin_init(data) };
 
         Ok(Self(Devres::new(dev, data)?))
     }

-- 
2.54.0


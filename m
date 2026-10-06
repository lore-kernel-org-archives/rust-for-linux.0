Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022082.outbound.protection.outlook.com [52.101.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9B46D573;
	Tue,  6 Oct 2026 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300599; cv=fail; b=nuJOctdqFfIg5hYFkmJ/ZAPk72XwHbZb//NNPO8x/Otx/ybfhAW+AOykXmZ59CT0je3xNdfiO2ehFE/Xos9cMIFr67x6RG9UGFn3LCYmzSYriCXD5bXtutfCORp7dGCBfIWh471fFGMXRaJc8oGf11fsQs1NsELLrN2OyimU4EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300599; c=relaxed/simple;
	bh=ZwIYfeXz2TjoC9XLYvjxU9V+zimcUVsy03n8g82YWCY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AUjc7RjtmcA92xsZi3OW123gADijlqsF60EDA6KNTEByWG5vVCCtGr1AqBeaWPUI2T1cTmJNZX1LOK7p08f6AMHGOjGzI4cZ93PLa3YlNlYvzuVI0eBlVW564KReYaaeKxkOsmQPA5tHVuqffx+Fw72NfYkO7+CyWgod+LT5uU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n+AQAwir; arc=fail smtp.client-ip=52.101.101.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n+AQAwir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpHwSTzITkAmDCIbUW/AQt2arr2LnYEDpyMxM4uloI4LpAjrg8Sbq0bYlF0oRPDsyyxOtcm1BwTQIJW6ibPG+9ATdQMb99iT50B+x/1N5e+RjZhTnRABTCNqENYNBJh3wavISGZPwoSvhx5vXKjzH95wdCDbTC75gEZI5WPIe7wmqRa8RfDJ4NuDI5Br+tCLw34UUBUuqI81c+oFCmU1cFWQ+o40LTWrc2m3KB4yDQZOh8abe9fdlz/fqj3RUY4AHb+DV9AFJ0gM4Q78K6NSyJpN7Ri/HCFAO6uEfTAxJ7xcXEQW4izRYCUlg5YuFy6Z6INO+Xuy6CsMapDBL/BhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G27NB/ri6dzzZI8VC+y9b51nUzCBfncVZCFQXJG0NE=;
 b=ZNZbQ27qeL0nQ60y03y0YKvuJut6vatC+kaqHm0EKYgLUjuiqLd0+gv5+achsvzwr1bkWF5TfAMDdS2s8DO13Cbk0LSoFcCqglF0ydks8jTg3pfWl1J1b80FPmLONJ2X9A4+Wq+LQuaWka6pOkZg4V7v5xlnm/fo7unUttcIUqPU3RZHCCMgMGMiEDMoXiIkgGnB5OQTnoBfySwSDfb153aB49N6ac7D3xC4iuTUi97sQ1VC8YQzqc5RkEAvvDvp+mf7uuL/xZx9IyiooOa5F3dDfbtOhsI1gxdU3w/5rbONk2q26WhF0tCFedfEN1IqwS1Dbo+bxBPWaM1JPHDvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5G27NB/ri6dzzZI8VC+y9b51nUzCBfncVZCFQXJG0NE=;
 b=n+AQAwirEIWdTjK1MBkMyVyMwVUilBNUjJjqmGUTm6zxUAGTgrOOj0LO9LrG1rhHfBH6UdsHyF5SEqtIR4cePqlO7EWg4BOd0zlmEC8EMEm36Hz1d5w70oO1IHdYkzlMWgps0GqidtbXQVF1Hu7FvjWVaBtztIs7fhPHp8okcD0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:52 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:51 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/8] rust: pin-init: various cleanups to prepare for
 self-reference
Date: Tue, 06 Oct 2026 17:29:30 +0200
Message-Id: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANoTxWoC/yWMQQqDQAxFryJZdyAj6MKrSBfVJBqR6TBppSDev
 VF3//F5bwfjomzQVTsU3tT0nRzio4JxfqWJg5Iz1Fi3EbENxFswXqWw+M6BBCNJJGwGAbeyH/q
 7iv3zZvsOC4+fMwPH8QeK8IqHcwAAAA==
X-Change-ID: 20261006-dev-selfref-dep-df01df1d05bf
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=gary@garyguo.net;
 h=from:subject:message-id; bh=ZwIYfeXz2TjoC9XLYvjxU9V+zimcUVsy03n8g82YWCY=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeFH7AVqudPtf8myLzQUXLf3dl7Vuyf++7XxF/7f
 y0X2fV9WgxbRykLgxgXg6yYIotHN2PaJsbZspe1yl/CzGFlAhnCwMUpABMxa2D4zf5A+WWh7qvK
 KY6Tjf0f6Xm05jgaaTeKlP+v/Xzu6fnXxxj+u35584Np5TmNA6EKARcPvdRdZHGixX530Kzl51V
 Cvt734gcAL+NMbA==
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: VI4PEPF00000161.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86e) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1817:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c7fbc3-119c-421a-42f1-08df23beaa25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gOZ9V44fcC8LQ0p8VK5H+njp4hlvDGcg4B2Qe2PrtuBKsMLXFNH0yhsINMigro9CGpg7Uphqb2cmb9RtuZ6WHy/RcAjWcA0VK6vVU/DR9ea1hQNqA9B98ql+IuvTTI0uRFOy44UaRh7XLRXmGsdd5MTQjm8eEA1AIe5MWWnVk4xCZz9TQyxvar04Y4C2o1BII4HXWIBWDUMmIzbCvbhoKKA3wC4C5RAPbCxoN7KbNSMbxJMVaD/c0ekd6wKaadno6aHhjE1GcnONMSqhzgrK/59OUXIR3Y6cNIC7iAiXbKYp56raFs/cAib2i+DasUlAzdk+qe6/5oRNJsOYcnFMvjMC0Ol1Yq2SfrK+9BD6KJ28BE3Tuu67c085XHLl4YxeTZW96s1zLuAyqKeIQ3+7nYoA4/MGZgqCxFKWbA52b7Y6FM32DsNTbLWFeL9dr7bnx/eFvtrUuSMi1q/i3So95a0JOH9on9ZZ2eEvjUjMp4Rp0c6DBOhbXJLN2wDxnt6T7pYqsUMc244mUdOiDEM/93nedPrWKxge37X4tpwnPur10qn1Jr+dtCgeNgLmiuKLTsZjee05//tXNeiTpnJS1Vmjmj8gYJlfBclIEcu1SU6AdC2KM+1H0zaeSFoAc33LZh4LEExlCZLhT+LisEfO9dhdp0dMvdXvlvh2sSlQfCa7QV7tqLPdLT2LUtOVNsuMgA5YopzaxPgQJC6aCaA71Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0EzZERRQ0F2MUxSMXBNNE9pbUJLc1hXN0J1OUZnYi9DMDk3TTFRaVh1Z3hK?=
 =?utf-8?B?VzBTdlZOM0hxNS8xb3BESTNEVklBelR5NUd1M09kWUtiUTFON1MyRjBLcXVo?=
 =?utf-8?B?ZER6ZTFqTmtSRHl0TzZOTnBMM2lwcmo4VE53REpxajJ6VCsvMDgzZFI5RGZt?=
 =?utf-8?B?Zmc2NVBreGl4YlNscmNWUlErVWVkMHI2QmRza2dsTHcwL3ZlYVlXZVh4QktF?=
 =?utf-8?B?RHNvTDJPa0tIejdEeFZWZEJMY0gyamlnU044cnF4eHhVMkk1VVdBODV4aWlQ?=
 =?utf-8?B?Z1NvV2FENi93WThTU1EvNVJPNUp2WUhvazVEMVIvSFBiNDJWdnNBRTZSKzVr?=
 =?utf-8?B?Y0tYR28yZjRpcVI2eGVGTVJlY0U2b1B5aG1sRGJReUdUNldROGkyMG5sTFR3?=
 =?utf-8?B?TFhwY0dZeVVOalN3dHJhYk54TS9RZzQ5SzdOUGsrblhjNTgrZ09DZjdhWi96?=
 =?utf-8?B?dWgxai9XWWFEL1l5Yi9lbytUVm13eUdjY2JjaWpyUWlVdDVvdzhlM2FpOUhi?=
 =?utf-8?B?eDNWSFRJZ0RUaU0wNkM5RkFoVEh6akNrUnBQZnlDSkxyNHJsRDROVGFjWE1H?=
 =?utf-8?B?MVpSVlE0S1JFRjdHTi9lc2phaHN3YkxSdDF0WkFtMHgzdmpYalBoOXZndFdv?=
 =?utf-8?B?Z2hkWHNvUmR1QWcxeW56aEdGZy9IM01SbEFaVkw4UkNRZUIrQzJKOW51eTNo?=
 =?utf-8?B?VTIzT3M3NUZiNFdtOUFsTCtrbmZhMWY5akpUWEEyNytHeS9jWjl4MjN6VmpZ?=
 =?utf-8?B?UnQ0elBjaWFYTmhXdVJzU3pNczZweXc0NnkzTXRUcG5XMzBRWjZrdHhVakF6?=
 =?utf-8?B?VnJjS3g4eklNZUk1WWh5T0JlamU3WFU1dzFVTlFkU1crakgzWHo4VHowSk81?=
 =?utf-8?B?dGZ2eDFpRnFyRFNYYVpNNWZOdTljd3dBblkwNVRUeWdLRndsU0g1VHRuOHBZ?=
 =?utf-8?B?am0xVXJDeEhkQXFMV1VkZFVXeU5reFY3dzF5aEdMQjl1Y082VjRIbmJNUUdE?=
 =?utf-8?B?OW9GTGtBYU5Qam15VWpvTmpGVnFOMm41K0xCQUt2YW5BcWExSlV2VDR5a0Qx?=
 =?utf-8?B?S1lNUmpLVnplR25jTzNxK3V3cGtpNk1QSFlMMHB1VE02d2U4ZlIvZllTNUpC?=
 =?utf-8?B?OUMySy9vbGU5Q1V5NDkwcUNublo0M1pobmt4Qzh4OExVUDlhUHU5bTRtc0hr?=
 =?utf-8?B?UjBHdHdHSjlEMndZemtPTnQrOW1tMjBiaTVHLzY2OUJreHVjcStTaUtsbHNt?=
 =?utf-8?B?d0ZuS2FRU3phOGZaZ1daRU40aXIyNW9YbkJzQWtEU2VqNGNGTjg4ZWZLSVN1?=
 =?utf-8?B?aE5uRGpHVFlwM1B5a3QyYXBkQjRNSk1rVEZyZVVDRGI3aXBCL29oYjd6V1F6?=
 =?utf-8?B?Vk8weTNtT05yblpQSzBFQ0dybW4wWS9PZ2lnUFdrK1Q3cndseGNPQzN1WWp4?=
 =?utf-8?B?Z3dsckgvSDV4TU96bFRRQ09uVGs0OTZWNkgzTU5KeDZ5V2xBb1ErUXR6L09G?=
 =?utf-8?B?Z04wS1VYOGk0YjNmNFp2aWdiZ21BaWZjd052Y3ZjMEpqT2lIZktWZWpCS3gv?=
 =?utf-8?B?bGxNR0ZJdUxKTkllNVJXZnJRaVo0Yll4dVlITGlEYnROenlZanhPSlg1Yk01?=
 =?utf-8?B?M2p2Y2g4aDVtdDNEZk56ejFPVitvcUs1Y1JZUHp1MjZFclB0NGViL3ZnT2h4?=
 =?utf-8?B?K3VDUHlwN2NrdTRrUlJLVWlEOGh5eGJaMlplZUFJNllCY1A2d2QvbWJqdUpt?=
 =?utf-8?B?aEVLam5rODhCb0EvcjZscXJDYjRpY2hVa3F5ZGlQdHU3Y2VpWWthUzZWWFBB?=
 =?utf-8?B?WmdmcTZVdEVpcFNrWkFCaVZXSnZ1NEp1cDJUMXFvWUEyY2I0K2xuVjREN1lz?=
 =?utf-8?B?cU4vYmpVRXFUMUpCMWRHeW1uSFQ1MSt1Unl4RzlzRURNVmVNeitzQXF3ZVp4?=
 =?utf-8?B?TGZrQ2NMRjRPY1JTUXowcDFQeW9NREpUdTFxMjAvRU0rMnhZWCtOL0tzTjRS?=
 =?utf-8?B?RUJ4UmNPWVVBK2tyVXNCVVZhWkl2WDIxMUNpYW0xVEJrV1MvN2Erb1dhRGNa?=
 =?utf-8?B?WE1SQ21MdWZ6WVNVVVNFbjR3amZ5Y1A1RTNFYk82M0tjWWVkeGVpcnZhVTVZ?=
 =?utf-8?B?Ly84cjc3YUNud0N3K0JSODFWYXpETjk4bk9QWUYrSUVsUlFnQXRqZmZrVVdS?=
 =?utf-8?B?TTVtK0NJZEQyaUNMVXB4QVJrU0dZUVNrRmJ4ckw3dFNIMmE3N01Ob1d1R3ZW?=
 =?utf-8?B?NmFyUUtyMnkrY054SnV4dy9ERkdJU004MS9yQWxWZEh3d2hkY3dlT2t5L2JI?=
 =?utf-8?Q?/VGRbMnpKygp0Ns/GZ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c7fbc3-119c-421a-42f1-08df23beaa25
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:51.6824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lctglhMMMPDAoZtYtWt+V/zWyg/VCo1gsv225lOiapjqOvdN/ElFobNsK3f+jFG1eDZrjVgLY8Fz8bpq4E/OaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

Pin-init self reference is going to be a big feature, touching various
places in pin_data and init macros. Do some various cleanups to tidy up the
macro codebase, so the feature can land without much refactoring.

Details in commits.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (8):
      rust: pin-init: internal: init: forget guards in reverse order
      rust: pin-init: internal: init: set span location of guards
      rust: pin-init: internal: add utility to handle generics merging
      rust: pin-init: internal: add utility for extract a single attribute
      rust: pin-init: internal: pin_data: move projection struct into `const _: ()` block
      rust: pin-init: internal: pin_data: extract `#[cfg]` processing to its own function
      rust: pin-init: internal: pin_data: rename `'__pin` lifetime to `'__this`
      rust: pin-init: internal: pin_data: parse into `StructInfo` before generating

 rust/pin-init/internal/src/init.rs     |  19 +--
 rust/pin-init/internal/src/lib.rs      |   3 +-
 rust/pin-init/internal/src/pin_data.rs | 217 +++++++++++++++++++++------------
 rust/pin-init/internal/src/util.rs     | 189 +++++++++++++++++++++++++++-
 4 files changed, 341 insertions(+), 87 deletions(-)
---
base-commit: 499b8f8a5d0401a6ab83b346a307f923640a024a
change-id: 20261006-dev-selfref-dep-df01df1d05bf

Best regards,
--  
Gary Guo <gary@garyguo.net>


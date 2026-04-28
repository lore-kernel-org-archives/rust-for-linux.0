Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1D4534A8;
	Tue, 28 Apr 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381884; cv=fail; b=q/Z5tVisZ5RBmtZlN2z01QXhqgGuYXXDtqVQMMmVeZ8BmLSlGfjmPqOsQ8tedBy90yB9Q4zVuwR9C6elHBuQ+9h57BkJN8H3RdAG+fJPuM/NmR4qWz3BtHr/GVJWrDtDQ2q+NG5Kp+zgGAcm0aAnNO1DmlqY3BMPd8C54yyyPUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381884; c=relaxed/simple;
	bh=3Rwt3zzQHty8Gm4snbuEPik+ZHfZDu9bOgUlGqRP8ps=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XZjcR8XeL1eWjibmTDl5KtCNxwbzs6W4K7XwFCLVbPU+5Rru3iZoYvDUH99+8InPTH2pLFbTndSgj/YViS1OT1cKSopfe5zg3TjStRb7yUy1tuJ3R5lxDvFkTwhffoU6LQCXW8xba8JnQVZZ+5PNSBb7i0/J63uG7g4XAbo8nQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lIk8U6iv; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lIk8U6iv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuNoBm2lfddhUJkvTRNGv37xJuIBs1HXNqT3m8XxwnuRETqmmE3L/g7MRyAxpbKNQbvNjdS4g0Z54WW4I1aylpbSgKV7MazSwNszi+V9/e24/hXOleRt6oa/5rqAo6+GOuZ2EUUH1PMR2LBR9lKq+CXdrkjDH8dN58CpTQuSSV4/1LN+ZTDFdt2AuzT3rwjRJeISc4sKMOqOeffSRT15uyJUZCSJj1oN/5L3MFv0i1+TLHyfRUV37omCRKLB1Zef+u3IxnIImk39sK6GWFsGk5UTbYbKegEwydbPtvHbYpSS97lLnjVBagpXS2NPc2krhCW5jCNMkYQ9YLysfXYGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv8xUUmNfVsLphLzVsMDkVszu/fCCNLM6fIp8IxYu5U=;
 b=HJK5JspzapYAmma8HN93muXfgzEDNhwFhGDdk3ZXTjMAZZAzBb4R06MRO4ZQKarwngxVLHcP+2o6XJScNKOynMSJkseaNf0/pcwtkaas5ApTmsV5sHDwaFBOUAcQbt/weWgWtk9NiNGVMhK3JTw0b1HtxaxpVOhh0VJYI0VMMJ+4gjUElSpScXdiB/mCtEypa/ddY2PmCgp5NvHLjYbyoD6WIVkum652Mkf1IA1uYwFWmowughpfVCDIXY1KOhRYfVzwm5WXa4/kd98F81sDIgOLa+Eg0CDJbCxl3Th8VImVRvsz/k6Cdc6YGfpQPQvrsbYVUPiJJhWR4CkF3Jdjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv8xUUmNfVsLphLzVsMDkVszu/fCCNLM6fIp8IxYu5U=;
 b=lIk8U6ivX6fnr5ZLCNCr0h00iA9Mx/L6qogfoprnGNk/kH2S0aedcLSZOnTrvCdJ9uRHyW7fnWRXR2TwubFLwjHk6OyX19gSxA+Gi51Eue8aAb9BSjGYwDmBtWtxIuF/P2AgxTI2lYt6UtLDz9+r8/5Zd7/sUmxw/VIjx0iZbNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:13 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:56 +0100
Subject: [PATCH 07/10] rust: pin-init: internal: adjust license identifier
 of `zeroable.rs`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-7-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=948;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=aT3akBHTRPKIoYgyL4LPcy8dQ5L2NOHcw++JOY5ud00=;
 b=fwn6dlZWVRUT7QR8emOjjqbzhJgIV2MRLbHojhhQ+e3MbUP3Gex3mx9Sfm3nQhSnjVJVwkm6w
 nEtsiRZNekgCKm4+jGyQaqdBzcf5MrwpcnBRs044i9CPvW1kJQjj3V5
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6f26bb-a564-4936-faf2-08dea5279eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D18Ck76YEwn9XdXKiKupNRNpt3ZtHcAE8pAn0sMVO7Fp+KtTc4MwY8Rmj/Cz8wfux6OH+v6wGDJo6LsrleBRR3CODKsAi1905kNYEbmRHPiuWn3q0XChMfvYVwqxpfQoAcnPVIP80S6imHffywyEP/vhYyA/0WCuK4omRKLaYV2sTczczXuf2nWxVsJMcjYEmfu+yPvFx8g/oXBy9aS+D8YMYoz8EOjCvHNqbnniSJ4Q3K8M1z0JUeakKngGm7WcK3+20G0ZbsYUiNFqf6z4XMkxsSoV4TBTYX0b5D0+FSKQxu9/WY3DtK/PkMEXIo85XjjNpzIs2G+MPMh7IUquM7JVLYjwPw5UhCLm/DJZ3RAA6N6dM11epfbfNt5cboFf1Evi29ClLWGkVaDIot506yHiu01opXpUL0dtBJpE13nWC7OBF08e1eU+VmjkpX25eSwZZ6mYyhsCfXknUkERrL2S9zrJFen/vIjCsgLa6dX1zGki1qlVpUdr/lp44wl31j8T17umJC0UE6Uf6PXwJ/1sRX9af5rO7g7G0x3whE5OMPi2pnEpqSWTQaPcMkQM5L2zuJLQY0H29ASQaJvyz4WPvJV4zfVSvYRv4PLXx4IVtPiA5v+GNmDZsyL92XXSrM4DQ3gJ9MN2hL7emLvWf6x0Fy/bvW3sBTdfh2dBJKeYuO72v8wpUOYKwZmGi9j+1u/OAKHDS8zgBA/+ThxZk/vrRyI7i2wEbS9vz2w/Xpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFIyZ2prWElEdktsaXlGOGxUVnpSbUphZ1V0UVVPWmlhVnpLd3d2T0xXOFhH?=
 =?utf-8?B?YUtwVXFRR1FMVWo2V2x2c0U1bWMzbzJnZ2hKZmMveTlXUWdnaWVSZ2oyMG5w?=
 =?utf-8?B?ZVFIaGt1ejAwOGgyN0xVRDUrQ2V4NUh4UUcvNUhBUVJ2NGZmZTZxVDJ0QTV2?=
 =?utf-8?B?OUI0aGVhaUtmcVprNFNqb29hdTM3ZkhHUjB4Qk03S2VFZkVZa2JUUjBWQlBH?=
 =?utf-8?B?WmloN3JpVmFZeE5tYlNwbEtnc09oeEhkdlRMVEUwSVlnV3doNWM0QzNYNzFF?=
 =?utf-8?B?blZpSGlFcXhLYWE4akMyeDh3TmRBdi9ueXQvSFVtVEFzUjgzNnBaRjB0cXNO?=
 =?utf-8?B?LzFhNmgxdTd1ZHhTdGI0OHJubnZJTUJQTThYOGVhTDQwTmtpd3hDM2pWVnJW?=
 =?utf-8?B?OTRjVDJONVpPdnZYbEFpa082c3l3aVRQdWpWcVlkdG1ZQXNtS2wzTWNzU1pU?=
 =?utf-8?B?cmdiOU1SVDZZcmZFQzM0T3k5Nmp6NmZkaW5Uby9wWnNvNDR6VE5WaVFnQzB4?=
 =?utf-8?B?MDZpcWZtdTVRbEY2bDBNcWxHWDVTbHVNTXRFaWlOUitUU0VtNS9ZM0hlTklH?=
 =?utf-8?B?bHZNaGU5M2p4aWV0ZVFsZU1XbFkrMXFrMnRTeVUwU2pvbGpqRGJud3hQcm5n?=
 =?utf-8?B?UUQzRG1HUVduTHhwVnRYMlg3V25rN2Qzditmc1FsZDBDZ2hZMFlvd1o3OWZ5?=
 =?utf-8?B?czlNZkF4SjNqUnFHTzh4Q3dyTXJWc2hFcUNhMG9TSmZBYXpGWmI0R3hEZXp1?=
 =?utf-8?B?VXNDN0tVUWJQL3FTZWxncHo5emxtdjgxOEZMQmtjeGdXR2N1QmZoZDkzVE9L?=
 =?utf-8?B?VmE1bEo2Ym1wczdPbWhkN3QzM20xM3I1a0xRd3h2aFBtVlZ5VjNSNkZoaVZL?=
 =?utf-8?B?eHZVS1FLdGR6NFQrb0tJaUlqMjQ2TExMb2padVlaTUpCK1M5R3p5TXVJYnZM?=
 =?utf-8?B?aTErTHgvZkV0cTZtenl6Q3Jvb2dyMlZSSlRPdlBaaThKNDZNd3lmNHNuNm9n?=
 =?utf-8?B?YW1CUm9MVGRJL004VERWcC9Va3V0ZTZXY0NzcmFjYXZzNHFBbXRBZy8yWUo0?=
 =?utf-8?B?ckdLT05ocVE4cHlCQ3ZEYnJ0dmw1K0RGTytCU0VBNEp4Wk5rQjI1YWVoRm10?=
 =?utf-8?B?TXM3YmJkdXJOOHFvTVFFWmVUcWpMNmJiTkJDMS9Ia0s4VFU2UXB1bWRmbnhz?=
 =?utf-8?B?a2FOVlhWaE10UVZpYlprVXI1UjVBRlB5eG4rWEtKUGxJRGdBRFJvekE0TFZG?=
 =?utf-8?B?bzJEd0FMeDJzZjhRUmEyYmJNSXpWS3BtdE16VUJnTlp3SmQyZFk0NmtoU1V6?=
 =?utf-8?B?MmNsMThRNTNKVy8rN3Q5b0pMSHFTRGxHQTZLaWo4UlV4Z0NmY2FSZGpuemxR?=
 =?utf-8?B?a0tFZGJDNE5VQnFFZWt5UTE1SjZYd2Q1dHl1VVVlWDNMUDRhTXVQcURsNUVT?=
 =?utf-8?B?NjV6czJ0YWc3NzdROXlFUXR3TkZJWGd2ZHAxTlVNZVBKcXVBMGVDdWg4Vk8v?=
 =?utf-8?B?UEpPU3l2T2ZCM0hFa2lsVkJrSy9ueFB5RzFrejdjSGFKUHVSRVQxaFBMZEh2?=
 =?utf-8?B?K2VuNFJoQ2hzSkdQN1pjQlY5UitJNU5ZTUZ0YXNvNDZlY3R0WklHY0NlRWpq?=
 =?utf-8?B?RDRySFJJNzhuOCszRUsvWnZ2Q3hzMGpjUHFpc0NyUkZheTZqNUU1ZlRyQy9m?=
 =?utf-8?B?YVo4ZldoNWZCNnNMYmlzTC9IRDRMUlpSNlhDMmR0anJUL1ZVZld2ZEljSTJC?=
 =?utf-8?B?ZlZEelNjeU5KTktuQmo2WEFkSEN0bm1OMVZwQUI3RERnVlZQRnA0UHREU01P?=
 =?utf-8?B?WHZmbWZZeWdxN2VzTHVsaU9NYmhKdVhkZEY1K2Jva2lyS0RESjNVR0MwVVox?=
 =?utf-8?B?NmhZa0RCTWlvLzZ4U3QwQWNxRWtXc1NYZmxEMHBYcGtlVjZGUGpHTGdxdmdP?=
 =?utf-8?B?eExSZHRvM2VxdmJDOWpNM1hqYzZ0Vkd2Nnp4RmFwYlpjYk9kUUJuWEhyTFNB?=
 =?utf-8?B?YUpGZUhzT245NzU1MkVKWkFYQ2hkZmFlUFBxVEt0V3dnaFV0bGk4VFp5K3RT?=
 =?utf-8?B?MVA4STNvYmVuUHc1Y3ozdmg1anZ5TndhQUpOdGhYclBmdUw2ZWl2dE01NlAz?=
 =?utf-8?B?Wk9oZHZ1M1VPTHRSTjRXdGdJcy8xSXdraVZnVjVmOTVxWlNmUVVkSXQ4eGZj?=
 =?utf-8?B?THF2cDlCdUFpQVZ5c0cvc09vRTlQOTY0TXNRU2lsS3E2amJDWWtac0R3d1FB?=
 =?utf-8?B?SWgyNzFxREpaRkFlajNKUkxTZW1NVkN4RkM1UE5lS3lEcEtjUHRWUS92TWx5?=
 =?utf-8?B?THdzbWVKVkdRNkhxWSs5dlVkaGROdHZPNnl4NkJkUDVud1NFL1Fpdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6f26bb-a564-4936-faf2-08dea5279eff
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:12.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeRPMo02EI/FIB4ORQC8ic1XAlkMxC7mH65T2M7WMIa9rTmbWiSaoscate2kcQ39klT/SM2eFrq+rtCWq9mNdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

From: Benno Lossin <lossin@kernel.org>

The pin-init crate has been licensed under `Apache-2.0 OR MIT` since the
beginning. I introduced in commit 071cedc84e90 ("rust: add derive macro for
`Zeroable`") `zeroable.rs` with incompatible GPL-2.0 SPDX identifier. The
file has not been modified by other authors, so relicense it under the
above license.

Signed-off-by: Benno Lossin <lossin@kernel.org>
[ Reworded commit message - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/zeroable.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/internal/src/zeroable.rs
index 05683319b0f7..b11feaeb1ca6 100644
--- a/rust/pin-init/internal/src/zeroable.rs
+++ b/rust/pin-init/internal/src/zeroable.rs
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::TokenStream;
 use quote::quote;

-- 
2.51.2


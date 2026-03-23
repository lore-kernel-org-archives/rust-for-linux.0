Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC543947A1;
	Mon, 23 Mar 2026 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264091; cv=fail; b=kzqVh94ati5dGng5odLSj77epjHUGHZ/x8KBgNtccZjNYnOIlXL0B5ztgQ9Ak4+OcvMOJfL8/VQo4KHfVZsBvHwc7dMRwRGQTtECcqELNyX1jJPQWeFGhZuUwwewSXsBLb0beexzkc/Zahx9B98Zd1yzBEQa6Fej+YJA527kQ+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264091; c=relaxed/simple;
	bh=fYR5fnt+CA8srhpTGYQL66KSvruBYjwUFbdA66Wjs84=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=daUSN/46DPG0cZXiZnssVGNI02NZFmdnfGDQdcbtu+Dij695Z9OI4lmChGsA9HC0KIoKvgtKOBwDg1X5FkzFa+Iuc8g9Dk3YcVnDA1NrH6Nj8MYB2L4v+XNVA9QcgwbqO/MpA5KAgknOtRDWImlWhoCuKqsYlqvPztdfn8THXEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RE+xj9h2; arc=fail smtp.client-ip=52.101.85.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RE+xj9h2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISTwBJeOGcMAZYHOek3j/uquWvqday3SM5L30rE1/yEV1UbqmzC7nsa782kFPogxwelxAPVFcPeZjehJuy1pzyFvmYO+2r7YsGfOZPiLEckfVZw1Xfpv0KWlDgdGzFnziFj9IQxHatoPplFMrQZ6Dotb1GxoM0JM47bBtgwvI3xFVa3/9n3JjTtiGypDQookLcatB4tjVlP/oR1tvpN9BLuEADnZGZySiYkW7utsICXzCkuODGdRpvJeduBgl1ooC7Pl9Larn8FOzHDGsS6STdOd8VK7u7odsztvtxFaD/kq5tj4/Seqt5JG0c0CyTquxdstXPA8E/KtxdzaVRjWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLm2aSdzoV70cjF/H/z78ceElbWDFnO322CxqZBrtT8=;
 b=IIo+y49QBh92QsakkPzE2Jw2oLhbb90ZkntkS7ER8raduxLIvx9UJew/xas/vUAktmiTvgfqg2jB7RmJsMlFJysGqcmF4a54f36WxgHKmk1tkzDidXHZuVRTaUU6bZax2akvQbjbnNXy7Z2W6S9cjbKnjRSoMlbUBuP+OoHrhU0cPklG6KR4jD+CyMg6THaFlpRjZU/L8ikc6qXzXvZZGt55wa/mi12d71i+sMGEI+WDXIoZVzS2liUTHrSCqd6k6PxF98RfSP5j2IQfcYPTEamXK7HkCOlE3/DvzYkWQrPF7EKSDpDsNeP9oF85s81/7grI+wkZ7joWne9SduCzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLm2aSdzoV70cjF/H/z78ceElbWDFnO322CxqZBrtT8=;
 b=RE+xj9h261cWNbg7EQ8kMkgHDWNEhGgmnc16AL3POUUOD0kT8EML83MXBveMRIGPS0MGd0NttHzIqIY+dO8oQVRjX65aqDKVosPqj0qA0rYbXfCU4dvSm2eImHskr5nozMtamDCzrXrDi0X663D12HykLobNwnlafK/FX9KgB4tEc9ARhwQWOhCA9EoHrSAijP5Hk+16AsWs9zVJYrpCQa1QmZJwrrfK2JmjcQJfJLTBcSUUlOs8OaTOICa60jjjr9V5lkIMWBWRNrINDlF0rtE6B4RmB86z97+TLqwn2YRZfTxWKkwXzEowFtVRxzNBHk5Bje6o0rozpMP7Qy5Uxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:08:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:08:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 23 Mar 2026 20:07:40 +0900
Subject: [PATCH v3 05/10] gpu: nova-core: convert FUSE registers to kernel
 register macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-nova-register-v3-5-ae2486ecef1b@nvidia.com>
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
In-Reply-To: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TY4P301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: a28f1f4f-b264-4f96-3cfe-08de88cc75b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UbVhVfduSTrblu0bfzp+37iTGUVeU1LGlJfgqZqIwULL4ljoP1KcbIA5AbnrZEfl+nOdb9aKkSKYXAvECXUeImvgJtttFqncOAmTVJEY8f1MJeQKQhnGwgXAj0eNFOa2E1DsUv8QZ+CFeXxOKRNjlWZSJF5eiR2adEpTiLH5xqMYsEtdotQIAo177Sp1AgBh3JKKAhg9aH9r5mvWtlw7Un50pmPKEKpPHfUWZxxQMVZOQqM3jwNWpOS8vTrLYJxR0FavDu5HHYopf3YQBjbBGFpMpFA1Jhej0cBezYBFYSqqt6FHubZ5zu/sC72VTcNWd/e07jNlQg82r/ZmxWzheYdQbdmhvnQPcC350b/a9EvdAgLcopMOjtZf52tnBCD9Fh05K7uTIbFEgL8Bd7RJnnHofnIA3bWMlvGIZGqXyeaDTKgXlz4oP+Pk4Ykwtfku7tTQB13X6LwHQhNs8GAoH2/2tryRPXm5kLYkI0ZVF7cGywX907YJVBfmrIwWQEPFJGo2iMCIkDU/vA83l/yOR3dK6lAxdtQHjfwKzJ6ES9nweNk3drkMpF01he1xvueGnjimwgehrVq8uXN9vrYC59yXOSyawkVEhVAlXZzIH/YNDOHKndLqtPAc1aXRw1b8gumcbyqXrhG4zU23yieJO8VXoky1cpI2kK+wCMGjRF50820PwifLyP90zZOEWxCtXv86QOnpWxcsD8Uagnx1C2xJyMaM5o1xEhN+/lKtDk9Rkz50kERZFzozLX+cFIz6GcfpaNnA2qudNKHW5/g5UA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzhYN0xBOXBmZDdzb0xnUWYzQzhDN0F0NXBvWURtbC9HQXJSM2RJNE1NT1V3?=
 =?utf-8?B?UmJOcy9UeEZzV01QZDJKaTkxRkJ4Y1hKbUFUcWJzaU12bEpwWDd2SkRINXpa?=
 =?utf-8?B?WEZBQlVHemgxci91RXRRREhqRm5nMTB2dUtTdHIzUWQwVXRTNmNlUldDbVVT?=
 =?utf-8?B?Wm8xWGhPS1VzWlhhQnFaTGcrbDYzRDh0c0UzNTl3N0ZGbHBCejAyT0xWMFRh?=
 =?utf-8?B?bzhDQnhwK1pqM0ZYSEszOCtwRVdLV2FnK29ZaTNmYkJkNzR5dDFFaGtKUTBS?=
 =?utf-8?B?aUgxM3pzZWt4aFgyMTA2RzdDYVZmUGZpaG8zRDdBQ2hNZUVMMUdKL1RWOHEw?=
 =?utf-8?B?a0tUb1lyUEEzVmM5Z29qdzBHeVVQZHpNaFNpUVJkWXBqaFlraGExUG1GSkFN?=
 =?utf-8?B?TUtKMm1nSkVmNFJwWXRLVXE2M25qOFdsOHNIUDd6MjZ0WktRL0J3UzVrWGFF?=
 =?utf-8?B?SS9NeEthSlVLcWkvdVJiTEhsTkNEWkl2b3VRK2ZQbG1qelpPZVV0Smp6RHk2?=
 =?utf-8?B?c0FzVHlhZVhmQ2dkRUNxL2t1RHFVZXlvaitSUndsT1ZKQmZheGdOdjdnaFpY?=
 =?utf-8?B?VEw0VWtES1F6YTE2R1BaeFF5eE82ejgvR3VLbHdIS2FSdG1yMmlzRWV0bTUx?=
 =?utf-8?B?bVVMZVk1VXVvU1BuSDBmMzVudHp6ZXVuNUw5aHdOVFJhUjY3eTNab2pVRG1E?=
 =?utf-8?B?M0RtcFFMTkZGWDVNdEQvK2xUdzhFVnd0S1dqWnhLcXNuT3ZLMFN3V3VsY1dz?=
 =?utf-8?B?NFZ5akJvNGpoOWplT0ZlR1NkbUJyb2tRcytUc2dUbEsvUmlSNnR2b0xPZHBW?=
 =?utf-8?B?RDV0TEFDdkd6cVUwUHU2UkJHU29JdHdOdThTMTB2RERWdW54TGxUN01CdENw?=
 =?utf-8?B?YUpEcmVEZGdSa2J4ZVYzMm8raC9lOU1TeEVGbWs0ckFlWWNBbkFkeHNSdFo1?=
 =?utf-8?B?ZXkvOVQ5Wlg2YjVaMjFWNzNXcE5icHVIT0JMZXhKWXhZWEtZY0pOZlhld0Uz?=
 =?utf-8?B?NmNSUURHMkorOHVzMkU3Tld5ejZaQ1lQMDdjblpzNHV3cmFIQkRqWi95QVFV?=
 =?utf-8?B?Y0MyaXEvMHovUUFDSXY3MmJGRkZ4NW9YOHhtemorVGJsSmtQVGZtdWp4YW92?=
 =?utf-8?B?RE9CZVVGOGIveU16ZDVHTTlmOVdyM2I1WWRFb2crS2FPaFBGZExCOGhyYnR5?=
 =?utf-8?B?bnEvMzNNeE11Q2hwREtERitrL1JJOFRCZWpKRmF1cmlUVGlBcExKaDBVMWp1?=
 =?utf-8?B?aUg1WTZVTkZuVjNHU3pWQ29lS0FORGk2KzlERld3RHhuUWNBaWprOFEwQzhF?=
 =?utf-8?B?OWRmZDZnMVdBL2JCRU12V0ltSXBad3FyZGhqMzl2cS9keGNHVEJtbythZXUw?=
 =?utf-8?B?SnpOcnpLV1V1YnFueHNSb21uVUNOT3Y2QnZRbVRSTTFjci84MzNacW9nelo0?=
 =?utf-8?B?dUxxbFVYendHNFNMUFYzemdCNUxRazA4WThBWUYwZTVTYWF3akh4TXRJdVcx?=
 =?utf-8?B?UTdWTXZoNEpIc20vMGtsdDAyVWJ1RGgvd0lKcVZHWjM4VkcvTm1nQ2MvYmFa?=
 =?utf-8?B?d2tmUHRkMDRHQlF1bHFoSEJqYkR4eE0zbUpteVlKQytMTC9CQktTYlZSYVc0?=
 =?utf-8?B?QUpLbmVvS0tkcmZCTGVsa1J4MUJkaU1teW5KVVN0U2xRNVRsdTVhN05iV0p4?=
 =?utf-8?B?aVU5Uk11cHE2MU9YellGK3JMK29UajhsRHhhbFdJM1pma2p6TWFJOU5oL1NE?=
 =?utf-8?B?ZlFoeGxRK0kxWnlhcFMrb2VIWHNlVVJIdUN3TkRYaC9hK2tuZVJlTE1oRHlR?=
 =?utf-8?B?Wko2NWM4R2ZKdHQ1dEJCUG91SzdkM2VzT2hPMWpSbldtbExqV2FvT3lBWG1a?=
 =?utf-8?B?VFdCdGtuMFVBdkRHUkViZlRWbFBUWGx4cWwzaFNFVkdrQTNxbklUNFZuKzlH?=
 =?utf-8?B?dmlucGVlZEVZSFE1ODhMSkh2RkFoTGZyZ0krSWVGNWJITlo1MFhjdUh0SHlr?=
 =?utf-8?B?aVNha3JIWDBDOFJlVUk0dVdvOXVRT3ZLa0VDTkZIQzk4dVZKT1RtZmVndnFF?=
 =?utf-8?B?MzltZmFCR0N6U081TURNeFJHMk9MdzN5QnptajJyWndNYVhZV0JHOFVvSFNj?=
 =?utf-8?B?YUVPUnVCekpkby95SzNaeTJEMEF6TEN2K1VCTkJkMDU0QlRpY1VSd1FPeHZ1?=
 =?utf-8?B?VllCU0p6RjljcC9DS1l5SzdHMlpIYlJnUW5iV2IwOE05ODVEdUVod003NkVs?=
 =?utf-8?B?N3pLeURiNE9mR0F4aU5MeDk5bS9zbUM2MXVjb1h0RVA0ZVFnS2VTcy85WUpF?=
 =?utf-8?B?ZTNCU2VlRGR0dUJONGx0bFhXL0M4Qmh1UmdzdW9rbkFnbitPb20rdFVlcnJx?=
 =?utf-8?Q?Ee1mQZCa2/JZUWimAGUEoD9DUgczVZuakrdOVWtfDO+YJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 0ksSIhAWLCTCTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28f1f4f-b264-4f96-3cfe-08de88cc75b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:08:06.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evZ0Sf/5dlnD4fwfAN5yf18HCO+AXqCocALWDSzeNkthirEdh5AHkJM18Ulnu9JR+uMy7sRIGDw62QRAX2AQfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009

Convert all FUSE registers to use the kernel's register macro and update
the code accordingly.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 17 +++++++++----
 drivers/gpu/nova-core/fb/hal/ga100.rs     |  3 ++-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |  3 ++-
 drivers/gpu/nova-core/regs.rs             | 40 +++++++++++++++++++------------
 4 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 8f62df10da0a..cbdf36bad633 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -4,7 +4,11 @@
 
 use kernel::{
     device,
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::Array,
+        Io, //
+    },
     prelude::*,
     time::Delta, //
 };
@@ -60,12 +64,15 @@ fn signature_reg_fuse_version_ga102(
 
     // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
     // at build-time.
-    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
-        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
+    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
+        bar.read(regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::at(ucode_idx))
+            .data()
     } else if engine_id_mask & 0x0004 != 0 {
-        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
+        bar.read(regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::at(ucode_idx))
+            .data()
     } else if engine_id_mask & 0x0400 != 0 {
-        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
+        bar.read(regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::at(ucode_idx))
+            .data()
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
         return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 629588c75778..1c03783cddef 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -40,7 +40,8 @@ pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
 }
 
 pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
-    !regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+    !bar.read(regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY)
+        .display_disabled()
 }
 
 /// Shift applied to the sysmem address before it is written into
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 515d50872224..281bb796e198 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -29,7 +29,8 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
 }
 
 pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
-    !regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+    !bar.read(regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY)
+        .display_disabled()
 }
 
 pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 6f49467e78ec..61a8dba22d88 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -270,17 +270,19 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
 
-register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+io::register! {
+    pub(crate) NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x00824100 {
+        15:0    data => u16;
+    }
 
-register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+    pub(crate) NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x00824140 {
+        15:0    data => u16;
+    }
 
-register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+    pub(crate) NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x008241c0 {
+        15:0    data => u16;
+    }
+}
 
 // PFALCON
 
@@ -491,17 +493,25 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
 // only be used in HAL modules.
 
 pub(crate) mod gm107 {
+    use kernel::io;
+
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
-        0:0     display_disabled as bool;
-    });
+    io::register! {
+        pub(crate) NV_FUSE_STATUS_OPT_DISPLAY(u32) @ 0x00021c04 {
+            0:0     display_disabled => bool;
+        }
+    }
 }
 
 pub(crate) mod ga100 {
+    use kernel::io;
+
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
-        0:0     display_disabled as bool;
-    });
+    io::register! {
+        pub(crate) NV_FUSE_STATUS_OPT_DISPLAY(u32) @ 0x00820c04 {
+            0:0     display_disabled => bool;
+        }
+    }
 }

-- 
2.53.0


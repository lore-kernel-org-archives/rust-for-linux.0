Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1160C3B7B8C;
	Tue, 10 Mar 2026 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108735; cv=fail; b=MsFP8MYOqucWFn281EuPS8IhtZQu9zu+9UATTz2QnAg7vWpT/bAGIQAQwdbbpKrDUQHqire7VZ1UKCJJj6yZ8OxPXVqsqi+Rlfk2FJMsyyARsDNcbvOWm+E51kGPtM8UP6g77eUHXx1pS5HUI5AReb0tQUPJOrQHd3kTiAU8wNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108735; c=relaxed/simple;
	bh=yzNAEOtfuEpkfKlBHX9a5oNO4XW0zCWlxp3D9uSXGF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iK29nJ8GfNuyTk1xYQKlzi716d6uOpLDRQI+mCLmkrEtZVmj9YQBzwIxM6a4UcCmfyOEeViJyZ6zFHIL8B1a373OwB1NF9g3FuCoGOQOU0pZWP1COpu5iIPTjX3+ovXEZ30D0C1rkK9gPDODRADuqDJM3dRvxLkLbVtTqBUi+Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=neVrT7/8; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="neVrT7/8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTTZpl5V00HkfnXb7w9cfE2bPEuHQiAyXLXlRpFmn94BnXvtKNQtKzXu6aqUt5l2Htty6n/kbANDGVeNUBihZWFxT+L69Th+RbEFKa+PoNchTKBoZ/SQOK7Z3LpAHSv0gypTxzNC07EI5J49gBTyRyDh2K7JUSkR3zf74XbCi5DxTRuIDz2H7vaMAywo0SKjlrvW9rMqOBYKA8UQ9v5jbS7CU7fj2wYr35RuDxl65nDfd+tIqDb1RjRycUPDnn2E7GBoT6tDjYSeYpU55IJgwWTISlLDf2meINXLspGCoIaV+l6Uv/XyhNIcIJV9wxWCPiIRJg095BwNPzMV7UvQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UC8zB27lUsnz/uQrR7G3n2lV7FXoLkomyPS5nWFuBU=;
 b=eyznt/Gdakh5u64seOcqakDi3T2Y+aT1VEuBvIh9y7NKGlGYnJJGsqo8SftYimb6Yw3R70BAyUB1ZZvEGjikovaWl/VB5n00M8j1NrIdtsDIjfz0i+IOIQjKPZ1Ub8Fa+ehW4Yys+oxIOREyGLsQKaxTIQwz+aTVQLT1xQr/vhH9Tnp5M7PbdIIu57agoN/j/TZCb8qE+QSKVdTb44Dyt5a8EZD9c1uCaoxSARy8FYVenfeTs6GPUzdxsr3xwB9hTvu0NHbgbqKtRufCwY9qGyoofnHhk4EzNuWTH0ntCC6sHr5MmVaSrmbwEeyOhhfMEz9ZzFbAxl1BzIz08owYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UC8zB27lUsnz/uQrR7G3n2lV7FXoLkomyPS5nWFuBU=;
 b=neVrT7/8SjjhWAyxKYSBIOSDVvAsrsrAapycHWKqSGOOrld7zyCN23TRbbnCS1TDLypcEP3IW4KyvRGkV1U9vnA0B/mVBYdEXZHUac1xusCOwDI21tMTcyzr3ixHRkB16qNRgNluhN1eKKl29/I3/SHqd9cNoBpHqbhBFy7ABR9MXb3Px7UM5BjSFPA3p17w4G3+wGcndEoxoRFUPQPDNXw1DhSzCBV7fBJ2zvfKUeIyTZNS85ciryGegclEKEc2swPc6JS1Yb2SyL6ypy5O7ad9RYoj9shPHll7nk6xZeuQS2lbOlfl07W9nHQM8x7L5+uI1hrEVk91i4A96hjMmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:59 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v6 23/34] gpu: nova-core: Hopper/Blackwell: add FSP message structures
Date: Mon,  9 Mar 2026 19:11:13 -0700
Message-ID: <20260310021125.117855-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0004.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a38086e-a87f-4504-7c26-08de7e4a6932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7142099003;
X-Microsoft-Antispam-Message-Info:
	hknuVHuL3z7X0LOk1M/TuRQ1CTAb0WrUNL4wdd58rbTRK3Zq2T3dsVi4SvIJm3Vr7xpGkPvmlW5Q9xV9s81ZMCeZoXSy/chhK2+5uDCLqSZqO4Q2Hf69rPu/+GdaC2aRyzY60/3TvtfS5GhqDxjBiTud3Kz9LTuwqu4LNHxTu9kX/NsJslksgkDkQmUjPwV7fid3UlqrgQs3Kai8lPTYX+RN19xb6tNCE4TDs92HUjO8iFAqNXR1wD4sw2C1m96rUCgCe8nlRW458Id0myX9ZdwuJPz+qvPg/kULMo+dxVv3+xrJGcoohyc06WktnLtprTnfenA+VczBWl3nEYFWQNP7lA5w9xdfCIqtwDHPWi0ZAoEp4Y9hxOrjmWscc5SRpeYyPfdu3ExOAvdd+VOAucTNbEVuOUdN6+TtSuc22rNuMtuNQ+MFnTt5pilAPVpbU4CpL8GRmc4Ggo3g452OGyzpXFKsUavQ1GF1IEimxjvCLxwMnx1tZNBxl6ZhqV3AXt6AMRL5OmdtyT9PE9YXRhHTGw7mH2JhiWvr/Alj4d1jQEuyAFb7XhIKSeb+jozQ0LGA2+rZviFlHcUp70tn8RYELRCSSz0Rt5grLCN1NNcdmn/aQAYbjzLUAbsXjwvqQsWR1q9jBPOTjr/mREGpC6yJ3XExBHtD9RvDe/IOVK/T6JKi84ioMGLv9tVCkvxdwVXzla/zaUgx52glKO8DvqxQvfvjPTGGW/d67v63BKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PjuNuYjIUTgKgBYh7SyNEckC2b7tScdnL6JaKZzH0KDavWPkmktcDOWi18Wr?=
 =?us-ascii?Q?fILgSd81svc1amzWxn1Ppm3oFUIOvLxKJt7v6ao14hLy+o4r//aKILnjwQo0?=
 =?us-ascii?Q?QtILC0zVgyewTjr1HNEys+S6rawO9Q847a6zJbEauk2P7JAITXL/M2qk3OAJ?=
 =?us-ascii?Q?Yga9SRW0TcXoQzi3n9LE2kIV2XovoSUPCaNSxeDF72pJNXGI1t/NrQDVddSW?=
 =?us-ascii?Q?cqPtyL8T1AKQ+5d4GAZogEpL+nuOf1ZzO4PNDUMLcXtXUE9OiwNtQSkPPxWq?=
 =?us-ascii?Q?0yL7j4YOD1aNtI0WSCBU2RuVAeJlLons78NW+vKkeD0ofWjXjpsf/p78qvfo?=
 =?us-ascii?Q?GimaPkCan1rjpVC0QHS0sJD0pFP/mR/6XpLCavG8TqZLionvlmzNjPBHLlrt?=
 =?us-ascii?Q?CYK1pHmFwpp/Av9L4bGQspBdfhrvDgLOgKLcBl9KL+7PHZwsDXTFDfPrwT0H?=
 =?us-ascii?Q?NGOov9YglkA2XOQQQ6p5QAuVkUU37JpFBz7rTBRibLPodcaHm7sAwCRTyvod?=
 =?us-ascii?Q?DlYa+Vz4+CNtP0/K26YvmP4jXScOgLPAltBN+KHrL7MyHvg08VBOc+bNnDiv?=
 =?us-ascii?Q?6C+AEgv0GMm9ZKTQ8UpSFoav85Qx/b85ed4/y6hlEmxnA6onJUAgznURSynU?=
 =?us-ascii?Q?FUoPe44F9wHL5yyBDNG7pPWGz8yeRHU834VwwKtTymzd7zD5st7njFlAdq2U?=
 =?us-ascii?Q?TDGQKxppX3VBbzsHAydbrqKoShnqnCi1iBAGicVZUJEq3A1SAtr6egsSOWm0?=
 =?us-ascii?Q?yNUEosUdS463+WRBjHeDpS9mPw8dkBlcmnqWFvC3gaHDsPHASNGgMorycHkz?=
 =?us-ascii?Q?/SjMUB1ahdiaLEqrVbS5MmGBjOsi57v4GiNrhpszB8tmqgCRwv2+jtUpNR3/?=
 =?us-ascii?Q?AC6wBGU353MZ5YBRrZ7peI77n22ytHrJYO/aZ4PzSXHQ7i2aHQLBLeaPG+at?=
 =?us-ascii?Q?zLHFki9SIzcj7wuaGxPjWPGJ3FwoLYp5PsrGM662kj+FqQBrr84tmvOavkPG?=
 =?us-ascii?Q?PmuEg8cw0+R9tcO8IW4LtNRAh27DMUmGj73303V2mNnnuyl/KlNo9mxsQOk5?=
 =?us-ascii?Q?myz+dR/jX/WbF9ru6Ha/CaGcqLG0CA7BOOndRhr20IE2jTLkW/AoX6h3+MJ5?=
 =?us-ascii?Q?xwuOFjuEMFumOXVDUBtFNPWX2u/8Lt5E18MgwBlmUjn7ZSNR60ZFmJlIlJhI?=
 =?us-ascii?Q?f1hR57UvOmkcb6C4KbfV+gbXP8xUjdGNzDMy35URV8s9atqAUYji2019Vgxi?=
 =?us-ascii?Q?Tthie8KArCY/GAqLKJ+RFrgmIglqZNyAEfTlLgft6iGqQ1oqrkCQ19yOeVGI?=
 =?us-ascii?Q?XCecdPAxDC4XwGMyl22VdV+d1s8Kp32Jo6QkcmDNeG6O+FGbBPhfNvbAC7in?=
 =?us-ascii?Q?r19YiN92JtFcMgAP+cwxci+37Hl+Ra7zznSVn28mgmIt/bkzXvcYNHsJiquc?=
 =?us-ascii?Q?NmUsGY8B8/Ipq7Xj0oy3Q2n0MoMGSg8ByoefemXVmoVCrpuxWo39YwtRmjxh?=
 =?us-ascii?Q?68FXGi6/SartTmoX7XOivZ2JZ6iSyM6MFEMG0GA2PQP06VPcuA5r1z84avyk?=
 =?us-ascii?Q?5FGIC/l7iONR3JqErdq3/jdsiidWnr/PJmASJodLiHL7lryxwzV06RieBUqi?=
 =?us-ascii?Q?szwcQZ7vBHTLPaL+c6TQiUBdqKxAfrmxX+Smdd7/XM0jL/9yYBL1SeXf4ynw?=
 =?us-ascii?Q?H9NVZepEmU/JtCWqEYH3uBKg5rVHYHvQrx0tMp0HaoMLa/713LwyR1iXDSgf?=
 =?us-ascii?Q?ZcJ6EX+8MQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a38086e-a87f-4504-7c26-08de7e4a6932
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:59.2739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FmXzeQ58SyECt5Y3Htbm9Jze3Oo3ga0bK+v/q/SMMVpPvxYB/fpJipvfrX6G4ZpgZS5XWlmcfCxRyjB8KtI3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Add the NVDM COT payload, FSP message, and FSP response structures
needed for FSP Chain of Trust communication. Also add FmcSignatures
to hold the hash, public key, and signature extracted from FMC firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  5 +-
 drivers/gpu/nova-core/fsp.rs      | 78 +++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6a0a02177f6f..be41e07b8448 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,9 @@
     },
 };
 
+#[expect(unused)]
+pub(crate) use elf::elf_section;
+
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -627,7 +630,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index d464ad325881..15731d24d0c5 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -105,6 +105,84 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
+/// Size constraints for FSP security signatures (Hopper/Blackwell).
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
+const FSP_PKEY_SIZE: usize = 384; // RSA-3072 public key
+const FSP_SIG_SIZE: usize = 384; // RSA-3072 signature
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+pub(crate) struct FmcSignatures {
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+}
+
+impl Default for FmcSignatures {
+    fn default() -> Self {
+        Self {
+            hash384: [0u8; FSP_HASH_SIZE],
+            public_key: [0u8; FSP_PKEY_SIZE],
+            signature: [0u8; FSP_SIG_SIZE],
+        }
+    }
+}
+
+/// FSP Command Response payload structure.
+/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,
+    size: u16,
+    gsp_fmc_sysmem_offset: u64,
+    frts_sysmem_offset: u64,
+    frts_sysmem_size: u32,
+    frts_vidmem_offset: u64,
+    frts_vidmem_size: u32,
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+#[expect(dead_code)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+#[expect(dead_code)]
+struct FspResponse {
+    mctp_header: u32,
+    nvdm_header: u32,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
-- 
2.53.0


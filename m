Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA4352F8E;
	Tue, 10 Mar 2026 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108716; cv=fail; b=jtxfntvL8ZPl5JN54Wkrqrx1UKrK2HqqyH2kN9BkcjQVta9CognBAGs0/2Czn1dUP1bsLTrCb52Ftdxq4igAR5rshzAD+8uo0rAG3DVTAw6lP4KXmB3y8M9MJ6Zps5rXBDAz+IX7tlzea7dy50hj4duG1j6toYIdD5Wqv1aT0Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108716; c=relaxed/simple;
	bh=DKXcsBaqc6a+lIn1zlKIkiOBA4ZIQEroPJk1XwLPF3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=la3dOjcEL5cCDo8FZGPXB0L+yRwEpq3yFhQWPlSk3zn/LpbB2THXR44NmutT3oD9NPnbwL8IhhSU1PNzijfGm1y0Issnk2HoK0oH/5Hoba1lX6tbMdrKqiR0Se/hLI7O3UpZWGc/8PLI34CSZVMpi5ca3xFRE3T7/SJqSiWqd3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cqdz8s2j; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cqdz8s2j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWKdYKczcdbI/1MUiRn3TFurbm8W2hMiNJlAzWgHfHY+EoWj7KuQvOHR/0dEK21+pFRnuK72O69KlaTJqpZA6+goMH9jS9kjeLvxITK+GFGcpJtP6J3pSn47ITBcKq989tu4ZfYmw3GMHsF5MkchzGxd4DzbcOodCYw276Q2lQgwEcSEmiN9fT8+/8oDmcDH1lQq+pzR3P7bJeAgn/7GXwDB2/Xd0dUXUBu82dOZEhwa28NLBjkZ+KCRuv/EtIYEWf/PgHvUOUnjPmpYG5aZCDI6HJBNjS297tWdd8EFdjF+CmvP9bhgVV6hVz+X+TTw96UEXT7IIvMv7/U+Ij38DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUHWHJ0HnAxf8H0vH/8AMWB1TgNT2ZOB+siX5sDAwp0=;
 b=rnI7rV7hVdi48MeLlch9s+Ta5DAvweyCRKQnjCT9XOpDuN1R6/V0/zOX4x3pFSurY/K2bWEumxRCJM2wUx+sD8bcqq+X71t1qlkPxepfMxJWApz4FzTykQ660ZGsPDEr7PY7GYCvWdTMGt0spIPhcl7HQOjPXmVYN5yztIo6yrqS5W24h+o6fZO0DC9aUHC/lEEd+4rPn5pummc5VR0Mo7dSGa8GdK2aN2JRZ9WX6qxNMDS14SubWwRsEuPtJWDY9wHvYdxUo6jEDl6cp2YiN6XAZ2cMeZRxFPLVfLzPLSm6AW+88VkDhik7k1GXNGQA8+M4CCuwo+bj6cOGcINn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUHWHJ0HnAxf8H0vH/8AMWB1TgNT2ZOB+siX5sDAwp0=;
 b=cqdz8s2jKwOlqltHMQco9Md58Je37dUpkn6mObIXeU8nYXyD+5IcnJWE8iroFM5XceRmeTitcEnkMSsmGEqeRb40SzrgyDca/QfbQ0nW+Au7w7vRyms4m1+OvEksy9T22RhfGRYAjB7C5nFyAeBtRrPWikPh3kEFmF+AhjiZSAegy2x7ou7vTLN3r8+gl6PQx5+PGx3251DUP60p9/RBSoenfn47M9SFEzfyt0qOCtHc/p3SjkjqnmNQAt3yGbzaFIfkQ0wVX9tVCWn7BZbLDQu9sBz9e7kPTY+lzDYIyYfradgvY+5TTHkbHdFaL0kCnV3Sts6Wka7JUrUi7/5Feg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:47 +0000
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
Subject: [PATCH v6 14/34] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Mon,  9 Mar 2026 19:11:04 -0700
Message-ID: <20260310021125.117855-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 031a8009-f2bd-46b5-0759-08de7e4a61fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	8iugDoE82I2JW/fD7qp8ZbiwT7iQJGA9xiVTiscIsCmscZy5z40bFyVrsMuZRgHZD0rkYuo0ItID/FR2VTFlARjJ7kbT6gXVobqA4xE1jWymN+vGr2+qJB/PnkAi5+k4fzZGMfKjAlaHovYx+w0QtvFci/hYCu+UF15kqVN/dMGg2b9sqWalk01Z1QR1iKpXKeKj/00xGeku2O1f4RO6aGC/5/1HseH3iMfAvw4QXSzF2n4eRo5jLqdKbWnPLUDZMQ0aVE+cTi81V0KFyciyoYhMW2rjIlAVmzy8d4XeT7bLwCmM8vGI5m0EM7R5l++cXOgB7eyE4EfsRpanJNpe7EXpqbdlcs4MhR/cCInlJtAcFZ4cy8xzg7ElaPISXdvw5wlJ6/QwzCcn+hI+hFl8CXaryqx/K+LBqU4BbZP+V65vWrRgAsT9ek7cTRq4QaafZpzdO1/b1okcxE9W5+QuhkVM7uMiHvbqU0uyCnec5e/W366Ee5Ob2LFp827ei9Wc+YjJXMLTE3TV3Olk1AKMjzEz3iTq3rSwtEtn8+uZLa3qwrjJrUmA0WlHcnLTlK/0TxQ/XHWAjXQunAchB+rv9W+NotK0VP2Nm0JHayc9g12L6qbjxh1TRRwRitrwxAlNOl7Td7tGemkUVtERTp96N+8l4+Cmy2ctd40IwCHmrAJf/caxMjSJ1Dx7j2UNuDRi269lsC26gaaHjfx4cQqWnJMwr96HtMnm5PvtspfrWAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WXERHuNQeWndgWeysHU/73noroO+ZTPfTlkQUbarSbqxA2eh1Yc4YVO2iHd4?=
 =?us-ascii?Q?yTKq2IwcRXegi4uMQTkI9zrN/GPijdKxUINucwXSKScHHZZ9BYQv33qSNXhO?=
 =?us-ascii?Q?NcW4wC79ONe0tA6XZleMfxkh5LdrmcItuLy8OSDFiF8K3JbrYpHnwHNDIwv/?=
 =?us-ascii?Q?59MyqTYcD571U3gdq9HnVVt1UCTTC/tDvSdgvSUvo/AYgP3SSPHebdaf21IB?=
 =?us-ascii?Q?g5YS8dA+Vt9BYqAtcS310YzeKzncGVvGwluB5Ta9PU7j1xzuEpnwNMgyn0nN?=
 =?us-ascii?Q?bAMb7xRBCAB2LhGTGy4Kd5LAVHbgY/2eHDf29hUMagOkDDyb/dCphZNpUk+M?=
 =?us-ascii?Q?Zk71MXFLcLlb1FdH95KY1sY2qh/XjSzdPjzFmAWq2PQPu5ombGkg46dpkNjO?=
 =?us-ascii?Q?GJ+RvFv7BNlR7nxA+4ZgimRy5AhtuC7K/CSg8HCaoSvpX7ON1md73NlH7kAU?=
 =?us-ascii?Q?l8djHCn8d2BwLnnHWb7DvOrGLE9unlhXHJv3oc+mgXbQF7V7kD9bkRO17QeW?=
 =?us-ascii?Q?O0lhDaXdl2YpSUi3cOzx4TCWo0HX4d5pN5ax66EwY9OHzYFo0l/y1nXHagHp?=
 =?us-ascii?Q?zfbo57MVuJDKrJnnEY/zyknUSR5azLjIvU8hUQXmk6KCkzgQAmbs+GHDtnJu?=
 =?us-ascii?Q?U2XfSEFgPBUF9R7Cr7HKXBZci9lrU3hWPa8KUq3YuTrpmnIGQTihy1MLjphp?=
 =?us-ascii?Q?9vXyG2/sKW5zeR2Ds/dwql1GXbXqpOymWP/vK/3ZD9raHHZ2dscYsBUlfzKD?=
 =?us-ascii?Q?2mpxlY5YoK988EmyyTrqwMd/+AvHInAHJsEW9Yl7hMG8tNG82R5S4CzTvTKP?=
 =?us-ascii?Q?MbHvSohg5r/AqIFIfDjFjn4NwZtwUz9+kP3UQuswdDVNFt2ch1nl8QWqh3bI?=
 =?us-ascii?Q?zL3RNVofDk5JNP/8wcnrg2tJrMwCyDvOf2ANrGgbCurLB83azyqbXdx8BojF?=
 =?us-ascii?Q?URzfWQlxQkabDcXhzF0VwO7yKmk23ucNDTf8zexFW4SOoeNTbbWOiR5g3E4Y?=
 =?us-ascii?Q?bYMXvKkdbpd8NsvQoCOUf4Arqw9G41Xe+dsofo8tjAzaimfNwltlCHwAW9A8?=
 =?us-ascii?Q?GTZyHlTvpaFreGmc7ym5gKSO69+WUXnRgfQCzDmElKjWVtn6i51cRcfo2xy7?=
 =?us-ascii?Q?qiLV00HNC5M/AMk/0FTEWaVVE+LpM9NAC0f07R2W426uEG5OirKq9/LJX5Lf?=
 =?us-ascii?Q?VVsnHx5VD4cYmwVVsSfD6NaebyNxN1E8oGqlmqEgjzc/2RIPIwJ5yjZvV2g8?=
 =?us-ascii?Q?QPLig2xcPKvuI6N6WFA9HUv4+qDYjfiAY5QFvBgeVR6d9MyuuhULAsZkSu6U?=
 =?us-ascii?Q?tKWYoMbSefIIDQeQHGB45knEMsj/iZciRYqG0soq1pODfwBhkyGonZoiP6Ju?=
 =?us-ascii?Q?6BaxJT6EZx7MeEkNOWHnwI8cgZMsownYp3XZwr5v6+4bEhlDPThHccZ9mIUt?=
 =?us-ascii?Q?/KKUas3DLbtoV5SK2gNPRM8hXtTJHUzapCfeIGto8sX952MgW/+19nh3sXwn?=
 =?us-ascii?Q?uD7NS2ddUsVMzWTqypvRGpWl28KNQjZiyC9EvHVAQ3djf9S3V5SJGPHST5mp?=
 =?us-ascii?Q?Wxg87SeWGO91m39UKNByfwGZMkyB2x6+BBV6k8mlunQ6oXtTfPCLp5/C8okM?=
 =?us-ascii?Q?tq7X8wvKCIbPdpbHhLBRXW/bXBd5vgRlDXCr+RV/s3bexEZznC7Jkka8Zh+q?=
 =?us-ascii?Q?UfkzhvFU36rt4QtGQrX3I63GLsfyABs1HxtIFA4OdFSDTh8h18sd+U1mPOWe?=
 =?us-ascii?Q?bmFuSqYLIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031a8009-f2bd-46b5-0759-08de7e4a61fd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:47.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvj5FkWpsGwOBLLUGur2ChPR8M0kpJKFRZrLlrDcdmXqWpO3SOzYQIMPJg3r+LmxBIoYqKbSNjh8VTSBZdIkxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add elf_section() which automatically detects ELF32 vs ELF64 based on
the ELF header's class byte, and dispatches to the appropriate parser.
Switch gsp.rs callers from elf64_section() to elf_section(), making
both elf32_section() and elf64_section() private.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 20 +++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 95aee1618cf4..112dcb431e26 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -616,13 +616,27 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     }
 
     /// Extract the section with name `name` from the ELF64 image `elf`.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
 
     /// Extract the section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
     }
+
+    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
+    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        // Check ELF magic.
+        if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
+            return None;
+        }
+
+        // Check ELF class: 1 = 32-bit, 2 = 64-bit.
+        match elf.get(4)? {
+            1 => elf32_section(elf, name),
+            2 => elf64_section(elf, name),
+            _ => None,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index f247deb06633..52e7337c041c 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -105,7 +105,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -162,7 +162,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0


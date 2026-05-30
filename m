Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE4345736;
	Sat, 30 May 2026 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110620; cv=fail; b=Vs3b5x3KF9jInPdyQPe56D5t8oTZuLUpI7SWMABSDpr8Fz0/9RvnlgEpZnWYuEO1JxYOtkBIKgSwa29g7O+71LGs6nrZgBVZFOzZcQR4X3kFGg9b2Ez5OXR3udLI4D49GvdqW63bgc9QL0j3XnB7lobiRLHnJF+rcZS3HIzzH+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110620; c=relaxed/simple;
	bh=kqpYlBXaf8TNHSIHP56HM0cUMVNdKOmJiEKbqjL9fCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cd6jGF9WGDOzYggaui4K6J2VW8DSrm4wffvrq4H+mDVe/AflYcZ8NF85v2L8Qrkdi9zMWY6kE/7FUgkxE+9XR1p+vwpMEaODfE4kJjtSWyjL4SQLBdVXpFw1+wTktTQA48MP2v87V3BeZIDtYehM9OPHJIoHQMMDnw6mZQneNh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XjYgjQEd; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XjYgjQEd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSOoKoVqkU2/hQj2CZSCQqP4oIR/Xf3s13non6Ixcn4dr/VakHMfESs5Ab9z+PYzZM00j/uHny6TMa+sqF29FAJtGx/bQaqJw7u7Vg9rCBt6A2SuIbuYP//xFElyX2/5uY238dPqC+jkJ0rD7+IRTHV1Zzvv066ZcF2K8GsBslBZc4EIyqp3hmsFAc+WMir5uPzp5USu2S9Ctx56QzTPUOHHzTllv0EVmkrYROCrvru518MJm56xqwcQDkTWdJIE+VrsnOZDfmxhjz5KDd0oVNmw5lqAnCycHGg14JgkCkpWB2Xk+91ACtJKiPHRM0noxJCLaTX40dauN03vW6BZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQOfVeuQtqctR4b+6XjGh6EqR07J+YFbCA4nKv5+p2o=;
 b=SKHWyR6+jPsh1J7MG28JfJefEaPXtSMbFMOjXsWU136BUFitB65niRWf5aDueQpURbI70hlWIJ1DA1WRR/wCfxfzr5Wx2ka1DB+XskJjK4m7AHIctXhraQCB/jGb3anMzV7zwIHYL+83AZq1nW5budu/YkjfHBRuZIZcASdyAqKh46ILv6TRBOzfKGEsj5Y5z8/UnIwi9aOS5NrIKK2RnAtxiZtJJPaJ1kwZKcDgCd1OocGMr+jpTSSghjT5bwPrxmyokroQqjG23LTzke81puKVFPIRO9jvaNxmNXspzJkSJ0Xv8UklZ+sdwsjJ6xQbLAaBLi0wmB82+gwq9+nZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQOfVeuQtqctR4b+6XjGh6EqR07J+YFbCA4nKv5+p2o=;
 b=XjYgjQEdjIBLgNvE3IGuheTiI/NTfdxhtBPjRo9oOIJamBHAnM122TkyALsTN6UIoJI1rzkFIPwOvfaKlo481W78wE2Xz7Jvh9wnrhZf/9IHNtz8kM4x9Rvosy7ifoa6MiqOXg7mqONIP7ODZjywCZ8XydyglqZVN+PiUgXNQbipWEuveEaWjOWxZb6u+GKYb6RDVo5bBGK31hBF4FVhx6wnWsDitSuEG7QitvCcENBhOUAE70xtSb9TOFdG7hC8NJuXMWVfMfPnzivaeBZnMkkTEL/m8rhkD+s0pqt7H5L96chOYFI/rYjRe9DiecW5MI/hiurhfCvQ2qoJa2mo1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:06 +0000
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
Subject: [PATCH v11 09/22] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Fri, 29 May 2026 20:09:40 -0700
Message-ID: <20260530030953.740561-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 09795c18-03f0-475d-0a20-08debdf8f37d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tChJ4d8UOfmxTIPo9Ii+/+tY1wHZ0WzHzK6ULmfAhQVKn4bgaYGOGmH/mhe4CYTxLZ9VO0LJfIUQ8DZJCciXEcaXRYIJ9CJvW8zh9lfLWKnrimnedw0ldx7DcuxkVZveBJqNmIn/5BKD73N8cUU0laf+9fq9r8Gmf5BSJ0I8RjtSBC9Tu0EAABWKKPq3TaHtTDRtmbfo6ndmW+7a66huBS4xQMY5Ok8d9SsN11lAwpqTY3jzyHnlEkx7NrBg9eYpGADVgM925VkIkiejQbGtu+cKx5CnVB/k8J9NA8ix1bmfiO+OMNNvpoj9lGv8yeC8yX8zfrGClSdFDJkkHJrN+FHNDVBYqfxrQ2tHIUvhoFy4Ye1aOfNF48S1YYxVaArObudEFtQ0rFqBDTi74x6SiEY80v7y6q3WKMlnkCyxL4jLvRtsY09sFoA2aDiqok7lR220B/8KAS7J31QYYr5EyFlUdyNwVKMaGESneUJPLgr5doMHidVMrHpKkLg6mOa/p1DOYEVd0G/tC225iFyVeFRi/+GseGdIcRS8EbH+oxsQaVcLGJyhsOdmzzvV49viGYycnOHZh3/PwgNoKf64PwAyyvtIGWE3UGW3iyMNIZnopqWqdrt7ZrtJvPWn/UHuVnuzS0t2ybWwjLL58DweRG2uMJtnzR2TgftJ92kqDLKvzX+ChzMHiY6wPLkl6FAu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j6mcnsX09UfccUrAhFbY/BTNl2zhveyfW8gQutVYIdK9odMSQy7vFWAc3OWl?=
 =?us-ascii?Q?+YNab1w2oTZ3qgn6L2RJ8ZeXBJf8XwZbkuP2LryLDr4qPvcj+ngD59XSXSip?=
 =?us-ascii?Q?d+/1oesSrM49UrIjRuAbQhZAon3JGcYoVp5Zt8JUOjCO4qF8/Iz9TZb6vKF9?=
 =?us-ascii?Q?t64eUr47/hizVpW4KyAIg/PAV+RmSugfj7PBQsACFdHp7iAI7nZKfsGIuWLP?=
 =?us-ascii?Q?d+tiKJrrc0TyfwGqihhUOF2OPxtDvOzKdfWjSdByewSZneQbb5kXV5oYv2vF?=
 =?us-ascii?Q?uiohEV4tHcBCq5OUSztxDecxvxAF/8/nTFj9LA+s32K3H8o2zICR8TB4HgWB?=
 =?us-ascii?Q?WHhf9WgNoxo3UpeYiLC3tIeORFEAdgVo2bP1z5sXxgv9Cl4vYH2YxQWXH9l0?=
 =?us-ascii?Q?p0QVXmNKBpYZI9NlBASeXPcoatAsaOfZ5e2tsgEOMr0fXoMilitXKk/AlbQb?=
 =?us-ascii?Q?PIFuREqPZhB55Tn28jHgaqxaRFr4otqWu9duBFXN6p/iprItehyHZxKl8Z1L?=
 =?us-ascii?Q?YmrZx7dUEOIxx4v1dvgHI7Hy0RkoZVxSiChRoxOnfANPydUB6PgfHLMWXzUC?=
 =?us-ascii?Q?I+UE0eFFndmlhhEUQK4NtuKJURyCYTtFThPYbFXMiQxDpexWxSbTXFt6gWHQ?=
 =?us-ascii?Q?b1ShJNrrutUfVOciAdPXeibM/Obbk3HyM+4HHcb9A8Pzjbk3K2BNCFaa6P86?=
 =?us-ascii?Q?FT+MeT0Bv7Dm323+w0DtQt5MrxYZDSMkJC8jCvJ/uepiCDq6SZaebAwm0+c2?=
 =?us-ascii?Q?uykJnHJCFpGqo+LKWmsncl4ypaeBe+noU+/KnPjbVhFV4qO0v4HGWTmhi60S?=
 =?us-ascii?Q?1YDdVW9LSLXovsN7JT5zeb+Bdv4t71dNgSvi4HKnLgt2uz7WaaWpUwIPjzt9?=
 =?us-ascii?Q?ywYjYWf7IMBFFY2lcsWjza8a78Ar9bDu+K5CPqHVQ5F7gEpa29tQBQo3w557?=
 =?us-ascii?Q?Gl2oFKP50Rw42dKHhoEKPnmlLsM61kf73KLRNoDaZuL39vy0x4YWtXgMzZjK?=
 =?us-ascii?Q?dYXUlu1PaGo4ucZrIbBDUqKx4h83Q9fY9r5c/xn70bWcZ1C9cKHU9kyCHro5?=
 =?us-ascii?Q?GR/xINK1MfvNP7DIoXs4h3RTaGCwpwZTeM21zqU+klrVrhbNf8dHzUFLbXkn?=
 =?us-ascii?Q?Hblwa0GvYi4VMgX3iVR/EQeLUSZ2X7swgEBQoRULO7FPkeiBR2GCANfuyFpj?=
 =?us-ascii?Q?bJzv4khWXAXgi3ndOB9y51kwa+XJakLbOlybo7Oz2wqezTlOjfbe+K+ULyBo?=
 =?us-ascii?Q?y5h4QdOosHvi25zM1e3/L6nvaLEx5SwDOk6tbt8aE+fqp9ymD/S+d8ZAqRiT?=
 =?us-ascii?Q?/z8o0aawjNwABUj3k4Ar8+TzIy2+ZIe2ABc739qVoN/QDb8+Ifkr2586R0Bd?=
 =?us-ascii?Q?h3987xvOcjNzhBl/5FEFlnkHkfbIqAk1WEFg0gejNf7KdbSPwH6k1Htumjs9?=
 =?us-ascii?Q?g/pNtPqZT8nnbOR6gJgHGUyltCJv6Pl06uxpmL061SrbASSGKfw0H3ne0iFY?=
 =?us-ascii?Q?ixoCC1SfOQ+Rnf6y9F4o9sLwM/2aQV1T8BL1joZhNHZSpXjBRmDJtPppd6Qq?=
 =?us-ascii?Q?9sAlu0H1aHbKmFj6Gy8vQFIm+IK7hDNGlzjHfa+vlq8lfvSvUOXGI4DytfzV?=
 =?us-ascii?Q?SXYyE9tndgud+LWQUGehtYmhGXSVt/D5BR7AbcLh5VVTsIlWdDCSQBnSK0Me?=
 =?us-ascii?Q?WNYXw+8e/7myxir884LPC68iMbfLcja/xliq0NkHp5HAbzlwSUlEaHfjtdfy?=
 =?us-ascii?Q?+jsd15js1w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09795c18-03f0-475d-0a20-08debdf8f37d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:06.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oaVt754rhRd0pY8pJUTbjMzjZoBfrxQSaeshM8WdLChoeUwTh1dVNzcgUtyCXf1YAbsmny/ERPqzhMQWZwrQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

A firmware image may be either a 32-bit or a 64-bit ELF, and callers
should not have to know which. Detect the ELF class from the image
header at parse time and dispatch to the matching parser, so a single
entry point handles both layouts.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 22 ++++++++++++++++++----
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e4dcc9a87b7e..866bc9b3571e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -629,14 +629,28 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
         })
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
 
     /// Extract the section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Format>(elf, name)
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
index e576bc8a9b1c..99a302bae567 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -88,7 +88,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -148,7 +148,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset);
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| Coherent::from_slice(dev, data, GFP_KERNEL))?
                 },
-- 
2.54.0


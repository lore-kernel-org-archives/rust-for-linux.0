Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4101729ACDB
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764632498; cv=fail; b=ROeDmjxxH8e1cx7nFWv6RRnXZs4p1JZqpr5mrC5QsVaC1M6s3XpzXQx3yMX0CrKPvWk/fI0xTuxKsv/LQeXEDDm7zwZPFcugjKLydDud29ayX7ciW9VTjwGjKY5AhYf+c3NqLqAC3sKAbDef+FeEAtxOdYDxInQidgH0GfXqYk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764632498; c=relaxed/simple;
	bh=Mex+9WL+MBz2Gb2I1eJ72NAwMLkJ9gpqo+ArNwj+lM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKt+BbY0ELFwScSRvoRMDTq5T+8OOKQs3hmCcgc7q4VYS4DcvQQtogL5fAXNl3Q2UNTPIUuS5VArdVRn3snNCPb5KsTQ9cHnqZejnFatgb9pGtwGLkm2cvOKCqR5adLSiS+yjSdCkIVvgBhq/JqXLqpJw1zkN0CBYdJmLcgLy0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rAU90k3k; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rAU90k3k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6duE2UVNBCf7Q7MNoBeF25K/0cIw3PuiFEaL9SHgARgGOhailqOp9scb0CTwTRqeOUIgA2BNJkgLuVdXrY7ofOENGHeYIw6ZsSIBW0Vl96n9aR3MkbUxRFGYAVKHwcE8OaWMarADAzhhuLKQ2GLlc1omJQH7+jb2NllvE+OTsMMXEkEZNYXjCXLsJRm6/JQUANIWjPUNPcn0WLxrXMEnzfhZfsKiI4imZyifLPPItbAOUFLs6jjDnQ2TscT1E8GuiQyWUmS3VkkpgKTveTt52MDLw3+zS3ADUrZ6EeM5RXiOBFQW9zgSDJvEb+QDdJdXBx2rHEhKI5e8SEn2lxmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmBvMFqJl+6M9cB2lq5RbjUhSEBRwpsr53z5H1tHfBA=;
 b=FLQyccqXl0z350K/qXecTfVETFsaE0STjIJx0gNA+DvoD8D7Y78xujxN6BuWPDSDGgbXWM2OwPuO1jI4bo8HL1Gn0Vzr+9mpDKIi953MAqFluuWXkxLnen3yndKtqrQIEmA0IIKzNS/vESBHU8WH9iE3BTsY6RdpvrQXiadGGR2pR/xx7wlOBSpe765QC2oVZokKWurfhGOAMe7jWecyET/TO4IZ3y3TNvsRComF0caksaz9RCBG8jQDG0ts7JwXUFk7SShMT/bLJAckCRKWi9ao19h6Ong7WywG7yYYOJHgoumJfW2G0MEC6MSrtQAQnXAsBsW+yCUVDPS/ERhM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmBvMFqJl+6M9cB2lq5RbjUhSEBRwpsr53z5H1tHfBA=;
 b=rAU90k3kHsjeurnn0w9TH/IctbClGVvEj1UtCW3cvjzJJoOzUWzmN3M1QFKehdZ816cBe+hu9UqvcpqaLX7YWOb6ytosikH4ofqLirxvN6Q0pdEVwm7v7sp7+IbHbx3lO5PERG6XxG6gBl2kduL4CN1lVZAhOsTHhltWTxoisuAoezI8dq5CGMpXFZwhqvbbL5BGsukuxKKBOxVJHdsqv2hkXqjUd/EEM1+/pr6Bzj6S2QtsbnOzAdEJ1BK9AnqYOxx7MaIZGhstVTHWhTatwEbLEZBGM9UG8jaWTA+DqplroaSwGko4EZIp0sQvHrnUSuCgkXshb3Q56xUNncDwTg==
Received: from DS7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::29) by
 DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Mon, 1 Dec 2025 23:41:31 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::a9) by DS7P222CA0008.outlook.office365.com
 (2603:10b6:8:2e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:13 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:12 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 13/13] [RFC] gpu: nova: implement trait object FalconUCodeDescriptor
Date: Mon, 1 Dec 2025 17:39:22 -0600
Message-ID: <20251201233922.27218-14-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 716f7283-ddd9-4959-19a5-08de313327bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a3mw3CWHa1iHB94oaSzUCfYkNFItNIsBimD+D0DGqlEcIbdUeEjmzhVW19ZP?=
 =?us-ascii?Q?bg+3sBsqZZPcjc96c15GRlPNMtCpunBM0WjxvRhpDL3qh8UQDFoPs9c7y9vL?=
 =?us-ascii?Q?2iFmhU0Lsn+swOKZ296QcUo9f7vkqanAg1OmXlkr091wGSPXiF8oE2bGxZS8?=
 =?us-ascii?Q?8ekByridG4sUP6QLYJQNFls0+Eq1pZtkta/iK2g4DDR7pcHvf9dnrExD3EVO?=
 =?us-ascii?Q?QkEZ8pzeOYiuc9IvfB94Dc1t1zqPXQG2AYdl9Cpj9W2zqOD5p/JAyDZ89Aqg?=
 =?us-ascii?Q?sjFSxEvgeuIBdK6eQAnCL/m6nbudPScfgJiblVEtZRbdK8NNMH0jN416/oE9?=
 =?us-ascii?Q?hpc1SeU6+hGQbi7puw5Tk6k6kZUmkw1UI9XQpHyBqCp++8Kcddx4lw1hUpmi?=
 =?us-ascii?Q?9Qp7hQ8Aq870nY84TTzRNh8toJ6lmRzzNMPClfk5feImy7HX1AFBwiEE9kZv?=
 =?us-ascii?Q?yKmY+YkSsx6RVwSN/sMGpZBiNnoakQn4ZOkYlW+emBv0Ur9wKAz0vNqi8Ksz?=
 =?us-ascii?Q?3ko71LFx2vOV5QjBAHN1xGlZDmDeI1bEUo5/plo4dkcxSwl3umy9h/laL4SE?=
 =?us-ascii?Q?4qAfJtdpRVYd6UhNQuoxa9JzNTuEsrO96Iv2sV+x0koRfLFRGlSRuJiB849I?=
 =?us-ascii?Q?d8HiBwHdD6CvdJiXdbCKvpFXsoL3EcWKw3oqBq5V/2hwHgLN9TJNHcwUUYt/?=
 =?us-ascii?Q?NG87Le4HItEbcAvWIiC8cPNR11u1mfRG4kLs7a5G1f9So2UYRbejU/BfPyqy?=
 =?us-ascii?Q?wIT7z2fouik39gUfy6SPHSZBc0yMYX2DE12uDBNziz9eIF5YZZ2g2sadLZDF?=
 =?us-ascii?Q?9kbkAa3oNKeaEYJGWiJO8+G4dLqVwxVLbuytuRHWcq/JEvEiZWFii+Fwuopk?=
 =?us-ascii?Q?8R7Pqy2SAR4rRviJdqBRPw1vdIcQ0hYTRTxUmVk7nK5dT9cjkZqJ8NpUenaq?=
 =?us-ascii?Q?CbuMh8W+5DHRjqfkPFH2UD5bnMnaWtsci78flOUZodYfvCfYKJ85h0SWUkUm?=
 =?us-ascii?Q?1z2/41EyzOtHZsGHKzn+BNOYcHq0BBRmDrFi1ULE3iR11rbMqIaufBpbShEk?=
 =?us-ascii?Q?YsdBdCd48gVr7V1THOYyaRUh5exNYiXOM74f47jXAeukETxYE2M6hTKwc0Ow?=
 =?us-ascii?Q?D/IcD6VL8MfbPOctzhgWoFCiOVSFiwCPHTkR6sDINvbB5bnm1hwk1W1/MJSU?=
 =?us-ascii?Q?KBxd4mn12yQwMxRyXfYAQYJasgqr9T6sdUeTJOItEoYNndEH2+Gw2oD+8xF0?=
 =?us-ascii?Q?EpszO0vgngOp3rdRlq5ymhaV9O0M2jFLsvASMb9tfwVMKqmQM6GhcSslTo9R?=
 =?us-ascii?Q?DoQnq8bhFyP/vq8QMSyniG7YsJM6r2lICTIdrbRb8qYyAcduHn7vk/D2LCh/?=
 =?us-ascii?Q?7GRgQwu/AkSGgmHOIkcynx5j3UdidpPi6C0OauES7iYofbWIeqRjkPyFjVqo?=
 =?us-ascii?Q?J/y8k8W5P85pM3jVWJhA5K0JZEVTidAFOHY6Y7eIIJp6SQ6X5kogKu1sZRmp?=
 =?us-ascii?Q?fJE9mHcUiu23v54XhyzThD4dtRx/d2a13JajuMJSh0YZUha9w6+TkVZWlfCw?=
 =?us-ascii?Q?Wn7EnmmnQCttmXLwydg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:31.1320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716f7283-ddd9-4959-19a5-08de313327bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813

Implement the trait object FalconUCodeDescriptor to handle the two
versions of the Falcon microcode descriptor.

Introduce the FalconUCodeDescriptor trait to provide a unified interface
for accessing fields in both V2 and V3 Falcon microcode descriptor formats.
This replaces repetitive match statements in each accessor method with a
single as_descriptor() method that returns a trait object, reducing boilerplate
and making it easier to add new accessors in the future.

However, not all match states can be eliminated.  The FalconLoadParams
implementation still needs to match on the version because different fields
of the descriptor are used depending on the version.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 91 ++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 3008d18f9313..2ad56a387a79 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -125,13 +125,55 @@ pub(crate) enum FalconUCodeDesc {
     V3(FalconUCodeDescV3),
 }
 
+// First define trait
+pub(crate) trait FalconUCodeDescriptor {
+    fn hdr(&self) -> u32;
+    fn imem_load_size(&self) -> u32;
+    fn interface_offset(&self) -> u32;
+    fn dmem_load_size(&self) -> u32;
+    fn pkc_data_offset(&self) -> u32;
+    fn engine_id_mask(&self) -> u16;
+    fn ucode_id(&self) -> u8;
+    fn signature_count(&self) -> u8;
+    fn signature_versions(&self) -> u16;
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV2 {
+    fn hdr(&self) -> u32  { self.hdr }
+    fn imem_load_size(&self) -> u32  { self.imem_load_size }
+    fn interface_offset(&self) -> u32  { self.interface_offset }
+    fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
+    fn pkc_data_offset(&self) -> u32 { 0 }
+    fn engine_id_mask(&self) -> u16 { 0 }
+    fn ucode_id(&self) -> u8 { 0 }
+    fn signature_count(&self) -> u8 { 0 }
+    fn signature_versions(&self) -> u16 { 0 }
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV3 {
+    fn hdr(&self) -> u32  { self.hdr }
+    fn imem_load_size(&self) -> u32  { self.imem_load_size }
+    fn interface_offset(&self) -> u32  { self.interface_offset }
+    fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
+    fn pkc_data_offset(&self) -> u32 { self.pkc_data_offset }
+    fn engine_id_mask(&self) -> u16 { self.engine_id_mask }
+    fn ucode_id(&self) -> u8 { self.ucode_id }
+    fn signature_count(&self) -> u8 { self.signature_count }
+    fn signature_versions(&self) -> u16 { self.signature_versions }
+}
+
 impl FalconUCodeDesc {
+    // Return trait object, the only match needed.
+    pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2,
+            FalconUCodeDesc::V3(v3) => v3,
+        }
+    }
+
     /// Returns the size in bytes of the header.
     pub(crate) fn size(&self) -> usize {
-        let hdr = match self {
-            FalconUCodeDesc::V2(v2) => v2.hdr,
-            FalconUCodeDesc::V3(v3) => v3.hdr,
-        };
+        let hdr = self.as_descriptor().hdr();
 
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
@@ -139,60 +181,35 @@ pub(crate) fn size(&self) -> usize {
     }
 
     pub(crate) fn imem_load_size(&self) -> u32 {
-        match self {
-            FalconUCodeDesc::V2(v2) => v2.imem_load_size,
-            FalconUCodeDesc::V3(v3) => v3.imem_load_size,
-        }
+        self.as_descriptor().imem_load_size()
     }
 
     pub(crate) fn interface_offset(&self) -> u32 {
-        match self {
-            FalconUCodeDesc::V2(v2) => v2.interface_offset,
-            FalconUCodeDesc::V3(v3) => v3.interface_offset,
-        }
+        self.as_descriptor().interface_offset()
     }
 
-
     pub(crate) fn dmem_load_size(&self) -> u32 {
-        match self {
-            FalconUCodeDesc::V2(v2) => v2.dmem_load_size,
-            FalconUCodeDesc::V3(v3) => v3.dmem_load_size,
-        }
+        self.as_descriptor().dmem_load_size()
     }
 
     pub(crate) fn pkc_data_offset(&self) -> u32 {
-        match self {
-            FalconUCodeDesc::V2(_v2) => 0,
-            FalconUCodeDesc::V3(v3) => v3.pkc_data_offset,
-        }
+        self.as_descriptor().pkc_data_offset()
     }
 
     pub(crate) fn engine_id_mask(&self) -> u16 {
-        match self {
-            FalconUCodeDesc::V2(_v2) => 0,
-            FalconUCodeDesc::V3(v3) => v3.engine_id_mask,
-        }
+        self.as_descriptor().engine_id_mask()
     }
 
     pub(crate) fn ucode_id(&self) -> u8 {
-        match self {
-            FalconUCodeDesc::V2(_v2) => 0,
-            FalconUCodeDesc::V3(v3) => v3.ucode_id,
-        }
+        self.as_descriptor().ucode_id()
     }
 
     pub(crate) fn signature_count(&self) -> u8 {
-        match self {
-            FalconUCodeDesc::V2(_v2) => 0,
-            FalconUCodeDesc::V3(v3) => v3.signature_count,
-        }
+        self.as_descriptor().signature_count()
     }
 
     pub(crate) fn signature_versions(&self) -> u16 {
-        match self {
-            FalconUCodeDesc::V2(_v2) => 0,
-            FalconUCodeDesc::V3(v3) => v3.signature_versions,
-        }
+        self.as_descriptor().signature_versions()
     }
 }
 
-- 
2.52.0


Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFE63988F4;
	Fri, 13 Mar 2026 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420876; cv=fail; b=p6bTtJWnftsGyj99tn+UO8w+RJx22C9xRexIQTUzIzeZHBpV/R3Ahc09eutdvzQkIm7kFp8qU1z2v1IG4mT07Uq+mW3n8niN5UxmbDGG6ih3KyIh37NFa32Bh66bFSxIB2n4wvDSUKvzpfkb8/zDKEfyLkFr6BAArSCQgndlPe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420876; c=relaxed/simple;
	bh=gINMe2xt9jikQbVRzApYEinBu2YE4qSYh7GMGdNqYX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWxU5o/N8JPDWFXbaqZuXjreG4srJjX9DZY3w/a05+TE2U6XZXq5iBccHC5mzguB49KveBf18huak4iTi7/K/dhE/+jz9fC8tpWLdOOvfl61HrC0JVQUGl2bFrQXtNW/HoQ1S/Vgai92VPrUKc22d9DGYsGBZ0Sp3q39Peqwxyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B423D2mz; arc=fail smtp.client-ip=52.101.56.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B423D2mz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8zT749MnoECQHaPIAEXrkTd2BSc6X0hEBClUe7e9COxLU+5EfQIL2eTX08Qm3sGkFudWjAv/I4QxMYhz8E2FprDVRvuh9y4rYkxTair6qFmxl/3sKt71tZ9BAfB7UnUqR6KwBLi54383i7+vRQeBohaMCiyXKj+E/xo+LrGsKrOrt1gutn81WejRun5hsw3k5clm2DUB0TkeQYg4UTjlWEqfgliu3wWMMNUeg1TmGdRHQFMmsnRtjCwXIfQI/PIrZ6xB8P2Qa0vc3V0KIWueKWR5ct3jBb5SA2TjQOsM1hYwJHbo0XZMP6+BEvcEjaglyzvldJruhY/1PEYKnuBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3x9TTFjXo8ebR0eZ2bbiSdJ+uBo/0lEJBE4Y7SR21o=;
 b=f0IFQQQFpHvnKnFYn8y/MaBUsQxs4fJmQl7gP2w0FRIEQsuEkbw0BcTsOa0tjKSizeq0qiZ7DFhhjzT2tSWkbSyUwJRehJw5IgPMrHHP9k6OuxtZmWKv5ZTvbnETDgmrMl1AJHRC7pwpbWw+NFPLE8TmLo5d7CDgDL9TV9YX3d4vV00/dbhs2onZ+i6ebn/ypqyH/soYJbCMyoLB0JzCkpecvITy5QkEQc25Yj/tsSCbqa8fggeiZv202GmbobOlueTaKrSjwJ+M98/l7FdX/O2O3TEe3CtYwBCsllCilxAsN7ZMJDEChESsQMuFNn7jt53Rya/dug+rtA+NwxO3NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3x9TTFjXo8ebR0eZ2bbiSdJ+uBo/0lEJBE4Y7SR21o=;
 b=B423D2mzS2SPZErOzxHweYGSROFMm9JKUy9qM20NzJr7Pv75HBc54l3M9mvP1YYzc749mCI4iDlDMD/RfR7IiAGESzTzksg0TxVCOc4J46nTOoO6bJLKLa1rcSQ+FIYFESdCuAESIcMVpnlgZSPNLYMzurqHxRwIiZ4Zphu1YolLOB4cOIOCRowiAJx6LjoC06wqce9RwknTqNRumwwrxyr2lhez4eeydqF3jjQLl99/JjqNvhOTKiDSzrNY2DMSdTHOVmaK5AYPmUoT4+3anOdyunok7ljURhu6HaCAzvbwgoADzQI+S4G/5JPHFTpvEDVevuw4+fO7pk/evc43pQ==
Received: from MN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:208:52d::28)
 by CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 16:54:28 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::f1) by MN0PR04CA0023.outlook.office365.com
 (2603:10b6:208:52d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 16:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 16:54:27 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 09:54:07 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 09:54:06 -0700
Received: from inno-dell.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 09:53:57 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <aliceryhl@google.com>, <acourbot@nvidia.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <lossin@kernel.org>,
	<gary@garyguo.net>
CC: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <jhubbard@nvidia.com>,
	<gjuvekar@nvidia.com>, <joelagnelf@nvidia.com>, <zhiwang@kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: [RFC v2 02/10] gpu: nova-core: factor out common FSP message header
Date: Fri, 13 Mar 2026 18:53:26 +0200
Message-ID: <20260313165336.935771-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313165336.935771-1-zhiw@nvidia.com>
References: <20260313165336.935771-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|CY1PR12MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d49a00-b63f-4a0d-8ac5-08de8121307e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MipGCaktQ0jpT5mCq9unwRfiaTpYEoBagoavCtCNS9hI3QME2ka/gcG1XAoCS0bH8y3wZKT0sDpo8Y9I3fIqUCyORVopxVz7ZgDkAmB9pN+8L61O9QCPQtM3HRKJsYWXchPNCtRDqnpGiz9B5R97/hWxKoRtbb5j/+syEftmTz06GXS9AFaIihbZUgCOSHiCrQmhXc6asyo1PZKGTfhRu4IKVjMFZ8BgVCPBlIQs33VTvSnsRtt5+KxlS8nIb/dEof95MP0ttkxL3lDXlbfeKSNWVDBh/CYwOBPQRndJ5a6p5T0K72D6Q/xK62uxInGViW4SOTEQRVbcW8WDFTebaHE3Ov9loW9X2wG5PPQREazwEJNcPbmlBsjtSzkJT/PBn1Gndb3Z+B1c9SlpxAMrhnsiXSMpe6WGQygkc9scnUS7WNAyOsaw3jVvYa46fIt4snfL9IP/A/2wV+ZPMzRoEH+m04OOrBZ+kL24xgJ5z9uezc4THvf+bzGX3aHCnwA5Fa4Bgx7gZvJgFW4N03Oe3JvL6hKZexHhrchJ+jUlmObBQQTaaXU41A+ZjyDZXg3umrZgyXpeCMCoYc7lFgi7XjHL+FWEFvb7jijh1s20a8yJvU454Q+KzrjNq/vBKDkFyRgILHUqFB8gGspLXP+aka13j6ubYW+6iAAWNmE7D/OczgGksQ7wB7ZeArdqA6jMrjGmpmQDBVjwEDbvK5HcLtCGaOYLYA9bCOY4P0M2A6u2U5y4JKymnAw2+UDRMghkpEv0FVXb7pMv0QlWqsoLKQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lf17dIxhSg9gSs7XvyknxGLS4K8X+IBXajfSBGww1fOqQ3ls7KeVVdhg7sOMjlcxkvY8t3lwKvyWGdPc3ut4abVHAyFlYYF0oDz/yzjN4ekPbv6ZuDLA7Ro8RRiQ5bQKBBBeyqXFFJxO7NBnvMze68ihDR9UDL9bRqy2nPNDJcNOeVZ69COop8VktF3XkcPvnfpY0Cg8DvvIkVCrQLs8GoadRTbgAY/Ke3lQ2j/0MGgcoGmcUtEk6oRjcL4dGT7zVaJPdAzyTOrTRtXvL2K9YiTqQpbh/T3YERxUb2ZdRoNoLTBkPqcbWwqLk3BmdsdZTXGrURfq/P/urMG3SLt+tfH2BwP7Y1+83JUGcLaE8c7VAyqXnmMhwQSGupJxi0q9z+ifP5pzU5nIUVbca+w+Pin0AId47MhY3vfBgNPui3MUmwB0pxcS2qf3p1oICWxQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:54:27.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d49a00-b63f-4a0d-8ac5-08de8121307e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628

FSP supports multiple protocols (COT, PRC) with different message
types, all sharing the same MCTP and NVDM header format.

Extract common headers into FspMessageHeader with a new() constructor
that builds standard MCTP/NVDM headers using the bitfield types. Rename
FspMessage to FspCotMessage for clarity. The COT message construction is
simplified to FspMessageHeader::new(NVDM_TYPE_COT).

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 46 ++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 1bd2ce997d4a..477ed719b757 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -189,24 +189,46 @@ struct NvdmPayloadCot {
     gsp_boot_args_sysmem_offset: u64,
 }
 
-/// Complete FSP message structure with MCTP and NVDM headers.
+/// Common MCTP and NVDM headers shared by all FSP messages.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-struct FspMessage {
+struct FspMessageHeader {
     mctp_header: u32,
     nvdm_header: u32,
+}
+
+// SAFETY: FspMessageHeader is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessageHeader {}
+
+// SAFETY: FspMessageHeader is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspMessageHeader {}
+
+impl FspMessageHeader {
+    /// Construct a standard FSP message header for the given NVDM type.
+    fn new(nvdm_type: NvdmType) -> Self {
+        Self {
+            mctp_header: MctpHeader::single_packet().raw(),
+            nvdm_header: NvdmHeader::new(nvdm_type).raw(),
+        }
+    }
+}
+
+/// Complete FSP COT (Chain of Trust) message structure.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspCotMessage {
+    header: FspMessageHeader,
     cot: NvdmPayloadCot,
 }
 
-// SAFETY: FspMessage is a packed C struct with only integral fields.
-unsafe impl AsBytes for FspMessage {}
+// SAFETY: FspCotMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspCotMessage {}
 
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
 struct FspResponse {
-    mctp_header: u32,
-    nvdm_header: u32,
+    header: FspMessageHeader,
     response: NvdmPayloadCommandResponse,
 }
 
@@ -222,7 +244,7 @@ pub(crate) trait MessageToFsp: AsBytes {
     const NVDM_TYPE: u32;
 }
 
-impl MessageToFsp for FspMessage {
+impl MessageToFsp for FspCotMessage {
     const NVDM_TYPE: u32 = NvdmType::Cot as u32;
 }
 
@@ -405,10 +427,8 @@ pub(crate) fn boot_fmc(
         let frts_size: u32 = if !args.resume { SZ_1M as u32 } else { 0 };
 
         let msg = KBox::new(
-            FspMessage {
-                mctp_header: MctpHeader::single_packet().raw(),
-                nvdm_header: NvdmHeader::new(NvdmType::Cot).raw(),
-
+            FspCotMessage {
+                header: FspMessageHeader::new(NvdmType::Cot),
                 cot: NvdmPayloadCot {
                     version: args.chipset.fsp_cot_version().ok_or(ENOTSUPP)?.raw(),
                     size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
@@ -469,8 +489,8 @@ fn send_sync_fsp<M>(
 
         let response = FspResponse::from_bytes(&response_buf[..]).ok_or(EIO)?;
 
-        let mctp_header: MctpHeader = response.mctp_header.into();
-        let nvdm_header: NvdmHeader = response.nvdm_header.into();
+        let mctp_header: MctpHeader = response.header.mctp_header.into();
+        let nvdm_header: NvdmHeader = response.header.nvdm_header.into();
         let command_nvdm_type = response.response.command_nvdm_type;
         let error_code = response.response.error_code;
 
-- 
2.51.0


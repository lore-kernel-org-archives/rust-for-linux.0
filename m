Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487383F8819;
	Tue, 17 Mar 2026 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788081; cv=fail; b=fHZFSCokuBS0+GLRO81o4hHv/AbeJEsri0783HKXtlIphHddLELRnw97Dzh7gb3i/btTc6EpPJESScZsuBSvBSbJcCEm7cIScIUZfls2dEohn2CoGwryS7hW9zcMED0Aa6hhTYL+OguiLzGGJzl/eNxsmDqvgKyFeBvsh3Nws2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788081; c=relaxed/simple;
	bh=94FqYvlK2Mnkoz8Qno2s3x7woHE+AibFvga0huCWztI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhgVczbER6wXCNh66SuIuC57V7Zu6vu1P3l7qLEhXxVZChggM5h730g/AT9QhyYTgzdZtrTOnWRGN3IZCW+YlW8rnu0aMcOAXtpP528Tpo79Y29c6KEl0xQZwJ/Vzg9u1UeusEcwC5jd5jucJolvc00Gdijjplm/MbjGqUto3L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YyIS0G+j; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YyIS0G+j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9dSKB3OKDEs3MXo+W3i9v5XSEJ2zOTOIR7WUYK5ZvWFKpkVTlSRzK/StmnciBYVosypYVJNq5h6GgqX7XV47ZsQva7e5Fie6S+Px2WHr+zs4uIGTWHAgHb4bLEu+BU55nbyN05NVD8kkXA+7mGLO3HtbFNbLiRKTh1VYnd+23YeODcSrU/ZvEPkQjRk17SzxqXB1Ai27GfxdIBq9aGKd+zEpKvSyIPC9HrWAp9hv7uWkYm8Xtc50TeHhKnJ/DAH7klOD1XMITd2TRcXPir58oi1ehRanY558k7KPKTjzsOcGD+fQ+zbpdBwXoEHj76MD1rSOcWyycFKYRqb+72TiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvfTjUVTcGtGYKs45EbawjgpwxTpwLZtl9Ni4pcA1ZU=;
 b=Se3fdWEv8cMf714eMiZXqmYJBgTvi88XRBccuupQm3RESOd8dF+6rLEcCLhHuu43PcdD5dPLuC44QPr7y4DUL6d1V4fMtz9usYVM2+JoI4r1DZgxH6fYJThBwhgQI9raYPYq/uIc7fCswatIIFocuqPIYjgsclkK5FDK++RvGPQEAKqKRPGtuQVrBm2J/IOczl4xm9ZvNgtuldzIY2wM3uKgLz5+O8VfJ4oYi9AWq/vfU6XVF/acyGLNRCPyorPpGYOfzNyrvwDypEgeudY2fkNEnLqDqu96HY1VembEuZ4vnTMjguwFFWyJOzbplfo9u+czcNCeefOQhPWhoH2rxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvfTjUVTcGtGYKs45EbawjgpwxTpwLZtl9Ni4pcA1ZU=;
 b=YyIS0G+jryDOC3klN/IjIY1bLn94Qvb3eBL/+f3/44MING0y+iEnjgKRFl8klzPBg3Eq3U4e1WNtZmbZo28O1pP38AEDRfYOvSxvReMY+V/P7c1Z7SOQ6kkuS2gHdQXkMva67tbAaNQYYFVReRwj2pauoTvJYI3XE6SOIX95/9VFtEdQu8Auz7+Tr8DCOIR9vaMr812i4KfHGxdClncqnN+rFVHVunUolBpj4/0YbzThjml8C9ICR98DZEmSKGIcBgO8Hwu7QewNkxS/C96tvP/eHjVKtkwNPQlpEbZlyjfJRuaDcLT+i8Q5vplLr0rcu5ZUbWqGKda9a2C8un9xcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:30 +0000
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
Subject: [PATCH v7 24/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Tue, 17 Mar 2026 15:53:48 -0700
Message-ID: <20260317225355.549853-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 334dc8c0-31ed-4278-1439-08de847825cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nPxj07Ns7QD5GKdYQ3YZ+tY3Zm6/4pg/sBHc4Zi2xb4knj6VThAuYgrtZzNVcZMV/2VKUHOFCcDiMwHMpViFKJZxOHShu6ZTz0VdkRYgFTR39f5asuWoAs0bEVc0JJEotVG91HTBeld6nF0js+MNYBUQxozumuGpdSxW3psmOHy7RC7oOY9gnUHhIAQFIlGvBNgs6/6yXljSg6AO9Zf7Rw0QWJieSFvs6sIDBT7jY53FBv9OiyrapCJsVW/Fm1wHJprX2sUBXBu1XEnG8mYctOs6onFFZH/YVH+3pRVXIXvJQGIrWrz1YXcqsHZuDHYzi7Kc3SVwVnu1tRS3qiFpw8w+crXmUS6vaDJ/G+/MR3+QDU1szyD9IhNjxW2bXiTJQL8pNiuBf8P0lDWjxuGPZMHBYG/JfNZMLZQKVRlVDaYgGMcpK534v6/F/qhzpnFcr9ShaIxvwJY6PL532xtFIh0fJ6N54DYXrnT12d209tHpBcqGz7+GyErCJx4nyq0IKx5STtY9AJESu2nkiupqlwoSUcyvK5NT2dgGZpgBCtve0LS/vUsVE2wjKoVZssKwAZzQKsRHkXU0LDq2QJrOWLNGPIuNMDCrqinOLpH+XM+YkFgARupybh1wdGMehrR/tM02hF/qHPMA98a8kQiKjvpAI9shp4atTs1fUMmIhuCieSQfqGQWFlKf50k4cUGTQGzglLbbzameU0MGfcV3yVMNQnkmEU1jzmfjg2104ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x6LR7JJqcFJdgHIYy/eZGuvLg3Vnl0cosMqSLcgo/HeSBKQS6qNCjf3mI+Be?=
 =?us-ascii?Q?VRiy4bIdw8/LAUkJpzofTKqaYull2M/fdWTy9Le4jx+QxIjHYRd3kjXeeZw7?=
 =?us-ascii?Q?MuFPiwXIs3VFDKkGX4B1Grz7/CCWw7gxzV1H9iMLx3c+Ut+qD0UPTcZrmNqs?=
 =?us-ascii?Q?jJ39kkpqej3tMw8pq1uzNgY9ZGTBvslPSN1WO9dUzzVaNHN5Saw/UvCgucSm?=
 =?us-ascii?Q?JRJC1AWSxmOpvvflyoaqNjShenpuedz/FcPeG8YsExjmuAGndxojA6iXvs0R?=
 =?us-ascii?Q?SU53O6JLv+2HZVz5F960YEMnWCgKzis+tkSwHt17w+KX+xJLg/n4lZtnEv2t?=
 =?us-ascii?Q?79sOiTPjPHRxmqeYome7eWyzqNkQxrXnuqnw4bEezcSM9+GKlvGA5zIDOuzR?=
 =?us-ascii?Q?hFteGqqUlMCT3cVDNYVQL51LtgvG3fcjJXHnkz27Z80d0gg5jqwX2mDlE9Ls?=
 =?us-ascii?Q?hIIt4D1pBs1p5MLilmGTNJljif+QeQLO273rj1XVO5C7Rk7xUGmVG1ozyvdn?=
 =?us-ascii?Q?WULmrLN/A5gA0248v7Z4wOSl3j4OfpzbAnz41jy7kLwH21R8EFVOW0FaPiOg?=
 =?us-ascii?Q?iVxzKtbB5BgODkmaDd8JlciFTTcOa8955TukJV2ynbBwCjmcuZn7XO6IeX2M?=
 =?us-ascii?Q?avXtrWKLPagiaVwBwMh1jhSIifNa13RRJR7esaDUOD0jZsaH67oND6PB+4H0?=
 =?us-ascii?Q?V/tb3k+ZqcbF2V9tCkq1LStkFIjWLIQ1cHMO911S3m9eWfktpPGQTc1YpNQq?=
 =?us-ascii?Q?tvEPY3levxBxd768lbh9kQf03EUuQB1PLRra2EG2X61vGj6ze/VQ/8YcuFz3?=
 =?us-ascii?Q?Kut2H/oPrUG0DOrNImag1Fx9iF7Xdy3LmBuNqZDS4y4Sg590tC7x8AEARqHw?=
 =?us-ascii?Q?KMTovJClY/BT8gNsCaxbDFKrtR+EKZ3DO5Ej8aqma10UoGCNoCTs+jpFOqm7?=
 =?us-ascii?Q?tMRbNrQhwZd7KE+6+dYcNt3574cfKR5MlGI2PEHyDYr0HnPN6zsi9eFDx5Om?=
 =?us-ascii?Q?QacRpX5tpmpVlC8ZY+srs7NhoqF286hVEonws1X+h5pB4I0Vc1oIamXdbKkq?=
 =?us-ascii?Q?LU5ItpdUHDg9fCIgIT7cLfFFaBpALbmiQL/frpKqV1WrSZvhtKqiW9T8bTdD?=
 =?us-ascii?Q?jbnnkZp4kyteViLD0rLyjBcCYOYDCVa4fodrSawqvBuHBXM2FA2P6qIAkwOr?=
 =?us-ascii?Q?mP+tfFdQfTZdyfzmtIThaAjsMDz5ltue/7Q5pybbT3mgR9+kAUP09g5Fp53f?=
 =?us-ascii?Q?JQlY7jepGxwpjkzljxtHV+axGqzteLDlM7wI+Z8jgAXKQxkZQXJVyyDs5ujI?=
 =?us-ascii?Q?feX6NyhJPv4Uxcz10etaYjQ1KpDvnYavAMHjZDUutIhocSBA8+0LsqXmugWg?=
 =?us-ascii?Q?g0PyRx/YvGCgXkg83zpOyXoDIuhq6XjU6PIk8IHgo7yssApMY8xJjY/IyjnX?=
 =?us-ascii?Q?/oFqsSWT/TAPNwQFPudaL2C/zSgoZ3UoinI/2FboRuApDHSOnc23aSwMP2/n?=
 =?us-ascii?Q?trSrq08dm0GrXB8M2ojy/RI3pSkSdypj/EvsAllPYtjynqiRtxFhHgFbNj9F?=
 =?us-ascii?Q?+S8BnjlXUCAr6UiHhV8RFItiy+X43C3YvL4k0XWHbaEM80PCY4uSxvt7MZCX?=
 =?us-ascii?Q?rafRihQvQYMyAgUEuhAHjiXclWenzYbgnL/UGCNtBug86Fv6ue7+J6HFbTXI?=
 =?us-ascii?Q?eMNEKKNfH3dvH+CjNu9m4iNLUAXEvqRcgfia/53ekI26+6ZDX/enRTF4jY9S?=
 =?us-ascii?Q?+RZ8/iDhfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334dc8c0-31ed-4278-1439-08de847825cf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:29.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTxCr0f28WSn7bC3Ajfg70O+QPGA2t4PIAnIWI4XpFirZqncRWui4Ofk5xf4pdw18YGolp/Oqc01iYY+ziyafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
reads at boot time. The FspFirmware struct fields become pub(crate) and
fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
extraction.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |  12 +-
 drivers/gpu/nova-core/fsp.rs          | 174 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs          |   1 -
 drivers/gpu/nova-core/mctp.rs         |   7 --
 4 files changed, 179 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 5aedee8e6d41..e5059d59a4b7 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,24 +14,22 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    fmc_image: DmaObject,
+    pub(crate) fmc_image: DmaObject,
     /// Full FMC ELF data (for signature extraction).
     pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
         ver: &str,
     ) -> Result<Self> {
         let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
-        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
-        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
 
         // FSP expects only the "image" section, not the entire ELF file.
         let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
@@ -39,6 +37,10 @@ pub(crate) fn new(
             EINVAL
         })?;
 
+        // Copy the full ELF into a kernel vector for CPU-side signature extraction.
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
         Ok(Self {
             fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
             fmc_full,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 18edf7a1a8e4..68bcfe45aec6 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,8 +8,14 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{SZ_1M, SZ_2M},
     time::Delta,
     transmute::{
         AsBytes,
@@ -38,7 +44,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Return the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -156,6 +161,35 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
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
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -176,6 +210,84 @@ pub(crate) trait MessageToFsp: AsBytes {
     /// NVDM type identifying this message to FSP.
     const NVDM_TYPE: u32;
 }
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs<'a> {
+    chipset: crate::gpu::Chipset,
+    fmc_image_fw: &'a crate::dma::DmaObject,
+    fmc_boot_params: CoherentAllocation<GspFmcBootParams>,
+    resume: bool,
+    signatures: &'a FmcSignatures,
+}
+
+impl<'a> FmcBootArgs<'a> {
+    /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    #[expect(dead_code)]
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &'a crate::dma::DmaObject,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+        resume: bool,
+        signatures: &'a FmcSignatures,
+    ) -> Result<Self> {
+        // `GSP_DMA_TARGET_*` is not in the current Rust bindings yet.
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        kernel::dma_write!(
+            fmc_boot_params,
+            [0]?.boot_gsp_rm_params,
+            GspAcrBootGspRmParams {
+                target: GSP_DMA_TARGET_COHERENT_SYSTEM,
+                gsp_rm_desc_size: wpr_meta_size,
+                gsp_rm_desc_offset: wpr_meta_addr,
+                b_is_gsp_rm_boot: 1,
+                ..Default::default()
+            }
+        );
+
+        kernel::dma_write!(
+            fmc_boot_params,
+            [0]?.gsp_rm_params,
+            GspRmParams {
+                target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+                boot_args_offset: libos_addr,
+            }
+        );
+
+        Ok(Self {
+            chipset,
+            fmc_image_fw,
+            fmc_boot_params,
+            resume,
+            signatures,
+        })
+    }
+
+    /// DMA address of the FMC boot parameters, needed after boot for lockdown
+    /// release polling.
+    #[expect(dead_code)]
+    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
+        self.fmc_boot_params.dma_handle()
+    }
+}
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -277,8 +389,66 @@ pub(crate) fn extract_fmc_signatures(
         Ok(signatures)
     }
 
-    /// Send message to FSP and wait for response.
+    /// Boot GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
     #[expect(dead_code)]
+    pub(crate) fn boot_fmc(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        args: &FmcBootArgs<'_>,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let fmc_addr = args.fmc_image_fw.dma_handle();
+        let fmc_boot_params_addr = args.fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let frts_reserved_size = crate::fb::calc_non_wpr_heap_size(args.chipset)
+                .checked_add(u64::from(crate::fb::PMU_RESERVED_SIZE))
+                .ok_or(EINVAL)?;
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+        let frts_size: u32 = if !args.resume { SZ_1M as u32 } else { 0 };
+
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: MctpHeader::single_packet().raw(),
+                nvdm_header: NvdmHeader::new(NvdmType::Cot).raw(),
+
+                cot: NvdmPayloadCot {
+                    version: args.chipset.fsp_cot_version().ok_or(ENOTSUPP)?.raw(),
+                    size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
+                        .map_err(|_| EINVAL)?,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: args.signatures.hash384,
+                    public_key: args.signatures.public_key,
+                    signature: args.signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
+    /// Send message to FSP and wait for response.
     fn send_sync_fsp<M>(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1d25513fef20..066bf1e03652 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -139,7 +139,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
     ///
     /// Hopper (GH100) uses version 1, Blackwell uses version 2.
     /// Returns `None` for architectures that do not use FSP.
-    #[expect(dead_code)]
     pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
         match self.arch() {
             Architecture::Hopper => Some(FspCotVersion::new(1)),
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 9e052d916e79..c23e8ec69636 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -6,8 +6,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 /// NVDM message type identifiers carried over MCTP.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 #[repr(u8)]
@@ -101,11 +99,6 @@ pub(crate) fn nvdm_type(self) -> core::result::Result<NvdmType, u8> {
         NvdmType::try_from(self.raw_nvdm_type())
     }
 
-    /// Extract the NVDM type field as a raw value.
-    pub(crate) fn nvdm_type_raw(self) -> u32 {
-        u32::from(self.raw_nvdm_type())
-    }
-
     /// Set the NVDM type field from a typed value.
     pub(crate) fn set_nvdm_type(self, nvdm_type: NvdmType) -> Self {
         self.set_raw_nvdm_type(u8::from(nvdm_type))
-- 
2.53.0


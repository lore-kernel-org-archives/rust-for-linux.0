Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE6E299931;
	Thu,  5 Mar 2026 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737811; cv=fail; b=QPUWiPtWhA/7lXqUOnlZFqqzoETgjqu/4w1KggKxn8yLCNl7/ORE8IgTGutUfCdod3eR4XPA6c6mn9Mw2dDdL2/GTTfNsbcvKkWq6uyECFo2yA9nqlbhJrDTy+CGhwsZQ3aZ/lIebderNZfcgw754gj0LPPGfm3tGziKOCpV37E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737811; c=relaxed/simple;
	bh=I1h7QXlFVr9gcTrPX5eOQPTwBHFcp6QqQX2TLa8RhJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yt+L+IUNXf2dyfU6+7IFbMHFXMZBnat3/BBIQ0KAg0O9+9kZ47Toa4IaXwyTq4+VJeCyhqubWEQU5V5HWgOAma8uEwOnpYcvmaizqPiWWCJ0pwWJwLVGcKIR4X3SxsXHzB9DGoas5tcklOeb9BPxY/fXeozNbPi7BIUAMBMNnp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tY0oh2L0; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tY0oh2L0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCrtOm3rvon4ak+Iz6Ff+pzzfnaHcXzLkVZ4CkWoA21gxedln4pAFzlcZ13aGJ0n48CqtfXWgvDFu2Bj6t65k24TZGyUhtZNazxjgDOAGH+xspdsTXBIJATDWIn4stQ/NACZ7sa1Fh6T5fSDT7NleD1jv2ZqwHoAvZgSy/vsJmSIY5nohMgtZod2mQATCSW/VYkkB9C6vL8Gjo6Mbm5HnSWv0di00YLWdPHJbI41MUHUmvC7ibH7R9uxvP2u6rfDdpWmFyI4jGNhGaVYEukaaqH+n7GOUTqY0+mRRZCWNkpiHgGoZgjCDl+vMQuvzCuvf69LfOovLVcxfo8TqnR4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq/aCZAoSYED0g+JQIGxvTflRJKsTntXkjxcSbpOvSk=;
 b=bPP6vJ8DiOxDgD1K52kZAAc1DXXrP14EHD0OzbRXwps8a+eGjvpjcoBHV/ghA6l/SLS6IIPyHt2cB4U995L+PxmuSk+YV3qDdCMu1IjmZJslCtCAZQKPMwKVjRTPoZnOFCj0yxmESJm62YxQvqJkOTksnm7aHFQZRZa1Lfop1VB/+d9B757Ylz0hAn3RCyo2YJKImTr/c8zQY8fNhcAcUuWjcec4PkiXRHObmVLu8cH/5kPO41dorA4hqG1Ol3+X3lNHSS9HQkCigvmC84NniNmOhTB49CQ+bhTnMR13FDENwp5eLlL0N4juFN7dgxFlkbMZm/L1iLr4n9jyBuxsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq/aCZAoSYED0g+JQIGxvTflRJKsTntXkjxcSbpOvSk=;
 b=tY0oh2L01CvMkNcgsbv+ShuCAKUb9MH7OBqhBzu1blVDkV9l92rKiKZFUe+D5P/Fzw2ddb2FPUM6XaS8X2WYxh+d/aU6m/ZrAUiAOyMHklVlLX9YsAxHYNRzMJ3pAz4gC/xlIY80n7D9+vYfbSYP1Kru6J0kMYThqQHU5W6KaL6fmgEVPoZQUaDIPzZLxlB9ZWdyv2pI4nbkLiT/keDXEn57d0jZ/dytJbMkWOJVmZZ++NwiuCyXDnHG1+yNf4KDb6qWOSqI36HSHegt4lKP2EcB88s0dAwoWEIS246ibTPHyHGLA2hstzdzkRKTewp7YtaBfBIeNcb8qWumSIdU2w==
Received: from SA9PR13CA0099.namprd13.prod.outlook.com (2603:10b6:806:24::14)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:10:01 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::bb) by SA9PR13CA0099.outlook.office365.com
 (2603:10b6:806:24::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.17 via Frontend Transport; Thu,
 5 Mar 2026 19:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:10:00 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:09:40 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:09:39 -0800
Received: from ipp2-2316.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:09:39 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <dakr@kernel.org>, <jgg@nvidia.com>, <gary@garyguo.net>,
	<joelagnelf@nvidia.com>, <aliceryhl@google.com>, <bhelgaas@google.com>,
	<kwilczynski@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <tmgross@umich.edu>, <markus.probst@posteo.de>,
	<helgaas@kernel.org>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <acourbot@nvidia.com>, <jhubbard@nvidia.com>,
	<zhiwang@kernel.org>, <daniel.almeida@collabora.com>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware control interface
Date: Thu, 5 Mar 2026 19:09:36 +0000
Message-ID: <20260305190936.398590-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305190936.398590-1-zhiw@nvidia.com>
References: <20260305190936.398590-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: b1670129-09b4-4392-bf12-08de7aeaccbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	VinNu5Zn+AMppdudrTo1cfzrmBhp6ASc3BzUWtFiczCXnQXOINADa47R0xvHuAfF8od3eBi4FtoJNVoGH2FGs/tkDZhCGp7i03NaVzJtXSJw56wcCCOH8wlvBctZEfgSzkX82uiVEmTlu7rlYHkZzSkiR6rgLHF3LqgwKiowGd2nn9rHCPHLRwR8YBmcKhyDA1s6NFsAOjmB8oPkZVvRsHjXZwk7H3R1W0zc3AU0Nlv8LNqlYvenXaPHwieZZ/idN9gOO5f1o89gOrYXVKo63Bzo20cBsnfVH3V7G1/Q17hZVv2o/dUShXePgJq67hpvFx9CpmROO3kzH0jtHqDo/rCcN702asIiOwSePivP+mRzZK3CE8j8ibxyf7ol9GsSdG0LKtcglf/urcl09eErpPAcwKRJXx9t/xQzYRf1Y3UoWNfcQM1Oal8psJo2SnUb6wKoH/PRuULf2Y+bgubucU+goEi5TamEm5LVoYj5+IkUDXfLvbo7qaQj0Qod1oVtDUDCCAejQrs+R88VfmLPQ6RIZgdx+4H9ybl8IoI+MOb9INHkO4ZyLGtS6su3i0a4F8I82krZ+tbx5ZEMa5qe0HkozNpHgg8HFcOTkfU0R39/uZvLFyzPZP82nqIr8jRMiDTb21eDOONaD4kut+81el5A1ghLJzmuhVJc5Wsm9sOWi0RMJZcQpXXS68dw6GZKvf70U4iOQdtshYZ+mj3crtqenn5cAcFPETWsn64hpJtY/+jssi9ke2F9Iclz/0CTksC9g0Soh5QlMJyRAoym3Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yUVYcIc07XYzN+5fPCuiPF0nZIyM3pa1foXCyV9WwYU1lbCTtEdkx7g10/KnaiI9SIJSjwqby2g/Na/8U8WIoboiGOK4H8wok0P2axrNNEZWSTNx4e12IZqPdUegjJGqSVFh5RyASFUzMzJ9fwA4BZloRac3LZUlbHmEIj9RVWEyDG1Skat270LSyk297buMWIFsKebdWZqYeyO06Dgzrh3pwNS4Z7Pf7mSC2731xjvdhmos/CS5sN7LrMTIuVLNp57NFKLFgy2ybBNHfN9K34omQ3d10eCcQ82yiYyb2yA1BwxjeA8VTgIRwwSJ5rR+snywangszgDt5dMdIBLgw6bjxzz/tF6wfrue7znQec+feGdxjZwGlnxQ7y4ZbjSHGa7llMIbY9b+Q44GrV4F+RnlaN6jRijg7VU2WlWH0WZXsQt1oVpmDpQHMJPeIsvV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:10:00.7663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1670129-09b4-4392-bf12-08de7aeaccbc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

Add a fwctl driver that provides an infrastructure for userspace to
issue firmware commands to the GSP. New commands can be added by
extending RmControlMsgFunction and the fwctl command dispatch table.

As a first user, add FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TYPE, which uploads
vGPU type definitions to the GSP. It is a required step before any vGPU
can be created.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fwctl.rs                | 99 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs                  |  4 +-
 drivers/gpu/nova-core/gsp.rs                  | 25 ++++-
 drivers/gpu/nova-core/gsp/boot.rs             |  6 +-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 drivers/gpu/nova-core/gsp/fw/rm.rs            |  5 +
 drivers/gpu/nova-core/gsp/rm/commands.rs      |  4 +-
 drivers/gpu/nova-core/nova_core.rs            |  2 +
 include/uapi/fwctl/fwctl.h                    |  1 +
 include/uapi/fwctl/nova-core.h                | 52 ++++++++++
 rust/kernel/fwctl.rs                          |  2 +
 rust/uapi/uapi_helper.h                       |  1 +
 12 files changed, 193 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fwctl.rs
 create mode 100644 include/uapi/fwctl/nova-core.h

diff --git a/drivers/gpu/nova-core/fwctl.rs b/drivers/gpu/nova-core/fwctl.rs
new file mode 100644
index 000000000000..9ec147a815db
--- /dev/null
+++ b/drivers/gpu/nova-core/fwctl.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    fwctl::{
+        self,
+        DeviceType,
+        FwRpcResponse,
+        Operations,
+        RpcScope, //
+    },
+    prelude::*,
+    transmute::{AsBytes, FromBytes},
+    uapi, //
+};
+
+use crate::{
+    driver::NovaCore,
+    gsp::{
+        RmControlMsgFunction,
+        rm::commands::send_rm_control, //
+    },
+};
+
+/// Byte-serializable wrapper for [`uapi::fwctl_rpc_nova_core_request_hdr`].
+#[repr(transparent)]
+struct FwctlNovaCoreReqHdr(uapi::fwctl_rpc_nova_core_request_hdr);
+
+// SAFETY: All fields are plain `__u32` with no padding.
+unsafe impl FromBytes for FwctlNovaCoreReqHdr {}
+
+/// Byte-serializable wrapper for [`uapi::fwctl_rpc_nova_core_resp_hdr`].
+#[repr(transparent)]
+struct FwctlNovaCoreRespHdr(uapi::fwctl_rpc_nova_core_resp_hdr);
+
+// SAFETY: All fields are plain `__u32` with no padding.
+unsafe impl AsBytes for FwctlNovaCoreRespHdr {}
+
+/// Per-FD fwctl user context and operations for nova-core.
+pub(crate) struct NovaCoreFwCtl;
+
+impl Operations for NovaCoreFwCtl {
+    type DeviceData = ();
+
+    const DEVICE_TYPE: DeviceType = DeviceType::NovaCore;
+
+    fn open(_device: &fwctl::Device<Self>) -> Result<impl PinInit<Self, Error>, Error> {
+        Ok(Ok(NovaCoreFwCtl))
+    }
+
+    fn fw_rpc(
+        _this: &Self,
+        device: &fwctl::Device<Self>,
+        scope: RpcScope,
+        rpc_in: &mut [u8],
+    ) -> Result<FwRpcResponse, Error> {
+        let hdr_size = size_of::<FwctlNovaCoreReqHdr>();
+
+        if rpc_in.len() < hdr_size {
+            return Err(EINVAL);
+        }
+
+        if scope != RpcScope::Configuration {
+            return Err(EPERM);
+        }
+
+        let (hdr, _) = FwctlNovaCoreReqHdr::from_bytes_prefix(rpc_in).ok_or(EINVAL)?;
+        let cmd = hdr.0.cmd;
+
+        let rm_cmd = match cmd {
+            uapi::fwctl_cmd_nova_core_FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TYPE => {
+                RmControlMsgFunction::VgpuMgrInternalPgpuAddVgpuType
+            }
+            _ => return Err(EINVAL),
+        };
+
+        let parent = device.parent();
+        let data = parent.drvdata::<NovaCore>()?;
+        let bar = data.gpu.bar.as_ref().access(parent)?;
+
+        let params = &rpc_in[hdr_size..];
+        let reply_params = send_rm_control(
+            &data.gpu.gsp.cmdq,
+            bar,
+            data.gpu.gsp.h_client,
+            data.gpu.gsp.h_subdevice,
+            rm_cmd,
+            params,
+        )?;
+
+        let resp_hdr = FwctlNovaCoreRespHdr(uapi::fwctl_rpc_nova_core_resp_hdr {
+            mctp_header: 0,
+            nvdm_header: 0,
+        });
+        let mut out = KVec::new();
+        out.extend_from_slice(resp_hdr.as_bytes(), GFP_KERNEL)?;
+        out.extend_from_slice(&reply_params, GFP_KERNEL)?;
+        Ok(FwRpcResponse::NewBuffer(out))
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60c85fffaeaf..7965ce37eb08 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -241,7 +241,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
-    bar: Arc<Devres<Bar0>>,
+    pub(crate) bar: Arc<Devres<Bar0>>,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
@@ -251,7 +251,7 @@ pub(crate) struct Gpu {
     sec2_falcon: Falcon<Sec2Falcon>,
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
-    gsp: Gsp,
+    pub(crate) gsp: Gsp,
 }
 
 impl Gpu {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1a1c4e9808ac..77eb30010c2f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -4,11 +4,13 @@
 
 use kernel::{
     device,
+    devres::Devres,
     dma::{
         CoherentAllocation,
         DmaAddress, //
     },
     dma_write,
+    fwctl,
     pci,
     prelude::*,
     transmute::AsBytes, //
@@ -21,15 +23,19 @@
 mod sequencer;
 
 pub(crate) use fw::{
+    rm::RmControlMsgFunction,
     GspFwWprMeta,
     LibosParams, //
 };
 
 use crate::{
-    gsp::cmdq::Cmdq,
-    gsp::fw::{
-        GspArgumentsPadded,
-        LibosMemoryRegionInitArgument, //
+    fwctl::NovaCoreFwCtl,
+    gsp::{
+        cmdq::Cmdq,
+        fw::{
+            GspArgumentsPadded,
+            LibosMemoryRegionInitArgument, //
+        },
     },
     num,
 };
@@ -117,6 +123,12 @@ pub(crate) struct Gsp {
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
     rmargs: CoherentAllocation<GspArgumentsPadded>,
+    /// Cached RM internal client handle from GSP static info.
+    pub(crate) h_client: u32,
+    /// Cached RM internal subdevice handle from GSP static info.
+    pub(crate) h_subdevice: u32,
+    /// fwctl registration for userspace RM control.
+    fwctl: Pin<KBox<Devres<fwctl::Registration<NovaCoreFwCtl>>>>,
 }
 
 impl Gsp {
@@ -125,6 +137,8 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
+            let fwctl_dev = fwctl::Device::<NovaCoreFwCtl>::new(pdev.as_ref(), Ok(()))?;
+
             Ok(try_pin_init!(Self {
                 libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
                     dev,
@@ -140,6 +154,9 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     1,
                     GFP_KERNEL | __GFP_ZERO,
                 )?,
+                h_client: 0,
+                h_subdevice: 0,
+                fwctl: KBox::pin_init(fwctl::Registration::new(pdev.as_ref(), &fwctl_dev), GFP_KERNEL)?,
                 _: {
                     // Initialise the logging structures. The OpenRM equivalents are in:
                     // _kgspInitLibosLoggingStructures (allocates memory for buffers)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index bc53e667cd9e..f493546b78ff 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,7 +128,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -221,6 +221,10 @@ pub(crate) fn boot(
 
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&self.cmdq, bar)?;
+        // SAFETY: h_client and h_subdevice are not structurally pinned.
+        let this = unsafe { self.as_mut().get_unchecked_mut() };
+        this.h_client = info.h_client();
+        this.h_subdevice = info.h_subdevice();
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 354ee2cfa295..b5b16451a507 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -45,6 +45,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
 pub const NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE: u32 = 545270280;
+pub const NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE: u32 = 545275907;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
diff --git a/drivers/gpu/nova-core/gsp/fw/rm.rs b/drivers/gpu/nova-core/gsp/fw/rm.rs
index 9f1e3546d39d..c0b6e90ee135 100644
--- a/drivers/gpu/nova-core/gsp/fw/rm.rs
+++ b/drivers/gpu/nova-core/gsp/fw/rm.rs
@@ -19,6 +19,8 @@
 pub(crate) enum RmControlMsgFunction {
     /// Get the CE fault method buffer size.
     CeGetFaultMethodBufferSize = bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE,
+    /// Upload vGPU type definitions to GSP.
+    VgpuMgrInternalPgpuAddVgpuType = bindings::NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE,
 }
 
 impl TryFrom<u32> for RmControlMsgFunction {
@@ -29,6 +31,9 @@ fn try_from(value: u32) -> Result<Self> {
             bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE => {
                 Ok(Self::CeGetFaultMethodBufferSize)
             }
+            bindings::NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE => {
+                Ok(Self::VgpuMgrInternalPgpuAddVgpuType)
+            }
             _ => Err(EINVAL),
         }
     }
diff --git a/drivers/gpu/nova-core/gsp/rm/commands.rs b/drivers/gpu/nova-core/gsp/rm/commands.rs
index 1d045e6f1afb..02670899d2bc 100644
--- a/drivers/gpu/nova-core/gsp/rm/commands.rs
+++ b/drivers/gpu/nova-core/gsp/rm/commands.rs
@@ -98,7 +98,7 @@ fn read(
 }
 
 /// Sends an RM control command, checks the reply status, and returns the raw parameter bytes.
-fn send_rm_control(
+pub(crate) fn send_rm_control(
     cmdq: &Cmdq,
     bar: &Bar0,
     h_client: u32,
@@ -106,7 +106,7 @@ fn send_rm_control(
     cmd: RmControlMsgFunction,
     params: &[u8],
 ) -> Result<KVVec<u8>> {
-    let reply = cmdq.send_sync_command(bar, RmControl::new(h_client, h_object, cmd, params))?;
+    let reply = cmdq.send_command(bar, RmControl::new(h_client, h_object, cmd, params))?;
 
     Result::from(reply.status)?;
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b5caf1044697..863dc041272c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fwctl;
 mod gfw;
 mod gpu;
 mod gsp;
@@ -27,6 +28,7 @@
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
+    imports_ns: ["FWCTL"],
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
index 716ac0eee42d..f6289fbf3062 100644
--- a/include/uapi/fwctl/fwctl.h
+++ b/include/uapi/fwctl/fwctl.h
@@ -45,6 +45,7 @@ enum fwctl_device_type {
 	FWCTL_DEVICE_TYPE_MLX5 = 1,
 	FWCTL_DEVICE_TYPE_CXL = 2,
 	FWCTL_DEVICE_TYPE_PDS = 4,
+	FWCTL_DEVICE_TYPE_NOVA_CORE = 5,
 };
 
 /**
diff --git a/include/uapi/fwctl/nova-core.h b/include/uapi/fwctl/nova-core.h
new file mode 100644
index 000000000000..3f1d94b44ec8
--- /dev/null
+++ b/include/uapi/fwctl/nova-core.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES
+ *
+ * nova-core fwctl device specific definitions.
+ *
+ * The device_type for this file is FWCTL_DEVICE_TYPE_NOVA_CORE.
+ */
+#ifndef _UAPI_FWCTL_NOVA_CORE_H
+#define _UAPI_FWCTL_NOVA_CORE_H
+
+#include <linux/types.h>
+
+/**
+ * enum fwctl_cmd_nova_core - Firmware command identifiers
+ * @FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TYPE: Upload vGPU type definitions to GSP.
+ *     Payload is NV2080_CTRL_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE_PARAMS.
+ */
+enum fwctl_cmd_nova_core {
+	FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TYPE = 0,
+};
+
+/**
+ * struct fwctl_rpc_nova_core_request_hdr - ioctl(FWCTL_RPC) input header
+ * @cmd: Command identifier from &enum fwctl_cmd_nova_core.
+ * @mctp_header: MCTP transport header (packed u32).
+ * @nvdm_header: NVDM vendor-defined message header (packed u32).
+ *
+ * Placed at &struct fwctl_rpc.in with total length &struct fwctl_rpc.in_len.
+ * The access scope is specified through &struct fwctl_rpc.scope.
+ * Followed by command-specific input parameters.
+ */
+struct fwctl_rpc_nova_core_request_hdr {
+	__u32 mctp_header;
+	__u32 nvdm_header;
+	__u32 cmd;
+};
+
+/**
+ * struct fwctl_rpc_nova_core_resp_hdr - ioctl(FWCTL_RPC) output header
+ * @mctp_header: MCTP transport header (packed u32).
+ * @nvdm_header: NVDM vendor-defined message header (packed u32).
+ *
+ * Placed at &struct fwctl_rpc.out with total length &struct fwctl_rpc.out_len.
+ * Followed by command-specific output parameters.
+ */
+struct fwctl_rpc_nova_core_resp_hdr {
+	__u32 mctp_header;
+	__u32 nvdm_header;
+};
+
+#endif
diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
index bbced4761e0c..345e96144028 100644
--- a/rust/kernel/fwctl.rs
+++ b/rust/kernel/fwctl.rs
@@ -34,6 +34,8 @@ pub enum DeviceType {
     Cxl = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_CXL,
     /// AMD/Pensando PDS device.
     Pds = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_PDS,
+    /// NVIDIA Nova Core GPU device.
+    NovaCore = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_NOVA_CORE,
 }
 
 impl From<DeviceType> for u32 {
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 06d7d1a2e8da..df3309afc055 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -10,6 +10,7 @@
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
 #include <uapi/drm/panthor_drm.h>
+#include <uapi/fwctl/nova-core.h>
 #include <uapi/linux/android/binder.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
-- 
2.51.0


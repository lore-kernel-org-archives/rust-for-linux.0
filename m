Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E01D3F7E8B;
	Tue, 17 Mar 2026 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788118; cv=fail; b=mjQmsZU5NBEqAf+v7GLiR1VwCHOooGYaoOxbiSPcobCz8owOJUTxhKFI7sCyWeGK8iVQc49KrGtBLViQWX0yA3jlqKRKu0x6Wqk6XKpGW6LS7XtwDfALVGE9zRtm7Zl9iemW2ijnm/ANk7yW5focQ9CQyHTwwjN7xT4wI2Dq8is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788118; c=relaxed/simple;
	bh=uFiFZFWe2gRizISHB2jX3mDq9W/PvylOeP9Q+wly9Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+etFYze4QUAL7/8YwuZBFY8vw36Bwu1g0ycmErf+r+jEdK7/JL3G61oQYgnx+F4utJyotpftj7DsxqXlp1RCd+3ZdNdUuqaFonYoWDLAIj704cwkMG/XzZDiwW5iyvsKOYB+zRc7FuOhqZfA9QTq2TlHf7H0R3ngTehw8yvgi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N4ipS8xc; arc=fail smtp.client-ip=40.107.200.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N4ipS8xc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGfe+OrWz8wTWFX/CCYOfBq31XPETK5D5YsC5ybPqHgqZEnrP0yxeijnK3TE6NtpEJW5tmruJ8rBv4NEt46ydxbZPmglQSNNu2oij5Q9Qq49lyccTl48o5kko/sY8S5tIh/5TPufcWsTCW/CWRnQSEhEQZX0+BD5WM1gPoQ8y7/OiDVeNvRXaEXi7E5BzcwMvO+LA4jW0JfJwZEX8ad7tv7HXxpFOhmt7FwiKznIFykHCK6VRQHf+46BssQUEybno3WIOB8Pi+B7Fwg5Pw+G9/3Ia5G0esYi5/yNeYGelca6NdV/lOARmJH+Vo9JwrIM0qVwnZfljHLCyZ6CHwM6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go5sNPfOTph4tltNXQgP2r4jtPYuAKz5FtA2LqEcMfM=;
 b=G/QzwhtIKeYrbOojxYFa4uDTVjIQqTy8unS3pv/7ipoJ3HUvmnniDHahlfewyp4XY664r2zPd++5eAH3l11D0WSz5Dncw+3PnRjQTU5D0vmkgalIdLMtHkznpBUbDjnLRc2/OZ8iCP2tmhTqBrqzt44e/9TYMdo2ptvMvfS1JN4mIrghtDn2drnWZjfHwf9buJOtniAMBXG1AvYLn3MTYmwMN7cwl1WQ4he43UNNv2a1uBVaCLG064RkiS5gBwfmesmlotKKIUycztU7zYN/fburVbCpqGDbvoodsnKNGESznUbpois3CGVKcaS2umbmDaWl6whiLj4I3wMtbOehPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go5sNPfOTph4tltNXQgP2r4jtPYuAKz5FtA2LqEcMfM=;
 b=N4ipS8xcdd6pEikFNzRwn9rTxagZv/Z0tx9L/NeVrXvLGg45qqgj8zeWeDWRxZWyVYPcb4YFNFTdkcRuzYG6VcoqljEKmUf+/QV/5WjAZOC26eBZ0PxTizL+X8m0JCt45G2Nb/14M2GI1B+SaOujgMu7t6HHOlbV0LCTq1zWzCQ8kYQEtwErBrk5HHmOdrdO7y86Qzy0y7oO3svqj2bIL5Ji2J2PzkjfRY27rUf6t8FZ8e73G6/CsmNdlW10AcHJZTMys9Qwr+FWp9tzYAo8xJUikaPY8kl2Iepg/5YTpyK4aVe+Sx0GacryuC1WvK3zcV6yF4SYeJDiOohi1qWDyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:55:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:55:11 +0000
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
Subject: [PATCH v7 31/31] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
Date: Tue, 17 Mar 2026 15:53:55 -0700
Message-ID: <20260317225355.549853-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 91062126-2845-47f7-e1a8-08de84782ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l59AN+zMvTM8VWaEv1HvAIACyRFRqNaRF8U9gBOdTyPzGm0JHfOzKY3QpB4C/iw1zQZnZAodDN6PUenPnrN9eqB2NrPJqsu/2rRBddY4CXPq0fnb9VSfXCd93Efiy1/ZwpkFh07SQXq5sHMAD5iQcoxg0aAEF/10BUzWiLKct7NTJ4GDQDFb+MVO0bBdUsEMF5jR5CzYGrbajDe4Oq0U7rlLaNQ83j+fhyLSIILljKjttqtGMD9FtLXTcppjv8HNza+n7Wb5htvyZujt1+d77TqYqSGqm8qmD/Apc/mBhVk1sYELKi3LoRqNCECwGqyOYPdHFXz/VC55zTgfpD3N4GVZFRz9XfzplyQSwK+tR2LYrrD0uREZuXfHU+RzgRNRkP+ndgdZq5jaBBo1PEIXZ37C7CB57a2UDYRyZBQpc93/hOFT6hXxqVMCve5qHrPj6flBUJHdOtk+nTtF8iEMzEb/Pf/XGMrU2S5v8pLnZORm4DyQWoT435uG/lSFgwJHwKePG0nmXXCDzCowktuqcRFbohcPHz3VEjxkblw+/wAHS/Sn2IrYemyD7/AfCz2ixL9xPUGHHUgbrp7HN4V8YuXc0sdruc28Ie/Kr1jEUVbFPUkQnC24FAgJzVgO2QjxNpYrdFIXQWf/eH6QsH38ZDmLBvGQezjHbUD0tdy9KDPkp+DU6YrMmoxl6QpLiduTflm5YC7L/n1l9TCB9s6aKLgQ4D3xtHDVyWAg2Hg8794=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N7bH6OmHoUl3moK+rnzBhmsQj9GulobZtYNQB40+Lt5wuWzaflYaGGsWz6wl?=
 =?us-ascii?Q?nyHaCpE1oWlQYr1ZYnm1D0u/esOjv+Uwi73wBbUuG3tf3mRuTUrYCoD5Bjob?=
 =?us-ascii?Q?uzpmDQR/xO0jrHuQY/7D9GXf5AFR3TS5E9o+P7pfmuRpZqtJhFyioZg92GFd?=
 =?us-ascii?Q?aG8zp1rQO4ZmN2bg2paRqCKs8kD2PlbB7v03WVmjELHZlCRL/mi/9oSuM9QL?=
 =?us-ascii?Q?uGRHYCOrIIOZxyqE9cSHjtz7OJgmN7Qvau3+B82/x/Hv4KtlYLtJvoyyOiae?=
 =?us-ascii?Q?hNTh71ZsmYOSZZFX/JDf1oSWLq8Is9lktvY7xjuL9k7HUR3BpqZ+8nDHU88i?=
 =?us-ascii?Q?YxJdLJLr9kHeb4pTzeZhNN8saOj5HShs8qGBGZzdvnVdDqbsak2CrOrSzg/t?=
 =?us-ascii?Q?vzdJqxWs8rJae6+/uX51TFdG2KbC30GmaLV9dlHrcJSX+ZwaTydjLNfAOcJG?=
 =?us-ascii?Q?p8X1BhXsU8Wt6oXYs0Af8tu4VHGYj0Npp0dnClOZc/4BNjE25StmZFlzE8OR?=
 =?us-ascii?Q?G2zg4pMraDjEPoldSnMm+X4QVT0OTWh6BJ5Ck9EcB5ZOUOgfM4WZ11F8tksV?=
 =?us-ascii?Q?V1TGHBh+twTkJJgeukHEvPTrUhzy+wWh6kYyPypsa+Nr4AfUyFRnNFlPFfB8?=
 =?us-ascii?Q?JSCNHIxYwsjgYCx6A7zi7cU/N8MCS9qcvaoSn/ORZ2TPU+Ow46d/2WUJI79F?=
 =?us-ascii?Q?dDcQewI7IdQW0GOMAvx+rz66WNby8ZCKvg+pQQEjwjVEKPOQgSfBsBzYIyd2?=
 =?us-ascii?Q?cOLVI40c+QRdANdaviyk1BbMJvmwfNYXSxkjDQrhqASapwfiyXxj9ahpkrtf?=
 =?us-ascii?Q?mCRBIv0rOVpyn/jdOo+0vAvli7CaDuZUfDfFMwf32WA7qdnI1WtF1s+aYKD3?=
 =?us-ascii?Q?qQxTHvQQz18XIzrhcw3iUf+MuRk731v4HMGS5VkK+6wqbvK0uFHX58op2cBy?=
 =?us-ascii?Q?cK5bb1eCQBRzSakv7KMeAAa93qVzfW8RinKVnkjI0OT313exTSaUYRtfnO9W?=
 =?us-ascii?Q?HCaKtGI/cV4Rry95qTtiZkUJ662vKiJuAzlTWLCExXre6Y5eFt1FhljdXzrJ?=
 =?us-ascii?Q?/lG3I0JKwEupR3v4QdLMsW0FXtzsvWwPpjBL69mskHKWU9OKoVQAasGmRR5l?=
 =?us-ascii?Q?998XupsqdSnYlkHIVaMxlfYCShZfTUkRczo7Couor/tz5BBDcXI9NH/XzuCK?=
 =?us-ascii?Q?GmxEhiTfQu2bpoIt9Z8AcAAoH8fXRNMxXVF+ZPwq8hblah54LKEtbHW3MqCm?=
 =?us-ascii?Q?Dn1vNbVdROUbypPKZY6H5odc7IyH1+hyfXXohYTJ6XJHmQ81gu7Nr7nSJnoP?=
 =?us-ascii?Q?ljSn3CClcg3iNnsSsKYddUMOmis9dKkM3unMijMuhyCeTKjh9YNr0PG2bfks?=
 =?us-ascii?Q?rUVII+0EWyFJwMZJ81gkxoFbnSBRZn1iW7eimVgFrceW47jvzjppfygMxWnc?=
 =?us-ascii?Q?I/twxq2MSOs8Uq1Z88VKQ/urleYmGbJjYXXycKPQlYmAlWgUzQz2OcpHaEtC?=
 =?us-ascii?Q?Y3/dtlojsSYAcR/A53P3Q9J6rYTHiVniQHqpIZiYAss/kiZk/l4sKjPLtE6S?=
 =?us-ascii?Q?FQziRsmehaQsMuGAtuSvGYwtxeyyFF76wAnRD9MjC0fzeu6IQmDmjZwsfWYz?=
 =?us-ascii?Q?ACczgfJsVX4CWhl5YfZ6vZMzLmdrHFGuo/LQDMOtH+Ue6ZdnC5rWgjfCO77Z?=
 =?us-ascii?Q?f938S9tcGuZxOPePk2W3mMgqh/uXCmHIqmDmRYy7xw+gfw6UZzFL1Kvcagbh?=
 =?us-ascii?Q?/Fwu5lQvJQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91062126-2845-47f7-e1a8-08de84782ace
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:38.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSsvz2fqqjCvzBHuFfxOKZklK5kTj8IoPmxe79HtKkdawpsuLF4ShHmZzhgde3ma9oKgAIONxezOYw+ebtR0rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Add the FSP boot path for Hopper and Blackwell GPUs. These architectures
use FSP with FMC firmware for Chain of Trust boot, rather than SEC2.

boot() now dispatches to boot_via_sec2() or boot_via_fsp() based on
architecture. The SEC2 path keeps its original command ordering. The
FSP path sends SetSystemInfo/SetRegistry after GSP becomes active.
The GSP sequencer only runs for SEC2-based architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs          |   5 -
 drivers/gpu/nova-core/gsp/boot.rs     | 181 ++++++++++++++++++++------
 3 files changed, 144 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index e5059d59a4b7..e981f2316d01 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,7 +14,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     pub(crate) fmc_image: DmaObject,
@@ -23,7 +22,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 68bcfe45aec6..06909217e564 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -227,7 +227,6 @@ pub(crate) struct FmcBootArgs<'a> {
 impl<'a> FmcBootArgs<'a> {
     /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
     /// structure that FSP will read.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
@@ -283,7 +282,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
@@ -296,7 +294,6 @@ impl Fsp {
     ///
     /// Polls the thermal scratch register until FSP signals boot completion
     /// or timeout occurs.
-    #[expect(dead_code)]
     pub(crate) fn wait_secure_boot(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
@@ -326,7 +323,6 @@ pub(crate) fn wait_secure_boot(
     ///
     /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    #[expect(dead_code)]
     pub(crate) fn extract_fmc_signatures(
         dev: &device::Device<device::Bound>,
         fmc_fw_data: &[u8],
@@ -393,7 +389,6 @@ pub(crate) fn extract_fmc_signatures(
     ///
     /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
     /// to FSP, and waits for the response.
-    #[expect(dead_code)]
     pub(crate) fn boot_fmc(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7db811e90825..4bd226573b89 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             bootloader::FwsecFirmwareWithBl,
             FwsecCommand,
@@ -32,9 +34,17 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -197,8 +207,83 @@ fn run_booter(
         booter.run(dev, bar, sec2_falcon, wpr_meta)
     }
 
+    /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
+    ///
+    /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
+    /// then uses SEC2 to run the booter firmware.
+    #[allow(clippy::too_many_arguments)]
+    fn boot_via_sec2(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
+        fb_layout: &FbLayout,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        // Run FWSEC-FRTS to set up the WPR2 region
+        let bios = Vbios::new(dev, bar)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, fb_layout)?;
+
+        // Reset and boot GSP before SEC2
+        gsp_falcon.reset(bar)?;
+        let libos_handle = libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        dev_dbg!(
+            dev,
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        // Run booter via SEC2
+        Self::run_booter(dev, bar, chipset, sec2_falcon, wpr_meta)
+    }
+
+    /// Boot GSP via FSP Chain of Trust (Hopper/Blackwell+ path).
+    ///
+    /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
+    /// the GSP boot internally - no manual GSP reset/boot is needed.
+    fn boot_via_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        let signatures = Fsp::extract_fmc_signatures(dev, &fsp_fw.fmc_full)?;
+
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            &fsp_fw.fmc_image,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+            false,
+            &signatures,
+        )?;
+
+        Fsp::boot_fmc(dev, bar, &fsp_falcon, &args)?;
+
+        let fmc_boot_params_addr = args.boot_params_dma_handle();
+        Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Wait for GSP lockdown to be released after FSP Chain of Trust.
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
@@ -242,40 +327,49 @@ pub(crate) fn boot(
         sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
-
-        let bios = Vbios::new(dev, bar)?;
+        let uses_sec2 = matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        );
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        // Architecture-specific boot path
+        if uses_sec2 {
+            // SEC2 path: send commands before GSP reset/boot (original order).
+            self.cmdq
+                .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(pdev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
-
-        dev_dbg!(
-            pdev,
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
-
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Self::boot_via_sec2(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                sec2_falcon,
+                &fb_layout,
+                &self.libos,
+                &wpr_meta,
+            )?;
+        } else {
+            Self::boot_via_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+            )?;
+        }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -286,18 +380,31 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // For FSP path, send commands after GSP becomes active.
+        if matches!(
+            chipset.arch(),
+            Architecture::Hopper | Architecture::Blackwell
+        ) {
+            self.cmdq
+                .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        }
+
+        // SEC2-based architectures need to run the GSP sequencer
+        if uses_sec2 {
+            let libos_handle = self.libos.dma_handle();
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: dev.into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
@@ -305,8 +412,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0


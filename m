Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071A33A9F3
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419028; cv=fail; b=Mt1TjjAJeyo5znqXNXUyezXGuUjcVs4+BQV4zbFzuHIPhHajB9JZ6LfjWWVqAsqpakMiCjPxSkDFsm8U+aFVDC0s6XDqSQ7eIC+6bWG78jYraNU+6lRfE8lPOEkQ6/KNgi4QGQQWTDQ3c2bR3EgaVQp0bX+PU+wgM1bmN4nHGcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419028; c=relaxed/simple;
	bh=YmAkP2VvTI9ZGTDp4Btq/fmsrAtJF7NszaBn4560Eb8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xr4bb7hLkflCP8UY5NbJzH3rVjf4A88cmSCiHBozY/kJt2aoJXan8255OZTgfs8XV1csoL+gkvGConuOmZWCg4uBiZRDL8z7dNmQmvuByw/RdwPjapmeUvfw4xpP60eImQ2piNRfAaZ3ntl15dt5Z+ayS1YiJsCrM17NPsXYT/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TmAdWZei; arc=fail smtp.client-ip=40.107.209.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TmAdWZei"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkAMZUcbhIgTCIwMUew31xGrLGRVLywej6P0s42Mp0AT8QRPrCAv+tW5CryOuBnJM8j8jSV4RJt71rFRta2JWBkKnEB6O+71K9VHoho/UAAzTgIofKhw6pE5SnTty/mcoC2VI9EiIf4A4c8c4QatD5i10L7t7aKTz3upgnOFORE9fBcOnp3TX9SmmEsqNIphPzT0c9bwtCwJmf2oBndk+ppiIIu9wU/0C+SRmeCv8NLzSji8Om6tOfRFvxQhEvZNQDVyNz4SKb8iXR9VbxxPEgXg2VKCtDPzyNmam9ZL0QGehXYJ5JSRib70XvRpBcLw7fRLdVelDLJGY8l7R2rNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3oI2dyV8uwy3F82Ohv2K2ycQzyNLPa1RTWNxH3tt2U=;
 b=kmK/K3O3TnRfWxL9LVht6vdAOf4A361tftVvMcbiyvLqkOFdMyG9KKElVlJqouT9GX6h7ZhFjqQX4HdZs66aI8W9Ou/zmTX/bkcVS9l1p2Bv4QLgGBIoJiJyufhkShT/7iWqZVLw/Q9VtQsTT1oPLYBNNd31NzQoPhq6eKi2iCE/3sZ+vQuykx+8UgBELLB312At0/EhMH+G0gBYsrpZ3z4bOrSaRzSq8ezoyid1jycTymIgD25p62TC/JJDYUA7/GNzWjKlrSxrWzA38/km/JFyDncoXvMmqxN06Ott/+4XLlK0S4uezFmG6hYZ84+dtEeB4mE4Nb1VEaR47tlMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3oI2dyV8uwy3F82Ohv2K2ycQzyNLPa1RTWNxH3tt2U=;
 b=TmAdWZeiMlDRe1OYtk+QPxIq5NyrPVSYQjpw7rBqN1SdLisgMragXp0Cwtym0FBnfRV8oXZbL40SPkgu1+99yDdBu8sg5JXOA+I3wmxH5dxVq21CjhwE5yulUjqefxWbIejCCqEK2Lqjk01gXBNVrakOXsNigmPg+6l1+530STSdyfLPUcShb5nT6/Yoku6V281TxpYqrx3jypDOB0OhqFUoXo0TmRCSXwLUtQNsAmngkDY8tZA3sfINlzhcXHZAcWAV2Dam1U/q6j9mNhprKgY4qYgJO395tUQ8CJ9tBfAXAa1Ds+Ltrgw7Wk61o8EmMeUCbqUU1Jjaxy0CopUQlw==
Received: from PH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::8)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:22 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::1) by PH5P220CA0001.outlook.office365.com
 (2603:10b6:510:34a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 19:30:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:00 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:29:59 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 02/11] gpu: nova-core: add ImemNonSecure section infrastructure
Date: Wed, 14 Jan 2026 13:29:41 -0600
Message-ID: <20260114192950.1143002-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 878220b8-8791-472e-efa2-08de53a35c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fxz0oqqqiUTTKkOPahSKzQoA2ZrnFb+Q2g6roqUNy2ZoTvghUlPYe4JC6nW?=
 =?us-ascii?Q?EgOroBWGK22or6nBZN+14uZqmF7YVkMBv7SJediaB7RYfT0DbytRWqDIbWmy?=
 =?us-ascii?Q?oqngYaY3GLStSe39IXDt9GI6kAymWJfVOQ5E1y8xK1g6HZEbomIIRQYtpy7u?=
 =?us-ascii?Q?ZoDD06k+HeD66wxZhiFf8mynP/gs00VvUt3fI0gfkhbrqLAJVkqpWTzdxTeR?=
 =?us-ascii?Q?qjjV/Ste81qkt719GMSYUmau0OQcEv4nQSrLNq1NyfjnfMVIetvN9Il1x6K3?=
 =?us-ascii?Q?4ktjTrMhjpe1dsd060Wwt/eIFaM+FCokdwQG40303oKBlT6YdxwnXa0qQVnU?=
 =?us-ascii?Q?ewrZQ5MDzlZaG31rz1HhQhjl3MXFZKnVuFefaCjuizI6rr+74JlIcaIO1TOl?=
 =?us-ascii?Q?dW0D/hIiLaK9fMoHEy7ZDvq4eAlfDlbNODLRvK44cKHloVTerXZrQUztBvCj?=
 =?us-ascii?Q?dOlSUMYlzT/nq4S0BDSazBoE635v1+06YH1p165iNK5tx+gcj6oTNdT/4hiV?=
 =?us-ascii?Q?VxXfZ9fQoZuYBT41CpFnpNRZufqqSZbpiYqlAbHka9zhbs0+LrK7qz1rBzQu?=
 =?us-ascii?Q?gAKNSYOKsYW/fOh607XdkiIf1JSwFjwBnC+jh+KO8D1TuoFTIX3Ho6seNywB?=
 =?us-ascii?Q?3+PofLner/xP3AGSRs8capm+63YcDpulwFnKqESyXpDWFaZU9IzHn35KALsI?=
 =?us-ascii?Q?qDbzKPtRUhblzkKoHEecZsCAGGjRQVAm1dK4BJYcVBub9hBoseyIm9STISXR?=
 =?us-ascii?Q?cwlsbe2q1JW85b+WQbDcMVHE74A0SlWqDqaP9U/U3jILaxvnkPs1YRAnKUMw?=
 =?us-ascii?Q?x+QrL2BkdtG/XVpZQ4cIPS76VLxi1tv1ieGKwSl8KYgpTLdaSOGuDtCfFUAc?=
 =?us-ascii?Q?IebdPOyjPDkhHmAVN8dTnN9ywyUr+OQDjuEj1SJCU2ojtBVsjN6HxIgVqGla?=
 =?us-ascii?Q?3r1ipGDBZVPSVIaSXHwtQTuJVT6VT7aWqLU6wwV9+QVXJEopHm7WcoeQUurB?=
 =?us-ascii?Q?dTLKlk9tyLoOPFuzGxAQTrZNsQD7k2Htev+HSivDlzpnQgIQ0z4kP8setrHZ?=
 =?us-ascii?Q?+na/jU0Djz9ve/v7md7cjlHyGqecihq4x4qM2OHvNI7EJmSBy8gcyUErySbo?=
 =?us-ascii?Q?Y3LkL16e9nFWRIaBVc0fhmP8DpcrKCn+18aE/I+e/QAu/lQn3zuNqaeEW1Ob?=
 =?us-ascii?Q?pRKCwTdfpL+VYILhmbEbX8FR/yS8o9uDDmtgaqNNushK7sGlKOX5V/dRxbqp?=
 =?us-ascii?Q?URCf+lXjSiURuc6itohSEI+ChkHBCP6bOoil/SGyArPINzHYuAJqf7Ee7X+y?=
 =?us-ascii?Q?TbK7T0We+lemGD55ApkeMqr37wL6LqRwa3bgw8SlQ6utVatl6kCICh66g4nQ?=
 =?us-ascii?Q?J4N3/EDY4UasHFS6hDQpUK4jBaDgbPQUhKQJ7jj6YB6CgGXxQ1YNbbuQ1f3U?=
 =?us-ascii?Q?BGWUfA+TlP3z1xF2iQobS0CJb0ab48LVM/PDewP7b4emZpSc1QLcTMn1JEfm?=
 =?us-ascii?Q?QlAQumfTY5PgkU9LDVHalR7bLrLZXMBH3RQ//RhF1gwU8j3kKJ7PD5+QtD5j?=
 =?us-ascii?Q?Zn2MRFAEszkUcigOcZQi7Z5kFewSoO14DFITbPS0t1A9NiazJqZqC7tqGDvY?=
 =?us-ascii?Q?PMgmhfepL7M510v+SrSmvxOZ6Qfxr6pJfdcxJfRfMdZgIQdXhEs3FhtGFpUK?=
 =?us-ascii?Q?qltyjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:22.0489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 878220b8-8791-472e-efa2-08de53a35c07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182

The GSP booter firmware in Turing and GA100 includes a third memory
section called ImemNonSecure, which is non-secure IMEM.  This section
must be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 310d4e75bad3..60713fecffc9 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -242,6 +242,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
+    /// Non-Secure Instruction Memory.
+    ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
@@ -351,6 +353,10 @@ pub(crate) trait FalconLoadParams {
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
+    /// Returns the load parameters for Non-Secure `IMEM`,
+    /// used only on Turing and GA100.
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
 
@@ -460,7 +466,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                (load_offsets.src_start, fw.dma_handle())
+            }
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -517,7 +525,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSecure)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -546,6 +554,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+        // The Non-Secure section only exists on firmware used by Turing and GA100, and
+        // those platforms do not use DMA.
+        if fw.imem_ns_load_params().is_some() {
+            return Err(EINVAL);
+        }
+
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 096cd01dbc9d..1b98bb47424c 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
     imem_sec_load_target: FalconLoadTarget,
+    // Load parameters for Non-Secure `IMEM` falcon memory,
+    // used only on Turing and GA100
+    imem_ns_load_target: Option<FalconLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -359,6 +362,8 @@ pub(crate) fn new(
                 dst_start: 0,
                 len: app0.len,
             },
+            // Exists only in the booter image for Turing and GA100
+            imem_ns_load_target: None,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        self.imem_ns_load_target.clone()
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         self.dmem_load_target.clone()
     }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 6a2f5a0d4b15..e4009faba6c5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         }
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        // Only used on Turing and GA100, so return None for now
+        None
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
-- 
2.52.0


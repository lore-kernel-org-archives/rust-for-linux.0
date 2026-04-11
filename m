Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6731F9BA;
	Sat, 11 Apr 2026 02:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875836; cv=fail; b=oIUyTVkmkLvstCKq7Ej0zVOuLC5XjuPc9z3WSJ07uvU6PS2zHpIQeYx3TKf5cq6h6hRTbH368u4PSwiyruGICglNCEy2JLS2RXRG0/4coan3iNv7sEXIvv1AIPDAgMbIseKCTE4XPntODTpVlkhtVFkE/0jrlqTcHEsYesZfbOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875836; c=relaxed/simple;
	bh=qs7rwpc8wgKaYyJvxBWzXrXB2lXvrgbbsZ+F7B6g6Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jj1v+A/LbWZ1gmQXSS0zzdN36iM0++aYasOff4nr8gLUH/Pl5QQnIEEYHOQg3aaE6vKV8NaPkvdBg3rY9XehuPWK55c2dwTNAwjliYPKXHF4ykelJsxUU8XJx6I1Z404jrjL/iGvhmhT99pI1wsJ0xWzNjfEULscjlE4wmkKtFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D1g4lQ9Q; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D1g4lQ9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F92Ff81Wxl+em+J4nm+5mhpqN3KBaQ/mZjUoNB571cLxr7Dvgk9hdq4FJB3BwDi92l5H3oTY0FQ2qMOhtyuhxawEr6RneAma/tQmsG8xHuPhVlBpDbpO2tscd2pPVADUojFS/BEzVpxMx1ftYQTC51knq7N2dGiqfx+YhJk191UKZrkHM74aGD6uCpkG1inWfRgN+DeXOiOupQifzkvbL8mbToTqrwgy18oMhbl4zLkdcjFKkRqxGDzrRIA8FmrYRKu0c2EX5BPRtLCEywDN22DjDwT07AFab7GRZx+po0c1Nsf3hNH1wEAALmxEPfvAgDj4iJ96JzlgynmNtI9QzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOKQb+idbe/exgcyDjs321TCp6U2oRkgwT8YlQ8rQ3o=;
 b=VDcisoPT254iTmMKpRMCaYguGGp0PKBSqtjgpe2mZvOoer0N+2ajRcOEm1+4IOZxPvkVdzj465+TWM/W6FvrBzPKzgNfdSfhAayDYbjIirju5AB9zp2nlsYgk20xzMeQGKfwyQXoChw+UJvnVZXKAMFc8ZqFsEgfHItVQvDIc0jskSfYpRII+zpOhjJRcELVCR9enMA3aeh6GEqsg/PUnr6vTNEhvo3IYb9zWJFjm3zjrNfgv2uzNrQikeo555UMe2o+2aTSTxKSRtXbYDKrysONGRg1xUpIXSe1YjGoAt8+ZIXRfSeOPZJPViK82M+zDDkluTJklhPB/rl1f8s6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOKQb+idbe/exgcyDjs321TCp6U2oRkgwT8YlQ8rQ3o=;
 b=D1g4lQ9QWknbzGxGD7GbqwbY1nB1LjC0tfum1vYJdaNCyhzhtc/Pf7rpaWC5Jvg8HTePMeTYELhJO6aiOjQm4NIk8R1SqWltJ1THCRFE0uhcs9aMUXvwcgUS2JF1CBOZvU3fg2RVRwHrUVdINSnOe+OSU1QBnTrZ5pPa/IjFgkBSSHhAKE/FDWw9xa3BujuxkZvQotT9i/he+ca02O3bRGkc5I3S7Jex8f7aPbfMCePo6arrtbkKAClrk/EsbtG5G4skirVSyEbtQIH2EnTdVSgyDrfLr1a6dEx/o74zvrfluJyqdqWiXxgF0JyHh0ULsA7ht2uSLWmDMqYOBVKoHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:24 +0000
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
Subject: [PATCH v10 22/28] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Fri, 10 Apr 2026 19:49:47 -0700
Message-ID: <20260411024953.473149-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc10055-2376-4065-f51b-08de9775145c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vcKQKRfaEWnhLDbFfxTZEnu8Wi6FZwh8l3cQePwnvt7Y67kpBIXEfwwTeNIQRtxgAsoGwAV2vSoGmrxqcubFXzi1PrBZDZoGuUxAbmpvXgVmyaK9AP8VPPh4GzVRE8IrP20iH0fHdaxd3mAis1EHb6e3ckSnviaVZMONcHGlztssW2qmTIYsnY+HBXVZzwROzzF2zPZSTD6wiqAgX3UJHrdY7K+T3dYaJ5VQyyiS5S0oG1Am5QlrmEo4Um8y5rG4EYg5fUI8CEQcAOxBZr/p7j3g94ZFnpxNSCIpKi23k2qc3/0e9wGvaaKsEjEkrV4WP/1T2JMYjJuGclAjMvx+j2rWvPCHfK49yMOVltTlt0S5J3+Df8+JkV1iI1MbxqvwFXHXSHkMdSg5R2ymKRB5iD/c3B2LeGam32/orYnA3foW5fvf4Q5zDfR+x7V9xOHj7D/KGzCH4lbKROkZzVt9UtL6yAggTFftQkXkkgUBMBYM5SEGAtPa6wqNjt68BU2/lpaRwRhxmsevGy/CP35htmTAqalpyLUjwKYWKTqyRVzg5AduBQWoAciEw69tO8nLHVXC3HXFHkR0WRNxuBSrxSOrkr/aWD1BO62nST4aBPjUMwqy7CtP4ABA/yP6+WASvnf59QpK0ChfJPapmyXoBm03JGlM3DYOwd+Hk7MdB7MqrenR5MPOzgKU5YwykV34kn4e061XmgGLvfyrANemFtlL23X36agS0RXWKTZ5MJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mB/4FzQR8R/cFWjRgI0M2f7i6RTt8fawxxLUgzCWR/CXbxefcQSxGG6OA0OE?=
 =?us-ascii?Q?cueNRxbJjYUAB0XhJ6y+lhOfXXowDppNGdInGDoX1uqr5EkZHXCqLuQkC09K?=
 =?us-ascii?Q?Fln3WngW07VWfafdEANWDdm+EItMj3IcT2+6HHGiaGrykAKZg6KnFugnRFWC?=
 =?us-ascii?Q?HwCbvMuNVhbjPD97EB3yDyjJBeQopOItANKOuAR6HwWeez89EbDq4XwP4IvR?=
 =?us-ascii?Q?SZ0l9/zxcY+u17hPsNQNmSzYD4J6UVJQH1rg8Ge27tfsNLCCubcWvQsQYSkn?=
 =?us-ascii?Q?8cJhNu9MkKrXt7x3lstHUb0p3fT80VpizB3Fh+pwRB7kfcyPRLT1eeqmPSFo?=
 =?us-ascii?Q?PVYtsGdsni/lFEOs2TP4FsQt6r6qxwxlXdrmJ1eZBI0Izkml58bu8ubF/eQR?=
 =?us-ascii?Q?X1MtuETLYskMDwdCsOgzYYxQ8y8ron7I8aOjxt4QR+xdwjM71pIeMy42393g?=
 =?us-ascii?Q?mBTRy+N7ruw/1C1QaJmrq5XOS7A7ELNGema/RM7LL55hEBeF7JujMU3uY/Vj?=
 =?us-ascii?Q?/IMJpOqfzMWU+WPHu4GnNWIjD6hLyPMQ1tI/7Jv4TfMBrC2gvbovykdqri7I?=
 =?us-ascii?Q?yxnqEDiprjj5zyZoYxOG3iVcJK4Snm3NZOgSDOUicmOt1Q5593/orAoVzbwH?=
 =?us-ascii?Q?dsZDgQh3h1osKbKWptqronGOB8OtQkwZIfZWCOxa2dGmhjKZbkKFnuh/zQYx?=
 =?us-ascii?Q?Qqgaj14Z9LEvyu89X7zbrNWFalHUswC8f7ucW6XSMbFUtqbqOXaqHUeCsIaL?=
 =?us-ascii?Q?D/DCwlvMiiUJQc1ZMsqf1jpMdM4+AAejpL4HUY2llaouA4tLsNHC3MB9WNbe?=
 =?us-ascii?Q?RRcJB1aVkaxwywbChYAjNC+64ARG1TuRa6lxSPFbWu15ozr/34RzajHmWBSy?=
 =?us-ascii?Q?lnYUsguJyYh36H8L+SzhGplhGEaiUNhNlvAX3Fyrnqh9LZEQkcJdzO//RPW4?=
 =?us-ascii?Q?9/A7GayHvbihGrC1xWrCEmxgHsMsd6BxZH4lyQpWAID/IcB19agyoxgikolo?=
 =?us-ascii?Q?jNv+LVm+u+cXLNS1N6lpJmkgYfwZo0b2g6L7I3p2rM1+sPXHCtxe7QuJ5fZu?=
 =?us-ascii?Q?q9L1begz2267lTlM66QCfpJfi64LrDTuBLNEi1ISirI/ioevaJsBjmjF2dKG?=
 =?us-ascii?Q?lgTS3OSjHFbG7fs1VSqYxxIpXuxJ1572pomeFG+DBIVdUxOFnnTQoLQgI4lX?=
 =?us-ascii?Q?j0o0oZRdtFPuKrcy7ut3DvrDxKmsN4nswPyihLfP72glyAcPG2tSsaij8CdF?=
 =?us-ascii?Q?QVjF2gGec4Hyt9XOuiNbFyDtxzZmyKjYJORozxBNl1TvxMSFkC6APGSJhuWa?=
 =?us-ascii?Q?y1IUfoGLK8gbb2ml5lNu9ZgK5XgOBF9SffvuJuSPfIS6Q/Yp86TetkSRcWAW?=
 =?us-ascii?Q?1+TIcR8gxyXJNjoO9jpqDsoSwqdDs2CcCBi0WFCKJ9VgmOeTxTJ0Y6P9gDto?=
 =?us-ascii?Q?qhfGsAtKSc+6t/xyKqkfmh617ePim01y7z42b6ZP/JNu4wz3EA84PodZLBV/?=
 =?us-ascii?Q?f1IG9tzOTjAYH6qnDlvNLMOLOBxHxqkYXzJ7QSI+Gk+0afLoG9LoBiRcYLG3?=
 =?us-ascii?Q?nDAMmHWt99KZdtTxyhc7VTwaWMXUT/XLcvoUufBlH4Ij54e+cxX58AO8uxvF?=
 =?us-ascii?Q?yxCtfnJ1RgyZ51+YuMUmffGTbNIOBUihMyU8pwNQUrldtxE4QSZ43wVi9oP2?=
 =?us-ascii?Q?LWyoZIfAgCcp4jYTdv1aqGaaYrw7EIMPniKfSh/G3/LANOg1u4JOipGSrEM+?=
 =?us-ascii?Q?86NflQXB0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc10055-2376-4065-f51b-08de9775145c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:24.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltVO2mFiFuN+twwSbzRUtAxVW0n50TvBiS/0kaa4gnMsW2iBc42TCxLhT+i8X42MxMr1LtzaZVcK53/e7wXIkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add send_sync_fsp() which sends an MCTP/NVDM message to FSP and waits
for the response. Response validation uses the typed MctpHeader and
NvdmHeader wrappers from the previous commit.

A MessageToFsp trait provides the NVDM type constant for each message
struct, so send_sync_fsp() can verify that the response matches the
request.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   3 -
 drivers/gpu/nova-core/fsp.rs        | 123 ++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index c2f509880c8e..1e03f386d185 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -168,7 +168,6 @@ fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
         let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
@@ -191,7 +190,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -219,7 +217,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 8287bda795ca..b489845f733a 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -15,6 +15,15 @@
 
 use crate::regs;
 
+use crate::mctp::{
+    MctpHeader,
+    NvdmHeader,
+    NvdmType, //
+};
+
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
 
@@ -30,6 +39,37 @@ pub(crate) struct FmcSignatures {
     public_key: [u8; FSP_PKEY_SIZE],
     signature: [u8; FSP_SIG_SIZE],
 }
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
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    mctp_header: u32,
+    nvdm_header: u32,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -128,4 +168,87 @@ pub(crate) fn extract_fmc_signatures(
 
         Ok(signatures)
     }
+
+    /// Send message to FSP and wait for response.
+    #[expect(dead_code)]
+    fn send_sync_fsp<M>(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        msg: &M,
+    ) -> Result
+    where
+        M: MessageToFsp,
+    {
+        fsp_falcon.send_msg(bar, msg.as_bytes())?;
+
+        let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
+        let packet_size = read_poll_timeout(
+            || Ok(fsp_falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::from_millis(10),
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        let packet_size = packet_size as usize;
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        fsp_falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        if response_buf.len() < core::mem::size_of::<FspResponse>() {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            return Err(EIO);
+        }
+
+        let response = FspResponse::from_bytes(&response_buf[..]).ok_or(EIO)?;
+
+        let mctp_header: MctpHeader = response.mctp_header.into();
+        let nvdm_header: NvdmHeader = response.nvdm_header.into();
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        if !mctp_header.is_single_packet() {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:#x}\n",
+                mctp_header.raw()
+            );
+            return Err(EIO);
+        }
+
+        if !nvdm_header.validate(NvdmType::FspResponse) {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:#x}\n",
+                nvdm_header.raw()
+            );
+            return Err(EIO);
+        }
+
+        if command_nvdm_type != M::NVDM_TYPE {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:#x} in reply, got {:#x}\n",
+                M::NVDM_TYPE,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:#x} failed with error {:#x}\n",
+                M::NVDM_TYPE,
+                error_code
+            );
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
 }
-- 
2.53.0


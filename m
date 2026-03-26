Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4415F399351;
	Thu, 26 Mar 2026 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489188; cv=fail; b=NLP7gTderAsV2uR9dcQ3A7Xwo1TdRBy0lQ84JBv2LLSpzuxOj44uW57CszlFpg9+AP1LwHmY9loQ7ZXU62onYekeeEG8k4+9B8qL8B5p7vKiEux+OBFKojos1kFpDXARczaMFJSvW6TrgQvDyX641tOoG2747FoIwE+IbsJxMjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489188; c=relaxed/simple;
	bh=t586brRr17t3AQaKK8Vr/vHo1xoyLRaHOrkLlxtoAJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oi5WdVTsUOP3tUEAeIl4LfhewdFExUYgodYBPbpDdwPhUgxcGuIFjDQ8COHAeWWd0dApe7t+GoqiVYlcO/zLUV7LGiMifvdK82iY8ZUZWIF/jtLTnI1WWGslrEC5QwrRt1tzkGKIC8UnqGqP2siYDqXDUAwSxCgdzO2Nw6pWkdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jzHFzdKM; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jzHFzdKM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENKNBTC/wCWU/56MquwloEpHYYefKcYQNTC9vL6D43da0M2FL/ptnurMxh9kCHPOIk8H/NxL0H5yYy3CuPTXWi/YG41FHjYWGpC0cED0I5qsA/G6d7TgrWuU6oyqNZunYr8rc2K2pqvBKoiAIeHzcWN26LnFJl+qRr69NILRgYkebBz/J6OdusCuzQX3SsCiBhTGgK6eswXUZH8xsUg8/U3SjXVxfLxgHhgHs2sK6THc0Kl5EnCFSypp87YbtKjTgmQk/W0WCSZaA06rg9WkzsF07qExkDyXamkXw/wCcIq1CId+YUDmiDyKymxT2/gzEuIMMcNk1e8xoDvxCrVXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGcfJc2GMbUmzXKDl/TlQQCpnBFgnUDFUKKas5rvwR8=;
 b=nuIHP5LmISNjn4WYHcCJ2Vytj/nSXRYrFg3FQR8JQdk4NZDpdwD+YYWbJYEtdzj+hCD4iPzv2Q2kFq4fzhnNGbEXntFsqf+ggRo8Rm+BbjnvFSu2KOB6aMbyZYiMd+P8H4tQB949JhsUV778QS4pt0zXPrJUlxpkS2s/NevSKZLF2odPsFwzXy/AXckX9AvI2nDHw4++SSBXwfgx1vO3L/uLBj5+rk+MrpwvTzZ271MpBEoSPdKT50SgQd8adOixbOPpHzZ77mAs/dHEFH4nB1UoLfZWkOVLZcMDdh6BUcNQt44ZjtoTCqho9+bxGh7ndh8SzBtm08uYhPiRL0OxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGcfJc2GMbUmzXKDl/TlQQCpnBFgnUDFUKKas5rvwR8=;
 b=jzHFzdKME+S1igmYO79qm6IKKfMQ/VtRwGQrbbBWqAjX+NXBUrXYpGWkLugkjFj3EhdGdP4rDW5LLiQl5xzcwaDg5gl1B7qTWwMyoDxTFY7XrmsOdkn7cXe+1urFJllI0E6fy4y83SrEggjXr2pAcgJzOG/bLXCms6DXWSsQmFuNRSpP2zzr6WWh8D2vlyLgUe73bsPXEbJSxPz9PbkwaAYLyBtkezMFKhm9CzWmc4ZsAt/ub7kvspvnA98aKuepUvwBtsvqWB7Tr+Xe/A64RMQR+ncu3KbQKW7z7h5mr+rKAxh9yai8x0n7CIz9q3Y+smnHiqmtG0iVOlZE8wYOkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:35 +0000
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
Subject: [PATCH v9 21/31] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Wed, 25 Mar 2026 18:38:52 -0700
Message-ID: <20260326013902.588242-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:a03:100::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b11aa47-3f44-48fa-1520-08de8ad8897a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b3IeNK/Ccjx1xUWHVDuNhgjcotQ0l5OGc5axwEPLkC8p523wubqRNXQoLuuTHaRpfqQstEpyHu8OLR/bFyTvMIzWjXamF6aIqfQ6BxT7MvaZqprTAjbuwPykoZOs8slmM2VqCG5YwNdH0E/au8WR6Hgfy6L3WzJkHO23nBnC75I6LZd528Wg+GIoQM1Fd7GSeZK1H4NJC5/mJiwyKLTFceTm87+fhXfXsPEH+8T+ZvZYr9d7JxDKHU0LGfUYOwtkg/YVZ0VcdBEwrijpw68rv0kko/TNqi7ufGq0xp5yHNVYJRsE15IVVu6YGdmTlbpVpK2/r+niJT8zrB07n7boPnvy2Qa2f4OYxsAkZ/xELe8XI21S3x9Ot5HOrlymIYPkcotIex/D1Pogo0sQ1LHuRRf0BDef+ilA3momUATg1rBnQsl+100ud1C0e6Ho5PoUJ4JFo1klgEDlSBYWkRpcxEO291HUaYPziDKsvXAgl7aQJzsFpTlKNdFI85OKe8X8wUVqi968OYLkH9YxIaE1XxrYbhG4MYwjVFPCCrw6VLsRhKXRbP0HfTQbhx+xEuZRMuto6K8ZxQrOX8sryS+Fm9qdr/HpzX2SCRwrtVvxO4BzkOdl2i1K4DY/wX+TxM93GMilrpEizHzUmjNBmUlEFBRrPELWqS08CXpDPM2ePI4cSSy2yNM3/vlbujA/x1LafR2dO60Rlu0VOpLkz0dVEqzXNYIy2QiX6pKdVNWqzL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGcqUeUM54BxlhWYx3oNgKD1eyPJwlKH6nWuxPEzDi/Re2VRFIKDvWHy97RK?=
 =?us-ascii?Q?XpMC88Lom2X9HSwFZL7KjwW1mipdMUk8iz70tFGEUVghH5h67UVVssT6yjkT?=
 =?us-ascii?Q?WI1WRov1NkG6iEBKEL6bTOka8O009MumQLw1FF2Ri2L5oPGmpttNvn9ZnD2K?=
 =?us-ascii?Q?TiaX+YlbxHCudtZ9U4yQDMoezJQXUq5fN6N5p7sDqSjupp7XUWtupgNhRrqA?=
 =?us-ascii?Q?0XG5Wx4OJ8WBZlfZkRnF3FUUMpjwJNT22I4dQqPH6Y4Z3oKeIfTtevotDBjC?=
 =?us-ascii?Q?UFWQWRPPwVpYV6VjNgnsYRynaX6LaKsKqYET8tSNnWYyiwEnOaBcEIfLOfkN?=
 =?us-ascii?Q?ZDTHxYvpwgcxQ+V+Qstyr8t56sjRSr7GOoTbkSut2lGPYrxRP0kjTAEnfhFW?=
 =?us-ascii?Q?AUkAOZJWxBnyvR+2+WcwAnOodGOiZPjN/mJQ/5CuKX0I5R2K9IjgSieQUZBj?=
 =?us-ascii?Q?UoVtfQ1RLnOgDV4jAFzL1frx5+mQwstZwZx3IOIUr2OGOTvSVkY/BZu89IJh?=
 =?us-ascii?Q?rFRzbdB6ueosW/V2lSneB9P+y8dgbrCICiErY5QLkxlsfz6YMgsS+OiKRGFX?=
 =?us-ascii?Q?ZaZoSSGIvvSPnYZBV4Y37zJ/kSmsYmr3dvyXJ4nXMBPeaIjjMxWLy7rgArME?=
 =?us-ascii?Q?rhPThn44IijTRoM0xWJiMAfyq+23MeivS8j5R3jpW0lFVxRu6fC00rOdlftG?=
 =?us-ascii?Q?dCmo1Vzv0C8s3xfnQHWot/bBdTMTAJNNgqUhSSnajt/hi89nQVSULonIXOxf?=
 =?us-ascii?Q?1wfoO6jRIY27+MsmYJFxh/mjtRWtOgTD2LTVAS2KXKafWeIdmANpFFz9zjaX?=
 =?us-ascii?Q?PUadjmDeLhlZIXHO5jzn5lKPqdWrMr/Oq2LVmQlj+HADWYzNmAM34QpwKaIx?=
 =?us-ascii?Q?IsMWRBqaTrJwuuS+40Sy9JBCDsm458loEcH353mJW+R1p9bsa40dBStNf8K5?=
 =?us-ascii?Q?lJqq8HGdr4K7i5aD/sJcM4VRs4CObhL/+7Lumk9SM8gnffePTaHHca93E1q6?=
 =?us-ascii?Q?sAKEKCZIg97SjRFMsH1YO64QtCiLieyqD/hhYHR/jr8gFCwWSeM2FHygJqFX?=
 =?us-ascii?Q?xs4RcYeMJg9/NwhyE/XpQQe/lbrnqlEzSymtTfzaDI/Cz9HyuvW6pn+0Eqoo?=
 =?us-ascii?Q?7BswJ3b3hlG28jXTk7U3pk0HTu/v1buxj0mHm5tqgus5bvbqzonqgjF/44Rb?=
 =?us-ascii?Q?yMsNuSugxgO1XAtxD2Fz36+FrrbSr25Oj3OKqkEJs4T1+gYnltDgCn/IdfBe?=
 =?us-ascii?Q?fVy2E4LC5ER4c+hNttJjr5aQoXL80PIoGqi2X8opCIwTjq2NEnYooXqspiw+?=
 =?us-ascii?Q?unK581pvpDdPXJNHC+QVtgrQfh4wWq7IpHq+excQSgIIN4869zxT6Ok7DZWu?=
 =?us-ascii?Q?cyFXPvQJtwJfnh0e7U+tUxnxk4XDoURsLAnjzR+ryDmsk7mEI/lvSyS4ZxdK?=
 =?us-ascii?Q?JGtVTuu181g3VhZAnpyFhHH67n4DrOeGqWYPUMlhK1H5H5P+0/FGmJVzRGqg?=
 =?us-ascii?Q?5HZjTlXBCpmrXnd9le3TRKf0Ag4JeXsVR0dsSPxGoby+aPHJUK220JDo0Qal?=
 =?us-ascii?Q?bEvVBe+bAFItLcPDvU5EyVgBVSuqilysggdlIilG+pFAjM6DUMGl1bOy0RpA?=
 =?us-ascii?Q?eceGXlYrflwjqG+PXmqm6lUfglKmKPle3hk7KGbN38VV/Owsjg+PywmMTYJz?=
 =?us-ascii?Q?IONB1va/WkWXZ3phSdVl7l73zWMzCiv7Dtilvz4BTdpvUpnTT0rVsFIq9Bgw?=
 =?us-ascii?Q?+fnjKYAkxw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b11aa47-3f44-48fa-1520-08de8ad8897a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:35.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNTfj9P2qolduF3W5Dxex+rX9fgh7oihFFZkfbELFiQlKpC2sX6WbkQ8r6Y/z7oUu7mW8Cl8PmhBUAgR0mGH+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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
index faf923246ae9..1dcfd155b99c 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -150,7 +150,6 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
         let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
@@ -173,7 +172,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -205,7 +203,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index bbf89c70a425..931d806c3db8 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -19,6 +19,15 @@
 
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
 ///
 /// GB20x requires a longer timeout than Hopper/GB10x.
@@ -124,6 +133,37 @@ pub(crate) struct FmcSignatures {
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
 
@@ -224,4 +264,87 @@ pub(crate) fn extract_fmc_signatures(
 
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


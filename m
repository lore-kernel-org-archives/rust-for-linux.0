Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162F83FB7DB;
	Tue, 17 Mar 2026 22:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788076; cv=fail; b=FTUfbtLM/cbIzn/YFOX8Ty9nZrabmmdAZC2LFQDY94bk+GmkbEMZfrYr8OsZv/qQ0NYI/hH25AnLdbuhPtaUSX+551x1zOAFBL7Ivzc82RQYqyf/6zmgk/6xhM3Zm1A53AB1ZKOpnDOqPWBiLt5AEKrL0RHkHsEroNjLUFqWG14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788076; c=relaxed/simple;
	bh=cG+MwTSXUTE5EFNUQX3Bw0e5sEbHn37oTZHKDcbgDjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZBIH+o4CD1aXtD+btNwWkB24xO4uH9H3EacWOR8o/VxF01yMhXPWmlcv+R8fu4VPrp0os5SPvQXvfDlGzPylGm5GijB/A12u7MOjCfAG8gOSN+k7iOnxipbTg7OZ8DIzELm0H+COJfvGEncDRwBB5R6YXIvE4kz7PJ97xj1gaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NVPdtFDW; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NVPdtFDW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bf6LJzbEZeXXZ/qTp1f2kh0YLEB+gUt/RDP+nYB2sqWyNzAAoTUjMhgvuPi5AgFQNIqQ2gGwaO3LXHCCUzvDCoMT0eELjxle/qLCMjfyYnyfDjNPKoEb7Gt35JNHka967OtUTYsXo3tDE4K+lphvCoFPsglr+R79cvZVFpi+7oPx+mps+lxrsCNOziicE4vKfKiZG2J/Be4sWh1NeXJIbPIIH40NhL/CpOc6n5meE8OxxvTqIwmmTvfHKL0578eYadne5X0loChCQkMCf2rSSaVc6bOhV3d+cdGdv85YU/NEtI4oyu4EOZ4DKA3hvfVovcYXdvzdYLqZ14Jq9OJnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBBGJfGGO3Nd4L3+N9os+nmnO/nuhVK9onsPf4NxzFw=;
 b=d2ODjIBNVtrFx8wE/SVufiyA7Sh9Xg94MKdynGblh0+UYrsY8Hr/J2UwxMU5HT7iH81ZuzAw6eGCiSdtWgwx8UpYpFSe9LD+XHobhfuQMBMEwIlW/Bbl+fKKMOgN3mdD7JAtMHtiN6x+yLyc1lEhp65SjHX18ahaFjiFhVV02LNScaEIA9jBkFAO/3OKjeU/YCxcQrfprzhRk1278LYy2omEDt66cpYIWSS8InsvWkMI4XXwYQx36HAR/lR/BYSjPZWH31Gwhdgv3kjjADV/rP9SE+nyNpc60f2fpWtbrJoAQunSyQjEbG8exz6FZQa2i/tHrnRA4Mcw40CRXUQe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBBGJfGGO3Nd4L3+N9os+nmnO/nuhVK9onsPf4NxzFw=;
 b=NVPdtFDW9rI3I1PYG7PedtQakUDcfhwkt6JgLcmqJDJQO0rjI+0xXTji+I58ffMHGrfSv/avDVMf9BHTfb6HaB2Tw8o3FEvsVychDu6yLTdcFHuOdn5aAKNOcZ57olf0ahjUzX57g/jJvf0IKeNtQfviNiu02ukHGPmBR6jb1FbNxGkrsW2piIvFLVtnYCeWWdlypR7pDdpMins07Vr5Knkt+TV5hm3cjXG9PoPwxh+sN2dlBvbJPnzqaCXjPZS17u3go0QN9xwnZSeyupn8R2Rup7H0mYEzfiZG+6WrG2N5HuCuRimtT2GW6BlQvPDApYjjMEqmX6wOom9AbXHXdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:25 +0000
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
Subject: [PATCH v7 21/31] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Tue, 17 Mar 2026 15:53:45 -0700
Message-ID: <20260317225355.549853-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: f4dd305f-0c7e-4957-638b-08de8478233e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t3saKsF+sV+SObrPCqywNlQx0WlF/KPE8HgKmYQsZwHNeI965uQNMtohuRT7dM+xl0X9YvLh/dgEIBHCpHYO8nm1Ax+wCZgylruOKxwrXw985jqOMIRtzmHv5e3F3Q6anrHwrhWkWXkkHtyV8VnxLBnXZpWc9abv6rpwjb4yTGrbCQTN3xgiqkWmLFkpwDo4iEqFHph4OTN+31l7tXg8dv7XeawgOfLDIyTNCUUkQFGZ6YhiqSVS+CZJtPxn8v+9MHSE0NFcOQgX+LNcOcAmEqfwKMz9dP040/XCnWvUha8LSOVe98BmMpvl/p5xNJ3A65BePmONjVjAJrtsGz9i3xMEzqjxbgYDKyfcFa2dQDaKyROyixevnvIJZshJeT+iroj7X1tdV9oAkT9oZWNKBNBJeGRz4Z356Ui0nmBnWl8hKdaTAcLPHqNZlJuKBkcm0Cojfvi55aLZMg3rnGxbSdiSDxS08sH7KVfBeOLxxRVNgFBKjaR+hvYWFO+xHZcGJSOQpHBUtzkATSI3OCIJU1Pc34CA6wtBCtQaQjKvfN2EVRm10H43NSMFf948906WtX6gwHlGMlNqV50G2cNCqVmaoR7Z0FkNKydUeyI4E8rRw/6U52hlq22fZRrKmqav+zgHPqiDTMTAibjbjr+RAUyUfNANkkzQYBBXw2YV5z+CYikJyKCc0dW7mpor8/lK2vV55jXW9ooDrGen0OseIZBfdJU9Y0lDLsHVRcH64vA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jhMRFyb3Hdvj0NBYst58Hv3NbPZ8S5g2AOhm2AM3x8tAdCq9Zk2sJ7d1h42B?=
 =?us-ascii?Q?wdunxwNhU1zQ5A1X3BVku6KR55Xs+wk5G/Q7T8nKYkXHAB7PmNwttq3Y+oUv?=
 =?us-ascii?Q?wCQdQcgOODFbvGZv9hIi+1+mSjBEdmox4vmnOmIbRfb580ZwQBjmetpeHN/S?=
 =?us-ascii?Q?bm60d24oIUKo9qwwQHzjg8icrDGkMeIKagv3sEdLVdFzmo37Pi2gSpa4mDSc?=
 =?us-ascii?Q?1ECgfi+sUMMrx9QgPVx6f7OrCP8Z8haeSAbqr7bLvOsWAT2p6w5yfq9UIJOe?=
 =?us-ascii?Q?yoHs11FFm+qfeXP8Z2YYtlrl9mohKhqrFNgPFjJaNxrUkLCWiVnTujFNHLwY?=
 =?us-ascii?Q?PbvVumijxR0hw7bG8Px+CAR6g75friNJ/o800NQhnYp2VkUzpwuUdJ44dlI4?=
 =?us-ascii?Q?HiiS/yRIzhJygwvwSEUkQvUT2geQxnKgd25VwFYd0QUl6aT/EYdxyBCOdxMi?=
 =?us-ascii?Q?Be4ew4cyGeyEwlakEeiV6E4ZUHGEXnvgUsJMhTm3lbBpdCQ6QFVUYmjnErv+?=
 =?us-ascii?Q?lQHKWb3C8qg50tq6niEUqys805eLOSuOLvx0NwVGPonHvYfS4FGtb8ST1PAw?=
 =?us-ascii?Q?XeBYpcGCPe2vPVbdE5LfxBT99PAE1eVVZHZvdgqkITLy/sWQMjUR8rDkJiG2?=
 =?us-ascii?Q?VJJ93IJZDa22DXoTn8t9lXV1Go/UZOP5Y8ymn1qJ0QEnbI3u1Ok2y/NFjExZ?=
 =?us-ascii?Q?aT3ml57P9C8Tjc4fWw7S9FcKZsWrnfitfN15pqiznEZBD8U4lwqwUsqHspWC?=
 =?us-ascii?Q?UP5HmP0lEUU5qvbUH350EhDuKNL8NFAiRlEGn4ycqL3U7aE97Enxt4cyolk4?=
 =?us-ascii?Q?IglXZmLdWK7JMsRGEPjjQlB1AEE8hQLU2WdLcN6spWBs6KMvjUklQSPdnePL?=
 =?us-ascii?Q?6qPxdKoRp4XzeyQ+7xIW6EYvd1dPhaScGgq/vAcAREx1BeT0sASDQ726/rL6?=
 =?us-ascii?Q?u/VcupCoZgfcsdkRV8u3DOo+SgWC5CzlkWSJKt+4JCK05pbxlK4HnnxfRWF7?=
 =?us-ascii?Q?Ga7mHw70+bb+ujBHhmPtfLbOip7OTNDMbJr/fJoS4tuFiswXz9UkoXBOkuJp?=
 =?us-ascii?Q?YC0ZunhqqR3OosKDLvBeFjBf+2Zszig9bTEYWoFh+x1AFOcJQwHibuygu4kR?=
 =?us-ascii?Q?7WpF+Ehz5U7tisWqIYUagLG5VeSendwCibYvOSSRr8H7InmyDxdNrr0+bmz4?=
 =?us-ascii?Q?TpUs/+IOUo1UR94BQLUleKxdIrt8rb3UGxIPdP1QHYVafJwoqnFE8AGrzRCR?=
 =?us-ascii?Q?G/cd1S9d/x2A74w8+hamSiFViHxZjjdQywx98gRJkOkGfh8RRfYrF/WNLgU9?=
 =?us-ascii?Q?WfYQQ5dFuy4qgo2POkYyY0hW9zJ51i+4L2JS6uELFEw/8qDZG2sYFJUCb/Xq?=
 =?us-ascii?Q?nk96SHenim+nBTigaZY1TY+FUvW2MWr+/BN4ttDOWXcEaEnWfij1TRP8TJUT?=
 =?us-ascii?Q?HJUQZZqRD/1gDTgCNmUqSCjSI0Nsx5wwhv7jzkmBjhhFRrEr34PGT4/YdWDL?=
 =?us-ascii?Q?dA51so/VuVXat3zQ2bSC9Ifl4+io8cuMal0vS4WZHRBuF5tDgaWKclET+2Zs?=
 =?us-ascii?Q?xVajgtTBbgK/s66JckVGgZ60DWAxsGuIjul1lwsEUkhuF5xXIu+XaItWEYgZ?=
 =?us-ascii?Q?StEbwcwB2b+0HGayyGkxb91boiNbMcbP0L4Y3AVipX5gyXCEsgO7IieCY/9F?=
 =?us-ascii?Q?zrUSa271WiWGMhnQoObUMCM1SEkSgIfhbUZ+TFvryvHvOlTydqcmRvJo5rto?=
 =?us-ascii?Q?2nyVV+8pYw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dd305f-0c7e-4957-638b-08de8478233e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:25.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0MKgY6TM0cmHN9qDtJcIWbNSlqxY9+35Yzuvp7eGcGuRAXvo9tmrOrRKy8uzVNKilW9rd5JFubOomQBo6+U9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Add send_sync_fsp() which sends an MCTP/NVDM message to FSP and waits
for the response. Response validation uses the typed MctpHeader and
NvdmHeader wrappers from the previous commit.

A MessageToFsp trait provides the NVDM type constant for each message
struct, so send_sync_fsp() can verify that the response matches the
request.

Cc: Timur Tabi <ttabi@nvidia.com>
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
index a13d883373f0..4fb932f91da2 100644
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
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
 
@@ -117,6 +126,37 @@ pub(crate) struct FmcSignatures {
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
 
@@ -217,4 +257,87 @@ pub(crate) fn extract_fmc_signatures(
 
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


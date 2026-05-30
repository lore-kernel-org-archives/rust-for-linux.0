Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2D34B1A6;
	Sat, 30 May 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110640; cv=fail; b=q8NqkB/CO+wJzcbbY8+EB2cLkw6QZ5DSf6IGkN+svumtB81SfQxG/ng9aILGK1pR0rZdfcU+GY9Lq4+C/KJ2KA00dcy4ZyRMI79x8POCaMOmNDAU14Qu05p67qWy/wd6ocqK97nORIue+9r4h+OX2bavpN6AicLjE8NLsgcVYyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110640; c=relaxed/simple;
	bh=hE65RrLn9QfkDx5WDGcPkqIT8V4A25AuWGe6Nu92f8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cCPIZ4jT0mmbHObKwJ/RITobcjeOxjUV8fZFe+4CmqDji3cD4VT4ExaWPrs1RbIuEgEAhPYr+qPdSaKaRfpBrf6VawkYqKT7NaGJ8YQUzqRZzX5SIZqhg1ou9EVAD2Q75i9T+satg5GyqTgWoS7TMRKyHOXwOqtRtTKP9nDcJ/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UviKSSXm; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UviKSSXm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riwKmu736gDheT5dwu86N9oTfufi4SIZGsF9EBRZvil6zTIpWuoGOrsoThPo4g4vsyDt8FuDNbN2Lzt4AHJDjr7AHK5d0MweTIo8Qk2hkjjzSVwOeCbbCgCidCx+rNw2V03ISlPKtRoJn3+FSkDj/FMjTAiSfLB8J8O9IE8VL3Eb1SgLkAOgkJbO8IUKfzpacM1pSATtqdUwem4S3CLK/5bozf8UtUJjuYjgSpLKvqa9MxDl4qMUSy4sNrv0FezBWaB0k/yOEf1vgAvb+n6OF6iJ3jbn7695/R6wF5Rg3IGFnYvD8bhPZJ9DG84IL6Y/LRxWQY86Ctoes7PVNepsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeWXXJj0chN7FUBLpO0RHrbZfx2kYvTNw49aKEn23jE=;
 b=rt7eX45g9ST12oKarKlDwPRyYv5X5RPAz7HLTBtu+TsSnrLyDBM+c4ErRFxAWOy5bhGnS8tuzVlzGsOX5iW6LmDo9R9jT4WzuScdN+W3k0zDZAMPEQGf8MMh/D+HnrSfHm7PwqpN7R1wBnudgDloMHEr5mzCDEDVD4PABxCLQvt+ULZvYATyffvfHhu6GsznY5hmmWkI9gPVCmK/BkPMR6+PdbMkwIFz5iZYt0TAgVtfnXPQasMA3dmOE0rS3tZjFBWFzo2/nmaUFJ2E76Gf7BXb14axUbOe3I55WPPH5s0el1HcLjZqWkPg+wq8GhwR4Q1tPVaYQoecUG58mRj5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeWXXJj0chN7FUBLpO0RHrbZfx2kYvTNw49aKEn23jE=;
 b=UviKSSXma5MsPsmLdneOhdeTvDLisqjxg8lbfEolFlrnM8O25lH+uKbx8gittekNNxM21Yk+yPihIsZH6aHxW96RiofPtrWsTVwxwzTi9J92fiBIuWjHplAyvfcoBFLmVlIzM6BOYnaEdiS2Et1ZMfiAkaG4XCp84tNFsV2KWhEVEVKe4BhD9Vz3HEbLcomdFRGb+l/MayCLeCZchDsWgjV6dwah3ut0LDSmyVORbZfvOniAZjhkEbpfyjZpZhqyv2UOmW5TU2GzASVdTSoMkO55w0bxa12yx+xWzeCx1C3QPyCec0OQ+HgtfOfSlBMrej3jqm4qZiYBuU7o9ZDAYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:17 +0000
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
Subject: [PATCH v11 17/22] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Fri, 29 May 2026 20:09:48 -0700
Message-ID: <20260530030953.740561-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3826b4-e7a5-4578-4a8a-08debdf8f949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y9ND9TyNuVBsVb/Quf8rCR3MMLyl2QF9JjLyWnzwXvWH8NgsPYY85mbQWpVZ9obx3pkav8AsSPZO+FEciyhcIFJIAqXUFwTDGLJ+qvXNGxQ7uVW3yfQobnKyqd9S7KdooR64V++EdyiIdUQICeUpo+c0wOZPjlWC5JaYcmi+J+Y1rVzA7l0qBj59qOpQrj4k20aCYBRSFp79rfYwwUJj84BfBgTl/nAKS3+41Hc7GvxpAfpLm2l0IHpBGBfMk0eqHOdnEAyVnw6IFlCNIHGPCRvZcNCTgJ3bvLMOVORZ1cJJ+78IL4mwdfS3Acd3ZNNcWp9Gfz9lSn0+JLxPdx5kfymnsw/X3KqxtN2n4y3hT2yG6eXT9UzCr1mgAGWew/cYxgy0fMtrRZmeHgRau0pNkwdNKrzKhLfOfC8Q7mP/rQT9/wWchl7JaC3O/kIokfZbVj4ewDvR8nTRdZM8NKpTBrQdq+ZeBnvv9XflWsYxRvNl9dtzCulc2YBOOqtwBKaoZrmzcKOEeGGNNbjKgnWOjqS5LZNx724jq4O1ePsXqQKjFj6GtZLeFXIXbiWwtryyj8pwHJn3ee3IxNzlWS0NNAxNcb1TnYUyZpv7dhRZFW5uta876Xoz1IJ4cUj3CrcbMacTtQFSp5Msm6BAfFQhUVA6KVWEJv4y79nqc810qmZk5AXpfN2cOwe/VUJQXRTp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6SrHl1hWt/g0TMhimyYslPfkSVEuFMYnGodTgDQ4I1TzPIcwjqxAtwhx7KQN?=
 =?us-ascii?Q?reT1JBlyNF/+IWZETsbEVD8Fxyl3HhDMqLd7rGT5IR7PJZHehGulpn9PXUdb?=
 =?us-ascii?Q?phgDnI/z3UfbwcwDCetI9xwmxlsj9nXaKIm80cTsC0L679lu5GnNe9bXiFu1?=
 =?us-ascii?Q?CBIUeUxI+0MW0SrD2ezdjrgUk/yOZDtXxq9ynfPMq0KGCu9HOKP0FXCglg1T?=
 =?us-ascii?Q?GwSZf2QK9w1S0Vnp85TOgW8q8MrLq7mA8xWVaG+Er1rL6bEm+s23zzWk4yLE?=
 =?us-ascii?Q?YXnNCrWoeCGntaB/HbvIKMjVkffI1svsJuin5rrN5REcpb85uItyd3R7q1On?=
 =?us-ascii?Q?YruTQfSj7b46cLMoe67/nkYcT66CaCr8BZ1BYWYHAmHNdvdvVois5c2jxXrc?=
 =?us-ascii?Q?FPzd6sMBVwNWZvv7eEkn0kbzLXBUrHLYy5n3nJWltIjL2FNN+y5OazhsucsX?=
 =?us-ascii?Q?Ai/T69xMIJa6y+UIstr32Kt11gEfD+UvvLCUIUmiva+ducSCojNCqS1m0S+B?=
 =?us-ascii?Q?fseSBY3efXBKPzS0zqZFgaIjFVwC0x5Lb9+ihRqDzncKo7uQNOXczpWIOCqs?=
 =?us-ascii?Q?l/QFRH/X3I987SjGScMPSVqK6TgPVJVMLaAZplIlZ0Df0k19NFPqtXOlJs2f?=
 =?us-ascii?Q?x49G0zDR905dES7dJHU1CyfSArzE5x5dRVZgmgeqPIUClg9jm2PWh2oDYXSt?=
 =?us-ascii?Q?v5iq+wL+WcfnEg15K2o2tM6QJ4koqOLoZ4U1VfO+aFimtbwPV/BX3VPA5iKk?=
 =?us-ascii?Q?x9auXzsP6TWDeTsQ0R707FhQiD+xNjiRhwrGw88TPNZUUmG7MoVNioFxs0J6?=
 =?us-ascii?Q?tIhU4+V2lbKaJCeyX1AeJs3t5O2SljDG/b3NIdT7PAp0e1rmk8CBOk1RVuO0?=
 =?us-ascii?Q?HIK4dQl666gatmgfMgvaKP3fbK46t+BLj1DFWBniC/VH564Zx6+Lr5n8kXcW?=
 =?us-ascii?Q?y0AjIc9sAgs5yLFxGBrSkdw4RlaDRfxxH19R9wqjCmFVRlWgCH3NizW1e41b?=
 =?us-ascii?Q?rNHvoYqZEPgmPCpfRiumxGjEnji2kSabAfZQt2nH8YK1ziTaZn8G9HSoiBgq?=
 =?us-ascii?Q?d9N94HTxND8XK/tLAhfAU1+kDMdt91Df6rrlvIYWQYohXZoD+NJdFkinYj67?=
 =?us-ascii?Q?cq1T8aS0ZryogMqvV76VpO3eFxnqQUG5AHBomji0X6wZSg9kyYqSJhWQUXbU?=
 =?us-ascii?Q?gFVAzSt78AQyy7OYvLFsJoBfXIKk2v8jCy3dbe9WNYcVtGJhbLWMlAlyWCyQ?=
 =?us-ascii?Q?GQq/j/laALBq+5BmJaEpz4Z6hPiwZZ+NAeuGXN+wcnABk6XWac71dk+UHgz5?=
 =?us-ascii?Q?zRZK98loT/N1AMiOo7p+rNAcMst65jWBVYVh3NTB9HOoHUjhX75jaIlHYKaO?=
 =?us-ascii?Q?Xn0XHe9DMxLMKsS6OztHbPjrQ5Eyyf158UBnZGmSPqejoCfDQXN/o1pnb6UU?=
 =?us-ascii?Q?ZEzou7EcJ7jAfkLv6aMpOZHzsxDH6SKzeu3cTGyKEJiw1hmBzxK0p//ZzPYk?=
 =?us-ascii?Q?48BQD4oJeu/7T3Lcnw2Y5pxPNWnfq+/1mAYp+L+B+7fdoC9AcgQ+ePuuwX/A?=
 =?us-ascii?Q?ESu/QyoPdrPLeke+bifThvly9UjQEYnJz/7/WDUDlUqwo02tF41llkPZU3Bi?=
 =?us-ascii?Q?6I2eV7bxBV/ud5u73x9lPGqmcVg1Wsb1L5c1OgPMg90qAB+md1xo0HeKzbdC?=
 =?us-ascii?Q?1ww+ZaDh67k03dA/eUeqWEO/QPAWYBAetfHUCbtoAwE65Z/B0F3dd5b/MTv8?=
 =?us-ascii?Q?4NJ92dKdjw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3826b4-e7a5-4578-4a8a-08debdf8f949
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:17.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0Lhy+p4NRnwDUlEEzV9wOrnyoR5jAHvNTAukrEStf3fCcB97ea76cj98NTvexp61CAkQEDhWq1by+/jv8egyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

FSP exchanges are request/response: the driver sends an MCTP/NVDM
message and must match the reply against the request before acting on
it. Add the synchronous send-and-wait path that validates the response
transport and message headers and confirms the reply corresponds to the
request that was sent.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   3 -
 drivers/gpu/nova-core/fsp.rs        | 129 +++++++++++++++++++++++++++-
 2 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 57880c4289cc..a3345121485d 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -150,7 +150,6 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
     ///
     /// The FSP message queue is not circular. Pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(dead_code)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
         let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
@@ -166,7 +165,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     /// Writes `packet` to FSP EMEM and updates the queue pointers to notify FSP.
     ///
     /// Returns `EINVAL` if `packet` is empty or its length is not 4-byte aligned.
-    #[expect(dead_code)]
     pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -187,7 +185,6 @@ pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// `size` comes from `poll_msgq`. Returns `EINVAL` if `size` is 0, exceeds
     /// `buffer`, or is not 4-byte aligned.
-    #[expect(dead_code)]
     pub(crate) fn recv_msg(&mut self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index ee8fc384fe38..cc2ebc3f6e78 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -11,17 +11,64 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
-    time::Delta, //
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
     driver::Bar0,
+    falcon::{
+        self,
+        Falcon, //
+    },
     gpu::Chipset,
+    mctp::{
+        MctpHeader,
+        NvdmHeader,
+        NvdmType, //
+    },
+    num,
     regs, //
 };
 
 mod hal;
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
+/// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
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
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
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
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -48,4 +95,84 @@ pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, chipset: Chipse
         })
         .map(|_| ())
     }
+
+    /// Sends a message to FSP and waits for the response.
+    #[expect(dead_code)]
+    fn send_sync_fsp<M>(
+        dev: &device::Device,
+        bar: &Bar0,
+        fsp_falcon: &mut Falcon<falcon::fsp::Fsp>,
+        msg: &M,
+    ) -> Result
+    where
+        M: MessageToFsp,
+    {
+        fsp_falcon.send_msg(bar, msg.as_bytes())?;
+
+        let packet_size = read_poll_timeout(
+            || Ok(fsp_falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::from_millis(10),
+            Delta::from_millis(FSP_MSG_TIMEOUT_MS),
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        let packet_size = num::u32_as_usize(packet_size);
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        fsp_falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        let (response, _) = FspResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            EIO
+        })?;
+
+        let mctp_header = response.mctp_header;
+        let nvdm_header = response.nvdm_header;
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        if !mctp_header.is_single_packet() {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:x?}\n",
+                mctp_header,
+            );
+            return Err(EIO);
+        }
+
+        if !nvdm_header.validate(NvdmType::FspResponse) {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:x?}\n",
+                nvdm_header,
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
2.54.0


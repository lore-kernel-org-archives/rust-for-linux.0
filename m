Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D8530C615;
	Wed, 25 Mar 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410811; cv=fail; b=RlvclFAAtnKCqzvzLb4wMtuqWTOqWbVjAKhDdjSxxkYpCgUK9JRXOPDPua/xrAKHUZwJ3s8hpjf7VkzDYx6aLGqXVnbdC86+94VFob5WzaCYYK7uZ7Zp4RV5+H6O4khCdl8GjWBHbKVX3D+O387653brq/Lk/IKnZUjfGXwZj/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410811; c=relaxed/simple;
	bh=mJgz1bHOqiX6aHL6tTE15RNweRaRzQqCwauCVr9ayk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KY1Qx+id136l6+LmduzWALfZ+BANrMbAoJ4AdAkzhAj18NZbbu5+VtUmMXjSTpWBeRmFicqhz6WTmGknpiI97aXDMpzVlQJFbgFjKv23MBAh4uN+Qyohhj3x8bVaOl0S8WxRcD7/MwwZVfcw2PBnYKQubZ4jiXqH/QrYSCIL4Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nijyxMsT; arc=fail smtp.client-ip=40.107.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nijyxMsT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tn/2HxErbcD6GY2kHWxy+YRVqMgkhrovVcakxmjbLBP7PctjP9XAlM1GvvK/Y+Em4mFjDccGxDWFFxRagXVHaIav669QPkPdvb+eUFqmJgKyaMdBcyTI0+TbpeJCFoWbv6IRGS7z22r35/iGdBSrvlj3gCWkAl2ZOBk1m29BHiCGyGedptIdKtRltCgfHrdGITp6td6X4JoQfnxbkg8s3LoRzBK0smCm6FHgWzXyl6OFriNzXvGaVhGXGLqbG5bWBPkU9crFOANQQyJZsAmDWeBK4AtvOuj9+2RAnDFdiCvK5fy3T8LpXUw3ZAmtGScy+DdEaPeenDbuDyxVyXelmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj8JguWdzjoAUMkaxADprArLMyXrhEtlkUu3lXc10Cw=;
 b=TJbTNwxZ4SVgjY0pDlt3RERXpR4QrxPoh3uuZJjc9R25TKGc0g/vAPcqqziwug84k72xfj129z4a1lc2V78hfO4aSsTl3fHorrheNWlqsmbche7FMq3XAJFJ5yDZ8iUvpqku7qSyMPnitwrUzWQopqK+f/bbe4GS9i+AYCOkUbB9PHeBRo9fPRDJAY8UFKnUTZpXZKhc9IBG7uoq0Gv76f0Qxzl4+p2RQmQwJ/TqTKMVtmegl5umnz3gZg4goRj2x/gxtwS+t5nKC1+hBVnjTx4KzfijtGsc1JfmrmwbCiDCNhM6MmfUTXWwHmikaF9on9NTWWJ6kv7p94UAOxLUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj8JguWdzjoAUMkaxADprArLMyXrhEtlkUu3lXc10Cw=;
 b=nijyxMsTUSvoy/srpFQJd5DZ7XFq88+IfqY6LeMF5zZ58jEtBHETu/bnMw8E7nF6fDd/S/v12gt+pGaiwsD9/jfbXlutPbt42LX42Q44P/iFPKBqC0AYHreavVxgp0vRYKgBNP9rxfPmfV98PuqRZMWW1IeuiHGGt8pP1eLwp5u3KpWsY04Su8EEOYHjBDkMeNLovlkSl/iApztQ+oc0Vqd67XqQioFRca2YxlDF6xUKvkEpmM8gG9SoX4rUddG3rUy4rQZfA73OlL5FyU0Po3pTorTeTdK/HyCPfbProqLuOl0TGkGsqL79zQxiqBt6Lj2mAPUKoZwiPlJWQAGYCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:11 +0000
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
Subject: [PATCH v8 21/31] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Tue, 24 Mar 2026 20:52:32 -0700
Message-ID: <20260325035242.368661-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f7cc8d-b180-4b69-0f52-08de8a2208ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ySzgTQ2SVukoHJQlpC9+HXhoopZBjnleVCOSalLSfBd/oPxQG1TaInnBBu/B4WX9XPU5nh1DtkKZKty3qpGwTgIC+EUVn5z1eNadYlOJwnMU8XPrMLVJrd4s5BiBZLxuMz6ImRWKxvxLF/1jtrgMvl9I/fnWtgkFw6Rmg5z5AmAHZ76MhURo26XmzAg0gHH5nGYnr7jO2oV9IzootGmGCi6gOBehEh3YEgHoSJK1YMzLSlQI1hzuPEj9LfCQ6kLOC1sxuAypaKfM8Og9aoZPgOAukGq73szJa12RYeUnINVWFQBGc2SnDMw8l5d5qJdY2/w0TlkDQEMQt51CDmS6lrUylReIU3g6JfkSwZ4pw2S7jVKFKMr0NrHnLsnwPCJAH9Ho4GUqIv+1GkN391jlj8Em4bU/xZKMIpLPUanTU1ssJxHTikaGVHsZef/PRLJ+z2jWxgj+LEuVtvkbqLNoCBExJA2Iaz8Or1Uku2Rh0juaoJYIs1EjTqbPjz71zyLkWoaTuX9ZJqCmFsim4Ha3muHx5dS2trKmSsqaSIDwjqG4Gf9zrftYwLFX+IayussYiPUrx8lQQfm/xvErp7/Xj/jaW5hXef8ezOTQ6V20XZjieIVTRu4kN72WGwzlC5itiugCBG7Ni2M8qKFLvEgyZmPAWtmb8MmQG9T3QW1GuBXULQUvexPmLZjAD0HhRLuKxxIRhqNTB2CJvS9kZ02ibN19iCrHS2xKsJVP6wFvW+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xq1zw+jcOAKPN/99tCkFLOiFIBM3fNoPs0g+4+9v88IvOm9xvV328QcqTFfd?=
 =?us-ascii?Q?tchQc5S1laI5oRTpp6LUkkefV3SD04Rz2l16/SdU0epDgVMArcRNzyHsMkdC?=
 =?us-ascii?Q?MJo/RLFMj2NakphkLAjP99lZ16H1NuL5V4l5dga6s8ngJIiF8mGalFDktJKi?=
 =?us-ascii?Q?R4PQoeEcI6qec6mgV0veAeq/KN/tRi6T1CZdzQImZYl+eyZME7Ne6VNgXNQR?=
 =?us-ascii?Q?96TWiaE9+ZPZkohaJ3QM4ZnMldj9QWszYp4kCKq+H44b2l2ge9LInJBEmuZN?=
 =?us-ascii?Q?m0RUr5axkd8KxiSxyg78WkLSNVw0Gy3480KaQkIEd3hpPvAsyHv9WUzcPTsX?=
 =?us-ascii?Q?19rjOmnDdyMl2eEqrrQo5ZOvWo3Zranoik5ohKWejRkmKnzVo4mOVBT6sOl+?=
 =?us-ascii?Q?dnRnar2rNHQm1KTrtGpSJLJJRs4669jG+3a/HJGtxhY5MctSQtqx8N1VrGis?=
 =?us-ascii?Q?5pYrXmyRc10gWEVMJG+/SLChgp8qxBlXDj+G+lNfyJYH01nefChUIudcd04g?=
 =?us-ascii?Q?XGjcpjM91Ma8KiStHZVaD/66eX+7sHnT1V8kGRrsmZVCRh98oSWdkOFJUEw0?=
 =?us-ascii?Q?9jTsqGp2NEcrZHoeW8TKgoKAJuLRwSn4KEucYU5iDbB8INe8cj6L4u/yg5na?=
 =?us-ascii?Q?+HcqzS/nWtTgHxPk4JTmo2mURsPOT4UVJ6FO7gp/e4e8a6n/GpSQfAh9L4t5?=
 =?us-ascii?Q?u8VDuV6hJc9O3fuUiRAg4AJ085a5G3s6PU7rJcQIz0W7m4lQDGL7z1ZWmgW+?=
 =?us-ascii?Q?CeI6ZNaleBdrYVfgyZxwOhtdV7BEHrFJkalOzJ3PH7H97NBTa72yyBkguurK?=
 =?us-ascii?Q?cstNNaauMqUflXhvHYis4sK8EPfeDdQi9gpYYRbUkL01FWy7hag6azWGYLmR?=
 =?us-ascii?Q?VqtY7aXD1EBI0tbpAuxyAM8/TdbY6od01kUPY69rlXUfSwNFRk+qOqC9UuKN?=
 =?us-ascii?Q?qMNjbHa3heFZBurt4PA9E+U9RJLjeuL2WC7ZmRtvODiaz/XKEBnXkiOOQa3T?=
 =?us-ascii?Q?hd1pOtoQ7BOgaf93gqb9oX6oZdmW/M4W+xpYt+4oVbCSQrtIOEioyHyEA6ZC?=
 =?us-ascii?Q?FdoQNtEd1RQl52RPFKRsD+P+1wpfQ971zvBta3Vj1SasYAIPOFMZwd2lSTqF?=
 =?us-ascii?Q?LnaKrR7f+s5Me5KmunkBuAA8/W4HwGMyAAzZzzdH7wsfkGsrzdsHI5A6Qxr2?=
 =?us-ascii?Q?XRh13Q6/przZ7aM8v3Rj86Ee/Q9h9TvNCJo3k16Aspmn5rk6B6QBiBt+Dg3a?=
 =?us-ascii?Q?rztoKRvKSF/Tmw5+J5j1INJ5VeDZaf4U+BD7lLCr76CEAX5YjyqRKxUhAdiN?=
 =?us-ascii?Q?DLolqtokW3aQsmjpP3/PqJ1bXqAtgoHC5WSIf4Mo0gHeVUVfRobl6jh5PYna?=
 =?us-ascii?Q?gO2kbwWSxrKWdB3PCSE7e2OKqMOrZYHzKNsz+jxy/3yyuoH6wOOGIg+cn4l1?=
 =?us-ascii?Q?UbEKxGCmgnYnvMwrJ35TzYEJOz/jbIeQeulUzPPuyNIEJaT7/U1AvReTi10o?=
 =?us-ascii?Q?Ze5hDH52wHJ4Y3t/dc/CwnlqdBgewIYlA1KvocezYmAw/LnOsexxasKLw7Ri?=
 =?us-ascii?Q?tzD27qR2GSYYrmKFjzlsclDPvGatiJVP13KMZQYaFJU4swZ6ck9Qi7T1kb8E?=
 =?us-ascii?Q?cK2/AFyjK8JxwWlDk+9TcArnEtkZ5noEyeVWjflygVfAk75Ny9/XPvSCC2eg?=
 =?us-ascii?Q?mcqDqpxIdNmWrX3wHpMdMhE73RYbQ4eV5s33Z/QOFItRHe916zEXf+V95tEI?=
 =?us-ascii?Q?E3upKb7+Gg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f7cc8d-b180-4b69-0f52-08de8a2208ad
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:11.3899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7oYgdECxtk6m4M9xyIqTJb5eE5MiztN8sTG4MF8cs4UZq9TbeB1tS/mY9ELabVjuECymgMETEX8hikNUiNNzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

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


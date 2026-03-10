Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58643B8BA1;
	Tue, 10 Mar 2026 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108737; cv=fail; b=Xm+79HQ+zgr0/LkqgoMK4ix8ciCB2euIzkgvCQLu7ydrImsHnTmVFwsyqqoGGIA+mnJ+jfkkGPTVxbpqWI59ukr+AxcO7W5NnFXsdPgw/3Ixf2hqW2+gpB3G7w8lxGWLSHHplmrM86XeUJHOy4nRhw9QTYyBtOXstIHreCzdidE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108737; c=relaxed/simple;
	bh=sShggRMd+ekMGUkfd/CVxgHl8AozYqJ2DZPOp63KH9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H1JjupCIaQJSiGDBhfzlwwF3gShNXL8xgoMHB2YeIkv96mhp9SSzTgj6tmEkTsEGlpYTqS2kIbwhALATWZr77bf7iMK85CzxOadq9FrivAfDG+OpW9J+744P7rQ9SScyi5xiA/PaTTpSwLhG84u2LyWK4Wj/aVVbspD/8zLruMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LJgjLTgE; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJgjLTgE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZvyr1n0w7HOt1KRbZq7Loh3596Wdcpb2hh6Ycd0eYmznr1mBauWOHkFEIS7E08yPvq26epxc/Xgie0gUGvAh7aMzVJHZzFaVaH7xWpB5BR9kxlyn2IfTjO0plWu/qwrJhS787+uT0v5jFns+yjhxWDXFJdG1xQt9ll3bpXbgnnAfyMOcf99HPFXtcRsnLZc+mh1wkiNtSLXLL7EqSEcq3WRaQUWar3de7SGcSUdhcd3tzXXM2Ow8547Nvi3Hw5WKhXAEE45ke8y4BsedvYQkuQrNfRZJJuzIBNS63rUV91CKFhnX6Qac7bKSVRuWEjM6YnKeaO8C9mmY1YIMEr9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiiW9n8Rju6DW1/5dbzF0tRCqtkd2RZzkTQJ6TrG9bQ=;
 b=AarcT0tEoZgmEfgU0Z5p4zp3sI4ajsBZeWyfyfJ/uvu74Gp0zrf9X9zEPdLeit0pffUIyZTmnNItEDIP0YaZPg3owtRPhWGxbfGG6vQSvFxoQTxBdXnEXq+McwYDx9f3ymvUF96IouYqiDBRA6lQ5uzS6oJWamGibSQyJR7LAIsIleq6dVP+P9zRqhOaXibD1E2gljeY5sILfAmwYiZ7xBDSoO/2TyDA7Y/1yeribT+pHPtu4o/qv1564gnJ7OqjgaF5mnpMEUX0p8uXaa1k1WmNYglblNwPeZt53u6uWh8SB3tOsf6WHQjAiNr+KDafKlVLbp2CwFP/H3OEuNcpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiiW9n8Rju6DW1/5dbzF0tRCqtkd2RZzkTQJ6TrG9bQ=;
 b=LJgjLTgEu6+S+u08W8IULHlqhrkdWVph3wxI4MrXhFoqXjR3kicl7hFMJ/IajqMeHViaAHddOHnutVVqVDQQezMyrIxBXI0ctME4d0u6V1CQK2h6mi+fM5ujOCGO88t4Z5DD6S4xwXREU9EFlm0MAx8T8z4wYWlrnnL62enzLIGbVeKN94MwPbSUuWGF5SBwKhPRoplo6YnUU5gYXQIyoeJdw0emej6Ekaau2gF+UYHbObyUl8CUHmEeKZtEBJJbLK+hQaxFiR2M27cNZE/MxdvsfXg1V18st7adfX0aUOxqEm5hkNqzPUNrzver6zv8MadAFv3rYmmWwGI2ThRw6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:02 +0000
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
Subject: [PATCH v6 25/34] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Mon,  9 Mar 2026 19:11:15 -0700
Message-ID: <20260310021125.117855-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d441ab8-dfdc-400a-2188-08de7e4a6ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	mngeV31j8n3l3wj4EpJhsA5gV/PoQC1lqVhGrf6WFRh1hiyRtUk4pYd0bGcidXHxiUJjQhZGXaoV35stvAhGtFWGJsdqULt6R9Zdw9eoaB/3DwcQgDyd7Fkxyq0CCr2fCeRq8wisO3JdETQvuhZ6kcaqqpWQhp8B2lJSrtwuMZkLqlY1pFsPTfEJ4KGVhCNOCNHJUViyrCJoj8rG/93BGcXAFypHgMmpsKzvtGg40To5WNLqxZlleNMqMsW0B/Io7IrOLGhbWzFPdmsd3KokMJNsgNtJ16Lt/nUC+Qho8xvDf8O64pO5mWueFU/69DMgxW/SghAMCQEyWWmqA8h5ML6hyuIL/s93qU7G/+p3FtF5EuwvpUX1bDZNTiy3+vv/zoJZdxzKogOmQhkcZEOWLdjeN+DqcVwsDT9XaZnN6DsDK94Ke841bC7Uk5YgofKkhN1zZKLeiz15sXD+/aZvmFcy81GW7knNO8+JYCaiRx/BA5UpCR3hDa5/JY/+1iPQgCyr7TZIY7OebA2O6X92X0fQ4UnZtRaKa4F9Ud8q0j2/7TKzbKvoSZL/yDphzS7xIQe4ToKj/zC6D1T8aaUBDHrn9ySvsIeNgLrjBTxB6fHc5e5yAbB68hjgvItJiRaQ0pPMkqGtLVC4vc6PCCE2Z6LUz2RtB3J6PzdcWFCs8kXVdzxKmEznOv0gK2iWiLr0tEt0EtI+IY857/SQe8rjo8JlQ75nHmVtwqsr7+1VsLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1h08EkEu8TCSPTL+uAs8dqJ3jq2QVSH72cYdGJWYwatxG7e79mp/pLeXW9o/?=
 =?us-ascii?Q?WDgq7tZ3VpAsIexc6lwiPcCBLw63y2gqYhNk16BDp/7Jq1VYOvWxYyixDYJf?=
 =?us-ascii?Q?8nqs13i0d46GA9wxbtZ8HwaENlfjzWkZFUtHpTJF0FSggPkMwXWDBxfAna9P?=
 =?us-ascii?Q?agU8RgxD/Cu85OPumWzz/yXr4FJqfIgl72kZSxmdUpFGvzo07e80QJuG1pMd?=
 =?us-ascii?Q?Ab/FCS0DGI69vSMFcXTffj9yQ9kWcqUfV79NKNnv4D1QZXVkwLtM3dbE227/?=
 =?us-ascii?Q?8mwgjS+TQRGaf5MG5pg27zQLDChj9iaVUgRTBGH6KkATwxUK9Exf29s8UQy7?=
 =?us-ascii?Q?NQbX0JT0V1yigMHEshrnoLJM22ENA9hERmz/09DEA8Bn3jSoJ2DiQTVWnC7F?=
 =?us-ascii?Q?e9vZXv1wqXYn+c6RR1Z9FCW3yOGs1Thgmd8uR28njlV84AhjcvkRcv/l1P0r?=
 =?us-ascii?Q?gfuAj2Mbc2Z6DEW86R4oqmCCa2mFhisy6dlhnJHomz5wn4ZGl2TJEc7T01hd?=
 =?us-ascii?Q?1Hpr1wCf00kPk4tPbgpG+WQ8lbr1KoakMQxXcBe/9DTPsExzKamXBidEBgtE?=
 =?us-ascii?Q?oJVcrsxhcTYjbzyfAFKe6tB3EAz8yai78meHQCCTYUGJdfsoXUGcmguJQ6Yq?=
 =?us-ascii?Q?uPThi3If05+f7k9qrSm2t/7oORsyGAXsm+/rA+IfWKWWteNNaxZa2iE/xKJJ?=
 =?us-ascii?Q?EebaJjhbZy1FKwW95FBgfBiSMN2Fh7VywKlCTGgMP5aAA+0Ey9baQE5IWdxH?=
 =?us-ascii?Q?Yc6fuEjNFmevVCgyjOVPJlVKUMQ0EEYzPXItoSS1b66VWRXyQYzfVIZRUV1Y?=
 =?us-ascii?Q?NfP9YkJ3GBSThDrrnIk2VCy7ZCmqn/NN70ZZltm728O574t4vvy3/qAIEKF8?=
 =?us-ascii?Q?STsz3UYv4ge71+QwKC4q44NrJQVyJ11/7AKYaU49vSCtzoG99/I6KeIfxpOE?=
 =?us-ascii?Q?zLXUORmFfa7VG5MOZddWBVMaUTmC2LldI/n4bQaLpDI+qyXByTtifOXskkJh?=
 =?us-ascii?Q?pj3ccdaCu0cTpzb02h+Rscen4JlylL0m0SJ7yvqqU88ma1cp1FzZTGRis6GB?=
 =?us-ascii?Q?c/Vbg8jgbA2FfI5ZfZZNs0mJJahC/CJLPpreOLY7tt1uOrUu9NmFbOcJEPiM?=
 =?us-ascii?Q?2MZM1ok3Nul3r1KiRirLiw0rA8gh40EXsLcmGoupUCJrQL/DgIhr0ryJzELt?=
 =?us-ascii?Q?8KNBVebqK1pMks50XAidmljebbSW8PphNB/mW5z+/USRupIk2EGRQRbX6TjP?=
 =?us-ascii?Q?L6AqhOjEQap/A8p9pU+qVGN5kjwdFOVxyyOEqNpJCyFjj9kEDDaj5LZxN4qb?=
 =?us-ascii?Q?Bwu3PaDWwXcqcOnbiKPEBrxESfsoifNOeO8I+DgvSjoeeVu8SpRwxtFAnYvk?=
 =?us-ascii?Q?6mjvwXWax9Wn0j1VBmuqP0jXHfYIau6G8mf5fuA+WQ/noVzZuXG37JV/sWgy?=
 =?us-ascii?Q?T5jDqMeruKNR2fYzICdVEGaIcWH0yTRyvCD4ViUtut7edugMMJRSVN2j+Fp8?=
 =?us-ascii?Q?AUQZIGPi8bVL1j5VSeGO0PX4blmn5ciElGtyOoEuVZjvhsDwakIt+7mcfHzc?=
 =?us-ascii?Q?qTitHupc+2CjHwlBlAbDFuVAvvhU2mhE3e0XgVy8sBJLSBGoY/CD+DrL1ufJ?=
 =?us-ascii?Q?eFWmBrnJ/ZMx+eMqI/LwDAoo4dV4qJOGIAPLq8Ea6wuKaCwCuealVScpsY1D?=
 =?us-ascii?Q?GlwEjMYN4Un6tui+TmyqJ4sb1a55azDsozgxCgvYYSKHOn+Wc5toweP0kBOj?=
 =?us-ascii?Q?9aIkKPyqiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d441ab8-dfdc-400a-2188-08de7e4a6ac5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:01.9212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zo2feUyB9FrRvjKDDtTlorEn4l2wJtORT5mMfFZhqqXklqpYFw5cpz4wPXaGE9r4XqU88ogrsbW/EXAG5++sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

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
 drivers/gpu/nova-core/fsp.rs        | 107 +++++++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index d68a75a121f0..b5a0a2631ec7 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -152,7 +152,6 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
         let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
@@ -175,7 +174,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -207,7 +205,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 29707578d4d4..20c439fc7f7b 100644
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
 
@@ -159,7 +168,6 @@ struct NvdmPayloadCot {
 /// Complete FSP message structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-#[expect(dead_code)]
 struct FspMessage {
     mctp_header: u32,
     nvdm_header: u32,
@@ -172,7 +180,6 @@ unsafe impl AsBytes for FspMessage {}
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-#[expect(dead_code)]
 struct FspResponse {
     mctp_header: u32,
     nvdm_header: u32,
@@ -182,6 +189,19 @@ struct FspResponse {
 // SAFETY: FspResponse is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponse {}
 
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -275,4 +295,87 @@ pub(crate) fn extract_fmc_signatures(
 
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


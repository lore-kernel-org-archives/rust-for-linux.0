Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08E39E194;
	Thu, 26 Mar 2026 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489192; cv=fail; b=VaDqiP/iDaXH88/tKh/C2iB+vLxaDjMLi5sYZumREJH5pMTxUgRB5gxpBRdWFGS8Y84BJCDXdN4aVauM81Svq4T739RZ9EWh+iBS2WO1SQWSHQ0eT5TmK89fD06SYPZ98JsiTXPn7m3wQII4dG6abcAt+a3QSFbRig23EpS6jI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489192; c=relaxed/simple;
	bh=GKP5CIElx9YtoEe+FVe2WkC3hGBLNlbNhFwdxypp7b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YK2GSsIOBEghIoSE+Sfb3kjY2w+BFklfwSZwKootg27C75tSST8rIxkq5TFLV1Lwwtsd8evbguwycf/xJsqYMBlO4Wh8jif0RMG8kW4XfaKhTU86r152DQnpvuWQIvvMeTRacDprR7xc6xtuiMyPcsvL+1jeifeY5fitvsKUVZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D0vmWPhF; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D0vmWPhF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDFOjE2h3QwEd0wtKi67gkMQOMTWVzN/+VOjo6MuknAIRzwHsqiQBTstjU6eYkU6S3gp0YJ56b6ewI1A7KH9QZfWFPzZBkQ3TAMSbqIeQjMIJhdVFKvA+VMDCVEYL3vgTBytftNA7nRl4xrW9cwiICmj0duw4/QMb5YaM6E1a4+WJM8h6doYwdBKhoDhnMZiR9h8HPoObtH5CQPOeJ3av7h3PIQv5WD66l5mtUUgIrLjxofvN0FtTkTkxVzQ0OdsqSUmjbYxaV8RCUX1F+yfgLGxK0GgvbAHmI2XMBDW86Flq9PyDF1pGV9aKY1ILoGdXVbpEHZbbeFZ/qfPq6xPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eunnoss9mdnL9M0PkLk6TnEsS5Bnyon0iaiNvkQu4CE=;
 b=gwwiKeAlp/eqQwE+fSqv++4jY/bnrjNkMzBAqseE6wQuXyYFPWmlYU0LQ0SatmYwUV+Bk9iuWhseXAJ7mRaOBUiOJ5prkX0eXMkqcIKRb5YdaWT87n68EtubyXY9YQcoJ645CxRuK7NP/j6SqlCYYZEdxlFRtSyJVRjxzVyed0rtB9Uj1vIgoxELsmDuu3mVxZq4ON3YpSQQ0ojA45lbmIw+l4Q/XyYdXLdTqf+zZsxl1yugSHRWhjkbafEliceO0lg7HKT16w4/5ScCw5VFVPcawO15LWuBfmvnYVVIPS8MwIZrD0fpll+fse5m7kwBHpUeI7x+D5bgnQn8xLRYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eunnoss9mdnL9M0PkLk6TnEsS5Bnyon0iaiNvkQu4CE=;
 b=D0vmWPhFQV8noMjV0fRBjyScwHsp0WkkPUw9lEF+I9YFk8MKQSa6B3DwooT8JABLwTfS5bf8OJQRtKlbPMF9AV8FWljBguz8OyJYWaYaxtVir+itEoee1MIon3ocaSqRe6dvTHtpW1fAsS07L2vVx2Yyu10a5c9NyHBqKd5idymk+BM+I8Ikdq9spwI1nh/HgUj0WXH1bVimp9sGP5mzb0D8oFMOl+88gv4TdyRRzJl7YEdYBo+2ltEHkoCFM/NH3fcNwfIrT2yDtQn7yRuPY5tKKRF307dPnYQtgbyRmPlhKQqhdlhSqV9GnA7wOTkvm8Oke6mtQ5X0yRj7IH023Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:40 +0000
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
Subject: [PATCH v9 24/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Wed, 25 Mar 2026 18:38:55 -0700
Message-ID: <20260326013902.588242-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: afa14f94-1365-4b4e-49be-08de8ad88be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G8OxeYwzA1C3qsWSyMimXMj8zzP8NNET0x4xsq1WbNzCmJ+kif9JF6OhlaRFEozynPWwJLNsrYj7wapKZTZVWWefvlQFYeAcBfZrGSmtZ+utPvPSoUYd9xfF78aZZUIFMmddD5fxfpo1BwBsVD1gTyhOApIezU2YaqRDjMGJwI7F6CaWYuRpdrI+tp0ytCVfZQaNX4d4abuQ1UU62MBSIk6NusIUNgmTj8WzYSBSSCrbQpbNuOFSUX2ELZeYm+KuIQmgm+OWohKIlMoryXvNNej+bvoHKriueERGv9meBQO8Q0jSUGXLvlbgphuIXA1WSVIyM9rSRHDqDkhmgBANu1ygJz2jr/NObtFc+G7ikLl6FAwOyiP/m2o3rKiWuUEto4EffAFQaW2334ZzM5zR+c5LU5TUmHpvjxlwrt3oSQBjUG+CwYgmJibDkU2qvvfXvVGEcP1gBEk3To5Q9jcQKwNNDgQhRf3om4/ScZBqKB3t/nty4q22l0opEt1LE4Sw9erYIwROvJBXt+W0sEuD2AGW+4hWWNfOlPz+ShMzdK54+sYDJ2hhbGFaWfOBsSndMK5vOGPqpvtEc+/R73s0pC+FbIkB6IyDjGTJSYNKM3CixixVt+eI46YGWHrrvJofwRGhnqJSKUgmu+O7pcqjeBkuBOf2Ipo1wErqjhGTzQilUUTFFNedJ9Yq2GiviJGFeY9lsZJxBiE9HvoLe7bnW/BMWYci4kMjw6ZVj4cf+kM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?itMh/sQBMgSXhiB/ZQgHw1xTPRz7TFfrzKebPDqrep7Ht489fNmil8HR46Vn?=
 =?us-ascii?Q?TgygNrje2pJb3VrjNK6gy+MVs0/1dZZfsKYDDNkcJ8nQC/Y1XAWfcMVPCrrj?=
 =?us-ascii?Q?jc+4gRgj+TyhhED03ZuAT7jCAvSaMS7jjl/XhUC+bGZUgpHA7BPYYQGGO3Rc?=
 =?us-ascii?Q?YAeJ5qTXHuViLsM9wISf1SU/hWLAEKsLYs7/pXqCOV65SSzinydNemEzd/l7?=
 =?us-ascii?Q?11nduTstHhKgsbMaiR1GKeVms1L7rjrNdPQHfewJ369QowF4F79CABkz36P3?=
 =?us-ascii?Q?2B/SJrNKkZwEjl15kRqqid8RKrzbOR3V/f/cWRkQRfl0XJjWxAOcQpCohxtq?=
 =?us-ascii?Q?GuNYJvjZ6cOKwWDwIV6DfXaZtcReIBQv33VZSRaOLJKaD8mSTUMHlKJXVL1y?=
 =?us-ascii?Q?ha3mtj/pZvVidnnjtG945l39s6lBKRBZGDZ/DqALKWCLgxLn7vf7dDSeaCNH?=
 =?us-ascii?Q?zas9exA5OPNigQj9wS7djxP64dj2gpwrIibsSJ6VsUKF4fF4mk9OwzX/lFWK?=
 =?us-ascii?Q?Ow73jdt3GIQG6TLRlFNjfOMOUS972pX6CZKCNIn3pRj9AbZbSuZFI3awVaoQ?=
 =?us-ascii?Q?zgvqmsURdgRD4kBdy2Mw+ss1QIweMde3BxhLk8wy1k+FOHwi99c7lmwq4OtK?=
 =?us-ascii?Q?q5LkW7eDPThTYkaxkE2Jnxjh/GGI+ffBnVauBuuLiOWfFt2eK+cNEyXSs5RR?=
 =?us-ascii?Q?9Mf+cFFqt4/n4DB2kAQ50Uq74LBJlFy3RKkT2HIcDp1Dq58Uq1z4ilvv33OC?=
 =?us-ascii?Q?NvVL6xs9oT4quEIWEsqGy1Ed3PyX6kIXWI5t42a1LYNoHdRByHJNDraOoTps?=
 =?us-ascii?Q?9+ZQpoj0wkPKiyV1g5P1VSPNyMtlPMotZNzaSCYj1wrjsH/RlK2iORRbJaBK?=
 =?us-ascii?Q?V0sqjsbt54e+cnUfCOlkP+ReEvxeHDAtMTQ4UafcI+THfqr/oamFjnnqvosx?=
 =?us-ascii?Q?IAPYqLEnxxpRJn1BriIO+SMg0i6Nv/A86/styoNI7MGIwym6GQM0s76lslW9?=
 =?us-ascii?Q?O4eWSnBSWRSROzB4sS0oQJoTeF5rKHTfBAaFf3w67cZhUf/vQFPBYb7yE7jD?=
 =?us-ascii?Q?CEBQ1pKxDaQW86i7cj8Gnpqr1GMIwSSkaLDzkOLg/gLy6u+4KZRI00P5Jj+k?=
 =?us-ascii?Q?H0oxxdb1KP+5MSU9x6pTOsoFBD3wnQceKYX2cQiPdn66jxPaFLPpHu1B3Jd6?=
 =?us-ascii?Q?nwNny/7N0yThS/y72rIy+xmQOxxTdslh/O+FOUmvq8t0ByF4FCYf7OofWcmU?=
 =?us-ascii?Q?XkGJ3BJ+lO4AFtTz40JumQPOktQe2H5n4yJVUVD2TVkhZdZOwJwmqdnUGYEq?=
 =?us-ascii?Q?3l93V8q7EbVtkmrbyKQUP+IiMWHdwnL3N2DfkKH3Aqlw3XC+ku9rd6t0Xv7u?=
 =?us-ascii?Q?+uB6ChtQIrDXLp13wvYQA4gQNYdR6DlKtlgMdokeqmQvdt9G4AdZO3gPBeYA?=
 =?us-ascii?Q?XI19MoEmq6d1uALLLHcwAHIlSJqXjlqtfhPcP06sWkmqN9VcMOWlUlFWVm96?=
 =?us-ascii?Q?gr1uQ/a/w4tnBbQMtq9nrZpAZtEDJMmAeRxe9ncf2G7eCUAemNE0iOY97nb3?=
 =?us-ascii?Q?iknHlM8y9NAaUE6fXBrikQM59ypCpFlMBWiQRBIgXU7BKo8atefqZIxP6orf?=
 =?us-ascii?Q?+jXjOiIhJdksUJfouAvFoFMsaPqsgelIRYdsY3c8K8Cn17/XEIoqRgJurVOu?=
 =?us-ascii?Q?nnmcP4sHlHs0OunFP4fkr7bhrVTLi3jMOiuKMHMQfBRwItMITi5rxwTVm82e?=
 =?us-ascii?Q?SSqEwuKWTg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa14f94-1365-4b4e-49be-08de8ad88be5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:39.9278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ18USi3HYQqeoWv02sDKbH+vV/YLRdQWz3gcs9caLjkUB2DQAovGOEsoZBY+P5t74Kf3KURcZkvl0yD0daYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
reads at boot time. The FspFirmware struct fields become pub(crate) and
fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
extraction.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |   8 +-
 drivers/gpu/nova-core/fsp.rs          | 170 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs          |   1 -
 drivers/gpu/nova-core/mctp.rs         |   7 --
 4 files changed, 172 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 028f651553e0..5bd15b644825 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,16 +14,16 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    fmc_image: DmaObject,
-    /// Full FMC ELF (for signature extraction.
+    pub(crate) fmc_image: DmaObject,
+    /// Full FMC ELF for signature extraction.
     pub(crate) fmc_elf: Firmware,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index db07fc227aa1..6edbc4fe7066 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,8 +8,20 @@
 
 use kernel::{
     device,
+    dma::{
+        Coherent,
+        CoherentBox, //
+    },
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{
+        SZ_1M,
+        SZ_2M, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -38,7 +50,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Return the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -163,6 +174,35 @@ struct NvdmPayloadCommandResponse {
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
@@ -183,6 +223,74 @@ pub(crate) trait MessageToFsp: AsBytes {
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
+    fmc_boot_params: Coherent<GspFmcBootParams>,
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
+        let mut fmc_boot_params = CoherentBox::<GspFmcBootParams>::zeroed(dev, GFP_KERNEL)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        fmc_boot_params.boot_gsp_rm_params = GspAcrBootGspRmParams {
+            target: GSP_DMA_TARGET_COHERENT_SYSTEM,
+            gsp_rm_desc_size: wpr_meta_size,
+            gsp_rm_desc_offset: wpr_meta_addr,
+            b_is_gsp_rm_boot: 1,
+            ..Default::default()
+        };
+
+        fmc_boot_params.gsp_rm_params = GspRmParams {
+            target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+            boot_args_offset: libos_addr,
+        };
+
+        let fmc_boot_params: Coherent<GspFmcBootParams> = fmc_boot_params.into();
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
 
@@ -284,8 +392,66 @@ pub(crate) fn extract_fmc_signatures(
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
index ab378c0297c7..780a4d1169e2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -138,7 +138,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
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


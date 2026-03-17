Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D43F99F8;
	Tue, 17 Mar 2026 22:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788067; cv=fail; b=gLmDdb+E0vz/W2rDLdjXhdsF7mLnZFZa+gkhlrUH4MSxjnxTPKQKgzVqqA/N5zFmZHyRagiYlv/cPkYi779NC+Vji5AStEKL4Uh/eSZ4L/h1Mh9tKjF1FOjcoO2slVFvS2hyfyu3JzOdjqYogPABk+9HkHfjUqKAsN8y5D8GfOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788067; c=relaxed/simple;
	bh=9mV5x2GnrJ7ORga2OIoIGcYUETCgOxP4brMI48nQXCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jorUzjOYzdptytAW8XGjeH3d7PQiGjJy3EON84xgFPs2O52obW9VbEH4pFCCCvBS0N1mPOQ0GKA09QeNTr/BowVGG9FCJwI7ouZAGIgECKXzNws+EPfVLwaBxMjOgECNRqI9dERuNySnO6/t39xUQC5wRgKZznS4IK0HTkETHtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RtRc7bo2; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RtRc7bo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5XJCghJN5gXi75mznltCUWS2vVIf/vD13lAoVuCKS16RjZui6ggrAjDxwqTVeHsPURInWPDyCVPfRd75hRYZAmzUjzz3Dm77pzQkF7xErwT/XqkgJYnXYCbJDic3r0+owOk8eTGIi+7Jpuy8k0rFiUpOvhtL0YkGFJ5CbeUg04qWMAvkQ6QVAuSxMeALDMLFLyAJfnnoqivPLN08uQkk9ZhOrrG4KNBl3NSTTC7ucgULfMfpIH/T7HpxyPjLIVSmTDwvsMFYsjUdxId7kq4vmylabp2pOdF4QUckYhveIoqgJDDCBrw/i4kqI9N8OKBTESigrFetkEoI+K6nGGqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJwlCCyjjYZDdMLvpds2OrxnnD+XMxN4RnwtN2pNyjs=;
 b=lQrtM3hngnujHsdayaIFaeIbEHCQofo2g0ZHmfNsAVwNfP0sKVCjN99K7wvKqKZ8rAMOTngWV5Q78MuZh8pqtN8lLwcJtwWPxECFpDDxJueocttCPB3tmuXR7QxG8sDRQX1+qxHhD8L9DVsnnnuLSbQNCOjrWFhj5oSAwmKlfu3i4Nube81JfSV27TRHu9B8JmH18k+F+K1fAWcRO0XitRXWX/Kwlt8ujPQ+3aGFvKh/tp2miR1KojPcJ5LIYpb98gdZAl7Kjd5JFD6DzS6eDmeuwjukyudvVzDy0oDrzAgzkchuUIcUIR1+j/dnbbC5Cc6oaGr3eRrQUxS9aCPfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJwlCCyjjYZDdMLvpds2OrxnnD+XMxN4RnwtN2pNyjs=;
 b=RtRc7bo2pQSnMw+EPcKJHx9gRxZuUW30Z6xf5CLRWVwIjRqGG48Nodp22ZwfakmM+/sgVXha74sz24bgslNHmq+oYDsm4hb3j9IQS+81/zROZBYmUsV9uxO753D9hvzhsFvIr58UhjA/sroUT1dpVbB6fIy+z274Z6MK9cXBpgTXLQUBiADcM8SbyUDkSlYZrBY67h/jeKi+SvsquGyhJeioo0dYlpiuYHx9SIvvWBnPX1iSMSELXHFLjvQfwJR6IOZ7B8skddcRgJ5nJzIidrbuQXihQxvJt0AWOcBkIMyykZOWWzfCB7rodYmT1HT6o5Gre2vwl/tV8f5sRnJ9ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:14 +0000
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
Subject: [PATCH v7 12/31] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Tue, 17 Mar 2026 15:53:36 -0700
Message-ID: <20260317225355.549853-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b2ac89-b5f3-4d56-9947-08de84781c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FdPvCJO9frw/LFUkYWg2MUPAUnwSwj3LFCbG0hybMEH4KOvOgXvS392RJYYAeNdTTcQJ48OYS5/4kJkwwqnoDkav2nr1BcEiN7p707b+K5m4DevBBz2P06/+r9RrMb/rd9xDv/sBeJPryFJSx6xkWSRYFoPAwkOBshiBwdTXadZhip0Nnb7r5R25q+W0cvOjSMoPvwyatWpgUEa/LbiT6hOGHXgVRjAFVpQ8ggjkwcZOnSGx+V9+wqXBNxbmam0x1a2w8NaOo7n5t1q7ILrKuXxEMiybyFv3wkbBVMAJD6FDRnrX301NDAPGqPz+19xUbSHJZ98KDikxRvhD0hfVWebNP8R/ew0QRWL2BRMrINoiOiUoXZMz8wdH1RrctAbabNUvpuwuiekN4y+hoIwXX9jcGj7vEJkvlLyTPNppdatyDic3dAKqhJWrqrkNZueUTApg6ciAjPHFJ9n+0aJcBj9Y7DKaPq0u5uRWCmNVPbBinw7TuH96wpHVdP/0y+P7uyxV2eqKjtZjQO1LOHoMNrpQepgtqhv8fH6LXc/YiM0WXoNELck416jOlNwp0ljMe6boLPMMqIBL/NgweN5QejxbvdHAsCcrqNOsmUl26tRNbgqhXN2T8CjZS3Q8zgoAsVmaCWd23kVUpU0GMwFDd2DFjYFZWXt8B60imuZ6SiMn+YlIrVFPLAYaickEp8EnazH8FsNWwPJlGrIlO9UpZTIoLkjS0TPrc5Jvzb2Zrgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qfOitgzUnLBqALDp9wg6rLG7LqJu9X3Hzu/ZZ+S3+5NkveRslE3Db/1+UvkS?=
 =?us-ascii?Q?IdYK3acOBSBthN1XBunYG986aGUtw00Irvh4vyXVoYIfFnSYQb5mLg7fFq1M?=
 =?us-ascii?Q?wJtg6mobxAMCMdkLa8Lv3tQ56zvOJiP+JZ3lU+E6n2L0s/Hrn2AhRw60+gF5?=
 =?us-ascii?Q?mu6BMtrjWrbmRfsQoANoFMHC+LIVDPmjj0xsuMbKyGpzt4zSFGtFSJOGcEHz?=
 =?us-ascii?Q?shcpxfVvw0N5JdYVTQyQOuw/RSCpULCuDfSQCwGhNeP6TV9W8IzKrlWC+Ho1?=
 =?us-ascii?Q?ikRLmvXtabuJoXrnfez79SO2guGppoRm7XqgnaTb1PupJ+FF7cdrUaVAfJLp?=
 =?us-ascii?Q?AZWD8ImxY0fOOre9j7b6kKm3vv4tVw91GNRya6wgDOFL6vtMFUAWtJovWr08?=
 =?us-ascii?Q?oom+A456/sDndOnfg25Qf2pdCDgwEnB77F//1cvfQ2YqBmf2zXPi7T/SNHND?=
 =?us-ascii?Q?5PQcxhCK+rKOu/MyfxolVEDYocwGZX/28IqRmYwVBbcdPGwpvI9K7T/WVmXJ?=
 =?us-ascii?Q?F3IIhsnFAWs9yJA3zpUqO7lFuH0knjZcDC17YdCV6tarvrOPPdIafNB/DpF8?=
 =?us-ascii?Q?3TvsXxqF5sRu+kKtLXgowBnPLIUZJFgtm+kIZYO8c8WQncmzbM2ijwtxAd1C?=
 =?us-ascii?Q?+fQj2gPiZBNwQ0234lQRWqaTXGFc7YlYaCahqjyerr8t8ODzI2XDJnJOwCr6?=
 =?us-ascii?Q?0cvM6bguHsUU6suU0HimpTw0UGv1idVJWBrDBMmIV2Ive9Zh8ZCorgP4Ruxm?=
 =?us-ascii?Q?4z+eBFRgzXW+TW/GjgKSlQCK2MLEtSeUDAIQBowVNt8YYJqNP0ro1PFk1Uqo?=
 =?us-ascii?Q?cbXCU1WEwm72OY2kxiPLXXM/xoI3XdJ2M0gYU3Kk2Hq5yjPmCVTfapLAzh4N?=
 =?us-ascii?Q?fAfVb+X2IjaNkzchYvLXoX4KFOekt/JUq+LEA28L3GVWlOV6C0W1fgBxQa4b?=
 =?us-ascii?Q?IdCpWde+8177//Pkr1DvDWP4+pApA5ptJO2+hHg/c1kAup62XAiy5RaItWgL?=
 =?us-ascii?Q?N0ae1QZLN6/9pgMkmvPsOOkNjn33eVMbDX9KLa2aJxXsZlHWIFadDx6EXIlx?=
 =?us-ascii?Q?gQMJnZFB2ZYmKpUJgV/Pbu6TvBHDYPsXL8yYrhBJlVkOCzlSKxbn0xwtMLs6?=
 =?us-ascii?Q?BdG978rJGpQcNP53F8uMbUBpSFVC8S1R+6FCd85qzWZiDVzhoxxzwbbkbEAd?=
 =?us-ascii?Q?cz5obNDVBxsU7SuCVkuwaj9m3S6ojzkDW/abvI3pxXV+e7NZELbsacLYa2zL?=
 =?us-ascii?Q?rOlMnb4/uCnDUOmEBxoSr5fhwnUw52oE891zBHO+COurfl0/I6J4r2GbNU8V?=
 =?us-ascii?Q?tDcytQKc9h7E28L1zeLx/KM/tO6mSumWtrac3p+GaJLHWW7XpkWPvoro0U86?=
 =?us-ascii?Q?BIMuM4PPgP6BJhhOImocYDrL2c5kmXCv3Yh2A/RkSZSmhXL6Dr5eucMZe4Bf?=
 =?us-ascii?Q?qxSZhr82jmU+FLfF2Z/tn8sfxUYQJd5ZeJoeMpLok5ovuBQH3fDjA6Kdu/nq?=
 =?us-ascii?Q?QDQu9v32C+YTMlDbwf9g9X/k8krwQiBe6dpA9NfvyHB2vcXSqrCkAwB5vhhV?=
 =?us-ascii?Q?ns0fCklwX1jisDRAkVn6EFjaE7S+KVyRjZwdCqA7IFgABv4qLr2blfwEX1QQ?=
 =?us-ascii?Q?DPQ2vPlMP2/+ZDMSGQEhP6oPyAAj9j296QkryvlSU8T0a3lo4/n7rVdNEHxz?=
 =?us-ascii?Q?wFMbQgNeDRnT2jI4+D6XxMK1WPgZBcUWtMaA2dE+ApANxHQ+S3H5GOPOnush?=
 =?us-ascii?Q?AGCkSNRzeg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b2ac89-b5f3-4d56-9947-08de84781c68
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:14.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTodpjxtvXBFSKfrk7fyBOpwbTeeJ33XlNH4NrU17AApI1WoXOlhe+kogf9qqwP3lrJ9RQ+X0NgvMeu2LUZyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
Load the FMC ELF in two forms: the image section that FSP boots from,
and a CPU-side copy of the full ELF for later signature extraction
during Chain of Trust verification.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 47 +++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index bc217bfc225f..bc26807116e4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..5aedee8e6d41
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    alloc::KVec,
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the "image" ELF section).
+    fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction).
+    pub(crate) fmc_full: KVec<u8>,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
+        // FSP expects only the "image" section, not the entire ELF file.
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full,
+        })
+    }
+}
-- 
2.53.0


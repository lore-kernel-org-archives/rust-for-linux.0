Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04A72DEA9B;
	Wed, 25 Mar 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410788; cv=fail; b=Ha5jmLYk4PlT6slGe4SywJcHEjXMAbds4YoZcg94yJf7JIVeR3iTlr6JNsPZbO76vMRou3XwWtGJUul7yU2cQkRb3ghrJ5BBa1FyTaiUfbSMeP/fjMP+xCmhHrHdUwjyHjja88/Z0SQtmXae+AZd6ZWiePm0IqmSBjflQu+eNpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410788; c=relaxed/simple;
	bh=9mV5x2GnrJ7ORga2OIoIGcYUETCgOxP4brMI48nQXCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDk6Ywj04a6lIgpa8A3t2DmOY0dcWzhWGS5jrkmi99kScodkpwX9z2F+4ARlKgsEjbBYDNpDCHewh4nmW5Q4nVvgZU68SximsAHEO5ZEaH2cVex/1IvgsPLcNSl32c1NryjS90Q6lFBOetjmNUZQpO4TSG433jPRhLzVsRDcWDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LjDdwYkc; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LjDdwYkc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJEwhXdSglJ9k/3mWV8K2QolqdpFSQoSrW+SuUotaMDtuvk2ivxVYcD/+7CcByiC11vMgOqO8Ycm0z7Oe+cQHQZbiId5bXn9Xz5sL4vjWN8Qhnotg41nPIhhvBlwuioGoSP65e7dWk5DMcAJ0VE+m3kvCAjmJX84GP8DF6iJDmi/d+vnZxmy9eXlOKEs8EZr36Dpps3uU9BnLLYtz/bbl+0WTBzyQbx5tIC9vmwOC3+fEUnZXgTjIZAJMy1Wa+kNwsKbKTGocFT1/jkPLLhqTLNrGCPzsorMDZsgUTDwqaOMCMBcbXzdW6h3BC4PZE45b5kM/tZbIbdMHoDJgcbUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJwlCCyjjYZDdMLvpds2OrxnnD+XMxN4RnwtN2pNyjs=;
 b=wdzNEZzPt/SMJJ3Ze93XoIRqV7qOElHO5OghP2qGc/A4UOXAFE6LOMBmiFDKCHE860WJOS+0tDtFB3aKULn0jEJ5YWHUCnvnC2vj12sU5JyVWhfDtgUuq7SAMyaws4BcXQRa+SHJ9v1PyWDEhz3k4jGNR7I59JouVGzEBImRt5bFNyBgklR2rIsRgDMcCOcuOme3Tp2eInavSpDkhwc89oLkdP/J5qmZgPrhxCGBD8PzxebLmyPCf6v0bW1fiyAlHpGuUFark54nSKEKo6kF1eUgEgMkYNzaYFa8eDduSABlPxbtT6wTafITK0nY2Ij+YfAmU1r7wUyiUYruHnKwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJwlCCyjjYZDdMLvpds2OrxnnD+XMxN4RnwtN2pNyjs=;
 b=LjDdwYkcgmksbM+r/dDob7B5lxyrmtytze5vhmrsRRe/PzL2oe1zhHFZ+24x/1Wex3NoNsysFAu40XA5wa8k5zrfrrD4T6bUtky0d8WgKCrNgtpq6qMBbfGUyvbp5hc7se4Qg81uszecp/c+aas9CZa6eDiMER0xCtPkEj8V/1AZnm2yOewWiqap0ccBawBW+T66SyP8x4U+LJ1f8C+xNGNGQFqWHu1nzUzMebpC2591Hlq2OcCVoWVkvUWSizleeoZu/o3WE0jMM9sAR3A95x4WCZER8g73L5eeYjwqpgPoa6ZMupbF0ZOgbNIH/H/tlb/x/9zKaWPG3nZXMy/SIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:00 +0000
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
Subject: [PATCH v8 12/31] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Tue, 24 Mar 2026 20:52:23 -0700
Message-ID: <20260325035242.368661-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abcd186-dd3f-47fc-fe83-08de8a2201f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AnxyAb9sGza7zP6gVs08ukygRWEizCHF0LRl075rWRUd3JkgfEoXSYj7GnRQCqil8/XylLKK1htQnLsQrQiMqTnv8iLoVx6O98g87qhucxP+y3yqhhjUpDar88jNopvYIscAH2NZ6zVxfmMg1yjH0MjQGEJF7oUcxDHpaOG1UZd8uX63BrmPA/WseT4iW1gh/w2v0V8ZzMqrkKMapbHWgTrcWxtoLW21cYBm2Q6YoACcdAT1mKODeSs5lYX895bX9Baqb5/aTjr2xEwbFGCQLGhO2BKNajKRxhiAJ1vrf2zC58MENyBKuPrrpA3OpY7LGptgYmWOFdNrC4xzTqqm7OU9xCFpVi9cC/gmnCfgeNfaPJp3N+1uFLP0yEXEXpOORe9N7H9JdKGMNtBN3mqu12iPB5v5jysy+/iKhyp5JrcTmVxjYbeUaZX8Ivx4LhDYSJY+jD/GlR8zpb/8YNdC1SLYtbONh789TQIkvk2niCMhwk5h+UPh0KOZWBPBno0ZF6iFtKdquFOeUPoZwzZQfg6e3cRO4Ug8pP2oX4F6KdN+5tTaYmgQ7ZeHhxnGPvxKvii0OhpOz9DQHBH/W6MtqK1rYnEc8HiLmuGu4mPf/GLAMuJBdxTwg6YdQijeKY2bBE3Upjss8f0ggUp2o+85STX+zvRbAo1Vg3KtgncFvl69WsNOW137fDXxm/u8OuWrms+1yzhmYtXH2IW/gXBeDF//Bn8XSkYjKhRhnacLwFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d4VqEiCt8HlOmL0kiMLII/hAm78X6AwBMenhdeuN2daWRO0Pq5KLjuBX17gz?=
 =?us-ascii?Q?/XIvsPPZKDg2wn5baLgb8HqOaLyChodPVGh5GUJ68ozjmFUvGWWFUgKz+Q4i?=
 =?us-ascii?Q?KYN8u9NNz6QK+3WCadIpTIwiE998ndKmtVgZ54pcddi3ZTwtjLr5untdDmZU?=
 =?us-ascii?Q?sDQZpujuVZu9FUXIURAhqOJy+mowQEtc/2OFehPtgvMFHdCOJ7ZTrfZyWT8w?=
 =?us-ascii?Q?iIKiRH7deTFAG+9m/2iIHKmZ5+Aw4JoV4C3Ole3lQqfvZo4BMWTK/PCSTAux?=
 =?us-ascii?Q?KRvJ+9A5yjsgZKAXxw5MBdfNcCpQbGMT4GjO0KjifjtIYqu9VOfb1wxKvOGp?=
 =?us-ascii?Q?T1hzp8/ofTnJFlcy2Jof5Iy1IFwZbrm+ZqKsZaVt4een2p34eLPIsvEv/8vD?=
 =?us-ascii?Q?OkftTvfDbrRUstfmGXEOUa3xzXvwtaBPq7KWO/ILrvg8s38AUxhgjpwMmtg9?=
 =?us-ascii?Q?AaUG0lVEsgREWGLWfzFZrbBhRzrGqww3o2pysCl5xMiaCQlqPHh/o/c9ijr1?=
 =?us-ascii?Q?byiYrPrFJ2ksif6gbt29i4Xuxj3lrrMM5THBbcaY+XJ8QdAJZoseAaazDWOo?=
 =?us-ascii?Q?XLZAcecbLAWdANEYOgbhYsIEypWza2pdiZiezkPMUuknMPhOlfmDyD78aR49?=
 =?us-ascii?Q?mtfAGYnriuYpVxY3mXe+R7EnKwY4yG2FQDbQdq22k1Xo23Fz9q25KEvRXSEu?=
 =?us-ascii?Q?aGN4zPjE+OSV9eg+tow/PUHho8GrWDru2lUhmBzrrMBzzedI+S1OWZBzQeqg?=
 =?us-ascii?Q?DPTXwVb7Ot3XGiUxi0idXPb2x5B08QGnY69P30PbgbWgbTNiDs6xrGITkIat?=
 =?us-ascii?Q?0cvgUF4iRJrMSigKOpuATykVrDPHtCyowoZGoLiYByJ4fPscTGYSa/DIVxBk?=
 =?us-ascii?Q?3xxuhEkDp0gUvosdCO2qtK090cnsHX8ktMdCiKF6KEH+VrmLeB0glA4mOhQZ?=
 =?us-ascii?Q?Jgsf3VnPIOJbE+5G39L8Bxi6QSfqimzzZLNJeq+k/gLz4c9zXGREIiL6tEBf?=
 =?us-ascii?Q?z5kIN9g+hkmPhkEJHiwHf16D+g+zbI+KaotHHXx+z0QcmGrG296bd6zrbhMD?=
 =?us-ascii?Q?2ySdRh5aHqu+Fpq6EoJ/Tf6bWvpWEen/uek4B0fxDs7shQ12zArx6v1z8C3i?=
 =?us-ascii?Q?foeWwLr9CqLAujxla8K16sXXLRemLLhOrp1sJDK/A9AgwzxTG/8Ke2qYw7mA?=
 =?us-ascii?Q?ZOpnq/4xeCLj52vLqchE7UNnb4fLtCsRQpDfDX+ZhKRnz0ReNo7igsAlRb0H?=
 =?us-ascii?Q?XngTSUXC5zEBrUu/9ylJtjvzs+p3RuvoNVMGiw7ngVlU7gla+bEmxjCWIxgm?=
 =?us-ascii?Q?vdlDuTcA8+e+qD6hevgyrUgASWCwkjg6i10ZSe/f1TUdjXi/P4quZ1eQDiqB?=
 =?us-ascii?Q?AE2H5AL8gORhGTccRnA/FzAA0R/Xgtwtj2DEue7LnqPcuj3u0SIs2R0w6wZZ?=
 =?us-ascii?Q?s9BUclEqLrB6Wyc026kww7uer9MvjrYyQrtnDhiushEWSYvjcuyDVN4+8qM6?=
 =?us-ascii?Q?aiB2uUtHRSt+aATNllLJfDAmGFl9nCsDgXHJEXG5hzO3KRUfbTta1p1mEqv0?=
 =?us-ascii?Q?1nHYdvadfNhULLck6CM4AmWllpaTyvBs+Qm1lY+0uixT5t7CVzASdpG4o9sQ?=
 =?us-ascii?Q?F7Ca3C8Wj0GyAPeTu0tRfZs8g1oLVpxk2teQxil0iRIq3QoppdcsmGoZuZXL?=
 =?us-ascii?Q?FjAvvSQxLbPi1vECk7DZNjUmm/ep49rFU660IGHTmWuJopI7e8j2Yibxy2vw?=
 =?us-ascii?Q?ocejbiXdtA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abcd186-dd3f-47fc-fe83-08de8a2201f1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:00.0988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXAYMYXWR5ceG0pwSRP8xgmVc5qMGnuq3/REpmjQZZ0680MBnDP4313Jc8i/mtlZNOW2ygZAYLX4MbHMShq5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

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


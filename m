Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6AF3B5850;
	Tue, 10 Mar 2026 02:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108733; cv=fail; b=L6QyZOIWm32oXX86ZVZ1oBOqni3N7AkWSWOVtJs9QUtJvo3YLzVDaDGewDJDb6V3n0tcMDfmSm1joaRodXo8o4QM52L74+tJMdv+hQxjPFrJG1q0ro5ORjtBi+Xvw8I8VYtSFiOyuIdHnofefLIj31Q6xlGq4tJwUdDEdpPTKYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108733; c=relaxed/simple;
	bh=iIoYiX6PNleKare0TlKKtj+s36KX7Dj/xcIBnJQPp+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fvETrxK7sP59M2BZtI5NkmPiGQJES+vzSyhILkOg37MN1prSNFUVMtYdSqOzA8FNEUtak+67bRoF1zI7XiU1ZI/4NVs/oHLKniwXg5rx5h15MHRknLItzpBeGVkLoGYmKDC8AJjWuV3CwNofWgoLcYKye2SgJUpb/6O5LVhS1jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Foi0ZKOy; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Foi0ZKOy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgdRr8FbciZe2wEa+aa5brMYn4licYk+1IhPwjijPmxj9Kfpz5hh850O8IPBT6ThNETHKnTE11Ypa13mQeCOukK/DoCqNR6wM8t//4bYGOxZgvkOoWw/yps33S+F2F2M4DCxPydRIgD/OWJO6OPZ0MCpya2146jcuectWlJOXJrIAA4Yyut/j5aeSmSVpG7tsGLhzBTtEivS7QAllDvtoGOfJGEP+tlBJCPJa5pkMUzS8R6UHko119hVMUKbEOYpy+txv+nU4RegUpQUV+cltM95STA+08wrUZn67SttP1qub6qefTObHCdZQcLnIhjnbCgoiHfqZRtF3cjBRbjoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYj6yNluGHMCpNS2Ein3Yo709yEgQWKqxtNdH5t/eBs=;
 b=VFjSRbJcKaf0HuLKihqeYYzRBTY0B2FoPcHmGqBIlfCprbmfi3njYyVqKUpcYykZWAVE2BUt8vg0GkfTbt3p7vGcbmGmK5Koi2d6693kiCmf+mONnuppQAoVvEKM8WwT6HqJ5V9LmWeHmU0v2oEsscbL7POproXJ2rOEyggoUXAPDcii3o2yPjU1OoAUqIyEi+7LZO9eArrPW2Wjdevx3YCvs2LJ+B1UPGdCcNEG/SmrPYj1+Trg0lul5fwJN+zRbkDd7yQnznlQ9eCMOJRhUaQN9omnTVTvIgjbSjOEkeTXKW21tvWMbRSnUJj5f39cqmTDmRSj+jPvXOOdytLKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYj6yNluGHMCpNS2Ein3Yo709yEgQWKqxtNdH5t/eBs=;
 b=Foi0ZKOyF5dkfoZqb2U3f2+5gbOjP86TrQOzcCpo36iTetgZsS+eX3Rq+gHdwYuvzc1R+C0yakzrm6pO2HpSwNP5l6niUF90xbrhUIRIm1eNBfeDJYWzT6a/leVqEbjm4s4XzDcs8TTbayKJqd2iDVCOv6pMrzQrJ4ast0UA6JqkRszRQaGeZ5cvS7dveB+wcv68Mp1WsLKXcTjJb+gQiOlZv+8Ic5i7eIy3Tu1DGulXd+DxRQwRc3AV1fzrvqSFCB1lkwA+ZipYgSVAjcceJsyO5qb0AUS3kluZPzlkGT+vC3eYWtvvKfFENepvjqaSytD1Xz8cR+nnSw66wRuPaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:01 +0000
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
Subject: [PATCH v6 24/34] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Mon,  9 Mar 2026 19:11:14 -0700
Message-ID: <20260310021125.117855-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: a5508d00-bc0c-4223-92fb-08de7e4a69f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7142099003;
X-Microsoft-Antispam-Message-Info:
	I39I+A7zhrkJPBB6pfAPLt35qvZfCPa8HH2RdrRHR9DCP7mvjarxKj7QDt+SO42S+hueyTWEFqGYJ5x3RijOCoF1mAtn/6/xhYOwbuoI+jmEUSn2uNu5tDvc3Wfjnbzaj13NqVne0bEP4uGHnRxZY3KBgHR4qqdBgnNEHds9ox8oPyxZ2204WVDd2Ns5Lfkt2j2mB1a8xUU0NqnCkpLUrxBOtxf3JX75yRCBpZMzaI0GKfJey/ByCmGFAqtra341udCyZfTPuLaYx2BAdx75/Wa54q8imDpSx22bdz/yk1NETRRpNUM4ydrj8kHrwLtEqQwOImsbIMit+iJff7Pk9LjdymBAwao5l2g0lgGZF/JQbVuT+UiZnuLJCSlD2gZg3bBvkKcXapnb46BUxLX1VwrINS0XaAG3kpDDlJlRV25cqqcedZjYAbJhXtnw56tQSmhW0v8jU3DSCqJC6GvlZidcsBy79zLTiAeXgA+0c2BGsRDGGpVen8i2SL+B1GE7gZ48Vep1Bat3qhNy4KC1aR+2Gg/QWnFZrfDiXwpuB96tSMUYUJUOVYmXxCCi7JiDLuvycEpQEB/OhMPJ/nj57gMnwVFH/jqr8GZlMYOjt3G7sSHCZNLSqSNHXE4gtSqFgxc7VerfQQOVlCu5/z/kIPccXEyJaraCnEJ8r533PVtMSmjda0NkLiTAC4NPWfxaizwqgRxWGqcK+vvzrs2j6yRXhi27DI45L8YJJnYLjkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qqkg/hn7lvxnXHFvICqD8AW4EWwAn8rbEGca9j8LU3uL5ge54m4s39APturw?=
 =?us-ascii?Q?royk+6GInfWo0TGlVfuGnCIB9MF1MkW+V3l3MDXRMvUJ03ZjnOA0rAUy1sRD?=
 =?us-ascii?Q?1ro6mhugU5alvs2G9sc1J/7zXphMsM+yD6HdIg6Pqq4rlKj9WTeBQe3rA+sb?=
 =?us-ascii?Q?TjCML9h82E3AiY4Oo6/gouLe2DqvTfWJvwB+YXtapa2pIsUAED49mm+LK6Bh?=
 =?us-ascii?Q?iWuykqKYnz0ZHyn4m6ef/d92ezN1ccZpjGnlqfKQHUQ2ooqaVqu/4PKhaAop?=
 =?us-ascii?Q?8kLatcJ9FG9iUdedWPyi3AVZyO1ytnfR+p5fzbjZrTpAZ0N/klwuKHn1rBrA?=
 =?us-ascii?Q?p0VkBatU+925CN4xc6S0LI2+gXhv7Ygw8JBZ/yFt3T5SqrTmdRI5q+pa0KhT?=
 =?us-ascii?Q?q5WtsR/A6Q5vExnY2+2fA6NuvKERwVCIoO6MdyVMvbhcmnHlvHtDRC284FF4?=
 =?us-ascii?Q?MmtH2weYyfhisyl84N5zq8L021WKjU2vKKQg5EOCpqNfVoDMygtmU62iNR7T?=
 =?us-ascii?Q?UiFCESVD4/GZs5jUPvhnJNxO96ztTZL1wAkEfHma8eqLR04uimqX3W6BHJj+?=
 =?us-ascii?Q?3j52Uez1CtKF7uiGBq/5Hw+muaelnI7Zru7CDqi94/ZXoMpHpoBcx4SCQ5LM?=
 =?us-ascii?Q?xyhM0DnTje1KckOmUUNVI79uajYdzYTr1niEdfIYq73EdsmN36AhS78afOHG?=
 =?us-ascii?Q?0bi1/7sQ0ke08r0pjhxaKI67F5Sn+N6/tdXGt/FZCbHB4jAUdNZDmkWApxW9?=
 =?us-ascii?Q?sj7oWde8LsgbB7qT8T3yV2ltFSutyx+r1fUYfeaDMeDr2fi0PHSeuD+LL/A9?=
 =?us-ascii?Q?TdOkqkryog/Y7CiR6yaJOYqiTF9OX3D/p0AP0jOtcmsj4eBWOyiD9PpH6DnF?=
 =?us-ascii?Q?lIAjbM7+LawVmx9X1gM3kUYNKUgboDECqsWQR626raCVFueW+ZdjpL7VlYOn?=
 =?us-ascii?Q?LU5foQ5GKQNvP1XrkwdOxFU+F5oKQ36yYdadMMaVWY77QvC3KyRq477ItXa7?=
 =?us-ascii?Q?Sdzf7R4w7ynZw3lyB7ufJJhS/d3/A7jtAlIYMyIM1WKD8lWbFFUEMWYzSnHn?=
 =?us-ascii?Q?KnJrVHXH0L7XdbP4nGEtukeD4DgclxejB4Ky1c/tQHF6R9mfjNVexa4sbqkk?=
 =?us-ascii?Q?pbJadnlYNKVxq4Yz4tb3sgV3dzgGhgv0rcnp7WnGvkT5CNGmcBZEDZG7CSfo?=
 =?us-ascii?Q?c9I4CMttvdfY7ldnIEkyYhasZ+cVFfj688sHStHp8lG+Lz1WRfMDoe8BPaZk?=
 =?us-ascii?Q?KykpXvIaeSaDA/GmzN5ySnra11d9ATMpnmpNqEs3a9HqfCG9ZbbfaPUK5Ix7?=
 =?us-ascii?Q?zXQINSUAhZdAeqQMg9K2b/gzd/5LkN97L30VNcvpw1lzV2EtIaD2GoVrIiJB?=
 =?us-ascii?Q?NkPx7wbZ3pFMcZfWm28JfqeVr1vmd31DiXSYeuBfqCf3LCaKZuqvKqteI6ad?=
 =?us-ascii?Q?nPiZAtRVUHN/4LjzFsZnuMCBijysEJxprNg/iJb6zz/pMXhTTrqqlmsAEbFv?=
 =?us-ascii?Q?cT3HGhFDKu74BMc2CP85ztjpOEO4B6HsY4pWvFjCfbSPczQit86/N0H6ud0B?=
 =?us-ascii?Q?DgovM2Mivf6nn7PdwP+fU6y0er39kCxW5nnDwrrxwsnbFdfrjkCnUx+diSfy?=
 =?us-ascii?Q?98q9ZWiRAqfy8KJcE0P6l/hbI1jWsNJG4nAd1JVUPbT/d16THZKqBjTkcP2N?=
 =?us-ascii?Q?w56bED2si3xkwgVMMmxe4+ThD3tbH9jqBIBX70dfBpdBqWVAwqu6+UVHmhps?=
 =?us-ascii?Q?tGsuciqquA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5508d00-bc0c-4223-92fb-08de7e4a69f3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:00.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js6iz1JE3BtCudJBkQEvuzUckTGu2IKSlV0zpz6kiEWqJuB2wm3hcpfsMxP6+woVwNAkO7Km1ZdhB/PgkOUsIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Add extract_fmc_signatures() which extracts SHA-384 hash, RSA public
key, and RSA signature from FMC ELF32 firmware sections. These are
needed for FSP Chain of Trust verification.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  1 -
 drivers/gpu/nova-core/fsp.rs      | 61 ++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index be41e07b8448..ab5889fa6a56 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,7 +26,6 @@
     },
 };
 
-#[expect(unused)]
 pub(crate) use elf::elf_section;
 
 pub(crate) mod booter;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 15731d24d0c5..29707578d4d4 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -112,7 +112,6 @@ unsafe impl FromBytes for GspFmcBootParams {}
 
 /// Structure to hold FMC signatures.
 #[derive(Debug, Clone, Copy)]
-#[expect(dead_code)]
 pub(crate) struct FmcSignatures {
     hash384: [u8; FSP_HASH_SIZE],
     public_key: [u8; FSP_PKEY_SIZE],
@@ -216,4 +215,64 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    #[expect(dead_code)]
+    pub(crate) fn extract_fmc_signatures(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
+
+        signatures.hash384.copy_from_slice(hash_section);
+        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+        signatures.signature[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.53.0


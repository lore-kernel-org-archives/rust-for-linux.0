Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A6313E34;
	Sat, 11 Apr 2026 02:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875829; cv=fail; b=Ei8FqD0S9RgJmFAIKHyxSQsU4yabNEuv7oiQgSAdjGrTWrni+ynfMtVT8pDTvK4kRY/lQZXecye7767lBlEuI+H30U2IJ5GwhjziBimDTQXnyjlZRqDTHGX72f3Z+5Hz/RGtf2HMiigO4o1x82uuQDNIqW7pzIF6+GjlwqgPUNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875829; c=relaxed/simple;
	bh=Iy5ZF3uuhyjeruYzsBCbNYWJpSLyRY/IyoK/ABdoDIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=szKCNiJXd19zCE7CNG2Tx34kwXvlkBqVs4cdfZNtgE8CQVJVGAbuG1ePn7mvSnvdZbT5TaL4pvi+0WHn9CYjdWMCOHy+Vd1zE9D9ynyYnF9gfRsGt3r0688Yv9Gjs2uOU3YK8MjLnTCdrvospEfRQJlUdZgfreL0tG4Fv5RVaoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qnUODdcJ; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qnUODdcJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGj1hsyRMhZfeSSiFCIzYFlBXSbPWQGEsXiuvJR0pbsxUeQI5lUGWnYSfTKpAInSTMKKYcnCCGmSy9xywnxzOeWAVOAfeiREeHX+sqT0PdvHHzpERjonZ7GWCoA4kuBW7QyRH7u1cCdNIyJ9kq4yRrUHvsWNCbp89wAbyihCSxbYoIi9JJ8Mnlh3bcA825bzBhOmx2UARqsAohxOpelT8dvrJ2IBf9Xdyd//FYxXfWs/ChcFSI2SAYqgjN4Pk/zvalrW3hxNxuV9noiOuQumCc7owXg0wv6T44PRWbrQvLH3aPtGN5+I85JDQ4Vv7ZMrr661wvF0AzzH0Sn2RsmnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHmQ9U6DCPiU4QVWeIbkjTl3bMEtcIYOdgOi+chRknY=;
 b=Les+ws60DZitpELA3xgKb5bEjtPFA1za7cRrrW7OUaE2+rDmCXRMQ2OZEZPxE72D5jAHhpM83A6MOhodSuIgEuy75WUkKspgYpF5BsbF4VVMCp8p9m0BE7AYX0NoOpVvU73xoEYrUdnNvH8k0SAtBMx4GMBNCO57THOpOst+RUcYQ++xHQan5rl/QPKOrnTyMH2Zm2yFXGVocPTXzjSQCqIbgvDX7L6hMIb1ttMOrBY8jBv4ayPkf9/rU+g+Och7fzs9V9fhWpATAwa8oHPG+R5d18XffY95hl9KWtsH9REbTHlx5mW8hO+xvhd8BXA/WNTQAimZJM7Z23BpCeGoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHmQ9U6DCPiU4QVWeIbkjTl3bMEtcIYOdgOi+chRknY=;
 b=qnUODdcJGaY2yltp/ExfNaml0rasMF6LlXz2DeCfLSpdtElD+8I3OGjT1742VYM+oTbsEp9tLy+zu8CIt7NOaCu8vtQ8coXoeIpGUjf8dqkebn62M+SJnT8gI18wtpgOzcEpcK5ZpoFN1xgzhmz3OT6o0U7t0BJWGTTGHXW2LqbVKy+MApD+SuolWBN/A3LEAbyMe8qkGuG085o5E5UgHMeXrZzFMu3mecTjVoMFJSJeFBfME+AdHCgw1fN5zrhmIHH5AlZXrb1pM2OgSN/OijStNJyhllUhcHZYTQmV21pD8wtWeXG/kdP4TzMTOFXWm7/1HsHbDDJyHdb8GQKj2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:19 +0000
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
Subject: [PATCH v10 18/28] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Fri, 10 Apr 2026 19:49:43 -0700
Message-ID: <20260411024953.473149-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8d17c1-6a90-4e16-ad6e-08de97751190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MFE01oSnY0tgnlauag653xXMyl+YvMvAH9xIpNfTSgovpbXznIGbTQrsKsQ4MLNJUMHD8n+psIXAq+axDTNrsjTt2ssX6l5NX3mSYnGyn58Fd4kUJ9uxl0L7bE38iOjE5HqnAozJndD20A+1DZey+C427pSMQoZ3IJZu9ngEMOcMeuUnZK4BesN9J8+Fvt0PJulM1/I1BVXDsA06/1Bj6sMzS9m4vw4LydRylEGREk6g3FqjunJXe1aYc7N34IqRy2pVA8NnEIwBUu73s9Ms4yXnh8z4hqoB0d6K2/WSdXGEwT8waAPG3agLvWjMAoctsviSv5e92S3ogWGdcwh51xygdUQrbGYz9cVhmiTLIKZilgVYfIhHDP9cZU+kuk2RYW8KLeFB79AXBSmcllqNJWyml1mkwEOzx8ifROzygWnPxRcZywD0mEPSKCHEzQHVJss2hGx+K+/kHqVt56ZSRopt2S7qL/tMbjYMTTSR8QYHqAmaP/uKDWJmjFQVPje/PwBSF5UChZGX6rlip7DG1iVMKncBP+cbtsHoznplpedxQmpfkGzNy2pUJ6M/n+eg8/lCrZZlzharA3SD/Aaz7c1w/xxOn06fNNFnhR3Sw39fgYpZnHHY0O2mReXtToVvPfYCq+2itMzIc/RlJsKYj89RHJJGoj097Q/lxrdWRMA4VuRHK3Amtlk81MVAK5V+JDERRYr84qu5FDibX+iPihWf5Qod/MYIXJeJXm3anuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4qp+BrTLaKJAhVMV+NFDiKm2jd/CP9/ZvOyGVnfhZ4jcxK8WeYX3OWBAOlZ2?=
 =?us-ascii?Q?lUPFJUd8TG7LpXAOtGjxEj+QMJy710qB6j3CHu08auOwCWGY8bnf4xZQY8Ey?=
 =?us-ascii?Q?NJWiHI+q2BuYZyzn+cHB9Z6zL+RBPRxRGUnRj/VsseUeslry0LohAfLzV9RE?=
 =?us-ascii?Q?XoT/z6enRCDTqzO5kqVce0GC6lVUKDX7x69MYiyYFLVWVScs65xUUz7pX6Z+?=
 =?us-ascii?Q?3tVVL9q11ZBy+Tlc+WyiSQ+9Vvr4KkG17bKJwryDwPrZKpgnyhr/6NWYc9oo?=
 =?us-ascii?Q?F+MUwbYSYQY3Y5zo398pHQoqibvdWlyVPfVq5EOSM2zmPT6Q819QOgGlpmxp?=
 =?us-ascii?Q?LEQJlWFsy/8JHafl6VxlUO3zbFQKXPHRU3qLafZ3UGuUc7BkcwFJKAxKZtxA?=
 =?us-ascii?Q?oGetaAPmjHIiDofUdOhSaad8Ndn910fF7jLnEOGvZUAUeO3zQCzvUe+zpQDh?=
 =?us-ascii?Q?afHCu8MZ6r6PgAJWlatvxmLlMnBKyqtn60yqn95PHmRqICwD1S/QZztr5RCq?=
 =?us-ascii?Q?71vQLyf+IlMv3QNiDXjyzTdhkgwXx4pzr3qMZI1pa8WZO68lzRWXs6g2Cq8S?=
 =?us-ascii?Q?nYvGqouLjoXZQVV5nVCV0B8+se3DhG4mSNPcTHUBUgO4KPDQQMM+xgsu4Dy/?=
 =?us-ascii?Q?vYQ07D2QCVPuYbbxK5bZWlc7Ubuvl3dloOF9I9c9T1GOz+pSg36qlHuzWv+0?=
 =?us-ascii?Q?zxekpZiws/xJYhpeGrZfyustwoxN2sWv0LeCFoXUPJHG5AsSG7AAaE+wd4Ah?=
 =?us-ascii?Q?voA4mZ/k8jkZYTs41Sqn2l5inHWCrddxfsLq2u2msFxpLD50KL2W9XRdu8nh?=
 =?us-ascii?Q?xki0kpGpT8DM+vLe1eHpqmJvqGRGvm4AU6Ntsfmy+DDZCUAulDjC6NELtGDr?=
 =?us-ascii?Q?oS8uWXGUdN6r/aV5+SKPkPDwXGKa4xX4RzI8n+cX2fBrENNycu132eKVytUq?=
 =?us-ascii?Q?/W6bQu4q8J+qG5VWmiJTmlmd2vScwS2IBoe1jhy0uDkb29tslCzzqjWQpXKU?=
 =?us-ascii?Q?7gJ0gH3dKQQ/oIpbQAyA4GR8bQ0f/VHJSWx3r9z26fzjPvt3mgG8KjI3lVXV?=
 =?us-ascii?Q?SeUdlRkLoYGKwRC7mxkz7py7CgGl0Qdfo7eFORkRQTyQCzoouMqkx0FQH12f?=
 =?us-ascii?Q?1Q+6aIprI7SlR9wuvyAXolo/jRJxdgEgD1x3+V021Djn6IOPx+WWVkHd+Zoa?=
 =?us-ascii?Q?qdFpJ6ActXhQr71Ti3hPhwCAcR0hhuv/e4mm9jsdmLIemdZNeLokFoWNFNGf?=
 =?us-ascii?Q?6OS5j0goI5QXnaTWYA+vtqnihETcf3giyb/hmuxQbTUfOBj97uvdIPF3035F?=
 =?us-ascii?Q?nHQ8MfmGpSDWVBLJyXPstbkF+NIXhsYqkQZe3DCKDLecBxhI/zfpJl5fP6VA?=
 =?us-ascii?Q?kcNXd05F48jd4XyPFjTH53kz0WLg4ZSz1oeDMwRYbo7wEKKXY9J+L0ZoS+Z6?=
 =?us-ascii?Q?LSd2Co6QvzrbnITHVOhDX/uBKLjfLKXU5zd8WifH9FcYsxYnmT1bAxGhXUDN?=
 =?us-ascii?Q?KgsNhiF4TV8YwkA8YYF/2LAVWQNy0Jza8xc0EhprkgiXuRCo+MtUTCSqZ5ez?=
 =?us-ascii?Q?TDOV0woxpZ511HtI2HT+f1Z1o0Zic65BbUfT98JrQB8zhIk1P75K+ML9WSnn?=
 =?us-ascii?Q?rnENxv/Kik2qWq3Ajr7rSAnulFJmDlk58vZ9vVG1Cb6YfnwKX0yNplkxYu9I?=
 =?us-ascii?Q?Zfyq81LwHjSQpz5Re4IbeoYxO/XeZdTQlXDwYv8Gpdj7CMA3rxgywor92PP1?=
 =?us-ascii?Q?Zwb66Boz5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8d17c1-6a90-4e16-ad6e-08de97751190
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:19.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7EuxmF/T32L+VpdwlN3yzGwycFwIZOBd3JI86/yBkEoxQlIqpqdJMTeKBgCiGHHlOy3QgsdQgl7PKWTV/ngaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add extract_fmc_signatures() which extracts SHA-384 hash, RSA public
key, and RSA signature from FMC ELF32 firmware sections. These are
needed for FSP Chain of Trust verification.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  3 +-
 drivers/gpu/nova-core/fsp.rs      | 78 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs |  3 +-
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index bc26807116e4..6d07715b3a49 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
     },
 };
 
+pub(crate) use elf::elf_section;
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -646,7 +647,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 55e543e80de8..8287bda795ca 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -18,6 +18,18 @@
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
 
+/// Size constraints for FSP security signatures (Hopper/Blackwell).
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
+const FSP_PKEY_SIZE: usize = 384; // RSA-3072 public key
+const FSP_SIG_SIZE: usize = 384; // RSA-3072 signature
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FmcSignatures {
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+}
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -50,4 +62,70 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
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
+        let mut signatures = KBox::new(
+            FmcSignatures {
+                hash384: [0u8; FSP_HASH_SIZE],
+                public_key: [0u8; FSP_PKEY_SIZE],
+                signature: [0u8; FSP_SIG_SIZE],
+            },
+            GFP_KERNEL,
+        )?;
+
+        signatures.hash384.copy_from_slice(hash_section);
+        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+        signatures.signature[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 9609cef3ff51..739624af1cef 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -208,7 +208,8 @@ fn boot_via_fsp(
     ) -> Result {
         let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
 
-        let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let _signatures = Fsp::extract_fmc_signatures(dev, fsp_fw.fmc_elf.data())?;
 
         Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
 
-- 
2.53.0


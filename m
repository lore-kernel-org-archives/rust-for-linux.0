Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD95344DBD;
	Sat, 30 May 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110635; cv=fail; b=Ox0RAqMnTAhORE/OLUe+A5jBKhCDZU9GRGDBal0UknepCpfKBW3AmhbsGu6fM9YMf8mDd85zsTg1RCncnl4vYS0uAultPi/offeamToz908vIVuOLLhJxjqbCHEbP+Vr+YpCw0XTSraum3CILKm17NyIwc8N5+5fLb/HmTPBazc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110635; c=relaxed/simple;
	bh=obUqXuBkLMcCBJtc0TlhHn4r2pd34x1Ks005zozYI9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fqOFpYfxmtxYK5gXNnYNcmslAqckNLIVl5LT5lQ0w3UQYdFxIWeG8+WwVIpQBHj+PCfUK3OkmK8VdT3KFKy8+f+mg1rE231pBdDb7m1r0MxgEeNrruzvkzbgypI/tJXG+tUY5S8H6At1Yd6mk7w0dwmXMouM6qz4z5/C5aHccFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OXv7LBqQ; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OXv7LBqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SInfbzIMojIFLcDvp7tarEZY/8T3KIDfkjwOSkqQ4idzdEJ43w2ncK/g2JeFhbbUoshJBfJgF0AB3mPe/DHjkIN/NB4C7BnxTG/9+tLvHfTDpsq+qff+fz2v6qUf+8JGgMIecomphVzKJKbqHptRtCM4s5Wky55n6oaBSShHqldWGDmleGu0An6xXQsWCFlAlFq3z3u6LOonbix9HgNxHUZSAH0xFyAsrgatQ2MDDISabjSv6QZc6d/LBMWYI9ZZ5yq/3sKa/g5HSnJqTP4FxvpXwQ/MIMErdT36t500l8dabTR5wddL8XjLPFGFKxdCbCgCYyJ7wl3llVyAUY7Deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDb3eMWkD7eeUhLtv9iO3i9r7gtf7aYcHOcyCbjzy74=;
 b=mw/9rwtXDHAeP4T4uJcnQUQL1Ju2UvqfBX5TIf2XtkCej9hUO6ajAV2BTFGLBMypiFRNaXnPyhtfjNrlEvVLOxFXUm4Lr02y0ffsdB/j0i0D+EqAQ9lqim9dGHXLkIx5L8EMeK+oSsVOV1QLt5BRXen9Do7db9QtkhpIwZvfHH542uDVSw13yfeeKRHsPO2/SsLGK+OWklFzLael8KSOPz7Q0M2j5UduiohVUWSZis+Ush7L94H3VvrmVw67NmseY51WnyVLxNkeFH7wC0P6RdLEZrwYZfCo6z17QdKci3O9y7cLdDvGjY+4o2bTdVUMJWQ8aaw9xz4BG6UbtWf6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDb3eMWkD7eeUhLtv9iO3i9r7gtf7aYcHOcyCbjzy74=;
 b=OXv7LBqQ19z5kpAgWCkGkj+DQKast3Yfze6WtHxOsOGKG8aLlRNIrUk39SHPfbEEGAjaw1U/vhy9hWCrNKLm6hnR0PWFfdnX1hiTcOB9caWAAwpr0CJ8rukdVAaFPbGLakYL5x6HXGstl14ocYfjlDbn+NvugD1vgLKTSKNryHYKwV25Ueg8eguIRIQkXZAuk9gxTkW2V3x5cPx2TO2Hc2dQJ7OJOm+mF9ES3YZb+j3H8n/XQxVMAezuS7Av+dz+AfZR+51mudWcG9L0vIhTnQ6LZFcnmnm495KXW7DZEPAcYCNdNr94SRKZbUSUQupM28Dn/ZrWV12loZ+NWzFLzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:11 +0000
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
Subject: [PATCH v11 13/22] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Fri, 29 May 2026 20:09:44 -0700
Message-ID: <20260530030953.740561-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0c32ea-5489-4efe-b23c-08debdf8f624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MuPMuWKLYLxtVc5BN0UWcKBDaD+OuaRZ7WXr5Yt5U0tSvjzm2CTNbXXRKwA1CDQ0k335CfKvHacinWW+IYt2tbe6s7ncfl0fzWOcJgPtzCDE6pzCo7/FISNB5HyDTh70nDyrcqiWtvBNu9H3JdFuP3xMAAgUmwOF+OX+UZ0H/AGGZLD6i4Blci1+gc9tghWK+hZjZODsNF3sWDOGeHKPC40AD5F8EnNsWIWHn2UGzi/GuCnaZjVGPqq+BnDsiI9w39NaWNEEM6g1YVIoQbzcbVkzsq7NJ21VaBOxA0r5cZTYjPS1YAKXEy7HU0WAHBrk7r1hDe85gtzmWfLjCDCckT4ZH3BYYuQfMdx2aHV0g1EjDKeZeFpCvXjB0P3yHTZm9wNM1jvJoOjHZ7gIUpS58Cee5sDBCDn/meZk0qOglFRvOxRusDW+NQHEkF8OF43oFxXEqNLjCHZLn4yvpSgHxiu+PhyhvV3OwnQnsDSaXT7Yq90gD8bxKgELjOaI68+alwYgtwWE5lozHUf0UXvHD+zU/PsEfglk31iFoZdpwAkFXXwgndY6SqXx3sq/sm9QKVB9RaOziHwiTKC6Tk+wF5f5ixgMuX/9NOkaoiTaKLzZFpbSV3zSpgtzzlPooYf+/FqPxT6irUYiRXXAvJIdZF6TZINZiucD/vISTV7w4RmkhgL8AZNcuLQK0Co0w/bG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4+0N57XPydoPSZFSgQCBcRRScf+FHiy987AIDknkzOZzsjC4chtGQ/RlZCpN?=
 =?us-ascii?Q?x0k5/ZiUWM+CQoqI4nRr8nZFadH78kshsyT+7+YuHGBmn0oeOw/6HbDYn1nd?=
 =?us-ascii?Q?Wrf9oyU3sXrqPO+vNBT3mnxx4/V8nBNdOG6mf15co9UYIOVlZEUfijMuDHSi?=
 =?us-ascii?Q?BXab5xBKS8qjNF/tzvwrnZtVE6p5fLTd1hR2GUQqSiEcgv4VRsBa7e1JMtZE?=
 =?us-ascii?Q?MT9zRNFwYfx616Dl/KEpGxpSsOR4iC5cwM/26XGGkNTR1cZdBze6mVAeu7S3?=
 =?us-ascii?Q?mLvTKgY6Vy3Yg3MOC816TaYQWQp8ywdXBBD4YkLAeQ86lWF9q6KnUlvikiaH?=
 =?us-ascii?Q?LUNDHajrPLjtbjj1z5MwSVrqb1CaTfDecRvXMv1oCeryu5Wn4ajt+Oc7BXLA?=
 =?us-ascii?Q?0E2KPaW88qlE4VYyXKLQ1V1a9HDbJObJHTUWzqZBPyBH7B+6oJDWiu/0NLtG?=
 =?us-ascii?Q?mw03gWIJ9j3VCAkzjsGm+clVKPsU1oodwTQSEYh1MGXDV3/u/m+e/h8rrifq?=
 =?us-ascii?Q?I0k7urtO9fVCd2ZvZUJbJ6jftD/WCZ8osNuxyf4xVDQ0CaUJLMaCdPL3K+vX?=
 =?us-ascii?Q?4t5b2gZ24HCoc/yY2kyEr5W5/40BaCm5eL7BZHC/0cKiKwTwUcLCmCU8WP7L?=
 =?us-ascii?Q?LS7duw4+4QfsIEfcSU9TkKuPlkhjKlQmK3dygCaRctP8QgU9w9Nq9iptZUrk?=
 =?us-ascii?Q?yZPCwN6cAdkxPQ+ExoDwKDv0UrksAMaudGPjRuVEjKSzxc/PkCp8Z5+MkI/5?=
 =?us-ascii?Q?szuQAarmUBN0F1EJ3+uRSGwrX8vSF9UX4Gzma/ZffhoiYecN5uxGe9Z705xV?=
 =?us-ascii?Q?kPHaXuyrKoULt8EFM1t0XuiueVMReg+fDa5uriRxZo8RDktboXT42KoW0P2d?=
 =?us-ascii?Q?AWkgPONVLPhqwoHjgIyXN/iupXg1xTIrDxL6zIKKoYrGv5PZNkNNUcQSdduN?=
 =?us-ascii?Q?11gIba8A/7zn6WJb7AIOx6NMT+Eq28bIzCBAE49tW4ZMne7W/vWXo5KOd9SH?=
 =?us-ascii?Q?Vf3g9wuFtOFv8bLKlmQmqsnigaMJ40y2UOqE+sy1YQp97KWrNNNgP5LMst47?=
 =?us-ascii?Q?VGvNSvOo+CoKUZJpx/pGztKP4ABZRJabILa0aKmKunbtc8KlQU5xnCKWMwWL?=
 =?us-ascii?Q?39xfFVZcalv85g5BPwyXsU7tZ4GCqpvfrqrk4L16lR68ULOjDEKfECj36KGa?=
 =?us-ascii?Q?b9zt+4DQ4J+PE7p4Kr4LwehdnmE8pKI+CldFCsZ+qQV/4anyFXaI357QCtQa?=
 =?us-ascii?Q?V5LJferVl5CkTke16cGdugoepsUMF8M7x0cBa5raZRjW94U/HpGfyNu8bbCw?=
 =?us-ascii?Q?7DclYIMT0sa7JCoNRiwkx5qv/1Lh56Nj9EFwZq9Fw+N0VzBpZkWm3sQ+Mwqc?=
 =?us-ascii?Q?5M0P59+Ww4lrkF4BapcovN+AaCh39CsrOgOBkcEOyQs9Eu1ZIx8fbX+x2qvQ?=
 =?us-ascii?Q?/0VRF6qtJXa5m/Es7kzWbqm4lDsilILPUxME9qWuPPRvFWT5sUhLMR3mh3Zi?=
 =?us-ascii?Q?SpFA8lMvs/onyqxMKLcTHrGyvrFOtzM2ykVXHphAh4OX4w07f9GxQBFaIdRI?=
 =?us-ascii?Q?VegKPkxFwLv0syFNG82x2m4afhNAo3TAD7OYTEFLp0evs+GaRmXDa0pWu/dn?=
 =?us-ascii?Q?03yxbf87+SjntuJCDC02PI165JhZq5LT57URb4BtEhkbN9WHdh27XDTpKf5w?=
 =?us-ascii?Q?D63vUAASmBY4/hG9t+Az9F+YrJ21XEAGbcjvj46vBJ6zzmQ7Ov/fBt/fEYHl?=
 =?us-ascii?Q?vvF7hS/R/g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0c32ea-5489-4efe-b23c-08debdf8f624
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:11.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/uEFeMUw06RsU5kZnuuHWFe3n3p4jmMKGZUQaYyrLvE9jDAjYGbVbpCYZBcjJKDTlS66B1/T6QP/bMhzuXycw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Extract the SHA-384 hash, RSA public key, and RSA signature from the
FMC ELF32 firmware sections. FSP Chain of Trust verification needs
these to validate the FMC image during boot.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  2 +-
 drivers/gpu/nova-core/firmware/fsp.rs | 90 ++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6edb50b83a29..569efee0d4ac 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -641,7 +641,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 011be1e571c2..dc28d0cc2d03 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -15,13 +15,35 @@
     gpu::Chipset, //
 };
 
+/// Size of the FSP SHA-384 hash, in bytes.
+pub(crate) const FSP_HASH_SIZE: usize = 48;
+/// Maximum size of the FSP public key (RSA-3072), in bytes.
+///
+/// The FMC ELF `publickey` section may be shorter, so the remaining bytes are zero-padded.
+pub(crate) const FSP_PKEY_SIZE: usize = 384;
+/// Maximum size of the FSP signature (RSA-3072), in bytes.
+///
+/// The FMC ELF `signature` section may be shorter, so the remaining bytes are zero-padded.
+pub(crate) const FSP_SIG_SIZE: usize = 384;
+
+/// Structure to hold FMC signatures.
+///
+/// C representation is used because this type is used for communication with the FSP.
+#[derive(Debug, Clone, Copy)]
+#[repr(C)]
+pub(crate) struct FmcSignatures {
+    pub(crate) hash384: [u8; FSP_HASH_SIZE],
+    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
+    pub(crate) signature: [u8; FSP_SIG_SIZE],
+}
+
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     #[expect(dead_code)]
     pub(crate) fmc_image: Coherent<[u8]>,
-    /// Full FMC ELF for signature extraction.
+    /// FMC firmware signatures.
     #[expect(dead_code)]
-    pub(crate) fmc_elf: Firmware,
+    pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
 impl FspFirmware {
@@ -41,7 +63,69 @@ pub(crate) fn new(
 
         Ok(Self {
             fmc_image,
-            fmc_elf: fw,
+            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
         })
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    fn extract_fmc_signatures(
+        fmc_fw: &Firmware,
+        dev: &device::Device,
+    ) -> Result<KBox<FmcSignatures>> {
+        let get_section = |name: &str, max_len: usize| {
+            elf::elf_section(fmc_fw.data(), name)
+                .ok_or(EINVAL)
+                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}' section\n", name))
+                .and_then(|section| {
+                    if section.len() > max_len {
+                        dev_err!(
+                            dev,
+                            "FMC {} section size {} > maximum {}\n",
+                            name,
+                            section.len(),
+                            max_len
+                        );
+                        Err(EINVAL)
+                    } else {
+                        Ok(section)
+                    }
+                })
+        };
+
+        let hash_section = get_section("hash", FSP_HASH_SIZE)?;
+        let pkey_section = get_section("publickey", FSP_PKEY_SIZE)?;
+        let sig_section = get_section("signature", FSP_SIG_SIZE)?;
+
+        // The hash section is a SHA-384 output: it must be exactly FSP_HASH_SIZE bytes.
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
+        let mut signatures = KBox::new(
+            FmcSignatures {
+                hash384: [0; _],
+                public_key: [0; _],
+                signature: [0; _],
+            },
+            GFP_KERNEL,
+        )?;
+
+        // PANIC: src and dst lengths are both FSP_HASH_SIZE (verified above).
+        signatures.hash384.copy_from_slice(hash_section);
+        // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE per `get_section`.
+        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+        // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE per `get_section`.
+        signatures.signature[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.54.0


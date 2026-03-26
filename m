Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56203976BC;
	Thu, 26 Mar 2026 01:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489187; cv=fail; b=iVnYPB8vLJ4vzD0O3E7Q8xtE5PsNuwKqwlR7vdFKoEwSfrZ6eiqtPbFbGavprxOFsJL3jPZsRIqWoRlL+B4J9C0jD2pIcuzIW/dp58I9ErODGMkaMGlA4ufVWBqJ3afeTXyPZSwwka/OJsRBUO3t7VFmW3Gm28f3IKRRS7RPw8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489187; c=relaxed/simple;
	bh=YJzU3NoJ/wSoSWxMMeoPfu/bRK43DMd4/BHz/fpa8ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmE85q3fmPmZ9M1mtkLW5uY6gd7XHtmt23Fbmmi09dkwOc10Vqvm/jLwReHLhBFn3ZscIwOsejo6l+diY9+4+50uK/ml8Czf/0Lotj2v/3E7SginAOAGwd7dScN0RVkEakCRgbMGkeUygzjte9IM6m4haAts8bumcBD9JOCfkeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=csWS+c1y; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="csWS+c1y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kX1pgDhM4zQgvDU4+KG6DoPnn+Ciq2wiYHriF8yyQOJ4AH+TK4Q79WsszvhOmfsvd4RzvbIo5iubZPrZBVX64IFhJeDj/GTnKVqGvMPUAvTgqkHLfJYDCm6a75ojvSt5DuasHsn6J4KWp24rXgQPx4oYWH23E3gxNWU/BDjqsvJYHKXIaqpm/N9pPR7hPmROfzQnyTtRJvhpNy+0K9qHc0vqSfXavDyTlaLlyQOln8VspEYn57kqXKKMy4ftdX8XkKSDrmh2YPKcG8aYel++mYEnk/4Q/acymGBmwVe2LFhaj62NoQ2LD3E9wwHjqPbYdKkEmA5EuAKv8B1wpVOs3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4lcuUpYdL2pX0j0dew/MgOBoGktNzIpzVfnGoD1+v8=;
 b=uSPHW+Z13Ldl3oiRqsIzjNMSBKlYY3Wx85gHFufLY10216/NxNURBEko/oI2wE4U47Jp6fmj0hEn7p2QkWzzhLWiJwNDOuXlLKIIY6H2bXNiQ447A0Z7eVRQmIp70GTbpr1t7kJFvYh3UI2XGF7NQY3vDuY0R5ArARc0LcQmtWT7wlF4IlGHa9jIlyUNuOSxwnAfpn/6xC65xu1w3oqpe/3PYnHdxLXTLsS+kfQDaS2Zj2d4VrJz8g4qk7z/FjekMjwokOenfMZKg+jG+ZGbQcyWnDiqXaW6Bked4/8TAmFCjww3EwpqMjE85SUcFdPQQuN+EcPVA/RJZ2pD88vaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4lcuUpYdL2pX0j0dew/MgOBoGktNzIpzVfnGoD1+v8=;
 b=csWS+c1ykNSpd/8xhKQt3BP6Zgjhu2xBOtnvR347itMYnsF715Zv7SC0mPMLZQ/GoCxH0+YjwH9d5j2YNF7RQnSzICgi8G6gwpcFVOluc0ITwMB+rn6mcP+Y4lv7xCCLvYxh7d1Tu9CknKMHy0OLYoj/MmHOsJL+ndVdxH9QzqjEe3TYUAT73uFLG82N9qGfzNikTrzzWWUmr4jQMVZiNm1egUN0b1nvfGZL4SaKNod3eYIPlFoiNl3fA2DF+aV/KEgXFBTRYhf/puaKFbxGV4c1gUPCqINGZiXTpRwQIaOJeyp0EzodDcjj+ihCuFOnk4dIvMsP8Ue09BL2DK2GnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:34 +0000
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
Subject: [PATCH v9 20/31] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Wed, 25 Mar 2026 18:38:51 -0700
Message-ID: <20260326013902.588242-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: feab2dce-c440-4b49-4254-08de8ad8889a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DPVV4OGw/gYXETMDQk5k8BZJmw3qLOs4uJ0SUUBjRXliaCz7Vw0pdq2UpFDKQVI46HaniweHojatLW0WxsMDTS6uk+ZtQ0SdBltovmkCE0ZvxICVP0+S848oLJrNLgWtGaaEvizcQGr4CdmTdiYudcHChav3lHzXuaLOrFrrEroPZsuMcccHN5QIUgTj82tryYIvbyPVQ7qvg4S+sqQhFvSAUJsum7lxxbJJDa0oZr/z4ep73Mibq/MQPWVOFru7g9xJZ1+/1qtTsKBoi4ia75qfWG2u55u2vyZmvCmf6gT3/ilgtz5C9WwrARhPnEXyOsEG7KoOy2SfUoOjiO+M+MEVh5Q2R6XAF/6czC9Nn+f6GCRC7Ig2kICDyxTd2sRaL2t1uvsodUXDfR0F8qwr6YX7VyxbyweFEoiB7Q2KjAjL5BA5W/QKAeNPWtao4jUf4GLdX0hFE8r3zKVEbXieT3f10zbPkbBc3I7BlumeHW8HJt0gQO4a+/AFiUpRJ24HscDjEA9pSyCtS4oZ+CIxhariabYvSV8WVV+ZHQL/vhPMxR4oyxsmejGdYsRFFv6plpFwrmxPcHVy+if/QIuSi6LDIxkjMXFnNQBfWHfZJLIsKUt6gM6HAxDKKPVbLnr6FZNadlY/elqvjqnCgYXev8LGq+wtmqPq2HY8nKVqou37RBX3PTsl30X6vqGCOHSpg4hWHRZr1vqY1cUMaV0Vz+zLKGLFnxZq7FrM8JSuJOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xXy0kUjNOaUJWCRrC4RFjhWF2GYXJwPc1F0Kjd6ebcwVmRIw/jp1IRtJALjO?=
 =?us-ascii?Q?fwOOK2z4eVJNLXIn3b7PXXL5MZNW4QXnmRjioR7ZR3kiucHIuUkHW17UEcp0?=
 =?us-ascii?Q?kY/XDTBRRu7e4CeZL89sTW0gtoQ4Q2/bnpaudcsZw/KspzF7KSmM8XFyIhY7?=
 =?us-ascii?Q?w5rjAYrjEsHlg4SIPC27wk91N9geV14v6QI13VpQPuBSwBeJn08xFLhbZePY?=
 =?us-ascii?Q?u2d4H1Z/jnFliKrKL0FuZSY9cazRN8mWXFcCGJlXa4JW2oC8Sk3wp0FcRaqc?=
 =?us-ascii?Q?RYrnZvGyd/yQjm7e2GcdjOfAIHVpHIHSzT0nuY2i7XWnxlwO/UrXLtep60hH?=
 =?us-ascii?Q?dgIh7n/cKFCBUauBodkBLEfvjT8S8lI1Gy3VaP64S/nHi8vxBM3CaNhv86AN?=
 =?us-ascii?Q?IVwC1ZQ17+He2OyokJ8my2v5Vyh4ilRELVYDdQre9lzDB2kgCtWG5x7n7Nhr?=
 =?us-ascii?Q?5194mJdKiYHFJMCnBfet6O0prY/GRmu82ZpSwhBkNN8bBDsECvHQK4AkMvvd?=
 =?us-ascii?Q?L2CpnHRS3crZK0IoUA4iRLeXDyoRbiOyHU5ewyPD3CNh/2yxKJKV1S0Ig0Z9?=
 =?us-ascii?Q?c8ydMEqTsoOW5d7y4pX6kwUmVwLAPURL9gTix4lMPQOlpGdV2AhC7cWsdIHz?=
 =?us-ascii?Q?Teq3T3/k/ScbnrFUmtSJheGMk848O3ESwYZNNVK12MZjzhLWM+ygXHm5MUwc?=
 =?us-ascii?Q?g3sqzUzMeKGeRfSXNVCRSKAPj2+xjexYaDDOTaDBkQX0CNvbRJACP1MatAKu?=
 =?us-ascii?Q?yJhDMiLmeEVJiNf+w7fWv3A+HNqDrhcv96IrRdVjBrk7sTqDWOLPY1qwW/40?=
 =?us-ascii?Q?zxPdVfj2bdHcLOC1wQ9ztz9UjFF/JsJ3Gm0XQSr8mcpUix8FJrdV8IsUtRe3?=
 =?us-ascii?Q?GkGxq9wbsfzgic+JT95J2oYT7V9fMJvmgr5LHCKQFDgC7GI4JY0f1tesFibs?=
 =?us-ascii?Q?GWRVP4pMoEOuxcZER7AlVvHScvq9x2ZYGQ+W3XVvHy9KEKc6mrpg/aobzscY?=
 =?us-ascii?Q?NGTv3vgTOTLHZhsh133S+nR5ORhC5S0aKYG/sewMBhpE4fRVMApSUpjaa7Sg?=
 =?us-ascii?Q?EHOlZuQXsldIay6uUu4sdObBHh8IwmoBfLWObRJ/QeGaZhbz4vL5uhXK9C4M?=
 =?us-ascii?Q?gWopeR0uZdOmhPsMOyxjPMmsSrh2NW6YDiA7L4cr5uBTfhUMffBF2nQif6sV?=
 =?us-ascii?Q?lXMAnAAUF9Qgei+zUCNOWRuccGkdDCVHo41DAVaA5uVl8aswhyq2FNpXZizt?=
 =?us-ascii?Q?f02xrgPSJ+EjmaXAU1zkWcSebYr39E5ddyOM4DXjSPXuez8V67miZ1lIWg4S?=
 =?us-ascii?Q?opWSWpTPjtYBIv7ATjQ1oOOtnw/23N6i1x2F0q1bz5bv2+5AzjokrbqB2KeI?=
 =?us-ascii?Q?ZG6IlonMpYNi6iEhWh/M7inNh0sHiiZbWO4rF+mTEX45dz8yHYyy7QH5O+TZ?=
 =?us-ascii?Q?rgMvlOI33dA83ffCEajL9UN1YN1EmgCxNgnSH3Oike6KaeYjZNsz9QMf3YZb?=
 =?us-ascii?Q?DBuOv0dM9tDiqDRqMcm7bP/zxEWF/Ig+qqo479o4cN47vf9PfWTEmEg4lL7y?=
 =?us-ascii?Q?I85nLbHT/+ieornEfS1MeBkhYH2lnZ2Xf83+zB8PB5bgt27RBC1Cp5KWwpQP?=
 =?us-ascii?Q?CP6R0HIKZuuV+XPHJ8n7rd++MEYjzwBe7HnuK20tHlu19/wK8KeAedpL61aa?=
 =?us-ascii?Q?n1U2QmkzzUe9mSJ/dpema5z0uynjYQ18JsWRjF78rC3Umj1N6iUCNnWvbQVi?=
 =?us-ascii?Q?RlRyBhmcCA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feab2dce-c440-4b49-4254-08de8ad8889a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:34.4145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URrR3hEG8KOX5WVhT0oZXeJgwrQBzWPl7S+LnX3sU7vaRwsjkQ+A4OHKg+4xUhzDbRevsbJYo8p/aIULk9dPBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Add extract_fmc_signatures() which extracts SHA-384 hash, RSA public
key, and RSA signature from FMC ELF32 firmware sections. These are
needed for FSP Chain of Trust verification.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  3 +-
 drivers/gpu/nova-core/fsp.rs      | 79 +++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 1 deletion(-)

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
index 6d32e03d89f9..bbf89c70a425 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -112,6 +112,18 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
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
 
@@ -145,4 +157,71 @@ pub(crate) fn wait_secure_boot(
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
-- 
2.53.0


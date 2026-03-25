Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7730C359;
	Wed, 25 Mar 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410811; cv=fail; b=aurkMQlxjbjadIKKOjRq49PLgrOFCz1/Lcr3eHlLYO/ZKfiv/KKZ6dP6TyOiItLoffXa6dNgjNLPjp9/xRpeNwAXN20Q2Wry6smbcgXGO3OCwIu5tQJ5w5k9cyYXaLluh3wdAUjaSDSfrps7Va6CLE2f2zlPn+tKnGJbjNIpXJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410811; c=relaxed/simple;
	bh=EhJj+JSv+mlUBOk3rkKeIF/qCGhVcegVU5eGpjfOghk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VHVj3S9qk9YNhxz9SBUNcLRF2JC9vLkResHUgo0eCJdL+CdPCNmg8zPYt5/tkMKF2a3fGvvnoM7PEcEyu4K3dh3oN8mZRpci9uhccNvWUn+qguwD3X1D9tCjJq6EKqK6zvAUBs+R2qb5PVb8kKTmxzp8SL/0XYKAAZc33bfBZkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FYbRhuNG; arc=fail smtp.client-ip=40.93.194.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FYbRhuNG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlCwOQu5zvUykqHE5lGmJmaumorj9FnkKAi6iStIhCGMxnmgJh7ZoGvGuCSpkFSKitST83xFyebDvkaresDDOH0xPy1++QPI+Qj7Pa7m+B18ZlSXYhtCq3aDjaIjSGwS9N6kHrkU1Bq6x89Wq7Zbt/5Hy2XkpIr/s1EbTFjF07K/mFZ8YnBV5Xc/G0ue18rxMn+/D5EOxT1Egw27cWi1paXh3YjarIdKMQ4fuxSPyI7byQpbra6vgB+cs6sjRASGtmwNDKOoTGHtAma1uS2ByGYB2ml5H44v6Ungn/ZcJU0eCs89ihZztOlGm8Kq+yAvmTmHnGCyTyDXuI+QcqhicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf+jsGbR77cE9ouw9SuS8Zz66UqUUpOFeErOxlCcmUE=;
 b=NBVxAsgu1gK/GldwngKp87Xwz3b1wXFay/mgmsIyQLt+y/qQlChtnI9zls0grFcYdZZ3asFBDp/kg7qXz/aPGxbHr683yd2GryUvnNH0Ry9a0zDy/GCT2UdlnJ7K5gTHrO0IBIAlLgVbJgVTO8iqLhoj5e6OJom9pAORXat7J6sHe7ThZanLLiufFPWFZeZ8eWpI2fSt7AYgpMXBfsbL6fQMsXl84oV8/2QEONUDJlzL6AnJhLzei9n9AJrPSECh+XkjxEXSRCx31kuJNEeosC2PE8sDPCzZCy/XEy0wfBsIp3H/IknEbuBR9tM2DGkN2C8RsE4VUIdGpNaAVmtGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf+jsGbR77cE9ouw9SuS8Zz66UqUUpOFeErOxlCcmUE=;
 b=FYbRhuNGSXGTktmQqzRFwYYOH+qGSvSlukeqlt1DfR3igA0x6Dk6KhfCK2N8a3zDZeMF9eVB95cCzt/1lFejeVHK98iaFVx7EVrda5vv4OW/0SQTrumLoWjX28g5S1v+1QHfeqRLPrHV5aHu42Rj2eiRdAaBFX+Mjh0Zp90u47pCzoxClwjMrPWVnEudyOVKT3A5SAesPeLUBdYNWGsn27h0bXlSzqcajbHIEvzScgCHNcadRTV5k7uLETrQISXopf2pseaigBtpWWirw416nNDrIPVT/ZdNp6WdWe1j6KdU9VaMTp2FSnG3bR3TWk8CQ2/LvuBjANPiRZbAy2/BFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:10 +0000
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
Subject: [PATCH v8 20/31] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Tue, 24 Mar 2026 20:52:31 -0700
Message-ID: <20260325035242.368661-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: c06352a5-e276-4c11-0fdb-08de8a2207de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tdoiYwZ/vDLhr2/FJ0NsUOB0+CNdhlwGxxDED79z33qji61FuPxxjrOrQ8Qagj3EjALVsqcok7ZNxyFDF9cnbAoyQs5EPWjM1lVFS4TEMMIFPhPCRbqBm/7gHYhMMSPySD2KpE+L0xvkjJ8gQJK7IgHmL7s8qa6prZF6d7sBzjkmdyaQvCUCPJeaiTlBelBjbtlTq4pfLVEACor8EUtQnQO1h/IGK3rBYIqfO3VoYkiVa50dOoRVhXz1TnlrEsbFwhqopxqJ8y7LwTMKrPdi/7+9ufSnRJIG5wuNDpV/ybg3qUfU2gwLlEUJgKNyxVwO2vCc7c/pjMPrXbe7HNZc6YJMEoReLOga5UwPU89DS8IbaZqIYaRwkr81aL1c49M5CGbr5vR+0/0hep0ICu4z2k9JWaRzXWYbu6cCQQPICwFChdCF1orfzmqZE7JpGKS70JYKN1+wzdzw/DqqDEcMt9zeBGVXH6tbCK8BiiAxRBEHABzkwVA1pZ4m1AeaFrGfJ3C+915LeoEO//fwi17GMnvAUMfuKlWT09KSup2ovgbR1gZVydPW72b3it5mlAwUxPFbvVDxuCwnGCd91IJzoMCVaHs/rhoAnNyZ9dhI26Dlzz4ayP9v9gfugTitscsA0gb2szNoo/LjJ32OybIhFY0Tr7ldinnKGlGwzK6ubBgKtPMaiiB7O+g8jCGt0KdNhsg02oSnS6ap863C4vdXfoLB8yM+AbqXMvaqH11GdZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/qAOvTtKb83ZyQoEz5QpIIQTcA9jJTW+a2JeqIeXtfYIlUX+NAFljuLF2YCw?=
 =?us-ascii?Q?UO14AlC5QSirWGs3stFfXBLxPOCsqJV0vtSwtrezeAHG3C2tVJ6JN2R7/97P?=
 =?us-ascii?Q?vfQ3PWmB4myRwNNXIAB+CbPTFsHwDvIMWzyujPnmRh0F+LtjfMUk5Js7Elx+?=
 =?us-ascii?Q?ceHg49IOq8kQTPFRhqkragfZ+O19oDlRsHq9CzsVFz+pvXFpTKwv4cnYZWJc?=
 =?us-ascii?Q?fb7XUlwHWm5I/c6c7lvYh//FN9coWl93SkrH+IYOG9T/zJY2GAcOLp+qQL++?=
 =?us-ascii?Q?ATgSuQDOk7HGFWMb9M8ySrP4I4qJ+mlyPMgEj3ylKHqJna5NROQTSiLXtChj?=
 =?us-ascii?Q?bkDSbVmo50I0htfwl8u/DYW1RfqDGeeN9ulJf/nL0UtLnR84tnZuPPVr6CAc?=
 =?us-ascii?Q?B0LopMhkKrjsdq1gw1huakK3MQtbR7yX3lpD8FkOFDowLIZ3IxtzEf0ZeXkr?=
 =?us-ascii?Q?mXOyouPTMwdPO8u1iFERaB1ZU/rK6nvUBNjxvLxlzYuLCzDTGLTQf/F6CvR6?=
 =?us-ascii?Q?+jiIoI8bKAsitIpbIoKgzaf/3IYboovBREl+AjA2neemtKLOoMttPSV/X3yl?=
 =?us-ascii?Q?JqQe9d9lExfI593ln1RZBvpqAJSL9gXitSwdtIk/x6sprfVMYkTXn1Lsi2ee?=
 =?us-ascii?Q?i6KIiMTFxzoBLvGX0pLI0/f7YKcYAwzOqCnDbrU/UPbL04lKA34TiqscP+ky?=
 =?us-ascii?Q?yf0n/UytbdQOO4E+DPJNQz+8IsR+XGWu/NjE0e8fvSRYEwOlg2hwsj7HzPpx?=
 =?us-ascii?Q?/wDTWDEmlNpmo8ykdVXc3itCPyDPQxBMZqZ345APOAipzH50s45yxEFMvgqm?=
 =?us-ascii?Q?cxhmEelhshIfZsEoeSC7vnCaLIAC3MGyBXzKoBSmj23rIdbwWs7IvyqaBdxT?=
 =?us-ascii?Q?IBcJr2MsFRJV8O0QMTiZnxAjdnSIDGdrpMGPmkWASMFKx/e6Vj2+9NkSi0M3?=
 =?us-ascii?Q?phfZYFE8Wb1gu6EYqUt/I1hSpns9PCM2WxulzmhmdcTuGT90AHe4rs69dINf?=
 =?us-ascii?Q?cwQpAnaac9GZyYbzMufgpV5K3vl5rQ+VcSBqJ5JOBG3U47d/ln8Z27e/4Acx?=
 =?us-ascii?Q?pXBjuI7sKXGtV2vo4Z/6jYcHWns/cvx/j2bmRWCsM1pskRQFke00f9TbbDOV?=
 =?us-ascii?Q?E8VedKgUCD9XMF5Z3rmuIkfKNR3O4ppheXQmqqY8xB1iK9rNhWMxLL+WV4+A?=
 =?us-ascii?Q?hf3V5vB8N3SMHU8Hzw6k1uyEZEAZCHUURTG909zNpaVkCFVsKGX4Gb/us+DP?=
 =?us-ascii?Q?ApIzvq/Ha6iUHY/wmJrSEjRCi65bHyML7dnD1CoxxPrNvY/vZoe/3VtOJ9Ko?=
 =?us-ascii?Q?Xpg5OOpWqajICmO+34yaIY+l0cNntXmOQSAcMVuVaRnIFMij+qwh0hykpJ6+?=
 =?us-ascii?Q?1SMaVw2IVn32zBEL/7ufR0LfspjwxG4VBeemABWlWilHgYYiNY8BkeS6aXOz?=
 =?us-ascii?Q?kyKScJe4SdHrBHeTLy1Y3khSIWKysUreGdIRHWwbGO328y9YYKRr2XXKV4Jm?=
 =?us-ascii?Q?wYOK0/qk1rBWZnbSUEpBQ/Z6P14255v0xoQ4GW0kL6/XYIeOTVuPG61O5TZh?=
 =?us-ascii?Q?12jotpMKTP12155gIaLxO1A06wJ7KlohMmwSdi5FB2g16O95SCyxogya+66P?=
 =?us-ascii?Q?Q2l7waNjA22aNWGq0DsbLXRmvedgrlDWDNaacxid7cK1ME8Wl7yKV3bX2Rz9?=
 =?us-ascii?Q?KgKpw5/c/PDWt1izAwAr5gwk5RwzwkGlmelx7sy+ZxzCXViChe7IADTcc3np?=
 =?us-ascii?Q?wG90U1I7Jw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06352a5-e276-4c11-0fdb-08de8a2207de
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:10.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igGSdqe1RYJJ3z/v6ycnp9rvuSpDssQyDhhEG4yBHe32bdwpcZirkjfQB7IgQ4sUSc4Kp002yVqIEyo8dVdN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

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
index d464ad325881..a13d883373f0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -105,6 +105,18 @@ unsafe impl AsBytes for GspFmcBootParams {}
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
 
@@ -138,4 +150,71 @@ pub(crate) fn wait_secure_boot(
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


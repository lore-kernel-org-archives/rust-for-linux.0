Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B22F531B;
	Wed, 25 Mar 2026 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410799; cv=fail; b=mAxVPD0b7du2ZEJVjGW7aEcsjvf1wd9lrvOUX6K+rgLTkLiY60HCKF0JIdcPzFjsqZuHA/uKEkodpmzAZ5J4lHF4VDF3mM0MkaEY0SwGBwd+bvlZ0Dze3lH9BKRCTff32uoH1am6aq4kLdlwtfMqhAX5DNI7HkxcNHyJU7Glg/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410799; c=relaxed/simple;
	bh=Wp+6peDnWiPLjt9oJP7pnh0zSHeZGJOBGUv9TbqR7lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E2opeAjVq0ec1EE8nTXkoIQ/I/HIDOX0uSw60L6yYfRAy6ZCucCDahEK36R52Sk9daNWtunxXASGACuIB9hqZcJORej6KYdL6bL4x0GhyQW9U+aBacRxh42MWWmgGhNVoHTQ31F8wRWyyvaEt+iTmyN6EeXnKKU0aV2Vthcewd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=swQz/sNC; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="swQz/sNC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfjJnzfbz1JFvSSUiPpxtB0bxhUABjf99x1enqjVEGEYslySa86mighnY9q+iGoDSjVYSHq71qn7D8L3OEHYrneNfHPNiR8OpWmwNmaNm0+fxe5OtDO2RppEF6NPlfopmacGvUWCh12ws54QKwLldRy/hUhcWArCxmiwIf13aGd7q15JacLRznXXbQj9JBN5ea2RruQmocYK7/ABSesZGgLYIVNCsesxRcXV8YsQXnGURJivwQE04uYwBMSfUgbt857ebYULXbcc+8yfP2FAPhb9EtkdT/XdCK0LrhADK2wo90nMH/h1+NGM4HpwvGu5uzhtmG5GMTcYUQCGJddE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBEGvVEL1fl2sgzeCIZvbA/CLj0fkKSGpcJYf170uwg=;
 b=kCfeWllE5vDudlOZciJOW6pxZgn7GJaaIflKHqDcd74C38cMrY9MGtIILFiw/xGNlabHwoVJ2QQpPlNnqjzwJqJCOKSZwb7L46OwXEcFh9q1kvSCadp1k3WKSBqOGoG1Q9f0gDy3HtNVzhkcecxjRh4vKu+oxiAJ1DNESfnQkDus3ntfgikDhoLKClU8wp9mY/xSv/uW46b2JERQDJAjEPFPlVRhQYusFa08MMQDYUULx4SEyQoczxCDHsNxSvzY6g4PLmgVN8TLoeYpmwjElOnyj8U9oPCUUmdSReILi5QZkPoKwkCpfNpOuaGdcwqHHVXJ53y+XOupYssK5iyi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBEGvVEL1fl2sgzeCIZvbA/CLj0fkKSGpcJYf170uwg=;
 b=swQz/sNCLQv9EZUYqbRlccwMn63Te3dK2B4J0xno2vY7ZcvoYqnSFuoxW5R8P0oqWUp6lMY9v9zF8RVMnWG9Xzn5xg9/RdrVpp+KR2+WSsFbJxUhC50i/ZrOflN44qJ+OSb1K2DJJrNI3GfvggzHY2bpMbx2oe177CiFN7zj6LNBzXggpAbZHz6d+7VdCYt695blX/jdl3f/bPMnKL3EGY14ooockSliI09foMOV+tBHLohXG9QHFp9dUgu4KjbQvXf6wjPtb91dhL9ipm6P/gaUaSGQcTcWxfzPh1KwxFGF6YufepUB0Ms6yDOa8NwTIW1cVyK2n9ncrfg6YsaF1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:59 +0000
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
Subject: [PATCH v8 11/31] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Tue, 24 Mar 2026 20:52:22 -0700
Message-ID: <20260325035242.368661-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e853b53-6716-4d2c-d018-08de8a22014d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/owAu5tJRCpH3a7q/XT00LO1bVW6RdMVxk8s4Jow+wXHQIvrHMF54UV5wv4WW6KlpDnbWzogAaqOXc1lvuhqiBd3ewqyvCJr7pTXl/CnfBdmX3j9mq4ZAqGReCl/xNtrWaG1BG+qNlAVBG0YV/fuVFsPTbfH+0bTcaPQOr/ffymQtUl99F+F5mZOovcYVMWIy52GM/NrkjzKudiUY8O4dbgVvuwBQvGQYG1/gHpCBiIh4rAmMAh7zMigi7neKBIPMUiIUTlfEIejNPCT+YFCeeZw7zJdUFDA+3QrbWGPf+1Fy6+orGCvTo7qMyJloPOYCL5JCHpYbK+PoggPVzgGihG/lHx3Cs0Th62NSQSCjqTRL1TUSQJz1KvFlMjzl6y9Y1zl6T5DRgJHXPJ8MxoiVR6Uv8vk1aogAWrxnxqigShdbj0uxtf75rC1ShCzYBcetiBauTc9vT2TilUGwL/lfaq1H8ibFlWJwuJ2/iRN1y4hMyK7RKkyH5HDQcgK/sS1PqedAX4oG7mTI305zqLxSuimT0/KNEWcYP7o8Aae+eZDVK94mhrbk0A05HE9zldOVAl4SurKDFWoyykGbc9aCcOn1M+fifsRbpJZR+7YBlX/+jXWpGZ4BwnCYpNZDh58vp8NpHfmdJrihzwDQHKVDAW5QncajtSCiNu8W+oF4lV2A/8yUY18UkZIibdvrLyt1GcHnnir1f0BrP+S+pcAjOWH59fGJSEjG/aVJbv/dKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n489teVqxk+Y6iLZ86DXvK/r8flQqOPFrZpZUOTW7yAZGZ+5U86NF1g8AAMu?=
 =?us-ascii?Q?hmo8ImyD83FNXZVh0XJpTY2FZMYaCmGGQXeaUpdCX80hVpMRpThDpVbDAmZr?=
 =?us-ascii?Q?JBJl+IgrUvGKFjY6UXgcWi7F3fmzLVOcYpj0cbTxH5v7gXKYh0yAE2cG42XF?=
 =?us-ascii?Q?nDqb45n6OQVKk2BhrTbIwX5ehZoqQMu8OcWE9+LZW07DFXTpe55TL7N4unTm?=
 =?us-ascii?Q?ATdYihY0V60AZMzdmIG9Fc5b24XEqglS1ioqpp0hFuski/L9Nvs2Q7zT2p4j?=
 =?us-ascii?Q?USzAwAB0GVAi/Ub2LHek5sZ1h4SmbvKAfsr1p1QyB29w0/TeYCSf1Ou9EDzN?=
 =?us-ascii?Q?vJBF0fQF1NV8E8AebIoeKt/5VgeYB552qUGY0hh/MUOmE7INJhBfzygik1XQ?=
 =?us-ascii?Q?RYi9JZrZFLTVGIW/t/8JEmeFnwwjjbFtymecaOaPBR28Nq0meETxj2+y1QQp?=
 =?us-ascii?Q?4/+jF0YA1n2t5Ws+kPHDCoNrF0tuqXORYBY+CsTwvYBBcCTkGtVi2p+en4cE?=
 =?us-ascii?Q?DeZt5luVe1vYoq/o0Wc4NiRQsJMyW6iEUGA2514D9TQrfgjgwsMbK11m5VM9?=
 =?us-ascii?Q?8xUen9WIBPvVai5WPUcd38Mp2TKh0+qmLPrvW8QojXms43rhDqck18ySZ1AU?=
 =?us-ascii?Q?1UHip4EgtPvovPKEMjaC0nEk38Gm8Xb3MSLsAG3FcIOf/dcuK2+UdvH73RB5?=
 =?us-ascii?Q?GgpK3x+D0Az8b9PyWTk7Pe7jarjHAwtaU8qnna0j2iZD+PMj665hIpDTXnZo?=
 =?us-ascii?Q?lpuuj2YGGSO9prj+dU7zW19UTgL0cn/ghulRt2bUnpTKVGKmaiN13dd/dRpd?=
 =?us-ascii?Q?jlFHxIJUy8cwlxUSaMbzK2S5/5boxBTWMchDIVxpZfoljirwUaPujx9QHgDG?=
 =?us-ascii?Q?mTM+KV2luyy17QzL/cvcXm5dE6f8Gu2gQXmg8nKeQNELuKLET0bdUT0IfABv?=
 =?us-ascii?Q?Rbt04dsKta6nPnCCwrR0UJ8SXYsWB1IXHy+xWVAyzhMP+37E6mpjuxCU1sSy?=
 =?us-ascii?Q?Ywtkg8VfYNzakmGyndvK5EDVUSCrkksRELous2uZtDGY4h/argHs4VS6R7po?=
 =?us-ascii?Q?3gbcuLQpFNZOID3JLaxM5WLiZ/lZ2yLWcztCo4fiPKSqDzVzVewOtP8zieXU?=
 =?us-ascii?Q?ObmUsNH9ZII7+8DXmPxLjZDAiq5fd68qvW6/4jF1bLkBlVx3vGsnAY80LxP4?=
 =?us-ascii?Q?TYNTNdQ62XRVBKnGwu7OUvgwe2oUEl+l07I40RPav7W8Id+7ocNJ5scP0Xq/?=
 =?us-ascii?Q?gOlrBczUA74F6l1AK1edvR28JWic5M/J3Yrsk8/RlvvcY5StktbfPurGK1a/?=
 =?us-ascii?Q?KAs5FKMycDqOsLk41WbjG3g8C+3CIN0eNiT3ctuSsRPhBd/k7t38xWILzDAs?=
 =?us-ascii?Q?+Bu3o/etMfYYMXYV1v5MO6v9N7kWDAG/kwTmn652ZYrBoUVYKg/YpTGQpHSt?=
 =?us-ascii?Q?yatRkHSUtX6990v0aiAUqreTUJ9HCWdXNabrmBOSzB78eXoab2aYh3nZYZfP?=
 =?us-ascii?Q?XDsqkyVYjXTusjfaGlmKkMa1WDhxvOcr3HZJfr34YhJU8tp+ytPbQ7r+744t?=
 =?us-ascii?Q?0hIR8aVbCgjsQF0uGj36znliJubNbtGp7kDFIv6xTmF/XQMDCMyhSIT9Z+Qj?=
 =?us-ascii?Q?vMJVe2D8qUjkOFz0ynMzCEDALhoSu/jum45MH4/N/zaA4rQril4Hhw+tZ/Tc?=
 =?us-ascii?Q?qHf9q5R9+so84L8R2gvZjp3HlSeKXdC1LLzSjuch4BYvEOee5kU2xUQ2bEMG?=
 =?us-ascii?Q?laLjB6p97A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e853b53-6716-4d2c-d018-08de8a22014d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:59.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLIaGzd4aEy4GPCedTlfKwCpHtD99rvH5peqBc0aeH35mWqyEecf8+awudhnAvMQ7rUo3TmugJs37kJYEw3owA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add elf_section() which automatically detects ELF32 vs ELF64 based on
the ELF header's class byte, and dispatches to the appropriate parser.
Switch gsp.rs callers from elf64_section() to elf_section(), making
both elf32_section() and elf64_section() private.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 22 ++++++++++++++++++----
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0745c332d4d..bc217bfc225f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -634,14 +634,28 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
         })
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
 
     /// Extract the section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Format>(elf, name)
     }
+
+    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
+    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        // Check ELF magic.
+        if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
+            return None;
+        }
+
+        // Check ELF class: 1 = 32-bit, 2 = 64-bit.
+        match elf.get(4)? {
+            1 => elf32_section(elf, name),
+            2 => elf64_section(elf, name),
+            _ => None,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index c6e71339b28e..360cb7014073 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -93,7 +93,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -150,7 +150,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0


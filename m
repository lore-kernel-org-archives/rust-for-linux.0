Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68AD38F235;
	Thu, 26 Mar 2026 01:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489182; cv=fail; b=T5v+Ae1WhDb7tWKTSyF2jJG58UvmJRuq5JzpJ7nR8+INtr9eal+0yRZuoBW2YCLTEy4y76WQuV74NzjcqmWQXY9Uv4v/DzzUMFbu303jpr45wrGSdW4AgKIARUHCqg6PvHAX1mhb1HuqrkqfrH7T/v3Y2BR1/Px/Hv/IRX2dIzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489182; c=relaxed/simple;
	bh=ngDJisWsseC9Dl4NS0VFZxUdyDU57OOiO1kmaTNruXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1YAZVKPbWlEsmxyYC8fAZKFzV3XXrkUj/2KbgZXlri4l8Q8EJkTLXo13uBg5jLt0uEzGG/61fm3+V+9Fi43ncxvbYfV6Aqok41CK4vHNagMQQSEA9PpMkmx2hKlwOeQCcKlqXQrxUQg7bl1w0S3rFkpDKQ2lO4S7mi8KsNfTf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SJgV0Lyf; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SJgV0Lyf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3KnAZj+8bnNH7i4Lbsr8s/hPuGLveu/sxhG5aE6bO+dWoDCeiAtahtcxS74FxTHw/fbowwc8MZiq0w9a7BG0VEDBIqzbYVvON6323r6oD5j8OXD7l5JR5Ic26lp/iknbuYiCHlWMM6jp+p/m1a3TxfO7YmX8N9KBrtGRYX/PKAIUbIcWUDRv9IhdEh0hU3FolCrXyAs3IaC5V81gdpTMi+1zeXrom8YUWjQIIz730ZOEc91dM5KltyGOV+OSWY0Z15pHs/tO64An+z/6QP87YpekT1eGNKiteA3MDrQfXjmHiBJjXssPozDkaKcKe3dDewsE0AAHx7dYHiW/SJ5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=zFW8D0x7wYKWDx8YiijLwhg+vmVO6QbyaZANLHhyMT+Fi8EiRnIDAnBz8dH0m0jqd8yXnmhTK3caNezZtGK81OzQHFbC/3XDDFap8iKGlC/eV5E9AOHZoyq4KpT6skUP+SfJvTItXOietOnFirSF4WJcfhAWy22G7/bHJymCRLRtAHGp846uUK3fZUGb7m4OIrrP4or3FZMkbRi/bfhn1KB6xETLY+beeUJNzDSd/CeZ6IUd5zU5OEUUuV9d9NqhT5TvZxyMfKe6prSutVxEkln77Uy3ez/eh+gU7N3AgGUj2LoPFCwLpTILAci6epkwhciXo4im+PbVLW1QK6wZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=SJgV0Lyf8dugCsJQmWu1wdN2ShRp6ld7Ls1bzaz+8XLKYKdMqf4vl25uWK92TDhw+D/djtO09ZlsAieiTYGEAmP1OBP2Td85CS1ES2Wtuq9prA3bWeJTMqI5tcC45NGx6P9lCJVxZuIm4jHbKEgmsHwkhkFDw0jSFhYkhPPnbInWFEvUhLEF3rHTAYygUHHUv6jSKlbTC15Cnn8UM0XhdmuYf60j3E7WMrbJ7xeaJRm452w6raEs18G92nLlK20kGhRjUgGdaI3ZDdlCd/k9sTrRwAuCgxfk7drGbJiSpfDjoctu56ra6zPzXcDKPe7Y6lxLxnIs196vz+VnGRhdJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:20 +0000
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
Subject: [PATCH v9 09/31] gpu: nova-core: don't assume 64-bit firmware images
Date: Wed, 25 Mar 2026 18:38:40 -0700
Message-ID: <20260326013902.588242-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd6fcab-855c-487d-b10f-08de8ad88011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t7Z1sUI/assG0sGqyywUQzj4JM/TGBNu97BosTXLyk9MiT8BHuzM/VOqCFXEP023bG703XVenxzbNrp38HZYpVcm6rdUbLHCv7mJXyE/xuXTrY83Dqn8GGD449hS+K3zCagGjHjtzSanjIFSB8FVFIvF3EU8Hx4KtqGD4qd/zuufzhA+/UsfVejhwoNR34VxV8FlDtvbELR4VGWyHmKAgbjBtNvNEoKpXCBm4s6SyFMXpFcMptQK3JMgV44+eQNiVkMbOm/3bp2zdfDIbdNMVpUw9f32GCjLI1nNkLhAEDHSSRdoSPJXq6SK0NqfRs+Q6pwFrqamfocsP3vR04v3/e3aqf9yMDrL7xD1/hwmKjYcu+jAn7xO6NAxZAv65sW3Z60umbqcXfcKiwEkW5TuImliaqut1jxVNB1Qh5ikzChXihBBvYed4rH9RB1ZjAxhkUhqMnQNCxJ+H+aPXt046N+7SCDAUgCDwic8tP2nW8dvuRPA19S4UY0f18LEApsFleozW0H4d1vIgV8ds3MDI0rJD7ZhePoInR8G5MOzsXXRMHp0ebAdH/t82o0fxrJGulob/rqmqz38bYM+EVm050/dsgbUGZsn5OUWY8Ji40aLGxcQgnhja/QtnyEFhurILGZHgM4EvsRUAEbcZbZ3irAI/uIr/76R7uhwUoVD0BDfDX6dDyUSguakKKGuJrTqTJbJisXMQ/NQf3oKC4Fi/SXPTDy9R4VHzv2/7oyT/u4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mQxaXC3qD55Zs5YGkMJGiXBqBOcoz/6uI72OGWAjniPS7/zCc+dgcS8/1CWU?=
 =?us-ascii?Q?YqL3Vv38lD/6/W5L67OmxnXbwjnSk6BRPo1zf6C4eqdfM1Cv1WAFMpmBwhOC?=
 =?us-ascii?Q?2ZPwIAAOVTfRr3WYy3wtfNYdlu7+s5/bYsFrfXZi+HASaup1F+xFyHzw/RVr?=
 =?us-ascii?Q?iSIgdLRl0xHGMJmPQJbbb3aDqlYH58EH8tldYvgV3k1HWBQv9X/5F3JCqcZo?=
 =?us-ascii?Q?aYd3wwNtovgRbMUtly+hSiU/eW1ITBJj9tzVUC6GkxtEWw/m0V2ANQ6/AzWD?=
 =?us-ascii?Q?T0I2+J3kFDfxseuCJKOL9SRnx2lkWe3M249eWNpBTAcndIuefL21KI5I3/dS?=
 =?us-ascii?Q?uNw/Oix0QMVlqKfaXxbppnsffpFmbz2svlgYVG2TPODpl3E2uB4HukvR93e4?=
 =?us-ascii?Q?EJ0vMDivxny179f3LNNZ8YPcVQ/89kEMsm4XYSyIB2j41FDJVED9VNQE2l6/?=
 =?us-ascii?Q?JWBEMSpi752Xe6Erxg1DfhWAJEIMZJLiScFU61c2ob2gTx10/siGzcQAShf3?=
 =?us-ascii?Q?tkIPXSDCP9XnPuk8XVQuqbZadABoiDeIreq9hjyGg/L26bt2ho38m89UnNgO?=
 =?us-ascii?Q?lMAru+tGxIPChmJnGt8tVyyN1UzVU3Mfvigc8w4c3iqmPjieL0nLDJegMlc1?=
 =?us-ascii?Q?V+pRvvAa0kimlgVvN0XPn979oEaC5audgbudw0yApPmwbpeXumFeItQuuHv3?=
 =?us-ascii?Q?w0NauC7LUG+6wdwBLYjbw3MsS6ECOOa/ZuWPP4Q3RUQ475rV4BqOwxmxpmA7?=
 =?us-ascii?Q?5mRZjywvmxIsA8s1ettHqHDoVnq7Tu5a+yFPJ3eeXeHIxujmhuXeA6iXsyK2?=
 =?us-ascii?Q?4i9s3s1NbIOH0YmdCszY4/d+TF10GzRGIZtBCGthbRIbjnPQCnd//75IMRNR?=
 =?us-ascii?Q?S5DvzKS/TvP6ljIixZwvY7EIpzaLcLJ4EWwU8jbMgIfzk/HLL3UHXx95LUIm?=
 =?us-ascii?Q?gIOYPps5BuYIeI2xcCnIa37cIpdsxEIPmDlr1bjpH/NO6FOmljzQQacmZgdy?=
 =?us-ascii?Q?t6K20aeIQlAzD1o2O3tHYaf+xqrKIXesmT6CZK2958UUL16byKyvCx8z0SW5?=
 =?us-ascii?Q?LQlNfxhzUYVVg+U4Av+o3sJhEizQ2MoUO3Uevnlxo9Y6PljODWFwx+sYsxWh?=
 =?us-ascii?Q?6/f1GtixlFgDFPuLeoOgUgjEo4oUZDm95BM4IdoXYQOzniwLrQF6DSWmySHo?=
 =?us-ascii?Q?Wx/j1kHB6asZtXdan9ygG2rcG+NZYlHb7gGs75I73K0LCE7h1uiovdw0WYck?=
 =?us-ascii?Q?HmJl1Ohnsg/RU++L/BBOOM5/tKPllNfvt81jJ52DCEvs+FJnMcHK2xS+POdL?=
 =?us-ascii?Q?pjncV0J4ObRwU54mUS7J9BdnONpfrMHjQBwpuwfOj8++WVxoRGQ9wzk/AVwJ?=
 =?us-ascii?Q?aKCTbJkx/Ttct4H2m4CvNrCO06b2rby1cbq9elFTb2Lf/mwVCPpqu0OxL42L?=
 =?us-ascii?Q?iprOCKR3HbmcaV5y3y8jeEYeyhp9DF5kA3OD4zPyGFIJxrPcfyWKjYqenTYb?=
 =?us-ascii?Q?F4lrAE/TewF87BhrnkfHLvjsjBIOvKDZNkAHS1Zq8uQuQ1p0YibY3OrrvTPh?=
 =?us-ascii?Q?o2kHI1pRm3XflmFJGUBCpna+L0c5fT9LSiZ4SgfuADih9jcluilYzKDyjL/S?=
 =?us-ascii?Q?DdFdKBhGvKQZamg83obhwYAtL3o5NbdtV6M8KjrT1X+Dqdw1CisQAFzf7Lhw?=
 =?us-ascii?Q?P1S3+GOdu1x3a+h/rMgCILKvPYYRJA6+bBl1/l6RL+e0LjBUyeHLvcS0EE9h?=
 =?us-ascii?Q?rVNozOP+gg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd6fcab-855c-487d-b10f-08de8ad88011
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:20.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRnEiXjveALaDKhF1WPw7IztA85cNPZSuNGGjWt2yWAGf+FkBt9YS+6sUyhtfjEi1aqhGW0Df78ffwIQSF9sRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Introduce a single ELF format abstraction that ties each ELF header
type to its matching section-header type. This keeps the shared
section parser ready for upcoming ELF32 support and avoids mixing
32-bit and 64-bit ELF layouts by mistake.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 111 ++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6c2ab69cb605..46c26d749a65 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -473,17 +473,72 @@ mod elf {
         transmute::FromBytes, //
     };
 
+    /// Trait to abstract over ELF header differences.
+    trait ElfHeader: FromBytes {
+        fn shnum(&self) -> u16;
+        fn shoff(&self) -> u64;
+        fn shstrndx(&self) -> u16;
+    }
+
+    /// Trait to abstract over ELF section-header differences.
+    trait ElfSectionHeader: FromBytes {
+        fn name(&self) -> u32;
+        fn offset(&self) -> u64;
+        fn size(&self) -> u64;
+    }
+
+    /// Trait describing a matching ELF header and section-header format.
+    trait ElfFormat {
+        type Header: ElfHeader;
+        type SectionHeader: ElfSectionHeader;
+    }
+
     /// Newtype to provide a [`FromBytes`] implementation.
     #[repr(transparent)]
     struct Elf64Hdr(bindings::elf64_hdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64Hdr {}
 
+    impl ElfHeader for Elf64Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            self.0.e_shoff
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
     #[repr(transparent)]
     struct Elf64SHdr(bindings::elf64_shdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    impl ElfSectionHeader for Elf64SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            self.0.sh_offset
+        }
+
+        fn size(&self) -> u64 {
+            self.0.sh_size
+        }
+    }
+
+    struct Elf64Format;
+
+    impl ElfFormat for Elf64Format {
+        type Header = Elf64Hdr;
+        type SectionHeader = Elf64SHdr;
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -491,47 +546,49 @@ fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
+    fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
+    where
+        F: ElfFormat,
+    {
+        let hdr = F::Header::from_bytes(elf.get(0..size_of::<F::Header>())?)?;
+
+        let shdr_num = usize::from(hdr.shnum());
+        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<F::SectionHeader>())
+            .and_then(|v| v.checked_add(shdr_start))?;
+
+        // Get all the section headers as an iterator over byte chunks.
+        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
+        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<F::SectionHeader>());
 
         // Get the strings table.
-        let strhdr = shdr
+        let strhdr = shdr_iter
             .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
+            .nth(usize::from(hdr.shstrndx()))
+            .and_then(F::SectionHeader::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find_map(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+        shdr_iter.find_map(|sh_bytes| {
+            let sh = F::SectionHeader::from_bytes(sh_bytes)?;
+            let name_offset = strhdr.offset().checked_add(u64::from(sh.name()))?;
             let section_name = elf_str(elf, name_offset)?;
 
             if section_name != name {
                 return None;
             }
 
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
+            let start = usize::try_from(sh.offset()).ok()?;
+            let end = usize::try_from(sh.size())
                 .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
+                .and_then(|sz| start.checked_add(sz))?;
 
             elf.get(start..end)
         })
     }
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf64Format>(elf, name)
+    }
 }
-- 
2.53.0


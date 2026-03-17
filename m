Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416583F7897;
	Tue, 17 Mar 2026 22:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788063; cv=fail; b=uaRKvMarIF18qlvXGFINeqDtFYLv1XYpVu4iTZ6U6XvaaSQ4Gmoqc1YfibvLWEaqGlYIsldXYkEWIGMDmqEId8BaXpBbnNfo7Q3701I8swGzk0jwdBfpssISjROUQ7uJmRxDyEdAYMd4sDDiV1mLxNgF2q/TYGw7reCjszbWYLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788063; c=relaxed/simple;
	bh=ZND9T1qy8PGDVKj0AUdnQVghUXeBCu2IaYStYDMrt4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OzqXur4fbmlU8NGny7WG5FapeyLhEwDVjNYlkM5Dhr9W+D2CuX7dRSnrBD6xAQS0qAY7lv/vmsvfzOvpZdsNjfuwXSE2BYvoUVcCPGCe970z33zT/8Oe+wfFaZkjA5KRLJBGVkgp4GBcukE32MtKwirnE9+il2MXxMD42GoRqvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qgsPPAeH; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qgsPPAeH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAi36eSjBgXNs5IIpi3g7UxxebqlrywKLBLJ+hmNpWRmXqg9OEoLkuZHjlWHPN0IQDHHt7H/NgSpqokfJCsXdCiFDI+9iWsYE0abQFUiKc0t2lnHU+GT8q85krXQmXFiTs7N59lK7/YUoMLzQex9oUZs6GcynSBr5bMDJvWkUtaZj69TGi6BCJMbOd2vg+yfE/qcHKWtm49LvokzmaKMr/BcBZwgk5SMEy71IRu5+ew0cZdYKH3aIdAH1zmJLyTd3UKiTxbGyRZiuVPrMuKojppwsdtpsLWt6tCIRppmdWjtsZk7Li7X/0B3/k8oidTBmQeJrDu2cCRxzi1AkBojag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZiO5O6MG5ofTZp9FR+rwIZtnrrXIRdY2DIwPxZ/QBo=;
 b=NiQhdkBdH9KWPw1P5HvQqFMit85wbJslNMJnN28BJSyhf50D9i/0bnwj5Av6mJewJxizYjf8u/npdujLTmKf2S+6gOnnX9a/KEtTNdG5ioTdkvvqE4rqVcH+5kqvkT6gV21RQa8Dp/Drqu0c6daaW+z23HwARfcftuTBmoRyKi7cGnLRHDkoqfQiGcM2Y2kxrFPslr9Qb0sKqn6vlvNELCe5Y6i7uya6qme8UAGl1QvMoRb9Itw+1+yWS3dEo2TnOhUVp1B6lvGOF1KmZo345Z1RdU9Ix2zmUM4+LaJIRFSheW/GWtxR3vdbT153K0FXY2Lle2hH4MlUEuvYk7Sc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZiO5O6MG5ofTZp9FR+rwIZtnrrXIRdY2DIwPxZ/QBo=;
 b=qgsPPAeHZZfPg2AdzSccwTW2269p+9kCTLJUQxXljb+LAOHkhDQlxPRJ2KNNNDtp9+hKvStyX3vMYF1emb7EJve9fqPknZaqLjSif1LoS8cDjzQyZwi1nlEpn4gVu0UXh69s1je3DTekBejp24uAppNDmJ5Gd7h0gCZjFJ63m8LIWExORr+PUB5CcrdGI/HOlJjGyYRDHsynHwk35RGkXKa5WGmQc32JxJvr1HutsoXOWDPrMU7zOK6lBWNxJqGqdyFQUjzYnRlhygAhFHCWQVcnhrltwPszia2XXNYPThbW6kKPbll9WXG0mn7Nb4dauz0NH2hP5iq2In4eMhT42A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:07 +0000
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
Subject: [PATCH v7 07/31] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Tue, 17 Mar 2026 15:53:31 -0700
Message-ID: <20260317225355.549853-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ae53ba-e0f6-486b-5fe8-08de8478187e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AzAp1+P8QC/klCg3TY9I10iF/a3fSedjKhzQpGu881PecmfnSZTNsrQlQ5UD5szCFX8f1VUd6fUqcIPphcOWoy/Z4aHZbj+fSFBVG0E+QMPF0PVOBaClR4rDOB9qS0/9hoxb9898LKh5YVCaP9jn4rMiF/Nqqdts95GHW9XPNI/EH6GBIFXmkIPoWpgwEGMikXoRj/apIDoqfiJrXDa514XrA1bqech8JXvnpwkcBwB8Sjinqv8UVmBKFFBEy6i9h0ePxjnKS7vqs4ieTMSYvCJlY9kCW87OgldM+JtztLMa1nX4XeBVbY0kCaUwVUQZgkkrIxKg36uYNaU3TrN7hadnUe5pkNUtDh8SFDiCsDiU+KR3Dmabaw6ty4SQ/zIz8GhCk3kB9/42NrjlY4Asq0rV4SbO6SY5gJOUP2GXXpnAZ69g+t1ueZZZIAiNx8c3/bDWq3pPm4DjEO52C0XjY9CapbTEq5QQzbNFTjFAQkDgrMLO/3qWDLj+Nk6SbktbnCdLg9xfArt/hYmtcv+le6nVLoiQjUMxi7yGUpzEfigYJcXDfs0b3ZFAY88vUS9oGTWVWqtQ1flI6buONPQcKdDJORA6lw4w3WQAIJkkn2R5Lq4gGgDvLoOaLed8NAGkwbxLJYJGI4p4l2NDbd34atzkqYAnEj2C1XD9TdTwCRHNZ/V9wHdkpB5fjhDFzsTb732Hv4zz4k6CUwzSQckM7OTomTm68ryG1I36mXlI3R0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nUPv8ZjfPVjSyA83bZSXJx20HlzArhTvP9h8NcOTe7UKqcl/fq5E/A9t32xm?=
 =?us-ascii?Q?sSbsaLGNfU+SxA+MPpkGn6i7/LDu174Yxaq72cdvjxyM8vb5gDMVK6zPxs6f?=
 =?us-ascii?Q?+4beVyr9QRr0FdBnu7Zo2zCeA0cJ08Cf/sWzmEDCUrunVFWCRpI5/+PQKUHI?=
 =?us-ascii?Q?4sKitLl7H0KyszEWvlKhG7Mbr10dFxSZZdfSCtDINDBJOD4NLPRBGr3AoGJT?=
 =?us-ascii?Q?lImLm5FqrWEHAKpmIvUK1bqGux1xwCxN8CE/NLNeGJtDF46R9SEpvzmc4iIa?=
 =?us-ascii?Q?GFpZvt5rZZGDihx1jOhSGk75PxLNukP12CO+bNGptBLetr1Y+a/PCVpm5EXo?=
 =?us-ascii?Q?zmAJJQbsDXv0bgGKYo0ACJLaf+4rQUayBMveUs9pEcdwAFvKOgaGNY+czT59?=
 =?us-ascii?Q?ofAtnTpYphWQy+hHzeQIx4BBi3gj1Jb9jtKrkhvCgJ/PqtC9dZVhxFjQ49yQ?=
 =?us-ascii?Q?EAfGCIAAEjseI+nZBhom3qEuw25h/4uV0q/cgOqTqdQE5DUwRWbVqEgk4hh+?=
 =?us-ascii?Q?wTEvP6s0sB/tdyYX4lL82Mm5H4C9S5UeUs+Si9s7fwzFL1jsmPrLHIKd90AW?=
 =?us-ascii?Q?16i90bdgJ+2GulOasmaauetrpLxIqx9qROda/ummltcKcpODHIDtuHqIOdWX?=
 =?us-ascii?Q?pVRBv0FQe4f3OcjQLpjGprnk92vnN+A1KXRM7Wxfwpb2yTC0mShlw93+5Xr4?=
 =?us-ascii?Q?Qdv+WnfxcH5t5aRNGIy+sN5YxJmDkkMxU5WK1y/HSXp4vPMnJEPfulm0JIXm?=
 =?us-ascii?Q?WBhzBPa0CHrDZpdwvKNv/ICo9YpOh8QbHs5OouOiM+TpkzEqT6I/wnKZismL?=
 =?us-ascii?Q?ZPNnUv1ko+zwIJbaMUlBy1NYFSm7UOG0rPKESScD/+/GUfeR1aUgj5b6f+1p?=
 =?us-ascii?Q?VtUEf+WtPD/Uc5g2elg9/MdscgFeCrbCjGXYjA+nuE4XQ5dL6ThuDLMsdN/L?=
 =?us-ascii?Q?rWbst7ojexuqClgOO/QYd45jTwnIBYtGezPbRd1jyC7jE48HUG4NsCCxqSNw?=
 =?us-ascii?Q?FD60o1TTq3FEKoNWlCUCoIed2cAJnA7ZapcQwF8M8Dz0mLTqjcmG7ZK27WGY?=
 =?us-ascii?Q?wfQ0TXM6Nx3JMoAC9XmC0D7XW6hWlXEV9E/xay3qvozb+icEwGzE0Kt7sfOd?=
 =?us-ascii?Q?yXIN5lVig2jX3UjENmtfAwmN5OBLRi4K7iTHY9n0j1Di9OyUQKwU7MkyQ5m8?=
 =?us-ascii?Q?c182TXkYdvseIgJlr9OdQm22oiQ9ucR26ga9J6Jy2m+rBolaf0X9UMtuX/nF?=
 =?us-ascii?Q?Npje8r/e3ruAPH5C1E54FGX1gLp9ZAQ2KaXSRR+vKLDbmztzgUDbwYJzU6k1?=
 =?us-ascii?Q?Fca0f5dTAtse4aUYbfkq842hCwfjYKSB4Kmca4oGx62JDwapgeg9KHHyeb73?=
 =?us-ascii?Q?ykaCUd9ryqtSeDfRG6zrSJDJve7RETrs9NIW7g0u35RO0TY9oHMuf4tPQq7W?=
 =?us-ascii?Q?MZt0wIYAVwUz64Nes13KrhtYoWeJp/cr+uWWohtvavvKeBPNUC/Lw6zx9VWh?=
 =?us-ascii?Q?3lJmj23Shfg0Do/CkjFniAmnw656q9wKU8k7pX1/ClZ54SucdAMVj9zor6I7?=
 =?us-ascii?Q?i4914BQ8rHJ+Bhxat1SI+llHsoDtrZS9KWUWFyC+wZco6BvTI2YTelu/C9jw?=
 =?us-ascii?Q?g79QviOAxEoidz/dNc9YXBM1RI7GwkD5eCyPfYFW6aeIqEydDDejHDJMTtMD?=
 =?us-ascii?Q?hn/x/C1lyro4Qhp7KN7kF12BKqWAn9doNloedv6/+reX2W5XXmCksHUXgruG?=
 =?us-ascii?Q?mb2LNPcxXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ae53ba-e0f6-486b-5fe8-08de8478187e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:07.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvJbokAt65zmTnJV2PeycY//0Volwgg7cbAHTFBWUr9liLTu7odKDZFfq+Rnqfk/N5Ds9kVeeTuz77fncPe3pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
 2 files changed, 94 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2bb20081befd..177b8ede151c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -457,3 +457,91 @@ pub(crate) const fn create(
         this.0
     }
 }
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use core::mem::size_of;
+
+    use kernel::{
+        bindings,
+        str::CStr,
+        transmute::FromBytes, //
+    };
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 8bbc3809c640..c6e71339b28e 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::mem::size_of_val;
+
 use kernel::{
     device,
     dma::{
@@ -16,7 +18,10 @@
 
 use crate::{
     dma::DmaObject,
-    firmware::riscv::RiscvFirmware,
+    firmware::{
+        elf,
+        riscv::RiscvFirmware, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -25,92 +30,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use kernel::{
-        bindings,
-        prelude::*,
-        transmute::FromBytes, //
-    };
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
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
-
-        // Get the strings table.
-        let strhdr = shdr
-            .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
-                .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
-            elf.get(start..end)
-        })
-    }
-}
-
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
 /// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-- 
2.53.0


Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A813F99C2;
	Tue, 17 Mar 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788065; cv=fail; b=KO3gBg/I3O3Qi+Fy5N7T0vVzB8IZ4/9qszSTziV5O4YZqazlwSgtxi1CxrBAd8DPlEVqTfAX+reZbONMbmpp8KQZOoN7/+voob0eJeNTuZUbh4B7/V1lS48nE8fPSOBGmzBP3tb1+jvxE7TkMNBxWzzODVUX8kFHVLMPVoWzKkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788065; c=relaxed/simple;
	bh=ngDJisWsseC9Dl4NS0VFZxUdyDU57OOiO1kmaTNruXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yw4lA2qi38Amp9fM6pbMcABIevIVjfsOHTTDNj50QOQ7KJRm8ZCTWY/61XmExtO7sgkXbDtx6WbtCm+Y68Of6jZG5T5ywJFbPIhjldbxW4Jh6+zVd1IjY99DiJk31GEcmplMUrs+38MEW0zpOBD9TQBBmko1WQiIxl9OFgapzWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bC5iG71H; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bC5iG71H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScIhMTL/pvXdNH0Kfs54RHxF33pjCTvCylQAzGKUsJbF0DwAC8yPxtI0lYuLGYSe0HmiUd4jwPtiz54BURUH1dlBJwq9uTXDbpX+K5ymsTW8XNZfDOQwKQRKsJ21R2FECXPNM+w6/Ithd8SAz+QLPIDgkPnF1sgpdodvpI0HMs5cKpDf1cVO2ND9G54+Po8V6Ufw3Zb0oXGfH/HJ0mfCndN3KEtYglfz9Ansm2WnOySyjbNTeNbBiEf6I7N6mwcedm1Ox1Iea6jWiAT4ntWXxJfOjz9Xw2d/4Xu3DzhKGKNQWVdf7rdhq5TvNmdmHAz+m6OZDFK9ZYmcfWcBBp7Ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=FEyNe7w1Voili2VsVLD5i6xO6yBYTbboxw0NsIVVoJJZ1cMWBVvg/+uYv2nHUZkb9WK8GxJRM2s00YYhwdEj+sVw8Cf9qh93jJ+CU0YJSiBxlHYG/FuUHwjNk31EroRXSmiRqOhZufRULsG5fcCcoMBVRynUBIxslR2KXNorFO0HKIcIu1JLWeaPMJ/s3xj4GWRvgXGMpckv9P98QRuQOo+C6zL7opu0rpHcfsfR0ZuW4xdkkKQMsfZI9SBsL0XjKV2AyYYLE4XBYed3Fee4qnt9oSfVKWkz9rJGvBS7sL8l17WG7wXm0f8AfS9O1eb5l/CdrGZVKkz+zpNLcVw4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=bC5iG71HrFx4DNsZXQ1huTxu91Xj4th2oejr7StB5naJXwoHsYVcxR1ffIngNn+ju0g3E6OlcRU/XgkllF2ysZfeytA4M3ybF2cbmah+ItlzFWMR20eIjkoH2J4TWJ9UDtbFZxiAKCdEkVDompCX39scjzaObum+/LqmdUMY/78vTEYz7wMsjheDQCjgq9nHXq8ega+pp8cFhITdp7DQ4LvTqKOFbxO/Nl56DKuD2+L7vsA+X2B+HiyqHIsTTlIycj5c3RZQub4gJn2qsebdd6OZtPQsgxDchQUAiPHaMueXP3dSQNpbvni7VxsaxicH+d+Qbck5HBCyAFR+4yxTGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:10 +0000
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
Subject: [PATCH v7 09/31] gpu: nova-core: don't assume 64-bit firmware images
Date: Tue, 17 Mar 2026 15:53:33 -0700
Message-ID: <20260317225355.549853-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: ddff0044-2bb4-43db-db54-08de847819ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XpGigjrIvehTK0mTSv123eNJZtGLoIVYbJzXKzrSlX2egLhcmJaTWjbgGs8oUdwe9hS6/nCDMxafDJ4HKMUQmEsCDCcYuIN6FemjQF0SnYKa+2SyXpqtTsdkVz05GVTOYSab1cTLOGyy/Vv0NWn2MxvTyyPqQgfL5cMSBWe9+pB7sKgoe7eZ//mARBLSLFMlqya5t0R2qcfnpyMdzbVllNopX7tZtccH14ige1458A9ngK/roFNSBxC/2Sg06WYIWcq6oa4VcxelYxFCMaYKkm1xDYsQsF0J3pasb46zIWTvefwuSC9RGJLoSrBmF218l27S4lI7f+sYQNfkjSrL7OjkHo+3wKHKpeID9mm/JTuPGe+d7mfbyOtRBLjsmgrbcfT0h2xgy8AZzULwajBU4lnQEqCi4a0FqJnwciVcKE0H+iudKr+oRhEAr1pZJosYkp5a1Zb/nSXVF2AjzC8tcDNpMCHkthAaYmIOBixJ3v5wA228KWliZ2B8J/8N0oo0nI/yC5//MuYEV2P3HrDB2F3Hv1tzUxYia9EtRLAv3444AkAJ8Auc8eiuzn8RkzC60cdRzsQ+78Iccse7YuZw+9YkC4tr8jtCSXZaY6mVUo+/aR8KE+vkr+mEeVi7H68mpJ+bBAL+huiWT1r820xoT+slQiAsarc3Vy00IdsGUA9n/I2wsJfnBOdEJa97d5/RFqHVJ1ERqR2IsAchFmrdoTPRwNKcwQ1QN0tdpqUdQw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0vsuyJ5s6XTs4tzMU7vr8shUc3jTcUr0cUD9MWqqdrcw4VAvg62zNNVZr5f4?=
 =?us-ascii?Q?ovmCkX09y9+4Gbrauz0a/mSKz4G5DoZmEKB6X62oXgOQmcvH6R1SkRcVHb9o?=
 =?us-ascii?Q?SqN5dyUg9AafZXVknOu87GwQbiw9A4GCXIXWcbP7ZkBaXxZwFib0l8zLTS2Z?=
 =?us-ascii?Q?u7vChbBrvqOaJXBt5a4oIZXOaX1lt/3eZVwrH2bNYrek/XXwnlPyvzQedFlw?=
 =?us-ascii?Q?4JQQznntnBjH/iaSl4dg6DXCcVzo/GzbmBxVsh51tkhPV1T+hNIrlzR/tN+N?=
 =?us-ascii?Q?cfx7EWABKe5SoSX6HeKmKvLl2sJ6faSG/AI4PMhQVcPNIeJpX2EA/6nL7M4n?=
 =?us-ascii?Q?GUaZoVb5ugLSvddIKKBoawFkVGUDohIevc+PzhsocjOFm9+feLYIIcUoCuCC?=
 =?us-ascii?Q?6vn488vGSOuyEpJJeGu+O1yvHqVSdy410C7wgrboHbmD1Z8ltCogt31xCIlh?=
 =?us-ascii?Q?y8ujDwnzbRifp7uXjdha8UoMnbhLkRdUx909sZGlXlHrDk1drpvLvRgeHAxt?=
 =?us-ascii?Q?E6f15oqSgki8Z7PZxCf8uhFQSlSHu2EdNek1xp/RfDxH6kGn1bSxPPQfQ44+?=
 =?us-ascii?Q?U/3y6kQf7GVtrxzB8qbZoT1fum3d5PgOVYtW8zkY1nK2zyfaqT02QO1jNHlA?=
 =?us-ascii?Q?bdEHOW8HlrbVEx99YRD4vQNsCV+HR6iz1ncnHidmjizGQsW4+Gg7YpXxh1hI?=
 =?us-ascii?Q?eFwmnsrt8INI4yde6FU1kf0+YQgUveXhkz3PT0XfbvSfGIWBow9gu9qpZYh2?=
 =?us-ascii?Q?FOleAc2lX1Bgqy3jOBqzN0cA1EI7QKvknS2Y0uxxiqJbtDTiA3ZFmF0N4OJd?=
 =?us-ascii?Q?jSFPrrD9TupMAiLlex4v0QljRoRqJtudfZA8LRXQ9BkOIyQqBX6I1OBtf1Af?=
 =?us-ascii?Q?jgYFVX/yDWRVQ0Rfw7OFICd38GkWWMRjBb5yPoQgIYMdmdnl3Hc+QQ2s0l/t?=
 =?us-ascii?Q?uPTTa6IBhMtoCcMebUSnvveqbqy1fI+NAn/L2Bv3kGGAhIvDWMCuXdH2ApBU?=
 =?us-ascii?Q?lFQrzglz279BGX+OmucsDK77mMI09aqgEk2cinJlRUOEptGoMvigDDZe2C5p?=
 =?us-ascii?Q?gd3aQzyaKMugFso2ph5pNUBwIKNFFm2wl3/8slKTr6BNGFg1W/OO36W6bBEQ?=
 =?us-ascii?Q?A/9yA13Ij0mJPf8q70QZe0UmpaPIQFl4IcA3pOPRqLqIEMCtW/3x3YFbpk1W?=
 =?us-ascii?Q?vqUNe21MxWD+7TFKMie4/Hd/AW3R/RtxpURDJsIabFa8ls7gOA4wN72V6WSJ?=
 =?us-ascii?Q?mVZuPDWYjlm5f82djoFjiShMcH3OQhPUBL+ECDHMk3RINCzX2/jmhP/wu/n0?=
 =?us-ascii?Q?GdxpqTPMV4OnJ2wzu4eq61QTk8+m7BiO16oX7aO9QAcjSXiqHvtpoi4z1Wgm?=
 =?us-ascii?Q?9bx3m/PcG0Vfe3OVYmuF3jjcd4NqNf9WdSiBkGkkNC1zyEGM9t7ejFYAfJhO?=
 =?us-ascii?Q?9qsAMhQeJ4Bp7ttw3urNi4vzMt87W0tMBV7bOuTq4rMfcIBpl7x/zoF8UB36?=
 =?us-ascii?Q?4POuYTw8IiirlqHlNV3kbyjcBsqmZI6/tF7UB0x3jZxpjrxA3JWMq/QntsIh?=
 =?us-ascii?Q?56o/8paHpgWj9Rro/w3y8+DkNOEAd6l8irfKXsqjqC40YuvTrmjwp43AR9JF?=
 =?us-ascii?Q?Sjsu7z9RnaXSMWDHtMFYCXAPna0umcDvDVy9Xk/Biz+8hPGUwVOIEJdcBb33?=
 =?us-ascii?Q?O4qGL0UwlywTtK3TpFzEch4K6us4pQmsiQ8bYS914bbLsiAIIvbAP5J63WdQ?=
 =?us-ascii?Q?OvjP85pS0Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddff0044-2bb4-43db-db54-08de847819ff
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:10.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOYeGmZOFe86ph2o1VLra+4+ugPpNDMmRVagqrJoXNNLNXIdNs8ViuUpxnW6/cNn6to7x+8GPCqzKpC7d0+ZEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

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


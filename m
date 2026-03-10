Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43497335564;
	Tue, 10 Mar 2026 02:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108711; cv=fail; b=Jr7jWAPrKZsE/MYTagSv+tIAyJUjUGoxAlpnhXgp9uFRfptP/FnxSQ7qZZyEfuxZTVqjhCCWr6/LWfCA4L3TXukfIsC+08Z4PtacA9pDnxSq1+9aQfMVy+T5is7N4wC/pYt/TUL7RB77dZ7JsS2L8PpZt2eJfPVFJLXUhfI9D7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108711; c=relaxed/simple;
	bh=rVo7lrlVktWYPlz5urOFO0WSnVzdHXI1fmd1sHZ+Vp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nJQjI7F29U5NT4OGKxC90FLhOhlgsx7N+4gwBb34fzkUVkYrL9KVWa37uNXqHDXMcqSc+O4MRkHumWp/zuuQycZScAjq+DCNjA+u6J+Ck2XGaT49GofrlqeHNssNgXJlJ3I061t6s/y7ZsEaXEEbdYwQhGPTJdXLR0peK0VhWEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h7Os+zYR; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h7Os+zYR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUDj4N3/QEjw5v9/KcbNS2bpFnHGujDGLqUb4vPL+m++nFSkLiREVOiXu12/qVfrWvU+Xc4P4mexXAEEJ6HdcgXgF80s/Epm01nKRXxVup4/11IWRFFfNnvFC02oY56XfUryONfFe5qdyDGHoB66tIaLKJpGpINbO0ZttX1I3sPy1Y7UU7soYh3OWYAbGDgGoRvHFF8a/5MFvU4ryNXLv/zzsA1f4BFB+Q4AtUIp3EotuNsRnZIgF2Ct67GEpzRRRRuzT2PQlALwg5KhMTC+kQWP6frxhkuEJsbJsmJqdaC1dbp0dIUzs+aDXEPThjiSoh/p14hhLINKJcW4ZSmq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmHpo4J7g3D9OjcpQ6wb1Q7UcMZ9GZHxs6ramVmuW3E=;
 b=RE9KyGp+b+fG47upSTO0udzoKKWSLlKa6BSMZRlT3Sl0IaK/k7XDSRVY/0C4ltShqWnTRj4sdsypZr9hJfk2Mi4HN6TIpnmnHIQyUEOZPsduzLL7JZ4dyIloMf5F8zBQ8bNQS9jQ+sgiGJuhrzZyudlR7qEJrV6IRNt/0+wmiCvvT01HC4x6LxSHrSY9I9+EDfR1Pv8AdfiqsF7Bzt5Itc7ak9bAtbLHEJPYR5LKB6dYbI2AY8Kdj7TP0q21tlzSVMvOYcMm8nny35mTWxP/TPX3ObrXBbKfRiADylLFrWYzx2OPQ2npnYl5c1CzHt/xnIdUARMY946G/sf2r+YHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmHpo4J7g3D9OjcpQ6wb1Q7UcMZ9GZHxs6ramVmuW3E=;
 b=h7Os+zYRJRz/i04tDgouoSAVxcut6uTzt07m+8rTJkUByu4YSYS+F5rVq2bYWOll/H34c0e7oczY82EshiZFW4tjDSWrf025YSEotYfqOIdZ/NaIqLG5zc7sG98yehAyMVXQzuQ8Z8dL7MglQOZo2lV8Uqn97JP5CHTMaYzgD7+t3ZSUFQWS1yTCl7sTTe221X/beE+Xv1b2n7xFv8PKHRHY4OaYoLwaBXSW6kSPBTqDQdU/5vjKGnWyvcpLHR+egdfETTMAvvfebqr1sasBS6rzYoGYYZ3mVqiOy2d2egJlDpYVCKKBfEcsp2spslERetd8w86a42JneQqaaLamvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:44 +0000
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
Subject: [PATCH v6 12/34] gpu: nova-core: don't assume 64-bit firmware images
Date: Mon,  9 Mar 2026 19:11:02 -0700
Message-ID: <20260310021125.117855-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f3f245-778d-4199-5f17-08de7e4a605e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	XJ/M7tXCxA+qqSsjPPP7bc2imUbpP8eQYe5aBMLtutkUaaY397LJZyl3OqF1TfMafz2mVwCjaJHX/xems/P6x4Tq1oq8yUDwRngeyum8z76k0kLZ3XctxpZ2YxXHyVKFi7RFL1wJA8o8ZMOLL/CSTx/AI0hPKaL5gGAc7Ah1kT1/bOaH5DTLBlmyQYFrSZ4XQFEtlxM0N28/yi4p2o3obK+X82F83uuCW5vDn4qe8lIMc68U9i699kvm4KwwGqMAeH844H4deMcUnSjVkcQlx+TiC1mAahNHLrKM5mDeo3xk2ex8yeXcdcBhOIHmnr9zl9zEpnrz96mfJsmXPv8teY/wWJt2lO7Ivl8968WHVlzoO9Xa0rphTCyqZ6isnbuyQ1qbbhoArM8RvhiWYGkqXMF0eFvYr88NyCXJadiw0oVdIUStI1u16EesOxgV0fjCw29Ea6QqI1G0Eh078KDrFbg3aSww0eXXuRV8An4qT2GK4XO+bmuZVseRDoXrTjSAshnKynGOOuRYxccoiEJ1feyJdiRqbFn2tkv9UaoY+ZgJQMUfRjkoi1G8r4S+IXdQNmPSRkJePW5jQRMhnEY0ynoDO9S6kHYVwxLt05dyc/0BBnhxdN3WJ62ze/Avsd3YTKl+xVYGptiWjh2JplY2Mj/wiQQpkDbWg4CjfmGhe8i2Ehhvl6LPIRR3c5nOVG4O7sIsPqpU1LCRejOhy/Zb3yu8BsDzm3zOWcb5puXZeSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7SyQdrx6MbW5QUPhs7k1CILVXvp6ahYmbBRZg5Ca18/TvGsB2KP4ciTgcsL/?=
 =?us-ascii?Q?WWLJU0Zu6FOM5kPtS0SSYDrgV1lx4pRPNqhTTUUEQ9f+zHdYZ+UoYD1k8ACW?=
 =?us-ascii?Q?kfDMMvihRFZSrpFhJpr8vAXbWUMSd1+ekA0ij+XeIhQMqVkAUI4gfbvJt0co?=
 =?us-ascii?Q?Mxsq+xLlesLmmgcz/CvYUCQj1iohyOtOQNZDSjup4/FB8HAuNXzKCP/VJhcB?=
 =?us-ascii?Q?Lknm5ffmVNNkX8/t7kMR0iU5AXTQujt73UkZPckf0xB+iSZstCg0hH9cLnMv?=
 =?us-ascii?Q?fg555tPl4kLHab6b6aHyaPkayFv9rrHFXHYP+Vw/JVzFRRyEuHSJzUmFPZ3A?=
 =?us-ascii?Q?Cngnyck87C13ggC/rxSaAYPFapbYBNvrESmQRpiDiHSV+7P5NZsp1KdLZpij?=
 =?us-ascii?Q?y1hQeXVX8TONRwlzQlYy0ViGwRGYrJTVB0MX/ppfz4Whr3rmXWLYER7mw1qW?=
 =?us-ascii?Q?ymmFFJQa9pRP8vcASHcgQzRe/rzzTLyirdc02wsXiiEKkbYJO8Y1Q32k7WdC?=
 =?us-ascii?Q?BVQ/nfJG54lv6BKMWHPhK8JczZcCBzLyBXLNmMDMpwfNR2dLKuAJBJENOdov?=
 =?us-ascii?Q?vR1eKVDnhL8EGRzIToLmD0EXMaP384xQQElYd4CwWG0pP9k4GJMe7Zj2JF3z?=
 =?us-ascii?Q?jn1EhM/PAEtGTT7LPfnt2Oy1SHXL+cS5ayHZFClQOmJP82BHIy5j8MnjqaCY?=
 =?us-ascii?Q?MSrZ2o8eaNP+8lx3o6LTQRxDinXaXuQuR/YgEhCYXBjl+c8lYPw20epnzWKQ?=
 =?us-ascii?Q?6v+DAI0cWEWViIfJwpuoh7Y1ERleKJBBX+ApzN53Ro+S6yFB+FN/Cd8zugU1?=
 =?us-ascii?Q?KHxAJU0gwcsfN8bUlTmBark4sCbo7n1CO1Xx0QixVQxz5WEAYOnqU1aRx+RS?=
 =?us-ascii?Q?vn8tE3qzK2ybGAMEqdLCaq9RLfJ9H3PgwWq83/fT+RJUbkvmVzowYIkkcaGN?=
 =?us-ascii?Q?zI0U++dsbSeZ3gQBH319ocZEThdLsfjRT9ribP1d59T1xpmD2I/2Am3CoRE9?=
 =?us-ascii?Q?2ahkMwHtFVTglszjt4lnV9SUAzbz1MaQs2QA+xhjg7u+2r5orXMfU6qi+09L?=
 =?us-ascii?Q?nb3z/gQFbOxOcg1svoRn4bRHkVTvH6GgZ1tCY0UfiB9+/Yda0rqIXvtjjaap?=
 =?us-ascii?Q?YyJIQFcr2cwANfCvsi82N1YmBhfEsiid704T8IkWF2ytRzJJ6q+oDII6MFtl?=
 =?us-ascii?Q?ZlNzJN2SjLoDC7UfHXaZl8pcUe9Tga1j/tDwMqep77mRqfP5VxP6yuQwCH3a?=
 =?us-ascii?Q?bO0P70j5K6VCPSTbS1eKwZxfxyZWgunWdJoHVgfBqQZysllRMIwG2AqU2XxN?=
 =?us-ascii?Q?i4Jli0B8sKK9T3PTmGozeOpaA3QIRX3lsJokC7ztIuKB9lFBnaQBIaPuK6uv?=
 =?us-ascii?Q?0PMQtM7dJGYrLtzDGCYCDyV9LSUeCmjrUdugDY1r8VLZ/C8xovfd4mvaOI9q?=
 =?us-ascii?Q?/Qzl4Ilw1YmDJg/L4IsNMVUAscTB5pPsTrOQhQ8SWmjzYkd/CJieT46XzwvA?=
 =?us-ascii?Q?7kwddcCoInzOCymFmX4Vf82m+TB9w0VsOTAX7kua+jb2kBLdxnOo23hUgI4J?=
 =?us-ascii?Q?njmqOIT8sCUwy4wKgVYTxedw/1k7jNPtBPO2Vub5xkhvl3lWCA6h+/SdtiMd?=
 =?us-ascii?Q?In3K+fuFkwts0UmlcunDNfRnNfXCAIRqFZIoR8A+iwCNknnvZlkKb3EvPaH2?=
 =?us-ascii?Q?y+UkcuL0eewZlL6cKYjghObdWU5ACguCVko4i9bbDDiXuY0zh3faOaCBcK/d?=
 =?us-ascii?Q?ChdxsOksAA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f3f245-778d-4199-5f17-08de7e4a605e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:44.3972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9kSnHXsSCZAzRG/8pGP01e7nBBXuG2+KMuZt1E+cZXbYbz7SLKj1lmy6hWXumxrRGg1uunp8viTe1s8KProzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add ElfHeader and ElfSectionHeader traits to abstract out differences
between ELF32 and ELF64. Implement these for ELF64.

This is in preparation for upcoming ELF32 section support, and for
auto-selecting ELF32 or ELF64.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 99 ++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6c2ab69cb605..b68b67bb1d8e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -473,17 +473,60 @@ mod elf {
         transmute::FromBytes, //
     };
 
-    /// Newtype to provide a [`FromBytes`] implementation.
+    /// Trait to abstract over ELF header differences (32-bit vs 64-bit).
+    trait ElfHeader: FromBytes {
+        fn shnum(&self) -> u16;
+        fn shoff(&self) -> u64;
+        fn shstrndx(&self) -> u16;
+    }
+
+    /// Trait to abstract over ELF section header differences (32-bit vs 64-bit).
+    trait ElfSectionHeader: FromBytes {
+        fn name(&self) -> u32;
+        fn offset(&self) -> u64;
+        fn size(&self) -> u64;
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations.
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
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations.
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
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -491,47 +534,49 @@ fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
+    fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
+    where
+        H: ElfHeader,
+        S: ElfSectionHeader,
+    {
+        let hdr = H::from_bytes(elf.get(0..size_of::<H>())?)?;
 
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
+        let shdr_num = usize::from(hdr.shnum());
+        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<S>())
+            .and_then(|v| v.checked_add(shdr_start))?;
 
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
+        // Get all the section headers as an iterator over byte chunks.
+        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
+        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<S>());
 
         // Get the strings table.
-        let strhdr = shdr
+        let strhdr = shdr_iter
             .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
+            .nth(usize::from(hdr.shstrndx()))
+            .and_then(S::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find_map(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+        shdr_iter.find_map(|sh_bytes| {
+            let sh = S::from_bytes(sh_bytes)?;
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
-
+                .and_then(|sz| start.checked_add(sz))?;
             elf.get(start..end)
         })
     }
+
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
+    }
 }
-- 
2.53.0


Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCDC2F0C79;
	Wed, 25 Mar 2026 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410801; cv=fail; b=mES9CGcZxg8/oqLLBCjOvamUeDSQSk/ZbBX8mi6ArEyEDTYC30O7D1//XkZ0Z2afqmUMFOa1XBbfmPm+0YL9Ci4w3wLAz0S03y9BBIAw+3pEMnB2/htH7uQAZsmu/bYM6qzXtFOaGBNfDttwBD8prI931C0KeVEwCYsRfPROUis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410801; c=relaxed/simple;
	bh=ngDJisWsseC9Dl4NS0VFZxUdyDU57OOiO1kmaTNruXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M8AW3pHKiG+LY/Wxod8TWAEWV8ixrlwl9ofLhmpGXzuiikuAqTrgjF5gsSBAmMmpVom5TSMCvdtc29YlEmOgWaUU1GaQkq5ornrH5L5r3jysEs85Gs4TEmgi2st5e/tjiaCdU1dog0G9Y1OZrTcPaBMIJBpyKeX1xzJFFN6JaLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ATnr8nS/; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ATnr8nS/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp1Grh1Cs+UjtPSHuW7vQPGyPtygnjpHnPvGBvGVf6SfPF4HrSEdDp95I8Sbyt9AiwFrF5gAWX1EAkLXcQMt1yjF3zPCqqw592r8fp4r1Ao8zkUI4mCExuxnN12AQD0DZz9cxxtdOQQAWXgCDySteXji1XvvBvgPwyV/WHPF+qfyC/vD5TyM9RVwn0AVJLoTzgEdWmAPPcwlmsASA0f9Z4u9U06QinFzbL3UKr4k5C9puUtulblq+zVUZHr9jl0VIcVYOmMlh4zqRHvTPD+INjDFZCZEY3PoyFjdEWbxP1r/AnbutedYjXwSFY4Q1jx1FiSJg5qyrZVLIWLbGr8XHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=kouAFY+9qyFdYvb4Q1djRl0pzDwz+PnzSwp9ZBDVE1JXcEFLknqh3KTRCuKe0T1K/f3guOqbp20W4cLdmzwifW5aAVUbIs/Us6aCGeADBpI0jjg1ao1FJeo+WVkBSF247dbDDFCS00ZFzldMd9oozerzW8pYsBCla7JMXR6DSP/COpRq7UKtXOHm58jDMDB6JcVQ4okI/s9pUXkSyh6dRRL5Ac7Dz9FkuAdCkkzvftiGIK66+2CYLu7RCbFbBMSQS9kbMmXDdUqJXC1RQwvKMPmDwpe2HlUHRMY4NFpMjJk7NIGPsOBv8FnoH0kHq3WTRPm0uXfOgkh5pSuaU9XWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=ATnr8nS/06NT87eg0QjPENaTmXhMvkcL5yh/qzNV8Z73vh8DQ3dLcyHe+HT0mW0K59yi0LAUv76GX28lWsLBlPbuy/3ebmeQwVdeyWHElDFEBJxo+5D4vQwRhzfC2PFcK/DFgj87wi/uw9xV0D6wFZW5OK4zbI8w88287wU+FNTMXmSahktnLo2hVbBWwOoGWQkNwZbQ9dqbyKUklIJYUbdX98o2BLAhirnaXssSwyigpbUD4FXK6cz00thB+Z5f8fjNnQLDqCyVtR6nuYDngXuU6XTEWP4pjgVVUfLwMO3juE9FzStp5fFyHvKaIR4+yNYqZSsEIDz2fbB45Mwb9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:56 +0000
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
Subject: [PATCH v8 09/31] gpu: nova-core: don't assume 64-bit firmware images
Date: Tue, 24 Mar 2026 20:52:20 -0700
Message-ID: <20260325035242.368661-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 2251aeac-5f3b-41b6-2381-08de8a21ff92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Z2KvLVL18plIUCmcUgFUX5EyKbDoHNzKiY/2DjFwP/koAiTTw5e7Cfd8Vq86G91KbIbG4JgC5XHqvcuXlQtihxT9AjOAWDWqqsCXnn+Co8lBegDdTCyEEzzBeT4sK+PEZ1CGZqnHZRGpM2uZd/5O5021rgawbSmsqxEzO8qP5gSEuf5v6vx7ZQpyzF/avNu9CpqGE1aaF1WL0wZk2rdv78vu4kMkD3hSHNwdB9uq+JPntNsuc5d+j6hU/VgLxPescgjPlz0hcV1IJiV49kAWdLlcp31iUp58Ob7QymZHFG2P/rcv/FZ8RJcokw2dIa0bTyPPv65dGbzKuAP3m+AKaU6ochOvciru+DGAH7Jo320lxz9kmYtXdlXC4Unj34sJzEYmEGSHi0UUXyOASrKKVqn5t97YvXpkukQO6cSyhIIJ1uKqRxJqpBYe9wHro+n30/AbeHkUv8oVaTxBbSL8JhcclRr/ORhCpZXli+w8hW76eIpU1kfqGyL+3tanZuKw2sjV4n1MlNXKKFAP2KnUTMVbE/nNxokKjwh50cldgi21qJgRaxN7hUSBVXyrpld1Emplr2f9+sFgG55ZIC3krwwfCRYz8ApbYChDsApbJfuzDkepEBHwItLRAGk/hS5BhkpCv/GHqTxoG9pFAdMZIIiT896qsnTot3rL22vb/TcL7YTnOQnXC4OOc70ZzPecvDv8QNgBDjBQuQonUDw4rAV9tikL1AE56Wy+m3MPZpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lXCCr7Eg/sc1UPSaq3tQRKFeCHSGfm3hIpDJcrEITuMksBQPBzn6k5SKgcMq?=
 =?us-ascii?Q?mmQtN/E/oGFHOxvax2V+roIWwngeimk4EPA8g5+rtuPeusC6KGEi5YQ6Am9D?=
 =?us-ascii?Q?kxeADTts8/dIzoHhtpuqW6yMiT1gVLNce5LBduEpx4QfWTW+o4Tcs0Z4F76z?=
 =?us-ascii?Q?9E27GHXMqRC3VQpdgS1f4ww1w2BLp81dk+9sb3A2+C9wPtUwsxCOXrwxwH7o?=
 =?us-ascii?Q?MXgxLwWccYkOW427WzaMuOw1hBXD+U6Z08d+Rom4rc9NwxjMNFkFwgQ/9GGi?=
 =?us-ascii?Q?OvIjJRLZhsBgo+bodZzS3sJxL+18bZAzWc3NTzTstbSZ4CLNgCeGb9dO9/Ny?=
 =?us-ascii?Q?aFK3L43RU1ZRHpEo5AdJtqPa5g8ylhCdDqTQL5gnbNC1aF3BPyF23pN83W8w?=
 =?us-ascii?Q?6Fc6uSmBJiSgNYn+WaylFR1jKfeKOgApOqKCxois3DZpccEcaFYS033R7cpd?=
 =?us-ascii?Q?APdsKytHz9IK246gevSW82KIctSgJh6YiY8ZqFmA3E4jlbKbUUh5pt2p8xeL?=
 =?us-ascii?Q?9wHph6nX5NcAxmZV+mzjtdu1LPsHNLiw1dGvOTqFZdVXCO5YiyM/3mHHT3Nj?=
 =?us-ascii?Q?0PBdRU1DN18aJZVQ8UiQLEQN7ugG+5jX7ndzYgexJkYPz5MyWsXROMgyLrrP?=
 =?us-ascii?Q?e9s5ZhPsGJvfVdaPwso0d59Q2pS+bVqd+FwQycAh+SI3hch9XcE5ole0rLU1?=
 =?us-ascii?Q?wzVFXGLodljs9VKamzBGKAqAnWUln35Ih9xWQnKZecoT4UwNL/ZswJoTOu6g?=
 =?us-ascii?Q?6Jgmvv8iy0JBQuOPcoguum41RhEcHVxll4zlhZclEkx6fMDUgX3l+T1S0xYH?=
 =?us-ascii?Q?1q+ADEnd0EgirYF7W4PFLunA6nQM1uAJzEM211cv+Vntw5beegnNPuHHFZGh?=
 =?us-ascii?Q?If2VMxp05Yt5jjK/+lL9HvnxR46cr6oyFe1GMZDj5OIGLCryfdlAKF3qD6Ft?=
 =?us-ascii?Q?ue8aOuj1MIcTsUq2ArtE0JrZxMRVnyu0hjLlJb82cCXHmUZkOkaX6ZO2d7z1?=
 =?us-ascii?Q?yGApGzqfMnRyflysiqqjvY6oJmNTWJf6yOLShh3Awym0kHLS2oypeHfVa3jG?=
 =?us-ascii?Q?cTLTf9erw1J2yMt00YF+yn7U76JtYTtGmVh6NsjN7gY+R/cQw0RobcG7c24D?=
 =?us-ascii?Q?6EuOLhYWFv6vLyoggF8TnffQaNLOKFPZfp9ztYRu5ZCKGmtVMziyS3wrRqS9?=
 =?us-ascii?Q?1AIyqXvLelv18jG/w8RAIkZXK19iJPbqnoTG+wK6T5fYu4b5VVWtWWWLs2US?=
 =?us-ascii?Q?VehfbIMKKrGzz/tvQrb7v+KFRdkDnqYy5+oIgdExWY8Ll5LBQFmP0nUAs/xk?=
 =?us-ascii?Q?uWHpu7tKNu5Qr9yS5XWKILkdF0I/Dq5uDFGpn+3PjVVaznQGo9xAxus4WG+4?=
 =?us-ascii?Q?uSkZuGAkQcYcK5WA4qjIIRarcaoP0Gt5eB5+lvf0RGqvy9FrH/zfWnqpsOXV?=
 =?us-ascii?Q?1wVTGV/pr9v7GOYPwTAu8URWTA+pL7YI445oK4uRt2rEmMNwuV8FjXS5p6Ey?=
 =?us-ascii?Q?9S7bxaAeGHm2GKg2cJzM4NS7WAnT4lB+vATjhh1lS3g1bYcIGJX8Up6XRVAD?=
 =?us-ascii?Q?Y81VIhk862DG6Xc8/HuFG2vpWgjBymlnE8PdqLVbzHXXvQoexU1uZDCbNHnF?=
 =?us-ascii?Q?GONp9fteylo2LoJSp2jLvRGT7Lt0ByHIZu2esMxNs0c20D8xKXccfUgEwKTS?=
 =?us-ascii?Q?IsBoo/XVD5NsD2e1/IDbvCbpOvWZhkhRDyWV26dzvBkmnrTpG3zK87KrkXzJ?=
 =?us-ascii?Q?tyMH4ORC5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2251aeac-5f3b-41b6-2381-08de8a21ff92
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:56.1300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFzcgaVhNwCo/PuOtIz16ZWWwHm+MetPuvbxJoOwCQQWJ8NncksJxpfZPY15uJjwZtQzGZFa7h7qRkbenVxhow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

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


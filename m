Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB92E54D1;
	Sat, 11 Apr 2026 02:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875819; cv=fail; b=F6eeIKAhEVSn52ZrE/9lkEKFSkDQ6E7zgOUXQ9WFYnbe+vzto/xnbwMAOYOr7FpYhUCJEf1z+riPlXw0nalRT/8KfyEGIMjNlSkmk422JftBxOqOYJ3o5tJPhqPVsAjtM3shb/WC5kPM2iA6CUxHZw55W2CwByJ5V9l4BivQCns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875819; c=relaxed/simple;
	bh=Kh44LOzmjxfd9KNVo/eohOq9Gr9WpEJ405Um4bz2GWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qbw+5QU3G0a7+LgNrogCMvsi8KcyddrAMSdMyygNy8Cu4wVJezoOJLDgVzHfyUOjeE6gg3zJjsY28VdQ/s5X9IyxDivtKk5w3tK7FvL9KrOrz2qZ+W+A3WhyzfKrVhN/PzjkHqGOtFYHAnYLrHGI6s5ljiDny+lS3wu9ztHclwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n0C6Acxl; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n0C6Acxl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giTStxEIF7iwzLVUGnuwVOAOmxMjmnSbUTtS17H0aNBlCNfv4Ia9fveSPg+P5Zd+33UQ9MBkoMEw8/6eB9NS4zI7e7J4mYsWLmx1kvR2DNmwzTpHLTKv21jpsCg63Xu2TNSKmEqBPndCwzB9QtAlXnVFxmIeoW5uPn4otie7g1t2M0yZfYQmxlViQ9yOBeEu+ms7Oc8WL+did8LSw76yEnnKrlj1syMutT2GVY0ctuX7KL3J4xrqYx5/Jlpw5zyQaXrFhZuCXCp1MVNrHkrd9V5DVw9vx1qsJn1gKvL88uwBBFJJrNRrX+7d/cR6eNokJZJSQ0U8hiK05OFevJMLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=HP4H3FYqAdnL4e/SC25SJMBXPS3K+v6GQue9/ulI0WRUIJgpRnrhaP19qDs64LOgGZ5as8jLUJds0JLXHt7OdWB9bBa6Tikwvq34uQR1R2ds0Gt/n9by3GYOG6UeHVmyicLJNoOWxidKehzvFpEak2aBsQ5EL+ODTO9mGTlEVb6Mj7XRlSrbPWj/NcCJi13p9cWCrjnvroW9l37luw2i2iBd6TUQtvT3nV/91OdWTgAqwcY/MZbPZeb68+PiBPU4pJ7RAovLidEmsTPfvJDwaAExTPrmsIf7KMO0Jf02SKBTPBlKhjCQaEKrj05R1JWV3afN3iOW33M7IqTkHEsV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=n0C6AcxlRGnEgz9hXtvgq6kkRoAvMh55plzh+a3B/AdYi8xjvzJgBN6A0oIX44YP0dhyAnCp8DNN98PuUIfjx9k86FutzxA0AUNZrBvY9MjsYYDiyGsHauqH8ecXup4bYvabQK/v3+2OavnpVNlcp6qELYych7OiNtdE9FS4SaZgmjU7xOEUZ1vDGVQlcXH74g7w5Fyk5QfvgVmDEkTykfZwP7tEoIEO+jRcwoGpVQb2ovQc3PEC+PB5zGIIyca0I6GkI5jLu1VHpTdDlc3NnlITYJJQYRb8fDHzpveVhJ9A4/jtIFfYqKSOozMoAeH8AlVX3CkeaGHp7AbxWDoldw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:13 +0000
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
Subject: [PATCH v10 13/28] gpu: nova-core: add support for 32-bit firmware images
Date: Fri, 10 Apr 2026 19:49:38 -0700
Message-ID: <20260411024953.473149-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c72a69b-a4e0-478d-0a8b-08de97750dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bHY/ZAtPWlnZ+NCb8w0wQLoVTdzlG9+W0tEgOApizcwlIDc6MuOq5JhEhSFE7yntMDusWnbB6aLvf5QvQTvZurZHelcwLlZsxGkwXM9vrudabim4iElwOojDsbLovyW8hvIcXKgyWVXmcwUcRpd2atxIK12+D3SVTEKvSmZ4aL0Yw/DIsfmFkGl5Xtjo35M4b19GkJJOj0+JJFK8tTG+vhooMja7RpP6tD3H95QSdACOT3/BbddtneAU+EEgAJoO8obYK90uL3vMTW+GHjorK4twUmDvtyMXKGOj0G6HBTpVQ7wNl1xN4LCsLzQyWdY9dCe12W/AYaURWGuRoOptRcbOlZej6BweMmbDJPD74/+Y3ch01WPp8yhzzNMqDpm1Atv+wlX1DhI7irgQZlAMPexUWrGtqNOOebh4PA+LyEGwxdwwChHz+989jBbNqW6+dRn0TeUUgzhgS9q7Wo+4aEXzYZOz8VvQfRf6OuiPAA2vKvw/zLDBAC1RxgnBVQbmtQQw6K1Qqeu1LRevADZ1fdFu5g3hV1vmYcfVjFv0IeKKwFtW+BsMicElqUQXM4RTpJxaPGzwAz47Qf9Vp4DUpLTbYNwY4+J76eoSJRwFO4awTd47pf59FNzM+Ny/XMr9qdOcfwTiiaLzZHgvnHQv3pO/gfN3YFWdYsjjMOd+MZZ6wpC7bZ5jFCjhxbtBv6XeeRoTo2JVA43CWm2De5oF48lKVpgtIPXs2PlUN3NbBWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcJJpXTera2Y2OWWSVahDh3TeB9LaLCWqgerHz4inIM0xww7CsynfhOqAEU4?=
 =?us-ascii?Q?aeK+Un1BlMuvnrti1X8UDM1r3RiLXgJUGtoVnjWvCzI/MWHBgb8Ud5ISoLw1?=
 =?us-ascii?Q?+c/ZPE3E/jbm6UDjTZEjr9cBRkiSLVroiPFD4BM38PP8WvkpcLJT072HtkFt?=
 =?us-ascii?Q?eF8E/SuHV3VecYbRHxBScq7etvgW1NMzSUCBJWgey2aGAaxbd3OEq+EMohar?=
 =?us-ascii?Q?5VbvDd8L6qzZ1ngqs4/yvc780aEAxR2roxhZvRp9nUXchMvIr7hb7bdMFsjM?=
 =?us-ascii?Q?3Z260XHl8PuXnu/vrM/nmp7dWHpoCmaJXS3t32KyqpT8ywpQXfnJY6+5tCNd?=
 =?us-ascii?Q?5JPjWmLJSEPsYWvgeKd9KQ1vYzFFfGUZ0HzMIC2cMOSk284D4cBothVfuTaV?=
 =?us-ascii?Q?QCut37g4YXAYf3KdG6rVhTFsUYkoXdH6A0tX52MK6K715LK9AYpcK1pSIGX/?=
 =?us-ascii?Q?vz7SKFkMUuM3/REK2ivC7z/eiIzWpGtspVP5RlPjXD2UU4FmMmsdeKksPr33?=
 =?us-ascii?Q?wkUldX/4U5Gr9chy6FN5jQybRPCBLzXq8e30gCveujSgYQjM9/pQtan75UNz?=
 =?us-ascii?Q?hgEBrZZQFHcnXZJGhQpwx41KLrNwzpDFbGF6q1BEcy2aGX1eidXqlSfe5Zll?=
 =?us-ascii?Q?rlm5ZUbRTicEdPGM+XCK63MTvMjS6fus1NKIrlp2s6D0SlCfeQLAm9iD92L7?=
 =?us-ascii?Q?5CDEBdUR2t/szeUUgD7HCw+Hdyx9kePa04Bn0+Vyclo+MtaaL/ejTRtg1hIM?=
 =?us-ascii?Q?vhJzdVmghvUArx1LkUPCkarrt67w4QLkq8yzvMk3yeaAvH5ka3Ud6WIANIjP?=
 =?us-ascii?Q?1SzkEwST76i5b7qBA5KiZ/nsY0iocO2IZMlZM0DP7woByrUAegJ821ddMi0H?=
 =?us-ascii?Q?4sWwaXvOpiAjiTyQwBG5tZKWKzu1BugA0cjmX7JPjoF+Nr8NYpOIskbCCh/F?=
 =?us-ascii?Q?dw/h7cWM/6BlNHA3/QkIWsyGYdHlkQVyoVlxELDDiPUZvOvfbWSuv1+z873/?=
 =?us-ascii?Q?7wmnFCpjadGxWMZ3razGsVPR886r3LMlsZyhpOJG+h9XNxuecmGnZqNKcqEx?=
 =?us-ascii?Q?kDdeTzmzNfkqf5FvqHQwYWWB3zFI6phFQdYByqmbfrbG73Cw+oePan/3YMso?=
 =?us-ascii?Q?QYfld6ATu58mfpxERFp7SnIyazSgdKVwijb+/VzWF/QJfeDy1lGOSjwMlIwT?=
 =?us-ascii?Q?UjjhnuCczORiwy+9/q16qP098tBAprGWa2JmSbzI7oFUo/uR/QgG2hLG1o9V?=
 =?us-ascii?Q?4wqeEQCl5oopveewu8RAozCqzulJ4Le/y8K3pV8KLojLEsGlz1BBetYGbTFS?=
 =?us-ascii?Q?xEVzDoyBOGwl8AUUFEOK4Rg28JRDXg4sUHhSSFFstlPBVMHpXHx90FBciMfQ?=
 =?us-ascii?Q?yE+ybWmoqOCK3lt0Dv5mMsNi3oCC0wDJUNIqqwWpUO9yyqWTNUZTAIQ5Y8ai?=
 =?us-ascii?Q?vuob/VMct3hfpqK2FHPNCGOLnP0/QBBLxAlDlqLfQ5neqZJs4X+g/nUIU+bR?=
 =?us-ascii?Q?9KosDihFtFMI84qf2DYiFDVKvb0ZP+Omv6U8JXhRAiAX9DJJoF5NbjK8zrmA?=
 =?us-ascii?Q?5mad0bvj7Mhf/79pSRnZ5bD9I8tcpSo4+1y0VIAkIngdU2nvQ+4sxFIYB9K8?=
 =?us-ascii?Q?FXAmcv4ZGlRn2uBGKob9pp3VQxzTgPLMqLikHiMpjpUpCk809oMeV6YGOHm0?=
 =?us-ascii?Q?ffjB4WkV0PnQ0tcQ5FnFqSZXA+VLCnBS4e0/TyQ9hGAQESwBh77JVHdaqXXt?=
 =?us-ascii?Q?JDe8XVUlBg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c72a69b-a4e0-478d-0a8b-08de97750dbe
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:13.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsV5V0okm4pD+wJWzRoZPY3XNk9gHTivILPe3Jv561wX2DxKhymErqCxyucibwpdFdlR2UZPPiahaHbHaRAXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add ELF32 header and section header newtypes with ElfHeader and
ElfSectionHeader trait implementations, mirroring the existing ELF64
support. Add elf32_section() for extracting sections from ELF32 images.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 46c26d749a65..a0745c332d4d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -539,6 +539,53 @@ impl ElfFormat for Elf64Format {
         type SectionHeader = Elf64SHdr;
     }
 
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32Hdr(bindings::elf32_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32Hdr {}
+
+    impl ElfHeader for Elf32Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            u64::from(self.0.e_shoff)
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32SHdr(bindings::elf32_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32SHdr {}
+
+    impl ElfSectionHeader for Elf32SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            u64::from(self.0.sh_offset)
+        }
+
+        fn size(&self) -> u64 {
+            u64::from(self.0.sh_size)
+        }
+    }
+
+    struct Elf32Format;
+
+    impl ElfFormat for Elf32Format {
+        type Header = Elf32Hdr;
+        type SectionHeader = Elf32SHdr;
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -591,4 +638,10 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
+
+    /// Extract the section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Format>(elf, name)
+    }
 }
-- 
2.53.0


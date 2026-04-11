Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7772D6401;
	Sat, 11 Apr 2026 02:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875821; cv=fail; b=i6PRUKe/0F3jZeNmkTa2H1/IfdPZ8y7KsT+t2A7P/dxdLYFDne8I2OlCMQdt35rTZnDx3TJ52aHTxXyT9VMS01B4KRUl+v3LTby/MzelieoG1Y/Ai6FlPu9pQIlv0Xb8ZIF9Goz+fMbNu8lU36ERXh4/fSfwSjeF+sfpZ0O+0Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875821; c=relaxed/simple;
	bh=ngDJisWsseC9Dl4NS0VFZxUdyDU57OOiO1kmaTNruXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T4PtCchd5gSOnIXnstlbL5A5micCt3ZYE+Yb5/rEaTTE7EYAAabUrWLZ4yr2iv6dWMEdAMKgeJxUg5aXB2tgH+XHcuOqOrCf6Eal7s8nxus/7+3zC7DZitvrOBwwFAA/Pa6QORIRF+DcsO4GWg4mYPa0p+iFqxUX7TuqCMkHyfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q1fPLgS2; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q1fPLgS2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF2uYskb3AqCWR/cYgIZo7TCKsG2QaxeMEWuh9hudRDsybdwJMMYRd2D0NvK1pLgWmav3RV/lCs3fxXKh3uRqfBSHgJAaKxhNTvZyomNnVCN2006MwnXv0Q03+jIkjzSG0daiCgthMgd3RbA/f+OuI2diTuixRkieRW2USPO5oyH+WeWpD5M1EPRy1Ddo3Qoaw+HcaVonOXaJkZ25zJFo78Tmu0+uSoLTrizCTuAw5e1Q1icecBeFrSX3rAqTtD8jPCN7spAxdX/X2YCBh3aQkscUyif3nWWt84eWdIGeNy4TH+2gnpW7B9qlazgPBIhvtiGvE2yKdYs2hzaM8jRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=f1iVPBeXHHKNGa9cw682cuqZZsMIBj21ypHWmGXhtF+MTaJZnAzv74eXIZG3pz/2YYNHN64hO70cf5WdXOIeDjX/7CzyKv9qZuNCaJ7Gvll6oEjRZZ55tSWZFGUh2ctTpN1gpDI6UJa1JtB8CX2VwWGmlXyM8RPRYpMIBHgYJumfVw4ypdpkVueaAuRaifEBowE01OK22uBK7q2+I8uy394mxx65dFVVuyk3esGm7Un9HEYyob/UsjxDFl+6zm/CmER1PmtLbpTLbYxX5hWlN34YkOA+6RKas5zQuhsGKBYKdEJqdMWOlDFwa/K0cmu73UHytgH78usgIa6UfuxfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7CYDng2/Jezmz4Ey26Fu4WS1kpmee3dqLivU4b+93M=;
 b=q1fPLgS2KNZBTJs7FHHt25bKwwGEpkwHZO5jTfimE1KXMa9mxltZl+TG27tBfDuz45WhDXdPfpCss8rZVySU+NHwn/ajOQGuY/Boxhc/X1P7hXOVbcCS59G9C8sw/vc0Yeetv2vMMlwufxh5kkhc0T748/aGqN0Yw9Xi48d5YPsaI5adXePs7AaBBCfnOp6AcEYKPB5hIBZO90Xh0QMv+ctHYtIjpaqf1CCJXp77F7Fm78rnnyoDZQHJU8UnQZTh55gauubqEkKrQxhNRsIFQsAQ7HT35y9jfWDF6bRB9Gx1A7tK+kbqCht4zhRzPfw/ni6000OPrtgCZTrDifuvTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:12 +0000
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
Subject: [PATCH v10 12/28] gpu: nova-core: don't assume 64-bit firmware images
Date: Fri, 10 Apr 2026 19:49:37 -0700
Message-ID: <20260411024953.473149-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: b0070367-86d9-4a53-b3ee-08de97750d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XN1hjb+Z7ngy1QVhOakIRvzPJSRWbyW72Os6Uqbm4flGRZlZj+F1k1k0/QUw3V6nhUx0cq0HtiCh4KRpzFBjokBJub9NO4zIlQyNCNitkv2Gy1YMTjPvVu7U1ZK6qI8WfrB07v2srH5pJG2RtWJhEXqDPmdw7zP36fl8bRGmeAlVyBH6ASAHmFrgpt5meBrojHo3P+MQEycH3BsfO+oIjBPAz3GwaCpDH/3+J9KzYiAJIQLSaDUojtUYKoIWs8gbMygwtY0EhT5aUR1zF2fdo0JVArj6RcMWOFDDjNiu3rTtgBdCQxekp/+f/mqVgJJUmjq21SyA6T/SzKZ0aOM49MLMDBQlCeQldNu6dEdXgD3l9fATkpxvZT5bugf6cbqzO0lz3QGdXX7bhgRC/tttDsZiUN48+CdU8+4sIA6UpDHB7P4SqhD/eizQg2JIk7rMSKlQ4l8Yk660mTp8zg7rr8/R4FkCZgyY+H6DWx4Ng7/niY/pJIJwYhWyX/OrGvNBQrjixfPu2cZRBySm0/eknIESsMP74JzrBk55a6JCuxgDkWVTIY9Lf5cSB9s3RKYftkzIwaLpjI0w+1p+i5a4hETuXMF/2gMOvmqCCljBdpYwdyrA5ryqbkwJRM2oi5/dO4hfMEi0upBYsPQmfhwlCcyd9Fe1jq+TlscqpI563BFBIUtqpvpOLzufeKLWtrRP5XBYXoJ0xmrR1XaPJrUYGjwJv1+IeTAxWRPor+INyOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XCq+hzsfiUTPZCWpQKWs7e+4PZPSKu/szoUsUBbfY5cwwgG8Y4tSR7sHgB3V?=
 =?us-ascii?Q?FCs6NbeIAWtdeQ/JK/aJNme7oszh62k5QlEnIrg2TY7cNA4FD6B4M6QYPAF7?=
 =?us-ascii?Q?Sfoq0jJvTMKROPYBZOR6U9NyQn7elI6SyvIkNBg/7N8Ik+OgKETf1FLjSv7z?=
 =?us-ascii?Q?U6kAkW/e5I/hn0BrvpG03Wa1z+C31dV1LsHa7szWB0OsK8uVAiseh1gACBS+?=
 =?us-ascii?Q?rUkGAHZ1Czs6Etd/8auELbN+eOJROa7Qbayy3imkeEXlRPNKpclmp3aclOkZ?=
 =?us-ascii?Q?JJQWF5+clZeDFpYXpUaoEgejvpa7H2uH21o5byZWu661H0Qy2TbJh8dU4mjj?=
 =?us-ascii?Q?7HkkBCCpB0fdqvUcgg0FRpSY0ZHXFnIqbkEELZicwOczstBrNQiMduYltF4H?=
 =?us-ascii?Q?D19n3b2TMSJ5tQiL2O6/VdMN2/x0Ts4S78xa8Geuzq/BahlTECZXmlvjfTo2?=
 =?us-ascii?Q?jjuwK6FsHdx7Q9iwjQjT3RrSonjMFFJBtzGej7qcVFxLdhwsRqjQ9EQbmKf9?=
 =?us-ascii?Q?XZpFJOBpDsch3sn9B2OmD/At/3eE2qGqqx0ydPZCn+CYNitWacqhhSY24TjO?=
 =?us-ascii?Q?lwBmoA3elm1+Rz2gVhy3pBZ7CUwbpEDtOsHyFoHX4Ct89Y3eJYx2N97U0Ydr?=
 =?us-ascii?Q?eIOmCDhfj4f7/YsSQoopRZHHCl1qjg21e7gUswRkJhbkTwqa0k8LsBcsX3Jq?=
 =?us-ascii?Q?73DuKSVLjOAWTBBl465/hB9ofs61HwJtHhi9R++7aHbVpk0iTlpe5JyV8Okp?=
 =?us-ascii?Q?1klSvbRL4BhVR6CM1necHV5NNYc6/C1JK5fkERb3RfnrEVSQK5OThAgb0Ff0?=
 =?us-ascii?Q?vZWKM3vX7Hte64ZpIpvPv788qf24j23AWutwNW2pHpWrGN4vubhiTtbJRY63?=
 =?us-ascii?Q?M1FAKa8emLy+6KFdwrzCiT+391D+4H1dhEdz9bEQv84TnvAE3VZAPLaY+Hol?=
 =?us-ascii?Q?YHZz7zqBPlDGa6h9GlYimvG6sao0PMRC3l1vptwxoHckyr/WZHH//e4B3caX?=
 =?us-ascii?Q?lb4o/KKWSODPHxhjlclVm2gUncax7ZfM2ZGTzNreo3JJFsojr0UHQYwmCrBG?=
 =?us-ascii?Q?mfLVOVhzh/a7kVzNIXHKnEhVrXHiWXkTsA2vcPlojBkpi2j7+NYHIiYIlni7?=
 =?us-ascii?Q?J64tFbZlhHpzmDMiNgSb3DUlZFYZTCB7LUHHHSwc1jV1dfZxN3GPwm68EMYV?=
 =?us-ascii?Q?6s03kJVcMlUX30V2ufPjof23UNqLMnv21HS7sc/OJF1qXc86WPevz0DxsA5Z?=
 =?us-ascii?Q?IaLZSL5YIM2vBEFwW0bK1vMfGRIFT3fJ/HRSPsJYnv/hD/rxjCvT86FURVad?=
 =?us-ascii?Q?uCLBw/fGYYwg/ns7bpzdH2r0bQvGNu+55feabajfXEDpgv7cSuDgRj4xg4W2?=
 =?us-ascii?Q?Go4Q6fBkGpTEn+PZmhVcsHzaoR8ufObtyJUG6h3lG/IUDgwCvvJMUpaq9rCG?=
 =?us-ascii?Q?K/aJbIIRJKhR5Bt/6O0eyDMG8jBl6FUUGiIDKi4j5FPLrbmTRUXcqrvklKzr?=
 =?us-ascii?Q?E4ly0189PcXEKay6znR8/qyt64Z3aujZCNLS7rQgy/d9i0olVbyFGRGCWKwm?=
 =?us-ascii?Q?aPoee+6IwiirasSHFGN63GVH4LoG5y8aBPoXRIZv3Y8aRqTeXPWZ+aKPdSCR?=
 =?us-ascii?Q?Igx8h89K/IhGSOW02Csmt7Ho7RZOEh7EPkf6x7uGYagNsJvahFTU8+IhiuFW?=
 =?us-ascii?Q?mDCe59hzOvFI4aN/YABUtiJW6mrZsYXzkapw4zGb/V3a1EfWmZCq/LMwFqf6?=
 =?us-ascii?Q?7jvvOJ/mNQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0070367-86d9-4a53-b3ee-08de97750d15
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:12.1077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBC4ZGTBHbBI0qfqXOemnL7hE15QNaYXqGqVA1huj663fJ16eLP093Amdkng9o4zVMYxC//k2tZLb/4wdByxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

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


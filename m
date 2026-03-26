Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B04338F252;
	Thu, 26 Mar 2026 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489181; cv=fail; b=KvXfky6praVLuTK8VAp2lZW9Fs9HoJUuXpJofpEpNZIcGTi/hlJMIaQ2XKUqwYFshQpEAxEmes7ury7Vdrd6ciJXXAvql9OY4GQ0mQG5nyZ3QwG0+A05NuMez7zGfGJ1q7sw7RG01iVGZtC7KGvpsEP3hYmfaemL6+3Ut4m307k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489181; c=relaxed/simple;
	bh=Kh44LOzmjxfd9KNVo/eohOq9Gr9WpEJ405Um4bz2GWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tZQAfbxIKFkzq40RCvhTkB9RBfesf5cHjTSViJdes+zynEvg3MshTdOg+fpFcjLupbo5v1wJOKJvDaA6ZzEnAv5IbAtYpU8Zx3jbGWQkJsBxBAZIsM36qgWFXGLqW4VVN8dUKJ1F0NxQZlXEZXL21PPN3gODn+wow588xUnd0vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PV9I9mNV; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PV9I9mNV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfOIoN195JMv2qYn9PXDRHCKQJ2CHQJRT4wUmaBYNryNNvgMfSCCR8VuuL6KpMz510o4u5jNsy/zhXrlm7ObcRkx+WKQOY1uPe0TL+oevf5DHtvYJZBEoQjbAlu4uliRqL7KP0M362ncK8O6JVnD39esXsmcDr/iaout0i8aKwBs3hbGWoEV04Z8PaorCDocTaT2r9OpuxhrD+lzoLVOlGyp6avqxjIdXwXalRTliZAVytogk/NEIt+gRTJMJ5f/jJa7PILuNyXC3UGk/X0b2bzYZyPdwyZqGMGlHwdGevPfGleK5D53S0oQuP1dqvfEsYTxEQFLiQ7vAb+BDGWb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=pUx+uksq2bFEfJADZrDimhiMwJnQ3iL3BZaEG9ig7LacOM5LvHU3Qk3nb7n5weqzbpDGblF7g6wr/IsQxdPRPpsz1Fmi17QzBPY51CLw9iZQw10ou4d1JsA4JBA57RfkAgJJPpnBHKieOI5TioEZ9WQCOI7fGpX4GFn7ajsbas124SqReADESQiDp5qQjwlsdAFFLjaz5axFiQaOKt/sq48jlXHF8YfF+UkAtYWXV/9pCe8x655fIgkTfG8E7opLGSOIwnjdaPxlLI4203PyhXgOgwZFlrCGpZQdv/Ml3fI4bAqRSZZLF34wqqNIv7qYQwhjibqASY5qvWb3ulBqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=PV9I9mNV8V2eYQwaKKoA6mPyMr29iJritA98kCIF4w/S2RyxPwm6+o8/W8E1pearSJeJILo/yyzBc3PrpGf6T62xiXTHYJMweMJNmFM75C5ADJa5lG+uqIg03kmwKJDmIQvl9CdiB9JgWvTBVqrzWF7w+NCvZwoQ8HaZGOjrs/oMMsHc3RAaEK9cM1S797mKfHpKD/FJzvwH1g4vn3qr3DeMczbH1GEXkWGvpMD9TkUZcPmhUWK0RND3V6fWbTW+LAp//wKZVVkD8s2yxSnmr84jUuT+LQVnYpAt++CY6V4W6S9CADPCPtXOFi7DM0Y5R0UbegaxDchsfVbi0NwhOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:23 +0000
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
Subject: [PATCH v9 10/31] gpu: nova-core: add support for 32-bit firmware images
Date: Wed, 25 Mar 2026 18:38:41 -0700
Message-ID: <20260326013902.588242-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de6c457-1ff9-40be-540c-08de8ad880c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Rks7vIbZsb5vt2YUZqVZwtdc7MCPDmwjp42i4TmH/p8ImYCzFMY4VAr0qkDF+kM2EdbwhHBtbsW2fMhQwcAMggVY6wAMIpp5ioA1+u6VR8qA4otRJTTShsTHf3m6/ixT2mAPCyW5pHnl+V7VCE/zKp6mkCrQnlwohrEkEBw83C2+ju8/CPjumEv0K2HU4uEvtHIfKvYogHB54LESV/wpAOR3cnFFX9Wc1llFojyzBOGyvVGzNflBcT3LmqpW/KYJY28DzNB//J19znds3t0KKxUmtubBYCxvF1lgLtftuqaBKUmBf93j+ADiB74rYzcXvg0SnRhQtzA9iablf4Khpaw2D5Jt9OgLr4ifHmScy7BohD30d2nRVsXOGsRLXM14RsQJ919eD72kvZsOwGnGGM6N+cPJANYgiwtwSMzlUqs9Bdjp9PglxM11gXCeaMuy8cI7dMvliOefKsgre1GwGyd3yT89My7q6YzSjbJEf+ojd+KrPFdgvAycO0a6NBvSmBkjP/8aqk73fQy8MGs15PVF6kom6nX+YkYJKwtEUZlCPK4Fi6epy7LXVb0yVL8E1Vb5rj8bi2h4neBNgSMXOXQ5Yd5jTneQOwWx9Y3UbgZkxmocOH20OOwnZ+jnyZl3n9dntv1FrTPbsoxi5S+G+zMJlu+oCaJeNNRQvDCCR0aLH8cVGbhHxw+2ku2QFoSzF4+k6gsqhHBZ/HGnrGo+MBNJaXpKg84MaFSjYXgQUqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TwkaVQ9y4+gL24RJH9wQmJ5qV3T/8DwEKpUg4XpDzgUa9FzZmsEIQPi7/mI6?=
 =?us-ascii?Q?A0Ixt7648KNwjjf0o58njeCeq1XqrkqNnzQUEwKDXk9qeB4fbfShhYo83UoZ?=
 =?us-ascii?Q?qyJxqgzs9a5FrIIwsGE+1+48FwisxoAsl8EyI9UigywYElTKPqPAADGwSRyh?=
 =?us-ascii?Q?CSmnJJ22xK3i9ka7cIoIxpBXqr5mwYSkNmzeUjUeHM5xxjHCeaJPHBr1zAEe?=
 =?us-ascii?Q?AxHPZyysEI4Aj3mjCo7iBEJ5V8sHSy+0v4KOgA6azoWDCGjfpHZkM8BeGypZ?=
 =?us-ascii?Q?cDZYWZWOCLYRbwlKNr0PoIDd5uiIU2MapZLzOytBpmA6ekExjKmK2qvoaFop?=
 =?us-ascii?Q?vp7frYoND9NpuQVOutZw6rWm/iJ3WdIhILJF++oPPttwqm3BVMW4l2Qrv1bp?=
 =?us-ascii?Q?PTI5zBJYiKFpFGuVha27cLkWhNlZXtt1B+EDApaTL45CR/eTkOtSrbcjLTyr?=
 =?us-ascii?Q?HtvFmS2paEnAbmYG/hL6GnbQo59VN9Lz7YpYQKfAtuGWoqAgHRr1l9SqjLM2?=
 =?us-ascii?Q?5dmArgWo+RfDc2Rdzx0vus5sCd7xRG5jpckjxDCzWMpqf/4FxwvS9cHuqaum?=
 =?us-ascii?Q?qGKnbyvIIMknE1P2HO2zx8tuV3OoFIlE13Yklhr9PpsfInLRvHFD4QvdM2UM?=
 =?us-ascii?Q?cEJ/cwKYTQYtU5/wMOIV9FSH5x8OER5bvomerZsfuWqi7CB3pgB4QXj17uhS?=
 =?us-ascii?Q?hNM028gZUt93Xp7nqyVxfVgMYo042zecKYqIIszIKHqzwJSYwQ2ABWfQD1qT?=
 =?us-ascii?Q?5d+FOJFOZaSwx9pMrvX6OCCXdR6MUMBJOz6+esJkftzYIeF0AL08uWuD3q3X?=
 =?us-ascii?Q?qBAUe2N8zDHT923fTUa+ELELgYShumOK+9yqwRAiHScT+Ou9PGjPVPs6wV4S?=
 =?us-ascii?Q?5giiAmFAcQ3xuRMOweORMTRxbbg6CaLzu4eJi6b74kujyXF/l1isHS644VAh?=
 =?us-ascii?Q?UxN/T3AxN/xc6pgcFmFQ8c7pI272heYYTN42NXWaKcmf5PmZHqaq0bTROBzo?=
 =?us-ascii?Q?T6xB2ZqymZctNGBv1LF84ddk4YQcIjTPX9lObgUZySkO/iTNB0vhEjNs/33U?=
 =?us-ascii?Q?yMGG6xE/MoyLsXIT1Ih5WWLkCLKF+GGw77FVU02uSz81NVKn2oCpPDWsUGnB?=
 =?us-ascii?Q?nAsLuDjrED56LCFzVLj4n427EXSuj4MLGioruYC+RPOL1kW536hn1MLeYqbl?=
 =?us-ascii?Q?qfVweQ2bC/dinU0nSciyjFdzJtMnqB8iLawvBWcImSnP0UReVE3Q1NpwUuLs?=
 =?us-ascii?Q?KanWoCqDfDLcuQ+So5vPyBsyFfVXautUeipdESwhjFcXY8HM16bFYrv96qUQ?=
 =?us-ascii?Q?rfep1EIY4DuBqiy6L+bSxTZXBVvsnLetn9aau0d8K6D3p0ezFMH3DRGebsQY?=
 =?us-ascii?Q?8jmaIbXf88MjT950sRraQx2totEq0kSKk4HdLA4eAzi90XgUQxI2r9B5nI//?=
 =?us-ascii?Q?aEtSGhyBvR0R+TlLCT4AAQKdpKHr1TjBTEc3m3JcGaaQAJV75Wxo3T9fIJIl?=
 =?us-ascii?Q?tD0uHPhmCOzGnCGKNWiIi+bu3gc6GlhS+Ib1iBkhOnPNif5qjjUPBfw0L3vz?=
 =?us-ascii?Q?zGtZG+cBGkdDow8GfYSLtfe5CN9eKaCHTPjXBLaOFgrYyGN1R5lsK+c9XwYd?=
 =?us-ascii?Q?M0jN/3H42VQMQAubqrXFQgfmniS3dxVnwSyD+CjR277coS4U+QmyA547n4JB?=
 =?us-ascii?Q?6DkP4Z6YjKLM5ga2DoRZoWWUJ9ksbx1p2d4Ns1zOBH0d62wkhCrm6u1hkibx?=
 =?us-ascii?Q?V6VDteNJFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de6c457-1ff9-40be-540c-08de8ad880c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:21.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pO6a8vf2tEKF+dMScRvRfUrr/SAYWbc6Iuxx46RAvB9Xnb9IxolQPxQVXAKEpCufHn+PmWh8/ZlUVqOYRTKafA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

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


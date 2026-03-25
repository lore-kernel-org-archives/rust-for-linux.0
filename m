Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436728313D;
	Wed, 25 Mar 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410786; cv=fail; b=gH/+fpI1CUAiqcniSqxJUjYj684F3P1A16Fx7ZdPP71Q4kzDlrLduVrIQA2T3TvGZPEqBdK/z8VzvKfJcz615+Fk0HwkZ6ASCw9lc/y5gfLoRh/d4H/1iTHPUVGy1txcvRyR58qDIhuc4tRvvtV72vBJpa84HosBE3wsI6TnulQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410786; c=relaxed/simple;
	bh=Kh44LOzmjxfd9KNVo/eohOq9Gr9WpEJ405Um4bz2GWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iwTNl/B+T/JEoF8XaIVoP1AN+WvDAtI5pTBKAuluHoEUrWJ5km2Yj6Un5x2q2CUtp+bTjih9WvrfrHUfILV3p3iaBQblKXmjHxyRC+smW0Z/MMeT5LAgmU3dg1D8OqnfZpkddsEPvWSRN9906ij1QUFgGWwMCGF55d0tcK538E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F0b/KEfA; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F0b/KEfA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQnfxRu7yzHxRgkYrfi5GrUsCu9KdBiy5KrN1kQBNb0ld1DWiRlvicYFEJvq9Hu27GXEXlK7WXYPB/Lktqx6tVjNspMsGNC7itx3HRE6TlNYLXC8/aJQqQcskPWGOmK5W70lF4qfiHFGuyqL9o3qj+wCvhYIylgP9P2MtG8GEOz09IQLWNNX/+d0FOS/XajG3BMCvba43w12UE5R8v13KcnGOV6kVbG1TQno2LkUyijz50s0ztrd3JxLlHP7W6LZPIeTsJ93aoHCyZyLYz8Q7cKsMZjimmhd+z47hN5TBkDHVFa0wcNZyy0x6t259dJJq/Q1F17tpiV4OD8yAWx/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=RvvCaoCVoGYnsdw2UqSuHA9pQ6bSvCuvF92Jvme83AFlu9NOkfuZU62+ZfS9Nc+aO1CdA7DEvWYZvHI7/ORJGl/lzFdtmKVmnn9+bMhVrzfF34VoSMBub80JWc7FlWE1M0U3HxAflAo366pJaVTRPN7XsrH7xF+c4Q4iMN4ET0GMM4RDloHNiBhI2p1FLdE+c7R96wjqnUeqkuu+DJHXbHi+lTbc9N2MbytrXVFA8wgNNbXij4U7f/Jupr+Wv977ssUTBLUt03/VBdzW8m38YOasM35gcY5lmlNbxKaj1xV9v6VaTDElxFXYfJeVChuVboj5j+MzguyTriJCk5XgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=F0b/KEfA4c+82dWhPmYMZlilNPyjs1mkpnCEtqv9jzus+uPm6O/zSb60yxbl8aU7vEXqvu0xcBR8eKn4WGM5UDijhhrVU0AZcRnkmc0zP/fl3DL2rwoDOHcGI9c4tZk59SBSTRms1tyI0kmh8fNCrRzs4NbJwh9jJlA3cn/x9JEqz3yCeQgU+cGZbteTHozGmqt1f6xTHwTi6Y6bV+3V93hhby5cXUsAuWSHscwFbUreBt04p0MkBFufRM9q8u6VSp8HUWUxKVD5SVANIT4PvvbC/Ym9eCMqpVRrt2QOt3OojhCTxUmaV6EAvcs1+myTVLvSXjHGvw56O+HeEdTYHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:57 +0000
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
Subject: [PATCH v8 10/31] gpu: nova-core: add support for 32-bit firmware images
Date: Tue, 24 Mar 2026 20:52:21 -0700
Message-ID: <20260325035242.368661-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 712d2140-c5a6-43ac-64a7-08de8a22007f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wBhg112807TgWZjJy3rImOhzhsyZ6c0yaixYNrkhOVEKF69zvUfG3iai1q8Y/vfjayiv6jisoeSV0Y9Hij9tC3ZE3t1ZZ5pJoSfO7utYIscAjh6rSxQcwcagl48LQHlpv/W1Vvh2iXZZXuX+n5OZombyN9xlsQ6Maeb0BTeQ5BwM/wFLib5OPztCRt06BGTzvBaAjOmnEbX+1DntsoJH70GE9vXhtnfblQNGKMH3ZINMTHGuAbLyBXcDhxMFBdoxQ91S0s3lHsIc/WdTyWWxHtxNGFiJorJllSp0lcRm+rwQGK3WQeJCWeLR9tdn28WPAaWe8UvKRG3z99Vv+4kXmHqOmGo9+U+8v8nWypl+aiao1wqKodL1tSpiG+WwKFEz3ko1A6UfTJC+2BQIIMkD0V7pKcQq8Sm2fa80NwGkWZAYkPt0pIHLcToFGeWZTYHXs/flaTO7Z3xitn6dNREjcipc1CgMYlYMdSnKfk6ubwPTWfSfZqJi8jSbuPLF7/S6p8/j3AjYtQewk7GR9dNPdnQrflbWfnZBVKBUvFmIPIM2Q8kFwB9km/76hNEhzOxdrcYRSXOIQQtq99jUCC9dw4l+tMP0psfvRdkJdNGiHaBxN+5ZbQF7n0Sjgszk2EmQr7Bdm4T+vO2Y5u3GdmkYm/95XSaiZIcBhQCuf7ak3IaV2+9xgslxVZCV/ujLXfAo18xQTiIIGA5Lq98feBs3etmM5WveVSqPH4eoawf3sbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BgUHRctYDUoPQm+BwaBEOWABUG9amfbfpw5yaZbtEP5ss2QHCDE2hw1Vl5C5?=
 =?us-ascii?Q?FDNPYxIxHDJ7TSyasUGzI+GHYUAAWPwore8XEAZ5YUqG1nGtmob65a6cs5fd?=
 =?us-ascii?Q?D4HZzyDT1i5C+1d+wFCGVv+0PfQAQyLQoyaJSm7owtyxBFn5JqEIv7LJUzez?=
 =?us-ascii?Q?JBakUfcNK1o8l2sVfJFWTuuCbOYVWdylyMnMWkUr3y7JPQYopBXT6P/S4Cc/?=
 =?us-ascii?Q?K64KiWi1gkrEAT/J3mAEIjrP3+ZC0WVxQcSylcnRw/yyzst+c5s6M3MBEpg5?=
 =?us-ascii?Q?+5RY9VeaGAfAhsMjBGujV0T6aL6CrQFOy0kNdFzLSRLI+Byda60xvOutM2H4?=
 =?us-ascii?Q?qQgWfgA8leyPJm9KVBaYrBvcrFD+4+E7WLkqJTt1n2dCRb/Zz+oR9dGlq4qP?=
 =?us-ascii?Q?WezRRgxHqtOflxZIrUbWQIoVuuankv6WGMeria3RMts314mGJI8YUiKDR4d9?=
 =?us-ascii?Q?NZ+LSDskpAXpA4luwgabCk1MkKXXF77jNyRDjsR8Yyo42S/Zcb/uDOsZ7evI?=
 =?us-ascii?Q?FwFfeI10AFgMRp6VdB0MUsUPJGK1u50MhpKVC5+/9divMrmdZXvNHi4PniJe?=
 =?us-ascii?Q?hXLPoV5+PZ0anxETBtCL+dqi/kmc5F74yJB6InR+kw2CeOHA+mH77l4zKXuG?=
 =?us-ascii?Q?jIgrBWZxsqIWeXQ4BUUd5zYau7cxcSZHSzC9PpA5KCojxYD8hP0nx28ScEwb?=
 =?us-ascii?Q?NDI0dawiqHAavR9WSp+t2ZaX9kQHEG+IpuRJJFFLicAs7arIPAVPNo1E/JnL?=
 =?us-ascii?Q?8IzZYjWSXX0OZnX2rs4ZG6kG7QoJ0gZG/LZEFDNWeml/lXeaCKLNdckwam+n?=
 =?us-ascii?Q?4QKjOPKwPTWa40bTC8kEN4N0fpLnH8XyMxiKkuxjRlT2XlaYS7e6OfNji1sX?=
 =?us-ascii?Q?0fY2N+M5UBKdnPCW2VebSVTIfWyQvAGuMDPG+I4TXXuZxuRf3dHu0Zbw4N9S?=
 =?us-ascii?Q?0GSncnqfFbytvCQkKvuQpTG6+T9pq3mwaNgOJLcYha1cVigT1BvbsXdAm5Nr?=
 =?us-ascii?Q?g2LOHOxqBg9GzDuO+W5VnraN28WlP0lc1SCEeyaxUl5a1emL+wD9kIbNzOd6?=
 =?us-ascii?Q?CDQ449W+Q1TCBwcSjNPeUFdBmu+bKHLtvvh9HF4EfDli0Phde1KZwqh699Sg?=
 =?us-ascii?Q?nE1ZNnQEhIqROkQawd/NQblDIdiF6ftxdeHDJA15NN6FhZ9kRSFK7Ps8XekE?=
 =?us-ascii?Q?3kVeGyM6LqT3gAbqQGdvZnjUhiX7LxtFnkHYAZG9PNUUGjkPou7havZUmdxC?=
 =?us-ascii?Q?U8UM4kjNwRKoPAmeTLue+DMP2GNRa5Q1YwiLrMRIrf+0sDcGTmurzrOhZJ5W?=
 =?us-ascii?Q?Jz7GtIJOTo+lpBxjNmyk0HcPriMoos6NtoR0I6Z100dgVEC3PN1tc9Tj4Mf7?=
 =?us-ascii?Q?cQrYo0XOp20jhtObisc6ccp91jbVRJ2sMBQOyCzfuaoz4RN044EgPkfDvBY9?=
 =?us-ascii?Q?hocsXni2s95hRR0CeVA3yJeam702kYuTFvoN7A/XQ4o82KmFIiS0zbFufpXL?=
 =?us-ascii?Q?B8brl0W/mjRWkkoIAkKhYkYd5M2b4/zYfZiEhVzv1zdsd81AOeXqXT0ToFHZ?=
 =?us-ascii?Q?RfORRJ6fcJB9IVNNjy80BdFZyywoQ/A4fQIE42dfvx9iNHb/R9+gFbB3yreT?=
 =?us-ascii?Q?NZQVaqV2OQO3IGEA0qKyKqzfGtmlVot9JS0+IiJnen5a9WZe5EL8xndczceF?=
 =?us-ascii?Q?t3tsvWZSQl8YLkmVzhekSS1ddvk/1eWPtwKPscmwhjzC6DKr6YoDwZo1TAj4?=
 =?us-ascii?Q?JbcHsfxyZw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712d2140-c5a6-43ac-64a7-08de8a22007f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:57.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KpmB0eMrJbz6V36rfAJ+FxbpwhKCiRyqJPii8s+jWmYFdHUtSAKNF+hf/h4mOmUNYIsXjgNdKzh1kPJJT4ZBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

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


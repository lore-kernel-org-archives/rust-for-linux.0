Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02D3F99C9;
	Tue, 17 Mar 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788065; cv=fail; b=sXWhC1qkYQ+uGHpdP6vkfZR0Y5K+pIH1xdE8NAmNVhhWrPYehnPhzw2/vB8KN44C7Af++gHdo8oTRz6QfY7hSz+FCWsSD+qtjdenh9b44qEwxOqmIYntOyX0oa4XjcHxRcV0JkB8wedFZ9z7Hi34Z2j4cptaz00nv+9T10ZDETw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788065; c=relaxed/simple;
	bh=Kh44LOzmjxfd9KNVo/eohOq9Gr9WpEJ405Um4bz2GWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XrUGkrlZP7oICrY7glTVjf/df43sYui5zwyy1634dzQ5sgw3cnMt0nQoTuPBKVSJQsRErlpGVpJi6Co/ZsGOv5FrPj4pyexGWXQ3hF0a1ZzVQUiagAzQ/gFrJFZ6pIynPI8qjwKQAM/pTCptn5JTzakqfiaMR2mbW00XgZHMc/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hHfyxB94; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hHfyxB94"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyfAp2uZ89igeKYhYm1pBHW85PETn3ENH60z6sDpYN0hcz7hONj8anXsMhThJek88a1Hnei9lflyc90FiXoMFe43yxZKsGwUhNIUH1T1QBySZ59HUWmuph5Ve+6ek+9VXO9RbZEY9QkySA5QUNLYRtfl3Ai6Mt5WqGKYX953+cRJ54V7Ndsh4FtZhpWcNpbP5QfeLTHZBHeAhusimarIB7CPN6x6VE1NZg+LfQaMCbNhEB90jDKf0xWilu98r9XSy8B/l7tY3fr/wTAa9207roRg3eISt9LrLGzcmd/DoklPhjzI1rG/QC4noh1P/ixQ2LOotSegYqH52CLa4OdZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=qjEk+EQl15hoMPTpaheWW6EnbdPSVTE5BdHgdA8yxBLV7CrknvMRyNFLD6NhBYPkD9m4dr1QA7ubo29T+yPaFWUyrIuji5Hv7vSl3N2LQdrJrTwwlzGCYb6djJQWSQp65KEmg1hzhEP3lkqpReGHwaLimyCod9OvBOfcfPrH0pt/B2x44/zy0t6RKdqySXy0/rcF1/oXKyFD+4x1U2mBE0nzjtntJ5x3xWYID2q9H0yHNWBS8y5Vi6aUErNbRMeR2v7JhOK3whjZcw9nZU8AIvAn3zJ1rNg7EHNVyWsu9c48u8e+Ta1Zsc5mlxULrsJLtuC8TrARPG78hHp+qwK/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHWfLfJwS/dFHO7S12MWlQdBJL5sP8TIQoUDspv5VVU=;
 b=hHfyxB94OrUBCVhNx7gqCl3oFmkpACVEYToujApw4h+tOCjRAuQqiEag73PhGN2b+nstMO0dxB05GO0oQpLWtH7A6IL7u5Szov5XGeKhCPbGA5oBKcolISG9xu/Jb7j+ItQQRBtbEAZHItYug/1HQUDzZ0/hIg+PygBn+MKC+5UIKedBUaSrm1QJbWMroVnkoAzL4FLufAPV+43lrA2jl2MTdnuOqEV/hGj01l9TTm3M8jB9ob+7XpdDn/bmeY11crAfcBeLke06mTn8QM2kshQ5XuIQ8e42GszA4pAAktYD0Jalx5ejn7DXRs70va85/nAXyr/Wa92Rd/+c6rD0NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:11 +0000
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
Subject: [PATCH v7 10/31] gpu: nova-core: add support for 32-bit firmware images
Date: Tue, 17 Mar 2026 15:53:34 -0700
Message-ID: <20260317225355.549853-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d174d9a-c385-4d32-edee-08de84781ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	H+YT0SDLFUWqxzwB/yFeP7Gfjqe9xkJ926SBUjiGuJzw4OM0DWLnSFMUP9qoNnefT4Danh1537gqD7KJown+LejVgiwT8c5zH83jupa6Pw98qWz8i2ROJGTmlKT3ZPjWayT5LaKrUprrXEN+4OhLT0FAO9krYGnlec3FyK9QA+czBd7Ulrae0RMpzwML7Vf9QPsOzd0H6qA3eBcuXJBl68RH45a7E7CZC2E/QLRqc7AoIkkUsR2AH8Kx0ZhBYsGnZc3gz7JudvrbwJ7ve5MIVAn/k4Z4dkyubzB01h6sABXDQ7nb3BX/67fGJHC13HJCcjNAsOqrNufYUcA6v83Al6+PWt5Y8WB9V7BxdfW7bi4nMq8M5KzlV3n0v/Q7noSwSGKgAZXfEzzDm4R/GW4KNKiKOT2pOrOHauDlTDutzoeemza9NTJ9hz1hFGk/yb+lkQGNqO9K9S9tGcSOlaPdmOXt3xgownjziqT8/8T8sgzvaR0/qupBli1GQZWEOQG4VADIsMXunBsSaL/mmqCfad4/uUXmxxB/3Ht3gBxVRkdvNsbdjgSu1mRnpEHVPffB4mqiktPMLFgqbiIjPbqVFj2C096j9/ms9MN0ULkIdPgWnG2QyK6jKVOd3p2zJ5Eyo11247g4CKZf0kt95BhIYLTJ2FBYrckzss6w1dcz1rwrYEIkMgaM0BT0XXXSQxOsLbCLEiSx0ykU/jb4zHF79dfQR0nR5HiKDaxxhjKtSyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nfaIm6duNFzMlzOMpFkrbaJ6dSCU1mhwtAL8QqHlNgMJcdRVc2knFq6n9Gu/?=
 =?us-ascii?Q?lwLybIepqzqtw9bTVg9Z4sxOmioWG5VuWuE/I33A0tjB2VjSJYS+Illut3Ag?=
 =?us-ascii?Q?Xe5I8tKtPAGxt+k80mNkaU6zOLApCgf79FCWnunGYeOw0nBBh6TGBnFXFI2S?=
 =?us-ascii?Q?/GcWNN2Bs6a4c8Zy2JG97p79VnvZkoZWseiJ2QmORoPmQj/JZWK3kEbkqvpq?=
 =?us-ascii?Q?FJ35nu8xPNpHvegADNoik1RzI0QuVofgODsfcw9lluL78jx1UfcaTXJxKbQk?=
 =?us-ascii?Q?+Hdj+goO474u/AgP1JiMcZH/2ih+K2762k5fZB2wqq1HFa7vJ0IACtjGYLly?=
 =?us-ascii?Q?ZTSVI47///XM5SB2SXWmnoec8hZfvrTmNe5oUQ77yZqm2A4TysMsFK7g3NmE?=
 =?us-ascii?Q?RYbdhYYHpMcKSd+SZuJuXPVGVasQ0XW9aEYV9xA8aYO78b1X/ulY/O8o/deY?=
 =?us-ascii?Q?QGJ59/VRih/NQyFWIJLOVkHWuMU5FeNqTcDHg8lEsiVn0XmE5zvyZGI3n/30?=
 =?us-ascii?Q?4M1dFPeDAEfOtgLWBTk34D5JO1O7kOfYNwO3IkWdsxJuRouQBhhkwrHHoTZU?=
 =?us-ascii?Q?qn8vdQykFM8c6E9t9IdSYE69w/QIq1IsWzjfVLQH8a/LvZNVVovlmCrO4EZr?=
 =?us-ascii?Q?JMYPOQoT2qnPghaMNNshvO6WnzKPvLReEV4xVbnjpXTvo7JGaSDWoGOvXZq8?=
 =?us-ascii?Q?Pu5Na62M3g2Iw9H8JCgrII4b1MJhvgJLEzjvOkIO/kH3ULt1JjzH2MK7YTRM?=
 =?us-ascii?Q?SnMSQZ7xDVm4NWxsjQmeCAzz/Kl4dUNTlZjQ/cJyC67sMnboZf66QkHeOgW0?=
 =?us-ascii?Q?+TxzpIN4yfX3NoIPkDePDJJ4blHznqLHCM8t5V+kO9t2iQZTpkMUaW4rx7c+?=
 =?us-ascii?Q?1zqaYxeB7ACevnmnk3lA161Mgdrr3DMvYlIJNdTSVHvlUFOPaT38wktGpydv?=
 =?us-ascii?Q?etjcYI0vG0RabZ0u98rOWWOCkI+hSj64pYCErczIrw1rLDIVozmdEG76NQbr?=
 =?us-ascii?Q?tfoZ2yvJ2oPHCy8BR9hdEvIdBMhFjYGyXZPOQA/AcgBResae6IznEE+QA1nZ?=
 =?us-ascii?Q?/Funj4I/nsyGf5lO+xvMbr0li9sKL9RKXcXZ4JlGkQ2Vnc+/ItX8fgfKxUrd?=
 =?us-ascii?Q?kwX69AXjo7z6lZ04TQkd5r9xeSuE3N5suMaHl9sJ5a51xydcbkt19dJ4g82q?=
 =?us-ascii?Q?6pCiwfakKyho0oEvmUaEsVZr3az1mWnzXZbW8JR0YXgg2TDT2o7GJ51Yjvu0?=
 =?us-ascii?Q?URvUfGtDP2ZObUz5zBpg4rc98B3Roa3sVl4S9ZjkmREkbjdiJG+IUrZS5jh4?=
 =?us-ascii?Q?NxEkAqsvp7UEiY0Ni9tRnLCnh4s6zw4rvL64ZAcyql3luthGYz2Vi48BfTIH?=
 =?us-ascii?Q?ozsPSjsG6rNqDgSLFxwVUxPXbx7ry8D7a4h5ujvO+91kQTg7TYa4BJijK6Fy?=
 =?us-ascii?Q?oMcgHvEUzJAfKqfXJOWNEzndeHO8PRCqC0aCMulj+rASxUykIlCL+m4J10Rs?=
 =?us-ascii?Q?zfR+jRvvio8xE1OIbw6BQX2QsNuQ/06kFqQyHxsSdYioU8jRWcQZQnpEtnmu?=
 =?us-ascii?Q?TTPfd6urmbqhW9IJ9lUqoY4QrgDC/A6MhrN81VROpZOobkEWhC4dN6UOo1b3?=
 =?us-ascii?Q?6Awu9rRuOlVwcRP5dX9oed/7OmJC3g326RmC28EPW7ReJJVSV9y4DqEUof9w?=
 =?us-ascii?Q?R3YEeKUv2vCBFF/X358habLXqa3hhXuBNVX2dAszn9UVFD22I9Qf3jvsd3Li?=
 =?us-ascii?Q?J37ADwJ5+w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d174d9a-c385-4d32-edee-08de84781ad7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:11.5692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLC0dae+jpoFIBCKKML5pxnmG5pYEg0JoLLMcExgqVQmCoP+92IcTJ/Vig4D6jTx1TkGKa0xy7rn2RJCdTlyCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

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


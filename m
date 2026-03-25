Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2722EBB8C;
	Wed, 25 Mar 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410790; cv=fail; b=Up4oqFDcjMCb6LDqhs8o0wtJSU7XJuAHVCyHM7cORtz8vcWkDxBB/X+DSt5AiGpq0f7cpa+wgvKgasGnkiEeT39bOHAclCQR3BsLY/klOK9hbvQ/BYs/D3aW3FbvuRDBSf7zpoFoSjE3KDXeqqQcZAfPmUC8Rxgqf/18uJJd93k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410790; c=relaxed/simple;
	bh=ZND9T1qy8PGDVKj0AUdnQVghUXeBCu2IaYStYDMrt4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cs9yR9wprQhwJCorzd0SdUtxF7DIlPHf4cTdmJQQLpLbxnk/CSyF6mQUVtvc7FISGiMWTVfesO7D2WmN+KS8FbAnlQ35RLDRhh+uJy5C+/qburCvrL3/dyeOM2d0qCfR9elW5ZmI6PCcmnvtR0RuAVMDXLpg3q6RsQ0eALoFyJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TNbBCFoM; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TNbBCFoM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQJCxI+Y4gC9Bsve0h5LonmdHQmP3kLrU9juoHOn6LWKutwRp3XaynlnXNM0dP7MQ7ls0rfTMYawFJVyYaPFHo/R7FJFvQ0HrNhkByWo38Us2rPyTsHOjp24dpvH22xMC0ZQEUqKjYPO7znY5J69/wD9lGpd5/qee7+etDCTg1VXZHbTztubyYB8ZKpzrLdG4O7pMd0D41x+CWsjmN3J2S/X+Dx9NjAwMdVm0o4A5F2fIn5zbQi2wC45DGVZukgDZCFwSio29GjqBazcaRU/eNdyvUrJA/qGxIz3WJ69ap/NwF9mq1z5nJveq+8gvnM8Zs431zaEqWHF5Q9LDye6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZiO5O6MG5ofTZp9FR+rwIZtnrrXIRdY2DIwPxZ/QBo=;
 b=HQJcs7q0NU6+gL6nEhaKyjNWxqEC6uzhvPKB7cReK/UeOF83snwGZTtYVD2z3RwtaKPoPMeTYLJAwkTessfh87WjjDW6QqSfn7RWmfWct99atglPDUPlfn+pMid6XpuR5UDxP12mPjvKHQ7cEVwSaplKa+6qGMM0s7oCfK/k0enz8Og2ibrX5R/eyN3TA6amovoAbMKlrU27Gg4Erdo7jjP2EUFSDXdaXSXV0xMVk+Cy1sskHHxinP+NNvicr4cDmBplnZMLtkYcCqe7uuSRxJpeZrHPhsO+ZLR/KpFg0cHO3BBvWb/2lW7b/lmxGHQbP4ed2joHTu7efbsJJB+Seg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZiO5O6MG5ofTZp9FR+rwIZtnrrXIRdY2DIwPxZ/QBo=;
 b=TNbBCFoMyFsSrD09kL75dYCZCx7ceCu7oBp2q/UW6UAKeo9MQXD18IDfXIa17r8LrrbHx7aGjYIOL4NQnotuD8sdBmpEipB3FT0hAD0Zkiwnf9rb4jRs2FMLXxKgEZw+1348P2dXF3Hi80qcM2SpSLr8x2cmPFU9dmYIk2Duc/V5e3PlwMfLo3TxX3Kgr8z3U+TDEH+t1NAxgwEqScoMLqprXxEXndeo3VM/7U823eLmWD/qHfUzqLxNzA85xvU9BjbC9volKHqT12iAH6gL9h+POmnO8iqFV2Ve2jG6t4nFLeTFLTZv2/TvFEYJD6mEBdDjHNh0jfJIZCvuKIK+ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:53 +0000
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
Subject: [PATCH v8 07/31] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Tue, 24 Mar 2026 20:52:18 -0700
Message-ID: <20260325035242.368661-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: d54b2a95-9f01-4c22-9b72-08de8a21fde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SlYIWxGUVZB6sGAQBQ4vpGXb7xYok2oLomxPws8eh6umPVvO9D/U61ADjpLCXTzeecRQVT2IgqlyHhrcZjM2KN07WEOcruanAbE0IY2APfbOD6bA5ywsw2Z/kv7T215lldLUl2QnV9Y0FFMYpqrNDi+Rb/6mCZluPq6KluF06c/t/D1u1Zj46djBqtopdRAZyWMb0tINNCrTfzU8He4CV3xtsJuosunKmPOwyBiqolr8l/a7diYY6XfpVey3kMAXV0GB5IB7lDkULpEtuHhOiCk3Mv3wrPY9+IbB/zRpcT8+gBgVFirAUd2SXQS8H1GQCWhGinaypu3GPY5OGGwA1Jzgoi99bdGFNnUkKnJSSm8LlDK5a0ZTQUriEAMsRdB3/YJXPWPnjvO+/x6hfiMLdShRhdUFwGL+LOnndrFauK8QRPOshU8+pI8mUulkhrFABWoiNce1L6ORFIdwFtNcJmay4jnx1H5AONtF+Npo5cymgDNUUK6+kOBZLiDlRCTx4AnAbn75Yg25kqgUsqm5SlfiUXH5FN6+5pDP2gBohuaPszTLuG9j57MLS3u0de0S3Swx2MafbV6jDKHWHFMUgenrDZtd8SCf7uwTkV4fybagU31XWaj6546zqE2OSAsevrqSHpajw+AQxYD5lMnaoBWMmAwjWtjbtpnCQuvxkYb6Z03JJFtoezRGf19cCgcpcT5NGU9csPmPpnPJg61LbHS6IiwxrdhQahIbiAMssRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kPCFknl9fRtAEkhcMRuUumwApbvIaxjq5WU+1nObi7GK3EASWynlp8JDkFQX?=
 =?us-ascii?Q?hlLWPbvxDEqJlyb/a+P9EadoZRZO+98DYV0dTXi87iSRI+6sZybs3zDqXOCT?=
 =?us-ascii?Q?PMkmEx4nZEtRoEVbppFHms5fOSKKChVtm17usMZSvg6DpAhGzoZVfdpSPW8N?=
 =?us-ascii?Q?/twXIlm/a4f8OMu2ETC/mIlRauqn7IjLWl1KDuG9b88swCNERo1GQmmaNIpY?=
 =?us-ascii?Q?M2DdiKdH6KwMnq1g7y8CcyRzaJW8EkuPAGCBiA/T9+iVoyMO7yZU2xDmTfCo?=
 =?us-ascii?Q?uEhZ7jWHf9+w6RuKhD8A8E6MlXPkMznK3CizfUFtMXlax92HcMZlgLYVGUyJ?=
 =?us-ascii?Q?nw8N3FryNsbxqUb4K7n7Su+EQLsfaJNWMVREPzr45NKJrvUWQaRn21u0Z+OB?=
 =?us-ascii?Q?23WiyQ9IW5lk98dlHahXaUw0U/aHCTOZX/gUnqT80EZZIr9wAWX7mZxP6rBD?=
 =?us-ascii?Q?v9gK0botfoE3S/ESdKZwcI1HKoSiNWkxYJZvFBzFKv/sBAypCApxUjtaSI0q?=
 =?us-ascii?Q?i9k+UKjL2P4NmmYnQbhcs+NDvbaMSLFFKBM/Bh8ZI1/MLme1OVmEhtK/cyxH?=
 =?us-ascii?Q?irOUhqDCmNVPsqCX+AQI8qEQPfzoJVBuTuhLpvLmxZajnJWq0fQEjeWH1lNN?=
 =?us-ascii?Q?ebA6OURRxLK69YygLVMvBwvEtyHcPO3A7Hr+tljLdgNAV4W1o8U5+BDMRm8A?=
 =?us-ascii?Q?mHuC43t9rqafQVZPIlfeBt+dPMz153d8JZfHwVgm4kfpfUVm/j5MQ8nZ71WQ?=
 =?us-ascii?Q?SW9rVl8GZEEDUAGqkAqFQvF7jM1rlPZgWkDarDl8tOTV+k0C1ZATbTL4rca7?=
 =?us-ascii?Q?9mMEbTnUkwu/HjNyB2/AMYAc9g8fMxGr4fRInQPzk09+aiOwUtK20MzrBkhr?=
 =?us-ascii?Q?ncK66zA/YhUN96urfkWlszZXxaVMACuS/abH7bnjJDNcAOlRovmm8prmQ4He?=
 =?us-ascii?Q?UdigRMZHzwkaW8p4MwKdb0BK9tDTyX8F3vW3lifTMW9UMh1Ocg0LBdxMjFlk?=
 =?us-ascii?Q?FdV2yd/lwXn+OFzPpaxT7i9vt9u+aSzYYlR0Ivkb4iVB+QcLxkEGAH6e2/Bf?=
 =?us-ascii?Q?PjLzBFEzfo/84KJZCrXCORFDJTXxcByLcBli03ggb9xyoEVKZu81pe93YcTB?=
 =?us-ascii?Q?KaHLDfKNoYvH40z3CVdLw55BlKrzCWENxKLIse+p3g3zCdss7wj7+eRVNCNq?=
 =?us-ascii?Q?EZd71YzXrp1KhStqcL3nwjfgb7tUF7w2KkjpA55j9zMeDiJ4mpNTg4LTsVXH?=
 =?us-ascii?Q?gu2v1wIWXX9VhUncPUQpPiCpImkc0FDXNyPe4xR0Vi83FUt6Hu8SDq1g9JTG?=
 =?us-ascii?Q?42rREjvHZPtO5SCejeo6ZCqrXaLnfpNPIglJMqEDynEyvRKc7lPM2JU9Ag7z?=
 =?us-ascii?Q?1SYdJkJ47kdm9cZTR56wX5dOgiXLL6Duer+CWnWcmGYwNg7CPnLBiuu17z9c?=
 =?us-ascii?Q?zFc/8vF62uShj/40HnKIa8TJR7t4XYddONdILfonMmTiGvZpJH7KNn51JTJr?=
 =?us-ascii?Q?W6FdWOoEn+M3xLXtCV6ZLriv8yUY4clj8mZYw95RGmKEz8mhDxi5w61baCAC?=
 =?us-ascii?Q?UAwW85F4AKwwqKF7UbKH9Lf0guI1PZ2Q69XWQIjqvOMOEvQpTP17IGgpt8id?=
 =?us-ascii?Q?N35OeYdxk6jZWILo604/iDSMvj7muXDUVpWTShetJKIomlPaE9VKHOq+eZUY?=
 =?us-ascii?Q?n3ikxsTMICtZ2arqTEQacGiRKVSbGjhpGeNiXNhOfraasYxMst3x1OKyIpZn?=
 =?us-ascii?Q?blV0bTGRzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54b2a95-9f01-4c22-9b72-08de8a21fde2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:53.3198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/GZmNNFx0xbMp3JhnVBapLAmKUzOWMzUMHZz6Wdibo1+/zaZSsWuBSEZQY1T1exQ+EiMGLDPKw3JGAJojaQ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

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


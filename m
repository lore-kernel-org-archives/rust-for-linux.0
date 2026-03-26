Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C3E1548C;
	Thu, 26 Mar 2026 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489178; cv=fail; b=j5e/MIDDVwzPIm3TBGbNgjGX3a8OtvhQdACmZDDEFIQ57tG6jf/anKgwSMQCEFiaM9kVEtbZbis6OjiB/h87h81Xx2teqtSZ5OfLtZW5zOaWaSj+fmZs7K2BDTLShLtCxni5kwcrDVzmndz0tkZRHpcrxWldIEp2yvEmMVnkVPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489178; c=relaxed/simple;
	bh=sexbf5FC7DeQlxCy3X2iQyx9UjDu++IWcBCdRPNneOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CzO5b3ugTJVEBpRch31FSQNX6HAjXfhm3spJiq6AQLnGLS3sFpnSkggjBH1sKD65paPCSI+yrgf3EKTNnRkap5/01Ih0V/GyJ7JrjOMTrjTwuyi4mDHY0sz+ZVsrxmWRlgHK4MHdHApSj4j8syaO4m5TSrUBZduqwnNA0VBUpp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t1dfbiz4; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t1dfbiz4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMz1Lfz1QNpG8udFrxa18Gh8PeLaKVgL0J++b7kJvzyHC3PSlrKzHgo/CoVsezCKvJoS1TpAwBfpybCJfCivjJRoLSjBmUSYnmj3GiV0a5LWEQagTsRbG4Mn996PpvAxu4l9MrO/Jq9VCO4GLJTxtLzHKTOo3YTQUYHppb/wQQUeprVwkMV0uS5tIDxdg5+k0VKxTQlpfVpyRSCRla9kKDXWpl+q8azx8IS1T+HM0XgSUc6U5tt0thnG0QFsYU1Oke5ZaUb+xobFiNU5Dsm5sXKJfi9THj3V5WqAKbJCFbr4G7A8xW8HH4j7RGWp2ogG3q7DBeTEyXGf6g/Dqn5fMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdvmSwdyB7fzHWuUrgMwByBbGBZYuoMpOkByWu8P8go=;
 b=bWmPM78ZWBEG2h30PZ4PcFSwz9DCG41x/ZUVe3mEnpf1vpISLKtqI3g0D2EtKqlEgjkw/8TWE+DxKtkOK7nZ73pCLuqEf+FJ+BoQAlErzIMdwolqmu32aL2gHFTZrd9DGxu1kg2Pg0MfQh4kdDPXX2mlKfx9hjiIXMpmSy6DmZFdtxVkCwuxq+eePEUJBC1BQSOw3/vPlK5JPCRmOBwWOBW+xUdgD1/J9h5Gd1YXjn4fRfyD2X+pvqbj7DuB8JVPZyW1Ni/U1MJBLtG3MhXcCpsGr86BLioEzlEwLOXBekbVztq5Htuia4cWS5Ub7iRDmvz+wkyjpT+2OATBO6J5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdvmSwdyB7fzHWuUrgMwByBbGBZYuoMpOkByWu8P8go=;
 b=t1dfbiz4OzHNlwC2ztd05vkFenx8oUXJjyTdTMfx+yy3K1ULY8LBO3k3IRGti7yLAEPhplONqFfez3W1DUXZB8W8eo32+0Pg358878l7I1MqjSKBUf3K/DhaULtltUiSa/CacjJ3W2WyJZLY6Ui/KmoxjDwFbv33/63BuKIDIig3NTLVKq4gir1AgkUe/09/bsRKzkzfKiAipOrPQQQU3cDvc0xPFYHNzkQ+KG7L8cqlj96sCvO+HOAqIPykD7VXOAelFnIed2joE2tdQ19cxEz/k+Cj56B+noko9gJjWV4v+a8UE/Oc9y4ZGQGtluh9hK0e+0EXDxmFzawUhgiX8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:17 +0000
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
Subject: [PATCH v9 07/31] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Wed, 25 Mar 2026 18:38:38 -0700
Message-ID: <20260326013902.588242-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d4991f-50ac-4b46-96d6-08de8ad87e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CA4WYhB9Y2rrhv+6wZoKyjbM8H4gQshmInLoXGmJPptEAOB/ip1UISqg39AJVbRc8Ao+4jkZ2BUxbtJb/UqtJ8XlQJDOfDAgGkC6xYjY5niFn7x1U1WJs+btT8rXnDsPuvTkQivWJJAUNJcCBgbFZ3r5e+n/Se/Tnw8mijdYOMEb+SwJ1H3YvnHLi3iwcA/D5rLkJyHN2qgxbo3FvlmO63WsBkcpC4LPa7OWgbc2llL17ABaapq4dilpLo6Ycdmq/bVszQ2VNEU1HZbeIvWQoIbGJmCeZ7OCiGGA/o0ZNoPGE1Xo7j71maeuM1wQNhq2vVYaNBYixvpRfGptlJnwZ7dzA951IZD8lye6aR1+1WD8ZEfQbQ1TCL/cELITEezkBwdTpeDyS8Abi7hw5Du//JhMbWq3wIZiV4nUDWY25vxjfWmXpHzjD+yatur9i1/osDPbaeSn5Njacb4W0Vd6sHisYqhuhJ6N9MFLSAjb3sG+fqhzPV79KyxncoimyOo94Wwid6KjVhkabEyf8TNFY5g2d5T2EYmFTYphEkD3i+ZKJP2DzMmP6y5My5iBYA7Rkb7XkH4bhQjNVzSPwcLvug4oNcZuiIweazZ3YlzufniocoUzT04K1RaDNHURmsFVqi+H5QOeKLByR9FqkhRl4Tz8vCmGQohQTGYw/MyFxhN7kq1WyYHsDjuS7BxZC0YyReNU+vW2HAYh3PxCofWFEJ8UoBBrx9WPWXkDUxhZPec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2c2Gho8lohPFv/s4Aixm5fN5HTgkmSHRxZHBQTT4O2Tf9JsOGLivjLhpteJE?=
 =?us-ascii?Q?DThB50Eyt0FPp9pPupTIySI9Y5aNV+DgKLfE3NqPTdlcSRFBOBf5s3ki+flj?=
 =?us-ascii?Q?RMh3G6uIMXfwJLuuC3ajputSxRGfFcnfeGgUF+x/zKSaG1iWVSUHPzU2PQtN?=
 =?us-ascii?Q?Cyh1RMQD5De+CFiC+YV6E8GC/rZvOJAlyzBQgxIWzfU237LjdkBDdTU4w+O7?=
 =?us-ascii?Q?GqwOpcpflgT/K+Bwldf93Bg+v4Sq7V7wUNw1TqcsQaKt9Z2ExQwIRMTpExvW?=
 =?us-ascii?Q?ze5RtqwRhaMiNDVfpAu3Bk3jR1sIEqr2LzNvly26+EFmIDl28JhB55uPLbhu?=
 =?us-ascii?Q?0MUi2ceHANoBrYnFkMv+hPnXD8ILDv9Fhk4WvVvVHZEyLBIfp3yTdw4VTdvN?=
 =?us-ascii?Q?8mKgVq/tXqbwc/+LU6dtnimilrz6Ah27T6vU9zTF6WFuaiw21VeI9bmszmaP?=
 =?us-ascii?Q?v6X/mnIgHwmCQCAaCb6MebwwrKZANKEjEzPFTLjdC6A4jQxYHGfCae9H8WuS?=
 =?us-ascii?Q?iKfsRmseu7ONjWlWQ3DeZm82UjQpuSUp6Q2gpYIitPGNtBuo7tA5Vrb18uI3?=
 =?us-ascii?Q?2Ow57QntS5zGDy+5Js7ia0kFPTU9QGRLVZfaulvkWCFMKFwwzPJxc5vBfhTP?=
 =?us-ascii?Q?TLEq5hr0SztQVU9ud49qkamSLpLvD3vlvT7qdFc8ysRJPNow/7nnsXW+sanT?=
 =?us-ascii?Q?KNBbaWryadJ7bEyjIK6Mu1XKv6PJDgdmyuLqifM9r6+n4wJJMBr6/QIxwYzV?=
 =?us-ascii?Q?A8udw3bKx6DhzpRpbIYFnh0ikGej38MgGKtZdSZxznpGtpy99jpc1L0U/aHP?=
 =?us-ascii?Q?WQUVbvKXgXOcXwG+k6N7Io43B38KcwSeKP5avH7wmmN9mKwi59fux402QlFh?=
 =?us-ascii?Q?EpiUDfeDT0Xfw7xR5hp98ULX58VTIQSKHXJ1Z3gEQ3EISvNzptSI9oxOskU0?=
 =?us-ascii?Q?gByUV/fShZfAh5rXgJWClZS//70/XFE/gyvIvS0rBr5mkEtulx/xlmHOTuFX?=
 =?us-ascii?Q?G75Aq1bHlRXT4V8phIYGeVuT/JnpFQrIgYCKUlsvLTY8FiCGtBV93yZLLHwb?=
 =?us-ascii?Q?hxbBDEcUaoBNSxYCdu9AFz6GfNy3szKrsr8deOlEfMigGsX38Sd74OYjHkAS?=
 =?us-ascii?Q?7XgIW5tJFIKHSElAzPX0n5rJHyC+tsSqxImg5ndZhHGkolhbgLLJZa8dXF5n?=
 =?us-ascii?Q?N/ie7wYA7hmY/2hbHY7J2ksPNwfRm9n5xrNT3SbwlKOcwx5ou6mD/Iw2WSCg?=
 =?us-ascii?Q?3Fcub+M1+WMM1aqy0ov1E6C3eQcLw8kGa6Dr02ni5qdMm5pT4lJrqFLCqfmz?=
 =?us-ascii?Q?27AqAPnWOMhJdADgijA1DZE0CsPqx+Xx7X1LVru8+eb7lAIi5SaHW7GM5sEf?=
 =?us-ascii?Q?w2NOqqN9YboXj/E1StxTUALxrwEyQCgLaoefNovap8ElDwn0q0ZCK8BjDOe0?=
 =?us-ascii?Q?3BmcGH/C1XPXQQtiFqLTY3ULiOM2gHa6C6hT6/lUH7FVQktUJCJ/n5fTj7XK?=
 =?us-ascii?Q?3dtR8xiqBSn4W4pz0Q22VWGIs/xuqe+HPXbHKxvNOZwC8Yi9Lpzucw6ZnkjP?=
 =?us-ascii?Q?eDdH8Q5EhTsd81FrjagATVgQy7Jl2wu7eLgYS8jbkxbEEPKf38LatzBT5zLv?=
 =?us-ascii?Q?6Y6XZI+3zqXJTRQc0GKTPUY2irb3Hthqhx1c5hV2bDEoHQhGWw60Qx+JjOJB?=
 =?us-ascii?Q?IsUsz5OhPoz2t2ymJur+J2HPNjW7SOjDomZWz78VxeW8N5NkWyHtx5IcwSZo?=
 =?us-ascii?Q?v3lINw6uig=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d4991f-50ac-4b46-96d6-08de8ad87e79
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:17.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MW8SEchRPjCLGEpQ/eSBYzHWeK37+CT0tVNtXUpSWMPEQpDZmqNYuAXA7dru3jt7kmlqGVYoU3JXi5cYyfFbpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

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
index fc32b6143cfd..2dacda3c25a0 100644
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


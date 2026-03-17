Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923823F8DE7;
	Tue, 17 Mar 2026 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788062; cv=fail; b=GY/b9tUFH04kxZBSod0+MMC9/iv4NELXdMBQvmX6fXp/2iOiklwkecauWIgdIRFkLWgNhrnVw5dBgamMfRDUAsCUgg8Bbw/vQZEV2djcuKK/q0Gf/Jv8Jh3kt0zRWqIwup5nzuAEflZqGsw+QGviDaS6Kdq+iAJFaaK1t/Cu2eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788062; c=relaxed/simple;
	bh=j9HYYPamnsBLHV+bWvvpjIygUSQvYGIR1xEZXRPIHug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mGurOuwPU3dL3iDPhQnz42Nqkb4frGDBj0MXp5WssWEz9N8aP+a7+2IoKn6un7DZzOVbtC0SkNTTvrAKAcCZ3BRFmFQBnnk5vp97W4hIHxO+kwv36N+YgsG3Ao4/LtkFaddwaw25SK23RkOfJI2gIhdibTq9x76Wh8zRFk255C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dhmBKqZ9; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dhmBKqZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9T7pIPSIvgYYpH+qcKFVVKcsRLUGSI0v7R0P6DKaJVW3gCUs2SeMYD2d+O9SkkggoEhHMnYa9vXENbbiDto3SYxqWzPrBSZTiuWOv84Nn0D8zxhWY8n+kGheHFLVs3SLxJ5yDKm7bbH5pSBMkkRYXOefPD1kaEf5ugh/ZGAJymbzMpOWWuBPoGCn026PJa/UAmTMv1KxE5Bhu8ePlN9+11tn7y8Wt3ALu4DR7fyskoL5zPmbU6h3oeBpPr8A6utcXNsokD8I6wtpxzHs8q4BrBoeiqz4OvhRR3NBXYGMUKp4gnqMrSZD81TASuy17aB6K6noLFYJJLgZYSF90QtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=zO89AoHrFrGe2C2dP0KM4n457OewVXBWJqcs5k1X3fPXTTR4CA69cZ7miDlfvx94oQUsQTm+Ul4n8sdubV29XlkD0/07T4tBby+FnVqm+Tj/w7PegQxlHf4JrvTdog2/7rquzTsHWVEBV34VHW1gyAG4eyLMTT3hWOBV3QiyObAW+jEVVkvALZdZVDJseygXCclrEAk/nk7eavPTPw/BSk1FFCOen2bjE1CmoIhDBHcxHpLaQ9EK5yAT1l2hP0vuv7WAb73KtNtO4kL0g33HgTEPvBkSyHaA5SLln25c/lby6YBaDCDSQNz2TRgqaMgrIHtmQ6kokq54XM0fn7HXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=dhmBKqZ9KTy/XOhckG+AL4Vd+rhDOWx/0QWXhKRC8Jd87KdBP54KHvD/ZN2FCjnGP/Sp5m9nSspsH9a8PFiA0GQSWVsdZgeevC87teHf4P5ZveEJAwRdByx/Gv+WADDGaxuTn3++85BwftBW5vzwUQBGsE+T74cRKsvqJr3ZCILmNjwZXOMH5kjyszKWohqAsMIJ1KOuSaPJd43+KqvGdbKYvXe8qhNEIMplZ0VRddtPiOp6UsVwLBe0XZHSxlRRFWjt9dzKmlpGsVOO5AwPIXbhDbSCaUX6MmHpgkEEE+agc3bSZ1U0a3xoTE7HSdUHljfNRwJh/ocgFuK7DY+5Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:08 +0000
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
Subject: [PATCH v7 08/31] gpu: nova-core: factor out an elf_str() function
Date: Tue, 17 Mar 2026 15:53:32 -0700
Message-ID: <20260317225355.549853-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e2c9f9-6005-4285-c098-08de84781930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	P79pzJdutK/G/vUyOGUP696aLto7yOqagMtuBE0mV/WxiK+uNx4THsUMrEsz5Z4hSATMC14lWMmz7itLGjMPzVteyu99s32ZxMofMjRsy6zaTxkZfKlcJq70uwpTWsbp2vfar3eSpu0/bjT5j01M3n26STXydoA+YhjPfJ9IxDHmhXwpS2VuaxEb9PabSxe1iiSD3oA26wgh0XGWiotD/e/gDzBEcO54XFM/eNM0XoT0LHtDPUSy6GMCRt8omj2Crg/Fucj0gAI3sOwolLdn7hqBoBIY/2OCOdNQ3pWlAiDMCN7F4iEg8Odmozi2TSulTjtel0/ZEBJVXnKc3Jz5fku11WvgbOLxiJNVs2W3vHSqZ9h2nIyL8L2oEA3HJCUBrl1XnQO5xq/APX2NFO4ew6nPTeXQiiKQKs1VuPgllOI0gxRHKL30FTkERKHJu0shEupnEJxu28sB46TRCe9gWjfv3sOxgPqKm8OQ56hgqmLSEY+j0W5FKbM9aMWlItrTng1eL6PY/gvOdgUtWywkhKPPsXjyESfxmhGZ6Bcb2at0Ir2dUmoM3UgovHEzxixdGlB0ZFUAoU5JYKkSvzzmvqc5BaNgUB+YThi+XiBsudv91OEDmmUPGSgj5dDGrjH8cuiNN+e6pFAZxqFNqGTYWAHYltGm9HgaX/CmZFDY5eZy6bVhi8Dr5IQgXMNc8Zv5J3P97iWsbzjYaCKYmq7qneEq3HMCvAoAX+Zww/pcSLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J4rv40LWS9lhIqVJakTlNw27AW1ZXjP/LH5oxdMrrageB7uh34k3T7RVYnNU?=
 =?us-ascii?Q?hjUpLc+6iBvBOYnR60FRGgRL77vF/Y1RfuFAkVeI5qM8h8wV4URwxmPA/sdb?=
 =?us-ascii?Q?/1Dy5x5olG9tPLJcCEDBqgjl+yanjhj7eVO1rP/I9/ptwvji9wYt39uotAM1?=
 =?us-ascii?Q?Qivsd6p7s7knz11iwrAxJkTBovBNOfVJOsluzzOhmsEBY64+w8qmGpc+EcKD?=
 =?us-ascii?Q?IOSaeQJk4/NX3HjLBBDvtUbhIw/xJRftCB3WUp3e9PrhTn/T1eENP2249Out?=
 =?us-ascii?Q?pamvaGRlg2tbSN/Lgf15REUsPXlelnP2HTS1h0P6E2nkkebKaivgbgZdgH9E?=
 =?us-ascii?Q?c2+ImkNzcRyssOlxIRo8cMm7zG0yg5B8zE9Nr6MHA4G9hHoOt++v9RmV7iaz?=
 =?us-ascii?Q?lo2x+xRVkRaFcBEVUuYpbm3YVz0AYiAsd1rTiafFL44dued59Cwae7Gy2tmk?=
 =?us-ascii?Q?ncZCf9JSpAbVnuB1/ezXmiNHVObWF3pNW+23S/kB/h18HVzWvM5N5b81Fu7+?=
 =?us-ascii?Q?hqMZsgwFtGpIWyCWj7if5Ic4x4KnnVlxa4Sm7Kfzked9b7nr/ebvT/kLYL4y?=
 =?us-ascii?Q?SPARMtNG/VOO9SMxjYvicPKHrlW6u1PhDepaQ7i1r0yyi9R2c+pgC6xSOJWe?=
 =?us-ascii?Q?UVI641/hRjruOujegoXMEWIAmqAKngVtMb3fyFVpeWSvwGKaSfCOLPBUWq8Q?=
 =?us-ascii?Q?alGGnAhaiOortep536p3dAeAafaLjr6foH+zaxLtfQyZgfj0z0WwK3/jlCYX?=
 =?us-ascii?Q?3WSYrIb67IVuDi8irZuJbByBRaYuyG/HEjJmXwkYaWkQgFSEVap3NmbUEUP+?=
 =?us-ascii?Q?DxJB3ipWq+OdiAX13BiaIpQLR2N7KbvIRV5qBHI0u0qrFQYbejqthYOgZc3v?=
 =?us-ascii?Q?vdlb4OHqq6b7IhQBi7hm695QS25LFPwE4rBP8JEzyaQB1gzf3AbHBz2GpTW7?=
 =?us-ascii?Q?X26VJ3WN6z0ZKY6XxG5OLii4/5YSTZebZVKdmMC6WILznzRvaQhTG9b4Kxty?=
 =?us-ascii?Q?IQpgUrVCYnFjGMx9e4HHAh539Vs0uJuTYT99IFw3Bst7r3zVC70jtOEZvKJj?=
 =?us-ascii?Q?zAk6XY/EvUoG4+rnufI3PUNVPh7/BI4as0UJOIEOnJcm004qucByRpuiOJfh?=
 =?us-ascii?Q?+JaY4f5Fqk6CZSHB1rZItQQHV8zqq8s65n3Ww0XWS2H0mAeqxr9JQ/sPe75r?=
 =?us-ascii?Q?haM2uUD1zKu3DEjI/akhd5CsBx3J+d864UXp0gFPHb71j+xWujBxjr0L/1bd?=
 =?us-ascii?Q?/SA/6QLVlQwBnaaK9HyWlhzB+/eQBUtxj69zFdUfCI1blWBmK8L1qAkLw1n9?=
 =?us-ascii?Q?YuWKj0BS0DgE5YRKuNhiWV+pU90EoFj7pofC9dnreQBNx7We9c8YROLds80O?=
 =?us-ascii?Q?zsJanmosIlk6p4PKKwWh6OutJ6/3e/eliVMJJ18CfPDcDG3YSwddt9pPV2D0?=
 =?us-ascii?Q?jiM3kMS07OWMZXbyQAtj2CAP7pisnqg4AC2xyTH8Iuggnd2Odzxbn186oG1e?=
 =?us-ascii?Q?56xltECc/NikHiKQp0d71hIb6h7tBwcXkioOCg1wmMbaR9qeGrI7aj/1I8DT?=
 =?us-ascii?Q?JWXeFA5M2UugjUUSHBoQGxSaGH4dOdaNL7PQh2uRKnG5RxZkNqF1BvGjm2GU?=
 =?us-ascii?Q?JDYW2Pm1puta1CF/wst+PZfWGHN5R7WpD5U+JnlSa3NeHa5rHarh6RyaRVh1?=
 =?us-ascii?Q?yV8hF90sokYv3+XjXJqB5uM4I4A5WXrAUnT5spG7Bn9M0U/M6SPo03nM5tjc?=
 =?us-ascii?Q?8vW2IqJ3yA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e2c9f9-6005-4285-c098-08de84781930
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:08.8341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUrBB8QeLznF0xmpDmmZryq9rNj3111YHNR0/t+BadCSnMRCPi0cLFnrwbU4Qb3OrCKFaPMFK7x12qY6E6Z98A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 177b8ede151c..6c2ab69cb605 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -484,6 +484,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -510,32 +517,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
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
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.53.0


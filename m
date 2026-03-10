Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3636CDF7;
	Tue, 10 Mar 2026 02:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108716; cv=fail; b=nP05f5aShN74qglno+wW4ADAhehDvjhjUXHNLT3vYqVF7mSQIugZ60vVUF105Qa8HOkWypUxIUO8o3prrLflI9dXaxMX03Ygcagf2nRMDOjNdE4URJ2Xfkkk774dyI5b6Ri9zpTp3SD5E7N7uVO7uxIHBzQMMn+sJwZd87/NypE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108716; c=relaxed/simple;
	bh=j9HYYPamnsBLHV+bWvvpjIygUSQvYGIR1xEZXRPIHug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IbS6mhjeV682mjT2lYlcWy0J1E1lHrHggA6DN5oXSmYq86hJmnk+nDC6k33Oe8TGFWspnFCf/oHC+scnB/57Rhl2gVImY6Rg4AVZbStHopxxgCPmt63zEsuDivQ8wnnKL62ZNbfYVEe7VVnoeox/ZDM4Tf4uR9Q3evk/wk+6ihU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z+NS4OIM; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z+NS4OIM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE6XUoFZr2FYUTYBtmwx0O4Lo4XJOqpTiTCdh+oeG2ZB+Wk8Mowyiq2DEfli718FDbLXwBDNlzW0od7A7vC2H8z5Rbi4B1XnIL1dE8X/Oh0XC0B+s7GA+PzTlC3zcj9cqo5ifNTCLk3AI4nm8H4t0+Zh/1Lupfi44ioiI/lxclyGh5lT3BGJUSEmtFkvLpGo9tc1ZI46SpnekuKxEdTKagY8sLOWY+tTW3Zv7wKlH6YuzyEFFpeMaKcZ76AUBcgBLhhonV+nnw1QqMtWj2aZrDVquXDiYYiRx44HTUzPEGxIu+AU9IaSez6Y3qMYzJNaBbgoBQGq32lwsxGzzN2Fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=pTvtW7/TLlFGbGVEDsZGhYyrDtNZdOu0W3q9YC/X1heazRLrqZNZergA6cPLhUvMk3JXfJEhPLxAc7tlxi39ntgWxXuwuhcQfO7X36mFqMgc5B7VF3b2GJ5PX43gkdr5EWayQ002A2/OeYVz7C8reOGnFmjno3WKKQZlCr7+wOWY0kBWVMfI1fQ6PorDgNLvsUskVjOeklqNOTkhLNwFQ1KoSQ11UUEi/iSjgQS4cY3mkjZQsAYiJ9qFs4vgJu6LAIl3QL1wTBGoFF8dKGBn6C9y+NoB/tXqbKMT0d4Htsy/AkLBng7EHoi0Y4QZO/gUGlpE/BVc4go9HmedLUvN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=Z+NS4OIMd5+QarPiPkfdibYK7/Yl8CLYOsvrMbxAGQh+rQFy8SlWHpHHgYF7rM92Bu9CX5ODFBk5cF7WXkLQaA70yIWzTp3aPCPcL+vufhlG2W2Un6NeKJjiAZzQqv9G790pv8w1pi2L2zfP4bOAGk2uCwmXEWC2bHHBAlUmlQ0J86dAw1v0Kq5mqSVxBi+5J0VYTDkn4SAfRCWI6x1LFmLDK5yfMCkhJCANYc7WZvickrRuytMGnd9Ymept0c0BY0lf7yfGKEPdnkrvLvGi+ng5Oi/B+Xu434rahYzTpZmZFW94PNzbXjAJRZShL7pJEu5cOt5xC6hkeIH16n8qrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:43 +0000
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
Subject: [PATCH v6 11/34] gpu: nova-core: factor out an elf_str() function
Date: Mon,  9 Mar 2026 19:11:01 -0700
Message-ID: <20260310021125.117855-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: a4eee566-9b56-4eca-1bca-08de7e4a5f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	Bk01kTVgcIT6W5zCfwGo9nY6aT5o51CE3nzJXw3/N0Yok23vXQhOzXufaPfosT1225H1weuBDTTOrhNv1eLcgJnPQdaQyxUEbakVZ/KrT/vQ8fzcWFDUZb9dwEbOYIuO+kPvkKzI09NECeFJwTfOh1LbjAzXjk8sU5HbKmPL0BbX3I38hEUrO1PTRoNjR3BrHoACGDib8POyw9QdTxhcsjvUtodFgvqNvNtkp5A0wFBCB0noU6O9zOVtQ3m1J+OfQf5mzCy/VtyEACt2bSBCOJkGpXy+47+oNhUDtQwF6kPP0oXvO8SSpGXfwPK/z+O+4JwGGdinpyQ3CEqQQgftP305ukF5fqGTUIEmjG2421LVuFVWLD3IHDEvdiSN5GkiOLBUtnFREanJMKw3mLnyvx8FyHDDK+kMAk690fnmzYzfr9onpwIgC2G6lJcNgbe4D3YSgUNH1Qy/PlamnkmUP5l3GcAU0nVw5CFl0lVRBbUPFkqyADQ4sawHOZd0ZdeGoXBb4VVTLENGW3neyF2KmCrmvT1ir4EX2PI9T/qfnvKa7VK/MDvqhk6CF3X+sIpYZRolLHKUG7lsfauNGG8EfN8QjrFBybgkMBHjClE2UhPuD2pv/eMGdXCzbN8E6nJ3Z9Fig6lPicNj2Rbo1o6OqLl/1nb6cROnqOqJNeV11FyohxlZh+8BjbYUkhqPwOG5WoapE/OyVMEboVOC2gm9TL1CbPwZ9qsmjUtuAAB8DyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PRkAXsj/rFCXqpix6gy5MY9bLYYltfVg2SGDrz7UO4V7cIhoyk/2y0S7e5y+?=
 =?us-ascii?Q?iIKaHyUlDc5brBxstdPWi5yDgInxUrwZpXpZsiUBsR6aIw7s5AdVrW+eGRG2?=
 =?us-ascii?Q?o9I/Q05VLT2jFBKSz3nDN5Dqz4/kX/gqvMnEooSdmdfjEnnszcneFRUjuTxI?=
 =?us-ascii?Q?rqS06YV2TwIe644VoOlU40EL9HAj3Lpb+UIlJ9eZPWLHtytQazEM7UTpctMW?=
 =?us-ascii?Q?VnBQCqkqE8Ne+CBgGYq4C0Qcwh1vcAQXvuTW5zLH9Ba66dca7evE7WCwBzlq?=
 =?us-ascii?Q?K8rnHnxOJt7I2f1ivO8DgMZQgxhi44Nr26Ley2PqOKfCUdr55qn8Ltgf/pAE?=
 =?us-ascii?Q?5bV4T25+hnVO5xSKHJvufdVYLtVcncf3o1yw8LnWMQsEqs7OprNpVLHOVCgY?=
 =?us-ascii?Q?1ZMb095Fbui9Wdg/ApVzyaKUQrWuCluPT3gyHvQhNhVAXSLlzC9+qG3nc1nC?=
 =?us-ascii?Q?dVX7E0GT48NjCf37Pc8kzCACj0dPXmEnhAwSEOk+iBtadpE7Cdll+7h0tkil?=
 =?us-ascii?Q?uLcXSU//4AFkRw9ptO76+RTHMo2telE++AGKTO9hAL9Ii9+zGgpRtpIibyj2?=
 =?us-ascii?Q?w9lbgwDLOC5ouF9/UWKd08E4U+U3aM1DHQpNfWCLQpX1GHwkKtpuH/9hxpQ7?=
 =?us-ascii?Q?NHPsGSN9dCuIkM9aH/CO2lux0NgX3ZydcCSzwQ3mYNl9fvExwUntuZozpduj?=
 =?us-ascii?Q?8E7OE3RA/T7x/6/LGOFJ8SVj6dbUEU97MzocRPPJsy4neSVT4SVk5ZwZN59v?=
 =?us-ascii?Q?MfW11NRLYt7RiA/c5t6orcm7KfjcMr/Ny7PyXN6kHjT1X/cPQwGPRtv4a5Qh?=
 =?us-ascii?Q?pr1AMNnPEZJwE62vbGj1Hn7zVX1zactWBx/jYSt3MYoB7VAuZbQJu6n5eZvA?=
 =?us-ascii?Q?xHIXWoToDdG0uG5qQWl4r81TZYVYPjng7kQ9mBE7uV06PJdXGPjFvvFzms0/?=
 =?us-ascii?Q?GsRciLEqzvDHd4DNfZ+ghpsF7M16PWIPpbtaaQ39ace+CFwuDrzmQL0ati8R?=
 =?us-ascii?Q?bOgiAYTFCfyFDZEJbud/L5wqhIusEK2hLDr5t/wAlQ5Vr19KlMmDaCD5r1PI?=
 =?us-ascii?Q?JJmQttg6HofQKVJ8DsiQS+zpv6ojwdSMtguBQ1+at071VP2Qqnj9LbUdBi4N?=
 =?us-ascii?Q?KpT23Ouv9xKWhyiPgHZ/72D8aGpeZOa7tyL26tDtwof5MSQAWLS6OnVLSBc+?=
 =?us-ascii?Q?VHH1mKc4LfjcyIoEZcuENr0ZpiR+fgpW5oTXL/XPEQvJ5FAQuanQUSDbB4PB?=
 =?us-ascii?Q?JQAJ7pXLFRFEWL6Byn03gd+ruh5dQgzBGduxvwgVTMrl+oMmZRPXlfVKcr9M?=
 =?us-ascii?Q?+UJNwNvo+v3hvPi07mS9Ad/DqCrABscWtpBGvTQzQGFOR3eJiQ3hhy8NeqBq?=
 =?us-ascii?Q?beIsgX/ABrbMFFgdIRKOCRJqdWOjmPp72/tp70HCUZZvPJXzkjpJ9QfOtDf4?=
 =?us-ascii?Q?fQp37+h1MfB1Sh0d3TO9Gq5zs5RfmYy1y0tmeSGJfUQEfZxgxA/6kuNfeqke?=
 =?us-ascii?Q?6Zf7xzFNPdbivg8GEFPmeXR4ASYmo19S5jevYXgV7CdOKrk2UbRX1qOzK0EQ?=
 =?us-ascii?Q?PuJJazEta1TFPOHNSHek7/35tAl5unqPbUDgIhwZvcZCLdXVX5uLsXkAO1vP?=
 =?us-ascii?Q?T4DIriCWR/2TdrMsm17iVOSTv77LoYm0BHIx3wXjkJgrHG512BaYxkJeyi4v?=
 =?us-ascii?Q?CS3dhN3d9fmoaRW/dU6qpaR785Ms6V/EurRJQZY/Dj/zPoTPjuJzt8NauOEz?=
 =?us-ascii?Q?gRgOFSwpVA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4eee566-9b56-4eca-1bca-08de7e4a5f98
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:43.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv1QFIUxFCCWuwfzpa5scsvTFmWAmU9HIazjXxy7QWN15Sqf+e0cavF7gba3K82iyKsXXhlmHMy/lU2YLdW5Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

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


Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A1288D0;
	Sat, 30 May 2026 03:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110612; cv=fail; b=SIKQkRcwa3ngZcLPJRMDr1/jX2JOd4lGJP4KEjOmIi3MPaw5bShb8dei+XnhFyZRJS+ekHBQyO8UbTLR+Vk2Dn+yDTTVThSvOzAD51R3WsBe9AmrQ/GZWqjB8RrP/sqqZIr+cq0s/xIC94voIpnOHPEeiXaHvZK3QrV0kOpByoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110612; c=relaxed/simple;
	bh=PUQiVeIgrTYuKlTweUFHfJCT3o7q222O3fQ+Irc7w6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NHHLgrsxz34yImdlTGLIW9yMBAnlcpe3APVjymz749Vms4X2E5ORQpUDyDYVxSqG/b2ow9p+xRfgZWAH4SBupfW22EYMNSzce455c/abRCgbrd42An+ZJ+mmwK6/furEh6DMlwtQaSwK7cP1c6kQnDdHn4GIvse9Mt67WZKHPbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dX20oSLG; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dX20oSLG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBb4+TfcH3bKM/lViQ1xFHxkckgIQJEYLlgSM7/cGKEZFdlQ3pHBw5sAOy7JYF1j1Libj4oG76quwIZfoacYJtIv12zQeenKnLd8JC3+b+u6FUKPdpplkFZvxV6m4Ekdnb0B1tG84TZsreyDnsLwecP9772B6lulBUmqnScBhBb+48Kp6PgTFXek6WcT2y/ygl6u31rgNxFxyRlvRtcDe4jngTDWh7mF4DqsyKLobfbS+SeWbXjZhV8uWP+lxNbC8Q9Se9ahEk14aLStZWEPCNHIwrFJRsXYzMAi18EK802A0gQR7SP40T9numvJEh/4KE9JoF5LFWHCZprmfb00KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqMBahsTE9NcJY+Gp+UL+ayIQg7zwoR4+i/Kae7SkVk=;
 b=GYsxP2ev1FIeKmlz8HbaprYwcAAFNxo3bQg35SZXusl+2jWbTqK4bZw7ISLo9Nzdy+w7T9p2CFv1bTVl5dNrmm0JQibONHFtoGTNS+bYixDP1frslxp9k4tyfqmV3bkzJ/Sp3KpNZcrfiNaXOw7tJJ+ywfZq+cDSdhV0BaFGQWwDs5C2DPWbOVZjtW19RjAleP5lSWnF+MEvAaOGcK6LwGD5CU2uIuuw6+VuhnGR/dKr5l/ZFzTeGSqI6claq7qMrvNXH0JCEb09yJCsFvZQKNlkmk/eTvZ4GBop+oe9SBrXVjhrVr/CiumhnmU/hzmLLEZqvBXcgm1A8E1g/w0WpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqMBahsTE9NcJY+Gp+UL+ayIQg7zwoR4+i/Kae7SkVk=;
 b=dX20oSLGAOMYmJIeAMr/0X4zbDNAztv5677HcQ1SYyFibWeLYPz9iKLKRbdOfAuSM2tN0PmHfzvXJHh5U406sqA8UkblULIaz/uype2FEg1nFVkhAjqU+rDMTeh15WClludowkf7byQ+OExnH+Br2I63QHCztNzfkByMzddWjNvdvUqe4kAXYRe7ONLeD5RZSzjXNnVw070UJAq8fsXggPOzDgJUCDtXC4V+iUWjI3zVT0o//m2/vpARMWh3JIlklUWjOrTRRyF9yaT9EtwSpO+w50KLyuwpvqCtKAaZo5y0orn8ajFs2EtgDh1DFWWg7CvlksLir3RKYulGEtVGyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:04 +0000
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
Subject: [PATCH v11 07/22] gpu: nova-core: don't assume 64-bit firmware images
Date: Fri, 29 May 2026 20:09:38 -0700
Message-ID: <20260530030953.740561-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4b73b9-af97-4b3a-fe51-08debdf8f23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KR0Q+JzRYEQ3976Sx5i4Up8lkW8WoRXRD500G0JzRokH5RWmMNZ3n7iidwLwg+sw+DD59s50a1w0Lgz6oAHWuHOR5BlvtIfsMr/h3ZJtnWxFaVJ0AUbS1YapkjPWXmp3TowWS8x/4Uafhh/9E5EjmwsfHsV+rHDbzOZNFfeVv1i5IW2DJF6ju3c8drkM/0FNFFdZvrJEJ1pUr+9oOoO2SP6hacOX2t49mNm+p6LFKCsqJ8ZuOY17YDdqCg5P8T396LnZY6CKMDc6vEEHhTRASVp9HxX9ozezRWSIHUWW+5ENuc4vGr1BeNf8AtSlNSfzy1lWNazfoPwAWJzbx9a5Fu/CWgVd/ZQVrGR+YzAqyBfEvD1WQ99TvtUr1z5hTIRnwPTFMx/iTJL+1mByscafQvQI7bX7/xCCvOb3hFdmXa22OaJ3yZaeCELLXCPQDkRKYXzzVxj7EeqHy55CMjwP5RutE6i8sJvK4L6gIdYfFvywv/yEApuaqPOEEEvIIVlEIkzZi2AIow3oPSSVpzpEwOdMuvEuuwkZnhJEpKLLVXT8oBTf/c8iRFiPX5dFczKjxUVOfyc2zuh5QTRolkF0ilybsw++gDybX8icFY5Z8OM6pn+leKNZInULpzCsvBF7jd75sMc7JoiW7hphO019TfrjjRm7akGrgDEsRasUrkk6X/stjRZ07T0hKhOA30tz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjkB7EjDDVU00uPEopWNTPa5uIS0xxwO94aDQErpF1/xA32iFRKyzzRBvVJU?=
 =?us-ascii?Q?yOzC43S6+x6snY7Y8X0Z7cRFx/o1bitTpwIKmPxrCLM39W8jmN1fCUYUKn38?=
 =?us-ascii?Q?kiix+5PZVpGu5Vdp9kfPRdw8ghBa79UznVf1LYn9rEQw5ShVLuRDmlAM9cNL?=
 =?us-ascii?Q?58zgWw6VvRcS9gU/RKwCvf1woIYeR7YjIgiNgtaOzdONYBsVXios5Nx2VCXI?=
 =?us-ascii?Q?mmjImVsvOPd5eUgZgbN4VZ8oMjvS3sJILIu5OdQqqqjR/XZbH9qfHP6czqrY?=
 =?us-ascii?Q?AW7rfjXjqaGYiIXSLKLJ1KUfy0RuL8La91SfebkVX4ykxmp3Zkzq0Hszg+lV?=
 =?us-ascii?Q?5YHDQJOJzG5cj/914vF9W7n6z0ib84tm9KvPoFM3x9L0DlCOC8nQWs/uwNba?=
 =?us-ascii?Q?I5Gmc6ChmMetvIvv0hznQ7PtBKx6SL4I8WzYQ8K3xjN0TBjvER7e4pkFVgpw?=
 =?us-ascii?Q?93flo8/Z86LYQAd7v2+5aihD7GgewX7ueN52dLH62yckzpPg+v2mnVaBXZw6?=
 =?us-ascii?Q?tfdOZPYeDyY7EI9R2AnrkBAk4F1+Xg32ezMVm7rbTl/i7tjtd83xgYormMKf?=
 =?us-ascii?Q?Vuv+9FnrONZ+hgmx4p9Lu+8RH4HyKW4paWAKsENTb3diC2bq398QBzMj9WNM?=
 =?us-ascii?Q?L3F0ZsOFCu9p9oGLbXru9SjFcoCkazRnIbeAwXJWuiTZgeDqGPcn6F73l7X6?=
 =?us-ascii?Q?3gSOEXj+mSr+yW6zLltjRG9ApbpIdDDuGIz9vkE26BUzIQ6MqSrwUunITisf?=
 =?us-ascii?Q?h03C6qJLrbkRYI9YQAi36FE8WFMdVDS9ll0xGb+xXo96Iq6IS49xpNZhoSIK?=
 =?us-ascii?Q?7FKOJu9sraZv94y5ZyUaAMxt3SYDUPQwQsATlO0XDvb+MTwi0VPf6CfchHjl?=
 =?us-ascii?Q?svM1q/W2O4sg0tRBHIcs15tIQ/Cm40Yy1F9a497cuQFVQqlF/nyQ8C6dqTJN?=
 =?us-ascii?Q?RRwlq4/J+kVcny5b+bA1ptH2F/G0oSdYuUUSIihwIgMQDjYZcvnr7AbaflHR?=
 =?us-ascii?Q?HYbhPTR8vXAXGNOy8nkxkKrnegObJk66JW5vg7SJusX4WLkgQkGE7TUQoQab?=
 =?us-ascii?Q?ag4rM7PwciI8RhgD8o+C6NbNtvVRt1weO7MKjNPOMWMO4KlnKfvP5spVgzNS?=
 =?us-ascii?Q?cyHHSkJcBBNT0+r92eAwutj5iOXFB4oua847/9S2HWRKSb+snO3q2sEP2CFa?=
 =?us-ascii?Q?lTQ+mtlac/yAKYkaXN+E704WmGlps8ck0xkDvEpyKh37SkL9K4xGNSBbBwXl?=
 =?us-ascii?Q?BxBR0rrz29tvkdonmfI1r6M0TsrbG7iuqXAKvV7DQQlvIbcrj7+7AEeE027l?=
 =?us-ascii?Q?RZirtOk+oWVJ+NbMBbCkPBBXgUO005wvYt2G72BbASZhrrd/6MqWgjmlQwBS?=
 =?us-ascii?Q?GhRZ8fyYxNAgzAGet7gFAPct/HO70WGoBYC5gOvaVw50nB0xWs/JJikY6Azs?=
 =?us-ascii?Q?z5V/lYldK4Jv0/hCkLPyg4PUXvzHm9YS069EtkqhyyeNd5ucQKOR7Z7mkFyE?=
 =?us-ascii?Q?xUslYKentgEbMZF0a/DlCRsWIbPrV3N+A2DynEFVJBDdpZarqH7ItEi+4U5H?=
 =?us-ascii?Q?kflumAOu6GemQjmbcgXFXOA8Jq++HlA2jj6wsWf0kVw4HterGZlVuxDeWBPV?=
 =?us-ascii?Q?oqFP3S1O/EdOHPxJvkAl3BsZW20EJDkNMHH8kqLnzqD2Crg5JzZ6RyhAgyah?=
 =?us-ascii?Q?jvpfEYvMjy9AlIOyYlsArNm3YrpInQjcL+xSndXuVjG6zO0JrfwAxA3dfoD7?=
 =?us-ascii?Q?l9HIkkAPCQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4b73b9-af97-4b3a-fe51-08debdf8f23d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:04.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Woss7nRXNwq4HP9gx0nxVSHl7GARCGQ3SYkNHcDLpX9QS4GvVJuPe9pT9rpia9dMvcrm4hVB8ZHwjfXL/u1yUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Introduce a single ELF format abstraction that ties each ELF header
type to its matching section-header type. This keeps the shared
section parser ready for upcoming ELF32 support and avoids mixing
32-bit and 64-bit ELF layouts by mistake.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 112 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 3aac073efee2..38088e950980 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 //! Contains structures and functions dedicated to the parsing, building and patching of firmwares
 //! to be loaded into a given execution unit.
@@ -467,17 +468,72 @@ mod elf {
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
@@ -485,47 +541,49 @@ fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
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
2.54.0


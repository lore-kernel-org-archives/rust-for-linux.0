Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6932E13B;
	Sat, 21 Feb 2026 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639823; cv=fail; b=AgntvM0d7a5pWIp81ZP8DdLa5x6d3rZcGLcP1toV9i8RuAmS8FcezKjle9y1D/cPETS/Gcl5aZGrl6yXeSjehEXD/cwxYlQY29k+4zAJ1Typ3epuUIWs8uroQKUqe10itT1U2quL57cHBb1Wb4UE3ZKbKEq/WcU9bh/ooNQhe6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639823; c=relaxed/simple;
	bh=CXr57zBO28GpZ1Q4UdpiRdgwKvDLzIU5tsKy2N0QzZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EwQJmdLnZOjfVEOGP0Bek8X/pBdBg9H2B0JGul3u/l+q3ohqh0H41KneQuHdlUj/m+QMRc5meAIMMipm+O4gbBND+1Uw74PnC+2TrfzYq6DPySsIfPS4cp+Y6NVyHsBoL2hBSCy/HouWlYSUSpC/vTTwA1owRnz6FWwQOUmmv0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cc+mfnWg; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cc+mfnWg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i75iSf6cYb50ztSmcuw5sl1e2n6u+P5NHCMCBHbDcH1zUVC4MZFhnUJjgpcI+KHls2zAA8slIwKq52TYDHQ2g/oNiaaW++lF5o66z4aciG8zHqdKvoVMSVvdY2/HSMM98ZARKtjLSAnqkSsAMPUKkEmDVy1SPQ6QKB1gz9HjXBrTYBhMwr8DhWgmfK4RAKmRsG9CPkOCQ28xhh1SQz3ZoE0sgrpcwh92nAtb/DFpqqty6d5RX6NEnFx2dlVLfgh99Mc3DkTiPR9us0tflBiPlB0Wfn7nxfErWIqNDpG0vR9AbFuBdS+M+Xjt3shy29xttSwcK8/b5KSoUganZvToBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWW2qX2qVKWz6Vd0/0rq/GpAxAHmJdzAS+Dvt+ESIUA=;
 b=pipWGQ16VOte7pasEsakQ7wOWblh9Zl2a4k5pMo61t91eb2kZk0UcN1wjHBFz2TGhvx+zJnMxRHxqRJJ9lJZOru9JZC8jmFyHnhZ/rCZufBAtOuwbtmxejn1F5JMGqoqKo3pSS+bZbcuEeiKGo6hFnbOsdUrxwKd6Rp1M2zcX6ivPklUZ85USorgD3RhKnNzyZnxl/s/wHzP8HfnzYx7JDrFOy6a7TYLAo5AsGplAPyYrO9F6M8QfBJUkLpg4zLf6g8mYSoD0Y0aMAX2kYQOjLobxVvRYo+JtDe0B+1ThHC53rW4WyerwhAsXi96Dl7hyW58BgXS1YP71qFV2azGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWW2qX2qVKWz6Vd0/0rq/GpAxAHmJdzAS+Dvt+ESIUA=;
 b=Cc+mfnWgpojh262S7JAGp+naN0X/0CRwn2VX6hg0EyiDkAoZ36fVsC0ASRhGFsYFfmJf2woH9vOs7TqJjaGknzeV98XQSZtbYeazCMHFEoFBYQQbmjyvCA+o0MBI4YhWkggWv0a8akeRBM3BToAqtYkh8XaPdS8IWHeBGeXnvbewnFZYa6MRDfzSalsWwYDl60PBwhek9ehQI0+ZY6qZ9JBdJwbcGcu6+HFoEpqCEMnadlCh61a1nBq17QIjnvjS6Q38kZx5S7SLQv91BGPfGSY7dwJUayY8toxKZJz6cOwCR4k1amuVjmQ0G0JcLREgXjuBVP5APXdBSjzEx7NvWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:11 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 14/38] gpu: nova-core: don't assume 64-bit firmware images
Date: Fri, 20 Feb 2026 18:09:28 -0800
Message-ID: <20260221020952.412352-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b4b911-57a1-4a17-8451-08de70ee580f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jaT/aIRnlFiPLZQK33jaeZRJ5JnU1uhSdKWX58y7YccUVXX6PuFK8bdD0Tqw?=
 =?us-ascii?Q?7oN8jt9p1crXwuHA95DdBWT91kVoLSuf40CSqwAP38YxY2Ald+gdOktTTjQz?=
 =?us-ascii?Q?8gK5N/eLZSqP8PNUbJZ4ytp89bLrK4VAxvqqNIH4/gKQB/0Dz9zCHB8hUW+r?=
 =?us-ascii?Q?ffrQnKEozHC14eV1dxdH+tOIIJGspD8iByDi/G/UsetYr3zjHJU3DyqKrS/z?=
 =?us-ascii?Q?RELpDSEwTKoNq24N4guFmzWHblawF8Y9rm595WJG71pL756ZHMkSC8mrtA+2?=
 =?us-ascii?Q?FrAl1xGXkKnalop0pad8kAUoArGo8mUKwOZqnXPlENgtZnnIoDIEAK7fhvH9?=
 =?us-ascii?Q?lGTOuQGUv6MkJZBHV9nGeWjIGYpgXYDyztZwX4rD9ZfrTF4SDIjG0gdKBoEO?=
 =?us-ascii?Q?gJXDKC9OKn1BRzcYtqh96E+WLIoobExjjKKQq/7KKHAaepHkeht1ErUc7SAu?=
 =?us-ascii?Q?6iNLFcuQG95MX2DwK7lnvTFY4r9dbke479LhtL2A14FBu6zqwZOPE6N47eKO?=
 =?us-ascii?Q?43Po4e7LIkwU3yWcZqT3ErRaRkFUQGKVrbz+91w5jLr4rexeE6J0j1NyksGm?=
 =?us-ascii?Q?UO7DDocIcgEt9h+wIH2hl55WhDsO2C7Tc8lNJNxHUcj/gX8txpDH4x0yoLTz?=
 =?us-ascii?Q?MmA4dXE8qeqt7OHWuRJD7ZicKrgGIPTfCqKP6QISCo/fGOX9B21Y/98K668q?=
 =?us-ascii?Q?d6ynPtQXmTfBVDvbuleySdzQ//2nfGPrheks9Vr+4Q+7zkGM0vquIo0HfAJu?=
 =?us-ascii?Q?chUx/KdyxzrHpNvw0/8RVqiIaaX3fhBr6SZg3gdp17Z4nlNxpGhwkVzzEJK9?=
 =?us-ascii?Q?LoR+Zuz6NxYSzxfShxOrcGMPdo0/BgzU4zuSzlMKUjQRCtwKzoGDAQJiN2aM?=
 =?us-ascii?Q?z+/9N6rtZR+BuCSMs/a/Pkzkiyr62187vvGHM11R0TW5KTOKEkFA6XYQv81N?=
 =?us-ascii?Q?aZqL83v6EnOOmSbvPfRN/m84eoto9t5A1964ca79gHE7xUjItH1VPvxA9U2I?=
 =?us-ascii?Q?k7smdt6MpTtykLXfP3akWbZZKlcDq/o9TSjnZvVFE8inomv4dEyS2cctimbm?=
 =?us-ascii?Q?M0aue/R5PyZ+Pbwwi6rv1MDAmi3i1yEgJufhVoRmGSd9oWMVrav4qI6RNKxX?=
 =?us-ascii?Q?jrvMkWZPkhAoBrBSNzMqTurf8uFxb3aTjMpScc7W+yKFVUzYYPEeDUsJJTRK?=
 =?us-ascii?Q?28kgiEHAd1VnDTQvOkciMz+Rtie4ijBI1+p/iQ3MdJjfZO4GYTCIOemYEFvn?=
 =?us-ascii?Q?yMOQ5gNhsIXjwx4F9TD6EFdijnp8Q2d6v8SKsFxKf14A0Z6OQ89BVHcbt7xo?=
 =?us-ascii?Q?fb2WyMiLV9VuPvw3LqBMlxhP4J3qPuSRGL3UVK70tMSsqzeDOFDM6nAinm+2?=
 =?us-ascii?Q?4kxzOU7OPo9iSpZNI490jvygEqE81u7IYslhq6487t3v2RULqhMQHzJbsD9k?=
 =?us-ascii?Q?4Ji/AFsSwrGzBH8aHtaiuXJaT6SWE1TsALX+VxaDzYJbGwnCk4fswENcCK0W?=
 =?us-ascii?Q?ATisvLCIJ5QV13ji4Zwg8yf4nSycM1qnXUbPruWVUVb551ndo96peBNxUoKM?=
 =?us-ascii?Q?TKUC+kfHwQT4avbhJZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5uWHbP/lkHqHodRq7Nki+gEzbjHatTDd5RGeeYlkQFQSlavmfSDchUf4ST/J?=
 =?us-ascii?Q?INjEIT1clWt13Uskc052qlLS6HvrHDuvwt6964gfhKRV9qfh0GvKEaOWkacq?=
 =?us-ascii?Q?QWOuUX0RB01wyTR08brtzAPeJcxZJAdawrRgyopXDEykOH2p5t6Vs7ytc7GE?=
 =?us-ascii?Q?UnD71gGU0YtA/3byYTYBcvjsqZTGTX6Q2SoKENEufI9xvnguv9iIldzEEOyp?=
 =?us-ascii?Q?riYaP2mVoJdFj8xHvL7yQ5C6v34oEd3pI8/1/gnhGxuw6nKLdfYubm5Gp73A?=
 =?us-ascii?Q?7roNMinGKDiTRjrzUU2RGsJhXmkqxruC+Bz6uSPUZwj9JYNergn9umDJlGnf?=
 =?us-ascii?Q?Lbboj65KtvvKkdOXx33IZQs6SxPU38O65f9UdP9d6UmiOgdCDxCq30aYkUMZ?=
 =?us-ascii?Q?lxLkme7xF2h78wCWo5HUFbCryb/7OTUFNk1nYQs/ddqX+HlV8YJUG1AFemSz?=
 =?us-ascii?Q?dASG6Xmpmxdd+qMWlqwFOdPfDLcA/q/gMywS/ni58f/rEg5r9cjZY0pDHqpU?=
 =?us-ascii?Q?ywFCgyz6d5w6QELdJnSUWmPgmp09Mu/r6634opH1nA/zQpm2cpMHYFMvMPj8?=
 =?us-ascii?Q?KM1KR2xmJ+6OduBNENfdREBqMia5SKrU/d77aLV3UmVW0NdTkfsIZtEZMTan?=
 =?us-ascii?Q?FgGrfdMCHAh2ifi3MwWkWZxz8lKT2rEQhwsuKwiOvvlBZxquhRGk8fYiwWom?=
 =?us-ascii?Q?C3+UnfafqK5JN2hezEtAyhR3Wdy3P215e0plQODpipw5JtEG+XvPtDODw2y6?=
 =?us-ascii?Q?HTVScEoofqCimlW+3j9HbFpfzVRrlH2eX/D4Du5feTMpQ1r4WQkjLXWJVgc5?=
 =?us-ascii?Q?L1juaqtREjS3f3oPZOxBBgQUZxfk5Awc73p9M2XKAwIe8X96C0AOgyyZ3eY0?=
 =?us-ascii?Q?3YzoZYfOKgdrb1nfoT51UdorLm60+e7xSxoMT9vS1CtsHIIFYeKr439bOQ1X?=
 =?us-ascii?Q?CxHxh3AMY4jKQPs4JbJzs6v+tVbuqHXmSXCMyz2V7nGzPLFG5IjULje0NKgg?=
 =?us-ascii?Q?WKc3vZUxFfAaMcIem7TMl2baGEXh7vBFG/uxXwKqxB/lGalrAnJzUa3ZqSM4?=
 =?us-ascii?Q?8z7BdAgpW8jg5HCcVCE3FEPtM64XdocKnK0n6EZcEP4f57a8QgMZMMka8YC+?=
 =?us-ascii?Q?CgTwuC3Zg+2LsgOBwo2dBOtnDuOocBO4sZpuuDRXFehFQhJlrScc0hyFghFt?=
 =?us-ascii?Q?4VmV6QuXhF22IvlfwT/C3GKTFLS4UD28OjGLBAcxl0bgOLmOOtX0VhOJJRWL?=
 =?us-ascii?Q?+t5uUdlPU/QEBVqTDoU1f4kHE0oWRzgeugQ+go7uxF/fOEfrBLshIt/DfZG+?=
 =?us-ascii?Q?/3Oo/sBMQJ+aU0afqNsrLDf9lNMWkdREIcFqjB/Rb8mnT2axvqLl+rUDVbsr?=
 =?us-ascii?Q?QmLauqDo8J9/jqsNcCoal57PSuyU/L7g59yvzIXQTZt/s1epOdcQUS+XlwVb?=
 =?us-ascii?Q?izKDDGBFmoiKzRdZD2Ajg8f0WSdRuXKWuSxQaIKQh3TXAvetUXCBo3eC+HkX?=
 =?us-ascii?Q?T6VI9jl+0+Ntfmk0vqZCjVUQC6qKYjhQN/fb7GkHcqbqAuYwN+EGTUVDEmDN?=
 =?us-ascii?Q?G6poYnoH3A+jFt/6GFh84euDkrvqc2/3TrVjV482v6FYqP0DwbhAy8nU7YGl?=
 =?us-ascii?Q?mo1UUWwlonFohKoD3eNyZHG8MIiqZSqYHQdJuKOe/5BJI4ptSLGVBbeY1i/E?=
 =?us-ascii?Q?EMNt0NC8yWtI+sLwPjst5uBYvi0xW4I+MAY5DAZRR8bfzLgnyHvoav1vltAO?=
 =?us-ascii?Q?9Hyl4LPKGw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b4b911-57a1-4a17-8451-08de70ee580f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:11.6294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKDamdzWBwuV7ISAmIqj3nFrs0kpfmH9WAge1bEvPAhZ/4b+3ixsGiuE8X5dc3R1TOcDLi4AAt0GGo4RRrYCPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Add ElfHeader and ElfSectionHeader traits to abstract out differences
between ELF32 and ELF64. Implement these for ELF64.

This is in preparation for upcoming ELF32 section support, and for
auto-selecting ELF32 or ELF64.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 99 ++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 72cefc3142ea..6ed76a7e15f1 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -453,17 +453,60 @@ mod elf {
         transmute::FromBytes, //
     };
 
-    /// Newtype to provide a [`FromBytes`] implementation.
+    /// Trait to abstract over ELF header differences (32-bit vs 64-bit).
+    trait ElfHeader: FromBytes {
+        fn shnum(&self) -> u16;
+        fn shoff(&self) -> u64;
+        fn shstrndx(&self) -> u16;
+    }
+
+    /// Trait to abstract over ELF section header differences (32-bit vs 64-bit).
+    trait ElfSectionHeader: FromBytes {
+        fn name(&self) -> u32;
+        fn offset(&self) -> u64;
+        fn size(&self) -> u64;
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations.
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
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations.
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
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -471,47 +514,49 @@ fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
+    fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
+    where
+        H: ElfHeader,
+        S: ElfSectionHeader,
+    {
+        let hdr = H::from_bytes(elf.get(0..size_of::<H>())?)?;
 
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
+        let shdr_num = usize::from(hdr.shnum());
+        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<S>())
+            .and_then(|v| v.checked_add(shdr_start))?;
 
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
+        // Get all the section headers as an iterator over byte chunks.
+        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
+        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<S>());
 
         // Get the strings table.
-        let strhdr = shdr
+        let strhdr = shdr_iter
             .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
+            .nth(usize::from(hdr.shstrndx()))
+            .and_then(S::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find_map(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+        shdr_iter.find_map(|sh_bytes| {
+            let sh = S::from_bytes(sh_bytes)?;
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
-
+                .and_then(|sz| start.checked_add(sz))?;
             elf.get(start..end)
         })
     }
+
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
+    }
 }
-- 
2.53.0


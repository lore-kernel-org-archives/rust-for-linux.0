Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708283F99EF;
	Tue, 17 Mar 2026 22:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788066; cv=fail; b=fsC1qQzyCp3Ob3MZ4PDZKcuKng8uo2gf6kmMKt3lkWS3bBjFRgJE6fPCG6Qs6LoPyiPxAjWoRlZ/XrOjRsXyJm3+KcO1KROb7Ip4ifjng7AXMm7bcCg1wh3JPcY3RU4v6xQEYv/CVVVOVZ1TL1/Wuda5Dj4/szsV4XYyZIRkpuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788066; c=relaxed/simple;
	bh=Wp+6peDnWiPLjt9oJP7pnh0zSHeZGJOBGUv9TbqR7lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S3Id1iCFR+bZglD6tNVX3HQRS4VO402iKa5TXQz8e3s3DD1VOTRycoK6wkz/WMIxm7qwmCrnCq8u1+yIowMzXbm6pgoSABiOZy4EY20C5rO51dX8CZSFfKRtnXlSH86x3gxqQmE+4A4y02I9C//dh3SEMvMzRtCPh3WSrADjCIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TrCDZeVi; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TrCDZeVi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEmkT/95CL7S6RqFiUI8fwJQnlq6WecLzzXkJoexWC7IPpGvXJu6rxvKSRhclRAiGZJSJIU3JP2wLkS3Q/ay+KtV11CtPaAB+P9YUmB1/Ul5JzzGNM+gBvJA4OhfMjfapHN+BwSIbsrv3nv52VV6kKYXDBbIQhp8RHivqGWXg+7CFFhQOizrJvn3P0v3fLXALOvazLZ0yU/15kS6kBw340znTsaDN9bYytLEj728GSIHwsA8KCkERRrQ0617wB7gai5fmVgcwip6DCqn1GDszEwDuebKAfv4rrSqvO367LgzpAMr/uSgma83e4cvWk3L6Xqdulwy8zrpVkhynOXYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBEGvVEL1fl2sgzeCIZvbA/CLj0fkKSGpcJYf170uwg=;
 b=ey19S3bIuagPJ5etdLSJYggr6Tyv6VOMYFIXMBAlDRXeGX9kJiBhZVUp25pzpFWlyfIjsntVWffnlSq17KOPTBNVpSvtbu5motbhFOqI/huYZsMS9/BP5lNlMUcSU4T12gren1LxNMPQOznlnFMApTL8BWc3CU2H54V3inO2/ErP2TosjAIvnUul27UMSQr3JJunOEe9AtdCS9UXzJPoQcQMltO10q0PzfJlpQJgN8qVtzw68uSvpTKKbB9ua+bh/bL3rxjh9QHnC/GQK2usFgtjdnM+d7pF1VgvJbh0Sz246oWo2Y70d0kM1ap0lc3KyAndYfv+WBivV2X/vc7U2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBEGvVEL1fl2sgzeCIZvbA/CLj0fkKSGpcJYf170uwg=;
 b=TrCDZeViFKnmLJLkSMXutvP1gESAyR/ex4LaZ426KGzDGPz4D0NoUXCr11LvcQb/rsWrsDFLGg4UNUeTepEYBE6A6a29t8U7r0uYe9A/oM1lmmPtBPQ/HOkL0zlMDkLGIv05G1x4KJXQPMetsYkkdKRaUPQQkYr9Mj98YKitHItu54kaO889uGFTcGLctHHAZeEjKVq4Lm3wjEpB6S24VMc9R0hq7dV8QUHW/f+wgjjT488t3Jrfi57/fqtzbtUI6W0da9T9GTtlbfa76B7KXX4R6KwDTwmNQmCOOfjgZHyHBclT3eWj4kBs1f4XuNG1y/CqCveDh4UJ80hFt4/OjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:12 +0000
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
Subject: [PATCH v7 11/31] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Tue, 17 Mar 2026 15:53:35 -0700
Message-ID: <20260317225355.549853-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4732375b-e92f-4f1a-c9cf-08de84781b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YtFBtP671tXfRVQqDmHp1W/ouEhJfIywq7DhZZMMBxOI9jwEujUVMXWSajCjJBrwBBaGq0aXFej9DtC1ZyQMqMAGiRDkMaRWx8+sFz1V8AL+8N73SSpiBUI3py1lN3GBSmGga93WzK9eP5VIReKxvClngj6YQ+0llZs4oONCLLF7qwSBDeM1Vg+NbYFjjo1i+jAkyknDyTgaTgVQKXrjQ00dESM/9645KWf7170oZQTZIZg2HKQZEwLL+QBeD2NuEPF2wvB6+6EDYcIQNMJVVeZbA0P8YssZxWKWKI5VY5zg8GQvQKQyAOB+/PAsiypnXoJnyv8L80iF7OvnZPg0RuDyLyxfOj/iB2Iyn14hu/ykgyZYOEC7HfNRJ5HI6HEzCEHWC+VZTqLxdPinr9KkgnP0eLFkjKPvkyqGKrSIGOIfOwI/CFeNH4kO2OM2jowFYb0fT7Ae5F0MM4BGSqBKfojAUk7Or9FTsUUiqMesiTwMs8sXOZXrz9CjqsbXionoaz4cV/rHf3hT79UTBnjtw2YpTxiadHF86OlStv0lAPk1wl2rBnx18TJbL77yFyDNSb5ZgMGhSSdriOW8X15imEFlQAXCFGc6+cI2lwOpjz9asi1bhBd50XB3dN4QgrliIyw3bdKnDMzX2JCqsDnKBHOEiIfILSYZIM/4l9/3/Ay9JA1ekhNViZPrtpf/VYUoc8io3yrEOkdc1+KE7kfCs1OHkl1r+lzPSX10r27Un+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+/hgXFd0NXtlasZiSKYyZJNP/mMzVCRJoRhaBtEsCtIBnBckObEGrhqoZCL+?=
 =?us-ascii?Q?e5go1g/i9LulMB5ZghD2qX46dx/HtcF0uvtyWAvbqz9s+Xrk7Jt7ukdA94p0?=
 =?us-ascii?Q?vpR98frOv1fsa1+BLpfr7yR0Ncv4j2D869Dz7AfbEdSnlLoolZhx11gPxyET?=
 =?us-ascii?Q?GAEGVTSdm0qYCGe5sSRJs63fhYDCbGWy3mvyMA++o6va6wu0m+WxF9HSo9ao?=
 =?us-ascii?Q?8ccCNbZtKquDqYiVSiOfqdezqUPBUJZWBpr/d1OxuX0rApaCEqlcURXTDsVi?=
 =?us-ascii?Q?ga9ZBTXFs33OvMOzSH6SE/dnsqG78Ask/xpDUCwMcI8R008MW6m5PGrKY6WE?=
 =?us-ascii?Q?ZP29deu8LJefL+URjIEBj61IacwmuiqKM6TvhbmTCZDTLRp7yai/Brnso7xS?=
 =?us-ascii?Q?MBjIq571YfnagIWqqhqzcP/+ID3IEmnUV8H8100bZ8fQ3vqlRwWKTq0N/MJc?=
 =?us-ascii?Q?bvfuTxRZaD6unNxUl1Jfr3sQVIoB+JohBcrTE+Cb00YLRVriFNY7E1qcvVBv?=
 =?us-ascii?Q?9drVNtu5A2+f2wzaA9VoE2vQjVut/ZBwJQtAKj6GZJtqVwra7BE8pMxr5o4v?=
 =?us-ascii?Q?kMlcOUpeEit0APFXGp8K1FUlSjFPS7Bl0xskM+PoTXT3zI4YJ8HM36hJFy04?=
 =?us-ascii?Q?pXL2E7Vis/QB60Rv060kSiQb9D8Vq9INnj7A7tW8hNNe1F6yVLR6u/qvxNsf?=
 =?us-ascii?Q?jPOi/SSl2pIYoo6RhJmL0w42ayXC2P8Lr0Mma1dv+tN9WMTS/zxH7zb5e5Kz?=
 =?us-ascii?Q?SDpaWGncst7ZjWh+tGaKhpXv1DjZbbdCDfG3wscxjbGZEFf48xtwvYzOnqcR?=
 =?us-ascii?Q?G1/c2Xiu+qPzzLtLipQg8r1maIEaBSHaV3uraMBdkBZDQ6zoOXK7FLkRwtG2?=
 =?us-ascii?Q?5Pa9eKELrX8IphDcO1G8sPE+xAEj4ch73+JGqbEixbTW8dYolLQEgHz4rPnq?=
 =?us-ascii?Q?wzneno6j6PB0i9VmChj87aR3vKAhjEq74qUQU7T1o5Ns2TKz0yQlmQMq/JLV?=
 =?us-ascii?Q?bthrN7WXhBu+cBJMKs0wYGM1KKiwP32lAEIwGSsCUx0jPxDw79i3zXRpM9wu?=
 =?us-ascii?Q?XBi92HbdroQrBRCIhawRKpGk0wBw7eHfJf/5J9pF8FjDpiAOSJsDAdrDd1UN?=
 =?us-ascii?Q?/4QnDbSaKftmIxqnst3c37+HlL9yr+E7sQHHaroYGyODXeLbSbmQ3yQ4Oir4?=
 =?us-ascii?Q?MSPvpNjESh/1dDsDs6vb8r+gPBtYnsjsWChv//JMTbLl3Xd3VVewbf0Gj5xQ?=
 =?us-ascii?Q?UYXtCTdv082wMoBwykHafkkqMxaAdBEeSo8I0xGZO5a7y6G1UTn90fgyw/Ch?=
 =?us-ascii?Q?/gBrXQPMaLNZAtK3P053EgLMMgpMAPqwz2uAwRX4LufTF/qOuwrByD7WeQuv?=
 =?us-ascii?Q?a5pJoFFNrSR21VURs/uxJedLV3sswb4Et2Dbeg9JTYsrLu2+pDzdcfuZIHu3?=
 =?us-ascii?Q?9ZzHIyVROh5j5bWmhOpZt/MIPzLjCEDl8/+PRs7avaARGPCBROEzcJ5y0Qnl?=
 =?us-ascii?Q?ELWE2mWctQRQxM4WggB+YHpi+n47rKhqbVFZTDmQPsnRg9XHUa0wJVLuC5A1?=
 =?us-ascii?Q?OyLi76wcuB18wCZ83EXnqZSQdpDKpgxv+uLyiBV3+8ympapJDX1SugKW35oJ?=
 =?us-ascii?Q?vnXAaYU8nyP08VslU7Pm/TDzeYbcLSRWyDRK2970/buGAercZS1C/V2XlRNe?=
 =?us-ascii?Q?TWvQOSXYOQ2mzimvVt+JkYVwzBEKwshyEPH0eLd9fHfPngRKM5ervlRGtIMB?=
 =?us-ascii?Q?XACQ6CpWyg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4732375b-e92f-4f1a-c9cf-08de84781b95
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:12.8304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cl2roIJMneiKYDBuv+LUQlEJsimV1iBeDZLK2HBBMLsEy+O3wDqYQHw4r/C1/JRgEQHj8QaDgoT/E34pH+LFsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Add elf_section() which automatically detects ELF32 vs ELF64 based on
the ELF header's class byte, and dispatches to the appropriate parser.
Switch gsp.rs callers from elf64_section() to elf_section(), making
both elf32_section() and elf64_section() private.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 22 ++++++++++++++++++----
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0745c332d4d..bc217bfc225f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -634,14 +634,28 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
         })
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
 
     /// Extract the section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Format>(elf, name)
     }
+
+    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
+    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        // Check ELF magic.
+        if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
+            return None;
+        }
+
+        // Check ELF class: 1 = 32-bit, 2 = 64-bit.
+        match elf.get(4)? {
+            1 => elf32_section(elf, name),
+            2 => elf64_section(elf, name),
+            _ => None,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index c6e71339b28e..360cb7014073 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -93,7 +93,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -150,7 +150,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0


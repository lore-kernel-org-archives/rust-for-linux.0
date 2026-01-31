Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55879331203;
	Sat, 31 Jan 2026 00:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820992; cv=fail; b=btmhIdWsiUzLTMGkKcoB8QnHp5Yyx5u9P2y/SmkNpVS0IkLkbTY1XU8OV442vd5L7qG6YGJSV9+BC2rWFqte9e74cddVqsykqZDC5hEJ79096fXq331Q0W6JLqLBW8LVIXE97Z2FkVqunHdOZU3ZN9Edg70N/K2ACzw+qymnfWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820992; c=relaxed/simple;
	bh=XsSS1iOQEbC7zJU+iFkR62ITVO9HTcn8a/2bWIFbXlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ld69wxWgxh2reUgg7q3TkzT0QBsZVHbDveRshXAZI6qu/5FJol2qpUgiC/xNtvYhLJvzFSUl9arnTy5QaSVRta12y/x2L0rfPhYbrHno4vAy19sZCXPnR7kcCNkKm+o4C5YaAqixi9olL1cpgjGX95aL2D5K6Q5uln4k4sGm1kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GhM8OwRd; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GhM8OwRd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0YroHIbecOFr773J9bs4mR89CzOIxutXUIubAIjKkfPOeNU1EBidMPO/ldhWFYDQHqAxr4+KTLYIwz+k4xa+PWVUxf1db5EwSecZ6vxapO+yAJ+AUojz5691tOftd3GjJg+eRHPvCOCK5zH4SkJBTkfPFAsru3tTDpIQcUW+k1WMumk1GMnky015CKDdNCkX3PGHweoZixCOVhDdXU1L1k+ko+C6roa2bUkivOnhotA9tG9KuGW0ds7sLU9OcfgpA/ePebVjHxpH9peMZxy6lO/R1OABMkTQvsLcR4WFklGmeyMHMjxibMZbZleFYf3btSsfKSAwGWFHB+r6AXvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb5KzhXrfo7gyhvvqAu2VMbykPQoJw9u4nDu3nBOEvg=;
 b=N+RZqu/fFJy/apuVb8k/fHLjg6tdyIw8ri+EzgB/s4todxlrYxHqvF8DIkYzAlzTuvKlUXRkjIAGhZVH/f0wpG4P4i0oCOuY2p1LxuWtTmMBKtd/E4foouS9vOrwqeKluVcXasyjuqOCM4+gdQt0BpXPzkJca4CmAnD5sSYoACJ20+Fi6m+TsubPBzPW749arOY+bEzUFV1h/Dzn8gB63HNm9wO1UJetooZD312P2odIRQ6tr12nhxffjhAeFobfPsaB+ZfnwXKLBtITmda3BWZXtNTbdrF+1Au+aHU/KofRRwQXn7zcr/SRkMIoxcYpfRBSKidT5AiBh+KM++6RCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb5KzhXrfo7gyhvvqAu2VMbykPQoJw9u4nDu3nBOEvg=;
 b=GhM8OwRdd2r5jtDQrCVWYVRy8TJ59rhLIZ8xthT7o4eTjpuRXhwWqt20RHe0RRRgpneo6d0KEVmgjkVqlUSHIwA+5c4J+TeWKPCRoek1KQ6b/RQYmiWv+AnjrT9P5ipJIj/zSCwhoMeD6hAYMgl2/mcLbbJaLGzvpMnp5+kTVw9K5qWRBoALAZFqAetVrMYJwqbteVMKvKeFoUmD6HqlNTWp1dr8IF30aBiLGki3RLulRaBBr14VVR523Lc6Jgi5nbRNGCDQ4P7ACat325mSkD0T5XA3yTv7VUJSpHNFMF31s1mWjcqs53N0wQgkl3AzfRyJznwboXyIdGNmDQlGKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:20 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 09/30] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Fri, 30 Jan 2026 16:55:43 -0800
Message-ID: <20260131005604.454172-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: b93d366c-64c5-4dee-45d0-08de60638c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sCNEgxlvMM4IMCOWuivH0MmhMpt7N14AS0tccy9RD3I3HHsXdjCBj8nGM4Ep?=
 =?us-ascii?Q?LQMkjzjKMyk3OGvM9N3bV/JeCcpRDrsVb1PDHZQxTGEYsw/NCKY6tDX+vfak?=
 =?us-ascii?Q?toug8bFuKzNcS9eCfvYtBn+5KEeXSJzsQxx8CwSNNzqnYZh/lHAKJOh0neH1?=
 =?us-ascii?Q?EFEaqd2AvCsWUStmsp1yYLmRD+8jZ4kw+arb8v6u2M9WRwFV+8bfxen+MWp1?=
 =?us-ascii?Q?jjAXk8DK/ONmLWVcQkMISwqWp9U40q6ZLHsVhCaI4pryfTgzJx+rEYqdvWrK?=
 =?us-ascii?Q?loYWhcAZb3pVZyveUKomXVXZiegVLeuoVKHB146z8cl6QKLOnmlxgmm/OZVo?=
 =?us-ascii?Q?0WHLmsYE/9ItrxMYVtG3dMOkBaH2NnfIfldVnnNusoUeOCnWnNB/7jPFvQbh?=
 =?us-ascii?Q?7debphI2m64bCtRJo9zVM/7HIYZw/44UBkgt1Tab2B+DlScIHkeeFPZ8X69O?=
 =?us-ascii?Q?emzPXieLP6QF1InFGkxM61yfXxJu/VRBVA/po7sYj/lXoPT2hu2LL5u3FvHV?=
 =?us-ascii?Q?/OfWWb1tfCAqLpNCO+T0P+m+cHmze5wuwl1WmVFZlbNMKLEakBwkek0lU2VM?=
 =?us-ascii?Q?W97t2hsxUny/PqhBiUUJ6PlWj7HV+TKQuzQfbWUH4ZbZtxU3IZ7R7p3HzhO1?=
 =?us-ascii?Q?fo9ZGO6SsrnSa+rL4vYCqKy9Sb+3Kevv6CPgwteHpKkNLJQSSJ/SDXAthrkm?=
 =?us-ascii?Q?gJVcABxxj8vHkGwsOBPddi/rKlUh02JxxqcWLjiZAvNpfDrCER7Lbl8Bonve?=
 =?us-ascii?Q?LgFVJGGSOuqZ6HZQDYW8vrgPd43EkGQ46SED1eO5rtuZKpPKKXnQ0NNpws5e?=
 =?us-ascii?Q?kH7EYXYqHCykjW7hHGAezH61bIXVqXJ/7SAhTFgr4qdYk7xI2UZpOxVHsK9u?=
 =?us-ascii?Q?xZhWpQTmkTEijPba6yD7Q+kZW8uVIosUj7QtitKmXlaDPkwbr/mbZWcvN3gO?=
 =?us-ascii?Q?D7NJqYVtJifmuEI5J2s3GCTHGXr6PnpReto5DqhJXNMsx4upZuQ/FWV4eZYQ?=
 =?us-ascii?Q?UAyIwKGi6R7wYHhsblM6x/Kjs7KtPw0Uzrdgmr/RHWsRKxeVaaksJrPHkLjD?=
 =?us-ascii?Q?wrGi26XIZuLHDlT2t5msPG/CPUn89VYHeEC/0RDcoc8azQyVUpxJXSnZ8yCD?=
 =?us-ascii?Q?DQLEGzu+Ws4LDXrNKDyRoK++3JatLMBQ9fuSCEw60A7J5Ao/Pefisku6+nEb?=
 =?us-ascii?Q?FMcTjN765gClldJPmg1m6WRuJ6KbLrwPNX8PZ6/ZGl8C36vqI/cky4mglnd5?=
 =?us-ascii?Q?HSTbNduHqarYjMi6ktaeFRp58H0HWR1iiU6yGo+XfadIddpC9g4d/CCO9XsF?=
 =?us-ascii?Q?91Tl5Zw5+Og6D07Q1kraGFpE0uxC4ZA1PjyxDQmlvMcvJYoA/E2n28ZhLWh6?=
 =?us-ascii?Q?dKUVdUx4S/J/6f8qNO1f55eC16QcRLeqNuyamkO3okJIHFAtVJZ3Nt/K2qSx?=
 =?us-ascii?Q?DPtqX/tMg7nQv9YL5t1SJCJXD9C1ZZrxvg5E1X2sm7ikqbrGo1SzIOA/f7Bt?=
 =?us-ascii?Q?XFq+UF2hz5SeACz/Q9DexcFPGQX43gX5t5ARVr+niWFfWspb93pPw3KJlkma?=
 =?us-ascii?Q?IRA30j0jNjvooiprxNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sxC9zY+SM9zJPHbs1FVzLmCfrjcaP2fT3BMRkrC/JL1tu2v8EXhgVQFRO76X?=
 =?us-ascii?Q?RpWH3kGd8ZgG/KPFzw91TL8UUbFh7y4y/YiKTaHuNIb9GZQD6MTfVZEF5LNd?=
 =?us-ascii?Q?gmXvbyZXgt+9EnVYhBwEfJuNptfRJJ/M9+9CYSExa/rtRz3cWUEOg1wlyku9?=
 =?us-ascii?Q?mxt1ni2Zd/Y8zx4X3q+KZS1AgSXkbZEY63q/IbfQAgFK9es0rmF0q9CpanxK?=
 =?us-ascii?Q?UvDggJoe62PVGukQbLcl4dy9eZBeKTQt0UkREy78Z6N2txyRKQ5P+3lJec03?=
 =?us-ascii?Q?99C7fFk4daXvSzmafJaGz0srOuI3qoXIpnf09EdsFTKv4+4RufRVoYzphXgB?=
 =?us-ascii?Q?d9xeS/wx0gN16TiSquju5NU0v7JtjNZspLf88Y2X2Wq58IY9db+1sxcz5ZQb?=
 =?us-ascii?Q?nXcnSEV3y4hd9XzueSack6O+C+h1l8AJP5FQx+JHQaWcU4bu+bwAsxixUOUO?=
 =?us-ascii?Q?t/z96C1Ar5PnmZP+jwsxtGFFsUZ3fsnu2f/dc87VqV8oMtW+E+hT4ESibU7m?=
 =?us-ascii?Q?ye6/ZBCe8IAriqc/Vmr3YyrFCEBYQHbn1dc2G0xlOV5LK9AGGUcfu+Hw2ik3?=
 =?us-ascii?Q?8Xcu+ZfUF6W4S359Oro0SwRR+yT7U2WXy8+KxFFB2noSjbuxQRFDlExrgynl?=
 =?us-ascii?Q?X00FetZGvuJ3wwDTxJ+kRJUc2pFqWqqakqa15fj7EM3ycwkGyp0pZ8yb61Jp?=
 =?us-ascii?Q?7vQUTMp0cVhsM/w3Jf4QoX5KiLLIzxXKuWt36xDo/4fu1Y/+w45J2wNd8/yt?=
 =?us-ascii?Q?lop+nYI13VddleqqGqdu2kP1kTmKITEyDkkFd/HaOEipSY4Yx6+tRM0rlpI5?=
 =?us-ascii?Q?LNT3UorvQQeh+J0WxDYKN0nyRUyYIjjcO+YrlS6rsqslaygkJ6OC5m0f/hgm?=
 =?us-ascii?Q?PRWecktm7dJVtiefWGxsCpnYWLOM612snMwFXmHuGfajP2RGiZp7omCSMThg?=
 =?us-ascii?Q?0YyBp/m+ZKFfKhTRO7ySo56+1J4EIhRyYH9MYR3+6uVV/qcnNnt52BfkYGIb?=
 =?us-ascii?Q?Br7Ayfpt49MHhEKUsu5x7eS1aaApgvP/Dr8ucsO6m7hAQHGUNthIN+2Ahrb3?=
 =?us-ascii?Q?xg5Mtakl96ZUilrEJEeNCoGc83mI1T+LX0QhgUFHd1DkbHkNYZv2MQ1U2gWl?=
 =?us-ascii?Q?TUFZCTHKTkPyrv76iFsaJdOXWjHTJhI+uV3FyMd8m6PlZLKIfIn4D9bMOsfc?=
 =?us-ascii?Q?FMMVhxlFGaHz4cnZ5/dV7jcsbOsyAdfQWdXjUZ0LZESO08fFF4Bx4p5vAwuP?=
 =?us-ascii?Q?VZUhVsJqtiveFjcbR74IAkROSjCpcOdqQ6vq9T+O7VNaKyV6/FIH+4F/VCbP?=
 =?us-ascii?Q?vlg9VEgZ/vJqdIt1biE+C0gb7/nJnQ22nb/Xicw1F00YGH3Q83bZt8qhuj1Z?=
 =?us-ascii?Q?FbH3r4YUgJ45kGGn27kuAyAgUGHUb0nBjWJ1ysg1P6fVJgn6Ud8kkJpk8YBc?=
 =?us-ascii?Q?UsA3aY2xD/JwJa1bQkixGrnZpk0jQ7pCnoKjZ28OdHE4RdASC6Hm+Zmly4KJ?=
 =?us-ascii?Q?367erl1/4R5T6scbRFF65NCnlyQOzpGA7h3oYyJZWurPu0CIgoBw9FZi5CkL?=
 =?us-ascii?Q?L/UHO+oVV9sv1Qk0MelwDRb09h8MBrw/qL6oQEJDn5dI3LItJAM9L0MaecpS?=
 =?us-ascii?Q?s4uXf7aUBZF+1rzi66WhzziskJ/ppelkIXkSstwmGRiM2BFfHkZKrLYbVsVT?=
 =?us-ascii?Q?ZGJrsmBjZJLRb0EZZ1xLnboW/HiFgbgz00SiKwlpmTX5k9BwjVHHJVsosMxc?=
 =?us-ascii?Q?2anWlDo06g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93d366c-64c5-4dee-45d0-08de60638c62
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:20.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhxiJ66A/YV4mjCwRWHsmhBRa7PG2v3mFypOd9Tl+SHHD4e+AD/J8eNcs5R41zpaRNThNf7/NRU+VU9soUtgvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 88 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 91 ++-------------------------
 2 files changed, 92 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..a0201ac8ccb4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -437,3 +437,91 @@ pub(crate) const fn create(
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
index 072881e0a62b..173b16cdfb16 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -18,7 +18,10 @@
 
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
@@ -27,92 +30,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use core::mem::size_of;
-
-    use kernel::bindings;
-    use kernel::str::CStr;
-    use kernel::transmute::FromBytes;
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
2.52.0


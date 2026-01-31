Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E489346E7B;
	Sat, 31 Jan 2026 00:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821005; cv=fail; b=LE1wLOVw+PoOIvsDHsO3w0ESaGvzOtpU2oxMkh1Z+yyNlp+Saw5By6tRzDXc3jwCahfhwH3AikGXTKh8kYZhS1Bm0fppb/zwW6qpWeOuvTcm6xGChB0nxbk+sNW5yNL+B/2m4yuRVVcFR5utU+eYMfiVclneur08MGNJVTfWUQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821005; c=relaxed/simple;
	bh=K90nASQKq9n3Jb1vM/UTTLdCMRyeVPE2UJc2oB3ptz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X/hiUNlKBVidJJR6O4+To3abYP73nfjf/fEGNclmhgBqCKXsTVgqpHFi56fNh0L8YRAaFxsEXIBn2IZfiyNdv2G5ctq0hY0fSSEV5wxX9UtZ+nUBhrS2gMnO5cOrrtTJgak20yYOuGR6Yg6vzj8lHml3l9hcVwXpK/gyX39Puj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pCENDOGJ; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pCENDOGJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyrvEgxFMBkJmB9AVumGGjJ2w4WAUOjsmFgqs/PmcwVzp05IQPcV7dWC9xSeV2f1BL6vHm5uo7BZW7TnKLxI+STtu360yv5BYWOTEZuUoqjx4feoOlHs7kDuehUsZR3ZHgeu8SqDh9z2+WPJ/nfG2+FPvWhN00/oYhfX5LHeJmQpCDVrKAAUktto5Ogz5QmHp10042xXWqXzmy3GPZH56ScFPdFBn3uWsE2SidDMFPEAtyNs+d3nAtJuZ9woqlmaPwMoVTCdBWh7aMJ+vx2kNI/Ny1jrPCQz2Gy1whzxVQBhk2A0Ka1LnSpnlMMzCowVfClKAEEzlvL2KIvJrPLOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rP6w4V3v5hKOtH6CgR2H+8g5xiXQSJzMoKsgxFEZ+Q8=;
 b=sMsiIhrBa4e9TJpGBktAJ2Jy4whf6GvhxpylCI3Ry239vWQp8fHxuxVtUZSvyidwI/q7AzyWTpzkyAL8DeR+aat6MeuqcwOyqEks4d5X99481jlkU6Q3FiiF7Y39jd5ukubdlmbUGxFTRmVwTT4xFQ1T3MF1Mt0x7ee22ZzkkAqjyWNuPTZcYXFSohTCucWkTu2BBQCxOGQqZwOr/QZ/cxj3fDcVwEQDfGeB7jBQ8N/RaELn7i+vlJRiSDFIh+46B31VXmTkl0vchJb8nleqfLssTFHPrZVSxhDG0JMNKH63J+1+qOOs78VBbPE5ddq1N4F5pezIQ8RaRUxXWuxayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rP6w4V3v5hKOtH6CgR2H+8g5xiXQSJzMoKsgxFEZ+Q8=;
 b=pCENDOGJskZVgonFN6ILRGBGqbj/1Bcn3kbkCNQFg8Hz3aZiQn+d8zyQOBT1ewAHwyP/hLEwn6DdPlzY1caxa4d4OogKhYgHrldWAdhDlT1paQnOYMOroGTgR9rTW4xxoQjpVyhcig/cC3nLdABPU+ygNeTC8797CYl1iqQ74h5tv6pr6TrNsfSRgeAXBOByDRmnl5icDxddgZUJi/0Awavv9/ru2BZMmrVVDxTVwex4x7C+BW9R0hoP//y1i2XJNKQ2vWjZtqsZSk0qHFlJ6wogzb1jX5dXws1RnQSsdSh8YNeoPR1k8MXmoeXkIPNDDi/oHSg6QpqUyFhYizonFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:35 +0000
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
Subject: [PATCH v2 21/30] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Fri, 30 Jan 2026 16:55:55 -0800
Message-ID: <20260131005604.454172-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 6430a192-52dc-4439-2b0f-08de60639541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eneMysnjeJFhmc8YQxjOAre9NeaYGSEUsaiXKaSXGgbib5TTukH5OFUBx3G+?=
 =?us-ascii?Q?japgd5S2BWmb7Pu8YRp/2ugMdSWc54fMy8h1QGvcKemw2yduyHQFZPtMwkjA?=
 =?us-ascii?Q?NJr3V2nIYyV/zXUwBSdpVEk4QvVELr+Fa+l/kh/XhbNzWduuUHZ+xpc+8C8L?=
 =?us-ascii?Q?F7L5HvtvQA8fnSj8AtL7cQRI/jiGH9af7SUHIGRmfExhopYVaCl1xb3Yrc0p?=
 =?us-ascii?Q?Y+M9w7CWH2ablA37N/wj5CBASUMHURmpHBeEUz53RAeoggZ/41RF4aI0u4EA?=
 =?us-ascii?Q?8isyD/vZk39yYtHBNnZ4sa+x4IPhq6d9+kuQcwCq67NwhEhlg+j2jY5mrIk4?=
 =?us-ascii?Q?O2Ovt8qvipDbKBRRAXbSC4fbHN5JbntrqAU6AVKbLzOVnJHE+PaorKNH692A?=
 =?us-ascii?Q?edTOUUSvl4xqZOMcqjJ9Wmrdg8Jimk2Ost1XOw9Z+UQUOzp/f8dGOLbZHAuu?=
 =?us-ascii?Q?wCk9cVYbRNXf7bR87vtycwjju0WV5rIFJwQPjIVYG/ZhPIOLjfjGjwXlwOxt?=
 =?us-ascii?Q?eDz5Hx/XWi0wJjQ5K5K+VsxP5f3NoHvpM5UsT60+6M9HGiaxlDbF/1u+3Bts?=
 =?us-ascii?Q?gGOY6F2XqEcvnftrKKREQb9fgrmHiOtYTuT0DIm1z4HmARFRC/auOxMc81tL?=
 =?us-ascii?Q?rQcv8G+udKF0p8bSS9nmFj4GCmlLvIg+tqpzfFpoSW778sQbmKzrTvxMR23/?=
 =?us-ascii?Q?atNO1Erc2nsWj7FzPz5NoFl0bPxdmLAV8HlX+H3inhYOhKuYU3bZUWtaxknq?=
 =?us-ascii?Q?860mu1C4nwxJC2bUT6J6pqG/LJWhVSM6TRwW+c4pUgfmLMsltwCzUg5QEsHT?=
 =?us-ascii?Q?jPZYEgWCZGzODmtGV5fhza6TpynKRJrKxRZ3zNh3trZh41bsGByANFwkPNLt?=
 =?us-ascii?Q?RbfV4f+O8FvwhO5tr14ibmsSdwwxvoXLqkv2vMKHkI8U9VjfKiciXwsdyyLs?=
 =?us-ascii?Q?SV+722BhOH2e/RxWOq70r7xuKLm1fdhqEfr8KBWk/zoSSGzz17XabgSVlVsh?=
 =?us-ascii?Q?Vo9WJFVfYQ45wGLOCdBTZn0AbfxaOu1aYQiJM7gbfdn1iRR9IzrhPCQficFW?=
 =?us-ascii?Q?QjggYLvAY4fMtcgAUFkeVS526YvusboIUnt7ShcrVGniHZdj0PyYx0Rd6IB7?=
 =?us-ascii?Q?NS/57zdNrjR0GZ00vYzGC3R2pxlGYzvplTD4L157SaIhzSX+uxYTlmQXYjOC?=
 =?us-ascii?Q?MJNiyur+3UVvRjQ5KJiQf6vzX3MR3Giie4ecKetLXL7Y2UV0oNEB9V66e7lW?=
 =?us-ascii?Q?ObBHLyIDiHMr6TGDv5WEJ0nfXc+AwmEgoRpu8W1XpSDRqmM7kRrwW9Wg0ERY?=
 =?us-ascii?Q?T1W6iC471FgjPRVWHzm+b23vgeOFBlYwvCrVo7Kh1TuZobnX6PcdDybIK77/?=
 =?us-ascii?Q?8cAODtbkXSEr50QOark6+99mKGETRVv/xUbDnXPZYfH+c8yOu/7rPHjbgu/r?=
 =?us-ascii?Q?c50ZrQb1zBthRb4fPvj5oaNNBhE6efmw8BJztugECTsnpZ0UcV1tydr67Juq?=
 =?us-ascii?Q?BDvcWL/PqLkf7J/yfDsNl98aaASKl6yM17JYav+Nole/pqccRLrsQ+ndM4oO?=
 =?us-ascii?Q?AzQevhQydfljGF42odk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JTROkUunj6ezu6LTtsFBmax/8sQsxWpt0M2r/3iPDBKcAVV61wv8XceoLwvy?=
 =?us-ascii?Q?s58lCH5w0IxFU7onUDjzd3YN7k5OtXVLDrOAkhtLuINGfPah5r3wq/IfSD9c?=
 =?us-ascii?Q?OXtPuZ9lnKrvWAmPox67BqPujTwA5r+gqKRP+oJA+1G6vWkpmgrRybmpsyA+?=
 =?us-ascii?Q?4OZ18n1fICjCmV9B4Ga/7YCf8hEFTJeQ+O3NWEZko57A5UiSk09ckEVJJTlb?=
 =?us-ascii?Q?SxvxHj/U++BV3RmFOLQhoza4Fnxlf7Y433c5ZU6J0tq0983mCRPCNtPsJCVF?=
 =?us-ascii?Q?BObMfUnZbDxo2MmpIjPypV1SYnsu2z2ZMchVmzxFhXsGpFXMhETdc96LLC6f?=
 =?us-ascii?Q?u8wWT9MgAH5dL2y6MOeZbIMCmabDBS5WEX7ak/qfcpGbsnrFAGa0O6yxcQDs?=
 =?us-ascii?Q?74k0nY0f1M+GLoSWG9NwZd4Z1U8BVKeAZ8vQcCoMHmEyMemaH/WzJYidowNG?=
 =?us-ascii?Q?iYA/zsagn4yi4lWeQcO7xY9+2E80WbIr/YO+Gl8il0IY2ASzZpdKgpeWQGR9?=
 =?us-ascii?Q?iWzV5XpSmoOoFjwCMdGk5ZVxDtDa8e1ZcdyIcSPSr5bGplX8JphFgD8+WDmY?=
 =?us-ascii?Q?cJTLc2zhldSHh/f6MNr7Ej/OzObNSOzLtGj0ZOfKxl7vMuv7XmoNEuuGAm2C?=
 =?us-ascii?Q?Ok3SbA3nuQvLZHTm2rzXd8+y4fPCpWN0yaQbWl+do003Wn4gM13NOjCSNqPW?=
 =?us-ascii?Q?U0h1X/DLH/1b4Ydp10RnHrvvCUC2R/p1vvPD1h2oglOsTxtX090fNJm7ohlB?=
 =?us-ascii?Q?YSzI39lEXlGuF5UpMwaVueHfc8td+2KhFO5B58YefC3PCB5ZQ9/cLG0DcQqU?=
 =?us-ascii?Q?9paFilToPqaPjcaHK2Ja4U5PMvwqXAdtb9vV/fVKkjSktuhZ5osZjEtRjm0j?=
 =?us-ascii?Q?I3HABCDcAnCb4c4Mpb7P5BQAoKOEOQrnY3bsyRjR0bjxVRu1iy29KmK7DGr2?=
 =?us-ascii?Q?3C5qrvIDSoiOkKlJ27IWXRxHCnq63xHIIr2Kr21wwLT4z7XiZibw5eJ8MPlF?=
 =?us-ascii?Q?RwJMOAndZOUyHJGEVd7XD58RUiflkPvbHbfoxDFVSKApi2dyuMlkFW3uxW2B?=
 =?us-ascii?Q?n+HEUR7iEhxnD4k2cwViLyyJmrgawXMP43S1ghSveE938GjC0YIw4GabS5mE?=
 =?us-ascii?Q?OIgtJm87hjPmJgkbgAxJbhjPLmKQTf7RA97+tG+NvDruOREUBbjLAYPsOepq?=
 =?us-ascii?Q?hNdbD3577YDYev8ffN0Wh+z92lhaBI+z5RhBcv+ubuaLU+YkIrCk9IjX8/zV?=
 =?us-ascii?Q?oaguEwu36iu47vIgLY5VWgmKEImCkzxVkdbjmNw8stHGt+FRjBSdu2OGhAmm?=
 =?us-ascii?Q?4qF+6eYnuuReyKs6HMNT7OSF7husZukOwWQ0Q8osd/6SmF9DBy77jP2AZnZG?=
 =?us-ascii?Q?EJ+bwettnLkMRU8jZKgyMu6Age/7WSrB4ya0c6qaQty1xSjh1b1huIXyqjAX?=
 =?us-ascii?Q?FH9QtTL6Gc/nIQDJmbrWvfePCxDN+bZgIF0znE71GxebotKvO5UEt+WUF1U/?=
 =?us-ascii?Q?yVOuhk67etSADg5uSFsUMIU+WIlbMS1APM9T2S0x/68AeCZ/7LWx7PRSw0FP?=
 =?us-ascii?Q?/RlHefvfJBzUwLq/bPlGqtX/oA0sCTsJte1jjjHC3n1UzjwWXcbTrV3EYVwJ?=
 =?us-ascii?Q?NC8tAVp9vQz0SPlEzVT5DykxakbRfSno46BDmFxcz4Nj3lDbAV6A/2w55dbd?=
 =?us-ascii?Q?zN7PDek7OwU9+OEQVDfevLUyFUHCbteUKbB/NznbSO195F5pR4s2l224nL3z?=
 =?us-ascii?Q?T8RWVreuXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6430a192-52dc-4439-2b0f-08de60639541
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:35.6824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgOVmyxkaOazRLHP8g7GEx4wTiQSdZfNDk5JNh2tlKytpXFGjAzDfSQiV+eP8eN81kAPkW4ebSvjt4RxU1QFZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add extract_fmc_signatures_static() to parse cryptographic signatures
from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
public key, and signature needed for Chain of Trust verification.

Also exposes the elf_section() helper from firmware.rs for use by FSP.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  4 +-
 drivers/gpu/nova-core/fsp.rs      | 81 +++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 9a9b969aaf79..e9101a08511f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,8 @@
     },
 };
 
+pub(crate) use elf::elf_section;
+
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -607,7 +609,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index c5f3267ce329..4f7d121f4240 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -124,10 +124,10 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
-/// Size constraints for FSP security signatures.
-const FSP_HASH_SIZE: usize = 48; // SHA-384 hash (12 x u32)
-const FSP_PKEY_SIZE: usize = 97; // Public key size for GB202 (not 384!)
-const FSP_SIG_SIZE: usize = 96; // Signature size for GB202 (not 384!)
+/// Size constraints for FSP security signatures (in bytes).
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash ([u32; 12])
+const FSP_PKEY_SIZE: usize = 384; // RSA public key ([u32; 96])
+const FSP_SIG_SIZE: usize = 384; // RSA signature ([u32; 96])
 
 /// Structure to hold FMC signatures.
 #[derive(Debug, Clone, Copy)]
@@ -241,4 +241,77 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    pub(crate) fn extract_fmc_signatures_static(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        // Extract hash section (SHA-384)
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        // Extract public key section (RSA public key)
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        // Extract signature section (RSA signature)
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        // Validate section sizes - hash must be exactly 48 bytes
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Public key and signature can be smaller than the fixed array sizes.
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Allocate signature structure on heap to avoid stack overflow
+        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
+
+        // Copy hash section directly as bytes (48 bytes exactly)
+        signatures
+            .hash384
+            .as_bytes_mut()
+            .copy_from_slice(hash_section);
+
+        // Copy public key section (up to 384 bytes, zero-padded)
+        signatures.public_key.as_bytes_mut()[..pkey_section.len()].copy_from_slice(pkey_section);
+
+        // Copy signature section (up to 384 bytes, zero-padded)
+        signatures.signature.as_bytes_mut()[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.52.0


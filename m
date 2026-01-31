Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295731ED83;
	Sat, 31 Jan 2026 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820994; cv=fail; b=KC1U0rBdWFOKkQji1pIj4EeOiF14bsEvzRnRiUZ95CuwB9wAWvMFoVSD7LB5ReBYve37E0qJr5AfVRuR7+Oyt1LPrR38s+L22z1olbgWacrTTUxYcu6SBf7uKs0LKfawHu1kJYbR3q88aA7ROxdL3ME7G6t3ILODYVVPzKncTp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820994; c=relaxed/simple;
	bh=ZgxqPPUZXN9deHEj4HDq1WneGrqQE2CMLfPxjIqrOyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUw25V4riYWf5o+3ecUVLyW4dyzLn7WEg1tVTWyfSb+MAAeeKGmaUi+WuKoEmI1odIie2dVCzVkGZem1alME47ZzSAazomL80cLkuWZCUsvkKhMdQ5T7w0FlnZ+ij9nGHBjGcm2Kv/5hZ8P850bmU2WY4pFhnAk+ZMIs5zNudHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jUKPMPo/; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jUKPMPo/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcroE8stxlWH+TnHKhLiyIHHelKJtBCtKG+JGth9XXlkTLVaX0K0GO/62C7ZletTTucdSezD0gUOVsXhLSnIKvoi9UogTEDg4nX5nBiLCQxzaEFEFSi3bGaIM0gGHijJPdspBLsfXdcvEwOcyikB5SDJAQTyiWYo68PBya4CN/QtezH8PhKsaRtZO2fnlHPHyfA16T3EapC2qfPXQC6oomqzfjEi+oJKL34EnALFy1peOEK6MFWhXhC0tPvHrRnAOwwQD0dv4Ku6V71jOKmn+OfKkqABGGrT0j1N7PjedaA1foABN52tP86Rbiht8fp0dbPZb0JE0t6qdtCRudNkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DohWhvVmvtq8FzQqlSwBfVvo/5AOAJNi9yyjB25P2Q=;
 b=sKN1TigfnPdVQ1GN5FGk+pIiAh7SjrCCL5ING7iq41pSyHabQFuRmCbYNjle8hy6OfHw+wIAi46uZHnqLAjWzsgQrK4+UlbWEky5YIVfqLwFvCEuNff5DZP2VLbnjrVYaeWDK3MpDQsFoYsshoRn2psuGsV+TVpjr+DVZXuC12EWP+Hdqq1Yu2xvOvOkzeToQ6C87f1rW0sVvBcCjIkKEW6XOpzrlZzDfPMyWhtRTuHmeO98Wc9B8/lrwh7SbCiXyQ7EsY1vu3fs0bhenLoh0gljBsiWl8DiMeb/BAi8P7K/1C+2taw+kP61+yKFU+7HJUCVRyFkI2uCgukccVLhOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DohWhvVmvtq8FzQqlSwBfVvo/5AOAJNi9yyjB25P2Q=;
 b=jUKPMPo/FQ9O88YMkV6bm7aTROzDE+ZIfeHGiz00IgE32XLbqgtOQoWCblPwXD0n09xKBQdSKae0WeKHASmtKiA7JMkIRtVYVkRFtj9DKMXec0dB5pHUDaMXH7DeZ/1O//q0wmPgR300cZgI4dFY0byh/2cQ3vsDCOSdbC9lYYXFMqIahLJW+ozP8UmKNIIYXgrpcvkGP008cXyCR5F/jWdj+mzdbyHOujqpmgxGTuMrH1P7sGdPTUc4GF13ikyGUX/EbhbYT4XBFTotk1fWfWDuE5WXvMdg0qbJzxBcGhBg59yDVmZAwj/sTyb0ZwVPCeG61MMoS3ezoI9JeLHeZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:23 +0000
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
Subject: [PATCH v2 11/30] gpu: nova-core: don't assume 64-bit firmware images
Date: Fri, 30 Jan 2026 16:55:45 -0800
Message-ID: <20260131005604.454172-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d54dd68-f8f3-4e6e-455e-08de60638ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ci4tJBKd9kb/0qlrmTDnfOnS5xtc5kxFKFvf0/Pgqsm5mWAaRlVAQTg+squx?=
 =?us-ascii?Q?heYMRbD2Gf2dhmnS5eTJ3vXQejxFqGdvJXb9K0VkTV9Ljhq/BlvLbvZSCl9R?=
 =?us-ascii?Q?o8LCJzZNIWqOHRpNqO9q3LAGqlhRG6383ooQsIvYhUhYp27bIxv20/6tHczF?=
 =?us-ascii?Q?frb5ZnlpHN0rjXZ4edOizTxnzV/8WzQDYkkhQ8CavEqEpswYSHbKuA+R5HGV?=
 =?us-ascii?Q?ClmT8eVW7szV0wiB8N5UaWO8wOvl/Nh86sPOqLixJs0mgwz4M0y3chs1Pl53?=
 =?us-ascii?Q?VAgdQ4QHzJHEQhdZov3VclHg2Ztt0Vry7xS6AGHM74BgPBFK0P/6tUFMh1zc?=
 =?us-ascii?Q?+b/HYcfC5zU1mF3EAbGBmgh3QTZU2qOuSw3duJAVPYNLVgm7OWICUJR6yvhk?=
 =?us-ascii?Q?d2nZANebYewG2+koysVjVWF/A5AqpLQPYLzG9dH/vWAlzIp9V+T+UpTKH6hs?=
 =?us-ascii?Q?SWneEf/zJCKi/kfT7Cu+1jrgS6pkiZWGU/b50RH/vH6ZG57az4rp53hsLHa/?=
 =?us-ascii?Q?x6HoByu7hHnJc/rQ/sKhn4oL9PiOU/f7E4jdzo4FVeeuUpq5IXaUckgEOIpA?=
 =?us-ascii?Q?/YrmwIzK7uWtvPEONJ/cD204XqeZ+BT84ocBUYrVn0S7cl0RvYTno4OljcML?=
 =?us-ascii?Q?qBr5LaZKjP/VxfnVUGy6qmx2hzLMKO0uGEjdZY4SKdcRCIewZhB7NgsHMuiM?=
 =?us-ascii?Q?RtUoiM2c/dLxD8Itfo3QsXzmYgLvn2L7OtBVk/2jmY5lhFXX9V/ot5LAA7Tk?=
 =?us-ascii?Q?+8UI2XjFO4BbG09jiHyMcab7Mg98sahAGGU8enKsNdjI0Xww2TqzBSl8WmmH?=
 =?us-ascii?Q?IXzIiXrENjnOv2EO4UasDYDw2PrNHTy/z3RGS/jOAZ/s7m96lIlkZgrm2lz3?=
 =?us-ascii?Q?uoqTKTUpoKjWyef+VcPmfiESld5NP+U+7cXbdTvCTAU2rndyeLXGfTLGKiZU?=
 =?us-ascii?Q?4cQiw1GrQ5eVUFTfwhY8FX8lBf2Ln4ObJ56zZUbWbZsjrvCMTzDzXUJeJw6Z?=
 =?us-ascii?Q?KjGoFAomUE8GSwKe5gua6nK6lWuLCZyoVXITjnQDu5ZhwdBn7N8n2Px666Ck?=
 =?us-ascii?Q?Sc9LRUfr4YbJHJvdQqYbNYgZdSCJG0SSi/+6EjtAeiKkgNvymdbZI0+Gf1lH?=
 =?us-ascii?Q?/aNRi71jxOo7jwLiV3UBCptZ37UMLLU0XeVwQM61L/SwpsquPfEt/ocit3fu?=
 =?us-ascii?Q?8q6hYAqOSODXGdupo7r8mU8ocz8Jo1NX09wNaO9sk10pg7s/RlnfvY69lWQz?=
 =?us-ascii?Q?N6Umwdzqg/AOQj2jptvDCFuFIkXTfWeqVz4mPXWvnbbzX4TquYB9GGqwY7Ca?=
 =?us-ascii?Q?dRwtBKNb5OWhaSDof8Xqilq7rZKgq+QARgxdDK0wQreecYIFvJlMXM8iXVot?=
 =?us-ascii?Q?qBrm4t5K3ZLhfWpqnBgr8jxG15sT6VfoZ0ejyBfQlh/viqcg1+Q07Npypf4H?=
 =?us-ascii?Q?DaCRX8XRJxw6aRpaeWsNSHvpnxG4vulRh20rqjVv9sTYAo3xAyf6OpWECgN2?=
 =?us-ascii?Q?y0QQ1XWyX+1mfAAz9ivaYKw9kgyIJcbesFSJUxSbbagftY46p1xut7o/fILX?=
 =?us-ascii?Q?KkDORJiFLQxbUTmCBpU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IXtO++L1KIntai7jDonA/B7p6ARX5h5djaIQc+VsCE/g6CfRfDreXUE5ogoD?=
 =?us-ascii?Q?8QxhjAxmWZOBFMgze22qmP7ofrkyS/jHOGf4nVI4sTKmRWGsfQf3frvNhrHg?=
 =?us-ascii?Q?uu0KZZgK+RhaJMurXhjK4X/tm808XZ8ygNJvZdt3uK1X7Q8Fvu+CNLrdndEd?=
 =?us-ascii?Q?MUcmSvBFw6vuWZAqHxAMYiHT+Gsn0B3srYtZoTlkeQQCBQgji6CyIXv+4fJv?=
 =?us-ascii?Q?XTR8BCljODQj8n8PjNNNAEOvqoP5msF42v1hnXRK3F03gCJg1oE0Nfy3hucu?=
 =?us-ascii?Q?ObN0nCHn2vmYr40xNpOxqz0uxhe76wqIszsVHBUF3Td3Q7TdY5oooxCf82hx?=
 =?us-ascii?Q?UA/Mq761wpADYuAOnzwYnDmaq9oyAj1VU3oT8VI08m5zl3TXQ+PMoaFbELGa?=
 =?us-ascii?Q?ranK5cEdBerXvfcrMvkv3+y1arMT/gYheh19OhuNwQ0QAOrrQvFU+0vD4rmJ?=
 =?us-ascii?Q?u2GspYm6UZsiPOP9+0w9xB/+RtY1KjUuFltD+aGB0r7yPNhd49VK8uHJarw6?=
 =?us-ascii?Q?TzdpT7Jm9im+UP0qAVXYFgCsxAVqy4eAwItUrwdv4s9yNucMBsd57L3k8eaW?=
 =?us-ascii?Q?BlDTvEkl/GErHNN1NNr3CJV6AaxvHw5TV0XM0u1UNS6Y4kEfDoMLH8QdgRhl?=
 =?us-ascii?Q?2zfyo4xzrR8ALNlllgHUQ6glFVnUo4inANxX9zxNaT970wTl36hce+QwF5d9?=
 =?us-ascii?Q?wkEt8XVR+AQWYAbX6sw3k6THrGsBNVOq0AbkP45pgWz9Ip2X+roOVCAUOIq+?=
 =?us-ascii?Q?a16Un/lSZT7b6jdNpkQ6kQlNFasNyiGPshi9bFlJA4IbLcIrtjoV6EwsP+Mb?=
 =?us-ascii?Q?ProoXc+b6AQ2kqZLwNM6kh+AGozC3rdE81hVdsQPLsVc3V/gSJ8QFzm29/jZ?=
 =?us-ascii?Q?OENb5nFCjxONtttQ7+5haAaCAM8SXBM+nuYu8fik4+p0+pXQdV18zEKoc+cu?=
 =?us-ascii?Q?GwUnJyLVj/kATPyTwAd0rOjtS8WEHaB/5qRfjRqBkaDj9wdQ2CwaROYUvA7v?=
 =?us-ascii?Q?sub1bWgIJ8W00RLoNc5Zxx67bTCSx8cgkb3GakZwmiGUvtn1gbJ+Obs4TVzZ?=
 =?us-ascii?Q?dvSbJ2TD8FRLT78tcNCrmTIF69Eb77OgPty7XnfgQecUDjeyBQEalBdEfCqU?=
 =?us-ascii?Q?uSoL6S5seVUvb19ZtJnqWWc0JzsJeFZmIOtzJn8oblH1Mh9Sc7glJX23oPyG?=
 =?us-ascii?Q?oZYcIKMKZvPCYdQIKMz12PjqvbDHpSO08uE53BbAg/cBsum9Q8jgZsQoSDWf?=
 =?us-ascii?Q?F38brw7pJPDLqmC3Obw/ZfNIvH3Z45QbBmKEfytQczEzqfliuTuHtRep2KAj?=
 =?us-ascii?Q?z0qWqE8xGhngC455ygc880055iFeMhJnaODtTZO2XIJQCqrQVPtsfxcDdlgU?=
 =?us-ascii?Q?iT69566mx4tIjE70bf5/4IUu1XA6NvZYR9j/Vt9RWbQNoZxUD0JoAk9YY2v5?=
 =?us-ascii?Q?drNKJ38rAmnFRnBPWJiL1K2anWIhGJd5w6/D96nIJ+OIAH68ryVWyU32BVsT?=
 =?us-ascii?Q?SwaoPHm4ix6rgNVs7/E9/rhhTtQJw9rNA9zg5ABRbjFmMFi7DuhrQmwsousI?=
 =?us-ascii?Q?mxH0q5ls5L0l1C8FEHwu7QLeCWQ+UW484q+HchQzLPbGrnxrlg/ZQo7CRTIL?=
 =?us-ascii?Q?s0cZKPCcOzo1Rjeo5Imf+Kv/YNyZ7x5CupmjuoohI0fm9lKKnGB0CKUm4Gbl?=
 =?us-ascii?Q?l2Z6ipqlPiONG+n236vj0riYiliJjmaJ/q3WzL/fAumAtpVvrxoxxomLDcV7?=
 =?us-ascii?Q?x4SSRJpAVQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d54dd68-f8f3-4e6e-455e-08de60638ddc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:23.2528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMHSLs8FWho4AAoMGudHnsvWCFFRzNJ4j4ElRbundhlG41VgUeMBIGtqF+Gs5NERx2re5voI3smlZx95AdC/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

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
2.52.0


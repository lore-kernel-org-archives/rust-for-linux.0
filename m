Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846252F28E3;
	Tue, 10 Feb 2026 02:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691599; cv=fail; b=dpSSr2777sRmD5cHyP6V38YK4l5g+GTK/TWfNlzQu+0lxar2h2IeeCuj78JEmS7PdsR3dKfyRr3Cmwt4Tap9YbATcNSxKaEQabJ2OpwQQpYKTFPkBXacA1AB6B7lAbpyICQm+MIt7FpykG0o4x3EOAArt+pxcdeQOu+GZMyjIoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691599; c=relaxed/simple;
	bh=CXr57zBO28GpZ1Q4UdpiRdgwKvDLzIU5tsKy2N0QzZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U86DC36z+qOGJ7s3NAaOMms18jFqlntheZSHREc9SD7JQW5+O0ZfIMTuKbgVdpsxDEH29VOCRbmOY7EWwdKMApQkrrfpCUEX/P1rSOtOdj2eJaBTt4hLfjGBKj7+UbzQwtjJcGdoOREChV1CM+qqCanFXGXP0+MMig7HAo1RTr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IT4HkIlK; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IT4HkIlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIFOrbuz5UMg+VaQnN9cVe97myvpL8eMp/oF93VSsD5wy9mIy7JoFoF6HAkTSeWXfQrohAnSo9ZNMu80Xri9fr9gGzrWu6i81Nh0KJF0aJDyw7ibq9m1enDBAM3Th3TNy8ysLITPjP89BuBHfo0x1L5Q7Eg0x8mcdSEj5UaJLTm6xGq4j6eSrkLwdJeJGr6I8gYq0uthIPJuWDlHKMQC5zFh5gKjKbVTzSBuAQKRMi9RtR0vXWFNKyfcK6F0Qi2n2dT1ktSL2Q2Q7X8Ge2SmbthC9o1pCKAyg6Zb8Sygh2gPkfJd3aDZ5qBQ2ZHnqyd1bREAV4I9I0LMwmGMlzbeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWW2qX2qVKWz6Vd0/0rq/GpAxAHmJdzAS+Dvt+ESIUA=;
 b=vmTxSNB3BPzdgYuFquQctI8x9vNA4OYsCrfeZneh2DrcJlhzUJNPtiHrG2KpxvTqeI46n7ayT5iI239kyzRdv4DMDw8yxB0dmFSkW9TJCc7EcLfyqt6ZRzpCT9VJQg+bJuCiD3e2hZXjiy+6kRnyhSUb2PKb4NWH5O3WmXp4vwA9/aT3vcfr9kzGafrPaZez+UbddetChwuICOPfTqIaVCR87sjW9s3h+r0o1LvnvgLHcfSzUmo5xpJwbv28+MZayGR7mVvhiZtjkdoP9uaxgTWkPWBRTOjCTvUkOFI34PayPuQKJtEtNOLm8R5trScv/M662hCl+9gz5i516zX5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWW2qX2qVKWz6Vd0/0rq/GpAxAHmJdzAS+Dvt+ESIUA=;
 b=IT4HkIlKuV9rbe/gQwugsDnhDhJO87Uf8fvcK3kt7i6RORADIQfOO6zQjWfdGWXnRrdt+5Nqv1CXQHU7jvl/dT7vIe4RhxxaRhEflKsYUADSEfucXBk/+fyKJWCp9b5ZgfGWG2TQpCCPGe6x/EPdtVdYmN3GoF8kin7RocCRJQ/6Evh6tEBelPLEI5MtEFvM44DwxTjJiCvcxwBb0ZWzYQu27S3OKfb2Y6o91Cdsuaqe/zCIhmyLZCbjHsl10Rdt7trCxsunXTfDzWZmbSQMYZyNxue7GNEGEbfh9tUvOhbqvlZEZXulRuIqnFprlHH36Dc8Z7sTr5GWQCMPmcLf0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:18 +0000
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
Subject: [PATCH v4 12/33] gpu: nova-core: don't assume 64-bit firmware images
Date: Mon,  9 Feb 2026 18:45:39 -0800
Message-ID: <20260210024601.593248-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 85523fec-166d-4717-fa3f-08de684e90e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jldcMiNOsIAK8vL/mD2WWskv0opK7ZBm4H/QUPvxdxApbPnjopSFq7N9tAWs?=
 =?us-ascii?Q?s6Tow6VwbhJfadk3Pp9mfG/eCbPnb+Kloy2lzE3kywfg3OJepLSZ63C20h0A?=
 =?us-ascii?Q?Z7AiKZU2mtUZJCcclkKmmF8i+NZq6UQ1J2z5nuRDu9vhH0kLY8OeVVrYelW0?=
 =?us-ascii?Q?uysYZCQrWtsy/YC7u1ZkRGEVWMF808a9y3kG3jM3o2vDclYjBIv0QvheLszZ?=
 =?us-ascii?Q?XjbXw+S7KQBR+EUGf+98foiG1gtF2lohe6YeRbvH8x5avG5KauOJCT4Vn7b3?=
 =?us-ascii?Q?z2IJvThCNzoiPQ7BBwSUG17LTkVQWxptysJdh8VZ4F6P9mAC8mNl+iRS2rDq?=
 =?us-ascii?Q?ccppa//ybNw2U+NuEYCJizQfEgfYxMgZiynzYWIKFVsmBv5baBp9xzloI+fy?=
 =?us-ascii?Q?vahFeem3hanJhiLDIwVub90UWMAtG5v9C22gr2LPEpHl/+GF2AwF1fdbg6QZ?=
 =?us-ascii?Q?Vh53leOXhSG5YEFyjJ/v8fJaw1ml+DsO7k4/ijIoktQ/7VE0NkkypULciC13?=
 =?us-ascii?Q?2V2kX6whq0mJHvxeAb0D5K24B4YKcukhML76bDX9gTdHLBDWg5SMoIIlicek?=
 =?us-ascii?Q?P7hUMtvlE60xGkQEv39/+oKN/7nUXgN3Nes+UfrGFZRZ9dbRwUoSbmq+22Ac?=
 =?us-ascii?Q?RzA4ciG9LigbKhMIxbd9J0scI/KaRwuEEVtmYi5LgGNGOyvCBJH1+cAXIoE6?=
 =?us-ascii?Q?rKMED8xjNAulURV20Iyaa4B7EvO8e65mSH/Hx2NAlSOj0YMsNcVpnUznR1Zj?=
 =?us-ascii?Q?M1ic9c6d6PnNtDK71IB3NMuvisGlyLPiYMby1yZ3YvCfeopaW98FPigMWqlx?=
 =?us-ascii?Q?CFreMqu+Bby/TkTDnHz3UErqd4FofhxS/Rh+YpE0MlSbF/uPYw9rtGLfQKJV?=
 =?us-ascii?Q?dC+z6PTTah7bn85yy4DPMXZDPWZl6ykYFFo+/Cxoztty/6qVVfkqf+FY2VDy?=
 =?us-ascii?Q?Fvjwq2VuGLnwmZ3MAqdVXl+CgpIb9zig8g6l6JJ/aWcb86+Vcp0gS1YwExZz?=
 =?us-ascii?Q?dN3cWuxKJ5d65eNwiZzrmVU+kKrsmmeG9JDelWQecJaMbdU+C4y7GXYvTSf7?=
 =?us-ascii?Q?86yVYY39RSpFEf37fag8IZCXbxY25fs3+aw+1eSflphjR/9BIO7sjs29Km0G?=
 =?us-ascii?Q?eef5NKP92psvrfNO5MLSJarn49/VtRIu0wbpCiUkRJgGKrTuKp5nhQpEFyd0?=
 =?us-ascii?Q?gCmSbAVf0FSCpc1wY101TYBjv8bB5MzmCeknUBxA6+cbHdf5g31I/uwpuSWY?=
 =?us-ascii?Q?CKgFU0B/6tVFmZ+BgWI7hv8Ear3cVp92ox3dMRmyx1Gndzxz77eGkMyB4JAq?=
 =?us-ascii?Q?RZlPFvl+eoJxEedQvUu4dm2ZR3mw0wyVEhJeilec4WT0pesxCnJE+5vuspvU?=
 =?us-ascii?Q?vtPkivS8Ws8f4Khms0/SPJ4JvLUjn08Y1WV/SF9d+S7ZYTj1PVkNhc9GTLUw?=
 =?us-ascii?Q?0jTNZIydLG9Bq6KRNj8CHx8F4AdOiLa5xzhPOumA1/6uJFnccOU7CMEWE/uy?=
 =?us-ascii?Q?YW5/9kE37lu/GCubD7aHrUzIeRKSwDyBX3q9VWOdjvytpBcS7R0ksN5+RbuI?=
 =?us-ascii?Q?JFs2cISCkH/PpuhmY48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bcuPfA5LCxe3u41osTxPt3x1zA/xv6JYXQ+EcUGGUyN1XLfy/QCQ8yOYfrZJ?=
 =?us-ascii?Q?rq/XmnyFccf5qcPngT0D4Z1zAVNcSPA9UKAXZz/2pGmmes3kPlftBCR6wXVf?=
 =?us-ascii?Q?M/Qh56GQhP9rMedvVXSP3FJCRAATPW6guz3ry8/1SUb9b4FvmnUFSn9fG/hi?=
 =?us-ascii?Q?mbs5C3NBe4N1PY6mFLJhgudKtl21Lju/cJfJ/MdonE8cS27cgmJs9oDWCwU+?=
 =?us-ascii?Q?AZztIUc/aV7GJvPGXBUENdQrjitA6J1oVcPqekKvho6Q2IUGxP2Ykz3neekZ?=
 =?us-ascii?Q?X+6Gu9E7anvycL2jbFgwKYVlw7ai+sfY27EkN+LGzpTWOrQjXfIqmMHEo0U8?=
 =?us-ascii?Q?ps2X/rJXyH035nx9xzAJrhkxVouyE6BZJgLaQihSy64CQP58iUwt4pMG0h+a?=
 =?us-ascii?Q?5yf2WeL4xSQilHFiswgQbpbj0bcy2ipOWz+pdOtcpE9W7zbODANgSzNOIyon?=
 =?us-ascii?Q?0Tag+Swa7NACFSMyBxRQBP9soli9X8RcaQWIe3eS54D0dg0a/nIQ+yyyMnEE?=
 =?us-ascii?Q?VseSos4JrymbF2CKbZDqIa/UXQyR/xrgY3xHJXikFdMSOs7Dxl/ddVLxk4Qs?=
 =?us-ascii?Q?IU2f0a3AE9ffeJylgEWmQVaBizn6zlb3zd/4FhLW4Af4n1f6M0e+g0qPASlF?=
 =?us-ascii?Q?bEGTxwJ14md7/B7W1ka2IjKoE6QThGz/V6dOSgadaNhL1Q7vW42rtYOAMEH6?=
 =?us-ascii?Q?HHEctt1Ij2ctIOx0wO8EkMCXA+ABHcFNcLPrlOUrg5LfstPv7L4SoBv8Gb7L?=
 =?us-ascii?Q?pp0GDvZKpfIXDHl+aAxzA0YZNmFnA8OBtcDQordVFIDEm2Zo6uoaY2JrhqjM?=
 =?us-ascii?Q?m1E/j369IEqf/tQ9B9ZLHcgaAKU3BLoZiV29OGzCkO1qQqitLwbkeI4pZbHc?=
 =?us-ascii?Q?PHyv1EIEuQtTy9mZ50zVyck9WNm+M9J4+LNfrS2xkmY6gnrqcyFz4xgrQLmH?=
 =?us-ascii?Q?NOtTyVUJ9lJqlyEvpsvEWd/fcIjA4rVmEVfXHt4dpHMwNRlmW3skBlTDOwEn?=
 =?us-ascii?Q?2jIEgBkGLHG2/zYVyDPdagkwCWoGSRon2NgQiW+edKnUq+g36C5GtKLvmWxU?=
 =?us-ascii?Q?TVKFfoAZ1xRNhO1TQxrZ5qFPYiaYNomjIPBeFU8/eioCLmLSadxoByOdpTuN?=
 =?us-ascii?Q?sW/qdS+fyueYwglXW7zvzXTGjj80KTkALUys4Bq6Ov/NAlYmX/16hNsbN0rd?=
 =?us-ascii?Q?cI28o/uaxAIgWPWEY3kvfLhG2sNodv24jyudFMh5c++avg3p/1gI+4aX1oBB?=
 =?us-ascii?Q?b8p5STlrTSgz8pYqe53WxVH/slFaBCOD75HDR8Y7WCyhNEIQ74dpto9yJhrm?=
 =?us-ascii?Q?QHMEcTXaBFdFH920BBTaExc4j5ZCqaQKCG8Gs1wh/ihiyYERG5eB3eAWHJK0?=
 =?us-ascii?Q?AbzZtpVWw4D9gdMJHMXSpIc2RdTs0xsjTtNzjQkj4qb9OOTbeAXTw6pgGvTP?=
 =?us-ascii?Q?FEzggEcjgJePwkCFYwdLG4XAQd44csQPh7YhUd0VsBvQSUo59+JTZg50gtaF?=
 =?us-ascii?Q?U9QL51xa+PQWA1obnMaD4Fgl6YkED2KNw/P+LOm/BV9trVQF5uWzMbAxAjZ5?=
 =?us-ascii?Q?2/7fVTNocksOT9L04ZuXNymIzrzi/lXZOsHWbQnKIe5yImwDLb4ImQ8J2Qzo?=
 =?us-ascii?Q?BaTvLx6A6BBMuRCJRFVAVO9MfycshMSQQNVh/QpB/24eyqkGrizizqaOfYrU?=
 =?us-ascii?Q?PY7UYKTpB+rshBJvvvoHU6KJvIJeSy1j09xoonNsH+g7M/rBPiR4YcgroWBc?=
 =?us-ascii?Q?jO+KPdRJ5w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85523fec-166d-4717-fa3f-08de684e90e2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:18.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd5fxoafOpjeSCXwlS+8m9wKA4gKQVE0V86j4K0sz8Nj2LtPSjiI2BN9CtbdbORzSd+Gc5/YyZg/R1A38h9lAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

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


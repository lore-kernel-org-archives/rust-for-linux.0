Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75012D738F;
	Sat, 11 Apr 2026 02:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875823; cv=fail; b=q9oGpnndi/OMd4qgaKwDUZWVBuKcIQiZh61UZz4V3rTJ4r5IqxVRt+XRBnoIVlcorKyuBp1D7p3Ub/xktDujGKbHYa0wG4Iudiz/W4UIh0ZIvaA+V3uEdvlnz9PCX7vth2FvHeqVF0Ziixaxhsb6SFLlrGSGCj+wa8RP3tMbBxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875823; c=relaxed/simple;
	bh=aZiMBx5gJnxljw12fnYbM8HmZy6kH+F0VkehdKZl5rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qz88nHbq4p2yF9GWXISjxJOsJ6PX2tL7dJvHZPb5wbrTAIGMoJKSSNIcLpTNS4soCZwR/dMNH/OXEXae33bHwcHZ5XXZFXMPJmrjjWnnPGFf2OYQ3ixU3GdaAniLMRzlx1PTLeWaK4EHTGa6w22sowqV39ZE3SWT9+J+0sywAtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FXNTaLCM; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FXNTaLCM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stlIIdgnEyMdI0cW7PE5hjQ3dx23DUFitsfpyR+hJcNlI9t2pvMRsKEA3g4XFsNqq9dFJLMugNxoZcsCIwU+F7CU5gxpeL9rZIV/Z+vxCDpEphnjGseXFHoPahU0NfPWY1dzfcwsXhEJ51A/Mxww+1QKT5P0ZjxWZfwhry+K6RxVwGhOXJ0DgQhYS4Xnucc7hlIjV6iS1G3TzbzvTG0SZVLk0bwdhLZKSZwMnKIlS5y6vxmb20BN1pBCmF4VDm6C4MWnlb6RHltcscr3uupZgDYOqojib+m5drBq7y5yl0eQIiqoBsYmklzygVi03KYXL+avQ6xbYaapKDtpWEFCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIAJuw5fpQfim8RWhCekKlTDqQIR9nvVD+WomzoEFkY=;
 b=F5j7ysSj46ZMpvG43HESivzzfTT0CU75h5qBFNzfScxcn7IC4zKxHf3GGoOrKLzDGfOPfrARUAbLAZmuSqUj4XpUqvLTkB89zyb0pTdoPJXb23H6awknGMwlGSvmYNvaNGj7PNRmriPwHwaNz5LacIRr5N0Ptp/UjufQ0fgRmmD3SCPnvVH78ga8v+zw4HxkGLK/NTSJzbgsQn9pb2XNFXc14habicNZGQRyUuOHmtuypfGvvaoJzDCBNwKgq3BlP49iMxov4DxeuPmYxdYoRvoBVBdpODgZ3g3hI9/BpFONwjo+iU1F5sWzRvINwzGhta/1LZ/PGMYDQ+x6VOnMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIAJuw5fpQfim8RWhCekKlTDqQIR9nvVD+WomzoEFkY=;
 b=FXNTaLCMIlzQKVmqYjvyjV7YNfKG/93F9ny9c/rM4qj87SsJ7aB3PqNW7phMIvEoqCIh23ivOr+RduWzMURa4LKLQw3cx9ckpHFNt4wq8T59UbsGnUq11cyBgv7OYmaec/LvYCuqmFGHhIFVs+4xZ5+OyFBUezPf+TTGvetFigQDf0eIuQURI4QgX8+zSBwZfD1hwmV4jY99OHnatmLB7t554rxRFaqHxKucvk5hSW79Jyiq81Boyg2pk3ctEjS7jAWx8wswxneoNHQw8cLBD2V5rg/z+QH8CE1mBGrGGpJpBgK4vJQr/GUSU2jFFEm3akSATJRra1n78sRbV3v5LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:14 +0000
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
Subject: [PATCH v10 14/28] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Fri, 10 Apr 2026 19:49:39 -0700
Message-ID: <20260411024953.473149-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: c9690884-6942-4c9c-919a-08de97750e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mJBkEPg1rx4jMDR+Jf5j7X+542BoSWLRA8SSDq/HgcnpbASQYwPR9BWQQxzciH9l1/9ydoe8+AqAHjdnVEANHfuxWYV6uyu20xiRm/ZU4OTdj8Yx+5mVg35yrA12lGqsPBby49AFA8K9Gghco5JBfKZ3SLiFqgaQo2oEGRtzxCkyy0L8F1l3u+m268zAhWvV030yXYKYBL6m6oQHYnTXvPXk7E9pVrJAa4vZ34TYi7bfk1tVtpG8d07Pl5MoKznT//qdZj3+lVGQz1SHJwColVi8qhqjMVOhcbA5v97aZOnlNlNdJlkGDW7Tg/Wflke2ROxeNVPRJB8Dse5vFlG+EglgSL7Wm/6XZdqNXh/kVlXtZctF/jQzA2YUnYFDYNVCCdqP35VwllXwiuo3EyoMU9yaRePI2QeZt9e8AHqRazDmcEYoOflHe38tM3KcTpnS95pLQHbuRAiEErh3l2b6xjhEGTc6/xN9VJ5Fk3cq78hP4N1wA0uMquGg3LJj3d2/v8Zkw7sa1Rl8GviN9D3SGBi5fWw0isx+0EEXobcpfUAtEeUxD0/rtk6+uWUp7SeByXWcZ3wrLTC4p7xljn2xAHPRXH2DzGIqzhs7W2q5KnVCviJ+evdCw/pHhdfQYIgid3uVJMwIzwSHrcxvc1dKVjyeDQOULyietVikjA8cKJ7eZBiqmqHJUOvTBPTvNrtPwTHrGzn43FZ6qqbINHo2H9YlKIPQmpSsVwlEAbGP3d0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2TmhSUyguUGCZzd99xvVdhFpPUq1J/qwwZmbYcgVHBo+MgBYAns6Qd9uCPCF?=
 =?us-ascii?Q?VhiJhVR25zdU3YtAd18184BNQArMQmB8ZU59qFaaTnMBfxxv3nbv64CUzt35?=
 =?us-ascii?Q?ObqSOKQn7K0TM09D3R65CvtJfDjxI1pJXWBp+XEQo5RFb1Pgl9534MzYaRXY?=
 =?us-ascii?Q?csw0v4YN4TWOQ07SbUDKVi0+2D8UobeJkd/8HzFaEjoqNrkrpmMITheR2ETA?=
 =?us-ascii?Q?Tb6lIRAIm2Nj0IeZuy6SC/E6UrHPzxCmznGOHi2zy5/lIyjqsPNoaLL5NuKr?=
 =?us-ascii?Q?xsgmrdtRb3IYH7W59giM00VQJEBtpx0Ik+7V0lWLP/D9k/urFg92RSvukNYN?=
 =?us-ascii?Q?QlPheMA+nA+rCRrA0vUms6H79WvEqNVJ/Cs1dLgvmHa0zt+Otwgj0lSUIOC1?=
 =?us-ascii?Q?H813IZBVUTw+iljWa4FNguoGDlUJwZ78tkNzwsH6uklCds35bmh2me/CJrZF?=
 =?us-ascii?Q?60o8okY0zbtVEtnqbA3xv5HNzEG13IITO65Jtj2TzhlkOvINE7/ZhV7+2H8V?=
 =?us-ascii?Q?ocLKBTXPH9ytLiOHwmTkEJ6Q4mVA/elJhClCki8ygduU2HaYo3XlnjrVhgZ+?=
 =?us-ascii?Q?hYNaA2/PXNd6r5BBtAPEcxsBi3Vd2LyAWIroibk0ozUdA1/DL1SxHAetuMWG?=
 =?us-ascii?Q?aUWH0S7jW5WmFRi4EkpVe2RiK8Qi20mFOOqPvllPFNAEJTUt/5wmc1b/8uu4?=
 =?us-ascii?Q?AdioO5C7sv2qESmrTA0RT7xcN19/dO43yNhwGyuBCpiJTmzneyWJUZeJK5Kp?=
 =?us-ascii?Q?L8LhJKvu2mg9s4I0tWmbaAKYgsdQRM3nMYqOnAV+dx11/DmSIvrCWakljxrg?=
 =?us-ascii?Q?zYCJEVvxyS9qXHM2Rw63hVmksFQuHf4xH9ooUM9mj8Bmsuq0vaaB3VllbLAe?=
 =?us-ascii?Q?/WUWXn99tx9ldeIXPoGv4CqU3127m/uGe10VYCAwRlE0JYXmzN3NVzus/fRi?=
 =?us-ascii?Q?ATthNtaDMv6Z73fZzWPt/gPCEqVWW17z0FofGuQnloXdv1hkN5mTRhPGKKN0?=
 =?us-ascii?Q?e3u3uoUA/C9ZcT7CehzVBUA82/3WTO3uu+4NbHd2+PnHf4GggZJqhhgupI8E?=
 =?us-ascii?Q?de9KubdNb+unhury3VllonHfUw3h1ggDfymIz8kb1arLWMMDlxl2vNKP14QN?=
 =?us-ascii?Q?pS3C98d0HoWLEba5sTxEt9c4EkV/+XD2Uo13a2PKoE1j+DI9OvpIWb9CX0Yv?=
 =?us-ascii?Q?7IgGr49KoXrB2q1FkfJCvO1uElr0hsFmNbaWt5n7hRVouR34Pee8LwBOIOa1?=
 =?us-ascii?Q?IsGBypwzDKuhYT+/LeiYahkr44ZpoOAJOcSeMNKGF+jFPMOGeRRDLOtSCL0r?=
 =?us-ascii?Q?c8tJzTrtRYgc5zWJEXWhrTGMpF2hZNlqIM/B1F/ucMC7mQCJpXGqSsIu91Pv?=
 =?us-ascii?Q?CsqNZVWDXgG4QfjCtqsbCgHaQX/tsVTwyDVzTaImmKj0GFjr0QNK4flM3crv?=
 =?us-ascii?Q?1D1Gxi66E9rCDOHMsCbowsOiyAQgYxeuyhF9cyLxbTnJNKh8zBSVg/vAvBxs?=
 =?us-ascii?Q?sdJa29Ji4XcAjgNzGUkfxdTmqbJ8Bwf1Ygxl/BOn2q3RYkaozmdK7D/VJgjs?=
 =?us-ascii?Q?kpDj1fNGG03BC1/NAgiJfhYwyAXTLsZeyVK4uGtfOoOxyzIRQK5Bypz3pydj?=
 =?us-ascii?Q?bENbFq21pmj6zQki6NPT3FESIpwdUpqGGNNYJeCU6S7aBJZGECzOVERqjewL?=
 =?us-ascii?Q?gDYgoMxzCGf/DLecbtH3GpBPhst6FblrSlxvuCY78kQd6rCWQOSdEEZT3+sD?=
 =?us-ascii?Q?IrH/hDEyPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9690884-6942-4c9c-919a-08de97750e5a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:14.2371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YcL8Ernst/tMdOHrffXI+wYcpxh2ON13L2jPzEZ02l6MO2Rz7awraDUAxm8H/WcvDi3lL7RAdPPLyV7FsA5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

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
index 617ec2aaa93a..98ef618e1eff 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -89,7 +89,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -149,7 +149,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset);
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| Coherent::from_slice(dev, data, GFP_KERNEL))?
                 },
-- 
2.53.0


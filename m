Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6F30FC27;
	Thu, 26 Mar 2026 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489180; cv=fail; b=llMeB23txNRTSV0iTawGqn7li6lUilcV1MPx/YEt5uZM7gpBQZg29yNB+CG3GtEiP/V3f1gCi4aStJkXgdVkPBurgveLFxqmLvgGJ+afmlqFHEzzP00ptldOV87RZl7l7+i3TD17mYQgKDmbLdcbchFUbcv3J+vYLJyCrF7r6yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489180; c=relaxed/simple;
	bh=GHSqyoILEVjgg7U2/d1aUGHY2Ni2NbEOqzVaP5tWxHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tR68YU3DT7ZS3Xc1Y6MsyqDXjOK91zP/TLKnVbmrdRBMcH0XndFO31UcRNI5QwrwNstcGY6J+KH0s6mDN1zyuN6fnMZg0y/ScAHYhOnTM/ReCAqNJaeFZTrFTMTRem1m5YAKiSsQ+qR089Ik9ZyLXnKmnOKXhd5IKCKdsenS8z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MCCC6t06; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MCCC6t06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLmGmQRHi13wYTqOMOQh55lg5m5gB1CWkZFfv6T2XEHNI+dHaa1srlqctmy0yVrtro4dI0OmSaEyEdpdWVFz0r7BdgRG0KUAnn0HFhO/A5CgFtY12vjcrfN0l+wp9KNLpjKjS5IPSwqa1hVkMTgDaKlB4+9U/2jkHC63b8pv18hgncoyCNx8/whZb6nwOUkJ+Ve6/tqriXe0JpmBZYrimSJO9t9hV/+8SAmiv7A+MsgVWxD5HUNPTUsnDeS73a9Q5Y8Jyi71NzU/3kwUd7YJKdFgxya7gy4cww9AJLuB4oRzwZUQDOm2r3Y/z4fxoTNYgn8sECbiDlKRaD8fxhc5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAoPhflvmzxDL8nHd/zIsNGi15xP1EI4BnOP/N95Vuk=;
 b=hscElHE6CNzEassXte788IkV9nM9s925snM1W6wIRbBWNIF1tUYu+jwIkj2ehGfnI4uccMUQz37d+qULDwr4SeiDCjHAxh/wvAEvTzkS/OrlkbMOgi76F2RJINGWNxYP42/6ihL3sS04W8u+VTpPaoqW4qFiNGTnkEo3Hl1pJCIGaEFtbwcD0y49EPrygFu+ixrAWpL+GptuRFW6Pwu7xARWcCTIVGDIDaQjtesFxKyqDslFarc1cvbwaVdHYpRO/kKWTX6rRupeHul96kgJxl0caWpOzHksTDihMVtfehLy32Rnbzk4vrembEfK4RJth3GnKW+4fInWGSxTTg2ivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAoPhflvmzxDL8nHd/zIsNGi15xP1EI4BnOP/N95Vuk=;
 b=MCCC6t06Q53UxxukKFQR5ZYZoI3pvujFXm/4eOd+aLiL7H2ZBHL1U1WjYM37rNDy26Bie05kLdMTc9i63K96xEvs1Z+w3SJVW8YzTp255ErHsKtmNkiE5X4R4bL+t9G6+hO1Qa0Ydo8aRdSnDm4kdXG+M6YFXCcFoLx00eV7UwzsKDji5oFu4WBjQqb5AwMhdjAExzwByeslHSeez1zxzARoBzj2KPUZEycHaQfTOw59gpG7cq0j/h3DXcs3tWgqgfC5ZhoYE8FrcenT0AUr5RobXE0lvI/FFYZY0hJHKtvlr/+yqrTEG1zJThEXRIxCnvhgTGrICO1kCYiC5YXAXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:23 +0000
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
Subject: [PATCH v9 11/31] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Wed, 25 Mar 2026 18:38:42 -0700
Message-ID: <20260326013902.588242-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc03499-a745-4b47-9a96-08de8ad88173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R96deByRJsij4IPiqfQpRhkBPYH8ytjBx298stNZ0q4e+TnFXdqlivHRqK6YEdj2HAlwjhRdVeUClMaO94C8x1Ndmzf2P3Dtc604Jjz78AxXEcJCKl2nFh8Q2uvaaYDkrqRxO9SIHOtDAk4ODRUuuaK1QzLLm57qABQU2CDKSg+8GfTVvXjODrGK+HrhnmOBVPm03jnA2fNbeBMv53aI2h1ZeXuf9ANHTuv0+pkMYBsJhu1VDehWoSyabunOuDJqoOx0chU4SylkC6grW3cxGqD2v4dUjt8Krv1ifxb8+t40UUJGoz++7Y9m8tonp6qiCRaaGSao8Pgk+kBMVw5A0W2KhPYPSLbY9qZgiv8MbAcoDVqmxQdbjvB1nzMwlO5u6G88vofuaEWiOjeMF3Xm4w07Hdf7PLD5Qrj5WNix+Sb6zUO7aRjY7nxDDZcfeaWNAy67IhTmO16B74M/wJgxHKapmPXgQ07YUyuayIFcfzbTZs1L7FPG4rF7WQPjyFuxWEA4AXdVEXt+qoe53lRLLH0ZSD/SG2Yg4520P6RhUDtEV3GDJp7pVteE7zDD1A45IKX3oizUaaeOAcCvBLDz+w8cnF/75Mplu5ewWFn/6NzduXJpshCUcbwSJ1lUzgv66/otChv23hEc4tfX8g2HrauTut8Gf+LDlcU1YhSoqqRuRa65wtrqJk1kQhkIOp67kAdEZn36LW504y313vklqJZy6e2tW8goCA+zd9598k8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aMdiH7b22lBdoM9jxzVhjRSimfu/LH0FLlV3vRSYYLXgDeG0Bf5i1mk522Lb?=
 =?us-ascii?Q?p7mFj8TmtjIW0gIIXFK3+cxiVobu+WJREWkjdGO+cntVzsKKB7YkFbA9+JmI?=
 =?us-ascii?Q?d5wwX8+dea08lp2jTlS+QlZ/QaJW1CcM9D0WVjm9dVcCdNHpO5ulPjFw/K/+?=
 =?us-ascii?Q?x1Fj69Aog5J9O6Li/dgJLTRWGY0ernuDUKjKsfZL7qQcrTRPJoBga7UWKPtr?=
 =?us-ascii?Q?JiyAAYaO1Bgp/zjZgOLaGsI/B1pI7n4YO5+AcGITq+G6fSQF2aW2lZ6SmcZP?=
 =?us-ascii?Q?mcA1u8h2IdExQyFkA7SfOhJzMuhOZ4Z8d06FX5gE0tbSpVS5LLpfmuzmjL/G?=
 =?us-ascii?Q?++mggyIT5p/40k0qYxELUIxvcC4O+vrEW6hurNHH9rZ1KDJ2oX9I+I/jw7on?=
 =?us-ascii?Q?bylTeNRLRz2mXXRWbKGlSQ0+W0y/dgpEPANFV6oZ+1+IL2kipzXVQgtlTink?=
 =?us-ascii?Q?fxAc5wTSr1CeNt4T8p0gFAlM+2lcx3m6BDNzZAoEgcfy+hj86zS3+eYczvSr?=
 =?us-ascii?Q?jGPhg36jRJOrFRvdMBWiOykoi7SHhZZ1ScVDCV1pDIQVyrFyt4Gnnii1r2nA?=
 =?us-ascii?Q?i4pR37MRt67hCBHVItemGAbqID9DgyEmpTkvi6UKHlUPDkAml4FhJF5recVC?=
 =?us-ascii?Q?Gjy2XVe/H1xb2HETgYoFC8MVohqMZvyaxwh/4oqyOvsnsiEVTvULYhgUoSZp?=
 =?us-ascii?Q?RE+vTC0PgAAGDdneJg1SJzCXOqSUa9O6VqG8qYbzw1yQIll5IvM414ZRHzXs?=
 =?us-ascii?Q?bPuJ855Y24mCjNNdrvFzOUclYG/5LODD7RutRgULsfQ7YpboPWyqZw4BUpjK?=
 =?us-ascii?Q?r+mIEBTQqSLa3eO7G0Bjn/6QDsm724eOWFRFfrF51f8kkuZRAo4m9CRsLMAT?=
 =?us-ascii?Q?Sr+lfUqLLnGqbD4NQ0TShTsSYlbOask3xFWzyw0osKZtTo4ue7EqGvd8lWPe?=
 =?us-ascii?Q?GEErNjMQE8oD1Nr7DV6AL39D58g7lB2+iutTniKyI1nTwPHJK4qppE2mE/UN?=
 =?us-ascii?Q?rROFn8Z9Zw5jLEG+5E+Vl4051CTtpO6/SI8WfjD6Sy3yE8WDigQDxALc/DIc?=
 =?us-ascii?Q?pJxpR2O3pFEqxIEWDBt0Hp2lYinuihX7PZ8JzUPvWutfJeQ2yFEGQYweDR4S?=
 =?us-ascii?Q?6Vz0TyiIyZ/6Jd8o1t3uzqwXUgVibrnY1LR7ih5aVtVobWqkTyTaXgbg5szh?=
 =?us-ascii?Q?fEC8bZs8s8Jv97U1whBFTjrSzMV0ZwB0uBM5AAbQHfAFLpP+47o0setG2Db3?=
 =?us-ascii?Q?sJi0/oCPtTFVjPvdW/Hc+jah2QQwcL6I6gfd27iZfn2iD37gffQy0CwzC4uJ?=
 =?us-ascii?Q?94WM2IrtRSCZVcyrctAXRp3K2GY4duST+tm86VdntofAVDHYxnaf0Mj+NEZe?=
 =?us-ascii?Q?0fWVims6KouubvnYjIY1GAnR0UJd9lTKvnxek9IuT2zmtXjXfOqlWMCpppl6?=
 =?us-ascii?Q?zyPvA4UoBpxj9DGgpiETBPC3c4lYebRr6UdqjQxR7xmFbaylnF6adob5vhMc?=
 =?us-ascii?Q?Cgu6cCwjItOfuEhxS5U4avcv+wI4+T8fGIYAwfdL+pPSCOLm833qBLQTs/Pi?=
 =?us-ascii?Q?KOZPJbMboLvgTbzIG9wfr8ljc5cSp2Me+TktKqhl/IeFDbig2h9J3Uh3uW+W?=
 =?us-ascii?Q?Pe2JILDDsp4s8kOPFsL4gAzGauYwbnAXIP5jC55xPFwm1b6VPsHkBypthYkB?=
 =?us-ascii?Q?4mf7HHgrVP5NlLHhMUzPPahuogy3v/w82RSyoBFuqa1f9ULRDIs/gW4eON3y?=
 =?us-ascii?Q?XBRZYjvH3Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc03499-a745-4b47-9a96-08de8ad88173
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:22.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1dUy/2gWWP0YKp8FsHxXawe1UJKE8vYHoUcUaVJtomRVhxHfSeoMp+VIojwjxHXNsLWRH0XkGzTMSfTygY+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

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
index 2dacda3c25a0..6eb6794c4945 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -91,7 +91,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -148,7 +148,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset);
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0


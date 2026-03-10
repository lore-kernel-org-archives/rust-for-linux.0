Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32B434D392;
	Tue, 10 Mar 2026 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108715; cv=fail; b=UJB09nnhj7nF3PEvN1APyyD/tQXSJZ40I2EkXs6j9bkSosUg6n8EssQswjyLPd43eAg92YGB/5n+PgatiOcg+4R4sEzLdG4j5gxHmlUrgFxDYv7Vx1oyLyAskfM5PpL7eAvmi7HyvJ0QcBIfiMjYBADrJj3tCdEs9ppoEW4zJLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108715; c=relaxed/simple;
	bh=S51ik1zsTeJBA8HQZ3myfSJdx1FH5obhkelDPySCeeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n+6GvguS3ss0dlkuDr0By0kb6VGrXykZoiVEokHd0PMubeHtF1RyIGxKiv2UaeX5IF9fKY3PC+lOZG5i7CDszRCbKTInKJAngM87PBOF5YvjUXRKGPbTXM4Ne8iSPMGZCWzsjvyqywzrTfu58yQzB8vUjSslcuDuiOLWhqpxqNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tEoL8qTc; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tEoL8qTc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idu1EenjhoUm97qkcllAE0Ij0F6PX2HNln/Tkvyet4Y7Ek1p8/wIiaOeSLYV/6jiqntK5ksEnfzUgRNqEO8sxr6frYdmYbp8CUfWDvu6tAmQIczFAfG2KbbWqRB7HuRwEnXfJf0mvfsJTNE3vtmX21ll2gr3dEFpI1j8SGsWX7jixtJoJ15dvXFYGbF3hsQXRCJ9I9nhcszcT0ME0EOo+YkevHOGGKV/EYXG55fCYyzyAZTSItk/YRx4aEyRSBchWgwuUU5IOjhnR9PQEw9Wgzl0GR4m0ZRPdMAnhq1/e88I8pZ48lH/BrkurY5xmTfmNOAZaYxeVRGeDTWZc+i9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JBaNnhZzH2/qgeSCcIbQFmnIOCN0b/3B+r+Qstlq34=;
 b=uwJrsnzrWOT4G+jQeVRetiYBERX3bD74BUtdWKg25V6ygrWgLPeuOvi+f1OYCOONmRSjPZ7faQmwAa3pc/q+b6FYiTYdwQ3Cckm0zYHRJZSO/cFfU62AcFT3r4GvNPj8vs4/oNte3xx/8rPtEJum1qDCKadHbjS7Jbu4Eit/ZhSyZ3rClIiRCO3AdASlAPnvymWCa/j0LVkv8GQ0CLFBdkgMdLVlufO7YgEb5Th4nWUDK//aF/VC86OZ1dZMmzp5D3gIMBlw1NzGs9PHNaiq9fe1b8LA/TlKZje1zlLoyBsLmcq5Xa2Zq5OtFfA60lOy4cGbjSzRBWX2xys8Igs5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JBaNnhZzH2/qgeSCcIbQFmnIOCN0b/3B+r+Qstlq34=;
 b=tEoL8qTc2bDVjuFA6vIsdGXPsBh5+1AAYFdLHZQHKtzi4JdnhqcpRUEMx23ryZ3SBH9o3DkSZgEv+/SSjygJJNZbyK3fi3HjJaFE+AGFmBvWgQ2OVnA8+VR1Vc5sp/ZhN8b4rtUECqPr4xmUINjSVRWYbLl/8Wi0ryFA+EAWIGVD43waaBYznU8EgcXpMjRJCy+zYKtFhq8SeqToguOIf0POJlrdqEWZvORQCbbsZmkPHxqkLjE5Gz3a9Bt50KF1S1TzRbnjzoG2WubOR5GZu2bRNKBm3bbcZ4sAJ34Sd9NQPW2qk6avZMlJLFfKrZF3A3hjTq4ZdlwB4KL3GxhZIg==
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
Subject: [PATCH v6 10/34] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Mon,  9 Mar 2026 19:11:00 -0700
Message-ID: <20260310021125.117855-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbce201-33a6-40e5-864f-08de7e4a5ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	QOpFW7KKyh1qH8tGopB+1R/IK5MqL9McpETVWuHt1YgBkm69uUD9JZ5mpEoW5Vp5BV37f9z62dke8+0bAh0jY/391JoWTXo92mO00ciY2TunmmwsX6eAJw5nalr9H3+8PU7KfULIfZpa1xmcr5R2ih+qP9VftoFuMe9LtGXvpnDw0e8D92o83sB+kAVqoXGr+sSqhGgHhfu0XB2fLobM9LMRY5AEtJs4WYmODHnjiEDW7kyTCoICg2EPYFwGH6YcgPr+htEhuO0FhfPzZ7q18vo6qLp60HSSVspSQuorz2l5uDRxZbnl4XgUXhlgxIXkyON1Dfu41ubVwAphwlFY6ZUdKtXsKGqORb1yoYuMWtrXrD0qwuxSFYVK9MvU/cNlZAVVdCXlOCkiHxupnk0rDSiegpUGKegHWlmaVGyih/cOuyfG7zwCIDyE4r68egLcrap7MgWlD1Y065EfeZqx1RZjXjdinuZ0BNF0InwKqH1KHrDqBRYcA9d8rKnzgVSrlFQGJLl0OHZWHadyvEmbthPItUWpwAJ2NMi2vRLoEz4XDo1twdxYcmBBENrBLY/4I9T4y2kAU4KfjFsqiniv+u1p2KLh/OFA+BOLMiXiADMWad8U+PNa3dfJxdmyE1tCDX/NfPsxFSYlVLwsWOwmHoIbluCANta7wHh07ue7ezF6UrYz9dIRcM2RxFeX6PLgRXLM7EtbjWHa0xEfkG3clzEvBy1d76WQfsxly/QdPek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uF/PS/sTwYO/vxtJ8/cgot/PeQMgipjOmzoKf1B8wkig3N65+LxGM+2u7/y0?=
 =?us-ascii?Q?RZ+AMuwcztnsWm0WO8UXpjM+0WnaL33ZZPBZXlh5WMZnbXaiTE3NpsIh0Ttu?=
 =?us-ascii?Q?9Y1VSry5QQ7lbJ+MISL9y71kfSijMF8Aabu9nVUTIfgpug/pppXR6O1YQOjI?=
 =?us-ascii?Q?TSOT+6EqkBrEQnP3n4U7nnaWdr8Q8QtScr9VthAP9Qy/21zbBqyOeVt2SWF6?=
 =?us-ascii?Q?B/UFTa5xCYCrLOkAeaH47FlUNROZxHYPnBjCGoxSE49y8isSSFfzfvUfyKZ+?=
 =?us-ascii?Q?jZhNht/+o7K3S7Rq5RDujgWvPSY+aWj83MqdVxS3myWqL5VtxzqcO3N9sfPs?=
 =?us-ascii?Q?7lSNoQPgUxNWHR2AXtT+FfKW8IG+Lwj/R+RvFV6ZxG59CcmeEHj7UEQTkD1o?=
 =?us-ascii?Q?WKawSiK3RVI29YGoD+20qQK0subsDWOKUhch7RC/5QrJebKq+MLdARaUwDJL?=
 =?us-ascii?Q?cY+fvCipreDqzVjdO0Ir4QA/riRWnbBA+JnqN+d7VWD8xxf0uju8peYUM9jr?=
 =?us-ascii?Q?akBVQskuk9jGamHsdss2B6J+TIJK9MQ/d6mcczMc7Vq7vgVivOKt5KsbIj4m?=
 =?us-ascii?Q?/RkDxUUGbCO6lzKQdddxuupTzf/fqERgB8kLdYEMeWZW200Fn8BATGrizN0M?=
 =?us-ascii?Q?z8BQP59ImKtPrhkdD3CMlkUv53+kzvFy/2XE02Di95eypI+bNoxN+HLFnVTI?=
 =?us-ascii?Q?u/uVrPwFpi4SUOsCrObZ83ltnTOCH1VK2YF5xkrkgkuOzE9gsKfVb4ZrZZO7?=
 =?us-ascii?Q?FQOLvOkW1Y/b5gaIYaGIy+zRPr8OCoUXp3+4OxiAMZ9RiFq8LeShIJtMbWT8?=
 =?us-ascii?Q?/7cJmujVfvDA4Iomm7o+Zanj01lgRzY3WP2crc2fRp8R4/XKBnHxTrcsF/fz?=
 =?us-ascii?Q?Pr5lCMHQ93sOV3UB6VRN8lZ0D3Zh/M7Y9arsLZM6i5KCp4Bl0wA6fOmrKsN0?=
 =?us-ascii?Q?w7B54uX8n36Pyl/t5sW4X83LejfpsM+0NpQY3mxgyWA+YuWxrj+36NpNvACM?=
 =?us-ascii?Q?crui9i2wW4nduYx6tWjiFP6ExX5qI7Kf5VHvzsR/AHEloqA6x743uIr3xWvt?=
 =?us-ascii?Q?YKFRW++nGjM4z4aRamiUUkD4+d2/dmpZ3ofdFeZz1QQJnbK4bpgBSR1NGKlJ?=
 =?us-ascii?Q?q5wXmxvqk6OgL42w6ymvkUeoF3wfouN9mstr1XgngHK147Tp2Tg8/d9MOaXF?=
 =?us-ascii?Q?trz+rwc3xSv8+s7SjZzEXWDG0jUfky973WS136pRS+wAH1lnZ/ovYL2x/ITT?=
 =?us-ascii?Q?bKNcHkmg4rybIcm5INxl0G8YCseznPHd3TvoZEQviqEKOO/CdVwnvWFxThaM?=
 =?us-ascii?Q?UX8NoWuKM1qJXQvUnhQEVgrnHxFuWfn/BDba1O1xs45kPDEE2dXthTeXbCop?=
 =?us-ascii?Q?PZYSv6T31Ki0oQ8wD1VGv7nJ4v+FTusOWCVmzPvJ2x04HzvDErkKXY7t4jWG?=
 =?us-ascii?Q?D2jN7evmecm/aisItJN03q1hhUgRri8uMVzDH2kQ4KrYqG1srITavCp2I40M?=
 =?us-ascii?Q?5IlGPyElZ2ZHF7rTMbzWBz93UjoMuTQONYCqKoDHprfzw6ErzWq4/D4v0axb?=
 =?us-ascii?Q?OEsaU4cBpnXfQRoV93Yu87ShJEY07fCjUbywTeZZKPCpKJ3vPaCe2sNVLIiB?=
 =?us-ascii?Q?FCHMIIAoTmwKJrC7oF4jkrgpF+N3lCrfypv6ttpc2iECPJ5PYq9n+/1Qrzvf?=
 =?us-ascii?Q?jhVMdgH3rFPMZUxJJPduiB7SQG9qYAN+/2m/1QvXy2b6BRKq57Zr2eD2zLtr?=
 =?us-ascii?Q?ZcWbrI4oTg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbce201-33a6-40e5-864f-08de7e4a5ecf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:41.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48WXipdqTJoB862E8UscS7Oe3g8jmopgFm2jkgC3e9aDtIthhEJWuu3SGpMOcVbVxW4GLCfqdkCr4IFi7OfNUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
 2 files changed, 94 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2bb20081befd..177b8ede151c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -457,3 +457,91 @@ pub(crate) const fn create(
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
index 468f4b43574a..f247deb06633 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::mem::size_of_val;
+
 use kernel::{
     device,
     dma::{
@@ -16,7 +18,10 @@
 
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
@@ -25,92 +30,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use kernel::{
-        bindings,
-        prelude::*,
-        transmute::FromBytes, //
-    };
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
2.53.0


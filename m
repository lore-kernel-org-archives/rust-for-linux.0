Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651A7386547;
	Thu, 26 Mar 2026 01:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489178; cv=fail; b=n/Wz41cSFwvMSxsHylfi2dPDEH18Cur7zldgwksukAhTokMSAvNe55QvTdXc4SAYgGnt6D5YxizZ1K/BfGbm7BUw7t3Td6BeVl5uWYIip8dxC2si6902ENd02Kd9fbJaEuAFEjxnp/unWJPFzULGyhTsXhwWvdaR6oYYrzAXMgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489178; c=relaxed/simple;
	bh=j9HYYPamnsBLHV+bWvvpjIygUSQvYGIR1xEZXRPIHug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/81BKC744R2xomHt3m5Ql9hRi2BobjBKKYko75gyYZcMZEl33w3HA9xvWF9a/oQUMqUwaZr+7KBwxP+77drtH/wHAly384n3eCTPUMzltATCyleeA5m1lEa1FW2tuzGz0AQXFzLFIXPgLw5U2yxrU5PdpYKLTQruki1Rc7p70w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sccjEhgh; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sccjEhgh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICuJs3Krvh/NJaCmMPb+MowoAAQmGy6W/RqvikUeHJmi0XoK+j0/Ctg8tmNH5zYfBgrN1pWjEZ54cSTBYpyltmaE/IqWu6jb18qSDOxYemVE+yrXqRg90KKpTfFRcptRlLfkpCkR1S/Zlc5BHwJxFpaDLUtvTOLTrXoKGX266OF97OQkGpi8JfBMzS240KAedt8h1yCbvdllVMEfpCiDnbUUvqGY2WULQ3S7T0Xld1lDevxUhpfoeqeFFyFOhbCbjdWpr5x0VZLHC3gvQjZUmShFiPZWgpbho46Mhh8HSSX6a5bINed+yh/LZ3RuR1BXen01I0K/rEB9RABp1uGafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=RSyb49ptfkBcRcfccK7wV89s8gC93o2WUA42hL7C6p8A6dgdIc7FfiH18tog3Q2wqiFHg3/2ck7fC1KIGdkldZGQzCk9u/v9XT97wbNraMkqqfWQZ42C/5WNhrOyy0MhtSrD/MavnWea2IsmfpjrYiigROWVN7D/dXVx1HOgf4FfP96LqR1f49U4PsKjTN/hqAoSAuo72j67taRN1cm/rIyjqMv/8kGSSLpo/glDxZ9dtQAplUqTaLZ/3E3TH0KU9c0apdR8AEYOdpMDDFPTGLGYFj827ONPQfg3TNdKs0S8CzHDIYcxF5pT5NDhEmmXmNraCYFymfGaHhsbnxoXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=sccjEhghuIlekMhLz59ubXiAUR3AEf5BzuzGCbRSRVkwE3w/QOYF1vOwYWt1qcUBuCYL/uNDiqSVPhmwj/Kj0+IvzsmNw0MWCvM7XawqgcflMxHwppgxcLILtkkuYtVzf14D8DhMjAY3o5Oj6IeUe0J0XkJvTYyL6SvJkNR+75cx0p0DnmAkInzEUVTqg/nPT9A75rfZcHu5Hd2DAGBLfFZnVYncKx6q8QkHEsAVSf5BdGPutx3TsLYoRwEtqQVdgrsXpEo3Gf3GhbeKzqtHa4M+vSw2cpn6GvfN+zSKyLMgyKRVuNpni4N9ErKD2SUdRsH4tg72RzCRgtw/0jiQmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:18 +0000
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
Subject: [PATCH v9 08/31] gpu: nova-core: factor out an elf_str() function
Date: Wed, 25 Mar 2026 18:38:39 -0700
Message-ID: <20260326013902.588242-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 824629d5-6343-4b10-c95e-08de8ad87f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4eOM7B7wQIzlTkGRKwJjq+oGhkaPdPqwBqqb42vH11jVFfD6IvejkNsG+FtncOy6rYCmUNLiTpVz2mbSiNwk3xy6NGsMk1MYTI61yxsz+BKH6mVPglY+TtvW568sEJOmEf4sWeQk206IQ1Dz+c54vUBL7/lscEe2HBGhD1uINw9TrHQkTGSJeXMU1TcuV18AhB4Kp07QALOMelEOeJQOtmp+d9tRYaOrPpedwWvYeU0Ihk6ZWQUz6KFTaYZSczPPOffOjYixSepz/mb/qPUYPbsjADZwaRRtKsffb1HS0OTabfY3jr9pQ596DpRqnHW1uivIvenqoxFYYQW+dDtHJIViFXhaR2DvXJdU0PL8oS1uitWX52GVmzQHnR6lACl3tuJVn1NesxOh4617eneWQrqH2ZVXST8q417l+H3fLYb2wTjuDdW/l1/eEfaiJVM9n4to9oGs+tPm1xdpB9jnAP/JdChLXcqD9FdReg0O3WE8i3J25MvZIbEWNvHWaG2+Wzpc3NoTL5eEtU1PnRYmNbVsPmr1GjyuFQVu8kOr0LpvsCfeCbueT/V4oec+QZUnL9lyUBQyyMyyyl3dNbXeiBdc8r3Ff+64iRX8y0ZyMD2qQYfmZY2SkOqm72fbLBITUVoBs+KOcNg/JM8W40M8e7ZSFwnutAsLTsGXI2gac/sIBiwec5WBm/C7d2qyBfvBGlOFRAhz7UmG/NsPPl49zLB4Y1sIH7gIROl9kHc0nr4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9HeS8dNZWMvs+GsggsjGRjqoRXyxESrrYB4/3Ddxg/jdG7TqvNBrT92+Tc+a?=
 =?us-ascii?Q?zsA5zQg3VcGj9uBKeHQ8c09oZoJp3lwjJKgSl3EUap77Hoz8V8FT40HyePB5?=
 =?us-ascii?Q?E4IyHgckHMQ329gmh/Tvv/Wz6gnpMdKvwaCsT+GrxnxxJQk6+4Y+s7LBrXqd?=
 =?us-ascii?Q?A0Di2mCqYCcy2uSQjtCJTvSqlp4MlJIEczK/ZmQM4gEnsZdaIAgTGdFR2kl5?=
 =?us-ascii?Q?WnB+IyICFXfDSYAF7u6gbFU7oeqVw5zJi+GJnRQqRKE/0w+Ewc2JPMx+UlRo?=
 =?us-ascii?Q?GnVb8p/BZJUzVwKr/yWg1r6J+jCbgdXZUDWl2ohRUcBeAKzW0cqzhiHcC/ok?=
 =?us-ascii?Q?yMv+YdCAMtViya04SpN/pN6frrbjH16RcGHSmC9dULWKVr3VLyo2Zy399mmw?=
 =?us-ascii?Q?kaLBYnp6CLjp4nnfsiNUSnEBDC8qcIWq12AKEdU0he1O9jI6Xn5gGwqOVzdy?=
 =?us-ascii?Q?WGVhrH13kf5aOpnRZKW8QFU4Wwtiq2EhjErPMQHStCPGqmq8G3bYgTsI8Tqz?=
 =?us-ascii?Q?BWIydGrbwNU78O29b/RGhRlKGTidXQLoZ4krYQfjAcmEZ0DMiDSyaAf6xL5G?=
 =?us-ascii?Q?7fyQQJPFy+Go9lmkQHjN00rML5LySrxP+BAPg6jpDKCfahhdtkAn9Xv4EDDi?=
 =?us-ascii?Q?qph3LODVmSnoBjSth3lnxqJZqj9crBkFfZkjGsnGKSACdnOwD78OzIKoAjaP?=
 =?us-ascii?Q?5gQ6hYPm4w/FjVQeerMBUDI0ewwJNHCBgXQSs/PpexvYfJgAOJ7jq/GEi+wF?=
 =?us-ascii?Q?gq5gDJhrkPSeCBX9RVlayQEr4hxvzfEZ1pvlT3D5UHZgvPdw69gkVG1shsbF?=
 =?us-ascii?Q?Byir071IkMPsvFX5FdywhGN9EnfPMoSI5HzsCeRqLYsAmeyz6Xj7M94o/cmb?=
 =?us-ascii?Q?8z3eOW1lwJRX6enTKADB89oR5ljk0bAhfDXU2zbtJvCLVxD+V6epfVbahzeG?=
 =?us-ascii?Q?bpN7XOZrOHZ2paAvXbhMqbLphcVGwXNkk4a3d3gyzu2QqIt+RArORnxmfxJD?=
 =?us-ascii?Q?iEJzGpVQEYeRRVERaZ/Me4yHNkv5SCQzunk8pistn0dT/iu7TQQo6LnLnLgW?=
 =?us-ascii?Q?pEDSIb/MMnRIL9bozJhtts73vE/f+6rhbOpaLlYCATuyX+SloIUEoKxr9E6L?=
 =?us-ascii?Q?cIVGBdo+0GZDNj7UeEok0WtO8w11CduqQLX72+8WTB2FFfg3GFYjYhj7RYpk?=
 =?us-ascii?Q?7IY/lS2CjsXUT65yFS3u2MzWK1WRj/VNeIdqXBFI9OzaDOZBxerlsrPaJuDK?=
 =?us-ascii?Q?vHTtP3tuiIiLBD1cQn55Lt1z35mZnx0kv+YYXQU0mp4rfiRUGIf1Rrc/Fmj0?=
 =?us-ascii?Q?r4Hpj4BePeSFzamRX3FPQ421v0ZnKL7ZjlUAEpWp3X/7WQEPFYvcCy6Au22m?=
 =?us-ascii?Q?n55GNsYWoSwX2IRIOQ2MfBV9mFCCrTxG7vy/F8s1lEiyQEUHFWh0/9gJ3wUJ?=
 =?us-ascii?Q?URrAv2Qz/vbSbwzz6e3B06HmChS6F1MMBwHqaQZMQij79m9I5mMijpWctX4Y?=
 =?us-ascii?Q?K2ZTQ/NaMGrzo/Sl1FrFqgT0EtAh5cxQVXW2PoCrjahJW8kKX3UNI85aOOGK?=
 =?us-ascii?Q?Txu78VKcn+KyyuoXy61QR5mRS5uUh2wTE3ESx7hV/7EcpOKcaNR8LVa2l9Yb?=
 =?us-ascii?Q?u0sYaO8LDqiDwMooZ6lBMJGU0gpu1qhyuA2FvUXf8oDM0+HcwIcCPQ4Cwycm?=
 =?us-ascii?Q?d9XsgLOsZv3i6wgfHlLuD5XFQns8/1eOZ2fTv5ck8QToMACdlwUDzImD5HJm?=
 =?us-ascii?Q?xOH+w/rb6A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824629d5-6343-4b10-c95e-08de8ad87f2f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:18.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpH/ZrIbOgdza28nFRvxUwv2A/1pmhrDInQQhTg/eqQYkB0rZvHly6ECGj/1iEfjXGp2oLtvVbVMV0S9MwjPbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 177b8ede151c..6c2ab69cb605 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -484,6 +484,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -510,32 +517,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
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
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.53.0


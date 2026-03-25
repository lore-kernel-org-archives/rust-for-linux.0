Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E102F5A29;
	Wed, 25 Mar 2026 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410802; cv=fail; b=gHaiPPhsCe8fjMsB8jcT/l2Op9XxOdEx7xFAcL1vqjO5eg8kIWXpfPGWE31C7I78aVi/1NrSeKr09BGoGZp+RniQVwzwyCI1yN+/WpO16qmyV+fu6MW4qlcaH1B1XvxDw39eANMrLVnXN8eD/DXFPV2QUKmxKYIckabrhsNaYKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410802; c=relaxed/simple;
	bh=j9HYYPamnsBLHV+bWvvpjIygUSQvYGIR1xEZXRPIHug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T9zE2587zuC6JDZ39qeINYKjanKhzkPObZ+w+6/JcVKHP1Bnnf3ILHaevZECP3F4Es2RNNvyOPNYN+Byj1EJHd1PbbJ1koQpCDzakeNujEjbMa0sXg9g06m2Z+H+MYGFMU4A8++03S1SM6qdyjOtLMaefhrPfwHeYPB4FQI3aZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H2RUeXhe; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2RUeXhe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTKeuOcLFKTkQ9LINHd5wM4TgsQ7iLdOq0Hh2CQ2r5Bgg/EGZOhB4louOTj3JnsFMpyRYats/lzNFi66Jy6En63GBLFrjY8uMrqwhTJFtEbJAKewfYfNqfMsZ2/GTTH7VRtdifLYwn13lUSf+fAYfL2yPf3bbAR2gFwHSFJa4ndHaIAUQAOxAZ0C/2NDs+kmL/SdRkt+UP/EV45WXfmpT+F0EoKSzaeHpCXmnIQaoWuEfaB6zwGbGWgbsKM02dI5Z/VAEZ52L7dKC+7JH8gaMelBdUI/00KSjiRultNNPALkqz9RVYnReTRoP1j1ixzcAiZ9WVqC0UhdB5Uuk/TsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=SN8jGt6Kw3Gqs5xIlFb95zarOEphUXvrAZa5MmF4FeAO0/Rm4PGE5hWPhuAycBZyBjVJ3j3xznXIiP1SsGtguV9iGddJGZKmxBVX7yTiApOYz7vDUm9HzA8fo2y/0H3gHUhDEi99gGH9l6H6vbRmIGhKQQjeCC7VzsBIJnnwx+NH6q4uO8H2PD1QfU5U3EYremJqHgJ15c5ad8xVUrU/yOceQ87UIO47RSYm5BuKNkhCqNJ07PucporH3UVuJQGXcn80uyD++unyqWDbkX4c5vgBv6taSIcxBQtyImtBsHinwzuweyM4NkR3dtJ5xzZCO+vxA0fF5kejCovOLC/YQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqzMViUbcH4b1K0VFivK4pFi1Acp6jmWlFgRt9vyxjU=;
 b=H2RUeXhep9i++JWZ5n/Z0EnZmcGbTk6Q1zreXe/J6jJcqTsVlgCxSf/Lmsr2aRuPyL/NQPuaAY1RdPlpK+jZNbMmNZKz+nUj4ymoX62VWpZ5pX3/83Www3/9Y8NdNnTZMcXsvgMQs6VIiP4asHR0F9Q5j0s3R68vl+sDqo61rvTYMLMAir0qTMlg/Qw+9mvAI+cEBI1rseWYmD8PCgX1nSMt6Lx81EsLzcz8ylN2K9ISe4cBN+qJ6ptQJ2a17Xz2jprVaQ7Bru379cmE9GmUD98DY9aFgfTVuIGwwn1CGLa+wzhd6oEEXrcw7yuDHqMcA6W7x9TMl9QKYKAh8qt5/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:54 +0000
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
Subject: [PATCH v8 08/31] gpu: nova-core: factor out an elf_str() function
Date: Tue, 24 Mar 2026 20:52:19 -0700
Message-ID: <20260325035242.368661-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc775ae-20bc-4491-559b-08de8a21feb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	TcD2NQQgMLBbt4HmwSKp5yI6jn4/kRHfwe1zPhJ3hBAyVgLo9DheQPhUXLft91RvOZAtgS5yghyKo4Tyv8c+2CbCn6LIpxgSp00qrOEj0Tivg+5MwLFKz4Wck347eWrDzd5tSgmiawl38T+RkSS+PAbtI5twyHPQWhcxZFlN2nClVSkfkbSdpkd/R2y13fCcC1E54scCMkz6ZxueqlxjJMgR9m+EM/ieE555s9mjIzd9KYNlsWyEFdA6L6FuhYbnJJUmWvdKyFA7A68gVWKU5K21I5cGD3ae+MJSCq5Dv0GUJ1XOswHDIM986yDTFul1Fv1XxwSwvmRS6xHur+uH5mrbFItQ7/6CzA0lnsOS55pEW+3AXZQSgS3TA4UwxR2cRU/kVSGDYGpjlGRLzwLDogEhe3G+08+6FMHArOf22raE2IdCMtM1KvGIUMNVihQh0uBER/rfWsEhVnObMPMDlGzLnRRq/qkLFs8HOqwWDFxa0LrI3E1QV7GHkEXrL5PUdfqJxyGOrP3ZyAhRNFAyKkii3A+6A1c/ul/LVdlzkAbGd3miJvfqwiXuPDOBo3PEmvigHPSvc+z2MwgPeWRqO5V3yXBVHd4tms0Qvz85w+9SyhR24DlJuhNsmJdLswXRmzRmJOu6lrYV1fbC+KkY4WAJ1ClGAa+uaoirjhuH6zre13er5+eUo56Ui2Q3L7opD47LjBXbTAfItdIFymtb/mrLoJ80YInjFxklRWcEHWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jZnAtwj+n6zL6tgRB+S8Wmvv9HdB0ZSrnVXm1wrEXjyNboEpfnX9BU16m3db?=
 =?us-ascii?Q?Vg+O0maTFF8iz29c5yLEmryH2X+582XK6Q2Ma/0eb+r6iegc4GG0GPsxfueK?=
 =?us-ascii?Q?/UffZlTUzzZyPBmbt4FDM1eSC7xLYN0yX2dXX4FoJO2Y8cn+fXVkDWa6S1fO?=
 =?us-ascii?Q?QzN1PDbZJ+kozUOLbrs9WYohgZdsSQ7i9v8WXm4D0ZZ6+tQeJ7UFub0ilJ//?=
 =?us-ascii?Q?xNW59DGwG46cRUV04RUIlHd/OXtZaF9XGCslPu/wilf9Xm+3I+/165s+6Ypz?=
 =?us-ascii?Q?r85skUGwCdQFhS8Y8s18keX48e8M7cr2l3NLKMU8H3QC9hVqQTvPEVsBcXSx?=
 =?us-ascii?Q?gMfTlBSJM2WuCNKN6GJQ273KYj527B8l2dtBsr5aMI9WO+SZhZlp4tku1lLw?=
 =?us-ascii?Q?t5d5FgNo3PCKO9CBqEuMRrjWpwbdKNL+JZDMdym6wWRHp2BtSPGDj8o352g3?=
 =?us-ascii?Q?13JYR6rNytyqrXtuEUtuhGTvX0Xr71cfsmUtAxhELwTehw9Nxhra/Yxi4FlD?=
 =?us-ascii?Q?OQxWK1mdIMrE+3rPIM8OU1eU22A896dMHWuCVSsqW6iwJYVmt5lm4d1mjql2?=
 =?us-ascii?Q?GF0NHZ8QePUReEp6pvc4wXbfShi+BaH5M1yLD1HKIECbG9XIQgjpvopofIXR?=
 =?us-ascii?Q?gRV7HqURql9aTwtY0cFs+ly2hojRRVowwgLVY5eN7WcLIWoK6kcc3sVRn+++?=
 =?us-ascii?Q?uf5TQLe19w7p3nSZE28laNCp0RmV65xndGKTsPtovOniOOtxk9Nak0WERnp3?=
 =?us-ascii?Q?OrTmG1kWH8lNOYw34ZdX5lOF33IeVio4mxettI3d8AKQWbAb39fT50Chh2OF?=
 =?us-ascii?Q?RlFmi3jt4Fq6ZiQ/SLLgs/aMvxAbTad6Q2F0m8K7t+cXtpXPjd2Ub4YK3/i/?=
 =?us-ascii?Q?3BlcKSSnGZsjkPVyhMEY6L91qanbI7MVcIZCc8pagoD2sl9IXPN/oYeyvB5K?=
 =?us-ascii?Q?rKNg5lPm5ZEGYfh9gA49FHHW4jqnJfb2IUrTQ3I8+xjw7w8fmMd9bzaNVj+f?=
 =?us-ascii?Q?KdrnBcjSg0g1Fe7kx53lfPsKHpuzIyoyK3oa+QHRgQN38+fYm9GsPFKRlu80?=
 =?us-ascii?Q?FSP0xQ6rbL5iCyZyWB5kVtYNuab9Ib/NMpivjxtXieitwX0mjVBFmwycQyll?=
 =?us-ascii?Q?ti35ex08ShKsdvQKB22ByYLiNXC6gJx+bVM1M1OASBK3Y3t/t/zfSplbH3N0?=
 =?us-ascii?Q?E+TXOoZ18ZOUs8iwos4vxuX+9qse+QddJiSOnXOtTXPLJhJWXCIdY6mts7dx?=
 =?us-ascii?Q?CrWAxfSdC5o9mvKEhbi7pEZHfFB8/PF62TevORQUBruQ8Bg33l+KVWMlVNdx?=
 =?us-ascii?Q?aBwTJpJZzslbaFy07NDotn4C3ITRmLGOPxcZ3znI1kixFU08QQ5Ad0hk5I1K?=
 =?us-ascii?Q?Lr2IVbGj+jvkGGLndaJRvCsbK/07bskY4P78ThF2yyEhcZO9qrIA+Rf9Mmi0?=
 =?us-ascii?Q?oMz+a4WHLDpPRLgcqVErLV4QddCbiPUU3LrC1iyE3LwDbGOo6BwseM2OSgE2?=
 =?us-ascii?Q?v2NH+tOQOP7l4vcC4c389+lmRmeJ2y/hAFI2nvZ/KWusMfRYNDOZoCe0dID/?=
 =?us-ascii?Q?OXYKGxlj3YI4V/aUMWV5/KwBJ9KR/QP7Ii4w5ONlMiENGACv2UQDXtgzeXow?=
 =?us-ascii?Q?NKGRdLr2aCYK9jfTY6w0QK0LElMavhr/n5GXQYE/KsZZwDZ9Dsj9+zLdNYPI?=
 =?us-ascii?Q?EIRwqKVQ1/ARbDBaJoBNcx4W3u23v9YUy1lOnGuJHIzmq/CPIU4GaiAAwzq3?=
 =?us-ascii?Q?omy0jLlkUw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc775ae-20bc-4491-559b-08de8a21feb3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:54.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXRkdfNm9DMPaLaXkvkXRqvbmTvBKlb88rXEySh1mdUz7b/85m+21dNgGTF/61YKRRFPqqIvQuoJouU7kbjFaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

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


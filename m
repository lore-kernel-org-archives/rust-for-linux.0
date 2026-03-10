Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA063385A9;
	Tue, 10 Mar 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108713; cv=fail; b=QgqqSuYba1kopiLyFO0GZkzFzTJzGfMhNf8pTsvws5AxkZ9bE9sgrZXPoc3bkWBFNfzcBoyhrj9PcouM6lFtnFtlkProtIL9NHfcMYhCzH7wksXmM0APVf/ODgoIjWEG2ABJ7O2PPKoUmlIRmUi0m9idPN/6CBM0UJBtZW8rtBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108713; c=relaxed/simple;
	bh=+ZUzYD+XenVWSXq4BBFbm8RBhaiXEwxJCjhopBchx98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ptqXXDriRcQI0UDDPGBQnBNL9pihmJl6wLMn3K7FIh0FBK4PLMfe1pfDPLwc8gMpyyNJpDZ5nRf65GCuq9KUypcaWOhMlPF4kFhi6ZPQGfvi624TJqlXgWXDbU5pWgJwhUeLoR33ulsyvRKhJi0uXAgTaHh6WOzeU/yucE8NNqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N0Kiu480; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N0Kiu480"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pn8o4uq0vRSLKDFaOUoBq6pXmqPpkKW6aupZ29grynZbsh3u3VD54PDhsEUzBM+vEqhnQZRUsmGEvOV9Lb7tRxNhnYVkqx4hKCFa2lE60fPg3sCpANCJkRjd781FU+exErv/IKBcCxqzR5Tl9XnmcEhrjAK0D4cwl7FRapEU1CnQU8RmklVB8m4ftwxjQoAk/ZKnL/lhhlTDz8pjZnc3tVTugWtumUBeb52bKdkHhJY4zJylTj2d5Gqy/CH+5s2x3SGgTCsGsCU5uqFTdvUz+mPIeMtUQSXcj2SeNBx+61RC5HcKWLKhmz90Nw4wzfw6WCZqlGKyXcAOjSojLCHJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSN/f9sbKagLWu2YapMPBJh40BBU9ubw2o71iPeHouQ=;
 b=J7Fos4MgXa2wUlJHWBrfFty8BfsO/Kc7EPpGGF19umirxRlh2SLV7NB73gMD1EHlNkgwwl68wU1h0O5jVkH7u3o/zs5lnFnus5Nb+9Sl3DXRSXAjNJB1ulT3itcnXeps0pO5VsJlk7NLRyVt6+bLorMLur5J/yHL0a4uPBtHrgJ8VeqHCZVkXQ27DChk3prwKUx6NVR1d5wsOgsPyblNzgAgsRH7sCjXBzuLdBRJwM7SdaPcTaTlCbXu17oVbKTGktsLvnYGV2FzQZcXoVuMQldP+SkLC5KEEynV2sVraosQ4ByX18k55rYFGKGmuNmqcX6JHPlAKnc2+7JJv3clwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSN/f9sbKagLWu2YapMPBJh40BBU9ubw2o71iPeHouQ=;
 b=N0Kiu480PIgojCuoS3/GIlO99Shp1XN5T9VaEMJJphLQEX6F7KBNl9e8HT23cGDeB1zzqopaLRCflSuRtBBkV5UfIAj2T74wwXueNuZqeR7BXGsya9JO32GG+YKLVmYHXx8rkVaFdPI6qBFTLvRDKmRt5cyMDwNnzbaGx/xI7lI+u6JTV0zeF79/8M3tGWB1YJBW+aXF6dP2vIf5Ko/xped0+nCxU4ZGDrwEtlMvzeJ7duoDcOEABPARvy59bxMmvVNUZUkAPW5CRTIVkU6oqKxheLPDpWBUYtnYe6m7H+UsZJebVtKFfT5/WaSy4CjZL6V66vYp5pFyDsqIKpauhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:45 +0000
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
Subject: [PATCH v6 13/34] gpu: nova-core: add support for 32-bit firmware images
Date: Mon,  9 Mar 2026 19:11:03 -0700
Message-ID: <20260310021125.117855-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b21f2e4-ea32-409e-b213-08de7e4a6128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	GcMS/IplrMT0tBSTkxam01SygdfYIr6TcA1WLqZKa9//XvGC2dhTmENEJ2m/HmBrbJppzUjFxzAZHgWuFRFeWrTEU8CFgZ+DrQc0V1RQEbTHhYXL93iwB5jNt3C5gbQ534Rm8SSsWTwf1FoFmTZ2khRW5Pg45ZsFxXWh+7eDKDT8WyS8EadLavi9BDhZTRN56fsuOS3zVcvbgxDMUWELspAvJ97cb0kW8u4GpoJ8l2UNjRilKu95WIUkoCB8ftskxhnYxFjfOFRFRLELjOFp4QlC6y4WrVv9rmZa1lV0crHlUorZNjrPnrHL7p1Lc9nq2pCxrAXS73Vyvxpxls6rr0NWA+EVNNjLK2YgeZjVHCPj3dzWmRArRN/og+gZXCkLyJyx1L1DvOWWTfTCOIyfZCQUjpnAImbNlmqIdlL3DFI4GwAFP9G9VRioRqZ/UD3qc1pER8BISfPEAYdEgGQHWcgF0qZyP07Uce1yaelRkOOYq85mizjmN/ZN5eIuUjn0bLhMv7IftqVooOZhTjudjyDdi+OzahtH4NEAqqD3pqQ7EUHObavRNzgNGdeoxoyP+iSCRT7yZo5Hg0j1VKoRNkL7ncPeN0KJ6vddCpzKcFz43N1n2GV+MUt782+ze7cHdC3qkhppJ8ojp8NZyYY2YjyXG2tpLg00skBqIXniPl8IMB5X/jLnRZOgwMwecif1Rxht962DuTJPWSn+WvAa6M59xAY57VqlOL0DyeYs9UQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oqd9YBjjI6bJaPR1hdRk4Y2jgG0aqQ5ReZqHadefd90KlrcRQ0N96R+w21xp?=
 =?us-ascii?Q?PuOtuXtjs526+Re+EG86JThjDP3kd6j90+/u3ZnrbkfCrPvp6UtMfzCVRcSV?=
 =?us-ascii?Q?p1Us5G9TWeYjenzK0F3NuPzvvqqCLpkaYtI6CzzYlO7NeBhBo9L6eAgFyxLC?=
 =?us-ascii?Q?Ad66eZ++QUJ1LvMv06WnbPwM2931QLaiKaYJ06oecm0ds0qvB15HPHPTy+zK?=
 =?us-ascii?Q?S6oRvXOeE4vI5Gs9zKNs/bZEEv5AGXa3eZnwqlrXzCLigllOvI9uihjx2Oxc?=
 =?us-ascii?Q?y5li1Mj9wC6+144NgU+S5eB2E3pq9zuaY8MYk8ZfFr3uWmGSv0OZQ3BiNW6q?=
 =?us-ascii?Q?QxeyJiwzDhLqRqLRkRQtMcY1lk/s+ozYkj4wnSEvfFPwZLLvlLSAdqaQr/8w?=
 =?us-ascii?Q?iC/bgi5Hq0iqS62OAldWADc01V86UI9n5rZV4yTj6qQ63f6m9CC+sTxTaOWX?=
 =?us-ascii?Q?w9R26/2TXSRRtGWtHdHw0rk56PB+OPqeM9WgRogt6sm+ceD53l13p4W0PcE2?=
 =?us-ascii?Q?tdbl1tpA2Z9XiFn9dTGBfq57AxU/QOgJ9jBtbKmDFPQdSHFCXMFiTsTwyYYA?=
 =?us-ascii?Q?srST+3YcZKt28wdkKgYnVRnySeE0YXJtgtLZ+1ESYm4kpFa29NUXa9viqFrx?=
 =?us-ascii?Q?q9WtG5IKimu63wgdwD8BAlEMQtlHR43FILyA+d2NEzECO+uztDz89IQ52sGN?=
 =?us-ascii?Q?4JC7x2AbSPX7D2A00gEYKsDXFrPyygWnLfIY0haNsfXTQyEMQl0mlu4JUWDT?=
 =?us-ascii?Q?Pk3TDtt0lZKkdcxgh+3fls7DxrGtQ6L+KmuzCp/zyfpf/8jVuHEd5hSxy/+H?=
 =?us-ascii?Q?xrxj/4waMTs4PoRmrSZDAyRz6koTjBXDMCnOg+QAYEru1AKjria4nz0VMeaB?=
 =?us-ascii?Q?//RgFqcR78DtWw/Y/L2c9oLhwWWOMkLJSdHbtpcIrV6G8JvIsjlUdWYSfBeV?=
 =?us-ascii?Q?BYa1SsLxiqj5as+00MjLAWcPT15CIlnxXjC1BGGdEgBejulvW7bx4RSN4kMk?=
 =?us-ascii?Q?Rvb0fIsW0obDybDl/h7D5VesBklClgFyOjoZ2VbbrEknLwI2ZcZLPQIFyEv9?=
 =?us-ascii?Q?aCIXckb5ufRRTyH2hiIITZmrw9iQ0JJFzoX927gFUoMol8rV252+2epOGpFc?=
 =?us-ascii?Q?dYpYAApQo7wgPFMZxGKCWhTN8Lg4Z6mwfQZ5LosiW1T/Wz+VWScC/PBI184S?=
 =?us-ascii?Q?K4VBbi5tagpVXGqJdLK6NU7/ICwPVCEi17Yg6eWizJiPCKwaFeUxEJO6xMq2?=
 =?us-ascii?Q?vRvMgiXxJ7EFpoIjkvgLBLsMif3qMFF0NueQ9hdFNYqshn6WbTQHfrlMH3Co?=
 =?us-ascii?Q?d3lu61D4Y5xTXSxVl1RtiwbuQ0PsArKZmr9aMKgV6IvnoicYj76etcuLzRVc?=
 =?us-ascii?Q?awswC1v3LH51reF/xqKZpTT5qUlycP2eMCgQ/367E4bGqwPjQD+mbR2HZP1P?=
 =?us-ascii?Q?6O/xDH3r59E27ciGBBK1jgHK67n4gL7B3NgjRLsqap75coJTjkBOFxRSv8U7?=
 =?us-ascii?Q?VCf64jyfuIe6DIEdnRa/8FuXVVkqX9sirw8hIFdC5YfsH4p4xC042y6UpITf?=
 =?us-ascii?Q?ukFucfER0DBwt6E9+PCf3vT0dsHMqzizd9UJhM7cHgdf5BUBShJEdjIRq0Kv?=
 =?us-ascii?Q?AHRbUuhxixMf663UyAYTjcoOmG8cabMI1V+Qsc8Z0fC+NsThKLsOMWBhcy6F?=
 =?us-ascii?Q?aa90gpbPtUMIYXWLMtpYfJbgu1jp9zCNd6Lr1YcQtubCVlU5l2baQWPKSlaz?=
 =?us-ascii?Q?1CHP7gVlEw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b21f2e4-ea32-409e-b213-08de7e4a6128
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:45.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPLoiJWvDBTZN+CmkUETqc1Z1z/zQ0gACpK5WdOpmEB7fvk4ipTl2SJDH4TMjHzF250KPdtmDFVunm8ikxp1yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add ELF32 header and section header newtypes with ElfHeader and
ElfSectionHeader trait implementations, mirroring the existing ELF64
support. Add elf32_section() for extracting sections from ELF32 images.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index b68b67bb1d8e..95aee1618cf4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -527,6 +527,46 @@ fn size(&self) -> u64 {
         }
     }
 
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32Hdr(bindings::elf32_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32Hdr {}
+
+    impl ElfHeader for Elf32Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            u64::from(self.0.e_shoff)
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32SHdr(bindings::elf32_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32SHdr {}
+
+    impl ElfSectionHeader for Elf32SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            u64::from(self.0.sh_offset)
+        }
+
+        fn size(&self) -> u64 {
+            u64::from(self.0.sh_size)
+        }
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -579,4 +619,10 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
+
+    /// Extract the section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
+    }
 }
-- 
2.53.0


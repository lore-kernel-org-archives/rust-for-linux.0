Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022B3346A6;
	Sat, 31 Jan 2026 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820994; cv=fail; b=AS/fI7lKMt+kbtbFV0iah17qFXlVv10u32s0nKhZqR61HTMbzYumFHK9fc5QnAsxNckaUvBPOzgx0T9pWTNCk/hyzlxxQontGFCRcEcntkmCCFzLarI72WTnk/z8NapCD/1hRU6vILBsB9dMT1B0wOOqf82a1iIYBrLTSWOLiiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820994; c=relaxed/simple;
	bh=u4nR14e39fGXCC11GAFC88qHOqv3MAvODLTG8YbOepU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AkHTRXgGQ+1sh2UcRSKTufJ7MHJQw7cYFwotzq3B47XkiaJgufJcyNREDgf5L/xdINavneFCiedL/wM2Qcu8wXoFor655u5dhy09Mgo9fibJE+WEE30AhKnXf5ogd6z2LsPvg/TbIlHGmnqwuZrMhReh4cclqlaz9kLBfVZLX9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LUL93KWF; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LUL93KWF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFIWt13Lfg2LnyIaz/qkMErN8bhm4Oawfk9TkMDKxDPcruENKt2loCkgNNxNKjwKBOrlEZBq3b8aJDoaqWQYQyGyBV53N54pxzHcMyd+X1+DMtTZYtE/QcBwaXu2tg4TyBGwaDMLhJBInf4S14GN5F3Mu1JE7NeObAX4b/JfAmXDeBKUAXEjdrX8hgTsdEH8N9ASc2iq+Ys6Y6jVEZUBFtAug51X8XCg2VYQS3DXe8EwM/7f/9PZ/RMLMCp1MzaHL8mDgi8Bz7nJN9v9UAPkT9gfGikYd3GVkmIyCx102MiKU+1+5w2WlG25e+tmI2f6Qkg81Shd1HJjXCZoNNJ2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2ctQTRPRNQFLSs6BzzA04aY8pVDaH+92cgcLN/10a4=;
 b=cjG8FR9QZR+PmvuROiEgxl33L0PtxOYa1hXel2lUxVOwAVGhVvPChlBIswNWoV9/SaKuYHBWvhQXaoOTfVnifZ5y9TrfY87Vb99CZcxX3xQJqGxrdncecoKgnrW2B0W2gX+M/ht0EDA+CncZUiWd/5ZEjUrcfPkPmZJNkgN47/GlmN/uGM14uJ9ORRVyPRNz3hnf6fD8nAHC8s/iNKNJSOiuWtavsQz6ro8L0Ca3CrJ5dsavfbI8+VHPBSVXeQLeG6eKWDlhA5M2Ouc7NoOrMLKSNP4Fwb6aECLOMZB5DtMAIjuQDQz+vKXlLksBkQDmLewiVpk4Qn/MHTpi2sSmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2ctQTRPRNQFLSs6BzzA04aY8pVDaH+92cgcLN/10a4=;
 b=LUL93KWFkN0JA9sxdy+kFTTCoSPWpDmbiPEgrkVjq8FsSZIGX5eOY1S0wd+cfpJHuGZHewnXe19DYLcfEj14OjIKCL6dHkkGcrhCPkXDYnts7IxL+m8++CQiQgehvxytV9/aFVqp/7mWziQqjOgruo360ERlx2Dg1MqX4mJNAxFlxhS6xX8/bIqE9i5AnPKtVB8nDW1jGeZ4t8CjiProQ5UDXnchInR8SPEdSWdtv8WWR0CEPl3/sBONxTWR0bnifcahx9cPS8EE4dS6byICjXrfQSPm3Ha60GGoNDOiJAf1pxXBbkkt3OBiZ/tAk0NqcCEwcGOekyPd5rQs8INexQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:24 +0000
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
Subject: [PATCH v2 12/30] gpu: nova-core: add support for 32-bit firmware images
Date: Fri, 30 Jan 2026 16:55:46 -0800
Message-ID: <20260131005604.454172-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: fafe95ae-4b36-4f14-69f5-08de60638eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PkyzbJv2JwcCZgT9hm+sO3BOewpyG47HDvD3E0d0pgXI8cD8/4tXUzb9azEU?=
 =?us-ascii?Q?EYLBcoSPuCHy+9F9h42bljybGermUgU7343k3QCHvFO5Pu78ac9NZaO8iLHR?=
 =?us-ascii?Q?+mtHrxP1np4NKHLRVXSLRzQtFNd1UMWcJcz31zaeotIwjs3SzO+pVDObvUnI?=
 =?us-ascii?Q?9A/0zXZRG1M69oHKxeZz2PE+Wei8uFj0LAtLiYURlBhLBUkkj/YQAUhTsG7z?=
 =?us-ascii?Q?dcqr+6lhsBhO7pAois0H7hFwDTUw+A5XIkPH+Om1stAMyemKSA29+ZULnJUM?=
 =?us-ascii?Q?HsO8cqrlCNytbIiTRpv9YaJ2uCVEUEapJ9D8W0w1QATzDjknYY800JAf39Gc?=
 =?us-ascii?Q?tDkcxGB/qAJJosdF8dFNtRoHB1eGGmhcMdudA1pq4msspp+xZSy+gfepUQtt?=
 =?us-ascii?Q?x+VipTRPYk0aE7LQJfVRASAb/hvdAd66QmqClfdL5OeYT5BNdr0aUJP71iSI?=
 =?us-ascii?Q?FswsWRctsQtENSsQY2OZzVV0qTiP+TAKWJiJbmt4mPhftmvmTxCCZk573WR/?=
 =?us-ascii?Q?H+X5CKKYlTGTsh/kWitusJRzS02Cu0b+DnS0sWQBVcS8pSkbQQnhHhq4iUEG?=
 =?us-ascii?Q?NRAaM1/liTJWBQMMjiuUWE0jv/rBj1IdoB6qrDXmRlVu0JxAeGRcrJgrId7X?=
 =?us-ascii?Q?CzMiVhZiUHLA702z5AiJR3Dn1AM6RgIYLKheZ8WOEBy1FM63asHBCzS3UPQP?=
 =?us-ascii?Q?d+KCpM3MqVvyDvVRb3gJuB73z/fOSWXZjduQHxW/C0Ignhd4dpzgF+R0R84Z?=
 =?us-ascii?Q?BHS0mAcbzXqZWFUe+JrEsg9aWEsIREkYmWC/wEz2oEAG/5gX+GO/maWd7g64?=
 =?us-ascii?Q?rso6zHtzWKe6FIC1Z8kELWZA3Nv1/Zz+Wa9D7UF7HrkqWEJpCdEFmSqUlipe?=
 =?us-ascii?Q?cRp0jnx+0oATw2WzwFBxBgku0iNcssIs5eC2CSJxDD2vOGtBjcTfLMF1FZ3n?=
 =?us-ascii?Q?k/5GFV1IGyVl7w0GdfSnJx4iFiTxOmA9qLF83WEs1Cz2gO09Oj8skFa1MIFP?=
 =?us-ascii?Q?aeC2CBLwLSK+ydL0fBB2Ms1b6ijIcCnvomgC3C4X8S57r5MvGs9PD4YwDJ1Z?=
 =?us-ascii?Q?XXuODjBlZRJIjxWGmZQacUkyFmn8gVk66pGUQMxE9soNlLojv+Oc5j83GDoj?=
 =?us-ascii?Q?y/hDU8n/TjQXSc9bMIXXAb+3xuy659v6fKx5zcipBwa4PZDZRjxxy/sePslS?=
 =?us-ascii?Q?Jh81B33szfER/YjoZ3IYA7U3oXni4fiHfsQYnPqbZ3xE35MQHKvIAdsM5yqb?=
 =?us-ascii?Q?EspCMeHdBeIGFXmnY0RTshWHwOmaWoJkdDr+NCJZbn0nxt1yxaDDhMsHaVQX?=
 =?us-ascii?Q?KQjK9KBZiPnlDwzXKr20/orukbiRL4xhZAxcRxxrX3/xx0GqszbRrC13lMms?=
 =?us-ascii?Q?zsRjO33dswj7txISa1YjcAwUf5rVgU4Y1e+oSWo4B7y6rR+80rHGgn8LeJ63?=
 =?us-ascii?Q?fPnFozy1rU6vmInuLwgQQwy60+eEBGLL/o3AoIK0tPpeLTiqSvnxKXWSghi2?=
 =?us-ascii?Q?giwRjqTQeEMkWCasLpXxeLd3nlYz5ULfcnW8FWYAc9PVz7OsJtvTDOO3F1lw?=
 =?us-ascii?Q?11fHEqQDlcbohLrlNLk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kORN/M6zDwezvoFTI9ynFvhyMiBzdB0lrccLp7Bobk7udIp3rvUxQqMYVu0q?=
 =?us-ascii?Q?kWY4Aec3z0R9/wZRCuYbeT9uFtN4wgEjjvz915IgKgmRBl6uNFPzCHq5Khgf?=
 =?us-ascii?Q?lsqgYol7gU8TZtRo57Rj2JAxkoIWyhnLkAwu22LU1RPx1avowu1aMViz9esc?=
 =?us-ascii?Q?pOKi0GcBbfDfZ+bCinoGxUcMi0eCtgzEEqDWej+eDovyena+8q9U3neGZYzH?=
 =?us-ascii?Q?nzt0NbYTcC+dN6yuJ743IganrnPz7VJt1CWj0zR2RTn9HEe1pYS/1bPxYqaC?=
 =?us-ascii?Q?KUBvh4TRKNmpBtIPi1ONzfUdVRs5/FrwMZFF+Z+dAfAQBalKkoj2QJW+HesW?=
 =?us-ascii?Q?GZB6WKBvJBRfCA1YkFEokgwj1IvoInrxXB4F5Ph7rtyM0Nh5M0abpXBPmSZA?=
 =?us-ascii?Q?no10fRRhDQMrVxGfi/DyksunDRPYITmuUFXC/vh2vUVBUfCJ4010FLsLvRsM?=
 =?us-ascii?Q?1lLpHUp0QCdU6NWqyVnniw5Ls3IFaAoT6kucfaP6JBUeeoVCyzNj5gR3DTlp?=
 =?us-ascii?Q?laA7dsUgj86U9j8iXi338p4pTtlmgqmPyX3eOk49r3HwuBkaXIg4beoFQXND?=
 =?us-ascii?Q?+K8o+iVuuB5yHmGEhJ4VhJpxK6W/XxaF8ryUv7HuGxfv4cFaYzjJ1xcq04oI?=
 =?us-ascii?Q?rx4/5Vv3/KNs7NaeEmPlbhdRk9yGsXtuWnDBxSlX7un/2Jkg7MC1KH/FKDUT?=
 =?us-ascii?Q?q/t72BRFo9nrWyHeec7KcZqjV+sj9bPpWmg2V4GkkOeCepmGwwt2zDcSTy7y?=
 =?us-ascii?Q?oxFKjnhoOp2cD8Rr3wB9/53pFrlm/YpniKvMG3g/iTpEIEpz1P6C2ktrlsH/?=
 =?us-ascii?Q?6SAybIXMGfPTIbFA3AS82nVcpyEwLvsFwU+pvtZDZyMJr1Ri8ecbJHsMbY0k?=
 =?us-ascii?Q?efdurHXg2bxYLcGWSUVqj5f+CzfXQL5akhjyfm4uK/GVmTOT8HY4sSRLDFgw?=
 =?us-ascii?Q?e1+2Ho1Y1wZNzcLkti22Z9829CwvOboZ31EG3Cz+8Sdx1uDx2DaFuMc6P81k?=
 =?us-ascii?Q?Yr5laUzeBMyYhrf7Winllb3eLLzapy6KxKdDvmAg1ZfmHuJcFNigjZoTRYP+?=
 =?us-ascii?Q?h0olej0iUyNoDlcBmXgB0bqGJaxaATSMNXMxudhcy68swoNOtSYgFzmG3qE7?=
 =?us-ascii?Q?38BwexijxsbraZ8ZvsH8swesoIuDJR0bRuLFWldIjJiKlqCBe3NH9Rf3FCpD?=
 =?us-ascii?Q?N4npD2VI2QemTomAw24fES09UhNDY6oGwaA2xVd1SpXfwwfSUf2XsX/B33Tn?=
 =?us-ascii?Q?DBdK7Jv1pslUyxQFQ6NgnW4Z/KPM6cMKuI1x3/1Ra2arZDC03L85R0ItuIYx?=
 =?us-ascii?Q?gdMVhI+i/qendgJXmwAScYEr+fEw9ddjCeDHlXfWIv3Gdjcn7T+v/SUM7Ett?=
 =?us-ascii?Q?2K6c4uVqRlf17nfqdwl0dZcYFSmywJ+ZCXykc9Jcqut76fZ+k6nGy5a8B7hR?=
 =?us-ascii?Q?c4T62fCDjLg3uVsNXMmV7If/8MwkV688wE8lmZoMcG1aW0y4TngDteclFqk5?=
 =?us-ascii?Q?B87YXwGd7Nu4Fw11o+FWxbTV6RqnQiw/M1dZslIGUFbRWerhsundfapHSvMl?=
 =?us-ascii?Q?d3PtNBrQQqkcAjL69u2vAr75W9WMK+4qe6fsD8EfVFOIXm0rArtuXahqq24T?=
 =?us-ascii?Q?X/4rB4D1QV80sgIpLD8IhUzgsbdxZ+R3ru9n74uHEpl7Az7zjOYmQ2ZFKExd?=
 =?us-ascii?Q?WAeXN3csDCginz9tSj3qP8HtyK7kmgLEk24QPbzedNvSI4nZmbO6YUwHwEIa?=
 =?us-ascii?Q?g1Xbk04EQA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafe95ae-4b36-4f14-69f5-08de60638eb1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:24.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cGhJ4Lw6xsEYvz2rni5xqRnGUbYnsGJ1voG/7s0IImaEGqRoaFI5+xmbnaLTGFhunek7zRMSlHP+zFkZeUnSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add Elf32Hdr and Elf32SHdr newtypes, implement the ElfHeader and
ElfSectionHeader traits for them, and add elf32_section().

This mirrors the existing ELF64 support, using the same generic
infrastructure.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6ed76a7e15f1..5f3f878eef71 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -507,6 +507,46 @@ fn size(&self) -> u64 {
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
@@ -559,4 +599,10 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
+
+    /// Extract section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
+    }
 }
-- 
2.52.0


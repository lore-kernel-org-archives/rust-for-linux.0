Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA8F31A068;
	Sat, 21 Feb 2026 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639943; cv=fail; b=ra3jvERG1YlYwXNmSwyiCt7Dh9fpz/Q55ybGfxbNJZrXSCnrPLftG0iN9VQfw4Uy8gg6N3YZ+HLq071SA8uPWUMcZtb0/O/MpBvSqpp3C2wcVovml5kjYyiXlZ474mTFSszfofkdYh52PUAAE70EVvlV0JEuuDwsZdnqleKz6fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639943; c=relaxed/simple;
	bh=5mnvKXL8Ts8RF+1oe2q47QkVY6DRmxwrmYIBKS+jkEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pqLLm2+MCMkUs9BmxT559tQaPgxE5XrxQN5iVwIJQ7QMK1dlAVojuPiyRZsR5OYaCO84edz9DiI39XLvZ+NTLslEr4jD5XrM/56mqC/+CmIW8zhuipj88fRo6efU9NIEx1zjWCHp1t9vnXk0UBSbMP4AyX9qH/35rkEz0qJypqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VpURkDrx; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VpURkDrx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/v548if9ARkc/3XNKfZGkcPboGW9mW8SF0JBzaQHkPVuQJ5Zik759Lp+FHbAla7TYCj4tE4XSRHi271ErN3t8QLGcFYkhJAQFBIGXrTWFv9rtnOq4ZjRNc+P0f3MfEqsJCJII47O956eIurCdrKTNFx6jbH/yMODJoUZnLvZkhsf/lq7ukJelKYoUapR6OscbahIk7Pe1963oDQp8IgFSzmZma3bCgzAhJ6h3bFIdR5ZjnOy6pPxmMybCnwf5I340nqEmAl3ouXofrXdMfRgb3APBF+Az5flyybvVLfgWOlcNlkBBsLiMDqZfVhCbxz3uaeAY6hAQ0cPFAZzBuqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6n4yNfeWWtXLDUIX0DocwaYuUwAzaRA72WguG1NQFc=;
 b=INPVsG2/UOT0Br4d4mlV6/gzEQKhg/sFjc7Fex47DqkzprRNS/O+RjIOuzF8iqXIkRQOAvmpcrq5GHuhr8J0K3qYXkcgcKNjBaNyqf0XvlBZVQSOnnNYxCnRUP7So1UeiA+hfcpy6l3rutnN7rIge7TRVqQ45Tbk0O57x86gC9v1xoIJPMZF34L86B0BnArXxaGSy3D0/ag5XrUEhAUzaafj7J4r3aXJCHb0EEU1EdGCxYoKbf7YTp8Gr5AdjxVOIT/BTiEAgIBktme2o70jIKkMNZy2sNcRlIm+bMTpxWmpjLayhqAa900sF4Jm6sS+YIPCk8sZNlc+x05TvzEH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6n4yNfeWWtXLDUIX0DocwaYuUwAzaRA72WguG1NQFc=;
 b=VpURkDrxLdPN05jKFDFUJ42hSHPYys/IjJ1Gaf3sL8QHjAAIBHzum4nTxz8kfX3KoYhSLWLqf2fSb4wLykyX9+x9GhD8bdJTsony/zIyKiQapnutusoEShrxAM6M8tEz5ZcifJ6fzsOHtSrZvR8c0Wv1+Cz8A1p62yd8zqzH9O9Vk4eEDe3Yc8lqYDZmwoPzg9zHVkjOphXftPV0efAlHsz+yPbNqQX70jBWRqJbu3/8MMZpT8pPjhThK6iQYXw94hRJ+qGpQiLyJndziSM4H6flKdAP+4T9QLaZZImd/EGwm2UlMLhMmGMRK50jUF9aONGbREHGyy0aLzwjAZuBCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:30 +0000
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
Subject: [PATCH v5 29/38] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Fri, 20 Feb 2026 18:09:43 -0800
Message-ID: <20260221020952.412352-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 08238378-e7f8-4e09-bbbd-08de70ee6329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QlpD+DYHsGJ9UQLY0pNp6Vm7xjgD0XadMc5m9Zoc+J9AESSQtzWUIGqN4VKr?=
 =?us-ascii?Q?pbAyBqyTUkntwqWspUU75NmFn14TQHoyt3EZtpcRQrQBmzRMNtVYW1ioAHCt?=
 =?us-ascii?Q?jOoCu8yiNpWgAcG48PWQJPqOil/WXSDUESPE2yM/q1Qe7GjWNkQggKJD1TSQ?=
 =?us-ascii?Q?8bGmMT2oGLf8f2v8twTp85DXeFrkxdwHpGcXnFI0bwnAIRRo34qN5lsJxCv9?=
 =?us-ascii?Q?8c3diRpZoMFfRvnEmFZ+uk7k+SEEBLVvvLFTYWv3t6/bmks7aNqzZr4sUUEw?=
 =?us-ascii?Q?kzfgy9UCMHoZf7V5d+C5lhKPNv1MPDZYoi1KQJ0+MFDcxHVkkwN++RUtpPRk?=
 =?us-ascii?Q?WzcDdaqnWVLsb9pui+gBuVW+gUwudSz/gnakUMDzXjlHBUc+kZmajOlols/T?=
 =?us-ascii?Q?WOCpGhPDlhWLG9twqtDszIno3rP5eukdA3TMI3jfoOyPuUppMNiPeqNjHRzt?=
 =?us-ascii?Q?px4Jg4mXYnOiJLDRT+6uilxpfLC3EcO10KYyq97iwQ8WYrsRX9uh3qw7Q4Yq?=
 =?us-ascii?Q?sh80ncHYF+ZdKAI+6YNXKIfZ5yMuhFrTfMASRGSOUN1g/gPuGjCguHkBEX/o?=
 =?us-ascii?Q?wBjrXBVNCta47DXbitipYT1md44QVIFbCCqNreU5BFEKPqDHsz5FXJrumxQQ?=
 =?us-ascii?Q?6cFCOpU2Yk701iM0u+kMQKffPJugYDgEKOJ6EfG5pNYuebeT5zR5rNnyjeFW?=
 =?us-ascii?Q?pw4Dbbod0tQgpTm9RdckrRRPVyg5j6q8oMdtFo2b1UOihcyJr1BS0NnSWciQ?=
 =?us-ascii?Q?rT9W0kGiu6VlouOTNo7FFDWaUh8LH6OI5AYdqnh8NuQlTv6+cy2WxZM3Rx0o?=
 =?us-ascii?Q?L+PZLfSVVyAZhn89ExW7FE3/Rfa1ZWUNks/nOE2tm5nLAzRyeaGb/A7JqWuQ?=
 =?us-ascii?Q?8l/QxyABB0lh5ZwcAxBppYAE6q0zdN2kTTlF/TqzfH8JTgY7kGEy/nYmqR01?=
 =?us-ascii?Q?iTG/7vp8/jO7CLuGlBFOxeSTyznE0wXANchQIVERgVQlX8cqVfN2wK1pXOoD?=
 =?us-ascii?Q?ATsA3stKAvRYFhbAF5pjJt/IkHc/vzBnmrcatNsG5KAP/eomeQBBSBhvRXvS?=
 =?us-ascii?Q?D6aH3f23XqFtS180L2o2n674Rc/tWdObo1w0d2/4mmf/UtX2u0vy3SjGBgw8?=
 =?us-ascii?Q?5OiXTdugYbi/opCaShirNmzgiZQfb969U+vFSfA5pU00B6wO+s0TaiNvvgfg?=
 =?us-ascii?Q?WQbODHUEHlPWHY5A/0hNrdzgUEahRjpi6ktw4H7qC8q61/eHsNoRRMqY9ec5?=
 =?us-ascii?Q?B9k40+PfjcGpbZnWvHSbKYRYUD2vtNPu1lOhD4nRAhN8UvA7ePDx387lTxnP?=
 =?us-ascii?Q?Ti3jTnrzp4D6ZAHyvmhweNGz/4bqcRVQXMRVqlEUCB/IqRt4gjg1RaUNyoaw?=
 =?us-ascii?Q?9yOGfVndf9L0SWTHo4WUTscrzRJ5l9H0qHtYZiZ4Rfwmw8TS+vVc+bfrkYc0?=
 =?us-ascii?Q?0n08Bf1hjEgetcHakRb8aIQt2corQzudaW13Tgb/haOMU230u+FyCsfvIU3s?=
 =?us-ascii?Q?0xMKSpW+JYK6Y7wOdNaxQN1k3lDQYvBVXoHL+wVRlutQl5nMHNifUWHLORcT?=
 =?us-ascii?Q?iXSTmW/N8UF8Bu60IGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Z2Ed5epozgoqRLO2TIfKINmFquvFmOUWKtR1Jz0DAqhwP+/3iVDBkT2J6CR?=
 =?us-ascii?Q?gFLDj0tyK6FWKWAqV4bndqzDP0B16VIvjqsVMqggwzApM4WT7IIqGHPTDv+i?=
 =?us-ascii?Q?ZesyU7Ezh3Hk8DZHABTuLtpbyB0MFAuwriluEKYtBCK28N7PL1M2kFHAJsNM?=
 =?us-ascii?Q?MoSfzGDcPVwDJrhnuzD4Ttud7x8rgB1JKxyDuxm3mCMk2zrZjY1PEcreyVgW?=
 =?us-ascii?Q?3FuF+dYCse5EYKypeKb2gZyrHwhqpYsSU9OmGFrPmevWWgWjnr1aq6GgXk9X?=
 =?us-ascii?Q?nYb/ULPFAr6a0e6o5ThF4ETrU3FYjEd19U4lVZoOxl6ct0JEVosrsJATefnL?=
 =?us-ascii?Q?JJaGtMU0lj1NCTGb/iwbMMTMryz/YU3ro2XII26Boetu5jAZnv+fZjDTDBCF?=
 =?us-ascii?Q?eXfp3cop9crIwtaBVkx744SjlMUv/L0VCrWe4XjcYUBUOn1Q7Pc8phe05h+f?=
 =?us-ascii?Q?NNt6oiQky/1on55yZ4NyqbVb3lHe5shMpBImEl6Dw33xaq9lMhXrBdRNT71O?=
 =?us-ascii?Q?fTcaHCgGyB3a3lzL2YE8rr9F95Zadqh1rO8y8rY3tl0ju8l2JTGgPZ2VbiEh?=
 =?us-ascii?Q?aH6x8tBdb9U8ct4ZV7Xc9+yFDKAsmGWKOHpkryKMIu9Zt6Asr6vs0uhPlhxW?=
 =?us-ascii?Q?M7vMG1/LRkoW96kO/qqJl6WdvXA/nbZCId9BnCfFaYyG7OXn3fUWvLcD0qyl?=
 =?us-ascii?Q?kQoz4cUTNbE8ITPSzzMR+WLRfWP6lquFVVZAxiJlGc6YJqFYK5xOUEg7sl/9?=
 =?us-ascii?Q?iRS5KxNq+PzaIlXGXtRaRt0wsMETuBul0/+PwJhhoaSuwovnqI1oMu7FIR+s?=
 =?us-ascii?Q?5uQeDqR9y01Zqr0jQ8Y5NMS12TJm8gd4L86wzb7g7T1dZCtt6wlegOUWWzaC?=
 =?us-ascii?Q?kOBJK/h01tnkrzTvQVjB4yhY2LO2P05KzAbSy7kPQf2MlYItm/kAm8RAQ+2o?=
 =?us-ascii?Q?ACC/aYV0Ht7Kw9fq1p5PK9j6s492BCf7VpHYy0I/Dn0JZV/PmQWZDrXdpx4N?=
 =?us-ascii?Q?6hT4yFZX2GRKsNSJeLJSW7hiI4pGKT04mirjy4qmDeAiaZqumwhnWfpDpiJR?=
 =?us-ascii?Q?eo1Uk9cvXSnWAcdjTJaPMDc2Vxj0yM36lP4UfdJnNitp3UJJjT8XVbeLnGao?=
 =?us-ascii?Q?0EG+V5KBRGD0y/SqHR2uOomNRM8D/R3uGxSeQGRWZA2oTY0aTRplTwAGQ5Y0?=
 =?us-ascii?Q?NvGw93qSiD2/dEHJMnyeQOEcOl4gPfSV6dFkCGf9egixsMG0UVK+T6MLLGex?=
 =?us-ascii?Q?UM3fUEqlKrl1rGT/61GZPnIuJkd2ITIfuGFX1BOjrH5wEgcVJUmswCfN/cWh?=
 =?us-ascii?Q?NLnTMXPFJH3WZF8Tf/gRwicXK6uF/E4qfi8SysH7WxyUWXcS12zQDwgZpvHR?=
 =?us-ascii?Q?m30zcR1SSa5gs4njK+/r4tQJJ3ak5Mu9teC61Fefris8GpZt4KWwmdVbnL0x?=
 =?us-ascii?Q?ta7b58DXL3/aHkt65jQ9dky5pqxjEiXLUKOw+C+geEWOL3PZIc/yafXAYU5T?=
 =?us-ascii?Q?U4jfQ3zCTgMl2apccNYkWkR4f3p3ySptfXKP5eE9BGqipyRT0V3LF1IAN76X?=
 =?us-ascii?Q?11ejoicTQD9uBNSUcndTwsAc+Fe05czonq86t5Ex3XWZ9aUGmt1jeLcekxT1?=
 =?us-ascii?Q?8/PHn/vXVWtuyRaYJai2M7CMiU8diuzpYsjCLpBawbJRkr4N2CsOExvo721/?=
 =?us-ascii?Q?OJUgEA+MXMyWl/giU/9cs8q8I2bvNY+uCKw8JdU4NjPhUkCxGo8St7FICtMp?=
 =?us-ascii?Q?WKj77JhOSQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08238378-e7f8-4e09-bbbd-08de70ee6329
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:30.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZspnp6viBTuoiqLdq9gcIUvYGuYWsPvw53mIptlJuKy7ddZlXtk8qkNi06xjos+gDDmJvgUrLft2GFu7OdaFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add dedicated FB HALs for Hopper (GH100) and Blackwell (GB100) with
architecture-specific non-WPR heap sizes. Hopper uses 2 MiB, Blackwell
uses 2 MiB + 128 KiB. These are needed for the larger reserved memory
regions that Hopper/Blackwell GPUs require.

Also adds the non_wpr_heap_size() method to the FbHal trait, and
the total_reserved_size field to FbLayout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal.rs       | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 38 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 38 +++++++++++++++++++++++++++
 5 files changed, 102 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 0e3519e5ccc0..8b3ba9c9f464 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -31,7 +31,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
@@ -99,6 +99,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(usize_as_u64(SZ_1M))
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -253,9 +262,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index d33ca0f96417..ebd12247f771 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -28,14 +30,22 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada | Architecture::Hopper | Architecture::Blackwell => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::Blackwell => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..f8d8f01e3c5d 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -8,7 +8,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..bead99a6ca76
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb100;
+
+impl FbHal for Gb100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..32d7414e6243
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.53.0


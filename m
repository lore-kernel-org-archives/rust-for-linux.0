Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7D2D59FA;
	Mon, 26 Jan 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769458996; cv=fail; b=JV9awsCVNfF4rnWTTZ2nYxbsiH+wiZ5IHof1x4ewmsBz9m+xnCmdIQ438Hc54WaVGCI8N9Rp+/F9eZvjQv/yZXO+xQBdST7wFmteZX5EPVJKEoeaq8xAjKwVuNuqDh9ZLm23eA1LyfROsRZPZHOI+tC9B3sB98bmh2u/rLNvXp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769458996; c=relaxed/simple;
	bh=quAQACGeGwSx/G4wGiIUnhx7WTx8dOh2Gorz/fBYxIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SKaqnMeh5FrKBP9Vf/vZFl0WT9Y/DXZDqk3HrUtVacT9whuQEp2atg938R2kTRx8b7jAx8L1OriZI4ntLN0lwHyF2Ep4V39puc1wE04kRUwUCsfqnyZdhzWlp0LoSG3U6Yl7aUzjDjKX50SU6aL6WAv1CG2xmz+dyQKeIqrQISA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OCWjWWrh; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OCWjWWrh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBOvcqkVVcBnqyjQh57bJV96NegZNALbMcYP4KMrTL441+iNi/D4kMmwYPU2WzrHlrsUWGyAru5b5u8Z9jBh0nELSQzIKYkkmNSxxRzQL8nzSBVrkLg35T5leOIJphgj2IewPdvpGM8Wiep1rS5Qk9WzYhB0ufIUFLaqFt9skyz3zFSsNeZSAKx5T9qos084RB8qLtx8TZ/SQbOFuLIhberAFrRcVVKSXhH2KCIA3dP9IbG4clZUJwHnR9gzPH1jQZaH/hbYm9Z2OcYAPnjwHyorYSmXVWFk/RKWKjI8FXSw1gbuQ12gK6bljWBsY7NRTUweZaYVSUrmxsP75BVAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emNGAWJg6q4LlDY8LZkvYlckRtr6T+gHFR+egELQEPs=;
 b=syi6nqOrasbokqCSC76TGQzIxpRAvDDjOlW/xuDcPVz2qpaVSPQiKbmJ5YCHZG9Yvpj8wZAtdo8uBGZdqeWDTq++jJwiz/E6FEJhdZC23vDJeyl7iskkEDZLVSHAw0KWT0TgQG28wTQHVm9WymQIlIOUFDsWelFN8easrafuJentjf9CDnE0LCVl03T19zIgg53AOYhvCjtDe3SM5Hv5K9EQrMv6VluTLLynBaDugBudjm4gQWyen7s2PIw+rcZB8ly/4ggzCULjoRjh268skZTxZH3CYM9mtWMm1O2lcaDONpELn3KSMx0wQigQJuMm5xWD593IxnNhfc6qqgHfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emNGAWJg6q4LlDY8LZkvYlckRtr6T+gHFR+egELQEPs=;
 b=OCWjWWrhzuGWKPuisFAUflwYVPPiotcWvSsVthUhemw2+NSu/MzgC0VNZCTJTAAlnvr79rRJZIz2NrtQE1yPUrzf+zQDzOYNql8ClR6oqn80pVXOWnFwzIrya4KmdmVO5Bks9IkhhqF+8Vu80HOPrf4YZy6NiOI9dUf/7DploI0GzBhzk+0TzkiPOouWwxVrjUoWAwCiBURg4uo/ijlAD8wSiRDtwqYBT0m+5lrApuftU/qGf+fcYQLJlC/6lkFOmELZqEEhrW6czD+mXZm7yuDLdaSKLUq3axyc+9z5JPKb4rSwdcUbsU4+c/5mfo6TB8o5mXaTqYczo8/VepwHmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:23:11 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:23:10 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
Date: Mon, 26 Jan 2026 15:23:01 -0500
Message-Id: <20260126202305.2526618-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:208:52d::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: eb97073a-7deb-4066-a8ad-08de5d18b993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0dah+1IP1mI+cs/+tFBe9T/NYZvHG8tW32EalZi7rbbweWtnniUWcAmXqLV?=
 =?us-ascii?Q?zAlUWTDBSFnHL+r94ivxdfJLiNCl5ZoOueE/XNL63mXsE13S5FOGDs/J8xvn?=
 =?us-ascii?Q?+dmSzAQrisRWG2ETwdKj+UXJpelpyPQalCg3VIN3224XXpstiNTd+nnoUWG3?=
 =?us-ascii?Q?MQxPj4ZVGK0+qnemXpJ8AA1rcyJKxyEkwWyBTnagWuYwNV6Sx+2b2GVzTIgt?=
 =?us-ascii?Q?+jgPRzcPgva1DTZUgJ8CCZBMkuo1KKRjyo0/FYvhE+M8hENXH86AkH1j+SL6?=
 =?us-ascii?Q?jzYu/Vz78b4VcNEoJ+WjgWrFSOC7Ej03XnCRimrkfnzZjjOJzugKlwCxPaYE?=
 =?us-ascii?Q?zA6uiYgH5mSlKziEI/9vqGDVmorn+tcY+k4ISHc4RcvYl4KUSQHneRmYQNt/?=
 =?us-ascii?Q?8nWI0pwVsrTxpTiaM6P8Ea9hcb/JuTlTCl8BGxfbjc6GVZD38MambaWG+eoJ?=
 =?us-ascii?Q?vYv9d4LDupzjhTKYdPg7eXMC1hPrbE1eB9Ib9FoSkypZEzgxWGhcRiqfjzlJ?=
 =?us-ascii?Q?/EDDnonU0rTi6sUnTxp0f/ted2Vgp0PngJrksyhUYNPmJ+YhfuagocGtKREY?=
 =?us-ascii?Q?98BM/G+fFNwAwnqT6eYXy5noGl72dvslktnJ7kElwwC/Wmoa52ApOT/wfbds?=
 =?us-ascii?Q?7dcMyNcSDPuNMYhcaDIVeVMBLfvt6jxB52Awxq9rHbrYqzAWwCGKNpv65bzT?=
 =?us-ascii?Q?FUrgLeQwj1cjUB4rvPauoBgV881pcFhlInAJh+L6w4QzKdeiZF+6NffDd9Gu?=
 =?us-ascii?Q?zzZfJKyCzHDAUjQFgdLG3hPVKmz+1aFI8bhGVeR/O0uOawapPtG5G+uhqya4?=
 =?us-ascii?Q?zq6TTAfWYCZrMM4Deyjgwm3Wh6WNW2tXCyPs81zZtzCYE6WTg+c80FeM52cV?=
 =?us-ascii?Q?9uHAxeLiJh4yT9nE8iEeyR887+WcJImhgh4skj2YR/w7yIpU34wlZkJjekhH?=
 =?us-ascii?Q?SNtUwOIJg7/p3XU+z1J40q75335GhGWEYoOfBBIjBFQz1bLlSgz8aMweMEKA?=
 =?us-ascii?Q?1xrTdvVLCLFv1jAPhAoQR3k9xHfQDrBWuPutT6HonK2ZaFYV70hs4sk8WQL5?=
 =?us-ascii?Q?mzuDb3kukgq9mvd/QvJTEOxx30MRQAbGi7UZIgIcqvJlK7Q5dz9WEsf8HtaZ?=
 =?us-ascii?Q?2oHvQzmCXdgxfuCPnzkbkfCtJ4ihoOdQN26ylX9FFBEdGhdiQ/ZX/aV25VzL?=
 =?us-ascii?Q?wJdkZN5cGq/TSnmYpO9yEGvEW9zAVtDQUUTT6ikvKpUEDkiJAqHsSJLzm2FE?=
 =?us-ascii?Q?5U+02X8GBbu6657JQsSwt5bLbH6fgbz1YxsFXXOgdP7nZS+MRZGZJMq5PEN0?=
 =?us-ascii?Q?oAtAAE2ZPz/5CAmRFckGKNWWdj/OuWjIyurt/oxkBNUJw2FxNKOq5CY4wMMb?=
 =?us-ascii?Q?ItlV9LkANxOT/aNrTBdVwe+Iw99rIcjRwrfho5gGpFhgFqqDT1DcYpvhYFNj?=
 =?us-ascii?Q?+j32P/9ybvptU8h0WPImmqj+QyupgZPpPHqnS501ThuNxMlsweeazil0qFRg?=
 =?us-ascii?Q?gqV9sK8QrwUd+VshPtbO4fCQBK8FyxCtQtkK4OyTJfFUmGAYi9Ge2/8KqLiC?=
 =?us-ascii?Q?DFCqxDRqz0C/D/YTbZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?orzSp7fuJC2F8F9UqnicJaR8GyEMZ5yWoQMP0VHo3dOjP54VlXWIrjn3pNbC?=
 =?us-ascii?Q?mNOSV/9MAyRMNUR86YC5CCU+YP2aJFI+RR39uqbiTJmAhWZ0j/hqkYdArfVo?=
 =?us-ascii?Q?XoPj5N0u6TTMCNxR5fa3dzr8d6ZFIyUxptBrO155Gn7+ScCh4CyrQo+F7vM7?=
 =?us-ascii?Q?z0ELZ8ml/7FaZ5cefFBL093ow4CE3wINESyNN3ROCIwm4RQObytvq+mYSTEv?=
 =?us-ascii?Q?1mFmqui8no7YMK+rH7vCh8KqiKs2LnohP9K4nq9/rk55SvZtQprN7+vnue/D?=
 =?us-ascii?Q?7CYWryWqSTOwDk/HPL5sHConH9wmx0Opcd6ykcxTxzcTLKGf9WPlvruMft5u?=
 =?us-ascii?Q?aIw5WgQq6OaC92isXQCffx8SaL6NijEPKtkTdz+Nb/MSpnbJeeuNjGV8soXt?=
 =?us-ascii?Q?oq9Y8bA314bUeFuGMRG8kC2uJCZhiKUrKfUcG4zv669xe8PJAon1R8Gy3SRW?=
 =?us-ascii?Q?2F3frhf3IdZaz+DE1noLp9a+I8qUyxdxGn/r6mIfk872J95GWMIe8PywOMgv?=
 =?us-ascii?Q?zMJP7Wlpgm7Xjs5jIK9jK37KeC5YJGrc+1v9Vwz4rwoYakjDdmP6GptLaRIF?=
 =?us-ascii?Q?rdzTHGOsbg6EzDexcoY3gF9t+IbdWUNCYtvCBLBjS2sWRmrR9WxBxZXMBuxq?=
 =?us-ascii?Q?7Mm9WgPfyloJ3cBLTdfgm8wfBdaYTrL4vtWkrbos0SSImCmDxTKlPWyC3j7N?=
 =?us-ascii?Q?vhu9Kixg4H2x/Wvbh1l+uXNBeXFYSZ9Qcmb/DJFZ6fAW6+zSF7XTeupy/vH4?=
 =?us-ascii?Q?5miThPJOg7ciQT7gKrVfKVF+mUghPKvWmQRB9bMSP+jkZqpMGt8K7m0UnGtc?=
 =?us-ascii?Q?c4mxopky+ehidH8g0THcnSaavKGVKHfvsDSyv+mUQaa1+p4njA7xM462I1rm?=
 =?us-ascii?Q?N0FNcZ+FuLqzRg9ny9kniCMouXgd39DC1mVATfV7OpYvaHlQSZ1FVH2TvIiq?=
 =?us-ascii?Q?pyzwvCIKPboK+6CtNXMx/sXv159R/Wuk3d3pDBhO5w9oxqIPfRn9Fq3V+R3I?=
 =?us-ascii?Q?FOSZwjm2OBoaHAzGcYTZHTRP+U3HR3JqjiGC/CfygxVlor5QLI36aDQtgAip?=
 =?us-ascii?Q?Z1Qo7J31LAtlPJmsjJUASYed25jmHwI/p+qHagRb/UjLnnGbvTYEmrSk30a5?=
 =?us-ascii?Q?48itguUyi29a1mG0gbJcTNKOOxMF+52QeMB30w/43ASeYxkCIO733JuQdBkM?=
 =?us-ascii?Q?JqWoesLURvSXhsju4eYmXLDC3n+kBV3qY7F7X3XdaA0S1yNqgXMjTQdCU6pX?=
 =?us-ascii?Q?Gacj6h2IwEARtzshd65pCCDkBtDjrnrKAP/+WcilQewqTKjUv0l2yvlSv1As?=
 =?us-ascii?Q?hhL53/jFnADXkA26IurO8151hec/Fo+rVgHRHgv6clxQxan2vS5fdQUt7JNn?=
 =?us-ascii?Q?P14iFffsWd3qw8EKYat1jmoc4OJNN6+K/IW7Saj+X9/5xfkZAETKXZsqcNjn?=
 =?us-ascii?Q?V+ICohuQ5bPqOR1AUJiNsVeFNEswV9iEQW0x4ujZ+46N3bjmCNDOkWxpD0JZ?=
 =?us-ascii?Q?7dEB2RAYIsdCMjdpzMErVH5H8ZjqVHoRlZbAw4zg8PimZUnsIIM5CGQoCLRE?=
 =?us-ascii?Q?oYvKLID5ESgPk+dDPXX/Q0ZUZn9CAn256oUG+j1hktWUTsjq4NJPvXJ4dk9H?=
 =?us-ascii?Q?bfk8bLtuV6aTw1Xnd+5/Yyt+SmKdkFoIAJnOHf+pzSJzvdFXpWT5uvght788?=
 =?us-ascii?Q?b9VdRRR6Ogv5Pbf5x3BeGLLWPal2H9TXli84ZQYDtBr7hNfjrscUrp0408m4?=
 =?us-ascii?Q?6zP7Qyar9g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb97073a-7deb-4066-a8ad-08de5d18b993
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:23:10.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBALSfAkPM9879pm9fhiWXkfYjyLQ7Ti/X0uyume9o0zK8ODGNQW4maiyRggH1L5oZT5Otk4fd4EMrHeS5FrOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827

Use checked_add() and checked_mul() when computing offsets from
firmware-provided values in new_fwsec().

Without checked arithmetic, corrupt firmware could cause integer overflow. The
danger is not just wrapping to a huge value, but potentially wrapping to a
small plausible offset that passes validation yet accesses entirely wrong data,
causing silent corruption or security issues.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index a8ec08a500ac..71541b1f07d7 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -46,10 +46,7 @@
         Signed,
         Unsigned, //
     },
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
+    num::FromSafeCast,
     vbios::Vbios,
 };
 
@@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         let ucode = bios.fwsec_image().ucode(&desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
+        // Compute hdr_offset = imem_load_size + interface_offset.
+        let hdr_offset = desc
+            .imem_load_size()
+            .checked_add(desc.interface_offset())
+            .map(usize::from_safe_cast)
+            .ok_or(EINVAL)?;
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -277,26 +279,28 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
         // Find the DMEM mapper section in the firmware.
         for i in 0..usize::from(hdr.entry_count) {
+            // Compute entry_offset = hdr_offset + header_size + i * entry_size.
+            let entry_offset = hdr_offset
+                .checked_add(usize::from(hdr.header_size))
+                .and_then(|o| o.checked_add(i.checked_mul(usize::from(hdr.entry_size))?))
+                .ok_or(EINVAL)?;
             // SAFETY: we have exclusive access to `dma_object`.
-            let app: &FalconAppifV1 = unsafe {
-                transmute(
-                    &dma_object,
-                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size),
-                )
-            }?;
+            let app: &FalconAppifV1 = unsafe { transmute(&dma_object, entry_offset) }?;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
             }
             let dmem_base = app.dmem_base;
 
+            // Compute dmem_mapper_offset = imem_load_size + dmem_base.
+            let dmem_mapper_offset = desc
+                .imem_load_size()
+                .checked_add(dmem_base)
+                .map(usize::from_safe_cast)
+                .ok_or(EINVAL)?;
             // SAFETY: we have exclusive access to `dma_object`.
-            let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
-                )
-            }?;
+            let dmem_mapper: &mut FalconAppifDmemmapperV3 =
+                unsafe { transmute_mut(&mut dma_object, dmem_mapper_offset) }?;
 
             dmem_mapper.init_cmd = match cmd {
                 FwsecCommand::Frts { .. } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
@@ -304,13 +308,15 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             };
             let cmd_in_buffer_offset = dmem_mapper.cmd_in_buffer_offset;
 
+            // Compute frts_cmd_offset = imem_load_size + cmd_in_buffer_offset.
+            let frts_cmd_offset = desc
+                .imem_load_size()
+                .checked_add(cmd_in_buffer_offset)
+                .map(usize::from_safe_cast)
+                .ok_or(EINVAL)?;
             // SAFETY: we have exclusive access to `dma_object`.
-            let frts_cmd: &mut FrtsCmd = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
-                )
-            }?;
+            let frts_cmd: &mut FrtsCmd =
+                unsafe { transmute_mut(&mut dma_object, frts_cmd_offset) }?;
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
@@ -356,8 +362,12 @@ pub(crate) fn new(
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
         let ucode_signed = if desc.signature_count() != 0 {
-            let sig_base_img =
-                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
+            // Compute sig_base_img = imem_load_size + pkc_data_offset.
+            let sig_base_img = desc
+                .imem_load_size()
+                .checked_add(desc.pkc_data_offset())
+                .map(usize::from_safe_cast)
+                .ok_or(EINVAL)?;
             let desc_sig_versions = u32::from(desc.signature_versions());
             let reg_fuse_version =
                 falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
-- 
2.34.1


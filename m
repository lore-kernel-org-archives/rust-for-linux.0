Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18431D380;
	Sat, 31 Jan 2026 00:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820984; cv=fail; b=mtDzS5K5XHzvNRTeac6ONDwPFNGd6tJsRa7BnlUC+i4ATjfnsYqwH4rFF9ZQyjyRiITISH1pB6D1Nq9RrBNz5b5TBUDgF1Gq6/vm5Gww6euFbzlr4JRTd8RE4ZKS0G288hcD/rkULrAxeB4EW4U7M+bfY4g2HTFDypF/iC6//UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820984; c=relaxed/simple;
	bh=syFwAijua8IMSFioo+VsXmS+DKvhemgY4REzOFoO5vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WiWusyiZZG+K0OtmBtH6bw8KrNeTP6f+o4KFP9bGmVowmC1Lh5cF1r+grHddckPoPmYAY0fyB+8SR/YBXJjyxLsQxeMGqrRhA2Ruhi6sFbAz+aWxudt4sPOfnr3f3P5fLCqfNHlOIyWhVKAR8k8eOpZLPhmxa6VV7nhwsZxRDJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XOwmD99B; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XOwmD99B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6I2eBKY0Nc0f1YHfD2qF1OZ15LLobrVHhW47kNPAi8Cxx/UV0TCCVoBrCmsJWYChFfizfm7dUDOrOefhiI1tu+Vi5bZovpWlPO8BGIw2O3pgzYUc2QsxQUk++Bw9L9jbj8+yc7qQ4JLX2GxA01eumanZy+CqGoO7ZODJ/rYcdX8Cw13MFYrSprAXKkWSxiW6oMdbSNyKCnAaknwhm+DBywd71Y1VOVO8ykWtUWJ1gv65tau8nj3EwUXVzhXjzdShJkVFzqpEMf6DB1Y0mCB97insPyphOsxLFNhRqRkTRtKv7woNZ+bRo4haEmgc6CMDazRCrtOxVNNrTIpL5+RFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN737xC/wGCpqIIMlfz3HP/y+QKfhgVQUn9LgLt9xLo=;
 b=MlGP9swY5dRhxgj+3bPxcyCp/rUFk9CCoVx/ZZVmaFnu1bRHIZg53od2nL6nRfu8paYt+/j8mUgVvKL8tsTYj03JnI4QTxIR0ZNYX4tpKkFpagcax5uuTCav2KVbTH8LiB8W+KVqBx5z+6hAeqFKDOMkcw6sv2SuqBzNMcZJnWSWq7kAzMfFCPr3eVmmpBvc/m2wbhsAyvhR1x1pSDSbB4sikAhWieizKxlCkS2kSatTiXiWlL2r91AzINlrX0EQEPiRgUWDAGdS/AuUnOpM9MGzBo6FeAQYg/eWCN9uacYXdkr8fZzfULbVwDCTuWcROr486SAmncmaSWo5E+CmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN737xC/wGCpqIIMlfz3HP/y+QKfhgVQUn9LgLt9xLo=;
 b=XOwmD99BFTeXhuYL4oZPwyosSKB2HZosuXLintg8SNjAZH5XvBS3DxbU3cwGcC7rq8RBJg1qv5JCvFwbwrYhB/3ZNdi58w+oXOumukz4iHIQgFSf5weoGsSC9WYQUKZ7mpSnqdzQRFszewU6MLt61btLVMGX97WfEurfcYbpnmUnK23RZwDnQX01AULTIIX5XU9z/lDNtHhnAl8bEvF0M1ZnQ4dlU/TY+yNexj2zLctkwzvJ4tA+Nn+qXgnRUkLQpqr35QUTvafcaXz8GU39teA1GhuF7K/hW+Glhz1CF5NHV6NJSW4cMsfhGgfGO/ySqX09qESEzpA0d10IEp0aSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:14 +0000
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
Subject: [PATCH v2 04/30] gpu: nova-core: factor .fwsignature* selection into a new get_gsp_sigs_section()
Date: Fri, 30 Jan 2026 16:55:38 -0800
Message-ID: <20260131005604.454172-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 38631f04-37ab-407e-8ae1-08de606388a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cQlWyJtd4PFHnQfdFYubvUVCatajfKUIuzATnV/ckFouxZ6tRBTR1NAxk/qM?=
 =?us-ascii?Q?KbaiNlAjTgTpDQBNfXLTL5vwmKmzKUdKmbFTKOYwljBtEjKRYHX4M25F2vMZ?=
 =?us-ascii?Q?k+Md6VLFgHb1jp4O8Wbg2HtV4cIVeUcwgma6J6Yjnc2thSXgf2prGVDto/hp?=
 =?us-ascii?Q?OaEOdu/HG16RPViiY+EgAcMgGRbAKhkYhMFgQ9G/2eB1AI/YLcKPVcAAhnpK?=
 =?us-ascii?Q?o9vt3d/PWxvo6T+KQiQBWQ6gqYZ6qV0+526IcpKrY1cLh5v3Vj8ywdAI8bmX?=
 =?us-ascii?Q?6DNQDh3iSabRzLMbm65pR5luRM8lbWxGCTTidLUYEQicTRheietencp9ic1y?=
 =?us-ascii?Q?C6uod+mJAIUes7FZtQrVYmeAfoaAwXck7r8WJRFiogbEJqCaAbCsm/vnuGJf?=
 =?us-ascii?Q?cw5UqVb7V9QwRXdXynVCgpYW/5cD42knZhWk3qlqDyh4vdnVozGWxTbq6mYo?=
 =?us-ascii?Q?WrhpnuME95lxr+c5Ju6IRUavUXYBXR0KXZX15bdyPAQTysWikaJC0q85+U63?=
 =?us-ascii?Q?5NEubidCbk+xZQUNNDbgFLkQnQjzMtmoc+AVB1tGEwZ/L4atNTAhjgQlDnPM?=
 =?us-ascii?Q?7pAtrW68KTT3cU+qF3HVn9YF4sKB4Rofr49IMD3P44qmIgHPriqXJb8r1Em8?=
 =?us-ascii?Q?PnDf0rrtL+gvlWh3lQ32Ia9n6ie2AIex51Vhg4eJgo1iH1XRfAHK0yEQM/Uj?=
 =?us-ascii?Q?fsSLH3dcgTzPOGhv2YV4TyPRV0XL07ro7AZ1dZT9rZVEbNvBUKRHR3NBG9ZB?=
 =?us-ascii?Q?QLE8dpNHT2Rwg3+SDxIGZfqidPIQ/kOFAGPVojGxOSYUh0JKHEFPLByPsNAC?=
 =?us-ascii?Q?exm8Kn9oY61Vw0Ap83rRZ6ludVdjSbAQt5qUlzuGxk+aJzkxP1gur3x3CROY?=
 =?us-ascii?Q?9MRZSuvpovWWJka9Fcg5Vqy3oe0DituKzd0tSh8YHnLbGJvGV5kYQQwMCYD4?=
 =?us-ascii?Q?AkLIjBKq5QAPM5t1aRpnmCH1ocRgmK1ntf3aDJzTJipXsVsGYGYCXE26EFmk?=
 =?us-ascii?Q?i84ZoXc9nGlgEX9jOiDTbMfpzl+m6djQ2/H7w7PtTTVPcjrDr9ffwnORHsOA?=
 =?us-ascii?Q?y9SYtbDHdA5x7kVwy2oi/N7GPoo1/SzHh75fnAmFuiZt2jZu6E1P+Wdj5SiS?=
 =?us-ascii?Q?rDQJ4plWevZS5cVUHraz1qsKdQZC1qPC6yftkkwL50pnRmEVVSv9EcFKN0gi?=
 =?us-ascii?Q?eo9fy3Gt1in0YD3WiBS4IgfKT11SaN1qvXXyXMz3P4/hSX9jelp2NSMxJ02c?=
 =?us-ascii?Q?E0IRX2FzfCCQrR8qa+1yf140gEdywn4eRBL7apCr3xPFV8BweGiTIFZGXvsZ?=
 =?us-ascii?Q?31ITaUVO9MhtmLl4FLIjpLZnKLhEtwd64b4xE2LsezAoCya7F2c2HoacOtPw?=
 =?us-ascii?Q?6MyqrM62ua0X9/RnBSnQUrA/8U1nFptk8eK3WuA5lBtP2jNfr25HmzYBOuWD?=
 =?us-ascii?Q?Yfnf92sRZeRZbL7321Mw0Rz9LPVSMXyxq86vVHnBrxV3Pdw36RGYCUObYz52?=
 =?us-ascii?Q?kLIWVOSWR2GHwK+PiN/hY2uh4Ca7alv/qCohUmSkj0Ki6skuGjCjGHgqpVmb?=
 =?us-ascii?Q?RnasUlTNo/rGMZGGguE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ruIn3Zu82jARxkEqT2mvGMizVHLuPyDV1dUwbf4iN6qOyimzCbzM8cFza+Mk?=
 =?us-ascii?Q?zEAr3aNPiBU8cDUm1XUJ45bnNydEc6lA6YrruaH3v8KzuH0iiu4dmNHYxGly?=
 =?us-ascii?Q?EEquI74rwrRoX70X5utPzjYI6AG0Qu1iEgL7YFh8LrLNizjkEqyxZSX87R30?=
 =?us-ascii?Q?YZ7VG2TSaAlf1kxdx8DduH9qSTN8ZG7kfoT6sAu/yxgqhi/frOH5EPtm5myR?=
 =?us-ascii?Q?Btyi5IHewa1rqgetwnpfVOlAuLcvVQGJFm5tcccgIejndYtN8z26M5FH7Kza?=
 =?us-ascii?Q?kuUE5xcKC7Uv0ZSutyVRSwLLKH9rVOE+X6nEg/qsUbo/E9pWN1KNoi6HKmjf?=
 =?us-ascii?Q?Oq2/GDVK1Uux04vBr1grB8jfmi3g8qKLDuEVJQhw9FVz1aNK9cwciVFVqhYJ?=
 =?us-ascii?Q?OhsSKnSVKI8VAqqIy2mP1I7D3ACavx5//Rm3+smMnoNg9ZH0TdcAfr7W5FRC?=
 =?us-ascii?Q?OInhJ5UTGemh7TAiQqXprvP/VsrGpe+i73z3GV7xg1RE3koXGqMLMeYkCTEV?=
 =?us-ascii?Q?wl4Xb0a7unV3bVig1diZrKxW3l7saj030o0HGn4B974Qxyi5KqOPHZQd/lbj?=
 =?us-ascii?Q?urd3ZDDc9itvn0It8c3ZbqEq4U0vSBYd31dG0/38ULfe6lJjakz2mqHuuLH+?=
 =?us-ascii?Q?flVRM9ogf6lcE6XlINBSbIVm4xLTOVyHCNut3VKa65Ljr+5YidAqodIAfxtS?=
 =?us-ascii?Q?yJWzePW7FiVkUAZtYs+n5hvqBndO9GvKNOWsft8rXi/VzWBYyjg9C0taHmUO?=
 =?us-ascii?Q?qHZJf83mRy7pwLYjRrGiGydRuMfBzapOaaxvqtVVWTsJYUm6mv8IWyKAVJUi?=
 =?us-ascii?Q?iZ9BKdfbIaTBwhMOkb+7GDFlFRrWh1mlwFl/RUzzZb2wBkqjQwooAXwUnOSX?=
 =?us-ascii?Q?p6gbL91jBnLVkPUsQ+YaZLLUQwtv9bimKM7BvwOUkkjPjWAmQnsl5DBrPApA?=
 =?us-ascii?Q?6c/FVPccwF1p2etF9RY/upeNcafk19Ua9KWPvKCmL/DaUuDzXrCtc2wWZvjU?=
 =?us-ascii?Q?uxzVbAxzli/DwllbE5hMFZKd9nusU9gj2JSpyM3xDJdk4E+1W0XDY0zWiNCe?=
 =?us-ascii?Q?uD1i/E6JfT3zrnJM8O2g+i5KdyiiXwv+AqDVo3ySF2gT+5qYiERceuo++Az/?=
 =?us-ascii?Q?zL/Gy0zXcxppLhZp3tKj/CQhA6gufo1R/Ia03whKJ7odqd2lvCcysbYnH7xk?=
 =?us-ascii?Q?h0cJMZ+vDyUR1UP9B5HLK7w/ybiQE7wYnAt6wOtQpbb/T4gzJfcV4QpGT6gx?=
 =?us-ascii?Q?s27kKxZGW+b29alwkxMRQiG2GGRbY/SpOhjqArHEsyDvR3+MQRQHOYmC+OQX?=
 =?us-ascii?Q?r1PmHFrVQLtVD168b3RZx4/Y3T2SvIneTvaPV9ECALHGwhwuAAkXg7CXbFQ/?=
 =?us-ascii?Q?M+jU6ngK7FmhyzqzRGh7EIGeSIAZAyQWYTdyrZbmMHGAjAocztH2V7P2n46c?=
 =?us-ascii?Q?ttlyId3565W5r/zTVgDM3EvzFnnJG/T2VAxs5VEBQM3IGr+Q/MzTbBDpSlvI?=
 =?us-ascii?Q?ikpkOD99uadamAhW28XZgnTY90L5SoXIoz8T5h1O1JifqTKv8mHbkQ/c9Zl7?=
 =?us-ascii?Q?T5rie8gXerIgix0sM1VXuJV6WM8EcxxZLtfR5lbHi5XUDjcmeFJ2N1wthJZN?=
 =?us-ascii?Q?MMPRy9d2RMlAAByR0GRPng0ahrAJTLtlq1TCpio+tFddh6YMFc8I8PqwIzWn?=
 =?us-ascii?Q?SzLqpQfPbSQETPmEMhPoB9WtF0UbjuzZHigle4CoeY+zm7oMzi3p5TPjzgRM?=
 =?us-ascii?Q?qoWjd++28w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38631f04-37ab-407e-8ae1-08de606388a8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:14.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNcLTIcyU7O16m0TtUqnm6uBWiP2089c7nUBXX9XZ6Pmj0XLC/YzjDinez6dPO3ug2cTCP2hT63BR0gQOCnd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index a529a5f1c3ee..072881e0a62b 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -148,6 +148,36 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn get_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => Some(".fwsignature_gb10x"),
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => Some(".fwsignature_gb20x"),
+                    // It's not possible to get here with a non-Blackwell chipset, but Rust doesn't
+                    // know that.
+                    _ => None,
+                }
+            }
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -213,35 +243,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::Blackwell => {
-                            // Distinguish between GB10x and GB20x series
-                            match chipset {
-                                // GB10x series: GB100, GB102
-                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
-                                // GB20x series: GB202, GB203, GB205, GB206, GB207
-                                Chipset::GB202
-                                | Chipset::GB203
-                                | Chipset::GB205
-                                | Chipset::GB206
-                                | Chipset::GB207 => ".fwsignature_gb20x",
-                                // It's not possible to get here with a non-Blackwell chipset, but
-                                // Rust doesn't know that.
-                                _ => return Err(ENOTSUPP),
-                            }
-                        }
-                    };
+                    let sigs_section = Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.52.0


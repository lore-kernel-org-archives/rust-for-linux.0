Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8834FF65;
	Sat, 31 Jan 2026 00:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821011; cv=fail; b=ZEIyzoU0TxwYJWjRv09rvWQFPnKvtevz99lPJ8PEuY8KAoKrXKjHJetR4q9qUvY1boznnC90dYcaaBg2OdHEsUcY2UHdnswtEKa0JrKxGupnkxYiUQVySR2OQuBlHpNzOw7f53hNydNw292t3sgZV7Zq7kI56b39K0YwK7OJiZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821011; c=relaxed/simple;
	bh=68hr56izvuRTxryZ1/RRipRA92fNlGzMaOhd5X3xxI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JqnEP++tGaOmRDyJE5M/WHbrx2t9uvTChlEFa59DYB/I/4NhCSloQy5uiJ0NmepmdJHKlFxRhGzcuHnoG/2HqfA6HZfQsSOywd45UP7VtZwnHvH/oLKbhHw7/tPofvY5QENiDRW1VvvEp6GQax7oGwulXEUCkdIc1s6TqNX0qj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E4lwwPMJ; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E4lwwPMJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3CdcDMB6W0zHDjZGmgzT+Xp41t7PuXh9TVko3ZYIU7nH5kI5nFiWoz4AvOxrltwBYpQwf2ya3PGYD4l0w0dFz4XrkBX1KBJLWNiRWQPx0YEisO9XmflD/p8VvkAyGUKkbYALdFlh8YIIh6Qbg0gTOztykAHjBYl1sF8MCK9iIuRQFXS5yfazyIFv6GB1W1ipy2mmEYscHV+E5L7DcV3QZAYHMet8XHK98orBT6lCiUMzFizuH1afhiU2MsLg/pbmCzv+gwdxvngxNt7yonV3srsxO/zCK2GKyJzR/c7qWqFemErlPJGK8JPuXOxDC+hX3rnevtnmxmykFdbQ2vBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx4DOC+jf7b1eKY9QSY14wZNgJp8AYoJbRSNmNPapgI=;
 b=YNUxOFZq8YDtJznuIQcvZg28l1QxR8FNJrszyvUIK53wDpDQvjbNXJVTy3LXDweBzG9B0V0n7srf0rI4yqHO4mbfeG8TgqyllW09dXKOoBshEWXR6+M9Rb4LxzTC8PiPqCrW1/DVlKj4QDB+zkhpG8dZHXf50ehfxffLd+rG/xxtEuo/M8WindRlLryM6GzMgDNn6IhNwc180xFe2AANGyVeG3l3UhOhBVnv4Yk7AS0JBMZyRT46P94bnLnZq6D5BhGF90gCGG1LlML+mqrhkZQiwlz9VnkuN8jCFO4PItxBXkG4u1CjTOkRufTw0whhU8Xu4GQm2HTHvXepWMUKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx4DOC+jf7b1eKY9QSY14wZNgJp8AYoJbRSNmNPapgI=;
 b=E4lwwPMJ+mfGkM5rPsFPw2DtRlw+RU6mpLtwmiF7bMOuTE00o/nf56Q/74eW6JDBZHMc3QwDv3Xtub10IGaq5WvFLJa72S/VB2rMaVRTM1rFOTnFgT6zd0Vvchr2mY3eFtNC04iHSpC0nwaAu47G3ty5Qrtv+tpVt7SFQyMSf0P+BsRGHPIVRxCkhMTIR56dVJHMo/OKPu8RYnqNbCrQyrDQXlW0Dbcn9Y1iIvnR6MDoEy2aiXLlT9+n7B8glMMmTRoCUipS36+EeznNFPH4vNJR3uWOdqJTcf0JalNp/CrEHTMkwwFEEoDgMGBIUUPridfYfQDlYKOKSXygTEsBkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:40 +0000
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
Subject: [PATCH v2 25/30] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Fri, 30 Jan 2026 16:55:59 -0800
Message-ID: <20260131005604.454172-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd25e2c-3a36-4ce9-7982-08de6063981d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xdv+pzTnu3kUtK78SioRmta9tYehu+OgKkUDyn4SkOBpHkLIWXhcUzpsJwvS?=
 =?us-ascii?Q?zHTDyorb8t3jhGWy3nS0+4zaA5q8XCCbG6a1PGnORlS+oteEzx+2/c5Xns6C?=
 =?us-ascii?Q?1cqoDL/n7D40Rb3c1eAt3U0qt69RX/03g2CLy4kxniNyk/guPOCI6SJ4xfo9?=
 =?us-ascii?Q?UZsKDaEJXqDoRFgu9I5M4ZLhM0pAh8tHOSZi0P6Lh5ma4uCjgGwc+2rNvzzg?=
 =?us-ascii?Q?jFK3zqZpCpLgrh5xbrSx7Ym0jnWTe4x6LnGicUnZ0AtdGIU2v9MCdbxgAa4M?=
 =?us-ascii?Q?xQb2BJgAOj7BxydWTKjqx/DNs1XXMGUS9lRr2FkCwR1JRaAva66Zxal9RSrD?=
 =?us-ascii?Q?G4U5bURXJ+uc3wH7HQWuKYG0JAYJ+/bpJ3RUlRAD/dDCFKCRECrR247nhVDi?=
 =?us-ascii?Q?DDT744GQ6QGQcrrbIudpbp+bh/V4M3+cuf6RRSwxWdOQTyuBnbbOdKsL22YI?=
 =?us-ascii?Q?K+Gh2RR004akMKLZZ/Zomho6xEpnDiZLFU0cBtYw6tWE69pegwZzdy23v7B4?=
 =?us-ascii?Q?G123kQndmaf8+gafa6mEt4mSOd02ddbg4uB6owPsn3G6QUBgOVpTi/T4CR6b?=
 =?us-ascii?Q?wcTfH36tG3RrdH0v+1ailNgVT+D6m2Zf/wxt538nv3TWK9UswDb9u2IjfxUg?=
 =?us-ascii?Q?2zY8Lm/4LVHHt/ru+kPYJGKYgCM11V1leoYGbNXra+7477dQ0csnpLXbEXNf?=
 =?us-ascii?Q?YX/F4fCCBb/8YhHPzAGUwlyArlw23AmsOY4euZ+97l+liwSQ2eVqwcChROOy?=
 =?us-ascii?Q?uggPAd4cNEAr4+KR5ETNCcILvbEFVRnf54sfTbAtA3+7yXUjh85/4LkX9fZ3?=
 =?us-ascii?Q?IfEjdaejYpHgAee+Gmr142FHZJBEnwVtz7xpsfoWPHIwV+6Q1M2dg+MdhFSp?=
 =?us-ascii?Q?Om4evSYvC+nXalgJDrYkt19YOSwVcFNq1lr7t6BAe4JvY12PTi+0vIb+AQ0l?=
 =?us-ascii?Q?5P6k8c9UqnGJODT0BBeLvGJp5+s3sQ0cc0OrrpXLkRQfzb5bhd8m388uHtqQ?=
 =?us-ascii?Q?oL0VX74nqY8Hvps/E7AaCIR0Mt2ysBpy+pVUZhGQPJMWXosigdllvPTuKSVl?=
 =?us-ascii?Q?PB9bLJotxhdOFQpGFWPjxHHYhWSJ2EzGgeySRVGAKEG1oHhbcZz47mdJGjBZ?=
 =?us-ascii?Q?hXGmLoy8tauy46RTLtziSc9MMg/aOi/U6xm1T6xikxu0lh7AACSFoE55ngt5?=
 =?us-ascii?Q?Ih1Ntjy/RGVbqye7WHjjGoH6QV0oSSttoHwbRx5hPW0ajLHqFzg6byYzi/E8?=
 =?us-ascii?Q?oGEPMbE3c8KBFwiqa4euLbbZjJ/5Jnr+sp5yDt/UfHVxa2lMmEm/gA8V+hlO?=
 =?us-ascii?Q?J6pg9swrXJqEiqxL3zUaO2RU//7JwPHZeMynnB8Gu8iSmnkYe38RjSBBQoMf?=
 =?us-ascii?Q?+cz9y87IPHUUeYlkxGaPLzYCFwvEfsUujW9gKEE3JIAOuCDxyER35zQAeHRt?=
 =?us-ascii?Q?Bt6rYaLXfKc5uFL/OX/TplMwgyK50R9CkVOtvrf2WsTcCC9KXGp6YkQVcIpH?=
 =?us-ascii?Q?9E0xu/4bFNCKfA6s1m9vPBf5Ua6/ZE752TV+q1ZXOvsPHhVzKTQJjtWxkLow?=
 =?us-ascii?Q?u28eXKnMxN8Hu+vOLPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?86gKX2cSuStBKgTpJNTmlGY3fu19VEv3ALdfZWQdXFEfj5UpuqtY5r7DCEgv?=
 =?us-ascii?Q?QU7T2+RuyXnedEx9x4TzSA03FGrNMQRrQ8BzWX42F2WtzhlN0LJgz6RGMjTw?=
 =?us-ascii?Q?gxe2+HLYZZa2r3qjwlIx6WcYLuzDpyGePWKQLQaKiIVkYql52AEH+zNwQknw?=
 =?us-ascii?Q?w1NUg4WJUUftUKsXPHUQyUbbsMYjdZS4genWPv1Wtfd9voHqlQh6ZK/U3RbL?=
 =?us-ascii?Q?baIAGGtkX73/vdRlwSrDg5oLizDw/sU8UA0HiSKrXmzMqjnBlPxATLhERNRp?=
 =?us-ascii?Q?4KK1ZDZNe3HOHlXrwya2+dF+erjVlTYAnL6T9S7a5fRq+YmBVTV6IEvtECc9?=
 =?us-ascii?Q?LOB3zR6+8nAmhiV+J/wUGVkZtuWaAJRKiXxoiZ7lZC/JK9Z46UFfczmgLgZf?=
 =?us-ascii?Q?4x6Va5HYrhjIT1RIRFc9rkoqZtJTJAa1bzSVMQS9VhHZlHd2yYOgY6MFDOI0?=
 =?us-ascii?Q?ds1EjPfpsByZdjHwTKzx7rRNRpNs9pGdxliEYSpI133zrIZxkImaaq9aK1w7?=
 =?us-ascii?Q?CiCncIJfQHAYjxcQMfCNX9qIxvNjkzd9hcmJJZin8rvrSc/T0bshg5xlblx3?=
 =?us-ascii?Q?bIcRB3GAJ3sCS6Q1ywQFbg2bXkbtZu3OEz0lMwIcjtkuWzZ4MnxZXFoqfmyv?=
 =?us-ascii?Q?yOJuxRh2Q5IpzAWQl6or1d0wj7sF22MqXBoNrd00l3asxgNfnm72GAELdaxX?=
 =?us-ascii?Q?Tl+4Pfpph+5LcVrohYBlNdaaO3MId3MzL/LOAIUu3sLVTbrQJnOlusjUNNM3?=
 =?us-ascii?Q?SVm7RCe0h4iqL5rXRz9EhIiK4ihyshewYlHHg0iobTjc2CYi8gMJPf879Mve?=
 =?us-ascii?Q?yMehE+p6YtK6BhwCymUVz09tbuQ25GXm/hsuCVEq0wLKYZCB3bgLYCZosici?=
 =?us-ascii?Q?ddbpT1a3sWx/LJAcP7lr9OYCByj99rj12P+5eua7BNPxwHy1ucNB3wX9ejkS?=
 =?us-ascii?Q?bBcFhaJAKTSRIEGrgwrWZOqFMqm98Aqk7fB+HbU+aznVIfw3L9U6C8hJXcWA?=
 =?us-ascii?Q?fl3+iKKYvYNaq67VrFwTNpbrFIOT+I149DDCI7jsOM+1yymjeTlfGwVXYxvH?=
 =?us-ascii?Q?heGL+dvPdXXKZikVj5fytN6k62j7wgSN6UtCh4CrP7/nJDj/N/UV+cX7ktdd?=
 =?us-ascii?Q?5qjINPqBS42eoGOLYhOzhAyJ45GqeWibBM8WBqK5X82rzqsKR+aD7Hu/U2xJ?=
 =?us-ascii?Q?cjIVxrBg4AFUfTIBne9+WZ4QdCB+kd3cR1Rk/zMTf/bOMLHnrJk50idJxsvI?=
 =?us-ascii?Q?HgM+JHD2m0YRSYtGe6KcP08EJiGjJzgOt0DQNF3zE/gg0esGJ3QYaq9pebCt?=
 =?us-ascii?Q?AI8SCekz/cRc381pCDAH5cAnj8jp3409jy1sZFgb6+ZoZGFvI++7m3j85R+P?=
 =?us-ascii?Q?d8HZoF5qGM2UysSaUbNUHosLOeC1nJeZgCol8irGs2y+bBiYLoYGjni3yqk0?=
 =?us-ascii?Q?31QvKKDfiS4XII20eKtiTKBcbmWD19v84T1Xm1Gr0vcJ3lvbehXTbZzGb67M?=
 =?us-ascii?Q?m7YizneFrLeou6GW8viX0U4v19CtT94xHmL2pYiJsaUWOaKRT7qyGiCyGTBC?=
 =?us-ascii?Q?hhfny55rsxSrvyXF+tXnwt+RP7kBqOBaAl1fb7Lt01Pq+aGcs9gX6nAt3+mQ?=
 =?us-ascii?Q?wj7RRiuesBsPRyN354bqRDg4mnZVxk2FQSZH1S2y4XzD/iCwHTy9RW//dyc8?=
 =?us-ascii?Q?iEfnGipKJnJnvGy44ANaxgbmAQTIF0RMiLOVA9uBVr+fB+32MfBvo16/QKCm?=
 =?us-ascii?Q?CkOGOln2KQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd25e2c-3a36-4ce9-7982-08de6063981d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:40.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yggLR/PfHT0Ub6Cm8JudTx8CwVePT34/kfG9w9Nmy4P0z9N9bYGnzoiaCnMmVfXmhPvoxx8h9n/lSG3b72zZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 55 ++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 086153edfa86..0d1d9eecd77c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -49,21 +49,41 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * SZ_1M as u64;
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * SZ_1M as u64;
+// Blackwell-specific minimum heap size (88 + 12 + 70 = 170MB)
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL: u64 = 170;
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        if crate::fb::hal::fb_hal(chipset)
+            .non_wpr_heap_size()
+            .is_some()
+        {
+            GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> u64 {
+        if crate::fb::hal::fb_hal(chipset)
+            .non_wpr_heap_size()
+            .is_some()
+        {
+            GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+        }
+        .align_up(GSP_HEAP_ALIGNMENT)
+        .unwrap_or(u64::MAX)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -106,12 +126,25 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_BLACKWELL: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
         if chipset < Chipset::GA102 {
             &Self::LIBOS2
-        } else {
+        } else if chipset < Chipset::GH100 {
             &Self::LIBOS3
+        } else {
+            &Self::LIBOS_BLACKWELL
         }
     }
 
@@ -124,7 +157,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset))
             // Overhead for memory management.
             .saturating_add(GspFwHeapParams::management_overhead(fb_size))
             // Clamp to the supported heap sizes.
-- 
2.52.0


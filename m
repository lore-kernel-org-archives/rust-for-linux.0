Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B1030C626;
	Tue, 10 Feb 2026 02:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691629; cv=fail; b=sGrS80SqsaLUDeXmP8HkGme3kCuw8Sp8F2aCc+oVWlBCWmtKSJ5DFZ2R50HvJZx5xAOwrZPPub47WW76Z49FCi9wGiKyRcZNXCOhxitzZ18VBbRA6Ectt7g/coJIDiaaxaGkuWaRwwibYiwfrb8FRyOIX8qA4JPx1C4JIBWvjrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691629; c=relaxed/simple;
	bh=6HuMR2s3qa2r1yYi7tDujPj1GQBzHUWm8jlz0rY5DFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nzv69wynzPU2642HU7EXJZZExWeMMRSxy/dEiclSe/wTZ0KUzs+556JTBCXO0y5taaKwWrQ9MqsKOmdxGb2eDVouMJ0kKkBVlpxyFAzEix7AO97CWBkZDM6KcnuYdcZepuf72i5t/pxqCY+yetaxmD5WqtxyPCKXMUSjmoL4O5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MZDzWVPY; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MZDzWVPY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzWEVRhqAKTmRPFtEoZYT9aunbr9/l98j8V3qZcxVViHkQ+MsJuVbaFl9XOUrA0FAE92gA9B5pQq1jWg/xkG7eLKqfv8zV8wFYBTjh61jo5tBb8ozFMiipCfVd4ewgopmV+At2bWDljhftyK1Q7HpgeU/snZA56ju7iayBs8JlkcG0NWwqSbwJ+Oehd9725x+5oeXmEHYR3QS8cROwrU0x4eGqSWvmivtUvBbvVS4GGGzbHiQ/IH+GjyTnIcU/obRQv2OBdtlWDjniAH27lxIJIDv9e7QO7dFwec4xZbKEFVo8noSiuCIC06UKxuEAX6FFeTIW4Ve7CkJ9PtDFDObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szxD08PLhrTsjfQ3c36CZL5KOqsjc1bb8neukCraPgM=;
 b=bMJjzoaogzsk0azWFmWD2ZdXFtlbacb2DPkgzrUQ99EJlJp8VHpnw3O0JI4fn97bzmg4FgjtliP5rJgF22kzUWmUcbE/MVLu4xl8UWQdeNu4incxr3MiOlyMR4+sZpyacTxjqQRQikH96NqoSE/iMOEWXc9mMkmCa2cUf8z3Sqimk3Xjsv+1J84sdo9IswZnYeFVC8lt5yRdr5rHX00vZ5NeQnClpWwMdOm1TsO041deirdnjwzxzf72RwbEkmdlH+a8FwqSYSqwmw3fghdHJKNWYTkH4/fqBQp7Wtvnbqy1qwrHcD1HqTrhvBdEnDjutrQQX9xGO9RHwTF0hfYaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szxD08PLhrTsjfQ3c36CZL5KOqsjc1bb8neukCraPgM=;
 b=MZDzWVPYioPPiJZikTrJpLqYDLhYmMj1LkNY/E9X6xdf5ZwWdYbOm/G3RR8MiTnCFJK91OjPej/gLxnFluos4Nk+/lbFswoDjDrQ/n4+doYFQuM0tOxzaxG7O9U1hc5ifShnJ0O6BqTcFwS3UdVh2INRbAQyFdMgoGybF0ZBM3CXoZZr5+KVg1ZI1luzJEEzxersr8Md1BFlkVqsJhy7gTsA/15mkZyI6RwaEGuMfTVy5tggmD6viW3wI+cQ/XUfDRxKc9Nf3ZRVBltsrblBZuC19zzlrdI21gtJDOCZJagABEOoYjxAjLqJoqFfhKS+LI18e1qVRkaMYy6V2SRsPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:02 +0000
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
Subject: [PATCH v4 29/33] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Mon,  9 Feb 2026 18:45:56 -0800
Message-ID: <20260210024601.593248-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: a4498689-edb1-4dd9-d6c0-08de684eab5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7NH0kwhWPid/qpq5Yds1KP6ICMevwNyTM0uGyj4jNTR5t8iILyiEbC2Pa1y?=
 =?us-ascii?Q?hPaa9eAf71GGSbkiRkLA0RquoAzGPDCsedmOuh8MNZ1mv1ag+jb/iV3hK6zf?=
 =?us-ascii?Q?BsFjHu1hdhdXmL/muGlIzbwWlcJb8/LvJP2U3WyyjdNVUTRU7h43L1oPfAqB?=
 =?us-ascii?Q?lVh495KYZh0JK6Zcfx7NNIeCvvYpvPbFxkIJex6rjQVcl9VfUW4iidUSd3zI?=
 =?us-ascii?Q?IqvS9bq0Exfg/Ays4XWhy0A7Cdl+fdi7KdVYGnrGslHl2Cdgr2g3BUzNwoPp?=
 =?us-ascii?Q?y/N+oPJNw3d4+N04Y1Od97eluJUIJ0oHBWzp9RLUGEGYa0q69uq4G/jvoCaR?=
 =?us-ascii?Q?SQZxoLvG6Dc63pkvhgWJ7x26aWk79i4oK4z0Cz6L9x1XLYwKvtIegYxbFloj?=
 =?us-ascii?Q?MmZ9797hC90UBQLribjukp7BnTRVb7Qt07atOktYD15QoXhtAmLx/BNnWjIT?=
 =?us-ascii?Q?WiMq1PFeoPnIGe0YS/Hvt0sU89FQlasIUuEts6/RoW2JsbWAXJLMf8KfzbRx?=
 =?us-ascii?Q?yVIgBQp5IZQBiHT/yrKkR5F+w4wjxQt4HQ7Hu5hbowzUPhLEPcBDIpEeIcuE?=
 =?us-ascii?Q?5X8ItdCDkuknGF7tPcLQKOh0NAG+r0ritypsDmu7r1Dzw94XnMRAJ6tivVkI?=
 =?us-ascii?Q?ZUlwXhPLDP2NfvZaxi74fa86USEsHlvXFcP020w4GxQhH4ug3j4Xo7l4jFRq?=
 =?us-ascii?Q?ibCaKMEtg1aaKsq/56focv3dDA/kyYoV1CJ5zCA7fEIsAm7YloFMSnhVePG9?=
 =?us-ascii?Q?4ro4FlEDdCQNc0YD6j2fRyslKdzspr33hR8RWbtxXy9lpxm4H5ehWomAFwUS?=
 =?us-ascii?Q?T9ETDcH5znK5l4ogBInZ6XXSOb1FFPOBRbJZKCzfj23lGd8Lz9aZvdGV7eK0?=
 =?us-ascii?Q?60WsHIVGrzMedaaG+pVUcbkKrWj/upBvnGph43mDCfMmUAZLeQYSl1bIvlUH?=
 =?us-ascii?Q?gNjTP8ztX2016R0PW9KKQMpIxbA1T0I05dffxYCZ5ci2CYFQaiNcJpJVCZfz?=
 =?us-ascii?Q?7Z8BflstpILyuPNZyopQNv6DwhnhhGospJknSmQAO1HS4YMtt2XUsBs61nAa?=
 =?us-ascii?Q?QcThCfB4Ps2HhYNMFAWCts/iheO6PAWrq2pAWaqkPa0N5huSB5I04ay/sd3E?=
 =?us-ascii?Q?ylLFimO4jBSFZ56wf+YEWvzljke0yBnO3oeafVT6qBoyjzk/tW7LbQJtOwNl?=
 =?us-ascii?Q?9pDB9PMotBr0JfVQxc9h5sZHGQIFT3xDssQpGHSDAr7j6S+i5Nd4mD9mDLsG?=
 =?us-ascii?Q?H1Ap8GXRlHGutRqgw/zKMcNwIWNRmgXzxo7Mm6j60i1wPuwCzFglW2runcdg?=
 =?us-ascii?Q?GfJXZQgBF7hMMxKYR+qcB+ZXQ0iFK3uSu48yaO4hz1M2L7yzh1yjv/Hf0l2V?=
 =?us-ascii?Q?nDOR5o8Q1MT/9SwrUfeeTysVz+H6pQFlUH6O2WAJjvwnRHPwpL9Gcd7hDsUQ?=
 =?us-ascii?Q?QVwpVwYhoh7vNVRzwz8Q9/69YadhwIgyVrc24gTB/PkgL69EAMkpoJr491BV?=
 =?us-ascii?Q?djCTMQRY+dVl8T2zy4Hpz+4Vact5jhEDf5Wc0KCtU9cts0dMJSsEM37pO+aT?=
 =?us-ascii?Q?R3l2IgXrybdjfGT8GQs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M77Xfdwfqvf1zQ15Ky/EiARi6v/zKoCrcoqE0tJAhRzRh2jhiWflOFrLHg45?=
 =?us-ascii?Q?K1mhNSyt6S+hCG3zX+W3PhppcIzZaO112V0WLtWMYAWC7u++bRHBQF0de3lZ?=
 =?us-ascii?Q?UkImW9OOJ8rjyCf4wVRBXVTOk6kaMaX6jTA58gWXHoCAhQUbrKYCAtwFgfh6?=
 =?us-ascii?Q?BPKwyh1I5bOJd9e+yh+nD1pHn8xfv/lbejGVL0g+OTK3wNtmyYHnfEzDYT2R?=
 =?us-ascii?Q?WoNjeyy76Lux9avWhruPXoDouCQljA0sjdclR7dkdHXL6mrzfKKCxg35HKJA?=
 =?us-ascii?Q?jgPrpVNSAB8l3AVTCwPnwgbH1YRqwH7WGdNzqEiuVHPn0eG7gMtaFRNr607X?=
 =?us-ascii?Q?OYfdBwEJr6S7inceTG51bMX0wcRDt8rXgGia3072zY+3+3im3eEZ8+Qe3Ue7?=
 =?us-ascii?Q?B9kXsHK1XH7eTc2NMllPhFoxVamXKOPbO6jov7G7zGIxEReVkN8UeKaADFc0?=
 =?us-ascii?Q?BqqFVthRtqp2PJIxAfz874Y89bm35EkHmKyvqh6rdIK+Ogkv6vZfOS9AMtGO?=
 =?us-ascii?Q?PxpLjad26lslptGVFhBUUYDbO6Xx9eVVcMLXzD6BFa5em89b428YqZW6fyQI?=
 =?us-ascii?Q?yt687HPaKAct9XYNEm6/WsMme93R8cvJx7BM/ioyrZVVwASO8+CnIG1vN0vD?=
 =?us-ascii?Q?aP3aPcHJn1Y+dmLWUwW7yhA1P3xOMPhqXrc8x9Amli9Wu68YYjWqKWdt7mBX?=
 =?us-ascii?Q?9gHP+hw6/HA5Y3Ixy4WQSGOALuI3Y81k7H95seO583nIfTNcd/8UEiV3p/9f?=
 =?us-ascii?Q?NMiphBOb09lSkKweAe2x/0j3kL4J+//xDSVkewkb/4+9NUJ4XvOuH062nB/g?=
 =?us-ascii?Q?vFSg62Le6DeWwenZoZ1Xj2jWRMbjxf8+Gf9moJzue92K3sMCaUBzHsKp8sDz?=
 =?us-ascii?Q?mjKDoHPfiuWHKtLHeu89WAKt3Ahcghk48AH+yInFJgWjlgO1BJQiD4lk5sJs?=
 =?us-ascii?Q?8etoMnsiFhHfMpw8jRUudHhObrvUd+3H1eLy2XPinU1KnXK0vlndbzfRIf/r?=
 =?us-ascii?Q?sFzIr2GTgmPLypCK7mdRRIxudrV6YLOvcX6aMc0xDU2Sgf4fNMr4JT7BoQNq?=
 =?us-ascii?Q?LETAkq1ZdJNtubCVutC5HIqL208NWUJDWmKAcp1Xpks+hengMRz1mz4/NzLh?=
 =?us-ascii?Q?hw/A1bAH/1QYOnJgzAFt9WZER7Pjr2PkSrnTJFs2dgZQdB0WxVr5qK0A5ckH?=
 =?us-ascii?Q?NADMtgnpUhG021pPWK8xZQmb+p2Jj5uyFKCIqIFqW4Y0ckaW3pL1oEkrzsry?=
 =?us-ascii?Q?4wRu88/JB65eH7MBUxuUKQbLH/lQ+ZfKpCHqiS2jW4In9eH5Wva5wHbHX0Cf?=
 =?us-ascii?Q?GEbhYqXDRfUp50x6LtqV2G/PLFsALGKh/HGBA/mrkxup7q39JHQUaUs5arhr?=
 =?us-ascii?Q?dssSMUu1NRdgpW7aBQvGSf7FGQ0Fc4cZWguTs3mdQJMfoWQ7tULF5O9ZJ1Iq?=
 =?us-ascii?Q?nqUeIdaQpT5DPdcIK1JutDNKCEpjz1sCcAF6096OEyWpX/8StjxOkxca8c3p?=
 =?us-ascii?Q?uAKrSx8RAv+zb7S+HSnjfx/hjpmbZ967/fwUJ0EAbFmQMNq5Lp83t4daj0m7?=
 =?us-ascii?Q?4sl2q+Fbds+ZRSR5kLli0PLchq22gkmQwdFgdUIe4B9mcfe6k8/UxKpPx99p?=
 =?us-ascii?Q?/3b6nCbhfctrNDlMINYDK529l5Vq936vyhseFojWOPvbHivAGl1ozc5D593K?=
 =?us-ascii?Q?wy23mnn8W1LQKsOyDYXmcupAPvGOc7eXn/P0TDBiQ6F4oOvcRW0H3KLcnodA?=
 =?us-ascii?Q?fNmcUYDhsw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4498689-edb1-4dd9-d6c0-08de684eab5a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:02.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cnb3Yt8ZB8HFXwuIJYR0fhnwIH8Ja91qQtWInunlB7cwH5WlRjbNEnQoyW9HLAECPsb+TKZI/BN/zoKRhwjyuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 88 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6191986fc6b5..1e8a7306e078 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -15,7 +15,8 @@
     falcon::{
         gsp::Gsp,
         sec2::Sec2,
-        Falcon, //
+        Falcon,
+        FalconEngine, //
     },
     fb::FbLayout,
     firmware::{
@@ -154,6 +155,91 @@ fn run_booter(
         Ok(())
     }
 
+    /// Check if GSP lockdown has been released after FSP Chain of Trust
+    fn gsp_lockdown_released(
+        dev: &device::Device,
+        gsp_falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        fmc_boot_params_addr: u64,
+        mbox0: &mut u32,
+    ) -> bool {
+        // Read GSP falcon mailbox0
+        *mbox0 = gsp_falcon.read_mailbox0(bar);
+
+        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
+        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
+            return false;
+        }
+
+        // Check 2: If mbox0 has a value, check if it's an error
+        if *mbox0 != 0 {
+            let mbox1 = gsp_falcon.read_mailbox1(bar);
+
+            let combined_addr = (u64::from(mbox1) << 32) | u64::from(*mbox0);
+            if combined_addr != fmc_boot_params_addr {
+                // Address doesn't match - GSP wrote an error code
+                // Return TRUE (lockdown released) with error
+                dev_dbg!(
+                    dev,
+                    "GSP lockdown error: mbox0={:#x}, combined_addr={:#x}, expected={:#x}\n",
+                    *mbox0,
+                    combined_addr,
+                    fmc_boot_params_addr
+                );
+                return true;
+            }
+        }
+
+        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
+        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust
+    #[expect(dead_code)]
+    fn wait_for_gsp_lockdown_release(
+        dev: &device::Device,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        fmc_boot_params_addr: u64,
+    ) -> Result<u32> {
+        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+        let mut mbox0: u32 = 0;
+
+        let (_, mbox0) = read_poll_timeout(
+            || {
+                let released = Self::gsp_lockdown_released(
+                    dev,
+                    gsp_falcon,
+                    bar,
+                    fmc_boot_params_addr,
+                    &mut mbox0,
+                );
+
+                Ok((released, mbox0))
+            },
+            |(released, _)| *released,
+            Delta::ZERO,
+            Delta::from_millis(4000),
+        )
+        .inspect_err(|_| {
+            dev_err!(dev, "GSP lockdown release timeout\n");
+        })?;
+
+        // Check mbox0 for error after wait completion
+        if mbox0 != 0 {
+            dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox0);
+            return Err(EIO);
+        }
+
+        dev_dbg!(
+            dev,
+            "GSP hardware lockdown fully released, proceeding with initialization\n"
+        );
+        Ok(mbox0)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index dfc30247bca6..01788aa8d1f1 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -321,6 +321,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
+    13:13   riscv_br_priv_lockdown as bool, "RISC-V branch privilege lockdown bit";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
 });
 
-- 
2.53.0


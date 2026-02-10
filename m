Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357042E54A3;
	Tue, 10 Feb 2026 02:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691576; cv=fail; b=IXgrvrKRZKnA63wP2Y07qTTBJ4KoTpHVsMgVJn+r3QEdH0d0EDDv6sNgEWnNuqFywweZ/wIITDNiO5YAUdOIwVg2m2jVE5NQTL6CHD0wjqGGYGL1rnHFGiPgknYhpnffnCh5QP6+yuJwIwW+QyO+ZiZQyIjKhU9aP072F36+f0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691576; c=relaxed/simple;
	bh=zt/vbiFG8svw2FA5IcMXfMc5KK8xP3UFYAdMos2Rl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DO7tgLtY5Qb2RYxlgjQJt6kot+CMBUSfwhcd5NZwyDG69VnGwLU/yVlExo9y1oAbhEKHtDVqfb0hbUB5AmrA7gVFw+AqxY1VV7Ul7gM8rzk3iN4f9O9GBMbVlXCXBsPQQA2HZR3qMg2eF6+NASLq6HYNtphB2wMvjtx4gCBRa+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gKHjtEhw; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gKHjtEhw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCD7lyrGGdrepYbry3vHdLiIzb/9LtjVK3n4J+uHiIvimyUqO2+bZS0aZjKJb0yfwgYXAdclJDtaxjNTA4kqVtNO8RaFrDki1KUDd6ffHzxm63UD2Mm99BUlJYjetlTIi41xjurk0oE5qPRAtT6P9Wc24o48R+qLO9a6vhEcuVkDGWcHnJXmC7iDDIrcblVyH7mo6r5d7bVEdsY2HCHwTLe+ClCgKyM3ohCRL2TIeZgsFgie4SxErV00mL1g2zXb3J0ce5ZQqdAIIFDETWlduhWhm06RU+36z1KPN2K0DM3E7Mat6EwOy1hdYK9Xqdb6s+15sx0AmvgBaHORnCpdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l5qgenhdQ2TGcieM8RWT7sBgqv4/4JR9LuGO3gpBTg=;
 b=xJHCrP8o8JwwWI3qvgihpxTDqtKtsJRwhk5E84Rbn0t/mdspWmZi0g+SIfeISI7S4K4LncojmyWrWzUdCIld/4cC2h8WCOi58/j+t5Tpi4PjWL2+mWw7qr9GP/29PhlSaDDztaiOM4obXAn6hF8BmUj2uBKc7Na3Y/5VB1GMhc1vsIhfraXYiHvPf2WBcL0XS9uzYBGeHBISO8ICea2bVfrBUyxvmLo+ZSPKGXllFt3ZW8dXzQWAxK0EIO/iuGobm9XBWC0suzVMStpxXrTWDiDbenTOpeTbGEvhjn14I0GVjtat9zR1tyCemUlo8w+Rj/ivCY8ShUdvaSD/tr6dDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l5qgenhdQ2TGcieM8RWT7sBgqv4/4JR9LuGO3gpBTg=;
 b=gKHjtEhw3faPiRa7/Y0Cy7uzHO2UJ733skAWVveEk/EZUC23ShnRWmfp9WeXimBRQuNices4GwBwOzYTcJxA4zNS2omLqX+A21sqRBiwU962OirMDLoAohEz9x61UG+cGwhyFiBBfXv5lyD5TBhUioSC5URD8sorV4SibDoOsy0qB6qmc34TCQ5Hl+rvYvFmfg/SCAPZI65O2n1Dp2jWu36t2hLNqDazYRCU2wKXCnbKsWPI8slMlKhmggZjB4Z/U/izih8uNkdV3k7b8AlpkyNn1mhF2hq6xm4Dlq88oSCKZGrXEmTxzElTmTmLnASCDq675R3hEzmWt2ozfPbCew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:05 +0000
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
Subject: [PATCH v4 02/33] gpu: nova-core: print FB sizes, along with ranges
Date: Mon,  9 Feb 2026 18:45:29 -0800
Message-ID: <20260210024601.593248-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 4195a88e-4119-46cf-3f27-08de684e896e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Huy/jVY30YhTfKGoc451dk0XvEbdS2HfDe/QC0VBH80PEHmbBfm25swmq7GZ?=
 =?us-ascii?Q?TdiW3fHRLT/AjjvFdcfSOUqREVHtaLxMJTfKySD4Lp8BjiOXej0YmFghmfVY?=
 =?us-ascii?Q?ZqZ3DdtobsYlh4jZ1fe49ooTsChF8oanjo9p41+9yVxcAJZonSiZ7/vO8MYy?=
 =?us-ascii?Q?Ufaf5qRzy+xs2cNF2RrT+2EySF7lxIqMhTcRvQEezdkyp+uB1kDIC6AoARFz?=
 =?us-ascii?Q?qnU/RomBCAci5P5leK+PJmApKKKCmKG1htnJw5CEDcexYmV7nBzpKa9tNOgR?=
 =?us-ascii?Q?2YkHYlgM4JYGWKbQALagOQttYP0gCB/zvSqC4W4iX16JSvUnUwTY2eKdc5IC?=
 =?us-ascii?Q?psNsUHcXm//MKV+ay9/nyW2uVdWPwklfz1//yKc8r7veyJPdEmG/w7V10bqK?=
 =?us-ascii?Q?uo7xM/gNhfctM4WsY6zhhdDACNLqjE9BhYMTHW5YYo32c9v8FrTAzL0xa+hr?=
 =?us-ascii?Q?0XW5TESE+ZtTg9A7FkyzA64IPCAR6x1lBUcvBOa51hQg6gJmiE4+S+DBDUs+?=
 =?us-ascii?Q?9ko97aUk0/Iec9VJ7TatAwKgEy7s0F7MMOQ7xJstwJ9FwU7efWOh30f7vq8l?=
 =?us-ascii?Q?mchIE5r1hAx/oOUHFc/9K22JsxPLwWzaKv7n5kSvi63Buey92Pw1eSH9Ml2i?=
 =?us-ascii?Q?ELxXm5o4Ku0W4VY6Y7zee0toCNActBTlUPD4or1O754fP8xHZSYbG0U8MgdG?=
 =?us-ascii?Q?RPSnINnT/sTD+HRVKAqI9dDM/mb803B9H5m42Ok1gijUVvttixMy38i9cd5A?=
 =?us-ascii?Q?Se52GYn+oL+lTJlDsuzf9OaYw0HuLnd4hQ6i51Ai8vQpJO7ogU+fbmrlXZf+?=
 =?us-ascii?Q?8SbUs2Bi8zBp3rQE1Z0yEPepOXveICIiQ4IHGG8Gyl9ncSCvr1U9wR7MqYP6?=
 =?us-ascii?Q?4qj0JwHaCmdgmcUuH4+nmdiw8sLRWNWfZleXAOQC8JlyAatutuCPcBiBLwAt?=
 =?us-ascii?Q?0Kdf99xxCAnb6laGP+HA9I3JHA2HFInYJ+ZhDxjuo1Xh+k9ZAS5NIHHK/js+?=
 =?us-ascii?Q?Z3KO234h1sSzjNvflIHvE6QmrpDZz6Y3/O9d1K0jv6i+demKrxXEyW8cs8Uj?=
 =?us-ascii?Q?4ZOxrjYHCExti58ogzjareH93qMQTcTo3DHTDqAhM+mLHVazmNENiWc/i5Pr?=
 =?us-ascii?Q?rqQ+cKCiaNpjxPUAknJckTfYZme57+3m2cTVtowdrVq3EWD8xuvCDNPGDBd/?=
 =?us-ascii?Q?hquazCjqG2ca3LYiqPbMJqn4aXnY0uFBSmrNc8ObpmYibp/tBlE/0LgRmkAk?=
 =?us-ascii?Q?f6rSvBuX0L++jY7bIY9qabdLWY7+gWJGuywHb6v8gK97XMpP4HQe/yX3eKsQ?=
 =?us-ascii?Q?JUkez1/7dBNPI0rwxG9bBLXv4YkhqzkM9/4K8VZmiIqPYQEd+CW/HUbMkoQr?=
 =?us-ascii?Q?+ycSdnAi0aNro3lnLLS/ke8hUWQw4fL+qE/j0GHJpZNwK8AG+vj5mkYCj18Y?=
 =?us-ascii?Q?/J09jU0DBVcZyhG08MAApjdgLPA1KSWccxdkgHn57N0RamVOCIUf8/hhHzLR?=
 =?us-ascii?Q?Ntox8MzS+WI0WVqUvVRcr4SejDIZnNJYwX3QqRYzl2rHkj1I7q4YmEY1YpCK?=
 =?us-ascii?Q?NoUSFotRL82A4RaDhQg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e3YgOBWLQFgL8hVXSh+Dkix8B3PWetOgnGjnW2rL8OrkClUcwmzcRZ/267n+?=
 =?us-ascii?Q?RYvRS7005+JzySzTPNt0L1oiNgNCm3QFG1BJ/3WAiggUYLbvty8vaBuyGizF?=
 =?us-ascii?Q?N5iMRHtphAlycXUkr4j2mZs46WFc+E+ihQ32odQ8JXx+tf32ZLMSroy/+Cfj?=
 =?us-ascii?Q?iH5IhHydrjDy9TIk2s/NQmNCRc4Evo0bQicOp/FNXgmt9BbRclByW9AKE+aM?=
 =?us-ascii?Q?e122C+iUXOrWL7fScvyCFF0cLxRdYhbiNSLm25YhYH8RKe0uy2gL5mAqr4b8?=
 =?us-ascii?Q?qUbSksNvHpXTR3aa1Wl9gPsbEfGRv429vrcf6F7SUvWUgmm703TGZ4Lk9+3V?=
 =?us-ascii?Q?+OFQX25Dr1lSZy8HmZisk8OWy0qb8sNxnBsBn0vTBnAEO4kTUMsk+b65XojI?=
 =?us-ascii?Q?sY/9gkjRdDCd2H0GYkuXai+BIznuCey14/vHUYxcRIptsKUR+voJrvAiNnsD?=
 =?us-ascii?Q?GIiznun4rO9PljD7eQlCHzkz4bhsxyCOKIXmf/eatgTnMD858ksVyqSJYsj5?=
 =?us-ascii?Q?CjGQbPFf7N+jHD8xeCyjTKNNe9ZGtl8U+LP03qEdK+C58yUU15WzFCBTepkd?=
 =?us-ascii?Q?v/vrl7zXy9aZjP/OmYBNLjy2WHXqRyXY8z8as3QLnUiwLiON6g8/WKl2ZkAq?=
 =?us-ascii?Q?FoGL2mfc/XJKGuIDBPoIxzs7RMVt6ma+t03ObZS25np1RJd1lWD+UIkGJaG5?=
 =?us-ascii?Q?qITnGnkgl6HbfTrF+LG56OVM+BjAb9BO+mVXV8yNFemJzdDfJ7b+PrVVFxvc?=
 =?us-ascii?Q?iLA5SYVCvudSYgOFa5/kbnnDWZhVvQMC9ir99sDlrAq2nu62a46Dl7TgZpmb?=
 =?us-ascii?Q?SKd2MUnBAjMG6n39RpeY/IHlek0e/piUMjO5JC661gGVEkU921wjLXHmIz0Q?=
 =?us-ascii?Q?0jfGuuFQ4BGu4F0qWW8Abmo6P4G6z3a5k797owllKerkvWK8ACs4DIj0ckqs?=
 =?us-ascii?Q?PnCmHKLTHkRcpVq9/kaz0MBjdJNAsL4QXYoWAovxeKDyzwqKCInZNd+ocpPY?=
 =?us-ascii?Q?e6XqGTbydxFWjREyoM0ti24sUXWE+c5NbMnZgqDexhWrZlPpZufRsSZpJNGI?=
 =?us-ascii?Q?By5+aWRB65yfk++7dpEIkgLB5qnBOIM2xywZlR2abbGV6ZfKB7PJdstseyUE?=
 =?us-ascii?Q?aiPPkLWF27841aw8FYa2sw2AKtLY+EhsK8lorQPB3s0LVGufCkPpTe/zqCJo?=
 =?us-ascii?Q?5cBX0tkL1LKZ81ADoDYD0BJ7NnNe55TGDJtsypx92l+HvRE8Uev9yNjtOrz0?=
 =?us-ascii?Q?Ao86M9PFIPKepRdlCaxWwY3szbxI19ba7gxJjcQK569IPUUHXPLGrHqLA4dI?=
 =?us-ascii?Q?YDkI6XAsI7VvRU/H/jCIMqgkK2HnQ0qzoZSeGDGtQn6cCyzAJiDVecpITlAC?=
 =?us-ascii?Q?3IhJxXaaScQ1vt3Jq3EHHyByxI1CLsKX4ZYJu49lyzBAVhe+SMTYog5NgbP3?=
 =?us-ascii?Q?o1oN0Gx3QvZT8Tj81tpGR2Jih1ifI9lHd0qFJ73M/pX4TR2CO768tuEVlsYi?=
 =?us-ascii?Q?SesCVktBADEBxYNlDC7/ReS2fYOb5X9DeB/Z+/TbdgldUArCreWevvpdVAEF?=
 =?us-ascii?Q?4OrCH7vXTqqLPiWrO0h9VLZxlvRHOuCezknpCMarN1pTuzrgJcODsClbcWx4?=
 =?us-ascii?Q?iov2+EHJgkO4L8JwCFPuiaPHMldeC5q/OxHQjLv3GJ5cq1NkWcQf4QQSZ4tm?=
 =?us-ascii?Q?VvCOIHfQqkx0FdM4CHyHKba08lNoxBS+SBqujy31MKA2ixDnN35bKDJlhjPO?=
 =?us-ascii?Q?jiKT6NJw2g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4195a88e-4119-46cf-3f27-08de684e896e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:05.6930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHsut7trrdOMZA28andB1lMZrpzNR4c7yy4kTnTrzTNuNLRVLeHSBJwwzRsT5VavtnRoYNZHtaVZ2SrY/MbtRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

For convenience of the reader: now you can directly see the sizes of
each range. It is surprising just how much this helps.

Sample output (using an Ampere GA104):

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MiB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
    frts: 0x3ff600000..0x3ff700000 (1 MiB),
    boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
    heap: 0x3f3700000..0x3f3800000 (1 MiB),
    vf_partition_count: 0x0,
    total_reserved_size: 0x1a00000,
}

Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 83 +++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..6fb804c118c6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::ops::{
+    Deref,
+    Range, //
+};
 
 use kernel::{
     device,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -94,26 +98,71 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+pub(crate) struct FbRange(Range<u64>);
+
+impl From<Range<u64>> for FbRange {
+    fn from(range: Range<u64>) -> Self {
+        Self(range)
+    }
+}
+
+impl Deref for FbRange {
+    type Target = Range<u64>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl fmt::Debug for FbRange {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
+        if f.alternate() {
+            let size = self.0.end - self.0.start;
+
+            if size < usize_as_u64(SZ_1M) {
+                let size_kib = size / usize_as_u64(SZ_1K);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} KiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_kib
+                ))
+            } else {
+                let size_mib = size / usize_as_u64(SZ_1M);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} MiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_mib
+                ))
+            }
+        } else {
+            f.write_fmt(fmt!("{:#x}..{:#x}", self.0.start, self.0.end))
+        }
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
-    pub(crate) fb: Range<u64>,
+    pub(crate) fb: FbRange,
     /// VGA workspace, small area of reserved memory at the end of the framebuffer.
-    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) vga_workspace: FbRange,
     /// FRTS range.
-    pub(crate) frts: Range<u64>,
+    pub(crate) frts: FbRange,
     /// Memory area containing the GSP bootloader image.
-    pub(crate) boot: Range<u64>,
+    pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: Range<u64>,
+    pub(crate) elf: FbRange,
     /// WPR2 heap.
-    pub(crate) wpr2_heap: Range<u64>,
+    pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
-    pub(crate) wpr2: Range<u64>,
-    pub(crate) heap: Range<u64>,
+    pub(crate) wpr2: FbRange,
+    pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
 }
 
@@ -125,7 +174,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let fb = {
             let fb_size = hal.vidmem_size(bar);
 
-            0..fb_size
+            FbRange(0..fb_size)
         };
 
         let vga_workspace = {
@@ -152,7 +201,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 }
             };
 
-            vga_base..fb.end
+            FbRange(vga_base..fb.end)
         };
 
         let frts = {
@@ -160,7 +209,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
-            frts_base..frts_base + FRTS_SIZE
+            FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
@@ -168,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
-            bootloader_base..bootloader_base + bootloader_size
+            FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
         let elf = {
@@ -176,7 +225,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
-            elf_addr..elf_addr + elf_size
+            FbRange(elf_addr..elf_addr + elf_size)
         };
 
         let wpr2_heap = {
@@ -185,7 +234,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -193,13 +242,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
-            wpr2_addr..frts.end
+            FbRange(wpr2_addr..frts.end)
         };
 
         let heap = {
             const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
 
-            wpr2.start - HEAP_SIZE..wpr2.start
+            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
         Ok(Self {
-- 
2.53.0


Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2E32573C;
	Sat, 21 Feb 2026 02:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639813; cv=fail; b=ql0ysr5PWFfkhXsQyRBvxbWeXgcz1O+H7nhsMlJVMAYkgyxxQtEq9Br78msMg2DzznPsyz1Q8RPr+WFTmREk0gYtTUUtYhWuvl2AyWsN3A6wCoJINhJVh9Ry++C/DuEsBwYvQfg/2tZWeuW244fBEbrmvqXa5a0KFU+bNb3mAKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639813; c=relaxed/simple;
	bh=k+gpqAeUWYyO5kBTqMJkOzBX+/aocEv+vr18ueDemaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fSlG+vMCDmK90JtQxubtnLpcg18YfZVRVvSvSeJNq9c1GmLWa1nlXpULqaKzu9QsATpL2d0qxVtpmnS9oEPST6QZAyBphSIHgNjyv1kxEgE4CVnrtoZ6s74E7/7Pch77lpjOCU56KV3wKWO6LnbdKmD5OudOqv9ZsX+1pAxQ6/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HcxJKUGz; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HcxJKUGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6RbtaWcxzlQ57sCO+a+v1hfi20Kc3oBJndEMh3JGPElLV89V58cyCky5vVbEcATMty7RxUFve19nLbf4s1kkn49kGgvEd4QFr6FYCGuQLXASgI/v3uSjoPBFfDXn7tuUpvVq/bIgxC/7vXCxS3totbZVoHS6ZC20TgbMTw/Hentd3VCQ54r1VPtldG8SF12yGqZISCkBvQc6K25TQ8/qOLK1keFo+J1WqxEGYQLTZNwGTxmi8xaVz0PSlurFM08it/euR9xH/8Pjw5GgX4cBRvgaOZw2JSZehX8iRHKXG5amdsBNrj/TAtrcAsjWqRT59iORiNJUff6dj/xkD5DxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5wxkVdqhigmMDDG5jyDgU9y0kjPNH6pefCIZy4Bkyk=;
 b=VEFFcn9jFXqAhHk1lQKzrepPEbguOoHtTPapvKPVpA07dhcwyPxlrQP842TmPHs7pcJfoGGrRJenRetW2moierVai8JFoyN0V9Qax+VAmr6F6sADHq1myZG+PeMuJsnajRptwvvyxiCim4lXarFnhENxdnqHeXnM4NHbRIv0I4v6kiKiglWK9StruJzXYAYgE27KaL8syTz79IdAmyR3v4JB/vWPVM0tI/dCmeOJzpzUBUZMJl9IFeENFam5g0Z3AiV0krBMr0FHJfEDLwWO4iaQdsNNgbPrUYBwkIvgg9KgpuRl+ygagWHbqm7kp9C0XbQpu09uHU0RB621GoTXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5wxkVdqhigmMDDG5jyDgU9y0kjPNH6pefCIZy4Bkyk=;
 b=HcxJKUGzBICEbRxUc4D8QCJ+fflEcdOG+AtBD80WNfqCRl01s7Z6oMxakc2BR6VfsxeRYA90ehyZXk14D/DsjPWC9cqH7kV3pET64Rp98CqxMWEBp9wP2V/OohIY6y90P/UHsebhtkkteKnkqCU/e00HTPRPjtYrSDRoMjbz4xM1fvTBxIGDT+J7ODoJ8H8PHC8LUi+hEwCT7/9EMSsWnUi9lgoZ16NO7W57QVZCU6S6KTB2fhCRRAOd2/qEzmpNAaR5u8tcbouW1xlh/z5S7aYdPM1ICUMSmeRgLZsvhZtFC+rlWskHoz5q/sC85I2O1JVkXkAYnTiezgUGN17mnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:02 +0000
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
Subject: [PATCH v5 06/38] gpu: nova-core: factor .fwsignature* selection into a new find_gsp_sigs_section()
Date: Fri, 20 Feb 2026 18:09:20 -0800
Message-ID: <20260221020952.412352-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acc85b0-75d8-494c-9767-08de70ee526d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3PtA+9wIoTsw5vII494fAWEaZZA+YyrY8u1nh7jqQYM+37VWUYDbC3rQAhi?=
 =?us-ascii?Q?QiAK8BId99HE8IyXgGKXcv/YbdxX13/YeOkg/gj4D/k0+s4INyj1rB+/uKSK?=
 =?us-ascii?Q?F+dUSXuS6qw+Q9nXuyQprkKcbCBkL1duc0iLiTaJqDRGBec8O/VneCZctuBW?=
 =?us-ascii?Q?IdP1c9j+ot8hoDwRwnpGQZ43/PG3xVmSiuGkSL7DeYVVD4Hxl07zi/y0OsI9?=
 =?us-ascii?Q?KER3PH/pglZYJjEPjscU1PgqdDPU4vnIGooTwMN9sxtHRh2QTS/htey9wjBW?=
 =?us-ascii?Q?ofIrKtC8izQ/Mc9u6BqDNexox7dqlBr2fcP9/OXxTxgZr+F9mn7PosGnSUVp?=
 =?us-ascii?Q?6slxywpdvD0XopNUJcbBp7b4giX9kKcnZc2Ep5yhEVuNM7xiuz/hQwB8Q16l?=
 =?us-ascii?Q?TTe6QfJpE3JofqWGxGRsOvgUOMOpuezaJgUfH500LGa2i7Zm9YIkVDM0Jpb1?=
 =?us-ascii?Q?utBMCn3vHIWP4ZNiH5a5rFfoYlgCkui3LkYU2Z5Gt7nC4T5gZfElBxTSfE7u?=
 =?us-ascii?Q?PeohtBp/zrM+CHEcVuu1ZUQpHPXBXIYyoRBAtVciALuo0xVfGbNWbF27XQJ7?=
 =?us-ascii?Q?PKU+rCbGcd320SLTB5RZfAroUMIniyf0z74dXEQs9jMrDVCkgUJndDacjkEb?=
 =?us-ascii?Q?IacL64ekaky4IJx4z2nPoTaFtF1bzlqC0yvHKXJ7FVytk8WsUfjZQPIyArpL?=
 =?us-ascii?Q?iDkz/Mu2II6eLHP6aTQ3sOkObyeZ15nk0sCgE5k07/fznNij3QbnOmnkswrI?=
 =?us-ascii?Q?L7NoHIZ2QYdzXaoErehtEdLul01/+0labC3OYoCdJDZ/2eA+/qGJv6Fb6992?=
 =?us-ascii?Q?1hbQT2l7vAmGdBiWrhWrCrtNlgN8cnbjmgEkNb/KaOy5MGtKCZFfyuu2cnlo?=
 =?us-ascii?Q?tKl4hogX0idix0JdDjO3VPIko5A5Lx/uA/1Vwh1QH56szXnRgB3Nf8qZ+vO6?=
 =?us-ascii?Q?wwLfZH1pHtYKBIK2Zxr4/5WiNRbfnd51wKewqxs+KVsayDLGhZNATRj/e8Wt?=
 =?us-ascii?Q?hIrCUL+KZOhalLWxMW+lDk8H1j/v/rX7eA3YGRNkNC0x39W+FTn1BYU9amNM?=
 =?us-ascii?Q?0NBD9sAFYC8le2+gcNafge+j3TnAskxMlXTPoA+IEni3gDQxOfnDdXj9ulTP?=
 =?us-ascii?Q?9WmtPgUOH67FRrs9VhZ6BDRM9d1JGMVQ5j3fUn3zYVXS6d3bnh35SzHSu4vN?=
 =?us-ascii?Q?p949tN65919oW6cIW6GUFA7vjdTZbhHQ7ArPvIzQupKCC/KgYYO584mnp5r7?=
 =?us-ascii?Q?6AkiqJjkjwmreBOhUj1QA8mNs4b/pe2otRTPQhwvNcBHwoYwozofxQ6fphye?=
 =?us-ascii?Q?4z37tKdR/Z3vAjaIWUi60aUd1yneVMKlxQBV9LREd+82Kn8L8Ka0sEd1tLet?=
 =?us-ascii?Q?QfM91SuBN2uW68MNylsm7qhOetOL4XEJs5JLg9Ri9l/HsRuabks2CoxcKWN2?=
 =?us-ascii?Q?rYS8azHh3dclPLbw3dkub0kuPWY8BFvj6uKgYw38+BsBoejjDgBaXoTc2HEc?=
 =?us-ascii?Q?31Cz/7cY8VuYSBXekMJXzJAZbqIlGdtBMzZbnWP0KXT54CiDE3qUNyW+lX5U?=
 =?us-ascii?Q?SA/+4G5KHle3BqoR6As=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hI5ycxHkEbxgQYQsaHRAdhnsn4WAm1aLn7N56h2xIoiAfvJoFu/mWAm8zs6A?=
 =?us-ascii?Q?XFf0FfOMxknbgVar0xBpCYyNfhUXyfAKS8vLf3gVu/4eiLCKLw3sKo3rFEi0?=
 =?us-ascii?Q?xzBuitkVn49tsK+V/gM+2b1Vp4JNBCuSMJXkJot67vpT6M6bSxQsbgIJ4IIJ?=
 =?us-ascii?Q?LXTqll8/TeDIuZzkcscY9oLXZs+P4+VGzTJRJd7Y2qoAaRTDGDi4kCYbVOOG?=
 =?us-ascii?Q?BY2xUve/3d5vnq8wPf37JqYRV1y1QH5adRTCe2uFxZwOdeuB5mQK2f7jxQMe?=
 =?us-ascii?Q?VtE7hZFgKcCnqjK54vgV20Jaa/6XcMkhB5GQpiRXlD76Dh5CQm5jdlsmbHlR?=
 =?us-ascii?Q?N1bdoQIcnf46SwsBiWAcwtXbZR4mKmQ7sYPndcXJJjeDfi5E2g7XBUxoGerq?=
 =?us-ascii?Q?miuHHuWc6/vNKrQKoaHfoP/XFE+5mccw3U7NryNizk42rh4Kxm8KyGeOrVqo?=
 =?us-ascii?Q?bKGuUrNPQ23T3ZWCdUX4P/Z0Rw58O1Y1w7IU3Dxdf7Br5MlulJnfnVh75z8V?=
 =?us-ascii?Q?wf8hi+xizycek7NLu8axwDJSBFhjVtrtoq/LWL2ifZvGFIY3Er1gA3+nwcAW?=
 =?us-ascii?Q?WR+cfYGC7of5/PsV3N0cg9B81fPA6Bgs8EqV7YpzAoSVVbPiIndtlSzusJwt?=
 =?us-ascii?Q?o91v+eqyzC+cFhtcf/pDwpZYQp32Ggs/w7Wshr2xYcXxMjGy//+89VdqQiPj?=
 =?us-ascii?Q?ggQF86NFURrtgMcCH3gIthCq85PzVIES2OQ9IaREuBVuioBqCI6koGMZR24r?=
 =?us-ascii?Q?GXn4Kb+FY78WqUivjoOZ+i+koecRc2/JGz4TfYch0MWtNuYu/qR8NW/77r9i?=
 =?us-ascii?Q?1Od2uYr9jR0/8Y2vxeOTeVItUXh9sAdPqmIclIJcHqTkx5QtADwSHqJ9iOWn?=
 =?us-ascii?Q?v9NcRW3U6HUUvqJS6q8VX94QVnzTiuaxJoh8gsYppUTMitjgDseJ3nvzDpC6?=
 =?us-ascii?Q?8iHmJkMc31zaHObqDdcybdYViNdyGw9rzLTXZAZbD728Gy2N7xG2BifzVLU3?=
 =?us-ascii?Q?IWFUVTfokw4PvQa0DIIRs1fsFJILIJx7BKuSQZY471MJflH5opTVXYzdVzax?=
 =?us-ascii?Q?60xdX1/Osgt0esL1KhUKj06rKB4g+vLB6ofeUNbNmO8z602dcxR4RP2Bn2lu?=
 =?us-ascii?Q?9HdAD37vgIw/G/bDEpIWN6ehTnhu8QoE75MfuW+BpI8vFGj6xOG7RMIYgK1K?=
 =?us-ascii?Q?ys5mPe7cBcswoJOsntZobbAARCA8pFE40bSi/khthE8/Bw+khu+rKy1ZpGyZ?=
 =?us-ascii?Q?65GsRfUN6Z98Tq0LeXxhGV0wvp6qWrSHNifZ+4TzjFLf4hvu+eGSqAJsBKbm?=
 =?us-ascii?Q?syKdqNhjsdcjHPNKG/uOmFBfM7ksl1wawm2TJ/3UoxxQXqzkob03V5QzvdaD?=
 =?us-ascii?Q?EOoFkbV0A9a7iUA7NVf9A/yE+cwanE6szBEhnYCzZ0xT1ZmrqpL8km7yVyRH?=
 =?us-ascii?Q?L6mH5w3H4J1p4diYAjDroKnm+w5HwWzws4r+95Bhc26tZsmaSXKgmaww7eBY?=
 =?us-ascii?Q?K7nuGD6I6XJrHkS3fxPIGDsVzgKcnEBSks1ldcE18OY91RjEPU1FAozfPJh7?=
 =?us-ascii?Q?nr8aCJCWy2tX8M+RdUWxC6qxBPUOVtpDtvNXJjzZ6CwxtbnCED0tCDAyaQ78?=
 =?us-ascii?Q?cBGcVuZSw8B2eAdcBLDT2E3FBvFG9v0Mk3yvQ9YHvDx0ocDF/WcdPI/8kvht?=
 =?us-ascii?Q?Cp+QA5sBZDIQiw1udH0mBocc7KjIToyoHk5bEgkmwXJqWhsOsdvNgsL+a/Qd?=
 =?us-ascii?Q?CJz7JTMEeQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acc85b0-75d8-494c-9767-08de70ee526d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:02.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8YFDeSGlwisQwIMcgjCJ21nNVqo0TNHEGQjY7q3eaSE7v9ySaDZn6bK8OMdlVYlCd+1A/P8S1ByjoMt9eKS7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Cc: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index bc2243450989..468f4b43574a 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
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
@@ -211,35 +241,7 @@ pub(crate) fn new<'a>(
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
+                    let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0


Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3759720E31C;
	Sat, 24 Jan 2026 23:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296730; cv=fail; b=tU2cLJGsSrCVAJoG1v6dMFwGnbs1KvkRzfsD5YUk5dkFPSaXtC8vw4H2bGH2OfhKvGIaVdtSrkxV3W3N9T6FDXJvRI9vALYRuLHmvrdQaRCPvnd2ge8doHnm5sUuwbYLM0nftmB/pd4QHVmZLpOYNfqw/db8flDpSyjCWeIFI6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296730; c=relaxed/simple;
	bh=/5k3HVfujMdRMhUDRhZj1h3sVD0FQZRynUXqYdaZGnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=txn20lapDsJyINe3mephGpDwLfB1TwOUAG/8dfvyh4L/I/xmuwG7Xfc7Nnnw5Gb6OfSBMYXAIVAAMIXMnM1eUO7abAivV0Qctq4dmGYBi9X7IuAsNszTy9BXI8Q2Xp/dV+71ft10lb0nZK3z8b/zIyhdmCCK/DjM9ZYpDR9n20A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k+ZzUlz/; arc=fail smtp.client-ip=52.101.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k+ZzUlz/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sdy/Y46Yn1vfwm2EmCxhzqrtedVGSxqVfnYvTaKQ4GWUfZqZxdjv0zl0IcWrNLDXppRINdagIFLWy8NkbAOQvZYFenAjLH6oDWmH94ndoacN1N7mRcdPvB55WSy6H627A+DfMpPOQquElWvdx7cSjcFNG6KqOAInQq/Co7puZfdFJg6fw0g79XFcM3xNwASJHzTwkkzVqihY0GTOBOmJ9lJoqZKfIjDH1Brlc7XHW9ykmo3rJHsw/oU+P9+lGtrYa5JyG8NQG2Vj2YFU0qjR6pM6Th2IcTiZcHWuWqDO7OC3atOo9fMX431tLTtg7/008SE5iXFc8ansQaq48AJpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TFhm7IjfWFoSii9sLWhfXwM8sVY3OHm60hxo6vB0BE=;
 b=ahmsUVNEnyVLo5reuYL0iJ3uXACdxsQ1rdDVV/hbAO0AxlSm77aJQdmeQAy7kya1eFrlXPBgidKmZy8MXyW4VwvFsRqrpGoLhdJ6xV4t9gKZaINMCCTZXfK3dpMsuIryWEjF/ZE8AsoxpYAe2FnR/geFSbtmQ+L483or0kCXWzrkCmT5pIhG+uW8YP2TQtph9d1lTtNK5pGiA6hyjR5eHAJnFYyGE6euLCteWA7boIhz8a/L17K1Bu3brNavR4xDWKuTRyFnGpbvo6glnjnuLm7Fk16Vk1wZ+dWU1uMkN7XyD7W04s1u9gvSX+gBecYiztetz14sRlM6OJc2vEk8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TFhm7IjfWFoSii9sLWhfXwM8sVY3OHm60hxo6vB0BE=;
 b=k+ZzUlz/YQS3u2NpHCLgnH4+u09MIOEeOUchXZU4XPslY2uaNjIftDjdxbrBOqQ08QcdarZL3e293ri9QaerJOMQK6ENg0XqWsin+8jg7g56zifj/YhMwIaQjWHwvKxAnfsYjG6mhorPI72ize70acfR6HF9wlpqOgfBQSUb37oukh1WqOU/DXxFhppD7ik0MpT2iAMB94hz3DD4NDjU7+qkZrg2njxu8aWP9IkQm3rI2MUuQZbWp9iOfHskg7RCdkWrj1W3D0nO7z97KuYqdGa386ennvi32Y6w86Kmm4zRjou7om5qeMtYMymLmdxUJH7ruhXo4MisEH2ccZ9HUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:41 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:40 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 4/5] gpu: nova-core: use checked arithmetic in BinFirmware::data
Date: Sat, 24 Jan 2026 18:18:29 -0500
Message-Id: <20260124231830.3088323-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124231830.3088323-1-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:208:32f::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: f1879395-e9ba-4a71-efc3-08de5b9ee928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bULeOwLjW/ZCiQJMD8cs4RInzQ2N5pC3zT0wJ9KltEt2xre+nWCADxGOnqLc?=
 =?us-ascii?Q?SBiWNiEGqK4jNtmUr25syvdKtqQe6ac1M8uUDkMe4GdKMXoS4OqECVeyFGW3?=
 =?us-ascii?Q?Rt9Arw18jBDuYFgT+5+KlrLJhBa4ruTUmOaiT1+073w6Vbw5Sa2FtkNNi4lt?=
 =?us-ascii?Q?/RwFAmPdqPCqHzOCoOG3KXenx5VS/WFNiQc78xnp9NfXFGhw/wIovpSerOeO?=
 =?us-ascii?Q?DvsEfF6rQdKW0xn0b2ZIYkpJX5OQ0Kqw8IUi/YzZFAq6QbEeahZdEUZEh+l8?=
 =?us-ascii?Q?hpx+4W5BQS9VzBcYWDNJ3veNZGHt6UOJP8aISeeFf38zLZ3583Dbuk0Ovpo5?=
 =?us-ascii?Q?d/8OWgIj8idomFzdCU58u4T7/R36HsTVdA0ZjE+MVXv+5oYbYzfacxbVOXTI?=
 =?us-ascii?Q?2jxqt3h7t+xmtqwWkGoX/KiPyS7bnIygL83mK2xBk5PgyMkPymICqMnMFEo+?=
 =?us-ascii?Q?z37txIwmtj8/hpXs4PnlVfr3rxHy2QhI7Zrriiwqz1Y5uTzQ+KmGiS5a//FE?=
 =?us-ascii?Q?cW2xZQrPMaiNhM4o3KAGrLYeh59S8Ltq83roOjiNwmrOspoP7jyZfzZcBXHp?=
 =?us-ascii?Q?qfdN27RKRUma8FToopnO9yzJv8ZEix4lc69yBm/RFRPGbpyDwH2qw9s+uszz?=
 =?us-ascii?Q?v2pK6oXlZpd3SfS5KXvhx4KuvWwCwYw6qlz6FuGXEb2wip5remPG2PchLiMl?=
 =?us-ascii?Q?cAtbCAOhftbU9RNz56zOJG8Gxw9p4Io3ibQCkNfwbuujllvIPtbpY88v83Rt?=
 =?us-ascii?Q?55tDYaySV6DWcxMfbeoiUgob1VBPrJS5JIX972WH/m0zRcUfaTnIxDEaoCPK?=
 =?us-ascii?Q?Uc7HqMBcGCHUD8MllBmm6KEWD/Ht0qcr06X+Ec6EKpsP1exjCuneixGIkcM9?=
 =?us-ascii?Q?+CE2xgOuGXvDwMkbR83PnEh4H0ykfR74Driux3wP4QKjNMIembFMUzdTaBRP?=
 =?us-ascii?Q?G/TaEx6qWMOAuuak6TOImmoSV4rkYfweXGWeXvhc5zp0BzVTufkEbJg1jh5S?=
 =?us-ascii?Q?FbeQKMTW18R5xNsPqoZhBJoM8pXEFajsodAX7/Ysjm3qCQgew/OeQBUQwglU?=
 =?us-ascii?Q?3Kc49rYDgQNxR+QgAJnKd2v36irPnRFBDA7i5FpzBkg5QLnNBJWjmJdtRzdX?=
 =?us-ascii?Q?i9zurWrDuB5RG1yFRm/4/H7c5OCS/vIbY8VyBl1giUkKBM67gwG3UdqsS389?=
 =?us-ascii?Q?nm+l3TZGAgc8O8zzcUs04WKiwpDatWSdXbI/ZoUl+ev9OJ70aFVaQO1xf2tN?=
 =?us-ascii?Q?1tK8iC6FCRxP6xVuiM4TkqbkH85oleEH7Am+F9f1AsKpb1i17ap071kqhLd1?=
 =?us-ascii?Q?ImbjBIn7QRBcsZj1bv4MpOVceEdgR1k2O7hwQ4HCKKPLww29nB2yQjWFv2Q6?=
 =?us-ascii?Q?9yeWTwYPRKlEDUKl2eQrUoMQVSJZMv1uKxKkEuh2xCI6BpyCjuLAo8wOW1gk?=
 =?us-ascii?Q?hP/0v5l5BaQJu3LsEbs1n/rOtAUyezozPtwOcDDXpZd+XCjA+PAmUY4Shb2V?=
 =?us-ascii?Q?PaUYZVCz2CDX94jpPrO4eOJRgX5QMZm7dfbi5Y4fzOCtBej9gJqRNd33uPY8?=
 =?us-ascii?Q?cuhmo7mslPYs0NiSots=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m4Gju/0aKgdIHaRZkOZXtLKt0i3pt+sAEDUzYXqkn2mgRcO/n1ohAd58fKT6?=
 =?us-ascii?Q?MYJuE8J1oqtBFMZkjERA68XqzgxL/YcTqW2ZiVm9WUtALP3NoMGui2wmY73V?=
 =?us-ascii?Q?yJpKbbhx0UtPwVtS/hSks4a/l5SxiZ5JDCnxgSnDBcCvJ28OCqxwYPqDWEU+?=
 =?us-ascii?Q?Zg7xFZbcLidTWxmhOQNiyuYQzxAog9yTBXH4AJITbiffdNQqruKGVZqMnsr0?=
 =?us-ascii?Q?UX/vqCfnnjF95dfusp8YgLLI/hrrwp594t6f0nqSXvSG4jXI6QZTe8a6KcYb?=
 =?us-ascii?Q?kkpzKGk/oYuF3TT3APN8WuQAyg6ydbnqa9MtzU5iPaIUYQM+q07Y7mVo2OnU?=
 =?us-ascii?Q?TGSL2fZNCc0P+msE9kuUGtUiWivOzMPfKpEg9dA/pceK7NYT37EEIY4ZM4Q7?=
 =?us-ascii?Q?1jkhB9/WuZHLlinv7kAWZS/Hb47883/vXUfw8fj6BEZmszg0pUWFhaoH234X?=
 =?us-ascii?Q?gVaoGgaHBDjXlW+56ig6GfTj/mMiuUEpE0oHLZR/r8LbBT9t29x+CHnFnb5j?=
 =?us-ascii?Q?iHeyalB03BLvtVy8tSYxfFfYla5haapf13w+oQNrUWKBy4thEPCKVLoU0zUg?=
 =?us-ascii?Q?hiPEouqylgaogCLNI6G304XHEcMpTY54Iy7IYm/GxYFZrVNnkD4qKPHDY5qG?=
 =?us-ascii?Q?YGjhtteNp/dboU+MyEpL0tCycpneagXDcE3VXcMMgzHKKWgpfnuCZUrZUDZz?=
 =?us-ascii?Q?3Zj8U/aJ+h1vF1mtcgMUuehr0Qv2A5k7KvCN+Xg1rrhZMdlzXB6b1Iq9yUCr?=
 =?us-ascii?Q?l8XAqL2G/K/w1d4gTYRQ0JTEraNNnaQO1AimGJybyMQxoozgS+bKo7zevon5?=
 =?us-ascii?Q?heci4UXjpdDlXA7XGl6MIjCQc8pN0iQTglRmlEkXnmdBdthjYuVRm90HUMiC?=
 =?us-ascii?Q?JTdVLSOnnidjpW9M+SZekdJ5WyA3GEuuPvr+iz6r9pBJKgPzEndQDrXdZ+8S?=
 =?us-ascii?Q?H4x48mw94UdMo0e/EQ2D/jWLPbG3ELKZ0B4l4aVNicN1EbCAnAIDVmyVeyxd?=
 =?us-ascii?Q?RCxN32sEilLi6BnKd9Kd+J2Uij0hYTFG2zmOCz4PCCcaMCeaJ9HwSaouFiuH?=
 =?us-ascii?Q?+v/BfcrH82vpN7nYpQtEsRazxt1pSMkHDu+JksD409tJCankgeGK8xxgjLn7?=
 =?us-ascii?Q?2YHdgL9Kd+t6dtd4csW0AifqICnP8ZEiEcAAtpFCv2x2xvn828I0RXZjkfy9?=
 =?us-ascii?Q?fNx/trpeLYOQxvZ7rxwp9EJWcwAZFVmoFykh2gEqkrpIyLER6LSPf8teql5N?=
 =?us-ascii?Q?W2cz2dF7PLMETTWoP+y7nQlclRY0u4/Ae4OjeT3Kik7E+Co1Atx2OSSxddLP?=
 =?us-ascii?Q?7L9VOXQEh0JFkP91qVxaw2FTMp5/A0cNI8djuVYWyzwzjtYGXWEkfKjH1OiY?=
 =?us-ascii?Q?/9YDJK4L6D2j1hfK8vbAqNwSGcH5gSXkSkhJ6eDLm9/a7EvwVYMuxZjfF+HZ?=
 =?us-ascii?Q?IO90Pz9650xp0Sg/IN8uVXGStbVV70QD1J5HgSyuOSYZlzU1oI9TdGucs1yS?=
 =?us-ascii?Q?1Qu2REq1C61M6FQTmguPfeAQ5Z3cc7yYuhfwZbJDtY1xdh/xu+ktvbROXk48?=
 =?us-ascii?Q?QmDQBHZxmwkFDfE8SeGrW2Zad2bIKDEQ54DtNmFhg41RfeJVD0vSQMfeZVdO?=
 =?us-ascii?Q?kFEcxxbVSQ2U7//60usF1Lz+Y+G8etuIL1nJIfgVRAbdwv7BHwpCk7lxOA02?=
 =?us-ascii?Q?SE0Ed+0qqeeS9KVjAs4+eFFv+v95quKtCRTeYlRY+qivPJskIWmg+u13AFeD?=
 =?us-ascii?Q?AVL5uhHClQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1879395-e9ba-4a71-efc3-08de5b9ee928
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:40.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: as1QLUoL7xuqoMaWoktbaB0lQw5ku4CQIVevkXCBiuVyfkwZDkM5DYv/m+lyfuORBNHv9Vs+t9GtFlWHnDEHTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734

Use checked_add() when computing the firmware data end offset in the
BinFirmware::data() method. The data_offset and data_size fields come
from the BinHdr structure parsed from the firmware file header.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..4f57a270e142 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -394,8 +394,9 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
     fn data(&self) -> Option<&[u8]> {
         let fw_start = usize::from_safe_cast(self.hdr.data_offset);
         let fw_size = usize::from_safe_cast(self.hdr.data_size);
+        let fw_end = fw_start.checked_add(fw_size)?;
 
-        self.fw.get(fw_start..fw_start + fw_size)
+        self.fw.get(fw_start..fw_end)
     }
 }
 
-- 
2.34.1


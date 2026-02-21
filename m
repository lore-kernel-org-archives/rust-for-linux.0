Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5432C939;
	Sat, 21 Feb 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639872; cv=fail; b=fIu9tV7BNY7JgYHHkCsbdLAeIlt9sm+OAGZbHH8h69uFOTouxxjrRKVjTUjzc3LEg8fBGlZ+IDXNXQxLeNoVokPm+A7Sm3tb3bdeg2xFANx3F5Vp7zzULlc/HCnrLLlXHmiqFrxybmVi/G0vxUPeXyE8MzyR6iZ46HfzTNRi2gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639872; c=relaxed/simple;
	bh=/aEKGjK0h1dw/1z33BZ/KrdAiSyijq86Nbm5bVqjI5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jz2INJH7uk595d1ngYYKBZSTlUT1pacBgX5+fpoQjja2cux7hqzjRRaczNjfDK9xomrfi7kwaB9McxfpWMTk7V4k5Fasee5Q3zOenn3h7OgztJRUnqUNChULSJw7SpxciaqUT9pCSrbeXB0sA3CpBsVXtAaxDTehXIT+SzUN5T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M578MVOG; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M578MVOG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWt4Re87QGCiN+/YmQTCT8yMEVvoocIhGsGFbB2soLZTmOx9Eo/GGF69Tkvxr4hcLFje/FTbcb0fCeL92yXlTJkYRkU0sqb4t3jgej8vQMKQBCsvO3oHD53pQli5mKs6Q4JcPy/bAhLi37na7AQ1XseJgFBEN2rEsYf410yBwAsixn3p/Ke4EfxDiUBwP6ALXGdz+q4J+SNd2s7IdX7ujoPJjCe0snrqCznAYnM0kQ2yjmUwNMdJ+D+7th8h/rBQlf3QURgKbs7cpI/1CGdMeFCsQQ0jQXLFn11QMME9eRfOJpAjnXtQBMkuZyfnYTyix8FESCjOkLexuPny7JTdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwnIZ6j1FOXq9jGs/q9smrLSfUfZybyTrDBAQC9X6ss=;
 b=Sff/2YvdURA6H7k22ueq6sh7EqbYEba+9KV9iLbp2O2fpkzmMHJ5cijOt7Vqex9NSbC/RzKM+Lt2aFxCTUCRxqNVh4U4nDrSmBYkxSL9fyj7/GwEUWXoqfC0iHAzryM4VZbEo5nU9NS8PDyYpcoJFyQy3WzAwlUwXp9RVHZQihIiIFnxuq+IEvyJTTQH1NKm2FauaIPUuPIuREd5xlaynOM6JiFO7VWxMcefmJ/bQgXskF5XIk/auW3RTdekHT5rKcReXao6oQnWmLjHV/eCdAT8KZXHyfPfpExewl8f52jEtWb+uOkOcIaqMH2qblwK6aFtK2CH2cfNGDtiyPN0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwnIZ6j1FOXq9jGs/q9smrLSfUfZybyTrDBAQC9X6ss=;
 b=M578MVOGoRL/JDBOdAXkP9mnkK60MpHYsy2OYFcx1bDc1CFmF7Muk0iVAgQsf54Zr4GzEz6frUWDDgOdUk1WhroaifH7q4K78oyNUEZswFcajQYSTiQJI/VXnLMLhMDoxZ/yvIwiBH+oRnigE1LmqSLUzdlWVzqkoo91RlTuUS3l/TCr0O6jMuVXKTfuAN/EhqqKAsvjxPEOGtIKfHrnwGVba9CH6i1hSaR2u9cNJFjcW7iND4NjyqlL7SQBGMKEqcNOHDJW1Leb334RZUkvZ1Nze95y/B5pIZuik6z46wcZSj4WWOwLLNgfYOxvPmHnYzNXUyBAgLFav2/sHlnmSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:21 +0000
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
Subject: [PATCH v5 22/38] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Fri, 20 Feb 2026 18:09:36 -0800
Message-ID: <20260221020952.412352-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 964eecdf-01b0-4398-bfcd-08de70ee5dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qxKihXf/JYltCpwYEmTgGJtv7n4Ghnprv3GD6xyVzJbP/U5CJvHHV40cjeA/?=
 =?us-ascii?Q?CozqYgdbVqxlQKld8prxBaFqdlm7dCNKwGYRod3Z7ZO7WwoNOfLXRY0yrPRH?=
 =?us-ascii?Q?pjWbaZe3s64tSgqBdgmIG0ODPyxb5YbCMDXOM+Q6ILZBlANWLqNd9B8sr7pI?=
 =?us-ascii?Q?itrLpqXe0u9ndpG5+0szZkwb2k0Pag8acj6fRFieMdQMo7EVn/k8N9F1C7wt?=
 =?us-ascii?Q?mhUf87VcUWr+jgXBvBgvoeNrk5mUWCkPnpDLAx7LHfAlFchYJ4dj9/jODsA4?=
 =?us-ascii?Q?0/Rcp54VK2BfcjSN2eTkOp2flpVwgq+qIiWP8Bz1sETIktywYb7sw5YSmBmp?=
 =?us-ascii?Q?29uMGsF90YQXjOOMbNTvURqlTIYgd03zvmopu/XCn8xackQC3E2RUwZTfQnn?=
 =?us-ascii?Q?TlCy9oj35S5LNJQs6hXinpntw7VtlIkdxg9lLQ93EhujdiAFQIwmHxDOul1G?=
 =?us-ascii?Q?9WAzexfPo19zpl+2diTS0mhxqKVvvWSnm7JE8jvK+14CQCNNze52GYKkc502?=
 =?us-ascii?Q?22xPbVFCEx9sViQocluSS5yKINn2Z85abbywRUZgorg78KdweEui43PdPz+p?=
 =?us-ascii?Q?oviiT0O0aE5pywT4x6T1vTk7vQx89LYUM4p1Gn4/ph2MnOL37rVaqfJg7lQt?=
 =?us-ascii?Q?eyQtvKtkvo9hzav2z0cyKdhtnkP+amSWL7y/CJZR3DiuHpUbYPZLJpZZJdU/?=
 =?us-ascii?Q?WleX0Xmfw1luDAsYKtkWONJgARdS01wKJabjeMyZvntFPBOVAvZ10kRJ5MhM?=
 =?us-ascii?Q?3srZXUDdPCjA5eHVMohQRMAM85rPdHRjxZRz4sp6DxmBf3nw0V9NrTxgKHOh?=
 =?us-ascii?Q?iUNjovRQQPqP5XjavSQ7RrYjOKFWBZuZovQdfNLIinQrx88S+5LIcx+EAjsy?=
 =?us-ascii?Q?fzRLE8gbFoKoMMn5fGukMzCNPaifA8bMq34DhqG8cE4gdk2wQouKaAf6byRp?=
 =?us-ascii?Q?BY71Dutg9OVB4Mk9Sg0DCS/zQTH7QI/aO8d6UfONerZ9SWl0bY+K9vAhz9dy?=
 =?us-ascii?Q?VB9i74w8T4y4v1tAD6vzz0baPmFP3tzYiZk8VVbR2Zs47xpb1aNSA2uF2sCF?=
 =?us-ascii?Q?LYBoD1gu7eARPGb9qnS5m7jJ6jGvJU5I9KzElT8UHwXn5I4A7SnbNDH7TiLD?=
 =?us-ascii?Q?BTskBDIKeJTS5nsWXRsdvbQ2ByqCT6koozg5RD1g36rxJPd1n1QGUfN6XmnG?=
 =?us-ascii?Q?a/GwOhhwDfThqh8ONRMFYzwf5VQChvX2E2atJ6cB8k8N1CRjp4ay0AcEOYuW?=
 =?us-ascii?Q?9o4GfsXM1rFWcFQQkb7hGivXMPhCajeSDEZZ/lX1I1sKF6bckThwcgr7kEwk?=
 =?us-ascii?Q?oQgtYoZqCVEfvFfNMiIM4aFa/KjBMsSsD3hvtl5wBp/eyufvlwC9JsUchjA8?=
 =?us-ascii?Q?tqup7O9EwuWYEHINlvwjyijOsOkhcjPRT/PuHWPu/BH7djqeN1DivcBV/cEJ?=
 =?us-ascii?Q?SZvTXkrNQpUREMNxpuaerNqU+MkjdH7pNMFX5/xPHx68GBysA46pLn9OpJ4p?=
 =?us-ascii?Q?oetiPfNppKsAxoD1v2Q8UnHtnpXP0fGIrPJdhPQ0CaJoXRfkEcKFnqZzBrlk?=
 =?us-ascii?Q?miWwjGgxpNDT1c/RNdw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ACHcBrF/1H0B00em4+x4cpFTDfkWieOf9WAoiYWqzP1n/5umVBVTNHpdL7BY?=
 =?us-ascii?Q?4lS1P/FgiUCCJA2G4NmxFP8huki4I1LNV+GfOP7icEvk3ebbecYCgN1FZISX?=
 =?us-ascii?Q?bh8kFMGuzH57mAbO/vX9b1VWaTt42p8LkZtTghpY0EUw1NThV4U4DsZ+w4jn?=
 =?us-ascii?Q?/MzZZXdUD2PjGSNTHqIgZpUUkUnnKfFjtHuhmXk93LJw9noA/J/WbwR8GX9t?=
 =?us-ascii?Q?ts3pV+SRyB3XGGIWNIOhMnewehlFEK9Cb9tgWSctoxtK1sS+VcXPPV9q9uWn?=
 =?us-ascii?Q?jApbyHpiN9ei7tM+VuuJaK4z7EjU1ZvdSwyJ2cp7T2Kojmlf03NMkAJXdjV0?=
 =?us-ascii?Q?tZSo/UD6kUDDSVsiFqcxmVRvB6blDJd9A1aeXlDhdObZlrOEc2VQJDp7i404?=
 =?us-ascii?Q?JHr2GdzEp9IVIXDxTW1KfrOS5AAIDFMlbWNsnR2fwRgCmkiS9yKIT3U9WVah?=
 =?us-ascii?Q?28S32MWDSQs4I2EtlWEIZsmQEb0wFt3BpdYbwzA8ZkgnigGJtLgRq9ZL+mlN?=
 =?us-ascii?Q?M6vqMcAQdSgMFfz8AnMb/uMsFWvO1VRS3okLlxKXCfW0OofLgbFJgeQrWICO?=
 =?us-ascii?Q?wjgGhna/Nl3W6S16UPNxFs6C4oxcs3RZC7XWHa0cTyOYSBMvr7HCAIodXVEG?=
 =?us-ascii?Q?p4bY4vNELIuw3CPgIGUrbiX3eDZWUAQM4wXRXmMMXcBt8J0KbNhpzsdFVsdR?=
 =?us-ascii?Q?u4nsF+rHIChZ4vOvbpC8ObPoFIuNwS0gWxxUEUQIrnBSA2MGDn9dnEBhhd7g?=
 =?us-ascii?Q?Ec1upGCVbr0TZTy3Bv83EdHqQOlNauBGsUOwhtUWKHYXY4SjNaSHm0mQjSwm?=
 =?us-ascii?Q?+2SAjXHOZWExzyhMBQBkiR6og8Zs9X07HJ5YjZH0X+R4Hu3H4/uToc0gel8x?=
 =?us-ascii?Q?Y9c1UEieP+qG9CNzrHkNIPV9JqRp96TFiZt+sFuvAbfQEV/cWjBPAnUzWL45?=
 =?us-ascii?Q?LRmiusOiNdEuMrruyqIql9+tOh9QozzcWcMDygdrH1Zdf/VAv91lWYO9CbR9?=
 =?us-ascii?Q?Uh+Su8WRTi9ykqqQfyKrjg9fAxEiITatWltOO/z05+/NcbqbOStOToF7zLjL?=
 =?us-ascii?Q?2ijq8wQApYsmEG08EubJ1Dlr8CmgXhki/8zVYZTLqz36uu1qF8yeNatx261n?=
 =?us-ascii?Q?V+wa33Axco0HWhJyfZf4ddQXZtZUxjMMslm28Wi5c10z4JFqO0YF/ctbZ+YT?=
 =?us-ascii?Q?F33ezvlhsR9Hb/2Myf62Vv/buXUmHz12VOsEKqyV5EKylLU+H2texURHHlj+?=
 =?us-ascii?Q?vYpBtAuyPoYKUpJWrHWUk376LvJUTgp+wDuqMOiUIC0IBnHyaLJf5O4/3UUs?=
 =?us-ascii?Q?dZ3RegOkV5t4aypSVKHgZfgjvJc0Yk9Puc3/23IC40i7j0ZGzhkK2GYBHJSo?=
 =?us-ascii?Q?YtethSAmIjDDKngakipLzWUiIHlFn7gGDTmUj28E5W9V6namERIjZ+st+Y8b?=
 =?us-ascii?Q?8Mz9ogj4hdRyvhald1Xd0TLpiSB9AiutoSiAqy9bfu9lK6XExO6sfJTIpRwx?=
 =?us-ascii?Q?n9CzlmQsYRLTXAlTCOv+KNcL5t511kd/6vDS8+ieRS6V257XAhp1ZzbiLAfr?=
 =?us-ascii?Q?gMp5IzFSsQpjBX9NegLXvseAMmGzMmCZAF4VcBiFXDNlF3400S9YdKgzporg?=
 =?us-ascii?Q?8o5fCwURRWx5KfV1ODA5e1lpuc2MWZsDbWRbxUqg+UI0Gg9DF5+JTxkS+3GM?=
 =?us-ascii?Q?yuOuizi670A9etbEudfjGdpdeTOz4MtleIbIGt2AmrgIjUm2YvX6xATivd8o?=
 =?us-ascii?Q?SmAzOnkq/w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964eecdf-01b0-4398-bfcd-08de70ee5dc7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:21.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cu9N6jfBLtzakf3cmpeSAPX+Tv09MFDrI3WDk29P8Fz+eClTacEhjYssP9XAs034wk4R4yxUX88xSjSF09RwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

PMU_RESERVED_SIZE is computed at compile time using const_align_up().
The total reserved size is computed at runtime using Alignable::align_up
because it depends on the heap layout.

Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 7 ++++++-
 drivers/gpu/nova-core/gsp/fw.rs | 6 +++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..0e3519e5ccc0 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -11,7 +11,8 @@
     prelude::*,
     ptr::{
         Alignable,
-        Alignment, //
+        Alignment,
+        const_align_up, //
     },
     sizes::*,
     sync::aref::ARef, //
@@ -270,3 +271,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K) as u32;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..086153edfa86 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -183,6 +186,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
-- 
2.53.0


Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846922EC09B;
	Tue, 10 Feb 2026 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691601; cv=fail; b=G88eXXEpi5sj74eTANq9hjKfv3/dCj1oSfS26kuG6MnFh7KAPN69jEAZxxfE1t7A2sUsxE6D9Qdm98TxquhbaSg7j795jfTVKksobM3sENIjqQDGATZO7DhdV2OoMR6Xky332DxqOEs7Nn0Y3/IfN99pQ0q6NqrvlxCBMTZbYpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691601; c=relaxed/simple;
	bh=7BrZS5fyux1LvI1RUUlb4mP99tUax+osLxqDOeEhCjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JExARBkUhdiQPD7Oxvzwqe09JCK94sexChPAippJzsL3HjI93ainLnp4u4G6ky5H9A2mVo6g84naachZ0qWofLBDSiJXqTcC+rl6UY9tsdP/zUGSfiAx61hiI/xGOlafd+u1/BnFgQArX62dNWDGU0FEfJRP4pG4rZEtV3i2F4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=giFfJFFn; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="giFfJFFn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxKcn5BjPeDOv80BzPz/VcF0K0pZl1HOuoQAjoUF8HNUE1wbJ4zyWI38+0PgXITYN0fA0Wrv30ta1fUEp8qxUcqG/I/6vI7CpLxhHB7Nm7A8oS34NhKOLn3lL3LtK3qEzt/65hZdOKnzOgA7tEWhHtztJetXl1ptwWxqec6Trr5oGO6CNarg4dOAGGdVuUSL8eegsQMDrKTsWe51VpXGEBO/QTyR4tQFQYqYq3k/aCAiIYJyTViNrOHDYYHIJ0pJVza7SP3PQ3Ctb+zS7Ihybt5suOZEbPHYVopJ9lWd+NaB7f9XUKkFzDLOiUSwai1zb+fe3F2mayWzUGNJxkP44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MU6qW4ToRTnyodPNpndtobRliFJFuEaTeVxkRRWtH0=;
 b=e45TEiccnWnDex59VIFQY6XvbFHbdgxF/tD8ac7Dr4ZEPmq2jzbwDTGjK5nwFQDTCXMC+ghCqDJb9CFyIaXjS+qchkgSBgC7f4hfdsz1HINu1vJe5p4ibW3tBpJ92jWfo8aNSk0E4MA7+2mIwkWrms5i+VMR4B/HwJ//5h3uQ7KGoS0JI10tntZ2ZyF+z70ZRTaKzgQvH3a+o0HVSDkNQLYNC9qSSV6cXOZkbfEH2sSpuaoPi4NNmBAnOnqBycConxUJFgCNNOLBUdVLvXr8TMWL2ngDnCrqA0WlxFh8x9yuas7sC3yUisczw3pVZMRmwFSBHjaEBucloCzu24/8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MU6qW4ToRTnyodPNpndtobRliFJFuEaTeVxkRRWtH0=;
 b=giFfJFFnjJxNWwYnna8oupU82vOJBkQRlmoxP7X6KJkhQktCDckoiqfIPh/9n3PsEEQrMgampPJY9BsUEFBa+v/pvt+5uGAlYE8IK8I1c1GgNApJDGtKI41QyimXdAMncvGJBlQO4LG2vRnKPV3VEQQ6fYSbNWxtsas8v5mB+VzTi6h7OUAdU7DjTse0Rz79IYBhmqg8PikLne/84JZCYaGNDoG5scldIW5bBsY7dG9vN+52iROVz2RaLCjyFqke8zoNb91vDLoSa+Ln+jLIlb5yYdmjyRYxH3zd/VWcdDvLoROer+5gvMckMjKOETrKTwz/KNplA5Q7THRSzY/WoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:24 +0000
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
Subject: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Mon,  9 Feb 2026 18:45:44 -0800
Message-ID: <20260210024601.593248-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: a42ed1d5-bf3c-41aa-7584-08de684e9446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nl+/CRKeKVxdtJUh+hRG+4lRyvynDcoUkinIZFd5bV8PTv8Ggz+7N6cdBtOu?=
 =?us-ascii?Q?zwZu3ERf/f+o+XVbQpTinHcUM0tc81fFRrIXxNdVhhCVzLs5BrWTsHEhU/h+?=
 =?us-ascii?Q?Q55R7ytSQP7NaPgRCNtkeDqZ2rg/vA3aXP+V/No3dZGOOBvVGNJQyRUgDnr6?=
 =?us-ascii?Q?nXoPc97e7zQpNCxUyDva/Rlq2EVR/6UB1LHYpa9y7ujcD1zVGxvTEKh7YY1t?=
 =?us-ascii?Q?w98eR09TTFIKmWBQiUFae6D45U0Gqxi+OvWnmNW7GIcnliQqzlNGjygnzwbP?=
 =?us-ascii?Q?/6EtkC+NQVdJcY8Zc36dePxmXKZMj0COhLzHamBGvx/g+uooeAnQ18mPeIrx?=
 =?us-ascii?Q?07SzAsWMoFRZYmy9744r392+MwjJ1+B5MyrFzs8s3tKgLQVnhL+xI/SU2+Md?=
 =?us-ascii?Q?in4HMn+o+AKqeo4INFAMyxb+A3qL/3YxXH9XsBspOVsvXoNIZ0tIqEjBYF0z?=
 =?us-ascii?Q?fZjH8DCo929jUM1J4CS/MHvb+EtUV2BwzcBj+p+XagIbt1LWyiwYkmDSOnEv?=
 =?us-ascii?Q?00q7EKO1JdgBPtitaOHRMYqMuAUduQnTGVnlvoeGTW4ClYnXh1avVL0PbNuy?=
 =?us-ascii?Q?CA6wAyM50k4Z0MX+prAsV90TCJIOeKo2eCnOHv4djgkW7rVuttq23vY4It3D?=
 =?us-ascii?Q?3Hf0v5n1yZrw9pUZsRGDvFwbbFAtlR1/SOCu4TXyp6bMO11SbNa3e5sI962Q?=
 =?us-ascii?Q?RywUAkzF+utVRfgTgOH9Pli8oKCSpJD18z9PYPaYBQUERtTk2J/k+7xQ7n0y?=
 =?us-ascii?Q?H/7ElG6g4y0vu2QqPiYyIXi1vV3Ruj49pZ8ixvZIQPguCUjheLtiXrwc3Ghe?=
 =?us-ascii?Q?YQQdn2uL3EmfoBIrGFuD3lbwTn+k1PLrR+An+L1O5q4A05gZPyxj1R/giCrL?=
 =?us-ascii?Q?DuRAzLBCg0NrojPi3jTPOprgreKkpJdvnETgAzQzCSGTIdZoWBKx25YnULm3?=
 =?us-ascii?Q?X2Gff+35ceeUtDMfF/yUDTa/OLc3SA3vy6r6J25UoNpjUHRXDsOIJzcSz8C/?=
 =?us-ascii?Q?ollHmN05AUc2Kng6qhV7qGu8wv081mAgUoAd0jBr3TkfBeysdlhVNfBa1nSy?=
 =?us-ascii?Q?NAfnWjdRTDtpvdH9j7XiMpPsIHnBoaah1CehZ54xoC9ocaFhUCtKOk8jbAGC?=
 =?us-ascii?Q?NYiEUdf5wUgaYgMy+WG2m5GjnxOEXIdbgBt79dJBjUPBwsms4g//9acwvyxZ?=
 =?us-ascii?Q?Qbbx5fGz3b9ZeynHxCeRDYoXQ8/a2F/7LZhS7hIGQzdHzvo5xsnLiikCIFTM?=
 =?us-ascii?Q?quykbqCxfxSp52WsyWJrPmTYuODSo0SpSaKVQD3W7VoOM5XgLaF8pUKfZGQg?=
 =?us-ascii?Q?VNWK1g7smZ7HWiaWb+l2WAYGPL8SrUrLPQE4gX1smKyiHG7bwbYyAWsf4VOn?=
 =?us-ascii?Q?hYtPKBOTeR+KpNPMfd3BVMZGAbt/Fi8uGRNDEdxnjdIfXUznixQFuSEJvvNB?=
 =?us-ascii?Q?5s4w5cwtQFEsItiQZRqKu+Vog1BnqtMmmTVkHIvd8sr/P20JKbKcQI6OOc8r?=
 =?us-ascii?Q?GTNlEcphwV3HsaiG0DsyRJVdIxf6tt384E63/oq5Z86ROAHTIi2Svr4SbbWM?=
 =?us-ascii?Q?XmswbZa9sQB87xhgYvM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NI5SiBJy2uAesG6jd3x9ZUoyexFrtHYjcFV7NUWjofapT2LE6xygNGMRhOGc?=
 =?us-ascii?Q?WKUaQKUP6HEPNmxtRoPTiaTfn5ZCtMI/7FT7qiNKYmiK69wZRp8M74CkQCKo?=
 =?us-ascii?Q?XTidwvhg7TiX1zP6sR5Ev+P+CUePUQ6PY1OGHSNCUTlMfgPoDEeNc0sEWeQh?=
 =?us-ascii?Q?dAQuzjT/6Xeem7+TLFz2i9FDjOBE+RbTAhQOIVkIyrCXSxvhDkAA11hRIg9Y?=
 =?us-ascii?Q?7/Kt2/UuFd5ZGx1TQR+uH1eDnATUaQw32XoUvHDHdmSlG+GaND/hGoGugeLw?=
 =?us-ascii?Q?6nIUI6HItVRfkVLG2H4JsxDLgMR1+JBSKVtwl+oG/9c8lu/ZChwVVa7PCHKN?=
 =?us-ascii?Q?COL3KwTZpCWA9yuz8gVhG7jX7MWUklOq0+PmmvXsDdjD6qUD0wT/5yRie9Er?=
 =?us-ascii?Q?TK/DuJjDjLqdkTE0u3FltZHC0XYBHJHR8F3OZMUefCJNhH/QDn6+gyBtdC8y?=
 =?us-ascii?Q?aZfQP6VcVd6qVF2oA6VweDsQZk5CwLXoSwdK7Yv3T1wBLVswNUQTT3/kB00M?=
 =?us-ascii?Q?m0J+4bxykX9sNN1TM/sTCRT5oUckWm7esczaoFC41fivQtJzyAU/b/FqbOyX?=
 =?us-ascii?Q?9a1L/mhbnNCNavmbzJM0zvBJ3xqLWQUQU2lBm00yVJyeTQ9hrNMNUS6IzBAn?=
 =?us-ascii?Q?8YkTynwa/zxSep5RijJASm2ogB/OlKYZzO+Fz3Y3R3wVHeLyaaynj2QIKmK0?=
 =?us-ascii?Q?RDMXGwCfz3lcG4qgxPF8v2B2aiaWRuYFu3eYCpJwYbDrFxeuV6YO2If8Z9LB?=
 =?us-ascii?Q?GIUP931Q/ubtH/Iq1rSazJriSK5d8rNuSUyUnWQbPUGnqHqaEWv9MI2Tteno?=
 =?us-ascii?Q?P27wYh9y7dt9rXRGnFUlaPDka3K55CK4xSOCgfLKr5uJjcMPYOJf6j+cNXMA?=
 =?us-ascii?Q?X8LRp47UEW7pTk9n3b5wAqzLYzhCZn/p7xK0Pty+BLEbnXfPOzEWN4Gvx6DB?=
 =?us-ascii?Q?JElqMQzfjQMFTXSaCCV3FEHGkI1b711MiOpAZ5Hhz1GnI9/Uv/DrrnO+eueN?=
 =?us-ascii?Q?TlHMhYzh4AnG6TY5GYcxezlOn3VQfUlgpijcUMhg3kGFckIL+synLthet88K?=
 =?us-ascii?Q?MeBZzXn16Zo4Q23IhiaGrWIisDsXH27hCR3jhEi1Izf4CpC0EhTXM7svTLif?=
 =?us-ascii?Q?q2+SrkrsWfUVhMrq7uR1lIpZeKbdC+u/Qdmi6jtmQ2xsbHb8nQ3BodLzMnqg?=
 =?us-ascii?Q?iqD3B0UvT/O49HeAQA8i8Thr5rzx4RECGSgOBPvDRGua16mLy8cndVTHbOXL?=
 =?us-ascii?Q?yyP4j3XqQL/wwrCXHaovUZCUKPrtSTr0FhCT8c/9wLcbOq/+4RTNbyca1IwX?=
 =?us-ascii?Q?N7UHSMWLNsShqxstq4zvqaDUu0vKE5/MHhKyX7RJegYulKVyaqMRwH4WUyku?=
 =?us-ascii?Q?C03cO0mDENm/axV0kqQDQhTIslcKq0rV8vAAQVKn6oJnRLbRbWYxg1LFjmzo?=
 =?us-ascii?Q?T86OfIE8FOSyQG3IhFdc46v773XX9E4NX5J9+FadyFMo8bXLQsHihMJiMwvt?=
 =?us-ascii?Q?BYq7C1ZHQLUZIVmNc/S3ndxGuWlsYIRQl4nu6zja74FsQWw7zdLbMuYdN7eY?=
 =?us-ascii?Q?DxVnPtNNlmA3TIhPWY2a0zha7/lJk6qkGUwcornOSBO8nJk3P4QFsgTf1F/T?=
 =?us-ascii?Q?zbl3+Pi/580MycRuQF7D0lPwPbf19fcpSG07m3a7G3Aw9JwZMV9+E34kiuTX?=
 =?us-ascii?Q?Slmpx/sS/LQSMbEIlhDxD9yQCjN9d5fDaICbg0+QQn2px1N+p9k7A0o0XohS?=
 =?us-ascii?Q?hVO92RaoqQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42ed1d5-bf3c-41aa-7584-08de684e9446
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:23.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7c4zXTG+jRQ0EBeh7xOeUfR3b5O5gF4iZA3X2mAJwPSEAZXIYylpUd5QqO41sN+NaTp4dKC1UzqULrKRZxKMGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 59 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 13 +++++++
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index cc3fc3cf2f6a..fb1c8c89d2ff 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,13 +5,20 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::prelude::*;
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -29,3 +36,53 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_wr_mode(true)
+            .set_offset(offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+                .set_data(word)
+                .write(bar, &Fsp::ID);
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_rd_mode(true)
+            .set_offset(offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact_mut(4) {
+            let word = regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &Fsp::ID).data();
+            chunk.copy_from_slice(&word.to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..1ae57cc42a9f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -8,6 +8,7 @@
 pub(crate) mod macros;
 
 use kernel::{
+    io::Io,
     prelude::*,
     time, //
 };
@@ -431,6 +432,18 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     8:8     br_fetch as bool;
 });
 
+// GP102 EMEM PIO registers (used by FSP for Hopper/Blackwell)
+// These registers provide falcon external memory communication interface
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    23:0    offset as u32;      // EMEM byte offset (must be 4-byte aligned)
+    24:24   wr_mode as bool;    // Write mode
+    25:25   rd_mode as bool;    // Read mode
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0


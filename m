Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5A34EEF3;
	Sat, 31 Jan 2026 00:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821010; cv=fail; b=DhsNL0kkTMzYOUDxCI7x9zPVpDtlDRla6BXHOSNM4r0jgR8MWxXueeefV6kaQzljx1cmIobyGMyUwyzyv25XiMBphxoCYNMh+51qVbg+aLMGkb06BaWn2Ry0bLyC8/C6Tm0vjHEhIEdT9Nnih/Fj9ToQlQEDNZ9R1ClJwADbd8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821010; c=relaxed/simple;
	bh=N95j/TuXqqPJMv2h5KFli4bxbP+Hy3h9Gf6EzzkBMA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rUUWvwjAMxx5QIrXhz0pjfZYCDGuVnRx2daXEfggbfdrJr1STTLuDb0jpVOdrL5b35TWSfW3pMRCFM/8Rug6hq6RV5u9Vt7Bgx7pNDrJHiJLLEPT/MN3S3aLOE7QpQ+VRvNFi6QLj1UDlWi58KmdDxyhBKptKbO5DBDc3pw4tJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R8tazBgt; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R8tazBgt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cucM4LP/gjG0o5K3y4Ksxbdhj7nXXZaY+SzhWihPSAx/XjOEwTtgJ32efXicwrlA+vyrNKtLNGCzql2v2qd+lOdHkTmr4ITwwhkMSJi54P1K+GNFAFJyDh6guTsXMZdjrbNycfxM7lBVkd2A9HL4cKRPUBo9T4gwqDNnKc9UUXb8yBZ8JCoP14VXRilzkXAbZSF3QPc/EJsHmCh0Kw1wPOpl28CPPEsWYpPvlNwrGrDBGv1G3Jf2xeP4+eYnqM9uB3MIA87HZFpbLRZsu/paQzbrcdeKJd6LI8q8P8DHjntzWRqAQPkjv6Z96Fn16/LIBEFcAd83SFWGvTZRj6LmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m6FQBL9gf5w3QotT3kRiKbiXZtZmO4BvfwMbNCQVoI=;
 b=eYE0mnraEoRmNUpTfHMbqwsfZwNKUxqO7ZYpMeMGryNeF7m0hik9DlXnlXtNVkMF8DPevm5tylqs1GcOZkuLeQMhwZjUuC9YzaZ/0Nqg1+9txCpNlXJuqh2X6eUcd6+DIRMbuqtl1QqmIhZBocerAeZ14bZZ79h/VmvCPXOAp8tcCOMO1b3L0TKGHJCquXZhTSGsu0c6R8so+BezhNE2CT3vtBXyc4sdg0IqDhBPnrWfWRXnOxIhYwyYWWg07EPMJ5Z6G5eG2Sk2Yxuw4Zo3yuZD4lN5AVBSQqMYUGYC0dB/aegwpLd1rMAHgW95w56zTqWksKsvfbTxq2KRRai5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m6FQBL9gf5w3QotT3kRiKbiXZtZmO4BvfwMbNCQVoI=;
 b=R8tazBgtDh/i8VJrgbu3Q1zu1EuTtY3nfKvrJ6qEUNe8N8cENK0/A3do4ENPTPnDaKGA7XiUOh4pejl/f2JosuiCL1B3rZokEnSCZLdI6BuMbCjkeeejrPnI6a6DlG2DUr9DYJTTIji6L4aPObgzIahTtEcQZ6aZOa29Gdo8V0ZEcYV29rrn9CNVXl1U2vP1n/ZnDi+KI6xapbfI6dsIAnE/X+Qc6BgaHX1MM5tqdyg3XNCr659VYbfXT69sKG5IZHuQX/khtUN5NT1K3g/5AB/axK/PgNJ/cTlbHmtU3gphcTrepT3Do5HrpZHxKBnpWrgeNK9RJfwUPAVFPuodDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:39 +0000
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
Subject: [PATCH v2 24/30] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Fri, 30 Jan 2026 16:55:58 -0800
Message-ID: <20260131005604.454172-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:217::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 637fa8b2-e6a7-496f-f115-08de60639776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lwNLZGFmyUwLQ/I9pRDJGY9qqn38ETrAqOCWu8nvvHqZnYKKOuMWZDcERj08?=
 =?us-ascii?Q?qCFTR6kGFVticBwi8lllTGN7ynz6qIl2cRJe+FILs1tI1afXrUiBiXe5H4jf?=
 =?us-ascii?Q?yGKBcl3CV/KN+gblrfg3nt7fEMY/Itp78HgoIRt2TzdW0wQnlwXA4bzRiz9I?=
 =?us-ascii?Q?FOTAqatqaLxyYINixd60LrL/lcBWMU9YRjwWJMLVmwepY2Zc6AWf0GBQek7g?=
 =?us-ascii?Q?Qq2zRIdcOOnVZbNDTnreTxxezy+5PJsh/3OpQ1Ri6pWgTtkTjSjmWSKz1MU/?=
 =?us-ascii?Q?9PPgQu6mW4V72dw4q7apWNvQdv/OVQ/O6RzWvtgFFbYZINJ9GAhztTwkgJo1?=
 =?us-ascii?Q?SVWJ5lqixFudcdAAbi2t1dd1NueaiXis1W7OCWM9QSn4it7bwn6/K+exRmoC?=
 =?us-ascii?Q?xCLyb0oOlP6xJKoM7p33nOtmE+DcUqBSvOgnn1rk+w93MVqcpPi7sIwkOdxQ?=
 =?us-ascii?Q?z3qHJ26hjkQ+/nOxR8hCwzVqEjJnytIxHH2faLZNdR6dusE7TtblyJg4C5ph?=
 =?us-ascii?Q?FJPhN6o8hK4yJyU4z2BUvf1N5XIqQDpTYdLdnoHuW9i5WZapSi685pBqR+BZ?=
 =?us-ascii?Q?SRitNn/YBx6sl+3BeMMZD+8VmFaUH2fLL+lrS7FIXhnEop4orb/ui4lbc8av?=
 =?us-ascii?Q?YLXt9yIekLRyT9OlCVxjcKz0n0zDXAocYgzmO48bg4b3IRm9m8TJKNcTJyeM?=
 =?us-ascii?Q?2LeraEG3E7ql/7bfnLfHG9kx5oigi1l6qewn7XALAbQVAmFewLP0IZRdnElg?=
 =?us-ascii?Q?pMW7fJurmr9zo+A4M88sFlvY5bsZ7k4Io1h37H75+6KklKkotYtQdkKLLKw4?=
 =?us-ascii?Q?kfh83iZ8iW+gKfBtI7mGV+eDQWNbKiQdWO04tisCnUhZuuz2ufzA7YltKbhL?=
 =?us-ascii?Q?lziWQhUcfkcrOSQOTKV1+HkSgPVSbvlWm8f4Ii4IBXJStRKegGcBp0duxE7b?=
 =?us-ascii?Q?IbSUr9GdiM/aX/v7SSec6/+NRwU2nbMT/4FeKbaq7R3gShUkQXc7Vw8zHJ0H?=
 =?us-ascii?Q?wOsMOxUSPAmvJzRiJSk523aVmDITiQtLf7qOMkb9P8H/HlwD5KZMJnuZNpZm?=
 =?us-ascii?Q?NzVOvHkDTl3KVMhbduU21jjNQSIGOQBnV2SbJmSdRZvCJHlw9xnW4B3YRtNh?=
 =?us-ascii?Q?gX+lyPetbCAfNBEafj6dFoolpfk5Wp441+k2qPHuozW8TBYpLzCr5MEX7LOp?=
 =?us-ascii?Q?ur7luwQNce3EG/k4eMSPEHe3Qrb8HcmeKTU2vU43ZoAe9zRQ3nn4J2jT9unz?=
 =?us-ascii?Q?F+r3ETPgI5q5AGweUExgPBuHHp6CPgtGGx+cxxwSz69I+z9zO6yB4nehYDsl?=
 =?us-ascii?Q?0kg4yyiqZNU+CKnNf16QsO1FsG2mCEUgQCPmDrEJ9u3YwyS6SevSNYV2UOqe?=
 =?us-ascii?Q?rTPzvaHzjcUpyNp7KcPwr5mh5pCJgc0FXo57HtWCjbSlPOZbvNa2FPjKZtp7?=
 =?us-ascii?Q?VsfBaMBDzLOayX8yFg/eYnCoLwQTIk0ugrnasljsZ7xjTL+gHXs9CAiGUFcj?=
 =?us-ascii?Q?twQJs5asu7r3UGiH780v7R9V3PmIsiKFglKzaAC7uuF4EA030H7KihlRrZS4?=
 =?us-ascii?Q?xgNZnSpMM2Jl82Khrio=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JtXmkO9PPrdzccnbSsRs3qexkYOCOhumB3Lc7crOxsfd5kaeGYio53B/xCpk?=
 =?us-ascii?Q?wRWulnVYr2Vtl/FH2aEBNWaGWrm8faGj1GwVjAJexWKJvJIJLxYAoFrHc1z4?=
 =?us-ascii?Q?zXwvEd5bA0mLTgu0WmMe9woswMk473TeQdfxB+ImVytfwFReAEsFGA01nvaz?=
 =?us-ascii?Q?cTXGOmliy9n1FLJA8OVlwH6jqrhPuW6L9tSpe90JY61sUqM3h5cTkMkFFDcw?=
 =?us-ascii?Q?rllAvpN1m/UxQ/+GyZ717pPEpgeUMJTh11T8xb/MljFyB4hlV1zgP5U5MTa6?=
 =?us-ascii?Q?8uxTNBbTxV2UJ0hXi/A7nhZtAQrMoZn5VFcJ9Tx7AGlDMvgr4p+SdAmrsjxG?=
 =?us-ascii?Q?7be5SWmEi4qJbMwSsDuuk8Qd6MwKBT7L/cQwJe4EYxE+I7JbwRqAsTWY4/vs?=
 =?us-ascii?Q?LcrD+7h1TdZK8aLf5UlxLOK4a/CB4VLlnFvoXjQLb8EfbvqX6J8vo6VoMnyU?=
 =?us-ascii?Q?qWiRDOSxkr1xTBd6EqFrriyAqLpQZEciD91QPXrYL2DJ2ibsjf722Aj8xSLS?=
 =?us-ascii?Q?KhzlOdMCycpQXe+pBF0j6UZXTnodDCX8c5v7BTtdVZH3ud9SbP6w7cS2eGYr?=
 =?us-ascii?Q?GRWBW3Z9CVy5Fi/oQ6vZxGop12s5LbADTciIh/YyACjpNeXzzRxd4F74xLHl?=
 =?us-ascii?Q?2F02+BMIDBsRHsdPSq2ru335PUSHEDYIUKHYeI4dwI1Ih/eksZbpuBIsOoK1?=
 =?us-ascii?Q?CtMqv5UqWtzJUgP/jO6YfmflAmcf4byHTg14zY2joXkBpKN3Xc+9Z6C9lCk+?=
 =?us-ascii?Q?AuvY0dkX+un9FoE1788q9p32rFwgju/yYE7zMwLjWjCo1QGvbAqzYDHZrpon?=
 =?us-ascii?Q?xd0Gubx9bWdW46Dm6QVQRWu4/bvB770Kg2a0Bopk6v2voAFZi9L1+xlWhFfu?=
 =?us-ascii?Q?7zdduCnTSGsDvGhtSLf/2mzMPLGBCP6F3jJ+3q4IVwqRzOy5PfORduThTqJc?=
 =?us-ascii?Q?C28WeFEbkt1Qreg1S8THe/65jp5iKqt8JBeB1D/4nP8+mBc64giCetORAQ5U?=
 =?us-ascii?Q?tGuluUKuoP0ZS1I1PcHjQ5v4MNZ1FWgpjHwl8olT/TLm81JbqZ8DpBBnfH6k?=
 =?us-ascii?Q?RVUAxRNn+ujS/H/JCN56xoHd/nxxevdn5ohfgXio3Rw9s05wIxWZcR09XVCd?=
 =?us-ascii?Q?8qDlsuBPPl2kwiAdtIfhptmia9xVIutLORDaBwMptOkRTHxFGHUxHsdhEE2H?=
 =?us-ascii?Q?oR2UoZXtPzmW8ZGalKJZW0XRt9b75DiyPeWewgzJceoktRUZYYzPuFJXOsL8?=
 =?us-ascii?Q?V0UqMFPXqCwhvCFyXiEoVo0f9THGY53WcF9f2D/kGHSXY62w1cjNv0UnwZV7?=
 =?us-ascii?Q?I2CzaxhHn5kEx9e7r/KneAt4YMBrUoBb6KSggjB87rN/aPlaen/kQsvO/Bjf?=
 =?us-ascii?Q?10MZZwy0JcrA2xV66mckeFd3vLU14M76ocY0KhlUgU5d2jNo1BHAWgXPcag0?=
 =?us-ascii?Q?drmdOZSlU0qsV2meCDCxHGcP0OCFQmRJofblkZSzOGF0hIEMS3xd6m3psNKk?=
 =?us-ascii?Q?Uo5loLuv8eae2YpH3ik4rq5HyB0s1upa6N/BpHG6yAFu2YwSvK7a7JeE/uTc?=
 =?us-ascii?Q?flUNU0fDfsvoAD+JgoxeM6AL1CFwlUzXVSgr10e/3QnbGcouYXcpWZXSD26G?=
 =?us-ascii?Q?wEbenymr3lbQr6Qk5B7XyH7iJ9NMbtuCAq5LX49RRmytfJjQd9U16Xtk8ER7?=
 =?us-ascii?Q?epFgNguxYNJlhG3E/l1wjeAcZn2lgWmfG9XhkimgKL1p4HUN6dYloN4D1Pvd?=
 =?us-ascii?Q?V4rGV27Bsg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637fa8b2-e6a7-496f-f115-08de60639776
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:39.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29c4B22BfAkzEXXpSpBrTKOjaUI8C0j4q7NFfQ9LdxXHrT/0Sxqkqq6OK/TtNM8PmH52A7HjXpsr/qyEVttNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Hopper, Blackwell and later require more space for the non-WPR heap.

Add a new FbHal method to return the non-WPR heap size, and create a new
GH100 HAL for Hopper and GB100 HAL for Blackwell that return the
appropriate value for each GPU architecture.

Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 14 +++++++---
 drivers/gpu/nova-core/fb/hal.rs       |  7 +++--
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 37 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 37 +++++++++++++++++++++++++++
 5 files changed, 91 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 3a2b79a5c107..7c502f15622c 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -98,6 +98,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(SZ_1M as u64)
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -255,9 +264,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index eaa545fe9b08..ebd12247f771 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -42,7 +44,8 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
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
index 000000000000..eaab3f934f6e
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,37 @@
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
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..6c56b8439276
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,37 @@
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
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.52.0


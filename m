Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB2331A64;
	Tue, 10 Feb 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691631; cv=fail; b=ZT5h5bqvVGxK6hJdj50lvxEvLwHT0H6cwzm9vHpXOFVzKdKIuXZKXfn/7VP2u15Ry4QDQf9XZObMbBc+Jtmyn9LWys/QK5H5QRiqFVt4mHykzvFSh3HOkT61dlT5uzlDouwu3EfNCnxivpU+ijvKxJEQ9E4biG4YmuckWbVdruk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691631; c=relaxed/simple;
	bh=0W+J+4zhN6m5eDZ8+QQOzxSpngwqWQeIRp7cO/UqbQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YAa/y8UfyBSP0muWh6HVMswEoCW7g2y5EnSixDlMs11cBuvtFOIf0lgrCLsiengvuegDi0mMCuy9zX1X/PcLLsWEuyb4/eHiQrLFkStvcQi06YgX1AAgP2PUjgeGert/HkG7GisXVqDJ+ZAs+XH8s2PGKjrLQ5eARbTKrYEjasU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EQYl3i6X; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EQYl3i6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxNq/tye8iut4SB6N3+Zu5bOnfaiDt38md4tPrTGUmnDZLo0auIchRuFzhaeky9TWz+Yuk3kgl+MRd3dJxXqyMSVUMlITLWU2565rrMJQNqgt9iMVrfp32atKqBvoEw1e86FmpdmTVScIXuVBQ0le1uOp2ZL+Dmuds2o3sumULSUqdFmu69AcSKmZMbzTTCLvR4d3/1feVZWAuIf8HOA3wi204yZ4wvthrN/+VxR9udd0xu2HrhDiOnftnDdY60BZEgP5Y1wEChF016pdmsRdjXwlu6ZTAQ4hwbVXDYtQtGutHanSs88nNRPuV2NGnxNDC0K6gbolI4IdgiR8+uurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aykHuFRIlxrkSK8bYrByhNuggkwhCytdW53M9OEyObI=;
 b=BtY9CDqb/n7Zg/qinw3Xfnb28RkDf8jgy5xP+RmBrVD63u7RP/1atb60uHNsBi4lqRzfIYg4wkUlyAfdqP8OAkzSe0/BSCFTxooSx83YDjwGHAdf+o0Txw4uU7xmarKqrvunFdocfjcRKE5nf8mT+z8yxgJ7NUiTC/zPdOqxZM3hOoZDTsflHg4dpOcnJL2alCmaJR16IVPY2nepQDc4B1F6nxLL4mtkEoPA+IER2nd+TGpn9V10cmkX5qOdtKa7CelHZmf24pHvCNbm5UVG8NxVYqdzfFls76RfAW696PnBx9NlFON0xcRs+TFjyOH6XLm6QnBzbphS5naV8AWUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aykHuFRIlxrkSK8bYrByhNuggkwhCytdW53M9OEyObI=;
 b=EQYl3i6XJ8S4GTSKdnH2aE9s4Lfno6zdRCPp5EuaKgan/37dEbc1Sh3wH1hNBoZU2ir9ZQannUE1ppofWy3DHsP1F2t/Al5k8Z0C9uzUsj2VYGKmfU2QU5ZbOOLLHTMPWbWbUqX9oWDHsLsdapZj0ejjAgcPQ48fYMdBIPgHuUTEkgA0YTVBr+1ytUQdlvrGRhPXx+uG5oNtl2jcBtji8DbU0EncHlwkjHmeXn7cnq3SU1Euz0Puf2Dq/r3EfV4qXD1JtG2nM7Nv+uWFOobSsa3Bu32XYBUvW9nVQJBrR7ZaNZNWuOBm3Ko1kspZy4HbaPxkbN02BUNliKVlADn1Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:04 +0000
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
Subject: [PATCH v4 30/33] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
Date: Mon,  9 Feb 2026 18:45:57 -0800
Message-ID: <20260210024601.593248-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 632c26e5-8ee6-4994-7697-08de684eac1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CHhFeuF24DaOTzXe0QtICBSISzQ16skjYcDgTVTHRgsDxlMoATu4uQid84+Y?=
 =?us-ascii?Q?Z0tOPTHK4wsedopTR0j/g6vB9QbY5qN3dZfyX5Qwm4clZZcLax28bHllcGSG?=
 =?us-ascii?Q?w3TFnCvtCZDvGf+MCx06f9YEUuf/4LFbPkXYXQlUat3WVhP/o39OU+QTEOdl?=
 =?us-ascii?Q?lYrSRikLbzpl3YPj8bqfc+H/CYdKCri66j5utjSbxFtp9JB94q+H5jcGc+QR?=
 =?us-ascii?Q?X4Lo62cbjIU6cgR8z/gvnFcMm8nD0U+JruiUfEDoMBs/4QGpW3GrIPuYK/qT?=
 =?us-ascii?Q?YZ/QshCXZ0ZUZtRwWE2I9ZPTTfOdvL1kdU2IuJagDETqdGLipxURMY17qQJV?=
 =?us-ascii?Q?GvBFJbKuf/lHCfr9pzRT4xZCdM/pAKBn+dg0y0Clt9zWz3wrWhPGS/x1EYPd?=
 =?us-ascii?Q?+xnxiUQOd8Db2pDNYfLNdp7dEYVK/skXLttn5eWTJcZGjJ9DRgTVgezEVQVa?=
 =?us-ascii?Q?m6YWdtZh0KcmW5NP8SrRv28DfZrDu6PKIJUHXxHd+6Ladjn2cn+pG4gGsz7a?=
 =?us-ascii?Q?CXG2tm8ss+A568LXBzWy8gmBRNYyZKo8qiUmEK9CEHVDE04qlarUV6qbWBu4?=
 =?us-ascii?Q?risWK3O4WCF2L9i9oOgyiWu42QlVok1tiVH68RQ6jXso9WLQz7cSjGM+lJLL?=
 =?us-ascii?Q?huLmbcG23FJIw/3mRT0obqy6Wodo7w7+GIKMktbLtnTgbGLxzy43LqOgM84X?=
 =?us-ascii?Q?+UMWGVnbgXLRVEyDA0kgzqrr098XvfRhSevEGmow8/Th8moEn3U7IyJCT4zW?=
 =?us-ascii?Q?oZZYMqTmxV1wYYDrEgC6F915IACdyqJHN1o52p1GbjsSNdE6I4TE9e1iWQSY?=
 =?us-ascii?Q?sMQuORgu5mr8K5sCztNwqC9iiOjW8ZmwdIJ/wYmXtFSpA5ZFezkSxsJ1cYyW?=
 =?us-ascii?Q?mXN0BSc/ubwOBVX9KNn6RVORuch/4QBwHzZUygsz/6WKvY9nzUfITa2F4jUI?=
 =?us-ascii?Q?NvUJ727O/r/w4EvdbYwoRbWE8bDhojWDB4qWFXZ6b9Otrpf5OJ29on+wDOW7?=
 =?us-ascii?Q?b8NY67mXmEeWNU7OOXD4cqPgFlpn821dhOQ97+d2M6Lul46WBitXRvQLJ0WF?=
 =?us-ascii?Q?UMHUlFv6/kb53eAIixtlWbGh2EtCovAEUGb2Nnwi+9uciJL0qmayEfV0CLmq?=
 =?us-ascii?Q?VF5yhQB9Frh51ICExFAYTCuPZvNZSCx3zthuaW24Q4onh35ZGT66WV/Sbf86?=
 =?us-ascii?Q?hP51X621dE81P0wLd3a54OZ4/GrEMBzdTIUHpmgLVyOLSxneDgskPtjYyTQu?=
 =?us-ascii?Q?p4win556A2oN93NO9/B7JZ4rknLbIGdJN8qZIKWNatnJ5ld0hJRnidR7/g63?=
 =?us-ascii?Q?79MzMi3UN8hf6VXDbMofr8CFrHN/Un7xdYKBZDKzQtaB/cfGaB2OAuZlLmnN?=
 =?us-ascii?Q?Wb+1q5LVKyXMcPO7omh0IMZs+j21jBeY/aeu+jrlF8IfNxv1raYN/71WZIUt?=
 =?us-ascii?Q?8MG1+77xOuHbS1NSTZ044mlhEErIEDexrFHVfdlKjefzf0aGHw3vQ+c8w47M?=
 =?us-ascii?Q?IPLP2YpRgsDxnR3q4P7mqGdtSeflcJVieL/5ppi0ENzRja2a+zvHUlnJGUVK?=
 =?us-ascii?Q?GQw+0ZEt79b6pXl5dkc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mv9ijCufd5qs8TrUUh7CRtUWiw2RQJ7mVUoHbM7WqEmt5J5DJOn5J8GrkNIB?=
 =?us-ascii?Q?G1Tg4kzt39XcEUY79cjjg/YjdxJDo4Su1aXgcDxq8UriMjLI7EFFenkBlux5?=
 =?us-ascii?Q?jNL6mBKuzpiDHG998zW9coIggNXBZ0fzMG92t1BwbBtndjZUrJ87M1kCBQNq?=
 =?us-ascii?Q?G9BI+VFMOVACF5ABA0HptJTikZlTg4CZrLhu+UBKBgKyOM2+MbZhiDJW2ZOa?=
 =?us-ascii?Q?8oS1mqthCMi62HGYMm0wXz0lSY5/RUV+Z+1yxtLejpAAG5o1zfnlD6sQ5WMB?=
 =?us-ascii?Q?9eK0u8yklJ6ecAW/s6iCn2gPo2PdwA5WuUzzHhsMupl+cXUrGISm8cyiwfyl?=
 =?us-ascii?Q?4QwKW6PtZ2O1a3ka3k+nOSVUoQ/BG7OxfJiC3uRxWkzAqInEYt+XdGKz7Dr6?=
 =?us-ascii?Q?9/qtoT6s7jJ2biRzpGaDXbgVjqSvauhxojYMwvXVDX7N1TBzmm9qMdrdnFLp?=
 =?us-ascii?Q?z5CvfXr0QZb1FFsFVE2HAGMF7BDQnCt5uVfkavmQqKo9G+QM8UwX/k8ZT7K1?=
 =?us-ascii?Q?hCDLKCdglNSDmpbU8jdX4U/IRn7lTqyHDmaFdFterq8fFKLJH90pt+d2E/xe?=
 =?us-ascii?Q?gCCxwoPwvlBLcxZPzFxofOEVOZyqhiX8o2Pn+8Rml9gbGZMpzVd/pk2rX5JD?=
 =?us-ascii?Q?AjWg1DlHhVAYCTAXDpjm/4bSyNSo2B8TNv0vl99guoIJieeGQqTvq/aP/w5o?=
 =?us-ascii?Q?lgFXgIlYiSy4CXyNbEeu0azBUntj3aR5eazLc2TqPXsOvNAcwmx6uybzWyuj?=
 =?us-ascii?Q?5Pk/pFReQ/BeR3oPqJRZxiI3EO8grLo7/GcownYGhKTQLbRp2BUg1BU5AK4u?=
 =?us-ascii?Q?uTJp3OBTZyvUfr/EmWHcHlPQyhqEQ3RSnoR5ju3DMgWVtghg/Jbiulgy/6+H?=
 =?us-ascii?Q?jLcjGC8c9/Qr8xKcWuUw5FCfWHIEx6MxY5k3PWtMSvn4izR3CiGhKKIo4Puv?=
 =?us-ascii?Q?3JwB+nVELgj4XeoXkjG0gB7ihfas7lXH5QjYKBrVWLa2RBLYFaHvvDvJGUWZ?=
 =?us-ascii?Q?UO4xX4cD1bmOn1eqC058sBcc63f5TzPgFLyAvRGiVgDDmSzNNN+VDAAkwH4s?=
 =?us-ascii?Q?+r+heA5h4Gl71UKa5z1r9kseedeHeKQLGb2ED3rQ67/Vu3wfutN0gxd/0Eqm?=
 =?us-ascii?Q?mZuIe2+9G0KLetdBmISXm7ZXCFYpyYB/jOBNnyJvrrn6gemUjHK6R9OYd0JL?=
 =?us-ascii?Q?z47L2DiN6NSwo+c6Yos5QTvBMBss9kQseUFGSjUwOkSQWMlidLmjGLpwCuEw?=
 =?us-ascii?Q?NhasOqzvUlmmiiS1xNQTsQG2YyAOEbYp19Jp6XgfJUedyEvfK5DsI9cYtEnH?=
 =?us-ascii?Q?D1fkH7u1L/s2cDbJ5I3p4nNZLxs7PkaGylDPOj/4Mg/dNfCDScg/q35WSxQa?=
 =?us-ascii?Q?+NkLZzZu+ya2GaUYEy7Iwv7YTVRN+YCph/4/3E6mUUrFIdqPGa1wTKiyuPYJ?=
 =?us-ascii?Q?E8hp/6bKBHhbJpDcN+aE94bZoikDdzwKdY3sOMK0aTBLZ8wuyCQmBQVjM2jK?=
 =?us-ascii?Q?IOttAi5nPqGJQIhj2KNqzI8gzstfOLjYWyfNWD5ieKwALpWCjcR8oPKgacjA?=
 =?us-ascii?Q?Xp2PCGuxkvpJyee/snJ6y8IIKjvMBycLPIf3y5kPKde9LydYjHesvha4QHcx?=
 =?us-ascii?Q?Hj5nhGeRjYlabB4AHks3BOwvZN1I7lYUhfBXjfPxJcz8NPxTTkG1QIQ97DD/?=
 =?us-ascii?Q?0QqUiKcbDtsWoXG/bjlhy305AMY7cSrqYVx/x9e0iT2fCTd1+Tfa8pozIJLc?=
 =?us-ascii?Q?Zqjlf0o7Vw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632c26e5-8ee6-4994-7697-08de684eac1d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:03.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qoi2BJKrLhoK09lo/rZT3H6cacyergM5ISegYWwXWhR2TIkM4lU2xOdZzwiPhuo3tC5WVkl8Ys7gULRmZfRvYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Add the FSP-based boot path for Hopper and Blackwell GPUs. Unlike
Turing/Ampere/Ada which use SEC2 to load the booter firmware, Hopper
and Blackwell use FSP (Firmware System Processor) with FMC firmware
to establish a Chain of Trust and boot GSP directly.

The boot() function now dispatches to either run_booter() (SEC2 path)
or run_fsp() (FSP path) based on the GPU architecture. The cmdq
commands are moved to after GSP boot, and the GSP sequencer is only
run for SEC2-based architectures.

Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   1 -
 drivers/gpu/nova-core/firmware/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs          |   6 +-
 drivers/gpu/nova-core/gsp/boot.rs     | 158 ++++++++++++++++++++------
 4 files changed, 123 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 7c502f15622c..a860f43ec5af 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -180,7 +180,6 @@ pub(crate) struct FbLayout {
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
     /// Total reserved size (heap + PMU reserved), aligned to 2MB.
-    #[expect(unused)]
     pub(crate) total_reserved_size: u32,
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index edcc173c2fa6..e10954aa146a 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,7 +14,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the .image section) - submitted to hardware
     pub(crate) fmc_image: DmaObject,
@@ -23,7 +22,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 35169f3bc446..5e3c15a71e2d 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// TODO: remove this once the code is fully functional
-#![expect(dead_code)]
-
 //! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
 //!
 //! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
@@ -11,6 +8,7 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
     ptr::{
@@ -352,8 +350,6 @@ pub(crate) fn create_fmc_boot_params(
         wpr_meta_size: u32,
         libos_addr: u64,
     ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
-        use kernel::dma::CoherentAllocation;
-
         const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
         const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1e8a7306e078..80d57a54c0c9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             FwsecCommand,
             FwsecFirmware, //
@@ -31,9 +33,14 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::Fsp,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -155,6 +162,55 @@ fn run_booter(
         Ok(())
     }
 
+    fn run_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        fb_layout: &FbLayout,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        // fmc_full is a KVec<u8> for CPU-side signature extraction only.
+        // A separate buffer, fsp_fw.fmc_image, is what gets submitted to the hardware.
+        let signatures = Fsp::extract_fmc_signatures_static(dev, &fsp_fw.fmc_full)?;
+
+        // Create FMC boot parameters
+        let fmc_boot_params = Fsp::create_fmc_boot_params(
+            dev,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+        )?;
+
+        // Execute FSP Chain of Trust
+        // NOTE: FSP Chain of Trust handles GSP boot internally - we do NOT reset or boot GSP
+        Fsp::boot_gsp_fmc_with_signatures(
+            dev,
+            bar,
+            chipset,
+            &fsp_fw.fmc_image,
+            &fmc_boot_params,
+            u64::from(fb_layout.total_reserved_size),
+            false, // not resuming
+            &fsp_falcon,
+            &signatures,
+        )?;
+
+        // Wait for GSP lockdown to be released
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+        let _mbox0 =
+            Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Check if GSP lockdown has been released after FSP Chain of Trust
     fn gsp_lockdown_released(
         dev: &device::Device,
@@ -196,7 +252,6 @@ fn gsp_lockdown_released(
     }
 
     /// Wait for GSP lockdown to be released after FSP Chain of Trust
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device,
         bar: &Bar0,
@@ -257,43 +312,63 @@ pub(crate) fn boot(
     ) -> Result {
         let dev = pdev.as_ref();
 
-        let bios = Vbios::new(dev, bar)?;
-
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let bios = Vbios::new(dev, bar)?;
+            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        // For SEC2-based architectures, reset GSP and boot it before SEC2
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            gsp_falcon.reset(bar)?;
+            let libos_handle = self.libos.dma_handle();
+            let (mbox0, mbox1) = gsp_falcon.boot(
+                bar,
+                Some(libos_handle as u32),
+                Some((libos_handle >> 32) as u32),
+            )?;
+            dev_dbg!(
+                pdev,
+                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+                mbox0,
+                mbox1
+            );
 
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev,
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+            dev_dbg!(
+                pdev,
+                "Using SEC2 to load and run the booter_load firmware...\n"
+            );
+        }
 
-        dev_dbg!(
-            pdev,
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
+        match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
+                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
+            }
 
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+                &fb_layout,
+            )?,
+        }
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
@@ -311,16 +386,27 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // Now that GSP is active, send system info and registry
+        self.cmdq
+            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let libos_handle = self.libos.dma_handle();
+            // Create and run the GSP sequencer.
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: pdev.as_ref().into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
-- 
2.53.0


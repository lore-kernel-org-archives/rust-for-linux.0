Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C42342177;
	Fri,  6 Feb 2026 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351721; cv=fail; b=Bv7DXNMn+JVkz/ptr70NZ81NEZbyrCiLUGnzVlqDeo+ky/X55Xkdky6xKkTA7SOR6xu8xdAenwUc4kLIDnKZD9ejNSo/GzIy8POinKjIANI6DNdQqmD5pDuFkmGg3SVyW/MW2oRDziw1CKgMeAjefspS1H3xSyEWDoQkg03+G78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351721; c=relaxed/simple;
	bh=y3tP1XO4zsVmVEsft+wjuVhTVB6tL3gBFvwnzYxoP4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ikGWNDLnyYw1JO8Hy9QyPb2TfZMtEKbO13CTd9nDFOremt25rHJ9swI/HiX6FKtyHwD1jJoM8CTQPUgZUDB2IEc6fjcV5s4xXl+WhDQWwaZNKkFFwvjB500UV4hTVTRQnp8l9hTbCn+sy+aD57LIWpNE1wPf7+v6vvrBdhCtx+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZTXsXcSY; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZTXsXcSY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIq1j1PSOgS0uxSXtAjdfVUjXyXHc5zhjQiKEDQWG/mbfmtaSit0H3oWc10AhrvrOC27u0+G710lyygui0nMnuJnAOFjfdeLfCIkOw4Iei/fwWZqoZgrEGOHwY1r+CurHjfysRHxClpPyWc2jq4ho5HmBoySmSsEtVwDZk5lkDlW97Hy4K7QIXOaIfUOp+AxfQFEoB+K/XyMx0TrHLDtFJufldGtkfwmRIi9OyMUttZoWFgJR/lVPe3x69uuQAb1GX0HWCf2woDf4HL79/yyrVEc8gmHqEHPlfpGEq5yP/Z86sJhoCwXvin85g/bothtlfgNLcvkkbHu1hY2FUSt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhj/WPD5N+jrjhyxgbKkmKrPgPgtHyN3FxfH+8FIBO8=;
 b=dl/RzYqy89CrKdkAHCj2IWzEDgj1T5tyl+rVyIPH9xi1Vl3e7LvjruKT3UXYiu7ZCCKvBdy1Xep5Q6Qfi6AcDCrJQacCJSnhmHW9efcabKJJJ97J+nuT8RybCYrS+0IEFGJKFfFCWllnt+Ben3wpu6P1F9JS61gHBtjtwIebSGnfH+uNuR2icYm+OjCiUZIocndno4hJddBqogNAW0vcUHX3c8xtIHPjkk7EKV3nxl79VsCp/1YeLzbqXdBgUL7TIqGKvmL71lQm90yApdw2KbDlWCz9ecaJlMWSV3ZpQYAZZupD56+KkSNLiAJsfpBEvTVUZT3dQk2Uw3FXC2H7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhj/WPD5N+jrjhyxgbKkmKrPgPgtHyN3FxfH+8FIBO8=;
 b=ZTXsXcSYUcSx36hCb/kSKKy5UfhV46OqAXm2cGNjtjgNMvqiTmStzFq6gxVGCDf9O6B9oa7keJ1vh/btnUZgQgjmac9sonqRnSEOsF41H/p/4vpU7Pd7Zm+OYRsLfe5DdJpYPQ2vvumsGn2LXVKn8EN1w0raQnQ0A3r0m4IFy5CZWMTD3LplNTkYMFnX2mIWK8EwkITDyKlU43ICUMq09ej+jA5/rpfxpYefFhvq1nCghEr6rjYpHXJxC1Pwn7oREh0WPN3/3kieu9EeJ/L1XVWM2jmCokh5XxtmrkeuOv4M+Ko71CbrnXp6m1A4w1Fv7xf5BiTAEa3fgxjMeNTfJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:21:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:56 +0000
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
Subject: [PATCH v3 23/30] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Thu,  5 Feb 2026 20:21:16 -0800
Message-ID: <20260206042123.303281-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::37) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 080ffcb4-7399-4ea8-b539-08de653743b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QAtRlHyF47z5SyLgQhynjMqRHb1DiF3XtWT6knqHHLX5kZsix1Von/i4GXU2?=
 =?us-ascii?Q?QM14gyQlRKxIYXUSh8GBxULm5E6Q8RZicKRcsV4dqdy2Z3Y1AR4W44L/ppot?=
 =?us-ascii?Q?ajyAmo5o/5SBx/NfYs5YfRbL7+tgs+2yFyvbhLAI0ONzrcnOE5JokVwH8Xpa?=
 =?us-ascii?Q?/g7agS59aq5qS2zuC1akdHR4mfHRfn3qSCuiwKZulq0RuzUUxhXBeRoBW7Pn?=
 =?us-ascii?Q?xDjITUgHKDWE8LfNakePN8Rs37TcWqYsUAGEPoOexM0nNnWAHcxbxqmhUftn?=
 =?us-ascii?Q?DqMx1LNlbnsuyKePRAld6CIQQRMD6LFiO1VqVnMs5N/dvoOT9gS7a6uB3Jj0?=
 =?us-ascii?Q?c7mKFzQylYnwWgTBqM7HqWi2NIyX/SQwlNv10cZDvA+CFoDPUcfwGd+uBtoJ?=
 =?us-ascii?Q?lFOLpVV8DZD7/tMyeByxa+DqWIXYvjkwhSdwh5bNYuDTXp+UDxnzsc1RpMSd?=
 =?us-ascii?Q?tBrx2D5T3s2+xvBO1QZ6kwkMq56VZqn2pjTVFvr0wjSBrtkwVb3WlJQrxlCh?=
 =?us-ascii?Q?og/MrXzyM0WebndEdIrgWpfNNysJ00CjGinpOpO2EFw5nAR6JQ0wk5HcFN+v?=
 =?us-ascii?Q?D7pXXuUEbLLGLa2u6G0qZ55qAEbQ2xfrl/vh6Nf2Xq1Tc4zywlZGtt0aE/Pc?=
 =?us-ascii?Q?Al+MTxS5Eg+4j377jV3or41xBJPYYtCNjPcT0FhTkDzC8AUT8LmpL5nYHDIv?=
 =?us-ascii?Q?rIZXZj4+sZkdj4IzijigeASiNEVuULbUMwF01fF5luztluGURNZQT+4cO6Y0?=
 =?us-ascii?Q?Fvq5cmme3rQXOT2q0ToBcRB5cMCvBJysWarvPLOpNQyeRQMdNm0njtoTBlec?=
 =?us-ascii?Q?IW6Zgn3yiNBpcGs4/oXQLAg5lTQB9h42k4up8Ft8vvMEhL1hasowwobmzfAx?=
 =?us-ascii?Q?OL40dFHgt35nC1Etxp5qmJokZHlRbB7JrlMM5Ng0QV7Pa+OLSN1YTeGaOMdW?=
 =?us-ascii?Q?nvvhmrAvWHyiPTDR9kUlrnEqCO1dJha51QLHVHSqVzaDKNXlr0rZ8RriV2/R?=
 =?us-ascii?Q?GnNrLnPW5LXRqZuzn5z5ouT/J/ES0nU14bYeUvLt+rt/4SLHBt3NAjZ+hAbs?=
 =?us-ascii?Q?HTJudEA18h5g/V6giIpDiMklkOplyBER7MbJgklkMhMexjeVc+JddmJCQBTz?=
 =?us-ascii?Q?IAPWwr+smx0VKk6BTwnbHdkOikZxlAiY1IZajZtc2NuOrBEo+hcPs28ZKD2+?=
 =?us-ascii?Q?1P+eEySniAQ46Kj24PQua4XX6c2L2RF2JEvBFGJHflDyXQoDnVgHyCtxzXN2?=
 =?us-ascii?Q?Fljtll7HuC0l7N6PUcdlOyXgGFCpWT6fk3X9NYPYRtziW18RJT1yW48JfjdA?=
 =?us-ascii?Q?TA02cvsOqkOjFDb8DvOXV9oVNBD88/BhFued7KYWZD8B81c6789YqNJvjrEL?=
 =?us-ascii?Q?qagalY5kBFfJ1jICG7vNKLOOQ0qq9UQLQlaAcJ7SA9fDNth0pR5TmK69goLS?=
 =?us-ascii?Q?NmpXOFt7UP8+173QkeGV6Y7oJPX4sujZkxEhN0wnhsnBrqttZPJrfkexB98X?=
 =?us-ascii?Q?xCBPBbq/zbv/EjYHCfC7zKV0b390eMP97KzW6qoXNS2bHPguGmWmvvpFh/Lb?=
 =?us-ascii?Q?t9IuYQrhrJ9bHOkE4f8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eyc6rFH9+SJiPxQPtZ0VrfyOA1OdH3NVAd6ixxsseJZMdyZpC9r8gh4DH9ei?=
 =?us-ascii?Q?vTKvfvoo3sHqTBE2BzHAsC3uciWT7o5WyKUrvdExpgJWNxR3WObFrYRHJwvc?=
 =?us-ascii?Q?vVcOlCbl+SOanOAMXOr1303q6euPj0iLh3dN6nuwWCF5cBjQnp7X7P4vwjtm?=
 =?us-ascii?Q?5gpjvoKhW3abnfFnjmI1YtJsTXzLINz0ahW3zgCaNWOIpi0TF/B8WEtK+tgg?=
 =?us-ascii?Q?uWM09JhXRDPwFnVRerVJJgFdi2nDYYehiojcWZ6ZqSMU2LB/IAuLSlaa8tC4?=
 =?us-ascii?Q?JjG7nHbIAjCsyAojL3dctUKvgrk5t2lKfQ0BLwen16OiEHk0+q1l3av3BjQp?=
 =?us-ascii?Q?y/bymCpvWkZS+Ww7bin+U2RHgf8WkCoG+FiFW5o4IWKcrTW4w41xAQIcwGr9?=
 =?us-ascii?Q?bmICnF50X+fQauT8QkbSLtlu4XLpqRDzxu/rskEkBYwbghs2fGaiaqCOphI5?=
 =?us-ascii?Q?m9lnvlu0QiakaSsYaZtAgnhuwM3dQUjEVvV/BKZ0NxmNT/35NkaXg7D6ICPX?=
 =?us-ascii?Q?nwj4mOVkcmb52D/tdWSEEMj4s5K8LV+kneb862mkwLggKowLE7pVV+4vUOt9?=
 =?us-ascii?Q?QugxFaQOg6x8fbbsfQX+LLUzu16b/DsDhy4zVsCgT3CgB7aor2YUY8zpj+B8?=
 =?us-ascii?Q?3zHe+eS0ku11u4bXcTm3SfFSHrFH0d8Jh7hPLbLt+Nu0bQqhQSlCWtT1hPhD?=
 =?us-ascii?Q?Fh5y83Yebh60yddLKwTDgoJ+BQlUQqj8iAHac9572EsWeRL51DzIuSEhQCc7?=
 =?us-ascii?Q?Rt038iTFiD5IR3N5ILvsiMFDd7BsnlqO6W9qMcJhEIKJLeaizDcu3EqXaOuR?=
 =?us-ascii?Q?XaJ3teNrV01ocEoZ5iFz0pH5wm1K+GoHvB486CwUkOXok4+q7UPm7AP9qp0W?=
 =?us-ascii?Q?Ga2XQo5P67P07x/96DkkiiJNehkOuw1OCywn0l93p/WyrY5DkhHc2bgdvbLh?=
 =?us-ascii?Q?lgeIZN69Um26b+taWSLjDD5VNCUZl792LBVPMe4dUf4dzlU2KNtW8SGHWLxM?=
 =?us-ascii?Q?sJZoA+DXiNsIV0peqp4/+g6nCzSRKt1Rz8zMLCKFPuMeED4XEXPnsVr53u9B?=
 =?us-ascii?Q?gQIWLYpfpVPMdMQa84n0hsx5Yx3KYjVgc4GL8yhSWurS/YAfnySca8/9xen4?=
 =?us-ascii?Q?ZyNTI3lt/psNkOakAHkR9e1ySm5exkcFwjZmOvY6hSudqz5zaMnrPv+724E7?=
 =?us-ascii?Q?eTRuXpU1UOAzBoBO4kpd5/skDnw7dFOqo2DVfm/uxqQU527qRllxDAwziL5T?=
 =?us-ascii?Q?WqPW4w0s5aFVJ27W8DpMogiGT+76Vh4wcpKTee3nUkiKSXIzEDCZ+Od6bXrh?=
 =?us-ascii?Q?8xMgJWZpwAm9MzPzhrBdv0yzL2rxxDvAzCpHQxnug1QM13R1euA6iaHMPdV6?=
 =?us-ascii?Q?YOM+Hz7HR5XLJOtM28pRyVou8ovDm6L3snb46zT6+LojmqlI/cuYorpjF6Wf?=
 =?us-ascii?Q?n1OVd5AWbSIZShdJwu2xW5o2ThEExCHLxds3S2BD3XVZF+kYnyspgrOTgLp/?=
 =?us-ascii?Q?XHDg248JnpApTJC1eNr/ow2gPpoVfe3LH6/B6QKnsmunockjNm7gUPJ7tQOo?=
 =?us-ascii?Q?y47SAgVT0BghxI0S3+HhPhXWRLDFNqqde+YbbKerDjlUeX1ilrnKZbRX7LnP?=
 =?us-ascii?Q?7CvkgyMswQ6uQgDVRg3zlSY99qaZNQDqJuComg6g42p7ojnxdyGWFb0Wtn17?=
 =?us-ascii?Q?cOPpzu0ztilmhqRUiBAwzDh+4YryKpe2p/ZiRy9BvwQxaa64FeB1DgHFDofU?=
 =?us-ascii?Q?QtYCFj1NTw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080ffcb4-7399-4ea8-b539-08de653743b7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:56.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+E6x2Ffs5mnkdWKRaBQoyXZTvLpw+9tCbU6+nt6bZQdUBVdnKvrrNb/F5uF4tlsV16v5XbtMpnIAp27uGTfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Add the boot functions that construct FMC boot parameters and send the
Chain of Trust message to FSP. This completes the FSP communication
infrastructure needed to boot GSP firmware on Hopper/Blackwell GPUs.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   2 +-
 drivers/gpu/nova-core/fb/hal.rs       |   9 +-
 drivers/gpu/nova-core/firmware/fsp.rs |  19 +--
 drivers/gpu/nova-core/fsp.rs          | 166 ++++++++++++++++++++++++--
 drivers/gpu/nova-core/gpu.rs          |  12 ++
 5 files changed, 191 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 9b4407338724..3a2b79a5c107 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -30,7 +30,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index d795ef7ee65d..eaa545fe9b08 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -28,10 +28,17 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 80401b964488..edcc173c2fa6 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -3,6 +3,7 @@
 //! FSP is a hardware unit that runs FMC firmware.
 
 use kernel::{
+    alloc::KVec,
     device,
     prelude::*, //
 };
@@ -13,16 +14,16 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
-    /// FMC firmware image data (only the .image section)
-    fmc_image: DmaObject,
-    /// Full FMC ELF data (for signature extraction)
-    fmc_full: DmaObject,
+    /// FMC firmware image data (only the .image section) - submitted to hardware
+    pub(crate) fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction) - CPU-only access
+    pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
@@ -36,9 +37,13 @@ pub(crate) fn new(
             EINVAL
         })?;
 
+        // Copy the full ELF into a kernel vector for CPU-side signature extraction
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
         Ok(Self {
             fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
-            fmc_full: DmaObject::from_data(dev, fw.data())?,
+            fmc_full,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 616c6bc3a7b0..ecb1235910f3 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -13,6 +13,11 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{SZ_1M, SZ_2M},
     time::Delta,
     transmute::{
         AsBytes,
@@ -35,6 +40,16 @@ pub(crate) mod mctp {
     pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
     pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
 
+    // MCTP header bit positions
+    pub(super) const HEADER_SOM_SHIFT: u32 = 31;
+    pub(super) const HEADER_EOM_SHIFT: u32 = 30;
+    pub(super) const HEADER_SEQ_SHIFT: u32 = 28;
+    pub(super) const HEADER_SEID_SHIFT: u32 = 16;
+
+    // NVDM header bit positions
+    pub(super) const NVDM_VENDOR_ID_SHIFT: u32 = 8;
+    pub(super) const NVDM_TYPE_SHIFT: u32 = 24;
+
     pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
     pub(super) const VENDOR_ID_NV: u32 = 0x10de;
     pub(super) const NVDM_TYPE_COT: u32 = 0x14;
@@ -219,6 +234,19 @@ struct FspResponse {
 // SAFETY: FspResponse is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponse {}
 
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = mctp::NVDM_TYPE_COT;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -334,16 +362,138 @@ pub(crate) fn extract_fmc_signatures_static(
         Ok(signatures)
     }
 
-    /// Send message to FSP and wait for response.
-    fn send_sync_fsp(
+    /// Creates FMC boot parameters structure for FSP.
+    ///
+    /// This structure tells FSP how to boot GSP-RM with the correct memory layout.
+    pub(crate) fn create_fmc_boot_params(
+        dev: &device::Device<device::Bound>,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
+        use kernel::dma::CoherentAllocation;
+
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Configure ACR boot parameters (WPR metadata location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
+
+        // Configure RM parameters (libos location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
+
+        Ok(fmc_boot_params)
+    }
+
+    /// Boot GSP FMC with pre-extracted signatures.
+    ///
+    /// This version takes pre-extracted signatures and FMC image data.
+    /// Used when signatures are extracted separately from the full ELF file.
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn boot_gsp_fmc_with_signatures(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
+        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
+        total_reserved_size: u64,
+        resume: bool,
         fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
-        nvdm_type: u32,
-        packet: &[u8],
+        signatures: &FmcSignatures,
     ) -> Result<()> {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
+
+        // Build FSP Chain of Trust message
+        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !resume {
+            let mut frts_reserved_size =
+                if let Some(heap_size) = crate::fb::hal::fb_hal(chipset).non_wpr_heap_size() {
+                    u64::from(heap_size)
+                } else {
+                    total_reserved_size
+                };
+
+            // Add PMU reserved size
+            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .unwrap_or(frts_reserved_size)
+        } else {
+            0
+        };
+        let frts_size = if !resume { SZ_1M as u32 } else { 0 };
+
+        // Build the FSP message
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: (mctp::HEADER_SOM << mctp::HEADER_SOM_SHIFT)
+                    | (mctp::HEADER_EOM << mctp::HEADER_EOM_SHIFT)
+                    | (mctp::HEADER_SEID << mctp::HEADER_SEID_SHIFT)
+                    | (mctp::HEADER_SEQ << mctp::HEADER_SEQ_SHIFT),
+
+                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
+                    | (mctp::VENDOR_ID_NV << mctp::NVDM_VENDOR_ID_SHIFT)
+                    | (mctp::NVDM_TYPE_COT << mctp::NVDM_TYPE_SHIFT),
+
+                cot: NvdmPayloadCot {
+                    version: chipset.fsp_cot_version(),
+                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: signatures.hash384,
+                    public_key: signatures.public_key,
+                    signature: signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        // Send COT message to FSP and wait for response
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
+    /// Send message to FSP and wait for response.
+    fn send_sync_fsp<M>(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        msg: &M,
+    ) -> Result<()>
+    where
+        M: MessageToFsp,
+    {
         // Send message
-        fsp_falcon.send_msg(bar, packet)?;
+        fsp_falcon.send_msg(bar, msg.as_bytes())?;
 
         // Wait for response
         let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
@@ -408,11 +558,11 @@ fn send_sync_fsp(
         }
 
         // Check command type matches
-        if command_nvdm_type != nvdm_type {
+        if command_nvdm_type != M::NVDM_TYPE {
             dev_err!(
                 dev,
                 "Expected NVDM type {:#x} in reply, got {:#x}\n",
-                nvdm_type,
+                M::NVDM_TYPE,
                 command_nvdm_type
             );
             return Err(EIO);
@@ -423,7 +573,7 @@ fn send_sync_fsp(
             dev_err!(
                 dev,
                 "NVDM command {:#x} failed with error {:#x}\n",
-                nvdm_type,
+                M::NVDM_TYPE,
                 error_code
             );
             return Err(EIO);
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f04e2a795e90..88b1546e3cb4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -124,6 +124,18 @@ pub(crate) const fn arch(&self) -> Architecture {
             | Self::GB207 => Architecture::Blackwell,
         }
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    pub(crate) const fn fsp_cot_version(&self) -> u16 {
+        match self.arch() {
+            Architecture::Hopper => 1,
+            Architecture::Blackwell => 2,
+            // Other architectures don't use FSP COT
+            _ => 0,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0


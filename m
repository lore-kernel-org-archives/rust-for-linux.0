Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112932E745;
	Sat, 21 Feb 2026 02:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639876; cv=fail; b=ZGoygd59CCo5ZRmP4rtlk0zMBWKKUkMnfuJ+zMjKElcV3Z+sYFf/eP3z+9m6n330qEG8Ifqu0IWfP4o+Q4l5n1PUlJQtL8fnNGFCSAUT8HOHLOXP5+m6i0OOuNb7gwPXYLQ0Y6eQPvppIQ23UHxQF5/zZq085wi1xiQUbR/FftU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639876; c=relaxed/simple;
	bh=kEa3CP1hElzaRc0mqwSxT8dnuhv1f7AxevSR2hyTyPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tj5RTAH9nn51GuDcPXyLMVXqCan1FURhYSgxhSAWztYFB/3q+vqMTFoY2Jcyiy3FCc6oY+rHvkowDYRlHeo66CnwkX2Ma77hEB9Aw4MjCKZjU+SQbq++c/ngUW/9GOoHzTlYXScqtbwe2wRkYvGH/6/W2kstdupLWxmxCwTXVdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LNMZK1PA; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LNMZK1PA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vj+E2isuRK1XZgW9UERwcAZT6OD1cuhIl4KhI9NgpRxoF7UOcGHmv5q073pk1gsKxHBXeVS4QDf/IucCno97w5DhZiaydeLIJpt0YKuqpvcFGiEBF7+FGFQ3B78plQMYWDZMzTZPNDmE61tlpxH9QFoSSoRnX4+rkP+Yj9vNikl6AQrJpEcC4LaGfKssU9fOpB7mvQET2VSHjXHRy6r4IHf3E8gNKRH1Q55NYIbUNW+/+qz/xcSOM8cTQyROYBQTl+eDKAMwB/X2U2lzEtu9F+NltXF2ZgJzae1OYLP++jjxniZ09QF/TfMUoPCQjvtaLAoprH8hOTwTZbvpmo/cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88ZFIBMoN+f5Gb6jNtOLMQqr0gvfeuYQaPTlIijEyVI=;
 b=fw34e38nvR2af2tuKIIYLpRGXv2ci2oDMSuHERBUlcNXinAyIjGVZES7mDL7Fmz5O0zdwGDXm4nQ4E6PZX28OwrsOEz8RdWjFBQu8rmOqUbiGIUzgKnn2qr5Ghji3Hr/YEGXypyBxHOsVri2VpkuCrP7GhAfoUaYCMB/QYGbpnXxTm850gea2SIyvuLlvWqVkNocwwbSCfTcVf6YSaOSnvv9eTUmSvYC1uPYDSVCCta7zZcd3hU3WocXG58hoyEaWcT+oAPhpm0d7S3q+8fjKCvdMds/ppBd2M/I0CaHSL43F9/ZvrNeXOP0oUzSQlIv/Q9btQ8sdYOFym0oBoMtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88ZFIBMoN+f5Gb6jNtOLMQqr0gvfeuYQaPTlIijEyVI=;
 b=LNMZK1PAlyeR63UDJsBbVlFi54AYfFhFRhm18Yeu58+i7X630ZKsbd5riiuklgolb/aFIkLdJOhpHwoGgPI7EKzX1GDqaCs16i4Fh8WvKUONptYXG+63J+RkpZqZapu/cRqe/gEONs4t8yV9FP4qNP2mVRcBUaJffN2QkO0D6BRD2UaiSdRypTKR5Ez18IUcpEfkEtZ8s6SmOPF6S9uQUbwHijv1y1nKfu2bGYLdHfYZnXy0RHrH0OudBSrdYxY9G9x7OUz/nb13kGTevXv3rQwJc4EFKoVst+Njfd6wgWzHKTEW+Vv75u1T8/T4FbKudCXhmsdBI9kQoaGXVf96lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:11:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:01 +0000
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
Subject: [PATCH v5 30/38] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Fri, 20 Feb 2026 18:09:44 -0800
Message-ID: <20260221020952.412352-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ceb54b-fb90-44c9-9a65-08de70ee63c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OQXFyJCfbHFXPrRgQyZrC08AY+P8Yibgc4L7YrgzRyG4c3jKVjnrcYpASGm+?=
 =?us-ascii?Q?FQOUG81SM7A0EeQqrypH2Q6iA7LKfLmcHguww5YZ4UWPSLMBJrL+zNFyWJbU?=
 =?us-ascii?Q?MZ+3BP/iKFhJwi+D6mq7Zep2whXvtGUn/u2E+i6/MMYVPHn4idc7/4ZZsV7D?=
 =?us-ascii?Q?SzbhreusXDrMJ5yezZY8APmBqcItAgtu2q/KRd4eCODkT1+xFWmPUPvPW/UX?=
 =?us-ascii?Q?UBhdETYJSspw1Zv4t9bexL2iYVByn8XAWEWTTo+7EHmYHdKEnhA5bMAuCz3B?=
 =?us-ascii?Q?XP/GLsnHFqkAW0FkuAKnDkgF77m4Bi55Z3HYctrxxL6U65KEnhkhh3WvdFrJ?=
 =?us-ascii?Q?lEn0g9LzPaQf+hxDkbbhN/YKF5rmTqqAKF1KY8OpsWzdMutcmeGWzbCEA2rG?=
 =?us-ascii?Q?50VrchMH3beoBsFGDurlW+0AIoTt48F5hmySO8ZRdTGF+5S4sSVWV6dKU1kQ?=
 =?us-ascii?Q?5DaDQgAOqHn1xFbv4gBk+2wz7gluYGS44A1JSfr+nw4cSHXdQYbR7yRHYLZ0?=
 =?us-ascii?Q?ouFfdZumzFD8IIyBBAAmK7NAhs5rPtM62Sn6ZlYuozXsCjMPOnF5JOFJhQEH?=
 =?us-ascii?Q?muJqPypfNwRothuY+GdhaaGeJ3etUYsXAY5AxzmEN/8dICl9hJphu9YvtCrm?=
 =?us-ascii?Q?yEf8qEZlVoWyaq2vBrtbHsCdAmpnzpVLvLhScaOzHLF6NDyokfMlzDEktzbY?=
 =?us-ascii?Q?NptXT+gYSCdy4YIzMOygo4CdiKfw5Qe17VOQDlE1uh112wGXlmyyHvXDJk3Q?=
 =?us-ascii?Q?zfZg1ks8zIDVekGDwSkEvCVaQba/xSYv+h/6OxxeJTrXNZ5jO6Y1YzTdj5JJ?=
 =?us-ascii?Q?H7fGxjtEvsSxJnzlurU9MFAtWsVIIAJtE4cMmm/k7gyX7CXnmE9AwGdsneSp?=
 =?us-ascii?Q?W2BIuxzQntpJXXx4LnUP/C6E2p8B1r2xdJ9BpYrj5up0IT5RRqlOKa4cNRXl?=
 =?us-ascii?Q?ECPWYNabW+i6rFJQX87B6Nyn4C6cUqaPRslnwllPtxySgokfcaX1wpNKPi/J?=
 =?us-ascii?Q?jjMds9Ci7OePd/8pUo+Ot7R18tfUsGZ/du0yh9+dfwhtpIq5IprimCt6mnDi?=
 =?us-ascii?Q?9UBMlIq6mn3LLZ37szIxXw6GPb3EX0nNq5TSuswcvbx7HMzi19RhoePXZYVl?=
 =?us-ascii?Q?iHrEh76GskH6s8jaxj439qsDonms7y2rT9ijW0ac6kTFX3fZF5TNLU+2jUJB?=
 =?us-ascii?Q?MsXlNDi23ZdpQsZbNE2vSl6x2aSWuvx5Oqa43OrHMkx11hSWVOXZLda52naQ?=
 =?us-ascii?Q?kuhSWPzVt6Gw732yJMW+khl2bA+NT75olAaHUQD7/8qYCLSDxduRXuxoK0RY?=
 =?us-ascii?Q?+10GPn8hlnvHz4U0ESJKgN9Xs3PzrRWLFlcviU/OoC7/tyGbLLm7/qt1zWyj?=
 =?us-ascii?Q?bqQYFvINOZYVq0/8++5Xu+ePmPY247BjEVvQCZ1P9DdncxHaHb6XyvCXgqK2?=
 =?us-ascii?Q?kTARIqFiWcF95ncDB4VAwThH5pN1TXDXFdhlIG+X0E6Q0v7KjJYkX1sA+CT5?=
 =?us-ascii?Q?L7llqXGW2/Z1laiaaUzE4o/pEkfis7/p85WFivK7kXYezB5kVT3NZg6E+i85?=
 =?us-ascii?Q?pefC4muVY8jqUuzhwBI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E4zdJmG8yVO7NIf4SNLIke8+7Cecu7kPv7Vp0uYAVWmzmgNEQ29I+2AWKAhq?=
 =?us-ascii?Q?buQ7zQx6Tf6NNUBWSnNCqY09yTGkxbxL6XjqJ3PoFM+GQWphMtuzzXojlght?=
 =?us-ascii?Q?nZZJKgSjXLsudOD6jM7UBlI9y/7H3eJAN616ZPRhQZx6xkeXnU7F6019UreB?=
 =?us-ascii?Q?o1ypUKo285F9qes1a8m8mJ+tUePIeIUWyVMsQEmFaLSmwqmv34aGgAD1+y64?=
 =?us-ascii?Q?QBBds2MAe0yqT2b4ukcdsL1D9KIgPPbYOrOxhJqtxV0RZbH5w/8yCefzZep6?=
 =?us-ascii?Q?/iQervbY6REjxPfIyWTOtepxqy+vc7HwZ0rGMMhLNOSiFBA921iHH55nAI8/?=
 =?us-ascii?Q?yEj6nx+R2+uHkzKnV1hTtmvm7L9XMgyGqF6B6knh6/GoytMTUj2SC+spvqRo?=
 =?us-ascii?Q?NQDKUEA0sLgLWKi0RXKMYGlpP042rJ5nNNtwAZYieeQ4Hrawye7V+93BqZTV?=
 =?us-ascii?Q?EPePTWZH3tuxGG3XJ9QzkbsWP2gQoanOi6PT1NLNXoyQyi+WpWwD2I4W6IY1?=
 =?us-ascii?Q?V3vE25z1K9VfYHw0d6BGsIdchVX9YQvO3eGmuNCpT76cIMxCen14DGudPopU?=
 =?us-ascii?Q?pevvjaaY5bJ4B7tlJYqlzbdgBvPHqRrKEEKfgEg9uDRk6vtB9o5/38XgSOCa?=
 =?us-ascii?Q?8U0Yx2C7QFZPgsLHYN0BDAljWUSZZJgMvJ9oTNZxkKArYhRNJvW+6DetOeHt?=
 =?us-ascii?Q?ts6n1wom5n9V0Pr14SCD5Yii7xdrEYhEFUSeDbcnCsWcecC9DNu6R66Tjv4Z?=
 =?us-ascii?Q?Nok9DzX8GoEfbk2heYU4K0VtHBnp/tTdFDy0jBufMTbNK5UYCTZCdZ1M28ml?=
 =?us-ascii?Q?7JUD45WGn/MNMkBosLrWQWQBF68GVvSDgTDwL6WOLZ7TQoOUwAb/Fs8bez9I?=
 =?us-ascii?Q?qcTL0uDkP+GsVmg4FryjWux47ZGPmcsrnsBgluOZbslhm/6HAInNqPe2lKPk?=
 =?us-ascii?Q?JpEuQTQ5T8dYVRKQ+fZYDni+YCdlmMhBRAOvPolpxW7p4MeFwDZN/ZTwA1gY?=
 =?us-ascii?Q?4pWCvVKfIhAreQfr8d1UNEsrd2IN1RSEYFf+a7ClVjHNqhowXqSTW0hU1veO?=
 =?us-ascii?Q?QY47ZiMgfvf+9BmKh536VhqXlzrLTn5328W6ySBLT4J4Cr4GOwdmHbtJAkuw?=
 =?us-ascii?Q?jjaxYsV5EwpuLBJLEx4Vy3w2ZaanzR8daQUJOXjxYQDqeq26h9WIKibeG0yG?=
 =?us-ascii?Q?nnybmfZ+qDNVQ5gthFAgCAxu5RPxJ1L+EVsfCU2U70LQDylDBUOFhvsMxAwr?=
 =?us-ascii?Q?nYAMOm0cr0aOJEMNRManXGWcafJCt2BL+aKeSfyPXSicKQVnbCffq712pm57?=
 =?us-ascii?Q?vYu0TSXzFyJpqpl7UD4SELFbGp+FcvnJkbAwT2vq9DUvliG1R9wM+7R6ELQh?=
 =?us-ascii?Q?MoXwthPvuCYUiCjLeyjFwRDBnAim4s0iVc4hH/fIEo863bc4mVbrYSG63jnr?=
 =?us-ascii?Q?2QUaTeYGDbdfm7GwoQppUrfUEo1ukJJ2Hn/0FTuNNHVz3bRb9UmbuM0SdeH3?=
 =?us-ascii?Q?s1KxhlXVTExEac1r4G7l1yyv8Yl8av8XfaWFAxHK+ke8ub8ydugh2W83oFw8?=
 =?us-ascii?Q?K8YT26LllLS/YjUzDBPTyLBsg/6UF4xeTXIyVJvp622+34/unvrDUI3r2pZJ?=
 =?us-ascii?Q?01PA2TAqdmcdSvpo6YiKdyFDeLiGDYyO3fePfYkssvqrTK33yNvltya/FK41?=
 =?us-ascii?Q?LsuvM6yqyCc3wm1pseSXKqgu7+ImhDnyomHp95BRV+/TUNA05atfhaq9+9Ws?=
 =?us-ascii?Q?bgnS5YaaKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ceb54b-fb90-44c9-9a65-08de70ee63c2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:31.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MCmbu6t31QkGCbpddoRux57oiMMDV5pPHGpPhpax8noTpm94krMg1euHLJnnT//XXbKIVmR5UWdG4EM0dos1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
reads at boot time. The FspFirmware struct fields become pub(crate) and
fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
extraction.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |  14 ++-
 drivers/gpu/nova-core/fsp.rs          | 134 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs          |   1 -
 drivers/gpu/nova-core/mctp.rs         |   2 -
 4 files changed, 141 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index cea9532ba5ff..bb35f363b998 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -13,16 +13,16 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    fmc_image: DmaObject,
+    pub(crate) fmc_image: DmaObject,
     /// Full FMC ELF data (for signature extraction).
-    fmc_full: DmaObject,
+    pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
@@ -36,9 +36,13 @@ pub(crate) fn new(
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
index 8926dd814a83..c66ad0a102a6 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,8 +8,14 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
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
@@ -38,7 +44,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Return the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -221,6 +226,73 @@ impl MessageToFsp for FspMessage {
     const NVDM_TYPE: u32 = NvdmType::Cot as u32;
 }
 
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs<'a> {
+    chipset: crate::gpu::Chipset,
+    fmc_image_fw: &'a crate::dma::DmaObject,
+    fmc_boot_params: kernel::dma::CoherentAllocation<GspFmcBootParams>,
+    resume: bool,
+    signatures: &'a FmcSignatures,
+}
+
+impl<'a> FmcBootArgs<'a> {
+    /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    #[expect(dead_code)]
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &'a crate::dma::DmaObject,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+        resume: bool,
+        signatures: &'a FmcSignatures,
+    ) -> Result<Self> {
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
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
+        kernel::dma_write!(
+            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
+
+        Ok(Self {
+            chipset,
+            fmc_image_fw,
+            fmc_boot_params,
+            resume,
+            signatures,
+        })
+    }
+
+    /// DMA address of the FMC boot parameters, needed after boot for lockdown
+    /// release polling.
+    #[expect(dead_code)]
+    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
+        self.fmc_boot_params.dma_handle()
+    }
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -315,8 +387,66 @@ pub(crate) fn extract_fmc_signatures(
         Ok(signatures)
     }
 
-    /// Send message to FSP and wait for response.
+    /// Boot GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
     #[expect(dead_code)]
+    pub(crate) fn boot_fmc(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        args: &FmcBootArgs<'_>,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let fmc_addr = args.fmc_image_fw.dma_handle();
+        let fmc_boot_params_addr = args.fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let mut frts_reserved_size = crate::fb::calc_non_wpr_heap_size(args.chipset);
+
+            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+        let frts_size: u32 = if !args.resume { SZ_1M as u32 } else { 0 };
+
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: MctpHeader::single_packet().raw(),
+                nvdm_header: NvdmHeader::new(NvdmType::Cot).raw(),
+
+                cot: NvdmPayloadCot {
+                    version: args.chipset.fsp_cot_version().ok_or(ENOTSUPP)?.raw(),
+                    size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
+                        .map_err(|_| EINVAL)?,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: args.signatures.hash384,
+                    public_key: args.signatures.public_key,
+                    signature: args.signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
+    /// Send message to FSP and wait for response.
     fn send_sync_fsp<M>(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fc34c97a61fc..51a91dc98415 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -133,7 +133,6 @@ pub(crate) const fn arch(&self) -> Architecture {
     ///
     /// Hopper (GH100) uses version 1, Blackwell uses version 2.
     /// Returns `None` for architectures that do not use FSP.
-    #[expect(dead_code)]
     pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
         match self.arch() {
             Architecture::Hopper => Some(FspCotVersion::new(1)),
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 0dafc31b230c..c4e36a46fd69 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -6,8 +6,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 /// NVDM message type identifiers carried over MCTP.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 #[repr(u32)]
-- 
2.53.0


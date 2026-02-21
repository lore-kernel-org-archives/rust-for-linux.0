Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05C32573F;
	Sat, 21 Feb 2026 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639870; cv=fail; b=lkQZJ2fw7VGAR25q5AjUHIsoq6pjOLm73eurqOTBzp1/KDzqfuUsO/HRXnE0NCx7sEYgRMNHSb/DsejpC3wMY713UdWMgBls3qeYxWhEsEYa9pFNBIh/L2ao5mKpjzhsZneYXw/TnSm2tGbuzAXYxlSZuOFRUtEgxsO9GBkA49M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639870; c=relaxed/simple;
	bh=V4koz3Lywn4qsW0iZ6K5P3lZWxeWOajWjQp9Uuszw4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dT+eq0U0PLW29rqT3WQI34CFpvjlwIndz+ejMDee7S9YxB8QUW+7ImID9IXD49VJN8bDLSh7jHhf3x9yZ+Fdw1RX7rBV9gKNvbkJ+dQhyx3qkpVdo9ZGMICvRrZnZgrtWDY/uBbETXYgPusRW9O0sG7A6kkwZF5txdA9FHKrRx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SW0/ywI1; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SW0/ywI1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyVI4OACqyaY+0EFQXUpWnd9bMGNwxmQfja4Zfz6/f6FLNii2a3LH3jh9nm1HWg4If/8+LXc6yA7cVsWQnLa697O4VO2NQjCj8Q2ESCT//Mq1Na7gmtDS09pjjQrlwsiIjvCmBSlS9scCL9ddlGBA/SqH5Q1PYj9R7d1Pz2L8R/9dxacQeHGZYj1KKUjqK0ynMSjXqW69vphVP964C/jRxF147GSaGCyuGwCQwYgoLWwtt5pQQgxppmmkzXPeNDvDX3Te++S589EKXcIGr5vyMqRAk7uKNMtxDi7SMjCRAbaMuRw2kXjvZx1EFXsMUy0cK6jS2lHeIXSxY/wcjWuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Stlew29ruY0iMYXkA9A7sq0TjjeB6Uuy5BuHxoniCkA=;
 b=cvme0amz1xoFk/t7vVsloluBVa7ju/ky5v5d48LFcQtLvOQlewXAq3OlxHBp58ycz7F1/4UceV3Olz+cUJjmU5NJCDYMCk6TTxmU49p9he9wl1xXx+D0+ujgU23foOehF1bPWxzHzHWNkRNMJBofUbaS1tyIT/U1YijgK954CI4J8T8e+hkOd5X8bcnXM3yYFrXAH29ZtoArp2KUkz2lSvpQfLbxxRHVg6lP6VOnTRtpPXKTQVmNX/DFAp9SDPHop/Drvzvjxgcn29TQE/XT87GBRZD622M6ysg4+wjP1qc9KvwZyae8XEx0xJZtsJ/egZaVnSAjhMVTNLLl1f5+dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Stlew29ruY0iMYXkA9A7sq0TjjeB6Uuy5BuHxoniCkA=;
 b=SW0/ywI1j34HVtB8zaTufl73E9m8CWas6sv5Em/EDaw6iDosPrsCl4ZBjhQIunxPXCRqGzFvjLhSG0KGT6YwHPXEJrqIdClDeg19tsEeWSf3k7uzp155LaV47kyOi45/L9ylkE6oqQ7WL6V/kHaVMjugH8XQbffQB6N0SbpKFIsopqziP6MSjyOwO1svbmNtKG1DBKi+Z2SICp/8ujxGcI8UCnpfrWwz99H1WZ7AyWKzkGEbXP33SbNqVMTZ3VC8h+xIoZzYec1jQYzYB09d3KadHzWnWMb+dMFuKeQKTnoqHFU/yYbTvcDZCkYxEnFlHEN+p4ytBLhG23X6dOrsuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:26 +0000
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
Subject: [PATCH v5 26/38] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Fri, 20 Feb 2026 18:09:40 -0800
Message-ID: <20260221020952.412352-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d1683d-b98b-4a45-5eec-08de70ee60e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YgtLb2+yxJUoa9hfXcFAv9bL7fDuFA1Wd32ZwD6k9KDMxknU1U5KDEar0I9g?=
 =?us-ascii?Q?h84nyzWfSPOvcyWow9pYV/Jvse/TzFlBmgJ9If3QDqJnlE/qGt3juELNTrco?=
 =?us-ascii?Q?SsoN3DscD+7CUMysefGVCoFuFofPWzXz/3l8k1AU5ptF+MMXuYrXEVlILZHK?=
 =?us-ascii?Q?kfa3/tpssnhUMvrMHvP7BAAAZXvv0UTGUtfLxWjNDn1Whga3rSF7AobvoHQw?=
 =?us-ascii?Q?jrt6geczWpdvKqM+c26o1EOpYrrslVRehi679OHl/uED/dbDr5nbK6Weh9jR?=
 =?us-ascii?Q?dJ/RyeQWJpF0buw7P14r81lKaYGsE3+QsFueMFrnNSyt4hA2oW7M5dqjHjAO?=
 =?us-ascii?Q?sX4dUV37Xp4WgOZAzjFweEPoewAUw51IBkw3RkbPUEE/rEiN/7jsT39mOYVz?=
 =?us-ascii?Q?vjM+rMwSJbdBnXYnqWw3Pockle1tBxFO1tApYhUsl+503bzKRyvqNcG4iXRA?=
 =?us-ascii?Q?oUkuF6Y4mzTeIGXD8Sv4OfQrARhIsHdc3+btL/XEm3AyyCa4VTavkJJinrn9?=
 =?us-ascii?Q?me40FQigFoJUqh2qsoUyjiLEO7SMWxHP/8us6EZewOurR1edbTUx5Zmn7XA5?=
 =?us-ascii?Q?T0ZNtbmZOZ4TCPRm7EyHaoToVIlKojzkvsPTN/ipFVrdFVLZIBH9hR7xKexb?=
 =?us-ascii?Q?hG5zA3amnK/an66g5yK0r0iWTHCOY6TcJ6OQYZFc2H+gOHCIrj9o5LRYp4Ie?=
 =?us-ascii?Q?V5UopPSUKwdgqNg/T/2+posYbWZ3aQLjxBbzrOj329m8HEOc1p9p3oMbypib?=
 =?us-ascii?Q?3PdHoFdqi/dh3srkQpnX2RxMTI5lLmGJQgQ+8ZVGrD3nMnG++H4buCr9gT46?=
 =?us-ascii?Q?0xvsHc7w/YBziklveAEnrObSl+Q2K5MfLTEBroRLsycy+v3zIw42UGfWREvG?=
 =?us-ascii?Q?AZVs2YX8WKdTsBKHAxru2bQSF9VKFK2dVQaSc3ptDJ69aCZvRH1Jn22R2AI6?=
 =?us-ascii?Q?ua1OHzrVMhbSpSy3chUdBAmgMqeXmlfEmi5IVssC7d0hj4gb+T04JGnpoEA4?=
 =?us-ascii?Q?Dzbu34m5Oque0L0bGtdpxbnJGOn+wH1GIp4wyN9B+w01CK3pgiESeZpg3a7l?=
 =?us-ascii?Q?miKNBzpsCAH8O4eWZTBMK5CPUL4dMuv/Wr6KtBBct3uP2+UV+x+o6QGCWtGn?=
 =?us-ascii?Q?bW9qCMANhkt2911k2ugZXqHoPk6y4USJuwmgo5WRLk4p31my+G4gMP00qkCv?=
 =?us-ascii?Q?Akl8T+T+O6/Wnsp6iNxlmON2OZIZ57iE4qti4KWmKHYewnRUxTF8DUpTsyAO?=
 =?us-ascii?Q?NAQzNMoeWAmhQCs8CImPSuri1doKBRAJkb0BPCXklZyrD0v+jUa920I7pF8K?=
 =?us-ascii?Q?Ha0ZzN1ynL3eDC1xjgPprr/NM0013ky0TpTArHmtRohJOp2zRV5bInkFMlul?=
 =?us-ascii?Q?cZ34TBbztdO4QscO2jAAts3zYWb1R0IRNYuQ9jYM7c4d0U3/F3/NFYIxf7Sq?=
 =?us-ascii?Q?uL5r94Pee2VSFLCJjE4uqlDPajw6i56xToLjZq4izekDX70j+JE/5S9BDm77?=
 =?us-ascii?Q?LOHZIO0af62BIHO1OXLKEPsPl8PGhl6UdoWA9Htrt089/Kqm1OxOSSCSNCjG?=
 =?us-ascii?Q?KuRq1EAiupaNkXMZ/vA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?og6uIYHGdjLa8tXQa+VqQ/QTcPFbJjp2AhxWz/6o7xqcxgZPUL7+TfiI7om9?=
 =?us-ascii?Q?1sDfqviiBnsQZs3WU8/4yt8HD/0cWuPz4O/i3lbOLit+CkszuJh9cvxtmZNM?=
 =?us-ascii?Q?cn5OLlh1K4wIbb6WdzGzJiAEtGFzPoiEBRJ+BoZeYDiW7o5R+QJTvGpZDQIg?=
 =?us-ascii?Q?Ji+e4l47U6IkaJd+SbEUNN5hbftQ9sVIVTspQ31HPiapjubx/t4f6xYfvQYa?=
 =?us-ascii?Q?lgIGjGdncsxLwFwHhu+6BbjztEqsrOIN/VjyeyvD1vMuarzJl8NCs2+XvizZ?=
 =?us-ascii?Q?7tOEhNz7DgkluKSbezU0KUK5HFVyQEoAZeT8DNLARKi+S9fZ6m35RoEIbdmu?=
 =?us-ascii?Q?R2jPswYuPWTiBHV1XTAC5ZpsMR1NejPvZBVvLkeRMDAm1nb5jMENvlX4l8kD?=
 =?us-ascii?Q?6NTQwezbdQRbKcDvw7v1U5EX/DCdhE5RcWyzWwZxfFflpGuw3TBPvu+A4WyY?=
 =?us-ascii?Q?yNai9Sza9+3NiK0gWg71XEUaan+znTyeAtMdG3iDjcAdbFB5FvxlEYjoKmlJ?=
 =?us-ascii?Q?e/inOdijb6NH1YU6d4AoJZ5I60xQMOYZEPt2lKw38kr9laIqkNtO2svJiJSy?=
 =?us-ascii?Q?K6bTkeZMVd/vBl4KKF4LicXJZzL9odxSXs9xHBEq1/Vgm2EDXooQJa8gLlzO?=
 =?us-ascii?Q?sOZNVbo78Pxfi5yxC7dgR7pZe3qFm7B5sjcP1xZoPjCqh+uI9/Cd6r+VFCXu?=
 =?us-ascii?Q?e1TDYlZSJFz99lH64O7WpnzSirvtdX3j7TAVJiMx3fog6atcraUqDO+iK4pH?=
 =?us-ascii?Q?9A2TjwZ1lHnRyxePBziQiOuzZeKF8IHhYbCtfRniyXvRgSiMyPgjApxGI4Bw?=
 =?us-ascii?Q?8hyEq0WRTQ6xqAc8qduwggug9xMH6Ex+59nU2nqgmU98ek08hCkS0K+QhGEK?=
 =?us-ascii?Q?9aqAs3aVJtbnFkwrgQDB9PiwRwr0ALCjvZVRFYB3h69FKxYVczNu9m0/XebY?=
 =?us-ascii?Q?pv1l5Crz4mMuFt5AEKhHJEy7RpJ+DdwHmMD+M/PnQyT7+hjjvKzoUDALwasL?=
 =?us-ascii?Q?niKbg7xsM9/m10+BL0Mjl4uIFrHeQFbJ3q4aoQ96PzI47gaxWwK39sw9hVir?=
 =?us-ascii?Q?1VgZ/j9MsyDPfZp8xnnawrfBG6fUOeCOSUyT7sSCYcWPVFjXZrpAOkCLizBC?=
 =?us-ascii?Q?GOeUwyTqgX4X3g2lmar5Fv9cxj0Pd6j9IABxUmiSIkUVAt9ZqL+eco3m/PJG?=
 =?us-ascii?Q?2btKv5lGQP25wEOLxvRkmoHwEo6ky6Fo3C32WqBO/DBEKDuoBB7m5hcO6PAo?=
 =?us-ascii?Q?2FQwRpr9BPx7tpIEnlxS6c7pczn0KboTNWuBgfo23p4g45Z+DQ9mVZPDNsmA?=
 =?us-ascii?Q?zQy6uSwygPaXhPUxFEhPS9aD9XFYvZOg94z9xPihqSElhzZrIihu9l1tcyqT?=
 =?us-ascii?Q?4WHazhrkNBMi3xzR32gjBntAkxmW5B/SBwDJQ5l0uozBdYieNok2n8Tr2qjt?=
 =?us-ascii?Q?TaNIjgcWNJIm4qdO2zFVIaeHHyAUfy4vAATsjApunxIAeT1Wq0XZ9V6ewheB?=
 =?us-ascii?Q?QZac34bwS52DLHp+0faPjqq94w8XrFUGKLpvpItTaqOwvR+IHsKKjBOOnhq1?=
 =?us-ascii?Q?EYmFY7NDmixip1HsSbL99Xjp4p+VE2xzRhy2AchOzoXXhtUwCOXpMopCW5tL?=
 =?us-ascii?Q?9xYNt6ODuhIdEvOA2AP57lNdzS6vmSUty10r34VLhd8XE33F4JnXXb4H5FZf?=
 =?us-ascii?Q?8qc636UfoR7ygLQYrmF08Bl3RzQMuIMC34aFyA77JsPw2iGNfhW9ORo1DCPq?=
 =?us-ascii?Q?eIEFBww8Aw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d1683d-b98b-4a45-5eec-08de70ee60e4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:26.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DMx7pvPHZp5VpU4SYew9ISa3RcMbR+zXzoaFOkMmTljlx8geG8EclJKqlU3Y9OomQ/Q8bG9ud5/6D3yUx6uyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add extract_fmc_signatures() which extracts SHA-384 hash, RSA public
key, and RSA signature from FMC ELF32 firmware sections. These are
needed for FSP Chain of Trust verification.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  1 -
 drivers/gpu/nova-core/fsp.rs      | 61 ++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 823d2232081e..eaced3d42728 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,7 +27,6 @@
     },
 };
 
-#[expect(unused)]
 pub(crate) use elf::elf_section;
 
 pub(crate) mod booter;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 15731d24d0c5..29707578d4d4 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -112,7 +112,6 @@ unsafe impl FromBytes for GspFmcBootParams {}
 
 /// Structure to hold FMC signatures.
 #[derive(Debug, Clone, Copy)]
-#[expect(dead_code)]
 pub(crate) struct FmcSignatures {
     hash384: [u8; FSP_HASH_SIZE],
     public_key: [u8; FSP_PKEY_SIZE],
@@ -216,4 +215,64 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    #[expect(dead_code)]
+    pub(crate) fn extract_fmc_signatures(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
+
+        signatures.hash384.copy_from_slice(hash_section);
+        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+        signatures.signature[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.53.0


Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1632ABFF;
	Sat, 21 Feb 2026 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639822; cv=fail; b=SK8S2yVgOD2wzKg9j0V9DtDhDlJuqmF+/Bue3p7jFE7yVyIx8WTLE6VstTSGdosnyMos3AK1y/6niBl9xTSj6kAkhIuipoPjOaPsGTfJNtJ9Oz39b5i8NkFyWP12rqxKKnnEK+Gn7veUKf8beKgmuLp6emqkU8l8golirbboI3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639822; c=relaxed/simple;
	bh=I2HeAyt2lstAURSFoRO4NwWrxmPg4mamAcaUj6J4EE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ioR11V5WtzR2BBFBHijtcp+36HrHYpAicgzC8/0wyhXXeFMOiXsesPXacdDCgGjAoP5eKV2gxklK2zBCPApFs8w+q+vFGxdcZ3VAYTVgdieIEZ9pc6+3zn++5sWVnpHn9ioMNHPKfoqwfJHItXc1sD5O1pvNxq3wjTs4OQ+ayyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SkW7mVVI; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SkW7mVVI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCygdLLYf2t6KojSAUWdPgeOD9DE3xZT8clck/pl8oVCRnaTnMmhpEMBt+Xltw4BD2da7vWMGkN3NSYXwHVL+Fz0jPgcDLXPmmfJL6XzchX2sfC5DCFxMqOxPOx0YfCSVLpTJ5yqHwoYb9jTLcuLhxir0RtVsLmQxFs+wgRYM/+iByi5uQpWu8wPjz+0ADESbM3vSsF6jg4x+gqSOdCt3ISndEQgw99Kt/Qe+BawA74cHJuj1qS/6fmRoz7ZZiFTtdFaptVWO9fZA9DxAUq70XzwLuzm6iuqalVfKlvWOMnmkzwFXOAUqzyUtrkwNJTodHcijvSDyCvHJbIYd/GJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3naXq4lF3LhrMQkv6RGurDDwBhUFkOxhIl6ifxgU/8=;
 b=bzpSw3cJGXLlGcDu5ibzQXgBdfJRlUi6N7FMHvaXAML+/b6ICirG6EjP/6/AOI64Xv2syzHAUqod6S9g0oXyVmEu0vSWGoSng5hrtGkFpz8ttKGtKtMVLu/pOZwDvVV8QYJgwV6730lOU3Pnc+MINBLuKXZweX12AJ8lF5CwOIU6C4V5CurT9zJy69OEfy9EFE3GxdAf+s2HoExCJ1M+3YRtFvY9kEQmd8+Q1GJq+fV4xD406iLdc5qXrnTO7I5uLlNhiuzQu+CBxU2qA5iJAKrqrgbWCILw5WgUdpVqKKY7qaYO+15spSDEhjU0lGdqnX254xdXfPBPcF2DKhozKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3naXq4lF3LhrMQkv6RGurDDwBhUFkOxhIl6ifxgU/8=;
 b=SkW7mVVIvOqrh+9vaCsDxdHWOAgzff82nWMV+PlPyJM3o7lT6vvnbdVLDymvu6bGj1A9pPzGmMXhEFOC08dMhFK/2PU0OcGE/BQ96DnqVY1JSHlIvwX8zx/vSnFkOhuooV3PRH235H+hVhWEczIYF3Za92emV1KkoPSK25ObezyL8Wz9igYeRl7xkAh4ovpRxl0TAvDXsUXMpFEK/f1VhN0cPOVKCz/CwOpUO9LW5tPcTUpfeSFbK6mNXz4xMyz/b1O2YnmtKJnmI6EASP0qjAfZlbQanmGBVtL6g34YOJRv8j2l1G9sHYoBD6hEUHSzC6FXGb+jh0Izd9CH3rpLcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:09 +0000
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
Subject: [PATCH v5 12/38] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Fri, 20 Feb 2026 18:09:26 -0800
Message-ID: <20260221020952.412352-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 590f7ef7-1b6d-48fe-dc8a-08de70ee56c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ZUW3cTzUVnU6Wkbh5LPGLZ9RKYC6cPZQe/5QGlzUfB+u/dSlvLBvv+QpUP+?=
 =?us-ascii?Q?3ksOU7pucZ0hq72HA6QCTzsR8jSyfrGz71KVqCzA1Z7yVwsibeEUeYJl+XiM?=
 =?us-ascii?Q?dLh6OscuEUSJRsSeYDpQZGYon/KV54ikIfzNVdjfNRmDwwtT3rgFL8HPnnUB?=
 =?us-ascii?Q?WCUvwBot9GsHncgvgg9ZsNpfJfQ84lLhwQhpzdKVU5u6zBBX7g/uoUIorNeh?=
 =?us-ascii?Q?9mracadGSKwRJ5jHxLNWLfRraPzfivvgbX9rTskIu+7yRQfQ62zABkkBO1V7?=
 =?us-ascii?Q?DbYsQp/hbvuuZ1SBaiHcUpdVIM58EDKfKJoIfRdQ0sA9J1MGeJy8f4lJrmWC?=
 =?us-ascii?Q?4Z/OJ0ggjTDumkr/cDFEFIaFCebS2XiZQHdHNNZ+bl08sNC513ZIopmqAWvI?=
 =?us-ascii?Q?Wz2oozOzTClJcI0Q+N62YTJfB5GK5FfDxrKgLlV5t61reBTftDULFC81BHGa?=
 =?us-ascii?Q?sbdbJmDjIOaDbOLZ5YHqnVT9P0up5YvQgaz7KwAuaksLUV7LE6JQySDfDbCp?=
 =?us-ascii?Q?kuYe5aYwuw/TWNoGzPGkIDN/jaRckEsXGsPiEizDuHuxn7pIrq76UHXMdEFD?=
 =?us-ascii?Q?W0c/aux0U3twexZ9Gprlt/fJaEkZd3PRpEMfyBr6CpkLwMdYBd8IbxQ/UgZb?=
 =?us-ascii?Q?4uMyzWmOjSXdxdLZkZX8TBkFlLcHqD84AZrcBIJe5VTxWNV2Is0KsbUZG53H?=
 =?us-ascii?Q?BggQ8dGjTSEtyXa4/geNGsBIjIf+AWFQ7/HuE9rQdfS1cyur936B6caWvNCw?=
 =?us-ascii?Q?gLFqcMQVypMyGSDzBNEcTLT9Mrm5fBVfNFhFSvHJ8GJrylZiI/d8N7ymNSJp?=
 =?us-ascii?Q?D/cTLP72W0snG8ziX5ngOnSz1+Cjw/nSRan+rpm9Mz8kQ/pHdj4QHAbv3lp9?=
 =?us-ascii?Q?pmNUpBhvhGUzOdG5Uo1XqdHpTzSMEEylvxATQrXQoUSyaz5Jh6plRKw7XgMY?=
 =?us-ascii?Q?npSqKXMQyqn7VHkAxyOPRTzaN36FiHTI+UmWSUCqpGFOFbVLZ6F86G+Opz1/?=
 =?us-ascii?Q?XNFhrHlk+uJixCkXKNIa4iqHnOmrLTg3wDOHcUAGHGWZQVs2GBOyAlWEaKv0?=
 =?us-ascii?Q?+aXwLKQTJknVxjiXlTx+N6ba930FLc8DTf8Ui9Y8k7GAyxPyKahRTtflz3+8?=
 =?us-ascii?Q?In/Q8JoBniHXhZWtp67ZMItWKp3P4dhKNA153GIaqumme11a2qLYXwPhAsLN?=
 =?us-ascii?Q?CPWsgcoYpDjJJPa8CveR0Auhmlppr1B7t4B+dvq/W8A+kVJwvGtIDXmlM9ON?=
 =?us-ascii?Q?yDqFuXLner3BQpNIvEcov3DdI3ffwNSJvk7FHycScJ3pzmNEStuOCWBf3fWB?=
 =?us-ascii?Q?1WQgxX1EodtD2KwORMgVlQ27Fev1zkua7XdiQgxwkRth0mRTGg2tRLQYlSvy?=
 =?us-ascii?Q?Q9xWSQznrOILCtRRpJWlzn41ysVpzfSyTjbLpzSaEiUQc8BTNmgTF2RR8XLG?=
 =?us-ascii?Q?bjZMPe8Y1ii23Ldo4e9zEpVGi1NsW20kTzHIvfE5dMzSojt/ttZ0Wdl65DLp?=
 =?us-ascii?Q?0wnchXk7dq7Tn075q26w3k3UMgWTtkcC9Rs5h6hmc8W/ZAddZkmFUrr5fSI4?=
 =?us-ascii?Q?fCom/lu77kqKHuW5uJo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3sdn7LIbfk0o40nivtktKqe+gHbklVzlx6NqHQoYjERVK1kNTQADuGVfHcF+?=
 =?us-ascii?Q?Tdw5akC9893OwRDn8PYCApPhJqb3aRICM4luX6wdQOemkFa6+rt2D5fqweJm?=
 =?us-ascii?Q?JT02BddwwVv19iJ6VFAgPq9moLXvZ4P88Eo2kFFhDTYomTldlmm4VUV5WSo1?=
 =?us-ascii?Q?8YBiTmR21EP0frYtweUqGaQPDBJf3LSOcvSQMK/LycrwRQvCOFtLDFZXvxGO?=
 =?us-ascii?Q?y+P5513QssZC75/3eT9cFg6IutF/X6t9M7WrkLk3wSrfIU82/ckfxYC+3F4T?=
 =?us-ascii?Q?0rPU1/IVKekMq8tIqOP7StBHTHnbAyKWMyXxG4RSG7fSZ0pBrkjuJQrgOF1f?=
 =?us-ascii?Q?nZ697466vKmWJXX66vT7LnHxNvX/we4632g05cMP2eNAOKt1KQkaNZrHRmlW?=
 =?us-ascii?Q?Zm97gPHRTOBeNV4cFZagKuLlFgWKYCHa+Wxz+bhTeGlNkIeb99mn8a1kRL/z?=
 =?us-ascii?Q?RaWCsJWm3RPFjcrFapKXUtPl5ITQYEn8MsdpfAivE74UzHDI9jKqUFDYcxMR?=
 =?us-ascii?Q?ee6ys+FCh/hyPWx9yGbuPvEqJrhF5nzGZpjmBtd30c88xD+mBIoeU0bYrITe?=
 =?us-ascii?Q?azmdFvoCIqVz2ZDM2+QwfTW+wbKCe4xpTNqqc4GUNTEtqwFvZeJo6fIKiraq?=
 =?us-ascii?Q?H0VDCXM8fUtqSOsuJ+4HU6fQnXHIMcWmRzUCvFSaicFbzlPjWuSaHhiElX6W?=
 =?us-ascii?Q?WawzUMoT+lgFy+vPps+U6NRMZCLn5aXn0yVjy0r7stRY6e0BYohOKPOPhEZo?=
 =?us-ascii?Q?A11YQl5DOXhBAaNBlz7doM1d6NaF9Y/1RJmFsftuEvavKpF/Is6dsprhMdq6?=
 =?us-ascii?Q?F6GN4ewac3sWBwfCrlkVVPruPiPy9h76nopYkj1sbD9S3ZXu95X/+ZHIRi7w?=
 =?us-ascii?Q?Uhy8Ljs118mTBVajfoMb/nB8kfdCXtInm6TSwKJ2o/rprE5ZdRfz58i6KQpW?=
 =?us-ascii?Q?TVYZW9wASAJWBWRgmQI1ZNrOGJOYC/5DWjxG4Fa9BgP6dHKByOCFZ4FMKXet?=
 =?us-ascii?Q?4spCZwaK1Tw3fQTqRqLfAnmNqXWP6TFo5bdMZNE02sGM1xi9KIH0SF+Ub/tL?=
 =?us-ascii?Q?r9nPbjM36l6WG1N1kFPD71XtSH0XJZ5uwGyI0nr6c96wOrm9Yy7zFeYdjzXw?=
 =?us-ascii?Q?NYDuJ0uiGpyo3djTZ4V0g7hGsbcFQ7ZBCi1yKrxAIP7U4SoQ5SedVEtMShSG?=
 =?us-ascii?Q?y8C6ogwSUH1WmioVK8HByXmSBDHdQiKxOxqMvxbx5SqPMTGjWmnS65pYJia8?=
 =?us-ascii?Q?/MQRAV7lVbxxNPs2i6hJpWaI111D3vdtAyFs1SXcoVBIQRyD9dMUXnaMJNGR?=
 =?us-ascii?Q?6Qum0s2RAhDhYG/tEOds867C1FjXr2VC7Id98sCU0Dqogf3xi8of3NgXLfps?=
 =?us-ascii?Q?mAvwgvWv7zT8QSiCbvqtn83U1OjfFRToN4rCP4UpjZ363aAVMCZgRvt57oYQ?=
 =?us-ascii?Q?Q9h3hAEiAxJexS+Rc0zH3ml8MGcoylcVgDDKS8XdKQHuKiUS9pC9lD0uLEwt?=
 =?us-ascii?Q?ONDKzfjJyHF1Wt8hIJyBZS36JfeJ5wWYUEVfB3DCv5N4bJzEWYMNQROBB8Wq?=
 =?us-ascii?Q?Cfr+mwRcNiYL/dJCSUqbNSf9Vyb7rXAc4unH4dzKV2YgetB0tBL2DseW1c80?=
 =?us-ascii?Q?/FCBV5pY5gKa81pABFqRfX5ywydWcJpERN0ywAnzVmBhyzQTtfQsB+N/oz8X?=
 =?us-ascii?Q?fqR4cf/bAy8WrRK2UzGyEvm6mpwsUmBGOnHKBnREjra4VxIJa9K5WjVyLflQ?=
 =?us-ascii?Q?mGEe0ZnshQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590f7ef7-1b6d-48fe-dc8a-08de70ee56c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:09.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nknRT5s2hYbGnFFZvviQfS92ncMh3CwCntsCMF9pQF7H423PApy0Z6DksDTsnFtRGAZo+ixd79/IlUl6lSlLJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
 2 files changed, 94 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..a0201ac8ccb4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -437,3 +437,91 @@ pub(crate) const fn create(
         this.0
     }
 }
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use core::mem::size_of;
+
+    use kernel::{
+        bindings,
+        str::CStr,
+        transmute::FromBytes, //
+    };
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 468f4b43574a..f247deb06633 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::mem::size_of_val;
+
 use kernel::{
     device,
     dma::{
@@ -16,7 +18,10 @@
 
 use crate::{
     dma::DmaObject,
-    firmware::riscv::RiscvFirmware,
+    firmware::{
+        elf,
+        riscv::RiscvFirmware, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -25,92 +30,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use kernel::{
-        bindings,
-        prelude::*,
-        transmute::FromBytes, //
-    };
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
-
-        // Get the strings table.
-        let strhdr = shdr
-            .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
-                .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
-            elf.get(start..end)
-        })
-    }
-}
-
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
 /// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-- 
2.53.0


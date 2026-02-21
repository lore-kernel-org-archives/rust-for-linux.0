Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4329336EFF;
	Sat, 21 Feb 2026 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639878; cv=fail; b=ZWIQGpx5ghQYS18VOTWssfB9RToAARrdbMn0KzkuyJqJ7zjPjP8D04fx3VUMtX/X+D9L4B7GxmSTjILOHn2Z5uCagQorJ4BeAUi/4Q5vom3emzDvre5KsdETZaGsq9mhYGiM0WZ62j3LEKwSjdZy3MABR9NKvwZ7OFoskDIh5pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639878; c=relaxed/simple;
	bh=gwmPNOyixa9r/wG5ZZ4WO2GReTD+JcsXLeqCuK7YBH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJaVOnQg41ax//R3bNgrEkyyZRVYnP9DjZYj093dKD7NGB9WTpqVnDMMTvlinIijckdhle87bY58Ixgco9qqIpCDyBgDXxuhQIdNFSJ9CkP3FwxZjvfSnt0jrBIKbEKwWvjcQXlmK/JxGrBgO5j2nHYbRdE1oYpmb6nkQE3dFiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QmqiOtoa; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QmqiOtoa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy2XsIr+jnMoa36NpzZutg5UPmizkKg8Jx3w+PGqjyZfAvkMv887zCrVm2FP21c95fyPQjvww3SFtI0TEtP1Mq49J15NKprGCAmtryKKsYQVVuJ1tUTr1egzejnVkvrrrNuVIlzvNIKKg8uBys1MTmF61FrmU0/hZMfpIJci8CRp5Pt/HcGYk1RswEOUzeP6jlse8hx4idGEPMm6FZ/IpIIQOZaoEcghekW6zqqh5TURWUeWfgIpQTtH0U15scwmvxmCRQU3Cwr3fVbNn8h3WAftd/AWeaR25fTvveNwZBMM1yahO35HoT7z4r8eAIowdXYSgjpwALqx7QDDed/7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AunlqujvY84Q6eymalF/skwHqryE4JKqsB3XzcOfNxE=;
 b=tyVrik53WRYBxCr2XPYzOOyfu2cp/+BQEDf53+THLOIciwKu3ArFAu6A4ZooD8OgWOZTzH0cXga6j2eatvRfcvwsO0sqi9dssTnU5wU+YaDq1+0yaEMgeMob+GJVS2ZIgH0GkGQ2xhSMHcMgE5rTz1hqkyCYQOXSdi32LSnFWHQjoQhA39iUqe0jildij4t9agNRWrOdAjFMLBIHLDEJioNX6QYsPcRB2hI2iccYtqDaHvT+jgvAzrVghNwSacD42f//FyUMvpkfYbVvTaV4A+3+39CAJzgp6TxrWcl6WnrKI2gP/2hDdT+mXZ0pzMBCFPdNl695AbfLidhW8Ze7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AunlqujvY84Q6eymalF/skwHqryE4JKqsB3XzcOfNxE=;
 b=QmqiOtoaiIt9guQ13HKcHvFde78T3SMp2Jyehtwftk5soe70K5DTU2doiexFkxljbiLMxFN57r7oXQwzy++1HJK/+IERzAdfhUMo4MGs72iZ1IlAawysE6KY/6GmZRPFCE7Y/nHKicbb98Fxp45T70+rKwK7dFz4JxEJuLock5jxC7luTEiXe9FhzNmTdn2BWVmqN9H7I0CPPX7slLdFRGDtMc08MnCzymK6Nl3qFr4nGx0uhw84SrnuoSU6Dty/dWtH/Lpu/6+NtPddabG0t0IoM6sd/DWkLWHIlWQnXVN2NrB63fal9zu6o7NAJxbYnqeYtYwJqgpiZ3n/ka0J4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:11:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:02 +0000
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
Subject: [PATCH v5 32/38] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Fri, 20 Feb 2026 18:09:46 -0800
Message-ID: <20260221020952.412352-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c90d65-4081-4073-a0c9-08de70ee652a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7gH1et/dWmFUOg761Qkc3L60kzS48f9MOGs/aNroEE2oDvTEpwdhUfoCqejz?=
 =?us-ascii?Q?U4ajC1uwqkxV73w5zHLhobMRbzXUWouyrfKpEqCrRnjVMO+yfTIuA46EQuPs?=
 =?us-ascii?Q?aE5r3O4bfZREy9ZyFlybU3QV4pX4JO9FbP0yzsXN2jF+XwmCWL/kihw7b71X?=
 =?us-ascii?Q?i8BKk4sJagGxis1VYngmXiqBSzZ2vNyPOde4bPa3pAxEkfPPjc0S0YUegw7N?=
 =?us-ascii?Q?Y9pmNw3xSSp1CCroj+zeHq5FP4jlqGalzzlqfH0GrLHBV+aGRQ/lmLkaZdz6?=
 =?us-ascii?Q?0pdxaeTDCrhy55jHIHRM/1NZcy+v8In2UioWtmMgq2CveI2cLZ7dI2IxIVdr?=
 =?us-ascii?Q?tQ3L4Mr0nGpSB5a9iK0Jx6VihXci9Th4iHHbr3+BMfwEfx8iOelLBe+Zuqaq?=
 =?us-ascii?Q?48z1W4/6KiYunJjVCni/vNkZLxG9mc6u1gJbsNZXthOrB7drRxCuDo3n2JIF?=
 =?us-ascii?Q?mofboMGvJ9v3UfgHmCnHHDqEfh2K6wb8OVSjZV2vmxloJPDUyLuQpR+Nwhaw?=
 =?us-ascii?Q?tfu8ap2xHFOknIGU9Se8PBx085ZsQCKTOcfTB/L4Ym9nmsiYKT1Yt3xbeELS?=
 =?us-ascii?Q?2DxRLs+x4MR/UMboEG7GoGx0MAIHqxhYmbtQm0fawcfSkeOeuwEB5Dymaq16?=
 =?us-ascii?Q?9pruSIDEtlqUvr6/6ctH5tsvpGIpYtaS/YqUsfc1+MhHdeJajfnCMXDulnts?=
 =?us-ascii?Q?Up1IuzUJgA8iv4V9ccnnJuM/2+hF+uJ3mKPsQCqMbwmwXfWYcI3PqA8wBLXb?=
 =?us-ascii?Q?sj9r92T8bHu21T5qE00Nj1wXsN/XJ+9ATAHxKSJ1QKWTncslmN2XDNux6uWn?=
 =?us-ascii?Q?skRC/J7WY4ek0mJZh4ksbIvR6A6F6wBmSoA64qJjkZKTuJUPqATjuMfPXbMR?=
 =?us-ascii?Q?MyCGgc/Rq2wxVrqQKHWJnEG535ZOa2/eyPXXR38EVKEQu3AoapPyTBxdp8pd?=
 =?us-ascii?Q?uZqwQs5xON+QioTYX0k1UcjYoLE4Ba8NHqvnuS59wXJer2FE5nFnv0/4K9zg?=
 =?us-ascii?Q?P+vj96DxUIa6pmRM/+32c8WLq2F+snjbucIhhOdr6ObWGwRKKg73gSo/xTvE?=
 =?us-ascii?Q?ruOR5iVbjJApGkB64DLThJCOJJvFJBm+9CElayZ5Mzdi12oysXtWZG3ewsKs?=
 =?us-ascii?Q?l+o1/T0apGdQv2dU/9yRHFg1M/kWH+by92OeckmD1RuCcaJP2nBpRiW6Vkq6?=
 =?us-ascii?Q?5XDmIBdYNNsMS56llE+Lnzm42t8Mg8h07P9PTVxIi3fOs6stdv8KBLiXrVWG?=
 =?us-ascii?Q?Xa8PH325vXhSTCuYpvRH0EuvPlwLLHV02Jb8BgkYKPiTa7naYatNQsljnLmM?=
 =?us-ascii?Q?qwZCHKhP+O3zjiqlBXJS7FO501NjqR4IEMXnTSHU2S6elkjNnAO0ADELqDca?=
 =?us-ascii?Q?JvLG9KjDYwrnueuKL/B6kfnx+xSayS3TRH6RH4m4Ft0UfjFf8XsTLiGwFdMj?=
 =?us-ascii?Q?8LCKyNNFj6EOgfIwR01EHi/7b4ITTyBkRg1wIeAiD4bU8mL8B4eTo1frdfqs?=
 =?us-ascii?Q?otAW8BrjqKveXkI3IUFgPPxJeIlcRpUH7+51Ao7ByXb8fWWAtcAj88FOt82M?=
 =?us-ascii?Q?GATY8IXuibxKauu+inw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TWUGINhtkfB63qoXB6MZhu0l0hRuLY/HOkYPOFbWYXN4kh3yJoqdTNMOFuPq?=
 =?us-ascii?Q?5dcDA28gI4EXCkaLHUYARv2CG4Ra4IB0AxtbrvURIxwGoe++RddyKEiCS688?=
 =?us-ascii?Q?xrEBVNUMdEmQFMAspwCt4ODuMGTY+V0pJf2JpoPpge2WHKPLFUcnYmrBN/b9?=
 =?us-ascii?Q?GgRZjYQNYFX7Dp/6KyQPYbtylVggyb3VwkBEFgFerxjIUnPHxq8e9xeiSoaK?=
 =?us-ascii?Q?TuHfmELkxm6ww1eOJEjy7E6UVVMxmJ9IW3ZIN3aYW8COr55N8aneoUzwTLaG?=
 =?us-ascii?Q?YrBCvKKegAVJ6/+b0qjPbX0fXwK5X0JSLb6njRYjK97ZJ+EPuecZZ4XhyffF?=
 =?us-ascii?Q?dICfe6NjZjHUTl8Qi0+Z/ekica27p9Mk05GTSuKVvyemytxAPb93ju4eFTvC?=
 =?us-ascii?Q?ResLY+9gghu9mZsafxCtvEvboyxXykAyt20pqmSGEW+YSuf+FhFKOYr41bEb?=
 =?us-ascii?Q?W8LGVnkhRRs4oQDlFTWzWsXXAQhmmnYfHLuoR9F4NBP4pE1u2ti25sncu8WL?=
 =?us-ascii?Q?Saeh4+DKrL6NDxBX5mjhxZ9IWORQRzZLfZbEAbX+4quDLTz6vj6RnXV++REd?=
 =?us-ascii?Q?RSHiaX1mYfVtSkjtgAYSlBLxeNvEta7aXyDc9aE9jXFkQUTw6GD7ENf7e+Q0?=
 =?us-ascii?Q?3sBqvFOTNKN85E7xr3zayBoytdvbNULCmjY9l5RUu9szrgIxP0xD4+ZuMQ3p?=
 =?us-ascii?Q?b356+dsGh0T0pc8EwFyE/xtJLQyf5dZQefLMisRT3GMIHtDEoeJXn3bva7NU?=
 =?us-ascii?Q?5V2T5u9B+IcUZW7IpFNLVf9fMmU0bob+ZwNutz+LAD3RsmeyEz9Fyq2mk7vu?=
 =?us-ascii?Q?RHOOpRqF15RFS4h3pW6bx5CKWEnc4xZePWk481W61oa2XycMASduM5S5aTlx?=
 =?us-ascii?Q?uCeU59mojagII8EQurv+0tcHr0AqInLh2TtPSrhlqRWsSfIkDmAotpJpE4A9?=
 =?us-ascii?Q?+Y5mJD8F/qUM47QgC6F4LJTblJmIqtdiH02xViBPmcOibqAcc89XEbXZgAGq?=
 =?us-ascii?Q?aBhbABqDEb9YVSQjsOAHSMlKJ20d1/u5IGPEWdjh7r6j+f3xdJwo4dsizpGH?=
 =?us-ascii?Q?SZ2rPgdrjHy4aPtFPBq+lEXatvr+cIYKyS3syokMUhzmWvcA3szwtLxgqPuO?=
 =?us-ascii?Q?+VQfMohKNvasX50gDvZXEdZfytuK1DXOJe/NUdH1YPangy+4hU+JWuRuhmF5?=
 =?us-ascii?Q?p3RTFfCbDfWEY4XcXs92vtBQ0iYBEbap0df8nMaJAbO5656cL7XmZ3pECaS1?=
 =?us-ascii?Q?1mHOwcx6w+YLMJXoe8w9NbuqooAtJFZnxuts/EZZwFyCTKG9ctZ6Syk2B26b?=
 =?us-ascii?Q?SIWyvZcLm6M9mqWViEZJ5N2UQ5+V4pFZWlBM7p+AJ+HCQ/ewQLbWqCnFdt4I?=
 =?us-ascii?Q?jdgVRRRymIfyeSIhRURvngfNvZtRRgiEyDrQtrRwmiPf2cM0xIjZAeGnNw0w?=
 =?us-ascii?Q?M16zxGELtzYvhWa1DQfZ5S/jBJ1xpu73Ugqb7vQnmGvjA2SSApmr++K++dbA?=
 =?us-ascii?Q?jjucjmeizLE8/j4jYLvftnpX/pNSrvuzmulL20PoLjxWGpsDIZTsl5gI4G5z?=
 =?us-ascii?Q?YcGyA2O5eCqQ+sLtRNOBHnDTDUYn05PbSQMkkU2m/ybR2HyK5Q8xdhyzY74w?=
 =?us-ascii?Q?3tCBoEOGPir0DhZzF4PnGsSFTR4wmZ+vq4qs+EorWXxkU5CDD4yfMJT4pSkO?=
 =?us-ascii?Q?oBJqXqDxLTAjip/55a9xKjCqnDmoFXfaDmc0kkr/hui0pU/CwR99lOlvGN4E?=
 =?us-ascii?Q?doz5ruJ/YQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c90d65-4081-4073-a0c9-08de70ee652a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:33.6559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUnNiFYffpHeWRh8XJY5gZEWucfkn7R3I+NCXpttJnHPFVpDeGTSCmk4at2xSgImtT8NFKT/MxfM6u+oENMq8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs | 74 ++++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 8b3ba9c9f464..08e6dd815352 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -247,7 +247,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
             let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
             FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 086153edfa86..7fa9d3b1a592 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -49,32 +49,52 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+// See Open RM: kgspCalculateGspFwHeapSize and related functions.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * num::usize_as_u64(SZ_1M);
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * num::usize_as_u64(SZ_1M);
+// Hopper/Blackwell+ minimum heap size: 170MB (88 + 12 + 70).
+// See Open RM: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB for the base 88MB,
+// plus Hopper+ additions in kgspCalculateGspFwHeapSize_GH100.
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER: u64 = 170;
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        use crate::gpu::Architecture;
+        match chipset.arch() {
+            Architecture::Hopper | Architecture::Blackwell => {
+                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> Result<u64> {
+        use crate::gpu::Architecture;
+        let size = match chipset.arch() {
+            Architecture::Hopper | Architecture::Blackwell => {
+                GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE),
+        };
+        size.align_up(GSP_HEAP_ALIGNMENT).ok_or(EINVAL)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
-    fn management_overhead(fb_size: u64) -> u64 {
+    fn management_overhead(fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
             .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+            .ok_or(EINVAL)
     }
 }
 
@@ -106,29 +126,43 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_HOPPER: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
-        if chipset < Chipset::GA102 {
-            &Self::LIBOS2
-        } else {
-            &Self::LIBOS3
+        use crate::gpu::Architecture;
+        match chipset.arch() {
+            Architecture::Turing => &Self::LIBOS2,
+            Architecture::Ampere if chipset == Chipset::GA100 => &Self::LIBOS2,
+            Architecture::Ampere | Architecture::Ada => &Self::LIBOS3,
+            Architecture::Hopper | Architecture::Blackwell => &Self::LIBOS_HOPPER,
         }
     }
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes) for `chipset`.
-    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
         // The WPR heap will contain the following:
         // LIBOS carveout,
-        self.carveout_size
+        Ok(self
+            .carveout_size
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset)?)
             // Overhead for memory management.
-            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
             // Clamp to the supported heap sizes.
-            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1))
     }
 }
 
-- 
2.53.0


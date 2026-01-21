Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62073C1FCA
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039620; cv=fail; b=cFRW0wfZcTPOVpCSZD1XsMYU0Ni9OfaJqs8qnT+mTKNwYdIR7dtcjnhE2fFzwz6g4euyPg2gv+2ZxdNwqEeQPchleRJ9Nt9Edshisq6P2sxiEuFmO84yHttOtqys7mi/J62Qr/SMZuHaAGdbGtD+hcpoOZbhW2d6YStduq3Jlfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039620; c=relaxed/simple;
	bh=xT5HkIqdo8Ftv+aa1ajbrTxELVTWl/aZO9iKqA5gdVw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CMaoJWepMMBie1mUb6zthxetyHbbAU+CJYf3nRNyRalJnEta9CQeum6aQXvSmD1yqtwAXBCPV3aYdT/O/6OLW82RMInk8cJB+eKfyanyyLrAxR0NlEM1XDl+4P7GaG0cgb6qd/Yzyc159yEs8lZJr3odR9/0k3dnJhX1pmvz944=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X0Thnyp/; arc=fail smtp.client-ip=52.101.85.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X0Thnyp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGJ9K74/+vW+we5hlyz0ocKlLC8vxfcNTtOcrs5vAm2wEI4OTYEOVySBXmeTbUwRh5N21i+NfDKjCldOmPtimU6TVlPeyqq/OD032oNiliP04wlxtv4Je2SeV+A0VN8ZIjMyR9Q+JW9sH26AiEYvsXjDmnOA8aA16sTXtItRLwCIAROKiKFG5u+0DMdfTLeua+QvnqC9Ox3vAljr8auZTxigulbQM9/+rtIM/ff046P+CtTyl7G8N43byC9asfUWyGHu8Dzn7T8VroCPsdKN4A9Rq5EDi++sVGhfHk6qBFMDbxHiSjxfiUS80WF/XhwFnlYNqDJYcwS2lyiGqbfChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk+F4mewxi+UnJkbUp31gN4XdZofgPXmtsIUT55XQqU=;
 b=YnC5u8qdrK95uXohVlV76Pc8u2ZB8QATlJ3j4H+GbIMtdwdFY9hcMqU3WpqjrMutF4L6DekgjCQ0VhlPXH1+T3K9zO2z9hrdpn1aOdS/l9LZKnor2TGbN6ujGSuOzQXskHNeJZNZhGRVy3Zo7uA4LXsIDt2wP+hsDBMIizs9EB8yg/OCG39Qj5cuOd8CRtSYUbq0esBvWjxC1SfOzcBQUm2wUk4i7B4R3CoXFRnWIs8DJM/GOyHL1Z0oZCP6tfiMqrwtRl/hyyi+gQuYUup5CQO4LRqLWY89+LwemmzsruNv3muVBFBtPa+jsoLxDPMHb4KnGf3ieCbOvaNQgPipyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk+F4mewxi+UnJkbUp31gN4XdZofgPXmtsIUT55XQqU=;
 b=X0Thnyp/3omJjCJPEyx6V9z9ZkGTHNtZJBNlDmRHXvI43GOW92C5ze05fMeZVQtFtR9Y/cgZmYonQNDmHKEBpibnHQr2lt5wz10GzlQTqGX31qkaFevj5KOpFk10HtT1xOn6tfnaw5PoR9AQX2slO1Jne6OC4NnYWszWv5Lr+bmj5aErDhT24fO2hDm6xVE0yFNH0YRFOiBKpdZc+JkUx1eV9e+Zs0+zH/0zLvs892MVUWko3xDUcuBx0YwIP7LbE1bjEQeCH6lHq1xKNiQWd1NKFmpKyWI3IEMK4WyvPfA0zxwyWmF/K0h/sSGfji9N2G5xR3ex/E/xr83aocmuIg==
Received: from SJ2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:a03:505::11)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 23:53:28 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::e4) by SJ2PR07CA0001.outlook.office365.com
 (2603:10b6:a03:505::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:11 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 00/12] gpu: nova-core: add Turing support
Date: Wed, 21 Jan 2026 17:52:50 -0600
Message-ID: <20260121235302.1962185-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e5e91d-20c8-4611-d5a6-08de59484613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j8yCDqY4nLHQC0pC5fomT4brnHuYJsrp2zYDfze0mkbXyxPiiEe5qfSO0l9I?=
 =?us-ascii?Q?SoZ84yt/+g6WaD/Ip5M/nFRgDtA5HImmj+Nwa3H6IMhPDEcN5AxUfnb6ZKMA?=
 =?us-ascii?Q?xybAvHwtIILiXzEiJGdFuYYCRnOKtTrSsqJ+5VBUyAWNfIOJJ69Fr4/8emBp?=
 =?us-ascii?Q?d92ttM/6kB7uHBpgIr6xzmCLoQdE1vA+5JW+4FdFm2P2O8n2oG2H1OoCCV15?=
 =?us-ascii?Q?9WuDumMyaccuHLM8dIHd1/wKnnoc0j0a4yTiA2ywLHurXjJy2rR4jKmrgpy3?=
 =?us-ascii?Q?BrguB9mYiQRCvo8vhwSXPT9euoqMK7D19U29ZnfzzbM3KCziQVocaQaAB/oI?=
 =?us-ascii?Q?zoBR4fiIkTouqzcXVvzY6ij1I2ohRBkaOEYzXbW/nFcfZjGxWb8/RuOfbJle?=
 =?us-ascii?Q?Sc3/JLrb7ZDvAJMA+YsG5/dsEmI4iwhHKUBS/fx3PdwtzCQ5bx41SXiVL/7i?=
 =?us-ascii?Q?GL7ZMpkjpKikRnowD62mz7c5QW+8SzsJf7vpTUMl+ELxebcqUgNQqjz+kiSY?=
 =?us-ascii?Q?+YazdfgtMSI6GlS7hIzWK9I0BypAplmF91Ix49ZageRiJZHbsep8kD8KvJQh?=
 =?us-ascii?Q?e2uBolsgOg/8cPnEVler0Maq8Ug/fgmPi4ipyicSq6W0XItUjnKxSJS5NYdl?=
 =?us-ascii?Q?fKh6Lvo8zDgkM6ki6aJYLX7bISqwAnNKYhPjhDvDGPGXLJOCZ8Ao9ohOO1ez?=
 =?us-ascii?Q?G7mijfKpE+dzAs23eavgDov/cevLqgbGXxadF1VlwT7jiPSG2nZ4IBtnNxi+?=
 =?us-ascii?Q?JcYZDwAL/8FpYLY+MacQ9oZo3oWLwIDxyPT5y8vGLmKadUR/U5s5cIHWrBq0?=
 =?us-ascii?Q?lgYlWuIQR0GOUElwAAqAXQtPBwZ5pZY23+e7xYH89Z5Ic9BnmZWI5sSfT3Se?=
 =?us-ascii?Q?w/ALUekb2YaxeEfz2YGqrhLUMn26uiPRWnsWoAFqy1B1oR+5aB5LGRYDCIFs?=
 =?us-ascii?Q?+nVLKPcK0+dHXav4qoCYNTxCqXA+m+1N4kD2LbM5XsqKJdObpltqXz6OuHMj?=
 =?us-ascii?Q?hiEJoNeMHDDwSb3dTZZmtGvcdwuMrNlr2XmjP02UM/6gyl+KvZReELuFHlvl?=
 =?us-ascii?Q?RkcOiz/N5Urt3i1sOwJ0RN0UZK1T8P9UqkW6DqWytRPaFZL7XycPUL1h61KL?=
 =?us-ascii?Q?pgKsIxJI5behbpXaNJpCx+NfNDPGSMvxbhF1y8LLLxANpE3lT9WS+x8g4ZJP?=
 =?us-ascii?Q?OpdfIIQuPWwYxbwTZIhSZqYTx1Bq4J3cUSt5F0fUYL30HAVIHC3Qj++V5dd2?=
 =?us-ascii?Q?RzwgmJYejhubxerKJC7nT/AXkxa7FQERjvDSkkw7/cVxpRX4wzF2Xwsde8FE?=
 =?us-ascii?Q?AYi6GT7kS3L76RKcQsg+z8ZRQhjjrMC9A8fVtL4BT0q+GdQ6iAZzPw6c9dff?=
 =?us-ascii?Q?G6W7XoaUlkpb3adtwKhlT2WNx2MsjR9kz2qenuTdqUbjSovzW59S9S+xbU0a?=
 =?us-ascii?Q?VqsvK0xpZjX/fTZ4R9BslGduPngtUYOq9DuCeGMemnWakHXej3PKxDBrxIwc?=
 =?us-ascii?Q?TRr81q3UX4+HQH6/CCrNbT4mmWb49FxfuwrNr0TP54SgY+iPbVorxrO4iuDu?=
 =?us-ascii?Q?r4diUyk6cXkn3NmytzlY00AGffdKR8EScnOocovQBBZvhO2b9Q6GuJ6fh1+7?=
 =?us-ascii?Q?zcQWSaYvFqY16Ok86dMstZaT/L53TGLCOOOyceQDttmSSek60cFnBeaDnDwt?=
 =?us-ascii?Q?KhacLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:28.0010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e5e91d-20c8-4611-d5a6-08de59484613
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495

Note: This patchset requires "[PATCH v3 2/7] rust: io: always inline
functions using build_assert with arguments" in order to compile
with CLIPPY.

Note 2: This patch set does not include the upcoming refactor for
handling the Generic Bootloader.

This patch set adds basic support for pre-booting GSP-RM
on Turing.

There is also partial support for GA100, but it's currently not
fully implemented.  GA100 is considered experimental in Nouveau,
and so it hasn't been tested with NovaCore either.

The latest linux-firmware.git is required because it contains the
Generic Bootloader image that has not yet been propogated to
distros.

Summary of changes:

1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
is used.
2. Because of non-secure IMEM, Turing booter firmware images need some of
the headers parsed differently for stuff like the load target address.
3. Add support the tu10x firmware signature section in the ELF image.
4. Add several new registers used only on Turing.
5. Some functions that were considered generic Falcon operations are
actually different on Turing vs GA102+, so they are moved to the HAL.
6. The FRTS FWSEC firmware in VBIOS uses a different version of the
descriptor header.
7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
aligned to 4KB.  So pad the struct to make it 4K.
8. Turing Falcons do not support DMA, so PIO is used to copy images
into IMEM/DMEM.
9. Load the Generic Bootloader from disk and use it to boot FWSEC on
Turing and GA100.

Changes from v6:
1. Miscellaneous refactoring to FalconUCodeDescV2 code, based on review
   feedback, to make the code more consistent.
2. Added NV_PFALCON_FALCON_ENGINE::reset_engine()
3. Removed `port` parameter from pio_wr_bytes and just hard-coded it to 0.
4. Removed supports_dma patch
5. Renamed pr_wr_bytes to pr_wr_slice
6. Simplified NV_PFALCON_FALCON_DMEMD loop
7. Misc minor code improvements based on review feedback.

Alexandre Courbot (1):
  gpu: nova-core: align LibosMemoryRegionInitArgument size to page size

Timur Tabi (11):
  gpu: nova-core: rename Imem to ImemSecure
  gpu: nova-core: add ImemNonSecure section infrastructure
  gpu: nova-core: support header parsing on Turing/GA100
  gpu: nova-core: add support for Turing/GA100 fwsignature
  gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
  gpu: nova-core: move some functions into the HAL
  gpu: nova-core: Add basic Turing HAL
  gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
  gpu: nova-core: add Falcon HAL method load_method()
  gpu: nova-core: add FalconUCodeDescV2 support
  gpu: nova-core: add PIO support for loading firmware images

 drivers/gpu/nova-core/falcon.rs           |  252 ++++-
 drivers/gpu/nova-core/falcon/hal.rs       |   26 +
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   39 +
 drivers/gpu/nova-core/falcon/hal/tu102.rs |   77 ++
 drivers/gpu/nova-core/firmware.rs         |  203 +++-
 drivers/gpu/nova-core/firmware/booter.rs  |   43 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   |  178 +++-
 drivers/gpu/nova-core/firmware/gsp.rs     |    6 +-
 drivers/gpu/nova-core/gsp.rs              |    8 +-
 drivers/gpu/nova-core/gsp/boot.rs         |    6 +-
 drivers/gpu/nova-core/gsp/fw.rs           |   14 +-
 drivers/gpu/nova-core/regs.rs             |   72 +-
 drivers/gpu/nova-core/vbios.rs            |   64 +-
 drivers/gpu/nova-core/vbios.rs.orig       | 1105 +++++++++++++++++++++
 14 files changed, 1964 insertions(+), 129 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/vbios.rs.orig


base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
-- 
2.52.0


Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE403ED12B;
	Tue, 10 Mar 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130630; cv=fail; b=P3R1pigD+xxVj+3weP80rZW9JOYnqVuThu26rq2GYigH8N1q4GKOQOrGim7kcegW7iGukbIvxlmKdD5JhDhsnKQXrnLdAG7QriFAN2fBFjNUIZ10iWrNyhxGMsL4YRjze2W/Ea02sHD/CcGGtikaSkygRbCtqX2Vy6qsAeH2oZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130630; c=relaxed/simple;
	bh=VSn4VCijgxUm7dTtG1oek+XXoy+o55OWcMpT3QPyOkU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QSNyiy1LfVuQrsMVCHOAkyXoQUfLDUBjtkbFUe1IZ6CuF19A4OX/roYS2O2D6Nw9ADpOvlfE65qKFDwvNvews7XmC3nWFzPVCFZzusANCuSY4r6CxhPz0EctK/bu3yQjEQTZNQp+vdXYY1NLV/8XAmmmbq8TopjSL/MUlcH6u78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TWvSi8/5; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TWvSi8/5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXBSL8qNDVN0+vGKHiPPwbmEcxfGvzLo8xRO9mzjhAQoLx/yHVKiU6cX7/wrRNml6utCPHHRiII2L0DTDqXN/eKviwnVy4YgxfuuOJLgCBZY1XK0Z3pOLQcdrruF+QbLuFN01XkB5U19e6do4RJRpoxggWsOKF8XvUy6W5SDh64fgqunf0q8mIpnIyH9IJmIvrBgllRdsZFyfPnTy5dA4nEolfO4RymZJQ56LnbaiZ9X2gBHOXmHsF7Z+xY9DQjPZ/xKNhoPyMQcsqyiTIfyUzQNYNCeOWF17CtDuh8flGZnMfJdjCPp4US1UkGcuupe+VNvutsR5cPkT6x+2y1aCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W6bv5+Hx3bqTliEH6SnPwvSIeZxrQCVGblm+qpGsqU=;
 b=q4kAzOmz/oyN9Ww8E1IJAaioM1Z12VuiaWzZ+a5B0necOvnSnZi7lHmGnRxzEKjZq0JxQP6YfY3n4rZuD51NWEhMLyTuX3s2fpOS6hO9/qR3BLBBI+VA75/X1bsaId8B6sCZ5JMo1ZUYtFTX1dR33pGPNCeJlY+OiaabDpwRstHpyutD55SQHd4WEDmmv/UpnH8qqr7zb4CpXtjt8z0hQ1pz9bfgsZltl4Pvbfxiv/kf3MEHhBLCqIOZvVXafHtUa1cu70sB43VSIEYbUcJU2SoFDDLO+wKTGv9Emue/BTEFI1SdBgBbWhTyJuT7VsTuVeIkk7RfrYozfrCVD48okA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W6bv5+Hx3bqTliEH6SnPwvSIeZxrQCVGblm+qpGsqU=;
 b=TWvSi8/5U/vdHpNHUcDz2dCnERcbn1zTzn0OG9pJO/jQIRSYQqOSF/fHca5DIVz2BMfMehrpobTcl/zLglEMoF4hQLkDum/cPpExbpprbuT8uptHTbBJDiMtLYhb0OK/J9e5o3D7uhL7qOFVmo3tTSVs2lZbk4y3MQVhPpZyHRLUaGALDZ4m+Sk44g1cgn9yN0lSCM5DmXcpl0Ifpcj5prjhXhe5tJ0lPV7WCZeVRqv/d0j9mcOiVL4nJI+O9bJMxDJSzQlIX+o4HwHtVzWUhSxihT4l5Qp2M/J+ceDiG2G3UrddPs+6asPbSwDwKcMJP651Q0U67aYGGtXo/6l2Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:17:04 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:17:04 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 10 Mar 2026 17:09:19 +0900
Subject: [PATCH v4 5/5] gpu: nova-core: gsp: add mutex locking to Cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cmdq-locking-v4-5-4e5c4753c408@nvidia.com>
References: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
In-Reply-To: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec17f86-6866-4e87-eb31-08de7e7d69cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	p06bbyiX0IjcbIhXxiU215dbL4nJsYArx5E5gYlW5V8ZRxHMsa0jOBO45epRiVCXz2h+88kIy0vMDpSSdj8oJ36jp+D9aYBamCONN7N8d+eG+Ux/TtnJN5sTFPMJT/yfEATfQiekLH+fHKNAeoQ6eu5ISZ7eUCEk/pbFF8EV9+sRz/pXMs6MPMyMMgd0Emmj+RfnUrNe7q1b5q3u64mcNZzhss4vfb0pL7d/8ZBVzTY1KjGmo7wxBRWLZwlXCi1MFLK3CMvZSHSh2CeZZJUHGMxPoGLL4P+LB6HZrXlRWS/znFfm5CC6FOIDBZL/sEZzQRJTpxXg4chpv/4sBV8t163DkCehnbUi/hg1wGfd3Psec3gZ//8RspVKY6L2LvcKG/eHWMC46pG5rDbHq49fHE57f/tBzltIDXkgnWKh5vCUHiPI1uLiI9nWcld2KfJsNJ6ZCPzdX9p9kRVfUjBBXAV6B0EqxOPp34whv7T3YAxtvqMh6gJmJGls87eA2vxiIOhLpyAu6h78zI/AxfUE9W7t4qWMoRvKZ5xAE2fj5TIIfauts0DpEbiu1kDqkfhDrmZgKMO9jK6yzvDbiC045E8IGnPpGE1iPicpdPwmFd8xY+VN2GcRSD2k0K+YIXM//Aa+lUpI+bHcQo/ILW+m39WAxonzaJyi1csaembdFjsaEMbc2Wj8IMGH+f98VdMnuzmFa2O5OspOPIjepkbgRKcdHwD3hSZLgxpCiDQaSM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkpSNEZaV3pEUjNqK0NEcUpJL0duTWZvaE9WZjc3NEZBT1VuM054dFZvK3F2?=
 =?utf-8?B?SmwvUkNYUnVFaHJjN2JxYUN3cUZzdVlQZU5PVzlHSXlMUVpCT09uM1BwUGZT?=
 =?utf-8?B?aWJmWVdkRHA2VVJ2Zlp5SFN5UElEY2pEWHg0Z0lNNEhXcjJhQ05HWkF3V20x?=
 =?utf-8?B?NHRLNVZZVjBRdlpLdkJMV2tLS29kZjhxNG5IbW9iUDBHR3RvNUVRNHkzZExF?=
 =?utf-8?B?QnZBMndDQnVSb1Z3ZkVCYjZKL3QzUlRzOFByNE56Qnp6UjJQUnBqdDJaM1ZQ?=
 =?utf-8?B?WUtNcU5CendTTkdxT3lCVXlxQS9CNDJabkhrR3VaTDB1R3lrWFV5Mi84OUEw?=
 =?utf-8?B?TGI2eU5HZ3h6MWZvZDhEenNiQlgzTEJTaGJmS05rN1U0dG8xckROdVk1UlVo?=
 =?utf-8?B?Tkw4SHdvcFFPakZlM3dmTnZUUFU1K2xvOFJBYkE2RjNOdllqMVRnN2dxSzN0?=
 =?utf-8?B?Q1FSRjZ4TVdkcFNXa0NnTGpwTzl0K0Q5UExObERZMVVlTGxzT05aREJoOXpJ?=
 =?utf-8?B?SHRvTVlETGMvSHZSZEtnNjJpU0lJUmZKVzE4ZDV4UnRqWitSQXVKZE5tV2JC?=
 =?utf-8?B?NVRUbmRHNEhxMzZicG04aTgrZGxhYnV6eUNEVGFYVEVSU282UzVuL3hOTFla?=
 =?utf-8?B?ZEVaaDNITGJrRXJHNEdlZnlRM2lQR00wdTBoUndURS9QQko2NTdTdFJDeXNw?=
 =?utf-8?B?cEV5dWI0djNkQWlwWXEzMVZyYU1UbHlpcXk2T1piRDlPNGRKbjRtQU1NT01r?=
 =?utf-8?B?Wi83S2xELzhQUFZoSW5ramxhVlZ0MmpvQWJ6cEdhN2RrSWx0aUZ6U1I2Mjlh?=
 =?utf-8?B?RkxLWlhwOWpaQ2VsZUxUdDJFeWtDMURwWHgxNGhBUE85Y1NUUjFYV1FucVcv?=
 =?utf-8?B?Yjd5UUNGaVhqUWRvQnpjckxjdHlERTFDeGxHVUd4NEd3TCtLTjNXdE1LbWxJ?=
 =?utf-8?B?eVh1Vm5NNFlCMkZENjlMWk5Fb3BJeTg5WHhTU2hQTWQ1N0FnOStqd3d0b0kz?=
 =?utf-8?B?a3F1azNXUWM1Zkdpd1dDQ2g0bXJMOFhlQldyYUp2L1dRUEU5R2lFZE9KT0ZC?=
 =?utf-8?B?MW0rdkwxazd1ZVg2OEJsQ1luN1QwT0tFMHF0NTZWbkFCOTdLbm9RYmVXTjhR?=
 =?utf-8?B?WWE3aFNsSHZRVStNbTF2ZFpHai9SRjhqL3pLRkJvdWp4WStWSVM0U3N4cXpY?=
 =?utf-8?B?eThhWHhLQWIwMXF1Z0xLaGY2MGdzVXBvb0Vld3NMR1NaTVNISGVOTEQraXIv?=
 =?utf-8?B?UWpyaWZieWthcEJRc3J3YSt3bG0zV0lMTWtqREJtbkw3Tm1qS1ZsRlY2aHJY?=
 =?utf-8?B?eGVhS0VrdkxpK1l2SlpPZEY1MGg1d0FjVFYyaTNIVmFKNm4vdVRYOUREekxO?=
 =?utf-8?B?MTRBaDJNM2FBQ0FWL2dISzh6UW1WZjdOc1JLMWF1QzMyQlZqcW5FVWlnRHpu?=
 =?utf-8?B?Mk5qUkVUaGtLREdXWE9YNTQzSWFYSWs3QVZQZ08yYmpYWVZlM1VIUThSNFZ4?=
 =?utf-8?B?MlJrSzRTRyt2bGdPRVZEeUJTclU0ZDRiYnVpZXlqZ2FtVEVpMjY4U1FqaEQ3?=
 =?utf-8?B?S1Fab21hdUtuOXd1dVdtMCsyZUdsb3Z3dlpKKzB2ZzNFMUtCek50VXFxTkRE?=
 =?utf-8?B?ZFZhVDROTEdZNEloRkQ1KzVBUys5VWpMWVJmdzd2cEpsY212c2dON3lkT0Vz?=
 =?utf-8?B?NUptTUNPemNOZHNVbzRGbUhEM2dIZ1kxU0d4K0tZSWhUY2VrL3lyanFjMzV0?=
 =?utf-8?B?ZzdtMTdVUFF1NmxHbGd5RHZNYzkxOWVodGVRZmtxdEhYOHh6TjdzMzNraU4x?=
 =?utf-8?B?b1d0eG8vaTR3ZnlqZ2ZKeEVma2JkWXo2VjlwOWs0dm9oTDJTRUlEbkVBRzRB?=
 =?utf-8?B?Wjl5U0owTmxOVTJpNjV4YVBkbmQxblo3UnBZMlZUK3RLcEo1Y1pvdDhCcDVF?=
 =?utf-8?B?L25zcUF4eVhjUXR1bndFMkJVdXR6Ukh4WFl4TTJlRGVtMGF3R0IzNkZXZzZO?=
 =?utf-8?B?YjFKakNGYUs3NVJtdnl2WkVsQzIxRitES2wvNkNRZGRBMnlLVnVhc2ptMlNY?=
 =?utf-8?B?RGMyTnAwbWxwSEVIb0RZTk91ZU1MUjlZMHhtbW5MUk54dXFlQjF4Vnc4Nklq?=
 =?utf-8?B?VWVEZy9acmI0dUpMd0t1ZWE1SDVXOCsyMUhCWUI0eFlsYXhhOXUwazN2Sk9H?=
 =?utf-8?B?bEpzRmZuNjBMcDVpeDBSUHNhcm1Jdk5KWVZTdk9Ha1d0YWN0VmpOQXozbkhq?=
 =?utf-8?B?bjh2RnNrUnlOekZiNjM3SGhEMXZMVjJTWkhBZm9mSVROTm04V3VxZ0hKdGN1?=
 =?utf-8?B?V3FsOGxhOUNYbVY4b01xbE1NdnBxS2tuclVpNkdnaldxcW9ubzlaazE1RlRz?=
 =?utf-8?Q?PFyckf6SlvCa+MaKtAB1k5wYmkQnqtRad/Jpx8v1jEC59?=
X-MS-Exchange-AntiSpam-MessageData-1: d+Q98bkEYb0l1g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec17f86-6866-4e87-eb31-08de7e7d69cf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:17:04.6619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN7TNAq/YdoK5qY5ohvYouMSEnitZHog1ZYzceMUSlKlEmsyMK0onkKAGVFgod4NQ15yuZibJ6JsfrDeau9ElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
lets required commands be sent e.g. while unloading the driver.

The mutex is held over both send and receive in `send_command` to make
sure that it doesn't get the reply of some other command that could have
been sent just beforehand.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
 drivers/gpu/nova-core/gsp/cmdq.rs      | 165 ++++++++++++++++++++-------------
 drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
 4 files changed, 105 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 991eb5957e3d..bc53e667cd9e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,7 +128,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        mut self: Pin<&mut Self>,
+        self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -214,13 +214,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(&self.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(&self.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(&self.cmdq, bar)?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 90179256a929..47406d494523 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -18,8 +18,12 @@
     },
     dma_write,
     io::poll::read_poll_timeout,
+    new_mutex,
     prelude::*,
-    sync::aref::ARef,
+    sync::{
+        aref::ARef,
+        Mutex, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -477,12 +481,9 @@ struct GspMessage<'a> {
 /// area.
 #[pin_data]
 pub(crate) struct Cmdq {
-    /// Device this command queue belongs to.
-    dev: ARef<device::Device>,
-    /// Current command sequence number.
-    seq: u32,
-    /// Memory area shared with the GSP for communicating commands and messages.
-    gsp_mem: DmaGspMem,
+    /// Inner mutex-protected state.
+    #[pin]
+    inner: Mutex<CmdqInner>,
 }
 
 impl Cmdq {
@@ -502,18 +503,17 @@ impl Cmdq {
     /// Number of page table entries for the GSP shared region.
     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
 
-    /// Timeout for waiting for space on the command queue.
-    const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
-
     /// Default timeout for receiving a message from the GSP.
     pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(5);
 
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
         try_pin_init!(Self {
-            gsp_mem: DmaGspMem::new(dev)?,
-            dev: dev.into(),
-            seq: 0,
+            inner <- new_mutex!(CmdqInner {
+                dev: dev.into(),
+                gsp_mem: DmaGspMem::new(dev)?,
+                seq: 0,
+            }),
         })
     }
 
@@ -537,6 +537,87 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// The mutex is held for the entire send+receive cycle to ensure that no other command can
+    /// be interleaved. Messages with non-matching function codes are silently consumed until the
+    /// expected reply arrives.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        let mut inner = self.inner.lock();
+        inner.send_command(bar, command)?;
+
+        loop {
+            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
+                Ok(reply) => break Ok(reply),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command_no_wait<M>(&self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().send_command(bar, command)
+    }
+
+    /// Receive a message from the GSP.
+    ///
+    /// See [`CmdqInner::receive_msg`] for details.
+    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().receive_msg(timeout)
+    }
+
+    /// Returns the DMA handle of the command queue's shared memory region.
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.inner.lock().gsp_mem.0.dma_handle()
+    }
+}
+
+/// Inner mutex protected state of [`Cmdq`].
+struct CmdqInner {
+    /// Device this command queue belongs to.
+    dev: ARef<device::Device>,
+    /// Current command sequence number.
+    seq: u32,
+    /// Memory area shared with the GSP for communicating commands and messages.
+    gsp_mem: DmaGspMem,
+}
+
+impl CmdqInner {
+    /// Timeout for waiting for space on the command queue.
+    const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
+
     /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
@@ -617,7 +698,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
@@ -637,51 +718,6 @@ fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Result
         }
     }
 
-    /// Sends `command` to the GSP and waits for the reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command and reply initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
-    where
-        M: CommandToGsp,
-        M::Reply: MessageFromGsp,
-        Error: From<M::InitError>,
-        Error: From<<M::Reply as MessageFromGsp>::InitError>,
-    {
-        self.send_command_internal(bar, command)?;
-
-        loop {
-            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
-                Ok(reply) => break Ok(reply),
-                Err(ERANGE) => continue,
-                Err(e) => break Err(e),
-            }
-        }
-    }
-
-    /// Sends `command` to the GSP without waiting for a reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command_no_wait<M>(&mut self, bar: &Bar0, command: M) -> Result
-    where
-        M: CommandToGsp<Reply = NoReply>,
-        Error: From<M::InitError>,
-    {
-        self.send_command_internal(bar, command)
-    }
-
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
@@ -717,7 +753,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
 
         dev_dbg!(
-            self.dev,
+            &self.dev,
             "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
             header.sequence(),
             header.function(),
@@ -752,7 +788,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         ])) != 0
         {
             dev_err!(
-                self.dev,
+                &self.dev,
                 "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
@@ -781,7 +817,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ERANGE` if the message had a recognized but non-matching function code.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
+    fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
@@ -817,9 +853,4 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
 
         result
     }
-
-    /// Returns the DMA handle of the command queue's shared memory region.
-    pub(crate) fn dma_handle(&self) -> DmaAddress {
-        self.gsp_mem.0.dma_handle()
-    }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 77054c92fcc2..c89c7b57a751 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -165,7 +165,7 @@ fn read(
 }
 
 /// Waits for GSP initialization to complete.
-pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
+pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
     loop {
         match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(_) => break Ok(()),
@@ -234,6 +234,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
-pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
+pub(crate) fn get_gsp_info(cmdq: &Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
     cmdq.send_command(bar, GetGspStaticInfo)
 }
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index ce2b3bb05d22..474e4c8021db 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -356,7 +356,7 @@ pub(crate) struct GspSequencerParams<'a> {
 }
 
 impl<'a> GspSequencer<'a> {
-    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
+    pub(crate) fn run(cmdq: &Cmdq, params: GspSequencerParams<'a>) -> Result {
         let seq_info = loop {
             match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
                 Ok(seq_info) => break seq_info,

-- 
2.53.0


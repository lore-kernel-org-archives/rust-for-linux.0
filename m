Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B52E339B;
	Tue, 10 Feb 2026 02:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691597; cv=fail; b=LTeiYpoBGYftQWe0uJ+EseMpmp1ZpiQJaGNAZLw6Lpzxi/sFaYLaTErLAWc7Hr5XwgZxf74WRlEoCsBbwzQQouYfM9/0n5aDjtPFjL6meSFdXYO63e4GbdBaoANYDsRApcp0rm08xY+ujACHsiyma3e9XDKTMEGPWa2L3rpYzKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691597; c=relaxed/simple;
	bh=2E5jsJLtTabj8ssZRDFYda8TIn6MZXp42VS6TROJRGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E6xtxb57slC6lalXwO24NVA7vtNCsl270rEkoPobk7Gr9CWV4spe660co/O/18+offJWsgKQglJiUyJbCILYRBDQHV9nYV865UWnYFTk3+LBEt7K8ZjSnouiTtWmYsyVGRQ13pSOPCwOX/ENRXGNc9Px/84Nxp/dNiS7cF+Jb6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T4YXUObM; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T4YXUObM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA5RLKiyrV3XZn8A3hl3xQB0m+plS8Ai+DUmYALSOgX9zrm/zTZ9Nh5cb5Uezp/eLgPEnlIrNj9xfokfxlwuxc1miXfuIcwns0Ti2ctMskHpOy+jrcnJVHmpZyc51KMeUCX6/BojSR085aIv6eRt+7jrXfIuwwu+04zxoOrOhlOvgwY6dOz/61pzuRpDUbztoTyOMb20gZbCgKalsANpI7PB4LX6E8RRCihPLFp3Au236QDuWetLJapsvJuq3TJaZBp1Zh86PdAYSIi1ltK59p0k4ng2napg+Bi9sEB1w9jKVznk3UdM2sfmDRBiLSzRmWCb7NJ3A3iuqnf1tozi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KseHWxD49ciminLMaryksRG5IoLWQZRya9Z+GQ04r40=;
 b=ayahmXw7S1Ic48uz27fcNdRvEJoCUXTWNAm4GrFu48LMHCMsVKeKXr0g/MqdlWHdLKcQYOCB2DB9WFxpAHrAs9HU4CcQP7kEZPtdPrAvN0Eqarb9uXeXEfBlDlkrgxbOUR6UPRjwOq5FMbkQridWDmtJrLTsDXgSZiloSFQ6lUWzAigzUQmpLCd7zJjLrO5Irw5tCi0a4QGDDwKQzELRquflUAkBNJ+6MpxGR9BhLOG1gnHaqIfXJXk8z1SEmE0iQLtpH3HO+7BoKj+yjJhOtBp6w7vQEHmqqMi8qIAWgbPC7v/3BE9EOyQLcQkornG2aDI5WveMFllTXLcMBasxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KseHWxD49ciminLMaryksRG5IoLWQZRya9Z+GQ04r40=;
 b=T4YXUObMjkNzxuqCu7IpJJN75uCIM7pJVW9Zxy5/EcQ3oXDXqEkzFBgGm9aJNFoPJgc9kti3Pv4qtIsheBkWwjXxNTv7xDexgzs4nJrqdlG7RmrUnkDaOq9SW5we65Kdp5pdbyMJTeW9Bu4dPOU03aWp9+1MzHUktnSUcs4BHsCE8fy/hreSdy6m0qHd0m1dQlZVBgVkF9XSiDB0B98wYsmeMXeZx2DVYiemOoit5E+g0KTnSyo+sUiFQ2OWplSG1APAPBFvIUqqcA6tibCZcKD6pGN+E9Vc9NJ0FFb4YvMScGzEppGiapa6/EAiFG0uRCLGRigTaP6hFzNu6NVqVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:10 +0000
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
Subject: [PATCH v4 06/33] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Mon,  9 Feb 2026 18:45:33 -0800
Message-ID: <20260210024601.593248-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a910c7-80ab-43ef-73a3-08de684e8c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MrxMkmZvGgC9xgNNcZIqP3Q7pnAbwjZLiy7SlPF/fY0Ww1g/0jYX1UAv247v?=
 =?us-ascii?Q?KBt9hycsCiIgNYpzd4UNuq73CZl+yea3cDB3fOXTe5IsS565ApKzt9uQH+WQ?=
 =?us-ascii?Q?t0x+QH0iCmVcNgd1HYRacoa8YvVTYoHp+6MQI7FdkoylCXB/dfyi28HsfB1y?=
 =?us-ascii?Q?m3KUWWId2IFOL9xbdyO26wCccMwFSbGH4eMj9IJH7uf7WzWd1LygcjrFHdxA?=
 =?us-ascii?Q?G0Pl9na+BfqpJbxjlqEzRnkb5HICGyHwtwpLb8xVYSaoKkSzNhNJWe4xCGJH?=
 =?us-ascii?Q?tFUsXPpkH/jjtq3MODn9/fKqesQ6naIWer4FU9FjU3WB8RC1UsA6JGufRatg?=
 =?us-ascii?Q?N7I5c9dsz1XdxdBP+nwaWQ2CzSxW7KykkZbYgm5Sq9WOgh3G+zOLPeTjuv9f?=
 =?us-ascii?Q?46MAflFPP20JNwcL90JPFqh7P6Uiys601uCJnDDwSYCyTY/S6uUkx+EaxV4p?=
 =?us-ascii?Q?B5WXwG8HsW5ZhBvBhMNqnFAOXbxsdyWjT5hwIaOtsAFEgGxtTYzO45tyxukp?=
 =?us-ascii?Q?pLVFmJAjmi+Ks6NBDto45L0r16fld7omzFPeIwDl9/IFfCJsvh2HM5odMseM?=
 =?us-ascii?Q?cCCvNnAQAAoh9ukLQ5E5M2ur7s83CRkB5suTfMl/PWnwInLrn0jRsVxabAyu?=
 =?us-ascii?Q?j/MXbRamgUQDUMwOf92FoWMBM3ZoKoJ92cbmG3wuYvmEGd2I+b8R95gdfRWi?=
 =?us-ascii?Q?R+bPjG5E01REvyTDBrUWq3wvhKgGkUIhVm41nF8j7j7lj/F7HsY6GolxJ/Z3?=
 =?us-ascii?Q?/zAtKpe6V9/RiXxLlsvhJ1SJAmcJjK4Vtg+57mU2b2Ec4GBaz8glQvekIfEm?=
 =?us-ascii?Q?6TbuI5xcdGkT2BQgmtdUiIuBlxn1zcQ45iFXKxZf0g7zgU308TmuKm4Pqwq1?=
 =?us-ascii?Q?IK/sWU7eQ2+uyXKfmRljKe9mcyD7u2SA5BPUFauZ3XYcv36B7DalmMG9D3mC?=
 =?us-ascii?Q?ouM26RYdNI0TkdZXRQuJgm5TrupFS/yrFwgEuiraRJfe4EJ2+2kn/qCA5NBr?=
 =?us-ascii?Q?iGDYuNDHsGcNhfhywd+C7dly+NcRn8AEH3m7fia4csN4Hdkr/jPkdZGD+euG?=
 =?us-ascii?Q?mbcbNg+xfH0aUhoBufbhOCMLjWiK0n343Cg67xtkVhpsRQSJPCEvnSjlHH3x?=
 =?us-ascii?Q?woJTc0x52B5LUhcptlPkGbi3cSX8n0DlaiHsYrlbwni7NKwSr3LwYnN5Zl2L?=
 =?us-ascii?Q?oQK1Jq+tg7U4NG/AHdgDCGYBHFSGwTHAbv79sVVPuh9Jq4XZN8dZZsYelhl8?=
 =?us-ascii?Q?zLbgeqIVQ1qH6iX+9m34gAL+ALjBcdStUmcCY3bxYb5Z8ZaxBrmmfJdxXPCs?=
 =?us-ascii?Q?K2y/PXF5CeDpverqvOX2Vw3xC8vNDCzxerw2FJYRriCZTQz7IfjMI4YhLePV?=
 =?us-ascii?Q?/MGWKD8uiWjCVSPkSKLa1CmYj30ECBL9/twyjvz7dF8eKtvwGgqo3fhG7neU?=
 =?us-ascii?Q?Z0eySDwu49OtA0+CtrAhx19LFHkWj9vG8TAgKkqtrjB69dCuDxbtjTgbAVhP?=
 =?us-ascii?Q?DLqZ2/amNaq6mlqE4xW5SBe10m9QBqG6uITTCVtqZjLFTsnbifZk42BScikR?=
 =?us-ascii?Q?JJVP9T+UA4bLjJY3U4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zSEoYYthwYPMSUNmeGBBVVUhrjhjnlh3p/IcgQnpcoeCLqGh35/Be0xBo2l1?=
 =?us-ascii?Q?hl7nKxXwh4/QaphrCrZEv2OQujY4PqZXA3nTW/tfTMExjsBSFrVqBzZEk5vC?=
 =?us-ascii?Q?93keNLzuHbROdgG0Lj96OAnX3wi0AmmRgzAewhXYozF5HwYo2y3WxzVEe6vb?=
 =?us-ascii?Q?/YH68e84wbXJ74vA4G734EidWNvnwO/faTzd6Xb6CPyp5z7E2vNYRSN8fisD?=
 =?us-ascii?Q?DR3VVefRMPfdIQ2FwrLbyomyYOClREs4GllM6F8FQtOKAzCe301zKIp23CIy?=
 =?us-ascii?Q?J/ZKZDoc1KtkH/EWO178QTxEGPNRkvhYlvsrfrBrSRkvT7hbjpvPmHpvH6vk?=
 =?us-ascii?Q?eTv4vQclqiyMgAPSIAHUcK4eXx3Z/soWoeTL26VEWNKghLi/b6bW1I4cvy9y?=
 =?us-ascii?Q?yXFf8OlIcl3qCWPKuyg+6Bny/IQToyWyM5osCmBiFo41Fc7ag6+Gwy0nlHXK?=
 =?us-ascii?Q?tsCOlAM0pZk9zFJRZADUNHlUHVHHwix9nz/5jQJBpkCUuUcKA8bfr52kI3H0?=
 =?us-ascii?Q?nB2m+t7y7pbjS0ohHm9doxaPdzEhTSPlLgzyQpUddMwmtMpTF/ixjyxetBYK?=
 =?us-ascii?Q?ISlERIWqfqw9FEVq3sR5iqXJIw+L1eiyp+0cj7yb3GQcYUA7QZK3FldaNFst?=
 =?us-ascii?Q?CGaLahLSOgBEpW6uRgFCEKVGo/S6S3rqhs2w0MQsVWt+RwE7CBDUa78SIxuN?=
 =?us-ascii?Q?7zdWV2DkAq32FuJZUSQfox4wUcghquIu/z8ENOOFVfKzrwn7C+jQTigFAcUf?=
 =?us-ascii?Q?MIOt7R/my3cpMEZX0R0C3gJkuteymgzaZqR8kP/Ub7j3GjnPL/YOhNVaULj2?=
 =?us-ascii?Q?xfEzarJTYsOU+gymDr77lLqasXwWcJfWCUzt+ISZkASnvUlYVsuUsYeiAtvg?=
 =?us-ascii?Q?7N/IYD0B/g9hZ/kffkt75TXR+7fDrFnBFwHZx05gljN3bYlO6DObgnS81XK9?=
 =?us-ascii?Q?pk+bKjTDxYyXNK632adIH0Ej2XGnCD2NPv/RUS2Izqa5euZjWLmZuq3ojFp4?=
 =?us-ascii?Q?Hzdl4V9/BCOQHFzflvX5DGNoKcqBdZDpq7arJWRWTxIuT6voelFn2tvqHFpC?=
 =?us-ascii?Q?FIc36u0/l2s5uYlwnOrcEL/SvDJfAlWbNzieqVCt+FTnKa4rIRLS3fApcyJN?=
 =?us-ascii?Q?kGOfAzKZ/WLiNGF8331JlO5HytW9owFr9flDzXZrSkp3zVfOvn3UgKyBYBcG?=
 =?us-ascii?Q?oPRziu4+DEvvnme+XR0gyCeCsE2nYCCt/VijVHXjjJtdoF6xXLoKwYTXq6Uv?=
 =?us-ascii?Q?1SvgZU4PWyO1KTEOx1An4LExiGm6+BWwGM1UIHvt6Ha0zx7r/JoQ3BstyvJr?=
 =?us-ascii?Q?2ftYCiSIDGQHZHJQZXLTux1KOaHIbPNE3rKZXinxKo9b+5qrw55tIK98bAuX?=
 =?us-ascii?Q?zgfgHWLqMhagwWB6J/fMcrfZHuR4XXG9lUaPIzBT4X0MNCYPJB0qdMNF3Huu?=
 =?us-ascii?Q?4Uyf9OkZhL3CzyfHUrvP3yYrF3Zqvsi3t/AORQ6wYh4/9Du4W+xizbibQ9qC?=
 =?us-ascii?Q?x89zuY/IgCFuw6tgtXvEE61CmdQcu1VfCVwtXG5tuaHph4AKVnAcMyZjOs+d?=
 =?us-ascii?Q?dKFmXvwB8t1zro+BhxebFhBTkeDgiYQ9F5GGzkXPAXYoGG5Kfc/WpKJAQY1K?=
 =?us-ascii?Q?nCGl8gNyerSDmp+FA1aiU7LZye+4jeHMWUs3tfH2kwKYiQI2uuSp6AkeHnKh?=
 =?us-ascii?Q?P3hiFQoB6NdLMqM7FFceJNmPTNQbQY1YoOWnDvlVHTKwrei40ORMGfxPB/Ju?=
 =?us-ascii?Q?+soaoV+q+w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a910c7-80ab-43ef-73a3-08de684e8c56
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:10.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1MT2JJg13hX9kY3Qvq3+MPCpWtqqjMIyBdCd0LR2btEmFjL7A6hIhbFTCup6FEuur1h2aiXk2Ru/buqwuV1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

Instead of long, exhaustive lists of GPUs ("Chipsets"), use entire
GPU Architectures, such as "Blackwell" or "Turing", to make HAL choices.

Note: Left a // TODO for GA100, hinting at the remaining work in order
to bring up that chipset.

A tiny side effect: moved a "use" statement out of function scope, in
each file, up to the top of the file, as per Rust for Linux conventions.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 21 +++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 444c95fd4ece..edf4d27d54f7 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -70,17 +73,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 71fa92d1b709..d795ef7ee65d 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.53.0


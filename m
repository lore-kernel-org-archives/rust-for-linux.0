Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3C3FBEB6;
	Tue, 17 Mar 2026 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788078; cv=fail; b=YrDblBSOvUS1YQwsCJrAlOOUaAhbPNp60qTjtnjOkc1QaEgqwCM81o81gTp8Qab3hqFHBj+cZYIV2o3JqfS642x4Q14DxBWNc+6OUTCE6T5ZtRiVQCOKc+UYp4X2Zfg/qaGXDvqLoeHP5Nc1GXRcJ9jfiFMixkXr69G8x04IGYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788078; c=relaxed/simple;
	bh=1Jk3K1LjP1e+X9y4b7AQJbE66/A9Izc/R8fJb5ht5Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G9H/Nc3aFiW2xw6ZRbxr6BX5c+emXyNGXoXN5WOqGuEH+AG3CS/07kvmVYa3rCIHgd5uBbMjZtsHDNSBUpBPFec5T6SQbxjxW+D2Jbhsa0yLeRmOTs5/kNthjsT9IIYd+XhK/IK8QZ6DLOze+EmTZf+kqVonVxGCj8eGo8o1dVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ed1AqsDX; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ed1AqsDX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fChhDvFud5Jv/yvKebIKnnw8Xm8xLVTGdEiS2gp7qNTqZzC+wFbE+F9Qj9bbN5aTXZld7bmT/rCgfGTRm+GKBmnOnZ7O4ZJSOlVFr8TJNpjdGp1E1BAPItnYZ27X4fv8ZfslO+j2kwvhX8cYny5xqvJS7/8VB4LtESkdVckuPurcmchU/z2EnKkN2womqkivWZYznWRg/Rm7Q7lnUhBkGuR0nKY0vfTknrY+iNy222bBC6ZXZXao+8yD+jED0+M6D1wXOClRxe8iAjB95KpwMKmC9iLq/pOm/c77WKsKfq/7JQkMZ+dPvsnxsVOGQKV1iM8V8Kj90UBeNAoEj4KUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnMJJVWVgc2OLmxCKARqgwbtgLXBO1LXgjP5+/bSqyI=;
 b=plc1pm5LRsUdg8sXdl/iC2LrJjGIK334T9tv/JdMTKOOx2+WJs8BM/jx/30fDWBwBHDdPf62lDjYCHJDnqQUGbdD/Ch1U0VQZiUfPrRwgkPh9J8lZ66lwmX81WsuL/kyOJlNCxzx3kIXCHEe5JJ854U75xFrKy8k3zgeSidKrT/NUiUtEP5cTwJQSMlFdKWgw3AdgffHt2Bkhnge7JL5JHQkmj5d46spWq8KMpeiT6AzzikQPBS1fsltseIujVD8O7q7/UTo7cDzQuv3zNg23qkzIJiz+Dg51GUu7aZZ9jG8YtEmhrewbKPTa+tJMHDGNWcZFu975tlKoKLC45tO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnMJJVWVgc2OLmxCKARqgwbtgLXBO1LXgjP5+/bSqyI=;
 b=ed1AqsDXFMx0n7Nqpv7oGyS0lRrv84FrFthRS9VMvaxiC8obNc+nJwvDWbgSH0WAm4UxAz/BPhVccKj4CEwUm/KyzuB57CpBME8o4WVEBXGHUlaqiC8Xoz8TdgKJxqfAQYYvwweg5Rj2e+iqPYNGs28PZX0Q8np58Gnjuu7daM2VrUW4uxytyhDhx6c7t3d6WH0joqAZtzMsnvzKu42yLEHnfw2VItD8vYGfKN8bYVce+QMFuRlVSVMCFT9u6ofaeP4f7D+Te/bw/SuVoYubtc7IMFepi/aFHPZYNrAXkhgviCjHX3m+JoB9SUXr6AztowkT9Ep3fzdv3C8ia49Gtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:27 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v7 22/31] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Tue, 17 Mar 2026 15:53:46 -0700
Message-ID: <20260317225355.549853-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0057.namprd07.prod.outlook.com
 (2603:10b6:a03:60::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f05265-d5c3-4c71-a575-08de84782408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u+Dc/p8GGNRJWqvdkBjN6uiOt07s0jDonM7VJ+QF8XSLzD0g1nKaVUuFXzVhLskPAeqsKOD43FbQlqckpXTMKtVZExHt/vFcy4Db+nqQw7lyb+L/jTxqzOny98oJCU9jT6XiLEjwhowN5Fc9HfTBrkAiTh989ZT1WDgPOX4yy2PKTYlx0ve6h2jHZu+vVW2c9U1SnRaCAZrGGrjtITV1+sQkfY8d5T/jdPWDN+o8cbYrfdGBdprZLCj7agRAs1khxfGZ4ba6UhYb5KJn/PiXVzbglG+QXgkJzbMDSqM74yYGZ2ypVZ2u04baAQeyB5RVk2K0seX484HAyLNWOyed4a+6yQ/NpZRHaDpbNKvZ1Ccq7tc+Q/x8O/erI4/rVv19WQJFConK5lZDm/QHt70tr9bqFUMa50g+MciVrl12pUSI1PDU5Sep3I9DigaeKEfHWirtqqgHGqFYdWfuQ7kXYCcfHeJipTD1giPfU4+VZ9bXdvu7DpsSsQl6rV95xvRZWZO4ehDkp97uQVxfrFe1JvObzcOwXZi6lRMSdkXzTpNAWQ/WRTbJFMWJjTrJWbOPziNyFwwwmzCejrXzhGfFuwXjtgR1zue65XxvC/zW3G8syUOUC+FBfW78+o1OEedfn3iWb24ViantjmIo09Pf2cO3cu20q9cWinJ2qh3xynovFOfyEZO1uVsG4O4Zc84tCVDe5V7bmrD26hnZNEu9RmF0pxd/Ur0gXjhnGg27Yjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vC8gXsYWC3w16nA7GAm1+ibt60Ux7UcacvbhOxKG8zt8Y7fi3z4sOQ4AeCoU?=
 =?us-ascii?Q?aFR8XRnx2pNQa/4fX2rsCds/nihial+9qKgQLNqcHPnQDp7OCw7VbEJ+Hi/P?=
 =?us-ascii?Q?Edp5Buxe2Rsfac/2ju5h3GVAZ7xT7RnSx3LCRMGUoyQtMTyv/hzkamN+NYPX?=
 =?us-ascii?Q?tF5rkOLgdsfIYg0xykUDh+pehrBc6Arc6gngIHZic2VPgdFhNqt+1KGwBdk+?=
 =?us-ascii?Q?UdJr11fW7lx4wNPr/t0KJ63lo3LoSq3k2XUsONas0Slg7K2eEiDPHadAfZR2?=
 =?us-ascii?Q?old+0q+GIV3UUsl+hem03VPZewO9htj349n7tFNZCsf4SKCokIzw6eIej4FW?=
 =?us-ascii?Q?FaguuSwN0UxU/VoUtIpfGPSoKW52w41IcdIqA2Mu0570qNcWN72Qx/fPf1RV?=
 =?us-ascii?Q?hbl8adpzEY94KbCZN+VMX+m5ggmnl1eJ17Jk+dTfuy79Q4Qs81AdtkxB604h?=
 =?us-ascii?Q?uDYSOE4ZvBYZKyJm/f6rbRXbNIM95buOZenMclbUDZrXP/q8vhzEpsIpk1jM?=
 =?us-ascii?Q?iVtFyNARyytC/yaQXPahBQYZdMPUNzqoef5TR9si3PC/MOgOOD+Oq2Db89+Z?=
 =?us-ascii?Q?DkfO6ELvVemFVZ8emy4+Fql+SR+7L7aRyPp1bWKBoGg2Ic4NDuOOfgK1hmeC?=
 =?us-ascii?Q?JhTVwu4FFBH4WydhcStsnYMOn93vTp4+necY7VZrzvMoE2r24MUxJNxxpiJr?=
 =?us-ascii?Q?/3XkZCTqqWaxu+M0MYGeesBBKaIkVTRJxouGS3V0UhMINX+HS00YtgMBVhC9?=
 =?us-ascii?Q?F1vqCn9KCPqd55tjIN6IH4Ga4052xNQD93zRlY1o3+OfX7fOCjGRnU9C7gLe?=
 =?us-ascii?Q?aYP1UZ7qDto0YhUNYENi/YN/+p7e/Itm8JApW2OT3Eo8QHCWVvITObouqeBg?=
 =?us-ascii?Q?RVXjIsfq9lweCq345xHygACEUAS95KI3Tvc/AsX5EiddU50vT4Ln/81EXluz?=
 =?us-ascii?Q?2Ivc+roR8vga+RbTqGMVhjhpGYZb93HtctZRi6pRmZR8zlxEnistW7d5d09/?=
 =?us-ascii?Q?LpWNkId7nN9E8sQCVF3RTwJVAhfPIeHhd08FUl+DKTX7594RDT7Z6ip8fzN1?=
 =?us-ascii?Q?Aqk7G3iRwHjh8xgx7K3fo7WuHvcOosJMXVJUzE+Sr0VbYK+e7t1zCTk33UEa?=
 =?us-ascii?Q?WzXU619tWgEiWNm9gf5XpSGesix0GUL6R/xhRlWry6lKyeWUrj+7nzc7BTgW?=
 =?us-ascii?Q?wtkaexFCvaf3y3pb+/tSekZDuQP9BIPp9VL9vmwX3UnQrBxwbDx7a96iYHK5?=
 =?us-ascii?Q?RQNVyFolBVVhQwp7+gjnMjUGXOOZcmNbzMrOLmDmgqMUYZAH2tGz5zbgknxs?=
 =?us-ascii?Q?xSFToWx9/7cwjryTK0R1QltYjsyv9wumc4e/buGW+G1PagAln1Fi8mtp/92R?=
 =?us-ascii?Q?j/3TC3mtV8iaDU9PVz6Wqf+KjpHAF70UAKA+KuXFALbN827RfSlHULyWUwCg?=
 =?us-ascii?Q?vIIJXDaLMNf56po/AmBrrwtLWQ0HXG7BsJ1Vpj3b4uDPWois/FlsVnXesMVw?=
 =?us-ascii?Q?HhX+5/4M3uSV6pSNE8emZRTBLtBpNBBFSxTxiLqL0o6XvAzUPHfUoarr3xf0?=
 =?us-ascii?Q?MGJRCYQduux3YqOni0X2nkliXGy+KUewii2QIWrPwIx7uCzgq2CvOftBrgmJ?=
 =?us-ascii?Q?pY4iasFOB9gdmETh/Q1+vw9e5sVjOWXDFIlen3uwIvzlJX2U16bg7XBCn31d?=
 =?us-ascii?Q?7Yz7+OJfc+oJhpLmGFg8yYGFycsJtio9Kf3jFGmEzgriU2DuF3HDuMhlzsTy?=
 =?us-ascii?Q?LVnm2WEVEg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f05265-d5c3-4c71-a575-08de84782408
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:27.0069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjDSzCa/fMJkZeohS2NWZz6vjBbp35ohtakYJ7WPoaYRiR4xZ9Kcpw1MU3gI8gBd8MfHTTB3dRTICxuX08DmpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 4fb932f91da2..18edf7a1a8e4 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -25,6 +25,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 93f861ba20f3..1d25513fef20 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -18,6 +18,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gfw,
     gsp::Gsp,
     regs,
@@ -133,6 +134,19 @@ pub(crate) const fn arch(&self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::Blackwell => Some(FspCotVersion::new(2)),
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0


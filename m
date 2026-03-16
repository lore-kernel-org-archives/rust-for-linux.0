Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD07347512
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640693; cv=fail; b=nXc9+CHQ6Dg1J2Bwud37mq6zuSBY9n//k658BPXEE+AVrQJD0VsW/DyPCjY+6MjXVMwsKu3KGZxkPSKCK0x6kAiE8vs4rzDoZI3uQQBOmVbN4mGAUYR6/XxYcBW74eVuRkEYzhoT0dE4KJJXHJBDoZGhWnFD7/jbAhr9tKwFp5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640693; c=relaxed/simple;
	bh=TOP7kZoX9ikSSjIlzRJTufJO1t3OwYW6vHe/CROeKCk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bupd67s4WAsq0/GMHm+uGQtOwx7CVzMA5yQw14Dq//ezaTLNoevKzxUDqk1GfbHr1h7TfBgKI/J0l5NQ3S0a9+HDelFvb0XFzGgAqJwgLGrcssE4OmEQVkq0r9SO8iHNtF0IRw1oZRR48srWCgX3MsrM5VAWHjHK7r+fEqCkPHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OZPrEiyT; arc=fail smtp.client-ip=52.101.52.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OZPrEiyT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1TosDt8Ck6kZ1y7msW7XoG1EYhHtCIHqOS9DWbVLYCBcLhkme7dMqqiPUfe3UtGWDsUu5mKWgJu9IGHYOpFxCE2I39VVtIS9ay0vCI3x+JJ+eVWzHT8wzPmkgZrax7fbrPedkxAiRVIkfsPgc5CA2X5H10HLrRyJp2XPyn7Pt1JgmL0coeSjAX4/kqUi7E8jjN0MVwhbt60Ogy8aPp1iAGIRVGcylB1I/uVThGiymfydjJDUKgsfrLwoum5HMOljfsFUwuOJqHlqTsTXVFLGy8QHs9Ugq5GNXB5XqAbIcvMM7oCYjHZliHnNlAB0IwpdMACDEXKPs7WMtIOkBlCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRz6JNHdMwFTR5Ny1InkJWv3kvtLjgcrXnjnK9X1dc8=;
 b=lrXlaRg5RlYgr4o5MqZyTtfQuhe0WwRxxZaJcHrwbdtFTsHzBiqmAjKBr3uBOn9Lwo61HULRaOgxMpBNmERYpBG4y393WAm09j6dKd6ObTAsjDsb2NJqgsp6/1GeuoeDhusJJgTnf1yzGeeGABGaE5g0TX6NLPviRuNidedLYGfGVPSw2VUh/hIGCeizWqCfOuY6r2gBJx4WnuVIQaxyaa/oRMheY+YASBtAv3+wgaHTIvgmtVont9y8lggjnGuFSM0mKkr+RQmod45BjBi3YyJC593ZOLcd+xvlFjEfhhnDGbxFS37N9P4YYWqOkQ17RhjHqTdEMusi3agVpQ9eSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRz6JNHdMwFTR5Ny1InkJWv3kvtLjgcrXnjnK9X1dc8=;
 b=OZPrEiyT+YMQdu0a8gj5XH7239lCspmpsfTRjPpmyFWlOupEvJihalnD/zR38fiaH92Sg86D7WkPQ3siRVIDdKtQAveICwdcOpH/f14FUMPyXhPtb8WR3cgq/ASPXblvyLCIaTd4YnMLSy7BAWYWvKjG26mKZj3izIKtqXP/56uo5Fh+iJWAxAiO5iflwVJby81e8yuvauTsNNBL/adrxZbraCAAYI4Fbta1TR3yk6B7e07+0VFhiLqAmyUqSugXrwel3x2yJqCATMckKQDZCF7QUp4JcEQ3T+1F1cqdQ5p0xRuHSzr0sK37C39hpJVyeGEX/90pxR/tDe4LFCwC0g==
Received: from BL1PR13CA0431.namprd13.prod.outlook.com (2603:10b6:208:2c3::16)
 by DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 16 Mar
 2026 05:58:07 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::2) by BL1PR13CA0431.outlook.office365.com
 (2603:10b6:208:2c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:54 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:52 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 4/6] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Mon, 16 Mar 2026 00:57:34 -0500
Message-ID: <20260316055736.1690546-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: d543caaa-253c-49eb-6acf-08de8320ff31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LGFrqdMicvuVBergH6S4zMkld7N5RbzLsi6XqD0JrncHnfIOylczbQzu1idcFp1RUwha4hW60WF3eTmbqJuxKym03Re05TbtkDwUzkf/cJ4uSBTLG4v2dsa0GO5qFX4sYTWaVcfzJvv0lbMnpF93XKbs+Q0A02TUYMXxGE43r3yZIVFIo4JvcNlvF+PqOl7oe5r/aRKJSeh+hsDbqb5GPcz5HwZ6RmbWwPux+Laq+TtQlTGB9cAlwwzHhCQoBdljJmn0LA/ZsWfP6Hul5hwFlXN2eyXeYcyys4d+S8meQYGGU3U4g5EA+lVlJ6PR9cOfvSReHMhzII1sbE4bwM7V2oD4YHEmCSg//StRqMo2cDgbCembBWBEEwODAaqgXDE12qcJUrFy+y+gXyvqDmT0N8DsqGmmmZ2B+MHFPcyfYYljOMjC73ryPlXyBrO+ydO/gXq1Mkvdb5uQFYQGoVu4EiwZ4NrHSRrGu+rxupFyEqKtgrcL36frI2vJ7ND47CiAK2yhcTG/1xBGDTQXXLErilBQiNeYsN4CwLCG4lL0ISkdlEQMrvhGjk5MFgUSihKLnwp3zbqZocaUUIAfvio9Ys2x/Nn3yaLV/RjWRauWCACCANDhpmbFyGN6+zhbEGb8ElrayhOYm5fT2F8ZOrObRRHOnzoTW12imdndccIC3/9TLbALAk5Sg+xjozlnrCvnGXZ3IXJ/JoYpPZkaXLmJHOehru1HOxxUB+84G3G850CdP1R34Q9c0trTTPIOxI4P8dbvqGRGAJ2G0S4B/Sj10OBT0ium8VzyYUQ1ZS89EelPx7/HHaAdZ+MvAjVFie35
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uNuanixFbqkbs7H3l6dD0SXGAtv/NlA6FKXYfo4FnEe7sPf5ZFEtVFqF4e+sHx1TjqVHbmUQOcDXAX8esTHuffBICA+aptHAb2T0hO8Zw6bPzXrXabwW0pa5Bae5K9yBqit4NOw3+ldIoEABeZmPZ5xArEbgZ5eviIFLmgqF1u3OTi2rKdwQPLjkrppn15Dr6TgUXyiuG2bFDXEVWXbU+e7Ono5/01jME2NvDMBgbgQaNs727QK+1E/+u77NB6VnbJ/9mU6rXf1c9ReZSFC6dMexGtvE1TULXIx81/pz5ngmjmGH23DzHtmV68KznbDkthNKgQhd/m0knWracMSDOrajwLUIWCjkikICofJcnf8rwvGLtd7q614VF1lMKzFdSvHpCNju6gjjnZ+SiqsW3OXW6+ZWB4r8AtCPHIMPoP0T6vsKcg5xOxV85q+C1BjM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:07.4865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d543caaa-253c-49eb-6acf-08de8320ff31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b5caf1044697..0114a59825aa 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,13 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{
+    driver::Registration,
+    pci,
+    prelude::*,
+    InPlaceModule, //
+};
+
 #[macro_use]
 mod bitfield;
 
@@ -20,8 +27,22 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data]
+struct NovaCoreModule {
+    #[pin]
+    _driver: Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _driver <- Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: NovaCoreModule,
     name: "NovaCore",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
-- 
2.51.0


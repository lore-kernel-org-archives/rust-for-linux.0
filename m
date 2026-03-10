Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39036B05F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180049; cv=fail; b=A/B0sNGzJsnt49Gww9xWtcU65iTmbgxXqutfHlbUNxUgR06ZOqfHJusaYEulb+QEml9g02G9NrH79K13DvkuErRFWnfhve1aQqBsGI51wiA40Ma8vhz1jXBO5vGxxlJ2ExlcrzbFLKjUOEm5N1oMGimJz0vwlDwe9PnDTMxmCa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180049; c=relaxed/simple;
	bh=bceZvL+ucZBmGfnhbx1RHUrjxNHMIapt8CvvmqeOqVM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bq0hwk/OSNaQhL5zqYeIOBMF7f+D5pzFjYnZN9ilQ9ZvUUu9mdbh1NGfT2zTqqsfD+eKA5aZNoSaVsuVf3YgR68+zHegzk/Ifen9WYqszAm3UCn7gXo/SUvuJSG3FbnR0wk9V8myQ+52PoBewAdwBzHbpEEas9q+H2fEMo9fdPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UL0C/Mca; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UL0C/Mca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMa34voKzqmf1H/LSRfSuzu5/gOJpSpIup863gRrgcX1zIdAFJ6ZqxbZdtSbV6E29G/8g4okC0nb/yvrZj/WInJxnz4IE0JV9TJAQdcTeSaXkt/W4J5hCHO3Ye1iMoZ3jLk6m2+SVd04g0NK+rk1aeBm5shrCf0vcVXBrm1bQsq8TuiknTcUSTWWroznZJfKJXVl7IOY+Kb+Jtds/NQpXisxYB0OO39Vw5WJ+S8Gm+66fR5J4yG1r+5gB32YOX7hBeW2wHehPGAF8JmxotE9MCSzOjyyV4QNocuKSrawR7BT1May3AjlnFr4poRPxtBA0JKSwaMLepXHAfZFVHrMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWOzKbXFGtc2dQ7X2rhCPM17FCps0CDtVmxFqJqpJFw=;
 b=xFqxSZBs32M8QIO3fhmSoaDMIpKd+B4xwkd4EdgLtStxEet4Z1luT9Fl6j2T9yqy2mC0YKtAJyQ4jGfkERIYH3zfhqH5wIYCTDDplyUxrq+tLAOn+8kK5vhMsredhWKCjtpCJUjswDe86vttULB5XYIKnhJXlKuDE+RwjN35BUC2VcTMyEIFQ+TO6F9woD7sZ48xWSEbEkc5lgaJkTspOSi4LK9I3Zi1aELHvkA2wYb2qxfNepNPZStKfNZLeMN4CFUBtsyJuw/+ugbDnVGkjE+njnV2ax/PXJSaW8KysRWNFzq1l6T9RRbilbMqClD1uZBKktA7q86u3Suf6WQ5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWOzKbXFGtc2dQ7X2rhCPM17FCps0CDtVmxFqJqpJFw=;
 b=UL0C/Mcay7XV1tPMxSvN5vA5zVPmp7wRDDrjbhnAVXF1IT44LM0WPSZXodkczPgSMjYuTgiOPsRI6NnOPmV/jnj+VJ0BODCCBUetHaOvr20zgnpaHa40eJAZBxikREHSRv8dc1CwyEM80/JVmGet9BZ7dDEry3S8/FI+oBiRcxAp3PNQfrGbt7h59RK06XcAVx0y9NdgXPufzQ3Z+mZxXnFU76lAQUOSi7mHdHINRcMsJNgJHp6SIAwbe6j+dIVy1B3xcsP3v5D7S6XrlLbF8J/IbaJYe8WU/+3d9Vfu1GZrUdDqz4701WUD56/8DRRiftLq5oMyWgWDWtj3cMhoYw==
Received: from BLAPR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:32b::33)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:44 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::3b) by BLAPR03CA0028.outlook.office365.com
 (2603:10b6:208:32b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:20 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:18 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 4/7] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Tue, 10 Mar 2026 16:59:57 -0500
Message-ID: <20260310220000.1897166-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 489e09b1-b6a3-404e-c4c5-08de7ef07998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ukZJAbxY/Mgf2S/SX0R+AJiGj/ZUwp01h0t38VIYSLsbCF6nLUBdoH37VYMBsHNfsqFIrjtPvsNfuZVA9ddWH2mcDA+B7KrmC/t2KnhVbr4mIPiYiqAUfjyDw2Lf/mRy8HajgGpBmuH8s+ky+pI5lY/hs2ipyuM+rNrtft34OHhknAbCNuP8nA1QGsWtpCH3QYn3SwYZKm+Ix7V+aC1lHPAZbT0a441O4TaI/L2uqu1+Y/JqUSvsoeSDG8d1BkhFOGKFr8DKkTb/xeUNoeDrodfDaW5u3s3wUEAaiovbKjo7zpYvw0RLth70brXUK+ZMZ2dOX5Yf2r+PT7bp532/3aVCpxK1/A6YdYL3fadcu2L1M3CNrxfkyPaVi/85k/PsyYRE+56/QvZk4pdEswhjVCCVmOkHqT4MPPKgh/dmyNoEzduN363pdgKgIsbL4CewqzvUZamD47tgCEA6t2KM0EE8A/kL+w3k6dl6cPatXdFv0UVpplXRJy/8DomZsEK/tQoVgEXC40gU2G8UD1rw6arZzhviA0zA8oLytgj80sHemBtaz2S0UmYLGoUFT7FqmZf03gYvwm+GtWbUGLaT4LFla26LKmSFJ1lbgGuWF+XKOdzit5fKTHbfdttd6WraKmfCam8niBKR63t0+pokZqjDX4xAHXpU23yhL3+qnIdA1gNwCDP7+eMLeTrPIsOXKZUfVP3FtFliB8Qj7k1Rf6emdDcE6jnrpWAj2PIuoc6slLjTamxRtwvxk6P0jd7md5Mtj4KEKu77LHC0sWdgzw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ZSXe+LASN3Cv/QXoRevopDwggxx2hxZRXy2XbCnsI8Z96wBF1ZfdYQy5bsA7k0BZB5gdrmrHOa7tKfAACbVNZJDap9kNInjZnJSPZBiRu8mpzfNd1tOuehroEf22qOdQ8x55to47ESEWlXS2ysFB5aFF+HfTorqqi1Djp1IhMIaELCk4n69zE7upwknSvfuTarSc73FZuFKrni7K6prou/uaC5N5Ebqn/OnEwK9Yrhx+o2sE2uJWynCjJgpAgHowzgqPRarX89GghYFUm8Uwgip3q64ZDKZHgm9NYRpT1wdYELpWutXVuBReaalPmwcHgy+/jrCCRg83ab/R+5c2P//TXbzm2JLzBJ2dpHs6TiR59vqGCF409VaB/Eb6MFu+UZJRnhLnrg40YAGJRT5to+Ldee0cnOOywyLcxQxw1PKozpGGqA4OwFjX2xNTHNI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:42.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489e09b1-b6a3-404e-c4c5-08de7ef07998
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

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
2.53.0


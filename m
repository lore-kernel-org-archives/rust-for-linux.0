Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828A402B9F
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955655; cv=fail; b=YjWYtz6wLNzGcsY24TrLSwqIOZlT57rwSv+ttUyAFW+RxuQQCeSezfqQ1HbEw8M82a1IhphY5W0Fv+3fWUiU66Us0yyAiT371cQyfQxGhMtlP8HolNePDWzm+cS/FoLPhLe6FFAamLa4Wood9jV4Z74H4lY7d3XZ9S+n9pOxefk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955655; c=relaxed/simple;
	bh=q584sUaWUT7wAbsEcBJpaWIXzO1TM22Y7a0XaO3tZU0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mz6pVyf2QSlF/b1xZwTIl+Lbp+hFD8gqdwTyS0wP1IT390C1iVAiUeS6nSneAClfmgwD4AWxz+cq4zvRINsGvZdV5TWCTePvHTEg1r478MO+2bIJe/1GgzRvytcQk298jAdwWwyaNcqqQ2lGrW17w4JCyof9AxTjGbMoZ3OlyK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hKYdXjDV; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hKYdXjDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irldDnBEVYvMNcsH2VqD24JSiEn9Jsi1WqyTERYJdKTFUTJ7B3vzMxxpQtNVu435n20peCQ+gC0nxlrmdBSYjJEymAZNk/u/1PsoT3dWjobAZ2BCXtsYo3EDiNHjTuKAmXGDIvUP+51Zh5wSEw8MrWrYZQDcZ6ZFcVAwkS3mjQqro0adwGyTxQ7qbbzYWAdnn0Qx5lTM8HvOkHrRJGACRp0gjeiLlFDvxoOZKTSVkc1Rlfaf+CRM4Y7AroNexMAVgAKJVM1IyptHxu67M8HQvDfdOmgeMbN42ocgm63dSMWrwQEUPGg4RewoxfCAcBszCT7RvKCEq/xxoncviF34ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kievE8rxzx8fwhIkF7c5J1Az/0ViO8RZ1nfzpIGIM70=;
 b=fvdud6e6U9absHJjEYYat9wZvY2MLwOJBa645NwJGR/apVFS/WY2LIN2c0TjUE9LHv+QH4e12RL2QlaEZtKVmxu0VYHm8YPcf/JjYMAvGDgEmbNUVlAUn1JpUwv5TT39dajyxQICz8bIqk5DXPDGWiGACoR8FUsn+SXd2UC9Hf5W9bxawYYg8zx+H1TVdDlY9h+ImypfO42bDZSFYVfH91rEFduHm+43Sr/oUZtxEhclbmVOlU1CZwklnYXQOEP6FhgeqpEal7RF+rQGrSfts+ZQj2HR7FUuX/Mn7Pl9Ah6eUZINZR8UOdoXZ91h69MSDhHgCA4gqjHhsUXt2VKxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kievE8rxzx8fwhIkF7c5J1Az/0ViO8RZ1nfzpIGIM70=;
 b=hKYdXjDVgU4DZP1o1Hrd2naAx9dDpPEOiUMFGsrFUzas8xGr1wBHwHfoGNBJk5+ue7JsY1oCzLVZVXIul0UCjXV+qh6+CHtj2l5ZMmnVKneoi7UyMqh4JzetmntiVdmkg5hGBWB+/8aBgpZFX9mC4vAVmL37/UdnZt/G5E/em96EbqLUnQxskUBkbr/t4IMM5iizxru2RJCcvgTDWHZAwVEm7qZKvvABxpb5fML+bVcKAgANu21zHvR8ki2bu2oxfZE0gevke+deNyJWJGi4tD6wzfKx3P2CQzZOy8GCXmTKgw3lK09feWp9jZZ2KoKjaXvzew8ll0XTlR/XTWVXKg==
Received: from DS7PR03CA0334.namprd03.prod.outlook.com (2603:10b6:8:55::11) by
 MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 21:27:28 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::17) by DS7PR03CA0334.outlook.office365.com
 (2603:10b6:8:55::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 21:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:13 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:12 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 4/6] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Thu, 19 Mar 2026 16:26:56 -0500
Message-ID: <20260319212658.2541610-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319212658.2541610-1-ttabi@nvidia.com>
References: <20260319212658.2541610-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MW4PR12MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ea1047-bb62-4620-1016-08de85fe5226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	1SDGUBxCNsQQQshA0qQo75d5uvIJEY7clXHGmeJVPcwr7noTPQda32xnFnWrQxfSxGhDJyHR7J7YEm99pb03BPxE3sVJAbIBKDxjDegLWRYNelNG+0puBh7MowL6hK4rCdTbER0e6LjCpKtab/0cv+gxRKJsue0chIsjZW/UgEyNXfRBIvzn0G/oeehk0jkEGhmBCIa0JiWVrbi8qhLFxTDlpt3jiuxL01rzgLBMcc+EzvABMLYByCKlrtraQ7Mtj8Kwpqy/0DGstButpKzgx3gFwFWzSXCyeqUy1lvuzKgi6+HqFsdPGk7hXNIjUy+ljD/iFZxysd9Q7t0yNjRxeivXE40KAJgE86xQthLHNI75rJhhLzIJheesXsZzPqlKK3y1D4/1IbBw59uPFodxr1EXNm9pDxWU7aHPFuo7d9EQcSZLW6v+ZRutcSTjsNhC/BiDtmhmhGYuTJTjuD4XEdrXDCE7lHVLe5KHg9DexanzkZZOhN9sJhX2fzAmKuQuZhuGW6lYErE0qUVkc+NlvJ01hw3tjPIIaAKtl+D2nIU0maypea4E59PEzBOPq7jJCe8AuUO2AfXxCkR6TPXX1S1bVZ2bVp5GNBlElHQSrvMvMqA81x33hOHUDdmLZ1nAWPPq+ydHGQx+gNI6CTKUSMSATsZm/cRIwqxkrGVNIpQ/AHk6J/1RQdGv2363z7WxnBsSw2nc9IHRga8Gdt71IAsU575c6LPtRVqdV/cKjhzgNOMHjGT8xx5rCpWu//bKKx5kmbN7rVF+nawqpGY7eSq0gShPVX3vUyAcO38+5gojyiIV7Hv+ZBwRl0C9i8XU
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6CZTxANPOaHw2FB/PH4g4zUzAJf3FVT55WyfG9fawA14OlVTGnbu+aYTxihyl4dPrE5c+ajGrnkjI+Jz0dBRIFllFdNb8EeuNZr/1quo32PGwz8pZsXmk+SjcC6guUCvMPi4tZcjPrQywaPjjegVZQv7MHa2iidr7wrTzOPiisCanDD4u+/SPljvTIqcZINpX5HrI3hdIpLSpvVom99pyzQo+gsIifADmWZvtB+UQ1+fYgPFTQm37aA8yQln01HPJv94lb5UakFYtFJvrZMEiSGkk/0vXaH6Ro8cv4P8q+HsWbizdwQa0fopgsQvZV9H/iDHNarble7Y2z/r+zdgwCJB9mZ/lHXUETKwkQsI77tw/zQY5XkRP14tnev+GtEfV67XnbhnRPfMnB/573hprcM8PwSJ5D6rNkKNUMHafSY7279acVrAJMHMCnnQZel1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:27.8158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ea1047-bb62-4620-1016-08de85fe5226
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
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


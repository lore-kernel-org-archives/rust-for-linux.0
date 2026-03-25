Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4692EB84E;
	Wed, 25 Mar 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410789; cv=fail; b=Z3QPO8+8eBUDjSX+dOxtjVyy8mFYl7jXJtgzGLhoeiEjuq13FsMO3AsG/4VwndOEDYAFRjMhPSUWqbr/wDuJEgoYnTutj6zCh1QwcxGfxkjiUO6J3upFkK9BPmJYeCCMYRDXp9NjYlGYXKDO+73XVpADnoW75RaQdJ0cv9j0x7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410789; c=relaxed/simple;
	bh=+G12Q+p/JBpfHCbQhFCgedbc1ER5Wuv9ZR/Krob1dL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jHP/Dv0joAkrEWwGGObkCAPteEu0EGRz6NAMNmdHIMPxNMFdjJypqTo87Oqy3ciCT8vs1LH2qnyFbdMBcz/oqwWgdIP+utCt3sLSTev1Tkqo8tPoQHHIpnqEnlbNhz2SbsobygknrG2nnM+fX6zc5c/Y8I+gpr13QiWBInF+EiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kQ6QAJuo; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kQ6QAJuo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bf9R/0YeabVK1nItjnGWT0LcsbZoEHmbJ1riOaJplgVD5OOyF/dzOjLzEOrGkuaK/Yfv54mLtLre3OUugXfOTfDyvyiJ9gWBNBimg3DolSS6AISrhoca71T5+J+ZJetfPlYF5m712YG+GErSB7K2eSOuQsrpZbYvzHXBPeT5H4Ymi5e4xvfl1IeZV1FQwPRMmwZyVAeCPXLrmL4TyrOq3c1yLruAgZMevtfnt/It8XJDIkd81Mpu2ZIIil7Pox/cHjeZaY+F5YapfQ2B5ZnqfVl3qXrFkLj3rIDHDtDOkpENKYjFxkUXRR92EyhB1RJnyYZHzVig29V3CJkQ+PSnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OU9shpUDWicS5NxxKmHDBs5Cqtj+W/rPKDpf5TFtpY=;
 b=G/uc5AHhT1uE/cahJ/KeZgz76o02sWvKstRjZy1X+TQSSzuPgP7GDh32vuWwGFbIpq95IE33sGaIEUW58npuCMHYqZUeLiyI58NA07fFsYjlWp2E9wIng7gNlGYNgnu9nxVIWDyPoYkBep9eVbe73pLpQIQEYOly0CWuTsMOhof4EgTxVwLwsPdUKwOjJlne737EFm+jsJM0NXMkjLw7BOT0rT5xaTbAy0HBQGw8hRNdMEplFmB8YnGZ23RXIu2jZWbpErWAHlf6OxcYnE6BaVY4XTFAtn0p9VhvoYNGq9S37C40db1SP+kPaB79P0I9eSxRwwVK7cTfARpYup0v3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OU9shpUDWicS5NxxKmHDBs5Cqtj+W/rPKDpf5TFtpY=;
 b=kQ6QAJuo/KPUmBMp3QK0Q51k5N1MWNAk4j3nL0/6q3crOPlo5hcSOydmlD5rtSx+I0Kd6ddm+0YMtZEbIOzLE3cylO6bQGpkQmy+8PHKEBXM6GBSdWE/YrI6lkKYvpfDnR0P3hPNTUVxkg1/iQg0rHFeKHGmwzWor3FefhM2Dd0lE2ay+Uvg0YLg7rzm+RMlWDWNgL0VDYPFfFmsLhIzIKvaX7DjUzhggJThexnlu8GPJ2lbENbv/uMJOEgLl6qmCBgjstEhV8VsIY0aqYfFZLP4XFVAmbWfplk0XLNgEr24CBkgTKsmVoZd6roF50utnSawBSg5S1n/5gM2KvhtPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:01 +0000
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
Subject: [PATCH v8 13/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Tue, 24 Mar 2026 20:52:24 -0700
Message-ID: <20260325035242.368661-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: af251fa9-5e9b-4dcc-f8b2-08de8a22029a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v1IrDQn5VaUL4E94WWOedtYHhfyFGs/mOXUhQJQw6vW82ucFyu8rnb18ksu7uCLW8txwVy+0RP0XXRzpYPYh7HLv1O9Cua/8DB4LAA/SA5gBa5zfTBa7cRkB0a1Y6GJ/D0sAr0yVllY8dFAKnJvR55Bh+ai2+uSHdFTtbcSFZ2wBc609UJeuUNVttNA8hkCCzcalqmNC+dqxcJN5KygjZc02mpRV/WwcV2tkLYLCiAqlDRZQrdVOrq4SQf8lcKjAmMK3ew9bi8rd14UwPerR5ywhCcEtk0bzekqeWY3MqjznS0ht7alwj18iFSl+sY8aLUmvx0DT/g+xTHr5c4rVP1UknN+XPfDt3JjsgIzFjxucbxGTKNQs95STrzOxjrU4B1LMlg9PJCiMpdckLKc9rflI2QAuF5a6bFaVFEII6iDBr5X4ShDq5IBviQmfqnPAt+KGeHXlGXoChd4hNGr5qAxlksu6ACaUiZtVDohiImjUUZ44ZOUXklrfi5sKp4BFPuLZF8ud6WUARG/lHWC0ACEnEivpyMiCNsa/5mP/WrugJanM7GrGbkux0gSpUyLo4e5B8e8LjPE8kpSpJqEk+gXYkzFa/CykNYQnGI5XnWL+O8fpSxpO3nEZivF4HPBt8jCqCBTXdrqq4R6FO+ExRIeGcyZjEEYWJZ/L48Cn2phOxdDNw6sKklpZKesFGurswvdFOnrxbtGaXE6IPo7XFHkW+LHOGyJPv2Em/iOFHZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bz8CxwfTGKXedpkQEFe8Kn39KfEtaRyxY4ry2wbgW2OB1+kzr/OalB6fIHnh?=
 =?us-ascii?Q?kxNIWBP+UBZFiNcWIwSy3bfViIHV2FE+1+xxEnfsU76Qty0OvL1HQc4BfZTz?=
 =?us-ascii?Q?itE4I77k+dr4Dg9ZrsrZjdxV7wFJMjf/84Rx3iHY4vNimjZmVhlbcZ3/HM92?=
 =?us-ascii?Q?OSPe/UnRGrMaPg9RI269+a/at28qjlMNlc0nrXCdB4HfYLSu9Cw7y0fBnazP?=
 =?us-ascii?Q?YV9EoCSYXGjjPxcfVkEEZPHVnv1G5li5XHvv+Akw3ehXFvidB2dx22OlNQKw?=
 =?us-ascii?Q?U/omMr6ejw1fj1UXQig1Rtk+d0xlU1JSfDA2SBpkFHuIBUkg1BF6QGtsWO5l?=
 =?us-ascii?Q?34kO3qBFqgETpvsiBa50qRD68owty3RYrZyhF6kx5yKCnVfiwxYDEQ6Uodhd?=
 =?us-ascii?Q?1Mp8LDgRYNYUD40SXqkNF6Ie9pStPb2h/+HFedhjK0deMeS9o0dkzx8sGitd?=
 =?us-ascii?Q?LRxQd3uLLbfqWlj01sOagdUSnWTOiwDwg8DC0hlieNfOxFJfejQ+juqt2vyN?=
 =?us-ascii?Q?2hEfABnWpLuBS2Poy2JrcL5UpouzerdHsP5ypE6azS1TCEXvg6pLC7kJ2l1W?=
 =?us-ascii?Q?UaE5e7iiUQWObv9vMX2iFaYLMZLtbe+yWUa8uLJait6KeCM3EUYW6shHSwiS?=
 =?us-ascii?Q?ucIG6f+bJ5SgDXYyd6o+R9pBcYuRXMIjkmv6NhAYylkFcINZx79Zr5an8+uH?=
 =?us-ascii?Q?4ffo2/MX9/YdTQLuq4JSX6GdoypOnBgsfKlmDky4Dfraz5IVlq3/hLvGMgnF?=
 =?us-ascii?Q?MtXG7HRR5+ia2WWmFzMP7pLvvfxKpeOZNcWjPSSK8D23w2qS3hJgVZ610g9L?=
 =?us-ascii?Q?+bmLNHXCEyPHYYSFh0xaQMe4TPN/ZKq1Z35oi+y5+cyJ3kZYKtMSZb3GmZsn?=
 =?us-ascii?Q?B1hNnbmsWFzv+tqHztmM5OZpS2vRvB200HdTAw53raaSQTZ3faAz6OQk5Vkk?=
 =?us-ascii?Q?u1AoSa5flvcMxetABYq69VS/s3dBlrGUnZqaWRRYQSp7t9w+tJyVXoYoULxy?=
 =?us-ascii?Q?A1d4q4qp1TfCdVAPacrH3Z14BNIcyRhg0iaFpauwWGu0YRU+gMbvqZYtUxBd?=
 =?us-ascii?Q?UUHosVKjRoLkpKdvXDJSQ3mSfQiAhyBMNisZ5xGSNLduDgHFhtb+1LCtDCjt?=
 =?us-ascii?Q?nfvX1QqbDTIo2AHJnIyjCg1Lqq8JFYOMPt8YE3GwT/Z7x2iu0RVWb3pT06Rk?=
 =?us-ascii?Q?bAX2gT5HrZ6W8c/IXKme7N2kfJHJVcpV98bk1fOVAzmirN9C2Bj0JmOv88RX?=
 =?us-ascii?Q?nRE8XbUGEU6Di4Bv5KTjLWBlt4EnfSiqFD1H3eNB7XWVZ78VsIRcx+0h8PGV?=
 =?us-ascii?Q?yf+7vUzrTkgAzRsOD8Mg8hQiLfYqpO84JmQgYPj3G/kU8uiR3/AsUiuG8fXC?=
 =?us-ascii?Q?q0M6YpGNqLV4avdObFmG/GUymeStK4lCK8vaT+sVoerEDOcwFQVeWA2QwODl?=
 =?us-ascii?Q?5lUR8v2XdY3KofqFx6Wxd4T9EswpXtbdNKBn/A4KtsJC4Wj9cNANjKvBtSCT?=
 =?us-ascii?Q?wD6AivLkmiTb6aayZpyV1Top5fvhzFqTRFw93jtkXTJ4JdqaILoqD9LHF1Ym?=
 =?us-ascii?Q?UtGkr3KwKhNdeXBPAeBSNZeI5mknwZGKu5DdimWLUuyYgvUn9e+6FPPqH/WX?=
 =?us-ascii?Q?wUk/4ioXuw3M/RJQg54Smrck4iG/0xMowAEQ6bUjlQ/Mfr6aPGCQziIGYhES?=
 =?us-ascii?Q?JMVxpdIR1Jf10wYsAR2dmENSUnIWAPukCHxOOU1/YJ5ID/G+xDhrGt5Aj5N0?=
 =?us-ascii?Q?wmJmczJPFA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af251fa9-5e9b-4dcc-f8b2-08de8a22029a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:01.2088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1dw1AI4+WcovMm4KTnsV029daguFQ0yHC5NBgOoajeahQxDsj6EU9BjA69jDw5+Nu+qQxkhkvQpFPuUiap1Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 5bf8da8760bf..8022075c55ed 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -32,6 +32,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..c5ba1c2412cd
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.53.0


Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D539FFD
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713424005; cv=fail; b=imkwNWyKhV/vGGewqvrwL/AC0xVP2PQNG/ZMRIAwtQIkQHqEwzW/rTZ12Ki+GwF/FNU6Bc/ty9dJWTJRQeu5qELc2GS1WfLJoZeDHJKRjWHwaZD/VnntSKWi/1VM2Rlj0nGe1SirYG4ZBW0BATHQrk0r/STj7//BTJYPl2rLlxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713424005; c=relaxed/simple;
	bh=hOYnEOC4M9Bpo+DjoC7UXNoi7+b9yhcvmMVJAw9b03Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nhlfaf27FGTezQ/Qdp7LTM02BY8XFhXoi80c45pnFrO9lr+S4lhPxUDujVS8rE1lmPybbObWMTWIh6cjLodkKXTmF+TeEl5nykSiR7ra0jq0j4HOeXOFPUNMokHqDSMjkV3JdXDQ8DenDL29wAC/kcl13r50X8oSs1FCLDUBymk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=bx+UNmuR; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="bx+UNmuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmzPZY0jl+Ru4NGqhdrICIIyrIlNvgW5cr++kheheWo3+rQvYEwe8UD4UiWQnK/M0k5gmqIzFBrmMZFdzc/wiHo2kDkBo6YAZ6D6xtl03nZtBlHaDiUUQAA2IDCzrj++wjgQ4y5kVbnl7ieYUclvnAUz/DjlPbz7+U5/UJ0LtIrWSluoVxMixQ+uxeR4/y0etITMScRIKYNGwYPfMZ6fhoto1FsNIarBH9I3ORbRlAYo5OhYBZ3zIBL+dZlweJnZ7s57WAxrqcgp4GG+rG1BIbmKFHlY/ZEzndczsfjB88eAqJjET1wk7GwXlNN9Z1FegW9HsllfuONLd2CourB5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqpfmJ/3PODEUpa3tYAlsrKKL8gEg6pikoNZdG7YFQA=;
 b=TNlo9VxGo/cmaU1KsKJKQm/22yq/92zlbpoBRcHuSwPzk5xlS2VeJHx0mflz/1leCsVZQ3zIGrBvYueWbejx5TmcvPjONeCJEAOHF949UlB+Ze3AJDgBZzAdATrPpsy3SLyMkK3Z4qF6ERhZFfB/sqRFUni/IvZSvvEnTQVxXFm7/v0vpXf0IVUb4aXSRB40LmaoA5AGKUS2/YP0ERn0gbgO4T4sLPVAhihqPoPvM5omvdqc+zzcrogOrMJDZp5VZHEf1seRz5J0roMNBB2xd7Y+hKEyY0Af47xRWGpbLgGUKklK8jDJ1tprJKMQXiJrfGnOyPFcSLRdP1K9flPnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqpfmJ/3PODEUpa3tYAlsrKKL8gEg6pikoNZdG7YFQA=;
 b=bx+UNmuR26lTGnUMESkBJQh/vFtmF3XqBTYiP2B1kK9zDzVBrnTjK3vJ8692inZH3FRlm0vCuUH+fRZwZ5wl15MCkBqdanpxsSvE6cwEkeU/KdOXnA4QcW+KFDIqNL/Ebe67An+vkKrnp8oCSa/IgyR4etVjO+T3T/ebfgOjLaKmkKi65ZPS4vWTXwnh/vUVVOchoSRYiMQBm6aeM7Rmy8SH9WfdvmEEoIq0lF02BC0ITCOBL3+yv0O5jHnTzPSPs7vJRA66UTZRUuZUxVNRsL2jLJqgDtc7z2F7FLwDH2w8WR2t107NVqGHae24MNRjGRLmNmDnuzBkpM0i2FieZQ==
Received: from DB9PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:1d9::12)
 by AS8PR10MB7706.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.40; Thu, 18 Apr
 2024 07:06:36 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::bd) by DB9PR02CA0007.outlook.office365.com
 (2603:10a6:10:1d9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Thu, 18 Apr 2024 07:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 07:06:36 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 09:06:26 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.37; Thu, 18 Apr 2024 09:06:26 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Valentin Obst
	<kernel@valentinobst.de>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v4] docs: rust: extend abstraction and binding documentation
Date: Thu, 18 Apr 2024 09:06:18 +0200
Message-ID: <20240418070618.3962736-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|AS8PR10MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 821d38b8-26d1-4377-8c66-08dc5f761671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UM18r5Mh6mknYnEYjmYwZnnM0eaDhyJ86IulAh0zSHLdjMmI7FH5bmj3Rjx7TMEcORzDqoIwg/ro2rbDHheeTesyqpsBY3ftiD9euqMvC2oShJFBjTIwMhddlgCWh3u6Pb94zeULYLZAqEEepiJTaF+bnqxdkUTx764SLv/BcBASvKj2IBiA5tN7QGVTA5l1Ja7pDf8jfDtgj5RL3KXP9it6+OZ4wo/EnqcVikXxl5Am6byEy+F+HrBUfr7FT6f6WPRzxKObsQC8D5dv4SJKF4/HFVbb7Bu+tJOGbrfWA9NLWF6EVm1XSiJO+qnotNFeElyIzf1zVaCeAhA37CPTFPhStbpxIvSaAekZ/5XFyDjE/wfg7l0j0WCEH/5vv1fQuj3ca5JobRsDLriR04VN1Vs3hPyKT/XjtOwE3UGvMYbgoGgwUxU0NhhyoOycIrCbXD/U0SpjiJeiB5606+kzP0bs14FpOHDsUlTurzHxbmN2/5AgjEge0xU5B9XWX6YFWu4FUzSUbMqJ1dMT9LYgswDnOxpXN4wQ5BJC2/ukNGFK+ifsbrcaJ28177N4qr4HLcbZkPWtMdtYhmPy54YOnTn1yrskXNQsL6jCx01tBruwfmnQoGCFtwy8/erceaMU3nLkv4BtJG9I0YGpL/gBggx5vxellm2lpSSHKdsYKtzzLM45vq/FGiEkwo6rTvrHZr5R+AxoH7DBbFDiOV9mHOELeKYxHNKomFgEL2KxJ1hrrdGlZIXqW8oot+LMUMOW
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 07:06:36.5993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 821d38b8-26d1-4377-8c66-08dc5f761671
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7706

Add some basics explained by Miguel in [1] to the documentation.
And connect it with some hints where this is implemented in the
kernel.

[1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstractions-and-drivers

Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

Changes in v4: Rebase against rust-dev v6.9-rc1 to re-start this topic. If
               the reviewers are too busy and its not a good time for it
               just let me know :)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7e..6c6fb3a5e318 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -64,6 +64,62 @@ but it is intended that coverage is expanded as time goes on. "Leaf" modules
 (e.g. drivers) should not use the C bindings directly. Instead, subsystems
 should provide as-safe-as-possible abstractions as needed.
 
+.. code-block::
+
+	                                                rust/bindings/
+                                                       (rust/helpers.c)
+
+                                                          include/ -----+ <-+
+                                                                        |   |
+         drivers/              rust/kernel/              +----------+ <-+   |
+           fs/                                           | bindgen  |       |
+          .../            +-------------------+          +----------+ --+   |
+                          |    Abstractions   |                         |   |
+       +---------+        | +------+ +------+ |          +----------+   |   |
+       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-+   |
+       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |       |
+       +---------+        | |system| |system| |          | bindings | <-----+
+            |             | +------+ +------+ |          |  crate   |       |
+            |             |   kernel crate    |          +----------+       |
+            |             +-------------------+                             |
+            |                                                               |
+            +------------------# FORBIDDEN #--------------------------------+
+
+The main idea is to encapsulate all direct interaction with the kernel's C APIs
+into carefully reviewed and documented abstractions. These are then considered to
+be sound. The goal is that users of these abstractions ("my_foo driver") cannot
+introduce undefined behavior (UB) as long as:
+
+#. the abstractions are correct.
+#. they don't use ``unsafe{..}``. Or they uphold the preconditions of all unsafe
+   operations that they perform if they use ``unsafe{..}`` for performance optimizations
+   or to call unsafe abstractions.
+
+Bindings
+~~~~~~~~
+
+By including a C header from ``include/`` into ``rust/bindings/bindings_helper.h``
+the ``bindgen`` tool will auto-generate the bindings for the included subsystem.
+After building, see the ``*_generated.rs`` output files in the ``rust/bindings/``
+directory.
+
+For parts of the C header that ``bindgen`` doesn't auto generate, e.g. C ``inline``
+functions or macros, it is acceptable to add a small wrapper function
+to ``rust/helpers.c`` to make it available for the Rust side as well.
+
+Abstractions
+~~~~~~~~~~~~
+
+Abstractions are the layer between the bindings and the in-kernel users. They are
+located in ``rust/kernel/`` and their role is to encapsulate the unsafe access
+to the bindings into an as-safe-as-possible API that they expose to their users.
+Users of the abstractions include things like drivers or file systems written in Rust.
+
+Besides the safety aspect, the abstractions are supposed to be "ergonomic", in the
+sense that they turn the C interfaces into "idiomatic" Rust code. Basic examples are
+to turn the C resource acquisition and release into Rust constructors and destructors
+or C integer error codes into Rust's ``Result``.
+
 
 Conditional compilation
 -----------------------
-- 
2.28.0


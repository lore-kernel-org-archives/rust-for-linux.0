Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2041.outbound.protection.outlook.com [40.107.6.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32228657B7
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707462363; cv=fail; b=BaZzD3Uq8rP008tPSQUQXMqS7UaZNnhHS5cNiVy2XpUHRghUxKpdZcOy73vpbLLuduHJd6snZIPG4lf3hrZXJ3hpE27gEEk3QUiMf93BssVENcdLgUtDhC0YkFNmkacSzIdhhChTgTtM1slKYMY6CSADe3kdv8sxCUnhwmDscyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707462363; c=relaxed/simple;
	bh=3P9SJ+BUedDiserjNziHlwdMFByerSiODcgcnZZfJEI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SLVjwrOw2DvsYL4X+IV54boj/3ZlUZWBETSzWawGHvoUDGo5LYTNtMi5dxYEdy+MkLXBrkPk5fn9JiXC4pMAuWchcTqupcv5Bd8bNM7Umd0uaEXZ81h2gaBaBVI9gTzqBNVim1uyd8gp/uBAnxBL3fvfgA2+yd9EUYQNTgbchGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=sDDLfB5K; arc=fail smtp.client-ip=40.107.6.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="sDDLfB5K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DukDIEBWRtjISHd4Mdh+tpG92abcpHpMu+eAUSLd3eBC89if1vPc/I2PlsM69FbWpmzHEVZsiRyxBE8CZtTGzvhcD3ADdWt17mkDS4eHkhiQ7gIGqz34tAyhUj00AXMnF6dWUB0WD6/F2ii+pW/5rrxlGcJ4RhwC3NcIBKMZuhIIEF65O4jtL6tw5+9hZs0SgflyK60ethekLi+L05FoOpHHBLm7KFJL1WLT3XB7YSCBm0K1Szd/dmwhBU72BfWYHiXxV6BkAqJtyzTxDErqY+dOTJiUqjSnkI723/ngfAbeQ7qVkMd07rupEdWe5HJCIsuX5tCxtmq+hrMx/DxBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xc//70ytoKfQxjmi9YNeBQhrfhjP33FEVWf3/OQguTw=;
 b=BXk+X+31XLMDAVZ9rSuanzvOwCpmDE6Zivl2UCDVl3jJpkIr+GhheVZurnAGKhhVZVTCatpUn5o2EA/GwH3Kpr+lUQEI/EO7WyuAoU1tfFBX7aRh+EjFnFmGmf/nRVVohYl5wc9XCX/Gg0KJJenXNJVzSCNJkh4GxTIzjuAR/Y6/DQd0h+caIXbSVjMsJDTkv7L+WmrGaO9HlHPNpvy0zZaPRPq95mMxl1ZcxODxK9g1/2pdAtsr4fh0DICEvOSiZZ9DPtGrt15uhh/ZP5JYPqmIB6rBpOAKOOsPLm5QTYNTd+a3Zh+g4WQoKPOW27AHYcdXhPcKnsMDt4xCHQN1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc//70ytoKfQxjmi9YNeBQhrfhjP33FEVWf3/OQguTw=;
 b=sDDLfB5K+ENx0QEx4XzAHoqexXbgG+B8tnbG8QkV1KHdtCZUImXnY/947+R5rMfLIhT98361xZjxcOfEr2exJFet/SAY1NyXjJMTT51GMYGATdXZ8hO5DVSpEpM45CP5EnLmVdBqYby7Ly4tEVhs0XRs6NUJTjNRE9T1nnwPFGiP7+Q1YupDwMAR50292iTkdsLx8LPjoGTLb+4DXcQXdqxwEov1rG8PWFgOQRA/um3h+aYbEpAIuxJnSUPOKh13U8biIiNUmPXBUe8Iw6xKRjOh0ev1MFlxfl3deA5QOk4PnY46a+gyQKGEswbGkD5+sBnA+aBQaoXuLyoE6mUaHg==
Received: from DU2PR04CA0341.eurprd04.prod.outlook.com (2603:10a6:10:2b4::30)
 by PRAPR10MB5398.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:292::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Fri, 9 Feb
 2024 07:05:57 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::9) by DU2PR04CA0341.outlook.office365.com
 (2603:10a6:10:2b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Fri, 9 Feb 2024 07:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 9 Feb 2024 07:05:57 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 9 Feb
 2024 08:05:56 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 08:05:56 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Valentin Obst
	<kernel@valentinobst.de>, Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH v2] docs: rust: extend abstraction and binding documentation
Date: Fri, 9 Feb 2024 08:05:48 +0100
Message-ID: <20240209070548.3693410-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|PRAPR10MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: 512cd4fc-4675-4abc-cc03-08dc293d909b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BRhCD5ACwPsZWVGNCbU9R8EPS3yPoIoOeILvBtjTi3ewM6r7btZMqo+gctmioS6zJ700CKssuHdk3jYPOVYYFzn69kWG/7LsDcAocEmUGp8l0b8MOJrGDG5Hpg077cRt6PHy3z5soeYBNiYWaZtWUXphOi7qwxPDjjwXBv7G9nd/wANVGQLNysUV13husRjzRehitCD4UlIz2Baib1P1SPlKdCKvxYj54B8f9mOhzJ9Q5i2kTkiVZFdMVeiL4J+aolUoFAf3Bg+g1exWU48Io4mPqBdJWkYozP7C67oy5ZF0YNETao1l90dKZn8WWNzedje3VCbKUEgcywzRJSrQ9zGQjh8Sv+XkrA7FMXvDm69q673GRX8W4TELkudov5qMd7oxXQchnLNsVQaY9pZOzB6EUz/7A/SxQEFGwAeYk69qS5Cy+/F8UMY4fdqvinLrHhH8LyjphMe5e5i2cP3884pnRmxG4DQqZEvO8Aa5w0guOVnku2Cjao3VsZHUDN+0O0LhbvnrY4tNJHkOr+BdY6R/p0r6Ht9WoPoBhfxPDF0G+RywbuNGJV92k0FUPVmo/fzpNoZcUvPteprz1e8kXhnfsgVa9gv7MVhBz6+imf8Om/RT4wmX6hU0uAiG3bOJcoqZqRvtXj05ZZ/RqPqcjg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(82310400011)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(41300700001)(478600001)(6666004)(7696005)(966005)(70206006)(70586007)(5660300002)(336012)(26005)(2616005)(2906002)(426003)(44832011)(1076003)(16526019)(83380400001)(82740400003)(6916009)(316002)(8936002)(54906003)(8676002)(86362001)(356005)(81166007)(4326008)(82960400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 07:05:57.4703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512cd4fc-4675-4abc-cc03-08dc293d909b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5398

Add some basics explained by Miguel in [1] to the documentation.
And connect it with some hints where this is implemented in the
kernel.

[1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstractions-and-drivers

Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v2: Try to incorporate the v1 comments from Valentin and Miguel.

 Documentation/rust/general-information.rst | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7e..91a5a69c7c74 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -64,6 +64,54 @@ but it is intended that coverage is expanded as time goes on. "Leaf" modules
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
+The main idea is to encapsulate all unsafe handling in carefully reviewed
+and documented abstractions. These are then considered to be sound. With this model
+it is ensured that users of the abstractions ("my_foo driver") can't do anything
+unsound if
+
+#. the abstractions are sound
+#. they don't use ``unsafe()``
+
+Bindings
+~~~~~~~~
+
+By including a C header from ``include/`` into ``rust/bindings/bindings_helper.h``
+the ``bindgen`` tool will auto-generate the bindings for the included subsystem.
+See the ``*_generated.rs`` output files in the ``rust/bindings/`` directory.
+
+For parts of the C header ``bindgen`` doesn't auto generate, e.g. C ``inline``
+functions or macros, there is the option to add a small wrapper function
+to ``rust/helpers.c`` to make it available for the Rust side as well.
+
+Abstractions
+~~~~~~~~~~~~
+
+Abstractions are the layer between the bindings and the in-kernel users. For example
+the drivers or file systems written in Rust. They are located in ``rust/kernel/``
+and their role is to encapsulate the unsafe access to the bindings into a safe API
+that they expose to their users.
+
 
 Conditional compilation
 -----------------------
-- 
2.28.0


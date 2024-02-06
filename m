Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2068.outbound.protection.outlook.com [40.107.6.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28C83CB1
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707202488; cv=fail; b=FqYfEMWekOliS+dQO1PrJg/dfpBsCUyLdksvSrJesjs4RPrA4iobJYRu998QBerLmOqg1DEnlUUG554Q1gmqbMciq0qp8OY8Zp1MxjwNvzWhLjPqUkku10OiJC4+ngRNFoxJ/c+oLP9KSmJLd3QEquRmhkAmEnTZD3+cCP1nhKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707202488; c=relaxed/simple;
	bh=Sec6kbVWTXC0xY2CH973uQMjG6k0Cv0ZdJlgmF1IcrM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qas58+LMhl0bQmHhTJ4m2yohuD2yrEiOHKOJ+9/gRRk3fl6XsI6QHI/ZPzRX88HVB60G6kA+xifNs0he53zMiINzblj9ywd+bvQTZpymmHhXRcxkBEELVn1gfHCNmPZTHETzA6ir5cyUpGtDh+BAsmkXW0PgBykbTwRx8rcE8xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=N5d4TCzr; arc=fail smtp.client-ip=40.107.6.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="N5d4TCzr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBTQp3hzODECUMszZj8YdZIVTtEEZtlwd/W7QK2QJtd/iAi0EvI302oz4vas+J22Jk3LtAMqGBnKzOdSSDJK5EXZC9bppE1jaAMSDeOYb7wKlTc//ipSfG5uBuI99qPPJKQHUIyc4oeu+GYVWhd+7IUihSZ9q1ytHgo8elc3jfy/aJflDOVEJlzYiZle0YjqyKjnY6+P39skIJ8ZoZJpXGbqdmv80yle1OZADiOJ8nnz4lAPRK8JvZ+Wu2Yepr1nTKv0/IPWZGlZuP41DORN4jLYrKMEzK4yIoi32crGVFH6ic14Avf8RGSJ36n/KN71DVoFmkHYMnsH9eFtP5O6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zmio5Kti3CjET7eA4F0CgbA173Iz/xPDb8u9/OLVbA=;
 b=UJCrVyodrq1q5JyoOzy81baDWvp9dWyF8n4UF2+e/+7W4Uhc0Jqln/HJGzoMzzoMXG4rZzczblkNPNCaYGVIf2LfZW6lqDDuZdEev5xT7EEGS+9FJXq2FWgE9FMpKoE9JcdGNN/fzSnHROc8zHzOfEvWPpwyZrXaRBWMYTCTzDawh1RbyNzdlN/AxyNgXQl07789tCs/kvydcPYgh/+ulxGh7kYH+ZxxuPrDT/1Xsn9MlSfGsYB4n1VqvCU8rlQ9GYfXOJQO83vdycWMEtz0B8FsP4c1gah3ufYcJnxzS/WYsRxY6msKnBFnj6UwONCSA08EFAKMyOwsKFAr3yOJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zmio5Kti3CjET7eA4F0CgbA173Iz/xPDb8u9/OLVbA=;
 b=N5d4TCzrTLI8geHFAIFTdXyu1gb+KIy5414NUdZh8koVJ/GEEjM7/XZC1Pk8BrKRPrRLt4FcLA/xh2yzEDg0kShQhF0rwA0v2MDAyUS6lJx/pO330BJ96Ngkm7YrKz3THHWt4FTkHL+QpP7R/LiSF+I4idN0OKnF0+RxYpn4qNyP6jj2q7cP/UFfMEXw1D+6Gx7gM85Zv8dYzLQGGWmezyf42+esYmK2u5UuPlDM2YStahEJXMiABRPFp+ZqgqaQ2xufvBJtZ2Zi/YUSzAdno5VEOWQOr5FCc7BPD3TwSgPRXNSQWx8EbEbRegeKmlcqIvh8MwyK9HKc3NdKKfsjbw==
Received: from DB8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::33)
 by AM0PR10MB3634.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:152::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 06:54:42 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::ad) by DB8P191CA0023.outlook.office365.com
 (2603:10a6:10:130::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Tue, 6 Feb 2024 06:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 6 Feb 2024 06:54:42 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 6 Feb
 2024 07:54:41 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 07:54:41 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] docs: rust: extend abstraction and binding documentation
Date: Tue, 6 Feb 2024 07:54:29 +0100
Message-ID: <20240206065429.1933397-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|AM0PR10MB3634:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1ece28-bd52-46f4-1105-08dc26e07eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+M+8EWdoHC0Sjt32cc/8KaG0V/w1LWO8IvW0KoQBd62C954n2H1IEVqgzdpt90xuE9dAX2VPzDkMeaD7KBIA/98u0CDBlfA7WHGCG8fklVwm6hfgMmbqa033dQbQn/Q2lX/u1JgGqHwU+ZEFTBsSDJq9BVMzYFBA/4f1zFCKiwJVXo0rROK7yR2fRy/j5tXtRbfyrMLxDsQg6yRwJq4mbMJ5nzpT6JlKksF3svvgCnC3V6CoF3nKQlwOrOutcXU6bBB1k/q7eUtYVijn4sNt5lacY35gMQ0Yt6amZILI5eQXON8RoUpU5/Wu8e3k776Wy6a5MD89lSpUzrS80q4WZu1afh5i+AVBGAvttzbtXxStxwojUJUHxuhMKLYvJwWVwG5QANqfVbCH0Yfgk55R2VSeE8jseAaZSf/iICupE6CMvig20YfZFHg9nV3Ozk1o6PVU9tKY2dCthZwiiSryFr1MWeoCddA8krl3VPdIfjf1h5Sro9tfoOaE1h63tclbxa7Yr3FsoqXOcEMgMm9C2FVgbOCi4/AGsrd5laafgVZvlLl5G/44nkxoifgZ/HQ2bYdhN5QKilnUcDwON+al7QhKdzbjtvfbOYfIq4fhvYU0C9GZW4FfkG2jnAIYTdsOP536cyw7fjuvzldDKPOembr+4MT/9J1zl3cln7PtpsrTtyFiDE9c8Mk6K0Hg72lFMhECkKzCR0VfElJ/WMw5fmtuD1JDRPZXB0QvIeyOMkdIoCWtQRafbu8YPE2K/wKFfbzFkQ+Am6dGaSieT7yTLW6FBtSXUT10uIPryJGe5iboedA7kmN5EYheWQWb57ee
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(82960400001)(47076005)(82740400003)(81166007)(356005)(36860700001)(83380400001)(2616005)(16526019)(966005)(426003)(1076003)(26005)(86362001)(336012)(44832011)(7696005)(478600001)(6666004)(70586007)(70206006)(316002)(41300700001)(6916009)(54906003)(8676002)(4326008)(8936002)(5660300002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:54:42.3849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1ece28-bd52-46f4-1105-08dc26e07eff
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3634

Add some basics explained by Miguel in [1] to the documentation.
And connect it with some hints where this is implemented in the
kernel.

[1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstractions-and-drivers

CC: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7ea..616e2f2c09220 100644
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
+The main idea is to encapsulate all ``unsafe()`` handling in the abstractions reviewed
+and documented carefully. These are considered to be sound then. With this model
+it is assumed that users of the abstractions ("my_foo driver") can't do anything
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
+functions, there is the option to add a small wrapper function to ``rust/helpers.c``
+to make it available for the Rust side as well.
+
+Abstractions
+~~~~~~~~~~~~
+
+Abstractions are the glue layer between the bindings and the in-kernel users. E.g.
+the drivers or file systems written in Rust. They are located in ``rust/kernel/``
+and are supposed to make the ``unsafe()`` access to the bindings as-safe-as-possible
+for their users.
+
+Tutorial
+~~~~~~~~
+
+The webinar `Rust For Linux: Writing Safe Abstractions & Drivers`
+
+	https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstractions-and-drivers
+
+has an introduction to this topic.
 
 Conditional compilation
 -----------------------
-- 
2.28.0


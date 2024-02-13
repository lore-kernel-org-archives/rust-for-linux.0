Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5418021
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Feb 2024 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707813520; cv=fail; b=oGrzSvtCdp178HvGteXmd4t/YzsYGHZsa3o8f9+BNgaCmX82yd/Gnvk+fQ1w8ceU4JqkY4N2RxrAVZ0ZLkdXFL6LP2YHRthwH93KhvRRj/xFhW6JPfCycrZIeMpGrMrR0UcdbAsHO1a7AhnvGKqWj33RPn4bsRFW059WhjkNwkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707813520; c=relaxed/simple;
	bh=wYe42U5ndwRSfI073IXTIY6rjmscsoUaRIA6AFyXKPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sT0pLznxeJc6kMQnCrttsSEFexUSp4a34d1Y6KSKfJzIYxyYSnzjdj1pWY04fQteK0DePCDYw9J8JqwJRqaItWyWT97Lo+JNrpm8dUE5Y6wQHFzMXvhAE+Z3HosZzMplYygY/jOUUMg/IRO7gjDaxJSMvDdBoHhsffQ8/3j0qis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Ze6KD30i; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Ze6KD30i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0xVs5zm3+PYVCtcqudpHAbE/bzOUvZwjxGnFbzke9tVJDzfXb2yrZMrdDisnb6+qxCwEjRViaWOGXxvMN3J237+jllXgi4ji9A7X+42wxmL1+Oo75CdFGKJ5UrUIlLunnQrqL0zzyBoGvFYc8ZtwIDn/S4ystbC9SHlRcCpzgrhwFkKBBCSBO1QKgFUDAfZQHi4ljN8CZF5W4T82ARh/RjWamPnv5jzZP+epmAeuP5dxOo+GbqqNg3BWzJXVF2kD82bb0sANzaxM4yWJ5201Y8J2+zlz02VTbUduaeI3Jra7J35G58NPNWoojK+5Y1AJIU/H2+0dIdAqTbuB//2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jF4ZLsYRyf3VT4y3s2oxOJkgdK/gXXKDNNP8SDqgqHE=;
 b=SWCcNIPQTkHNhHGaDXJBmTUGHU14CN2Ub/d9UNKlIp7XV8cF/+C6hABmrOqnn2qzKkU9m/896TnbmWmsOoKgCDDM+TxvegP3Ac5on3VtfOSCMQ5s6L0R3KtQPXIqoWpC1v/hRJWuRnDR2RtCHIxhSWQCJ25sWK+k8lzUW0C2QP2FDOXUthRhbUdiD64vUmRt+ul6iXnPD3RykBSvk+Daaf/EfXgB5FeNh6txogRqAVqJwPAFmAtj1dhonvLyZsQTGCMNArmSOJF3qv2w2yiDFMxUzo+7B9UkyW6cjfeDYuIaG1+JU/ZdFVrUngSraU/MTpGWjcbo57VpUCc1PRm5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF4ZLsYRyf3VT4y3s2oxOJkgdK/gXXKDNNP8SDqgqHE=;
 b=Ze6KD30iHesiUduGo0O6Jqm+MOQRmc4/IKven4kSyWJqIsmP1wYzKGbCbwuA0+W3hRCnvKFwmjrEYDoLYwZtPdhyyz/NY5FUKzsz8TQ/LusiSydtk8KTZl/cYFvC2bLTuw97UKS4Yz2lEJDXcLvvN3rvK+KwmXBr5hnAqqsnBZg82RkQ6cLFcUejH2PlGLMd/Sxjhhc2xMSe4LllTvMF9mI5Pdvjp6JzbJc3gkEtucLjZftNcJ+G5mj8p6SjDshvmWtMPfoq+VCVtloEAfxsi6TiUFwnolZk1mJquP/+peivPQfm7HuvfTiRxYc0xGpSCkKQhs7wRd4VP8X3YrXvLQ==
Received: from AM5PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::17)
 by DB4PR10MB7447.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.28; Tue, 13 Feb
 2024 08:38:33 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::24) by AM5PR1001CA0004.outlook.office365.com
 (2603:10a6:206:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 08:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 08:38:33 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:38:31 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 09:38:31 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Valentin Obst
	<kernel@valentinobst.de>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v3] docs: rust: extend abstraction and binding documentation
Date: Tue, 13 Feb 2024 09:38:19 +0100
Message-ID: <20240213083819.1292958-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB4PR10MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5ca7f3-fcb5-417d-e611-08dc2c6f29f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xEmoTuO/oY3I7V9Fhyw1Yr/EIgZmW4qjE9jJRB/wT+fFdx62jzZs/HmxSpOQCZQBv2BrnB4tGcuXKQ26fQvXbuvtHsQtK8OcXW1dApMfxDXtb9qPtwstRnbDD0EenMmM88raOry4eX87xlB551Kqj1w0tF+q4GAoA5iuwsYXeFcr8jh3l516p3uD1lLlmgIsdESPUGHrXksBGrPTOg4EZZei51ufzf3tgu5BtxHGWZg3Zopp2YNRGutaIubFZueFnH/7+YROcP6BeSIVMxKXGpOY8ool19/JI4uqrkxwDeBQvtp5aKhPWklcL2s0Aw6tElPNnUZv6/0I+d2bCipqiUvRFizC5qgSe1spHisPyu9qsEwCE/tSZDa+PX3QXZTOYSBjzrOCBC/QXsb3SzUQoNljp16WzXE92RLIIesnuyEHtUti1PMCFmKIpiyCJmx0cYTkKm+gYz1vZOsLuS3s3PSYtgFmFZ++w3c+LyRYEKXkElfp/XOx1ChadfKswH1T1O/Urr1E3KOm9B08RGzpALXz1xor9SHzLnWiid1R+DFhyjrZxVjG8JCRNx7GCQPtu4QNCTT5RgVg3kTL/3tAixZioAfYAm2+nXgRxIRWahjCpi1JIJ1KMFgX4IA7HRSr
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(40470700004)(36840700001)(46966006)(316002)(478600001)(7696005)(966005)(54906003)(6666004)(8936002)(44832011)(5660300002)(2906002)(4326008)(6916009)(70206006)(70586007)(8676002)(86362001)(83380400001)(1076003)(82960400001)(81166007)(426003)(26005)(336012)(41300700001)(2616005)(82740400003)(356005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:38:33.5672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5ca7f3-fcb5-417d-e611-08dc2c6f29f3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7447

Add some basics explained by Miguel in [1] to the documentation.
And connect it with some hints where this is implemented in the
kernel.

[1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstractions-and-drivers

Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

Changes in v3: Try to incorporate the v2 review comments from Trevor
               and Valentin.

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


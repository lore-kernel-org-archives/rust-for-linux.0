Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2075.outbound.protection.outlook.com [40.107.241.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA67BB13
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718022237; cv=fail; b=PW8pJtGAvXoF+/DZ6mjMTlxEXEItXb6qjVjFNWPifzmeISwPE6+nbvwMuMyt/E3/phFmmc1hxWJFcGpcPzXX6i1fIDS/fuMv1v4uYbVFTSA3zmCT1KfT+0A66CYSCRFgQV9F0sjPMqtSaJOZOljC4srToht+j1tL9AK2WuIVoTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718022237; c=relaxed/simple;
	bh=Yj+hmTs1hfANEDf2ziTHui27zFKR5xgyx4VwAkxu1gc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pt/k8gd51bArQWIwvwslKVEvPavv1l+RZA7UT94sqoL3IKZzassAr7ORaZO6ndKC/OUoaGtxjDXCGz4qMevasOEjOFYkaxqh6ZCvNf9BHFjqykuBhhy751y65LHzek/jpL2VbTFSszwNdEpHcxtq977oMBKb+gELXdg8AP5YXA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=AvUejVtW; arc=fail smtp.client-ip=40.107.241.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AvUejVtW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNQIrFz/mr3gXp8u1y3XGHmcu4yPziejMA/h1ajBnjno46YldJl5GXMYtAcUKqZzme1/AwuiOa89KXkhjz27HDrrBEz+lRWX3hU+dtHuDV8XSAbFeojpY8jKpjCvaScgrSEcgj0ycwvGGwPHz9tmhd88t/VkFI6FeBCSPvNwYOKF4S3QU4Ug4VJN06yJtHLLAbdWrCfRiNPDpp/J4+X1nF14eHYOlXNdgcWmeeBoQStqmtZRRX4I7qMcpG/VbnBpn2p9VreX38YmeL0tTA7DPrcWM9k+y50BqpkvLsPlglMimeKCnypwGdK3qbFMOeT5OjxTqZgvf8SYh9W5pATOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOrw5+XdRVtlgM26z9HW8DJBaPUL+jfmsPy3fif8lRY=;
 b=EDP4ZHlTPT4diLFTETJDB3lD4mwunAz4ZZ/LPktd061kosvK97db3xqgvQW1kIEaKh638x5umQKqLTuOR5+75HAyqoT0vY1H9MLF15rx9okLShkPZSuqQNHHgcXTRbjGmfTv1taeO7M835YQO7lsgnOcExu8PjOyw2FBufavyZOwNJq9Mj3tcMx5+IswuQmTWa49vB2VfFMUEoPXsMIWnZP0Pz3yYwFOstUZVWcNxs9ueE7ekrYfvzQRnDuhJSLQAEartgap4rJd7L1UYzSYRc6AmKivl9ttZMnlr51meLZ8T5Z7qZmRkaC8uAXygvT+GWl9UscVbih97R1R43DiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOrw5+XdRVtlgM26z9HW8DJBaPUL+jfmsPy3fif8lRY=;
 b=AvUejVtW9tSrB4/xeAE3E9Z6eANH+yD6jwJYNcwBWpseHHIBPRAE1UQVulIfTlO6XZESO/cZPkyICAxolD3Kj7wlvsJyqTr2mqItUpEZN/H0s8geLPVwvYGLRS7xgMGjh4ddbWsmpt6tQZt+HjKJbHkcaehrZ6ElfonjapWOhfZprhboQjTUt6DDL9Vl8nCcd9hZEkPRSTf7MIdQ8mkdz0cU3hghTyzkIsu154wkiwbRqYnqJ5g74aTuniDxDu39bVcPiY9GKsyQ+bBVSKKjbFVsvhFytcah5uaODdB3Qo2FbHhJwDlWV2bEeoTud3FDsY86ZxZjn8K91GTyyfiy4g==
Received: from AS9PR06CA0618.eurprd06.prod.outlook.com (2603:10a6:20b:46e::29)
 by DB9PR10MB5426.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:335::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:23:50 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:46e:cafe::4e) by AS9PR06CA0618.outlook.office365.com
 (2603:10a6:20b:46e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.24 via Frontend
 Transport; Mon, 10 Jun 2024 12:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 12:23:50 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 10 Jun
 2024 14:23:40 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 14:23:39 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v2] docs: rust: no_std is used
Date: Mon, 10 Jun 2024 14:23:32 +0200
Message-ID: <20240610122332.3858571-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|DB9PR10MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: bca4c49a-df39-45d5-29f2-08dc89482f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JLXnAOoreyXD9XS0rzcvomdwMOzITyp4niz502cfi+o+F+4nlSUNH+NhC7b1?=
 =?us-ascii?Q?NqeK4VUzNqtbmFOUyDR2D2gZt2guQ0kTRXdRPfm8uDrdIaeD+2w4I3zAzz5g?=
 =?us-ascii?Q?p32d1km4scHsPvyrdUqRosaO7O6NoYyYBRk2ijXThTuiQ8ME87CmVaH7ikKG?=
 =?us-ascii?Q?o7/RZvQcdVb2UleN+DEgrBQg03LNZUEYpArDHpoygjkCWJrOb7txuBSq7YeG?=
 =?us-ascii?Q?2zHA2Nde/LeLrEsDGXg9n2BIbVVhTl4bz6ZyoM8sCl7zSKt38WjSCCGO1ISB?=
 =?us-ascii?Q?unn+Yi2HvwA5RD6sl7PkXLCryRLJC2UFCAtYMRyP68fv8rm59Wr+B3/j+L/2?=
 =?us-ascii?Q?pAL474IvGAHJBg5B54iUJaOCwxQqhQiJq2Ye8uPDdjg2KyJYeWNJ5Getan0N?=
 =?us-ascii?Q?rh0we44qiaaAk0Kne5y8oun27EatV26fSwK09cQInn8VbGDHd8Bp8e48gBQQ?=
 =?us-ascii?Q?qkwxeGiGdnrWQ6RH73LhrE9GamEdifFg0IKFXm3QfdAdUqDXWgO36X+K5WmH?=
 =?us-ascii?Q?Z9K9do5JWCnUYrt/xSQ0PNJbq6WOmOsoqiU/OsPxT/GnTnnM35mo/zuvXDVV?=
 =?us-ascii?Q?FkBKY76ZLXfCJV8LLyaWxuhjgsRfuVqDls6kXzk/2Rklvn7aSwLaN1KNi44L?=
 =?us-ascii?Q?G0BsyOdlr3vap1eiPNc5ecEuno3buTUw0HSXQI0mfcfXo5weViAMvdXbJhe7?=
 =?us-ascii?Q?Gvvt5df2YNqYFreFXo6WIxe7VFV0AGyfXSS9Jg6EbcjKxMUICOqzSD3ZNHRf?=
 =?us-ascii?Q?IJ/3oB28gD4FQ9ENZmy9KcLqJMsFUvPQN4lpPraxtlr1tbEUC2nPppab/Gl2?=
 =?us-ascii?Q?WdWo+lVvCVA/z/D0gTJ+U84QXDoOw11SlxXdKIugrCrd+qLUVE+geTWkiUP9?=
 =?us-ascii?Q?OjJifdmj69cbl0hOPVDF/K8R5+dppgHW7G97mvvgMM3E8seAUnR7fMfDV6uA?=
 =?us-ascii?Q?cQJUI429/CTWpKo1TeB53Bd8mknseKX9mG/59L/44szrdTqnLx/qHS57u0IF?=
 =?us-ascii?Q?g/Fo8PMgQZ5/qpqt1GtCrmb++2YsEPRO4eZv65pIORrkPMsZCY+0cXa0ENXI?=
 =?us-ascii?Q?/aidWo5VyHpSr2Ygp6M6fF2aan4Ycw8w8ssQ4MF6KfNJSx7cD+L4RiJy1wsn?=
 =?us-ascii?Q?gtKbG40dMa3qqLkAB3ORW9OWKgELokDcSMdqrqtZR59wlvkpsuKydCa/ezgg?=
 =?us-ascii?Q?SGM8KQAQi/Zhl7jNHor4DRrchasyhup+7ZEGz6xyHz9tCe3R1vbLZD5weU2H?=
 =?us-ascii?Q?BdyuAbi9cHnBfXswayv4w5fBs+1FOj87DjKSTjhpHSziACXvqAN4e/Dm+Toh?=
 =?us-ascii?Q?JkBCmh7YRoR4ji0eY3gWqbP6iLjwIvuwGqLBv8s5wcDW6mOXLGeiIrwdP8eC?=
 =?us-ascii?Q?bYBjnps=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 12:23:50.5017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca4c49a-df39-45d5-29f2-08dc89482f66
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5426

Using the #![no_std] attribute in the Rust kernel support is different
to the default Rust usage. Mention this in the Documentation.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v2: Incoroprate Trevor's comments.

 Documentation/rust/general-information.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 4bb6ac12d482c..8f78d87670aa2 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -7,6 +7,15 @@ This document contains useful information to know when working with
 the Rust support in the kernel.
 
 
+``no_std``
+----------
+
+The Rust support in the kernel can link only `core <https://doc.rust-
+lang.org/core/>`_, not `std <https://doc.rust-lang.org/std/>`_. Crates for
+use in the kernel must opt into this behavior using the ``#![no_std]``
+attribute.
+
+
 Code documentation
 ------------------
 
-- 
2.28.0


Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2083.outbound.protection.outlook.com [40.107.15.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22136AA1
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="LmhSHiy1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQObqq4cLgI0FJ6n68h4u4spzTiL6SOy7b2ZURQsutKzMyetg+GLvSeTKFyLng+VWl3/XlbFfgE/9OzfA8wCqDHqPz/4L+DwPnOkm66lUk7jUv1MbrjcW2OS3JZZ98ho/HNQMQvBlPxgJP8lBHGa9Kjc4TWMdlBA1OcVGD+gRN23OSMJSHP1HvkNLEBWfkDPtO/2+ciBnV3xYMXuj65Bq5Mrxl8OeRDr1leS+jvA0yB/DjFFXmsvV3269dCk9j4jg1DR+iCip2gPY4EvZf5ZC+gmI5Ia2XnTk4PGy1Y7Zf5OgwIi/mI6viqCrCtqd63cs317eh+osywQQS6TdaR0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj3TeDCRcpXrVLs/rJ80oqNllfnKZ32cWC2fDrigODw=;
 b=P8QOBjQHH1N22b/zo9kYH4Im514NapDAsCp2BdwbnFO8tasEsWhzb/IbjIVjXXiHfnY/Nj5HATUEXH1vZTzs1WF4+9ZtpyLqhx6G12W5g/HQIfpsBhgcIfeOglRC6vKjqKbWPE5fAQt0xogNzfZE3sTTdiKd6eJR1rlRE/umRYs859JaNmQvL/5IP35hLjSjGOk8vt75mr35dC8UYoU5fbhw/ky9SONq84c7++W7F0yfpLFfIdoqFs6krRqyq9B7Fy+YF0ZWSl86oV9OrLdjdhNkZdFum97dOxcgRjN2ldZ3+hhnbpYD/AuQ9MvGHnfpcqxajYQ6y4sF56XtayWK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj3TeDCRcpXrVLs/rJ80oqNllfnKZ32cWC2fDrigODw=;
 b=LmhSHiy1C6fhFvItO6Uox9BOMtYBdvtuq0aHzEjN1LsxhUVPnrH4wRKEH206JWMWzZ+Ja9h0I4WeyToeqnxsMldZrFJJyiKicc4ABmugXKSFI+nOqzuw5xTtUrO9B++OEjG/usitxVz0A2tTVLSUtrmVXBtDpE2IU69W97S5b7DYISeuC51GQxl3n2wAvApBCp9oSmwBaySMUlVa34LmtJLDy9ZvdJa3KguBW+vKkFY+mprlCoTVVFRi47rNMBK+bID/ZD/Fsm7KwXi6meRDpF4sBp5LPVGbhHgoHujkmf2NJX9mmFMwF+ehiu89EuZ/zs5KGmLH1LoP/1BqvEvCdA==
Received: from AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9)
 by DU0PR10MB7287.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 11 Jan
 2024 06:44:23 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::d6) by AM0PR02CA0112.outlook.office365.com
 (2603:10a6:20b:28c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Thu, 11 Jan 2024 06:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Thu, 11 Jan 2024 06:44:23 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jan
 2024 07:44:22 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 07:44:22 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>
Subject: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
Date: Thu, 11 Jan 2024 07:44:15 +0100
Message-ID: <20240111064415.908487-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|DU0PR10MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 98047cc8-ecaf-4bc8-01b2-08dc1270bf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fKyZ66D3VdcnwZmR3btdA49r/3Ya9SAXAzGYNYg4LFbv5srVtm6llIswmMwU767QizqZZke0RORgW7TitUPMYdUk5XQ7AwcD+XES9LixqX7ZuODZ+GCdvLDjz+BDVQCC7q7um60dw/SOG2HcKrN+3X4nWLs4aFm3votzRLtRI68rbm57ce5Jt7ZlsySNLmRDaJijq4GGmN5ouQuIub4wy5+V1KudJCLfG0liPjOXd33APl4OL/9Q8EcdgyfQ/jzOpyxLt/wwsK4cQ4OWLUuDuEtt3/rAuxnnlbDSWwsH4iIetBrgvMSysItY2RshOWJ31HQnj9PMU1xlaWukJeJ5plOIKDXFZ5T4y6ExP10jeFKcv7Rwy33MLNLY/5+kOG0frsrxWuq3O5TDfUWzrlZyDyIhw4IrrXUVO4Ysa+QHES5+Vow7XjGFWwNNxu48goz7wNiNGc8Gz4XSbAFQ3ykAscHwsvxYQ2CYbML92U3P7jMQ0jJNXqFj9UR9CMxwfPVbHMJs5CfUheCcn8x85FBy4oAEkU/X/X7axypRtUjOgyIy/RYI7eitwKRtK/x0pNFrUAIIysCkZSP+QcnTGdK3q72WctqV3UX+3aADt0zqeuZykCRG/BoMyIxyUdjIEQzM5ypkEp3DhbstGVqrf055KfUVSkbLs3uuEEwi66vu9xsHYa1+ZZ8v7Sen8AJzwL/Pxs/SSqY2B/BN7LZUbyiWHDcOtGjDidaKasAaQ2nGyp8uzu/3wnzMaeNqq4rDigqt6nUt9AZ4uaEWdJ7DX4oug==
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(82310400011)(1800799012)(186009)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(70206006)(70586007)(40460700003)(2616005)(40480700001)(26005)(316002)(82960400001)(8936002)(16526019)(44832011)(8676002)(107886003)(1076003)(4326008)(6916009)(7696005)(336012)(426003)(6666004)(2906002)(5660300002)(47076005)(478600001)(36860700001)(82740400003)(41300700001)(86362001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 06:44:23.1104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98047cc8-ecaf-4bc8-01b2-08dc1270bf1f
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7287

The existing to_result() takes a (signed) integer from a kernel C function
and converts it to an error if it's negative. Additionally, there are
kernel C functions returning an unsigned integer where 0 is the error case.
For example gen_pool_alloc() and friends. Provide a mechanism to convert
this to Result too.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 rust/kernel/error.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

I'm unsure if something like this is acceptable. Therefore the RFC.
But I want at least ask ;) In the end this is a slightly modified
copy of the existing to_result().

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 376280b6a745a..3306b8f590866 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -248,6 +248,16 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
     }
 }
 
+/// Converts an unsigned integer as returned by a C kernel function to EINVAL if it's zero,
+/// and `Ok(u64)` otherwise.
+pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
+    if val == 0 {
+        Err(code::EINVAL)
+    } else {
+        Ok(val)
+    }
+}
+
 /// Transform a kernel "error pointer" to a normal pointer.
 ///
 /// Some kernel C API functions return an "error pointer" which optionally
-- 
2.28.0


Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87423A9
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726472308; cv=fail; b=HszV6nsW/aaAq51yc6B8KcI1Eahfvysn6XK3uCO2B9PQBlTPwqsIwvV7GzE+Wm2kgNJAlNPVAcEUp+9xXu9HeevNEniRnax0p4REkgREwBz2aVLGQoth3ELZFNtoxJI3cWquTC00zl8BvH7hOltevLAJgmMXCFdcEZBsq70I4zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726472308; c=relaxed/simple;
	bh=iAZ6D1U09HHKnOi7oBmOPPrFEXXwD1Ca+Jl0HfmSfpU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q9DJqwC8mgBojSbLsGcwJwviJwYYw1x72SlKgrxg4OXpwOHz87SzpDl1xzMbrB4Xncr5gxiUc3cdqt4FPwpZKxb0i1zs8sNrYadu4tIPfuKKM7XIuHkapVDUVx5mABVsabTNJF+HI6l3EwUdjNI5ep9QFjzdOz6Jg/pMpZZlr4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=N+bj65/t; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="N+bj65/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysRKCvNHjR/S+I3uRbRd97hxihb87bccew4tyYhe+0nLjlToOgb+9chWU04QGKYJYYYtcriIuse5Nz5L4Z/Ge3zMsiPwCo5JHItzmUFAehxZf8Zs84troj7bOvoGkkHKycRcZ3ngP/45G7sie4n+I/8YBjzw0YjXtP/PkttrJItBF8hNVVNRRS9mvJw6bmMiS9c37ZtE7xXowUXMjwtNQvKt/nESRfu9gIX/U/x6cHh4UsolwCPAojwDG9hha6MEx/rxdWvawH2jvlpgufV6xKnS2TebTEJ6zcPAqf4KQmpt6dk8uCZK8RU4auo3XSM+gz8tlnT9lstlf27r0pzgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/ShOYgO+Qxif3c1In/uj9X70vFVhCstGz/gUoBXhXQ=;
 b=V3ZsczZAP7qu7MgCdaRKIlOfI/ImJPYzZNkZWnvIxxWx7LdwVCYzfzsWVCdAZOG455evoYLddQcpqjrjT8GCg4t3Kf5yZVbVUGR4zj7vDN5A88lCSFAbmTQCvGeEarGWeMARXscK8qOeJk9EQHr7V3VK0HWSI3lh0yFksiC82qNGy0V+08pFgCmd4Y/gnrTIvL8IDPOtx8+4wDnIM+c9ICHL6mGcheFnZIHCIYyfr365E0+Bw3QuEQ1DfPZfAUF1ax2MmbBrEyqyuKd4tkfmQRQKL5eoGDIi2A5Yot5lqAHpY8XyWMf/V4R16em78LbDduIkrL0iEvwhdfNfvMjFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/ShOYgO+Qxif3c1In/uj9X70vFVhCstGz/gUoBXhXQ=;
 b=N+bj65/t45cjLEyMUkKxelsgQ2gHwb6+OltdTa/7tJ2l76tH8pU2HW+DwYbBo1tVOhVvexOksj9LDnD8cVIzVhojcRSLfaCPrRW0pMDMYXMzZK1T39HMQ5W5QnByaGGiop1eh+oCT32tyTS7nkGQDDnPqxvVjOtJPfIJt17I234gviuiXaM8zCSx3GXXnRTCXy/2CrgGr31yeZGhgm9BIyytsZNFYOnBcRyODhOxlQ/fipz2wNPZtfAP8H70nmq/HftFI87iyrPe+o3E5S2MCxzvt/+fn3u+/SBMskgygYNNY+tGz9ESuIiNFBQM7zRsfh6TWDosODta5Z9V4azGjA==
Received: from DB9PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::17) by DB8PR10MB3468.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:13f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 07:38:21 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::ca) by DB9PR01CA0012.outlook.office365.com
 (2603:10a6:10:1d8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Mon, 16 Sep 2024 07:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 07:38:21 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 16 Sep
 2024 09:38:00 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 09:37:59 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>, Gary Guo <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
CC: <dirk.behme@de.bosch.com>, Conor Dooley <conor@kernel.org>
Subject: [PATCH] rust: mutex: fix __mutex_init() usage in case of PREEMPT_RT
Date: Mon, 16 Sep 2024 09:37:52 +0200
Message-ID: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DB8PR10MB3468:EE_
X-MS-Office365-Filtering-Correlation-Id: e596d163-446c-4ca1-6194-08dcd6228a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nPS3TfTxlHZBhQclxtkVSA27XUJSDjEBmoss9CZoBWn8bbb4jHn6qnq/wu9/?=
 =?us-ascii?Q?knXRx3SMSi3Iqp/BgEssPZE6JwO3Pt6tmZu8s9cTTanKVZIdgjeIOw30jjTW?=
 =?us-ascii?Q?lVe3NigJ9ub7nmjvZ1ZuZXrzplwRIbSXeTI9nbduGshk241wxXFswBodO/aN?=
 =?us-ascii?Q?uJTcenOyex7ttoEvZQS3CgG7iOOMzQYGPaH1+uSZVK6bdDAWUIgFgXVxd5g3?=
 =?us-ascii?Q?sTBmxi1nQUJm4RqmPSk8WLtvzATikDg2uy/3Rd9guyTPxZgbSR36xDhE5m/v?=
 =?us-ascii?Q?ouOndnHhoJM7IZp8UkwQqQTpsXCuNcdf7E9/TpH53kTZFa/snA+HK9yCYVYJ?=
 =?us-ascii?Q?axKye4Jwr/qZZjshQ4fj+o4dwd/c9Ak+qZPCJwpZBQbHj3PDL1DSx3Yf5rrf?=
 =?us-ascii?Q?shFeKPJjFEx9unMv00FH4ikCbz6dGZdX2O1Q3dmxVLLGiwYpTE+5zf6uXvT9?=
 =?us-ascii?Q?h4hCPFyzh+lJR1ncK/mBUdIdIqp/zBIX35TCLK2WDJOpTvulBft1gR9kTZKE?=
 =?us-ascii?Q?mHXdJtVbWk7BO+LoV+FNPpcHxo58Wb485XtKYAqepqcNaoDhS4arYPvt9RFr?=
 =?us-ascii?Q?m1zgsgJJjkca6bLSfSaAFIBhcfZjVIuMFWJbgbGn4kLASiwDjCFTwg/fVGXs?=
 =?us-ascii?Q?Q74tvlV44mUHQ1/tHHDEjSe5aIN+oBYYGz2DygQaPVZ1xa68E2RPJP9/jlDD?=
 =?us-ascii?Q?OokEclaRpOZJAafp4wzDjGOyHFXt4GRSv/gg6SE1vrl95DH4yg4diio53tol?=
 =?us-ascii?Q?CH47hKgkgUm2HJZ/wZuxpCMhrZ0IBv45GbhANtLuC79GRy6t209URZ10wKwS?=
 =?us-ascii?Q?OLzV+4aErGmwSK49uBCsUmGSQffLJ+FZqyN3xeRv8DHxxSTQWbkWsYYlNg1g?=
 =?us-ascii?Q?9BF+fVIXg/SaLrZmB8DMZvBQBH+f0IeOodU1hzDARYSq84lW6OU7QFrJbGPE?=
 =?us-ascii?Q?3xHqpA8YdNaAT9SCPumDNiNGwyZ4I7dElhuc5EXaYQv9fL+jgm8ukhIPbsUA?=
 =?us-ascii?Q?I6tVo3GgDAOWAQ5pBygNVWHOPpLakgx9kh+A6GtcWwsdkFhV53bZB9+CIKWH?=
 =?us-ascii?Q?1S05a++m50PIvmWrjcIkBqD1usYJjILh3RuTk2VjpYpXBoy9AUhyA0o72aYv?=
 =?us-ascii?Q?fQqrw0BcX7x9o6xFOPv9+DxnReN6shvBp/y1B37VqEtqvc5E/3t12Im4F95E?=
 =?us-ascii?Q?uXDIgjsHpc87t7AEWbqdmBLlaTTJCztU4vgNASuby2jbG7UQsqc7y/bvF4El?=
 =?us-ascii?Q?vlhVZo3tgyNvrhmflwh3bk4lI7FptxJ8yalp81IMomuqZYNx2Uf/4Tz6vlIz?=
 =?us-ascii?Q?Veh/zQAQ0/zfWITXzrszH63s6wY/Z/6pqc87Gtl+3SS6d+kn5/YPs9BcwM2G?=
 =?us-ascii?Q?NaV+Miq8vZIunhhBs4AL8+Y7hnFqL7TTJC/phDsLXcZMsf0nUWIl/Zyp+d2A?=
 =?us-ascii?Q?hH05RgdCY9i952uozEW2cBn1rySIZuw5?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 07:38:21.7503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e596d163-446c-4ca1-6194-08dcd6228a5e
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3468

In case CONFIG_PREEMPT_RT is enabled __mutex_init() becomes a macro
instead of an extern function (simplified from
include/linux/mutex.h):

extern void __mutex_init(struct mutex *lock, const char *name,
			 struct lock_class_key *key);
do {							\
	rt_mutex_base_init(&(mutex)->rtmutex);		\
	__mutex_rt_init((mutex), name, key);		\
} while (0)

The macro isn't resolved by bindgen, then. What results in a build
error:

error[E0425]: cannot find function `__mutex_init` in crate `bindings`
     --> rust/kernel/sync/lock/mutex.rs:104:28
      |
104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
      |                              ^^^^^^^^^^^^ help: a function with a similar name exists: `__mutex_rt_init`
      |
     ::: rust/bindings/bindings_generated.rs:23722:5
      |
23722 | /     pub fn __mutex_rt_init(
23723 | |         lock: *mut mutex,
23724 | |         name: *const core::ffi::c_char,
23725 | |         key: *mut lock_class_key,
23726 | |     );
      | |_____- similarly named function `__mutex_rt_init` defined here

Fix this by adding a helper.

As explained by Gary Guo in [1] no #ifdef CONFIG_PREEMPT_RT
is needed here as rust/bindings/lib.rs prefers externed function to
helpers if an externed function exists.

Reported-by: Conor Dooley <conor@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/20240913-shack-estate-b376a65921b1@spud/
Link: https://lore.kernel.org/rust-for-linux/20240915123626.1a170103.gary@garyguo.net/ [1]
Fixes: 6d20d629c6d8 ("rust: lock: introduce `Mutex`")
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

This is against rust-next to use the new helpers layout.
Due to the helpers layout change I'm thinking it is not worth
the effort to backport to older kernel versions, so I intentionally
did not include -stable.

 rust/helpers/mutex.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
index 200db7e6279f0..a17ca8cdb50ca 100644
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -7,3 +7,9 @@ void rust_helper_mutex_lock(struct mutex *lock)
 {
 	mutex_lock(lock);
 }
+
+void rust_helper___mutex_init(struct mutex *mutex, const char *name,
+			      struct lock_class_key *key)
+{
+	__mutex_init(mutex, name, key);
+}
-- 
2.28.0


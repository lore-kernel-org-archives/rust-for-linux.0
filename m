Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0811344DAA;
	Fri,  6 Feb 2026 04:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351724; cv=fail; b=uzXpfK+gRnj02ZckiK8U8RNJG8O54VwVF0/CcGx4N0Jk+ndc4o1dopKu+D9fURTfDZp+MMxomOGGD/SAJeocJ2AsKNzBhRtsnwd+s8k2YxjT77VlS5afdzvt2rH2sD8veIn+pCqspooMa1DJRoTA7xP0QX/NCqVFyF9UIh5xMs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351724; c=relaxed/simple;
	bh=qWDnZKDUT46ljMpHIZM5DSVP4VQVyAm632ARJxHsQ1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kP/W9EtxPVpvrWIJCxPyRSy3dc/DL3u9IVXuX0aieLu0Qxzhog88mRNtc7ZqTajCjN+4veU5H48Y9Fl6w5eJCtYoEVNfssz5HlkK42RqIdH/RRSQCxwayABP61ENOspDjae817o8UrGumXNBRtbejTg7BXED04NUDBuRfHUbsZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bgwz5Hqx; arc=fail smtp.client-ip=52.101.52.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bgwz5Hqx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oe19epKnUAIHHWu2QqBpPfJZVZelj+nWMx/sejNBCwtWq7r61qniDEKlTuximn8v0k42/0Hf3hweTKwpKv3zQfQhTGpgULgpGKLCFJ8ZTb65Vn//K89+5cPZeJiPu2WU7GLGOj10mNy1ST+PsIel/kAwU+3VA7ZxZ93dJw+DCJ3WtexJ8cfeJJD2FMVomRi3N+jUu6EuDWgi/rzG+bPwhkyuZ2ZKfW5bwr1TbCBceGxuxYJ5VzOVhxueLdbRl6wQCdZmAiueTj6ZPtyYFvh1uBSDLcqceWO2VpGaqzlPrwgRPfaBKp1eswECCHryR4W+sjaV4fvyh5L1598M10+SSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw1RynYr7pxHY9GglqCxS+AIj/WWKzRfg0nu6NFE3Ck=;
 b=IgRmBvI9leWnRLqHAmw+DoW6v9ch8ZcjAv0D/WCf5zBP7D27YZeGhGxQpJ92u4LmhAr+lpfttvyvyaZInghcGK/ztYQFl2JW3/isbOtff7xvlU1amo3BFwZ2CQSzK89uU7kMetGkbPRuAFMA6gWTSR/J1thZJqmCfUY1OpDZPH/LKGoS9OGeXfSKZGprQj77NmZsLFQP79vT0Gwi8GwclVFDur329huSeTj7LfkdT9bFcEsD9mgzA0Y1Kg0kGPELGHSYCtQ5zNa/RdxKuY2NZFbLaYwwDxFn9sYE76Vg3bLQ5tiArCv1GMkEblrKqHhpeQ9mPGqplu8GVwQo82ZWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw1RynYr7pxHY9GglqCxS+AIj/WWKzRfg0nu6NFE3Ck=;
 b=bgwz5HqxBiRRQKbYe0iyo7e1sDLLVv1/2fEWZhOWfdMhBUxu2CQs0mQepMNdQZtJfplmn/j12AToHPHHxwMM2Rxskk7XP9L64PalpnRvzCcxvDODPR4N0hquWGQv/1R6SG/siP75pgVhetI6Zjlc30RLkQ6f2pdKa7+FwLcvGTxIOzYIerZejEp/3SXysgO6GB4zuFJeiZ5HRxFTQuaJTc3gIIaYjomW6l166Jo0haEiRWdc8luS2KlZfzeVPTWhbIbUIAFgX/bIbCIIWpmIOMd9WGzTQQ64hN0UwyGo8LbRVLA2xKyxEMGkA6a1YRLu0GyjgnRWgyePb+3jCxaaSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:22:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:22:01 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 27/30] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Thu,  5 Feb 2026 20:21:20 -0800
Message-ID: <20260206042123.303281-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad9dd61-8ca4-42fd-7f51-08de6537467e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WGuPixmpQWVM0GIGRVyXW3ot05dLGQM3ZkIAZ6XZH5UpL/xN9dDwk67J2hg7?=
 =?us-ascii?Q?T+Exo63Zu3GQ71Mi7MRvwM2m3lsLD9L763yu2JJpbWUCkAkBoS7noi4pLVZW?=
 =?us-ascii?Q?YwgRBkzqxQRV21lHJwD2JTNGx2VCWrThVqNsduJ4VfhEayJC4i0zPD/CPGPs?=
 =?us-ascii?Q?Ec+AzU84RmC3asgeyBnjUQJA7XisIh8Fu/6anmeooaaYNdWH3a2EM4hd7SW9?=
 =?us-ascii?Q?JwISB1RP97ltzWWPxiGQe9y0vegOdwn+nntcGOCo7pqsL070nj/aonL3ESHs?=
 =?us-ascii?Q?Go3c08nFA4fZaM83Hfj69BL5Rh4NieheHFhuDPaSBm6ZO19UK/eLfUsozIvU?=
 =?us-ascii?Q?2Ut6+45oXWovsbXVuUNJdKGr9XERb2k6+Hq7WldZOMx40AAnpgkMwEcTupec?=
 =?us-ascii?Q?JmX8PiJtFKDB9BzWCWCYIBcBAsxSEl6KfltDZokq+OyaI73KOKzBxZzrmC12?=
 =?us-ascii?Q?hqbGvOgpIStiEAPrxUjW9P2+bvEDgnUuif/teIP0y3X1FBlwf6YVphArUNlN?=
 =?us-ascii?Q?YvQWQNFvGP9IvY/TTUMGPNX+CA+QqJ136urDsHhUBXp5GPJxQ6w2gopEDhp7?=
 =?us-ascii?Q?z0MB1Gc4thp5DumUNeN2Sdf1CeRR4kknMZcd97hlMPcOhklAN1g6xkgjKBpt?=
 =?us-ascii?Q?OkM1PRQgM3aUCKKwxPjxPyTEKn2+4THhRo48kVPJZ7lPaFnZ/7jMf6H9Fyau?=
 =?us-ascii?Q?nthOiPWSbteSkWBWRbG4v02e61vgX0TBn9DfaS+Ioy97uaeHrmjL5MPdmw1X?=
 =?us-ascii?Q?yuaMV5+OwmYaF8R0HkFCs2ZZ5/zX4pkQ/7u+h3ksVrVFtzgPGhudpyM2bPKN?=
 =?us-ascii?Q?Lfm+NpyUhaaPuk17yjGZuMObKeqTsz5KU8nmsSPqJLNWYtPTz4kuad1vNRwj?=
 =?us-ascii?Q?T6+HKM5sTsArIU10rPjklgjnN5rPShqXCRGoC2cfFDoBOz0PjjkkvdowvmF+?=
 =?us-ascii?Q?ja6XutASkArh1rRkLSJO0kuw/+/hCP8M3I4ge4XdKEdUG6H1UJm+T/SQon7u?=
 =?us-ascii?Q?EhT08j1dcUIkYmAAA32cpyyKQiMu62znKu+YmuvcNTJ7y5NjLjeUgvrhKtTB?=
 =?us-ascii?Q?3PdJTE5iz8VCtYvUzrk1q6umMtpqtXq5Dfop/EsLpLUMC6Yuv3fc3/B4c6jH?=
 =?us-ascii?Q?JlZasVIvWiYp4PIYjq3z1YPaKGaCDw3N1kuWpgBsrhZj3AcgS953weZHqQCu?=
 =?us-ascii?Q?fYlhEcCFYBB5DKvJuHKYutCPzRLqlI6V1Oe1p6WQ8JofBjyut0pPrgRsEbzd?=
 =?us-ascii?Q?b6Bgfx6NzSNrgon1zPInc5qFX9PIcS0Nsxqpsamfkol4gDNl0noc8J+KM+Vz?=
 =?us-ascii?Q?LYs/7ejz1c+l2mNulmnKw8NpTA1ISaVJpLPRMDYUTWREz0r5CxAZaBvlzG4R?=
 =?us-ascii?Q?goy00wXrukBuJWkSeVgIo2rKKhKmbzE1fvaAPnPGk2rXV50hU8NC6BAwNwJp?=
 =?us-ascii?Q?EakY5Hz0Z0R1wk8EFYwSIFfbalT3y1bdknfcoCdK3nG/fKReuhvYDU/UQj1a?=
 =?us-ascii?Q?fRivm7uuveK9Skcu0NF/DPANvv4pwB/99lb4lY6MfxiZcMLecylxw6M0o+CV?=
 =?us-ascii?Q?2htr+esjWtB2Kz/TCtU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GwoDUHY4QUqp3ey/XAC+KYkktMfLBFYpAW0Y5fzrJaQ8brwD4othVegHBrKi?=
 =?us-ascii?Q?Gm9aQYNgLhYffhxJIs4g/GCR7QBwJO0b4hg+IAROP5agnlqjlkSwL56lBSN9?=
 =?us-ascii?Q?Fb5+8btter4AyA7WLPVp8WNvI/JotxuoNRb4Nsi5nVJxjnRY4d2UMNRYU7Ib?=
 =?us-ascii?Q?zitzyA8b1BEeiDXHrRQSeLHNuZzlN8fnLpn5B9EWpSypwEUYrJRyB4s8j/as?=
 =?us-ascii?Q?+uRmwcOtAOan77uvwtE9X8O4PU1jOxzonB4+YPaqaca43H18KX04uOSOVC1X?=
 =?us-ascii?Q?/4KgeJxkOzUVHg46yVv63osAWm9T3S26p9LTlbU6pAC0So/5K57IxQ59R0n5?=
 =?us-ascii?Q?swjA85+Tnx075LYet1CoEBJxEKohvU/tRysiSN6x6j5k2tVIVrgAN+ea+Rdl?=
 =?us-ascii?Q?4lOttA88PhL+NmKmbQ7BYVM+t1uY1mxOrIEvdiroeDCuqTyyzP5qmnxeSXdf?=
 =?us-ascii?Q?t8/rrIL/XnMYwTTWGOaIeiOPVVag1Sw5Ws6OoAOWKOOVqOryHHwe38kEN3to?=
 =?us-ascii?Q?RA1E1UO4aXkjRM7eklG/JeM6fZdeBKZSD2icuOjjrSmE289jGl6AMw8LkCE+?=
 =?us-ascii?Q?y+UHK69GiDxw2zNZAIBnCUYJvbfsFId+B6WtnrYQqgMKi/4RKKT4qF4Vns4U?=
 =?us-ascii?Q?lXtM4nf3WsJhnEENlprZZQGotDlTyG9UNpiy+1epp2ktRZJo18QNDwn+Ge0E?=
 =?us-ascii?Q?jorHwNCIcETeWzJwKv9LjvGnsHeGy2BMia9tdi5DlXiUQIA4xyhY9t5S0CQL?=
 =?us-ascii?Q?JMsKYUaocag+wpQhjsunFaVmCpATkS9qfRHB/mGcUaPn+dy4HKRjj0Ono25N?=
 =?us-ascii?Q?m6gvXR6h/r2OSSUwbEqH77i8ZTsMp7O9OS8S1GyeRnT5veXbpw+HBHabbkId?=
 =?us-ascii?Q?vfAx48c7geGMXl/XWVHStqZbJdPHcJjqU/zAZ9ann2/dsM184H4KDR94ulYq?=
 =?us-ascii?Q?+0nmHLC4eof1ExO4D67oUAPNRNTSZYDlQivK6lYosgp9F7QTslHt8cQlygvF?=
 =?us-ascii?Q?KW/sdL6VeyjV47byTwP3ty6c1G8lbj05KBYRAefa/QE1YibEWp/2uQ3uiOJZ?=
 =?us-ascii?Q?pcEHfPmdwMksUb569FimynfD5Yex+aRMboLsEPZgJPcA/GizJ0+KtXRI3LpR?=
 =?us-ascii?Q?mayAbzAVkz7KAK0615AFmLx97aZSPaX3VL2nPIIVMIi7uVMk3Zv23Nax/Jz8?=
 =?us-ascii?Q?s97z1OSmqWpsk2Pe1/IKHhKiDymcJMpnhSvc7KQQ6zEyKn2p11rVSW2ZZwxd?=
 =?us-ascii?Q?kPvPcNvX90ivcb4zHrSOkV71Pl8gNHSHBsNGBE0Nj8xIh6NHTp+tt134iOoU?=
 =?us-ascii?Q?aVmNuEED5wjpB9TFcbb4iS5WztiA9DiCHH8B9UJ2QyrimZHeAFA+I6MC1Qvj?=
 =?us-ascii?Q?7SCgO3N9ppZbjC1ekU+TZxINL+JnoGAUXY2SZGTuXwH8WkPz/CJlG8XyLW4u?=
 =?us-ascii?Q?wbFgb9rN0ovvLeaNGeZz1iHo/goPorf8UbS6qcHVxy8r7O1Kff2A5ikZhRtl?=
 =?us-ascii?Q?qDXGE98fUsSTVsIyD+CAWrgjdUTU1Ik9UC40uc8QVxOK+CuNfVETewqBYl9g?=
 =?us-ascii?Q?V0Cd/fBqC2E6muMXOIfHBNKDzUfG85MN+I0cD3DeaGidyaOKB4ifEoBHv1fd?=
 =?us-ascii?Q?epsDQrgjHhgBCbmQiQdqiegTNPwM5bXAGYr6C+Bi+uIHzAGDYZDIre8cYEGY?=
 =?us-ascii?Q?sLOryg58sBhbQJLzPiXkFW5M6IZ4VGZGPZs5AS9ZQEmkbsJFWUXcREPy4Hvt?=
 =?us-ascii?Q?pVX3GgV9QQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad9dd61-8ca4-42fd-7f51-08de6537467e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:22:01.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpflqZZM3uQZrveHSX8nRhsx0Lvin+SU4j7zLbWZI5KVQUTQCnZC/g6l2+FWnGFej1Q0ovYxrp78v11+COFnhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 88 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index b6aa6dcec28e..178e319d48e1 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -15,7 +15,8 @@
     falcon::{
         gsp::Gsp,
         sec2::Sec2,
-        Falcon, //
+        Falcon,
+        FalconEngine, //
     },
     fb::FbLayout,
     firmware::{
@@ -154,6 +155,91 @@ fn run_booter(
         Ok(())
     }
 
+    /// Check if GSP lockdown has been released after FSP Chain of Trust
+    fn gsp_lockdown_released(
+        dev: &device::Device,
+        gsp_falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        fmc_boot_params_addr: u64,
+        mbox0: &mut u32,
+    ) -> bool {
+        // Read GSP falcon mailbox0
+        *mbox0 = gsp_falcon.read_mailbox0(bar);
+
+        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
+        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
+            return false;
+        }
+
+        // Check 2: If mbox0 has a value, check if it's an error
+        if *mbox0 != 0 {
+            let mbox1 = gsp_falcon.read_mailbox1(bar);
+
+            let combined_addr = (u64::from(mbox1) << 32) | u64::from(*mbox0);
+            if combined_addr != fmc_boot_params_addr {
+                // Address doesn't match - GSP wrote an error code
+                // Return TRUE (lockdown released) with error
+                dev_dbg!(
+                    dev,
+                    "GSP lockdown error: mbox0={:#x}, combined_addr={:#x}, expected={:#x}\n",
+                    *mbox0,
+                    combined_addr,
+                    fmc_boot_params_addr
+                );
+                return true;
+            }
+        }
+
+        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
+        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust
+    #[expect(dead_code)]
+    fn wait_for_gsp_lockdown_release(
+        dev: &device::Device,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        fmc_boot_params_addr: u64,
+    ) -> Result<u32> {
+        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+        let mut mbox0: u32 = 0;
+
+        let (_, mbox0) = read_poll_timeout(
+            || {
+                let released = Self::gsp_lockdown_released(
+                    dev,
+                    gsp_falcon,
+                    bar,
+                    fmc_boot_params_addr,
+                    &mut mbox0,
+                );
+
+                Ok((released, mbox0))
+            },
+            |(released, _)| *released,
+            Delta::ZERO,
+            Delta::from_millis(4000),
+        )
+        .inspect_err(|_| {
+            dev_err!(dev, "GSP lockdown release timeout\n");
+        })?;
+
+        // Check mbox0 for error after wait completion
+        if mbox0 != 0 {
+            dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox0);
+            return Err(EIO);
+        }
+
+        dev_dbg!(
+            dev,
+            "GSP hardware lockdown fully released, proceeding with initialization\n"
+        );
+        Ok(mbox0)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2d0f9b3dc9b8..159e632975c5 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -285,6 +285,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
+    13:13   riscv_br_priv_lockdown as bool, "RISC-V branch privilege lockdown bit";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
 });
 
-- 
2.53.0


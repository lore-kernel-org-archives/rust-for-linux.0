Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02EB306483;
	Tue, 10 Feb 2026 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691628; cv=fail; b=WOc0PdWUJxTo/Y5cdrbCdZQJcXTQ4Ug/DwB9eM77HtETGuc9tIZPkDDhmb5yRismugU5P3YMP+0E/yZcT+RJu2u1QdJqiMzWsPc694SNXhokXOdSNDTLzinl3+el8tbCxnyRiimDxivovsm08BF0lscYDFZrerPtrMjlNlzdECc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691628; c=relaxed/simple;
	bh=XyaveYYH7x5EgZXrnZ6l7FhofsAJmW0hw98quJog9nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/aySBFlARcYGIHxEGap/8Ff0jujm8FTPooNlW43AzUzc/8SG8eSQ49DwE0h1nI5wv0fl/FJZym7Tw8qX0+dv8AxNjGzA8zgsJqfenw+wGRxkDJ4x5IrexvWx3TUxJYUe9KoxOBrVmEgzG6KQDc/ExUdVVyfoD9xIkSoW1KNqfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MHwZ8ZoH; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MHwZ8ZoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyttKsS5sy+VsuwvIk5RoS5FfBph3uBwvDBftbKno7Wm7I1q/wIaMET3jGYKgxsOCpnuVbPCUZPxtPaaIapIXBMGPegNOxdtP8TU+y49RBrqffi/bI3zrqXumUSmicOBndozrl+DyODSQQCnj6ImAt7nwAERPb4Sfa0/Y7kb+iKMeuxHk1FUNF7+AOaG7JmMR4U8q9Iic2Cu0aG+6vlFEP5uN6DKy4SK9axmUyo1zc7IqjNYwkUODistvCpY6K9XBTBJ3QxW8G7Uqx9VJbmztsCSyIMVgirqt/l8yfonK6MS12nVX603FUVUuT9VA4O7johxM1nJCGZe9ofcCXH3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZMWS/s4RLFJqCDRREsGENstYuMZhyjtoB5lL8kvTpo=;
 b=OqDki5btcZyRaOiNIw81xk3oVnDL5AIYw4GOGM/XavBVET18OqapVEaFY1Mq/mt7/a155dtjBsPoSIgJVT+LpiPj+P60Ct29lk5mIjymaqXpbiJwLd3bz2tRIbMr4rIOvQy7w8V4Qf+s6JxcIadmCOo5zvGOMtahLsOR2sjG8PnwYCcl3JCCdmA9bebIK19QXrmiVwUK89sv/t7N6RxRYhmJ0aEThTvAO7yOgALoGKUyQ6VwQlUp68k2NWhYwfs2P7+sOv9H1BjoSdyPKwBVlCTIvX3i5Jqsjy6ZQnFPNDzLH1f0YRDDY5151/fC2gg7riaIN0OHI0BqlCXJgxLrCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZMWS/s4RLFJqCDRREsGENstYuMZhyjtoB5lL8kvTpo=;
 b=MHwZ8ZoHN2E5+2Tl0Dsxq0oVYRCJ3b44pxpkAu2A2l+cG1/0uhhsDC+oGgaoEdnokWN/cHq3nKFQ+6JwQ7nZViNiTHfZryvDtlFdNUJZhQ1GHwFF9yy/o5h7Rr7VUog6YsMXpuWTh4BR+qnjFFLOoa8cqOgjWPrNd+9tdsjoj7/lTpQkTJeU+KE+yGEq4icj+EFI6RmPbSqo89d0TAPsSS/uRxKH68wFFXRn/z//Z2XRTBFFiuWIw4VtfWC/aFbt9xkmy/aZ5HKoALpX8mn39dA6JCKTfpZEfA/8yMPwHE91ke9FikLvxQOCWJArfujXygJyBR5KU43XLDMDn09MoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:01 +0000
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
Subject: [PATCH v4 28/33] gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
Date: Mon,  9 Feb 2026 18:45:55 -0800
Message-ID: <20260210024601.593248-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 441c8614-cf74-4f32-0832-08de684eaa85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bYNU3XbJxq91Txr1pMGwOuK/G5jCtioMI7EbD+YuApRk59nVfY9rTBAVh3K8?=
 =?us-ascii?Q?s947INo9LAPOrjWUvqsECdVfpFDNBhWVGIEhM6BIjUfFhliVPW51X2vrqj4P?=
 =?us-ascii?Q?sI+pFyiyHefLPz05doZK6eTcN0TVzH/oez7qda2nMaSlrCL54tfpARDQgHRk?=
 =?us-ascii?Q?KQlgeUQwkZR0ATQurqxFJRYkE0/ORtkR7ACJ4baLBqAfqOPV25H9ZVSx05/7?=
 =?us-ascii?Q?HhsrOSbLOqt/mtjP3XJKGsj9Ij9vTQE4ToEHF1291iuBkRXg/s3MEpt7em6g?=
 =?us-ascii?Q?qlNtH41ligSI6+Odera+jlfJ5E0h9WBBorXAukVIhg5kSTCfsX/Uy4Tc/6du?=
 =?us-ascii?Q?9FxLJSWwFp1aD+PibdFW+BHmW0bENRqiutraw4eKKdYCQqzAi9SEnZfiFoA4?=
 =?us-ascii?Q?gCoo0oWRN0nsib+rQBCqrzfTFjyyIENvAb+z7qDFz52HjvH8OijGz7CmNAgn?=
 =?us-ascii?Q?gMfz13lv+8kCu/26WGlmdCnCORpQzTWkq7I43QRJ8SxrecjAZkEPDipqzuPS?=
 =?us-ascii?Q?eb6K+2A19xJ84QNVOA5u9gmZzKNDJiHLxOGwNkGCwD+mn+V0C7L8sieN5Uml?=
 =?us-ascii?Q?i+syhpzFvElj/8i/Jar/eV4vELHwO88h33f32Px+IqSNVUl7mcFEjJKAJesW?=
 =?us-ascii?Q?xsK01S+CMNnmr0Qt2hXdbkxbmlMG+qbNaYMrBujuxgvB+uOuyaeFbwpt2cF8?=
 =?us-ascii?Q?1UfGzevWxz2WLP8Uo9cxHUW0ROTahM3JjH3WTrB+3Ez7hMrHmaUodKg6gX24?=
 =?us-ascii?Q?0zHj3vpk6nfmKmydn4bZiAIvpyHuefVn6UI7GX3mUcUoOazAe0NaBko4BsRN?=
 =?us-ascii?Q?OA8VLEsdFY8Xi6dtAfU2+uXdUaWpB/1km6vIi8gag6vdFhcfC5/ENmGwhT9j?=
 =?us-ascii?Q?N1XvOMJgJ8QbOtxAp1gmCWWtvh2bJbp8J1IDKbGAuENHOVEl5wJgogk5tcxl?=
 =?us-ascii?Q?Hh5CgIVHvN5rMJdKHSuw296uY45IdHFk7VObRnsN8Li+joX4Ih81REVtsw6d?=
 =?us-ascii?Q?thdcA5LfUbQS9ZX8r+w2o3x/dXEamv9tdOBdyy3J5CLjhvl1Wh0cD+RjhgpB?=
 =?us-ascii?Q?KQWJdjEAkPB1ZONbNJG8e//XJr8ysvT+yhZ5k+f9T6IZBI9lXJpdkQtsBOS9?=
 =?us-ascii?Q?w755ZwOo6/iA40IG6h4AuMP0Or02hQgYSRdfauHHJG4lHnlx+A9Juf8ysldj?=
 =?us-ascii?Q?Pk/8mIYAJXtw5MV+zVs93yZ1dl3jnJBe68yNDlRncd5BQSqEvMy6y4TdpC/o?=
 =?us-ascii?Q?mOHKNt3PLqlFGmsk3UXLLb63gXhPqXIQiF83vkNOj9DbaH+abANDS4VErYJw?=
 =?us-ascii?Q?nlkSfcbtRq6CYvj5GYAMMNxC07wUK/GzRBV9sHqwtg3KOirVRT7q7EeQaa23?=
 =?us-ascii?Q?0YNtNB6wNN0/M2NDvc7Iy4Ew/4sjPcwF3waFMqHBUzsyBvr5wqYs1hst+99r?=
 =?us-ascii?Q?sUxZwHkxdLsHqGMsr/OUItXh+hKlBETLlsDmAK3T/h4Yf7UN63PKNqjY9vkh?=
 =?us-ascii?Q?CpSNhb+ONAmSnudbJQ3DnRMLY6ikXBSzPLV6wxgmENE5cP1cWLkFHISiAt26?=
 =?us-ascii?Q?tfaeUzDj5LWUExHjLOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?knpi7twZgdae4/jhBgE8RK56rJtDL84wWwEwg0BeymnKnYtARgQSO/JCgdU8?=
 =?us-ascii?Q?Jbbms8FQowtuiV23QqMxQWRKDA0YPIr+CjFagS6JXbs+muEKqhJpLipzBF8N?=
 =?us-ascii?Q?o6zfGZrbv1vbsGUy+5glBmDnBEdIQE+rSONrFgC/lcvPcxOKka0O999iAUdW?=
 =?us-ascii?Q?FnieT2P4a9eLp8PxNDVVVl8nOvg1riUQ+nR4SjX1/506T4lFCsoeEmFb59gT?=
 =?us-ascii?Q?RhucRb159g+Q7tYGLlPLyKxUUncpWQzcD2N7VLiyN0/ArnP+Krpg2QRrSbjr?=
 =?us-ascii?Q?fe7LiqWe+NypnFob4W7oVsoYA5pt8vnOV1r8oaR5tFYh3z1ez0xyZJ6XW5xP?=
 =?us-ascii?Q?/GqM9cguAz4QTrlAP/Jo24KIyMP9XJO3LYhuo+75pETqQku6lRV6eDMb4jgA?=
 =?us-ascii?Q?a2RuNniWb6Okehvy5ly7KVi/aL5FJrvTIKZUHasL9VbF9S1f2jglxhl2V3Ri?=
 =?us-ascii?Q?3B/5/kX5wtYa3UJFWfRMuql0QFqLfIS4FB4s0HzuhmxVOlXu3xDY5H4zJg6t?=
 =?us-ascii?Q?uv/Bq1gd0Xir/WJth3vzKPf6lLa1c3guk6vBuJi/U2Ga44S8yARAeoUJplW9?=
 =?us-ascii?Q?EDjshgEnjb9udcLx8/RCbimUNg3EGjEQ/w5qG5ohI3llGx8WKGnMWky8Y31p?=
 =?us-ascii?Q?6ttIEw6sCCLISB5F8npY+kiP0UolVq1ajjO4C4d/x0ArpelBa8AMcPBXiKDF?=
 =?us-ascii?Q?CR21gx7/GSB9nxLOBdQapsIkvhHCMQguwCDwpDzOBj/DZpLPwaicGSqRSml7?=
 =?us-ascii?Q?T4a+4PNmxW57CofrwkRAgG7wNWWgJ30CjX9Se2GbPtZCyjnzEhqMoz5Um3A9?=
 =?us-ascii?Q?y3KP3jvgFCQulNk4WOWZ0jX8OCXvBHUd0ka9RP9J3eIWJGp+EoF6IZvJnv2d?=
 =?us-ascii?Q?s/2bVlg/zJ4gwLwFcvpPA+02sZcxTigQbCRtQcoYVsPv4482RLNFaKvrQ+Zg?=
 =?us-ascii?Q?hjQ9McW96fVSkixpiWBmOKoIJfsGk+USdp5n+DR9zWxj0ltwNRKe8ky6uWIz?=
 =?us-ascii?Q?YAf9nACphaofmvIR3gb8OttfPhdcSfdpQiXeB4c4Kqw6KP/zd29lKvrv0tKf?=
 =?us-ascii?Q?eFzZXo9w4wrSMqee1Z58lnb9hZY8z0efLh1Sm8SIosSXLWP7G55IU/DO2Sbp?=
 =?us-ascii?Q?tnfP2Fnu1NjBppHbr0rK9JMX6teVv9FChHVaX2x928aJDSvihN5UkgGxbjb1?=
 =?us-ascii?Q?CCj5L7NknUDU+vUhFFNdfVS+or9vadZCr/aygzvpuzhg2/o+8Peonbd5L7Ed?=
 =?us-ascii?Q?jScnUlFl3OFBTVAJkZNHI6qkL+x/8fnUTXQWXfLBk34WFoo+i2kuF9VsC7/y?=
 =?us-ascii?Q?3yFahcmp3VyqnbjvJOiBsEmq+S2QXMIK7nJgJWpXDe+m5fQJ6bJYyJ382dVV?=
 =?us-ascii?Q?5dx0r/Kz93R+bKgVtZ6L/bneQo/gLEax0dup/1xolO5ChTLiH1RenYUARD1T?=
 =?us-ascii?Q?Dhly2/YorL8lPp3xfSc15S57KZn0zUGsV7oB+Un05kzBPjV53RZbqdN84qcw?=
 =?us-ascii?Q?a4s1FU4YAGK0Ds4XV2WLWKQWrOmCuPB+1X7B2aD2IQTbiQZM9ZFA1Y8FnejN?=
 =?us-ascii?Q?cPO9w9Z5C2RFRXFvE3G6s3BTnQvFnN3bAnU7wzrDK44g6elfZxuSeK8BxQ92?=
 =?us-ascii?Q?DkYkWHjlRl5CQsV0822QgYEqmoHO6QZNdo5bPvFwBMMZaLLiRSJ5ECTrtE32?=
 =?us-ascii?Q?VexKielA5QkbNUueWoD5uh45hsKfL4O9ZoYjuNW7kHKaCLukVuFBlNKj+trP?=
 =?us-ascii?Q?BV4OLEG9Fw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441c8614-cf74-4f32-0832-08de684eaa85
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:01.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLw+rvgWk666TztTgOxtp/7vlQnpWHDBB04IZsFnligVd3u8uMyxQR/aWUfrGs056hkgRKvh2SQF9dc9KRBXag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Extract the SEC2 booter loading sequence into a dedicated helper
function. This is a *almost* pure refactoring with no behavior change,
done in preparation for adding an alternative FSP boot path. The one
slight difference is that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Cc: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 67 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 465c18e4c888..6191986fc6b5 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -120,6 +120,40 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        let booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -146,15 +180,6 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
@@ -182,29 +207,7 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
-            bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev,
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
-
-        if mbox0 != 0 {
-            dev_err!(
-                pdev,
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.53.0


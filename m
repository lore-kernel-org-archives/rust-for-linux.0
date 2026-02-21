Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC3132D443;
	Sat, 21 Feb 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639872; cv=fail; b=tWNLEYksEycf2JJ5aCmxIv23mHlRW/bfhKOc/fXmox6YPCtuNdYW30o98i0R3TvtomJ7IDEVwbdRrWJzT+fErbdpXbGOELd9k/Ftisb34h69hQUBKmgyzhosmC295lrTg5jXhPVkJSz1s8Qej7vZy4pJwNV4tscOzVfScO8AMXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639872; c=relaxed/simple;
	bh=DZoHgOSPHh39Pka19wA4MXFYdUWV4OI1AOMDJxwPRr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0z253NJsiYj184O/kZvJGvxeuuJ/9pBITHefDLbQwdS1jSW77UHAATuFHO5xvtvFccE0pwCnU1ug+gIKS4nOONpISYOFH4tFpkpnr9l5slsCSsdDMuE0FPRbfaseO96el3pQ31T57H3PaaiXLeF4x0IDUEmojKvgH2+8oKA3Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eQq9w5PR; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eQq9w5PR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8IY4sTIj+fWYEYTa1B6qADlDk570hfbHIMUAddQ5zleMDM9j9UBIVMJe94zPKJDkVxT4d6e2lASWIS/gm6m/4OG7KMSmfz4jOOz31ykCkf/OIdtfrzKfkX6rGEThFbDoi/rI0qgE18nmeHnfbUzqK1pUgccryjKVsH+qVTAd8z2uA86whlgoQQwRUkFaEddZBlPJMMNKBXTJX453KvwzKQG3kX4z7EFEZCm8X7Z6qiMkdcZury9V18wqVd7MfUskTq2Plh6LUW7HS1nArP7/8icsEPzwOL+PGGSGFWltNOPW020I5G2hcmIEjqPeO+pi/SHXV2B2ACyushXEjCAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN5NsxO3NKLBobzcrwckLoEkVMh/rRKRwtkmV0EOSow=;
 b=blOSuds/0EOEeMxWK0vexlvBpSsNj7LTnRF4aDP6HMH7QNyByyIe2l+2n/7AQE7PCFiHfrCdMZ3Kqcb3zfAX71fgUVDKad5LLVpMWZADZ3p1hv6Le+O9KaPFBEmXp4Fgf3NBS/UsJtMq8AGBHOykUCnNeFZlrMynrqBd5Ds5WTsEfXmPR4Y/ZL3wVHoAohEQqm3JoQxQKLGILdTni+eiXpYV34nZzW7wYWWSTdDUZAW4MQ3pLUXLc4znzcK0n5pMRGiVsQVX/xigg7kP+kCPR0i/kgqTtBiQUZv0TpRGogaeHRqlSj6lRLjxGQsC46+Omv7SBr8/P/CXAzM/ZxM+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN5NsxO3NKLBobzcrwckLoEkVMh/rRKRwtkmV0EOSow=;
 b=eQq9w5PRrdahOgnf1Jut1aNEcXiG6QR0GGtT4QJ+VOhVpFmqwO4lsCXarfKQgY9ZW7Zx1cKocdcofNxz+1GhxkpVESypaJOUdilKAvkaEndJU1f5R+hqFdRvuqyDUVOhJGk0esult9ciAN+nFEBDBP4//1Pq2P+OguLnz5d1LjIbAxrZ4t0wI7Ry9rhzCMm2Xt1o2GR7kx6Y9zC6h1Hyvrz/whAfDkdO/OmatNLjd94uY5yYZSHZuVHnkjue6ylZ72PI9/2i/F8vINsmVByPSZ93roCLmUrt+RpLZDjIlEo1UIeKjSlW3e5kEVO5dopl1atiPVp9FP+Lym5PaXzc5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 02:11:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:03 +0000
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
Subject: [PATCH v5 35/38] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Fri, 20 Feb 2026 18:09:49 -0800
Message-ID: <20260221020952.412352-36-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4718f0-03c6-4836-33b9-08de70ee6778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MuM/y6sli7yAbrW8ie6X2Wr/xCBTdBou5BuSHGGxM8J8JVVVygllgpjQWlI0?=
 =?us-ascii?Q?EL9sqj/Nk4WLoTDmLnEMp7glpRmR9bXR0dHo15kSCrf/CE3uruvasKO1hiIG?=
 =?us-ascii?Q?9XvHnKd7OzNcijLxD1nInnIHsgmw7UoqZ10qjPgE2zBv0Fht0CYo+n7HblXX?=
 =?us-ascii?Q?4RJSYGS6hLKjx4/bhP+ffYgQzf3NePwn4yEIDcpr93i5M1tazmyEagH7pdUz?=
 =?us-ascii?Q?/B7T/WxxK8VJBqMVH74npd+ISwBTcPE1kjTFf8p2w+QhtmrdiHFjLuT+2UBO?=
 =?us-ascii?Q?tGqahGe5uyI3bybAsmivMilI50uMuT0AkNu/x39jDg2uf3Tgyr+hNePHWnLH?=
 =?us-ascii?Q?kbKGMOXPM64cOJORFEqmFBByp8/ZCpomv9OMnVMZV+Vw0RPx183G5Fpo+Mzq?=
 =?us-ascii?Q?IaPWwGnQQuZkjzZvB2szPuF3+Cf4cBa2PhdJBMsICkDeke4K1F78MGbx8Uvk?=
 =?us-ascii?Q?VVF5XugdsBgmoJv4IiTX9oR/L7Hhmjpi4ANTfvINZc1083nJzc+bJY6Zp/71?=
 =?us-ascii?Q?DzDePhsKjsPjDufsc8ondLfXjxRsxhzKB2E1exB7KB1p0teGNLJyAgWYuQGs?=
 =?us-ascii?Q?eD4bgvgNuL9V2LpKGjYRKWmKXmVwEuu95VTnqJaF7a9moY+06syfkCwemLa1?=
 =?us-ascii?Q?w5CE8hIuxA2E8hUANz877KR+uTXoGXkscNYD9gLKFQNSLJTGySOB61adlXsK?=
 =?us-ascii?Q?BXRqiYabxt1h19yx4H7cmWjTo1Vhk+hg4yvfXz+7cx3VJgX9RpYLfZTGzQcc?=
 =?us-ascii?Q?Q2dq4BjZA1FFcPKghr7hjxDCWM6rdbzQQwECCWMkTn5MvffZ2eh5liZ3sMWu?=
 =?us-ascii?Q?E4MX415vnm1b96XBJ+d/e3h7qthGq1akzrukHlCda+cK5KpYwrxEG5LANZ5O?=
 =?us-ascii?Q?XoyX4YyDcR7buKY0ksX8RSqhsBj+P+76xjVpUzLWoCZOo1PwE4diP4CSj/CC?=
 =?us-ascii?Q?qKJD99HvNwaa3EV2CtJq28MyqfbEb2k5w+RvQN+f71xMkQ+aIRtVQgJXBgD+?=
 =?us-ascii?Q?9DmIG2Xd5ETurbaYKzd2oQy6sM6CS6If7ONHT32W5WN6cnBUufRjisqPRBZ2?=
 =?us-ascii?Q?KQw0GeZqUWay4MwuHQrH2CN4Kc0ZETA2+2y2My2WyLQNs+J2vCx1PResKzP7?=
 =?us-ascii?Q?p3EfoVL3OqbT67WHp6+0b41WEW69jgfh0+1atRSrBMrpM/qXZYsbD37UAhd8?=
 =?us-ascii?Q?xwylz4Ui9gH/0FH6mcoAoC3eAxEX8HIZ1Nyi/KbnD1QFBEFjqRc3jVmJlqUI?=
 =?us-ascii?Q?j+x42o+66X6fjT5k2MOGyIxYQenFUPGMwbqDm2+CMBm5dKAJFRmTNYi8T14u?=
 =?us-ascii?Q?AzpWxC/ow0wVb5by3OgnoiZP/7t8WmzYbEbeuYaOOGCy0j3siIdCqNVw3sGx?=
 =?us-ascii?Q?9thv0sxZiPL1SGqnla8Euaj4gzaXx0V+Zm/izaUAyHlIhYcuOwHdYiYGs3Tx?=
 =?us-ascii?Q?9tLPpyW6BUAQm9AfnF5nJ+1TTGlxZngM/Hcwqn5RkE8YYoJHQKLKPD+slI+S?=
 =?us-ascii?Q?1daCcgOEhCx8kr5nUr0LQUgYwKIFBomguyWD1+tXC/rDWx+FZkLKPPslVq8M?=
 =?us-ascii?Q?YC3Oogy1RrTew4ktNCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sAe1g5e1AQLQ0KWENsY0ttPZifY9e3SX14yLgOXX0O0KM5vhJzPIVEz3RqCR?=
 =?us-ascii?Q?BzeuRQLxKEo/s9vVPpusSvt2JRmpny8jMutynnAXF/AQKkEkyq5FsIU4RP4n?=
 =?us-ascii?Q?BqZBeBdKz05jiUkpGwMjBdEKzyZw5HeZ3ZB85/fn0sF3gy1uSKkK63rctR1r?=
 =?us-ascii?Q?ObLbyHy9tKlqZfrfh6oS7kHv4bna6kzuaVhBkZ+7+09+cQfB55elVlwe14mn?=
 =?us-ascii?Q?DsC7klB2p9NXUYBQq/+8k3n/HLRUU670xjIEcIMFlS997dyoHxrYU7N+hvqV?=
 =?us-ascii?Q?aUq/VZvZUVAk4WUEPOn2ugyUIJVqVnCQDInXAvZuA3LFyu4DoBxflFklRe3O?=
 =?us-ascii?Q?L1P6EXToChHUiqZOpbKwO+6PN29yjslMnUD+AiBAy/xB+xdbf+BSEEpJHVVI?=
 =?us-ascii?Q?ejv+rOGZX7k0p5NxCZh0zySSUKLMcM8odE17g67p1ZSUJRdaNCnDqilEO1ch?=
 =?us-ascii?Q?R23jpNMtY6JYOWDKyXtLDiVqvGl/0gRf1N/PqaFoJPOARPB44KM8gwhO5+UE?=
 =?us-ascii?Q?lMpnmfqdOdHsR9gIi77V3zSZE1vpXDH29ByKs+skpfG9YbI6ie2UrZZA732r?=
 =?us-ascii?Q?VyF7h02jq8Hbvxmavs3dhhfx5TRXTOaG2of5Kbfs0dLN17vjLX1bDYuulwEn?=
 =?us-ascii?Q?Fq9qtrD6ebwXokxJlHd1wD6A4lqg8TXRlmU6pKlkWLVbB3d53LoBtZYkqK6x?=
 =?us-ascii?Q?nqE58JpUHtlJe08Yoi0BI7FIbWKwqb8gmENTb5tDR+86x2Qoaj4n3lP3xyGT?=
 =?us-ascii?Q?k/LGu7UjpUgqnytyR126tABmhvjR6yvTdYRwu0dSEy0PAlnUh8OLPdI1hEN4?=
 =?us-ascii?Q?i8QC22Tczm3b/N09Aop4e+dGiiaRHVDfj5YfKqzZKCpPxW18xu9fEa9aFIYK?=
 =?us-ascii?Q?V60zhJ6sRmPqtraB6uXcTOm0jpseNy1uB7A61e19ihv8UqBkkQVA74u8SFo8?=
 =?us-ascii?Q?Wnh/4aOsO4/5QNlC4aR4tSm094xE3Dmt5wBSnrWLyDcq6qQ5cE10qWsbmCJ0?=
 =?us-ascii?Q?ZLkg++E93rVd0B4nqz1qJHGZCaQiLSVYZ1YQ4uLW5vcfB5oAQtGPBDsbV0W0?=
 =?us-ascii?Q?sg3JxOWZSU8tM1uWIX8yycRoXDLe9YRAhpeMbCVi5Mk7lkj7jvRobdWIqCJQ?=
 =?us-ascii?Q?RRLHoNYb0Zj5eiBLPhWcEM2PBpf6jC/H1dNTgNHP0fGl/QALV4vO7H4q+3Uu?=
 =?us-ascii?Q?KrMj5Ma58s5Vm6FxbtjDR5JonBrNBIHJZRfsqiml3hRZU0rUFSIoq2GbONDa?=
 =?us-ascii?Q?WkjxvKhKOWZNEQh0kwj2I9bZPwBf5uu0NYRVi1myEG5rBm+kN9i4rl1inI6w?=
 =?us-ascii?Q?7cTso1Kqw0VWy9FU7cjW50kWnWqGk4Bd5IeTxzHcKVRonDiX82nBuP79hlTJ?=
 =?us-ascii?Q?ARrgpgkJ4RwoaGq25Mvi5WYBCO0DkH3W7genuJq06+g4E4LluIFjSaKAxoCY?=
 =?us-ascii?Q?Zm8gUKK3FCmGawP+LBqkp05nkbTgNBokVvMHqvW/6jXsSuhinixxhylGgl/D?=
 =?us-ascii?Q?V23TV0N2xvImLzWlSwO6/3lLjpRjwRX1CNhRlHvBfrgk4QQSw74qy5HDeTFM?=
 =?us-ascii?Q?Y6vDT4YfUIH+sa5nLlfY2FBmyZYQ04CCi6i0bA+E7xInOUv19c/0JR3kdOMu?=
 =?us-ascii?Q?0WtfCkfjClTuBTRTO12BbznTAYMtiKYtY+djjXBymSgwAeMJKEpotqUnwHOu?=
 =?us-ascii?Q?z3z9ZpdgqvZg9aOY3HljZ+ZK0tY+CLIXbeRDjexxFUiAm/FzmmlCnP6sKDUX?=
 =?us-ascii?Q?2w6EMwnkGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4718f0-03c6-4836-33b9-08de70ee6778
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:37.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E+6yL1jSwgRFFiMnffLs2kDnrwXeZ/6Vc2MlhRwm/7Au2q8LA5Dr3PmeN8YuVHp06wR1mAoFXChzmuBFTOW5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

Hopper and Blackwell GPUs use a different PCI config space mirror
address (0x088000) compared to older architectures (0x088480). Update
SetSystemInfo to accept a chipset parameter and select the correct
address based on architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5f3207bf7797..0db2c58e0765 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -248,7 +248,7 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..e6a9a1fc6296 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 
 use crate::{
     driver::Bar0,
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -37,12 +38,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -52,7 +54,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 470d8edb62ff..fe8f56ba3e80 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -10,7 +10,13 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
@@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.53.0


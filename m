Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03A32695E;
	Sat, 21 Feb 2026 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639865; cv=fail; b=LBXqDOnUk42w0O9cfnU5/8tGstZIzhOVnGAq78bJC1JJ4o1+lExfVD6TdOkmHrMtoak13/GbdMjLbNp5vn/L/BMl99ExDlrLqc82SC9TUbiGBdLhL8EojH8/Roij3bBUXqxi/hnnu3wHsWckeRUDtdrq8u2mN8QdB3KpKnzl3tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639865; c=relaxed/simple;
	bh=GHP0lRM8zQ3go2BHVjJPcC2dqepDn28Wk1LLKGgph6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XngDXEZSxM9MviPmJKYzlr8htrRWIfXIbn9F2+ujlyBLMgKhEVYhH0jIeRx5lxJUFkUFTmHrVDbn01YsZ4LthcpngpSPb9zfKvGDIouHya7GpTHk0VvDsfdHKRKiW84w/Zq+CfSpGuHyJWtw8skFiqMvR8QFX26axbS0CEmzbn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UVppLMb/; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UVppLMb/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPNEWId8OOIhkZP7eHwzDqiq5Sb9LOk083eEsMusx5SZlcqwsQkx62FQaieSUWPtt+O0AA58XBdTdrmbRjJxkqZkg42NW7VSzs9asKaUkIRGC6XH2VcFZgDJLm09To5flz619i0GARHx17RBo1C/LpxlVVJJr0QeR8xEnoqSI7Q/Ipgd8j6XHT69VuDe3c7DLKaQFAFiWvAwovPuBkD1SUQZHTyN3mJEeezs/fvp8grSwga+abu0i/G5X10xJ6UTVaJtexiT7M7uhSeafTHFrDW4TyAyr4XwJ+wrjmyFj9WSg5SkU/HHbqLSpnbNxVTMv+RX7mLGkkP6zfSdZ1eNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luB182UPf9eRW4Tx7aKyWpRE6DIWCLrH0PaNzHkw6tk=;
 b=KX/lnoxGmH+JjzMKlSSkQcYBGbUAJmBR12cDVhr+3Eu9LQ6oLNA2Z1F2BtIC0yEVL7BQTSJh5+saVhYZ7BuN+WtDJE9qJ5EDvsd3+U008ZybV6/NvSMkwyxtZJcA23C4dHkMm4GYZ/pgPwOUAE87aEyeuQB5emUbNtXhc1U8NWqAYD3irVftPGAL0yNdYRwaruS84ItFL7DK2viIvDPCicSemQn7lls7HX6xNrkQJ5k0e10UCuWDXaMu9p8GD/j94mBlBRpkKyypG43RuO/4D/wnyFT8pTxoWMXaKbvt/m4uyT/0LdOjEKDPSWMjwsn+e7m4Cy99ZNvUyM9Hw33p4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luB182UPf9eRW4Tx7aKyWpRE6DIWCLrH0PaNzHkw6tk=;
 b=UVppLMb/gxYktAGT/fq/X4bDWsqNRgdDqgPGZp+fo27IlsprmRG3K1YDHHTseqm5WVNawJUaZH5RvPH7M0tcQNkhiDimOQkhUvKXNIi3n2uLg8vAkbI3KbXUAChxD797U2o+OJk0JMCd/IpJzLXTTRm8dL6yS9TAECOLvsvhJxba06JafCpZX2wRaaMRyoqGT88NY1Oa1FdovskcJmn6IaF7xm9J6GWM3prKoNqryiOplHL/ZvZW4mJgHWImHqhvNo5LASngwtEKcEeGTlEGTe3BQBZGESiiZMgj4KNcH8TALOKvmxPmfNlpKlh2YEAivkpIwNrcMYj4haAXBPo2wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:18 +0000
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
Subject: [PATCH v5 18/38] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Fri, 20 Feb 2026 18:09:32 -0800
Message-ID: <20260221020952.412352-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d67fa51-ee9b-4b75-bdd8-08de70ee5ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZP7+4wQsMZA4WZBQYQn8G0AOPP6wqYfgRXHN/IuGK7q68bY9SxZMTgukhPiz?=
 =?us-ascii?Q?p7vqK9H1tHDQwHNW6ikWLtbbP3KO2vOwA0cZ7l+lArYOFZDhBcR+KVMm7YIz?=
 =?us-ascii?Q?GV4bfCQ4iEiKZdC1h3IsqcMxcl3MJWDNDu25EgpXzsjEl7y/JTh4cFCm8KyK?=
 =?us-ascii?Q?SKF2z2KySn44DvUZh9YPRmJsF4pC+RBxnkfAvuBXemDWxsbR2LmGOfCdETcP?=
 =?us-ascii?Q?INSAOP3Qj8Ytv66GRG/159TUddBLyYG5sjZuXQXyv1HPCRK3DU8lQ9mlzXjI?=
 =?us-ascii?Q?K/VlhYyFU2j2DHEiXNc0webDcZEhSV3bGLfJg8ip7bxpW/KLMGCtmp3fn6UH?=
 =?us-ascii?Q?oH/qZmSGjCdWr7VAGLMLAgwqFeNTDbmS6z2yHqIm4j5QTOPcqSNOx8QYQHOw?=
 =?us-ascii?Q?v4klbsKToJnakXsz8VL14nYQMzpJ/dgrKdNFQOZkXeWe4i57pZ1JwU4xGeAD?=
 =?us-ascii?Q?9PV4Auk7sULQ92PPbeKG2Des48D7JJxA9IISQCOQ3hqGwUaSCcEmRi64y8HW?=
 =?us-ascii?Q?Ql4RkniiCYH2ItDeCqxfcJpM7CwKF//OTHMH4wGFqpMm/VZUF7OtOB7ZOr7g?=
 =?us-ascii?Q?MYroC0Y0ulk/5yuMamMGHupmYkdA0RKeirsEY1Zo/PWfM6u0/Mmb168bzS2c?=
 =?us-ascii?Q?/9JBzESdmiOtuzXVpL5H4OLJPbNqkMuiW+/PKn2X3HppJkwWe7pfOaeGNMBf?=
 =?us-ascii?Q?u+nFrxYlwp07kxlcPfr3c8yrhogYBmhtzWamv/yhiRMCZRIk3GHVbk4swvLA?=
 =?us-ascii?Q?vp34OB9vWtc4BVrHKYeahNB2l0NylZ1enfoWgIT2sOs9sCf633CNKWzrxLSU?=
 =?us-ascii?Q?2+RzUgPCmZDtZ42ZU3Dm/wrcLPS/rDc1EqkT3uuYPSdeD8q8myTt+8kN/afD?=
 =?us-ascii?Q?l1rQJb4UXy7poN/5KaEgK5tGnDXvVymSHL2oUF8EqXplmJduJ7daPSZvaT+d?=
 =?us-ascii?Q?HWFw5OY3hP3BgdugO40i3rn9OCSS1jF7iG+/ukvBXuzWWxStM6ExZcmsXUNd?=
 =?us-ascii?Q?N3oEkIVj+jx5RWLPuFFovyypi64A9+updA1xmIRyZlpp1HGOuFMBPgiDP3d2?=
 =?us-ascii?Q?VrWQK3igQ2Z4qR/7OG1Bf2ErLiEVphu9/+BlZK9hL5rq8OvI5fV2yYD9zmq9?=
 =?us-ascii?Q?lfTcE3FC3M3aTfkEvJQZaVx+n6qVszRv4ku/SvnABHVOn/Ym0Xhtyl20UmJM?=
 =?us-ascii?Q?cJn+LcmLbgRDTbOIll2YhYA2Bhfo+q5wR0MbIHQA6Cft5TJ53M0OrYXJhjVN?=
 =?us-ascii?Q?oESndkJnQbNMqCBjMGvlLFbBSFaGTIM2P9u3inJssCWCyWXus6VRpK6BAetB?=
 =?us-ascii?Q?P/Dz+Fg5vFUdL55UuQctX8xUm33DarNfk4ixRjfOwd6czgI4NWHlRiJqTe3D?=
 =?us-ascii?Q?KK9pCyeew9q5toMehfCzohQd4rhTse9eZ6Xi97kglyGU04aYywlwM6WA+URU?=
 =?us-ascii?Q?+9o+UWkrvIsWR0CDldo8+/lmSYBEXsunR6hswg/Pi6eRYlJRdFAjOvNhTUHJ?=
 =?us-ascii?Q?3MSmdpgjq+cYcH4r1SWuI/+VYu+W3X+w+P1IdxmN/6Mj6dCxCRBznFkelt4R?=
 =?us-ascii?Q?zPLolfOtJ+nsRpXO6qw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hVmmnLw+Gu+FUREGU0+/IBtCcKxrFTJXE9AtSDLbchCgywPvdXuvwII0aCLZ?=
 =?us-ascii?Q?2Of5mRxZriek+hPhZDuB1/m1qhnx5yjt1IJhHYk61xiXqvcigW7YhDQYe7jU?=
 =?us-ascii?Q?WtmAcUSUuxhuWOCDI1F2CIYAZnbs1KIZ76Wrevj/Vs6ggjED40SdAQyReLsK?=
 =?us-ascii?Q?yyF2bVUaQzIFFnvJbGlBr8D9GFkbu7PIYwaKLlYo4H84885bTSTxGUWG9kO4?=
 =?us-ascii?Q?ArdlD+ChyJu968yHsteBcccil/RIJSTWhIyEOhOfrObEtppJGYSRIPETKLZA?=
 =?us-ascii?Q?ZucKC6jmrpf8lvtGGt9SaedWZz+nCETTeO0G5AfG5Lhi5/JhOGMRaUW0udjn?=
 =?us-ascii?Q?BfPkC+WGzFy3nmXbHbOo8LB+RB3/mbZ0E4SlOCRSaOoClo5MDCkK2ArQKLMD?=
 =?us-ascii?Q?5EVTN7Aq7aAcrc+6c6wKccbmF9vWxXUxjrM4/prxUPtAESoE3UWD0R2YX8Du?=
 =?us-ascii?Q?YMKJagRhKnAJz1UHwO9HhcxoACSh1m1NubIm1NGrSFIgy2cxyaJy8kcn8OTb?=
 =?us-ascii?Q?YVmt8I28jkJpyBWyfjMwMHw1myVU8YGkFjHa7VCQS9In6LhB89q0MRWkrewi?=
 =?us-ascii?Q?aFcn/3PkA75Qzsn/R80siD8lwp3FGjdt1XT5IX+4OC3NwPDLIod5TCV8BT39?=
 =?us-ascii?Q?Qln+6vsLLtMk5MDw/ldyVkj3qruxT6F4ULv9Ht+lxntn4Co+/XXOWJA21Wr2?=
 =?us-ascii?Q?Yv6fCcqPvlG6xWrNbuuuftfpx8Bd5PN+whKhHOcM/3tp9kf/O8SdcZx0kSbc?=
 =?us-ascii?Q?pwrkP7UP/DBmDOJSfoNdfllL6G0Zkj1tpA0oTNSn58QtY9bl9cQ7n7TaK9x3?=
 =?us-ascii?Q?23K7KAyrPoB0kzNMQtab1rb65brAtVFO3wPAS0EHcjprb6wGXvZgeeTE/E1z?=
 =?us-ascii?Q?X2f4BUf7Y13KV1foupe7DSaftuxDc36UudHQH6+vNkrNTXun9k5wJQQChOty?=
 =?us-ascii?Q?kbykoQaseq+5CZvtiwhudul8tj9Tom7Xt5aURTyHxvTGHE5wazp0pR5LRY2+?=
 =?us-ascii?Q?8V4JotUeF7AjbTFDw+XHn3cAyaW57FaQAdMqztQAVv9+Q0fdyE8aSRXG2jVL?=
 =?us-ascii?Q?RsRZFJ3WBt08MuK3SW2AAZ446/pHOryz9fyTuHq77Um/MXB/eBkEEohQXfL2?=
 =?us-ascii?Q?mKZeVC7qpR5qrK5iJV8k3S1mqOh8y4+36Dqxd4WXMyj9+f4jPVu1+Jc2V4Zm?=
 =?us-ascii?Q?KWJJZmne47nuiryhZf8NjM8uSAIZ3Nf8XjT/qo7t5BYqVS0t9nHcEg0niHyG?=
 =?us-ascii?Q?rxrk8DAI/C+YmVQeMbv0gWcwtq24SFBhp/eZMU3xJ+p8XuT3Y5O6qhxwiWNg?=
 =?us-ascii?Q?kWrrmNVZX1H2EokWHeQGx+YR7HYS7B7t+albF9u/F/KEFUyAxkjVURmgH2Mj?=
 =?us-ascii?Q?o3TY8pki76HiGzARh1k3X/A1bZ/uZDy/VugiCy1hQf5K/X4wNw+dDdhZTvfb?=
 =?us-ascii?Q?hjcTCDZMWdmQIPuo0lFgqFEV9HVTne1SNprNyTbSQg8vkeRjKw3IgKrAwno2?=
 =?us-ascii?Q?FTGgftj8D8J++v9iQLNLYDODJ++le1W8LTp6MqVJCNUFXFfaxhLFo82yTZRJ?=
 =?us-ascii?Q?yOArj+siamiNx4xQhsCl3402WfC16k6RQGrNdGOWM4MzoNQll9S3FvcqxaOH?=
 =?us-ascii?Q?yZBZeT3gemN2K0TIs679j1VXg6mjD5ChFbhNQYLEtOm8EpsTCIMN8tltAlxH?=
 =?us-ascii?Q?p7mu1kCjkhmjuIf6MHjBlIBNaeolMUJSprUeC0r1tnwdBSZtcxa8zc/tGrSJ?=
 =?us-ascii?Q?+SHzBUvmvg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d67fa51-ee9b-4b75-bdd8-08de70ee5ac3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:16.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5Qj8yDpn3LPQCjKMWI1PGjIyjhJ1TlzC3oKGEqhggMc/AO+d4r6SJW7UrAfZ69hZGCfjMMYVa1aXV5ZUD+RXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..a0cfb4442df1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -33,6 +33,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..c5ba1c2412cd
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.53.0


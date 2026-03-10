Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875532D451;
	Tue, 10 Mar 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108709; cv=fail; b=OvnnFeE4BmciCyW02LZ066RtUM9xe+l9PFn7nNtwMuPluBQw5T0hm3MkyD9fQBVOkjRMlb65FaEVkH/l+O6WRbPBRxmQXU/LOmFTzuF8xlSyP1WbVa2laOT9SWiuyD9lFJ+0/0Sx/neYxL+6y/y4QlFcW2ofAv9iJAUxr60dFws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108709; c=relaxed/simple;
	bh=k+gpqAeUWYyO5kBTqMJkOzBX+/aocEv+vr18ueDemaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lREPyaBxuMS91ujTqhb3VGYUt1bFAu/KNAHbMJLR/80arLyD0lE+IsjHEXTT3M6WsgQNQoBK0+n6HYKWNj/G6Ufbub2fsHb6YDPfCmHRQ+aOzn4FEQoqzUvA1jDLi93mda1+p6qDf+03AxP2UnTn33AKI9rdyc8CzF0io8uRMNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iFuqfIb6; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iFuqfIb6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PT02DPQAY/737mpxnEVCb7ARjxx9zD4aCM+CMQU9GGw50sAhEYZ9sSth+gx4f0av6QP/p2mQ5hPklUW4fMlXTFX1SJg8WuKa50YyBkBvSi0Ab+jq3BIm3W0nYHYSovojQ+qg0WQSFgY6VSiqoEaXdgFile672D8gclgSIrBvJOBqk428xnYb5CKIlcrk4Yjpll9s6i1amauhWustBNPSYkMNPVH0XcrJQz8eFT8lIu4m66muzmE4pYonZZzsvvQmxzQC+g9RKrAGODXxAC6dzjoN1j30Kuu0qwrpcTpnaLEiR4Bo+Znr2qVttQ3NNelt8O87J7Yc2KLTtcLX730qBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5wxkVdqhigmMDDG5jyDgU9y0kjPNH6pefCIZy4Bkyk=;
 b=oNLcQXo8kdFWWjfEFfJS6dHI39gKifuutOKnq3HSxzVaJnI5Oo1Su4lV48AKVeiW6dAMMQXGayPJJ2na3T5NCcI+kOtNp2aEq86+GosxC6mNmqQMkP/UEt1+9TXEcDOZJMFtTdI/TvtLoLsqb1ak2tc4SZVWYygOEdabZGGz7PgW4bOUaodZn9n5KxweW6MtyKZJLCHWSBwNPJ6dNHb4nvA9Ha7mis5BqCvfeRGhXuPMMZ1PH2V58DvmtXo7PnDfC6+RKN5hxjUrTTzmb8VFyNsJ4sxxEmOJLS0/0AnpyaCrDvog7O9O4LsTj0JFxaN+E4T1wqA6OxEyeWhnz8qqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5wxkVdqhigmMDDG5jyDgU9y0kjPNH6pefCIZy4Bkyk=;
 b=iFuqfIb6LkKvO6X1Oz3NcJFr3uTl3Ky6YHHUwt2/VeNr24Gno2I+zIpWHnTvhj3d0vH0Xy5UYG4teJMhjDRyE9uGlOji8SVZMq3PZX/x/WvaeUVrYFnjYZtktzXGHxRqcKLKzC4yu0KJGD9YPAdgY9f8/mbEl5741EdS1Oskf6yiJHTEDxF4za4xh4ZBtZRvt+B/cAnLS9p/o3JEg/mSCpbQQ/6RQ/hUgF6HDkVdy2oRRg07jXCZkilpTyVysxoS5osheNjPLMl8n5Jv6H7rXYeAICQ0lfegridtwU0fu5bd7kP1+K9Oaf8Au4l7vwFlMkcr+3tyMzftipFEJPOt/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:33 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v6 04/34] gpu: nova-core: factor .fwsignature* selection into a new find_gsp_sigs_section()
Date: Mon,  9 Mar 2026 19:10:54 -0700
Message-ID: <20260310021125.117855-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: d59d1832-d8a6-4156-653e-08de7e4a5a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	SovI1CsdVHu0/31lJe2MBB9w4AMbhlBhUCNrCwo5mwjbtFf4OugM92asbpSdbCYDYkyoDdfb2Lv6+LGSxuBUioEmd61OE1jgAezJ3goIWubcoSlzWokVGi59/b2ICrw47pnc40JlvvhE5waQbYCvR0Znmr/Rc6X4GPiLOiq4b9Z7gOTWqvFgKgFlzj6YJ8E2pcmZ/kcr1/JCkbtonhiS7tzp/fNmO2Z+/NdWm6NLCkck1sV7oK5JUQR9cu6MrvA9s7ik5pf3uJ7rbfULZnBtZwT6d6Q7E7J3BkC4HcA5lrdZ95J1b9bwVdhdxeKylVquN4TxLq3KebtPEehrzZyhOuide6r3Rew0/50uemwKRMCSqOTEoYD50kMRFosHLIptSJeIPLizSMZO68rqKaXuNercgz0awSvJgfxk7IscygD7xFdBqShFtCPbVVotPkUffjC/quT3L5Bl7nIGs3Vf7YyFbNiheZwMs3YdeUsCnek8y3RnFHgsPye2fYnCFRwn4udzRM2g46y1DRLbyhCh+x9vzfT9F0CRUmzPsKp8R84cxbIAg/PvJuuPyl42dtkzdwUFLQuSLtRd5v2R7VC+5ukexcp8Q7H2FKp8ohMGU3yLGO1rarTw82OZWSTL83DHC8uE/kOycJt5UxdNFj3lmRHjIUcQ86wbLv/LZPwGL2RjwSkxKG+ZePkdvi12EqjvUSVPxKKq8gM0m/xjaZos27LOSVRcQOycXb9vTZ9kuMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cq8mHCJuUGUJ2igPTo+f7/zuGANH9rpvSCpIu+GkfFvO1jMFQcMufc3dba/M?=
 =?us-ascii?Q?NqKgorRw9jQKk7atTW8XpBU/zwsBqDkD3QTzaxx8PWtoHydublO+GlzZxbIp?=
 =?us-ascii?Q?++oIA1T35edrSglY6NYpzpqBEKqL1O/zsObiFZSohrS6am39LPX5RA0RC+UV?=
 =?us-ascii?Q?08l+NfpMWjib65zIT4QfMYJX6BGUooZAUWBsA0eB7md6t0yE8Ch2C97WL7iM?=
 =?us-ascii?Q?Z7+YgpHN5pNEp5r6os2CbG08GTasl9q0q+wcrUos5wyqqziUaycTVyr+WSl+?=
 =?us-ascii?Q?B7AbCG9UmucWGpEZEyqhe7rs7k7vqaoWuN6zX7hk58oYkT1BbtNs2Vjgs1tW?=
 =?us-ascii?Q?+mxQck3lwLG1RbG0mO5CUU3Zuy3+6wekNYdcFCgaD3HTSPOrEeNISowAWH1t?=
 =?us-ascii?Q?GRd4iDIPc/HXHwt4H7gcE5f2dnn97XCWaPQZJu4ERUYAOx/3awZqxjs/SllT?=
 =?us-ascii?Q?G2nTWb4nBUeSWm764pdv9/ri9hnMFbjxdKOuf7sJUxKJhsJLdgPQo7Jc3ZLa?=
 =?us-ascii?Q?04AqBVmWTuYAUJpWqKn11XDbYNWzvMMwBwpDjtpIYFxXmB97slgTpr5sUOqU?=
 =?us-ascii?Q?BK+/9syumxxGblTJlFO/bs3PDm9fRGRXyFX5PYYny85wGeGkkm5+CNM2pho8?=
 =?us-ascii?Q?RBWeju01oAGXWWyA52PjEtf9xhz2ZS1e+b4Y/yfEUJZb0TE1Kgp7IxkkaEzo?=
 =?us-ascii?Q?m1X9TLpJriWvYL22Yk2gyaf6ZlXrjQmp1+S4fKcu+GaUEi/3wBLY8/ktAbXV?=
 =?us-ascii?Q?zl3lHc1sw5owAtafj2xNXWll7OHes8BUeDUo89OyPfWU3cwjSe0waSbybxlr?=
 =?us-ascii?Q?jVsk/2W+s9TR23peiR1AGshoH0MhfzyxIllsHKz1FcPXs+FbxXSshL9bcyat?=
 =?us-ascii?Q?q2jFga1VQxasFEvjfJLGuX5es7D/xR3DiduXVp0dUJOqcr5Qnu7FfSzJ9Wxy?=
 =?us-ascii?Q?698Hhxc2ygBalhAB09Rljd6oDVTTCbSgdrejCOSuxkiahEEKWq0KVzTUFHJh?=
 =?us-ascii?Q?MEUPUNP3ON9ZM6HQuC90xh9XXDVQR8LdpqtEsDdJ5dckmGYES52rAWZw3X8z?=
 =?us-ascii?Q?/PFvB5L/CpFuu8BQihR/1VddTfM+L6UmMupExyYzER1ylm1GejrH8yPW/uwe?=
 =?us-ascii?Q?298uLHls63F9hL8Hbc42BjKknHP5cNUYmMqFdiKP67NSNiFZGHDQ2uBfDqjS?=
 =?us-ascii?Q?ZtQ2s2JywR+id0Rrcw2wbgzIOhDyNXEL7npNjC5zL/PFyNopDv6jLEPLt4a8?=
 =?us-ascii?Q?rrGT6Ue2+aISj/qwkxPtBfGpfx9LqhJGtBDpFMo8mu3KkOo7ZkTn7PuBIGJx?=
 =?us-ascii?Q?TVK9jVP1hgTmC8VMVUb/dFs4iH+Su4AjF7hiMP2+//K0ZwABaMS5zJDf0tvg?=
 =?us-ascii?Q?pwtvR9KcDoL5BJChfUe0orU0timvq5NR4H4+6USv9cd9sCwneft1cuYXxJ8s?=
 =?us-ascii?Q?6DKKIx1MXG+lNxEfu8bCmW7ArBlv2eqvhWSQvp2FyV67ziQAYdfevZceimVQ?=
 =?us-ascii?Q?2SXxI2f/QZv5ISwM21N2JFhmzVRjuxy75Gg2vMr4ZL5qok+JM8asQ2WF00z5?=
 =?us-ascii?Q?TEuiRXjNeSbK1DxdTXZ8qHErNvD+lAUq1245YhVUGn/nRJ4uieLA7Ut0P544?=
 =?us-ascii?Q?3vxLLbclGIMWgyWaFfDGreWZ7BuFTKjX2KDUACQ9XWL8I9zSS++VAOCED73M?=
 =?us-ascii?Q?QO77BgTLTMXcAb/SHlCNF+NQOOshzzCpsf83iNwdvj220Kxrh/5b4XZQOaan?=
 =?us-ascii?Q?uO0n3LuN5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59d1832-d8a6-4156-653e-08de7e4a5a09
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:33.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOyZRN3ORXuitI6i+UBXaGxn87tNhMi0cxtfOgowHjsl4S4AOwIQ67Sj82bAdGIQohelmvYknTfTB1yycNbtTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Cc: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index bc2243450989..468f4b43574a 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => Some(".fwsignature_gb10x"),
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => Some(".fwsignature_gb20x"),
+                    // It's not possible to get here with a non-Blackwell chipset, but Rust doesn't
+                    // know that.
+                    _ => None,
+                }
+            }
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -211,35 +241,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::Blackwell => {
-                            // Distinguish between GB10x and GB20x series
-                            match chipset {
-                                // GB10x series: GB100, GB102
-                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
-                                // GB20x series: GB202, GB203, GB205, GB206, GB207
-                                Chipset::GB202
-                                | Chipset::GB203
-                                | Chipset::GB205
-                                | Chipset::GB206
-                                | Chipset::GB207 => ".fwsignature_gb20x",
-                                // It's not possible to get here with a non-Blackwell chipset, but
-                                // Rust doesn't know that.
-                                _ => return Err(ENOTSUPP),
-                            }
-                        }
-                    };
+                    let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0


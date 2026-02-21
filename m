Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC781337113;
	Sat, 21 Feb 2026 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639878; cv=fail; b=tgVdlF6xBa9tgsh30J0SdOi1BcXoVcPoexwffWHSJpEpbUVLxhRtsOKPi6RVPY9KX4NiJLY0G7RkJWqzfsx9nfZoED3zRGWQN9CrfHdwK8h4GLuwFhzt6h3hmR/7jXPDKj+NblR+EocmigqAgg9+r9x8VUcD1mWc5QdZzirnJ5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639878; c=relaxed/simple;
	bh=8B9KI0h/SOXfdxyDLcQwFhVHoZyk51khN1LQjKxWP2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nbNqQT+B1MNgSV/zjuHx1uVvcE1PgvQe8TU7QNLzRr0LVxV+PiO2+ARBDuIeoDtJGZRfN2pzne0bmK9lLpJcos7dDrIi8pd9CQTWnAOsw3X6UGzwbuVCHu78wcladzLVsg0jZdLT00+eVrSMi6M6dG0RVLzaU7anrUrlfmMoDUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h3comIVu; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h3comIVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAmrdVNryW11KWzD4MITGjeh9xIbBFxiI56nBN6XL66dsyoPzsQzV8xOhSx82fCtzpxuJO0A1AfHYaIWK8ouS1jzTHSB0BXJWHIb4StwnsHw1BTQGYXsQBfLmmAmA2T8uffA466MOdoUSzRtaUyhTlPYhl8G/hitLVHglLL/aResR+rl6LyOoX/xRXya4rAsw+qBGqVSIrqK84NylWkJX6fAQM8HKDdQE5/chDqJbxUlld+zlUMG7NuWpf9S+5JVVV6oQ2kNhKkSDBG1fYzbIJ9Joo/elh6N4Da4FkjE8KkMzXd7AfMJiEULwY3xkr0OrPAJWU919VTl5Cfgyla2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr37DCGkyqreoG6sk+9a5tUpfH4R6PPfQACuwPwSy2U=;
 b=dMDSPUTN8bUvnj32YyEpfh+7Qb9J7+546Lw9iOL8jB9zOqSMMsjF9FsR3ML8dMW1uCVoKIGM2uJeGqUleSCGqmMwlvKJkd/UuAMtkU2yNWdmrsIZlXcAc/ZNrOvDq55uXnkjk//etwlBfHtXQrsX6bsUepzevAMF0i1wJbs2XZrn5HEwMZvNLvdAcawbfkkr98TB20cmsZpcf8i2rIl6ot2XVpmAShrdTnKlief9XU3XFFa9po1wJ+PBnwxKuUrnNMcRqTcUzyQh8XPy9TnxylzTMoKDxpo2JQsFOENfq2YBuKeIsZ7Hq68KW2BszDGU1kJegzJc7Gru15d1PBz4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr37DCGkyqreoG6sk+9a5tUpfH4R6PPfQACuwPwSy2U=;
 b=h3comIVu3zHcOUNngcEI51eD7XOCosQWfe2h1AHyxZc77hN1TdnBaJdaoyYjjHy4pj8o/Dvtq6R5ynLTzALn7vD9sFYRdf5Exck8yCKVGLajEwDk//juhcHd2eV/4UqQ5/80L1/AbdYHMzcLskRs3CWdRyPUh3fg1KjXNhWKzArjRZWntXVBLQUiQeA8kDvOjiQxhl+YXt1VHJJU8+RU2ymSapNbN49j98AhnWk6fAVKJTtIP6CoNQW+WWh+UcSq58M/AazZ05yuN+ldN0SreQu8bVuSEy7kxmmPNFDb90vVMBWFnF3f2W3881j8aEm0UHGAyhuwyd5LYhapW1duxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:11:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:02 +0000
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
Subject: [PATCH v5 33/38] gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::run()
Date: Fri, 20 Feb 2026 18:09:47 -0800
Message-ID: <20260221020952.412352-34-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b15f893-0f38-4559-454c-08de70ee65cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YlIB3EhizRGseNO1EZqVO/X+8gTpmuhRT3mAhSsHD6e/0/a21VK93KAtXoBA?=
 =?us-ascii?Q?rAoQVSEX4MNKG1qCtQwV2Pw+3fE4JL1GioFBMzqiL4M0jX3HWdg4CnOqM4SY?=
 =?us-ascii?Q?GTUPvEaco1ery7iU7bLKfRdaC6IadpT3QSlPw34JDiJJvrJhzNXNyMxEPEro?=
 =?us-ascii?Q?aYA4J6Rj34/etLgg9ERGpbL08A9jouE5o/VvWVdpgywJv12gW0G7npn3hgYt?=
 =?us-ascii?Q?tM3JHtw6wOBEY+c1dZlA5SVo87NU+2HdJB+CL28DlO08ZohPTUBK0WSBfTMP?=
 =?us-ascii?Q?9v3ucZdrMC9jVloE3rXe6rQA+22iRo16/XM/S/gcRL5rsT3HFaiN4Iq+hRsK?=
 =?us-ascii?Q?b/SRdy3f/gVLQezmq7dvn7YpNLFlhDbXQDwDVH1DNZGaOmQA6SJmZOz83kOT?=
 =?us-ascii?Q?PKQdfs02dFoRv/hjbHIYcmqhjLZRJ861Xcj2znqX/17SpX88J4d52YjfT1l4?=
 =?us-ascii?Q?v/0nlH04v/amrjLB5g/pjnEmR07P+noUkuQ0xMrsWGgKOv4U0glHTUIDPzid?=
 =?us-ascii?Q?dQqUIMORmear0mUW5v8hdTQdOwh08f5VGwjPxM/jqAXkJ6DhuMObENKxArs1?=
 =?us-ascii?Q?30t4DCYdD818kOLIznfqQ1IPEYr1kTXvWVLnoAmAAlTh5pl9i94gbvUm/TFC?=
 =?us-ascii?Q?EB4audxBolYFzNuc6zDRFNOgxgjAq+dp9m2KSwibv8LKhxzP11ch7LchYtRZ?=
 =?us-ascii?Q?hQ8RORlYXtmOpm56xLgfRBbRGUd+3W6G2Okuvmkzw7aFD5cd1OTG5SaeWU+H?=
 =?us-ascii?Q?d/cjpQTmohsKn/FrEmma99YZo5An8PvcQasBc+6rlUP5EuW6jJl81XcMSjho?=
 =?us-ascii?Q?AELWaeJ/xICqs3OKQL+qPGArAO3Bko79L+7ux3D23u+r0JTLD/n3un4aPdbW?=
 =?us-ascii?Q?eNn9wQukCltdi4454VyUtAxCSqQ8w+5t1cxWen0yzsKGuTO/+n/luyQ2x+3L?=
 =?us-ascii?Q?JUBRob4x5o/tACnru5FuKN27SKn/3zvE5EWw3wMoQ4wV7PMel5gBRIJ4Plax?=
 =?us-ascii?Q?/6rzO8VjadatKXivciCvbn2fFdxC1DqvZ3lAyOfTWlEI9IU3VrZC9y9w/cn8?=
 =?us-ascii?Q?mD10mQJn8g8YMxM9z8Nigy3seJ0SFvOM5vk4/LXkY7vzkFipZ5//FY4XpLZB?=
 =?us-ascii?Q?MDLR4r0p2fpWoYwM0/D8p/fZzJeifPSdFIPcLjP/pKY5mxwpn2tiREei+hYb?=
 =?us-ascii?Q?tL8+JLeLx9lH5C4OHx+TH4dMtjToavCJIMtJTZRIPmrse9kUgyEYdX+U5UlS?=
 =?us-ascii?Q?OwMudD61SWFG8h2/g2NmIZe5Vq+w/Ib11MFxPeZJwwey3JygqT1RK+vJzzNZ?=
 =?us-ascii?Q?pmMCOdFJARRqys1JevPJcLhQScrGzySCMSZ7EYUzGluRm/dBnIq2FzDbpmBk?=
 =?us-ascii?Q?hEDkqiwSm5k4rRlyOZXtQmp+tl2PhVKnr4wGaV1NQGOY1upYtK+Sa9X2YYR6?=
 =?us-ascii?Q?AotaTI/qc0kteQ5sdykRRfKA2ZuiFwm0ZECBmOKtTSnBv5LHApZTbKqKTYy7?=
 =?us-ascii?Q?QVkdqS00+E8SKHaF3hJ/l5BZ8BWmCrCUKIMWp5CCRrXjeasMJgcIZa2GwNhv?=
 =?us-ascii?Q?FznoH1iTxeSiEF97tDE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tO9JiwcyLjDvU/S+EPAGitP1f9qNUCPHaAPSBI6HO6e51lrgGAAFIrmF6YvU?=
 =?us-ascii?Q?RFO4tMk2LTI6LdoWt7wAYJSl3ZvyRdKpmpxEkN2MtlxBnvfHXeNwHAwYnA1R?=
 =?us-ascii?Q?26FpwrU3CC+rE5S0MhMpmDotVAZOueCj63kyv0AHCpgK86oPa5SZs5uYQkMx?=
 =?us-ascii?Q?dI10N+Pvkbh1x/2bIUrUQwHb0TmGE9Os1RXnSpfioSAwQXJM5Cqtv5kjIAYy?=
 =?us-ascii?Q?DB8IWmHUu6jfQqK2xJmZbGxwita6gC+qFbU1l+WS+MS9vih5/ZgnjGpK9Wh7?=
 =?us-ascii?Q?w8uB/KndyyJhwE59XDFr4f+VJcqJ+m4Xaj9H1ymxawkjHeZTES6xefeFhENZ?=
 =?us-ascii?Q?VAYvTRXYJ9oz4ooKJkM6vR9Tq5EwfW+iH4QeWaCo0J5B+FUM4fCUF323hsy9?=
 =?us-ascii?Q?wI0RcmGbSSXus4f5UnpkU+9L4JjiCrhjiZ1feUjkhPPfYZDjDZDM4Oy7IBop?=
 =?us-ascii?Q?SSdprArCGwqasMZ901RwhZ93Sw/V/E8Eo02zhhrZwqN/ZPv6n2urwuAdfo6w?=
 =?us-ascii?Q?KPnWtnWgr/TReI8EroFe0PHIlcrH2n6c3MRCchtqd5ILW+DnskGLO0ms4LWq?=
 =?us-ascii?Q?T9vDGQtbiR8GWRYVLVntOg7GaZc0GLumnIePZiT1GrGt3tbyMuTDTwQN+Aq9?=
 =?us-ascii?Q?FVElbHuUmCoS/AKxg5cZB4yrzkRB62BsLGWCdv2I/PwJrBMS4+JchoJpQxxr?=
 =?us-ascii?Q?YdbwlHgpHCHAzxAy7+3Mn+gS5kpSG/X3a5AtCR4dB0cQ54CVZtDC4p/U2VnA?=
 =?us-ascii?Q?qUzPHapjI3p+4Xp6c3KM828pRzqamodwRyGXjkBYHWY4dWtrqnyZneHU8DNH?=
 =?us-ascii?Q?tq6Dxi1WEJapZl3rLA9at7hSyFd+igvY0tQZozyOPFaC2ganrEuakkUv7MT/?=
 =?us-ascii?Q?+98sKjDKo81XTOrcXQbUY7zTqceZM/DvDZLdXc8OYCU6eLdJb83AOo1qx9Hg?=
 =?us-ascii?Q?uuaIURe3m6JnopHSlQFtbVAQpowZVPvY9suBMt0d99BtOou3jxjjxWucE8fM?=
 =?us-ascii?Q?yUk4kuHiixIWrhvr6X1gPMZYnOTJPCoxpIYF/o04VistCF5TrrS8OjFhWwcR?=
 =?us-ascii?Q?wGZbMVlr04xESfugc+saHKStuLpzVOexF+TFQyjGgRnUbYQhavrs8HA23qxl?=
 =?us-ascii?Q?+/bGsf0lq8TpNeWgps25MR8lkPbA6YPR4uAM/D9RoD3RP7ObT8SPe0bVWJV6?=
 =?us-ascii?Q?bMNMsrTU17ezYD9f2NBHxcwVkH6kkH9bIifTKxpY0Sdja1AAbFmuWz6VSrD7?=
 =?us-ascii?Q?wA7HoXhp7m2Kc8+5268xwzjsvmYliy8lzD5FGO80gewTL2nhxANOdmGkV/gh?=
 =?us-ascii?Q?pK25//5H3qExLO+Fc3gvJnwq5CxyjAUvaX9/e/Niczhx8q4dG/FF77DXKz37?=
 =?us-ascii?Q?xwLodSn9flzuuh3zKAQP2nCkQk09HI42KGqVOcsW/4EJFqVziDhelxpDwD/U?=
 =?us-ascii?Q?GfUwAN8uTjvncNOB7oTIenFjHwpClzECp/Jejtv+B4VGtk+MeFYBX2ojqXqr?=
 =?us-ascii?Q?/DuFg9z33VYAkzh836GaBJgXZNQMTiAOCDYX4Zp7W8LWmTK4bh5nLZMWWvw8?=
 =?us-ascii?Q?uZfzDFKYItRtudts2SsouAPj7buF+XK5LnfPtdqi6ndCXz+PGkNxQFHQeTMi?=
 =?us-ascii?Q?5+ygYi+c229zeJz5rUNoCrT9gZM+2+JpQGNvlvPZ2nnGHlFCyxlHSqCuV2lG?=
 =?us-ascii?Q?SqdLSiXvY1d2NEgv9GcLrka/eHIy5D+KJM8nGDMQy+73P2jPrMdTedMwMXyJ?=
 =?us-ascii?Q?0JGdkK6T/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b15f893-0f38-4559-454c-08de70ee65cf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:34.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5Lc8XbDxUhaKY99A7SWXEZdcwmRLQkSpXjqame8NX7RM+fbZrS2lBDN914+0aC7D/noZUifPda8EH5SNlkGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Move the SEC2 reset/load/boot sequence into a BooterFirmware::run()
method, and call it from a thin run_booter() helper on Gsp. This is
almost a pure refactoring with no behavior change, done in preparation
for adding an alternative FSP boot path. The one slight difference is
that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Cc: Timur Tabi <ttabi@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 35 +++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs        | 52 +++++++++---------------
 2 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 86556cee8e67..b3ac3b826e9f 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -11,8 +11,12 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     prelude::*,
-    transmute::FromBytes, //
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
@@ -389,6 +393,35 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    /// Load and run the booter firmware on SEC2.
+    ///
+    /// Resets SEC2, loads this firmware image, then boots with the WPR metadata
+    /// address passed via the SEC2 mailboxes.
+    pub(crate) fn run<T: AsBytes + FromBytes>(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<T>,
+    ) -> Result {
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(bar, self)?;
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
 }
 
 impl FalconLoadParams for BooterFirmware {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 465c18e4c888..7b177756d16d 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -120,6 +120,25 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        let booter = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        booter.run(dev, bar, sec2_falcon, wpr_meta)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -146,15 +165,6 @@ pub(crate) fn boot(
 
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
@@ -182,29 +192,7 @@ pub(crate) fn boot(
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


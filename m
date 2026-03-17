Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011036.outbound.protection.outlook.com [52.101.57.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27B13F7A9A;
	Tue, 17 Mar 2026 22:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788087; cv=fail; b=Nzq02dLZetBfKAVA4AbPyd6F5Zk4Cz5SDCUL4jUUvCXhiTPRTn0GWAzVMqqDFsCqZNUhRCJkYCpq4FLaD5TnzGtrbo1b6QJZQ6QuaOgBlTvPDVCxtsOrjHDBhBlV3QyTunys+BV3sDuCMYUjnJ1xFUkgX8XjAECniHP5bER5tMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788087; c=relaxed/simple;
	bh=Lw+5B40/LV94exw13BwjzZ7faywTcCvvIuAZZGnP2d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sLLHrB4mVybdsQSc9rJCC5REYT7Abgebf3NLePoy8KIvb0+DER2p3BTUC5sQZCJ+yCo/FHzu3vC+MYl8M6JA3K2ViUIn8MvRvyVLEvD2v8DGpXNkqz0n9/BC5oU4r4SzaLKJFu7k8aWQdqF0aBnjnBL6Zlqf/IP/oKvKsFPYuPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cNk2bpEy; arc=fail smtp.client-ip=52.101.57.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNk2bpEy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ45XwkeLLd1oJYAvR0R2KW15YMD9G5vTu+Fb6uC4HtqUf+vm1CgZ1Q+0LusDSyd1aQGGlZaUCUzbBFbM4o7VdpjdMUMPnVhprYl4PfHVDIsMF3ctTFRCQiTQNXcpxk9btMXQNCAmjQqW+rekxxi2gjqROZ0oARzaACoh0LqyDByQ0xdb9d6sVuX6qGwDRGvGJFTx2yKOiUbolWrFqZ41ecj3jYZ2HRrAYtya9Es81GrRftMeXzv/0YtiVkoONw3QynGiAVS95m6kU4+JH5MU7/Y/pI5oUEZAzc5yTnweqcDZRDPJyVqKCu5W/E11YgY/KM/mItS7GmfQeIHyZBc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzIegi8esmooDTEBEx8z95RoAUogwS9fv4O91zHVZCk=;
 b=lN2vxGWAPikSTLstUOUPAB7cW05rGv3cXaNigNWWYCfgLUaEbcLpSpg7N/IAocmt0OfXqo7tcextTGXCzbTH8vpSWZ4Zrv4KXpPaDzxLBa3twtUTbVIm3JzUJ+Gtb+hXySjxbwXHW/Kp3N0oSpuWBvjW8W8dPKtOH5iY4cdZRCkNCxOzRZ9LO8JJOsRNzjM10dI8eqz1Wxk2C3Fuvqc8sWNOLXMOChEp5mF9MwwnC5Mss0zdFmiHGjmOaftr+S2KktnZ5W8BvL+CqgjGMlBSGjBt9jRgP+mcMtLnssm6W1KXjwDjhr3gvQZGUGkR3tn7PWUn3DwDpqTWr/EGEmLunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzIegi8esmooDTEBEx8z95RoAUogwS9fv4O91zHVZCk=;
 b=cNk2bpEyitbkEuXpEhSS6yE6yQX70bgeF6b4W/OfPg9lzXhE3gdBI/Aw3OphZBrJ2bqUewtkXolYuEJRTIlpLZsRS3at65N+p1wI33Xcx+uReNuApr8gAJPtQMt8OFleMKEq8Kl+0yptdn+8ukWGDeDutl3WWWtKv+hZAvEFOADgIqoHf4dQPbMsHeZzhUJ1J4O4bsyAtyjoQVh0o3BmR+Ya2ZJ3ZBSRx1Td/WkIUXJfh4oRf6N4azne9sGW4Ez51eGwDeCvXGYPAPCmiv3DVlAjVmvrb8nAacd1wwoeckMayzQg5WDYzmUj38k5sdDqquNFwoiWGIUPMR7NH+Funw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:36 +0000
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
Subject: [PATCH v7 29/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Tue, 17 Mar 2026 15:53:53 -0700
Message-ID: <20260317225355.549853-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 80678223-a7f1-42eb-ce9c-08de8478297a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wAmHLhnZzcV8EBahnfb5+MehQtyyHRcVdxB7zoo+ZEUfalcLJFszfxWJQTP0Oc1yg5D04eaSNohxdMj+dVtnBXi6Jzdy3xrNGvkDyPkVkpdIIQcHk0lKUEERy8ThLBBEfpMSC6uUp8XfnsUx5NGVQfkfl5Brpr+FtYHt90o7ukJsZ1xvdQ3Ehg/Y7P7awVMrkisSoJYWV/SbLQvL85aN+nPZkBM4rCJ/ozY/xhhfBFORtASJbPai1nddIgqJGgohkoIkHI9IWUQ5EPioJTl7q0nGbq1oApG8Op7xqPkQmyTJoN/ObMz0W5CWGizyT6J/vQaSRiQm0DwvQLRF2mZepfGhDuH1CAyaRyeGot67mdRmJUlzagqMRALDbW+BOc/wyPN1skPH6aOk9AwLmZq5lb2LvhBsRnPAWmsgJunmtEbODPnv10fis38I/868J0pztlvk/MzyPpoJxFTuWo1384DMYEYCkixGSewMp2FwzNOBzKIK3czEbyTz/Pkk4Xq1q+8JpRe9wxDKETAuQqZv8K1Pp8fbzoODmjSx6bkPM9A43YSeL1/IyE62IoIPlECGuSzMKpPAmXR52gcePwhHMp7bBF9zfhzNf1CzHT5n+Wx8PPHHhVH+iQwKHYmXp7AcUcmi/dnQF2KBQSMylOycUGkvNRDjY64IqYXp2I+0tJzNEjfK2NBUqPgs3EBpZGSkkJ/oAAhumu+iLqGK1QiXcKoxlYgqbihKd3z+ZHWg3e4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f8+MYxVl1tOQkPGeDqN6kpBloTM7gpcy7RlG/hU4fjioXkhOh5EAW+RDAU//?=
 =?us-ascii?Q?JJndR5F4E7Bnjr2iWRc8R0AW9FNcmcAwihygciNWrtlgL6TeiZ4BEJABiBxf?=
 =?us-ascii?Q?U/kx2Skifc2ovHDkgAbB+vVYLWECP4fBiAdZC9p08Kflr5jL81LeKSVuZAmW?=
 =?us-ascii?Q?mrNlDoQ8a59C5jdmHpak2heMYFJjB8mXnOmrWH5HeEpwCGEr5do6h15afYbi?=
 =?us-ascii?Q?79EPMqa17VOlv1vJ9behF0tmNRiGR8NXd7cMN+fKablMPb0MJH6OFuU7q+MA?=
 =?us-ascii?Q?x5v6e2pB+8LWLXBGG3WjBp75cFprZ/W9j7Ig6XjeyE99EPaPnnn0uDLq8i14?=
 =?us-ascii?Q?3CoB1f9o3gKjtMjTWG38J/lCrXSCt8hQOtZ4TXOEdwPXIcIpUtSZbFbuoMde?=
 =?us-ascii?Q?eHyCxZj6UyKaY1qCakuqXRhy2yMzIt3STjh6sZoCCNqvi46Lg1zw0qURM0na?=
 =?us-ascii?Q?MGtbkipMBHvkB36B2LpG9pHswIMitt4784QtWG78zngzfuTKap4FCbsbb7IL?=
 =?us-ascii?Q?ya9n6JPyA4AVCImlo3CqDwx9wuOicZ7kLtpR1EJtV7S2Dhk/Jxj3go/LkIvs?=
 =?us-ascii?Q?k1hXzmEMZ2/9o1ID8vs62eHoRvGxk6wxEQEoNbpRBTIzV8rYz2zEUDGFxJuv?=
 =?us-ascii?Q?1wNwViMEMXpOlgaNU7T9HHrkAQdb0RfsR2BKlavOk5UcUJGVvX3bmpbRm7yd?=
 =?us-ascii?Q?O88DvkcLmNGoB1QTmcgvpALojyhuDQtgCt8vKvgMG94zon0CPalS+o8+kKCo?=
 =?us-ascii?Q?amdZSku8Skk7cSsDJmDJlZmCkq1zJJq2HNX+b41jSSD3ULcJu81GIAIh3Wrt?=
 =?us-ascii?Q?cq3gNOieydUC92cUPG301rSGbdYatUwNtvXnICJPQtld6/RTKDTVUwuYULwc?=
 =?us-ascii?Q?8eaeam+Ha4wWBvEEUQoi2FcRS5Z3DBp0x7RCZNpFx67UfjtHlXDFMbgXheAP?=
 =?us-ascii?Q?LTznHcfNJBNR4fwcvyUZGW3XKSwuRlTZ66TFzw1tR/C+Qe0MsTjDJeCzbbCp?=
 =?us-ascii?Q?9gdfQrQd3E1YOS3jjQFmjfRQ+xaHaoR2SSVsknJBzym7e/kIgHh65IsyE6By?=
 =?us-ascii?Q?WVc6XP4d8P96oP9ZATwpGhjOWYY0ovdSB4/rtEieymPKY04gjhZxFvGwn/DY?=
 =?us-ascii?Q?BYKaKOunn03pJHXw0StiCHdfX8zw3vMe+pjKUbzjmfIDAJOqMfWIDpxzY6AU?=
 =?us-ascii?Q?f4R19VgOmfp/BbYu1kld+/GMt06y//ROPP4OIbdccajQPDKEzWrjkQAe1TFW?=
 =?us-ascii?Q?faV9/KgguMHeTRj/JP9w+XGZpdhucXCD0oKfaTYtufjv0DWOwa1ilBP8zVrx?=
 =?us-ascii?Q?lvRdZaF41PoVPiPGgZMHxRXfw5cl69CwZ8j3C0H0Bvv5590wKge51J6iAINd?=
 =?us-ascii?Q?SqwslrVO3pl334mkMHPO4hdUre/RTtUBbPUDLa9xRil5PMPCETiH3TxCCY4H?=
 =?us-ascii?Q?E2K6QXP1jZSaUL1FSDiJG/+9klX9NU7V5SZHr2wNBYAGKay+Tsdapb3EsCHX?=
 =?us-ascii?Q?Rl9sOLADyNl1LBiBc6W0V4PfeuaqVDJWstXgDWS2KXXxWi5CX4vAPtmc64c1?=
 =?us-ascii?Q?QKq4nYYli69SFDMMaPxGUM/7BvV8Bia+g2S/AlHQMKWW8FUq+mmONplTWH79?=
 =?us-ascii?Q?Iq9AzK/YnsEDcolwOR7I4eFOdsiaqc2e5Aytua7ds/XUYWxkFijrdLVnHEYX?=
 =?us-ascii?Q?+ILKhe0THIDN7WYWrsPXY2nAhS90AtzIDUKNua5Dp33JTLafMu2v9E+RvmS2?=
 =?us-ascii?Q?3sty1tPfcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80678223-a7f1-42eb-ce9c-08de8478297a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:36.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZTKO5cHj4K6fo7Tri5AoKqRjSj1vMiAqtoBieApA0ve4sQ/mKd7+xgrNKpjbndft3kRNOChMx7uJOXyhlDpfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 80 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index ad0344db66b2..a3ab0bd7a317 100644
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
@@ -44,6 +45,54 @@
     vbios::Vbios,
 };
 
+/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branch privilege
+/// lockdown is active. The low byte varies, the upper 24 bits are fixed.
+const GSP_LOCKDOWN_PATTERN: u32 = 0xbadf4100;
+const GSP_LOCKDOWN_MASK: u32 = 0xffffff00;
+
+/// GSP falcon mailbox state, used to track lockdown release status.
+struct GspMbox {
+    mbox0: u32,
+    mbox1: u32,
+}
+
+impl GspMbox {
+    /// Read both mailboxes from the GSP falcon.
+    fn read(gsp_falcon: &Falcon<Gsp>, bar: &Bar0) -> Self {
+        Self {
+            mbox0: gsp_falcon.read_mailbox0(bar),
+            mbox1: gsp_falcon.read_mailbox1(bar),
+        }
+    }
+
+    /// Returns true if the lockdown pattern is present in mbox0.
+    fn is_locked_down(&self) -> bool {
+        self.mbox0 != 0 && (self.mbox0 & GSP_LOCKDOWN_MASK) == GSP_LOCKDOWN_PATTERN
+    }
+
+    /// Combines mailbox0 and mailbox1 into a 64-bit address.
+    fn combined_addr(&self) -> u64 {
+        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
+    }
+
+    /// Returns true if GSP lockdown has been released.
+    ///
+    /// Checks the lockdown pattern, validates the boot params address,
+    /// and verifies the HWCFG2 lockdown bit is clear.
+    fn lockdown_released(&self, bar: &Bar0, fmc_boot_params_addr: u64) -> bool {
+        if self.is_locked_down() {
+            return false;
+        }
+
+        if self.mbox0 != 0 && self.combined_addr() != fmc_boot_params_addr {
+            return true;
+        }
+
+        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+}
+
 impl super::Gsp {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
@@ -148,6 +197,35 @@ fn run_booter(
         booter.run(dev, bar, sec2_falcon, wpr_meta)
     }
 
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust.
+    #[expect(dead_code)]
+    fn wait_for_gsp_lockdown_release(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        fmc_boot_params_addr: u64,
+    ) -> Result {
+        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+        let mbox = read_poll_timeout(
+            || Ok(GspMbox::read(gsp_falcon, bar)),
+            |mbox| mbox.lockdown_released(bar, fmc_boot_params_addr),
+            Delta::from_millis(10),
+            Delta::from_millis(4000),
+        )
+        .inspect_err(|_| {
+            dev_err!(dev, "GSP lockdown release timeout\n");
+        })?;
+
+        if mbox.mbox0 != 0 {
+            dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox.mbox0);
+            return Err(EIO);
+        }
+
+        dev_dbg!(dev, "GSP lockdown released\n");
+        Ok(())
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e70be122e1c9..e59d413dae06 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -321,6 +321,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
+    13:13   riscv_br_priv_lockdown as bool, "RISC-V branch privilege lockdown bit";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
 });
 
-- 
2.53.0


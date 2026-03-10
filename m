Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A773446D1;
	Tue, 10 Mar 2026 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108750; cv=fail; b=FBK18HFNVQPM5qfMjUQX0WIL0LwMhEqrgLCE5DzZQmJcP/koxZAGEmwn+6Udkd/tGTkEMOMCRpA8EqoVoeF8rLDx0B5ZFDt+CUDQscgiRXlUamdeltseY2V1lQbE234ipJbKISAZ8oPCBMe0yAt7A8IbReS8asTb46UQGzPA2HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108750; c=relaxed/simple;
	bh=GqlO1xLHRPFPn4EtrBwo/1eIsWxwAGpZZXjAQ0IqNWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rg5JxzFwJ6Q8JyNQD5rdU1RlMGSjyM/G8PzSWPwWlmynXFv7wsM3V7vr8V+r1LdN3g97x2iycdbiRT/gsmPjV2QBaEvmpiluw/UW/Uvx3+ftQkT8Q6+nneeZpulBG+9AHiJv2kqWcdj0MHkC6wT/Qr15wPpO+dWGfg7lthQwzCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q1ONrVvp; arc=fail smtp.client-ip=52.101.52.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q1ONrVvp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU7xmwV3SQYgIWnjDByB6lwpqlfc4d5R+D1OvnfnjJM+U+RapqxNue4lbnVfW0ub/0EUbkzif0Iv8vD3sA7K3uUMWYJD8W96iM20iRviaDExzeruhDdDU7LN+82gEMvfxxlJemdPY0nJnpGWi4gDBTUksjIjSNalPxTynJXx+x1DUTsB46dzy9t4D8/fmrCGDDIk9cpiR2YRfr9CJx7Mo/Xbs3p83gkJyxEkge5m5Rt/Zb8WVQMQTd50ZBQvA0gT4KG6a/nKMHKsYKjZEaTgef7LYDMFadSNy6hVJ3efoULudLsFzxPamnJhMFTx0gYvd6jxmTIaWa7nqbJmbaUbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFhZ4xljPafDPIBSP3Mvnp6Tw7NerJNZEfcFaSoVb08=;
 b=L1pCLtXU8l65Ku96EM8POviHukBZhu1eelJ5Z5fGU4X8VkC9xRPJzDsaPW029peyAMEqUkyjB2sfp1dF3P0EILdm+1QLEI1GRCt1KeRZgz2bCkvYLuR2vBWfjfEg9PnpNc2n89NmNOHi3c2BDkNsQ6MAwJgz5F33+QT259v5gn29JOmXxO0UdsVb2WOvZwSZ8ihXa8szVqbNEdAVkh8ls/pObkC1q1yNRmr2B61mpBOwH5vnKZe0rEl9UEUgN4mJ9WUcTP1hyhy1Jwm1K3SlJG+KItb0Z0iZ0TnyeUwyOH8GTXRyXnBcSTth4DeAwuPLlX3TPbbRjX6RtJ06YRhysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFhZ4xljPafDPIBSP3Mvnp6Tw7NerJNZEfcFaSoVb08=;
 b=q1ONrVvp9YWbt5ucfJcjwTXD0TtlwQXyfGuUw09Ubp/8RheTdHU6jPHZd2GqLWz+5EIF5ntCFwMw6Qi7G6H7wcRH3dTS/iJMG+cgXAMYfEz4Slf4AfKTOfCs7KBwT1L0mgZ23Y/W8xV6wAQGqNy7LZnkeJuUDcHvhKHsiLf+YlHKLcqPjPDh+x5fjjwL53w06AoFfs0twyi0TxhrevgBqEdzX+rN23WPhFhaeZlHLwex16HXkpESRhDOfrVyyLNjjGqrZMJ5HZlISIdVxGAeQG+cOpiOR3UtLtHNimClAvpvjPP9dURffWJApwnAdkB6faRKcytZ9GL1iRXbcmp7FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:12 +0000
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
Subject: [PATCH v6 32/34] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Mon,  9 Mar 2026 19:11:22 -0700
Message-ID: <20260310021125.117855-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bd22bf-693b-4230-f348-08de7e4a70a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	kCkrJ2VSXNpKp/vvjtWxQ9xG2CAI9Pj+YNCIC9xiANFwID3KefWedyqaMwlYtJNzvwWB8kcfXtoaI6p0/8LXB9o0i7RGUyzUdLaQLEB1r0NoBvDmQHX4xMVZ1nZVkfT/W0n0qIPCd+jLwhjZePjNESq+TZe+y4SkvYwqsYMyV5BRiFkBU/P43hZM9TRi61IfOAA+GqiOgryzknUHZ96lvVHSSnYWDyrIdb/sTDjlRQHYDFdXUaS2hugxl8qljcP9YzcXki32CEku/XyNsaROviH4w5QVXGjjcmfPBmzI51K4Yyq7RZhkCjKnHo1yuaLybiMb1RmYJ1qY/kyhdhjqNChP5byLxP3xN9qhkzlV0H5QIzuzZpFQgHIGzrdoM95poLe/XG++oF2J2DsGZweUVscLMOmylEvHdLBhOPx8y/vr5Sgi0G9f+9VFyqT7UEX+IfTqKqNisbtp73wv7LAt3vFO7PTDtZ/Td5+UgcnBZq0wgjJEjWT0Dr0+keCy1pQUfgO2sDPRhIgYT2YJmOKRFIsWYX0iTJHeUXJ2W4K2LI+3v1uZ3ibuWk6YmRKXJH7lJyForC55TAHqABMpHddLRyUbOiBB18rHRlyvAteTZb7dpzpxFKjCvgT35kUOkAjeA06pTbdmlWppVnklmQpIHJtkq2YaNYdEmnoU9GQyMEI3woxMmmHeTRp3Cvvx1PhQJCBSdy1GDD3dU7NBBQiGzn/K/lsWz+NP2IoXdxEnwSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jwc2qGK3EtADd4S9CADv1DoZileNeke9acPKGh4ieQjdVXkiQ58MqyP8siMM?=
 =?us-ascii?Q?Dga9RccJMsBdAprTtpgvv1JUE8y3duYsM6QvXLJSCDXQGsfobCgIFRmCw7l6?=
 =?us-ascii?Q?uNaOhzWt4p+0vNzVSdjFwDRqErvf4prMYxzTGOtwEDreNEFN3yxSsA4TvdeM?=
 =?us-ascii?Q?S30zvatsUEWsFBMhToiMPZdtamrqwo0V+ajNegAXgwOPYt787XbQoGcViowJ?=
 =?us-ascii?Q?0sZGQTaD5seLIoDhl0v/oV+VHqOzat5wJxJVmYXpCnptNWr81WmVLmhFWX3H?=
 =?us-ascii?Q?9Bj2PCtr99l/awbk9x+K5K+7dhZ5r9RyjqcDxPqPQh0jgYXZ0E/d++n2NZI5?=
 =?us-ascii?Q?SO7bfwJxoP6NlUkkYt5F+QFU7yXK6tnqWMYsoOJsBAMqOJupvvmMMV6kgOD8?=
 =?us-ascii?Q?HVlVlvQPRCbpcDyOiJ5gM0xQMsHIVEN+JU8kdbYVSQIDj9jvS8g3FZZxdLry?=
 =?us-ascii?Q?2FJSkS+5rMwx4tEssg2gtpO8H+zmSunR//m7ZRu5vKxINjqYIDen20svtvZb?=
 =?us-ascii?Q?ZrgfgnBtiAQ8SEq1MMH21zpsLG9bfnhUk4f6tSekeA/La7hGhyitYFZETcNr?=
 =?us-ascii?Q?62cZb3y4SbX/Hct+xt1m9vxwFg1yfAYnLDwyvrDCKEkOKi5xZ2OJvc3vwshJ?=
 =?us-ascii?Q?+1ChWfpOUd4y1PTLEi+/ixiQjX/oLcNrC+PStUj5mxSkTpH8MYs2XrU1l2LD?=
 =?us-ascii?Q?SUpo4WejkkjFideEu/vFpfkzv/xz4PRyNHO0hpOBEDCMZh/gYHpH3x77+KrN?=
 =?us-ascii?Q?CNyY2DVZqnmWtZNZbnOnH1emXOVAu6WOq+OqOSJBsxa7UD4u0cCcrUSZPO1H?=
 =?us-ascii?Q?Vzr2B41I9pBMCI5VaTQPidQ2mxxt9g+uNqntXxcRmulYlAQ/1OcfY5mX8bkA?=
 =?us-ascii?Q?f/l4LwglDzG0UWmtA4n0qVj+/mu9GlDJ1EkuGT0uGwsiK7VPOfO9/MZs/So6?=
 =?us-ascii?Q?83c7LNdV+ktGFy8dWj2CGcbDpcSkPIJBstxhAS20qpcoJLBhIkUlU16+WCIX?=
 =?us-ascii?Q?kh62FMVsnv5lt1GwBp2cbaaeJ1PRIBq89EimGsT5r9rVAExJ+uB3hhUd7zIr?=
 =?us-ascii?Q?KgOpOObz46V5qRe2aTeIJPki7EujiZ/iuKRxrb55lnPZpzDVX/iiyqXxfVB1?=
 =?us-ascii?Q?Uw3jUMMn8yU0ZWIIFgh6Ecjrdkbc8TsVfvg1XnKEAeMWhNVaSqct1eJtWSSX?=
 =?us-ascii?Q?VPBX0rznEUh5bAMblmanEqIGkJk+pz5+R3Gpt/QhSVj1F6xdu0B0h30yvnto?=
 =?us-ascii?Q?fmEihugibfZtGLKizrAryL9mwIwPWX9jYDYJtFPvb7p5xO5bfVLMLKFgq8Hd?=
 =?us-ascii?Q?VmkBQgtf7INb6gm8XpUkUyWkcGWv2lTU/Sco57hiCs8hT+u+EuJTwXNPA4aF?=
 =?us-ascii?Q?uveAQaXo1ODXcrAjrWrBViP9FE/jVhkhqps0yTwF81GMusvpd1WscL1aTmsd?=
 =?us-ascii?Q?Afk+C970F+Ql63z9OsBjlEIL14uaiD7SYV7AnKF7f2PTfBYxjYs4DLGAPGMa?=
 =?us-ascii?Q?R+HXiJIz/Ibuv3ZZCcoZ1qYOLrg+GbaFGLq4APUNMRPihoTDh6/Rtg1GBABj?=
 =?us-ascii?Q?0FBWnYrQ31t/BILtwWc82v6bP2ZiR7Oy+zhKSubKa7CjwYUeEbU9FOSiugRV?=
 =?us-ascii?Q?xrMTspKr1nQpSZ2ecXRIqIq6HBIc+ECZE1S3TInVjyZggxA7iMWglF4Gv1PH?=
 =?us-ascii?Q?0CQ2uWANtoJIA85qc7Usuyyku42qFD5cQZPT+q9RRSvUzoy2SQTGUMK8RqSa?=
 =?us-ascii?Q?wKURoEbWHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bd22bf-693b-4230-f348-08de7e4a70a1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:11.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzn7F2I4DRrBOHSHSRMu/ao/tMmXDzjJC7oDc6C082huSTZanC21zCMTqT64hyUM/CNWAuFoHnClBd5Al39izA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

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
index c66da4fe81a7..7bf160723acf 100644
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
index d9b4ae5be1f0..d4efa6376acd 100644
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


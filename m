Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425030F548;
	Wed, 25 Mar 2026 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410813; cv=fail; b=VIpN0OKnE2PAV0sxogTJncjf6z+fNrvMOWtTE1RWMSUQYPSdywFUA8J7Q6O3TCK4BI6cfUoeU0Y7xJXQAaOFpDJScVD7fYi3o/7BFXFA+VnHkvesAv0hLSLaMUhyRtUuSJUfLDnbl6jrqa4hYBg+b11G4o7WOP2hCm3jXi6Xj9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410813; c=relaxed/simple;
	bh=baAZF5h8InVseuj90EY+f/2l789h2bNS0VEhb8K0RXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dNJPDwm5Mdj/1nU20M/a1V03nAyJhgGP6FZmFkxTLfJB9x4tWUFvfk4Yt41jw2pkgySWLxLStEDITyw9kbdyGd/a53eVYFkHbfAvLlbsEJggHHCiKNb2YJHKbJTldIZMX3itczV08bgQd/aW/63JjaQnwoJ/adMoelbs0jQpKKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rV4WPkhf; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rV4WPkhf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuelO+4NF1pnNHpum+tGrexUEORXLS0yxJ/NSyHGJ9LpUdC5NpagIxnx8IIW5v6/C1Gzkq6c2uznjhw9wYIXdD0DEbt/saAtvZasoUdZeyU8cm9Q3I0/4E49yTHhj1EeGIgnEZOyOY2/vpqMy92xSaHg+0/OKljbLDSrL16+qI+18NVRPtbPFpcnGen+6RwUlk12sPdNTDyw8EQkkydATEoWFchkgyDjh89XKVndWyL69uIz//WR5aoZ1hoDhUi/0jIXS5d4AXFJbQXwcNACDMIExvjLjXACuBDhNnCLGhj82nBJEpDjbSphlwGmiGQs+LXSL8zFvCSyKaui1BGv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZu068sm3o75KymXg4PpiNBrKz/Azazg6Kt9EVnyhX8=;
 b=khRU5rkrzwJVgzkVYr+yDPgtIf9xrkVb2LLOsMGbtE8SwV3gpUggNdvRi3vz1/IeiVwZuPquBjp77hPz4fJE1bcQLdijqrkd9VQzog/+7tVJwLTIHkv/HOp3rhxEu22J0a5lntfFR7UUMl7kCjmKdCdElktAXs7CbTqVQVW4Dz0wzpm5dn/ZXWSQ0LiFNgjD+F28jcVwAz3jPDSBw+oLemgHucH5yB0x+QeBMVs+poUBd5APmzygs2re51SpR1I8ln8eK5TZbAUpr/+E9VruSTH1iHusLBwAOoW+0Goy5NLF7GKjCD/UVpPYYu0Mptv0D0K4/pteSpBRkHV6nDtSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZu068sm3o75KymXg4PpiNBrKz/Azazg6Kt9EVnyhX8=;
 b=rV4WPkhfgr82k/FTBOe/jZLa1e3fWZ+puMzL6yI68oIDaj1nn/7YsnyxoryYBFIgNUqKYDZhJXpYhmPj9mdtU3HwWCRKIZJG0OesWLe6hEW9Rt/Am4BC+P7//2S3BnoNF/HZFs5woPfltnOG1yWFFyasgwJ8d+C7OH5PTZEBfMy36f2sMWD8UFnW/oxp9aGX/E3bs5nBTaGoQEx5VFLYSQdB2BoFK841F0Glfd29ZXJ2limtF5Aae8P15TyDL3Mjd2oP1pbup84Q0e3dohf/7HB3kF64KsKQcwNvEF7CUGesl3vvsBJo1+pjIY7F10o8bSs2Gj4ZAHss/fOYrZChyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:22 +0000
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
Subject: [PATCH v8 29/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Tue, 24 Mar 2026 20:52:40 -0700
Message-ID: <20260325035242.368661-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1927223f-323c-4529-8186-08de8a220f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ww8ypf3jXfz7AEBapJcKycxetnT6RS3mrQs0/qCPWraHp8n2JqtNxOIAEso8bBYLaKDD43RyVucXdj0eKdtKXoHi4R9ej/XhVluaYnc8VTUPOsqM3hGo46EtGN3tSeDzTUfD6G5lJM7zbwTWFKq8x99bwRmtoKDc8UjueP8X6dtfwnP4doxUt/q9kNuvs0XeE4Lp/0JoCIgYawHcsWJ67NbPVPY0ykmAPNPnfTHINBX9YzavO9fcCj4QQu1BeGhswOoeEU42YligvLI39llKXmY2md2RNDKsX2ir09/5Yx1wCUfCuMXN63qu3nAqGyN+tiOn727Y8igDlqpx6/gQc4t13XcfPV0yZA9jY97mT4RW8HdYQbPr6ZHBViFtJOVGe/Re2L3PWwi8LBRFVlxMtE+YEKcBt1VWSOzhOcNfZ4xz5lV5klXuirwJ6coevnEDNmKzqFy/6foG5TdhWZtqMSdfPZz0VF3PpGLU6aqgDuMMm2H9AQRS05QiURagGapUiHHRi7AIZ2GMXY9sbPtBva0E53Q06LOjrfQBxPSPg5wW1kW8p1ZZPRJXpOtINE2Yu/Ha674fMWPrqVebAAatbS4PXMSw0EjHXTSt4U+Adh0q8RGGY6N2QQbpLDsK4EV6RHGh7HoUKmu1SaIbwcl9ahhrAhLUxra9i5eU/y8Ik9Gjv4/oTH9aNig3Q5PrU6xqTcSdojiFjPwEDTCeIc5whSaXcnR+JgaSqPwk0T8C7dU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CO2PftQkrqA2boN02cIig0nyHpDr4TZwV9lc4IfdoFhF4XeQjUWbfvjz8Txp?=
 =?us-ascii?Q?WO4E7ElFHvwlDBCA6ey+8suZuD7ejpeV7zvcgaqz8FLmDr1fsDXQeaJyq6TD?=
 =?us-ascii?Q?NxR1m6mJgARLkvxhD0AakFk0XaDTmZl1vdD7NVAXIZyaCS/efhL2K/0/KTtK?=
 =?us-ascii?Q?rBla8r5/CJDf/uUxj5WqM76CnDlVjvt0LF6+9/sJ3ZnmpspnUyrilXCqQEW6?=
 =?us-ascii?Q?Wi0a0A7Iimmf25y5dDEtpYIuj2ZfVEy+F5FSWdmj+HyyPEF48wTiorGtwPGj?=
 =?us-ascii?Q?zCCSRA7YZgriL5PHUG+/EPrXe8pwcznUyV6feBoV56BlQCYWD1K7I4T97FMn?=
 =?us-ascii?Q?quIbhaaIKeB0rkWa5FXOdR1buXkc2omsj/nZ5qrZtrMQh9vwfnZPrn25tpk9?=
 =?us-ascii?Q?1f+cVUffsCj1QTcwvt6LWMgSe7I6FzaNzpxBzCZtoELax4jnxaK/C8R5hLKy?=
 =?us-ascii?Q?ZO8hZXmC+K71ULWIT16WqLeoP73le+L5hDppGGausg+eSB1D+0Lpe7pqk29K?=
 =?us-ascii?Q?2dNTXJII8NH0oMua6CXvBkbmaPOruo5DtMB9er6Xq9LBKJuEC/XG6HfbgU2N?=
 =?us-ascii?Q?hIIl87/Iu1P1OcqEptzyuUpNZa1JdZ74I6SL58+v8AzF+QlIhtK2Iby/+HB5?=
 =?us-ascii?Q?kG499Gq+A0OB2tyiyU9ZfkhtqtbTQfk7yXSY5WQP9gTS7AETLaX+Xs5QHdfr?=
 =?us-ascii?Q?Xm/949v68ZgkdyfqA5SUIbiqhVYNQahKm6kIGoEJ6KmExmP4qf4uVde/LJ0e?=
 =?us-ascii?Q?SexSu8VagjnNLdkO3MScX5zBIugn9G4foEJlGv/XC1ljGGDrxZK047+mtopQ?=
 =?us-ascii?Q?K7vgFAx43Ml+0x3cr1e3N9gsU3vWGu9BfcpNRzWJbbP+CMDzeCr6UtAUj3/5?=
 =?us-ascii?Q?yLM+SVUqgoRMglbR6rZbg7pZnnCkUKw+cKlQnt/d0gSrIZUeQg0nYbSzLZfK?=
 =?us-ascii?Q?O5z0lzajY2vESk13489Kzroq4OxiF7pVs6rS8mb1YJWny0fh/D/vgpXScMg7?=
 =?us-ascii?Q?QoF1vOSW8QiiU6RQk1P7yGg1CxYA5tn9yegL7BvIcpj2vDFPnP3hR385pfGS?=
 =?us-ascii?Q?1lrK9IAWf6qIPHfMR6fK9kJNXKYkxFXYNisuNNdCSi0kuyy/CfLYoTz9kG3y?=
 =?us-ascii?Q?AF9LpZr5a3whnaPEPxNi9DHKVVsU/L00y4147T3xkKrxFOuF6KwP9kFm8OIT?=
 =?us-ascii?Q?qBU5Dt1bzPpOPJnRoB6OpBHFnaGPNI9eYD/kCw8uK4bG+mD/Fi7zklVth/51?=
 =?us-ascii?Q?z1EsfXrPg7D3BzWFoj7sDZXXZMTdpet2MdqHSF/50ZC4+//MJl3ERE09A0o6?=
 =?us-ascii?Q?rL19ySBrGyHPqp1v8PbWsA2M4AW8Uqc0KfhPgFHnF+P0ydFPo9TN5hFMsbO1?=
 =?us-ascii?Q?yOqgUk9K9DeEjsqj7hI2qm/rbop6sCMW9J14m3jP2nv5pIP6i0MWkQZQkDYF?=
 =?us-ascii?Q?0R97lCz2k70Wxhp5cQy6co3m0a5F5dyeTYyb8VrRmPOVLuSmccTajmYywyUF?=
 =?us-ascii?Q?m9eV6gjDAl1cjUqN+UQ+2X+lQ9RHthNIMvZK43as93uNXelTX6l8vfkmyPxZ?=
 =?us-ascii?Q?99K7e89ad68qsTF+x/ganHvublaoyrkaYOXBLKFJF2HKOyD5ILgPj0DQWJVR?=
 =?us-ascii?Q?yEk3nC1gdCEVSKw53z90GB3A43Sc5JTv+ZiG08a2mJdrTTzsPfBOVxJID4pA?=
 =?us-ascii?Q?Zuk0nTvvA3pAni3Xi7SapBZpNcPwnZu107iv71J8JW+6fJRyE+1rm7ijHIWv?=
 =?us-ascii?Q?WuR8fT2ZJQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1927223f-323c-4529-8186-08de8a220f76
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:22.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JegXQEAbH6pVzILT8Mmc6YMR3tkw28MGGU4JLnwdNGHLR28aHdHCkhzWkKQasaelOND2yumArTGeHld3iG9aSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 80 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 9d0e29e82574..abb8ca7ce38b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -14,7 +14,8 @@
     falcon::{
         gsp::Gsp,
         sec2::Sec2,
-        Falcon, //
+        Falcon,
+        FalconEngine, //
     },
     fb::FbLayout,
     firmware::{
@@ -43,6 +44,54 @@
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
@@ -147,6 +196,35 @@ fn run_booter(
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
+            Delta::from_secs(30),
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


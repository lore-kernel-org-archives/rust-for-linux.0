Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6713290D8;
	Sat, 11 Apr 2026 02:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875846; cv=fail; b=Az4+jkBwi9Qhdyt28gU7pazhaz4ojistLYI8JndxUaY6/IF80gCc95QDsBBlb15oHLlXBjZWLjB0z8FkE/kRL55JRIFHU07nEsnfQxzJcgVgMeVeDJ6C1SRHm7LaKWhtKvhUskVqhylAR5rf2iIhjpwZbTxiqvCS4/G+PAwCJvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875846; c=relaxed/simple;
	bh=Gm05PjNxFNnWTgXldqAeVd201aJcXvC7YZcU0Npkr7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/wsuQMmTDOznF+KckhBtPFbrkjP6lm4iOl7SYV2ELq1AbX3AgOC1uB0Tbhc/s8fhYTpqxDZHvmWwmvg8DjxNfMPu8CgobuStuXvaEv8/TxBiSKRz0rt22vmxBSvu/P52rF7elAEJKsNV8qGqX+jZy0jkefDlMJJ4Ov0/NHkWRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l11xlD6y; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l11xlD6y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngrlEuCMUowhW7CQlbhLpXjwPltFsCX9Ixa8hWJNKzGIPP2FNRyWQgZWZoTJYxnAymFXnKU2f4uNDchmmqMQy/WZ7+aPjUOCMxhxZJku3Cnby/6/OKKmhCDPKK0/GTnmlYtxUTGzcJHJvHVLo5RcChqgwHfVRfhWpGeSeMQMASkDgNvOW2O/D/ujeSJ2NabYUgVo5m5nJQYt9Oj/hsgbm8nWLJ2JYWs4HrHy2084SwU+rcCTrd0diaeCgV3nqNSamwH3zs6aHycKKX26ni8iSyud3NbMnJiIWPcCzIA9J8Fu9Qr9TaVYPlFRq3Pum3qAOCs8xAuEPj4kAWbwR7mchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUYat4b1jTsSd8jiz8U04ICV7lw3Puig209hzPHea/8=;
 b=pHnHeEhHwvh2fBhOtCg8N+PA8WrLU+1j/yCW9SGbQD80sdg0h8gfGyj2et1HPBsR1yDQgGhjGs2s29L7NSXSKeYkG62P6CauPgiTSNqbCxs2o0HqSbX7Q2ZbeKE4Tozv0VUOFOeBh/korzio8DMGswVD8eHeOsjtWi93l7DEyDSlC52TNfzXnOtuBrzXr0B88Wa1jCuQEjZRLBEJo82WTPqcMAtTW+1i0H2jfv0QWIe6kQyYTaoO/vXvLGkE80Og9t621Pt7755Q6STcM2uh5ShjDql5K9ku/ejMFHun0NivOrpjUYXdbxAeRI9cd6LiYgodISFIB5hMTwSNIUnvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUYat4b1jTsSd8jiz8U04ICV7lw3Puig209hzPHea/8=;
 b=l11xlD6yWY7pDocQjvQjbot/Uu6PxWI7lb9W6IKqS0TYbGNDA2bWYDckBUSCtXrEp21IbCMo9gHBoJgSe7kp9zagQMwWnvAqA4xW80FrZeT6ezxB8vsAusAcehzP1ltO0ax6oIoKHbSnZTT9+LPOECvtkkRfrwzOYWFfWEPz7XQmhCRoDcGWbTbpBLiCgehW9N7qqvS0ex/ljP0np06bJh9p/S1I5inzyTTg8m3hWOvy1pAHeqzqpAP86O+e41z0G7zxGe6TNCKiXIpwSTU3R6ov2fLCMOmBfgfwcmQfXT0ex72Eavt4qKXzzwf3wv4Kn87KezRw/fJ2Kus/0NIiZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:32 +0000
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
Subject: [PATCH v10 28/28] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Fri, 10 Apr 2026 19:49:53 -0700
Message-ID: <20260411024953.473149-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 19200bf1-192d-4314-dc3e-08de9775191c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	K9qMV8ciLZ023qXS8W4ht6rdQ6BCMZW/EONWf9e5ngFy8ZamrwFZrV6MNly7tEHVVjP6m44UvojBpuE8lLMDrsqlPO7EpUhQpEEkwUPF8NHKlsyCSVA+SEHLqrEbcolmuBw6ip6rxUGn5T4i4LQckogppBvfiVA/394VYMS30hlCKK/lb7K59WtR+cledCqU2wBcunVcxy3XbxAX/QvElakFTf5DKW7A5QK9LHz+WYlK+VTou8g1GbpI+60vGQvGqmml9Wd3ggF0VvmLikz+ZqL+hv4pVROyqhiWzUlWVKHmkR24sy4Oe5sx9VhHKzHLn2WUc50Wp6HV22R6XbCVIyB+xpPOdXNLzIulcpin3IBwc/PJCknvRNBwXDarJb+rFW+8qPSiAJGMiikAb1l/Zzr8rTiE42mA53zV8h74mvxUVVqFouWenFCKVmJ2vb1p8AS2oLGBLwEXrTDmQZh5yoncgiB7XRUHXDiVGx7BCa1yRqWSaqJNR0dTnmnW2P9Fl+xhtavWGk19AT+i1i2Xc0i0SdzsM0b3b/ug8NrAFGkUooisIffbZz8H0m/zjx9w93TWLAlwkSiE7OaaQ+BJiXa7NvqSYLP0dvwAz2XAb27pLwqAweQ4bc8Yn0bTo6eWjjF/DscidpyCQIVdGjgJV2AdfkO+LQ24JtahAwg5jy+8yXgGdM3bhmf6Ic8Y5P3ATtT1nNcvqbXVbBeOjcvfOxXJG6MMub/7RFANJAj44ME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?orXG54A+OLBPFzruejhajQiNqk8vxknNK9G8CuFvS9QkAkpAw20yytrJJb6l?=
 =?us-ascii?Q?+C6S9NUjPE6IG2iE9IzQYHDtSvtb4LlO2mjB8qAVRm8atuTFdUJzSJH2nWSI?=
 =?us-ascii?Q?lgPJZLtA7NTHamE85UfZMMAo/TS4ee+JQyxKG+G5vhZ6J4JAd0Zbwl/K67Xk?=
 =?us-ascii?Q?0rlj8MvD5TOyatxGC7knrROBBG/vOucKegUFrlGdfijAHCOp/QQ/QWGA04hb?=
 =?us-ascii?Q?0UvXLJAwkJgIhy1mvJbJ08fVD6kUeJ567zU6YQMhBsg7EMKHvbLUh0cDSJjo?=
 =?us-ascii?Q?vBl8xBnbfz7AR91Fmvs4jaX9S9LR9AIfNcGyljsYMj460XQy74RgACzksKh+?=
 =?us-ascii?Q?44n4Geamg9mIwz10TQvLq72eat4du+R5zXTwRNqUfWeABpkdNsbONs81bnFz?=
 =?us-ascii?Q?xEgh+lr2EOAgXSQQDNUqBSaW1v/TTAwWv15AsHrzAOnN7D4G2jqLdyO7xsld?=
 =?us-ascii?Q?dzt43QtdxPTkz25rAjek6wwJ8x7g+nn/4FIKqsTIVOwJOym1+eGuDMxzaoi+?=
 =?us-ascii?Q?8EXwmA9OnwjLBL9kApbBinUl/BlzFvtDBOueQ9SPMqCKSZKn0CJdmNJ7hkdx?=
 =?us-ascii?Q?nvaJsVl33a9RpRqA/8ZDr5ARLLTvPKjYj1Q4uoNV2fGMHrlB5t7RgSuQrvLs?=
 =?us-ascii?Q?66SJ5npUT+hi0saQO+WSn4gD85CdIBOFYQwZRD0coZu777uYf9Y29oMvrsBR?=
 =?us-ascii?Q?YbmuJRhkNc+km1X4FC+98gBSF+6zG9l33FQ17HuWvcZadfEeVSe5TwG2gaQQ?=
 =?us-ascii?Q?s1vk4/Z4zXnWOzoitHDE+d5z8MgCEUbEUyGpEFDHSjLfKQoLo0FFHpBNYmWl?=
 =?us-ascii?Q?DihEwYlXLk2LgWI+KuqtsWyIi/p1qmGBACaHc/m2E9CChelXfldazqjRYd0y?=
 =?us-ascii?Q?LlPonvcoEva7bvuawVSQ8mkSY4kfkEDemQxiAAF1sxi2KmXANr1O6+c0E76A?=
 =?us-ascii?Q?Gei0nWmNaGJt55PiH5xt6zc6IGx2sJIIzxaaTtu7S5wx7CgdJhttTM7igF4D?=
 =?us-ascii?Q?QW4RdpHSNC6UiRMg8t57wyF412FnGLbnFcyuiPkiOP8iZYSa6bPh4KZrsvww?=
 =?us-ascii?Q?k7zFb4l/Jd6Bh5baSt85H+XybQjTZGBzi2Z1zbYEtCXdg3l6BFLMbJELEhWN?=
 =?us-ascii?Q?OHaajrRynOFf3v5O0bH5UWE4LlM2/DRVyNRaOKxA7BjMp2D9xJWJqlYztqRN?=
 =?us-ascii?Q?EIiunvCvWpupHivgsmR0kxrM5/2vLA2QZw73GIQipKel43e1ovwD1nXVWHc2?=
 =?us-ascii?Q?aBUj684YYtrvSwBYKbNr3dlLEHZZxfshsMyLsjXm7MKofXB73LQ7zf0bpFVs?=
 =?us-ascii?Q?JWqz0Uj5peAJmeOsikwM7Nkivb4qyQIU450ti93NUrO6PNpu3m8VOXdc7q2S?=
 =?us-ascii?Q?AvGPT/8uLhq2hGNSUTCDFZdUfDeuuhfnQk6i/JywmAFm6M642rnoISSGPrbl?=
 =?us-ascii?Q?IVNg/V4hcsxgmvMOa1KJvPwaA5nSoRB3mqFhJZJpEluVCaf4z48qROAJlQj1?=
 =?us-ascii?Q?4mr1mSKs4sSa9XD8UgaBGWgOZyzrwNwrMczAKTX0+BjG7zbTvbV1GwBVNj5K?=
 =?us-ascii?Q?vYHELcTD+zfviEN5Iz1jPncqt8wsFGpLhAOtKd9qFCjMYhDQ9NVPaxWl1jB+?=
 =?us-ascii?Q?q/S4Xkd1t/BfxxFicnLexJYpJNqmWFIBZ1Bbb9UYugSFoVBumhp44o6jpNy4?=
 =?us-ascii?Q?y7p9F1p8ZFsXHdtghYoY0IhSmt/VA7Srk+7S3+uSZQ03Sp9YBBKriwwoS98A?=
 =?us-ascii?Q?iGVGtyx26A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19200bf1-192d-4314-dc3e-08de9775191c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:32.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGl9ccO5P5Y1FRKg7sGzsbWHqmwED1CNMuVPZSvAMOeYYr0NBZm1OGsADDFix17K5F+OtTPuDdCHGxv0Qb4mig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs      |  1 -
 drivers/gpu/nova-core/gsp/boot.rs | 90 +++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs     |  2 +
 3 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 75e06b2d5f06..db23a1995327 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -278,7 +278,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 703c9ee48363..d9d8b4e0af06 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,8 +3,11 @@
 use kernel::{
     device,
     dma::Coherent,
-    io::poll::read_poll_timeout,
-    io::Io,
+    io::{
+        poll::read_poll_timeout,
+        register::WithBase, //
+        Io,
+    },
     pci,
     prelude::*,
     time::Delta, //
@@ -54,6 +57,54 @@
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
+        let hwcfg2 = bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>());
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+}
+
 impl super::Gsp {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
@@ -160,6 +211,34 @@ fn run_booter(
         booter.run(dev, bar, sec2_falcon, wpr_meta)
     }
 
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust.
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
     /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
     ///
     /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
@@ -205,7 +284,7 @@ fn boot_via_fsp(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
-        _gsp_falcon: &Falcon<Gsp>,
+        gsp_falcon: &Falcon<Gsp>,
         wpr_meta: &Coherent<GspFwWprMeta>,
         libos: &Coherent<[LibosMemoryRegionInitArgument]>,
     ) -> Result {
@@ -229,7 +308,10 @@ fn boot_via_fsp(
 
         Fsp::boot_fmc(dev, bar, &fsp_falcon, &args)?;
 
-        Err(ENOTSUPP)
+        let fmc_boot_params_addr = args.boot_params_dma_handle();
+        Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
     }
 
     /// Attempt to boot the GSP.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 77b11c7de3f8..c7935abde2aa 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -349,6 +349,8 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FALCON_HWCFG2(u32) @ PFalconBase + 0x000000f4 {
         /// Signal indicating that reset is completed (GA102+).
         31:31   reset_ready => bool;
+        /// RISC-V branch privilege lockdown bit.
+        13:13   riscv_br_priv_lockdown => bool;
         /// Set to 0 after memory scrubbing is completed.
         12:12   mem_scrubbing => bool;
         10:10   riscv => bool;
-- 
2.53.0


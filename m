Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FCF3A2577;
	Thu, 26 Mar 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489197; cv=fail; b=Iju6X2bBkBm3RbnpGv8leIFLj7cruakw645bzfTsh6ffc9lUDBeKanqR2ccLEJEuJnGeppRDoVNQ4/+DOgZP0ioEYI5ZwrFCi5y7GKeaycnBAZ6drWSXyLxpi8v3aKFtLXZRAbZ/ynqE0zaR1Tol9kvBfrsO4vUP0aiS5CaEBf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489197; c=relaxed/simple;
	bh=i56sqOhgXWO/qw8ermF2R6KsFQxClj0J7lza/0h6hKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A4+Kwj9Gufdb6OrUkCFU7CzASLGs+fwO/jN4MpUH+cI4hrJ6hCeMXe4C9lG51i1nZ2xY9dWgip5rpjKO0u6U83O2I6mxSXHKxwl8uGe4vYWMbkW9hnCAmMeu659DpH8GnKPkV26Wg4cs2XrXB9qE4JubBjGNTyfurnNnyko78bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nxe3fCLG; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nxe3fCLG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vfbn/CkZfA7bi18rLlgUEh/9mkwVU976HrsjmUSGa3V1oz7Tu+aKpDWRUuICSg7jFnDEtbRs8WMuCjLCQ78H+1/9pK6rtcNsOgblg5319W5i7hUD4jOl1qmlQUGRpasAvNUE0BQ2mMIMhnMRM1Xe5x3dWRkSZF3qLr6g7AxI+EqMHorKmpIyw8WaHOw7iSJrHrHGCCpjti3dhSKm8Iu+ciDN9LLSsSFFVKFX9hb2mBV9BLfHhAn+gOFsSIASnCrRlpeYPX0JfoUK+A9oa84i/TjHRKxaxAuCxkt6lkWjt7z64yg+krKspEp9VAI49lyoXx2dJKDr/C+jCXkCrvLDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTuRgQHa3STRmFI8oXcXUFPigBidPZ03ZCzKoTxRlck=;
 b=VDJlNprOT7A8wGZOUk2RiEK62CnNHPpXn7vHEz6r/9uelX9nfkrms5Jg+EzMaanvWHq76ZTADlU0QLEUJp4lNzD7fYof9cgJVZxRe1nAjvV6jv+aIvqwSs3CpnICQOX0BjtzR2oIEso9SMu/cQEiuO0lQ0OCpziikdo0Trtgzhj3aBjVAuebdeM2eD0T3pXhs6sXf3/f5XWXMLLiMcuowcoXLVIdWhFH0VdlX402NienU4NEUxx0LzXusfMlFAUoJPDfcVPOdBZ2aic40amlDNA7gx6rYZA/Fy77ukLCurhLByTh/ICcUen5eXcnV5NIHeW3WIEnBgOcnK6+bIuJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTuRgQHa3STRmFI8oXcXUFPigBidPZ03ZCzKoTxRlck=;
 b=Nxe3fCLGK2mlm3o1NJBgh+60TeacQn69ZGKj3S4hgAbl9wCkYNig8Ks/iwclHfwPv5s3Cavf65M6D5z0kmXpjAMviY7TRlSockGIeAudxSr6pqvEDibJgjxgtBIM3hd4FNTQr0WhYwWAPrUt/dG76nF5R/DZK43KJhTuEuNED1UOcQNVDoKI4a7XtrVmevdFL8QPNNJlldupDCN/04jtsd/v2kdlvQqezq1vhDtwlN/z/EyUWRwUzxdUMpjTaDSOP8quP7vbBQtvrIt7L81IWXxIGjvgFRg1UO82W/Mb0tNVn1/CMgJD+UIwBd5wSyJD0af40MR2GVK6j6vJ2nHQQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:47 +0000
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
Subject: [PATCH v9 29/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Wed, 25 Mar 2026 18:39:00 -0700
Message-ID: <20260326013902.588242-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0c3deb-ea5c-43e1-d23f-08de8ad89010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RHpK0u+gEZ0gX92bFXAJp6o15qbIJyLnWABCLAWlsxOdOwQRk7uG6NrKWPJz1J5EMtXMNjp4UkAp5tCdGxiBlV38XXUhcusMut//Ri+NHqqLMhWRN37fJpKN/kcy91JUfG+Utv/IKmzPx8XZxAZccv1elDQtnyq7n7bH1BqyUaqLthj+cUTuY/2oo4OzDcVHcA2QyIMdtsSv5OGkpaKLc6JQbXEzk4mHTtnyu7F/OdvPa8NQS6t8wz0mbqkjBfZ9VBAcqJW4dAkdl3kzMU4nYO/rQj2Dwwh4W4D6GPFPc+eLewuCaQf/fo+yoMOm4B9NFvcta4fz6qRyM1iWm69/mLxTtOxK+Soht5FSFG9HKk+cX2EqdmMDXb5TAAW4SKbp9oZxP7t+CAsyG3nAJ5ZaeQLq0npRpPhaJDSBLQNq6uut6IXX2ImCP0maXd0cekBm0ruKVJ/18JXnFw1p1lRggYpEQuTvGA0zWO8rhAZkiVqVg+GXVe6S+oRmpHNesgXOLiS8t4A2sCcd/iwSek4Ls+ZYOhvuliawe0ZVQkV0qHXPEM7Z+LQ7gqphl6bsi1DXuVYp9QNAKJeuG1MZIpKWHbcYigbHtYDWcg3sHo6l/F1VjATfHurXWrqAZR8YHmYCjpivq412XzBGPEliJNjBGFXsQHqyncNuKwf6pBtGwC0kp5tmXs7/j/6FQ45P5b+xE7VwLV38CTu/K2JBV1rUZBxNVuvt+zTQHZPnUPGd4y4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fsW7zAxytGT8KWsu58e88Xj07L0GpkA02FlyBjC8xF5ToFpEW6ZoEiG1F1Dk?=
 =?us-ascii?Q?9ENCTuge1C3peP6ffjFkzfiE7H3QTo6YHCpOQAUJbvDQ1qUp2kSniI/O7nli?=
 =?us-ascii?Q?vlcyr8/+oqk3IMAFi6bRSSbekBn32qFP6dOZW+6z+QyLgCkFEeKXXmtM4sG9?=
 =?us-ascii?Q?Zn6/qmFJCfRAvNWj+/WCcpcwXQimUVfyhVD1KO44sECcnnyfcVR/XqwYZ0JN?=
 =?us-ascii?Q?GTHxMpejnIACPwZR6p6EE0rTwWQTetfEDliwZ4W1LUtzfHQCQ7p2bAij/Op0?=
 =?us-ascii?Q?evw54hTwR7bbtg4TKBzDb4Fm/yRLpmE9LCyHwb+1y8Doe4+G3Dfn6eEIbjoZ?=
 =?us-ascii?Q?BD/zjwf052QxWl/2HmvaHLys1Bq1r/k2EHKaBX/1TPacONljj7phy2uIqeqr?=
 =?us-ascii?Q?VJFgmVr/tMrAllt33HiCF13eOqS53ZveWEdwzGSUhKywXEpOs4d84i8SlbT7?=
 =?us-ascii?Q?QonUaCEwZFHRHfP9J2tP95Jqi8pb6Qx0S2wON46MTTy8ocM6WfrGUEtgYaUj?=
 =?us-ascii?Q?ZAZFcuHHB7wg9BrCgmr0pApT/A2WL38OYHW/Cza26jc8WgP45nADdWoyGuwA?=
 =?us-ascii?Q?ebt+J3b3iJt/4blqAlPWg1IKOzr7L/p3N2rhU+Q29lA7Q6uJCBJXtKXSK7ca?=
 =?us-ascii?Q?rXIpLxGMpCX7PsYHVuPCdUZfJD1sTBiFESXZ96TJB1EGh3ysfP711dCU/uSR?=
 =?us-ascii?Q?tUWs/woNB24G01XLarPcffMxvHFvME3x6e1tTgypUQkqjhtXG+hJtI9oebRp?=
 =?us-ascii?Q?Zwytm6p7caEjmeuiEZOE98YjIPhGs858DsL1cdzmQe/xDu5Ao3HemNDtMgKs?=
 =?us-ascii?Q?8CKl7mDXCsJcr0CoMnTvzzVBqdkdU3vZ6cIcQWmyHdPUbl9kIe9xK8/1BTI2?=
 =?us-ascii?Q?2sAIeXpVLWko/lQWLbPUSKUv8Va5kP0CxkgQg8LGd3/IJw7CicON10KncerK?=
 =?us-ascii?Q?NgPeQ6qRkSRWdoSC6uIApNfsyf6A29tG+x6OqQH2OO30qBv22VMyO+9gog6e?=
 =?us-ascii?Q?HMVThQrWTqLQ1FuG91XiD3x+iV0p9y8hWYgnXjh+fyLuMvW908K3UyIcF19G?=
 =?us-ascii?Q?cUfQINcVbS73ecAlJDYL6lZdnhXfob2NRyxxf3Wln29VpO9i5S/rLbp8mb7c?=
 =?us-ascii?Q?WdbRnw/uWwUSle2eOjYqLfUNxp2oevNLVR2wMEUT1byuMzIwmOQW506Sa9aH?=
 =?us-ascii?Q?LiAJXfJK/5F96FdF0CqiNwnSP0UL9THCRrUWxW8Jw3szeVmaRVAYXgATGcjD?=
 =?us-ascii?Q?p6hEUn/EExT8PLM6847Ayfcp81YgNAIG5f7fC3m+iaVOfyULSvtP6Ko2evGz?=
 =?us-ascii?Q?+qHc5PyCYBcubdEvWTayNtQG6Gl1NaXUg3PgA1OixAvfFX+08P3pD2XwbRNE?=
 =?us-ascii?Q?QdrGiZORqvQzGjL1bgCYSRa7LILsbBtzp21vRwEUrjs5DquHjWt2qMmwzcfw?=
 =?us-ascii?Q?xwatm6e4wb5ipGswVxVjX4bGkuYYE5w3wp4k4y18/UqixHluIjwuKzs95Ld8?=
 =?us-ascii?Q?xIpgGHM7iCMr4oI8a5O98LG/F4FPtxI2t96vGsXkMpU4SH4GC9ZULJi/EPBF?=
 =?us-ascii?Q?u8SbPREIn9q/4vu4abMhE3Ewn5kXxkRghBi9f5iI2PDu+ztGvQaIcDkaF8A/?=
 =?us-ascii?Q?IaLSY0i4HjqYBQHzeU7p8DMwWF2QC03JP+qMeQ+pzFzPp9bH164bL9oba6om?=
 =?us-ascii?Q?UdwU18IJUXDB0w0xqSTG++Rl8IwRUTdvTvuvNnoWqM8yyTnxirVSgN0lT+cK?=
 =?us-ascii?Q?NUkVu5r7oQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0c3deb-ea5c-43e1-d23f-08de8ad89010
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:46.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTeYR++/jmI5VbjOVGdT2eyVsK7ShKsSXUhELpWDW1rVAfgf0mE2oNStgNCLClUdU5KB5rB0pMfmRsEBLlimCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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
index a255ee1474dc..cbf1665022bc 100644
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


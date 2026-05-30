Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363D4357D11;
	Sat, 30 May 2026 03:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110645; cv=fail; b=PLpsB2MQ9QCc+FGZYxpqQt97MBgGl4n/vdQfrBd0rUUvXJQvTTge3z9aeV2O8prst+v9n70/yc0P70TgRsBUG7i7bs93bc4ZDwv4xN4v2iL14uOUdW+kEw5/8aRxa1LXtjIg3RZ1nnaYRdN+tqzf7vAcqWQLNDbNajWlqMAYfdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110645; c=relaxed/simple;
	bh=XqVTUWxaq3lwIT4VyKa5hUzv56NLbyOjFbneeghd6wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dgu4G0URA/a3zn00T8ez19I9v4P5dDaQucCWUMjFivfq062k+j8s41kh4jw1m0lf5iBPVMTBQpDDDCmLjhzzMvf+R82jFhko8YYkvxeJ0NboPnGkTYOGpLqY3I5t2AGyJ1fQdTtWWqmEjkEgp8b81UAZSNLoboJwjdkdddq1wqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=twjhcRke; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="twjhcRke"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL+krfvcgD+cjiaZbMbnzMdZVkOiJBYgARhXClz83JoSiOo4X20LLYK9ZZ+vmyqSM83U4ZCdyNcu9bZN3t2qqTy9FsRj3l+ziE3KE97haYoLz7Lifst6L1747ynti3uaAtoDXXWIjREHqXGB5SEed/PaQtBxwRaSLFzanpsd2M0ZAShNwl9wZpPiRSmPiPmYw25gbUegwwcBhQ2ikn06lA5j1gxbhRAiGaZx5GXMr//Q9u63AyPrhMtQ/1GQ7BaJbq36k/3pQDH+cngK2tgzplSjrEMPjjBHdbVpnW3HbVerp6TqVICVksn537o/4RjwWOCSjvCyyqNG4fBQQxPRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zQ0X+9wNIQ8oiE6sadnMQ8uCkR575148r7BhGaHtBc=;
 b=jAL793PyY2cmt4nH8bHOHDFpzKsWnGGQ080Inv8x7bwcu6+dgrVj7nMhvV0dPfxA3WHDBf4VPKexLdCIJQu5TSh0SnPIn07w04Wg6n9ASwWw1tRci2u280x5OuAPXz2PEKnHex18CZqOlhIc7mEsPvYmEdEDdAgNaUfRvYivPgS7QJOBAIgNdpEwM9xRNh2gd2vj/XYT5eOXm3jxyeX9kSdB+btkU8J8NcdHCZXOdoTD77b0tvb0y4ELLYtL3Lq5Jjqwu/pDB5PdhDCLq7dCeg9eyPkTECRca+ExpdyiJBLKFx8jC2GzHY0id8nCKkw3PJy/duj89+Vd76ucdnJuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zQ0X+9wNIQ8oiE6sadnMQ8uCkR575148r7BhGaHtBc=;
 b=twjhcRkeF0KLV5vokn6fkic0/hwwenTiOhigsP2YWgWKf9KX+uSRAzbeK4FJK2B1YBz+tCwSXSPC4+FK8NAZHh+8CjrGnmqMslaxq+aPIDSy5L6J180LEA+2cNbZlJdWCuhIVQ4TLQJp8bDr8dXVWohaJx93OK0zKC9pRtmvEK6u0bxaA7OHxcmUpn4/OWBhYK2c5XlFYHLqqXiNfCX1r4reoNcf3rk8lFdWqJfJmrRT6Z27mdsHJLXGCk/0HTCp9GDgTR3CDsJfhQrhaQXGeDGKhNXIdCDl6tzoiAsB/NgiyQa2mqvpg/Rl2r1Jzu2CmQVkmnV32MdtSsfGHjGVNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:22 +0000
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
Subject: [PATCH v11 20/22] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Fri, 29 May 2026 20:09:51 -0700
Message-ID: <20260530030953.740561-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 172f651c-d8a2-4bcb-4804-08debdf8fc74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|3023799007|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LvXZnsMK+Y283Pxyc1HPl1HaRhT/dKex3p5VCwOP+tQCGxalsLOSFC8v4VWVc0F9xJ3dVJrEqeYLQWKYlrHJ4IVXyAUo189t4ZofghM5FtDBpb9xbiv0gz6Uj6hzgEKmL7u634283T6XTOpQH6L5VHU382a92MjxDDr2W+6K70G0fHjirgV2srrFJyPM2M8L5d3fOcSkJIxmypoZ+RHxoxBsh2gO7yFaQlXk1EnGHYCzcOZu74h6O5/UIloNUWAraADRt7kLHRV99Zt2Nnca/Ez/o0Z7BaQr2zgqxscEevl6AERfI8jIrhIYiDGLxJmNTLg3RpyWHu1RBY72rlfnE2PNifAbITp6ajwsj8STTXGg9KCFWuKcafpZK8zj/Re7f20hhC5vkDjovrIm28rNhKwxZJfgRQFqG3RC3XJe285z0JHwfi4zC1865BKxbZi/QFk89HbsIsVejEmQSaWQNo6TgObvrBIzaVi5TuilpZJqz709hemw8+v8dhqYG9Iy4ryadIfLuRVIaygw+zV4Y5q579GoNe3Tn5bAN5YpjI5hkMiu3r26lc70WW1tsRHElBGqXQUN3rVm6LpY9w3CtaCWGzLhFQobJFVY61Orq+Cua0+JsV1gfVap63Nhkqf8NBbZqlCoQRsQAue91+C/ZMMoz0QwikMjAF8d7DwB5NKCHmgiT5qph+ljzMiANeBg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4p9bIXi97gHPCr0Bakynx/LaF0a9K7YcF/mzKYHCiOiRV7gJpA3WUfM9+ef1?=
 =?us-ascii?Q?Mv9ZMUD/PJxM2qD+/1bc5xJnHYUNfst+uW3AygJ3DrMhavK7bdNU56LgTLhS?=
 =?us-ascii?Q?lwdpYIhLSfRQWJ49fknw/RhxpaOWgRGLqNA8LT5U8ne4hbj1vyCTKqRCXbRr?=
 =?us-ascii?Q?E+kRBR0EOd5lwCweCzeAw+wlcFY16NOj6jzdGY2CWybGZXFGvTANYso8Dhsp?=
 =?us-ascii?Q?VL4AN1VSTpZghXyKbBMCizI9ezgaiysPxxNTgrEA8GvCrd1GVdpe/9Y/VymZ?=
 =?us-ascii?Q?GsgxQXVyl9P4U4IvPkditImTGWOmuqdcFT4kIgNsCQCddNzGPdaZb0oCBVj1?=
 =?us-ascii?Q?vo/SMrYjfG827zUB67ny3I5KEe9C3VM8+ppkvg9HGubS0tH2jLc+k3mDKpMx?=
 =?us-ascii?Q?3hxbZj/IsXx2ELYHzAN3PBqFjJyIRFVv1FesD3D019aIMrlUk3cjUfEu+SXe?=
 =?us-ascii?Q?IlYSq/7/EVIVA5VXagY3B+B7GUhxTIALHgQ0pvdoh74ansKcSwUmix/o40Tq?=
 =?us-ascii?Q?BOOwEa9MXARCEkJhNdaaskvQxDsR5lDRjCXN/++O6F3gcRMjnSQ9vZJxNvvv?=
 =?us-ascii?Q?CQXtUlVvRq0SymTIVkdkgg4XVHzjjc+gjw5ZzHMvQcHNkKx2PWF8PE5LAKiS?=
 =?us-ascii?Q?Oxk0gogzcoHE0y9DGnt2D+YeKaU5ktLODt3CZ8Ce1pzqoHLL7GawI7w73ZlP?=
 =?us-ascii?Q?VVT4v0wSmAyvmC0BakH+ZEi0tRGC6YALc35Nv6qQO3EZUQAvTueb+hk5EAa8?=
 =?us-ascii?Q?O0TG3V4UHIobIGZmvjLrKNTbpngVgnrJG9qEEMf23YQ/Qxi1rHnmS8A7ajb9?=
 =?us-ascii?Q?WPdPk9BR3JqxOWHdWh2MR9VKPHeTmeI9rNgtnMwW3CU+/vGAdeOzW/s8nq2H?=
 =?us-ascii?Q?ohOgt0rJXVDJtgoHCAzXQUhC89ZhU2sqLdgKxMTfPbkVKwXhpeytZIGlxXxI?=
 =?us-ascii?Q?EGjlVVoPtyzMQuurpW62z37SAku9EVMcAQpcF3jOshpeqcF4j9zw7xp3QIM0?=
 =?us-ascii?Q?zhTO7QC16mGNTdS5dP2obQ07h05oMI4Ru0h4IscIV7SD7DjkJd5hR9zmorbU?=
 =?us-ascii?Q?FJ1HAceaQba+jw5GTXNJWOztaKFwjHJoGwwPJueEwZfneBOvBZGMmDrhYL6Y?=
 =?us-ascii?Q?mM11MiOMCdKb+w4k7aTZad/rj4ffPYiqNmQtGMy8LIdHvMF34t0D6hC7og3k?=
 =?us-ascii?Q?ZWlQ4S5BPXEVFOrlQt1xvuUtvDw0KIAwtWnlqClPyRvVgDu+O5xx4IgSilRQ?=
 =?us-ascii?Q?pF9BIAVodjy+23jg9ARDTAOQg7Vs2CB89GAIkrCwQL+Yt25DjOEvwy5oAwIv?=
 =?us-ascii?Q?jToZizo1LP4I7VZ5uVwBsjUj/kye5jvWG6hLuLKXFRB8UU5Lrlcb9gG2cC9b?=
 =?us-ascii?Q?0hFa+1++XBL0u4tgCteL2+CKOHDA0jDP70mYGpaXjycYKgTUzkjc5Vc0J+DA?=
 =?us-ascii?Q?Uf7cy9MW8hJU8fQWC8kNcBR2r+qjVyLTmV3NU+224m3otC8kDgfGbnccG444?=
 =?us-ascii?Q?WgcwtDmXVXOKG18MhfwP9g6gVdO1Atg01glF6DvbKZMPYsrYiaaeVuyhCvZK?=
 =?us-ascii?Q?sNp550wZe8SrH5k5VzSFM0YI7uYCMeLbAUkWS1W/MYfxPM50HycmZ2ISd7Or?=
 =?us-ascii?Q?opFvlEwF3KUHaXYJxGsvGm9TMyFnboorSYprt781/fs5k5PqegjIXQv6lu3X?=
 =?us-ascii?Q?rDW6ncbY7Wk8LYsCAl5ArM8iUGZtnkb38LyUfSAFFxVaLubJ9PrzB0jueKAe?=
 =?us-ascii?Q?bk8HRMBFhQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172f651c-d8a2-4bcb-4804-08debdf8fc74
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:21.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzUS39BS0O6nh4+++QVeS/qXBzPnUFVBf+YSrANIxB4xH56iQHoA4Y/ymnUfOyHklSd9+k6pCDg9SEq1JUg4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs           |  1 -
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 90 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs          |  2 +
 3 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 5878d86323b9..15d4b01c284a 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -163,7 +163,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 946e88481d6f..1f333a6f57a0 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -5,7 +5,13 @@
 
 use kernel::{
     device,
-    dma::Coherent, //
+    dma::Coherent,
+    io::{
+        poll::read_poll_timeout,
+        register::WithBase,
+        Io, //
+    },
+    time::Delta,
 };
 
 use crate::{
@@ -32,8 +38,85 @@
         Gsp,
         GspFwWprMeta, //
     },
+    regs,
 };
 
+/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branch privilege
+/// lockdown is active. The low byte varies, the upper 24 bits are fixed.
+const GSP_LOCKDOWN_PATTERN: u32 = 0xbadf_4100;
+const GSP_LOCKDOWN_MASK: u32 = 0xffff_ff00;
+
+/// GSP falcon mailbox state, used to track lockdown release status.
+struct GspMbox {
+    mbox0: u32,
+    mbox1: u32,
+}
+
+impl GspMbox {
+    /// Reads both mailboxes from the GSP falcon.
+    fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> Self {
+        Self {
+            mbox0: gsp_falcon.read_mailbox0(bar),
+            mbox1: gsp_falcon.read_mailbox1(bar),
+        }
+    }
+
+    /// Returns `true` if the lockdown pattern is present in `mbox0`.
+    fn is_locked_down(&self) -> bool {
+        (self.mbox0 & GSP_LOCKDOWN_MASK) == GSP_LOCKDOWN_PATTERN
+    }
+
+    /// Combines mailbox0 and mailbox1 into a 64-bit address.
+    fn combined_addr(&self) -> u64 {
+        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
+    }
+
+    /// Returns `true` if GSP lockdown has been released.
+    ///
+    /// Checks the lockdown pattern, validates the boot params address,
+    /// and verifies the `HWCFG2` lockdown bit is clear.
+    fn lockdown_released(&self, bar: &Bar0, fmc_boot_params_addr: u64) -> bool {
+        if self.is_locked_down() {
+            return false;
+        }
+
+        if self.mbox0 != 0 && self.combined_addr() != fmc_boot_params_addr {
+            return true;
+        }
+
+        let hwcfg2 = bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<GspEngine>());
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+}
+
+/// Waits for GSP lockdown to be released after FSP Chain of Trust.
+fn wait_for_gsp_lockdown_release(
+    dev: &device::Device<device::Bound>,
+    bar: &Bar0,
+    gsp_falcon: &Falcon<GspEngine>,
+    fmc_boot_params_addr: u64,
+) -> Result {
+    dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+    let mbox = read_poll_timeout(
+        || Ok(GspMbox::read(gsp_falcon, bar)),
+        |mbox| mbox.lockdown_released(bar, fmc_boot_params_addr),
+        Delta::from_millis(10),
+        Delta::from_secs(30),
+    )
+    .inspect_err(|_| {
+        dev_err!(dev, "GSP lockdown release timeout\n");
+    })?;
+
+    if mbox.mbox0 != 0 {
+        dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox.mbox0);
+        return Err(EIO);
+    }
+
+    dev_dbg!(dev, "GSP lockdown released\n");
+    Ok(())
+}
+
 struct Gh100;
 
 impl GspHal for Gh100 {
@@ -49,7 +132,7 @@ fn boot<'a>(
         chipset: Chipset,
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
-        _gsp_falcon: &'a Falcon<GspEngine>,
+        gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let mut fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
@@ -68,6 +151,9 @@ fn boot<'a>(
 
         Fsp::boot_fmc(dev, bar, fb_layout, &mut fsp_falcon, &args)?;
 
+        let fmc_boot_params_addr = args.boot_params_dma_handle();
+        wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
         Err(ENOTSUPP)
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d4067efb8772..0f48e78eebe7 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -355,6 +355,8 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FALCON_HWCFG2(u32) @ PFalconBase + 0x000000f4 {
         /// Signal indicating that reset is completed (GA102+).
         31:31   reset_ready => bool;
+        /// RISC-V branch privilege lockdown bit.
+        13:13   riscv_br_priv_lockdown => bool;
         /// Set to 0 after memory scrubbing is completed.
         12:12   mem_scrubbing => bool;
         10:10   riscv => bool;
-- 
2.54.0


Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7FA348452;
	Sat, 30 May 2026 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110647; cv=fail; b=fcnRcFirJgmI9yDh9T/w8vkZNaAXBjCQpEeiZf650crpOeXvKPh1UQ1Kr8yRucl+OxNMmAzySQQQaYmamHkoAFFYDgxwibWAUyeOY6GYImEavbk5ppgwmu1+wfUDsIVCiWfz2dhlrlP5AZiyW0e7xS7u/AldMcSoOgFMDPZbXHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110647; c=relaxed/simple;
	bh=fJjEKK47jydt1AHAJEEWjsXZHUmQ+NH61cZyKirAY24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MG9dMmdV54D9JIHkKX8enLtH++rwbFiVLdqd9eCPObtdxHkhgSX5VUQ15zL7Agnmfv7KVu8Arr0N6AM10E7aRrfQCyqWkoihJkNhEu8qyLJLkM18S6/h6MHtZh4o3b24eZhALzdI0um/g1tnBit7eagcgQVCZyplCo8WbM34vl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=adMtMjJj; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="adMtMjJj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PupryYAHcnkkvYCKqYpZaZ8l2f+2WEuitohI6J/rn/mrz8/tapemQ7fyvmxEWnphEBkaqbxP9Ft4FMzd51eDtOlsHlMtRoC1bcg47qhdUy8S2n1a1a59aXj3fbVqpFI/UxvmOgqWHMq1PjRwzWbX3jG3mONnCreDsGbeXJisgBiLpoF6egZqNMA+7kEqkCByBk/TcDSUo+4zpQApeQUaITf4lO/P+qxJsW0iuk67EuSt7RaDnnCJdXZsUEhJfAFzTU/qRhvye2U7vbnlVbeEZfVFDaz6Cp7CiX0K0shsrLy9QFP9D3iMsvxni/AYRoC51f88bC83cPrkc29Ybiq9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWQ8MtIV3M6fmaSFVl7Xrau+MEq93XxCAWkuSUijVzM=;
 b=u9ZLaGXbBfzPIctpQOz4R1LeTmD1xyJ5aK7187dF+thIUN3gS0Wv+u3XoA30e0OgdyWcmDtxxXUIINTQbAmZPOjNDgbxN+xSVz0bMpK4SFbtVRq/ea6uVSb67RrIUoGkOo6GjJMH9sBYzr2ix5RkTxJB4GJvHe2BixUwx9T79jUS8Tg0RH/457Q01IYinuqxfJlqBI3ycqbaZLMk4IpxcSD6FF5nts1K84Rk+ltlrihzksk/FpyTpNScp9vSXp5OZNAJYa6rY83EAOPiK2t0UvDnR06v1O7qM4jqvSW7ZXQ5KII9kR3ONBDOMdTqo4Rm7rDE3WTEiEQclwNvWxFWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWQ8MtIV3M6fmaSFVl7Xrau+MEq93XxCAWkuSUijVzM=;
 b=adMtMjJj4ja7uSaNJxK7ircgzF2ZRX7lsT+EBC8K/vOoBTLjcNZ8zW6EeolK3qSBYBN9kJ0StV2MY7rqaNYkcTadnMptlHdlqBooCH3llLYhy4MDOPesY3xh65i3teo/tT+oBa5SYGkpFBY+vVN8J0XJj7izf5ePEZZUasYthzJs+WobBkQ73sgJlagsD6q1bZWk/GADUp6KDG7UyIDci6w2yoK1kuysUqUpr25Ajj0FnxMx9ex2QvEaFEaCiqy1qXSysweH9Km9t1HqgEizGIPF6UZN0KK6XSQ6lLMLgXmW2H8sOokUgyFpodnH33d/I9Af09icRdt0vXSuH616Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:23 +0000
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
Subject: [PATCH v11 21/22] gpu: nova-core: add non-sec2 unload path
Date: Fri, 29 May 2026 20:09:52 -0700
Message-ID: <20260530030953.740561-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: c6547289-9b4c-403b-6d0f-08debdf8fd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aM3nDf3kwtE9ES6PhviAxpKnTpSCvU2vS+cGe0oe48g9+pY9RplbM142NdhoLzVnFCQ2w/+SlxQs5ClCgSu8WszbUdqwUiaJgFQ9kZe0PrxiBdEt8HEBAXp9HW/12FQ+YtVc5JPgdcuKlBO9UhozhjyoWRlV37gf4mUWjH4Gz9hYiXd3rDL5pNgYSziU7juJ70NM64adOfHgFkmFR4AW1HGphyDFIl3OP705VBTh91CzXe19twt3JBBGdaxBCtXosMAb7esRL/v6CCjVGxjWQoZ1L+1d/xD1WJfS+ruMSxJO0snpj67mGkCVCEJwdeqy/a2rD4qgwOAKovC+LYy9B6cPasTctt0/9ebZ13h8zDd3PM0yN8VZKo8LX0H+NExN6XrBTDZymMlDrT8EYSoxJsb9VMRzwoND0EG7zwCp3dXr4pmKqeF5UawzpWSzxdE5C0rEfeDct3cCkzGocq1avYH7zsGLolj2s+rkuMtu3e+ZLPPA7uajbPf51XepfIQYWgxB10HFgkdd2zjk/CBD8rmEbF+0groaQ6fnFWYqMQpKMLDyLVRIkLqSPNK1F4r52R9bTCGOkDzbkdPjJr5vzwMFg5tb5rP+988PernRxenOpMETt2JvtWaRxmLH2bZoz+0zry4D4Nim5wH39N2sbcgWRZfHfLxQ+Wj0/OHgyspQzF+hghuolra7JyKkBz4f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R5s9aCE2Qme1ZVy/ulgqn9xRlrnja1BMwgCDAbqdC/GXNV+uvd/+308ohrO8?=
 =?us-ascii?Q?hHQ4H8Y/ySgdjVSmbK6itG8kQu4JE32HmXftPwCWC/KPzChCV//5BUUpuS2K?=
 =?us-ascii?Q?rITTUhOpTDFEHgSyhJ6nRKXUHCHMKnVEckJugzWTFN9/PKHTBhWfmvTJ4Bn5?=
 =?us-ascii?Q?Ypsz7XOU9+OXOD62Sx1BrcnWT1ZZB31Y1TvFhDi3zpXJ/aszWdgRMP9B1Hsm?=
 =?us-ascii?Q?OAnNfGMVIj5ctj7EnO5SL6UYPiX41P0CCBp3L7Z6bmkPD7a0TuVtfG+7WQxo?=
 =?us-ascii?Q?WPVsUZc6yckCXTIZknDhEvn+5gTIy0MW28njCf5F8z4br92v1hTFZl+PfrNp?=
 =?us-ascii?Q?yLsNMqzedg5tekIsQwhNaYm4KUPPwkYh37Dbf6UPwfglDv3zigvDoS4gTJrR?=
 =?us-ascii?Q?iakzDdRWX35OpY76wicBxzuSraTv6epGapXO/ncCKrSt/trsKAbaTpxC9O0B?=
 =?us-ascii?Q?vBdObiFWtDJmnOh4tL/9fR+P8l1swCSd106tnqzEYntFKC0iMjxjjdHOcpQ1?=
 =?us-ascii?Q?vugrw0UI25JPs8XZHLLGRZE+Zbepx3bBs3ejB7l8Hn5xFWDZbZph2xHGrHdO?=
 =?us-ascii?Q?u61y7VjpByFiqfBkN757LvLlKKYBTSJ8IZ2VNx+J0dU+Qci+fAkZrEXzjX6S?=
 =?us-ascii?Q?ODVQqtY+nROGh5sODEyDqz9SbwZWvK9NL6gyaIoOcmx0eJvWeCtnYBSIba//?=
 =?us-ascii?Q?FrA6Jmjplmgx3EqK+7EUHrNgmJbO3cfHssYIFuFeLQMBi0/JVHZ+77DhIrbG?=
 =?us-ascii?Q?r2ObRpx97+PRs0Ag8cLsGEGCkzwlcwWS8XIeWwJJsFXtpw4UTW4MgwNqER/Q?=
 =?us-ascii?Q?Sch+IFV+cZwTjPGJ6woc1/eUl3nJ8paJY/0aU7+Nbmr2Dz8q47hDUT90g9Bz?=
 =?us-ascii?Q?qpRRQ2Wb9znzQWy0kulbsLykh/AjZV7gR7bLvxZPu2WWkCMgkJz5CI2/Qr1Y?=
 =?us-ascii?Q?QPoqDx6kM5k9iFSUDI9gxQdpeHDnWCysdZG3owgJGHo2mImfCzWvxxvGZGq1?=
 =?us-ascii?Q?sGg0A3tzEOYGbJfs1Sm5cJwoXcUEUB7iu/nREdIAFGEeDlDzKudlWbOXlRFR?=
 =?us-ascii?Q?xoBoUr/YdQO7gsASvWd2YaW2FfN8TPtgX6ZxUtkN7oEWVWJNcriTEGXB7t7W?=
 =?us-ascii?Q?AfsrtdqECRLpjrs9aYgVmGEENGuu5L97nn1Bfn44TAE0sOytIYPzh9FQyVff?=
 =?us-ascii?Q?NCz68GqZJp8SItGQML+F4wdMhptvoChqHS1GbhWg9dF9SvWkkHw6CtWru+4z?=
 =?us-ascii?Q?lFO0zCcaW0HBa0tb7/CBA+lRqaVOmZaeUHBeqM+cvrbKgZlDI6KvIsyZa4KM?=
 =?us-ascii?Q?1mF9qjW3BobUFOIGAnpcYDxqwG0uqKDcBFJl0LEDSTnD30MfEAtQLUpuUqzo?=
 =?us-ascii?Q?KLDHR6buIfi2styYudRhIlcW+V6OeARglQZik12r0gqWqnih2OaHCOvkZ4mI?=
 =?us-ascii?Q?JNYKSxw2NJsb6fLzf5Gv4L0G9AOqBpQYQCh0FcPMrbgkeekOqcGPPN1Y+2K6?=
 =?us-ascii?Q?MX4Xonhe7qnSTOOLOqiIQRkrYoDqnLRoex34c0eCQ7uXqMAkEgmvnIRxBC8V?=
 =?us-ascii?Q?GVD8yu+gf3Uhesn2TRkSMLuG0VyS9bv+EVKhjtbWIzqE2XCdLgKZHFVIH0cn?=
 =?us-ascii?Q?7cvEw6GV+uad9oed9wV5IYJ8u74DOqYnZFo1zbMbCX42fG8+BVcLnoF1EJYJ?=
 =?us-ascii?Q?82dzdlLNQKIXKpEQiGwjyaMBGcHghPp4WIbkC8s5HnNa1RGJW9afmBlry62C?=
 =?us-ascii?Q?kA2WODSgAQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6547289-9b4c-403b-6d0f-08debdf8fd59
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:23.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0MhYzgcfIFTeF36DHe+lEO2vghoJaBD+zk8UdgFIEDjJoHHgoT/uAqk1KwkKhFSrKuvAPHQzwB1s3C1FCtX2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

From: Eliot Courtney <ecourtney@nvidia.com>

For non-sec2 it is only required to wait for GSP falcon to halt. This is
because GSP does the main work of unloading on GPUs not using sec2.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
[ jhubbard: use Result instead of Result<()> in the UnloadBundle impl ]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 37 ++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 1f333a6f57a0..0076ca00a771 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -34,7 +34,10 @@
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
-        hal::GspHal,
+        hal::{
+            GspHal,
+            UnloadBundle, //
+        },
         Gsp,
         GspFwWprMeta, //
     },
@@ -117,6 +120,28 @@ fn wait_for_gsp_lockdown_release(
     Ok(())
 }
 
+struct FspUnloadBundle;
+
+impl UnloadBundle for FspUnloadBundle {
+    fn run(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<GspEngine>,
+        _sec2_falcon: &Falcon<Sec2>,
+    ) -> Result {
+        // GSP falcon does most of the work of resetting, so just wait for it to finish.
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |&active| !active,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )
+        .map(|_| ())
+        .inspect_err(|_| dev_err!(dev, "GSP falcon failed to halt\n"))
+    }
+}
+
 struct Gh100;
 
 impl GspHal for Gh100 {
@@ -133,11 +158,19 @@ fn boot<'a>(
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
         gsp_falcon: &'a Falcon<GspEngine>,
-        _sec2_falcon: &'a Falcon<Sec2>,
+        sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let mut fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
 
+        let unload_bundle = crate::gsp::UnloadBundle(
+            KBox::new(FspUnloadBundle, GFP_KERNEL)? as KBox<dyn UnloadBundle>
+        );
+
+        // Wrap the unload bundle into a drop guard so it is automatically run upon failure.
+        let _unload_guard =
+            BootUnloadGuard::new(gsp, dev, bar, gsp_falcon, sec2_falcon, Some(unload_bundle));
+
         Fsp::wait_secure_boot(dev, bar, chipset)?;
 
         let args = FmcBootArgs::new(
-- 
2.54.0


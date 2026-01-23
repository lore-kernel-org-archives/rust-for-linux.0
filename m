Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020074.outbound.protection.outlook.com [52.101.196.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF5F2857FA;
	Fri, 23 Jan 2026 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188956; cv=fail; b=TZWvq5vEexX3EP+54owaxKmlX0j2HHvA9hftJ5Lr/WOasn0V18TFJJjH6KFWxk3YVgQEiyNBAROeZBFH1qxcfVQW3I5A7VWk/Fkrhf/8SfnoB6H6hD8VTmlyFRaWaJo2YAPwQmHuOgSnBWFU2+eyuBTch6/Yd+NYbzNnQucnfaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188956; c=relaxed/simple;
	bh=wXpOJG+ztw+YjnddDCY2u7UhJmgoYax9Qk8FyvgEIGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hb57y5S5x4P3EViLuTEifl1N4FMzT4xi23ZJ2ouyrVLEUEeYr3X/YI7s20kShFW8nQCj7WHE7rut6ql6BwxR3d529+Fuw9OUTVS3IIFkc+SNqll0ahjwzsMpv3WT42Q88m0tF6GoymoDu9zlLpUaKz/WsDsZRHV3B0dDcEJSxpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jJJrWK8j; arc=fail smtp.client-ip=52.101.196.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jJJrWK8j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqWTVsqvDBrlkBfGazwLid9tiZ5mYUruMA71qSkjwCcDpeTtvpIHeD8YyqrR+YmEYEbpLyPrc+SBGVWcSRUubt0Eklttw02e5W2olOrJCGq2KsPYomQn3uB5NuTJ3ZQNkIga79nvLRkcmzJYQJY9lBgTBQ1NfG4IU1rYPrgK1RXYAcb8ZlqlW62Y9SkQkjpqxfJD2PgcrHBHoqnOpGE3s+pTVy/BXyyBOS0h/t/VYtKDUECB+9Rph+w2FRxknk2SUP6vzOGZ+UEcTtEjIKXNJ+ecMjI8Dsqjsvlp3rEYCWL25At8LJ0K8ak++axF6QJMoCkxb3ooLv5ZFB1f5x4TSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiDxEgRUcJpouuFHRGTC6UJdeUn3Lem+R7E6/FapieM=;
 b=o1v/qiEEu8ZLR3fPM1oIB1tDM7GsM9bwosOUFgypAC7473vaJCIsxq2CdSAjllAZyHQfj00LfN/Grgw0kiI6loHJosXt0pJ6i9/Vkhm29iq8VtkfMWN1ePrA+4yds/FaTDFveQGP07AMb93gPbpEZPJiozj4LjJVR58rltjsgc36YlDhNkUBMl4QOyKR/H77LN812YKWZEJ1U7HExsPavzsqJeAHJLkd720+y2DbUmS8rS5H1ew4adnNEpuc1bQ5uhln0jTMXXL4Z6DdHyhNjdF3H0ObuT75je2k0HHyZShcVLjUVPkzHe9C1DqSbFch23Dgrl7dNpKYLOklVtdTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiDxEgRUcJpouuFHRGTC6UJdeUn3Lem+R7E6/FapieM=;
 b=jJJrWK8jyRTrmRnHWGT7k4LCkwUX0RmMJAAvbMWh3I5pzvBigJ20QlUaZXn/PKIYuuW1vVWCgQIBYZ1ozcJNRQDtXfsXn+1GN4sphlhKxI6rC9Tibodlhuepgiz0jAfNn4Bd90nMXBnwkaSw1wnr8Z0l7B9Rmom0PS9pqaDX/5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7833.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:39f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:22:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:22:29 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] samples: rust: remove imports available via prelude
Date: Fri, 23 Jan 2026 17:19:42 +0000
Message-ID: <20260123172007.136873-4-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123172007.136873-1-gary@garyguo.net>
References: <20260123172007.136873-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 586e01cc-cddb-4a6e-d3ec-08de5aa3fc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vo0zG5Jlu383qVK1QLMw4QcMyU9EGOQB0u/ZI9cEVRiuvZVOlXVLn9ncsWsk?=
 =?us-ascii?Q?7fnhrWt/0hiEmJhxTAYkxGAwibmPiRYj3oNbrnd1jcD01TPUDUxFdchzmEr2?=
 =?us-ascii?Q?J1Dzzvsx49WNJuOwP3bf3adje50YcacU3HkWhcXQAbfF3MW/d+JGNFLKnZlp?=
 =?us-ascii?Q?0Y+hx8ovVL31NHv0Wsx5X8FfLvIy59oZ+AHo/YDHmwZzsS8M9hcex3pRrLJX?=
 =?us-ascii?Q?G6TbbMvBBpLTaaSkncHPKIDcQveR0MmYEsYa8jWWQOSV7NtMqpAljracTuFx?=
 =?us-ascii?Q?KzZT9koAUAlU8SERZv9uuEkG0PpwlYF2i2WWK+RoKYudnwpFFZrlFOZgG2jE?=
 =?us-ascii?Q?m/yDNhT7FYsVftKFN83pGbApuCXHl0ZRENgusDnQdcHi3NqjQlycpYC565vq?=
 =?us-ascii?Q?uyDmuPQeQGxHLFDLzA5j/Be0S2v6rFzp/9z55+3M2wsOprMzw+FVsQscAkfA?=
 =?us-ascii?Q?FEGo6/JSG7l7UKf/SZobI9pNEpBTMZEw/1Ee5x6hZm0ue8782IzU55xzETjE?=
 =?us-ascii?Q?6fVaKV6sWiEiTPIGAK3vpN8ONd69iujir05DZZsi66YsL1cdPCx0mTGGGD/r?=
 =?us-ascii?Q?Av20HrdxmNtFvGvVKyUgYRl4ch395/mmVwq6w7GxpGhYNyH/BKcEkU2OwRhv?=
 =?us-ascii?Q?96jhjEky3HXHrRbgsRVIRFd6FoMjwvy0so1taWv9F/C1yRWrR7mPV+DajmUu?=
 =?us-ascii?Q?2/aiIFqwGEzN6K8tdw91dHRxUR5KEzlFfLe47lbc6DtnYTVf/cW60ZGM+Rfg?=
 =?us-ascii?Q?mmjSdQ3+zGszg9JT1wNB5O/aFoZfwsQNwOd5+FqVFKnevk6/of6+OuOFJRb+?=
 =?us-ascii?Q?01tBkCl+gGaD8gJhXe6jTUsmcZEu033stDsSPaxCyjwFxkLq5w2L/kxg+YN/?=
 =?us-ascii?Q?1zcepBJtZZ9pbvfVa/H7SHpgNgBPDcwoFU2j4VjHGcGhilSazSXGJ/odDITQ?=
 =?us-ascii?Q?Xfct0RtSb65Cnf8BpHsaucQVktvu1MzN6SSMoFIO7qysfqVTN2JVtFgIAdNV?=
 =?us-ascii?Q?COROgbsouWtf5ByXnOkejsrSBLZrvm58pWjNi7N5U9UfDVz6Ro3syIlU7p4v?=
 =?us-ascii?Q?hxa+6vAPUNJmO0GpCwalkOF46epYLt9pPgMvZaJkcedbyoJmO/UTUT4qiSfZ?=
 =?us-ascii?Q?hkRFSXWLC41NAAiqggilprDYqDjXsr535svk28bnmir283QObg8FN3n4k2Zo?=
 =?us-ascii?Q?A4x7DzerfsiaN+FntwvIoJhoe9r4cij2FKO4NbEXqp4SwKce9aeyIJ0SaTeE?=
 =?us-ascii?Q?1j0M/QVJ41/El6FHCqbOSiP9l5OcLZ+JPGiPZ8fEPx6Zjb3hItkqAlJFe1ye?=
 =?us-ascii?Q?BN7DZu+3exQpQD8jzHRrSrF4Yc7xVNnN7AIF0aNaw+CLk600oQPcD5kjuWYo?=
 =?us-ascii?Q?eGykBUNCBfxNKUbgcZaElVqo6LanCk5oxvHus3gp8oGJC6SGAvclaBGgB2wz?=
 =?us-ascii?Q?IyGl2QcebQoK9eZmGP2M40KGcpsMA5zih4Nqlbk2LRYJqRb8f/z9XhogWDNV?=
 =?us-ascii?Q?41qu0Cgql9VsDRA0Mmc2EDEvjAnO2B5KD7BPNjGJ/FLZbCF8JLR8S2glGvps?=
 =?us-ascii?Q?xV2l4x6ln/tRr4RAPhqJ0PG79tg/pAFTuv4qysOibPbZw5CS2pDsPomV2iw7?=
 =?us-ascii?Q?uA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BcrWQeIJebHZ7gjogvTifRWG9YbPuAbU1s+7VpM5R/dqARf0/rmg26XlHi9x?=
 =?us-ascii?Q?qmTh5CWV4GTVt/TZZprIqQ09e4a5Xy9/7VRutbA/c1R/gPbu1FggUSbnZq4i?=
 =?us-ascii?Q?Sj97oJgjLy/VRMsvaymrGjQHu+i+VPgXZOpfL8uu4BLmTgg7GndFN9I1XxWM?=
 =?us-ascii?Q?l3HLzWcGfcTSlVv1wV+Mj80c6RlF8U9S7kbrlImI8zmRxoGTdxXKqyZrZ3s/?=
 =?us-ascii?Q?k+GztOjaNxnVvkD1TVte6b+QdkD78Jh2zmPnlysAF2jjWdofej6hNWVO+4rP?=
 =?us-ascii?Q?X3pVyi681MF9mVTXdRKDdOpY6d5m73WWgbBC6Yd7IvnE+T6XWgJD3DGVbAhS?=
 =?us-ascii?Q?Yk9OGb3aCc22FPfjjezQoNzsCv3kmWMXCmIWUqeZEl0/SOmFH2exSEgL1Ru5?=
 =?us-ascii?Q?r8k7RLZwiYIA867FCodDELAksFM1D5ggeuABGsPuKvLSqS1DWfc88SuXofWH?=
 =?us-ascii?Q?iTGKHoHm09/3XlU4QZbKyAT0eid+4qDO8a22aLaOVpXzmBpB5/0LygaRthOR?=
 =?us-ascii?Q?OnSh6bWsnP05nSNz52Bo8XdCJUrMri70wfNOf5cuTbMQFihLmduPjMbRdHB1?=
 =?us-ascii?Q?Sl2z5ZOI/4Yj8hFTUbsa8LGSFUWQZxD+MTV8wfm2Oe76Xa47i4AvCydZbVWD?=
 =?us-ascii?Q?uqZzSF6Y7PMIVye6nq0+lnZWA+WfieJAS6s4iYM1lbKaVmXy02s8k0MiVzCW?=
 =?us-ascii?Q?1WkQ5Bhz1HXIWzHJlS9PQbw9vdXKP/KvAN86n+HbZqCIqqc9XwsK7K+WrL0M?=
 =?us-ascii?Q?jyCUPZo4kf3ZAgc73gztAwcrP79U+ZCHwRBr+1ns25/v4v1RS2K3ug+X81pF?=
 =?us-ascii?Q?dHZD6zePf8UjXGJeD0A8JrpOMbX4LSRMQJR2QloeZVRLDoo+cszmjWvG6Cor?=
 =?us-ascii?Q?kAIw6W3WAcDtjnzQ/gCNcWpYEhfcKPopuWG6K56jlqDfYeRdjtHEJ4kdJr9X?=
 =?us-ascii?Q?A8bpXevrVN6r/7te58gweLzQV01ay5gHJ/8hG5pDmYbZ689rgwpeNj4Cf0OA?=
 =?us-ascii?Q?1yqPGE6ZbexlYXot1weAh6FPXDGsZoks1m6kHPBQP+zN/cu2gBMAfMEhYiL+?=
 =?us-ascii?Q?4CVfw3EYyQsRgpwoVHlRxjJ6uQOOHvp7sYJlh0WiJzneDmJ60uOircDMiZPV?=
 =?us-ascii?Q?TboHXSYROf+S16qB/WGJcSfZQM7cqebpyZMR6v2AHRnUfcqJc8w/U1rVOXSZ?=
 =?us-ascii?Q?ftjXNG0LxZbca4LY0ZLYLD6J/px9X4uXRSCgBd5pVtEylZjR2B6e4VpNQj9w?=
 =?us-ascii?Q?ATaTd5gnMBw0rDHrvv7LSGmr1k/FGqkIeIPwFDc47eSnhO2NufMyQxcSgD1e?=
 =?us-ascii?Q?zM3fNzPrJqbyS6DRaAIEKaniQRzQ5zYhQFC5hnkrq68sOcIzW7viPA03lJmR?=
 =?us-ascii?Q?I5K+Tnvp0ZpSbGUtM3JyWVpePdYigZyM7b6/eD7K44NxJz4tiHqf+CbHYPly?=
 =?us-ascii?Q?ESXxVJz6i6ov6mO+tNo2JkZC9EOxOKt4uwXQ1OdEak/XKXr0nwaPAxnderj7?=
 =?us-ascii?Q?TUHJN2XEHzjKzIVdWWTUdy9b36ttK/6YXBPbtCwsac/wALiYYkPVdbtEQBPl?=
 =?us-ascii?Q?9/rKdYNgrEvGuMd+4M43K4dxvLBrMYRhLQE0m7RPoqBBcnRjiRytSDh4BBT+?=
 =?us-ascii?Q?q32aleUfxz2Lk07N7bxxUC2TlLQZcXCubkLvDMQaOZD2H+bgfsFAzawFIzQz?=
 =?us-ascii?Q?H0BrrRBEPPXhOGb+muaWuCD8HjA3KfBRq8sG5wy3z28h/pF0u82GuhHmEdNk?=
 =?us-ascii?Q?sgIA79fuPA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 586e01cc-cddb-4a6e-d3ec-08de5aa3fc65
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:22:29.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDpzbXeaXAE18G0J1MJjHIaTUrKLkkMILbjJDIfPqNWt/Vmn5fHxR2hWIhUFmd+zsxYybwEVtPywsmXbKReumg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7833

These imports are already in scope by importing `kernel::prelude::*` and
does not need to be imported separately.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 samples/rust/rust_driver_auxiliary.rs | 1 -
 samples/rust/rust_misc_device.rs      | 2 --
 samples/rust/rust_print_main.rs       | 2 +-
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index f148124fe81f..84c2b1045701 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -18,7 +18,6 @@
 };
 
 use core::any::TypeId;
-use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 const AUXILIARY_NAME: &CStr = c"auxiliary";
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 49dd5814e1ab..87a1fe63533a 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -95,8 +95,6 @@
 //! }
 //! ```
 
-use core::pin::Pin;
-
 use kernel::{
     device::Device,
     fs::{File, Kiocb},
diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 4095c72afeab..682207c81fc2 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -101,7 +101,7 @@ fn drop(&mut self) {
 }
 
 mod trace {
-    use kernel::ffi::c_int;
+    use kernel::prelude::*;
 
     kernel::declare_trace! {
         /// # Safety
-- 
2.51.2


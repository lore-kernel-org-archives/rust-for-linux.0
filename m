Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F62A282F3F;
	Sat, 14 Mar 2026 01:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450429; cv=fail; b=Rf8dTc3RrmhNF7qdtFweZG5PoiHEGY3OIv4bQkQffgVxpGk8OMdZ0TO+fL2/bESB0pcrGJBa67jBtmsCwV7ekuYmi4gPhBlvnfOWB1chIJ7QLPQJM+NJ8An9cG1MDPvW8svBtcAaNB3KlpCqnoFW4qYYi72Ik3qooXF+RBl2GEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450429; c=relaxed/simple;
	bh=KhOv4tE1lYpDhF2oVds2irOaJFJNQ2/ak9MTyexcx/8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dy7kNx2JAhVoxQ8g2OJapesB89PJEeiXkS2S/KGZxi6h8sD6QLXZPOzoABZPJ+mZ6nueQWKCygEYcnDTRPH4byEJa2pjpn/yhwllaEIxjmwB0Uyy3ZsgnR1Lz1xoFARyMAELJqCUrv2C4JPpHK8REmxduMdkL06tc/alYOmteY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j5T0uqag; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j5T0uqag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On41pa6a51QhtLGmNozQftqMm/y80oRzPgVDHdBUAS3HnKhigyoMQJJgrnmDBmhQLvBdSmKeloi0z2IHVUrQDn8jhqhhGfrqovsTLCDVEQ9fiLnWLFNAk4pYJzRZoRGeRSX/Vq2YUJAXfmlyIWX448j6UilOEfhJKirRO8MjJubXEPKdlrTUdIy31EM6mizYG5OKYM8GUUvs9ZVRp+YU84FWq9I2gUs3coZ8nZ3FgYZEMThZfPIA2kjwwQiJtuSB+3x27Y8KZmZf8q632PY+PtTHsPJRpiYRenTJviPxFmUCw+xjck7jQNaDKQfVYMZc/IjBQY1zxPQ1aMhF0heNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DGns6Vo2AA2s8S5lqAkHeKb8AQJwbWd+0VNITWBXbg=;
 b=HKAXFFpCI3CcnKTRIBEsCL+hOQl6P+Pmx0A7suZOPlHPj5P87w9QfsZnrV76lttjC8/vTiHujvklqcuJQP41UCvX1jCOT/4sFqEEnvTK4XUMuTW22xwVOIwXydbX970KxPd9LJG6IWNivn255bTsM3lvr5ilPJv18G5zgZ1IctgIg1u6zERddx5wj1wezs8ee6I8xvgoTrwsvHTM8xvkWNweaAy3ehuXwK9mkwc3HmN1MnkBdQpqkvLF36dkbUAy65wLZlgULu0qBSc2DmFX9c5Jqka/PDQMzsN1hPKPsYEdYgSDJF9HE0hCSJbS92Gy5D21gKUCmxUCtW24meLlzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DGns6Vo2AA2s8S5lqAkHeKb8AQJwbWd+0VNITWBXbg=;
 b=j5T0uqagLM5knLx7brQ3H2f1jWjugXQhzE5GiLJSPmmXYNcQUcd173dJvvw91xaw+Z3zFevUEDvKCUzZcpVkwecSbeBV6+FhtW8MfCVMz76W8+jPiDqW1pIJzlw2FWShUxq8rF4TjqKXS96VwzyHs363+BEqtLglktbA8aFmnn92hBHbxeuwoxOEUrXyIj0XK9EKtjlJ/xPwfjENaqmbDeCaKjrQ3F/EStUYXvKpN+ldO26UOrfDIbvlxtCCOlqaFLNkypbJmRh/kPJE7gWuZ7BEu7VGF7q6qxkYuX9R3/nCdsxC4ChJH9yqIDoGbaOpKjhv/7HzGouf0rxSCAw+Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:07:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:07:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:19 +0900
Subject: [PATCH v9 09/10] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-9-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:405:372::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5824d9-ef9b-4f19-7a46-08de81660050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LD6PALmNdgjAnumOqhYzPT4vHC+P1zqlU/lsYOZOfxjZ38GvEDbFj8TW+tz68tAKj8P9k2+O46BO1Yz1IGbUB7h2OVCWmK41GhMEbH5kGg3zAGVfKFF8s/Gn68TVC1E4m93OmS0BCt3pQ0k1pBlN5PPGkqu++TmXLityE2aGlU0Ns9eO4R5Wl3WhVuJs6mkv7/3LvUvGgNl7Ydk21f3NeoQ2JI3x9GbKgsHhddOCngF7dPgAt4lUzGatxgkuHbTzhzwqmmulli6MGrKk+4HnXMZDHGvqr52+dMO+SKHM1w97ODy5tQ8VWibrhMXlknBetw4+lx7k+MqQhheWSXkPc5IwND3re4PzrE99CApSlc1qiU5jNKI6tY3rFn5d7DFWusELOB8qsf6xJr5mfUVYWSknZyRsLkj416yq4F2oWIVI2oc02K2vRUIAYUwIVXtgjjUQgs8UYolBkgRbkCgWzX4E/fWKYTGpQ38oL1tglrieZuG/cl6uZI41hUl3g0oa9jLkrBXOIO5RY90mI3NELTVzsIiMTx4eeZs06l64rl9PfRNI6wwnHR161/Vt5lH/L7VFBShMKfNmto4AK42YAybLrruRshk7Hj5Fc8kQRXPEy9paE2vrbSUJnwmLgtdF6HRNC3A47QqVN5bC4+m/8WMNlfSwUX9lyGR1waD84R3GtX5gcGQs4YL+81ALwQp4iBrQHj1qgWgydjlrCRI9dr4Lk6ukjjG3yxH21mYpNZ7gewqUVUWJ5snczYTGDt76Qltt0/TwruGm9MkuE6926A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTNENFNnaVJzc2tsUjN0UVJhaTFQd000R1pWN1AzSnBydlZlQVlMaXB4RTRJ?=
 =?utf-8?B?UTZRWGV4U2MzVlFHZ0Voc1UvVU9vaWdqSWxBY2JKRUIyOThnUVA3R3NEdmRn?=
 =?utf-8?B?YnljOHdOWlAzeVBYK3lsWEFrWkJBc1Z3dDdiazZNeW9FQ1U1d3NadEM2T3Uw?=
 =?utf-8?B?Rk1ydkluQkE0YmlzOFNZWmNmZk1KTmJ6aUJlcHpsc2tReHF2K2lwL0Vqazh2?=
 =?utf-8?B?cVRBZnhkUSs5QnNXRjZXNm1wNGFKUFEwVktVOFA1WGxIa0t5MmU3YTNUbnR6?=
 =?utf-8?B?a1RncnZaN0k1NGhFNS9YTE1Oc3crK01lMGFpN0IvUUFWUVdFSEwyQWdtY1hB?=
 =?utf-8?B?bWZJQTVyN3RrNmg1cDY1V1ZWcWVCVXNhcDV1cTJzWUFKais0dnQ5VUEwMEFl?=
 =?utf-8?B?VW9TVG1kTUVDeGliY0xLekFYblBRbnQrK0JLV0pGb2p3ckI0L05JODFRa3NG?=
 =?utf-8?B?cWxZM1FGN1FnZURhTkYxWDVuOWhnS0RxeHRKNHVpblBBWHlENHJFOG55Nm9M?=
 =?utf-8?B?NFR0YVNTb3RWRmhsNjNnZjFacGJ3Q2lnR2FNNU8wNlhTMjQyQWZOLytFMnEv?=
 =?utf-8?B?dDlONGViQzhOVFcyWFNuMlhMV0FTTXIydVFyU0JZVjB5QUFFWXczMkRmY1Jt?=
 =?utf-8?B?OU5NamNTNHU3a0hoaC81aDhzWkZ1TU40UTN6N3ZVLzdvVkhZcG84bnRLVGF2?=
 =?utf-8?B?TFk5aHlaaHh4bUxGQk1MRzZYYlpjbWVUc2l4dXBIV0NyQUYrL0lHd1ZuRVRr?=
 =?utf-8?B?WkF0WU9FdWh3VDB5VVBmcXczUTdEVlZyZDR6MVU4SlpObHQ2SzJ5MkNWd2pl?=
 =?utf-8?B?RGRsY1hoMmZkVGtFeFdVcXdJOFlCVDVKYmxpc3BwTlNOemtTQllZYytTNVpW?=
 =?utf-8?B?aE9wVTNCOFl1ZUxGNFJ5c2JUMEZJUlJyYlVFcGx2T015TTN0U0JPNjNmekk2?=
 =?utf-8?B?TTlCeFJ4RHA5STRvVzFrd2JqanZlUWpQSk53ekt1Si9sOWRnZG1lK3RGQ1pW?=
 =?utf-8?B?UXFrZCtyRWJmL2VjMXo3b3ZUZncvbjFKejNIb0x5QUVaU1VTakUwUXV2cHhF?=
 =?utf-8?B?TTVrQjROSWRVTEllQ2cxc1hwNU1jaEkyRXRHMmtUQ1FWVE1wZitZTldlMHVn?=
 =?utf-8?B?WnNTNHBDT1VORDE3cTBFbGpNYjRLdlcxbFFFMCtjQ2I1SlZUdFVPQjRLS2hV?=
 =?utf-8?B?RmhabHVtN25nczNwMU1nZWxGckNMeGlYQkhVMXNEd0Q4RmM3Rlo4RC9SRUpX?=
 =?utf-8?B?ZUdhYXRyVG5lMlpocktUY1B1Ukl5d1Nwbkp4Y0ZYNnFPU3o2RitXbTNRVEhz?=
 =?utf-8?B?MDRiRnQ2L3BWaDdxcXJhQnpMV2JSWTdBTmFiMnlRNkswcWRFV1JUbldWVDRn?=
 =?utf-8?B?SEh2VWErQ0VtODNtM0pCcGVwd0lJNzhEQkJuT2x4YmJmd3JzYjZDbGdldTMx?=
 =?utf-8?B?VTYrcGdKU0dHU0xUclZZSzVxbXRrNlhpVEJhRzBBZmVaaXp4OFVRS0c2aXpt?=
 =?utf-8?B?Z2JMaTRPWUhYNjRaVGIrTFRSVGUrU0VnQlNJK3M5c0FrMFM2MWJzc0Q3QjNS?=
 =?utf-8?B?YVZ0TFRHbEFJcjhkSlV2ZnNHYVNKYjBCazYxaEJ2R0JNMzdCTXp1bXFQRllx?=
 =?utf-8?B?WGNiQjgxVXV4TzIrWU5ZU2JPK01NK1RqS1pENHBUOUFSc25QZ3pEUnBuNkg3?=
 =?utf-8?B?QWkzMVo0OGRkVDM4V2RFQkhjWW54RjBpUFZlVis2YnhpQ1NkMzJHeWt0RE5q?=
 =?utf-8?B?b1hBSVA3VjM4QUNaM253dVAwVW8vVlN0akE2Z05jV0JPZTNxWVdTRTh3bXJX?=
 =?utf-8?B?dzFBTU9mNEVMSmlOVFg1aEJEeFBjM2gvWTdVQ1YvZ0pWaUttQWh3ZHFwd2do?=
 =?utf-8?B?VVBsaFJNU25ZSGhEenU4WTRWZXZGS2VSbmt4MlJRN3k2UTNZeHU1aThSOC9R?=
 =?utf-8?B?VFFCU3JpdFFRU1VRaTcvcVhZcHZFdjQ2c08xTkhEdk9LdHBIVEVUTkt2LzBC?=
 =?utf-8?B?UlVRcjdPajVCa2wwaVRLQWxWMHRpYVJWWHB4L1psdEJXdXdOZGxYK084MCtW?=
 =?utf-8?B?anQzNHdVYm1WTVJSR2RLaHZWc0RFQlNScWZUakhFdlYveU5qMVM0ZW15cDFG?=
 =?utf-8?B?alZoQjBrS3hvOTJRQjdGWDlHZFM0M3pvcE1Uc3FYaS9lMDdXSWxkSlVTd045?=
 =?utf-8?B?bTA5Ny9wVnh5M2dQd040Y21UclZJRllHVXdKQ0o1Y0dUOWlVeDlobFdTL0NS?=
 =?utf-8?B?WE1KN2NDZEdPaHkwYlorUS92YjVwT0Z4ZGVDNlJGYUNmQngyT2hYQW1tRWFI?=
 =?utf-8?B?UXQrUDViaC9LYTFXNjA4bHVsL1ZmNFBBbDE5MmNPZVZOL0FVUEtmcGxkbHk1?=
 =?utf-8?Q?CU5iq6499hqg6o+R2xvB61yqMldRwq2xjkYxOgFEGkZZQ?=
X-MS-Exchange-AntiSpam-MessageData-1: qUAVKS/3ICwQEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5824d9-ef9b-4f19-7a46-08de81660050
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:07:02.9382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHQqwzRmOnGqPN+6qOHKs5vMKuZOwlx7pKC3fbgOBxRoE9FM46vVGjDXCA6Gc35Hye3MC7ILyEGy8RGKMwc6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Convert the direct IO accesses to properly defined registers.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 84 +++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index d3d4a7931deb..064f78b7f5b9 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -8,27 +8,58 @@
     device::Bound,
     device::Core,
     devres::Devres,
-    io::Io,
+    io::{
+        register,
+        register::Array,
+        Io, //
+    },
+    num::Bounded,
     pci,
     prelude::*,
     sync::aref::ARef, //
 };
 
-struct Regs;
+mod regs {
+    use super::*;
 
-impl Regs {
-    const TEST: usize = 0x0;
-    const OFFSET: usize = 0x4;
-    const DATA: usize = 0x8;
-    const COUNT: usize = 0xC;
-    const END: usize = 0x10;
+    register! {
+        pub(super) TEST(u8) @ 0x0 {
+            7:0 index => TestIndex;
+        }
+
+        pub(super) OFFSET(u32) @ 0x4 {
+            31:0 offset;
+        }
+
+        pub(super) DATA(u8) @ 0x8 {
+            7:0 data;
+        }
+
+        pub(super) COUNT(u32) @ 0xC {
+            31:0 count;
+        }
+    }
+
+    pub(super) const END: usize = 0x10;
 }
 
-type Bar0 = pci::Bar<{ Regs::END }>;
+type Bar0 = pci::Bar<{ regs::END }>;
 
 #[derive(Copy, Clone, Debug)]
 struct TestIndex(u8);
 
+impl From<Bounded<u8, 8>> for TestIndex {
+    fn from(value: Bounded<u8, 8>) -> Self {
+        Self(value.into())
+    }
+}
+
+impl From<TestIndex> for Bounded<u8, 8> {
+    fn from(value: TestIndex) -> Self {
+        value.0.into()
+    }
+}
+
 impl TestIndex {
     const NO_EVENTFD: Self = Self(0);
 }
@@ -54,40 +85,53 @@ struct SampleDriver {
 impl SampleDriver {
     fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
         // Select the test.
-        bar.write8(index.0, Regs::TEST);
+        bar.write_reg(regs::TEST::zeroed().with_index(*index));
 
-        let offset = bar.read32(Regs::OFFSET) as usize;
-        let data = bar.read8(Regs::DATA);
+        let offset = bar.read(regs::OFFSET).into_raw() as usize;
+        let data = bar.read(regs::DATA).into();
 
         // Write `data` to `offset` to increase `count` by one.
         //
         // Note that we need `try_write8`, since `offset` can't be checked at compile-time.
         bar.try_write8(data, offset)?;
 
-        Ok(bar.read32(Regs::COUNT))
+        Ok(bar.read(regs::COUNT).into())
     }
 
     fn config_space(pdev: &pci::Device<Bound>) {
         let config = pdev.config_space();
 
-        // TODO: use the register!() macro for defining PCI configuration space registers once it
-        // has been move out of nova-core.
+        // Some PCI configuration space registers.
+        register! {
+            VENDOR_ID(u16) @ 0x0 {
+                15:0 vendor_id;
+            }
+
+            REVISION_ID(u8) @ 0x8 {
+                7:0 revision_id;
+            }
+
+            BAR(u32)[6] @ 0x10 {
+                31:0 value;
+            }
+        }
+
         dev_info!(
             pdev,
             "pci-testdev config space read8 rev ID: {:x}\n",
-            config.read8(0x8)
+            config.read(REVISION_ID).revision_id()
         );
 
         dev_info!(
             pdev,
             "pci-testdev config space read16 vendor ID: {:x}\n",
-            config.read16(0)
+            config.read(VENDOR_ID).vendor_id()
         );
 
         dev_info!(
             pdev,
             "pci-testdev config space read32 BAR 0: {:x}\n",
-            config.read32(0x10)
+            config.read(BAR::at(0)).value()
         );
     }
 }
@@ -111,7 +155,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
             pdev.set_master();
 
             Ok(try_pin_init!(Self {
-                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci"),
+                bar <- pdev.iomap_region_sized::<{ regs::END }>(0, c"rust_driver_pci"),
                 index: *info,
                 _: {
                     let bar = bar.access(pdev.as_ref())?;
@@ -131,7 +175,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
     fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
         if let Ok(bar) = this.bar.access(pdev.as_ref()) {
             // Reset pci-testdev by writing a new test index.
-            bar.write8(this.index.0, Regs::TEST);
+            bar.write_reg(regs::TEST::zeroed().with_index(this.index));
         }
     }
 }

-- 
2.53.0


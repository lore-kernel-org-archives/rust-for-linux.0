Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CEB3D903A;
	Mon,  9 Mar 2026 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069293; cv=fail; b=NzAXFrdHAwJVpMaI+wmHp0hJJaEX2cg18Zzm0t0VdXGBGXdIoorz8ImQXTzpvaVmCxBb5cL0E43SxBrjH6dzjnbzjJBKQeyvzouN6cyaBOjiWCOFiQELRP5WpbRRZKGLcy91Cdno27nju8XZhdPcPUp6Lp2ff4JdKaV6MvzRcfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069293; c=relaxed/simple;
	bh=ij6iTnY48ItDw7a0bv0zSXVP2mQR/tx18HYSM0Jy+UY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EAPvL570LMy/+n9Sh2ZVhrb4io5NdTVd1ghbWCKzcZrrbPfmoBANB3zPWE4hJxAf3w5KjtUTCzjhfAxNvlS8uxWcKYQThdPs1s/rKH2Lrx4I98c1LDFNjussJV7bgPQXG9OcQAunNQrpMCPGWS/oISsKhVhz98bfP54L1+AiONY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o4JSBxKE; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o4JSBxKE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZed/sPE9/KsYQOc7e4s0zEAcAFJXiUnN6+Bq/ubYmN7TsWb+Y87Ru0PgP0rDo2VbeQ5OVjOwi9qz0svMgacMvTGRRQD1xlPPf3VSgHRHlcHVJP4GFxTRsGcFYo8FNLUEIQBVrXf8gjawadzfQcIQeo6X+BHrzizJ/qxf6kvl+aXZGJ5TVuYcayOwMHl2Yhpa2fry9vMuTEP2EBgKoXlrpFkhaRumPHx8k+fhZUGZ3Yeuzgm0/5NY56/9A7gaSo2IbnCCClZZXK8xtaInrfFYMTaMJrFj0dvGHRjqkjWRsmoih1+xO1JkuBjdRyZj/Zf4aoVFopJ5dipMMg3wsS5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5SZoiRY//guABI5KuykvsFaXf+/TSR5RkT1/mJc1sA=;
 b=efD7B4Hfgf1iMjgoIHLwGDoJDtX36WOOsZT4p67s9f2VHDNMC0oUgKODObKm03mKBEa1pZ2PPas3/l5FAG/7a648kAoCKqOChjnPbhlKvdsXwoxoKSuMUVdnkaEOmepD3+BUGTuwj2Rl/t2EmYNtDhDWYQt1aW2Jp8X+luap3I8ZiOoydqC6YLcWTdYAn2bs4Kv4onYEklJe13l2rjKZZh7Z4NMjPDO3OQGMZ0XLhyL8giLvbdrNAQp09sfROmA9beZZRTVGxo2k/jIG8DU6J4cYl8py+lRR/CJuGfrzSr+toO/ivIOX1O9hpR4OocvH5K9evo47ygfh6vQEZrP8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5SZoiRY//guABI5KuykvsFaXf+/TSR5RkT1/mJc1sA=;
 b=o4JSBxKEIHJy/+JLiYmAhXD727cCzfbdNoLZGqlTB9gQY251GHaDTk7TW4O5akDxBEJIWT09mFTHxlMxFtpJ4qmN3DmC9+IwM6VDw3LX0duUb3hSQPk5qeJbUfLUIb8zieNyJnDFajDD2FdnKrP0k6rD8//e7EYnjDNP25B71k0l+n5OqnTwNTk4zxYwJsZeqNzuHW9TPe5Tcq+lbsy+rfYjRtoH1IKuxMnOwFsHj96sM5sAnajBzLF+ecPE1davEb1H+dyAWMCnHL7oQgGiy/d/ZSRqsilyrdBzuzRy3TFO6zZhg2eerBS56yuO9KLPqXW3cRBiJ1lMMWJabRhF2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:14:06 +0900
Subject: [PATCH v8 09/10] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-9-424f80dd43bc@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: da80f268-6798-46b2-364d-08de7dee9a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	XyICoVlrFxNK4AStRLtOseDOgFAqbb4OKMv2CKmRSxn41LxNwjnhOwMr0t++N3P2+IgoFIsOzZzjMpl8YnMllVxsqA/YCXjR0s/ehSnb6fA00lz2TO7XWCEqQmAenk38oolkEClJpTvKG05eg9qjLUsrKgy8IqBPz/shu8rfzeq8aEyRSdcQf/dSdXgMzWTs72oNY9VLyDBmhXKtTQkPXP9IRzoZY7dwuZxaQnKvFjinrxC6IDhEeQVyG9rJ08Akbh/GHdiWTdL9aqHpLDGNPapYIYQQnwQb6HiEftD5esZlvHvMDU3MntOJzhISWpmjBjjergnfw2o+3zTy6ebh5mPcFjN3L4W+DBk37emhBJH6GZaClNGwl6zowyaTs543BqU2BatveQ/nBq1Fx4heVY0qgvNdYm2SIQpiY96l3SGrDqd6i/CYYtNfjdM/ptUXYDQt02NhLCaYDxrCTzTdQRyOBWgQEpDcFkZ+WESozOVVpMqXKIkO8glhUwFN0oY5lkqijR/F36Z50Fmn+juBx8Fbbu9QsCMTTHJ8sF4mkGTVIElPOSqd8Q3wI4SkkB2mwaAZmjfbrBUH5+e8o+YeR8QVfYrr8AneGK3S4Xo2VBc4Cx/kYVD1rgIZF1IMnqbPNAP20Xf3vE03cpY9IKelQs6g3Z1GCrAlTxaV1TsN142n1hJb59/vTe+htTphZwJEGNEVzS8PLSzz+0ULVdjjxsoOYHIaNQEHnxpPma6EkxOad6bVw/WBxW4GOT4sRAfGWv6RmHXUlJNIof8c2m65Xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEZWVzNNYkc2Zlh6d0N2MEZaTkN0U1V5elRRUFFBM2ExZnZIWkp3cFdBbnZQ?=
 =?utf-8?B?WTdUSFhwVmwxb0pHc1pYVTNHbG40YnlzaExITGNOWXFkMmYxOGZlbm94QlJC?=
 =?utf-8?B?NnYrRzBRQVNxRi9kQklBWnB2WnNJUXVNWVg2VXhkNjM4ZFhUSmxOQkphc0ZF?=
 =?utf-8?B?WUNDV3h3VTdmZjBkS2hCMExLeEZ4bGVYa0UxZ2FpeXdsbEZmK3Zjcm1RVEdn?=
 =?utf-8?B?dHlHaGhGejhybG1WcmwzRWNlcUdVRUU4b0syUHVUcEpScGFkYW8wYklGOFg2?=
 =?utf-8?B?YlpyVlRxeFhNYm1RcnVuNFluUkpNTUNZVjVIVlVvcVZkYjQ3TkIzVHkyMmgx?=
 =?utf-8?B?dDdDcjZwYUcxRytzbmlHNi9iSkpSN1lDNmlpS1lFc2o4RWhDZE8xU0hTMUdH?=
 =?utf-8?B?N2ZMT1lDSitzbFg4RERhQ2tzWmoyQkh3dEVjdWNrN0J3TlQ5Q0tKRWNSNTNB?=
 =?utf-8?B?QkZDdnViNmQ5T2R0cHBCT1V3SDQxME05TkhPejR5OHdMbDZvWFFpSklGRVhY?=
 =?utf-8?B?bHRQOHl1dXBvd0NDVnN1VUdMcTZhK1c4cVRRelcrc0luMjRJZ1BZaEU2b1VQ?=
 =?utf-8?B?S2N3dExpUnhDUjBsR25LUUp1c0hOcEV6ZUIvNlpUSmVuMHVqTVBVOEo1RnZD?=
 =?utf-8?B?WDRiN01iYloyZ2FpdGpVUDBhMUdrSEl0THlPTmZ5cnlaS2YwNm9uVjEvV2p4?=
 =?utf-8?B?UjYrY204dlFKT1FkcVFXZlU3SUl3N0VKYVFKdHVUd3lvRUx0RFpmbTluNVIr?=
 =?utf-8?B?RVNKcHBXZThBVEl0cUMxQVpZUTNLdVVpUVQ2NjN1ZVlXQ0dMT3hKL3hUcEYv?=
 =?utf-8?B?SHR6RTVGL1EzTjFxTlJ0NXBobEdVZDdGa0k0a2IvNVJ1VGFmb2V3OVJxZkJt?=
 =?utf-8?B?aEJNOE1qSEU4aml6NkRzQ1B4SFh3SVlidXpPd2JNc1NCMG9nb2JrZ2FHdFpW?=
 =?utf-8?B?U0d1SDlJSTN0MVhqa0pHTjQ3dGtqSTgyeVFHN3AxOG5QMlBudWdFSSs3SGhL?=
 =?utf-8?B?REoyclJseEtiaDRuRDI4TllXbitJSkcwUDZ3bjJCZDBITWtuVFFHZ29QWG1F?=
 =?utf-8?B?a3UyVU8wTWIrZjArS0hsN3BxQzZLNEUzMjIrYlVTeDh0d3ZtbGlVUEQ0c1BW?=
 =?utf-8?B?VmlKbUREdkZnamUxLzFVVEtxUEFTbHZZTVlHMnJWMUJLUDA2eVJEV3Y5cytB?=
 =?utf-8?B?TXJOWHhpMVhkVys0Nm01aklHRVh2TWJsM0FPZE0xOVlhb25PRldWUzFSMk5R?=
 =?utf-8?B?aWhHQ2ZHMEp5UDROaTQxSVNXaGVqeDBuU1B5MDQ5ZDNSYXU3Wm5lekdWQ2ls?=
 =?utf-8?B?alBlRmtpc3RmNmIvYjFidXpwT0g0aU9tcGxsTVdkS2lST3dvR0dYOWpNZ2hn?=
 =?utf-8?B?cFNWOHBEY242RHU2b3Q2Y0ozU2J2Mnc1UzBnZkZkLzdoK2FSc0hJd2o2U2RH?=
 =?utf-8?B?Q1RHakNHRTBxcGpLV3pMckR1N2dLWGdhdVdtQmlOOVdkTTNvQndqVG9NRXFl?=
 =?utf-8?B?OXdMYTlydUk3K0Z4OUg1VFl0T1VDa3c1c2l2akRZcW9kZzM5ck0wYnViVjRo?=
 =?utf-8?B?TjBPNkZkejd2OE9md2FFejJQK2IzYzVvaW9rT3I2eEFoQUFuVUlOdXA5bDUr?=
 =?utf-8?B?ejRlQ2RpL013UUNBZm1YdENCSW13OWdyTHVYSTJmUy9iYlQ4RC93WmNhT2hS?=
 =?utf-8?B?bW1IQ3hXWE8rR0crTnZTVHVKRm5zd29zdHRoT1RHczI0NTlKZzNWTU1LWFpC?=
 =?utf-8?B?a3NKYy9IL2o4c2tobXFpdWgwcFJ0ZldhejlVRDNiQXMzRDc3TUwvajVnM1Yr?=
 =?utf-8?B?YkwxbmlzcWsrV1l0SFR2TkxqSUlRODNKMXU0WFd4bGRoRzl0M1VhcHgvbDdF?=
 =?utf-8?B?Y2ZzL1czR3FNVkpGKzdQbHAzK2g0KysrK0Y2NzhlMlhLMDZzUXd5VURXdnlN?=
 =?utf-8?B?ZFFnam84TGVhL21jMzlOazE1bVp5NDBwamk0Y1lBdWs4NXlOSVJXd2F5TkZn?=
 =?utf-8?B?YzlHcks4WndwZ2t3cWt2Vnc5V0JYeXBQNGNCeld0UVVtU1NacC9jbjNVdXY4?=
 =?utf-8?B?Vi90cUh1Y3U3Z1ZtRVVCZW9mN1VROEUwVFo1ZlBZMkxUckR5ZDdHU2kxNFlo?=
 =?utf-8?B?RTNBaWgyMmVmeUhZWVRoakNqSlNQdzgrc2krcUI4b1NHYnUrRHdLcUhyRm04?=
 =?utf-8?B?c2pPNTZORWVIN2xyL0ZWYy8xeXRIbTdEaURBUEE5QzU3ZUxTSW1Ca3oxUVZO?=
 =?utf-8?B?bVFwKzlvMUdKNzM2RUl3Mm4yS0JPNnIybElJTkFVZG53SnJ4WUVZOU9neEVW?=
 =?utf-8?B?dUlJcW1YSThDZ2dNcExYYzIyalZ3K1lUNkw2RzhzaFZuY2xrYnJrY0VscktS?=
 =?utf-8?Q?Ljywbu0R5WsR55PvVXfAxZicH6EEjHELWuLbFryiwrIu7?=
X-MS-Exchange-AntiSpam-MessageData-1: qrDfbH8qZr1g1g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da80f268-6798-46b2-364d-08de7dee9a5f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:48.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlB6lCqPJQQPndfIEhp+mqpgf19izU1z6dM0jywFsNzKc9AyKGcpV0jYEMdmbfQ5ruz2B4+F45I9XoZBlAm2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Convert the direct IO accesses to properly defined registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 84 +++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index d3d4a7931deb..3f52cfcb7f4b 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -8,27 +8,58 @@
     device::Bound,
     device::Core,
     devres::Devres,
-    io::Io,
+    io::{
+        register::Array,
+        Io, //
+    },
+    num::Bounded,
     pci,
     prelude::*,
+    register,
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
+        bar.write_val(regs::TEST::zeroed().with_index(*index));
 
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
+            bar.write_val(regs::TEST::zeroed().with_index(this.index));
         }
     }
 }

-- 
2.53.0


Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B43A33689A;
	Wed, 22 Jul 2026 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746237; cv=fail; b=uWFpBp7h/0Af13ivRh6saQ2XwI6+mUmMGzzHvUNJzCEws7rQkVwpokxUKP7AtH45R3JJb8dXCln0aNP/ortOvbVY/LeLW96jBJ1MCEoxXEjThoGWtOoEtRd0jMl45oWkSh5lwErA2SdeZlkNJH8PD9Jl2o/HKkAWTQvJvRmseaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746237; c=relaxed/simple;
	bh=uSQ4Gt+Rk1cJBp4XxSmuCqHFwN8IM2BigFvI15aqCq0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k4rdgKvYt56bKx11L9R9lU6ajGzVigMbILDx+s4g1CfZD7AbtJJV23irlaY2f5hEux8XtauHoE+cE652plSYQIksVnrOp7HIRJXx5/+FHnYYPHRV3Arodx3V5XZEN543uLLmNSNNNpZHHbGMgI/dJoI89IMdtjyl4JqwSJdzDeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KbTnMQrm; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KbTnMQrm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpzFq1mUNjWnr/0YqprAYNzvihrSucq/bTUOgbRZdD4ljThfcu1+yyunjLPg+aY8QgpkVl0KF7iTnn/atEn+UHi6k7RHMQALuBU9inHAJi2GDaMTQ4kzTEO+hJGpxnBRb2HpOP8V/qgGUBKAAasiNuLapI91asZoDjTHFPcTPEKEonnnmdy87MAr+E6VputWEV9jS1wM6wHnm8ZCQ9nI5iMR5tlziMkL10DXrf9ZqDrB+4MP8kGfuozacmoOSn+W3CrZ4eihEWqLF1tQn3xkDdhT1CNjXDO7a8gntlAsbGoIM/Jcdj/Ab68jxQl+8+nt/prRsrkXUTYqvdWQId4MwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isZ8uvc9xP3xHuO51gn0EUSVJN2LfrxxfqKuSx8H0iU=;
 b=VcDIE9mglx1cddnQQvM5uHLAU1vPbviwuM7p6vZsPRtrjogHVc0Ov0eIAJeTcGSTuFfPUFjwvLbIDqlAF57rQLs4i4BepjEX80Q2aBD91AGXhoOeDb5jWZ+xgCnwT0VI6Ykx+89V+jCK6CMeG+OidomBcg+s3ZvMb5J3IfHOxZsUTV8lCBdxWSvZkUNs/5K4UTh4gKpHkZ8xWAPDc7KcCtC+KvCfiiZ5Lgv7FxQdBIq1GsigAifFFvLcr0pdcO/bI4PGEcNWm/L3NsOZuwtzpzc58IvrUM7VWx8b3pGO8r5BuQDhYYOfrfP8YxQiuHxI8HcWdK2ryT+sIUQSR0KihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isZ8uvc9xP3xHuO51gn0EUSVJN2LfrxxfqKuSx8H0iU=;
 b=KbTnMQrmNedl3zIIZWiLF02mlL3jRDVE392TeeFFIyK5JFlNRKepebVSL43Zc2BoHxUFaMR4xc0iPRHu5VGknNCG0VDxfjFuGFANmH0qG66/DJp+YqImugFkZCsvFLPTqL2EaRrbqayatJtYaGSAADbsM4UTxaFkFSbKdsZC7Fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:50:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 18:50:29 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 22 Jul 2026 19:50:15 +0100
Subject: [PATCH 1/4] rust: pin-init: merge `__pinned_init` and `__init`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-merge-init-v1-1-d4594de76538@garyguo.net>
References: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
In-Reply-To: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784746228; l=20170;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=uSQ4Gt+Rk1cJBp4XxSmuCqHFwN8IM2BigFvI15aqCq0=;
 b=E8kQ/bqgqtu0nfwhvVvdEI1vfTo4uAdI1T0vZyu6HjQ/dXsS0/42JOWfmEbsmOgSrmcgGy/xh
 Q+LcIVwrNvwApqMOR7Gt2HE+FyjmRK/kTmXZIafftYHnKPb9D8F7Ehe
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: cd239628-1fca-4202-f86e-08dee82219f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|56012099006|10067099003|921020|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ses/dqQbwRyFhWMzreSSHdW6Gp39Zhr/vr+qmGGGUAdw+sn25i5H6oK8TO1HNXAVKjdiPkP2OFFTd7qzxuAkPl/DRoUn9iP9HWeEPp0PCTU3pDnyfUMMLrc4bybFErB1DO03PfvsZXD81Sx0VC8ZCs+mfRh3llPmkihXO1ZlYZpoiWDEm1SKYapzt+lSj8fMP0xRrHCdz8JVAkaPLOK/lZbsVxvUNzBpG0NxDo8LESAIa/aNSgtQdKA/ZA/zA+Qi2lzKAlsAqwFYg9ab9hm62M6q+CMyvYAHhu+L0JvZCipL47x7fuIGTbieDord+RUmsRzcEdSICpMI4av2G09DmPBssFBTR+yCz/ociYc1rFsjhuo/Jsiu9kJhH3lq9mx+/vtl/OCHuQOz0e2XQyDqOsQbd7XLNByoKKbT+mS/jJMIPgqE/0NDiz26AA3RwIcn4u0nwtr+w37qPTSzwoKKdrQ2rjxkK0IbNgiDZcN89lA8gCKiz18tiJA+hKjgDN7Ta4wOlHLkUb68LrOJveIuw1UfYp8FUQhEN2aXAx40i4gGz+lXVhtjQDJELDKgLxAxa9+tQx/6k2RDpdoyB6aDQnmEyJSBIAGgHEoQRG1HIK1w6167CNpB8XbCOOi9kpjmSdohyYE6yXLY8QCtB+K5IrUtvkl0j7vJw0ru4rHcH8IUnv2C3cgKSnJdOFNsUOcuUrEq1LO02yNaEG7I/6Zppw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(56012099006)(10067099003)(921020)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUtvYk1VYWVQNkZFYzVGbjRYZEQyYWhOdmJ1MWthbEVKQm5BVDFRWnFYSTlZ?=
 =?utf-8?B?NkZHcEdzTEQ5bzhZRkpScDF3L3pLOVE4bWt0YXlwL2d0UjlTZ0V5b3ZkY3d2?=
 =?utf-8?B?a0lQQ0pkMUhtdmRzSVZSQTg4cENJY2k2M0tzNTZPTGZsSERWc1pvL1Q2THRL?=
 =?utf-8?B?dlU3WnVIRXZKdWcydlJHdkJHUzdLOGpybzV4VW9lUExyc242ZE5KczFINHd2?=
 =?utf-8?B?MTJxZ1pTOFF4Y2dlZHRDVXJzNGRscTZ3Y28xaTRXb2lQckpmQ3NvK05jeWZz?=
 =?utf-8?B?VVpVL2NOZG9SZjBXZnlEUnVoM2IvL040MzMwdmVWZDJabXRNN2pSaFhzaHAz?=
 =?utf-8?B?OHNrQnFGY1dtbUlwamdPTmMvbUI1OC9HMy91d0lZZjBtTE91UExHbXFvNGRL?=
 =?utf-8?B?b1RiSW5XWnAzeUloSmkxMWtyU0doSVFoZUFSMFZjWWY1RUkwL3JvMjVER2s2?=
 =?utf-8?B?WFdNSnFhaDgzeWRRZWp4eWc2cmFveENKZm5nZ2VoNWZnNHE5RXVPUEtaTzVF?=
 =?utf-8?B?enY4L0FPbDhZM1YwSEMwcWpEalA0SUh4M2FnRG8zYzd6VGJLM21iYVNPcEpZ?=
 =?utf-8?B?Y3kxYi84RmZuRTJocW5ReCtLV3paQmdST0FyK2RkOE5CN1owMDZMSTM0Yzgw?=
 =?utf-8?B?QWxUTGVVOVcrdHRIMUlwbEZTU3hpM05nM2RydnB2VnVBY2gxbjBqU3JGSXZZ?=
 =?utf-8?B?YW9iNWF0THMrVFpGUGRsNWF0TitpSk4zWGtEMjhkUjRpVmtTMUxacnFuZ25m?=
 =?utf-8?B?bm1mckh3elloaGVLVlF3L0MzQm9MNFhHRVpKZEt6MDgxSGtZaDAybEJiWEV4?=
 =?utf-8?B?V085TGYrVWVUVUZibGo3NFRVdW9qYTJmMThmVC9uUXBWVjJ3M1VEM3U2R3ho?=
 =?utf-8?B?OU03YjIwdkFEZXhtVmFmL05RM0xOK2hmOXh5SGlsK1VTNXFpZi9pSE5mM1A0?=
 =?utf-8?B?QjJLYnBlVzZYd3J6V1RMQ1Q0NWQrU2Y5QTVrMytzd3JhSkZzMXdnbFpwejE1?=
 =?utf-8?B?Mjh4TFB3RnlVbGYzMXB3UlB5dkVLTlUyV3A5aWhSVGdMV1dLMXVhM3BBb2VY?=
 =?utf-8?B?cHNPRmgrSkVEVSszSmhhLy91TTVpSzNteFd6NlBDbjVSczZMNjZ3bi9EdWoy?=
 =?utf-8?B?RVRxMVBWOVZrN21KYVhPTjdZQi9OYUF1by9MckR6S0ZKZisybnNNcGphMVhW?=
 =?utf-8?B?Z3JCTzZib3ZFcGVlRVhxcEFtMnpBNkk3R2xJcW53WVRySndxSHlFVldZd3Mz?=
 =?utf-8?B?M1EweVNjVi9iVFQ0cWE1WDY5cVBHMzI4aWM0SVppcmNvVk9MQzNhUEZ4anE1?=
 =?utf-8?B?bzRlSmh2cm85cnZVZ25vVG1uZHl0MG9DSHhMenhqQ2dZOGdCT21kS3lxTEky?=
 =?utf-8?B?Q21FUnN6SlhrZDhOTllXNk9GelluRHFYOHFHc1gybWM5OHlNZDc1Qm1BTHNi?=
 =?utf-8?B?WkFNL0ZFNDRsRUp0aEVkcXRFZTZ3UlpDT2M1ak91NmtKbGgzYUtzcjlZUlJQ?=
 =?utf-8?B?S1I0WFVqRmhuQ05rR2VyOWZjdW9yVkFxWjMxNnB6S1FsR1RuRDB2eHNKQTBl?=
 =?utf-8?B?czRURk5LTXhJMS8zZmZYYS9tbXR3VjhtWUhiV25SNkdpK3FhdG5PcVgrV2Jm?=
 =?utf-8?B?d2dyTC9PcExBVWlVZzJHMWxnamFFQ1ViU09FQjRJMk9SbmxSYmJkWlpENWYz?=
 =?utf-8?B?b21rSXZCSnNSeVM4N0FCdnBmdXV5YkZCak96Q25QTXp5MjdFamtIQjVoR281?=
 =?utf-8?B?SzBSS2U2L3ppT0hNdHBOY1BqbVVHOHdvaG9SRG15ZmdVU2hkSXBiVVBXRHor?=
 =?utf-8?B?U01FOU1jMFhIa3JyRS9GZ0laem1WdFhwOWlmV01Ic1ZRRFZqbFJ0Zlh2Q1Fp?=
 =?utf-8?B?cysyNmIyRTJveHV4eHZsYXBnZVVINVYrZW5TNUkyb3ZYNUhBK0NGQURhYndM?=
 =?utf-8?B?WEtRakFmYnBtQjJjaHhJLzVxUkUrZ3hXbU80MnNuN0sxSXNFdmdFUFJmcW54?=
 =?utf-8?B?ZXJuaVB4L0RuYjhrYU13VGQyem5oQTJucWl2cUc3TGZaTjhudlRsRVpsMEZB?=
 =?utf-8?B?YnVXVmhZMVNZQ1A2U3JSclFoMGNEbElGUkJiN0tGTkJYZTNqbHZmdGdtamdi?=
 =?utf-8?B?WDZ1VVEvWWkvMWRCeFpyVnIvYmtBVG5xMzZrUlpsVStYd3F2dnlFdmlPdHBi?=
 =?utf-8?B?TmtDd0tycSt3aWlyWGZ4cEp5T2dseHBwdjQ3azE5emlBTU5QeHFhVG5WZTB3?=
 =?utf-8?B?akFIOTNKa1c0ZlpsV1o1Tkk3SEQxV09SYmhiNUp4R2xLTWFXbjk5QkM4eEc0?=
 =?utf-8?B?UW85OWs1SDhZVGpUaVdYMmFEeDdORCtGU1NUY0MwS1VsbkN4Q2tXZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cd239628-1fca-4202-f86e-08dee82219f0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:50:29.5577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdTNVdXTZzGucjpQuwqETatbxMOWtZN/0jzoWcQzQguPQjfZunWZrvWn06xtnr+IaqDhKQ2pT5duBILItSWSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2471

These functions have the same requirements and are also required to execute
the same code. Prevent duplication by merging them to the single function
and document the additional relaxation of `Init::__init` on both the merged
function and the safety requirement of `Init`.

The existing `__pinned_init` function is deprecated and kept for
compatibility for existing users. For `cfg(kernel)`, it is soft-deprecated
for now and will be removed when all users are migrated.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/mutex.rs       |   2 +-
 rust/pin-init/examples/static_init.rs |   9 +--
 rust/pin-init/src/__internal.rs       |   8 +-
 rust/pin-init/src/alloc.rs            |   6 +-
 rust/pin-init/src/lib.rs              | 146 +++++++++++++---------------------
 5 files changed, 68 insertions(+), 103 deletions(-)

diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index 882f3e23f5dd..8a3236c0c502 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -81,7 +81,7 @@ pub fn new(val: impl PinInit<T>) -> impl PinInit<Self> {
             locked: Cell::new(false),
             data <- unsafe {
                 pin_init_from_closure(|slot: *mut UnsafeCell<T>| {
-                    val.__pinned_init(slot.cast::<T>())
+                    val.__init(slot.cast::<T>())
                 })
             },
         })
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples/static_init.rs
index 58cd4241b78c..8e71556ffe85 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -59,7 +59,7 @@ fn deref(&self) -> &Self::Target {
             println!("doing init");
             let ptr = self.cell.get().cast::<T>();
             match self.init.take() {
-                Some(f) => unsafe { f.__pinned_init(ptr).unwrap() },
+                Some(f) => unsafe { f.__init(ptr).unwrap() },
                 None => unsafe { core::hint::unreachable_unchecked() },
             }
             self.present.set(true);
@@ -71,13 +71,10 @@ fn deref(&self) -> &Self::Target {
 pub struct CountInit;
 
 unsafe impl PinInit<CMutex<usize>> for CountInit {
-    unsafe fn __pinned_init(
-        self,
-        slot: *mut CMutex<usize>,
-    ) -> Result<(), core::convert::Infallible> {
+    unsafe fn __init(self, slot: *mut CMutex<usize>) -> Result<(), core::convert::Infallible> {
         let init = CMutex::new(0);
         std::thread::sleep(std::time::Duration::from_millis(1000));
-        unsafe { init.__pinned_init(slot) }
+        unsafe { init.__init(slot) }
     }
 }
 
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 56dc655e323e..ae9a0e68cd75 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -181,7 +181,7 @@ pub fn init<E>(self: Pin<&mut Self>, init: impl PinInit<T, E>) -> Result<Pin<&mu
             unsafe { this.value.assume_init_drop() };
         }
         // SAFETY: The memory slot is valid and this type ensures that it will stay pinned.
-        unsafe { init.__pinned_init(this.value.as_mut_ptr())? };
+        unsafe { init.__init(this.value.as_mut_ptr())? };
         // INVARIANT: `this.value` is initialized above.
         this.is_init = true;
         // SAFETY: The slot is now pinned, since we will never give access to `&mut T`.
@@ -289,7 +289,7 @@ pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<DropGuard<Pinned, T>, E
         // - when `Err` is returned, we also propagate the error without touching `ptr`;
         //   also `self` is consumed so it cannot be touched further.
         // - the drop guard will not hand out `&mut` (only `Pin<&mut T>`).
-        unsafe { init.__pinned_init(self.ptr)? };
+        unsafe { init.__init(self.ptr)? };
 
         // SAFETY:
         // - `self.ptr` is valid, properly aligned and pinned per type invariant.
@@ -396,9 +396,9 @@ fn default() -> Self {
     }
 }
 
-// SAFETY: `__pinned_init` always fails, which is always okay.
+// SAFETY: `__init` always fails, which is always okay.
 unsafe impl<T: ?Sized> PinInit<T, ()> for AlwaysFail<T> {
-    unsafe fn __pinned_init(self, _slot: *mut T) -> Result<(), ()> {
+    unsafe fn __init(self, _slot: *mut T) -> Result<(), ()> {
         Err(())
     }
 }
diff --git a/rust/pin-init/src/alloc.rs b/rust/pin-init/src/alloc.rs
index 5017f57442d8..641f4c7ce890 100644
--- a/rust/pin-init/src/alloc.rs
+++ b/rust/pin-init/src/alloc.rs
@@ -38,7 +38,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>) -> Result<Pin<Self>, E>
     fn pin_init(init: impl PinInit<T>) -> Result<Pin<Self>, AllocError> {
         // SAFETY: We delegate to `init` and only change the error type.
         let init = unsafe {
-            pin_init_from_closure(|slot| match init.__pinned_init(slot) {
+            pin_init_from_closure(|slot| match init.__init(slot) {
                 Ok(()) => Ok(()),
                 Err(i) => match i {},
             })
@@ -109,7 +109,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>) -> Result<Pin<Self>, E>
         let slot = slot.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
         // slot is valid and will not be moved, because we pin it later.
-        unsafe { init.__pinned_init(slot)? };
+        unsafe { init.__init(slot)? };
         // SAFETY: All fields have been initialized and this is the only `Arc` to that data.
         Ok(unsafe { Pin::new_unchecked(this.assume_init()) })
     }
@@ -149,7 +149,7 @@ fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Ini
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
         // slot is valid and will not be moved, because we pin it later.
-        unsafe { init.__pinned_init(slot)? };
+        unsafe { init.__init(slot)? };
         // SAFETY: All fields have been initialized.
         Ok(unsafe { self.assume_init() }.into())
     }
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index ef9f20b11034..354fbefcf80e 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -889,7 +889,7 @@ macro_rules! assert_pinned {
 /// When implementing this trait you will need to take great care. Also there are probably very few
 /// cases where a manual implementation is necessary. Use [`pin_init_from_closure`] where possible.
 ///
-/// The [`PinInit::__pinned_init`] function:
+/// The [`PinInit::__init`] function:
 /// - returns `Ok(())` if it initialized every field of `slot`,
 /// - returns `Err(err)` if it encountered an error and then cleaned `slot`, this means:
 ///     - `slot` can be deallocated without UB occurring,
@@ -909,6 +909,20 @@ macro_rules! assert_pinned {
 #[cfg_attr(not(kernel), doc = "[`Box<T>`]: alloc::alloc::boxed::Box")]
 #[must_use = "An initializer must be used in order to create its value."]
 pub unsafe trait PinInit<T: ?Sized, E = Infallible>: Sized {
+    /// Alias of [`PinInit::__init`].
+    ///
+    /// New code should use `__init` instead.
+    ///
+    /// # Safety
+    ///
+    /// Same as `__init`.
+    #[inline(always)]
+    #[cfg_attr(not(kernel), deprecated = "use `__init` instead")]
+    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+        // SAFETY: Per safety requirement.
+        unsafe { self.__init(slot) }
+    }
+
     /// Initializes `slot`.
     ///
     /// # Safety
@@ -917,7 +931,8 @@ pub unsafe trait PinInit<T: ?Sized, E = Infallible>: Sized {
     /// - the caller does not touch `slot` when `Err` is returned, they are only permitted to
     ///   deallocate.
     /// - `slot` will not move until it is dropped, i.e. it will be pinned.
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E>;
+    ///   If `Self: Init<T, E>`, this requirement is cancelled and it may be moved.
+    unsafe fn __init(self, slot: *mut T) -> Result<(), E>;
 
     /// First initializes the value using `self` then calls the function `f` with the initialized
     /// value.
@@ -948,7 +963,7 @@ fn pin_chain<F>(self, f: F) -> ChainPinInit<Self, F, T, E>
 /// An initializer returned by [`PinInit::pin_chain`].
 pub struct ChainPinInit<I, F, T: ?Sized, E>(I, F, __internal::PhantomInvariant<(E, T)>);
 
-// SAFETY: The `__pinned_init` function is implemented such that it
+// SAFETY: The `__init` function is implemented such that it
 // - returns `Ok(())` on successful initialization,
 // - returns `Err(err)` on error and in this case `slot` will be dropped.
 // - considers `slot` pinned.
@@ -957,8 +972,8 @@ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T, E>
     I: PinInit<T, E>,
     F: FnOnce(Pin<&mut T>) -> Result<(), E>,
 {
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
-        // SAFETY: All requirements fulfilled since this function is `__pinned_init`.
+    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
+        // SAFETY: All requirements fulfilled since this function is `__init`.
         let slot = unsafe { __internal::Slot::<__internal::Pinned, _>::new(slot) };
         let mut guard = slot.init(self.0)?;
         (self.1)(guard.let_binding())?;
@@ -980,19 +995,8 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 /// When implementing this trait you will need to take great care. Also there are probably very few
 /// cases where a manual implementation is necessary. Use [`init_from_closure`] where possible.
 ///
-/// The [`Init::__init`] function:
-/// - returns `Ok(())` if it initialized every field of `slot`,
-/// - returns `Err(err)` if it encountered an error and then cleaned `slot`, this means:
-///     - `slot` can be deallocated without UB occurring,
-///     - `slot` does not need to be dropped,
-///     - `slot` is not partially initialized.
-/// - while constructing the `T` at `slot` it upholds the pinning invariants of `T`.
-///
-/// The `__pinned_init` function from the supertrait [`PinInit`] needs to execute the exact same
-/// code as `__init`.
-///
-/// Contrary to its supertype [`PinInit<T, E>`] the caller is allowed to
-/// move the pointee after initialization.
+/// The [`PinInit::__init`] function must work without the pinning requirement; the caller is
+/// allowed to move the pointee after initialization.
 ///
 #[cfg_attr(
     kernel,
@@ -1006,15 +1010,6 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 #[cfg_attr(not(kernel), doc = "[`Box<T>`]: alloc::alloc::boxed::Box")]
 #[must_use = "An initializer must be used in order to create its value."]
 pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
-    /// Initializes `slot`.
-    ///
-    /// # Safety
-    ///
-    /// - `slot` is a valid pointer to uninitialized memory.
-    /// - the caller does not touch `slot` when `Err` is returned, they are only permitted to
-    ///   deallocate.
-    unsafe fn __init(self, slot: *mut T) -> Result<(), E>;
-
     /// First initializes the value using `self` then calls the function `f` with the initialized
     /// value.
     ///
@@ -1053,10 +1048,18 @@ fn chain<F>(self, f: F) -> ChainInit<Self, F, T, E>
 /// An initializer returned by [`Init::chain`].
 pub struct ChainInit<I, F, T: ?Sized, E>(I, F, __internal::PhantomInvariant<(E, T)>);
 
+// SAFETY: The `__init` function does not rely on the pinning requirement.
+unsafe impl<T: ?Sized, E, I, F> Init<T, E> for ChainInit<I, F, T, E>
+where
+    I: Init<T, E>,
+    F: FnOnce(&mut T) -> Result<(), E>,
+{
+}
+
 // SAFETY: The `__init` function is implemented such that it
 // - returns `Ok(())` on successful initialization,
 // - returns `Err(err)` on error and in this case `slot` will be dropped.
-unsafe impl<T: ?Sized, E, I, F> Init<T, E> for ChainInit<I, F, T, E>
+unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainInit<I, F, T, E>
 where
     I: Init<T, E>,
     F: FnOnce(&mut T) -> Result<(), E>,
@@ -1071,44 +1074,28 @@ unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
     }
 }
 
-// SAFETY: `__pinned_init` behaves exactly the same as `__init`.
-unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainInit<I, F, T, E>
-where
-    I: Init<T, E>,
-    F: FnOnce(&mut T) -> Result<(), E>,
-{
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
-        // SAFETY: `__init` has less strict requirements compared to `__pinned_init`.
-        unsafe { self.__init(slot) }
-    }
-}
-
 /// Implement `PinInit` and `Init` for closures.
 ///
 /// It is unsafe to create this type, since the closure needs to fulfill the same safety
-/// requirement as the `__pinned_init`/`__init` functions.
+/// requirement as the `__init` functions.
 struct InitClosure<F, T: ?Sized>(F, __internal::PhantomInvariant<T>);
 
-// SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
-// `__init` invariants.
-unsafe impl<T: ?Sized, F, E> Init<T, E> for InitClosure<F, T>
-where
-    F: FnOnce(*mut T) -> Result<(), E>,
+// SAFETY: When constructing via `init_from_closure`, the `__init` function does not rely on the
+// pinning requirement. When constructing via `pin_init_from_closure`, the opaque type prevents this
+// implementation from being visible.
+unsafe impl<T: ?Sized, F, E> Init<T, E> for InitClosure<F, T> where
+    F: FnOnce(*mut T) -> Result<(), E>
 {
-    #[inline]
-    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
-        (self.0)(slot)
-    }
 }
 
 // SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
-// `__pinned_init` invariants.
+// `__init` invariants.
 unsafe impl<T: ?Sized, F, E> PinInit<T, E> for InitClosure<F, T>
 where
     F: FnOnce(*mut T) -> Result<(), E>,
 {
     #[inline]
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         (self.0)(slot)
     }
 }
@@ -1160,7 +1147,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
-    unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) }
+    unsafe { pin_init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) }
 }
 
 /// Changes the to be initialized type.
@@ -1195,7 +1182,7 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
     F: FnMut(usize) -> I,
     I: PinInit<T, E>,
 {
-    unsafe fn __pinned_init(mut self, slot: *mut [T; N]) -> Result<(), E> {
+    unsafe fn __init(mut self, slot: *mut [T; N]) -> Result<(), E> {
         /// # Invariants
         ///
         /// - `ptr[..num_init]` contains initialized elements of type `T`
@@ -1237,7 +1224,7 @@ fn drop(&mut self) {
             // - If `Err` is touched, the subslot is not touched further, the guard will drop
             //   previously initialized elements only.
             // - `slot` is pinned so is the subslot.
-            unsafe { init.__pinned_init(&raw mut (*slot)[i]) }?;
+            unsafe { init.__init(&raw mut (*slot)[i]) }?;
         }
 
         // Dismiss the drop guard now that all elements are initialized.
@@ -1246,18 +1233,13 @@ fn drop(&mut self) {
     }
 }
 
-// SAFETY: Follows the `PinInit` impl. `__init` executes the same code as `__pinned_init`.
+// SAFETY: `I: Init` cancels out the pinning requirement on subslots, which is the only place in the
+// `__init` function that relies on `slot` being pinned.
 unsafe impl<T, F, I, E, const N: usize> Init<[T; N], E> for ArrayInit<T, F>
 where
     F: FnMut(usize) -> I,
     I: Init<T, E>,
 {
-    #[inline(always)]
-    unsafe fn __init(self, slot: *mut [T; N]) -> Result<(), E> {
-        // SAFETY: `I: Init` cancels out the pinning requirement on subslots. The other safety
-        // requirements follow that of `__init`.
-        unsafe { self.__pinned_init(slot) }
-    }
 }
 
 /// Initializes an array by initializing each element via the provided initializer.
@@ -1336,13 +1318,13 @@ pub fn pin_init_scope<T, E, F, I>(make_init: F) -> impl PinInit<T, E>
 {
     // SAFETY:
     // - If `make_init` returns `Err`, `Err` is returned and `slot` is completely uninitialized,
-    // - If `make_init` returns `Ok`, safety requirement are fulfilled by `init.__pinned_init`.
-    // - The safety requirements of `init.__pinned_init` are fulfilled, since it's being called
-    //   from an initializer.
+    // - If `make_init` returns `Ok`, safety requirement are fulfilled by `init.__init`.
+    // - The safety requirements of `init.__init` are fulfilled, since it's being called from an
+    //   initializer.
     unsafe {
         pin_init_from_closure(move |slot: *mut T| -> Result<(), E> {
             let init = make_init()?;
-            init.__pinned_init(slot)
+            init.__init(slot)
         })
     }
 }
@@ -1390,41 +1372,27 @@ pub fn init_scope<T, E, F, I>(make_init: F) -> impl Init<T, E>
     }
 }
 
-// SAFETY: the `__init` function always returns `Ok(())` and initializes every field of `slot`.
-unsafe impl<T> Init<T> for T {
-    unsafe fn __init(self, slot: *mut T) -> Result<(), Infallible> {
-        // SAFETY: `slot` is valid for writes by the safety requirements of this function.
-        unsafe { slot.write(self) };
-        Ok(())
-    }
-}
+// SAFETY: The `__init` function does not rely on slot being pinned after it returns.
+unsafe impl<T> Init<T> for T {}
 
-// SAFETY: the `__pinned_init` function always returns `Ok(())` and initializes every field of
+// SAFETY: the `__init` function always returns `Ok(())` and initializes every field of
 // `slot`. Additionally, all pinning invariants of `T` are upheld.
 unsafe impl<T> PinInit<T> for T {
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), Infallible> {
+    unsafe fn __init(self, slot: *mut T) -> Result<(), Infallible> {
         // SAFETY: `slot` is valid for writes by the safety requirements of this function.
         unsafe { slot.write(self) };
         Ok(())
     }
 }
 
-// SAFETY: when the `__init` function returns with
-// - `Ok(())`, `slot` was initialized and all pinned invariants of `T` are upheld.
-// - `Err(err)`, slot was not written to.
-unsafe impl<T, E> Init<T, E> for Result<T, E> {
-    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
-        // SAFETY: `slot` is valid for writes by the safety requirements of this function.
-        unsafe { slot.write(self?) };
-        Ok(())
-    }
-}
+// SAFETY: The `__init` function does not rely on slot being pinned after it returns.
+unsafe impl<T, E> Init<T, E> for Result<T, E> {}
 
-// SAFETY: when the `__pinned_init` function returns with
+// SAFETY: when the `__init` function returns with
 // - `Ok(())`, `slot` was initialized and all pinned invariants of `T` are upheld.
 // - `Err(err)`, slot was not written to.
 unsafe impl<T, E> PinInit<T, E> for Result<T, E> {
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: `slot` is valid for writes by the safety requirements of this function.
         unsafe { slot.write(self?) };
         Ok(())
@@ -1467,7 +1435,7 @@ fn write_pin_init<E>(self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initial
         //
         // The `'static` borrow guarantees the data will not be
         // moved/invalidated until it gets dropped (which is never).
-        unsafe { init.__pinned_init(slot)? };
+        unsafe { init.__init(slot)? };
 
         // SAFETY: The above call initialized the memory.
         Ok(Pin::static_mut(unsafe { self.assume_init_mut() }))

-- 
2.54.0


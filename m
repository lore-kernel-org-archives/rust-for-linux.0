Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020080.outbound.protection.outlook.com [52.101.196.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C211A9FB7;
	Tue, 28 Apr 2026 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381875; cv=fail; b=U3rAxt8dylj2wUE1Q8zluCM+uSsKy7nRbdE0/ABgVrPBYnXWNYg/FSAWWv3xtJGZB8wZcu1P3SBrT/HqUFzO2UxlBrKCKCW+yK4z3o4lfwvXwDigMBW8MxN3jVQMlbL7CuhT71JRJq3mNQj2cycA741/zr2opXvmGnbvb1JYX6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381875; c=relaxed/simple;
	bh=vE//mnTDd+4hPWmsp1fYd8wMFmEUgdEuYDG3PwBtyT8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hEJmskMcS/3ZhGFOz9ov5lQzmzXw5wwVX9w0xXGwFvzNMPRgb4JcvvutvA2SKHlT67YthELyzpaicSc1kKGaJiJhl7xpyxiRnnV1Vxe45cmNjl75BJl57syKCOxOjsCwDFE5nSaX/fAb0H3fvdX0bOnXGGHM1+b0N4o5e56OrUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AQkdhOyO; arc=fail smtp.client-ip=52.101.196.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AQkdhOyO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAxHpKnjPdPWjTfem2lBj7mupZ6ihOLDHUUKqa2BmzN322/Ghhk2j80tNQojSFQy9ebVa1MckEUh3aTSqlNQLXw8SgaE+xBBD6e2lUqzDhUZJg6bYjdBinhODk803Hmd/WexJaR0HvNhK/bVMziiLCbMvnB/5xPjFZ3zPPbEZYqJ9EwwligmEwfsw6o/j2DOzrjGbdRt6Mv+g5uHJqcnr0i3oUQSHabw2N/0sdxl3cOBWVPIK02zx34GPoNyPFMIpWjdxC12n7b7/MIXSA8Y+Zde3K2piHiJqiOEBm51umNFEWuWZERlthVpK1WrbKFOxL8aePuugWnvFJGsW+LrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNRW7UbVIosfkOqO1SsejiTmwT5/RIn0KZSLbddB2iQ=;
 b=ekYQmFA3Juo3zRXtYcNms4mAtkjgiHkfD8rAjCJGcC7EZlptDhUTNEbG7vIyxU00Pz6A4DZ1hQmAOPvtTnO25twPL9hIRv27QBNypT77chxpw7W7O+L/2jnjAefxV2GqENK1QmHI4fW+mPrYGMvAeeVFCubL8x1KG2V7L92hjZMNivxLVNytGetR82fdOtuKwmAJfxgw4oLE/eb1JbhvvHCsj2DdDS5oixBnyAW89dt7UgK8zwpuFXP5V0mKqi4NZoDpSExokdY6ckFHPPvubI/PSQyShli5CS76zTxb/yvWIRsSGiH8YBeq2A7+GN99tkuch1gUnVhmc+VMh9JtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNRW7UbVIosfkOqO1SsejiTmwT5/RIn0KZSLbddB2iQ=;
 b=AQkdhOyO47D9SR9k1KDsURN6c4nHWZIpBxhNix20/gLVRaIgQyiZ2ZlfnB5VeRhBEd723qsiY+Zj/qop8YKHnTnn7dksWilt8HaHG31Ly0ZeNrZjhlmfQe/BLtBfrvtJL1OVgcHJdDz15KLXcWJSg5ft839V9LrmoesmkJBWP2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5208.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:10 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:50 +0100
Subject: [PATCH 01/10] rust: pin-init: examples: mark as `#[inline]` all
 `From::from()`s for `Error`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-1-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alistair Francis <alistair.francis@wdc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=1387;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=B7CgVNxqkBchDbE2nGdqZ0FSZ6ADUuua2pfRPNRvztw=;
 b=7ykDAbWjye1mQXg4kzvwCvGiX7qSDPs+yf35DkkQBw7GayFqMzEOm3RazUJc2FyicgCeAmcyA
 m6ET4e5EkUGCrp36GAga7/LDJCJhc+iL2NpC3CYffCjCkDIplqlAEYS
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 358de151-0a29-4039-47e9-08dea5279dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|10070799003|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VoWi9g7lCCaZiKE2Ebcpnxn1QtHvoO2XkMl7lYLmBqVA8xrxUwG3/tak5GAxIaozr8A/rppvknwoYZEXZDFKyGVNHPPhwXUTfHnh055uC7AG9RH6jYXm0QNaAIVlwzdYVkYSvt/j+YlygFXWBqSe4IGubLDB9vY7DTP/lBrSBClRB6HCNQXDZg4YAoDnwh2as8LhW76Wt6Wq1A6e31Durdeooz/zU6jFHWNO+NfiRBVwxdKjJo3TZYfd7mXp4+EvDalkiHS748EoCONQ6a6mzuMxjgCETzXFUIMuE8c0LJNO0oU/TofExuvfl2Ki53LuR3onX0ncqrmWaeCwO6FhUvcFEY+2QFNhc5WYq0nCHZ0On26NpdFOTzUB+N1B7Jof9o1/9qhuJOt/PjaycqUAW5IAQFaTEcYR38Ja6vL5jJdICFID+yEyYaNGvU9ZcMaKju7EsCqcEVMop8v4c4kOu+ck1z3Okuchd6Pv5lGNGFvhYXax11IdwN6t1e690bfCAuKAgdb1pweqdpE/JewwhU6MZ90K4O56sYu8nb/yY2ye6c7J0sLxEU+9gDoB9pNhxPPdUaJrAhXN/ZBPRnCefIjwAyLunBkWlbm4oKSC2R9zzfx/a5jd5vY7RwaX4hWCofkia60LPC1zdqWmSYNDzycIIungSHRKbznsec6xmOjWjt1GLTTCkBojH6wnpmwyOyRBCpVU5d7qvb7AdtS01v1ggBoGjCj1LTeIYIq7FOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3paS1BJeVA0aExNT1RRc1ZhOVFEdkVGdEdvdzdZd2ZTOVZZMC9QbXQ4UXFG?=
 =?utf-8?B?VEZsRDFJaUtuWnFmK2ZxdUdvQUpuOUczRGJNV3ZBSENISzdRbGVraldkOWNw?=
 =?utf-8?B?V1pZNEpPZGlrMGxEeWhYTlY1VWdsS1dGdE15MEpuSVN6c0pDSGJjMzgyR1Jj?=
 =?utf-8?B?c2FjUitXbzA1K1R1Mk5MODhEL0ZFajJHZUtEVnh0Vy9kRUp3SUxoeXYvWWVi?=
 =?utf-8?B?TW1zK250R3hkZE1lV2tRamFzMVc4SHd3RERDNXNtRklvSlA3QkszMm02c05E?=
 =?utf-8?B?bytIMkJWdFZ4QlBxUGFWK25lV3hyTUxkbTB0M0l3MWptdFF3WXdDMDFDeW50?=
 =?utf-8?B?eHFNeUoxd3dVQ2pLSS9zM0NlS3hITnJ0aU9oUEFjUjZRWGtDMjNySXFLTVZH?=
 =?utf-8?B?SmpTTUJacmpRWnVVMUVjdS83KzMza09rTHdTTDY2Ym80bytFc3RDaThMQWZs?=
 =?utf-8?B?c1diSWtjM1JPQzNRMTJoY09NWk9Ea3B1RlZUOGxSTFg2N1gwekhVR3VUYmds?=
 =?utf-8?B?UEdnRUJvQTVkT1FLYThHdWpCRml2bGxlbE92aDJJMCtjNWVUQndrakMyM1dj?=
 =?utf-8?B?WTYwZ3lCQ2dpRm5BQTVUa1k2ZlJpMW5LNjVNRkFxaTd1d2dPQTRDRkNnTS83?=
 =?utf-8?B?WnJEU0pXV25SbG9IaTVHaFloTEZNSGQvTFE2Q2pMK1BWSXpzOTFDT2ZpcXhK?=
 =?utf-8?B?UWJwYjNya1g2WnFCS0dOYjJGN0lvMjdvVXlwbUt6aFh4OE5KNWJZb3dpTmJB?=
 =?utf-8?B?UXhtWjc1blU5c0h4c1dtdlBQbVM3TzJkRm5leXY5d2lPWFRVUXIwMjJFQnYv?=
 =?utf-8?B?Ky9aY216b1dKQlpNUFlFaGRCQkdmMEk0cUpBYVVpdkloTTBQUk1tMk12WWFi?=
 =?utf-8?B?SnNyNEtSaDlHaW5vTW1iajdpWUhXczFnN2FITkVHR0d0YUt3T1ZpWGpZQjkr?=
 =?utf-8?B?cTNqUFRJNFltcU5UR0tnVGRnQUJ3eFZCZzNkckdLbzQxOGJNd1dlV2oxM3Y4?=
 =?utf-8?B?K1FhOW9tY3BkN2plZXgrK3VOL2xEUnZNU1lRV1RpYXlEUGpqV3lmOFVGOUp2?=
 =?utf-8?B?aE4wMVpNRXZhMjN6QjNvUll4Y1BBUjlGaWtVZExuRkNGWmloMkZTMk14WkY5?=
 =?utf-8?B?R0EwQ2RGV3pVazBibTNGRUFpdzdYakZmTjhzcWhoaTNLK1lyQm1aWWJlR2VV?=
 =?utf-8?B?UEo0UGFFQWRBYVpFWmsrUDJwMnVXU0U4bHE1NHpUditnTllWWWVqTFhyb2dY?=
 =?utf-8?B?d0JaSjVPTUM5WUVtcDN0MjVIbHQvakcvRDAzWjJhSzkxbzl1QWc5L2wwUEcw?=
 =?utf-8?B?Q1JOQVRFeUtZbWlpczhWSEV2WThaMVFKRVlwcndxTlU3LzlLMHY4akYzRktv?=
 =?utf-8?B?aDhsUDM5U0RvVS9aNXVBTUZiV3FwVVgwQzdVdU41L3Vhdm9RaGNJdGNoYTQ2?=
 =?utf-8?B?TVRjdTVkYXRGdVNyaG83Mm9VSXdzeVJSWmxvUEZmZE4zb09BY2NBQWE5dFk0?=
 =?utf-8?B?NDJNcWplVlRpMmVic3QvNEhPSXZNU1hidXRRcTVMSkc5anROUHpsYzFCTG9F?=
 =?utf-8?B?Q1lFeUxEL01VNkg0YmpXcmZYSS92bUhONzY0NjNLOUdTTUJaUldYUUZWejgx?=
 =?utf-8?B?TXR1VWR1ZUhkN1IxcWVCNEp6OGxHeDRXeGRVbjd6aWJ0UlhzVlpWdCtmZ2Uz?=
 =?utf-8?B?Z0xURUFWWVJUZTFmV2VvUGRGRzk2bDdwNUZQb2lJNy9SRHMzVTJiNVpQNSsr?=
 =?utf-8?B?b29HbkZrcW9mbnFNeXB4Mjk0a2N0WDJ3eUczMWkzM0s5a3J3TTcvVTlaQXA1?=
 =?utf-8?B?bzRkdzEyZkFEenhoNDR2dUl5eG1Eb0pHR2pKZFB3azN3RUc2SVAvRTJwSzc1?=
 =?utf-8?B?VDhObVI2Q2R3ZXVVeFBDYlplWE9PbnNiQmpvSXkxMUlYcHlxVTcxRzB5bndk?=
 =?utf-8?B?TjlKVjJhaFVwc0hSWnBrcEpBNk0xKzYyeWRST1grRzdFbldTNXMvSDZlU1Fu?=
 =?utf-8?B?WkZrUXo2L25wUE9zYUFTaUpidjhpcVlQR1VaZ0xScjRuNWFGQituS010OUVY?=
 =?utf-8?B?cnlOK0RRUEZlMUxhK3Uvdi82b0dtSHBoWEhLZkNoeXFwWE5LWWdmUGpldjBX?=
 =?utf-8?B?ZG9yQXdPUkVtUm8wcVQvUGdJRWdiSS82cEgwM0ZHRXZKa21NV2hCVU50Mll0?=
 =?utf-8?B?bE44aGhBNno0K1ZFN3pvT1RyWE9yVTBzMXpTQWwwNzhZcm1jeHNUTGdMZ2xz?=
 =?utf-8?B?L0xNUk9FSXBlaDk4YjRlalNBSElPZjN0T2lIdTRnUHIrazIxMHNOSVNvT096?=
 =?utf-8?B?WVkyWFNmaCtNRFRpV2tHUzRTc3RQTm54dFpZR1ovTW9VM2V6dkdadz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 358de151-0a29-4039-47e9-08dea5279dd3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:10.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyiUtvI63K5UrPdagF6QTeA0S9JBi0n2xBM9HCNDqJlwm/sNZDts5qA4kKfgdInRA2XLG/cSuPcsPrUKf8z23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5208

From: Alistair Francis <alistair.francis@wdc.com>

There was a recent request in kernel [1] to mark as `#[inline]` the
simple `From::from()` functions implemented for `Error`.

Thus mark all of the existing

    impl From<...> for Error {
        fn from(err: ...) -> Self {
            ...
        }
    }

functions as `#[inline]`.

While in pin-init crate the relevant code is just examples, it
nevertheless does not hurt to use good practice for them.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/all/8403c8b7a832b5274743816eb77abfa4@garyguo.net/ [1]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
[ Reworded commit message - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/error.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/pin-init/examples/error.rs b/rust/pin-init/examples/error.rs
index 8f4e135eb8ba..96f095398e8d 100644
--- a/rust/pin-init/examples/error.rs
+++ b/rust/pin-init/examples/error.rs
@@ -11,6 +11,7 @@
 pub struct Error;
 
 impl From<Infallible> for Error {
+    #[inline]
     fn from(e: Infallible) -> Self {
         match e {}
     }
@@ -18,6 +19,7 @@ fn from(e: Infallible) -> Self {
 
 #[cfg(feature = "alloc")]
 impl From<AllocError> for Error {
+    #[inline]
     fn from(_: AllocError) -> Self {
         Self
     }

-- 
2.51.2


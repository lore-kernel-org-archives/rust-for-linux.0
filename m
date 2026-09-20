Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B4345ED8;
	Sun, 20 Sep 2026 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789919377; cv=fail; b=YOoiusmGsgLxvV6rkYf9KEMbGi9ks2Ik3EpbKKFQ8XKZFqFu1Ggt+ZaaryMcB3eiwXadO+vDL4e9rgbjFulAFR4zZQ5n0Hjw74hronUXRlWrIltduGpEgj9aXTkSvcT0xXuj6KU+mN+wtdV/9PZ3RXf8LEbMGN68Rz4aWrvsV7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789919377; c=relaxed/simple;
	bh=3vPe1e9edpTAXOkPr2+F4lQ5jVECmwOn7ChaY9hYiFs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=bEssoNdEmVWTKl5Csa0ydpuYlbuG17q9LgJf34N0PFl7UclVyQV7OUVgq/So9scQtHWOjzP7mojVt3wQZbXHoVaTOfeEF5YN+XFFH4iGsBMbFQF943zdpsoC8VieqlQVkGUWHh3n8GIFgTiZoPp9vpP2je6CBnFigCoRybwSVm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RA41iAYV; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RA41iAYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+GTpxBatvyieYIQUWzyWV2xrLzyDBKqZAB+1M2klr5H8LhM1vZs9sEkjcgff6ETJuLehfbLlF+sDZ7J4JxfJ947AHV44UevEtw2jpplPQ5zAnpuhQNIn3uejiT0LpSCchaq7DemL0GHnMiYOzc3AIJrxwqQvlZLsnV0XoIO+Dnxd4LQ5JBJdmLOKk1IZ/jQgirSLW9wHM85Isr8GDF7i99Auzznzbi7jtRqL7GARYQB/uBS83dO04mJ36PyAsgsGUSZCF8rnQftVGvmuLP8rzN+70ngFXAF7nZwJfFuw67s9+wpOzNFQlW6i1xIDOWEFFXw3nbY4Cuva1A1W9bBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro9fVxqv48akcZUwllWaAHbu0FX2tK/kRmWfaJYT67I=;
 b=VDbeAG9q5kK3D8F2XvHbFkKoGLpEuYHR6HJ6pTUcf/bL4iPPq77xMUFPfTOuUBcWsLLKLoNjWoBMxMjL24QcQCwanG2XVlgp/OVVGJ1eZQ4gqnWJSB/GSblc6uYVP7QnAI6LTitsrjpSJAgXcQvLQB00lRyO/7m+iWs57mrxAWB4fO4y87cnbbc5u5LLsiHVGF/9MMpCc8aiGtjMpu3iDzej5RIFZdNO4TfF2H0WYMkZPTHmwzuslCd2ZEZu+sfF9Xoi0y85u4oP3rWNz0/UGK05mKzY9mPhG6h+QJSPGfNMq8+akN6Q0XonFPQ101G75oBNd5fjSEIvP0JRn/aOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro9fVxqv48akcZUwllWaAHbu0FX2tK/kRmWfaJYT67I=;
 b=RA41iAYVA5B8ZBbGzvvgeeRTxs46C01EEyGEySUU8uD5JpIIBw78qakAgxreN0yNqXlo0+V8J8BAuRs0Eo5z3H2hXv8X0yHIlKB7KPscJb04uqeKj36dJfDcEIVKmMg0Ak4iTb1uYYC5bREQ3OzhK17HUMzGDMAjBAxzkyV0+TjSLJ/dY5k2RbT2ZNU/9qepMtaeLh5+4mWTnBf/Pgi6OLBdMSdz4YsM5BFPOh4k8bCtjkTYeE4Ts/jOtNGT8wGnv2SMRaJ+HytboL0I7+MXT1UyL7Hq9j1A2ZfqCVn0tGQJRhVlHajKdNB6Bcy+s6YA8LOwqdIB9xLn/FHbeLOa6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN0PR12MB6221.namprd12.prod.outlook.com (2603:10b6:208:3c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Sun, 20 Sep
 2026 15:49:31 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 15:49:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 21 Sep 2026 00:49:28 +0900
Subject: [PATCH] binder: use irrefutable let patterns
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyND3aTMvJTUovic1BLdFLNkcxMTs1QDYyNzJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAHiIYxxuAAAA
X-Change-ID: 20260921-binder_let-d6c7446e0327
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0297.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN0PR12MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ac4334-8f63-49d4-43cf-08df172ec2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	8TpWagCOVijfv5ohDJRQI9fuSQyp9Vo+ilUqDSKEZr/LnZoSPURcb8nTl6Y32WXSC3zeSCFMDSsqNQ4iZs+QI5i4+6QdSyjDKoATE35MO/HgepNhnpQW/A1TJ56smxUW9ERBh/c/cttw/w7vb8XN6JzJ1h0VDgiXCGdLiiCH0Fwyp9E2/3q52vxzkB+Iq8MAT2oFnDSJsJ/LPppmqImHXL8fF+IbCmsz19zG+fK4k4i22ahFnlBO559xgzmzYBeF/+tf8FihnYmkanJe+wU9ZQevKRJzt0x/TLyXP7Zeg39PnS2bxWCKuDuiPIs6BGc4fYyh4Xga7nqwSH1r45AUch1s2dbcpciHl4WX2avmpllTc02pQbvA5D4BEQaaoMgxreAfBCoNDrZtPTjQq8YjSqwpiSP5KhuOrxvCs9BXM85AaxZdOKG/nxH6PZ0BA//JTIhRVUpY4MKOV15G2S7w7Qw0DL1VR++sMmnjf6as2mzOAr4+CggobjzhStUmEgX1bCx/QKiLtPQttiwClYQRRqERF1Nl9AISPnLlwtEBoXnFeMiNaqZeSzhw8fhkzi0D7Grt8J8vvO08bVJeyZP1bI/j3o/q+//wX8qUUCq3Dzd5o+5GEQCc2sZlD/qmGeao7rFcLMbbQ9FZ1AiwPYpWIothTHS48CoSGzKMv7Sw0o8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUlMR3BIU3M1QzVFeVRLcXB4K1JZK1VSbU1TbjNMUDlnbXZMVzlzZVJ6V0pp?=
 =?utf-8?B?aUpDd3FLQ0Y0MWp3VGpPVkwrMXhFdWxHSHJqaEtqWkpvS2pPWUZ2K2tsTmZJ?=
 =?utf-8?B?dzN2anpCME5zVCs3QVVtK3ZSbWdqWmJPbmx4Zk51WWpPL0ZmS3hjRVNab1cw?=
 =?utf-8?B?RW5QN0M5aVpId1d5SCtHZGRUUFhTOEtoQ29TSWJPZm5VdDMrK25lMTZiUjVP?=
 =?utf-8?B?aGtNL2d5dUl6bjRORFJZR0NIQmlVRkdvUE1EOENQejVPS0o5ZE1aQmJPN3ky?=
 =?utf-8?B?Q2FBT0ttYmwvVU9TSkVkQTRhWjVocEMvUklOVHlNTlV5T2l5N1YrMzEvZWZ6?=
 =?utf-8?B?TlNwK05Fc25KaXQyZmRGMERnRUNnTlNwNUZKT3lpSHBkQkRaQ3dDOUt5UUVU?=
 =?utf-8?B?ZXdNaDJVSGxyaW00VEdiK0dsUEczSnFBakx1U09rSGdjR0wxN3ZxdlUyc1o4?=
 =?utf-8?B?QmxFMVBrakxMT2VwdTBDeHZNMEY4WjJoYnFLQmlPWVp6Mm1JeW42MTQwUEhR?=
 =?utf-8?B?b1JLc2Ntb3R3SFBGQkVwcUZQejlMdWRXRU91b2pUeXdLTWQ3a1J4MklQbkNp?=
 =?utf-8?B?VmVGTXFhenpER0lXV1FlVnYrQTh6OWVvZklYK1NxU1dVUGdCLy9LYmF5VDUy?=
 =?utf-8?B?UnFuNHUvL3NBNzVmaW5pdWQwK2NNSjZKaTB2THg2RFk3UWk4QUpBMHJMUGc1?=
 =?utf-8?B?OFA0cjhpVXJTQTdYVGlsYUxEanpzSnlqVTl0elhwQmhGZUFJTDliOXFSdjlG?=
 =?utf-8?B?VnZyeE80SXg4akhtMm1oZEsyM0IybzA3VnRMVW5hdHhzc3ZVanE1K2xYU1F5?=
 =?utf-8?B?eVV0c01aRFJ6cFVCWXJNNG9sRDk3clVnYkY4OElpZzB0NjMxYk9heGxIdGs4?=
 =?utf-8?B?bXJrRWtlZWxmRjZaSm1Gb29wVlFzZFY5ckU3S0hJT3pzb0dKbVUwWkJ4bDRh?=
 =?utf-8?B?Sk9vNmlnQ1FnYUtteElWdW5QUFU4b1BzdEtJdDFLcjdaZ2svVkVFTmNrWHY2?=
 =?utf-8?B?bE85dlp3NDVEUnR1Sm1JY0txM3M0dEhNOE5WMVhRNUowZW9VZUgybUJoMW5O?=
 =?utf-8?B?NmdlaU84UkxwRlA5M25aK2ZtUVZJM3djeXFucUxMYzluRVBiZzh5KzFIeEpr?=
 =?utf-8?B?L1dia3hHQUxvUGhhM09QenNjaFI1amxSbk9LNGtDbEdJZ015UUNsTlJVUUNj?=
 =?utf-8?B?Q0Q5VHZhSUU2cGh0RHJHd0Y4NlYrT2g0Zm85SUs1MjhnaEl1OHh0cmRDQ1BO?=
 =?utf-8?B?bTNGQWt5WDVPSUF4Z3RiTDlZak1tWFdUMDN4bzJJNTNaRmlwd0VaaWtkN3pC?=
 =?utf-8?B?TmNuZGhtMXhDTkk4bENUWWdraVRCUXNKeHhic0ppQzFoQXY0UUllc2JBUURk?=
 =?utf-8?B?ZW13azZsOFFoSnd3eFR3Nml3aTdsWFFpTmJ5MXl3UzI3ZmFCS2dsQ21iL04x?=
 =?utf-8?B?NHZYOXJYZGJ1bWNZM29NUnJHWEZsSE5mcy9ZTllqOVgvRTlaTzZoaFRDbXdZ?=
 =?utf-8?B?V3ZaUXpRTGlWd3ZIcCt4YytiSGlSWkJLbkpxTzdXdHZiT0tkVzFIcWxzUDFo?=
 =?utf-8?B?YjJlcmhRTU4zeFlOVkl5OVdSdnk5czcyWlhxaVRIc1Q1Sm04bmd4QlpZSnFw?=
 =?utf-8?B?bTJBc0tWd2VQa1kwSHArOXBMUnNTaW5wcjdCOURZUWZaMytUdmJMVWsyM01B?=
 =?utf-8?B?MW5IQkZDNENJeWxiVW8ydjNIcXYyYlJjSTYwTklaR2p2dEFlWmowMDlrS2sr?=
 =?utf-8?B?dVpSNklBRWI0ek9yNGR5NzRzSXBOeUp6ZHlUQUVNcTh3cndmY2Q0eW5USGFn?=
 =?utf-8?B?MHdaR2pGYVhXSmp6ZU1UOUNkb3FUdkJlVUIvWUZCU1E1eTB0VmlISm5rUEdO?=
 =?utf-8?B?Q1RRUllvd0RsQmxaaGlYMGdhczBnZkR4eWc4YzlFNktwZDZEamhVL0FabitJ?=
 =?utf-8?B?VXA4TjlPVGdISnNRWUtVMXdmdVhSb1BsVGR4NXZvMGFEUWhRanc0dU1NYWRr?=
 =?utf-8?B?V0FMMjZESSt4ZjJMeEpWdVp1U09WQzFaWWhrQXc1Tmd2Tzc5ZmczL2s5VDFS?=
 =?utf-8?B?MzVsUlZ0aVVzRTZBTEJMbjVoT0JveXdkeHhrNXVWRCsrYjFLWGIyOG03aWRa?=
 =?utf-8?B?U3RmcFp4Rjl5dGFRajVvQ2gzc1A0VldEMkQ5ODF2d0dUcVhJeStVMUdTRE9H?=
 =?utf-8?B?VWx4RTFZbkxyc2lKYXRsMDV3MDAxU3c4RFlFb2JZaXRSL2llNUhRWWJibi8x?=
 =?utf-8?B?VWdKR0xhQW4vYUNSTEVoU0cvVU5pay8xZFJ6UzdPMERiQlJmT1Q1eWpmVzZ1?=
 =?utf-8?B?dnRsMkNoek5UY2RLRFcvaCthNUdib0JUa0VuMnh2N1kxMEVCbmhtNVhSMnow?=
 =?utf-8?Q?PeDLzcPyXkjX1bkdsQ8svxoBdqZCE/QESnvfTANvM+rra?=
X-MS-Exchange-AntiSpam-MessageData-1: qbZjXhPF43G3+w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ac4334-8f63-49d4-43cf-08df172ec2e6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 15:49:31.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuLQpyqHb5zKVjpLRDozaQyTZgU8h7JdUXJjvyr9iBzYVLVfcIHxV3Shd4Feh2c0TDBfYZ3R9baJ4Y6iY029IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6221

Replace matches on infallible results with irrefutable let patterns,
which are available since Rust 1.82.

This removes boilerplate for handling impossible error variants.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/android/binder/freeze.rs       |  6 ++----
 drivers/android/binder/node/wrapper.rs |  6 ++----
 drivers/android/binder/process.rs      | 17 ++++-------------
 3 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 66912b4cb527..d4fa017063dc 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -75,10 +75,8 @@ fn new(flags: kernel::alloc::Flags) -> Result<UninitFM, AllocError> {
     }
 
     fn init(ua: UninitFM, cookie: FreezeCookie, pid: i32) -> DLArc<FreezeMessage> {
-        match ua.pin_init_with(DTRWrap::new(FreezeMessage { cookie, pid })) {
-            Ok(msg) => ListArc::from(msg),
-            Err(err) => match err {},
-        }
+        let Ok(msg) = ua.pin_init_with(DTRWrap::new(FreezeMessage { cookie, pid }));
+        ListArc::from(msg)
     }
 }
 
diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
index 6e4ca01c941a..1240b558983d 100644
--- a/drivers/android/binder/node/wrapper.rs
+++ b/drivers/android/binder/node/wrapper.rs
@@ -20,10 +20,8 @@ pub(crate) fn new() -> Result<Self> {
     }
 
     pub(super) fn init(self, node: DArc<Node>) -> DLArc<dyn DeliverToRead> {
-        match self.inner.pin_init_with(DTRWrap::new(NodeWrapper { node })) {
-            Ok(initialized) => ListArc::from(initialized) as DLArc<dyn DeliverToRead>,
-            Err(err) => match err {},
-        }
+        let Ok(initialized) = self.inner.pin_init_with(DTRWrap::new(NodeWrapper { node }));
+        ListArc::from(initialized) as DLArc<dyn DeliverToRead>
     }
 }
 
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd93b3..67b07cbf9048 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -892,11 +892,8 @@ pub(crate) fn insert_or_update_handle(
 
         let (info_proc, info_node) = {
             let info_init = NodeRefInfo::new(node_ref, handle, self.into());
-            match info.pin_init_with(info_init) {
-                Ok(info) => ListArc::pair_from_pin_unique(info),
-                // error is infallible
-                Err(err) => match err {},
-            }
+            let Ok(info) = info.pin_init_with(info_init);
+            ListArc::pair_from_pin_unique(info)
         };
 
         // Ensure the process is still alive while we insert a new reference.
@@ -1294,14 +1291,8 @@ pub(crate) fn request_death(
             return Ok(());
         }
 
-        let death = {
-            let death_init = NodeDeath::new(info.node_ref().node.clone(), self.clone(), cookie);
-            match death.pin_init_with(death_init) {
-                Ok(death) => death,
-                // error is infallible
-                Err(err) => match err {},
-            }
-        };
+        let death_init = NodeDeath::new(info.node_ref().node.clone(), self.clone(), cookie);
+        let Ok(death) = death.pin_init_with(death_init);
 
         // Register the death notification.
         {

---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260921-binder_let-d6c7446e0327

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


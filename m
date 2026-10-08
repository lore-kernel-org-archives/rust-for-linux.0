Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A250256A;
	Thu,  8 Oct 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487640; cv=fail; b=d6CTOz9eBsUOI4dQg2m4fMuUiRhmE3vaBjmVyFX5kG2A8+M9iNi8rf3EvO8AeCzT+k+G+zLVk3cXahZY5cEnowfP8DJoyxlAS2osCgFGyRSxLkm+W/MTIvjmGZ7Ha7UEnW5AXNeCtlhjH/RTesP1W+0uiOY2U7ThzAMjLqahzbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487640; c=relaxed/simple;
	bh=BHnEt/BqOzxjzOwdIv+LM+HW4rsBkx6Wh5XxVOSi+UA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QmHTfnv8Te+oq5+cHUTPWjsLjpvMnmjw3mpHJpULFf9ngbhE9u64zGv+x06IR09H1197FZQ9xuJjbrEkkDBG7isuqqCjEeXUkL0nPHVFBiUoego80ftuyu4t001ch64PjGCdzEleyRg1jjmMFOILT+8JtKRJCfU92RbZM8wvmj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fKDm1GB/; arc=fail smtp.client-ip=52.101.100.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fKDm1GB/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANB91JOv68LXUBMolptgmdkv+rfI0sXhj08gazbh2wFqg8LgepmkMzRH1LHkMJS81AUtEZEyx6mPjkMnw/u3XC/vJa63QmDwCzeJaBcjP2b/zBFzirp4BkuyMjSj8cFeeg/CZEqyvUBuM+Ofm5Ka+fQ7l56+6Xq8LlOaEUWLeu1eiN6HrnlnWZ7EZhXzoM0bxMj9W/UKrBIhXU0Dhb6QCfb/JdDtWQHv09WycOL/QE5AfP0t3lR2ESCyQYitggrbQsUaQEs1t3Yf3/qzuRadnVbQ7KJ+CkA1AP1LkbifwL5ApiOz9yH4WmdHu/7yYC9bKeIjszwlPnvgr/KptZEyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JccQ2fpd44ONe2sl28j0b+SnRIs1vKi1uWGTeEG3CbM=;
 b=iKeKBjpSSKPMvyMApSOZ1Bor97MI1UQG8JB94Tz2nko8D94wwhzCpRVFLVChkMTj7HE7d5Xe81ryiXy+ViYCM8AvEtMMAERauIIVwSULlniH9kLgTvrKkqr4VzNxjDYxvgz5dJV0xHQCvVgZgu40Ao/5j2Am2RpnJLlckDNiUyTWFS+pSJZUWk1n07WJ2cmj20K/OXV7uQ/F6t5iaL/7zzQ9f1SrlIfqe2MrSRFdhMz+x5U/lScrazfJeu+bNGvk3GZATgjMF+kBKR0Mn2RMP3dQECGD+eeA/1ZkzS0AHyXR4YyxO0np88jiJd/R7I+8ee+wjbPPUzwkfuVprw/Y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JccQ2fpd44ONe2sl28j0b+SnRIs1vKi1uWGTeEG3CbM=;
 b=fKDm1GB/zfdDS5Ao0wcYQVk9MuEZDfuTdEIa8kJcTQO44yc0YAQ2IFCxNOTF1CLpLyw3fnNE00L9sLFRFyoTtPMQ2MeuDQPCZX0J02hP/nUUl7N3Kc+LYMT1OI7/kmK4iZs0bVhQQBeE9s6az5sS6Xpj+gvX5VmySBhpbses3No=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:46 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:46 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:35 +0100
Subject: [PATCH v2 11/20] rust: pin-init: internal: pin_data: enable
 self-referential support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-11-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=gary@garyguo.net;
 h=from:subject:message-id; bh=BHnEt/BqOzxjzOwdIv+LM+HW4rsBkx6Wh5XxVOSi+UA=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFUwyd/A+depr8S/J2jWbiu3YIhPm5dcsc4pev
 9jtXQB/jEhHKQuDGBeDrJgii0c3Y9omxtmyl7XKX8LMYWUCGcLAxSkAE3F7ysjQMavc5luX5u2G
 +vDOvOaO01vzW+9w5hQZxi01ZDxUVGfP8N9bWrl6S6Pr7mXWsUIp95L2qM+6pJOtYb7z/V6tOUf
 urGYHAPBRRsw=
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: ba88c869-2c73-4221-8de0-08df257217ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	9rYl/rQSwJUH6ig6kvJV2gBur/W+I2Yj1sWbQZPcX1Idgzmhsr4QMahDFOIGFwmW+P3rxQR3of1VK7SP9h3JFcoW7OjMNmOCqLsNaNOq4Gwjd5MMvnJl5xZpbf/ZK3lZngJSrE5WV9pd3gDm4XcvDZJgUzP70jWHe5djDjDQr6tWQ38GQ1XmwqQbVyBJH/yhrAdqBDKnI41xbmkIj7TMzQLR/B5uC5xiJkq7hl/zxoFoN/ZwEVQLLANLdwgrJeMmFTfB3L8REEvxZ6XHtOMWyNFFbZ4NoTsn3nLarT7p9xoZzFpzIFGPhUFbCozwwh/488AM6AJV0xaQi+OXufXg4jSu+bkP6XoRNQ518T2zKEAGiBD79ClaPLD9Yv0M9zbrksMAChMZOQqQisKXq7jk2LYR38/XvEiaPImt/YMhk+rQMTKfnOztns8jCzc2NKQT+cEdppO4iIbTP0/8Rkj9phLWYEifEPs4ndaVnJj+hNj6I/M5JkYQ5wNR8QpjRzxAxWVqOaT2mARjl0q65U61zhbsaeEbVw7BqCv8GWjQnFH+tVl6LUO04rK1BsJVUICPNvhXRNpNw7BUrixJzSEDOySmpeIpOXp05aJ/aUDuZiwW9N9xehjlMjPfhyTmggpmMvGS/UZ+HhzEMujB3wC0Y/d77iloJVe0SmV/OUeww7uvgW6i4k89jtC9pGZWl+hZHc32uzmVwMhoWKffQwDSlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhmby81aWNKV1BTbmUxbHArRG9OQ0pKNTR4bjJrcmlkMVpxYy9SOU5QMXVC?=
 =?utf-8?B?M0FBK0plL3E0RmdGNHN0WWdIOGlORDQyVkxsc3ZZZ1pTang4d25LajhWd2M1?=
 =?utf-8?B?SHZJVDJENEZ0M0I0NE41MEVLTHBIRUNpTUZXd3JqcHVWNEk4WnJtRGJaTHV5?=
 =?utf-8?B?bTlWOVZDek9vbkxkSVRKTS9COURWTGh0Nnl5MnJRM0VFRTRrTllzaTlDNHJJ?=
 =?utf-8?B?bG1EM0tuSVJheFBYN3FLWXdIZ0l4Y0FJcE5qaGE2bFpvc3h5RjhoZUxKd0xG?=
 =?utf-8?B?OEhtY0tqaVpTdmJ5c1c3eGJNR3hTT1kwWEJaampqMzJ5Wkh5OGUrdWlDYWs4?=
 =?utf-8?B?cUY3L0p5NlJaVFBkRmliTFV0M1dMS3dML0NJVFhrYkRFeVlPeGZFSHpEYUxr?=
 =?utf-8?B?T1FaVDUzVmd4dld4ZVF6REVRVzEwUWYwR241eUlwK2pmTUlnZlJyaFB2VUxD?=
 =?utf-8?B?MVlCejkvR1IxZTFHdEVBK2JQSE96UWpucUVyalgrdkhHWEVnNUdGQ1RhYmww?=
 =?utf-8?B?a3dUdTFJcTlvK2dKckNHNDBjZE5hNEVuV0tMeEo2Y2Q5U2ZyOURQQVUrSEtu?=
 =?utf-8?B?NGxGM3FUSXF1a1ltd3dIdXJmQkZ2eGNzb0FtalJJWENoNjhTTFlWZHlSbldu?=
 =?utf-8?B?MXpkanY4UGlkUjUzUU8rV2p1V3VoYm9JY0tBWHdKNWt3Y2crTk0zVExyeGt6?=
 =?utf-8?B?K2NHRGFKOHNlajdWbXNLdytJWTN2RHBkWFozN1d2VERhdlhhbHBuUExVY2FK?=
 =?utf-8?B?WXA5RlZ5TjFpWG0wVGlDWC9MVkhXcHhBV1RwRDViTTY1Z3ZLLy9tZUdEQmlq?=
 =?utf-8?B?MWlCNzAxS05TQ0RaNzlNOUJFd1M3MXpJS290cEJtN1RZYnIzdU1EK3ptVytN?=
 =?utf-8?B?Y0NyRDVpV0NtbDMyMzA3VDA1NnNyQW5IK3R1ZVhSNm5RczNGa1NyalpYOTFz?=
 =?utf-8?B?Y0xsbEFWV3l4R0ZucTQ0S0ZBWU9yWlFYVmFNUkhIU2pWclp5clQ1UWFrUk5R?=
 =?utf-8?B?RVg1M0lFdjNvNG55Um0yRXNnWWlscldJK3ZJUktxUHBDZk1UVDZqRERlVnM3?=
 =?utf-8?B?NERVSHNUTlkxeVJJZ0xTK0dJTFdFK01kOElBR1lRLzNCSnp1bzM0bm1WaGdO?=
 =?utf-8?B?N01OSlFiZmlMckZkWnJTSTdWanZERTl1SURBcjFjNWJMVmxpd0dFVWEwcGhP?=
 =?utf-8?B?Ni9Rdmh4QXVDbWRTaURnRzdQUFVKckI3Nnk3ak42QlljOEFGOG5USUNJUEtV?=
 =?utf-8?B?dzJYMzlPWFhGMWc4ZHJWamVmek9Kakt1a0FuaDJ3akJzUm9OdjUxcDQ0Ujlw?=
 =?utf-8?B?dmxFUFVLc2dWOFFBWXdNSmRPV0EwN25WVHVrRktrTElwYkFZQnVUcEN1Q3FU?=
 =?utf-8?B?QTBkRjFHdmgrTTFEQTZ1QngyQlF3a2xLVW16TkhNdi81T2dtb0pEQyt6QWx6?=
 =?utf-8?B?R0lLUVh4MDJMZTNmWDdoVkQyWVlTRFRGUVJGOFg1VG9UZUJiZHEvaERyaGZ5?=
 =?utf-8?B?QzBxZVY4OTNBTkpWdFAvc2JmVXJaaXZ1VHR3Umtvc3NybEliWkk5YWRsL1NQ?=
 =?utf-8?B?WkFiNy9YT2xCakwvOTVnQ2RGTmNGcElVRmx5dFBJcXM5NW1iMXY4NytoRUU0?=
 =?utf-8?B?WUE3MFBVMTJacFdlczI2bXE3RzcxZGxpN2xhRWlwSyt2MWxVcllSNjJ3UVBv?=
 =?utf-8?B?dmRyanV2S0hEbnNIQmRFWTM4cldFYXJ2V2tkOXpoYTl1WVA5dUFqK2hkWjFL?=
 =?utf-8?B?RkVTb0pxbWtXM2U0aUJ6QlRiZGUwR3l6bHg1aGp0V3RZaTZqK2RVT2JlRkFU?=
 =?utf-8?B?bDgzYi9zUXdXREVpRHlaWWY3cnhHbFR1L0ZMcnNaZXZYTlA1bzBTSFVGK3VZ?=
 =?utf-8?B?OGUyR0JCNDhIZlRjYmpHTDJlZXZsejVEUnY2bi9sdEtiUTJUWllqcGRjNStC?=
 =?utf-8?B?OFVlR2hkQWo5WFdjSk5VVTdpOEc1Tzh6d2lKbHhGb0FnRzJvRGFISHhlZm1U?=
 =?utf-8?B?TkZlbmZBUEYzaUVpdUxzbFU5bHdUbmxRelcrYzhyQTl2bEJxTkgydXhSenhw?=
 =?utf-8?B?YlZBZEgrRnJOUUM0TWlNeXFJNmNXcmdBY3U2VGdPckMvSEltN1c3QmRBdU5q?=
 =?utf-8?B?WXgvOVNzMXRMRXhnYnpHK08xdlFOT1o3YzRPUWFLZ3RPWUtHd0xZMWdPZDBB?=
 =?utf-8?B?SHdBWVZpSUE1NCtNSmxjS2VjbHY4dU5PT25jcmd2T0NuckxXOHBuaXlEWHoz?=
 =?utf-8?B?N2hRVjVCZFJ2RnpVMk5PUVh2QUxEMnJzMGlQM2hIWGdsTmtucFZOWFFCQ1BL?=
 =?utf-8?B?czdUeERJY0g3WjVCVEp6U0h0YlFIRjFTOVFVeTFhaFdtNUVteDFoK1pqQU91?=
 =?utf-8?Q?EExWiSbKx5AYgGVkHQTIoqfg0y6KWO0+dSUbhlmHtf2r/?=
X-MS-Exchange-AntiSpam-MessageData-1: 7RF0meGHxT0i6g==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ba88c869-2c73-4221-8de0-08df257217ab
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:46.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpCi/b6x+bzaK6FipdBK97b/FDBJC8jtR8oeMQdutAdVxQyYsdcmoC57cHMv4CXR8URqXCVtkqgEjdOVP6hzyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Enable self-referential support, and add example and test cases.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/selfref.rs      | 35 ++++++++++++++++++++++++++++++++++
 rust/pin-init/internal/src/pin_data.rs |  7 -------
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/rust/pin-init/examples/selfref.rs b/rust/pin-init/examples/selfref.rs
new file mode 100644
index 000000000000..b5cdf96b6d1c
--- /dev/null
+++ b/rust/pin-init/examples/selfref.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+#![allow(clippy::disallowed_names)]
+
+use pin_init::*;
+
+#[pin_data]
+struct SelfRef {
+    part: &'str str,
+    str: String,
+}
+
+fn use_self_ref() {
+    stack_pin_init!(let foo = pin_init!(SelfRef {
+        str: "hello world".to_owned(),
+        part: &str[..5],
+    }));
+
+    // Access via projection.
+    println!("{}", foo.as_mut().project().part);
+
+    // Access via accessor.
+    println!("{}", foo.part());
+
+    // Access via `with_project`, gives mutable reference.
+    foo.as_mut().with_project(|proj| {
+        *proj.part = &proj.str[5..];
+    });
+
+    println!("{}", foo.part());
+}
+
+fn main() {
+    use_self_ref();
+}
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index d851f13a1099..6b2c0b1f96b5 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -422,13 +422,6 @@ fn expand(
         }
     }
 
-    if info.self_referential {
-        dcx.error(
-            &info.struct_.ident,
-            "self-referential support is not fully implemented",
-        );
-    }
-
     let struct_def = generate_struct_def(&info);
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);

-- 
2.54.0


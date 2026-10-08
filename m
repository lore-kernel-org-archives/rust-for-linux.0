Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022142.outbound.protection.outlook.com [52.101.96.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F249A3AE;
	Thu,  8 Oct 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462287; cv=fail; b=RPIBhpqN1Yny0Qk5Dlcjv18Pqjv5/w8H8SuG63eHHuxuiPi+bp6/Xdz3DDsuwnzx+JxywVJfjQfukrEyTpEot3zEwJg2IvFeIdMwtBg/rAJwa1Z0W4leDTNnOUlMkv07G2nTlA2l/vjzPucx528UXVpRQivP4gGHa8zuhAU0EQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462287; c=relaxed/simple;
	bh=JMVE6Yd2o0ljqrZeIPwBf64C4xHhMlIrPENa77540K4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YDd/3/VgUKnZxP/DE3vpfZy6zCon+4NMybWAJ01v45yhut6ACUddNWE7fGt2qqGOMtFUFMJIv8dZudAtBxRkGHO1yv/k/onMLQHbX36VAdYKlxwyzQJ6wlKrDSnKccwRuyAQ3gZk4mBtEyfnD07g6ZAViaf0t5NXm0sXGD2ElaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gFUOmJN5; arc=fail smtp.client-ip=52.101.96.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gFUOmJN5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ6Meq8gfoyVjvuA/x7OkOIMAyksxs1Ep2gwDEAo/8APHv46dCz6K+jBojLs4HIP/kOJRuArOqX/M4NAKy0EJ9kUKlW8jwvUtpxQPMaLSxuLO/C+ZYmYszogAjz3h60FnD336wPF5pRIz1iUHeGj9nN/u7GFuTN4oFjfxPU5SgpkpmOY50iOULW/9xcu/yKq2deJHiwye7IkoRQpXzpyhYlI/WOLttU6AXF0wu5aUr4WfJTh2GapPWcVfSRGH0fqBUZSHxH7ouKF6ELcJLNcm0HmyYaF3iUWHJ5g5/qCeOffIyqMJGpG1djRcKGTwxyVbaWW8pfchXfnX9q1XPxYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUZpPocnBN/fwzR8v9qoOgfj3IUtmcfd01hkdP/Exr4=;
 b=OB/cyr2BVOII++7ao/H8w9fQRX7uEQdzjQ3uU1KEvPhcKyYQQT7DBCUNfR7Jeeru7bsvtd34Iwdt11iRTr5FBCOyLqgvpnMLXIK9uoUwUqgHZb/JYi6Y2p3Vt2bLjRZ6GzB/8m5mpN3c90fIZyziNV1sr/2SR2bnFZizHZACaGd6SNZ8XpZ42V1gR7C+7zsxJFBQhQDfn5Gx0BA3ZHbMbiY41c6NvEKRM9pdavqejV6GqMXdsdFb8u7isd3loEUbC6q5XTPdqvFEKhfo1VITyr78w6LZQDNPay3lpwTJw8r32h908npW3W1oH1VarlCeoIOgavl+Qj49iNgi1RRi0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUZpPocnBN/fwzR8v9qoOgfj3IUtmcfd01hkdP/Exr4=;
 b=gFUOmJN5q5RFKbjROScuKsXZGAPLqXz0irStIVYeejqnUFt33XZWvW/z0cgqfx2JdSVeq+m6U5gnavJJgirlxPGPCao/LMW73A3dk+ilaluWzI8VfVoHRH+sb1YG3rcdk0Jhu5HBAOkRQokLlGxYMjyCe5ghcqBPkffc39ybx5M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:43 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:43 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:58 +0200
Subject: [PATCH 11/20] rust: pin-init: internal: pin_data: enable
 self-referential support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-11-6c1eb269fe57@garyguo.net>
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877; i=gary@garyguo.net;
 h=from:subject:message-id; bh=JMVE6Yd2o0ljqrZeIPwBf64C4xHhMlIrPENa77540K4=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce70/1CT2zIX318s8P0zDzhSY3XvHqfL+dd/zxq/
 omMeWWvJq7rKGVhEONikBVTZPHoZkzbxDhb9rJW+UuYOaxMIEMYuDgFYCLLnBgZvvLxSi/260h+
 HhJ5SoPrc/EFjYjnSRydkjKZ6k1za1+2MzK0KP6/3tXcafc7MI790R4Wr2Uejf+f9a113SkWMOl
 80CEOAKqTR9E=
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0578.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 17610089-d275-4c53-c41b-08df253721f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|18002099003|22082099003|10067099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	skZCVGGu/mrPWWZ+P/dEPOYijf+OW4En1yQ+MLZJv4K92F5LSGbafRzV7yc+ZdXTH49g8lqAIf7+VTkH1rm3cTm8XU/U36dB3dLQzvTj0z9+B05mv5ZTUnQigXaK7H/jDQLFNpJXQiFN6chA79s/5kqCND/wute1wxoewnOe2S4ifizPzXREMJlYaZpW9gp8jnyXRF0H1RxWDjPGEMRWr8P+gzV+EHDqZ31NhVlQm8ehIndArxCnBBR+yT0AwlrFCC1pWGq/YFdOvLtMyVsHzSmP2+LS0XRcj4HxB31X92BOwtWUfKyAuto/0jXRg8gNpACYJLa55gsbmgIgzJbNzWe/7FgMKxTQr4dGi1uaIgUZk8pdmG2EFjj94b9pqHYlplXIkqg+WLCjRY01MLWYimvohFhfhtJdGQfZ6zpHhWt5BYNTqUVMwJAkTq18U0GiIX8kMT6XsK57/NRUEqsEw4GbXT569VavGKOtGiot3jrY/eiVWb2xwToxCmlZrta6To8yuAJMBXtflvWDxu5s62/m7XodF9JqSnnS4blZQsbHhxut3Gm54Wgr3XtjjJQEWU7Wv2FD9Ysr0Z7psSfDJM1034V35viB6O64j77WmZAu+jVBYO76ewjTr29NILDJQR5v/BAhNu13Ck0c8Y3+QdaDimGBN+3RiunYU4oLyrgTk7XK28Edl342//2Da4tGS5HKiuKKvozFNL8D9FY7pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q21nUzlteFZJbDJLOXdCS0FFK0I5N0svZnQ3ZG0rMHVETFp5QnJ6NVdMRmdX?=
 =?utf-8?B?Yml4cjZWY1Z5bGFaN1NEYlg4ZHRhUmlOQmIzeDJETnJaN0N1dmdFdHJzeWtp?=
 =?utf-8?B?N0ZsYnRVMEpWdEtqNlJKMEUzWU85cGpsSkhLVTJuNHFHK0hucWZpMC8rVE5B?=
 =?utf-8?B?eHA5OTlNZWtVSFBOaGtMbEx5ZlEyY1hOcFVSaGVONVR5cUppdGlDeTFzQW80?=
 =?utf-8?B?RHlZTlUzaTRoMko5bzlFSHhDalk2VnoxOC9YWVp4QmZFOGV0ZGZteDlyS0dp?=
 =?utf-8?B?VlU0QWsxTGJmeGFCb3BydVN4VEtUaEZzMGZJSGQzU1ZmaTFxbUNMYlEvOW9l?=
 =?utf-8?B?c3BwN0wwcjBXUzBYOU5xeE80NS9WSXgyYzZMaTlPL0xzRFdGZkZHODhKMHhv?=
 =?utf-8?B?OVdQeVB4R243MVhCVFN5T0lRNTNkejBrKzNXN3lyeXZUY0RxU0s5RXNIa3V0?=
 =?utf-8?B?YUUycWFubmtSNngwU1QxRERwUjcwbzVGR1FhbUsyWGZEcWEzSHUwTzR5cUJM?=
 =?utf-8?B?eDErZS9IMzA0ajQ1aGJHdDIwYnRZN2MvUnhsTkUrMGFkekpjcENTL2EraURP?=
 =?utf-8?B?Q3lxVFM4Q0FNY0FrNFo1djlaRUMyZTJpOUFtYWxHM2FCU2xyZ0VvVkVRcUw2?=
 =?utf-8?B?Tjh2cjRDVzZqUmJmNDNmTCtTQm42MmV0UnRkWmFXOEpZMDE2YnB2aFhpb0Fa?=
 =?utf-8?B?alFyTzVOYVdXWHJGdUxiMVpBa1kzVDN3Ujh4TmEyNFU5aElvb1cxcXVSNldO?=
 =?utf-8?B?YTlRNDBkbWtWQ2RIVUF2cnZzdTRyckNub0pWaGM0aXV6OFhuY1d0NFB2eUFm?=
 =?utf-8?B?bCswNmQ0SE81U1p5RmQ5QVJlSk9pbTBlZTUweVYyd0FZYm5zT090UENxdnBE?=
 =?utf-8?B?bWlnMEV5dUU4d0FMdTdFL0Y0NVYzaGhYbGhZMldpaFp3bFNzRm5ZVFFYSnB1?=
 =?utf-8?B?WE16OGk3SHNqZjlaZlRsNHRPL2pTY2tDY2sxSWFBOXNOY1VJakRYWjh0WmZ6?=
 =?utf-8?B?dm4wZy9zMEhyRVBLbks2UG04QjZ6cktLckhMMWNUbXpvOGpzRUxYRWtJL3I2?=
 =?utf-8?B?aFN1Nm9yY0w5VUg2RjM0aGVESVlZMzQ2cXE1SzRtemZDWjhLb0J1YzZ5UlVl?=
 =?utf-8?B?ZzRySmZOcnloVSt0T3FoaHdHYk55RGxqODJuNGZuVEc5Yyt4YUkyQjViSTA3?=
 =?utf-8?B?SEdCRzRlUlpEbmE5S3hNTTJrb1ArdXB5aXNjNDVQYUlmUWhwR2ZBNnZScnpR?=
 =?utf-8?B?ZVF1WVNsRVNHQ29NelRBbC94R0ZYZ2N0VzZ6bG40bURnMnBHS1RCUWhMMnVu?=
 =?utf-8?B?Q2VvRWoxa2dmOWRZWXA5MjlWb3d6UitndTY3d21qMmo1bEdjeXM4SGFJNG1y?=
 =?utf-8?B?WnFhcTF4VmJMNVdyQVVCUEd3RFJ5K1dNSE5NV29CbktqWWlKaFVUTitmczZJ?=
 =?utf-8?B?UUlUaG14RGFGVFNoZDdYOUJ0ZWh3VEQ3ZHhrOUhkZGh3MXEvNG1YTGNyNnVE?=
 =?utf-8?B?cUhiNGpnRXY3VjRPOGtCd0ZiRFE5V2oyRWx4ejJscDNpeFV3ZHY5bks1V3V1?=
 =?utf-8?B?bXEzcDdESEJ2TUdveWdxQlRvbm9GUG94QjZyZnBKdGxGUFUzK2M1aWdvYjIx?=
 =?utf-8?B?SUYwWEhKWnVZRjcrMVVMTDlTUjR2NWE3ejFTWW5selM5VVA3eXh3ZE9vVGYv?=
 =?utf-8?B?clhTbVBLYldjQThNeUNNOVJ6YU4ydFpDU1YxcWNnbTFjL1lTRXJBQ0NKMGlW?=
 =?utf-8?B?MzYxOHc4V09md0F5ckdhNU1qM21DU1lmUUJ2bWtnZEs2djFnZ1hhak1EcDkv?=
 =?utf-8?B?Y2dQMWRScnl2d2ltQ3VDR2dQYVhsMXAxaERlM0RTVG8wWllvRXp3L3JOdHJo?=
 =?utf-8?B?SjZGb3JHdDNlUkVZM3gvTE04TWtUQzljbDVucE9QVGkrQldXMGhlL2dtTmtG?=
 =?utf-8?B?U2hOVi9FQ2x4NEVyVGg2b2I2ZUw1TW12TDVmekVTNVhSUE1LblN1WW8wQlYv?=
 =?utf-8?B?NTU4ZXFSN0hKamVnRWJtdDFXSVhyVXRGZnlSVTBiWi85L0FTMDFqai95SFNJ?=
 =?utf-8?B?NENRNWt5cFAyRzVRKzY1N0Uvd0FSZVgxcWJVQ2VmajNkU3FUZ2xjanNuQThn?=
 =?utf-8?B?RkJ2Y2twbnUvS2FlOS82NnZoSFA5R05nbmM2TUVjRkFVU1RrbzE4amNCeDll?=
 =?utf-8?B?WVBRMTh0enJBOWJPUXQzcEIzZGJ5TldSTXllMGpsS3VhSjVGR2YySS9rRjRD?=
 =?utf-8?B?RnR6ekhTbHd6VTZyeVBuKzdCL2tmMzVwVXluQ01tQzBuaWNMcE9SSzd0VXNJ?=
 =?utf-8?B?QmdzV0VwVERtY2pSMkVIN2V0WTNTS0pMMVlQdmFBejB4YUR1TGQ2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 17610089-d275-4c53-c41b-08df253721f7
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:43.3934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIQoJukauq8IuYUBvQ/cnmaO1s/ZlDaTxMkEwRjSvl/4uqsVyk9jRGcwPRqLnho/Mjsd13ymymMnODYjTLVrJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8795

Enable self-referential support, and add an example.

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
index 8e75e1289076..91c27e1aebf3 100644
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


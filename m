Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020128.outbound.protection.outlook.com [52.101.196.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B55043B3C3;
	Fri, 10 Jul 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700479; cv=fail; b=N0dsR2TaGVhD/l50yfX4Fn5HabUGr515mQIxPpsy0uv6Icoqwbl9SA3Py55WfHAAB3M3UpLQWs6zLvuQhzzK2kpzLtogG75/YmvVIwKup9/PbsWMTO+y6eV03UlnP0LIWgXb2lc5KJlPbdtmoPPnMCBMCEz0+3cJe2QIjEhU2rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700479; c=relaxed/simple;
	bh=3Rn3hyITlNecOwJBPLmvi6GejVmwxLu11nqd4lva8tQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r4Vo5QDiMvEgWolI++O8Mqp0RTAEIRgVw6VrrpZ1qmxbWJsuZvcQLhjnlEjekeyTJFTQnec7xCwju3VZi9M6iuBrWlR/EEsse+T84NKBjCbiHkor8sq1j61qxznKXvi+D3YBNqvVIG7ijvNlKV8E5o89ARZvaSwRXm2Cgoo+Z0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=t9P8SrIw; arc=fail smtp.client-ip=52.101.196.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="t9P8SrIw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wh3lcqzjc7rFSPjcScCJMJxUJmCfl0q3HS3IX1eZvuKQ8Jx2nICMCCxXKcRw3iiQOO/dHdJ61/GAkxvFamee4e4NI7ifDzrjv8bYqmd8wPeaJgPK1a9Now99Xxf8uuxMIUneYuVh7A6yN1mZUKxqDPJuhhP8BIA62ClO9Y7zfbzBtk6IcjIe0tJWLVwUe19+e5YccLTYD2ybtob+xdBPbUfS1OmXn6XnCIZLpPsNpHKUz/2jYmBTsfgSofHVL5rK+A35/KfPEzRxGXdrxwcQfJ/fObFP7jpwVHQgnl9eqb9/JvyiUZj0r8DWWm9nP9Cz6yQ8L12rIU7CSy8nB4eodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwYfnELlXPvRs7iqgJavwGJenHEBS0vbhWgOZYmY44E=;
 b=YbYZCSNJVxZHzrgtYxrhpaS7hK+RRHIWZjdWpk7dIxqG0cO6MNBf7lgPj9ZM+yQjg2nRqPfCchg3mfFYW1Jl2rzlMeEc8UH7Jx5OSVkj57JvYpV514JJodV0I5WKba77B0kz+bsk/FJqOcL72VbxCXHnqVvIJeL2SqCntyV6ur6SVXs5SLyp1RHP47xW+LNBOM1W5QR3O6oEKW3a/pTnREwg+5XK/K+Yk/LZ/qATvMMm8qIxsx4nYbOsrBy5R0mwqvduiSwtK6ZXyRrY0N/6FFbyaQU4X6Mc/yPY7smmN2Sm4AxV/VEJXNzR2xv6J4jqM0T1LHijS5P0y/PoLM2weg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwYfnELlXPvRs7iqgJavwGJenHEBS0vbhWgOZYmY44E=;
 b=t9P8SrIwEXcVPHDDiTfpZplRJv9VMi4BOB9vtCb53AGfylh0LFXjctG/HsvZ9Yx8k9LKZ08vv6x0CWoW3TRpMyYOqmTY0P46GzN6rOkkv2TynvtkewbdVmNtqWxQLU6fnGhR154KeXL3fzzDHHuspN6Wtq1ITgcURU1COfWQQD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:50 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:32 +0100
Subject: [PATCH 2/7] rust: pin-init: examples: fix incorrect drop
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-2-8fa16cde87ae@garyguo.net>
References: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
In-Reply-To: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=1541;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=3Rn3hyITlNecOwJBPLmvi6GejVmwxLu11nqd4lva8tQ=;
 b=k5bGg8ZSn/viYpZvtq6kyKcHs94bFiR/KogHQL9ckgsw63SIGEbKc4tWhjRq3qjAnCLTXChI/
 QjajneWyR9HAgDgBXSacuGFCkmmcwHB06Ra6dD7AZpA746H106B2YNF
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 816fccee-6cf6-4fc1-8333-08dede9f34ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HtcZU9sWIEBnCSnM4Ne1qAD3WHEwjqNYbdT/9ycGlc6iWMgl+ECXKBvICtwSrXza3AzENryp3QJZAShvZgc7IyR2QrhCtFAHicxehoSo9dqqSE4kHk/3Z82ZdozxrA955vQu+EZ+B46+dh9X9NvHXkFbNrti8dmVlEG5qpuZ9r5qRYl47M1Do26ehTGOrLDs82C3LC6DZP5jaXOOA4SoSD9Obsn6kwQUpLP+pAM2IrUV0xr4kDRLgUZwERbfdtMmn7Gxyasn6BzpcMgEKwLH7arhX4Pc+1AAwdN9DFFkAeXhSYk+YhdgxZBdbkgTmKI5fTyDCBhiBjUwHckZXgn8DscVO7KvzUK1R1UBouAE2Lrg/V3U+FprAsyDOxJHCJ6Jhyz/9nZLXh2XR0NxspWSGcn/giANO7tu3VI0P1eeXmKZSR09jI4KfhSM/uHoPvtU9wZcKuWE3+eDe95o1w3U+Nj+0wI+rb5MBGR10rQBS14RsYm9Ve5yB04kuEvbXDmR8R8gIJ+qroTIJceOlESEP4RsnT6ZXEWeDOlJjNvafqZ2/urctwcVr6xpNE7CQJ3gIN7ueDEzzasiSW3fBcI3YVHEpc+JNMepCn1/tRF0NVQ0NpwSYePcmsm9UzVZPIPsNLt7hI0AfFT1TD3WF2zuUlWqwBGiGb6s+TryXF6pwgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEU0dGpVRG5UWFdlVzVTQkZMNVNqQW0zQ1NiSGdNZ1haUUVRLzdjbEd1SlNU?=
 =?utf-8?B?dGVQT0hhZzhLNGdpdHo5MlZYaXNuMFRlS1JJWlAzWHRVTmlLTTFTZFNpak9K?=
 =?utf-8?B?a0VjWEF6dG9Bd3lEVmZHRWxkZUZrb1M3S1FuS2dvRTJIWDBLcHBzVkJ1Z3RX?=
 =?utf-8?B?VjZ0WmFjek9jWTBmQ2h6MG9TVGptK0NOUlNpajYvVXlPQlJ4QmdIc1lLNWZa?=
 =?utf-8?B?cC9CZHVoQWFXbzBBMmh1TlZBOTNPYTFXSDl3S3FkSW5GSC9VVVd3MTNQTGtq?=
 =?utf-8?B?Zk1qd2ovUWdUSHRrdnF5RnRiVERwWTdlZmNWaUd6dTBFMUhJWXl0SGJYL1Zi?=
 =?utf-8?B?d2RVWlEwcHJ3TXphU3M5YVhYdFZ2YnhPQklRVDNIcHdFTS84Q2VuczhKYWto?=
 =?utf-8?B?ZlNya3NjQnc0Z00yT09NWGZpd3N1cmZNWks2U1ljY0RkelRKbFRaelN5U2ZG?=
 =?utf-8?B?VVFEcU5zSk5tWWk2N05zbWFuKytmTjNLTWVUbmMydlMvL2drcGc4bEh3TVNw?=
 =?utf-8?B?OXZ0bGJjZUJtbm1hYTJ3dUdnT1ZtNUs4dGRrZjZuZHg0QWNyU1FpSmhIajZ4?=
 =?utf-8?B?K0JVaXBsVTJpTWhQMzd0WVFkZUtVamljVVBJWUt4TklYNS9pR2FjME9oYUQ4?=
 =?utf-8?B?ZVFiT0NNRFBuZmRXbjNZN1hvbmc2L1lJamYwVi9YUmwxR1BBY0FBWlF2RGRj?=
 =?utf-8?B?Y2o5dlppL3c3c0xRUWR5M3l3SjJ6SGptMmNFZ0MySk5uNVdaL2I4S2E5a0Vo?=
 =?utf-8?B?bm9xTFZuQ0NWcEdta0NlaXZEdWZOZlV5ZEZVQ0thU2NnNDJNcTEyME1YMjhO?=
 =?utf-8?B?VlZObFZVbC8yWkcvY0E1Si8rbHRFU1JyYzhxRjFLSHI0dVhVUmtFQ1ZMN0ph?=
 =?utf-8?B?aURHV3FFbHV5eENsbGxCZWY0dUl1MVYvRFJuY2ZzbVlqZmlMckxGYjBtL2I2?=
 =?utf-8?B?eTlTSDZwRzVqV216OWVJNHpxcTRpVG9WOCtOQjBsRysvYWJLaXFkL29oemgx?=
 =?utf-8?B?TWpxQURNL1BmSmVnTWlFUTRnZnc2cjJXZHk1YW92QS9WTEtpaVFwWWk5ZXN4?=
 =?utf-8?B?MkNqWkRHZ3Nra3RPRmgxVTNiNC9jTFoyMnR0cEw3MTlQc0JDa0FmWVAwUHJU?=
 =?utf-8?B?YVZ6VHZIUzU3Mkg0MnBnelovcG9lZVErbmdYMXFPMy8rSnZZWGpLOExCYmdD?=
 =?utf-8?B?VHA4U1ZqTnYzY3ZmN2hzOGVJQTY1SHkwTExKd0hiUE1DaTFZT3RZaE1aQkVa?=
 =?utf-8?B?WXVlNjRrdkdKb0ZIb0l2aVcvKytDNm5GUWtpYldOcnErZWIwN2dIVFN4NUxK?=
 =?utf-8?B?bkZqdDYxZCtnOE9tdW5vL3FUUFpVdWY0TndNclphZFNLUTc5MVFMa3lvVitV?=
 =?utf-8?B?LzMwQVUvcmxXNDU2THhPTDdrbjJra3ptQlk1QUtPQVcvT2pGTXR3Q1hyMUEx?=
 =?utf-8?B?RGV5ZUxxclB3cVJCMXpKa09TMUFNNExUU3JORk8wWEozOTZRWk81R29GWFRP?=
 =?utf-8?B?QjAxNmdIV1VRVGRUVEx6NWl0VzhOK2ludm41MGVKMjBmdVY3SGM2MjNwc2Vh?=
 =?utf-8?B?S3lkZ0YvRFd5RUFvZ2VmOW40VWttRW5yWi82UnJ6TklFR0dOS2xwdGNpWkg1?=
 =?utf-8?B?ZXB1aWF0WUNHM0ZFdlZLS2cwRE1TSFBvLzhSUTF3MVVnakZSU3h1MmVWMHNW?=
 =?utf-8?B?T0QvUjRWcFBmOTczVVdrcXFkSitBVnZzai9OQlVGbXFTalBjQjlUd3lYalA0?=
 =?utf-8?B?aXJ4SjY4d0JQcnNmaHNyQ2tjZjJRczlWZkUvMFZxVEc4eGc4NVhjOW13c2lx?=
 =?utf-8?B?UzU2WWl5ZU95aXBONFJBSEVMOGdONDJpNXptY2VFc1pEY0NUQ0Z3eFM3UmRp?=
 =?utf-8?B?OGtQZkNNQzNoY0hEcVJ1UVJRUDNwcEdEdk8zWGpIK1lGQm5aWUJuUCt5Y2Zz?=
 =?utf-8?B?cXYzeWphMUxON3VCdFlQWkkzY3EyOFBLRDNEUjZFQ0VUelpTQmFwckM1TlVU?=
 =?utf-8?B?Y21Ha2dyTk5BTEhxTjlkcVdDV2grWE8vTlZnd0JYL085YURSRzMrYWl3SHVU?=
 =?utf-8?B?V25IOWNGQ1lvZlpjZ3VEeGU4Sk9rdEppZE9KREVCMkluOVg2ZHNRT3ZXU0JM?=
 =?utf-8?B?ZGJwMmVRVTFvT3RhMUdUblNXSnRuSkJ3QUtwemMyNjVYVGdFRnJVUVNiSTJJ?=
 =?utf-8?B?NkI4QVZuZktXaFQ1VHJBVVFFamRMMm4vUzVCYlBOQm0xS2szdTBYQVdxZFNj?=
 =?utf-8?B?dlYxRDFSRVd2MElQTHdwemd3dDRhRytpMnpSejArZnVhNkZXc3pkbXhzZ3ZL?=
 =?utf-8?B?c3pWVHE4aWVYczcyUGlDdmtrenZwaVY0bVJ6SFMxZEM2M0xLdDlmdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 816fccee-6cf6-4fc1-8333-08dede9f34ed
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:50.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyPhgSOrSsc2r+cPx9rjpjLq+48kLGlSj1LQX6Gpqpj0tDvo6gEoQqQ9WoAUV1/9fGp4YQvoFeKLhkioepItcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

Remove the drop and associated clippy allow. The warning reported by Clippy
here is genuine; the binding created is `Pin<&mut T>` so dropping it does
nothing. `stack_pin_init` created bindings are only dropped at the end of
scope.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/mutex.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index 35ecb5f68dc3..882f3e23f5dd 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -91,7 +91,7 @@ pub fn new(val: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn lock(&self) -> Pin<CMutexGuard<'_, T>> {
         let mut sguard = self.spin_lock.acquire();
         if self.locked.get() {
-            stack_pin_init!(let wait_entry = WaitEntry::insert_new(&self.wait_list));
+            stack_pin_init!(let _wait_entry = WaitEntry::insert_new(&self.wait_list));
             // println!("wait list length: {}", self.wait_list.size());
             while self.locked.get() {
                 drop(sguard);
@@ -99,9 +99,6 @@ pub fn lock(&self) -> Pin<CMutexGuard<'_, T>> {
                 thread::park();
                 sguard = self.spin_lock.acquire();
             }
-            // This does have an effect, as the ListHead inside wait_entry implements Drop!
-            #[expect(clippy::drop_non_drop)]
-            drop(wait_entry);
         }
         self.locked.set(true);
         unsafe {

-- 
2.54.0


Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091833123D;
	Tue,  6 Oct 2026 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300631; cv=fail; b=GHAF6Sxe74YyT1nOs9GtCpE/MnpgtM9jfxQlx2/33tj1F8LD03WZDfDb5XuzP++H3h7wd1LZRm/x1VGuAMHQh8ypbCy2117ThIQCnWbT85Xypg7B0Jxb8mCjHlw+UlYVLVxE0o+RD1hZu4Y23GWzTRglLPzU70X3KxmFp62GzqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300631; c=relaxed/simple;
	bh=CbQ8pbfGT9zOMX5mupalBgOm0OGwbQ4qqriO5AE92Hc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Fv5+TOOK1w3Ie46o6cq1CaWMG10Do5UyXoK14jWsuAgh5aGU1S8cFyjdV2XfwLqOvUrq/Q1++2RMy7cv2i2yA7FHDi60AFWhRvU22UHO9hIP0Wih4vqxLHAJKCodVLNR1qDCeFe7kDDJnwSeIi9EqewT+K197AwEOtNCChZBBGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Wcqxrika; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Wcqxrika"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX8B4tv4XxIEd5NZDTkurYOmQLCIj1RsKU8y97ja/N8OqzzHFlxDI65uN9tXDgSWpNbcYss0DpKMysOBp4G8jemEk/nqLLH3B6qGt3mT6VW4TbrNZYY2l/evKfKdkwu36sgq0pJV+5qeLgPeZvw04agIQ+j6s0kIAgA07RDgSFPrvGZgfW8LVGT1W7ZMmyA2wtwbbHFbhkUz+1/tEp407x0chvdkxuv4i36KzuXCagSqc3cOXgBon0LLJ9Eu5st1RlcQz0/nuaAV24XnZKCmTueESyXdrvqptOm5VM51Ndgj7UJMd6Q0ZPDVXbH0U9RHiSN5MpntC+yqG/vhiNJqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5e72chmQpExU4FXIJUwHwXcMGDbxJ9SJl40gItkso4=;
 b=H2UabWhs9Bkhj0ToRCPMyIiWyYvjNNr/pzY+H4s/BLVfmy8NAGMl4tnXGF2xOZQrEjg+OxMaavHbtsdcCRt7SWIbAwwK9nZGcxBaJUzfRUrEV7c0HvSpfK7TQv3ndeguolpXQ+akqGKvlR0szxIFj9mJSr8dPYgMynZ1U4RDHcyXs4fXVWmqa+n2rZCkDm/iTG8if/jic+Quqe8nc8fg9lyEwGfbZZnKK32Pv0u4CS5kvwym9IxnYbDCBRzKFyn0XhPHps4mk4CB6NHj9jCUZNsOHpOxaoni/DLeOb9PHdNEewdwhs6kH3kOXLY9l5Qo9m+ZUIi+zU67mgtTN0s78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5e72chmQpExU4FXIJUwHwXcMGDbxJ9SJl40gItkso4=;
 b=Wcqxrika3xPAiNy+cZk0Rnex+vy+sEe0X0gcdUxmBx9n5f/nnZMznYaxxLEmA5EkKx47jXWMZd4Flt34U6Y+7IU48FxNpeg011C98obUkKBOSqCR8aognp3GJnawiJkgXp8yJjjid63Fx7ik3Fd8TeVuF+EHEa673qCNQ3l9yck=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:54 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:31 +0200
Subject: [PATCH 1/8] rust: pin-init: internal: init: forget guards in
 reverse order
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-1-da716f740d6d@garyguo.net>
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
In-Reply-To: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=gary@garyguo.net;
 h=from:subject:message-id; bh=CbQ8pbfGT9zOMX5mupalBgOm0OGwbQ4qqriO5AE92Hc=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF397/HLZVI3VG0pauJ1tvG/82M1p1nfWvm/Dje
 tkfPAyfDid0lLIwiHExyIopsnh0M6ZtYpwte1mr/CXMHFYmkCEMXJwCMJGVcQz/k07Obv0Y4HXs
 ivO2qS4M9wQi1e9vdDYJZ/r1feFpIw7m5YwMm5vz30tnl3/o+SDt69CyxixuftqElpciuowW+re
 2rVHkBgALt0fY
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: VI4PEPF00000161.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86e) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1817:EE_
X-MS-Office365-Filtering-Correlation-Id: 1637661f-2a71-4166-4f1e-08df23beaaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003|11062099010|22082099003|6133799003|7136999003;
X-Microsoft-Antispam-Message-Info:
	3VRzBkRPW8vmfskflixzZ2meu1SiQ9Gt+Xn8ZVF/hWHg3QW/n1ekKH6O+6CUR9xhx3nT62b2iDeU/8VIa78LWvs0nhsw4V34t0ZqdzE914bY/ipkBqlZrkUxuNOdcduJ6jGzXfKGi3/kTCJ0cXyVJyGd61Vl0WNhxI/XTLegaWRBOn7zS42GAdwBQGidnMegsZLpEg/CFMyWt0CkvUMSnCdmviAfR0Owwnfd7EIoKLvM1x7ULNwqDplrJyStTa3FIVO7FN7UHPB1aeWSyK3hh6NJ0RbWL+OgsmUZfz9hm3gwTQrW+6LMPt3cpC/vNpbhfEYJWqp43a6wAyQd4v/I0Y0bjgCDin2Hn25mdn5DOzs6tYMjr1be03ZvxmEOFQQvqfW68ZGTgtD1ENooNZlgM/rTS2fD9ZPOD3GxfGicyWyHTX0vPOyQYY8JorO98NzMeHV109IBb2InvUfOC0UQ8g9CTqZ/pokJ53LmzCSIoz/Jpkp/ianKiZ0YYUcek23T2nfh2YlvHtrIOPk+xsPXgaiCWevqBV7M87CZZ7FBzcOSOkMJ2encSfKUs/FgNZTkZX32CkLQZW/xxejFPM27ArJ/vGCGxBSIYFTW7+z+mJfTVc+2a9M+fmZwMqhNmW2sNFYJaFdV7XE7xFstu3h9UgFWOhFLVOTQnHP7OvEwADEN4tpwBBAPXFBRU97LNQlLIzRu7ilI3UYeih2Bxzl2Sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003)(11062099010)(22082099003)(6133799003)(7136999003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1k0enJzanBWbDhON3d3djFLRU40SEZFMk9kUWxnR3U4UmFCNlVGWXRUa0Ji?=
 =?utf-8?B?ZXJSQ1dicmhTNTVaTi9ENTNYdnd5VEVYWWNYZjJRMEsrbkQ3aTErSlkyQjdi?=
 =?utf-8?B?OGNPYTMxZTBUV0ZYb3pBTkxNNzVkQkpMajhQZzVyN3lrUnhqRk1NdURUbEZH?=
 =?utf-8?B?WXhjcDBHNUR3TnFvcnZpZ0Mzb3U5SVJrRENNRHY2bWI2cExxbC9YWjFzSmto?=
 =?utf-8?B?dlYwaXZWNFJBTllWcnNESCtEYjk3QUZZWWJJZkZBTEdqbDVFSG5YNjJNZUVO?=
 =?utf-8?B?a01EYTRkS3R2N1V5YjUyVGdJZjlxZFlOT3YxK2laaW1BeWl3R2tlNjFYVGNW?=
 =?utf-8?B?ZDVFWmVzSVhiWWozWUUrRE5mS0RFSHY2Yk9HQ2NLZFpmejZyRVdDeENPWUsr?=
 =?utf-8?B?ck00RDBDT3VUcVFIUk5VdVJqWlE2L1JnTktpQVZ0dHlRM3c2Q2J3SktrZ3gv?=
 =?utf-8?B?UFhrL25TQ0RVeitQN1ZrbTV2UklaYS9tMTk2UHF1TXpwSWZhSGtxbUVuRzht?=
 =?utf-8?B?bDdSeE9zck1GTzRZZFUyd01mcE1FOWx4NWYzSDc0OHY4eVVzTEV3dDVxK3Za?=
 =?utf-8?B?Y1lqT3VvQW42eUtORStBR2hybEpjMWlZV2djeExHcFdpaHlJV3N3Y0NNd2Zs?=
 =?utf-8?B?SzRuNm14UGtqa0QybkRNK0VFWFdqYWJObXpCTzQ5YmZWdGFPYWFnN3hGUzNG?=
 =?utf-8?B?UEVYcUZVNGhoazlpK0I0OFZsaUN2Y1VLek0xcTJZTE9wTzExc1hobXdVdFA5?=
 =?utf-8?B?WjNuWThaU09NR2ZZTzJ3anZiUU10Mit5cG1ILzVObVYyeFVHekFyQ3lSTENv?=
 =?utf-8?B?ZmEzOExQb21jSzJFZWlld3RpeWFwS0dweUFKSTUwemkrNEF6OTlhbExZWUpP?=
 =?utf-8?B?MG4zaDcvTjcwckhEaVRDcHVxdUg0YlIwdkhJSGJZM2Yyd2cwZXltclBFWG1E?=
 =?utf-8?B?N2tJYkhPWUV3a2F1c21IUndSeW1lL3dzMExkRDVpR3NONzJnVnNPcEpKb2R1?=
 =?utf-8?B?WEFzUHE3Y20vVlZVSWhHZXY3aFpkazBzQUZCSWdZT1Fib3QrbVlaajBRSFN2?=
 =?utf-8?B?MGN6Y2xaZVJVQjdjMTIxVzU3YkUrbTVSeUJzUWl0czVnMWxNNDY5c1FITEJy?=
 =?utf-8?B?ZXhNVFJTb2lEcVFYL2I2R1BSZHlpUkFXMFV1cU92bURidVhHaXNnTGlWMHlM?=
 =?utf-8?B?WE0yeGh6bWplYzIwMVI0ZURTR1Bsb2hOQTBBTUowQXY5dlcxdnNWNWlBM2FC?=
 =?utf-8?B?VTc5QlVRMVphbStwaHFZeFJwQ2hFYjlJMWo0Y0gwZzBpcU9CNnRoM3lFWWQ3?=
 =?utf-8?B?SU1GazY3eVdJL3E1M0xBNTZyZk84Q3Z1ZUtLbE1tVTRDWmZ6bUYxS211VXRs?=
 =?utf-8?B?NThQQWlxeXV5UEQ5Snkwbm5udktsbHR6SWNmTVJQVTJ1bGkrRGFKTHJCbll6?=
 =?utf-8?B?ZTBJY2VybFhrSExXK3MrUUdJcGJyZ3ozcWE5ZnlWanptR3JHQ2ovVWlnTTZp?=
 =?utf-8?B?Z0RSR2dIdjBvaVlrNW1ubElVazErR00zd1l4VVg4bjdwYWV4QVVoeXBCd01R?=
 =?utf-8?B?RWR4Z1l6RXRheXhydnUwWU04OHpxTUlJdXhRd0JiRVJ1SjR5SjZ0UHdFOWN2?=
 =?utf-8?B?L1QzczdOa0wvN0Y2UjA1USszdE5qeCt5ZFZmNE5Na0tpQzZwcHBxK05xTmxr?=
 =?utf-8?B?SXJGdzJ6Rlo5MGRGR2JnYXZSaG83Z0I2dUhyaWQ3TEYvZVcwQ0JCeDNlN1pM?=
 =?utf-8?B?cmVUMGlrUkhodEdhRGNMVXM3TkJVMEhaaEVnVVpmRWlzWXBhMHJDRlBiYmpQ?=
 =?utf-8?B?SkdueDdqYWkwa05DdGZBTGNOb2tjeW13S2IrcE42MGxjVW1xNGdkWEtHc055?=
 =?utf-8?B?ak9odEJOdkcvUkpHbGxQa00xd1lNVE1GT3E4U1VzMVRESmkrWEpqOVR4dVpk?=
 =?utf-8?B?VE9kRnRhRTFzWmdJMWZXc2MwRktrNGlkUksrU0FGYWNUdVY2YXlGMzd5TGlF?=
 =?utf-8?B?d3hJYlpYdE5HN1B3Sy8rcndVTFl0WEJRN1ZLOWx5N1VNeXFCVU9iVTJGV3pn?=
 =?utf-8?B?NFcxdUlJRGFGcURvbHRKdGQyWEplMFhuSDBCMTRNQlIvM3hxdk5KWkdyMXRT?=
 =?utf-8?B?OUtpand0cmdtMCtZeXpRVndhQkUwUVFoQ0ROVlloSWo1c2tKdzFBelBFdWVz?=
 =?utf-8?B?NTVZNEN6YlJnRDFXcWgzMkJUK3djR2QwMGY2aGM2aVQ0Y25uaUlIdi92ZFdW?=
 =?utf-8?B?dUR0NjhiNk9ERHl2clNnU0c1UndBYm5NcVcxd3Q0NEZONi9OQ1dlQnBJUndU?=
 =?utf-8?Q?/bjCtH/OKw3GonRZoy?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1637661f-2a71-4166-4f1e-08df23beaaba
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:52.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf3VvaSo1o35S0pHTluT6LVSo6EUJEnRx+6j7kNA2wKZXjKsUhlJcldExm3FQSQxpgIC+FKBPwJIP6jrki3p9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

Currently, the forget order is the same as initialization order, this is
the wrong way around compared to their drop order when going out-of-scope.
The wrong order will cause borrow checker errors if there are lifetime
dependencies between the guards. This does not matter for now because there
cannot be any lifetime dependency; it would matter for self-referential
borrows.

Reverse the order to be consistent with their out-of-scope drop order.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 6605e04d49df..f0b23d0311ac 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -361,8 +361,7 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 
 /// Generate the code that initializes the fields of the struct using the initializers in `field`.
 fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -> TokenStream {
-    let mut guards = vec![];
-    let mut guard_attrs = vec![];
+    let mut forget_guards = vec![];
     let mut res = TokenStream::new();
     for InitializerField { attrs, kind } in fields {
         let cfgs = {
@@ -474,17 +473,19 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
             #binding
         });
 
-        guards.push(guard);
-        guard_attrs.push(cfgs);
+        forget_guards.push(quote_spanned! { span =>
+            #(#cfgs)*
+            ::core::mem::forget(#guard);
+        });
     }
+
+    forget_guards.reverse();
+
     quote! {
         #res
         // If execution reaches this point, all fields have been initialized. Therefore we can now
         // dismiss the guards by forgetting them.
-        #(
-            #(#guard_attrs)*
-            ::core::mem::forget(#guards);
-        )*
+        #(#forget_guards)*
     }
 }
 

-- 
2.54.0


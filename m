Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F352843C;
	Wed, 23 Sep 2026 18:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187645; cv=fail; b=Gc906zm/W2drEVdhHGjwdB808exRlWxdILiHhBZCXCSeYUSdXzfm3KMJwCStJIXlcduzPFv/aDNZnP9rDsWPL9V5Fo/KNi9OOMkPxfbYShFlvSb4AxU4+/fb9gfS+nrc6hzXEOO3sDflaR8K/op0bLH4f/P10ry9EsX4/iKFzIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187645; c=relaxed/simple;
	bh=1eqZ/uzyj9yR0UoLHnh94cgdinYYXFKUD/IDj+Jr8aw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FM+rhOGjcR2xF6fzoYiALEbxhx6LyFJh5SMITs9fw5AuvMeQ3j6WN9FX8roxAsO3jMxHmtuVw3/d400gvtrsAim2FDYxI+ohyjSL03DT7Nwuny3UjyRWbYc8ljn8XowaO8+KDx+7kiMLGXOWDE7o6zpKpSjVr9lAQL6dtWlstKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jpSg05op; arc=fail smtp.client-ip=52.101.195.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jpSg05op"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugh613cld6Duz5JX4GC+9DvVX3im8Gh4rvsqyrMXY8OU3CGZlF6ksf4HxrmNJ/ABUbOZpQe+AUuHesCmlK1FgMGgU4UhkbG7G+P/O/O8gnkLgeM0e6olNJ07lq2IRgzRAZPUX8FpdiWl+KLXdZ6zYL5HJQ0ahF+zKvidtfkrKpcMKyjH51j54y7HlwHtbZjPPQJXJphtySCG3yc64KkJeRMeK17dWGWwXJsQljz6pS7eHTRMo6ssfhfbhl+xkTjfPXS/OKIK0SWO7QcKAbCe7Dj3Oxnk7xfBgx7EBJQvO/r9XpN/F7w4q/myKol8epcLU8TLVtArIfbLk4mGFAL9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFjkXdbz7cWLH2DZn8Wtm4fgN347oeNWgMTjWS11cAo=;
 b=WdquYgiGwNOrLJC4yA6w+tWjRG53Q+HNo4xdr6F+gg170ax0tny3U1d7Ze0CCO0LD0PqoeDv5n18bF9PEdGiBg9eGpdqWBfYABGJ5k+fAadnljkrTiFq4q4MOjViq58shFxfx7S5TkKOLxGtmxlTXAsSp3sdvaqXiqlgNWGyHLt9zJugm7tLAE9Hd758pbiGCb/IiJ0mJ8tGCJeZeVJkd1tgkx2jp5YmSwHyostWLPDBxp9FIPwrkcM5IDNhruXM6zkpl4B+vAb0X5FPVrxPcTkVGed+8KTahict6mg8DV2Ft2am64ioI9oogO0d4W7qwDuBgLrQ/I6rph0C93PAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFjkXdbz7cWLH2DZn8Wtm4fgN347oeNWgMTjWS11cAo=;
 b=jpSg05opWD6FWs+OWACT0HIqU9NjJz06+z9a0xjqAvnDg5y6l2AuIAX2WAnBixilfE1708YjqLAZAqOXCAEWf1G11cS0LwJjMnxuur9jprSCqsugDiIKzqgEXW2kvdoUA9aJPBlgUXQ5/1RDHlWUUW5FZxRku0pwQaghRYkDuQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 18:20:32 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:20:32 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 23 Sep 2026 19:20:15 +0100
Subject: [PATCH 2/5] rust: pin-init: internal: remove associated type of
 `HasInitData`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dev-pin-data-diag-v1-2-e4d7193569e5@garyguo.net>
References: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
In-Reply-To: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790187630; l=2455;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=1eqZ/uzyj9yR0UoLHnh94cgdinYYXFKUD/IDj+Jr8aw=;
 b=tFvgB+13/HJ0ZOeTMTd24ULjGYQVQkOIikFT1OpHUhA8ZirZnt5T5axEqEPZoPo+LXuA8Np0T
 ZgC9n2DxwSsBv3l60+v4qi2CjVnqcWXNgbh16ELFQXNMXwwAqyWQbPH
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: cb68b2cc-fda6-4a40-7ff9-08df199f5a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|6133799003|18002099003|22082099003|921020|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	u1qdgq5S6WtH+Q+PnKMfI5bLe2wt7+H7E48NeBqOYjQPfTvZphP7r3j7Wxu6cszVs6wjtU7TxJ8T5A+3gXj3ZTH8yL0cHzyI/kRKGf23wrFybo2UnhiZHfqS37bkCB6uqFOd2K+NjjmAQazuy+NuindhR7p0CDjP//+iPSoTW+/VPMMT5I3rGevYtVuKjLtMSe+YoC+hRQvoMTJ5xM1sUpdjXCo3uiUCb7D01s1i1EintzHpgukQpT9/sKusmYpB3FupkgOXZaj1Xj/61ZEw96DEDUYPJ5NoAfKH32851PK9NwB7GG90kMcPFYDOlMhRUeZykC2Vq5YQ83KoKkLmPxGdyJRXV/1qtGulPEXw4/RPvsUS5Pb/Jbi2kOBktItkhBTP50xMo0YNoa3rJtgml1M+z1IIAWwQW0HcGzvAtVp9pBxQdzdwslmgMpqNItT0nVQhmV+vA5OmYQkt1D2utkTUc/VM5jq/1AQwPbhzuoWl93LIQvccy/CE4nqSOmnRMogzQIB+63wIoJ1w+fi+gTVIzCuqbLqm+AIOyiR2cVw42PgmsC1ZGkrT0L/NZt85WYuA9+BXLnectiJHH3LAYH0G7h6RjuDiWQRf/LJDNX3MKK5NcdOsdH4f5aKY8qK5Fv3Jfv+pPxyUMfNstf7pR+0iNCAFPI7HHY//TqKh6XD39uHdcitNAwIJbz/anCpDHU2ayh9MfsojNav7Z7SEgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVEwclhZYXBqT2JwWDlCK0hVNmpveUtpY3RIUk1hdVAwekE1bU9WSWo5V3ND?=
 =?utf-8?B?NEphTzJ5Njl0ZFpabTVZRUVGeG02Z05kRnV2ZnU0c29vVEMxbkc1a0trTXQy?=
 =?utf-8?B?Q3JpTGUzanFmM0VUcUdRbytsS0pVQzRiTmMxYi9qN2tLcXNvWFpOcTBiSm9h?=
 =?utf-8?B?TWlWSmlkSzFPVUpFK25memxDVXRvdmdISjlqUHZCSVJ0dUdUMUFqbjY5US9H?=
 =?utf-8?B?ZEUzRUxzam4zVFU0alhQNFBwL1lrMDU5Y0xQcU1uOGpFVStYZmpaN3J1YjNI?=
 =?utf-8?B?YnBWMy9PL0NIODJVUzFGaGd5L2QzVnhPSCsvcG1mUlFXekhaYW9IT0VyS0Y2?=
 =?utf-8?B?YlRpVDZXaG1iMmY3NGJ3c2ZYUEZodVNwMmU1OTAwTXB3UDFJdXZOTG9Mb2Za?=
 =?utf-8?B?Vmc5c2U0U0pOQzJpYkRYSVZSdlpidVpOQ2NITWhFRUoxM1B5UmF3cmQ5RVVO?=
 =?utf-8?B?STJGeHplVzc3eVNqZVo5a1IxV20zZFNJMUlRQng2cVF2cVlkdVdNSGw2N2pB?=
 =?utf-8?B?ODhRYUlJQ3lJeFhLd1ExVlgxNVAzUXJVUlVKZW96WlpyS1A3WGk3cVMzSGpu?=
 =?utf-8?B?cnVibmk3RTh3ZlJxa0VBVnNkeFRZSFRQTEdIL05hbnlkOEJlWXIwYlpYUjli?=
 =?utf-8?B?TmZNZ0ZNVG5HM2l4TDNVZldicDMrOXBrcXJPWjk5Vit4QVJGcE1KaHNJRTFn?=
 =?utf-8?B?dFdFcnZrV1pYcVF0MmxmQXRDaE1GT21TM0ViUUFZUFJQbC9GZnZHaC9KM0Nm?=
 =?utf-8?B?VzVnSjcvZVJLd0FrTmlnVVpXRTU4amZ4eUVXZEtiRWMrUlNEQkIyNHRqR25a?=
 =?utf-8?B?S3pWeURkcUxRb3VUVFdpK0FhN2hPZEk4cXlsSk16MU5jcFcxdFZQd3ozdWFU?=
 =?utf-8?B?eUc5TFNPeGhxcjdXRnVvWXg4UnVteXRJSkNncWxZdUNlN0YrbU1ZMEoycjl2?=
 =?utf-8?B?OXlnUlR1Q3BlQS9zZEZBRlJ5YmlZKzJIak1YZmRNZFFlcFZMRDZBZEZuUWdn?=
 =?utf-8?B?ZXFQSGFDcFFXTEhqWDRjRzdNOVlOT2Jmc3ZBM1JETkZjd0p3MTlQRERsTUJH?=
 =?utf-8?B?L3crQjJZcy9hekgzbGxRMUV5ZEUwVFlDWXFLQmxIU3FTWFowU2wvOGZ3NFJy?=
 =?utf-8?B?eEZhL2ExMDhVREhEYkhYSUJDeVlKQXpqWUU0b3RKK09YMmhVMURiWnF5U0sz?=
 =?utf-8?B?NXBrS2lPaG91bUNoTFhjZEVtQk90N2pRYlBiZTFSNm84a2tITExaMm1GcVVy?=
 =?utf-8?B?RlBnUWgwZFJnNnEzcTVJdXhJRU5QeFIwMitYZ1ZuaUtiUExyT1JrOGpNUVJ1?=
 =?utf-8?B?WnV4OWN3UEZSOVBQNXB1L3pkamZjQUlRWi9OZmw1UGYxMlZHMDhYTGJZUlZ6?=
 =?utf-8?B?UnF1RVpxamRXN1QyK2FCMVpiSExsMEx5d0xIUFAyeFVlRXZ5NUVvWTIyNjV5?=
 =?utf-8?B?RGZrKzFEUE40UUJDaGFCMEc4NE4wRUU1MjBaUWJJWnR2ZHNDcVFCKzhra1pO?=
 =?utf-8?B?b1JQdTBhRnFldEQzcFBjZXNYSXRhZ1JWVmxJaWIvY0ZkMy8wQ2NkcXp2c3BJ?=
 =?utf-8?B?T2VlR0h0VWdaUVFndjVpdHFQcm9QdHBCK3RvaDBNUzJPZERVeXhxZ1luTXBN?=
 =?utf-8?B?R2VKT3BWbjZ5cjBxckJiWWVvNmZRa2Vhd1dCekN2dkphY3UzZGFSVEFEZSsx?=
 =?utf-8?B?eHNNcEFRaWt4YUo0YU15L2FzMklBWFVBVG9JNU5vSGlQN0xMMWRvaFhOblBq?=
 =?utf-8?B?V3dycHVmenB0MFNjOUtGRVdOSDZOelNUaEI4c1lZc0hEWlFUTWFDdExDUzRQ?=
 =?utf-8?B?dEZZVDVmc2RWV0Iyc0FqdkdxenJHbzYrcGdRQ0xRNkdNVGh1ckJYbGl2ZjZu?=
 =?utf-8?B?SHlwUTRNbkliUFVsbDVwK0J1K0lYcW5KMVl5SEdIb2pISElPUEt4Y21CZWN2?=
 =?utf-8?B?enlwL25wcnZ1ZzJMZjA3cENCTmVRalNoWTNUanFvak4zbHNnMTVzcTJKa00v?=
 =?utf-8?B?b1lTU3YzNjNoK2txUHJOTlo3cC9OSzYzL1FMYm9pYVdwQlNvRDFDTlhxU0tP?=
 =?utf-8?B?UjFld1Rlam5DRXU1VFQzakRSZGFUVU9hTVI5WmZPRUNrYW0reGJ1dE9JMDlO?=
 =?utf-8?B?bnpPZzdjYitwR0F0M01OOTAxemF5STlJU01WWFFhN3dCS0hneWx3cjJxSUtI?=
 =?utf-8?B?NVMyTU92UTdtUWd5T0taN2NEWFY5TnpxUU44WXo2akpTdStFNXRyWmpEbmEy?=
 =?utf-8?B?SHdwTzRNT2RMN0JRTmF6QjlvUk0reHRtUDkvNit1S3U3VU0yeTNMK25YZlB1?=
 =?utf-8?B?QjE0ZVRyU1RNUzUyWGdrK01YM0lVRlFYSVV4aEpCUXo3Q28vVzJYQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cb68b2cc-fda6-4a40-7ff9-08df199f5a28
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:20:31.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbbBwnaUfqIw1x4pRO+xXaUA0aZpJGpTj36tPWnPcKXvUyJwBXgEAdiO93mj9bhz9TNtRAzAumH9+A/V/ACBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6301

There is only a single implementation, the associated type is not
necessary. Remove it, and rename `AllData` to `InitData` to be a more
meaningful name.

The single implementation also means that "unsafe" is redundant, so remove
it as well.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/__internal.rs | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 51f6b40daa9e..15eca4869bc3 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -89,30 +89,31 @@ pub unsafe trait HasPinData {
     fn __pin_data() -> Self::PinData;
 }
 
-/// This trait is automatically implemented for every type. It aims to provide the same type
-/// inference help as `HasPinData`.
+/// This trait is automatically implemented for every type.
 ///
-/// # Safety
-///
-/// Only the `init` module is allowed to use this trait.
-pub unsafe trait HasInitData {
-    type InitData;
-
-    fn __init_data() -> Self::InitData;
+/// It aims to provide type inference help; `PATH::__init_data()` is would be able to retrieve an
+/// instance of `InitData<PATH<Generics>>` without having to mention the generics explicitly.
+pub trait HasInitData {
+    #[inline]
+    fn __init_data() -> InitData<Self> {
+        InitData(PhantomInvariant::new())
+    }
 }
 
-pub struct AllData<T: ?Sized>(PhantomInvariant<T>);
+impl<T: ?Sized> HasInitData for T {}
+
+pub struct InitData<T: ?Sized>(PhantomInvariant<T>);
 
-impl<T: ?Sized> Clone for AllData<T> {
+impl<T: ?Sized> Clone for InitData<T> {
     #[inline]
     fn clone(&self) -> Self {
         *self
     }
 }
 
-impl<T: ?Sized> Copy for AllData<T> {}
+impl<T: ?Sized> Copy for InitData<T> {}
 
-impl<T: ?Sized> AllData<T> {
+impl<T: ?Sized> InitData<T> {
     /// Type inference helper function.
     #[inline(always)]
     pub fn __make_closure<F, E>(self, f: F) -> F
@@ -123,16 +124,6 @@ pub fn __make_closure<F, E>(self, f: F) -> F
     }
 }
 
-// SAFETY: TODO.
-unsafe impl<T: ?Sized> HasInitData for T {
-    type InitData = AllData<T>;
-
-    #[inline]
-    fn __init_data() -> Self::InitData {
-        AllData(PhantomInvariant::new())
-    }
-}
-
 /// Stack initializer helper type. Use [`stack_pin_init`] instead of this primitive.
 ///
 /// # Invariants

-- 
2.54.0


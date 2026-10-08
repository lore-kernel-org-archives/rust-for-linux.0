Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F504379C37;
	Thu,  8 Oct 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462274; cv=fail; b=OSbGz7ZMp75WmH5uLg+wGEgW1+gRDUuS650K1abOKQNhl5caua5cD+Hyo2/xYgvTW/5gO/TmJeCuq1bcDrKNYcz4RibAPszEZaOYVD+MogTYV8gKsVmZ/qKGCc7lJSSHnepYtjneuAVGz2Nb8Q2ydVqOtXsumThGrCL/C8h/748=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462274; c=relaxed/simple;
	bh=47gBHe/ipR1CjED86HmW9Sugj3NerWAu+z6sNxK/kBc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RQnHMbUVwjhpRh4jAcbLE6x+HO6A/410DmjmCqJOJy5HJ+VdCuI5l4C7rtd2T0mGuys/HcRjbqZVudd+wJ3SCSTq480F9faXSM2mFhMhr4aw552o4dMmuW+W3MbreU3j2KTHpHaYEyexccx/BgurU/M5F87UJ9h3GHL549KROrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=E8BdZijW; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="E8BdZijW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Da5U0qELdcCBUXAz2r/DkZO45RKxfJFEymqWeVGHN38foOHACrwTtCtM8JVUCEDDtCj7dR9qzoB46xvsgXK8hST8J2mHMqIjXDN2mY9Sg0OV6Pl8FQdlyki8H6ICEV3grUy9Z4vj0pbEbmR/zbiKsSa87FwdEH3Anbv+5lmZAWyuRUxBMiOGDCeLQ92p20uX0TIXTT1GvW0RFLw7ayFCvdaRFS4GY0pZI/Ukuv+9NRuyxcyUmtpdXN8dm28/fg3xEcj7yHxefTcAU//p8Fj6L0KbKqtbKhj37C2a6lQHavAxD5boR8NmSx70LvMIx3gehjgC1E3GG+BGljLzluhSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QaVTshEkn/Tq++lWspoIYTDzBPdGvVpJYbZbRNv7w4=;
 b=Q6S2WGosl8y7aKWixQxgNBL7m4FEBBcsxVncO2+jdf2t4X3JzkidUF2xEEQMUWQLGUyr2BMzjL+ACw3Z04as+GDO1GbegotTy8yx1IDeYv4SNotJm0muX0R2inMFgWumels+JQsOKtZw+Cu6n82ze0G/9qP9yAlCfZLL0SgRTedFMDXPZfJ1i9XBUyDS7Og9mflsmr03BPVNmp+ssfNJgcfIMWoWx6sLxMCf427DPR0J1qQZQwUqSKS3+Zr7Th+WIIQKh7LvbaPNlbfaHJi//xkotHvxFQGY/hE5+uUs4CTVeb/70wV4xUNDSoOKmPOarchvT7md/dE/yx4+NMlZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QaVTshEkn/Tq++lWspoIYTDzBPdGvVpJYbZbRNv7w4=;
 b=E8BdZijWiFPlHJ4Si45Xz44PG6O/GEAU7nBynQP8tohqInBWSbHmmiO+WRde4hGHXOD0UwAhzR395yn2ZHGZd1Fgh/QA+aMYvF6unLj4rPf6CZ/h1o0h1/Y3AhRh0hHax3vPLA4ymD59l20534hbOlDKEo5f4aB2elEblIQ9zfM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:24 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:24 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:52 +0200
Subject: [PATCH 05/20] rust: pin-init: internal: pin_data: teach drop check
 about generics that cannot dangle
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-5-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3241; i=gary@garyguo.net;
 h=from:subject:message-id; bh=47gBHe/ipR1CjED86HmW9Sugj3NerWAu+z6sNxK/kBc=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce700ordR5+cLjmfvHl9S/PFiSGdjMmJ+ufsjPvC
 1LguRn/YkVHKQuDGBeDrJgii0c3Y9omxtmyl7XKX8LMYWUCGcLAxSkAE0mSZWSY4CU+pfTUxdMx
 OvaNNfH8T17+qZ4ssk3G+FOhZWzXO4ejjAzPzhrHbnjD5/lUYabpjc0vZOeW6DKvLF0kn/qMr0T
 tLjMHAGkoRnQ=
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad260e5-9cdd-43ba-32b1-08df253716a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|5023799004|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fSeNjj+9mwDF+sGtjXr1watpaHRl88QUa4f5di5FsfUgO+teVsfyRKALNQHz+XjhkqTHy0G4kJlGU2IGgoJGrawXB8sVkwxxcjl3t8vnqm81jO6KTVjZVNbkhGy1H31IixmuZMyzhmisfsY10/g3Qi+qvfJ+BKM/F+/lrDNTkQuUiLcXDoZGIJ4sLQ9rSOBTH9uFbELFITUWj6edq3SWYvJ7Qu5MYKi71LldXDmYsdyE0iPbGQ6RjrU4AYJ6MqJ3bM7sKqE8oo6NynnGdjVk91+fO0eCS58GqKWJeuu8gRK825QpfnCiuh9EG4HBX3iuJdFQw5PjHMpXiMdsR4SVnQ6tpYnAXU9Kn8+a2NsdivUF8R5/m0lYJ3IIXDGeaTpThJ9PrJ7pXZ9OdWjbfz9zdKs/ml0v9+ZQbpQu/SeRVpXfpGGEmEFJcX/+9Zy67Ttyhb0rvNa7Ylw4mF2cFyCU8GjI8wAVnUw3zkCHBr9rE8wUju5pcH0U/j35DNNjcUOg+J+QFk0Z6O2vd5nImVsfYTErkCLIHADmHJza2APyZZfCRSWKUYXbJyQiRzg1BioTMZlAUlrSPEAvkUMMQtPqwc+1uvDZkIZfqa7RAwYd7cLvfKt6v1hnLanayYF7OxZUFmvx6b7u8vDPmVqAyiFQWr//dCNrg5BuKYrxNkuQZxYnli+u1UYGrUW++1dbKsbWJxT+QwHvqCZ57W8Ydtw9Nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(5023799004)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alUrUDU1R3ExcVdVb3ZyRjE1K1dXSWd6V0REOUR0Z1d1QkRWanRhSjRIS3h1?=
 =?utf-8?B?VG5jeEJJUEZDdDc1bWxtYjQ5Y2RkUDRZYmF3djVvRi82YklCQzh4Yit2ZGZI?=
 =?utf-8?B?T2ZnOEMvaHhGMEV1dzZFWFlXMTRaMnIwUWNQdGN0d3NvRU1LVmFzUUtoWWpZ?=
 =?utf-8?B?SC9WZEQ0Ymd5YysrRnZ2dlBkRHRDMm82bGJTdHNjcnJ6dllIZ0RiYlRCaU9w?=
 =?utf-8?B?cmJOekk2azhsOUphR25MT2VpcGFKdEdOTGFGQUZQa1RreFZJeWpnRFBSNi9D?=
 =?utf-8?B?a0tJOW0vazhXbDFQbnRxTTdNL3ZGclhyOTJMSlNQZFkwWlREMDZrTHpnKzV0?=
 =?utf-8?B?QktsWWZqRjJJdEZWWUdsZUxIWWNmd0RjWU9rUkpKemQzR1V5OUowc3U1aGM2?=
 =?utf-8?B?SWVRZ3V2Y3gwRHZIckFLR3c1SWdMVElyNVJQa3I3bUZoNmhoY3RHR2JsUHI2?=
 =?utf-8?B?a0h5Rk9vV0ZxUDFqSHlBVUowdkszK0RNalJxRFJpWkF1bGltRXUvSWdSVVpL?=
 =?utf-8?B?ZjJ5MGUwZ2cvOTNsMEhVZE0zQm5jL1lhZVhlWktodFkzODJycERsdndUNTU1?=
 =?utf-8?B?UU5kUVhqTTQyemZTSGZwaWdtMm5ySzNCMnZkY2FBd01CVk81QjBjNVQxNGIv?=
 =?utf-8?B?d254YjBRWlhUQkNPZlNCSTBsOE5CY08yMUpNVnZLblpLQ0gyWnN4MGMyWE40?=
 =?utf-8?B?eXZwSEJSVThnSjdxbzZwa0UxbXZYU0ZhVnV5MStwb29PMUQxVW9taGozTURS?=
 =?utf-8?B?UkNxK1RrcUFBMFJNcm9EYmkzd2FmQ2pUWjBnMlN6VzAzRGNEZ2JDR3E1eG9r?=
 =?utf-8?B?b1EzNjFNam4yLzFKQVhTd1dHazJzWDJOT2FDUENKeEUwU3pScVplcVZpRjVs?=
 =?utf-8?B?dllnMHh1bGJGZ3lPeGNSai9aaVhneWJzcTRNcGRjZkd4cE55OCtwOTNLYnBv?=
 =?utf-8?B?NDkzZk1WNEdnTExHT2ptcjVBUS8zUG5iQnBRVVVCTnhPMTNOWVpnMUVLNE9J?=
 =?utf-8?B?NTZkS2Nsa2toUjlieGVmQ2dCeEFxYkxmWjJIdkl0N0ZaNU9IY1hzNkw2cVkw?=
 =?utf-8?B?ZGZJNjBCWkE0ZUZuZUY3UVRMeHJGSXZRQlIrQ2paaTliWnErcGdFZjB2MHhU?=
 =?utf-8?B?NE1sanUwM0hDeGJmUmx0NEN1SFlMeVdGQzV0NWhNL2l4bjlVeURNWEhyTDlV?=
 =?utf-8?B?TzV5U1VaUXN2andRbFpDNWxtOVpiRkNVdUtNWmUxLzBxaXVkd1BBV0c4bWFV?=
 =?utf-8?B?R2o2QWt3K2N5SDdTbHV5cThZUnJvQXFORUh5NU1QRzVKYkZLNFoyVGo4UXVx?=
 =?utf-8?B?QzVhWnBsL3FXL3h0SDVDL0VkUVlJU2d6SDJoQmlhR0pDRXg3T0M2a09tRFVt?=
 =?utf-8?B?dnR4eXJab0p5MkFvRW0vdjZiR2ZtSTlQQlNVR1pxVTBxeG01LzUrWVN1eTVX?=
 =?utf-8?B?WURQQmZOdEpjRFFnMG9HTzF0OEpkdmFtUHJPcnp5cHNORVJCU0duQkRtZUVR?=
 =?utf-8?B?WGlnRzFrMTgralE4S3RHOFp5cWhIL083bzBhYmk4Y3hXZ0pLL0NBcWNsRnBj?=
 =?utf-8?B?aGpMV3lRbFlDN0FvaE40VGpQUUNSU0dMU1NTbHpCMU1TM1lHeHdabC9jempn?=
 =?utf-8?B?TFovK0EyRTNaV3hoWWIzeFVTcXBxeVl3UU1hMW1xS0xuRkEyU2x1Z2ZzTU9F?=
 =?utf-8?B?T0pCekdZbENKc1hDblR6OW5JU21CRXEwNThySFNXb3JCR2lXK2VXbUlwMSsz?=
 =?utf-8?B?ck9Tdm9EZXZiTDhPN01lcVloTi9xbUlEM1dPSmUyOHR0RXJEVExwQWdkZzN1?=
 =?utf-8?B?ZnRkNzlZZjlvaDRoZ2dmUFhoU01IZUJ0cHFKN0ZaSDlwRDd2SUNEaDZpT2RD?=
 =?utf-8?B?b0RJTlNBK2NpK2d1WTFFZk5YeFppZVZnTHNaS25aUWp2QTFacDk2Q3RmVnUy?=
 =?utf-8?B?ZkxIWVM1YzA1MU5jZllPS0ZOUTQxcUMzODdMQnNXYTR0WXJneVlOUFNBUE1t?=
 =?utf-8?B?UXYvays3dDlLSmJEclhSQ2N3K0ltNTB6OGhGVXN4aFFyUkE0bkI3RUEyYTEr?=
 =?utf-8?B?bGJmZGJvTTRveldhUDA4SzZGc0hjeDJza3hYaFVvSTRTaDMydGdheWRZOUU3?=
 =?utf-8?B?M0ZISnlLRkpZS0FrZVJjRUxGRGtrWjBnK2JIYmxtQlJjYmtNZWJNZ0FNRWhN?=
 =?utf-8?B?WWpTdTFPUmRXTmRCaEsxN3Rsb0VJV21ZajdJSXZ3Rjh5Ti9EWjk0dGYvY1FZ?=
 =?utf-8?B?WER4YjhlZ3VQSzlCREtSUU5Ga0k3ZGhIV284NGdCRk0rUUx4MC84bU1tdjBU?=
 =?utf-8?B?RGxYcGtkK0kvekpLWjU3TFRMMHlER0djaEdKY29BaVRnd1FwOE01QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad260e5-9cdd-43ba-32b1-08df253716a2
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:24.3625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCAPx3UdbUsMC96ithsxtpBkPHJr9EanE3JhC8+ZwFdWp8PLliQHoN4dAJsYl8SnPhGUy8kEXGmq0t9zFkJPdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

Lifetimes not needed by drop glue are considered by Rust's drop check to be
considered `#[may_dangle]`. In case for a self-referential struct, we may
have fields which need lifetime of borrowed fields in their drop glue, so
compiler's automatic check is insufficient.

Code like this:

    #[pin_data]
    struct SelfRef<'a> {
        borrow: PrintOnDrop<&'owner str>,
        owner: &'a str,
    }

may access `owner` during the drop, however Rust will determine that since
`'a` only is used in `owner`, the `'a` lifetime may dangle during drop.

This is undesirable for pin-init self references, because `&'a str` could
be coerced to `&'owner str` and this could further coerce if there're
implied outlives, e.g. `&'earlier_field &'owner ()` would allow `&'owner
str` to further coerce to `&'earlier_field`.

Thus, if any self-referential field require field lifetime access in `Drop`
impl, we would need to ensure that the all generic parameters visible by
self-referential fields would strictly outlive the struct. And this can be
done by a simple `Drop` impl that does nothing. Without a dropck eye patch,
presence of `Drop` impl, albeit empty, tells the drop check that the strict
outlive relation is needed.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/__internal.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index c0a57101da61..276b14a02d17 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -473,6 +473,35 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
 #[repr(transparent)]
 pub struct Borrowed<T: ?Sized>(PhantomPinned, T);
 
+// Lifetimes not needed by drop glue are considered by Rust's drop check to be considered
+// `#[may_dangle]`. In case for a self-referential struct, we may have fields which need lifetime of
+// borrowed fields in their drop glue, so compiler's automatic check is insufficient.
+//
+// Code like this:
+// ```
+// #[pin_data]
+// struct SelfRef<'a> {
+//     borrow: PrintOnDrop<&'owner str>,
+//     owner: &'a str,
+// }
+// ```
+// may access `owner` during the drop, however Rust will determine that since `'a` only is used in
+// `owner`, the `'a` lifetime may dangle during drop.
+//
+// This is undesirable for pin-init self references, because `&'a str` could be coerecd to
+// `&'owner str` and this could further coerce if there're implied outlives, e.g.
+// `&'earlier_field &'owner ()` would allow `&'owner str` to further coerce to `&'earlier_field`.
+//
+// Thus, if any self-referential field require field lifetime access in `Drop` impl, we would need
+// to ensure that the all generic parameters visible by self-referential fields would strictly
+// outlive the struct. And this can be done by a simple `Drop` impl that does nothing. Without a
+// dropck eye patch, presence of `Drop` impl, albeit empty, tells the drop check that the strict
+// outlive relation is needed.
+impl<T: ?Sized> Drop for Borrowed<T> {
+    #[inline(always)]
+    fn drop(&mut self) {}
+}
+
 impl<T: ?Sized> Deref for Borrowed<T> {
     type Target = T;
 

-- 
2.54.0


Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27844D021;
	Tue, 28 Apr 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381878; cv=fail; b=Gv11eVOVUHkYtynLhpZGdOaF3+t4eKWQIPzZ8lZPQ+Y5B5dwczcqn/NRrmTb22Lt98VfXSZR2Ua5EP9lbwys2UCWaRaAcvjlBWh+BNxf4XnKYeh5fIa7G9k5U1fulyk9soi09TrcXBG/RfRa/SwkvINpib+D5Nf/xr727Ol7UdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381878; c=relaxed/simple;
	bh=X7s5IGZwVPubS9XdPvDS01po0y/JfhuQn7Vwn/LzFaA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yk/En21dHyx7WS1LyQkg5oK4EGfzjOW8Akg+T1s/Htbd2A8scO05EFgSMqjL3U3egB5KIlvnL/4gPANWhBkj1RwgmYM3lNijbG30SM08BVD9DHnZP89S8tpmG2vAm9VvG9Si5TtEhs9J+FcPRSzUHPYmxc0Gn26xUJqS0/McEnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n1L9i1PJ; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n1L9i1PJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+KOAWSUUZ5894gepTdL55FM3DwE8hjpfuGLu2gGXSvwXg2Q9yczxvTSxRB/WINlqq1ngepzw6B3qwlGPauEJ2Fh/yaeragvKu9hjwPBcEJZVzDEa8M+Rlq8htYbhUYWUmsJcyT1H38fmtytv4W56V9DCxQCZNqLDKsh/kilDoFIGsLN/9x+ERVtBlgizH6Zpk283I7idu9SiQFxFRVl3jIiMk5XFuq0fLpLp+6xIXBH7HFHrGYQSQSzkZuv+4aI1cjXnnRnJhtrC0ySPeID1eP5LV2LGsMw7CM9+sY3Qi9nxXzgnSqlbfVhsVUwq5d9epwHuKEy/wfTPbE51ZKE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUBc7rG8NDQxBp9o5dYWsOrkII6D852QEAURiyJxBds=;
 b=r/aTUjJnaFHx0tBS3jJrOswUKs03n7q7R8vdM2BVx4PMUKIV9Ou511oAwpoCSnEVRdURMT6Iv0GW4RQtWIYRnJIAujdIGyjR6zR2VBbu2CBCuBndTCLKdQc8eacLLf2GweMAsSjsEn67Meb/QlX3raIeZo4tHoQEBo2jRgTd5iMHgJ3BB5vWiwIcj+b+Yu59BAaXq7tVDdt3I4RcQPjLMT7FuAt6LR7s/lHiq+99CvO94NnohChQccjx5InOHwPipAb3JKJIGgvNmF/XjQ0IOzrMByqba4cxxm9dF+y/f37exxPX9we9Wy954tPk2VQFofklBooc3mS6AtITnyK7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUBc7rG8NDQxBp9o5dYWsOrkII6D852QEAURiyJxBds=;
 b=n1L9i1PJ3mac8bbYA876tDWqgnhUckUrWjxhkJUOI7T4tF2AsQc3EsvHDHJM2aHTMdR2QzVPSE4gVQcWu/80xuYe6OkWYyTNUm+Wbq+YzXRb36ijaSvck3MVw9JGfPml9ogLzRguvItlBBbS/FNeBlWN4KxB3uxB7s4nMEzxTTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:11 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:52 +0100
Subject: [PATCH 03/10] rust: pin-init: cleanup `Zeroable` and
 `ZeroableOptions`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-3-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=4219;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=zMvjejozGCqR15/HWhaVUL+67lojabvLLHBJEUmA99g=;
 b=DvsSN/pDOV3bYF+TJKBKdVDozrdWdK/iL4mGheSW8QnzAMN108+r6b15UyAC2plToFyyrmzqr
 GvUpOBBRjmVByp25Gw220rAisBebv8YJupBtcwqEKyoQ978BiaUBoQi
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
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 90036bb3-1e13-4332-6a6e-08dea5279e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NlNQfEEyKDdN0JTgOZzYJTwB36l9oRqrk8s7pM8OxBbcizx5BOLtjJuYoZWKwgVgtEXttR5yUwxJoxi4mjmaHpjDvedNWbthSZrenWTkP+78X87L4taN4o3eZgDHNOK73NmYhCefGoORiLTtvfEM2yP56avtWYPlMLuERIDPNCVo+ANtjSZZJ5FNlyL5/6l4EM6de8VbYm3X0MdbEPt4hkC1t7ewIM08Jo5pcZpYJOuHdX4G41N4QQkaPWCmfGK/oAo3h59QX+VEGDdapbrVFeRRrCwzM7Kj5X/wWYIh8DGnXdJoXvOlOEvDxgG1DZlxysk+L3YDnWqPbPqP6OC+zyniBweiOHzxJvVvBIPeVUC8vRf5232rqDxZJT8bsy5Y53VFpMeLWLjMRQylRPwP8IT9PK7hEODjlOAr4pfi5m6LUYIm9c48p9Cw1+8kIQ65dr+MK4GtDmfQYqrWKJx2McaE+FMBS1EGOHI040a8vB4hdhqJ0xJv6hXCVA8OAQ6FjZQ1o86iDcPHe+QW3sw74lrNwjwH7/UR19AFGz1FV13vb9fK3WSsRUkoivSpGyzRem+x/Y27DgJzzLqjwASBGRXH5uHHUXoiaFYd27V9mszAXKH0/MgDoRZcR0ijq07A3svfXgFGVqiJCV8P+h7O+4/oXsQYjk6LumyArpZW7UjXtv7Fmkratj36EpFiKllc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0p0YUR3K3ZycDFhYmhWWWZVU0FLRDduL3Ftcm91UCtXWFF2dUFwWFN5QkU1?=
 =?utf-8?B?RkdnTWNPQWFvekdYYlJIK0VhOGhYWXR2bzA3S3B3d2tWQjF5YXdUVWxucmxo?=
 =?utf-8?B?L3pGeWJNM25naUgvQ25mVFUzV0ZqbU96aXBmVjV0eTBlWk13aUxJWnIvRGhk?=
 =?utf-8?B?RHF2Ri9KeG53ejF6cWVuTVdVakMzenJnTkZJWnRFZUcvbC9UQUJDYzJnU1dr?=
 =?utf-8?B?cmNOZnBNbXBvTk1mMHdjWWNKR2dZTWhLa1FpM0NCMENSUnRvdlFRbUNDeW5U?=
 =?utf-8?B?d05yeG1zdi9HWmx1dStNcHZaVWY5ZzZUOVFraHo3M2poMUx2R0FobktDeEJM?=
 =?utf-8?B?dFpRdit5dnpWNWMvZ1IxeGFuMEM3UjE0Yko5WVZtbjVTL1NPMkptNW91ZmFH?=
 =?utf-8?B?QWpPVkR0VzV2QjY5WldBcTNYWUtFYUZhSkEvNEFmbW96TmhJVzJYa1VmczVt?=
 =?utf-8?B?K0RlUUdsZm56dEZKNnBua2dxMitlYmFVU3U4UDh6dTk5UVdFZFhuamJFY3h1?=
 =?utf-8?B?M3gxM0FabzZCc3pTaHNsTG9oQll4REJrNko0Vmd4cjNGQXBqRDhuREl6cVFV?=
 =?utf-8?B?ZitGck54ajh3NGppRm5VVi8xYllJN0dWMUNLQk9Da0RzUlFhTXJwV0xGcFFj?=
 =?utf-8?B?Wkt0NWpCQklDcHZoYUNxRm9ubkU1ZDBUREo1ejJUWnpRYlhobGljR09FOXcr?=
 =?utf-8?B?bzBXU3JuUCtLckJkM0grNnQzOWhTMTJXaU9HMFc4R1lGRGNhd0E3SjdKRmdo?=
 =?utf-8?B?K2hUeWZxTHVUbm9MeUFnaHRUMUhOTWUzSGY5VktDc0tDempJUWtTRkFsSWFi?=
 =?utf-8?B?TkpPaHIzVHA4dkQreHZlbXVjZlhHZGZZUDg0QU81ZXYyWDFqL2Ewd3F4ZzlW?=
 =?utf-8?B?R2l0NE1mclB0SEgzbk9VMUc1cWticVhHRXdqVXhqWC82Ry9rcHV3V3ZBcTlY?=
 =?utf-8?B?UjJERmJBbWZKOUYyK2JTcDVjUlNzT3V4cGNVZnFhaDJsVUpKRTRUS0tWYmJT?=
 =?utf-8?B?R2VPcStldDhBMEF2cll5c3FMK1VYaXhGK3VaUldpSHZKdll4eGY4QkVDRDZ4?=
 =?utf-8?B?d1BRM3ZmSDdpYmdmT052cG92TjdJK1R3Q2ZtOHExRDlaZGFKbWZZd3dXeFJX?=
 =?utf-8?B?VXRWbGFrY1JOeWhoa0ZlYW5LbjRWdXRBQ0Iyb0k2Q3BOd0YyUXFjWjlhb3Ir?=
 =?utf-8?B?aGY5ckgyYTQydzkyaWhIN3FCZ3dZbW1kRnFhNHd2ckZZMzJ4a0d4Nlo5Zkhz?=
 =?utf-8?B?YTFBVjFxVUlDWXc0SXBydFlDSGZsRTFQUGpHajlseTU2ZUwyZDlsYlZOc1Fu?=
 =?utf-8?B?aUdEdmFOQ242b3l2YWs0VWlRZDF0RllEQWRyWHdKdWpQWmQyR3RTVjBZbFA4?=
 =?utf-8?B?NlZxek9ZVmZ2NXJYWFVTNDc4Qlp1cnlqd1p6NTc5OWZGT2Q2SzNBOTFvem01?=
 =?utf-8?B?RW1mbGdEdVE3QXBMMHJOZzNTZGhwVW9XNE03RXdtYjFwcTZrZWpwbDBhRG5D?=
 =?utf-8?B?dU82MlNJMGtjNXcrTWdxTkF1eE9rSEpPUHhsNEtYR2dsbmZ2NmI1N0gxYU52?=
 =?utf-8?B?YXNqL3pIL1hBR1B5azMySXRNYWN0bVlFV1hFYjgrbDB3LzkxZ0dXZmFFelNU?=
 =?utf-8?B?MDB6K3VxQ1dUSndBT3l1c0prRit1R0NoZUsrTWxDQjUyWjU4b2FOS3ExTFdm?=
 =?utf-8?B?M0dFaElJTWUvM2lZcEI4NEJCZnhvYjBLbGpTcGtBcVRNWFJRMVR3QlNVRDBq?=
 =?utf-8?B?TnlLcVVFdmVmK3JtK0ErcU5OOGNmbndWV0ZicEhVMVVxb3NtczZ4ZXBYQTZz?=
 =?utf-8?B?aHlwOHJEb3FpdVNOWFZUVytJVm5IeG04bm16S0ltaHpvMy91SHNUNVpyNXRq?=
 =?utf-8?B?UXJjMzFtYzdYTHVobTlpWHZSUnBqNFBmbTJndlRTa2lzVDc3TksvUWkwQlB1?=
 =?utf-8?B?NlExTFVwcEZ1dTRTbHZrWmZYd0hZK29RZ0pBbWJhNzI2a3hCUC9jMWJQeHFx?=
 =?utf-8?B?cmlMMTUrWUdwd0JZSENCd1hsTk1QQmNHcEF6ZDZMYUN5RnpKNFVDRko2TjRX?=
 =?utf-8?B?SnFlMW9yYjNrVGtUY0VFYnZRa0NjSEQ1UGpXam8yNkRUc2VnaU0wZ0J6NFVs?=
 =?utf-8?B?bmJzWWlsK2hTbXVUbjRnSXR0SVdjSEhVR2xmWWo0cUdkd2YvRHA3cjZBa0dl?=
 =?utf-8?B?cld4eENRakJ6dXpNY0NWR0dyaXdwRElubGFPZVk4L25aVHBZNWN2VEdqajdk?=
 =?utf-8?B?dVdHcGxIMlR2dE9TajU1QTFIUDJLYnZGeFYya1NzV1NHZ0VaNjdmcStabWdo?=
 =?utf-8?B?OUlMYlN1OStxNFNRUkRkZDFQcUJndEwwMUJCWEFrWnlEZ3NlTXpDQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 90036bb3-1e13-4332-6a6e-08dea5279e3b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:11.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uaz9MpEjmmKmMq0XWWSCyYkctLxGQVh/49G73k+m7XDgIR4yEocvmtaLbADbY7XC4g+2DPqO6xSvQwWMjuoO8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

From: Mohamad Alsadhan <mo@sdhn.cc>

Place definitions and implementations (incl. macro invocations) of
the `Zeroable` trait first in the relevant section of `src/lib.rs`,
followed by the ZeroableOption trait and its implementations.

Rename `impl_non_zero_int_zeroable_option` to `impl_zeroable_option`
for consistency.

This commit should not introduce any functional changes.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 4f50994bd268..e34c9bdb88c3 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1517,27 +1517,6 @@ fn zeroed() -> Self
     }
 }
 
-/// Marker trait for types that allow `Option<Self>` to be set to all zeroes in order to write
-/// `None` to that location.
-///
-/// # Safety
-///
-/// The implementer needs to ensure that `unsafe impl Zeroable for Option<Self> {}` is sound.
-pub unsafe trait ZeroableOption {}
-
-// SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
-unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
-
-// SAFETY: `Option<&T>` is part of the option layout optimization guarantee:
-// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
-unsafe impl<T> ZeroableOption for &T {}
-// SAFETY: `Option<&mut T>` is part of the option layout optimization guarantee:
-// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
-unsafe impl<T> ZeroableOption for &mut T {}
-// SAFETY: `Option<NonNull<T>>` is part of the option layout optimization guarantee:
-// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
-unsafe impl<T> ZeroableOption for NonNull<T> {}
-
 /// Create an initializer for a zeroed `T`.
 ///
 /// The returned initializer will write `0x00` to every byte of the given `slot`.
@@ -1643,6 +1622,27 @@ unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*)
 
 impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
 
+/// Marker trait for types that allow `Option<Self>` to be set to all zeroes in order to write
+/// `None` to that location.
+///
+/// # Safety
+///
+/// The implementer needs to ensure that `unsafe impl Zeroable for Option<Self> {}` is sound.
+pub unsafe trait ZeroableOption {}
+
+// SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
+unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
+
+// SAFETY: `Option<&T>` is part of the option layout optimization guarantee:
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+unsafe impl<T> ZeroableOption for &T {}
+// SAFETY: `Option<&mut T>` is part of the option layout optimization guarantee:
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+unsafe impl<T> ZeroableOption for &mut T {}
+// SAFETY: `Option<NonNull<T>>` is part of the option layout optimization guarantee:
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+unsafe impl<T> ZeroableOption for NonNull<T> {}
+
 macro_rules! impl_fn_zeroable_option {
     ([$($abi:literal),* $(,)?] $args:tt) => {
         $(impl_fn_zeroable_option!({extern $abi} $args);)*
@@ -1668,14 +1668,14 @@ unsafe impl<$ret, $($rest),*> ZeroableOption for $($prefix)* fn($($rest),*) -> $
 
 impl_fn_zeroable_option!(["Rust", "C"] { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U });
 
-macro_rules! impl_non_zero_int_zeroable_option {
+macro_rules! impl_zeroable_option {
     ($($int:ty),* $(,)?) => {
         // SAFETY: Safety comment written in the macro invocation.
         $(unsafe impl ZeroableOption for $int {})*
     };
 }
 
-impl_non_zero_int_zeroable_option! {
+impl_zeroable_option! {
     // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
     // <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
     NonZeroU8, NonZeroU16, NonZeroU32, NonZeroU64, NonZeroU128, NonZeroUsize,

-- 
2.51.2


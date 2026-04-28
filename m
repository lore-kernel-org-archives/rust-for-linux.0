Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766144D030;
	Tue, 28 Apr 2026 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381881; cv=fail; b=ERGD0gbG7Y4BHH8MB9WB6LGahXhoh2/FbHKKR6DeAFlFF5yt15YENHPAULuW0M2KH/W3bJdanooIFwsPx5sVlYMFTVpV/NzgcFGajeJt8MNEWJjDGFo5BbEJv64Z/JDuSk5f6ETRFt5YQ9OTf39npQEJDZe28fiKrNPBX0ZLuyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381881; c=relaxed/simple;
	bh=fOGUrFUoV/pJhB9fE43g1EubGAKr/Au4WH8Xff+iatM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GF8x0vPYcQ23N8ySC4ygPmafaIq33xJTAg3JZv7NFRsCLTiSS9l8FYwsXwC9xkO+yN3eUB5F5G9OLBGbaayscJhZfLGv4BU5d1RnSYms/zP+ITtF7GnTLxXqjUp2EjZxbbrUxdiAhlaExmhiaJ0wZU1GENXgSjQ0sftD6Lvf2LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WKM00G4x; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WKM00G4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9+ILR00UnxtF9SfGE7PX+LkP0zKNlWdjaLV7jNLyynQX6tckyDNK/3bjiYjKtqm2J5wIYXcZPMjv8Tu6rNTeZlsUQE5MwfxSCyo8ObsWfFsoMOZkUcUQ8fbXjaNT0i8Fv1JQcTrW3fi9isvDZqbehNUsC/9KreEuAJgoLxCI0P+xvqghrpHznsoisjQY5k4yetR7yNcsqPqkKeR8m/mg5OeWLTpekHIRhF6TftB2eZxEX/yfFF7g+HFQR6/I50iKGt4MiLfA1YB0w9j5qJqoFwjMsV+s0mi40/ZK1tp4rfiL/4CT2bDbgkXqC+ZP6nR3fbugDDkTqvbiRCWZEHRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWHjwwpSDeLPW0++tFnQ7RUvxjZIJqfWpSNrXbQP4XI=;
 b=k6udFVRB5158+dkeDIaNb1KK8c2IHwMREMned3joe8L8Fw5edUnQG9lG2mnTjsbfIRwrlZ6GrXqOwJBppaNsLVAsxtEQt2Dq3P5/UNMeyi/awJI5HYNdEctJU/vxD+pDYAKax+kMAitghwVYIW1yEjs0AZpSRJsePVAmbv3SfkfRE2jQ4zvhvoVeY49emJZ3X06t36AGPlIMIQDsvI0sLjoTQOFShVD0Mw5J0PhfPQXzPrWZQTyjzMzNB71vjANxDFhVGmt5CfsNPmaRAp7i9bybTQRLV5sqta+nblVUUU4TrBSRPDn1Xh8jMUVmEUMfRkgzmh1zkGoHsNXBK65TUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWHjwwpSDeLPW0++tFnQ7RUvxjZIJqfWpSNrXbQP4XI=;
 b=WKM00G4xD7W7wM+Dwp9PMgVXTYdvXvdW86ymkDS+Yiy3Spm9QF0ucfhtbMUnrKwqRcrPWz7eZXG5t72ZM/D0Ux4dPu9f3c4oVsNfYLrSjts2XQgqQ41F0xSdsLRafAqePY3QNd6WkVsQVmwIAul5xD8QIqkzhhKyJGK/pctJ+Og=
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
Date: Tue, 28 Apr 2026 14:10:54 +0100
Subject: [PATCH 05/10] rust: pin-init: internal: add missing where clause
 to projection types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-5-07f9bd3859fb@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=1444;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=Vxn6Plag0MjP9feEb+R+/Syy1UU0qvmFxeZ8wVhCAN0=;
 b=YBMrA4RKv9i+MqNyGymZ2Rw6rUM4S52QymTilNa8CsDfj1e3DGyPuXcHRLhMD3keTfT0MVamG
 8NFwmSJXFOBBqVf7SfOnnRL5C5+CoUPml54oOJz78S6ZcSWyOGyPK9N
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
X-MS-Office365-Filtering-Correlation-Id: ee2e2ec5-4ca1-418d-f5c3-08dea5279ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2d7xpj+IjWcXs3Y8xLfHZDphqVwwd/Xu9VspEt3jLf3+eVqegBxxStSS4IF7OCI7htNpBj0wQsg15bQgSh9qiYlN0kJeNFd5eLQ5bPceipGudOcFWASRbGsepoNZRQi1+Po9MrASGM6s9w5e2ZYnk+V3MvjFWJKsXVB9QwMgmcgHAMQfqMKnJcYL4FphAFtWN6gYIgrF0saryl6McJKTcHkqmM6YItImeUL9UaQq1HMsEXTYe0gnCIUt4a11STGFm5UAJ7aD3JQPi+T1nGXSr4WxiUf0SHvjkyVa5dwl9lzALYc5oseAhbO7bYiJ0hcIJjUcdi2rFw/NtaU9ESNmwFE/fpzYT4CTlPcivd4D8t2Y3uQYObzzWrd674U5gDIsTqpp97rs7wYLnAZMi6dM92yLCG1zS0H4RhjN58iIQgiijgAP6VBKv9JpXd5/6CLRZmfG7Dv4gV8ekYs2w/Kpd9NmggB9nkAG+/0RgYOLpsBA2+RnLBii4nCvJ81FxC341f8LDIgqqp9UR77jJ6EPVn/inS9R7WjZlH3LtWbl+uoAQX6YBzuO9qfNGv1wStkiTBw2nfmkyverxeDiHV3g1iL0LLgW/SwZUGfYnRm8Th7ln0URQoa18ekb9a4Clx3N1H/Ecwh56Fylt0NgZvg6LiDQfArQYF624gfj7mN16i4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEN3NXA5cXJvUGd1RHdCSVdHMXVtaXJvSkQzM2U5L0JKM0p6QmRmakMrWWEx?=
 =?utf-8?B?VHVaWCttaTVBcXZ0Sk9GbVF3OFo4cVJiOW5yVEkySEk3Y2ZZUUZoSk9LaVFK?=
 =?utf-8?B?RWRiMWFMeVdNb3lZempRcWc2aFVBL1BacmhSYmtrd0plSW5KTk5WMC9rdkJD?=
 =?utf-8?B?V2ZxbTNsMmZMQU9zSGdwLzZvODVIaXNtczA4TmdHVGhoMHBsTkVMcTdBWS9P?=
 =?utf-8?B?WlNYMXBCSVFxNTNsOURRdi9NaTFKNHA4aW1oTXJmWUNsaU9QdURlazB4cUQv?=
 =?utf-8?B?NUZMdlUvRUNqQjRSOThuK2xqbHR5d3p4cnBBOGZuVHNHdXNlY0hTdjB1ekdX?=
 =?utf-8?B?YjllZWJldE11dnhsaHh2ZnN1M21kYllGNFF2aEVhU2VqejkvYkdOYThQRTJG?=
 =?utf-8?B?NUJUSkxRZWcydUR3UXJKaWtQYzAvcS8xOUpEN01qOXFTdjk5cGVaQTQwUHlP?=
 =?utf-8?B?TDh1RUdaUmFrOTJVamo3dHg4MSs2M2o5Uzc4N3QwSnFXL1g2KzBZMGRyTzYr?=
 =?utf-8?B?UFBRMGc3UEg1b3hVMTMrYzJ1TGJqNW1zN01tUk9weUZ6c3BZSmp4dEpjeldO?=
 =?utf-8?B?a1JLT1ovRmZNM05wTXcvRFVGa2wyZHYwL2tnUHFoeUxaYTAxUmxWb25EYnY4?=
 =?utf-8?B?MDNmc0lpaGhDR2ZtM1NFZ0tzV05KQlVIRDNIOVQ3Q1F2UlFlbHhYRFB1T2lq?=
 =?utf-8?B?VjF3cmNITVF2bzBjYzAvKytKUHg2a0lKdnRiU1JTMHEvenFhWlNWUUF1My9a?=
 =?utf-8?B?YWM1UUF5Ym40dEFSQ2dwL0NDUytucmtEak9RUEt3VXg0UzdIQW1FaGhJYlpa?=
 =?utf-8?B?TTVqU05SNTl6S0NkUzhvUTRwUUpDY0xBRVI4R1RwNlF0YXF3WnhwdVNoUHZ2?=
 =?utf-8?B?SklzTjcvV2V3UVNXOVRFUW16SUxvK3RtMlFML0Z0T01GMUd0dnhYZjFtNVNO?=
 =?utf-8?B?aVBOUjduem1VeGhBZGhpSzQxMVIyVmpuRS9rWU1YdVZLaDZjaFgyYjRLeDVL?=
 =?utf-8?B?ZERaUnlwbVBpUkxyNWY5OGh4OUdvakVJM2lRTGI5TGRaZUpuVkRUS1lNdTJV?=
 =?utf-8?B?SE41TTQxYkJLcFQ0elRBWkEyRlN6M0s5SCt4cDl3R0pUUy9BTzBDaEVZZVVI?=
 =?utf-8?B?L2ZCK3RyeXRhNzMrblkvSk9lTFZpaGorRWMxWjJmWHB2a3pVdi9RbGIwUmND?=
 =?utf-8?B?UE11UXBQblc4bjAwenlCU0tHUGNvTVlQZjFYRjhBV0NQeDZxcllYR2dYYUdX?=
 =?utf-8?B?RnNIYWNmSTZBYUVsVEg5bmJ3bzRpT1hROXVwOTVjNjJxclV3Sm5rQWF3N29i?=
 =?utf-8?B?UmhrSGpCT1FnK2ZOZEdQWmJyTXROWkpNOTBaUE91cldjMDBsbEhPSDdSRWg4?=
 =?utf-8?B?aDd1TUpPZXFUclJDTmpOelpUZGludjFNQVE0QWlkMGlBVmtNUmQza2Q2dWdN?=
 =?utf-8?B?YnQyc0lwcmZiUFJaaG1kZ0lwdXc0SnVwcFhDU3lIZzBwRkM5MDZGeUwrS3pw?=
 =?utf-8?B?NlBEYkxRUVEyU3MvN0VpQXZaS2lnbnpkMHZJZ1pRdGtRT1FLbWNJbFp2dklH?=
 =?utf-8?B?VEs5c2wvbHJYUkFLZ2wrdzlGT1poaFI5ZGFLbWozcVZHVWo4M3ZpWWhIKytn?=
 =?utf-8?B?d3NLME9nODhNV0RBejY2TnNBK3JnOTZwb3l6SGdxcG1HbXdoc1pwNkxuL3hm?=
 =?utf-8?B?ZVpTdHJDSWozR3NKQ0RuNWN5ekt0UlBQdFRBMzZ3Uk1ZUXlPNGd1K3lQN3hD?=
 =?utf-8?B?TUdraFdid2EyWkVkZUJ1bC9sTS9yMEk3STNBWWl0V2lzQjNTOGNnNzJ3T0Mx?=
 =?utf-8?B?VHdvUFByVzhiZmo3R1MxWDJIdzM3MHY2Q2ZRcWN2TldtTXhLZ2g5bkRRRUF1?=
 =?utf-8?B?cDhFMkI4Qi8zRlhGL2VKeXBOZitUS0svRWxqMzVLU0JaMlFFMTk0aXV4U0Vo?=
 =?utf-8?B?TU54a3dDcStSRVlnYXpWT2gzMUpzZXlZT3hIblU4bk12blFoVGxkd0kxQkVC?=
 =?utf-8?B?ckNmMFlhNVlEa04wcmg3OEhSOS9DTkM2QW5hU3pwN3d1ZGFvZTFUc2oxaXRI?=
 =?utf-8?B?cEJKbXNrVGozQnFIM3A1OFZqYVZ2U29WU3F2RjgzdlBaSlFGam5HWjhSSHNO?=
 =?utf-8?B?MzJ4bDJCTFBwaHl2VDY5QVlyckNOZnBUN2lOdjVZSU1zWWNQSkpuekpJNWFy?=
 =?utf-8?B?bzRuTzBYY0lyVjBMczA5dDF5c1pqcXlCdjU1U3R3L3d0Nm90dk5xcHZSb0FF?=
 =?utf-8?B?azFvazhBMFBqQnFDb3FJQ3hPRWtnN0RsMjBwZTRKclp6em93K2UzWkIwOUN6?=
 =?utf-8?B?ZGJnVFkzZ2h3VllVUHBaSmpjZzFZamNDWFU5MGpwajI0Rmw4K09sdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2e2ec5-4ca1-418d-f5c3-08dea5279ea3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:11.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9O+t0c5srOBG2CU1rM7vCu75+SlRMRTkZ92VblTDzlFN9wC4Ti0j1CfwAhyPkB3guaXELiVXemcM1tD1ZaRrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

From: Mohamad Alsadhan <mo@sdhn.cc>

`#[pin_data]` failed to propagate the struct's `where` clause to the
generated projection struct. As a result, bounds written in a `where`
clause could be dropped during expansion, causing type errors when
fields depended on those bounds.

Fix this by adding the missing `where` clause to the generated
projection struct.

Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/generic.20bounds.20and.20.60.23.5Bpin_data.5D.60/with/578381591
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
Reviewed-by: Gary Guo <gary@garyguo.net>
[ Reworded commit message - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 7d871236b49c..6b1b8f26379a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -304,7 +304,9 @@ fn generate_projections(
         #[doc = #docs]
         #[allow(dead_code)]
         #[doc(hidden)]
-        #vis struct #projection #generics_with_pin_lt {
+        #vis struct #projection #generics_with_pin_lt
+            #whr
+        {
             #(#fields_decl)*
             ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut ()>,
         }

-- 
2.51.2


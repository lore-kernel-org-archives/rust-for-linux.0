Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022088.outbound.protection.outlook.com [52.101.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73A84508E9;
	Wed, 27 May 2026 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902417; cv=fail; b=aAr97OGFvACj0IPUwx7SfjfHPWZm4ztKNXSCJwRbOWa59+FlocFXGiA4zM/BZiXrZLWg5XLpo2oXukXDqLzyO7/xqsvBxLuo4d5licIQFOoHqgwg8ZXTm8Ga9uJXKxh1QT42y84EhFmDYr4FOhzcsdZJNAnyXylplRbS9U9MEC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902417; c=relaxed/simple;
	bh=pDG4+Tzbavmxr4zS4UmqpvsJAJmifcwZ7nNBM999DFs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EJDDs8W1HBxgMrgHbydyrcnMxEfKfXeftkUzolIa9hrAH0kSChxTrHlPYbZZrHr4zIZMZZ4uZ9VH4ybjSoeePLbPe197Fo9dPpBsB8Nu2TdaV6FOsHjbP8Lear/sAoiRBLWjlvNS0iU17YYX2Plnr3RJiN+vdVyR0Qo/o7evKsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kg+SxUyB; arc=fail smtp.client-ip=52.101.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kg+SxUyB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBNdO2JRtSk/zAKU8E7lTxAohA9ahNF9200b0g9eeMJdWCn3u+JrLnzTvLCLaV3QfMHVmsgQdgNcji3CCUvOpcsRg9GvExqmA+KMk+Kl+YsFUy1uu1x4aomKTxVlGEDX/7a92x98kNZBLLZ/KhZgBDi0XmYhstzMcw7tznU1AzGTfKm/3biK7FVgIlt/OjBiSDDxLhglYt9ZQ6C4xDm8ZSXIofetXLAySQ41hZcv8nNzW+WMXhhA8haOWdDJc603p+YhJYdmv6A8fITesbEcrXTb6FHtCxAquAepmK6z1/+qWJK077b4B7oQapsp0vqYGoQbkZwO5umCIavHYoreEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrvupSjMZV0cZ4PEUMFEDpQWZa9FzvOk7k4pDB8PfCQ=;
 b=qrzcUtCLZxzeY373YhsZsfnJicg/7/L3FhvMx0Ell+i6Z/53shcFBGERxaeEbF7k1Cvnq9nc4G4Nh+a/426v+p9c2h8Iv+NnpIetoxBXLkC1bnr9yZTnHzBXmiPR9sEungcwI58Vt9DRF1b/IgF9dIKoobiM6IIpLdPh65HhuAJAC4HnXPoJUIUi+IKAWpOB7+hi63Ys9jGapiEmoFMJhxPZgRrjQ7QdgklQ/AMEz1qlCB+IL+byla+vsZyfkNUJ8dAqTRp1O1UZ/r/Achr9bercQkIzJ47T3OG/ytZfENIGOCvjhJBQ2L7HAAbDIXxwHyrjjSRtv3mR1jnj22RigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrvupSjMZV0cZ4PEUMFEDpQWZa9FzvOk7k4pDB8PfCQ=;
 b=kg+SxUyBKSAHorl9w1SlgZFIfPEB7HUlW5aZgLl+QbkOy3CNbZIl96h7G0dglNJytJOeUp1MLLCxB/gZwdtKa7RZZBYaOYkysLNkSRLAb9FrUUElKhnAVZv9T8AWj3Vezy4xDhwUYvWX5z6/BfTt/T9YSwmEGjq+7Nt5y2JafwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:06 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:06 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:54 +0100
Subject: [PATCH 3/8] rust: pin-init: internal: suppress `non_snake_case`
 lint in `[pin_]init!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-3-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=1448;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=9g92ne+weSAhoNoaJQtv5ncNm34mTbvTq1YDTwM6op0=;
 b=/21NzsbQXvrUudjOx1XlZLbKekVVe7ZjWQi/Lfhh1D9u4n0nUDpl80cD/s4rZdgHiL9UUPg+v
 wczSfnbdaH8AaclErSOuiWuFwHbW/8zhefq2s2Ln4lN7yshv++ilXBX
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: e07c8341-b155-4b84-9736-08debc143265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UIEm8T9n9E26IHWqDtQd7Xt6dh6rTu1RcGpUOYBxikt7UBceHCgZXBDzy6rs6jLi9FOKyRWcoG2/+h2JRzn0vUzuYVETYvPSWGLiq1r/Db7l8s6VYqC+GMnHF3o8OYPiTT17TGgagoF8kWRKCKmmNMSwwNIPnZHLzBtKX3OPJs/oPlIEHUOFJWIUiu+GQiBeQ9e7i3AA0F/TVPbPeaJu2yvvzI977JAVJfIveW10xfGfU96y/STu/e0zFroa16H7ol3n1KaCuF9n6GqpZMiUBXRmDDZ6O652oMXlBbXj1gA0Gn1dCnhuhUzQlk7jEnubPOUDKCsFtxs2tKb2f0fFKz6UKdAcQctzrqXcmsL6dAVGNgn5J3c6XyXBPn6Lm0qGPXhC5D/YdmSsnhauZPaQHXIymT27f2LjhX982vD85+gqXExjBwU1p/SfhFWMwepqNv6ItXyMkTF3u8f4msieLgXkpZ5Xmgs5Mbo6mOCqHKmEELzTG2FpH2VXhfsCuLW68a9xMELSjfoTNyQenLdz5tBHg/9MneGGfPdEx4D2PWthfrpoffWSsFK3MmoHhTfCsMh3k98TqumOQ3lL5NZKse1tTqGqXo/vgADfBV3MG4AxFzw3BE9tJqBRteyuHnYq2+cEW1NwfX2V9lMphlJ+4RQgi5cWNcHGO8ziyDwWh49Lqs6FKi5ReVKiVnOk+vrjqquDWR+PIFG/dQpWYf58IQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2NMWFl6MTQ4VERKTlI4VnF3UDZyUFl5UFNZcHZWQVNvMkRwbzdCY2o5SkFO?=
 =?utf-8?B?V21DMkhvUnR6MWYxM1hCdU9lclRIaXVYcHVsaXJFNjJaV0RiMWJldG9DOWI3?=
 =?utf-8?B?WnZVb0RhWmpRN2VXSXpYS1BRaGJJdkhCUFVEcnVLcGliajBPQWdneGV5clVp?=
 =?utf-8?B?M3RsSUkyMkZtdTBiaEJvVDdEQ1BzVWlLczg1MnNsd000cHg5bUc1eG9GYmFj?=
 =?utf-8?B?Y2NLSFBkTXRoWXpxdXJHSjkxVHZkbmlnTHVvODhzNUY3dUd5RGV5bGxlZ0Vo?=
 =?utf-8?B?S3MvdTlKZEMvd2d4YVJlQS9iZ3pDd1VhZVZrallRZExOMzJvRWdvOXhPSzJ5?=
 =?utf-8?B?TTB2MjRUQ2doQ0dBaGVUNjNLOWV3enEzQWlDQ3k2REN2TUpVMHlVdWJITXJ4?=
 =?utf-8?B?REJ1TTBNVnd3Q0tJbVR1YzV4bFY0Q1pFMGI0SGthUzQ0MnVDSVZsVExKZnlB?=
 =?utf-8?B?QTU4Z3A5WkxSQmtrcDNZY2ZhZWNSem9VM3MyUnBCdnc5UWdoOS9ISzN3eXB6?=
 =?utf-8?B?elNhdHdsUDRaSndHS24zNXk5cW9CaERoeHNSaDV4Y1p6ajRqRzB4NzcyTXMx?=
 =?utf-8?B?YkN0K3F3RjNrZVEvR3FucGJzdktBdWZDbnJqL3ZINXpCekJJb00zNGJqYlJt?=
 =?utf-8?B?bmFYbzVLekJQai9DdHd2WkliU29iOGxFbnJ3YVhWVE5zbE53bGJ0TitJUmlH?=
 =?utf-8?B?bHJpTVhDbTMvMDc4NTNncnNwdHBzWjJXTU1iRHV6VDVzeEkrdzJraFdTcHhQ?=
 =?utf-8?B?S1c4OWdTMXAzZ0pNMnVJTW4yTUIydFVmTzVzU0s0MTBUM0pQcFNQazlsLzBl?=
 =?utf-8?B?ZEFIbVpwTnVCdU1hSUpNV00wUmhkZENGZ0Z4SVN5QUR2Wm90SlJneTZaNmQw?=
 =?utf-8?B?RnU1TmNvT28yYkNqMEc5cE9BeVB0aCtXNmNPVUVXdWQxQWZnTkZYZUxoMVd0?=
 =?utf-8?B?dDlQMndTdjNLR1BDTndaVW5VUlFVRUluSGVBRUpXWmZPRUMvOUVkMEpkZ2pE?=
 =?utf-8?B?TkswdmgwSWZLNnkwdzRRZmRhNmNRak0vOG1yZ0VNbG9HRGpFSTNHa3BDcHlU?=
 =?utf-8?B?aVJrTjg0SHFWbkdZdzIrdUtzWmMzSUF5MnEzSi9TdkV6Ym05enF0eEhCYkUx?=
 =?utf-8?B?RVlWM0cxRFBOSENMalFTYisxMEhrV1hyYWFKUFFiNlR1MnlQQTB0bUgxb0Mz?=
 =?utf-8?B?c09wbXZtY3ZycVk2MmxQc1lnaGRKd1I5N3UzS2t5VmpudnVHRmpkMm9wSnh4?=
 =?utf-8?B?c0JDOHRKb1AzcDZZSDRNV0FkejA2Q2JBTkVRemkxRnhMVzNhT0NtREtGVlBW?=
 =?utf-8?B?ZlBPZXpsVHRDdUVZRmpyd20wK3BOaXpxUllERVhicUd2L1UxZnBHYndZNEpR?=
 =?utf-8?B?dmJoSUp3Wmwra0I3TE5VTTVZdW85MFdqKzFnbEhpY0NhOXllU2doNUhwVWov?=
 =?utf-8?B?L3JxVkgrc1UrZjQrbW9yZk5EL05LbFlpdVhzM1MrKzUzdE9tRlM2aWJ0K3lI?=
 =?utf-8?B?aWVlcVFpL082KzV5MXVqNnBvbUpvSjdkZElzVTZzb2ZyWmFKTzJLQ3pST0sy?=
 =?utf-8?B?ZnFxc0NOdkRIYUsrMVQrazJ6a0hYd1I4ZTdvL0RGMUk5QVVEZENVOU44SG1C?=
 =?utf-8?B?YnFyOWlQaGo3YzZwZWcrUlJPcVlkNVZ0VHhySFhnUGZjM2dXaytCSEttOVJo?=
 =?utf-8?B?REtPdzB1YXorL0NVR3Y2eEtlRml5ZUdHd3RNcVNOUmlZekIrSUVWM2p0cEVp?=
 =?utf-8?B?SFFtamlzeTRmcldDUDZaTkR6S3BOaWUyRHJyMXBtKzdSMkVmeXpWM0JpK1hH?=
 =?utf-8?B?NGh4bFBHT21nZ1dsZWxjV0VDQ1I1a1FTUGFoS3FrSnBDcmdEU3UxZ09MNHd3?=
 =?utf-8?B?d1ZJdUxaNWUxMll5bmUyaTNwSHhBcUhQYXIrTDZZdkFEV0xqSzVvZUlyTHhr?=
 =?utf-8?B?ZEwwRWl0ejl5Z1hCeE1ia1Q4SXFlMW1nSStCVFZCZVBwMldLRkE3bURRcE4z?=
 =?utf-8?B?Z2JvbG1qOUNPV3pOZll1eG1UVktaVVBCVjRqRXR4Z1ZTMTZJZkR5OHlWRFhZ?=
 =?utf-8?B?QnZ6S2hyV3hZZXJNN2VSZ3RaV1pRVSt0MEdOWTR6Zm5RUUs5MUx0SS8zQ201?=
 =?utf-8?B?TmdsMmZBN3FBZGFsamdvVHh0ajJISjhwY1JZYWhjM0JtNVU2K0ZvbG9YM0Nv?=
 =?utf-8?B?ZmZBKzlKR2xDWXN3TUhuQ3pvTFRtdkFsdWpLcW9aYWZoQnZPTVQ0MDN5ejdw?=
 =?utf-8?B?akMyN2U1UDl6WDlmK2FaTXdzU2lROGszdWNLT2dsY3dDM2VmY2NmU2c5dkJE?=
 =?utf-8?B?ODBIeGVMYUxHL3MyUjNVOWk0cFl4UzhOckxMWUlDSUlkM1J6alVuUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e07c8341-b155-4b84-9736-08debc143265
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:06.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl5T2i0KMeUZ8hcaBAObFXUzrdEgndlxz81Hw2oWVp0P9acrpPl28n+eShC4824LogXpNOK588MntH5O3PagwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

From: Mirko Adzic <adzicmirko97@gmail.com>

Allows `non_snake_case` lint on local variables generated in `[pin_]init!`.

Conceptually the identifiers in `[pin_]init!` just references the field
names, and are not defining them, so the warning should not be generated,
similar to how constructing a struct with non-snake-case field names do no
generate these warnings.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://github.com/Rust-for-Linux/pin-init/issues/125
Closes: https://lore.kernel.org/rust-for-linux/DGTBJBIVFZ2K.2F1ZEFGY0G7NK@garyguo.net/
Fixes: 42415d163e5d ("rust: pin-init: add references to previously initialized fields")
Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
[ Reworded commit message - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 699b105570a5..041a84593730 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -296,7 +296,9 @@ fn init_fields(
             #init
 
             #(#cfgs)*
-            #[allow(unused_variables)]
+            // Allow `non_snake_case` since the same warning is going to be reported for the struct
+            // field.
+            #[allow(unused_variables, non_snake_case)]
             let #ident = #guard.let_binding();
         });
 

-- 
2.54.0


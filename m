Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155D370D7B;
	Wed, 22 Jul 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746242; cv=fail; b=Pkap4koZgYwOIXS8LEppCAL1UUOUO/FKkCue0KrQtabyAT1f7k+7TUEqVMyJWwgKIU15M+tVmtooy6ZB3xXmhvhIyGvb77RRumATuICcGX1pdaW4JcVniKFBDeg4lalngK5LmkEDsTtQBB65ZezRsiUO1QjYLPjlst2iOQYTylk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746242; c=relaxed/simple;
	bh=dNgYY/3Zqd0QAG8CgtBNJF1HAw83++tlV5uqE1m3ZKs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u/ZHmJ6TLUNfw+7KE/ezazBp5At4LsWkKgJTkiWuipNLsVCwpKXlhaQ+ZTDrtouYveCqAosnszwi5NvUtRfttERguf5vRCik3xd0/opoK8Org+b4LZaUpWIeQu0dIXixxP2wgZ7ehVSnQv0XtKt8B/3gOjaru+QKzLmKKdud968=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KxOvVRG4; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KxOvVRG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq3pMYeDJ4TmAO6MZfRnOsolFumeZrJHeZm+WXoGVf9VGY6tbs8iebY2NNJ+uVLMi0zmL6AsGRWLqvZv6NSYj1jEKLno9v3QiVoCIAoVVcaraY+S0wsrkZI4N5sS7e3v7K1zAVxKSbQyzF0ln8tq9KlDZnVAHmFYXDYZY3EVFO/zVxZx/IQbvzlWaGNfyIV7OoY3Nwo1I+77kSOqJ7k3yE6HhKxXLbwPYbeLmQhCAb1WmSee3wsl3E42tzXRt9lyE4hmfuLEhtt4auOIAUYfKZQGaXK76EDm4Dq0epSK/vG9+vK/13h0KPddy8PwzeZsD4nKsDhrNB48tqYP3hwmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNa+AQImJQ07xH0dhu7ToPFVE6M4I5LRD/6nerpaFG8=;
 b=p3lXiflD+o8Z0eKnLDBkuXlgt5HJhvprYzU439ookRHOazQFHmFk6U09IM1jAnl6jI6A/p2Vn5LYkUZ8ga5qyFnobKnMztlcX6XIyIMomVTzhUlFjzS6PHNvpWQZihKH82j5PaLEcdMCvog7XTpjXphgyLik4eY4o6zScXSFxx6MgPPhHJP8ARw7F8+g0/ESrtNjbAzT57eVzjQ5Ocm51vFOTSqKCH9schcxQDETSYHv1YCz485B5tQnVrKYeb20yrl1bq3Wo5Sg/CE+9pS63ZoMRcs+ejo5esn3xKEGzwPJE6SQiAnDnMLTGO356MkaEQbkQYvECpvtaZ6wSkiC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNa+AQImJQ07xH0dhu7ToPFVE6M4I5LRD/6nerpaFG8=;
 b=KxOvVRG4KYtiAhmFr7y6T68qjtIbt//YW9DcHCXrAQHx0Zxiv2l4djvyAM+EpdPM2Iqnki4sKBrGQdOBeYi3Z3G2KzQPJYfTwOKTySwrAOrO7XaE21/wEW+mr5lv1Ba/N64cK364E89aCiAJ8pVma28ZPv+tE5w0niuj2+EnUEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:50:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 18:50:36 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 22 Jul 2026 19:50:18 +0100
Subject: [PATCH 4/4] rust: pin-init: remove `__pinned_init` method for
 `cfg(kernel)`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-merge-init-v1-4-d4594de76538@garyguo.net>
References: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
In-Reply-To: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784746228; l=917;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=dNgYY/3Zqd0QAG8CgtBNJF1HAw83++tlV5uqE1m3ZKs=;
 b=bCybW99wP7GIIoTKtVs4KrKi9ud2ZDiiRtr69A3cooDupkFUVgzAn5PJ197jw3/K/WQXQTi1Q
 sf435Z+e72BBxv+X0JFhw59W03bMCBuHBFXix1jSBSQqAZFpiaL+88B
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a81a8e-dee3-4943-0610-08dee8221a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|56012099006|10067099003|921020|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	69c6JCJa3IDdQaLfoxGkyuM03TuLJChTWLB85qdwa+t7Obm0WibEWZm54RwU39l7y9RVLMmWiwv1it77iYbzjgX/f8tcfwckMemk3AnHfOm7kt4BodCw3DW7KNHgMIPFTUEGFsViSydY/tK6/nkHCz8SQXn6YlAxTe1tGmXSUqWMkW7IY1lZeHN17vmN+Csx8qC52WuEFNeFWih7sEvPYj6deGPscXdkAIsrRlqGFr1bSOnJxZk246ZxhjYP6vvpbxcffAfhDlRa7NlQJ4h9+ycc2CMUS74F9NVi46FjU5OLU46oh6/kbKPK/YpJzKVszHpHqqggoPcrAH2yiEAJGL/Ke6vYhQUdiwjiMwK78gB9VlqWKNWBXXqiVpiyumLfde9rYueiylDQX9qPPNy5l3qmUO+7odajFXrlxYEYL8My3kLCqirGHZYnJv6JVDCc1ZwIS0LeeOzXe9IbS8VuEMMlx6yA6Oy9HTyMFSdygbGCmqO7Y52jnOOyzlv7nQd+uaaS2UZzK2zQyA2bH/Ubu8HMfOJPzxnIn/lM06GvzO+3vzt3UAT4ZUrhm5Z4yVwhbDkh3z4Z+FNRpN2ljajbrxx8SNc7RccrvxixVTfTk6QHZy8Sy9xoz0SQ1eyDnq3yWLJCSQVv+yqvqOSsCWAU0rXYdqZvJ20T8GRqGDHRhHoClLgUtObRFBYsA2T8LvqTPBsJjG8VzquFDlFNi1HkrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(56012099006)(10067099003)(921020)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZXQStHaHh6TU9PQXRWWVZMUVhJbGozaGxKZktSU2dWSDcvK3A0YUxXMmVk?=
 =?utf-8?B?L2ZsbGx1bDRPRk9OMHlyRVY4YXVXNU8vcHBzT1pJTVFqUXM2UVJ0VmZSUExN?=
 =?utf-8?B?Vlh1K3hRMXJTdisvZUViS0pGNUNqVHlUc254ZDk5M25WeDRZMnZjWFFEOGpq?=
 =?utf-8?B?bTJkU3drRVkvNEVmN1BGZ2RFcTV0bURsUEtZZUVvOUNNNW12M3FFMlhuVlNO?=
 =?utf-8?B?dXBKQlVKRUc1SXJjRmtyQ3dhYWk4QXk3bUgwUmZtZytGVEsrejJqNzhhS1l0?=
 =?utf-8?B?Mm1PVllGZGZQdGlWWHBkcWZrT0pCUnVFTjE1Z1J2OFNySnZFY1BPSjVPdkpl?=
 =?utf-8?B?VjhuanFVS3NvVlRZc3hORUw2cHc0RUNTK1MybXZSVHpOUnloSXpNRTkzMTJt?=
 =?utf-8?B?QmtKL29YODFoL0xYR3hCcXphL0RPNVlNamMvNzlFVjUvc1NLdG1pblRXcXR0?=
 =?utf-8?B?dzV4NmRwWGQ3dDRrTUtOaHpITFlxakFVTHIyY05lc0wzeFJWYjFEcHNBbGFa?=
 =?utf-8?B?dGI4WXJ5cHMxTXhjeTJEMnRPTW82dmE5YUVlUjQrZzNQaEVWYkpHRVVuQjdG?=
 =?utf-8?B?UGRJZzZFSVBTWjF3Yi93eTVVelljS3EzVlpHK3B1YTRzSk56Wmc4S2h1ZENV?=
 =?utf-8?B?OUVnVitYTDlRTnpUOW1LOTMyMDIwaUludk8ySXg5d3piYi9rcEtGRVZxejJB?=
 =?utf-8?B?c1ZBQkpPTHJRNmQyaDMwMHdQd2lJWVdRZXBMNzJRYURsL0RlWWVsQWhtU2da?=
 =?utf-8?B?UkdUSFd6K1VYZ084UHN6NWlPRXI1TU1KU3FsNlV1eE9qUkkwdFZpYXFndHls?=
 =?utf-8?B?SEVZMUtTWXRsM2Y3WDJCVUdoeUhBUmlpdDgyek1mUU04SUt2bGhOZW40SU50?=
 =?utf-8?B?MmZmRmYxSWZTd2dvUmhHUWlCV29yLzhQL1hwekNiTzRYSHJ0S080ZVpHNTRq?=
 =?utf-8?B?TVFoVXJCcjdnOU9kL2haQ0xFd1RnUmY1K1RrK210Z0sydllYTHd3TWEyMXhB?=
 =?utf-8?B?YkFXR3JBejlQZElyRHZsN01GZTFsL0tudFhROXorK1ZvWThSZkxkMDhhSGFi?=
 =?utf-8?B?MGdmU3huSkJWTEk2aU1GYTFiVmhrb2V0R29UUnRCWUhFT2Z3QWk1OGtpZTdJ?=
 =?utf-8?B?N1lDU2YxY3RZUDBwb1VQUE0vSjVVQnpTK0ZacWdQcTNhU0RFczZqZkpHUU5q?=
 =?utf-8?B?WEloZmpjRWN3bzNRdERkSnJTanpXeVkyMC9lYlBGOWxZdXV4bmM2WkdncEQ5?=
 =?utf-8?B?UjNpeHl2UTM0UXlvODhkZTZUcTUrU29peVpxWGxzUjF0RGxreUdzOVB3d0Jz?=
 =?utf-8?B?QTdpeE5YNDVZazNkRVIxQ3VoNVkyTnJkUWxyK1ZxeFlHWDhvTmdNKzZUaHlQ?=
 =?utf-8?B?cFRuUHYvSHgyOGtleGpuWjJFNkJ3Tmk1VS9yeDhkUjd4V3RGZFFYRHlQb2k2?=
 =?utf-8?B?anNlREJEbm9TNHQ5MWdaVFhCRXRsdDFXT0hqY3ZxRnNOd3dKT2F3TWlWRDRE?=
 =?utf-8?B?ci8zL1NtZHBKOU9QUlN0bU02b1kwSnJMaDd4d3ZPTGNPNnBUTjVmUXdjNjlu?=
 =?utf-8?B?a2t5MXd1RXp5a25pa204b0gzSGxUUHRScUVBbXVOQytpbEZET2lGUmhRWHM1?=
 =?utf-8?B?S1VwR3UxeDVBaHhwMFpLSWtBL05kTjJTbkF0c0VBci9PWC9WT2xwaGYyZUFC?=
 =?utf-8?B?eEc3czgzN0Y5ZnhaeHpwQURmbjNNT2NkUzRPdlNDWUF3STg0VHFUdzZVVXVD?=
 =?utf-8?B?U1NYRXZ6T2hVc0lhZElHNVZkOEFvUHVyalJwWk1EbVUvQ08zWEYwd0NmeXVq?=
 =?utf-8?B?QTlYcDBpR1ltNXJLbHpIcU9ZNE9JdzBkR3JHOWt0ODdzU2FhRXczUHRvb0Va?=
 =?utf-8?B?SnNBa2Y1ZG1yWTk5NjFYS3VkTnBsNkcvbVRmMXdTSkoyaDh0RmJuU2d2Wldl?=
 =?utf-8?B?RFJxTHNYeHNWT0lmTXQzSHdDUlVaMEFpN1k1TnJDdVdWOWVibVZzd3lFeEtU?=
 =?utf-8?B?R2xVaXZneTRaVlR5L3c2NFRidHlNZ2V1V0RYMFdNakhJWDBHM3h4WktQNGdF?=
 =?utf-8?B?N1dyRkdxV0xCVmx1ZkRoVlErVnZIcG0xM0lCMTNYVmdkNlRPOVNqNWhqRUcr?=
 =?utf-8?B?WlpJSWVtYlVlVmF3dkJyUlFwTFduVUYvWUF0a0FzaGtxVVM1UDV0NDFvRXdr?=
 =?utf-8?B?YW9XN25Wamd0ZUtiYzZINW40WVRlVEYxdHlPd0p3VXRRNlZXaks3dFhkZUtH?=
 =?utf-8?B?RkxzV1Z2WGphR3dEd1lOUjB0dEhGMlNHTEpQcFFYVFNENVZMS0htemhPbjQ1?=
 =?utf-8?B?RHkwUE1uR1pGbUc0VzVESC9vb09Ub01lT2tuWGNHb0o3STFzR2p5QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a81a8e-dee3-4943-0610-08dee8221a74
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:50:30.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHSHQfxlL/6lpuKFq4ZJYXPemv22t68imurY/pCXvaIqyya3IlVzrhw3ePD/m3831BKSqwDkQpjOBVh8+8wSrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2471

Remove `__pinned_init` for kernel configuration, with all users gone.
Still perserve it temporarily as deprecated so other users have time to
move off it.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 354fbefcf80e..c8c1d0184da4 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -917,7 +917,8 @@ pub unsafe trait PinInit<T: ?Sized, E = Infallible>: Sized {
     ///
     /// Same as `__init`.
     #[inline(always)]
-    #[cfg_attr(not(kernel), deprecated = "use `__init` instead")]
+    #[cfg(not(kernel))]
+    #[deprecated = "use `__init` instead"]
     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: Per safety requirement.
         unsafe { self.__init(slot) }

-- 
2.54.0


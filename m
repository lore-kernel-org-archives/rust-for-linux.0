Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021084.outbound.protection.outlook.com [52.101.100.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4543FD18;
	Tue, 11 Aug 2026 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786475412; cv=fail; b=ZxGjN5pVqnPcwpzwYDQrN9U+HdkYsz7VIVteBrgBV4h425pS5X2D6OGQ/BIN4WhwOGUGkal+1nDsQqiw9W1LZQ+G1v/I2+HSHyg5LKKSMMSi5DwU8T4M40euzNOcI1EVSfyh02moD4WZhtfmU0gJogBIziR2V4dJmb9O7QUKTMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786475412; c=relaxed/simple;
	bh=s/TON9+8RMGu7kP8ogNTDnwLxEFT1MykcWmPjen6SX8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HuquR0IBzXqtZmjmPxAoTXKw48tkSlxGwdjIRav206NAh31DZCeUR/HbpGPpeWMnl6koFmIyQe6KScjRXsa4vKLqtSm7msdr/sFH1d5vVI5sSuhpnfcETCSCZr71gD4RGBuqF40U2CWca/myqtvxvLO89pzyy9kLuYmzKpsZLH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ViT96t9E; arc=fail smtp.client-ip=52.101.100.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ViT96t9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp/aIiBTIFzUCidyzNe3k4jR9cAZpE4O2oFJoIClBVeLCVZPTXYH6XzUmMwDHZqE2fUuo4Vholxp7I9NXlp63tEoquWgc5w1zoYlgzewk81qv+VzA+QfGfGGebYnIS5ZJoZz5KQOdVvSGBxJEr8D59sExei2eZP+mbsAF9T55MeZsY0BDVmUIFruz8n59ZSx7v/djsNxM/LBxGmxJHvXRmzhS4oYzkHCeYz8QCOYfpj9En7pfAqW0zu7FFpVQflQGlskO+CTVkFO5fqWTBOWKmlVuactE4FWI9J5Q3qZ/ztuI6nWcbKA3ymfqLwm920cYWhymxPUPlJ8X4aHotOdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/VAg4U1lnqcQai9fIIebB+Xqr8+13BVvKEX2y2LyYo=;
 b=j9fujVMTSGD9pgruWgtIWBKaH+1sb8SAbQqrv/gu+NyBDpazwl84dkDQBCeo0oqbNZTYzkjqQkA1ymlML9cqEhK3VPkEyw5Xg+jcavkTHJyk8fmd/OM1GD8mieHOZ7Amsfoexcya67DgpvVtNcTturDanYWhnsBzpOFah/M6s56Un4G2Bbgy9Jrp9zMQUOKybwNfz3u5S44lsC3ma2r0GMo1806Yw9NDP7QTpM3sqtTfOCWnK+ljnr06MSHle+ugmMkdbJtoQ8M16fpuyXfj8W9ozrAxr2XP8xdaXzKUg4IJwdTboGFTtR8K0UIlR1YpvL9ZUldkGOttKXUllP2Cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/VAg4U1lnqcQai9fIIebB+Xqr8+13BVvKEX2y2LyYo=;
 b=ViT96t9EdDAAIxXz1pcY3pWyXSx3zEiXv+EDp7d0RLMdZ/LRYSlI3YF6HCiSM/VgVx0k5fjrvF3gZft+sTjKcdtERpUFUonjzZyoUYbO5UqOhFCuVepPw/53cvXGZ5gky2cfl3V3Gl8FkcAfbv8a43G90sqfEWr/8DSbECooXaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB7931.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 19:10:04 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.011; Tue, 11 Aug 2026
 19:10:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 20:10:03 +0100
Message-Id: <DKMCOELKPW1Y.26H776ZRZL9VC@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: completion: document Send and Sync safety
From: "Gary Guo" <gary@garyguo.net>
To: <git@younes.io>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>, "Lyude Paul"
 <lyude@redhat.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260811-docs-completion-send-sync-safety-v1-1-0bc663ae967f@younes.io>
In-Reply-To: <20260811-docs-completion-send-sync-safety-v1-1-0bc663ae967f@younes.io>
X-ClientProxiedBy: LO3P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c8c792-c504-4a1a-4ddf-08def7dc2663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|7416014|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lnOD48/6c7SWX6cJigUC2kPFoUo7KJuxcXCVLCMuvwheweF7zp/G5D+7Qi4kK7If1p8UFiIFgaGktiQ7O5IAUroAO/sXfoSpGemxEmfx/HQMyAlHhnZbS9J+nS7N4KXaZDE2brcCnh3Lr3uhscQRkIBsVxc1NrNjcaV55c2JSJum6P8/AXf4rJAf+Uh4RVgtQeIVFqcmgAm4kEErG+6xNiLVBTTmnzjOqYYcDxdTl8nnmO8kbmPJc0MuhjnGbQpvrh2BzUA51NhJeNaLVZ3cUBHnshQfIKfVej9INP12fZAIwgFWhZKv8PBUbbE08+3GS1N4pmneyz9so6gRrMvy3TLtT2Rw3Mfyh+TqmnIkZVLZren/fFcpe3+u/7wve6MULZ79NB8/GcmeO5cZ8T8gRHTp6KM+QQvLVsEYARKAinCWtyobpqXAg6ez8oAN8dPEWFyZG/jS1z4jMUVcyGg9ss3gyYRYj1Lh59DjxFoQr49CVmRHCqgtTwTVIT6nNitzSNGH+qijEdtMzCVij2/XbGwgeK6/pCKI07OSGTM7At+bD5ALreuX641+J5c+fg+W5waTwNK3QKNHg01oAsFqrMc1v7jaZFlMGtg7Zvu/e7fcAuDy1yqtQCX9JCZ2oHuWX2kCvD/ts5I36/20JCGpGW6SOvjcYHU6yHzm0IvaNeRcbu/kzIbSLAKGFTT+s83AZRZpt5Gf6+8pRh7bCo1v3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(7416014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktocWI4OXFtU2E0WGhVZG9FRTF5QnZSb0t6cmtPbXgxQm1GYXZuUVNMczVi?=
 =?utf-8?B?YlRtUlBETEoydjExeU5NQlh0aTE0M0FjV09QV0liMWZhT1RGRm5SZndkZUw4?=
 =?utf-8?B?N2t3czZEVk4rNWs2YzdVR2NnVXRKNjBTRklmY2pvUVlGa1dlb1RhVjREc2lO?=
 =?utf-8?B?alEyMEl6eHppYTBvVTNMSFVPb0IyRG1GV0xvZmNSR29ORE9yY0ExYUd1U0F5?=
 =?utf-8?B?N2RuUXlqQTVTdEcwVWdQcFA1clUwMHNHUlFJenFSQ1B5Yk9wNjRlOHViOWR1?=
 =?utf-8?B?U1drZVNxOFM1anNCUXIvcXA4aDRweEthYWdxL2VPSEpPNVRkVWEvRmpzTldx?=
 =?utf-8?B?ZHFUamVLZjh3YUdIVjhEaXowb29qK2p4TFpaSnNPRGNDN1dRNFh6cnc2WDh3?=
 =?utf-8?B?blpHTmMyMlc2V1Z3blRla1NNUEZrN0Y0ZWpCMzJ2YXVxci9McW1lZW5NOU15?=
 =?utf-8?B?YlZmbklRUDcrM2NuVXh0SUpMMUFXbXBBZ0s2S3dnaEJRREJBcEprM05wSmEr?=
 =?utf-8?B?MDZvM3M1elRZaHJ2eTRzUDEzMzFMOWppU3FyUGgzV1pYWWd5ajM5L1E1TWNl?=
 =?utf-8?B?azc4OU91cHdXTVZRY2liK05CR1A0SFE5Wkg1dndNaS8wbE01WTBqQjExa0Yy?=
 =?utf-8?B?NUUwQnFGSldOZUV1Qkc1L1l5MUgzWUFlMTNxSWVHbHE3NmphVjJ4akp2VnJi?=
 =?utf-8?B?YS9tWk1xT3hoU0FUSEhLTWowd3Q2ZHRmMmhkak8zeGxNTzlzcmRMZGpMditt?=
 =?utf-8?B?Vy9QOW15NmFnU0RvSzV2Q1lOMkJSczBUMCs4TCs5TStzUndjcTNYLy9WSUtC?=
 =?utf-8?B?cU1FWlk3Ni9QOHEwOFdadGQxZE5hRE1ZaGd5SVRVR0EyU0RSUmhtZ3VsaTNy?=
 =?utf-8?B?UENpbkhWYVpxdTRJNnhpVk05OVlDMm4xV2xvWGFCT1ovQ240TS92UVNpS2hH?=
 =?utf-8?B?MmM4ZWhmMTdNeEowVko0aDFVL2RTZGl4TFBNemwrQkNpYzVBYWZUYUh6OWZm?=
 =?utf-8?B?eGdIKzRtS0hob0E2YWQwMHFQSFRsSUIwUHRCQVF0dTV5Vng0cTk5ZndpK3hz?=
 =?utf-8?B?MmxnRzBsS2pPRlJEbi9jbW5LNm54ZmpyL0wvdS9xUDZtN2lRdDEyYUNtRDY2?=
 =?utf-8?B?VDNCUWdFR2hyclRDMjFOWGZwbTBWbVVVaWJOTEZtcHkxM05KK1l4aGhyN1hm?=
 =?utf-8?B?ZTRCMnRlZHNSN1FmNllwV25yejU5eTdXdmdRaHltckh5MkExUFgwYm96Y2x1?=
 =?utf-8?B?WUhhY2lXRlBpNVhxNUtHcFZGWGo0eEpRL0JhZE41Skp3bUMxTzBwMWJ1M1NB?=
 =?utf-8?B?RXJHRHJmSUhpZmczb0szUVlUa1pHTVlRekduYTBIV3hoOG40NFh5c1FnZFRD?=
 =?utf-8?B?U3JGVXF0cXRkbHVBUnlKakUxWjNOQU5PZVkrc1ZwRXBZRUhLdkVVQUM4cHVw?=
 =?utf-8?B?ZEg5TCtmOWsvSmMyeFBxY0JsU1NERDgrRmtsU3dWZkthTE02YzFIMVVRYzl5?=
 =?utf-8?B?QWM0TGNsNGlXMlROWVhHSXdTUHAzWG1JOWNScFdOOFVSa2NlZzR4Uk14dnNM?=
 =?utf-8?B?UVBaVWgzMzNOSXB5ZGJ4ejBzd2dBNmFsK0o5MHBoTVZZL1FxRXVXL29kRTJh?=
 =?utf-8?B?TC9YWVhkeTl0aVIycUhuQmxFSGxhWXJkSDBqcS9VQXUwOXlSdld0NFM5L3Bx?=
 =?utf-8?B?TEZId2trc1BjR0EyMnZ2dW1RejNNajQ3TmVjcHpEQk5WSEt1R0JFV24zay9z?=
 =?utf-8?B?UDNxLzU5cEFGMUcyMldtaE1jZHc0V2FYejFUNWZBUE54a3BBSlA0Uzd5emt3?=
 =?utf-8?B?Y1BTS3VmWU52cTRzTm9icFJ3cmpGOUpBaHhPTXZlcVhVN0xqZ0kvNzV1OHF0?=
 =?utf-8?B?cHdkR0d4djdEZTlnVTZpazRqWk8rTTU4cUVEalRLV3Q0cy9WOTRPME52RkRy?=
 =?utf-8?B?dVg2STlHRzkyZmNGbXUzK0RWSWJVRUNZMEs2SWNqemZ3RkdSQ2d5N3RKR2t1?=
 =?utf-8?B?RzVPN3lZQjRVTUxVMVZhd0g0dDd1bEFZSnVpQU5UeW1YeDZydDNyQnRVbWhs?=
 =?utf-8?B?akNvNVJEcEVieGkzTDRpMktYdTBKYS92ZG94M3JQd2x2Mi9oN0ZJTjh3bFlq?=
 =?utf-8?B?N2FPdlNidThTWGVIRWc4b1pSZk5Rc2E0Rk54RmE0R1JpMVZXS3V2YWlGWW1q?=
 =?utf-8?B?bG4rSkRYWlBUSHFuYzlOUTUwaktGVzM3TkZXbW5veHBjQW00OEhucTBTNFJv?=
 =?utf-8?B?VXF3WnVJU3F1bzRraThTQXVvU0FDRVMveXBhaTlqWlBnM3g4MXg2QzBZb2lv?=
 =?utf-8?B?UG9GSmpZb2NJSkNQNTExajNCZmdpWGJyOW9qR2kxUWZ0Ynh5akhydz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c8c792-c504-4a1a-4ddf-08def7dc2663
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 19:10:04.3115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rFqEJrQxi94AVaNdp5wtxOmcN9/NyfUqBSfYcznGXx849u8Cb/ReLFtkGI4WN0vM+MgC9AZNpQFA70WR8iNCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7931

On Tue Aug 11, 2026 at 7:35 PM BST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> The existing safety comments only restate the guarantees provided by
> Send and Sync. Document that completions have no task affinity, that
> moving an owning pointer preserves pinning, and that the C API serializes
> access to the completion state with wait.lock.
>
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
>  rust/kernel/sync/completion.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion=
.rs
> index 35ff049ff078..b5842f04887b 100644
> --- a/rust/kernel/sync/completion.rs
> +++ b/rust/kernel/sync/completion.rs
> @@ -69,10 +69,12 @@ pub struct Completion {
>      inner: Opaque<bindings::completion>,
>  }
> =20
> -// SAFETY: `Completion` is safe to be send to any task.
> +// SAFETY: `Completion` has no task affinity,

This is just a different way of stating "safe to send to any task"

> and moving an owning pointer to another task preserves
> +// the pinning of the underlying `struct completion`.

I don't parse the sentence at all.

>  unsafe impl Send for Completion {}
> =20
> -// SAFETY: `Completion` is safe to be accessed concurrently.
> +// SAFETY: The C completion API protects accesses to `done` and the wait=
 queue with `wait.lock`, so
> +// the operations exposed through shared references may be called concur=
rently.
>  unsafe impl Sync for Completion {}

These are internal details of `bindings::completion` and completely opaque =
to
Rust abstractions. They are not referenced in Rust code at all.

I am not seeing any value of adding this.

Best,
Gary

> =20
>  impl Completion {
>
> ---
> base-commit: 8fe5e5f62bdb9660999449a4b5eaebcc37d7f842
> change-id: 20260811-docs-completion-send-sync-safety-296f16d6135c
>
> Best regards,
> -- =20
> Younes Akhouayri <git@younes.io>



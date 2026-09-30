Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D09D4FC320;
	Wed, 30 Sep 2026 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781272; cv=fail; b=NuSSxPthDECA1h72gQxgn2agY4h1lATlp/WoYJbJTrhKJuc9RL/K0SobzXAsOU6n3OMgKTo9zOPJbBzrdkG+NxZzXz6xUzEE0aGWBfo6Badrap+xeGdUCiXMaB/Pt4404jhdyQiolVuCn9bN4pXIQ6mJESQAnjfzpGHXb9fgS74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781272; c=relaxed/simple;
	bh=6+ARz3Rpdfo+Yxd3kOTx2o+GfXK4UGzoAuQqX4Uy9bg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=F23hZypc5kf/MVGyMGGA+6Zcpnn467kmh4amWF2S1n0/NNnnuc+dzYGaJ/HxMGfM1+UvyqI1iS5fKvuGz+D23g8RFFXinud7o0pO5AkaLtoCvLOyU4LHhV4JtOLKVrwDGP7NJapwp3q3xEcKepKXESoxQgglTUkAXdNy8qUquBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VQ58sIQa; arc=fail smtp.client-ip=52.101.100.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VQ58sIQa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUJjgCV7k24qirOyVh2m3PldyFd5OdoKRw9j8YRkO/9m6guRGZYRlYRaKO0+bzBDMfxezeMN2wtjQJw3dtTjkVL4eR7+yAwyrdPJi30D80R6p55TuK5Z3ndTY0rI7RCW6dB05/OSDCpKFpwbaLCS+oZbUfPOb12SZ81Yd9UsHL5PCu7YGruh1vRE8aLuW5SkgSvMgUWqRLaBeZW2pTvcKHRiKZZGLo60eUOpOw9KY/BrvdCHPFLTkwJCEwqWjQrEu7vHw5ZGAEvjKP1tvaynAsUxrpamGPnZmmiGuk9Vk2ssnBwFNzwxig/lV9czhBjfwTnxks58B8UvWKOsy0ejNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTbMhX7uZdC1wyss5/EG1By5ybWZTzR6zVdnNf/UDrA=;
 b=Sk4mCYVlgLf6W2yc9I6fokU1LCXpiTra0NhjtX/1SL9bcucH0t7ST/iRuYgFOZKo55jBDoWSTBhIomMLaz2j90CIrTi26mMZ9Vfk4MVZ4qaQ0jdojRPIc4uxtDKmdU1bIA6ABzYepd4pZpff/T5MoZJE/J3/eXvcqHcV/Lh9rBeHMJBD45Lt3erFyZV4HNbFbkOKuxXzKfjxL9GGU4sawBG4CSDLawGsy+DhGHSmPNCyU69O8My2yQUugvbhJswkYKUatSWFYR0IDxN/3qmFJPZJqMo7KemY2ZUandvAQcxqLF1XOAObqz4UmY0hn4wafDZ3kjglunfLJQjReY4xow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTbMhX7uZdC1wyss5/EG1By5ybWZTzR6zVdnNf/UDrA=;
 b=VQ58sIQaNuM0C7NWnbgRPyjdelNHb8ZgDDlevZBBDbnDucCbqS8ZWl6w1DuLrmm54ail4vdw3G2/aLT6pAJcl9JHzpGb+Ssmv6OwZf8EkHI/lya0N4l5rjc9VMPSPSr+RWsEw5z3jFGeENt49EUWIzhYpUU1jrxJALrm0U4MXHw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB2496.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:129::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 15:14:20 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 15:14:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 16:14:19 +0100
Message-Id: <DLSQZ5DLFZ47.2B0K99JSUH0MJ@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] rust: add a wrapper for the `nr_online_nodes` C
 function
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "Uladzislau Rezki" <urezki@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB2496:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f123e4-9e11-41ef-b18b-08df1f05806b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10070799003|22082099003|18002099003|921020|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cFqrB2luD3cPBfG+Jf8X1CGiHHfxRhjqvXuE7z6jrwujmFmXMbSgaluZvgt0uXRv6KgWsQ8OF6xP+IO/AStE4H0vPE8KvQ8VbuEhjJqLU8BJh9gDU7Q++N4yR/ocZRu9ALZdAonSOEnfPAcOqu9FngnPVnA9+uJaLc4WYilcT3fe6++jbaokOWA0HWt0dBuPaudnODpyNVL4ww62XEd2WeocwHs/mmaZFUEA/1/rUCeKLV1Ey085xughHRMDahzTC/YD190CeKYu329tdopYKMOlycgrWlwQj53sVjUyayfnTukoNsYKgGe62CHJ9fir8anLJyfAuwkSlxFVtk5QjGhuPFrRah4e/x8tdANYplXyJ6rvp4WI+X9Rlu5F7bf7rANXHevNrVgcyTdWNdoO7HEbweTXINATu3btSxHb1pEAH8/aZeFsMWC3MkVKvHufB8d0WsAeBoU2OGICLE+7WBuLmaKtHXSnZaupo6/R8u+2Zl1Mtyldwf84C4kuNI2Iu8Lpi52O6Qeuc6ucewyyTg/2Rbmdb154X/JFkCqbWiaKBs7S5DoFCOe+a+IEadY78QbbJoIVUkGF8HdgEZguIEeXGBgORcNajK1JU+4UB4XMdn7rWTL7A9LlKj8jD99gd1/WnNJFO3CeSeW3InWFEX2A+oQSVpvi2EZde+OEpOhuoQZTe2xxqGoysBFfCYDE05+lYMFTCVtbBXHqDqggLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10070799003)(22082099003)(18002099003)(921020)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhxMFpDZElHL3E0dUkwTXBpQjJIbkxDNklzc3ZFK0hFR3E2VFVZR3pZa0Fk?=
 =?utf-8?B?T3NEb1JYQVd1aXdDcW5EWkt6aFU4aTJkVFB5TlJqdWgrQ2ZiRDVkejdleGhB?=
 =?utf-8?B?NU9hNFpHK2pWMTRtMHY0am1wcnRNNFB4RzAvb3hGcHRoTjE1SWdQRlgzSytI?=
 =?utf-8?B?U3h3bDVTQ0RqZVI5Mi85aEkxR2pBZXNCeEwzU1BvMEhzWjE3c0xYSnhZellh?=
 =?utf-8?B?Q2QvbFZyVVhlcUI5SUxtaGpkbSswYzBFdGo4VUVOSHY5OXpnNTlyb3JDbjN2?=
 =?utf-8?B?Nzc3Y0g1OU9DNEs5QjZhOHFML0xDTlBHUVYzMGxhUlQ0cUM1UEVkOHh0Zm00?=
 =?utf-8?B?RzFseEZGZUVLNVBHbHFiUU5wRlI2NVFUdExFK3FNKzZyYnlSenNvcTN6SUV4?=
 =?utf-8?B?eGVzeVZzSk15ZHRaWm41Q1BJWGMyK24zNGo2S3htSEo5VGg4M1Uzb2hJcXpB?=
 =?utf-8?B?c2NKWFYrYzVIZmJXVVc4di91MTlYRTVzL2hrQmMwWGJ3c0tHS1NXZU9HWmdU?=
 =?utf-8?B?WmF5L05qaFFySFlIQ0FDcFhOMjhCMTZCSkxaTGFoQUl3OTZVaGJIS0QvUS9Y?=
 =?utf-8?B?NEloOEp4STB1T0J3UmIwdWlVV0pSM2dsemxYR0lWWTNhakdDWFJJcGgyZ0pn?=
 =?utf-8?B?NHNDNXpCZVhxaXRzbFY5ZHA5SHFodU0zYXVaaVRraHRKSXE4WHc0WjI3Y3lO?=
 =?utf-8?B?d0NwTjU4RmM4dTFNUmd4TWMrRWJucUlQeWo1NTh6d2lhaTFvSWs3Tmw1ZWZK?=
 =?utf-8?B?cnVTSUdSbGJSMGVneWZIeEpENXY4MkptUkJmT2ZNU1BWd2VHa01KYXhneC9a?=
 =?utf-8?B?WTY3KzNOTzgreGp3VmNkYW1xZzgyVGVnR084czBrNWxBckpucGhXdksrUjdR?=
 =?utf-8?B?c0xQUGJ5QlY5ZXBkZVlvUTB1UllBYVc3ZlMxV3JLNC9ubDB4Ly9PNVc3SDYx?=
 =?utf-8?B?ZmNNZ0JUVytOTnVZWTNKOXBibDVnS1BEZk1JYklWNlorcDlKT2JpSlhkOVl5?=
 =?utf-8?B?QWI5UDBUbW9jR2lDMnRmODc5WVRkNTdEVTBzME9BeEdnK1Vvc2RwUTBaS2h3?=
 =?utf-8?B?YUpxbU9ZWmtLVE45ZFdNKzVXTFBKaEtvWDdpcFhsK0dZNTd5UzNWUEcvSmhK?=
 =?utf-8?B?VEIwVXpqTFB5MytzUWJaT2YxUlNaQVFoYjlvR0tZSjNqUGpYeHIrTWgwT3Rz?=
 =?utf-8?B?M2Nlb3Z3QVRJWlZ0Qk1DSmgzaDFJakt5QmlOTURkdVRpVGFJS0d1WHlCUElo?=
 =?utf-8?B?Y0ZtT3kraUQ4NHZPYXJTQ1lqT2NPYlFLdUY4MHVtTk16WS9wNVFBb3R6dXEy?=
 =?utf-8?B?Uk80T0U2bWJIT2F2OFB1SjJVUzhPcTJlTUpLdHpFek54WXN2TzJ6L20yakRm?=
 =?utf-8?B?YlRrK1RKVDltZUtvRlUxd1d5V1RTMFV6NzlZUmlvOWtPQW1SeWVnVGJrTVhi?=
 =?utf-8?B?dHYxMWhHRkV1ZUZDdHh6M09tMklMWENwYXRwT2lkTW0wZ1pqeGxJcjEzZUlI?=
 =?utf-8?B?LzBNOWR4UWcwL0FhdlFtOVgrVGhUcW8zZlZKd2cwRHBXME5VZ1pabmN0djk1?=
 =?utf-8?B?eGpSb2tBUnJVUzRGQUFzV0k5TnZEVHRyUnRHU0w5bFRuQUxYZHhQZG1vM3h6?=
 =?utf-8?B?Snc0REQxTXd5TVdkNzdWdndITi9vYWU5TVIzSnd4NHo4eis2cXFqN1paOUd1?=
 =?utf-8?B?SXdkRUtXZzg3Y2oxYURsaVVzNVVoSUVjSm5DajYvMUhUTVJ4Q0VrRjlLWXJ2?=
 =?utf-8?B?SkJsdDM1TUhSTTM3anBFOGg1SDB4enpaS0hlMXljdjZ0QndtU2NvNWlDMmdY?=
 =?utf-8?B?OGdrZEZZeUFGOUpBSDFIRFROektTeUIzT1dkRWJwQXlwajBKRWFQZjd1WGJY?=
 =?utf-8?B?YmxwSERUSXZCTnlHMU9MU2FLK291VHZySEN2ZHJ5R2lFLzVWcTVkSGZienpI?=
 =?utf-8?B?cXhVdFFKRU8vc1NBeXZrTjNBTnVUcU8vNFRmdm1mNEdQVkRwZEU2YWZQMjZa?=
 =?utf-8?B?VHFraDl0TFBuUTZBcDNKMDlmZ09MN1Uwd0IrM3ZKN3lteUFaUi9EZlNsUDZO?=
 =?utf-8?B?ZUYyakJ6VDI3T1NYU29FdHljRUxBYXNSSk9IOGFkeDB2dG5CcXhtZ2hWQmJr?=
 =?utf-8?B?aDR4L015cHJPNExhSXNaMGRzejZLWUl5KytBSGJHVlVzVS9Wc2ZUREZXUkph?=
 =?utf-8?B?OFpJaEphVjdsRUQvb1A1Lzc1ZHl6TnI4N3FxemZLbWcwOGNhU2xwVDZCcTFT?=
 =?utf-8?B?VCtHbWlTVlBIQThxZkpFWHNtdXNYR2dUa29xcDNBcnNEY1JJSVU3T09YdTJC?=
 =?utf-8?B?T3ZQbDRTdDlBRGI3UEltUVZsSUt1alJiMFFReE9hbDlYTjcwb3RjZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f123e4-9e11-41ef-b18b-08df1f05806b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:14:20.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCPNNZMrjU5wNh74Cd95Q5rkqmZ52HmTwisxG25EpGLYzS98CNBbPJ5DasrncZKrxjfwRdYHyGkHFaA9ACb0wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2496

On Tue Sep 29, 2026 at 6:56 PM BST, Andreas Hindborg wrote:
> This function returns the number of online NUMA nodes.
>=20
> The wrapper is needed by the Rust null block driver.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

It's fine to ignore Sashiko. Although, ideally we change C code to do
WRITE_ONCE().

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/numa.rs | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)


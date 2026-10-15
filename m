Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2C5275B2;
	Thu, 15 Oct 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069030; cv=fail; b=D6DkEJXi2LlUwp+n8ZRBR6vnNVvJCFqyCiFU3k1BO2qusoK7prcgsSUW9rHzn/3Owy+IQtEkgFaVhK1cKFye3RYa/SmZKXPmJDcZd7U53B7vVs1Nx40tB7H6ZWVpzVv9j4T+kl0WFrx/QJEthppWWLc2mx/gxlateiA9B6d8VRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069030; c=relaxed/simple;
	bh=pm0+3PkCiyKihpgYwBpdUWCsl8AxQnnWR7RrVhfBgxs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XqgsDvGewTq87+yXMM+aV+6HNiKVKk8C0ItVdYvEVyHzgnwY5wZg1DETSEkTSiEH6+JvQmat1i+FtwsV8Ikolp7kOa9qJ05MM3GgYhdIIOnQF7qP6a8GS+yQNad+bdiV7b8GywP4lXgGVGL7Wab3H2LbKf+yOMpyVWQF7c0UoJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CHjaooBe; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CHjaooBe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Liyi8A587deXHrt5xnpZdePmHuzO5mwSGuzq542P8sSVUyVAXSKY2Yhzhvdy64HXmFGxKDMgL7tt6rLifj/2+ZKqiNXZxmz0GIM+cWOPjjm4vol41Z3XXMGwVt3ZtsX9UJagcwQkpRpw8s3PktMVws54G/srBGh6QRzEZsxezsfAk13WDZtr/neZ11UjJRqkxa6lM3Nug+RgsjhcTqNPasZPOz9aoy4dyJ0MFL1Gho7bOqKj4LzZL2IaXYnQWLpkBqkAXQ+7K1HyZFziDnp50TKBy+mmIkRtuOGFm4K+ShWN4lk5oGgUhMT9pBv3bqbYZynmucB8GbJFYyU1s/fNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ui8jjC0KK0k4EJYgCP/hkn4UDNUjTG0C4pF1lHQEWo=;
 b=GzmtTv1SM5VqoEBB3aBxTkLFOxsk1fCwlpadGh3ZGEmJC+H2Atfn0zwrkHcsJCRdamJF922FEQsx6plEqoqmUqGmSoocDk1jX1DWPEr1RmfBaPgZIr+JLlf/S7XHa5KAYVaQnSv1gBOAXRuPBkhd7DpISxzu0BHsWWdbXrIgTvqQ5m3OTitwWRKHYs2DgNQbQZE4UodTkiGTx+TjAKecJvogB7l81fOBBBKuS8TYPYDOckLDkk9KdUQoqQVRvnNnHEs5ylOYRFiw7srdWv7MEt2UaFoHVkkkZXx+0gfJgWctmaZ6JfvSpB3skZUh9ndVtXzc1zOu1c9EtCuiNOZwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ui8jjC0KK0k4EJYgCP/hkn4UDNUjTG0C4pF1lHQEWo=;
 b=CHjaooBeUg63dLn7df+VdL3Mi5KR9mWuLMGqOESDVrfFZSeZCaHLwv1T8/MiV+JYrs9aER8H8+qJgCitlN691VpDJkTX4MRgdeeCDsAnKQILmDMxwslEfcYhBJ+PUdoxItXlbo42plIsn2V551hFCF1krGq6OM200kVTl4JaZh7BNmXxHOLRbMoWURIh81NGs7dY6IFaPkEgfPqSMiyVP9sc8EHbAAlv9QwhdyJHgeXdL7c336MqRQTXIgFEsZxPed9bQiqLpSi+r+55bxkAG5HikPdjp/Z2nXle/2nhgEawoKdFpB4pooNvLW0/l/UAC3yclA15vR0+otqa6C4BIg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH3PR12MB9732.namprd12.prod.outlook.com (2603:10b6:610:253::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 12:57:04 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 12:57:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 21:57:00 +0900
Message-Id: <DM5FG6VMG3U7.1XMZW8RJI2KLM@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 0/2] rust: add NonEmpty
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lorenzo Delgado" <lnsdev@proton.me>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
In-Reply-To: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
X-ClientProxiedBy: TY4P286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH3PR12MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: be54ebfa-c185-4dbd-5845-08df2abbcf64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|7416014|6133799003|22082099003|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/ZZWpV/QUBjxzHue5VTBR2uK7H/imFUtk+2v0+4GoL1qZEA2336/jPBKT/nNj6T2CnRhFMYHETBjlRR3+2amL5g/RPIAG25Sr3rrXJn7YRYMEu4vCYbtNjWkAf2YUqN0LABweeS2XZpxwWMAAju2JaBy2OAr0z/yL0FaVuyXwWstXuVtKZE9iCcam7NaOSfz43jGOlSzhknh2b21yulexJSYF4OR/TnE7u8pTZVUzZbEorf9vk5pt0XWIVRSyfBtjUH7BqGoMh+k75iIVko38NzgCe3LzRAGqhU2t1p5bqrwPzCcIr3DPv69kOrQ2O1yLQvYhd+Cv3JFiQuezbfzpT4zj7iSpzjVAoWvhwwegF5hKCrKkyi7vaJp331aj5OJCyv+I4bsO/v+8kdVW1XlLprdmR/3ARBr0+ntRe/s9edtMnEw1kEF0RQqADGlECM0xFFokJt0gCDEs26EqcOP4EX6JDxDMqznpMj326nSlPLboruet3dchfb/ezN5Rhg3ogwjHZUyjxTVcb7UXWHQTyy09aX88iuedFQiEXZBCTIL4IktHJOm4ZaKXYFFSGlGPskP4Ff7g42WHQu4Ctncd6AzIUECpqJLAmFBtA0HK5t9LUL39dBxmcxtxlPDKH/g92U04EJy8opTiVupYs20GlOkkDgUhwEOZONYlOGg2hM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(7416014)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmpveHNZQXloVHpPakEwQ1RTYlhldTRUano0cjd6QzJaWnZsYkFwT1o2MG82?=
 =?utf-8?B?YzAzK3lBK0dYVHFFazVNUW9LMlJKMzNiUUd3VUExdUd6dzVYSVAwZFROenIy?=
 =?utf-8?B?Y2F1ZUl5KzdVRUsvNHZFZmYwT0NjRlYvcFlKOUZtQmFoeEZiQU4yZWVWYkpW?=
 =?utf-8?B?YzhJbHZuYXh2NG5lWHFtemhsdDgvSXhIbVVxTVo1SGtTNVFyY2pXSjhFRFdH?=
 =?utf-8?B?TTA5anpwVTlqVzRUUElxME92OG9QRS94aXVSRjYwSndJWlBMYllIZjBMMy9w?=
 =?utf-8?B?YUkyQ1VnR0Y0K0REek9SY1djdFh0MVZxcUNONnczODQweTZvOCt5a2pzanMw?=
 =?utf-8?B?QWNLN25IV0FiS0IyOTd1UXVKbmgxN0pha2Y5OU1MQjI1N0F4ZTJVRzgyQWU2?=
 =?utf-8?B?Vm9jS2dlbnZ5NUNzVXhDMlNrazNkRnE3cWxEenNWSk5iTFoyYWMvK2ZwWU01?=
 =?utf-8?B?dG1ScUZ0TGp5YStHeXAyZW5qRGdpMlFxUkNpS0NDVmNRQTlGakNVekpNV0E0?=
 =?utf-8?B?MGs4NFd3NUx2cU1ZVEI0SERxMk5FY2F4cXJFNWR2L1N3QUlDYzlaWlE5TktI?=
 =?utf-8?B?WHQ2UVpvZGcrOXMrM1lnRWU3NGNuZk5BY3MvTXlTbUJySjJ1Qkd0enNXSUhS?=
 =?utf-8?B?ZkFyRUdTb09YVTF2cVU0ZlhNM2I5aU44U1BKcGxORDhmMXpNcGg1dzk2VDRF?=
 =?utf-8?B?TFRkaVNncjFwZyt4UDJlc3J5cGk1UEFmS2oxV3BmQnhpbUwrMmFtbDFsZVhr?=
 =?utf-8?B?TEZvdjVMaUNCYm15NTZmR09rT2xjbm5LLzlRbkJXRkJVb0d2T1lqMkVQTURu?=
 =?utf-8?B?aFdLeWxTZW8xek0wQldYZUZpazVObVhpNm00eGJ4Zyt2cnhNT3VmTXhVV1F1?=
 =?utf-8?B?dTFZZExiVFBlRmVRa0U4cXRNZlFadTgzL0xMb0U0WG5qVkJyamR5QU12Nloz?=
 =?utf-8?B?dHpTRC9YVnk1b1VhSENnVlZFa0pPSytQYzlWSlQ3bU5qcEJxNHErMk91T3Uv?=
 =?utf-8?B?ck9OY2ZYL09pTkpTeUx1aTdUUHViYnYwZ3JHSkVQUWlmVThpWVM1M2IwakMz?=
 =?utf-8?B?WDVxQWlxZGdFOFErNU12N2FxNlFVR2puZklVeE1nVUtkR1ZDeUE4QlpLZlZ5?=
 =?utf-8?B?TnhIMjZWd3JJcjJQUjBhVktvMFJ1YzR0a1FuUGlKME5vUGRvWFJ0ZDYwYTlK?=
 =?utf-8?B?eU5FK1NXV1Y2blBMTzRSK3RFZDNDd3FXZFAxWW1KaHRyaVpiWXQ1QTVXOWlM?=
 =?utf-8?B?T1FOU1k2RVYwMVBGZ09uMDM5U0JFZjZ6eGJWeWNaQXZzYUlHcjhzYktJangw?=
 =?utf-8?B?TklRdGxwYVZVdDZ3c0dYOExVUG9odHBmMHRFMHhLOFlPNkliM0FCcGZ5UDVh?=
 =?utf-8?B?TkRGd054V1ptL2gvc0NKNW9kTllTRFZYV1VCc0ZaWXBMV0NWZzZ0WkJUWFhu?=
 =?utf-8?B?ekZuOEkyQ1U0azNJMERhSGFxREhGYzNDekY4VGMwakJ6ajRrL3lOSk1XMkpR?=
 =?utf-8?B?QUlYa0E3TURkVmRlM1NyRjZUcjgrY3N6WlF0OEQ4MFNlRTdvdC9NNzlKSG04?=
 =?utf-8?B?dHpXVUM5S1A4R3UzbE5wR3hPbG5xS3B3TXNjbUYxQ2xtaEIxbE5XSEo4UFcy?=
 =?utf-8?B?bzgwNkRmTWhkdmd3M28zZ0Z5NzJjTWhGYmxTL21ZSE1ubDJRY0hDYTdSbmpY?=
 =?utf-8?B?RnFDb0F0WDdaU2tIS3VMWUxPVVZwdXNlVzlWSGthbDlhbDVabmJUdlpsWHU3?=
 =?utf-8?B?dEwvQStsbGlmRTBZM2pnYzg2aUxYZFh3RHZrTnBOR0NpcTNBSUFBRkE2ek5t?=
 =?utf-8?B?RkEza1FGWUsySCs1S1h1di9IVm40bzlUeEpQajFyQnF2VWNOd0VwbnRkRE04?=
 =?utf-8?B?SEVoZ0JLZFFrZExpa3R0dFJjQ3ZwbFA5b2N6WHpycHZRUXpPN3hMRjRTb0NE?=
 =?utf-8?B?VUFJeVNyNXowenNBUTlOVVRhdzE0OVRqTWJ6UC9Eem1vSnRPamY3ek52aVIv?=
 =?utf-8?B?T0RVZHltbllFWFpBMEphVlEzZDJORWFDVktIQ3p2TGpzMVV5YWNxZGtiSGpn?=
 =?utf-8?B?VW5wOEZsR1I3L0FXbUxyMWovVUtVbThaV0ZnblJjZGRnbWw2cGZuZm1mMHpq?=
 =?utf-8?B?TThybGNDZGttcS8rdC9UaUVWTFNyRXp3Z0pjMTB3NS9JcnVYdHlwaHA0enVo?=
 =?utf-8?B?eE5ueHlkZEdqSlhUcGtwb1N2ODB2RWdVOFVBRzhzSyswdUJnS00vWU1pZ2U5?=
 =?utf-8?B?WnF2YWtjeTFGVE9VcjlLY3N2MWpjdmkxN2RsK09Lcm5wOUtNWEJyRzEzQVkx?=
 =?utf-8?B?WnBOamhSbnk3L3hkdnJSWEtFai9XK1hIbCtPWkE3eTNrdlRVakcwNFV3RlVC?=
 =?utf-8?Q?Mea0OKGIYDmEsmVBiRx8YOmiirqy4fMDK0DRhYAJUZLXK?=
X-MS-Exchange-AntiSpam-MessageData-1: 9+HQ0m9qVg4yYw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be54ebfa-c185-4dbd-5845-08df2abbcf64
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 12:57:03.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fSD45cN6FOI7Qih47PIWVAX4E+z5GVoX6op8MiwFs6Oq2y4pKr2g44ps1ED2LvO9iY0CsjKXN9h4P1fN3dmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9732

On Wed Oct 14, 2026 at 5:30 PM JST, Lorenzo Delgado wrote:
> Some functions check that a container is not empty and later rely on it
> through `unwrap_unchecked()`, `unwrap()` or an error path that can't be
> taken. Gary suggested a non-empty type for this while reviewing Thorsten
> Blum's uaccess patch [1], and Miguel filed it as #1262 [2].
>
> Patch 1 adds `NonEmpty<C>` in `kernel::non_empty`, with only what the
> first user needs: slices, `try_from_mut()`, `from_mut()` for arrays
> and `last_mut()`. Patch 2 makes `strcpy_into_buf()` take a
> `NonEmpty<[u8]>`, which drops an `unsafe` block and the `EINVAL` case.
>
> Some notes:
>
> - `IsEmpty` is a safe trait. Unsafe code only relies on the
>   implementations in `kernel::non_empty`, and the docs require the
>   result not to change while the container is only reachable through a
>   shared reference. If a generic accessor ever needs to rely on it, it
>   can become an `unsafe trait` then.
>
> - Since APIs aren't added without users, other accessors (`first()`,
>   `try_from_ref()`, ...) and containers are left for later. I plan to
>   send follow-ups for `net/phy.rs` and `scatterlist.rs`, which both
>   reject an empty slice and then rely on it.

Having `last` without `first` is weird. Please add the minimal set that
makes sense from the get-go, these are `pub` anyway so clippy won't
complain if they are unused.

>
> - I put it in its own `kernel::non_empty` module. Would a broader home
>   like `kernel::collections` be better?

`kernel::types` sounds like a proper place? Or if we want a dedicated
module, `kernel::slice` to match the standard library? `non_empty` is
too ad-hoc and specific.

Also as a general comment: the commit messages and comments read as
LLM-generated and are insufferably mechanical and tedious. Please turn
the LLM dial down a bit and spend some time writing or at least editing
them yourself to save some time for your reviewers. The doccomment for
`from_mut` is a good example of something that could be reduced to 2
lines max.

Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA983469F6;
	Mon, 31 Aug 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138511; cv=fail; b=dw/GGbcaD39Ev/4ubquiaBvMVVPN/VEgwh6NWZLRWaXJMzfTERGfzn98ygXtYKvn4uX+cAYBRjhyDz6IiWiotT08KJexjlYGKj2tvbRewjZZhscrX8fj1ovEcciWocQa6Sn9minqGw8J06WB2BlJCzryC67f3ajKvJEqD7kq0Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138511; c=relaxed/simple;
	bh=b4dJzq0FtbUP1RtKQ2QWAz4QEe0D7a0c+gdqZJrI7Qc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=XmLDR9+24an9rwojfiBF3462a9P8pWf2GFToBZRwWc2tAUh1vg3udvmbwssAf/52Wy1biBIv2soy1fhntXFn5d66e+m0DlwziEl9qugVHqBBQLV0LK7t8LF9Zfrzq9ystZUgeUo9REcxI3sivG2XDS1h9fNnADg7K5QLH70b0fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KuBCaYb0; arc=fail smtp.client-ip=52.101.85.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KuBCaYb0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btx7EY0tVkTzP2qvjIF2axo56xdycey/GlHl8CGq0C3W4nDdIZEipkaYz9oMXb1iJ+5Nfz/tuYuQQSIJoP2C7UnXk8GzDi3NgkW+G4EFKS6tl6hVrA1zGzzBvnCsh1XonzvgPMoe5SfeteuiB35QfhaNpZ/LXabCRtm3/L2sOsfOvRnOFx4SCHTWDE1EzVgzIMXSCTg8/RShnzdq1EryLTFCyJ9x+wrlbS9A3D5cg9SJExBWF1FfmuxY8i9tABbf4msc9TpA7aNBF3iHExaHdipUik7r1dNURnXXiFBjwnMFc17SAkPeI5YZQK12iyjraO3IgnyvjXO0jAy065ZNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roQGcIzrlrmBMD2DXnJcD0lRgqiunqnCJ3Fg5/Do6hE=;
 b=oElIryVntDNKshkvUk0YBKvKtHL3UjcI88ttInmtGDVJ3zKyixKlWh14UEgn6eBL08ZEUz0DLLjHCzXhIKaJbhuSi44FWlXchUAHAwPjEf67XkafbFl/g4DHEJjqHZerBZSyr1mxoLpWOLFwVrM03cjxRrCbZfQq2h2Wd7/OweuUjTwiEHVTLbXhvVwNI+YqrupNNFLwTqah4PLvG7czpj9OpnPaXR2zCSQsOr1Ao/7DyGdj89geTe/b3xqrdNstow1qJe3ny7JMVT7j5ZkqDCdr9fMxzjvNkOzKBeX9D6yzoB8ADR96bFXCGWCrZU7R56QFqv2sLXfGxKXGlLAuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roQGcIzrlrmBMD2DXnJcD0lRgqiunqnCJ3Fg5/Do6hE=;
 b=KuBCaYb0YCuhtYLd2e62t+ejywp4iiqIi1IoYtIsNr4EaRXCuVpYV0hD5lpxZuu6fS/ZZI4WXhb1ZWqF7+qKjpzbmOenQNEdfR93zcMow/ECwM4EHnpDok6d6N9dUuuLWkSlC/rGrWuTSUoIv00BRRAmkDlqpsXsCXMG14AKp6Ggu52/RvD+f53IFRCF/7x0s58P/7FSKdwTGd5/v7vChuhTaZ0nMWme7pkxA98/r7VrAZwxC5pwbeX7QNdto1h43IyeJiVwseDeYs5J4EMn8x1UD9mtIyAgpJgB4dZ3KsJpM6hgxNo365dv8FQ8/w6Wg9kj6XiNojWLIH/5sECTVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 31 Aug
 2026 01:08:26 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:08:26 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:08:23 +0900
Message-Id: <DL2Q74BUEKU0.E9R7R2PW7F65@nvidia.com>
Subject: Re: [PATCH] rust: id_pool: document panics in `find_unused_id` and
 `release_id`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260829153442.20799-1-georgeandrout13@gmail.com>
In-Reply-To: <20260829153442.20799-1-georgeandrout13@gmail.com>
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbfa8f0-b58b-4882-b957-08df06fc5c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|11063799006|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XLcJ82sIUu/RjTXRAacEyoHzKxjDXZm3hoHSyvN0qBUnb/uaUKVlH5TE4XQ05OvegtDtP3CBY+yU2j909LXPxyzLKhCOcxmlmKxLMlw4yjxeGBzXbvoV5SklqOL1Au8bNBQPqR3MAtBbrZVt7ekPUvURPqNeQ83FmPBkYni5wheMkIMmTcyuUIy1OBDZS2xB2w/k49WnNnA6ypF+90UUDtNLwUkVLbugt/WZWws/GLnT70J/71zzaFd0MYRVhd7bNU63nMoVlvjPw9djEsiKMiXaD2Dlem9DGvUsSZEPat5oebxAbN+x4TErMAveTEBhy48PABruvKgEZ/ZTNVbFZXC4GF2ij26sPE5vX+WiFHkF9AG8Y2axMBl5MPrXrZIKOs20z+LvCkgPjL+zWgYVX8Dg7YhycQIH+KTWAQ7rRIv6vn3atwpa1jZthOFWz9WTtIiZbCwHx5zW8LIMal8lBv1cGe2596+lXYv/yMK9NgQx2DiRTQRSj2gD18XKIg1fWs7u5UK/kDT4iPU1FphBxx/RoGZNkbf4P4/ye84GvmpwmluX2j2jat+Cl6b01npoCh0SQ2jp47MgRqYEv8PPdFGOJBSMosk/7QiYVemBAY0FP/rYjfH6QTjKF3cOh9evIB6Q+zYeh3fwKcy840bDVRmJ5V5QkT8AYP2K2zMuUP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(11063799006)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm1BR1lDNGVSSDVGdFNEMnFIV0RVWlVnUUdFVVNRaDdSVmlhV0dlUjIzNWkz?=
 =?utf-8?B?Y01ia2tqV1ZFa2hLNHJJLzdaYkRlN2VJNmlBcVZ3OWd1NEV2VW9ka0ErUHZQ?=
 =?utf-8?B?dUpUUzcySThxcGdKNzc3UXdrNW5ZWWdIV25XdncvbTN5Q0xLajNjOVVqY2Va?=
 =?utf-8?B?SUNUb1lDUldjSE1oYnB0YzV0N3puMXAwYkY3Sm5YV3VPOG1NYit6ZlFLRUVH?=
 =?utf-8?B?OEJ0T3FqZzlOZG01Q2p0WXpiVUtCenZFa3FDVGcrbmRIR2NzaXZWY3dna015?=
 =?utf-8?B?RTdsY0JvTUVON0phd3NIa0VqNTQzZ0RJYjUraDZKSVVEcFNrc0xodEhSSVFM?=
 =?utf-8?B?NC9hcS9NbHQ1V0QraVVGZ3VnZCtVUzdzY3B3b3N3dDBNVmorcTRKNjRKQ0xP?=
 =?utf-8?B?bWxGakV6SUVqOUZRWXJuMmJadHBjUzRNK2RRNEZ0QzY5aU00c3dkSzlvd1lQ?=
 =?utf-8?B?YXBCZ2JncU9xNWdYWGFYenhrMXNqOVRlTDl0ODBWODlHdFc5M2gzdytKTW16?=
 =?utf-8?B?c1hmbitvZU8wQXpWRjBhL1Y0OHcyY0haU0l2cUhzV1lMZjZzdUxxdi9Ebkl1?=
 =?utf-8?B?L0xWeVNUcDJwU0dDUjh0MVJyQ09OVzg5NnZUc2NZbzZwMjc1TlhWcXZlVVN5?=
 =?utf-8?B?ME9JMzVWQWJ5cGNiaS9MYjd2Mm9qYnprY1dRQjViRmNBSHBBaXdOVWdTWGhX?=
 =?utf-8?B?cWZyc0tRY0hxZE01Rkprc2s0VEc4Yjk1dGpQSVBseVpyNENndmd0WEVhOXpi?=
 =?utf-8?B?REtPVjFDVlpWQVVWYjNBKzEwRkpqSGdiaVd1YWRhMklJYU9lRXFEZTAxQzJR?=
 =?utf-8?B?Ylp1d1doMkYwTDhZUVpZcTdKdndMODhabU5OVTVPZHFRM2ZXaXJjSzRCQ1dl?=
 =?utf-8?B?NmM3dE5yREllTXZxV2tHQkd1OEpOWjNXZ01wOVlUSGNVWWxVY0liN1RLL1Jq?=
 =?utf-8?B?QUhnZFZLQS9JQkM5SlJBSGJZT2dYQVJlNXdoeG1HNUQxZnZJUVlNZzlwQ0RN?=
 =?utf-8?B?YXNiNGk0SG9PNGpRT2NMUWpBZGZ2MmFvMmNnUVBZNWtNeWswRHljZ0Q4TEZF?=
 =?utf-8?B?eXU2RkhtcVdRU283anlkRC8wbmd3cUplcHlBQi9BZUQveS9Zb25ZSVpRKzV3?=
 =?utf-8?B?dFB3TDllMXVNajQvQld0MFlPcWpybGVSWmNvSnlNdExzaks0b0pQc1duMWIw?=
 =?utf-8?B?RTZwZmdWVjhWUkJJektkbjZ1VFpOR1ZHVEtsd09MK3hXMm01ZC9yTHVHS3cy?=
 =?utf-8?B?NEVJVHpXeVk5dUxDd1l3VnVvSE8rN0tsc1lBTFAzMDFGc0tmUU92WG9VRkZ0?=
 =?utf-8?B?eU45OHBXaTVodDd1WW8vR0ZqTURWWXQ4bTcraHZwMUlLSHVBbjdnOGhYbnF0?=
 =?utf-8?B?VG1PdnBqRU1JNjJCbHNLdkZTREtrVUQvb2hvb1FiTGFjQlFsYTd5b3RYK2do?=
 =?utf-8?B?MVlGbEM3dHR4eU1ObXFKRGYwYzRQenZXNGVQTDdVdVhGVlJTR3hVeWFnVjY4?=
 =?utf-8?B?eEh1aEZaNGJRTk1Gdm9oOGRNclR6VE55Ujlydm5rWWZWdW9kRWhzTitpcmJN?=
 =?utf-8?B?R3JNdlUyazNQUGRyUEVPZFlGelVsNUVTaUZLb0JTQlpacS9pNnRSeWpscmRB?=
 =?utf-8?B?dmttWVRrZmNQWjlxczc0NlF4Q3lZRjBUbGJUN093Z3hHMngzTFNtbFpJL203?=
 =?utf-8?B?cDlFU0tWRFhVaHd1dW5Tb2pTakdXUERrSzVkdHlrejBySFpMa0x4a3dTZVBC?=
 =?utf-8?B?MXhOSkF6aEJTa3A4SXF5ejNMeDBaT2tXZHE0UjI5MXJSQjNsaUFtcjBXVDhy?=
 =?utf-8?B?ZGZZakxQTWd5NzMzQTJ6TzVZdENWaWJNRnhvZ3J4VWVWV0ZuK0JOWmRlV1Vp?=
 =?utf-8?B?aGR1d1hCRzJCRisrSDgzNER4SVZuZDhDdDJWR0pNRjVSR2ZpUXY4eFkvVWRK?=
 =?utf-8?B?S1pYd3lJVEQ5bE1TYUROTnVBMmEvT3Y3eHA1UUV3bEVNTGVwdFBOL1diL3hy?=
 =?utf-8?B?OU9aVk9CbGNvL1JpenkxNm5mVWhPNzZUWW1xcklVOHRVOEc2MGlpSTRXSjRM?=
 =?utf-8?B?dXRYNXZRazJWRUxsSkJwQ3NSSW1mYWpJa2pxUzZ3djNTRkV4Y2tMbHVTMmVs?=
 =?utf-8?B?VWRwcExKcFhHckR5MnQvVGxlYU5Rby9nc1hyWWRNTXZJaFhlQ2hqdWw0U2c4?=
 =?utf-8?B?V0pObmVKZ3JQdWo0MzU1NGF2cGcwVVRNbkxnTGFON1I3SEt4cS82cXpGVmw3?=
 =?utf-8?B?K1AwUGpXa3ZDWmZmRkFBbWVvV2RlNmNTR3djWWpUSTdLemdpZWNHWGRTRUIx?=
 =?utf-8?B?UzVFWnZPZFZRb2FhSHpHR0FjSHBlbUh2Q0JBcHNXN04zQ3ZWSENaM082cjdS?=
 =?utf-8?Q?Hf09HS+jZdpW7+mX8x0X+H0mwJBjz+aAHvJzQXUlj3Nk7?=
X-MS-Exchange-AntiSpam-MessageData-1: Qip2pP8XEPiJ5g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbfa8f0-b58b-4882-b957-08df06fc5c91
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:08:26.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIPWOnR4JTRXD1mU2Ebby5thth/816b1B9vWp5/ylHSOWidSr7hB3iLhbUEJcgNZIWL/2OKzzfghTykZjDHGfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On Sun Aug 30, 2026 at 12:34 AM JST, Georgios Androutsopoulos wrote:
> `find_unused_id()` calls `Bitmap::next_zero_bit()` and `release_id()`
> calls `Bitmap::clear_bit()`, both of which panic when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled and the index is out of
> bounds. Neither `IdPool` method documents this.
>
> Add the missing `# Panics` sections and state the bounds requirement
> on `offset` and `id`.
>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

One small nit below.

> ---
>  rust/kernel/id_pool.rs | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 384753fe0..ae6960d7f 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
>      /// Finds an unused ID in the bitmap.
>      ///
>      /// Upon success, returns its index. Otherwise, returns [`None`]
> -    /// to indicate that a [`Self::grow_request`] is needed.
> +    /// to indicate that a [`Self::grow_request`] is needed. `offset` mu=
st be
> +    /// in bounds.

s/in/within maybe?

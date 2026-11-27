Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811799;
	b=LCD1ZLF3hDUi6WQInS5wJCerE/GFSlumxFInJkF5OmsI1kkjasuJOxdSR2nfHFsn3ZBz
	 NFIR+ewPmQyeEuwd80QpmiqGsY3WgqVyntcYiHqiCW5Aolol6LQ2hYfRLBDM5NQgurp4S
	 FucJvwy2+/Rv6xcCCMSAt3o1xVuuyqorgjuwDJ4FttOPClQWJ9XhtIfrZgLhaytdRQ2y5
	 SnsPcYPDcv7uddcqeC1ZXlbqVZtGZ+7IbGyJ3IwpRmxzOhT5u0tYavlnJND8tnDGFFuAV
	 BHLyeWxNYNQvLZ8DHuQxM5hqDCUK5Adjqv9MGrIQC5eC8cg4SClK2hzygYbBCqXvBQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811799;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OlIevPQ6Txo5NsWq/uytrdKSgd/HSFB0xys6t2y1aaU=;
	b=qK97cadtdncq9f8CjadnPxi/J4m2BN415cX8GnkIugilSeW32UDxYd/yP7Homz9Z1q/S
	 b3Wf7TR+3KZb1OsAxU3Z8cdj2Odku3PjJxuy2A5sq2XAZS2ndLn8PwkZ4Yl2uGZfOs/3r
	 PQTpLwvC2M2qkQyovajVPWOw2c0ynfpV0djcqJ6L+FU8+89XOjuhqdw8VL12JxW1Y47cr
	 CDPjStPZfkVdS1SvuZI4g0fB8b/0zv9wJ6aisT99mXmIZyWwkGfvfWOM5B3bzWRvuExHU
	 vaNYy0c2hDdfzQq8TS9xL4b4HxnUa1oO8eUvvFJFKz2hBaYwFYdBvAh4Zm1bMhkSHjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OCUw8XUy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.40
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6531606A31E;
	Fri, 27 Nov 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6531606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OCUw8XUy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biicjv9azyke+3qsUjclufiTWYlIhrG9w7uNOuqPA0uHicqE92Jcgx8PZOCG8lGwFcIzJeNKBbsKvqxtejSXcWzrxM4zDqdLeNzsWr2IbszVv968cX5B+jk4xN7fBvcrQ/UFaw6aXmrtt9WkItXxxr0PLFXb8zGeHtZDUZZlPHwAOoY137Vya2LuqX3mvMeEjXfvcp8lrsuDOPk1etg+eJ6ecDDo4U8r51v0x55CrvcMk2cOFkzQC4AV8EZfY5d736dwSjLCBTH08cAk36uwfhLd90ubDo8qLf5KVycPThiWkeGSv/Ze8zE5pzX3hxmO95qUu3cON+ukXYB3bKio8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlIevPQ6Txo5NsWq/uytrdKSgd/HSFB0xys6t2y1aaU=;
 b=jAAWuAhO2QoERXUZ9+JksXrlPEzsjmrszaugXBOMyWpp9NgiFKvDDavXvUKue0qkYzoO5sUjs88AC805XXMYx1jSg1mzfXS/JYY1urcSS5hDoNbT9aruL0e9B4CknurI8b3avw+dgbaZzAvet9LWtqr6RPUh/VscJh5YzztOgjm0fcQTOxUbnlvz+qH2FwV+sb6BDn1opMDzhIv47HbbujtzKYXIXWsppXf+hFbkyJ7JtI1pJqOAQE2zke8mVP6zjmdRFaKWkaGA17Zwqp1eES+5sPOJimNw2WiM2V6tuuzRSo/TJE/H8i2xc9FwUFlIyM4p6PIC8VVPXMc6ifV8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlIevPQ6Txo5NsWq/uytrdKSgd/HSFB0xys6t2y1aaU=;
 b=OCUw8XUyKV+/FxKOA3d+HF0/mInigjYj2yhC0AfMs/qixclXufU0g8T+cXH+7o17L50NQPVqRrAs2yL27jTjWQxExncE2QcGrnwn+NT63p2YOqRjjXAoUUL3xmoKu18Nom6T6HH3wWAbLjjyiOsSvFRCI0fx+3X0mDjBAxJ2ERX1BIPMYpsFhgUNUmbRxYFpZbPPKUuxh75VKPs9389+9NOW/KCEwSGpYGSOCixmqbHInjLUcMBoxnbo0j08/054t9EaklVDEasqVA7y2YKtv5cTrInJ6HiKesG9EH1bpkyJnDrUEvNPj18mnqzd5f78AWFcynv+27UoG9QdWPkaIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN6PR12MB2814.namprd12.prod.outlook.com (2603:10b6:805:72::33)
 by DSVPR12MB999308.namprd12.prod.outlook.com (2603:10b6:8:423::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 20:36:32 +0000
Received: from SN6PR12MB2814.namprd12.prod.outlook.com
 ([fe80::9a18:413c:9702:8f59]) by SN6PR12MB2814.namprd12.prod.outlook.com
 ([fe80::9a18:413c:9702:8f59%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 20:36:32 +0000
Date: Fri, 27 Nov 2026 15:36:29 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: bitfield: add conversions to Bounded of matching
 width
Message-ID: <awnpzRnd7EF1PC_x@yury>
References: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:208:32a::9) To SN6PR12MB2814.namprd12.prod.outlook.com
 (2603:10b6:805:72::33)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2814:EE_|DSVPR12MB999308:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4d2fe0-3130-44e2-af07-08df4cc61ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|23010399003|10067099003|56012099006|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	JFv65M7tsiXsig92mSz7hCkKVYkdLnCun/gL2VNGxIo4m9qMbfNar8WibontMGDihVhKDKp3hIQizyGA73Ud7zP0JwdBTsMEezjJ7mMOs0BnIiwY62Cm1JhrDNVyy8HrQh6b6MhmSF72C8evm5C+5ywf9WSk695rCeNFy6ovXs6EmD5V44QZ9G1sA+3d43Dv15oboPxkdL+EcSBepAKv4m7Kdww4IfoDzosVsJMam7xpd+Z/4K63H5kdKjzeQDkh+OCiIPmUiKOY7PR3mv2i4NdKK+TipedhQNfiACkI/tjElDAXu2sRsIuf1XOVGZ0+Usk/xOMl8t5/892i50FCToOCg/8aPhvdBaZ8XOJEcn5BzW04HGYuvjfc5e1CKnDGUtIFqJFoShTjbekGk3eWgyG8ct1bj/R+3cLhgmGMLbB8r3qzgipR3VTkFwE9DA9B9dojjBuvWNw97yls1ZqH0ldO4TYdvb/mwzX2B88sBPNE4L+nVP+wkfTtg7/PkZqVKxQPO62UedqvFqsukpdMjuSwW+/K6EK5nPFFC5UichZEyunnMMc8ll84XpCcfj7ULYWvpovreA/yRKiAhP2TLsYmBrXAd8sRwaZ7DewBirWquyeIGauLVJFGtrDAkSGCNe2y5pLxlMVQsVSu2cYZ17xFBTNhycilbuzZ75RonEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2814.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(23010399003)(10067099003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rTRPPOTAqTrIxLQVT5oEn70Xx7TV2cWkKib6YQE8F2aWMr1fGFvyIa2Dp88n?=
 =?us-ascii?Q?qYpN3w2MeCrxJ4/jvy0z6Og2uwODdv/L+s8/vuNsWJiQ2QOVME4Bioh1ugkC?=
 =?us-ascii?Q?KupEL2etlg1/pplM7azadx79FcvEFxSZCn0M7qjz53Tgfar+3bIaCPi0ukO3?=
 =?us-ascii?Q?gY8qXO/TPTdnKDa70q322hO9IMMMCGHwj9v6vGPyPym5V/uIZHAnE85ffKV4?=
 =?us-ascii?Q?8d93Sl+cdtTRli42x0qdD4cHGvv3O7W0TrC8EZQR7V1C5PbAr/U3hxTr54kg?=
 =?us-ascii?Q?dZOE8y7z5SPR0w4jIPTTvcO3oys8twGM1lFrmQxqN24xZ6RRrRkXPKyIj/XE?=
 =?us-ascii?Q?ZLq8wuDrHFNHYn1wpj/hLbftF/WSTiC/rTI+1x3RF8BtAQXI4x7eTBB3y1rN?=
 =?us-ascii?Q?NfQhFnnL2h8kRTJhItPO4z6EUnQ62OQRJLhA9q+D6nXlIXl5CMFOYmwXKnbz?=
 =?us-ascii?Q?MAXNAkmDArVu6z0Gn+9MLdnYCqenFQixev40siEw5XSMPKWaSp9Yw23dN1iI?=
 =?us-ascii?Q?67hcJyFYNsl6zQoq2Fp2z0TeT1B0B1gMaaFLiDq2jBkcKG/pp50YxndLRpYl?=
 =?us-ascii?Q?ciPj7mawUl3BD33Mwy3jDGbIcdWyJ40GvLg0vTd8h+CD9cNOudbjsNETcpJ8?=
 =?us-ascii?Q?O3Yd70r5jRnGBlMN9CZRxqPg3g6KEuOf81jKt9NR89a2tMQJmrHQSUXHhkHe?=
 =?us-ascii?Q?5+Z7gEjlaWzKX4hLgb9xi4Xk/eqe6FY3hRzJuDpg6xXNEk02VJtBsHNKDYnQ?=
 =?us-ascii?Q?TmCXFg+GRTpPmUulLUujgcnX/I91EgAG6QvUTtBQP7uRl0J4btMBULjUuOsw?=
 =?us-ascii?Q?UNruYpsPqYBioDbWsaUE9BEu7Drb5D2dWzdd30eVrdMUanaqs0OAnL/kMtzz?=
 =?us-ascii?Q?sg0RszYYHPp5fi5pb+6tRatAgmd/NTlzshv3X7cI8IkrmWDJ6M+v627WiyQ3?=
 =?us-ascii?Q?WpMLdIUw2FBZySpEgBJm9fKPP1kkUF93YljV5yomhe8+ABcvvyDkKEAU5+Hf?=
 =?us-ascii?Q?8xizLyEVVslgbU7FgTso/nlYuihWBBucYnIPWZbp7so6f8DY6zisA+YYw3dE?=
 =?us-ascii?Q?2sRQQER/0EYOZOwBSiUMuulkKqkI3bFgBcZn6HkVfd3G9SvLuX4rin9+gAPR?=
 =?us-ascii?Q?KYiADzba6JlcXb8hJK8Z12XPHftCXFvxTLQNBOC08QGuQNw+mdzrqJXe5UuF?=
 =?us-ascii?Q?+BcVCUJeT2B6fNRDTxZkGK3GC9/8e0FA1Ogf9DtkUtDD1WSWsBECd9Xe2Cua?=
 =?us-ascii?Q?OX5DS7j5NEVap3vtTX9GedvJxQiCjlXAnqVsKOWvVd62hxsCaLgdHCxiJV/d?=
 =?us-ascii?Q?O2Fi52or3ztDjGGWu/1paJTyXO1a7FZ8/58eFo1rydrVFKzP19fvKODGPId8?=
 =?us-ascii?Q?st2sbyRwdgfh7QSkdTsazptcXvO0GkUSxxP0DuKX9a+dS4rIIiosrpngP8ee?=
 =?us-ascii?Q?RNWXoe2gsqlogUzJlCc/1+BmbEh5Bw2G5kPIC0MBec1B/MUOwKduVpWxHN8n?=
 =?us-ascii?Q?HghKV1TqAJoiZd0tgHBw4yJRyFkyMbc7pWD7qjjeKpAEhdmBjpSb+NyY8CRZ?=
 =?us-ascii?Q?dbk520KIUKczQgknU/IjFxxfi3MPtU8M/RvbsaDOfrSyE4kQ3hMfwWPoiKoK?=
 =?us-ascii?Q?KviirGDyDvpUhy676Q+nGecu/P5U5dgOtRYmWjWFOKST3aQ6y3tBXI2rS2mD?=
 =?us-ascii?Q?+m2xzjm1kc/LLml/AVW3XXxx9cNOlLAlSMOpjQozYyZP/+Ll5M2YxndDuAqo?=
 =?us-ascii?Q?KeW+BdGbttas6LM9YrsaNcs0QuPn1/2I43+dQQN5/eK19uR7M1GZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4d2fe0-3130-44e2-af07-08df4cc61ecd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2814.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 20:36:32.0492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwsb0M3haVofMPtg5uSEFsE3mAkMh5O/4As+pBvgfBz9vc7GL7sHcx12HEWPpQtj99heV9wx8ptwlR4o0ckBXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999308

On Fri, Nov 27, 2026 at 09:05:40PM +0900, Alexandre Courbot wrote:
> `From`/`Into` implementations already exist between a bitfield type and
> its storage type, but these are not enough to support nested bitfields,
> since every field is a `Bounded`. This resulted in some ad-hoc
> implementations to enable this kind of declaration:
> 
>     bitfield! {
>         pub struct Version(u8) {
>             7:4 major;
>             3:0 minor;
>         }
>     }
> 
>     bitfield! {
>         pub struct Id(u16) {
>             15:8 vendor;
>             7:0 version => Version;
>         }
>     }
> 
> Generate these conversions automatically through the `bitfield!` macro,
> as these tend to be useful.
> 
> Tyr had such ad-hoc implementations, so remove them to avoid conflicts.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> ---
>  drivers/gpu/drm/tyr/regs.rs | 30 +++++------------
>  rust/kernel/bitfield.rs     | 82 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 89 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 69c901afb28f..0392869adc5a 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -1150,20 +1150,6 @@ struct MMU_MEMATTR_STAGE1(u8) {
>              }
>          }
>  
> -        impl TryFrom<Bounded<u64, 8>> for MMU_MEMATTR_STAGE1 {
> -            type Error = Error;
> -
> -            fn try_from(val: Bounded<u64, 8>) -> Result<Self, Self::Error> {
> -                Ok(Self::from_raw(val.get() as u8))
> -            }
> -        }
> -
> -        impl From<MMU_MEMATTR_STAGE1> for Bounded<u64, 8> {
> -            fn from(val: MMU_MEMATTR_STAGE1) -> Self {
> -                Bounded::try_new(u64::from(val.into_raw())).unwrap()
> -            }
> -        }
> -
>          register! {
>              base: TyrRegisters;
>  
> @@ -1172,14 +1158,14 @@ fn from(val: MMU_MEMATTR_STAGE1) -> Self {
>              /// Each address space can configure up to 8 different memory attribute profiles.
>              /// Each attribute profile follows the MMU_MEMATTR_STAGE1 layout.
>              pub(crate) MEMATTR(u64)[MAX_AS, stride = STRIDE] @ 0x2408 {
> -                7:0     attribute0 ?=> MMU_MEMATTR_STAGE1;
> -                15:8    attribute1 ?=> MMU_MEMATTR_STAGE1;
> -                23:16   attribute2 ?=> MMU_MEMATTR_STAGE1;
> -                31:24   attribute3 ?=> MMU_MEMATTR_STAGE1;
> -                39:32   attribute4 ?=> MMU_MEMATTR_STAGE1;
> -                47:40   attribute5 ?=> MMU_MEMATTR_STAGE1;
> -                55:48   attribute6 ?=> MMU_MEMATTR_STAGE1;
> -                63:56   attribute7 ?=> MMU_MEMATTR_STAGE1;
> +                7:0     attribute0 => MMU_MEMATTR_STAGE1;
> +                15:8    attribute1 => MMU_MEMATTR_STAGE1;
> +                23:16   attribute2 => MMU_MEMATTR_STAGE1;
> +                31:24   attribute3 => MMU_MEMATTR_STAGE1;
> +                39:32   attribute4 => MMU_MEMATTR_STAGE1;
> +                47:40   attribute5 => MMU_MEMATTR_STAGE1;
> +                55:48   attribute6 => MMU_MEMATTR_STAGE1;
> +                63:56   attribute7 => MMU_MEMATTR_STAGE1;
>              }
>  
>              // MEMATTR is a logical 64-bit register, but it is laid out in hardware as two
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index 8d7d78175336..f53001a41731 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -78,7 +78,8 @@
>  //! every value assigned to a field. This ensures that data is never accidentally truncated.
>  //!
>  //! The macro generates the bitfield type, [`From`] and [`Into`] implementations for its storage
> -//! type, as well as [`Debug`] and [`Zeroable`](pin_init::Zeroable) implementations.
> +//! type and for any [`Bounded`] with the same number of bits as its storage type, as well as
> +//! [`Debug`] and [`Zeroable`](pin_init::Zeroable) implementations.
>  //!
>  //! For each field, it also generates:
>  //!
> @@ -249,6 +250,37 @@
>  //! assert_eq!(Config::from(0b11).mode(), Err(3));
>  //! ```
>  //!
> +//! ## Nested bitfields
> +//!
> +//! A bitfield type can be converted from and into any [`Bounded`] with exactly as many bits as
> +//! its storage type. Thus, it can be used with `=>` as the type of a field of the same width in
> +//! another bitfield:
> +//!
> +//! ```rust
> +//! use kernel::bitfield;
> +//!
> +//! bitfield! {
> +//!     pub struct Version(u8) {
> +//!         7:4 major;
> +//!         3:0 minor;
> +//!     }
> +//! }
> +//!
> +//! bitfield! {
> +//!     pub struct Id(u16) {
> +//!         15:8 vendor;
> +//!         7:0 version => Version;
> +//!     }
> +//! }
> +//!
> +//! let id = Id::from_raw(0x10_42);
> +//! assert_eq!(id.version().major(), 0x4);
> +//! assert_eq!(id.version().minor(), 0x2);
> +//!
> +//! let id = id.with_version(Version::zeroed().with_const_major::<0x1>());
> +//! assert_eq!(id.into_raw(), 0x10_10);
> +//! ```
> +//!
>  //! # Bits outside of declared fields
>  //!
>  //! Bits of the storage type that are not part of any declared field are preserved by the setter
> @@ -346,6 +378,31 @@ fn from(val: $storage) -> $name {
>              }
>          }
>  
> +        // Conversions from/to any `Bounded` with the exact same width as `$storage`, to allow
> +        // infallible nested bitfields.
> +
> +        impl<T> ::core::convert::From<$crate::num::Bounded<T, { <$storage>::BITS }>> for $name
> +        where
> +            T: $crate::num::Integer,
> +            $storage: ::core::convert::From<$crate::num::Bounded<T, { <$storage>::BITS }>>,
> +        {
> +            #[inline(always)]
> +            fn from(val: $crate::num::Bounded<T, { <$storage>::BITS }>) -> $name {
> +                Self::from_raw(val.into())
> +            }
> +        }
> +
> +        impl<T> ::core::convert::From<$name> for $crate::num::Bounded<T, { <$storage>::BITS }>
> +        where
> +            T: $crate::num::Integer,
> +            Self: ::core::convert::From<$storage>,
> +        {
> +            #[inline(always)]
> +            fn from(val: $name) -> Self {
> +                val.into_raw().into()
> +            }
> +        }
> +
>          // SAFETY: `$name` is transparent over `$storage` and `$storage` has no interior mutability.
>          unsafe impl $crate::mem::AsRepr for $name {
>              // Normalize `$storage` to the canonical repr type in case it is signed.
> @@ -653,6 +710,14 @@ struct TestU8(u8) {
>          }
>      }
>  
> +    bitfield! {
> +        struct TestNested(u32) {
> +            31:16     field_31_16 => TestU16;
> +            15:8      field_15_8;
> +            7:0       field_7_0 => TestU8;
> +        }
> +    }
> +
>      // Single and multi-bit fields basic access.
>      #[test]
>      fn test_basic_access() {
> @@ -770,6 +835,21 @@ fn test_fallible_conversion() {
>          assert_eq!(TestU64::from_raw(raw).field_15_12(), Err(0x7));
>      }
>  
> +    // `=>` conversion from/to another bitfield with the same width as the field.
> +    #[test]
> +    fn test_nested_bitfield() {
> +        let val = TestNested::from_raw(0x42AB_00AF);
> +        assert_eq!(val.field_31_16(), TestU16::from_raw(0x42AB));
> +        assert_eq!(val.field_31_16().field_15_8(), 0x42);
> +        assert_eq!(val.field_7_0(), TestU8::from_raw(0xAF));
> +        assert_eq!(val.field_7_0().field_7_4(), 0xA);
> +
> +        let val = val
> +            .with_field_31_16(TestU16::zeroed().with_const_field_3_1::<0x5>())
> +            .with_field_7_0(TestU8::zeroed().with_field_0(true));
> +        assert_eq!(val.into_raw(), 0x000A_0001);
> +    }
> +
>      // Test that setting an overlapping field affects the overlapped one as expected.
>      #[test]
>      fn test_overlapping_fields() {
> 
> ---
> base-commit: abfb640b2374e26de8ff81d488c39d8254db538e
> change-id: 20261127-bitfield-conversions-e5a6b02f0ac4
> 
> Best regards,
> --  
> Alexandre Courbot <acourbot@nvidia.com>

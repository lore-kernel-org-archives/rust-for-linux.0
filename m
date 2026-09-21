Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD4A36654F;
	Mon, 21 Sep 2026 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975135; cv=fail; b=r2g87D1swcLKY8MquD5Rh8Z3L4oJ5MN9isk83nHR0rJ9TleJTtvmmpKasFOcqPU5kZ8/7LVbx7Inv5TOZyESN9hfIHxUuAs7ys8qP3Ph4teSpMijzWN4SPzbRYpWfxmcauzf5UK/PNqRo81x5iraHWhqkuoBYsr7BfbvLFdiwNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975135; c=relaxed/simple;
	bh=wH7a5NpQEgrhiS3dQ7abR928Xs7v3m7w+ODNTbDb7EY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tHfB7zEoYDFOvndaQSjznaeSHej3F9xPXY7eGuS2vMhZ9+prlqMiJlzjfiWpHPYCc3vMoxrfjWGbeu7GXwcPWffyVtbROxL8WZYFZrAJCF2tYvL2L02yaFUSLPvWX1gXH3QofGuqjEaBXffdGVHYcDy2ZMtL+s5KOshLXhQs8iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WwkHE4ni; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WwkHE4ni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOjNntTBWPZMrVxTgW1mUIDVJCPysOSkNn7bEoRh+nbyTj1DO/gg6LGq1ELFhya3Kmj9niyt6BxLCZVXdk6agmM5jMDOIQcf+Jcmnyrcx6WZf6gw8eMq5BpNukBuGMwyt0r0YfUlFERhkldkVBqqMArAvXAgBCkwTd/MPHJxsHHxrL/+7rehEYow+UW/q30GlCw2Yqek5kwohGZTL8m3tsUvzvOIUDAuZVxBOInhhqRWvP7cw1OMSAhvzwEe2dxMsR2j+xoSYa7N6sQA3QfDhdVckp5UafmGoqZpF2HYt3ZWTUPhlMU1gZGbjm158ZLA8RgnZO4Dcy8bE4+Egd3JZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTuKVSsBpgHAyY9GhnJdbPT1DTWZMYr0N2Jlq874Z2c=;
 b=QkQSbDmFzz6Y2a5ca8P/t+Y3kvsKvX2HD6azItG206kze6va/6vrhvk0UU11rkzq3YYXsExGZVrBDC69MzMicSUIKlHuzZhSDYPsJZN8RtfxuW93I4VupZ50m/K91sdUJVqP4Q1jnVGxs0xnJWjk0aI8yg6u0/gFUkSVlKWXVh/uwOn0gzkJoej/u525z4CUPQnekNNXbLSCCd935TWkEg2Tq0hQ3pl6Zi+66dv1SoKBO4DZWk04tW2rWcE0au16qil8j1GThLHcBB3xNqUAkU4kkQIBpT1Y5EoNtjfCDiZGGsY/sGM2yYOTMizlKLhz3TQj7uHzhHUfiY7uiiPSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTuKVSsBpgHAyY9GhnJdbPT1DTWZMYr0N2Jlq874Z2c=;
 b=WwkHE4nimDWwnvCOWb5mc3MeeqKCU06z+zkL054WXLqj1+zgwW866xllMfYGUU8B7AeQT+9cfkSnM1hjVSJBriXRiZPiRKuM6GL/o1D8W6yOhtYIBf1pouK7E3T+Jhi6awMl97+z6+S0k7OMCRqTS2KZWwTbztAx3NqRbK10wSnr43ajOf27YrkqLsyzwH2qcw3fKiPcuZ7owtklmvx+nDd/fFFFpKa5WxI4zgGNLnIHgG+y1LR99U8ZTp8f0V87T0bRem71qYEbN/3IFlBwsDT4ep60p6oyU2nGbRIVzhaaJrcY71FGsneOdtyK+OZp6ZYZbeiCrHdpD6lUTdnc8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Mon, 21 Sep 2026 07:18:50 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 07:18:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 16:18:47 +0900
Message-Id: <DLKT85RM6XFH.1FHCL3Q40L1I7@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yury.norov@gmail.com>, <ojeda@kernel.org>
Subject: Re: [PATCH] rust: bitfield: require Zeroable storage for Zeroable
 impl
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yilin Chen" <1479826151@qq.com>
References: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com>
 <DLEFXN8E20PU.3GJN24VECD90Z@garyguo.net>
 <tencent_BECF7D8D0F045D49DE115EED535736C7EB08@qq.com>
In-Reply-To: <tencent_BECF7D8D0F045D49DE115EED535736C7EB08@qq.com>
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a4508b-e98a-486d-6b57-08df17b09595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H1a/ic5XOkUzYzRnAT/SfSvqC5FVI5Hkcw/RDpzEI69QBr0wzJQUBYLhOB5DkB9wqCaDaVpiPi8I4E7iP/kr6w7YVbX6jUTuvMfh08kWu9WxnDvnImjA0USe4cMN2ijBIjuGGIBUPcObytQgZSZWjeKzBkRbD5rqKK2ek2n+cq77aI7CSWsJzy5m3XY8D5nhRrCq5WbeTmtb+3Pv2L0wf9zlTsdoyBrdcL/uIaAkDdE/C1z9aZUn/qe1PLpDIMvvvXBFYDgzUnzurgeFZ/R5ZhYQHKxW1WlP28a3WzzzrrkgHlKZlPsbPIyGLxJQvLQjVAG3crgBpkFNcAZYd1MQ+TE/lcLZxOFgV+W0p/8J26H540srltg8YUeTRHv2iOGmEspgGV8bRJAPgQY2Nft2np5t1RFmqf0eMg8XCIhNWBL1oxn3W7SIATi4tdKN45+FaR7K8SMZrSdfAr2/ubV+CFlclXquD8RNPkuYp5lMzB9Y2taMbkL7nZtvmc65IyMCD/5D33k3mCOC/vqqtCzdcjIikgEuVGqaLlSMLKEuPxZNPKqY35hP9um0Onzt7R3swQJQP1BAITbtvOwTUSXS4W8ebxApef1OL4bmaoKMTD4J8pgNqZEBU8ARF6P6xgABHIj7bjImYcf+z4bdR42/1zeOXJ0FEasVb0xBe+3dEao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTFLbXZsRWZvdndETHhTMzYvTkF5UE5UcU10TFZWekorNzd3Mi9JeURzR3R1?=
 =?utf-8?B?YmZUTEVicTlkU2Zyb2l4TGxlaE94Z2R0OVdRVFNoV3hrVUtxeWhqQjJBaXlx?=
 =?utf-8?B?VEt1UE9vUmlreTZIRmYvK1JPOEVBY3YzQ0FyRlJIL1dqSGJKSk5vZ09mUXRl?=
 =?utf-8?B?a1BWN1JRWlZ3THlYWmpvN1RCOFY4dWJHOEFHTHA2eWJ3Z3MyY3ZPQjhEMUlx?=
 =?utf-8?B?Y2JYSE8rZ0doWWRHVDlaVG4yTDh2Z3J1VDJUeUxGelVvOUEwOU9JSGhhbDJh?=
 =?utf-8?B?eFlicHJoQkZMdUVXTmYxY1ZvRloydFJZMytlRTkzeEp2VHVEMlluWFlhT3FZ?=
 =?utf-8?B?WHJEdEpRSkQrYmdIV2RRMmNaOHNNNkhJOEtSTkdYbDA4Q3Vwci9halZLYXdn?=
 =?utf-8?B?Z1M0a2NoWG1wTzh0d2FMRDBkQThaMnNIOUlmd0VpOTdTY1dhMW1kdXhZRGpt?=
 =?utf-8?B?amdQTWVta2gwWlJ6TnBtdG1iQTVKTFJ1RFRkREt5QjN0L0JRWUM2NzhJbXlM?=
 =?utf-8?B?TUlralk3akdmT2JSbHk3VmlRTENKYVF6eE55MkltYW44a1duNVUrY08wQlg0?=
 =?utf-8?B?S3RzUUF6bG44UGl6bmF1b3I1YnF3dkhyeWdycDBKSzJ5SWVzMjdaL0dMUnk3?=
 =?utf-8?B?bDcwd3Q1d09STGd6UDlxenZrSlYrV1VwZGdwL2lPYzdVOVladlNzQ0hBajFY?=
 =?utf-8?B?NmVBM1hXNnF6d1NqUmNnTnd4WUJldCtxcVBCazNra2lQSFAxa0xUYjY5YTBO?=
 =?utf-8?B?KysveWpwS0dGTExyTElsWGtnTVhjMTE0U1BFQ0UyeGdJN0p3Ymh0NzhadXhy?=
 =?utf-8?B?TTFTQ1A0b0xjMFJHNWhlYnN2YjB3TkY4RS9SNnJ4a3BjczJIZ2k4U0VSWkt1?=
 =?utf-8?B?d3hBTWxpMnYxNU0waDZUWGQvblQ1SEFPSEdsckg1K0l5Z2hpeUhXTFlhQkow?=
 =?utf-8?B?amFJOTlDNWdtRi9Tdkora1M0d1RveGdOYnI0Z1NDU2E2ZXN4UWR5MnFxM1pZ?=
 =?utf-8?B?SGQ1Mm0wM0JITHJqVEdDVHlnWnd1aE5vZy9WQ1J0SHRiTFJ5MHVzS0FjR1J3?=
 =?utf-8?B?Vkc4d01TbU1UM2dCMUNPVDdSb3ZSR05uVjBZckVaRGQ0bEFpMWZYWXZ3OEhH?=
 =?utf-8?B?cUx4bEpMOVhhd1RUam52QzRzcHY1NzMvdGM3cnZXcTlnZXZIWkV5WGczRThu?=
 =?utf-8?B?cFZsK0F4c1RZMnoxNElOVnduWU13THk3Qk5USmMyMjZyY2U2VS9JM0ZtQUhI?=
 =?utf-8?B?K01LVERpdVJabTUrR1F5Z2F1bHdjV2RYZWxBU3I2aFhCTTF0VGt6QVM4NTZK?=
 =?utf-8?B?LzF4TWcyUzI5R2o5QU1sOWxRZGdHUUhPZmFOVXV0b2dCQUxBU1ZCU3hoMmpm?=
 =?utf-8?B?alEyZnRiQWt3UUpGZXcySGVZbko2aVFMWHMwM0NzZ21Najg2WnFRdSszYy9O?=
 =?utf-8?B?RGtzQnBXc1RRN2tZTXdyU2MzNVZVTDdPWjZmU3M4RFpWRHo4b3BTTlNMMUU3?=
 =?utf-8?B?cHdQczh1ZEUvK0NsT1hUU1V2T255OVR3WS9peFcxajArelRCZzVtcnRXU1BW?=
 =?utf-8?B?eHF4U09PSkRCYytKT1pVaWtlS1JmQXE5ZUJZK2hSN0FwdG9tSk9Kdm51S2Ra?=
 =?utf-8?B?N0VERitBbkpWWDQwblpoMmlySlRyMkorSEhJQ0dYcjhveCthUW0xeGthWnNa?=
 =?utf-8?B?NkxrMVFSeFhVMmRJNVlDam1OR3dabjYxV0tRVWdiMHc5L0VTYnhXRUYraFdS?=
 =?utf-8?B?WWpuSVl0NUN4QSs5bXk3azQwSUFHZ0F6Q1p3U2hqS3g1ekIwQWpXZml6eEdy?=
 =?utf-8?B?LzhSY1ljUzZrM3BNRS94MWN5VTNmS1VSWFlmZjNsL2NLUHloZHltNzFYdHA2?=
 =?utf-8?B?MUJ0SHFERFlaRy95Vk1qVU05dVRyckdwcStvaVFkTWR6Y3VCOW5PUkdkUy8v?=
 =?utf-8?B?aVJUdjVoYnd2YURUQjIvOGlZZUZ5QXh0cUVzYmY1Ym42bSt1QWNnQWxVN2hV?=
 =?utf-8?B?Mjk4QmhUNG9JL00rUXA0N0RoVU9Wd3ozL1plWi81bzdoYjEzdFNVb1Nxcml6?=
 =?utf-8?B?U280cWkrMlFaZCs4ekpoTlpSQlhGQVU4SWJLMVByYU5hcHRrTjlGb1NBK0RE?=
 =?utf-8?B?elVMTGhFaHJzV0gyS0NsREZBMGcyTzBkY1ByZTQ5bTVKdXZhWm0ycC9DVWNP?=
 =?utf-8?B?bFZjaDk2MXdkUFU0R3RvOWZCQ29JTzRpN0ViYWRxbGlrdklXbHhiMDJWV2U5?=
 =?utf-8?B?R092S1d3ZWlwRUgxWWMwblMxSEtGNEN5UUxoemNFTmYrcnVOMjVpQ1RFUlpZ?=
 =?utf-8?B?WUx1OFI2T2ZUSmtoMlljUjNPTFFDQ3MzQjkyNmdPMk5LaHg4TkJXbFpNTm05?=
 =?utf-8?Q?7k7GZ5lN01x+Nxd3fIrMN/5Y4gdJLDaCWkNiue0okJMAP?=
X-MS-Exchange-AntiSpam-MessageData-1: ZZWTNiL8E3t6fA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a4508b-e98a-486d-6b57-08df17b09595
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:18:50.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGHvl7AHGafFK2aNbm5h7aCXs9jIyPc+1hr+JmiLk61/2ElhCjIjdjI4xMx0F9Jk9dVNTNS99pDeXFf+/21Sxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

On Mon Sep 21, 2026 at 3:32 PM JST, Yilin Chen wrote:
> Hi Gary,
>
> Resending my reply for visibility on the mailing list.
>
> You are right that a bitfield with at least one field generates a use of
> `Bounded<$storage, ...>`, which requires the storage type to implement
> `Integer`. However, `bitfield!` also accepts an empty field list. In that
> case, no `Bounded` use is generated, so the `Integer` requirement is
> absent, while the macro still generates the unconditional `Zeroable`
> implementation.
>
> For example:
>
>     use core::num::NonZeroU32;
>     use pin_init::Zeroable;
>
>     bitfield! {
>         struct Bad(NonZeroU32) {}
>     }
>
>     fn check_bad_zeroable() {
>         let _: Bad =3D <Bad as Zeroable>::zeroed();
>     }
>
> This currently compiles.

No it doesn't.

error[E0277]: the trait bound `core::num::NonZero<u32>: kernel::mem::AsRepr=
` is not satisfied
364 | /         bitfield! {
365 | |             struct Bad(NonZeroU32) {}
366 | |         }
    | |_________^ the trait `kernel::mem::AsRepr` is not implemented for `c=
ore::num::NonZero<u32>`

Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B954856A;
	Tue, 22 Sep 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085201; cv=fail; b=XJWB243ea1J0iUhEsgkNbeXHrBJ3Ewe1oL/w3ZURi65VagqXH2Gkk4nYUp/f5wX6qhOAqQ/DcSGKgN7VitVhg3Jit+8KsjUkZFRQCryVbq00G1dAPbRE7nOiFTED5ojFOQD5X0xuKiopXa9yIBJ2SS4QeOMppITA9rH7/tSpdMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085201; c=relaxed/simple;
	bh=vg7BGxDOha+BG3rUptjc6yVuKBDEnWjbloQNRZzpAbc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Q2G1daaSacke57uld9jXR1nymPrIE92riD5C95cIerLOuWbXS2HzuKO4KrEx1iKKyWKTnluILxt7VwQ1+FonkcTsBmt2tFU3g98k4ifMkcnZneZqRFC8dw/Xfn+bEDQILTEPyHBpAmUw6omHMUQIouPPe20ritzLfaJzcOZgN9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FVaIhpil; arc=fail smtp.client-ip=40.93.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FVaIhpil"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wg6K+vqciogHmyKEDWzCKhwSTN8BySNmJX1D1MJ7kciPEESbhdwgEt68i1LVVvw59uqsJV11273pSZLoJJiFmvLojDpeE1J7QCX4oafQ4MfaWqDnqEdM0AodArykj2lPK9CTF+4iYJrTbNmcJ7Fte7NT2ornUcfGeVr/5CYApKbA0cOC9wDctjL0MwTJ7IeTBO2QtVppATRouUQv3bETyxD62Se3W4/rFdUfewCL+xMkLP2hmGPrSDz8dFyvV8EO/IkPQ6IhB5My+IA0eL1h6Ff/bIGvmSvpS615f7A2KarsKBASpmwir7mh34XzPfoT/CrdAYX4rwiOrtJk/3SKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO83crHQFyBJm2jcYob9jWu86e8EESU2tJn+1Aulk/4=;
 b=MK1872yF905TLcW6mXNsVfLqgsRoDJuXv0G7Ib8RwEssChPiSr35lZpt+8OqklJ8UrzTiE67p2XAr5302aC8cSYOogWPbX1XccxJHIhAJEvIooNOl+myJuvjcDufugH2nqkUASacOz7vpVldjHal7qtlWKNT4+6pB2V4gh0Gj1TmAORpAaHChKXpp3NMewfEv2AlycslgploS0BUsiHRIpU16/tDX39Ep7h9N5tuU11tvmpX0fv9FFwDxPmr59SEiI5fd5+37kXoKb0xArQLx23S31VNSfsPHJjKXjt5HEsHKFh6f5J/+G0m2Xji4N7kmzgYHD73NaR4S7166nZ4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO83crHQFyBJm2jcYob9jWu86e8EESU2tJn+1Aulk/4=;
 b=FVaIhpilpVryg0zjYyvi7QyrnCuFsw/Ug9iGhyZqVPn9y53YMfmX3hPzDSU9PqXLyLmWD9TY7oKLlH6KJqpXZaYxDrVbcqBeeuG/qIS3smE5KXddIVyWrqbqQ4TR1JyutNXvs1JLEMQ4qNdOrYAxy5oND5ioqsU6AU7xPBg7Nnc4Ak0YS6wDq9o/IVZJDkgLSwpnUlwCkGjyVfaa7w/DSCtexrNe2++IAk8YJJjUdfeIz1hxJ6nMtSl1yXwhBPGezRZ+wxmTcZ9xiBy3EJr3L3l478SGp3T3e6chi6F8dNsEfSvO/BNm4efwtdzQ7WGFpFrvjoRBKWEvnrcerYWY1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 13:53:14 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:53:14 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:53:10 +0900
Message-Id: <DLLW8NY8GF79.3U3VGJF2C3Z63@nvidia.com>
Cc: <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yury.norov@gmail.com>, <ojeda@kernel.org>
Subject: Re: [PATCH v2] rust: bitfield: require integer storage
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yilin Chen" <1479826151@qq.com>
Content-Transfer-Encoding: quoted-printable
References: <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
 <tencent_6ED5B37F63268169D25F84557BD655D9B106@qq.com>
In-Reply-To: <tencent_6ED5B37F63268169D25F84557BD655D9B106@qq.com>
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH8PR12MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: f14ef798-c007-4e4e-4e94-08df18b0d8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|6133799003|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8qxln/TcDzbCRHMkO8Wec9zu7T1rG1C5aMEFBZzag39GFv6otMkfpayxnGqK9dDR9qjMVm/PiSZDCv1kktgEhGT4ahzhYN56nwCE8mq1yRJlKSSuKKGePC/w9UobMrd8lC8T0ExN/BaVKzcKDFUPH/bkfbiEBOl9NQPttZOx5/RsBy2uW5OkrDymjK5sBU6PNhtuL+fO5oayTOSPWdO4qqm7UxhTygpPx4H/O5CSo3zqZcseBxc3fvwTwL66LwYLFEE16FLfrZKTNwGMqMN4NwYSKXg/Yx58xSPVWeFZ7senuKcNDOIJ7r9/+arYlrEfSbuv/K+Q139rvs0fL270cqYdwH4LSX7jR/5rORDj7phXUr63m2pB83hYrkc7sTtWcPyhQC+IeTJ3/m2fgtl4+jlzwlyZY3YU5G5We6cAr7q8TgapeDRkTTAT00y6vJWhrgnWRxsuVlsw16qdmn5wnp/xiFCC2XxIYiTDZBPThzzFRHdKNApwhSR7QumwKJFcia4fGQHezfYugAjUQuNiAm5wi991jAuXjyDdZKqL8ePvxoBP4T3lDZhDY3Kh0v7f3MwRxqm3t71kjyaOSFBhb1g2Kl6vhVD86HmDCdkxvgLsdtM8U4/abma9GDyf5Z6yNZbMTjGkT11fot4mYooEbFQm3ck0onX4sNC4M7wlJek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21XcjRIekxQelZmcjN2SGxybUdYc3p2Z1cvWkJ0NTlLREJsQm12WUE4SzRr?=
 =?utf-8?B?c3phbWVpbmI1MUZ3UjN0SllrVW9RSWVabmlVK0VoM0pGRFA3ZjYxbElnVG15?=
 =?utf-8?B?QWxlUWpSbDl0Nno5RENIeUFQamp0Y2lCZndMVzNrbDYrYmd5c0cvanlmYU1B?=
 =?utf-8?B?UnVUczJCYVh0Zk9hd2dRekp4TE43aEppZlNUK3pVQXQrM2JyMkFTSzU4S3dM?=
 =?utf-8?B?bmdCWWtRbzRZSXkwaEZXZWdOQ2kxUGg1a1ZOWkZ3WXd6elRzNStmbFd4eWls?=
 =?utf-8?B?b1JDRW0rakpUdkxsTnFxMGI4dzl5ZURLcHhaMEVnV0xQVGk5L29VVHM4cmZY?=
 =?utf-8?B?TElpQVRXTk5rclNtcjA0WjRUWnlGemJ5ZnhOSUsyMXhzNXN3b2srUzZSQTU4?=
 =?utf-8?B?WXRhOGdvbGk0ZkxJYm4wdXIzdG9kSGxwZjZ3REZ6YUNFM1B6RkphWm1OZWdM?=
 =?utf-8?B?SU1VSHlXR0I5REU5elBIR1FoSEd4SXZtTm1aTDF4NUpuemNpVlZTSUx2NzJS?=
 =?utf-8?B?OW10RnB1UlFXVkRDQnh5MktQLzRSdnhqalpDZmRTYUphejQwOFIvb25zNWxo?=
 =?utf-8?B?aG9WMTBRQ0VYY21uMFJsSGRaelErcUlrSDVReitWeHFFdDZqQ3B2eDMzdGpN?=
 =?utf-8?B?dDd2QkFvNXJJSVBOcDR1QlpaTDBoanVOR1RBdHE3VWJ6dXNubmRlT2UyTDlx?=
 =?utf-8?B?U2Zaa1BqTHBJUlpvNVpLdEtlZE5tMDBPVWR0VXBGZU91KytUS2ZpVHV0bitZ?=
 =?utf-8?B?OW5SeCtxRVgxMlJ1SXlLVTFZY1RteFNUSmdUcVJiYjJUNm04bHo3b0l0VUJB?=
 =?utf-8?B?RDJSNUNlbzBGNXFGZVU2elJ3dXh2K0Z0Q0pjN3VkVDluT2E3eVc1U1VoSW9R?=
 =?utf-8?B?R3hwd0NpUWZqSlkwZWdkV1lkSUw5R21XVTVValZuR0VCYVZwVHhyMnhpNTJG?=
 =?utf-8?B?cXJaYndYS05IRVIzcXVVSHorZ24yU3Z5eGhHZmhzVVYwZFM4VWJvNU1xa2VF?=
 =?utf-8?B?T1cxc3Q1UlB6NnJMbk1MUit2MjI0ZHRGSjBBeWMxL2xZT1RWbFhVMElWc0pN?=
 =?utf-8?B?aXFpREpxdTlMQVZzUnZWNDdWaFBnVGVPTTZOamRCcnFudGZpT3B4RVA4NC9F?=
 =?utf-8?B?TG1QMnVUd01KOVUxUGdnSUZvOXNJN3JTbzRuM1lNN1o2ck1qZlJlUnIyZFJ3?=
 =?utf-8?B?bEo5NElrK0EyaGQ5NXhrUUlIcWhBalNJWmpSQXJ5dWE4M04vckVub2c4TllD?=
 =?utf-8?B?U3VsVWN6Nk5VVzJLU1ROVytROFRZbVp1TGp3SXdMZEtxbmcwYjBvcFhhODY4?=
 =?utf-8?B?ZWxMTS93czB3SDR2cUxGalBlZlFOZnE0VGViK2M2RHhnakxYS0FyWkhZb1JY?=
 =?utf-8?B?Nk00bzlIelIxNU5tbVFMekRlU29OUkphTzJPVjU5K04wUWppaysrbUY0aHlj?=
 =?utf-8?B?dWtQdHJSOFJ0Q2x1M3BTQmphOVVTOVF5SEprbmRDSEYwY0xacTBUdkN1aUVl?=
 =?utf-8?B?WTRrbzNxR0JhSVJkYXVCYXdZYlhqV1dtY0tOT3ZEVUxyeU5saXNmVFBQbWdB?=
 =?utf-8?B?aGIvVFQ0RERMSzlZcUNCcUZFb1dkcEFhVnBnTm1zTnBXTllzL2h1dkF5b3FL?=
 =?utf-8?B?TUQ5MHVoT1FZcDZjL3B0WDJocXhRUFc0UmI0aFlVYStEM0pqdDh3c1ZSMDNQ?=
 =?utf-8?B?TGlWSDBTbzh4bEhBOUl0RFNrb1RlN2Z3QVpBcU5iMXM4aEdUVnhYZTBhR1FU?=
 =?utf-8?B?UlUzNEJ4M2sza0NFeU5yRmNWN285clhWWFFaZFpnV3RUeE9pbnJBTE1zYVAy?=
 =?utf-8?B?OGViTkdoZzZvQkRhajJmbVZuTHVUM2RXSzZWdUcvZ2hpUkFETkU2Q1JGdldx?=
 =?utf-8?B?ZllNY0xIV3kvWm9YMFYxemR2bWR3TUx0UWRJTElDUWlOSUJJenNuUGFTQW1K?=
 =?utf-8?B?WE1mN3NtZGlaOWRBTGViN2Y0UEt1UGRMQWlLbWZ0bTV4VFk5UFl3azdyeUE5?=
 =?utf-8?B?R0t2cDVTNDRmTWt0T05tc2JFcjRlYThzZ0NCYkw4MFNlczlwOXM0eWVBL2Iy?=
 =?utf-8?B?U3YvTUh4azBtNXJ1ZHcwNTlwbS81dlUrdm1Pd2twN2ZIVGVWajZzVXB4TDN3?=
 =?utf-8?B?MVhITVpBa2wybWdKSFZRNXloK1VLbmtSMjY5ZlZhdTd4bWp3ZTVPVHlEckZ4?=
 =?utf-8?B?M1NKbjZxYmN1V2lETlUzU294K2dHdEVDOERwRWJ6WG9JenErZlRrMkwyMU9H?=
 =?utf-8?B?MHM3VTJFbkx0TDFLTzdtOHhRMDFLekNoakdFZmQ0NmxCd05uZytpOXBQZkhG?=
 =?utf-8?B?bThITkNLOUZyMStCZUpKU0UyS2RxSDhkM3ppdVN5TnI5L3VWcGZ0cFA5a3Ax?=
 =?utf-8?Q?Osn9QSwHjnwo6YeFg6wB8od2riDipN7s+a+S33zj12dXr?=
X-MS-Exchange-AntiSpam-MessageData-1: yKvpO9N/EHLjDA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14ef798-c007-4e4e-4e94-08df18b0d8df
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:53:14.4532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvL4gG395ZVpL3HcBdf4ay7mvLBHTHGbK8TO8Wk5wqb0IXUCOeZp8NP7x5t26PC9OsxaWnFxmadP8KStZogeyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111

On Tue Sep 22, 2026 at 2:28 PM JST, Yilin Chen wrote:
> The bitfield! macro generates an unconditional Zeroable implementation
> for its wrapper type. An empty field list generates no Bounded usage, so
> the storage type can bypass the Integer requirement.
>
> Require the storage type to implement the sealed Integer trait for the
> generated Zeroable implementation. This ensures that bitfield storage is
> limited to primitive integer types with a valid all-zero bit pattern.
>
> Fixes: b7b8b4ccdad4 ("rust: extract `bitfield!` macro from `register!`")
> Assisted-by: GPT-5.6 Sol
> Signed-off-by: Yilin Chen <1479826151@qq.com>

Looks like my wish [1] has been instantly granted.

[1] https://lore.kernel.org/rust-for-linux/DLLVY7G20JJA.2B0KTTODUU9FG@nvidi=
a.com/

> ---
> Changes in v2:
> - Add `where $storage: ::kernel::num::Integer` bound.
> - Update `// SAFETY` section.
> ---
>
> I track the default rust-next branch, and there is not any code about
> `AsRepr` in that branch. So in patch v1, I didn't know that case could
> not compile. Thank you for your feedback!
>
>  rust/kernel/bitfield.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index a0d089423f21..b1fc98d7f8c3 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -330,8 +330,13 @@ impl $name {
>              }
>          }
> =20
> -        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
> -        unsafe impl ::pin_init::Zeroable for $name {}
> +        // SAFETY:
> +        // - `$storage: Integer` is sealed to primitive integer types, f=
or which the all-zero bit
> +        //   pattern is valid.
> +        // - `$name` is `repr(transparent)` over `$storage`.
> +        unsafe impl ::pin_init::Zeroable for $name
> +        where $storage: ::kernel::num::Integer
> +        {}

While I guess that would somehow work, I think the proper place to do
this is the struct definition, i.e:

  $vis struct $name
  where
      $storage: $crate::num::Integer,
  {
      inner: $storage,
  }

This makes the error message also more explicit about what the problem
is (a bitfield requires an `Integer`, not merely the ability to
initialize it to zero).

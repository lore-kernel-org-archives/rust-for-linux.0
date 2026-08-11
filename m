Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675D42A150
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450366; cv=fail; b=CBAcXyzXw2Rdeus03LJn7oTrG2tsBfT3coePcF1TfG+sbw4dC/eIsG/wzvx6cQDXwgKRHKYwDWaE63l7YHWeRTGfZaT1A92IeWhUtFiUFnVIxFbsYZyIlR0JR2YTvvksUAZw1v8YXk5x8dJFVACZ3NIzWF7xHNGpomPCUaDDRss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450366; c=relaxed/simple;
	bh=noIilyBbHvKqomUESCbJBm4XQN0czrbaVFx6PQ71Rmg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=G24o+ppQWhzDffJCTS3RdMsbbGUkTjkTw//b1nvs9nT6Lrwc1bCHH/3LvnmsPWul3w1FGZobu8ihOi73FBtYKmQPSODzMFS9fYJ9Utt9OHUZDrf6jVxqZaM66Xwtd0TvSVqkIixBffk216eZa/C3V45LBRr/IQWf2mDdFqWzy4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mkM3Ep2J; arc=fail smtp.client-ip=52.101.52.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mkM3Ep2J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3G7pbuhT7jr4o6Ier0k9fb4W9h21htJ/ySBjDoAdFIKiCe5nJxvq/o5qylyZO8wpA8zRh92AYhiZtdTgq479GJAxuT56TAiC4m3MZtl9GQQMOrb/3oec8ng8aBkcBI56XE6Ne6XuoDdH3Q3oF87sqgJTWZX49gkPf7LtNYHSY/QcAtyg133TIVSvQz5J3gJoQlLfEMihNDP0Ubf0fQq7+tP7oedR0T964LBcPKG5K2bbRb3BWv0TIvzYyZ4EN9U8p/2s+EtWkt8JKMsHkesi8uk9hs0XIW1xZ2zA2KW57l/camzA/9isNrni7YovcdEuXoFyAtpGPwY1OqdTdzwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raVlbPUKlbwS1sZlaTB4eDSLfz60PMFVcTKfP0vqcw0=;
 b=MI6qZNj4bmkihvIbaEfZlPxfBq7Meke3Ep/UEOagoA3UlQir5Gu7yVXcYt4si0uNUvc5wHYk6oBO0MvEGIsrfK00fbuA7NtMT9pl0ApNzMuX5Rwyp9Jebl+16VNBAYFtWxL4mCXVhn6AGh5hQywHbmoEcIniwV9kcx05/aKH8pTXDpZwUyWIhWPkuzL0VB1cr/1izAB8ZWtawIF49VgZOjvpxA1Wcv3einMlpPzNX2WrfMFV5KIidayCGYqCJmy+8jmNfglCK/0seFwh2FfJs0VKlJJ2erfw0LdfT7WJDLEi7WD6l/EUOlHBmJhcX+pVpRZUIOPMpn/P+AgQbm8vpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raVlbPUKlbwS1sZlaTB4eDSLfz60PMFVcTKfP0vqcw0=;
 b=mkM3Ep2JX3NeY7P85WwpUIXgb7g5nyXdURT/d+6e+oxt+RscdFa+lewMo0jbgN05XcDpSHwKMK/foQ9hWrVTA+Xn9UMWW98tQ20rHf2gTh3iE0tVr//REt/PMul0skAsU2IhK4QiTmMFi8/3kOaPPGSxKqqV1BpNsjU3TUAQ33PPzyihDpydDuQ1/iQS9mxirHDQBq9cts+zZEHZbmFwqlpY+tZYEosDuFuHw36RiqwZ1eyZO33AwPMKCbEKPorVgkxG9UeJn8pQ+FC1kxbR3QHQ50Bgy4rVU2Q8LCSarIdorw8o85yqHf+ysmoCweGZjLEqfv3HYQ0ZSBDSov6aRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6728.namprd12.prod.outlook.com (2603:10b6:806:257::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:12:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 12:12:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 21:12:35 +0900
Message-Id: <DKM3SRUKRG7B.3B9E6YEE9JTST@nvidia.com>
To: "liujinlong" <liujinlong176@163.com>
Cc: <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Wedson Almeida Filho" <wedsonaf@gmail.com>, "liujinlong"
 <liujinlong@kylinos.cn>
Subject: Re: [PATCH 1/2] rust: mm: add VmaRef range query helpers
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260811032603.2651065-1-liujinlong176@163.com>
In-Reply-To: <20260811032603.2651065-1-liujinlong176@163.com>
X-ClientProxiedBy: TY4P286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cf8b44-798c-4ac5-41c0-08def7a1d64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	iTTjt2FFbXmvGh/k/k9dw3GUGZI9DMcNEKgQxby5vNNywCeh9EYio+NZmiH9MjuwQKW5qNb2az9CaEiCkQ3qR/Ui94PmlaARuFW2heENKnAecddKLKl7XtD7j8aNssm0SiRnWNX810nDV3WPwZCqV0Dml3C+NLWn/iSrs3hGJpVRMXZUSmvEFgPaY7LNHJABGtH1WMvykBwpDUt3MY3V94ij8KDePoCZxpQB5Us41MdRojmh1OB0V17mweJwi5iT3uOXfZKfr+7zHLZt+OVv19OIXHTxcxE3hxBwp4/4t1fdsJzjSVubkkRGYSbI5035X5948YKk94loyy4Wgw4MVEU5jUyOTbNfHDJaZWySaT0jkRmp66E0/F7eu4fBodbIAlv2TkilD+RehbqtuN1lpdjJTehbYQ76BLqg+gHuPUET/eETYte65xHfT0tSKO9TVMexMQ5mXg2rcb2L0cbKXiBc8tCUbMVrDG3VOPAZWSq6WPeo2gIJ6omat9knPk8jFKdvWUUJLcNkWOxE6Wl7ZVjg8vE1XNZurCro9F8ACmEnsPSlu5r16a/bxQSiaIrAzaGS+rTpNR3Eq2EiKO0vbFmpQlVdKWylNGUM+ECfAsWROcZiRkIZDAW2YUGFs0H6PzKjBCQbBe7s0yNc//9f+/gl/kGgTgpk+Xc575iGop0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTJMSXp1VVF3bk5MZmFMSWxBdC9rRS9ML2o4WVo0SjNHUUFRSFFGWFptSmZ4?=
 =?utf-8?B?Q0w0VlB5SVVTbmpROTAvdW9BV05zM1hiZHh5MHg4WkZEaDVkT1o2VmtaRUlH?=
 =?utf-8?B?azFFM2VqTW9hYVNNMmV2RzJ1ZmhXV1VqZW15dUVRRU1rOG9qRzRkb3BMR1NW?=
 =?utf-8?B?WDVFMFNKL2ZUdE1mTDdzeHVoNFlhNktHMmJLbk96ZS9najlpMTd2dXZlUjlW?=
 =?utf-8?B?aG9GemtMVGRaYWdZSGRyRENUQUQzM2x0Ulc3dDAvalpvbUVHRTJOQ0s3VWpK?=
 =?utf-8?B?NVZVZU5yaXltekNhNGhsUU8zQVoxcFpHR1RjSHhxOVFGTjRCdEt4cHN1QWY1?=
 =?utf-8?B?dnJCSUVzbDNKdHRrNFZNdzBneWczUGY3V0ZBRUJiRjJxN0JoYTJ1L0hDdkNW?=
 =?utf-8?B?MDRlMVo1ak12WVRuQjU3OC9TTDVMMllBYXpBVFlwcFdONzAvVnB3dmVlZ1Zj?=
 =?utf-8?B?N3ZjVHBGeWRFNGJzcUUwZTQ3bmp3alJzNm8yVE4walY5Rm9Lb0RqcVl5azZU?=
 =?utf-8?B?ZXZ1cHoycjhxSjZuNVh2VzlVcnhzaERha3Q5bkZ1dDhDMUtXdURhUDlqdnhG?=
 =?utf-8?B?dklvVk9yOXc1STlnTHM5M2dIYkVwblRySlBHUnJGblpuM1lFRGNkSVlIN08x?=
 =?utf-8?B?T0l3RVZvQlhCTHZBZmMyamFiZjR6U2E5Q0ZIY0ZPZkdoSm12Y1JXcERScTlT?=
 =?utf-8?B?MHYwcjhXL1N1Ykc3bVYvdWdVWEk2b01WSFZVZ1FMNXZmMndaeE0xRi9Yb1o3?=
 =?utf-8?B?MXVxaVlvQUh3L010U2JsbDRtZUNkTkxsMWZkSVRTN092SHB0UGI4UHVQN0o2?=
 =?utf-8?B?SE5nTFVSR0FBUHZ3YmRDWFhNNEsyZVRzTWZiWGxMa0tEZ1pUc1Bka2k2Y1FQ?=
 =?utf-8?B?MDErajFXTG9CLzRMcjZKVE5GcHBrVGRoUzJzTnRaNHd2bnZCMGIwcEowWm1w?=
 =?utf-8?B?U2dBNC9mdjEyV1Jkb0R3dlN4dm1YaEF6c0Z3ZWUrd1ZFUTRXbHpjTG1pdkE4?=
 =?utf-8?B?cDF1UjhIT0dVTk5NRHV5cWwrQ2Yva0hrdHVIN2x1MXpxc2w3bk13ejZuWlJ3?=
 =?utf-8?B?MHArMG5jRCtUQm14cWVyMDEwc2g4eWk4ZTgvRk9IWFFLVWc1aGE3WDMzODFs?=
 =?utf-8?B?R25YSjk2T3NiTnlzaXBDZDcyRjhmZ1BJSG5YemxDaEdrRWc4RjBpc2xtQlFW?=
 =?utf-8?B?OFdkQThvcmF2UmdMUkhDM29NaDdzelgwSjhwK0xjdUpkdVFRL0FVcndtdFB0?=
 =?utf-8?B?cnJIZTl0ck0wcTRwSkxsdG1pVDFRUFMyRE5zK3hZT0E3bTh5cUJxendlVXB3?=
 =?utf-8?B?WkRKZHJUei9DaS82WjVFM3BMSDJuWm85QjJBZXNESTkvSTkxZTg0S0FvYTNH?=
 =?utf-8?B?U095Yi9pMkJRanIzYitrSGFxK0JjTHpIdHNaa3hHNmZpQ2ZIKzhsUWtTVWpv?=
 =?utf-8?B?L3VERWRzendpWHN1dWNLVXBNdWsxdTJ6cVhZcVBGbEZ5d2ZuTmpWcmxxb0lW?=
 =?utf-8?B?NnVwaTM5MDRYUmZiWUY3Y2U1RHpQMEdBUkZXQXpSUVpEMzhlQU9oYk5KdStF?=
 =?utf-8?B?eE0rTFFtNHNiSjR6eEFrenJUL3luOUczdVJoZUZjR3YyblNQNjJnaUhYN0pV?=
 =?utf-8?B?VWRnZWc5d1RXRUIrN2xJdm5jWDl2SVlaQTcrSXRpeEtkUFQvMkVKZ29mVVVD?=
 =?utf-8?B?OGVDaC9qc0ZHcjRHYW8yeFRaaEo0S3NoMER4RFk4NWlJbStwVjBZbmpXb0NN?=
 =?utf-8?B?WEJCdnYwUEw4TTN6cWRZWmtTa0pHQTBSNllodTF6ZUx6NGliVFFiSlgrekM0?=
 =?utf-8?B?NUVoZy8ycEZOWUI5bFAwSThqWjdXcFhlYjNhbVpLcUxzbnpQTEpCL0g4N2JD?=
 =?utf-8?B?cHRJN3ZkSGF3SVQ3ZXJUQ2ZQK0JmYkQrcEV2VXV1TGEzKy9jc2c5dVFyNE5w?=
 =?utf-8?B?cG1Pd21jMS9NdDdjMzZoayt0bHJEV1VVUlc3Vmo0ZjE1Qi9ReFovcWNiMmkx?=
 =?utf-8?B?ZU51eFhKc2JWT0RHUUgrVktrdWJpd3JiMTFOUm1QZ21qU3VzQlRXb1RUUUMw?=
 =?utf-8?B?ejZNK1lhZ0RKVXNwYXRHTEN0djV1dTJpUnZ1My9Nakc2T2tTMDZSNnFMSzZv?=
 =?utf-8?B?TGN4QS9wUEhVUml0TU44MGxRdmw0alZIWVdzQ1pyTkdDTEZkZC9mZzIvcnda?=
 =?utf-8?B?L2NpZlRqZFUvODVFTmxKSnVFOHNadTVWQ3NCMHkyanVCbFVhT0dsWXZKbDVs?=
 =?utf-8?B?am9BUDFwVjEzT0U5T291ckc1bUUzSU9jK2JqcFhrb1F3NEdjRHZHQXJJWkcv?=
 =?utf-8?B?N0VJYUJka0tVS1N3a2xiTEE4SVA1ejU3ZFZRL2xmSm52ckZHd0dtL3A1UWdx?=
 =?utf-8?Q?lGNWFPPsphcbJA80IxPpMigdUpg6vX6kKuD78YNJe0c6J?=
X-MS-Exchange-AntiSpam-MessageData-1: NbtisT63S68UKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cf8b44-798c-4ac5-41c0-08def7a1d64a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:12:39.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRTzMBxlzyAdSANQZxuPaw/E5InATp5WDhVKRkzZDmbDbwbpx8PhwpEnsia523nUiUbdSnZ3ErDgu9ou5Swe8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6728

On Tue Aug 11, 2026 at 12:26 PM JST, liujinlong wrote:
> From: liujinlong <liujinlong@kylinos.cn>
>
> Add helpers on VmaRef to query the virtual address span and test
> address membership:
>
>   len(), is_empty()       - byte span and zero-length check
>   contains()              - single-address membership in
>                            [vm_start, vm_end)
>   contains_range()        - sub-range membership, returns false
>                            on overflow
>   is_page_aligned()       - PAGE_SIZE alignment for one address
>   is_page_aligned_range() - PAGE_SIZE alignment for addr and size
>
> is_page_aligned() and is_page_aligned_range() are associated
> functions rather than methods, since they do not reference any VMA
> state.  They live here instead of a separate utility module to
> keep the page-alignment helpers close to the range-checking code
> that often uses them.
>
> Signed-off-by: liujinlong <liujinlong@kylinos.cn>

I guess a more useful implementation would be to just return a `Range`
of `start..end` and benefit from all its methods, which cover most of
those defined in this patch.

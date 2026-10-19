Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2552606D;
	Mon, 19 Oct 2026 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421486; cv=fail; b=ZNixvUK6L1V97m1/wYZCShmG4sTpqEQfSYfpjRZmiCWhWBDvHNVaZvidKdZ4++1/8XIbCz7i/nTKROKi9fh4u+wlSFVJlCBQ8v3jHvhkPmbV9LwitlbjMPBTtU+dNA+/jjFhSXW+W8wYtB0CKNGwC5Dlt3zo/qrer9XGA54B2dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421486; c=relaxed/simple;
	bh=Qih2SFlq8R6xQ0R58gGaoAic/kw4Lia8ucS12Htn6zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uwwy/e65x7ecyTFpg6SVfSMbo6oHgwtFaR8FYAdDqKOu+AyvDNGuSQ8yQbruEXCJnijuGK9D9Fpd212VWlWO8h8uWUUWqZIZ8yNj3qSveuz2CelP40PjHRR4jlHQ2TzS36dtxVZrgpm1TewmC0iwtWKKOYVHVt04xnsVgCPkq48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oPgVCzJu; arc=fail smtp.client-ip=52.101.56.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oPgVCzJu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN3EuGXuNgG9HPGHD6T3gmIo49oGlzCvhJuEgotWbPJPEwksfge7qqZPxjq6cdFUZpdKculV6SVhfztWxr3Z7E/tD6Gi831kmJypoBw/fP9wFTcH6eNVQXYPnq7hpCVu7qUvbatLrZqazK9zgnrZ5MZMxFVbSwEPf5CtyAlEH79zgVaNtPLhHrICA5YSNzFXSGsE+ft0j4OR8jb/v10ehO4ZupD2RFfyrluC3R4+0oOuXlij3YvHkg3EO9weyT2GMhIOZ4ZKVJmBrM3OU1i2T+N6YQXxzavLcsi3woTHMqX8rvWFh/KzO7bBnIByskxuSYZKwhXLFlYMWv0iJdC7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWc95+Inm2vmeEbwL26KkbzoXFZIokOmb5ZLxk33u9k=;
 b=avX2yoavXN4KihG0sNvarzOmywTHR4x8uKYScAdtH8Ye+xIBjvhkaA84vFMp2thDJKscpS/3ar4rb3JuBvCFVFG0umYfbhoOMevOQb/m8r5CgN9aYiEOxH2F270O0N7VJRUc1U2BplRpYMExWRHYANJnEgms+3Li1HgurQR7fxlQ2TWytuPIDH77APzicGAbZlhspQTU1lIDrdwkIuF6RpbCedYBXhRhVd20dqZiUSommjJQQoY0WyUlk82EZ1YOxJHbcY6n//7xbfWlxdoJTXU4NL+iAcvQvaEXbHCW6AR7YzdgBVGD5lPOBM6LaiFfzj2bpbAYD6Fei4+qwjvbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWc95+Inm2vmeEbwL26KkbzoXFZIokOmb5ZLxk33u9k=;
 b=oPgVCzJuebfvonEAZNzjZHvzl48A+5Kh0MLNvQu6PwVPiOheSr5njNoLroOakRJ6aOjYxqHHrp9mKJyq92dmALI7Gso/nzeYNEQ0T/wDQ0t/rWdf+sfvx4BdmbBB1UAM8sGUsF4ZmBobs08ueegOd0v2dDSrQYnRcCB02v8w4GNR8HCyWk91MddGkNCSClj4QpBJ4MXmB8a8NyTdFGlaJTyoMyeAMP1kxgdmJ5++1kL8gHGinkuSQQje1KgrYtSJPbZHOSbzVLqK8S9ZCQCPEU49lH6Gb0/YqJu0OIbJr9m6M3dTEV9en4J44Hbgl/V1xUpgEHbVRtCRlNOfHBxlWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS0PR12MB7703.namprd12.prod.outlook.com (2603:10b6:8:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 14:51:19 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Mon, 19 Oct 2026
 14:51:17 +0000
Date: Mon, 19 Oct 2026 10:51:15 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: num: Add inline annotation to Bounded methods
Message-ID: <atYuY1ExPAqZywrr@yury>
References: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: BL1PR13CA0298.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::33) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS0PR12MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ef208f-98a9-4bce-40a7-08df2df06e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|56012099006|260925022911599003|260925021311599003|260925021911599003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	NpqKEDZsksAwq01y+4mMfedjp0XKW7XS2NZhV7b7Yq6eHK2BUOPLUPs4YwpxjOIUtKSFaYDJLmYEmAZp81OrzTVmwUgY6gZo/8eJpeoGgCMbEP/UwzRuRYe/mfDyWb9DO9C9ufiVEI2cBsXR47KSFFgvj14xuobiSWzvWnMCYQJwnUZjN34S+DmcvH0P9uVQEkNxAB618IFC9zXGVjie5DM/kPyhMdAPxsIigkbW+20qZ+2YAsZK1swqJtbVYd5v6AgNeZU+mkVem6WmNIGKfxeFCxV0Dorl2NHGvlQOVjIHwouz7l0OlX/X8klN4M3192u2xWB35JPfzwk6boahX/0Xf17qpNHgGC3YzkbXebH2I7DFDp3d9Y4mi3WqEf/S/J534k+i/iw9i4ulRII8bIZdF1nZUfXBxkdpLQMq5Pl85FqNKPG1LOlib7rUJ/ITBLcpAEhGnrz8aeZVKO8YuBXiRniTlQrVVRvOOrFfNmonu6AhnfIFdxIaRpsIUGsL1HeK5kHSHSlcwuU9l2B78+Wsl1QfsAOvrS33SSnv2SQ/ndhhUYLqkE0B3xDwl+0H7TLGmZp2Pjvp2SSuPBFTZhqeKF4LH1htGcucdBHtYVX6dynGtWjHvQCR31ygwJn+K7vfA7ZKld/ITeha48Az02UFX0JPSkmHQKBCvCyT/DM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDdob3dzMmdYVXJiSzU5WXNWbC9TeG5tWTAzTDAyYW9ucUQ5eHAybmlKNzVS?=
 =?utf-8?B?VjEzb1k0b1UwOXRCWlNHeXVLM1dZM2NrUnZlVngxTWNla2dLS3JZQzZGY1Np?=
 =?utf-8?B?SUxNczRORFhqbmIzZ2tsaEE0UzdKckVoSjhUWU1mcE5ROGI2YjJyN0lLa3Zz?=
 =?utf-8?B?YTJCd3RnRzRZZE80ZWxaZGZlZnNrZkFvVHMrdHcwK3Vhc1B5RHJhYjVhbXdV?=
 =?utf-8?B?UmNlSWJ3NFNUeXo3WEtxbmhJT2VhZk9OYmVoeTRVYk9BT21rNG5vUTVPR1JJ?=
 =?utf-8?B?RVNRVmVMV2RKWXpmWHdObDlNNGJQbGozTUQ1ZmkxOXphRkI4UldJc3JjL1c4?=
 =?utf-8?B?YmRVaC9CbC9UeGZwWW11ZFZORFp1STVZelk4NFNPZyswbVN3bFR1RkVXWjRZ?=
 =?utf-8?B?UGFHRFpXaDY0dDk1Q2FsZUdqT0xPSytKUVJ0ZHAvL05XZTJjL2daNXVBQnRm?=
 =?utf-8?B?ODkvamIya0VDUXVjemlxakZxV0hZNWxPUTROa1oxY0ZiWEQrbWVURTdZTWpq?=
 =?utf-8?B?YnJZVGd1WTRuOStZeGg1RktnMVJkYnNJaisxMzhrNEZzSlNoSGh4Z2FKckRY?=
 =?utf-8?B?cnhBSFhobkdXRS8vWUpWR0M1STJBMXlTVEZRamxERC83NFZvMUNkUVRSN2sr?=
 =?utf-8?B?b0tiaEFJbVM2Zi92SjdpYTZKQTR1L2NlWDdraVVReVkxTVNCaTBsOEdKS0s0?=
 =?utf-8?B?ZHNleXNkQnBqM0dpODNtWlVxRnNkekJOZCs3NnJFbCtEL3M2Y0I1VlQ1Tml0?=
 =?utf-8?B?bGFjdE14eTN6eFZXc1loV3NmMTlIK08wc3NEZ2oxbVVvM2hxajZBM0R6UWc2?=
 =?utf-8?B?MzhnbDdiNXNnajNVNzRUM1pidzdUb1R2TldPcXdlTW00UmFiQVNSanVXbUZU?=
 =?utf-8?B?R2k5NkdCZ1ducVJ5SWp5bTZFeHNTVTZkNWxaVGdSRlVyQnk3WnBiQ0VhOElV?=
 =?utf-8?B?bE11ZlZyWUMydW9YUHVERHF5WEFCcXkwVHRCNHNNMjFxNTBKK0NSZnZMY0VN?=
 =?utf-8?B?QmFtNldVbFhsbm0xYk9zWGc1TGJSNU9MZlVETnQ2SU9NMVpBaVNqTVYxZ2hJ?=
 =?utf-8?B?TmZFVjAweGdHcDNCZ1dTeU5MZTVGb0pYeUYzT05aY2ZFY281WWlVa0VaaWd4?=
 =?utf-8?B?STVLeE4vUW92d0JBVnpvWnFhSUtaZUQ0Y2VLRkc0bFpOQVJ5dTh3ZzJYY0hZ?=
 =?utf-8?B?OFNNUnM1azZMQWp2UjNCa0ZpWmtCUlYwdTE2a2VkMmVpRlRFNEUwR1FnbXRV?=
 =?utf-8?B?RERTMTRhazcrdC9hVk5YMXNieVN6L0JENmxScHU4dDNLdDNGRUZUZXdCM1gr?=
 =?utf-8?B?M0daSnBSajNla01uNmhXZVZGY1VEWUZaNUpNZm93TSs4M3lESkdTdFIwTFBJ?=
 =?utf-8?B?cEJoNThHUFNPZXMyem9NUFNIbUFZOFJtdHBmQnZSZjUxOURrclFyTFUzSE1P?=
 =?utf-8?B?cDZ4K0w2SzlWQjdobmE5WUh4cDd1WXdmQ0QydjNYbDNaK2h1c0tTUEFoN3dP?=
 =?utf-8?B?RnBHSDlFVUpWQmV0eEdTOU5ZZURYQi96K0dlRTltRkpwQmRCbzBXNSszN3FW?=
 =?utf-8?B?RDExZmNsL0t6SUhCSFczQ0xOaUROS1J0aVJuVnkvTnFqb0xoRkh1MWFyL2JC?=
 =?utf-8?B?cmtCb3MwY2hQTGFwK3crRUhwQ3FpWXk3bERQRW9vaTJmZnVoKzdSb1VtRlBt?=
 =?utf-8?B?TWwvSWdJamFuWjlqR2FyWHppMitYMWtBWlVsYVFJTHYrTmVlYzYxWE1Oemx4?=
 =?utf-8?B?dGJPYkJEUC9YdWtxRDRtYko4NXQrVFdzS2U0bWpYNi9vUWsxR1lFR2kwSEw0?=
 =?utf-8?B?aVNXV1NhNkJQZVdBYVZhNEhycFVtejRjUnBXSlk0UTgzakd2ZStvQm1lVno2?=
 =?utf-8?B?bjA2OHFDbjJRK1o4S0FRaHlhbU1YU00rb0Vta0M2VStid0I5TFVPWG8zbHA0?=
 =?utf-8?B?UkQyQ0dKV0NrTmlRQlVvU2ZsMlpXaEpJOFV1WGZxajdIa0NqajFhT2NFc3Uw?=
 =?utf-8?B?YWVNUFcxYWxoc3ZWakRueUdhbU9Cb2E2K0laMWNaV051OFU4Q2Vpbjc1eWZU?=
 =?utf-8?B?a0JSMjRXeHNmWGwxVVhsTENSK3JtUkdRUUEyc2JPTE9sN2NNU1o5OHNQdS8r?=
 =?utf-8?B?ZW13M2lneXE4bFN5Rm5iaENSbXVvejZOdWJlUDhhbExHU3A4bE9KRHd4bkVh?=
 =?utf-8?B?UzBFUTA5OGlZYUJBTzM3NElJazZnUDQwSUNYSkpSV2xra0tuaFJkWjA3bHk0?=
 =?utf-8?B?VVIrYk51dGI5Mm9FTXI0UVVyaXJTR0Z5NVhCT1JCTlJkV3JmZDVFYkVUZXRz?=
 =?utf-8?B?R0EvYms2U2lRZG9XNlR0K0tNUWFSV3dWcEEwODFKODFVNVc1UTZPeXVQRWtU?=
 =?utf-8?Q?7v8sToIeVganvms5LpIYORFlYufivWLcOWoZQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ef208f-98a9-4bce-40a7-08df2df06e0f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:51:17.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXtfVwwIKg4PaYOUdNef4WJL6c3dni2MG14rqj5TWO8EPkC4WchyeeEkHxqnpjWUlEJ7U5EcwNF/wyIBWoXU8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7703

On Mon, Oct 19, 2026 at 12:57:38PM +0200, Link Mauve wrote:
> It was previously generating a ton of very short functions, such as
> <<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
> <<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.
> 
> These are obviously better inlined, although I wasn’t completely sure
> between #[inline] and #[inline(always)], but the former worked fine in
> my setup so I went for it, we can always adjust it later.
> 
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

Reviewed-by: Yury Norov <ynorov@nvidia.com>

Do you want me to take the patch with the bitops branch, or you've
a better route in mind?

Thanks,
Yury

> ---
>  rust/kernel/num/bounded.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 0b32f4343922..d3486675046a 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -264,6 +264,7 @@ impl<const N: u32> Bounded<$type, N> {
>                  ", 4>::new::<7>();")]
>              /// assert_eq!(v.get(), 7);
>              /// ```
> +            #[inline]
>              pub const fn new<const VALUE: $type>() -> Self {
>                  // Statically assert that `VALUE` fits within the set number of bits.
>                  const_assert!(fits_within!(VALUE, $type, N));
> @@ -309,6 +310,7 @@ impl<T, const N: u32> Bounded<T, N>
>      /// # Safety
>      ///
>      /// The caller must ensure that `value` can be represented within `N` bits.
> +    #[inline]
>      const unsafe fn __new(value: T) -> Self {
>          // Enforce the type invariants.
>          // `N` cannot be zero.
> @@ -350,6 +352,7 @@ impl<T, const N: u32> Bounded<T, N>
>      /// let v = Bounded::<i8, 4>::try_new(8);
>      /// assert_eq!(v, None);
>      /// ```
> +    #[inline]
>      pub fn try_new(value: T) -> Option<Self> {
>          fits_within(value, N).then(|| {
>              // SAFETY: `fits_within` confirmed that `value` can be represented within `N` bits.
> @@ -412,6 +415,7 @@ pub fn from_expr(expr: T) -> Self {
>      /// let v = Bounded::<u32, 4>::new::<7>();
>      /// assert_eq!(v.get(), 7u32);
>      /// ```
> +    #[inline]
>      pub const fn get(self) -> T {
>          self.0
>      }
> @@ -430,6 +434,7 @@ pub const fn get(self) -> T {
>      /// // The contained values are equal even though `larger_v` has a bigger capacity.
>      /// assert_eq!(larger_v, v);
>      /// ```
> +    #[inline]
>      pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
>          const_assert!(
>              M >= N,
> @@ -459,6 +464,7 @@ pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
>      /// // ... but doesn't fit within `2` bits.
>      /// assert_eq!(v.try_shrink::<2>(), None);
>      /// ```
> +    #[inline]
>      pub fn try_shrink<const M: u32>(self) -> Option<Bounded<T, M>> {
>          Bounded::<T, M>::try_new(self.get())
>      }
> @@ -482,6 +488,7 @@ pub fn try_shrink<const M: u32>(self) -> Option<Bounded<T, M>> {
>      /// // This won't build: a `u8` is smaller than the required 12 bits.
>      /// // let _: Bounded<u8, 12> = v.cast();
>      /// ```
> +    #[inline]
>      pub fn cast<U>(self) -> Bounded<U, N>
>      where
>          U: TryFrom<T> + Integer,
> @@ -510,6 +517,7 @@ pub fn cast<U>(self) -> Bounded<U, N>
>      ///
>      /// assert_eq!(v_shifted.get(), 0xff);
>      /// ```
> +    #[inline]
>      pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
>          const_assert!(SHIFT < T::BITS);
>          const_assert!(RES + SHIFT >= N);
> @@ -563,6 +571,7 @@ pub fn shr_exact<const SHIFT: u32, const RES: u32>(self) -> Option<Bounded<T, RE
>      ///
>      /// assert_eq!(v_shifted.get(), 0xff00);
>      /// ```
> +    #[inline]
>      pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
>          const_assert!(RES >= N + SHIFT);
>  
> 
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> -- 
> 2.56.0

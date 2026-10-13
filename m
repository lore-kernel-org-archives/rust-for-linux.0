Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0F952D2D6;
	Tue, 13 Oct 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913878; cv=fail; b=nI9U5LYjdY0MM4izeTe8CzDlIecgWZDqiZV2Qnr7mw6+0wE437K2Dqr3z1mVXoQJJJrSGLOQ4zjNsB/iwYA5sXJCw/PMcJBBBNfuPNoynaNFmv/49Hve6aM3LJPctgHueKaTHRJzSWb+F0ODSnB14IvAoh9HgSWeK2CCrTdR4nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913878; c=relaxed/simple;
	bh=F+O0cH23YrE+QlT77QQkn3TrTCaeWdLcWJw81ve1Rzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rk7biyKkwD5Gt8CSJBCiW+N/RkvulaFshXO7nGVzmq/k7LWGQIARNrK28UXtAM0NljbO9RgvPm8QQQhg+8gOpap42RgSrWsT5Ylrd26g5/jilZzki00+VHhYhhTC1e9i8FbzU5ICTpzKpC34yQ0Sw0+faafvQZmBHe1M5QKUFLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KXSuiV7o; arc=fail smtp.client-ip=52.101.85.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KXSuiV7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGeA0EJSZJJnNYf/mpYWbEt/atdApuvmeDLOpIY74L3XMk+uNraB7h+DqtyDcQzP22OpHooi+AHuHUfKK122Qs2Kwg46D8KtlAXR+77lbRxis6eAew/DOB/IS5SFNWftHqv525QMAGOf5dO9gikOe55mjVTexYqjO+IPAYd91/2LrzhrJajw6eGEy3aLDRUpes0ZUH2JxqOCAMuCkp4jHcl1XY04xHpbgK33cHxBLBDXOTiBfNasdU53sxdys7DmF4/JRc9pc6WRhuHJTF6ssfhBTZZXqQikaNUprEeV1pDRLmt39W7TpXdjZA/XTK10btmxeVPiENYvIZDy1Nk6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgBwOyYfvc/o/laDR2CqipMwpBfSu1yrSzn7tbMbhyo=;
 b=mccOZJt1q2fZU2fxCmhhbTiJJbBTPwzXMgxaPadCE7X3q9dwCJv95yGOPJRk72B8gUgZN7Zl4TUnsoIibZda0sgNVualsS1b0+eZebMWxkYVkYoJxEWaIy+Ebh2tpYlgV9ciCP9uLWrq/2BLuLJB2uicB1X0vetpHW4t+Fgtq0J1d857MPoLCMjh7IczKcyK+0mQ04nS+ie4QsQc7lT7J+BY6CKWgRGxyjX57oPINAQwOOibAFQXr9GfkkctMcfIk0Nr+o/w6FsCv7up4PA9TMIIhx0DaPBxLvgYPlrakw7WyuX7+Jj1Ww3/kjXQ98k/lSPeO2aW2OMJhq1lGjOcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgBwOyYfvc/o/laDR2CqipMwpBfSu1yrSzn7tbMbhyo=;
 b=KXSuiV7oaS4BKPjZmrvRG4LpNKIT5bgpY+WEz1jrPTxpVosjWKG86UbrnSdffyMd+R0ddYM13rbQ7dSj0m4jl4wScDQHcUejKSXVB3MKv1kN8V/p1G5jsJJHnO6C7gPwwBDoeB1/UNxK1UOqlqZdfndwHp/aFq/Atbpi4net33FuF3bldYXUnGWvfUpkZIsGGR69nxC9ShpgKuDB5IcSMAiqFDL0D6RJtWxA/2baKApCKECSP2jNGi+n+urSyfTvXktxdSHdGAAQVjwNZq9DYMqmfJzWUNGaBxyZ0njpmh1n0T8FNrjpC5TwFxCnQU5qcqcfK9ZypMMVOz2Hv18ZbQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.24; Tue, 13 Oct 2026 17:51:08 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 17:51:08 +0000
Date: Tue, 13 Oct 2026 13:51:05 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Burak Emir <burak.emir@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C
 function
Message-ID: <as5vichbCjVqghhD@yury>
References: <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
 <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
 <N2kT-hptgLwPihxLElO65tqya2Wmnmv46TH2XIDsL2pggz0Ezs4mqNk2iHWS1zdaCIlPncbX20HMJuQ-Blrbmw==@protonmail.internalid>
 <asz-GkGHJYHdhDLr@yury>
 <87jynmcbb9.fsf@kernel.org>
 <CANiq72naeMk9tUq84ynuf=yJOLQtZYixw2T5AS7TCmESsvp_-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72naeMk9tUq84ynuf=yJOLQtZYixw2T5AS7TCmESsvp_-w@mail.gmail.com>
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: cd562ceb-4fb0-4730-e551-08df29528f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7416014|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8M+Okzh9WJSg5ETAtCNgV8hQGAiyCfAuaJycWlDsPCaPxX8PcJ+KTNlHX7xecH0gwAi5vh3nynMjQILEbZVLrXpLpvX1fXH2dq3Ic+TQaWzOwISY3jxCQAkYG0oXsRLNlQ/ZZQkOvEXXdoisyBidKpLVs+KIcujnorhYxHZnCWoAr48I6GiliMGgKhAm++XmgCOF7soUaKcvyGaLcnB/YLljuKGufUNmfZ35Wx8nnDnUqZBhobAOq7Z7Uv0qMUBWs4Y8uTBtafXcoxC3DHddPqs0y+CwB7vR/6eXDk8ys1Qli06gB8hDFfleD+kxNKapy00m00Wvbj54kC4LaMhzfH8c2O4uXigxdpnZ5Ap2l30gu0SryKvxqakZ5Xuxvm7E7N/jNKcCu0H7ku0LpKRo9L+RzA8vOVkh0rxIHHdzNFS13e9TkLhKqMpAm0biTiS3chGux15ttK6PFjTPC4X3A6uGd8jo7Rrz8vNiTjsKf/XmM7T3DpcpT6Sd3tpwliQMHGiphjamWvXftPRuW+y45Wrprb3VhlCKon3TjqfzVZrg7MKojXUH/RzxhfWArEi0SwDrM4NpecA+F5ZHkK7OKQwb2hnnoAkQQThKaZzF0GabwilwGgXpyNIu1X9RfUuNSepRf7gdk9eW4ulZeyZdCaYmU9l2ByrDgukeNOIWsU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xBYUpNcWhiUk9Ma05mTmlRczFEQ045em1sdEFzN3hIQzVHK3o0ODgzNnox?=
 =?utf-8?B?ZVRYOEs5dUdzdnhaNkVrUTZsOFJSRm54NnZERm9sc2R0ZjNKazJSR2lkcEFN?=
 =?utf-8?B?OXk5NVRyK2NaRzdHai84MUcxRU8xZ1dRRk5wUGVYeWxvdzBNckZ6MzZFUzUz?=
 =?utf-8?B?cE9xc2hHMGVTR3RBNDZscVQ0L3hYbUZPOHl3UUlITUU4eVhWaHBLNzQrYmtH?=
 =?utf-8?B?NmlGR1JQMkVOSG5XMktFUSt2eTVqSDBFc2RtWFdjdWdKcGtsb3JUazBUc25v?=
 =?utf-8?B?N3JYUkZmMEVlYW5kYjlmamtHeWg1QmNaVTF4bkliUVdoRUtYOGRQSVplckg0?=
 =?utf-8?B?bTlMNzViZTRkdkFEU3FZbldpU2xqUlVxTlArK1lWWGE1NVg5a3Y5UjZ1dU1s?=
 =?utf-8?B?R1NnTFRZbTFOU2d3VW9SZlJHZkt5SDRCL1dxTGk1TlBrZ243L09BUEV1MWxJ?=
 =?utf-8?B?akZDdzhDVS81Q2NhQXpmNFIwVjZBdXc3dWxoK0paNWl6TVlhUHZWcXhnWmFF?=
 =?utf-8?B?SnpKSXg5MVNweEZ3bERsVUlUOVVkc09NYWhrczJEc3NMNHZrUkVMaWZxcWNW?=
 =?utf-8?B?bGdsRytPSGtsbEVnUDQ1eVJrelc3cG9wREg0QnVhWXl6VTM5a3NEa1NMWVdS?=
 =?utf-8?B?TjNpVTBjTWlTWnFoNHNWTEI2TkU2T0VQWk1nWjNpVkZKVGFNUVhGMFVMSjFv?=
 =?utf-8?B?ZEhZN21kUkQ1QUVpT2IxclpSSjBIYm1GWnVVWTl0Mkd3YmNYaGxRanZ0ZjRQ?=
 =?utf-8?B?U2FESjVUZlZwZUtXdEdpc1UxZ2MyODg0K29HK2pCSGNhQ2h2ZEMxaVpvS0Qr?=
 =?utf-8?B?K29FMU1TdVd5VG1QZFp6SEluSTZBalphOVVpVFdzQ3UvcmhETVJrbzd0TUxV?=
 =?utf-8?B?UmxWczdKWHhiNzhzbEt4TUFIWG4xV1o3SU92UjMvQU91T2FIbGw1OElPOHIx?=
 =?utf-8?B?ZDVTVm9GdVlCMGRVL0R6anZISmVmZnl6NXg2bW5PYlVmRTBaN2hYZUc4QW9h?=
 =?utf-8?B?KzJZd3QxZy9LRlBJNTRldE5jbFJwUW1POWJxWjhicEFDaDBGbFNSeGNlTW1t?=
 =?utf-8?B?cVNiUEt2NzFiN3BnV281djhwZkFVM2Joem9qQkpkNXdtRTBYdkxndXVyb0NB?=
 =?utf-8?B?YjZTVEhpUUFVQ2hZSk43NlNlVzIrd1NKZUR6eERPcEQwZ0Q1bUJRbVhBa3pv?=
 =?utf-8?B?djdHaW1VVzZxcUl2NG5uUWNnOElNV252enRPL2MwcFFUbzZYdDZyZjZyOGxX?=
 =?utf-8?B?UEN0Q1RERzB6NlRTTFMwTlUvK2ZDNk42Ry9UNXZ4NWF2TlNpckFaVUdHT25y?=
 =?utf-8?B?RWxoM21qVmdTaXBFZUVmNnVFbXlZU3NvTEJwZ0JEbE45WElQNjFxY2RPQzJk?=
 =?utf-8?B?STRBNVgrRFZITjZMd3FoTzNnTnptTVJiYXViemp2QWo3ZnJUeVpaRXFHSkVF?=
 =?utf-8?B?ZnFOQkhKSXlRMWc2UG5wcjYra1diaHBqTTFRbEkxc3IwVFI1T2VXMTZHNXhJ?=
 =?utf-8?B?N01YNkMrS2czYUN6Sk5odW1nN3g0MWk4cG1YTnJuWUpGRVZxaDdjb3Bnb3dS?=
 =?utf-8?B?UStPUWJCd081bzIrUEVvY1ppamRqc3RRRlJVTFVQZUtBaGxNM1cwVjE2MjM3?=
 =?utf-8?B?MnJrOExXT2VJc0FyQjlzejA4SXJYUWNocjc0NW0vaWdRakxldGN3K1NuanAz?=
 =?utf-8?B?UGJWSS8xT2ZyUTU2RktnbFBzZFZKSGY1ZXlwN3dXaE40RjJkcG00WlMxS2FE?=
 =?utf-8?B?ZURhajV6cjRGd0F4QkpwUytHdVAwS3V1TGEvUkRJT1g4LzBXYzZodUI5ZnB0?=
 =?utf-8?B?alZoNWlYUXZCTVRLbUNUVERjZzlOR1dMSjBLMU1UOWI0Ry8vdlYwdFdxbW5B?=
 =?utf-8?B?aVlGNUlDQi9ZM3R5bFVqamE0ckYxT3JGVGxpRTZZbXpLUXlpZzRXeGF6cyty?=
 =?utf-8?B?YnljYld2WlVReDdFSUlBK0RpczlKbWFERXYyQmt6aXNZcFpjUm1ka0ZVaHk2?=
 =?utf-8?B?OTRacjJtVjJvOUtKNzArYVVmOStmVHdEd0pkNkhDV0FpUmtneWI3OFo5MFRP?=
 =?utf-8?B?QkUrUFNnT3FSZUtZL0xXWlFCSTdxeDhMbUh5MmROUVRnWWFWOVNHTU5XSHBX?=
 =?utf-8?B?c01KVjA0bHNzcXo3UUdUb1g4SE1icEVSbmtwOG5TQ0kyeW5Db1VKSkJJZDNT?=
 =?utf-8?B?aWRLUXFQUldWbUw0M3NpeURnZURoa3ZhY0FCS3pscXpudEh6ZWNzd0lFbkM4?=
 =?utf-8?B?ZldvdkFVT3h2TW8xWDhqUEFkV0xORGg3bVIwMFJHeUMwaGsvUWhSTjVQR0tX?=
 =?utf-8?B?YkxHN2hremZGaHNzaG9MLzJWbEtjazVjM1FjYWpSVGZlRXkzalc4U2Jhbk1G?=
 =?utf-8?Q?371h82MD1UlakqJOYuE8VzJBS1MFTUe7KrmUn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd562ceb-4fb0-4730-e551-08df29528f3f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:51:07.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaO9rbohEJ72ny/mn/3NWNwgqke/NFG2gv8EtNrUK7WQAnhURWApLS1KYxLMGmG6HaXqzDBvtcVsBQ7/hRaxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216

On Tue, Oct 13, 2026 at 07:27:39PM +0200, Miguel Ojeda wrote:
> On Tue, Oct 13, 2026 at 9:24 AM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > Ok, thanks.
> >
> > @Miguel, feel free to make these changes as you apply. Otherwise I'll
> > send v4 next cycle.
> 
> I think at least for this one (#1) it is best to have a v4 so that it
> is clear to everyone what we agree to finally, and there is no rush.
> 
> For #2, I guess Yury or I could take it already. Yury said he would
> perhaps take them (not sure if the Reviewed-by was so that I take it
> or as a self-review, Yury? Thanks for taking a look at Andreas'
> patches, by the way!)

Sure, np!

If there's no rush, let's not cut the corners and send a proper v4.

Regarding the branch to merge in - I just wanted to unload your burden
a little :), but if you prefer to move it yourself - my reviewed-by
tags are already there. Ether way works.

Thanks,
Yury

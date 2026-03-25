Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020108.outbound.protection.outlook.com [52.101.195.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579D3DE437;
	Wed, 25 Mar 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448475; cv=fail; b=jaUf1GkjVeN7opxQFscVw+QdsXCFGf4zZsLO7FcJPJtzK7NZcEp+3NPbgSqjxeBbWNC0C7MNXxn3RlyNWfVmZnkdbyMaNT/b6khTOR5qj9GbOvZMz37dltNHJ1ZnModsWIIypVuqLfh4st4xC6sn3tqLZ+M/OV3CtN/xWhxI7/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448475; c=relaxed/simple;
	bh=X5FJ2qAEPrLwIfLS/oURtgEJw/I7/OJMuw7zjHKKYqM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=uf6s2ik83luP8CVKeNUd2bF6v4Ur7DQkf8DrdgcpSHwSIaezFNjbo0zSXW4tRx2Mb2LKQFJHwo8hIXLO6Y19wqWVlwtPyZ2hfA+W+TrFEUQe/95f4w7RWyEb+lbfv0B/nR6zJJE2OyjjGyF7Kb7RrQCmg0LzY7rGtaBt8WV0gXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=B/wbRzU9; arc=fail smtp.client-ip=52.101.195.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="B/wbRzU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCzKoakYGn3c2/mpVMNTa4XFfo1GFN5MwaZ7S28JKvwLbGnhIioFcabS3J/ymX8gPQw/8Fww63qid0eT5jY2wjQkohI+9LhckLRz+xb5dzMpVynweISFpzRyneoY4dTujB/38vOSnaRpttkRIK+Uf1MmmTmnVS8OGStbcMx5GoRi87gqJeh5wqkXVwgjxRAOMy3Pq7axCxG0ihLC++oa+QeTNXN8MNoz1IL59qJ0RzOzwKEq7qzqdCuFOzZoKyNKgctoZuCzwjypSkueABqAIQd8dYZl7Dd27ZA/goMjgAToEgz3bjBJOGGQzYRyEEkjynv4/6r5Pvp01vE5t+xRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdVEwq8kefFgc6/jhPUjMP1kUO+Mc3HBRf7HxME+8qY=;
 b=nv0wffGmWHK0x7IZLloZ6wAgosUxz3gIifBnjRpDfRpjrhzkpakvLDOEPDjxr+EbaI3GSe//RrKJOiyNqeExZxChwOaHb0m7mleYQ5j8MisMbc4WWN0VjiTNnOsneP8FD2/Or1uHplnFCh+9HSvaYdwFste2TRNxZ1nn0szRG7MpJp4oP4E3U6kxF/bSL6S70rbO8SCz6IOqFrtj1u2T3K8nPuDVe/Z7rOh8MxFAfgRsvr89UjAsbBorag6kBF8AQNxVa/967pUkJqzfWfk/jQHYE+H0Hn3Xo39GZJbiaigCazCTt2Y06pWOaFir6V3w6D/W2/9PnNL5lWGoVmllXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdVEwq8kefFgc6/jhPUjMP1kUO+Mc3HBRf7HxME+8qY=;
 b=B/wbRzU9aOp1xCu0v7STUnDStqo7kQJajo40+vdA0adxDFC1+cVtkM3C7SXd1xd5wKDJdUzxavRifyJjyl5yIfyzyK5fELbrYuigvuj6GZynvls9i8j+SINnMERuPN6gRKDjVNBGB8IvOAg2miTjq07oneV/heinBcG0N1jgd+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9134.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:276::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:21:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:21:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 14:21:08 +0000
Message-Id: <DHBXHH3C6CP8.2TDI49QZTPHJP@garyguo.net>
Subject: Re: [PATCH v2] rust: Mark all from() for Error functions inline
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <alistair23@gmail.com>, <gary@garyguo.net>
Cc: <dakr@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <tamird@kernel.org>, <work@onurozkan.dev>, <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Alistair
 Francis" <alistair.francis@wdc.com>
X-Mailer: aerc 0.21.0
References: <20260325005118.168814-1-alistair.francis@wdc.com>
 <CANiq72nEaqGwnRO6SPJ7Ky85+X-U3ckYa4Z5cg=Uoqi9fwHBMg@mail.gmail.com>
In-Reply-To: <CANiq72nEaqGwnRO6SPJ7Ky85+X-U3ckYa4Z5cg=Uoqi9fwHBMg@mail.gmail.com>
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 40dda54d-83d4-4939-ee40-08de8a79c2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J07gokU35DEeJC7mcT1kyxiKpE/cqaRmuAHmd/d9+Pbc1XbNPy0OaQrBl+An3yx/WU2CTP24+ObjpmNWq8zV8j7C5xTJ9rpWZvASOtsqmAtsXdJa3kRClBgEdFFbmjwfW2L6gOWp7+yZMaaBHaiELcKqsymr1PhS+1o9g5DT41WZsdcywyURJbvmRnVYbz2xJ073qrXwvoZ9D2WcyVHCcViIHLTph64d1kwT2R46FheY1JB23YO5nelIopI81IW0I+9NOASRH9WA2ZSf9erzIUZ00+ySqKUzEeWWWDj6pBh92VbU5nfiDtXWG7hYfOC2y1bflMe3wUMY0/1+v7NH1TvPD2vjcHY4AFo32MVOExoYrzaS8kpT2yPFXPCcbhAGbcyd4AUi0v+qaB1KpyrBkPteuK+cCUrXkdWyxB3nyZUOsgS7XvR2MOKRSSpC9p4mtrxgUGMVU9SGeeTKyboKLI63xucxo1go48tPuz+6DFLo+hxKlc/AJTdEbZTqOguiYE7vrYJ0NYT0yGp1UnfQamXct4jvomhTKVva8bH55YTd2nj//OAexVgoLvrXrOBiLU8pIriQtRSV7kPHor02rq4LPNBzEHKym8mbWHjaYRwdhn+5r3CZcu6/uwJkMLcqJwNd4n2vMwY2WahGMVkP6021GknrckQ9bhcfQ6evIY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THVJWlV5dkVnUDM1VG5CdFEySDRUNUpneXI5UDVIdUJtU2dJS09OZkQvc3A5?=
 =?utf-8?B?KzdVeU9GN21FakYvR0xod0RpNnRjd0xqMzRpMmJOVkJsOUQ1MzBpUWFuZmY2?=
 =?utf-8?B?alp3QVFoYitLbFRkQ0ZsN25WYWo3RmdBczdIL0xjV015bG56SXViRFRrM0Rl?=
 =?utf-8?B?N1NEUlE2b3dpbjNOZTV6Z3VXSk1MT1JJUEtURkp6dFFiaFJ3VkZWWWlPZ3Rx?=
 =?utf-8?B?bTJLbGxVaEdkV0lPbkZIOEc0c0dBY2hneXVjbXpuQnNMa1FaeittcjFIMDkx?=
 =?utf-8?B?QU04U3ZWTUhOMlp1OGlYenhZMWtGakxYcUpmeGI5VFB3QUx6VkVJUGRaTmZK?=
 =?utf-8?B?a2kxdXBJbHhBYXIyZ00wdW1ySTg1dEFDbUVxS1N1N3dtRkFKVXFYTzI4WHkx?=
 =?utf-8?B?UWhZWWwwL0R3a2hLa2N0UWVkb2o5YkFHVnNPVmpoVkgrSDBiWHlROUp3VjlL?=
 =?utf-8?B?UlFPUXcyaHY0eStibE9yUk53UWI4VXI3OWpGRlJiTmhEaTNHRmRUZkRoVXJK?=
 =?utf-8?B?KzNlOWJONWZZVHZNZ3BtWU9rRkxwZEdMU0RIVW1JM3VRMm9tV0N2WDV6T0F1?=
 =?utf-8?B?MFB6ejNVNFNHbGZiWnAxOGp6S0wxZzYrNG9DMXFDRkdBK1g2UWNYZXhlSUdW?=
 =?utf-8?B?Sk01S1Fnb29hemJmNjdtUFVudzMxWEhOTUlSRU9CUGlyajVDdjlRMi9CVHMy?=
 =?utf-8?B?bE0zTHJQR3VhS28xK0hWdlNaRk5ueWVZd3NDbUR0cVVHdTdoWXZwYkpZRTV6?=
 =?utf-8?B?VDZGM1JXZzdVdTBvbWhtOWgzdCt6MlBrdmpKaUtPRTZNWE9TZDQ4VEdQSFhu?=
 =?utf-8?B?VEgxRks0Y3NMVmhFR0FmRzhBZGhyT1l6UkdObnA5SGVCa0hFZEF4OWpieEpZ?=
 =?utf-8?B?eGsvT2U0clZFMnp1Z3BPUHRBZ1RVa3d3YkR2N1JESnBrNnVaMzRCdTQxdUxX?=
 =?utf-8?B?SEc2emVGWkFmcG1rVTVsaHFLb0IwQlpKV1ptdWovYml4YnFXQlJyY1lSVXhw?=
 =?utf-8?B?SDVsd2FIa0FaQUQwQnkyM3hEL01yQWdjZjJWK1RudTdTMHk2ektkSE54bWJO?=
 =?utf-8?B?U1RxNWpGQWMvRWFjN3lwS0hLY1lxSWV4Z0pBWm9RRlFiSHpFeGQ2TEFHVUN5?=
 =?utf-8?B?TXB4RFhvSzNsajQ3Y0IxalBPdlo3TG1nSWxOcWhjQjNkYkdhM1VCbEJyT2xO?=
 =?utf-8?B?LzZMK1pLUXdSU2pDVmMyYmhpazdOcCtBaGM3WmJkVmtmL2Q1cTh1aVRyTzg1?=
 =?utf-8?B?L0RWWnNSVm9BbGR2NXhZdnptS0paSkl6Qnd2OTlUMS9SZVoyTVhWTFBiYXJz?=
 =?utf-8?B?cUtQTHZaZkx2RXdnRjZwZlBBN3M5bG1WMDJPbmhJYWkzTm9oU0ZZYUxLMFZH?=
 =?utf-8?B?TURKMW1Tb1ZBSHRkcWM0YWkvZ3dzMEdiR0JORzRUNE5LbnNFUFhjYTZ4NHpN?=
 =?utf-8?B?dFJ1TU5MNkJ1cW1MQ0FvNXBQNis5NmRrOENxRHNHdGlSS0FDVllITGZVRlI0?=
 =?utf-8?B?VHhnQ0pOL0RMaXRUNmE2VHJteFdZN0VOWEtnZU9QSHN3RzNqbDBXNDE1ZGJ4?=
 =?utf-8?B?QmxiN3FpYW5VamF3cUEyM3ozaXZHWnYzSlBRV0h4RkxlOUp0bSt5MWdaOWFs?=
 =?utf-8?B?SXRTZlkvNytXRWZzNFhQVGh5d2dBTVpEWHVYSHZKYWRLZjVvaFlpMjZmTWVB?=
 =?utf-8?B?d0hPR1B5WjNsbDh2aytLRmt6S1Evbk82clBETHZNcDY4RHFxUkZhQ20zbTBv?=
 =?utf-8?B?UzNiUEQ4SENGVmwxeS9PN2lVNHNaT3dDSnpYbmFrVGo1TVhoQUJKV1NoUStS?=
 =?utf-8?B?MGhZTmRzdk9HdDNoZ3dlaXJlN0p6bm9iZ3pZYllvS2JuNktQMzJRVk5XY3hR?=
 =?utf-8?B?N25wcWI4VTBDWWhTY2QwczcxT1d4UEVGcjhXWStOeFg1L0pLckFZK0d2TDdC?=
 =?utf-8?B?TjgvK1JpOXNsS20zUGJxV1k4dGpHc2RxQUxxOGlxZS9nZXV5N0dpMVlRNFIw?=
 =?utf-8?B?QXdGVmJJRUtGMHVqK1VKbGc0UGRNVE9kQ24rbFZNTjNYb1JvUjVJaG9vRHRX?=
 =?utf-8?B?NXJpRXFuMTJJYnc5S3F3clFKclBCcFBCd3pyUWkzWHZRSWFQT2ZwN2JManVn?=
 =?utf-8?B?aEVvVUUxT1RGMytZNkZBL2xqWlBRREJkTVBOWDZlRXlqRGNob3ZDUnk2M0pn?=
 =?utf-8?B?SmlMaTFQYnhSTUdlMzdScEpUTU5UbUZ1S05VM0pmTzRZUElOenJUQVFwbXpC?=
 =?utf-8?B?QllRTlluUlVZQVNybGZFa0g0ZExzRUZwSkZhRExqN29jbGx1ZCtaaGlabnkz?=
 =?utf-8?B?MmJYc1RQUmcwWEtSVnZ1RTJvdk9SVm96aHoyWDdGWlRmOXRYMjdFUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dda54d-83d4-4939-ee40-08de8a79c2c1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:21:09.7985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa5QEWO5d1yDtd+JZXIbpsrsgAYQQQp7CmS9No+bgSHNLnM5IwVLS+hYjgotvyT78T0BaiyPSHfFFb4NpR1Ing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9134

On Wed Mar 25, 2026 at 1:19 AM GMT, Miguel Ojeda wrote:
> On Wed, Mar 25, 2026 at 1:51=E2=80=AFAM <alistair23@gmail.com> wrote:
>>
>> 1: https://lkml.org/lkml/2026/3/13/962
>
> For links, please use the Link: tag (and also please use
> lore.kernel.org for mailing list links), e.g. it would usually look
> like:
>
> Link: https://lore.kernel.org/... [1]
>
> (By the way, the idea was to create a "good first issue" for new
> contributors in our issue tracker, but of course it is also good to
> get this done)
>
>>  rust/kernel/alloc/kvec/errors.rs | 3 +++
>>  rust/kernel/xarray.rs            | 1 +
>
> Thanks for Cc'ing the maintainers on this -- now the maintainers may
> give their Acked-by's! :)
>
>> rust/kernel/ptr/projection.rs    | 2 +-
>
> Gary: there is no `build_assert!` in sight, so it is fine, but perhaps
> you wanted to have it more forcefully inlined because it was trivial?

I just `#[inline(always)]` everything there :)

I don't think this path is actually exercised by `build_assert!()`, so it i=
s
fine.

>
>>  rust/syn/error.rs                | 1 +
>
> We don't want to change `syn`, since it is a vendored crate. It also
> runs just in the host, so it doesn't matter if it is inline or not.

I wouldn't mind having it, but it should go separately and not be part of t=
his
patch.

Best,
Gary


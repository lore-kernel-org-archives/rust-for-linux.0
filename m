Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526336165F;
	Mon,  9 Mar 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082259; cv=fail; b=hW6kdwhB/MvF6k/XaaANniaPO2gxYlIS1AJnkjQ97yDmoLP0xP8CKH/WmifoihRyjwKJeQNIMhYOuDlKHi41q67daFdroMFJJ0UOtT4z3l1BVp4e2IxRcQeMg3POo/fuk91cx96wRXD221eVKLDbhfljN/fWG+XzkCHTBtrmqaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082259; c=relaxed/simple;
	bh=6L0h/uvgHJoUE52vSIaDQoGjhTKkGuv3bfbAygOKXz4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ku2/0bkbLo/GAPbpg9VNWiREjgEET3RqvC/AViA/UdumbiBqZLw0nWd+lSP5UQBo+9NlZ5S7J52zA+kuUALXihmoge27a55R2AEVITW2G7i6Ap9SS2lL5LglUoP83lfoKl8e8lq8WUyylSoxWYM7jY/V93FQ9DtKvtc2ESd5Ja8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e1nPYu9Q; arc=fail smtp.client-ip=52.101.85.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e1nPYu9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiITgI8K4BReopvQPUyEcZwS961CNjfHYiHB4qNlbjnaRBUJIQ3ua5Qc5zsu/NkjzN3+RGRT2wfkhdBd9WsZKEXSERuv8UZCqkSg9CCu9PppjxhqqK9Of5RDJGcxeTlVhI+WTYdAyS+GXSJrPeUwIIA0T3UxT+usw/empkmTyfXRup7TBnYZeL0dT3egzoGvn2HBzpSyBRslcyvJXYlGzr44t0sVuJMFpO7tka2AP58NoF0eA7/Z32wPuxvDhSaOQRuUKD0T4Y4VXHVF40oxt+cwRMQWelPzL4TNaweBFRT1p7B5e4feND/Qrl6IOIir+XH9RVpyTtPSETRCfccr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp7uND+dNWi7RwJq81esupNnnputZj3fiJAmZk+W0JY=;
 b=SPSUez59tD5MwV6GxO5wAPH4e10d32kY0JjM1PonyCieSWcLfpjPRIk5xOWBXZ9tnYP7L3ZRkYEb9TBAxvwgNiNJNhxr37GIJitsn545V3TW8vO4kkkPRsVO7IjPtuwdih6Vc/OIp+49BEhH7091wxRiOUQa//SwoF9tywupVhzq1NGAuvBjpi2tyy9ooSBufgo4lvt97T4A1Co7BcIxPMtK91mPCl2cOaaAtP/mRuoAD0c0rrpiHBblTBboU7vrU5n9OyvWJWW1Qx9OyztNpjEWKu/Zakpny9aox6DUeCBtJV8caTQ5LCDc9fcSBGYJMRsqWlvssGKkekDhD7YDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp7uND+dNWi7RwJq81esupNnnputZj3fiJAmZk+W0JY=;
 b=e1nPYu9QiFOSwm153doMBoroDv1HM4NBXGTXc0pFvLY3ZJwQ1r/8hn+F/ZlGUo4mwif/7jAhj6PYWMdbSsr8gO2woMyRRCNlyG93cU0rl46P6yV5In9ohU1eGdwwU0JJuMnstwmhCR5BtdAciXS+FsKEnKG37vQ9yI0RoxadKAkNdZqwQAHY3mqeJAAwQsc4pKpvgw1Xsiu5aB5zD6K2CeUJ82fmxBZjTVB4mau7Ur5YWcIQK/Kg8e7gnEWOIUtvhGb6PvA87Hy2jdIIRqI0gB3EU5RiGnhm0E8AEty7WpiTkJTTEI5C7xkCFNLawOz/G9LdamC48pOTrze+gn+p7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 18:50:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 18:50:55 +0000
Message-ID: <3e0d1765-3012-44dc-8314-d5e2c9323b94@nvidia.com>
Date: Mon, 9 Mar 2026 11:50:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
 <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
 <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
 <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>
 <DGYH0NAU53UK.2W84EZ63W5ZZC@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGYH0NAU53UK.2W84EZ63W5ZZC@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: de3b3fc0-10c4-4c5c-6ab3-08de7e0ccb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	U1PYm8PpBLqQqtdm/cB0umFOPu7kUTrW42/Gx9LGtiD6jylXqb+zUSZteknXFhsHh+koHqeJzye/K4iCh8nBPJSG03w7Hk9FJQBFU1C8bw7CbiCtWi0qwkBGEGoN842bM6SieGsyOlOuJn440rLZWXb6aEPgffFm4zSDm/CuvV23VczlAe72IJEJy49t1JDIvYMtaNCrEMdqQTp3rp1oJI5wIXnSuD6rvSEebQLdsN4yK3CFTxnKgdu+IQ3Nc0eCEbVqMfDMV7HhQTRJ4ofTRBAYoEoeoj6zJf2cRgWLEWvxA0XCGMghPQUAwhvYNJp0Vu00KWgF0CBF259/fC+TxucHO0kFJejZA0UqZLaDol7EbKc7qoyPpfHnvVn0j2o494eWp6wr70yATm18Qb9eCIYPJrF8lBuMjHxT/pXsfFMAaZxJe3MrApgRmYYQa+0PRHatQ06vVNIkslJT364lbjHavjoXQEyR/nj/5VqPdpGIBJKXB83zcj+FjOp1CJfuPEDljyu0miHJzTMlSNcaOmHjHlK0ieCjdkjmI8pGEo8JXF3eh8Z0LJm7xvBpGIwdg+s8a5TGDyAXfbKYvR8XMRdk+o+n1+DQoPIKmKk4Y/ePTNmaYz1yGJJJfhsGKlE66qZXcY3+uEneEc1mTZWMetBMoHjrwpkXF2g7Snkcy8E/dRRYLrIhpUwurNkc2zBJ6pcM1DTG4Mgmcft7+3OEuAGrD6hwK3NgHENT5NVzqYYogldJ74KQFzivJdOBISPKF+EIJ6jQz8CMCFrgz+k5Fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkozbFZ6UW1yYURmdzdYU0Z4V2xrQzFBRUxlS1NjMlQ2SjVYZVUwT3hKSlYr?=
 =?utf-8?B?d0k2TmtJdUhvRTIxRmcveFRmS2F1VmNWUjMrNk5YQld4VXRuckMwSkE3RVhp?=
 =?utf-8?B?M0NNK1NVdGs0cTk3dFJKaGpDU0VrYWdBUXIvUVU5ZCtyZWhOTEtlUlV4WUVI?=
 =?utf-8?B?M0hWNU90QkFmWFdOSzVJc2hPKytlZlR4ekxESjZETXBPRUFlUXpZRkhlNFJl?=
 =?utf-8?B?ak1iSlVIclFibEwvZXNsbzhYQjRZNnUyZGp2Q0dPcWcrL2NzVHdaeXhjNCtI?=
 =?utf-8?B?K3JtNnlUVWdXSGRwNUpqbnBJVEVEekxCVGhNaDl3WFZPdDRKNmtkbk5kYVVO?=
 =?utf-8?B?OXNOMm5PbGtsOTcrUlZMenVISlVBVmtDdWhGRDBqTWh4YUN6dklxdGlBWkNU?=
 =?utf-8?B?QUNlaE1sWUhWQmJxbTdqT3lHMnBEWGpuaXlJUTJIVDdrQW5hdTk5dmI2Q2xi?=
 =?utf-8?B?aXI5SzBOTFN6WmY1ZkN1WERZZk5Jc0o4SXF2eEErdUUyL28xN1pQSVB3WTBy?=
 =?utf-8?B?Vm9YamVGY3U0U1NqTFNVQm01dldOYVNXZTZDTTZLRHhRd2JTWDJFbmJ5VTlq?=
 =?utf-8?B?SEd0R1VuRWFuT3hCSG5EUUVsQjFwc0d5cW0rWDdkT2ozTjZVM293Qm5YWW5o?=
 =?utf-8?B?R3h3SGF2bldNbDVZYXdtK2kwa0h0WEh4Qy83b290eFlHWjZmbElPNEtLSCtG?=
 =?utf-8?B?QURYdnE5SUJZbkVjK09pOHVmdy9nWlpERDRteFVRc0JkV2p1TGY1MXk5T2ow?=
 =?utf-8?B?Zkl4Wkx6bGpyeXBwSUFkTXphNGRtWmM4L1BiVElKWW04MlVZNzdOL2wwbFVY?=
 =?utf-8?B?VGJOWUpRN0U1L3pPc2JEaXFOMXNLSllCVzMyMlFaaHFZUlc0ZXdaMjl3MlFx?=
 =?utf-8?B?cjhHbjVHSTNvQURyVHZUUVQyOWxQbnZzbzcwVFlUQ0FzbVYxZ3E4SzN4QWZp?=
 =?utf-8?B?dXM0WmtkU0djYm8xc1JtOXZrTm5oNDZXeFZrbWtKUUgrMDVjUTMwcThQWnZO?=
 =?utf-8?B?WVpTeGl3VDJNRXBDZmhSZkNYZHYrZ216QkhSY2JtWUpEb1llZk16OGFXRkJ1?=
 =?utf-8?B?a0IxOHB0ZUw4TnRFK2I4bHhDeERuZnRKWTc4bUtZVkJBMzJ0ZUhFNGlYeksr?=
 =?utf-8?B?OVpidHV6WWY4SXk0QUplNEtzUUNNWmZ2TGZBK0VDUlVuR1UzMmdUcG5nNzFQ?=
 =?utf-8?B?YytmemJReXJXU25FZXdqRlFWNkdxeU9vcTFJWE5nVFFQdU1SWmJ2WFh0TUgr?=
 =?utf-8?B?bXBEekFXUHd0TCt1OUV6RHJUcHJLLzRvdmtKOEI1c1lxL3djaGwwVEZVeTR6?=
 =?utf-8?B?ampPL1pVWXVYNWtsQ0xkQWJ0a1VSblFqYjR2eVBqc04rQU1LTHZRVHBuTmhJ?=
 =?utf-8?B?bGRjcC9LTnl4ZVcyV1lmM05uN0c3c1dxd2NuN014NWo1UzdQNG5qSDBzRkhP?=
 =?utf-8?B?cXlqNmFZUEdUc2FTWHczbXNJOGNUTHdwR0JGZURGcjRJS29wb2E1Q042SlRy?=
 =?utf-8?B?bnQ5Y0ZkTXNrb2p1WTlxQUVvTVd4bGtHeVpGd1loUGE3dndxMGN3Q09wQXkr?=
 =?utf-8?B?dlJPc1BWYUdpZkdnSWNyWDBFb2twNEdLOWs4djVBRWpPLzN4SERjTXliTVVW?=
 =?utf-8?B?ak8zanhONFY3VlJpQmF0UEdhZnVEVG9YeWRkTnpBcmxjckJvOUdaYXpRMU1G?=
 =?utf-8?B?OWZKQUppSEZCOHBaQ1RmS3lrc2lNQlRGUmZacjBnVnZqTEM5WjI1K1crblF1?=
 =?utf-8?B?VU4zV216RHBCa1NQeEZPdUhWR3liTnBoWWxTOHVKWEt3NzVSWVhpTWl2Tis5?=
 =?utf-8?B?TGFZZWxEZ0Q1RnVvTnZLR2pJc3lRYldHSzMrTEFscTcxMDYxanp1bk4wcW1w?=
 =?utf-8?B?ZDNielpydSsvL3RRQWk0b2JsS3hteWRkbnNaa2QvdU9EcGdXekx0Ynd2b2pF?=
 =?utf-8?B?czhhWVRMQWdRM013aXlTazZySXFqL0FrU29oVU1veWpNTjJtZWYzL3ZKY0hM?=
 =?utf-8?B?SG9uR0F2TEJ0ZEZnR0JIVHhBaWxNVCtGeDZKam9KTElLSEVnUzM1SE9SQW90?=
 =?utf-8?B?bXFJRFhnKzRycXZZTmVvcWcvUUM0Ui9kM212aTUrdnZNL1RhM2Qyd25OZFp1?=
 =?utf-8?B?c3JYZmVJa1owejVsS0R2V0RuVElxclhPRVNDU1cwMW9NZHdPeFNDK3pEcTlM?=
 =?utf-8?B?QW14WTByQUJOUGFxYm5ON29yd2Q3ZHozcm9IbUhXOGhQVzhrMGhyQzdVYUVm?=
 =?utf-8?B?ZFlkTTdVbWhDMU8xRk8weUhscE5LdVRoRUc5MjdjdUVLc3A1b0cxNXpFeHF6?=
 =?utf-8?B?ZnFUbnN6V2ZncTlOSWk5SXpoU0hZcXhrMUlFZC9tUmp0R2k3VklRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3b3fc0-10c4-4c5c-6ab3-08de7e0ccb58
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:50:55.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUhhQhHT6osvC9xkPWp0VSN6NczB/YBpK6h2qVYiqxCAsZ5UzIMh+JMSW9IYSoBO62pdi85PFgdGmQXfG9mzjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219

On 3/9/26 11:42 AM, Gary Guo wrote:
...
>> The idea was to separate constructing with a zeroed value, from
>> the actual register write. I am not surprised that the syntax
>> is All Wrong at this point, I'm just hoping to spark more ideas
>> about how to make this clear and nice to read.
> 
> Separated construct and write is just
> 
>     let reg = NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1);
>     bar.write(WithBase::of::<E>(), reg);
> 
> (or `bar.write_val(reg)` for non-relative registers)

OK, so I think that Alex's example was sort of a worst case, because
if we wrote it as you do above, it would be clearer to read.

And hopefully we can continue on to what Danilo wrote in the other
thread, which makes it even simpler and clearer.

thanks,
-- 
John Hubbard


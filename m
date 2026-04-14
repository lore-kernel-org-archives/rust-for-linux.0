Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3B2D131D
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776146617; cv=fail; b=FzNQqLNR5QBhyCk8QVJ/ez08jY5QeR3lXDgWxxTcjvZKV8clpgdVW2yWJu5gZCFTkeXwDkXVUpbEH/pbmU/ZytD7tc3nRgV21Bj8nJb3J+5w8dg6PQg3PvXlYESAQtEpza5GjGwcgjlNxp7DEmB7yBRG2LP15AXn9WuJRieM9ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776146617; c=relaxed/simple;
	bh=EuI5cW1BIUukoxd42FR9FWVLwBmoqzyE8U+FFJAGw0Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=F8fnRNyqCVsLWZIzb7/18+90YONZ+MmB+P/pnm/6zvZJVcJwH6YGFkvYgOQbIUVZwauuVbHdzY+93zEiWrA776YAySUVnVVV0fdiuxzs702fIWlbuzeo8k6QO52mMxl3AGBTooTkGMTnqGupX0Mg/B45FKuZ9U/gmyXPIdxpYoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jqfQV0Ix; arc=fail smtp.client-ip=52.101.56.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jqfQV0Ix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adx+wmNnd6FceDev0VeIHHzKchWb1Vx9tzD922Lt59y2YB1+6dJrWAC8lyubep4xpGvHZrYP0o0lofdY0lntg6yAFvtiCNOEoYn4CUq+4tWkzaDf7c6gKV9/aXNlHL8UPfJX+Yz//jlG7Hi99eDdnM/N574ugqDqRY2YOjGLaQuW1ccD6RdBkLRwJL/fjBNRi4snRATcWXBluqMGpTCLiAdZsv9UeKaWqPXfTBiIOiSMWQ9t5BEX+6dEEHYClRCwcU7WlnKTglWhUaJH4+ixp6rY8gtXsT+KXqVwWyfzBDHwjRfByta2n+CCli74+qR8j0m7mqBe4rQj/ZCUfPP9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwpFu4ykAyiucnqXZ8OD5jTCNy3c66wZoJRkn7WIWZI=;
 b=Kz6gGjJTdWXxx3duR2CKMu8bFJ0cH8Rv3nVSdIorp3J2O48ygQeLSttDe0V7V5TF/dkVj4yJ9vJ9b7pqcrSBxNjHVyD4YKil45/OjoEl+AJN4jXh7AaLkAHAQbfIKCtCaHPaUCmmAyME2k/4ksoHQXH6HvUD9piOS8/9YQAdwEw3R47as6HYcZg12kb6bx8Uxmr0wK5jrI2OgdAya8ANL+TY5rLUydrTEjGYhrclonCm0nSxVnJhmTP5KGxnyqY7icPuyDC3wefdtvn3E3N55LRQEEne8pqFhKdiGnbUgjntXOhyYut2mckGtEq5KsD1wcmmelJqPCC4pH/uF3cvOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwpFu4ykAyiucnqXZ8OD5jTCNy3c66wZoJRkn7WIWZI=;
 b=jqfQV0IxrAhYk7yBqDXWl7WsM0Lo6c4PWBMVKhPnLLOHh9hJCJxR7Z0FMP+kL7nJDkwLySBGXFHTA9FYeNQU8nlxS9SGgEvX/wtKCQ8escf1BxuvWlt9cLvs8bD2zkCW0UPSyTluyDuxcbiiSYcfz7WMRhPHZewXPeSZpB5AHsxN0jHonLfKkfB7pISQ7bm5yY2GDKCRWpWZMToDf1j35tK3Ylb9INas5bsuiknfnRzMQdfm2NVuFlO/RE5YRPEuw3CuBbcMEZBDUNwWAb9rqALRhCpDUm3btVcsMDqEbYOLsfgTBeLNKnfVFWVwE7WTJv3m5lxHbrGAoFk8agrleg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:03:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:03:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 15:03:28 +0900
Message-Id: <DHSNFBLMU1L4.1A45K7QUFPXP3@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-5-ttabi@nvidia.com>
 <DHSH2KPBYD22.3AWUHG3TCVAVY@nvidia.com>
 <30ac632602debeaf649e67ecd2e0698786c19517.camel@nvidia.com>
In-Reply-To: <30ac632602debeaf649e67ecd2e0698786c19517.camel@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:604:221::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: b3149311-5351-4679-f19c-08de99eb8e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7AEJzDGOl+OgK9WcBlf1wKMKLma2v16EPI4CIhI50fu6PhBIOkZlx5vbZLx1bNF+VpkzrH6NCOfn9nK8q2RmrRLNCe1fkGUkvVhTAn/Y/paZApu5o4VHby/wjAaf2KXSrM9zxtjXCNmICycSweskC7/vFNVeSBZLO5t8lBfXV9EoyDGuZ4qGRwxzY4PQ0H/buE7+q4Eh2kNxLec7lrF4IxFAypzv8FqSCsCvX3jA/9kVPWMQ/UqC9w3GirDPfr+sq3t1k/W8O/dTubl4rkxOQKXEoHsXK4UhNKxSPds4i7l+SpTmNBTpbPY927s8ZAzEGamF4xQinn130rn4v96OkyTECX9mBpIy76rmW4A2cXyqKnpk9A1vj5vusHRSyVt2JnVHlWQG59UgYwxSqRY0wIOuRe/aQlVlmyEFpN3J62N+Ms1rWbwwONxxe4pFt+UhQlBz99+Ig7lj7ECxMOX8H31pe2Ar8M1JyXYojCBWIXTQi3wYs6kGssOo/e4/K5vSB5NqQa/QDp1In5rxG+7dw9ooT1mF4acNzaT68qpjt4op+jeYDOR7sU0ZMfXEe8QhUXFAJ9Eru0Ryb7De1noIj3k/Yktb3UVkLTn69tasJ153+nAuHT0Bsy15MYb0u4S7l0dubd6YwcnRFWwPMDPViM2yk+e+u384wEUu0ZazrB/XEfzgQCqOzsqBQ5uuYVADcgvQyPON5jHhHOg8aTm9MvqzirLnKSwsM0SE1mgPrkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW5RZjllZVU0aGZGNzFhSVMzOGs1SkNueFZ0c3RMMkVaN0dkcGhFWCtIUkNT?=
 =?utf-8?B?Nk0xbHhaNEIxQlZFMk0xMDUzZUdtUlVTTURGQy9YbGc0YTQ1QktQbU1CWTV1?=
 =?utf-8?B?dHJhdTJianQ4SjlKOXF1bkRBdi9zU2lHeEVXTUQ5MG9xQmhjTXlRM3RhSWZs?=
 =?utf-8?B?QkxGSC82dFJEVmI4eWdoNXhDUHJ6aWhocGkyenlnY2dTT0Y4UG9PdXg5RDBp?=
 =?utf-8?B?MnZGY1g5Yi9TeE13SjZmbXVNb0JKRlNWVHNzKzRDRFZ1RktITWlwek9TUFFr?=
 =?utf-8?B?QXIrdnFrYWROVlp0azdZMGNnSVlMTXc4ZGpjeWMwQ0g3SXRLZW82RmVNNkVD?=
 =?utf-8?B?b3lNVXg5VmJuTm9FZ1BNSHF1eGgzUkJhd1hsWEF3ajJURDBwQi9VSjJFVWh6?=
 =?utf-8?B?MFVDMGpmVEt3SFV1ZVhhek5HaDNQeldHMVJJQURzeWNlUUUvQllCNUgxV1BZ?=
 =?utf-8?B?ZzhGY2dnRW45bkFsQ3JhZTRKajl3Tm5VSlluMzBIT2h0c2p3aW55N0VZaEFB?=
 =?utf-8?B?M0dRVXlaQU4xV0JMdzllODRDVVBnUVorRTh5NFRld1lLV09RNXFvNGJURTM3?=
 =?utf-8?B?WGdMSXl0VHdiZlFwclE0WHZ2ZnlHTTVWQ3JsUHduem5MWmlCVUordzJvZy84?=
 =?utf-8?B?bFcrU3V6dmNCd05EeG1uZ3c3djdNRmRDLzM4WGNvYWxXWDYwc3g4SVM4NFBj?=
 =?utf-8?B?Uy90NVh6V3NIaFBVY1lMOWt5SmhNSjRzQ2JvWTBMQ2MxaEZ4YUxNRTdzOUZU?=
 =?utf-8?B?Y0EzU3U1S0gwdVZTaThZVEdoQkduTHF3d2dXdmowMDJYQU94eWFDQm5SVjds?=
 =?utf-8?B?eDkvMERPdkV4U0ZaYlFBY29adnV1bGtnbHh6K2NKYThQSC9tS0VYQVFxS0Fi?=
 =?utf-8?B?bFZIVVNlYmpSV1pxVDcvZ0tjd2VnZUloVUlXUTFudFpITW1vdVhkMWJSTmE3?=
 =?utf-8?B?RzF6eWM4R012SktoaGVxYklncVlTRUxva2x5Mk1hMFBSRFFvWFBEc1dKL09j?=
 =?utf-8?B?VU5TZGliazlnRWhxTXZ2UzR4MWI1TW1UcGgvZ0hzR3pvN01lRVlsU1k1Ty9u?=
 =?utf-8?B?MzBBMzI4MmJ2SVhsM3BqRjRPaTJlSUhQbFNldkNZRmdDbUdsYmdaaSs4TTBF?=
 =?utf-8?B?SjdoenMrdStrbVFWT0ZKY1RoN2FGMUdhOG1LNnBSTnBqeWtRVkcvdUpVcFQ0?=
 =?utf-8?B?SjJ3U3hncXF2S25SdS9uaUZIa0ZMU2VTRzBEdUc2VDJJdkhud2V1bk42Z0Nv?=
 =?utf-8?B?VVliTGZDKzBWSTkvVzdUNk95WGJtYnVOOVhFMDFoZ1dob2QzN3pHVjFvbG1o?=
 =?utf-8?B?VzhiTDM5amRSRGxVRnI0Q0ZoRmhCT3R3dmJSbkNvdjl4elNPVmY3d3p6RkJV?=
 =?utf-8?B?c2I5R1gvcFBpdHZpQzJaSEw4TDRVbjhUYVZYNG8vQkl3Vk9WYWpvbENvZGp4?=
 =?utf-8?B?Zjd6RmFzVTlvTGx3K0h5b2RZc2JueU85QlYxekFuSm5tTG90aHpiZzEyUyt4?=
 =?utf-8?B?bW80L2pUNUx3Smh6OG14Y2o1Zm4yZHlGMDhieG9DNERoem1WNkxoeDg1MnBP?=
 =?utf-8?B?MHBrZnpCNUZrKzBJcHdXanJDM0tCeG16bWZoZmo0Zlh0WEpPZWd2SERMQTZV?=
 =?utf-8?B?R1RFdGxrS3JYVGdKNlY4VkNVRUZmR3pCVjZ3NVhCa1NUa0dnRktueDBPRVAr?=
 =?utf-8?B?bkpQZWhteXQrK3kwQkRFM00wV3pnNFJlMG9PalhOQi9rUjhhYlRjVXk5N1dS?=
 =?utf-8?B?dFFnK09kUFp5T1p1L0Z3Vjk0NUJYUnVDcHZJOVYyNGFiRkJHb3VYYlp3eDdZ?=
 =?utf-8?B?UXZkd09NN0x4T1ZUODVxZkhLazZJT2ZvVk0yWmIrWjVWMWRtaE03VUErLzls?=
 =?utf-8?B?V0FUUTRpR1JZZ2NTL0tmNGpFUkZ2aU9DZTlXeWpwcjFwZndQQ25VVExodGp2?=
 =?utf-8?B?NHJuOVpSR0ZCWDg1RWl3WTFGbXdGQ3J1aTAydjdxSjNSaGhCR041cldIME5h?=
 =?utf-8?B?L0I0b3kvSEJVVzdXeXpvQzIvQ2ZtcGl6cndjVzk0WnEwSTdCZVR0dXNPZk9o?=
 =?utf-8?B?Zk5tNFdnRC8xYUt1VUNiSXZkRVhIM0ZOcDRtczBUQkgzN3A5R3ErRGwzMGV3?=
 =?utf-8?B?QklPT1ZNcWUvZ0NoOXdCTk5Jc1BOdmIySVFyOUZDYU1pWHR3anRnejkxTE1N?=
 =?utf-8?B?NXRtUHRlUjU0V2VFS3Zlc3k0SlFYaElkVFFkZ2NNUVlsT1hIRGxMR1NxTnN1?=
 =?utf-8?B?R1ZGbk9oT1dsYTJhWXVkay9BV1QzaTNMUzlOSFFkVis0cnRlNFBUM1hNc3d2?=
 =?utf-8?B?bDVRN2F5am0xSWJQc0FieXNlNnRFRUhPQ3V4d1g3d0c5NHdPUnVuSi9XcFlm?=
 =?utf-8?Q?4wCiL9QnUEyIQOKdvEaFExtQL+pnxxQOxx9CLJW4jRebi?=
X-MS-Exchange-AntiSpam-MessageData-1: L/EHaU0bDqiJ9g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3149311-5351-4679-f19c-08de99eb8e72
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:03:32.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37UhTqjejMA0pBXXo5uT/jFAs6GJaA8SrKEg6TLomEZm5wPRj1bUP9vC518kXelXAslFPVrEc6LgNcbWnW9MqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

On Tue Apr 14, 2026 at 12:13 PM JST, Timur Tabi wrote:
> On Tue, 2026-04-14 at 10:04 +0900, Alexandre Courbot wrote:
>> > Note that we cannot use supports_display() to determine the FRTS
>> > size because there are other GPUs (e.g. GA102GL) that have display
>> > disabled (and so supports_display() returns False), but the FRTS
>> > window size still needs to be 1MB.
>>=20
>> Order-wise this should probably come before patch 3 - I was a bit
>> confused about the fact that we are checking the size of the frts region
>> since it is defined as a constant until this patch.
>
> I put it in this order because we don't want to call run_fwsec_frts() if =
frts is empty.=20
> Otherwise, frts could be empty because of this patch, and we would call r=
un_fwsec_frts() anyway.

Good point, that makes sense - taking my suggestion back.

>
>> > +
>> > +    fn frts_size(&self) -> u64 {
>> > +        usize_as_u64(SZ_1M)
>> > +    }
>>=20
>> This implementation is identical to the one in `tu102.rs`. As a pattern,
>> when different HALs use different implementations, we define it into a
>> function that both HALs can call instead of repeating the code (see for
>> instance how `read_sysmem_flush_page` is handled between ga100 and
>> ga102).
>>=20
>
> I figured since all it did is return a constant, that it would be simpler=
 to just do that, but I
> will change it.

Yeah I agree it doesn't change much, it's just for the sake of staying
consistent through the codebase.

Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636F6372B27
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 22:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699860; cv=fail; b=A/LMERpGqqpUHrtTO2Js82ckoWauBbd0Kp5Umo1gZdHFSySxoPS4f2XqFzgPKy/1yrFV0J9QFoqew56vYDrAmwvtPvg0QX6UHTjDFtUrHCVnwWY7W/H+RWnQm698Vc8pDD1rpZQ1db/NSM2FqXu8avp2FQ+2z3Uhc86drQg4+WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699860; c=relaxed/simple;
	bh=Gi638K9YjvM+EN+O89nR/3inI542Mm2Qaz7zV10/DlE=;
	h=Message-ID:Date:Subject:References:To:From:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=XWv1XYdlZIQTag9cRy/1Gg46rhLvKJOzmWPk+NpO/5M8u9dDNQUT//qEtpgJyX2ktD9dFdEKkbwS3aqTAg+0Zksxa+o5SotW7sY7ylFXddNrtRWvzG+R3yaQHNc/dT32OQl2ONixH+UoQhhwXxIJoA5Z+a8C+vhBPkKg/HPGFvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rSwyawZU; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rSwyawZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkkMN8hDQqR53Qhd/GrxMb41k8pxQwfuJHZHWIvd7RdDdJVTlNGglS4ypbL2TAm/NbiZwbv5gMkowtde4n7S6NQQSIYKbFvURZDk0KBW18uDnpAAxY1t7Qh9TjpuMtbb/WtXgD1bU6QIGqWjBwikOvFBI0njJgg+h0jEO33slY1CY+2aWex5C8lDPf0QMx6fU0SHe4/b8QQLaN2ogMARktCHx+FVnGxW/QHyjpzPokpbLsQebwBVetDxQsdbngUAHtTDh+MuQ+JrzApoWE20gIKvT6eds7Mfj7No5pITKl9Ze470uNmvk9G8n4QyiOUlqrK+76ksZLpSUO+yTTbzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JjK6qlOPNubc+Py9tIQD5WBPIO8SRr0WGYv6+MIVmQ=;
 b=HmlWBPXYeVxU5ZGz10TBzEsxIu/+ea9SkMzb9GgiJIEU1A78ViTi3qR4t327iAb7bgtQpdYIct8bZf9c3AGXkIRF2HPjHuKwWkXUegTpB9RbtPUJTz6eDLcutCC6l255i9q1co15YrtZcSGloVWlRwDmMovSPciUrLmL4HM/ASZz8fJ6KPAsLWWQiKIINbmxZMm/8cmfq/Zl/akulC4tU8++icKRYDMDnMG8X3MSXHvf7s5NgaEcQ6KasRRJNIjjOADpNTSeU9hKKGmf+7/MaYVAekDJ4y54UOoWtqElP6EU8FbDQSD6kC/l/q1RLvcmtalwnCE/NW8ohP7QtkOn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JjK6qlOPNubc+Py9tIQD5WBPIO8SRr0WGYv6+MIVmQ=;
 b=rSwyawZUSDFfAZN6Z7A72Xv1bM/LyfB9ZlWK3wR4FWkzrd++ZrF5Lpye6wjGQcntKq4cFCrw8GqI9b7GBrbM1pJgyzK5Z95a7HlKjtdDTU2tTnj+guQhzzUV2w3eRT6soeTBITvh31psu9Cq48AiIxGFoMlzsBvjsSP6QW58V7JaC8DZwnZT8x7u1zFffLCNQulm6YKXGjrH/Ynm7ECYzuQBbd6Fy6IZcIZCEX8ukTrwWIJyUyAS08qhBo9GLFa6ar7WNsleMqV0eaZCLb6IuqOdKTIt/3wyTpcYEGu2+lY3e82WOTOTi2bNrTsatj+fpglS3Hjj5HlXxuJpKwbA+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8424.namprd12.prod.outlook.com (2603:10b6:208:40c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 22:24:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 22:24:09 +0000
Message-ID: <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
Date: Mon, 16 Mar 2026 15:24:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Nova developers: avoid nouveau mailing list until it is fixed
Content-Language: en-US
References: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: John Hubbard <jhubbard@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
X-Forwarded-Message-Id: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 211247f1-93e8-4064-a450-08de83aabe67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	79PGybAkQU6PiNEVN6CiTBsW37NCZuUTSU18xhNNOaQ+Ys/NHJH1g8ffpG0tBsZR/V7s3ayn+FTkygl/qj9JyG7cCIel8iI34sUs/exhMEoyEK7QwYXt24K1J6KR+/3MXijd46KzqQyu6fEovoI9JZ4wRMdTwxTkAOtlk7GRncyrwYcJygRYPTySlxqme7N3OtWVrVYRXxn3GG84UWglldds+kgonlzug+aPhaXHzopvQwNivigIcDbYxjPVM3w7L395UUvEkFrRfDecjJCvsxtCaSkW+X3v726c/3bE74MxgmefmEEE1JOhpH+/aM+b4QKkLzQg5JQkhKaxwJ8Pn6uHGpkGJ4XdpavcN7stYuIBKHUdmkvJwxia98pWUnPEKHdlKNnXMzV0S1Wot7/gsaPoil4Yfe+AC9efPg6RP/qmKh7taNL71e0j2biISB7TaSALKCKO0D6wUcuJR+yt0J+8QJwRcsmMpDgT1ZTQOUTcn3HJ3ZV4UbU/hWjqQjxUwXgEjPqrB+r8vudy+Wyoq5ZiGxNrV/oJwIH31NNo+cIlbg+fodo6orjrL5p6yjnmXvL/uxyhthqSicqJnjMV8cdsQfAPh5cbC4CgU6QOlBOMt2PylCzaES7NhKblq3Ho3Zd83YqpO2lbkVDjVf3i+rxo7ZojELlVg57CFF/blp4+Gn8KY57OWjFVO63DWii5jEFZndi08c7UXT3ZLYA4HT2UeChR0vffNdI1olsbcfk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2EycDcrMUxZUWJuelhPQXQ4b050MWtnTUdKOWVueEI0bTJ5b3gwd0gvM09k?=
 =?utf-8?B?UE53ci9ab0ZKVDhRTi8vdkdHWEppTnY1Rk52cWVrY2tSdGM3WmZadEtYUDBH?=
 =?utf-8?B?cURTU0pQbWNuK054OUpSNG0zSVVMSi9GVjJJSHhjSGtybC9lcUFEVTArY3FN?=
 =?utf-8?B?Yzh5bW5YSC9pbjJHMmd4WVhjQ09kUzM0TzVwOFQ4UVhYRUpwVzlWdjVpT2R1?=
 =?utf-8?B?K1NWaVJaeVllQ0FhdTRMLzVOWUdwL2MzYlJ0bjBoQkJNMWFzbW84eHJPK0x5?=
 =?utf-8?B?UzRHdTYwV3AxclJIQ1dqVGpZUW1FZDNvVGxlMUFZQmlOWmZlUHE1M0VPUmxO?=
 =?utf-8?B?am91ckR4aVhIV0Vab3N4WGFZZk13WmdoajlLblVhNmJxVFUzcG8yalpad2dj?=
 =?utf-8?B?d1JjVjB1cHNHd2ZQdHQyNU1VSXFPRHlQS0ljSjROdFZ6Rk1DM1RRVkVJWXph?=
 =?utf-8?B?dkp4Q053U3RxWWdCM1JZeGEwZHFMdmZWUXpqcHBVTG01UmVvOGhDdlFMOHh4?=
 =?utf-8?B?cCtSYWxTcG40NVhIMkZFRzFtam9jN1NLbzFaaDMxbVcxQmtuaTMvNkNaK29r?=
 =?utf-8?B?UURrTUkzRmxqc2hmZlpHa2hoTnB0VDQ1RnpRUVFhN2YyRWhveU82dEhRYVMr?=
 =?utf-8?B?cCtDdFhxRVE1Ni90SXhSWXNzektwSno5VW9xM0t4am04RW9HOTU2NGdmbzFv?=
 =?utf-8?B?SjNNTGtpU2MwYnh5dlkvN1BUMCtTSVlDc2o3dFgrb2ZtRGVrbXVTV2c5cm1h?=
 =?utf-8?B?MzhKa2ZvSnVPRjFZUjk3RjlDbDVnNFczVmFnVXlDcTdJT2VkeWx1ODAwejBl?=
 =?utf-8?B?T3pPTzMxMFQ4aGVPNmloRk1KSS9IY3FZbDJwMzRGbTJzQUgwQldlL0hFMmY1?=
 =?utf-8?B?WnFuYmQybC9LbEtCTGx0Q25GaXl0NXBjUUs5Q09JbHhSaTVncURkRFF0Q202?=
 =?utf-8?B?NlhrVXEzZ3FkNk9aeVFwT1ZkQWt1cDIvUXNWSVgzT2RteWVjOEdRanZKRXhW?=
 =?utf-8?B?ZXh4azc3SHhsaG5MdW9CTUFMd1JwSGp2U2tnSm9Mc2M2cGsxOTZ4R2ZDd1g3?=
 =?utf-8?B?RlkwZXB5ZVhyNC8yTnc4RlYyVWZvRWtCS1djVVVzc2I0cFB4K0h0cHY3QWNE?=
 =?utf-8?B?Zm9rb0N0YXZVVEJlTjEzb05PeWpxcEtIQ2NTWVFwK3hGczNDY0w0eWxic3FO?=
 =?utf-8?B?NjBzU24rSTBKaFEzMXoxQkp1TGlnRFNHUlN6dFdyclVYWEZvNWtTNE1NcEZY?=
 =?utf-8?B?Uis1bmZjUzRzU2NOdzBwQ25sT1o0WlVVZE1yUUZ4YWVEMXVtQ1dQaDdQL1k5?=
 =?utf-8?B?Tk9BbW5qOE1tQlBTdjdKZDZJV0c5Rk9CQ2ZkTUo3aG5kaldQOGt2Rm45ZktU?=
 =?utf-8?B?K04xK2JYZi9PcWJEZWRhWmdSWTJJWXJRZlpSa0RZMkN1M0YvbWUzbHhrRTVX?=
 =?utf-8?B?N1IrbjBHV2hUMmtrT2cwZmZYZVhJMjV2Z1JaWVZuRy95N3RLV3RMcUh6MW9v?=
 =?utf-8?B?V3V1Z09oNVpudHBFSzFEZGdvWVR4TG5JK0FEa0RjV2U3UmVDZEpIVEl5NExq?=
 =?utf-8?B?QXFJVXM4UVRhQWtnL0x4bW5BM3NmM0NKSFRSYmZMZVlsVUV2cGFKOUgwRjdu?=
 =?utf-8?B?UkpmZ3RhckIrOUJDNG4wOUhWV0tjQzhHTWhBa0l4QjJlcFcvZFh3NmxWRXpR?=
 =?utf-8?B?R1J4WmNlVURtWUZTa1FZYWNMQy9RZWtaRWxHTlU0OHhyeFdId01pZk13ay9Q?=
 =?utf-8?B?TjZBQzRndDNySThPZyszZ1BGbC9zSHFOSDg3TE14Y2lNT0VhSmpSYmF4ZGlW?=
 =?utf-8?B?QkNDNWxndW5SMXZ3MG5Xa1N1MWZIWDVkdkJrcG1lMG9ya3E0OEVzY1BmVkdB?=
 =?utf-8?B?UlhyZXVUMHBrT0EwM21na0g4ZkJUR3JDZXhaZnlMdGo5YWxQNm5CZlJjbHhG?=
 =?utf-8?B?a2RkYzdCWVV4Mm92dGo4NkgwTUV4V0xJRkVoQ1lzNWZrb0RMTFE4SWk1Nnpr?=
 =?utf-8?B?ZGQwWDVQU0VXcWpNZWNCUVh2aFhiS0tZUGd6VDUxZTRPNXBFTjh5ckkxaFJI?=
 =?utf-8?B?T2ovYzR2NUtaMmlXalJhdm9IYnJVbFpjdXJhcTF4ZUlmTXRNTTg2M3dMR3hG?=
 =?utf-8?B?aEUzUmUwa1JEQ002L3k1dEdtRDl6Ym5sQ3VtNlJmMStRd3JscWJIb0N3eGVH?=
 =?utf-8?B?R2w0Nzl6TGV2R0lCa0RmTUxzS3ViR1FCUVp1eEFxa1RnWFMxSDYxN0ZnR1lP?=
 =?utf-8?B?R1lvUEYxcGFpQmtpdDZSUTVaTFB3dWtYNS9lVzNZWjZtYVdXeWJodWlmNWpq?=
 =?utf-8?B?U2tac2dVaVcrUlRyOWhBbmRaR3oyZWd5elAyYXJjdlpmOXBxSHRIdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211247f1-93e8-4064-a450-08de83aabe67
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:24:09.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p8qBhcGJnPASId22ZpTleOOSmnaSGV+u+Eu//uKSdKPIg8WCot/7Rjsxw+3uYhAsL+eoxg7lWGcoLEsIYl0vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8424

Hi Nova developers,

My name has again been stripped out of Cc on your replies (only), despite
being on Cc in the original.

Alex Courbot, Eliot Courtney and I, working with Konstantin Ryabistev,
tracked this down to a problem with the nouveau mailing list, a few
weeks ago.

The problem shows up when using workflows that use notmuch + b4.
Alex and Eliot have work-arounds, which they have applied in the
hope that the nouveau mailing list would be fixed soon.

Meanwhile, seeing as how no nouveau mailing list fix seems to be
showing up (Konstantin, I hope I'm wrong there?), I'd like to recommend
the following temporary policy:

For Nova (nova-core, nova[-drm]), DO NOT INCLUDE THE NOUVEAU
MAILING LIST.

And if "someone" wants to fire up a new "nova" list, that uses vger
like the other kernel lists, I wouldn't complain. :)

thanks,
-- 
John Hubbard


-------- Forwarded Message --------
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list interface
Date: Mon, 16 Mar 2026 13:57:11 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org

On Thu, 12 Mar 2026 20:50:34 +0100, Danilo Krummrich wrote:
> I did not give it a shot yet, but given this and the other nits, this is beyond
> what I want to fix up when applying the patch.
>
> @Joel, can you please resend?

Sure, I will address all of Miguel's review commentsand send v13 shortly
(probably by tomorrow).

thanks,

--
Joel Fernandes

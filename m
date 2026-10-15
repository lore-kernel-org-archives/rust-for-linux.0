Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51F251EE1A;
	Thu, 15 Oct 2026 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068269; cv=fail; b=s2wTEjnLlttFDzAiLlFsOh1ztxOi7L8RCT7H7dhMM24Azk/ZfRTwQUaTYqCJRHrIgu+I+0XrtGixIzryjDL9Z4Ltp9yhiN96xePk+Q+5/bS+Oh0kZDREzy4OMDcCZKd0HQ64ILEHPUWIgNFudH5/iAVi6w/MCcJjJAaYCGe6ky4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068269; c=relaxed/simple;
	bh=Q1nOuE4oxPl6RgciwVJEElkmFcjUvG4KbsSRAZfaKuY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jD66sFHZxIuuQJSOGqDZ3HqOWH6J02cnlm36M+S+6CFtOruo+e0dgdNdxkKYp9kUjeFI5t7JhrbbZZP8nWqeR8HC3YUJge/rIskpfp1fYZtnoqa961r1Y3whU7hrxbRdggNW96yjnT1BYuo6ynJJwGao90+6xEYlnFP5sgW6ZBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SOCEuIzH; arc=fail smtp.client-ip=52.101.61.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SOCEuIzH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFsXTwg6NJGSgfRWBmwtKyibRlKcbiZJdGqSe7xz9UuFenOpUKt9bDrOzWV2NFfAriSavxo4QGrHGPxf+zfrAe8eORfjv9tBFPEoZ5sg8p8JitT5PhylDj5OrwSvp71ynhUGZAgylsK8DIZ7dX/Gt5rzUnVRMgDGMl002zL0CaEbsThPR10EMHiz0SUcRdvrVvhVYktDgpgKB+V8d2RidlaPSfzrEW8dbCFerOIT5MF9JHwVYxlVGwiqIXUgbY0IWl2cbMJ+hW+gXd7MosLT3lDOyvuG12DQ5+qD6Zakh47hTLWbIphD9yQRVjnvauKaeFcGg995OqX2tCsvymPkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeXbgsCS8ZxtK80yqHFuIvifMxbJrIi6FTA352EKgO8=;
 b=k83GYOwWwJ/UNscFTr3sa387zsAk3FKSyJCLHbt4sW+d6x/BzxNtdQTIgFPhhVlY/sYkKBj+gtwk2/KsR8CVP+dmK8AyCyW4PU3Z/n7B8+ezmwkGWk8GqmkOEiyY2Y59Snnc2sHviCERI3qxasbZrjxhalQCuBhOzzIVKdBN+kAEyROd/MXPII+Va2jHZYZyapn+6XjUWWgVZQL3MZ2S1gkMxouNetiJphKcLs+y3ox7bxwfiT/GqdrpmbGicz9vus1lqypin0a94TEyn12DSODA3G8KoGBetNdrXPc+G0Qy9K7q+m5lzoib5Q+PzR+PZOdXDQ0lNkfiOhbnPuM04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeXbgsCS8ZxtK80yqHFuIvifMxbJrIi6FTA352EKgO8=;
 b=SOCEuIzHcgQYEwvoJDhaQ4U4X/7NYQ0qFlVmRQ5AajTANWpsXQv0/nyBc6qJopeoh28SA64s4OwbdtgpOblhQFGb2vOz8RBegdjX9Q1tZqAzFlqtwpeu87JJKG4RqAdF7AH0Bcp5QsnxfATG3Pzi74slLs4EoaODypQfP+1kzw/O3+zHN7umFb0NW/u5JkEMZNqVTzWW4Vx37PRV4wh5fzZm5GR2YDIWpDfVWa90o/dp9YMQMcGGjv0b2i+6nFojOPqiaxHzHSC7YoJcaJuJ967bnj0EUsf4KgYRo33n9Runcf115xbUZ9pz3TtHeIJhVHfTSGKD1WjNOwjxNUyALA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 12:43:48 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 12:43:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 21:43:44 +0900
Message-Id: <DM5F615QE0QH.MV46NZSC3TR0@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Lorenzo Delgado"
 <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
 <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
 <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
In-Reply-To: <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 864e90f4-473d-42cd-4fb0-08df2ab9f4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|10070799003|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9M1Z3rGm1gbErHjWMu6odi10pJuDxq4bnRQTLNBYbvybAK4jbnZ6j1Ty9eFMy1uOahLcP9qZFLo2VnXgPBgozmSssFodLY/7S0M/pSinWB5NIpjnPnntcoCrJvqJmtEeqFpwo9uPT2qF6H22B7ohItCCMxD1XcbFZFnZ3mAmvvGkhvJqwmVG9LT8+P7V6nD4vmz209Og0Vkov9K2g7AzS+WDGOfwA9TGKS+uW6dHiWUiglMh82tzBs+8rGaPnrh4owaHKxw2228R1m6g5Dz0XgtBrRwhbgWYOqHwm6Ko8gv94kCdX9FXetz5rQ60VgXf9p3XlQgxolSFYPTX972vcaEtZR9JCzZbj9QnYn+zr4aImsntw7vpidJo8c9RCaCueGZ4y2QptpgSTkwIhNCJioSOj9wOWLDG+KoKKiX4LMqy1UkJfOa30gr7oxOvUGqxDzbEApRgMduk3299e9npW73EBPLlO6FgpuWXYx2u/n9uDCZlz/6mLZJdZ8S0GUyi2d1XZ3dkw6sQQGHhyVANQgwmRsF7a1DUKeREX8IsC13ef1yctSBYfrltKNTE6QEP5FFV3uvBzg+zjIwsY/e4zDvKi4VaeTL7R3RNrCUJqkU67pwgeCqVHcgI95gx2ZV2xb47lPAvQ5ruSf36FhOElBEweNGf8cYVgKbwUyQbkYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(10070799003)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWxLdU1xT3huaWpVQUE3enllQWIrVll1RXRyZVpYLzRLaUNuNlJveEJsVjRx?=
 =?utf-8?B?K2V1clJzZGNKaUxFU3E2dzlHR3kvUGZRcmZBQ1FVaWNCT0JnZWkyZm5zdVVT?=
 =?utf-8?B?U3VOMnFzZXI0c0YwalpudTk3eDd2eDR0NjA5OElPOUpJZWhSRHloWnUxd1RW?=
 =?utf-8?B?dUhYRVNhdjNiN3hzWkpROFp4N0Y2VWZqbjRGSnVkUXcwQ1FPTW1nUCtkUlFr?=
 =?utf-8?B?a2JrOE9kUWNrMnR6MmhocmNaZHYxQW5ySFlZM0pycEZNc3pNUitiU3pCdlRv?=
 =?utf-8?B?U2tWUm5hYXR3cnlFR2VSVlBPWjUwR09CdTFxQ3pYWUVGWjFsaytTbUd2K3Qw?=
 =?utf-8?B?dXdqUDR0LzNFaGRtRDRab2p6cms1ZlROVStLYUtxdmJBMHI3bWt3Zy9QYklM?=
 =?utf-8?B?QWJJQWw3bTN5bTdRTzliUVBNbUo2L3krQ3AyTWhRcW91dkdPVDduSktOY2Rm?=
 =?utf-8?B?QXJaOWxZdmZaOTdCSVIwRlpQOXVzOG5qajJEMWZwVVZJYWRMVXJQSTE4R0t1?=
 =?utf-8?B?eE53SmM3eENMbUt5VlhwK3lHS092SzFrbCtSOWZ5VjZMdkpzc2dORmJWR1d4?=
 =?utf-8?B?aUM2YkFkckhGTUZlRVhab21PZlJlZFVpNDJnV01uaWFBb2pMdlZpOGlVTjNs?=
 =?utf-8?B?MUp5bjI0UVFZd3hwbGJkMWlmblhjZEpWUlNqaVo0blZwbjlCclhiRXZZVWNz?=
 =?utf-8?B?M0JQL0ZrRHRsRnVwK0RjSE1aNU5SNjdaS0duaS9OenpDZlJCZ3VKUzltZ2k4?=
 =?utf-8?B?NFhoNi9QY0xOL2xQTDF0dERyVHdDRGVYRHhBUVJ0TVR2ZWR3UzRjTnFZOVNB?=
 =?utf-8?B?c2JZT1dhN3pndWljaXFNN2ZPZW9zdmN5ZlM3bC9mdjBrU3AzbVZIcjhRTmJn?=
 =?utf-8?B?WEFEamJyUEE2YTEzZGVmb09RZVcwTHY3bTgvVDgwUnpUb1hqSEg1WUZDdzNz?=
 =?utf-8?B?ei9kSTg1U1l4SUZKczVPWDhxdE1pMkVkV2tlV2VUNytycGhDdGpMLzMrUTNB?=
 =?utf-8?B?dWFlc3JDTHBFK00xdVU3ZkdkcE40cm9oZ25ObTZMWVowVEg2ZkhFWkZydnZ5?=
 =?utf-8?B?NXExRkZVMUJEUjZvdGllQitpUVVhbGloOHlmSHZCSXNGbUNjajNJSHk0WFQy?=
 =?utf-8?B?d29yTDB1dnBBaGhzWEZ1Q2xZSlNmUzZvb0ovalJJVDYxNmtVWFhIZWlHeXJu?=
 =?utf-8?B?Yk9lMUxZY2MwaHlwQXNXQjd2VlVEdHF6QnZ4bERLL1gyZUg1WDZBU1J1Q3hT?=
 =?utf-8?B?WFlDWWhSM20vek8xaGI1c0t0Q0Y2M1RlZjBoL21UTnNpOExDODNaOFc0Z1Ey?=
 =?utf-8?B?Wm1ZSGJGTHd5MEJTYldScnJoUlpobE5EL20zK2o1OGpZM1Mrd240QXo1SG1D?=
 =?utf-8?B?eUZuWVBTeTVrRk5POE1JeU8zWmRrRENFSlU0THhvU01sOVRIalppK1JpRnJ2?=
 =?utf-8?B?NVlQOU51RWgzb1NENGFUenhPM1hqUzFsMG9JbDdpT2ptbkppaS91VExIR2RW?=
 =?utf-8?B?Wm1Eb3dPeGdocnJxSXNSUXFORVlZZTlRNmN5NnNBSFhvN25RcVNYV1djNHg0?=
 =?utf-8?B?Q2ZzOW02alVMN3Bhd0NXTHg1T3NHT1pFNjRSTUxadmdtUXZld0hRUVRIWS9F?=
 =?utf-8?B?WEF0cGVxcHhKN2dNM3FuRk4wSGRJU3E0U1BEbWF1TTBNQWZlZXl4SWF5S3Vw?=
 =?utf-8?B?ZE1YcW1vLzdwa3lsVkFpZm40Y3hIY3E0MkNzakpjVnppODJQYzZnbm4vZmlZ?=
 =?utf-8?B?NklKaFVSTU1WbExVTGpTdTRDZktKWFloQ3dMWGRtY3R4bm9XeE9OL3pZZFQy?=
 =?utf-8?B?aTl1b3ZDQTFlZW8rS0Z2YjBjZm5NZjVLMTg5eVdGOEJMY29WcVRsbDdiOTk0?=
 =?utf-8?B?ck0xb0dhTmdVdFJJdUlMay9uT0ttSCtBRTRVQjl5elZIbnlUa2RuR2ZQeFVn?=
 =?utf-8?B?a2V6c0RyRTAvUFVPdjY0dy96SXkzWXZXVGpmWDJMU2YwcVNtSkUwZ2hKdThW?=
 =?utf-8?B?MExuRi9DU2NsQTlOQ1dBOHFDbWo1TGt2ekNDT1BndjVRcUlLZ2dZb0hCbXhZ?=
 =?utf-8?B?NEdSdEFRWjI5cG4zTGhTWGxKS3pxT1ZaTEc5ZVc4RWMyY1EwazBMS05rVHpP?=
 =?utf-8?B?NnZBZXBBNUl1YmRON3B1NmtPbTZZZGZLalhKTk9tK3R0RWplTU5XcEVCNlJ3?=
 =?utf-8?B?QlptMmxXMDkvdm5XTUIybFQ5NXVTd0p3bVhOdEFCMlhjc3VqYjNJTU1vRkJC?=
 =?utf-8?B?d0tPdGNEZnI3SzI5V2xLMVI3eDR2d3JxdG04RG1HSldKVlZHVm1XYUFldFdD?=
 =?utf-8?B?UGkyaHY1YURtYmhVNXRGRVRWWG82a0U4amY2ZzUvSUZTejRFTDNMbEg1eWpy?=
 =?utf-8?Q?TZfmq/yUBZu4UQbHvez/VU2TdsmtsOcd6dp47imrV93Sq?=
X-MS-Exchange-AntiSpam-MessageData-1: n/9ZzqslhVuMgA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864e90f4-473d-42cd-4fb0-08df2ab9f4f8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 12:43:48.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF/5dvg0Nv3y62fi2JEJuVEoiN8XEw5FGmQsIDc9ybpFE5KbyGcJuxbb8SN22DhaDeol67MwBm832MUl50yP5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496

On Wed Oct 14, 2026 at 11:25 PM JST, Gary Guo wrote:
> On Wed Oct 14, 2026 at 12:55 PM BST, Miguel Ojeda wrote:
>> On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Lorenzo Delgado <lnsdev@proton.=
me> wrote:
>>>
>>> +/// A container that can report whether it holds any element.
>>> +///
>>> +/// The result must not change while the container is only reachable t=
hrough a shared reference.
>>> +///
>>> +/// Unsafe code may only rely on the result for a container type whose=
 implementation it trusts,
>>> +/// such as the ones in this module, since a safe implementation can r=
eturn anything.
>>> +pub trait IsEmpty {
>>> +    /// Returns `true` if the container holds no element.
>>> +    fn is_empty(&self) -> bool;
>>> +}
>>
>> Do we need this to be a safe trait? If it is unsafe, then we can
>> simplify the invariant and more easily think about the type, like
>> other `Non*`s, no?
>
> I think in this case the meaning of "empty" depends on the container itse=
lf.
> Unsafe code that relies on "is_empty" would be the `NonEmpty<Container>` =
itself,
> so it just needs to trust itself (as boundary of unsafe is module level).
>
> I think of almost all of the text above can be removed. The invariant of
> `NonEmpty` can just be "`IsEmpty::is_empty` has returned true" and how it=
 is
> interpreted is up to the container type.

Is `IsEmpty` actually useful? It needs to be implemented for every
container we want to wrap with essentially the same boilerplate code,
which looks a bit overkill to me. Couldn't we just do:

  impl<T, C: Deref<Target =3D [T]>> NonEmpty<C>

and have a single constructor method that supports all container types
by reusing the slice's `is_empty` method?

That way we could get rid of `IsEmpty` entirely. That would limit
`NonEmpty` to types that directly deref to `[T]`, but I guess we are
going to use it on slices most of the time, with the exception of when
we want to return an owned container that is not empty, and those we
have already deref to a slice.

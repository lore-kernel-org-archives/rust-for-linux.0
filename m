Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94E30FC1F;
	Thu,  5 Mar 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772694466; cv=fail; b=H2kpgRv3SlQalt1GreYcRGbYXLxeEwmcd8R0m7jOZkY6cSwmnCeyXSVfgJTc4v0YThSgwy84e7diNLIaKSIUlhwJ3y7nXR6OxL7sjsWsUKCanL8zpmb4kGRjZBDA1EP6ls+eHZ5BH3fxxhSCpOAtHl0FteDA5EWm06QY9OyIVXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772694466; c=relaxed/simple;
	bh=Yus+WyFgnf4jHU4AxQfvV+lJJzM2bXygQ2ckVd/rm8Q=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=c0OWxbYZkUpXU3llfaZR1Y3y/4uu9b9tD8kAAl95NvacJ6BEJ8xMzlwwhxp0HVBrvp9nlPWZPZVS6Aavm1BTiem/lPj4wj7dulnmSeLthDUDjSsn8hBlK4++aI2TaGSzyQ/3AGBw277vrcFRtJKhW+M/wCE/EXWhIqP5YaT4tqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kU5wJLFD; arc=fail smtp.client-ip=52.101.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kU5wJLFD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYGpzq+cb591I9b+/gt2oBGUTgkBesAF5UxKX2Fm1yg5eMN7oUB2humMFJTCj5f2Lynawd0d8bdBt0flLNwr3pRT/IcnGQ5GLueM1LMzVVy84yAzZBTvodaaBCvtu5iJhoGazqJZJob9czaLrvT9Td4CnsE2XhI4kD0Fjud4w1L5Vz9P22Pj1rEAd6Xg8ZkxWUar29M7AwVUnij4aQsjsyNY4RpoF404SWHR/KHo2iQ9yWiDUXCFpVRG99+EbRpgyycSyXyScg/cjRLfPoWy6fpZ+HBMZoCG4f+uXxpRVBHelopMSJaz+kk2Fkn0IOBTJtWpsSSRlyOAanreVvINTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8I5tny/Z1ZR8OShRIPk+NYR9/uoDPoe1lgzEb/PMcU=;
 b=t97WFJF7JBQhTNcrvVemtmG1E2KyBj8dUe464faYXYOcc0uUyMra0sjSgeLEcoC//RWnco36qlyqfPnSLD8UbvRfHqGbQKKssEVnwnViFXJYoqfagAiq48fXbXGZgC4SPYppMWcqE1RW/iCMVy3bpqNwNbbL/4X7w0BoaNEQu9kjvEW/3/rLia/QGVW94SBZwv4IKPac0N7OUSVLv9gMN7VK9icZMW6xIsaczuV/UCi4xMPkdtYgGCw4E/XyFBXTJbVvK/5KDeo5f7b72lKBOtcYarEKcft3NJ0ugdWziu6egRELLbRsiROIdq0YvCJYe9zVemmqbb5T8TPoPr+ecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8I5tny/Z1ZR8OShRIPk+NYR9/uoDPoe1lgzEb/PMcU=;
 b=kU5wJLFDbI4iOUSU77p7Clf7Ot06j7PBzJJFQbg7VHCvOPEEOfeo3WZAZzKkz/SL7AzrO3eYSP1jDAYgpp991EbN2kKs1RHaKCaWzceDF8xZFwj3hScs4dRiLbZxmpTWTdExvOYapHnICRNGJ2chqywU/Nk8QTSxElBACZpx+0Kf6jE1zovDdFGIiA71t2KkVu/RhyV6jS6xQarrHPMVVbZUJCwT6Rbi3dCUHX8x0KMesFxU0q1x7qsvyP7ADcXsHSZPF1GAHnSe4CqGrdwQHX3bvfMAyATE0GQE5WtJcXcIVe2apfWh1jYIGmlhig5fUB6EiZI6ngs3D/8ZdVGuCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:07:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 07:07:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:07:36 +0900
Message-Id: <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
 <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
 <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
In-Reply-To: <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
X-ClientProxiedBy: TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 81aea4c4-d57c-4643-45a9-08de7a85e3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	+xwy+ILinG5LIVIlIMQdBBVLtH6Vp+ZqezhiQ5u8QkjNZ5cOntBva7tgmiWMJ/BHEONKUPyLHaZl6pBdQBwImWPl3QgbdR/bDHL2b3JFhyRrpYQdh2B85aRdHq7ciozWtUyByzhAYxGKKfehKH6keQxB1uh1HTs+JHTPgpH6m7ZI+Q1IZgTbZ3vYRPfQotnlMnS3z+SE5H4/sjoz+KeoEk6mqDGPzBtvmAO3rifcP8hjRt8W+xALum4hx2MlYq7f991xhTrG6vXRH/IHKb+I3dRgRiMFKkmbVkKxBHIvci8E03NZpGRYIvRlLuRi97xk+KPqyxGI0UF8y2fvMLtrMhhPQOOyYvvcSbyua+qBBoCPqT7aCcjTveOFSA+CCTVBimzsa543mRMZ1/FK96DF9BACtTk5yRjnG9r2YUAAeHClNmHOqdGpKq4zT0x/AKiY2AalERbJ55nP9/VLToKRDcTyvsQMpdf/ayRjb/CCN7mmdgu3EwBBtRmSXXHU4kZmUQYHTWWzhM4/cBrqQ+Rbdwv7iPYws2qRWKutv/rmKVpfKJUxIh7R2f6rMcVHVfhHqkdYIl5HHD6l80l7Dxh6FMfHBkYY6sZLod3Q2yae4DPuodh+FlVhP8di1cxBxyWRlFdlpVgEjAGAgBvrHvVZc/+DOWVMuAbBJkYIaJQ8XHSV81iBPIIFkgD1vIXwbzbgADLvbMDVWWoWcAOXNtxfrmP6uNC6prwmIxSXkYoys3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3dqNW1vbXRwMWJrMDZtRWE0Kzc4TXZBRzNuNFdLZUdvZjF0aWZmcEExd2Fk?=
 =?utf-8?B?Zml1Qkp0MHAzRE1WcEF0a3dsc2U3Q3o5elBhdmtDYit4ZmlwWjdTaG1mSUNS?=
 =?utf-8?B?cElFUFpQZ0J0SnY1WDlvYk9MWFFMelV2Tnd0emxIN3Ewb2RRZG9LeDJJSUdL?=
 =?utf-8?B?ZWVCcGM5RjNiYk05M1ZNcTNJZU9oWkUxeUlBTUFHdjl1RHpqQndqRkZuWUkv?=
 =?utf-8?B?Z3VtT3h0ZVRYM0NZSEEyczlrOTBaeG5NTzRlbXVxbE9PK3Y0c2dFQjBkaXdW?=
 =?utf-8?B?T01vV00zVWJCTUpMR0NOYjlVRW5NeVA2YTJwQksvLytjWmZNa3VWeGNLK3JR?=
 =?utf-8?B?WVBFYmM5Q2JoQW0waWErcGg1WXJPamwxSUJzMStJUW9lS0JsUURFbzVhd2JO?=
 =?utf-8?B?bDlTbVJ6eFlaczF4S29EK0ZLOXlLSERETm92SkRNQklXZUk4SUZvZWQrbzJp?=
 =?utf-8?B?enB1SCtYcGg1L3BxSzRKNmJyaXVQaWFtWHBvdnR1dmc3aVR1Z3JnVDRQck5x?=
 =?utf-8?B?ME00QWpYWDg4WUJjUi85MTUrbWpiR2hlL0VYbndDOGpEMHBvOUh1eDM0cko0?=
 =?utf-8?B?MVYvaUdzOXZHYk1WWS85bVB2QmEvL0ZScUttcjZNSHBFM3hubkJXclJ5b0px?=
 =?utf-8?B?RnJka1l5UkY0NHJUMWg4eU5iQ0pGYzQrZXI0WU1WTXlOTmxzR2NKSktMRll2?=
 =?utf-8?B?RlZ4QWx0bW1SSVVPV1lqeitPaHQzMDlFWlJBQXdDdzZZZkZpOFNvMkJBSEtO?=
 =?utf-8?B?bklsSXRlYUxsbUVreFVIQTRTdHNYWVVncWo2MkdnR09JYzZFeUYyeTBVREdt?=
 =?utf-8?B?MkdNY2hBcXYrT1ExbGhJWG1reHhZdGhUWlFhVkdLa1ViUlI5WXpxdXpSVitK?=
 =?utf-8?B?WHo2ZHg2V1A1Q0J0TTFvbU9pakdRcW4zRDQxb0RseHZCVlU1UGVMcWErVDB5?=
 =?utf-8?B?RkMzMHBMVlE5V0hKTzR4V1NGSGZ3ekxzLzQ2OE5EVWxQOW12SkduT2ZkTzAy?=
 =?utf-8?B?UU9IOXFiL0VGUmU5eUtrMmg4MFQ5aHVnTnNsdEtqRDFFZWFSeHNxLzYvQnRW?=
 =?utf-8?B?NlU4NG9raDQxUUxxeE9YeURFVTJBY0RqSFdsWkhsT2JrM1d4czBLVmVsa1lQ?=
 =?utf-8?B?UTdUTVlwMWlKV3dXTTY0V2JDbUFmb3EyTm05TWtYMXBKWHhHbkE4U1AvUjNS?=
 =?utf-8?B?SXc0b2R0Ni9wbjNHa2h4bnlXSElMQmMwbldYTktFOVg0THlLenU2eFBmWDJr?=
 =?utf-8?B?WW9lZDc1MmU5TXdtZUYxdThvb3VMdHVONEkraDRMMXp4ZUZTOTBIeXVlSUQ5?=
 =?utf-8?B?V1VYM1NPT0d0NXQwNHhmdGlVNEYzUUYyRnZBQkFQVjJETWZYUlRndXVBZFJZ?=
 =?utf-8?B?eGh2ZU1VTm82OUFMU05XY3VHR1h0blcyNllVckJEQVlLOHJIamFWd2lCbGNT?=
 =?utf-8?B?T25LYmxDTG9UOVhuOUdNYnFDdU5tanVkR1FUU3QrWkxLQVMzb3RkbFJPZTFt?=
 =?utf-8?B?ZUVxZXpRNDdmZXFyaFR6QVhHbmxqbnh4K2xEUkU2QzBrdHlmOEMrUlVGdVBJ?=
 =?utf-8?B?NlluU2J5dDBjOWJGUDVyUWVwQjZyOXM5d3p5SENKdGZnbVkwN3k5d0t6MXJK?=
 =?utf-8?B?TExqNDJxdUEyQ1gvOU1HdUl1MnBKMW90aVYzdGIya2I3NFhFZDFTTzhDOENh?=
 =?utf-8?B?QTk2dUVmaHc5ZWJUSUgxQ2V3U08vdWdrUzZWdWVwZVN3d2JGZ1pyc1UvT1BK?=
 =?utf-8?B?bDI3VkptbDk3czVSQXlrbm9qN2Nmb2RhMmo3TXZ4WDBrTUdDZjNsNngva0x3?=
 =?utf-8?B?RmdKUmNUcFI4c1FieGxmUWlPbk1ldnBrNmRqVGFnTXRaRHVldEFkcS9oRWc4?=
 =?utf-8?B?QUYzMUJhWVV1VkJnTGZMUTdHU3F3YlZmV0VKNzhuOFJTaFk4Tml4UHN6TnFI?=
 =?utf-8?B?cTdEUVY1YzBzWUpTeUFqY2lHNzYxUFBJeTJ6L1Nrd1dMKzB6SW1pNGIvdDZB?=
 =?utf-8?B?OTQ2NmxEcjFsTFZndE0zbXNDZUdYcWszNjQrejlXVUNNaXR3NzJmQ1l3QkR3?=
 =?utf-8?B?VzFwSFcyRnRIcTZpUVZkR3ZSN28yZldqT0JhNitOdnozOWtBU0hodnQ5dWxP?=
 =?utf-8?B?Sm0rRExZMFhxYWxGN0RRYVRxWTVHV0E0RDFmNS9jdFh5bkdNRi9BRE5QaFJF?=
 =?utf-8?B?R0U2VTNmbmQwMGdPZ2RhUFEya01XblY2Rlp1TTBQT2t4VE55TFpuOG9uUURJ?=
 =?utf-8?B?bHZsMHV3VlR2U3I1cEZ2djBMOGJWNjg1dS9kb0RkYUFMUk05SjBHb1VuNGNi?=
 =?utf-8?B?UStuQ2tpSGNuRktSaS92MEx3dW1xbzF3bk1ZMHMzZjkzcWszRUtEZ3lEWnp3?=
 =?utf-8?Q?kqMh2s7/iFRzK2j23unGo87YjkMZzSZ4nYaleqJSKJmVA?=
X-MS-Exchange-AntiSpam-MessageData-1: ndYyeswpeSfU9g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aea4c4-d57c-4643-45a9-08de7a85e3f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:07:40.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rT3XefE/fIIA5ialqWxZ6NpJdnPBoLSa/Od60fN4zTWk7OUzWq9I2TYMIFlHEhiM+YYr71/bPQt3MUxAlSnAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852

On Thu Mar 5, 2026 at 10:31 AM JST, John Hubbard wrote:
> On 3/4/26 5:23 PM, Alexandre Courbot wrote:
>> On Thu Mar 5, 2026 at 4:14 AM JST, John Hubbard wrote:
>>> On 3/4/26 11:04 AM, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 6:53 PM GMT, John Hubbard wrote:
>>>>> On 3/4/26 3:18 AM, Gary Guo wrote:
>>>>>> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
>>>>> ...
>>>>> +#[inline(always)]
>>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Opt=
ion<usize> {
>>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power =
of two") };
>>>>> +    match value.checked_add(ALIGN - 1) {
>>>>> +        Some(v) =3D> Some(v & !(ALIGN - 1)),
>>>>> +        None =3D> None,
>>>>> +    }
>>>>> +}
>>>>
>>>> I think your signature should probably just be
>>>>
>>>> pub const fn const_align_up(value: usize, align: Alignment) -> Option<=
usize> {
>>>>     ...
>>>> }
>>>>
>>>
>>> OK yes that's a bit nicer. I've done that for v6, thanks!
>>=20
>> Hold on a bit - if we are purposing this new method for use in const
>> contexts, what use do we have for a `None` return value? By definition
>> we would know both `value` and `align` and thus the result is
>> deterministic.
>>=20
>> We do have an alignment method for non-const contexts already. Gary's
>> initial comment was:
>>=20
>>> Either this function is always used in const context, in which case
>>> you take `ALIGN` as normal function parameter and use `build_assert` an=
d
>>> `build_error`
>>=20
>> So why not make both arguments generic in this new method, and fail at
>> build in case of overflow?=20
>
> At this point, it is completely impossible to write a patch that complies
> with Gary, Danilo, and Alex. It's all over the map.

IIUC it is possible. Let's summarize the constraints:

- Gary wants to avoid a panic in case this gets called at runtime,
- Danilo suggested returning a Result that can be discarded in const
  context (but took that suggestion back as we already have methods for
  non-const contexts and thus wouldn't bring any benefit),
- I also pointed out that there is not reason to have a failure path for
  const context and suggested two generic arguments.

So here is what I had in mind, if using a standalone function:

  pub const fn const_align_up<const ALIGN: usize, const VALUE: usize>() -> =
usize {
      const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of tw=
o") };
      const {
          assert!(
              VALUE <=3D usize::MAX - (ALIGN - 1),
              "requested alignment would overflow"
          )
      };

      (VALUE + (ALIGN - 1)) & !(ALIGN - 1)
  }

  const TEST_ALIGN: usize =3D const_align_up::<256, 10>();

This uses purely const asserts, but you have to work with two `usize`
arguments. The version below looks a bit nicer as it leverages the
power-of-two invariant of `Alignment`:

  impl Alignment {
      const fn const_align_up(self, value: usize) -> usize {
          build_assert!(value <=3D usize::MAX - !self.mask());

          (value + !self.mask()) & self.mask()
      }
  }

  const TEST_ALIGN2: usize =3D Alignment::new::<256>().const_align_up(10);

It has to trade the const asserts for `build_assert`, which could cause
these cryptic error messages if called in a non-const context, so we
should document that this is only to be called in const contexts. But
otherwise it fits the bill and looks reasonable imho.

Unfortunate that we cannot make it generic against all integer types
without `const_trait_impl`, but generating `const_align_usize_up`,
`const_align_u32_up`... etc using a macro should be doable if needed.

Oh and if this cannot reach consensus I am ok with just dropping this
patch for now and doing something like this in the next one:

  const SZ_128K_ALIGN_MASK: usize =3D Alignment::new::<SZ_128K>().mask();

  const PMU_RESERVED_SIZE: usize =3D SZ_8M + SZ_16M + SZ_4K;
  // Align to 128K.
  const PMU_RESERVED_SIZE_ALIGNED: u32 =3D num::usize_into_u32::<
      { (PMU_RESERVED_SIZE + !SZ_128K_ALIGN_MASK) & SZ_128K_ALIGN_MASK },
  >();


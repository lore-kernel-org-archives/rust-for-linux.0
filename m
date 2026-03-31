Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9F19D074;
	Tue, 31 Mar 2026 02:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774923814; cv=fail; b=uAccQaOqwj4uNZF+9TDfa6hjc1sTH1Z5IE4TEFSAKevwHsqzBswdOIDQp57PIDqW62w1iUtgl7u13t1oqgGNvxzanQk449xiO7ORbUJFZTFyy2mxW8eL3TeCLzUVkc95GJJGt3edmOtghnkuESJ2b61x0lcIGLWzNwv7avlZuG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774923814; c=relaxed/simple;
	bh=bX93xcxMJ2aIEBZwzNxu0QisiLJKD99uqqJjbhH72p4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EqIsuOpMspMUQzD8+d5EVVNEJceBD+1nbrqFL+n+HCSDELRR3l01oriYNH0hJjw6CbnocNKTw7aDaOcgAzup4hrLVk8mQsSY3RTNnPWmkohBTR5p297qQjGspXFBsbTEA2oLFcYkrLJkxGACsTTxPQ5g5kAyLdph2NdI2kA/A1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oF69F9++; arc=fail smtp.client-ip=52.101.193.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oF69F9++"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeS9VFF9PUOPCfpMNuuU2Ot9muELb6AA1TJawxoJYuWS8zIxQiA0JO0IiIxDr51oDKrAOg2w4xcdLObTR2Xoza6paSShqoD0dJSsOFyiJ8DEKO0J1bwfUv5tDu75VNBKJw/fzwZUWf8aMnPzUnfwddB48pmavKjV6BdWD4Lcha2o+EQ1teiFhhSeIHxYr2SK4RzVlud94uv1ocTBJEzjbFrGRmPJNWDtQP7MOIvj2beMXv78F+IGPlDNDZuy1pMJFmsVm9DPZz8xSCJq78aU/NVhS7wZSBTfLfjJ27lQo0nIi6jjmXORS3fxkUdquPvtLxHoab3ROsNR78M74gIeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX93xcxMJ2aIEBZwzNxu0QisiLJKD99uqqJjbhH72p4=;
 b=uX9uaM9ChLSr+A22IgftQxYGu5KB7ZdtGWfqKYb8CCHS65OjiSkD0LWPdFdJxNe9Ku1bB3us1XLmiaqVBzl82SggfG9eYeOVyhcNc9Zy57ktOVZ+afA21OeCJZ1Ry/ZLS+IOpnCuJruZ9ZV0QCv+tn/Kl8eeUGOq24kBIm5B3Zo31VA8bHmc2d4/g4TGVzsPcB9T6gQMUce5ZgPm+cjQc1pqfQrrOCIma/UE35DDy4d6WSStfq8J0oAIYEKz4F+uMF+7R+P1zucChKuzVUrJO7igxydrP6vlxHW/9PGDB28HuLimoj+9bsT7EzUefmCa+04hOj29tgAVXUjvNt0Dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX93xcxMJ2aIEBZwzNxu0QisiLJKD99uqqJjbhH72p4=;
 b=oF69F9++u9YCqqnknpQ6x7rqvKfz/aXlyqxBcIuWbgTX2GZHk2TzUg4IYDoz31kgcMiUTjCRw3Q62QyVJ8xKiCCH1/btu4I4vb7MpWk4xGfXEvIv94CvkLCXMYN2ooh3GZ47RUEUMdc6Rd0oB59eY1fZmYMt4qigbk7WoUwHbf/LB60QJ23j6SyKgZk5ygKbudz/xqLV1UT69vASQ8Dxvt2DAe5hwig1iPZmW9LunZMLoHEKvflu+RDxl340OWU216NxXmwWAs0RfQdC6HPw2EVNhVsiy/yVEgltprCHHyqxVSBjScMz+wEQE85JioEINSXVMFgh237PZ89nix8flA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 02:23:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 02:23:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 11:23:24 +0900
Message-Id: <DHGLZ78K5VG9.1HVP62JMSVIOY@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-17-jhubbard@nvidia.com>
 <CANiq72mwC9K3mOaTUsfrreJqiE7WumqcwqhXQK=nvhsb=024=A@mail.gmail.com>
 <0c9af1c5-b3f2-442c-9af5-c156926442e2@nvidia.com>
 <CANiq72kHi5dawEdT4HbAAZvE4gSJ83-ORHEZJ5+qKzJMxN5yNw@mail.gmail.com>
In-Reply-To: <CANiq72kHi5dawEdT4HbAAZvE4gSJ83-ORHEZJ5+qKzJMxN5yNw@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c6bffe-93dc-4bec-61a3-08de8ecc7e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BchZBasEuBLwHbMGkmhUIPcrnLuWwMPVx1qVxsDvpGbCqZqk8NXVTot1BbwTByQWAGwvCWGKsNUqHPymRkJCQ1Ljabaq6WuaWBEimXLV9Hl1UxW/8IAj+z4Jaffjc3MYQNnmjeCM2AQamqVC2pVZsSvjZh21dPRzLTYXKGR3wHl4VLjXHXoNoaINIilLx/0DkP4UJjpsrkLfeEB4pjMaZkVyROVhq6n657xtSmzZ2yxIpiSpuEozaWO9xnGLzWbkBNlNXe5VYpzWvdboX88muM78GwHWe/FbxuXvgsWSxhxgt6VPFKnLyc4EiojIXEwrqtPEyFBiZsq+RVMLAwo8Kp5UNzTVaEs0apoj0Yzv9G0eq8utKwJYYNydaeLadOwSFz3qDNrv/gw8xdaHgPAfk21qMddwfiA8jnBB3M49iM8OuEIsM9d4FKciRD6SBISeFcTjx3vWCeH3OsbmLWprYw0MP0pDWA1YNgQmHHPeawGMDJIRsgj3bsYyUWdsyighQ3IWN/0Uk5IG2HINd5tAo9/2F09JsikQHeJpJGJLdFjrhrFwCA/+WTnYiKShWHJp9juYJdvONguGokRnse4iPeijtxaWSBS/6O/HFPk0GJ6d6h0PDzvf2lyVZ696MeXcT5ewCMqRsRc9bedWS62o7i3J2Nu9kEOG4saSlQ9KYIw0eM/g4IOKfIUbShfY7qoW0iu/zb3NI9WZaTBpdDeEC8Juv/Emb1dREWgnlvBaXHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZlV0RMZzdyWWNFQWJHNTI3UFZ6NXY4ZFQxODhsckdocW9kemNJYUF1MFRO?=
 =?utf-8?B?cGtSR3lCblNCOXEvUUZjbzBqajk3TmZLYkdUT1NubGJzUXhqaXVMMkQyZlI2?=
 =?utf-8?B?Q0MzK2F1NkxEUEJuSGVRbFJSNWtKcy9FanBTZ3cvT04rV25SNUlJNVc1aGZL?=
 =?utf-8?B?VXFORGlTOEtaVU5Pdlh4RlZzR090U3pSSExjWDB2Zng0bXljMmc3SXhsb0Zn?=
 =?utf-8?B?RU4wdERDOXpnWFdtQ2dWZU45R2cvSXZqMzZJdUtTajRQVXNWQVRuTm9qUWRl?=
 =?utf-8?B?VzU2Yk9kQzdoUUJnYUd5UmQrNzYweU9Fcjczc3c0TUV1WmZ1dHVFclpLVVMx?=
 =?utf-8?B?MysvSTFFN0VUU2ZObVV1bjYvMDV2OG1wOFVUWmhVNVdtOEVJYTIxS1l2NlJZ?=
 =?utf-8?B?ejdrN2tZWTJHUURxaXRGdTFmRHdRVy9HTjBoRloxb3JEdmNKdkRQbWxvSXhV?=
 =?utf-8?B?OHdTQmhCMjlKc2ZNbTBxZHNGamxnWld2dXVzUU85YnhUUUIyZ3BrU09HTFRF?=
 =?utf-8?B?bERIWGdiVDZOZWs4WWVsWnZtL2M2RzE3YTNDY1dVOVNwbGNzV3R2dGIrK090?=
 =?utf-8?B?YzlHSFJnbU9KOWo5dHpZY1NMbDdwcVM5MGVvTmVqTDlVZitNdVdWWXp0SzYr?=
 =?utf-8?B?Z1M0UVU0RURpRTI0dFJSekhqYWhDd2pOa1VuQ0NEYVRHa05tM01pdEhMZzVn?=
 =?utf-8?B?eERDRnFKRUFXQjFCdmR6Mi9HQVFJQi9yK3lVb1k2NGhvb2c1bllnM1NYemhQ?=
 =?utf-8?B?OWR0aUFMdXN1QUV2eHI2QU9kYjlGT2ZqcWNlb2NJTjZFWjJBUEszYWwvVi94?=
 =?utf-8?B?emdNUUYxRTBCVUdnK1hyWlFyUG94R0txaHpDWHdRNTRjOWFXM2pwTVFjZTVh?=
 =?utf-8?B?UnVRNGtMN0F0UER0SVZVUVJuQlNwdTI1RWd1SVZLUENCTWJmcXJBRGVEaHIr?=
 =?utf-8?B?WTBiZ3pack9IcjNOTC9WTVNoWXVQUHE5WTNoRWY3aEdRcTVZUmliSk1XY0U1?=
 =?utf-8?B?TE1BKzlZZVBmcnNDajhaWEVtckJobFFlbFpNMjI2cm9YZXFLd3JlbW5ETUZn?=
 =?utf-8?B?Wi9yRzBMZDRPcmpOWXZnQzRNOFJyejBFcDVxQzdlQ3AyQVNVYTl0UU5sdXli?=
 =?utf-8?B?Zk1UVmtzRzQ2TXdFK3pNK3ZGdDBHVWpxdndja3ZvY2o4SDFFcnZPdE8rcnB1?=
 =?utf-8?B?bFo4S2YxY2ZoK3NJZ1lLWUZmbjVQVDdCYnZFNzU3NnVaN2FKbU1jR2xFSnZa?=
 =?utf-8?B?T3MySW1rMWFYWG02TGVJUXJNTnRhQ0t4ZTZ3aEhxa2s1UEpDN0Y5WHBUYmpW?=
 =?utf-8?B?UmNYcjJVSW4yb1EvdlRDeVBwdHZtcElxZ3J0WmVDOCtJa3NPUkovOWVBU1lR?=
 =?utf-8?B?dG1wQm1USHZhM2drOUkwN3lIa05CU3V1cmFmZWhUdE9XZ2tWeWplSXA2WDc1?=
 =?utf-8?B?dldIUXN2YXBRcUFZSk4rcEp0UG44d0pzVUd6M1ljdTRLbUlQeUVuVnhtbFFG?=
 =?utf-8?B?TkxLd0p1SWNyWGdVOWNrMHNUSzQySko5eTFEb0lBNzJJZFViV3IrbWhLdmxM?=
 =?utf-8?B?dVBscHV5c2d2a0JsKzVPWngvNGxISWRNWjVkUWdQRGRsUmZtMWZGYkdWWnFr?=
 =?utf-8?B?RkNRR3RETFRrNHd0STZqR21oNHhKRlVqRU5UTGVqQ2dGZllNbitLcFBNN1Nm?=
 =?utf-8?B?SDJWcWtQdkVvdllPQUd6bnIzOVJpT2JYWk5Mb0VPU2FSQVdldnJnQjROVkNk?=
 =?utf-8?B?c3UvQUZLaW12Zlk1OVV5SzRFL1RWbGIrN2pMVGl0T3V6cUd2YWpOTTI0QnR1?=
 =?utf-8?B?NUJFbTY0T3JpYVdtVnM4b0xVUFgxOTBFdGtXNUZoR0NiSi90elhxU2hmb2NF?=
 =?utf-8?B?bmg5c2xjNUlwVUwxaGdINTZOMEZiOWNjeG14SnhrNG1KVHZPMGM3S05TOG5S?=
 =?utf-8?B?bXFaUlNOZzFVM2g1bHR6RHZTVURsYUh6NVBDK3hSUG1yT2ZURTg0NnU3blRW?=
 =?utf-8?B?ZnAvcWR5Zmk2ZmdGZ2VqckxFMHpTYjlrZDhka2k4dEdZUTA1c1ltWG0weTZn?=
 =?utf-8?B?SVRCUjlxZ2RTN0NLdTMxV25OUCtuQkxDaG8rK2RJbkg4N2FDMjN3cUExY2gv?=
 =?utf-8?B?aVUvTVFkcUg5N1AxNzQzclU2a2YrM1VMRU9RSlp5QlBtWVJqOG8zaUdod3JB?=
 =?utf-8?B?NFdDWjBaT2NTTWJMY0ZiTW8ybjBtM1pqZWl2RjM5c2l0cVVzUlJWeUxDSzNn?=
 =?utf-8?B?M0R2czF1LytBVnN2UGhtYjVYUmo4STNkeFdjTTlNenhNV1RCcmJ0dUk5OGlJ?=
 =?utf-8?B?VUZEYkEzVWVnMFFBbmFhNlBMVnAwRGwwOGlMWWtZMjlvaTMrMnVGcjBBcDNF?=
 =?utf-8?Q?9QScvwf8VVEtLdF/wEHrGQoxJRzpoz3kl6TMsvJsmHdTf?=
X-MS-Exchange-AntiSpam-MessageData-1: jxS9DPRLpU36kQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c6bffe-93dc-4bec-61a3-08de8ecc7e6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:23:28.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4TIHyKhx+PaUXcrZRDh2DbhI5AcXNdKh7o4kPMayGfO26F8pD0baOGCEFmWs52jx8kYCU8r+nEieY3CC+1P8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711

On Tue Mar 31, 2026 at 9:03 AM JST, Miguel Ojeda wrote:
> On Mon, Mar 30, 2026 at 11:41=E2=80=AFPM John Hubbard <jhubbard@nvidia.co=
m> wrote:
>>
>> I probably should ask this out loud, just to be sure: is this
>> patch on track to get merged though one of the various rust-*
>> repositories? Or more to the point, is there anything I can
>> do to help here?
>
> Since it is in a series that uses it in later patches, the usual
> assumption is that it is meant to land together. That is why I
> provided the Acked-by, i.e. so that it can be merged elsewhere.
>
> But if you want me to pick it up this cycle instead (e.g. perhaps
> because you don't intend to land the series this cycle and you would
> prefer to have one less patch to worry about), then I am happy to do
> that too, yeah.
>
> (Sometimes we avoid that if the users are unlikely to land etc., i.e.
> the usual no dead code rule, but this series seems like it will land
> and the patch contains a general enough tool.)

The series won't land this cycle (but is the priority for the next one),
and this patch is clearly an outlier as it belongs in the kernel crate,
so it looks like a good candidate for you to pick if you don't mind the
temporary dead code. Aligning constants up is a common operation that is
worth making available early IMHO. :)

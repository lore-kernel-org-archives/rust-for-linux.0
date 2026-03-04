Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC70279DAF;
	Wed,  4 Mar 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654290; cv=fail; b=jembdxO1Ysiq9FcOpXI7AmotRbdhVe51MQT8+54LCPdEtQJcmuuvHpyMOs4pVKCS8kAsuWXZxI/BTn2aRHvxbIaPq6B+Hnz8tq1sE3DZ4iHxholoYaHYHPqy/Hyin6vme/x7TMKYz9bQ4ChyKufDS50htVhs600DZvb1zODz3gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654290; c=relaxed/simple;
	bh=HVC7bEREoMLdi27IgRhk4EuhNhYZS1ozTklm7793OP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WVbi1RLagW7bhEmefk5AWiaVFStEM/GsFAPCjlaAP4HTH3c4U4YmYfX6aLk7Hnoo//LYjDRXH6pv9FTqWEL1zA/VGu7meseqNpXUbNsB/5zb3+6SPaPrNyq1FQnxgl1mi+XadS86FHAhaGS2MxLe/C9ELZ0LC7oN9Ox68U+aKEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dvv9bRRn; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dvv9bRRn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUuti+E1JG7IzxOPhqQZZAplxF37IRiiHdzJHRhbs0vbbyexrkgjFyxVYexcdy3WFvm4g8H3qMac0qJ5fJIHbzPTMQQX+GlaKFgpzrAoVJrB6uTXeW6rPcgfBZQOu/uvAPrsSLt2ASxsF4f3rItcP+VrDYjontSI6d8DBWwzyvnOqnLbocGYmq45KBRZyvowuIGsSpm8xrcnzhGQlTVsfeXouSMDOCPa5wRenV6vlM53W2FAlvFvUzThyk2GE+do9Fx5zgzjz5kwum3XLexWRftkJlzqLSJgX8ehaGDtXpayYLjnNQSvkRGqpbYAo744jD0/FNp7D4rc50+2KfUafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjRQ+TjyabLCKi7Se8zTGD1dKBI5lVkak1+JAZ8vxSc=;
 b=jxXHj22ZQw700FxBamUnZMtFU9WyuFR2UFslcDrLeqV9WAz3qTdpV/OYF3MbHaPti0LphOTL8HXI6mHf9mEcFlk/pMBRM+C+Ch3W3I6DjOJl79eQYPA5YwnoW66rAZhLgN2VUXydIjpJMZm740jU15w7hZ7IjrbSscnLZU23ltbMSrM8i9X4v/QSBJ5A7lEcas6RKd51h8JPRmREgehwU3ZHr/+4baUIhjJUjZua1xGmDP8N9U38NToAyQz3r192ka6sVKDwod6JlO8Xn0WhTT1rseoohcSGJvK8YDZWHxWI00V0ve/3wsY/VlFUSLqCZIMneUWfOX8IO6/yopJOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjRQ+TjyabLCKi7Se8zTGD1dKBI5lVkak1+JAZ8vxSc=;
 b=dvv9bRRnyrAGit54k6u9w3OB3HcMecuyPufBCUAOmxajO+GJPtM7ypa9eCHnLsRyssej9jowMN4a7GCB2qwES851jr3Sy3SLcCYasH0WtXkU00sUCHRcSiIgExDIqNUc7K2Ae62uoFZNUj1TixxxRPFuV/+OSGzbnJ/A01+Dbefjt+s6XVTigjSMr/XuPHHt2BOx/okpk5HUBYSF7N8eBtg9oKl5Ojc5Q1ZYk7TezeOztLcVZzbDDXnuJBHPTFMS+2518mltfUxtJkGyuWWx8JYsGQEstjHCm48s6o0U/zcYoLcdD5XyuQwmR6ihQqdn3vzasj60JeNwxaqcUcdOIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Wed, 4 Mar 2026 19:58:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:58:00 +0000
Message-ID: <654a8f7b-fc0b-48e6-8ec1-f592c53b52e7@nvidia.com>
Date: Wed, 4 Mar 2026 11:57:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <5e281d9c-20e0-47e1-8635-e062f18d47ff@nvidia.com>
 <DGU9EMTDIHKZ.4L5JDE53Y76J@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGU9EMTDIHKZ.4L5JDE53Y76J@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 89799510-a59a-4209-63d6-08de7a285672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	G+N07rXlU6jAtMKn6bJlc7X8nGybF+I43FbfgcC4KubmLfUfQ4oiQfPXiDQfkagtSY6mccguRwy4fYDurnubriAj3GImmK+qsr77rTmwSHQNxK6bK5A1PWpezksYLaGGrK2i5XcchzQb/HULQkL5YZqQPbQqphY8lWNap24ZIYhaXwG9PoH4A/ynDyOng5B/rsdk1wZc4qLKTRBzHsTFVOIc3gkSEtJaH05MadkqPbfbk2omHpTKB93wmkQqsS1cXK75VfSQx9wcz3J+mxcpKu6tiZRcNA9agsAp/VWfL8s5CnQDa0Hw2lN1SxYmzGJOiadIcvaAJsishjjFKUDfmtIB9aJEONJSMr7s7BfHkzMQBShsG3pwJU7LL7bza65Z5MZvrAHT+9HOR0j2DuwgHtmDqDOFp/FwCuNqQDGRXDaeEsna/zkQxUMQpOVSPzoX5nJ9zk34JG3l5z8yVsse0zuROqhocVoaOqeAa0iSwN8/0hLicJFFc+1rNlgnC6L6QNymAcNRiGLPp3BrH3VAZBzxCjjdPNwJzrc4IXXIEWI5ThcUDr9srwBbs/GHyZBzBsQkeVBmNYkN7ne5WkXuatT9iAWQcGzaKS3RHJWvJ+9VaVwDvP1DzN6evFvVt/B0voKhN9eMW7ahL/eDNRrLp5KjOor19BmOHK1qwif9VqzdhLcidFjKdxamRkQSM+HtQkwJrfnen5/MazU9IkusuR1yJq7a2ydZSQLy6MLHdbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDZ4Tmg3MGw4dnFqY1ZDWUw2anFmTEZ4VTYxQUhORXQrVmdneTBqTEJpb2RU?=
 =?utf-8?B?TG1nYkxGRjNSNENpclFncElZV2ZubGI1NDlpZ1VOaUpRcVNIdmtKTytlY1Bt?=
 =?utf-8?B?dndNdURDQlNPUXZNMmRRYXZlUVl0ZmUrS210SzM1clpCWGg3N0VIWi9GdVRF?=
 =?utf-8?B?V3VKa2g1K3NaRE4vQktxZ2hYVjVoWWl6M2N5YWptdTIweUdhUkd3TEpQSkdi?=
 =?utf-8?B?YzVxYk5RS0lqT0F6Tkk4UVEzOHgxNmNZSXBBQ1BhckNXSXdPRnJMNzBocTZB?=
 =?utf-8?B?Z1Z2R0hJR0lmUVRCZXZIbjErVWNyMWZDWld4WHBnRWlaMGlra2xodVNpYWJv?=
 =?utf-8?B?RythZWhDTzhNSldVb0JCZDlLUGh6SDZnb01uTHQ5NWg2UHYrVlJmT25tdFYw?=
 =?utf-8?B?SUJZZXBLNTBqNkNsWkU4RkF0WXVRUHFBRGQ5ZHRVaWovWmJNSXgrclRRc3Js?=
 =?utf-8?B?MWthK1IzZG1UUGFuL2ZxM3NsUGRXemNFZlZrNWs5enlqZnJ6UGdFaHArZnBX?=
 =?utf-8?B?elNXUHd5YStwalJxWEcxKzhpN1ZzR1kxSDM1bkVXbWViV25sM0t0SU9xN1Bn?=
 =?utf-8?B?bjQwdlZna2svZ1FKKzlzeFZSUllTZ0NYYlB1U2RsTE5rZnM5SGRPbnJWTDQ0?=
 =?utf-8?B?WC9ZQUphbitpOTVHb29CS2x5dW5xZDNDMXExK3I0MmdUSUJYYnhMNGtEUHRK?=
 =?utf-8?B?ZHJ5b1BmbHNTQTExVnFnWlR4MHdsSGQ1cE9ndU0wbXMyRlVCNGpnM0FCcnhv?=
 =?utf-8?B?RVI2S1dqZmIxUWlBRVJiQVZER0ZXSUtaTVB6S2VMWWU1d0VscjkzRDIxSUdP?=
 =?utf-8?B?eHl1bWdHTy9qc2dyMFpNY1VyZzhaY3QyOXdRWU84OURmZDA0NVRIYm5Nd3JO?=
 =?utf-8?B?VFpHcGs3bzNFd3EwZzdIbUl5aVByT3JmYitwdkYybk9icmxJcFhZMFFKcUM5?=
 =?utf-8?B?RjRsNnB2QzFsRnJaYUpyZU5NdjNqWmtuZXowOGN6Tk00WHErNEpxUGRYNzda?=
 =?utf-8?B?Vmg3M2txek5YQ2pVVGpjYjl6dDUxcEsvRnc1eUlnNGU3Skx6WXNaK09Vd2Z5?=
 =?utf-8?B?c3NFNzhXalk4Nld2RXJnZHpKSnpjVXZ3RmQ5aktEMC9NcUxIek03ekRmSG9j?=
 =?utf-8?B?cENITGJzR2IxSmFLNVlFSFhuMDdvL0pVV2s4d0oyM2ZsQ0FKbVJUZzhram9u?=
 =?utf-8?B?aVpsNHRiTFZqa0ZiNVdNT0VtMExJeGVOZTRHR2VJWUt4cVFIcjk1Q1BZMGdn?=
 =?utf-8?B?cmFkWnIvYzkvbkZGT2pVeFdKRlA3U09Fd0VMU09WczBQWTZoUzhtV0VNeUta?=
 =?utf-8?B?citKMmhsdWwvbG1XYXpxd2lnS3pMb3hXUW8xaTNhVXkvc0ZwTUZHeDhJblE0?=
 =?utf-8?B?cUNENktlbmxPZzVWbGVvOTNob3JNQVVOZENqUXlrVGtqZm0rRmNuWWJIa2ZM?=
 =?utf-8?B?TExaT1I1ZVc1UlI0cVRteWJ0UWpFZHM4VmJRQzlQcHN3dlJnOE5CSTZmOTVN?=
 =?utf-8?B?TUlSODdJTkQrUXBkSVFjMEtlWjFHK0dVUWw3M053clduc2gybHNxVWV5ZmlK?=
 =?utf-8?B?UmZBTHEwSVhFSEh0TmNCRmVFL3VhWDQzRmVMa2c4OHR4TXkvUm1DYWxuZWRz?=
 =?utf-8?B?cTZYQXlNWHpZak0vOGIxeVp4amV0M25ncEg0K2dwUVh6REVxaHhheVRKUldD?=
 =?utf-8?B?QnNSVk1CUjN4SGc1aUJJaEVnUkpFQkh3SHFvU05vZDA4bXZGd0NhdVM1VkFh?=
 =?utf-8?B?RDNKbG1xeGZBQnlINXpwMjJxNlFNTE5aWEZDQnFYSzUxaEpoeWFJd2lsTC9X?=
 =?utf-8?B?NFhOMUg2SStuRS9saTgwcU5RcE0vZUc3U0JseHRhZ3lCQVE0Q0Q1RS9VTW1L?=
 =?utf-8?B?ajVDSGllYnhUcExpVnZFdmdreWUrbzRxQkR3cUl3Q1c3VkZRd2cvS3lpN1Jj?=
 =?utf-8?B?VEt5THIyVUk1TlV2eURDeHpkSzN1dU9QODVSNUdjNzBaZEsrZzRzVUJ6MVZa?=
 =?utf-8?B?NEw0R2NNVUQyN0ZRKzU1MW9DUXErQUpzSTB0REIvdGhTRWNjbWh2U1JWb09V?=
 =?utf-8?B?TWpzLzZpMEJVSGUxY2UxMUs0SkRkd2hHMnhJdEQ2Wk5UYWhmeDdnUW0rcWMv?=
 =?utf-8?B?dWQzUGVKNDBVempQQnIwTnF4UEs0a1FYTXZmSHFRUUlHRUN3VXNzMkNqQWdO?=
 =?utf-8?B?WnI5TXU3U2IxMGxVcVFVbmVsWHk1bkdseko3YVNrK3MySktVR1FDL0NKSWdn?=
 =?utf-8?B?UVBxVGo2QXRxeGY4eHhrOVpaNGFqaTBndGswTkE4Q0lSM2FtOEFCbW11ZUdV?=
 =?utf-8?B?SUpmTjFCWVFrNHhZVXV1dGNubmFSeWN5TW5DUXFPWXEvVW9kWHE5UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89799510-a59a-4209-63d6-08de7a285672
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:58:00.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhkyJ74VuizbVBBlPDtN1/hjUIs85rTN6e6FnAWARIDy8qPJ6c5BCdlOR8JM6IvQ1WhVWX7iEvzfyV/Ud/VgvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504

On 3/4/26 11:53 AM, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 8:19 PM CET, John Hubbard wrote:
>> I also want to register (haha) a strong yet unexplainable concern about
>> this. Registers as types is something I've never seen attempted, it feels
>> strange and unnecessary, and just worries me.
> 
> Do you want to go back to lots of defines, manual masking and shifts rather than
> having a single obvious definition of a register that generates a type with
> getters and setters? Needless to say that the former is much more error prone
> and less readable. :)

OK OK, it's a one-way portal into a brave new world, I will
try to accept that. hahaha :)

thanks,
-- 
John Hubbard


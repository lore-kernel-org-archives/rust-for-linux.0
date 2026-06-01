Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAA218EBA;
	Mon,  1 Jun 2026 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292073; cv=fail; b=HtA/xkpUTu/2fdK7iCppumMdPk2DBMtlv+kORSa6FvozcdV8S03H+5xgfnOMgEBaHqrNWmjKdlvzT53EpwGWVFvsMJbQ3UfRoorVpiDa/Qtt7GXnTS1sJsFIbzbBa7j7ojnzoVRbgmY8SN+Wfw2RM1NEX+M+IFR0iWCRkXUOLYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292073; c=relaxed/simple;
	bh=ihYYZ6JDti926s63lx6fUrb9N0spS7f7K9lBAvDxlI0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GBS4DT1P4JafyVcFwn7IXX4OyOWvZx5tENbaOkOoxlWUTZ9cKFs5yYPmOYgnZeIyAqDJq3ZIq8uD0qeq8VHuaFDxBwMQAYhEhBb74aNXCq5/iZ/POSSuCM07wokJ5u5wIO1UZBbuVo83s6q7OjJ5MCkMLr13OeuP2mxiS9IdG9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cQffXs0B; arc=fail smtp.client-ip=52.101.61.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cQffXs0B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka5K8fGzfzIrnsijx+eZo3VY0B2qqcufIMY8kVCXqXyQuYN1SiBOeDjJMvDVqSxlYDz9B4CGRnmQN8NTU38SUJGRXfvB/2nFb8Z36/aVg4gzGWCgKYBPVl9XxW2Y4wK8PJu/F165ImLRTLtqUdpPnnljW0JftAJTzS/zXLsxzOVrT/n+tUI2H+IaGo6xALOoENLw2drBaCb9MqdATp2O1q+uQ1Z5ypUaSiZd7Rfcaoh16agwnEttnzzwynOO3IKecSAdpeHKpSzlQ1sYvL7W1DFlhxbOiFS1d2tWo+5idSooiFmr7UmPmfyS/dGBC5YWZ/LhY4wh3wKWkFnY1uMwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IiwbsnApvy6ul0kPxxTNMpe7eEMl3JdEkngntpC1L0=;
 b=eqt5ft7KYp0EXMcOaHQ90QT+T9oNM7Vk6IsEGpJMSfsppFtldTdDfwESaEJtme6oeNt3bA4nGFUtm7dev5nIrqr8APwh49w3n4XnjSsfupOOleHcdeIgAaDnI7U3uOyqU87IBrvGCF2r9LPjGWKj77uEKsZjbXIGhuzFAUE+ShIuIV6azMVbKKs2xGvf4MOyd0LnxJfbRjk5iEkrRuisP9LTNDEwDHYuvuFkRlUN4uebacyWVGcW/k4hQish9EWBz2y9dBcghcUFMXQ7e+CKP8fTEgePifwhevniblWSklgybvieMPPG6QwFZB9a3GUPF3cYz7QCATmr51cPYZCtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IiwbsnApvy6ul0kPxxTNMpe7eEMl3JdEkngntpC1L0=;
 b=cQffXs0BHm1yIQDd+/9DhpRffOKQUZLQTv9gdNB3ts82IfcyfwJw1XhHJn0FRcyQ2CEjY7vc55ln0Nh8t2hMVUKZ0WoegAdUgOWZaAC6W4rgAyET19MY1J19v4ZNE1KgvJzl+nkHpDap5yrTVav4XCSD+qHOZS4h+doHAvm6OEIfKF7r4Ql+bfOGuHZ4KubCU1A5eOZj90AHtjEhE76SnuZ7LQhCe8ceblk/Xx9tFBf4sFeTSbWCvoCYxlOvHFNZpqY0+MPXsyKkWX1WeeRxi43gcrM+6OZNHLl+gcAFor7AstF/6NzkCUp4jpqOLezVSjP0u+JU8er7uVOhyrx6mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4270.namprd12.prod.outlook.com (2603:10b6:208:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 1 Jun 2026
 05:34:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 05:34:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 14:34:24 +0900
Message-Id: <DIXGV7OEGZUB.2Z9JSH3DS8XK1@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 03/22] gpu: nova-core: Blackwell: compute
 PMU-reserved framebuffer size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-4-jhubbard@nvidia.com>
 <DIXCGM5BG9PE.1ZA1O9T94CGC@nvidia.com>
In-Reply-To: <DIXCGM5BG9PE.1ZA1O9T94CGC@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0294.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4270:EE_
X-MS-Office365-Filtering-Correlation-Id: 245201a4-721f-4d8c-0310-08debf9f729b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|1800799024|366016|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7mAYsRk/b4uW+KEZfIPAIJN0kieTyBRbL0cykNyEUZWl6RZpfU9KIGoKcilf5iiDQFnoowmggrTmPaRYHOe59tgA2053N7YY2ngkIM7On3O17Z9z6abZZ4o1BMDOc3evJxXNowovaMSvTkIeXz/ydqfqQDGkWxyzZta6Wmguy5b9tCb8zlQpEZ8GDXgDm0lrq+ec9HCKQsctZPJ0tNfEJKuEblKQToM2FoG1l08rRLmcHTWSYgGyw4usSX3o8ouwoia67QdM+xmLWUOch+irls52aQdLgd0SPrPmE8dm0M3H9mpI8ZbHxdO0GSs9Is9e4iWT5PGGwW1c8/aDKUKudddj7g/kJDasUo9P9ssngjONTHUv4vA4coxRiBzT8QMvb3v5Ixp4osgaX2dFtd+Sgc4/T2w/BHhcUptMDuoPSygCvtVYRBor0JjCpltzPBA8USsLC3DiuEBP5Lp8Ml2pZz1ysgocfSfdhyn1dG5jyglbu6g9TnAZKCJuoarwGyDveFwW0NpbdoNrh/ERvqr7LPAGy+RRB2o9zSxld7y7e2zpKEMUMB2jXt1+vMXnjto5wWab9yeLP39fJWgTSSCvYq/0WGNYJqYT+irHkz7PMeiRz/LisRiUMZrIFjN+EhprNXhxQrEtyrBdURuIQjSnyZnVaycwIZ2+JfZZ/raP2a1a6QOKL3O5BvqwjTrykVMYn/J291xEhBVk0COlouWpjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRzV0NtMEgxR2pqdUNHYU9DbU5ZVDRIQW9MNlluWlVpRHFLMk5tZUp0eFpQ?=
 =?utf-8?B?a2d1WldWQUh3UzdPd2xDeHprTnRIZSthZ0RJNHc0by9sMkRmUVpBOUZEejRh?=
 =?utf-8?B?RjJ3QXV0UzdkWDVqUjk2VDR5RWFac0xrK3pXQzAwWDVKQU5hVUtjVWVZVFhV?=
 =?utf-8?B?eXNKMjhZMXN6M0loanZBa1p3VFpFOHVESjVmL1pNOTFwTnBrL1dPUDRvWGhy?=
 =?utf-8?B?bmI5YmFCQk1iWWV2alNiR0xWQ0lXQkhHaEpmQWJzMjluQW9sYUV3SnlFWHJJ?=
 =?utf-8?B?OEo0aWFMU2tNbzNZbmdiMGdGWWoxcVlpeGVtcHRwOTFRNWgzRWQ4RGlkNkV3?=
 =?utf-8?B?aVl4VHUrSlRIY21oV0dCc1VzalpITVJ1K3UvNnBlYXN6bWVuLzg4VXRCaGRt?=
 =?utf-8?B?UHNoMkJwS3NGT3hjWmUrZzkxQTVFeGtKaDByOGcrY2ZQeWtURFptb1BNNmY3?=
 =?utf-8?B?bVpPZithRElROHBLdHRqTFR6RW1LK2V2aDNwdVk4elJLMGhybENxSndubU5B?=
 =?utf-8?B?bEFkMzlRTGIyMDFlRVZXdk9SczR0RExlZllGQ2xvL0Rhb21OVXRwU3RlZGtv?=
 =?utf-8?B?V0hTc01SNEtCakk2Y2k3NkhjcHpBRVFDeVN2UjQ1c3RaUDkyejV1Qmxlamts?=
 =?utf-8?B?OFJWWFN2eDFQOHZwVXdTaStHSTZoY05CUVNMQ0hJNG50S1JVTXFjT3FhV04x?=
 =?utf-8?B?WjZ1N0xCYTgwVENnZS9jVW9uK29qTnhuSDVsRWEvRTBxc1FxSjdXYUg2RDZp?=
 =?utf-8?B?dDZyaEx1QUU1eitKL2pYTnV5RTVjWHVseVVPUWlBOWFyNnlkL2dZbDY0d3Ix?=
 =?utf-8?B?NnJPQXhVSmthcGwxWSs2OGFQcHVmT0ZVRHRXZlREQlVzT2xDUGFqaGVzUVJE?=
 =?utf-8?B?Y2h3czFickRKeGtmemRvZitqbk9oYXhYUmdUYXJBS0ZGRFVCb0xMdUV2Wlg5?=
 =?utf-8?B?UVp6V3JPSnc0Y1N3Y2cwM0Z6ZC9sRlhYekV4cXB5MnJHUlM0d2k3TlRLTlVH?=
 =?utf-8?B?S05wVVMzb0pHaFpMQkZjaDRqQjNJNGdJNDBlUllydzI4bkM2K3NxdmxJcUNS?=
 =?utf-8?B?TzlPVXBoZmNmRndXcXp6TUZiNm9aV0E1WFBTcEJxaDBpTkc4b0l4WG9jZk04?=
 =?utf-8?B?ajlvS0M1WHBmQjBBanNIUW1hdUk4c0FjSXJoSlgrMEdTTUp6Q1NIT04zQ3Nl?=
 =?utf-8?B?ZjZJdzk1dDErRTJQU0lONnRkTUc5WHRwZDNUWUVBVi9BSk5uSFNYbVpMb3FC?=
 =?utf-8?B?SGd1NHNrT2lQS1ZPa2MybE03eGt5TDJhZkhiTk53aHZBKzBmR2lyOG9ENWdz?=
 =?utf-8?B?blFJdjA3VDRVWk8xaEphLzhOVGRzZ0dxdXd3WVZ1akJ1YTkwRXJ6S3BpR1l5?=
 =?utf-8?B?MnhKZ1hoZ05haEdYY0M5NGNzd09CV29LQ1QxcWdqVW1WYktBQ0ZPOFlUTmxR?=
 =?utf-8?B?K0ZEV3BuUVliOVhZOHIwRjRGWExwRHczby8yTjNQNkdodHE4RzdzSFB2NTJk?=
 =?utf-8?B?MEVQQ2Zibk9IM2J5K01sYUMzTVd4aHM5ZlRnWVhvdFdYbEdxU2VGUmhrdVc5?=
 =?utf-8?B?TDM1Ky9zYUNvdXVGaDVCNDJyRS9vR1UxSU5HU0NJbThROS80VHJYZlBacDZB?=
 =?utf-8?B?ZmJQZGZrMlBjcjJRRXJINWlzYk9WRzZOcDVpaWFSUzJCTGltK3REdFZlWDND?=
 =?utf-8?B?TG9FaXoyckgvV0tMbGNrWThGTkl2dE1TYjRCRmdlU3pTeDRpaHp0WXZzQ2tB?=
 =?utf-8?B?TzZzWUl5d3J4cXVkNnEyQk1SNlBTTE9aRnJyTUJQUlFCdW9UbE42cDdxd09a?=
 =?utf-8?B?NjZXUlNwNXlOWERTZHpjbEtMUG5ZMzV0ZGlpR3ArK0tLNFNFMGwxYUEzblNK?=
 =?utf-8?B?UGNZQmVIb0I1dnNNNmFTeENKZmg0eXV3MVdqVFBpVlR5TmY0Rk1ydFBNam5j?=
 =?utf-8?B?OXNRYUVGN0t0U29ESzRzNHNCNlIrSndnZmUvNW5NeTdaQVM1ZVJyb0FoV3BO?=
 =?utf-8?B?QkhyaFA1eFhKTTlYMUVXbFUxbUFRb3AzRUJqeElmUGY0V25wNGVLcHI2NytF?=
 =?utf-8?B?dmtqcG1hNS9rMXpsYXNFeVZPazBTYklSS05mcnZCN1hCeUI0V1d0WnpQQlRX?=
 =?utf-8?B?SkxPT04rYUw2NGVyTFloa1o1UktGZFVaZWRleFBqWkxpUFpJV1lSbFNLNHpo?=
 =?utf-8?B?dGlHNXVjZTBNSGo1elo3Q051Q2FIcXJWaU9hOE10emVscnlFVUNTcFNFWU9B?=
 =?utf-8?B?UFR2SjJvMXR3UDRRNWpHMDNrdXl4ZmRRalR5Y3Vid1VubElyWkU2SHpSdmpV?=
 =?utf-8?B?L0ZxeTlIaDZnVlRWSkZYZncvVGhjZzRnZWR1dGFFaUwwNjM4Sks4TXhaWUFU?=
 =?utf-8?Q?+sfEmYa7g4eVAzVYsr/LNssPe9XP5QIlC3x+RV1LlvhFY?=
X-MS-Exchange-AntiSpam-MessageData-1: Y6JClQU8kLIKoQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245201a4-721f-4d8c-0310-08debf9f729b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 05:34:27.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7fBA1HGAXtetQjsprmvYv+i3ztsZroEcsKOeNHKq6QKVRWiv3ii0lA1xQ41c9ArXF+9yQkptjxissWiJiZ0tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4270

On Mon Jun 1, 2026 at 11:07 AM JST, Alexandre Courbot wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> <snip>
>> diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-co=
re/fb/hal/gh100.rs
>> new file mode 100644
>> index 000000000000..c122ac2091f8
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFI=
LIATES. All rights reserved.
>> +
>> +use kernel::prelude::*;
>> +
>> +use crate::{
>> +    driver::Bar0,
>> +    fb::hal::FbHal, //
>> +};
>> +
>> +struct Gh100;
>> +
>> +impl FbHal for Gh100 {
>> +    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
>> +        super::ga100::read_sysmem_flush_page_ga100(bar)
>> +    }
>> +
>> +    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result =
{
>> +        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
>> +
>> +        Ok(())
>> +    }
>> +
>> +    fn supports_display(&self, bar: &Bar0) -> bool {
>> +        super::ga100::display_enabled_ga100(bar)
>> +    }
>> +
>> +    fn vidmem_size(&self, bar: &Bar0) -> u64 {
>> +        super::ga102::vidmem_size_ga102(bar)
>> +    }
>> +
>> +    fn pmu_reserved_size(&self) -> u32 {
>> +        super::tu102::pmu_reserved_size_tu102()
>> +    }
>> +
>> +    fn frts_size(&self) -> u64 {
>> +        super::tu102::frts_size_tu102()
>> +    }
>> +}
>
> As of this patch this HAL is strictly equivalent to GA102's, with the
> first difference between the two introduced by the "larger non-WPR
> heap". Could you move the introduction of this HAL to this patch as
> well?

Actually please let me know if you prefer me to roll this minor change
and merge the result (and same for the next patch) as we have another
review and there is little point in respinning just for that. I just
want to confirm that this wasn't done on purpose for a reason that
escaped me.

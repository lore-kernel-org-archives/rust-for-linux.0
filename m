Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2831D74B;
	Fri,  6 Mar 2026 07:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783271; cv=fail; b=TxoeoCi1JM0KOA+idicqQYxfh9XnqyB/3dkM0ErNeXWkXlmJ6rC6KFt70G4IUJzeiM/truOM9hc+itsYWX6WxnFag1/nKwCk9xruEVUtp+1fSGZ5DnDthXPAWtSYDzJJfAALAvwlUlxY5XATz+ycP1G0fu6CqLdm3oLNIR7j3A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783271; c=relaxed/simple;
	bh=OjAi9f1qB5KcIig1vAqqC1ZdliVbAgLSAB3kzleICkw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=m9ySjXsi+L4tACevljpNCLZ+XjyZ93+dvZEhbq6tCNDKsiCZOo9RkIgDM63I4eZ8Brs2pMUS1kFg/6TdX1EbZB19VTReZmfF9hCtQgFrM5fLZEbXGFL7CBgAqNy2PTnTMA/HnmmeC0jJOeIOESsjZiyQkEw+FnkKVMpzsR7rXpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X5IUszUW; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X5IUszUW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kp/Dv1m8hPzvCqq1puuHmUNcS1ct3hFOfqvhpogCR+SNdR67EmgoqyRxWdjaUlgUgGJNRYLf4NbNxUbJuLxAHxzVXwjCvIvC32Lnt/Lghu6ziloMV97SEx7E5sotO80ioqBU65Enu8AjFe+tzn+uMjX/ipQATaYMGpARKvSUrSw4ypTui+Q+MprLQ02rtYNAHMPKG9zx0VOi+JmLQO9HtmYRVO0h2icbTrOaPuBKle+Njqt0kP6VyuZnSwZ/KSnQmJP+w73+qE0u/4KPegrd/lyp7D3E/X9K6KS+/tIP/8QL+HkKjlTvT2I7OPEOL/UgIrVoMj1AiQ/LRbo+kaXcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8e+KAb+2NQwWsNEaxRufMIVawsmuLrajqkNF5zThs0=;
 b=Yh+TRflk8tcIWrrT9GkLZC3K50sjZjC2h8+tOfOwLlSRrS7a2jntcssum3fwBP905HJzazqWhAssmb9K3X7LTY8hM3LoJHcIRqwY8p3cekcqPQDMfVd285t0FKQwUr7X8PPZLsNu1Hd9RpYqSovFQqIboAmypZn8gv5h/+GPEpbhftFKzbKIde1XWXE/hc2lu+dxwz+vHxjBHNzNvQJGpLo3CqtUHmYK9LCSVDGJ484OduXqyFadzy7PV95QD5dS3OHU2ohS/Z4Ep0ekSfGfCJa5HgVJX5NHeEjLfBtP3RNsZ3oPZG5t2E1EscbjZXoccGCqqIz0qzOiYxQP0DxDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8e+KAb+2NQwWsNEaxRufMIVawsmuLrajqkNF5zThs0=;
 b=X5IUszUW5hWpaMyZfjBh4pCcQUtVf+hZa3leNI4AVhZvmtm/FOe88Ib4uP0MazKnj8WBHCdZ811lqgvcRsnZ20Jv8BT5JIzdIbGV4nFfFPrzKn6qIYTfA3pRQ9i2pcMD+VlniWjWD2i4stK4a4F+zHJWlIEUGyq1Y2wccC2x1Q85nvG7oR+VU378xErcyE0Dz/3YlBcrgut5ITcFs7M5czGIeI7+lf0pKGtputXH+gZsOEU4aUTL0pOdXDPFo1B7HvJYhY3l6HqX/SoREOzIfdFC6Iov80dbh/wnDy3O2sZOVPwdrMZnyo8IFDFUvK/uMwtl+EVPngTsTdvkAaHxqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 07:47:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 07:47:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 16:47:42 +0900
Message-Id: <DGVJ7VQX3TD5.2UYW004QJPI6N@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
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
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
In-Reply-To: <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fa4296-2aae-4a2f-dc1e-08de7b54a7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	M9+ONInCLbH7CNod7SUhgUAgbHisfCbHbq0ZfIFFuDKp0sTp4+bYqjevxBkpW0hyNK2GMa94IKgrdLMSHnQJznu1v9ig4rJtVqeNsghAerKBpUqLk4nyjDPEhVr9feXf3o6qEiHD3v9gzc/Y/2Z+3Nqv9Rvsy22WP0oqPIxcwhBVjEyy6CWAFaYlM1imcoPSRkg8bgnA+DABKzsl2rLIlU9xroekDK6A2Npuz9c0QJMWGlnWfkrHX2BQt7laH6Ohw2kQKdmyflmHaBi0h0YwqVA8rFKrbsdY9O45yiqOKvd8V/9AynwvMM6D/dIEzGXqscsfUIrxgJ4E7q89U7SIg/JXTbWNsRPZg2h8x++q+fqfbG88SsrhR/QYghawUZsTq1AKfi1gKOggXxmwhb7K8+/NbpqESfCYBq+1fpijR/1yCbbe4s6I7OUuZeEZChv0fVH3LQTzgzE6lIsVct7t1zWAIWysgaKKe+iRJqxnU8yKQOsbvr0O2clTz5enUy0Dz2HVQ6zEPNk5RViXpaBnUR+aJXbMU0Py0JuryiAn3v4zKNd6Ti/tw/XfGlfhy2T795Df+xLTiADm9mBjaSi7dTnurjOQrLuBFwbcRbIzU+CD++ah11+8LJ/oSmiazvIjHa4I79JOpekZJCxHX7s42DvJuUWLxyRaMYQ2AkAB9vUUhUlWH82AquuoCEZYPzaN28+UXBiuY1YiqEGcW04gTQQQ+WT14pEl5P5Ap3KB1b59v07q3OzKjA0iv947CQLb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXBQd1hYRUs3SVZKckR4MWdiQzZPeWVFanR2WUJVWGJIdHd0VndETm5vU0tz?=
 =?utf-8?B?UWs4VjcvN2N3ajlPc3B6VTZqSnhlMWxtdTVkZGVCVG5MalY1eWg5d2V2VlVy?=
 =?utf-8?B?OUxzWW96UHcxekphb0lxME9lU0k0a09DYUR0WlZ5MmdwdUpLNlRhZTV1cUVY?=
 =?utf-8?B?bjhtWVphZm9aMHdjaCtPaDJyb0JZY2ozaGhSR1JUS2JjS2xzZFVVcDVJcnMr?=
 =?utf-8?B?S1FlSFJmRmNhNThRVFZ4dWJWdWVtcFFvUTd6aEo3anc0c2lnZ2N6MlUrOHU3?=
 =?utf-8?B?VzJ0aUdnc2JxYzE3VlY4UkdpYjFHdW1wZjRkM1JGMGJXQjZnTG4wR3FVd3k5?=
 =?utf-8?B?L3JqcXM0a2pFVlB2bElBeW1maWxkSUJ1dEtzQ1BtSE84R0QydjF6eFBRR0tM?=
 =?utf-8?B?RmttcWdIS0hiakhxY1BudnBLcE1COEF6czFHSDI3Y1hka3F2NzhqY2JBQW12?=
 =?utf-8?B?OEE2V0tDOU5xaVFrVXdyaERQbTdiNmVEVHNOM3dmQmNMTDRGZk9kTkFWaC9O?=
 =?utf-8?B?RXFlRSs2a3dBaFBwOGtMY0wrLzBsVitieW8wcEQwMnZQMkJldkFlYnJGRGls?=
 =?utf-8?B?M25iUldvTXJkSDVvVHJPR2ppUUxZdDUyMlFrTzA3azNYcFF2R1BxaDlqdklw?=
 =?utf-8?B?MUsxUnhQdzhkbWxJZ3NKeCs1U2ptQmdUbVBuL2I3cDZtMXNsWXJuWkxweGF3?=
 =?utf-8?B?dWNKeFNGU216ampVNFlpNm5xbDFlWkNvZmVRMXRzUUJCMlNHSnBXR1YxY2RV?=
 =?utf-8?B?bytSbENzNEdXUlI5amF2cDkwYXBubTVWdVd2Qnc0YjVuTEdWcFFQenZtanJm?=
 =?utf-8?B?alk3OGt5T3BGamlraDFhZU9ITERJUmorTkF2YmQ4aE82emFhYzFyUlA0cGdP?=
 =?utf-8?B?ck5wcEpmOE95cStYSWU1WDRERjlkUDREQjBLOW5VWFZYQmlGcVBGODdnd09n?=
 =?utf-8?B?NEwwQjdiTFZVcDU5RnM1Rmd3RU9CbGtVZnhSOVFjcnpWdFJsaXVoRUZvMk9P?=
 =?utf-8?B?QTJlSWZwZFNML0RtcVdCY2tvVzNuWVRwU3cwNjNFcjlqZ0dzQVk1Z3hJRzVm?=
 =?utf-8?B?M2J0VHo5bmM1c29SdFJlUWl3Nkh2d2JQbkF5QmpyR3lvSmtqbWEvZTU0YW8z?=
 =?utf-8?B?Y1YzMTFSVFN3eHBaV0RnbExSUDMxNXFJWkZPQWdlNDZCMkU0RzQ3ckc1SDRo?=
 =?utf-8?B?NC9DRzhPREpCcndUWkR3empFNnU2TFlzRGhCd3NlUExBa0pMbWt6YVVBaVl2?=
 =?utf-8?B?cGR5RE10c213bkRPaEJhUUJoamNyMm5Wa0ZsakRGQ2hHdkcvdTNkUjlINit2?=
 =?utf-8?B?am1uMzNYT2JuZ1NkREFTWjY4YjZwbzI4alBhY09hWk9iS3pwdGV5L0l6MjQx?=
 =?utf-8?B?M3NwVE1IMzl4VHo3dlhhUGg0S2xIMmUyTk4xcm81RkpSTlVLaFlGSGtyUXpD?=
 =?utf-8?B?ZFc3bG1mR0Rxb0VzbHEyNUVpS3dVMnNiZW4zdUJud1BKNXJ0M1pheWsrSjY3?=
 =?utf-8?B?M2xuVDdFTVBjNmp6bVZ0dUVUYkdRVzh0eXU0c2VCNFZuTVRFMk5RdEx0SytK?=
 =?utf-8?B?MVZOTjVONnExd0tvendka2Z6TGFlNGVaT1hiRUQydGRyTnFSaHVTTVBwcUdB?=
 =?utf-8?B?Q1FFUGJqZmFRRGRzeWl4OGxQeENDSlBndHFpM0lwcmwxck9YdjZDNUhFR1g4?=
 =?utf-8?B?NWpUL1F6Yk14TjJSR2JVcE5pQ2s1MDFtdGJsSWY2K3ZobVZPZHRiQkNMOEZE?=
 =?utf-8?B?a1JIMXhBYVc0WDNqbDdqU21ZZDRwU1F4VFNuNG9hUzVvOUJZT2FjZm1GMHJm?=
 =?utf-8?B?VTFaZXJ5VkFjR3Y0UFQwQndFTVg4eE1OS1didUtlbFAwZllpTkdYMDZ1d25a?=
 =?utf-8?B?TGRtQTg3SFRheDZoRUQzZEZaQWw2ZFlSWmtGcm45OEpFZ1ltb1dZandkeEx5?=
 =?utf-8?B?cEJWcGVWSmNHYnFPRkEzQkhwRnhKMWdwbEIwVzNqRmxFdmd4NFJCdEU3M05Q?=
 =?utf-8?B?MDlaNlFPVWJ1aDhEZENYNWFWYjhkbGpTcmNuczZSajA1NGVOdVRVM1VoWnRj?=
 =?utf-8?B?SGt5YmNRZUlKSWJQd0lySUkyb0hhQWJYMHNNWWEzWk1lUHByZTZyTFpaU0hC?=
 =?utf-8?B?UFBNYUxXREFGdVhmeUJMc2pZc0NvVXlRNzVjUnFHNkV5S2lEZEQ2Z094VDNB?=
 =?utf-8?B?d0tWWjNVQlJpbGg4RzBpMTMzTFVGWlIzbURkQ0oycnVkOVpPRjZHcjhQMHIy?=
 =?utf-8?B?Sit0UGwrMXhzeHVHRkhZcGcrc1Y0eDlzR2dCQjhFR0NudHAzbHdkNkVMU1Fx?=
 =?utf-8?B?bHl4cHVtRHZLZnVDejk2c3B5MlV4bk4wVS83UTlhalE5a2xla2ZEcldEUGpt?=
 =?utf-8?Q?4adBzbTv6WErjEC4kD7GKySivc98p5beJQUBzW2AfyGxQ?=
X-MS-Exchange-AntiSpam-MessageData-1: +d2F9nmou/nudg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fa4296-2aae-4a2f-dc1e-08de7b54a7cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:47:45.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmkePwmUr9Ox5rJT71svrQX6z9KIFGmK72fBZCAUSLFyg/bDa6niBCstzFKBYUCN9b4Ec/CRl62i+rUCxMJ2UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211

On Fri Mar 6, 2026 at 2:37 PM JST, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 8:37 PM GMT, Danilo Krummrich wrote:
>>>>> On Wed Mar 4, 2026 at 8:48 PM CET, Gary Guo wrote:
>>>>>> On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
>>>>>>> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>>>>>>>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>>>>>>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>>>>>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>>>>>>>> So, to get a better idea of these two options I have converted =
this
>>>>>>>>>>> patchset to use the 2-arguments `write_with` method. Here is th=
e
>>>>>>>>>>> difference between the two - it is particularly interesting to =
see how
>>>>>>>>>>> nova-core changes:
>>>>>>>>>>>
>>>>>>>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:l=
inux:register_2args
>>>>>>>>>>
>>>>>>>>>> This looks good to me, but the fact that this turns out nicely h=
as nothing to do
>>>>>>>>>> with write() now taking two arguments. I.e. there is no reason w=
hy we couldn't
>>>>>>>>>> have the exact same write_with() method together with the single=
 argument
>>>>>>>>>> write() method.
>>>>>>>>>>
>>>>>>>>>> The contention point for me with a two arguments write() method =
still remains
>>>>>>>>>> that the arguments are redundant.
>>>>>>>>>>
>>>>>>>>>> I.e. you first have the location in form of an object instance o=
f a ZST (which
>>>>>>>>>> in the end is just a "trick" to pass in the type itself) and the=
n we have the
>>>>>>>>>> object that actually represents the entire register, describing =
both the
>>>>>>>>>> location *and* the value.
>>>>>>>>>>
>>>>>>>>>> So, let's say a driver creates a register object with a custom c=
onstructor
>>>>>>>>>>
>>>>>>>>>> 	let reset =3D regs::MyReg::reset();
>>>>>>>>>>
>>>>>>>>>> then the two argument approach would be
>>>>>>>>>>
>>>>>>>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>>>>>>>
>>>>>>>>>> whereas the single argument approach would just be
>>>>>>>>>>
>>>>>>>>>> 	(2) bar.write(regs::MyReg::reset());
>>>>>>>>>
>>>>>>>>> That's only for bit field registers that has unique types. I stil=
l believe types
>>>>>>>>> of registers should not be tightly coupled with name of registere=
s.
>>>>>>>>>
>>>>>>>>> Allowing a value of register to be directly used for `write` is a=
lso confusing
>>>>>>>>> if a value is not created immediately before written to.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> So, if I would have to write (1), I'd probably be tempted to imp=
lement a reset()
>>>>>>>>>> function that takes the bar as argument to hide this, i.e.
>>>>>>>>>>
>>>>>>>>>> 	regs::MyReg::reset(bar);
>>>>>>>>>>
>>>>>>>>>> I also can't agree with the argument that the notation of write(=
loc, val) - or
>>>>>>>>>> write(val, loc) as the C side does it - is common and we should =
stick to it.
>>>>>>>>>>
>>>>>>>>>> This notation is only common because it is necessary when operat=
ing on
>>>>>>>>>> primitives or when the two representing types are discrete.
>>>>>>>>>>
>>>>>>>>>> But this isn't the case here, a register object is already disti=
nct in terms of
>>>>>>>>>> its location and value.
>>>>>>>>>
>>>>>>>>> I see no reason why register values for different locations have =
to be distinct
>>>>>>>>> in terms of value types.
>>>>>>>
>>>>>>> That's not what the register!() macro currently does, a register ty=
pe always has
>>>>>>> a unique location, or is an array register, etc. In any case a regi=
ster type is
>>>>>>> assoiciated with a location.
>>>>>>>
>>>>>>> If the proposal is to disconnect location and register type entirel=
y, that would
>>>>>>> be a change to the current design.
>>>>>>
>>>>>> It's not what the macro do today, but I don't want to ask Alex to ch=
ange it
>>>>>> further before landing the series. I do think it's a worthy follow-u=
p to add the
>>>>>> ability to decouple the location and type. It's not incompatible wit=
h current
>>>>>> design anyway.
>>>>>
>>>>> I'm not sure there are any relevant use-cases for this. Do you have r=
eal
>>>>> examples that would not be represented with array registers?
>>>>
>>>> Even for the cases where there's a PIO register, I think it's benefici=
al to just
>>>> get a value without a type.
>>>>
>>>> I don't see why we want people to write
>>>>
>>>>     self.io.read(UART_RX).value()
>>>>
>>>> vs
>>>>
>>>>     self.io.read(UART_RX)
>>>>
>>>> or
>>>>
>>>>     self.io.write(UART_TX::from(byte))
>>>>
>>>> vs
>>>>
>>>>     self.io.write(UART_TX, byte)
>>>>
>>>> what benefit does additional type provide?
>>>
>>> Well, for FIFO registers this is indeed better. However, my main concer=
n was
>>> this
>>>
>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>
>> This specific case is indeed more cumbersome with the two argument appro=
ach,
>> although given Alex's nova diff I think the occurance shouldn't be that
>> frequent.
>>
>> It's also not that the two argument approach would preclude us from havi=
ng a
>> single argument option. In fact, with the two-argument design as the bas=
is, we
>> can implement such a helper function cleaner than Alex's PATCH 10/10 (wh=
ich uses
>> `Into<IoWrite>`:
>>
>>     /// Indicates that this type is always associated with a specific fi=
xed I/O
>>     /// location.
>>     ///
>>     /// This allows use of `io.bikeshed_shorthand_name(value)` instead o=
f specifying
>>     /// the register name explicitly `io.write(REG, value)`.
>>     trait FixedIoLocation {
>>         type IoLocType: IoLoc<Self>;
>>         const IO_LOCATION: Self::IoLocType;
>>     }
>>
>>     trait Io {
>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>             where T: FixedIoLocation +
>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
>>         {
>>             self.write(T::IO_LOCATION, value)
>>         }
>>     }
>>
>> No need for a `IoWrite` type, everything is done via traits.
>
> That's cool but will only work for fixed registers. If you work with, say=
, an
> array of registers, cannot implement this trait on a value as the value
> doesn't have an index assigned - meaning you would have to build a
> location in addition of it.
>
> So it only solves the problem partially.

... but the remainder of the solution can be implemented to look
something like this:

  // Write a fixed register.
  bar.write(regs::MyReg::foo());

  // Write into a registers array at index 10.
  bar.write(Reg::at(10, regs::MyRegArray::foo()));

  // Write a relative register at the `Gsp` instance.
  bar.write(Reg::of::<Gsp>(regs::MyRelativeReg::foo()));

Amongst other benefits (no closures and the complications they bring),
it also seems to be the shortest syntax so far.

This could coexist with a 2-arguments write method, or completely
supplant it.

Before doing and sharing a full implementation, I'd like to check from
this syntax that people don't hate it. WDYT?

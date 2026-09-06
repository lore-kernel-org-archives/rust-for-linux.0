Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2251C5F1B;
	Sun,  6 Sep 2026 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788735720; cv=fail; b=F+OnOJeIMd+9h731AQ2tKPFM41i3eeGHDocrrKT8hXzHLO6NAjyvTQgfO5H8nTWSeAlA6ubPzod4ETHrYRRgAZgaoiam32YDtIOT4mx4cL2woheZ14L59/Ml27tDgN2Ypi+nyep0SzFuXiDE9Idmdovnq16YXLWGOuqbJm7tk48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788735720; c=relaxed/simple;
	bh=Oi5SDt2ZbzNsdP148JGDNpY+dTohxA3sfC8nUM0JQVk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CwmXSumXBlfdNsTwXzqf18NwWi4c2IORxZMv0VZYAV65TW7HzwMfECclS6Ei2Fhh9IgottQyKX5FS3ZLsCRgvVNKUcCO/r8RQemE8E+3cbl0tR8DGOnLQZ1SSTXhlkG2uknhpV4d7Yko4ErDiC0szJM7hqg7yesdEFcu67z7a3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jq9+UmNl; arc=fail smtp.client-ip=52.101.61.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jq9+UmNl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNkkwJyYjpr9/lc8LqEO1h4ZF62kImi8KhnBPOk4heXqWBEabulxeng8Uko+DT3nPzce+FVrez3EPyRTQW1YWRJ/FFBmGHUeKYXjA2P0x+mCv8sURFWSJxjS3Xpys5Vn/vFvrZ8L1o/byp763BF8BenD9Pv7/vs1NWT2T7g7jEVNYpUbRjYXwsNLhGE8Af1v7Njh9O54FahTMA8rBdzueO9BZs4jsQ5cb/b7xSPW/YedfRR2v6krGlwGwQ5UHT4hghGu/N0lnFA97jNKvfhCmd7ZLc2dlFRhTbR9V28z8H2c8zw+yMVgPtsuSDWDxxxsGh7a27cfRyEvijdIoREqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eN7g7upyYmbnOLsmCSvBTzYJBWUXHBiOVA0uaazB5o=;
 b=XnP/a2BkUOHFT/tsgVjHE7cKa5MGU7mia5YzeP396uM6ByECxbRj0KNkHiVAxJobnb9h8zyPHDxoP52jh65uYkFC7NP4rDhxn7F4om4uYjs7sMn5lR6o6zEh+/vFKjKOTifXUWtguJjTPGx2Brzeyd8U7X3HPfbHOZeKl10c/uYJfP5xsY6iJTp51saCif/xYq/rFHGjiQlnZQE+TjCUv9fLUlCX3zaOmpzgJzEeHU4eMKE2Uv0U1sTmrUg2NvlaN+DB7A/29yorI24eCTYjTK/6ifD1Lgrs1WaaWDnPKFjBljDPgiY6y/1wl0ORjbrELp7X0rgKkilR6tYL69PINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eN7g7upyYmbnOLsmCSvBTzYJBWUXHBiOVA0uaazB5o=;
 b=jq9+UmNlH5ftwwlelo5ZMR/OAKMT4Vg0SyH3Y5hjflIVxs8Eu/6mwLk53ZJWikDVpeZqQ8OAnT0SAdxpfhOcWUQKnhlED9zu0cRYYeyFb3ReDquX6AeV3k0aM6dvywwCoiE2xHPKfTm0Y/a16Fgo/VADNbAHNXP9txKlbf9pfrvJBQBaOELmUH959tlZvQ9ySJ8SeezLauuy8GNYxSQIdHWUCrYbv5ZS/M+TO7FXGDuCGGlVEz5TACn5jmDYq73jG3A7eTXy8uKgA1FbncDiXOh1FXoEZYwoCJXdgteKisziuqLj18wntfle/G7cOGUe73CstoLByRJbku0aqWYEWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CC6PR12MB283837.namprd12.prod.outlook.com (2603:10b6:170:209::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 23:01:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0382.012; Sun, 6 Sep 2026
 23:01:55 +0000
Message-ID: <68d846c5-7c56-4370-9334-4b3929c1fec0@nvidia.com>
Date: Sun, 6 Sep 2026 16:01:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: allow `clippy::as_underscore` in the generated
 bindings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
References: <20260906215822.1201022-1-jhubbard@nvidia.com>
 <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
 <CANiq72mOMgLi-8BBhFDLTzKqWrBNu0n_5D46jnwU0kwJgZ=j6w@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mOMgLi-8BBhFDLTzKqWrBNu0n_5D46jnwU0kwJgZ=j6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CC6PR12MB283837:EE_
X-MS-Office365-Filtering-Correlation-Id: 0688aa0d-4a15-4487-ae15-08df0c6ad87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IR8Y8pubB/cKmUv/ntcY7NvcYaEbvsID4Q2T4GJDkHRRAFRSfxN0F4zlbIVca8V2sKSCI2zEL+3ZsGz3mJGEwpcVlw5nTSGTwCgBtcPv0hjwoa7RPOhkDDCwVzq1cXWK8k5eGT5m6RiKm0TVQTfjqGWN23290nBTCnRu+w3uysERsxJ6iXLhipjy2AthV2PnQy7cm+SobNRAhzlzxIx5qadtp155F9tIfp8CrbK5D2Eyk82GqI/jpb7AEIDqOG08hKdk2u3TSE44MnucMN3ry8eJltuZJ2cM3EgxqB6HPpH+QeQyAuCEAuSp9cVp/X2r+Y9MzazgmEjhHHJai4EJCIS8SVYXyxEIvhMf2r0GbgYny/o5DBWlhjq4a4axHYsbUXEeC+eRXzKignGhQInTstP4NlksZxl2YVAy48BbgBhSu0qyo3BEKn0PBdAtju9foZ1GXA8FMlgisBWI4FCJQi2q0FGewSULaEQ9thVZkCZeeJ28qMJh2w5W9vs0u33OFeS+3eZBCT5GjXA4WX+9dIjvarHB7vl1mMEUishk1w7rbIxrIofVHg45e5HHFOSJt9mKUe/hkjCnuhTBnBcWZKUgDTwcB/13UkQfVy4W+SRc2Zac7jKQ+p2ERZ5lxmPhnkot5Sj6ECHfaq43u6HJvNu2uQbjLRypcJGtO710aH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S09udFVpbVpYVjYydlE2N3QxeU0yRkRFTFJtZUk1MDN4enpvbzZSQnV1U0Vy?=
 =?utf-8?B?RUNBMjhtMEZ1ODMrWnRuZzQ5YWovUElPZFRid21vVVhIRjVXa0Y3cDN1VmMr?=
 =?utf-8?B?NTZWYnRCaGJQN3pVdVZ4UlNkRzNCUm05UHBMY1lGNTdTdTRzVU1jWnlzVkZw?=
 =?utf-8?B?S1V4KzJEdmhQMFhqN1ArYjhUcXcvU0RZN2ppN0Jsek00bWZQVHhzRytxanlC?=
 =?utf-8?B?SFg5N1VlQjNOWHhQelAwSGxaYjR1VTNHV1dCNWhxR082T1QxQStlVzFPZC9l?=
 =?utf-8?B?VE8raHhsdGc0eDZGR3VGOXVMMjh6MWV3YlVPaTZIVENxeERQbWRjWXYzakcz?=
 =?utf-8?B?eGowZmY3cWN1VEhzeUNQYWkxVWpMZ2Z1WWxlV1BuNGtpRGFiSWpIelVRamY3?=
 =?utf-8?B?dkZVRnM5am5wQXh5OUJabE1WWWVtbm5ISkpmclNrNUhTRnZQUHFqdkxpSEVs?=
 =?utf-8?B?MGxMQy96ejFJcnB1aGNwTFVuVFdqWjhjMy9uUVZLQUVaT0MwVThPWjJ5NFZ0?=
 =?utf-8?B?cGsvMDA1amFEUXpyRjkvbU9tMmlBT3NmMDgxc0pBMURMc0lHb2pJOVBtL1J0?=
 =?utf-8?B?SGxGMzFxZzBXM3ZZVTF2QzRNRjV1cmZiSDA2SkhteHNMMUU5L1VwL2lIdmYz?=
 =?utf-8?B?ZldEbmE5eTNmdi95dklJVi9sSjRhcUhrckJLaWptR1JRaHhJQXVwZE9XWUhl?=
 =?utf-8?B?ZHRDZFEvNmNYK1BSUHlOdDE3QkFObXZrTy9ubjl3QWs0eFhXMThKb20rYm1p?=
 =?utf-8?B?WDhMY1VKcTA3end4ZEh2TFZXbmZuRWlPck5uanRnQUN6ajQ5d1hRaDE5bEIx?=
 =?utf-8?B?VzQ4Wld2bjQxR2p4NFZZRkFSQ3BId054UFY4eFZnV3BYWlIyWWQ3UW51OCtO?=
 =?utf-8?B?dGFYQjU5Z3lDbjJsOTBneUFtRUErYnBteHEyblpxMFBLME1tdHBrNjhiK2Zx?=
 =?utf-8?B?c2NIc3VMMEpPclBNUmRTSmYyYTNuQ08xemFLM3N5Njh3NXdjNVBlcFpFVUVT?=
 =?utf-8?B?SThMM0l1bWFPdk1RZzhuOUZFQnhESFhDV1R0WDBkVGpKTDNlNDk2QUh5akNy?=
 =?utf-8?B?Q2N1SEM4aFprYTZvUm5oL0hvZWNzUHdwNm9oY0FtSGx2QVpzZUNka0tscEx1?=
 =?utf-8?B?eHpoQkh2dlZscmpMWkc5UWN4WTdaeHp1UVNKZkZjeHp1Mit3WTdReTdFa2xM?=
 =?utf-8?B?TkNDTmFnN3JQNkpGc0ZSY0JzSXY5eWJtREgybXM1MVhvZXR2SENMYUc4UGRj?=
 =?utf-8?B?OERPeWlMU3dGYlkzMXdsaUhuODdVZnBTbUtLWDNYeklSR2o3UGVDek1tQjA4?=
 =?utf-8?B?d1pMUDJjSEFURWlRTXJTbXEwMGZVMG5UN09YVVdXei9rTEFKMzFqcEs2RXdt?=
 =?utf-8?B?QnMwRWtwKzF4TUxRSHFsM3dOb0tpdWhTOHBTbTAxeEVIeURpL2JCdTJDbUZH?=
 =?utf-8?B?VDFsVGNib0c4QXN4S3VEWkZIZ3FFMC8vcHNybHRHZzFsWlR3Y2hPVE5SRG1s?=
 =?utf-8?B?QVQ3Q3prYTdTUWVhUDFOV2tjOUVEUHhkODMxMFZLbUZhdXRCTUorcHhQNHZu?=
 =?utf-8?B?WkMyRklDUm5xV2lFRTh6N1VvSHI1UCtyU0MwVkl3d1NJRWU5VlRLU0pZSFJR?=
 =?utf-8?B?M2hKUzdRMWRlSmU5TEc3aURDWUxXbW1XcjFlaVJ1eWltQ3BUVy9Bb1FEakhK?=
 =?utf-8?B?UGxmMW9KdFVqd1Q4UGxna1UrUlF4NGVQS2N6TSs2L3ByaGVnSGx2VS9yOWwv?=
 =?utf-8?B?RHduOXRTcUo0T0pPcHdZT3lUSExHTXl1cmppbjg2UHE4aGpST0JveW5DWmRk?=
 =?utf-8?B?Zi84TVU0aW1BTjJGY2NkZFNEVlhrV3NBdHlXakd2MjBFUTI4c0ltNGpFOUgr?=
 =?utf-8?B?Q0dERDJkQVBEc2oxd0JuNWtXNUQ5UkpVNStYdi9nQ0dDVFN2Rm5mQml3akVJ?=
 =?utf-8?B?ZEN4b3lUV2JGdklGYWdVNFBGZkVxUm91ZVY4TzZLUUMvVXNxc29ObGFaM3lo?=
 =?utf-8?B?dDhpRElXeGFDcmw3ZHhDNTdNTVhGWmQyeXhNUzllYVhoUmNSVFFxaitzRERO?=
 =?utf-8?B?SU54Y01TTG5Ua2pTQ1UxdEpPQ3NnbWdxRlhxRTZoWStUT0w4aFJlbXBCaEJn?=
 =?utf-8?B?WHRkZS9ZYUFncDYxRHFnYzRycUxaeDdORFNFY3RvcGFROXVMenhJQ2lyQWZ2?=
 =?utf-8?B?TlpCVzJJUHZLbWNrSFkrNHRZVm1rWFQwVmY2TlRZZWE5cVl5dDA0aWxYN1Fp?=
 =?utf-8?B?QlJRWWM4RDBFTnlROE5hazd0YXkxc3FEbFZVM1FFZ2d5empaT3RvNk5IbEhX?=
 =?utf-8?B?czBGS291RjRiWnVMaXVEN0xORmpJZm1rbzBCYVBhT0VvclBycFJjT3A3YXBz?=
 =?utf-8?Q?pmu1oMKBcGpw/brA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0688aa0d-4a15-4487-ae15-08df0c6ad87e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 23:01:54.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLRnnjoIFpypmPGOon+6crrM/d2JcpstCJrwQZKs1vq+7qU6DAul4BR820ouCQUt5DUbALzDC3C4XewXfqQxaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR12MB283837

On 9/6/26 3:56 PM, Miguel Ojeda wrote:
> On Mon, Sep 7, 2026 at 12:48 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> Thanks! Looks good to me.
>>
>> We have been getting 0.73.0 and 0.73.1 fixed for a correctness issue I
>> noticed and I didn't see these yet -- I definitely recommend avoiding
>> those versions for kernel builds.

Arch Linux, always grabbing something new, for better or worse, here. :)

> 
> And by "we" I mean mostly Emilio (Cc'd :).
> 
> By the way, what do you mean by:
> 
>    The minimum supported bindgen is 0.71.1, and 0.72 does not emit the
>    cast, so upstream CI may not see these warnings yet.
> 
> ? i.e. what is the "upstream CI"? I am not sure which one is the base
> commit either, so perhaps this is about some CI in DRM or similar? In

That's just me guessing about how this was overlooked. Yes, go ahead
and remove it.

> any case, I think I will remove that bit from the message since I am
> not sure what it is meant to add, but if I am missing something,
> please let me know!
> 
> Cheers,
> Miguel

thanks,
-- 
John Hubbard


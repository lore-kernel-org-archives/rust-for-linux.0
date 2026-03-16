Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D235F5F3
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 22:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700633; cv=fail; b=nqFnh7OpzvhpbQWZ0w0I4i0xIjPe194OnnnCtrCs7t7hIlxz6GRBlHpmMby3FMavRObpJz+EpE/dP0aBQ4CQgSk/+6mkEYTStxzrVmfkcDmShX+LZhQbUjmm+DrK453HSZnOkovKR0jHAS8l/kPZOJMosuhu9etpIjZ4J0Wvkh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700633; c=relaxed/simple;
	bh=HuEFHAZPtqUJPhMHJYiyctiTiDHXTh/Q3fz4wCSkan0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kR7/f6BSso9DBquBVD8GiYHlzoc4ZXuLkxB46fVU12bomkDae/yq4i+TR9w+p4+1yR+ZLFuuujF+SpRSEmnIDPbbTHNN/SuWBKlj+DtnEsmu1LJ85GoUeyZa3h/xfh7qmuZLt2TWGL4sNkNt9a4btGjPAC2YBAyUc+mvZbl0vig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MMj1ZzR5; arc=fail smtp.client-ip=52.101.62.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MMj1ZzR5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX3tfdQELL8lIxdwrFDdkN8/b3oEkeNDPjht+FrS5I+3nIktr3XbsIhdzjgjbYZRv0Z+i2ZgKdrgphHyjGMdNxP6dFH915WCDceXSynR17tSNy+l84vZFlNGiaLzBbr4KeSesC8qrtdOwXYNDAKP7uN4fSoyCOWiqBcAUWXOFc/HJqTFfSCePjk5qGynwd350iyoNDM6Orv16/zfj6MJFbPTeOo2GQbLpdHexNOv+9QtfqmYMVFmME52XqkESZEewtLUsuXOykFE1bIx4V2JdFuAARgPE3bv/pDlAcQYaC8ZtvOy7eVO+hgnd2k4+5QmCuyXEss+T+m8164RPFBO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY06m64CG8IBMK95snJxg8aUGoFNxXzggm8FnwMzYlY=;
 b=Lii3vDN+RuDLVTfRGcTA/4Da5Sz0CNGxYNVR5iOtGEX39GkR/kQLRgq7g5oJp7pJJ1qjVS0wxoUzljhOI7W21L6vlJlDlRku/Fq6obXx7a+R0ARVka7J41TT+lurWpQhViV3Tw8sgLLstke2XJPe9o57e+REc1sh/Ptz48IPLzhHXsrqcD25BVqiWQvKymo6zvyLprfee/R9OD9jnHkzixVLJ4wDSm9na0NZPBZOZZOaM+STzdVlASFcBCUCn7JuONTFfPnrqQWwFlYoYEJieiwbSUo7pVubWmcJYeJbzG5/JIndTNO/U4abFTRlgOYQIv8zWiGnmvTuP4ZLUTp0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY06m64CG8IBMK95snJxg8aUGoFNxXzggm8FnwMzYlY=;
 b=MMj1ZzR5QQKEEoQrqfgbxp+3G5DCewy19f/U5UwA6OmO3G1JF7rSTL+FugECRlxRoOVGVfb1cA22FB19fysdeVZNXK5Wa9gZ717RaZYeTkLBPZ0Cf07M0JrkxJCKdB002OGxnKSECmbdsYdPmwaD2lavO2i2FGR5FLmKTVRqE6RlhWOzciHHBC0QJjUy0azEuahz4reTsrt7m7rtSdxeuiyaB5JpYPeeISQBYCRHbYUTltlZig9D8pLPKxppYSVB7RBzuX7X9o6R9s/JteAsy8b+qSPH2GOepiteTwMDulBA0isOsY5XFNsbot3k2ZSxBKC4sEd/GWRqc9Be4Miv4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.16; Mon, 16 Mar 2026 22:37:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 22:37:08 +0000
Message-ID: <7769e467-be20-4805-945f-8b739bccb50b@nvidia.com>
Date: Mon, 16 Mar 2026 15:37:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Nova developers: avoid nouveau mailing list until it is fixed
To: Danilo Krummrich <dakr@kernel.org>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
 <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
 <DH4KDGXZF3XU.R94ADYNQ8RUW@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DH4KDGXZF3XU.R94ADYNQ8RUW@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:a03:100::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: f38859c5-5c89-4af9-def0-08de83ac8e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Z5prvwaLO2McD4vDHvIdX/yiF7tJ0KIKqF/jSTqG+1XSC9ioc34wutARLNpG2cAe5u/46RtY22HLUMDgmv7I8GHlEs96dx6NX8mdXYMtKfs5iEvoUwBOAAjcbqfxieOx8RvMdeFyFXq1TBMMCPr3RlBkfBO4RpYEOlkvIdDqRpO2gdi/KPsnUfPOuuSNYz6dvCcZeavNHScA7oJAnSqDxoZZC2ac+X4cqtDkNvtGx8SADYTjNS54Ii2KGxi+3yGn6AB0UOXX8BYKz7Me3tC8/V01kMilwZIPETckyuCTvJqDsXSshVjvOktkYu6nhe9t+xGusQPPSs8pqGrRA8H1qIV3DQ5kodyinU+VJ8/eKcpeLYOLXEaDPJ7ls76tee8NzuoiZNzZ2tfbBT1CV2l/7omuFC8tHR9ubnQ4pZgkf23RpKWYWhp6YQvsgrPpS1xnC2gaRnebL+fk8fINNIsb5euRf6s/xvZKwAJpM1J+Sv59XgU7xjPGV8Aw31k+Qv4BJGtHjf2Z7nASDNMmrocSOuZtT36hYY2sLCsVKhttoHVaia5IhYdhaUJfxi72DL2rmEEow1Hu/quVIPL1CFSgeTrIOip5Ne/iYVQbVE92iJS29veMGnsD/sXJoMrpfKerFG22hlMRjFy8Y6FgmAT/CmaJ3ZqfDTn/48ua/cINZY9DL/8X5kIh9zjeJYHIum8xSgNTQo8H7bGskJrd+R394d/MPc72VhY2cBuHWvping4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWNXZ2tTYjkvK0hqNEt4NFAwZ214dEFzN0xWd2lzSUxIWUp3Z040a3orNjRh?=
 =?utf-8?B?Z2p2MVg0aURvS1NyWmx3L2gxNi9NNGhZRnJlMklFTkZFRlBjRS9qWUN0bHFZ?=
 =?utf-8?B?QzQxa1lRT05pN0syS3p5bUhjelllc2dPVFQzZWhUcmpoMDRLQmR2ZEo5Yjlm?=
 =?utf-8?B?bHlERGZRYzQ3WG5BSDF1M09YOU55eVpaVHZ3Ym50TXc0ejRPQThuaWFPbzBy?=
 =?utf-8?B?anI1V01TT1cwL3YxNTdLYkJIbGxjYUxaQjlUTTVZMStyakwvYlQ3anJXbENH?=
 =?utf-8?B?MUdyMmpmaG43OW40SXBLNWhtaDE2dUpvZjA3WWdjSGtSbTF0UDlSUU9Md29k?=
 =?utf-8?B?cnhUeGMxNlpDRkZRbnQ5LzBBK1VtUGw1MTh3bWZpd3kzbnZRak42MFBaZm9B?=
 =?utf-8?B?cG1Mck1aUFBqR0UxRkE3T0trSDdOdHlndUN0RWVuRTJERngxdVNXcis1WitQ?=
 =?utf-8?B?ejM4L1dGVm52OTY5MW5BcUpmWlZUajlIZ0pFL1hrazNLSytVSzdmVnl0aTd0?=
 =?utf-8?B?dWpvK3Uvb09nR1Ara0phWFJlcGk1T0hpUmd4VVlCclJ1MTVGbi81SFhXZEtD?=
 =?utf-8?B?Q1F2K1QrVHgxQ1FaQmlnaElsOEZnTmxYd1c0eUcvM3hkSHpiTk5zMDZpcFFJ?=
 =?utf-8?B?UmZ0eGt6Zm00dFQzVlovQmtEc0cvdEoxWXNHb0lqaGorSFJ3OUtVYWw5R3V5?=
 =?utf-8?B?MlZNV1o2ajFFRFVkM0hhcTJQNHAvWHhxUVZCc29rZlJPbVVYREFCYTMwV2NO?=
 =?utf-8?B?cG1idlFhbWFXbVNJYzNtbkQrYklEemVXellMa00zNlBCK2ptcFk4aXhYVmQy?=
 =?utf-8?B?NHBkeisxZlZoOUo1UXg5azYxMkdQclE5MmU2SklaL0ptV0hxS2U5aWFGcXFR?=
 =?utf-8?B?WDZDUE82bXFPa0V6dktXajZNMXNvR2ZLSWF5ZzJjNENOYU16SGJGcUR0SktC?=
 =?utf-8?B?c3UvZStWR2NwTStRQk1UY0ozR2RiY0N0VDZsZUdmYjhXajliWi8vZ05oZUxh?=
 =?utf-8?B?d0tWZ3hyeS9vNFlOUVpSeVVHNWR4eEFNeHJELzRNYlhLY3hqWi9aaFZhNGhJ?=
 =?utf-8?B?OU1Xc1JTUitxakFqUEs5R1ErSmkycWliMVRxd3hxVHNKZGx5WWxsRVVXUHFs?=
 =?utf-8?B?S0thZFBPOWlmSnZVY09GMHg5eUFLcWlkcWVwdTM2R2M2UWFnTy8vMGxJODN5?=
 =?utf-8?B?ZTFIdDE1MU9PWE5abmdOdHU3NW5Mc1h0cVNPOUNmbndRd1lKQmFRMkViSVJw?=
 =?utf-8?B?Q2xyTWFmTVNUQUhlN09uSGFJbytRYXdNN3JvZFFrUjBPUVkyditWbGpGUUFD?=
 =?utf-8?B?ZUhITnN2TmpNNUxmb1A5SDJ4UjRDUkRNbDFRMlpJUUp5WUFQNHpNUm5YYU41?=
 =?utf-8?B?RnVTd1hIV3lRelN4TGJZTEwvOHNQMDYwaTVYU2ExYml3UlpCUzJ1WUNyS1k4?=
 =?utf-8?B?eFZiWk8yTXMwTVcwV0NLWWxsMEtCcFFGYlhwTzlQQk1ZUVhIeEtKQlpVY0RL?=
 =?utf-8?B?TW8wVUNFYzc2ZTVoUkpWdklwUitkZUFUeXVuYUFiUHZncUpybGZxSEVsL25R?=
 =?utf-8?B?OHNWSGowS0xma0lFcml2Ni9qc1pqeXlRQlNubXJhRXBRNEFaT3hkSFZ3b1BC?=
 =?utf-8?B?TGNTdjZNbFRycldwOGlGMmxKOUYwa2RMWXVXSUlzUDl4QytHTkgxWSswRktu?=
 =?utf-8?B?WVZGYnVKRHowNjdQem00eFYzZ2kxR3JjUkQyMXp2aElkSG90WnBsT0xQRnZS?=
 =?utf-8?B?VTMrZTFPbW1XNjQ0cFo1b0FRWW5tbGJBcUhreEdUeW84b25zamphbks4T2hS?=
 =?utf-8?B?b0J0VmE4Mzk1MWptR25HRm4yOHRBRUpaYzYzR3U3Y3A0TXRYUkhrRUQ5NzR6?=
 =?utf-8?B?TTVQUTluNzhkaE44R0RWdENkaXdiZ0VLSTB0WVBrMER6QVBsT09iY1ROd2xK?=
 =?utf-8?B?ZVVLZmZtYTJEVmVUeDZqNWVyR0ZLa0k4RlkxSnJOS0kvckhtNXMvUCtHT2ZR?=
 =?utf-8?B?ZkxibW45bkNHWE9EV1JUOGVzbUVBMzZTVk85UXFyR3U0TDBsdUU0OXliZ0RV?=
 =?utf-8?B?SGM1OWNPbGVUMVJkb2htS0xzbjRqVWJQNGJkbmUySUxHT1JMSFdId2Z6WXdF?=
 =?utf-8?B?NXhHZWhIeVBNVmtwSVBMR0Q1cDVsd1Bzc1ZubXJMRDFzb2lsUDRZeHFhVHFq?=
 =?utf-8?B?cmlrbnhvYUplYXBPZnFGemQ2dXlzTVlCSVcxNjdVMEo3UWYzbUhRUmRQQnp3?=
 =?utf-8?B?eHZVUElLMXQwMEhlZkFpa2xVRG4zK0xmYS9FMmpsTjdyNlV2aGpxMm5UVitt?=
 =?utf-8?B?b2FkdkdQdUFNUFYwTThtTFN4b0pUdTN1bEllMTJrdXFPZUZyem1zQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38859c5-5c89-4af9-def0-08de83ac8e8d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:37:08.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcqFzxCv6dKXHbYGK9lLIgy0MrtdYMWLA493iF6/kd2KUl4/NZbNvtqHuMdDe7fhLDXUZMDkD3T4zgxqqRtbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285

On 3/16/26 3:36 PM, Danilo Krummrich wrote:
> On Mon Mar 16, 2026 at 11:24 PM CET, John Hubbard wrote:
>> And if "someone" wants to fire up a new "nova" list, that uses vger
>> like the other kernel lists, I wouldn't complain. :)
> 
> I considered this already for other reasons, so let's just do it.
> 
> (We can't get a vger.kernel.org list anymore, but a lists.linux.dev one should
> be no problem.)
> 
> I can send a request for nova-gpu@lists.linux.dev later today.

Wonderful, thank you!

thanks,
-- 
John Hubbard


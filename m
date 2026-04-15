Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D81A01BE
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776220527; cv=fail; b=krgINXk7a/OIWdIazSRbpWYaXzq9e2kE1QvYYcAeGw9zF92AJoO32m+1sH6MbaEFJ85cn1AeQLH612aXHiRZvWS+58SjUMpp1+khJTLwUr4rCO32sQtQ6UxwqzgQQzwo4VinhutWJqQobKbo4YGIKBDPhdbCxncHK7awqOVB2OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776220527; c=relaxed/simple;
	bh=2JCKU5IvNOYf/L8/x0AbOmN6nBM5+v7ZFVGOBKDbdAM=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=mEzrER7gAPzlxYV3d7tZakhaMr3c394p1WxNZhljWHLLjSsfcG1my0H+yJAaQUrP2V4+9loDlE5wXlH3O7iyWruhGGKCZenHBCMuN/1uMHwPsN/l4kwz1tjgjtu/hxn99Mti2h37RWdMcCL3nESokvxE/Jbu2SxeP8LBlb+TxGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dV3AnSwB; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dV3AnSwB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGGSajngW2OwTNvBrTRcWeNlX1TMb4E/+mmCHisuOB1T8q8Vm7YgoiwugY1Z7j7XBt6v7m8+KDu5ukAKnHSRHXQfIZxz3qA4jc5bKqka50HcR6xgvoL8EQB7ijcS535JYWndHOa/u/NggB9sRo43ZQmRTIxKEUL6IHF62BP3vG3JDwqxA44Wf28RAvZILmLpbNqBh4fnwp3GXUSTnw2fydndusoPWPdHxOqbvix35ITvz2M5QUO4RU+QBa0Yb2pjyeABYO6TCBfrOD5ULs9DpFXqEur2ERmpcLyi7j0ktY9vxBsI8lWEWmxiRKq09db/abVhhNeYiNCpbdiVBR7cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGoipgT3nTd2Ym1A2slLFV/lXdFU2Sw/aQiwnl5ORZI=;
 b=Bzm8IXAxs2Yuc1OWp/RzvdWmzn0obYDa+PKe7sy861KY8MlijEvcvsYj2WpzMlB4eMPIFj4E7IGuN0FlKNujOMDA/y6QMPdGGZxpwXoJ/0ijqrxSNFpOuppwZucxCLWMdlLj/krR7d2ua+QgG+HI+Ake4FIPvW9BSVZw1w/ozv3xXPEqeDzaopsNABCjTOdfQwif8+jcfs+SDhma7Zmlkt9p/TxfeF2yEl2enFpsYboZG/cdyt1N82JO0H36scbizMtmWteb3Q57eWUsTax/fdI1O4jxZjM3Jv+DHbrk0l1jhAt1hy7bAL/YBNeNpSXqjr1Vl/MzRKUjFmN7aftUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGoipgT3nTd2Ym1A2slLFV/lXdFU2Sw/aQiwnl5ORZI=;
 b=dV3AnSwBZhP/TqHzK1sgQmjarQXnZCN4S0zSJ0jFvswlt5IFa4BWxpNb3vE+AgazzluWQ138yN2ROc/UkpAm9zaTiiOZFOhjVh5EtJmMP1kCSnKfziCjvN2BjJELFgAvz+GWKVZJ1EVFofpJJm0iJYgVsz/o4voxktTr34Cw02BWzyzvx/NqtdPvdkYAtZ2Drf/esyeMVPlEPqFc+wu+snZSGdP4A8g5/wKDvFHs+FwDov7oA3YkNyaUnSwtA57c22g9SrlwQqngS+kCYq+OiB/97dY208xJUYrBbP+/uBgwhZ6ohNaQpD3DwCTmXMTaRbQ8h0VattVVCwn9tOBlig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS2PR12MB9709.namprd12.prod.outlook.com (2603:10b6:8:276::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 02:35:23 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 02:35:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 11:35:18 +0900
Message-Id: <DHTDMHKCNIJU.32Q1PJC2O34QV@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually
 exists
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-4-ttabi@nvidia.com>
 <DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com>
 <befb74f0523b01622fef9f18691b97481c5875f4.camel@nvidia.com>
 <15e06581b295691731145b55ecc337ea2ed8dcba.camel@nvidia.com>
 <838f5d39768881b05fa83c20f2706faf2b043a43.camel@nvidia.com>
In-Reply-To: <838f5d39768881b05fa83c20f2706faf2b043a43.camel@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:4::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS2PR12MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: c68a7687-1491-445f-ae19-08de9a97a494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XzTmmAWOAHCK+W4jClD+fNAb3Su/FtmJ6OISaFoB04osWHjAHzi6e1+WugApJLyvDtVTt+/13LUG9GiZhKgOnyL1c0CMFcu5Kg6f8CWCy89gUbEGwoSWbiJLdSJP/GZ6awAYEy19TNLum8NjB0v85WKNGtUTXtr96ZbgAQO46FHNvk9zIim7r92vln8ZexRvSduLmdqfzv7PPWn68TzfgvtB5hi97u/atu0M2JOIv7zigyPjbspOOHWlN8IFe4x9wjik9KL2CQw0L1wQOmC14fkwdELwkE+7EShARDCxjlUp9ezTimWvRUPMfnSvV+6rBFyGT24Xox58XXZCRnIp4dy3rN1U6MYikSWomHfdV9vZ1G7AGCtOH2Zh+p6Q7s/mMHDbRLgTwLMr4w3ZFf+wNjMDqCwT7JhDTKWZ9y0G+nYwa4YVYWM9M2NsqWs8eTNC4u0Du5s2S6Ep5ZqenRg/ZEaaQv/PhGUyZ7kdU64/N476zIlVhEsAJKM3pMPPPFvXN1qV4otpMl9D/etv4nfJcti9XVnnU4XhUKMPvEOVZYBRusTyc81d2z0wK0vtEdWNZOsCgUsV7ON8NHYB8AbpPqZl6g7ACcofOop7qLWNN00PShy2XrnFY0a/CpXVih9tlVth/2j2eG5O5bKh7EeQ2TfhBfzyBIaMcivnRYn3o6aXEaaZeGjwwj1CALsVhley7/BhHnj+hu4P5bCx3cFHLF/snuesREB/ZyETs4phtCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QStlejh2L0pWRy9iQzJMSGQ2M3VKa2psUk04Y0ZUWkZkbWFmSzdHa1h2WnpX?=
 =?utf-8?B?WEtVdXBmT0RjeWF5MHVrdWdHelg2emhqK3FXMHJWSDFBb2UxZmVFMkVDTXp1?=
 =?utf-8?B?VmhEcVFrSlF3cmdpcXlLaEswbmFLTUJZZlpLT1M0WHcyWjBRWVF0U1pYaWIv?=
 =?utf-8?B?ams2VXpSZFZ2d2dubEdHVm9STzFLcEhMbm1LOXBGYWp6Mm1KU1BxVnE4ekdr?=
 =?utf-8?B?N3NFaUxxK3MrTDQra2RHV05WSVYxdUdISU9GYXVnVVNmOTJNQ3BOQXdNTkhK?=
 =?utf-8?B?S1BKQldWRVFlNnJScDFqcWYxVmJ4bkg2NmdVU0V3RUI2ODR6M2NJVGlvQWtM?=
 =?utf-8?B?TGFiL1RJemtSSEVNYzcrODE0d1NFUDNuYXljU0ZxV1RsRUx3MUozcWd3b3dV?=
 =?utf-8?B?eFE3YUEvOUpyVFVMd0cyOG9BdldSVGd3dmNFOC9kemg5R3h6UGZoOERkQkc4?=
 =?utf-8?B?TDhVamlnb0RScDN3N0dOcHFmNmo0WkVsQ0tBRXhBSUFhbUNleFV2YXZYVENs?=
 =?utf-8?B?K3BGdmdoc0dVcGZiSmp5THFpc05kRXBSaHRqNXhiUWEzSzRVNzNwZWtTTUgx?=
 =?utf-8?B?MW54Zjl6dHJrcUZtaGZGR3EvS3JRNElrQnVwbDVWV081a2s2b201QWRnQmRN?=
 =?utf-8?B?blgxZFFKb3BoRXJJTmlTTTFjclFXSGNZbFhHV2FWWjVkaUpIZWdER3hpNEw2?=
 =?utf-8?B?RVJLTXc3U2R5YS9ieFRaKzZQUTZLUU81T1oxTHBGeE5iUDgvUFFEQWhNdkVx?=
 =?utf-8?B?Um5iMExUZUdwTTFKdWd4czZqQ1BhdjJnRlg0SnhDcnZxSlQ0bFkyRDg4dFgy?=
 =?utf-8?B?aWR1VXI3VlltMkoxc05uY2FTK3RodXllYXJBMmt5b2ozK1RqY1BCR3hlZ0ZR?=
 =?utf-8?B?eXlMQkl1V2pnZVRmYmg5eExRdTk4NlBGQlROL1o5cUJCU3psU0V0TVRiWnpB?=
 =?utf-8?B?RGN0c2QrWnY1cTUraFlBMExlL1VvdDNzQlNyRjkxR24wL09LVCtqM1Iwejc5?=
 =?utf-8?B?eHc3aStZYTEzM0lGWkRaZnJUT28xek9ldUpOa2dpSVQ5Z0ZpcDcyRlQ4WXFl?=
 =?utf-8?B?NXBrcWZleHhrS0JmMnhqSDdsOGJxNUlyQWdEcGdvcDdrYjdNQWR4eVh1eXF2?=
 =?utf-8?B?TDhqRHlOa1d4Vmw0TCt2clZ4UWM4akhXRjRZVGxjdGR1YUp2Y1llaUZKL3kx?=
 =?utf-8?B?NVJWLzhvQVE0aVlKV09vb2FkWDllTDJUdlR0NzRabEdoOS9iYkl1TzJtL1Z5?=
 =?utf-8?B?RXdPMUNMdXJSRDBKVHJlTUZ2enFQekU0eWtXZlZ1VVpSNDhiN0hxT0Ryc3dr?=
 =?utf-8?B?QTl3TFVOMThRM0xFVHcvU3BwOWNOSnFXR0ZJc0JaZDF4STZpUUxDc050QnlB?=
 =?utf-8?B?NjNrMU8wL3A0YVBReGR5a1Jka05ncGt4S1lZV3JGbHhzYXpXY0R1NFN5ZjhU?=
 =?utf-8?B?Y0N5ZkdFOUlnOHcxaW1KV2VFV0k0Q0ZUQ2hwZlFnVnkrcWpqa1pCTDFFdExa?=
 =?utf-8?B?Q3RIN2dFNjRtVjJ4eW1nNlgvTjRrbDlDa2pKeTc2VldpNURHeUpyRU1hZUlC?=
 =?utf-8?B?bDUwdTNPVUxVZFlTYXdqOSszQnNVZkhEQTVPckltQmdtcW9jajJXaUk4WTdJ?=
 =?utf-8?B?d0pTRjVkL0VWd2x0dWtaMmxRclI0MVpVUUFEL0RES1hrVXN1YXRuTUxPZG43?=
 =?utf-8?B?UWNVQyt0SjJHWEZaejQ3ZHczeWlKbmxSTGZoVmo5aSt2eEF6ZHJIZS9KU0xm?=
 =?utf-8?B?TVFESXludUp4V2FJeGlHMkU3OUl0aThnWDlVMzVvME42aWczaElITlM5bmJp?=
 =?utf-8?B?UXE2dkY3ajhRaXRkYkNPWld5ZWxJTFFTRk5LQWdoMGZGN0VqS3duSjNEUC93?=
 =?utf-8?B?ZDhyZXk2bWk5b21yV2RHYjBRdW5tNm52ZVJrZlFETk1sQ2dsWEt0allmSDJv?=
 =?utf-8?B?a2NGZkVRQzFKT0ptNVVibWVadkRpR3k5bG5FK0g2U2pKMnN1V1NYUnVhbERt?=
 =?utf-8?B?amZTU3YybFY3RjdNcEMzcGlaeXlWN3NtQ1EvRWE3ZDJ5R1l3bytiZ2pqem92?=
 =?utf-8?B?bXVlMFpYK1p1U3VoaERVdWpMTU44aGthd2FVcmFuNlFGWlBrNFZXTlk1SW9u?=
 =?utf-8?B?b2U4WVZkSDZJbXNmMkp3WVBVai9vRXdrYURqU0h3dnlKSUt0ME53WGNaMFo0?=
 =?utf-8?B?dHNGZTRtNlJUMmdkdE9MUGpzU0hoT0t2Nkw4akUxWUR4ZldqNmJPQ3pNUHMz?=
 =?utf-8?B?d1lyeldQUVpYaFczM2VBalN6cU5yTW90KzYxWkdXM2VUT0xwSUN4ZksxczJa?=
 =?utf-8?B?cUhxaFRiZS8vLzJWTzgwZE16RFRIL2VBYlZlUjlaVGc4OTRNYTZWYmFXbE1V?=
 =?utf-8?Q?0qNtfNNIhKj2pwmrWl07hgniZih/tJAsfeHDZZkbJOiwV?=
X-MS-Exchange-AntiSpam-MessageData-1: ACw+QqkrgWfdBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68a7687-1491-445f-ae19-08de9a97a494
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 02:35:22.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/SMb7fpU3d32M/S60Ud9lQ2vmcz5oL0IuNnioLFHt5xtibo/qYf0LLc8rbHtOn4XbH2ZqbSdvOfC91EUSV92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9709

On Wed Apr 15, 2026 at 3:10 AM JST, Timur Tabi wrote:
> On Mon, 2026-04-13 at 23:48 +0000, Timur Tabi wrote:
>> > > If FRTS is optional, WDYT about making fb_layout.frts an Option<FbRa=
nge>
>> > > and having the frts_size hal method return Option<NonZeroUsize> for
>> > > example? I think it will make it clearer in other locations that use
>> > > FRTS that it possibly might not exist.
>> >=20
>> > Yeah, I like that.
>>=20
>> Actually, using Option<FbRange> won't work.=C2=A0 The problem is that ev=
en if frtsSize is 0, frtsStart
>> (aka frtsOffset) must still be a non-zero number, which means we still n=
eed to keep the FbRange,
>> but
>> it would need to be FbRange<frtsStart..frtsStart>.
>>=20
>> So I can update the HAL, but not the FbRange code.
>
> So after working on this a bit, I don't think it's actually going to impr=
ove things.  The problem is
> that even though I saw that "the FRTS region doesn't exist", it kinda doe=
s, it's just zero size.=20
> That's because GSP-RM actually cares (and uses) frtsStart (RM calls it fr=
tsOffset) even if frtsSize
> is zero.  So we need to keep the FbRange no matter what.  Changing frts_s=
ize() to return an
> Option<NonZeroUsize> results in this code:
>
>             let frts_size =3D hal.frts_size().map_or(0, |n| n.get());
>
> We all know what's actually going on internally, but this line just obfus=
cates it.
>
> I will reword the commit messages to say that the window is zero size rat=
her than being non-
> existent.

That seems fair enough, thank you for trying it out.

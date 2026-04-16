Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88221DED5C
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 01:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776303186; cv=fail; b=bTsl7goM8ZHyI01wlaCcvj4BPQFdUdVu5tSgVtOaFzk4ErEY/F/BedNMq3sifQGCQh+X6HYgo41lNRF63oNzUMnG4fnjvA0i2n5IQZF0U5OkxO0wRvFhHtLwf1WPuUFZRtZ/orkA0QjYEllE6O66WM7ehofx85/LqDYNn97HM68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776303186; c=relaxed/simple;
	bh=l/gzM78rS7lUzjd4lXI4PEoIbXfPJQ9ouFTPbB4E+8g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U5cZF3bXRk1CZy6k9CtKQ8RaWqGGqv7rm31Ez9uGO8R/2v2ZY6QFh8jyvEH8QyrE5El9eUdMBP9Mh33dZvwFdvmWWyjyhG4UhH7MPipLfHa0NFgx4yHMzOvz+ksRsZayxs5uzQFmNgONcJRNN2/GPUscpRMHmiYr2LIk7EfD58k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jMH/JN8u; arc=fail smtp.client-ip=52.101.62.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jMH/JN8u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bmgdko3bxj9s0GSRmDScVyrkcX4Di3iKdjnzEf0j/uLJVY0q1G0XnzexR9cFLS0oiq/aDSfL3X+qucxlkztYbVqn+fHj5syKOs8xGnfPZ/2DkGUmtIAPtSo/3H4mkCul5SdUYPoUqldDKH06V32Jiur0pzfMCZqTm1v+DP0AGnxn9Z5y+f3Oko6awNr85DU0pGwaHhjlUiaA3Lfo7I7WxfVoWg4kl4XWVkA3tRm7rUukR9pb1hpw+SAYmd2Kqd0BqKwRKIPQOkDza69VS1FN5kDp4G3+qbW+RrcOU9niq3Yha8Ip5VFZYQuwVImITLWc1hEEyNNd5ZqwmR7T3V9THg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRWRT8wjDkCZ/IIzki27nBGo88sFjXPPf2MCYefCxcs=;
 b=fJTkdMVnKCnrxZ2UREqs1eKiQNYPaiuaMdHvt6lPZ/Sp31i0d51+ouBHNex4pP7FsBhc6CgWUqMJnxr46q87H9nC0QDHFFM4GN3uAn8vYk800nCjVnl+Kudp8eOZquspZdnVXR5a9NqeQFlpNfuCOKG6txcJsXuvn6JaqgPMylw2tOIuRB7VEiMfCgOkneY8UROxywvGIy9QUD81FBoqlrC5dqzQ9nQmjz0JKBmnFzCmRzN4SgSrVyW8wvtj8/zmdxVwSU9oZc2O/p58yRMfdvgbgLslGezQZCLBn4xvi16iIYp6PfNRX9t9/GralhM2ejUDZuF7u0hxyTCE9w7nFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRWRT8wjDkCZ/IIzki27nBGo88sFjXPPf2MCYefCxcs=;
 b=jMH/JN8u1sEXE+ZncsQBOKnFnSey9mbLAtlNAcTD/pfsLKdjrR8s4lwnK0NxEPz5yXsM8aTXjMMajoBWS4sOp+EHPlDdaoy3Aqbz8aQie+yHFDkMFuJn+SmEnb2Z6+OcZFn0O7jcGHLEQ1FImER0F8SDEpb3JGXq1Fm2yRGiQ5IQtijhDtE96/r/19BnrGTgXP35mdFrJ5d8WZffnZRIB0uL4qor3bKjZ1Fn19Cu8qHMUbIaCrXrcicyIs/EZ8ghNJG+YQQT5LUmK2EtEQ9sGoEjj6BRAHabis/AbXx4vG55QcJu6LKIKLFEPKVONz0lFAxIQrSsGEOhTic9zpeJ5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Thu, 16 Apr 2026 01:33:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 01:33:01 +0000
Message-ID: <279e47ee-ba52-4793-be86-ef24520c235e@nvidia.com>
Date: Wed, 15 Apr 2026 18:32:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260416002619.900779-1-ttabi@nvidia.com>
 <20260416002619.900779-6-ttabi@nvidia.com>
 <9dccf93a-8eab-40dd-b865-368e818ce105@nvidia.com>
 <7a84c308eac2534123534977260c383272dfabae.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7a84c308eac2534123534977260c383272dfabae.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 67179b68-74ef-4c0a-2cbb-08de9b581905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9+y70BNKGte78+wXTVLPyuRvIAMHu7a/BGj6fTATJ2LWj92FMWgEL0o5VcP0iKdwJnpxgOmgbHDhDx7TRjQBqqtqW/alQEkQn1m9V9/cAAMJ7t0PoBOFQ5ZvX461Wok51RU1pn38h7L+gyUtpJ+E7npRgGw+VF2bcv1P+bjtFsWR9615NiAMKW/vKAK1Yh0l1PyFawzI12+L16TuR4RJVaUXgE0ThlZmam0yVDWows3AWqFH/WVGAGZOUnp/jI2ECjJDGrN2f9sEhsH0M44XUbqoXKjb7cpwVGExkYRDWPbxVa3OwSbsmB+jRZDcAqAmM80Y+dQ/xmxz77UD2dt70t91amLA9Bd1nvmlpoDggVO4BK/sPnXamtm/7WCbaEbfpwwC+TNiOrfA3zHnzuoWXSxpFDpWgRQDeDkKGWsR0+opuEfRFptta0HrDYu2wUbKbwl1Wts62z5cMKeogoTg55m/q+0qMKpUE8S38f1fvZmHeN+39AQcoCg4xQIIoCMKPErRNMwuKsfNsv/156jPcUmQpYx4XHSnPAr+MWg3wfqLd1Sh5jUdJLcSiW9JYCX+KE4rwWTpvsXsk6W1yxYglPnQiVCfM3SVeqP3n5E1hotmwLh07giP2vyyVyKvGxZyM5/F80qUuvG/GiDPgBBTbnHXbQ3YpgjuMR3zo8n4VgRVGL5M9R/G21atU5BAAzFbrF/vxa/c9yNf3KCcFDYBWfekeSZThU0FF5ORMQU1mUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aThpNVZZWGtMdjRuckRFcU9XSVB4cXozckpsd0ZQMnhTV2JTU2hEUlpPaWsx?=
 =?utf-8?B?TU90K1VmWnYvNTlFU2tsVi9ER0x1MG54WjlXQ0IvZEVSb1hXVWtiMG5JcVlt?=
 =?utf-8?B?aFhEaSs4eUxWQ3hMRW93Njhvd3FYTHBKT0F4dy9xTUxCUk9IQXN6bC9vcHc0?=
 =?utf-8?B?MVY4RWhQelpsY0ZqSzBVYmJ5MllaeTkxWVF2SWIwWEtoTzh3dXI4UHN2aTdw?=
 =?utf-8?B?cGpOOW5SZnI0MzBDa3lrVnFoRnV4UE95aHdwQzB5cXBqR0FweURjR3E4VzdY?=
 =?utf-8?B?NlIyT2xMcjdKZ0R5TzBGRTM3NjhDUE1oRDVBbkxUeGNFMkNUS1JwWUp2c2g2?=
 =?utf-8?B?V3pjUFUrZzB6V0YwWkVPOG1KZkZuQS9KUEg0ZFNOKzk3TkExWit0UlZrY2k0?=
 =?utf-8?B?eFhPVTJlOTU1MERaczJxT0Q3ZUg4MXlZeDVrMEI4eURNcHVPSU84YkVBeHpT?=
 =?utf-8?B?MEJjYlJKdHFpRE0rWHFEUjJVcy9XWkZwM0htVFpkaC9PajJMTHUzaDNqSFAr?=
 =?utf-8?B?dEZFRmxCUEFnbFFLNlpmRXM2RHhwM2ZuYWw0bnhaWDhYWVRZa29lM0RUNGtv?=
 =?utf-8?B?QzJuZy93eFhVbDZpSTBjMjIvY3NKcE56RFJPQ3BCb2oyTVNHNVNIYmhKWC9N?=
 =?utf-8?B?VUtrbGdwbEJwNEpLR01iZys0d1ByUXJuZWVjQ1c3djFUMjA1czljOXVpZnJo?=
 =?utf-8?B?SjBiWXM3YjhkRmlDaTNZWnNLcitsU3JnVlNmYkRUdE96ZjlkMmtHckFYSmt0?=
 =?utf-8?B?NU1oZjc0cHJaVWdxUWtLQzFIekhqMHFzSUo4VmRzOXE3c3l4WG51UGlVaytn?=
 =?utf-8?B?V2xvOVNZYi9SMjVKNXJTSFJrMGNBUVFRc3dVNGtObTRlVERkRlhQZFVNNnpL?=
 =?utf-8?B?UGNDTVM0RTY3T3JpWGRHeU42dzhLc0cwTk1tVnpuempNUElySzBQZmtZMFNN?=
 =?utf-8?B?VnJoNlBqZyt5cnRReTdrM3N3OTZsYTRGZFRBbWZjSkVEKy9iak9CblVVVGlU?=
 =?utf-8?B?ZFRYNjBBK1dHQkhWZXIvbXRrNU0vcVFEYVJHZmF5YjNCVkhMVVIxOXp6ZjFl?=
 =?utf-8?B?M2JFNnA4TldRRGxnWDEwcWVkdGZVV3dNci9pU0RzUVhCSGUxUnZFa285OE5w?=
 =?utf-8?B?ZDZhcExrbDRmaFhJcXRXbTF0Q2JxYmVqZzlIeFRnN0EyTEpyVlJnQSt1amxO?=
 =?utf-8?B?aGwvZ0MyZTJiRkt1TDVEVFNQenhEcVo4RXBMZ2xWbXdoRHU1WWVSNWFEaW5s?=
 =?utf-8?B?T1ppcGU1SDlxRkJ1c0lObzVRV1VrNnFiZ2VFVEcwSm9zdmcrdGk0RDJBT0J0?=
 =?utf-8?B?MWFkRnZ0ZUhna0JMRk1OMjNYNCttUFdtbEVXSHRhVm9ySkRrUk5HRzRrT05U?=
 =?utf-8?B?VFpsS0c1QU9pcmdjaWExZHh4enN6RU96ZThOK3BCeDg3Q1pKWTRaUUEvQWZ6?=
 =?utf-8?B?YVZJQzZ1aFBzU21IUTdPWTdkQ2t5azN0V2d6K1lUMHkza0llejRXd3NQZkdq?=
 =?utf-8?B?VVhWazdRdzlYUGV4OXV5WFB0WFMvMUVhNlhCWU9sV2E1amtnTGN3ZE9maVlZ?=
 =?utf-8?B?cFlRU2laekxRTmh6eW1teXhSczNMbVAwbm5oSE5mekNVYmhjSXY1bjB2RG5I?=
 =?utf-8?B?dDhubjVCSmI4bHkxWFBOSTNRb1pNRjJib2JpdXRMVUN1NVRJaXJTaDNsdkh3?=
 =?utf-8?B?T0piSEZMbFkvTW56cXFoVzFMWWw4dEI2TDFuSExTelRob013Qnh1cU9lYnhN?=
 =?utf-8?B?citIeXpWUlc0VGxyWUtIRzRNMW1TUExvTFhIWmo0RTU0QU9GU3pwYlI1VFFI?=
 =?utf-8?B?Zm9TSjhGZWlLZ01yMlo1YVVXWEQySnV2SUlVcVhHcGs5Q3prTWNhdlRoMmor?=
 =?utf-8?B?MnVnUDM0eStkbVVvLzVtUFpwZzhTb3RRSVRCWm15WHZqSTBQOTN1dllDaDhK?=
 =?utf-8?B?UER2T0pxMWVyaHZQMmFmU1IyeC9LLzdNMTFhSWg0dlhvL0lxWlNQdTJJaUR0?=
 =?utf-8?B?ZzNpWEZyc0ltSTJoc1lCRndtOU11MUEyL3JuRVJJN2VRclNpM3FFd2p1MDZX?=
 =?utf-8?B?YzRUOUc0SWVjRUZ1bGM5MUlHdnJ2OEhyNmU4MHRTT1FmbkNNWU1CMGFyRktJ?=
 =?utf-8?B?QmlnM3FuZVJVOU92OEJVV0hwRWV0OHBETUhuYmRqVi8xMnBadkZRUDFhTmRy?=
 =?utf-8?B?amQvU0RLOGxTZW92Y21xNDFrV3FIeklGeWV5Q0NWZUgwODFpVGxXd0Y0UWJJ?=
 =?utf-8?B?dEc4MHdqS2IzU3h0OXdjbzVQSHMxcXN0dTN3MXRQbDdqMlJISVQ5RjFoMGdl?=
 =?utf-8?B?N0svNDhNRjN6MGhHSkg1SGR0YmFnalEyNnpUSnpMaU1MTmd3Zk81UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67179b68-74ef-4c0a-2cbb-08de9b581905
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 01:33:01.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpCk2/7Rbi8MsBlWR0G1Rjm6sFQNQKqZ7VTUv4fcxnhQE0dOKe6pmAlCd+EHRxEu8pEFjmmJtOKzQWkg/Lze4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185

On 4/15/26 6:24 PM, Timur Tabi wrote:
> On Wed, 2026-04-15 at 18:21 -0700, John Hubbard wrote:
>> On 4/15/26 5:26 PM, Timur Tabi wrote:
>> ...
>>> +fn current_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> {
>>> +    let signature = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED0).signature();
>>> +
>>> +    if signature == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
>>> +        let fixed1 = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED1);
>>> +
>>> +        match fixed1.version() {
>>> +            // Note: We do not actually expect to see v1 or v2 on these GPUs
>>
>> Then why even match for it? No need to "support" HW or FW that doesn't,
>> and won't ever exist, right?
> 
> As I tried to explain last time, I'm not 100% sure that we'll never see it.  It's just a
> footnote, based on my examination of various documents on the IFR.  

I missed that, sorry. Let's either delete the comment, or else water
it down to...well, I don't know what. Probably best to simply delete 
it, otherwise someone will want to delete the code.

Either you think that there is *some* chance that this code is not
perma-dead, or you don't. And it sounds like the latter.

thanks,
-- 
John Hubbard


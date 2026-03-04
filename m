Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5D35D615;
	Wed,  4 Mar 2026 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625338; cv=fail; b=IqfcWkHwBFvOmMAsjJDr8iZfLIiSrcgoGWmD5HRItCKV8eVlp+zEjHuuiFhlxXjJyDEad1elGikyv0IyVL6l/JdUf1lVn06ZgiQuHx/ABQgVxV159jK+pT2RJFzlprVDyMwGb0k/ZQBJF2mnBSgqJ7cnsGn6gEM6HiYs5fb6te4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625338; c=relaxed/simple;
	bh=vyCAs6u4m48L7Cz/TxueooQs0xg6HZc/wxtIwdRuyy8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kEhrSC+2r9SNQXd3WqClk4UsfnFFdDwbrscThevDbqT7xpa326QQ/tUZssdYee4tEDx05o0bJbT3cwzDihDJ+KJimAP7bNw0DaN7oDrp897+S4dr4ORiVv8XQWLIHUYSmrsZmIBOG553KXEKOpaUQ1j1tB6yEac1AkkiFpr7Gbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y3b6kASj; arc=fail smtp.client-ip=52.101.85.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y3b6kASj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTs4CB8RdHB0hAweBOc8t4HS0JYFjCoMpi7u+X+SVuwb0Mcw/KHxb83Sx7voigbo2exXzRk0kqQRmOn4mxdTab2OOnkX9UoEqHISDnDR3J9FRf2lAD/xzyJNSYidj9PzCxuL9uhkPMz4wAFfc8PleFnw5kT3pHmLGfjwgOucw7+lGf+Ieag+g5ObDTwdjokhg6ntKpJKKNuknduopzcKsfPZBZn4mwPOtVOrnXh+OXvvYJCn1XLBYrSyLjk9gM+5yQzr0w0qBthCUac+pwXJP4W2wuGz/GIVALh3Yh+YBbF/r4Kz8q0qatlTYlFLARKaFIFNPGBCeg/inm/TSz2+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bTfwG36xwoPMi6ohMFX9mCwXy9BjgVqYgPdylt23BQ=;
 b=O54FZX56XxKb893TuGCgyoaoR4anuoRmnOEXbaX322FLKthUZpC7dXcfIzEP+k0AM3h4rtuXua7cbtuXxKYTkYnUnlJIXwrWM5ypDIl1O8riBY2Sq4ivlP0qqKrce7cjdc3VN85HQqvjaxBf/73nOLV0JxEKZD+raSS0a/MdHrwr3VB9RoeQdHyaHFuQNRL0AlMryT1uJA4qO22iYsmIJ6iOYCBTpCF1rlV0LEKxtwJaniEU8UEsjlIl8AvODNq+DvpOZa1DCZZQpLdd0nlRKCEuaBulsxWJOth/Ax8FL0Gi6PTQ/FhgwBGTh8WaZzKdpN0D8frL29ojB2hSuVpKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bTfwG36xwoPMi6ohMFX9mCwXy9BjgVqYgPdylt23BQ=;
 b=Y3b6kASjk/N+i0vdR53tzf7+AO/k4TONU/mtJ7SPgRMI8LA3XrthJcS9qQ+RlFQK3jQPRsAuUfJxuiqE0WnuqS/iQCbJAaCOnAL4aCKxmbGKnSwHbHXJj/Y8qVWfpWL3ejc6cMGHACqnlMfGbKCC8WbgSjI7nypIugKFVfJrwTAQPqo1vfeYqpK5FH6OmDmeKcTrF9dC0HljsjDkN6C/XakBCZtIf8SArkSgqQsgDe/obpUHpaERKK6dvs9jazhdFLoFT5If6VcjW8D01ZtCASCnbTh7h7FQReahQR+hRLphgzUmUo9VdVHuFJHeCgV/Q1osXL70WxeLjL91rNY1MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5670.namprd12.prod.outlook.com (2603:10b6:806:239::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:55:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:55:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:55:29 +0900
Message-Id: <DGTZ8IL619SL.2D7OPGYUQS8NF@nvidia.com>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 1/5] gpu: nova-core: gsp: fix stale doc comments on
 command queue methods
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-1-a6314b708850@nvidia.com>
 <DGTYL9RNLI6W.2EDM61M64V7PK@garyguo.net>
In-Reply-To: <DGTYL9RNLI6W.2EDM61M64V7PK@garyguo.net>
X-ClientProxiedBy: TYXPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:403:a::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: b397f6db-b2c7-4335-4239-08de79e4f0d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	kXLEpnx+4O+rs8/qB1YmzZjvhkLkxU/w5kXIvvj7327xAxZp5Urrd15JWlGBowucS4qi0b+xgrIMV2R1O6BIm4Re4ycecRU096lYSCey+yeJJHISeiYiei8XLnwgZe9o49xH6+AFMBepB6DFDHKP33x0DdsOQSMkq1x3jxcNdapSIdckXNkYq49AZPIt3jKIrmPG9HoXktL3fZylpzO1w7Gj/nXQBpxYDFMRcdXspkX+3toM9FtM0NwrYJh/Xo9y1ePVVkFv5CwN5B7C5aominr5jnR322RL5MEGNd3lGnUccPKQiJgunGCvNhs04dp9ogO8F1KCWq7VJ4H+sg85wga9ZYQWXM3RuVCX6RTTMQoiqBO+e8fA1lL+1SczBIdccYoiYOeJFO4tHYh/bkVFVNTLd4w5L5eT+nyRfoPqFSa0bcOtmX6x2XQ2xn+xX8jpHH8qLYrsg1oL7cv+/W7Hmy9ANDgep0c5phV8P3rvxtdIwqxKkj5+XnQTbhEWVd8V6PtNVPNQuZywjetkuqETQfMiMmUzXvojqMzQZqIntls2ivV3vDodk/7I1MbskKHzqHLxdUs34mdJyDuCB0PWx4wf8btY2yJxufLwfNmUK61Nwb4an2gEfxADM94WaXX52RJf0h36MKfD5cGA125YS1mhdImfh4GCtmPOsoBnyV0laLzCtYKrx7YTlOJzBCdfRl/Ze3jXTMWnNZrc9Z7tSt4u8MY6GJ3qZnTLBQ/JBnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW9lOGdudmtQZURnajMwWjdjZnVxMzhBVGJ5RmFjNnlQajZMdFBrbnVjbUQv?=
 =?utf-8?B?d1A3aC9tMG03NnlXTmNkSms2VVA4U3lQYUU5cDFKNzlBRktGdFlEZEF0WlhX?=
 =?utf-8?B?NUpuWkt6dG9nT0JEdlBHRmplN0lrTWVRbEVGSVZIbW9HRk91UTB2RHpSWmV3?=
 =?utf-8?B?dnV4Uk1ERHpQdm9ZNUtFZGFjQVpiV080cVcvV3NkMXhSa0pCekd0Y0tNa2tn?=
 =?utf-8?B?cUFEbkNsd2dEdnI0U1h1dllCZWxmZDdTazNuNGUwT1dlRUdrZUFFQjVaV0xS?=
 =?utf-8?B?bVZINmlsTnRSc0ZWamE2VVRxT0YzSituZHdRNFhDYi80NDZtei9Mak91dm9O?=
 =?utf-8?B?TXpTNXJlTzVRWiswY0M5K2krTklkMUZKbzlUTDhVUU04V05YUjlPdDgzNmJr?=
 =?utf-8?B?NFlOcjkrNllaV0hjVmxvQmhHMkF0WndaYXhSTXNab05vaGs2MjVhaXBGWVhz?=
 =?utf-8?B?eSt6eE1UZ0hNaVVVcTk2d0ZINkdhcUNCN1M3N081TXg0WUtaTXBORmhEOVhs?=
 =?utf-8?B?cDUvVUlwK3pkcHg0dUpWUnhpVzQzT0ZXVnBlMEFWNHVkZlNWc25EWlRySkV6?=
 =?utf-8?B?QzhLQ1ZML0xxdm1aUWVCRE1UMkUrK0FkSjU5QmtWbTRwaEx4M0l0VlFucURy?=
 =?utf-8?B?NGdCLzEzM3cvTUlGQ0cyTzI0NzdTSnFqL3ZHQlhWRFVpZGxWTVNFcHYxMmdP?=
 =?utf-8?B?c3NaRGNLR0ViM3dNbU5tN3lsaTZhcEl0R21SS01oRXV6cFlDMjJZVFR1SGVn?=
 =?utf-8?B?aUJ4UWRKTlRTSFY2VGEyYXhjRGVYYjZBckhac1NEK2lmUExLZHRjQmoyQmxr?=
 =?utf-8?B?L2t1NWoyTE1jUW1rNytudS96eW1CTDYxQkR5ZGZmc1A2a3lZb0N2d1lCV0Mr?=
 =?utf-8?B?cDBwZkVESmwrUzBFTDlMemt3d2FablU1dmF0ZE55cDJEdzhJY25vZVhwOXVu?=
 =?utf-8?B?WnJtUy9aUTNaYU1Cc2ttb3pYb3VCTGlNbXZUTXp0Wkhib3BkYmlwVkREeXc1?=
 =?utf-8?B?VGF6cllOc0xnRXQwc29uZ1pmVWMrdWRKYzROLzJQWHEweXltY2xpWXduWHpw?=
 =?utf-8?B?Nmx4WVY5RFJxbTJEODFFbXJBdFNVRG9EY1hoUjVORWtFM2NCMzlZNDhsWk5k?=
 =?utf-8?B?aUU0OHVXck83cm9LU0IyWllDeHVUY1p0NUpING9jRWoveFVmNDJFbTBPM2F3?=
 =?utf-8?B?bjdkbVA2UTNtRFA0Z0lyQWpGSEoxS0JUVzhQL1NHRzc0T1hNYll1RFdGMTVH?=
 =?utf-8?B?aUxuKzVQU2xGa1ZYZi9lRjQvNUtjTlNvMVhoYzRVZmhxbDFHK3ZIaitwdWhG?=
 =?utf-8?B?VU9td1dSNTZkNHhHNEhpRXJXcmhDVFdQN3hJNnlSbnoxY1BpV3cyRVhPVzN4?=
 =?utf-8?B?QmJBbTFKRnlsbk1yNGZvKzJPdDlOaU9SbDhwR1NpM012VU5ZYmtpYTgxdHkz?=
 =?utf-8?B?R1d6NWd6SlJxcXZaUVRtWEIyMUsyUllRWEFLOXZicyt3SGlaMU51cld2alNw?=
 =?utf-8?B?MHZHaW9kR04zZjdDSm8yVmJ3VUMvQTB0bnJqVjJrRGFVMVBuemxIakJsdnkz?=
 =?utf-8?B?Uzh1WUxTY0RnaU1saStVdkNSaSsxMFY5ZVY5YjNYT1FWeUl4Ymk0VHJYeVNk?=
 =?utf-8?B?TjRQb2JwTmlEUXV2UGI2eUlmYnhlU0ZrNFQydmpkcDVZNEhRZFYrdzhZVFJQ?=
 =?utf-8?B?UitSZ3FUb25lMkxOaFA3d21VSGJVMlJZcUJ6SkVTVmZ5L3JYblNQL01WMEcy?=
 =?utf-8?B?YnRPM0lDaEtaRnRsWHMrcWZELzM1bHlOVnFIL21TaVNMTFdSa2FCN25iSktJ?=
 =?utf-8?B?S21sV3FSdVo1N1dvQXhqTEwyWUhjOFcvK1orVG9zRkZOZDhYMFhKTWJtbGcr?=
 =?utf-8?B?NFY3NGxOSmQwWHJXRk9GenY1L1hybnovSDgyTEdtR21RK3h6R3JDazhQeVM5?=
 =?utf-8?B?NlBvenRtZUYybWFCbElsYUx5Zmx2WDZ3RkJFc2lHYThHZzVWSktILy90by92?=
 =?utf-8?B?WGVTMmxJeTcrUHdRbVgwV3pITUFwT3lCbmN1T3h2b25BYzFUUENWdDcvMXl1?=
 =?utf-8?B?UXp5UHd2MkFKKzVpQmJCUXdtRzN2QUVZMTFXdlBOcXZhZUJLSTlxZXhIMzhH?=
 =?utf-8?B?cFhZbERIc0RJY0NoWmlkNlhvZDJHYnRDRzVLUDYyd2RvN0FzQmZxUUt1SDgr?=
 =?utf-8?B?RUZBQlA2OEZTR1BCOXBicWpNOGJ3WTdUbENtMXdGZUkvMDBNdFV3b3lFcklm?=
 =?utf-8?B?ZkpUSHVJeFA1dGx0d0p4NXhxRnRwR0w1RDZxbCtYT0had1FTSjZqQ3lmYkZo?=
 =?utf-8?B?dDBoTmFYdVpXSE9INWNGamduYlRMRnV3SjNjblBROUNxeWJteGJyMDhlQkdT?=
 =?utf-8?Q?FSElaXAYBpTwzRP8bmroMST+y6Jrkj/kR0irBczY6CCX8?=
X-MS-Exchange-AntiSpam-MessageData-1: z6tHbXsBD2SvCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b397f6db-b2c7-4335-4239-08de79e4f0d0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:55:33.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgkgNrUdRf81admpF3LgFnjZDJWahAy3nysoxTgJlpMXDro2rNt1155nRSqolXdtmeI0kVy0z3L0ikLSYvCERw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5670

On Wed Mar 4, 2026 at 8:25 PM JST, Gary Guo wrote:
> On Wed Mar 4, 2026 at 2:46 AM GMT, Eliot Courtney wrote:
>> Fix some inaccuracies / old doc comments.
>>
>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 492e9489e808..4829830b6921 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -531,6 +531,7 @@ fn notify_gsp(bar: &Bar0) {
>>      ///
>>      /// # Errors
>>      ///
>> +    /// - `EMSGSIZE` if the command exceeds the maximum queue element s=
ize.
>>      /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>>      /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>
> What's the benefit of enumerating all the error codes like this? Unless a=
ll the
> mentioned error code here is supposed to be handled, then it doesn't gain=
 much
> for them to be mentioned, no?
>
> For the errors that do need special handling, we probably want to use enu=
ms to
> force their handling.

Agreed about using enums, that's a change we will want to do driver-wide
at some point. Preferably once we have an equivalent of `thiserror` to
make the transition easier.

Meanwhile I think it is expected to document the returned error codes, as
(1) they provide an easy way to lookup the reason for runtime errors instea=
d of
grepping the code, and (2) they can eventually be converted into the
doccomments of the enum error types once we switch to them.

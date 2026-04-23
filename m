Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2373B961A
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 01:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776908960; cv=fail; b=FXAo5eVT2JLqM2UoRGTJgLXjysTdeeoOUssbDiyO6M0Uhq0hpnDtPDtr/N5S9F/f755gLVIX7Qz36epC9bhhvdZC+lsZY3Ywui4XxfLDpgwr0nvjvv+v+cyRkvKyHcTftaB/XQyg1sVZOxZP7VfkdWEAU7aqT6BKUizUPxr/H1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776908960; c=relaxed/simple;
	bh=L95+yvPfhNjA4018RsIjNinEylIRhh81SREgmMRjb98=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AdcymJN6jUzvLEvRUc3dpwxJhTTtgBGftg6guoU+aVeKPnm2x/bRvEfyVNgRb+iLggLizAf2GERqSsObfZs0jwgt9gaaaYiVgTwcIhZafyTGQclpT1TYjZR1a2phVBTJOnW9M/PT1j3TfYURx8go3tbJxkqURnKdLBBOPfW7GxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mCgxdEZd; arc=fail smtp.client-ip=40.107.200.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mCgxdEZd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgd1G4rOnTj7WwN3NkhLy95xNATbB8Ycw7C2ZjwpXZ7UAv2jA7+chF70Taxwz1FYyIIxH6bPBM+GxRcj1t99wJZiJIfvMdEVhZL62VYfJzEvFcByQAIEAdw/+c6XBOBWyB9LqgvcrvJvjAcQtWcLcbnyVr3c74Y+iz4jxdPlSkqkesdI5NM5JZPrl0nLOkvCU0bxIh0lD74tKA0+ujfC1O2ys+UtLVxricPyjzyXV9upNcSXYOr3IFFgIOMmwBXI6OYLzebX3kfeGx4qpi2ichg3+J/z4Se95KE3ESfgVSNvQ9BhRaZLoNxiTrcuMCO1D/boCmJlJxvsvUyNLRjk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L95+yvPfhNjA4018RsIjNinEylIRhh81SREgmMRjb98=;
 b=CHD+z4Ty1Rh8wcOWiPnFk6ySSS47YmKguqtodHYOEUhTHkza4eBh1CFS3CfRUd2j+ARcRMWPUkaFccCbpabaIcHwJzsPP5iz7GYfGTv75WGinTQIYoCNGfgCMAvU5Rq+J2WYauQg2C1eyLb/dXaQKDIodaZhp322KAGDqR5D4fmgmMCxpBuiV0SNAmDRUWK8YXJ/5aWj/zivw3t1bkG1DiRyoRTsbIyB5YHUiXmru1JfF6O3nIv6mMZXwSNRfUJzdp6NYxzDEjH7ii9Sp6H82kXRzICYKaiFrB+6a3+YpyyWBFkUdx9DLF2kwfLP1NC5UKcRZeScC50KzkCx+Wvtew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L95+yvPfhNjA4018RsIjNinEylIRhh81SREgmMRjb98=;
 b=mCgxdEZdSxFKvfYYP86TQ5ijxGCMBA2vhrcZiHMjwPV62HFcSdi0xU6iMgwWp1KTbRcUMcuiTx6rsUK/ykVaJQrl37pUOKcsk37wYEsGoTa6xuO5OS/52PkLnTUBHYfbU5Zw2iHngCksDvRlwT8WRdBzAr4v3Y79y0GPESsjGyYCGeFc7LtHh7zhTPihQYc6m1Mc80/VV+ZmCcK/YrigkcVZRXpNpU41bdmKxLQQPByvxOHUt9GNXv454FTct6ssEAb5PYy2/Q6zmU8OIDqkYNZhGIVLsHnknJ/QXmsMG/Z4Xj0u4bcFE7osnzg/so8Vj6suNlAlSR1xV62T7NHr5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6710.namprd12.prod.outlook.com (2603:10b6:a03:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 23 Apr
 2026 01:49:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 01:49:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 10:48:58 +0900
Message-Id: <DI05ND6E449C.3TZEG1R8O7N72@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: Maybe make Sashiko emails opt-in please?
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <lyude@redhat.com>
References: <2476c3b3f06bde0c376e70a3ca30e91f54b544fd.camel@redhat.com>
In-Reply-To: <2476c3b3f06bde0c376e70a3ca30e91f54b544fd.camel@redhat.com>
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: c50e7cec-c013-4901-fdd1-08dea0da7e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|3122999024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3258K0OlqG2V8KV4YRVccuFmvLF9jpHhkMf3BqtN2VOrlZaFz16uxqeD/mrK6i+/ia1jXcGWO8qWqhGP9KOXoFTynEXi6OZ1dmQiQ/5s2QhBMI0KviLrNaECpew71CG+jh6xwQsE30cxeUIwOou6Bk3nDYpeCLfsYSd7Oj72RpVVnSe5P+rEHc2HjpNFFNTCPVE3f6fG0nehrL5CMBTS3r5kwrGrBoWxFQxxJLkQhnciCIbfFTvJRViwnEaC5IqH+wrov6UivRkspZy+KWHTfSWNZ0Ih58SGZEjIK4zIu20p9OMbNeckfFgci147Y4HKBheiNORr3asMch137v3IxkwVp5iwXeXbyXNP3LfVuPIK4yEpQzi1a2zeCuE1ZwuylB2rVt0RrD/Akus/9iHa48F73ipNKASC5WvTekBchg2BaSRw2AD6x0OpE/EKsFS8dmo1GlGAoU9hGG0H+fmP6r8QuLk5BmxnyNUaRHIY92kf3iFU89qZOnT+sCBMaV/ZicOwNEbU3YL0MH3D0GCJ40OpRhL5orjTSY5TXU/xTAmHpcg7Gcxs+7uRan/qCMQk0TbkTuXonoMnHWfPA7ts57djr1bMuDVRPF7jxsjeQCSinj6ru44GoTh93/zAqBGU+a/3sPOw1i1bmuc8uX2M41baE9xPtdAwqx2N2DJ9MzZGaKJXJ0YzB1HiQ3zQzjmFDNNzwMx2om1f5P8QldHiNLVIsnZ6cxhCKx3siURcg+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(3122999024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1hKcVFpVmROcTZ2alZkeVE3R01sNExSOEJ5dEFodytjWGViTS9nUWtXNW1s?=
 =?utf-8?B?enF2NkxLdE9UKzBUcjZncnFUQUlZVzhRVnVLeXowRGlpRzhZOThhNkYvSXRz?=
 =?utf-8?B?MlNERlpZN1FZUlBwRWJXb29VOEhHVDh0TEl2UEhwNmF6RFd6czNaS2RSYmx6?=
 =?utf-8?B?TWpaak1SdXBTMnZaSGFRRU1udlRSa2s4azRxU0k5TGpkemcySnhYU3MxTjMy?=
 =?utf-8?B?aEQ1RnpUcTUzUWllVXpXcGwxVjN1RXlCM1RTOTBqUGpKTWo1SkgxR3FBd1J5?=
 =?utf-8?B?enBVcjNMU2hudkRodHhOTDNwQVVteGlMd1ozQVAwQXhEV2lzdVBUSVNvdXEy?=
 =?utf-8?B?cG1sWjdubTZwRVNIa1lyaE1OQmVRNStYK2EybjlTUUgza1VRK2hjWGh3MkJr?=
 =?utf-8?B?OWVoSXYxb1h5TmZFdDlDbWNNK3J1V0RBR2tkTlZ6M2U2RlY5blhoOTdibzFi?=
 =?utf-8?B?VGZpTVNvYjlXTFJIdDYzY21aRjhVdkVpR0s5UHZwbnFTckQ0NTluTkd5Z0ti?=
 =?utf-8?B?VFJ2UHVMaWh3Q3l2aHhWcFhIeXhSMm5oQk9zQWRMTTBmL1N1VFdmR0ZWdHlH?=
 =?utf-8?B?WEVGZXZFNzBUYUE1bzNZNW9uNUtYYVc4WjRVUWZwb2FXbm5IVWhLYzRuM1cz?=
 =?utf-8?B?NFNuQkladjB0enFCNlhxNWVSTW5xbWF6RWtaSGNOSVltazI0S3I4V2lBb1ZV?=
 =?utf-8?B?YXliZFhUWG0vM2hMZElWTERvYUZQUXN5anpzNUpnZUFhUU9WdWdzaGxYcjI0?=
 =?utf-8?B?bGw5c29Ga0pjUXIvTTJVa0F1b1U1Z3pZM0VYeWRscllFcXpUUytIQ3dGMjJl?=
 =?utf-8?B?MXA1SGN1NVFDVmJqVW9YZE9RcFUyMVRTZXgxWUlXOTFJZEYrTHFsMGdPbU1J?=
 =?utf-8?B?dmg1Y1h1Ti83MDJmaHB4M08wVWZoR2R3SmRwYnQyNDlFa214dmNOMVNpbTRv?=
 =?utf-8?B?WkkyK05DR0hxdUJUNlpqQ0h5dnQvN2ZmZVdHV0s1QTVyMkZXSjRoMXZ5QW1I?=
 =?utf-8?B?TkNhTUt6RDlnRm9mVzRybXVoQW94d0Y1V1daNFRZVTVFaDZSbHBiZEJKQmxQ?=
 =?utf-8?B?a3ZXb1U1N3hGMDIxcGh0K2VINS84bGlOaG1rL2ludUF2cTNGQmRXY2NjUlFq?=
 =?utf-8?B?enBFZmNqbWEwMC9PUUMwU0hoeEszaFVVSGhsbnVKTmtJOEVLbWJmODd3YnRW?=
 =?utf-8?B?SFM3b2tDaUtwN1Bib01ESVpMWHJYVzZWVVJKOFlteTZSUFJydHhWK3YzVFA3?=
 =?utf-8?B?Vnc0eStKaTZDOXk4M2pRR21qLzJwL09FWTBkMDEvOTBqTTFmNzVGRUxhbjZl?=
 =?utf-8?B?T1RSWGI4ZEl2REtUVDNPTCtyc3hNNmUvakoxYWEvRG1vS05jeTdOdHJFcDc5?=
 =?utf-8?B?SWdSRmxHY3Z4Z1VpYjd0bGVod0FkUEZjemcyOG1ncnFJN2YzVzJqR0ZON0VS?=
 =?utf-8?B?TVRESFFqZyt1SVNZR0EwUHpCOVdQN0Mxa0FEQmRzcE4ySTlhMmx4NDh1R3Vo?=
 =?utf-8?B?RmRnbFdWT250aGpBaUZaMENkanpGWHdqVklIZ2pvdXFTeWZVMEEwbzB1d1pY?=
 =?utf-8?B?TFh6emVVSVV3Q2FKTXNwN1ZXOHY2cU16MG50ZlNnYTVqWkF2dWhQaTlzUE0w?=
 =?utf-8?B?dVVBTkp0REtKa1RVRHhLSUlmNXhybFo3UFZZK0R3aTl1UFhGeGtqWnJ6Uk5H?=
 =?utf-8?B?dmZiNTFWZUpYVjFzWGZoeTNVNDNTZkRpRHpVTktQcHNYYTFNZldrcUw1SmJj?=
 =?utf-8?B?T2NtTk5VcFE5VWNDdzc2cWV6NDFPK05lYnl5OXBHQkFRRndnbDYxMW5nWGxk?=
 =?utf-8?B?VUZVeGZCYXZjODRic1piM2x4NVl0L0xVOWJpVUJFTFBwbnROSE0zc0tNK0xJ?=
 =?utf-8?B?NlBDUmQvdmFOK21jQ0FSeE8rcGFRVFpZRUpiSHY1Q1AzMVBMZVp2a1hiUThS?=
 =?utf-8?B?UWxxQnRmWnRYZ1Q0SjV1cDNFSE9DVmU5R01YZDBBV1ZJUnRHWnM5Nmdmc1Bx?=
 =?utf-8?B?K2RMeENWLzQzNlBDcU5WTWlUZHgydzdubDhFeTBLTDNiNWVIanJIbXVSd2JV?=
 =?utf-8?B?cFdqUHZBTnhYbHpsS2ZkakhBSlhpVDRqSG1VY05xWXpIYUhOYllDQldDaUNR?=
 =?utf-8?B?Q0JCWk1aSndCVmU3bkVtajdsVGxxVUtwS3h1VFdnemJmWm1nZzZBd1VVT1oy?=
 =?utf-8?B?Z1NBQWJCQmxqRE5RWnFiYjRnVUJMaGFtblhxMDRJNlBRbWU5N2YxSlVVNEIy?=
 =?utf-8?B?djJwMVY2T2tGdHZoWlI2enJXekxsbVR3MHg2cEtSTElkS3lxWmVFcEdrVjFr?=
 =?utf-8?B?Tk5CdzBMekczcmsrbmVwdGNSaG1nclBQbjY2V1ZBSUtjVzc0VmtsRWM3NmY3?=
 =?utf-8?Q?jjrF3PV5KUoabyoJw3OueOcUvqmuj7zoW/VCvxzRqhhUD?=
X-MS-Exchange-AntiSpam-MessageData-1: OLweKAzJudSM7A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50e7cec-c013-4901-fdd1-08dea0da7e6f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 01:49:02.1352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJDKAxK2ZIZrLbGjut3ShDqr3jPY5qnkbjcZ4/M40URIfANoGqqkRFXmWwceRPCbHU0X1knZACPBIxrvqySxKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6710

On Thu Apr 23, 2026 at 10:10 AM JST, lyude wrote:
> Hi! I was told on the github for sashiko that I should probably bring
> this issue up here. (source:
> https://github.com/sashiko-dev/sashiko/pull/112 )
>
> I sent two patch series to the rust-for-linux mailing list last night,
> and was a bit surprised to see that all of a sudden I am getting
> Sashiko emails on my patches without having asked for them. Which
> brings me to say - I really think this is a tool that needs to remain
> opt-in. Or at the very least it needs an opt-out that at least silences
> it trying to respond to a specific person's patches both directly and
> via the mailing list.
>
> I'm going to keep it short because I am really trying to avoid this
> turning into a conversation about how I could benefit from these tools,
> how useful people think they are for themselves, etc. I personally
> don't find myself being more productive with these tools, primarily
> because of the significant number of false-positives and the overhead
> involved in filtering those by hand. I'm concerned that if these tools
> are suddenly allowed to respond to people's patches publicly on the
> mailing list, that it moves the responsibility for validating its
> output away from the person using the tool, to the person submitting
> the work - regardless of whether it's helping them fix real issues.
>
> Keep in mind, I do want to be clear I think this is different from when
> people use these tools on their own and bring that feedback up on the
> mailing list. In that case you've taken the responsibility to actually
> verify the validity (or at least the likely validity) of the issues the
> AI pointed out. I certainly would have no issue with that and
> appreciate the issue being brought up. I know a number of my coworkers
> do this, and I've honestly not had any issues with it.
>
> That's all, I'd love if this was opt-in - and not enabled for the
> entire mailing list. Thank you.

I agree that this kind of tool should be opt-in. Maybe we can make it
such as Sachiko reviews are only sent to the author of a patch if they
also Cc'd some sachiko@ address that acts as an opt-in?

Sachiko can still do reviews and post them on its web interface even
without it, but the author would not be explicitly notified in that
case.

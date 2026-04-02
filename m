Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA73C2FFF88;
	Thu,  2 Apr 2026 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137022; cv=fail; b=k/W95MDNHWaMImXdDpxR0xM0gKP8c4dOwcWh6taIsOtH6GKM32hryifAEZktcAudFjLET09Ho+MhkLWbXpP2QHBCcyv1s/9ep8Aq5xwFv7vGAngjyp9Rd/80qWj8mjuxvVpHjcSIZrHm8yBHG1LnK/em3NLzjyGgUbH9a2WictU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137022; c=relaxed/simple;
	bh=Rx11Iu2IuPobk4RIEcjHzUCRGR3qnrWFAFUNZ/3yrXY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NbzpmNPwurPHRoGnZh+2PCb96uDtmvWe4TLeWTfgnT6cMbVJoTC0oSIRo+MIu9QmSHhcVQxFKh/boqBelbR9g3LSk9FS2ry2BBwhKqxAIEfioqRpAx1UUwkBda0zzU50D3OB2oLQdvwcBbkGFYYkHAf5r/oTj3F3ysZoYRQ6oT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XqHOti/L; arc=fail smtp.client-ip=52.101.53.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XqHOti/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpOtZIlWeAtOsKOUFNkdmoxtLo3oFv78eM/54wD2JHJkA/VPpgyoDdf/FF0fjGrIJXebHQZ27W33TTbx7QNZQQu1cejmkGK8Bvvt2WW+XBM+xYa/rwu8UVPsiJ+7gUyr4PBtKOgM4eXmtz3IUxAij8fbsujwrSh5rzTM5nV/2akSZW9LkfS8k+TKpHtpTIu1oGWxRM1jxCKtuRNox8sNe7ItQAw2GMKI01XadsW6TDJpbCDqHpSQaGwHazwHpjmXRvBEG6isaT990kbcqj8VZzOVSb4Qb7fioycK7ZLNT3caAIm7vkdW7dl9HxD+FabDBF2IexDBA6de54WtDrjJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx11Iu2IuPobk4RIEcjHzUCRGR3qnrWFAFUNZ/3yrXY=;
 b=kRHiFMWMeuEtCrJKae/FqDvc9JVJhbyfHE5RAdqCurFs14daJyxv7JGe3y4AYonABeUL0ljKxL2xF4zkH7mZjvTP8XFFcdEmIUOdzKGjyMu8chsdcqjIvP4yvzM+ALDOyNPaE+7erjgMIldUebLNRHKJ6ueMEgn/I5DHZHGMGvfEAxk26j0VDDTaswQ6VFDDTXHYU+MIB4iLXAPziewuH9OYGiz/ehcDX/NIUyf02e1Hp6/3raRHBLbI588il151RlVDwnS5jO1Pk2TI85DjEVWCkyyHhP+zE+gRE2ObTMKpU/iq093hPKYbuQZZz986J3MlN6ZqJBfRUA3jtwc0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx11Iu2IuPobk4RIEcjHzUCRGR3qnrWFAFUNZ/3yrXY=;
 b=XqHOti/LSSnQU5dfOmrye0K0l2j7tS4U4eL7u9PWYo50e6EKvoVAi7lFgE3S6l2SL9dIK1eltNE3ygXsuPq1g00CVTLlyVpxGOPMoYchf14jj/ekpPsddAsCAzI5FVnUOJBmcbwx6Mc1fBig+lKslF4dPlsEWBKUSq+cxS1dWVriiLjlxk0R5b6MsHRpNL3uUY846mu+WDz2kKleNjAMNqIo8c97ahSXhJkBg9PhuReDPWGs69J+x8rq91qsVCYlbofDcSPjImc2Vfznoxbk9/cX0xs/ELw/xJhr78qllnWUoUlYKwko+tGI+YQZynXCitKzkV15va0+OSK5SP7s9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH3PR12MB8995.namprd12.prod.outlook.com (2603:10b6:610:17e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 13:36:52 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 13:36:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 22:36:48 +0900
Message-Id: <DHIPJVVKXT1H.TG3TRWKFOBU8@nvidia.com>
Cc: "Jesung Yang via B4 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
 <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com> <DH939HK0611M.22A8T9BJ3NG8@gmail.com>
 <DHHKCFIJUDDR.1DKCJEY9I81EL@nvidia.com>
 <CA+tqQ4Ko2n0dnEx50LGbTBT9rQzXq1yToMw05xd+S324ZQBbiQ@mail.gmail.com>
In-Reply-To: <CA+tqQ4Ko2n0dnEx50LGbTBT9rQzXq1yToMw05xd+S324ZQBbiQ@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH3PR12MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 3131e68a-e326-4420-76f7-08de90bce63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cBA2gRixdP0srV8U2spWVbcWxLsFhClY68j8nhXrdWlRVagBvtirokXpuOivgeD63BAwOcjuU2Ps/u/HsbW2mQiqE91C1Gx/FFKjZ+FV+NWqk/JKp4StL7UZKa5wByqL4ptAlwXML7NhQyLe6AA2twK71xtsDvU+itY7P9J9wnhndA83RVO6H/KdvDn28pZBGVAjk8qwsFmx4Alw1xTfoTGC3AXcL2mHF/GkRWEZalWbHd2gHbflK7iqzGPCFJr1ENXi7GzaQLhOt90kazhdujQfNjrReYzbvu0D8kTMFr8e7AeDIie2O2E92nIR+YvxIjw+Qw2r5YYiYW6uB0vizrKMAvzSv1A5UUgP3Fx7PvRr3LSLkj9TYNZHjM0XZunbje/Ax9PQLiiq9iKEpLzp+BQoODsywZdM/JMsAcGuLGCO7ueGoNil7YezWG9nsAkQ2jqmVHVkz3pK4yf/VK6f+S3yBYpdQwFJHLgjiH2jKcs6eZ6HcWFOf7mSryRPqzifOMpibjU9AV6jG3A454M/tAK27kxnwtxn+COmjt/vJsnLrbWS6kaAuTtpMhFdm3zZKIw6CQmVu8ScYLLu5nM7Wi+h85LRz8lh0vdHETlxRljYPjA5zsksFO+T/i7PyAwkJ9DLCRM5m7G1Tg0PouLQxjWUKEhKvO/ZRnFspHXwNxhiqq+rhA6qT5nPGLxwBOPOeCNLIIMCD/tMqDRXgwMuLQnocQbCNtgqw30EgnWQx9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3I5M3NrdWZQc1BFdWljeGxRMEx5cElrS2ZadXhzWVExdDFsYk5hRi9lMm56?=
 =?utf-8?B?cVJLcnBLSExXSnRRTmxsNUN6VS83NzdMYjlrSVloNE5lTmhoL2w2cVdZU1lD?=
 =?utf-8?B?eVhOQTlMRXVoUUo0TWhZRDhBSVNERDRSRi9oYkI3ZnB1RkVKZXFPTW9oU3lT?=
 =?utf-8?B?VXpVdHF3WklwN3RtQ0RzRElHL1R6amsxcko1OEFCdXhYVHdBcVBEMm8xVnht?=
 =?utf-8?B?ODdBVVdyNUx0RUFycXJ3bE56TkJ4eWxCRHA2OGNpR1dnTWRHV2NvSDFXSjNo?=
 =?utf-8?B?c3BJSU45OXpHd0xCcFVnT2ZzM3ZWUlRKVVFycnFRU0tna2NQdjA2cjUvcVhD?=
 =?utf-8?B?ZjhZNVFVQ2hTU2JHRlN6TC9yMEdhQWtiQTZ5dW5EUkNsNkQ5UmM5aFF5TjlL?=
 =?utf-8?B?b1ZZUTNWeDdkb1NUUURsaFdLcUFic2JhdHlzY29mNTN4MXRGSjI1dWpoTkt4?=
 =?utf-8?B?ZFV6eDc2VlVSNzJkVE95SU1QaUtoMFBwN3Q3UWQxNE80MFB0Rkc4SmRJenZW?=
 =?utf-8?B?YzdJZDhJVG5Ucyt2K3ZkSkZ0NlZ5bWlJa0dWWUxnS1l4My9qKzNZNTY5UCtL?=
 =?utf-8?B?N3FUVW8wWENGaG9GV1VkV1ZJNTI1TzU4b1BJZFUvait3WnA3WGxKNWsrZ3RW?=
 =?utf-8?B?RnJlWDhaQmhIZUZvUS9HUVRySnVqY3ZUQ0tSb3YwQVFrME93S2R4NVdJN0Zo?=
 =?utf-8?B?VTFnSG85OFRGTi9aVzc4NDEyK2V1a3pXZ2FhcGxNSCtFcE9PSE1QeXhGQjh4?=
 =?utf-8?B?d3VTai9GTGZHNjQ4U2NtYmJteUFEaWRzS0lNR2lPWGg0SFdnSlZmbjJ2UVZR?=
 =?utf-8?B?aVJwZGZacTYxQUNCN2UzR2NCVEVtUnFsUVJUS3d1by9CZmFMeEw4RnFKV1Rm?=
 =?utf-8?B?MDlVUzZIaG1CYzFMZGhiUHF5YkI4Z1d3ZGV6UEYyRXRBaWh4all2MXIvdXdr?=
 =?utf-8?B?czVtVzJ1eVJRYTEzLytMdXBmU1VTTEUvZm9FVlV1anp6VnEvM0ViUHM4NDNS?=
 =?utf-8?B?bjVTMEZ3VTBnNlFURmQ2WkFRNnpvYWF2WHBHNjBLWGh4Y2p0WnFFRG1OVm1S?=
 =?utf-8?B?OFZkcDFkWE1sdHVsOUdGMkYzaFlQZm1DMWpOb2FES2MyTjQ5dEVpQ1hJNmtj?=
 =?utf-8?B?aFVqTWl6YWJVbW9iaTFJclEyZkFUcEpqNFdxQml2NjB6a1VnU3lXSXRZbEt2?=
 =?utf-8?B?T1NkaUN1U0VjRVgyQjJqRTA5dklmUmFRdVF0bGxvMGpra2J2bWN0aldOVzA0?=
 =?utf-8?B?VHRJRi9pdWpTeUVTcHpBSHJWMS82VGxvRlpjWW1HelNZZE1PcWVHaEhQVElt?=
 =?utf-8?B?RnVuSXV2MGRweFJBYTlDaDFhN2hJYXlWUHYyN2tKdHg0S3ZFdE8wclE2VXFE?=
 =?utf-8?B?VWNXa0VHV09FVjR5bFhVemRndGwwQkpDVDF2UG80OEd5RSt3NzJKcGFGSnFL?=
 =?utf-8?B?aGREc1hUUm1PcGZRZEFtMEdDNFhDU1FXRkNPUVlxRHRPazQwd0lWYTY3SWxj?=
 =?utf-8?B?NVBHcmxKRHNRSkpBT3lZTVYvUEpHc29wYVViWUh5VlZMaFVoUUxHWGxWUEJR?=
 =?utf-8?B?SkRvYlFhWnlFNFA3clhmM3cwRS91cHZVUDArcGpnQk1zQjIyd2ZrYyttZEtL?=
 =?utf-8?B?b1phRXRGQlZ4VSttb0tFQldQNXpBVGRFRWFYa1FsT0lpWFhibUg0R0ZkM3Zh?=
 =?utf-8?B?djhSOHBGM2tFejBkcXB2RmNhRS84RGRkMXl2SkFSdSs1SThrcXFxYStBa1Vv?=
 =?utf-8?B?enJGd2pOY001bU5CVHVRanpkTEVCV1lycDk5TlR6bUx0ZGdoSTN1R3BhRU95?=
 =?utf-8?B?UnA1Qnd4SVlhRjJXbDhiWnlNQVBZeWRIWXkyNFpIcGpNbmt5UnNuU1dFbjVU?=
 =?utf-8?B?LzF0Zks1d2h2NUUxWTRvTmVRN3hvYjg3OEYwV3EzcVFUN1d2SHQwaFhuMFJT?=
 =?utf-8?B?aFM4V204RW1HYjJPUUw5WE5xWEFBSVQ1dmVNa3Fqb2NwdUdVZEFxS0FmalAw?=
 =?utf-8?B?UnN4VG9xWWs3aENERjVWZGZsbkNzRXp3dCtkR1g5SG1sZWNhWDRvOEJZUzV1?=
 =?utf-8?B?WDcyVU9YdmFNb0FUMjVXdFZXUmNNcXZqSi84ZEJKbGY3KzNEa3NNSzZKYkpI?=
 =?utf-8?B?RjVJZE1LeG50aTVLdkRpc09kcXFhQkM3cmNsbVRERTJybnZPbmJDUnhDUGFO?=
 =?utf-8?B?RmgyUUp1MmhOV0FRbE5hc205dG5GSzQ3RjJWZXF1UWhERDc1WnNXeE05SU9W?=
 =?utf-8?B?YzJ6L1YyZjk1RWxSYTgyMUtMUVN4N2c1aWs4Yyszc3Vod1pBKzNpY0hPQU53?=
 =?utf-8?B?eVJqZTM1YkkrdzlIZEpLd21pV3kxcWZ5ZFZpcVFzM1c3dDhzU3F5NTU1R0RE?=
 =?utf-8?Q?KK37vdm22+e61jw1kDr3YRolR/U0yYKszj3NV8tBBvYaE?=
X-MS-Exchange-AntiSpam-MessageData-1: Wto3T+/ua8bbXw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3131e68a-e326-4420-76f7-08de90bce63a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:36:52.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4OF8w2dw7XCweSCS8pvV6HX+s8lt3uLfAv0PPls8BJJFLqKPTJPl5DTznqbTPODQlX9TTvsxWpXTJbsD/XPbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8995

On Thu Apr 2, 2026 at 10:07 PM JST, Jesung Yang wrote:
> On Wed, Apr 1, 2026 at 5:19=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
> [...]
>> Thanks, I could rebase my nova-core branch on top of it successfully.
>
> Thanks for confirming!
>
>> Can you send a new version (maybe incorporating the `from` helper
>> attribute I suggested) to the list for review, and hopefully merging for
>> the next cycle?
>
> I've been caught up with some personal commitments, so I can't guarantee,
> but I'll take a look at your suggestion and try to send it within this we=
ek.

No hurry at all; we have a relatively usable stopgap solution for Nova
at the moment. I'm just excited to see this land. :)

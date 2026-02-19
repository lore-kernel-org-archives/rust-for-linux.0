Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C38D1C84C0;
	Thu, 19 Feb 2026 03:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771470145; cv=fail; b=kjQT7TgM0PD29C6J8e926RPhORh1jeZgtMiD1yGDKHA3u+D5CppTm8tjvbjF0sAMQQRP/FzrwriGw0IC29LwwlOw6LolPWkvjcAx9XAwSdd8iRg8dTPK+Tub3DBHZhOdgp/tWdYkhZCvvmgcU6R62zRrCzVxCf/COub1jO5oct8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771470145; c=relaxed/simple;
	bh=MG3yaAzWe+L1juALTcH1bqS1VCNtGfR5KuXU1oXjxOE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ItZ/RV/w5YwTSt+kKz+w26N2r18IBjppLc+qEKA2JrtD+zHPC8/jsM/pXTohr+yqHwu6bRbVeVtALR81c27e8Eun14Pmi/Gz8RmjeZ+2TGfBIMMfp7VKO3c2yseGgDfTZ9HGKJTNUhT3PxZiowDGYppML9ICjN8Cb+8vRhKNi84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DU8e6CR8; arc=fail smtp.client-ip=52.101.61.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DU8e6CR8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUBnBmP0MknAalLKHkkgk5iCO9kUjeH4UBJGSNd787Vlh0Nz4aIV0tHWVGpsJDQ87YwxRYH8GyG0sWXHbSSH4g+rGTcMbk7DkKeATQPiHBAiiMGHAldVlKyrrBWXBwHuFDN0DXlMRNRifmJED1fkZdBSyggFQXAyyhqyfe5SyotXtzgee8hhlb97J2KMczJlGTexzn+viB+Zmp4we08tq8NiI+2Zu+LOcjmHgcvryPKAelzs6YXF9TeQm0ytcQJnSnKALiRjYFERfvL86RXeZUubtdD5uV9i/dZ7aNnkOUMD23suhz5WHP6skx2idlzug4qc4Yu01z7HsWrcirv3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SARhBtA+iRg/EpkDa5Yp1XFKFXdCBYT6ri7NR7vLddw=;
 b=l2Nsp5aa83p0wF4skTQHx0DA0tFxBz2NqY0dAwwpDF3XUC4n2AUg98ZXf+lhE9gWhYohJxk7U8VjWGypnqKV11/lFb3hsZk1YWqSqUJh0XAfjH229N6EykyLC1x1NslM9Zb3PFz+ohfzrNff9B8xvtroNrLW0ihSBIK3MEa4A+r/kHfEHrgXd1b+i18SsEL2sGsv9WcKDWeQfoMo+0QzEa4kq2QYqCXs6s3GB2lPRX8fXBk14LedwIoh5vXHzJnD+Xrzep7H3G4XFctUHO5J95UET63sTclYjjO/IQKrm50Mf9/mPmLsx8SFweKwVTTTxWGAPUAMP9e74q7sjsVZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SARhBtA+iRg/EpkDa5Yp1XFKFXdCBYT6ri7NR7vLddw=;
 b=DU8e6CR8n5DpvmQyS96Un2CHTSE5zgyJzi0WrBLigP/rSpccyLjRGSUBH74j/t/PgqWNGxMYlA/BCqAvKZyROkn46BtBPzNWjlNPuN6EWJf1ysPUIv5RF0nkjQQ595T6Xa3vHvxvApAFnemhz7mvG70jHj53DAFqB0d+/pmUQgWFPpwI5I9cEqRFqFmDBrYZcnWQcpq4V5JV2fp0dsgtyz6/w4y6H+sJGnPSvZ773x63upq5rVxKSpOldqAotpLyUi5I6qX7+9why7Jutn98+4g5DKUKL6SgJOOR0QzcIxp7yU3Ii5bhXZEGJih70oQdLSLC/a9cDgJtaaGRZWq1+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 03:02:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 03:02:20 +0000
Message-ID: <f019cbd6-1778-48aa-a75b-d85cd48410f8@nvidia.com>
Date: Wed, 18 Feb 2026 19:01:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-20-jhubbard@nvidia.com>
 <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b18f7b-bd47-48f0-a333-08de6f634c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S01seW5sOWJKemI0Rm81SDJySnVvdnZJVTJtSFBTSW4xRDlaY2tUMm5KVTJK?=
 =?utf-8?B?Z3ZnTFNXRlZsdEFLc3JFamNXTG1SK3g2M05mamdTOWw2RFFOSnNCN1hEaWVp?=
 =?utf-8?B?ajFTVmdTMjM0RE1sZHRqdVdsZVQ2U0tmOWVmZXV4R08rMFJPUjRWNWZoYzd3?=
 =?utf-8?B?enNsV3pmS0RxbC9xeVl0cll0d3ZqNjNsQnJUVFhvaUNCdUJObk1CcmREOHd2?=
 =?utf-8?B?N2JYM1M1Q0p0aGRrdGgwbEVHbEJWS2RIK25ySTQ4dmdiSCs3dHV1VDBkNnZN?=
 =?utf-8?B?OXpzUE9UbS9KZE1hRTVmMUVxRGRVcUlrVXYxUTRxYWd2anBVMWsvdHVTSW1Q?=
 =?utf-8?B?U0t3Vnc1amlKVkRmR1ZIOStWYk5oQWN0NFVvNUQ5d2lDbFI4bys1QUR5VkJj?=
 =?utf-8?B?NjRLeC9TQmlRVzU1MFpEUjRHSE9raDl0L3VJdWM1WkIrREhvTS9qM3lLQ1dE?=
 =?utf-8?B?M3pvS2c1T1VVRUVsdjh0RUlUK29iektXVm40dlc0UVVHRFFFODJ3cjdwTjZU?=
 =?utf-8?B?dytuNENieDBESE9tWnBiRTlmbytRMmxpU050cDhRSExmWnkrVCsxSUV2UlJp?=
 =?utf-8?B?TGt1T0ZwcWtFcms3RW1jM0JFWlE2T3NpM3cwYUIzUGxid0hjZXFaQndaanJq?=
 =?utf-8?B?QWVtVm5KOEhtTmlKUUt4TlZzaW9uTjlqd3ZycWlFUXFaN1dKZTF0dWR1TWV6?=
 =?utf-8?B?aHJTQjRLTytpRTg2TWg3OWxQYXhhWDJNSWR6Nm1SRE5lclFHRVMyWUt0dkZ3?=
 =?utf-8?B?Nnh2RUVLT1BVOUw5US9FS0JtMlU4Y1JYZGJLQWpxUUF5NXV1SU41Q3Iwa2hB?=
 =?utf-8?B?SnVkVmMzdnh0NXp2WG5URm9pUzlsTHpSYTJiUjdOMS9BektES3RJbmFLMXpF?=
 =?utf-8?B?cURLM1Fma0QyY00zV2xVS3JiWWg3dVdjTlplMVR6TjQzUGxqYzZ4K2tCUEpN?=
 =?utf-8?B?Y1RjZmVxR0J3bUNFQVhkZHZtWFpIa2FJUzcrOUIzeWVsSVN0MHliZC9EMWZ3?=
 =?utf-8?B?UGRjMDRHZDdGdi9vMlRJaEs4YUpmdUZmeUxoUjdZYmcyUkFaUDJsc1cyYUV2?=
 =?utf-8?B?c08yQWM4S3BuYTRnQjQrbHpMemZZeUxaZnRHMGRHK1NCMlNQazd2a1I1Z2Vp?=
 =?utf-8?B?ZjNobVhETlY5dzdlSExIWmVUeDFPckJKZlpOaDljZXBPRjA3TmJTRXVYUzJS?=
 =?utf-8?B?MERST2FPQzUrMlR5RndDZDIwdmxKM2lMelpLaEF2cHlVOS8wQmg3UTl5VHBw?=
 =?utf-8?B?bGJFWUYyeGtnUDBEV3FZRmJGR0JCUE9VdlBKc2ZYRFAwekQ5ZHZJREJTUHdy?=
 =?utf-8?B?ay9wem1yQlJBTnlPdG5IL3FmZzVUSS90TXJ6UTJkTTUzeDBHeFF2b1FSZTN3?=
 =?utf-8?B?SS9MUEwzWUh4WXZzWmRNWDlSV1FsOWtZNk9QaGpBazdOcmFwYllPWE16dGU3?=
 =?utf-8?B?VnhkUHJNc1JwV0d1anFRU01rcHlIcmNVMXB4bFdrQTJieFdxNE13QklLRnYz?=
 =?utf-8?B?UmJvdDVvYm5keURsRVNrbFJJS1BYU1J6S0haQkNCcTJNL3Jwd0J2K3pBT2ht?=
 =?utf-8?B?TTRCTnZPM0trdGVRZW93cE5zOWF1SzRuQ3FRd0l5OUpjSmNlZE80Y3MvdEpU?=
 =?utf-8?B?WlV6SCtSSVJBMjJadFByczNZZ3hBVXE0b3hpYk93andKMktNTEhuODBZQ0tp?=
 =?utf-8?B?cUROSksybThvQU92R29TV1lmUkJPOGtJYjNhWDR5emg5eVpRUVJMaSs5QTBH?=
 =?utf-8?B?T3MrVlQyN0xWcEx4Tzl0Rk5nUmxBNGMyL0J0VzRFOWxzU3JPNm8xbmphYk5h?=
 =?utf-8?B?WGl5b2Q0WEg1TnlaQUpma2NPNmNnRUJiM3dDRTNmdVdVN3lldGxxMVZ0RW9B?=
 =?utf-8?B?M3RqTVRYY2hWSjZPYVI0U2VlL0d3VVJkLzJDMW5uTXhSZzQvTDRpcFJuNXRG?=
 =?utf-8?B?VWVPZzRUaHZIa21GdUVtVkpRYVljbmthaHdRSlJTRlowR29pT1hMaWlMbWwr?=
 =?utf-8?B?SG9mWGRRWUhwSFhjTUZ6YXBiYkRrbmlESXppQ2hpc24rcld3VkhlaXlHa21p?=
 =?utf-8?B?dUE4amNscTVrN3Z5clZKUk9VajdCa2VEQ0VJUFJ3bW9KZTk3MzBObFEyQldF?=
 =?utf-8?Q?ykZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk5GS2RuSkY3WjlsU2RVbG16TENoQVlSU1NWd1J5SXFTVm12MUR5NHNmWU1D?=
 =?utf-8?B?MzdHZjArQnZ0ZnNDMmJqRi8vR2JWZE9vbWNvVldXQTdKcnlwZXpJOG11bmJL?=
 =?utf-8?B?S3lncTZNc1BsNHFpaVRYajBKVjNaSEVIeXFhZy9ENEw0bmJEdFVuNmgrZGJw?=
 =?utf-8?B?RjE0NG5CQ2hUbEpHdjFLVHlLdUU4cW1ZTnVyMUtxYnU0N3NKZ204NlFDUnRs?=
 =?utf-8?B?dXpBMlRLWS9Qb0V6aFFNZDl1a0pINEhYKzBwZTBsMlEwYnVQNXh5NTdMNWZ4?=
 =?utf-8?B?QytVSzg1a0p3YVVMSmt6NGJ6UjN1QTZod2ZkbWhHRzg3MTVIdGdjblczMzBB?=
 =?utf-8?B?YVpFZGl0czZpYkdRdW4vS0o3TXZOTUs4MGFPOHZhQWdXMG1LWjF3SGEzQ3F1?=
 =?utf-8?B?NXg3Z0J3Z0lRL1owVXlnR1dkQ2RzKzBDYWlaM2tIRFdKSjAyQ3NGS0dsTmN4?=
 =?utf-8?B?V3d5b2VLOWJjSGlFd3pBQmFxc1NJNnlHMW9RQWVBQ2k5Rk1HZHZxU0U2STEr?=
 =?utf-8?B?UnRNenk4dzhXdkFuVmUxRDZmbTlUSUZVcTNBc2hlQTk1d3JnR0RaZEpKRGg0?=
 =?utf-8?B?R3RRdGUyOUxBU3JpMEI4VFR4RklMdmp3QXFQK0ZWbDQrT2d2QzJiU0dwRG5i?=
 =?utf-8?B?UWl2U3cxMWZ1dFVwYnJZMVlsUm8rKzhCZENlTEkvSVByWlVadE5xQXlMU0dD?=
 =?utf-8?B?OFk5enlIVHFJYUhvQ0RsS2pmNVl5TTBteGJTSXpKRFVNS2ZGZlJicDcwSXg3?=
 =?utf-8?B?dVpvMldpNWdjTUFjbXMwYi9GbGpvaVR4Znc1UkZmdWMwNi82UmlXN1BFMFJO?=
 =?utf-8?B?S1BDMHVCV0pyRnl6TGtCSWN1dHVBMXZNN3RoR1Bka21Qc3F5T3BVRHo0ZS9W?=
 =?utf-8?B?c2dMYU5JVzFGdkgrOHAwY1M2Q0pUMU4wS0h6RWtKZitYQ3pMeUxna2p3WldP?=
 =?utf-8?B?MXFQOVA4S2tYeHhhbnlITEF5VVh4bCszY2FJRzZJUCtKOHYvclRWaHZLMVNW?=
 =?utf-8?B?VW8yUHRjMEo0MSt5Qzg3TFU3ZUd6Ky9zOWhWd0pGVFdpaWcraVR6ck04WVRo?=
 =?utf-8?B?VHFxc3Q5ei91RlQ0YVgremNKZWgvbWpOWGRJYkJPVmRLNi9UQXFWai9aWEVi?=
 =?utf-8?B?bkw0cE10alYwUWxwNVlDWCt1YS9EQkFyV0k2V2IzMnpKREtoS1ZQaEsyR1pm?=
 =?utf-8?B?TEsyblhlaE1ZUlMyVVhuZjdoTFE0aW9JVlZkR2I2a3dDY0xpM2Jid25mZGNR?=
 =?utf-8?B?WHZQYU1ONmw3Wko3MHI2bURLQTkxWUFlb1Y2YVBWTTJoNUJxdXVkbzdOUS9E?=
 =?utf-8?B?dWZJUWdJa0NSVmpKK3BncXpJMHBlY09iSDJ3Vm1kMFEraWxVam9xYzNqTHZK?=
 =?utf-8?B?ZCtmdkdUcDE3M09XcDZ3UTQ2U3hzQkd5OCsrRlVTUUFnY28xRGlHRWdJLyt2?=
 =?utf-8?B?RWtWN0o4RjlTa3FQcHBUWENJL21jTk9TRGVUQU0wZk1GUm5iNDlFS084YWwx?=
 =?utf-8?B?MDNycjZaQUV5d1BXV1VhTjlyUHRxNEZ5elpUVmVRQWtzcXlrbDEzTFJ3b1VK?=
 =?utf-8?B?enNPaHFVTGNBK1RJcHlDZ1l1RVRIOFQ3V3FhWEZDaVBoTjl0MTZRd1cwRjRx?=
 =?utf-8?B?WjV1ODBKUXFOUUlMNUI5ZDFsbGF4OU1NbFIxSWhRY1dGMFJUUWU3MHZPdTRi?=
 =?utf-8?B?Y25GYVpoZjA4bWx5akdFR3hMSWtJTVVyeHBvOEhZY1d3UXdzazNxblExM0No?=
 =?utf-8?B?amp2Q2RQcXJuSmIyWlNpbTNuaHpadk1RTCtRUzRUREN4aStFSVdnZ3lPcWkz?=
 =?utf-8?B?dk1CUy9HNXpEUEUxWU82WlJxdTZVemJhUWFyaVpINmN3R252ZlFKTnIycDh4?=
 =?utf-8?B?WEphY2x2cjMweW5aL3hkSGlsQmZMeEJ2NU83SVJnR2VnTE1yYW56dlRRVzE0?=
 =?utf-8?B?YWpsYUJsdTVOYUpBQkVlenArYlYvY3dwRlJMRWZhK2xGUzY1Q3JFUHBwdjdB?=
 =?utf-8?B?bHFMQ2hOazhTTmwxa3Q3Um01VzNHS2MwSkhKUnN1UTF3ZkM4cGRESCtUUTBF?=
 =?utf-8?B?ZVNqTi9tRHFkZHJrSk5pemRBcHRKcElqenlFeDErQ2pEMGVOYWkwUm5iNG5P?=
 =?utf-8?B?akdrbWJHQVhOUDI3RjErdjIzNUlOTXM4cTZBUExlUFdqd29XL0V6b2g0R1hZ?=
 =?utf-8?B?VkszbHdiMzFKSlRRZThac2dFWkdTdkcrcEhsVGgvOFJSY256U0RtWEd4YjYx?=
 =?utf-8?B?d0xLRVc5alMwNFYveEZldHJuTmRjakRlTGU0L05TM3QxaDh3bFBwT21zM1BG?=
 =?utf-8?B?TmZ1ZkxjOWVnQ2l4cGJoM2ttNGhibmtwY09HTW0wN1poM1YwNHhwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b18f7b-bd47-48f0-a333-08de6f634c1c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 03:02:20.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMWilChv0kQ9/7tEUYInmnfBK3w+Qp/7i9/w6cmSYREBu3pVdAmzRcDkk6OW12b27U/tAEPxUVWcOIh/vlturw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360

On 2/17/26 8:39 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
>> index c952a834e662..f068722c5bdf 100644
>> --- a/drivers/gpu/nova-core/num.rs
>> +++ b/drivers/gpu/nova-core/num.rs
>> @@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
>>  impl_const_into!(u64 => { u8, u16, u32 });
>>  impl_const_into!(u32 => { u8, u16 });
>>  impl_const_into!(u16 => { u8 });
>> +
>> +/// Aligns `value` up to `ALIGN` at compile time.
>> +///
>> +/// This is the const-compatible equivalent of [`kernel::ptr::Alignable::align_up`].
>> +/// `ALIGN` must be a power of two (enforced at compile time).
>> +#[inline(always)]
>> +pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
> 
> We should probably just add this as a function to Alignable.

So that would go in via a separate git branch? And therefore probably
I should send that change separately?

Or should I just create a new patch for rust/kernel/ptr.rs as part of
this series?

> 
>> +    build_assert!(ALIGN.is_power_of_two());
> 
> ALIGN is a const generic, hence this should be:
> 
> 	const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };

That doesn't compile on rustc 1.78.0:

error[E0658]: inline-const is experimental
   --> drivers/gpu/nova-core/num.rs:225:5
    |
225 |     const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
    |     ^^^^^
    |
    = note: see issue #76001 <https://github.com/rust-lang/rust/issues/76001> for more information
    = help: add `#![feature(inline_const)]` to the crate attributes to enable
    = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0658`.

> 
>> +    (value + (ALIGN - 1)) & !(ALIGN - 1)
>> +}

thanks,
-- 
John Hubbard


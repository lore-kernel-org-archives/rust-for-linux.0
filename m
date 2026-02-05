Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5564313A258;
	Thu,  5 Feb 2026 04:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770265004; cv=fail; b=pH/9I5g3d6eIbWM3wA0wPiesj9ZljsUYP22fM77MkaDfwBDkkK9oUlwd26wv9Q//q4bL9rkxdMOYyiTJAQmCyM9CCi0MPMuW94sFod3qqQ5+oM1OITCvWz2mgW6GyQr3D/Z8BH4s2SH7QYUY2dv85I6ft+bQSVKpVmIUWqg9y0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770265004; c=relaxed/simple;
	bh=pl6FeBndQ8GTFrq39mBf76hx+PbeV5cPhHNbs7hnKbo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=svR3+VDoQ2rINJEfXbrBIFWSADHjXbHLB30HRBYavbQXYX2TdtEQxMA/q7jVGx3Ugw90dsign4jyeqwma3Nm2WMWhEK3/2nlsI1jlm7fKBNEMR7KtYLeZaGuzLDiyPaOji1aQKAuSPl4ZGqCwB3pgDOTof+4yB0rtpLydkbGk2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S9iul72/; arc=fail smtp.client-ip=40.107.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S9iul72/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tmb+8DI5qzu31BjWkhEr/Khqr8K0Nbbpf94LJd9ph4kVg2orleKyyWX6arWMBQIdDXNbKcCmEwmQft1hObp3yF8sLz8ir+tY5iZ6u5K/IQslbH4I0QMGjRMkCC5lklrXdK5QnHQz2oxqQ6B6Psj46NlYq22KTGGJ/D2LAyDcRLc7+CU8p7HeK5WOOjTaygvQWsYxHhLNrEHFquQN44L5Rj1Y1BOZVLjCpSGaNePp/HQGInGi35lnxjnGq2qY0a5HJgWYJZwZ1+x9llEhaZoYaUa6J36cwU6gUr231fneURLkt2lnimLmdn6GCRJk3WdeSWYt6ifZcI8s+zSwGkiMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN9CSWFulodnbZzhcjZLoujlRBAKwvofz5QCzz8sO+A=;
 b=DZt8D118uCfwW3+lLolTcvLGF2M4C4BvsG/SIT5TXT1HpA9+xsAe3QRGmbrOVTF9zY6cVfYz2UKG7gwGl5t2x6ub37JBbN+FTzpe8xyp0M5oHPWySOqktpkyIaEJeolt3Hqd7c2TZ9SniWPn6RZw2M6c87pG9iIeSpX6vXn5SgL0BZRPtMgBFCqicFEXxfotGjhkZVuYzMF5bguEPuz0FuuHuMRTsitAQ0uuoDMA9aSIM4r+A7nJ+uF20oS2GtP9fbFTJx0NIxKLFUwh9JVZjcc9BXcKPeLB9lAGYXH4KGpJ/w43d2D88I0ucH4R/UVgCZUhyAWOauNRoUowArodbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN9CSWFulodnbZzhcjZLoujlRBAKwvofz5QCzz8sO+A=;
 b=S9iul72/+uSqsxPlgQw18VC440ZeSQn3grVxBPFWDMTaTiTQU/LQqXIJ1SDE8w2jcZGwBZIXe+Yl78KW9iO9CG2y1gonX6Ez0NS2f7Phl8BpZzZXiVtm9uhF7fHCudXyIVwOlSyqPupgZo37gFlCyvqOe2JQGWZYj7EVoK228UwqBN8hq15BX8WVAeoe7xWRkFMwqfNS4El0XiBc6Cm2yMCEOJZ/oixyNQpPM0Y9IWCZitVE3K989QMS1Tq6rR4YO7PTUfoYsanz+HFg48OiEAbTdZFaId4egF39e0IAegYRSqptgZnkUX4OeCC+R/OtfSJVphCaqbAgdweL88ecUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 04:16:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 04:16:39 +0000
Message-ID: <6181c1ba-d0e5-48b6-9474-956984aae8db@nvidia.com>
Date: Wed, 4 Feb 2026 20:16:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for multi-GPU
 systems
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260205041120.127106-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260205041120.127106-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e7185c-42c6-4cfd-b064-08de646d5bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YURFbWNnczQ5MXRobTdKd2p6SXliK1dnTjREMWZXV3dkVmxZME45b0RTUFNL?=
 =?utf-8?B?M2VISVRnTDVVN3JuL092cnJyOTJRby9QcWlHR2pVMEtiWHl5ckdEZVFIOVVS?=
 =?utf-8?B?N1gwUDZyS3RBQUptMlh1Rm5wdDZ2SDJBb0FEUGZidlZpcEU0Qk5zMHRaZ3Nw?=
 =?utf-8?B?aEZBS3FVVUNySWVvYUw4Mit1Ym1MOGovYmFjMHJsNFRKY1pnZDJlakltNi9o?=
 =?utf-8?B?TExRSEJNTHpiK245emF4TEdacVFTZEpuRWs1Q0RYT3pvTHFoSSt5M0NuQURF?=
 =?utf-8?B?Q1lCUVNvVlV5R3pWRTU2L0g5aVNVVEtLaE14WFIwNzZvcEozdkJNZFdaVW1r?=
 =?utf-8?B?RlBKS0ppR2t3eGlhOUFRdkx2Y1hzZjFRdyt1dWwwVVJvRVorbGZFb3daSFFL?=
 =?utf-8?B?NllYbmJJMndOVDR3elc1cWdRMUNVNkFYV0RRR0JseEJwMk04NEpjeUhXWjdO?=
 =?utf-8?B?SjNtcks1YVRub2NSR0E1dmovM3puM3NyeHRRdXNJdS9zbGxpc1I0aGZpVFhF?=
 =?utf-8?B?dC9uMXpoVUd6alUxQnlyNCs4SXN5OGk0TlFGYSt1YktEQzdzY1FYT1p0eGla?=
 =?utf-8?B?OXhnOHA3QUtBZ09LQnlHOTFzek5RRWh2WEl1Zzd5N0FjbjdWeEVmRGVDd0wr?=
 =?utf-8?B?MVdXS3JWM0UxN2diTDA1QUR4WWtGZ2l4SnQyeTZ4L29LRXArQ0w0ZG9NelRZ?=
 =?utf-8?B?RGw4d2xRaVJHYStHVXJRT2RPTkV0aGU0dmc3REY5SW1sMTdTei9iV2pTMkdT?=
 =?utf-8?B?Nkp3QXJEV1g4M25FU24xdyt2TTFRNzIwVXZ6OERheEN2ZVVzRmgrUXNoRExq?=
 =?utf-8?B?SWIwSlkwMGdQaFJOMmNpQkRhNzN6bjdIYmc3enRDaXM1bUxFK3VXN2Z1Ylpl?=
 =?utf-8?B?TDY0TzNteGNZTy9wbit4TDRpcUl3ZklmTUlPRldDZzY1MDh2b3NJNlFZQnVG?=
 =?utf-8?B?UUdoRVNWNm5wYit1NXhtbFVycUJUSkhiMVBMYk4yL0FobjVFOGppV1huNmQx?=
 =?utf-8?B?T2VhVEZXTHUzMFNDQ1JBckUzMTZ3VDhsRFpocERVbWtqY1RpSGoyYm05a0lS?=
 =?utf-8?B?TW5kcTV5bFk2WHZoZ2pXMTJTTXQ5dlhkZnFPOTFJWjFlUHd6UHdSVEdCWHRS?=
 =?utf-8?B?ZlJJVTBMOUlYYTExRmthNjVQTnhLc1U0UkE5cXJmWm5YOVgvV1RDUkR2ejU4?=
 =?utf-8?B?ZXliYlkwVmtzM1BiRGxjZURsNmFOZzFiWUF1dS9nT00zaUtlTVQzQlowOVYx?=
 =?utf-8?B?Q0owVno4Qm9OdlQ4cUYzWWFJZU1QaHkrUCtzMkM1aENlTG56N2hITHBQZWdt?=
 =?utf-8?B?aDhyU2Focm1zcVZTQzdnTnIraWhQTnhUMHJKWWVVUTN5dVF6bjNYQktjaUMw?=
 =?utf-8?B?ajFnSHkzWUZyRC95eXZxd0ZNUkZZTVVTN3ZHalN2c0Y1dXUxT2d6MDFlSHlq?=
 =?utf-8?B?OGNsek1WbHorMG1lY0xQR3h1RzFsTStYM2dzOHE3aUtKUjBqU0NrRWxhNU44?=
 =?utf-8?B?OVdLY1ZtcXlVTTEvMW41bmI2czJWYURpKzhBMGs5cEZzbWQ4bFY4OHg2RmJh?=
 =?utf-8?B?akdkSmpYbzFabUV1aUU1Vm1qR0JBWWU0anpmRkMzeVhQRktWUFppRWxuMTc3?=
 =?utf-8?B?UGE0TGpMbGdnL1hKb3N2eVREeXNZb29QUFNyNEVibmIwZUVxMG9mQnk1MVFm?=
 =?utf-8?B?azBUVU5KN3U4RHRGL09IdFpaS1dRR1ZlZEJlbUV3Q0xCeUVweU1SMVNSV2lE?=
 =?utf-8?B?NFREanJDTE0rQmg2b2xxRGo0NHAzalBoM29GZ3FRcldlMm53bkx4b251TFJ6?=
 =?utf-8?B?clFpaUxuMU1tNmxxa3VZNGVwVFRSdTBpSTdSTHBOSFc2UjRibGxxUWEyS3A5?=
 =?utf-8?B?K3BVam9abmFQaGE2RytHTHRCaklmYUEzUGtpTnFvakx4TmJJTEdsWUdNTVBz?=
 =?utf-8?B?ZzhqYXN4eVoyWU8xb2E1SlRuQ09mQjE1TkdBNWhPS0w0aXFWdnVkbTl5VzZS?=
 =?utf-8?B?dTFEZGZubWQzQys2NnpHYXl2WkNaOFBLTzJaZktSd1JBWWVCSnBqbE02Wkpi?=
 =?utf-8?B?U1hPdW4vQ0NZYW9YS1ZadnNtRW0wMEx5MVdTQlBzQTQwcm5wcXlXMFg0UWNz?=
 =?utf-8?Q?EvG0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5IZ2xNaGRnTFZsbVh6RUdtK0RrNTJNcmF1OU9YeHJvSGIzdSt4S3NSQWlL?=
 =?utf-8?B?Vkw1Z3hJcXFBMGN2d1pSdEdNTlhOd2Q0MWlSTG5UNTUwVXR2VUgvTUJBVUhr?=
 =?utf-8?B?NHA4SFBGVkptTHRXeG9sMzVjT1FZT2lKZWo5ZTZzVjBHMnM4Zit0YzVzL2ph?=
 =?utf-8?B?QVFhQ29YTU9haThJbDFQanhaUHhtUGk2bExzbWpZS3ZYaVBEUmdpaUJUcXFS?=
 =?utf-8?B?Q3JCcHJXSm43QWNlWWFuMGNrSDhwYXpEc1F2ZUZsR2VWWWwyR01Qa0hGRFdV?=
 =?utf-8?B?Qng3VHNGdkpSME1kMkdjQlhpcHdtRXhKcDBaZzZXVUhpc2lST2JuRi96aXFs?=
 =?utf-8?B?WjhmSk9nNDVtUHlLK2JDZmFXSE8zekpUT29NRnVoZ04wRU42Q3N6QUFKWHp5?=
 =?utf-8?B?eHdCRm1rbHFVK203OWxtTG1DWDJ2anMzd0hUYzM3MVVoUVh6MC9PQWtMVW9Z?=
 =?utf-8?B?ZUx6U214SjhTRWM3a2R4T20xc2NrOW1zbmZkTHp1QUhPNkVVc3FFWHdJTldG?=
 =?utf-8?B?UkFMSUhac2pNSGRWcDdPT0w4VjlvdERHdkJPNzVmWG5jaVFwL2YyWm5Ldmxu?=
 =?utf-8?B?WDd6dXBrdUkrVFVVbEE4V3N5T25oYUtMUUQ5Y25YYUphYUlYdXhDWXh6RUtF?=
 =?utf-8?B?Mll6cUM2NmI5c3p5T285WGdCWEhlQ245VGhEeGdUbk5ESmJ5OStVOEFoakVh?=
 =?utf-8?B?cTcramF6elNHaWNnejUrTVpyNVRpM1l1Y205WUlVRnI1WnlibWoyNFBHY01V?=
 =?utf-8?B?K1N0NFpjZzJLbzNhalJJR3ppSFNIckR4azN0OStXMmpzcTRCaGpKaldsT0wr?=
 =?utf-8?B?ZlJLWDZoZkoySlZhSXltbGViWU5QR0E0MkhXd3pXdG0yVTA4Y0c4M2RCS0RP?=
 =?utf-8?B?T1JIQzlWVWNPVTVzVVdNVWprSnlHeWM3R1pPQjkvU1VOZDlUQWZOWFppVzAz?=
 =?utf-8?B?RTNGbEUvcjRmSi9hUit1Q2VmcUlZUHorU2kwcEVNamtpSFRLQVhUcnpoVy8x?=
 =?utf-8?B?VEJnWjBlREN4NXNJWlhqZVRYUmtpS0JpWUV4NUJHdEgzbkJyUFRLRzZTcmJ2?=
 =?utf-8?B?ZXM4K0dKdUxHU3Z2MHlIV1RuZkhzQ0YzdkE5RWQyVmRiUVg2T2VTNUgxaTND?=
 =?utf-8?B?NWswWUpHQWNiSDNiK2J3TmthVlBKUWNwcllRWDdjblFxSkh1bXhmZ1JzbG5x?=
 =?utf-8?B?NTR0dnZBU29XN1RtSXVJV1RSN3czZU5SVHpxaUpKLzJTYU9ra2FJN3dwTUJC?=
 =?utf-8?B?TW5uUFQ2N1pUSDUxcTNzLzMxcnFoWDYvWmxNaW9JTjRKcEMrMHR3K0d3MEZi?=
 =?utf-8?B?ZnFNZmN4aXdiVGZjN1d5MmpGanBKZEdYeE5UbkVVemMwdkIxYTlVaFdkUDNN?=
 =?utf-8?B?VGRTMmo0V1NmZzlQSTQ1L2ZXSU9pd1BZQW96WEVGWFc1R2FGWWtRN0NGMUFk?=
 =?utf-8?B?aXc5eS9XMXJUSEgxNmFzSVJ5VkdFVXU0QWxiS0NmbW04U0lOakJTTGNwQ21Q?=
 =?utf-8?B?djA4Ulc3Mmh6RGcrK0RnSzlKelRJZDh4aWNibHhNbFowVU9tVFp3aXlWdUV0?=
 =?utf-8?B?RnhFUGxNTXZCb01LYUtRcFJWQ2tnSUZaWjV2cTdCWWsvZ3ZweFdtd2ZFS0hz?=
 =?utf-8?B?YnErcXBIZEhCU2VqKzNBdms4L3h6eU9nbWkyMHhSWUQ2dTdmL3ExRFcvQmw0?=
 =?utf-8?B?cEE1SC9JdHI3TVk2QktTSlNTRDAwSE5tUzZiT3VCYXFmVFgwVUxFbEQ5QTVU?=
 =?utf-8?B?elROQWYzNk13MXVvZVQ0VUFhNG1NV0UzTzhVaXN1S3AzZkVLZDVhcDJOVjdw?=
 =?utf-8?B?V0J4anVPaEgyTCtxdnI5SytDVWpFU1pMdmZkQ2JLaEkvOHhFSGd4enMyQ01j?=
 =?utf-8?B?V2MrNjlQdjB1bStYTzYyNUNYQnpLaVA1aHdzZXp3NHNwRlBwVEdRaWVyUThG?=
 =?utf-8?B?VVBGYk1CYUhXRXZ0L2F1VDR1dXFoaGVvYmY3Zk9wN1RCWXFsN3NqVUFtbUVR?=
 =?utf-8?B?UDhaUVJiK1JwWDd0bGlIeU5qK052ZG5xNE5pVmlValJ1RFdyOGZoSVlTWVgv?=
 =?utf-8?B?cC83a1Y0bGJwN2FqSktONE1lbnpXS215Qy9uS0tyV3B3WE5lY2g4Tk9FUDdR?=
 =?utf-8?B?blpSZEFxU1FyL3lxTCtDS0pOTTBjbm0waGlBcUs4YW1memEyYzk3blBtaTNk?=
 =?utf-8?B?a09IbHU4Y2RNbXJEaEo4UHhYc2JjblA0bE1yYzIzR0IxZnNMU3JoREtlNFR2?=
 =?utf-8?B?T1NiTnAraEhleUlJaU5yRUV0TXJLaTNUYkF2UUZmUGFDWTZJWTFQWEg1d1N3?=
 =?utf-8?B?dkc3T2dUM0J2YmhXYkFhd2M4dE4xcmh5VXdXdktwQkU0NVRSTVY5UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e7185c-42c6-4cfd-b064-08de646d5bed
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 04:16:39.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0gxB56fFDaFv0CtbR/BoSZUzOWctlta4YMKtIak5eextx7BHdPnUYIeMCZiUwFGwOJ6+fb6D9b0lWpK0qekrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080

On 2/4/26 8:11 PM, John Hubbard wrote:
> The auxiliary device registration was using a hardcoded ID of 0, which
> caused probe() to fail on multi-GPU systems with:
> 
>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCore.nova-drm.0'
> 
> Fix this by using an atomic counter to generate unique IDs for each
> GPU's aux device registration. The TODO item to eventually use XArray
> for recycling aux device IDs is retained, but for now, this works very
> nicely.
> 
> This has the side effect of making debugfs[1] work on multi-GPU systems.
> 
> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> Hi,
> 
> This is based on today's (Feb 4, 2026) linux-next/master branch.
> 
> thanks,
> John Hubbard
> 
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 5a4cc047bcfc..a542ec0b40fa 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +use core::sync::atomic::{AtomicU32, Ordering};

Somehow the wrong (non-vertical) formatting snuck back into
my patch! Arggh. I'll be glad when rustfmt support for this
can help me catch this.

> +
>  use kernel::{
>      auxiliary,
>      device::Core,
> @@ -19,6 +21,9 @@
>  
>  use crate::gpu::Gpu;
>  
> +/// Counter for generating unique auxiliary device IDs.
> +static AUXILIARY_ID_COUNTER: AtomicU32 = AtomicU32::new(0);
> +
>  #[pin_data]
>  pub(crate) struct NovaCore {
>      #[pin]
> @@ -85,12 +90,17 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
>                  GFP_KERNEL,
>              )?;
>  
> +            // TODO[XARR]: Use XArray for proper ID allocation/recycling; for now we use a simple

I also did *not* mean to leave the word "we" in there.

Lots of little glitches tonight, sorry about those.

thanks,
-- 
John Hubbard

> +            // atomic counter which never recycles IDs. A unique ID is required for multi-GPU
> +            // systems; without it, probe() fails for all but the first GPU.
> +            let aux_id = AUXILIARY_ID_COUNTER.fetch_add(1, Ordering::Relaxed);
> +
>              Ok(try_pin_init!(Self {
>                  gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
>                  _reg <- auxiliary::Registration::new(
>                      pdev.as_ref(),
>                      c"nova-drm",
> -                    0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
> +                    aux_id,
>                      crate::MODULE_NAME
>                  ),
>              }))
> 
> base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726



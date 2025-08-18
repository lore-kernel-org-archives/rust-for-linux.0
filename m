Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058F2326D6E
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519107; cv=fail; b=cRymDziBOfm3Ow2rEQSBkfusy09eRHgxBzQAGuMvPs+6gbxu+H9eC7EfZOa0Wz3D1HVR3WbO/Ol3RZ6p1M2d7lwss3srVGR+zwOcYYT8rFUG/hHXDbTqoVnTxPkLfD2/Qfq1ytoLamX+L1KQz2nshz9/G2IWy7puv5RlhoOMIvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519107; c=relaxed/simple;
	bh=8cNr+6FcRDlsIMU85XB6G3J5ZgsCHX7amt4eEopjbo0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=r+yaoY3pvwnQibj9PX8gip6/8rBtCutZ3eT4NsRjETzWvXHmxhlo/9m649p6jXwNBG2Gh1TESEhPNffgyufOdRHrQS3CaSr/5S2TJUmFQZMP7mE/NPOWVhreK8F4YF5coXvHm/yHbRsJ8iokkrsupUsubmY6zZTcH1sRktolTgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DQ0k3lla; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DQ0k3lla"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h13HW/Ez9hOhGBd3LovSl3hipd37IorTMY1hTQ1549twyft3WtMsc4hm2wcBGcl4wnHQfMmzJP2XtXIBfN1D50a3NrT8YOKe8L17MlqZoYUF2Q4z5TgWa8nfNEb6Ll1fcL8KKSFlDMwOGeRUb4hWnUMmJY3DHZ53JTupRL0+TgQjUsZxii4KjUG8zRaFom6PPnHc23d+Ec4JpxOPa0MvThmVnUyspOhexoH84Ut/ups1DNvYI3KqiPrlFZHH/0RPhoIe9xMMqvK+iU1N3TOurevc53EyEx84plSTIwpP4X4wIstKocXWBXndXbmFSKruLWDscCK2nUJPcv/JmbjRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cNr+6FcRDlsIMU85XB6G3J5ZgsCHX7amt4eEopjbo0=;
 b=VCcHW4eyK+KFjaN4uaPaQT+OzfRdW9CIr4V6Wxr3Uq1hfEre7E/Wl+BCxRLcSpNAUdKvLMr9Q4skMJBfOIrFWKu9snoPqGmk0Wl69luDpG2uWD/XBJLxXGD4wWybOPnaGx3t3fdaBL615Oh2uH0RUrq78KE/Q56YS09z++6Qjs8nX5dcE+oMnkuplAN6D4EajwLhEC55kmQF9Inxg0WAq2/LqCXyxpqf2tS5gngUOKSYwAZp6Vk1VPmjqGITCSx9+MOqL6jtaesEO7siUmdkSqKABEZmHX7grFhIPQrxTnWKVvoTN0HJVIbBc+cNN3ulncS8gskrBnLPSGztVAZAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cNr+6FcRDlsIMU85XB6G3J5ZgsCHX7amt4eEopjbo0=;
 b=DQ0k3llapNNv/0go3IZlZxDrQ8eIIAN0jbywn4DF3fQth3PUUXhiSgxrQdmZyBP7ncDaZmyNakZ+/dVmCmImjjasM2hIHSJUk/DviO53a3aZzcBW6j0obIoCr60Mo2kMXq7q/UKk1Ze5UQ7BoIVZ6oFBuFNLGY5hNJ3ZvScyf3UaU3wn4EdgD2NBp3oaGFH1+MUnplbzKwjP9Vb+0vJMk4T4vSr9L8vskVB69OZDKwBSZmgQ7mh+UTVzhZ+JuZjuPeEHZHQw/ba+7q4jnW+kggFoVn8IAg1YO9HQiBHYMNklVIWjUP0mOVWwfHG8fs5hV07WViZI/Ohkd0CNb9f1ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 12:11:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:11:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 21:11:38 +0900
Message-Id: <DC5JL0C0TFGU.3CK4JLJEN7IYW@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/7] BorrowedPage, AsPageIter and VmallocPageIter
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814093427.19629-1-dakr@kernel.org>
In-Reply-To: <20250814093427.19629-1-dakr@kernel.org>
X-ClientProxiedBy: TYXPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:403:a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 4082013f-febd-4110-4b84-08ddde506408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dllVVHBnOGxZdjJsQTNpYkVFNDFIZ1RaMFhjSWJyYXk2ZmZHY2VVcXk0ZnpW?=
 =?utf-8?B?WVQxS0NDT0VDOHZUVHZzUTJiNTBPMEhlY0dBL2c0RUxmalF4YkcxNHQxTjZx?=
 =?utf-8?B?N005VEtKMGpkWUlGTTlRQkl6ZmIwbDJjV3kvbzF6dUxEUzVMVXhRMm9oY2Rj?=
 =?utf-8?B?bDJBU1h3WlRFUWJ6ZmQ2bGZBOUQzYVQrMlUvdVpkdSs3YTNkbFdvTVpxZnAw?=
 =?utf-8?B?b1VzaHRhcVo4aUUwVWlhOWhFVWh2V0dEakYxeTduUXJERnZlUVBkUUZmVnVS?=
 =?utf-8?B?TTNVVURmQmc1WlFMc0d1dE9NSTBTYlFrclIyYjl2bXVLRjNxOUxlOUl2U2xx?=
 =?utf-8?B?ejN1Z3Z2ZXl1MDVGZzNMRmcxTm5NdHdrRTNLdmxlK0xPVXZ6QkMwWkZjaVFs?=
 =?utf-8?B?dzVhSHN4RXk3WjJyTE96N2ZHYUozWUtDdXJBVlNVRjM3bm1WSU0vRWkzMzl6?=
 =?utf-8?B?YTFlWUdDSUlibnliSTBGSUlOMHcwVThKb2FGelNJeWR5MTgzNGw2YWZ3KzFV?=
 =?utf-8?B?KzlBdWZMb2MyN3RIb1preGFLc0xEMzNjSmd3bHZRM2NxdjgweEUrTTE3MXl0?=
 =?utf-8?B?UlpqRkJiandvdHhmNUV5UGpCekFZZ0Ftb3JpYjZ0azMvcFc5ek1IU1JYTkJt?=
 =?utf-8?B?Qm5JM1g5OFJ0YkdrVlhrVVdycjNvaGt0UTlFZnF5c0lOSTRMSDg4UHk4YXBh?=
 =?utf-8?B?S2s5eGREYkg2YngrMHlJbE11cFlYd203TkswdzNKS0ZwdnJ5WWkvdDg1Z1Bh?=
 =?utf-8?B?SXdlYkh6YVlWWXVOOUVjeCs2KzNVSE0vbDlFdGplSnlzY3R5cEJQcm9nZEhK?=
 =?utf-8?B?UFBxWVNhK1ZZdUQyTkVQWUVlVVhaeE1NRkt4UkkyMzdqK0RhNXQwUThMVzNu?=
 =?utf-8?B?Z2JOQzdVMGpXcTZNRHpUcDh4ZUxQU0dSeC9XNDFwM1NvLzVuUHVFMmQ0cjZO?=
 =?utf-8?B?Q0x3QU1VSklJa2x2ZEtSbW5Ebm03QnM0bjhSOXljeUZxN1lvRzBuamlpdTZr?=
 =?utf-8?B?UEwrV0NDOFFjTkRVZEw4eVB4bHdSTHRETkpYMXQ3YVNPQ2ZYUlg4WlNuM3g1?=
 =?utf-8?B?VkxrVHp0MXNSMk5Ub0RrS2t2N0sxbzUyR3N4ek9OUy9ZK3NlVm8xRUJOUW9R?=
 =?utf-8?B?b2VZVHlsbEpZOU5iNUZ1Y09Ubkt5KzBvck9RUiszZ3VRZEZrMmFtODRBY2xJ?=
 =?utf-8?B?V0F3UWx1WU5kUU16YTVmNUlDZ2UyNHZMRHpHUHRBMkNpNFI5Z0pmY1dvSDJp?=
 =?utf-8?B?NUdiMkJMWER4NHFSeC9BbXoxcERGbmtSNjh2ZUhEakoyS3FieFg0SkdyUWFs?=
 =?utf-8?B?bCtsL2d3TE9BaHRJS0lRMDNvcGdzT0hKZFdjYTZxNnZhQ0UrRVdjVjhrUmNB?=
 =?utf-8?B?UnowU2ZGdmQ1YllWNXptSUFUY2FsNWtwL0pKNGhVbnBtMkU2WWJHYmZEV1NT?=
 =?utf-8?B?Z0Mxc1FUdkVaanNQY05qVG9hTE9xek4zbEV4eFBDWThOVkx3M2FraEV6WHIv?=
 =?utf-8?B?OEpIclRNTU9Sb1A0d2MrNThtWFlxNVdrbjRXUkhMNWxFTm5QT3paREJLZ1lu?=
 =?utf-8?B?bWJBTlpBZ1dTSHVCNk1yRGV4SWJwRHhCeXpMNG9USW4yZ2xMRTNRQ3dCd2Iw?=
 =?utf-8?B?cTJxQU9JR0pxNS9vWTFxK2oxbVJRNTNkeEZ6UFFrSm9UejBSMG1hbzRLNGxE?=
 =?utf-8?B?eXUxMmp0Z2QzYkxOYkN6UjI5ZXF3MDVnWGJoRkl3VEp0dnRHUmkwS3hPTEE0?=
 =?utf-8?B?bXNNUE1wNm9VVjF3MTFxcHdxSWhybkRVdG5HMmdkaEE0UnhDY1ZyeElaVEZO?=
 =?utf-8?B?Y3U2d25RdUtCQ1JIZ053b1RoUWdUTGRuZDRWdFVmYTBmWThxeXVSYjA1OHY4?=
 =?utf-8?B?VFhGRkozcy8yNzFhRlRoRjRLczVDRWFCaitMUy9RYlZ2UXRkY0dPOTI1TTNM?=
 =?utf-8?B?ZFgrNDZKem0vQ3FkbTR4NzBZVFNlVCtEL04yYUFyc2RHeHp0bXA3NkE5bEZT?=
 =?utf-8?B?YStwUnVtYWxRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dklmMk92U0VlUWxDUzlXUk0xNmpDNEx3UzdjVlZvZE14M3hoSGtlUmpVaDk3?=
 =?utf-8?B?d1lRakpOdEgwMHlnSktUcDRuUWsvblBxYkhsL0dCWTdZeVV0WUZKTERJR1Fw?=
 =?utf-8?B?eFVFd1ltL2ZlWDhtS1VteFpSanFRd3VIeTNVNmdQYnhMQWNwNE5VWXlOa2J4?=
 =?utf-8?B?Q1p6cTJvYnYxRjFZR3VrYmxZUktaeEJzSFdhVFBaaXNyOHErZjBUMTFKWitj?=
 =?utf-8?B?cFNSR1JVYmh2MEdsanRPSzdCSHRoTFhzaGE4SGpVeFJzM2FWL1pOYUhUMGtT?=
 =?utf-8?B?MEh4aVZnVWpsdjdUOXdQa1E4WjRBTXprcVlqU2VLTjhNVklXc2ZzOTlhZlBB?=
 =?utf-8?B?ZEwrT0lVKytBOUpibGRyV2hyL2Z2Y0d0V0lZNnllSGN0QUIyY3p6eXo4NExP?=
 =?utf-8?B?ZkQ3UWovL3dqSE1kTGRWNWhQa1grbWY0L1ZXekRWUUdUSlBaaDFSOVY4SDJj?=
 =?utf-8?B?T29NNks1WGtXU1NuampQak5HMkNWNzBIVmZWeDgraDAvMUUxeDR3WTU2Q1lQ?=
 =?utf-8?B?RVFKdm1aQXorK2JkMHpyWmFwV0VBK051ZUd0cndYWnhVc3QzZ2ZFTGRqcmVw?=
 =?utf-8?B?R3o2WmlmSDN1a1oxWjl1MnhsMExvMzlKaEk5L3RJOHk3UExpSnYwMEl1M1B2?=
 =?utf-8?B?MmZUL3ZHMHdaN2hIcmlFdUErSzVTWjNHY0plN3lndmdZNWJoUGhJeS96ZlpC?=
 =?utf-8?B?eTBSVW84WDlhczhiajhmUjF5elhhd3lvSTJEZm15RUhsMFRET2pvYUV2UG9D?=
 =?utf-8?B?cWJrQjJQQU40WW1JOExkc2s0enozN0dzZkFHaXlvRGFsWXpNWHhheXhrZ1BQ?=
 =?utf-8?B?dHlBeVNlWWxMVU9HQ1pQaUFjN2NHSU5sUVRSZEJJY2xUOUpCVXkzaEZnc1RN?=
 =?utf-8?B?bzZIZEtqbUxiNVQ0dkYvbW9KdWtFWER2N3JDTndJYThZVjZwSmN6bUxFdG5m?=
 =?utf-8?B?cThvNFhyWmFhK2ZVOWU1dTdXcEJSV0RSdWYxM1JQY3FEQ1JzbEtBK2R5Y3ZU?=
 =?utf-8?B?U0szaXQrTS9FaVpsZlYwMkoyaVQxM1NMSmZpRWJvQkt1RkJkeG9SZUlZMWxk?=
 =?utf-8?B?YUd4S1BzY0JFc2dPR09PMTcySWM3QmVXaGEyVmdvbXNSZ1NzcHlrclBZenBt?=
 =?utf-8?B?NHJZb2ovd0w1TE81WHY0L3ZXRjlBYkR2TXdQM2xvSStBTnpZbGRWNmdXT2Z0?=
 =?utf-8?B?N3VkZHhRd3JUa2hoNWZBQmtRU2NpUzZUV0tKS3RrWjY1ODhwbE9tMUwzdW1m?=
 =?utf-8?B?YWRxUkR5K1poemNCNGdXU1M4Zi9lbC9GMnFuenpmd2xBdHdIeSsxWlRkRzBB?=
 =?utf-8?B?NXlrakM4UE1yVG54RnhYTkVZRHpocDlLc05pSEFZaGNleG53d1lEODZCVXlS?=
 =?utf-8?B?d0hGMS8wTC9LSjVNOVNibzh3N0lla0pXUjRWYVJncmU5RkxmaG5UWjVqWnlt?=
 =?utf-8?B?QUZmWlE3blRacGhCZGEraTlFNVdyNS9LZGVreDZsZGp5TjBOYnpSNHRIUzBE?=
 =?utf-8?B?WHRFdHVuczNTVCtVYUpnMi9oTXQ1L2pnRGpzeUorM3BIdVJBaXdrNlF2ek42?=
 =?utf-8?B?MmxQeTg2cGZUWnB6TCtiVWZ2V01KdzE3c2cyb1lZVVQrSXUvS2lGWUwxQU9o?=
 =?utf-8?B?azZ6QVpyOTZRUGdPdm91V1hBV1NYLzFycU1zcmd2eUtIU0UvYlVWU0pabSt0?=
 =?utf-8?B?UHJHTndGMit0N3pISm9jUHQ3RkxVeitna25Tejk0dEY1Y2pGZHFjd2hxOEJ4?=
 =?utf-8?B?TWowLzZRWGQvVnJzSi9xdnRIdUU1TlBRWlRqNGsyNUJ2Mk16MytGVzROMGJN?=
 =?utf-8?B?Qm1jUnkyemwwVnU2OG1QdmJoTEM2eWovU3FSWEs5UEVwZ1ZuUnI3Q3Nab2dT?=
 =?utf-8?B?SXd0RGNGeEZvVDBtMmQ1TE5TRlc0cXNtSTBvYnhXRTdaM2pBeW9BK1RsVU5U?=
 =?utf-8?B?UHJuajE1UFpLTG4rLzc2VXJmYkFsZmxPK3o2S0MxWVJNcHQ4dzErSFdXNGp2?=
 =?utf-8?B?VUN1cGRjbnJpNFVoQW9jdDAzd3NuSmxqMVVaQnhucVFDaVpvbHJLN2ZPSnNK?=
 =?utf-8?B?eE5FekRBT1VWWk0xaG1SZ1lGY0N2NUpzZEVLeTNFaVlGYng3eHdMTEhxVUNE?=
 =?utf-8?B?c0d0ckVQZXRIVWxJZkszOEtWc1JMVVVXRGlCa0NiYUZ4UWQ3eUF6R2x2WXBH?=
 =?utf-8?Q?1WjXcdzZZQmxlG9lBfzeym5HBglfa2ZS9lvyavtvBamH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4082013f-febd-4110-4b84-08ddde506408
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:11:41.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkrIMV2nJL/uSp1CsqRno1pjjS2iX6BbOui0MZSq+x6bMyIujH46aVJVK0t+ipgQKIDBLG1v5k6dAWuFIMIHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788

On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
> This patch series implements the BorrowedPage type, the AsPageIter trait =
and
> VmallocPageIter type.
>
> AsPageIter can be implemented by any type that owns pages to allow users =
to
> borrow them through a generic interface.
>
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
>
> Hence, implement AsPageIter for VBox and VVec.
>
> Additionally, implement Vmalloc::to_page() and ArrayLayout::size(), which=
 are
> dependencies of the above.

I have been able to successfully use this patchset with your scatterlist
one in nova-core. Thus, the series

Tested-by: Alexandre Courbot <acourbot@nvidia.com>

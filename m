Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629C35695
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250959; cv=fail; b=ZcpDqD4tbhkVIFK4DpskoHNboasUvk6u/EzRp/t/Dpp8+5NDfvj48Z6xR7zuPA1DaFLKzgo/vkj/o28lWhWeDKRnMT4t6GExoJY5Vyyc2H8PXs6MVAHUZNQ6GKGlpJJUh5/NzlWn/jY3Dr478giIlcB8L2cwfIuuZbVrzYFsr3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250959; c=relaxed/simple;
	bh=rJLyAabIz4CTIKad3qfvA3DnLi2n2byN3eqCLoEbBDc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hGrL5BBq/sDW8cGmccxugrOBh60O4/8l0O9s6LZjzBuri0mOfqMMMEiobgNVdGNScATF/kT2dGHkxCBSEAkmaPsE7wShA/OJ+FbBzi9ILwCX9u6fcWbIabw1nK0k5hHcwoHdJWOcXatjWuohGqVlJA2dHIE86AlwzgaXcxIteUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NYNpfFbR; arc=fail smtp.client-ip=52.101.85.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NYNpfFbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRhdnO/adGCQ45yIzNj8A2twnEKT0ifCqszIhnKX2oXVOmnPK4l+qifB4/v/H+vj9hks1mCM3ErrCxwwOeKnGKCOrBa1x2M1wfwmf6x04r3xyWV+qLAdobNSwpKwTQ8U8o4ZSoFqYdvs7Nwr8vKAmDXbookzoBSF5w1u+/MD9AQuqeg02aWEsArBjj5ZGYTXkbsczzIpqT5zyTflQLdaeVxPxtkXW+OVlm40D4lvqZt98m9bWFdeO/9725FlKC6lLiKYvNQKjXBVTmgc/hY+B0vL0cqZztBUSoWkkK1VDmS3M1DCwgJMFpUnmM0PzTihvjDfcdjI5EbY9qIQIcqIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZW+FFqDt0raBx4YM7WE3hDF8vsHus15RJ4ZWVZSQXI=;
 b=JlV/p5rnB0Uj0PgL66wONbm5sWYkH0RS/aeJXreLe+gDJP2MbhBGoOY3Nf8ncg3SnDaus4GbhoxBfhpkNiWD3qJisGUz98cbEiaVLy0zarNqFOcIg/DEwcRTjH0M2G830IFAsh6dSXIfU6CRpLclPxKmR49Qdje5toC60hG53gYwEZpDQ7yAWpfAUSTfD/sIJE/x9qr2UfBiwNXswz7HBzEI6Ih0mBJtboVau+FouVu7J5IhFa4YgAJaFqpWgBhM2QZfJeKLovSk9ooUHYPr2HNx8D/XToHq+XNdIFZvubzIj6RMfK2pur/xW7b3CvTTbwR2MCRDApLPw2OB7Pkh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZW+FFqDt0raBx4YM7WE3hDF8vsHus15RJ4ZWVZSQXI=;
 b=NYNpfFbREFBLa2ZIM/qkKui1Do/ma06MH7SLJiB0pqsN60k7GC8yTkGdXaur874aiyCZV+SWaJ579VnenB54WzWUeAo08ufv44DYDwFWYuAn2o0IsVh8lf/oqpEyUFVKOsQwyW0qr67RVIDpw5ozRihr38PxAy6sbzcU5KPpOKSP4FaPj+S+mSXZjfodhJLQNKH0ZAnxWiNQLYQ5BTZFmX3+lC3ix5+edeTl7nxFuYU0jp5bapk8NBF9PBxfPpf1o31zWMV98uSWH/UwJRmmWNeS95dKjfwJqV/vxRV0XIfmL4ZP3MU9hEXrGd54CLGIbFtJIzhcDEE4mnpVj/G1vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 13:42:35 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 13:42:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 22:42:31 +0900
Message-Id: <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Brendan Shephard" <bshephar@bne-home.net>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <aliceryhl@google.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aShM9CAyRPe2gYpK@fedora>
In-Reply-To: <aShM9CAyRPe2gYpK@fedora>
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: da056e9e-9d37-43e4-5853-08de2dbad2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3RFODREMEdLUEIyY05kd01leGFibEIycXdNSFdNeTFwS2VhU1d0Z3VJNmNy?=
 =?utf-8?B?aTgrL0ZYUzNTZUMrRlhnRUVSVjRmRjNiUjFVb0FLUDYvZmp1NDFnQk9MUmhR?=
 =?utf-8?B?eXJPQ0xCVlQzNjl2ZjJpb1RCTUNSZHk3dzJIOTZ5UkpzaUV5ZFJ5ZU9xSHdp?=
 =?utf-8?B?UTl1RWJTelRYK1RVNEExR25Xb2VkQytqMmpyMXlNbk5NTUlRSThSUlVaWlhO?=
 =?utf-8?B?UXVXaFR4VndVTHBHQmVaV1NhNlBNUXIxWnpYVkJPQ1dRZTZ6cmZsNnlqS09O?=
 =?utf-8?B?ZS8xKzBmM254c0ZXOTc5c2FHTnVvbWRnVFNKUWQ0QldZN0FKcExmTzcrR3pS?=
 =?utf-8?B?V0xzZkdNMC9qVTdBQUdSOE0vQkEwTTM4TEdUUm9rclZDdSsrU0dYdjZNdzFK?=
 =?utf-8?B?TE1ZYnpXQ0N4ejZ3MWJ6YUN2U0pGN3Qzb2ZERS96WGVZWEE0V1ZxWDZ4c3FJ?=
 =?utf-8?B?QUdZSElwMlRpSjRQUUswLzVKV2ZWdG1CWlMyRm1nL1lRU1dJU0hKcmM4VDNw?=
 =?utf-8?B?WUxTdzRIRzBlK0hPeDBQRDM1N0drNzhuMXRvbVc4M0Z2R2dmOFR5Ryt1QlpS?=
 =?utf-8?B?NnBYTXhwRmlweWhQUTkvcjBURXpBbGdZWmN3ZERUbmNhQlUybDV1bGFHYmwr?=
 =?utf-8?B?M1doSjlwUmZ1c1ZLWGFXMWlaK2kyekxIS2dkbWdnOHN3V21TSGg1bGI0WEUy?=
 =?utf-8?B?V2pURnBpblZLR1ZEYks1alpxTnBadDlsMXh4dkRKRll1Nklvek1LdWJXdVZU?=
 =?utf-8?B?OVBKbGZndDBuTzBURFdxcWVhaEI2dThkMGVDTXNYRHNVVkJEcWdIY1ZzN2hS?=
 =?utf-8?B?TllzbVlUWHAzeDlRNEZoZ0RWUGVIU0tSWkhobWdwc0lQQkxNNnM0bEJHTXRL?=
 =?utf-8?B?TVFFMm1RRXdNdHdlcWJhNE9BcjJrTmFEU0FWQnNmNXN3YU9uSWhRWGErVXRO?=
 =?utf-8?B?eVJJRCtWTW9ZQk9LSlIyOElYZzBqUzJTdXNnTGM0eTBhZ2IzUzExZlR6NU5D?=
 =?utf-8?B?YnV5NElOZEpNREk5Y0IvQVdjV1BrMjZWdVY1NktKRURsc3ZzTWg5a2cvRzNN?=
 =?utf-8?B?VjNyOHVVZUhPUSsrZ1N2My9oaStCR2dTdzBUdGs3c1NXOTF2Y1ZSMmVwWUV1?=
 =?utf-8?B?eHVxNVZjNjNTUWdxcjdDSnZ6bEJUdVJ1cVZxL3dQaE4rbzhRdXVJQmtyR0R3?=
 =?utf-8?B?ZzUxMWJhcFZOamFvR3YvaUpJaThHRnVNdFkxTERRSnlWNFk3MmZicUdDZXJh?=
 =?utf-8?B?Y1FlN1hReW1ZYWo3NW5XZW1JQS9TRzdYczFrNGxjQzYyMGhObmhkbzgxbng0?=
 =?utf-8?B?M0h6RjViaUNYN21XeUNBQmZ6VDZMbFVHR1FPU3BldjcxTkJXVm42alNUMytu?=
 =?utf-8?B?aVRuRm9HdldJajVvdko3YUZzRHB3NDNiTWxyZ0grZkgzQUs3REN2TWNYMG1z?=
 =?utf-8?B?b0VnVDJockhsQ2g3Y3ZnV0JCVXFhV1FxMG12SnRXd3NHT09MM0V0OU5ocjhQ?=
 =?utf-8?B?U0NBa1kxZTk5UDdGRG54MFRkbGhRcVV5Q0RrTW03WFFiMFJ0RnFWeUFqSXp0?=
 =?utf-8?B?UDhzdTQxZE5Ra1U2S1h5ZnQ2OXVzOXFlSjR0UEJhR0gvQVk0SC9vRHNheHVx?=
 =?utf-8?B?a0hwaTFmdnZzeUR3OTNsRUJCNTM1dThnbXJmaFRvQVk3UWpGZHJRYVZuOWJv?=
 =?utf-8?B?QjZ0bVJrdktZdGNJVFRyNnFwSlR0UkZ2bUdsN2RaNG5zQVJUUkF6aWRHTnYv?=
 =?utf-8?B?VUxBcGtOVEVmRWVSV0JOdzZVdDZqUGJDQXcrVFVmOWMrQmdnak9sUXduNEts?=
 =?utf-8?B?aFYyWVNLYWdDa2krS2g4Z0pueUx2SVdkb2NiNHdOM1lkNmFieE5FcmRqVCtp?=
 =?utf-8?B?eE13L2JxVmFxRVlxV3A2WVVSZFNJVXRNdG0rM2l5R1VzdG9hampwdlRpQzZh?=
 =?utf-8?Q?2xPimAw7MazSQBFY1O+kPZ4fk0jB5ZQz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXdlZXltZy9XSmFyWHVFVStzWTNiV0JNcmdQU1B0UjFIWEJONHV4ZzZTT1p4?=
 =?utf-8?B?bFo3K3l2dEVLTkxlZ0xndmdvWG96TG94eFc0ZnlNSS95Z3I3Mm4xRjhQNFdl?=
 =?utf-8?B?eTJEaGYzRmdmQWF2QjR0eWxwWDBOa1VZQkwvVUtkZlhWd21na1VkbFJkcGpo?=
 =?utf-8?B?RnN6UmdSZ0liaGd0Y0d1Q0tQR1lOTFo4eUxVbXllNVowR2tmVVZVeFhUbGhX?=
 =?utf-8?B?aTJpZndham5VQWRERTZXeWtRN203clY4MHJySXc1WmdpeFBGaU1lZERITUtN?=
 =?utf-8?B?N0Y0VlM1Rko0YmlOS1dBVkJxMjlXQ3BvYlRaSVpTYVdkdGthS0VMbEpWa0ky?=
 =?utf-8?B?U1orZjByaHpNSm14aE5icUsva09WUEJ1eTJqS0UvZWl6UjVzelB4TWJvOTNw?=
 =?utf-8?B?aDRoaE5YZUY3SE5JVlFoU2RWRzFBY29VMmJtUGgzZ1lVWEpXeHpLR1pXQjcy?=
 =?utf-8?B?MHNsZmtYRXJicEMwT3g5empJQ0pnNjdxZjRrY1dQOHRrTUcxbkY3WEhuRHMw?=
 =?utf-8?B?WFp6M3pkaXkrZ3UrWTU2MG5GUzQwL1BZMndWYW0xZUxnMjhxcjdPR1lUQ3Vp?=
 =?utf-8?B?UU1ZUm5yNjN2TUoyYlc1SUJoblNTcmppc1FFZTJwV0dJZm85aU84RXdNY3Rv?=
 =?utf-8?B?REd6SkZzd0s1emJZVzg0YTRKRTBYQVNGQWhQMWJXNVFyeGJzL3krNWlRLzR2?=
 =?utf-8?B?NDlPa2FkMEtlZG8yTktGSFRiMmkyR01JN2RSeHZGTWxmSUpXcDhWV3hCT1hK?=
 =?utf-8?B?SklSVHBtb2VqSW1sV1VNL0hWNkpXY0V3N3R6eWcweTR6T3g2K1dDWEFmZHZh?=
 =?utf-8?B?QXl4cktBQVUwOEZ0REoyOE5nSkdEb1I4ZERjSG5oTkREYU1NS3ZaUlpIQUN1?=
 =?utf-8?B?NEg0ZVpWdkoraXRhTFRtRWdvRVJMNnNVbW4wUFBnU1k0RDN4b0QzcGRQeTlO?=
 =?utf-8?B?NlE3WHJXR1NIMXFWVEN2TGo2TFlQWU90SHZjWVRNTHUvdk5SSXYxR20vYWV2?=
 =?utf-8?B?OGU1Zis1SzVEZTdOZEE2MmlGZFl2WVd1SHN3VmdjZWpzdzlxQVNDbEFRL1M3?=
 =?utf-8?B?RnppSDR5K3ZjUVJpYXZ5NTRncDlBSnNKU2k3YmpSbWJkRGNMMWVKaml2VUVI?=
 =?utf-8?B?QnV1M0JnRG8raEhOdyswb3J3SE9sRTloN0Rmai9QMWN6ZFcvaHBLZ2NZdlhI?=
 =?utf-8?B?QjhoN2gzeWtVaGJ3emU5cmV0a2RyOWU0YkIrYWlMSzlxWCtibmR0MGdOUytH?=
 =?utf-8?B?YzN6dWFHOUZ0UjhoOEtSSTFzWkRiT0p5cEFWNGdxdForaEw4ZE5mdmRrb2sv?=
 =?utf-8?B?dERqZ3hJRzMwWlNWVExCSWQwUG5TYytyN0UrbXIvNm5Oc3BWdXJpUGZ3cDBW?=
 =?utf-8?B?TDRSS005YVRneUYwNlh4TWg0MkdReElyNXdqZGU3dE11b1ZJaFY1VWs5MndP?=
 =?utf-8?B?a0xxQ3VNbi91Wkp6ZmFja2FwQzJpOTJPYWlnTXZhblBKMWozT3ErbFpOY3N2?=
 =?utf-8?B?TWRycy9MeHdOZGpiUlRMWmphYTVWM1FZdHVtMWRxYitVM3lvWUQrQmZocXNP?=
 =?utf-8?B?TmIrK3ZGUXB3RTB2OUp6R2dENktBRHJ4THh3bnc4ektPWnNRQ0dDenJoVGMz?=
 =?utf-8?B?NTc5SmtENkVCbHFDY0NTSklzZWJTWXBqeVpkQVBvaXpvWW9pRDdKeUQwdEd1?=
 =?utf-8?B?NVhJZnFrVU5jS3Qxb1YxdXRHbVJ2MDA1RHNmVFovbUdtaUhNZUdpNWdCNUZi?=
 =?utf-8?B?NWFYaCtwUmdOWSsrMytDWTgwNDZXalR2K243ak1PcVNNbEZ1cDltRmtCSFlV?=
 =?utf-8?B?Sjg4TnZMSjV5Ym14RDNES09rb2tGS2xYK3dDVVBmQlpUNjBGVTE5cXEvSVd6?=
 =?utf-8?B?QmlOS3hjNmc4M0RvcGVYc0VQNlNTQVphM29WZUE0d0FpaHFWaGxqaUJsdjBu?=
 =?utf-8?B?TXdNdjluOGpwVCtnMHJTMklKWklUbjFEcXc4U0Fmcm10UzZiVWMxaEp3YitW?=
 =?utf-8?B?cDhNZlFRTXRteVU3R1piWnB1VWRYRHV0dnU0RmVkNm8yNEZ5RC9SU2R3c3pY?=
 =?utf-8?B?N050S1ZCWk9ERTJkSmczYnlSVVU0dDJjWDVuMCtZWHBZK212QXF2eHRwME01?=
 =?utf-8?B?YTU4OEExYng5dkxXY2kwUUVveG1PN1B6SkhFRjlDcENLRE04ZzFIVFpNYjhF?=
 =?utf-8?Q?CDQWerzgfslr31Mzb3MdlFFY/HZsBU9QImIf9PMosx9+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da056e9e-9d37-43e4-5853-08de2dbad2ac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:42:35.6256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ4pXwqfQX0qud38cfSlW2RknRvRM2y4a/gUhxS2JZz2FlTtFSok/UQzkIobm7P8aWOf2+977GbJKzpBD+zKRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

On Thu Nov 27, 2025 at 10:07 PM JST, Brendan Shephard wrote:
> Changed page_align() to return Option<usize> which allows for validation

Please use imperative style as per the patch submission guidelines:
"Change page_align() ...".

https://docs.kernel.org/process/submitting-patches.html

> of the provided addr value. This ensures that any value that is provided
> within one PAGE_SIZE of usize::MAX will not panic and instead page_align
> will return None.
>
> Callers of page_align() should raise a EINVAL when they receive None
> from page_align().

Callers will return the error that is relevant to them. :) This
sentence is not needed.

>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
>  rust/kernel/page.rs | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..b78473b67003 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -26,13 +26,12 @@
>  pub const PAGE_MASK: usize =3D !(PAGE_SIZE - 1);
>
>  /// Round up the given number to the next multiple of [`PAGE_SIZE`].
> -///
> -/// It is incorrect to pass an address where the next multiple of [`PAGE=
_SIZE`] doesn't fit in a
> -/// [`usize`].
> -pub const fn page_align(addr: usize) -> usize {
> -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow s=
anitizers in the wrong
> -    // cases.
> -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> +/// Return None in cases where the next multiple of [`PAGE_SIZE`] would =
overflow a [`usize`]

You can doclink to [`None`].

Nit: dot at end of sentence missing.

> +pub const fn page_align(addr: usize) -> Option<usize> {
> +    if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
> +        return Some(sum & PAGE_MASK);
> +    }
> +    None

A more idiomatic way to do this:

    addr.checked_add(PAGE_SIZE - 1).map(|sum| sum & PAGE_MASK)


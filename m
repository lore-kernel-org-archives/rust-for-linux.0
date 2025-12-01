Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B6E42AA9
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 03:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764559790; cv=fail; b=GHS4F5C4iVruzImxhcW76CLfQqJ+qGNnE/7Kb9cpwyPMP0Ww6ZAQvOG9xXXJyvNiVmvMiDLd8SjWVZy2LjZywzwgtyurAmeGrVcPKa9Nekccqi5bIP8KkjqEQYeKOUKRGwxpSTJbxHBfKhG7jEv//OkL+WrupH+oM3lEfAF/azc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764559790; c=relaxed/simple;
	bh=FvlIJbH86KsQ9yVEyE06e+CMppfQnSVVyUqmg/eu05I=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=tQ2oBTCsJM0pJ4W7cY4pujws5WxaNp1Zui7MdToyRzDxnKt97UWXEZRNFzQ+etkpSH+wY16U3eiA/4IeNJrUFs50Ct37OXWz4InKau7FAfV0eqc19vhzL6VQ7Ypx13e7sjffBUFMvkLqCncAcYaA5sj3yGDp3JZKKkkVEXpllTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S3KtUSDU; arc=fail smtp.client-ip=40.93.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S3KtUSDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXxMh8fMV80+n2H9PcmnLgHREYSYZyRzah/0iRu95sucT0g0OR+1DryH33BMn1raZfv6SOZhJXE6LFWcKOyhD+GN4et4EZzUefdtYfwMP6qjxq7S674eOfIxshtcBPhi7Div6ZD6ZexAm8xmOQQAQln7qbD3knKOEDTMgzcARB42FjXqWDRMua6DVUxRJPRpsvbKtn7653KEUQ/6xcswfUh8EhlYmopjFlSPUF7XoBOpK/xagoIujQWHtVM17HzTmfFgPw29mcYr7ViPuG4EhXzhrHg+kHdsKwr99OAuzJeRLYN95wq72iAp0MyUesAx4uUDmIZKOkos6pxW7ZLRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvlIJbH86KsQ9yVEyE06e+CMppfQnSVVyUqmg/eu05I=;
 b=JXjvqqDuKSwJh1DhHpH1yDOgmNDCv9tSbqBdSOL0LaWLlEJuCCVayMy7oDeo3OA8lglnPg4BQOnqYPAGOMeHCnDYWBpLO/fTbftGbXC+delDWqqAGHhZ/3i8lHa5jjrnVRT3whAGkv1EAcgPZZfFYvacbWjDpvcMCdIHtTOcFRxRCdOE+VIHImmi4z7TR+zUuO1fPROdrZIDkID3szTo+sZejeNQoVGoPOW0/0cXBkuZT0UMq3nOg51iDzT3kXKh1iKKBQPTELMHh19ad4tOKvQqXKwiU612Xg0SFgC+CmlXpLemeC6kg2MHsxj1Z//H6qnJjf3EbX7jUwMyIfho7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvlIJbH86KsQ9yVEyE06e+CMppfQnSVVyUqmg/eu05I=;
 b=S3KtUSDU0lFcNMSVf6THDxuk5oQo3ucXhl1f/iQsQ2GH4nzdU1rUYQEbfFLzHPu+ZacijLMNUDFO7N+rhM0k+Hs4S3D9Ly4vS6w9nQ3WJGMWLc7sL4zUG6ik4D7yQ9XxFJWwkOpU+3m9mvnMZR+wSDo6ULBx01a1wCR42tcCk/919+dL2PqOSzbarYBpNZfQyp3PhE2tGtIdso2SqeFxD3czDAIms4di2tdXlLxRE/JRp/VDnFGOmbLp9zHWpxtQn/2RS310f87yd44Z7V+SLJsC/XltdjTPnxNE4ybPyXDfgsCW8mLz3noqIb2bxGxR8cbwX0zKYpyzmb3ysqRrag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:29:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:29:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 12:29:39 +0900
Message-Id: <DEMK8K1I3FFY.27ERA2LKI7MYB@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Peter Novak" <seimun018r@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: use consistent backtick formatting for NULL in
 docs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251130211233.367946-1-seimun018r@gmail.com>
In-Reply-To: <20251130211233.367946-1-seimun018r@gmail.com>
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: b5851288-b069-4e65-295b-08de3089de64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGpBLzk0dHNNd1JZalRTOVlaTWN0YmxKbE1weVZVeGxSYUo5aVA0SXVQUUh4?=
 =?utf-8?B?N2c1eTl0R0ltRkhjSkNzUFZxWkJ0TS9lYVJVN1ZIQVpjK2IzRFJoNklUTE92?=
 =?utf-8?B?bG8vU1laT2VlR2xINitvK0tYVEhUdTg4bndwNDFRa3Jhc2lzaDJMOTgxc04w?=
 =?utf-8?B?d2xwWlU0SUd4QmJoS1Q2clRSOXZwZHNtSVRtNlpTWGpaNW9XTG9CMFROdStv?=
 =?utf-8?B?Z05Ud0pGV0pWRDg0NWQrY2pGeE0zWDlKYzVnSzUvZERQYzZBd3gra3ZzUHBa?=
 =?utf-8?B?d3Q0ck9IYVFxVklQTG0xNGZKMFNaOTVPLzhxRm1LME5zN2gzbnJjWlVIRVp1?=
 =?utf-8?B?cENNQkJDb2xBZUdRTlJHUGQxMUtoT2NRTThGdkpUd2ZBVlh1endOVVk2ZjlD?=
 =?utf-8?B?KzlrSnNvU3VJRURkbWtFeWxVM3J4eU8rcXZpYlpKSDhHR2xRbUdZeHVpZXc3?=
 =?utf-8?B?dE9oeDJBTjYyTkcrTHAxaTBCMXhXYW5uejBXc2VXN25YclNHTDZXNnRIR0RG?=
 =?utf-8?B?a2NDWGxVQ3p4V2lHUmt6a1hxKzRPWE9pRjBwNEJwRzFZcWdEdjUwVWRFR2tn?=
 =?utf-8?B?aDMxTERaQnBqaG9nMEdQNWpxcUFKR29tTld1VmhRTlRsRkVLT05hWEFnMXdT?=
 =?utf-8?B?TWtPT09GNHAxY3lYSk9UVnI2UFMzSjlNSTVNTHRwaERUL05jOHFHWm1ZSnJQ?=
 =?utf-8?B?U1VBUkRqVk1JZFRRRVRIS0wyWGEyYWlPWldqbTFOMUJLWjMyNzE3OTJ4OUdt?=
 =?utf-8?B?WnR3VEplcGRtVWpsVU1OZE04ZTNCNW44bXpxZkVHQVl2N2RURXRCOEVxRE9E?=
 =?utf-8?B?WFQxbitxdjhFczJkK2Nza3E0cFowc24wd2xTRWJLazBhdzBoR1ZsRGlHbFRG?=
 =?utf-8?B?TGJUWEdoSUwyOC91MWhLWkZWbnpuOU9KZTdDMGREeGkxWlY1TzJUMHNkMUxW?=
 =?utf-8?B?UHppRjFLMThwdE53OU5wUHZpelVObXBvdzVFRFhPZElQRnBqdjhjYThjSXZC?=
 =?utf-8?B?Y0Q2c2NkakRSODg1UVd0NzRnQVRyRnplNW5MVHducnFadXJXbGR4enE3d3RW?=
 =?utf-8?B?Mkc1bXp4Zko1Rk5NYjYvRVpNM21GdkNyNVp4WXovVE1RZitERW1lQnBGVERS?=
 =?utf-8?B?S0MzQTJ5N1l3YkRqaytkK3BrZjVZbU1CVWdsaTUrREpHU2VyWXIwZHp6NFVm?=
 =?utf-8?B?VFFXY1M1c2NqRnpQbGJmK0VqeXIvVjRvVjNMRll0Ynk4L1JqbzNycUtpTSs0?=
 =?utf-8?B?QjJoVmdnVEF2a29OajJCYkhvUXZFMlhkcDdCTnlReU9yajVXM2xBckh6cEs0?=
 =?utf-8?B?aXB3N2lZYk82Zks2aUhsbEZXalpVTEQ5ejFxRDFFZ1hTcXJkN1VvdCtrZmVP?=
 =?utf-8?B?WlcveFNHNlUyTHd5SFdsQ0Y3U0txcDVwMm9rVThFcFJKdHRFUzhwbjU4OWcx?=
 =?utf-8?B?T1hHblF3a3hWRDdhOFVidUcrVUoyY05Ga1dweUFLMDl1TVZuRGVtUlRSNWxR?=
 =?utf-8?B?cXdPdVF4eGo1WWt1VHJGMi9iTURLMGdDZzlPSURwa212ek52dUQvVjFaOEJM?=
 =?utf-8?B?RUE0VGMwVWhNcUVla1Q1dDFoWmw1ZVc1N09hbHFFUFMzdERmWTN1U3o1M2JP?=
 =?utf-8?B?OWRpOUdJN3lOZXloV1pvZlJzNyt6SXIvMWhBM1BQRnNBcmtMbHdrdXNmSEFN?=
 =?utf-8?B?NzYrMzZrQUgyQnEvbkxkWHYxeG5QaWRtTVlkckI5YWlZMVZjM3MzeWNUOWlu?=
 =?utf-8?B?Mkg2SDJScFByS2NQMENrVnlZWWQrZUNqWW4rbDZpUGcxZlF0aG1hVEpPd3pn?=
 =?utf-8?B?eFAwTHFIQmxKbWNSclNHNFMxSzVPZlA4dEZKcjM5TS9kYmk1YUtkcGdtTWhF?=
 =?utf-8?B?T0c4RTA3UXBXZzY0dVozZHVjYnh5OThBREUwNkorWUhLS01mL01pZVo2b1FL?=
 =?utf-8?B?ZVdFU2JndThsU3dBd1AzWTJSTVE5TWN1RmxlRnVYVkswMlp6Y2pVc3FlUGQr?=
 =?utf-8?B?Q1lKRC9UVVp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWZRMFV3bDFjd3l5dER6Y1BNMkpjWnowcWVYM1NwQTdodWcvUlZINk9helJJ?=
 =?utf-8?B?UlhPLzJaWHJ4MDZubjhLd2dwRjNGdFZwRUEvaXNBdzc4b0E3RlhSMHlZQTht?=
 =?utf-8?B?d1dEbjY2VVhSRkkzVDFWV0JuSGtNaEEzWUFQaWVhMEIxdk8zbU51ZTdzYTFr?=
 =?utf-8?B?ZFhtMEk2L3pJdXR6YVdvU0p3dk1KMTBHb0ROclo1R2xtbS83b1Q2dGZMYWhx?=
 =?utf-8?B?SnpqOTNGNE5zc3BsbHhZMkMvWGtQUGF6cEVPVDA4NnpRQXZ6QWI2VGM1N2pY?=
 =?utf-8?B?K1dFcUtPbnNYRXpKanNnQTJwWWg2WTdkL1FoZWhwMVVHWHczZ21aYVJpVVg2?=
 =?utf-8?B?UXNyNHZuZlVEdDRodlRWcGdJeUhUQjJ2bUlTMksyWDBFZmdISmN4aUxQMEtO?=
 =?utf-8?B?MHVXSXNPaVZuL25EUXEwQmJwM1BRN045dFFFZjZMMTdhaTlCRU5pdFE3WXFa?=
 =?utf-8?B?YWtKWkpVck54L0FmY0V1MldtN000eklYM1JsczAzOGd4bjJkcjRuOHpNSE56?=
 =?utf-8?B?NC9JRllGSDZRTzF6OVNiZ3NKRXhLb0xLT1IvdU9kNGdTMWwwckVaeVRReHV0?=
 =?utf-8?B?dGhJZTlBRHRiNWRocjJWNWxOcHNJQitxY3RGSU1SOGhSMHdhOW5kR2lPTmMx?=
 =?utf-8?B?TjZQNi9pTk5GUnRYZldGeDBrN2xUaTRUOW5JdUluSkVacGJOWWU0REtJSTha?=
 =?utf-8?B?SllycGoxSEZjWGRDZElWMHV4cWhWZVloa0lsN3dQTDZ2S3pQVUpmeXFkaEox?=
 =?utf-8?B?a3JIRkZUNVAyTGhHME1tcm8xSEZBMTJtdW4wc2k5QVk0UUszVVF0NnRoempH?=
 =?utf-8?B?bjBtRTZVMWcvM0EvUWZGY2ovemVudlJ0SDd5eWRsRm5FVldHL0dMRE8yWVZ1?=
 =?utf-8?B?VkFLN0NBYlBQRVgvdlJnSURGVUUrMkZkK05GbFZndmYrUFJnR2JvdjhXVUtj?=
 =?utf-8?B?eENueERPYmcxMHRSdDgyL1VmOGRtVFMwb09oVFpmVE4yK3dncUR4eithZkJa?=
 =?utf-8?B?T0kxTWt6NFVEYnh3cDNTWG1namxiODc4UncwK1RUQXNNK3E5QVB4QTR1Qk13?=
 =?utf-8?B?aXBoTm5Wd21CdFVtbnJhYmtocUZzR2tqei9jci9TZ1huYzJCbUFOU3hQRHVq?=
 =?utf-8?B?T3NjM1dTTmxQR3FoYUh3b3JGa2pDWk9wQkxLTU5hb0F4b2x3KzRDQ0dhcnQ4?=
 =?utf-8?B?L1ZlVmIvREJMN1cyVnVZcXdSK2pUSTFheWQ0REM2b3pkVWV3VTNyb1FtU25y?=
 =?utf-8?B?ZTdJY0xJcEdpQjYzbmplS21iNmtqaWxueHdYTkZwWVF3dXVPS0lKb2lBOEow?=
 =?utf-8?B?NmhkamJBOURZTWhWaWx0Y1QxVzUwaXptc1VJQ0djUWtCdVR3eFVac1BaVWRy?=
 =?utf-8?B?Y0plbmFLVGQwSzBZbDBJYWQ5a0MwY3pMZnVyVUVzSUtqcFNBM1luOURUcmZ0?=
 =?utf-8?B?TElKa0hCYnhraEpTdzUrVXNmUVFUSjBqeHllRzJnUjg2THc3eDVjWFlERWJJ?=
 =?utf-8?B?eG1mUlppK1k4UlFoMHZuMFlXOFliaFNMZ2hqSW1adlE3dVB3RHdTWlUwYWtq?=
 =?utf-8?B?TzhDeUFpZkorZ2VGYTIzZzNOQjZVNFFTUmRKM1ZwU2o4RzNzajJ5Z1M2N1Rt?=
 =?utf-8?B?NUhCaG5vc09jRkVaRkFkbTJsaFUrNjVOL0RXR0hDQW42a2xncitHYTNqY285?=
 =?utf-8?B?a3FBeXpUKy9QMmtycjNHMG1CdlROSnBFT05iQnNXZ0NqNjIzOHRCZkhlVzd3?=
 =?utf-8?B?VGl4cmFVSGlTdUpXRDJyS1lEZmZLQ1AzOG9oczArWVlncU90bVNJN3RBTU82?=
 =?utf-8?B?c3ZEeUMwczFkNXJaNFdrVGVYNVcyam9ETnUvaHp6c1lweFBuUnE1a1pGY25F?=
 =?utf-8?B?UlF4MlZSSytyQ1pLckYzNlhkcFJOUWNoaFc4UW1IdUU4aWNCcEJ6SnU0dFFz?=
 =?utf-8?B?MjNqaGFnMzRiK1Q1dS9FZ1ZaY21tOEdyZFFTNGozVGlSSjNBSGh2UjZzcVZJ?=
 =?utf-8?B?bENmd1ltdk9jMUJ6ZnQ2MXlPK0phdU1DckZET0Erd2loOHJNQXdxRTRlbjgy?=
 =?utf-8?B?aUFodjhQeldGcWNkbFJLaCtjbWd2M2FuelhXODNtSTZWdFN0bmZqOVBhNnpw?=
 =?utf-8?B?bVVpcVVuaWgvOU42V2FYVldmNkxQVVg4ekhFQVArZkF6QysraGtBQjg1UkVo?=
 =?utf-8?Q?4MDO2bbSCZUOTmZXgNx1Sy9X1Jm/urN8+2TTb1eolS3u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5851288-b069-4e65-295b-08de3089de64
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 03:29:44.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeBT8Jao8cvb0es7TUEdS8ukChE2UAcTeIS5tAc+0qvFiHe2xJy3LebbmGggxHABbBeBx+WWQfx1Of2VL4iPCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

On Mon Dec 1, 2025 at 6:12 AM JST, Peter Novak wrote:
> Some doc comments use `NULL` while others use plain NULL.
> This patch makes it consistent by adding backticks everywhere,
> matching the majority of existing usage.
>
> This is my first kernel patch - just getting familiar with
> the contribution process.
>
> Signed-off-by: Peter Novak <seimun018r@gmail.com>

This looks like a pretty good first patch! :)=20

Just make sure to put the meta-comments (the "This is my first kernel
patch" sentence) below a `---` line so they don't get picked up in the
git log. See [1] for an example.

With that sentence removed (which I believe will be done when applying
if no other fixes are required),

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

I have double-checked with `rg '\/\/\/.*NULL'` from the `rust` directory
and this indeed appears to address all cases.

[1] https://lore.kernel.org/rust-for-linux/20251124-bounded_fix-v1-1-d8e34e=
1c727f@nvidia.com/

Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0031A56D
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715155; cv=fail; b=nVYWgL1Z5Ju4/pKrWVbu/9l0dVHlY7fzTykkWT6HWrehD4TbEsC0pL7zsesqGG3Y6Y7EwxRcJfPmWQ86r518Nxm9Rsmm5/H5G8Cii7D9sxLm9XyC8K4dI22bpCrHXIrzFJpCz7CtxoLMwAc3umiV9nYz/dZtnXmHRgS6ASsuuto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715155; c=relaxed/simple;
	bh=lgT/8yz3OGNLObdsrG6ZXcwEdV7QIwxBMQmqTzz6HrI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=W0FjeeI9/6yIScbmr9wHYxye71vm1rlG0OmXrXys0RrGFBIPXGQwP4ci3fcgiXBbbThumdPjeYawYrQfRTXpUbMWi24LLLEWr0bztjeraXr1t4aVvI7Ky79YLI268IqBNDFkWJS9/XNT+3LbK4CTf5NrNqUqbYBMDEcvgv/ZgZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=adDh4u8Q; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="adDh4u8Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKeOFXEaxXtApFyLpjE9m64a+6/OOhtUl1MtzCDRabq3Tgl9pik1QdxckxBN3K7pi8SmTIAwcURiuWzMIpzK9d4kPGCEFvyqd4biJlrPxab/OuokuX7T36MZivv5ysmJ8YPy11zeUSU5er/E1XXWY3jbnYnsAZNW+uysarjzMRr4+QKYWBvh0S/KGL6B4JKMMJZGzGxC7EdrMMiwiUzJNf360mc2r2JaX2UIFrDLhNOKKwkiP7tCsdoy7lMyFf1ldf1PMhKV4NoCnkfpZJu6zgnDNZE+ebrBAJVff62FmU1bhCjmxXH94eOdV8sKCArQ19QZpjJ7S7nusGiMuXgh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgT/8yz3OGNLObdsrG6ZXcwEdV7QIwxBMQmqTzz6HrI=;
 b=KOy8hfIkAiN5IRFoU+Okyr6IktRlm5mzHu03rjBH9wp3InvnuYuL3fhTyNU+O7TfPLb1wVuwLBPYhL5niB5yWcXaDoFNwgDY5gGofiE/z3N3ei3/rx+go/TRQh04x/l3toahYs40RA1jOt4nEgKI7lXYYm+yjd9MWNn1UZ9YaoUrervS8vdf5v7Rs+LQAJFgSUs0ExB5UK1/YVdbdBfA+lm8zJUETMs2vS4xvCpZQX5A8mFhigtyiBhTUlkw2CUXb56w+MmQLPuYLqnyWV8LHR26+33ceVZHa4/xo3PrPU8AgkhzJStk40ZPEU8xvec8o1s634M5/TVRX7QnatAlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgT/8yz3OGNLObdsrG6ZXcwEdV7QIwxBMQmqTzz6HrI=;
 b=adDh4u8Qv1G4Gbzm+8DfHiob4v2igMA8/kUraodFXMT7AcUq4s3y/BfGZeiuqItk2n9lSyD9dbX28vtfuyQe/27NtHV8RUuLDpHHx11Q4q9+FhiTJBOUXbJBI8p/sqiF3eLuUS6veCvNJvacdlfFigu02EKnImIAnKQ7n7a/pdX3fBrGlOpDVypRl0/aM0BWiBrlUOhRJ0hbw4Bg81WCviL1S5pfl7w0xIBe2/drRvSpGXE1ywpRzjhuCwpw5byy0UqRU8QE2xb87f/jwrHEf1vT1hVYpCmDDgF0gLIrJE77SDI9l1V0EDQane1a6dosu12Z4DMH8cFsRnIsNLzJaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:45:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0315.008; Fri, 14 Aug 2026
 13:45:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 22:45:43 +0900
Message-Id: <DKOPNPML7DW0.2XL1WMCACTTLW@nvidia.com>
To: "Younes Akhouayri" <git@younes.io>
Cc: "Rust For Linux" <rust-for-linux@vger.kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Ojeda" <ojeda@kernel.org>, "Yu Whisper Personal"
 <yu.whisper.personal@gmail.com>
Subject: Re: From<bool> and Bounded's invariant for signed N = 1
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <OzuVxu0--J-9@younes.io> <DKNU5IBDCA44.28C93KM4IQS44@nvidia.com>
 <OzwfgEC--F-9@younes.io>
In-Reply-To: <OzwfgEC--F-9@younes.io>
X-ClientProxiedBy: OSTP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:225::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 452c1245-884e-422e-27b5-08defa0a58aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10070799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ROeh9uQd2v7LJ48BvqbzKv2WFlaKnrx3mXqs6/w8GrxDLpDPhOH/0TqbrX5520l4cE81ibUV3FZiRt6nvr7JrP2dn1lcd7/6nik5z8H9N4xxV9I+uK6vYr/5MmPL0IwJM0xPwhdlT2+j6X7SpG8lzG2qZDS/Knb5s0gZ1t86elqtVKVe6v23Um0qRISfA3T463tqNL+cYKgnVBChE4ZymRRKe/oBK16uam+CY2QTKsCN6PZxvq/Mwz4ZyhDfh872nXFkWeWx4tbC1Ha1moLqZfhfAfolEo9CJo6vdhPNKXblJP4YUFUeElbCbn+A7pTeU0FmoMkBtM89mBLdjjsEbv7DwLnLuxi37JhtIE3xCci4E9OCQOtwnKw4vx8NwIgvchZ1PeNGskx+LUmo4CCX4ZQ9WAIQokhdBQFeAO8xNJaZ30dH+fH1cicvZUQZRn5zudhMfV1x3QaZz28s2q+Hw71b9kRR0yVk+OeJr98q9e1smNGv2143rj1ZEq+xsEZMIAF6FmZ5jxMv+e/8rrJWM1+HOXHhfEZ+ViOtx2rxPyU80RdRA4TUwPKN892KN2I9Hx6u/kpMV/yL2Lf8QuCeTjmN+OPD5P2AKIQhgx7fcPOjJEauZC1g6AfLl0CGkFykq41BAZWZ1l6OflNPoktH4GZdD8WaCaKK1Kvnz05hiu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGNpd3dKaEswTitwNmF1elczNEJ3WEJuNm5RZEVoWThRbmFuN2l6d3hDU3p6?=
 =?utf-8?B?SjlUMUN3SlV4QWIwYXFIVG9lL29WUU1LUkpDODh1ZTJVWkVvRWdzVkUwLytZ?=
 =?utf-8?B?b1R5VjVUaFU2ZXpDYTY3SUw4MVhmUEFLYnoxL3Fzb28wdUc2UE5iVjNYMVBs?=
 =?utf-8?B?NkVVTkkyR0p5UUxOZWJsT0JrcW4xUVFzSlBQU2xMMUtlMCtqbzdDaVlEZXZ1?=
 =?utf-8?B?RTFsWXhoWkZOeUZjK0FZeHZHZVV3VlU0RC8rWXVoVmJrU1I0eUZvSHEzMHBX?=
 =?utf-8?B?eG8rTncwSzBaYlE2SDdQZ2hRZHZwVHVFamI0Q2V1cHBHL1lyVFlOY1JteTNs?=
 =?utf-8?B?dmlvRjJBWlY0NE9tQ1hubGVYUXVyazYzY0JBS3dQekxFY2RzVmtpeWo0elRS?=
 =?utf-8?B?UWVCblJORy9CZUtLV2o0Z05VOW1rWjFuYW1nR01Ic3VvcG54M3BUWm9WMnc3?=
 =?utf-8?B?OVh2U0cyMGhmRVFwa3BBMk16TUFFWW1WcGxJaFJiVzdyT3MrVU1ONXp3U2U4?=
 =?utf-8?B?cWEvUS9IOUFWMlgwYzlWNGxkSW0yalJ0dnBxOE1WOGFQZmp3VmlzRTcxQkhN?=
 =?utf-8?B?RnRibW4veEtWYTFmQWZIeU1rNG96RVJPY0hSQ2kwZmd3bTFFRUVNTk9CcGVx?=
 =?utf-8?B?UzAyZHdOZXpPaDg2clJ1dXVpRlZ4aEQ0ZjFsN0JZYW1WYi9tRlJwWnZVTngz?=
 =?utf-8?B?cjBEMFgvcGRLZkFiVHBEYUFUTGx3TElhb050MWZJNitxNE1DWHVHaGJubTl4?=
 =?utf-8?B?ZjFmYzFtd2N3M1lkYkU1LytPV1NueGFOYnF6NUtpMFJCZDhaUEhaV2w3NWJF?=
 =?utf-8?B?bW5qNWJWN0hacXd5OFN6bG9icUtvcm5uUE1DMHl6ZTBSWTYya3dUZ2NBcVM1?=
 =?utf-8?B?WnhSNUJESFRnSGZlZ3BsQ2YzUXRwMG9WMksxSHFvVHdZRDhwWWoyNG05Tm5o?=
 =?utf-8?B?ekI5NEZYaWZBOVVCdzZWYkpObjJTSENmYUQ3UUk3eklsVnBnRHErWXV2NFVq?=
 =?utf-8?B?RDhTQzJETXhmblBrT0FOUmdoR0d0TEFEZE8rbFlsY1ZncXhTNCtRYVoxY1gr?=
 =?utf-8?B?M1pJZG1jNFJHWmtsMytqM1VnZGdBZHdGYnlzamRyT0ZxSy9vY1gwOEIzOHQw?=
 =?utf-8?B?cnRhWE5MM0pxZkpTOFk5dlhGSTVTU3Iwb2l2VGl2aWFxaFovbjRudkZjMkhl?=
 =?utf-8?B?UmEyM2V3d3NUa1hQM2ZuS2hRQ1FKelRaY2ZNTkgvMlRHd0MzT3F5SmVjWVJv?=
 =?utf-8?B?UE5CN1A3QUNxaElRcEFXQWthTG9SRWs1cmY5N1YzUU92bFBkWnNHTGk5RGdM?=
 =?utf-8?B?Y1FCY2RzRE9WODY4aTJaNVBCTTlGQnJlVFN6M3pSY01rbWJMdjdsNXFGRWRP?=
 =?utf-8?B?Ky9kK0E0OEZVU21LMkhQMUF0YXc0Q3BVQk1XTlhtTlR2dDFBNUdrNGcvdFhG?=
 =?utf-8?B?VHNHa1oxRlNTUjRjTmY3ZWk1MVRqazRqbS93M2taeVJGaFVrUUp4Rlh3dW9m?=
 =?utf-8?B?S3g1aGlXTUZ5eFQzaStvWnBKOStzZjI2aVA4U0VwN0lCUW5aLzRqY0o3Z3hj?=
 =?utf-8?B?ejZ3Wjd2WGRnUEx0ZWxmbVJSSG9valJLUzFaR3ZCUFJ0djhrdHo4VERaQVc1?=
 =?utf-8?B?dFBoMEZVOTRGS04vNm1YRWlLYkRhODJXcGplWUZWUEptNE5oWlE4ZTRBMGQ5?=
 =?utf-8?B?VWJaaXpsb05WY3A0c0JkeEdiSU05eG1wdFlBWmUrRFdWZjJpMmk3SjdJSnJE?=
 =?utf-8?B?MXZjakVYSTZtazMyMkU3bmlYWFY4a0dVVjFIcXhUcnorUEdZR0ZVUDlGRlU2?=
 =?utf-8?B?Szd1ckw4WU5weFJxYnA0b1Z2dE1VRytQQXFmbWk4c3FJTFhpK1RtbWVDbG5t?=
 =?utf-8?B?TjNST2dXTUNHRUoyN3FOb0haWktyK1RRbXliTGlTZk53VlNTQkxZaStCc0tN?=
 =?utf-8?B?b0JFSElldWI2cllQTzR6MDNxcnpWdXhpRmZpYkR3bXcvV1YwRWQ5MmdmQlJT?=
 =?utf-8?B?cTduNGlFdVd3R2Z2QUdOM295MElqTWtBdmNFNGFtdmRuQ1VybktGRytMUmth?=
 =?utf-8?B?SFR5dGZxeXYxbmhNaGkvVERROHZzWDJjTFJsd3NPdEFrU1haQWhCcTVTWjhB?=
 =?utf-8?B?TEJyb3hNT3BsRTJ4OEM2TXZ6MzY2a0QwbjhWUEVHOVU0ZXlmR3IzT1BsbGQw?=
 =?utf-8?B?aEhQbm1UeVVWZTVJNnFSNFpFQ2lzUGdzbnd1djc1S0hCR1RSbXdYcUxrUWc3?=
 =?utf-8?B?Z3BObEJhdFUyT2lnR04wWVVvSm0vUFhTRDdlaFlEQjNObUdUSzdpOXFYdkVI?=
 =?utf-8?B?MGd0N0hvZm40dHBWa1E3VFhvdCtTK0xvNjhjdlBQVU81THp0dTgyS1FFTXV6?=
 =?utf-8?Q?d4tD8e5FkNNJfNyEDSmX/2OrZK/1Vxe+IiQK6DND77YCo?=
X-MS-Exchange-AntiSpam-MessageData-1: J7mtQYYWgfzp4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452c1245-884e-422e-27b5-08defa0a58aa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:45:47.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ+2/qQpUqh/B5vxV2r/UoEN8fH+CUMy4ZFXUg47Qc7Y6gKi9GHIyVusp8GX9NEHGRzcrX/BwQbinsUhHNDNuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116

On Fri Aug 14, 2026 at 4:52 AM JST, Younes Akhouayri wrote:
> Thank you both for the feedback. Yes, I can send a patch.
>
> Just to confirm the intended scope: excluding signed integers entirely wo=
uld also remove valid conversions such as Bounded::<i8, 2>::from(true), sin=
ce signed Bounded values with N >=3D 2 can represent both 0 and 1.
>
> Would you prefer the simpler unsigned-only restriction, or should the pat=
ch preserve signed conversions for N >=3D 2?

If you can preserve the latter without complicating the code too much,
then I'd say that should be preferred yes.

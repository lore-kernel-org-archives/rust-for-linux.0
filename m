Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3EC7E9
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Jun 2025 00:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749255221; cv=fail; b=d0hCcbHxVA8AK2noG4BxYWSZ/7DYmqTQ3FGhuYtm4K96FZv0TJmlJqu4cjHuxUJoVE7iFgfI+pNJzms0c+kmW/cDluVMIjnZ4FUObbYsltkBYdJXH0FOUKLxl2sv/pI8U7F6K8nthnJk+d8cmP7cJgcw/V/IZnOMTMMErY17SOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749255221; c=relaxed/simple;
	bh=vSjKPB4FeocnPgHAO+l3ZERy4y6KNyJnOO+3YdH+nSU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cBAdPw2S6BEnXOkhdN1swStUi6cjNnarMg8Beq1txn3Tgk7YYdVaKMkIbRE5CpNNITRvZFhYoprreJJMalcGC2gxSFGVI4PhCNzVE9DY5/OExk5uyItu/zEgUykME8bJfQF5VvjEzH6GIHKWEJVBu24sXid/Qs4j/E0jIOs+fJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jKNErLtB; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKNErLtB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZaXZmWlMBDtSbnQaoN2c5XpxnJhPvY6JcpT6xjALdCXjfCeOxcGy21h/QxD2AVidLPBQBSJFzapS+jdssUo4SEn911Yu+sY8Swzr2vvS9n74RXEOL/xSa/PQH7bhlICfxVEjkBKc/vVU8NJl44FZZYEEvSMHfZjccGss7AClMqQJJRCZckV/8E6+kEOjPxaUfpUHCn7OZfC3AbJVYb/sHCeWZt74clCu3Fp9umB1d91riY4AArOkNzHOoQI1QZtg+eBmKfgnR1+WCrCA2jW9xAFfS9P4hClwE1Vyhb9KvqIQu0/3YQlWo64qUN8LmPaHfGTAOY9Si03VeB1dK1yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3RgT9JumjITRZkODGlEwmGdbpZp7v4FE/KBW7sSwdk=;
 b=c1pRKz14AsPIyXoieOSnX5XUNy90vDLbq3Pe22tBR/AFBX2qkNktdCuQdTubrf5+uI/+xMzsoE11+iuihvtpQP4iR0qdico69Ui7ONOmxrZnJImCbs/GejhJ0/fK5mgVAx09rmzDwkL4FgrvQugw/21lr+ijaYZynvj/1pDx5jOgZkqr6LkeMJpzG0mevexUXjnL2b89Yn9k7ZLv1CHOPpnCpMaDt8jduyWJe2dZx1/lgroMn2gv3IGECwHPDeIUNjDpCN2s2t93O6YkAMWSXVGKSyKYbXboFK8eJb1KB7bxpv9NYhM6ODXLja5pZXps5PZcUpOLRJ9vwEidDOJ9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3RgT9JumjITRZkODGlEwmGdbpZp7v4FE/KBW7sSwdk=;
 b=jKNErLtBA9ENa+j484I342dkbyJWIl25JVBPxe56AIGyX6+ktrTFYa+vbzUjqsxqMW1gEmBxtGmBIbunDRoZo2Lj+zttuzt+pVlwR1ci2bh1AIN//nLyUuGEv/o8XzsEr+LiRzj0/BqGeamgd1nHTmYihxRjxkm+deNJAp+biuzaHfV7iJ3aHAKKs2vFfQtfYCqSJ7JOyc4mRq84zkpx4tNcL2tS++aF1bDXV3Pyjxd3u74f+Jl7Ik3o4rSmAYJT3wQvqoO5Hkcn8KEX8ev3x6Gtjvc1QNfkQvbYg/K0BD7fvvMHxP2oxHDGr9ML31OJDca+zx5YYWM3JofbHk2stw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY8PR12MB7267.namprd12.prod.outlook.com (2603:10b6:930:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Sat, 7 Jun
 2025 00:13:35 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8769.037; Sat, 7 Jun 2025
 00:13:35 +0000
Message-ID: <7cb5acbe-a643-4489-936a-0e68d760f960@nvidia.com>
Date: Fri, 6 Jun 2025 17:13:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] rust: introduce sfile macro for succinct code
 tracing
To: Timur Tabi <ttabi@nvidia.com>,
 "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20250603195426.2360773-1-ttabi@nvidia.com>
 <CANiq72nGZusApAFztsZOoLhRWJYEMmRY6XfAC89e4-dW6snC8Q@mail.gmail.com>
 <ecc4bb6c582bb99c17b4795d80d2556e98e590f9.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ecc4bb6c582bb99c17b4795d80d2556e98e590f9.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY8PR12MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0cf5b4-32e1-41ce-f44a-08dda558252b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXB4YnZhWlREcEx3YjNJL1d4WUZjc2VCUVRwUlNFaUMzVWR1U2F1N3pvdEc3?=
 =?utf-8?B?dnFYZVZTdjJPajI2Zko2bHBqa0paSXF5MjdKelp5Y0ZBMmd1YVBQRUxGWWMr?=
 =?utf-8?B?czFmVFkrd0Y1bHJhSmY2UUdISlUwaWhmMzJjVHV6RkR2bVd2RHZRekRVRWE2?=
 =?utf-8?B?VFhLSmd2dTJPRmJjanZiMm5yWTNGQ2M0SUpydU5FVGc2dFV5TFJQd29NN2tl?=
 =?utf-8?B?TnlKYzNBZ0w3U3hVVDNYWlFxdjVnQzE2bnJMenZjUUlhWXFQMVRWcE9mNmNS?=
 =?utf-8?B?QnBDTTdWMmNMSzZJdTBodktWVW56NVlTUThwaHhONHExM000SVU0RDY0UGR4?=
 =?utf-8?B?OGZSOGJRNmJ1Vmo1ZTcwMjhiS2duZzhJeXczYWlSMTIremVOQzR4bUU1SDA5?=
 =?utf-8?B?UlBQd0pBNC9SWEV6V1lSVWRBWmRkbmdsRnlia0xyUXpOQi94VkkreUVPQU82?=
 =?utf-8?B?VnB3WFZzWDJQTEwreTNublNmcWlNdm8waEJLa0NJV21EY1p4Q2lLVlNXL2Rt?=
 =?utf-8?B?NlRqMEtnUzY1YzhvM21PdUluU1EyMWZZS1RPenhRck8rUzdBdjMrUlJvcHBq?=
 =?utf-8?B?bXUvR3lHWWlZTkRnZW50aDh6cWtxR25CenIzakFoYW1aOW9CTnh6RDFENUdY?=
 =?utf-8?B?Y1ZkOW9rTEFXbjIvK1puaGdHL3JsdGViTVhzL28zaWsrZHI0aXZYVGd0aWJQ?=
 =?utf-8?B?SDVvZ01yR0wwcmV0eUYybVMxTW0xVUhjNnV4SlpqamVtNUlIQUlIRkVjZFlD?=
 =?utf-8?B?ekpyWU1CWFprVkNPdUxQN1hGeWZtZUNKRmRwU3oxVi9lcVEyL2Rya1oxMExF?=
 =?utf-8?B?aDNGa1k0N3NpUmwyRUxPYmIrL21RWDhHb2YzeUF4L2lFZm1oSG8zZWJGenZy?=
 =?utf-8?B?YkxlN0tBczdaQVlGZ3hZczZUQXkrQURQR0I2Q1hxVCsrTFFyc1phOEtFZVpF?=
 =?utf-8?B?TGNhME5obElZNlArbjgySmFhTnpuQlVSYTlQVjdnVE5YSTdYZGtQTGVqV2wy?=
 =?utf-8?B?TWd2cG9iaFZGVHlWVjFxRnp3cHJmS1JENzlSQ3kxRVdLcndDYm8xTnNPRnMz?=
 =?utf-8?B?YzhKYWdINUc3WXNNcGNKNUg4a3BlcmhTRTg0WUU0a1lGMjRhWVZsbGFEMThC?=
 =?utf-8?B?SkRmYXUrRlNTNi91N1Avd3ZSVTkyY2lJbUdvcU5nVWNFZFBURWJPSHIvNnZG?=
 =?utf-8?B?WTBzYlJpMEdScStKUEFRaVRFOE1VVHFXVXdlU2Y4K21JUWhxbkRPZkE3YjRO?=
 =?utf-8?B?aTFra2ZhZXUwU3VVbTNsV3VjRXUwbW5OWTdSR2Z3UGcweDBWSk4wNEIyaWUv?=
 =?utf-8?B?Wm9YU0M0ZmhmTE1kVTBJblBxY0t3U2xCMk91YW9VOFFrd0FUN3dKb2k0cmQz?=
 =?utf-8?B?RzJIdWFhRjI3cFl0VWhkRFphV3JQSXk5aTNIa1hsazRYZzVvakErK3VtTTgx?=
 =?utf-8?B?Mm12UUFEcCtpZHhzdmZzV1NLa3FRanFvNG1QTTVZYkU2eWRiZEFPV3k5OUd5?=
 =?utf-8?B?K2NZdTF5Y3hlK0cvZ1NqS1BsUzEvVG5yV3BCM3lpVkZRUFVrYWdIN0FrNTVa?=
 =?utf-8?B?NUUrRnpKTGtjOTAzV2U4bUJad0d1Wnhwb3JMRlY3S1pCdEtaN1J1dEh1dG1v?=
 =?utf-8?B?ekVuN2ZXbVlzRllhMEJxZS90WlBBNWtCMnZIOVB4bGFXT1FlSmNmR3IyaURT?=
 =?utf-8?B?eG1TR0RyQXcrTTJRQzNqNmxQa2QrQVhORjVYQ3VYaTZCemRwSkZ5L0FrWFFO?=
 =?utf-8?B?Yi94M09YT0lTcUZvSFM4eVNVTnNaTlZJY1graHE4dFNFYThsci9SeS9VRTdN?=
 =?utf-8?B?SFJxTmtseitiSFI3UHc0Qng5RCtqVmx1R0ZKZUdQK3Q4VWcyQ3YvdzVmc3No?=
 =?utf-8?B?NTVGYXRaRGxCT1dLUFJ4MzRUNjY0TE5aNm9WZTBUMzZIQ3dmbUd1bnliYUEr?=
 =?utf-8?Q?i0ZgYUVvxqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhDd0VONXVzaUdFUy84Zi9kQmtoQ0lkVmlNb1dsN3ZpRGlEWXI0OWFQdHNZ?=
 =?utf-8?B?UjREVVE3ZTlFY2p5TDQ2Si9JUVVaelI5T0RPRjN3OG9kSzNJRjVLS2U2cHBm?=
 =?utf-8?B?Nm80bEZyeTM1NVJpS3FxZEYzVmtnWXFVSkVFbzVERUx2OW5JdVBGdjdhdmdv?=
 =?utf-8?B?dzNRVFo3WVA5cDZ6Mzl4WjhxZFU0eWNpSHpmR2tEWkpKVkFwWFRobnh6UHpJ?=
 =?utf-8?B?SnlEcFNhcyszRUc3bzBXVWdCbTA5aENRN2NSOVUycHFKbk8wejhQTTJEM1pN?=
 =?utf-8?B?SGtvZWx1eVpWeHZVR0RKQ29Nd1NuZHp2YmpaSTg0eURlb1Flc3VWY3lYZUp2?=
 =?utf-8?B?UkxzajVZSDBobDJOYmJTdmsxV0VMTlZYdmxYT1pGNURjdnR6M2Y3aVZ6NjQ5?=
 =?utf-8?B?MWk4ZjI0UG5TS0lMN3RoSGpLcjdXMnRsSW5OVFREbzBHTldlbGJJTmN3YTI1?=
 =?utf-8?B?czJIcjV6bHRWZlJJNWxBYW85LzlIdkE4ZWJ3elkyd1VSZVAyU0hRRUtvMzly?=
 =?utf-8?B?QVlFcm5SQVdsWURLa0szVzZaTTJZblN5UGJvR1k0akJ1TXdIWGVWWk5RYm8z?=
 =?utf-8?B?cURFejM4UGkvbVdlcUtsMHdJN3ZBeHE2OFNVcUl0Nzdya3cyT1MxSXorYlBj?=
 =?utf-8?B?Si9JVW9JRGZpaFZpS2g5bTNSMEZTdXJ1ZDVWMDJHMFRlZXN6ditvSkltcE1r?=
 =?utf-8?B?a2R3WXZSR2ZtN29Iak4weldKazFySkdHbDVPRHlHVThTaEJqS294TSsxMGtr?=
 =?utf-8?B?M3VvWk9SNVVBbm9iVUErZkdIZEZSNWllMGo5dlVSYVNTWWJSK2hzVTcvMzNP?=
 =?utf-8?B?Vm5TcURKREpOOVhzV1A4R2RQVkY0bFIraFlEWTZmVWR5YUpsVEhPaG44Yllk?=
 =?utf-8?B?Nms4RzFUTjlyNHVuYzA3SjhJSmw2TWNWd1BlcDZPaWdDMXpoa2NidisxWEkw?=
 =?utf-8?B?MlhTSWFkTW1hL0F6eXdyTyszT1hGVU5EdHc1ejZDekhBdmdVbndOaElmTEQ3?=
 =?utf-8?B?UXBCc1pZTWNiZDJucktTTVJjT25PQTBReU9XZDBZbms2RTdKUk0raXZ0Unoz?=
 =?utf-8?B?UEpSZlBkN010YW50UzJlWjFRSjNCY1hTTnczcGFLQThxbURqcjF0Y2NXcXNa?=
 =?utf-8?B?ZENSbXlLRjZKTVVzaFAxNUp3TWI0Tkw2aktCTnFaU3NEWmJZRm1sL2x6NkUr?=
 =?utf-8?B?a0oxbjk2dlVSbVAxcXM4SGlDTXV5R2tlZUlFZk5aUDdrVm9jZFdDTmpGSDFE?=
 =?utf-8?B?MUZqN01EN1A1WXB4cTVnTi9iYVVtS2NKTnJVOGRYR0JmM1dyVnJUMVJod2sv?=
 =?utf-8?B?Y2x0UXRkWFFjcThNRjhiVk5pdTRkN3AyaEZCbTk1UzZmNmJ5cnl4emJxMFZM?=
 =?utf-8?B?Tk5KTmdCRDZZQnR4YjFPVnBDMHdxdmI1d2dpcDJoamJtRUg2VmpGdkJXM0s0?=
 =?utf-8?B?R3dHRFR6cDhEWXBmZUZCUEsva05PaFJNc2Y0eFIxY3VRRzZsaHZraVFkelFX?=
 =?utf-8?B?aFIxTnpncmlNb3kxVk5RUVdzTXdkT0Q3TFVIT3RRZVB0dXhMQjhUU2dqQVQ5?=
 =?utf-8?B?S3dHV2creGhrLzNJK00wWFlvSVd3dmRET2Y5RjdqajM3THlRMDRCbWpvbG1l?=
 =?utf-8?B?VmtOTkdVd0NSbVlhZUF1RzdWK3lzSUJFUlZ2SWtHdEtlbk13M0Faa01Fa1VV?=
 =?utf-8?B?M0h6K0ZWK0g0SGYydDBuN0FvdUY4Q2FiY1QrZmNPRlNscUJ2UkV0d2dSeEdx?=
 =?utf-8?B?aFRqTjdvVHBycGhhK3lwSUh0WG1IS0hBYlV2NkhZUGZJM1JTdkJxMXVVMlJn?=
 =?utf-8?B?OXpIWlNUSy81dzNMVFFDd2lGNlBQV2Z1dE9uOStWcnVwNm1jOE5SZUlvL0tX?=
 =?utf-8?B?ZnV2bXZrREhVQi90czJNNElyWWg0MUd3dkxYUFlwdTk3UHc2OXR5MStoQ0ho?=
 =?utf-8?B?TUVLWDhvUXJQNHlsb3kvUFNHWENyeWhmV1NTQUtWNXNCMHIrd0hIOEhqTzRm?=
 =?utf-8?B?YkcwaXhNWnZXdUhHWFRCajBvVEljR0hybDI2SE1KaHE3TnQwTGhwVG94ZzF1?=
 =?utf-8?B?T2NEY3pkY2xRc2owUDlXdUo5RE8zOXRTWHlWbDdCUVdaR1JzQ0l6NFhkQzM2?=
 =?utf-8?Q?cdrTHV1wO4lcBYN+LNH3xJELp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0cf5b4-32e1-41ce-f44a-08dda558252b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:13:35.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1T/vPzH2ahS1jJylTxZqZiHifU+nAUKiQbrNcRdyfMDD5oe8z5P24A513Vw/MYvCOdXFSx+t+JTGfWTeehTXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7267

On 6/6/25 3:11 PM, Timur Tabi wrote:
> On Wed, 2025-06-04 at 00:53 +0200, Miguel Ojeda wrote:
>> On Tue, Jun 3, 2025 at 9:55 PM Timur Tabi <ttabi@nvidia.com> wrote:
...>> By the way, please use the standard "[...]" for patch titles -- you
>> can pass e.g. `-v2` to Git for that. (And ideally please provide `--base` too).
> 

--base is quite helpful, please don't overlook that, too.

> You mean you don't like [PATCH][V2]?  I've been doing that for 20 years, and this is the first time
> anyone's complained.
 During those 20 years, the kernel community moved to a mostly git-based
workflow. And git's "-v2" is a neat little time saver that also ensures that
your patchsets look "standard" to...pretty much everyone else here.

It's less about what you have been doing, and more about what others
expect to see.


thanks,
-- 
John Hubbard


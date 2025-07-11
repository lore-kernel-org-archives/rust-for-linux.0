Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F662820A7
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236420; cv=fail; b=dVeO0Uy1G4Fh3DpXeNG/CKm8BaPg3+KPpRosV7skvwp1OSlxG8hH9IH0Huf+lHFE8bxRsM0A7Sij3zFSIChqsSoCaPTuWYv8SV19ou0/bI72jCqM7l4uvgCjjVbm2rFWVYyXsPA4P3LGYL4rcvlMJO9vovGfB1rAec57XrhOaKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236420; c=relaxed/simple;
	bh=JYBrJFoPDRBincQJ9/fG1Xf//al6OFaHri5qRH1TRdY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kgMXtdlElKKFZlBIvlX5xqoDKYoDT6TI92eCnMSQoWizaqUau+JMM/GWl60eIWmku8NQ+mNtDQbPbWNo5p+lssDXRoZWHBP61Djcg/ldMA68M336w9hsq1KLojLnLrTHoC7rLQ4FMFJjqcRmYXRBs6QFdjJsK5qPum374qtxABc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ibolisuL; arc=fail smtp.client-ip=40.107.223.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ibolisuL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN0v55C4TTsNoJTUUPOg8bWZNeKkmDpcYVXnqRe0JQDdRAy/xDzaRrktrkX2wmOWXRowo58Nxoac5iwf63Iib6U+5UrhGe5VZYcomQV9Nz7Y0+JUGHw61jdlsR1CE02dVZ8hND1Y8T725y6+Ort3472c2zuv4mv2zufv232fDJxw2PNQkR9MVTdyV6jQN1jds5uMRfr4xhC4RXhG7YfEwKNmphvwRRtGKyyAc4mJ00uImLgyxOSe3orZ5pikTnz5ATwst6uiivHWAn3oKItDsu/GrBe4PumDKIjZqIReeSUtR86ad+HorXD4tGOwpqBa8YS4GRfooE2/6/TiFWrukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LphEbIKB7PFOkNyFTdyLpfeaEq8VcwxnxRYQkKDEkLY=;
 b=aamnM8wTYb9rugGsjErfsYb957DeAPv9maw8RnWA0SVYI37lSENqV3W0EOXYva0Lu9TZdHx3wZ9FlVPtmG7D7/tDnpoCPHyrqtI8PJFer1JV/41/6ho+rVKVaePTEwXWdXZvV7fPJh5CyQ8UrjKArmJZ56RXata8oXXovfhGa8GF6UCO1SJLBY4wFmRX+MlIugjGFsG+LfwnxIERN106QeQnaSIKjB0Xi4LLOqKDTaPkVmAsiYPiqpcfgYb5g5Dnw2w5EfLu0m0G4xOx0jSttZqyLX67HQYvMcG9AlP+XJgFAN5jPPeCCPLcBjmAEvkOy0OBBGYU4P+IRWwQg85HrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LphEbIKB7PFOkNyFTdyLpfeaEq8VcwxnxRYQkKDEkLY=;
 b=ibolisuLzgkyUNDm4KRJ7vTvoiJQIKIbOzLGaraU+n3GWS2XljSmnHFfMr8pSjU5ZBip5kjuKCXeyrtJLDhbLWbowwOv5XppzwXwCTuHpYYrQwo1LC81APrVGWbpstZOiM9iDa/j1YTMZHbr0D486PCWYjahJqPytUZJ7LKWOoJt6/GptS+kh6kpbhiuf+yEobjYJrlD4ggB/pPZCsfPFbGmf+jc5ZoCm7L/ECKYpzed25y0CQYpf/5RTG7SRnmee0N/niyfc49dFWXgcXqKutcEKKGDOi1sShHgieLgQm6dHO4J/Cc9qqu3besqFE9/2wexd/WzWJYWJYdunQ6Rfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 12:20:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Fri, 11 Jul 2025
 12:20:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 21:20:13 +0900
Message-Id: <DB97YVI7QEEC.4YC9S6BZ1PGG@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In
 PmuLookupTableEntry::new, data is sliced from 2..6, but the bounds check
 data.len() < 5 does not satisfy those bounds.
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Quaternions"
 <krakow20@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250711113327.39201-1-krakow20@gmail.com>
 <DB97N2MN47L3.1F7450280ONEB@nvidia.com>
In-Reply-To: <DB97N2MN47L3.1F7450280ONEB@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: 05dda5d4-bc48-4e84-e659-08ddc0754b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUcvNWdaNnUzekFmVW13U0pwampXL3VGMG9LUUFQZWszVXltMFNEdGhsK2ZK?=
 =?utf-8?B?Y2JkbTROc3VDSXdJdGdQMUc4ZlpNYlNqTUg5YVZlaWFXSitxY0hIbitMc3Yr?=
 =?utf-8?B?T2drUmNrams5N0ZNUU9NYXducHBqcHYzWUdhS0JwalJYVUlwVGIza0ZqSnVB?=
 =?utf-8?B?eGhKcHphdm9oNHg5Z3ExMjlCYnMxaStVRVFvU1FQT05pN1VSV1BxSkxRS1pB?=
 =?utf-8?B?MmFJY01SZVEzRFJXQVI5ajRoREh5YjEwK2VLSGxNY01kaEtxcnJKbmFnOXll?=
 =?utf-8?B?dzhDWk10cUN0SmZ4VWVCM3g0TVdob0VDcXljYU9mV29vekdBblNMWGl3NWJD?=
 =?utf-8?B?K0lOa3o3YndjOFA2SytpV2lCaGM1QmFJcUhKbTFJVWQ3VjJSdzUwTExNMXpm?=
 =?utf-8?B?SHJ0R1p3TUFubVF3OUcrdldib1o2bjJXSnBZUk9iWk5nWDJrNENKM0NHbkl2?=
 =?utf-8?B?VnVVRFlxSzZZU0NmY0dycmZGeDFlMlVTUFh3N3g5S01wOGExK3dYSW1HeUpZ?=
 =?utf-8?B?ZCtzQnY4dUszdHhwOGRuZHA1dkUvMnRjRFBwL0Vmd3RYNmx5RzhjOXY2RU9V?=
 =?utf-8?B?anhMS0ZDbHFwakFLc1lpMVQ3OUM3YUs2VThaaUlrR1hRK2JoVkg3eFBQM2F2?=
 =?utf-8?B?SWxSakgrOXdLTjU1R1l0MzZvMWtzVnJmSG5VemNxQ3JQSEo2OFFNNENtMnhY?=
 =?utf-8?B?TlJlcXUzTFA0MVpNSW5kaWs2dUo2MzhZVlB0aFpXNTNYeUFlaHRFZ0xRZVdj?=
 =?utf-8?B?cGJ1RXI1cVkvTVdrSFJORFFxcmJpRVo2QUwzOGszSDRUek1ab2Qva29CYkF0?=
 =?utf-8?B?S0cxMUNsbUJWUktOTzRZNFlXMFdsbWd3L201ellpQ21pclZtdzE0OHQ2ZE1a?=
 =?utf-8?B?a3pXaFNDalBCZkxUeXhMaWl1a0w2cTFXeWUyYTEwQitIQTYzQkpHR2dVR01W?=
 =?utf-8?B?cmsxbmNnWngvcWV3T2tRbTRvWDRxcEtDRjJLVFp3TUJRSGNJN2liU3NJcEhl?=
 =?utf-8?B?NlBmbnUveDI1WW5iQXMrd085K2V3RkpORkpwdkJlV3lGZE9ReWw5UzRpcWRG?=
 =?utf-8?B?SVZWbktIN3gvcVljQkIzVnAzQ0hwNEhDUDB3dGRoSlpQMzVnNXFqTDdaYmZv?=
 =?utf-8?B?TU9uUjdiVkRHUWZpRnVDbkJhSk1ZR2pQVTBEQVFCUWtwUURNVXpZNlZtSjNJ?=
 =?utf-8?B?ZWRwZzVUclpFWHVYTy9nUkVFYnZkc2xZYmhGQ3FOUUkvOW1MZHFnT1ZQcUFR?=
 =?utf-8?B?SmxVc3E4VFZLdjhQNUZHN0RDTE5mdGdBaUxoa3Bjb08zQ0t0bjhtNUhmc1hm?=
 =?utf-8?B?aWtFcitkSUxEUEdTMW4yZmwyeHNSbkIvVGx2eGg3L2J5TlFITkFKcFVsZUhj?=
 =?utf-8?B?TjM0TDZzQ2xNd1lMNTJIRXJCcm5CTlRQb2NkSlVERFQ5KzR0WXM2bVFUVUo3?=
 =?utf-8?B?VkR4empGZjByOC9JWlVhTWpoM3BqdVREelJScUR0RW5GS21kcVdpaGRDR2E2?=
 =?utf-8?B?K2xEMXgrMzhyVUEyZGhjSGl5b3hqT0RCMTZCYkFRWXJkM01wbnQwYkhXQzZY?=
 =?utf-8?B?YU1aVXJFODgyaFRKV3NrcHdlVHN0RVN1QS93VEgvcW1mK3JUMWtmSlFGVDBY?=
 =?utf-8?B?SElma29NemE0MjgyNkxLQ2dxUWMwaWcwVHV2NTJPbDVyMzIvTzJJWStsSUpZ?=
 =?utf-8?B?MzZnQTdBekJtQis4SHVqVmhuYXZZdGtWWHFESzBCTUpBU1h4MXBIZTRVaUNv?=
 =?utf-8?B?b05RWFUyeFhBSlRHSzhIWGtyeVVWM1RudkNCK25CdlhYTGNIVjJrR3dRdXN1?=
 =?utf-8?B?SVZ3NzR6U21kczN0M3pxN1RuYXJvQVVkVVgvODBQa21IYThmTkhlVUdsdTJY?=
 =?utf-8?B?dW9IRWhDajVsRVhPUG4vbkUrR0U3YnJVTW9EWXNab3ZTczVnaWhYalo0a0dJ?=
 =?utf-8?Q?Mhf7/BN7GIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFR6YkhkWnB3TDl3VjUxSFZwYzBTZldTSFJmcys4cWZrRDJmTWMwcU5DVUxB?=
 =?utf-8?B?NW5NN1pLNGZTZkQwTjJqVjQvczBkYW5aMFNXNG9WaEN5bWRiMDZjMWtMcnVO?=
 =?utf-8?B?Y0dRRE9qOWJKdkxXcEhIVzZDV2wyMFA1SEJmQlR3dVpOdzdOMjFlRjBrbTl2?=
 =?utf-8?B?NncwWTBhNGZEbG1oVndadTZ6WjFDUjZjbFd2anhjWUxnNHF0aEszdGxtZVdV?=
 =?utf-8?B?b3gxc3RYTUExc0VKeWlTS0c1L1VMaDBNVHJMcy9YN25PdVJwTzFEazJMMUZC?=
 =?utf-8?B?aFI0NnBxd2M0dDdqV0xPSXZEa0J1UExJT1JBMmZ5bmx3UzA4d29LOTVHT3hN?=
 =?utf-8?B?eHJ0RDAvR2pjdjR4MlZHN0Q3bW5HazI0VGQ0MGZ5dFVoUVFxaVlWWDRwRE9K?=
 =?utf-8?B?eXFyTzhzQzU2djdpNExLdG43NCtDRC9TVC9jc1dqbC84aWhFbnplY0tzajRh?=
 =?utf-8?B?Y3UrbVBqUW16SHpoOU0xaXBaY0RiS3lXS1dmOFo3bFUrcHV5a0dQeElLMlZz?=
 =?utf-8?B?azQrZmo3b01kOFl5ditYY2N1M2ZnWXY1M2ppREpFZWc1bzBkRFhmMk93R2Ft?=
 =?utf-8?B?MlVLNnJZRTdGYmpINmRVdFJibFErZDZxOTVIQjhYbEpoamRyOVFEQmdjTmps?=
 =?utf-8?B?ZVMrdUU1dmw0Ri9KN0lESS9Xc1FydzEyZVBxYjNMa2tVbnEwMUdkYnQxZTdh?=
 =?utf-8?B?ZlljK010MTJZa3pZMHA0VVNONTFNdU05T2dtMVZFTy9wQ1pKWlorTXE5ZVlr?=
 =?utf-8?B?RFRnR0d2V3d1WExmenNuai9BZGxvd0VhMzVIM3pFZ1hLeFo0Z21tNTdkZHU1?=
 =?utf-8?B?UnZJRmNoZEtpaXlya2o1dGZ1M0h5OUhiSzVMZVBpV0tNWURCRzZkU25nRElo?=
 =?utf-8?B?bTIrYk9RazE5ZHMvdUhYRzZSaFIrUkF4YkxOcDMycmdwdSt4aWh3V3gvSWYr?=
 =?utf-8?B?b2V4RjdoT3MwbWM5THRUYUsyNzREQW1OLytHbzVhNE1CcWVmK3ZtTU1KbGNm?=
 =?utf-8?B?YlhaNmVvblYrTDVSUWdCQzFGZVpxa2NaaWY1d2RoVys1TDdwVFA5WVYwQndK?=
 =?utf-8?B?d3F4Ri8zNlliVGd6akFiT05VMXY3Nk9OeWltdVEvZ0llallVWk5yVzFzcmhM?=
 =?utf-8?B?Vkk2TFhGU1ZHWmtlaU5nOEYvYitWV2pTdXJtRVh1TS85UXllZUhBYmV5ZXJl?=
 =?utf-8?B?eUIzbm44elpjdkNOemlqYUo5T09JQkhJbHF4c01XRzgvTmh5UkV1T3pVVjhp?=
 =?utf-8?B?THMxZmpVR0NDMnNWdWlaZmlrcWVsT3M5eHFOQkRQVXErNEUyYTVIZS9PMk5S?=
 =?utf-8?B?SjNWUjUvMlJJQ3Q1NkhKeFRkMGZwaDIxcWM4Y0xzd3NmNHNrb2JmYTlDQlRM?=
 =?utf-8?B?VnkyK1IwU3RoVnVXTzNRY1JvcFVYVWRuZXpQOVFHYXMyQlZ1TUJMNVd0MkxM?=
 =?utf-8?B?Uk40QkxqWVRxZWdjZE9IL3N3Nm5ZSUhEN056ZzhJNnhoMVViWnZTOWlLVkRy?=
 =?utf-8?B?U1hYNDFBZmcrdXhhTWcyM1lFdXpZSzI5YVpmQ1NnY0gwQ3BjNEJxV295dkVX?=
 =?utf-8?B?Qmh5UVRwZFpSMkdBOVg1OFA1U0E1ZVpGQncvVnJ0WG44OWFuR2tKSkVyOVhk?=
 =?utf-8?B?YnBJaU0wZVBibnFEck9kZHdGMUZ2M2NRQ2toekJBejdtc054VnVWeDlVenNC?=
 =?utf-8?B?Uk5FUUpyMk9pcjFHRktHV3NqTFEwbFhpVHQxWm82S3JoNVoxcUxLTVRxVUoy?=
 =?utf-8?B?c3U5NUQwcEVFTlBZTVpEc200ZlpTWHV6RTRENmtFZkxHWmlFZUdpemdaMkJK?=
 =?utf-8?B?RVpxWXM3aVordU1qOW5Gc0U5UkZvZmtoU0hTMVlXRjFkVlVudFdGUHpGSDVa?=
 =?utf-8?B?anhpWTZIdE81NGo4YndhbnJESnp6c1Q4TlBKaExGQ25CaDFWSVREemlhWDhM?=
 =?utf-8?B?dDhmZndsOGF6TVVVcU1xM3duQ0t1UW1VcVJibTV4UkRLUFdZRmU1T1kwVWww?=
 =?utf-8?B?R2NXL2I2NHNxM2o0RW1XR1hGbjFwTUFWVFZQZnIzeldkTkhaRGdPT1UveExI?=
 =?utf-8?B?UlMrWUMxa2U2Zld6b1JtWHpmTVdjMVJKajhmZm1uNis0Smt1bHFUM094SGVt?=
 =?utf-8?B?ZmtySmh1dTJRcndPZ0NnNXdWOE8wL2xxTHJheGpxRTFvdnphWnlnL1I0aEE0?=
 =?utf-8?Q?HzxTrHDaHyujlqW/s4DNITCEFG9OTNczKbpaMyJM7pqG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dda5d4-bc48-4e84-e659-08ddc0754b33
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:20:16.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18wJvrPH1MibDBqUn/WhWC4YA8Lg98QkNqNKCccfs/stKy/zYlPv157NU0iq5T5D5ZFpG6dmmOcvy+nMFj1bag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605

On Fri Jul 11, 2025 at 9:04 PM JST, Alexandre Courbot wrote:
> Thanks for the fix!
>
> On Fri Jul 11, 2025 at 8:33 PM JST, Quaternions wrote:
>> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
>
> You will want to split the subject to something more minimal (e.g. "gpu:
> nova-core: fix bounds check In PmuLookupTableEntry::new"), and use the
> rest of the sentence as the patch description (as a rule of thumb, 70
> chars for the subject, and kernel patches must all have a description).
>
> Also your "From:" field must also match your "Signed-off-by".
>
> ./scripts/checkpatch.pl will complain about these points (and check
> other things as well), so please make sure to run it before submission:
>
>     WARNING: Missing commit description - Add an appropriate one
>     WARNING: From:/Signed-off-by: email name mismatch: 'From: Quaternions=
 <krakow20@gmail.com>' !=3D 'Signed-off-by: Rhys Lloyd <krakow20@gmail.com>=
'

Forgot to mention: please also run "./scripts/get_maintainer.pl" on
your patches to get the list of recipients you should send them to.

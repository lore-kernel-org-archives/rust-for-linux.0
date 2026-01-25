Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08363EBF08;
	Sun, 25 Jan 2026 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769321340; cv=fail; b=YhCRC1Nlp2a+9XaK/necIVJrO3F1esgkZUOsJBtqD3OHxKSxe0K0VEAnhfo0r6XlE4414bOwYMsag0DBYeGp+GC4kd/uGovRGW/3o589deyk11o18zrPOSgAShTpA0427Fjjj5wGGfznvii/CfC3pGA58XLMsVll0FPVFKIb3P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769321340; c=relaxed/simple;
	bh=IwtlhLOC3WbosGi00zebJXNkoWUsiRgCuTObtcjJZHI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B4IrHX8xFt8ymLlnrtu6f1oEcG2xypMAx6zy1aZVJh5ctz6aqP01Zp027xEXHRssAtwwTIsLXj+4zydzcaaCt+A1xnUiHiMmLS3Znf9lLMKLJK/XVpfhZUDIgFEamyop1A0dFKdLeRqG0PnLChgM0Z4LWu2FrjnD8t0tnNQuVck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wy/2EUiu; arc=fail smtp.client-ip=52.101.62.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wy/2EUiu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S54HUc63q1gWu4YSmYj232oKr62pNk4HZLTt7eKaVJQ1fmBZ20drsTC4vg/Oz/xhMI1qvfCuAIi+1Db5CDA2jqLNKJQMRqfh3ee5wlFuAkWlyoJQ7lHxhRISZgqs7iXbYUEJa6IUpZruTrP+QRzJcbAwlD0ozhdg+p9C5W5YcEoAX6kQXmNjc/kYJ6W577aF/TKoMDG5w0V+y3FJncaOoFu31rA2YQu0Hy3j04G2dXj96pXCiKs8zsB8PMaBq/mHT1NP4+TyEZan+Il1QtRLc+/f7UXec6z/L/C1eaih05aYNflzc3S7lJhhdnnb1tZTUsGgGZOWDOFLSqrvX/sHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwtlhLOC3WbosGi00zebJXNkoWUsiRgCuTObtcjJZHI=;
 b=rhfnqDNXHBiaNGo6MdTsG/WScvdbY4DqCHUZKQGOoDQ+wZ4ydDMeBL7zj7BcUu6FLWg4TbT+v7E4V8uTy+Gssppy3IUSnYeexIWA/l0hOj6qKpGI8RsOSxefqy+O6MHVQfzJCQuTEBRPtZtj7NoYX9PTpR4J1PvHWmmw4jqPPkpiskbI8wBhx92hzHGyUTd7LJoJPXnYghQDO/wVF39XHSjTOXc6T4KptM44JKeM/tcQ4lpH5K7FhGfOwRBan/gdPQY7vuOtSmyz9cI1TAEY+fDK6ynQuozCXwaUewJgTENAmvkqyOidEEO4y+1MLNkNLJV7l0/Aglv/WFkfLENz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwtlhLOC3WbosGi00zebJXNkoWUsiRgCuTObtcjJZHI=;
 b=Wy/2EUiu+UG5zQb4qN4qjcBah9vHUltt/XenJoa5pUb8EYy9MGRRauaOUOsaVh7As8IZnYjLYaBzLN4q0Df3WqoQv2EllbAfrtoscrt8lHoSKfrGqZD1GM55po+S4+3vtpOU/2H/NxEK6oLjBBtvLZ38PyV5jwo3V8EpMMf46Xc+izmf/5pWuSBOt+pbtFLHKqCX7ELmw/awgFEXY9NKmBFED8WTo7sNSyDW4ftUsy04B7DSxHJd7kydkVxXUt46BYcZsHsjVsMlS2ciNhSjEwPAe4pyPANBq9tjVX2aSjza5Br1neOq9DiWQDATfPidbHcI0LNw1gD4e0upMlYJuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sun, 25 Jan
 2026 06:08:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 06:08:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 15:08:49 +0900
Message-Id: <DFXG2DJ228U0.2ZUKAOIOGUJHG@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: clean up Bounded::__new documentation and
 comments
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Shivam Kalra" <shivamklr@cock.li>, "Miguel Ojeda" <ojeda@kernel.org>
References: <20260123132132.53854-1-shivamklr@cock.li>
In-Reply-To: <20260123132132.53854-1-shivamklr@cock.li>
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: be5a1626-ffea-4f11-106a-08de5bd8372c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjJ3dXdaa0Vkb0Y3V1ppR3FrNVgxbU1mSHdna1NwSHViNjJvSzd0a1BPenZt?=
 =?utf-8?B?WllmNFpDTkFrSXJIbHVBd0tvcUNwVHM3NGUyTEJLY2FvQkNtcENjMitxK0dL?=
 =?utf-8?B?VWgvamNxbHBrTkV1TnBHYTIzTkRQRWJXMzJYZVB2Vm96RmgzekZWblNGUEpJ?=
 =?utf-8?B?VW9HSGxvTWs0eG80L1AyTm16aXYzM2FhTnRyZ2JqM3JSMTd5aGNmMkhudGhN?=
 =?utf-8?B?VkpNNk9wTjlULzVvdHd0NUpSaE5ZRHhPMllDRTVMNkRHVWZ2djVzWG5LdTVa?=
 =?utf-8?B?b09QaVVtaXNKNG1FMlZKcTRINXgyTHpmKzA0eXd5WHdZbTVwa3BkR2IzVSsr?=
 =?utf-8?B?QzZQYU1IY0M0RzhNVjlrSUt0VUpoNnd2L1RMaWc0SDR0RjE0WWwwODZUWThH?=
 =?utf-8?B?R2wxRkpLdkNUWXpObm9yYVZkeC9UTERKV05rOTVCb09ab050WkpTaUlaOGlL?=
 =?utf-8?B?RlUvTlpyZ1p6ZGh1Y2wxbHpqZFd2ZjVRSjR1cytCYXRTczNZUDhoQS9VSklv?=
 =?utf-8?B?M1pHQTN3enQwQng5NVVyL3lOd2VidzBpd01YK0U0TDhPejA1bkN5RS96ZGgz?=
 =?utf-8?B?TElNcHJURU1INWNJcW1RZjdyQXZHeHZMMzBKOGpCczkxdmVNaUE5R0dwR1Vo?=
 =?utf-8?B?ZU50VWY2Q0s5MHo4eUZmeCtsSGtMMnJ4MlgrY0MwVUovMXpNWHFCeFU5NE9s?=
 =?utf-8?B?OG1McTdMYUY1R0g3YXVMRVBtTG5vRjBDLzhDeFY5VVl2WW52N1VLL2hlNk5p?=
 =?utf-8?B?V0dyNndaSENkZW0rdERGV2srZFpnRnN3b29oTnhmOU9jaGhWMC93bHdxRGJn?=
 =?utf-8?B?TEJzK3VmWTBEUGcvMDRlcm1zNllwbjc4RkM5bXI3aHEvbGl4aXU2NHJqYmg1?=
 =?utf-8?B?alVVWElXbFR3eC9IeDZlSmYwWHQxMmRMZjhOaTIvbDNralVxbGxSNjBxTjB6?=
 =?utf-8?B?NUoyVFVMSUdxSUpDRWVFRVZraHRhOTNjNldIN2E0dDJmQ2E4WFRSL2Y3UGs2?=
 =?utf-8?B?SEpSQVdDV2NNVDV3WWFIV2R4VGVIZXJPZmRtcVpzMnk4K1AvQ1pWSlZUZjNF?=
 =?utf-8?B?V1FhSFFsdjk2OEt0TTB0WkhxdlNQVk5VeGt0YktHajI5VnMzTEFmeTdPSUdT?=
 =?utf-8?B?M21TSHFBb2dTQkJXc0hjbjJUUXpoYnZHTU9QK0tQRUxmQWJwTy9VRTNlKzJh?=
 =?utf-8?B?TEpkSDRROTVMUkhwTkZZanJqRkJIN1BxenlGV2JBZDRlQmQ0YU5ycXUzT24w?=
 =?utf-8?B?SEU5bnRDSCtUQUZwK0JwY2hTR0tkY2FFZDgrR01tbGpQUHhFcVJvNGo4UXpl?=
 =?utf-8?B?ODFGb3ZMajh1MkZ3bk9pMUJ3OEptRGRDcUhodXNtWFpGeUx4UVAzM1VWckoy?=
 =?utf-8?B?dVJKL1VwbWplNnRYK0M3VFJndkp5UU53WU5xcVVIVHVzRUNrU0tpNXpad2s4?=
 =?utf-8?B?RFZobEFScmFiUExyeXV3cVhFOTJyWWRLTTU5SW9KanRYQ2doYWZLSEc4b2l2?=
 =?utf-8?B?cU00LzJWSjBsdE9ZZmdWRmd6K1hUaTF2dEVHQUQxL1pEVTRaNnZ6c2s1Q2JX?=
 =?utf-8?B?ZDVnSkRPdjhyT3FMbkJtVVRIYmtGaXNZQTY2dGJhT2JuVVdZanRsZmlPYXE2?=
 =?utf-8?B?Ry9RL3V5Sm1lWUhDdlczL0pNNzZFU3I3QVlaS3FLNUdWeU45Ymh1TGc5TXpy?=
 =?utf-8?B?M1ZkZjBHTWUxL0l3amR5TzlocnlPRHVJUEJNT2MrQ0JITGgzOUdIa0NEeXdO?=
 =?utf-8?B?NUcvMmpCYjV3UDhoYWFCY25hdlYram9jUjBiaStuUmZjM2hXVnNEZUpMRURt?=
 =?utf-8?B?dk9mQlNTOGg3TnFheTlYUWJMNmw1a0lJODk0S2J5aWE4bnd5ZHBScFZxZlFI?=
 =?utf-8?B?NStZY0NUMEt2QnZIYkFhazArd3FaZXZBQkRsOFJGM3JjN3laTE52by9wdkxI?=
 =?utf-8?B?YXhsV3Mvam9IQVcwY0VYc2g2WGRETHFqUlk0RndhLzdyRk42SHp1bzJYekdX?=
 =?utf-8?B?MjJSbXJrRGhaTEUvR3ZiYVduQ3VONmM2K280dnpBdzh2UUxrSi90Q3hZL0Ry?=
 =?utf-8?B?c1JCbWFJc1cwajRzTncvakp6SGJabFpKWVU3eXZ4blpWYTJyOEtOT0REY0Ra?=
 =?utf-8?Q?ApQg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnpCSVBBUjRXZEFYMUNycWdtWTEyZHZ5dzkzZXZEclJlSEsyUm9hcFhTa29u?=
 =?utf-8?B?VVJSRkgwZXVuRjFnd3ZGYnFjM1hEYnlNMks0am0zeFF2aWJpYWFiTlFxYXYy?=
 =?utf-8?B?Qkk2U2tUY3RvK2Z6NUxocWwwMWZwR1BORk5aa1lmdGQxb2V4QlN0NUVFUjFS?=
 =?utf-8?B?eWZHQWN1NVRUaEFzQ1FDcm1adkZNZFQzWi9KVVlDalhGTzA2RnRORUo1WEF0?=
 =?utf-8?B?bTYyOFljMVdGS3prSjlLVC9ZaDRVM0JpK0lBaGNPQnBMRzVxeFVCNmRjemJi?=
 =?utf-8?B?dExCcC9VelJpaFFneWNFUkxLdFJMQ1EzYkptdnMrdjIreXJzVTMzQlZPYVZI?=
 =?utf-8?B?SWNXdDB4dG5YUklUUDkzSEo4LzFVbG1CTVo5WkNwQkdyYmUzYmFjWWFiS0tJ?=
 =?utf-8?B?QS9ZOVdQOEdxdHRQNHQ4YkFHYlV3akFSSUxLZVViaUVIU0FLRHBKcnBKalhC?=
 =?utf-8?B?eEZkdEk2U3FSb1A5NkQ5REJOc2NCWS9CNk1FanlNbUdJUzY2dzFmMHFEMFhq?=
 =?utf-8?B?aW5rTnVDaEhRSWlZbXRzN0pNU0IvS010RzR2bkpkdnRyYXBRRHI0RThOTFpR?=
 =?utf-8?B?OFU3NkxwSHVqOVlCVHVjcDB3QzRGMXk4RzdYNjl2T1dMZnFXS0xXZzZhcXlC?=
 =?utf-8?B?eW90Y1UxSDFRcjhMdkRuSWRVbFlibmlTQ01HRU5uWW9ibVpLNmJkZGtkdFVj?=
 =?utf-8?B?MWd6VTY5UTFaQU9RcXl6UGcxcDJIT2w1VkpYYzhXMjR2U2oxSWNKWVFEWEZC?=
 =?utf-8?B?VnNBNDFzcTBWd0IrZ0JrWWFqVUlMYUU5UnAzZzNSa0Z0Q1ovTHI0a0diamQv?=
 =?utf-8?B?Qld3Vk1hWjVWcVVhZ2dZQ0Nnb2NVdUt3bC9vYlYwZkg1SGZHZC9RVERQOWdl?=
 =?utf-8?B?Ny9wdUI2ZmQrUFh3MHNyMG1abnN0VlVRUG10YzQyYmh2WkFzb2cxanNGeUVZ?=
 =?utf-8?B?dkRpVGlkNzBPb2czUXBTQytoZWRIVFNJQy9YbmhXVTlpQU5yRjFQaDFVcDBu?=
 =?utf-8?B?UEw2Z3pkUlhvVGw5Q0lremIyUU1FRWVtYjRseGQvN08vc2pYaURPWTRFbjJQ?=
 =?utf-8?B?bnBSK2dBaXE4S3o2MEVuR3l4OU1WVGY1R01Za2E4ZHJTdXBoUi9MSFZMY25B?=
 =?utf-8?B?K0RqUDdpbUxCcFduZ0JhV2tHQkNwOXVYWHFRSGNVcUp3RGo4Z1YxQ29MNGVH?=
 =?utf-8?B?VXZLTnRhQWRyaWJtQ1VqcXIyejlJRWdwdUx4cTVOcldEeEZCVTdqM3Q1Rncr?=
 =?utf-8?B?RVlpcmFnOXdzOUZsOUJWT0h6SGZSTXlRMy9JRlc0Rk9vUmN4VWdUcXBlbzFu?=
 =?utf-8?B?NlNlUlpsK0MwenJ1MTR2V3RVSjZoWTh4SXY4QmU5MmFKNElmdEhJc1BUWERs?=
 =?utf-8?B?NjA2ekhnV1J1RHVnUWN5WVh4TXpvU21ybmVoVUQ5UytvS0cvVUpNMm80Yk5i?=
 =?utf-8?B?Y25nTnZEZE03RFBlemtXRHhjR0ZxU1k0ZmFicC9nZ0NxcktrOTlWWkM2MHFD?=
 =?utf-8?B?N0VRbjNBUG5uc0QrOG1FM213VzVnL2NNRWExdzVRQUFoWk5tS0M5NW1jakdL?=
 =?utf-8?B?MUxYSk9pUWZUc0xYVS9zMEpYY3Q4dDF0aEpweWpmUEpGc000UGpYR1FtSVF5?=
 =?utf-8?B?MFpuQ3RROXdmS0pFTXVqOFVMd2YxaU1LQ3dTYzhteXZmYXFTbVFSNGlIQ21F?=
 =?utf-8?B?d2E4ZisrV25LRUtsYzFaSTR2bDk0L3RHL0RzT2lEekFadkJwN0R0UHh5bm1M?=
 =?utf-8?B?b2Zkb3RadldlL2tNaEg2N1MrZXVmeVVQWjBMelhuaTBPak9EL2dmRGN6M29q?=
 =?utf-8?B?enQ1TzM4dnpNNG9WNXZrcG1MaVBYQU0zWUdwUnVuYTdKZURWRDV4bU52MjJa?=
 =?utf-8?B?aVJ2dnlBSmhoa2xIYzg5RHF6aHM2THFFNS9BR3hCeDR5M3NheGczUnAvUEk3?=
 =?utf-8?B?Z3BBUDk3Q2ErTFZNdC9PTUtrWEJ6VnU3c0NSd3l3TTBSMlBCV0t2UHhZdmlw?=
 =?utf-8?B?c1YrSDJFekZwdlc4QUxjU2ZNZHFtaGg3UldacUE0MlJ6RGJ2Rk4vMVhGQmJr?=
 =?utf-8?B?TXJ1dzV2eEpGSk4zYVRVSWRPdXkyN2o2d1dRTXpyRGlkamtSZjRzSWxxdy96?=
 =?utf-8?B?YzdDM0xFOForYVBOTURqMDZEUTNLRnhDQm1jdGpuRGVCdXJTZC9zRm8xcHBK?=
 =?utf-8?B?OFo5MS9NSk1kVUNIQjhjR0ZscFFoUUJEbDZVV1grWGtJeWUzWGpqaGFrN1Fo?=
 =?utf-8?B?Vmg0OE5mK0VwY1F2Ri90bGUvUkV5VXN0VmdxMW0wYTdzOU94Z0JvclVvME9x?=
 =?utf-8?B?VmhLQWQyYURxUVJuRDkrbk4vZjNBVFcxN28xaUIwQWw2NjhJNlN1YmVzODRO?=
 =?utf-8?Q?immFSj4GeMjJW9JRH6CsnErHObYxbmtHhIBu5wZga1B01?=
X-MS-Exchange-AntiSpam-MessageData-1: 0pH2bZ9RsKNd4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5a1626-ffea-4f11-106a-08de5bd8372c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 06:08:53.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6P13XavpeR6gg4EfKzHv1Rhv/vyHMEX3OYFf7Jye5FJL/uAT0SFW1aDi173MIkRLyr18vTnQ3VzL0eIyQSQcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

On Fri Jan 23, 2026 at 10:21 PM JST, Shivam Kalra wrote:
> Remove the redundant paragraph in the documentation of __new now that
> the Safety section explicitly covers the requirement. Additionally,
> add an INVARIANT comment inside the function body where the Bounded
> instance is actually constructed to document that the type invariant
> is upheld.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72mUCUh72BWP4eD1PTDpwdb=
1ML+Xgfom-Ys6thJooqQPwQ@mail.gmail.com/.
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Shivam Kalra <shivamklr@cock.li>

Thanks for following up on this!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D9223322
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769040900; cv=fail; b=WaTh4M70qD1vAcUiWnSZ2ANcLoOBoTIz7Ehkz7miNBnRGqrPlduqXd9h/00MpYlsbzhk2O+8PDBBudC9YR2XUsTdUvlu+tWlzUShLI+f2+dfujaC63q2G6xdmpZBTUTtdIP4CFKQ7F8cEYW45vAtTXO0g94+iT5+/q7VuX+b41g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769040900; c=relaxed/simple;
	bh=Ul+gerz/N9KEkIlIuMuuBUWj1Vx17J3ROYZpjtQapmM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WH98J9VDjz0xKN7YwaSH+k1N2Qw1CBjLJZdyKwhXgSNBOIWYzYHskcc7D1PQ1jC8hNmdA0F8r3gz29DcUP1x5CX4u597Srm4RK6zTVGarz7ogdq+ihJeVkz8sCez21/8cie7xhH2laGeqCgtqxnSqqZ+r02IzrN0LTR+8Q9XMYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DXReNyzZ; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DXReNyzZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmc+XVlyPXjhKyq3ezkx3hSQhLblEIrx7tHoLMuzpzoe6aNDuH1dUHQNIr3VfrViDByw/cHmKmAttnBS9Drr1rq5y2kQtJnp3c6uuGL7kwHESA6N1dCacdSy27PyaPM86T/Y0sJGGhh89w+cSVV0ELqTQMaA8rV7chjpC/k81vVZUhM4i2MsnY9+jhvXEu0kBw2X8b0u7R1t431OQSlmU5YkWGl6AdTINfyMiLJ3adDHJTsJyost7VazJ03jundgCQrlqV3keAWPp06uh4Sf0MCq48CYGlcIySo1/Yeag/DAffCalsSf/I3kYg8PdQBCtOAhLNyZ/vJbRtsuDCsBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWdkC6+fY69hp4cd/Ogy8Ucxp69PvFjLQ/ZsHxwyUMY=;
 b=sbo09l/WscWc0HQzHViLwedNxUhzoVExhp2Ou/GsJdx1/cI/+Ubjmd+IB3lqlQmGnRb/dtHSYRYmjtzjRh0Wno7ivx+Ok1JErpyHDcZ5lytQBCF/DSrOahhglXGAGyQ6PPbzU0vgRtgNUXC2lLQUe10/jTg8QQI4Y9FcyWJ9MHzOTgL/q34fXse9ayKWk5vtbKHJnKMDMQ8LqMKgb2wXyqybLDIuqVDWtOjsqvve5pgBP0BhzFT8ZUgNTHQCn4XmG3E4CG9GSyFrxrsFDXk5k1RPM6Sjs01zGebA6U1tcErOFhupWo1uk96fFAPK1vpNvl4VflNvq/Zz/7uvB2UFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWdkC6+fY69hp4cd/Ogy8Ucxp69PvFjLQ/ZsHxwyUMY=;
 b=DXReNyzZ2BE0pnme/aE/aQNLC0EJpI5uS+5oeZdjhSycvi0KeoLWY2q3jS7WTECwUQdE+1o2eHPZChpTQH3Wn3jvzpHVwF06aFoUGPwzZtVPjCxH6xJm+aLHs6Swxxuu1Bi7GT30NrlEmbZA5/1vApD1EuaBKnufk9qAE+Agy2ztp+VNVHjHBbmBfmKE5oj4C00bk7Gtx88Z2zQ8xcb+em2j4vzYIROKXBO6rT+sk1ZjggK2Cp+HRnNC5uLkH9etuQAm1g3GgCQw28oXRg/rtH21CnOOMiAu1KtN/RIdFUaK8zUm9IJZAYD4siUCuECRBw9ulVbu4HXjw8b34+aILA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 00:14:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 00:14:52 +0000
Message-ID: <e7dce72e-d0c9-416b-8bab-328b97fcdf30@nvidia.com>
Date: Wed, 21 Jan 2026 19:14:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20260121235302.1962185-1-ttabi@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260121235302.1962185-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45)
 To DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f24f87-dc75-4b34-329d-08de594b42d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU5uR0trdlovZFJaRE5UM2lhcU93VXNGUGtoMDA1MkZ1SjlEeUZlMFNvbG9j?=
 =?utf-8?B?R3VLNDRjTDNGM2F2ZGpCa3VjNDFjYXY0WEJMdHFyR1NQalo0eStDYXplQ2xE?=
 =?utf-8?B?cloxd3hyT3FsMUNXZGIxRE5PL3VKaFVzSzg2Z0Yrcmg5MmlKL3hvZkRxUTVZ?=
 =?utf-8?B?and0TVhJNUZOWHlSWlkxUTdzTEVIc1lxSHljbW9HRDhMaTB0S05GaElTbk1U?=
 =?utf-8?B?UGkzSkh4UFVhV0lWR2x0VTZqWVpyeFlmcXBtVnVFQ1lDbFFRb1dkZG1uU0o3?=
 =?utf-8?B?Z1pqdi9mMzNkR1IzcithMXkvTmFOKzdidXRHQUZ5ZFd4UmtZQU9GWEZUb1h4?=
 =?utf-8?B?RGxyNHhlOE93WWR2cEhaQ0FBSlZjYXpXdjFQWk9mSUNwdzI4OGt2a2JrL242?=
 =?utf-8?B?R1B0ckpIUC9Ec3dKYm9kcW9kN0tBMmxWelQvdXFWVndFeHc4MTBMVG5UeEZw?=
 =?utf-8?B?bzVDSEg4TVhYOTVUelV6SWFJUnRIS05ZcEpFMVhaQXRwa0JPN1g5dmNMWFFa?=
 =?utf-8?B?elh2RzlOSWl1RDJhVTVadFp3L0dvMWVVS1NReS94Q1RNVEFzM0lUSHRtVG9z?=
 =?utf-8?B?clBXSDQ1VHpOQ2Y0UjdjT0RqNjB1b1lqalh0UDhoWWhSRnJtVzJCdkhGNy9U?=
 =?utf-8?B?bkVDaXlMZ1QzMThrY0tubEdjSW5iWG56TTExOVZYbXNMMEJncmlVS2tBMlB5?=
 =?utf-8?B?NTg3ZHZIUTd3VUJpaHdqbW5FTlhNOWh0WFh1UjYvNGluRllCZ0RId2R4M1Zl?=
 =?utf-8?B?SlFwdEQ0MXRTbHc0emM0L0IrOGI1TzhHRks3cVZRZVNIZ3p4bDl0QTJmamd4?=
 =?utf-8?B?MFZSTVRBdVZicU1USXVwQXZ2NTRreGVFbjRiUDV0Q0lpQW04QXU2MjFOcTEw?=
 =?utf-8?B?VHdmN2ttcVliQ2pmdnRvOS80aXJESmRjUktRcGVmajRBaDRTWld5OXRoczdS?=
 =?utf-8?B?OUQ3T3R0OUZIRlZKc1p1alB0L0JVUCs2dGNsM2dhckJkbUtZR000cC9ITE5N?=
 =?utf-8?B?UW1DVUNZM2lRYjEzNWs5OU8wN0hBSi9RbVpaWVJodzVwZC9FVHN3OW1oNHdl?=
 =?utf-8?B?ZnNjZEFQa1d5K21XYXRlZUlnSkpYSDBvQk5IQzB3aHQ0NGRkQ1FDT2Q1VCtN?=
 =?utf-8?B?UWtKbXpEWFQxRWJ4YldnUGlyZFJ3V1JkSHlVYThoTGc0Q2lMRkp0ZHZNQnQv?=
 =?utf-8?B?UVlLSnU2ckFQMW1USHRKdTRPTEhTb1AwM3RwZWN3cXc0dkRiZlpHYjJiaW5s?=
 =?utf-8?B?b05TYlRsc3V4OVBjR09SVWMrWW9FUU1jOHRJZDRFb1g4TlU2NjdaUVZaR0p3?=
 =?utf-8?B?WG55NHZpVGcwdFF5ZHc3UHc2WXhiQWVUdSs2TUs1ZnJ1ZDFUTkVWMXI0TDJH?=
 =?utf-8?B?dXNpRFdCY05XVUw5N1MwVUxmVkgxamc3dFpKQS96bUVNclcyUUZUQ3JyalY5?=
 =?utf-8?B?YUNvSVBZSUFxUWdGUTR1Sm1IbEFJQ1ZuTVQwSXJsY2owUVZ2Z0cvaEZzTlFv?=
 =?utf-8?B?OG41c1A2Ukppb2Qyd0NTdGdsYUlEWEFDYlhqc1c2em1RVWVTR0R1U3ZhRklR?=
 =?utf-8?B?OHRnRElhNjNyeEhITUVQZVZkV1NSTmw4THpzOVFkRENzZ2xEUG1hcFRJMUVq?=
 =?utf-8?B?Z3B1bDFEU2lWQWx2ajBIZ3NyZEpEMUxPZTBBWXB4SXpWc0p4SHZGcngvQW4z?=
 =?utf-8?B?VEFmM1g2MWV4b0dTaDFrYUhuRVhtWWZ0UXAvTTM5bEY2V2pLa0RyT25MOHd0?=
 =?utf-8?B?VGxVVUQzeW1jRUU1VVhyQTNocExOeEE1d1Y5a3RoYmRQMHg2ZkdtY0ZrQlpE?=
 =?utf-8?B?TUlmTFFXd1kvcFpjZGsrM3Mxei9XM2J0NW83N2FXczR5MmQ0ZzJmQUU1Ni9G?=
 =?utf-8?B?eHdnTmVydlRMZGM5aUpLK3hoVzF6emRLYnpiVkdJQjVBWDJFam5SU2p1cWdV?=
 =?utf-8?B?ODhBcjRMV1JMNHU4eE5xOUhjY2dFdUtMbHcwdXFNYWFCMmVJNFFnb0Y2WVo4?=
 =?utf-8?B?TUpoMmswdHY4ZGN1NTBVb0k5eDJrRUNhb05MTjVsTmNhZU16TDB5NUcwakc2?=
 =?utf-8?B?bHBtL0plZjV5UE1qVk5pM3BXV3Q0cWNRd2ZvTitUa3k3RkUzbHVPdWYyVzd0?=
 =?utf-8?Q?8jns=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkF6dXlrVjBPakprbmZmc1pOS2lNUWQxTGNZZ0pUbnZOdEExOG5Qdmp1eng1?=
 =?utf-8?B?QTlWeW1DdnVEWnBPOGlPTDRzYy8xTFk1cVNCUVZidmljY1lCbk1wdzQ4ZzI0?=
 =?utf-8?B?VnZyUkpPbnJSWm1yeEtPWnR6VWZ1WmhaOVF4Q1htYnZ3RkV5NTAwRjRpSzNE?=
 =?utf-8?B?ZXg0OWNFamFYMS9CYSt5eG1kT0tlNHVLUVMyeHQyZzAzclhoWFgwcUV2ZWkx?=
 =?utf-8?B?U0dEUm1TYkk1dC94YldUeDJvRVUxUzRNR1pnbUp1Tmk5aGg3cFlQdi9ybEF2?=
 =?utf-8?B?NjRZaHdwQ2xsa2luaFdvd3ZtVFZIREN2UDA4Rjl0a1dlZG5KMW9OUGpRY25B?=
 =?utf-8?B?RUI4VHZtaGc2ZzVtdUxlNmV1SlppUTJIYkZpNVpXUWZTY09GVHpNQTZzL1ly?=
 =?utf-8?B?ODIraG1zcWJJZ3BWRlBwMGVHY0k2UHpWWndHbWZJcmRURTNqcTFQL1RzR0tU?=
 =?utf-8?B?ZFltc0p6VkllbkpWVFVFZVJ2UWVSUjNZOGd4YnBhT1ZRa0VzbXpQU28wcGdj?=
 =?utf-8?B?VCtZQmd5STBLSDlIVmxXZmxOV2JBSUJkQVhIS0t2bWRhUU9HbmJ3cFQwMVlM?=
 =?utf-8?B?L1JtU3ZWSUFoaFdmTU5UNlkyUlAxYzJwamZXQ0dwaU83R2tkQ001V1NJQVpB?=
 =?utf-8?B?Sm1sanBVN0pKcEc4U3BVdDBlSkt4OGVNN2dWUy9qU0xacEw0QW9OcmtEckZR?=
 =?utf-8?B?MXBLeitLdnZQSGJzNW0wM1JleXZpWUZVY3lGV1M2SEZ0WjVSb1d3R2lEd09y?=
 =?utf-8?B?YWR5NUVMSHVQSFBYRXJHZnJiUUJiWisyQ1Q3d1RKcjZZNnBRbFlWUVBvQitp?=
 =?utf-8?B?eDFiQXFhN1JOZGlyeDNzOFZ3SnI5aTlGdXpOdk16bHNaRlk5aEFvNzFNYW5j?=
 =?utf-8?B?Z216bm8vTHBROGw0akRWM3cvWHVCRTNLUS9yRVlrNWREVUhwNHN1dWV1THVr?=
 =?utf-8?B?MFlpc3lwZ1hLb3NRUmtUMVhlUExsalZLTlJ4U1BaVGx4WjFhTHY3a3Y2VmJH?=
 =?utf-8?B?djVnSUc3a29jcXN3aFovZGJoMmp0bEgvQlEwTE5wTFgwTDBCOG9IRXovK0ZV?=
 =?utf-8?B?UTZoc0RsM0VTQi9zMC9lWmgzZTMwUytSMGJQQ1g0RE04OURjMlArcGgzNEI5?=
 =?utf-8?B?aDVjc0VLS2wzTWhNYXJhZlNBMlh4b1AxNVkxVFg2MytDNjhyREg0YytrSmFI?=
 =?utf-8?B?N2dkanF3Q2Nib05KZmoyb0pMc293N2JxUTQ3MzdGUXJsWlhXQTVpSzNETGhr?=
 =?utf-8?B?dWcyVnRHQnRSRkNaL1c2RGVIVmxsbDN5TjdydkcySnpwRDZSdEdRZW1iOW0w?=
 =?utf-8?B?Rkp4ZzB4dXdQbmszVDUvOVRKckh3ODhMc21PTlBWMDYrSjFrc21XRnExazB4?=
 =?utf-8?B?enhsRklZM013T2YyeWxmS2hJSUJlaU45amtTbk9WQVlGc2N5U1IzeWRETDdV?=
 =?utf-8?B?OGxtblRDcWEyTWN2OU9vc2ZESUhVSTZHVHdlMUNhMmNlUXYyUzhGVWt1dzg0?=
 =?utf-8?B?bGgzM0M3MnNuTVlVSE5idExKWU92S2tTMWdkbHllaU90RHlQSnFxQUwva0NT?=
 =?utf-8?B?V0tVcUxuckFFTVA1d05nZ3BvNStYOGk3OS9CMm83Z1JKcFlUMFJJNVdYZmFp?=
 =?utf-8?B?dmJNaktyVTRlZVF6UW5KSTM1T3lRbWl3Q3FoUStXc3BmSzZLUG5SL2g4Sk9J?=
 =?utf-8?B?MjU4dnNqRkVQNTVleitVS2c4QnpwL29yb1A4VEppU3JNeGNxdlFROFhqT2NG?=
 =?utf-8?B?TCtTTkZ0RnFEY1lPS3MxQ1VrTDEzbmw3UW5qSmRNRkVlS291bFpMNGJTYlpL?=
 =?utf-8?B?SHZodngvMXZqajYyVlh0ck1UK2NnYWdTekpqQW9vdmlqU2hSeGtLdStOUXow?=
 =?utf-8?B?R25tU0RSeTlxazVYQUFkSTBtcll0TloxTzViSFVycHB1a2tGN0I3Z0lkU05s?=
 =?utf-8?B?V0RVQUNFYVN4RG92cFpkN2RTZUV4T24wMkFCeWtzdzlPUWJxSUN2NnlXVTdP?=
 =?utf-8?B?b0p5Z1FJNCtXZ3JaWDlpS0FacUU4bFRQWkNxZ1oyVkZTRC8yRTduNFFmU1Qr?=
 =?utf-8?B?bkpWeWMwLzVTbXM4cjAwWXErcmF6UFdmQUM5OEUwVnBpYXBmNzJnbjdyVnAx?=
 =?utf-8?B?VzE0eWl1czNFUzdCbEhoUkxKMGw1Ujg1TmViWVYxNEVGdjFOUkJsQTVJdkd5?=
 =?utf-8?B?RnEwZWZaTmdKTHpvUDVzWVp0S20zYXZWcEJFNDZwR1pNbzVxTjF0Q3czL0hN?=
 =?utf-8?B?ckcwamhpZU5SMVRaSmMrcWlJWDZQU1QvblU0cTRxcjF4SC94djBPd01vME9D?=
 =?utf-8?B?OFJyRjYrMXNYWU1VRzZOVzhyV2NWbkYzbkRqU3NZZ091empzKzFJdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f24f87-dc75-4b34-329d-08de594b42d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 00:14:51.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULWtPCS25dCOPoctjw4hS6IjDMH0X9tqTyIsdFfZQNWvjY0yCIL4cc21v+BA1okC1f5Q2iw6wwCMYTBf6ZBEow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266



On 1/21/2026 6:52 PM, Timur Tabi wrote:
> Note: This patchset requires "[PATCH v3 2/7] rust: io: always inline
> functions using build_assert with arguments" in order to compile
> with CLIPPY.
> 
> Note 2: This patch set does not include the upcoming refactor for
> handling the Generic Bootloader.
> 
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
> 
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
> 
> The latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.
> 
> Summary of changes:
> 
> 1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
> is used.
> 2. Because of non-secure IMEM, Turing booter firmware images need some of
> the headers parsed differently for stuff like the load target address.
> 3. Add support the tu10x firmware signature section in the ELF image.
> 4. Add several new registers used only on Turing.
> 5. Some functions that were considered generic Falcon operations are
> actually different on Turing vs GA102+, so they are moved to the HAL.
> 6. The FRTS FWSEC firmware in VBIOS uses a different version of the
> descriptor header.
> 7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
> aligned to 4KB.  So pad the struct to make it 4K.
> 8. Turing Falcons do not support DMA, so PIO is used to copy images
> into IMEM/DMEM.
> 9. Load the Generic Bootloader from disk and use it to boot FWSEC on
> Turing and GA100.
> 
> Changes from v6:
> 1. Miscellaneous refactoring to FalconUCodeDescV2 code, based on review
>    feedback, to make the code more consistent.
> 2. Added NV_PFALCON_FALCON_ENGINE::reset_engine()
> 3. Removed `port` parameter from pio_wr_bytes and just hard-coded it to 0.
> 4. Removed supports_dma patch
> 5. Renamed pr_wr_bytes to pr_wr_slice
> 6. Simplified NV_PFALCON_FALCON_DMEMD loop
> 7. Misc minor code improvements based on review feedback.
> 
> Alexandre Courbot (1):
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
> 
> Timur Tabi (11):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
>   gpu: nova-core: add Falcon HAL method load_method()
>   gpu: nova-core: add FalconUCodeDescV2 support
>   gpu: nova-core: add PIO support for loading firmware images
> 
>  drivers/gpu/nova-core/falcon.rs           |  252 ++++-
>  drivers/gpu/nova-core/falcon/hal.rs       |   26 +
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |   39 +
>  drivers/gpu/nova-core/falcon/hal/tu102.rs |   77 ++
>  drivers/gpu/nova-core/firmware.rs         |  203 +++-
>  drivers/gpu/nova-core/firmware/booter.rs  |   43 +-
>  drivers/gpu/nova-core/firmware/fwsec.rs   |  178 +++-
>  drivers/gpu/nova-core/firmware/gsp.rs     |    6 +-
>  drivers/gpu/nova-core/gsp.rs              |    8 +-
>  drivers/gpu/nova-core/gsp/boot.rs         |    6 +-
>  drivers/gpu/nova-core/gsp/fw.rs           |   14 +-
>  drivers/gpu/nova-core/regs.rs             |   72 +-
>  drivers/gpu/nova-core/vbios.rs            |   64 +-
>  drivers/gpu/nova-core/vbios.rs.orig       | 1105 +++++++++++++++++++++
Extra file? :)

--
Joel Fernandes


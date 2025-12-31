Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B8E309DCC
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 19:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767209361; cv=fail; b=u3mvU28XD6/tV9zw5F8GSThX0Iay3rtcPfogpfQ2z1W+j5cjAZo6eAlzGm6TP79Kqgg/LFM7HhZUhkeCE9USjqzcx2WMwOVv5lYPAYG58BwPMixhqjaHv6Asn0Cxgmzpt+3mqB0zsfvqKxdKvbbECxI2nuSsJU1jZEcDlz50+og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767209361; c=relaxed/simple;
	bh=pEXaudzL04ExSAyluVpnTdngddeM15D5d72MFFyzFn0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=el9qTlNBfgjr/wECXGI41W1ToXcFs8KGibNooeRmdzJ69YMADHP12hSm3vC/ub3e3co1FMZBLXV9h/l9MsRuOq7kOvmBhbj4+uPjcLXMQyM871PGk3p5jQ3t0JdNJGvsfK4itQf8gHnNItQCEOUg1qR7QiVMWtnNdtp1C35FbRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OB4cy0gT; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OB4cy0gT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8nexOyzcsrUqQ5bnsBrS1Ox7hZeCYDJ7MATIDgC4T5jJiCjp84aJ08qj17kZCWtxiO4YyuMwBMjU+ciSOjdfbxNkVHoLJPosfVK3RDu4V7KStpZMdDBM2bRzlI2pxcRlKWwxqj3n81W/5rN6/k27r256/BhOnCMc/OPoaBu0UEXGFxiFdEMNStEcdf1tb1fWhHKzekK2fjqAiobrlZMk2RuHzEdGxLNvRMldyudyfMlMRUxdVy6h8JzacWv81eYYjhZFJ2kj6Ml6eMW9qGgHC87z3TDYMOqhnwjOb/HZ8LTzKFBri+D6FqBwD63Ic9lMGxpA6LaOGOTNDrm7Afoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdOWAkv+WIMuZlncX54NJv7YVlTDk2MbrrxfMma/f58=;
 b=sK7uiKggTPfw1fIEiDwstuoqIy6nM06rQjFyapYfOrhlHU037JIBie5HaiWMi+5Gmylnxiy45FC9ls9DJ1pr7Tn+zhXcIm1Q4IW16opkOp/iI6rowK85OBM/QTtd9OtiZm2HCnuMh+rnMwtDbS5aVgMHMQze6XhL840MXYPIh6WtwgyETg5pKCPY3sZCY/LT9isPOlWVTGZw02rB7ueaLvtRMghn7ugL1tgt8fps/7cvt+9GAwCv5y1kyP+qKoSVQBK48M7aorrytr7ux8hTrewjScmzdoN0SFp2RUfrTJF8lDnqFmVgYzHifOOC+3M8ahRA4AEif5zgmEFgLRQfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdOWAkv+WIMuZlncX54NJv7YVlTDk2MbrrxfMma/f58=;
 b=OB4cy0gTv8Xvo398Yb/x06eodeXDbrKo4xF5pKjEnDp8khv+6RdXxN3UkcxIHIk8wRKME/JCDxAGCm6vXMkQG5N3DU3gLis4/rUCiNQQjwNxkARS/waoexbSnOrVR38WMDO4LsapeWcXyppNtrBn6UmiwGRxIkq2uuK0LkMTKm4rfov7q0k9pRS44ixIrwUq04YDLhhUtRChwhaT2tUTHSF+cGCbeEV6Im6YA69neDLGgYHnWsWsnJXoZ7s1vJwboPwN9mcUp2BVJxiiT2zF3eHgckQGMDXNynaRC8fgSGAk2Z/o61Hv+sbK4Ic0YcB7xLlhN+xp0e02PWBs4A4XSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 19:29:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 19:29:17 +0000
Message-ID: <c46e4a91-5dc1-48d4-92d5-f665df2315e4@nvidia.com>
Date: Wed, 31 Dec 2025 11:28:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-5-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-5-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4bb8ce-6e26-47ac-909d-08de48a2e346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVczdFlQYjFzTFV1MkNpWjZYbTA0aFgwZTJSdnBTNWlEaUZBdXgrczNqdkRM?=
 =?utf-8?B?bE1SbXFuKzAyRTdSQXp2MksvR0UwVndsYVdsQ1FSWWpXTmNjVnI1WEdmUUxL?=
 =?utf-8?B?VEdrS0d3MjVRMkgrTXloQmVVNFVabzBUc0xrTTdsaUR4UHhrOUwwNFd5S2g2?=
 =?utf-8?B?RjVNR01JUGpqcW82UmIwaWVuV2F1SzBTZ0FoK2d4U0pqZndEREZtRkh0OEFB?=
 =?utf-8?B?a3V6aGZiQlZ5Zm1mSC9Vc0dyY0N3b3dqZFR4MkxoUXNvZGc2dmJseFR2UVBP?=
 =?utf-8?B?RjhOSTMrZ2ZQcmd0TkFqVWZNTjcwVmp5VDdiU21rbG9ZVEdOdU9kQmtKN0lw?=
 =?utf-8?B?Mml0WVZKcWtCTytHbk5HdkxneFkzQzNnZlZ5eUt3bXJOU0JKNnp4V20rVS9v?=
 =?utf-8?B?RUZpNzJla3kxQmJQMkFOb2tNTGNsNW5BSWs4Tk1aMmNqRXdqMUZ4Vmk0U1Av?=
 =?utf-8?B?MGtGSWI1REhjaUc3c2EySXdKYjhSM1BMUWVRWGRvNDhYbWFXWE51bG51YkYx?=
 =?utf-8?B?S3E0aFZ6Qzlna2hXOWw1Tk1oRFlhMDh1UWUvQXZaQnRZM2hkTGFhbVBKOEVw?=
 =?utf-8?B?UHo1R1czUFRzbVVmUXlzYXVLaDFSVllvY25hVjQwbFJaYmU0ZkFBcDdSY3Jz?=
 =?utf-8?B?MEYzM2pRRG91SHdYZk5oTVN5di9QaTU2L0QwdGpVWlRobm9pUWZaRUp3MDUw?=
 =?utf-8?B?Q3hvay8xMXlpdWxQZjZ2QXk0MnhPd3NhdFZiQlRZYU95V244c1N4WHZhN2Jy?=
 =?utf-8?B?ZVRnd0V1L1E4RXpJcU5XdXVEb2djOStoRG5kMW9MQlNITndpWHlRcTJTVjUy?=
 =?utf-8?B?UFVDNnRuS3dKa0ttckE0N0gzWHJYUlVwVTlNVitSR1VVYUIrWDgyM3IwYk52?=
 =?utf-8?B?bmZGZ3pDUlJ3Y1h5ZUI1U3IwWks3QkVGUUpsNzZOVWp0UW0rdm1pSVdnL1Vz?=
 =?utf-8?B?cFBVUHpkNVcxT1JwLzdaNzVQcG5ManVYcExFT05RbXYyWDdjc0dpTHpUcVNF?=
 =?utf-8?B?Zkt2VlBtV0VMZ0h0RmkyVTBQTWp4ZEM0c1NLWVhjOHlubzVUVXFRbFhwRlda?=
 =?utf-8?B?cE9zQ3NiZzRFQVBrdll3K3RlampERVozc0w3OVo1b3FmTzZxM1ZJUkNNZlQz?=
 =?utf-8?B?ZUl4bmhITmpPR3RPVFhVbU83c0sxVVlxTDJsalF5MlNML3plTVJTUUFnb0Nw?=
 =?utf-8?B?aGdlb3JEZ1RPZk1iK2Y2THFrWm9VZHo2YzRsNTJhYytvUWNEU1BWOSt1VnNL?=
 =?utf-8?B?d2lKZlo2VU1UUGZLWVR0MjVxV1F4SVBXYnZhOXNnZG90bWNaTXJDa1NvQUN2?=
 =?utf-8?B?SWZtMUhxZWVRYVhKS3NDVUpJaTB2dE1CSmFQMmVsaVFBV1FuQ0JybUtaUzJJ?=
 =?utf-8?B?eVVUenpPZjZ4VDVZb2psOHFZT0IvREhoQTRlMnF2cmhSWHkwYjlMcXlpMGFO?=
 =?utf-8?B?M2ovakVsRmtqMUJoV0pyQ1J6ZjNkZGJSamt4Tk0rbFBzQjAzTmRGdUdjbUNk?=
 =?utf-8?B?NStBTlZjZkJMWXhhZnZIMXluZFJrYzNoT2c4U2R3TkU0c1N3T1pUd09XRTRM?=
 =?utf-8?B?bitDeGdabjhsYzd6RjJHV0FoaWc1YXp1eXZmTEczVU0zQlRneFQ2c0dveTBs?=
 =?utf-8?B?Q2hRaW80T1NxWkVvS3p6YlhSbWhsNmRJL3BIdVdmUm82cVBFcmFyNm1WWUR6?=
 =?utf-8?B?N1QyQVkxUGdybzlSQjZhMnoyNlJFbVhpMjMva0RMbG1nVWJhYkVTaCtvenFR?=
 =?utf-8?B?QlRVNTNUK3dUZ2Q4Qy9XajV6RWlFOWg1a0x3S0pWWmxKMnpKdk5VWVF3WUFU?=
 =?utf-8?B?bzhNYWxHcHJJcnphaVhiWWlkZEQrTzZpbitPRkR6dzIzR3VneUlVc3E2T2lO?=
 =?utf-8?B?RWNXTFkwY3ZIVTBsUEoyS2RGc1V6ZlZaSDRVMFdNRnZCbUk3ZHFWYlpSVk0w?=
 =?utf-8?Q?i3iy3ULywhRU1kjWuk/R5PF9rSz1xFQQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3R3TGU4WkRwb2drRVNlZW4xTTEyeWJqc1pZVHh3dTJwVlZUL0Q0TlJ5TzRR?=
 =?utf-8?B?RjVTK2Fwd1pSWmhZV2NWUEZ5Rm11M1VwN0RSVHljZ2xOaDJEeDJHMU1JT3FR?=
 =?utf-8?B?WWNRSDRnalBDeStTY3VobEhXK2dWM0xXQ2pSSm5SMWJrbVlheTFPbUVWd29B?=
 =?utf-8?B?aVpmN2N0VFhhUWJiZVgxY285bzZTbnhIc2NLbkV5dkdtM29ERmxCUHJ3a2tL?=
 =?utf-8?B?RTdKYjcvWEx3ajdFYVcrazZVcHF4ejlPaEtneS9VZjZ2aEx2YTFPS1dlcGpx?=
 =?utf-8?B?RUFkNFBQcEVEdlpJdThBWHNYOTd4OU1wa3NYMFNXa3pkb3E2ZFJZTXBEaDRK?=
 =?utf-8?B?UmVvaEpzY0hHUGJIaVNCUXB2bUZSQkJKMEs1aTBpeVdreW51MVVwV1A3bWtI?=
 =?utf-8?B?VnU3Vm1WMXV6S2RIN1BmaUNvSUNxMDJBdjRtZTFEcTF1dFNlaDM5WGVpbG9r?=
 =?utf-8?B?SFpJVW42aG5MNHR4dlFrQlNCRXVWVmpYeW4wbGkvWDZ4RW1rcHdOdjJMdWJ1?=
 =?utf-8?B?aWt2M2VMSHg5TFpZN3JRYm5KQ3BtUmR0dEt3MDk1OXJkZk9jaG5PZmEvNlN2?=
 =?utf-8?B?MndiY3pTTUpZbmRiWWpLMTNEZ2IrdWJKVFkrMm9vcHh5RGlDNEdiS2pQdmlV?=
 =?utf-8?B?dCthL0FGTXZoaXp0VzltRy84Z0FvdHBYTVFWckZjbGVyc3daWmZNVHp3a1dz?=
 =?utf-8?B?YkJJb2lUdi9rN3FVNWVSNVBtVXdoSVRsM3JFQ1JTRkVXeFFOVG4yajgrMnd3?=
 =?utf-8?B?ZExTWnlkaWNlaHVLRUVpRE1NWTZYMmZtWWdVQi96d0ltbEM2aVBGK1NnQ0pl?=
 =?utf-8?B?SDdKall4OWlZNHg1RXhBRkwyTXZHZlZ2TlI2T3JBc3FsaVk5VjBsMllNK1lU?=
 =?utf-8?B?VnZsSGZiK1dtR3psaHF4eS9xdW5BYmFmU1cxSi9xNjE3N1FUL2tFM092K252?=
 =?utf-8?B?aTVDck5QNkNuN3MwczZpd2Z5elI1MlpleGo5eXoxQ2luTGt3Y2tZeE5LR3ox?=
 =?utf-8?B?U0ZRUTMwY1hFbnRCT0NJV3NPa0RIYXVXeHZVUExqSDNLTkNQSVVleVZMOWFL?=
 =?utf-8?B?Qk1xM0Z4cHYyVDIzV05qcVAzUTlIRHRYNVVicStWaGNmdE03RkV4Y1VUcTc4?=
 =?utf-8?B?RUgyUVIwbldKRDYrTGtEcGdUMldielVBQmYvdWRQWGlhVEZESnUxVWVpMlYy?=
 =?utf-8?B?Uzg3WXZCKzNOLzZBWHJhOWhWUFdJZ2ljUi9LcThBVUl2RVA0TE9lRXlpZE5D?=
 =?utf-8?B?eEJiRmY2MldnbEplbmxWcVB2dFg1d21uVjFWNFoyK2hPVXIzV0I2UThMKysw?=
 =?utf-8?B?dVhORmZUL2N0N0p2T2M5ZERiWVpLMllxRVpXL1dSb2tJWUMwdE15a2FMQmVi?=
 =?utf-8?B?d0hxMkltejl2REgxOEZmZ1dCQitwdWhTdmpsalgwVVZscTJtNlNLY0Z4Umxi?=
 =?utf-8?B?RmEwT0lXTHNQaU9BUk5MTjdwSkd0VmdDY1JXWkdUNStPTUs1Z29qR3NQNUdY?=
 =?utf-8?B?R2hSU3NKa2thN0h5c2pYMGxKVWpTanphcE9vdmMvVkk1c2xHYnRiWmZXalB0?=
 =?utf-8?B?bVYyb3FmaW0rYThuSDNGKzR1bWp3WUNSZXZML2IzdGtrVFZ6TzAwaFVlWE9I?=
 =?utf-8?B?QjUxQkpqMUNHSUl3YXhuZ2Fub09wQlV6SjczOGNBUUF6Q1k0cGI5bGc2K29J?=
 =?utf-8?B?K24xR1ZVM2hFUnNZQkFoYzZKK3AzdnVOQnY2SGp3MDZpeFZDeUZvYllGYXVZ?=
 =?utf-8?B?d2NHcUJycjZwYU5GYXg3eTZWVCttQ2syZHNvLzY2dmdTY3M3UEI4N0hERlVO?=
 =?utf-8?B?Y1pHbjV3Vm1qd0tzbkZFdjdUMzZVVlNFODcveFJDQ2pPVkp5dkxSNFZvajN5?=
 =?utf-8?B?QkIwR3FDb2UxTG1FOHozQWNzWUhBVEYwZTFMQTdkZFl2Y2V2MUhjVE10c0Y3?=
 =?utf-8?B?NEw1bWdlY0hFTDhsdXc4MHhveFJxaDh3UGR3aEVhVUgvcEI4VkJBUVFSOTZ2?=
 =?utf-8?B?dERSejRuOWpQZE9JTjFYY0p4NlNpT1RienB3QURMNzFmMXZYR2E3WTh6SFd6?=
 =?utf-8?B?ZGQ0Ti95cFdISTBJUG05MnBuM1lxVTI3cUNqbUxiRmoybnM1WDRRb3RRdWRF?=
 =?utf-8?B?Q0psZWxuSmt5OHRua0NKWjJrbkpvd2ZoaUFTOU5uMjllVk1kT1kyenZJUHl0?=
 =?utf-8?B?Z2RiQmp1ek1ZWVlac290R0s1djZObnhSM2hKSVJZSG4ra0N6UG1RNnVrdmpk?=
 =?utf-8?B?S09pSjhXRTRkbEpQOVBzUEd3RHMvRUpHNmk1UkVCOHRJdWRKaWozT05Sbmth?=
 =?utf-8?B?M1dUa1IvTVp1bVN5QVhGVEQxNXk5OWxPcjFVNkFaWDM4aGdtODduUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4bb8ce-6e26-47ac-909d-08de48a2e346
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 19:29:16.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVftw9cTomuS1Zp0LG/7Bi62njy0ohRdBUWTMIxgltdi7L3ADtAOGn6Nbz08ooeFuzuvh7O0CKhSBu7shIqiRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950

On 12/17/25 7:29 PM, Timur Tabi wrote:
> Turing and GA100 share the same GSP-RM firmware binary, and the
> signature ELF section is labeled ".fwsignature_tu10x".
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
> index 0549805282ab..112488216bff 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -163,9 +163,11 @@ pub(crate) fn new<'a, 'b>(
>          let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
>  
>          let sigs_section = match chipset.arch() {

After applying the fix that I mentioned in my other reply:

+            Architecture::Turing if chipset == Chipset::TU116 || chipset == Chipset::TU117 => {
+                ".fwsignature_tu11x"
+            }

, please feel free to add

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> +            Architecture::Turing => ".fwsignature_tu10x",
> +            // GA100 uses the same firmware as Turing
> +            Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
>              Architecture::Ampere => ".fwsignature_ga10x",
>              Architecture::Ada => ".fwsignature_ad10x",
> -            _ => return Err(ENOTSUPP),
>          };
>          let signatures = elf::elf64_section(fw.data(), sigs_section)
>              .ok_or(EINVAL)



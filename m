Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639B3806B8;
	Tue, 10 Mar 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141728; cv=fail; b=ahybm7GggFf9gwUSwGWAFtTD3QAnstoLgKHJ5E4mcsAGdxCaQDi+fsxoT3z+MsG0TgnW/CcYuz6dl0Ex6R5frPzKFnnmQMl8qoFgwkp7j6t6kUteZ+n5ndMsQyLMJv5sqQ1HpR0FEL9mRPZ2nwp0vGDRavDeFVIV3zv9X1fsOlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141728; c=relaxed/simple;
	bh=q+cTrCo5v15b4ZzE6qUsqAIJnpV9+pNG+jAdr9nT9lI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ipNQib1QQudQbYfX66WhCMgAlr+hO4CZ3gqX8PZHqAtl6059ha0pQJlGfr08P0Hin8YIb0mQ/oV+2ddS9kHHEHmqA/ng07dEg2h2QVwVMLNmYtmgArX964AInr44hstCnDJWWdXtmPRrZmyLzSC1ZsHDhzx9eBWq321tjuzDacQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QqUU2HVH; arc=fail smtp.client-ip=40.93.198.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QqUU2HVH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwgVHdNBfPoPt7Bxv70kMv0mZDE1LrQySXiZI0V8dLNM4gtNAF0bzq7nEgB/mjFx2R1d1vFNrcarlpTpWZ49K33C7uWXlffATVbK5dGjgUSiwobEkPokHVucGAIfBfwS91L3P24odVHz/ErBPwyA7j8J/x2E1bEptsSOP+7oY/belpD1iZ97M7urLP7XBXbGyMQxFL/zt0X5oc2uuuzGxfhDyF0CYhB5rCz/eVnJjLhhkJOl/0//ee8poWCyDZpNXE0hh4mFByOJ745RiWYacQ85TGGNDn2FhifwOkWUnHTqSy5m7OrbbUPGcVOObKFqwvKHS2w23QuWDtYX+w8Ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+cTrCo5v15b4ZzE6qUsqAIJnpV9+pNG+jAdr9nT9lI=;
 b=XuZlwoEy0W5qBUN32CTcSvY45NkdeR8TvF2t2xsNkZ3sp4DV3kM+11ltX7ApUc6ITmY0Raw2iayFmLf8I5tDN1kQrVM/WQKrJ7u1kUcBhCatQ6N4uvBiNPGerVzsL33aXh5nM5599Nuif24I6NrdZ4qPyhR9QCC5Ftne0nCNz7kLOVEOfQ755u6z2snLyejb72Q/2CYgwqcx3MuCQ2S++iHzMNiiaHg5CJVMxIJJ6koGqczGNoNMijgDW8Gkon6TVowal6SAzVwOVZFwLn1khM1nV49FkKs92DCsbHD0h8NC0/b8hw8IVHY+ptOTVLoL9rT7xxoPvVfugySAlTNQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+cTrCo5v15b4ZzE6qUsqAIJnpV9+pNG+jAdr9nT9lI=;
 b=QqUU2HVHSixbKcjstscAYSzxgWxzW8dzTEVaT7hPEIkyDq76UIN+W+JxUhis0p3cT7C9cniiffqpzAbP9QBP1Beqkct28OAGJxubNuwoA7unR4hkg96uimVVbedl+lPjaN2SjXp1VUU69zah0Lp7oJjjoRo01jgw5MMc1/jlUtGvO3/QZx/FIlQDWjdcI24fdGzQLVxRuHXlInG0SqSx6YSAwgLO7F3DYjMhZ9ErSEO+y/rP1sOBEJJoLVkT3LRjm90I7UX2OH5vMialukHDNrAjIIHtlKVCHH7bZ16KhS9g4AzfzV5RkR1Z5UBU8bn8txwnoe+DKGOLX5EeCEvQoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:22:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 11:22:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 20:21:59 +0900
Message-Id: <DGZ2A4T0KOY5.23Y2YDXQAJ6MD@nvidia.com>
Subject: Re: [PATCH v6 02/34] gpu: nova-core: add FbRange.len() and use it
 in boot.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-3-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3ac245-0f1e-4d52-6768-08de7e9740e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	duif3D/68ZIwrBxe4+KjUy638yaAh5YUHhpS0SnLI4P661l10DTaDSjoYPX8hOWufkhhmiTdTJelA671kD+X46Nsp32AfJchfjzTQEpH/LYmWallI/zh+DRUHcdt9qghl1n1D2ZEQEEuFfSPtrp9p8XMd+BOjc9JMoaOyZPkARkjbnhv7xjAJ+z6oMuM2jpKLPvtaKi5VijavywpFH9rNMU2jgi83H5rhtNW0rrY0mP5NPH2/xA94W0IHiJfKVutg6Tbd7MU3xSyep0AjjOx4oxjuRylvXFFJqJa19jOb6pQrOXNbWiYCpKXpmz2l2ADFTElOUmyloaxhLwcxS9VoirDYW2SMGZB/OoTXjwC8O0M+OrRJHrxerVPT4rrYBb6cYE4vcd5Pu3Ozn/ToKYB/fZB0/cyQh0xfdvq0eKp4oTEO2L8Buz5Xy327F2Bk4I4IL/kck74hD66tMEMyuIel6GFJ7F9BA0PQhjjdJ/L13A3KH0xXO+q/cHAj21u/R/6dX+nQk9aqzDyiqDhWudBcg5YOmmKpWwRSQN8P7wl/x+dBRmmkPCfJ4KIgPGivTXcTZe6shXG1Q5P6T+Nak+ki0n8DTgaPx5yKzoAPqKHGEsUXsdFkac4AYcQaIpNhcaRlWoq7kgqSSzuUkAIPnyJk33/2PA80iJYyeFJKvHeI2/8lw6S4KS+7uVLumZZM1jZXs1li2qa2lVJC8A9RwQk8hChJaTmuP0lVHx/znoLIrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T254YmdZM0xCdHZnQTlxNGxRbjdPeC91Y3BmRTVUbzZRL3NUanUyNkxHU2pZ?=
 =?utf-8?B?S3Jhc0dOaW15WTZ5U1owRS9MSFcvNTlDb2krQ2pKZnE0cmsvaUozd1ZkOFRP?=
 =?utf-8?B?djM5SFFKRFNDRXVBbnVtN3JucUJON0p5UVdiNXlNSnE3TGlkYjBIYkZ2d2pW?=
 =?utf-8?B?OWMwc3NlbTFjYjV2b1FKUmpEWU1iM1pGVDFkV1Y0Vk41N0xCdUpjRDF0WWYv?=
 =?utf-8?B?akFISFFhUzg2d0s2TXZBejMyd1F5ZzJuK2tOU3ZOQzBTQng4eVd3bllUdEN6?=
 =?utf-8?B?RE9rQ2FVcWU0bkpBNklDb0oyNzQwMnArQjZETHAyVFh1b1dvSUdrbUJ2eStt?=
 =?utf-8?B?RFN4Y05scWFFVnNrbXRJSlJpcm9xWjNuaHBEdWlWYzRIK2Qwd0taZXJ1L3Vj?=
 =?utf-8?B?Wk83emYzNEpzTWFzdFoxVlkyMUdjTk0vbC9pV01uSlRoOWQ5M3JwUlJiQTdV?=
 =?utf-8?B?bkN2KzQyamN0UzlscDRxa1NBSWpidm9JNW9QWTRpTG45WkhvcVlkV0pvWndH?=
 =?utf-8?B?ZmRrbVdlUWhBRzVyWVpVTkkwbUl2a2hjc1grWnJEc2xHRkplM3RLbjk1RFMy?=
 =?utf-8?B?Z2pOWUdqL0phaWdmcDJlci9iNS9aS1RSNWFXQnltZnJDejRnY3ZDeVRERW5j?=
 =?utf-8?B?SWJNM0xqU3hrTTB1MWozOERra1VicFNPUG1aaVFzY1hzdkdybUU3V21BajJa?=
 =?utf-8?B?Y0pPZ0tjaS9LejdJOVlrMWx6aTdkZUQ4elgzREk5MDA4RGU3Z1ZuRkhjU0hn?=
 =?utf-8?B?WHcxL0ZyMlkwbVhDM1BjcEpuTjhwby9NTFk0aHV6WGJpT3dxMGc4TEdGT3N1?=
 =?utf-8?B?YmZZL2F1TE10VzM5WS84N1J1bEE4L3hQN3U1RitNcXZmMUdpOWxTMjZFSTZR?=
 =?utf-8?B?YUwyMlFLUUdjY1pDdWVqdE5VTjJ6akZYanlXYWhTN1RxVDZzc1JiNkgyUURY?=
 =?utf-8?B?aElEMlcvQktnRkhlTXNkekIvMnFIcjBMRll5WkVoZWoyQUlqRGZTYTdDeVFR?=
 =?utf-8?B?a1R4NWZoakZ4S3pTSFdqYVVYOURTK3ExbFNWWXhXNVo3MnAwcDZ4TDl1WDM5?=
 =?utf-8?B?dHBoY3BEWUV1YXVBMW9YaGtFQmY2VzdkUzArZWV5NlZab3hobXF5SDExa0Vm?=
 =?utf-8?B?VjZYNmJPRERqaEduLzFOL2xLUHhUQ0duS2wyZmlMZzZSV1J0NGpoSVlLeW1K?=
 =?utf-8?B?S3EwTmVIcDZRdXZxYVFSTUViaFN0NHNxbHRmZ3lZRmRTUFVLQ3NtVHU0eVNy?=
 =?utf-8?B?ZnloUXV5SitZcWR4aVR2SGo5aTZOWnYyd3A3WkUyR04zUjlIZWZWZ0tKRWU3?=
 =?utf-8?B?QzJWZ0JvNGh3VkhUcEVDMVRQUEdIRWRvLzJYWDdyd3VmVmlqUjNOd0VDeTR0?=
 =?utf-8?B?c1hkZVU4TC9Ib1hUL2RLbVhvNHB4K2FDSzBUNHh4clNNZ0c1Y1hiZkg0NWdh?=
 =?utf-8?B?Q0h3MENFMHRZR2hIYVJtL0xteFRyRzVRSFhETmxjV2puVk1DcW1mcHJTNlJK?=
 =?utf-8?B?aFg0NmJtRWxXakZCcVVmdlBXQlk0bDVrS0g5ZFNxZFdPV3ZqQTRFRXRIVDFo?=
 =?utf-8?B?UVZBWnJZL0ZlS2h6N0VJWENJOUdWY3F6U2RwQ3JQem9DOGl5bWVlalF4L0I0?=
 =?utf-8?B?aXh1ZksvSFVBRm41VzRvZWpHMmZ2N000S3VDVUh6U2tyOE9MalFRSDhtd3ZX?=
 =?utf-8?B?KzFwaVNIMTNyaDE2aytORnJRNC9pK1dwOVh6eDUyK1hnNWFRMGlvS1hwbVNn?=
 =?utf-8?B?aXFBanBzQTBuOWE0eFFnUTJqdXgxMDI5NzZaZTJlSnc1bERldzl4TW4zZ3Rv?=
 =?utf-8?B?cjY0SThtNTQ1c2N3UkREWEpTa25meEwzVTdpNGdTc0hXOTVPalgycjlVTXY3?=
 =?utf-8?B?OXFLam9OTUZjbkx5SnFSMlp6Z2dUbU9zRVRReVJtV3d6cnZyLytUSSt1SmVT?=
 =?utf-8?B?ZnVrRWVwbHNXT2w2OVFDTTY5aEQyOGFmVXNPNUd1K3BuWU9EdG8yWVNMMnFD?=
 =?utf-8?B?YkJvYmtiSTcrUFJ0SE1WZ2N5R21aSVk4UkR0ZWF4ZExBVGZZdXMzMHZFbWZa?=
 =?utf-8?B?d2xmZ012dS91SDhFN0hlMG5WajVDTnErbGpPUWUzeExhVmoxQWlxOC9CU1lY?=
 =?utf-8?B?YTRSOUI4NTd4Ym5ER21JaVBHb2tRYk9pZ0VTZWZEa05DaUYxb3dKMXlzYlhI?=
 =?utf-8?B?Z0ZFckxRT3RIMDZvN1psZk5DUUpRSzBJZEZSZ0RlWG5OemNqQ1RsVDZBVFd0?=
 =?utf-8?B?eWRYQTErRFJ6ejAvQlpuTWZ6ekV1V3RGWDJxakp4bXdvYmQ1bklQTXhpcEtX?=
 =?utf-8?B?RVZYRnJlT3pJNmRRQk9BbDAvdHE5Uk5QeUtpWm95VnpyREloVmlQVFRva3M2?=
 =?utf-8?Q?o4MAGcXClNFATcM4MFnOewVpQwtMvcBp0ozUGTnytEwqm?=
X-MS-Exchange-AntiSpam-MessageData-1: PNljbGDyWtu3Tg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3ac245-0f1e-4d52-6768-08de7e9740e3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:22:02.8364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7645u9I3c7qbczualmxNC+j7Ko79KuBkp0EczEcSI35eGPK7BUerqhXk8znB6yNYzRBg1RnpmJOHqADK5vNIoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136

On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
> A tiny simplification: now that FbLayout uses its own specific FbRange
> type, add an FbRange.len() method, and use that to (very slightly)
> simplify the calculation of Frts::frts_size initialization.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied to drm-rust-next, thanks!

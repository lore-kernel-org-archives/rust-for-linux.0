Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF319D08F
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518774; cv=fail; b=b0i+53G8eMJJ6QPl8bQuONdD5244yoVEqgF7wDmWsg4zn1/mkp8CwUg3YjyCEWE6qwbkleGZBsHbLn7Y+AM1zW/H1CDbulmGncLKVeU4Gom7fHnA2kQeZ+CybBzkF/s69t2lVk8XFHBM5UvYoJzkyq8Zb5mCRks9f1IwFb2PA8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518774; c=relaxed/simple;
	bh=0/9t0AKoVc4c4xzUyeI0cqeYTGGiA64rhD7zpUr5V5Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=btoI9VCUV01mJxDsE5Knboh3yDjW/C6fmxYqOBW+gdaM/9XmoiwKQIFJnoKqPvnG926/8xzlhzOkLPxkSs3OkdwYIQgC/ZJ1NC4JXIJsE4jQ3z8eBiHhBXLqqlSKJ+07IJAnsJ7acAMXQ2wTLIfIdXmFWc8nNbGZTEzO+cebgCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eROMvEkl; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eROMvEkl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmplftzCbS7045dt995jxGbmpvWRPVmqvdfLim+Xnu2usKaiofd5FbZk5zVGwV5/EgsvrzB6GuyhDjnuh5D4ynbTgAYBvtl+2nLvbbSgPmtdCfvPdQF+fQy6SU+qGsH/8aUxiDDfaR3YiY4xunSTpqkt8xWrEkudfAQOj0htdmEYBheOUs5tJGaRh8hBThA6n/j0EDCSxI+en3Iq5h8orU5RbQaa2/RqYY4PhmsmuCbz4xH/k3H6DBzI1LO3kJ/ESSlGjIhpx2AsqyHCLzrJwyjZKCET/icbdvfeteRfEBaZcBGT4+zBgCRhWDu0mh/DwDvm3I+WtfXqClwzbsvcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdgFFaKF5DRAzYtq+aJLqmo8r3S0f0OvE5h0fuMr7VE=;
 b=jJaFyw8XdPqB8AwKTs12TspmOOrvb0yFQZIQaP0rI7Uf36GvK09RHK839/L7cPsJUjjMpUBiX28PQrCnoM4Pl2MrqigPRk6+qXB3t8Rjl84o6w5auOr9/Qd4Y72IbvQAKPrfkznzPtdPQyWpfjPS/b8MLNj35nII0sty3A8tbRESUC4V0TvIj0u2At2PwZtbs/TC/dKQm7VQHjh+LLU8ZzwkUIHrNi9OmxqRyDA4Fz+kS5UjA1ZD0A2B/GTZthei2e4v0//D168npIuqQIiUR/sfuLZLJxc5n3ZDi9HWoymB4n9CjBYn7LIO5s2E+Gh8JWAhMpHKcfFqlF99cky8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdgFFaKF5DRAzYtq+aJLqmo8r3S0f0OvE5h0fuMr7VE=;
 b=eROMvEkltnsd9UiBAnWsRKfW8nAFRN0f8VaqSzjmx5YhysS9xukip1yXD7wRgLNmwVn1Y1Is+cMAGiWPLId7u7lu4Cr+ZxqU5mByQBEypudqxo1yU6W5M7IcwJIpBjA3vwlt/x9J7NS4K+gmlZwOuA6KvGfHSnyo2JEuv22MZqadyrnawMhNZaBfT7eV0maGN9doPRxey48NvlCdUmZOFbHJ9ri3qwgKdOaYfyiw/QiQxgHyEsCd0kxKWAtTnMi9YZweQF4gYI07yi9avJovTabQ5sm3PgXXVF2vEODxLAXx4o8B3FOFhjyYxMmqS8eW5W6dC6gM8xsuYivjhvOpNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 18 Aug
 2025 12:06:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:06:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 21:06:03 +0900
Message-Id: <DC5JGQHBJ37U.3MFJ8XDQ3TVCN@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: page: define trait AsPageIter
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-5-dakr@kernel.org>
In-Reply-To: <20250814093427.19629-5-dakr@kernel.org>
X-ClientProxiedBy: TYXPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:403:a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5481c5-5cc3-4374-c06c-08ddde4f9ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWczMEE0MVF3eEZJSkx2RjlLWFBja1YzdmJkait3U0ZHcVZvOWNYT29JYVFo?=
 =?utf-8?B?RDJ2SFdVQVFLb2RGSlZlOWZZZ0RBMlN3R1VKWG9UMEFuV0xKOCtkT0RUdjNQ?=
 =?utf-8?B?OGhQamxwRHpUcXZsZjVrTmFRUkk1VFErd2xNRld6OVFrNnJYMkxVQVdIWEwy?=
 =?utf-8?B?OEV3NG4xOWhwbjlFMkhxMisyZDZ4QXMzNXRFTG1ZMGErNzAwWEJaMEdiSkNa?=
 =?utf-8?B?NWhxRVV5TmkyakY5SHVoYzk1RmcwcGZQbTF3VHhIeGxMcUl0Z3paWGlNTFN2?=
 =?utf-8?B?dW5JVEdEa2U0SC9DNFlXNnkzaFFmb3dlVXBEbm1PNjRPcTBLWHUyTGxkT1ln?=
 =?utf-8?B?QWtZQlB6RDhQZjlHeFlDQWtZY08wUDlhUmJKSHM3NzNmUG9pL0hpc0pxSytS?=
 =?utf-8?B?TDR3RW1pTXFMaFdQbDFiZGtUVk9tdDRicDhNVjZNKytiZHhlVSs3b0hiU2Vu?=
 =?utf-8?B?SlRNdG52MG1VbHhuMTQ1QjVZTlRJdE10WjBZMkxWN0tYMXp2RVJWV1dTeG9m?=
 =?utf-8?B?S2JNaHdoMGlDeVJoTkd4UW9ObzU3VGxTOHNXSjZNdEtlMTdBT3RZek1KZUJs?=
 =?utf-8?B?ZVZYUVhLdW5GVUM1V21jTi9JMm1nUEM5V1BkemE3S0M5ckZPOFI4VDc0TXUv?=
 =?utf-8?B?K2g3RXBkRXFpN2RNcmRqRnJxVjJjR05lN2pJTzByRlFHalRraEoxSk1hZUM3?=
 =?utf-8?B?UUVLYjUybXRBZ3JtYjRLMTh1SlllNWs1RlJOS0h4MFFrR2E0ZExKUHBkYnJ0?=
 =?utf-8?B?ekF2TDZUSEpVZXlnMDRyM1RQcndZWUJ4Y09xbmFXbVB6bGxtTTUyNjlGYTdR?=
 =?utf-8?B?ZnVvNTVwRjlCa0drZXRqcGVDd1Q3WW1ZTUZ5T05QdUpPRFV1Y2Fyek03aCs1?=
 =?utf-8?B?TzdvcXZNVU5NcytKdk9yNS8yMXpoVzZxN1RvSGlBV2ZudkVqczYxRjZPbG93?=
 =?utf-8?B?Z2JFU3Y0RlVmT1BTSDlQSmxPVEFNY2pURmZvMGFQVG1YSnZkcjFIYkFlN0ta?=
 =?utf-8?B?TlFaVkk4bGJyS2p5REIya1hBeWRQR1p4WURSdjYvdDJPRGF1ZDdNRStuVEMz?=
 =?utf-8?B?NzYrd1doN3lJcUFPRExIUGNycHlBR00wNHR6bk1DNUtzU3NpbzIrbVpiQTQz?=
 =?utf-8?B?V2ZyZy9WY3JrYzJScEN5aFo2YmgvN3h1MzFBNjJ3bXorOFRDc2FCQ3BNdWNk?=
 =?utf-8?B?cWlWa2graUJoZ1JpNkNnM3lpT2tCNXBrT29lWmFSRlpPaWRFbElOYjd5SmdD?=
 =?utf-8?B?cVkwc2ZHa3Y5T0Q1U0NNR3pxTDhWT01qR2VoeVBDdW5Hdm1zeWpETXUvclVH?=
 =?utf-8?B?YUxDZ0EyNks1ams1ZWJUb2tMODRPMy9rZ0N6OGxBeWdjSWMyaWdGRzkyc3Ju?=
 =?utf-8?B?aW1BbUY5d3ByeDFzekR1UVRVb2tPTEpZVTF0ME5VRFNWTWxyUlpGTzFJS29y?=
 =?utf-8?B?TmtaaGkwMUJPbmJ3UHoreW5zcFdrSlhaMUwwem5RczFUTGlBNUxpZTdGVHBH?=
 =?utf-8?B?NUxOcVVSZGJmdkF4bHhicXRoeTdHaGJDeVI1emY4dEdRd0JRTVVsTVpnR3VI?=
 =?utf-8?B?VnFEMDlzbWxuMWRiRzUvL2FqNy9kaFg4QXBBT0xWN1hBVEdMWjRYa2hMTFNn?=
 =?utf-8?B?OGtxZzZTRVUxOC9TRmwya3Q1Z3c3SERuVDNraU9uL0lVZk40NWE0TUhHS0kx?=
 =?utf-8?B?cm1mQ3JqQzY2alBMa1lSQy84UDlaZjYyanhBMHhzMGZORWU5UC9kV2JOUFd1?=
 =?utf-8?B?VVpnekNBL21tcHRkVU5vZ3o1Z3gyT2twMUZMK0xOUk9BbVpBdHIvRDVuNmhk?=
 =?utf-8?B?TGVkbW1Hb0s0d2tCaHcvakJ5THFiSEc0TFdDNGRWZU41MUw2S3RiMGtRRlNs?=
 =?utf-8?B?a3BlbkM0NE9wRGhrbWE1Qzc2N2RtbS9YaE40dHlrWDBGMjVIaXI0NDBoQk96?=
 =?utf-8?B?TUJ1bHlJQTgxaWJERk5veFkzeHI0SUpNWWhyUVFiOEhrOHp3T3JBT20yWm1o?=
 =?utf-8?B?VE1kaHlpWmdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZGMnFibytKNDd5N1RZRUw3TzZpd3hDcjBRQUhwMTBiSWYxcWhwclFnZ2tK?=
 =?utf-8?B?eGlJYkMrM0VYY0thY2xMY284bTNqNmpZTHhnbitpTDJEcHJJZVArSjF0ZTZG?=
 =?utf-8?B?cE9KM3F3SGE4aWVUcUZucWtNQjBONzdybjFsdnBjd0IreGhDdXp4NHd6MTNX?=
 =?utf-8?B?U3VOa3ZNWTI2WVYwWGxhRTZrMXRUVUI1TndiUXRSM081L3ZGQU9PMGlhZWQ0?=
 =?utf-8?B?Tm1wZmlsMi82VmZWdHdwc1NTVy8wczROcnl2T2VQd0E2MTlYckt2cW5kNFYy?=
 =?utf-8?B?dU5CdWJ5RmdKRFljYkJ3QTRuR3ZVUTFmeDRUMnFrdldaVXhnbkR3amVqeWVS?=
 =?utf-8?B?R1hncHFxVUxYejRLSkZ4anpBbWlFZlhKRlF4SXZVd05ta3gwUjR1OXJ6eENY?=
 =?utf-8?B?S1k5ZW1haW9RY0VmbHJDMWZBY282cDNuNzZpbTVXN09OZVJtZmwwYVJPUFQ0?=
 =?utf-8?B?ZnlUdkZ4TUtpNXVaaWpFTlZLUTZpM1FtT0RYaVV3WE43TVRadmZ5cTJkZ040?=
 =?utf-8?B?cUk3Q3NwYVJQTUZmbmhFMmJaRXJHQjlicURzRWd6bVB4VFZQQlJ4UDFJejJP?=
 =?utf-8?B?Qk5ONldmYk4vRWNEa0l1eGJBM2Ywb0l6OEQrQXdHbFhwb1V6eXRKdDRTYXRL?=
 =?utf-8?B?Y3FDNWxnWXRoS1Qvc3ZoOG9VbkxHVkh3cFFuVDhqRDFKMG85U2pBRG9VNTZP?=
 =?utf-8?B?Z25qbkVoTm1uWDl0bDhjMjV3b2RNRThDdFdGQ0ttK1BLQzBmTjRBRURWeUxG?=
 =?utf-8?B?emQvMnRTNDByblRTTWhwajhKMzhQQWdVV2RpUm5YSTBLMEpQTEozYUE1WkNt?=
 =?utf-8?B?VThBUG9yT3c5WS9sYmRqRzdJaVBVdVZLL0Fhd3RzakJNVzBKNGRTbXp0RGFR?=
 =?utf-8?B?QkdUNW5makNKdmhoS1NXUUlwbkVKNjhrSUQzUEk2WDJkY1ptR1pTdEhlUENv?=
 =?utf-8?B?a1JFSGxpK3A4TmhNdjdFc3gvSzluRDFWTUNxRnhnZmZscW1XeTUvN3ZoZ0xX?=
 =?utf-8?B?ZHZyLzBDTHFHQi8vcC9MUU1LMFVQL3BjYnFMaDlKeXIwS0VYT0VXMHl3WjFW?=
 =?utf-8?B?N2M3dUJOb0VvYlBSY1dqZC9yTExOanJGWkg5b09pcVdhK1UvVk4rS0pDK0VV?=
 =?utf-8?B?MGtTdEN3WkFyQWNxdVpGYWVWSDRoblNmM3hMYXBZWjl0SnJPUDM3UWN0c3BJ?=
 =?utf-8?B?Rmsrc0dKV2gvUytZSVJ5cGR6UC94S2JBRDFVcjVOK2NCNUJWbW1yZGlmeW9u?=
 =?utf-8?B?c0hEaGNNS3ZjcXNoV1VCbHJ6c3p4Zm5RM0RIdEMyeGJ3a3dWQllXMHpSUGx3?=
 =?utf-8?B?N2lZL3hVYlNRdVhOMWtUcW1VQ0d4VlMyeitZck41U1I4VjdJdFJIaCt0eVRX?=
 =?utf-8?B?WExGbkxkM1p0dEhEMUhWQXRUNlFvdlVKbEpyV0dpK3g3Z3Znc3U3L0hmazJL?=
 =?utf-8?B?dW80ZWZzN3VKU2dQVGs1blgxZGlCUVlQZDNXVWJ2N3JDSWtzcThTdWpqd0NP?=
 =?utf-8?B?VUEzQ0V0djMrNitHQ0JFTEdtTlFkdkNZckdkRDJsS0dPdjJTTkJKOFZNSjZR?=
 =?utf-8?B?aWs3VzEzbWhRVmNpSGQ3Um1pTjFiS2ViZ3haVTRkNG0vNWM4TVZTVDBhamhv?=
 =?utf-8?B?WU93SGFjdUx2bElOekluYnhoY1FzU2ppSnlNOE13c0t1QUIyNHNFL2h5UGFH?=
 =?utf-8?B?cHZMYnQzSThSV3hKS1N2SVZCRDU0UlRKUnhZenptR1JkQjhJbW1mTzEweDVt?=
 =?utf-8?B?UWRjc2o0OWFNWEFOSmpvdkVDc2RiRE81YXBBUkJtbFZFc2J0cFowSnJHRy80?=
 =?utf-8?B?VlZiY2ZtR2tZb1NvYmJFbUg4ZmxLMHhieHVkcWpLSWFla1N1aUljaEE1U0RE?=
 =?utf-8?B?VmtmWFErMzJ4QlVqeVpaeEhPcXdFNWQvVjhyWlREY2d2Y3RjV0dlc2JlV3Y4?=
 =?utf-8?B?Y3RuZ0pqUnhxcGhGdWV2Q094ZGJFank4ZWc0NnF4a0NMWDFCZFBFcVE3aW9T?=
 =?utf-8?B?MFN0VENLVytQU000RytDOTdpT1VRTnFTSW8xSWs2NmNxbnYzM3pUK2RUUlB3?=
 =?utf-8?B?WnMrRmJBejRvbmd6UGZqMGQwdkRCK1BsRFNSZUZNWDc5SmVWUXBZd2kzeHM4?=
 =?utf-8?B?RVBVZlNXMGFmdjl6NGlZUFY3U2Z3Z3V6eTlRUyt3Mmtyc2h3UUNiT3k5NFJV?=
 =?utf-8?Q?2azZnjuq8eMl397moJpx5jF0NiU1K6KbL+1YHwCVarWH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5481c5-5cc3-4374-c06c-08ddde4f9ca3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:06:07.0230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/rVLo0nYAwHu5Rwm8ztnCZwEIlHNS7pH29sW8djeoQ6VyCjif/RBglXtkJZBWSd/VjwUfSIHOiMcjoXgEAzrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308

On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
> The AsPageIter trait provides a common interface for types that
> provide a page iterator, such as VmallocPageIter.
>
> Subsequent patches will leverage this to let VBox and VVec provide a
> VmallocPageIter though this trait.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> ---
>  rust/kernel/page.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 631718a6ad7d..8c5022c20472 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
> =20
> +/// Trait to be implemented by types, which provide an [`Iterator`] impl=
ementation of
> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::a=
llocator::VmallocPageIter).
> +pub trait AsPageIter {
> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::a=
llocator::VmallocPageIter).
> +    type Iter<'a>: Iterator<Item =3D BorrowedPage<'a>>
> +    where
> +        Self: 'a;
> +
> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages=
 owned by `self`.

This is almost obvious, but maybe specify that the pages must be
returned in ascending mapping order?


Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01E20B7FB
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749069827; cv=fail; b=jFBSNyBkcq/Zt2/KGfXF0VdfTZ7czXZJ5rJLenBqr0zfAoR777iI7RrBN8PCyH3M6B4mWhYHKhcpOrfyEj5TZKMgCMXOJO66jQdnq2rRiRf0zxDw8RupJ7BPWub01dRxAYI4RFcFloYPBkI0oHy+ZjA8npGkzDjgLr9Z30aeJ48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749069827; c=relaxed/simple;
	bh=wSMwkGIcpeEwoUYBKdPwsNGQLrfdoX1/2LUNi5C3wZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VDePRn+MnkxsYd5lXr94vbks8AWBxpB41r41FKXytVU7AXnZit2jsDJNa9P157u4uRXyTmJ7IkzI0kg2bIxZxzk0QQqzK65LN65x5OJMmnypl2PNvybWDlpcfY4EiCxEW9QhJN6AJCZolZur3MJ+YDp1fhD4gsE/EhvHod4diAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YvDWS/Tz; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YvDWS/Tz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UT7/BVzkCf/dbViZluWV05asTqVzWaGzAu23+OZ7Z4Ya+Ow+VaX2RwqwFmyTRZk2/fXKxSHC7XUwdAGx+tfBIZn3z5fnUvlSc/3RElG3g5AxSWnZ9rgWY1K6xO/BuO2euc5gtJuzyAqZkIMUcnHofQ8mo94W2oy4hVDswTHFd6G3zIVnSgo1jXtpt7Kd9WfeezYuCTeIXXJvS+Z3nsGauMLN/32Hzqm+fdlMdSYaLVMbi0lErYczv+7L8U9WC2jN13Iqz6pLH7iZLo9NdO1orDhGnhqS/U2RpOvvmtQVR8BcT48ukalOM8GLs5ZCB3kgkn9HAKJqso6cxGoJcy+4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSMwkGIcpeEwoUYBKdPwsNGQLrfdoX1/2LUNi5C3wZ4=;
 b=R7MhiKkS9xGwrNVaWanSNf63If/zQdZu9u9Hx5YBZx6SNmJ1wJHBgrDKbM/J4ksyjYjwC1FyCN8VESaCBhVRS+kmFS35WWa5pHRxyQjDL73tY1JtEtTKM+6Kciin2qFhiIdm9+arSmiHqwn2pOUnsv0uhSAZXbDB2zwluvh1D0Zi4Qp6UjLB6TLmOWcVfCr83yHq7RUg4jj25ZIA70VA2/FcqO3Z8PpC2ToC0uH2AzI11b5mbMnk5vL+lVx7nZqSWOBw3pjUdPSUDvjYAP/odaOP9EnJVu9iN74JY+1QJHWMKV5VJ6y6M+tKudG6ERpe8zFELCYcKmwzaI9wqLsiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSMwkGIcpeEwoUYBKdPwsNGQLrfdoX1/2LUNi5C3wZ4=;
 b=YvDWS/TzuOKwoNQD7aAYxrVac1rMM+bhE+4du0zc2HYPbQra7XPC2ZKpaq/K40aFrFnvvnetTsNuxuThzFvB8D5tYOkq33zU1DGD71HxBcZ/ghAFDm92YFYsPWXHEzfoKET/d7B6xpQNVrzI8kScKimWTCdXGm6TnGyfqp0tWrVUHBWGZBepy3SDJr+wScohuuPm+0xfMLU/ouP6fbCiuq/pg2EqsBvLaIyHa6Atdk5zGPMSZp3Gtdf8tG2ZwdNCBsVP7drbdhwpp16c8moTEfS9otxEdzuzfrFDDe33RnrwKRWiJKcz0r/7j2HbKqI7EsubKrwDzNtxQspdxBxvIA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 20:43:42 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 20:43:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "aliceryhl@google.com" <aliceryhl@google.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] [v2] rust: introduce sfile macro for succinct code
 tracing
Thread-Topic: [PATCH] [v2] rust: introduce sfile macro for succinct code
 tracing
Thread-Index: AQHb1MFmutpP/mRyhkm0X/8IcLhMibPytK8AgADEhIA=
Date: Wed, 4 Jun 2025 20:43:41 +0000
Message-ID: <6a84ba6565966b0770c04a298441d08692329759.camel@nvidia.com>
References: <20250603195426.2360773-1-ttabi@nvidia.com>
	 <aEALJCHeJ6GLnaxo@google.com>
In-Reply-To: <aEALJCHeJ6GLnaxo@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY1PR12MB9628:EE_
x-ms-office365-filtering-correlation-id: 99884df0-f174-44f7-bed9-08dda3a87df9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K0pvT08zU2ltU1NBSitqYmtwU29ocWU1d0RKZkp6WktnS21iVXNTYTVIQlpl?=
 =?utf-8?B?dHNQY3FpeTZydy8yUnl3TmdFQVJuZkY1NS9pUHI4QVA0RkpPZnhrU0JmOUFX?=
 =?utf-8?B?Rk5wQytZWkF6M1hteW14TXgyZGphbk4ycE0xck9MMnUvaG41TytDVDlPczNs?=
 =?utf-8?B?djFQM1FJRjNBTmI3YUdGN1RZUFpIMlpMaFNsaG95Tm1VMklIY015TEZIanlT?=
 =?utf-8?B?VkpoQ2RrcmNyc1REY0I5MVVUR093emZtWGJCWmFVM3c4VERDVUZicWd1dGUr?=
 =?utf-8?B?VHpyWGFPVXVMNmlGdlVPVXY4MGlRUXYrU1hYN0ZnNXZtMHVjb1o1S1JXeEs3?=
 =?utf-8?B?R0NOWnFiMC8yTXJQemNxRytuZEh1MUxacWpQS1pxRXRxbUZQT2IzNXZ4NVp0?=
 =?utf-8?B?Q3o5T0hyMVE4YTZpZkVqN1EyeEtVbWZ2UFkveS93OTRQZXAvZU1XVk5SRldD?=
 =?utf-8?B?RS9ybThDdjBLSGJKQlV3L0hGeGJvSGs2VVQvemR1Q21YWmY4Y3A4Rm4vQTJT?=
 =?utf-8?B?RDFCTTlOTXdhaGN3VmNUaHBabzRweVd4dWxldXZzMXE2Ky9mU2Z2bnpZbFUz?=
 =?utf-8?B?R0J0cWFQb1ZiU2E2NzRVaG9CMU5TSS9aV2hUZUJjMnpsWUNhTzMyTC81MGVP?=
 =?utf-8?B?MnFzN25HNXpEdUZjYndkdlBTWHk3Y3dQY2tUWE5ZUUJkYTZza3UzOUZUUGRG?=
 =?utf-8?B?cmJmZEplcVl1QVJhSkhkUlYwenNyQ01DYzVQZFVVNUN2MTR1Wmdla0g5Q3dj?=
 =?utf-8?B?aE5YcXQ0b2FhK0NsUlJYNWUrRGFaOEc3a1h4N3FsV1ZxeHdTeUpnenZSejVK?=
 =?utf-8?B?anNXMEE3NEduM1RrTTJMOUtqNjc3WHIyQmp6MUtjWVZnRDhETzlVeGdBek1C?=
 =?utf-8?B?SytOQmlHa1ROR0pyQkxNTDdRUkJsb0gxbWM1KzBQVTNQVmlxSjk0VmtzM3RX?=
 =?utf-8?B?NjF0aVRUay9uY3l3L3JhUEhpKzN3Wm02cGVTYVBRYUdyNExMVlAyYyt2aTk3?=
 =?utf-8?B?Y3VwRmNscG1aUUF1TkZ6eFZCOUc3SkpBN1RlUGJQQ1VmM0dFcUt1djJkNm0w?=
 =?utf-8?B?eno0OWEzVXVkMW4rU1N1Z1JobWRZREw5MHZzdzJ0M2ZXcjRoeU40VXhOVkRP?=
 =?utf-8?B?clQ0WUMrYVNDTHRQTkI0VkdQMTE4eDJvOXVKaUl3TTEvaGFuWmpxR2NyMlJ0?=
 =?utf-8?B?a1k1ZUFHU0pyQUN0TzRBS00xU0xMaWtLOFMxNGhlRktqUis2dDVQaTBWWTFJ?=
 =?utf-8?B?SlVzV1llTGQycHB3Q1E5S2dEVFBBZUJHbmdrNy9wWG5idVpjSVJQaW1RQkY3?=
 =?utf-8?B?dit0RDVPb2EzM2FxT29XTHMzVlhKTU9FRDdKaFNCZitJQTMxbEx2SS9LcW1p?=
 =?utf-8?B?UmVabEdRYzBidEhtM3h2azRSNzRWOHhQOEFkZG0xWHNmZlYrb3QvRi9JZ29V?=
 =?utf-8?B?R0N2SFJ4QXgyWGtneEZMRlRCVTErcEdyRUZIc0NzNVdvOVFIRTZDaC80TU84?=
 =?utf-8?B?QXZGUTFzbjBKMXo3aXZLdHZnNGduSi8wOFlpMmFzRll0clBjcmhjU2lUeDFV?=
 =?utf-8?B?Qy9BVlFQSGU1MDZzdGYrZ1Z3Qm1qWlZHY0ZOSlRrcFArTzRSU1NRMTJCU2d4?=
 =?utf-8?B?VnNvQmhMc29GZGh0OEpMUWxIOWtFcG5tSFEzVTg0LzIwTTdoeVVhZ21Fa1BY?=
 =?utf-8?B?OFYrdUZSNEJIOWltaG01aitTaUNHYVcxQUFqeDNoSFhmbUF0b0U2ZWxuUW9s?=
 =?utf-8?B?ai83eGlOeEFHMm8rS0tpVHdSOG45STVFWUVkQklYWVRZcWlmVXVMQVJtMEd0?=
 =?utf-8?B?cG1KS0dPeXlabU85NmJVOEphWTZDQXlMRjZpRis3Q1BabWpadFpJTTA0Ulkx?=
 =?utf-8?B?RjZESUlWTkhBWTJxSkh5eXplY1hsOFpjMFNoOU5qT1FOTGpCdjdZai81ZFQw?=
 =?utf-8?B?REliQVhNN0EzclhDaFgrYVNWVDRKQnVMQjZ1LzBGTi9QZmJwUmNEQzBPaVkr?=
 =?utf-8?Q?2qyif5jLN0ws3SXEN2KlaB7Z3kS6cI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0xZOE9hMlZYeHk4Y3MxdC9IQW1vL0RkSithZVluWjNCR0s2SEtON1BXZmVI?=
 =?utf-8?B?OTA4d0w1R2c3U09KS3dKLytRSWFkS1Z3NXQ4QXJhTU53cnpoUTVxZnBUODNF?=
 =?utf-8?B?bXcvOVR2ZGJZV004RU9xQi9zT3gzY3BGWjlBWXlTT2FETWRPMjhrZEJZamtK?=
 =?utf-8?B?akFzODA5SWxKYWNxckNhL3ZrMUlQNk5JKzZySTVzOE9sYzNVVFEwNlpENHVN?=
 =?utf-8?B?N3J4NjlVOFFieTkvam0yZ2ltcjkvQ3ZkQmNic1Z1eWNTRExsNkhBVEQ5RXds?=
 =?utf-8?B?TkxDYkw5ODJqaDAwMlYySjdwSml1MU1GOE9NZGFZTXcySTJZLzgxVkxDUGtl?=
 =?utf-8?B?N2VEd3VMc1RWTEcyUmF3bk9KZkNYQmN2aGhMK1lHRUJKOVptOVI3aVBXbG1y?=
 =?utf-8?B?MjFjV0pkaHZsMjArdGp2VnFFOTRkcDhtVENabVlCUVpFSHhPVER2aWZQcHVD?=
 =?utf-8?B?M2V3TWpWRlBJUjU5VHVFSEgvMzZqRVZVT2k0dFprcmh3OUdTdHNzc29Qa0lF?=
 =?utf-8?B?VGRMTkk5c2lkOC8xOVFWVFNhSmpaaitUUENPYVZwWmdnYU9mYkJ2anRqcE1z?=
 =?utf-8?B?VEw4UWFuQm1kSUZpRTloSVZHdDIzbXFveXMzOHVDbi9hcWZ4Z05kY1R5aTJn?=
 =?utf-8?B?TlB3b0ZnUElUSFlNUVJXaXZzUmE4MTlZZlJhdDc0bDd1c1U0Yy9QUzJ2TUg5?=
 =?utf-8?B?RkFQMDU0Tnc1eXZocVQ3dEFIaTc2YkttcGQwTDVZa3JhcXhxcitDSFpxdytw?=
 =?utf-8?B?Y3M4VkhFK0tDb3ppaElMeDM0T3lPMjdJbGcvMVd4UWJMVHJYbnlXenJuVlQ4?=
 =?utf-8?B?Mlp6YkxFQU9GdVY5RFRBa25TQUwzdGRNWDZPTEMyM1NaUFo1ZGZUR2cwY1V5?=
 =?utf-8?B?VXlWZjFjNVZKVkh0dkxrbU9oR0JhcHZjMUI4SGdjd1A3WE1TOUxJYzd4RFQx?=
 =?utf-8?B?RlR5bFl5alJpRlg1c0U3YmRybWhubWlxNlJrRk5aMUxZSEYrTiswWHk1bDY0?=
 =?utf-8?B?Q09nNVRXalVHZzZKbDhrUEdrTDNLM3dycTJmN29YTGZidHJ1cTd2Zmo2K3pX?=
 =?utf-8?B?bjdkK21SMnhKbDE5UVJxRzBNVUpVV09ScWphUFlpNXhmbGZhU1hYZW5kV2x0?=
 =?utf-8?B?aHRsS29JUFZBT2JsQXN6b1JxY0ZURW85UUFxZC9ybzUrQnJmRnFGRHQvVjMr?=
 =?utf-8?B?ZHdMcWFqZUZTV3Iwc0NJSGZuU04yVFpYR2NRbEFNYVd1SUd5OTZCQUVjZUli?=
 =?utf-8?B?WlFaWWxSM0xkWVFoOUx0SFVKYkgxU0dTb0ZEMnZWcmZPOHlXMWsyRm9aSngw?=
 =?utf-8?B?eDlMT0RNWkhwU3VXYUw3UlJoMTBRVVBZczl0OFNDd0dJT2VmS1YrUEdLYW9j?=
 =?utf-8?B?c1hXN0FDK3F5YjhlZnR0VlBGWlc1RDhsaWVkbCtUbWlzNmp5eXJVK3dZdHl3?=
 =?utf-8?B?S2t1VjVBNk8zQXd3Z1hmUVV0ZUlwaVlJVjJTTkpsY1grenY0ZnVjRkpneHlP?=
 =?utf-8?B?SlBzaTJrN2hlYlVoNThVODZ5eXVmYVZ3dm1pZ2RQb0xhK1dkQ3VQNWVXRExj?=
 =?utf-8?B?WXJTZ1NsUjd3WTU0eHJzd1Y4b1JRNkN4U0hEQm0yMWZuR3hhWUc0NExiaFFJ?=
 =?utf-8?B?Qzk2c2NacGlYUEU1SloyNmgzRTd2Y0hqN280QU5CSzJ2NzNVZ1VWMm95cDVm?=
 =?utf-8?B?cmNzSElKMGI1bUtYb1psQzR4eEIrR0lZUlZwOEExYkNIRjFHYjlmQXZkL2U5?=
 =?utf-8?B?TmR3NjJUSXh6U0Nad2JCRHpZbmlOTm9GdGV5dUpydDhlYVcxTjQ3N1R6cVVX?=
 =?utf-8?B?WHAyVlVjZmkrMmFYWXlFZzFRODRPNzlPeDU1WkVpUGxTdTRFTS9ZSmpuOUlE?=
 =?utf-8?B?MTZneFVQeDNZdVJkamZ0Ry9jMHVHWEVndjBpRUQvYW5PcFFERDBhWFVNMi96?=
 =?utf-8?B?V3JRTzF6blVabXF5dkhNN29lWTVxWjFQaHFZTC9zeDVrdHJmUmVvOUF2R0dn?=
 =?utf-8?B?b1VWTnowL1JzS2hGUUQxalltaGZBTXlRbDR5ekx1TDJ3ZGNiM0JyWGRnU2NL?=
 =?utf-8?B?Zk9VcWlWZHpoMFFaMlZ0bkJwc0NBemVicXVnMGJHZmFCRDFUenRGOC9haC9E?=
 =?utf-8?Q?sRXPzK/FnnM2U+EG+1UsBxvri?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE75AE4AF8752048A38E70A2AE8AA383@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99884df0-f174-44f7-bed9-08dda3a87df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 20:43:41.9274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mvzJ15N2NfO1RjM6uzffNZ1uvVG0ub4WGNTtCkSz6v2kta3rIRkPkNo6Ujx2rC7eCzydxPhbmEkCa/EJu2nhkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDA5OjAwICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOg0KPiBP
biBUdWUsIEp1biAwMywgMjAyNSBhdCAwMjo1NDoyNlBNIC0wNTAwLCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IEludHJvZHVjZSB0aGUgc2ZpbGUgKHNob3J0IGZpbGUpIG1hY3JvIHRoYXQgcmV0dXJu
cyB0aGUgc3RlbSBvZg0KPiA+IHRoZSBjdXJyZW50IHNvdXJjZSBmaWxlIGZpbGVuYW1lLg0KPiA+
IA0KPiA+IFJ1c3QgcHJvdmlkZXMgYSBmaWxlISgpIG1hY3JvIHRoYXQgaXMgc2ltaWxhciB0byBD
J3MgX19GSUxFX18gcHJlZGVmaW5lZA0KPiA+IG1hY3JvLsKgIFVubGlrZSBfX0ZJTEVfXywgaG93
ZXZlciwgZmlsZSEoKSByZXR1cm5zIGEgZnVsbCBwYXRoLCB3aGljaCBpcw0KPiA+IGtsdW5reSB3
aGVuIHVzZWQgZm9yIGRlYnVnIHRyYWNlcyBzdWNoIGFzDQo+ID4gDQo+ID4gCXByX2luZm8hKCJ7
fTp7fVxuIiwgZmlsZSEoKSwgbGluZSEoKSk7DQo+ID4gDQo+ID4gc2ZpbGUhKCkgY2FuIGJlIHVz
ZWQgaW4gc2l0dWF0aW9ucyBpbnN0ZWFkLCB0byBwcm92aWRlIGEgbW9yZSBjb21wYWN0DQo+ID4g
cHJpbnQuwqAgRm9yIGV4YW1wbGUsIGlmIGZpbGUhKCkgcmV0dXJucyAicnVzdC9rZXJuZWwvcHJp
bnQucnMiLCBzZmlsZSEoKQ0KPiA+IHJldHVybnMganVzdCAicHJpbnQiLg0KPiA+IA0KPiA+IFRo
ZSBtYWNybyBhdm9pZHMgc3RyOjpyZmluZCgpIGJlY2F1c2UgY3VycmVudGx5LCB0aGF0IGZ1bmN0
aW9uIGlzIG5vdA0KPiA+IGNvbnN0LsKgIFRoZSBjb21waWxlciBlbWl0cyBhIGNhbGwgdG8gbWVt
cmNociwgZXZlbiB3aGVuIGNhbGxlZCBvbiBzdHJpbmcNCj4gPiBsaXRlcmFscy7CoCBJbnN0ZWFk
LCB0aGUgbWFjcm8gaW1wbGVtZW50cyBpdHMgb3duIHZlcnNpb25zIG9mIHJmaW5kKCksDQo+ID4g
YWxsb3dpbmcgdGhlIGNvbXBpbGVyIHRvIGdlbmVyYXRlIHRoZSBzbGljZSBhdCBjb21waWxlIHRp
bWUuDQo+ID4gDQo+ID4gVGhlIG1hY3JvIGFsc28gdXNlcyBzb21lIHVuc2FmZSBmdW5jdGlvbnMg
aW4gb3JkZXIgdG8gYXZvaWQgaW5kZXhpbmcNCj4gPiBpbnRvIGEgc3RyLCB3aGljaCBhcHBhcmVu
dGx5IGlzIG5vdCBjb21wbGV0ZWx5IGEgY29uc3Qgb3BlcmF0aW9uLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQo+IA0KPiBXaGF0IGlzIHRo
ZSB1c2UtY2FzZSBmb3IgdGhpcyBtYWNybz8NCg0KVGhhdCdzIGJlZW4gY292ZXJlZCBpbiBvdGhl
ciBwb3N0cyBvbiB0aGlzIHRocmVhZC4gIFNob3J0IGFuc3dlcjogaXQncyBsaWtlIGRiZyEoKSBi
dXQgbGVzcyBub2lzeS4NCg0KPiA+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgc3RhcnQgPSBm
aW5kX2xhc3Rfb3JfemVybyhGSUxFLCAnLycpICsgMTsNCj4gDQo+IElzIHBsdXMgb25lIHJlYWxs
eSBjb3JyZWN0IHdoZW4gdGhpcyByZXR1cm5zIHplcm8/DQoNCk9oLCB5b3UncmUgcmlnaHQhICBJ
J2xsIGZpeCB0aGF0IGluIHYzLiAgVGhhbmtzIQ0KDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBl
bmQgPSBmaW5kX2xhc3Rfb3JfbGVuKEZJTEUsICcuJyk7DQo+IA0KPiBJJ20gdGhpbmtpbmcgdGhh
dCB5b3Ugc2hvdWxkIG9ubHkgaGF2ZSBvbmUgbWV0aG9kIGhlcmUgcmV0dXJuaW5nIE9wdGlvbiwN
Cj4gYW5kIHRoYXQgdGhlIHR3byBjYWxscyBzaG91bGQgbWF0Y2ggb24gdGhlIE9wdGlvbi4NCj4g
DQo+IGxldCBzdGFydCA9IG1hdGNoIGZpbmRfbGFzdChGSUxFLCAnLycpIHsNCj4gwqDCoMKgIFNv
bWUoc2xhc2gpID0+IHNsYXNoICsgMSwNCj4gwqDCoMKgIE5vbmUgPT4gMCwNCj4gfTsNCj4gbGV0
IGVuZCA9IG1hdGNoIGZpbmRfbGFzdChGSUxFLCAnLicpIHsNCj4gwqDCoMKgIFNvbWUoZG90KSA9
PiBkb3QsDQo+IMKgwqDCoCBOb25lID0+IEZJTEUubGVuKCksDQo+IH07DQoNCkhtbW1tLi4uIHRo
YXQgc2VlbXMgbGlrZSBhIGdvb2QgaWRlYS4gIEknbGwgdHJ5IGl0IG91dCwgdGhhbmtzLg0KDQo+
ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFdlIHVzZSB0aGVzZSB1bnNhZmUgZnVuY3Rpb25zIGJlY2F1
c2UgYXBwYXJlbnRseSBpbmRleGluZyBpbnRvDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIGEgc3Ry
aW5nIHVzaW5nIG5vcm1hbCBSdXN0IG1ldGhvZHMgaXMgbm90IGNvbXBsZXRlbHkgY29uc3Qgb3Bl
cmF0aW9uLg0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IGJhc2VfcHRyOiAqY29uc3Qg
dTggPSBGSUxFLmFzX3B0cigpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBTQUZFVFk6IFdlIGtu
b3cgdGhhdCBgc3RhcnRgIGlzIDw9IHRoZSBsZW5ndGggb2YgRklMRSwgYmVjYXVzZSBGSUxFDQo+
ID4gK8KgwqDCoMKgwqDCoMKgIC8vIG5ldmVyIGVuZHMgaW4gYSBzbGFzaC4NCj4gPiArwqDCoMKg
wqDCoMKgwqAgbGV0IHB0cjogKmNvbnN0IHU4ID0gdW5zYWZlIHsgYmFzZV9wdHIuYWRkKHN0YXJ0
KSB9Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBTQUZFVFk6IFdlIGFsc28ga25vdyB0aGF0IGBl
bmRgIDwgdGhlIGxlbmd0aCBvZiBGSUxFLg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBJZiBgZW5k
YCA8IGBzdGFydGAsIHRoaXMgd2lsbCBnZW5lcmF0ZSBhIGNvbXBpbGVyIGVycm9yLg0KPiA+ICvC
oMKgwqDCoMKgwqDCoCBsZXQgc2xpY2UgPSB1bnNhZmUgeyBjb3JlOjpzbGljZTo6ZnJvbV9yYXdf
cGFydHMocHRyLCBlbmQgLSBzdGFydCkgfTsNCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZ
OiBXZSBrbm93IHRoYXQgdGhlIHNsaWNlIGlzIHZhbGlkIFVURi04LCBiZWNhdXNlIHdlIGNoZWNr
ZWQNCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gdGhhdCBGSUxFIGlzIEFTQ0lJICh2aWEgaXNfYXNj
aWkoKSBhYm92ZSkuDQo+ID4gK8KgwqDCoMKgwqDCoMKgIHVuc2FmZSB7IGNvcmU6OnN0cjo6ZnJv
bV91dGY4X3VuY2hlY2tlZChzbGljZSkgfQ0KPiANCj4gSW5zdGVhZCBvZiB0aGlzLCBJJ20gdGhp
bmtpbmcgeW91IGNvdWxkIGhhdmUgYSBjb25zdCBzdHIgc2xpY2luZyBtZXRob2QuDQo+IFlvdSBj
YW4gdXNlIGlzX2NoYXJfYm91bmRhcnkoKSBhc3NlcnRzIHRvIGdldCByaWQgb2YgdGhlIEFTQ0lJ
IGNoZWNrLg0KDQpVbSwgY2FuIHlvdSBzcGVsbCB0aGF0IG91dCBhIGJpdCBtb3JlPyAgSSBoYWQg
dG8gdXNlIEFJIHRvIGNvbWUgdXAgd2l0aCB0aGlzIGN1cnJlbnQgbW9uc3Ryb3NpdHksDQphbmQg
SSdtIHN0aWxsIG5vdCAxMDAlIHN1cmUgaG93IGl0IHdvcmtzLiAgDQo=

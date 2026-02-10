Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D0331217;
	Tue, 10 Feb 2026 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770762536; cv=fail; b=jSX0yNOaYXVYkkolo+LuxVsDiVi5KmmrY1Z12X5L8gZqVhp45UOsW7x8ZwDgFB+3O3RUL/M1sO95mCQpo6AAFczO71yPP7U3Q7cwWgB6URWr08ukZXf3vYmfqa83ELImB1RzV7Bt0q7ukRXtpTBzk8oBvD5E+qki7wDZLbuspH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770762536; c=relaxed/simple;
	bh=U3NHrfC+kKMvr1tBosQ7MzOY/oAbKE2Rqrqbths5hAM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gCHB6FxjvXRkRYl8O6bbHuCMKVKOcEVlNracbhKFvBAbvvOi4X4GOX416SOQVFxyZsaUFnR8oypjKjeXXyzgeyAGtfOOCTU6vVYtrmm8BLEXmz19jbjKciFwgb2Wf/dnnz+QQ8FWU4iohjn95edUmwBzYKCYaaWW0CIq1nGOg7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VjecE+gj; arc=fail smtp.client-ip=52.101.61.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VjecE+gj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3nJtYFvR2TgnxXIehLoiSr6m0Eer+tHr4AGil2Pwyy0H2qNmMmG8d/FTi5PFtWlJR7YEmsAY0Veqa8Q7TaLtKglqT7Cqe5YYIR5iqOv3umdc/TFlfz8AbCTnPv/banw1DBSnJfA+fD/9reM4dReXuBfLb9opeUTyR/RwQKcGUpu9x3y/1YOQrsHuK9T3cCjeCbvsl7iWscksy2fNbQ33urOUxnJU0HM496SZr6xnRttSFajGuYZf9+DtjonFkbzH04eqvAbjGBfTXPhLnkxwAT99YxYZRHdzJNS8yu0TtOqutGZraePxtpdZCgAwYyOnj07AdIqROK5PIxKjmNveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGxGIpCfR0WxOTHymk3tUK8teYTqeJ7yOkfE4AutBMw=;
 b=xC5N/EXa18dZvDiISTu3heiVkIcpjHvzE/+Bw2NAwdB8RdgOka2ZRDUWtPBNb3tTsIiPvzxH/CoVBIK1e81drYOfUKXjHNxQpzSEsVmj+e5CJkvMKjbYjLu6g2QtRxSCHuvGmAilxilG4qG+KkuwISmlUvwRyNyksOfaj42ZiunOAVxjpWCB4TpgLfYSesrSC2SwC+91enfq4WjNV7f25S0rEnhLBxeVHRfpluEo8i9j2O4ajlkjHfa2dI09rFCjk9euTSC7YBE/XEOEZ4txCaosrfzI3BN5U074NtRBfd0M/c8cEA3jZ+3XlrDni0pDeEB3Fx2OcjWoSHjZwNmDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGxGIpCfR0WxOTHymk3tUK8teYTqeJ7yOkfE4AutBMw=;
 b=VjecE+gjbsALH69iq7qwpXisiBH3spmLWSXEif3qHBHRjRwT3lHh4X5WZSOJy1bkzEkGjHtJ+V/hH5zBgLs2GPVZ9rHryKmr9S3RvWKe9dDZI0cT+CLx1Jh9J51OgkJ3iyPcV3PhNdlWOHtg0ukJCFjnC16v94sjW5J5imnph/zjFYPwK+arB5CI7MvzYqT0mWgv0R/RzMTkeO41w1WDH8L403xtQBKX4UCHQkJ9Ieu3PY3B7vGbuCIJm3mQUPxl4exk8pC8zZmizTGKa3jNOIb15cTjS4JzpiEZTX4TSfSCcdoTyy+LujSkll3oTr0BkirZCj/rCdNSdCLgymL4rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:b5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Tue, 10 Feb 2026 22:28:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 22:28:45 +0000
Message-ID: <407eb376-6dea-4333-a3bc-8347c4c08c12@nvidia.com>
Date: Tue, 10 Feb 2026 14:27:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/33] gpu: nova-core: firmware: Hopper/Blackwell
 support
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1dd1ad-f334-4e5d-b571-08de68f3c079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWltOGpnL2lkK25mTThHYmp1d0RoZHpzQ2wwZjlwcGZ3ZGt5Uk5KTDFNR3VV?=
 =?utf-8?B?MXEvZGFTKyswSldPUEp0cnNheDhaSFpsbXNVN1RIWG5leEhSZUVxUzZScnF5?=
 =?utf-8?B?b0l6ZHloeFQ2UVlEZjQ1RmliemJwYlk2WURGSHNxc1VBRStxK2puNmpoaVM3?=
 =?utf-8?B?SEZqZ2ptVVFzR0UyV3dIQXdyc2RzVHVKampoaEdQbTk3TnZJU25GY2c0ampF?=
 =?utf-8?B?eldaYk85OTFCbmpXSEM0WEtSMG41NFMzUkpMb1pkRHRtRkxhVDBuRWk0VzY3?=
 =?utf-8?B?bFNkc3Jmd1JucTZjc3ZTRVdQcEJmNnR1eUc4RXd4c2hLQnNJaFdzSnZZK29M?=
 =?utf-8?B?MnN0U3d6aCs2OW45MlpRK0RyTk9kVUM1cjBKOGtYdlpGVGdnMmIvcGQrL1Bi?=
 =?utf-8?B?WEwrb2dXd3Q2U242VC92Z0dCc3VnT056RnhlNmh6MFZ1WkhxN2xZSmd5MVla?=
 =?utf-8?B?QlZNU1lZNFAzUVU2cm9tcnJWSlFJUGRNOXpHb2Nwdkp2SktkZWJuc09VT0w3?=
 =?utf-8?B?VnN4UzZxeFJ1YTNIdFpwL2dHaVA5UGJXUGlGTGQvMktaU2cxc09yY2RYY201?=
 =?utf-8?B?SFJOK1dmcGhpRlpCbkRxNXVNVGx2MHhmckx6NlhZQXpDYWlFZ2pObnVjMEQy?=
 =?utf-8?B?TVVKWUFxUGpDbm8zcmdCSk5nMUFZUjNtQlluclRROUhvSUR5RTdEQWQ0Z1Fq?=
 =?utf-8?B?YnNxdUNUSGs4Y1B3R1AxUDlaNnd3Rkw2dlJoblNkUW5vaXZmTHVEOGNQVDlR?=
 =?utf-8?B?VS9JdGl3WU5LNW1LVytOaUh0UDNER3hZMG9VUUtaRXhCS2xYRmtWckZZSURH?=
 =?utf-8?B?RXQwbFVaU01peUcwTXFDczZseW1HVDA3T2JJZkJ4YitWL2lWZWcxS293M3d0?=
 =?utf-8?B?SHlFaGR6VkFaUkgwYzAxWWJRejhqa0RNV3BMV1ZBVUJDelk0QTFmWDhUaVpa?=
 =?utf-8?B?bEd2Mk42M3kxSWxxQWEzallvTnhobFVzUVVjUEdOUitiVEN3TXV2a2NNYnlR?=
 =?utf-8?B?eWVZZlM4R1dGL1NlWmd2TUx6SC9QWktyM3FHU1JzMzRqVXlvWkpiUXY0QUtH?=
 =?utf-8?B?SDJWWEZRSDVNV3lPOXNWNVJLRU94SUdlRlZra1E1aFFpcmNiQ2J4aElNZmN6?=
 =?utf-8?B?ZTVLSTJQVWFJYVJncHNTZU9wQ0hvTnVFRE5MbjJlNFRxdVIxSWRjTEk5aUhC?=
 =?utf-8?B?bS84RjAySlNyUWhLZ3lFYllMZG9xUUtuRGI0Wlo2UjNCMnRQcU9mckh0akE3?=
 =?utf-8?B?MkpwNGE2cjQzUG9WbkpaRjNEYlZXMnhTWEhuKy9mUXBVcDZHNm15QlJBU3VM?=
 =?utf-8?B?WElNc0p3NXVvN0ZHRWc0YmpSaG5KZmprWmlIaEMySFdLWEJpbTJjenVpdEF4?=
 =?utf-8?B?VFJBQVVacmkwZnpReTU1NkExVnpITmQ5cFpqd2g2ZXEzNk9QaFFZVUl6NXJs?=
 =?utf-8?B?bi9Wd3ZEaVJsdkh1Slp3VWhmMVJHS2d4emZWVHY3SnNGTmJkMG9ibjVGYnV0?=
 =?utf-8?B?eDlBNEtGNUgxdXRQN293SGFUR08wMFJXMTJHbGo2U2FoS2dQOGs1NW1ZbXFN?=
 =?utf-8?B?TlJTYitYWXpUT1pZcUhCZVUyNmZrUWIvdkgrOTNkUGtLdThnZUk4ZWhtQmw0?=
 =?utf-8?B?cUJOWElkSWhZYUhGL3FQMm0wWkpROFVSb2lqMWlHKzlJQi8wcDFSdnJtamE0?=
 =?utf-8?B?SGpGUTZ0aXpVK0F6OWdFR0VMYmRLRU1QK0M3Vm84cTVJWjY1enRmZGNjWmZn?=
 =?utf-8?B?V2NqYlVFZEtvT0NwRjFhS2ZYd051aU1vSGVySGJvM004WEQ2Um50RHlPZklY?=
 =?utf-8?B?V1RzTngxVVBHc3hWTGNpYXM3N1gybFg4WDkweDJGdURJb1EyajFxaThnbHF1?=
 =?utf-8?B?YnRTMkpxbFZRd2lkbkpoZWMvMGUrbVcwZ1hpZ096U2dYQ1pnWmRTcE9hYjZy?=
 =?utf-8?B?U1hUZUhoOWplQWZ2TmxYWG15bnZBc0hFSllHb3RBd2hUdi9XaitlSktZaGoz?=
 =?utf-8?B?QU1ubUVvcFpDMEdwWXhXOFN5QlpMY0ZPanhNYW5WYTlpOERTREtKTVI4NUNW?=
 =?utf-8?B?MTZxQVRBYk50L1lQYXpYdFRJRHBUWkNaZUtIRkFEalBxemhMMVVWdDNyb2Jp?=
 =?utf-8?Q?L8SY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDdrK3BQL1NQeTF5K1l2MWdPQVNPc054NCt0TXRONEVCemFDQkwxU0RYZWNs?=
 =?utf-8?B?Qi9laHdjYUFZZ2F3bVpLUE5uRUJ4QzJqVFhXNmpmcHV3L0E5K1lUUWxCeUtK?=
 =?utf-8?B?RmNXUWhOQmxFeWJRdkhQK2p3eUlHN1IrcVo2eEpKK3dtWWRUbDFLUzJ0ZTNr?=
 =?utf-8?B?T09haStjcDBjcVdieEd5UUl0cVRwMSs0eHFXTm9LSGdtaUo2WFZqMGZrNzF0?=
 =?utf-8?B?NFNKUjhmaFJlTm95ME9QdU1hckFEcFE5YW1HbFNLTm1CUmtobmFSTldlcXRV?=
 =?utf-8?B?VUliWW1ZNzVXN2t2OUFQM1BjdGU1a21WS3VhUGtoMUIvdGJsNmlJRkZKbERh?=
 =?utf-8?B?UWxxTkl1MW9uOGJhR09xRGNHM2xGT3Z6b0VBMWNxZjE5VnBkWnhHaEdtMkow?=
 =?utf-8?B?UE93SUtRTlVBZDdrdERHOE9oWGJVZGpVTzJUZU12VUgyOERNZllWSkIrRFRm?=
 =?utf-8?B?MWg5N0d0SUlpdlkvd1RaVXZHeVljOHJuSExGVFlVNkJiQmttTGpIT2RmSkF2?=
 =?utf-8?B?bm5OSEFGczRubmE2K2U2TzMxekVJdkc3NUJzU1pMRFNWQVdTbWF0MnIzT250?=
 =?utf-8?B?NVB2VWxGSm1XL2RTWUxrVDBUbm5MdXpDSGhCc2FRWEdOOVJKdmFFTk1YUkJQ?=
 =?utf-8?B?VnBEZm5qQm8yQi96MGJwc0hkZklXajM0YndSWFQ3dE8rYkpXVGlrRFErekpE?=
 =?utf-8?B?dGFFcnRJWE5qZHRIcDNGR0pJakdHSU9tNmVYVExBa2Y5R2kzZWNlU2xBa05S?=
 =?utf-8?B?eWhzQ0tCbkNLVkpxM2c3NzIzT1g3VGdua0dNQ2paRGowc1lvTVIzVFc1bDVN?=
 =?utf-8?B?YTBXc0NwQ2F3blBETnFuRTJxOVJJYTdJeWFEUUpxNDlQMFQ0RWtwL0ttMlB2?=
 =?utf-8?B?NTZ3MndQZFhQa0hzdmlnK2RVZXl3YzlDNnNNOStUZ0piK2QwUVBSL2c2MGJr?=
 =?utf-8?B?RkFKcUQ3WVJnSDY3V3NWMlp2dlZjK015clBBNzBpU0Y1NXlWR2psclNQMGxX?=
 =?utf-8?B?M1U2R1lYd0pCaTJpMWlKOHE4bUVCZzRGRW5rWHU3R3pxMlRNd2FXTjVTUmxx?=
 =?utf-8?B?Z0lRNjJqTE15WG84aTV6MFBQZERiQ0dhN25GVm5NbmtIajVvbGRnc0U1cU54?=
 =?utf-8?B?RnZSRzVhS1RLU2h6UjFrVkZjRk1QeHFnSTlVWDlSQWErY3c4K0xCRmFucXNo?=
 =?utf-8?B?N2hEU0xpeEhOWFlkV051T1JQTkM4amcyZlJ2WitFajNHMEcvK3o4U2w0NytV?=
 =?utf-8?B?Z3ZRWjNqL29ZY2J2aXNJcWRKbTA4VDhSZEdxRzNBS3MveTViSC9YUEZlNVJx?=
 =?utf-8?B?dGRBbVVGWUxKajMrcWFyZ2tpNnAzdFBLT1M3RlhlMk9YL3V5MEFIdmVueVlt?=
 =?utf-8?B?T3ZYVzZsNC9XNGQwM2lnaGRwY0RnWERZT0RFSDRkRStYU01FMzJqNlBTQnVE?=
 =?utf-8?B?NElueE1VNEI3Unp3bGVsWElvMlV3bEdHL0NIa3FqRFlWU0pXVndKaHRldHd0?=
 =?utf-8?B?UDdWb3h4ZGZjUmtSWU1Gc3dvRlluUGhnZHpla01wS0Z5QlhsNEpEN0NKTllx?=
 =?utf-8?B?RWNoc0s5aktVTGFtMG5VK2pkN1ZnN0pMdkxjRnF2b3NJYTU0d1B3TVhpSEMy?=
 =?utf-8?B?b2FiNkhsRS9lS09wZzR2QU11OWNxZnp0eHJJckl6RFEyUy83cTR0U2dMT3BW?=
 =?utf-8?B?RFBkTlFudGN5UGE5aDg5bHZ6RVFyL3RHVlQySEhrcG1icVFmcDI1S2hFKzRB?=
 =?utf-8?B?VEw1TjRWbmVSUzVON2FiSzF2SmxlNjVOSFlJaFRRZGNSUHd2LzBveWVad2U4?=
 =?utf-8?B?RmxCSWJtZG9uVkNQMm92RFFuQlZFOVIzUGx6VlNSVGZHMUZoWDBIOGM2c1Q0?=
 =?utf-8?B?QndmNlV6UHo3NTFlNU9zOGJCMFpBNE9yOGg4V1JGenJPR3dlYkwvNjdycDVh?=
 =?utf-8?B?am5KbEpJM1NDZmFIZ0w1MEViY0pMdUJyd25YMUxkaVRkT3pHcEp4a3R6YXZP?=
 =?utf-8?B?dExVUDZPRE95cG0wV05kbDkzbTBadE9laVRJWERobUllQzc3cnVWZnVJbUxy?=
 =?utf-8?B?RUpDRDBrUFR3THU1QVlzRTFYN2o3aFpNTGFZa0laeVBqcXZCNWYxNGNjOTdJ?=
 =?utf-8?B?K3pPWDY5SGtwRTBRQjF4OFUxeVZOVGxoRzZhUnJ3TERubEIyK1NBWk94aEVr?=
 =?utf-8?B?ejdGTnhUbzlJUU00Rk1QUVd1dDBmRHRkdHZXYmhlSXV0Y1l2OStXN2FlRVlE?=
 =?utf-8?B?TVJYQWJmWDY5VE4zVkhIdkRFODVqL3lzamtjbEc3OWlQUkZ1TWo1L1VXc05H?=
 =?utf-8?B?c054bmMybVJNUDN4K0JLcHpRVjVEUldrV2FpaUZ3b3ZONGFrbVBSUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1dd1ad-f334-4e5d-b571-08de68f3c079
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:28:45.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZ5nBSg6Yu/ys8fDrc8hbAn9m4py2W8gfd3sdt1XryqyYwAMTT2klVKXorDGP3AA1g/GC58pUq96/JB1cv6TGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662

On 2/9/26 6:45 PM, John Hubbard wrote:
> Hi,
> 
> This is based on the Feb 5, 2026 linux-next: commit 9845cf73f7db ("Add
> linux-next specific files for 20260205") That's new enough to have the
> pdev.as_ref() changes (see below for details), but not so new as to
> include the current merge window churn for Linux .70.

Forgot to mention that there is a git branch here, for convenience:

 https://github.com/johnhubbard/linux/tree/nova-core-blackwell-linux-next-v4

thanks,
-- 
John Hubbard

> 
> I've re-tested on Ampere (GA104) and Blackwell (GB202) RTX GPUs.
> 
> Data center GPUs remain as TODO items: GA100 needs some additional code,
> Hopper/GH100 might work but is not yet tested, and I haven't even
> thought about Blackwell data center GPUs.
> 
> So, even though many patches say Hopper/Blackwell, there may be some
> test-and-fix work remaining there.
> 
> Changes in v4:
> 
> * Fixed the IOMMU page faults on address 0x0 that I was seeing on v3 and
>   earlier, for the iommu enabled case. These were due to the sysmem
>   flush buffer being in a different location for Blackwell, so I've
>   HAL-ified that aspect.
> 
> * Added a patch (0001) to pass pdev directly to dev_* logging macros.
>   Then converted the remaining patches to also use pdev directly,
>   instead of pdev.as_ref(). This is only possible in branches that have
>   commit a38cd1fea989 ("rust: device: support `dev_printk` on all
>   devices"), which in turn is why this v4 is based on a linux-next
>   commit.
> 
> * Changed FmcSignatures fields from [u32; N] to [u8; N] arrays because
>   the data is not treated as 32-bit integers. This eliminates the need
>   for .as_bytes_mut() in the FMC signature extraction patch and allows
>   using named constants like [u8; FSP_HASH_SIZE]. (From Timur Tabi's
>   review.)
> 
> * Changed .unwrap_or(u64::MAX) to .expect("...") for alignment overflow
>   in client_alloc_size() and management_overhead(). A panic is warranted
>   here since the values are compile-time constants and overflow is
>   impossible. (From Timur Tabi's review.)
> 
> * Added a patch at the end that I actually expect will get merged
>   earlier, separately. But for now, it avoids nova-drm aux bus
>   registration failure on multi-GPU systems, which in turn keeps the
>   driver alive, which in turn avoids a driver teardown missing feature
>   (pre-existing), which in turn avoids IOMMU page faults at non-zero
>   addresses. whew. :)
> 
> Changes in v3:
> 
> * Rebased onto linux-next (20260205), which includes several
>   rust-for-linux updates that affected nova-core.
> 
> * Removed redundant .as_ref() from dev_*!() macro call sites, since the
>   dev_printk!() macro now calls .as_ref() internally (Gary Guo's
>   "remove redundant .as_ref() for dev_* print" series).
> 
> * Added a `use kernel::io::Io` import in regs.rs, needed after the
>   upstream separation of generic I/O helpers from the MMIO
>   implementation.
> 
> Changes in v2:
> 
> v2 is here:
>     https://lore.kernel.org/20260131005604.454172-1-jhubbard@nvidia.com
> 
> * GA100 (an Ampere chip whose firmware boot steps are closer to Turing,
>   than to other Amperes) returns ENOTSUPP for now because it is *known*
>   to not work yet.
> 
> * FSP: use the new Chipset::fsp_cot_version() method instead of a
>   hardcoded constant. This fixes a known wrongness on GH100.
> 
> * Changed to a HAL approach to handle the slightly different non-WPR
>   heap sizes, for Hopper vs. Blackwell.
> 
> * Return Option instead of Result from get_gsp_sigs_section() since
>   the failure case is simply "not found".
> 
> * Return DmaMask directly from dma_mask() instead of returning a bit
>   count.
> 
> * Change fmc_full from DmaObject to KVec<u8> since it's only used for
>   CPU-side signature extraction and is never submitted to hardware
>   (only fmc_image is). This eliminates the need for unsafe code and
>   the associated SAFETY comment entirely.
> 
> * Use as_bytes_mut() instead of unsafe core::slice::from_raw_parts_mut()
>   for copying FMC signature data (hash, public_key, signature arrays).
> 
> * Refactor wait_for_gsp_lockdown_release() to use early return with ?
>   instead of chained .inspect_err().map().and_then() pattern.
> 
> * Removed many dev_dbg! statements.
> 
> * Use IEC binary prefix "MiB" instead of "MB" for memory size output.
>   Also improved display of small sizes (e.g., "24 KiB" instead of
>   "0 MB") and fixed a typo ("suprising" -> "surprising").
> 
> * Reordered the "skip GFW boot waiting" commit to appear earlier in the
>   series.
> 
> * Series has been reduced from 31 to 30 patches, because the "needs
>   large reserved mem" patch was absorbed into the non-WPR heap size
>   patch.
> 
> John Hubbard (33):
>   gpu: nova-core: pass pdev directly to dev_* logging macros
>   gpu: nova-core: print FB sizes, along with ranges
>   gpu: nova-core: add FbRange.len() and use it in boot.rs
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   gpu: nova-core: factor .fwsignature* selection into a new
>     get_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
>   gpu: nova-core: apply the one "use" item per line policy to
>     commands.rs
>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
>   gpu: nova-core: move firmware image parsing code to firmware.rs
>   gpu: nova-core: factor out a section_name_eq() function
>   gpu: nova-core: don't assume 64-bit firmware images
>   gpu: nova-core: add support for 32-bit firmware images
>   gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
>   gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
>     of FSP
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
>   gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>   gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
>   gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
>     waiting
>   gpu: nova-core: Hopper/Blackwell: add FSP message structures
>   gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
>   gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
>   gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
>   gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
>   gpu: nova-core: Blackwell: use correct sysmem flush registers
>   gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
>   gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
>   gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
>   gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
>   gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
>   gpu: nova-core: clarify the GPU firmware boot steps
>   gpu: nova-core: fix aux device registration for multi-GPU systems
> 
>  drivers/gpu/nova-core/driver.rs          |  48 +-
>  drivers/gpu/nova-core/falcon.rs          |   1 +
>  drivers/gpu/nova-core/falcon/fsp.rs      | 160 +++++++
>  drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
>  drivers/gpu/nova-core/fb.rs              | 118 ++++-
>  drivers/gpu/nova-core/fb/hal.rs          |  34 +-
>  drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs    |  73 +++
>  drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
>  drivers/gpu/nova-core/fb/hal/gh100.rs    |  37 ++
>  drivers/gpu/nova-core/firmware.rs        | 186 ++++++++
>  drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
>  drivers/gpu/nova-core/firmware/gsp.rs    | 140 ++----
>  drivers/gpu/nova-core/fsp.rs             | 561 +++++++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs             |  87 +++-
>  drivers/gpu/nova-core/gsp/boot.rs        | 337 +++++++++++---
>  drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
>  drivers/gpu/nova-core/gsp/fw.rs          |  63 ++-
>  drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
>  drivers/gpu/nova-core/nova_core.rs       |   1 +
>  drivers/gpu/nova-core/num.rs             |  10 +
>  drivers/gpu/nova-core/regs.rs            |  95 ++++
>  22 files changed, 1856 insertions(+), 266 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>  create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
> 
> 
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921



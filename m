Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012057.outbound.protection.outlook.com [40.107.200.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397732A3EC;
	Thu,  5 Feb 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327857; cv=fail; b=tcfK8Cy1gMr/+lsqAB8yD2g+GYYp1nYYLI0tq52uU5hZp209KAuUaX33xMCCac+OQFQwJf+T/Be1TAvovuABwgN4mTYwJTnNiGVdRVgQxS741G/MlLW8y5BJfVHvn7o5HRiGRgBam3cSkczGsPX+cBqM5u1AW6//gY29G5g9hAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327857; c=relaxed/simple;
	bh=XsFGmfLNG1UdpzfsYP02tHf4XvAq62VQzK6vPBSnf7k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sOm2K2zg++UmghMZHb9aym4zdAgywlITMCkW77fpYdudOckLK38SM0Na/4LFwk9abVpt6GsfyFPngvFk5DD3MELWf9ppFI4RKG2Yo+WvlUK9xraQ4nkvR/VRp+8sIwa73sI/3kBdpXtw41oYjk1rE2ExYROloA47KlaKlexVbyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sqDi7ICA; arc=fail smtp.client-ip=40.107.200.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sqDi7ICA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8fi3W6iRzH9dH0ydHpzJ0j8hnJn5iT4nROrYYk9r6wXAJWNG0yMLV57hKallHNJOVEfBPulTtL8sI4PcqZFPvpnwZLGgLaub9oCOYmqkSOpHG2qgHvA8FSh6PaeWOjR6Ri35WZn6KkpfNBo/z42kHDi+seBhNScpzfIgaDfmfMpsxe5y3iIffrkbVuyXo6rhVPvejRSxBl3Ejobgm45S4tm+kOzQKN5l7PmoNdp0lZOCWv69SPrpxJKbflq+zmiu9Vy5eEC2JxW7jgITMt0/nKMkwT9fwMHCGZ6/qxw1b+DruJk/zh47JEPcqsaHgohwJZnwAbd94f0M6kH2TCxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+5yz1GYrwcHevHPAtsYdSmkg1B25gX8VhXjXG0vEDY=;
 b=B3ZtkDLtFEbbZMsvWelZKPOHfkXzg0vd4fsDBvTnk5k4AYTQ96puUHFJqzUDpv+w+k0aiUyPnrlEYtFtlDLKxbBpKWhhGPApM3k23IcdENBtxArUdP4Hnd71lCcp2Tvfr40pJmo02bzw8nKmBe+YNUcV9B92QoXb2+xbzKriFbxVn3fw3xu0+7Lo8ZiuZHXiMEeis1VoL3nGAeHEGyJhX0ODQcSLwmeZA1+aDG0hmx6YwIb8UmvB9qrFUrHt+k8ism9hu6VDmOwpUAdoXHBIyaaLwawGxtU4dgeflI98ODaiPKG2V2/ywP8shZpMrArVxu5ZiaEv545lDY3y/qqNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+5yz1GYrwcHevHPAtsYdSmkg1B25gX8VhXjXG0vEDY=;
 b=sqDi7ICAxSGmqljkWM32V+LgepAj623eGdBhx9ky+is5fGaP1IQVCVgO+XVy/wE+pq4yJW8vbwv0kD8yKcxJzWxscq05bu4qvzas1MIAUbaCxBOgBq2bsCTgOaniYKKHmBTdShgoW6uFnacIU0ZnwFCBQyCMRI5d5JGge/PTJiybkC/QQ2EmlpOvFTRh7NsTah/GjxBVRsCDb85E+FXxCQF5KK2PWxobxV3f1yBGMNn9dspf3bN2pr8wJKV3FexnyFh7h86V5m5jk03dpNWs6eIL3Ifm1g7Ht1Ey44BiaTIj/Q9byDzct0nQBop2OvLmFYBeGkaQekHrH8B+O7XTZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Thu, 5 Feb 2026 21:44:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 21:44:09 +0000
Message-ID: <36698be6-d260-41e3-904d-61e3be5463d0@nvidia.com>
Date: Thu, 5 Feb 2026 13:44:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for multi-GPU
 systems
To: Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260205041120.127106-1-jhubbard@nvidia.com>
 <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
 <aYSfpf3xZNwZhzXs@casper.infradead.org>
 <DG73EB8091J4.3SFPDC5TLH0M7@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG73EB8091J4.3SFPDC5TLH0M7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 238a1604-c5e2-402b-182e-08de64ffb1a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEhneU8wenVVSU9tdUtDcFNKRVB0SlU2VEplN0lPenNlSG5McnoyYlRFdjlz?=
 =?utf-8?B?eTBSa2t2Wk45ZklETFl0bVVnNE5zc3V5Vml6RS92NStYd3ZwaWdic2p2RG9Y?=
 =?utf-8?B?ZzNpeklSZFhwdDNXbHNXZmExSTVJRUJNQ3FEY3p6NEtGbDExNlc4aENxajJn?=
 =?utf-8?B?UEpzTlcyVis1RGNsRUg3MkhIY0ppRnIwRDhQY01pS2xtNGhWa0NQZXl0cFB3?=
 =?utf-8?B?N0Q2a09KRVZ2QnlwRWdwbXBUUkVpbGd0ZWZWd2lwb1lHTnBVWS94M0F0aVM5?=
 =?utf-8?B?eVprT0NobUkyZTYzbXBoV1RRSDMxTmtoRk9yM2RKbmt2b1I0T25zeCtheC9q?=
 =?utf-8?B?anlEL1l3M2l1UDVuenNpdDNPa1BMd1dOUUNIN1NEQWV4WTMzR21XT0txeS8z?=
 =?utf-8?B?eU5LSEFVdndReFJiNnhMenM3dm9lY0hGb1ZMMzk1Z1JkSGV6YnY3WG1kbnA4?=
 =?utf-8?B?VTJLNnVldWQySGEySCtWM1pnT0xvZlhic0YwT1FhREVwSWJrWDlHN3laeDZZ?=
 =?utf-8?B?cVYrZWNwSklpT2k2RnMwQnhTN2NFWFYxc0NWN2JqbHFPZXc5WjlsZHZjZkhN?=
 =?utf-8?B?TGZHRE5uaHZQWGVzZ21lVjJOQUcrTkI3YzV6YkhnanVodWp3bk83blh6UGJl?=
 =?utf-8?B?ZWVUUGJudlFPUHR0YUZzaW1zcFowQ0MzYnZpOTFyR3ZaRnowN1pkcUMwWUFD?=
 =?utf-8?B?M080V082RVRBUVgwcUl4Vm5JS2VzaEdwUlM0ZE4yUVBHZU0yMGdOUzRlMmkw?=
 =?utf-8?B?UktZQnZaYWVPV1NUbkhTNVp5cE03b2dBVlc0M3o4Qk5tRkJoK1Y0SVRZOEg4?=
 =?utf-8?B?bHB3amF6OGp6dFVKQ2JJWWlFWFU5REx6Vmx4UkxMYlFUS2RNZitha3pxUm1O?=
 =?utf-8?B?Q2tOYnhOdStpV25aQkxUVEFMZXdmMlltdzdxKzJWQ1pZQ09MMTFNU3laT0x2?=
 =?utf-8?B?NU1hMWhWcHM3WVhXNm1aVy9PMlNSZ3M5WFdMaDV0NnRHYWtmdU5zdXhpOTl3?=
 =?utf-8?B?ck90bmNnbnpJRFNEbk1rUWt4OGl0Q1JKWGdKR3ZZbTZST1hsaXVxcjlvWXRy?=
 =?utf-8?B?LzdxQWpNNWZDejFvS3c1Y05FbXQybmM4Q2pONi9ucDNFTUdlQVFtZGh4NkU0?=
 =?utf-8?B?YTlQNHNIaTltNTlPbVVmNjBtYjk3T2dwaXZPamVSTkdYV2tGZXRMNEFhbitl?=
 =?utf-8?B?d1VNZkVkKy9ZZ25ia2Rob2Z4cEZRNE9zRVVWUHdCdkE4U2RNbGFycGllam1N?=
 =?utf-8?B?bTlOM0VpMzYzeDc1MmExUGZDZERDa0N6SEhQbHhJUlkvb21OQmRHVXZBL1o3?=
 =?utf-8?B?cHV4cTVheWxrNk9Zd3JiQmRQRlZ4SmszV05vQ3Rya0ZzN2srNEJsaHBjTHRE?=
 =?utf-8?B?QTdQcEQrWFkxaFlxK0hvZVJnWEVKOHZSalZmTTg1MHF4aDNia1FZUGl4UkFq?=
 =?utf-8?B?ai95TjV3OGJUdVJhWGdOU0pWclRObGhINDUvOXJqRjBsT0EyNDQwRUxuNG1I?=
 =?utf-8?B?eW1xK243dXZBNWRPa3dLMGNWaFZIVXFJZHRvcDlHWlZPZWdDSDhSbVZ3UVFa?=
 =?utf-8?B?enpFNzhtYmd0ZWVRbk5ndVdkWWo3OXEyNVdtYnkxM1pSWUVnTUNPTjFaMVV5?=
 =?utf-8?B?Z2t2Mi9WdWFxUUxLWkNCSGNBWWxvcGJNUXBsUmxSMGszL1NnOXNrYnhNWkVO?=
 =?utf-8?B?OGdISXR6ZVI4Y3h4VnpzR0xvbHlCWVZxaHJZcEFMcVRJbHRSbnFtQ3VxQ1ha?=
 =?utf-8?B?VEVET1dTWVB0bDdTcVdKUGxQY1lzUjFxemNQeVRzQWdqVWR5cDk5TElhMnBL?=
 =?utf-8?B?ZWhOTklWMkdSRG45VWxPb2RIbjdnKzkxM1lDRXU3SVB4TGRTNlR2WXBrQnY1?=
 =?utf-8?B?dzJXZ0Y2S0lMMnl3S2xKVlM4aWJ5aTNKZ25rTTRqdGFKakJzUjVUZWFEUyt3?=
 =?utf-8?B?dXk2cUIvZWhtQ053eU4rczQ1UzBDSUR1Q0JLNEFDeUJQbmZ2TWdqUkVJNWNO?=
 =?utf-8?B?NlBwSGl1QzM4b0UwZGZaYWExVVBHTTUwc1AwRVZEYnphSU9qbGwxZmFaYmtC?=
 =?utf-8?B?VGtBZTBtbUY3dVlsVGdUTXhXSnd2T3hvbEJVUEpZbjZJMVdsaVdGUXJ6ckFX?=
 =?utf-8?Q?ddGs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clQ4dTRXa3pZMU04NHZqUFQ4NUd6R1p6OFowQUlXWUtNL3NKT1VlZ0hUOHZy?=
 =?utf-8?B?VGFSUDJxRFNneUdtSzMvbk5NZ2ZCTlBEaVBsWmpsTk1RVytqWUgwc0o4MHBj?=
 =?utf-8?B?WFRGZUJyV2NzTDF2cUQ0RGxUUklNbnFuQW9aS0htakhEenMyWkxpYkVueFdV?=
 =?utf-8?B?akZjSnlieDZ5UjdnS05rdndEQ1Z0TThvN241bjNHWXJHZ3dXRnBNRjkxUnFX?=
 =?utf-8?B?TFhxTXdLRjBiMW83TlRKejQ0Zk9xam1PRDhvblpuVmFTeGk2R1pMbEwvYU1J?=
 =?utf-8?B?RWRRYXdPRWdUY29rSitsc215Q2wza3B1bUxDN2N0TTl5bTAxTkpIYXAyN1Z5?=
 =?utf-8?B?aFQ4S0ZHSWw2ald0YUZnaWxvckY0alYxVUNka3JveFVaYzRyenpDeDM4cVVN?=
 =?utf-8?B?TldqRGtWeVgwUnhWcjNobnlPWE9xTDV0Mm8zUEV6K0FZcUhLZVZ0Wjltek9F?=
 =?utf-8?B?YldVYjRCSkx6SGFCSUJOSkJjNkpQWWVvUUVFb2s3MDFmYzE5azZlVUJQSmRl?=
 =?utf-8?B?UlRmbnlEa09lZlBKY1N4eXFCL3FmdFZHRTlDUnZkYUlPVTZCYmhTc3hseDNm?=
 =?utf-8?B?OWd3VW43YUJMMmJRMHIvQ21zZlBtQ21kOUZiVnAwL2FWbmJ0VmVoTUtXOVk5?=
 =?utf-8?B?VytGQkhQSTN0VUhIRWNkSTJheHdFMUlkZkFkSEFVWnJtODJsZnc4VzlSYXhn?=
 =?utf-8?B?em1zVzRJUjBqeXdvdWdhN3NqdkxCWDdyczRHT2ZuY3Q3OUY5R3BNSVVHa3Vy?=
 =?utf-8?B?djB4QzE5TWRMQmZobnlyWUR6bm02RmlLSk55Ky9MT3NreHUrN1ZRRnBMRDAw?=
 =?utf-8?B?bHh2T2xEVmVTa3h3VjZSYVZtcisweWNNbklpS1gxcS8rSWNhbk5RU0dCUEgx?=
 =?utf-8?B?U0MweWlTSGtzclR2NGVqaTBXMEpJNTVtbmgvOXUzOSs5eXJaVEd6T3J0T1Iv?=
 =?utf-8?B?eTFyMmJZbHVwOHZjRDJJYmpLV29TVk1RTGpTWHdTY0l2VngwWUxwaENuMFlS?=
 =?utf-8?B?aE5obUhDTUJRL2dwYnNaUFkzQlFUMXhnTmdENUh0S0NCd3J2RlNCc1hwTlBO?=
 =?utf-8?B?ZDBpT2kwdHFjTDhEMGF0T1pPYk5VaTQ1YzMydFJqVUlMZ0NGU3dMdE5weGhn?=
 =?utf-8?B?dGtRVDNES0o5UCtKQ2hIbWI5ZkNFd0JoMHVTQklYaVMvS1ZvRWRaNkt5MGVG?=
 =?utf-8?B?VHVrMXprckplOWJ6aVd0YVZsU0N6OXA3NU80ZXl2RVY5RGp4d3JFaFhKOWgr?=
 =?utf-8?B?UTJrdzRZZ2FHQ1VzY05wSENrcDNPQ1JPbmpzNnBwQTZHTnhUOGlHR0V4ZVV1?=
 =?utf-8?B?c0o2OVNucHIrZWEvalRIZ0JEbFhPU0xjYzNxTURjRlZDbGdTMEhKdzBaZDZY?=
 =?utf-8?B?OUVQNDJPQUoyekNNSCtiVHgvR0R6b3A2VWUxdStuK1Q4ekJTZmxsVmZSS216?=
 =?utf-8?B?OG5RS2puZ1NwemgyNE9Ea0xIM1lTV25pOGwzNmJLZTJBRVMzbGVYYmh5TEZW?=
 =?utf-8?B?Zi92S0dCNmZTZ3pPWm02SUFqWDlpZkNVVEN4dzMzbjUwN3RLU0wvZVpUaXFn?=
 =?utf-8?B?UUo2OVBIbTZpYlVvM1d3bFBkeWsyMU5qQUpqRU1rVWFwem5WUytDbENTMEJK?=
 =?utf-8?B?b3NEa0lRQlhwd3JUQTNoWXFUZUlKQ09hSzNGS0VadXBIUmp6R25mSGZsQnF0?=
 =?utf-8?B?Q2ZqcW9XOUFqYUhwVnVQaW1yWTBkNEw3L2JlSVhvalZZa2IxY3prTGdmVHJC?=
 =?utf-8?B?SXVoUVhzT1dpdktsQWFYY1JOL3c5Y2VyWUkwOGJLeHNzVTNrakoyOXVoRHVF?=
 =?utf-8?B?NVhvcTF5WncvR1prTVp0aXR5TCttNE5MSitCQkxQR2gzQ2lPVE16eHR0ODNS?=
 =?utf-8?B?OE11eVE1aG9DZ3pINkp3aU1aazZWNHhZL2hNUmk2ZWR6SC9aOFUydnpYTTd0?=
 =?utf-8?B?NE1DajJheHI4VUEyVTE0dzZBL05nZGhzVjNFQnlnQ1BCSGMyTmZGbHE1R3Y4?=
 =?utf-8?B?TGs0N0JBVGIrMXVNSmxmcTcxQ0t1TldKSFJBdXprenFvSEV2anFMZnlCQTc4?=
 =?utf-8?B?MFY2SXB5OEw4OE9tNGRseEp1MmtaUnJQclpmbTFaV1FKYXlBaE5XZ1lzVFZV?=
 =?utf-8?B?K0dCeVI5VjI5R2ZSK29OZWl1OC9NbDFsMFlpc0hBRHFYM2FoVzlXclVFcXNm?=
 =?utf-8?B?Q05rQTV0VjNSR1F1b1VlVFF6OUN2R041S3dZcVhWTzUzTkxYYksyOVdwY3Rh?=
 =?utf-8?B?WFFTeWlMY2pqbFBESkY5UlRrUVF4M0VpSUtaaGp0cTNNRVlpVTl3b2t6U092?=
 =?utf-8?B?VktPK1NZaEdhTWhaTEtuUlZVMmxLZHB3K1lneW9CNHdZUmUwWEd3dS9vS2Iv?=
 =?utf-8?Q?odbBAoFoqqeK8HWE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238a1604-c5e2-402b-182e-08de64ffb1a3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 21:44:09.5698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXHh4D9rugskMxYIBgTbUt5pFvPwT8nCB5kZ1WhX0OnoLdAqVamvk+CSduC2xVxB9n3Jzm2z760bIklI5KXodw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

On 2/5/26 6:19 AM, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 2:48 PM CET, Matthew Wilcox wrote:
>> On Thu, Feb 05, 2026 at 01:44:27PM +0000, Gary Guo wrote:
>>>> Fix this by using an atomic counter to generate unique IDs for each
>>>> GPU's aux device registration. The TODO item to eventually use XArray
>>>> for recycling aux device IDs is retained, but for now, this works very
>>>> nicely.
>>>>
>>>> This has the side effect of making debugfs[1] work on multi-GPU systems.
>>>
>>> Hi John,
>>>
>>> Looks like this is something that should be achieved via IDA?
>>
>> Yes, if you have no need to go from ID to pointer, an IDA is better.
>> That said, as far as I understand what this code is doing, an atomic_t
>> solves the problem just fine and is cheaper.
> 
> I agree, for now an atomic should be perfectly fine. Though, with enough
> patience binding/unbinding the driver from sysfs you can probably make this
> overflow. :)
> 
> The reason for the Xarray TODO is that it is one option for a place where
> nova-core can store nova-drm / vGPU specific data, once either vGPU or nova-drm
> attaches to the auxiliary device. But I think there may be better alternatives.

OK, this seems like enough information to post a v2, thanks!

thanks,
-- 
John Hubbard


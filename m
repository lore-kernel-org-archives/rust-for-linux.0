Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C61B4138;
	Thu,  4 Dec 2025 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764833894; cv=fail; b=Ui/T2oeIZBO7G7+y/8Mx9+boXU/11+uc4NJWYtTZLSDXT50AohBvyjiaWyVDUlEXDd0omhAy1EmIU8SSGneVZQDPB/UGgpPVjj9lhH1skijz9NQf7Ys+j2vjOQugr9w9BG+XEXVlXcGETORKjkskUU5OWbhVXgSO8nQbNJG0m9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764833894; c=relaxed/simple;
	bh=L7cpfifs+s+VvnfiKPnL3N91ic8JPRbL+3ZYM/1N3ks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AdEKrENRPfo5qZpjzZVhSUMxDq5oW0dGBVeCY8GWH2nsLCkMVbCVSIv8IaJ3DxQYha1ls89+/ztuNwHkyq1zlTM9joHMM2G8vIIc4jnvv5OuIXntvuqjyEhFiWhgiRuj2KbPy1GsXLs7K9opmQdAMCeZ0/n3Rdh+ED7FZ5dr0OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U5UL9f6H; arc=fail smtp.client-ip=52.101.56.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U5UL9f6H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvA+NqehZMoa/jNmsrVkbWTWM33dyXQPwC+6GX3BZAgZCD/WiRjUSVu6uZvDjGDR2e0TsS06wlplCgviwtmZL8sOSYRF4sWOgpjuytMlwvVBhzA3FS6dklkm+0OMqgYxMmWYJAttxkwyGo2lDYAWbuLTCTeQw5/+JGK0I58ClYAEm5jODQArNQUHjf/LvITnSBBIYwsr0bt2sc7/+SVxKOy7QSA252vSjdrPC1N/sBwNmiXmmcRqrdroxetBEYhDKdYo3vqCL6oPqJbVKV8JRuLetvmJr/MAoJbqaYfk+3W82537a49NyldBEeI+/J7gbdJX9gMbn2bSIeCMM4w/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzXV8HISQBE2/5BjBN8oc2+Px+bUjckoAjmuDaTw/bk=;
 b=k7cytCOjWmR76APGXzemPW8iAyM0pc+2ExrPghgdQ9wmuID6CinxMa8m00UA0Iz1PrWN/PONR42ZNR3aJvdsO9hKS9nk3kdbrOHBiUagP9SE7SAftTWY+kEKBVYQFmSiwwip83I/wsDxMDPpuc9y8q4hYMDeJ8XFQRbzTvgBakLioXMOEbBU5RVYGcjIfVj65Tlf06ujZT7JGdLvpOG67/fmC6F+tSJvl25pHLyG5WmXrKeQ8Nq9lhSWmi2YiuLYc2m2xWuhy/H+NEpywDqdrJzeVQfpmUwHyoBjUxnBTJNhFlPSfUQu2S10Hs7sVhohnwrIniFecdZL6vUVEsny8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzXV8HISQBE2/5BjBN8oc2+Px+bUjckoAjmuDaTw/bk=;
 b=U5UL9f6HAMQPvY/YjiMzlo2PJnYJipJMx4zVJuinMegq4vpT5u6vqRUvZHwggJnpzqXcVF3c5eXtFOt+4tHVBH+Td3zG+yOJ4R+BxjZM3PC74uTSa4cppOTUSOgxZWsVF2Q1FQe1Q2PEh+hOxR+LMo3yNq0piLhuqQ2rw74mpEsO7ilB0xLE/BnZfhQnXrSSJE4QlJCjgwxu+42WH2z6sbpaona5qsrVLgFep2l1G4eEMm5NdfOAYtVCcjfJ+tPzgoqn7N1RxdsSAQyqQVq49mUV3YPmDfo0LC4skXbwTZXinryzWf2EDkeQxb4Uj4f4fAGP1GPYteqzwIRel7IrSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 07:38:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:38:00 +0000
Message-ID: <933e1353-b5f0-4aa8-bc66-ed8675f4c299@nvidia.com>
Date: Wed, 3 Dec 2025 23:37:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/31] gpu: nova-core: refactor SEC2 booter loading into
 run_booter() helper
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-27-jhubbard@nvidia.com>
 <7746f9aa282db48600b2c1432bd4c14df585541c.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7746f9aa282db48600b2c1432bd4c14df585541c.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: a337c129-557b-4873-93a9-08de33080cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDhGKy9HbE1mdDYya1JmN2xleEFOQUR4a2NOR2gwcFNHd3g0Nmd2YTFCeGI2?=
 =?utf-8?B?Q3FTVTV3dzlqQWdyYXZuVWNNSzNBSituMTBmTkMwUko2Vk9iWExhbEx0azEr?=
 =?utf-8?B?SlVnaWYxQWN0c2UrNml0dkxoUzNwamJyVEdJbTJFNllrWExZK0g3ZnhpVXFB?=
 =?utf-8?B?bU9CZEpMQ0FmYTMvYjlzejU0N1NVNmR4aitsSVFxUkxSVGVhQVlTODNGRjJK?=
 =?utf-8?B?VGZ3aW00KzFaamxJb0JwNEdtVGVId1RqWHJteTRjWjJWMXZxSzRsbWJQYm5y?=
 =?utf-8?B?VkxuT1VJbHVtZzBhbnIyMTZoc3JQeVBqa29udFA2UjU1SE1TZHN5VE8zUG1K?=
 =?utf-8?B?WHhwU0I1bFV0T095UG1KWXJRU1ZTMUxDR2oyTWNjQ3h6VUU0TDRjczJIcXh3?=
 =?utf-8?B?bXYzK2o1dWFPeVZEdVhnWWJ0djBjeVplR3pSTjErTnZBUk5NNEhRR1hocTRu?=
 =?utf-8?B?YUY5aUIwb040STRRcmlTYkovWEdiUms4U0dHRzFUUnY2RE9za1lhWTF4MlI0?=
 =?utf-8?B?L2V5bkc3Y1hZSFZXQVpwTEtSTkZiWkcwZWQwYTNndU44OTFvcE81TU5hNjJ3?=
 =?utf-8?B?Q2ZqNEwzWWxOQWZJZlptM3BMZDFrdHFuT2pGdHBQTVN6MUt5OGIwclVDZFBY?=
 =?utf-8?B?NkhUNVBNUWNiV1ErVXZGNlI0b3dBSGNqWHh2S1dGekVaQk54cVVKLzFKMlh6?=
 =?utf-8?B?WktLZE9zTVFHZUlSTnd3M0YvVXlQb01RUE03ZGp0WnF3RFQzVnpVbzFzbVNl?=
 =?utf-8?B?blJseVNWOHNRSXJwQS9lUUt2SDM0aVJqdW1nazhBNEU0S2pQZElqYkNybUwy?=
 =?utf-8?B?WXp3Z1ZsamJiK2s1RFQveTN5R0dhZlZOK0crN0RTVEZTcklqM1JFV2FrRWxP?=
 =?utf-8?B?QUtCUHd6bWFiY2tIbXBCMHpkMkozWmNnQnIzSmRZa3lWR2g1VThYZFErbDlF?=
 =?utf-8?B?VmsweU1PQzZLZ1dKalNDZGJtZ0tmcU1qb3ZIbW9Kdmh5NW52YzE4bkNUU0pK?=
 =?utf-8?B?cXRZNlVjRFU0cUNqa1FvL2doVGxZcHJVZkhXbFlOa21Jc3FoZUtYYVZCd0s4?=
 =?utf-8?B?Tk9VWTJCNUdQaythSGd5UnZaUFlhWkdNS2d2LzlpVk5DeCtacjcrRkhpOUVk?=
 =?utf-8?B?a21TYWZtemdLMlVxOGlUblV0ZDJXZmkrZ0Fab3FvN3Z4cDFpOUhCL2J1YWMz?=
 =?utf-8?B?VjNSV0w0VXFUR0Nycmtkd3FHRmFsMTErUTQ1eXBLMEZzblZSQUZWaDFwSEh2?=
 =?utf-8?B?NmNHU2xPbHlnNWY4L1BabWdzZ2V3L0VyaW4wRjFkM1UvZHZHZEhVMDdRMXNw?=
 =?utf-8?B?MkxGam4yS21nbndGK2JjRE1pV2tnUnl4SGZnTW5kS0RYaG9Tc2o1OGNrSEZm?=
 =?utf-8?B?WlBjQ0pLS0RTM3BGZEtHRVJyMDlBWjFTM2h1azN6aTZsTDEwU3ZINFgxeE5E?=
 =?utf-8?B?dk44NDBBUUtUUTloamZERnZwQ2ZPRTAzMVpaT2RVVTdVajNjTTNCWGM3NjAw?=
 =?utf-8?B?NmFEVXdEOHlOZ2xNYnFpelpoeE5TcWxaRkRGTnJ2L2N2TkRCeWFya1ZaaElO?=
 =?utf-8?B?V3h6QTNJdE9jS1FSbVprUFpBcVlCMEpiWTZwZ1NZMFl3cTlzSjFTVkZ4OTds?=
 =?utf-8?B?S1hKQ2JRbnFQYXU1Qm14WVd4TE5pczRNVjJSeWt5MDFZbXpqWWJqM1h0dHI3?=
 =?utf-8?B?Z0pkaWR1M09pSTJGUGU1Tjd2R0FhYjdMd1lnVE9SUHo1Tk1MNGFkWDBXZmdH?=
 =?utf-8?B?THRmZHVDUnpWc2dEcXBadTZxUERLczh1VEdrS2JVV0ZTRk9vR2FoWDVWNFZ5?=
 =?utf-8?B?MERZaDFtOTRmRU1RRnJWZW5JQ2hadlV6WFRHQmVLRVpyemdVdkowRmVSeSt6?=
 =?utf-8?B?MkZOazhYYThjcE1qaVBSYzJGZWhMb3BaL1RVRXdXOXdwMlVNYzJnSnNISXVU?=
 =?utf-8?Q?K7bV+R/pG8rVlVSvdB4WqIrPXwMOL7mK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MklnL0MyT29mZ3NhdkZMd1hWMzJJekVlZk5KWGJrVGMwM0pmdC9MZkZuN3hY?=
 =?utf-8?B?cDkzK3VuaGRPem9zcGdaN216R3UyQjUyUVZuUVJieW56d0tSQ2pKQlRJNkxT?=
 =?utf-8?B?d3J3aUFHa2k2aFJSS3p5aDNCaVdmODE5ekx0blFCOTV5VlhyTHRybFVRQWRB?=
 =?utf-8?B?bFNIcmRlbFVMckt1VDlEZ2pXWE91MEU0YTBZVmdGSWZvOXc0Z0FtN2pSWXhu?=
 =?utf-8?B?bXBrR2hVOUtyV1REa3FOcnBzalJCcGtKcHNpa3VYaDdXQm4wM3BTK2RxUjZy?=
 =?utf-8?B?WW81c1VOWisvRU9BM0ErME5DOUVNNFNrWDNZVUVhWm0wcWJDMFRQTElwQVVW?=
 =?utf-8?B?RlhwT2tLdUZMNDVKRmFhK3dMSElWcTEzaFltLy9TcEdWR0F5QU9WREJUcGxx?=
 =?utf-8?B?ZTFrLytibldkam4wTkNwYmJBYWJaYnV0a1VHeHd1alovK0Erb0gxdVZ6UmtQ?=
 =?utf-8?B?ckpjMHcyUUp0bDBUcTc2bkh2eEhXMEdNNEI1TThQTGhpQndLdnpzZGFNeDNw?=
 =?utf-8?B?V29ybytsVHJHc2Vkc3VDRFdDNmphVUswdmJ6aStKd1dGWThlQlpVWUljVk5O?=
 =?utf-8?B?ZzF6MEEveUtuN0drLzI3cG5jREVaVlNVSTh5OWtZTDRqa252VzQ2RUlTMG0w?=
 =?utf-8?B?ZlpRMFRsQ1d1QlgxZVVZK0ZEL2Rjd210T1VEUW8wb1M2TGMrNC9YRjlGVXJ1?=
 =?utf-8?B?VUc3TGc4LzQ0Mnl0eWRHR0ZZaEUzWGJPZHErT2NrYW01bGtOcTBIMlBLMWQv?=
 =?utf-8?B?cjdCRCtDVjc4RGxmQ2JZRHE2bWxreHB2QUxKWFZURVhJOG9ncGtuS1Rsdmo5?=
 =?utf-8?B?dmxDRkpucXl1aXhrLzZ3MW1WNHM3VkluNlAxZUFaLytvMWhwWURxNjBHcDVq?=
 =?utf-8?B?TzRGNFM3OVZnbEN3Q0xXaGVWeitKUElBTlp6TnhyanhHR1pQT1lBVkhDbGdI?=
 =?utf-8?B?b3JoNzB0SWtpOXp4Q0ZtU3JPNnJqdXdiVitUYnp5bk9zM05ZUjg4YjBaVjNl?=
 =?utf-8?B?cUkwbllmVkIzQ0dTZ3dKb2pBcGI5aTZJS0VQOW5rOFU4bGU5Und0bVRrcVBa?=
 =?utf-8?B?N0FBUWVLUmgzU01XRFpVMXlFUmZkeURLVG1WeUZxNlJDeUpXUmtnWlRHUVF5?=
 =?utf-8?B?WVNIUHMxTDBQYjVVRXk3am1mSnlqWDVRN1RrOFBRbDRFdUM1VU5MUlhXTlEr?=
 =?utf-8?B?dGxFa296eEFaY2pldDhLbFVTbW5lNnR0R0Y2cU1rR3NDWUZ6SDFldWR3QkNV?=
 =?utf-8?B?UmFBWEhIQ0ZQT2IwcGZHNmUrRGNodU9yakdCUkxaUlEvT1VpSjV0eE5RdFVK?=
 =?utf-8?B?aVNRNEZoY2l2dGJxaXhIbDZoS25HV0pOZ24rN2RuUVl0UC9tSG12ZkZ6L1F4?=
 =?utf-8?B?bUlnUFhDYUNqQTBTRG1zNG8wOXVRZmxHQUFkN0JxcVZNd0F5RXp3Z3lWeE9G?=
 =?utf-8?B?QStQcUxOMXg1NWdoK3NpdFE2K1RGQXRmOGpQRCtJeEQyUVgrSEphREE3YkNB?=
 =?utf-8?B?ZnlOSlRndFNKWHFwOHFoYmxBaFVtNWxTZU9wREtkcDhuc3AreGV0S1pGRU1F?=
 =?utf-8?B?T1dMckFjR09IRFFxODFLV0JtbFVlTWYrTE9aUkRnRzd3YVJLbXRDVVpVdzdz?=
 =?utf-8?B?S3RNQVl1cTg0T0NCUXAzUXpFMFoyQ1NzMEgwdDFmaVZQekNwYWhMTk1jd05l?=
 =?utf-8?B?eVhINndnY1JUMHk4RWR2ZmIraXFGeEVSZDdQYUY3eWhwdjZqVi9DQ0tnT0ph?=
 =?utf-8?B?Z3QrS0lkNnBxTFhDOFA3dkhGd2dzR0ZtLzZBeTRza3lmdXlONXJWck5DczVG?=
 =?utf-8?B?SHd3NURWT3VuY3lRNzZ2b0NNOEtldUx1ekk0MVUwZmJlRHZOU1JpRC9BQkRt?=
 =?utf-8?B?VFc5TStudVUxQzBWcEFhL1N6QjExT2J1UWFVTHVubGtwbGdYQ3ZjWUwzWTlz?=
 =?utf-8?B?T2lGc0NKcTAybFdHZjlHSlRLakM0eDM5eWFzUWx0Z2s3aXgrZnErYVJhU2FD?=
 =?utf-8?B?SmxLOFkwYXVDQ3pVSi9PY1hmZUNpNTl2bU1XWnhLUTFMMVRrbGx2ZERvcE9H?=
 =?utf-8?B?TEFsWCtPSXVKcHlJT3JkUUhXdDllN3FzRlJlNVhOYys5c1NTSVV0c0Y1Qkh3?=
 =?utf-8?B?UXZRSjlSZjlMclJzeEdFQWNEek5FNzFaSDd1TEdtdlhHd0V2WmloMmhnTGZZ?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a337c129-557b-4873-93a9-08de33080cac
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:38:00.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgtdJWGxtbQzRtyIIws1VmLVtB3AOj352fj0rwJtU5m15UvXbrTfkKjKAPC8k/Ggp2++e4VqaHQLDgD6Ige5UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

On 12/3/25 12:53 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>> +        )?;
>> +        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
> 
> While you're at it, can you fix this print string?  It should be "MBOX1: {:#x}"

Yes, will do.

thanks,
-- 
John Hubbard


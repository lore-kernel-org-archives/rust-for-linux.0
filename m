Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA839658B;
	Wed, 25 Mar 2026 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474479; cv=fail; b=f84+zVcYqhIfTAuDQ3b0WfHDGBhsFhiZB/6LcFF9eyXhpOVtsgcK/06308mE9btasPrNkT5A92Dmwh60/oXvP3ZWqFZoV+0HT6OpTULIq1k4m2bFHveN6wqdFFwpQy9HnpMbHBzSk1VAlhGbKE9DgAD0ECbF8+6MM7Y+VTAiui4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474479; c=relaxed/simple;
	bh=6lx+euFJTazBU5scNYobVLvk1EJobHjYB7KoeGJRl7s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XFUpSqTr5zzXcTiwfOOGyRe5zxA8qXgeyRWGT4wV1U/mR8IDoGG1l0bndv0cykoh4sw5T25+E0D6l/jC8uYjOy2rSvvrJTEu4KdM/HB7Jw5vqy6L4I9/jB66VqSucvC722zLEf7lXyb6tJGZT4HN+3Pq3CBHF8EJMOMuh5dVBOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tTUsOIzU; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tTUsOIzU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxWeVrNI4NkhM46ko/MOIizRyMe6XihSI1sD0mzJhMDYDh3AVXMT7Te/8fvRoT09p77PxamTIO7PXHVaHPMABu3a51p3+CucsNukR2252C+9w6p8AFfRligXhmTl17MjQfEoVUQy71yt0wZWulANyLBA4EtwktOISTj2QVgnVumCJjlcegO1E7nYZ0/ClDe2tNZ+84CAnSnnYbmFniP80hvxSaVRL69PRnoqGjuqPp56xqrMgAGhgO6Tqc6zkCbyDEsnrCsXWUtLhQ4A/f4LqzBXBJa0BDPvFRywOEZX2BVQdblHkbX8ehFrhGdcCya/GksOprh/JLqHQUHbH0epXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyx3rSwsIy8KnCCyorf4VtHXNYwuE0YyRDFii4vQpCM=;
 b=B7DZVfa8VtPcgabmVHP0E8Rv2BuuRKoHWG0ENK8JqIPB6zoDqqwyhVRyfNzXbWIwHsOCqIyF1cPC8Xpe2DoYjQL/KkaXxFVwvsLtxclZyEu6KGDCs84Drm0WwJbtLZ5A1u+QKsQXsTYEUDIFBkl2ooIAfIj1xXsXpTJ19JTW3uMu7lOe5N6MgCBWVgzUcyRXF9FfyuwwzJ6wv36CIezU3iSH9IkgUWWIYWvdrtbBqmAF8roQg6g8BVSjni8aVjgGd67uXYxxlLkLJ0zpc0IX+FqA6GUr1BeACkLmTlGSdOnJZqJwmdippxFjGDAQLkFtTdj4tcX3uxmURfwwF8WVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyx3rSwsIy8KnCCyorf4VtHXNYwuE0YyRDFii4vQpCM=;
 b=tTUsOIzUqwOsZQTcdUc6M9xO7/QC5NE+p77JFjCyxI4BopsO0Gp4LEJV9DX718j7wmlwYQ5TiC2w/bsV8YnG8ImRijQkeJnXRTkyJe5ME3T2q5vZOlk+kgVQM+ojdqZ7W3O1m7C/1SNoOf/20eEtErzI03Y/S0s+uLOijUPc7V8iLtr0KiNRWIEe14iHb6mPkIwJmoz7zPkHxXF+yGCh41ccLsDFyHj+779xQVpvsXnH0e1D+u9tRTvJhfUFjgctT20sTiJfPJdAWjjHXSJExsa8qcc7cVZf500fNOVPl/0WztswlIG1ScKzLR3OIs5ooAvMCf9YRfmCzF7MaF14hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 21:34:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 21:34:34 +0000
Message-ID: <7ce602c9-f1cb-4226-b462-fd681db1bfed@nvidia.com>
Date: Wed, 25 Mar 2026 14:34:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/31] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-2-jhubbard@nvidia.com>
 <DHBZ30B3HVTR.1VYA64MM8C4JO@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHBZ30B3HVTR.1VYA64MM8C4JO@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f13b74-8bc3-4410-7175-08de8ab64e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yS+noiXIkHlLkVEc3C1ev4wz8yvXd+zZOQbqtFoUT4oI9elZfBbV12RfZ0gstTbZxIh/sB3PGcjdFl/IkUVo2WFphC5VmI49JbyDtHcciUUbd6SN/+OhtO3hzUgEzuIdoj8wXHqSUSra84spyN1LmxPwkyYmg8lmlsGxpJVnoXl7d0fssbn0cyQiRbw4zZv3JZdW8SSS5WlIdjzqFAIoTryqIufF5+iE03Tbn0gTw49fElgZETmUdFGwxnBNJ//apnuYlSywKmYbaR6WVtlnYb8FrxqpCInLQKPHBI5EGfjQx9KPQa7joBPFWvNPKbJkzEl5noKd3GwlvqvhP1/6mIBJMmf3VIogOB/6poCADS6hC/T39z9UiJD+bbD1MWOZrNiggF/Yhp1OCI84IiNRlsKG2Ey/7cxJjAVPLzte0ZD3PNy3hlz8oJfuizZ3SreWLkVlFl6PInVMQivOIqpO7ygQf8U2CCV5RDYDdYX8sqgWL53A+qQ3bgZAcm1d64aAFXqlU1Jrb+VdBWZspMeL+glfBBo5QBUDM1Ey/xFOf9Z7PbN6Nyv3Dn5xbZagNbQTo3fAqjoyAMj2My6Fq2fU0Ox4kUkV1WoStLq/yEiIr2B+0pkvD47PXWuNEIzH9mIF6nCEe9rzOjg9kKrIWcdBx7SF5YagGm9tDmIejnjyYFaHX4EpdoSQ4f16ZasAbeJWEZxxU52MqgLX73sy+bgDoIRXtsYlp2MI+dZFIPgdMOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elN2TXFVZjFwMzdlbkl4MFlqZDVpWTBQbTJnU3hMcEFHdmtQb3NMTUpHOEMy?=
 =?utf-8?B?OVVGRy9uNHNDSVZwTllTZTQzbW5qNTJqZ2VUSll6NkpLRjNKeU90em9UcmpF?=
 =?utf-8?B?LzNsMllvMFFHY0JEa3FXNjg3UjByaUdwbG5kZG9TbmFNTE5EVE9tY2dyL1dS?=
 =?utf-8?B?ZVdkYWtPZWw4Y0dZcCtkNktsR1EwazdnZFRnQzUyZnJDODArSG0vNE8zcmNl?=
 =?utf-8?B?SDBBM0xPOVlwSEtyMUVkNk1CbWFzN25QU1RYclRnQVBaUnZpZ3VlRExVQW03?=
 =?utf-8?B?TFFEaFFVRHBIZTFtSlNGV01kQlhrZ3c1WERpQTVEYjErbEw5MzVaV2pveU11?=
 =?utf-8?B?TE5pZlFoWmp1NFVNOUpHcTZaMFdQZllESFRSMU4xSWpJYk45K2JaSno0Q3pF?=
 =?utf-8?B?amJCS002ZVFpVmtGNC9JNlBjMklEMnUyQ01lN1NlTGZRRXFlcmJycVcrMnVT?=
 =?utf-8?B?VXlObTd6dlRWMzFwK1Ewb092V09LVTdvdGYyYURQbFNYU0gwcWkxNTd2RUJE?=
 =?utf-8?B?cmk4YWkxbEsvUUNYYnFCZUN4TndpU2duWlVhclV2QktNUkV2dmZidWFyQjBI?=
 =?utf-8?B?ZmxUN0lhcy9SeEZwNEhGYUpDUjd6ZkdIemxHWjA3ckFTMkI4bS9aanFRa3Bl?=
 =?utf-8?B?SkY3QnBOSzk2cmQwOC9PL2ZLKzNvVjlISzNBZEdsU1FKUDk1VnYrQ0xJa25n?=
 =?utf-8?B?US9hODArRnhiZncrMVQ4QWxNMVJEZTZ0djN6dmUrT2RjV0FTeHhnc3M0cjE4?=
 =?utf-8?B?UklQdmxtKzI0dlhDeGxnRFVtT0tuMWZFOHcyRnovWGgxaXFOcFRRZzBXYjZF?=
 =?utf-8?B?SVVFWWJQVWY0MkZzVys5c0lxdFZzWnRjMmc1YndTTkg0UENwSG8vM213eFpC?=
 =?utf-8?B?eEFsR1dFWWtVMHJEV0ZQZW82OStMVnFHZ3E1RjlpV25WRmhqYWN2dEJuNjFF?=
 =?utf-8?B?aDhOdmdQRi9MRWJqOG8raGhubXg0SVh1ajJEWkNLNTdCZEt3T29raWQzams4?=
 =?utf-8?B?c2NMd291Sm05UXkrSWIvY0IxczlKa0pJekhSS0dkMGJ0UUtVWnNmUlpnaWZx?=
 =?utf-8?B?aldNNU1rR1Z3cGFRQzBnZk1RYyt2SHdzb2hWWUQ4clpFNGxEUDdPTWhWRGJT?=
 =?utf-8?B?em1BcEQzTnYyQzJVTjcycVZIYXlHREx5VWE3dmpnaHoyd05GWEtBU2MxRjJX?=
 =?utf-8?B?dFVkbndlbkhkS0lBVmRkeVB2R3pjWXdmeHd5b1BSMVQ3bWo3K0VWOGkzK3Bv?=
 =?utf-8?B?NEtBaGU5dlhoQlc0N0VTazk2djd4NHV3ZnY0d3Rpbk1hb3FDb05aR3BVWHZz?=
 =?utf-8?B?MWMrK1pTUlJMc1FpT3c0dlVJMVlVTi9zQUNtU0l6UjVwL1RhTzNyS1FJWWV6?=
 =?utf-8?B?Ykk4SW8vUnl1YjVnWFVzOWZNUFpocExTY3FIL1kwQmZJa2UrcXEyRHREVEE0?=
 =?utf-8?B?VjNwNHdEeVYzZ3B0N2hQdWdZYTMxZEhveXFFN3NOWXF3TXd6QXRJQVZDd2la?=
 =?utf-8?B?UDJaVlZPREZyd1NTNkNVd1JrNXZyUHhOckp0VndiMVpRcStkcDd3TGd3ditM?=
 =?utf-8?B?ZmxzZFJNYTlWT0NCMGVjUmpzeGtmR0VaRThiRWpoYWhTQTJQWkRGNXdlZVox?=
 =?utf-8?B?ZlVYZXN6dDlZZ3lUT25JWnExQStQWlI5a2ovK3FJcHVpZFdmME9NZDNrNUhT?=
 =?utf-8?B?UjNoQVJqYjd1dVEraXV3cEY5WkluQUtXNGZsQzBKVll0cXV1UmxWZERMaEpl?=
 =?utf-8?B?N0hLc0d1NFFwRVRsY3FlVlBoVEZIa1NPUDlOOUh6citKSDFUaWhSQzBsTFFP?=
 =?utf-8?B?aXB5b2NxVTZhdlFvS0dFbmRuZm9TZVRWKzdqOWtiZXo3Nkw2dG1JV0l3TVpa?=
 =?utf-8?B?MUsyQUZQUVMwaFp3REhlNnFMaGE4M2FLK2dKaHZlem5CTWlpMklmN090ODhG?=
 =?utf-8?B?RUtwYzJWNDY2eGZINlBQWGpGZU9qY3VibEd5WHVZZHl4Zk9hMEhwN0xkeHcr?=
 =?utf-8?B?SlBXZ09wS2tlS2NLQ1dPWGZvSU1zWTZ2STVVTjVtSzRlKzV5VHNhQU05RGI1?=
 =?utf-8?B?TVpkelg4SFYzaUFpdDJyVC93MzY5SVkwTUxnRHYrTUFxV05hWFAyMXBhUm5I?=
 =?utf-8?B?TnRKQ2gzdnFKNlhrNW1KdGJzL2taS2dxZmorcU9DSVg4aGtMblhoTnFjTVlj?=
 =?utf-8?B?Vlp0TGRuOTNGRzdrUEI1Z25nNlR4QkxuWDNxRzE3NWhoTitQQWo4N3JXcXFG?=
 =?utf-8?B?cUxLcEt2OUMyTnIxemlGNVFaOFJZbmlJTEhNNDFiOHEveWJWSkh6UlhEN09C?=
 =?utf-8?B?L3N4M2tnZWFwOUJKekgyRWxyYVNSRzNtOWdjTFRSTGFlN0s4Z1QzQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f13b74-8bc3-4410-7175-08de8ab64e84
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:34:34.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSwMBGFdKEX1z6Hl8D2GaJleXXgBt28GfQCNh+PWkNJuczfBjLwoP2uFdipvO72fnY4Wx9dpxdC2BYbPHQEj2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779

On 3/25/26 8:36 AM, Gary Guo wrote:
> On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
...
>> +    // Blackwell
>> +    GB100 = 0x1a0,
>> +    GB102 = 0x1a2,
>> +    GB202 = 0x1b2,
>> +    GB203 = 0x1b3,
>> +    GB205 = 0x1b5,
>> +    GB206 = 0x1b6,
>> +    GB207 = 0x1b7,
> 
> Sashiko asks if it'll be problematic that 0x1a and 0x1b are both Blackwell.
> https://sashiko.dev/#/patchset/20260325035242.368661-1-jhubbard%40nvidia.com
> 
> Can you confirm that it is indeed actually okay and is a false positive?
> 

Hi Gary,

Sashiko is correct, good catch. GB10x and GB20x have distinct hardware
architecture bytes (0x1a and 0x1b respectively), but I only had a single
Architecture::Blackwell = 0x1b. That means GB100 and GB102 would fail
probe with ENODEV.

I'm splitting it into Architecture::BlackwellGB10x = 0x1a and
Architecture::BlackwellGB20x = 0x1b, which also lines up with how
Open RM (ARCHITECTURE_GB100 / ARCHITECTURE_GB200) and Nouveau
(GB10x / GB20x) handle it. Will be fixed in v9.


Thanks,
John

thanks,
-- 
John Hubbard


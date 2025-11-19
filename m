Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BA31A055
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 07:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536650; cv=fail; b=RYpXSU551OnyKngkfj36WJ0Ic1/YGdtFK7e9YYKlZSLI/rpGj6SjNJ7UXGPQ8CqXr1whDemvz2GUoc6+z9QXLs6/EGaSW7QDtDp8H/Bl5xCWLQBiMxHq0hE5dNZ+OfOEXxkt/Zi/afGpuSKGw46QbAq9VOyF/fKdwfhCj2gE0Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536650; c=relaxed/simple;
	bh=O4zdKF112ZUh7O/4pJcl7jxf4SI1xWspLyyYVr6fFlI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UWGkPetkMQzF62S9TG7R7Zo2hjQbe0hYuXVF/eqxuNbQfZ+fZI6Zl02tpXbTyRXOvEUhVmxgLDVeci0m3G30OaWUY9TsA8j1UFNTqAfhg9OjP5chOxvB5yxMdCvJW5jD+KZUWBNVXNRjdZLUQ77u3KYTSMoQSHaGeFYQpv/0gBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PTq7enMA; arc=fail smtp.client-ip=40.93.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PTq7enMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhDEDIJe3j9DlWSz4BPCJlMMQUJXope6hfaN1ucft7SuTmB6QLM8QLyq03DASIUH/n5Mm+7rh1hcqay2rhEU9J6a4tC9sc2l3vwjPdwJBncKGVES9eqNns0Lx7LcuCXkPnOahmc/f/kGqX+9Ozxnt++dtFou/RZyidk1E2wKw+wHHUQI5Fk+BpfWqAxQijHXhpFHHQva/XQ63hModUW9CUalgcvncW+UVBqvsF9gKT1FrAmr+5AaQJlMbfI6lUDPyPMX7f9Db/TcGspIlhMKaCKOoHjirJvqgOBkJDgmRvbOX95pGyuyL5ql+0PNHe4Hmt+GPEMqHEsrp8vEKFH7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18vCZYg8CatLpb78r38PEWdMT5kMHTKqq2rPSdozjSA=;
 b=w+Wkr8A3qJ0btQVTBFQ4E2qA+QAeEKxI1sZajkWJsKGe1008JOpBDsf72iWfGstwK6wqjDLdXOm8Vv0ei+5fNKR2MbKQI1RW0pDQA0oraxvA0Jy2aTXY8PpLUMlDFYIzt1q1Ef1sKZLAAWdqjYIO0sHtGOP+IiNPBl0z1gsSFxoLRN9SPDgayhOovxqiOm79HWSVsOber8+LysfH0rxa7WqKZGiqx6kv1LbybulTcVnudWUZuMVNDf4q60ra8LWCMvAYlYAXxp6GF+3SI2YEeWlBN0cuo9Qp4aa176FsTOd8trEhAOKlhnyg34nyEtLRpEGb1WZ89hKfdSmSmHDxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18vCZYg8CatLpb78r38PEWdMT5kMHTKqq2rPSdozjSA=;
 b=PTq7enMAmEK38gteBEbChQh/rpgUEf83okM+nKp/HNQV/QLlTB2/ZqMvc5xuN6gNtVS3P7M0K7J3psXExWCU9m+Q4qih43c03QMNfFtHu5B05dhD9e8RCoq9oMNJNZU8rtcsPx444z22k/yaxaW5aTArsx23MgCa+U4WUdaD4B7BDwmHQg7kmj7DxRUyokcchPZGA9xgFp0E7WQJlyogafIvOinyTzA2fXizKAHJmpcvr9UyrJxbZAPULhQfhtJOAsqC+TnqmhkXZ96habMlAMLqylIXny58Wt0w0Sj67+pFGvsq3Hx2SLXCUXIN6EESuK1jBUPZDOsx3xq8vTKc/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW6PR12MB7070.namprd12.prod.outlook.com (2603:10b6:303:238::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 07:17:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:17:25 +0000
Message-ID: <0f11194b-edb4-4206-9a6c-b7ada3cba3e8@nvidia.com>
Date: Tue, 18 Nov 2025 23:17:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-5-ttabi@nvidia.com>
 <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
 <DECHG7EBKJM1.104GLFJIRJ0MR@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECHG7EBKJM1.104GLFJIRJ0MR@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW6PR12MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 670ed173-a678-486f-99ef-08de273bb047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3ZPeFN5ckZKeHJrdUlPeCt3ZFhwTkR5QXZXUHB1Z2grRUxoZVVEUFlhNDIx?=
 =?utf-8?B?L0d3M2o5VHhXQjdrMHZLM0JJT2xkalZMbFIvYUdPTGlkY2tIUFpoTktDNWhT?=
 =?utf-8?B?NTJQMmQ2L2ZwMytGMHlJVis5NU1kSlR6QmIrcU0rRktnYkJDM1Q4UGVnVEVa?=
 =?utf-8?B?WTlCTmdiR2tYTUt6QlZYMlVxTkdaclRIVS9LcXVnNld1Tll0WVE0c0x2Tmlv?=
 =?utf-8?B?NW5La2ttMTlhVXlQTFJVcXd6ZDZpQ0RIaGVycGZZaG84QmZvMWcwNUdvMU9W?=
 =?utf-8?B?ME1LZGJhbGdvdUZYaEsxR0oyRlNaU2hRa1k1VXIyOE12cXlqNzhLT0o3SXZs?=
 =?utf-8?B?QkNDT1ZhNzdpUndqNVV6Unh2OUI1THhGUDVCYkkxQmJ1cmg5M0pnNHlqOXFK?=
 =?utf-8?B?YXRnZGJNTERkRHFrWHQ1ejBDVllLbUxHdmtIK2hycmVRS3RRTkQ1R0treG5O?=
 =?utf-8?B?UlE5akJiakhIbHhBQm9wQlJjWlcrNlBzTkVqdisrcGNPTTFpWHYvNnkxd0Vs?=
 =?utf-8?B?SW1qMEgwcVdsUGRTZTgwWDVreWlITDZKZi82SWJENnk2RHdFWlcvck5qMFVz?=
 =?utf-8?B?RnBMTkhkTVpTZFFKR1p2Q1A4MHgyRTIxUTJ5eG1raERvcnJDODF6Y1ZPRmNC?=
 =?utf-8?B?Z00zTjZNamI0U0pjZGtHMTd5d2d2VUNzc2lMS3B4cnpYNUIreUVzMG9sWG9F?=
 =?utf-8?B?aXNhZnhwZnZkYkVvSjBZdnFDU0Q2OUtmTUEwdG8zN2JEazU2OUZQTDJYNmpY?=
 =?utf-8?B?MTBidStJT1R2aWMvSCs5Q0Y2NGFUWGhUZlp1VDZ4aHkwRkJDWnRJVURMWk1Z?=
 =?utf-8?B?YnpzN0JKZmt3NEh5STYrQ25XNzd1ZHZRdHlla0w2ZUF6dW5TOHJ2OGFRK1Jm?=
 =?utf-8?B?ZlNqNjFwRG13L1FKdmd5L0ZyZE5WcXllS1o4MDF6UnJLY1hpM3B3TEc2cHVF?=
 =?utf-8?B?bTlvSWYyVWIxWlQrN3d4bWJHV3RSVCtJTjBDN0ZTbTR2TkhlREtBMWhRNnE0?=
 =?utf-8?B?NW5LQWR5bmxSZGFacFdQZUpBdWd5aTZnMFhpOHlVTm9rVTZBMVlLL0lUKzM1?=
 =?utf-8?B?QWl6ekF4Rzc0NFpCS0VzYWg0ejlnNW1LUEsyZ3RxdWU3WGFpUjVwUkJvbjE3?=
 =?utf-8?B?WUtkSUZJbTUvd0cxWWQ2ZFN0TjFvYnNJQmRzdm9qeERvWHZlUW9IaTIvVHd0?=
 =?utf-8?B?eXY1NWdpK20xSWJ2WUxuVERLU1lnNU9WbWdwZG5yMS9VT2ExcWNGd1R1UldG?=
 =?utf-8?B?dnVObk1TUGtiMUdsNHVKcjhYTm11T1pWRkhGUUNaeUFGY1JkVmRDNzl0VXc2?=
 =?utf-8?B?VG82aDhwVktNQklGK2FoYzh3aGlidjNwUEVBL1FtdTgvV2Q3dk1NUmNtNXBX?=
 =?utf-8?B?Q1JuaXVMQTM5dDhzVStEdDB0N0oxbGNVT3RVYzlMYjVYaTVwczRXU0xpeVlH?=
 =?utf-8?B?eldzTnJtTGJyNm10dUpLWE5vM0xEYitVbmlSbUZlc05FVWVqZTRhdE1pR0Nh?=
 =?utf-8?B?amxVb3RjM1Bvb2c5ci84NW42RDZCOTAvbUFud3l5TGlJbkplTmZxRGxNRm10?=
 =?utf-8?B?elhidUxPMWJzVm9JRkJKN1ZiSmxSdmc3Nk5rQlF2U0NUQmRudWwybGVacFUz?=
 =?utf-8?B?RXlvNmpJc0pmTVRka0JWWGc0d01wbzNTL2lGZThmYTdadzlGZlZPUUtmaG8w?=
 =?utf-8?B?RFdNV3BUdnZTWmpxNTh3aDVCaFRaQXpYNnJ6c1c3amNHRTRva2dtQ25qNThM?=
 =?utf-8?B?UlBQRytVdXk0WCt2bkQvV1ZMRHNBUURIK3ZjTWpGZnUxelpHTGUrZjVxTk9K?=
 =?utf-8?B?ZHp0ek5GTmJxcFRGT3BRMlNDVUcwbmpsMlhBMWZ1a0lObEZ5aVRuY3Y1dDMz?=
 =?utf-8?B?bXdJOUZNdURPWDJub3JuNW9kZWhHdDA4L053dW02blNHT01QTkNxV3Mzc05W?=
 =?utf-8?Q?CBhX9wYoOwvsWtnNuEMwWo/Asevt+R+k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0VEZE1YNWtndEhPRS9iTG5UdTR4RDB5cUVNb1psSFYwTVVZR3hiSjFWS0tt?=
 =?utf-8?B?VEQ5dHp5NUJ6TThka0R1VjBxc1ZGR2EvSU1ZOUhINDQ2M1NBaTlEQjZFeUli?=
 =?utf-8?B?UE9xbDROUnl3ZGVWSnVobEFlUE9EV0YrL29sL0ZaUlpQMmNwcVUrMVdZNVZO?=
 =?utf-8?B?QzB4MEdhcXhCL3JQQjlqZ01PN1pJVEJZVDA0NnFXZWFJK3VpNE9UMHhQVVg2?=
 =?utf-8?B?TmFlYnVLcnRBMFFCOG9BWXFHN3lVNXQrRGh0cGxTZWxIaUdqYllaSXVVVExo?=
 =?utf-8?B?V0Y4ejFrZllGeHpaR2VEVkpkVmU3eHMyY2Mydzg1V2hVYUlCVTV4bTBDZFg2?=
 =?utf-8?B?aXF0TVU1cWM1L2k1OUdvcnFCS0tpOVlDTmNHYVpnMEZWSWx3R2oxd2NSMUpr?=
 =?utf-8?B?dFZwOXpNZjAxQzBDZ2tsWXNKL2M2S0lOZ1diM3hySTI1dzBEcmhEMGEyekIw?=
 =?utf-8?B?ZTl4NmtSZHlKbUJtbkVQUFBKRnhyU0VaN1dKTFAzNXVlODN5a0hpanN3aVlC?=
 =?utf-8?B?ZHlJRmlCTGNuYWZpMXlpVVE3UjcyZE1aRGttRmNIYnVqR3lmNDRUcWZEV2RX?=
 =?utf-8?B?Wm5LRFE3RlRSL3N3b1Q2U3YzYmFhTzYvM0pUTjZ4UjYyWngrUElQLzRYdnJ0?=
 =?utf-8?B?ZlpzUTQ1SmNIY1FYUUlhNVdQdW9KeE43SjhidkVwRlZ0ZFRmeUg3UmlteHBn?=
 =?utf-8?B?L2FoNFJRam1zNnNsQzBjYlE3OG5LK1RKT0JzUXp4RE5SakpleU9hTVZ2TnpK?=
 =?utf-8?B?bzg1bzU0MUhqM3NBcTZKei94bE5GeUlqNzR2bnZVNTcvQXNVZEJ4Y0l0REdp?=
 =?utf-8?B?TXREU2xpTEIxYlE4RjUyZFBiUGU1cUs5bWxTWmMyTEFGOUNVYVFFK2lhakFi?=
 =?utf-8?B?SHVLVjY4ZW5PV05MSDM0d1lmTnFERi9rNzJ2dlU0a3dqRHhQV2NGUlJYM0dx?=
 =?utf-8?B?RC9EUXBRZDFhYWRxaEdnOFBpbjI0WGJJMUNvYXpXcXlnZlVjZkN3aTNPS3du?=
 =?utf-8?B?UCt5bkc4YXVZTy83UFZqV1h1azFORCtHMTAxWDlVMjhqN3FGb0ZndkhJejR6?=
 =?utf-8?B?RGx0a1FueUlhVlZNcS9JSzFCaXN1NWJZb294VEVhVVhkVDJhZU5nY2lWR2FT?=
 =?utf-8?B?Lyt1UXpPZHU5c1NxNlloQk93aWR2V3JUc1RBUXBxRW5YSlJXampZKzhSUm51?=
 =?utf-8?B?djFYYzhSZE1JSEREd2FVQUlkbnphMlhKM2ZRTkJ6dDFPUEZzejVLU3l3Z3g5?=
 =?utf-8?B?STM3TEJZZGVJU1dkMGRiRXJzajRIY1EwZjNJWTZPUm9xcWhZUGhJRHROL2Jt?=
 =?utf-8?B?UEUxemVXTmxOUEdvOVJvMm41K051WnB5WjlXR3kyOHFId29aeU1TYkVWL0ZP?=
 =?utf-8?B?c3VpZm1ZUlY4cDdZZ2ZaOEhBSENJMy9iN2YzWHVNSXNNcWVOTWRTb0YwdWFi?=
 =?utf-8?B?T3JmWE5JVEl1QUZWYytnMzU5NGgrcWxlN0crUnAxcmhVYkxZajNIU0VycWxR?=
 =?utf-8?B?VFpvRXczeEIzVnZaWnN4R0pZN09QU1J6L0F4K3hKcnlKOTU3b2FlYTA4YU5U?=
 =?utf-8?B?VUJjM093ODhKYlN3L1VMWTgrQ3MxakNUNEtBREhWcnF5TzlJbXYvQjRUeDBU?=
 =?utf-8?B?cnJrL3BmNmV1aU0xeksyZHp6Z2dmbWF3MytONFdyUk1RLzJrM0tTMFVQZit3?=
 =?utf-8?B?VHpDRit5Mnk3Z3lHS0hiSnFiTjNCTko4UkFRcUlQWUZiMXFtOWxhaG9QdmJO?=
 =?utf-8?B?Y3phMWt1UEtJWDdTdEN4SWgraDNWSk9yWDAzUDhDbktBcUI1bjFZK21HRit2?=
 =?utf-8?B?a2dkN1lMOHd3aWxnK0k0Z3A2YzVPT0JWNE94SldYeldPRHVXelNzTFFaQjQ3?=
 =?utf-8?B?bzlGeU5MZExEdytQTmtkbFMwd0xOYmtKbkZ5SmJOY0VhbHQ1eXNBTCtLWm5G?=
 =?utf-8?B?Smhma1NSSmxMaks1dmhKRDdtckc1Y3ljS3hqQnpkZEZWYTZpbHphUmJYNUw2?=
 =?utf-8?B?MEtRTTBvcDhyVzgvTVJYQzBCOW5Za0FkT2FQUEplK2RDemF3YWlvdkFQWTQz?=
 =?utf-8?B?YS9CQ3ZhOXFMK0w0dEhaZWZNeVZBQkdYRXhtTUxlaStJeFM2MTc3NkIrZXVJ?=
 =?utf-8?B?TkV6cEVEU3dwVWxvczdiYkpYQm5yNGh4U01qaG5CZklGTGVPakRmSHduY1R1?=
 =?utf-8?Q?OXZy9v5NUKo+1AUgQP0kWBE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670ed173-a678-486f-99ef-08de273bb047
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:17:24.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KkfQs+AlggIetNAAZpGcX0oI71IxFUxqlSy8jqdXBbFFpAhRXy5VI19gNYGUPK62E9fyvuoQrkEOmm/4Zw7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7070

On 11/18/25 11:11 PM, Alexandre Courbot wrote:
> On Wed Nov 19, 2025 at 11:59 AM JST, Alexandre Courbot wrote:
>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
...
>>>           let sigs_section = match chipset.arch() {
>>> -            Architecture::Ampere => ".fwsignature_ga10x",
>>> +            Architecture::Turing | Architecture::Ampere =>
>>> +                if chipset > Chipset::GA100 {
>>> +                    ".fwsignature_ga10x"
>>> +                } else {
>>> +                    // GA100 uses the same firmware as Turing
>>> +                    ".fwsignature_tu10x"
>>> +                },
>>
>> Following up the point I raised on patch 3, this could be another site
>> where we use a potential `Chipset::has_bootloader_thing` or any more
>> fittingly named method.
> 
> Ah right, that's unrelated. In this case can we just express the
> exception as follows:
> 
>      let sigs_section = match chipset.arch() {
>          Architecture::Turing => ".fwsignature_tu10x",
>          // GA100 uses the same firmware name as Turing
>          Architecture::Ampere if chipset > Chipset::GA100 => ".fwsignature_tu10x",

I think that should be:

         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",

...unless I'm more confused than usual? :)

>          Architecture::Ampere => ".fwsignature_ga10x",
>          Architecture::Ada => ".fwsignature_ad10x",
>      };
> 
> It treats GA100 as an exception instead of complicating the match for
> both Turing and Ampere.


thanks,
-- 
John Hubbard


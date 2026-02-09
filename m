Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96E3C1F;
	Mon,  9 Feb 2026 02:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770602790; cv=fail; b=IWHG1Ajd13v6Syopa/beU+hGJJPTkI3/6X/KfsP/qdKOIwKgfC6UmSsrlGrHbfTSQHPUUsps36yZ4oQic5b0MYKdgUEOa9O/JuHoWOrZwiNktR/Yj2ZKQUx9rWxK5PkiiXzq50MSLhqWBwm/zA0f/pFvXZNC/8FxYlUWa6MM0V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770602790; c=relaxed/simple;
	bh=alYK5XazQ+DlH8p2A5iRDT6uiMzdoYDXBLrukdC9TfE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jmf7DNZaszsBqY5y+rptk+amILkmwQzmgkCObTZdbEepZV/sBaQ7q37W8p+Wu2M7SmqLuFknU0EC8NvmwkhyiRXq62k1ISGWDIIvYOQmf0GeuNSpt4PwixQJgXbc8SBfmiPS1sASuNQhr3d82u/51YNfmTLODnsvGpaItZi/5vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r1FI5zDF; arc=fail smtp.client-ip=40.93.198.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r1FI5zDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nflaOXFV0LwHiazuhe0upSwgyr5jaQrNMH6MM9HNryIN/98JmS5JGgEzcNaEe8ukfDBL5UzWDI6Ac8yPfH+Lh2i1vT38d6+5bRm4Z9osBruln0f2iossKOSLmX988r5+Z0cfY3O/5rhRz/vFThIEtO90pO8Ve282NdpuCC70R1IfP4MjXzhpaOfdZ7S+cRuJ/ra49mg+P/iCnbStbGRSHikXWOfPoDb12cV5lYDxf6+MrjJfYhvQmZUXUsSSms4/fbM1fH2XUF2gaO1yprInGnWo3mNPD0qTAAHNMZNqng6b/tKIu7nl4UT1ZVCw3AiqQD+G+BgwA23QyykLXwxYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pP0Q4KSZN1yn3Jpc8QL37GXMwVknmkT5/K+KTBfxjI=;
 b=t0L0FZoE9YKc2Qb5pR2kiL3rYHP3pV1AapLtJ+xpt68RIjWWP87/oRcV14zdgWRcJ0LoKwlR5J+L0hbnyrebMlkvTB1uyQT5N28fX8pACGW1qdIRi2Te4U8DaPmTRx4wwpm0S91y4Lg2IKhYd9j/MID54BmOM6nbeT28kSGjKxndxqrQClPuU817q1HU4gFTkapHXhdMi3RCyZ4nyca3Qz4ATtA55NsJDDZAuAMaRVbMLqTCMoAtK/yzTz9Q4NS1rx+ObZEdjXldMU3UxyJ+ERqnWF737EWUPc5UR2OPuwtlVcUcMNyCFhWnunNWIxOLrqrQ40XQVeWYd2bXrIRJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pP0Q4KSZN1yn3Jpc8QL37GXMwVknmkT5/K+KTBfxjI=;
 b=r1FI5zDFt/gkVxVbyV8nXV7DfkcnRnjDqxED//fd/pVR01mmgRUVykTYL5uIzIHA3iFh7Cb4CQHzOCINaEcCb3XWZIfUoZjNH6/3SZWsaQvu9WO8K8EsmPQBdYip41LvtHQ/QbyoswPZPUajHdTq2n1x19obDq23kB8Pyg8wO+OCrQD4uZ3TPXZflk2mOURF1EWPY1EY0bi1Z7QnnzenaSbZAyO5E/PzORdvB6ZofAr2jmoSDIWzhmco8oSBCtPKGw/AylRC+TQ6slXJQnXTYHnA2ihTEP2HMGN/BTYOVKH/8LDakFdSiSbmM9XPrfYiZeGlJjbW70TGqAQCfWVQSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 02:06:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 02:06:25 +0000
Message-ID: <71e90bb8-b7de-48e7-a43a-68d1e73bbe6a@nvidia.com>
Date: Sun, 8 Feb 2026 18:05:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/30] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-26-jhubbard@nvidia.com>
 <6ae11f5dc8fb4058fd4f05ec7dafd493a6df5f22.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <6ae11f5dc8fb4058fd4f05ec7dafd493a6df5f22.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f84dba-d3fd-408b-2917-08de677fd44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlhyY2RaWDh1RUtVbEpvazhFMU5jZTR4aEI2WWtLV05ydzF3Q0pTU0hZcWtl?=
 =?utf-8?B?eGZvc3NVanBrRWg1dlVKTXd4S3o3S2g0ZUdrUE44U01POG9HbmJCSUU3RERh?=
 =?utf-8?B?aXpJU2VTd1Q2RWszY3E3RmRURVBMQTBmWGR4N1VTOTl4bUl5N0t4VXNOdlB5?=
 =?utf-8?B?a3A2QXpqMGdRRUJoYzhlSkdpMDRVU3BESEtrR3NIMUhVM2trUUJrRjgydDNj?=
 =?utf-8?B?NWhKSlBWRVUxVVJMVENQUzN1VXNvcE53Q3FtSk9taVB4ak95NURmNVdUakQ3?=
 =?utf-8?B?bXdLa1ZYVFV3T0NNMGhjVDcxOTdHRGtucGsyTmVveWorNWJLWkpUZkFwOFpa?=
 =?utf-8?B?RnFsZjBZMGJCVTZjQ28zc0dqYTRuOXVGRGF6VjlmakU1MVdUenE5UHZnMHlz?=
 =?utf-8?B?dW1EKzJlTDc3RytPeGdQMFh3VWxBZytOTXQrNklaZlVoL3FkbVp6NWh0Vm41?=
 =?utf-8?B?VDUrUnlaOVZxUTdtOUd3SVFiMkFKRXJramtQZEhZR1NMWG5NTEVzYTZsYmZP?=
 =?utf-8?B?T0tjbFhLWitya3EwREQ3MS93c0ZGZWRZRXB1cXlJdHFpMUxrbjgycmFWSFcx?=
 =?utf-8?B?QmVhbURkNi9UaWs4WVltQUZoUmNFNkJJNjdvYks1YS95RDE1VWh3YVBGWWt1?=
 =?utf-8?B?VmxOd3NPSG9qUjhQcDlqM2pYWWNhU0ZvaWtNMmI5ZkQ4cTA3M2QwQm9jcmNx?=
 =?utf-8?B?YkcyYnF5ZlZGWDF5THU3clNqWjI1WEVIMU4xY3NzajFPOTR1aTI5QWE4Mjd5?=
 =?utf-8?B?VHQyNEhmSUtFR3I4c0pvWGFnTkY5cGRJNmpYUW1OUFVFQ3VvelZObFlibDd6?=
 =?utf-8?B?SmV5TU5WNHBJeEpEc2dpNlZjR0lzVUNkd0JTUnZvMm5xVTN6VXp5R3VqSkJv?=
 =?utf-8?B?UDFGZzgvcHdVRGtuNzNPL1NpQTVzVzQ2MDZKektIVHVuQXR4clJ6TDZTQ29F?=
 =?utf-8?B?bEVybC9SQVJKKys1ME1adDVQNXJmL3dXWHkrbWRCWFpTdDF1YXUwOWdlcXlo?=
 =?utf-8?B?QTFRU21aSUFyL0x2eFNETmZCdGg3MVd4MzVxWDR5VnhWcXpaM3YvakZ6MWU4?=
 =?utf-8?B?UDdmMW9pampzVTFHLzEwT1NteE8wRWNPKzhlR0sxTXcyNWNiUzFyR3pZQ1V2?=
 =?utf-8?B?MmZZTE8rYVAvcVZYeSswZ0o5cUowQkRHck1FK0gxc0pXZDNNY3k3MVhXTGJB?=
 =?utf-8?B?ZmJnTngxTDV4UVEyUjJ0UDFJUHdjc2FON09iVDRQMmp2U1dDcURaUnhieHdy?=
 =?utf-8?B?M3Q2N2FYelZZdFpadlhadXNpVHU3YVduQUdtRW4xQjlSTlpPaEtSZGdXa29H?=
 =?utf-8?B?d1QwdS9aRms0RWpIcVJmWm45TUZLb0dkSGJGY21NOWljbC83U2YvRXJxczVM?=
 =?utf-8?B?bW56eXpkMW5jeVp2OXNiVlhjL21ySjcrT3R4RWl0dTlPcmsrb2MrN2ZUUE5E?=
 =?utf-8?B?T2JlU2xIY2Y2WFMwRjNxbnlSMTlCYU9XaTVhcy8xUVJXZklmeG1lWXJxNHVm?=
 =?utf-8?B?ejdUVndOcWNobklpUXF0akZFS1JJMTQyN0l4U1dOOXlsdlZXWDUxbWdhU2tO?=
 =?utf-8?B?TVpHU25tOFh4K1k0ZW5wYVk5Mjg4bktpV1dTZ1JzbytMKy9CQWFDUFZhWVNq?=
 =?utf-8?B?bzdTdGFyRjhMdmNUZU8zdXdUY3lXV2dPK2xqR1JZaS9GQllXL3gwTXVCQmtK?=
 =?utf-8?B?MWVERE1BRlBUeUpsY0Y1M1FNdWcyRDZzSFRzVEcwZkZLUXB5RWIwKzcxcThO?=
 =?utf-8?B?QmV2dTF1Z3FTVzRjMHc5QU1EVGZ4NzBSczc5RVdTNHhPWDZoMlJ4cWV1ajZr?=
 =?utf-8?B?bUJYdk5hdzBiUnRqMHNEeVdXakNCZXBFRTN6cTdrR2R2THdkUjZLRW9yK0xG?=
 =?utf-8?B?Q0xhd1QxY2xvVUdtOGtNd3d3elJyYTREVDFHUU9VayttYVg1dVNyaEpySnFB?=
 =?utf-8?B?QVZCb09nRk9iaUdaL3ZIOHdBS2NsdDVkZGF1eDg5ekV0UFY0cm0wVTRpV2do?=
 =?utf-8?B?clZWZndpWTNWa1NlV1lubVRqRGFTRTk2WFFNbUtSY0llUHJaQ1ZJenpiOE9O?=
 =?utf-8?B?U0tEQklhMkROQUpaa0tCdS9iTkwyeVc1OW00V1NyYXE1emV6dmd0VDNKUVNX?=
 =?utf-8?Q?h0kQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U29hMXZQaDJobHRDRnhUZlB1VC9vQmRBTG1FR0RLVXkxWEZkZGs2djhaMGtu?=
 =?utf-8?B?OVhKSFQ3SHQvZ2NkNVVZSERZWGFFSllrbktBNjNzU3h3MkxDR2Y5bGgwYTR0?=
 =?utf-8?B?ZC81MUI3eVI0WjVzU2ZUV2VhTzNxOTBxSnlHcWRXRW5JbVM4akYvZzFNcmhV?=
 =?utf-8?B?OU00c3VyZTk4TmdCbEQvQXJmNDdGSjBtVGZodWw0QWU3SUMyazVwWEdKdHFl?=
 =?utf-8?B?MVJhT2dkeHhnamg3OG1xN2Vqd3ZyWHZCaU9Tb1FTRVhROEphQkcvNHV5V3NW?=
 =?utf-8?B?a2w3dElTTDhDVld0ekNuZC83azRTUFpkRVZlR0lBSHVOVTR1aEd4akhmc0ps?=
 =?utf-8?B?TlhNL01tTTF2QmZEb29idE1Dc2g5RnpheTdZNnBLd1ZzYWI2cUoyMHlwZXpl?=
 =?utf-8?B?ZzdDVDdFN2hYUndnSjhzaW8wZmNKT0V1TlBlUmdVdHlqTlRadDdQeFNPZkN3?=
 =?utf-8?B?RGZCczF4UllDK1lPc1VnN1RRRFFJNGh5MzlFU1hrWGRSNk9yN2VJVWJQbVFJ?=
 =?utf-8?B?aWE3bGo4Rk8xT0pHU3RpdzBtbXpQZVVDa2FkSXNQYTFqRmxpNjBSZ1B1ZzRC?=
 =?utf-8?B?R2V6TlFDbXBKa0xidnF6eFkvKytQLy80dVo1WGpEOUduVm5qYUxaendJZ2s0?=
 =?utf-8?B?Z0FwUnc5K21zd2RsRmFhcERWdHVxQWhjZjBpK0ZKN285eEFOa2RDbUpTMUU2?=
 =?utf-8?B?UkZiUHdwdXhyUEMwbG9ud3hVRUUrRmdxUUFJR2V6MEJsUWRCSGd1b0o0OFJX?=
 =?utf-8?B?YlZBYzRlZUN5MEtBT0NJOXZNeGtaTWh4all5S3pUUkFmN21Pb0hRa0ZZcWZ5?=
 =?utf-8?B?azFRYW5tbUI1SHoxYUo3TXRjeWd1ZFRGNnM2QVg1NXdZMlVKU095WFNCLzdp?=
 =?utf-8?B?VDZyVmhyVERjbG15VnFJUmgzNzhZRHVGeitHcEUxeStkSlpvS3RtN3ZFb09r?=
 =?utf-8?B?VWtZZTRYKzJXRkpVbVJVZkY2K09LZ05jc2FSWlV6MDNLYU5qNURTL1lDS3Fx?=
 =?utf-8?B?YkUwN0JGQkxTSmszZm9EUk03dWsvT3I4ZU8wV29JMEZBZDJzbytoWktyQlF1?=
 =?utf-8?B?anpKZlh2bGl1VkpsNHRXVzN6QzllcElkTHliQkNnYk5WaUNrei9mMXhTd3Iy?=
 =?utf-8?B?TXhWeC9Qc0NWZlNRNUplWklnOGREUzBkdnFZZnRwbkx6NFZiTXBURjYyVENa?=
 =?utf-8?B?anBGRXhoMnRZZk9Yd1hCMDV4NFRIb3RrZDdJbm5PSjZkS0tGK0l4dG9GemUr?=
 =?utf-8?B?bDloc2lTZ2NqY1loYUw0MDMrR2xtOUJWeC9Vak9qYVBtL1hUVGdLV1pyd295?=
 =?utf-8?B?ZzhWUWtZUFp4RUc3Y3pGQTVzNzFXNVc2b1QzcERXWkFrdU1kbXF4a1Y1Z0NX?=
 =?utf-8?B?djR0WWdtaG5rQ00xYUN6aTRwMlhuUGZndm93Zmw2UTVNWmpUZjA5YllpUlRD?=
 =?utf-8?B?bnFkUUJGdVlLTDBoZ2p2UnV3S29RMFpQLzRhTXNjYmE4Ymk5NzNrV2cvamZX?=
 =?utf-8?B?bzJNdEZ3ckQ3SHN5WnRmT0NiQm5WTnRRYWdyN0loclV1Mno1RW1tS2prQTBI?=
 =?utf-8?B?b25DSnlzcTNHM20xR3BYSVFETFNoNXhLaU56UG85cWp2TGpTOG4xSytWejNX?=
 =?utf-8?B?Tk5LZEhVWkZrZC9qS0pJdmJwaVZpUHgvd3dtOG1hVEp5OFNLTnlFV3RSdXhn?=
 =?utf-8?B?V1RJMndpc1lvR2JOQ0ZqL2FhaWlvVGZNTjJ6dkNFUC9LWGNoaldveUhDaits?=
 =?utf-8?B?VHcrbFd3TWwvL3FoWUhYTnZHVVVhZ21kL0RDVHBYZlVDdWFoZUJYSXRrM3RL?=
 =?utf-8?B?T2o0UVFyRVByRDNoQlFQREc5ejFoZzlMYysvNnlOZmJnazUzbHRNN3pxa09a?=
 =?utf-8?B?VXB3ZnNpdGFiUjdlcjgzZEVmc2RhWjhYOXFVSllQQkFEbUppQitnbHJtdEFF?=
 =?utf-8?B?YTlNQnVqVTk5L0thMjBUdDBXbjZmNTRzUEpjcDlyQ0lzMWNPRzg4OVM4dG5y?=
 =?utf-8?B?QjFJTGNuWFJaWkI0UXJicHFHcFcxdXpTUWUvczEyaEdNeWxmOHZaem9VRVhh?=
 =?utf-8?B?Vm5oMHoxVndGakd1endxYStrSGluUlNPZWpVanFGU09renJTQmtPdjBOT3VL?=
 =?utf-8?B?bzdGZUkrSkN3ZUxpWTY1K1ZrWUtEK2d5RGVDelhrYXhjQUhkMVRseG5qbzlQ?=
 =?utf-8?B?bllEMjZVSlNyMGpkUDUyU1Z3Z3huc1UzNUVpbnNOK3NqMUhZUitBbVFibXhF?=
 =?utf-8?B?am03THdPdDZocHNQaGUrV0E3a0NyeFBUNkhxQ001eFlhLzZpQjNEZTc1amx3?=
 =?utf-8?B?eGgzVk9nK3ZaNHQzTlE3Y2k5bDFXcFZieUFzRnZva1prQXdIZCsxZUVXOFM2?=
 =?utf-8?Q?7+ReY4ZmEXT9QnAM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f84dba-d3fd-408b-2917-08de677fd44e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 02:06:25.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuR16rtiyqnVTejffc6pL/wMenKXUR5KHyYP1I9Oq9RTePxneLX846LxhKeQMv2ZqXSqkx7rcAWcePTzFdjY5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

On 2/6/26 11:03 AM, Timur Tabi wrote:
> On Thu, 2026-02-05 at 20:21 -0800, John Hubbard wrote:
>> +    fn client_alloc_size(chipset: Chipset) -> u64 {
>> +        if crate::fb::hal::fb_hal(chipset)
>> +            .non_wpr_heap_size()
>> +            .is_some()
>> +        {
>> +            GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
>> +        } else {
>> +            u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
>> +        }
>> +        .align_up(GSP_HEAP_ALIGNMENT)
>> +        .unwrap_or(u64::MAX)
> 
> I understand not wanting to return a Result<> for impossible situations, but I don't know if this is
> the answer.  For one thing, there is no way we can allocate a heap that large.
> 
> Maybe we need to have some kind of infallible align_up() variant, but in this case, I would say a
> panic is warranted.

You are right. And that agrees with Miguel Ojeda's overall philosophy
about handling this type of error, too.

I'll change it to this for the next version:

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0d1d9eecd77c..927bcee6a5a5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -83,7 +83,7 @@ fn client_alloc_size(chipset: Chipset) -> u64 {
              u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
          }
          .align_up(GSP_HEAP_ALIGNMENT)
-        .unwrap_or(u64::MAX)
+        .expect("client_alloc_size alignment overflow")
      }
  
      /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -94,7 +94,7 @@ fn management_overhead(fb_size: u64) -> u64 {
          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
              .saturating_mul(fb_size_gb)
              .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+            .expect("management_overhead alignment overflow")
      }
  }


thanks,
-- 
John Hubbard


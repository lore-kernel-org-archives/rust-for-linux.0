Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E352475CE
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698763; cv=fail; b=qzU+JAbNCT3rgmjlzfvemf2GzrvrXisLcLqPY/dbvLlKQTBZhFFEqZQGZOHRTS0UyZlE3uVNy3IrOeR8uev5qKrvl9sF9Fx0Q1O60xxDlanGWoZ8/ibGp6OwCALHIBpHY18fJVH7fAvCyJJy4JYjQExAyE2LP0eJgHOG7L0jrfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698763; c=relaxed/simple;
	bh=VIbdtNUxzY0ofZxpy5IRxyyH6XMdHcoaIA3ftHGVxA0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LX6aCbfRcjMJ4LTburJJrMt8AB3jd+aKac0gH+itoITO8t48M38mqqDENG6NeCGIcfycXMpPR0aKBHwJXIczr5G30TY3mxmPVzZa+LRsTNDfwui6Ni11O5eX7K4YO5uX/rNv1S6KK7/OoBOVl3/p4rkJLjScJEKZq7kZFBMUsf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GZ4IKsr3; arc=fail smtp.client-ip=52.101.61.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GZ4IKsr3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaIWGjFhVl804nh7bQIIagAqulp5qVKFs0D9QODgbSvgGBplVGxVg/mKDvbs4QLL0lFGxDaEKjfcTdCaJKaMtKCZtM1+zUfmO+nK3QYzTmSFsoBBIKL49HKaMXJybJ2iRgcoDE4NApNlsg4Gzr0TNC/5BZJnWKISw7wxJiyoG2XqyTMPONEwhmKi9MPWNn/R4I6CQsWUu8PjJbj4ymwYKQKZcPQ35+F95NPkNJwUFiAyc4NLDMuP+5aeY27gjcib1b853vVbyE9v3nPmT/rNJMZjVbySxoa2Xeptrp/tEmY2t7z5CmEPkrmZUcr6QQeAuQJcKYRmR9lHQRFYWNsVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1RQoDyvo8/uKs8eMHpnDtefAg1E0sIAuq0SrGA0XpA=;
 b=vbZpLBeh8O+KBKte8QNeuZrFcHTtXxgx3MSpBMEJP4S5cWRiLqF9WdthrmBuumn81TfFsrZGIdpofXH38md8dOhIur6iFS4JBW3VMCa8CRVQZ3FwCOyV3D7RiXHl4IEN7cWVxUoejNZjReJtjum4DCuh/lqHrgAf7sDqjWkXgPsR6h9/qb2v2oVB6PZo1Obu1t+VODCkck3zTDMtkIXrVFRL4lzsHDi9Xb31jtxvMMcXOz/KxrAvRDfIlMctC6lPZsL94QW0wZImdYPw/3siDVnxfVK/CsF6H5JeXRamo89MwuSH/H0nBwewdEtNMWwtVhwceuRBX9nQELzxmm2mcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1RQoDyvo8/uKs8eMHpnDtefAg1E0sIAuq0SrGA0XpA=;
 b=GZ4IKsr3yyr7SUwaxuGkPf4ZbrbRCdOukZFDMwcUu9JWg1MPJMQ1ETeXjHClR+h0H1mYExtLPdLFBzrFqT5RUOPq1L3ugm8h7DopopsOUQKL0TrFZqJUknxYZj8GgCwzSicW8EkgK/9ZoKzWlaqu6K0TJnDzieEiZ7cqOwAGW5Z4bS/PGRXPvEC8IST/gx9j1j3OJ7nCkgmoH11r+geE/2i11nHxF3R+cGoeA/947kSrfnMDQwAXqtZ+6TUeNfkraJbq3IfjcZRRELesZLI1aYXX4hg4aWLgk4zHuMl9OSruSFd3GItyzUSyGLTxhZHewjibDc1BGLBL8YaP7y3oXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 22:05:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 22:05:58 +0000
Message-ID: <138679f4-43a5-4a66-a9bf-3af8e1c27e47@nvidia.com>
Date: Mon, 16 Mar 2026 15:05:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] gpu: nova-core: expose the logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dfdd8c-2fe5-4dae-0895-08de83a83429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Rhdort2gYSdIOgxB+ARxJe3sK1K/OzbxOwjyhYYrmOSFl1NM8hGlp2f/EStLyeGQ5ycwMJl6CPVFgqKqa1BcL3Xw69A7bxf9Oh4SGdliCOKsWwdqs6yFwfOXKMbX3oKWg0dfu3ukyj6K3O2r7oj9nlgxDIVomlcsjmntMUesb3rGiA/C3Oxj6gwvaKCcjvWUc7TH0JAuaeB63AIX7rhywswpAQlE61nq5VrKSaKQTzdbEuN3TTG44NpuvsSMCPeXKk3lnzctqYbj9Zy9u/B/e9kIY/RNWVfrWCH473Mi05X5mrLN5EZmykoHg8VvnwWYo0JCBiIh2C2542xb9eNnStG7HMnzLURkRQbHsZCANa00CmVbkK2vCZXodJ2oO6lJU5dPbGWu9WkxVOm5yN9r5Mm2FqPBLdEy3dPeQd83BwsVTOxhUXborlLo4tAvMYG0oNAlbNBSxuODXro8ZN806eo475SxDpukz0ufyBNg5CcrLpc8Kgbi9NaT1CcLoERS5WlLMUuRjE3lWI8J6ygzZeLR3j+kAadH96QFngJenW9UZRewhWDcLWHHxq6ptF8Agz2IivUdrnbc41tUifGDYZkd0GL29qxsXWmQ5LqEVV6lj4c6+t0cAJ2nl3tNrUiL3T/MSb5pyg8EnUxLtQHExoU/X46QvxCkGOFdp4B/+tAPs6ceZsFKaJ0w+REaFqMDp/ra3hppqbJVQWZ1O+b4aDOPXYt9+fCsx0IZ79HgZPc86k4mBo3/hLC1TxfkIuVToF3cR8wxmSw4YfwYkZZG3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUFOUDhENDN2Y3B6ZWdlckZSSm1EQVRXMCtFV3VTZDEra0prNU5TRnZicEVi?=
 =?utf-8?B?UFVvOVFhMDBWSDdPc3lsTjVadzFEclk1WUQzVmQ5RDZwL09UZXN3R2x5dnpv?=
 =?utf-8?B?T2VPY01ULzBtZXpwU2lyVGRmcE55MDVwN2Nub1JJa1UwUUh0Z0VGZzhqRklD?=
 =?utf-8?B?STBBcTdjRGlXUFlqWDNBckxyOVBGeWRqU2hOdU9KQlluQ2lLajZTNytJK2dO?=
 =?utf-8?B?eHFaWEpvUHp3WmpCd1E2ZWNPQ1dpaDk0UTZlbk5qK3VmRXlPT3Z4U0JtUXVT?=
 =?utf-8?B?cVNNMldpVHo1QlhqUTQzRHVWdnpxbUtZQXpvTEp1NS9YRlZPZ20zLzJMeXB2?=
 =?utf-8?B?ci96Qk01U1lSS3VJMVFRRm5Rdzl0bEw1eFRmVkFkQ0VZejVEVzhPOVN2cXFa?=
 =?utf-8?B?Y1FWOTQvdGVuWU1OVmk0NWg4N3RSWUdMWG01UC91V1hvL1VLTW5YOWp4cC9Q?=
 =?utf-8?B?bGpNVlI0WDNXUUxZeEZCVDNIbXpOOVE5ejg2V0ZwcjdUTVpCNTQxQ2lnRExM?=
 =?utf-8?B?V3pkbnIwN0VkRDQ2SThzTGZ2cjhrY3liT05jRnE2R2ZCWWpMSFFVZTQvK2lk?=
 =?utf-8?B?UkV2cVVLeXJxaHlJUEdTUTl1SnY3RUlQYm5PbVB2OVRYVUNodXIwUlhldUpr?=
 =?utf-8?B?ZUN2KzNZbVJBMk5aWklYRktrNjQxOHFSQ0ljVlpmYUhwNWNLcWNRU2dnL1Fj?=
 =?utf-8?B?RFdxNjhqZkVrTE1pMnJXV09EYk04RnRSYktjTVZUWGVhYis1TVFJNFNwZ2wx?=
 =?utf-8?B?d2t6Qjg4OXhDQklacXlQckkwRFFyWkYyVVhZUG9LblB1dmIwZ2x0azZvQWpw?=
 =?utf-8?B?VDg4dXVGSDdDMEs0ZmJPZ25VbXdFbWNWbkg5TkZnSS9veVF2VjI0T2RLVkV4?=
 =?utf-8?B?dGcxRFZNWGo1ZEtoR3U0VTFMWFl5TTJ6aWNFc3Rhd1lBd3Vva2gxT1hVaXdn?=
 =?utf-8?B?eVRSaHlJblRKL0U1djI2d3crR2EwRkJML1plMklZU09MQlluMUhoQi9XNHBv?=
 =?utf-8?B?eURYeWpFYVI2Y3JVWUdaSUNzemVUa0Q2N2I3V2JORERYMENFYUJyenNYdHVT?=
 =?utf-8?B?Y25lUGEvWDdhUUhWbERaYnM0YlE5NjVhS1QrRlRBSXcwcHRZSnpmOG9JUmR5?=
 =?utf-8?B?TStMU05xWll3c2xtYjdMM1BRQ2ZIa0pxakVqZHVwR3pRWHgxL2Jrc2NKenlM?=
 =?utf-8?B?aW9EWGZPMkhZd0VZNTBPY0hmNmw5UDg5T29mZzVMRkJqbEJ0d1Q3clJwREJa?=
 =?utf-8?B?cmt0ZGw1WEwrcTRDVXZvS2s1czlJbDdVTWd3dklpRy8zN1phRVhwaUVDVW1R?=
 =?utf-8?B?YW5LaWRMQ0JPZjRwV3JpQW04ajV3YXF4Ujl5Q1FRR2VacWV0MDYwZFFZLy9x?=
 =?utf-8?B?UGp1a0JQUW5DU0xMZ2RNSVpidmZIdUxDd3JyRWFLblphS0Y0b1RsdGRGcHdt?=
 =?utf-8?B?dkhYZi9WTmlCUnlKeXI3d0w0TGxnU0p1MEExSmU3M0RmemcybFIzVDBmMVdu?=
 =?utf-8?B?bGpibVE3bzY4L29UYlk0K0FYbmRhaVFaSUVLSVdUa0JOZmp3UVoyZTFYWlRH?=
 =?utf-8?B?NE5TajQxVzcxN005d1VwVVk1NE9UNjVqSHpPTHFjS2dtcm5neWx3cHZ0UFRH?=
 =?utf-8?B?NURldCtsaStzMUNDM2o5WGwxREVRL1JRSXd5MGFkRzUyZzNQUndiNEp3U2R5?=
 =?utf-8?B?MWpBT2ZvSmgwRmJmZkkzcHNKNzh5dmxVUUJQRk16VkdEelAvTmZOYm16Z2JH?=
 =?utf-8?B?d0Nlc2dWb3JoL2NiQWtlcEZDb1VwZEdaeWJ0QVJUNzJ6TU8yQ3FGQ2RHVEcw?=
 =?utf-8?B?RDRzSlV6bGIwVitJVHBRNDRzVnRsSS9na0RtS29YNjE5VkhiR0ltSUFydVVQ?=
 =?utf-8?B?azVmOVJQNjA2Ynp1VFh4L1MwVTRSdWJ6aUJwUk1PODIvdDZBV1h6Uy9TQVV3?=
 =?utf-8?B?b3hzNXJid0tTVjdJdG0vME56dHgrWmFmeVFVUkJvSWlnRm93MUhUUGN2cU5G?=
 =?utf-8?B?OXNvMll6Rk1wSENienVOZVQ5UmF1aFArdEIzZGxNRlh5RTJWK3luRFdvRDBz?=
 =?utf-8?B?a2xDQm1Nc09RY3QrQytkYTAzOERsbDRrNmVqc2RteGZINmZ4MmZ6ZktYV2pk?=
 =?utf-8?B?S1lsS0EwS3B1WVJSVGtNMnZSVUdUWjlFbWQyajI4ZnpVQmZwem1OdDdGbFdO?=
 =?utf-8?B?S1hqc3ZFczRxU3A2N3VuaWsyWlJSZEVnbGpaYnNncmJmZEljY0E5UER0L01R?=
 =?utf-8?B?R2pMNHlpVVJaYlIrOUNpN1U5a05acmdQcThYaWFuNEFWU2JtZThha2t2djZ0?=
 =?utf-8?B?R1hmRlhDbDkrdWZ3bElRSmE3RTdBMjVjUFgrZ3E5N0hON2RGRDRTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dfdd8c-2fe5-4dae-0895-08de83a83429
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:05:58.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzkhPtJ1GV+erd13MTULcwuEks9Z+akIN/6uhkaMwqkbXwous9vgq40x8mRzAGFIJBJGW48Oo7rZbSeiWxDU7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951

On 3/15/26 10:57 PM, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.
> 
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
> 
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
> 
> This series depends on Eliot Courtney's Cmdq patch set [1].
> 
> Note: the debugfs entry has a file size of 0, because debugfs defaults
> a 0 size and the Rust abstractions do not adjust it for the same of
> the object.  Nouveau makes this adjustment manually in the driver.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Tested-by: John Hubbard <jhubbard@nvidia.com>

Thanks for adding the tag, but b4(1) won't pick it up unless it
sees another reply to this specific series, or if there are per-patch
tags applied.

With that in mind, and because it doesn't hurt to have more testing
done, I've applied this and re-tested on Ampere, and it passed, so:

For the series: 

Tested-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard


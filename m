Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3092F6931;
	Mon, 30 Mar 2026 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892536; cv=fail; b=XtWD6QtsaaupKxFErqdnM4JVuyIoztmFUPYbeHHamhfXuVvppwIUOsfGswSr6o1iURhJxXx2HOCpQMjuOGotyCYsSKxyaFf3g1ylXEQmyFzgvcs7ugVVsleVEkvmd81ntHxlNXRcpwEtjRXfdJj1HeJUiw40KDWYtls1O53lKmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892536; c=relaxed/simple;
	bh=rP/b7SVjcOrXMqoe2j8KQjbVHuZU3sxEf+g1VpR1mdw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UdOwqR404Y142y2WLRDny9Hf8XUhwO1c6rG6b9AzzZYYF99RRMxie4KVxOMGYNMW3V7RmeDqXq+HPY6vxQOQkUGFyWE3ZVS9i+Z/uIbiOxw5hYBg1reZCRA11z3Hml8uaBnlSDcifLV1DcmDYICJtTJ5uXoU5tQFQFoqK6UaQro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cJd6ONaE; arc=fail smtp.client-ip=52.101.43.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cJd6ONaE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVM9RLxZLyJeT9kEP9s//6qRR3znYHgfKy80VNojAL+AOBKReIqzlJMt5rc1dHifl5itdzc/Sh0QnuYCD2rkpyHoIJ2W+NL2xeMf+pM7uKhbNedmTz3coTH7XK+9cd4qa/BCDB1WfHXOCbvAjo0fUbZOL5OoxJ+MdmGBRiy4Z5EyvMQ1/z5KpIv9MdhSFH9RgS41fsZcFGG3tP9VQR1riBzIc+u0+GLKVmvJsTOxoAnWBvsCQj1d8Z2oqkpBC0MV0XY6lYEx8VbdeX9NpIlEiLbIrBztjI1Ux2pAXKon+ZurJOlBbGxNiNOBFUW0fhpUoSDxW0Kn6rR7eABvBrMI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYCVVpOpGfV4nqFra3ELFvbipzN4DHpnz+nij7qXqBE=;
 b=xS2++7K6rBcdCti27Bj0W3F4INgKAFkRLTgD4ofLLlanMaihQDF0R45Ipnj8by6hPRyKbueijfAaif303X0p4zEyiSNC9Ts0hG8W8Wg5ii2LqZA/xKPiGU2nXJm50wIHPcSpDQ3Iq6XHv6QUx9TkIPIm3GFR9kdP8WarI2K3pUpyLDbit77SZthIhNisnDeokxioDiRBtrPoMnpzjiamLS2M4myGJguArkG85Fjvjh4AHxrl5iBU5Uq/b8e/ZZdvKMismkKmTYuMfpyjec+5POu9SbJNjmDaRbYlVE75r68ksUeTvoFl8COMwBcDsSra8EwRMNQ2Cnws0J7cuaImYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYCVVpOpGfV4nqFra3ELFvbipzN4DHpnz+nij7qXqBE=;
 b=cJd6ONaEqMAequTcHNatpPGhgckJbH0BhnmYc6Ex3+O2RR9+bGyjZOMkGXdui5bG2YN4Ywc4yTYMNOufypEQ2VueZxHgpH5GYxW7tCAAC9cjZN/jbkrYbZRtNkX6CHq7s0Ix8u/BKaImQc/ZRvaODIi3IoPA6FfbZLPejXUGEx4N5oqzW6zkOv+po51E4tTQRY1FSDwfQDLLdVXlDl7gcDvIHbs55/BcezmrLZl++vIBzqigqNdgllPOSkqs0v2znbdsVnLQS4+l39UrAVn5P8JX9KWv++Z8V6Z/Ardrg1dr2LI1QOJZKpSELA3QZr/xHenQI0U00jij/+7zzKbvNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 17:42:11 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 17:42:11 +0000
Message-ID: <983c6463-3c42-4915-b015-7a56c4f38615@nvidia.com>
Date: Mon, 30 Mar 2026 13:42:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware control
 interface
To: Jason Gunthorpe <jgg@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dakr@kernel.org, gary@garyguo.net, aliceryhl@google.com,
 bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 markus.probst@posteo.de, helgaas@kernel.org, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com,
 jhubbard@nvidia.com, zhiwang@kernel.org, daniel.almeida@collabora.com
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
 <20260330125839.GL310919@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260330125839.GL310919@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::35) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6d1353-56e1-4b37-00a7-08de8e83abee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kJ9Q+A89uYdhDb46V1FmgtRIPJMq3m0xY+GDFiKPHJO5Q3HaIE8QZoeySYrOxElfM4FuEM2jv42dQDre5E02zvHlze23JGDyaXYvF1Z1AAEpeweh1OljpfHutwxxBMKZMnCYpZI9+drxyyaC20uZ/4dZAvKmpZ4IFMwYBm3FiAivB260yhq0GNgDGs7bez3PAZ/Uq7MGhLCLi16UeLNhhIP3HMfAFWXvi7Zls1w8FlDw4VJf5fcMW+nTTjLkCd6nkju0rXHW91rGEHGFWkkEsap1p1R3hJ12iZIGikWRrhhov20NYA2yHJeqB2x4DvDGkMyvki+7DhPzFfza74DEABs2MCVx1rPjHrklOWQVKSaiVR0KbeEmAxlGRG37r46Afsim+/8j2F3EiI+o0frruYpWC0qjmomXGvgC3U785VsdT2opxIdGp+De3lvMKLHANB4hb/VnCLcrZNawFVp/YAczlmmweXPpWQBsWu11iZEGIbu3vDcg5KnQHmFsfInNuwO84wDw+Li5BjCTENnTFX360Rldvkt2yYcsEwxMofJqeXbsAQFRsZCt2sr/ERGiASvI1I71vFzddIT4G1Z45dAc3aLbIu7U+aCfkiRrom4sVgdPZNfTKL0v2YVkL9HF/iAVG8Lih5H8Xu/0x1/55x+v2pDpOuCqQXspuoPFVxR25fIFLl36XHRssgYoFromjgewDXGjmO93WydnvqNarDuRP4cL6sxdobt9Ly5uMVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDY3MEllVXNuVldZK2FTdXI4eG8rRGVJZklrM2JkWGhYUjVwU3ZlUnN4UDJu?=
 =?utf-8?B?MHhVUUtybk1pKzI3ZnVvaVhacE0zMEhRbjI5OW9yNFErTUtNU2UyQ3U0V05Z?=
 =?utf-8?B?OGtoV3NpeHJkcU5Gc3duR05kZTlLZXJPUVFKblBCQ09LU0hVSFJXdmNRS3pq?=
 =?utf-8?B?TE93ZlZNaWcrYlNDMG8va2grZGVrdjhVazBobnJBMHZGK3NhU1pkOEhmbjc5?=
 =?utf-8?B?UkZuVTluRVU4VEF0Y2xnWFIreUk1LzJqaTRzM01jWmFQdTlIdjlYRVFJRFQ0?=
 =?utf-8?B?T1g1aEduMjJQTGY4dDRBMERvQmJqMjN1akZ3K0hVcUtTeE9vMjhWN0VtS3c0?=
 =?utf-8?B?WDA0MHRodUtmZ2tsakV0Z25WZWJzUzVGVHN5QkZMbnJValhvbTYwTHZZMzhz?=
 =?utf-8?B?Z3k5cU9tRGJPOWpVc2NRNXliN3RFT0tSNjZRc3F1ckFBbndmK3BhNlNjSGs3?=
 =?utf-8?B?MUt3OVF0cUdPbmRvejNSWnZDRk5kM2FOOG5hMWxoek8yNGpCVWZaTm9MRno0?=
 =?utf-8?B?OUFiR0cvb1BoRlNrVSs2aXQ5Wm9vdVYxbU1kSVJVbGppOUJMRHUyTlNoOEx2?=
 =?utf-8?B?bTJzcEFkcEhhSWl5YmoyV204MFIxYWFYV3c2VXZwcktaQThuQ3dUODRCQ0pR?=
 =?utf-8?B?UGFNc1cvOXVPcGYzSitRTi9KWlZnTFdoeFdidURqeE85NDJFRnkxeThqUkdj?=
 =?utf-8?B?QVNUbU1VT21VM2NZYmd5YXMyMmVLMlNGdDFmSklZRGYzQURZLzF0eXZCbUsr?=
 =?utf-8?B?TU9MK1JxR1JjK2lVR0tQTXQvTlo4Z3VsMkZlY2k4MitTK2xhZDhrd3RNNytF?=
 =?utf-8?B?bldYSHhqcE51VmlJdnpBUklYT0VVNVgvTmd4YlFscDBTZC9lSkJGYU43a0VG?=
 =?utf-8?B?TU94Q2lDTXpGRW5MR3pVVFFzMEQyTUVIQTB5U05FQjlIcXFDSG11Z0FmRjdX?=
 =?utf-8?B?NDR4aktDWUFDdVYwRE8wdXVyRXJXWHhYQ1JMdzNucnVtTEFUOEZ1eFA3ZTBP?=
 =?utf-8?B?WGpDdFlvd0J5aVg4am5Ba1oxdi9DaW5kSVJ4OGwxODM5b1Q0N2ZzbVgrUERO?=
 =?utf-8?B?MDdRRnprdktwQkQ4aVBXZG1ESmluY1U2d3FNRTJqamhibytFRncxNzdCL2Y2?=
 =?utf-8?B?aWt4QTU1VHg0Rm1Rd1Zhbll1Uzd1aXF3QlJtT3pNcjBMYXlNcldCMTFnVHFa?=
 =?utf-8?B?NXliN1Exd2YzZk4yL3M1UVpEWDEralpkTzJaNW42Y0RycW5lTkF4cEM3RzAx?=
 =?utf-8?B?d2l1TERCcFJsZTFqc1dwQkZoQm9JSWorOExZcDdXRk9CdzZ1R1piVDBmYW9x?=
 =?utf-8?B?NWwveEVSSlJJQVEyTnpuVEN5OUMvQjkxNlFQNnhTdTVnV1d3U25reGtBMG8y?=
 =?utf-8?B?Q1Y3eFFMQ25HMDZDcTlWekQzNmc3S1hOd1RTYWdZVjRVdFJYdndGTjZ0ZzZq?=
 =?utf-8?B?OC9ORE1oWTFESmxZaEQ3aW5FY2xYeXRUK0krVFVIRWlhbDhKUzVPSzZsMUVa?=
 =?utf-8?B?VEJ0OURSZGVNdHJLOXRqVkZoMi93Q1d1NHRuSnY3SkdDR1JNbExyNS9oODZJ?=
 =?utf-8?B?R2Y4bG5yQm5CM2hqZ0dZV2ovMzJicjRLMCtndEtaY0N4WTFJZFdkSmVidTRs?=
 =?utf-8?B?SW9RTlF0aUluL3pPUmZqMzBOMWROdU9Oc3JFQjNZUTc1c25iK3RkTjV5M0pO?=
 =?utf-8?B?V1pQSFF4K2dSc01HeWJETDZxMUREOGVyTmhUTWlCMUxUYTBpUGZGNkVpc0ZF?=
 =?utf-8?B?UU1LSlIvcngvSFNCNEgyeGRBMkRqbFB1Rm1KblNmZDEwcEdyaGV3TUxkemR0?=
 =?utf-8?B?b3BaV3YySXMyYjlRdjN3RWh1elRYeHEvM2FpZ1lDNHlJNXkxYVRoMG1iUFp5?=
 =?utf-8?B?cXJLQVdLRkdlNENJb1hsQ3V3ejFBR004SUpyU1Y5YkxNUloySjVpUDhlODRo?=
 =?utf-8?B?QitrWUJxb3ZFWDkwbmpjTmRMYU9iZG9tbEVKQ3hWM2VJRFlzVEFWSXF2M044?=
 =?utf-8?B?REZzM250WklQZ05SbnBnNTNlRS9aS0hOdktFdER5T3RYbDZuVnJIUmZqU2VZ?=
 =?utf-8?B?ZExWWGkxNU9FMmM3eEZhR0NNSnVJWXRlUll1Yzg5dE9xMXppSjVLeENxKy93?=
 =?utf-8?B?bUFjM1ROYW9sRS8vNW9RRXZuZGdtK2RrdXVqRjFKQVRwTVBpYkVodmt1RTh5?=
 =?utf-8?B?alo3c3QzSFQ4SmcwbHl2SmxJcGMrcHBaSzNSeUI4SitWeU10MnluekpSbG4x?=
 =?utf-8?B?eGlZT1pwQzI1NGhGcmZYb2xjdVJtalZNMWRDRVVmSHQ5Mk1oc2t5SGowYWtw?=
 =?utf-8?B?RXZRZlN0anBGbGh0T1ZEQmlTY0Zrb0hqVWU0UER6cG5tRkJzTUVCQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d1353-56e1-4b37-00a7-08de8e83abee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:42:11.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkiRjPZzep4V2GhGJf0vFSs64Uh5UAdymx6kvYmW90qXN1i33IrvE/P7gptke2U59JBNH+Ndx5bmm7QcroTTtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7163



On 3/30/2026 8:58 AM, Jason Gunthorpe wrote:
> On Thu, Mar 05, 2026 at 07:09:36PM +0000, Zhi Wang wrote:
>> +        let rm_cmd = match cmd {
>> +            uapi::fwctl_cmd_nova_core_FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TYPE => {
>> +                RmControlMsgFunction::VgpuMgrInternalPgpuAddVgpuType
>> +            }
>> +            _ => return Err(EINVAL),
>> +        };
> 
> fwctl drivers should not be changing the commands as they flow
> through, the idea is to put the raw command mailbox directly into the
> FW, and only access control them. So userspace should be setting the
> NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE constant directly
> and it should be ABI stable.

Just trying to confirm my understanding: Doesn't that mean
NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE becomes a part of UAPI
then? On the one hand, there is the argument that userspace should not deal with
GSP-RM specific commands directly (lest they change in the future or get removed
or whatever, and nova-core is the abstraction. On the other hand, I think idea
behind fwctl is as Jason put it above. So which path is correct and makes sense
for nova-core?
>> +/**
>> + * struct fwctl_rpc_nova_core_request_hdr - ioctl(FWCTL_RPC) input header
>> + * @cmd: Command identifier from &enum fwctl_cmd_nova_core.
>> + * @mctp_header: MCTP transport header (packed u32).
>> + * @nvdm_header: NVDM vendor-defined message header (packed u32).
>> + *
>> + * Placed at &struct fwctl_rpc.in with total length &struct fwctl_rpc.in_len.
>> + * The access scope is specified through &struct fwctl_rpc.scope.
>> + * Followed by command-specific input parameters.
>> + */
>> +struct fwctl_rpc_nova_core_request_hdr {
>> +	__u32 mctp_header;
>> +	__u32 nvdm_header;
>> +	__u32 cmd;
>> +};
>> +
>> +/**
>> + * struct fwctl_rpc_nova_core_resp_hdr - ioctl(FWCTL_RPC) output header
>> + * @mctp_header: MCTP transport header (packed u32).
>> + * @nvdm_header: NVDM vendor-defined message header (packed u32).
>> + *
>> + * Placed at &struct fwctl_rpc.out with total length &struct fwctl_rpc.out_len.
>> + * Followed by command-specific output parameters.
>> + */
>> +struct fwctl_rpc_nova_core_resp_hdr {
>> +	__u32 mctp_header;
>> +	__u32 nvdm_header;
>> +};
> 
> I'm also confused what this is about, are these headers words from the
> FW definition?

These are transport-layer headers for the GSP RPC message queue, MCTP provides
packet framing (it is a standard protocol like networking protocols) and NVDM is
NVIDIA specific header carried inside MCTP. IMO they are internal to the
nova-core <-> GSP transport and should be filled in by the kernel driver, not
exposed to userspace.

Thanks.


Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE729CE1;
	Mon,  1 Jun 2026 18:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338071; cv=fail; b=ZtaJ2cEbHzEZiYTzexl3cFyJKPgsQi9fZ/UqcGV2c3tTRzKNozY/lcPGhv7MjiWCuD8mYrQWmq1zhVqG9e39Cv7Q/BZ67G1F8RcLp7T/MrwUV33rxw6ol5oF63GWIj8ExHhcOTB1uvDwlTTKFMBXhvzLFMz4++GNZh/lc2vT+9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338071; c=relaxed/simple;
	bh=b7l0qWBjQIVIRiHWPCyibAsu+Th3qSuF+vlFDRX/oH4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d+Y2xRIwF5SvWxmnJQ+YWFJXJGBThGVJmYJ6YO2s+ACqlXWbIfRc8AYg27ieySv+4g9hks8nFKgqvSLXwTOAMT25Fy9NoLtL0+X/bIAPsEAAu1unDuer0lGt0R/qcomLZ8IhX/r9jcoqUcoQ5UyaiMeVzZ5m6R7Si4P8S21ZupY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nWiedT24; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWiedT24"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0JMSJ8DJtgRylze+qZPegxyXOkCMq0mIgzCFbUxRwV+SxVaXJebEJzVeBFKHWfjDE7i4ukz+Gn/SyhIwG9P3iKUXJfVP/GklVAw+SJfttoChP1A/EyRrRjiK1W2MZgKUV/jznmwqPYCWoYXLhoG5Pb/R0F7kqoEJqVqV/GtIvokeZzDX7g9ZaaDiS6SARu6xZ1c6zedQ5aNBomzN1emQVTzcLNbtto9y8Y4xmB2b8qRkbg8kiuNCXZL9gkLxpPiduHdDuv5SGDuahEpXyC63CD1+Tq2KYsY58Jlu3GvpIb/NuQ0yM0Eo/GbohC4CuJcZKLwT29lTS+k0hmUl3ZVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxbKemnln6yOWbqDQrIirNLboTMl2SQqpGkJqvDmnG4=;
 b=Lv6QRM0ghv0curx36lMmytRoHBwuXnSHzVCPIBei7rma8tG5qVnocqtnKThn5opi9ce2E8SnDHGlG6E5cFPpBmQsn9kNcbC59t1UVFYB9X0mxn3k2HQ72ACSGgFphoX50LBZmXGtPUIHY7bf5XPZGPyhuOsYi88003UV+NAi25Zybu4qZYk0RgoGwSm5S1VVStlFxJJqkwdRgpcwI/xw5hkg1S/y+pHZ4gF77MyC6rbvwxxHU4L/FPZkQEKEr/W16rUgvMY5O0a4Nh6w58stJdT3tHuLH3StqRtGZpn6X3Fo7GFiDzfSk6eIYYriGvuBJLf5cMFJSUz1MFpMNPtpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxbKemnln6yOWbqDQrIirNLboTMl2SQqpGkJqvDmnG4=;
 b=nWiedT24NNCBHvIU9NLNrffZ6nJ1AkaBo17aQMt0G8HY6zt0++Hga3yTqtZYNfXgRtLTHt+XqSwsv1XQ7ENgpTz3kaeiNG31I0MXITud8e3CyQOe0JCjGdXZt6+SNZYbJubgUANHDOyMqyfFzc1a4UgxBlXuC2tP7mvymhXvLP9Cfhs3LxEJ/K8k5v3vFMMvpQXJAUr/rgWJYv9ygmcND68V2WxXFTOzbPDkc7u3x6lFOOf/Z4HltJt+AFjrNsgCSVbSpvZ6wwzVdMTe0Ix0Oh47nMfeOBO7ht096VT5q24cRKdm4Cl2LtCIwzi10yklUI1tUEERmchkPJi5r98I4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.17; Mon, 1 Jun 2026 18:21:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:21:06 +0000
Message-ID: <6d7c1ce0-ef16-4935-8049-d5ada3baa9f5@nvidia.com>
Date: Mon, 1 Jun 2026 11:21:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-14-jhubbard@nvidia.com>
 <DIXSLENUBALG.8QIP71NU6DM7@nvidia.com>
 <DIXSNZJJFDBA.2C0CU837SWSCH@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXSNZJJFDBA.2C0CU837SWSCH@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 618e4efa-3cdb-467c-1c4f-08dec00a8bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099006|18002099003|22082099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OsUVXWWvC+xbD2Rmz9mPAtprN63McdDgyVPCd3s9RxIfEUVlEnbb0blKRw81zW3fWACUUYj0qtrg16XKjgLC0ZkFDirv0gpARPaeVkB8sMpo+rrIg52wJzX/u/nmesxT3VsMQYdr/fJD1bMvFbcDk12MS8/jjDfr2pTC5Ggj0kohpmpKrwc7hklQ1IbrcfTh00LORv2u1fxltFEmGwuY31kjQqjBFPJst8TdbqvDL1gmDmCT4yntwEBBifMEVtvfFwiZhMHBXvSrNujX1+OlQfUvih6Qb66hbcgdFNdW5LzCKE4Q5kYIieI1CnKQifFNmwn3Xewee15E4hXVPxN5knZar2r4ZkBjaudvfj2vLk8FFsr86YGr3VPoo3DwGvYwf2OCzXcsIxkgbOcn8lIle9/Bpskf7Vp/SsPwXRqS71b9MQi+6VvKgOEItVGzs4XfmEUdfazH1e6UDvC/1/YQmuHqdMNZV8djh9MnYbjGQYXzD4UFyNUxWpkI7O9DLR9uRQYsqXZgggt2gusyh2Z00bt0sUFhBtxVWXiTJXWYlkT6rV6ZdVRrE4xnDyC2dwn5VNXAe4VZmPOZLUY/MX7x0byvu52YZ/lG4o8PGVlNQ248lSx97hsYuEqWK0SV++E2PVd2Khsb8PWEDfv0OQmz42XW1j3ASNLfezk0M0X8TRtRFcq4APuF+XDq4wkz8cSh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0kyb2JKd0VrSnBWUUlPOStlRXRFcEhnSk8yWjdrVjJXSlVPVzFwc0FhVjd3?=
 =?utf-8?B?eU5pTkJiR1IrZy81SFEvaTM4S2dLTzE5R0RtLzZJRWdDc1YxSHJxTUcyOHEz?=
 =?utf-8?B?bjJWNXZLakE4bE9jYXpmS3RQUWhQaXhpVi9zOWIrSkhZc2JYYmJ1T1RhdlBQ?=
 =?utf-8?B?cjdMMkpTczRqRGhIQUJRcnBFMlZiQ3F4RjhMK29iNHVYbE05YVMxanRudVpT?=
 =?utf-8?B?UHFITnBhYW5rZUFqc1U2c290ak9yU0JubVlGb2FXdE9td1RjQXBoVXN2TklM?=
 =?utf-8?B?VmJVanAreXFzUkJSNU5kL1gzekQ3VVAxMTRuRkVaWEdNc1I5blB5TVZsdnhq?=
 =?utf-8?B?Wlc0YUZ6VTZ5VUt3Wk55aEdYcE9wbEZoclN2M25RTmNEajNVdzZmVXNreWxZ?=
 =?utf-8?B?YUdWSmljUHRyai9YbCtxbDBqeW5rc1VFMVAwL2Y1Nkp2SGpXd3hTNUtTKzBp?=
 =?utf-8?B?Zk5ZNnVNVHp6eTIxTFBpSEErVlFWWkVWZHVlbGVuc1NtS1NVNXVEZjVIdmdC?=
 =?utf-8?B?Wm5RaTVJelAybDVrNmRpL3JqNy8zTGVDUE1pOFNYN2ZwT216Q3BhQTBwcDNX?=
 =?utf-8?B?QnoyQVBYK1NmQWVEdTg3UXl1RGdPNzRKcWVHR1dXME15d1BnRisxVEFmMENO?=
 =?utf-8?B?THlpandQdHo2ajRnUGVxdjJXeUQzbEw4UmRwVXl3TmMybnBETzlPdGx0L1ow?=
 =?utf-8?B?cEhKZWpXTlRzZ0R5Mk9NUmdZelIvK3BjZU5WcG91YWF5cGtvU1RxMFY1Mnkx?=
 =?utf-8?B?Q2Nqa24vdFNKZFZ2VWl0bVh5QXp0bSt2aW9wS004MXpDQ3BJc1BRQVBkbCsr?=
 =?utf-8?B?YlhJOGRtU0dqQTROWjVOb0EycHEydVVQVkpNM2VkNlY0NS9JSm9Wb1JIVG40?=
 =?utf-8?B?aG93WlBNOG83SkYrdjF4MDh4a0Zpdk1zakt0anRxeEFTUUJaYkZSbmFPaE8r?=
 =?utf-8?B?UEl2aUtkNnc4MmNvNzhWdFBoUGM5UFI4cmMzNmlmRnBXWEg5OUQ3VTdlMjEx?=
 =?utf-8?B?L0N3NlA2aTdPcUFYSVQ0MjJMS3h0VmR1cEtKOUYrL28rb1JrSlZ3NGI4RU9l?=
 =?utf-8?B?RGVPcFpzYjc2ZzFWUmpDMkpFYlJDdWticDlVaCt2S3pTby9VVGpCNmQ1LzA5?=
 =?utf-8?B?UWgwVzdJenZhREp1UUg3Ykw4T2ZBODNJaGRjenc2d0lsNUs3TDNWazVyd3Nj?=
 =?utf-8?B?SG5KdG1kS1BFc3dlOTJTTlhoTVhPdlE0dzhHa1ZEakJueFExRDNnZ1dIaHdZ?=
 =?utf-8?B?cVhjdzdTR3NFNXhVektFTGZMaGc1aTdtN3RGbW9qVFBRWjBzYnR3Qm9vaG5h?=
 =?utf-8?B?Tm9BcGdBWFhjUkhMRVpsdlo0OUkrRHV3TXJsb0hzdllSUzN5R3crVE5paWpk?=
 =?utf-8?B?OHRNaVVQZm5QQU9QZFZZQnpLbXhtc3VjUWpSRDJnOVc5RFd6Q3pTSlRyTkxH?=
 =?utf-8?B?dWdqMUgzSlhyb2JTZzQ1eDFkekIzeWE3Um9RM1hEaUFvam1scHJKVnl6MW9J?=
 =?utf-8?B?MVUrdDFDQjNvTXJYSzZtLzFia3prZW1jOXIyQ2x3WlRKYnR5UEM5d3Qwd3c5?=
 =?utf-8?B?RWNQZk0vMnVKdWpLYnRSZHpuQm16eW9KeC9VdS9XWDBwbjM3R2c2ZzRZSXVP?=
 =?utf-8?B?ZjBHNldDRDhudE1lUEoyeTYvMUs1djVFRHY4aVVIczM5OUk0WktGWTQzK2Qz?=
 =?utf-8?B?cksydHQ5RWgvRC8yREVPeG1oUG52aHMvWjBOaE5seGpWUkc2WVB2L2RHeWhI?=
 =?utf-8?B?eStvdWJIc0pCYjFDcGI1L0d6OEllVHAxM2dJcTVrY095R0dtemdtdHoxVUwz?=
 =?utf-8?B?MzlmLzliNXMvOXQ5Qm9WMHdLMGh3UWFUT1JOZjlaZWNZQ09NaHRVRmQyNmlw?=
 =?utf-8?B?QjBpUjc2ODJTTnRNUEVZUFVhYlBlTXNjdmJ4aEF0YktvU2xjNGt3UTc0MXlq?=
 =?utf-8?B?TmplWFluYmJ6WElFMk5aYW5TbTF0SXJ5R1NjQlJ6c1E3WjVJSkFYRDJzV1hp?=
 =?utf-8?B?SnFRYllyd2g1b1RqZFNiUTBsbUlxWlRQV3lTYjYwVWNpUXRRTkhSRjA0dzEx?=
 =?utf-8?B?SW82U0o0Nk84MVNtSFRkQ2M5RVJzc29UNGdheXVqb2ErUm1GSnBLT1ppZDdo?=
 =?utf-8?B?RWs2S2hvNzN6ZFA5VlIzakplMjBWQUd1d2g1bkdwWWFDYU8rQ0Z5RU9PcUFB?=
 =?utf-8?B?UXRvRDNaSG1hWndoY3Y0dkRVZ3M3VFFZeUFUUHlZbUQzUTVhb1VPNzJmMzdo?=
 =?utf-8?B?TFIyOHljTS9uejhBZ3pmWCtURFdUbDNYSUpNTFoxTTdMN0syNzg4NUVHVm9C?=
 =?utf-8?B?SitUZCt3UVhsWXBJb25TU1NabFM3T2YwOWgzb3R5cXc4Sm02c0Z6Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618e4efa-3cdb-467c-1c4f-08dec00a8bf5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:21:06.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bdSoouJJI1u5Ja+yw0JTq8741DgkdyqwDQG3SVG3jMQCqKjcHU4y+TxwZY7l8f4nZRKb6cwnz4zjd/MfFY/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276

On 6/1/26 7:49 AM, Alexandre Courbot wrote:
> On Mon Jun 1, 2026 at 11:45 PM JST, Alexandre Courbot wrote:
>> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
...
>>> +        let mut signatures = KBox::new(
>>> +            FmcSignatures {
>>> +                hash384: [0; _],
>>> +                public_key: [0; _],
>>> +                signature: [0; _],
>>> +            },
>>> +            GFP_KERNEL,
>>> +        )?;
>>
>> This construct may create the 816 bytes long `FmcSignatures` instance on
>> the stack, where space is at a premium. `KBox::init` guarantees in-place

Ouch, that's huge. Good catch.

>> initialization:
>>
>>     let mut signatures = KBox::init(
>>         init!(FmcSignatures {
>>             hash384: [0; _],
>>             public_key: [0; _],
>>             signature: [0; _],
>>         }),
>>         )?;
>>         GFP_KERNEL,
>>
>> And by chaining the initializer we can also avoid making `signatures`
>> mutable:
>>
>>     let signatures = KBox::init(
>>         init!(FmcSignatures {
>>             hash384 <- Zeroable::init_zeroed(),
>>             public_key <- Zeroable::init_zeroed(),
>>             signature <- Zeroable::init_zeroed(),
> 
> Oops, I got a bit ahead of myself. The three lines above should be:
> 
>     hash384: [0; _],
>     public_key: [0; _],
>     signature: [0; _],
> 
> The rest should be working as expected.

OK, will fix this.

thanks,
-- 
John Hubbard


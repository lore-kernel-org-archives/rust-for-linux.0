Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F0332EB7;
	Mon,  9 Feb 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624355; cv=fail; b=aAwDPmYEaGaqrkPwkyg5Am1h7/1+9aQEXB+KTM2lg+bCNcr85T//33Maq7aAcZk4ivWV43UgQAvvtwEDOVVRCbc0PbXbxIe5RvSiEtOZ1uhf8qT8wWaMJmbPhyCj/++5q2jgK4VCEZAbZbyu5CwEz4wgSuP5cTh+oPWmUGMBDg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624355; c=relaxed/simple;
	bh=vw21/d0Td8osA6Ci/nvtTQoaFQl7FRcmSiwjnXlLKVI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TpavaMpzsYE4WuHQ+l0VM9vv5rgK0/atN6b1ge2Oh3AG6XDpSAYgEowaiJmDAikAx7HP833xQmbcqRuTebCXcrfxgKcH8FFCEEyCpDMsS37NzHF3hGcvmnitwLLfpUU4ek2lRMooNo/lBF23/JSGw4cWVfQSeG6ieTkQ789Twa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ghr5kXyC; arc=fail smtp.client-ip=52.101.56.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ghr5kXyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG0Hq6GX61aWFG4s81LL16vdPkaEbee0nBOrQhicFfPLp9KgCTkla1nkwVd1hN0TQdSZ3k3WZU5ZgZFH4kvVBloHWIdIcqKNl1daRhzxlJ/vL5wQO9QTENBMZLPruoJphhdBsNPoxS+HjA5FeNrFkUhVi9cRdd5BtskAaUc0AOujLWDDjiQrAWGMouMkz6QOlewVzi9/OjQE8U6je7ubUHzpAvZjk2pfQsiTsiC2mB11WSx5ajELI9s0yQl7HsxSjuq71QoLayj3+mSE5bPIqPQs5o9i/5CDaXZp2GnqIM80UqRimBf+wVZZtdOZXfQDBqTnzkB8gwFAtp0U29LrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjNLJtf0tqUcC6Uw89udl0TwgHxOLD+UXD9lvgVJ2es=;
 b=cUVEgwhdfJwOr7DfE9jCJtngbK7Snz2PGL9nwU0RNke7IaCnWnDuQneO9l9dE7+qa2QkUFnTA7gD65+TGWQAgCETaukmI98fBlWYHfFs0xP+2jfIwJPqTsWL1TJrs/I+iuVEfhYZsmaywxPLRztl7kxhmltaDX/Z7lWbEFel4qJ69fz7GS3dRRtAQzRCHd0aaS1JiKVU8PEic7/n3qnp+sSwrxN6djcfN8ed/MJ22tYH06ree1EkQ/aZor2Ew6TOsNSh7i8ads3iovJ8TkaH/Fh7edgPXeG5yYw9cQKXgYo4FJRZD+xXmm15BvGF7MeUbMZ1Oog4AwSeqe5S2kkOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjNLJtf0tqUcC6Uw89udl0TwgHxOLD+UXD9lvgVJ2es=;
 b=ghr5kXyCK2b+0nKP++esMrvw9bvMoDhHLHfQKdU7Zg8gDlfMEFki6LoWbZ1ym1yTE7aIf8RFqWoqOu/5aOWmAXYQcr5AJtRH68FC7Ks6njJXO/EHcr8Ke4slnM+Q+PUZQw8dc2FVYVNnHr91793HCardHb4xhzNTWNijbuwhLiUIHXT1dblYePPaBw2xedrfhyuFIbPZZNA8tbygVcXvnGstlcvBddvwKjhFi0MiPg+xLVgJAxT96Gclbye84/gMoj30F9BzP1dG1ehTNovJk3NmpD5RmhzH/3UlRbDIQjwwCNDcR59F43/3YvN/bDmyNgfNmnuplDyea+GQJQBP7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.17; Mon, 9 Feb 2026 08:05:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:05:50 +0000
Message-ID: <39a3e4af-1674-4f7e-a4b1-c37123f5458f@nvidia.com>
Date: Mon, 9 Feb 2026 00:05:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-31-jhubbard@nvidia.com>
 <46121c46bb52e7f8578367232b772f234f20be86.camel@nvidia.com>
 <bbfaf5b0-6e10-469c-8a01-9575ccfcd8dd@nvidia.com>
 <81280b58-965f-475b-9d46-d03347617d64@nvidia.com>
 <ebae8ac043bbcdf6b341185c480d43a6d7b4d337.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ebae8ac043bbcdf6b341185c480d43a6d7b4d337.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: ea47be1f-1f8c-478b-fc62-08de67b209a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXQydHJ3UVpOQzNhNTVWMkpWQ1FSMkJTWlFyWnBXd0NwbmNXZWRqUlRCb2Jj?=
 =?utf-8?B?NmZpbWRUc2FrTWd5S3hhbVV2a1U0WHlHcmRZMENDT1AyTlZPRkFudEh2b0h4?=
 =?utf-8?B?d09ySjlqeXpvUlY5ZzU0M2JwOFQzUFRhdjB2ckkvb1hteS9oV2gxMG5HaFFn?=
 =?utf-8?B?REFzRmp5Y0p1MVVWaTBsTExqRVlpYWhHakozbDhDRkV2d2FxSTVwUnFHNDVP?=
 =?utf-8?B?Vm1rWFlGODFlTkx1Z2RSL1ZteG5ERU5RZGhTV1NMZFdGRkZRWi9pVGtPV042?=
 =?utf-8?B?a2hBSEkzWU5QQmJGZmloTVFnQWlrKzk5WVBJZisrNlI3eC9sWGhJdU05eGZD?=
 =?utf-8?B?S3N2aVJTb2pINXhGbFFEbEZ6VU9yMGd4TkxSWHhRNFBheWx0L1NXclRxWlVQ?=
 =?utf-8?B?UDhBQTcrN2dROS9ROE1VUGhLYjVhbUNSV3AreUJPenQ5Vm9LM0NHdFRPMUdI?=
 =?utf-8?B?MXM3RlZNdTlCWjIrQVN2ZDFaUFRjSGd5c3R2dmZqVnFqYyswVWExZlhZVzl4?=
 =?utf-8?B?RHJ5M0J5YTAwN3hlWERqYmcxbmJTZUIzYnl6dkR1RjRMd0pud3hOUEdGdEha?=
 =?utf-8?B?ZnpkZUh0ZTBHZVJ3SHdqSTlMT3pteVpEZFRhY2NqcEpTWDlJbm9YcVRJVnFX?=
 =?utf-8?B?MUlhMFh1ZHJSYTFqc3EzUHVsNFE5WHdyQlpWOXd1Smdqd0tRTWdlRXVrV2J3?=
 =?utf-8?B?b2RLbU9hSWZhRHFlNHJ4QkdVNjc5cFlCV3VhVWdXMWVYbjZTajhZOGRCdTY0?=
 =?utf-8?B?QTRRTnN0RVY5ajdKWXU0a3d4bElSaTY1WUdlNUY1RU9aSWEwZGM3NVBDRHB0?=
 =?utf-8?B?cWw0WmdrVldaTURSc3pXQ29kdUh3ZlVVV2Z4OFprSm5kQlNKVEJrTHo1YUxp?=
 =?utf-8?B?cFZkejZkODc4S0dmV3U5NFJyMmp3YVhwZnppNFRTTm1yQTQ3STBlamJ2RjZr?=
 =?utf-8?B?UVZLSFJxM2cvakFjZ01MUTlNYk41OFhIVks2K0k3YmJJMGRWUGV4K1ZrRHZl?=
 =?utf-8?B?OFdjT1RHSDczSTAvejZ0b2tsWGhGRnFOOG5qMWVPQlNDWUptclBZZ1JVdDlU?=
 =?utf-8?B?NWVLdXFFeHZ3T05aWWdUOVp4RTlhWElCRkZ5UE8vQnhvYVRoeXVEdU9ZMVVq?=
 =?utf-8?B?VStUdFVEeVNUK3RXb2UycTRvZzJLMVNhVzlBTFVqV1ZKcEdrS1lSN291WHVM?=
 =?utf-8?B?RXVUKy9ZVkJuYnkvUkgyRk4xcGFscmpBZE9MbkpyeWZYRjZGY3dlQVNPdndz?=
 =?utf-8?B?ck91TWhwTkhsWjFDZEtJTDlVSmZkaDVOQXg5UWl0VFY5V0JJWUw4UEpHWkNT?=
 =?utf-8?B?SEFPSXE2ZnNJOHlDTENYcjFlWDRpd3FtemUwQWpCdnpHd2V3cENSQzhpVHBP?=
 =?utf-8?B?cnhpa2N4TnBWVWRnaDd0dmxDd1VSVm04NzMxUkoya2dYVEV4bm9HVkl1NURz?=
 =?utf-8?B?aGo3d015ZVRTdGVFUFdOSTZpVkJKeisxVDJ4VkxYeHpqbkZxYVVrUDdDbTRK?=
 =?utf-8?B?QVpHUUkxUWV2SjBIMHQrc280OU5ENUhjYy9EeHYxZXFSR29BZ1dvYnJ2Y3dq?=
 =?utf-8?B?OFZOUEFRRHhvcytPVFB5QU1FVGx4YzhHTDhCbzJzWnluWnFVOG96Ym5XZTZL?=
 =?utf-8?B?aW5NMi93akV4RmhmWi9DUEVybHRpOFIyYkQrUzZMNVZCdXZaZlJzNGFocWFR?=
 =?utf-8?B?dS94MUtraHM5eWdUZTZDd0NLbW9kTXJRTTI4b0RTYjd1RlZwY1YvcGFzbWZi?=
 =?utf-8?B?cWFMWXdFVWhWa3A3bXNxUHR3TEs0VzhUMy83NG5pd1VqZm11THVNNlluNXU4?=
 =?utf-8?B?TEpUWTNlR3VzMlNiV1NDWjUwSFBJWVA4c05LZWczdkVvSHNiL0FORmlmZ1Q5?=
 =?utf-8?B?T1FueVc1bFY4UmdKcGZEcVVud3R2RlJ4YUQweGRlNGpRWDh5Q1Bka0Y0WTk1?=
 =?utf-8?B?SGszeTllaW13RW5iTVB5bnZBTjNHV3ZRQmt4V2F0eUZNTWdpeTZTcGEzOVE3?=
 =?utf-8?B?ZTZPamVtSGwvM05aYjh5Rmk0dkdqekNrVDR2c2RJbFpXNkpVRzNtT0RQSTl2?=
 =?utf-8?B?SzgzT0lMQVZXL0xGeGhPQmpoSmVLZTNRR2NLU0RwVXJrTnFkdkJWUiszckxi?=
 =?utf-8?Q?gTe4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnJwRVVuR0owTXlMOU41Mmg0K1kyeGVsUFlXa2E5QkVpK2JkUGlDaVozRG11?=
 =?utf-8?B?QTF1T0IvUnZIMkpNS0Z4TndoN250T1lVY3RoeWc1ZWRsc0hQcHp4RXRHbGJ1?=
 =?utf-8?B?S0J6Rmx3MVhzVG9XbVRRR0RFUXV0ZDRVZW8reGJVM0pvQ2NzSGxsQjFOb2hy?=
 =?utf-8?B?YU45ZUloRzhzRmlWZWN1am1aKzV1TW9hc1lTTno1eTFiRXdJeWVXSk1zVXZG?=
 =?utf-8?B?VCtDZ09sYTBwRHVtLzFUYk4xdElUMis0d2xpcmRTOVRrNXcwM2RneHFzeDRq?=
 =?utf-8?B?YWZFTWxnSTFjUlJiTFAxbnBYdzZ2US9HcGJoc1BDUldXRzg2WThHYk5lcDgw?=
 =?utf-8?B?QWRiR21CeGw4Um5aTzNZemg2MlFZTnJ4dnU1emFidE1vL0tCMEhPWStPQmRm?=
 =?utf-8?B?d21ROVl0U0h0dS9FM01oWEZBN0tsNlFHMVUxYmFKaW1LTmpjcS9LUGsrV3o1?=
 =?utf-8?B?NUxHenhDR1V2TnBaYUZrL1hXUHVMYmFweklrdGczam9wbWxkTnA1eEdiOGVs?=
 =?utf-8?B?bWNjd3IxdnJWQ0pETmpNVXpwRS9BZDcvT1UvVmhGbVhmQklJNXhjLy9BcmZ1?=
 =?utf-8?B?cml1YTRnMlMwM2h5NW5MdWVjUkJPV1RoTVQ5bHo2SlI3elkwZWEyaGpJOVZk?=
 =?utf-8?B?ZmF6d2trZEpUeXFvdEY2Zi9kM2dIdFpkU2NhdEFRcjFGZE92bGM1aGx1RDIr?=
 =?utf-8?B?QUdwSkVLU1hTZTgrQXdZQmpDRTg3V1RvUkZVRlJRTXloL1N4bFVoZk9PdzE4?=
 =?utf-8?B?bWM4b1ZGNTR5TzRJRDlQanlzS0Y2RmkvVC9FWVRxR2VtQktqNGpNeGM5VGZ5?=
 =?utf-8?B?c0t2TzlaWGV2WGthckNXUDIrdjFOYldSd1d2K0pKU3FCVzJmQzRFSE9HSEJE?=
 =?utf-8?B?Qmp2S0hEMjRmdEp3UTk2R2tqTjN4RDZEdHZXaGVaVnBLUUhsc2RjYUVXYTdW?=
 =?utf-8?B?MHNOSjFPb2w5elpMaXdXcmlRYWl5YnptdzNVVlRWNmhIRnBNYjN5Nlc5WFhM?=
 =?utf-8?B?aWlFOGhjcHoxU2tqTDNOMi9oVm92eU9pU2RhWTR2cFhYUk1HNG85aGcrMjZJ?=
 =?utf-8?B?Y1VxUDlXVHdtM1hnS2dFYkhTQ3hwVU5qRWYrQ2Y2aG5idkg1emxSRjBHeSs5?=
 =?utf-8?B?Y3ROdE9IR0M0WlhldlNuZjdJWDk1ZXlMcXRndFBKc0RnRk9ZRVVhZFErSFFJ?=
 =?utf-8?B?ejZJUlVZSkhzWEorNGZFTjRJbDAxODR4aFdvK0VNQ3VxbG5QNkhCS2lHK1dX?=
 =?utf-8?B?ZnNEck1IUWNIbTJtd3VnOUlkTEUzajBLSXNIR1VpbVBBREFDYS9COVdyeFQ0?=
 =?utf-8?B?VXZkSmw0MjNLOGY2UXkwT3Z0ejRvaitiVncwYUxHMnRkSFZlc3Y3RklDV2I0?=
 =?utf-8?B?UzEydjdMbStlTFZtOGQ4VERlNVVBVWRJVWVIZjNGMi9qb3hsRWM4NHV1Z0R2?=
 =?utf-8?B?YTIweUthZ1Y1RDRuNURSRVVBREVQVVhXeS9BSit5R21tMEVHdFFLSWtiUWlX?=
 =?utf-8?B?VG5zU3FPY1lPeDNnYkhjblFaWXkyQkp3TUY2T2xudDFXVGdaMXQxK3o2S011?=
 =?utf-8?B?Qi9NU09RbXM1U3ZYOEhrTHh0TkpudC9KditsbnZLN3IxeGV4TXdYWDZNMGVK?=
 =?utf-8?B?VUZiYUdleENpcFZjS3ZKNlVoajZ2QVRlN3JkaDJtWVd0UGtCZUdUcElzY0NU?=
 =?utf-8?B?SzZQOWI0WUsrZnJYWkpkVnBybU96cUxndmdVUFpuNFIzT0ZRWDdPWFByWkJ5?=
 =?utf-8?B?MWRtNzFZUnoyMnJ5dVBwOXkva1VEcEVDY1BaK0dKa2ppVUZCTW1lbTE1dDg5?=
 =?utf-8?B?VFAzKzFKZy9vd2NkMTg1N2NRZzBwRFc0bVpuck5TYjdkRFY4S3pFNzJqM3Y0?=
 =?utf-8?B?bk1mT0ZwTFBsVld4ODFUcEFtQU5QaGFzRlJETDE2QmV0S3FSV1ZBYnlRN1JT?=
 =?utf-8?B?Wkc0bEFKenFOcHdFeFV0NS9Pa3pwUlJ6YStQTXdlazlPc2taTnYyT2w1elRm?=
 =?utf-8?B?TUYxWEM5TFBoWURyaFJJQnA5SmtzVnJTZEoxYThVckhzQ1FMNXRIZUJzdlAx?=
 =?utf-8?B?UExPOG9ZczY3byt4anhSWkJlUmF0UUVTamFXd2FKdjR4QjE0enlqZ1lDMVJj?=
 =?utf-8?B?bGZiTXlZUFFUdUFZbVdUbnI4N1lyOGhxNTJ3c1Q1RXFLczc1cTBTOEZSWjVP?=
 =?utf-8?B?U0puSENmdjFjZVB3SDBVZzhVWGFMRGdGWUo1Z0pTTWtmdmlLcllBNEZnZVhU?=
 =?utf-8?B?OURlSno1Q3pUU3hBSXRPT1ZzTlV0QXJqdkdLQURCSXpQUzUxV3F3Q2ZLVy8z?=
 =?utf-8?B?bWJ1WDlBN25uWUMyeUNxNnEwUlNVa0Q1cTU4YUxTSDVHZCtySXZhZ0FnOXRv?=
 =?utf-8?Q?ddzOrUFPNsitD4tQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea47be1f-1f8c-478b-fc62-08de67b209a1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:05:50.2224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYlJq7xt5XmAPOw6t0yzuRSW+ooDumTkw371jf1tg9VMp27fe5xJ067aKU5OsozO+0iZGTcUaBvZy4a6UUDgJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342

On 2/8/26 8:24 PM, Timur Tabi wrote:
> On Sun, 2026-02-08 at 18:22 -0800, John Hubbard wrote:
>>>> Looks like you accidentally deleted the "if mbox0 != 0" test.
>>>>
>>>
>>> OK, I've added it back in for the next version:
>>> ...
>>
>> ah, *correction*, I spoke too quickly. The reason I removed any
>> such checks at some point is that they are wrong. This mailbox
>> contains the libos address after boot, not an error code.
>>
>> Open RM also does not check.
> 
> Hmmm.... I guess I'm reading the code wrong, but my understanding is that if mbox0 still
> contains the libos address, then it means that the firmware didn't boot at all.

If that were true, then I wouldn't be able to boot Ampere and Blackwell,
but they both work cleanly with this patchset.

> 
> I will double-check.

thanks,
-- 
John Hubbard


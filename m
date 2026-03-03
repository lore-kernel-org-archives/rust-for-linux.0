Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3163B2AA;
	Tue,  3 Mar 2026 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772507281; cv=fail; b=OmspxHTZaZPxQELa2IDuu3UxmxVpDm97CV9EH1l0OAmDKuqJoI6c3MjNp3ac/uiohs5DJY4egy/AzOdvP5b6VYSs7BMMzjYeMuTlsLNQI7KR1g9sQEfyn3rIebgdMANegP5/z+CLaeO8J7nX4HK4aqbHj0ZXbK+PmE+ui1UtVM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772507281; c=relaxed/simple;
	bh=/MacuQ3jcJkEx7cNkBoh34tR6hesn5TdaY9U79BzRgk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=tQX2fjfhEkmelsWSMQebPyX5CVxkiREToXkkyjmAo9i3uf+dBptf15g2N71tJMLH3YQhAEhIkfVHiZm5SCgyyxfh6anyQwJXQe8i4mICqkQUW3iMBZ20DMPLjy/tpTgLVaysng8fv1PnxJ7Iqqi6k4oUYDY4WUoqG6MEhfbzJIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NiBbCqoX; arc=fail smtp.client-ip=52.101.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NiBbCqoX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQmMCMcdwUcQzt7nuhm7qGYyY2+GlzWSAlvK5U0sA8gYXcBZlMuGptyFEk4wogqPBfE2lVZhGZtdf9GVHr79jpI1bvhvDfbHDj8jKpT4P/Kg5Q4zXI7+eO39Wjclfd28CTH3AWuUScHooFsnDZblWOCyTtlmuYqk0Zu9NY3a7S0gl58Mf9Uf9f3TzWW3kRcosIStPi41VZtDJ8bSm+entIH0u/2ZlpLRMMnoANNasDLkqH6WLuJ+kYk+UlPglvxQIiPeQjhJETZQJlTSGzTHO93f8P3GhOZZ24lNKBIi8fUbIwxcRmMPam+jjHrk+kd6pSmfEUVXMqQyXOSOrbwjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MacuQ3jcJkEx7cNkBoh34tR6hesn5TdaY9U79BzRgk=;
 b=EXi13xsLZHkJuSMrARoslQEHrkqvzGgxJi4faH/aSsMpwxgWKFL6o7owJHlDKiuF6wSBdRD82WEFP6a4buKXbF0ZowubY0kICX4FZazy67J4uXphqDQ78Sf87zUcOEVLlCnqtxmh0W2xeTnTSZpAVUZilJ7cyRDAn4dhpjTJLz260u+eOSRvfgp8T8ppDBbIZjVcFdHqOKGZ/TeJzDtup17+/QlJgUYzdZcuRIUBW5cVeVsFN68B5sHQcJtEf7178ZZJQG10It/zb4FE+dKLpKdnGuQPN+MBUi1xwvbomzfvPH9DO6fXG9nhYIx1Raq25orLUtId5gA/hPUwkPjHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MacuQ3jcJkEx7cNkBoh34tR6hesn5TdaY9U79BzRgk=;
 b=NiBbCqoXi+YiE2FkwylKnaFpX9uRkIu1wx9ru+rNL06MXgFmgu9rWY0G4pb5vQIWtAj4wAqdoxCT0A1jvVLt9FobYzeIl+/q1oSIhhxLXOBetVuuhOq2rSoICnT3ASxvkhYDZz4yOH/MUQfYGpmmR1Tj1jBltwepg883BNTTcZAkBPleWHFr+Lr4eneLkkbF64AAKmcjdrdd90fpvo2zeirDS/0hNMNbgVLcZ0FCwJ4Y2neByrIAVV/WGJrWrQG5GnjlX0rkwJ5n3pStwgICZWGv8LMNgWZ+Ppag7mF07HZ4oIPTZTAEUM27wD+m7yAAliFR0uf9A2yuXvrWR2cMhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 03:07:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 03:07:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 12:07:52 +0900
Message-Id: <DGSTDZOHHCML.2B2UJOY4LLRR2@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-2-c011f15aad58@nvidia.com>
 <DGSD13LEUEZK.DXHNXLIRVY24@garyguo.net>
In-Reply-To: <DGSD13LEUEZK.DXHNXLIRVY24@garyguo.net>
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f9223e-bfab-495b-a30a-08de78d2113f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	rGM0h5V3sB/q8Yw+4OgAzc6EXrB1zpQYvFag61jrn6F2PY95fbPaZBKoXYqug4ITe7iIX/021+Jk4qqJkFPcfyEKUCVITujR8PyVDX5BVV+Uthc/WmidMkCPrVBTd7Irx1BoCNnA2MlEkigkuGtR4fgxzeKqhpYVq72FtBJSljp5/98HexG0hdQpRnGH/Kf+R4JTia5Wx5eH3Z+f+gBD5CYnB1Zj2Xwe8TQk2wjljCwujfa+kjde5lM7ecAW8c7sPjlEpZ6rA5orfc8V+g4v4Q/v8AyUTfNatB3Zc9BRoCjIwUQOarx6kcIspWF07byQwKoK/HBaXhz4M80TfhsgR/UuNwJNXpiEf4XkBXBmrDkMnLqD6SXGImaWuF4KokA0TlhkX6E/MIBQYuTn3xfaMkx8Z5mwlMfaEyEWjxVItHlx4A9nxRmRetsRAKduhJlXdoK6GdJ/5SRk1sAWOx9cLVEv0nhCpftsp6t5mgVj87MLr5bmfuS55EKD35mz2px8FyzRrMJeton585nc+YL5PhEgmfZ+/JB5mfSEetrYabIxzHBvVcMu6p+WTjydBLSduSM1wHVtSO0VZzyVWDYJCmpMmxBl0z9JR3dD7crAf+9aQzraLy40qIS2L4gE2gvGHAZM0INZkVm2lJI/qXksvJRBr4mP/9ahvLBebx75hAvTRFF9i/aqFuWWSd93RJ5U4ZUwJWG5RuaKMKezxqk1b4lHs3Vui9L3D6hn96zAMYsjRNsgNE5Acrz8I3HuEp3GZ8FtnZZviWcMQNYZCIIp6nIhNt2VgIZwijsQjp9wYeo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjZhZlJQR0V3ZXl2ODM0dTBDaHRyRFQwOUpHUHVEbHE1ZTJ2OHBCV3FmbENm?=
 =?utf-8?B?bDVYLy9oaUEyb3VnWVVZSTBxblFYU0lISmZHTDVDWHFZT0YwWTFmLzF1MnBH?=
 =?utf-8?B?cUN3RklFRnNNVVNob29VMEtJWVl4c1ZMYkxZaGpJdnd5WFk2WXlpTVIrSFdp?=
 =?utf-8?B?TUIyNldNQWVpRlFjazBDVVdScTMxSzFyMTUvNzJpNVUwYjBZL2RrV3cvaStE?=
 =?utf-8?B?eVZiRXhQakw0ckVVYm9qUW9LOS91bjlTcWNZcWVKczFwdWphRENtK0FxSzFh?=
 =?utf-8?B?bTB2SVY2QUJ3OGV0Qm45YmxBdlRJYmJTNmlxTFhmRTh0c0tMb2E3c1BVSnda?=
 =?utf-8?B?SUErYit4c0Q5SUVPaTV0QUQrV2h1Z3lUbE9yeHArc1EzcmJheStTbFZwREEw?=
 =?utf-8?B?K0lQTW1xNUxMM0hLZzMxWVE3ZS9EM1lBTDEyN3hKS1pHSjNIdUJoSm5DYVU1?=
 =?utf-8?B?YkU1dThXSElXY0Q3VWRlaFNOY1pWY1BPMVQrUU5qM3VkZG9jeWdGcTNHTVNz?=
 =?utf-8?B?dXVwbzJXUnhja1hJY2d4MXhOV0VjWG5Zd0o1MSt2KzZIU1VhSG1GUE50RGVJ?=
 =?utf-8?B?MDVyRVErWGtKcmZ5a0poaTRzZFpTbnk4VzRSUDdKcDYyb09yVEM3bTV4MFhk?=
 =?utf-8?B?SC9ad1VndEhiTFBpTTcxR3B3KzE3UXM2RndqaXlVejZSWUptcXIrU3lNSDFJ?=
 =?utf-8?B?RUNDcUFBR3RXQ25BQjVSaDRLZG9XdktxTTRtNU8xOGhKVW5uWFpUM2JNY2xl?=
 =?utf-8?B?aFI4bngxTHdwdlIrM0h1MVZ5cjd3dEFyeGdNbGtiUTVXZWxDeCtVMTF2R2wy?=
 =?utf-8?B?STRoL3F4TGdvMHc5elJZcTFvaGhYdHNycHM5eDdEMkVlb01QTExGTEFTT3Zh?=
 =?utf-8?B?aGtVZUVaRHdLenRPQ0lBcCtkeEdMdGFKdUJqUHQzVmg4WWtaNmFRNUc2SEYz?=
 =?utf-8?B?bW5qY3hjVmJEcitjRFBPOFVHWHYxd0xRWWhyeklMMTdHMGxvZDQyd3NDd2tZ?=
 =?utf-8?B?VWFlNVNjaTBZdUFBckhRR3FOSVMybDc4dCtGNURtSkZqUmRqaElmanpuVUtD?=
 =?utf-8?B?dUtUcFNRMlZZcysvSDhpWVVDNmtjbFpyNk9hbmFZcnMvbC9uZmM3TUpha3ZJ?=
 =?utf-8?B?YTlVMFY5bXFaeGNSSExyd0NPNTBCdjkvWVVOTHovMVVJeVhUT3JuVWhFcm1E?=
 =?utf-8?B?M2ZGZ0hESkF0c3JQblhUbmlVZE1ZaHhnK0RucEhkVWxodzJiWjlOVjhNc0RL?=
 =?utf-8?B?WDhDeUxQMzN6T2xTZDR0RWd1eVpLWXMwYU84cnc3RnZWYXhYY0dSWGp3djhs?=
 =?utf-8?B?N2o3OGtRWXpOVzluTU9UQnFIVlBVYXlHYkNoTDdDTlZjT0haK2s4YXZkZ2lz?=
 =?utf-8?B?UVhYOHdQd0FFWXhJcUpBSmoycnd6SU1mUkU3SXE0MzM2SkhzVTl3bVI0TlYx?=
 =?utf-8?B?MHlxeFh2MFRmMnpRaHhqdm54ZGh2ZFFyVkErMEIxY2h1dkFOU1NiR2ROcjVn?=
 =?utf-8?B?M0luR3ZVbGJpdDJXRVVBK0xIbzVWZkVid0RjcHR0aW9ydE5MNlZkMWc5bEF5?=
 =?utf-8?B?dmRKVlIyMXYzUkpJZVUvTGwxdTNJWDh6MjlmTEJndTBoSVZiaGhYcENrM1B6?=
 =?utf-8?B?cVpHZ3pmS0Z2eVZhNks3QU5McDZxc0lzK3J2c1NFbjd3UnhNY2ZxZXhZWk1S?=
 =?utf-8?B?ZWlXY3hPSGEwTmltVXBzamMyNVlKdkNpTHUvYVFwdEVNamlDWHByVUFuRUN2?=
 =?utf-8?B?ZVRRV1paaUpablowQ2U2OEJtOElMQ2lLdnFZZ3puUXJJWEFCenVwbHBDYWRY?=
 =?utf-8?B?L2Ereks3NC8vOUNSdzZwOSt5UUdjTEtIcDB1cTZpbEVnSkszV0doM1hzbCta?=
 =?utf-8?B?NGJPU1I1a0xZUnlOR2tadEFrc2I0am1LbDNNS2JodGl1ZWV6OTNRMW1pVENF?=
 =?utf-8?B?SENUZWFSYUVLQjIxalJ3OGhITmIwQUJMVm1NZFUvMFYrWDJPbXZwYlkzWTRG?=
 =?utf-8?B?VU81WC8vd001aytYNzNzekFjZk5pWlZoeGVzdHZBZ1p5ZDRYZWZFa0Z4V0Zm?=
 =?utf-8?B?d0x2NlgyMW1kVXl6Q1lPZTFjSms3TjNsdjc5WUd2ekh1NDgrNGdKdlJiQzF1?=
 =?utf-8?B?K2VPMGxsTFVOVSs0MG5ZSTJZVnNGN3pWam1pbWlwTHBEanp4VE1ncW55bWlU?=
 =?utf-8?B?dUJuUGtkdDF0b01NZDRnSkVwTEhSQmYrNkt0cEl3ZHpKR1ZPUDRBeUNJQW1z?=
 =?utf-8?B?bUIrb3prM1JOUmJDcytzcjYrY1hjY3Zrbk15em13ekQ3bFpBUlI2Z29tZHNh?=
 =?utf-8?B?bUNOSmRWUzdHK1djV2JRbFltS3NSSlE2OTlKSFBuQ0hVK1hCUGdEcnZOaUUz?=
 =?utf-8?Q?D3ygfGaReIsR0seAbFb7MEhfa2TJdod3VRtJuzZ8WFJHw?=
X-MS-Exchange-AntiSpam-MessageData-1: joCYu0f/hciFvQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f9223e-bfab-495b-a30a-08de78d2113f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:07:56.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OIqPBFJlmFU5v0GdoK9KnK6ptPVCvgLXPOdVCM1BRxqdy1WLftRTh+3jAzbIV99hy/CJB/sgBdRMUfr6KPWHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067

On Mon Mar 2, 2026 at 11:18 PM JST, Gary Guo wrote:
> On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
>> Add a timeout to `allocate_command` which waits for space on the GSP
>> command queue. It uses a similar timeout to nouveau.
>>
>> This lets `send_command` wait for space to free up in the command queue.
>> This is required to support continuation records which can fill up the
>> queue.
>
> Any reason that this isn't implemented as a `poll_allocate_command` which=
 just
> returns a `EAGAIN`, and then a wrapper function that just waits for space=
 to be
> ready when it got one? This way the logic is cleaner.

This kind of structure is what I originally did (see=20
https://lore.kernel.org/all/DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com/)
although it wasn't quite as nice since `allocate_command` takes
&mut self and isn't callable from `read_poll_timeout`. Alex suggested
merging these into one as it simplifies a few things. But maybe I am
missing some better way to do it.

Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A7F50F;
	Sat, 24 Jan 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769218740; cv=fail; b=EmtDGWjhicvkOVKL2NhgapkDi+Cx7JAb/R70QVU6bBjcTWaovlJgizNGg+9d5OwssyNYqR/0uhr9NdFxowqGlfpP4J7f628eI+MKFrEpSxfwOBVy1ECpZas+OLNb1BZExc2MVOfkJU46jqVCW7mVd4YZ+lOQjw07Jroo+JWD/mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769218740; c=relaxed/simple;
	bh=naa8uh9kGysRtV6RLe8HASeK4LnCmKR5jxpDj0HMXzY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eKGpfx2FM+ldaFZwQsBR6DvNbVcuhCyKFyeiCF75hMm7COBt0gYAVxxrkCcxw9VsmjFnx2qaDReaS42jZJg2udF/cs2A1MXOHQAzGY7x1MYfV77jfn3hgnS2W/0odX69I/+fX0puVq/nN9v63wEXYPfcsk9nI0MInxx1FXQ2i1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zy5KAMZd; arc=fail smtp.client-ip=52.101.61.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zy5KAMZd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+COQTJcTnCTSCQVh9wWmvORuwgLs6QuDbXDoM7ZyP9jYUryeabEeu0O010kYYzijSF+xaIAX3gInCX2oXOElRH6VFzBW+C7qKrR87S5vk1oqWpXtN6s2clzNucvQqA+153lDXSBmh+XqTM4pSCqycVUpmETCUOmHEXOlBhh4BS8wnH3QXWgpADsr7twOtJc3tzZsWOFb8Zib4ajeZpaC+vKCKSKVVk5knPZSGeeHZpZwN0iU2/HaHOciQmvzvYjGSS9iyyde61Sj5UEsu5+wVpbEVD3M9BHzjdlfYI9m9JvJn3nSRDbzgcw38Gdxx4/CC6FQoXHGQYBKDwZ2dR9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zfv1DWQI6HPett6zM5qmZ6Mw7LGxi3Y0JmU5pFE8Ghk=;
 b=kQWL2TsI7IhLkJuMuDsaJLx5PjIcbVs4LPpCiPe/F1vGgR7d1qonWoSm+xCoddMRH5D7SwlhsToe3fcJKzUVnkk9MMCGYpieC368v9b7cyEZXLjUD1IHkbBSNECUiV0BtSFkWfISjWhOhCvTy49dNqZpZCOxH1BgZM+NaboKDh0KW/0zbti5PPDSXM0zNQca1MI26tqmCven3K7BF2BKIIcUO+hLF4w2ulzx8riuAZIAB8qUam1mrKjB+OfvDF2yu9pm5qNdVloYx0p9FFs1Sntt36YzZfcuP50Bk6QL1tbETbEPriCgmoB0xDpJGVBpP18PVUGArshfQnGM4CZjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zfv1DWQI6HPett6zM5qmZ6Mw7LGxi3Y0JmU5pFE8Ghk=;
 b=Zy5KAMZdgncs29mqBxoOEXR7h7uRyYqVxEujip32VU9SUYDZ0C7cFV5dxVyV+LJKraOmpk/Qgrk+0UQvy/8WkW+cxbt800s8ezTCWcp/9Z8Uocvl8M4vlRZTyI2rPyNsYxOs+5zQ9QZDa/OG/yNuT6cgpDtWTaLVeug2gLbNzN+aFfIPYIseQUKf+pbwcHS13rcZ5ZD3ghkKrtL7kW2rZ2Ogb8yZF1XIvRaxyPFPJCxDgZ3bI6h0+qH80NK4cgxiUfnmIlBOqAh2ZHb/PMk29qvah8tIeCt3T/SgatwO/tHgx1l/T6t2Fa0SfGVbdYyD1CnSS0kMq7RghV7QX/NZeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS5PPFC9877909A.namprd12.prod.outlook.com (2603:10b6:f:fc00::661) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Sat, 24 Jan
 2026 01:38:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 01:38:55 +0000
Message-ID: <01b59562-9d90-459a-905d-56de1bc05433@nvidia.com>
Date: Fri, 23 Jan 2026 17:38:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot path
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-30-jhubbard@nvidia.com>
 <DFUEWBKOLFQ1.3NSTFO4L97503@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUEWBKOLFQ1.3NSTFO4L97503@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS5PPFC9877909A:EE_
X-MS-Office365-Filtering-Correlation-Id: 0980ac45-7b10-4036-0662-08de5ae95666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDdBYXdnTzFBOTRSK2liK0hUdmlMUHRhNXZNZWUyRE9xZGtPNDg5REwzVjZZ?=
 =?utf-8?B?ZGRVRkUzNUMvZ3JMSlNkUXB6bk8reUNTT29HbUVURG1nVWlQVUZjaUFnQUx5?=
 =?utf-8?B?SDdaUUo3OVdNdmNlNjJtRG5Sa21NaHR2Mm1Va2lZMCtZL3dlMGk3dVRwQ2JH?=
 =?utf-8?B?TmV3MWVSSWVNeDF6TVE2N1BLUndVb0NNQjhJWWpnM1RwWk00Qjh4TVFuYzZP?=
 =?utf-8?B?Nng3djFQTVdDdllaNEYvbHRKa0pUeVU4WDZhMHBUa2pHK1F2NWc2N3RsWGJM?=
 =?utf-8?B?b0o4VjhVN3BmakpEWEZFcHJvZXM3cEJyYUdNQktlUUNsbk5UdzNBa0VNNU01?=
 =?utf-8?B?RzNnU3VKS0VTb0s2NEVDR1FJSUc0ZFZrWm5JbjV5R3p1MW1wb0xNRjdkOXZS?=
 =?utf-8?B?TEZ0NjltSUdoR0NQa2h0QjFLLzFtMDVLTjlrV1Z5UmZIU3JVQXhsSzBqOWhL?=
 =?utf-8?B?NTNDc3VxRXZEbm9ya09KSGhTdStwU1k5aTNiVDJQdnp6T0xFamV2NHVJTFhF?=
 =?utf-8?B?aTZIUGswQnV2ZzNldk8xanNpd0J3V0RDMnh1KzlWNWRrRnYwa0VLeUswNXIw?=
 =?utf-8?B?c0pJU0FZK09rWnNKemxzWEZPM0RZdHNyc05jTkwvMmRtRHBQRS9SRzRYTUwz?=
 =?utf-8?B?TUxUcWZaSG9GZjZ1L2xLSWs5ZktmejNpREViTWdSNWtWQWZGN1pyeFBNY2hG?=
 =?utf-8?B?VXJDRGd2bEhJVHA1VmdVQ09zNDhoOHMvN0V2SmdBai8ycWZVM21oZWZzZ2x4?=
 =?utf-8?B?b1hNZGY3V09TbWxQbzdUa1FHZjRUUjVTR0Jhb3NnNDM4UlF0SkM1MGhKVGFR?=
 =?utf-8?B?NEx0TklrQ0piNHk3UndrTXFEOHBDTGFUMVNLN3pGRE9aVExRN21jQkJ5cCtn?=
 =?utf-8?B?YkhrK1JQc0gzSUdCcVhlQndMU3JFdmJVTjllYzdqYUFDQjZmbEJFTUgrZksy?=
 =?utf-8?B?VUNWUXI2VFFBN3lCTzFRc2d4V0FoemVVOThlUXg1VVVjSGJ0WmloalVERy9T?=
 =?utf-8?B?SHVLMWlWaUs4UnVaN3EvL3M3RXY5b0dkU05EY2ovV3kzQ01aaEtBRXMreFMy?=
 =?utf-8?B?Z0xpZmRRS0oyYU8zRjFhU1Y1RVRXZDkzc2NlNnk3dWdTdndRMDk3QkxYQ05u?=
 =?utf-8?B?N2tIdHlDK0dRbkNLdVFWdFNKNTZhU3NHN3U2ZDR1NlNnVVZqa3VKNzVGcjFo?=
 =?utf-8?B?dXJ6bTJXb1BsSHI1dnhLeUVNQitwc2JWeGV0dmd5cWZEQ3l3V1Mya2hhMUFh?=
 =?utf-8?B?ZUxXYUZTdFRnOFRibXdZNUVpWEFFRnNVMWZyclV5Q3Q3N1hqQ1FSYWJqdVcy?=
 =?utf-8?B?QmJ3aXJPSWNvZGF3TlBYS2VMdU8wZHJ1bitSVk5lVjJQUTloQmNiUUdMeTYy?=
 =?utf-8?B?cDhkYllJczlyVTNweFhFNkdCUEgvbmtySlp2RFRHZjlacmhqR3BtMDlVazhR?=
 =?utf-8?B?LzE2eGZ2V2xPYVd3OU4xVXBteGJvQzQ4ZnN4SVFZaHNmYmVKb2VYRDBLU1pM?=
 =?utf-8?B?Sys4anY0L1FkdXZaeDdWbEhYem1WMHZvdzFkWUw5cDNKcytEVytleHpSTGxX?=
 =?utf-8?B?cS9NcHMyYjQ3L0FKYVRwMmluOW5NeWx0bCtacURBMmVpRWROd0h2MUZhOW9I?=
 =?utf-8?B?Zkt6WW1ZN1NHZ015aDBCeEMwa2Z5SDRvVGh1QjVLSU1HQzMrSk5hZWZ1Sm9v?=
 =?utf-8?B?bzlWZVBHaFhlcGNlVDdiSGZYZE1xQUlhYnpVYTBxaDNXT254RElvMlQ0QW02?=
 =?utf-8?B?M1BBaGVKb2ppQk9TM3dzeEN1VXpNNzFTVzlLNm1WRVVCUTdpZzB0b3FKZkYz?=
 =?utf-8?B?R1p2cjY3TThGRVdrSmZ4R1NmNzlHR0Yvc0lFcmRlVTVrZHAxZDdKamNrbWYz?=
 =?utf-8?B?bUw5S0hnWmsvd3FEbGVLNWtLVU0zZnlXTUY4d3RaMUtOYWtybk92TnZWeFVO?=
 =?utf-8?B?YWpUckR4M2NNeGhXOGZ5Nko4RmpURTRoUVhrbHMvcEpXdkdZeWRtMkZLeEU2?=
 =?utf-8?B?NnFVOFRyWERuU3hheURZQ2dSQXdkOGhZMnBNeUNoRmJFRkhLa0VuR2lJTm1a?=
 =?utf-8?B?em9MeStxVXVZVmxjSGFnUEZqam5YdTRxYmpBaHNhbmc3YUk5NVh6aFViTFE1?=
 =?utf-8?Q?uiWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFlBSlNNNWhVTjNmL0JTT0dNUXR3dHNYb1d5c2s1L2xsU21ZNW1zalBPbVpa?=
 =?utf-8?B?VWN1OWVNTlZLRGlaRTVyMW1iZUdrYTdnN3ByelpzMjFhSkhCa05OMUNPWXdJ?=
 =?utf-8?B?d081YVZiSnBraDJrYzNiSXZ6ak1FUmo0OUZhQWlnZ3FoSWFGTUNBSDI3YlJ2?=
 =?utf-8?B?UmI4WlRuTEdpOEgrdzlxSWMvQitLWGdlVFJUNGRMWDdrWk1uT25vaGpGb0lo?=
 =?utf-8?B?aEhVZmVpNjNXakxjdXY2NWRSdTlxS1lRZW1hSTRsS1ZLajRULzQ1R2V4NktS?=
 =?utf-8?B?bnF0U2E2c3dOM2JneTFvekh1Mng4S3N4N2lWaGNDYnhtNGw5cU5XbHNKYlAr?=
 =?utf-8?B?bnNvcHBOSWVvTUZhcUJscy9lb0R0OHU4ZS9hSWFFWG4waUFpUG9TL3pDNld0?=
 =?utf-8?B?ZW9vYjlpNXdlaUpiN0JnRXJZQjZTNkxhRHV3T2kzZjdmUWxqRkxEcHFQSDJN?=
 =?utf-8?B?ZmU4cUpaSXJoTm9tODE4U20wQTdJdFo4UG5qUVhBQjJtODFmUlNybUw2U3hz?=
 =?utf-8?B?UkkxU0NYWUFlekZNVnVSMWtNMkh2Ui9YVDB6M2FQb3YzUThpbXl5MVNXcE1j?=
 =?utf-8?B?ZTFoYVpuRHNBQXRDOStrL00rckg2NkxFa3NncDl4N2Z2M3FNQXowbEo5S21K?=
 =?utf-8?B?eXZxUkpNMDNqcW9RWFo0TE15YXNhK1pvOXVTZno4cEtqUnFDZ1VWNVBkZVRT?=
 =?utf-8?B?enlDaWdLVXc3ZkhkZFVabTEzQTNvcG9mQmVZQmEzdFlvbjlvdDNNN25vWTg0?=
 =?utf-8?B?b0xySmxPei9PN3I0cUVxcUJwUnNEMU9zKzJFL2R5dTlTbHJ3RXpMeEhHZGVl?=
 =?utf-8?B?S0svb0MxRndqUW85NE9Pc3dhcGZqSXI5SmJYOFd5dk9rYmdJdEhkUjJhRDBy?=
 =?utf-8?B?OGhldXFOa0xwbk9naUhXTHVJVldkT0QrTWlFcXFhL0Fnblc1bVpMLzhLYVpU?=
 =?utf-8?B?Ym9icHN0WnpUUFBIZmN0QWtVL2tmMVdJS1ExdXk4SnZxandiQ1MyOGZkNUIv?=
 =?utf-8?B?S1ZXcnk1UUpGK25adCs1NGNoaUxvb1pxL0FkY0pOcnNocHN5WTlsNlpqMld1?=
 =?utf-8?B?WG1wdVBHOWEydlpFNGVFSEtPUlRjeUlxMC9rWHd4R2U2eGllc2FjdVYyQXVk?=
 =?utf-8?B?MVZ4V3FDSEhoZ0p0cjA3Snp2SEpRSDI2RElDSjRaZjE4czhnWW81VTFSbWYr?=
 =?utf-8?B?Njc5RCtmU2FIM254Szl6MXlGcHVmeDI0U1UvTUxtNHZOYzJhZEVnTGpobXdv?=
 =?utf-8?B?MTJMZXppYzErTDQzWG5qaXkyODY2bE81QWxvb0NQVk1LZjB3M2NpcFFrWDdC?=
 =?utf-8?B?RGVYWjA1RVQwb0dLTnUzZHB0TXhJNlU1cHpnbTlrUW1TcXplbnRLRWVlQk14?=
 =?utf-8?B?L3RXTHhaQTkvWDJ6eERLT2FNZ05xN25pSng1ejFsMEpiZm1UaXY1TzdoaHF4?=
 =?utf-8?B?aWhRQm1lcjM1Y3ovL2FsYlpudFViaFZ5bjBFaDlqRE9uQ3hSa1VqRkFnYU9O?=
 =?utf-8?B?dmhWc3pSRllaQ0NrUDU3cWR5bFcyZklrODVMdVFEWVNSYXZjbEp3bzRRRTc2?=
 =?utf-8?B?aWMzZENmTWNtck9FOEFZRmx4VmVPYUQrbWxocDdhbmRhQ3BIUzc0c0ZsVElF?=
 =?utf-8?B?WGJmL1E3WkgyV2hQSmJXbzhIbHBwVVFFSjVLRVdNUWxDZVBOazBXVm9hK2hK?=
 =?utf-8?B?c3hVcTVNUk5sUFpLS1RYZmtxUmh6cWlKakp6UlRtMVJmd0hSaldXeWJqVFo4?=
 =?utf-8?B?UjZ1Z1pjN1lLR1gzZlk4bEhMMEdtYWEzMHpZNHVFbWlrc1dtYW9DNjNGQ1Ax?=
 =?utf-8?B?OGdVZUZ0NlhNcnNHT0phc0x0V2RzNXdxOXFVTWJzSy9QMVd1N2YzKzFXeFRZ?=
 =?utf-8?B?d2lPL09MQWxVWXVHYUpzcnErVlU2Z09NNnBkQnhOQk9ZeDJONFRnejA2QVBa?=
 =?utf-8?B?azFSbE9FdXRKV3E1SlF2OUpFb2grRFZlTHE1VDVNZGRQT0V1Y29JWE9kdGJX?=
 =?utf-8?B?Y0ZobEJMTW9RYXEwbTBhN3pDUkU2RTI4L0YyUjBWR3RmQUlPclpBemdROUFx?=
 =?utf-8?B?blBiSGErdkRkTUxrY0dzNmdBUFdwSmhxOWhydzVYRjFEUERXMHQrQzUwZ2Rx?=
 =?utf-8?B?Sk02OWxtanZ4V2RZV00zaWx5N2xCZlBEcCsyU0NJT3hhL28rZHV5akttaHMz?=
 =?utf-8?B?L2VGMk05QVZBajM4YS93KzZlVWhNS0NUM2pURC81ZTlZamFvOHVhdTVyeXZW?=
 =?utf-8?B?U0Fyd3BySVdmWU51L0ZYYVgvMFNmOHhpcmdNYWU4RW9jc3JWK1lzK29qNzQv?=
 =?utf-8?B?MTJ1YzRpYTZ3elYwdEw4SlNGcHN1Wm5qUVE3TDJ6bXBoRi9hN1dDdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0980ac45-7b10-4036-0662-08de5ae95666
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 01:38:55.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /m/u2W6MvdbSePcn/1xVh52FmZwOvhvDCUUqs0wCyAG6NdOEwpk0odxPpt+1I7DSNcx3iEnVQEEOn0UJQN1GVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC9877909A

On 1/21/26 8:35 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
>> +        // SAFETY: fmc_full is a valid DmaObject with a contiguous allocation of size() bytes
>> +        // starting at start_ptr(). The slice is only used for signature extraction within this
>> +        // function scope while fsp_fw remains valid.
>> +        let fmc_full_data = unsafe {
>> +            core::slice::from_raw_parts(fsp_fw.fmc_full.start_ptr(), fsp_fw.fmc_full.size())
>> +        };
> 
> The justification is week because it does not mention about the non-race nature
> of this, which need to be justified for a DMA allocation. If you use
> `CoherentAllocation::as_slice`, then this requirement would be obvious.
> 
> For example:
> 
>     // SAFETY: the dma buffer is not yet submitted too hardware and we are the
>     // unique owner at this point.
>     let fmc_full_data = unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.fmc_full.size()) };
 
I see. OK, after a lot of fussing over the wording, I'm have come up
with this, which might be much too wordy? I'm not sure.

    // SAFETY: fmc_full, which contains the complete FMC ELF file, is never submitted to
    // hardware, so it is safe from hardware-software races. And we are the unique owner of
    // fsp_fw (and therefore of fsp_fw.fmc_full). (A separate buffer, fsp_fw.fmc_image, is what
    // gets submitted to the hardware).
 

thanks,
-- 
John Hubbard


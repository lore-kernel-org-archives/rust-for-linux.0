Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB90A945;
	Sat, 24 Jan 2026 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769218998; cv=fail; b=e1xasDcGczvaZBhJgD3wE5g/2wpgTJl78R4q0TX/JzCBYR3EuAd7V1ESdPCGWVtX+YwdcBx9mV+FGNjn0mvc7bSCRMcSZqtY8P2y2cCkFWHaGi4XAXEJB9BTqGXKhnAJ69u/ynBew+EtdCEA02JSuC9u3eQlFIVQnqtBaDw1PNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769218998; c=relaxed/simple;
	bh=4nJBHxSGJLNXzteqv6MJ1DH1yIUMUxyTfXBKUo6gH1c=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SmzhHl70MK4MAGzWz8zEw6pYJD3oMpzvasAS1o4MKxUyX86FTxO64k+jPIaVHXmtoSibwm5n2puM9WxD0dm2KwFAA38sZuwSaS3Vg7becCjZ/4ndYqEF56hWoReKKaZuZ9oSruvnjqdyJ6uvgCftGfvnM/QesF3GTCRYteyqMsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k0KluB/b; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k0KluB/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl8pgnQ2Z6lxfFfpHm4gm01gXZsGxov+EX6j6fWvKls0C+LxCMiDf2LvFvwvP22ra8r2D/d+vKbwJRMdMuqG6bTfzzpfen2VoaIZ/g4DMQOIRhpvRk4e5kIHrx9/V4GYH6CZposZ9YiEnrig5FR4B/tCe3YFWu1lMNjUNadKkBLcBVMroDv0w0uYN7YubmhTqwZvIfwQNNG3e5JWJsTKmSm9EhepDYSyprAkzf5jSxQhKBCB0iwjLUGuVOR9oRuqMdADaABBCjLvYz11BGqc4qKMzLCUmSlZjbTfadkkNQTrdEk7PxwSLFI0ICZdbM8sKpMGf7Id62EiCn3uoRksHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fCSwTAtIoWmX2V5zPd6j+HkhyCrc2to2sxHG4aQhT0=;
 b=h0WErFjRsILxVPgYbFKrzM1wex4Fy6bygDeWlqVufpAtKRsMhdTpW0OP4cCjfw7nZWD5h/dIM6uyA2GpAVQcPzACIyJdLEBZBY27yJ1LNczs/pcqcpUPy5YYrR5VRVUnavYvOCouqRyhnXLh27DdrKqu+oHjspHFoZv5SbPqDHn4EiuHNlcTiXmma9anuVqUquttqJGx9h6fhufeHKYUGaFv0mSDXquf3sOC/TR8ijulH79D2Qu2xuPDgyj/xykucBHk84Ght9IIwk7NLRY7w8e1bX2SSXxVp5WIy3x0XCFiTQ/FxQPR7fKIiqOI3U68kW6ySN+Xo9cBdsNxx/jKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fCSwTAtIoWmX2V5zPd6j+HkhyCrc2to2sxHG4aQhT0=;
 b=k0KluB/bF+86FtmGL1aFGuyirAQqZb8iH1JwBI+7rxFeCKT0wOyxgQZNmYRDuNTGmMbYoquMtRI+myhI4tHR6RtgmQbVM0Y7ozqC50MxVypGsg35rbjnnHoyYRHy/Yd7njrUPYPROVEWiRUi99nzO0eDPR49SmiQCpPlUWmhU6fdPpRFVu5qJYvycZkBJyGn7cI6izcZM/vPHdBKFJi2mRs+on/9wyCeTlmdShKvLTp/x7jTxfKqExJa9eEn8o66x1Jh5/u6TzwaiaSbF7Rktb5yUFFCq/P0vKOWfCFt/sGbbb+HopVafXQcTgAOkCGY/G14DMp1FKGmAAbZmagDcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Sat, 24 Jan 2026 01:43:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 01:43:09 +0000
Message-ID: <f85c4bb9-2fb0-4dfc-9a07-992762df0822@nvidia.com>
Date: Fri, 23 Jan 2026 17:42:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot path
From: John Hubbard <jhubbard@nvidia.com>
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
 <01b59562-9d90-459a-905d-56de1bc05433@nvidia.com>
Content-Language: en-US
In-Reply-To: <01b59562-9d90-459a-905d-56de1bc05433@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 419a840d-1084-4137-de6f-08de5ae9ed64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjVRZUkrendseStpcVc2cDgwcEVwN1dpdkJmL0VNNUx5T2YyVEw3SzU3YVhC?=
 =?utf-8?B?N2s1ajd6anZ4dzd4VTB4Nk9SK1RIemZzNjFvekVWK2N3SWdvOVpGMDA5SG1k?=
 =?utf-8?B?d0RwTjNxcTRweXpSZmF2d0lxdU15SUlqRGNwUlZXbU1VT1FIemJqdEFvdEVW?=
 =?utf-8?B?R21PODdNRzdZcFpXdUV3VC9rd3A5VS8vZWNMUW1VMmRTNGhvR25CUURWaWQ4?=
 =?utf-8?B?cDhlWGUxejNrSTNnZXR3bTlERG5sQnQ3ZFNFbUVUUkF3bGlDVU9GcUttRGs5?=
 =?utf-8?B?dUpWQXltNDBVZVV2MWdyUG44MHBWSDlFNXlXenFIOEFWRitzcDFwenc5MjF4?=
 =?utf-8?B?OGRxWHVSeTV6VCt6UjQ2OFhQbG54NDZ2MXBpT2JFNnY3Z1ZKd3NBSG5ZL1Nn?=
 =?utf-8?B?OVIyWFpDVzh5Um5QZno2MEZWV1hwV0oycHRYQlpRcy9iN05VWVBzdnBHNHND?=
 =?utf-8?B?cjA2L2prQkVpdjQ4SHUraHdLUHJib2RldnZFSGRGSlBFQUlzenhyUkRpNGFi?=
 =?utf-8?B?QnZUNGtlSFVPQkhKanRuNlVRbEJXc2xPMUxLNlVoR3QvbVY4QVkzaThKRGZK?=
 =?utf-8?B?L0J4RG5Ta2JxSlZzQnhDcGY0dVhwR3hoYWI5L1hsQWY5OU83aDRhZFY3alEw?=
 =?utf-8?B?YUFRMy9UdzVIR3U4OGg4ZFJvcksxakVxc0RLSkxxWGZJN29jTmY3YmJFTzBJ?=
 =?utf-8?B?eEJ4ZEVYTVpLK0R5UStYRWJwZG02dnFsTUpJdi9ibDRldjdrTTk1Nm1ITWQz?=
 =?utf-8?B?aVJMbFplT0xiQTFmcXM2OFl0YzlSZlZETEQ5Uk4yVkFTV1hqVVM5aWl4T1c4?=
 =?utf-8?B?UExxeld0V0g5RlloVUU0c2RXaVZQSWZkeWNERDNsSVZ0eGdQdnhhTXRVazF1?=
 =?utf-8?B?dDgwU3dzS0pQdWo5aUhNcWZsRnIxUGNRelRNRHBaVVBNTjlzZGhjL3B5WDdV?=
 =?utf-8?B?dkdOSnZRMWJRRld0cW5GWE5iT0ZnLzM2dVZlcUtFeEVNc1dIVE1QWFRTYTY4?=
 =?utf-8?B?VnFZdjJYVTVMSjdHaVJqbGFQL01FUUREVU9JWlgrbmh6MkdJcjZvMnN0bG1F?=
 =?utf-8?B?eUQ5ekFHNXhaVVgrMHhzeHpYc2lQeGRpNStUT1BMbldxcm5xNUhvbFQ2cnpn?=
 =?utf-8?B?Sm9pWThQYTBWK1RldjdDQkt5VjdtNjFvOTAwY1lKTG9aRE9yQldaU1k5VzFy?=
 =?utf-8?B?RDRURFpHdldQRFVwc2NVSkt3WlJ2RGpzVHBBa2hHUHR5emF6Z0lhRVVEdmF3?=
 =?utf-8?B?SkgzN3huWWh2TUFvdVduOWRxb01oUERDM1dCK0thbHM0SVNncUgydHRqY0dY?=
 =?utf-8?B?VGx5Z3hXQXJyS2xneGI5bG5kTTQ3VExIRXphLzJqeHdpaURtU245cnVLVXVk?=
 =?utf-8?B?NkQyd3l1SlEwK3F5WXorMzNGVWZMbWFvQlkvM2N3ZUgyTGYwc29mUE5lQ0xF?=
 =?utf-8?B?Mk81RExBSHB1c3h5Qm56cWZhS1k2T0lGSkppbllVVXJYdHYvK3pLZkhyUk42?=
 =?utf-8?B?RzBvTUl6NURzSlhWZWFqWWVqK3JkbDhqUU1vdzNhbkdydngvaGh6NS9RbFFN?=
 =?utf-8?B?WkVtZkswTnlCYlEzNDU1UGZRUmR6QjRMRXkwVGplK2VGeUF5UWdIRTY3dHUv?=
 =?utf-8?B?bkFCbnhiWjZmZHF5WDZmWUJ1U1N0c3JaTWdZYlpmWDVBbDdRRzJWMmhaWXVQ?=
 =?utf-8?B?bFhSL3JFbHVkOG5uMytOdnVQdEZmbWh0ZU0zOGtBNWl6allpcXFjMmlmWHdr?=
 =?utf-8?B?QW5JTXZodExOSURNcDJGQVhFY1FtUjN4ek4rODNIdVNqWStMb3dHUVVPcGhZ?=
 =?utf-8?B?dm5waWtMYjlSb1J4TWdaakNwZVk1OEtMUEk5cmViR3FMc1BGbFlqN3NzdmFS?=
 =?utf-8?B?Q08zQkhFS3pXbUJHN1lpdlpJdlhmZHJqTG5JZENYSzJoamY4dDBoUXg3QmpD?=
 =?utf-8?B?RG5PWHBUeTMzZ1ZQRlZzOXhkcldWVkllSk1CNGVwdzN3VEF3SDMyc2xkZmZF?=
 =?utf-8?B?NnBmeW5PUmU0Tkl2VnFJditaR29OajZtQVlZeDdZVDIzK1UybWY4ZnFDUi9R?=
 =?utf-8?B?d25kU2FRMThYM2F6VTVTRi9oUDVrNTBEV1lVNTI1UWJsQTl4WVVLZ2ZkWDRG?=
 =?utf-8?Q?ao1M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnFMVDMyMDhtQ0pkZFovMStlWmtLMHpMRDVQeWV0Q1FQVk9mZUlZeEtFTExJ?=
 =?utf-8?B?bVBFc3lkdEpHQmE5SXlNcENZYVRDT3ZVL3U2M3ROckhxcFQrUjNxOTRwTWJT?=
 =?utf-8?B?OXJJMCt3YTk4clU3dzFORDNqWVRpVWR3WkRCQVFlZVgxRXhRb1NDWWJEN0RG?=
 =?utf-8?B?MXNsSTM2K1VEbUdYZG4vaFpwZStOd0RaR3c2YmVFU09JbHA4RVM1RlJTMFg4?=
 =?utf-8?B?QWFKT3dPc1VmM3hkZ3ZJVXdGM2cwMzEvVmxpdWZUaXlZVFRhQldCZm9PbzV1?=
 =?utf-8?B?ampDN1NUdnVOTkp6Y2ZzUEovVUZ3UXlYeXRyemFDQTBsaFoxa3BTVzlnYkN5?=
 =?utf-8?B?LzdzQlpWL2dkbWkrSm9XeVdoaTdlTTVnNG5QZ2lKNzBzVDU4M282WEJoUDBB?=
 =?utf-8?B?WlJJQ1N5SlFCWFBFNHc0WHBoU05obG1uVUVJSll6Qld0UEgxeUJBcU84ak14?=
 =?utf-8?B?QmpNbEhTNjNUdjNJOWN1TmxOV2pDVTVERUI3SFV4dTh2UkdjcmpTZmlKVkIv?=
 =?utf-8?B?MCtDWUQ5UkRyck04ZzFFVnB1QmJDelpLVlpyeTNCSVpabFVLZzQzUlNabEZw?=
 =?utf-8?B?ckJwcUthdkp1NWRYRGdOWWJ6QVJOam9hY1ZLSG5XenRhVGxwdnI0TDgyRG02?=
 =?utf-8?B?WnF5ODRXakNDMnNkQ2VqWDVuM2ZvNXY0NlhqU2JGUTNzeUJCdms1OXNpZG5r?=
 =?utf-8?B?R1J3ZHJ0K05mSEhhOTUyM05qdWpETlB0RXdUdTZSa2FMbklLWE95WWFHN2gr?=
 =?utf-8?B?cVM0bTZ1blE2SEVJenorbzdwbm8wejZPTC80R3ZlV1VYcjluS2hOL1NBSFFq?=
 =?utf-8?B?TEhBSVRDWDl4VzV5M3J4SU55UjdvcWRadmNhYjRTazVOaW0rY1JMNENRMEht?=
 =?utf-8?B?R2lPUEwwMmMzSTRRTHphaUo0ZDBZN2lqYXp3Z0JwUW1oekNmQUplRFZiYU1V?=
 =?utf-8?B?KzZBZ0g3VExWQUp2V0ljRGUzS3FZS0U2KzRWSTk5UGJtaUxmVHRYU0t3UXhk?=
 =?utf-8?B?aVhBWVhCdjE0bzdvMnJ0ZkFOVjBCMlBtclozeHRLZFUxbFIxTW9iOVF4VnBv?=
 =?utf-8?B?NnVwZDZyOER0RXhrMG1BZ2Y2U3ZxajFPQmdEWWZLekxqYklKZkFhUkpEaXlV?=
 =?utf-8?B?MWY0S09SL3hjaGI1RngrMFF4eTRXYWZnNmsrSzhmeTcxTHIxWXRNdWJDY2Zp?=
 =?utf-8?B?MEZOSG5tcHpWSi9Gb1FZam1WeVZRc096RWJRM0hLOHhGVEpnVSt4WExkdktt?=
 =?utf-8?B?VEJsSm1XTUliUGJGc1lBSHk2OHRJM1BYUHV2bndPbnA3YWxuLzNqamFDbFhK?=
 =?utf-8?B?ak1rRTJTMjBkMm9Ba0NVM3RUbFN3MEwrLy9NcUFYNzhmbFB6N3pIUGNSOE5P?=
 =?utf-8?B?YlBQdk9qd0VsZGxLRi9MRzFXVC9vazJHUWQyUVlwM3g5cFMzS0RNanJMYWhp?=
 =?utf-8?B?bXh0NzRqczN4VHdGdit5dFphMk4xaHd5UkhvQ0NtZGo1eTJEZE1rTEVkVzRC?=
 =?utf-8?B?MFhIS1NtcThUb1FKalVnWGxzZ0tlcjlKME8zcjBMR1FHT2ZUcjZ3QVBad0JO?=
 =?utf-8?B?b3ZuY3c5a1RYa1ZldC95UU9WbXpPSnJsaXZQSUJnK0kzdU1hSExaZ2R1SGpL?=
 =?utf-8?B?SjV3TEk5S3E5UlhRN2dZK2hiTDZaM2JkZitWQ3VkK2hOOSt5NHdOdU93bkdw?=
 =?utf-8?B?MHR3TlpSTGdCZnc2UnVUNkI2NitBM29KZ3ZWaVAyMDF3QkFHdXJ1SWswYVFw?=
 =?utf-8?B?LzIrTUJGWTdSYjJBNFZnRnpmSzl6eGJxRm1BU0NXR3VkTnp3bit2UGFKanJ0?=
 =?utf-8?B?aURuTk01ZjNBSUxZSWxLbU9yTjRueU5naG5IU3owNFV5TEhaMFlsZGRxYmRK?=
 =?utf-8?B?aldtc0hwUUFoSm02ZEhwRnZyS0d0RnVaNWhHYjhORjZEZnlzN2lrZG0yRUJK?=
 =?utf-8?B?L21qS2w2Qk5senpxNDJCNUlzbndxb1FtVVNxVk5VNzZZS3JBck8zN3BVWU5r?=
 =?utf-8?B?YXVmS0VjdytlWHdJTDVvVW0rTUQxTHhaMisreVZYWTdwNEpNcWViNmZ0YWUw?=
 =?utf-8?B?d1ZpUEFMN3UyNytuaWtsUSsvQ05MYlpLTnlzOWVKYmhZZkhWazBZbDFaZWw4?=
 =?utf-8?B?bjhvL3lVNkpOcVdyM2R0SzRZRzlwVmdrMWIrT0NNRm10WnpURldCVFF6czB5?=
 =?utf-8?B?RnZ4bHFYVmNRMW5Na0pNZ2tZdGdjQzZXUHcxT0dQZ2hlZ2JmUTYySlhnY25U?=
 =?utf-8?B?ZUdXM2lnS0dTMDUrNEh5NVRpZzM3NmpMejVHaTM5dEJ6WXZ6bXpGeDJBMVlH?=
 =?utf-8?B?NzhjcVEwZmhCZnZPeGJPWXY0R0RQUk00a1pGMW5ycDZsUFhTS0JTQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419a840d-1084-4137-de6f-08de5ae9ed64
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 01:43:09.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZlQ7R7b9TMeyCZXsv4b60DXkRckK8g2Bu7pThHFEAFRoKF0eLdcFyviNXa235ZwZX2lMFyoVKrdGuR9rRzrkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679

On 1/23/26 5:38 PM, John Hubbard wrote:
> On 1/21/26 8:35 AM, Gary Guo wrote:
>> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> ...
>>> +        // SAFETY: fmc_full is a valid DmaObject with a contiguous allocation of size() bytes
>>> +        // starting at start_ptr(). The slice is only used for signature extraction within this
>>> +        // function scope while fsp_fw remains valid.
>>> +        let fmc_full_data = unsafe {
>>> +            core::slice::from_raw_parts(fsp_fw.fmc_full.start_ptr(), fsp_fw.fmc_full.size())
>>> +        };
>>
>> The justification is week because it does not mention about the non-race nature
>> of this, which need to be justified for a DMA allocation. If you use
>> `CoherentAllocation::as_slice`, then this requirement would be obvious.
>>
>> For example:
>>
>>     // SAFETY: the dma buffer is not yet submitted too hardware and we are the
>>     // unique owner at this point.
>>     let fmc_full_data = unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.fmc_full.size()) };
>  
> I see. OK, after a lot of fussing over the wording, I'm have come up
> with this, which might be much too wordy? I'm not sure.
> 
>     // SAFETY: fmc_full, which contains the complete FMC ELF file, is never submitted to
>     // hardware, so it is safe from hardware-software races. And we are the unique owner of
>     // fsp_fw (and therefore of fsp_fw.fmc_full). (A separate buffer, fsp_fw.fmc_image, is what
>     // gets submitted to the hardware).
>  
> 

Oh, forget to mention that I also changed it to use .as_slice(), so:

     // SAFETY: fmc_full, which contains the complete FMC ELF file, is never submitted to
     // hardware, so it is safe from hardware-software races. And we are the unique owner of
     // fsp_fw (and therefore of fsp_fw.fmc_full). (A separate buffer, fsp_fw.fmc_image, is what
     // gets submitted to the hardware).
     let fmc_full_data = unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.fmc_full.size())? };


thanks,
-- 
John Hubbard


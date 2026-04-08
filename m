Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70F221FC6;
	Wed,  8 Apr 2026 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617073; cv=fail; b=LFkxgfSwvfvdGpPf3J/3CNCmuCHx2TTTXneasx9lgLfwHvo0C4b4zwFLgS2wPIl9EyauKoLxsNkNq0HLOTliCAt0l4dAEO5R27W9pTvYzFx4NE5we6ge1WPr4Z64kuijSey07Gy7t+wYaxMtCQ0VLQYNF2+nzHSD1qDvWFjoaxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617073; c=relaxed/simple;
	bh=wm6UbKR86fKnPj44WzqzmKfPMMu13mqNYTsB/aeg97g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F6qX4uApknvRsoE3OJt/4G+3Ue3vjpiaILARJRYId4A9winZJZRsb1RwIxwXybfHzJwO10PAL9ZytnA/ujxeFLpgB4tUFZdJ4wSf/p78Afmp8ki9Ss+ejWx8HHR/R7dUCeSJft6Sl0Y86MAkCDpOHLYBl90DFGv6jvP7KIMqNeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uP7HhH9b; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uP7HhH9b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7Ogkmq5BcxTTMh9odlm1T0BI+BYpEhtn7JSd5LZNfklbgpLsMloHzjH3q8cZA0mpLQKuQ6/1jaVXUmoMeC+GidGjDF6s/3yHeH2lxndqGenYI0BIOESIqT9C5LLgfduI3I0EWvi3qVeMkqBZMXH8YM6e+FortqehE5AqSsHMmxwFgtp3jaoxt/HX8ybdUCBjKFsKZTJvFawgO6ThiF1cJ7BP6Ne0NPAG1oY6nHvVRA0dqSwQy6bBmsplvYqTbkiifUnZiwmJh5wC/HP84JowYuVIjiA2tNgWRoxr2bzhTEQczUre6JimGhT1fiFX/fBZE4DqgN5cs4LPbZJQ2hzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqgnAcX9zNtKfyW8JQZ9i0XkI7OC1l2KslF+tTg1RHw=;
 b=vuBuxT0URI7fEj4lNcWbAe53sMZbM4C67nz73al3eaFmRBHmEdfrFA6pkOAEuS24KR/kv85t4LoVTXmDeGnyjk73hYlNIMDNCS0+VwFZGoRkEUfzK8Y3WZbYWdIJ+usutZjPI6G5kg2ZMLB1xoF6x1qu8NyQSG+zAuCHW09Uitgi7zGUAAcTA2/l53rN34L8NnN5ZY+/kWcFLVlOqzBsy2vUAnkaeS5asXudY5qr5nB5DFbPrtmUgTTXRaJrHbxSRF1EEdjBArsOt2e44+12zJHLOg8yhG/B7L67HzN1+Ee581VyjTm14Fu3eApEH32gB0GUrj8fEP7tuVWeSWMhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqgnAcX9zNtKfyW8JQZ9i0XkI7OC1l2KslF+tTg1RHw=;
 b=uP7HhH9bnPFbHbXqPY5wAlCu+J8w+RDaFMwXHWZvy8BH4Ut0GFKymRNtEFxFYMa3Yg5L0tCFtfllEO3ZsgALhI0EVXn09xQ3FV8h8Y/LIIiaKyxtnE0JcMQLcItDchwMCk3/nq5dHruFn6vD6jOaIqxhH2i1lojBnfwU7dFy1tvVMXX3VGGChOeRThWwxNKf3ekGW6NGXm9S6mgJN4/js87vcJHccD7q76k4LX9l7Y7RPjaA49mBF39fUJJNjESP+z6moGgPEKiVHTxQ/zBBDRcbME6INrZkdVMg+yTuQj+bf+mHv+Z01XzpcRLaZW63C394rXSG3eLfsCGgp7Um1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8873.namprd12.prod.outlook.com (2603:10b6:a03:53d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 02:57:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 02:57:46 +0000
Message-ID: <8e2658fe-350c-4762-9e57-46b6b8fb8dc1@nvidia.com>
Date: Tue, 7 Apr 2026 19:57:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 26/31] gpu: nova-core: make WPR heap sizing fallible
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
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-27-jhubbard@nvidia.com>
 <DHNECWUPID7S.3C46WAVH8ESA3@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHNECWUPID7S.3C46WAVH8ESA3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b14ace-2d95-4f03-46ff-08de951a9c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U8CRETGAcmpoYC8RQxOBz0Yn//bEQV8evaEnrVwWafCtMC90rRNIr165mqr5h0+uFj6/GRQSe3dgApdBh+pSdY0bdWuLyb+aav5o03VFpk8jzBv6IZwQcszPTsc2xOYT3Mqanm6lA8M1rbetfCFpSHTjh1/YmMh9uVaKrlOxzBm0lLYtKsckbdIlnlYLgeS4FIwZBSIt3xlfvB0wp46io0DvwM2gwjFm+2rhrj4APkMcIzl2yxwGDChLhWSHfZU/ZCJXPAXXsu2PBRRz/yAM8e9UTml+yoCP1I6M8XGdAYXFSJqfUzhVzd3L5t69OTJYzSQJKYxvkYDk+VUbb1FVtcSpb3JDhrS8hg0ij6g6BmIPWRgjqBhyQZRrIo3qsi8qIvlWjEl2g1RNeXOX7Y/qPPG0Xmb6LANLVHlwaHwme8nwROmkKnSnjNJwLn26q18JjQY0rotPmFLsk9A0gB/qlhtd5krFOM3wkRWdY9udNN7Z1cyRSQj4HNaMFtEMsObPnFW3e6nmnKOcA93JouWOwry9jHcEHkcc8uZCsO6fp7ZtAgt9KOGIuLkeYXw/GB+QzRUOEZlxIHV1VRZg8A3DJQXLiCZnuwPf4eyhONs73HI7lINsqlY124eIY8rd83h11ya+t+ItDib4nyqqEQsMibbp1XzPFa62h/Pru5mJyzOBMAfSlG+L555BmfecW6kIOfII0cvGkKu55Ira4oetCxLPsnWPUKQkaZVihJ+3xO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTJYOVlqd0hXb2syOTY0NGNMSlVPMSs1R2svaU5jMUhRZTFxV3J0ZEUrYzI1?=
 =?utf-8?B?U2ZGRFBHdCtpZ0dnaG5xR2hObVlaR2hXa1l6VENYQ0h3c3YzQVFiaE1PbWdl?=
 =?utf-8?B?TFB4WlB5RW84a1dGT2ZabmJyM2kvZHYwbHBNQ2hzNUNkWUhaUHlhOC9hV3Q4?=
 =?utf-8?B?U1JuYmpMUXlsN2pVSUIyTUhHQlpMelBtUU9MZGlhQ21zbTlUOFZrc0RXekhh?=
 =?utf-8?B?bnJNWU41T0FuVDlBS2JqY1ZXbjRBRXRkeXV4Njl5VWowUG96KzFaTi9lNlgv?=
 =?utf-8?B?T29mWXFMQUpGRTc4QXpBOFNGdEJmVU5iaEZHV24rVzVTbm9WV0hWT1NJTCtG?=
 =?utf-8?B?VWI1bXc0b0ZYTnhPQzNmb0krUGJERzQybVhQcHlVSFpRY2dXa2tJaE84UU1h?=
 =?utf-8?B?S0lDVkk0cldIaG9NUEpUME1PeXRQZVo1U3hmekl5aWg4bkoxSmpxbDRpdWlV?=
 =?utf-8?B?ZWxvZjhFcjNhajc1TzF2bkF6dStoTUJWbGo0TVdQMmt1UmlzWHYxaEZZM0dq?=
 =?utf-8?B?dU0vNG9NTUV0UWJHZXYrbENIWHlmclRRK09kZlUzV3NTWVF4K2MrRFE3Nndz?=
 =?utf-8?B?V25YZHBuTXNhMlNpa3VuRlVQK3V3dlNSR2d4WXF0c0h2bDRGaGExQUpYSkRK?=
 =?utf-8?B?aGZWZk9JWmx4elMxOE01RG1obUV3Tlh4bjVQQy8xWlVqRjVCWjhCcCtjQVNy?=
 =?utf-8?B?RTFodTJZU3dxTkN4NCszL0c4dUtncTJpL2xGMVI1eWMreElBTU4wUXgwamhp?=
 =?utf-8?B?TDVra3drOGtWc1J2R3N0N1IvWUNiMEZ4ZmVId0N6aWFMUk5yNTlpcXFwdCtX?=
 =?utf-8?B?V0EvcTl0WXM3WDFCRlhXNUtVS1VBdTBJMzJ6eHFtcklXZDlyZWxDY2JGenZH?=
 =?utf-8?B?K2owcHVCSks2S1FCazBpY3pEQldEYUhYWk5neThYa1kzb3Vyd2RZUnFzQ0Ir?=
 =?utf-8?B?NW8yT09CT0RvOFEvWFVyMndyZXBxUzRHVWxaWkxQRGtUR29EN3YxczRTc0tq?=
 =?utf-8?B?SnZJaDdVV1NEY1hpQktDL0g5RGFXSDA4elVTK3lrNVBYeHhvbVU3QUljOUdY?=
 =?utf-8?B?MW01c3FGeWRuczhxV1JhSkExem13RXNVRkFpRHg1YWNDTzZvUHFCbmVUN29F?=
 =?utf-8?B?QXdKdUlhc1RlZG1vWXRpNU1PdUR4VlRZRjZxMGhlVXEwQTE5L3U2cEwyVlg5?=
 =?utf-8?B?RkI0OXR6Z0VCWW1ldEdoa1FCWExYMHhDQ1ZVNzUrRnJEaVNRbXNtcUg0NG91?=
 =?utf-8?B?WWhmYXhqRFhHbDVjS2ZDWjdtTksxSWpnWUJuT0ZkQjZTZXVXNnNJTGRIcis0?=
 =?utf-8?B?cFFWQXRydFUxTVhTSEI5WlhGU0xNVW9HRHhwUGlOYU1oU241endtVjNFN3Jk?=
 =?utf-8?B?alNiNmxWdytFa2pNZmZiNFN4SmU4M3diSWFXUSsxY1k1K2NYS3psWTBQZ1VJ?=
 =?utf-8?B?NXNjc3VmemJWZ3dzaVlBaXhoR1VlL3crMlZZZGp2OGpGQURwMWFMT05qL0ti?=
 =?utf-8?B?NkVlRzRIUG5abnN3ZnNkamNhampFakdrbXp5clhuakNNN2ZMMU9mSVhDNFpQ?=
 =?utf-8?B?ZVVTczlqWmlibU1KNTVrM3dSL0JJd2JmMjNIbWpYbTNZZFpjV0IwT3Uva2s2?=
 =?utf-8?B?eDFPZ3ZKaGdYSHF6QXJGb3l4aEhGcnlQOHF3bkNIeVcxajkzVFdPOElSUGFj?=
 =?utf-8?B?aU5EMThHM2NjVDcyQjhQeWdoVmViRVdaKzlDL2Z2cTROZzNDcDExemVDYmV6?=
 =?utf-8?B?ajIrV0xBSWROaExrMTJ4YVdrczA3SFBaelh6Q3lIUHZVQUx0Tnh3b0dENVhv?=
 =?utf-8?B?VERRMHdZQ3diVmk4ekg0KzQ1b3VZY1RyRytlbGI1UGkyYUdtaHZHb0k2R1VB?=
 =?utf-8?B?UERjWi9xNi9aWnh4d0lycitzMnMzYy9UVE9GRVZQNENRRnBlc05qMXVOM2tU?=
 =?utf-8?B?VFoyOWEzaGhFenlyK0E5LzZGWklobWViRnZuRHlDRlJqVUVHQ3FDY0V1QTc3?=
 =?utf-8?B?WS8zWldXKzJCb2NPZHZTSFlXc2dGN2cvOUoydm5ZbEdjV1RSb3lvQTh0VSsw?=
 =?utf-8?B?TXdxT0VtSVd6aHFPTWtubTF0ZDU1Vnh6aTdPK1JSSGRHS25yT3NON1FOSTBX?=
 =?utf-8?B?cnk1ZFFzOFNGTmJrRHJ1c3UvUkdDQjRWL2R3a1o5RUg2bS9ROUdqQ0hHZjZi?=
 =?utf-8?B?ZGNBWW5xbDFoYnU0YW9BQUpTby9kSFZmRGJDYUJ3VEQ4anB1QmszZXV2c2E3?=
 =?utf-8?B?STdTM3huSHVaeUNzRFJjVVZidmFodDlmV2pOcVdQMGhOTEVNUkdNNTlnVWt5?=
 =?utf-8?B?cWdxYVlwVWJyem1tQmpOWFg3bDdCWlJVMmE2cldibWpwZ3liODNiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b14ace-2d95-4f03-46ff-08de951a9c4b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:57:45.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EXkWG6M+HsG1AabTSJ1CKDzRM/phDCawI4GN09x+IpDcNdfl2uzolwF9HJLYKzxrq8IpwyS1lTECE7NEwHbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8873

On 4/7/26 6:53 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Make management_overhead() fail on multiplication or alignment
>> overflow instead of silently saturating. Propagate that failure through
>> wpr_heap_size() and the framebuffer layout code that consumes it.
>>
>> This is not Blackwell-specific, so keep it separate from the larger WPR2
>> heap change that follows.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> This looks completely independent from the series. Staging it for
> merging when drm-rust-next reopens as this is clearly correct.

OK.

thanks,
-- 
John Hubbard


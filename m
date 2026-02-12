Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6A78F26;
	Thu, 12 Feb 2026 02:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770862038; cv=fail; b=d9hobzNmDxUhDi+sRnWul48GLvc8g9EjFX8azuhL1xXxeS4rtLi3siWLati3423ZmN9o6vAGG9BeekSubITCkCO5pB65ZgM2mc9YkwhbcMy03wnaT61aI/GhGnFXVID+MreJTaRJhxaqXxYysW8YXkOQwDq1UGZOBMbwnYFZdLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770862038; c=relaxed/simple;
	bh=m0Zs93CnLOu6tExI/wtahyudIdXx7uDcVix2KAkwnKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cd4F89fevB2Aa2TYuSqjEWs11+3Y5cjlSxSj63CfMSIir6wBQ3aqiyf2R1OI/RbgTOFwAtlFa/e7JgwpNlgXHPwtUXbO50F9M80b8gTuRlmp1l3RzhytV8C2SXAn9UpS6D6HbMR0WtNTeuS4eV2iyfuDra1GQS0uS++f4kXO0+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BMmGB0pL; arc=fail smtp.client-ip=40.93.196.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BMmGB0pL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQsDvfyLUldtnIpiEkUk6cRcNVVPnHWKXt0WzFmxOhvOoO/fvRsYqKuP4SQkKBrvmdNchZUTbcFfQhC4r6fm4srbrw8MXbk79w7BSv5kcPL57mN8xDzDn1q1yjAUKtli+xKNsWVBn/kqbAGVLKkImZl1x1oOEs1Ac3ziN0MpTYyl76bZXUHkwNdXXGHOOkwk6fxU3alV0itcMekKuf8v46DLMEsSt6wpg0XPc5YdVKAYNyjnpTPl62XU9EsC4w7KIKLmXw+uWw/58pjVnbyVkZR4szizbMII/csz87sGV7B+36vnYXjQTHfkXTmLX28+mJ9l7DlIq4escHrmliR3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TmVBJ/fbBvV+dUp/WzuttwH7KXNATwtPvkyagL9+iQ=;
 b=l0Vyhj1OPl3C0ZXcgIpMjj9kQ09hSm4S1rJirsRYH6GbZuIsIHSaoApZ/I/yCnxbYhUmfA76xH6jYzVQlwrjcvI9zUGJPf6xQ786vYnlE4pbtHOgpVyBZk0tbhFWxvssofu42A3FsRQuwnbyN7kvFFh/BmRWJCZFjl+kdZVn8ORW6j3yOQ5+owvil5f1DFMH+8SUN0aslUHPT5qrlhy7b3yVg5kiRFa6Cix2tiKOfENwZ9fVGDfatWewhxhCRvXv0Nw11HEABB7RdJGNnRB5mugT9f6gMC4aNMDpAE9AbtvMDKCjtHEc5QcIDyNz6hVlVjl6gpaPT7OxGvVPI0W0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TmVBJ/fbBvV+dUp/WzuttwH7KXNATwtPvkyagL9+iQ=;
 b=BMmGB0pLOO+NYuz/DkAh+FHfbfnMUdO+VXyWcRtiLi9nBFmuFVQokv44aN+ExCIAhFiruxB9ocROCYwW6lYaiQLc6P9lfkLr9kUl51UScyd+PE/ooEXivlYjx6wIreUngGDSS6rM8tdZ5REhSBg/7GVuAOtZcaGJ9n+IhDJX2d5QaSbbIUVFfhQhMDeNucG1PS8r+yk85Uyrl0Zjn+rwVeVeqNMjrIAEBM5jcbaCpU8HUclfBoAICaZ1Kdh3mdl3JQzUXHxrrA48wwnjRPRtN3AnuGPKzeyEnoY67JQd7N40TwTDgFVQpII887mkqaFKOy/XXJ0N/LMfq9XIz3PBhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 02:07:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 02:07:14 +0000
Message-ID: <d0586ce6-e0e7-45f2-850a-10e5e03ad557@nvidia.com>
Date: Wed, 11 Feb 2026 18:06:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/33] gpu: nova-core: set DMA mask width based on GPU
 architecture
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-9-jhubbard@nvidia.com>
 <DGC28K8J39E2.1X173NHT9ZJDI@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGC28K8J39E2.1X173NHT9ZJDI@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: b18e1e10-97c3-485a-b6cf-08de69db7077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmtCb2N3aXZqeEJRdlhGcDhVUVVxeExOKzZJWHRtNTVsbS95ZW5uSjVPZXNh?=
 =?utf-8?B?c1gxTXUxSmxYL3NWMTliblVhZktXRWVYeHRKY1VoaE1hVGhRajdpVTVCS3hK?=
 =?utf-8?B?NXRHd3djZVZISU50NHVqVFhqd2d0M28zNXJaOHptdldubnhiVmZoQUNjRGs5?=
 =?utf-8?B?dWdHemJ0RWNvekovMC9hUjhnMG1pREZxY2NGdVZqV2ZGWDFUZFpRaW9vTm00?=
 =?utf-8?B?M1VmaG9FQk8xTmQrejduYnltZGVUMk9vZi9GczlwTllYOEVPV1lJUnExZEZq?=
 =?utf-8?B?dEwwOXBrVE44MTVCTTRJYlZiRllXcnR4TjhjSkdsbWJ2alZOejRWT0EzT0NV?=
 =?utf-8?B?NmJjbWp1YWZrQThLSjc2V05Eb1FWbFFrRzIvMW5Qd3l5SnFORU53OFhFMUk4?=
 =?utf-8?B?c3J1UkQ3YitMaTNHeEhNQXd3ZnJ5VTA3b3AzR0JvNG8zREdjOEtqbVFjQUxP?=
 =?utf-8?B?U3MyZ0cvblllY0FQcGpCOUFRR0k0QXpZNWMvbHFTVzFiQUlPT3AxWklHYS9l?=
 =?utf-8?B?R0NrNUJ1N3FHVmh1dytFK0tKQjhJa3JzQlJmNGpjY2hJNjR3RUU5SW51YVFv?=
 =?utf-8?B?VWY3SHdsbk5GbG9sNUpoYWZDRWFyRU5URjFhR09scmNwc3U4MElQbVkwc2VM?=
 =?utf-8?B?UW1taUZ4V0RwUnQyUSt5eXo0YkY5NmUrUTFod0VPVEVtUGo1dVcxRGlkc2dF?=
 =?utf-8?B?QlRaVTB4NzNOTlhNODFSZTRTS001TDB1dWcwZ0xPV3lyS0EyNlR3M2pzdm9n?=
 =?utf-8?B?OFJob2FxWmtJU2M3ZGcxYU5CMFFrM2xVMHY4T2xxbkFQYTRENmQxZnVoT0hO?=
 =?utf-8?B?T3M5TVVTNDJpTDR5VTJmS1QrbWc5OFAvQytPanBvSHN2MzEzZDZ4KzdpRGJv?=
 =?utf-8?B?bkpBUEp4NGhMaDEySTArVEJ6RktqTjlFc0wrK3NYMGd3NFVEOHJjamgzdGxX?=
 =?utf-8?B?Q2JsWXR4Wk5NZ1YwcGhLaWxhOW9oSEVYMm1EWTNHTTVZUDRQY0d4azBlcnVT?=
 =?utf-8?B?VHBZQTliSHh6RzNMNVRzaklsa3BPdEFWS0dHY0M3TUJZOW1zbml6RkUzRlV5?=
 =?utf-8?B?MlAzN2d0M1lTVDVsZVlCZWN5MnI5K1k4TnlnWHc4eGttL0dlc1NiM2dDRERT?=
 =?utf-8?B?UWJaQk1tQUVCc0tjUFdnZHpFdUd4d1FRbmd4WENrNUVGN0VtdGd2bXo3bjh4?=
 =?utf-8?B?Q2hwYVlMNm1MVU1pdkgzL09MRmtKUU5ZN3RIazk2SDJmeEdBVk1yN3cxZFlr?=
 =?utf-8?B?U0w5Tnk0RTRLbHZBWnd4bGszNXhjUE1uZmRSWXNKMGx4VUhvWWQ5YTBrWk9O?=
 =?utf-8?B?bVRrd1FudktFTmswemcrZ3YxVkdUV1F6OXVvaWNacDVjeHl6KzhmamFZeWMx?=
 =?utf-8?B?TFYxNCt0anhIMFdtQzkwSDV4U0ZtN1BsRlpDRTA0OW1LTG5zVHVGT1lEVjFD?=
 =?utf-8?B?c1JmZzQ5QmdlQkhTQnVXQ0tVUHR4bmRlZjJaWU9yWDkxVVlHQW9IU0YzeVZC?=
 =?utf-8?B?V3NjK1BOSGFCNTR3RmtyRWNCL2VOc3A3MjJPejZtb3RsTVVUYkhOUFRmZm0w?=
 =?utf-8?B?U0NJbWhiZEsxd2ZGN2djdTg2dStTQlEvU1JwMndoSHRydk1Rb1gwOFVtZWNS?=
 =?utf-8?B?cS9tVTN4dmtmSWh6bGV1cTZLc1RyWGFaaWFRMHpJNTYrR3F0TnhlMXVRZFRu?=
 =?utf-8?B?MG5jMGdiZld1ekpvdzdCRFRoNHBKSkRaYUJqRlRjOGdhZVhzb0wvcU5FOWFK?=
 =?utf-8?B?OStoWkkzS0d4RGNxOGFGT3Nnc3g1UEQydGxVN0w4YmhWRWxuZ1VBRkFEcm9h?=
 =?utf-8?B?YnlNWWIrZXkyUURrdnVDTkZvT2VBWDB3dExJTWU3WU9ZeStYL0dDR005LzVk?=
 =?utf-8?B?QWtPQUJWdkJYTWNVSlNpdjBtT1o0cUZYL2ZDa1JUbGNZcldGQnNwbDF6UEpD?=
 =?utf-8?B?UnBUbERlVHRONXVqZnJaYlJFaDlXVHZiWkFkL3VCNnc1SDAvSnZnWDE5V3Zw?=
 =?utf-8?B?c0xvYy9KaUJwV1F3L0xhVFBoYTRGRzFiaGNERkhRT3lJdlU0eFFiSUJLcitj?=
 =?utf-8?B?ZWlHWlVCZVltczNGdDFNbWErMmhqTlRrcWwvcVA2L0pXaU1BcXVvc3BoOWM3?=
 =?utf-8?Q?iERE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aExuVlBicmZ3OWlRNWxMSGs3WHgzS1NUbzFEUE11RGs1c0E3NEZ6SGZBUzls?=
 =?utf-8?B?azNMdXNYbWZpcXVabDEwQXVRZzJOeG1Da1N1SWpzclppZk4xNkUrZWdMaUU4?=
 =?utf-8?B?ZStmdnE0ODBYYk42ZHUxVDVxL3p6eGRaMlRZNnlmR0JpQ09zQm1jV1dMcVYw?=
 =?utf-8?B?cStWaXFPUDNldmFyeEI4THFFYnMrRUNWeXVzZDR0SWJtQlVIM3BiRU5BVFBq?=
 =?utf-8?B?N3ltaU8vdmd5M0J6Sm9xN2RGbktWc21TTnhESnNYZStDelc4NlF5MzNIRG4z?=
 =?utf-8?B?dFVDM0IwbEJQemM5VDRDQ1NFV1o2RVRldUxyWS9pa3FqeFo1U2NadkVJbUtT?=
 =?utf-8?B?Vjhpd1lSdlBYK0NKNmxHOFR2akZTdEV1K20zWUVXL00wcDU5NHNtZTh6MFQ0?=
 =?utf-8?B?VFNMekt6U1FvWE1DQjQrVlZmamJnQTB1cUhzRTl0Qll3bFpiWDd2bWx2RkJz?=
 =?utf-8?B?ZlFsY0RxMyttTVhkYUYwdlo4Zk5DTW1wMmR5Q2pBUVI2bXMwQ3FXaVNwUGM3?=
 =?utf-8?B?STlOR1F0bUI4VndHbENGN0lTV1JqenlBYUZ6cXl6dFNlOVpxTUZzRnVzYzdE?=
 =?utf-8?B?L1g3aE9EM3l0QjhySXBnQXBmZlpnZklaemMxL3FPMWxFcHdocHJjYkIwTDVn?=
 =?utf-8?B?bFZRR2YwZU1IUUUwK29yU0x0NWt3M0cxZWFKWjkvbENHWm5rZ1d3amNaTXhv?=
 =?utf-8?B?WXQrR0E5bUI1YVhhQkxZTzIzWXVMNzBvY0NkdHZmam5wUXJwZS9wOUVob3VB?=
 =?utf-8?B?VnJLNzRPcmwvYXpTY3liTGJ5N0JaVW92dTVHd3d2YVVjM3FFMjNjcUpJTFM0?=
 =?utf-8?B?UHlwWTBUUkp2VFJYSThTOWFHZGtUSG54ZkNBbGFUQU5OaUZZSktuWEpuY09k?=
 =?utf-8?B?aUphMDRLRnB4L2RQampycmVDVDkvYWNmR3g5WjU1V2s5YmlHNHZFd2g5Tkp6?=
 =?utf-8?B?QXdRMjhOYlZROGtJeitka3Q0LzkvVFZQSHZ0UEYvM1dWSUhBRVQrcDFhTlF6?=
 =?utf-8?B?SC84dmRUQ216bEMwc3V1M2E2UmVMV2NOUGxEbUtPbk1WRlRWSkdQMEJLT01B?=
 =?utf-8?B?NVgvWDc5VzYxcGFSRG5IK0gyZHNma3FSVzFJU3ZhTTNaNHRrZWhMMUxVNDJS?=
 =?utf-8?B?Vk5TUy9qbmkzWUxpemJlNnlsT1Nqb1FXL0FXNU9zb1lEbnEvQ1VpSWNETWVV?=
 =?utf-8?B?aThtU1hLdUNJUzI2OE5HSzhua1VGb1VaL2VWNnRrZUQrb21VZTdneTRhdEFL?=
 =?utf-8?B?dkJEM29Rd2JuYTBmZ1RKMEgwVFlHTmM1ZFRqejdzQmowUTZDWU5NM1o0bThq?=
 =?utf-8?B?czh1ZWlHOVBWNjA5UW5RRjVtWkw1TlAxMGIzSUZRMzEzZ0h0WlVFRFdLRENY?=
 =?utf-8?B?eXlQaWdQNmZPQXoxSG5IbktVU2syREVuMW1aSEMreHR0MDJjRkowQk1aQ25Y?=
 =?utf-8?B?R2RhcFlRaW9JZnNXU3Q0UzAwY0lSQ001Z2tIMWpTQW5GMkN5VkFRUUVGd1dW?=
 =?utf-8?B?SnlydWlmTkR0V0xLNURENTFHRy9nYVVzeFVVTFYvbHduellLakhNcmozdUts?=
 =?utf-8?B?eU4zTERCNE1oakVGdjY0ZGVhaXF2Z2tSM0xQbGkyem1ZU0IzQmkwc25sa016?=
 =?utf-8?B?amxRL0FuZjRjSE91cHE2amNpZC8rNU9yVGNvTmhxeDZjV0hPR1g4aXg5RE5T?=
 =?utf-8?B?T1NDMVpCdE1mVG8wNFp6VFhtNGF4NFJHbGszbTBpaHNNRndmbDliajRja09B?=
 =?utf-8?B?bWRSQm1BTGdTUEdMZEVSSmhKZXVrcHF0Njg3VVJ2bWpuZEt3SmRzNm0wSDhM?=
 =?utf-8?B?ZndRUVVONmNuOVp1WStlZG1tSUxxQmpSb2grd0pkZzFROSs3RExKWFVxc1pK?=
 =?utf-8?B?N1B0TWozVFZzQ25FRFcwcW16RjV1S2w1OWhacWsvMzBxOU5VMEhSNjNaQmVR?=
 =?utf-8?B?ZzdTSWdEMGZ5L0VHYlFhb3BLaWZBYjBkYXo4Tk5ITmI0OFhrYW96cnpWK1RU?=
 =?utf-8?B?ZG00amcwdUNvNWZSTk96OUJJeWVhcWVrMDlhckE4T2wyRGc1M2VLMlBqNGt5?=
 =?utf-8?B?bURMbWhDdWt4a24rc0pXYUVVVUZNSUNEZCtkTEFuRG05dDEyN1ZZUFZmb3RD?=
 =?utf-8?B?NjdTUTFVMEVvNldrZFpveFVpajNMci8yUFlTVXhFVDdheTRlQ0FNNDBjSDRO?=
 =?utf-8?B?eFduSFg1ZFlHN0VtOEUrVDFUcFBCTFRleENUQ1BzZ0ZBWU1mMlFkVHBGLzhM?=
 =?utf-8?B?L1BwUm1kMFBtaHY1K2dSZW1jbklHSFN3WDdHaU5SVGtVV1l6VWhTRERhZEx6?=
 =?utf-8?B?V2lobW4rTWJHVG5TNkZpdWRwdkU4QlNsYmhuaFNWTHROLzRNcW5oZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18e1e10-97c3-485a-b6cf-08de69db7077
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:07:14.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyYFKqKQ3/bygxc5qHZJtrbq3VKjM/LjgaPZ/5stC64cU4kFeiioYeYy3hy1bon7erf9CXU9G2/dMAzql3lrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798

On 2/11/26 2:28 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> This removes a "TODO" item in the code, which was hardcoded to work on
>> Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
>> early read of boot42, in order to pick the correct value.
>>
>> Cc: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++--------------
>>  drivers/gpu/nova-core/gpu.rs    | 38 ++++++++++++++++++++++++---------
>>  2 files changed, 44 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
>> index e39885c0d5ca..4ff07b643db6 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -5,7 +5,6 @@
>>      device::Core,
>>      devres::Devres,
>>      dma::Device,
>> -    dma::DmaMask,
>>      pci,
>>      pci::{
>>          Class,
>> @@ -17,7 +16,10 @@
>>      sync::Arc, //
>>  };
>>  
>> -use crate::gpu::Gpu;
>> +use crate::gpu::{
>> +    Gpu,
>> +    Spec, //
>> +};
>>  
>>  #[pin_data]
>>  pub(crate) struct NovaCore {
>> @@ -29,14 +31,6 @@ pub(crate) struct NovaCore {
>>  
>>  const BAR0_SIZE: usize = SZ_16M;
>>  
>> -// For now we only support Ampere which can use up to 47-bit DMA addresses.
>> -//
>> -// TODO: Add an abstraction for this to support newer GPUs which may support
>> -// larger DMA addresses. Limiting these GPUs to smaller address widths won't
>> -// have any adverse affects, unless installed on systems which require larger
>> -// DMA addresses. These systems should be quite rare.
>> -const GPU_DMA_BITS: u32 = 47;
>> -
>>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>>  
>>  kernel::pci_device_table!(
>> @@ -75,18 +69,23 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
>>              pdev.enable_device_mem()?;
>>              pdev.set_master();
>>  
>> -            // SAFETY: No concurrent DMA allocations or mappings can be made because
>> -            // the device is still being probed and therefore isn't being used by
>> -            // other threads of execution.
>> -            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
>> -
>> -            let bar = Arc::pin_init(
> 
> Spurious rename.

Reverted.

> 
>> +            let devres_bar = Arc::pin_init(
>>                  pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
>>                  GFP_KERNEL,
>>              )?;
>>  
>> +            // Read the GPU spec early to determine the correct DMA address width.
> 
> Hm.. we should move the dma_set_mask_and_coherent() call into Gpu::new(), so all
> GPU specific initialization remains in the constructor of Gpu.

Makes sense, done.

> 
>> +            // Hopper/Blackwell+ support 52-bit DMA addresses, earlier architectures use 47-bit.
> 
> I'd move this down to the dma_set_mask_and_coherent() call, or maybe just remove
> it as well, since we have the very same comment for Architecture::dma_mask().

Done.

> 
>> +            let spec = Spec::new(pdev.as_ref(), devres_bar.access(pdev.as_ref())?)?;
>> +            dev_info!(pdev.as_ref(), "NVIDIA ({})\n", spec);
> 
> This re-introduces pdev.as_ref().

Fixed.

Very helpful, thanks!

thanks,
-- 
John Hubbard


> 
>> +
>> +            // SAFETY: No concurrent DMA allocations or mappings can be made because
>> +            // the device is still being probed and therefore isn't being used by
>> +            // other threads of execution.
>> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
>> +
>>              Ok(try_pin_init!(Self {
>> -                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
>> +                gpu <- Gpu::new(pdev, devres_bar.clone(), devres_bar.access(pdev.as_ref())?, spec),
>>                  _reg <- auxiliary::Registration::new(
>>                      pdev.as_ref(),
>>                      c"nova-drm",




Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B112FCC04;
	Fri, 20 Feb 2026 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771631906; cv=fail; b=YFQ2XuWuksW6tK352TJoM/AHxraG7/H/roH5EsPYHSKdutPelf+8SiYVMkdCFZd+Wdps4MM0FMDAvUEV8enXaJGCYVvnDL6ddxw2x7hrsum2BB75cMGTHL2293U+Lc5CU3RbNnlmdjyIdYuMZAeWFbghnnTAiY0LGG26PCIDKUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771631906; c=relaxed/simple;
	bh=X2PuK7nj/QQwnFcF5Arst3PBSYJWUq2zc9FfVL0A/pU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F94Fg9iul0GHzX1FJa1N8gxU+fAz3hI9GwbnUDjLnpqKlQTaE2EUfG2Dah5js4pfjjH7mPAxOBvH8XXHXzHapHRMuYueWZHS7UD7LlVeL1qWJD7iSqGJsLVEAQr0feKSGctmcemgpoSJTiGxAQrNtpylqjXdZxMtF8VEwTQNnSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bab4UNOO; arc=fail smtp.client-ip=40.93.195.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bab4UNOO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLMSoCWIkQa+oAZGQ9R55ncYt7e3dD56Z6SbtWFHAAzvHMntOjzvGVHZk2+8XPzSi2F6891viHLIJYQkAPPGmfy+DJRkTKRLjwnFMglAroNBctUpfg9Mb1Ydn8H/7ljZy/KPFLdSL3upAkAC1ewJgcq8AHDqRpLFal12mZnFiHRWi6Ygs4udEw3f2TrUrc6E1eN9s0EfHOqH2ztwOH0GnIgEeleQSPEA3dHbdJC5rQ9HW6pEBq8fGaKsjcUN0x2Rs5VLAshPkgcZLbroh6Y+7IU9V5YH8OxSxLrgqIar8IVylPWlDWZXT7rP8JDy3Eo10uEXUl4pfzp/OMXGtB+oQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YQPmqTqHji2qeftC2wt1bCxcaIbljLXemUZWh9lvA8=;
 b=yTvPi8KR5CsF7KHV2n358fqQQX+6Zb7r2X0kl7Q5fQJBY1JgwNTPK7IgQnnhPrvu+AdlSEHlrpkRCDZdg6yXiWNisAcVBDkJOAhVED4+7O6lwOQHvPO3Jbj5ONe3VFTSejZiOoyEfVXaPC+enIK3DamGO9CoRSOEOmTv+052F1Cbd/mOMfDfH3J8Kq78s/Crm9Z4rvZosK2pGNPizb+78nQrzEFYsN3qaI4N3qkiY3fQlycFcDmcB+Zhz6rb/OKtddw0xRHuYpgcbPEtyeS20sLGqiRJvzslxFlKjf3zKGo2WlZTx9L51Uzunl6aKZCzuRuacbMNaZKTKvrxQpafcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YQPmqTqHji2qeftC2wt1bCxcaIbljLXemUZWh9lvA8=;
 b=bab4UNOOjM+5Mlkf+Z3z3o7au9NCPO3HQ4eR80U+e+FavakRwLQKCkj083TVL0/1QF3xV2t5G18izjARgvrdR62j6mCcjZaDMjUjYbr75fruUogEt3P6PxtzKJcgO0dnsyW3uh6FCJnEpsPzS3ddOdlyV/ZlIt0KBF9L9GWyIJd1Za11XBM+UplNyM0TOvTaRybhkGksr5+Qz5HsR+kw/OmuNqwvEO16HJdfSFPJ8MZohBq7SS7r5ba4l1v7DpGWPSYBNBljd9MWBwnf8G84oF1TbdsJ+gdV1PGyIoeboM5iU4QhPc59USraZ96cWieZ1d/sU+b9hvJH9Tt17YUiqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by DS7PR12MB6096.namprd12.prod.outlook.com (2603:10b6:8:9b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.17; Fri, 20 Feb 2026 23:58:16 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:58:15 +0000
Message-ID: <1082ef29-93d6-4828-96cb-2aa00b104925@nvidia.com>
Date: Fri, 20 Feb 2026 15:57:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/33] gpu: nova-core: Hopper/Blackwell: larger non-WPR
 heap
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
 <20260210024601.593248-26-jhubbard@nvidia.com>
 <DGHI8WRKBQS9.38910L6FIIZTE@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHI8WRKBQS9.38910L6FIIZTE@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|DS7PR12MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e91c4a7-fe65-456e-90ac-08de70dbe9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzVxUjBKaDlUMFhvaFFFbEc3cFdLaGlwSFdlRUM4S3pMOG1MY3ZNZms2bCti?=
 =?utf-8?B?V3h4cmIrVjJqcmkwMVR1YTRMOGhRT2RnMGswSER3a3piOXhwY3VmeWFRNWVQ?=
 =?utf-8?B?MUxDMEpEQUdJckR4emdOSFBaZUg3LzRTcy96aStsNU1NSGNHU2xVRmlyaWM2?=
 =?utf-8?B?UUlUdm1MYzR0dnYzVGFVTWsxTkYrc1pjaDhKQjAzNmlDS0wrODZkbUVEZHpD?=
 =?utf-8?B?Z1d1RnhlcDFxTzRDTnAzUytISkNzUkttejhUbnlnVHVlU3VsZHh2ZDF3NkFH?=
 =?utf-8?B?bWE1ckw2Z3h3Rk5xQ0wveXpHWFdoZjBUUzBHZFUvVzk1OEJ0SThFckdLREhS?=
 =?utf-8?B?VXVaOEhUWjExdkpUOFlPV1V1bWxib0RRREZTQXhocjdic2lKcDUvRmQwZVND?=
 =?utf-8?B?MFlrVWVod2tCay84dmhTanl6NHN3M0RYSWVnL1c1L0F0WW9rcGZWbHBVMXhr?=
 =?utf-8?B?cmtCQnJFS3dBYkh1WndPZjZxaWxBRzFobzg4MjdSSDZsWUl1WC9icUI1YnM3?=
 =?utf-8?B?TnJ0VU0zeHk3Um5yaFdVVEs2VUZqeXQ5bTFPa0EzL1BLL0tmdkFiaU53SDhW?=
 =?utf-8?B?ZHduaTVRVWlUNFdrN21IeUVmYzIrK1pHSExsdFh4QVUyOGhCckE2cEZvVmtL?=
 =?utf-8?B?U2UxbHdGTzlNLzJPTkZQT2lzSi9BbXVDNGVBdGQxZXptZVJDOVJRSnZCQ1pT?=
 =?utf-8?B?eW1LZ2RCTlpnSldGa2FseWdXZ1RaekJDYjBmYmcySkJhRldaREtjWjFlVWto?=
 =?utf-8?B?N09IdmF1Q2plM01RSzg3ODVXcVRINFJvdFFmYjhmNjZDWGF4ZUNTcGM4ZGtT?=
 =?utf-8?B?TktRaWRCSlFpVkpVMU9COWpnb1hUSDlPbWNoNkVXclQydkFkK3BISkdOaU5M?=
 =?utf-8?B?Ykx3Lzlxa1ZGZ1loMUVXbzFaV0dNU3BtZXhiUHBYNXhnOEZIU3V6QlRqOUJ4?=
 =?utf-8?B?RGE5ZWJzREJmb253clNvOUZXbWhncGhSMmNWN1VIc25EaFdNRlI2bFdSbjVS?=
 =?utf-8?B?UW50dWVHMjJYaUpHcmk5MENYckNCNmRKTDFYVk9uYjE4V0RXRjZTSXUwc2Ni?=
 =?utf-8?B?UHNzZHpINjFqSzByZDJBQmpXQ21WTk5OQ0paajJkdW9YQlNlcEk2N1ZqMDZl?=
 =?utf-8?B?N3NkL1ZnODZmRE11V0ZiM3VGb2d1NmJqamd2djVVYTFLNzFjVEs4cjFGSjR3?=
 =?utf-8?B?aThJNE1zM3c2STVDckNYVGZLZDZLUnRYcnk4NU1hOWNtQ1FPK3NQR0lwVzZm?=
 =?utf-8?B?ejlKWlc1U3RVdU9yajNJbmZ6RXlKTzA5S1JwZ2RhWU4vdzVvUVU0RWlFNXA1?=
 =?utf-8?B?VW1HK3lISEpFSUIwK1B5SHVRYUI1eDFYajNBWUpUYUVZT3Fvd2N2bUR3Ritk?=
 =?utf-8?B?eU01MmpTZmtNUnNWeVR1ODhLODAyVjkyWlUza0JsUHV1NitZcUJObWp1VWlI?=
 =?utf-8?B?cExTTFQ3ZHpOVThGbmZJZE9JQUJIeXY2YUpzZy9ESDV2N2pOUmRVWEIxWGda?=
 =?utf-8?B?ZTRMcG9pNkFKM2NOWlJqdWdsYk5TQWNpVm5hVGVIelEzY0lrQndXL3NUQ2RJ?=
 =?utf-8?B?Q2JSVHg2MTFFQW9BUHVRVVZlT2I0Vk9YRGVOeDN2MitFSm14OVBWcjZzS1VP?=
 =?utf-8?B?UGVyMkswaFYxYVhXWWJLcFRmZDNRVERRVm96NGNBTm9Lc2ViSFVaNDlLM2pS?=
 =?utf-8?B?WUZaVDFNeHd3azRFcnVneW4xYlBaZXV2TmJuWVBGNkVmNkFhS2V5eDdYN3Fp?=
 =?utf-8?B?UXJBeE9YN1N6c0g0RWhGTG5kL3owMjBHZjB1UzNnWmpMZVhvYUtvSFFnUDd1?=
 =?utf-8?B?UlIzMVJ1aW1xYXh6ZDFxMC9hUXZmOGRNa0FaaFZCMzBsQ3FTOWRzSjhnTXZI?=
 =?utf-8?B?ck5EWFBlK1diN2lIUWNEUFM3YnUwSGhYVEhsN0wxZU8yNGdSeWdjclc0b25J?=
 =?utf-8?B?b0VaMVRJeGxYcWJ0U3lBUGNVb29nMUtuMFQrQ1ZpWVY0REFPVHBUUUxEaVpQ?=
 =?utf-8?B?SHJhUlM5K0NpQjFLVTR3ekN2eFFVSXEzbzBPLzN1TXlsMDI0eTZkMUtBUGJB?=
 =?utf-8?B?clVDRmp4dDRkZDNEMUZRaTVjZkZ0U1NyUUVJR1RRdlUxSW1uSU5sK25lQ0JO?=
 =?utf-8?Q?wUzU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTFSQnExR0RjUGVrOFF3SUdwOWhicTRia3l3M2xSeldwNCt6bThoVXRsUDha?=
 =?utf-8?B?ZS8yWmt2TWk4SzlxVExYUlFETSszaWFMdTdoQUZpQTZmUkxlUUt5UGcvUElT?=
 =?utf-8?B?emRzTmFDVFBFN3ZrYndRdzlXUlA2M1grc2hpWjMxVzdmcXptUklQKzNqczdZ?=
 =?utf-8?B?cDd2TjQ5T2tCKzAwU1RLdnFscFlBdVV6ZnFZVnVFSis2aGNRM1gxY3BBNkdZ?=
 =?utf-8?B?cDNHQVFmeHpuL2w2UnlGeVYxMUtkVmFPMzNBdG1scDN5Y2dFUExZbm1RbGJF?=
 =?utf-8?B?MGZLdk44YmhmY2crajNJL0xBN2Z0dnkxZk5ZbkdpWmpyb05zSlFhQnBNUWF3?=
 =?utf-8?B?V0duMXJCRC8vOGk5THREU0I1a21OS1VNcU5Kek5QOVFQcmU1dTZjNWxadmZk?=
 =?utf-8?B?TUpmMDNJdCthcFE5dXJEWEp3U1JQUVRvbldMcG1WdTJhemhxWkZlZi9hMnNV?=
 =?utf-8?B?MExaQkRIbFNjeGEvUXFlcWFQTk1scHd4dUJPcXZBNVBjTGY0SXFMMTZ0MG9Y?=
 =?utf-8?B?L3psVUJuNXFSTENTQ0pNZTBRb0ZBMXRGNG0wUzh0TFRRWHEwTHJDL05nTTdR?=
 =?utf-8?B?NlB4VUpFMHNTV2dheCt3NE5CTjZpb0ZXQ0pBR25IQlVFcVd0cDZjZ0dtd1dJ?=
 =?utf-8?B?ZllCYjJLM0FSY2ZrMEpTZVpwb0wzMng4VmdTcGJrZnB0VXpmRGVNSGt5MmFa?=
 =?utf-8?B?Rk9RdTdMWWJEY2I0U2FWRlk3b3crdDdCSUpVY25ZWEg3KzJIMk9NYnlXL1Ex?=
 =?utf-8?B?cE5sa3ZKbFRaSm50cWdMdW50b28xMm9DN3EyZ1AyUlBQSUpkVzJBSE9NMVpu?=
 =?utf-8?B?c1ZJdHFJZnVDdGx5Y2l0Q3RiVHRKdFhoWEJWdlczNmxEbS9qSFMraGpWNUlE?=
 =?utf-8?B?dHVmaUNRRktoNlFPNDFBYkxFVFkvOXBVa0JmSytFMllQdmI3M0FPSWxZanFW?=
 =?utf-8?B?NzZpWDNBRm44b1VmQ1JaK1BRVURHV3VBTkNUMnJ5UGoydlVRK0J1ZnFEMUtq?=
 =?utf-8?B?ZHlkK05tSGtMUXV4TndYZmdHVit1eU0vcURwUTZ2KzVIQW9QTHlXYjlaY1Ir?=
 =?utf-8?B?SmhjNWZvOHhMVTBHL2VncWRDU1NwQ25DZVJGL0dKbDVEclJ6ZXQ4NUJhNHpF?=
 =?utf-8?B?MGVXb244YjlTMnZmTlZsWjJReS9wN2lNWE9LcFVPTi9RaVRvOXZIQytPeXZ5?=
 =?utf-8?B?dHFrS2l4ZWRCZ0p4UXQyVmJ0MHA5a1F4NXgwZHg5RUF5OUpXTnR5VW5lWlUz?=
 =?utf-8?B?MFJrVnZPeFFVRFFKYVpvMzB3WW5vYXVsS3lOSEh3amFvUFNWOStXcUREc3hh?=
 =?utf-8?B?OUhxNFU4aXBlUmV1ZjRSYW5iTW82Z2cvcHg2YU91WW1BNFpLWmNNcE9taTJ4?=
 =?utf-8?B?QXUzUnR6M29MazdLMUdJUE10MUFDUlBhd1dZbWUwTTBYVjFkcDZZMUgrbXlK?=
 =?utf-8?B?TmdmMFJhZy9SRVFIK2hwV0p5Zy8zVXcvaVNSNElKeUF2WHg3Z1ZuREUzT2Vw?=
 =?utf-8?B?cFRMenNCMExvd1lnNEx3R0k2WnRYdzgrWGZlT01pTDAvYTFWTkFPWkhJbzdl?=
 =?utf-8?B?c200akNMci9mWUt0UHJtUS9oNmx6U2ltR0FjTHVrdStURmxJOFM0SGZCZVNZ?=
 =?utf-8?B?V25xaTZPNVhSejYzSGkrWmNRUnVEM2RvZzVpNEwyWEp5RWYrT2lRZkxmM0NJ?=
 =?utf-8?B?YW4yTVVya2NiUW0wTTdVbElpcHpsSWQyYlZqSTQvS0d5TTlrdHZ1MWFsL2pV?=
 =?utf-8?B?M2g5N005OHhpdEczVUVFTnJkK0gvenY4dTVzLyt2M0dLWm13ZERFQ2NuM3VO?=
 =?utf-8?B?NlhtYWMvNERBdG9XeEk3d09DK08xbDBBR2MzeXU1YUZyZ2x3TlRnWGhhTnE2?=
 =?utf-8?B?OXYyRjZxcStrSjRwUlJ0WEtZUkdHRmRyQWVxbGFVV1RIemttY2pxYzBqNmVY?=
 =?utf-8?B?dlJ0Rm01ekVFSGJTT0lTdGVWS0gwYTQwNEp1TnE3QzhJZzZuT0tKdW05bmNM?=
 =?utf-8?B?dVBTSWZhQjNIU1YzZW9xTENLVm9yS2J4NXV3M3RpbW9kSWpnQzZidk4rTExS?=
 =?utf-8?B?azkybjl5U3U2Y3dYcnQ5RUtXTTNYMGJsOWtMU3paRE1FWVFYaDM3czh0YStT?=
 =?utf-8?B?dCs0SUJoY3pHbXBEY3RDQWFTVlY2S2JqYUV6TjdiUkMrc3p3RWtwSnUydjJq?=
 =?utf-8?B?RHBVNG9SNlFNSHRIZXo3SG4rT3NoZ25YV0YwTUxLcU1VZE5sNUhTaXNkd2FB?=
 =?utf-8?B?bHlKYUsvL0JqUm1Sb0FJRGNjMXQyeXdwOXFzTGRlM05JdUVHYk03dFlWQmFi?=
 =?utf-8?B?SE5OYnlZOFB3VERpQWM3L2ZFSm9lZEVUeEZ3SmJFK0JpMHI0Tk5tZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e91c4a7-fe65-456e-90ac-08de70dbe9d0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:58:15.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmm0W6B2TX/nxQoov3q+cf4UwUIXST0yoqeP8PvhWOAVL54NmsiKXbGJQZEKKwhXFZRcANrJxCzFsqII4lNDDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6096

On 2/17/26 12:04 PM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> Hopper, Blackwell and later require more space for the non-WPR heap.
>>
>> Add a new FbHal method to return the non-WPR heap size, and create a new
>> GH100 HAL for Hopper and GB100 HAL for Blackwell that return the
>> appropriate value for each GPU architecture.
>>
>> Cc: Timur Tabi <ttabi@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/fb.rs           | 14 +++++++---
>>  drivers/gpu/nova-core/fb/hal.rs       |  7 +++--
>>  drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
>>  drivers/gpu/nova-core/fb/hal/gb100.rs | 37 +++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/fb/hal/gh100.rs | 37 +++++++++++++++++++++++++++
>>  5 files changed, 91 insertions(+), 6 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>>
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index 3a2b79a5c107..7c502f15622c 100644
>> --- a/drivers/gpu/nova-core/fb.rs
>> +++ b/drivers/gpu/nova-core/fb.rs
>> @@ -98,6 +98,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>>      }
>>  }
>>  
>> +/// Calculate non-WPR heap size based on chipset architecture.
>> +/// This matches the logic used in FSP for consistency.
>> +pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
>> +    hal::fb_hal(chipset)
>> +        .non_wpr_heap_size()
>> +        .map(u64::from)
>> +        .unwrap_or(SZ_1M as u64)
> 
> This should use u64::from_safe_cast().
> 
> Also, I already brought this up in the context of GPU buddy, I wonder if we
> should just add SZ_* constants for 64-bit devices. Shouldn't be too hard to
> generate the corresponding code.
> 
> I think it is a repeating pattern, and having to use u64::from_safe_cast() all
> the time seems cumbersome.

I've added two patches (for rust/, and for nova-core) to the end of this
series for v5, to just fix all of that.

thanks,
-- 
John Hubbard


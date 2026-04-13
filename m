Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D640DFA7;
	Mon, 13 Apr 2026 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776114497; cv=fail; b=MFkBeAz1p5bonuO579eMKisRkO4dlFWbm8d4klZNsdff0+VoyATkCtCy5gPkg4eeG3tFGP7zM6b4peT0vBhRNp7APjm2eE8OGSZmRNcE43IfdHGtZ+1N6UvOvTyJGbYY1VKnU1djwTRpDAZmxcNtAaKkU+lytEhVrLnzmGMpuUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776114497; c=relaxed/simple;
	bh=CQ3Wlqj2Rz/ZXZmsZBmDfL6Ocgz4X+/VFndtZhXn1yE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JeejJq51XqCApIF76rgpLUbOKNRr0P/Rur+aKCxvhYESazsRZwHs36i7JOztVsrKu2kJdKurj/Awf+ajCp1ZzSAH2/x8nXUeW4lPJZSs37K9tBaWzrh5NRY5yDQxUUIU7OmdzADutB1OT05JierC5oREC4wd/Kv/2IqaQwxLFtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s9V2vDTU; arc=fail smtp.client-ip=40.107.208.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s9V2vDTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDDUAMXlKN6n26O+aR3wRYSiezGEmGiXPysv97Nc6kP5QFY3/GdOYswk/Rt8C7P/YdDtDGBizoX0RE2FQ56sCHAsjniDruB7OMweAVfv6jGWREkzX8TArqhp81N8Oxrkrfl1X7bjxtZliT6XgiWI5uCD4DIwh9WZ3RpzhSzLs9Ld5jMI/im/h95cjnOhd+Agc1OGYrLjJ5W8X4lGUL9ziciLbDuBEj1UHG4Lm9oosx4HM7/PWnKgT1leP+rV7w/8M32JA5lUrj3rJDu+I29Wy+8dyZMfLrtUH6kFacxYn9+0Ran7b6PGc+tfhutkMklXB3Q05FEg1ye0ZIy5L157Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsj3IIfGXPtpiDisyTelMQffDbqrnpDYRDvqUropdr8=;
 b=BNJS/OJi6VD91rGN87U1S3rHKg02u4x67gy19vnPPGUGuzTKRQ09zZsIO6+RIm29GSr/El0NXRZNOkTfMsZdJZSIFEAKC9fesSRfgRTyizX25ePoJ6A49F7fUX1yn3tb5sRgZnyzHVtJUTzjL3ny3LcMMPx0czT0VdzGF1yMAUdZykYX5tpNdqVXSK5zrqzM/Jk3B8WS4jQYCJlCsBeO/cCuhADmQVQKNRW+F1xJGJ1ZyQhiVpNkJXSa5ez4OxQs6JByLPSSuD9B9H2uXPRL4SwyJSZl9LEvHK00sTZYzJaUAnIM4yijJqVS2eI74Us+ZUlE4kiLQC59qPA/Xb6/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsj3IIfGXPtpiDisyTelMQffDbqrnpDYRDvqUropdr8=;
 b=s9V2vDTUAi+mbh/2ybIeZ86PnVNh4ZjV/+2rAwio5NHHKom1MTD9x7+G3MHL5Drszq/1E9W+t4AKoFd4lZRgCEWUt0SLRULmt+h5/nK/NusrXWtZwo8cKzo6glZZcBcumEeG9QrRL9fu9E3S7lh0GiKs4XQzPMHtXUcCTxN+EzYOT9X2wRDvtkFZIll3u5MhIl3/IR9xs7oFfTKVVqydQK4qLyDqTpcWwKrBwPkNV3nyy27GYIxtd4WQlvCkqCVPCsUkZDYfaSs++yh7ULTd1iXG7q4ryYCSWLkb44RM1G9Qsb77sbE5Gm1ZF2LKE1IVov0kJ6UCEWlRb4wQUPgx5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 21:08:12 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 21:08:12 +0000
Message-ID: <cb2bf998-55cf-466b-a6ba-1851278bbf43@nvidia.com>
Date: Mon, 13 Apr 2026 14:08:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 Shashank Sharma <shashanks@nvidia.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-4-jhubbard@nvidia.com>
 <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: c08151f5-d1b3-467f-4580-08de99a0c5a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ci7liSIv+ypBS/qmbiKDo93pHGeVEPm6cv5AC/llQjWGBY5eTvfEZX5Li+jy+bj6aAJfP8pB/JF7sJArvzoiv1Hjhd4tRNVyfwgNfvIfPrq7kbNjvfquzzBATVrOhpielDxNGBClcQEmuDbZbrq6H+9qiYAFMsZrHTqb3Z/KWBLG0Qauk0RDvN9jtcQr2rtRDqMHQwcjh2zJIqOb4ZB80gheNodTggyIUVttcG2S7VEBaOKA0gk/l78vVmbujVDZCr5Ks4vAK/fPEu/uuwAZs/mKJLc6iBqHRdu1BCnktt4TswaixtiXdFNY1eGy6F3V/OY6Zz20Y54UfS76mc2g8saomVayWBzGgO28+BriX0d/mD8UzxAXgTpamYd8dlFpXyTcqmaq8dsq/nebgMQw7u/NQemzbGDTTv19/j+G5ZFy4HTNJCeRTWoC1mc7bpzpcAe1lo6uvod/NhmEL+fVO1A+MvmrIdqrpKnhRBdI2Ubb5qVz16KlCrLOo6/61gobiW0XTlzH9cYTtC02rY1gmY93A3E9Z9BQlifaoVAaOArjkUBWRL4awlUJ4TJ5qqe1VzUIZuiPWAWNavYgvsox2vlxEsSzyfgHIZUMoB0FgBwbB9W9yYIWhIk+LUIwgTn8gb1Vyt0TKmjI5nSEi3+7J/n2jMFYHGC9zFrDJ2DDUfTAA10I8GLo737EpGShF5l7u1RJeMVhgOKdfOMAfLQqMgdn+imfQR8NjpK1bRuWYhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFVPWEc0UFppTkRMejFZQkRDMVJRUHZCQWI2WG5BQU4xTTExK2x0c3ZCODRi?=
 =?utf-8?B?QjFJRFNKLzN5TGQ3MnJiVncxVTVxanc2ZHl1ckhYbjBsdTRrQlUxSUV3WEtt?=
 =?utf-8?B?QjZVVGQveUxSVDFnYUxUelBZZi9yVW5JRGVodXdtSFNDSHMzbllPQTIxdm9k?=
 =?utf-8?B?V0lHZWdLUzB3cHVLRmxBdHI1M1FXYm5kaTY3ZXkwMzBjUjBmQ2w1TUFOdDNp?=
 =?utf-8?B?MjM3VklJd2lhakV0WllyS2IreHFBYVFyOVVUOVcxNXAxT0xGa0VTRk9VT0Iv?=
 =?utf-8?B?ckhiVnFLc0ZzMERDTUtNK3FYYWNxR3NiZU91RUFwN1NTYmxJV0lNR2QxVHls?=
 =?utf-8?B?c3I0aVo5aDFnNU9Lc1BJRU1YMHFNTldaelVQbmw2S1BFSVpqZWwvUGhQVkNQ?=
 =?utf-8?B?K0liSkg5aXVveWdSNWpKQnJXRk9GWU0wRS9IaE5BaFkwNVJFcG5DcGt0cHpT?=
 =?utf-8?B?dTlOZWR5ZW90cWNVV25sL0l2WkVQMEU1MXJsOThiQ1BDbGdzRkgrZHhWQ0VZ?=
 =?utf-8?B?Ymo2ckNkdWhRRU1VejVwZDZpcHBzVHJRaTY0MnJjWkZEd0xjTTFpZ0NseGE3?=
 =?utf-8?B?bGVhTUpHQU9KbElKN1FTeDNlR3h5bzZIem1lbG9jcWxrSjZWNTk0K1A4UzhC?=
 =?utf-8?B?RVpXQlcvOTU0RzlYeU1vRnZ6YWVVTDhUaWhlVkVIQ20zYnVnYTVldElGdGZa?=
 =?utf-8?B?d2xoOUJKRkpUbHFmRnVGQVpVc1lBWU1oYUF2R0U0dWNGWUtLYmU4cjRyeDdy?=
 =?utf-8?B?bzBwa0k1ZFJlWjU4cU0zenR0dUtkaEVqN2pObDZkdFh5dEFBS0NnV09RaWl6?=
 =?utf-8?B?NVNwSE42NlBKOGJybmYvMUtaNVhYKzZqV3ZacGszWUNlZUtMdFl0WDlpNkZH?=
 =?utf-8?B?S01CYXMvVDRjdmF0Q0JGdFBNK29qemJId3NRcjk0RkNVQU5KWXh0ZU1EcDR3?=
 =?utf-8?B?Zi9ubFQrKzMzbC96ODkrTVd4WlhobmVmN1M1QkludFFkTDh6RWRMUnZIeWpB?=
 =?utf-8?B?Tm5vUjV4S1lzRmJUSGhnS2xoNXc3NytYZnJiWlJ4YnFaR2Y4SU56RnVLMVYw?=
 =?utf-8?B?Ujc5aHZxMHBIR0FjOExqNTRXYkF4WWRUNzNJRzl3OGI3R0lrQXdSV3Q0Y09Z?=
 =?utf-8?B?TXdVY2FJRW1rdFEwTzNBTjFQYWlKeTBGb2NPZ2xXSUZRTGxpSlN4bjVaNWdl?=
 =?utf-8?B?b2dFZHUydGJ4NUNFNUVObDBKTzdMcTBCUkQvc0t4ekNLbUZNakhVM0NLRWM2?=
 =?utf-8?B?OXN1SnhDaVRjR0JTQ0w2dGJEZHZKczllbVhoeW5TZVd2VnkwdWpjbEowd2k1?=
 =?utf-8?B?cjZ5TU13QnYvcC9rUGNSWnBTSnk2Uk5nZWczR0JkQUNhaUE5aklyNjB2Q2lU?=
 =?utf-8?B?eTFPREd3NmNML0EyL3VDY05RUDRVTjYyQUxsR3Joa0w5T0hEejFTOU8zbUZU?=
 =?utf-8?B?cUNZVTMxM00vOFJWTzdUM1ljaTN5eWFnaDVGL2RBYUF6KzRZSFpPTTdibUM2?=
 =?utf-8?B?cUdqcjBMclMzZVQ2akp3SWRYY1UweGJKQ0JoeXFRTGxiWFdMTTVRckZYYzZ6?=
 =?utf-8?B?YU5GbzRiKzRraCt1cHFDSEJsZzAvT2xzZmZwVEM3MXBXTGhUY2Q2SEFEamdJ?=
 =?utf-8?B?TlFwbzhMZFkybHpZNUhodDdFUTVuOUpVY1crcXIwSnpLZ1p5VkZYeHExVE1C?=
 =?utf-8?B?NWNHeUwwWFo3YkhOUG1BMDExWkdSb05TM1ZuY0dHZ05sRzIwKzdzZ3NUckdm?=
 =?utf-8?B?dEZaWGtWMnJNeFRYTjM1RlhFRWxkZFFVREZzSXliVVpRcVdVelJVRVljZnN3?=
 =?utf-8?B?aFJRRUZBRnpLSFloa0Rrc1dBY1lPVWpBczlTSWNSejQxUW9EcFQwZ3BTSmdm?=
 =?utf-8?B?ZGlDdFdUVmw5ZkNJcFQwMUg0azBwdmRCdjhPNHBtd1FTNDhPbTdWcWJ3QXFK?=
 =?utf-8?B?c2FQWVFmbzkrVjJnYW91a29QVHdsOEcvNmJjWUtyaENJeVgyQmk3Vk9pS0h4?=
 =?utf-8?B?SUpTTXN3L0RWMFlCbjJFcjZ1Q1BEOGN5M1BHWjN6RTR1ay9heVRZeGp6R2h2?=
 =?utf-8?B?UU1iR1F5NWcwa0VGbHp4YVdQajNhTkpWRzNUMEpEUWFFVklrZW9oM0hGdDJr?=
 =?utf-8?B?bFlxa01pWjM0RE9Sc2ZFdjZPM0QxZVM3QVAxRmJoU0FYWXBwWngvTWpJaURV?=
 =?utf-8?B?cUdWV2p5b1FpTXJ4eDJKdkFUa3lsRWpka0k5SXZBUmxFN3d3SXhsQnN0aWJK?=
 =?utf-8?B?dVVhOUU1Z3pjNnZRdnllS2x4L1h6RzZrWmlSdXZ1ZTNEZ0l6VEwrZytjVmwy?=
 =?utf-8?B?WXQ2UDkvWjB1Z1JiKzBqcGM1aGdNYlFYYnYzak8wTmJ4SUxBcFNoUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08151f5-d1b3-467f-4580-08de99a0c5a4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 21:08:12.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RnGo7mA8MFrbRdcB5BqqialUPUDz/CdaRrYSI1yZ48VHVx+r4dTinhtcIj3GUsx/3pDtCrtyp8RokSDtmeWQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886

On 4/10/26 8:58 PM, Timur Tabi wrote:
> On Fri, 2026-04-10 at 19:49 -0700, John Hubbard wrote:
>> +        | Architecture::BlackwellGB10x
>> +        | Architecture::BlackwellGB20x => {
> 
> Can you add something to the patch description that explains why Blackwell, unlike all of the
> olther architectures, is represented by two Architecture enums?

How's this:

Blackwell uses two Architecture variants because the hardware itself
exposes two distinct architecture IDs in NV_PMC_BOOT_0: 0x1A for
GB10x (GB100, GB102) and 0x1B for GB20x (GB202, GB203, GB205, GB206,
GB207). Open RM maps these into separate chip families with distinct
HAL routing and different firmware signature sections.

thanks,
-- 
John Hubbard


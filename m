Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497CB3CFF5C;
	Tue, 10 Mar 2026 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161673; cv=fail; b=mQ1lVozRHpa+ilyEnLzS0z2lZozCwEL2WSET9rmIhfLqnCWywT2TBN5DElh2PdpHUlHk1zDzD/zucHhhkBRdjHDtHpU96Oj6a96gXbvRGUV1UM09Y2ZDgIPpBtHtXwHipqel10/98UhBwaiRFym/HQBgLE5FzbGFTUeqMxy4xUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161673; c=relaxed/simple;
	bh=UHYiRv1nIYm/Omuhk7syZsYrefymVB9eTO9oqmGHZyQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tKwToFOzoIX099VQkOcbxxubXFMFMzW0QBP4qnE1paNX9cFXP6ldldN1FM8wZzrsGtyPM2ZTWtziXspcaYtRvglzLTPfP4i5vJOcDnFaCs7PAigsA8BqQiKVibxIO9EwIaEjJMIYZUCLvPusUBanjy4tSFBIRr5KWBzMWGHH2Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mTD32Dsg; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTD32Dsg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EysYzlCJ+ePjU4YVFjUytdp3wEDo37fXk8MerVWSsXHTG24Kn8AJzxHPXaJ4Fkr+jCh70gKi8fEqWUCz1IEuRlQslKKJEEIkdsEXF55sX7aoGmulzuug0YmJ7W6+OmqnwRqgMR/tMQ1Y/znI6EQ6SO3HdYGA04j1SiI1F12QRADyVyGjDeowK/UjUm6Tqvmev2O6Bt1qIy1Rt8BaqILDCkFUmMpE0N/gXyGr12c2H04Bnj2Qty9xFSi9+F62LnIb3kL7qlh22ALAtLXvXUvabXS5XvuT1pg7f6MX58GnEj73fyYVowY/QZHUoyC9cPfx+THYdS+EDp+qTbpGyugPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl4L8fTHc5qMOpvfSfE3K/m81vC1fGgYj/QZ8CnflpQ=;
 b=UmbMWBqog/HyBigBJr+redTcagPWUk0nKUEQITjVTJ6cRuEN9ak1frmifmsT5V0azGurj+d/Igdm95qzOdEOQOnEgGt77a2vjkflWWhs0j+05EaxlcEH43vIE5aQ2F7pfJmC2WIQPU8CEefvYtOCGHSdYIIy4WWIZC0vSQx/NNbJloOp9ORkxGcZc7EOmGCol/5mMO/aPoN+iIxRvF3hvieEnMKdOey4CDYRM3Um+hSCb6/GFC+Sc29RA+KcFW8zqw/8QRBU4nKsLnCzmHFAoCcxMVm8lJSTg+7H/U+2nyePAPLNLOkWtnRvz3/3Z12Zq2m2o1F0i9qgFRvNRLj3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl4L8fTHc5qMOpvfSfE3K/m81vC1fGgYj/QZ8CnflpQ=;
 b=mTD32DsgTcmuzmIpP0ypwdj60hhzCnMXJO340MTukI/XJzpI4vN4MQOdYYKGTCNIriwFpzM1xRgWVp/Y8903eqAq4IwsfTj8OrLVFcEo+zreSoPCxd4r6brB2a6OM0X32uTYXhaoiV9LKkZTjdA+LEXx8Blv4mxq0JNXkVAgAZ/nQp8FLSRmg5VxJxLsmYARoDceMy9Ve/hVa5rqxF87kHorsx+RgCgr7IbD1NShVVaz3X/y9hOm5FHryR77sO674tz08ilRiheFYlICjEZzzWkaz+ctkrh2jBv6QplLsxnHEqESQpjts9z/4s04ZtNYOYTiOUYmNGVso3TLY2AyGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 16:54:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 16:54:28 +0000
Message-ID: <d94f1640-38ef-4a60-a179-4db587b0419b@nvidia.com>
Date: Tue, 10 Mar 2026 09:54:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/34] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
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
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-4-jhubbard@nvidia.com>
 <DGYY4SVKBYUK.2P9ZLCZPVOLSI@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGYY4SVKBYUK.2P9ZLCZPVOLSI@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: f21bf9b3-4047-473c-08a6-08de7ec5b14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sZrgP2vit6sp4wGsBUqPRUFZQj2JR13UUs/2fMBVf1V1D833Q36Ok6L8wL7sOQ3HUsi7AW1xhjmrA1AT+oBo2qTiX1rkHneW1rgzbxN7awX87F5uIsq4YQP7okgkiVljZQzoXSaDHN7EyEFXwE/VE86lFUz+5x/uDcY2dRo6V9VIsepEl7szbNdzQT+ZRNX43vf+1KJ9QMKQOwQFQnZQoYq3eXaHjkw4qJSGmE0xVw9y8pJPrkKDxcgpo2WsDffMC/x1XMejB9G4tMHbII56LQ6g1TdcgQGfrHjWHmh15PuxD5AKxcWNw0WLwPI4OIHYFXH5gB2qPTKdUKjqYmCs8NQFveJlSv9aTSamYTyVdvHYr3dUGZ6cWQCuAlCX92jPYsAXfDDjkpkt5Nvv8zWXk44zI3rbnsYzeHQ9aXN1p1Z0wqRkWsGsSUSg/JkM604U7VtuvhysgH2YKrt34E5m+h0hcCs8wSa12OO4aST9nMPGSXl055WYZ4YIEKcB+SVOlj1b1KgywoW5+plGz/5jDTJiLlKSXsr28E+mYo6LHgSpRWTIMgAxv1RAVlda9qQUQVafSam13QRmmX/tvZ6+prRZsm8iHcDEu91Vo4T5hoHOl0xAWIUK/oE1xloQn7S1NmeH5u0VSL4g89eksE7eWfxC7brZdDFiZZWDxjnX60GAL4jDhD8694eR1NT5g84YfUMFlih7YrNQewCJ/5DeJ4YHNQHPc35FtQhIqJHAtzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTZFWGlETTRTV1B0N2VPcXdTRHlKNXg2WER6Sm5ZZC9wV0RpUy91ZVF4LzNo?=
 =?utf-8?B?NDYxaCsxNTZPaTBVZGpDSG5ldzliMUYzYVdPMklMSDlrZUxXR01HMUNFUG9u?=
 =?utf-8?B?aW1JcDA4YzdUMDNWSXgrck4vdzhRWjRhcW9sbEtiS01KMTZKM2FuT3pOZmJ6?=
 =?utf-8?B?M0tFRXhXOXhYZGQ2VnZjR1VUT3lISU5GNFRyNWRKWEtvWHZWMDcvd2JQQUFX?=
 =?utf-8?B?RDR0WHM1b1RzNCtScHRTK3NnVW5mY3FoZ1oxUGlFMXA4TDlMeFhESk8wOXZO?=
 =?utf-8?B?VlFOU09xY3Flb1hyU1VZWjBmOGg0SXE5MktXVmk5MENGWmRpSU92TkdndGJF?=
 =?utf-8?B?UFdGQ3N1aU4yY2k0Q0RXRFl3TzU1QVYrQkEwSWw1eWtldTJPQjRONjhRRU8z?=
 =?utf-8?B?WmMvS244TGgrRzNwVWxPTXFpSW5iaHFsakY4OFloNVZ1c3VWenhqQzV1NkJT?=
 =?utf-8?B?OTNBRkhTbGFYZStvT1dsSm1oMk5MZHpiTHlmVkp3SHlIajR1Wk4rZzYwbzNk?=
 =?utf-8?B?TUk4NnM1eTRwRkFyYko2cGVzdTBobldBbU5UYk5Xb3FsVFROSG9qdDVCKy9w?=
 =?utf-8?B?eHZuc3ppTHpkSFRMQ0tWOC9NaTkvc21jMlBNMXZZYlhwc0tJbllBckhlNkJS?=
 =?utf-8?B?c1h3anpsQ3hZUDVjYlJvcmV4aDd1TTVuMzREelRMZUdFcEpwSC8vRTZWUTR6?=
 =?utf-8?B?NTZZMnl0Y0xwSVZqN1J3NitHLzdxRXNqSEZ3S3ZyS2RlN045ZkszZmkrekxW?=
 =?utf-8?B?aVRaRFVONklrY0VEb0g1cnk1cWFRQWd4VFJLWU9waHVGWlJLMnNiY1NBcFYx?=
 =?utf-8?B?RUZuNUVRMGNuZDNXOG56bmtXQ3VLVFR4ZXdxaEFRa3BUQlNFQzFSbXpVWnVz?=
 =?utf-8?B?YmJ0ZGRYRVdQR29qb0dqQ3YzTjRXVzUrZHl0R0NFVXFjU09qcC9GVzY0Vlha?=
 =?utf-8?B?bXh5Q3hoTnVGMk55WjdXMWNITHkxQUoyYmdWMGlyeG14VHlBNWg4WXZSanRB?=
 =?utf-8?B?dmcyZUJMMEZHZVhwSmE1bFFkWmdTM2JGV3htTGVvdXdBRXBndEtFd1VMb05w?=
 =?utf-8?B?bWhpZGZ6M1RPVGQzWkJwSHByQ1A0blltdlVBQjN0aGhXUHN3M3dwNGRPa2pr?=
 =?utf-8?B?UUFrbkVPTDNnand4VGk5OHdiY0tZS2hsMWY4VkNkVHZTRWF6c1BKQ0YzNW42?=
 =?utf-8?B?UHpLbzNLWGEycEpPRXFRL0xjYnVLdXRCaTU4R1NJY3N6RTc3Y0hGTlYrWW5u?=
 =?utf-8?B?dWdGb1Y4MDYwWmx4d2FQUFAwQURiQzd0d1BZK3NydEltcS9yOVJTMTNGVWdp?=
 =?utf-8?B?U3hUd25HUTJYalRoMWI2T2JkSG5yeGJaNzJwVXFaakJubUEyYndOazFqMlRQ?=
 =?utf-8?B?RmNEbUpwdHc0UVB6MDlTRzA0YVJubUYwZTQvWTFZcHE2WUZacnFXNENTV01z?=
 =?utf-8?B?T2tmRDBCYnUwMWNKUXdYU2ZCMTlDM0dKK2puZEZrV2p3ejVUek9xYmp6MDVt?=
 =?utf-8?B?bkJ5WG5aVTNFWjRuTnZkTGJEa3dFQ1doVDlLR0tIRGdtWUI5SHg0SjZ2TnpV?=
 =?utf-8?B?d0VpeWJIWURFVExxZjhxajVMRXVvbFBxbUhlbjk2cFJiaDVIUkFRYTJsa0kv?=
 =?utf-8?B?a3R0b09Vd1QvUHNaNTk2VUUyM2NFbExxUnQrY25CSzBlVGNWNzN4ZGdwTXNt?=
 =?utf-8?B?czJHTFpWNDJhQ0VHZFB6ZTV1czFmZVlCWmMrWm0rMGRTa1A4ZlJPd1hFaUJX?=
 =?utf-8?B?eWJZOCtrWTFDbzhIQ1cyYnhQd24rWDNCQ201SjFuekNPU1BGRUpjckJTUTZl?=
 =?utf-8?B?T0ZKV1hZRDVMQVo5YzNMTGhqd0FDQ1VFQ0lUMHRDZGpIajdSUUpSYzdEYVAy?=
 =?utf-8?B?SGVsRWxvNEhJWDY0dmhtK3RZNHhkd1RWVElzZk1jYm1iekpERW1aMzBYTk1I?=
 =?utf-8?B?Zi9vQU1pd3BCeDF6Uis5RXovODQ0NnVRREY0MUVhOThWeEhCK05HUEExL0dC?=
 =?utf-8?B?V2lHNE9hU2VyV05zMmZsRGlsWjlxR0lnU2JFRklTclBONk9oRzF2WTdCeG9w?=
 =?utf-8?B?TVBDTXpSK3NKY0VPTHl3LzJodno0TDNBNTY5VWhGSlE0K1dNZ0NxVDVHNXNm?=
 =?utf-8?B?Mmw5b0NHKzBKYWpFY0phOUo3aERUT21xbkpZN1Z0dUR1b1l0SEhVRmRIaHB6?=
 =?utf-8?B?TXJwaFAvYVgzNWtxUm9qa3hxbmNLT2dwU0dUZkFUcHRqcjBjK1o4OEZNT2ZG?=
 =?utf-8?B?bnhzVWpYTVRGVTh4Sk5FM1AyZng5M1ZBK24rL0svbnZEVnkyUXlMU3gzQ29Z?=
 =?utf-8?B?ZmFtYnoyZ1J3RTBnUytRdFdkS2FvTm9CQXkvRjdRQ2hOdE9uTklIdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21bf9b3-4047-473c-08a6-08de7ec5b14b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:54:28.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGn2H+768Cmqti8R61YyXVfJp4BCZkZGIGkNZa/U4iNV4huaAs9qHu3HIgv07PIlp1av3kVXFD76pJQl6858FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

On 3/10/26 1:06 AM, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
...>> +                        Architecture::Blackwell => {
>> +                            // Distinguish between GB10x and GB20x series
>> +                            match chipset {
>> +                                // GB10x series: GB100, GB102
>> +                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
>> +                                // GB20x series: GB202, GB203, GB205, GB206, GB207
>> +                                Chipset::GB202
>> +                                | Chipset::GB203
>> +                                | Chipset::GB205
>> +                                | Chipset::GB206
>> +                                | Chipset::GB207 => ".fwsignature_gb20x",
>> +                                // It's not possible to get here with a non-Blackwell chipset, but
>> +                                // Rust doesn't know that.
>> +                                _ => return Err(ENOTSUPP),
>> +                            }
>> +                        }
> 
> Can we use the same trick as Turing above to avoid the double-match and
> unused catch-all statement? That would look something like:
> 
>     Architecture::Blackwell if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
>         Some(".fwsignature_gb10x")
>     }
>     Architecture::Blackwell => Some(".fwsignature_gb20x"),
> 
> Note that this is not perfect either, but it is at least more succint.

Good catch, I was still in a Chipset mode when I wrote that, despite
having the Architecture approach everywhere. Fixed in the upcoming
v7 series.

thanks,
-- 
John Hubbard


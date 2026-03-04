Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7347E35E93F;
	Wed,  4 Mar 2026 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651702; cv=fail; b=X60Rvf98xm1J294NJmVSjLugT1prXKXVffe0o5kKPSW3UFhAjxqPV55hAMZpef5OjKKAtP7JxNpO5qRu2CfcjZMQDaW/mrZt0hNazHt4JHnrH1Ws4kvnM5ellcJavbmRF72pgep2QDOz9a0JC5C1vUF+RYVf+u48gz38AK8/T/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651702; c=relaxed/simple;
	bh=2h1OmaSWaFu1DK+V5ZEimdWlXvpzwwHNXhsRB6DfEx8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MtN+KM9xz9u9khWgVz2q9fChbzqXU5RoegHEv0zoXdpK1pxxfYlfBgLlSuOzVKtAdoY/pKGAbJHiBowCcQR49/aXdoA3eYH/lHBnQdylzSDVSTr0y/ALePBh8awTTevVpP8EwwJnt1uB2MZtjb0Fp/EvcCDkFol3UsC5y8u7iQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LGbCW8ww; arc=fail smtp.client-ip=40.93.195.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LGbCW8ww"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu4wGHYdpSYoWt0YXGVOcupMiZbiehO50KAZ4KjzFP/OU81Mucxt9GKAkK64mQdBLdt8RNvXtrgwJQLKtE4/b52Rtft2e6yrxjM7rkqXusNhUL9C1c2Y1ILU68OMK97aI54vd0MOdUR6ElIeDonB2rnxTNZId4yNV+RIBll+5ZY/sv3JWpiGVY+/2KkeLn1HXU1yTsmLmStF8p9ElLQ/jUM8dfh97Tu3YKIBB57vzslzOpiFe+5zAO+BZf5MrVuDmC6GQEYej9YCY7B7iifxJUY6s+nU04UjzpLU76Xt6WhEolfdVr2qSwWTZhh72FIwRwPn3gUs1ApAp1/9Jb2XrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmOtSpv5zR5NGKWHdIkfMUkYlKCkjdagtM7SvF0P4hY=;
 b=m/pmKvtnKlWjEESL9wcovDFk40VJUlzBETVo0PpVEgeJY4kl0UEv+NBEcwwc2Y1vRdkWd7M2SCQJsK7IFvATIK5DNAGQ518gyEDoeZl9YMsNN9Mu8agxFvBVbjJ9XgO0b01EQBpaV7/hb6i0NmN9BQ5Ick78Z1eV/3j+nNRXr85XeweXgT64BrDm9+xT3kxlrn5XmfFAk6MF9CzSLDULgCTjq0CHiwBroUclqYU+CXiF87X07V2jSnarSU14i4dvngTr149CiHcjP0SQByvonqwIm3XWspBWOfeVZPJjq0FJa+lDOx9cDNm0p9o8YLsaV5H6TzKhp7l941htbWbXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmOtSpv5zR5NGKWHdIkfMUkYlKCkjdagtM7SvF0P4hY=;
 b=LGbCW8wwE2bx/TJpHvSMELEVakiEkOlREFk/7vDiusxUrI3A1sU3CHhlvcFB3oSBmuhyjjZ5xhG2Uhbq/+gJUjEHho0hBn/qfRGYnPKJNTUctz20NFwuUsw5zv9W53IH7tWgwbXn5f1BiURyrNu3+x2SQatEA92TjBc4WVJmu4wIQ02FqPM8c/wHZhR1jzAPqt0EwYS8gGDvvlRccRhD6Q+qpG46cbZLCdcp5qs1vskp36yynRib2kSd0jR4QF+dtI2lnaq0zMdYT18hT1bcCMxQqbNZuG39pJeVEtBBbTHR199ScLlZX8CAVvQ93H7p29d8LxFsnhWcCwPsPI/pEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 19:14:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:14:50 +0000
Message-ID: <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
Date: Wed, 4 Mar 2026 11:14:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a51e403-27cd-46fd-14d6-08de7a224ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	5NG9ye6bIHnN8CSUMTlokzH4Msm/h2fTfi+qL2CNCaqNiaj1LDUDTQT/5+CX/XqQIZj6lsjgvIUxDoyU6Fo36wcSbRG93FC6g+QKlN6MDs4XvMcJ6Ri/MP43YNMHN7laf0tg6eww6NGkeBEpCaOdTyYao1dtCPJRHxt+PbolQ0eXhXFBflK51rCtl1lGmTMPTtDn2N5x6jqYgHujEDnw1gaSnVRsj8i0MiNrlc+nS6IKAy0gzM/I881UpNr2mQRiqockUbrRIeab9agyZ9EL0O8/2063m5HHz3h4bwLSU01W7Ou631yr+h+fk03JRJfgeXdN/hScgN22o59CJGggz9oMhynEpz/N1cMuVfvM9JCsyF34cjFlt2Ux781Idl5c8XnRs5e2dlzQcM04P27AjDzkY+ofjpDiCP/IFXRq/a28cccWekzQi4o9XYNdjL1yoxwZq+EVA9qTIhjl6MmY8Wce0uesc2mCGiQVuN38vjGpMPzmaA+EAub1JzzkdHxI0aJ0QskhPPemheDw1rFb+Ohp5V/gqRvR/ADpUVQWw4kxm1hx1M9VlKdasCnESKQ2iUmQrdhgegM7fEG6PxZn4JvCreqZYkYCA9lkl9nG9T25Zrf1Bf1KDzhA9MGxgrlpG1wZI0p2E4RgS0uIJzjyEz2zHj83lJ9u09YiZOwpGEf+/2GqIZRV4MqBfb8MoPo2TkmmyUEDky9tw/0Hg693GqGxnXOlI0EjwFe3E0Nb830=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVUyNGpkQzZpbTRmN0hhNlRFSzBlNk9QeFlOMk1PYlJERit2Z2J0aVBCcU1t?=
 =?utf-8?B?RW1MRzF0RGxQdFk4OFpkdkcxcGdNVWlwTS9qSmIzTGxMT1hjU2hDblVQSkZX?=
 =?utf-8?B?MHovN2NabER2N1ByOFdmUkxDMkRxN3N3V1hiZUZ2ak5RMURlTlAvelhnckR4?=
 =?utf-8?B?UDJYNVNqb29CNzU3QWNqQzdlZGdpVTNrOXIzdFVvQlVpN3R2UVlxa0lNSDFw?=
 =?utf-8?B?RVBRQnRPTWkwandlQ00vREpkdXMvay83U3VwQ1dycjhweVdxM1JiYmxCY1Jo?=
 =?utf-8?B?aUVQRm81MHpYOEtQKzJDQ3hZYWpOMzUwMXUrRElYMlRac3pzOHp0U1lZSXhs?=
 =?utf-8?B?MDFPaHhxQ054d0ozS0JwT1FlcTdhWjVyTytiNi9zdjBDalZJcFZ0aVZzRXNx?=
 =?utf-8?B?eFhIUmcvMHVBYWNJNVQ4Nmpod3RRTWxCK3hpZzE1UmJPaWM4QXJGNlJZOFMz?=
 =?utf-8?B?UnlsQkZQUnhJTHArbUg1NGFhSmluS1BaWWRQb1lsTjVuWStxR29FZ3RYQk5Y?=
 =?utf-8?B?ODJMZTBnaVFaeFpsbTVPL01XdE85MXV3NWpqU3hxc0Y1aWYrdWc2NHlYN1ll?=
 =?utf-8?B?aVlnTmVqVGNNUmZka0hxalhTRzRNTXhMb0cySnUvZjExT0Foei9VRTArZnBC?=
 =?utf-8?B?WkdIazI4aWJqS3VUS3RmZWxzaUJ1a0lTWXBRdVYvVW8xYWRCQ2gzTktXTG4x?=
 =?utf-8?B?eXVzcEkwL0hvaUowM2hZNklFR1ZhVXZZVE5JOWw1OXFNeWJ5M3VRTVR6UmEw?=
 =?utf-8?B?bk1Ta3NZR0NLU2tXUEJRS24xRHZkaWNhbGNXKzZVb2orZmhvMzBXOFFmRVRk?=
 =?utf-8?B?Z2U2NEswcWUxNVJjOTVaZk9ZY2ZZMGZZTWRqK1d1TzlBYnlPVHFac0RJVzZy?=
 =?utf-8?B?cDdOaGhoeEhqaG1mb0UxQnFNVVBBa20rV3NkaUZpRDRNMEF0OENEVlErT2tm?=
 =?utf-8?B?eUtoZUlTMnl1cVcrV0U4bUk4S3lpWk55U1liZ3lNWDFRbUNjNE9kMFRGWmRi?=
 =?utf-8?B?ZmgyalVWK2JBTVUydm9TY2NxNUdxeEE5aENQOE9oeHpkUmFEdW1Uem1VaHhU?=
 =?utf-8?B?T3B6R1V1VGJoV2ZFRnhiL3RnM0VhMi9hZlFMVUFOQUVGQlF0SGV2YUhVUURn?=
 =?utf-8?B?eXVQck1PZ1p6WXZzMnFnU1NBVmRXZklMcVFwQjRhMUNjU2VZSWg3bUtOSHE2?=
 =?utf-8?B?VkpXemp5UXB0Vzk4RXZySEE4WlpEOW1kTEFMMW10WVZHeEJ0RGpGQzNObEtw?=
 =?utf-8?B?c0FvUnh6VkMwMXUvK3JLY0lBTml5c2F6YUlCK095eGk4bWMyaXF5TUVCS3BS?=
 =?utf-8?B?djRCaTVIdE9sT0FVKzdlT2RpOWcrWk1DRUlkeVVoN3UzbFdOZTVZQkF2WlFW?=
 =?utf-8?B?MSttUVAzcVExUURYdjJQTitXWXpBVS84MGdaVHZvNy8wR2FyTVJOeUdVYmN1?=
 =?utf-8?B?cGFjQS9IV095NzI0UHVGRWlnSVlPYlJUWGxlOGtuQ2c1d0dzODlhVWQwYXAr?=
 =?utf-8?B?Q1VHOXg3YVVvbUxpNnRzL0lFT2xmRHVoVUZYTGVneDZuWlMwRlRFcGpmQnZ6?=
 =?utf-8?B?SkVHMVF1bXhaZzlTRUdvZG5pd1gvZXhrajIzalNPd25CMGtJRnczaHZPWVMw?=
 =?utf-8?B?d3N5T0JHcys4Znk0QVJjMzFjOXRWMDdjMzJoQXpPejFORmx5YW9TY3BWbys4?=
 =?utf-8?B?eXhLZTVSMGpxVG1nUmpGUm5JdnBIbGdOWlYzUjFVM21FQXFkWnFMeGtqb2lQ?=
 =?utf-8?B?Ni9IYVkrT1lOVTVrK3lxeCs4UiticFBmZGtTR3pmOGVTOUwwdWZ5T3RFd3Fv?=
 =?utf-8?B?R05rdk9NWitDSUVXdkVxRFpjaXczTTdYUFNIQW5NdEIzSXF0VVhIYTFqb0Rt?=
 =?utf-8?B?N2pPeDBVaUNYYXJFZkl6dHhoMjlaNXpIWXVUZ01DMjl3dkpBVUVLUUErZGEw?=
 =?utf-8?B?OThWUytBZm4ycVBBTlBKWVBKMVpacnc1Mml6c3dwNzBMWFFNM3l2ODBheXFi?=
 =?utf-8?B?S2NPUERyZVlEQUdFbSs2dm5sd2R1SUVjUXdSNlBieGxNNzBCc0xhZ3Z2blpI?=
 =?utf-8?B?R0RaWWhxY29WdThhejRUUFdMUEtEMmo0VUFzcWpoYlBjNStnSmRsMktmZjE1?=
 =?utf-8?B?TnJ3UktTVVZzbE9JMEZHV0JRNXdWVHpXWDJCcU85Q3J2Ylp1OHZLZTVubjZS?=
 =?utf-8?B?bm4xVC9QRGUxY1RGTWRiTTk4UVNXUkhkdjZ0TGl6VzE2UTE3c0tMWmprM0gv?=
 =?utf-8?B?MlQ1K2tGMkFGWDlJdm9ZU3Rmb2tLY0U0TmVHdnQ2bTVTL082OUU4UG1jYytT?=
 =?utf-8?B?Zm94YjhVNU5YSGRFR3Q0QTdKRHJHUWdtaVBZME9scWdGOTJRK0w0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a51e403-27cd-46fd-14d6-08de7a224ef9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:14:50.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHnKX6KIxKTyD79dZrii1nFJ1j8ePdlXWDoYvZbtBOHn4XD/ejp4WP3RUm+5U4N45VYfampfXt507OjPvGTXTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083

On 3/4/26 11:04 AM, Gary Guo wrote:
> On Wed Mar 4, 2026 at 6:53 PM GMT, John Hubbard wrote:
>> On 3/4/26 3:18 AM, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
>> ...
>> +#[inline(always)]
>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Option<usize> {
>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
>> +    match value.checked_add(ALIGN - 1) {
>> +        Some(v) => Some(v & !(ALIGN - 1)),
>> +        None => None,
>> +    }
>> +}
> 
> I think your signature should probably just be
> 
> pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
>     ...
> }
> 

OK yes that's a bit nicer. I've done that for v6, thanks!

thanks,
-- 
John Hubbard


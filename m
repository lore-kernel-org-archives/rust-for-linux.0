Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13B38D693;
	Tue, 10 Mar 2026 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180846; cv=fail; b=bmHsGRRiL17bN3L+rzbqpYm4k9avMahA4rzErgw4XmpsQSv/CuDSYO9OQBaHaR+cLxqzc3oR4HI8/jbAjbjAHXVoBO0F4bTkuq/FoV6C7OCIA/0tfqSyZv6nRjMaVyYOBXajbAsvdtxs0bKP5ufWyB2yltrbz6h8Xf8A8N65fCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180846; c=relaxed/simple;
	bh=uoysjnCOldi2ZLkgw6U+Nq7ShXa4Q/bwR1Qr4yWj1CE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVfiuiEBvrW4xs02NoWRbnkAxtPIugkFIrWYsVMkAG+Q3kOu+kjSGftg1eYX42+U+XxArBQqk/NuzKc1aARZ6m8JYAkOIH7zx9/Uo8+sFh6naLjYOJEGZe9zaTcdhI2+954ET2q+TyUmOesO4ls1J+/vFK0xOX44w904Mnov3js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OTPlycfc; arc=fail smtp.client-ip=52.101.53.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OTPlycfc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSHXI267xaxRQQe0ihQdhqBAmWv/dBQJAYkTjrMxf9TcW9RAN/iaEqdq73Cn53DKzn1RcGvS70u4JlOIghPFlv0iysqZ+vOkn++/E7wuTxPygFWwQkn2n4AdyosWSdtAGcsYJm2yDsorn/PB/Raditph6ycFFeu/35acsgDVjOY8a/PWdd4Gp/jVwCBNpzQiZoxr/k50An0WpRZhmhmC6mSnpfCdTtjqbuiULX7hDcpYFFjhQCVB6u8X2/pwxIADaOSdsviAOAqBlVswO4ZQMNR5eeRji1SYp7+c3/Fkwaj5rAzTa3wX1LkAdslLDdiezJ0wirdU9rDP/VbHQsU6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDlJyHdUaYY9Tbo/BJ9iVPe1zGJw/wRAsq65lWe4kzY=;
 b=bcGLm6T50mhMSKsw8pPeJ66MvdJfCuk9oXa1M2GNkcOQ/u7PYJhN3Ykb1kU49ee25Xqkj/7RW0vkGbhS7NDcU+DNU6MROZreB3Bh+vMWZMnxsmVkJBvtaoLM6IWdDWsr6UYk+ld66xjrNOQVM31i8uOWxzZJhesVxx2sRD4OjSxjk1tG2VSsRjaIaPUyFyjdipAr+7B3YmGzyZw4l6qzBFzGtJa6joMbe5/Uqct90EyhTfE68pF1Vil6gu0IJcph/WsP89mdfMnfaXS/BQ0p+WAB9zwxUTQCQJjIN2aVkzfDf0AT1gFPwWodTCxAeaKJaNK798uxAKrPX9zHTpNmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDlJyHdUaYY9Tbo/BJ9iVPe1zGJw/wRAsq65lWe4kzY=;
 b=OTPlycfcXO/xRDOoq7dpfphddm9ok03RmOGQGLkC1eH4KexIT8Qpl547yqU7ntT/FHke3Jc6UAt6pe5nocIhRowv2cffhiw4+fDE2YTACPpqINnx2RWHcWiBJa+Kg6Eoyg5KKR9RuIayASyM6eZeuKbdon9/g3n55MrwAmgb21ud0d4HtyH7PrFzl8185hmr8W6Wv6glKBr2L+djBQ4UjR1uFhF/K+xKM7ZnxnVeoIoy1arETi3WGDNlXcp1FXN9pl/oJ+dLv/A+WcHCGbHNSa4HyIPul5fyF91S0S6ZBAnflJ4GnCncV1uu+Vz5bQOYQ0pSjLAyNPuY54gnm7u76A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:13:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:13:56 +0000
Message-ID: <d6d0307e-4e27-40b9-b5cc-8e488b5092ba@nvidia.com>
Date: Tue, 10 Mar 2026 15:13:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
 <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>
 <DGZEBEPLULOZ.2GT5QV8I8VBXJ@kernel.org>
 <DGZEHD0JWHZ6.3HW5U5JTEN9NT@kernel.org>
 <CANiq72=OJfRgJB1fA1T1OkteAzOYZP5OAkFqKV+WueE5C0N+Xw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72=OJfRgJB1fA1T1OkteAzOYZP5OAkFqKV+WueE5C0N+Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 19afc968-c427-4719-00ba-08de7ef25293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mKjmvtpPsU6jJ9+W7ctvftjlEqMDWqHKHSU51hikfXYfNZKKIJFCpracPTswJzhUCnkqylu+pJfspbMXyCOsbUvLEKGwdB7oL1XvCQia4Bfncm8tlyt2EdUnuTVmSS+EXdIwxqT3Tzytr8oAVwd0FmOfuCfo45GuZhyo+jiO3eP02eWPhSqhlhD2/8IUufIV7MADMB+R0Zsjp7eFDpfzS84ePFeXCSXeLF3+w+eiyFJZrmr+EfTRXyRD8l8mEKDU7yuN3+6Xnf2gzCoVaGh6LE4YDRUOkfFnhXGJMdzUjpnX9ZxpnnUKkA20iOQWgaCyvJlmSGCsU8CJYYSLQzUWqIJAHBLuwFOyUMTkpjZhu8QP7kdRUiPILGv8gbIZd0T/8KtQ5qcIthvC0jIgRQPfvH9miH+pUUxWXpqqKcrSKSEDS2Tg6sFnNk3fb2lLw99pyriaCGvzDk8JLuIfu4W6kEO+4kXR/EWm/YkKCTf0VBU/uTxn1ZBVMOf6fEEYF98x9UiLconWLnrB6QpuhZ7x3CjRge0nxYMPyawV/plrdxkbs1hjvogtC3kXLhFpLRJ3fnuFs9b1dMGUvK/fUKwDRA21v80X1c3OEO1gSngkuVhRm/u0v2V64Te22dpCeGNr0vRYxO0oTUMy/fC5bJ9gfU4q4Yrod3jVvJSRDEvILZRC3LjGvYKokbUwBCZn6Ifods+JGSEV3FSq4/oC6VvuPalW0ky6Gr9DOB6gKFxltgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGdSSHFpNVl2eXp4L0hEVVo3ZzV6eXVpaHNCOEUwOWV1QTl2OWN3MmZHaG54?=
 =?utf-8?B?bjhHRHVHbGlyNXczSlc3OWw1cGp1ZE9PeHo0NHNjZnRJMi9qNFZYMG0wTktR?=
 =?utf-8?B?T2R6TGhJM1NmT2dKSThQYjhva1h4MEdqNDlZRkd2NitXUkt0QlRhSFJvMGsw?=
 =?utf-8?B?azluUDB3WHVkZnQyaEFRUnQzK0J4VVlPYnBuTkpzNERJbld5VU5qRVk0MmR0?=
 =?utf-8?B?ak90cklnZGNYdG5nNkNSWlMwZGZxd1p1V001S0dPRTErT3JTam14emRpc1pj?=
 =?utf-8?B?eC9ONHhmc0I1eHRJZE5hVXNTQUdOV1pEb1JMZ0JDS2N5UDdRVk1VTGIvUDJS?=
 =?utf-8?B?bWhxZ1J2QnB3a1RUaFp4MUt4a2kzdERkcnZ1cVBmME04UEZIZ1BvcTlFRjlu?=
 =?utf-8?B?cW40YkxpT0FiWlJ5aGhXajlTOTNRY25ZVnNUT0xYYk5oakNDZUQ5TVA4OFVG?=
 =?utf-8?B?elNvaytiUUpiS1V1amVQTGVPeUtyUDU2K1UvMHZ4ZXdic29yWFE5dHRtS2Vl?=
 =?utf-8?B?RktNN21YNXd0UFJFMVh3bjUyOU9ZcnpvK0VnWWo1dzQ4U25WS2JxeWdUUzFi?=
 =?utf-8?B?UFpvR1ZpN2VRNm5nUTBsYWRnNUx2a0JOQkQwQlFZSXhyUnRUdHVBVFBRaHcy?=
 =?utf-8?B?azlwOGdLajRnM3gxTk02TWo2NHdFNUZRazg2WEZLSlplclJZcDRONGJTRGph?=
 =?utf-8?B?WS9TSjJJUEZFMEF3UytVSmZDZnpWK2s0NGVQOHYrWkJORjdCRFRSNFJyd3V2?=
 =?utf-8?B?aUZkMjNTWGFMNThqQ242S1JKVHY3bzRybHp3bHZLU1p6endSNnhIamZVeUFw?=
 =?utf-8?B?ZUx6Y0pQZjVjSFpONWRKcXUrY3didHZRYmhzQmUycTZiSWxEOUExSlhqMU51?=
 =?utf-8?B?ZnVTSUV0WkljV043eEN3TFE0WUVKNkE4bkM3N1ZheHJMN3Jvd29sS2s4cldI?=
 =?utf-8?B?M0ZHSlBQbER5ZXkyV1hORUxOU1BSdU1IR2FhcHhmL2FDTHBNYlVoT0Z6YS94?=
 =?utf-8?B?KzRzeU1pZUNGRWNXNGlkUERKblVkZExuREpuTnZCUkZVc3JxTEVONEZvaWFV?=
 =?utf-8?B?KzI2a0FkbVJMcFViVWwvMlkvSFpPVlVOWG9FdDJMRkhrTnRRcDRSSTRzb0xB?=
 =?utf-8?B?MUc0SzdYSEUxYjF1QURNZnhDNzVJQVhIVGcwUVg3eGxXMXJrY0tKOHp6RUJG?=
 =?utf-8?B?QmFRVks1S1E5eHlUSHVhd0ZtaXF6d2JmUCs4RHV6NmEwcFo4TXo1KzVlQmdt?=
 =?utf-8?B?VWpySGhqSFZxd1hlUVNobUd3bEhpV1NTMExMS3JNN2hyTVRKY3gxVytvYWxo?=
 =?utf-8?B?K1dhV3VNU0xIbzMrdGRWZDQrNTErR1ZjQnpDTVV4ODFnV0tnVENMWTdlRVBk?=
 =?utf-8?B?TlR6NExGd3AyUlNKUi9TY1J3cmtDMzU2bjc2RzdpSnlOYUNobExEUm1pU000?=
 =?utf-8?B?M1BTVTBkbU9wV0wwaHBzUlFMUUduck9xdG5sZVlKcmt5Q0I2RTUrK043YXlC?=
 =?utf-8?B?SkI0R1lCY3VtNlA1dHVMZWhleUVSNFB1WUFzNzNkSUlTQ1VlWEN4Wm1IdjY4?=
 =?utf-8?B?ZlpZSWQyOFovRDIzSVppTE82TXdXMHAvRW9ZaWVhdjZFVjU1WWRSRlpxaGZQ?=
 =?utf-8?B?TU9mTkpGZXBvUzE3d3V3cFVHOUZNejYxRXJWY2xFQWkrM2ZiUk5YOEFGOGo3?=
 =?utf-8?B?UHVPZmErSGFHM3FlNVJIbTE2dFFLSEdabGlPQ0RLYytPYXUvc211VDdKSm1s?=
 =?utf-8?B?NG1PMFp2cE9zUFZmSWc1YWZLZlg5OXNaR1ZUckczY1FYWXR6Wmw0eEVPd2NO?=
 =?utf-8?B?SE9ad0txQ3BtMG9kUGUyREp5Q0E5eGlKNHg4aWQxdWpmWXJkdDBKQytpUEk2?=
 =?utf-8?B?QS9VRzh6S1FMMHZKVmdkWjZHNjdSNXBIcUZoUFJJOU1BV2ozdTRsR0hiczF1?=
 =?utf-8?B?MHl5WkpLV01Gek1GUFVLeHBtVDltUExDRTgvMll6Q2tidlBodWpDcE1pd3Ax?=
 =?utf-8?B?WlYrcHowRU5PbUM0aDFOMkYrMW5iM0ttd3kvVWYwZElyY1hHTUVSQTdsbTBj?=
 =?utf-8?B?NEp0bjFEelFPR0hDMUxoVHBkV1ZycEhxV3BuOUErMDNWVjRvaHpPZGFEMmpP?=
 =?utf-8?B?TnlXZXQzNlIvQUl6cVlXdEs0SVE0QkpIVnJxeXh6WlVBMEQyYWlsaUZkWk9s?=
 =?utf-8?B?WlRHWC9Jd0RRS3RKMzM1Q2E3VzZFc3hoR0Z4T0xtdGw4cVUvM3RUQVNSOFVw?=
 =?utf-8?B?WUUrZXhhM092VSt4TjB2UXhHOVMyb0UwL0FNTXF2UjNoY2VWWkd5T0FaMmQr?=
 =?utf-8?B?V3dvOFFnUHVWd0RwY21nMm9hQ3dCdk9ROTBoOWt2SVl4WHlBUm5CUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19afc968-c427-4719-00ba-08de7ef25293
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:13:56.7428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/ug+oyj3hPqtoJCOR6+Skwp3c56otfvH8bjZ8eZXZAHAMOMlTTBO3gXyAqfSVrM2hvqROB/aTZ2jUvD+9J26Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543

On 3/10/26 3:08 PM, Miguel Ojeda wrote:
> On Tue, Mar 10, 2026 at 9:55 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> Forgot to mention, the background of this is that existing DRM components, such
>> as GPUVM, Buddy, etc. just use u64 as a common denominator. However, this
>> becomes annoying when the corresponding device is u32 (or even smaller outside
>> of DRM). Because then we have all the fallible conversions on the other end
>> where the driver interacts with the HW.
>>
>> So, on the Rust side I think we want to abstract this, such that drivers can
>> choose the actual device size type and the corresponding APIs just work with
>> this type and store the actual value in the backing u64 internally, but hand it
>> out as the actual type the driver passed in originally.
> 
> I see, thanks for that context -- yes, if the types are different and
> known, it would be better to abstract over the right one.
> 
> (And perhaps it may even make sense to use newtypes too, depending on
> the details.)

It might. Because GpuAddr is a bit vague, whereas FbAddr is always going
to be u64.

OK, I think a define_size!() macro that implements a DeviceSize trait works
here. We still end up converting call sites to use sizes::u64::SZ_1M, once
DeviceSize is in scope.

And then later, one can build on top of that with things such as
<T: DeviceSize>, and such.

I'll post a v2, assuming that this sounds about right.

thanks,
-- 
John Hubbard


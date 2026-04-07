Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020085.outbound.protection.outlook.com [52.101.196.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC733A702;
	Tue,  7 Apr 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573400; cv=fail; b=VbjJzYlnHDLZ0lV5ciC2dMXooJfYcs2CEQbHZzK460aK9GhCauEqdjntk0SlQRUcVqQgY60tKDtgMYUbeMMOamJY4LgxsDpWZ6wAD06Uc3JbY9cW3CLYGc0KLCoo+YHK9UvFSdXCaH8wsephVaN3HPCFkHjgCrAYzZTQNXBB0CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573400; c=relaxed/simple;
	bh=MYC42wOMeXGzfYTS/zgr5/AOKNjV6W6s0FKh+/8JXDo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=pxmqoo+oi4k9W98LrK1EhHyjGHXTfUbGofIoUKsNNXXfUBPGC91nBP3oepbt1tJO7gUuEgcJyQQOIMiyzT0mfpyOvXumTRM3El5W0B0CVNdq1q4kQPMTww6Qt8cqA7DmwsuzKUSGmwW2W0GuJcqSq9gj1FiEgg2JqxRM48MvSSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EPeBo9V5; arc=fail smtp.client-ip=52.101.196.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EPeBo9V5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i82cuhrGAWrKBlymN4UY5t3Qw2RMl6eRZmBMW64LcSvn6qCimyIy8o4fJ503oyhk0qdMNlH1Al/rbAtLcmQnsqk7QBoUFTRdRKMiAYXCOVlMufZxvvs2pvme88P8awoXSxhzSzEvJo+UoVbVgFMVFKOsXQvPVt2g8+/lZ+VWAljmd0gnIq0j+93jbll7kFckXrmfvTQNlq+0LOiHPRLd7qLlkJrdNvnZbeK+2nBM+py8DP8VPt9GKRP3e423h87BAW4ttG7j40IGnRl/epJ8xXL/dvSaEs64d7DwVCb7EJpx0a45aO9Mek48JQZKHSeh+XMCif6bDYCt9M28NQakqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8Ka4zv5EGRPAOU8UbTOxfDZxLu4DpQ1K6JTRFnsze4=;
 b=I2VjWn1O34NFZtzcDJ0k3ZywwKSlbA4hiyfch3q+blQezJFIu3A2+JuxueolneK3LnxXdd7YKCanVpgnssdHWUEP+yDhUsZODXBynKsj1XRkSCNNQS2vaJc4qpx7z+H82Xjm5q90JN48MRW5z6uRhmm9LRmvmTyH46VjHSrZf5BoNg8SGIoHn0T/r5HRq+WJKzCGqxL3uKwFdFYIbugjBRJwNY3ZCn7taVuBwOpfMRnje3E83pN6WUK9flzl+n0GceOAmH8GxO7nmQuqrJRpSiGXjiS8eelZgYevwcMebhP87sNKbrK/4liY2IhKb+bwMRnsEu+h9Z5NrEr5EdVVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8Ka4zv5EGRPAOU8UbTOxfDZxLu4DpQ1K6JTRFnsze4=;
 b=EPeBo9V5ijjcXIQGyCfxeE24yklacfObGPictpfy5uAkFHvzd8BD+vEZYAJ0UToVnpXpB5dV9wJ/4jA6te1clgmK/lQCSlRyEgsVPQqB/df82Me5E1SWJIbg2vyd1R7Ahx8yX3Ln7q6VOgA6pG/gaxIn4ABNQe206CTq4QhMqco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6827.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 14:49:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 14:49:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 15:49:45 +0100
Message-Id: <DHN08GKYMQB5.3O5LSRRBUZZOK@garyguo.net>
Subject: Re: [GIT PULL] Rust pin-init for v7.1
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Antonio Hickey" <contact@antoniohickey.com>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Oleksandr Babak" <alexanderbabak@proton.me>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260331131729.1104236-1-lossin@kernel.org>
In-Reply-To: <20260331131729.1104236-1-lossin@kernel.org>
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a065bc0-c5ba-4a1d-a571-08de94b4e91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CZU1gm/i3ry+DeAQiBdmvr+RmKYUYOxo1O1/nT4r/tq9X7bfk6HVmU4BXB+QBaxqrVI7FTYGKc0/7dz45JRQ0B9CJRDKKwSimlpMuqG8pkmfWUTDacJ5da3B07B7qd24519IzyV17Qv70JagOq2jL7Y4tFTwVK+n4i/LtBaFrYsiHQR7DNjrSylCrj8cgXgauNPoOKgjJdYiSX0w9cW7n6soboioVKf4hZfQxREpQmEMiMlnphgRbBXZUj25Ghoxe48heN52PHNNF+UhXxfmXt+ZvtDupPM09jfOZuUuRTCC/d6AM0VWM76rWAP5+YSh2JRr+zDKOQbvPxtxwTLoXUL0jbrHGFWuAMgQNx84CfBIScHUDFz4nr37/8te4mdcHrTfT7MflldaJYQ2uGreHIbJvTVveYwm0d+Vd1vvzQ9dEoque2AXR/6Su4TN4OYlNxpRr1vCY+WG1FlOpECDkH+uhhQbrCVbBndPka8VrJ8a33hHXwwucyXtDCkMVxXClJcuEcOHDRmYrxRe9YZiK8VnhOBhEU61f2bfJGCAr3YpbEK+c+/5Aiwx2NdG5eqdf5cWMLyGALEWN0HU3UpGaOw9xO8p64EmvQojZm2v27DtNagkCxmUk7DiiULDSHanWGuUSi+wpEms11T5chGb5Awh/SFh+WAATgBrh4cGlDhbYNuZBYRtNPZ/JHDcbsHkyEcFM4p6htX0XXl4G3uW4rcjJHSA2FuA6ouwfSVYdOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFRXeWR2RWNCWnAreU5ON3Z5M09aU0tHVTVlb3lhUmJPejNDOVhYalE3RDZs?=
 =?utf-8?B?cDdsaUdMVmZPemtpZlNiQURHM0g1K0hZVUF1Z0JveXM0RGNBRGR3aWxaT1BX?=
 =?utf-8?B?emFZd1B0cVhRcDJhQ3h6SCtMU2tTZ241QnRyc2FNSkNRMy81WTZtd2xwKytM?=
 =?utf-8?B?OEt5WS9QODN4UlV3VmNiRnlvc1dmRzVXN1FyaUxDWFM4L2lDS3B6b3ZNcVdo?=
 =?utf-8?B?bUhxVlFaRmVFT091bFF6N0JUNXpEWWMxMmQwZ0xMSXlKcGNrWktFclEwRFRE?=
 =?utf-8?B?N2tUOHBCUFVKSjNCYWxSeWllZGJkQXpWbkkxVEthQlllckdmYTRrVXA4NXZo?=
 =?utf-8?B?bXdvb1FiOThjQjNPWmdvOUN2Qm14SkR0UC9QRk5Ka0Q3NXplcit5T0Q4NC9y?=
 =?utf-8?B?c1dKd1c2S0ZJNlBQYmVZSWYvNUNtdWljMXAyTVJnTTNiejNRZ2d4OFhndTN6?=
 =?utf-8?B?REZuaE5HakNnSStBQys3Z3lVUGF4OXM0a04xbU5GcmJwMHc5blBiQ3MrUVMy?=
 =?utf-8?B?MEkzTDJTSnczc2NlT2VmanllNmJoSVFaTS9aL1M1OXIreG9aSkZxOW5UWWdT?=
 =?utf-8?B?eDRjS0ZINkh2bVFaNkhSbG5JQlNHU1JXb1gvdGladFFVYk1rSjRJeVJSRjl4?=
 =?utf-8?B?VlJIQ0VWcGlPNGdXQ0VmcUc2U0UwNlh2ZTZqUkwrMXc5R0p4SUNUM3pQNWVn?=
 =?utf-8?B?YzA0OTFkY0pDakNHTEFtWEVqeWxaMTNFNTBjYVVsNnYzSGFVWDFzVUIycTZs?=
 =?utf-8?B?UCtYb3JWbG56VjZQN3V5ZW5uYWd1ajl0T0htem1VNmJReEl3SDRnbHZaNjhv?=
 =?utf-8?B?QzNwUGxNdWl2SE1UUzBWVzhYOGNqSnJObXFNakdtSWwxNVgrdWRRcmlKMTA1?=
 =?utf-8?B?dklTeHVOdERvQUoxeUNleFJrS0RyQWtkMnNaQU9UaS9vaFZ0STQ5QVpEQWNx?=
 =?utf-8?B?YVlKYVVPalpxSWFQSkNTRHMvOHZoTTdVUmFIMDVXeDBHMEhYbUg1YTBzay9D?=
 =?utf-8?B?Y1ZtQyt4eWNuZnUzQzNLOGgzWnhqdUtUd050Q21NYy9zb1NzdjhIT3IwSE84?=
 =?utf-8?B?NVM3MGZZU0xITURXZzRodUdaRVJ1MW9QUGxjdW9ncnB0bTZnMFc5K0tZOUY2?=
 =?utf-8?B?WFJ1NXJnUW1ZOFZsZ3lCSVVnNmlWQU4wdHgyejhHZkh6aC9BTXJ3NHFhTDZL?=
 =?utf-8?B?cW5ObTRLbGNRNnBUWXBEMEZ5aTJ3TjhKWVkwcGp3WGl3cWJpUVExbEpGcnky?=
 =?utf-8?B?cFlOaWR1OTVPT2x0amxkTzYvVkVOV0VjUU9zb3FPeWN6SCs4Smp1a2VmSElF?=
 =?utf-8?B?NG1UWXNTZjJuT3pTUEJ1QVhxL1JYQWdNS0FvWC81L0IxeWVrMlNuS1lSeExF?=
 =?utf-8?B?SVJ5UDhJdTh4VDZiRE9YZFhvMUtHVXptU21UNWRzK1VVcWRFRzFBZENjR0ht?=
 =?utf-8?B?dkluN3paSlJXMDlMeEtjL204eDY1Zkg4WnlVY2ozVi9ybWZHdEU4ZmQ0dkI0?=
 =?utf-8?B?Nlc3NmJxNXpxYTViVmQ4b0RGRGNkTmpzTlo5WkQ3WEhrYzNnNm1vUGY1QUtL?=
 =?utf-8?B?V2FzdWozMnpEVnlFNUswakFKTEx0c0g2bTJhaTZiRUpJc1QrSVJ5c2JRdHN1?=
 =?utf-8?B?QU1wT2hDUWFJL1BoRkxjMjV5ZzJ4ZWVtSjZ4aTZxY1RUcTdrOEl3eXhnV00r?=
 =?utf-8?B?Wm9UbWxBa2dWNmJmQklpZm9ZWVRNWFdNOCt6SFJxU1ZpMkhVM2VxVVZ4dlRO?=
 =?utf-8?B?Q1I2ckNWMzZBTjdCY3RhMUptY2tRTXBoNkl5cXJhS2Yxd2toNFpXVEVXWFY0?=
 =?utf-8?B?eTR4dWVrVHlvanJDSXhyNXpOdDhYaTNETjJBdldNZ1doWEVzdnV3TU1Od0gz?=
 =?utf-8?B?VGFwN3FkWFFoaS9qQmNSbXZScWdLZTZyVm5rZ0taU3JIVFNHSWpQRmljNnZS?=
 =?utf-8?B?NGtqbDFxaldyQVV0MlpNcTBaZmh5V05wRzRSY1hnNW9HYXBFb2NicnlpcTRi?=
 =?utf-8?B?b296QWNiOU9hak0vUndheUlHbWNEZXdEM2JoOG9tR1poOXlhUSt2U3U4ajIw?=
 =?utf-8?B?QnJLL3ZybFcwNisrUGRJTkFURUxqSFRlU0VGUnI0UmVlVDFFM3JINXFtODh4?=
 =?utf-8?B?VG02ZUFrMm1iakgrMzYzcFE1OWdzQWpLYkllbEExSU1VSjExRUpjWE9EclZI?=
 =?utf-8?B?Mkg5c1pVemVnamovY1NaSzdYcFBFVlJVZC9mMTJOVGhxMmFtTGxNMHVxQ1Fa?=
 =?utf-8?B?WTFCVkYzbUx1TnRWYmlYdXJnMGNSeXFEZ01zaTFZWi9obU1VQTlsclViOVFN?=
 =?utf-8?B?UEgvY3NtcHErcVUwSGVYdkQya016UTM0bDBYc1JxdGViaS9EY0JIQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a065bc0-c5ba-4a1d-a571-08de94b4e91e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 14:49:46.0558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiQzECjpKTzDYx0Q5GqQV93cmvrHPPHrtqylI/BC4umE7z8f+Aj+5Hd1ToMGS+fYKiJX20DBQsC7qD5zjHMbbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6827

On Tue Mar 31, 2026 at 2:17 PM BST, Benno Lossin wrote:
> Hi Miguel,
>
> This is a small one, various cleanups and small improvements with no
> major changes to users of pin-init.
>
> I summarized the changes in the my sync series [1]:
>
>> This cycle we have no big changes in pin-init. This series is a
>> collection of smaller improvements already merged upstream:
>>
>> - https://github.com/Rust-for-Linux/pin-init/pull/105
>> - https://github.com/Rust-for-Linux/pin-init/pull/110
>> - https://github.com/Rust-for-Linux/pin-init/pull/101
>> - https://github.com/Rust-for-Linux/pin-init/pull/102
>> - https://github.com/Rust-for-Linux/pin-init/pull/108
>>
>> Next cycle might contain bigger changes, mainly support for tuple
>> structs. And I'm also thinking of already starting with integrating
>> zerocopy.
>>
>> While testing for the kernel, I noticed the following issue (already
>> fixed in the patch in this series):
>>
>> - https://github.com/Rust-for-Linux/pin-init/pull/123
>>
>> This cycle we also had some unsoundness fixes that are already in rc4:
>>
>> - https://github.com/Rust-for-Linux/pin-init/pull/111
>> - https://github.com/Rust-for-Linux/pin-init/pull/117
>>
>> Lastly, there were some upstream-only changes:
>>
>> - https://github.com/Rust-for-Linux/pin-init/pull/114
>> - https://github.com/Rust-for-Linux/pin-init/pull/109
>
> All commits have been in linux-next since Thursday last week.
>
> No conflicts expected.
>
> Please pull for v7.1 -- thanks!

Hi Miguel,

A gentle nudge about this PR.

Best,
Gary

>
> Cheers,
> Benno
>
> [1]: https://lore.kernel.org/all/20260319093542.3756606-1-lossin@kernel.o=
rg
>
> The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e=
3c:
>
>   Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Rust-for-Linux/linux.git tags/pin-init-v7.1
>
> for you to fetch changes up to 09808839c7aa6695ceff5cd822c18b0d9550184d:
>
>   rust: pin-init: replace `addr_of_mut!` with `&raw mut` (2026-03-25 10:5=
7:53 +0100)
>
> ----------------------------------------------------------------
> pin-init changes for v7.1
>
> Changed:
>
> - Replace the 'Zeroable' impls for 'Option<NonZero*>' with impls of
>   'ZeroableOption' for 'NonZero*'.
>
> - Improve feature gate handling for unstable features.
>
> - Declutter the documentation of implementations of 'Zeroable' for
>   tuples.
>
> - Replace uses of 'addr_of[_mut]!' with '&raw [mut]'.
>
> ----------------------------------------------------------------
> Antonio Hickey (1):
>       rust: pin-init: replace `addr_of_mut!` with `&raw mut`
>
> Benno Lossin (1):
>       rust: pin-init: properly document let binding workaround
>
> Gary Guo (2):
>       rust: pin-init: build: simplify use of nightly features
>       rust: pin-init: doc: de-clutter documentation with fake-variadics
>
> Hamdan-Khan (1):
>       rust: pin-init: implement ZeroableOption for NonZero* integer types
>
>  rust/Makefile                                 |  4 +-
>  rust/pin-init/README.md                       |  3 +-
>  rust/pin-init/examples/big_struct_in_place.rs |  3 ++
>  rust/pin-init/examples/linked_list.rs         |  3 +-
>  rust/pin-init/examples/mutex.rs               |  3 +-
>  rust/pin-init/examples/pthread_mutex.rs       |  3 +-
>  rust/pin-init/examples/static_init.rs         |  3 +-
>  rust/pin-init/internal/src/init.rs            | 14 +++--
>  rust/pin-init/internal/src/lib.rs             |  2 +-
>  rust/pin-init/src/lib.rs                      | 73 ++++++++++++++++++---=
------
>  10 files changed, 75 insertions(+), 36 deletions(-)


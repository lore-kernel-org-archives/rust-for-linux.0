Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020113.outbound.protection.outlook.com [52.101.195.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0828000F;
	Fri, 20 Mar 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013785; cv=fail; b=PRRBLiiD4mltU5tEkMHCG2DPZ3UbgH0q3uBV66XpmjGS56cDyq4rmZVhYFJWjQ9kjjpmTQO+2FHqUPYE5EWl+XsONZkjHrdSQ8Q8U5fQOFPxdIBARLyjZqjfm36/1lq7NvNQloQagIDyRHL6lk9ir0YMGEwS0S51boWMqjdTZ/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013785; c=relaxed/simple;
	bh=ee8KOWnjII1nGHOsYqK4OvSrMfz6GN3eMPU8RfOOJNM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pkTki/MF5mGIjzqHNCgWR2RyCYzj5/C6RU7hqGgcajRfuDYx0xo3SK6MnJW7W3Zn15Xs+gmC5zvYagZhTL2GRuLCtV7EevPLGVWF/WC8yHRyfATEXQlU/HP28Z17UtuX4m01JasDnVBQU7uZfS6ZTygGrke73vFP4gC/NhqwCoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QMLCCIGZ; arc=fail smtp.client-ip=52.101.195.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QMLCCIGZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnTofECszszdjGh40RRHk1B2NXJ12oZQkhI5kVmaFHft7jbuUx9TOgTc9BelafQDCEhEh8nZ+otBhyTi1JCS6dj961xkFhS6Zkzcmr1xpiT6uGe9wD9A7+HLq8W9ZkRAPjBilRr6selPt6pL59Yhz1tYpOhqWZotmp3BaB4nh/sqakg2OD8wtFVm7EPlE54UJTzf7wN/Hr7ytFL4metR/VhyYGXz/emjHveuF+ffkbKMks41z01lS497ViEYNk0NDSd7TZyfajVj15gLKnRyJGzSbdD6hb6hImzM1HaH3AGJ9uPvHhCeeqVHLLgl7QxZjwDb344+JvP/qnAFbp8Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee8KOWnjII1nGHOsYqK4OvSrMfz6GN3eMPU8RfOOJNM=;
 b=J8+aRVsB19ZyGjsMNuNskrfJ6WRwQEzcMgubeN5L5JpbyniuC2eK+ixoY/lNGWyeIWRR5/hpVIIIVKPkAsQK1N1hawIknySwRFJprlEEqFEjhM3JIwpEaa12jD/fJwdUaXgAiy8/hqSfT8fLhvrt2fuWxppZZhO8+MEHz5xZrkxy21qJqwixr6IhYXuB6S76EFiML5hhthfPXlJgGTZBLZhbi5h2whW1yJIZpou6MLVlSbP8k7muyOSWlf1tMXvkJyX6KlyCCxDjGl3SQVOvZM2GLpRPiOodh4vq2GlbBWYAkA0hH5MyP/sPcsMrcRThzbX0odT948AS1gZMOUyslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee8KOWnjII1nGHOsYqK4OvSrMfz6GN3eMPU8RfOOJNM=;
 b=QMLCCIGZf5QcKBea4vVWEKFPb7p1HCEPG+6ggqKjHz0FCFuRTKTry2npSOQOQSvd8m31R0NSLrGlBXJ8Fcv4VsBBsY3vUXC0PKnD9VekoyeIOTmRFSjJFqmxd2vCa+vrKeZBIZU2tlqwdhMbxv7ps95iYUP90VHK3hTk/OMRNr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5907.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 13:36:19 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 13:36:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 13:36:18 +0000
Message-Id: <DH7NEF84QGIV.2S3XF9Z9OIXYV@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-17-jhubbard@nvidia.com>
 <CAH5fLgjbZZaxRaAvodUM4xkKY4YOz=n-hcWG-JraLi_Acu7u8g@mail.gmail.com>
In-Reply-To: <CAH5fLgjbZZaxRaAvodUM4xkKY4YOz=n-hcWG-JraLi_Acu7u8g@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::28) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b9ae5d-71d4-4e8e-45f6-08de8685ab47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QjGHGrxi7jdQXvDCbD0D5z10aXx+nJctRrbVDAVB4yvUG3xqYAA6UeKx3IY0jS+vd+dY+oP6oO6U/uQ4vducwfmiNLZw9aLNsNYb8LstjGabHGlVWiSoenfATBZ8NyCeR5cTq37oTWshHwWG+kfb0XNrrl7UUsArsBDpEeQmBnz1P7aLsyrWmvC2WaAC2sZKXqOKx2r4AF+mLIarmlMF3x1adcmQEufVh+QQ4rSuOMweSYFEZ9kzyx+IQ6KGJiprfOvc56wS2wvh2LmmXR06ukBn4TRU/k8npZ5h+lUzObPKWXToxxUaCioYI7m1VqgoJDDmUh5UHzMSxGy8Ai4YeFSv4y2Y7QpXhm5H6z1x+z+TlEHSRyGafRHFQVHj68LfaSC/kl/WydSxib4yiyt6vKn2295Z9wO/e5/EEXb6DFkOcTT5Ue3/fli9oX5vMWSH6t5905gtLJ3WLmAWGPzGbk0ZG9XOSrowYOsYCsaXnTx/GPzC2k4+psqms6nUWCJOiym/gXHTWIrvbdfAPhkkzAHFTDbwCgBk9MjLPcShhbc2QL4eu3VDfuc0gNHWBjDMV8oGfWPPqL0AC+8z97DJIbpES9a4GAx2VYJ0TR38lbSkPXNTsq1BIvyhjvQuHqrY6hB5nuzb4mc9A0tnmP0Q0OV9v7nv5VfPnaJD4UsLioF9aAX9CaOpViOM5Qwm69Exdy+tjOwCHEpArenL94+1UT/u2K5KMGXOhRxvZX5usxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekRJYVRuWXhlRElpQzNHWko1ejZWNTZqcFRaeVRycFVOWTBZU0JTcWJZWGVh?=
 =?utf-8?B?bVRXN0dVbE4yU2NGKzJYelBXZWdUdjdhUUx1d1lqWFVGUTZ2Ty9Kayt6OHky?=
 =?utf-8?B?dnFrTVUxeU8xM2xOTjBCaXdxV2tHV1d5UmIwYnNtMjVkRnQzaTNXdU9pTU9h?=
 =?utf-8?B?dVhGR3FTbmdEUDhrTTNkZlQ5emJSbEN1UUgyOGNRT2RsQTJUUHdQZFEvWGFE?=
 =?utf-8?B?cE4zdktZcXFmYzFOMVZFUVpnY0lSdWN4NWdCK3I4dkoxZnpZbzlOV3FSa2lk?=
 =?utf-8?B?bXd6VUoxSHdrQVM5d1poMmJEeHJ2dmlEeHA2NHdjZVBNMnBzZVJCazdIQlNU?=
 =?utf-8?B?TlBNVytSV0FjUU1LekFKZmV6cEhabDZ2SG5ZTGtCVVduQ2JBSC9RWEgwOVVQ?=
 =?utf-8?B?d0xBTi9NQTN4R1dkZVd5TUQyYlIwQnFsN0RVMFRBU3JJRjltN2ZPZFpIM3kr?=
 =?utf-8?B?Um1mS3JqcVp5SFpnL0hKVEhvZVlaaEZDWGc0VmRoRmdwajVyVzFiY3NUQ1Jj?=
 =?utf-8?B?NjhaUDg2OEMyU1MvMGducm0yazVjamZYV2FKNzNLOTVQN2ZGSys1WFlhVGFN?=
 =?utf-8?B?alEzaXA2N0VOd0hpcGtqcVdPY242R3lNYUNDNExVeUp5QUtoMHBzb21OSitw?=
 =?utf-8?B?ZVBUczdPcXoyZnZaTm80MmhlZ3JkcjcvS2VFK3M4aG10amNaaVVnNk5VQXhw?=
 =?utf-8?B?a1Z6MUFuKzNmaVM4Y0Zja1JmTEZBR0kzbGEyU0VrVnhqU1hCeWNnclE2by9w?=
 =?utf-8?B?Qlk4aGRHbDBWWEVvcnRoN1QvNHBCQng0K0J0Um9pdGhTK3lKd280VmFSdjJX?=
 =?utf-8?B?dldRb1lTclZxRmNoeGh5QVlCczc0aWhwS2VBaUNhMTE5UnFmZXlpUEpUNVQz?=
 =?utf-8?B?eFJsdkt3VnhXUFRxRm02NzJ3bU84TGhMNFlBY3ozTVBMU0Z1cGszS0loL09K?=
 =?utf-8?B?aGhXa3ZDdXk0dHhTLzYwVVN3UnBzQXRtbW5acmVUTkQ0SEp6a09aK1c1dzgy?=
 =?utf-8?B?aysyUjJRL3psZzB4TWFnU2RHbTVkbGU5TVJCcS9PZ2IvbmNkRG5VMkJkL0ZT?=
 =?utf-8?B?Z1pCOHgyRW53alFPUm9TaDVROVJ4UmdUR0VxQW41RVRkMzdvRjFnNGUzakcv?=
 =?utf-8?B?Z1AwOVJLNVRXM1lyd3JqeS9DWTBDaENXUUFCYTBuRVBXVmJBQW9TU0haUlBO?=
 =?utf-8?B?bGdaZGVNZHpBeHZua2NjaS8xYW5mYk5sUzY4SDFnYkFkc3RFNnVZUDR4NCsy?=
 =?utf-8?B?QXhpd2tUTzgyN3F0SFU0Y3NTY20vVGtsbzNQdmtnSVRZOVc0Uk5NeGI2WGpP?=
 =?utf-8?B?blQzdFMyY2JpSlppeitEQjB0L1YvbWVnOU8zK096S0RrNWMwdTBOdkhRSURz?=
 =?utf-8?B?Nm51cWlTdHlPU3lRMDhjWFByYjZ5K1o2SE1PRjR2aTlmUDlHbURRTGxzMEY5?=
 =?utf-8?B?RHkzV0VvZ0dGdUJoWmxXdFFPQmk5NVFtRFdxVkM3WFk4QjQ3MUIxb2IvTzBN?=
 =?utf-8?B?L3NoQ3ZXanQvVTdWaS9GZTFkb2V0T3dWaHNXOGhzMmdlc2d4NnBjeWNtZ2ti?=
 =?utf-8?B?SGVoSnM4YVlGMHYwSEpBVXRicy9mZ3kxcXJYV0E1VTZBdXYxT2Z5MEc0RGJi?=
 =?utf-8?B?bHpoUFozUHpxMTRFSkU4cDRadSswZnlwc05mZGx5QjB4dlc0NlZ2ZVh3T1BW?=
 =?utf-8?B?YUx0U2toQU1wWTd1eDlhVmJQcnh1UjJjU242SithOWpKVFZEeXpQY2hJcmdR?=
 =?utf-8?B?TnhDUTUrWWFJVG1Kb3VUZTJTSWZGay9SS2hQL0pUaTNET3pTdE13YUgzbzhn?=
 =?utf-8?B?NUZpT2ovRDlRWm51SDV2SmpBQmV2bmVlUGVVTGFKVlN1RTc4ems0Z1FIUVhl?=
 =?utf-8?B?aG1aWDhnY3ZPQVZPNXZuZWRLaGV5dk5FdWlkMjdiSDJRSFJpNTQvdXRnVU1E?=
 =?utf-8?B?Rk5mUEU4cUlPdHU5UEZmNXhUUTFHWW1XUU0vMG85Ni92dzJhdzRuVC9UOWtp?=
 =?utf-8?B?QXlJYU9XVVg3aHgrQm05TjVubTV5M1dDNHcyMFZMc3ZkQnFta2g3M3haVkZ1?=
 =?utf-8?B?TVRpaE1xR1JSay81WmlyblRub2lGSDBDVVFhLzBjRTl0bGNJOHZVSHpSa2kw?=
 =?utf-8?B?MVc0eEZGbTNGSm05REt6RS9UWlE1dXFjSXh6QTkybFpkcFYxdHdOWDhEY3hH?=
 =?utf-8?B?MHFycXl3ODlHcmR4clZpVW05MHZ6VHFhZXV6M2NFYXJ0bkk2OFI3aVpJUjln?=
 =?utf-8?B?TlVOdGgxUTh6WjRtK2RHdjltYk5WczFpYVBFMnkzR1hHdGpJcVpPVFZWbGxT?=
 =?utf-8?B?THhaS3haUG9hUytvdG9iWmVVRFRoT3JKais2eXNYWW9ETnJNWExsdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b9ae5d-71d4-4e8e-45f6-08de8685ab47
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:36:19.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AQ/rFN7CwBsss867zpIrtc8XX7qm4B22d6GEi8KOkDsdCOmouyvJyJy1QUn9wh0oqfk/zak5R3ZiMWJg+VWbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5907

On Fri Mar 20, 2026 at 9:48 AM GMT, Alice Ryhl wrote:
> On Tue, Mar 17, 2026 at 11:54=E2=80=AFPM John Hubbard <jhubbard@nvidia.co=
m> wrote:
>>
>> Add const_align_up() to kernel::ptr as the const-compatible equivalent
>> of Alignable::align_up().
>>
>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> Suggested-by: Gary Guo <gary@garyguo.net>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> I think it would be nice to implement the trait versions of this in
> terms of this method, so we only have one implementation.
>
> Alice

The `align_up` is implemented for multiple integer types with macros, so I =
think
what we have right now is fine.

Best,
Gary

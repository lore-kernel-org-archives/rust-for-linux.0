Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1CC2836F;
	Sat, 21 Feb 2026 01:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771635842; cv=fail; b=IisnWGIbADwGrrN8eEprwernGo0qcceQ1U09qzsI47CW/b/OEuzctui7nXPY4sHS2+NXmJojvSLnpWZproWaAolyQarsCkx5/z+CrlKZjRlgM9DS66c/WR8+/GBvp1zzYXugxKgnK3TeF4TxnWTYIeTxo7iI9SVcBaixI6fWWpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771635842; c=relaxed/simple;
	bh=o7UXU0vXMkwYqOEOhdEgO7b8ERTs7NSZODajpFEZc9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qPHBwX/VxJ7FBguRk6zlwkYd8SA2o0owusGGEdKy994QbmUiag6Vtfx6h+4p7XOJuemzNAj64z7flldFQdMKVZtZfuv3tsW0fd9aZiMMIrBgiP6bMcX1Z/jGaa64CVHLl0NWMnMXr5TqqCeKNxXk2qs0QbCX1UOmALsdnueeRpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J8BBJGA9; arc=fail smtp.client-ip=40.93.194.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J8BBJGA9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydIlxaIBt9iD2bNwHL4o3Hvat8MoY/m6UazCwwmKGkInG0oI2dgN4ZsNT5ifVcSbuqMdY01gjnhFo7VKN0JfhUCI6OUdjw4LWMsT/dh3EaOYKZaUUECaevb4BGVvD3X5S2oJ19yRA34uSVOQhrFA7wW7aRPolK2N0hp+RHFh6QeaVODFpETJ4ra0c5T5WVYYNz/AjHm+4EWk4kaRTgicIpSeozIZXk1usI7HzOM4MGsH+kT/gNBi3iuOcuQdwytMo8CC5mGsrLDLG5D4A0bfSc4B9WUm4W5JS2VZBOIF8zQYAyPLybir0zc+nXNFhAX0KaVtv2jAjR0j7P4YjiBKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg2bQrrC4LMgN6YTB+l5PwelDxJjqMS0KzQMQBls/zQ=;
 b=wJGPpNIHqx7rjrZ4QQKjR4+uNJ+L4N8gzbjnAg7MjY6IjaF5y8YYR2b+Lotu9ZDd4Z3XcyyL+vvFgU8VspovNiLKV7idXryx/mJ4CkDZ7zCohfrMbvze8LRSN4Ji0ZCWUXuZiFdig2l3GdGjGgVgAIDQUBpC8/ieWzswthCRHlZlI4XPHtxYcSKuOdXNpjx0hKlM6TEgNywmmek4yAQ3SabP3NTEDhHE20Vh6VtZlqWzt1XM2JouxPnNGgzC93ZKFOiZPWUv8OhBPYB7m/cErG5jFopkrE+4cbd3W3q3uWqdYYsG1AZJ/2BHPn92CgYUzeyR0FuHwHA+fIZ9qvresA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg2bQrrC4LMgN6YTB+l5PwelDxJjqMS0KzQMQBls/zQ=;
 b=J8BBJGA9U+7NjdJhfCqFVlPdRIt2WJomrIvO7YtV9jeV/rXpt2Er/hTBtVUPyxc2oVit5hm6ugwVwWU/Ygz0enf5bdI/U2r6YIcG9Rru0hYfnw4Mm+52ssiZ0TYhSShcwHQusoiS/W2JwJm+J3JF4OXQHS3U6l8JhDbGTRD2zGi3Ej679KyTb5igt7KZ5aI9eKvh7ASd4RM9szPeAZFeDzEoI42/jcTGERVOZgl/Oc53TKG+ombdaQ6r+VJ6gYErEDmDaKzepeKbjnRxZAHBAzI2I2naIeX2qWjuwvHIH30SgkBs0FJRMoiLv1p8N3/ut4edqH6WxTKT3QvHSN9MMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 01:03:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 01:03:57 +0000
Message-ID: <95ae601b-3133-4b47-ad60-567fc3641ba8@nvidia.com>
Date: Fri, 20 Feb 2026 17:03:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/33] gpu: nova-core: refactor SEC2 booter loading
 into run_booter() helper
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
 <20260210024601.593248-29-jhubbard@nvidia.com>
 <DGHIEPBEHSC1.1G155LGII83R1@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHIEPBEHSC1.1G155LGII83R1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 2184b7fb-a257-4ea6-3483-08de70e516ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlZrTXN1dXdhVk1RUzhSdGFQUysvSkEvS3NHSjhPZ25ZNit0eVU2ZmpLWC9H?=
 =?utf-8?B?ejVFZW1MYk4vbjlXYkhuSjJ2Q3RGSXRsUUNpOGkvUkZwRmJaZE1IRjZsQW85?=
 =?utf-8?B?MHNWVjhZVFhXaWxnTVo1YU5CeXBiM2NUMWYzNEg1MEJlZzFQdUUra3V6cFQx?=
 =?utf-8?B?Tk9xeU5oVDlGUU9lbitNWVJvN1BoYUw3b3JIL3BGL3d1YkZWQ0o0K1JEYzZX?=
 =?utf-8?B?aDJOWlo0djh1R2Z4OGNCcS9QNjRsN21TUExQZlA5TnNaSllTWDRIRDQ1L2NE?=
 =?utf-8?B?clQ3Z0cxaEZhOXpxeFdyZHFHNDAwMENVN2NNaUFYZFkveERIVU1xdkNUbzgy?=
 =?utf-8?B?ZEozVUQ5ajZpeWcyR1ZBbWhhRXloVGFIdWNwazlGOHRzTGExcVdraG5oRWNv?=
 =?utf-8?B?bmJIQ2RRVjRuZFVEdUpTOVBONXBFQzRISXQyZkM4TFU1L3ZiTDVNV2Z3dmU2?=
 =?utf-8?B?RUpXeG01bGwrUVlDd2tUTXJMbW15Q3orM01EVVp2L2N1dlcwdGt1c1Z1cUpE?=
 =?utf-8?B?ajhNdkFHZW9tT09HMUZ5ekJTRndmVmZaMnFQVmV5RlppaEVOMWdLMVAwNlNT?=
 =?utf-8?B?a085MHcyRm02Y0pDVGtiUk1oTFlFQXpmSjdLZ0tQS1pub0pPYkJJaUFDQ25G?=
 =?utf-8?B?TklGZUFmSzRCaW42eEw3bzdEWFdNU0hZRDk4UWJCcGQ5enNPYkV2ZC9FN0p5?=
 =?utf-8?B?ZUdWUFBjTDE4dy93V0luRmh1Mk9MOHZvZ0taVlFRV2d0OTRsUUpzcHNJWEFZ?=
 =?utf-8?B?b2V2YmVwWFY1cC95d2o1U2ZNQlZqSU8rKzgwSzlzZ3hUYklNeEZjTUVqVnJY?=
 =?utf-8?B?Z3FyY1JvV0NKWUFqSmZxQjl6ODRNbkhxYnErLzlCbnZzY2RscXZhOThxRW9I?=
 =?utf-8?B?eFJTemZZUVVWZndxdWpnOFg0MlhNNjRLbXZnSElWbTdhakxUY2NESWhoNDRQ?=
 =?utf-8?B?RXhPRE5DOGJnNGVyZWJIWFlkRSt5V2FEMnVpK2lzbWJ2WHlNSStENEk2WVhH?=
 =?utf-8?B?d3pRQk1CMDZhRFFmREY5OTJ0UXJFSjM2ZVlKMmdBSTN6d0t0elZpYkM5M3NX?=
 =?utf-8?B?RU8wSEZjZHA0SGlFZkFMR1ZrSXlJblJaMFMyZW5pS0lXKzdVUWs5WHJNOG9R?=
 =?utf-8?B?UXJSN3dsSlo0NkF1K3Y0RUFnNE1XYS9GRnUwaVpzZVl5bVNGS3JLbXVUUG5p?=
 =?utf-8?B?bW0zekpsU3RLd1Iyc0dPbjlTd3ZpVkxwN05NRkEwaHAvdDhWQzVsam12UWw1?=
 =?utf-8?B?L3JGb1Yxdko1QnBWTlFOcXdyeS9QTFNVSXM0dzc2TFgrdnZBOVdUMGRGYUV3?=
 =?utf-8?B?TzJYQklZSFM4KzdDMFROalB6dnVtRDkvWURNZ2NwUUdTZXQ0aXNYMFpHQzBF?=
 =?utf-8?B?Um5pVmt6MVZseHJYWVBDOGhKUkhMeml3clFQVXJteWNWSmg1Nkp6eDAxOVZ2?=
 =?utf-8?B?TlNRRjhhNXQxK1B3RFdTK1VJT3lpU1l2Wkd2bDNqYVc0WnZCdTVXYkU1c0hB?=
 =?utf-8?B?Y3M0bkE3M0hjOEtqa0wzVW9xZlYwa1c0TmRjSURuNitEZHNkcXRhRlNiRUZ2?=
 =?utf-8?B?WEhvOFd5NzE2WktOc3JGcmY1bmxwc0tlUXBiMVB5S09GSWRZM0J6NE5yd3ox?=
 =?utf-8?B?dVptZXBBNmE4MEhRR0QwdFVPYkVFeGREcFVVaU5YVlBYRjNQV1k0RmtLaEo2?=
 =?utf-8?B?VVVPakkyM2loV2pQQzc3SFg5dEYwcng3NGdBNUJISDIyUFVtRlc5NGExTGJj?=
 =?utf-8?B?d1pGbkRuaVhFeWpCUEJuREJHTjQxN2RhYllWNFhSNUgwOXVQa01BR0l5dmh0?=
 =?utf-8?B?eXU4b21mSVNXOGpuTVhnYjJnMll1dDBsYzlYQUgxbDdkb1oxRlpadXdaN3g2?=
 =?utf-8?B?eUxlMFR4MHIwQUV6RzFLdDRhd290eCtsR3hXb3A1T1BsOWpLd3hGTW5sMEUz?=
 =?utf-8?B?T0lkZmttYWNxU1AzTnUzandvVFNjQm5SVDA1V0FVM2syZHc2bVlGdjdJTGdT?=
 =?utf-8?B?UXp3MFpJRUp0enpaMEdBYStUSUJua0FyVHlRTm9EYXJUMHBJalY0VEJ1WlJY?=
 =?utf-8?B?bXdteDBacUNxTGZoWWFHSUJCRXE0amo5cmRCTjluSm5XSjlxR2lLYnpLQkJQ?=
 =?utf-8?Q?m/jY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlY2amZCTEl2bzA1ZjZBY2Zsa2lScFhNNGkwcWRKR2VhNW5uak9Sbkh0SU9u?=
 =?utf-8?B?aWNsc2FFY01idFV2K1g3c0FjRktaRkFQaUZHMW5VTVhGb1Y2cjl0bUFveGJj?=
 =?utf-8?B?UTJxVWJVU21qN3dLbkp2bUdEUWF1TVdnOGVxVE1rOWQ1T2c3dXNVN21ob0lZ?=
 =?utf-8?B?ZVdsQW5LK1lHYzAyKytENTJjQlN2cGFzVXFqeFd0c3lidDlJNVhvMzc4Rmdz?=
 =?utf-8?B?U1BGNFdxbFB1Ymw5RWhKVldJdUtWdTd6U1NGV1NTVDFlL2FZWkx1Y000d1ox?=
 =?utf-8?B?MEZrTElSampXSWZHaXpNY2NoMlBKWlp6S202RHpURkxDZmhicDV3cGdVdmtl?=
 =?utf-8?B?VVlIZFYzdEtkT0czQk1KaGVmRUZyN3QzMXBoYlRYdkpmWi8vd1hPblAwaW5X?=
 =?utf-8?B?TWl0VnMxK1NPbnRzWFpCM2EvekZZbWwzOEdqTHltQVpMWUlnYzJNeVp0MHB6?=
 =?utf-8?B?a01kcFhmMUVPQUwwcXl4Z050bXNrUGhoaDlpL2JrYjkxTTRxb2FzNFV5aE9T?=
 =?utf-8?B?dGZDUmR4dzdhRXlnNDN3QnVuNG51YUtjMFVzUGxkTytZUzQrYUQrTUFBSW1N?=
 =?utf-8?B?d3BiSThjQ1l6a1VZbU51K2Y2dU5VaGhaQnR2cXlseGNUNFlXWkJRUUNiLzdF?=
 =?utf-8?B?d1Rub3ZrMzlmY2k2OUJ0ZmhDSTEvazc1alFLcWtYdW5MNGJLZXhyOVdyUzhk?=
 =?utf-8?B?eFZkdXJPVlZKL2dMb0N4TitUdzBpSDdocXdUejkyenRCcVZqWnoyeHdPQjMy?=
 =?utf-8?B?S0k0aVJiaEs1TmZXSnNuRjV3RzNQNkFGYVpxd3FTU2lyM0h4TDkweVZFbThH?=
 =?utf-8?B?YmJnOVdCSzZhT0NaME93RjBJVVUwWFVwMXBURnE3MFk3MWJzMlJWaDdnYnJT?=
 =?utf-8?B?SmNZY3FDb1V1TzBtdnNheXNGYllPeHgyTXd2T3VFQVhQbEdQU3Z1bm11K2ds?=
 =?utf-8?B?cldlNGFaNVR5elpwRHFqZEs4MVFTa3cwZnpOQUtBVXdpN0xTRkVkZGpCeGlr?=
 =?utf-8?B?WEpuZzJxMkhkdTBsb1FWMGxRTnNBUTZDUTFBbjEvbXdyTzFqQUswdWozbWRv?=
 =?utf-8?B?UUZncFZFRG04U1dSendPNjk1WWNtaGI4ZTV6ZGhCdGM5cjFJM1FlNHd0L1lz?=
 =?utf-8?B?TldFTGNUOEVLODlxQjltdWpoTlU3ZCsydE9EUEhxOXVlMlovdCsrODF4UjIx?=
 =?utf-8?B?Rmx0bHBCVGx1ejZnVTlyZElJTmhGNkVib0h4VGZGZ0Z6dE5tNTZmSVp0RXV3?=
 =?utf-8?B?OUZsZ25wUzNYSTVUOVZNeG9DWVNxdGZvaTY3dVlEOEY2MVl1UXQzUW9keDVQ?=
 =?utf-8?B?UlNJZ3JhVERiZ21YVGE5Z2I2c3A4Q0xEb1JKUjdhQXRBSDNLVTRJZG5Danli?=
 =?utf-8?B?RjlEbnN0QVg1TnlZMlFUWnJ2NWJxa3IwMytSN2VrTDhYWTZvVFo0Q09nQ2pp?=
 =?utf-8?B?NDdFdDVDWlJxSzdnekVoQ0dUTHJObEpNbjU0ZndmWWFwSkhNMFY0eEdVYnFS?=
 =?utf-8?B?b2t5L1pONUxzMXkvRUp0ektuYis2RENyeldJMU9tcVpZNVdXdVplMWdXemkx?=
 =?utf-8?B?cjBObWpCbzFRR2ZiK1Jqb0lIVzc1MWFWZzZlVnFGRFJEVkxDckx6Wm9VQ3hR?=
 =?utf-8?B?bThSSWVaVmEzcWEyYW5XazlQVktDSUtkeGZSYlZMM2RmUWZlN2JTUFVoZjVy?=
 =?utf-8?B?QXprNVBJYzdjSUFMeEVtdU0xZWFDbUlNRW54Q0lsSURJcERCUnBHNStMcVU5?=
 =?utf-8?B?NHNVVGVqcnNMbFhpN0tqTHU2WUpSMUM2eXlwd214SHlLVS9CeG1vY3lGcmZa?=
 =?utf-8?B?VFR0U1FkWUcxOUdES0pTblUxRVhRZW5KRlFXanl2SFpXYkljbEhHTm5mN1Jn?=
 =?utf-8?B?OTNqbDY2cHR5SG5haHhYS3NXODN2UURYV0hDZ2R5NXRPR21Tb2xXN0R6bzRD?=
 =?utf-8?B?SDVWR3Z4K29neXBzUlBlcFJ3S05uaW5NZk5BYytmcmdLREtVZnFZbzlrVWdt?=
 =?utf-8?B?VkNvMEJaeEg4SWhJMTM5UmZoMitnL2JoNXc1QVAyaU1TQ2NTbzQ1R0p1d1lv?=
 =?utf-8?B?NWVDdWR6RUFGRU05aGhURTJIVnFNOEFYbDhWZENSQmd2VC9ZbCtCQTFUc1FT?=
 =?utf-8?B?bDd2UjY0TktoS1VCVjZoNFdDZnNEWGx5QkI1T1VhQm1tVzZETEFMSVR0V1pH?=
 =?utf-8?B?cy9Yd1hFNStZeHI1bjZHcnBnUVFKZkowYWkzU3dwekVDV2xFMGNQV0huTkNF?=
 =?utf-8?B?R0Z4blZqc1FHK25uS2Zkc1ZkRm9HOCtGTVV1V0pMdE9DMkIvUS9PMUVabStM?=
 =?utf-8?B?ekpaZzllNFRQd3BQTEhZQjVNYUdraXJxN2J3YlExV1c3ZGpGMkE1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2184b7fb-a257-4ea6-3483-08de70e516ea
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 01:03:56.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzZo3ph+hws81fwhLh7clj8Cozf/uJrjHG4e2i6EQ61SvLyRh8f+90PtYjJZXToqZAqdKdx+WTzNBya6c12BeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278

On 2/17/26 12:12 PM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
>> index 465c18e4c888..6191986fc6b5 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -120,6 +120,40 @@ fn run_fwsec_frts(
>>          }
>>      }
>>  
>> +    fn run_booter(
>> +        dev: &device::Device<device::Bound>,
>> +        bar: &Bar0,
>> +        chipset: Chipset,
>> +        sec2_falcon: &Falcon<Sec2>,
>> +        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
>> +    ) -> Result {
>> +        let booter_loader = BooterFirmware::new(
>> +            dev,
>> +            BooterKind::Loader,
>> +            chipset,
>> +            FIRMWARE_VERSION,
>> +            sec2_falcon,
>> +            bar,
>> +        )?;
> 
> Maybe we should just make the part below a method of BooterFirmware, i.e.
> BooterFirmware::run()?

Done.

thanks,
-- 
John Hubbard

> 
>> +        sec2_falcon.reset(bar)?;
>> +        sec2_falcon.load(bar, &booter_loader)?;
>> +        let wpr_handle = wpr_meta.dma_handle();
>> +        let (mbox0, mbox1) = sec2_falcon.boot(
>> +            bar,
>> +            Some(wpr_handle as u32),
>> +            Some((wpr_handle >> 32) as u32),
>> +        )?;
>> +        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
>> +
>> +        if mbox0 != 0 {
>> +            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
>> +            return Err(ENODEV);
>> +        }
>> +
>> +        Ok(())
>> +    }



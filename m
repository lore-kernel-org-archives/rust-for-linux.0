Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9664F199920
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 02:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786241528; cv=fail; b=HetIdesOIz/2ZuLZgYcrGADbCo596d9zHTh6D6Jw0VEFWbtJmPwM3gR3xkcx8gFLcxkP6CAnf9e6IvwxykApbifJeccIggkffx7CN2CSdbrFsaLj6QGdYKlOGHWoqwvtAed4lkXxIBL5VsZMITlI5JAJQ/Eif2pd3BezAuH1csk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786241528; c=relaxed/simple;
	bh=0pUih7Kf2UfGqL1YxCBlpetq9iJTa/yvgNbHL1VEHjg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VlzlKnFYr+rAgZbWnCeCsR/PYLNEocXW/cwFWZIQomPPXSN1GkCvRmnrFOY0EdOW8pZYvXSdhY0Ea6KDyi1u/mnzgYMUrRMG1nQVM1nXgkE3Ez11QszTNKq1Y3njGCmFzzLcqgtnv4OLZ2YfMVGblAlGiztDigRJyn3yEgiR52Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aNcWl+dZ; arc=fail smtp.client-ip=52.101.57.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aNcWl+dZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xddTG1QL4qpU7eaFua1GVXaoLxypEzL+cDLZRTruduWnhZFr1ECcNBeFNeTDTtVN70HOcclsMV5P3SUfVr7x/W02DeJW2Oj5OYE/umVR14CiFjxRIN69nv6yShgvejcl0sE0h17B0SwJim/PJlc/Q4xRFykLHCiSPMxLuZtZlDOi872qqXDuuLwfblu9kZd0zVMW7k0xz/dVclTcyuPGffAPfiax0tGntNVq/gMVJBGwVCxcfx4vZmyU/sESymNHieeqTsGoLdnUB86cv7NvuSB033v5aYI+dprYvA/APrSVNX6XQ1jwL/kOgFThwdhrlCqHbHUnw/rwvP7Btvn7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8G41okMfLvwChlqpIEbiKevbA4ayCX4J4Rix5gCLn4=;
 b=hC5xe1BpWQ8Hf6Or8csg//ge8+AeNbVZJ/jRKNqwaBqM/3hTda39lLjS8I0GJm46398gL9SAq9zINAW7VDFi8ko0VdXOo5mMo6vuGrrEgm20Yk1oomY6iB/tHm9txrT9O1FzyFBVTxDwVjfkHBN98c3AAvQzvIbIwOVjEISp8NcVTCGuIMXjkygqc04GtF4/dkCT275BJAXgemt+mHE8GiE3QZ+DGzOasUnojtu5a3KRCMxSuaD5lBEpkA5kPUCWof4hYyUd/pRWrlVkhQTruFuDGKFpuin059EW45qSiwY3MM7i97cK1nFrCNqx+CNqW/nQ4f8Y4kaa/FHFkmid1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8G41okMfLvwChlqpIEbiKevbA4ayCX4J4Rix5gCLn4=;
 b=aNcWl+dZWuhc2xGpD3RUAQCkqCJuHSBfdhoTYQsw1xpwHMiJxrZ5vvwWOWEwp41GMLhd52r6/dp6CGU0wN+d7MYmhYxli6ijTHbziPW/uaEybw4EXaMWIki0YmLy5bO3HnaOZm+nxy6OWs46/jkO4UvmvSCqKHlD1oOU/J2xDFXWbN5E8cImLWP8uKR67K1BsfpLpnckFAo3cee8iVVuA1mPl2J1bC2VHNObJ2fT642mosSh4GXhJhpWcGl9IhfTmDD8yFCg5Vm8aoZ77gMYlWV6nkgpQt6B47ZvCYJl7ATU8gMX5K4coBW9aWUQ4e/GhLyGKbhQuE1/zyBM35EB5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Sun, 9 Aug
 2026 02:12:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0292.018; Sun, 9 Aug 2026
 02:12:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 11:11:55 +0900
Message-Id: <DKK1RS15UWJ7.1E99K1GA470LL@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, <rust-for-linux@vger.kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Antoni Boucher"
 <bouanto@zoho.com>
Subject: Re: [PATCH] rust: bitfield: always inline test conversions
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260807175012.142083-1-ojeda@kernel.org>
In-Reply-To: <20260807175012.142083-1-ojeda@kernel.org>
X-ClientProxiedBy: OS7P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d0cf03-0b76-416e-32f6-08def5bb9860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10070799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PHHkrZjcerjyGzpTi2yV9tKEWDldqjzWva2ZMV13VQ+GdP7suxdc1yvj+UWQP/DUBRvFfDyEguC09jR4+HbEJU0emHVleKSufNfcQQ+h0rpF0jtxJr/UdP6xcDOfenaVFssyRVpEBFCeU5VMcx8JzHeXOGjV/dUJsN7yGgTK3TvNrfdGxgF4ijAoStRxoG0ml/1j+u1fbHhxvWTjA5myVZNwSTE9yI5fuDf6d0ZJtWfZo1jMMTtyaE5zJD+svqDaHNDXM7HkfTXNuXqSPb2zOWu1egUtRJmw0gm5scEq8T+XHac+ZeQgPJFN9QmV5bfNZpZ4GQHtRTQqtDr8M7MF49qCOggbIcOTwteJ/gZOOgw3SpVy9F7hAnQODV0FiztJOV40vJbkNUvG8PvyajqrMSOGwi05YHK7c4gfuF3eGYFvElkHT5zRO0IX+gUvSD8BUsf6+ePJ+Hc2VrDLqxvWYOPNnhn0IE7qX/jl6uaCfQI4/JmBuemeJAp9AbrghhNiO472F9HNYqg90MLnIthnJrw+TR3WvKW3HijhisaGCamkIapq5pzrCWMJOKOYnu+46jwOxdLFWnfFFf9vEJ7jD8lkPpsGk09VmsvdemMGv2xe/Zelx5YSnnWdFlHmxkcHCxUx8zqnulkq57j7eFE36hRNflqiR7zazDfizJqgLHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVlnVzBGQVRzOU81emFQSURtdmxBNGkwTkhKQ1pXeXJxYXRPbVZ5bkhLcDVL?=
 =?utf-8?B?b1ppdW5KR0xhM1k3aW9aanpJSnArZXZueG9TbGRyaEptdUtEeFpkZ3dnWnVr?=
 =?utf-8?B?ZzJ0RUlpQllLNlNsaDlnQ2c1V3BaUXpjc1VqRkZuSzNBaWRoa1FOV2l4Qk4v?=
 =?utf-8?B?UWluRURuVVZCT0dhUGwvSmJQRU9ZSGNkZjM3UXR5WnhZTzF4S1RiL2F0Sk5Y?=
 =?utf-8?B?SWdFamthMjYza0hucFdBMDJqNkUwbktQQkc5RU9pYlQ4VTZZeE8wejRiQlQr?=
 =?utf-8?B?MGRSWG5IaGUrK0dFWUVTV2hkYjBoQjh0RCtOR2QwRGVFTHYrL054eEFZcnNT?=
 =?utf-8?B?VDJZeGt3dFFESEF5bWE0enc0NW5GdTNueUU2MkxBa25uQXpyOHRrTU95QzRR?=
 =?utf-8?B?b0Mzby95UVNmbldBUlBxam1POGF0VDJXdDBxakQrZ21PdUV5S1dYOWt2UXJM?=
 =?utf-8?B?TGpiYjNIWkpFVURCVlBlOUVnVFNMZkpjWTRiVm8yNkxXK1YxZ3pkQVNvaVl0?=
 =?utf-8?B?ZHJxYytlNUtsUmRYQWthVU9aZlQ1Z1MxaWM5OVNXSEpIbEhzT0k0L2llelc0?=
 =?utf-8?B?RG8zMUNoZ0UrRGs5ZS9HNE1DQURWZVlwS0tEZzFYWTgxbEZWYnNnU0JtYjhr?=
 =?utf-8?B?S1VuSzJmaVZSUHEwSHZ1ZEw5TzZtVHdHOFExME5KT2JUaG95RzhqQTU5YUdD?=
 =?utf-8?B?dUlSek5LSjM4eEo5MlZjR1E5aFo2QUplMEJZYkVKTzdwRCt3empha0h1SVJV?=
 =?utf-8?B?dnQxbi9YRGNUOE9QV2NKUE5MSzZEWnJOVGdGcFJlSmJxQStZQlB4eTdYeXd2?=
 =?utf-8?B?WDhPMHpWeHpNTDJ4ZkdrV2VOckpyWHVvdUZFNjdaTVJORjk2VW1PVHViTWRW?=
 =?utf-8?B?UG9LTTd5QlVGVW1Ed08rTDZ5NVVJTzkxa1diODJ4a0I1Q016WXZVOVh3NkR2?=
 =?utf-8?B?TFBvYUoxcWU2aWwvZzdORkUyam9nZ0s5ZVB4VnhENXY5Mi9XSWlRY2xnQUdY?=
 =?utf-8?B?cFZPdFQyWVN3ZWNLRW80QTRFbnNTTlBQa1BZZDZjUjlCL2NDNXNEVnZHcUlN?=
 =?utf-8?B?ck96cnBuRVFwb3NWZExmRFZLZlZ6Y3JybEhuSTNnMVRGK0k2UFplcEZFKzVu?=
 =?utf-8?B?MVdkS3phYllNU3l0UGVNTllFY3UrbEhZR1lGd3llcXVMeFFGUDUza3loRWJ2?=
 =?utf-8?B?Z2lGSFBOWFU1NjFrN24xZjlSYUcwenhMOGZqMWp4dk5NUXNJci90R1RmeWR1?=
 =?utf-8?B?b1pEUzNMNjZ3eWJCME5lVTd2Vkt0akg3TzVOVG0rblJ3ZXdDWXgwZUNVaGlE?=
 =?utf-8?B?eDlvYmFQa2dMTCtTNm9HaExDNmljWjJRZ2xHMVo3aTZ5NzBwVW5zVlRTejVI?=
 =?utf-8?B?VW5yTWJVcmV1Vmt2cDNNMXJkUk9peU5LZ2J3Zit5SzhFTlQ3WCtDRVZvZE9M?=
 =?utf-8?B?VCtIa0pZbTFDdWJBUGlRQVp0RmN4bnIrbzRMelJjdVMxSVZuUXV6QjdOdy9u?=
 =?utf-8?B?djlyRENhaDBMQTFFNmozUjhvWk90WG5SU0pjUVFDVGxjcmpBRGlKU0YxVERQ?=
 =?utf-8?B?d0dKbUJPaEFHbVhTUGdYOXA4eGExN0pacmMrZFE1NVk1MTJ0dWNxYXY2VGU3?=
 =?utf-8?B?YlgxaXhpdmxnTHUzV3E3MkdOU1I1NzNXdVVLcmpRNDBRdmh4NHIxejgram00?=
 =?utf-8?B?WlBrT2hoSmI4ODVaUVd1ZXRSSVJwZ3REYjZjbzdpbjArcGpVaFlNOFRXRUdT?=
 =?utf-8?B?TDFGTnB2U0lMOEpsNEFTd1RFdkJQNXNRTmtILzNhZ0RLaGtSMlBlaE5oclBY?=
 =?utf-8?B?STZOdnJTNDZjRkk5c0NyTmxOSGFveGp0OHBmNFU5M3BtZkwzZ0EyMWhSV2lm?=
 =?utf-8?B?U1JqNXQvVk1XK0VpajZCSnI2ZG9RbGRIYUU1NnZoa0grVGxvSXd2SkNJM1BV?=
 =?utf-8?B?RHZwQXZRM3JpbmtYUmV4U1ZPa2Vrc0gxbUFWWkxkYm8xSjhrblVUTUY4c0Nk?=
 =?utf-8?B?d0EyK2tOUkZxSS9PcnE0bWVYaDROc2NYWDd3Y3kvYVBWdHJIc1haNVBkNVVN?=
 =?utf-8?B?enIzdGJrQ1llRTUyUHE4NGRwSWQ1Qjlib21uWllHUWFzR0RSd280Ri9JT0JR?=
 =?utf-8?B?a2JNSVo3UkVtS0FDNGtkcURyMG83WWFKT09aYzl3cy9aVDFNTjhoQUc5TWls?=
 =?utf-8?B?TFQ5QWZNU2paRkFQVGdxZEhDWnQzSDI4MG54bHJRb0xOT3lzU1pjTUJvM1VG?=
 =?utf-8?B?OXJzWTEzem5wa1VYSXQvKy9IcmhPQjlrSnlTb05Jc0FRQVJGeklQOUdRV1N2?=
 =?utf-8?B?WFdJZmloalVaU04vM3BQQ0srNy9WUlJBZnlmNGZMZ1kvTkJzeFBhRWppVGxn?=
 =?utf-8?Q?+HB8ovf++GU4hnztRnaQ+myCOHVVfgmg6Wj04lO850uxh?=
X-MS-Exchange-AntiSpam-MessageData-1: 964iqTFNx2N/mQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d0cf03-0b76-416e-32f6-08def5bb9860
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 02:11:59.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1+ndbR4giE1er4CWkQvRhiXQ7SimTcoe++gCftYpDkAfdmHYqTa4WzhA/xNTtXkylErMJBZo25tCWZ6w8KRVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762

On Sat Aug 8, 2026 at 2:50 AM JST, Miguel Ojeda wrote:
> From: Antoni Boucher <bouanto@zoho.com>
>
> When using the Rust GCC backend (i.e. `rustc_codegen_gcc`), GCC does not
> inline enough these `Bounded::from_expr` calls:
>
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u16, 2> as core::convert::From<kernel::bitfield::te=
sts::Priority>>::from':
>     fake.c:(.text.unlikely+0x7be): undefined reference to `rust_build_err=
or'
>
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u64, 4> as core::convert::From<kernel::bitfield::te=
sts::MemoryType>>::from':
>     fake.c:(.text.unlikely+0x90d): undefined reference to `rust_build_err=
or'
>
> Thus, similar to commit bc197e24a3ac ("rust: num: bounded: Always inline
> fits_within and from_expr"), mark them as `#[inline(always)]`.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Antoni Boucher <bouanto@zoho.com>
> [ Reworded to add the error and to follow our usual style and sent on
>   behalf of Antoni, who found this during his work to support Rust for
>   Linux with the GCC backend, i.e. with `rustc_codegen_gcc`.- Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

There always are a couple of these going through the cracks, aren't
there. :)

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

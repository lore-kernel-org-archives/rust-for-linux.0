Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3030C34E;
	Mon,  9 Feb 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627153; cv=fail; b=TVtgqj/OI3gJMVW0Om2WTViy6PVW9quuRN85r5fY/sI9aTCZfKO7qFYqZ+maWvvmW8yQ/3e22BNNtshoYhcIKtJgcT3IZHj9T9Jj6ao7h7CJh1kGhuycCDxibSYxc3IpXCY76fOTmhC91xuTS5MiMig/V0QJmiilgIsBy3mmawk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627153; c=relaxed/simple;
	bh=LFWjk39UXWsJmKndAw7HhZ0DPUNfC4+0TBrvhAtlTAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c/KDMLSAkNhvFXOR1Lbeg09Wpn9WxdTrA4pcH3j8PXYKl6e/wfadK4ajp3HKu1Wr77c4+wkvR2uRK0pwV9/yB7tA89K0Sb3QrRAGrH6xdc9bHkM1wKZUPfsFVqXa3QH/Erq7HQjktzOrgxDGWz9A1W4CD5sRpZvSc7HD7oiWErc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Iqdp/4iG; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Iqdp/4iG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi208BmjDzo+c5dR/Uodx0e/QxB/aISpL3aVxLVqi3PFkEGkjCEh9XOe+/MScUEXWrxhBfdHxez7MpsFSz/ygBOzH9vSgtArSVF7LNeTb+EQSgruaJ47CY+0ICSZwUUXhGRYbYyCSROd1xNI9ZSycj4Nl1jzESy5BpQ/qqR0LnViAa3OVCxI+/CuQF2EXe+uXkMnjS5UaQV8OpP4YwRawQA2SC0n2u+3H/3w//Phyu1dOhmyyVd3bFxamvcaBndrdYZ0jzZLJd/GQvpR5o4raotCHKir4RdUtZLQf0FLheqExLXm66uCAZVRr4HbhB55oP6pElgbbj6uVU4UIN12Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvk4tMgx+xjSjUYVvqBhFqfrkd59nSUA6NLpra8nl+U=;
 b=kMGOwSAm2ETUXZYp0VFyQZLNJwp3QJkI4y1S+DbLJ6+ErxFuPjw2zIO6e0O8fs4uOYCFgOGNLjT1CwCG+7MpFY0S+WBJu43Aet1K2Q542xKbNIrmNkdvPxRjweQq98/fMpXTehtcJxpEmC0i2/NRQmch5vV5VFbjfmLfLl0RJerYyhsmN72M6GzTyabUerQYPrBwlrsdOUZmifjevofG59Y1tXhcJV/s+TtkCtaSXwtKAItsT4l3I6mB3iudewMPp+QGYyZbCzC2l6Um7fU8p9Z6yWn9177+XhrtuI+5k3HfDZ250wqzfvI6GQIeRBHXaGINzJ2iJLsbdbeekcVJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvk4tMgx+xjSjUYVvqBhFqfrkd59nSUA6NLpra8nl+U=;
 b=Iqdp/4iGzzxfGs8xs9JuQyLp50GCshBJazdwlGnMdn0qlaiy+3X+V+k4LYeHRryNs/CnbGEbweBk9t/973qFR4h1cTa3ExGRrIkHCnIkndXqzEIu5UyyXshUCyFO1GIGS8h08q/JfRB1+hM1fgThPLvwxrr1BleIuQZjPkP4lXQKCp+/oElAWe08fgvM79UpQyVFPaYfUoRLPpesvXH4rHaDCJ3mqB+LYFa6EzwRQhKz3zBddQOWK8CZK8gfV097FlAj/o+cTHE/2QsJ1wX5yTi9NqUB/Dtb3y7O3sFp3KlHKZabeYSz7JtKrdC1AJXm7rgqbI/qR19nopl6Qjcb9A==
Received: from DUZPR01CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::18) by AS2PR10MB7048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:594::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:52:28 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::e1) by DUZPR01CA0095.outlook.office365.com
 (2603:10a6:10:4bb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 08:52:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 08:52:28 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 9 Feb
 2026 09:52:16 +0100
Received: from [10.34.184.244] (10.34.184.244) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 9 Feb
 2026 09:52:16 +0100
Message-ID: <2b83962d-0d1d-428d-8122-da25d4cd1af5@de.bosch.com>
Date: Mon, 9 Feb 2026 09:52:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] scripts: checkpatch: add RUST_UNWRAP lint
To: Jason Hall <jason.kei.hall@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <9ecadaa2-0f6b-411f-9faf-0ecc93b26bc2@gmail.com>
 <20260208140110.258311-1-jason.kei.hall@gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260208140110.258311-1-jason.kei.hall@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C3:EE_|AS2PR10MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 594c75a9-5b7d-4d3e-b060-08de67b88e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0IvblRScnFQVTBIRUJKM2NjaGdlbG9PVlRIK1k3WlZ3OE9ZR05WM2dCcndC?=
 =?utf-8?B?YjF4c3gxVlhqd3I0ZFZscGJObnpIajV3YU85aSt1UE02UzdleDhvT3BEb2hU?=
 =?utf-8?B?VlppaDRNbHpaSkRwUGpvU29ORUxnMGZKYm8xdHF0QjJZSGMzUDRJR0JRMkNK?=
 =?utf-8?B?bjJiTWwrWHBXbmxWUlp2YUxpZTEzaThBS0xObjZIc0swRlNaaFA5MjQwQysz?=
 =?utf-8?B?OXFwR0J6M2dVNC9pMzVaeUgxY0tQRm9xelFHSFVITWorUlVtUnZvYkcyTmR2?=
 =?utf-8?B?MXN6TzdHZGFQdnRPcHhTSDUyLzNLeEpWaU9hWWl2UlNqdnZQeGtRTjQzRUVK?=
 =?utf-8?B?Tm9MWVJhZG5oNkZISnhFbmc1YTFMTVdzSTAxRitJZEZCOFg0S3doOHNsN2lH?=
 =?utf-8?B?U1ZUKzFVQWdNMWthK1M5dFk3U21HTnRqckN1Z1ptMjRsbGxjWXB0a3F5WXN1?=
 =?utf-8?B?UzBBemtHYkR4TWpTZkp6NVJWd01xeGt6ajM1d0lSeEU3cDNId0dRY0JFaVI2?=
 =?utf-8?B?d0M0L01HTGtrM2IzK0JlNXhaSXZHdSt5YzYyczRINkpGd3I3Y2NOQlZBOGJi?=
 =?utf-8?B?Sk8rZHhPRWFNUUJMMXpHZnNFWHlOOWlUMnBpWE5nZWdjblYvYXFsUVUxd3VC?=
 =?utf-8?B?N042VkJoQ09QalQzYldhTHVSU0xWYWF4WHNHNE9pbEMwaGQyZGxGME5jdmtS?=
 =?utf-8?B?ZG9CSG1PVktSVWFEcERmM1JoWXo2VTBtMmlHbEtwMkQ2RUxHRWZuRjlVNWZr?=
 =?utf-8?B?ZytXMytGSHFIQXBQa2RyTXBEMUJpOFV2OUo4aXplMnlJQnhuR0lWaHlZK0sz?=
 =?utf-8?B?V2x2emZmWWszR3pZcEQ3NGp0VE1EdUJFWmNiUC8wV1hwZjN4Q3FMMVRYL1Rn?=
 =?utf-8?B?MFhjb2NyNWwrNHBzWnc5ZXZEVEpHUWo0dmdYY1ozTGhYUCtGQWxYOVJueTNH?=
 =?utf-8?B?SThhaUZCQXpKY2ZBcGZ6WlRhdGJGdC9SNitveHptVDRSNGxqWVAxYkc4cVQx?=
 =?utf-8?B?bWRudUhEZDZDdFhHOEVHTGhUSGxuY0UxTnd2UnBlOVc0QkNaT1ZybjNzSHh0?=
 =?utf-8?B?RFAzU2FVVUd4QkRNcVNZNXNscG0yMUw0cU5icy9YR0VHMVl6QjNPL2k1OTcr?=
 =?utf-8?B?RUwyV2RZQVpRMFMwb2pwbnBFcG5TNENveVJJL3E4NEV0L2ZEYTVvYzFWSCty?=
 =?utf-8?B?OW40anRpSUVFcGJvN29UVW9RTDY2Rlh4T0lVdDQweTkrc2ZqR21rY2FjMS9E?=
 =?utf-8?B?WVVnTEpldnVGRVRCTnVWL2ZYRmd6c0ZsakllMlVodFZwUGM3MThucU93aVN3?=
 =?utf-8?B?R052ZFBMT21pQVhUVzl2T0oyM0ZKc09VaUZNb284L1NzNTZjTmhxVnAxN20v?=
 =?utf-8?B?M2NHWWJ1S21lcERld2VVLzA0V3Joa1ZTdEVyalhlK05yQWR6Y1dCZWc0UnNm?=
 =?utf-8?B?QW5ZWVlMWVJHaG9hY0V2WmpkNzdzMlp0dG0zMEkvNDZIbENZUWx3VHY4QnQw?=
 =?utf-8?B?S0tidUo0NTVKblF5MDFaVkxLcmZRRDJZcWF2S0x6TVFPeGhibWsyRHgxdUtH?=
 =?utf-8?B?Smd0MXQ5OHBEUElKNTN2UDVmajM1Y3B1SHRRV2EzaWRMTEl3MTJqaW0zOU13?=
 =?utf-8?B?bmp1VW9JTjZwREgxeDVpaTVHNFhLS3hoVUg1WjJUZm5GY0N6b2o5R29zVmN6?=
 =?utf-8?B?M2NFOWJ0NVpOZEhJbFNPNEtTY2Jja2kxdUlIb1pzdHJPMzU5WlRYK1VYTkQv?=
 =?utf-8?B?U0NzdENFSEViSTVxeG1HOUtPUG1UQk1NUFVrb3U3K0ptUnJoL1VjTzFqQThw?=
 =?utf-8?B?T3cvUlJaVHRpbXBac0U1YThhTXlCNVczTC90eU5BK3k2LzdDODJVRUdJRTJ4?=
 =?utf-8?B?Y1BydHRnU2Y5S2xlT2c3ci8xRklyNkxyb2xCSzJuTW9CQkFieTFybFRSV2g0?=
 =?utf-8?B?MzZtbmc1UHZYNDM0c1VsRk9qdHFrSTlGNEo4MGhpYjBZRkNPWC9JV1ErcnFI?=
 =?utf-8?B?aHo0OU16RXFNVit1Z0s2SUlzc0FFSTdaNjc2ZHJKWVgxMGcvUGJ2YUMzZ3BI?=
 =?utf-8?B?em5RT0xlWG80bldMSTZaN0NaN0ZVOWRDU3haSEg0WmcyRFhHUHJZMkljUG5H?=
 =?utf-8?B?N2VaOU1TWXl3Mkw2ZGRFUHlKL2hXaGQydmt2UzNlL3NSamdHQUJuYTlDTWJy?=
 =?utf-8?B?SVprRkdKL0JtelVlcjZXT2dGMmdIaXBueGJDUzJXRE5TYW9hYTdZdEhmWWdr?=
 =?utf-8?B?byswL1crSmxxd3hBZ3VSQ2c5Y05nPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KYbp8qnT6yuCGfvw3BkrFsEQgJcRCBaUN52glS4hkUPbfwjAjyx4TPP2K+9bpmqHqFAH6tlUxzxA8QBK0v/Kts0w+qxup2t/NxF81iUtUcP/ugAhuuNpYkSmxbnxBuhZvVrab3/hp09N7Btv1xVTB4zPnNIKWUmrDNNXRHsrE9zLp0R2czZE4FGbwdJ+fm5WGuvb05I+cgzuwQ1JAoPqyV/BScneoW8J8efvE+kh/Dfe40KP6I0HjSvIt6apD48qRp3jLNWzDbBBez68JDwVx0JqxgjYVEs3jAs2j2L1VpOAcNUTDfsWUiQhJKclTZzccB7fZzBP7IhlOpKbbjN02FaAH1NjR+uMS6gRecWFWOQ6gUHUs/L7OxBO8Ci+XuRPIWU2L6vHTR8wq/VD773SyiV5shrlvx9Zx9xngk9EttLBViQ0k9+PYrPwKzIGuOIw
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:52:28.6488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594c75a9-5b7d-4d3e-b060-08de67b88e06
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7048

On 08.02.2026 15:01, Jason Hall wrote:
> Hi Dirk,
> 
> I have been playing around with the lint logic. It now identifies
> when we enter a test-related block (like mod tests, #[test], or KUnit
> macros) and suppresses the warning for that specific context.
> 
> This handles the false positives you encountered in the Binder patch
> while still catching "lazy" unwraps in production logic.
> 
> I tested the scenarios laid out below.


I appreciate that its not an easy exercise. So many thanks for this! :)


> Proposed Logic:
> 
> my $in_rust_test_context = 0;
> 
> sub process_rust {
>      my ($line, $rawline, $herecurr) = @_;
> 
>      if ($rawline =~ /^(?:@@|diff --git)/) {
>          $in_rust_test_context = 0;
>      }
> 
>      if ($line =~ /^\+\s*(?:mod\s+tests|#\[.*(?:test|kunit))/) {
>          $in_rust_test_context = 1;
>      }


This implies that the "allowed" usages in tests are always at the end of 
a file? This seems to be the case at the moment? But I'm not sure if 
this holds in general?

And this won't work with `-f`? But I think this use case was somehow 
excluded by Miguel, already.

Thanks again,

Dirk


>      if ($line =~ /^\+/ && !$in_rust_test_context) {
>          if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
>              $rawline !~ /\/\/\s*PANIC:/ &&
>              $line !~ /^\+\s*\/\// &&
>              $line !~ /^\+\s*assert/) {
>              return ("RUST_UNWRAP", "...");
>          }
>      }
>      return ();
> }
> 
> Scenarios:
> 
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -42,6 +42,7 @@
>       pub fn new_with_data() -> Self {
> -        let x = Some(1);
> +        // Scenario 1: Production code (SHOULD WARN)
> +        let val = some_kernel_function().unwrap();
>           Vec { ptr: NonNull::dangling(), len: 0 }
>       }
>   
> @@ -150,6 +151,13 @@
> +    // Scenario 2: Explicitly justified (SHOULD NOT WARN)
> +    pub fn proof_of_concept() {
> +        let x = core::ptr::NonNull::new(ptr).unwrap(); // PANIC: ptr is never null here
> +    }
> +
> +    // Scenario 3: Already a comment (SHOULD NOT WARN)
> +    // let x = something.unwrap();
> +
> @@ -200,10 +208,20 @@
> +#[test]
> +fn scenario_4_standalone_test() {
> +    // SHOULD NOT WARN because of #[test] above
> +    let v: KVec<u32> = KVec::with_capacity(1, GFP_KERNEL).unwrap();
> +}
> +
> +#[macros::kunit_tests(rust_kvec)]
> +mod tests {
> +    use super::*;
> +
> +    fn test_internal_logic() {
> +        // Scenario 5: Inside KUnit mod (SHOULD NOT WARN)
> +        // Dirk's specific 21 warnings happened in a block like this.
> +        let mut v = KVec::new();
> +        v.push(1, GFP_KERNEL).unwrap();
> +        assert_eq!(v.pop().unwrap(), 1);
> +    }
> +}
> 
> If this looks okay, I can resubmit the patch series with this.
> 
> Best regards,
> Jason


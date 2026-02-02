Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013004.outbound.protection.outlook.com [52.101.83.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04651F94F;
	Mon,  2 Feb 2026 05:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770010743; cv=fail; b=tb8IQ3plwiB6egTwIjeNPFKSLPiHTyey05DJ+4t4sSjeO7KMzLtTK58Eciiip2hhJHURTavoVy9M+NX6YO8mcb/vfa2dja09ONh3gqRZHv/EfvD4xQ77RKz2PVvz9BSkxXROlyUgQBmcvxVRZ9ikdDv+bunKk7j38tK2ChUOimc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770010743; c=relaxed/simple;
	bh=N1l+ynl8s1rB6LC8gR/qnGDuylHolB+Ba8NZ9Dd+Yew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=if32Mut1b8Su857AYaLtwDzZeE98ZKIMbcRZFeFbAc5rgM1yfxXJsk/nB+1eaYoY3L3F1WKpl2E15rdG8yJuRm8z/WFjqci7pHRpjc9QMBNGCUI0YUhXuKgWgYIN5qSeeJU46tsLSWI3nF/mDX97JMEgkjgXBaqHOOHSQbioVuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=MUPpYQML; arc=fail smtp.client-ip=52.101.83.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="MUPpYQML"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA+GE5NYv1pBQA+Oa2KzU/5BDjo1jRbZCXAcTNJuLsYTAMlRIVBrvbHrooOs3xRbfBZo+ZKJcQs66pz+f5ugD37TEdmcNX2aV5f3zSkitR49IkAjcgZlUYaiA31UK348uNCRvo4Ni3AwVf2WqKm1s1E0fx1NX5SBH3/8Symzb2LlPqJAjs8lg/1JyGUG4ux3A28ws9jTiDCWui6wARHrFtY/E8niPDc/e6rHawV6tVwRJaLI/c/xeg2z0kfOnekSpLzr80JPy42FaIFjdr9jGOxU0HZxeF3tlIHlVr/IO+G0wN8f2SVm1TND/UdKy481u5WvB+aXdnOl5lMo+Z0+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4veQ0Rc9XqFTvP3wsXnRaZZORn99y9SfYc5u8TBfDfM=;
 b=tIDtT9CZlwf57LNvGWKzz/rbjhtrQF6Q+AlJK1RBXaRrT8Ky85BFyk6RWENxpt0tUWgpmy3efLVegERbaM9D5eG5zTh8yWyHQ0K2g0PPlHlB9ssfKpvu91AhLGiSl6sVGDGu1yniXZL7PTMh4FU+8OfuBxaS17JNNduUy8DiB7TJ/x7Ca9N7O1EXTEXbvEZ220BEnVZ+txgvYMWrcsuuqlv05SkO8BCes3kOPdpdop+dAr3UAYgFDOCrbAvr2V+LZoZ+xXx9Jdk+euC8IHWIXjQhR0rDfahgV4Z5DLTvk4VLTmKWjWyKHswvW3VTRaRL2AK3tgQmkF9a1IqNgKWqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4veQ0Rc9XqFTvP3wsXnRaZZORn99y9SfYc5u8TBfDfM=;
 b=MUPpYQMLM3z58ewdn0lAZ9pZHGTrftCrS7HvlFO02ILGi4iODjjskMR+OOnnIUTOLe2NP1Q/c3bGZ2G98sS2USR7VyCWGrRUizIRe6n/mTI6XgF3I+6n+KLM4wiH2a9xJNIZrNJRiHngjeoWn/W5p6cl5Aa7AVBqtebeYQo4UmUwFPAiMqgjV60AFMRfdMevBLuDrP9Z9K4BJ0QSbS5LpShgwPh7F+ANjPU6N14YKLJS/vtiCjYIoQmHtg9WWuT+2NfA1f59nrm8WBgKgdRxU897PDeRMSesD028qqGSpYksd1Ku/mKgQK0ugWqBX6iiOLKCDgdQ3/36Z7v1ifyS9w==
Received: from AM8P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::10)
 by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 05:38:55 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21b:cafe::87) by AM8P251CA0005.outlook.office365.com
 (2603:10a6:20b:21b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Mon,
 2 Feb 2026 05:38:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 05:38:54 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 2 Feb
 2026 06:38:39 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 2 Feb
 2026 06:38:39 +0100
Message-ID: <14d95956-05dd-4c9b-b748-894c1d474c1c@de.bosch.com>
Date: Mon, 2 Feb 2026 06:38:32 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3] scripts: checkpatch: warn on Rust panicking methods
To: Jason Hall <jason.kei.hall@gmail.com>, <joe@perches.com>
CC: <charmitro@posteo.net>, <foster.ryan.r@gmail.com>, <ojeda@kernel.org>,
	<gary@garyguo.net>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <875x8gqt3y.fsf@posteo.net>
 <20260201195737.1715632-2-jason.kei.hall@gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260201195737.1715632-2-jason.kei.hall@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DB9PR10MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 67650f9a-6792-4667-dcbb-08de621d5ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFBKMGNMMWZPbkZtdTdGbHRCU21uVlA3WXVvKzZidVFkQjBMN3RBQ2xoZ2Qz?=
 =?utf-8?B?R2dIYUZXOVhBS3lVRE0yT2hmZDBMTTRJK1ZqeUsydzZoeUpaeWZCcURXemgw?=
 =?utf-8?B?UVo1U2NYbjJ1eVRMa1VPeHI2QkcydXNNenUvUzhDNFYvZGlhMzhMbmNvV2dj?=
 =?utf-8?B?UlRoTlRBMzRxblVOektDalEyYzBtVVNlRElvNE1qbDFBNmM4M0ZEeXRRbzJG?=
 =?utf-8?B?SEJnNXZvcWowelgwVGNPSThBYkFvbHFRZXdXQUIvb05uR0dMaHlscDF5a1Q5?=
 =?utf-8?B?RmVURHNpOUxwdUFkZmFLbmJMSUcvNjFLR0JaWjJwT1RsTWhrM0Q4ajhYdVN5?=
 =?utf-8?B?ZVlIWUpGcDVFMzl0L3FJOGlmbVM1a3owcXN6bzFuQmE2c0xYNWhNT1FSWEEv?=
 =?utf-8?B?N1JGc084SUhKRWVLZnJVd1VleXZzcnJHVkdXWHpVWkFuWjJYclJhVTlmL3h1?=
 =?utf-8?B?aG1uanRYM3QxYWtMYlAyVnVIamMxU2g0NDJ0U0E1TGlsOFB4ekpQMGovNUVZ?=
 =?utf-8?B?Sjc3MkV5eEdPT0loaG1XUlBlSGZaTm9aY09nWlZDQ3hFV1E3emY3OWtjRmFh?=
 =?utf-8?B?VlRoRWgvVVE1aVJYNGtJL1BGTWdNK084a2FQOHZVaUFadlRwZHVNeHNXUXg4?=
 =?utf-8?B?ODRPZWM3bUh3ZXBSQUlBNzVOaGJSdWl0V3p3Q0h6OXYrRTZJOGt3WTVyZDVp?=
 =?utf-8?B?MTdvWUtrQlEwTzFPaU9ORlMyUzBhSWJKa1E4U0EwQVYybWtTaFpwWGl4Yi9s?=
 =?utf-8?B?dG9QaHlmTm84UHRHOEdRWHRENEo4SDhDbEFja1p1UXFqbXlmVytpUDhlTGkr?=
 =?utf-8?B?eTcwWVVVcmxmUkNUZFJBNXliS2VZQWM5Qzk5c0hjdjFsQVZ3OEx4MmNqeW1G?=
 =?utf-8?B?WEMvcjJla1BHZGl0dkh2ZWRuYXRCTDBwS2F6N20wcEhNOGxoYzVNZHcvOE1K?=
 =?utf-8?B?WnBibmhxenVZMjNuZlhMbVNxSHJPUU8zSzYrTFlySnZIU2RXU1NEMVZKVStU?=
 =?utf-8?B?SDBNVi9uaXlsVXl0Y1hmUWZ2ZHcvMlZXVkpRelhCYU13SDNxSWxHdTY5UFZ0?=
 =?utf-8?B?TFI0TlJZTW14Z2RUU1QySDMvcW5mUWF0UHhtcVVNUG1JYStzV1RaT1VEMHFM?=
 =?utf-8?B?ZmcrK3o5WWx1amZham5PbnVPVjNYR0VyOWQvaGxwSFF6VEVIMnVHeThLcEFy?=
 =?utf-8?B?a001TzFwNW9SNkRIeTZVL3FzbmlCRldIcWNoM1ZBUW5XNDZtMEdhbENjbGhj?=
 =?utf-8?B?a1ozOFlEWHdNN3V6NWVodDMwZXZEQTk4YU9ERDY0SVkwd05ObWt2Z0JBeVY0?=
 =?utf-8?B?aVlBdm5DWUVEMldmMFFVQzlHY2FQS3NSWVdEbkdMdFpRRkdlWjQyZW52c2Jv?=
 =?utf-8?B?SlY3NUxnRVdRWjBoNUQ5Sm00SE5NVW5wZ0FpL003TThwZTF5VmNDRXZNMENI?=
 =?utf-8?B?Y3A1UG9rLzFXTEVncVhBY21QQ2NpdVczOGFiSlFUbXBzUE5xOFFWenI0RFp5?=
 =?utf-8?B?NVJ4MmJjaVNtWW1KVWRPWHB0eHpJL3dEQk0xY29HZy9SdE1tWkNiUWU1d29i?=
 =?utf-8?B?dlBKbURhalhkWU4zbUhydHYycU1ENDhvV3EydzBIZWlyeVI0R0tBaHIvSXI5?=
 =?utf-8?B?NUY5OHU3RTR5dkZmTzdwemUzMUU2RDk3RHdxRGFuYTlYSWdXZURITzRBS2Zo?=
 =?utf-8?B?bE1FdUwzamlBaHdSTXphOWVCRGJaSEJqdFZqRE8vSDl0eFZMRUhtVGxENUtJ?=
 =?utf-8?B?SnFwRHAwbmQraW01cU5uUm10YXFxdWFCek45bnM5bUZ3bzh0OEtkLzEzRENw?=
 =?utf-8?B?WjBheGRvaE9zQTF3QWhsdG12Q0lKRE5iZEgzREt5TFg2R2NUUFZOZFJsZUl6?=
 =?utf-8?B?Yy9UZ1Z6c2ZLUS9HSGVyTGJOLzRSdjhOMlJjL3NDazllWks0dldvM3YxeXhK?=
 =?utf-8?B?NXNBYyt2R2FIL3JjMU1HNEFZL1BETWlFTUdRM2YzREUyU0Vwci9FVG50T0Fz?=
 =?utf-8?B?a2xneWpNZldZK3R0VVlRZEIxemFGcXRWN3ZPSFVIMVM3eGRxZ1o1cUd1d0dr?=
 =?utf-8?B?Vit3YWhIR2FaZFQ3YWxTOGNubmNnRVpsVDh1dEp6Q3hEVCtxaGVheGV4dzJi?=
 =?utf-8?B?emVPclZvMlRGTWw0LzRuNStjWlJ6amRJZEdhZzgxMDkrQkNGWTZHYkN0bk0z?=
 =?utf-8?Q?D/QEe+QZydIiwovs95M9d+I=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/GNEj4n9oPZNsD8Eep8VerKCk8ARdF3TZj+9Sb10C6u2fW6gISviEhx37Fq3bnmZ+4AZ8FFy0OoS3eh6aufZ3/Jg3nczTJBxWCwnjW+pYO76TyjEu6zIq71aGdkSr4a7lwU6IU5ExkWd1P1MCTSVu+/7lfcP4bZNnEZFYe29Qu57xfjSmrIvICJ7Hh4Tx9R1UcP/wG8BJ+4UOQiFPuNHYZs7dAQIIk+ZIyV5mgs/Qe0qT2syytwwD525gG9n/tpoB3Um4TugwhyNYFBJQkmdxDA++h0q4vHbaQKkjdIjyGC3VSOrR0atyf1CpZy4eLH6JiBJQuN2uY/Uo44UsVn4eNZ2bA8WIIjtHir18tjMrnQ2QkaUt45SgOlRpezuV6rSdB2WYq24Q03PpoRfmawloxcpQ4ORDEbXuOxPx41KTpkwW9Qf3Ky9olqYH+Q1Tgp1
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 05:38:54.8104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67650f9a-6792-4667-dcbb-08de621d5ab8
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5354

Hi Jason,

On 01/02/2026 20:57, Jason Hall wrote:
> Added regex check in checkpatch.pl for common Rust panicking methods

Describe your changes in imperative mood. Added -> Add

> like unwrap() and expect().
> 
> Allowed an exception if the line contains a '// PANIC:' comment.

I recently came across that using `.unwrap()` in `tests` seems to be 
fine. E.g.:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/alloc/kvec.rs#n1364

Is this covered here?

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-linux/linux/issues/1191
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

Something with the formatting seems to be wrong here? `---` is missing here?

Best regards

Dirk

> Hi, Joe,
> 
> I updated the regex, and I looked at Ryan Foster's patch.  These two PANIC
> checks don't seem to interfere with each other as far as I can see.
> ---
> v3:
>   - Using non-capturing groups (?:) to optimize regex.
> v2:
>   - Switched from \b to (\.|::) to avoid false positives in strings.
>   - Added : to PANIC comment check.
>   scripts/checkpatch.pl | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c0250244cf7a..37bdf602e7e7 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3834,6 +3834,17 @@ sub process {
>   # check we are in a valid source file if not then ignore this hunk
>   		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
>   
> +# check for Rust unwrap/expect
> +		if ($realfile =~ /\.rs$/ && $line =~ /^\+/) {
> +			if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
> +				$rawline !~ /\/\/\s*PANIC:/ &&
> +				$line !~ /^\+\s*\/\// &&
> +				$line !~ /^\+\s*assert/) {
> +				WARN("RUST_UNWRAP",
> +					"Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
> +			}
> +		}
> +
>   # check for using SPDX-License-Identifier on the wrong line number
>   		if ($realline != $checklicenseline &&
>   		    $rawline =~ /\bSPDX-License-Identifier:/ &&


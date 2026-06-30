Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A128DC4
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808316; cv=fail; b=qstVQw83H3aD4+0NjG0jPTdxYFlnqSjXoyel4lSYQJYQwzOzH0UfJZ8UBiEabFkAUQThBZIGSldG1ku/HGW40eedSDIHuYp13LVN17q+cAAGAFCy9+ITsnaKmhRrb4DXxGNPuH4QAaX9QQoUPGw8vD8Sxb4KYV9uY51MhMSeOXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808316; c=relaxed/simple;
	bh=WEZ004OqG5U8l0bUXf+V9mKD1YmOiamnJJXSyvq7FJ8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WcjWw2wPuWGzIJS9vwBZg7EBZNMWc/r8iRkzsRPHiLaxQjYt8h9S2vifdJjdNSTfd6eHt4uUMCOdlUTCjJ2Vjq/LqPnj/LzVfxKnOoYd9oty3rmCS/9Wh7fSck6cFyhJHMI9vFQHxE4rm2rSltoXGE9AMKI7waKjVlvA9i9QPoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c3JqZVHZ; arc=fail smtp.client-ip=52.101.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c3JqZVHZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR3yIth3kIZVzVdE4NHrEG5kdbbpOSkf2dEqtceVMZMw6JkL8kXVC522Z048qXE2JnIn1veBLKfJWMsTej+3PbAZoZMHSh94OrOEwCM3LzhJICzSK5ppGFOKb6TSjoFQhkituaYQyTCFUAV4Mn9rZ+AkA2W+/8jj47FozaQQbVXY97ckcESZSeJ/OVZQ9m+aajEtdWvpLQ0h77NWBArTzvKxYUP6DDOz6Y95AMV/OM2Fyy627am1l3bJHlBd7CcITxKbPT6shRPH1L+5wPXV8N3T3mAPnFRHWpfUI5ahVlmpsuivDcdvHTO7RY/VHwPMRg8+d1gXNnTDMcjpIRU36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTlCPrTqNPEq37bBO4okSzsGbVHlGno1JLl30auYMGo=;
 b=fh5Qlyc9NwCyBVcoHHiaF8XGx3AJmd61i/DY4bvNGFuTby35rQIDkfT0Dwaw5rqfCSlr+6WwED2cMKc6IgZLtQljPe032jfgLsWOtAFWQ739qgGTMBoiyUTKAzT9EHLGxsP4CfAJvg2h7byMWATwc4GY7JaDUUq4uf2aIuDkZ6kn+Xv5eg3cvpL2AKDDfzWSTz+WgpiQcFDAyfr4fZ5rLJ1cHTGx+HHJVJ4wNKcEZykIYcBrgeyfHs1/vp72P/BNBuUIhyqkIQAI5TwXcZMZC7eO4p/usd3uLsiAv0IhO6Df1XDvZUlq/7LuLYH8eZKaSKVyotQo7lAVBnGFwjNTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTlCPrTqNPEq37bBO4okSzsGbVHlGno1JLl30auYMGo=;
 b=c3JqZVHZYa90keO44cfaPOgL9Khm+tJKVmD80p6Cy+jkW4jtcJuHzsp1tNRdyeonoguINNxbmTYGxxFV4lfsJW9sN+O7KK2sUKfZb9DqQ0EmZmCrZLT3h/a/U+4DNJjVnx4EvAGOMouq5hI8o7DYfjQgjbCvnZz2TGYvR/0K0NLXURSH/LHn3gzUcqvDcxG0Bg8NtPrHykmCw/p1NQp4ujNfclPfXUd6MU9mTWsX+Qzq2pJIb/veTeCwXlUZv1SKw0XqTgHiPb05jxjlzjmPRZgt86o8/3Zepj7EWHm+EEltIdJg9MVaHyc9KCGtVrf3jLs2UQUsbopHml0XT3gCTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:31:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 08:31:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 17:31:44 +0900
Message-Id: <DJM8SSFIWO1F.XXJVWIMPWWV2@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: error: add remaining error codes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260629183022.2709524-1-ttabi@nvidia.com>
In-Reply-To: <20260629183022.2709524-1-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3695c2-ee92-47ce-f78d-08ded682069b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EbJC6BVEbaoaq2+wjuS1rO5IAc5QHIJ7ajk1l20zHXLHcf3Hj9oKiFN8wlrK0wk/zLV+nbV73qMXLG/nkECsRTMk/EFt0xs7farKaTCrlQk2K1K8kZw3/xEXVcQQlh6rdeN7k7NH1JUWogGRbBmGqX/mhrxkY5TIqfzLi9G0W8Ll9QE4xqmPv14uz+yVc9m1s6729n6QkocxGw7BWIx4IwiN5uSWHwbWLgDHU1Ok3c9bbzkZFzBGM7yL8jjGnKVlCw0k/CRftqiIMfeKGcIzMbcYbSq9Ly997NJs7IVPDbvhj19ZNF6rX7tMaYiqbeTgljYB6fxz8l9wojANGwAdcVdKOXBjdkyShLAys4ebXMejYh4xp8XoLZeXFJytyqKGhx3lhn4pEH++Mg/q7EuD5KiRnhSgN7O+RFTCijc7sj6MotK3fXskOvAHxmZLU8SHRlm+0JJwjfq6r7jvlyWH3rmw8dgtH4eY7NkiCNTEOP2Okf/yGFyL1WO9TlpLWZiR8JCRSDgLN1MDmzvHeg5r2ZSzGolCLf4LTnzz6jJ9qF9gVmR6fxe2MGYn6RkOYiKRRJyxZYuuMwoSAT79c9DNI/XQ2Ly+XNcmpvapQV5HAxisntULnX0UzFiCWsKREspWG7AOC2w5xnX4y89zg97zK1ipCKGVsiBHolqaaQeTypo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWpTSkxIMTZJaDZLSCtTc1ByeXF2d0F4M0I5ckIwNStPMkErMjJuWEMzUUo5?=
 =?utf-8?B?UXNTSWtCRjNpZkdhU0tSV3BKR1A2d1BlSzdBTmZrS3lndDlSTWZNQ0VXK2tM?=
 =?utf-8?B?Z1VET1R5dHFCRXRQY29RQjRDOWUwQWVYR2hXY2tUUWd1R1JadnI3OFV1Ynd1?=
 =?utf-8?B?QzZTZWhwazhOOHpUcXBheWxFOUxod1JkS1FGbnRUN1h2K3F2QXNxRWV5VU5N?=
 =?utf-8?B?Tmd1NWxCNGc3S1gxN0c3T2Y5VXF0MTNvMlpUSlB6SWtHZmErUFZtTk83Y2xx?=
 =?utf-8?B?OGNqNm12RkljbVRlbVhDOXVSV21tb2JrZ0lBMFVWVGtHSDJkYkdFSjRPYlZC?=
 =?utf-8?B?czdHdFN5S3h4bWVGMTNQL096WWUyZmIxaUZub3EwR3RTTjhJMnFsOEVmd1J4?=
 =?utf-8?B?WEJ3WURxcUJON1hndEVBWHJyRFE2ZU5JaVZ2T2xtbUpJVEhjRm5jZ1ZnWTRW?=
 =?utf-8?B?SGRCMTh3ejVPajZkQ0luUGR4dWx6VUVnYmFVWXZ1R3RFclhQcVZaMjllcVlX?=
 =?utf-8?B?Smc0N25wYXI3d1JoWDFhMHNxRDNHUnBrRjlMcDRLdFJvNDFJQ0dhMnVHRFo5?=
 =?utf-8?B?dVFDT28rdHNoL09HSHprVXVldjNYYW5IUzhiZ04veTIrRWlBQjJkdE51KzdU?=
 =?utf-8?B?azUwVG0zTHlaZEc4c05zNmIzNTFJMEVXa1NnM1VaYWVFRVJZZVZSOWkyN0ly?=
 =?utf-8?B?amRIaXJnWVF4R0V0UzRVYXJsT08vMHpKc0FtYTdxanFidU9FUEFyRUNTdTE4?=
 =?utf-8?B?eWlpTGN1ZmxLcS84THU5dnBKN3lDa0Y5Z0xORkY0OFdkbWQzVkdQWWxVdFdW?=
 =?utf-8?B?c3VzT2hndnhWMlV1UXBLckdTeEh0ME15NEV1Z09XUWpGeWlvUUx5elVtbjNt?=
 =?utf-8?B?dGJwdDFWcGR2bVp6OXR6dVhCUmRuUld3MGVjN2UveStrNmgrQnZqQXZ0b2Zu?=
 =?utf-8?B?aElmd3BKR0ttZUdHWmttZlpSRm1PeklSWWhUQ05VZ0laMUZZdW1OUzNuRy9S?=
 =?utf-8?B?azRwSXFUMHY2M1Q4ZXUvNFFEZ1E1U2JaZFllWGh5ODhIbE15Y0JJR25qZHNM?=
 =?utf-8?B?bTYvbVJ1NVN0VkRYVHhsOE8zcGF4K0lCTEQ0L2Rmc1paVDRtSmNoSFJ3TDdo?=
 =?utf-8?B?SzNRWk56OXJhckNha1VPdFNjc3VUYmlPQVhYeGNDZWNxQjZlQzJVaVhJU0pL?=
 =?utf-8?B?ckxHSlBXV0ZSVHBmaUpyMHRubDNwdS9OK1hrNTdaZ3lPbTh1YVR4bEpQOFJQ?=
 =?utf-8?B?L2VOYnVzVG1mQXM2ZTVtU3llYVJRR0svM3RNb2JES1ZvUityRTVhbUZtODNu?=
 =?utf-8?B?ZVdMemxaekgrRDdHVktLSGFEc05US0x4WTRCekZ1clZxVnMwNFpHbyt1VjZy?=
 =?utf-8?B?Z2Yrd3hPcTh2VjVta1Q0QWZtbXNDdlVQTGlBalpEdGFpNzNRRUsvVFFYOStz?=
 =?utf-8?B?MitwOWFxc1lZd0RFdUlkQ0grcFFZZ3FHaGhubWl1TzE2eURucVFFNVVuSE1O?=
 =?utf-8?B?STF1VTNSY2kwRnpndlBXaXJXTm91UGNnUGp3VEt0SjVKY1Z3Z2F1YUtGa2sy?=
 =?utf-8?B?Ui95a085bXhHMDI5ZFZsZ3hjVmFYdXpkQmsrOUtjUyt3VG0zS000dzVYZm9C?=
 =?utf-8?B?UUx0bFQ5WTdpNSs3cXFyd1BOWk8xV0Fqa3JSL1hWRTk4UzA4N1RGRGpULzV4?=
 =?utf-8?B?eFc3My94YlFUeWc0L3VaclRjVHhuUlJMYzFZVkJGMGcxZEJqaU96eDBRQnRl?=
 =?utf-8?B?d1hibjNzTE9aUVhDOTJEcVRtNDBCNXJqTVllcjlZR2Y5VkZaVVBQNDhiNzZ5?=
 =?utf-8?B?a0xMTkRzWU0yaS8vYUtqY2srZkRqakt6VGtTbFo1TCszUXQ3WWs1dDduckc1?=
 =?utf-8?B?UjZoK2VSWlZlbjZlRXBnUTRCOTJMSjUxTHZZRU04akt3SzJUdnlmWVlEaXRC?=
 =?utf-8?B?OUtxWE9MRTJrUFNiOFVqdDVnS285b3hLSW9YWFlkanUyVVVVbU9sVFY1a0Vz?=
 =?utf-8?B?Q2g3SUhJbWhhVkNZTFZBemw4M24yd2FZMUxGYXZuYjY4c21Fbm9XenI0bFls?=
 =?utf-8?B?V2ZsemVtM2pxOGxHa3Q0YVNVVHorcm9lU3paUGhWMUxFcytvMG93aDllK2tv?=
 =?utf-8?B?TUREMHhNTHhGRjR5REdaKy8vdGUxejZjenFWT1Y2N1d0MmthQ0p5ck0xa2JY?=
 =?utf-8?B?V2VCTzlSVXFITXRTL0IyMGJTb1pQSW8yclZnY3ovZllqMWpjWVFIa25MQm9V?=
 =?utf-8?B?b2NsaGxNRWswaUkyeC8zdlhYWGRBc0JDdUZmcFMyOWRpVThxc1ZVREJFaHhn?=
 =?utf-8?B?bHBTS0c4NHNscHl4RnJiOTJOMUJHb0hkWWlROFh6eStPNExTNlMxbCs3Tjkr?=
 =?utf-8?Q?fT2KD1N7ZseQjO0nOmp2TBGc9oG/KVcPE8WFAIDDtwEKA?=
X-MS-Exchange-AntiSpam-MessageData-1: crSoB2goPWxsEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3695c2-ee92-47ce-f78d-08ded682069b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:31:48.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWdZ7fOS5GvA0mcCTxlWDYsektKrbx47ZE/tZKxQlGYSdmYPNC3GaxVKTnARr9AlzEdNxK6jl8FDRb9DrsCZrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142

On Tue Jun 30, 2026 at 3:30 AM JST, Timur Tabi wrote:
> Add all of the remaining error codes from include/uapi/asm-generic/errno.=
h.
>
> Previous updates to error.rs have been piecemeal -- adding single error
> codes as needed.  Instead, we can avoid future problems by adding all
> the remaining error code in one swoop.
>
> EDEADLOCK and EWOULDBLOCK are intentionally left out: they are just
> deprecated compatibility aliases of EDEADLK and EAGAIN, kept around for
> non-Linux/POSIX code, and have no use in new kernel code.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Nice, no more ad-hoc patches to add newly required error codes! :) I
remember having some of these conflict in the past.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

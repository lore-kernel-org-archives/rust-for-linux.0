Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022108.outbound.protection.outlook.com [52.101.96.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6E244692;
	Fri, 27 Feb 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202059; cv=fail; b=fiZDG1HEtzR7k/nM1x3zwOsfUXlyW8+kuRoSrGHe1gobsGP7jKGPIn2OHd2o0Q4qiYkW3W01s22sYr7uLiOhxbueI8gJfrqdmMwBt7BcotkOVekamxWfL7XhrXHLD+f48cP64OwZD83DzQwjRJFJdiyb4tfj/RUbdm3SWBlSgjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202059; c=relaxed/simple;
	bh=NC21ncyW49FXG3XmAiPVicN/5zdot9dujsxuVGtqEjM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=aM0DZxiR4jn81/NDRKYafXNZPk5bnej5KNouHZW7LGYDMVAHTZTvgN6+K6fZXD5P9J+1Rq2X2hYXuIMpGEW/kQK9dc+7Cje1Wh/XEnp+royA3b8FYqMfI3eImGsH3K1gLIi7VFo6Pr4FV4NfPy/Ny2Etc6cI5naF6JbjImesnr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZUK43l9e; arc=fail smtp.client-ip=52.101.96.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZUK43l9e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSWAqpJhBSaCg88tt2CqFOX+uKLkIlAPjgkv0j91Ak8bi7hrtAtXJ0BrKOb0VcOj1WC9LjooufI1y8QSmvvziksOXOlmrD5kw+BboXXRxjiQLgy3j+oU4pnVCgX2koWGSd0Lv90tEXXUoF9F3TdOu5qfFsi9gvTVF7SSwZcP42+v7jCHQ5VEY3ja+MY7GXTJ3UI9TM6PxTmxrbL5SHPvxmoKNEsx9rA+1Ajw6l6xAw/yjt56ag3YqmeV/c/pOLTIUcgsluOBdyjc/wqVDzUl87fWZguswwVGzLjex8XVuOGQ4wqwuOLLfeavMVPlcveBVxiZ3PbZQfD0jKQpTgSl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUF0CXFhL8fTEnZy9IxvubPAJYfeLj+NDAE5vDwtZB0=;
 b=cMz+1IZu+OEeMU56nQ9aVt88t3eZvwODcstXoMiWCpqPDp4W9o5nCXxDj6BPDolhRFIcbywgvaxaA+LDQ//8B7H8JR9Gu/2O3AeJUvn09PVgwB55EQ8YqeovHmksY3vAU6hPgAOcFPc6MYMsfx3hiFagOUnlKG29E2tKNWVJyXH1ir+NHfxTBnggGCxi9POMmiv2lJ5ATdU9t7xHJwT4JnE1QtH0WI7RfbbUPGT2zkGKfWvmuRonjXos873ACqhHCFA2V1+XQPIxvg4EZU+vefMMj17QxH0bhH6X7IZXw/DQCqDnE1vujAUWQ0Kt0vpVh7Z8KOHSQJF3aUoq9cWCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUF0CXFhL8fTEnZy9IxvubPAJYfeLj+NDAE5vDwtZB0=;
 b=ZUK43l9eaLJrtx9PL08C3b3CVW6j+nQyqgP8QizX7cTyIr71lSAOZJ6DBbI2EAigmkCLSwp2egbUqwDhzj5ylXGbzdATEG+AsoHZZWrY5trl03FGK03AJpAUMM/w0yyEsRaeCMX8RRoOdDd3G873FOb4KEXJ+GGF2PUWX7iVyyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6074.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:298::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 14:20:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:20:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:20:46 +0000
Message-Id: <DGPT710WN25X.1B9P21BE6X8P4@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] rust: impl_flags: add convenience functions
X-Mailer: aerc 0.21.0
References: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org>
In-Reply-To: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org>
X-ClientProxiedBy: LO4P123CA0558.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb081c5-903e-41e5-0152-08de760b69c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	8PMOiJrihAR8Xz8qGnx0qr4ykU5uXsnQ1/kokh5bG7aVvIKmSwgicXqehqBVRutMYcMpsQ/p61v1Qg5h9N+IiZ5hF0CQG2BobzPrspYZQRKXiud3pc6gHzZApnBJYsCfH2+0b9fqda3qIdstegYWZydnvfcTZXrBcsuLo8brizwC75EARQX0V5afa0XIfoI54k97GIDeWqbTraI1FW43jRXLGh/1YEFhBw16qAEYgK1FrDVz3q5VxxvtrPuLjw3rROoCEX+FbfgerXzKyTFHyMJXzYCn6vxLCErD0lJqCwaitgSLRBClDGWZLp2sIULZcyJQhKO4jMGC2ROChWHdnc2pFj32YAun3+4i/ylq0EAEmjSb+cSZsKBwcNOtIB4smq9g9MfttK0gMaAclsntmFfox5pXWgli3ryZYk/UyKS0LD1ak1NN/huL1eqZu+iquJT7oqF027Mku96VADfd1RiHJ1XMKT8DE7KslS5sZ+6L/0C2TrgwDTIxC85ofiIGj7A8+lK6UCDOGQ96fJg0DSsTFMbEyAkdu/5wqlI2XSx66d62L2sjzxmoYwSUFesCrwwQEHBT15cJaaRmggSSiDjkA7uSMsVyZdozYcyV9p7gj1p4etW9hvPowhMukx3ftX5kmuqxeQ2RS5SfxWfGWCT05vvGU//i4QevQ+57g2GWxMo/yzb9dv6Mm+yvYxpBZ9ZMjmMAXNJwL7uzePbzLyJhRm/+QOo+1I38NbdirEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1d0WGRhNTZUUEdLVFJqOUUwQlFuWkxXOFpsZTBGN0pnYTRNY254elQ2R1N5?=
 =?utf-8?B?U0ZSbHZGdXlyQSs0ZEhBNzk5enlJVVgxUzdnclFEZzdGSWF2R2k0Y0NFUFh1?=
 =?utf-8?B?MXR4Q1Q2S0dNdXVMbFRnanpoL0hvRUpXZ0tNUUI0Q2xQSzFTR1V5QzJpQ3Ni?=
 =?utf-8?B?akV1cWNvT295NUZWNFpkMnRnenJRTGhjSmNhVEFFWmRBbDIyVG5CSkZGMHQz?=
 =?utf-8?B?R09kZ0hQUVl2ZjdmWUJDZ1VKREo2VUF3T2I4YkQxYldPRnJHTW5hd2hSTUNV?=
 =?utf-8?B?d0ZlNzFQOG12di9Sd2JoY2N6VDZzd3duaW1VSlRvYzRBT0oxM213aHJ5MDNM?=
 =?utf-8?B?L3NDSlNySHFrN1RuZ2xwa2VBRmFvQXI2Z3dOTU9KV1dMVzg1V0JXblJUdytV?=
 =?utf-8?B?Tnl4d3pMa2xCUkZPZHAyTnNoMnZDeHRzQlpWNi80WDhDOE1VTnJLcXB5U0p1?=
 =?utf-8?B?RkEwbDdOTFRQaTB5bDYva25qVmdQTlduMWFQaGFocForY3h0Z3d5YWdOaUxx?=
 =?utf-8?B?TTJvRFRhNm9SOVlLSTFDb2hNQjBkY21HdEY5QWxiaEIya1diNm0rTWttMy9H?=
 =?utf-8?B?MS9RT3RtUHdUbWVibjJGbktUNGdWSk5HRGhxMDZCcTg4akorNGJSeXVtUVhh?=
 =?utf-8?B?VndmUlp1am5iWUFCL3B0NVU0R0xoOEpLV284ZHBmSjNOUkU5VUpPaHVBRjB0?=
 =?utf-8?B?ZHVwdkduNlpVU3k5RUNmVkdHVUdPQUphdTVXaHljeGJjQW5ySWp3MVR3Nmg0?=
 =?utf-8?B?TENwQUhWcHF4RDRoS2ZDLzY2a3kvaFlhVitvelB2dnQvcERVVzRac3k5UW1k?=
 =?utf-8?B?Q0k3LzBiS1haTCtESU44NTZnYmNnVnBpd1BNSkJsSmsxSUtEQ256Q1lRMjU0?=
 =?utf-8?B?NTdOQ25SbXVYaWNYZFJBc0VWMm9RN3RLNnp6bjVjWEI1ckdLaFVDZ01leDdM?=
 =?utf-8?B?b3JDRUsveVdTV1JGTkpvd1ljSk9iUUI0UjZnVERBQXBsU2ZEK0l6QkZzSUUx?=
 =?utf-8?B?ako1TWZrUWZDTktIZEswV1NMQVVGL0RNYVdXWWRlVFVlYStNbkN1aFNZZy9V?=
 =?utf-8?B?R1Ayby8rS2xsR1VrTk50RjV0ZDRHUWFPbXdqRGxkeW8vK2NPcTQ5N3FJODZG?=
 =?utf-8?B?cWhzRlh3L1g4WmhsRHhHYzZCMGE2T0dmcDh2K3BWVUV4Z2ZqZ2ZxTCtibzVG?=
 =?utf-8?B?TitHSVh5VmxnVmc5MWliTzJTdWtIL2dGMnBHbVZocTZEY2d2NnJYRTRWcXNC?=
 =?utf-8?B?K2RWWGM3b0g0K1pRTUhFa1N3UWVZMVVPMEk3NHYyemJqWVlFT2JkK0oydUxF?=
 =?utf-8?B?a0lNMy9CRm1rSGxCRG1Vbm9lN29PdDg4OW5Wc0R3bWhzSU43d0tieXlOZzF2?=
 =?utf-8?B?Y3lMS0hnVTBNQmxHRFZlVHIzU01LUHo5SFVOeFhGZkJqbC85Znk0T0owNGJV?=
 =?utf-8?B?ZEl3eURaVHA3MEsySUVYOHNPMUdRZW1UT3VObmp4NTZKSWwyMUd2Z2V1cDlj?=
 =?utf-8?B?S2RMbEp4eUVLMzhibmNydjZyajNDSFgwOE9ET3NwbHZMVXE3K3lOMXZKRkdi?=
 =?utf-8?B?VDlvaEwvSDlOY3ZvUFluUkR5dW5hZkNtNlovR0NJeUxCSVJaS0FRak1seVg5?=
 =?utf-8?B?VmNOVThWNVNITUtmYlRPSGtEeGp6MnhKNHc3MEZSUTIrcjRYc0ZpaWUxU0o3?=
 =?utf-8?B?OGE0UXBvZUpKeFNxK2pCb29VN1h4ZVN2Y0hUdEY1SkNYbW5qUnE4UVpmUGt4?=
 =?utf-8?B?Ry9jRXp0SS8wSHpDU1JWdWFFVVIwV0U5R3JaL1RLUW5jRUpzaU5mYzczUDRR?=
 =?utf-8?B?RGYxRk9VZTFyMU1ydjdFQk5wOTgremdVWXdNTkpYMDBQZGsrVWN5SG1BU0ly?=
 =?utf-8?B?Z2FEdmpoUDN6MVFQbVdZN0NHSXVOd2VQSjczQ214eUQ1a2tXUWZsWDdKd0ts?=
 =?utf-8?B?aVkzYWhwenNraEJOZG9jczdXZjZUMXVCNUZmWXhJZG9SVzV5aU9zendoUFdy?=
 =?utf-8?B?Y0p3YW5DWlFJK2tmVEdFdnZqVmxxK1Q4SDhNL1g0WjR2b3p3aE5OY1hmVFUz?=
 =?utf-8?B?UW8yaVhmNGJPTWUzVFBhMXFqZXp0QzJIbVlDc1IvcDlYWDJiNkxISnBQN1Ny?=
 =?utf-8?B?Yjg5UjBPL3dPc3Jpa1pnSW5ZNTI1dUZtMjBjWTcwcVJnUzdhY1M1NFdPc1A4?=
 =?utf-8?B?ckkxcm9ZTC9iY1oxdXRnMENqRldCQ0FwWjlQblVIbGs2bElYVlQzWXFhdDVE?=
 =?utf-8?B?VEo1UDA4QUFEZXQ0cjkyOCt1WDRHUE1hVW9aMzFQbDZRMms2Qm0rM2Y1bEJT?=
 =?utf-8?B?NGdYeW9mUXF6Um1qZlpvNlNYOVRNTHNZakVnc3NpZVkxMnNkUFRJQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb081c5-903e-41e5-0152-08de760b69c8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:20:52.5562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAo2fBhkiHOotd5LTpc6ginCLATaLgybhWEKp2JaFEL6HjtrM6CqTs7oLWQ/GgJJDNd56aIpC2ivzDjbJTjoFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6074

On Sun Feb 15, 2026 at 8:22 PM GMT, Andreas Hindborg wrote:
> Add a few convenience functions that makes it easier to work with the
> `impl_flags` module and C APIs.

I am not sure that we want to encourage direct manipulation of the underlyi=
ng
bits. Adding these impls would add a surface of misuse.

Best,
Gary

>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Andreas Hindborg (2):
>       rust: impl_flags: add conversion functions
>       rust: impl_flags: add bitwise operations with the underlying type
>
>  rust/kernel/impl_flags.rs | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> ---
> base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
> change-id: 20260215-impl-flags-additions-0340ffcba5b9
> prerequisite-change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2:v8
> prerequisite-patch-id: 05dfcf648017dee65c356604e4f99959e76ff64d
> prerequisite-change-id: 20260212-impl-flags-inner-c61974b27b18:v1
> prerequisite-patch-id: edebc37750dccd8d19db0b8fbd5f69f9877675a2
>
> Best regards,


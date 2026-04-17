Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010010.outbound.protection.outlook.com [40.93.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D234D915;
	Fri, 17 Apr 2026 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395929; cv=fail; b=dNSsQkHWBId0uxqVUjDYmz10lr8gaUrG6axsUUqxCFpORekFkLa4OWUOSM6Hf1meAMIGYgYGgoG9sEmgjV0siBixQo7XJENXax+XFQEN1fWbLjNQPf5mwWkwCm7z4BpNpcKqN/2/EMT0BQ9BYvsXFY2aFwLfbSn35dyyG0JcRJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395929; c=relaxed/simple;
	bh=QFD+TmpDqdkHKbr2iTa1yeDUSoFkHN3su4eel8vJEwk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=S1Kwf8vnsYHR9sPFCvcCr+0TfOiQZNez4O9RAx//YsHKCG4Gpwfq2qbJ3d944qBYZckpe2gO0sf82oAwWxsLeHCa9ohB+6o9Rpd3UqQtyGtnFz/dILmFmDgbzGRBIagQfWvg87WZTqH5oh4bmVnfW1qXnWPXc3E2gRhs9fVnWf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AUPogo1F; arc=fail smtp.client-ip=40.93.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AUPogo1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd7B+0vVa/ODtVQI9lOuXpIfYkm9BtDBlxianFOVBxDBXo3tSDCLOMmH5uaP4F6PafY5u1v3znqkF2ZmpkrHKlCDmzAN8KIJh58lU0RrRe1dgxgF1qiCyAzW8QCqgUuA653P2s7ssDxfWT0MHMMLtmXpy59647R1lyMI3TZdgwwBowgtIFjs5ZDmOZchjCE29rWsux6pncZBwDDgR8AFjEAzVqrktvY2Ax4EyMBAb2i3z+mvz92UFF+O3Ll+Nya6cK+pngk9UvDSDDTQxzUV/OPPbgu07Xlbdiisywl10DocXTUKPst62jnNi/j54FV1Aodinm0pxn0Utd2jGKBOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epvfI59ZmSD5sG89/dR5C29OhUomoJqjjSbqvuMWLCQ=;
 b=AOOAuSLOrkcbA/dn4t/5F5ZQ+ZhMDvuMejGf9/6Yr48lQd+WkvzjnA+Auvp8mEJgNgz7pWsJ9nw1PbUDI31d0rTeQqQFC6ck7znVASyU0Kg8fWExisYU9h2Pj6kxfvnAa9YmQ4Y6dAxLLbQ22OQEDT+VPADsejSYxXPBDpK+m4+PRyuZiO+cPJsLslpj5eogDTK/ZI1TpiKffcPWPJ1BBWpcoY0WVyHO7k7hG3QFoR7hlETXboxVpdEO25RGeaMtZudFFaOFPZETW3dK+3rOMufm6Wa3YCFfsehnIwVJ67Y/WGyznWT8y10vjRgdqohPOyKZTcYCbo06K4Wz6nRyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epvfI59ZmSD5sG89/dR5C29OhUomoJqjjSbqvuMWLCQ=;
 b=AUPogo1FLZsySSJ1xrgHkuWNkrDiNrvFZ31EpwPHLFAh0m9HupzyBLrPlqwNz3e0P4cpynoyx1q1SCzIu20BQQTZyb1LAVD47FVKEbdaqDO0Std49RGERXJjv5yE7s4IfVt0toVXkMIfEE1bopPTM0GyZrWoIBDLujybadSwzi1EYcbkKLpjLwrA3ms5FST4w/ICel9d1WoFerF/f4aV5Be50tRHzxXFGdkAbAjxsWpCKg+dj+Dr9VAXmDAR6scBOIRBz5qvVERJmhTGHuB+PjJpe2go+Z0b/nyM1La9vDBLqqyEORuJHv+wofYoF/m9kN4WO3xgyEReQYT+GkoZEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8288.namprd12.prod.outlook.com (2603:10b6:208:3fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 03:18:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 03:18:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 12:18:36 +0900
Message-Id: <DHV3SQ191564.3FMK513OJUMKV@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 1/4] rust: sizes: add SZ_4G constant
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alvin Sun" <alvin.sun@linux.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
In-Reply-To: <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1fae91-4e9a-42db-e1db-08de9c3005e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Fhmnq7nBcywO+C0zBHxo0CQqBbCRq/96HZpugr3DaP1ZsNKsnkgPc2cFt16fcP4ou1ChdEdby3+lN39rkV/rqpsboe1tRKnDcMx/AWF3JzGAFslbpnCo9Emlre1Cf99xaivkCr+qcwtHv9InXvsdtqAiW7sOdIgM872zE0bcPZItizV/3+2tokCkdVDVPSj4HL2p4JVHxJhChtcintP/LTlaa1rAgFrHM+18qQkGlwo44qLZ0jun9iU4tA3xNgefjpGQfIDjZ330dqxiRNP6W443br+fu+FE1F3ZE/tYhZb33RK8VYRnYpW9OltR4iPoJ/5IbsJJug6Yb/RY+DZ/eDfbXgLaIHaczAQqfsHRcFr0RVWIPD7CGX+TldO4PzyBVugky93WGPh1wq66t6uPkanK3bCFjek3VKXswVe+yZPO1xbz4YPFIA+y/OTHPkQyjuSf9GQ/KYWKTMBiywvjFdoYgDY1ZN2wPgAJQ6JucllM5djs5hsbCnYwFHJQ/QZ8VFZMIJPH3EIaAG4IdtTmkiadsHAEyKaahVZiwnVQpGGRZvi5wsmTXiOAYiu8vp21Tu/bBgRHIT4mQ2R3mxJ8lKNQvaDPnHx3u0RkXOnJCou0a4btUPttC/s0w4w2EFg+Na8X2f/MkzPqz5ADA1pv+Fg57l1v1LUnHM9gW8IWNRgIwoyvyefnZeOU9vT04JfaeTqxm+9vOCJq3q4Jb0Vqc51wPnto+PAo948U6wcbPdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXc1anRFR0VDTzFDL3BzUHQvVGk0VEVMZWdpRFQwbVpuOHdwQVpISzNmbkZu?=
 =?utf-8?B?TzdYeXR4VUhJNGZ4T2xZZGZXNUh3QnJCK3Z4NEFtVFNjaEZDa1grSWZaNWh5?=
 =?utf-8?B?MVp3NG12VjNSK21ISVNhLzVPZlJDbDB3a3FUYjFmMlcxZ1hxMERSTmlwM296?=
 =?utf-8?B?aGtBOEJicDRlRXd2dEtJTmg2amdRdHVGU3VVa2lFbEhIdUd6emhzeEYrbEQ4?=
 =?utf-8?B?TmY5TWRMbmhHZTNpblRvUnRoc3lxTENqd2JEazJmcmllOGpFcnNDMGZja0Rq?=
 =?utf-8?B?MTNQUnU2ckdCUERFMk01Qjl3cmVRVDUvZkZMNk5tWFBLM2hnVEJqeTRlWGND?=
 =?utf-8?B?YVgxNSt4Ry9iMDJyeWhJSHdaRk8rTW1HUzVoSnMydVp3eWpBN2tYZXUzZmVV?=
 =?utf-8?B?N09SNWlCWjV6engrQ3N0ak1HOUxYQ0YvVzJnQU9lVXAwS2pxalc2dG0xQml3?=
 =?utf-8?B?cFpnTGZWQVdxOUxyZVhQcWZlVzFWYnIvQTNTQUM2Q2RheXR6VzZuYy8weHg3?=
 =?utf-8?B?cW02OElScU1LVCtKd0NKZlNVOTMwcjhYT0UwT2IwY0UzaWxHQ2ZIbDBJSEV6?=
 =?utf-8?B?YWlGcjJ6akh6S1hvcUJ3ak9RRFFpY2FGWWNlUnZ2L3d2Sm1CUXJBdFhOemN3?=
 =?utf-8?B?UTZGaDE1YjVaNFFTQTlCVmIreUZveEpCM0krQjdPWW9qVFBOZUZqbHoreGxw?=
 =?utf-8?B?WEhBdEhiSFZTdUxJTFB0elFhSWVnR0lTNEZuVGM0bEtsaHRvVXZJVHRZbk1h?=
 =?utf-8?B?K3EzdmNSZXRHMEZxRGFSN2drVWJ0NXM4NXRhNGcweEp3NGRkMDN6bklxaGhp?=
 =?utf-8?B?eXdxdHRVTnlTU2kybWdXaUlGREtkd0VMZjRwRGNsTTg0NUlPaFJjVGs0TnU1?=
 =?utf-8?B?T2VaMDdyRUliMm9hamJWVHVrdmUrUW9YWVh5M2lFQjFPYXVpUERyYVpRQm00?=
 =?utf-8?B?NnEwYWdEQzJLOHhTU1U1MWxHWG9tWWJCdkRucWJWQXZHZGx4cFNlNkZtOE5Z?=
 =?utf-8?B?dHJKR3FYUnM5UkJNblB6VjU4TFVwcjBkVXYxaFJDTVFSeHIzRlROVldjWkpP?=
 =?utf-8?B?enZYemQrMjZKanhDVktpeENFSWtpNzBIV0pxZmptZkRJSXg2ZFlhSTBGeFhD?=
 =?utf-8?B?MGZCK3IzVjlHQlBWUTViSlBKRU9tcm82SUdkM25NU2J4ak1SUktTbVQ5dGNN?=
 =?utf-8?B?SXRudWlhVmh6OFdlTXR0eXoxbmQ1b2R4Ry9XZ0VnQVJYS0RuMlBzc05kM3lo?=
 =?utf-8?B?d2xEZWltSzVTSEJOR2h4ZzlhSTgvQ1JLd2toUHYvVmxuUjMzRjdpRjhWNTRp?=
 =?utf-8?B?c1RsNU1XOFlVNCtEbzJKME1pSDhITnFwOHYzUVk2Q2Y3MUtpZHU0alFUdkpB?=
 =?utf-8?B?VXN4Wnl0Z3NtSzkxbGw1VE1xT1lkZHR2SGdFZ210K2VCZHFlblhVY1VSQ1dk?=
 =?utf-8?B?UCtadzUwMU80UnhhbGdLbHJLM3BtdkxzUzVHNmdtUnRXbnpvRFBiZXlRTVdz?=
 =?utf-8?B?OXBiL0VWUTVIVnNMdXF3dzlaYmtiT3F6Z2Y2YTJ4cnI5WUtQTlZFMnl1enJj?=
 =?utf-8?B?SC80ZWtoWThmY09SQ1B6R3NnWFJPeW1POERGM3NpWFp5aDlFbWF5NDZDcVJW?=
 =?utf-8?B?S1dyM3UrYWc1VlVYRnZhYU9TQjNnb0tCR0c0NjVBVFdveU16Y0k1VDJYaDhB?=
 =?utf-8?B?SGEwK3FjV3pFLzA0OHVaeTJXeENEWjFwYTVSMXFhT082ZVBJNENSaDJWZ2Qw?=
 =?utf-8?B?Nkd2MXJkZExrc0l1bkFad3RjY0xsZjg5bktTQklYTmNlSkdyWE51WDhXUzhM?=
 =?utf-8?B?cERIOC82T3BlZURLc0xLLzB0NWR5WThhUW9aaHVmM1N3TndaU2huR2wrbHJC?=
 =?utf-8?B?YnFaaldodGcxRFI0NW91eUwvZHhNMTZqR3h3czdJYkxReFlSZXFVZGdqR1k3?=
 =?utf-8?B?YjJwTmRKTkdHWDJrazkwUG1tSFhzM3FqcXIvZEErbnExanBHSko3dzRndGVK?=
 =?utf-8?B?TWl4dEMrYXA1dnVINytpTDRjM1dkY1hCVHlQNG1IVUcyTG5lMFNWVkE2cVFJ?=
 =?utf-8?B?SDBrVVh1d3ArOXF4cEdyZlFvMXo0RFB4S0E4VEs2azlicTRjS2w1ZGNHSTBh?=
 =?utf-8?B?RGFSRkVhUU82b2lib1NMem5URS9KQ2xIaHEyRDNWQmRlc0poLzNtMmlDVVBk?=
 =?utf-8?B?bVR2K29aVFNndFhveXJ3YW9GUkFuQkJZTHRkbHB3REhYVUp2eENHaXVMbGJS?=
 =?utf-8?B?KzNqdjRJMy9kYTJVaE1QZHlEbnI0Y1FqQldtdWhmd1hhTGs5VlFic3VZR0x2?=
 =?utf-8?B?VlZCVnM5Wlg4S3Q5QlVMRWVocFNpRERxQXlkNXZacVhUUkpIUlFwOWdoMzgv?=
 =?utf-8?Q?HTbc88CKNRzESDtle5vIgIDi9RMyG8SIEKGvYgW7pKqZu?=
X-MS-Exchange-AntiSpam-MessageData-1: j8Y62cM06fx+vA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1fae91-4e9a-42db-e1db-08de9c3005e6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:18:40.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCl1B4pydOHo9ggS/IOTrqtURgC5gbKEwn+4n2yVktMDLIfv1nyA3GlfyqMX7sM/oUiW9l/vhloxEOwHpd8g6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8288

Hi Alvin,

On Fri Apr 17, 2026 at 10:05 AM JST, Alvin Sun wrote:
> Add SZ_4G constant defined as SZ_2G * 2. This constant will be used by
> the Tyr driver for calculating user and kernel VA layout.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  rust/kernel/sizes.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
> index 661e680d93306..872f5bb181ecf 100644
> --- a/rust/kernel/sizes.rs
> +++ b/rust/kernel/sizes.rs
> @@ -48,3 +48,5 @@
>  pub const SZ_1G: usize =3D bindings::SZ_1G as usize;
>  /// 0x80000000
>  pub const SZ_2G: usize =3D bindings::SZ_2G as usize;
> +/// 0x100000000
> +pub const SZ_4G: usize =3D SZ_2G * 2;

Note that the way size constants are defined has changed in `master` -
you will probably want to update this patch accordingly.

Also there is a `SZ_4G` define in `include/linux/sizes.h`; I am not sure
why it is not in the bindings, but we should probably add it and get our
value from that.

Finally, maybe I missed something but the new value doesn't appear to be
used by this series?

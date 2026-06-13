Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E2247DE1;
	Sat, 13 Jun 2026 05:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781329418; cv=fail; b=gB3vT7NFDqtHMsCkM3aQ0iKECj1gNYS73dYECWy0rll0YFs+u+/cPkEBSQGTFcFu7+Rc9TUF0SY4SVPP2PIoBVEq7d0/z2LIxptBkWOc7N+qL3Sgo8ThJP8P6zuIT/jb4soEZ8HmtH/WVg5KaKEbCX1YSe5/SRn58MDB8jSHUhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781329418; c=relaxed/simple;
	bh=BaSbL8/80fBASkzq3Q9yxvCKuIEPSr0cXHeKRbSwtg8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HlIdr6vgEynUyln61v5zfom2vMjRR2g19sMgkEJbMcQU0PLNdRWfoQrhej46aFga8Ec/Sz8VU3/bLneyZhxdNuL3KdNs0MOcIrPK7p30XzbimJqjtUreqkFBnHe0v1CgCy60QTItYIS3Y9ufp9Sj3J9aY1LEpExyJjSjilZYlAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kiqu1J4r; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kiqu1J4r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uz8ysYXTRQhMpaVtKPgfVdPXJAmshPhkrhatej3gaBaXDtNkrOwq7ofaJBHj3ffwEeebQbWGcXFbIbOoUyTEaDTxuGvVfyyeVFYIdchBBjxql7Z90qLOkgRxX+OGjmqpMaXjsP2YQvZzyUxMeahsZzkV7mr7Z/h1qBB9kS0yj4d+pCZYjK4Guq7As+Yt0ykSy+ZZiXjpMjtcw9Qa6zRKpkBxcgrdoUe1gu4ECk45uhEUMTJpl/ZohoK8Nldr6V/8oTWU+cejKeey2Uu6EEP20CwTnde+pkm4Qd6G4ML0vagMf38ghNTYKlILJ31I+49TYOBUvvu1AS/dqbBp4pZHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaSbL8/80fBASkzq3Q9yxvCKuIEPSr0cXHeKRbSwtg8=;
 b=Fv6VZ/d19m1yWn/jnOMFjTW7GlfwHVrjNvpEdoKakvjLXfh2muRjUfsIqVJzL9Kl96DjC1aSdWbAC58krZnEF3lJSBdik9iFV4mTEx421WYsRzZG6NfkvQW+IOysMSf3Tz+rEYhDyXQhEkyqjKHXXhLAZUH51MpnKhd/uk8QCufpR/ZBFwQfp9AUGonrb8qkUEdnUHKbIXW7nBoaFOXjMoa9nQ6RO1Gdy2UNj4DJTIcO6U+mn8VtY3u6Ul8mkAeO/g9nvKMTkqkU1laU5CcbnXixky3XQEEq1244cUhAvIcsc67LjH+u582z8ya4Z/U5iy9wBI50AXNw2LQx1VfmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaSbL8/80fBASkzq3Q9yxvCKuIEPSr0cXHeKRbSwtg8=;
 b=Kiqu1J4rv6C5db0umMNE5wG2XhweVPnb4Yc4wb8JN/BpoBKHVjPk8sxFoMgme4w6vkpPvPUOxn4YOeW8T6XJs9lOsACvr7qzuQNHdWDUrRQCaHgFKKoSg//t/ClG3g6Ibn85laCL+da/AIftNeQogP9Nb4MGZRxmdhl5I+ufrj6Ra/aU8GdAmYPjbL0fWQJO6JFyOenso7Qr6FLX5hZLvB3/C0AaxtC8jx8WoiNCOJGDWWhR1i2dlV/4d879WVRIr1CBUCggHDE8yWv+AVLnAQkk5q6UI5ElLkX1vneFV8wa7otAzyQg7nW2Buz3AGpG846QgjM6p1qpyOOGgHCW5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 05:43:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 05:43:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Jun 2026 14:43:27 +0900
Message-Id: <DJ7OKONXCQPN.1N5F9PJSNNGIR@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Yury Norov" <yury.norov@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: bitfield: mark `Debug` impl as `#[inline]`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
References: <20260611190555.2298991-1-gary@kernel.org>
 <DJ6SM9BJ7GHN.JX9HXO3ZMBPM@nvidia.com>
In-Reply-To: <DJ6SM9BJ7GHN.JX9HXO3ZMBPM@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:378::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f879277-7f44-4880-ed4d-08dec90eb392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|10070799003|366016|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HKC36iD3RLkHfSJNAEWnU0iwd22ObiKC4mhheo0OXotuagdIGN2hz0PECUfwygeua6C2mJF07X13aIhhBVktts51wxFg9ipZgSiYGu0Y6lEnGTy9JQr6DC4ZAafuZ7zgY3Nc8BkEwCm99fF7EqDmvZ/Ccs1a2pwx1WEEdcQBCUaZ4QzK4NFedXX9ZuHsQFxVgU5ApEnJU2lYyZNf3LIujZs5K3muE4R5ZK0wye02nIuI1G2502e7aSWnlLUAXqLlbtZRq1Uc7zSOntZF/96z8xE8YCBrPhzj8H4XYRvOB4WYqfq7fYcwrtIsTIdePS/5s4mhZsixRzlYRajgm13jgeYA15ceyh3S4umiTzKXUzAGWIRgzW2aANDuJEL7gOdWknPaYwila0kn+mGBr6E62QPbvGp2mICnjqKEsHT5vGLEDTPzmNz25MsAiK6RxBZncNfF1hMfWVRJoZo1faFAZMxxisegHV835a89rd5BM35Ei6rqkQqU9bGEW2vvXWQTV0PWNUp2DAtnq6xxdwxt94w+Qi8slkrkNq8iVCLf1aXsiXNmecUV0AGld/pam3PsU+U2EwVgR0pWIvZcjurMwVjuzbmlFoAm6/76ApSpPbwIpYXwUo2y3z2H6VFpWyOZR4+lRBCA7VXNXOqrsKHqYVWbbh2EAJAuO6J+10FgKdng9aNcbPpwn345XIV62ntJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(10070799003)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1ZRaWc2cG12eU1pTm5xc1dwV081UFdIdlhjQjAwaDdGQlNNeU14dGl4dG1F?=
 =?utf-8?B?VHRRNUhoTU1NNDJUVTBaTTlBSW5pdEtGOGNmQ0lFLzlGV2V3NmNyblVwZktC?=
 =?utf-8?B?SyszYVpFZmR4Uno5ZkR0V3FHZVBVODVMU2xHekZHd2FOQSt6MVZUS0tGaXp1?=
 =?utf-8?B?SW9lank4ZW1FcjBHVExvSnE3eVZUVlNpd1V3NTVNaUpxSHl3NTBIMnhxV1pO?=
 =?utf-8?B?SUN4NExQVjdoZWJrTlFCNHpoMmJWYXo5cFdaUmx3U0NwcjVqdHlTaW1ibVdr?=
 =?utf-8?B?a2VXdXpvcFF6d3N6VUk1cjVqZGV5REpKcHlMMGRDdmtnU1RxNUx5Q2NDd3NS?=
 =?utf-8?B?QVR3V0g1UnhqOXRxZXdremNYclA2b1FSVXp4d1N4RzB4cTJ0TnY4MHNSR3NG?=
 =?utf-8?B?RnoycVRIVnZPYTNuWXdxTFlkRzRydTZNdy9TeUNzMmxCOUNBb3d2TmhaaTFQ?=
 =?utf-8?B?ak85M2pxRWtkL2o0WWsyNThEbVYzZWEvemIvSHBreW45RWJ3VUhucmpXMXlK?=
 =?utf-8?B?cGlxUkVCbE5YUVBIMVJWYkU5SXlYR3hyMXRSNm13QUsxY0p2N2ROa0xRZ2xX?=
 =?utf-8?B?TWtTa2NmTng5MFcvbEJqTVRCRitVNFl0QTNqd1RxQXZ1TEFmaHlYNWFOcFlX?=
 =?utf-8?B?cEEvRW44bExmQ2FJblRhU25ST0RpRzA0UzZyMTZrNDNHWk0vMTRkbEdTMlFw?=
 =?utf-8?B?Mi9BZzJYTGh0NnYxWUlSdWFCU2w3VG1ZaFZNbkdmTTgvYjFSWHNOV3huQnpN?=
 =?utf-8?B?U254S1YzbmZrdldxNldHMEtteFBNa1o3V1J3cVN2NWFUZU1NZmE0Z0dMeldX?=
 =?utf-8?B?UFc3TU9ta2tVZjM2d2FmSEZ1SVdJMndsdjFYZlRTUkhBdXBnMjdYa0hzUGRq?=
 =?utf-8?B?TmIvZFUyOU9QaUxEcWxiSlNlMlBDT0NuQjZlSTJzOEtQNEd0NEZDTG9UaEpY?=
 =?utf-8?B?NHhadGxFKzVjVWZvYVlUcmJicWNFSHZ4b1YvVmtTSG83aFdYd2dNRFpjOTI4?=
 =?utf-8?B?V2E1MU5xYlJkNUdodDBvVlhmWnZCSW90UEpLK0pETEQ4QTgweGhwNEhVZDhY?=
 =?utf-8?B?a2V6UXVYK28rR2ZOYWJBdjhKNWVRTGh3UFRRT01hblNEZ2Q5TWx6RGJmandW?=
 =?utf-8?B?TlBKMFJ1dEFkNTNiQlJCNmVON2ZrWTNJck1QNGhUQzdmZk94RktTNmg5d2JH?=
 =?utf-8?B?eFVVTk5PQy81RFJMWWtUSXFYcUxob1hHSFQ5UmwrMFBZQVJ4OUpPYmFyNW1l?=
 =?utf-8?B?OUp1Qlo2N0N0OGNyTWpCQlc4K3pGOEFtenNac2syN2c1Z2cvVHhuYnpDRmhT?=
 =?utf-8?B?T2g2bXdSUlZmMUgwOStvOEcyZWpYaXlDNWZPN1QzMjU4RUdsbFI4ZUZXWmtF?=
 =?utf-8?B?bHRLZ254QW5NcnFkQ0JncnB1c2JGTW5sYmRoOGhRYjZPWEdjRjV1aE1mdjRL?=
 =?utf-8?B?aGsvZEVzaDd4SFMyMGUvYzV6ZjVjeThOME1oK013bU5aanY0ZmxWdkZyQ3BG?=
 =?utf-8?B?akUwZDY1cm9ucXh4aThEWWsvUXA1Vk5WWUZLWU5mTE1NQW1uakpZODA5cmIw?=
 =?utf-8?B?dkNYblFvK3BHSjZSZ2xHbXhVSzlqeHdPaGo3d1pmVzJJQlVOT1NTMU9hQ3Qz?=
 =?utf-8?B?Q0ZuY1QyMG1QNENWNG9hSWRRc213MG9ZRHNRSlFncU93dXFKN1lZcEdVNEt0?=
 =?utf-8?B?cGVlRWdlY2x3ZDZrck9wa3ZKY1pvbWlwc0trblBibWFqSnZONW1yWk93a3NZ?=
 =?utf-8?B?QXNiUzVQNXRvcXowQU5jSHpuandsQ2wxc2E5bzJQQmtTOWhSaTBmSHRwOXBH?=
 =?utf-8?B?L3JPZWx6cHVWcEFqV0RTU0R3T3I0ekpsUHBGZDJXU2Q1UE41N0Nxb2Q5d1k5?=
 =?utf-8?B?anhUNVIwSENJckoreWpTVENDdWVKSzJlenMwMGd5N3o1KzhaMnk4WERRRk9X?=
 =?utf-8?B?c0p2dTZoeEFpOEZLQ1RuOXZaWHFldmphcjk1Q2MyRENuZ1hHWTROVlNaY1lG?=
 =?utf-8?B?RjhycnkvWEwzV1RYMWJlaWVkdmQ0MUNPa0lJeGlvMHNFTGZCOVhPeTNlSDVq?=
 =?utf-8?B?eXZSb1VIb0taRkVRVlFqb0JFRXh1WUhtOUZxbW1WYTA4VXNLclN3VGw1L2or?=
 =?utf-8?B?Tys1SWZ2d2VOeFZ4YmtqZ3Q3ZnpacGVIMTNlbWJ4aGlwMHBUczAySFNpTzlH?=
 =?utf-8?B?MDZqOENxWXNUb0R4d3FqeEJ3enoyUVdzRlY0Yk02QTR6Z2FNUnNBcjRSNWln?=
 =?utf-8?B?VWJzdjdYc1BwRDNvYWVrb1pyd1NtS3o1WFBuNnZaankvNnJYM3JJZVhtMHF1?=
 =?utf-8?B?QU5BUU1FQWlXUlNSRTlzRlNVcWdtQUNQOExyWmRvUjZORmdWeXAyM003aHFY?=
 =?utf-8?Q?hG9Zl5WcHJeRLLAA8prh2XAOVioDZrAGIzdAlkIy67R5m?=
X-MS-Exchange-AntiSpam-MessageData-1: Ojesp9/B1892IA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f879277-7f44-4880-ed4d-08dec90eb392
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 05:43:31.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1IIvICEnqI85qoEOLTx/SIvrptWaBWgal3iWnEOgKjRdgm0RY5YXlSjX3XHGgxDCJaotaDYpIp1zpu05lYyig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190

On Fri Jun 12, 2026 at 1:40 PM JST, Alexandre Courbot wrote:
> On Fri Jun 12, 2026 at 4:05 AM JST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> A `Debug` impl is for debugging and is normally not used, and therefore
>> should ideally not be code-generated unless used. However, Rust has no w=
ay
>> of knowing if a dependent crate is going to use the trait impl or not, s=
o
>> unless it is marked as `#[inline]`, it will be code-generated in the
>> defining crate (as it is not generic).
>>
>> Mark the impl generated by bitfield macro `#[inline]`, so they do not st=
ay
>> in the binary unless used.
>>
>> This reduces nova-core.o .text by 17% (from 151922 bytes to 125676 bytes=
).
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Ouch, well-spotted. Thanks for this.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Btw, should this be

Fixes: b7b8b4ccdad4 ("rust: extract `bitfield!` macro from `register!`")

?

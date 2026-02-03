Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020124.outbound.protection.outlook.com [52.101.196.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206B349B1F;
	Tue,  3 Feb 2026 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770123705; cv=fail; b=e/8cKyRb54NRFuNmt8S7PjG7Nrtm4q2zp1pK6QTcOILdT7TBZQQ6UG1f2FO2OPLhhrOaZmBNE5CYetK6gUS61jPqBmzZ+UkJZdRkf7PCHVwu2EPyQAg4N4ccfByvemiMPJ0SETAVBTCK3NTQh7tTOdRln3oWtNkXPfiUAVpcelE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770123705; c=relaxed/simple;
	bh=xjHFjhvbx3Jc9Yz4GSfPet85CsIiU6ahU6qu4euvpa4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=brMSFRdAh4FoNKTNFvJK1fHskDu7X4dn3JQqlvaEueavmaLuUct5g6qvVaGXkAuqZjD6vq6P9seY3R4qAzGn8XyGio3NaOMeYQK6runC56ZDm4TEdpPcroWU6JjxAvwW/EGMAiiQfH7l9Qfi4LTQEOdDjeQvBZhGmNFsfCl0Ks4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OOETyNM5; arc=fail smtp.client-ip=52.101.196.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OOETyNM5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew0ksxK/TKD1MSme3bzRaXRzTARl0b56QsUsHIJisjgZneOuMuXQc/nVJQDzUz5FYoECk2XQhVCKxzIlM3DhXcyyYEmxt3xwIuCv+39rZfsMJzTnpPaY+ivlMnLDpApSsvjwY4IO3QQumWZCFM/OeFzESsavMINT6dT8btbVVU7oki0fsqPgzucu10zIE1c4veuq5GxmjsKXp4tEUoZJ80Np6IKGZlq75giRGYFHM6eZbt+xpiR6Azq2PB6L71oOfksXJhJNxfJOLDqP48Z4fIudkfkFmgqBpC0OA8j8/dofL0tgtcER3vp3qEY0l/pFaTGGJ1a2qj4UOH/JC55Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ilLSDiy1byaO8F+RqWk91C3ebkGKsSVYlC7ZLudlak=;
 b=vgeV8cE6o5SBipOKKNpwycxpwwZJrh0drkNk8Qn6/c5tUNCxor+8eEMnuyqzYnwnPkG+KB/SMFOIWZyGKOVLvd+feG5T2bP6m0He2fswG8KK4G2nNdnyfNq9mmnHDAlS+LHO1u0a7u39WVZnydFg34DE4SZBWx/cWjAOhGEWFdFwRthwoSnGRMlYeVGaUj+vb2xisZ/yZZclr+ADqtFLB8SmPSgXynaYiNavbaCZJctpdSu4K5F2F6XwWgthXbwp32bOc8F/sruqFnz+lg36Difm4jLpFS8qWiy+9fgQKrqFr21SCWRc/AjntYdrRLUJ2McjDQuTzuslRtFvDNwpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ilLSDiy1byaO8F+RqWk91C3ebkGKsSVYlC7ZLudlak=;
 b=OOETyNM5Q6wDFBfIhrXr2C/cZa+efjqmcJbLkO3x3MklrLA5yOPidAV+ApMWZZ6EH6b/OhhzFEDyVCZPQDrGqURoH7pDzPQY2FSCwmHKiRps1NnwZrtKnu9bfoEylpNm/m4EObdwkhsKQrmp1+t7R5BHxLCYEaTaxPTjCzjs64w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 13:01:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 13:01:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 13:01:38 +0000
Message-Id: <DG5CHD1A9UGQ.2V2A67G7Z6GF4@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: <jongan.kim@lge.com>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <arve@android.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
 <brauner@kernel.org>, <cmllamas@google.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <tamird@gmail.com>, <tkjos@android.com>,
 <tmgross@umich.edu>, <viresh.kumar@linaro.org>, <vitaly.wool@konsulko.se>,
 <yury.norov@gmail.com>, <lossin@kernel.org>, <ojeda@kernel.org>
Cc: <heesu0025.kim@lge.com>, <ht.hong@lge.com>, <jungsu.hwang@lge.com>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <sanghun.lee@lge.com>,
 <seulgi.lee@lge.com>, <sunghoon.kim@lge.com>
Subject: Re: [PATCH v3 2/3] rust: pid: add Pid abstraction and init_ns
 helper
X-Mailer: aerc 0.21.0
References: <20260203065928.4736-1-jongan.kim@lge.com>
 <20260203065928.4736-3-jongan.kim@lge.com>
In-Reply-To: <20260203065928.4736-3-jongan.kim@lge.com>
X-ClientProxiedBy: LO4P123CA0686.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 2995adc4-c97d-455d-ebb6-08de63245ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0xLdkRRRjgyZEt1RldwRDNrVmF2bTVUL2xRenU0bEFFdEd5Znkyanp6RWZB?=
 =?utf-8?B?YWhkSXdHejJwRFFVbUJZV1lyWkZsd1V3T1JmUmZzRE5Vem82SGNGVTFnbXJZ?=
 =?utf-8?B?bWRkWjNNai9TekVNMTRIZ2I0MVR4NHYwTWllbVRvaXJGYzFjUUIvazRUTjNL?=
 =?utf-8?B?T3lNcjlMN0lDR0FjMGtaWmtYdFpkOVFyVFFxTm5aeGRjMk9TRHZ5NDI0QVVN?=
 =?utf-8?B?aUdFQ2FzTWpQbVFvVE92SGJVVXhmWjlqTGkvOERFTWJJcS9wbmxweDYzdU9x?=
 =?utf-8?B?RldNTDFWYlRVcWVERThFbGJQT1IyZHJtZk5NbmpHMGU2a1FnMzFsZXZ2c2k0?=
 =?utf-8?B?S3lZQ3Z4RDd3MTUyT2ZtdjRpVVc0MHhNUlZQMzJYM3hVajE1ZFVTTHhlbHow?=
 =?utf-8?B?WEIvanFLVUNjVzlnVWt1amNuSXZLcUpGQWFvYnR0UkdyaW1ZNWtuNzJPRFls?=
 =?utf-8?B?RnBZblNGSUZIcXF0Ris1ak5oeitLYzRTdm93SEExRUc1Y1JYREd3d0lCZEEw?=
 =?utf-8?B?d3IvdDdiWXNmSzNhZ0hOMXJIVCtIdmx3SGQxZEZXc3B5d1dnSXNJVnJZZjNq?=
 =?utf-8?B?MWpnUTZOMG9acmppZEVZVDlTcWErSmlKSDFOdU9EQ0d0Y1QrS1lUU0hlZUY5?=
 =?utf-8?B?Y2ltbkJva1FGMXVOVjcvbW1hOG0vK2kwRkh1dW1VaGwrc1MrRTgyaHloYkQz?=
 =?utf-8?B?UTRNdzFEbXIxaWpTMmZ2dWxOaFplUzl2SEFBeFFVcXkyRDFTcFpJQVJ0SEl5?=
 =?utf-8?B?MDlCeEt1UWlNZkVaUjVmSDh5c2N6OVhtK2dPTnZzOWpKNTgrZHByUFVTeXkr?=
 =?utf-8?B?TSszZ2I2K0RjNmM1cFNIdzdpdm9WWDhncjk1bDRhSllsNVgyWXM1Mjg1MWFl?=
 =?utf-8?B?dTl3cmM4czkyNmZibTcvM1VvYjN5azlsOHBZZzZJUitiOUdNdWJzUVRDenZH?=
 =?utf-8?B?eWVqZ2w3K1VLeE16SUtRVGxRNGo3cGxtSTZBS2hDTnlWc0hOWjJwZUR1ZHc3?=
 =?utf-8?B?S0VBM1ZKY2k1TG9rYjFkcGMvUzdnbTQxREk5QTczM3lTSXFOdlY0TFdnYXQx?=
 =?utf-8?B?YTYyc0ZSd3lualp5anJ0NXowOGJobSsvRTlRaGVLSFNXNDVlS3FHMzNnTmZw?=
 =?utf-8?B?OGhZdFpDdzJ4L2JjcWNxK0cxMjZQS3piZUNBRVVIT3BCcTZDT01JWWh6SWh4?=
 =?utf-8?B?UmRnWFNUUkFBR2hVa0JESlUwMnZXS3loSnVYME1ITFc1UllLWlJtTEg1NnBi?=
 =?utf-8?B?UVVKbmNDYThueFRvalhReXlYblA5UTJnRmNUbzAzSGdyanNsVElHaVNQZlZC?=
 =?utf-8?B?djY4QktQTHhtaitSeFNRR1llV2grQ0VzOTJrOEF6NHNCQU9NNUFYQlBMUEx1?=
 =?utf-8?B?WUY5ZTRqUXE0RVprWHVxZDQxRWZiWE0rb2c5NUdQeDlXWC95aU1xMVo5bHFt?=
 =?utf-8?B?NUNsVjk2UklMRUhabjRpRlJaR0FRVVhZb0FVRmhvcTVGamNremMzNzZMTjA2?=
 =?utf-8?B?bGxyN1dvQ2ZmRzFvODdHM2NQcGdBbkpMdDUxeHZMOEhSVzdLeE9UVnVFbE9o?=
 =?utf-8?B?MTlIYk50QWFUSXl2Vjl3bWZGVjhDNGpBUnZwS0RSeDVRQUdRS3RTM3Q1MStT?=
 =?utf-8?B?azYrcHlYQzBIVXFNekViTmUwQnlkRjFRb0lTSmVFWlY1SXZVaXhjN3lHcWh3?=
 =?utf-8?B?NUtMODZucE45VlZpWkthU3prdzhmUTd5WGpVSXJJdVFrdEtrSS95bTBCSXNj?=
 =?utf-8?B?d0NoU3hkUlovUE5TSlJMUDFFSVVqSGdnL1RNM1Q4RThPd211QVAzdE9yaE5Y?=
 =?utf-8?B?a2hCV05udG54TGpjbEpCelZwTVJnblJrOU1oaVdYbTAzRHlURHAraFNjN3lj?=
 =?utf-8?B?bFllVGdmSFRJMnJKaW5yUFdaM2pyTUJ2aTFia3BVZDFRcHA0ckcwQm55cW9B?=
 =?utf-8?B?bFN6UldJcm9zWHZRRXNOSW55RGlPNEJYUmkyU01KZG5memswUStxUUtKYnRK?=
 =?utf-8?B?MFNaSUZpOUxuVkc5S29TYkh5MWkxWllieUl1OGlYWERsamFEdHV5WUVJbC9E?=
 =?utf-8?B?aHBFempaVFBWcDBvcCtkVGE0c1E5dGtlYU43c2Q3NU5SOFo4RjNrZVNOQUN4?=
 =?utf-8?B?VXZNWmpvK3Q4TndvdXF1NUlhdFlSSDRidlZiZ1FoaUpDcVBHTml0U2J1MGlT?=
 =?utf-8?B?a2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTBWaVhCTU5ocG9xYjdrd2ZmcWgwUG0vRzdOMkFOU2tuUHVod3NWNFo2RExJ?=
 =?utf-8?B?UTV4amFUN1dDSjZRUmprcWlmbjlpMXpKM0RpY2ZRcUhQOXlEa2NneHAzSk9Y?=
 =?utf-8?B?VkNQQ25WOXZVelhaZ3Y1VE5MdHZXZ2VNVXA4WTVjcXRzVStQU2YrZzd4T2lR?=
 =?utf-8?B?aGRVY1dNMkhKNDJreHBtMzFmV2lVSzhXWitGNEllMEkxUmxEYzd1UVZuOXZ4?=
 =?utf-8?B?YXgzYVVkaXY4VFA0dndRT2NONU5ETlJrM3VLSG05U1JSc1B4cXJaaWRsVmls?=
 =?utf-8?B?bktkVERsUWVwSlFDM2craCtybWZuNFRpUzhtdXV6a21qVHZLZ1p0eGNJVVE3?=
 =?utf-8?B?VGlqdzlRSkVUZTkwK05oN3crQ2FJR3djbEdtSUI0cnZpUVVQZ0JMQXg4U1RO?=
 =?utf-8?B?VWwrMTVCRzJNQ09adXJqQS9RK3NnK1VZWWFBclRBQ2xmaWh2MWJHZTJpMDBR?=
 =?utf-8?B?VXE4UW4zd2I4ZnlmT0NMbVl1SlhWMDlraFVTYVJhT1lBeDAwMXFqMjJEZng4?=
 =?utf-8?B?ODVmeTQxVGsyQURnaEtob0lDSUpVMm1rSW8xaXFUanNxekNDeHJseFZWMmQv?=
 =?utf-8?B?ZzlhdWUxeHoyQlYrMU4ydzhoUnFSaEkxcGRLNklZSE5IVXNWdko0QXZySDhJ?=
 =?utf-8?B?U1NZc21QWW9BaGdYbGZTaG5VbGpPNTNMKzFoUXlqRGRVSUtxbDltWGNSa05w?=
 =?utf-8?B?WG4yRlpXMHI5SUVzMVhsZHpWUHFmQ1R6MVVNU1ptdndKUWtHODArdlNzazBn?=
 =?utf-8?B?VC8xNHV4eVhYWld3eGJVYXVxUUxBWlpSZ0xqTVVMb0Z1NExNbjB6MU5LTWdq?=
 =?utf-8?B?aGhPSTVId3QxaE5BWEp2ai9rTDZDQ0VSaW82Vm53d0ViRUtMUk9xaC9OLzVk?=
 =?utf-8?B?bDk0K242cjZOZ2l1Vm5wSThuZGgvdUdQeG9BQUs5aFdUUEpRb0phck9RRTNz?=
 =?utf-8?B?ejE1QUk5TWVTMGp4YWZYeGU3MlpDVDVFWVMzdXkvcllSTVlHc2V2YkR1amtH?=
 =?utf-8?B?WThTSWx4UkJOejUrQ1YvYzhlYkZlaENTVEFKblRkd0lQSU50M3Y3UUtUSkZT?=
 =?utf-8?B?bGFob3B1ZEpFemhvS25mTEdXM1Y0TUtMVjVjUjkxYmJuR2M1VFJ2ZDlTcGp5?=
 =?utf-8?B?dUdvRkdrVllxRkdmMUNYUXN6UExPUGFKdm14ZFhjTmk4TE82Z0IyQVdpL1BM?=
 =?utf-8?B?WlJYME4wa2NHTzF5eEdPeWczQ2lMMklWRGE2YlA3TWVqR3hTVk4wODd4YVBp?=
 =?utf-8?B?bFNBbURVZXpPSFpYVUN0MXE5cWZJaHp4cE9KUWpTN0RHV0NFdlhpcWJkUTht?=
 =?utf-8?B?VDM1RzhtT3d6NURoaGN0N25SWHFRcTZuYWpMSy9nVGE2MXBvWGhhZHE5SzE3?=
 =?utf-8?B?YmNjZ2tQRzdpOFptNzZ4TzdIQW5oNzNEV1R6a1lGTTVqTHhvb2huVWQvd1h2?=
 =?utf-8?B?TFdnUDZvdGludytZNHY1WWZWbHdRTWdLYWMrNGljUHY5d0Q3dHJUdUQ5TDRq?=
 =?utf-8?B?Qk0xakVIb0Jzb2t6Qkk2ZWhuWlRqS0F5K3ZHUlRRTHdPVERudThPVlJUUmt1?=
 =?utf-8?B?TlBLU0lpUVJHL3Blc2VBcDBha0dsQzdYVGtaS3hrY1U1SWYyQ2JwRzJoSTNq?=
 =?utf-8?B?ZzVQemF0cCtDSE5WYkFBTU40V09jSEdlUGRsbTZRYXhJTkhnSG5mamZucmVU?=
 =?utf-8?B?QUhmRnJnZzJ6NFJmNnBNLzNLVVpQeHBhZ3ovWEcrUFpFdFVRVFFYaGV4K2ll?=
 =?utf-8?B?bVF0dzJTbHpXRmZUOWFzOGFlOGNCSUhPbXNrcTI3b1VVWklFQlNZTFFrSVNG?=
 =?utf-8?B?bGhCVDBZaEU4Z0MzSWJQZFJ3a2xtWlAwTncwM2RBUk1vbThVTG4rQ01HVUVp?=
 =?utf-8?B?cTBjcmNvV2VvaFlCVFBlZTVQVGhyQW9oL1BSSzB3SFg3UERpNjViM3J3V3pR?=
 =?utf-8?B?VkxpbmJ4YWlnVkcrNnpvNVMrcWY3aGh3RGNXTkRLQldPdG1pSUZuRmgrMDIv?=
 =?utf-8?B?dXk0Y1VlWmd1Y2dXaXZFdlVBdFA2UFF2cTZjV2s2ZzJNc2dLWWZWb1RaVmN2?=
 =?utf-8?B?dHNDZE5FVUtNdXl0bk40cmVwWFRSTzc4dllJblc2K2xMNWJEY09ZNXBmaTQr?=
 =?utf-8?B?MlBrMEUzMzJBYktaeFJEYXoybkdMVm4zNVc2OTdMV2o0bGlvY3l6WTNLRGQ1?=
 =?utf-8?B?WFM1UzBLem90VEZ3czlwc2lTMXBLdTU1a1lnc0xPcjlFKzd4dEplNTY0Sk9m?=
 =?utf-8?B?U1dOVmFIQ1RGejRHYUNBZWRuSzNHdHl0ayt1Zmgxb3Y0OGh3UEh0eXF3THkv?=
 =?utf-8?B?UW45ZlBUTmVJcEJOMFErSnhZZ1ZGSGd6QjFDTEgwZW9vQVBQaVZuQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2995adc4-c97d-455d-ebb6-08de63245ec6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 13:01:39.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiqOXuk0J76xg21XP6CqAQUJDcYGTvxcaDaPEqnk39+BXp7DzmzNwiOqXlCXqBvoA0Pb5anZ231angmK7wdNbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7423

On Tue Feb 3, 2026 at 6:59 AM GMT, jongan.kim wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
>
> Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
> kernel's struct pid and provides safe Rust interfaces for:
> - find_vpid: Find a pid by number under RCU protection
> - pid_task: Get the task associated with a pid under RCU protection
>
> Also add init_ns() associated function to PidNamespace to get
> a reference to the init PID namespace.
>
> These abstractions use lifetime-bounded references tied to RCU guards
> to ensure memory safety when accessing RCU-protected data structures.
>
> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
> ---
> v2 -> v3:
> - Add Send/Sync traits for Pid
> - Add AlwaysRefCounted for Pid with rust_helper_get_pid
> - Add from_raw() constructor to Pid and Task
> - Rename find_vpid_with_guard -> find_vpid
> - Rename pid_task_with_guard -> pid_task=20
> - Convert init_pid_ns() to PidNamespace::init_ns()
> - Add PartialEq/Eq for PidNamespace (Alice)
> - Add rust/helpers/pid.c for get_pid() wrapper
>
>  rust/helpers/helpers.c       |   1 +
>  rust/helpers/pid.c           |   9 +++
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/pid.rs           | 138 +++++++++++++++++++++++++++++++++++
>  rust/kernel/pid_namespace.rs |  17 +++++
>  rust/kernel/task.rs          |  13 ++++
>  6 files changed, 179 insertions(+)
>  create mode 100644 rust/helpers/pid.c
>  create mode 100644 rust/kernel/pid.rs
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c..3138b88df24f 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -38,6 +38,7 @@
>  #include "of.c"
>  #include "page.c"
>  #include "pci.c"
> +#include "pid.c"
>  #include "pid_namespace.c"
>  #include "platform.c"
>  #include "poll.c"
> diff --git a/rust/helpers/pid.c b/rust/helpers/pid.c
> new file mode 100644
> index 000000000000..1337ca63ab0f
> --- /dev/null
> +++ b/rust/helpers/pid.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/pid.h>
> +
> +/* Get a reference on a struct pid. */
> +struct pid *rust_helper_get_pid(struct pid *pid)

This needs a __rust_helper annotation.

The rest looks superb. With this fixed:

    Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> +{
> +	return get_pid(pid);
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf120042..60a518d65d0e 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs

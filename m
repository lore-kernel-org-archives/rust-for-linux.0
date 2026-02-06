Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020092.outbound.protection.outlook.com [52.101.195.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513CB30FC3C;
	Fri,  6 Feb 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399829; cv=fail; b=qxbqKx8tFdAFkK7+E7hW6aicMrDBsYD84JGpMY5uC9XCpfdyFrZZsA3AhNgQXFvSNCY/MHTq4Qwn9EOA5ACqvfK9+otEDIlv5eD1PWpdMfjvjC5+iKBMO8IOoODZUJ2kmk17YSB4Cw4vvn76ptO+3aYumRJCLS3bpSyfx423Zxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399829; c=relaxed/simple;
	bh=oRKId5ULplv99b2R8ibXiH0T9fQLzKlYYraTJoZ1Xz4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gUtWQ+Ps4KNydxf4/kcNx3xOGgVqf48UBaqUKZloQa7CDGuBc7/vASAWVofk8GjN/iHlWlqk8hbP6mf70mcApsrEmODwYXbATk1mg5pUcDf1Xv7zP5Se+VUuVHoaaznM7js6zS2clq23lCeYeYsTwmk7OMpZk5KsRGs/+/P28mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Y79/Cvxc; arc=fail smtp.client-ip=52.101.195.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Y79/Cvxc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6JgwTpsG9SbUj3S3Alr74qGWVhPx+hUQmzK85TFJlQueBA6yvggXn3wXHpJq6pgAmMqdzauHS0UgLz7pwgV946CKjTxtzuMon01tP7m10lCgoUrESxPwIK2+Cq5v38o27vNuE0E18MzEcgSsL9MFtfF6GbO5Q6rN2d/yAJAT4s7kpM4ztTTdhdiOJk6LDSsUP6wgeZxDzQxN9JWoLUmngo35Ak0+P6e2+DzfLSy5mQ/+XmGyHFt6DxuHvsWMxWeIz7Ik0j9zWnX0k444MaZajFfwKenPSpWy7N00MrgMH88OC2ikA4b63fdzhLyKuRmjqasxgT9jVooCZK21vNkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xiw6g4ODdCZJDhz5Dt/NyfR2GG65oth41zNdSg3qDH0=;
 b=ZsuQwsoRn9P7yNCty35jyuti20pW0AVl+daJFS+4J7wi/nH76aDR5OU+6zRE1Aj9pMXnyw/3692tvtaYjbZqElgtsV4XPiwCIBjiwEi2zm6SehsGGQGbec6VAbB2NZnoVg0uh7ksTdYCcNz+y07mzJrcUx2bkNNUDvGPzMeToR8hSMtfsc/TfRqv9QIAUFpsPBUCLOvU3xBVtM5coRmNHYGRu784ogLAd9SahYT0zYzFli1SyQoNCkcMWzhYtjQwyotazwUX/AJGHfa8Cx4EW12k/Ur4Fhc7DG9hqKvELTGPWCFKr0KOlyAQ4SvR0+Q2Tpf+CdJnu0FhRl8reVVkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xiw6g4ODdCZJDhz5Dt/NyfR2GG65oth41zNdSg3qDH0=;
 b=Y79/CvxcJZeuLlUJgPQImG4xIBWRWV7AlvkT3gRycd53y2gmDA5RDoJ5zObT0ZA5fR57LFOJkcoeZj2w9cYAdjK37U7mHFF1ae3I+x9VWzhBQC5vs25QNkXY8xa88tMFXxu0DC4ksLTPlIrCyVkarsYIkaQaTe4zucq/+hKt6nM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 17:43:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 17:43:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 17:43:45 +0000
Message-Id: <DG82CZTISPBF.2B59PSYVD8Z00@garyguo.net>
Cc: "Matthew Wilcox" <willy@infradead.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: xarray: fix false positive lockdep warnings
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206-xarray-lockdep-fix-v1-1-13315951b836@kernel.org>
 <CAJ-ks9kUO3VNeOD2Qo5rpUj3sr2HW53dgx=YxpnPEupDP_0J4Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9kUO3VNeOD2Qo5rpUj3sr2HW53dgx=YxpnPEupDP_0J4Q@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: d8705243-3087-4f68-9b7e-08de65a746d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk9ZZTl1VXdCT2NzY0ZHVVg4VjJmODVEOWllaFhoTGJ4a1lFSnpvV05jbER4?=
 =?utf-8?B?OEd6dHpnVGlDdVovZTJPUmlBWnBvVWRZZFB6dGZWRjd5d25qOHhBdHpBdjBq?=
 =?utf-8?B?MG1ld0RYRFlOYi9CS0V1L0ttaUZLTHFDb1lqa01HTEJjWnRQZmJPSVNMbXB3?=
 =?utf-8?B?T2EvV0ltY0hJTnNiY0pIWGx5QkVlcWlNcUtEL0tmUGdqbGNQdUNpT0pBUG83?=
 =?utf-8?B?eVR4TE5aUHdhZ3U5ajJ0TDV3d25wUnhlVUI2MStLUlozS3R1UFkwUVFINk0z?=
 =?utf-8?B?aGIzc20ySUtjUkNOekJKTEg4YTRRR0FZWGlPL1ZHS3F5eWRUVkczUFM3Z0Vt?=
 =?utf-8?B?c3NrZExFSlFsdkV6aEtTS21wVGtyQUp5TWpablE3MHBuZS80cnpLWVcySklU?=
 =?utf-8?B?eVJDbkRNWDZPZFJGMk9nWnI1WjF1bEVRK2ZTQUZGMVpaOTFoSzNhSmZabnJk?=
 =?utf-8?B?MlI1enFiM25GYTVtNGsydHhKemV1SmdGTlYyay9adittaTNVQTYrUkZKbXND?=
 =?utf-8?B?OSs2ckk4Mmcxd1p6VGdTVklLZVdtZUVLVlhtdnhQUFloczdOQkkxOVk1djR5?=
 =?utf-8?B?aGt2VERDS0JtUWsxZXJMaDRGbFpOaG9aTUlMa25HNGRxcGdZSXNVTU5XdFQ4?=
 =?utf-8?B?MjROeU82QnBIdXZoZ243K0ZjUG9rc3BzNStNMmpWTWVpWEt0Tk56VXRIeXJi?=
 =?utf-8?B?dTg0KzFuRFVucSt5TUxGT0F6UDZ1RGpDZDE4SGRNTmVpRkphR3NiV2ZuYVYx?=
 =?utf-8?B?NU1mNytPanBnSkZuL1VRblFHNU5uZXpjV1BWK0tFWnFMR2Y1Z1F0SmlVWkZp?=
 =?utf-8?B?QWhrSGI4OVcrbnRkOTJRYWQvQTRadnc3QkdhYlVNNEUxeVJkQWhTVWo5a2k4?=
 =?utf-8?B?SHlSVFgzQmtpV2VZQmdPNzg5Sk5ObzJkMU9XR0dNbFRnMk80Kzd0WFJObWpr?=
 =?utf-8?B?WThSMW1DY0hoZWhvT0hmL1JMYlFXU2VHeFRVbTlsTnh3NUxpWXhJUlpqWDRO?=
 =?utf-8?B?dGU1REVCNEtUS3J6QUlzUy9rbUR0RmxCYVhoNHl4M0I5bDBEd1hwdDNObERq?=
 =?utf-8?B?Y05ybDhzTVIwS01uM0NFN3pkbkFqMm1zTThyTFByMW9Oclc5ak9VYjAvVk9R?=
 =?utf-8?B?U3VXVGFTa1NLbCs1aTBMdlFlV3h2L3Z6NmhRUTU3U2hGWVpTUlBmWktIeEdx?=
 =?utf-8?B?bmVhQ01nbnZuVm4xTEhwRnBzMjRHTHJEYVY0enptQWNUZnpQYWhja0ZBZzFB?=
 =?utf-8?B?cVpGbEpOVnd2MVdGbWlWZjBNWDR0NzZ1d3UzNEExeThHUXFlM3NIYXM0dDl4?=
 =?utf-8?B?WGZYdEh4WGdkRlFxTkk5K291Y3llMzdZOVQ3emgzOGFjOGdmbnN4amtPeTJG?=
 =?utf-8?B?UUlUekhKMzRiL3BQUHd5VTBlRXl4WlF1NEhmcHB5VEJyd2tSTmx1LzNIcmdX?=
 =?utf-8?B?WkpvYUN4alBUc2pvdEV0VTN4Sm55bTZmeTAvZ004Q1pRMXBYci90M0lLNW1Z?=
 =?utf-8?B?d0s4VC8rL1ZFN2VnQThCTFJFcVFhcmlURHRWVXJ6NGM0ZzNNdUE1SGZ1cFhG?=
 =?utf-8?B?M0V5akdrMHFGb0J2UHNudWs0K0pqL09XUURBeVYxVk53SDFNdXVhTDQ2VjNj?=
 =?utf-8?B?K21jeE1Fb0xFRDJ2Y1doR0dRZWp5T0tsY2JVOWExaWROa1pjU0hyU1pReDFM?=
 =?utf-8?B?L1VGOUE2OVdtT0JoU01OMlFwSUUwWk9PK2xHc0NEY1A0ZnRFWHlVYTZzRTVD?=
 =?utf-8?B?S1FMWUk4SGxUdXF3SVZVSlRQR1BKZWNCY0ZYV3hOdHRxSm90UFI2RHJpNnU1?=
 =?utf-8?B?WUN4akpKOE9sZ3ZDVHBVSU1oUWZxd3JWdi9rY2NzTFJPSUJ2WVVxeGQ3QjZ6?=
 =?utf-8?B?Uk4wZXVhako5ZGxXeWR5bkViMkJqTXg1T3RuOVY3empTVEs0ZmtNcnMyWlMx?=
 =?utf-8?B?UHhwWEhwdXVIcmd5ME9wakc3aUxZS2Ztdkt5ZnZ4RmJFbElmU3FGcGpIWkw4?=
 =?utf-8?B?UHBpMWRxZTQwcS9JY0JDaGFrdGhXQVplbmxBbjZIMjhpK3pjbUtnZFZOMWxm?=
 =?utf-8?B?U0VwWGVkWi9kb205SHZRV0pKdGF2bEJXOVd1amhKZE1IbkQwNU1iYzBGN09Y?=
 =?utf-8?Q?kbVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RElZQlN3WGwrb0NDWEVqT0tzeHhncHF2c1ZzdFF6UVo5dmY4MkJNSmRaQUdK?=
 =?utf-8?B?S3FXMnlVRWNtenFEYXkwaVhucnBVNUdDSTdlUkhVSGpteW1mYlh1OE5wRFVu?=
 =?utf-8?B?OFVqZ3JaVkwrS2dKNEphSWNaMEtXTjBnQ09Cb21FY2lvZFZsWXlmVWdNVXVY?=
 =?utf-8?B?VnlTd0Z5Qnk0NCtwOVYvRE8xTHBoZW9lcUVNNDVqcGU5TFk2NWs5bkl0Y0lL?=
 =?utf-8?B?dWRyTEcvZ2V1ZjJoS3NQcG5Jc01UMmJlTzZKM2UxRXhXZ0E2ZTl4ZHU4amxJ?=
 =?utf-8?B?emZMdEE1MWQ2WTJjeXB6UkVQVjRzcjQydE81MmJYSEFjeHg1aCttUmN2Um5E?=
 =?utf-8?B?VG90bWFyWWJDSlVYRktuTkFVVTBUWnhLa2JCblFidFVLUjBYUTJLTFNwa3RE?=
 =?utf-8?B?TnpwTFMwbUxOcUNTRG5wYnBYNWhlM0xkd0RhYjhDdHFGODVBMWtiazlWUTdE?=
 =?utf-8?B?U3lxWnUxR0tmTUN6ODlubWRMVW5idGFaVVZiMTNTdzV6YzFTbkRLMUx1Rm5w?=
 =?utf-8?B?QThGYW9jNGZOakNsUjk2dHZZclgyak1icEg4Q3hXUFlaZkJQNWhFS0RscXcr?=
 =?utf-8?B?MnFQQTBSb0t4STdCc3dQeTd4MlREY2lOb2tRNFphRmt6LzZuNWJDVk1aNWFT?=
 =?utf-8?B?Sm5ma1BFZCt6S0xscXFIb0g1SFJIdzNWV0NyNWZzZDFQODYrbTdqWkJaVytI?=
 =?utf-8?B?RWsvRk5IZ3JBTThlVDdCUFB2VWlJUkNtVld4UnlUV3haazRaQ3VuUjFvbndK?=
 =?utf-8?B?WlRGbjZmdnZNblRmWVEwSHZnMUVnbXQrRGJ4Z2d1SGdFR2dtK3BRb0c3Y0FV?=
 =?utf-8?B?Y04wSHVwOU5qaEtlcTRuMkxkOG5LanlMelRzVmQ5cE9wSThBQVJweUtqb08v?=
 =?utf-8?B?Z3BlOXJFdW80ZWFIblJyMEJUSHBkeTJlV25wSjRUaTJJMk0xVHZMTDU5d015?=
 =?utf-8?B?aysrVWlsZjRJS3JTVkoxV0EyN1ovUS81aU5UdnVDSk5Pam94R25Ja1BQQ1ZG?=
 =?utf-8?B?QXlONTdPV3V0RWdPa3Z5ZDltcS9VYStvd2JmeDhRQzhuUlBoVHZJTTA0T01U?=
 =?utf-8?B?QnBGNkhlTlpvZXlmVDFFNTRUcEdaYVEvMGV4NE5sTmRyNk9IUVRUS0IwRkxB?=
 =?utf-8?B?V1JkalJIU3FxN2xwTklmcUlkcUVrWHpHb3B2a2dsYyt4M1MyRXlSTlVONzly?=
 =?utf-8?B?Zlp1cnMyNHlNR0ZsakVDcSs0bjRTSG1zWUduNm1FdzI1RmlramN4VTA0K1Fm?=
 =?utf-8?B?dmF0SWRXSnFPejAyQUlWdkQ4MVdoT09kNlIvVDlUUHljeStDaldsbFIxTFJG?=
 =?utf-8?B?cTUyWGM4clRIcEMzcHlCTWlXellSc2lqMjN3eW5CMTNzVGZIbjV6WEI4dGU4?=
 =?utf-8?B?S1kyb3RzcUxITFNwMmVMRXhKVUdmUjhhL2ZMUzdpSFpDcGMxTjhBZ0UwS1Jk?=
 =?utf-8?B?T1lRSlArS1NYbDUyL0lScndPY1JrNUdZQXkrZVRKN1NVdUQ4dk1JbEw4MTBP?=
 =?utf-8?B?Q3E5RXZHSWdrYk1wM0ZoeUlBQXdlZ2FoTGM0Rk5tVGREdHRxZmNSN1k3M0t1?=
 =?utf-8?B?M09RWE05MmNFbGd2My9IL2RRbzNQejVsRlJudXVXRHAxSFNaOFhpYW55UHNP?=
 =?utf-8?B?Rmtpc2t5Nnd3RVlPY01IZkNtU2wwS0JRak93UnEwM0x4am1hUHAwby9iOFZm?=
 =?utf-8?B?cVFBelpjZFZGSDRBYm05S2dJNmJKOHhGRStIcmFKUmorSDZnRkdIZVpBNVFR?=
 =?utf-8?B?VERKSzhvM0JWcjA0dlg2VmV6aHN6WTR1TlZ1L0srL2NPWDQrcFowdDgzR1JX?=
 =?utf-8?B?WHN5MS9MbUJjSmpwcEVCUEs5dXEwSjU3T3MvRGh5Z3FQa3h6RWZMWnA1djY3?=
 =?utf-8?B?cnpkYkI2Uk5hZzNpMEV4RkJOcktoRFNzWDkxS0pzTXIrTGE4aGsvTkV4eWFD?=
 =?utf-8?B?TlVUbXl2OVJoNDMvaDVmUTVXRWxSZDE2NFdrQ04vVWI4NzcxM1dmb2V3VDAx?=
 =?utf-8?B?TURXWDgvYVhZcU5hendlTWZFZWhudjJxYmwrZk5TZnpxRWlVcnhyWmIvYnNo?=
 =?utf-8?B?TTdycFdHUFJYRk44RnZaVllpNThtUjJ0T2xUZzN6Yy9hcFQvZHIxQ0c4YVhB?=
 =?utf-8?B?SVV5Z1lpekRGNzh5ejh3R3c0Zm9jN2E2ZUlvQXVuK0JFL0RveWx5aWhpNXRI?=
 =?utf-8?B?NTZZRUNpdW9lV01oQXZlVis3aXYxNjg3OWVDRmh5ZThiVllaclEvYmZrK3VG?=
 =?utf-8?B?TDE1eWNEVzVsbDN1cGZUSEdEaXJjYlcwaGVaYWZJSXNjMVg4bXF4UHFZMUtt?=
 =?utf-8?B?dWw4S25xNG1tZHppS0VydWNPMktQaXgyTVU2UFYxc3EvWFpLMFNQZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d8705243-3087-4f68-9b7e-08de65a746d9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:43:45.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STIK5WFNUg9KxieFiAtwvh2p74XOxEuLjHnbcSDJ83sDiHVd9dXVR/gKeRNkxnNm6+P7+mAw1P4EM4sux5r6GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5282

On Fri Feb 6, 2026 at 5:19 PM GMT, Tamir Duberstein wrote:
> On Fri, Feb 6, 2026 at 12:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Replace the `xa_init_flags` helper with direct initialization of XArray
>> structures using `__spin_lock_init`. This allows each XArray to have
>> its own lock class key for lockdep, preventing false positive warnings
>> about lock ordering violations.
>>
>> Add a `new_xarray!` macro that automatically generates a unique lock
>> class key for each XArray instantiation site. The macro accepts an
>> optional name parameter and uses the `optional_name!` and
>> `static_lock_class!` macros to generate appropriate names and lock
>> classes.
>>
>> Update the `XArray::new` method signature to accept explicit name and
>> lock class key parameters. This enables proper lockdep tracking while
>> maintaining flexibility for advanced use cases.
>>
>> Remove `rust_helper_xa_init_flags` as it is now dead code.
>>
>> This was previously part of the series at [1]
>>
>> Link: https://lore.kernel.org/r/20251203-xarray-entry-send-v1-0-9e5ffd5e=
3cf0@kernel.org [1]
>> Fixes: 210b81578efbe ("rust: xarray: Add an abstraction for XArray")
>> Acked-by: Tamir Duberstein <tamird@gmail.com>
>
> Please replace with:
>
> Acked-by: Tamir Duberstein <tamird@kernel.org>
>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/helpers/xarray.c |  5 -----
>>  rust/kernel/xarray.rs | 43 +++++++++++++++++++++++++++++++++++++------
>>  2 files changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
>> index 60b299f11451d..644b8b35b1bee 100644
>> --- a/rust/helpers/xarray.c
>> +++ b/rust/helpers/xarray.c
>> @@ -7,11 +7,6 @@ int rust_helper_xa_err(void *entry)
>>         return xa_err(entry);
>>  }
>>
>> -void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
>> -{
>> -       return xa_init_flags(xa, flags);
>> -}
>
> I like Alice's suggestion in the previous version of doing the
> initialization here. It gives a natural place to explain why
> xa_init_flags cannot be used directly and avoids introducing a second
> user of `bindings:: __spin_lock_init` which seems like something we
> should discourage direct use of.

Or perhaps we should just add __xa_init_flags which accepts explicit lock
classes, and replace `xa_init_flags` to use it with a fresh lock class key.

I think C users benefit from having a fresh lock class key per xarray rathe=
r
than a single one per compilation unit, too.

Cc: Matthew Wilcox <willy@infradead.org>

Matthew, for context, the current xa_init_flags have an issue where, becaus=
e it
is static inline function instead of macro, all users inside a single
compilation unit ended up get a single lock class key. For C users this mea=
ns
that each .c file gets a single key, and this is more problematic for Rust =
as we
invoke via helpers, so all of Rust users share a single lockdep key.

Link: https://lore.kernel.org/all/DFUI6LMASTMK.2WI00LMY5FTSP@garyguo.net/

Best,
Gary

>
>> -
>>  int rust_helper_xa_trylock(struct xarray *xa)
>>  {
>>         return xa_trylock(xa);
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index a49d6db288458..62a2b2ebfb0bf 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -8,11 +8,31 @@
>>      alloc, bindings, build_assert,
>>      error::{Error, Result},
>>      ffi::c_void,
>> +    str::CStr,
>> +    sync::LockClassKey,
>>      types::{ForeignOwnable, NotThreadSafe, Opaque},
>>  };
>> -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
>> +use core::{
>> +    iter,
>> +    marker::PhantomData,
>> +    pin::Pin,
>> +    ptr::{null_mut, NonNull},
>> +};
>>  use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
>>
>> +/// Creates a [`XArray`] initialiser with the given name and a newly-cr=
eated lock class.
>> +///
>> +/// It uses the name if one is given, otherwise it generates one based =
on the file name and line
>> +/// number.
>> +#[macro_export]
>> +macro_rules! new_xarray {
>> +    ($kind:expr $(, $name:literal)? $(,)?) =3D> {
>> +        $crate::xarray::XArray::new(
>> +            $kind, $crate::optional_name!($($name)?), $crate::static_lo=
ck_class!())
>> +    };
>> +}
>> +pub use new_xarray;
>> +
>>  /// An array which efficiently maps sparse integer indices to owned obj=
ects.
>>  ///
>>  /// This is similar to a [`crate::alloc::kvec::Vec<Option<T>>`], but mo=
re efficient when there are
>> @@ -27,9 +47,10 @@
>>  ///
>>  /// ```rust
>>  /// use kernel::alloc::KBox;
>> -/// use kernel::xarray::{AllocKind, XArray};
>> +/// use kernel::xarray::{new_xarray, AllocKind, XArray};
>>  ///
>> -/// let xa =3D KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNE=
L)?;
>> +/// let xa: Pin<KBox<XArray<KBox<u32>>>> =3D
>> +///     KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;
>>  ///
>>  /// let dead =3D KBox::new(0xdead, GFP_KERNEL)?;
>>  /// let beef =3D KBox::new(0xbeef, GFP_KERNEL)?;
>> @@ -86,7 +107,11 @@ pub enum AllocKind {
>>
>>  impl<T: ForeignOwnable> XArray<T> {
>>      /// Creates a new initializer for this type.
>> -    pub fn new(kind: AllocKind) -> impl PinInit<Self> {
>> +    pub fn new(
>> +        kind: AllocKind,
>> +        name: &'static CStr,
>> +        key: Pin<&'static LockClassKey>,
>> +    ) -> impl PinInit<Self> {
>>          let flags =3D match kind {
>>              AllocKind::Alloc =3D> bindings::XA_FLAGS_ALLOC,
>>              AllocKind::Alloc1 =3D> bindings::XA_FLAGS_ALLOC1,
>> @@ -95,8 +120,14 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
>>              // SAFETY: `xa` is valid while the closure is called.
>>              //
>>              // INVARIANT: `xa` is initialized here to an empty, valid [=
`bindings::xarray`].
>> -            xa <- Opaque::ffi_init(|xa| unsafe {
>> -                bindings::xa_init_flags(xa, flags)
>> +            xa <- Opaque::ffi_init(|xa: *mut bindings::xarray| unsafe {
>> +                bindings::__spin_lock_init(
>> +                    &raw mut (*xa).xa_lock,
>> +                    name.as_ptr().cast(),
>> +                    key.as_ptr(),
>> +                );
>> +                (*xa).xa_flags =3D flags;
>> +                (*xa).xa_head =3D null_mut();
>>              }),
>>              _p: PhantomData,
>>          })
>>
>> ---
>> base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
>> change-id: 20260206-xarray-lockdep-fix-10f1cc68e5d7
>>
>> Best regards,
>> --
>> Andreas Hindborg <a.hindborg@kernel.org>
>>
>>


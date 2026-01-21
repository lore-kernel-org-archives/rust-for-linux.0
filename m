Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020136.outbound.protection.outlook.com [52.101.196.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF334DCC7;
	Wed, 21 Jan 2026 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013359; cv=fail; b=tj0YrmRBskRQQBvtjl8WTBiQNdvbpKe6+o123DRqubLtFOtkLXCRVbUOv/syzmpJca/tQF5KNxvorkm2axtWestl8A5dMSl+vXO1mYHd6QgvbwIYDbLeacP+Yo+7Hu9F7JkC7UI7hT7DCH+m/0biv5wMksLj4TGvxa49yBVjS5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013359; c=relaxed/simple;
	bh=lkyG9pmgOHCrcunQjroZ8cJfto7B9pH3xcXd96gh1s0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hlX37yT1w0fgCb6gVmg4ZiC4xCPWEmk/jvyvC+IAvQpeabI7/18KAfEHmW7To8M4rbwzlzGH0ff4QmZEVkuX1+CzDbGXC+Dit+ENyrpVqTtpvvDcs8jVLPqfQKMt9FTnCtUMG4brmTxbMkVU667uAS+IVZMD8LgzN99/y2XPftw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sBYW7OpL; arc=fail smtp.client-ip=52.101.196.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sBYW7OpL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj2XKAWJm2FQOM9Aamle3pd0fKKR7hY230RC4keCojtUDdz7gzn1oHCuAd5Zd1HRDE2oPwjGXcn1D6/Mb1jsL3ebAldHccZ7xNWKvAL5bhJZHXYcRvbAvKWgjsmHi18Kx/biHeeh/NoaJYESUUvmDKE6O/BrrYMTrHwN7FVEwhvFY6Iqzjmu7BewcY5+vsnGcKS8UYgmCrVb0IyBK/8ZG7h5Je4xSXHCh9WSlz6ULnGHnKgM03b7tNb6wPl8Pmyu24NBPl4DGJhSKcrZV0m1cok6s1kY1TNhUbH9flKpM13wQqYrIKNezBRcH8QARJ9gzdm/xiaVf1BbwXjLeTCqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUWAJL1sA6+Lgn8PCPlGkkf6Qw8E9GGfr3ge2i8dpyo=;
 b=HS23iWD29YkzS84wl4PMX9Cv2yB4hdGS/Fjw8j4kK3AL0qZ67mX94C+96harm585zglbdBjlRCbogJgS103zc4lf41nZm0F8enRQiHokAEwdKYyrnU3F8oz8YS+ILPc+3gn2kgo263Wj4ohNOJl3OAGV96ywJOjJua8+RphHcPJNJoxLW+qajrdoHrCrJEK4JkMB76hSGUpBvvfMdizjBcebFDmv28piNRBwfCsvnC53qGy8Sgl+hLwp2oIURRTYyeSYKYDpArJuVXAyAczZv3vXQ09uqL20Z6aSbd3J3aV2hHYAlv415b615Qn7wzO9LPgD+ao5bBypqR18J/VPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUWAJL1sA6+Lgn8PCPlGkkf6Qw8E9GGfr3ge2i8dpyo=;
 b=sBYW7OpL/xcfm0aEk/ugEZT6i+22SIHjn5B58BUJ1XZdrX2BEPXiBTAF/EFqlLfWk5REi2KNUxPlKfwo14lBptI2sGfR8b6br0VLX+8HdspigqQdN9Wr0BCbM8aJm+ZNzbmB03y/iYP2ZyZAvCo3tk9AkofOy2+3MatBDNzBiCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6224.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 16:35:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:35:54 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:35:53 +0000
Message-Id: <DFUEWBKOLFQ1.3NSTFO4L97503@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 29/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot path
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-30-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-30-jhubbard@nvidia.com>
X-ClientProxiedBy: LO6P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: ea61830b-2654-4dff-47a9-08de590b259b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVhVaWs3YzdrL3lCY25PUmk0Q3B6MGgzVEo4ckFMbmZPT1ZjZDJBMlVBd1g0?=
 =?utf-8?B?dGhPZVBnem94QVV5NzFrYlNqc2VwWDRjdXdmU3VGVHYySUVIQTZKamtJc2RB?=
 =?utf-8?B?OTJxdTNGNDlWa1MwL09hVTd6Q3NXSDhSYncxdloxeGhCcmdtVlZEVUtGT3d2?=
 =?utf-8?B?RWphT05Id0JJc1ZGbXllNDJZeXVkdDNkLzF2TVpuTWNLODNwRGRJVENGaFFo?=
 =?utf-8?B?cFZrTFdwUmhMbWloVlNBWGVsMjVkZ2FhK1Z0enA2K25rSGVSekpHU2ZxbWlp?=
 =?utf-8?B?UTBKcFBxOUpKR3BYZGxtMkVIM3g3SHdpSkVtSDNSS21QTXJyM1pZUm5zamd5?=
 =?utf-8?B?YTJGUEZtcm1Yb3JJNW9pZTB4R1o1eWtGTFNpVDdIZmVrK1RBZDZSU1FEdkow?=
 =?utf-8?B?WlZrZExNMURxL0NreVMwYU1UOEVwODIweWZ0UXR2ZllWZWhmN1ZYRnZTYThk?=
 =?utf-8?B?dVUyb3ZIcElBYzlyZlZ0R2tHVnVwRzlzTEhiRE9xTGYwRlR1T0dvdVZOS1FO?=
 =?utf-8?B?enZLY2ZxM3UrdXorSFNvcXhkMnJHd0pMeUtMRjFER0Rnd1djZmpYSmhVNERs?=
 =?utf-8?B?QkFOVkZFNlQwcFY3T2RxNEp1ZzJjdnA5Q0ZCeHg5ME5nbC82UjBvbDhJK0pP?=
 =?utf-8?B?blU1K3dlUFJMNmJ6USsrd3ZVKzZ2bHhNQjNFbGJhOU5vcUtQczlRQ25kaUZa?=
 =?utf-8?B?RDZ1YXg0c2VwdlRvMWlrTjZnbHNTOEJXWmNicmNFN01FWStzZ0lOczJSenhS?=
 =?utf-8?B?WWdxazFmMXNMRENUbkIvMktBV3R5bVBzeFRGeDRmWExjQXZzOTROYW9ocEk1?=
 =?utf-8?B?cExiNXN6RisxVVoreThwanhBQlQrNWcza2tHNXJVeVM0L3JOZkNDM0VpNGJv?=
 =?utf-8?B?eThyUldSUFRoZWM2VDhQZ3gzS3pSMEwxUExzQTg5Z2grS1NpVEwyMVBRVW5y?=
 =?utf-8?B?ckk5SldoUmNxVENWSEFJM29TMXBFR1BEVmF6ck9ZUWErZEhlRjNGOS9ZYUly?=
 =?utf-8?B?cXJMOUpxVlh0RXlpSnVNYmEwRUVsYmlvQXkwU2ZHa3UwS1p4ZTZHYVo2Nm1O?=
 =?utf-8?B?WlV5bzFPZThrc3JUN0E5dUdGek53OU1hM3BDbVFwOVVqU3hvazZ5NDVIMnpt?=
 =?utf-8?B?VHNkWllmbHYzc3AxNW95ck9saHdCSGlCdHd0TFFjMXFYRXFwdzVaQUp6YVZV?=
 =?utf-8?B?ZTREWjh4WmZpNFdoSHV4WWltbWdtdGhLUVprdm1CUkxLNm12czBFVk1YT3Q2?=
 =?utf-8?B?NnUrczlEK3hqb2dBSkozM0x4cVlNWEZoQzFacEU5MTJtcG4wQmFra2xJQnVZ?=
 =?utf-8?B?U1hCVVN6ZW1PcDRBTE1ZQmZCQ1U1eHhZbk1PZmZjRkJvZ2t3c3VKYWluTjls?=
 =?utf-8?B?M0pmczZKL05qNzdyaldwZ3JNV0ZQc2NNdDNIdXA2c0dKdnpaa0RWbFpoN0Vk?=
 =?utf-8?B?Y09RQTVCRUljSngwODBnSnlMSzhIUkhzS1NhaU4wSkFxT1pwN2lUTTVEMm8r?=
 =?utf-8?B?ZGxQTnk5c2ZYaEdIbGxHSlN5SitzNFRMcGIxcTVvS3diWjl2aU1hT3RXMEhp?=
 =?utf-8?B?dUpQVUsvbzhkdTlRMFQ0WUZIODRpaEpTTzNKcFd5bWtZYi9aWnJadzlHRHph?=
 =?utf-8?B?ZHFEdlBoS0xQTlpKcVY1bkdRQlNGaVNjMHNXdWovMDBHOW9TeVBObmdnNzVu?=
 =?utf-8?B?S0hQaXlHUGF1WG5RUDFKUEk3bVBIZmEvVW5TZ1dhNTlZN1p5Qmg0NHB6T01W?=
 =?utf-8?B?U1lmL0xGOUo2RVdvdTN0dUVvOExSSUdvQVZzbTRMU1EvK1dXbUhsR29sdUdU?=
 =?utf-8?B?dENIY2duWmlvQzBVcGp2Nm5nbUFkR1pTcG9LRUY2ZEhFZjRjTGJpTWsyZkpk?=
 =?utf-8?B?T1Z6bllRYTRyaHVZTmN4YUdOOGQ1bitCQmxlTjd6WU1FdDVRdlFvMTMzUXRP?=
 =?utf-8?B?eFpCbnRjVC8rNG03dDJSM3FxVC9CZ09nNklBMXpsdWVENDRIT3pRZUdibGR6?=
 =?utf-8?B?bnh4ckJ0bXNnOXhiSXdQU3hxZ0dtRVZ3TE40cVc5SjFPNXVHaG1xdTFqeVM0?=
 =?utf-8?B?bHE3U01hWmFWZnprMkgwc3c2M2swZ3I3L3o0UDM0WmFWZ3doUDloTW1jc2VN?=
 =?utf-8?Q?d2aw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFRsTlpRdGh2OXdleTB3Vi9zWGVpbUk2NkMrZmhnTFdxM2JMVXBFZDVWTHVI?=
 =?utf-8?B?dmdSQXJjTkZ2K0YrSjJmSGtxdTVLU1YwblBtMHlwVGlCUjBxUXd4b0JmbVA4?=
 =?utf-8?B?SUxIbklOK0kxWnczWUxnQ0dXYlVYWlQ1bGZTdmZiejBlNzNUOXp2cGV2Nmd5?=
 =?utf-8?B?c3F1R04rQkZzd1hiNFVFVnN4eWRXWFhaT1ZXbG5ueURPTWV0dlFxUHkvS3Bw?=
 =?utf-8?B?Z2QrZ0FyUWRtVFVoMEYwK1JkQ051QW5QN29yVWlUNkhRN2FkT0JjUHd1MU1G?=
 =?utf-8?B?VnhUQVNhT3g5K3p2UnZvallxN2d3Sm40ZmgxVkdqMWQ1anFrMmlpWEl1MktC?=
 =?utf-8?B?dlFjbHZDQ3NuTVc3Q3UzYWEveC9FaGtYUVNpUDJiY3Z5anduQVVtdFo3UjFx?=
 =?utf-8?B?YXB0T3h1WFFrN0t6UnZ1Ri9DcVNhUWlKT21kWkZ0MWNQMlFIM05OQkI5cnpB?=
 =?utf-8?B?MzFwL0hhdWFjYVNIZFY4SXIxWGNpUWlZdnd5bDRRaTBETGRrZHU3R1JIVzN4?=
 =?utf-8?B?cFo0Um82a2F5ZVpyQ21ndDhnNGJGMkNqQUZXSmphU25xK00rM1dCaXgxVnFI?=
 =?utf-8?B?cDNRS0k5dE82RGxpWk5iSTBsQjdaNTh3b1FCY1V6eXVOQUlteTYzbUFYZC80?=
 =?utf-8?B?RW51OVVwZnY2cVZEd001c3FXbHkrSFdPY0ZxblU3RjY1dTdPbDhKcmZGcXdu?=
 =?utf-8?B?VjN5WkhOVzN4cjhVei9CcnlRNVhDcnViYTQxRkVXeWNlZVlQZ0UyaDI1TVNI?=
 =?utf-8?B?eUxHamtFUUswS1c3ZUhtWnpra3hYRHp4M29GZkJsTmlFMFVQaFRqQytkUHlh?=
 =?utf-8?B?UllSWEVMa2IzWFliaUF5SzMwSU9nL1ZrcXZuS3NtVlloN3oyUFVMUHVkTW5w?=
 =?utf-8?B?QmpOYXp2cVhYRnByOFdyWGdqR1g2S29XLy9HaVNkZmdCZFA5NXlGQm9pUWNt?=
 =?utf-8?B?RVZtMnMxQkd4a3dOMjJuc2FBOUxId1RBTVFDMC9hMFJDd3IwRk83ZExLT2Fk?=
 =?utf-8?B?cDhOekRuZ3dsa2J5N244Ylk2RFBRQWtONERVeHJLWnU5YXdUdU8xaHZDdG9I?=
 =?utf-8?B?eEg5Vy9Fc2ZpaXA0c2I0OTZ1cnpNWWNUa0NLUm9tRjNXWWVsL291MWI3bGZz?=
 =?utf-8?B?Z2l3OW52WXFxbDMrYnFVVStIVi9XcU9qSVgwNzhZYUNQblpha1B6WWNudDRX?=
 =?utf-8?B?eWZUdnRYN2JEU1ZIZzRGdSt5UDZXMlo1dDJHZDBuL2x0ZVpkcHFRN2JNck1x?=
 =?utf-8?B?dzB5REJydWJYd3NTMEhZMzRNcFpwSjFqSnZyR0J1MjJRTVJ4Vk5qYkpzMm9X?=
 =?utf-8?B?aU1FMklyMFdsMTNzRkswQjFQNFNjT3dLcTJNa0ZrdGFUUGxtdU5KRDYvR0hE?=
 =?utf-8?B?d0sxOFlhQkU2NWVFaTI5VlUwTWFvN3RTSEdZaUljN09HY1daNEdlTzNJdzhU?=
 =?utf-8?B?b1hUSWdYMXptWGI3aHVuY0tpZTJQa242bXRUVFlnMmFsaitXNkRlT0JxSDNB?=
 =?utf-8?B?VURTQ01rNDN4azBGU3hkUjQzNU95NlE1SEY3aEw0b01Gc0x2b2UxTXg5bTdD?=
 =?utf-8?B?dzhlbWprWDcwYVpFUGxoSWFNanBrbWdyUjkzQUdJenExWjY2VzdqTGQ5d1Va?=
 =?utf-8?B?Qndsb0MzN0Z5bGVoUlBuQmxYd2h3d3hzMStzKzVrclk4anpLUkRabUdpOEJB?=
 =?utf-8?B?c0dZNllUdU5hVmN3UnVGMEhwYXphUitwY1N1YjdqWndrbXNaNzY2YkM5WmlD?=
 =?utf-8?B?eG94TGlESmhLK21TZlFIWG9CeW1XcXJybFFzZlBMdG1MRlJHRDFIWjdEOWpj?=
 =?utf-8?B?L0NMbGJKRnphYVByTlpIaktpMTdTbmt6UWZnN2t4UW5oSzRKL2Uwd1lpenNs?=
 =?utf-8?B?SG1tTGFvMExlTTZhdDMvZmZ3UHlJTmNxVkhtNnNLUUpmdmNLWHFmWjhzWEow?=
 =?utf-8?B?VXJpVk4wWGFLYUVpVW1nYkxPOTY1M3c1OUlxOWU3czcrV1k0UUxpRUwreDlB?=
 =?utf-8?B?RmVUM3NaeW9FcVZVS21DYk9mY21ZL2J0TVJwVnlnS1lBSWFhRGg4aHpNSHgx?=
 =?utf-8?B?RzRpaFlXYjV2VkV0bGhaQlVVeisxZHVPUlRTU1FkSklleWJYb245eld5a3Zp?=
 =?utf-8?B?cnhvelk2WkVxdzEwcnlTNGNpVFpza2ExOGdaa2VncWp1RW0zdlJTditoNjRL?=
 =?utf-8?B?ZjdKQXlsanBEbjNnaGg4Y2RBWmpKcWEvRi8wTm9DUTFNNGRnRHRXMVFLWlI3?=
 =?utf-8?B?eHNub0ptVC9SYUFFM05Xak1Oc3NnTE04TnUyMU4wU3MydjFFWjdYZS90RGtR?=
 =?utf-8?B?NHF4bk9zUGJGYWhhc3Q1Z3BFN0NDVmRGNWhnMUtsS1VMUmdPeGpCdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ea61830b-2654-4dff-47a9-08de590b259b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:35:54.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFDwy6vtNsrjfJfw8pEQMbYaS8N+ZHj+ARlGJ0DhV2i44DhtziZiOmURHoXp4HD9OTtmh+xWgk0JM9vk3/e49Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6224

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> Add the FSP-based boot path for Hopper and Blackwell GPUs. Unlike
> Turing/Ampere/Ada which use SEC2 to load the booter firmware, Hopper
> and Blackwell use FSP (Firmware System Processor) with FMC firmware
> to establish a Chain of Trust and boot GSP directly.
>
> The boot() function now dispatches to either run_booter() (SEC2 path)
> or run_fsp() (FSP path) based on the GPU architecture. The cmdq
> commands are moved to after GSP boot, and the GSP sequencer is only
> run for SEC2-based architectures.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fsp.rs |   6 +-
>  drivers/gpu/nova-core/fsp.rs          |   6 +-
>  drivers/gpu/nova-core/gsp/boot.rs     | 159 ++++++++++++++++++++------
>  3 files changed, 126 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 80401b964488..d88c7a91e2bc 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -13,16 +13,14 @@
>      gpu::Chipset, //
>  };
> =20
> -#[expect(unused)]
>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the .image section)
> -    fmc_image: DmaObject,
> +    pub(crate) fmc_image: DmaObject,
>      /// Full FMC ELF data (for signature extraction)
> -    fmc_full: DmaObject,
> +    pub(crate) fmc_full: DmaObject,
>  }
> =20
>  impl FspFirmware {
> -    #[expect(unused)]
>      pub(crate) fn new(
>          dev: &device::Device<device::Bound>,
>          chipset: Chipset,
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 7d46fbcc7abd..9c11ceb6ab4d 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -1,8 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -// TODO: remove this once the code is fully functional
> -#![expect(dead_code)]
> -
>  //! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
>  //!
>  //! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FS=
P --> GSP.
> @@ -11,6 +8,7 @@
> =20
>  use kernel::{
>      device,
> +    dma::CoherentAllocation,
>      io::poll::read_poll_timeout,
>      prelude::*,
>      ptr::{
> @@ -381,8 +379,6 @@ pub(crate) fn create_fmc_boot_params(
>          wpr_meta_size: u32,
>          libos_addr: u64,
>      ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
> -        use kernel::dma::CoherentAllocation;
> -
>          const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 =3D 1;
>          const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 =3D 2;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 4d04135a700e..0fbaa73eb55c 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -13,6 +13,7 @@
>  use crate::{
>      driver::Bar0,
>      falcon::{
> +        fsp::Fsp as FspEngine,
>          gsp::Gsp,
>          sec2::Sec2,
>          Falcon,
> @@ -24,6 +25,7 @@
>              BooterFirmware,
>              BooterKind, //
>          },
> +        fsp::FspFirmware,
>          fwsec::{
>              FwsecCommand,
>              FwsecFirmware, //
> @@ -31,9 +33,11 @@
>          gsp::GspFirmware,
>          FIRMWARE_VERSION, //
>      },
> -    gpu::Chipset,
> +    fsp::Fsp,
> +    gpu::{Architecture, Chipset},
>      gsp::{
>          commands,
> +        fw::LibosMemoryRegionInitArgument,
>          sequencer::{
>              GspSequencer,
>              GspSequencerParams, //
> @@ -155,6 +159,59 @@ fn run_booter(
>          Ok(())
>      }
> =20
> +    fn run_fsp(
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        chipset: Chipset,
> +        gsp_falcon: &Falcon<Gsp>,
> +        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
> +        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
> +        fb_layout: &FbLayout,
> +    ) -> Result {
> +        let fsp_falcon =3D Falcon::<FspEngine>::new(dev, chipset)?;
> +
> +        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
> +
> +        let fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?=
;
> +
> +        // SAFETY: fmc_full is a valid DmaObject with a contiguous alloc=
ation of size() bytes
> +        // starting at start_ptr(). The slice is only used for signature=
 extraction within this
> +        // function scope while fsp_fw remains valid.
> +        let fmc_full_data =3D unsafe {
> +            core::slice::from_raw_parts(fsp_fw.fmc_full.start_ptr(), fsp=
_fw.fmc_full.size())
> +        };

The justification is week because it does not mention about the non-race na=
ture
of this, which need to be justified for a DMA allocation. If you use
`CoherentAllocation::as_slice`, then this requirement would be obvious.

For example:

    // SAFETY: the dma buffer is not yet submitted too hardware and we are =
the
    // unique owner at this point.
    let fmc_full_data =3D unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.fmc_f=
ull.size()) };

Best,
Gary

> +        let signatures =3D Fsp::extract_fmc_signatures_static(dev, fmc_f=
ull_data)?;
> +
> +        // Create FMC boot parameters
> +        let fmc_boot_params =3D Fsp::create_fmc_boot_params(
> +            dev,
> +            wpr_meta.dma_handle(),
> +            core::mem::size_of::<GspFwWprMeta>() as u32,
> +            libos.dma_handle(),
> +        )?;
> +
> +        // Execute FSP Chain of Trust
> +        // NOTE: FSP Chain of Trust handles GSP boot internally - we do =
NOT reset or boot GSP
> +        Fsp::boot_gsp_fmc_with_signatures(
> +            dev,
> +            bar,
> +            chipset,
> +            &fsp_fw.fmc_image,
> +            &fmc_boot_params,
> +            u64::from(fb_layout.total_reserved_size),
> +            false, // not resuming
> +            &fsp_falcon,
> +            &signatures,
> +        )?;
> +
> +        // Wait for GSP lockdown to be released
> +        let fmc_boot_params_addr =3D fmc_boot_params.dma_handle();
> +        let _mbox0 =3D
> +            Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fm=
c_boot_params_addr)?;
> +
> +        Ok(())
> +    }
> +
>      /// Check if GSP lockdown has been released after FSP Chain of Trust
>      fn gsp_lockdown_released(
>          dev: &device::Device,
> @@ -192,7 +249,6 @@ fn gsp_lockdown_released(
>      }
> =20
>      /// Wait for GSP lockdown to be released after FSP Chain of Trust
> -    #[expect(dead_code)]
>      fn wait_for_gsp_lockdown_release(
>          dev: &device::Device,
>          bar: &Bar0,
> @@ -255,8 +311,6 @@ pub(crate) fn boot(
>      ) -> Result {
>          let dev =3D pdev.as_ref();
> =20
> -        let bios =3D Vbios::new(dev, bar)?;
> -
>          let gsp_fw =3D KBox::pin_init(
>              GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
>              GFP_KERNEL,
> @@ -265,36 +319,58 @@ pub(crate) fn boot(
>          let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
> -        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
> +        if matches!(
> +            chipset.arch(),
> +            Architecture::Turing | Architecture::Ampere | Architecture::=
Ada
> +        ) {
> +            let bios =3D Vbios::new(dev, bar)?;
> +            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout=
)?;
> +        }
> =20
>          let wpr_meta =3D
>              CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, G=
FP_KERNEL | __GFP_ZERO)?;
>          dma_write!(wpr_meta[0] =3D GspFwWprMeta::new(&gsp_fw, &fb_layout=
))?;
> =20
> -        self.cmdq
> -            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
> -        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
> +        // For SEC2-based architectures, reset GSP and boot it before SE=
C2
> +        if matches!(
> +            chipset.arch(),
> +            Architecture::Turing | Architecture::Ampere | Architecture::=
Ada
> +        ) {
> +            gsp_falcon.reset(bar)?;
> +            let libos_handle =3D self.libos.dma_handle();
> +            let (mbox0, mbox1) =3D gsp_falcon.boot(
> +                bar,
> +                Some(libos_handle as u32),
> +                Some((libos_handle >> 32) as u32),
> +            )?;
> +            dev_dbg!(
> +                pdev.as_ref(),
> +                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
> +                mbox0,
> +                mbox1
> +            );
> =20
> -        gsp_falcon.reset(bar)?;
> -        let libos_handle =3D self.libos.dma_handle();
> -        let (mbox0, mbox1) =3D gsp_falcon.boot(
> -            bar,
> -            Some(libos_handle as u32),
> -            Some((libos_handle >> 32) as u32),
> -        )?;
> -        dev_dbg!(
> -            pdev.as_ref(),
> -            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
> -            mbox0,
> -            mbox1
> -        );
> +            dev_dbg!(
> +                pdev.as_ref(),
> +                "Using SEC2 to load and run the booter_load firmware...\=
n"
> +            );
> +        }
> =20
> -        dev_dbg!(
> -            pdev.as_ref(),
> -            "Using SEC2 to load and run the booter_load firmware...\n"
> -        );
> +        match chipset.arch() {
> +            Architecture::Turing | Architecture::Ampere | Architecture::=
Ada =3D> {
> +                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_me=
ta)?
> +            }
> =20
> -        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
> +            Architecture::Hopper | Architecture::Blackwell =3D> Self::ru=
n_fsp(
> +                dev,
> +                bar,
> +                chipset,
> +                gsp_falcon,
> +                &wpr_meta,
> +                &self.libos,
> +                &fb_layout,
> +            )?,
> +        }
> =20
>          gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
> =20
> @@ -312,16 +388,27 @@ pub(crate) fn boot(
>              gsp_falcon.is_riscv_active(bar),
>          );
> =20
> -        // Create and run the GSP sequencer.
> -        let seq_params =3D GspSequencerParams {
> -            bootloader_app_version: gsp_fw.bootloader.app_version,
> -            libos_dma_handle: libos_handle,
> -            gsp_falcon,
> -            sec2_falcon,
> -            dev: pdev.as_ref().into(),
> -            bar,
> -        };
> -        GspSequencer::run(&mut self.cmdq, seq_params)?;
> +        // Now that GSP is active, send system info and registry
> +        self.cmdq
> +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
> +        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
> +
> +        if matches!(
> +            chipset.arch(),
> +            Architecture::Turing | Architecture::Ampere | Architecture::=
Ada
> +        ) {
> +            let libos_handle =3D self.libos.dma_handle();
> +            // Create and run the GSP sequencer.
> +            let seq_params =3D GspSequencerParams {
> +                bootloader_app_version: gsp_fw.bootloader.app_version,
> +                libos_dma_handle: libos_handle,
> +                gsp_falcon,
> +                sec2_falcon,
> +                dev: pdev.as_ref().into(),
> +                bar,
> +            };
> +            GspSequencer::run(&mut self.cmdq, seq_params)?;
> +        }
> =20
>          // Wait until GSP is fully initialized.
>          commands::wait_gsp_init_done(&mut self.cmdq)?;


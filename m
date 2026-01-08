Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022115.outbound.protection.outlook.com [52.101.101.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6583643F481;
	Thu,  8 Jan 2026 12:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876108; cv=fail; b=V8J2EjAhgDOz2RCEfaNt1jvhs41yUYLnRplxh+SdgaQUCSN/CO3oy7amLLz/RhEDnl5IBzgrm8eyzdzCvGPjvCTWKdnOBWdzUQdexrNW21sKS124R/qntJ5FuP3Ax8Uy60oOYBcdmkllW6oWq+lFVnCYnmHVd9sPnbqBhzI0cDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876108; c=relaxed/simple;
	bh=jXznZgn8nTWLPS3i31u2RdEL39PCA9IwI+zCkepoGmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtkNPjN7gN/RXeCNpnNOU2DhsbbO3uvHZZkQHYXU/iGOcQVxrHXs0biZbEfGx/TiUGfFAmvbWJpWGYRfThniymJHNS88kV187XLa7JaxXwE2ctOYzdjt8e8XaYbwxEmNgO/Klz2iZuHy14rZis0IcliZmKdGzMAIWdXfOfTfLGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=R5Shc3r1; arc=fail smtp.client-ip=52.101.101.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="R5Shc3r1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvBmOzkHKqATu11jFiOINBiM39afjCPEa82A8Pq9nSMeFfKc9FWVFcuomVwHS1IfSZSS9DYNtEfnZZlMkzW5J0X6PGFOQWJ0ua0DLe58UvXTlXCYXlXupcC7fhzRlRrsntZT0wZlS7in1WIvxmOu/ofe4Yi3PWiH11yIst9Ck7L80Mq5Y+XnN9+H+9i5aIUNylLCPPIJYg7knPUpOg9FrqRQ7O5aYQXOkZIlJha89mzgUt9Un4OJDQik3ixQpt2YjyAf/7bwBIqUs/F2F/vVTO1PJw5iDY5G4HwgV0aCcittqy4GMxqnmImSXBiJ3vM01XJ41CDx9vGo4U4V8D1lRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcr0sE0bSdZksxXCVPpCCTqdw+/5nWewbsiSIwnaPt4=;
 b=r4hI7n38CdonEEABlbrxMFeuXR8g2rlZiuMxqC+3RO8vFSf+YVog5PQDoUwf0/mBhbYFyFdbfdvZlbPszBygZaHiTNpu9/XMZ1Qf9ISlvtj39yAfr3nTQz3PFQVDejUaAGClVdUmDRYoO4v0QnsbMkxubqilaYH75Jl8XEfdcup8a1vzh2uVWCjdBP+ckP5bYItl6MD0bvWvSwo5J0juT9wK6RMloln11up2GtWAxSiqODD/nGR2OgN8GMdgtkuHDJGL58nmfai7kV8ODk7CL1Q4PC9z25ce8RX5bUk1+199YZnAqlhNCyTtQ2nfphgoPZhPWnQkx+CcTCJQox1lsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcr0sE0bSdZksxXCVPpCCTqdw+/5nWewbsiSIwnaPt4=;
 b=R5Shc3r1yj+feqHyG2ju4n6gzXfHQHZ6tp6+agXNNWbCnXZdcmYQY+yiZGlhR9fX7LOnTjlnHlT1bCvreRGI6xcfyIwx1/IoL5raYtdt0LPjw4fp9gyPhnrDad00R+BPAz+Bd/69aN3ztQ6XV5Ie35CGw6IwT9R2ObJ41YU6c5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:41:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:41:41 +0000
Date: Thu, 8 Jan 2026 12:41:37 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Igor Korotin <igor.korotin.linux@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
Message-ID: <20260108124137.22c32313.gary@garyguo.net>
In-Reply-To: <CAJ-ks9nbPTQojM-QcHPKv+NdUHwaRbBRVqzJ3CwgQTJTuD=bRQ@mail.gmail.com>
References: <20260107161729.3855851-1-gary@kernel.org>
	<20260107161729.3855851-4-gary@kernel.org>
	<CAJ-ks9nbPTQojM-QcHPKv+NdUHwaRbBRVqzJ3CwgQTJTuD=bRQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fa2a5f-d360-4a1f-0da7-08de4eb34615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlZFTkh1b0FyVUg4b0JPWVgvRXB2M00xQXVDSXhnYk5FN3krNm02VFpZY2lH?=
 =?utf-8?B?SnF5ZWFTT01JSEVpem1KSk03by9sRWZ0Tk5WZ3ZKNFZjb2VTZ2tKV1h2RThm?=
 =?utf-8?B?V204bTh5bWtPcmhNTkVnZUUxbnM5R3daSWU1Z01RSGt6NTJZV0svcUw2clNZ?=
 =?utf-8?B?NWhiTFkxbWEvNlEvaUcxTFZFMjFBNUc1bDhnNGJTekViUDhxbmkrTUtTdzFh?=
 =?utf-8?B?THhCckNKejJrMVQwSXhZZVA0NWxpMzVORW8wdUVLMHoySEgzbndnZEt6ZDJK?=
 =?utf-8?B?dDlOZmZKdU1LdDBPTjdYRi9EQk16MDlLbjlFL2xpdTNVMmRvVC9heVlnVUNZ?=
 =?utf-8?B?b2dSMnBCVWV1WWV2VWhadjFFdVZWSCt3R2VObUZTQ3JnT29ia0lPTHUrR2k1?=
 =?utf-8?B?Sm5xZU14UUxDcW8vZW5XekFrU0ROQjFEb0d3MXFQQkhoUTlwVno1eVhjNnc5?=
 =?utf-8?B?TEtzTVpXaFUyK3NhWjRzUXIwb0ZnbVRROHlhclRsSGE4bDgzcEhCMGZEd0Vr?=
 =?utf-8?B?c1ZaR1dUQkRRTmNFTUNHOGpOQjVRcW5xaVcxQWdKbyt5SDhrdFVtdVNGbU5h?=
 =?utf-8?B?K0xheVJQK2ZERDVZSGkvSXZUK21id1ZLNHF1ZVBvUTBHTEhad3pPbk9hNnVz?=
 =?utf-8?B?M0NrcFdhMUdUYmhUQnFTajdJczFCMjJJVXhqbkU1WVZFcUVnWTliR3VnZW1i?=
 =?utf-8?B?T05Dd3U5dUtkMVdWOHBkL1pjUEs2anN2Z3hVTkV5SGMrNnI3ZGxjb2owSTEy?=
 =?utf-8?B?M0h6NCt2Qm5jYUw2M1VaaEI3T25tdnpMNWxqYnNEb2xURXlFeDRPMnJQekRh?=
 =?utf-8?B?UG1KejhZMDNpckJKRWROdTNNMTQ3MDdTd2laMURqWXJoZWhSL2ZzUFNPL0py?=
 =?utf-8?B?VEMwb3RsSElFMW54NEhDQmw0YVFSTURwMEpadVRacHpNcjJjdjhwcjlyZkY2?=
 =?utf-8?B?ZzFGTzZKSGtuV0NCcncxVjhzN2FpWWZhS0VyU2E4MXp6dmdZUmllMzhOcDNI?=
 =?utf-8?B?OUVQdURSbjVBcDUxVk5QT3gxUS9jYlMvbEEwb0tOenJ2MCtUQjZsUmFWYW5W?=
 =?utf-8?B?bVpqM28weG1iRm02emkxRnFxYkJzN0UxWFZ1dkpXdGFhUVd3U0ZhZmZTYlpB?=
 =?utf-8?B?TUVBZSt0UVhML3pxV2NKWm1NM2ZhM1ByQmFCeUwrSlBJUFhNY1lINE56OThG?=
 =?utf-8?B?ekE1TXFYOVlnY0RmNDFNSzNDWHFRNzAvaWpzUEVTV3Y4ZWs3T2tZY1ZrTHRW?=
 =?utf-8?B?QlZSTWNaZmNvVlIxWTNOVUZGRnV2K21IeW5STlhGMHF1dWNBNUhvVDlHdjNL?=
 =?utf-8?B?Mko0Vmo5VHVueEcxMXBQa1NJOElvdkdaL1RLd0tpN0d2T24wRitNeGFBandC?=
 =?utf-8?B?UE5ENWdldG1OT0dYcVN0ZldPWWRqdGhCdG9hZGFjS3k3N0FJR1Yxemg1bXVI?=
 =?utf-8?B?NmpEd2xSbVh3SWltbGpjdkRqN3RyZ1h2ZWdCcDhqcnBwY3BBdDRHSkZLanI4?=
 =?utf-8?B?RFFFeXhNK1A4RCtPd29OeHdsV0R5Zk56QjdlMitOZFhPdjZrZURqcDhoNUVn?=
 =?utf-8?B?U0NlRmZtRm16WVphMzdrWklRWmcxSEJoTnZJblEya3JSR0diems4WTd4Q3Ix?=
 =?utf-8?B?bm5yTHN1Sk5ySFc0WUdBL2VOcy9HYXlMNk92Uk5JOXZtc3VtVUYzRkFSY293?=
 =?utf-8?B?MVFPTStRaGVFTUk2Tk1yT2Jxc0NEVjZkRnhPRE9ha0xKSlltdGlPSVhyNlNh?=
 =?utf-8?B?R0N6U1hUc1hPRjByc01CNlA2bGlZYVYxdGFKNEVXQnpWbjRsbWpicmhxL3pB?=
 =?utf-8?B?QTA2YUEvckpoRmN0cktLUHZEZ0U4VG1POVhpT2s3bGg3MXF3azFOSFdST0R1?=
 =?utf-8?B?amtVTWFtYjJYaUhBT2hsVUczUTNBRXduUmRIdDhQaTRUNC9FN25VeDhubW40?=
 =?utf-8?Q?5zu89IOR81c7pl5VTypGlH9jJuOanFfF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WExlTWkyanl2Q0xLQWFXMUR5cEo1by8wWjN5d2JuUkMzOVFnV3MrZUtveXFB?=
 =?utf-8?B?ZkJEMWZ2bHo5aE14aVRTN0JaY0NDZTZjcWhSUzNsZnp4MDRUejUvQ3ZKSG52?=
 =?utf-8?B?Z3hvUUpBZGZVbjRkcTFTeWtDaElOQkxhcHNXU2pyK1FCOGFpdVY3c2J6OEx2?=
 =?utf-8?B?c1QzaVNSMzFpUU9hUE9tTUlVVmJLZjV1TW5mSHg2bktGSHJSTHlvdnFXa1Ur?=
 =?utf-8?B?SHlYMGxzVGdNc212UHozazNJaVh4cFRVZG96WlArS1V3azhXN2FQUXBFS21H?=
 =?utf-8?B?bFZFeUMvZ2JGeFR1UTFFZ3pDZFVrOWIzbHMzZGwrYnY3ZmtjMDRpNGtUWnds?=
 =?utf-8?B?S1pXZFVDMWVFVWNxTzNkTkRLaU12aDI5MXdPT3ZSa0pFK29XWHB3Z3JpQ1FD?=
 =?utf-8?B?emNGRVc3L0FRcVZHeTVJVVBzS0JLeUp4QmV3TjlxZ2NCNFpPaDZTWEcrd0c1?=
 =?utf-8?B?NTF5UWptVWI1b29xSkdzWE5Pa2xONE1TMzB5NEhFcGl2SmJ3N3dzSnNILzRt?=
 =?utf-8?B?TFFIQ3kxaDRHdFVHSVdpUEp6alBEMzZNSlMzb2pocVFKK0s2RGdrWVhyZVpn?=
 =?utf-8?B?U05SNVVmcVRPelh6aUxnKzZsdGswbzRaMXVLbmdVUEJCb1dNUkFqSllsdU82?=
 =?utf-8?B?RHBMaWZKWDVkdUpSSmUwUDlOMFBBQmJRZFVkREk3VUxHT2Z6NDljMnlOeERp?=
 =?utf-8?B?MGI4K21VYzdxV09VWlVYYzdPYmRvbDJ5L2w4UjUvamttSVE2ZzRpZlora3hv?=
 =?utf-8?B?MjV4eXB5ZmtxY3dyZVYvMExHa1UvNEN4d0RQeWRaL0RtZFdHUk1odHRLVGlr?=
 =?utf-8?B?RzQ2anEzWTMxajhVZWlsYlJvcUp0aDNDMmp0bmFORWZPbGdSQnBYenY3U3Nq?=
 =?utf-8?B?U1dEZUtlL2cyczE3V0Z6WHpTekxRL3VGaEpPSUdzWTluTEd3Y3Z1S2Ric0ti?=
 =?utf-8?B?aTNreHdMMzFXaGV2dlphMWxFMzBkcVUydFpYSVFUUjIvdzFReU1hcE9xYTI0?=
 =?utf-8?B?YWIzY3ZEU21FVG1LVnNLM2hnWlQ1eFZ2Wi9rU1VwazdvVjZXdEhhQTJVVkRl?=
 =?utf-8?B?Qy9abTU1QjhTN2pkaVJabHovL2M2SFhnVUhycmVIY2UzZHNNeWdud1YyTDBn?=
 =?utf-8?B?U2YrdThHTHhnTXphTVd5cmNRYnAzMXBPMS96QWh0eXJqSmh0Nko5ZnFMdDNE?=
 =?utf-8?B?Rlh5b2hiWFhNOUZlbEJQc1FUd05QSFduVEgzeElpR3BvbVN3UmtSa0pNajBE?=
 =?utf-8?B?enBKQzdqc0VTa1hnY2paUU0vUVJ4RjhiTzlGUVRwS2tWL05CR2s1V2ZvNjBV?=
 =?utf-8?B?ZG81WEc5Mktwb1BneXpZQ0R3STV6NVEvcC9TTWZoenlnUzRFdHM1ZjRzZ3Fv?=
 =?utf-8?B?Ykt2bXpXeXhmRTFpRjBJbWFZZVBESlFPdURqTTVvSEllOTRUTmJYVjhuZ0w5?=
 =?utf-8?B?YmZITG4rTE0yemlhTFo3aGFvd2NUcUZic2NOYkYwSWgvS0pwb2taWHRiRWMx?=
 =?utf-8?B?UUc1ZHlaVktpR3NQd1RUc2ZEYkIyYTV6Wjg2RzVLWFJRa3JiaTlHMXYvM0Vw?=
 =?utf-8?B?OGVDOVNYalR3NWtZbUdzTmJvRUVERVJOTXVGaUZIMzBJNEdNeEdBTkxXTWJj?=
 =?utf-8?B?cjdINnhGS0pDdUovL294VXJWNFRZU3I4dksrbGJxaThTQ2x5ZEVGcnRkcHlF?=
 =?utf-8?B?dHF4Z3gvMGdXVTBTZkkrM0lNUzZzei81RXBOdzM0MmhCS3RGSXhNWmZnMDlG?=
 =?utf-8?B?a0tqR1AvYXRQckY5ZzZIVGlnOHl2c1lJNHZHL3gvZUozaWNIYktSbC9iWkpM?=
 =?utf-8?B?Wnc4ejNJMTNwMXB0VnJ4Qld2RTJxTGg0TmEwc3FrbFNDSXJrYkxFa2lJZTdw?=
 =?utf-8?B?MlVsRUptbnZUYUlhblIwUW5yY1FOT1FGcnhLbllPL01RbTVOQzJFVVUwWnMr?=
 =?utf-8?B?L1Z1L0swMlFodjc5dFZHaE1nOXFRQlBMNXpBZThyTXF2SG80VUdiYmtJaE4x?=
 =?utf-8?B?ZXB1TndwTHFDVWNQS1lLUzZCcGtQSGkxemlCd0RYZlZJekdlY0lZcUMvcWVX?=
 =?utf-8?B?TGdlbXM1cmpNUlVLQkFweGM5clJPSUcxQnUvRGZ5TlVwMklFaDNCa0xsR0Jh?=
 =?utf-8?B?akhYSFhsaGxtYlhUVmZCeFUyL0ZFMXNjOEZ3Q00wWFY2QllsWnNhRzdZWkF6?=
 =?utf-8?B?RDVzdFFoTGt2djZhUGRCMWVTMHAyS1NnRTd1Nmxpa1MrUVNKNTNISmR4aFNh?=
 =?utf-8?B?QmVtMGRMb091YWZ1Sjc1eW1KZElUQnpqeVNHL3RPOXVVTW5EMm11ZFVieHo4?=
 =?utf-8?B?SFRIR2ZhUHhIOWx6ODRFa2RucE9jQU5hV0tEaVNYNWF5M2V6ek9RQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fa2a5f-d360-4a1f-0da7-08de4eb34615
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:41:41.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LeJ/pj8nmIfgWPj1RVfoyZWkZDbC7njIYs+3Jp2FFTGcK5CrRoGrUtHDC51x4taLHcbOg4nC7RbFwCuLTfsvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7076

On Wed, 7 Jan 2026 11:48:28 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> On Wed, Jan 7, 2026 at 11:30=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > `#[vtable]` is converted to use syn. This is more robust than the
> > previous heuristic-based searching of defined methods and functions.
> >
> > When doing so, the trait and impl are split into two code paths as the
> > types are distinct when parsed by `syn`.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net> =20
>=20
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
>=20
> > ---
> >  rust/macros/lib.rs    |   9 ++-
> >  rust/macros/vtable.rs | 163 ++++++++++++++++++++++--------------------
> >  2 files changed, 93 insertions(+), 79 deletions(-)
> >
> > diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
> > index a67d1cc81a2d3..a39bedb703973 100644
> > --- a/rust/macros/vtable.rs
> > +++ b/rust/macros/vtable.rs
> > @@ -1,97 +1,106 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> >  use std::collections::HashSet;
> > -use std::fmt::Write;
> >
> > -use proc_macro2::{Delimiter, Group, TokenStream, TokenTree};
> > +use proc_macro2::{
> > +    Ident,
> > +    TokenStream, //
> > +};
> > +use quote::ToTokens;
> > +use syn::{
> > +    parse_quote,
> > +    Error,
> > +    ImplItem,
> > +    Item,
> > +    ItemImpl,
> > +    ItemTrait,
> > +    Result,
> > +    TraitItem, //
> > +};
> >
> > -pub(crate) fn vtable(_attr: TokenStream, ts: TokenStream) -> TokenStre=
am {
> > -    let mut tokens: Vec<_> =3D ts.into_iter().collect();
> > +fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
> > +    let mut functions =3D Vec::new(); =20
>=20
> Would be easier to propagate `#[cfg]`(as in your FIXME below) if you
> collect the generated constants into this vector instead -- then you
> can do all the code generation in the `for item in &item.items` loop
> where you have all the attributes.

This is a very good suggestion. I tried it out and the code is much
cleaner. After making the change the `#[cfg]` change is just a few lines
too -- I'll include the cfg change in a new commit in the next version.

>=20
> > +    for item in &item.items {
> > +        if let TraitItem::Fn(fn_item) =3D item {
> > +            functions.push(fn_item.sig.ident.clone());
> > +        }
> > +    }
> > +
> > +    item.items.push(parse_quote! {
> > +         /// A marker to prevent implementors from forgetting to use [=
`#[vtable]`](vtable)
> > +         /// attribute when implementing this trait.
> > +         const USE_VTABLE_ATTR: ();
> > +    });
> >
> > -    // Scan for the `trait` or `impl` keyword.
> > -    let is_trait =3D tokens
> > -        .iter()
> > -        .find_map(|token| match token {
> > -            TokenTree::Ident(ident) =3D> match ident.to_string().as_st=
r() {
> > -                "trait" =3D> Some(true),
> > -                "impl" =3D> Some(false),
> > -                _ =3D> None,
> > -            },
> > -            _ =3D> None,
> > -        })
> > -        .expect("#[vtable] attribute should only be applied to trait o=
r impl block");
> > +    let mut consts =3D HashSet::new();
> > +    for name in functions {
> > +        let gen_const_name =3D Ident::new(
> > +            &format!("HAS_{}", name.to_string().to_uppercase()),
> > +            name.span(),
> > +        );
> > +        // Skip if it's declared already -- this can happen if `#[cfg]=
` is used to selectively
> > +        // define functions.
> > +        // FIXME: `#[cfg]` should be copied and propagated to the gene=
rated consts.
> > +        if consts.contains(&gen_const_name) {
> > +            continue;
> > +        }
> > +        // We don't know on the implementation-site whether a method i=
s required or provided
> > +        // so we have to generate a const for all methods.
> > +        let comment =3D format!("Indicates if the `{name}` method is o=
verridden by the implementor."); =20
>=20
> We're already quasi-quoting below, does putting the comment there work?

The comment has `{name}` interpolation and you cannot just use `quote!`
for it.

You could do

	#[doc =3D concat!("...", stringify!(...), "...")]

But I think it's cleaner to just use `format!`.

>=20
> > +        item.items.push(parse_quote! {
> > +            #[doc =3D #comment]
> > +            const #gen_const_name: bool =3D false;
> > +        });
> > +        consts.insert(gen_const_name);
> > +    }

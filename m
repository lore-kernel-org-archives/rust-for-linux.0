Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021099.outbound.protection.outlook.com [52.101.100.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289125A2A2;
	Fri, 23 Jan 2026 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186926; cv=fail; b=tsYENXoJnpIu+qYUi+Jvx5+8bwhZeNx/15alxDuEYfHYtd/HKcIrfduTjmrpu3VzyeHU7DPw0+zkAdohf9EXYLfIqvQk4QS9wmuFXxo0I9sDUN7joCiGykRUXGeZW0Uk3XX0LDvHLTXJNvemfhIfDLrXjn6jRgaGEhbyXIqiYX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186926; c=relaxed/simple;
	bh=N7iPGhzWkd+NxfXNSGLOsFyeKTtvdOLSx9ttBlRwMNE=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=lChmk7AT7NYPKtyy4s5TxT9NcDOVEg9H7HOBmGDLibqh6tGOPkf6cRAq3B49xb3vmaMNsEkpvA9AizFZChomSscK62aPtmBf8WlwJoNJizOhGVxRyjiGRPQ2yPSKnA0+HmjN5BQUVKMfW9s5+RUZ3Ahp9AIxZA0H92X3Aei0ceQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ApFMnKG0; arc=fail smtp.client-ip=52.101.100.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ApFMnKG0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9N1JMrzzU+jISQlYLhAWr+TcAOnyK+ClSTCvhHnyxA3L+XdPkTQSeU5rv8rCRNxOoYkez/W/B2KD5+PxVHOYsN10bjgmWERNOefhR8GLFjkNJQR8GEEWaSiBsOsd4oSuwHrlCSYubIPxGq1Gi1SZC2sMsbrXFdeXQkjdmBEcGMwj2C3iWXz2X2vEK8uKVUnwBCC26DDuawTgBDV4XsisJlu4Ctotp2ohu8zXEwY0RGzo2tDUEPreBqTwVuOHLpwC71wc/s/fuUYhOR4UEqqZ/+OURCnu+gesGBEn8Fy0HSLL+V03UwVigKMPrxJzD4jRxW8erdj1WreGACWb0SI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49yYiEvw85z5Q5MwrG2Tow4rKC6ffU3zqcSGStIbOis=;
 b=w7ekMhTzV+rgY1rAN4/u9pmrmiYcsC8qQbB2a0hhf3H00Lqr7L2ms5+OWYM4vUrVlTdcOgEO57JUsagOv3mTBrwpHJXYL6yQzBdx7dkicNk8Jp+9LdmzZSkJVyAjiZxr3xusrtCpFwrI4484tSb3Bc4mqIMppOUvw9TgYTw+9WmWmdajqDwUAxdGE6edcRRkeCxl/c5PCUPGUAKyyD5Nv7X6vFmwvgxevn0sFr5qVsPm7cFMZXeJoP+Z6Y+ilhKpAwETHgey+KLEGMp3d+mNsEL+wB+dY8ea5xcxFf7DmyzJOCXFpQFDUjkbfQ6ZFRxU3DzYivZapnIhdBrZKuu15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49yYiEvw85z5Q5MwrG2Tow4rKC6ffU3zqcSGStIbOis=;
 b=ApFMnKG0b87eCAmZhWeOUMN8DZ4lvxpC4ntk/XorNoTmpT5VHBiUL/JqrHaTiQPUWeBVNzn1H+2g/u9yIC7gqgr7pZR+Bjhk5k1cUXpOgi7CmIHQZQv6aRiM0mOgC7nQChf78szNrdz3WqqryKF3f6t4aEMS5MOK3jCdm/4FX/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6069.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:288::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:48:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 16:48:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 16:48:37 +0000
Message-Id: <DFW4F5OSDO7A.TBUOX6RCN8G7@garyguo.net>
To: "Dirk Behme" <dirk.behme@gmail.com>, "Beata Michalska"
 <beata.michalska@arm.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <aliceryhl@google.com>, <robin.murphy@arm.com>, <a.hindborg@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: dma: allow drivers to tune max segment size
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260123131308.3218421-1-beata.michalska@arm.com>
 <70412586-7b40-4230-bc21-504a865e3376@gmail.com>
In-Reply-To: <70412586-7b40-4230-bc21-504a865e3376@gmail.com>
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ca1adc-5d61-4a4e-1ddc-08de5a9f419b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTN3SmJEb3I4MVUvZEgwaHQzL01ldVVTOVUzc0N1VmlQcEV0bURFVUt1Q0l1?=
 =?utf-8?B?ZTlEYWtyZVB2YnhSNzhud2wxVGR3eDBKaEt3alMrYlRtSW9JTFZhMzluQ05n?=
 =?utf-8?B?ZWZxc2FIVHovTThpdVlVTDQwMUJEUHlxcC9sTGdKM3FvaXpub1ZsUEZnQ2xz?=
 =?utf-8?B?TDgwNGhwRmFIaWdkaDFIR2YvdVo5ZU1vYWxmUEYxWFNMNE1yTWJFZUlXdW5S?=
 =?utf-8?B?Y2NvbGF6VlowdFNHMWdoMVAxeHo1YkIwVTg3d1JzRWI3Slc0TWM5ZDViMXVQ?=
 =?utf-8?B?NkduOW1OWlpPSytpVXBWY2hXM29KTHJsREY2TTk0Wmh3SVphZFU2aTV5SlA5?=
 =?utf-8?B?UHZLYTViR01ScFZ3V3ZFc01QQ0xyWGZYSDBibURseXBUN3h5dEJvUkRaMUh2?=
 =?utf-8?B?eDZ2d1VvMmljcFN6VlEvS2phdStoQTk4WDJuS0YwTC9mNTRXVUZXY0c3Y0dV?=
 =?utf-8?B?T29NVjIzNG1PN1FzdjhXNGZ1MzRYaVpxQkFLeCtaL1lDNFZYTnhJbm5vblNr?=
 =?utf-8?B?TkdhQlVubFBET1Zuc2RobUFRZ1dUY0tmZVRWWmg1MFd1UEp0OGI0T2hmazFu?=
 =?utf-8?B?TjF6bDQ0NndRWThTM2tTUHZubVhoQ0lnZEI1MllFODkreWdpVXZyQ2Q2ZnNo?=
 =?utf-8?B?Wm9PMUhReENSaUU5djBRT2hRMUlMNEtTOVQ5S2RmV245amJ0ZVZWYzVBREZY?=
 =?utf-8?B?dHBNemJCZURjQjM5cjNqWXloRUszQWt0LzJ6K1l3T3JGbHhWMjRQLzJ3TXZl?=
 =?utf-8?B?YWR1MHpMOEJqeG1PYm9SNSs1NGhSUzJJQ3htVUZHSlYranZ2dmFzQmh1UmJ3?=
 =?utf-8?B?MUlWMlNqM2dJYlp4OTJBYm5abnZEUkJ2SEppTDRCS2cxV1Q1OW9NcThBcWx2?=
 =?utf-8?B?eE5GMGdTRVdFTW1IMDFXaDNBMUVkd1lKYzRabmp3Y1NESnhhNGpkVGZBTFFF?=
 =?utf-8?B?c0xYRXVmR2NvOEhmZlM5U2J5ZFBocVVtWGxNZ0QrQmx6dUpFYzIrVVdYSGsv?=
 =?utf-8?B?bzZVSTdDYzUyS1FHMGRzZWNiM21JaTRxS2xWSkN5Wk1XcSt4YkNBcmN6NDB3?=
 =?utf-8?B?cldMMHR4QmZqMzlwclZRbUFDbmpqaU1RbU9zeTdPTFd2UGpkcWx6UUJXSXFv?=
 =?utf-8?B?aEpISmxQOGJRODUyV0ptamtTWFlaS1dmZGpyUERESG1RbklFd3V3eHg1c0xM?=
 =?utf-8?B?YlFYR3UxTlRlY2pOaisyNmhEMWRHQTdTSjVHVEdHQTdJMVN3YUdKcUhmQ3ZL?=
 =?utf-8?B?VEw5SW44NmxRV1BXeWZiQkx5bFUvQzhmaHFvdnpsN3hoeGNUUG1kRlU4QitI?=
 =?utf-8?B?dXN4WHB4ZXBSbmhGeXI0djZOTkhJRHJRRlhUSTE5VGQwdkt3dmduV1B0L3pY?=
 =?utf-8?B?alNvenBmYWd1elE3WlNjSk0raGpuWUVSK29IdEQ5OStqd0JnK3NhMEFqR3cx?=
 =?utf-8?B?S0ZGbC9ka2cxYU5GVmRuWTErSmZKWHpsNXFwbGh2VkQ3MVdNZms2RDg3dVdZ?=
 =?utf-8?B?elVWanlKUGhFWFZEcWRpTlE4a1BwQjBxREpRd1NqL0JZZW5DczdQOHNzTUUx?=
 =?utf-8?B?RjdqZDV2dnh4Ymp6T0YyQ0dmTzN2cUtuOWFpZnVxTWVCOUpiZ2c4MlU5QzdO?=
 =?utf-8?B?SmpsbTVZWXFKbkpaQnB5TGdWeFNSN0N6OXJvSTBxeXpzSDUrUVBPOHhrcSto?=
 =?utf-8?B?MDkxMEd2TmV0MG4rU1pkNUJrN2d4a1RLUW1CQ096S1g4RFJzL2pOcTBUc2xW?=
 =?utf-8?B?SXFYSjZ0cXRKUHR0ckYwZUVMRSs2VCsyYTJUU1hZc0V2UTFhamNyOXhZT3R5?=
 =?utf-8?B?ZHFmNzh6QTBmelRCVFdQaXNvMlpPSHZ1SWxEYXorRFVZc05pSE0zZm9hS2VL?=
 =?utf-8?B?a0xLaURqQUVEeHNFR21acE5TaVJ6M25WZkJUSGlQaEtXbjgrN0VVRDlmUW1G?=
 =?utf-8?B?cWFQc1lHZ0VpQmZRNytpcmVYa3FSU3Zadm1rQldDNzRhckNBc1JIcU13TlR1?=
 =?utf-8?B?RzFlZ2NVekhFZ3JBeXNMNCt6bEpuc2oybkwzU0txK3VlZmU5TGZYQTR6Z0JQ?=
 =?utf-8?B?QWY2MjBQNzVkUVh6SE93Q3k0QlVybEZrbXFCVjFGVHVIajg1enI2SGdhNCt6?=
 =?utf-8?Q?UOvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEJlUVY4bDRlZ05idlphUHpQVnNCM0RwTXM1cVVMbkVETjBFWWs4MVNVdWNV?=
 =?utf-8?B?SEhCY29VK0pKc0xaQktiUVVDb1FMMzhrNkVKSkN4V3U1dmlKanJUMWxHTmxT?=
 =?utf-8?B?a2tDSFJPaDFqRitDZWdTWEZUcFhCNGxyOHZielZTc2hlUHZyWG45c1pLcHlM?=
 =?utf-8?B?MlBuY21XT1JCLzhkVmVYajN1eDR3SWlLeVg3YWxjcjgwVmdncDJWVG5VUXdJ?=
 =?utf-8?B?MldaRG8wSFpndDRjbG03bytZdm5iRW1zUVQra0ZBcGJYQlBJYWpkTlZqc0xx?=
 =?utf-8?B?Sk01VXZyNGhDbnRZeS9qa0c2OVp4T0RjM1JkSitLNlFwSTBSODVLcFNFVDR4?=
 =?utf-8?B?WkZ1bkUvMlp5SkxlZHBKdXFaeVNhdzJza25OM0Vqa2w5TU9CV25SS3d1M2xJ?=
 =?utf-8?B?ajZyZXM1VEEvWTVQK3FuM2p6SFZmVklvODkyNUJwVWIrTStlV1NlTG81enIx?=
 =?utf-8?B?Z1FvM0xMSE5jeTVxMVFUQmpxeEJZelFHTFU3NzBGZWluUzNEbkFhOGRzNlJt?=
 =?utf-8?B?SWk5Y0QrYllFREJYT2hDZVF1Q2p4N1krb1Y0ZnhVeUlCM1RGVUYwYUxCN0Yv?=
 =?utf-8?B?ZHpkbkI4WWhNRElFRTVIOWlvU3dsVDBDdzNEMmx4eUdubHFEY1FvcG9lVFFD?=
 =?utf-8?B?b1ZISXF4QUt3VVZSOWZjZ0EwTWEyd3V6WVRZcVV5NlpqS0FOMGU5ZGhFb2xk?=
 =?utf-8?B?c0UwMGxiL25LVXhhSGFaeXdKendNcmJzd2FuaDhJNmlzOURkM2RQa01pSzk3?=
 =?utf-8?B?bnZOMFJoZ2VsbVlYV1JhQ2FiM0RzcVp4YmFqQW10OXBkSGlacjFaNDhYK3J4?=
 =?utf-8?B?dktiSklNY21nYnRYOENIYncxZ3Q5R3pVb3V6NExqbXJzZEd3L21CcTdXU1Z1?=
 =?utf-8?B?YkZVYjhxQmlPSWx5dlMrUnIxU3djd2N0NTdWcFpOMkpMQlBwTWs2aThKMzFT?=
 =?utf-8?B?eTVwL3hFNjhqbW1wdTFFTE1aYkM3dTFRUDJNUTNQVGlGQUhTZ3lxZDhucWF4?=
 =?utf-8?B?UDBZY01sWk5aa1hvNnNQaElCbjlWeGUzc1JaM091TkZSL3VWVlY2YUl5Y3BJ?=
 =?utf-8?B?N0JidDdlUnFVRzNrdVUvTGc2M0gvMHVZVnhubmprVkh3NTF3dE9EbGlqVUdZ?=
 =?utf-8?B?c2pqQkhtb1BTWnVoZU5iZHRCR3luZEY1aFF6bEZIbDRaNVQ5ZHU5aUs2dTAr?=
 =?utf-8?B?cTlGQkkxZ0gxUm4zeFk0dFpKUnFvNkY5cGVRTHQ5eTZPMDQxSVd5Vlc4RG4v?=
 =?utf-8?B?aVJ3SEVRRzVBL21WWG1NcUJDKzJXU3c5eUNRaUhxTEZDdWpxTmUzZEpsNjAw?=
 =?utf-8?B?S3BWS0NKazlOTnhFRGNDS0VGcDRDTG84M1gxczhMTnJESUZnL3VtektuSVVI?=
 =?utf-8?B?Uk9uS3F3V1VNNDJVYTF0YlpveDB5Rmo4aHVxTTd3czM2L3Rvalg3SzFvY3RK?=
 =?utf-8?B?OHJ6OHJpSy9scmM2TnBFQ1ZrV2h1bE1BbkpXQ3B0OVlNbVVaaTRPN054YUtn?=
 =?utf-8?B?cEJuZVEyMEJVSlRpdXlhYnZYZVgvTTBpYTZTd1FLenRvQ1lxc0h0bzBRNE5P?=
 =?utf-8?B?ZGNONC9ZdmVidmc0MEFUZytyUUQ2bzlONkUzc1ZvWGJOeVRsZDl5K2FUemQ5?=
 =?utf-8?B?RUQyUHpqb1VuMVk2cnp4b3VIQkhUcWV5T0lhdDhINUtuWFhOK2d0NEYvY2xO?=
 =?utf-8?B?UjVMdFZHbE5WVC9aZmtVaUI0QkphMXBZOWhNUWxyVEZVQlU2UWFydnc2ekRW?=
 =?utf-8?B?WUUzNVhYWTc0YTlJQW9VRTVJMGFrVlpxWVRub1EyZ2xRcisxeTRyYXBzTEtv?=
 =?utf-8?B?c2NqSmlwQ3o4cEdvdHVDdW9sY2FHd0dhWDJDZEt4UG9UNE9HdmpnaXp0SFll?=
 =?utf-8?B?Z2g3RFJuY004a0hReEZkb29rZXV4UTF0WFYrMnlJeFRGT1M0NWV3KzF1aGFm?=
 =?utf-8?B?Q0pNd2d6MkJjcks2NTgrc1FEQ2hsR1hLSDBSY3g5NGczVmFPUFJiSzBpTHpL?=
 =?utf-8?B?OGJCYnBVWmxDS0p0bThHd29zc3VpdkI5aWZRRUExVlRDTjVZNWtXOVUzMVZz?=
 =?utf-8?B?bEc3UXRDZnhhTStYZWJ2RW9EK1BHMVJVSU93OXNhWlpkamp6UTU4RFM2WEQ1?=
 =?utf-8?B?Tk15MEF1Yk92RzNPWVRxdjIrUzNubmhDVWRsZEJubmtpWGVrUzRmQXFuRk9S?=
 =?utf-8?B?bkxCKzF3TlhJTnR6SVpQc0d1bW40aUlIV2Y0TUEwQU1EOFg2VEZEb1VUM3dr?=
 =?utf-8?B?bGZrQVN3TWcxalVVanVvMzZaVDNVRlY4M214M3NjQUNPbmdUWWRqS0pKeUdJ?=
 =?utf-8?B?aXkxd0t3MVVtQUd1R3AwdnlTMHdkS2s5N09CejdtLytDa09keFU3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ca1adc-5d61-4a4e-1ddc-08de5a9f419b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:48:38.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X473SkE5S8MFRY0TvClIPGWTKxIBxjGVSul5N3SzuMiKnkycNx0+0b/2Pizi184GiWZi1tl4hyI73Bc9NtjwZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6069

On Fri Jan 23, 2026 at 4:39 PM GMT, Dirk Behme wrote:
> On 23.01.26 14:13, Beata Michalska wrote:
>> Make dma_set_max_seg_size() available to Rust so drivers can perform
>> standard DMA setup steps.
>>=20
>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
>> ---
>>=20
>> v2:
>> - Aligned safety requirements
>>=20
>>  rust/helpers/dma.c |  5 +++++
>>  rust/kernel/dma.rs | 17 +++++++++++++++++
>>  2 files changed, 22 insertions(+)
>>=20
>> diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
>> index 2afa32c21c94..220b9308830f 100644
>> --- a/rust/helpers/dma.c
>> +++ b/rust/helpers/dma.c
>> @@ -40,3 +40,8 @@ size_t rust_helper_dma_max_mapping_size(struct device =
*dev)
>>  {
>>  	return dma_max_mapping_size(dev);
>>  }
>> +
>> +void rust_helper_dma_set_max_seg_size(struct device *dev, unsigned int =
size)
>> +{
>> +	dma_set_max_seg_size(dev, size);
>> +}
>
> I was about to ask "please add __rust_helper" [1]. But looking into
> driver-core-next it looks like some of the function in dma.c have
> __rust_helper (from [1]) and some don't (from [2]). Is this by
> intention or was this an omission in [2]?

This is an omission. It's an also a relatively new addition which means tha=
t
it's not covered in Alice's series.

Best,
Gary

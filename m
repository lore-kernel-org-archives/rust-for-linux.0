Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021111.outbound.protection.outlook.com [52.101.100.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F2944D6AB
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925375; cv=fail; b=dbRYmkSXCp0zTJG6nPEa+HX7Wkr/iTFajeOFccjAp9ga/pXBIPkUU/9RJd0Ia/ORMjGMHf6udnWMP2oR7/WtRcNhXWe1WW9Kt0KOD9Ou37iAaL9UO2rc9zEUKZC8pXJBsA5MK6hElj/wM0TRm+lK0+g1L68u5FYy478hJ1vjM44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925375; c=relaxed/simple;
	bh=qIrY8AzuS5JSA94Qe+bZviDr0VZVJknQISSAWswSxCE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=qmvKq7Mzs8r3fEuoPl7KD7ZOX4DcrLDcAnfm4u1sBEbcAdxz9TKPajAQFhyjL1S0mpL3iO9cw3qW5zZDif9gIrY6SePI/5xprGXUtZlk3FzEbtZ/Qj+JQX4j1YE7bI79dTBawIBHrrWu/JgxrrHMtoGmeopcBvdgq8u435LlbrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ci/mmIi/; arc=fail smtp.client-ip=52.101.100.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ci/mmIi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBn32o3gdcDFohASHeS9N8tyjBwbXZXi2208VBiPlQ3VWRhRQFLNG5Bt2xcmbWVrrBAtajf6xNoVanzRwJVMyBY0rBPvlusB/0tSqw5nQv/pMxP4OvbuT6zRs2UMjYFRV9IHvU7n/4UwDKwLBecp0TNukWGfVEfYRjU2pgBTe/3UdLV5TEBGzUuNR5HNMrYiuFG6KsSb9gOUBCxhDI/6eKCLktMsdb53NUT19BVRC3mELHXtNDpV60iBFjXDKzDjK7aDdMFuICzwmn7zBtFrM1M3G8FfCDU54jozFUpIu4/WGubl0CPsLszs01DJWZSK4SNbNeub5us3HPWWfAInLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFq5rD7zEjh83QCLoX50YvtbG5FQ5bf9SBl49pqYu0k=;
 b=u9Zsir1FWvJxZ1qTXFCMXQoyw5F0KUDm22NHQ5rwvmx6K+NvN99+zMnJ24BBigEFhtLGpX167R5lpBMp6TO1Z2MCFUPighQDGeq5JUBT2Gtb9iqelMWh54iwCb4PZtRIVVr16bLoEcXnT+Ucn5YQC0ScZshk83UfBALb6Q9YUMN6lNrctgBwfxIpnsz84bZ4glGATJHSq+1J1DfB+9ZfbKaTxHFKRacaj8FZQDWwm6CtL20Q/WraVxXX458tIifU2ZEkL4ZGABIllTT9a9V9+/s5WCbjFbyPay/52FP+/LmjPbyElgDbDasWTzMhmdHfb4Y04vjj1uwazglza0KIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFq5rD7zEjh83QCLoX50YvtbG5FQ5bf9SBl49pqYu0k=;
 b=Ci/mmIi/0ZhJDtsWF0ZtpTHT7i/FwcXIOuzhwy6AXWe6AbIgKXGAnaUMKg6tBghfg/SxQjf1XrmnS/SY0GQah+k4yhFXdxzfdUURMrxyNPfrsnBl1nrSdV+jktDvh/ZVsbodIVx003dTvzsV/TvLckcLrID4Sni9Y4W+etnk36I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6688.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:307::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 16:09:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.012; Tue, 20 Jan 2026
 16:09:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 16:09:30 +0000
Message-Id: <DFTJPKIWK06S.3J0C75Z4RHUY3@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>
Cc: <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <dakr@kernel.org>,
 <frederic@kernel.org>, <gary@garyguo.net>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1] rust: time: Add Delta range constants for time units
X-Mailer: aerc 0.21.0
References: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
X-ClientProxiedBy: LO4P123CA0468.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a036b0-0707-4d90-41bb-08de583e4b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUppRm5CWUw1OXZrTXpqNFdDRXZ0SmtYMVNxUml0c0prK3BxZW5JQ2taZ0pP?=
 =?utf-8?B?RTVMdGpPUFkyUjZNTnlqYWNKTXFzdGlmMWdpNmJsc2dqczVjV1dEMHR3aXlO?=
 =?utf-8?B?cFdkcDJtbmgrY2hDdmRpNFFhb3RtWjI5Q3BlS2FWbmFQblMyTitoVGFuM0NP?=
 =?utf-8?B?Ni9oRzNKdDVtWFpnclF5bDVTTmZxc0FaN1Y3alZWdXhWSnBwUUxKK1I5LzUw?=
 =?utf-8?B?TGZMeDhXMlJuSlo3NUxXS2ZHNVpLV1ZyMC9IT1hKQ2JacFpkNjFoSkZTTVBi?=
 =?utf-8?B?WnAwSXJmTy9mcGx1L29oMzZYK0Z3SnJZWVNSb3ZhWVg5UmxERTBiVlZ4QjFO?=
 =?utf-8?B?bmwvSmMweUwyU0c3MTVKSWNiMW5uV0hycDVrMGJwZ21KOXduQkNZTHBLbDVn?=
 =?utf-8?B?RU1HeXliZmN5QXlmdG9OSkJteXlJb3J6K2ptSEhIU2IyWFVJVldaVmFiZFcv?=
 =?utf-8?B?elg1WnZTTHlSL3FtU2dLMXNuT05SbDdzY2JOdExJR0VtaitHbGx6ZXgwbUFn?=
 =?utf-8?B?RDduWTRqR1RDV09hM3ZXd05xUE10ZVNLL3gwdmpnM2xOSUtvTm1rS0tQeHhw?=
 =?utf-8?B?Y1Q0c0FlZHlvVGtsdHV2b3Via052WXlJeWdCQTh0NVJMK3p4ZTFIaU5JUVBQ?=
 =?utf-8?B?SVVadjNqanlNekpWc1AzR04wak5VTHpzcXFmeU5SRmVmUWtkTE0wa1dZLzZr?=
 =?utf-8?B?bW4xU1Iyc2tBSi9icTkxaUprWUJNUEk2ZkFwWUZhaXE2ai9la2hWNmNJRThN?=
 =?utf-8?B?QUgrbFdBZkUyT0ZHUzUzY3NINnF4SWloT3VlL1V2SytSd1BuUGh5K3MzNHVr?=
 =?utf-8?B?bTRPemo5aUlmUTAvZ0VoR0tlTGVqYkUyZTBFWCtxdk5abXh6OGlvRlFVUHdR?=
 =?utf-8?B?ek1lVDVkWTRheEpBbzd4aUViYnJqM1NlVTcvQVIrZ2hoMVo3Njl0Y1Q2UWMy?=
 =?utf-8?B?QzBTYm5DN3B2WE9ML1IyT0xTckVGNFgreEF2UHlFanNuTHZobE9rV3dPN3Yx?=
 =?utf-8?B?b016UFBOOU5qakFMeEJiRVdnQVR2UG9aanpJWUdzYzlvSDJ1azRCMlpTVDF1?=
 =?utf-8?B?Y05KTFR3ay9RT3dyRVkvQVRFTEN5ZVZTOEp5ZjJIdU1RY3R1VVd0RUNBeGRL?=
 =?utf-8?B?OFpwa1BZdk1IVndBTUs4dkUyL1gzeG5WOEJudlF2VWRKZDZMeCtROFRIZGR5?=
 =?utf-8?B?b2M4ZWdXa2lHb1dVRFZNcG1LeXVRcDc3RXF2T29kN3krOE5rV2E4T0pyUGsy?=
 =?utf-8?B?cVB2RWprcTQ3dFNIcW9kR3Nka21UN3N1aWY3QWRnQWlTK2M2TXJPVHZBOVhP?=
 =?utf-8?B?ZEd6SHJqeEVOTGFxUS9jSDQ4SHV6YnE3TU1XTGdhWE9tYTVhMDVycU1RUWJt?=
 =?utf-8?B?V1l5NXpWZnFRNTlFdllrS21xb1VVWWw1dlFxK2xVQW9NL0hXcUhJMW5UeTlT?=
 =?utf-8?B?azdVcVdmeDR0bm9qQjN3ZSt1bUlUb3JDYlBQbTNOUnJWeFlCVW1BMS9pNEhK?=
 =?utf-8?B?NjVwYzBrVUdPQTZPREFicmFUSGtTTXRNUUp4UWFONDl2SmYyV0JLVUl1REFG?=
 =?utf-8?B?aHFtSGpjaTZ2MndZT1FuUHFNRGNQM01kZUpqcldlZ210OU5yenNKUHRIQXdK?=
 =?utf-8?B?ZHdMcnNRNnVCSU9UUmpUNlpZMzNEdkxvZGlWNjdFUk9kQklnUUtrVGdJN1B3?=
 =?utf-8?B?ekdHUXF6VCtYNTRYd3VPVkplNnFadkVOdkFMdytVUEEyakx5RjdLcE5nM1k4?=
 =?utf-8?B?RkF6dThyUFBWWVI2L2psRHpKQy9KNWYwUllBTGQ2NngrNWhlR3NFZzJuRHEv?=
 =?utf-8?B?Z1FoNnAraUViT1A0bUdiVWVoZk1tbzR3QXp0QmkrZHhVelg1NitENGdXM2dw?=
 =?utf-8?B?OUl0SDM0SE1lZDFOSG02bml4RDFDNWpzM1c5QzFYY2w0NXdmNmxrK2NaNnJh?=
 =?utf-8?B?ZFluVk04NTd5MDVOSFRNZHR5UkQwaThhTGtPZmkybEgzV0ExUWN0UFE0MjJP?=
 =?utf-8?B?S2lSVWJwQ1ErWTd2WW9PUWNpQUc3SjZUMjZETlJpVWNOK0I1MWVPckpoVXFz?=
 =?utf-8?B?Q2IveVY4cC9LMWNRckt0amlJbEFmdDkzOXBUTWtCbncwOEg2aEdENzN5WHFW?=
 =?utf-8?Q?TTRs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZGLzNPbDczR1NKZVJreElJWHRJbG5OMGtQQzFWQm1COW5IdXRVRnBQcDJX?=
 =?utf-8?B?MGxSWTg0bytPWkQ5VVFYOHBWYkZHZHIwUHpLY01vdWkyaUhROVd3L283S0VE?=
 =?utf-8?B?OTIzWHY1WG5wQjFLUEhkcTdsMVM1V3ZUeDN5VmVzeU9SWGMrNlhsTHk4K2FI?=
 =?utf-8?B?L2JjbGJqaExFUjdKMzdLbU8xc2wvNmJIaCtqZHBFcC9VV1UwZTd4citCMFQ4?=
 =?utf-8?B?RFExQ3VSdGpQZmRkUXB2aGRrZ1hxZ2ZRL3Vyci9USXd4SytxQzRERGJzbXlL?=
 =?utf-8?B?ako5T3EwT0JYS2V2RVYxK29ONGJkOWdocjIyUEVvcjljbXRtVkZSTStZQ2ZT?=
 =?utf-8?B?Q1g5bUhaRS83L1dqcENoZXZvd3gwNG03YTZMWWxES3FXVmJmVU5VOUtNYnZN?=
 =?utf-8?B?Qms0U0Q4NTdoblhKbnp5a0lzaFhhNlR5eXdmK2NodlNnbE03bkVvTmVtMCt5?=
 =?utf-8?B?SUNxdy80clVKdkx6YnFvVWd3a01MVUczY3hXYnNtb200NzBVNysvYXZ0UC9m?=
 =?utf-8?B?ZG0zaUFLTG4vb0Z1b1hQOVpYY0VET1VDbjlGQ0JQa0UySGVVZnlzVWxVckRK?=
 =?utf-8?B?VFVRVUl6ZnBqUDR4akkxalkzcmNEajBxdlZwckVXUGxOVGloUytuaGF4eXl4?=
 =?utf-8?B?NWtUZGRJUHJxcWVxM1ZHMExUVUhqS3BrczFYMm5RQ3RhSmszL3JMY2xFemYx?=
 =?utf-8?B?eURQQVRQeHUxRThuYlhJYWxyZ2tqSDhnRDNiZm1SR1FkekVIRTcySVJ2RWZL?=
 =?utf-8?B?VC94WmQrQW0zdEgySmNrYVJKZ2lBdGVmZU1tOXdlcEQxQTJ4UndlRDdlYlJp?=
 =?utf-8?B?eWRud2dMdWlCZFpMYy9IbWl6WFpLRWR2a2c1OEFiNlA4ZXlLZnhBejRRTWxD?=
 =?utf-8?B?a0JGSHo0UUNBcURjdzZ2YlZIUXJxQm9ST3V5Vm82RlhoNjBLcjF1Y1V1bUlj?=
 =?utf-8?B?NEV0ZDRkTXRxdnZDOTZEclgxVk9lRnkwM0tMRndodFp1clBZOXEvQWwrbkky?=
 =?utf-8?B?Si81OEpnZVdPVWJudkpCRXJDbDlleWhUaVhYYUVzQUFTcEE2RCtFbG5oVy9E?=
 =?utf-8?B?eHlKekUwYlA4S2Q3eWhXS2JOSUFqQ1BaYXpaTUlwRVhIRzhQbk4xbCtWT2pZ?=
 =?utf-8?B?cUNhUDdUdUdwSzlLdVc3ODZPQy9JR3ViYlUycXdKU1pKUGYrREsySzBVeFFK?=
 =?utf-8?B?RWJQOURvcDExNmE1Ym1vYnM2SldvY1VyM0dsWldKWmhZTmQvU09DcHdXdmJq?=
 =?utf-8?B?UEVQOFFPSVBmZVNUVW1WcER1M09qS3puMlNLbTFvYkdudnVJSTl0K2U4akdL?=
 =?utf-8?B?aForVmFmNFIyNmtnZ3pZd3RBZmUyWGFDdUFXRWdlVkNBcGpxNnVEYXU4RHJk?=
 =?utf-8?B?Q3Q0WktpSXlVRlkxM2VZempKbjZsRk9oN1FZRmdRUUZseVJhYzFBUHRZdlBu?=
 =?utf-8?B?U2ZURFpKN0oweWRXcjJua2ZjZ1cyV01DSklXRlE1OWpIdFJwM3ZhOE0rTkpH?=
 =?utf-8?B?VlVaZysyQTNqem1Qa1FlaXJiS3BVRCs2OGQ4eGV3c3IzbDlaUFh4UnFQcm1x?=
 =?utf-8?B?YUFHQ1IxNXpFbWlhWk0xRG04ODhKTlF6a3NrU0k4akt6SCt4QXNpbHFWS1kv?=
 =?utf-8?B?cWIzNVdPdXZkam9BeUFrcXVSNmJkS0NONmtRTkQvTWpLaTBreE0zaWdFQTNJ?=
 =?utf-8?B?UkVPSEZOZGh3b0tGRW9ESnFvMVZsaE1sWkU3KytIYVd5dUQ3L2ZDY3VkcU1w?=
 =?utf-8?B?MTVLZGxCUFJrUzdSU09FejhybThSSUdmTDhDTTZJNGN2RUEzdmRIcnFrZmlU?=
 =?utf-8?B?ZHdLUjZ0WXN5eFRuUVVjdHhHRkxoLzJFUEg1bWlvc1FrbVpTK1YyY1U4dmFl?=
 =?utf-8?B?bkU4V25sbHlQd0VGNVI3cUpINndjL2xONzBRQkpNakxjRmMyYnlDbWhhOWkv?=
 =?utf-8?B?N0lTWWRUWGQ3OEFuY3hLSi9XcXlXSjRPL0hXcVA2M2MzcVRUbWxyTEtKTFd6?=
 =?utf-8?B?aG0wRlNWMmVkRGlmSlJ2em50Qld4dWZ6UGlGb3ZWcjhha0lxbDVVTDg0Qkxr?=
 =?utf-8?B?ZlQ0WUdBVXY1RmhtbXVrVkczQkNIN0UwT0ExSk43NTJrVnY4SzFBcTF3a3Rt?=
 =?utf-8?B?ZVlKTjhrSnMyNjZqazNrdk9pRVlidndPbURhMUVrN1RhNmROZDJDWHdTaTl3?=
 =?utf-8?B?L2xGL0JRYjU4eUpkdG5Qa3Zsa1k0YU8vNitIaXR4M1hKTEoyaEZsVHVNSjF2?=
 =?utf-8?B?VjI1SzY1R2swd0M4cnAxbWpyUElTSXpIZHZNckJQVXdtNjhjM1IzUEFKSUJn?=
 =?utf-8?B?VEVCTVV0RzdmczJsYWpGWjE2bG5vYzhwZTlxWDNuUGNnRm9nVXRCQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a036b0-0707-4d90-41bb-08de583e4b39
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:09:30.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONQqDV5XUt5Act1lh7inKXJQb/z6h0AM+W/iabKY+bf/tGweYpKMxrfBPsALOfBvInBQ4dQB1zBrPfQ/BCajsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6688

On Mon Jan 19, 2026 at 11:36 PM GMT, FUJITA Tomonori wrote:
> Add MIN_*/MAX_* constants for Delta::from_micros(), from_millis(), and
> from_secs() constructors, and update their documentation to reference
> these constants instead of integer literals.
>
> This improves documentation readability and makes the valid ranges
> reusable.

I think they're really just their for documentation purpose, and we shouldn=
't be
expecting anybody to use these constants.

I would rather just drop these constants given that we already specify the
behaviour on when this is non-representable.

If you have a geniune use case of these constants, I would like to see them=
, and
they likely can be replaced by something else?

Best,
Gary

>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6ea98dfcd027..7b3d9795f322 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -363,9 +363,14 @@ impl Delta {
>      /// A span of time equal to zero.
>      pub const ZERO: Self =3D Self { nanos: 0 };
> =20
> +    /// The minimum number of microseconds that can be represented by a =
[`Delta`].
> +    pub const MIN_MICROS: i64 =3D -9_223_372_036_854_775;
> +    /// The maximum number of microseconds that can be represented by a =
[`Delta`].
> +    pub const MAX_MICROS: i64 =3D 9_223_372_036_854_775;
> +
>      /// Create a new [`Delta`] from a number of microseconds.
>      ///
> -    /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_=
036_854_775.
> +    /// The `micros` can range from [`Delta::MIN_MICROS`] to [`Delta::MA=
X_MICROS`].
>      /// If `micros` is outside this range, `i64::MIN` is used for negati=
ve values,
>      /// and `i64::MAX` is used for positive values due to saturation.
>      #[inline]
> @@ -375,9 +380,14 @@ pub const fn from_micros(micros: i64) -> Self {
>          }
>      }
> =20
> +    /// The minimum number of milliseconds that can be represented by a =
[`Delta`].
> +    pub const MIN_MILLIS: i64 =3D -9_223_372_036_854;
> +    /// The maximum number of milliseconds that can be represented by a =
[`Delta`].
> +    pub const MAX_MILLIS: i64 =3D 9_223_372_036_854;
> +
>      /// Create a new [`Delta`] from a number of milliseconds.
>      ///
> -    /// The `millis` can range from -9_223_372_036_854 to 9_223_372_036_=
854.
> +    /// The `millis` can range from [`Delta::MIN_MILLIS`] to [`Delta::MA=
X_MILLIS`].
>      /// If `millis` is outside this range, `i64::MIN` is used for negati=
ve values,
>      /// and `i64::MAX` is used for positive values due to saturation.
>      #[inline]
> @@ -387,9 +397,14 @@ pub const fn from_millis(millis: i64) -> Self {
>          }
>      }
> =20
> +    /// The minimum number of seconds that can be represented by a [`Del=
ta`].
> +    pub const MIN_SECS: i64 =3D -9_223_372_036;
> +    /// The maximum number of seconds that can be represented by a [`Del=
ta`].
> +    pub const MAX_SECS: i64 =3D 9_223_372_036;
> +
>      /// Create a new [`Delta`] from a number of seconds.
>      ///
> -    /// The `secs` can range from -9_223_372_036 to 9_223_372_036.
> +    /// The `secs` can range from [`Delta::MIN_SECS`] to [`Delta::MAX_SE=
CS`].
>      /// If `secs` is outside this range, `i64::MIN` is used for negative=
 values,
>      /// and `i64::MAX` is used for positive values due to saturation.
>      #[inline]
>
> base-commit: 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec


Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ECE2D0C9A;
	Wed, 14 Jan 2026 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768417073; cv=fail; b=r6SwOW1/Eybcc9GLhxNC9BgcrnBFvQJHwru/w+zm4dCskAcP6AjLReWLdAFX8vPQI5XQx0udPdJU6oRcHrr370vhIBKjXeIfABE/JGY+7U0PvUE0dSkjKlvkVf3KECJO2Bb0uLe7REzPLNok6G8fGPCE4iwpHe3sHsTua2IkPGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768417073; c=relaxed/simple;
	bh=jOVe7wfznmWT7DuFl1aE7jrjn06gqgmV0mMFfW3w5e8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=PIX7bK2sBBy86h7NaECNPpgSEkxKqQEUwI+iUl0PYYIsDdn5QbEeYBgb2q4tqC+kVgZvCiE0eMFii+L5VHzZ5aozpAbVaGHq4Zvk6zoN/FIVa6ZHaMUgQFO2RztJHRnvjHR85RoBVmgprNQ8J/uHg/A7vsh53nst4a6h6JhS6D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NzFxyCVT; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NzFxyCVT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7RIqHFahO3+zHhhE79SnNWJpvpUfXCIzzAqIeJeOmSE63ACPaw2nLKgFxqVOmBYSwiDknPuH0PRBhSssEuydj/59Eub0v0SC5fTBxmQNtgpOBSjLuBnlPR3PYLa8D3qhEmRy6jRMlRODSIupmQ8BknDVqUTzG9TIuioQQHIZSSZTKPCIK0GratIHyMUMqYfmbXAXti+qQ/i5vVSkz771jhXapgU86Qy8cuWrcuQHrWZFSsA1HzvoSp0jGoZguwLW9WyNRpUfiCd9fivgmGppXhKTQ8LPcABHQ8JxaZs4qXKODd63xfwYHzptEBtTGij80LVI0URmUBGaNwyGTFisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZaTpSNe+UHn3bkXaJ/iXZHk2UwKAEMxO3G0vWBR4dI=;
 b=CZ2smacGr/GVzpudRFpjfy96F5e8qKp+++VCPSDvkJSNCEZcFfeakX+0aSuflY2CNHgYJ+25asglrIwqLkoYbax9xyyM1hoFJlrbJnY1ukNqQUN1d6rT0LLxAAI4YqTr7WTTtN2fCm9eEXGGQ/WjKjRPUMaarMWgctyj9nWd8Uamxe06YMEYpfKFo8MKv3umvdmYzsgfzNRW8F3g+ycKt4K7YubNw53KouI00g7V7w22PPSEh6YR43z7DGRhYdQlqGCVlKrfs+utE9vyzFQVGPR/Mp2XzIIx4NADEvm5rNKxJSml3VVrWcqsv9PzKXM7gChGL83usd2gWWMF/o5Zlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZaTpSNe+UHn3bkXaJ/iXZHk2UwKAEMxO3G0vWBR4dI=;
 b=NzFxyCVTKlCP171lcFecqcEMMPLcnT7lqjGIa2AW2QLdlH6wTiyu2ndapEkjCUq9QvGUQ/EqjLgeY8+/jb++5/Hy20/7uj+OQhFJCdE2AwAsZDs2m73ohHJxzR1WjQoZRadWNVJvpHZw41LROnDk01Ds5hFa1f33ImvRZX1CJvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6219.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:273::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 18:57:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:57:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:57:47 +0000
Message-Id: <DFOJJ5PX0G82.UA7L6LIYZ8IA@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/15] rust: pin-init: internal: init: add support
 for attributes on initializer fields
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-13-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-13-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 626aa5a7-ad92-4ea3-ca0b-08de539ecf9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VENBWmhiN3ZNVXAvQWVqUzB3WWhKZDJvNXM2N0hSUEtxUXlraThrQ3ZENTBn?=
 =?utf-8?B?Szd5dTBoUDRIR205bzZEQjdlVDZDcW15MmRwUWtjYkpyZldPazhGVUdJYUlZ?=
 =?utf-8?B?aE1uc0pwemdObkZlUjN4amw0L045ME1PNjNoUjE3NTRCRjBqTXVvRUhTelF3?=
 =?utf-8?B?VTRxQnBXd0dwWEJvV1IvaFRWcXBXWlV5aHErWHB4OU5NZEJhYmZlNTArRFE0?=
 =?utf-8?B?UCtMbEl6dm9yekxzcTRQMzhlL0FrT3RSOVdZQlFWdnJyR3ZWblJYSURFR0hl?=
 =?utf-8?B?bDNKaGtCb2tGZmxuWDZpbndCTFNLSGoyeTQzRFRWN1NTdXY0UnZXWnBxbnlk?=
 =?utf-8?B?SUc5TUFJY01GT3ZsZXRCRHRRVDd4YVJ5QmNQVlJ6eXB1SmhTcDVOUzlFMzlq?=
 =?utf-8?B?eTRTLzFJcXNFSEFxQndVZFJLQVRCMkhTTGVaWmhQdUV2ZXNNcDRlWDFFZ1pl?=
 =?utf-8?B?Wkc5aDk0OEdKM3VHQkhoWXdpbHdDZkxXbjFYZ0V0ZUVVb0F3QlFnclYrZVJQ?=
 =?utf-8?B?bTY2SmRpMFU3WDZScnBBazBucDRKcENyTFBBRytMSTBUSjc4djlvOUNybm9K?=
 =?utf-8?B?Mm5QMkk5ZlpjZUhKUllybXJCY3pDeWhDM04yTGJleFdYQUtCbEc1bitsNU9N?=
 =?utf-8?B?cFloOTdCR09XWVdOMXByMlZIVTVUZURmZjJRWnJjZzdIcXNmSWx4RTVZV1Ux?=
 =?utf-8?B?QUFPTUsyZGt5WnBZQkdnT3ByaXd6U25PNEVaa0h2TGU4MWFyRjJFWGZtRnNG?=
 =?utf-8?B?Q2xJcTlmdFhyUmJ2cXdSWFBhK2U2YTNUSVFtZGFpdVJBMDlOWVUyamhNaHgr?=
 =?utf-8?B?RzVURVVKbWlVcmxiZ3BEZ0s0eG9PWWNWckNBN3ZhMFQxSU54NGFvQjlLQWh5?=
 =?utf-8?B?MjN1SWJ3OXpHTzRyYU9xNDBvNmpwYUlmSHFZWWMzQVArMmtQcW93WXQrclRv?=
 =?utf-8?B?bjJYWEhiYlhQK1VoODR0d0JoUGk1c0c0WEl5bVhYQzlBa2NCMXJ0Y2dvY0R1?=
 =?utf-8?B?TnRwVTJYQzF0VU53VWJxOWVRR1BwMmJxMVBZOG5RWTdTRXR0aGc2SDM0S01W?=
 =?utf-8?B?Zmp2QlpDNUorZkNoRWxwZkUrRlN0cE1EcVlGeGVUK0dKWVhQMVJocGtLSndl?=
 =?utf-8?B?QVpzdWIyWlFuLzRnQzBienk0L1Q3K1JvZlNZdWNtKzVwUWs4M1NzemtHSVZK?=
 =?utf-8?B?Mlh0MFZ4T2ZFZTJ1ZlpvY0J5TDREbnBvb0s1NWh2bU1Eb3E0eHV6SWZhZ2xy?=
 =?utf-8?B?VHhuMmZjZklJY1Z4V2t5TVUrRk81OFdrWDllK1pVVzhHLzMzQTlaMlVWN1FB?=
 =?utf-8?B?UkhpUFlmNFhTRWVqVzJnaUtLQlpUY2FSdnJaZ29UZmVZTjZyYUlwcFdVcFlS?=
 =?utf-8?B?Z0FNY2cyMDREOElBZWhBZ3JRMUdnVDBETjlSUWxKNERJZGppK2xXeWxCTEtL?=
 =?utf-8?B?cThGdlVJYVBxcWlDY2I3YXZqWDlkSWVLYkYza3hkQUUvWjBydnY3azhnNFNW?=
 =?utf-8?B?ajRIKzhXNkhIN3dJVVM2Rk1vajlTN2I2bFlyUzhKUVpYalltVU9aYVJrTmU5?=
 =?utf-8?B?dEZML1FZN3I3d0I5Ui9kdnZOL3N2amJPaVM2NlhhZTlLR2t4SmpoTlFSMmJT?=
 =?utf-8?B?cVNsblJBOWRNNGxuWmxxMzVUamRYM0RuZ0MrbUhuVjlsWFROdzNUWENKM01P?=
 =?utf-8?B?NUFQWFhFZ25YZExheHdMMU1DdkVNaEFiWG15dnNKdmdpRDRjWVJRRkZDZmpQ?=
 =?utf-8?B?N0lFNHFEYzdEVWJ6M2tsVEtTd3Q0ZDFNOUd1d1FJdDVmQ2s2eTUwUk85Z29p?=
 =?utf-8?B?SGN5cklBRW1JamNJRzFQWEU5L2dXK0JoZjVsQVZpN29kMXBkNUZMVTFuZjF1?=
 =?utf-8?B?ZVF2WlNhNVYvUkU3TFFFRUQvbXVaU0NCd1FYU1R6K1BsUEJXZmtEemtTQVls?=
 =?utf-8?B?QmtHTVZreEpYVlJCcnhqYjdlN3BaaXA3Y004bVlFcjR0N2dKdzB4ZDhBSU0v?=
 =?utf-8?B?Uy9ZUG1lSmdDd2ZrME1Rck56VDh1Qi9YWlJQTlM5MjRtU2VIWFQvUFpHeERa?=
 =?utf-8?B?TjNsZkY0bTYrSm1oUGlwTnlPNlRtSG1uSi9wSnY3U00xTEpocXNHT0JVMUJk?=
 =?utf-8?Q?c1gU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXlXN256VUFtOXNRNm16Yk9KRmg3alhoSFd0ZzVVTHBNOXg5NnBuZXdxS3lZ?=
 =?utf-8?B?VDR1QkFzOU9WR3M0YUp4d01ZU3RTamFNN2xueTF3bWRUaTE0bmx1TFJkeGhp?=
 =?utf-8?B?cnl0eURNMVhwa2l3NHBEcFhjZjBwYXVNSTNZb1lnbk8yUXh3MXM5dzBOVkM5?=
 =?utf-8?B?WWV4YnhXNGlxSm0yUmRPNXdZdEVYV1dJQm54UTJkRG9yQmJidUJTRjh6ZUxu?=
 =?utf-8?B?Mk0vLzJSKzBHdXFwNGs0cjJJb0VoNjM0b0x3a2lZdncrWkhsNnRXTUI3QzBQ?=
 =?utf-8?B?UVQvckJlYjhFdXgwbGdmWjF5cnZLQUVnaXJROFdnTFNoWUE2Z0h6MUNURVB2?=
 =?utf-8?B?VUFPQjg4eE1OM2d6WTY2MmtpZ2ZEK3IxaWtpL2dRcklQOGQ1alNueUhMK0xn?=
 =?utf-8?B?Z2xWdFRMYXlNYWhvSGpLbHZnaDVCSmV1d3pWTXdMeXVDV3hhMXo1ZERseTc3?=
 =?utf-8?B?alJMaUpXbUYybmxQdjlEcDhHcHhBY3plTEI5bUhIZXlJaFQ1ZUtNZkhOQk0v?=
 =?utf-8?B?Y1A0eWNqaCtNaThPa2FXUStNTDZEYi9xdWlYN0hyZEJLcmdoU0VTYStPa2g5?=
 =?utf-8?B?d0JJUjlvQzM5ZldxM3hnVGV1d3N5aE9tQXRwU2FPL2tPQXhKZXZTTEoyaDlm?=
 =?utf-8?B?VG5ZeFF6elg2RmxITXhCM3VMbHV6SWRndlM5VUVqSG1COXdyViswZkNZWnA1?=
 =?utf-8?B?Sko0THF3bDhYamUycGRGZGhJNTRWL2d1R28rbUMzcWxXd0U0NjRXdXVZV3Ra?=
 =?utf-8?B?VktkN2FDY3o0QkZKYkZCZ2UwaWJiRUVia2hqR1dBd2R0TXVJQzJveGZmUEpv?=
 =?utf-8?B?L0ZkME42cGhJN09SNEozY1pnZ1RTbjN3Um5hVStQV3lUcDF4THByaUVuZTRI?=
 =?utf-8?B?WHNIZ0NEODJ3YTl4QXIzTDIxdDJsN1Z0MStjRDFZcjRSYUlDYnY4dGFxV1RQ?=
 =?utf-8?B?R2lyN3pmS1k0cmFaMXJJQU9jTDFxN2RYdE9TWTdKSmg1aFlVUFJoZG9BcVpV?=
 =?utf-8?B?NGRsZjBwWXJZREdXbzBiYUpOMnk5Z09kWVQ1TGRZbDVBR01zZmhKTHhNd2Zj?=
 =?utf-8?B?VUszSDNlWUtyZ3Awd2tiK2luNmZqT2FvZjNMNEZ5TmtVSEg4M3VrWXdFL3Rq?=
 =?utf-8?B?QXpaaXEzaDMxT0VQUkFRZHM3WUpRcEcxUm9NamU4ZS9lZTQwM21oSFhNbFJ1?=
 =?utf-8?B?bTV1R0FaajYzTzA2NFpERllQMGk4Q2ZWcmlyK3UxbmJOYXROY0dOYkYzZnVo?=
 =?utf-8?B?SUQ2WjNuQ3hrTjRRR3lRSUhFMk91UmdsZ2tmNFk2OWpTS0p4MFc4RkszWnNu?=
 =?utf-8?B?WEhYdHdhcWFVRmg5cmVsMzJVUmF0L0xxWlo5UTd6ZXNtTXVhaU44SE9wOWVV?=
 =?utf-8?B?TFVta0drdHRTZXpOeXFkZThYZjVCdllLU2N1ZGRmeCtnQVJ4SFVoN092MENF?=
 =?utf-8?B?REVsNExIVUdVazRwRTBWNjM3dTM0cmJINUxqQmlTSWhIa1dOZDlZOHBtUU45?=
 =?utf-8?B?SjJpd2FwTktYMXU5QzhRQWkzbUMzUEdoNGNXL2VtT3dDclk3SVdLSHFGTUJt?=
 =?utf-8?B?R1FCMEt5TC96dEFaK0s2aE5XUnJVVUlvN1VsazhNWFZoSms1Mzl0RVBramZx?=
 =?utf-8?B?NVp2cGtXSmd4Y2NWQnc1SXp2MFNIWDhKUzMvcDNwV0l1NUVabnova1ZKWE1a?=
 =?utf-8?B?UWRXT2NnV0hZUUFZWEZva1BtSDdaM05sSHd0MnRhRm1ZV3pzUHgwWVZFd2dM?=
 =?utf-8?B?OWZubzl6MjNTU3poZHRPeW41Q3IrSndsdWNoTkRiV2JadWVHZG1na2lrcWNW?=
 =?utf-8?B?Z0dIZFl6TUsreTczZUFmNE1lVWF4M0Era3p5UWJTNDFGa016NlRFbHJuRWhS?=
 =?utf-8?B?aldLZmZGUUNsaHUyMzRCSjNjbVhjb1d1YW5ueTlwT1B3UEVhTWN0dnlCUUpC?=
 =?utf-8?B?QVIwa2hDS2FXa1F4QkVDdTZkY0U0SUlDRmk0bmplcFBLQ0dUaUhzTHZJOS83?=
 =?utf-8?B?amJHTWhZcS9JQnBzZGxLc2pLTVRBeUVSMmdQNzZaRDdFRzNXaWRIN2wvWHlq?=
 =?utf-8?B?M0ZWM3dTS05QaS9kelRiTVUrNWxDdHRodnA5VVRIWmNkN1lsNkhtQzN5c2J2?=
 =?utf-8?B?eG9XejQ5REVnczVPM0kyUUNvYmoxRFJjVFZCV3FZOW83RzB5MFRZdUhYdk9I?=
 =?utf-8?B?Ly83OFdsa3FxalQ2QnlVcjJtd3dGY3J5bGNxekp4R1JwZ3N1QXBzY084Ymtl?=
 =?utf-8?B?NDVudzB1cnJIN2RLUXVmbFE1UkhIemlHcjZ0RGZjcFBaeElwYmRjTS9hQ0lk?=
 =?utf-8?B?K0MyS3E5bmJ2NDUxVjVKT2VoWUl4bGhHN1pFd1Fqd1dWa05LQjhFdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 626aa5a7-ad92-4ea3-ca0b-08de539ecf9a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:57:48.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkyO3cAjmjfm+hp6ApyhFCOhhAj5Rc3OSWFernMi0bG6UjArEmdXNMOfOTHr6jqJ7UyZZCe6RHVrdsmgQGF8KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6219

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> Initializer fields ought to support the same attributes that are allowed
> in struct initializers on fields. For example, `cfg` or lint levels such
> as `expect`, `allow` etc. Add parsing support for these attributes using
> syn to initializer fields and adjust the macro expansion accordingly.
>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> Changes in v3: none
> Changes in v2:
> * only attach cfg attributes to non-user controlled code for fields
> ---
>  rust/pin-init/internal/src/init.rs | 69 ++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 14 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index 5a66016bdf33..0eb21ed9c8bc 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -29,7 +29,12 @@ struct This {
>      _in_token: Token![in],
>  }
> =20
> -enum InitializerField {
> +struct InitializerField {
> +    attrs: Vec<Attribute>,
> +    kind: InitializerKind,
> +}
> +
> +enum InitializerKind {
>      Value {
>          ident: Ident,
>          value: Option<(Token![:], Expr)>,
> @@ -46,7 +51,7 @@ enum InitializerField {
>      },
>  }
> =20
> -impl InitializerField {
> +impl InitializerKind {
>      fn ident(&self) -> Option<&Ident> {
>          match self {
>              Self::Value { ident, .. } | Self::Init { ident, .. } =3D> So=
me(ident),
> @@ -227,10 +232,16 @@ fn init_fields(
>      slot: &Ident,
>  ) -> TokenStream {
>      let mut guards =3D vec![];
> +    let mut guard_attrs =3D vec![];
>      let mut res =3D TokenStream::new();
> -    for field in fields {
> -        let init =3D match field {
> -            InitializerField::Value { ident, value } =3D> {
> +    for InitializerField { attrs, kind } in fields {
> +        let cfgs =3D {
> +            let mut cfgs =3D attrs.clone();
> +            cfgs.retain(|attr| attr.path().is_ident("cfg") || attr.path(=
).is_ident("cfg_attr"));

cfg_attr should not be kept, as they are non-cfg attributes after expanded.

Best,
Gary

> +            cfgs
> +        };
> +        let init =3D match kind {
> +            InitializerKind::Value { ident, value } =3D> {
>                  let mut value_ident =3D ident.clone();
>                  let value_prep =3D value.as_ref().map(|value| &value.1).=
map(|value| {
>                      // Setting the span of `value_ident` to `value`'s sp=
an improves error messages
> @@ -253,21 +264,24 @@ fn init_fields(
>                      }
>                  };
>                  quote! {
> +                    #(#attrs)*
>                      {
>                          #value_prep
>                          // SAFETY: TODO
>                          unsafe { #write(::core::ptr::addr_of_mut!((*#slo=
t).#ident), #value_ident) };
>                      }
> +                    #(#cfgs)*
>                      #[allow(unused_variables)]
>                      let #ident =3D #accessor;
>                  }
>              }
> -            InitializerField::Init { ident, value, .. } =3D> {
> +            InitializerKind::Init { ident, value, .. } =3D> {
>                  // Again span for better diagnostics
>                  let init =3D format_ident!("init", span =3D value.span()=
);
>                  if pinned {
>                      let project_ident =3D format_ident!("__project_{iden=
t}");
>                      quote! {
> +                        #(#attrs)*
>                          {
>                              let #init =3D #value;
>                              // SAFETY:
> @@ -277,12 +291,14 @@ fn init_fields(
>                              //   for `#ident`.
>                              unsafe { #data.#ident(::core::ptr::addr_of_m=
ut!((*#slot).#ident), #init)? };
>                          }
> +                        #(#cfgs)*
>                          // SAFETY: TODO
>                          #[allow(unused_variables)]
>                          let #ident =3D unsafe { #data.#project_ident(&mu=
t (*#slot).#ident) };
>                      }
>                  } else {
>                      quote! {
> +                        #(#attrs)*
>                          {
>                              let #init =3D #value;
>                              // SAFETY: `slot` is valid, because we are i=
nside of an initializer
> @@ -294,20 +310,25 @@ fn init_fields(
>                                  )?
>                              };
>                          }
> +                        #(#cfgs)*
>                          // SAFETY: TODO
>                          #[allow(unused_variables)]
>                          let #ident =3D unsafe { &mut (*#slot).#ident };
>                      }
>                  }
>              }
> -            InitializerField::Code { block: value, .. } =3D> quote!(#[al=
low(unused_braces)] #value),
> +            InitializerKind::Code { block: value, .. } =3D> quote! {
> +                #(#attrs)*
> +                #[allow(unused_braces)]
> +                #value
> +            },
>          };
>          res.extend(init);
> -        if let Some(ident) =3D field.ident() {
> +        if let Some(ident) =3D kind.ident() {
>              // `mixed_site` ensures that the guard is not accessible to =
the user-controlled code.
>              let guard =3D format_ident!("__{ident}_guard", span =3D Span=
::mixed_site());
> -            guards.push(guard.clone());
>              res.extend(quote! {
> +                #(#cfgs)*
>                  // Create the drop guard:
>                  //
>                  // We rely on macro hygiene to make it impossible for us=
ers to access this local
> @@ -319,13 +340,18 @@ fn init_fields(
>                      )
>                  };
>              });
> +            guards.push(guard);
> +            guard_attrs.push(cfgs);
>          }
>      }
>      quote! {
>          #res
>          // If execution reaches this point, all fields have been initial=
ized. Therefore we can now
>          // dismiss the guards by forgetting them.
> -        #(::core::mem::forget(#guards);)*
> +        #(
> +            #(#guard_attrs)*
> +            ::core::mem::forget(#guards);
> +        )*
>      }
>  }

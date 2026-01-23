Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022086.outbound.protection.outlook.com [52.101.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFC285CBA;
	Fri, 23 Jan 2026 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187116; cv=fail; b=cUkIGAGfZiCR6UL3IMJp5WSZwyiaF2uJe/TDutu0kBD+WQjITSGK94Uwn5PDrpDPqJYwWXhSJXFWrbtZ8NEu6VL0zIG3T0wNnvQBqTvcbpy688tp0TVjfg7c8s0IEsc0b4aNikJOK77vGl5T1Tb2Vlqu1KsVFh3GtDrkx0BnLb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187116; c=relaxed/simple;
	bh=me6eHdD7YTOBQswI4RfRL843cgg/HPrJqTjhVt2Z44Y=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=N2VZ5Sq8ZXVglOSmPJFyrU5niDq7ZU2yKPo9Nj1dKsIaXByhaJMiRPuU9ZDxTfAWBcc3xHzCVrfOweQPdW/6xgN/kyC0o/TRIgRhjaAzNTLhHOW2JWnt4i22tVXb0lWCK3xpMKneozn/p3U40cj8128/ppBYb4bdWcYDbZqAba0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zee/43sf; arc=fail smtp.client-ip=52.101.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zee/43sf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8pgSO6GHHPVaG+xq05ZUpT2M9REWtivfnDb76NJo14pvZt19YQrj7d3804RfPXbolbSrCaBXdChRUTAu3cT4pnE4Zi106WqRqgdQK8FpBRk44FXZTwweNDcszM10T/P4eNhDPnFEgz/oLy9L/3oGYhtuXvN+6VGLxCX5GRENvJNGq4B/6x7+sdF/TEpKLDlGlIdXcOUFYGHeHkrvas6cBnpZ4+Zaqqgj4GAXkOrurfHTQw8zkHnipDzHDQQlSj3a0IrXSTJxD2HBFLFfPPLm3iA4gIwYhS02ynv14og3z664SzFhxVSGA6Xb0MaGo8BFlOvpcPZrUN3EraNbzsI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1+mzhpbDgnMk25tWUvzjwFEvrA/x1jmYs4ld+PjlM0=;
 b=R5sWHxCZeBnwAoLM90Bq1tFNllCcubDxw0l7j0tvjiZoDVBfl3HhArtqk0OxsNPM0YxbOlL3Ze/osfM8Q6VRG3SPLifWjndhQrLDvHvTGGW8J+XmFpUJF04TlNgnDNsVtsCEWnnjWnJ5wRUFNor/VXEdqwmglgcBHqh9Vy35CO/RSx/lHTGTkXxhjccuMr5qaBHRcaEoOJno/G7ApMYkb7P4bpQQQGREALO7HlDglaOJUl7fpDUy+O8Vvgkv8c5WeyyT/5yBC32wR/r4Ba0S2VrEPbWqA24z35xMIRi3wlhKEW0WUS9j5jM/ewuCqdj9MsedfQtFAma2CJS+TcWdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1+mzhpbDgnMk25tWUvzjwFEvrA/x1jmYs4ld+PjlM0=;
 b=zee/43sfOid9hEVpdxkcUI+v77HtmQvSHdMFOtzR4xzZ1Bho9Lnl7QKVP/Xpyn2i9nBEZciCROh2Vfni/uZQ/tjfa/i+0+i2Wc1+slsuYfS679NmBizWX7Ass+UZAH6Cg7dUNlWTDk3OTy2SnaPR+UFf2LfBOyKDJ+DzR2ZUyXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3240.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:50:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 16:50:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 16:50:22 +0000
Message-Id: <DFW4GI1NXVGH.2AMO9KFBPUPED@garyguo.net>
To: <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Jesung Yang" <y.j3ms.n@gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
In-Reply-To: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3240:EE_
X-MS-Office365-Filtering-Correlation-Id: 87137de3-d868-4c09-88a0-08de5a9f804b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUNOc2hTcURRZEYxM2pkYzVXM0pkb2YvZVNJWkRROUJoMDRqSktMQTVGb1Ir?=
 =?utf-8?B?QmcwbXNkVHY2TitlaWlKMkdOZFg0V01oamswRi9xUW9yU0Y1bnZ4YzB6cElC?=
 =?utf-8?B?eG9oR2VrTlB3NlRXTWVmNnlFandoWWl4c240a2YreHN0WGlDTDB1bW1LSkQz?=
 =?utf-8?B?MWU3alQ5aDc2SkRBbHhlL1dJRUFXa25XVzkyeGZ4TXRxR2laNUdBRkRFc0dY?=
 =?utf-8?B?Sk1pWVVWYzJscm9zT1hXTjNZOURTQ3MvK0hmaHBsL0NJS3o3MGdXZGxYclNW?=
 =?utf-8?B?UFloSkhIQzZ2NnhCWWZqQ3UzYmdMVVFBSSs2SmRTMG9OMGhMUHp2YXcvS3hz?=
 =?utf-8?B?Uyt1SldhVThhTVJ5dEdaUGlmdjRXeFVncW5RRUVqSmd3N2pFMm90M01pWm9T?=
 =?utf-8?B?WE5UbGd3TFJaVGZsMnl1Qlg0ODNyVExxdkNnUDNQeVByL3FzdHZjN2c2VEVH?=
 =?utf-8?B?ZWZkZ1VKZkN4dTNpT3k3LytCVnFQNWNzZFFKNGp4NTkwYys2dCtsV0w4ejhV?=
 =?utf-8?B?aDJvR0hyazVQdlZuRmVNMWN0RlJkQVdnb2dhWkFCcGNEUmpDNHpWaWluanhX?=
 =?utf-8?B?QmFicnQvTkJPR0dick1YdDZFUFBHQVp5aVY0RkRCa3k0aDZtRnJES1l1SE8v?=
 =?utf-8?B?SnFweGM3Smh3cTdUZ2tHY1EvU09Oay9BcWc4N281RDVLVHIxTk5DNkNLRUkw?=
 =?utf-8?B?akJieTFlaXNqRUpUNm9TSkg0V1V4QWVpaS9KWmtZUHE2VmlhN2hDODNRV29l?=
 =?utf-8?B?OGYzZExTeHBYVzlFZ085b01JcVNkdFowVHZ2WE1PRTFTNDBOZ0dDVmNBa1N1?=
 =?utf-8?B?V2RqWnJkeC9Pek9iYjM1ZXcvNXJRYU5WaHFpeU44SlZyczZiTG1sQzdiVDRx?=
 =?utf-8?B?MEk0N0lXbVhmSFltbHNNaS9Hak9idHhyd0RxOHV0T1B4YTdTZ3FXQXdBcUxm?=
 =?utf-8?B?eDBjaXhtM0p4RXllOUZZK09lcVU4TUlIdm5KcngxSUZFWFRma2s1K0hCdlNT?=
 =?utf-8?B?L2UwUEFGS3N1am83bURpSmpadkdIaDhFdDZWSWZyNFNLQ2did2lYbVYzOVZW?=
 =?utf-8?B?S2dFQXM4Q3RwbWdEbG1iWUFHdWNwL09ueitqRk5sRG1kelBicmpxc2xhdUVM?=
 =?utf-8?B?L3hUdklrdzBIUXp6OGJzWHJzOUgxTCtJaWNscGpNMXFwdmtUQzl0ekpUenNJ?=
 =?utf-8?B?RlZCS0NsaTFTRXF4cEMwVnFkS0pIeUNsQjVEQW1FWWI4MHNocVZLSFV3RGpU?=
 =?utf-8?B?bG0xc2s0R05Ocyt6TG1DWDV1dHVpN3N3Y1VNY244dDY1NXRTa2NFeGxHZnpJ?=
 =?utf-8?B?ODVDSlpydnlYMm9WM1FldEdOdG43OWhrRkZKd09vYkpJbUJuTTVjVUJiRW5H?=
 =?utf-8?B?VlQ3MDRTWUpOalFZbVRkMHcxNVEzQno1Y2M4MzVEblI4VlZrM3lLRlYvWVZX?=
 =?utf-8?B?bjZhb2F0Qnp6YzR2cU5OT2l3YXgwT2dacVBJUUk1NjVnSTltWUtpMU9uZXB5?=
 =?utf-8?B?MCtFMTBnbHJOcm9NaVFqL2tzYTREUGp6M1U5NFh1am5UUXFHdmhGNDB4SVFK?=
 =?utf-8?B?MS9wd2twRTdHK1p4TVA0ZEtGSng3aHB5TDJGYllPSTArckpZM244MVhDSGF1?=
 =?utf-8?B?aFd3S211YklsK0Q3Y3EwTGw3SVZ0Y1A2c1kwS3lkWHZ4MXk1MzJiRkN5ZVVo?=
 =?utf-8?B?MVBKWEl1LzJKMzM0Yks5enZtc0dFa3ZwREtnakQzaS9yNE1YeWp5Vm85ZFVW?=
 =?utf-8?B?d3lCVFB2ZW16bnNkTUNlL0NlVjYyeTVpdVd2bU5wRXFEdUF1NGZySldWY0tO?=
 =?utf-8?B?d3hSOHhuYlVWNHlGcU9SUWJCcmh2UnpXb1BnMzFtZ0pDQjhOL0dvaEt6WHph?=
 =?utf-8?B?aFgxYUNPcjR5MVlpdU92b0hDTGRmRVBkOXJnY1YveTVtdVRDLzIzZW1WK1kr?=
 =?utf-8?B?RHJSNkloWURNanczdDR5ckRnaGk0YzFjMGpMU3paUlN6MkZrWEVobUUxRjRy?=
 =?utf-8?B?NHB0WEVpM3BIRE9rckJSeHlheG4xemNieFZVSWowR3ErTDRQTGtpRjY0d1Yz?=
 =?utf-8?B?SzRFc2NvMm4xb2gwVkxFVDd3SzA4ZzViY1pkdFdEanZ3aWxqSzZDLy83dmI4?=
 =?utf-8?B?ZDQxdlIxeFBBY2oxb2c5aXE4anVqVXYyNXZkVFd2OHZOQ05admxScnpLWmlS?=
 =?utf-8?B?dUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnFXa3h4ek9iS2ZWckZXeFZOd083WTZUbFY4KzJHS21mcHVjVzZQVTlNcHhX?=
 =?utf-8?B?c1I2SGhRaGprUStVdzU1V2RGVW9WYXZMRnkzZmYyVDBLQkI5TmM1aTUwZUY4?=
 =?utf-8?B?TzRLYUVIVnhTUUh6c3h0ZnFpOUVCdTlBdEFhK3hNaE04NEt6SkppOXJEQ1FD?=
 =?utf-8?B?a0ljcWwxcUpVOWFPWDNQdXY4VStiM1JKMlBIbUxwNS9teElaWjExNEZQRFhp?=
 =?utf-8?B?dzhabzU2bzlKRDI0NzAzYi9BMk42SVVIWlpVZTA1dkJ3K2U4YjlCR0tjTy9X?=
 =?utf-8?B?bllETFhmUGZpK2xXU2Z1ZFJRd0RjT0RyV01DZUU4b0dodlhVclhaOEYvSHZT?=
 =?utf-8?B?eWtHRWxINlNXcTF2ck9UcFJLRyswLzdvUjFxRmYyTmZIR1dtekxNR1NuWXQz?=
 =?utf-8?B?M1N0K3FWdHlpZ2NaeTREUDN4ZDA5NXd3d2pnZmk3UlNjd285azRNYlNyMlNN?=
 =?utf-8?B?ZG1qYUFOS2xhL2NhUEI3NmhpRVozZW9DZnpTSG5jNDNhZVE1TzhGMzdLNndG?=
 =?utf-8?B?NDJheUwvVFY0M2FZL2REd2ZmVlROaWZnM0Nob1NQcmpUNVdENnFhTU5BMUdW?=
 =?utf-8?B?M082ckN4NnhOZHJEbGpXbXhlNmNIQ05xU1hadXVKYTR2a05HVlovVTRMNW54?=
 =?utf-8?B?UnUrcXlYSkV2cXhvVlA3WDQrUGJSY0czVEZjakRXaFl5MHNvajQ3Z2FkdW5R?=
 =?utf-8?B?VldJdzBoSktvRlNmMU0yeUJ6RXVjWktpbENaa3lONUpjR21WUHZVb25tTnZ6?=
 =?utf-8?B?bGdFOUhDZ3V1RFppNUh2Y3MvS0t1aVBqcW8xR3FEdGgzdGpwdkdSbHpnMURE?=
 =?utf-8?B?czA1TTRtQTNGZHpieFdqQzJqSGhweWEwbVRIaVFtcUZKWjNqMldFeXlETE1U?=
 =?utf-8?B?NUZoZ2JvVnh5OUlIaEJRREtzWS9tR1ZDUExFYWZsc2s5eVBZUHpYL2Y0ZDAw?=
 =?utf-8?B?SGdVKzkxcWc5UGNocnpIWC9BNTNKa1B2R2JtZ3BCd2s4M0xtN2QzeTIvdU4w?=
 =?utf-8?B?b2dwZVgveVV1OWRoUFdLNjU4Mkl1TStMR2dlanVGK3NHT2FCa0QzNXNuL0k5?=
 =?utf-8?B?ZFlzbEl1NW9wbzJwVnZEQzVlbVZTWG9qS2FrNkFGbkNBVXZtSGkwQmJZcnJU?=
 =?utf-8?B?cy92dFBNZjhWWWVpWHdGVjB1dnV1Sk5yTk5Xc2JRTlc0YXJ2WmpxUDVWS21X?=
 =?utf-8?B?bTNlRjZvaENKdjg4MGRDVDhUMWlIUkNTZXBwRlc5RFhidEVhanlIbGJ6QVBK?=
 =?utf-8?B?L3ZRZHErRVJYejNPaUVQdlBQS3U2WnJ0YVJ5OEkyUTNaNXJqOVF0MS94VzVu?=
 =?utf-8?B?RGFJaEM3T1pIUkp4MzlTVXp4UGtnYkRnSndoYkwwZEp1M2E2cXBrRmh3Ylo0?=
 =?utf-8?B?WDJJejFBOCtxY3BpUkxFR2hybGQ3bno1Ly9hZ2tFWk1zaThNbHF6cmNDNmhD?=
 =?utf-8?B?M3BId1orZjA2VGdzKy81TkxrdTg2R0I3aEFCdmJNbmJPejRTVTlyczZ3aTlD?=
 =?utf-8?B?REg5U083RnpnaTFSTDltY0dJWFBva0djVWZzR2RZajgxelJwViszZzVocGh2?=
 =?utf-8?B?WTQvYnRaMjB1cUhtdVozQTdKSEVQNjZmSGFZYzVZcjJJMWRJcU1VVVV4VDlo?=
 =?utf-8?B?WGZoeWl3ajdUeFF0blV5SDlTbWpCdHNoYVlmU2xNRnB0RE1QbGRXVHJzVk02?=
 =?utf-8?B?SVdrM2dBU1F1ckhKcGhBT3RDMXZyNDBVQmh1V1ZpVUdhRmJxaTU5QXRpbmRL?=
 =?utf-8?B?anNNMU1zcjFzc0dRc2pFblpCY1hnSUVMWm9JdU9NUHFDK2NNWHRoOUdiR1Bj?=
 =?utf-8?B?eGdtN2tXTnlWaTdrR25GeVRwR2x3UUhIbnd2T2Q0ZENhZi9FQ0t5bk1mV3Bw?=
 =?utf-8?B?QUg3Tk1mNnVZQVdsUGJRYjJDYXcyS1NHNWk0WHZOVThhMHRzTlBzUm9jNnRP?=
 =?utf-8?B?a0RESmQ1dUhYbndwdk5MZEdZN3hzWk1VWHEwYTlqbm5EQkJaclVndjVBOEl0?=
 =?utf-8?B?amEvZHhKUjhqWFVqaW9WVEVtTnhiWkNvbnpBTEo1TXkxVS9LWmNUa1JrbmdQ?=
 =?utf-8?B?TDJDb2xXQ3FvbE1HYU9lRjhDV1pDMjEwVGhiQ2NHOHgxNXBPb0ZhK1VDVG1C?=
 =?utf-8?B?L0ZwV3hFVjFCOUZqZ2ludWFoNE1FUnpTRkNmeU5xVWgvU01vdnE4SG9Sc2p3?=
 =?utf-8?B?dHNIOEE4dFcyM0FVbFdlMUNrSVFETmh0dTlZQ2NHbUlaSGVsWmdtdGd2RGpD?=
 =?utf-8?B?TC9Yb1o0ZjdEbk9rbUxYNVdNaStzT0MzZXFDckUyS2p0QVRFYXFPSjB2M3lB?=
 =?utf-8?B?MTdFa3NncFR3ZUlFMGVBYUtmWFp3bFBWeHNqd1RhY01yYUlWbU4vQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 87137de3-d868-4c09-88a0-08de5a9f804b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:50:23.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4bJva3JSic/gLUtrVCR3Aaadt1X89pjGfnBEQ8myeutWmo374KnRmdBxbnjI3bP64SGxNcTeXM6vKIJ2wxPvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3240

On Fri Jan 23, 2026 at 1:18 PM GMT, SeungJong Ha via B4 Relay wrote:
> From: SeungJong Ha <engineer.jjhama@gmail.com>
>=20
> Currently, rust-analyzer fails to properly resolve structs annotated with
> `#[pin_data]`. This prevents IDE features like "Go to Definition" from
> working correctly for those structs.
>=20
> Add the missing configuration to `generate_rust_analyzer.py` to ensure
> the `pin-init` crate macros are handled correctly.
>=20
> Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
> I encountered an issue where rust-analyzer fails to analyze
> structs decorated with the #[pin_data] attribute while testing
> Rust kernel modules.
>=20
> It appears that the dependencies for pin-init and drivers were
> missing from the analyzer's configuration. This patch adds
> those missing dependencies.
>=20
> I have verified that my rust-analyzer correctly processes
> \#[pin_data] structs after applying this fix.
>=20
> Best regards, SeungJong
> ---
> Changes in v2:
> - Fix typos
> - Drop the quote module workaround (will be handled separately)
> - Rebase onto `rust-fixes`
> - Add `pin_init` dependency for Rust drivers
> - Link to v1: https://lore.kernel.org/r/20260123-fix-pin-init-crate-depen=
decies-v1-1-1c6cfe9aa352@gmail.com
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


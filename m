Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDD29B204;
	Mon, 26 Jan 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397845; cv=fail; b=JbJcPzPNyqTxwfTre4WFN/a7WPoPEb/ysbz1r4UnQZlZYOfkWYD+qOy3A8nUWFkBIC7IudfknHXDzTQlVyl5zFxGTuLstaNL1aPOeO0jvrymNeIQideAJhrxYn6c1tWW80b/JPyS+tmOhRseC+7RjwqnStpuCyvyQRrTYtix+Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397845; c=relaxed/simple;
	bh=4iDe6F+09yWambBUmci3k3upY93DseU1GRe3Q6Aeu7E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H5qcbbMctqUVvh09Fd5ygWbkW22kud7qOYxgJE/5PQ3JASYrxqfhW5t2yngn0deE4zbGl50SeCWdoWJ+kDZFwRYwliffHI3Yya+GA3zMvqZmfPzT4zzKym5XFzQbSwqPUkPi5QqFCtQ1ESpVzfBCPguqkoupQw4WUv8uncVKYKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IXo5qofc; arc=fail smtp.client-ip=40.93.195.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IXo5qofc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqVOTMnyCH47aMqlIFhLfzT5wbozXj1gJ8PiuUY/n5ltLRoLRNLR1SjnthF5i/hHPYXQR9U9gQe1S4//Gv4/SimFLli0wy3uB0bVjbEzBVAcPhc8YlX5i+HD7lWtHnGn0CiInqsrgmSDFLlcgZUWALoZUb66VbZH6RDSjDAKHXhKttjUIlqy6s6GNbH5AqITo5RfXd+/i7rFbAssknbJE50UY+0uL6+eAUSf7fMrDXSUmRkoHpS47pC1q4Z3E7zAJ0TsUFEojOf1zalUbbGglkyDHRf83UQ8TQJSzzDMRfMi9q4i/djVChI8BKKKIaNVdKXB+ZlN5q4wpMAl6bP3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iDe6F+09yWambBUmci3k3upY93DseU1GRe3Q6Aeu7E=;
 b=VIEeV/OZrqMLfXjBd/tT4rXibn6si2NyFKrm4mkxhdUH0Q3c1Q/ykXtdV28MN8U3f4WP4mbxVioRii7gpPudlgj428vPvxCaL2BQrDatliqGq8bu1JQwqONtvqUOTSESMCuaJtX41N6jkU/9IqsYYawHCTJ8mPKhkneS1bIpfLYDECOryPzb4qZ7G/rIm0MBUP0ZMB5LtbElzLvpoK/15wbz559MDZHjN4WJTm6rMZ8zU2nBJ8/mc88gS7ekhGev/Qr54vu5bQ43UQOyHKlX6ztjYo7M6ZBinsSdYi9Fp+QuxdFNfdwa+KY/1QstMWa/NH19Q39MHH2IElW/J0556A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iDe6F+09yWambBUmci3k3upY93DseU1GRe3Q6Aeu7E=;
 b=IXo5qofc/pQv0qi7iwdVfvvelXg6phF14s1muVtiFNOgJKU+pQgd5AQD8KRRH6ILlXn4hfDcQZ1EbMUnmatsCesbl/Cc1036+qn7jkVaNCC5r+om5X6qH3uoqC85lObZSYorin6YIXM1D7DCKoSCiOGaX++F/fpVZ06rnVnxEg9/nqrKX4yZ5ywZ2WyoxojpFAqJtzf9LNc1TKw8UJhrWXYXMRw89W5ecSP3XHi4pLG+0fx4USEnybq49pcLxiWEFW0b5NsvHEp2X2/9Nc4iQ+hJ8ATLPMSOo8xJo+JTrKEUjE7+ZFeX2IF8AfGOXaQvh/5EM9wzLQSpAcIeAACuTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 03:24:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 03:24:01 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:23:58 +0900
Message-Id: <DFY76PFKFRQI.6RDC2F8DWIXM@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUBWX3HTXBL.34H3IZ0OGX4IA@garyguo.net>
In-Reply-To: <DFUBWX3HTXBL.34H3IZ0OGX4IA@garyguo.net>
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ee6302-acf8-4eed-3c95-08de5c8a59c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3NMakNoYnd4SDIycFArZHIrSDYrNVVBNnB5R2d2R3BlVnd4UzBTdFRwbEhz?=
 =?utf-8?B?WUtSTlF6SjBVeXBnRUJubFNxNC9GRmVGNkJVODNEU0RVZ3lkQmgzSlp5QXlV?=
 =?utf-8?B?RXFrVjQxNDJMRWQ3MktvYUR1ZU5SZ2p4a29yRGxnQ0Y4M1ZJQVBXV1JhSGxV?=
 =?utf-8?B?OVNDS3g2ZXljNUhUaVZlNW4xTFpWaEhqTHRWNW84eSswMzBYUGdWKzV3VUc1?=
 =?utf-8?B?Ni9KdXhnMEtia3J3LzQ5UlltaStsWWd4N2d3ek9JRE93NzVEZmlLM3ZiZmhK?=
 =?utf-8?B?K2tPTERDaTI4VjB5d25QcjBpbC9mRGgrUmhhRURFTGU5K1h3SGJqYldRNTVk?=
 =?utf-8?B?TUdHRW5WTHFNWVNOMzlzWnZjaTVkSDFtajl0czJ5UVpRTDNlK2g2dGFXbkcv?=
 =?utf-8?B?Umpja2M2cFpxYklBTjROUGVHcFd5MzlVZzZ0cWV4Z0gwQnVkVjRrQjMzc2VT?=
 =?utf-8?B?WndWS280ZFcxVU0yQWY4Vy9yazBTcXNpNlNzc2JXSUJ1SnFpYTNYSWZuOUJC?=
 =?utf-8?B?Q3VZdXMvQXJnMkZkYWVJdVdEYmc4VWoyV21EUDdyQnVPK0VTQnZoQ3NJVTJm?=
 =?utf-8?B?MzdDeEQ2YUk1ZDBHb1M0K2RmcHhYVlBYM0R3akJ6Um5BZ2JzTUpLaVBNcXVv?=
 =?utf-8?B?a2dPZkNDVm9pUFFzZ243UEhxMGxiM2lNRGlGdE4xOHZ6UUF5ODVWY1ZCYlFJ?=
 =?utf-8?B?dUFKanBSb0NQWktONlhTcXFsNFlGaXBPUjFwYlRKaU9IdUNOY0J2c1U4emdP?=
 =?utf-8?B?bzBSeXZHb1hLekNWbFZXQjJzeXFRU0gvZkV6TTdraUZRTHY5aFJiN0ppdzR1?=
 =?utf-8?B?aGtpcHFRZHhWU0VYS21ZMFN5TWJ2cnIxVytlaWJoOU1VWEFMY1NJTFZWbjdu?=
 =?utf-8?B?elZqWTRuUDNXQ3I5anN5UGFGajBtRzdoWERWcDBRUjlxZkJIZ3Zuc1daSE1U?=
 =?utf-8?B?WDNHM0JXRDg0S3RxaGRtWVg3YjdQa01OTFRSNnZJYzkvdDhjeGhYWURUR1ZC?=
 =?utf-8?B?b21US1h4d3A4UzdURG9lOENFYmVDQjJQakV6czNRWTU2NXBra2p4RXZ6Y3ZC?=
 =?utf-8?B?c0ZyQnZETHpjSWdvaTBreStCbnR5NEU4OHU2VHlvM0FWdHlvRFdQNlJhK0U0?=
 =?utf-8?B?SE1hNFY2d3ZtUjZ5Wldiby9zOElaSEhBNHJDL29BUjlaYUxWSjVZN1crcFNH?=
 =?utf-8?B?djllQjA1d3BIWEZtQnRpOHNrdG1UVk1vbUtObUhyLzY3SUV3ZWQ5eXZVazZ5?=
 =?utf-8?B?L3ZVUmYzQ3gvUzY2MmlJVDJwL2E0dE5HeG9STFFGV0YrTlN4MTc5OWJkbkF5?=
 =?utf-8?B?MFd3TnhoZHZ1K3NFWC9hb0xlTmxxZzVEYXJ2NVRtazhBeE1XQmRKdWV2bG1p?=
 =?utf-8?B?OXFTQkFFRy9TZzE3WUphdHNGMTVCcm5heEZPMGNDbGR3YzY5L3BLazBPMUds?=
 =?utf-8?B?MUdyL1ZuaTdoelJJcUFjeXRsOFN0NStmbjNlYmhBV3I5cEx3RXlyZkxDK3I4?=
 =?utf-8?B?NFRXK3B6aUFiK3lSWWl3R2JkZG5pWkhudXBmTlV0SlNsNi90YVd0eHVRbWo4?=
 =?utf-8?B?NUJ3ZENXblB2ekt2TUl3a0JtYTdFMXF6dTRtcnozWmpvOHA0UGkzNy95YkZX?=
 =?utf-8?B?czRpM3cvakZmNjBabXFGRE5ZZ1Y1QkhEVVVUemQ0YzhWTUF0WU5UTU1JbFBP?=
 =?utf-8?B?a3lldEtaR04xVlV1cGRHZmRWbEV3Tm5QMG5yQytEVUZJR3lOVjM2TlIrK2pP?=
 =?utf-8?B?MHVicTIwVFVubUR5eUxOUyt0STNWd2Jvc1hLL1dibDdEdHo1TjR3Vko2SXVB?=
 =?utf-8?B?TDREcUJOREVkUmg5SUkxcUMxU1Y5NjAyT3BxSHl0djk0ZG40SmtXblV4NTM0?=
 =?utf-8?B?QmlRUVM5WDc3UHlRaWVmdFJaWG5EZkR3M05OQzZIRkFhclRyUE5TMGdNOEl1?=
 =?utf-8?B?amJQalhCM3o0eDYxU29pN3dndmpTc3JVeEpCM3dqcjJnVW1seFhYZHdVeGtF?=
 =?utf-8?B?UkJwN1orYnlNN05NM0lnRWZ5RStneStweW9uTUViMERML3J0bkJHZ25HdGV2?=
 =?utf-8?B?T3BKRXhEVk9BQ3FnYXIvWVAxZDk5Ukc2S09wZjZWQmtFOTBHamU2djNkY2J0?=
 =?utf-8?Q?NG2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2VOZ0syTSt5bFhqQXpCd2hMK0ZhVmFKbi9iSjluY0p0Z0xsOHh3RWVpVDVM?=
 =?utf-8?B?b3grNDBreDdoeWJERzlGcXBkQlZzdTY0Q0lDbVB2aThNQWZlUG1MYy94aUZ1?=
 =?utf-8?B?eGNWYkY0cUxpYkptWElFeDhYZmwrMFpjSndKT0Z4aWJaYmp5ZUdzWS9ROXNp?=
 =?utf-8?B?d2ljNm5zSnJWbVk1QWYyV1hxTXRBMmlSeGd1WkNDcExRMlJwVmNOYjhGeG13?=
 =?utf-8?B?QUFNSGlId01SS21zVFgydWIxeTNqMGR4bEgvRXdCZHNLeEsxSFpERi9IaWdR?=
 =?utf-8?B?emZCUFUwOVJWMTR6cVNiT3NyZTdSRjlmdEdHQXRPNDIzdWlqVUhTNzNZWGo3?=
 =?utf-8?B?aDNkdHg2VTJwYzBmQXFkWFRZc1FLWmRSRjRxZkswMnJtN2lBZVJ5NUZoWmQr?=
 =?utf-8?B?akNRY3VKMng1Y3lxQ2pnU2NmT1locUh3VGdLVzlRY1JxeDNyZUxrYWkzU3JV?=
 =?utf-8?B?YzdGeEQ2K3hXZDVhQTBIUWxJUUtNeUk4aXBiNmVXK3ZWT2thYTVRdGh4bEFu?=
 =?utf-8?B?VHpSSUpORUJYVmVkR1MwVDRIK25UOUZvd1AwMVVPWXN0N3M5MVpJelZRTFRx?=
 =?utf-8?B?Q1dZRHJwS1RJZTNhT3RxVmlTWmhSaytBUm1FazJtZEpqQ1RMSVhQRE9MUERs?=
 =?utf-8?B?N3Z1Q3p4bFNCOG41b1FLU2RlTWYvVnZlTDZoRGpiKzZYTVFmV3J0RHFPNEQ0?=
 =?utf-8?B?YkdKYVlJOGpFbE93OVZGUkZrdEZpUDdwRUpDK0VsNUd0bS9xVlFldkxUTDRk?=
 =?utf-8?B?SkhHYXFKMC9FNGo2MUg5NUhVNHc2MWc0ZS9qdnNQcWFZZkR6ZUZNT3RKeURp?=
 =?utf-8?B?U3ZydGNia2xyYXh2eSt1ekllakQ3MXBweUdOODBNdDkrTnZLNE1KQVVGQ0I0?=
 =?utf-8?B?cXBGWnRsTTBpVy9ZS3ZxVThLbkkwU3FFN1ZnbHlRaGM4S2E3bE00b0ErR1o2?=
 =?utf-8?B?eEQ1cW5RRTFKNnI1VUNVZ1hzMmJWSlRPemtSSjhWbTh0NXNKVnJvZmZRUDNX?=
 =?utf-8?B?TFZFbmhoTmlERnlYV2RJaElicmU0QWNTNGt2Q216dWtQRy9ld3lwa2hVZnpx?=
 =?utf-8?B?Q2R2d0hyeHVXczVCVWh1OHNrZmJYcis1Y0x1eDNMclVQbHNLK2lPUERJVWxj?=
 =?utf-8?B?SVN6aDRFTGtzQUtNVUlZRVVXRnJqak9uNkczbGwyKzgrRlF6SnJsd1EzUXMw?=
 =?utf-8?B?ajErT2NaL0pHZkVvS3ljT3RSV2tuU216Y09NUjRRRGVWSDN2azVIZUhNTTZx?=
 =?utf-8?B?YzFmeE43U1hrMEJvdU04T3JhYXhJZTE2QTZ2MUpIY0lzVDFOUlMvK1dqdVBE?=
 =?utf-8?B?OXAxQ2dWcTJXZjBKek5WYThiTzM0TzlwRHNTRHBROHBXbmVKamF2Vy9QS2hx?=
 =?utf-8?B?QWUzR2FqQ3dWUkpmWENwMjcrcXNkdDlOQWc5NkJNL25lN3NGbHh6bXVzUGlQ?=
 =?utf-8?B?cWgvTXpLQjhvM2lVNC93RldYdE0vVDVOMndPcnRHc1RMM1JDdjZIaU1RRHoz?=
 =?utf-8?B?RjUwM0EzSkQ0T1loMS9jRmtPQ1MwT1orcnplR0FqWklua1NBZHdGbUZIQXdM?=
 =?utf-8?B?RFl5SmFTZlFRNmZybU9hWmtkdGgxRnZ3dWtvQ3ZMUnBrRDhVdlk2TUJOSjV0?=
 =?utf-8?B?TElrVjN6Z3hrWHlTVHJYVEpNczljY0didk1ydWxnWjV1VHdrcE0wbVdJb0RC?=
 =?utf-8?B?cmZ4bnBrNTBrbitacHV0RGFkcXJ3MWFMbHZsbGdmbkZzeEFBVU13ZEtjWnlF?=
 =?utf-8?B?SkFnb0RYblpMbnZPUzZqbHNVMVN6ZXRGMS9od0Vna2s1emxTYkRHL1V0MkRP?=
 =?utf-8?B?RGpNOTZPd3B0NDg0UlpPa0ViNE9QTjJzZDhlSTFJRTZYUFp5OEN0RmRqcWVD?=
 =?utf-8?B?OUlZbDNEVEJ5VDlRaW5pbkUvRUYzRWtzT256WXVpUTJHbmRQRnFWdlNId2Z2?=
 =?utf-8?B?eStrQlJxTTJDQmNhSmZQTUdsVnN5WFRvRHphWXR3UUtVeVdlV0lIZjhUNVda?=
 =?utf-8?B?dlg3cncrSnRGajNTcEprT3IyeDd0c2tsYXJXcnNhSUVzM0txL0RyS2IxQkx2?=
 =?utf-8?B?WlhaRkhsUEFrNUFlcmFtbjZ1c3ZwYUN3OGI5blFzelRrQjE2cTY0QW5vekxV?=
 =?utf-8?B?WE10M0E1dlREQ1ZVbDBsNGwwZXp4a3c4bHd0ZVZta2k3ZlpndmdPeit4RzhM?=
 =?utf-8?B?MVRLVmdLQjhmN1N3ODJMYWkxaTNIaXFRK3d3elVSQUFQQWhMaFdScUU5eGhr?=
 =?utf-8?B?NEZLVmNVOHRpbEVDNDVvdS9ZRWpHWG53Q3Yrc1VVSW5yVXVXWVJ4TTJ3VGVT?=
 =?utf-8?B?QVhCYXIzSldZQ0NhNWVtaTJXTTlXZXdwS0lMRjBvakNZL2xtOU5iS0FMWGdX?=
 =?utf-8?Q?qdIuhfDhRj/Q5l79fpT2fE9Ev4zn8Wxk3iSmBW4vRCaAq?=
X-MS-Exchange-AntiSpam-MessageData-1: l0eOd5dg8GEn9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ee6302-acf8-4eed-3c95-08de5c8a59c7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 03:24:01.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cA7VpZPekgL/Jhj/Lf2VWmh1HUPrXCGWkubj/u15UouAwvc4JwiN2ANgtLuzn1cqq2KCiZDS2ua1II/IHWDSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124

On Wed Jan 21, 2026 at 11:15 PM JST, Gary Guo wrote:
> On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
>> Add a macro for defining hardware register types with I/O accessors.
>>=20
>> Each register field is represented as a `Bounded` of the appropriate bit
>> width, ensuring field values are never silently truncated.
>>=20
>> Fields can optionally be converted to/from custom types, either fallibly
>> or infallibly.
>>=20
>> The address of registers can be direct, relative, or indexed, supporting
>> most of the patterns in which registers are arranged.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> It looks like this is still based on the current Io impl. I think with Zh=
i's new
> Io trait this will look quite different.

Correct. The next version will be rebased on top of it now that it is
merged into `driver-core-next`.

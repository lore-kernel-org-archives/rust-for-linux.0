Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13DE215F42;
	Fri, 14 Nov 2025 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079996; cv=fail; b=XvJaFByccKHDQOsWPXig9+1AifjDj95gtBULUx2jcKquLfo34rSJQRFQuqtmqxf719oC/f9bD1SBX+5WRgODYACTa2I956HwlJkriFkxWuHWLQ8ysNbq+cJZu+adXyBi7qlM0KW8k+qRb8vm3pOZAgqxq3R0H9QmMuKBEbZYUO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079996; c=relaxed/simple;
	bh=rl3505OAQsWcEk46VgUiN5VvFCMc61J/kFQYeg6bT40=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pe77b1NA6PnLWxcoJz048dNStDDijR+KLPwCrF7THYUL3lFUm7iqBL4z/HWxi5hAy7V4NyAn+uFzQXs28ES2Lj0MNzoXcBUJTbixBf8DKS2JsQiL0wsXyHZ4+Drg38ASjZvv9Ha7A8Xvv+AhVtFc3cR0bNv/gM2dEX6smCfdZf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dd3uhkmJ; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dd3uhkmJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNNlJtxNro8WMSuBuDjBG8C5X9oW/xbXgYRv6Vn6dsfU6OUan5mukrXTHxHcQgvikkU2IZ2cfm2h9Do4dTjor2ULTzlAsxBk1yGz/OOiLwS7MvAkg5qPLueIRxzhLPf72/Qgiydu8Ir2ICAkd1Qllt6upjazoP2en3Uwl2RuHown1bIjwwJhU1uxWidAKGaYGhUdno4/HxB0/cwf0VpZatVwLGJmGpfme6Tn3FTlwe/wbDi6Ao20PriYnc0bOmq3tKW801ANP0hnTuBsP9TjJvFSgFMJFeEt/Ycs/sN0FJSBGKVVZeptYct3PBTe3V7Myybmmxg4s+L3IzuvrJ4cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNumKXWvcEeKuGPsurSfTkOncAS+0Lv6IK+4tXb91M8=;
 b=S95AMBM7HddypN9SRipscK8JPuoB53mWZim7Kb1jJXLcoS3Yq7TRRIIOBtxVXidHY0FFEcYQT23CkSdK2cdzetFHqUlL7L636nNjVYEnfXAkZmZl9/Canpsh3n43/S4oCwmcWMHqDpnpVSiZ5sjd17AgM4ozyhaqdvpMJWh4syPyCGuWJdagkRkopM7a4NGwLVrJ05vQAPFn+pbl3dbCLqAGiGMbNf73F++SO7QgeOZlwKHdAcBfVptZc+2FCEwFZMm4p+cXEJSt5DQyVnVc+n4k87oC2M2/sKFRTTyQwgs0y9tLkWfFCeA8pguVb24x51Y5kp5wAyKAkGSwxN34hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNumKXWvcEeKuGPsurSfTkOncAS+0Lv6IK+4tXb91M8=;
 b=dd3uhkmJGEAueaeqhg1uaavoX1uSHQdoIS0i/+NGcMugffaFbjza4WtGm9/vUickFLk2pF4WXbkQYhQ8LuBgtN+F2NoDjU8ARfwmQv5TWH2yvsr7zNOEuJIXKX+Iywk797pkrMjFxC4GUyTa7G9ZcENxVNapQfea0p0IuCwt3ByfuspT727Nin6V3HuyUaIheXan5YripptYSHOnhqaS+9qDMr9Tz2aaypIFxEGV6GZyEXAsL+078Ky5T/oZX4WvldojN5uiwCOG9tMMg4PKHNFf9DLGXF1dVIRLmtafpDLJWssa/eI1HxPqI0JADth2qjmLbH23e270a2G2JrOMRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS5PPF18A985A10.namprd12.prod.outlook.com (2603:10b6:f:fc00::645) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 00:26:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 00:26:25 +0000
Message-ID: <8d5b3dcf-c233-4040-96a9-8ee7b000aa2e@nvidia.com>
Date: Thu, 13 Nov 2025 16:26:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rust: workqueue: add creation of workqueues
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Philipp Stanner <phasta@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benno Lossin <lossin@kernel.org>
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-2-8b45277119bc@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251113-create-workqueue-v2-2-8b45277119bc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS5PPF18A985A10:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a692019-0259-496a-caea-08de231471d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0ZPWmFTTlJkSEY3Uy8za0d5RFgxV2ZwNENnYlpKbWR0ejlwZXQ2a3d6TU1s?=
 =?utf-8?B?N1crejhuNFFaTVRVYjhLZ0toQlNBVmJiSDByc0RsUEZlbC9VdmNpZ1h2azYv?=
 =?utf-8?B?OGtiRkIzS1YydzlxUmdYRTByOWdydUdyRnFWUW01Ymt0YnpLS0o3Nlc5b0lx?=
 =?utf-8?B?ckxSTW0xQ3FTeUdSZldFS1R1MVFGMm1IMERydTk4SVY3Y2Q1MlA2VnlVZTRx?=
 =?utf-8?B?VlY5dzdwV0hRWTJHb0VEeVF3aXlyVTViL252Q0lRUmRLOElSdlRTLzF0UEFT?=
 =?utf-8?B?dDZ2NWtKcUQvZ2NGMVd4R1drWThXckRlK2p5LzBkbHhrRWEwaWtyV01PTUt3?=
 =?utf-8?B?OWVWb3M4Z1NvSlppR0lGOGNTL0Y0c2FBdzVZRHBkT0p4bmpFdXpIZkFpdW5j?=
 =?utf-8?B?UGJkakRvVGhOQXVTV1BiWlZhZG84SkhWVmJFZDFhSlpvS3hTSG9GM0hZQ200?=
 =?utf-8?B?ZW42NG02ei9PVjhOVmZ1T3dkMjZuK2JsS1E2dkpBM0IyN3Y5SjlpZVJMcngw?=
 =?utf-8?B?bGpyUW1uSS9wbk03M1V2TmZ5OWJHWjgvSUxBSk5MV1ZYMTdCanV5cW12Vm05?=
 =?utf-8?B?NVVqYjFYRnpieVl2OXl4MmI4WiswSXVPS2drako3YzFLSHdoZGt5VFBnWGtt?=
 =?utf-8?B?M1NhcEFMRlczOWVTUDhyMW9lb2pFWUpzSEhINDJmaUFhaU5uUWpENjNROURI?=
 =?utf-8?B?R3I0Uk1XRUdqanptUUNrWEp6MGRiekp0bEd5LzRXWVBVNjhDRVREbUV5NURD?=
 =?utf-8?B?OTRCaUxEVXlaSW44K2hGKzBtZHVrRm0vc0NuSGJ6VjFwSzZ5Ukk5YTkyOXhG?=
 =?utf-8?B?elJNaSt1bUhDZmV5OHh4bmNjb2hGV1VKV01ZSGt5aGE5UGdKRGlQQ2pqTmpK?=
 =?utf-8?B?aTNDSjRMQ3dTWmEzS1RZTkoxZzhrTkc4VCtjcGlPOE1nZHZQSlFnaktNRHRx?=
 =?utf-8?B?b1phVGxKQnBpd3NxL3NheUdFNlR5UDBVOUFzajB1YlArTm1EVDI4SGJSdHBE?=
 =?utf-8?B?cDNQSjYzRUJvY2pEbGlBZld1dmNEK2o4NU4zSmt2UDFqYjNZbkNIL3hBRnRC?=
 =?utf-8?B?bDZlYVlmR0hOelJJWlp3djYrNmI0UXhWcW5JdXoxK3pSOFRoNnBaSzBSWC8y?=
 =?utf-8?B?ZTBNMlFxOHp1NGRIaGU4SW4zU1FYR2Z1MUhtZUVLQ2xUYStoZERjN3NqSE40?=
 =?utf-8?B?S3VxRXFNWkhUaTN4WWVuc05vVCt4b202dzdYWmdpaVViSGtFeW41VUtCWi9K?=
 =?utf-8?B?c3JpUElkekRrUHlRdmMrVWhBVTJzQnRuZGQ4bFpZUGdHWEl1Y1Azakw1Uit3?=
 =?utf-8?B?ZzZCRG1rT1M3UDJ5ZC9iZTZPZUdXK1AvSnByTUFkdnF5MlUwNEdoSDk3UEdP?=
 =?utf-8?B?dGMybGtYWCtZODY2ZXBVQzk3TmNSYVZ6N2hQNng2UTFJdUFXTXlPMWJxbWxO?=
 =?utf-8?B?VC9wZVZsNU9hSTVWeWZ6QVMyeUhIVTNIKzN1bkZ0di9sR0VLTHpRdXFreHVo?=
 =?utf-8?B?MnAxUHptOVRvSlVMSmU2a1pQakM1LzFXVk9vbTQ3VWsvMXJCZTVPRVJkYzEv?=
 =?utf-8?B?Q2NIWWNvZGxteUc3dXZxZHJHR2IxM3N1T3JSWWVUdXN3Sm5JVWtCM1UxY083?=
 =?utf-8?B?bTZsQkl5bzQzL2JJMXBDTzIySEtTa09SYlU0Y1EySFIvSXVuUVNnTUxQRm56?=
 =?utf-8?B?SkYzNzdTYTFXMnEweFhKbGk3RFZpTW5yUXBmQ2ZFQ3hGRnNUZmUzdmxCQ0t1?=
 =?utf-8?B?ejRkWlpISzFib1lkMHBsQU5TM3d3VXM3TUN0TWdOT3FWLzV2Ums0WFFGQjcw?=
 =?utf-8?B?UUt6YkhUam8wRmF0QU5FanhpUXo1MjdVVlJaRWlKZzFkb0tFckJpakRFSVNq?=
 =?utf-8?B?RVRKdEhoWEI1Z0o3TVV1cWdTQ1B1dDNrN0FoMndXd1Z0YXJmckQwOHp5dnBT?=
 =?utf-8?Q?VbC8Gye5wqs0EVxPIWLVeFIt1JssJF2S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUhpazI2eU5LQi9DeWozV3lQQmFHYlZLV0VRbVpDRktkV21OejlPdUkya2l1?=
 =?utf-8?B?dWdLY1Y5WlYyNjR2NFQwbXQvNEt0cUtpTHdXNHZPWkpTWVZ0YkJlenQzT09u?=
 =?utf-8?B?UEE2SzZDaGdiMUUvWXZnMjN4RFM3elhSU3lPRVZxOUI5QzB2c0Y4cTNZYlU1?=
 =?utf-8?B?ckt0MmRYaERJemJzSWlQTlNPVzd4SWEyQTZUZVdwVjdwUlk5MjZZdlg1V0s2?=
 =?utf-8?B?WTdqN0FaeW9KUUFJWWRSSkZVd25LVWNoYUQxbTZEUHUySGRYam9wSXo3aTVt?=
 =?utf-8?B?ZEhSbE9vNWY2Y0h5bWc3anFtbkdxUHdiditLNHVnUSs1VHdERE1yU25xN0lL?=
 =?utf-8?B?UTA0K1llVWw0TCtZSExQS3pyWUpnQTdtaXFrMGl2VGl2RkpSM2FhYzZJOVUw?=
 =?utf-8?B?TVNhaTArK2t5R2dNYUlUcnJtMk9mN2ZFN1A0MzF6UWhTa2E4L1cxbkxldUhO?=
 =?utf-8?B?NFlIQVIzcUg2UHpKdHlvRlA4a2RIZVZVVWl4aVpjTDdyM243cVF1eGtiRkUw?=
 =?utf-8?B?RUFuUk1oT1VzNkEwamk2VGFjWnNsYlEwUG12UTNIQWhGcmhMek1OdktYNm54?=
 =?utf-8?B?YWM1ZEtKQmd0aHJkRElReHdIRkowRXAyeHpRM3ZmQkNJMy9Jb2NCOVRCNEpp?=
 =?utf-8?B?SEV2aUxVT0ZUT2daU2xkTXI0ZGpCbnlVN3FNcndCS0pjdGoyR001elA5d25o?=
 =?utf-8?B?SVhITm91Y0tNT2k4Yjg4Y2k3THhwMElqRDdmcjBpY0t1Mnc3MzM4bjUxNTI4?=
 =?utf-8?B?QVlYcFBZb3pvQlc5b2pmNHpZVHAwRnhmNGJsZlB0ejI4c2ZEOXNFYVJNNUla?=
 =?utf-8?B?dWpHWXk2bUVBWFJNZVluR0lqZlpjVVBtV0swUk4wdXg3RG9rNFk5dGlJemdx?=
 =?utf-8?B?ZHhDMFBsODd1T25Pc3NSTUVVRTF0MjhLemlZUzNBM0ZHQ3Qzc3UwK3U1aUk3?=
 =?utf-8?B?Qnc0VGNPZ0FJaVUrSnczd3pFaCtNeDJDeHI5QXpSRVU5Z0VJd25wVkh5ZldR?=
 =?utf-8?B?Q2E4eVd6TTltdkdTdnFjN3ZMUHl6Q0FUeVBaYUlGS2ppRHRWK0UwYzN5dktX?=
 =?utf-8?B?QmVhZm1POGU4WVhkZGhUblBuczZLckNteHRPRUdqSTM1TkhmckduMVRGaXpZ?=
 =?utf-8?B?RStON05TcVZhcHVYODNWTHlWZ3FKK0kwK3IxN20zM3QzM2g1cXc2T0tKNGNJ?=
 =?utf-8?B?Vndka3BKR00rcHozRjhsWEVUSHhzcG9sUllrZzNJMVpzelM5WHhkWHJ5aG9a?=
 =?utf-8?B?MHNOQ3VweGtuU3pnL1B0bG1paFgrYThUMSt5N3FFTkYybVE4dTFLMmp4SFlB?=
 =?utf-8?B?a2hybWpLZFlrOW9GL3d4VVJvNWFaZ1VlcUNNUVNRUkFPRmRTZ2pyc1lzMXYz?=
 =?utf-8?B?UFZUWU9YS0pOVjFMN3ZwQWlkNmNqVnRhOXIzbW9nWXgzMjFaWHJPU28zeWZP?=
 =?utf-8?B?UEVNYlJDOW45TmZKbVBiUWlhRG01bWovL3NHK0NmY0t2Z0grMkJKSEUzaXdi?=
 =?utf-8?B?UDQvY0gybnpzL2N3YzJCUC95d3NIdVAyejE5YmVIM091Um0zaWlvMEROeEVK?=
 =?utf-8?B?bnFCdUZpWllOV25LM1RJWVc3aTFuOFAwZ1ZzQ2hWczF1ejZqNFQzS25EYjBL?=
 =?utf-8?B?WnNSTFRESXNUeHJoU2diQkNoTjBmSXN3SndSV29EUE8wOWVDdmk3U1A0Nkhw?=
 =?utf-8?B?Mm1WcVJqMkIwTEV1YXh4L212U1grU3JOOTF3ZUVkVi80eDM1bjBiZnBtaFEv?=
 =?utf-8?B?bWx4S0VpZUJ3VWVuM1RxeERCUktTOTcxWDQ5c1htc2ZiNEh0NnFxSGo3YXBL?=
 =?utf-8?B?aE5UdXpxY2gwOTVGdXBEZVpFMUwyYU5rOTZXMW1XTmVKcXNZZmVLZ01SOS94?=
 =?utf-8?B?YkNaZTJDc3R2S2JxQzBQaU96aTErZlBhcCtrVzRUWGx1ODdhYmw4WkVHOUtp?=
 =?utf-8?B?aFNXSWY5K2ZxS1Zqb3QwaHk5cjljR0ZiRFAxR0Q4cW1hdmVjcFErdzNCZU9D?=
 =?utf-8?B?UWZOUGtQSmZwYnVHZllEQzlZb3pLTnZXbGpTeXlOcmNoU1IzdW11dVZySkJV?=
 =?utf-8?B?b0RZdFdaQ0RpN1JtUTU5MytQREp4c1ZFblJFOGN4SVgwQWRvOUk0R2tEbWpH?=
 =?utf-8?Q?G65c8x8Px+srcbulXl6FnQTwT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a692019-0259-496a-caea-08de231471d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 00:26:25.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad3dTCUdeaIsIGgUq2GykNU3hCHxHWT790c+QOH+UKweEHkf5AHbFN0OrLslufAJPAioTlQknJb4+vLmJ0l/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF18A985A10

On 11/13/25 2:01 AM, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.

Hi Alice,

Thanks for doing this! I am not seeing any large issues, other
than the Device<Bound> point that Danilo requested. 

> 
> A wrapper type Flags is provided for workqueue flags. It allows you to
> build any valid flag combination, while using a type-level marker for
> whether WQ_BH is used to prevent invalid flag combinations. The Flags wrapper
> also forces you to explicitly pick one of percpu, unbound, or bh.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/workqueue.c |   6 ++
>  rust/kernel/workqueue.rs | 185 ++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 188 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> index b2b82753509bf5dbd0f4ddebb96a95a51e5976b1..a67ed284b062b29937f09303cb516e6322cc961a 100644
> --- a/rust/helpers/workqueue.c
> +++ b/rust/helpers/workqueue.c
> @@ -12,3 +12,9 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
>  	INIT_LIST_HEAD(&work->entry);
>  	work->func = func;
>  }
> +
> +struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
> +						      int max_active, const void *data)
> +{
> +	return alloc_workqueue(fmt, flags, max_active, data);
> +}
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 901102a8bca54c9fb58655d80fc9624b4dfe1dc1..313d897fe93ceb84844ce9b253edec837e60ba6d 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -186,7 +186,7 @@
>  //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
>  
>  use crate::{
> -    alloc::{AllocError, Flags},
> +    alloc::{self, AllocError},

Nit: that should be:

    alloc::{
        self,
        AllocError, //
    },

>      container_of,
>      prelude::*,
>      sync::Arc,
> @@ -194,7 +194,11 @@
>      time::Jiffies,
>      types::Opaque,
>  };
> -use core::marker::PhantomData;
> +use core::{
> +    marker::PhantomData,
> +    ops::Deref,
> +    ptr::NonNull, //
> +};
>  
>  /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
>  #[macro_export]
> @@ -333,7 +337,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&'static self, w: W, delay: Jiffies) ->
>      /// This method can fail because it allocates memory to store the work item.
>      pub fn try_spawn<T: 'static + Send + FnOnce()>(
>          &self,
> -        flags: Flags,
> +        flags: alloc::Flags,
>          func: T,
>      ) -> Result<(), AllocError> {
>          let init = pin_init!(ClosureWork {
> @@ -346,6 +350,181 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
>      }
>  }
>  
> +/// Workqueue flags.
> +///
> +/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,

Another tiny tweak: "contains exactly one", just to be extra clear.

> +/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
> +/// flag.
> +///
> +/// For details, please refer to `Documentation/core-api/workqueue.rst`.
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct Flags<const BH: bool>(bindings::wq_flags);
> +
> +// BH only methods
> +impl Flags<true> {


> +    /// Execute in bottom half (softirq) context.
> +    #[inline]
> +    pub const fn bh() -> Flags<true> {
> +        Flags(bindings::wq_flags_WQ_BH)
> +    }
> +}
> +
> +// Non-BH only methods
> +impl Flags<false> {
> +    /// Not bound to any cpu.
> +    #[inline]
> +    pub const fn unbound() -> Flags<false> {
> +        Flags(bindings::wq_flags_WQ_UNBOUND)
> +    }
> +
> +    /// Bound to a specific cpu.
> +    #[inline]
> +    pub const fn percpu() -> Flags<false> {
> +        Flags(bindings::wq_flags_WQ_PERCPU)
> +    }
> +

It seems like the one public-facing item that's missing is
WQ_POWER_EFFICIENT. Should we add it? It provides some nice
flexibility for things like laptops.

Although I see that it has not made its way into
Documentation/core-api/workqueue.rst (!).

Also, I think WQ_CPU_INTENSIVE might also be a desirable
addition.

> +    /// Allow this workqueue to be frozen during suspend.
> +    #[inline]
> +    pub const fn freezable(self) -> Self {
> +        Flags(self.0 | bindings::wq_flags_WQ_FREEZABLE)
> +    }
> +
> +    /// This workqueue may be used during memory reclaim.
> +    #[inline]
> +    pub const fn mem_reclaim(self) -> Self {
> +        Flags(self.0 | bindings::wq_flags_WQ_MEM_RECLAIM)
> +    }
> +
> +    /// Mark this workqueue as cpu intensive.
> +    #[inline]
> +    pub const fn cpu_intensive(self) -> Self {
> +        Flags(self.0 | bindings::wq_flags_WQ_CPU_INTENSIVE)
> +    }
> +
> +    /// Make this workqueue visible in sysfs.
> +    #[inline]
> +    pub const fn sysfs(self) -> Self {
> +        Flags(self.0 | bindings::wq_flags_WQ_SYSFS)
> +    }
> +}
> +
> +// Methods for BH and non-BH.
> +impl<const BH: bool> Flags<BH> {
> +    /// High priority workqueue.
> +    #[inline]
> +    pub const fn highpri(self) -> Self {
> +        Flags(self.0 | bindings::wq_flags_WQ_HIGHPRI)
> +    }
> +}
> +
> +/// An owned kernel work queue.
> +///
> +/// Dropping a workqueue blocks on all pending work.
> +///
> +/// # Invariants
> +///
> +/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
> +pub struct OwnedQueue {
> +    queue: NonNull<Queue>,
> +}
> +
> +#[expect(clippy::manual_c_str_literals)]

Any reason not to move to c"" strings now? I suspect this is an
older patch that you've revived, and since then the new approach
showed up.

> +impl OwnedQueue {
> +    /// Allocates a new workqueue.
> +    ///
> +    /// The provided name is used verbatim as the workqueue name.

"The provided name is used, verbatim, as the workqueue name."

Or simply:

"The provided name is used as the workqueue name."

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::c_str;
> +    /// use kernel::workqueue::{OwnedQueue, Flags};
> +    ///
> +    /// let wq = OwnedQueue::new(c_str!("my-wq"), Flags::unbound().sysfs(), 0)?;
> +    /// wq.try_spawn(
> +    ///     GFP_KERNEL,
> +    ///     || pr_warn!("Printing from my-wq"),
> +    /// )?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn new<const BH: bool>(
> +        name: &CStr,
> +        flags: Flags<BH>,
> +        max_active: usize,
> +    ) -> Result<OwnedQueue, AllocError> {
> +        // SAFETY:
> +        // * "%s\0" is compatible with passing the name as a c-string.
> +        // * the flags argument does not include internal flags.
> +        let ptr = unsafe {
> +            bindings::alloc_workqueue(
> +                b"%s\0".as_ptr(),
> +                flags.0,
> +                i32::try_from(max_active).unwrap_or(i32::MAX),

Or just make max_active an i32.

> +                name.as_char_ptr().cast::<c_void>(),
> +            )
> +        };
> +
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
> +
> +    /// Allocates a new workqueue.
> +    ///
> +    /// # Examples
> +    ///
> +    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
> +    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
> +    ///
> +    /// ```
> +    /// use kernel::alloc::AllocError;
> +    /// use kernel::workqueue::{OwnedQueue, Flags};
> +    ///
> +    /// fn my_wq(num: u32) -> Result<OwnedQueue, AllocError> {
> +    ///     OwnedQueue::new_fmt(format_args!("my-wq-{num}"), Flags::percpu(), 0)
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn new_fmt<const BH: bool>(
> +        name: core::fmt::Arguments<'_>,
> +        flags: Flags<BH>,
> +        max_active: usize,
> +    ) -> Result<OwnedQueue, AllocError> {
> +        // SAFETY:
> +        // * "%pA\0" is compatible with passing an `Arguments` pointer.
> +        // * the flags argument does not include internal flags.
> +        let ptr = unsafe {
> +            bindings::alloc_workqueue(
> +                b"%pA\0".as_ptr(),
> +                flags.0,
> +                i32::try_from(max_active).unwrap_or(i32::MAX),
> +                core::ptr::from_ref(&name).cast::<c_void>(),
> +            )
> +        };
> +
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
> +}
> +
> +impl Deref for OwnedQueue {
> +    type Target = Queue;
> +    fn deref(&self) -> &Queue {
> +        // SAFETY: By the type invariants, this pointer references a valid queue.
> +        unsafe { &*self.queue.as_ptr() }
> +    }
> +}
> +
> +impl Drop for OwnedQueue {
> +    fn drop(&mut self) {
> +        // SAFETY: The `OwnedQueue` is being destroyed, so we can destroy the workqueue it owns.
> +        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast()) }
> +    }
> +}
> +
>  /// A helper type used in [`try_spawn`].
>  ///
>  /// [`try_spawn`]: Queue::try_spawn
> 

thanks,
-- 
John Hubbard


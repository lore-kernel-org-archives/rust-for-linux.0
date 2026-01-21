Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021120.outbound.protection.outlook.com [52.101.95.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC40322B77;
	Wed, 21 Jan 2026 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019589; cv=fail; b=Vk017x7kBIjI1gim5hbgnKOTmUerXmOAqMWkNgQjEMKVCJamAXhJJi7fBh2g5EoSF8eX9Vrr9FSOBnsAKgI8RKYDY/J/Wmvx5GQXP4f/YvDVkKKSw+KEY4UnfgK2QXmpVsIjXDdH0zsv8GgGmPMublfSQ/8KK8RI4gDzHezFUQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019589; c=relaxed/simple;
	bh=9lNe0ArC5kD26qRYPNpbgvwgIOHBsdk6n4/1c3w3KFs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HscLkqA3WKaoInftKYkuEVEbYTAztCBbnBMeUSsB8JDJmN98JBz87GDlD6iHDxIZfScN/0Dm9pT8JSwB6Ji/FTR8rhYdv8GUuBrrkckAI0ykZ3uYLc1u+sTYvf4iac6fUt8//lEOCYWEhfoeOylXZyjgWNoQS2rkps5LouFVEOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LwFieLbL; arc=fail smtp.client-ip=52.101.95.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LwFieLbL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv118MtfCw5XpVK681ICPm3d2kWCdT9yJzXGD7wuppDKtcow/IJKDIDR4QjLdgrC1DgnqCgdwn1k5Gi1n5ag9vQCUI8dZpg/nXaQ6PeHmh64FloKc90MaoLc7L8BzxGAKbuzBI8vXt7/19m1JXhLxbIBTfxiCJfx+SOZXKjaLe2yOTDP9a6FFXaeeF1REIQAssdygm0VeLW9jZX/Eeaxj9Qe7uRG04qvQhZQbBa9G78tEupnCgU1BxucETlcAzUyZTIAC1+jM+075Ng5schgRQGUH0FxZylWuQuMnOdX8QNRHh6YLKo8aheGZc5GI6j4udKKMeYi/ezptzCQF2Rdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKHwUy6ZO1Al5JswhwpHRhzlJyirGvLHfLlnePtdZFc=;
 b=FoWg8eyH7atWfSUWPQD+a3nm9HegXPBFYqrhxxDwKltOefJNgVXB7LVfuo/sUVx3X1N5JBgbIiZ9E9Y6J39dDElZyAkykx6jgruhqQqL6Bn6UQPpwK2iC7wkCArjSV4fh0VWEsiFNrNGGRnZqg+HUmBGfyUEj3DQSr5d3uovoXfl0X20SDKv3SpBBsva7gGcXbZlm4rLNrXlp7vmQ4/GoazvQSgZeChzrNvBN0Ssq2DJSZsXrwHfOrzKTDa5f8I0BcYWCH6vi/pR4ULNvVnsSlXrq/eTz98MzFFpFieK3hBDKVRYByYCnYO1AQsQVfcz/mLYLNK4VERGaDKdjXC1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKHwUy6ZO1Al5JswhwpHRhzlJyirGvLHfLlnePtdZFc=;
 b=LwFieLbLv/D3z9/8GY3uj73SEuiX3gVnjymq/5rBXIoXxfn3+zOLAMGavj0YSHsoCMvN8b9iXk7KUziuyCXoRrECmiGltzG3PooMwTJgii8e3DMI4yuaOIR6h9S3WOe4vFXUnLC9GucHxAAKKCIgZ6zaxIk7MCy8vZc29llVkzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO6P265MB6986.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:322::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 18:19:36 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 18:19:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 18:19:34 +0000
Message-Id: <DFUH3PDOQCZ2.2QQSIB9IQIFO1@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260121165835.4097975-1-gary@kernel.org>
 <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::24) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO6P265MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 25edb573-bdc0-4526-996a-08de5919a165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEJld0Nuak1RSC9vR1FPQjNXRWJmVHcyaklmblAvNHFlR0YzZHhmVDAwRmZx?=
 =?utf-8?B?eTJJLzdKTGZWSzhVQldYdWdwR1RXVGRWZzZRT1Zab3hWNVhwZVpseVFXU09D?=
 =?utf-8?B?b0RjcXU3aDNtLzRZRTFYZkxzZDlzVTlzVzJEMWNsMzk1RXdTbHppMkJHSHY2?=
 =?utf-8?B?RWtjcUZPU1MvUCtnc1lXcHl4NjRKMlVGN3U5aVMvR2lYZk84c1hVbkQyc1gr?=
 =?utf-8?B?Mk5uOWxYbUF0ODdwcWxqREkxNHJiN3YzQW5udUsvTlYwOVppSkQycXkzZ0Ex?=
 =?utf-8?B?bnBpOU92eXkvVUNZQkFkWWVRQTc4TWRNOWcxZE1PSHdEREsvWXhIdmZuWk1Q?=
 =?utf-8?B?dWFvS2RoQ1hBVDBzNzNiYXdySWVudXQxL3V6WHMvMEJZdEhnVFgxaUZHM3FT?=
 =?utf-8?B?a3FlUUhiWk5TVWlxdWNwK0hxV1BCam4yYmlqSGdDc3RUU2d0bHZnaVRta24v?=
 =?utf-8?B?T2dBYU11YjVxeWM0SVRUZ3VlNEphNjhYeDIvVy9lZXYwWXFKcWF5ems0N2Nx?=
 =?utf-8?B?ZTY1RFg4Qm5sNWV5KzdOMnY5azB5N0k3YldmaDZQSnFKUDB2emJtT3hwazdM?=
 =?utf-8?B?UjJSTnpLY0VReHdDeVpWTnJWaWRiVk9qQ28zRmMyaHFaV0pyZ3Jkc3BPY2ox?=
 =?utf-8?B?VHR6U0RFbnlzMVhyZU9OaU82Z3JaTTJBY0d2aHZzWWZLOXozVnM3QVBFMGx3?=
 =?utf-8?B?b0g4YS9LeDM0Wjl4dS9ZaG9YNmdRL1JScjJZT2tZV2hYYjFONEk1U1YvUlRO?=
 =?utf-8?B?Ryt5Vll5U0VDZ0cyc3BqZ3p4dVdhY2Z0TGwvRThLbWhXdVVXbXJrVlVlN3BD?=
 =?utf-8?B?LytadHhSMldOUUFSZjB5U0dzckV6MGVuT3JuOUcxMTRLNWpqUWFSaXR3MUlx?=
 =?utf-8?B?OXpleHdIUHRaWC9XQ2FyU2pJU1NkNEpraDBkaFd2ZUNyN0xyN1ZQSHNHVDVC?=
 =?utf-8?B?TXNvcUV3ejMxQjF1ajk1dFZoWVlZKzc3d294TWszaDNZZll0TnNoSWUyZ2RZ?=
 =?utf-8?B?OE1GdXlJcHF4a1YxUHNveUhZM0pmTmtrNnluQThxaGZaTWtlZHdINXRCZU9P?=
 =?utf-8?B?YkpNOENxL0ZtMjE5NFY2cm51bEhNRys1aTR3L1Jrd1BjYWQ0WG9rNXpUWHFq?=
 =?utf-8?B?c29lRkdSdjVpU3hnZkkzamdMdVNrR2FtY01iTFgzK2JUdVVnK20zdDdqTEZE?=
 =?utf-8?B?dmthSzJLNTh1eEFPMWU3WjQ2bEdNKzNnbnEvQnNtekxFa3ZTQ2JCRUFVc25z?=
 =?utf-8?B?NWVFWVJZYng5Ukk0T3dDcmc2ZXlYRGpHSVhTNHFLUXJ0SjJSY1FZUTBJMjVI?=
 =?utf-8?B?N2NTbHplelc0ME5QdkZ2V1d6dzV1Y3V3NUNGSU5QWnl1ZmMvRTEwZzJqU0NF?=
 =?utf-8?B?dzQyS0NkV2N4dndwSDZOTGtIYlNZRll5SWJxNDh2Qk1IVTJFTGFocm5BTGFP?=
 =?utf-8?B?NDVrcTVDOXE2YUVqbVMxMkZBZldFc29DUDJTREJKeFNXMmJSTmZHRG5pM1pH?=
 =?utf-8?B?Q01NWEIxT1R5cm0yNWg5L0ZmMlpDTjlqRUNsR1oreDhCUlh5UnU0ckZIUmJz?=
 =?utf-8?B?eHlTTFk3T2s4QkozNWdtZk56amlZWThTWjhvYVdhZUdzRDJhamxtZzl6STUw?=
 =?utf-8?B?SmROekhsRXNTRS9PUnRTUEZkQ2FqVU5nVmxGRjJPT3labWZCRGVEOXNOQlk3?=
 =?utf-8?B?bDVjcWdwRGhxK3BSMzFURGh4VDQxWnFSMFpFMG40VzV2ZDQzRjJrU090UUNG?=
 =?utf-8?B?TDUram05N3Y0STMzVTRhQlZscnQ3Q1k5cHE2dXJ2UW1vZzQ3blprZEFya0ln?=
 =?utf-8?B?RGw2ZUp5Qjh4MEF0aG1JTHdjdGdpUmJJU2I0WlpTeEpkKzJRc1pBRW5DR0tm?=
 =?utf-8?B?NklRbmJOTVcxZGJOcWtJTWVNY3Rxc2wzMzhldDJvZkY4UDZiZ3FERysrREN4?=
 =?utf-8?B?bGRHSXF6L3dUN0lJRnIxWjVGUlREK2I0eC9EQTcxZkF6ZFVLc0t3QUhod3BE?=
 =?utf-8?B?SnkrL1p0ZEozempwdG1ZdGdJSW1XSEdjdUh5cTJxeUYvdWR6KzNMMWo5Slpk?=
 =?utf-8?B?ZmRoQ0ZZV29jZVV6UGx5NHdHSnBBcHg2ZlhHQitEcHZhcHBtMkw0TitJODlH?=
 =?utf-8?Q?v4Og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUphOGdldGZsd3VvWDJsWk50QjIyZmNxenBJYU5xZUlJT0Q4M3h3dTZYbFdm?=
 =?utf-8?B?Z0hLNkRNdXlveEwvaDN1Sk1wazZVZUFOREVwYVhQTlh4eTc4elI0d2taOFBU?=
 =?utf-8?B?V29UazJ2U3d3UVRmOXNIS3FBZ0FMQUkyK25YL1liNnlUTkJNM3FwV0k2dGJN?=
 =?utf-8?B?dlprSjlQNHZzSkNZVWJuNE5GUEs1R08yS1lDYXBiUzNYdkEzbjNUMEVUMnJt?=
 =?utf-8?B?ajBONVNsOFFBdS80S1dUSnF3UXkvTFR2VmtrbFYxZ0oyNTRjZ2tiWWo1aWlv?=
 =?utf-8?B?MXVaOHB1OUZtdFIvVnRJd05nb3RiZG1RRkxzZ2NSeG1MMTRwb1N5MlpDeDha?=
 =?utf-8?B?SFRkT2VBY1NIb2lESys0RDdTQ0NsOExNd3dHdlZJVHpKZHF6NVRjdGU1K0hE?=
 =?utf-8?B?WXBJeGlkSmk0VlhmMTI1YmFQeU5EWVJPTlh1SHRIdnJ4UVdwNXcybDJlNGVx?=
 =?utf-8?B?NWlUOUJnNy9YQ3dUNkN4T2paT3p2UCt4RFcvcmM5amw3K1I2YTJqRlA3dUZU?=
 =?utf-8?B?SWhZenlETVZWbE9IQStpd1dYKzdiRlcxNGh4ME9QT3l5bGxXbnh2WThqSFN2?=
 =?utf-8?B?MERuUnZheDVTY2tRS2QwMzVJZ2UzL2RyalJqb3RybTkrR21sMVpJNCtnQlZG?=
 =?utf-8?B?Q1JvcjBoeVFXUjBKbi9ja0M5bml3M2dsVERYMHV5bWt1bTNNNThMZStVVlp4?=
 =?utf-8?B?Um54cjdmUVgvS2hNZ1YwdE9GOEFSNWlVZ0drb2hzYXVYc243SnNsMlQrTWxG?=
 =?utf-8?B?RjhySVl3dDdHSFpCUU90blR3cktMYXpUN2dSdUphQWZVN3dXQ0JVckFRcFd5?=
 =?utf-8?B?VWtXbUxOMXlCM0lTYk5GK0pYOUQrYlAxY1dxbEdMYzFleW5RV3cyZkRreG8r?=
 =?utf-8?B?N1RmdmVGZVJ0blVvWHY1U0dOVDVjejhHL1E3MzByS2JmbmlqZDhMa1lNTDJx?=
 =?utf-8?B?S1A1ME5YQ1VqTkpEYnc3MmJDY0tvSnhFaUROdllDSFdDdmMxSjBuVTBQclp0?=
 =?utf-8?B?MVlwYnRDRmpUSU05ZmJDQmMxT3p1RzI2Q3Z6dGxXVDRQL2pBaWlPU0RZU3RU?=
 =?utf-8?B?RnVFL0pmc0JYOTgxOGtZV3NsWUg1WW5NWVZWd3pBWWdqMCtycjMwZVZWMURr?=
 =?utf-8?B?bkxCTW5RRmJhcGZRd29XV0ZXb2FibjdxWXRkM3dneXFsMyttVkoxd2RRS0k1?=
 =?utf-8?B?cllVNWVBcFdlKy8xMi9hdjZKSlZNbnJBaDJoRzl1YWFvTnVIYk5xWUkwUTR1?=
 =?utf-8?B?eHk2MUlKQWg0UEdiRnVuRFU0cTlwMENmeTh5ZlhkYUVYSWp5Qnp3bFdwbTE1?=
 =?utf-8?B?d05BbDJjNmZKWDlhYndBd3YxbWFZMUgrenR6ZFNCdW9WMDhZVlU4aC9UK1hU?=
 =?utf-8?B?YjE4c3ZiMEtqSXgvQTNGNTAzelRuaWpXMHdDVmhTdFB6RzVTU0tLaEp4YjVM?=
 =?utf-8?B?bVgzVm5HV1JRb3ZtNGJIdWs5dHg4SDRnYVl3WmI2T0RkT0k5ejJFNG9GUVJr?=
 =?utf-8?B?Q2Q2MkVzb3QzSXp1cEVKQ1E5RmVraG92cnBhQlR3ZjQraW13aVBWV3FsYmxO?=
 =?utf-8?B?T2M2ejF2K2ZlRVluRzJveHdTcU9ieXNtcTBTQnNPb3ZmampjbDlCeGFwVVR4?=
 =?utf-8?B?SkQ5YWx0Wm9Tc296YzRUNWhWN04rbFp6dVFpWTlLdHVIRnpXKzIra1I5RmpZ?=
 =?utf-8?B?Zmp5VkRSYzhIMnNnNzBzZ2JyZDkva0tzVHJSVkl3NkovUmVwTlZhOUVWUzdY?=
 =?utf-8?B?MUhaRXNlSnRDRTVqQXFIbTJwVnMxam90M21tZUxFSm9FTHc5SWlmMjVrVk5R?=
 =?utf-8?B?U0xBMTgzV2JicWtGdE5oZUV2NGhwK3R1SWJ1YmYxK2ZoQWhGYlZXR1JGOEZL?=
 =?utf-8?B?eVJ4M09rVzdsVkJEZmhIc3I0MjBSZ2hvTDFZQmFzN0tOcERqZ3M1ZVY4NHJK?=
 =?utf-8?B?bU5lQVEzU0xoOXBsTUVTaTVjWjUzSHNxeThSZEVNTWdIZ3hpOVMxNFlsZ1p2?=
 =?utf-8?B?Y2lPL1A2Z0F0a1pTWG5YZ2xMTVorRi82RDFONFRDNjkrL3dDUlFmQzh3YnRv?=
 =?utf-8?B?bTFFZEpWQktIYm9MV21BbmhxUzExK2tnUVlzQ0xKOEdVY2ZqOUQrVHdRLzM3?=
 =?utf-8?B?U3I5RlY5OVdoL2hacVIwYWc3QVU3b0hKVTNyR1hnek1uY2Q5K1RpS1FjTnpw?=
 =?utf-8?B?cG4zM2RFOVdFNjZhVGFRZWx5RUQrZGtXNUZpWjBVMEx0MFE3Wk9pRjNRS1Rx?=
 =?utf-8?B?SCtmdXdsOGVzTDVPVVY5MHVWZHpNbWdvRno3bUpkZGgrVG1uOGpsK1VGY1Nm?=
 =?utf-8?B?VTN6SU1GSXdGeklCVFpMSWZHeklvSnNQSkc2ZFhCTlJ0elVEVFJodz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 25edb573-bdc0-4526-996a-08de5919a165
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:19:35.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+KgxKma4Rzup9VFQe4CUOv8JfhvW2lTjJWy/w0QD4XK3K8eX71U4SBTBLRfQ8s6hV2qP23eBe/02HfXPQ6oOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6986

On Wed Jan 21, 2026 at 5:55 PM GMT, Tamir Duberstein wrote:
> On Wed, Jan 21, 2026 at 11:58=E2=80=AFAM Gary Guo <gary@kernel.org> wrote=
:
>>
>> From: Gary Guo <gary@garyguo.net>
>>
>> As kernel always use unsigned char and not the platform ABI's default, a=
n
>> user should always use `as_char_ptr` provided via `CStrExt` instead.
>> Therefore configure `disallow-methods` feature of clippy to catch incorr=
ect
>> usage.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  .clippy.toml       | 5 +++++
>>  rust/kernel/str.rs | 2 ++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/.clippy.toml b/.clippy.toml
>> index 137f41d203de..fd934bc04242 100644
>> --- a/.clippy.toml
>> +++ b/.clippy.toml
>> @@ -9,3 +9,8 @@ disallowed-macros =3D [
>>      # it here, see: https://github.com/rust-lang/rust-clippy/issues/113=
03.
>>      { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intended =
as a debugging tool", allow-invalid =3D true },
>>  ]
>> +
>> +[[disallowed-methods]]
>> +path =3D "core::ffi::CStr::as_ptr"
>> +replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
>> +reason =3D "Kernel's `char` is always unsigned. Use `as_char_ptr` inste=
ad."
>
> In the disallowed-macros section above we seem to use sentence
> fragments (no capitalization, no trailing period).

Ok.

>
>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> index fa87779d2253..08b8e2ebc8ad 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -189,6 +189,7 @@ macro_rules! b_str {
>>  //
>>  // - error[E0379]: functions in trait impls cannot be declared const
>>  #[inline]
>> +#[expect(clippy::disallowed_methods, reason =3D "internal implementatio=
n")]
>>  pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_cha=
r {
>>      c_str.as_ptr().cast()
>>  }
>> @@ -334,6 +335,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &=
mut [u8]) -> &mut Self {
>>      }
>>
>>      #[inline]
>> +    #[expect(clippy::disallowed_methods, reason =3D "internal implement=
ation")]
>
> Can this be inside the function, on the `as_ptr` call itself?

You cannot apply attributes on expressions (yet). If this is to be moved in=
to
the function, there needs an additional block, which I think is just
unnecessary.

Best,
Gary

>
>>      fn as_char_ptr(&self) -> *const c_char {
>>          self.as_ptr().cast()
>>      }
>>
>> --
>> 2.51.2
>>
>
> Acked-by: Tamir Duberstein <tamird@kernel.org>


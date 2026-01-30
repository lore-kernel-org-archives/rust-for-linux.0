Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF036AB71;
	Fri, 30 Jan 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786442; cv=fail; b=ZWpLPG4kLGGMk+nzKk/wa6aRM2/r9xsXafDuFEcupgrwSuEHUiX70DZqJYpv8gSanVv577fVl8+s1TfAb0Z8Ve2KN7yGw5iCeYbsLdc0p8ifg2mTnbV5ebt77tYaeIAK4s3uRMA7k1jXnCIgSPwPemIOV6Esjuvf0jAS+Bta+3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786442; c=relaxed/simple;
	bh=lsr82iM0RypjhJrmCjorS41DwUqbC86NPKp1cDd6i7o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WBTWRA/xUuVLen4SgSJ5YQZxcvMMyRZlGDWJ57daepVqz7LYGlv4LYcGMBVK7uKWV4jntIPXXUC6VC1/KPQp3uPUCm3MoiCFfZZerSUFm7V7k5ICnMNmoLcL4/tdNbNNeLyZYxe3wRb9fuOay8DVkyBXEAP6NVPxq74RtNIzmIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EtlTLaT7; arc=fail smtp.client-ip=52.101.196.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EtlTLaT7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rweMEs6che+N9KvlPtUlrxEbpATSuoT2vgopY2Q9hZGmyW8/LKL0NZpBzMCssrQ8eFDMuyRlNo/frCCTB0eoz/NjNP4US9UoPQQfaImnYl4c7aqUlEWMvxvj48NB27SxjKYlemlvVQ9sct7fCG9Ys1sm0pUnWyeERgNpUg+ggfDJjOjuHPbUFv6ccExaIqN2ZPI2TX3d+XJX20SBJ7Ri7WgggccKWX3qYdtfkjJf7QnCk62tliof9lGzCxjNZh2uxNFeNyeFTFIzLA9h7XsxLbHzU2n6V12XkCpPQOL6Gj2cCY7kCNvPXjXAiP7E3xZINxzJSxZGjy2PVmCyDtGpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEaaE40ezIjrDPnD7tHtjngTssWqf4lrdoO73sPbrcc=;
 b=AXA/0TiaNpL/odOB2gepo6hKAYd8Csmpq2DiPqCDO4Schzjrzrmz8XfTV9c+2kA26JEelNvEU/zvjQ2CewIB3462BLB8hrmLW1SfxLc8HJDm2Z39YLeVjOaS/TgLNru9W10G6IXgqYl+s8q5MdYMylqHnQQGzTXnEL1OkqDdSr7/+KFoel4Bj6/PYlRDTqDohl1YFlRkS9HNtpB4jlrtBSkbzBrnbwukvQ9m6TDF7Pr1SaTOUw0BWoQJgBr3IQ/bvZvPM4teOueJATwSkr//lI/6Vzgb/KVzg1GuBHi0E868rcv6+OLozfQmYVIvA7WNXL+4bcI91sjvvYyqES4urA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEaaE40ezIjrDPnD7tHtjngTssWqf4lrdoO73sPbrcc=;
 b=EtlTLaT7yiBW52v/+VNppI+CK5O6Mc6M6ANZJ6L/3LmuMfWlYg6MmPmFmL5OubJ131xGzgSukbHn939S2mO31JE2jMlcN0Jj3UjeOn+G5JXGmPwNcxQz8uc0pxbVgai74JxxFF9LUNe+QuXKiicAeZ+JYVOkDLDBfVM9vSdXVL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 15:20:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 15:20:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 15:20:31 +0000
Message-Id: <DG20XIGFWXHR.3JEF2WM3OHZ0P@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: update safety comments for volatile memory
 access
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260130-dma-doc-update-v1-1-bac46939cfea@kernel.org>
In-Reply-To: <20260130-dma-doc-update-v1-1-bac46939cfea@kernel.org>
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: e224ede9-f294-4f04-00ba-08de60131b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2JoeS9wTGsvZ2ZjQkFueHFONXZZTXBzdTJ3VXA5YnFVWFZqK0hyd1VkWDVE?=
 =?utf-8?B?UEgzcmV1TVhHVkQzVUc5N3ZDWWhVWWNVbVFWeXR1YzBPQnVlUWFuS21uM1p1?=
 =?utf-8?B?MzBOcC9EWmR1K01Zck12L2E4anpmcGZJWUZSbER1RzdZMGtrc3ZtVklKVUI4?=
 =?utf-8?B?c1lyRkF2YTJYa1NiMzVMRWo0WkZLS2prTU5ZM3RSWHcxdHZCVjFmYXdEaDRY?=
 =?utf-8?B?WFFEU3VoOWJFT1hiRFBzb3d5ZnMvcFcreFVkVkNEMTJMMndpNUJrdUZxRk5v?=
 =?utf-8?B?WWwvZE02N1MzZXJlYmoyWU9aYzlGRzZmYUNaaEFMMk5wUTF3YURZMERhM1FS?=
 =?utf-8?B?dWw2ZTRTWHc4eCtWWlZTN0g1dFVNR0tVTGphVytGS2xlQzdNakdSS1V4WTI2?=
 =?utf-8?B?UTVWYVVLRURRZzhwSnhGNXNqcXdGS1NSeWw2QXVIcytZakh5djZoallSYm9v?=
 =?utf-8?B?NlRVcTlxbndYZEFxVVdNeFkxVFUwMVlKajJKVzhId09ieFFoZVowMU5Jc1dN?=
 =?utf-8?B?TEpiYTM5cERrbzVETGtxZWFnS2VlRm1Gc25HOUpBckZmakdLcmhJM2J0V21v?=
 =?utf-8?B?bW1vVUNPRERMUEVvZGZxL3c2RUVlT2xRRkZEVXFjOUZLYXh5Z1FZc2NUaXdx?=
 =?utf-8?B?RTBtNW91ZHF4M2NwQ0ZIQ2x3VVV3OGp3aVVFeGp2VjhBVjlwckNFcnIvSUF0?=
 =?utf-8?B?RUlSeE9Ca05VYkdhYUp5d2ZUMkdVMFZqb0ZrU0ZXQnNGdUkrWktCeVJmczlS?=
 =?utf-8?B?K2w3cHFGcm9YTWtBNGZWZ1BaZFhNYnY4ZXM4Z1RPTnM3UFdKdldYSW1tVm02?=
 =?utf-8?B?V09JakNhU0ZpeFd2ckF5c08yU2ZvTU43M1UvWGpiNEFxNWM5Skk1RHp6VzFv?=
 =?utf-8?B?Uk8yU0FCMmtxUnd5aEVFZlAyRFQxTVVXQzIzQ1dCSHQ4TU9Cb1BKT0JzcUN4?=
 =?utf-8?B?YWd1dGVydU4vc1F1SmZFcm91NHFZaFRSZGgzWlhlQmhRa2FXd09MeEZWYmpT?=
 =?utf-8?B?djJIYkVBcWpRTVhaMjdDbGZ5WmZkbStlNi90V0xIK1pidSswT210OFlIZlIw?=
 =?utf-8?B?OGJxTGRicUhrdWNmYTBhUEZWdERUUmV6SDFYYW1OcU5OM1FxcjVGamxUbTl1?=
 =?utf-8?B?V3VHQk1kbllVOE80MUNuRko5Q2hiZkI2WWU2MitGYmFXQkFDWmhwZkI1bXlx?=
 =?utf-8?B?YjE4bFZJUmlwMnpSQ2w4VEtUc1NZQXdYQzRkOWV5cUs5aFVSczdUMFM0bVVN?=
 =?utf-8?B?MGs1RlFCOEtZbmxManFzTmJGN0RMMXM1QllvMyt1bmpwVmtUNjByNkdwM2RY?=
 =?utf-8?B?UEdQc2cvLzc4MGcxVzlNYlFrRUd2QnVFVzBzWGpYcCtyWENJcHJYSC9BQmhZ?=
 =?utf-8?B?Z1AzckxTVmZ6OUVOejNKZlhqMDRzSHNWK1hEVEhvbUJ5QzRWcWpEcW12Tm9S?=
 =?utf-8?B?d3J5QXJqVVAvLzRuWEdQdXBmM2R6emEwR2RTaEwyVStKUEpIT29OUnlVNW9w?=
 =?utf-8?B?S3BidjhqbDZLUUQybkRMN0hWcXhyRTlCOUh4NmEvQ3p1UUtQR3VrbTdjTCt4?=
 =?utf-8?B?R284NHM0SDZMdnlNY1ZnT1ZjWHVGdVhxazZyVHBsZkJJcWlmc3FOTW5IeWVL?=
 =?utf-8?B?NGlMaStrT0F1QVgzRUFNakNkZkE2dDBtdDJlL3VCc0pMT1VEV0dVM0tCYlpE?=
 =?utf-8?B?cEtCYlZrQXFVSnVaUjJ0TkdGZlRsWVBxNEpaNFFSSUVQMUEvMXhpUXM0VzYr?=
 =?utf-8?B?akZuU1NNRW15OWdsbVhnZkxCNnprSmVuQVF4d3hHV21KbFNrMHMrVU5UWlNL?=
 =?utf-8?B?ZkdBcUxYVlFOUWIyazhQWFd6WmNTbFEvZnNMR1FXMjRNNGZpanRrTHQ3bDJj?=
 =?utf-8?B?bHRqNVNYcHIwL3VQVEI1dU1XaWtPR2psT29rZWkyY3BZTC9wdUw3cXdLUXRD?=
 =?utf-8?B?M0ZjYXpKZWRleDFKbVpJVjRmY3R3QWYrVmk3ZjhidHFLdzRQWTQwTjFuZklp?=
 =?utf-8?B?aWNFcGx6NU5kNG10Z2xkcU1tT2NNRFpTN21Sd29RYzlOWW5jNk8zMHJlL3FX?=
 =?utf-8?B?N2d2cXc0N1daVWduNDZLSGFxMGc5TGVPT1NuZDNhdEFWTmFUT1RSWDJ1K29V?=
 =?utf-8?Q?QxCc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFg2VTVMa1dPVUFsWUZaci9EVVp3UmxhVFh6eVZGbG5HSGNCc25VaUp0MWFH?=
 =?utf-8?B?K1NwWUdZZ1R0M0VsN2ZaOUx6eFV4NnhaREhxS0lGd3Z2dmVBZWdsWU5FYklm?=
 =?utf-8?B?SlFyZ2hCdEh3NkRJSDBMNGQza3Z1NUQ5b3NVWUovc1FJTXF5ZHVZdXArNGFu?=
 =?utf-8?B?dzRxTHlIZytEdHJhbloxOGFkZWd5aUR2VkQxTGJKNjN4T0ZpUERVcENXTDl3?=
 =?utf-8?B?bmxCMGt0a2QyVHlielhGVmFsdjEvZm5xcXY5WmdSUHNmU1l2RWlIU3k1Ym93?=
 =?utf-8?B?WmYzSnBEcXZiNjJWVCtnWGJjVUs5V09lRjdlU3BiL3BpbTB2VGhDaEJsVmJl?=
 =?utf-8?B?eDZRanFEQjNXZGtXTU9ZdnMwaFFRUlZWS1A2enhlZERNM3Q0ZWNDOC9zTk8v?=
 =?utf-8?B?NDVPWXpQSEoxZWlvZVFRUGtSUkNZWFF3WXh2NUd6ZGc0ZEIzMHlSRzVjWnZY?=
 =?utf-8?B?aXRHVUQvVzdaZ1o5WVJzajA5VkdpTi9HSGNBRi9lQkhSamJtRStCcTJBdUJp?=
 =?utf-8?B?V2hGRGtmdXVkaThoVzFJZXpDOUJibVFOQ1FYMUJjMlgrMFkyWUR4M1NQWGxP?=
 =?utf-8?B?ajRUeUlUdDhZQlZYZnJGaThBNmJNb0JOUElhWW9oSEpvMzNtdzlvMEVFalhp?=
 =?utf-8?B?bHdtNTdWbTdTYUdyNzFld3NKclZzOVdhWVBkQmRsYXkxRTkxOTZsUlFMd2Iv?=
 =?utf-8?B?a2VzQkRERzlqNkUwWTVJU3dyZ25QVGlXcEZBaDN6UW9jSHRyRVFxR24zTGdk?=
 =?utf-8?B?cG8rR3ZNdzlKUWNtWHFTUm5tbXZzV04zUUhCMHNzUS9uNWdFV3lKRWxJRk8z?=
 =?utf-8?B?QVU5RTdnc1JVcHJ6VzVYQU5qaklmSXFJMmtuSi9CRG9tWEZrYkpMc1I0aFVS?=
 =?utf-8?B?bklXVHkxZ1JPMjB6RkdwUGVBV3JKbW9ETTZiRllhVUdhaGZXV0d3S0xqNk9p?=
 =?utf-8?B?eWplcDhZL0kxamx1L3V1RXlQTkFlWUxJRWlybmJ0aGJtTXRaRm9CckFKclNv?=
 =?utf-8?B?WUtybEU3QlRkQnV4a3VXSEpyREtSRzlWQStqV09tRUN2UXRpbEovYmdpTk1X?=
 =?utf-8?B?dnhxMVlRaTlUY08rTWVoaVErTXczY1lHODZDNTg2cGh1NFR6ZlJUK0FuWVZv?=
 =?utf-8?B?S1pDbUxhaUI5UmVXaGZ2SjgydmNWdXhQbWpuV0JBN3ltanRuMkhYcGRvMThj?=
 =?utf-8?B?b2tLZE5XYmswNUdOV24rVW10VGkvKzB6NHk2TXVwdUpKZlgwakhwRVRJMWtt?=
 =?utf-8?B?UDN0YmhVQlpVdU04YjVVZGh6WWVTMExhd3F3dlFSVGtvTmpVVXEwVzJYZHR1?=
 =?utf-8?B?by9YSCtZbm81L0lwSERtMTlRc1ZTZjNZc2RhYmIwd3pEdnZydE9EbkFsSUdG?=
 =?utf-8?B?QkJYeWZSNWlLajB1Vk1yWDV3OEdLWUlrQk0vRmtBbUlpemdrZlh0QU81K2FS?=
 =?utf-8?B?UU1NV3Y0LzBMdG1zRGdVQitQVUxTbk5Ndk9Rc1IzOFNHUlNWeVcyY0ovY3B0?=
 =?utf-8?B?Y3ZZWVJNak5TQWFWdlJ6RFV5aFpxTlhqY1FVNEN2cm03TVhSTEFDeWNVUGRy?=
 =?utf-8?B?QmlCbUhrM2tYV0M1c1JZVlU0NkhwaHY3VHNNVjJwWEVPV1JFZXVSc1BLVGdJ?=
 =?utf-8?B?cGlJZUVFMDZTQlliL1hZaHJLRUJsalozcGFWNngydnJxYkdLNjNYZXZLdVpU?=
 =?utf-8?B?VHFyVWx6M25oR3d6K1ByRit0WTlOQThVU2pwb1ZtSUQ1Y1JwVkZzRko0R0RE?=
 =?utf-8?B?WkdMZnBFWTJRRUtVbDc2aGJCSFc2Z2hMS2NadEhmcXVmSWVCRW00VCtTRm5S?=
 =?utf-8?B?THBpeWdOZ1VmMDRQKzJLTmI4MkJvR1RRTHJ3MUN5dzdXVUdtY25sSVBxK1NS?=
 =?utf-8?B?aEUvOHo5NGtHTFU3Y2hVL1BEenNpWHZVZ3RKQ080dmswMGk3RTV6SlJkM2Zj?=
 =?utf-8?B?cW55ckR0RlMyUkFROFVYeVE4bkQrUnRoZkpQNFJUYjdJU21QSmhvcFVaM0ta?=
 =?utf-8?B?bTg2UFFKVk5JY2lsTDF3dVFZNUFVRFRTNGovVmpIcWtJSHlvdStXZzZLUGoy?=
 =?utf-8?B?d2d2c3R0SWdFTmtTeTV3akhYY1N0NmI5VzUzdmI1S2JtVi9ad0w4dDc5QUtq?=
 =?utf-8?B?UWI4U1NCY0xJT3hxZk5tSWdrdTUraVBiS0l4SVhtOWVxWGVwTkdabndMM2ZI?=
 =?utf-8?B?R1grTmpDTDJTVXU3MW1uZmJ3a1FoQVhYT3hQMWhlendBTEhmSllsSXhGVzFV?=
 =?utf-8?B?TUdwR2p2U003QU9mZDM3eU1NY2ZDUlRFU3lBWW9vMng3SXNRK0p2WDFNbGxE?=
 =?utf-8?Q?OPN53km6MUivajTQdR?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e224ede9-f294-4f04-00ba-08de60131b77
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:20:31.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3iYRkSzuGD0YFmdf3gAcngf12hifGM03UOjSOFdf79EW5v7ZpCHKbXlUTHYpjEW8RJwqIDHKB6bXCq7DM9LFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5491

On Fri Jan 30, 2026 at 2:59 PM GMT, Andreas Hindborg wrote:
> At the time `CoherentAllocation::read_field` and
> `CoherentAllocation::write_field` was merged, `ptr::{read,write}_volatile=
`
> was under specified. The documentation for these functions have been
> updated and we can now formulate a proper safety comment for the calls.
>
> Update safety comments in `CoherentAllocation::{read,write}_field`.
>
> Link: https://doc.rust-lang.org/stable/core/ptr/fn.read_volatile.html
> Link: https://doc.rust-lang.org/stable/core/ptr/fn.write_volatile.html
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/dma.rs | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index acc65b1e0f245..0b55671a94faf 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -593,14 +593,12 @@ pub fn item_from_index(&self, offset: usize) -> Res=
ult<*mut T> {
>      pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F =
{
>          // SAFETY:
>          // - By the safety requirements field is valid.
> -        // - Using read_volatile() here is not sound as per the usual ru=
les, the usage here is
> -        // a special exception with the following notes in place. When d=
ealing with a potential
> -        // race from a hardware or code outside kernel (e.g. user-space =
program), we need that
> -        // read on a valid memory is not UB. Currently read_volatile() i=
s used for this, and the
> -        // rationale behind is that it should generate the same code as =
READ_ONCE() which the
> -        // kernel already relies on to avoid UB on data races. Note that=
 the usage of
> -        // read_volatile() is limited to this particular case, it cannot=
 be used to prevent
> -        // the UB caused by racing between two kernel functions nor do t=
hey provide atomicity.
> +        // - `field` points to memory outside any Rust allocation.

Hmm, this isn't actually correct, as the memory behind `CoherentAllocation`
isn't MMIO (they're just also accessible by device). We provide `as_slice()=
`
which exposes these memory directly to the Rust memory model.

Best,
Gary

> +        // - As `field` points to readable memory:
> +        //   - Reading `field` will not trap.
> +        //   - Reading `field` will not change any memory inside a Rust =
allocation.
> +        // - As `F: FromBytes` any bit pattern is valid for `F` and the =
read
> +        //   will produce a properly initialized F.
>          unsafe { field.read_volatile() }
>      }
> =20
> @@ -616,14 +614,9 @@ pub unsafe fn field_read<F: FromBytes>(&self, field:=
 *const F) -> F {
>      pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) =
{
>          // SAFETY:
>          // - By the safety requirements field is valid.
> -        // - Using write_volatile() here is not sound as per the usual r=
ules, the usage here is
> -        // a special exception with the following notes in place. When d=
ealing with a potential
> -        // race from a hardware or code outside kernel (e.g. user-space =
program), we need that
> -        // write on a valid memory is not UB. Currently write_volatile()=
 is used for this, and the
> -        // rationale behind is that it should generate the same code as =
WRITE_ONCE() which the
> -        // kernel already relies on to avoid UB on data races. Note that=
 the usage of
> -        // write_volatile() is limited to this particular case, it canno=
t be used to prevent
> -        // the UB caused by racing between two kernel functions nor do t=
hey provide atomicity.
> +        // - As `field` points to readable memory:
> +        //   - Reading `field` will not trap.
> +        //   - Reading `field` will not change any memory inside a Rust =
allocation.
>          unsafe { field.write_volatile(val) }
>      }
>  }
>
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260130-dma-doc-update-a8a0548045e2
>
> Best regards,


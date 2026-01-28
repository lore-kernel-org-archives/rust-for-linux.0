Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022090.outbound.protection.outlook.com [52.101.101.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF622D46D9
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607707; cv=fail; b=UtOoChyEhZ+jK0ssJcF/eyyTsFIfyERZKeS7FvK11rwtvW5Q3YaxI8aYDmQR2N94dBaxjqNHvmwlq+WK+G6KYvMb2jg2V3/TlJthEMPGfLWOgbjJidlpzS6xM8W2hkRsGP5uy/p70549VYIJEIntOTeT/ZoGhHPVYnTiedTpdjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607707; c=relaxed/simple;
	bh=PAb9KCKyxhp6slFmNZPEzuM8JmtpT34nGDhHZoZggBg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=h/1nfT53BX7SsEBG3b1ZKny213bTNgiWUNufwDcskJC2+uuLcbDAiXsXlGQiGDAbjBa0j6/5kv6BYoxX8BJwYViZ3kvwVcxfehJbsEcmvITRp0UN1U1xztrNDFekwZPE5U4FXBROQjJ/vqbog1SIbXn+UjsCR6GvWP1RuI3HjQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vjnLVDSQ; arc=fail smtp.client-ip=52.101.101.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vjnLVDSQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjmlIjH0HN18Brj04ozhNSUxq78xYJBl8czFdJ5QDo8bx4y8Sg/cRQG3rmZU1zqcVwD88t41DgXdIggYhUc8hkRoMqU9ATklyMFkb7Mvuvz4huTkuRXtuxeBYG+4ktWS3E3s6ugc99XzbWHGIC20+HmDa9y11F21+JrEBqLOnuKIteApfKqxCm+9IVHeZz5s8D1QSdlafTCOrKkP8BxoId36weRXYObfHbmMH8eY1f0hVj/DmWpqZJhHSULNfNlU+XzybmOshqRBwOwIuB9oPzX9Qx22cT+nc5kxuLtasDiwEUK8gxr9uOYosXtdUaitqqjw+nFJvQR1vxNZy3+M1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpTunknKDYF6sYj9LYXEzEhWv/ND+g2F2vfzVyFz0V0=;
 b=fC1QsK74uTDI38f9l3l52qRw00OBk/N7qUGuyNnmzxr1kSGdlAnwkjb8ES2ZJcfKfDava2zew1b1DrLlhtErWYcQwTMyRmwIF/bUaySqrQ1ZQItF/5Yna6SlNplVFKnVzilbWMr82/Xcke1yxcxwCPy/c5HM4tgXIigVM0plXwgeOucapucyZu7fMX2qbINn9OcZd2+6Dj2csjH4s5p18hk8oJY78+Kb+wuLPDSWPsXtLOSbV48IxibFI3Ju6UA2810upIqfKyESWGFpE2Mt9WEECraFS0UkrkxB8mUCjDZut6RIW6SYCW2Dj0bd3H29U+AWEJoXxA5thvcQhJtX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpTunknKDYF6sYj9LYXEzEhWv/ND+g2F2vfzVyFz0V0=;
 b=vjnLVDSQNZVm/tHDe4HCgEXdhXPigmdB3l0ieqzsCsYgq4XttgnsTjhWokt/x1bHc3c5ftcCRP2HMEKhT19dx8HSkqz2quehA+JfQsW2puAelPd8AaUKpuKzzL9j+RZHRd/L6S0fmH5q2EWcYIt7UDMMCI8hnumysyG5hUeeMfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6788.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 13:41:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 13:41:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 13:41:41 +0000
Message-Id: <DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128115200.3820113-1-tomo@aliasing.net>
 <20260128115200.3820113-2-tomo@aliasing.net>
In-Reply-To: <20260128115200.3820113-2-tomo@aliasing.net>
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1380d6-fb18-493f-c66c-08de5e72f819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjZjeGRHL0tTT1oyV1g0WThPN2l2bVpEKzc5VjUyTm1JNndMTzdSL09xb3hl?=
 =?utf-8?B?clI2T0NOWE1Kc0ZRQjJmejdZK3ZmelNWSTNVamVOVEJwcWZYWXNXQUxyVFp2?=
 =?utf-8?B?ZENVUnVzSFNuY0FOcTJVTDF3VXdHT2RoK2VkUkR5em5IZ2JGWWxvMElRcUlu?=
 =?utf-8?B?S29EWm9aTXVCNDlQbGhqNjg2TVY4QS9HRDU3K0FpUGhETzRQQTZ4VGdLalpk?=
 =?utf-8?B?NWx5dmljRHYrT2NyWTZJR0hiWnlnckVwalJFNGdNQlc2TUVlNWdEc0syY0xM?=
 =?utf-8?B?SCswRTl0ZVgxdnozVE8zaTd4Y0tWSG5GcE9wRGltYkZrckRHVVJBY2tRSTNq?=
 =?utf-8?B?TTdJRGJ5YlQ1QWlHMk56Y3I4dDNNSXY4RisyZHY2ZlBFckZJWnp3QVI1ZzNY?=
 =?utf-8?B?d0doYkxQeTk0cFBOVmI5R2g0VkxpVmIxOUFKZXFueGhHZ0F2S2JXVWVVajY1?=
 =?utf-8?B?UTI4Y0k5RHgzL2h1T1dDRjJ5bHhtSDZVelh5c0VsUkpJMmVzNXplYXc1Q3ht?=
 =?utf-8?B?c3pZZStUM0E1QXhHT1lrQ1lSVHZZaU01TjdMeTVpMTZpU2JiS3VGQkU4aDAv?=
 =?utf-8?B?RGhsRkMwNDZONy96andGc1ZNb2xoR3J2a0RkTnRGcmgzQlhLYmZTcTVUODRw?=
 =?utf-8?B?Mmh0Yy9LOXZpZEJwbTlHRmF1Ym91cmlxR2RPbCtNbDBPRnoyRktISEwwTWxN?=
 =?utf-8?B?Z0dJQU9Kb1hNWnJ4WFpaL2lvYkxVZFNsakk0T05YSTF3VE5ScVk3NmNGN2Mv?=
 =?utf-8?B?QklSdHFFWnZ5dyt5ZmtFMDJXdWUveVAvc0xiY0RIVE9kSmxnODJsSEd5bHRv?=
 =?utf-8?B?QWZWTmFJN2E4U1J4Q1B2YVJZeDRmNkdhOGxoOHpTZ0FHQlNKa0JpTTFNUXFr?=
 =?utf-8?B?ZFRMc3k4ZWJUbmRoT2dGTTA5ZzA4MEM4ckl5MTlWNTRlSzhzL3ZkNGpNWUdU?=
 =?utf-8?B?Q3NJRDJ2OUhSV1A3bXBOYnl3bDZwTVZ1YWpoNVZyZk83a1hTdDdDVEx3MFB3?=
 =?utf-8?B?MzZ1U2YvK2xkNk0rRE53KzZJam5RcEM2VXRqelFjN3dWNFNYYXNvNzJPU25t?=
 =?utf-8?B?RjRYTEhKeVdFdWF3cUVFaGZGWlcrQ3FLT1NSQit6Njlod1JjN1dTMGVRWENh?=
 =?utf-8?B?eG83eGxpb1pISUhEWjV3d2xWbVlEakpzSmRFaUdwbEIxNXNzWE1FRm03TDZp?=
 =?utf-8?B?N0FibWNLWVQwMitNdzdyWmZydDk1VjU2ZFJKYnlGeGovOTh5YVFOOXpWWG9M?=
 =?utf-8?B?a2N4V2dEVmlJTGFFS1Q3T2gyOFZzb2pscUxDNTc2UExIWVZXdEZKQmIzdzZ4?=
 =?utf-8?B?VTl1d2xUUEJnUjlYZDFnUGVzTVJTaE01SEdpb3laNTRIMFc3WWRkSkN4Qkls?=
 =?utf-8?B?TzQ4bktiZHdRb3ArS2NCSTBQMldjZVpPaGhxYm1yWkw1ZHNJYnYxdDdsU2oy?=
 =?utf-8?B?eUkzeTJmdDVucHZTTm52M3FhVVQvZFFUQjZqS2F3NTljZjRqTXhxaW9ONU04?=
 =?utf-8?B?cVorZVJRWEZ3UUMzY2duMkN4dml5YlRYQitqMERHZDg5cnNOUW5HT25acld4?=
 =?utf-8?B?cXFuV0dsYzJUU0JuZTNLbThjYno0UDgzQktFNDdOSHNERjB1Rmc1ditvcVJo?=
 =?utf-8?B?RnphQmlrTHRoUElTNXo2WWZrT3NSaWd0cm41K01oVnlLcTMwWE9ubjFaZE5p?=
 =?utf-8?B?d2NnZGl1TUEzVFBwU2RxbnBiVnR5eXhpN0N1Zy9YMGRhd2pXTlcweEk4SmtY?=
 =?utf-8?B?b0s0WC9oMGJYWXJCbzNNM292V0xFaTA2UEt3NGViWGdOa1NvS0RuOURDeGRk?=
 =?utf-8?B?Q3cxU1hvZ2NDN1g5VTBZQlpiUk9YYW1jb0Nrdm1tMzlnV0g5VDdPT1NMSHR5?=
 =?utf-8?B?bzhKUnh0YXJDQVR0aTN1V2FxWWVhSEwzWUJnZ2Q2VDRaYVhOOVNubWE1U1Zz?=
 =?utf-8?B?L3RMT1hyZTk2emVLOUZ1ZHJGMzZqaUJ4bytOc01Gd2srL0pOeEdxeGY1OVpL?=
 =?utf-8?B?WjVuNXZiZUVsdXFWM2Rucm43K3NpaVVrSHRkSFhZZExsL3UyTFRXaWlEZlpV?=
 =?utf-8?B?RDRtWDdhY0hHZWk1cjkrMkc0WVpkbjdwb1pJSmh5WmRDVTRpeWVDdWp0QnFW?=
 =?utf-8?Q?5B6Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm91amlCUWVraWFkdlVqV1A5VGYvRlU4TG01STVSRXhaQUtPVWYzbklzdThG?=
 =?utf-8?B?YVBhdWdSNzRLV2o2eDZFWVp6ZlZucFl0VGRjZDhXU01oNHZ1U1lka2JZWjd1?=
 =?utf-8?B?WFNObFNNNUJLUUcreE8rbWZJbCtlOXlILzBiakpseDNIbE81YjZIT1h3RXBX?=
 =?utf-8?B?NldiZjVRNm40eFhWTTNOdVdjN1FRNk9RSVpLSCtCZk5QODB6MVBxbjU2SlNX?=
 =?utf-8?B?NjZ2eVNQdlBtWVp4NllqT210MnVPUER1QkFPUW0wUjB5SUwxZUJqWE00Rklz?=
 =?utf-8?B?NHV2QWlCbVZ5TERIWnZLcGswbGlKOGs4RktlbWtoRHRjTThaQ2xDL3NEZE1o?=
 =?utf-8?B?NTBvcy9MbTFua3JrazU2RHQzaXBSRU1ocGdvdU45ajV0TDI4dENDWXZhRmNx?=
 =?utf-8?B?Q3lNRVY4aVc3ZFJOWXNhM2hPdjNsc2hJbm90NWpZNHFab1h5QUZpa2JTY0RL?=
 =?utf-8?B?Wm9mdXhzTVZiM0lsZ2ZuVlBqb3JkeXVhYi9jUDRZVDQrR2FXeVZCWjN4cEtO?=
 =?utf-8?B?UUpYRjFCd3hDZGlBTlZUL216U0VZc21HTGhNMjRDeTFvcVdJUnBYSlFYNzBX?=
 =?utf-8?B?Q0pQblJPOTA1ZDVoejlMejdIQWdIODd4YWxSaDdyNjU3bTVuYVo3RnI1aFBm?=
 =?utf-8?B?RGQ3ZDV5dWZhWjFKc01Jc0dEWHkzK2FkYUlMRjBUbUJyUUllZXh1bDFJVUJm?=
 =?utf-8?B?UTlJWGVWaVJ2QUlsMCtRaFo2TTNYM1lURmExdjFTQWMrTnhzbTZEN2gzbm8y?=
 =?utf-8?B?OXFmTlZoOGVVWE94NHJGRnBhNCtadVpOOGp5ZTNMelU1SnlNRTNtaVRFTkk5?=
 =?utf-8?B?eVV5eTJqYWZSNEhPSHJmRTRBMXZLenN0UWJ5ako5NDhJd0o5bS9YNUVlZWJa?=
 =?utf-8?B?UkJTamNpa3YvTG1vSHIvSEZJRUZVS3pnNncrYzI2TkdoeHArUUk5SjJyQUFq?=
 =?utf-8?B?cS9UeEFSQm1KeGp1dDdsaVJyVXZscWRIdy9KSldCRUdUaDF4bm9FYVR0d0kz?=
 =?utf-8?B?T21FM0JMVmNYaFNmd3lRSUVTYUNEQTdDL0JJWGg5Ni9EdUV4Ym9weVY4VEk2?=
 =?utf-8?B?ZEcyWU9Uc3JhYmZ4L1NSY3h1dkxhSGIwN1dwYlBrK0QvOFZlVnlUODR6cER0?=
 =?utf-8?B?R293eUtKSUMrUEhla0pyQ240L3BoUmJ6blJNRHcyNEpQL0RKVUhTUTVHSVZs?=
 =?utf-8?B?Y0cxalRLd1Z5WFUyRm5DU0h6VE5UZGV3OVZIOHA2Ny9ld1VRcm4veEZJSEU3?=
 =?utf-8?B?Y29NM0FxUllxVEFnR0lad3hDUWptRE5teW1MZWFqaTAxMktNU0pTdDltb3R3?=
 =?utf-8?B?WEJYZGFadXNOcDA4Y1F5bVluYm11bTN2R3c1Ky8wbHhtOGtYV2xLQkJNNHRU?=
 =?utf-8?B?bnZ2OXRKOFArTXpYTURjMFBTaW03bmpNSmRPSkwra3NnUGtxK1lBTG9kMmIr?=
 =?utf-8?B?SjhNLzFkTWllUTF2V0x1NjRRZEtJdjFEVS84L1RvaVpXQW44bkFEZDNuMTUr?=
 =?utf-8?B?SW5ua2JqbmFsQThzSCs2bGUwSXpFbGxBMXR5VkhnRnlBMll1MFdkV21LTzVR?=
 =?utf-8?B?WTI1dmkzaUYvVUdnQkNPV2RUTnJ1TC9WZmlkMFArSDYyVlBlL1U4bmVMdERp?=
 =?utf-8?B?eDNTZ2FReE52ZGh5RFRmckNoWEdMU0cyWVhkeXZzQTRkRlhkMXlkbmhKbm1H?=
 =?utf-8?B?WStQa0FDL2d5WlNWbmYzR1pJUU5qZ3ZqckdZK1k4SXE1d3MzRy9laElsb3Y5?=
 =?utf-8?B?emltOERJT01UbUFQaTcxbFB4REtKeGV5Z0xOdHZLc2wzOEZubG02aGlTZWRz?=
 =?utf-8?B?Tnh5MmxveCtUaTJBakZtVWNlSHZpODF5Uy90NnFnMGNzZ2hOaE4raTNkdkhn?=
 =?utf-8?B?b0xtNmFyendIeXhaRnVxbkxzdytlME1iTUhUZGpEQ1NsYXJITytRY2grT0Nm?=
 =?utf-8?B?RE1TT1FnZHoxV3gxSEZZWmZIdGFJZThSdmxETnpLalIxWS9Ma1VlZEhuUWY2?=
 =?utf-8?B?MEdUenl4QkpnSGwrUFRTNUpVb0t5eXNRNW9uM1RkV1I5UXJJR0FJNEpSTnd6?=
 =?utf-8?B?WGxucXMrSVFtV0NNVWFGYUV5SDZOU2ZXdlFCQnNTTm9NaVo4SmVrSk54VjZq?=
 =?utf-8?B?NVJyUXcvUXJVRVlKRjlna2ZLTVJkUEFqay9qeU90ZTI2U0pPalI5VmFzaVI2?=
 =?utf-8?B?ckxaQndGSnhlbFJXczltUjBiVTl6aTVxSTJlTy9CNkdzWUcyb05WaG14anV3?=
 =?utf-8?B?Y0IvZCt4dXJDdm8wY2oxZXZVWGFyQVZraWRkcnJOdzVJTVA5RlBaMTRRa20w?=
 =?utf-8?B?d05uWlF5NG1QMjBFbTRGSWpNc3dhVFJRZi9EcXI1T1dldFFtY1d6dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1380d6-fb18-493f-c66c-08de5e72f819
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:41:41.5687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwbhsh+jI/PIgAfYB5YpYwAyc6raIhYTTXCdRmkZoCcKSjSU6yE3F3Sxqk4mcLr/mIwJMsaoLXUTf3ae2N4lKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6788

On Wed Jan 28, 2026 at 11:51 AM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add AtomicFlag type for boolean flags.
>
> Document when AtomicFlag is generally preferable to Atomic<bool>: in
> particular, when RMW operations such as xchg()/cmpxchg() may be used
> and minimizing memory usage is not the top priority. On some
> architectures without byte-sized RMW instructions, Atomic<bool> can be
> slower for RMW operations.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs |  17 ++++
>  2 files changed, 138 insertions(+)
>
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 4aebeacb961a..7d06193709c0 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -560,3 +560,124 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>=
(&self, v: Rhs, _: Ordering)
>          unsafe { from_repr(ret) }
>      }
>  }
> +
> +/// # Invariants
> +///
> +/// `padding` must be all zeroes.
> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]

This config repeats too much.

I think probably we should just not let `AtomicFlag` alias `Atomic<u8>` (th=
is
has the benefit of creating a type mismatch, so code cannot rely on this on=
 x86
and fail to compile on, say, RV).

This way the `struct Flag`, `struct AtomicFlag` and `impl AtomicFlag` would
always exist and the config is only needed for much fewer times (plus, you =
don't
need to macro to avoid duplicating docs).

> +#[repr(C, align(4))]
> +#[derive(Clone, Copy)]
> +struct Flag {
> +    bool_field: bool,
> +    padding: [u8; 3],

You probably still want, on big endian platforms, put padding first, so the
generated instruction uses small immediates (0 & 1) instead of 0 & 0x010000=
00.

Best,
Gary

> +}
> +
> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> +impl Flag {
> +    #[inline(always)]
> +    const fn new(b: bool) -> Self {
> +        // INVARIANT: `padding` is all zeroes.
> +        Self {
> +            bool_field: b,
> +            padding: [0; 3],
> +        }
> +    }
> +}
> +
> +// SAFETY: `Flag` and `i32` have the same size and alignment, and it's r=
ound-trip
> +// transmutable to `i32`.
> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> +unsafe impl AtomicType for Flag {
> +    type Repr =3D i32;
> +}
> +
> +macro_rules! atomic_flag_doc {
> +    () =3D> {
> +        concat!(
> +            "An atomic flag type intended to be backed by performance-op=
timal integer type.\n\n",
> +            "The backing integer type is an implementation detail; it ma=
y vary by architecture and change\n",
> +            "in the future.\n\n",
> +            "[`AtomicFlag`] is generally preferable to [`Atomic<bool>`] =
when you need read-modify-write\n",
> +            "(RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg=
()`]) or when [`Atomic<bool>`] does\n",
> +            "not save memory due to padding. On some architectures that =
do not support byte-sized atomic\n",
> +            "RMW operations, RMW operations on [`Atomic<bool>`] are slow=
er.\n\n",
> +            "If you only use [`Atomic::load()`]/[`Atomic::store()`], [`A=
tomic<bool>`] is fine.\n\n",
> +            "# Examples\n\n",
> +            "```\n",
> +            "use kernel::sync::atomic::{Atomic, AtomicFlag, Relaxed};\n\=
n",
> +            "let flag =3D AtomicFlag::new(false);\n",
> +            "assert_eq!(false, flag.load(Relaxed));\n",
> +            "flag.store(true, Relaxed);\n",
> +            "assert_eq!(true, flag.load(Relaxed));\n",
> +            "```\n"
> +        )
> +    };
> +}
> +
> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> +#[doc =3D atomic_flag_doc!()]
> +pub struct AtomicFlag(Atomic<Flag>);
> +
> +#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> +#[doc =3D atomic_flag_doc!()]
> +pub type AtomicFlag =3D Atomic<bool>;
> +
> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> +impl AtomicFlag {
> +    /// Creates a new atomic flag.
> +    #[inline(always)]
> +    pub const fn new(b: bool) -> Self {
> +        Self(Atomic::new(Flag::new(b)))
> +    }
> +
> +    /// Returns a mutable reference to the underlying flag as a [`bool`]=
.
> +    ///
> +    /// This is safe because the mutable reference of the atomic flag gu=
arantees exclusive access.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::sync::atomic::{AtomicFlag, Relaxed};
> +    ///
> +    /// let mut atomic_flag =3D AtomicFlag::new(false);
> +    /// assert_eq!(false, atomic_flag.load(Relaxed));
> +    /// *atomic_flag.get_mut() =3D true;
> +    /// assert_eq!(true, atomic_flag.load(Relaxed));
> +    /// ```
> +    #[inline(always)]
> +    pub fn get_mut(&mut self) -> &mut bool {
> +        &mut self.0.get_mut().bool_field
> +    }
> +
> +    /// Loads the value from the atomic flag.
> +    #[inline(always)]
> +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering=
) -> bool {
> +        self.0.load(o).bool_field
> +    }
> +
> +    /// Stores a value to the atomic flag.
> +    #[inline(always)]
> +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: bool, o=
: Ordering) {
> +        self.0.store(Flag::new(v), o);
> +    }
> +
> +    /// Stores a value to the atomic flag and returns the previous value=
.
> +    #[inline(always)]
> +    pub fn xchg<Ordering: ordering::Ordering>(&self, new: bool, o: Order=
ing) -> bool {
> +        self.0.xchg(Flag::new(new), o).bool_field
> +    }
> +
> +    /// Store a value to the atomic flag if the current value is equal t=
o `old`.
> +    #[inline(always)]
> +    pub fn cmpxchg<Ordering: ordering::Ordering>(
> +        &self,
> +        old: bool,
> +        new: bool,
> +        o: Ordering,
> +    ) -> Result<bool, bool> {
> +        match self.0.cmpxchg(Flag::new(old), Flag::new(new), o) {
> +            Ok(_) =3D> Ok(old),
> +            Err(f) =3D> Err(f.bool_field),
> +        }
> +    }
> +}
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atom=
ic/predefine.rs
> index 42067c6a266c..d14e10544dcf 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -215,4 +215,21 @@ fn atomic_bool_tests() {
>          assert_eq!(false, x.load(Relaxed));
>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
>      }
> +
> +    #[test]
> +    fn atomic_flag_tests() {
> +        let mut flag =3D AtomicFlag::new(false);
> +
> +        assert_eq!(false, flag.load(Relaxed));
> +
> +        *flag.get_mut() =3D true;
> +        assert_eq!(true, flag.load(Relaxed));
> +
> +        assert_eq!(true, flag.xchg(false, Relaxed));
> +        assert_eq!(false, flag.load(Relaxed));
> +
> +        *flag.get_mut() =3D true;
> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
> +        assert_eq!(false, flag.load(Relaxed));
> +    }
>  }


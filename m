Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021080.outbound.protection.outlook.com [52.101.100.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F92475D0;
	Wed, 15 Jan 2025 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944363; cv=fail; b=TgI3KkZXzr1UYv/D1oPcsvjWmQshEJwVY/jTAY4jytjuJgYY/+4PrEo4bvgg6qegn3oOL5XvdRLrJPYYWuvNJN1IK9LfU0bCblsZUkGpfWx7lQjndA8QEFD1uhRGIBr4QsAZ4JtEMh8lfOeYS9e1ty7uBIO3tUdk76eliouu4TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944363; c=relaxed/simple;
	bh=AW0rFfqdOPKb6DYTmms0tVZZtgQ+dmEqNNuYYwqDBKY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fsCY+cUEIrHYb83rWmasADBbA7EJE8PW07i8+0leIBV1PCAEndiyC17jYVmGeejpLYIBsmVmajfMGH+y7wxvBp+GsGquYe0gja6Ux9RWhUj5t5werInLknlXDxvzHcgznI7fiT3hyA9yGkVJvmFkNRf4PbK0xcYGJo+2T8Imy9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=spAD8vZG; arc=fail smtp.client-ip=52.101.100.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="spAD8vZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATir9sLoJ24ih/x/mMJ7XqovSGkY+cKmctoLcUzHHLICU3Wz7Nc0kyoGt4t43nkrkvQW8w/OQouZzM90jFcVnjH4+IrO2V5OsJS9iQyaCoHH27N+Mq4xrr+fdVT2kNDwYh1/+Uw+2x+3Mm/H5zN6FrZ2bWycj0it1Q5QWSpmR4RA/r+EbW3eOMj2BOJuwHCJV0b2QoXmmWyQIjoRgmxS3U3FfaWzvbaxDzvfo0RNG6XVGnIcDwHQzT8tk7kTRGXwPZu/fsng5yG5iNiX5hYTbDRJbVE7DbM2EW9HSGQp2eFCJttGc4b3MI/yKZV+Dj8i7IrrMK3VUPxCm2ZEZCvDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjRKi280JJ/8zmUTz6XrCJsqTy+92nHp1+R3kZRQU5I=;
 b=PmO/0d05PkILU0mbkp5ych2Wcwpx8y9vJzZ3cUlykM6FFzmVDD7DY/1ukemHU6AmDGkn1wK+3y8qOlz5cFfXInL2a9uNLGGOU5bay4lzTR+uj0i/2w22ntdVvlTxDWWGjfwk/M5U6ocqIhuvykaUwwLkcylDhurxnLGxbcg7HCrt+HVKRfS8bvPebk7xpm4bnGqJ8J6cPoe7m7dYrYJbdDmtSTAuRTKlGsQfqhO4QrYT0ApQC7Q10AzZ1Gi+0+1Od8V7Wdx+GhSM26LDPQ62MgISLvCxSWETfXNw+JewS/SpAXAl8Kk305g3+6AtiDcaR8I8N+RXQ2Um8vLRw3Q/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjRKi280JJ/8zmUTz6XrCJsqTy+92nHp1+R3kZRQU5I=;
 b=spAD8vZGRy9KWXMf3CSh93KoCBjNuU6qlRszE7BeFwPEydK0imYyOWoDdY59yCrtPjqetVHPr1FwW8lDkfGKoKtnEym9Oc0pmVKtLRLqdBtOE6GA2nXdRn4XMG8jPYwpQJS4obwfpv6CIBv2Dd3NeDbINOQQ8wAydMK9YnHVoZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB2617.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 12:32:39 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:32:39 +0000
Date: Wed, 15 Jan 2025 12:32:34 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Wedson
 Almeida Filho <walmeida@microsoft.com>, Valentin Obst
 <kernel@valentinobst.de>, Alex Mantel <alexmantel93@mailbox.org>, Danilo
 Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rust: convert `Arc` to use `Refcount`
Message-ID: <20250115123234.6d3bba78.gary@garyguo.net>
In-Reply-To: <CAH5fLgjOfw2otu4FJ1XHhjsSx3Fj3iQA25Hh-Anz5jXaLamrAQ@mail.gmail.com>
References: <20241221183024.3929500-1-gary@garyguo.net>
	<20241221183024.3929500-3-gary@garyguo.net>
	<CAH5fLgjOfw2otu4FJ1XHhjsSx3Fj3iQA25Hh-Anz5jXaLamrAQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HE1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::17) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9dd8b9-ffd5-4c60-c81e-08dd3560b2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1pYNTBSMHRCbEdWWElpaEsyYmxVOWxkZWNVc1Z6SkxmdXlKSThPY0U4Wnpw?=
 =?utf-8?B?ZWJaZWtEUjREaysrenQyMVV5K1gvUUd0SGkvVzdxV3VmSWFERWozRE5zUUQw?=
 =?utf-8?B?dzdkMEFPcjJ0ajZ3dHV2OFlXSXpIVENic3pjSllKMVBoOFNDYVdPL0o3NzI3?=
 =?utf-8?B?dVhXTzZuRERQVUpjSTZlTUg3UTRUNC9sMm1yL0hiRGlUMW9PZkFpVDBpQ3hj?=
 =?utf-8?B?dGNCZEdhL0E0OVB6WGVoUGU2R2FYb1J0WFZTVS8rTE9RcWx1eEl4MjRZaGlJ?=
 =?utf-8?B?N2JVcHBmMzI1VzkyWEcyNjZGd09QczY2Nkh3RVZ5QzRwcCs1bzZDMzNDd0k5?=
 =?utf-8?B?SFhpdUF3TVpVZ0YwQzBOeDlMTTVNYTNtc1hFaUpyNFE4M1pFQnlZUkw0RGNi?=
 =?utf-8?B?b1hwNW1NbVVrc3NJeVd2UEFQZXowOTNuZVhyQnlLdDQ5aGF6M2s5UTZPbVl1?=
 =?utf-8?B?STRUUXFsQ2lweVJrTmFLZm1pQy9XbHpQTlhuT1QzZ1JWdEM1aFFlQjI5SnZL?=
 =?utf-8?B?dmFBZ2NhZnorejU1cklMOTBod0p0MGZVcGpDeEMzcnl6NHc0Q01jcm5HQ2h1?=
 =?utf-8?B?Z1hkeThnS1dORlZCTjVBQUxYYkZ4SjAxMWhUZUxxL05wTFE0V2JpdGtWeEs3?=
 =?utf-8?B?Q0NhVExZZU9aTlorQjMyMG43citIR2ExNkI2QnNIYkJqTWZxWDA0NVZuQ3lR?=
 =?utf-8?B?eFBwRklSQjl1bmhJNHhlaWFmWlQwSTVwcWZqd1I2TTA1VXEyTjY1bFZtNUhG?=
 =?utf-8?B?OHN4V2xrTVUxVXVTQnZuQ2RYV3lYUEpMY05KR2M3UDVGRjRVVjNEaS9iTHRm?=
 =?utf-8?B?V1h3S0tPakRkazA3UGtXSVBHVThRN1d0WDhiNE8zblRGOUZPUXMzR2lBUzJD?=
 =?utf-8?B?Y1MvTWZzeHAxWWhiYWFGd1RCSlQvS2thZTZ4UXpDdU93eUFRRXVtSGVkYUw1?=
 =?utf-8?B?MER5TDdQWUpIdFRUWTh1YlBaQmNLbGRrbnYwN3BJcXhmbUlvMWxiRURJWHB0?=
 =?utf-8?B?bTJtWE5pdVRpUHlWL0Z0VGswUUhEa05vc3k3WGh1SmlKQ1lyd20wK21ianRu?=
 =?utf-8?B?dGFNU3JzMU83aGRwUFA4OERWNTJkeEtmeGlPaG5KT3FORm0rc21DeUxBTUpn?=
 =?utf-8?B?OWdBaWxTMFVBbXVxQ1FtWGgxQW9GZGtDTHYzUklsSnE3TU9RSzd6RkhmVFlZ?=
 =?utf-8?B?cW44MU5HRy9iMVNCYWQrY01YR1A4VGRoOHJJTnRVUmVWM1RWcXoxNFgrUHdx?=
 =?utf-8?B?QTEwTnJ2S1lEa2RmSDJlUHdqZHlJcENjUHpiaWtSWFJVTncxQkxSRzFBZUF6?=
 =?utf-8?B?eDhseng0ZUdxOWE1U21wZ21Xd3lLU05Ka0w4dzBUaC8vanYzNE0zTCtVSXdS?=
 =?utf-8?B?YzdzU05oaWlIWXJrY2RqM3J2VUYxMzRuSkc4dlpYOHFvL2FtcnlwempEWjR4?=
 =?utf-8?B?NjdWRWlpVFZEV2owQ293dGZSL0VGNmwxMmxKajZrTDBHSlNSNGt4Qjk4UU9h?=
 =?utf-8?B?dVR3VnIrSjRrVXhuQlhNN3dIMng0RzlUcnlyS3NLcU1SU2RReXhnZEhlUDFq?=
 =?utf-8?B?WVdaMnZiK2hrMVlZNU96ZmltYXFxWXhhMm5nNjdqcUlwNFRCL3BxTGhZU3Nu?=
 =?utf-8?B?NjgySFdNdUU1TGZlSVFWc1RVYURnRnRpRVhTeUVQSW5sOFlMbjZobjBEMGEv?=
 =?utf-8?B?cm1jUHpVTFJnUVdYQURROXZ3M0o3MXRsNjZjeXdCaDFsSzM5dk8zWFFydWg1?=
 =?utf-8?B?Z09IdWhCM2E3QjBxRnRFYXl0ZXEzZmgrRmpHWmZNeXZibytHcEZNUFJFQVdM?=
 =?utf-8?B?eDZ1YUUvem45TjB6L1ZOZ2M0YVRjYmxHb1JCalVFclpjbW9Vcng5VkltWDBx?=
 =?utf-8?Q?Evp/uMbrSmKrC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekN1VWNWSGZURzJqWXlxcGpEQWt3T29tWndxQmI3d1BKOUxpRmZUWmlad0c0?=
 =?utf-8?B?UWhkWTk1bHlwOExSN2EwcVhmNHlXaVZHck5lSGRpT0Q1aS9GbSttU2Q5TFM4?=
 =?utf-8?B?QnBpbTFxem95ZjE0MDQ2bFMyaHB6WHQwUklHZWVkNXpvSDJhTzlPMGVJeE1k?=
 =?utf-8?B?QUEybCtHWWtZZ2J6SS8vOG1VL2FVa29STzFmTlI3MERTVmJndTNPejdwckYx?=
 =?utf-8?B?MmVBdTd3ckFLbTBnd1VpUHlhbVkwYm8waVhPWFRxUXY1S2hDSk1Xa3lrdXNo?=
 =?utf-8?B?U0xZUHh4bG1CM0I3aE0rVWlSOUlRYzB4Y0J3ZUVVTkFhaE1GZVZxZm1CWUtP?=
 =?utf-8?B?aHV2Wi82Z3E2bFlpcnNEYU1JYmVwVzRQY3lUMVR3NjBEZWtkUlNMdk5mUUp1?=
 =?utf-8?B?RlhNWUNJWDd5YklLVVpHNGJlUUhweXlZK2FPU2hOTUp2QlN5cDhZZWdxakxQ?=
 =?utf-8?B?TnpJdzZvZlJCKzVHOHhOajNHZElFU3lwMUordDFoNjdZK0tPK2tPM0xFbk5h?=
 =?utf-8?B?dUpJcW93ajAvWUJhZ1dJMDFrOFdnZlNFYlp0cEVLNy9QMjFWSGF5ZGFLLzY1?=
 =?utf-8?B?TDZvemJnWkFRUGI5SHloOTU5T3NJbVZyL3JDN1Z1Q1pNWUVrT1hPS3Q2WWcz?=
 =?utf-8?B?TXNNZUllOGs3cG1FYnlNMCt1UDhsbGxMNm1vNnNwcUVqRy94UHRIbzNBcVFT?=
 =?utf-8?B?NmdTS2hZRGtQNkUrVStpYVRIaGFpLzBCMjRoOTdFQktMUmJ2TmxGMVFqZ3pu?=
 =?utf-8?B?bWZwc3p4blBVTllTNXBZRWRHNHE3N1dBUTJmZnl5WXpxeWkxR1kwQ0gvWFlX?=
 =?utf-8?B?cTlSdzdtekxYT240T0JwSDhqTGVHU3pPWFFFRkJtRXhoTXRKUHFDZ05pVnlv?=
 =?utf-8?B?YUNWREE3SVlybnhNaHV2V2RubGhNWDdCd3BzOXRLUW5QSUgxRzBvYlZCRGpU?=
 =?utf-8?B?YXB2TFAvdzVpdGczT0ZVeGVST3lYejBxazJwcGNENS9QcmxXU2VSN1g1b2k0?=
 =?utf-8?B?c2orTlpNSGpzRzVYVjk2SldTK0FmczVvL0c1cVNnbFZOcHRnVHNwWlZ5bVly?=
 =?utf-8?B?TG5BM1N1K2p1Rjh3VWZHSEx5YjN2MDlzUzBCeDRuU2JrTUhpYllzZkhtOVMx?=
 =?utf-8?B?UXNybWgwbWY4K2owaXk5cThrKzJNV3hoWUg1dnhneEJ3eUh1enFxbE5uUWgz?=
 =?utf-8?B?WkE2dEI3L3VoaVRjRUd0eURvTlZBSG9ldHVvZGJSZW9lTGViYTJBYytJR29s?=
 =?utf-8?B?eHZNd1RoeVNMcHZxMUlsTHBVRnJIOGJnelFLeURmaVEyZUhmejZIUzhVWlpR?=
 =?utf-8?B?Y2dBdDUzV3dKa2wyaVpkeWEzRjMvNDcrZitqWGVVc1FaUllpN0xiek9HdGFk?=
 =?utf-8?B?Yy9uQzFYZ25VRnZjSWp4T3k5WnIyS053WCtPcGZHb3NtNWhkVXA5Y3E4LzJz?=
 =?utf-8?B?VEsrRzhzS3FsaWZjTWJtUWtHU3hLZ09McEM3VDBFREc5MWZNZSsxeVRQeGI2?=
 =?utf-8?B?VjBLUENJL3NyQlA1cHBqSlg2VW1zRU9nKzM4M2EyNGlzUWpvcVhwNko3WE4x?=
 =?utf-8?B?L0RnWXYvd2k3MzVEeWRZcDcyNWJvU2daWFBPSGdFa1hMZ2RBeUxiUFg4V0lJ?=
 =?utf-8?B?QkI0SkRpdWNkdDJvVnRQZExtR2psKytRamtsbDY4Rk9DWTZuSTEwS3VYZTUw?=
 =?utf-8?B?L3VscngwdE5tWm1VRXlGVTFpYU5NZ0JhZU9IR0MwS3hCYU1pRHFXVm8rU0xs?=
 =?utf-8?B?ZlJyb2I0YVJrZjlOY3ZnQmh2UUlhMFlNbGhmQW9rS2hXS0tVVlNFbEtLSEhO?=
 =?utf-8?B?MGxjV0pUZTRVbENFSEZvVVBCVGZEUXRWZW03eEZ2UUgyRFZuMEdTM2FVaXdZ?=
 =?utf-8?B?L0Nxdis3YUZQZVc3S0JOKytBYWluZFhxb2cvYVo3S0tFSWxUOGR4M0x2SDg3?=
 =?utf-8?B?S2kwSFJNaHVqbEtwb3lKRDVpcjRqYTJQVGNMUkdmVmxhTGdZbG1kdHFsM0ly?=
 =?utf-8?B?Nmt5MWx1Z1hOTTlPV1YvNjVOanNva2Rsei8rbEF1d0VPWkxWVWt0V1J0YmNC?=
 =?utf-8?B?bkhkWWVSZFZXNHJ3Ymc0REZ3M0R4VHB1S0hUWHNybjROVzJibHdGN2d5L2VH?=
 =?utf-8?B?aEczajY2ZTBKcUVEWTZiNnRmemkvcGVoMk1teGhObU5tenZMMHBmU1NMMWVr?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9dd8b9-ffd5-4c60-c81e-08dd3560b2c0
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:32:38.9447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2Bm1o474eIWcdzOQFAKsMgXQ8sEw696z/2Q7RnHNRK1/oXRNbhsMP9Vnhk8MUE+KDpoTA7By9AOlgoHODwmgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2617

On Tue, 14 Jan 2025 11:02:25 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Sat, Dec 21, 2024 at 7:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > With `Refcount` type created, `Arc` can use `Refcount` instead of
> > calling into FFI directly.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net> =20
>=20
> [...]
>=20
> > -    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
> > +    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>=
> {
> >          // We will manually manage the refcount in this method, so we =
disable the destructor.
> > -        let me =3D ManuallyDrop::new(self);
> > +        let this =3D ManuallyDrop::new(this);
> >          // SAFETY: We own a refcount, so the pointer is still valid.
> > -        let refcount =3D unsafe { me.ptr.as_ref() }.refcount.get();
> > +        let refcount =3D unsafe { &this.ptr.as_ref().refcount };
> >
> > -        // If the refcount reaches a non-zero value, then we have dest=
royed this `Arc` and will
> > -        // return without further touching the `Arc`. If the refcount =
reaches zero, then there are
> > -        // no other arcs, and we can create a `UniqueArc`.
> > -        //
> > -        // SAFETY: We own a refcount, so the pointer is not dangling.
> > -        let is_zero =3D unsafe { bindings::refcount_dec_and_test(refco=
unt) };
> > +        if !refcount.dec_not_one() { =20
>=20
> This is wrong. The into_unique_or_drop function must establish an
> acqrel ordering when a UniqueArc is created, but dec_not_one() does
> not do so. You need to use refcount_dec_and_test() instead.
>=20
> Alice

Ah, good catch. In this case I think an acquire fence in the unique
path would be sufficient? Or would you prefer to use `dec_and_test` and
`set`?

Best,
Gary

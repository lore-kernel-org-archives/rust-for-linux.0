Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020124.outbound.protection.outlook.com [52.101.195.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090763624A1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115490; cv=fail; b=lKddXTYNAaEKmoJIR5hQWUF7yoSk7J0dS4ih5kCj6yHIzfw14KevA+e1GHuZgCZVbBITxNNAywfkvfCzTbdQ0cqfrK8uTRGmHCQmv/S0RugRQRg9YKsXWH/MN7G2NYLJzfZDhs1KaaKhQKO4QhzWLOumgS4w+C62j63fR1EgEaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115490; c=relaxed/simple;
	bh=m0o2sV7NIJl3HGbOGRM4/UpQ5Ayf5nbxiglljF2CB10=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Nu+TCzwkMwhSkYByQ0z+YtdXKT1KEbBXTSeSjcHyB7EGb0FzkaUDJRljh9YiZk6OlvAPgMtt+4uGeWy8TcvNSHbCgtvlESuEYS05TKI8O1NZOHq9VGJYL2vPVdAywLV1qtwRTD3dZWpUf2ovqz8xhiBUeUTGOS5wJik+hDAVRG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=aCZVnYy/; arc=fail smtp.client-ip=52.101.195.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="aCZVnYy/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixGPM3sn34S1CsVZDUVcCaWUAkwPPsvtXoqUJugGEqVRh9YYqsr+mhG6g2+nrVykFiGJIGFlu0q+xhcGJ1/inrcMTNAHRz4hjTysqziMXk2aAqzhRN7RZZkbjT6N2lNvzxQ3hPV+eZCRrQZIOt2lbz+lLY+v00CSOJJrqMA5k/6rE1C8xxK+7tme7A+Zr1PZ+sO54jvammJWVkcrR0sHXUEhqzqUqhWOPZ9N9Y0vdkcTRMFAiRNzn0oBtLOk1ijoLazKum2rrAT/TZnYBBVWXaqHr6gTFwV6wgx8tXoUeuDvmoeqq+13Dc9rJCbIvS7iHwb58XF/ujpa+0sP89KX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwweCYCWH2k9d1oPJlD5g5NUX96vQcvd1nSL7j0RuTo=;
 b=YoIyQ8D0U9nZ12Bc3GWB7EO5FOuHWTXQuC9ZBHScV6TXZax4MgHh3edpQKnzrZMmV2HpOKLO62C6L73xpqH1LINL0nQBwjFzvr1mEGi4x7Chbb5aS2Q+I5/zi7P7k28aRSGcXL4eH1EeW/snQLTN7mHmyFkkMWaO0WtJxQUlHMbBQFF76D7xduMJVlZf2+tsWuberOGgn8oY2HZCVFuvM/rsyEIpwF5cGZeKtWUTGlRQqxSMilyRmeDJNxSH9JSF6Ky0Qct/+PAejDdnVa2n1lqIUmh+J3V26vxGpLkSzpiG05ii1bq5QC0NVjtUY2b0L6wKPrgIH9zWkZ4f2SFA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwweCYCWH2k9d1oPJlD5g5NUX96vQcvd1nSL7j0RuTo=;
 b=aCZVnYy/PDEQaY3TO9Dnca1QcC9+F3Rf5BHMONWrD2JF7VzwP7ViYmL3st0u13njUOZfuQDtuoclqzxemECrP9aWIJCUgRTl7qO3Cv+VSF/YmwTG4W6/2/OZ1lGq+pudyb9Cor76aTEyNTrWCRVr4EEFfoFY8z9nDxc+aVI0DB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9310.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 14:18:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 14:18:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 14:18:02 +0000
Message-Id: <DGOYIE0KDUQI.2U7UHFUJUL84G@garyguo.net>
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta
 in `fsleep`
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <adarshdas950@gmail.com>
Cc: <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226120848.82891-1-adarshdas950@gmail.com>
 <20260226120848.82891-5-adarshdas950@gmail.com>
 <20260226.215923.1020202093931415612.fujita@bee>
In-Reply-To: <20260226.215923.1020202093931415612.fujita@bee>
X-ClientProxiedBy: LO4P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: a84de80f-5986-4a93-22f8-08de7541da78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	b431Wce5/mgKB05BcadufUCUM3zOOeWa8vAiD/Z4iOeTbdWVpYuEovAurCWH8ITbcgY2hWR/YngMFcNzmTcoZ7nsrtRzCAfpQaso9KV5SzraOLR39DPyyN54OQ6SxYW79+K+FDlq0s78yBFfzuOuodQdsMhB6ecxIK2kUf5/GVZNDPo9+K8QCDsrFRGWJMpM/hiMQloId6Ay5Zbd9/izA5ELTgUw16hWvPjb7j8V9+wQ9czKqbxOd8DuCDSPVW7bVWHdTZoUVAioLgepGSneg03XcDjX2JcwRsrqrXUKFIYA8usJCABR3Tk/fLdAKrDF4Kgx31swocSGo9TVHX3bK5jG54VomTZkZSz4bF/YhgR9eADf256OegIFIptq61XOPoEHxgCOV6RKUw6JH0SATBW97C/M9xc4jDH/qBtQkONrfu9y0VUefqHJorCG6e9P2ioMTM8x0Ndxx3JCN8GrDIxiDIpZKpCZPYBJa7KgqMZrnLx+L4G0LBZ6DLDebb60MRy63UjTJfYEU+r2dckT/OruELwSRO2ppoZnDmnFs7A4W6tK/51s966Vm8D1Z1pMA3xhwM9cAkcZ9pzzdF3RGD2JZTDvum9n1uCB2Bc2hIT/ZUQcJ0k4MT6xHo23rYMY0B8o27FeTM/y9z/Z7r+6HgGvWJRQ5e0f7cTcZtai+Wm0JLVjDYkrkwPRMmOHnj4OmqJXgQzQOqGTzFaw+QmrYVqRlG/hkWTnQsJZkAvPSk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURvUlV2MXhYcXB0VHQ0UEc4QVlNWjZJUGRKK3VLdHA3Ky9aNXk3U25Rd1Zn?=
 =?utf-8?B?QU5id0Q3M0RqeWovNjFTQlg0UWVKMFlpQ2llOEJDamtQRjJ5akgreVN2YWhh?=
 =?utf-8?B?YjBXWUJLd0NZZnRlYSt2bjhKRkRtSUxnaUUrQ3lPVGhjRTFJd1hUb28xeVk5?=
 =?utf-8?B?N3dKVUhLMVZ6ZmpJcGYvWml2K2JRZXBUL0JkNXVWVldlbS8rUUo1R0VxNHQx?=
 =?utf-8?B?eGx5Rk5BOEdteG1kNTQ1OTY3c3hybmJnalRLd2t4QXlCKzNLU0VjUVVjdjNK?=
 =?utf-8?B?bGt1RjVvZWpOVXhocmc0TkFRa1FRWHJNY1RWWWhPNE9kNkFLZnZKN3RxZHJS?=
 =?utf-8?B?clo3cHE1eDI1RlpQa2grdisycFppc0wwVW9kNGtiVU94R29NSUZGTGJ3MDlL?=
 =?utf-8?B?MU42QVIrU3laUkpKUUlyS1NWQzM5MEtoNTcxUDg0K21hczhpOWUyaWNwZ1BV?=
 =?utf-8?B?UU41NWVUYXV1aUw4eUwyN2kzRmx3SXRFdVRrNzh4ditKSEJ2M0ZuMHAzYzBn?=
 =?utf-8?B?bE5NVi9NZjRzMG9lQ2xvYm8wclBKMUd5Q0ZqNmNpQXNORWNBOGJqa3dTTlRz?=
 =?utf-8?B?cE84UFE1ZGdhZUVxZW9wVUFMSmlDV1BRTkpEUlhTZ21sU0pZSUo2dXJwa2JB?=
 =?utf-8?B?Y1FFekdsZTRxQWZkWDBzYStSNjJGODJ1SmNJM0FDUzF3WmdFbXRzS28zalFT?=
 =?utf-8?B?QXkrVU52TWRoWnpvZmVrQUpnenQrVnVMWmxYWDl5NjFId0pxQnZyeGUxWG9Y?=
 =?utf-8?B?UUFFQ0pmRW0zMW8vc1hkUWtCMFZwMzlSajdoU3pqdVNvMTJBZkdhVStqTDZB?=
 =?utf-8?B?ZWpOTW8rVmxtT1RaUUp0b2dJM0dJQ3hldDdta3lHK3p4VWlya3VOKzhOdXVu?=
 =?utf-8?B?aWdLRCt5SWJ1Zk5OS0ttb2RJZ0F1QlkvaGpxZ09jOW5LZnpXdTNuSWwyUG1L?=
 =?utf-8?B?dk5JcEFOaUU5WjlLNFdRbE8wWXJyblpKaUtpNEVYWk5oamNjMmdDSzZwZUgr?=
 =?utf-8?B?QXQ5anVJdW5DNndLN1F5NHZYdjB1TjhWcmE2VFFTSkFqMU9vQlczeFhUSXNo?=
 =?utf-8?B?OVVOcVZTeHZPRlNLdXVvRC9WY1R4UGZzSXdkVlhVZzNUSW82dWxMQ3NZZmhD?=
 =?utf-8?B?QVhGaXRKSDJLMEJodUFnUWtuN3dVR3lwUnVscSt1dS9mdTFuNDFKUExVbHFa?=
 =?utf-8?B?azVPazlSTUlvdGRjdDlRSlhtdFFaODcvUVJPdVh3MlhHcEozR01GMFh6bWR3?=
 =?utf-8?B?ZXdLZWZxNjlmMys1ZWFwc2JpMlFZQVNyYUxrTjRHRFg0cHVBR2FEaXNwTUp3?=
 =?utf-8?B?a3hjZ0xPcXptNEZMM1pCMlZnRFdBL0Fxck9Ic0gyUDBlQTB3YWY0NG9UZDdR?=
 =?utf-8?B?eGNaR3JOaGd6U1FILzhuMkhlZ1FLTkoyVGpyQnpOZU1BdWlxaWZUVHV4Zisz?=
 =?utf-8?B?dnRnTmF2YnJ4aGFxMDEwV2k3YWgvbjVBUTY0UjFCbzNCWjRwd2lrNkZFUWZH?=
 =?utf-8?B?enQrZW9DMDc0QUhBTFpTczhlUmlzRFBuby9jSGdUU214cytUM2dxNmU2TzVQ?=
 =?utf-8?B?WVRhRWs3SmNQUHNsMG51QXNzUGszdWxkUHAwcnp1SWtKS25aenRiZXJYSUdx?=
 =?utf-8?B?djBBWWc1NzVUUStINlBqUFhHbUxCWTI4LzZ6U014VkNYVXNRd2JGVVVOUnk5?=
 =?utf-8?B?RHVHckZvdnFpcmVwamVqYlRlQ082RkZFY2pzaTcrVFE4NWRacVYvMUN4dWNO?=
 =?utf-8?B?OTdCYm9zcytieEluUEFJNHdzLzlxSk9HUEFSUlV2ZTVHRTdhMTVXdi9MNW52?=
 =?utf-8?B?R3J5K3l0QnJMRFM1Q0N1Vmx2S09QbnJWVk04TU5lRGVZeFA5Z3k4OFM1MW9j?=
 =?utf-8?B?R0lsSlc0S2QxTlNmcjlObnY1Wm5KNEtIS3ppNkpVSDlQaUtPMS8vallZQWdY?=
 =?utf-8?B?Unl2bUl4TnRZeHQ4cEk5NzlsQThCazg3U1dZVDRqRGlIRC8wTXgvZGtCQjha?=
 =?utf-8?B?TUpsSElueENPOFVTdzkyNWhMWEM3alNQWmxDWWkrbHlXRnRtVUx0TGVUUWNV?=
 =?utf-8?B?SVY0Q2xSbVRFMGJTNCtwNk8wWVBtSEtVbmdzKzVEZWN2VnFZR2c4RjF3dHJm?=
 =?utf-8?B?L3dkc3Rnem9wT0VlcVdWYU5SYzd3c3IxZ3c4RmJOZlplWDBNTVRNMHdJZnpL?=
 =?utf-8?B?dmN1dGdSR1BuSThRcGhJajBwQWsrakR4c0U0Z2VIVCtBTVhsM0xZcEZPbi9n?=
 =?utf-8?B?ZEl4ckY3NzUxV1EwckxBdXUyOWtQd1k5VUhkTjRhMWJ5czZ4UnNCbEJXRHB5?=
 =?utf-8?B?Vk9rSmtlQ3hoVU9ObFovODcwWmIzZzcxZUVXaHpjWVVRK3d6ZExNQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a84de80f-5986-4a93-22f8-08de7541da78
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:18:03.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwpeIY7TkdaBPhG46phdt088aEWORl9Z3ORTp9miXV5vxtJ5gcAkpdnDCa1PtZLGz8+O1M29x+Tgb6rYvlvfMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9310

On Thu Feb 26, 2026 at 12:59 PM GMT, FUJITA Tomonori wrote:
> On Thu, 26 Feb 2026 17:38:48 +0530
> Adarsh Das <adarshdas950@gmail.com> wrote:
>
>> Add a warning when the delta is clamped to the maximum value and remove =
the TODO comment.
>>=20
>> Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
>> ---
>>  rust/kernel/time/delay.rs | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
>> index b5b1b42797a0..0965fcb6eb80 100644
>> --- a/rust/kernel/time/delay.rs
>> +++ b/rust/kernel/time/delay.rs
>> @@ -35,7 +35,7 @@ pub fn fsleep(delta: Delta) {
>>      let delta =3D if (Delta::ZERO..=3DMAX_DELTA).contains(&delta) {
>>          delta
>>      } else {
>> -        // TODO: Add WARN_ONCE() when it's supported.
>> +        crate::pr_warn_once!("delta out of range, clamping to maximum\n=
");
>>          MAX_DELTA
>>      };
>
> pr_warn_once() and WARN_ONCE() are different; WARN_ONCE() also dumps a
> stack trace, which is more appropriate here, I think.

I think this is also true for patch 1. I think it's fine to add pr_warn_onc=
e
before we add `warn_once!()` but the TODO should be kept.

Best,
Gary

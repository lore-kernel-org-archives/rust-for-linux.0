Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D9450410;
	Thu,  8 Oct 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465360; cv=fail; b=dTVZr2Qfiacz4SkUH9+fhjqVo4jSlbzSmXZBIAJDPCzqXd38Ngcxtgm/pE3eC1pw/ERNwMBfLAEmoJw64x6wy9StVJLNdg6Vq7hQN/AM1txqcmE5Wc97ovSOnP6Np2k73XmKyj8wIlS823jayGf3mbsYKB2prYtChdHC9ktS2qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465360; c=relaxed/simple;
	bh=HFL9lfQeDCM5lY3jNubl1Hum/Qpm4Dd4haCeQC7e+SI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aIYMdbU7QjGJcF46o/aU5ONTC8tbo9hDr9626t6kNU4dJPDG7I9WgtBbDsKSJ+WtXKThZh9kI5VWCdEF+6NbuJMeYqedqsb5j53ukbHs05PNAJU2YYokz0w4d8lrNIdieQkv8gPXKk2I3qWemW+z4ofiogKi7O4ASHvRv3HsRDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UJm6G0NC; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UJm6G0NC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUh/jTV3NtLCibf06u3Go7TwsuhNW01zn1mWWPI7g8e5l+4Rk2N/qLOG+vR5gponJWRlT2oar5w6O9xpaFhuBUZBIeSgHc7LysUjZB3He5FGZLJo8clzGloSVByhaCSpRe8UDwvK6eb9B4Uh25RVN7Ng63DGsHgGfTGD9u6CMoQj4OhTW4bmsTMJNk2ULBpnltzTsvuJTcSGOLLMy+Hnac5qtfrCokSBDQOvoTgOqnNUJU2S4Zw0z0TWIN3IpkTw9NUGwLGVSSFkzWiGOKw9eyBPETsQ9Fqxkv11qNjMGtPSsC1PpGcjwJzZtFYvoaIaPvFf4OZWcz7fLzW/XvaeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojs19kOaq7xhPWVvW2XLvU3XABDYrwy3DHqd5wAYg/8=;
 b=w+S1dJ+vjAVKPUSSVOMHJDsN6cQDCHkYSlpqQbh90sKMs3DnNrmY/Fd2fhX3G8yOPiWxPBLCnbnMR94xBJCl3Oyze1GJ0WJe4nlE7jvgfv6HXOvwXabnJpIkykD5EXB3c0XHM/1QBe9DcDKI8C0QGl8KCX2sp/bv+lCvWkziheq6/Ee3Vtr10729ce84u5Hr14jl3ZHpnzMrMY8dl2EFuv0iMj9qyIhEeoeHg1dVkxECrl1aT5JaBhmfj/5gSusNe9S0T5m3dUvO+SjLEDrPcoIVqe44H31ZFpZJAl1KH/AgGArB9BheHRpBhaoxEpuo9MtGb3R7pqiH65U8PXmWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ojs19kOaq7xhPWVvW2XLvU3XABDYrwy3DHqd5wAYg/8=;
 b=UJm6G0NCWOB5ixiQnc61/4I8ofuS0dAaRlr55lBVWz99bWx9O1vB+MOTCe7NALfZjBoozHow9+ZYT86gF4bDsS3qe90mK/3UOs9zX5BSrNklhwHMNb08FCgFZdcjLYqvVQE1UqNuR/mITJkJR/gC1uhZ1DjWfH0AOOkduo8rLQqjbtQsnnOpIICSsCruphNov5G//SAOHlLhAfvJ1uH2yAEfg30etxz1g02Iv31vwfiuMy6LoswSoDoJuHtiSW6cdVabnipkESgoIk0HiT7PWI7fBBY4cQKNTokQstwgsvW+uxSTQUV36toCWVc2wSFbyXUOfcF6N4dwNRdhWsiwHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS8PR12MB899436.namprd12.prod.outlook.com (2603:10b6:8:446::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 13:15:52 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 13:15:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 22:15:49 +0900
Message-Id: <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in
 strcpy_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Thorsten Blum" <blum@kernel.org>
References: <20261008061326.177841-2-blum@kernel.org>
In-Reply-To: <20261008061326.177841-2-blum@kernel.org>
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS8PR12MB899436:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0ed6c1-aa61-4ff2-0cf7-08df253e474a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|10070799003|366016|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xlpe5FoQzS+oy+gbwvX2AjrN03bL1tORzf+U/fKzP4r35lq3y9GJ4xFDPGQEdiPraWKRMK6mQD1U5tQE5yTv1LAwAApqww8k6r+qZOjnQjWj/O+wkbaOkXmuDsr1KsgsF+jPMhZW5NyBM4sLrtnucSxkFqURi3DuplTfbrXJ9sm1FTfBKkcstM9j34V/cvEGBY+jHZRThTxp5IpkEU70Z/lS2EBcxx5bgnkY0f+1U3E/mIRMOjPjanMmr0GDI85lu+v8gBspzEv02tF2W48bVDaK7IFeSjsIe5Zz4zZUsgUWLCa47YVIqUQXNgXXGu1Og5QkNx1K1Q4UJW/gdzKE0iLK0lI3+E07uo9tb0O1ap6afcjhyWi7hlD4dDRhFZJH3Ze7kZezsL77U3zpLKpL2KQ2SxsIRsxI1+O3/YzmXeRcxMvP/2DKkG7nXYzcfvt0z7gmr9zRPUFf5ETdjCM+eAVSeUg7DEpvUJhS+MMYT05N4MhR25KkwSKOogYL2DkSXezr9Ht6JXAwewqa+arcWzo2aHV8psizjLg2BsFhpB1GOa+uIVTVh79Bpg3oJJwDJwyrQKJuImiLKSswtEfjrnPV79CdGgIQv052W+rhZppk0WWD62hvtEYRuyz7uq49kIUX4kbqIix6ZkJULIquqRGfdN5lAb1iGud3pnTjIbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(10070799003)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1YzR0RNRXMzTlI5b0dYVGZkZ1VrbmhVQkJiZVQyRzZZU21FenA2cmtQWmF1?=
 =?utf-8?B?WkFwOHdhTTVxc3NiclpHUFp2RGNaNnRsdHpyeWhIVE50SGozT3dvS1dvZ2E0?=
 =?utf-8?B?R3Q3L2g0SnMyNzRVOWg5Tlo1LzVVUEdNcHA3b2dxOXV4TDBQWGN5QkNhYjgw?=
 =?utf-8?B?dmcvcW9YYm9LL3VxcytvVzlkcjgrc1plNGVPTXpKWFkvWnJKNUpzeFZsZDN3?=
 =?utf-8?B?bHI1cWNVQjVyaUZXOXRWalZ1R09FMXYvQ1Z2aTJHMVd2MFhsaWlyRCtoQ0lF?=
 =?utf-8?B?cUJtT0xYaTR6MlNGaVZWVnh1c25HUlZiVS9YUlpxSkVMRWtSVDVoa0JUSkd0?=
 =?utf-8?B?cmZucVk4aWpvdFR2Qm51L1oxU3NXQnAvMHNJZ3hGVHBERmZkeDF4Y2M4QVVX?=
 =?utf-8?B?M2Eva09vREh1VW5qNUUzdWNmUGNIZDVNSm9UblREMlF0amdVaWRua2g2NHp2?=
 =?utf-8?B?eEZUTFVMbWtSZWJEdFBqdGdoNEh4WHF1cm9uS3VRWmU2MmJUdkhwWm82S3ZX?=
 =?utf-8?B?VWJuQnZ3RFRsdW00QktyNC8wV0Q5bWZ0MXZldVVWWVNoTC92S3UwQ1EyOEds?=
 =?utf-8?B?OU9SWlBIWkd6U0J5K0dGK1ZmaEczSFlTaVlPU3RXeFRiNlFwS0tKNk04Z1Y2?=
 =?utf-8?B?ekxsTGRjQ1JLTlVGeFE1R1FPdjkwdmc2VCs5SHRYK2EzZmJjOTA3MjZNZ08r?=
 =?utf-8?B?eGRjV3FHd0JaKzhoQjJTTVN1Q2VRUWsrOEIyeUdONmlHMXdsSzI0TGkreDA4?=
 =?utf-8?B?Q1lrZXVPQ2x2MTVmSEJpSTdWdyt2cmNxU1RleGRKSjFUV1hoLzJFM2x5TUlS?=
 =?utf-8?B?R1Y2R3F6bDM1Q1RUd3RVelBvMllzYTZLeW9jcGZDUjRzT2RDZG9BUXJxczU0?=
 =?utf-8?B?b3pPZm1LNUhMekQ4V01Lc0hDR1UyVkE3bWlYVjd1TExBUTEyL2RNWlhrM1hD?=
 =?utf-8?B?NitMKzNQZDNMVytPSktJb2s2ZTBLQ0V2WituSVB0aytZVVhZWjREL05LOHRX?=
 =?utf-8?B?ZjUrUHJBYUcyaDVIVWpYellKK2dlNnJheG9QRWE1aHdIN2hVcCtJWGU2azZ0?=
 =?utf-8?B?OFM2V0gwQkFRZTdhS0ROSFcxOUs4SFNNTmQ2Y3dRTER5NXhBNzlRWUgvd1hB?=
 =?utf-8?B?eXBIc0V0MGs2TmQ3dWVWQlA5VGdYS3VjY1VqSUE0cHlhcWtlcEZHZE9sK2Ft?=
 =?utf-8?B?MU0vaVFqVzBCcmxLekdnVmdhWDNmSHNZdmhoT3BIYUszSUVpU2VWb2h1ancv?=
 =?utf-8?B?enBxNlRsMjlFTi8xbUhTQ2FIN3p5SVZZZzJ6YU12ZDljazU2VmRGNjNRWWcx?=
 =?utf-8?B?SmN0UTQzeDQ2bCs0UUlkUHhCc0w3eW9wYWllUVZZSXJ2VjRBV2ZJb1BJNzVl?=
 =?utf-8?B?NlQrQk12RGR3enZpMGxJWUQ1TWUzaGtXRFZkS2tJTklEWEEyUFNwSHY1TTRx?=
 =?utf-8?B?N1BNbkhVTCtUcnJrVlVEbDNYUmxQeEpGUVdjL3FZMmpjUGdJWlQ0SlR3VWRE?=
 =?utf-8?B?ZkF4YkNJWHZwUmRIQmpZeWZwdEJyeE12QURWRU5WNGNkRnFYakUvcG1LSk1s?=
 =?utf-8?B?WXpuZEVCd1p6eEZkeWNObmdpWEVTdW1RdGl0dnV1K0Vsc3pkU3Jjc25aU3JQ?=
 =?utf-8?B?RldBMVZXV2ZqYmQvVE1vc2dHMG5mbVkvaERzZ1BHOC81VEZMZUorMGd2M3RS?=
 =?utf-8?B?aThRcVFoeXNrLzhPUkdwMnNRS2dwcnJyczZxVnZTbURtUmNoVUQ4aTM3VGtX?=
 =?utf-8?B?WHhaczJVWkkrNnFaTEdaMVdIa2lCTUhsVm4zT2orV3QvbUtoRGlORDNXa2Ix?=
 =?utf-8?B?QTJIRTgvYjE0cys5ejBTbXkrMHAzYVRVbG95WFVad25pQ0Z4OGc4UHFwbndm?=
 =?utf-8?B?RHRvUmpNdHVqT2pEL09QMml1WSs5YXU1Ti9YSGV0L2ZBS1VQaEpna2dDYmpt?=
 =?utf-8?B?bXpMT0xOM3RLQ2NJQzhDZFMyUnhObGNuZDFQbUVxRFllVU05YnBoRndqLzJw?=
 =?utf-8?B?cnBnSUdYNFlwK0hEdFQrNW1MYmdKZEtXRTAzVlpFVjAyNEtjRDJyeTlMbzZu?=
 =?utf-8?B?cGtWUTJsN2srUFNENENqUjdwSGxvcmRGck5TMGZUVy90T1NhTW5sZno1dzFm?=
 =?utf-8?B?aHl2OC9uQzVWNjkxdmpwdFNOUzZ5eUl1N2dVdmttZGM3dlptYklWZzA0QmNV?=
 =?utf-8?B?WHh5WTFmZ0N6bzQrN29raUIvOFBDbENmeGdWWXZrRXZKRUQvOTJPMGU0UlN5?=
 =?utf-8?B?Tm0yUzA4S1hKa0RHT21WaU9BOEF5QXhheDVvczM2ZmMrdkR1aGgvUXRKZDZv?=
 =?utf-8?B?bjZTWWhZa3dmTnpJL3pkUWxPb1U1c2dQdmtOb00vWG9XaDVhekpQZkpiazVS?=
 =?utf-8?Q?UGnYaTa5QOBHUbENfoCqU+RNSejTvEakiq3bqDufig33r?=
X-MS-Exchange-AntiSpam-MessageData-1: RFX9lxcrFqG1GQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0ed6c1-aa61-4ff2-0cf7-08df253e474a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:15:52.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JbVIO3oVe9EqKqezrl9UEeksNetV+3cY/T6mkKWsTMLgn93hs52ur3OVxR5A6QZRD3a3oIFdghgD3mVWwMiHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB899436

On Thu Oct 8, 2026 at 3:13 PM JST, Thorsten Blum wrote:
> Since strcpy_into_buf() already rejects empty buffers, use ok_or()
> instead of unwrap_unchecked() when NUL-terminating the buffer.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  rust/kernel/uaccess.rs | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 5f6c4d7a1a51..2a0af795e75d 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8=
]) -> Result<&'buf CStr> {
>              // This means that we filled the buffer exactly. In this cas=
e, we add a NUL-terminator
>              // and return it. Unlike the `len < dst.len()` branch, don't=
 modify `len` because it
>              // already represents the length including the NUL-terminato=
r.
> -            //
> -            // SAFETY: Due to the check at the beginning, the buffer is =
not empty.
> -            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
> +            *buf.last_mut().ok_or(EINVAL)? =3D 0;

I am not sure this gives us much - we are trading an unsafe statement
that is well-controlled (enforced by the first two lines of the method)
for a runtime check. I'd say this is working as intended here.

Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020086.outbound.protection.outlook.com [52.101.195.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84F3ACF18;
	Mon, 27 Apr 2026 23:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777331060; cv=fail; b=YHTT4EaKy4TDwQLQq5wD/KqJ259TP7EEk8MQdwSqnInXgCIwSDcVpqwgZJgFpboxNajzN1ZNjlWGXbEBiW7zIygCyQ39krBONs9iKG3RACSWcwFHQAzV47mRPTb+/wxLbgVb7uf7gWA/71xj+T94QYyQhmntThanZCed7KZqUY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777331060; c=relaxed/simple;
	bh=lbXX+jqOEhyBKEtUU7Wurd53WHVg+vxxDFoIWfvH8P4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fyanfEs7SOKB7k0DM4GE9RBbY5W/DkvvgSZ7Z0IVFYIpB8b1569c7ND8OwSzdrq2ppMeu5Eo7pLRZal0h3rNMkf+lklDxB7LDo/FLViy23+PH18nnfijQjKgKTeR2mt9UVZ1BQHo9BQO4/u2ym6GjnO2WBks6vz99AUMd4KUzVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TghhLiqV; arc=fail smtp.client-ip=52.101.195.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TghhLiqV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogwqsOdwG8aZdL7lEufZfFRo/TSfG126dVZ+7ltJOdYGBCHbVWXl3gelP2cfKK595yNeGb+q2hqjB17V2SPykn76u5I8tJLLh+r4sAmgzjgjxcj+py8z9F9IvaRGdTe5T5PciCfHAgeSiQN7k4n7UsMTvuOVZwxGNE9NoQYzerYqfVq1vMiBNAJaq2CxFUG41Q1DM+yMbzXaLUKkhxSWPHDm+UjhuFfS59/Y1yqKd1XoJ1I85atE1k/a4ua0eAhqKK6dBBqgzbhsoldHC1o0/hTDT5y2IA0uzE3qrKgnctAnmM4cM/xIQVqvnl4bCurNPLYbsnBkMlx5z5iX34K6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4TRtmufAUNzCUMpN/WFH20QF3Xg0/urWrLEkyJ4o8=;
 b=qLhgnYImOJwUciXwixBdNL3i/4PMMEZMqkCD6y0syZrgZNgdUzkDc+G8Fi1kvpg+i31yUcDSVfYnZDgRmBzZ1ZnxWW2bUrYFAhW5Ov3UUJlW/mZfxEUzT93nyNWGHRKLCOPNzAOBglHDznPctULerqKD0D06fO8irbhZsE/i2OSr8CwBM7VRvwp8W6Q6d7t0ZCC+mrjtAxI3ieCnTxgLeZBfD5SQ7Z+zkF5tGK1DmCTzO9ruRrqsaoKYwHmOkMxIflgteDcTy2j/XmfUIYmmGwdzjHnFAOo0hEmLdtyuV1/HeLcV7rBLnO/h8D1J8pah331sojcWryDHju5vPL8bOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4TRtmufAUNzCUMpN/WFH20QF3Xg0/urWrLEkyJ4o8=;
 b=TghhLiqVC9XcFu/TDU56bdJ2vYRvSfI45ix3TUNI1peISyNpJypplBzBKdmVG+wKXNuwQRjHUvT9F7d2DajGMHvhmM8KxJ6UgTtK1xzrSFOgveR7xQZz9HvunQj6khoR8w36pQ4LNCcVx8e9JqHT+xPivlPi1nwAU7HfWBaMVUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2505.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 23:04:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 23:04:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 00:04:13 +0100
Message-Id: <DI4B9XZCLDBJ.1GNF26UE7NMQY@garyguo.net>
Cc: <boqun@kernel.org>, <lossin@kernel.org>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>,
 <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: sync: atomic: clarify AtomicAdd safety
 comment
From: "Gary Guo" <gary@garyguo.net>
To: "Sagar Taunk" <sagartaunk2@gmail.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260427203258.22148-1-sagartaunk2@gmail.com>
In-Reply-To: <20260427203258.22148-1-sagartaunk2@gmail.com>
X-ClientProxiedBy: LO4P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2505:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a601ad9-a87a-4af5-6d64-08dea4b14cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QWDfXngXQE7zayERqiHHWttObaVJFHnd/cRN97MxUpFcFPt8sPYmabcPjqafM2m0bL7HtY4nEfJs86lDymSB33xYjfNLGYwzEEGjEuDMB9verq/GQglh9NVOydadykLPpA6UYZZmdmVAN8dJBUTzYNWG7Q5aRk+pMGB+4RbYXHtOO9npFM7hN0wl4sw5y611/w4z8K1BNjA8PU4xMGJkT/CMQXA/zH0OrwsixLY2e92WWI3MeeeI/gqqhnuhip/rzXoC4wEIh7FHEd1+L0lTXaQlI70ue2nV5VMaTVqBBRHby3f9ZP2IkWXapITUWNeF3cAdvDPQChTyzRHmT0USBkDuoxcLNPatLEa8OXooJy03eXsp+5j9Clp64oJHfcQRr/PHRVdbzFTPGWWHCBf3HlRM7s3zAiJ8MX/UiFBOTmkSIJlN0PdK7QxAKDaCePnMy57ulOgaJgfr2hvc6SlEgXxu+lhZ1PDsThIykZeaGhpw5C80abyxFzJPSnZSxNlx1shHI6Qt8YPOVfqg9+UFTT3vTapyYW1SKqAvU5TOl0rA8pgPF82LLX2SsD9kBcf+ufhO6IkseXrwLS+zYkQKTMnpcxWa6S3Q1emP0N1HjGYL04I+T2A0lRluHxN0ZaC0YMRjpKF1bZulq+t9epbPQzNjZL6Jni+yeGCQhPQylxihqR/hfyX7FSV9YSRYjnoifpmUAsMB5NmofcXeW/gf/vgRWAXXxsB/dqwUooBPuuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEphVVR0SElTckxRNU1NdUEwSXhiS0ZlMEZ0U1puUFpxR2QxSm4xTjhRcDBK?=
 =?utf-8?B?RDU1SmN3S1FaSTVCenZyV3kwVnNzMWc0OEsydllZNDVqUEx6N3ZqMDQrUzl2?=
 =?utf-8?B?RDNzbDhrejFjQklCWXA2TzhFbzBjZmJqazJ5amkxRFF1czJiN2tib290N3VM?=
 =?utf-8?B?VldJRVc1TE5xMHgvM2o3ZWptVHBRVEt2aURlNTRRZm1GbG9kU2RrNldQUHZQ?=
 =?utf-8?B?UDh0S2xXT3c4YVhRdTMxRGt5UkpQUXo3MEFYQzBaN2c0Nmxmd2lVSzJRSER1?=
 =?utf-8?B?K0VKUGJldHdLWTdXSmxwUjNVaWFOd0hyMDVBKzR4blU4cGI5MHd2Mm1EM1Ja?=
 =?utf-8?B?czc3ekQ1REhYUjl5d2tFdjJpajNUT1dTR2U3ZEtLNWZqYVovTitab3lmREdI?=
 =?utf-8?B?RzFPUlJ5aDAzd0lVN09haUI1MzBoclU0UEVnNmlGVlhFZzBId2RjMUlpZmcv?=
 =?utf-8?B?Z2l1Mkw2SHRHbFdmVzA0cGtMODU5TlRnWG14cm9sSzdEQnBuVkdSU2pqVFRL?=
 =?utf-8?B?d2F2OXRIM0Z2UnlZRC9xQmxkTWpyZ0xpMEk3Tk1wWTBiWnVwdnE4NTE2UHFw?=
 =?utf-8?B?QVFyaDArUkVySDg1YUR4VVFlcCtkZnQvRTRqZ3pMMlE3NjBNQ25ENEd4NHBm?=
 =?utf-8?B?OWFRL0NsanQzSlVkTkFLWGJRWEpZSE1oWG55bWdsQ3RZL3FSYW9RbGo1dUtk?=
 =?utf-8?B?d0V5NjJwQ1g5cnBUS2NFMjZZSmY2ZDd6aVQvLzdFTXhhMGxTUlJ2bE5rREZu?=
 =?utf-8?B?SFR0MVRTWFpaODhCWVJ4eHFvczFQT1BIWEtOQXVEQU12RmpPQ1d5SWxXSVRp?=
 =?utf-8?B?c0VQbWVoNnRndXljSmFmb0M5NzBtZG5QeUF6ekZ4d2gxWjQwTnJ1eDN4N0dJ?=
 =?utf-8?B?MytLYW1FVVl6dXZkUXdNMzlvUld1SG5HRVRZbUVqYzVTTVovTnpodXN4WUkr?=
 =?utf-8?B?UysvK3hnQzkxTUhpdWZ4NDJ6aXZJREFSYVZPR3ZyTnl0cjErN25kZzZ2NUsz?=
 =?utf-8?B?QndCNit3WWFtbUorYXFvZG5LOGp0dm9lUC8xODh5ZWlJbXJZVHR4c2tLUHRX?=
 =?utf-8?B?aXRPR0dza21PY281TklsUEIwQmlLL3pyOHc4WEwzTFhubEZkaXRKanVFd3pi?=
 =?utf-8?B?TDl0b1BwMWVlSzlEbC9sdVVBMVFud0ZUVml2ZzI4aFA1bWk0SU55N0l5NCsx?=
 =?utf-8?B?SXhEbFRydGZlTUljQ043cCtGS1p2dGMyTU10N3FydGJmVTUxY3F6dGJYRXp0?=
 =?utf-8?B?Ymp3QlJYdEVHc2dnUXV2UjRvQlFUa0l5Um9NdXR3dWluRDVVS2FEUitEbk53?=
 =?utf-8?B?QVZSTzllN0ZtZ0txM1RTUlI3MEticlQ4RWtRUGR5Zlo2WjVoa04xdG1ETjBj?=
 =?utf-8?B?eC9iRFdGN09sTXcyTGRERkxrbTExSGk1V0NnT0k1azFrQUhudVRIenA0clNM?=
 =?utf-8?B?WlNxSmE2SExYU2FoSndYdy9WdjZEWE0yVVI5ZmtTaWNQTyt3bmI0TUFndlNv?=
 =?utf-8?B?OGZ3ZVpoTS9haWFhZzNDVDdIZzlYSWZubWxwTWZUU0VjamJVeWQ0a0ZUTHdD?=
 =?utf-8?B?SG5jTXJLT09GZ0ZJZ1pOZTRMeS9hd0MwcnI1d0hUZ2JTRHhUQXQyM2RsM1d4?=
 =?utf-8?B?UHdOaExzVUFyM0JVS1NPaXVZMWdScit6TTcyWGNKWk5oeElTdkRsaFFpVFh2?=
 =?utf-8?B?dWE2VS9ucHdpYWZoVmdERG9UYS9wM3pRVHRZRlliVERRZFd6dVhpWmhrM2ZW?=
 =?utf-8?B?ZFVZK0NWbjFDRGxvZEpNbTVmL2FtQ01XZ1NUNUh2bnBab3AwQWJreHJZTSt2?=
 =?utf-8?B?SnZoWlVrYlh2bEtuRGVSdjJPWG9XbmxIUkJrWk5SQU1ueDh0ZTM3MisxUjRo?=
 =?utf-8?B?WU1ldEVBejV5cXdMSHJ3eTdORHFDSVJNTFZxdlpGcnhBcnFCTG9vWVArakl6?=
 =?utf-8?B?aHBKUG1Mc0dHNDZBc29ERXA4SnE2VHErWmwwSUIwL0xiYW1FREtFNGJrdDZ5?=
 =?utf-8?B?bE9CaEpwVmw5Tmc1TlNadEZUUkhlRUlGVzJoelJ4NzZKSy82TWpPdVozTHc4?=
 =?utf-8?B?YjVBMjg5b1FHcVpoVmxsclVHZG9aNGRycndLMHErVnpCRnIxVGtyMDR1RGRB?=
 =?utf-8?B?SjU5UzRpc21WMnFYb25tVldZODNYM2h0dk5kblhvTnNBWTU1OEtaeHpSTG9V?=
 =?utf-8?B?Y3Z3WFd5L1FPc2pydEdjd0Y3NEpOZUI2ZDFPaFI2WTQ3MjcvTmF4SFNlMGV0?=
 =?utf-8?B?amRPR2pKY1NCRGdKMkR3YW5jaFgzd3RFU3h3Tm81ZFlHaDUrbjcvUVR0bkph?=
 =?utf-8?B?aWFodVJPQ0pxZlBPUnh1aDhlRTk4akVwV3VEWGc1QTRPZzRlK3FKdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a601ad9-a87a-4af5-6d64-08dea4b14cb8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 23:04:13.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJUmI/QVbFMVZzWKvOvBIK4/EZxEzgfPJyqDF1eYYt4ftN4p4Q7+ZclEgHC4QM2hG3hJZGwuXwz8Ou4OvlDTvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2505

On Mon Apr 27, 2026 at 9:32 PM BST, Sagar Taunk wrote:
> The previous safety comment for AtomicAdd was marked with a TODO
> and contained a grammatically broken sentence that was difficult to
> parse. Rewrite the safety requirement to clearly state the actual
> contract: calling wrapping_add with a delta from rhs_into_delta()
> on a repr obtained via into_repr() from a valid Self must produce
> a bit pattern valid for Self.

Where's patch 1/2?

>
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 9cd009d57e35..b38d9a17f9e8 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -127,10 +127,9 @@ pub unsafe trait AtomicType: Sized + Copy {
>  ///
>  /// # Safety
>  ///
> -// TODO: Properly defines `wrapping_add` in the following comment.
> -/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`S=
elf::rhs_into_delta()`] to
> -/// any value of type `Self::Repr` obtained through transmuting a value =
of type `Self` to must
> -/// yield a value with a bit pattern also valid for `Self`.
> +/// Calling `wrapping_add` with any value of type `Self::Repr::Delta` pr=
oduced by

It does not read to me there's any clarification being done here.

Best,
Gary

> +/// `Self::rhs_into_delta()`, on any `Self::Repr` value obtained via `in=
to_repr()` from a valid
> +/// `Self`, must produce a bit pattern also valid for `Self`.
>  pub unsafe trait AtomicAdd<Rhs =3D Self>: AtomicType {
>      /// Converts `Rhs` into the `Delta` type of the atomic implementatio=
n.
>      fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;


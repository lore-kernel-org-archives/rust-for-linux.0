Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020133.outbound.protection.outlook.com [52.101.196.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCAE3B14CF
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358896; cv=fail; b=VjcXdGPTzD2/8PDf3tlUKAlFPpuyYaJRy4W3KvcvH4lXqkiwz1xp2A1EZ8WkJMjED7B79gQFGsjbKu9Rr4cnyKVBUCCv1fOAbQwz9JRIWvAFvZd0kEe0SDN8yUOwknQAw97DmybdZKyJ4QjPLhmRFFwMjInV7dl/5qaRBriNUik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358896; c=relaxed/simple;
	bh=EeuanQyNt4uC+qIWdl32b9yQLU5LVB+dwcrFV7DJDWI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ey5488X7fSf4G/Kz2lMnlbttk8uxK75MAgDZFgIQ+IZORm9aIHQw9Ovvze/EX96fTofmJvcVNx+mQIqoo5MF3MMA5lHsfdK4p7mC7uzCQcOwVJILztju4vJk4EMyQKe9hrEXshCSzjaHY0O1MqjTazXEWcfq7fuXp7eLgf9Ke3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=N3UhVMt9; arc=fail smtp.client-ip=52.101.196.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="N3UhVMt9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+COt0On9Wjk87Vy/76wYIx967q1FuQb3Iapsek1npgdVoKXyf8Wuy9cD+lLfsXw0EQXGkrF8oNaNcbSDbzdUBXaYZwJvlBMtsSJ5ca8jLlDpftpeUyVVyv6/y7StFUEOi1VLZFDp18ieFRmZ5yTwVPgJFFrSxVUroQdhk34IOe9XzOOnI3Eeh8ifO5OE28ml7aaAzd21b8qxxy1yfgq1ZHf1stDDtRC/DT3ibBV2+/6ZsovFBmZRzVcnsdPVg6fsz9sCG/sn+ovJKBuIKKBhvXC1MQQfe/eVcd3BvnExyFEha3INBFcB8r+8x50g+oK4ZuW2CriyOB7gsQ5i0DSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UW6gUVsUbS1y8DMhWV7U0w4fyoq3e5UbPUvnVCR9FME=;
 b=j1p9LmGjmzYcm94ewVaqxYbd/1XtKSQh1/Aq68aUC2i/ygXk61RPFrd/I5Ggc5IlxfpSWVPV+Z3YU8mq5a1GhgfidLy1PSs1/Id2RO7b+YQfugDQZGbOvpZ/LhHgUmhm3j/Wc4l6JN0nRvNfLOf6PsStiafD/OYuDVQkxeXt01goGc2iTgBM0Z/ghdjP+wzXaT72zZw3fHJXUiFE6PDOPUS5Cmf68QZUCQTtJjRqKoZ1eO4j5Qxdec08Obo/LZ+SkLcnL+Ta27Rx+wG0hp12V+QN2iY8r7l+B0zlifHBbGgMn1it4PmELtt4p9tuI4YB5zwBnFl4QUBABN4eYn7RRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW6gUVsUbS1y8DMhWV7U0w4fyoq3e5UbPUvnVCR9FME=;
 b=N3UhVMt9GBwYCUZntWWp5AK097mljRFMr5xzyrQ012Vs2n/lOfHCcTYUVLdQXhrzVcXnQClulOPqvIsNeu5h+2XMHCACNeG1zPVX01lzcu71ou2p0yd0JFjgpomL9D/6BjyeQ9/mleS8i4mAYAyLZ6Iu2+QhLuzBEChwEOprcvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6783.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:48:08 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 10:48:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 11:48:05 +0100
Message-Id: <DKL7DIYECV4Y.2K72F6I0KHKNT@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v15 1/2] rust: fmt: fix {:p} printing stack addresses
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
 <20260810-hashedptr-v15-1-eafd27d36476@kylinos.cn>
In-Reply-To: <20260810-hashedptr-v15-1-eafd27d36476@kylinos.cn>
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a233423-61d1-48d6-161f-08def6ccdc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|10070799003|366016|921020|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e66lO8qPrP78C/6hu+1S10pspq4tnianGjHmLYVNSkKdCB8zLo62vDn79gxId+VhsFp7AUwAWHffgz/mpRQZQJDVk0sb5dXHQKdslMeSiDJF+KwPz7V9G+q1v/FbVB7nEB9f3HafLomnqeGMk1AuMfnMqVauyUtm6dalVhIQjzsQRKaw+Sh186SIVe6jrLb4wHOaXKmztV6gMsae4tBQyoaKbvIfDaEAzmlb+kCbDmGQY5KDldHrVen5o4pe1xSUs3BDEML/zkz4UlX0rEoMmPTKMF8Ay+aJ6abS+rfKj5y0FlXbFCNakddaUwPHQ8Xa9DDjum3w/X9qvt4Pps8Z/PikUFDqJe3O80MLR9DizRBfwZR+0EvTVaNSzHQSVob+gdcQv8rVH4S68VVUGqwk3LHwUukdjXo2baKbAztm1hn2cOsfTZlzbkQVJ5O2mXZPN+YGFbmEym6GQXS0qVOQJSEakTkPLfDhTbCyYdcZ1I8VrSMo/SyXiDH5Zn1sNW7MOy1ZTQGeap/bamMBMxjYEl6+IjaaDiMspfsZPzSvJJwh2td+1zR17/kXtYPCzhBDzfl3M1x/RhqUT0BemGtVps48zDWqoek2xSJHN1LJle9QmBPRcS1Aea8+2PLCPBT58yr8VGtKKMPOsmBlInoTs4sX5jGr69cM70W88kK/CTvXjEWOjthFMKyu1tkhoK6xG3Yh+eU+QAB1gN+T5v+pqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(10070799003)(366016)(921020)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0N2NHZjcU1DeHhWVURMN1FTUXVkQWN4ZStHNVdUY0l3ZTV4RWl1TUFhRGRy?=
 =?utf-8?B?WkVpUWczamY1Q0tudHNlVmRxTlhRd0JGeFRhZzBsbDFDcGowclF4U0xMdEJ2?=
 =?utf-8?B?bnZXbnJNOHRYTDFDQ25ybGsvVGNNUTZZTExNK25GSElZQ29sMnRKRi8raTN4?=
 =?utf-8?B?Yng5WER2T250L2MvSlJ5OGF5RHVkY0lrZGpORlU2THgxMmtkcEZPekIweG5y?=
 =?utf-8?B?WnVOV0pMVVU2ZS9jdlEzZWF4YzdicG4wRm1nZ3hScit4Y1ZpazkvMndnT3ZB?=
 =?utf-8?B?SVhlM1Y4d21uZ2kzS1l2R3VndkxCZUlyR1JrVjJIMTdnQVlPTUhpTFZOTWF6?=
 =?utf-8?B?MGNMS1kxUnlGOWswNVcxQzRFRXBDL21nb0ZCYWZzaG9ZeVNjYmNzN0tOUUEw?=
 =?utf-8?B?dlQrTFF1Y01XNmlJSXp3U2VpbXFuZUkrSHowUWZRd2RkaDFEMzlRMjhXQ1Fa?=
 =?utf-8?B?WEVLc1M0c2xpVy8zejNKaHZ3dEZRUVNDUTJuV0tTaHNwREZTY0pKUGsveTBz?=
 =?utf-8?B?TmpyTlp0Z3h6QWZCbVowMW9iR1U3bmx5SHNvUi9CYWZLeHpVUWVsZHpPSUtR?=
 =?utf-8?B?aG16c0pYN2N1bWlJTnE5a2x4aGI0Z0wrTXpJNkt3cWR5VHNvelBpbVJrazZ0?=
 =?utf-8?B?cGQwejFveXpjL1luM0pHeXBkNlBSVEFXeEVGWFlxQnVrVkVFVHpBOEkvb0I1?=
 =?utf-8?B?MTVGS1NsUktFbElrWmhuMDRoYU1wRDB2dEIxVUN5Z3ZxUGYvVXczbmFQTi9i?=
 =?utf-8?B?VVFqYUZWaWdHR1hTa3hVbjIyc2hLZGdJdVpBWFRmNldBTVRFK3V3bFpqRVQ1?=
 =?utf-8?B?WXFQcEFiNmJpS2puUUk2VDVKRXBLVmFwUWlvOWtpSENrZHlCeEs1UlZQamVH?=
 =?utf-8?B?dEk2TXVuWS9JZDAwV3JiT3RMS05BT2w3OXpJZndnQUNrdU52VEFIdHZWaXVm?=
 =?utf-8?B?NWYzWlNpVy82QUFTZERBRWVyb0w1RkdvcnhDWVcxWGZRTjdWZjA2KzhKVS9X?=
 =?utf-8?B?WGp2OXB1cTdXdmxXY3RDYzlNdG5QMHdJczl5K1R4VVNiRU4xTmExV2tScWUz?=
 =?utf-8?B?L21UL0liMW5FK2V3Rm1qV0FhOUtlbkZ4VFpUUXdlWHVlNDJ2QmVmSlUwb2JE?=
 =?utf-8?B?MHV3bHBYZWRISGhrK3I2R2luVTZEYzVISEdKZmlOb2l5K05ZU01nUVR2Y3BK?=
 =?utf-8?B?KzJka2xhY3VVTWRNWkx3SDUyTG8rcHhPbDdVZXAxSjBqWnJjS0pFRmJYUk9a?=
 =?utf-8?B?Z0VPT2dyaVFIQWVjd01zamhTektSUnBHeTg1Nm9XQWFjYUhIUFNuOWVuTXRV?=
 =?utf-8?B?d3dUdjM0czN0UEMyYURTQkdrTVVqYmdUbU5nZWJnQnBjejFJYXNSdEs0SmV4?=
 =?utf-8?B?NVoxdjFBTlhqZkd3YUkwQ251ekVIeDFhVTNFaVBxVG9CZXZRZ0xQM3lJSER2?=
 =?utf-8?B?UXVwNEM5OWhzM1ZmOFFESFRkUU5rQ3pIck1sS1Y0Ykg2Tk44Y0JHVFFwYUNi?=
 =?utf-8?B?M1N4MTVmejhuVFdvbGJEMmhoaFdGVWhYVXpoYkxqNi9UNysrRnVKVkVuOWxs?=
 =?utf-8?B?N2hsbU9wSVdhcy9mL1kwTHRxT2pLMURoRVQ4QUsyZHIrTFhURXdYUnBuT1B5?=
 =?utf-8?B?L0NYUjlCTTJyK0lCR3VTMVI0WTdoTFZlb05xUlZ4MVROSVllRVoyUmdTZjA1?=
 =?utf-8?B?RXMybE9CME0zaXVxbEwrQjhCK2lOOWRYMnNQbS9PTnpJZEhsVHBnUGNJOG5q?=
 =?utf-8?B?SklwdlZadk9HaTg0M1NRNklGdE1TdVNzVFM2NWFPVGJZK3paNExUQTZnQVVX?=
 =?utf-8?B?b2NPZ1ZDenVrcXNnbUg1ZGVZcVJ5Rll5b21JK1hIMDNaU1U0bC9LYU51NXVv?=
 =?utf-8?B?cGVJdUFNMEw1YkMzV1pCa0FWdEgva1RNeDc3c3BWeDdqMHl2MVpPYTlsWnFq?=
 =?utf-8?B?S2gwcEtoelRSVmtzenRXK0kxYW95WXBYOXpVek9ScDIzRjc5aklGS2M0YmlK?=
 =?utf-8?B?UEhYVDNiQWFYZ0VuV3hmM0ZPNzhFdVlUN3BxQnhQMEgvVlJNUFZ3SDJySUNm?=
 =?utf-8?B?MUtBQUIzL0FwTng5bXpQY1hsTzg0dnhULy9Bb1RHbXdiSVZ6WVdCZW1LbWZt?=
 =?utf-8?B?Qy8ybXY1NjE1TWw4Nms5eEFtNlRXbmdPTDdra25pOHFEKysyS2JOdCtTYTB2?=
 =?utf-8?B?c0pVcHRETE9EeUlUNG5LZDRsb2VPNGVwWnJqQzFkbGV2RTd1T0loQnN2Y0dL?=
 =?utf-8?B?akE5U0FVUnZTcVh0OUtlakhkY0ZXVEtTNEtBQkIrWWc4dUpaWmRLV0Z5ZEo2?=
 =?utf-8?B?eklLdkx0U3NmcWx5N05VTFFBUDlIRUhvVXN6TE9ZcmZlbm95SnJJZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a233423-61d1-48d6-161f-08def6ccdc35
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:48:06.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pH4ZNnsFcJ/XtTTL1sIJ5JinHkAO/vyzgxar5sGo6P3UPIhCDShwlhYatxzETgXFZSiMKtgLga0BkcNJsDVGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6783

On Mon Aug 10, 2026 at 7:35 AM BST, Ke Sun wrote:
> The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
> `Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
> to print the address of that temporary stack variable rather than the
> actual pointer.
>
> Remove `Pointer` from the macro and provide a manual impl for
> `Adapter<&T>` that passes `self.0` directly.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

I don't think this has changed since last version. Usually you should pick =
up
all tags provided for the previous series, so people know that it has been
reviewed already and don't need to spend more time correlating it with the
previous series.

(No need to resend just with tags picked up though)

Best,
Gary

> ---
>  rust/kernel/fmt.rs | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 73afbc51ba33a..cd7d9664ff5b9 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -43,7 +43,14 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      UpperExp,
>      UpperHex, //
>  };
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Poin=
ter, LowerExp, UpperExp);
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);
> +
> +impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(self.0, f)
> +    }
> +}
> =20
>  /// A copy of [`core::fmt::Display`] that allows us to implement it for =
foreign types.
>  ///



Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456692848BE;
	Mon, 16 Feb 2026 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233423; cv=fail; b=oE7WF6BIDiclEjB8md9nBiBWT/y0Bndw5v/ocIotPRl/kOfQP5a2CxmVRDxIOOC6ZalzaF5Sao3nGL3UQWj6D7rtdKWAmEkHTzfgeSfPjUloU/Bm8I14rjmL2Wg137O8g+Dwqv4vl2tvbtwrvtucGeTM5+ywJD2drz3Z8nf0Fy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233423; c=relaxed/simple;
	bh=5AMWLsQJCFeGCRNM4iYbx/1HIlRpu3BCcA832V84pWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=kpccjfQssQUOOQWsWrPV4ofOsjS0fxcWhwu2xFqIqIc1x4AIkpC1T2k7XDD4hvCPXQ+q5ozx/rK67iVFNClhEA6KaZPuhKAGS6SqAsFu0ZjFkMLhwxQIfUbQf+hlbHEUoZdnO5mrst61l+PN3hXgPFoJwPhvq8S1HVlbNgCF3rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GVrEcigF; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GVrEcigF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6ja+O3j49eUJNz0D7fGeyJrp33Fq3Ok74yUZ9APLT2A49ri449GJFAK+Xcd6d61Mq0Zjylme2nVNKDCO4SBtWREj2IO1f/gnJpHrhnNDtvsQvpn4TNLieuKzvbC2u7A1pwKjB/w2qDbz9jPqfj3h29cyfB1qLRf3sh7dzFPlPjCIvoUHFnBI2Ou6R7E/OCbruxP0r35hRvVZt/Q0BN5BU+mgrkPhkDEQ9c8Azc3johKDYVY6uoAArJ9ZZRubriNqO8nP7EaIi3JhBRTttqDYd7DT2MyoA42BO/vJUh0BtHYUKRoCYQuLZ0L5GPWyL4EY4Yn3vfooEdc5Btsm1IHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq2Q0WId1Az0jPrtQ2i5j+uJzLwfhcZBlaNktPeYB50=;
 b=IRli04KhyWlERXbYNo0TsVm3l6UPTy1zpbfLbzIfZHgj4xeMZM11UASsOcPgb15+o2l9EroYYjOw1VGyAOL2rB1pt+Wvtfv0gPsC6iUIdqFpGfuqypzbGbyx56pSkz8P8+i/aQJvX9ws4CEKojFr6rwDePV/gpGUepSt1+6WcznsBC7Z+1UKgWcYqE3tJ9n7jNN+PYpb4TZT89bEAYgHLhoXmlIuZsEeBbSl01Lfxk4Q8S4iFSKTv+jBJWrjSac7PVyI1bSzEMv7kKHaYJz8mdWxVuGyJyLK9piwTdD3ggXHuITpphK2iFvTk4oGN39UKINPsllmWpOAn4iH0V/Hrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lq2Q0WId1Az0jPrtQ2i5j+uJzLwfhcZBlaNktPeYB50=;
 b=GVrEcigFYtrB3LykvAN+Fpc+0MbawdPcGH4u2K3E2uJ7tSY6LVr9hfhgz9rgbg3pvII0+YTyJG+i8MNWN+n6+3nLXlc0ehNsndDZNlbr5LLOuYPgKoKx8V2GO4HGkFPZ+9Rbcy400/GLcoYcvZvB8GSwGedzfZBhkkaT7crMdtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6166.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:16:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 09:16:57 +0000
Date: Mon, 16 Feb 2026 09:16:56 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Miguel
 Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun
 Feng <boqun@kernel.org>, Yury Norov <yury.norov@gmail.com>, John Hubbard
 <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme
 <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/9] rust: num: make Bounded::get const
In-Reply-To: <aZLb0VcA3oZLfYvr@google.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-4-eec9a4de9e9e@nvidia.com>
 <aZLb0VcA3oZLfYvr@google.com>
Message-ID: <eb9d44c5478df3772e86e904a2b469c6@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: a69510cf-70c6-47a6-8922-08de6d3c226a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7PIxe09IFIIcB0yZbzURaWWI5z9FqOGWAKhErTAXtqPEEsSjlq+GTJJVlf1D?=
 =?us-ascii?Q?vf6BBpTVECheSbKEFn0koI/d3hy+oqg0NBOwj4xtSj4ee8AodRTAlQVeIgml?=
 =?us-ascii?Q?cSlT4YsHsa6U5Mn8CjMV9F0tQAbbR/FltR5BjTjfpBQT24akjsQ/cC7rdwPQ?=
 =?us-ascii?Q?Xiv5HFc/2J4zj5zdzUjJRxLEejjUXTB+aa5ouS74tUsYkW8DGhoCuaEYknaD?=
 =?us-ascii?Q?tP6yIZUMmLmjQ8xjOhlQWUn0zcDB5YuvfvP1xFohdov3MKJ3qpuZ8Wpbgk9g?=
 =?us-ascii?Q?T7xTf4JAMeMpSqkcd7YlQRzx5eDjEnZJrhnVgpvKyxOmoqlvRSJDwLQCZVDR?=
 =?us-ascii?Q?79ySrBEeFe8wXsuJtvXBJ0d0cf0iHBshaocXtCqhvRxlrhaiXHdiD5kkYhQq?=
 =?us-ascii?Q?XZmgAj+fSQ9duXhT6iF7/AJEQcu6SkcQzrxP0aogUNhCaNje/yGgAz47fAOj?=
 =?us-ascii?Q?Oxp1dHJuXrSKX79ze9xaeT3epRebCKW4XwjArzlMF5it9MBkVG5WxtNCds51?=
 =?us-ascii?Q?Ag5L/fVyYZNpC5MCEoyO8OHf9CmbIUt7B5DV4wKYJvo/QKGBoJA8kcbyhP++?=
 =?us-ascii?Q?5uwwvIWx7bojcex9zXmp1bklnOzfYXvHw0zo6ZPWjly5vQvHzgi+WJ0gsBZd?=
 =?us-ascii?Q?JUfCwdK7oJCiIzr/d5VkgBKK6LpTbtCDcY/wmXRML3gQpJebj2S37QdJX3HV?=
 =?us-ascii?Q?bH5nQcEP6ACAaTIL+0XCbR8zsVs0JU9ayXB7y0AkyrKMxz0u2ipj2zOCPrMV?=
 =?us-ascii?Q?yzXMXfV9cANICjIbSYptRl+eGl5vnVNjz6GvO27zDBjPVWzdhFBdWN3l2dFK?=
 =?us-ascii?Q?6no7n9pDt9ryqEYi7Id/CNkuMzsrBtZ0qpFWuQfjWeGTaXL+I2e6mpzxMoKd?=
 =?us-ascii?Q?SAA413GSM7HiA7beNRd7tGGsNVLDTprylvf0O7z/B1fALXGbVRGWU/tz0yJA?=
 =?us-ascii?Q?82WZSucuzCvvX7fZiiPtXjZrRTpqEliHKAtk8pmIGmLV6YgUjBGe1WMH041e?=
 =?us-ascii?Q?wmtRqamb6YUpNGJSCB+kl7+CcQM06cD1OQvPa8dxVggroIvRAskxGuNuuo7j?=
 =?us-ascii?Q?Ld8s1sYOScESAuftesaFSGC3/jlBgYq4xuGBCdGoyQMY5N96zxzQxhw3cyl0?=
 =?us-ascii?Q?LYroVg80fVwJuNNu+sr6ONkXuIpEJGpJsdxLSxu5jCywMyMXNcjkDLWeWxQw?=
 =?us-ascii?Q?vzcSadYr3D/o+U3zKXKj3wR/K+uHCx+B0yv5lnjswN/2TrkKfT3ojgKOHgSK?=
 =?us-ascii?Q?t6ZWJ/usYsAY8NBcN61YiKS5YoVQDaKE14X3GijIafNXtrqLe1k6LvlHE8Ea?=
 =?us-ascii?Q?4mxyee79+89o8c91AwZ2be/JkTMe7OgYEjt7QaKXV+qwfttxVyOtXLuuLkMv?=
 =?us-ascii?Q?SsVsNMqnxFMeOoIGO8ZHeqxCn/xlX9fm17771mHhDP80Q2iKYx+M0DDlbFPH?=
 =?us-ascii?Q?9/q0acAfUaa0KtK6vlMnjKhBruLCsAN+2umitZHS5yQDfRxKQj3cHLGyV6lQ?=
 =?us-ascii?Q?XD8Wi0wO2jNy4OBMfhTOayyGpwG5QKATxlpRsIzSsuwmZ0QNOkbfQlCZkcNh?=
 =?us-ascii?Q?1acKMVo3/gFp7QoR48M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+L0TB4DTsGHz84p65fDP8iHZ+TGtnYIjSKMN393B6JJ836BOlPxVTGxbDcT9?=
 =?us-ascii?Q?9YgCLAxv3ctSPDMwgB60v3LoIEi3qpRhmF4I44yrHrrGHTXE1KHrjYf7a5ox?=
 =?us-ascii?Q?/Vk0s1JaKJAhxx8v8WbNWiLV8snyEJa0pC4ZCRODxsn9voJHrPdkaj0MqIup?=
 =?us-ascii?Q?McreA8ZAVy1XDU2KWZuKD3yALuMKygJj6Rx8JcRCHTQTLIMkzAVSuj31outD?=
 =?us-ascii?Q?4QmvWkXk7JJVMdaJaz3qR5H5Oiu0fV4iGZ1y/FfjdT7Qj0VomgaaSZMxYHZr?=
 =?us-ascii?Q?TAAoxuTbs2cqTAWEt3yYBUZK9HyAmofVhVNg6Il0aKWFB4qtai5O8ot1ZS8/?=
 =?us-ascii?Q?rQ/gx76KdFuy+KcVSbzsxfaEVh+9hwNmXvhLYlnnoR8YxYO8IavGflTVY6AL?=
 =?us-ascii?Q?YokIFxvMzdCRY3vLabHBA24W2cYW81ujmceo8Qb3CG5QJOdggQTgypGC9XhV?=
 =?us-ascii?Q?P6iD5b63O7ed+WUjrpEdk30HAcPKnGPI2VXf437mQVxaRbPMtLWgIC1et1zk?=
 =?us-ascii?Q?StcOZp1XVatXLOgjE+oZhoGqrmEcLMmR9QoDZbZs9SLOvAOHrhI19hGYE1Us?=
 =?us-ascii?Q?Sr7iMbxU8f9AFhxKmIzIJdD00kfbFaKZa1WI/ERIgbpoB45wNHGXTBUbyEsA?=
 =?us-ascii?Q?dYCeWyJZV64p4sCRoP6vgGXKgpqF2HToT+BqL4fI6IBj97UF2NN4P7Vl2czx?=
 =?us-ascii?Q?ulH8Zvhix5aXRMM6Le6jfSsQMGN4R5OXClpcSK+06Ns8iBzr9ZxnyQyrbhub?=
 =?us-ascii?Q?D4OYX14cFuvIZJcWOy9dCq3r/RUFJl02sOUwNKKeAfaJ/cO/3HEk+bZjy+l1?=
 =?us-ascii?Q?Xb+DrQwCLOc96gfsg2QxKG00A/OqxSuNSNrf+XtPm3nMqvjZAzUK7qprO6Y9?=
 =?us-ascii?Q?NyyY95O15DoK8qshYN4cgsjOG9tvIvCccd2dFsrxSL2g5/6XOR/OPi3Gjfp5?=
 =?us-ascii?Q?JX5NU6bqjQJpdy7gnS8DVQ7E4jsCDDSiWcWcmsrRc2qu/LuNHttzwzaOZIIn?=
 =?us-ascii?Q?+IG2/8wZXM40iQnP5UXXuEIvRF7wX6vckAiBT3cgSxP7VyXYuOj+eIh6U8SS?=
 =?us-ascii?Q?0K/xK0X4KS/tStGC4NEOxx3RHO0ZHsCN53Y7cjWDStFCMwHKOu4pDaqOddjz?=
 =?us-ascii?Q?5kq5uUMefZkjPp4sIpGDJI0WjrN5FKU/dmNF4Xovn0HqiDf7CeNlKdkLA+Nx?=
 =?us-ascii?Q?b9rXoKqrzgoTDlUFzx4SWBtOL9bAhYPlAXhR7w++hHEeseRby3Hc3sH5fuwB?=
 =?us-ascii?Q?4WFpufZHPFTq4SgAAw09GMPbLSj/7A4HItH7xFZ5qy1D33GogbSM7yvhT0Wa?=
 =?us-ascii?Q?WwtKbKpuovD/8JrOnLi21+KRwyePW+mwyT7wIU1NcoqC0SgkUHDGGeoFHKFj?=
 =?us-ascii?Q?X19CxUyeaMTsvZ+jxCGm6DE7c9siZ86m47WEirOWPrCtaiFPCoouu90gIHQV?=
 =?us-ascii?Q?TmDkIGEnNGMtH38bQ2AU5yEsP/2nUuyANMthv8k09AJ8MVDc5/N4f2GYuv6M?=
 =?us-ascii?Q?mkcOd7n+U2Z3Y0NP7Pjpfu50iyv9oVBFpfVXnt/0X5eHpkRnpHqVOxJ7apXn?=
 =?us-ascii?Q?wk2T1ml+YmKM+rE6JPXxkSyJCitaJ2e/NumVWhAH+WELNJNFdHRVl9pgNE/D?=
 =?us-ascii?Q?elEmPoezrbgeEGbu5HmHxxdbl6R5qMYk3sfupDwmyGmaONqKb0GvEoKU2CYp?=
 =?us-ascii?Q?7NfBhfNzNpiAZ+x2KeIjH5YNou1VuTVLJVTtteUc2lbMpgfs/9j0Oaaws1YZ?=
 =?us-ascii?Q?kejc1U3POA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a69510cf-70c6-47a6-8922-08de6d3c226a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:16:57.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJasGadtnUt9JhAlAWgmfDmGCAFXY22k8duBjfQi3Zuu9sByb2gxt7Um4RZXXORTVmobOSO2tyPkfGmsQLg72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6166

On 2026-02-16 08:56, Alice Ryhl wrote:
> On Mon, Feb 16, 2026 at 05:04:40PM +0900, Alexandre Courbot wrote:
>> There is a need to access the inner value of a `Bounded` in const
>> context, notably for bitfields and registers. Remove the invariant 
>> check
>> of `Bounded::get`, which allows us to make it const.
>> 
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/num/bounded.rs | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
>> index 8e4c08924d96..b09b93cd0c5c 100644
>> --- a/rust/kernel/num/bounded.rs
>> +++ b/rust/kernel/num/bounded.rs
>> @@ -379,6 +379,9 @@ pub fn from_expr(expr: T) -> Self {
>> 
>>      /// Returns the wrapped value as the backing type.
>>      ///
>> +    /// This is similar to the [`Deref`] implementation, but doesn't 
>> enforce the size invariant of
>> +    /// the [`Bounded`], which might produce slightly less optimal 
>> code.
> 
> The unreachable_unchecked() hint is const, so I see no reason you
> couldn't add the same call in `fn get`.

The issue is that trait impls are not const, so the if condition cannot 
be represented in const yet.

Best,
Gary

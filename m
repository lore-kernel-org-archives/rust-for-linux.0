Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022140.outbound.protection.outlook.com [52.101.101.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE6280CC9
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110727; cv=fail; b=fOdDkHXxzyCGyQdt5gN6RoVZdtctqwemzdG1QgMZBhoLlhmQvlxw4ZE2M2hU6yiNjn6wcPx0sfA8pw9CRLU8O1drwzP82Osv1RlTucoBKUpTiidQ5ppCPtNjzLmFwTfAgW0/LtzFBeLrxMS44PSA1En6z26xcZ936Jkt88aZILk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110727; c=relaxed/simple;
	bh=+OUj6o2CMfMqlshghgSlGC0qonqFlUfpOVKStTcX25c=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=B2ifMDx9XqwkmEiCbqXzNR/zyRfZRVAQtw4KFR+BgNKXhxbZ6RMbulwtLigfdoo+ihIcPK/qWNAd0HQ4iV2e3Zd6Zx5MRwIedAGLnEXdwuKXObEn5CCIOtLcxmQs6ICoX/+hBjDzYW8occiEdQ8YEvqKJE9MoRiWQu2TaUQshg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pZwpV+H3; arc=fail smtp.client-ip=52.101.101.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pZwpV+H3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8n4DIKfZyRDl7cgD7jdUfx86QFnbKm2+Na5dFeHWKo11lkoHKsPM/XN9Fsf8uf41lqpxMs4ca0Oa26VGOcAagqC8HXCXHZStBAvMcsEbhzpWqPInN+Ua4WZwEDwP5kKySXJ5VH6d4QLBiwXebKKoQ8FtpvISZxNVFVQ4aFFIV3AxecB7H5KFf3GVE8pjwtg+zf+P9f163imw4vEcdveRBlFS+F2W0PDfk0XADP4i49rebTKu47LPwHbnppQoQyEWZMnYwvWxzBgTekEGTfitgJSWLzfTJuKBfu9khD0x7xQYVI3//YqHVavzvqg31ntaGcX7QuO7OEFrFAPSA2vfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/VPi2ckGe3haou1z58XklUxXejaN8+AIPiPKeyEP3w=;
 b=qApJGzbotyJP0vASKF9eT5v8lyx02utO4MqmumhSsKQHHFwHH0529iXjhAq8wH05w6JYBjsfvq4jBaHMHZZtOKdwXK+mbJKy0Ud/3f1jVAB0IkB2cnY8e/ma9WcMLImt783rgVaGauPgAFnd+CE2H6/7ccazTVNEoDM7tHcWika+4N97q/7bP5fgeWfRjFP7XhJ8VDHb5vdhiFNcjcNXToxjfY+uSGZ1BB5jbUddrPy/2dY5dgLKdujYQzwCzsdTLSw+NvJh1FXPk16LIO4yLeKFqxAEkkowR8XiQ4cNfWIejwGW07qn8YTv0OvHuAV+BRh+yVE2gYsi+zpOeSWOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/VPi2ckGe3haou1z58XklUxXejaN8+AIPiPKeyEP3w=;
 b=pZwpV+H3ykDuA1Ge/Ofr2g5+1KeMSMbW6uw/lM9a2GspAECmvrb4aflhM9aVmjp5hJDI/ZiT3tUww/pAazixQp++4Bo3/G8IbX08YjfTwv/VdLiRQpbtKYYxP7pM3acwbnBkdwYhziaE4PoBTixNTR1hOV6IBdl4V1BgpQJWPO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB2939.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 19:38:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 19:38:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 19:38:29 +0000
Message-Id: <DFVDEOE3UFRJ.1KJM285XFV7H6@garyguo.net>
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@gmail.com>, "Ke Sun" <sunke@kylinos.cn>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260121050059.2315091-2-sunke@kylinos.cn>
 <20260122085228.2449409-1-sunke@kylinos.cn>
 <CAJ-ks9k63auxfUEBrE+6HAeHrmgwmLZQiwo58MSd8+HSzQ7KQg@mail.gmail.com>
In-Reply-To: <CAJ-ks9k63auxfUEBrE+6HAeHrmgwmLZQiwo58MSd8+HSzQ7KQg@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB2939:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7f4b35-c303-497f-f176-08de59edd243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG9WNlo2YmQ2aGZQM3hqcGlZOElxbm5FMW9JQnpYN3luSklmaDE3UEF4UjVL?=
 =?utf-8?B?U1hFY1ljb0t3ckxRQ2ZrcWdDUys1NXlXRlhnaE1uZUpMaS9ZczJOem95ZzFB?=
 =?utf-8?B?Q2x1aytYbXlaNzVCczNtZEFZV0JsL2IyY3FiRk16aGZwWXdpdWlSeW95RThW?=
 =?utf-8?B?dzhiZmJOUnZzN0d3NDVhQ3lwcWtnMitoeU5tOEJNMVlYblo0dUc3QTRPN05w?=
 =?utf-8?B?bW0zcWNJSEJFbHZwL0Nld29ybW5UcXpLNFVoU0cyQUgxMkNPMG9ZTW5wYjkz?=
 =?utf-8?B?MnBHUHpwMVZzTXo4Tm1DcVJxSmJzQnF4bC91bFFBMm94YXhYQTV0Y0Q2eFQr?=
 =?utf-8?B?bkNNZU9jQmtjZWJWWktmbUVIRHNTVlhPN2tZamVzYXFzeWxTVlpRd2Rwb2Iz?=
 =?utf-8?B?Q0I1Mzhmazd4OWF2d2dBMDJmeTdpTjRHUU45WFpzQ0VUS1BWTGxGZEZJTzhh?=
 =?utf-8?B?NWlhamJDY0s4aEFlMXNLN1Y5RlFCTmlibGRsTnNoMG1mdit5UG00MnZ4emxC?=
 =?utf-8?B?YzViNGdGdlhKekp2d0E1ZExoQzdkNUtpck9LbmRUM21uQ1JKNHBxRGFGd2ZC?=
 =?utf-8?B?b3N6U0hlRlpmSlNPQlRxUkc4WmVGaG1oLzByRHdKMCthbzJVclIrRktuSTZh?=
 =?utf-8?B?NEtUdVMzN3ZFdDZ5MGhlWngrV3BycVN1dmw4Q1ZTMmZuNjRaKzN0Nm42eEZO?=
 =?utf-8?B?bnB5aDFhUGVOMEVIWDdCZmhiVXdVNmhJTFIyeG4yNHkzd0xwbFhhYXVnUGxl?=
 =?utf-8?B?Smd5VTVmNmkxeE9VV2RXUE9kLzB3OG5Mc0VJTzRpK3Z6MkRlSUlDdXVWUkVQ?=
 =?utf-8?B?RjNHQ1VDaVUxRUxrci9uREJtS2ZhOXR2dkx6SGxCeDNDbmszMWxaQ3oydjlH?=
 =?utf-8?B?aTlZMzVNSG9lQjdoRko1RC9DL2srbXFnb3U4dUtqaGNrU1BqakdYb3RaajBj?=
 =?utf-8?B?MTU2eHA3SXIrZ21Jd3FvWG83YWgwOXJoVnhITXpRd3dZWUxmTnhxckxPQmtE?=
 =?utf-8?B?d3diS2xOWXhOQ1V4L0NCRnZYbjl1MlpWMDdaSEU0dU9VY3JDSUNXMllJWk5K?=
 =?utf-8?B?b3plQlFocmdGWFdqczNzcjNpYTMyYjcwUFFDSzlkL1M4bUd4cFlDV2tUNTJB?=
 =?utf-8?B?aEJ6ZElWYTFrZVpRN3JqUWZuNzBtb2RncnFWUjljU3VJeVI1OE5sUDVEbk1Q?=
 =?utf-8?B?QVhVS1hTeE1NQ3FJaHdOalQwMlhBQlZONmh2OW1vMjRuTkNJVVBsWDRUc242?=
 =?utf-8?B?TisyeXpMVy8vYmxWQnVCNVZHK0Y3ZHk1MFpCeTgrR0xveFVHQjRBNmdNaWVE?=
 =?utf-8?B?R043Qkh2ZThpVFF5STVBOUN2a0VFMXNGV2dybDhCV1VKSjZuV1JqaG9XeE5X?=
 =?utf-8?B?MGYzNjYzaE5tM09PUnlON001eEpkc0I5aW96OEgwd3ovTlg1c1lVWW9kZGVG?=
 =?utf-8?B?ZExvbDlHd0NiQTcvZy9NZ2k2cUcxYVVHY20vVVNYYXRKWjdhQTJpNU05UFM4?=
 =?utf-8?B?b0NiaUNKYlRpMUJwTndVdEh6MThMSC82Tm0yd3JmUkhYM0FURmdWai9JYnZU?=
 =?utf-8?B?bG00R1lkem1SV1B2VjhiNWJiQ2pEeWNhRCtBUERma3FqeHRybHNBZlJUMWVM?=
 =?utf-8?B?NkVNL2dudEIxRWxkWkMwSlVMbE9XNThjSmE1OC9Rbk8ydVF2ME96YW5hSjc1?=
 =?utf-8?B?bWoxQmlMV0NBZjhLRmljaTYza2ltanZ6REZORTFPeXBjcWdKTnJsVkJkSC9p?=
 =?utf-8?B?Nm5QQWNFOXNKM3QvTkp2NHdTeVNlVS80L0pINEY2S2ViS09UYi9JYTNkVG5y?=
 =?utf-8?B?Q1ZkeGJjNFp3SGg2MTZpcXB1eFVScUhhTWxEMnlNWEVWWEc1WEIzU3RmVHBK?=
 =?utf-8?B?K0pOaGhXWXNaTzJOTkVtMDVNc3NzSnFSOEJMcHFQQXhRYk1CWDcvSDVjclo1?=
 =?utf-8?B?WGQ2eG1XM0ZTVEgvNmhJWTJ4dXNsYnJzRkhYQVlsOXVBcjFFSE5xOXRCbi9n?=
 =?utf-8?B?NXJNSDZWTjZRbThpdXFQSm9QRDQ2aXRGY0FzM0RkWi9vUjJ4aGl4THE5eTdI?=
 =?utf-8?B?dGM0RUhVdCsxYnZtZnZaTlR1NVQ1aTkzVGt3VytUMVVrRmZNSlhjSERQQzVH?=
 =?utf-8?Q?KBSU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9WQ0hFQWpVVzlBSHc4NkNpQVFrSWVFR0h1TERoU1ZhNDlRKy94bi9sVnh5?=
 =?utf-8?B?dmRvR2V5YXJqcVRMbGR6QWFYYjlmcHgxMzFUUlBHeWlpVmNmOVJvR0Zhb1Nx?=
 =?utf-8?B?VmZwSnZEdkVJU3FrRDhWeTVoN0xmdzZNOHlFYkZQZ04wL0gxTUYvVHI0cWlp?=
 =?utf-8?B?cnBQbmgzNlNmQU5wa0o1bWo3NXJNVEZkOWsraFNabGU5OE04MlVhWFFHSlRG?=
 =?utf-8?B?cmdRcEsxSHpoSFA0NXNweUJwTXRmNlgyM0UxcGl5V01BTHlob2U1SFRFTWNO?=
 =?utf-8?B?aFI1S1NsMWlOcUdJV0RBR1o3YWZPbFEwTFpVRlp6YlZTbHNuYzNuT0FCNkwx?=
 =?utf-8?B?TXA3bXl1OWxSRXNjQnpwSXRaSitEc1FBL05YbFlvS0pzVHNreUVBb1NQVTFP?=
 =?utf-8?B?RExGR2QvKzFwdnFzSG1ucVJaWUhuTE5RRGYrM2t2VFFsMzl6Sy9JT2ZWU0Qw?=
 =?utf-8?B?NkxmdTJwb2dmcW9oRjFYODVsSzV4ZjFjckZQOEN5ZGZPRzIwb1VzcVgvUW9N?=
 =?utf-8?B?TWs4UjNOekovNkQ2ODc3NEhBVmNSYmUxTVJ6d0RxVE9EQ0JYNzZHaUpPS3Q4?=
 =?utf-8?B?YzNQYWtGOTFLVWRUL1N4MFViY3pXY3k3RDJHS2RrM2JNTkdmaFpta01rcDBW?=
 =?utf-8?B?Y2IyL0U4M1hwVFZ3TWhDNzF6TGVxTVlyNURsR3Azb1FkbGdlVVNyZ3NVU0s4?=
 =?utf-8?B?Q2tzMDVrM0N1WEpURWkxWVVFMFpXOUlOTDRIbEt5NmFzQnZOWHF4MkRqa0cw?=
 =?utf-8?B?T2hFVUhXcStKUjBSVVNYY2RXQ1B4eTExb2NpUGNPOGF4R2p0Uko1TURaSzli?=
 =?utf-8?B?K0grSDAyb25UeU45RVMvUG9BQ2NLVEpUUXdVL0FUZlRTOE5zc3FtZzcrVDN1?=
 =?utf-8?B?OUJiVGhwU29kS1FvdUdzM3VoSVUzUkxiZVdTRmk4V2d4azlFRU1wL0xLMlVp?=
 =?utf-8?B?K0MzZzV4L1NpcUJraGhXWEcwSTlZcWxlWVFMR3BpdjV1Tk1DdHFSNldRUEwz?=
 =?utf-8?B?cFU4di9aSXhXVVVTeThScmthN1ZwWXA0UldyYzd5dFpvVmRBZGRHU0NyMExT?=
 =?utf-8?B?TG56ejJ3NUR3VVZObnF3K01CSVpnQmhhMTRvUHl4ZnNGY0ZteGsvNjNiSUlW?=
 =?utf-8?B?ZkZVdXlJbkt6SlcwQjhLREJkSW5LMGJtNU1Wa2M5NWJodExOM3NCbGE3WldS?=
 =?utf-8?B?NHp3cnM2SXhzclhILzFHby9nSnNJMW5ZNTZoV1ZCYW1jb0JmbHlib3U2Y3NE?=
 =?utf-8?B?UGVabUlubzZoQ2R6bUlUSktQSFpzbmVZSDBIMDZ6VGh5azhuZ2pDSXU0d1lN?=
 =?utf-8?B?cFFSSnV5UC9DcmNEQm4wRXlFTm12M25YTlJJVzludkFaV3F1Sno3NTlBeEhs?=
 =?utf-8?B?dEEwNy9taWZoanB2ZWYzaGxFWGY1M3pOMmZoTGxoQ21QRzRsaFVpZExJaUZ3?=
 =?utf-8?B?KzFyK3hrQldPN0ZvYlVleW1WaGwzdzkwTEVLRWlXV1NHWG9NUG5SRFh0bENy?=
 =?utf-8?B?Y0RxbWRLN3JqV29xaEF4eUJpZk1QVmp1cjJSL2MxZXpYSnNEZE9jL0xLZXJv?=
 =?utf-8?B?UGYwVlphdmtJZ2ZnVFNnMERydjFBajdmYWdTSWUrT2tPdERNeUNtSE1LNEtr?=
 =?utf-8?B?QnZtWThxWWR1RzNEMXpPNGhHMTBsdlhwSTdiYTN1QXlCejNCV3pRUVJ0U2Fx?=
 =?utf-8?B?KzRxWW5GUnN0NjJtUERGcjFvaU9FWFBSY21VY1o4MUdCaUJGMjdvc0wzZzlV?=
 =?utf-8?B?OVVCL3J3S210WkFleFVqU2FsaUNpM0kwZDhlTlpVODV6VUIzMlU4dG1jUjB2?=
 =?utf-8?B?dG9USGdjb0hENDUzNWZ6ZGNUTGJWemtIQ2NZSGlLd092NWl1RXlGK0EvNUdz?=
 =?utf-8?B?VFRiTzV0c2QydzdDWVdjL2pJKzc5TDMxOFIvQ2NQMmhMZU56QXVlYTdiTTRh?=
 =?utf-8?B?bTJaZWcxak9XR2lWSlBOeVdjai9vREI0THZHWlROdGlvT0VkNndCZ1E5VDlB?=
 =?utf-8?B?SWZBQnNad1Q2TUI5Rk9KY2dTUlU5Qkg2eXo5RGh5N1ZVa3MxUGVzT0FTam9S?=
 =?utf-8?B?YlR1SDUyY3ZqcDdZWnZidVpPMkR1ZGxtUzhDVkZWL3VqYURiWXNXekJxbzJQ?=
 =?utf-8?B?TDAzRzFzRlB6TXZjVk1DOU5TMDNnZzY5QVlUZ29BaW95NVAvRDdabDJsS0Qr?=
 =?utf-8?B?ZnVZcld6YjBhRS9NME5RMWRISUZaNGtQV2Rxd0pSa1YwOUtMd0hIWmRHUTJO?=
 =?utf-8?B?VTBoMkt0d29VTGJMMGppdUc1YSt4akhpeFIwY1g3b0NncndvdWxNTEgweE5C?=
 =?utf-8?B?ZitRb0d6ZWxBSEs0MU9VMGFHWm85YXhkdWJRdTRxRWNXR0lDcTh0Uk1aSFAv?=
 =?utf-8?Q?PakU4nE7samvHpg7AyD+eD2xzHXIqMHbnY7op?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7f4b35-c303-497f-f176-08de59edd243
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:38:30.3794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reYZi0cZhh7nXhC0pRwP+DgRMQnxx7MZJnEyEF8o/ZSqND4YgWQBtVoGVMeiJRDBwXXnxHYizGOIABK5snicoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2939

On Thu Jan 22, 2026 at 2:51 PM GMT, Tamir Duberstein wrote:
> On Thu, Jan 22, 2026 at 3:52=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>>
>> Add Pointer trait and two pointer wrapper types for safe pointer
>> formatting:
>>
>> - Pointer trait: A copy of core::fmt::Pointer for foreign types.
>>
>> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>>   This is now the default behavior when formatting raw pointers with
>>   "{:p}", preventing kernel memory layout information leakage.
>>
>> - RawPtr: Formats raw address without hashing (corresponds to %px).
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>  rust/kernel/fmt.rs | 142 ++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 140 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>> index 84d634201d90a..5d4d9b72eeb37 100644
>> --- a/rust/kernel/fmt.rs
>> +++ b/rust/kernel/fmt.rs
>> @@ -5,6 +5,7 @@
>>  //! This module is intended to be used in place of `core::fmt` in kerne=
l code.
>>
>>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
>> +use kernel::str::CStrExt;
>>
>>  /// Internal adapter used to route allow implementations of formatting =
traits for foreign types.
>>  ///
>> @@ -27,8 +28,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>      };
>>  }
>>
>> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, U=
pperHex};
>> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Poi=
nter, LowerExp, UpperExp);
>> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
>> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Low=
erExp, UpperExp);
>>
>>  /// A copy of [`core::fmt::Display`] that allows us to implement it for=
 foreign types.
>>  ///
>> @@ -90,3 +91,140 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core:=
:fmt::Display},
>>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueA=
rc<T>: core::fmt::Display},
>>  );
>> +
>> +/// A copy of [`core::fmt::Pointer`] that ensures raw pointers (`*const=
 T`
>> +/// and `*mut T`) are automatically formatted using [`HashedPtr`] inste=
ad
>> +/// of being formatted directly, preventing kernel memory layout
>> +/// information leakage.
>
> The trait, of course, does not ensure anything. The trait, taken
> together with Adapter and the fmt macro, allows us to supply custom
> pointer-printing machinery.
>
>> +///
>> +/// [`fmt!`]: crate::prelude::fmt!
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     bindings,
>> +///     prelude::fmt,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// // SAFETY: no_hash_pointers is a global variable.
>> +/// let no_hash_pointers =3D unsafe { bindings::no_hash_pointers };
>> +///
>> +/// #[cfg(CONFIG_64BIT)]
>> +/// {
>> +///     let ptr_const =3D 0xffffffff12345678 as *const u8;
>> +///     let ptr_mut =3D 0xffffffff12345678 as *mut u8;
>> +///
>> +///     // SAFETY: no_hash_pointers is a global variable.
>> +///     unsafe { bindings::no_hash_pointers =3D false; }
>> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
>> +///     assert_eq!(cstr.to_str()?.starts_with("0x00000000"), true);
>> +///
>> +///     // SAFETY: no_hash_pointers is a global variable.
>> +///     unsafe { bindings::no_hash_pointers =3D true; }
>> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
>> +///     assert_eq!(cstr.to_str()?, "0xffffffff12345678");
>> +/// }
>> +///
>> +/// #[cfg(not(CONFIG_64BIT))]
>> +/// {
>> +///     let ptr_const =3D 0x12345678 as *const u8;
>> +///     let ptr_mut =3D 0x12345678 as *mut u8;
>> +///
>> +///     // SAFETY: no_hash_pointers is a global variable.
>> +///     unsafe { bindings::no_hash_pointers =3D false; }
>> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
>> +///     assert_ne!(cstr.to_str()?, "0x12345678");
>> +///
>> +///     // SAFETY: no_hash_pointers is a global variable.
>> +///     unsafe { bindings::no_hash_pointers =3D true; }
>> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
>> +///     assert_eq!(cstr.to_str()?, "0x12345678");
>> +/// }
>> +///
>> +/// // SAFETY: no_hash_pointers is a global variable.
>> +/// unsafe { bindings::no_hash_pointers =3D no_hash_pointers; }
>> +///
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>
> All this should just be a normal test, in a `mod tests { ... }`.
> Please see Documentation/rust/testing.rst.
>
>> +pub trait Pointer {
>> +    /// Same as [`core::fmt::Pointer::fmt`].
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
>> +}
>> +
>> +impl<T: ?Sized + Pointer> Pointer for &T {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        Pointer::fmt(*self, f)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let Self(t) =3D self;
>> +        Pointer::fmt(t, f)
>> +    }
>> +}
>> +
>> +macro_rules! impl_hashed_pointer {
>> +    ($($ptr_ty:ty),* $(,)?) =3D> {
>> +        $(
>> +            impl<T> Pointer for $ptr_ty {
>> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +                    Pointer::fmt(&HashedPtr(*self), f)
>> +                }
>> +            }
>> +        )*
>> +    };
>> +}
>> +
>> +impl_hashed_pointer!(*const T, *mut T);
>> +
>> +/// A pointer that will be hashed when printed (corresponds to `%p`).
>> +///
>> +/// This is the default behavior for kernel pointers - they are hashed =
to
>> +/// prevent leaking information about the kernel memory layout.
>> +#[derive(Copy, Clone)]
>> +pub struct HashedPtr<T>(pub *const T);
>> +
>> +impl<T> Pointer for HashedPtr<T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let ptr =3D self.0;
>> +        // The default width for %p is 2 * sizeof(ptr) (see lib/vsprint=
f.c:
>> +        // pointer_string() and ptr_to_id()), which is 16 characters on
>> +        // 64-bit systems. With the "0x" prefix and null terminator, th=
is
>> +        // is at most 19 characters. 32 bytes is sufficient for all poi=
nter
>> +        // formats including hash values.
>> +        let mut buf =3D [0u8; 32];
>> +
>> +        // SAFETY: scnprintf never writes more than size-1 characters, =
so
>> +        // len is at most buf.len() - 1.
>> +        // The "%p" format produces a fixed pointer format: "0x..." (e.=
g.,
>> +        // "0x00000000b231c2e6").
>> +        let len =3D
>> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c=
"0x%p".as_char_ptr(), ptr) };
>> +        // SAFETY: scnprintf with "%p" format always produces valid ASC=
II
>> +        // output, which can be directly converted to UTF-8.
>> +        let formatted =3D unsafe { core::str::from_utf8_unchecked(&buf[=
..len as usize]) };
>> +
>> +        // Use pad() to respect width and alignment. Padding with expli=
cit
>> +        // characters (e.g., {:0>16p}) is supported, but zero-padding
>> +        // shorthand (e.g., {:016p}) is not.
>
> What does it mean that zero-padding is not supported? Would this
> comment make more sense in a test that demonstrates the deficiency?
>
>> +        f.pad(formatted)
>> +    }
>> +}
>> +
>> +/// A wrapper that formats any type implementing [`core::fmt::Pointer`]=
 as its
>> +/// raw address without hashing (corresponds to `%px`).
>> +///
>> +/// **Warning**: This exposes the real kernel address and should only b=
e
>> +/// used for debugging purposes.
>> +#[derive(Copy, Clone)]
>> +pub struct RawPtr<T>(pub T);
>> +
>> +impl<T: core::fmt::Pointer> Pointer for RawPtr<T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        // Directly format the raw address - no hashing or restriction.
>> +        // This corresponds to %px behavior.
>> +        core::fmt::Pointer::fmt(&self.0, f)
>> +    }
>> +}
>> --
>> 2.43.0
>>
>
> Thinking about the API a bit: do HashedPtr and RawPtr need to be pub?
> We could have an extension trait to provide a method on raw pointers
> that returns `impl Pointer` for the case where raw printing is
> required.

I think having the types as `pub` is fine. Having extension trait is fine b=
ut I
don't see what we gain by hiding these types.

Best,
Gary

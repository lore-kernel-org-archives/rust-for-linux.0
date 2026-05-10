Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020142.outbound.protection.outlook.com [52.101.196.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EDF175A68;
	Sun, 10 May 2026 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778450786; cv=fail; b=smy6bx2loB0xc7UBCV56aJQqBZYcWy/3lrOqBJw0nktazAi1att4tyv+sh9IkcqitPqwgBikLWaw1osR4eA91PA29n+KUDRSzcZU3FZP8+RUUnyqLYh4rDMYi4xv0RyYfeGfQ9txcKvF2k48kk9Rff3UhKkmPWRxI1jIMC1vvAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778450786; c=relaxed/simple;
	bh=pkqpxNBdTd2i296HkWdHjjgVSGHisOCrsdbV2rs9Ask=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GkY6H6ideQ4mTwovdiJCRDEzlOHQvdhzHi3w5Ooc+3+w3dpiwlgwA+5/Ip1MCPLYnCA7H8PS4nPKW9POPoKuG2PiKYcR2SzHeGhArqrgrCrFRX+kfRPlVkxCaoGZa8EUuvpUfvnbDI03CR3YqCs76Klh6h0Y8ESgrvH7lO4Z+rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dT4QGMXl; arc=fail smtp.client-ip=52.101.196.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dT4QGMXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0b5GjQAO+MhoqMddBdfQl27tekH8IvfB8rUUsn0nfuQ2zdxTmTXyPTZihphQq7I5UNk6MQ7txrxL/CvJiV682tkYZVRw//2fImLD7nFLSgIrbawqztN+6tESKSq3G+juHBHzt38UhCsXsm5+GSd0uSXlMboC8KFAOY//HfUdjETbwWERhyaoGiWF1iMSf3WFmTzOO6POXH3BkezfrB8XehRpTvjXGsTVuB2+O4XKCUnkuDmyJLXTfQGrssvrWv9s+tFtC4+1cs1e37nsra/9f8Jf7xnY5STo3MrtLmm3EGkputekanmUcPNijfIao81EHgKbbJNY9MENSRYdXT/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkqpxNBdTd2i296HkWdHjjgVSGHisOCrsdbV2rs9Ask=;
 b=STfi3VcuslqKt+8MKCbpzTl1AmayqtvQwmdT4s3G973LlPfJ/inly+OS6a4a934bDSkfPMoJdpL5dMRhZom3JOaUyDNLIjiu+OMhVLCW2cGEykXeubmmRgNTCl+ft7JSN1ldaz7xuJrUo5dvIHm1+IpNFugc/kc12n9VvlirAp1+IqwkZn/OoWbnN8vGd6n65/Z9uIUJU5VBAvEdn2V+RpLpi3HTCn2uiY6N57T2k0qELteE29lJCY6BwmFGH8WFWgHWSD0gwBSImMWOcoatqhrQVAAD4KKK/yAF8VEPDXnSIWjweWPtwt9VO6MI5obZ2kqFWNQ/i5ilQ3vD2GqmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqpxNBdTd2i296HkWdHjjgVSGHisOCrsdbV2rs9Ask=;
 b=dT4QGMXldmQmaPJCW0P57MsG31Dy3kNA9u+BrPVwN5qi/bF0PAvluulR1Ws3uvkmljPcxipX2+zR82n6NT9gzjjURuzuOEKBnjzkT6+PuiYbw/Rf4IG4s+iRKird4M3I5XQC8KWM5bTT5DVd31Ra6qINmqrz1C1bHoxT7TWkmto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 22:06:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.021; Sun, 10 May 2026
 22:06:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 May 2026 23:06:22 +0100
Message-Id: <DIFC6QH65R69.378YZH6JZI7WX@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: examples: fix
 `useless_borrows_in_formatting` clippy warning
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260505115138.2466966-1-gary@kernel.org>
In-Reply-To: <20260505115138.2466966-1-gary@kernel.org>
X-ClientProxiedBy: LO4P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 4375aebd-cc9f-42e5-b8c5-08deaee05f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ori6HBsIy/tBCX9hheBvBkuE75ilsmD91rzt84cwjUF3oujMT28PnMJsLkt11QtmbGzDlCzFgmq/6hYgIWCoNJsgQGk79RUuL2AXxCg/jG9yutdxa1NWuAfIj+LB87vrcPXfEJWBYS+PqmbYg+RztAdjNMFnccMqUo0ehBNWNOVC9RyqeBvxIMz7+GJ3Uq+F+0f47ZZrZprVw1MQIz5+E0GD3MKHsazTGd7YhfRczA5aru2Xw9kBIKmYa08WwMDkVM5yRshli8fV9dzW+fPnjiJ98GsKzsNTyHiLYWyOWwN9DYrTwG8gQRY30g0AoyDsjuMDP5faMI1ErnHl8ydIrfOtd8spwKfPVy02MF8lYEm9RmEjUt8ADLLJktGOATROVKDpqoUl9gsv8n/NwYVM+Xs3akujKGC3El+8JA17OAYwPnl3NaBDl/hbj8Z8Eu5dMauQMmr+gzechYtaJefl5CoJO0XTEsztEytrM59nH8Ky6Fy3KU+p4eNWjhT4vBK2+yBokVCh3sB/2kqs09THHCLW7xQ5L8iANlIwpW1igHvk80S3r8YqWC6U/ywy7w6qf+Ynx9fKEGfLrEk9lPwoYiKBEYLxWMCey9bZk9xELXZdxZUXNsS3y9vp6i31yj17g+WqSq0aCjhH3hDt8ZHhy4cW0B6RsSWKMJTDOe+vZ4S0aTpNlGYjooTmrQ93EoBR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJIZ2o1N1I1ZUZVUkt5Tmo4VVQ2OGJSZmFZNGc2YW9YYkpNT1dnQ0x4a09z?=
 =?utf-8?B?ODRxWkc2aGdueGEwK1lsT0s3S2YvYzdtdVphaEJWRXVjbTRta2phemlaS0xk?=
 =?utf-8?B?aExUR203NGVNUm1jZGdKQnh1QkJWVVhzd0ZGVC9ESk0xaytaalZTLzJHYnBJ?=
 =?utf-8?B?OURuS3dRUE85ekZjR015SGlNYTlJeHo2djJra0wxbERoQzJHYnlSakl4NEl2?=
 =?utf-8?B?MSs4MUorUXpNRnIzQm1COGZJOEhaSUVtb3djdWNMamMwSTFPZFhZdEhWLy90?=
 =?utf-8?B?dzBEaHpBK0ZwWFBWd0lCdUx4ZkwvbmNmMHVVSE81aVcvZ2JOTlRlMXpvSDNt?=
 =?utf-8?B?UUtPczFRNk9VeDZGYTFFQkEyUGxySGM0Q2FwZVVwelBZQSswdC9Vb0FySEZZ?=
 =?utf-8?B?Z0UzYnpRS3VTekkwQXFqV3ZWVTV6bnlGblNPckJVZG5lTEVjb0hsYm1pZ2Q0?=
 =?utf-8?B?MUxCdDNjUEE5RWJSdFNSZGZOeHJ2SW9oeVZEUmxDaXdUZGgzSW5vT1ZtNHVX?=
 =?utf-8?B?SWwxc2lQUkJTeGRQTnJ1RTFIQWlyNllZUFRxSi9RaVM5K0pZV2pCYS9DYTI2?=
 =?utf-8?B?b2FRbERDVzBPc3kwT294cDZZLzM2bUFKWVhrMjdoaVVTMXlBbzNoR2tjTllD?=
 =?utf-8?B?WWVCQjNJQnAzUmhQK3c1Vkd1clY1dmZQQnlCTytwOHB1YTJKQWlMMjYxbHNx?=
 =?utf-8?B?QUphc1E4c0lMTGZ4UUZnQkNCcytIdXFETkN5dUZzeHVMaDRYeE1aYmVFNUd0?=
 =?utf-8?B?ZjdGaVdQUVBtTHdENk0ycTdCNTFVb2JvZkJSbGRrRUwwMzdsc05nSG1tR1ZI?=
 =?utf-8?B?RC95TE1SOHRISlhJNlR1YVhBT3JFUEs1UTFSLzRleE5QUURGZ3dKWUNOUUhH?=
 =?utf-8?B?Qk5menNMY285aGFNSGtxMFBibi9Ea1doWkh2dVM4QVB3WDhkbUZpZEhmKzFv?=
 =?utf-8?B?QzN5SGJRZEVGS1k1dmVZaVBWSU01dSt1MkkxZ1pGcSttWTRQQlhUdmswVVhC?=
 =?utf-8?B?T3N6T3FqUXZobmwvQ2I1d2NEQVpBU2UwWUlOWWFSMDdhZURDZi9Cd0Y0eUhE?=
 =?utf-8?B?NEVNNmhTbU10aUJSMUFQRjE1dEV6SGNsVitzTTdGZUVFTG1DRStzSlIwTmt6?=
 =?utf-8?B?RmpiUFl6VjV4TGVSWXR5QTVlQzJLZnY2Y24xbjI5WGNJOWZZTFllWTE4UURN?=
 =?utf-8?B?V0FKaEtSbGxyTEFkSnlZd0JyL0VBem1naklSd29RdEtGbXJUSHVZWGVWNDBW?=
 =?utf-8?B?ZVIvZnNQM3lleDhzYURhc1JsVUQyMXo3bU5WbUMzUUdjcjNsTTlqcjl6clVx?=
 =?utf-8?B?cURhb2ZXZ0s0WE9sWG9lMHY0MS91d3VxZnZ5aVJ4bFE2QyswVHdwV1o5dGlB?=
 =?utf-8?B?ZWxlTW9JNGR2Vklhd21MY3pPV2V5WXpTakJQUWdhOTJkell4UUlBMFlNL2ha?=
 =?utf-8?B?VGNCK29VZjV3ZXYwMHhodW4vc1VPZ2g2RjhibVZWd1FCQ201K29KS1JRZ3pj?=
 =?utf-8?B?YzV2R0pMcjI1OEJwUTBzdlN5QXdKdEYvRTZ1dm80QTM1NXhZRExVQURWM3Zk?=
 =?utf-8?B?S2VzTGJyQTBXeEYvMG0zMXhTT2lJTk0rRkF2VVFKR0FGZGlqeWJ2ajduY0pv?=
 =?utf-8?B?YU9qSmJPUDVyOVVBYTZVWHg5bXIyNHNDdXZ5N3dvK0Yxalo0OEF4TzhmbHBp?=
 =?utf-8?B?RHlpNExiM0YwUW1qY3dwc2JwN0N6V0VDaHpzQTV4SHVUQWFlS3J0M3FiRklG?=
 =?utf-8?B?eCtGbzMwWGU4ZTZSY3NkYldRVWdjd2JSRkZSejN0bHdBRm4yRGw2amJXR21C?=
 =?utf-8?B?ZmhPZGdFWDdxQXdXS2J5NTBzRTJPZ1R6TFk2VHg0aVZKU2ZhTzVSMnRiWjVi?=
 =?utf-8?B?UWxOenp5VEJzRFBiZk1nSVd5UklGcXoyaWZDcExXNVkyUEU2Y3JHcFRmZTVG?=
 =?utf-8?B?blo5OGw3UmdLZGRUUkY1b3dvSWw3cytzcDFXY1Q1N2lzL3FBNVduQ2g4VkRY?=
 =?utf-8?B?SVNKN2RDNkdyeWlQTW56N1hYRXg0VVIrclFSTDJSa3l4ZSt3ZUd1SXFEVEh2?=
 =?utf-8?B?VWcvQ0JrUENWaXBhSElpN0hSUTBXbjdjMVBsNFM4TkZndkFiZ0ZjVVdQZFpM?=
 =?utf-8?B?Y3h4MVVadU9IM1QwODk1UTJXQUJvR1A3Rm1QOG1WNTJpVG5MeDJNZityMG5y?=
 =?utf-8?B?R28yVnBVR0FqdGs2eDB4a3lYZlFMSFJDUnZBQnY0QXVDY2ZTZzdKV3MzSWpK?=
 =?utf-8?B?S0pSc0VveVFaZHFKS0tRTFY2YmFXWmpLaGpLZXFPL2pzUk1ZajBFT2JWVEFO?=
 =?utf-8?B?TGF2YkJyTXZRVEI0cFErU0VQRkhqdHY4QUNRSW91aEF5clNxUHdwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4375aebd-cc9f-42e5-b8c5-08deaee05f3f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 22:06:22.7725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4S9WyXfOS+/CIf2ePQxfayiQEKNl7l+ZRFl/qNrXk3bTBlEkTYJxWxN6X6RIVOd9oGk6JnwbMiUBjCoJo6KoKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7410

On Tue May 5, 2026 at 12:51 PM BST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Clippy 1.97 introduces new `useless_borrows_in_formatting` warning which
> fires on the examples as we have `&*expr` where the format macro takes
> reference already. Remove the extra borrow.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to pin-init-next.

Best,
Gary

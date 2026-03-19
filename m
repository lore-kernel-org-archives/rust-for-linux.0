Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020140.outbound.protection.outlook.com [52.101.195.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A426AF4;
	Thu, 19 Mar 2026 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918472; cv=fail; b=ZtqF+lJIcRDb5XbzaRMg6IwZXAQ4NN4xoBedrx8McXYn1L2t2k4amSg8c9bOt/FMGisenv06bRxxJDa+br24DeNfmpxAHeUvHmrC396Ygz7hxtPK2dK3KPx6xSCgf74ZNCL5sy9SXxkztzSytEbHOJFHFsKyvY+lD8WF/DLTRUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918472; c=relaxed/simple;
	bh=QSXRbwHSVF8yrSMjfLbol9QnOVfytq1b59JdqC+IBXA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ZqD8b4CqMRrknSwKKKoodwj6JUNsZoPv2hGfoRSElU94TbC1xq31sZGk/77ftOfWp7woGSJQ12GKb8OrFf0ElQQRvCUi0FMzodJTzVRQtC2fe0ZhmlOughuVr01U2bpZVV0+2Azvc7jKz5eSId+fbHzljaYDESIzQR9Z65VWfMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GWWKy+rb; arc=fail smtp.client-ip=52.101.195.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GWWKy+rb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCUn0t481arBcU22KwE+GKN3urd41q7rld8JjwKEAz2kCYkL2O991J3rDFh26uh2LvSoVTIKroWrlr46uUGJ3gwiKHL7oVbBRe3whYphiWJQ0HnlA/aOy2IdYkOMJGLEYwMwJPmPJ0EmoXTM4xrCLw5NGtvRDt97Qe0n1zjpFCcpyFjQ0Zy/D8eK4oyyq9trS+Yvi41KZ9CtdoKlQ1JMK+8hq0R5LZXdhzjZ2zlV97RNoASoaWksuO+wYY1jy9rE4cWyT+OFZkQ9O63GpJIbePjP/55YB5zz+38EVqTzUHfsH3mJi62bQgEQEjTPC4kSFVpYttEyuyRYy7eYrTKC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZibgqyNc+RvkGl9QVyRpdSVpGHkS6fe1cPzvxnxn1V4=;
 b=MEnT8ZDayvYkuhax+hgWGYneRiqpdJ1bxcI1P0J8Ns0awQSQY7U3uRkQW1DKhR1BMQEYErUSYUULnvT1fYl4dcYdBxTt7bVJW60JvQKEWk97nlMUMVjaKjP8KH+DnEWDEQh9DFDkV3f//HQtAocDnx//XCDVVVvXAhAKVWvlUHJtvQmne5+46iwCA43GnjMlK5OFXE3/7qJDMNxIG70yl+qE42f8dwHFW+yR5KX07Qh7TO+svzPfJn9x6uFaECL+Gbawk9uYrH6pCJeOJJkNVTM71c754uLAgiRL68aZMYzcJn3YUkUvA5wlKiFBG7IKxFL/6DDL52IsonJP3MysUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZibgqyNc+RvkGl9QVyRpdSVpGHkS6fe1cPzvxnxn1V4=;
 b=GWWKy+rbIi9sbaYetpRSChxBbPw57UfXQomtHWW/vW7HyL/J5RceeKY/1CWGJ1wdaYwEbVy2bVOC9M8agW32cE5/TdCM2BZOs+UibCe+g4sFC8V1zDWEiY/mSz/zuPrkKNNP0A3l45f/I0HOgKHqVDLfIOwzFRUvnN95nyjJXZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2516.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 11:07:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:07:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:07:46 +0000
Message-Id: <DH6PM5GUHQQE.1D6WUKBV0GSHU@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Antonio Hickey" <contact@antoniohickey.com>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Oleksandr Babak" <alexanderbabak@proton.me>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] rust: pin-init: replace `addr_of_mut!` with `&raw
 mut`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260319093542.3756606-1-lossin@kernel.org>
 <20260319093542.3756606-6-lossin@kernel.org>
In-Reply-To: <20260319093542.3756606-6-lossin@kernel.org>
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2516:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac58766-8fa1-4673-38ae-08de85a7c0c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sGgV/2GElVRhyo1vrN2QDM/15VLcsmGWHc4BNq4XKobO/5751DIyzk3vqj65PgjSbwrbvw4EbV7uGSNpYbtLv8s5lGVMJbZHZbUIy3uJZBRt1rZ0LCxCNgy9Mw88MG63ZzCN9oDptk87PSWGemcEoPNXX/1hW8awlfMx9U0VKpIMxYpY/c3wRZJVyfSVNoeuhxjmQVknUHjDP2wW8AuBzN9dLbzvdGRrW0kQr3/J/grni13dN7WXvR4D4IBL9ezsbINEHhiAe7GN19vCa1JF4dVpsHWMlj25gkfJ6wvn8StQRXz6DnN2WCvIIKQ22lHZM57ci3j/LmoWskjvrHHoUAaxv7yHW3VYEKAUTds5A4HqBxy9TzXlgOJ/KYfNeusIKeZJxFfCOWzWqfU2Ly7edEyrjaU4xHrsGVXByLxgmE7oRygDffWfrRdXi0+BjhmlrbEYFKINrVX28iVAiVra6Z1y5OzwZiYm2k6COv49R5CVwkNF/bFvQLmE/H9W4WvRdbbzwsKwM8RXzg6j4/ACk9cllAbWWTDbVGL9R/xz0vkC2uO2/jYQMmMzEktbG0dVLS0gh6kHx0Ux9z/LNt9Y5CAAzEBHeNKTp/arOTUomEsHhSkFOmKzjeYbAMzsuMlYl5GD1le3VqdbQHsarMig/bVe10NusAr/B7NR1GUWF47q7ixy4spEQnSvfGq98izcyGRSUMKkEtq205eteR7Azsa+f7OVhSDJrT6lHBxww4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXQ0dDAvU2ZmNHIrSXJzdUpWMkZzUzN3bmR4RVoxaG9kVFpoTENrTVFXSmpR?=
 =?utf-8?B?NVBoVUlTMnBJOGVvSWo5NXRvTzFQcFMrVzJwTWprZFlYU1BZTWNnMkt6QTRm?=
 =?utf-8?B?R0IvcC9JQWNZOWwybjNQR0tJUHIxWEdTWXJFUzBONHdqMVNsSHlJOGRHa2E2?=
 =?utf-8?B?aXU1Sm1PQzZFMGJNcmZpbVpnWTFJVTMwNi9Rc0ZldGRWKzZKb1hhN1NMVU1L?=
 =?utf-8?B?czkrSitucGhNWkdFRE1tQWdsbDdYSlNMNG5ZT2FwbDhiZUhkSTMxUEFxWkpW?=
 =?utf-8?B?dllycGlkR2RVcVppVFFBNFB4Nm1xRU1hVE5YMHRPMzN3Y1dzVi80RDN4cVdC?=
 =?utf-8?B?TncreEtTaHpKVkpoY0dKSmNtTWZWcHlyK1JsdGIydlY1SVpVejBSTTdZOWFN?=
 =?utf-8?B?L3IvWVNhV1h4NlN6ektTTjVmWnZjUURGcmlBMWwzZ3dxQVE5akVLd2pSdDRF?=
 =?utf-8?B?WkxBSGpXNVVQS0pZOVdOZXlxbkw4SzJETmMvUitMWW9pV1B1SlhNblRjVDIy?=
 =?utf-8?B?QWhVNzlyMkNIYUd6T290SFdaOUdaRFd1NUNRWVRLNFIrNDNFeEpuOHQxQTZi?=
 =?utf-8?B?R3U0Q3ByeFZNTlFrVjFNMlZxNnMyalB3ZVNtV0hXZ0xBb3V2YVQydFh5SEVF?=
 =?utf-8?B?UEkyQTBXYm1hWldUQTVSRXlGNVlGazh1YWhaSGtzNis3OEFmTWRoaXg1MjFR?=
 =?utf-8?B?RFdrWWEyVGlRb1dYTnRXMnZWTGh0Q1pub0RyT3ZjQWI1UkQxSTRkb1NDYUdq?=
 =?utf-8?B?QjhZem94Y3JQWEFWOTFnNlZtRlJOa2JjZ0Z2cVVLVDdBVjl2ckhsNjZ2MWto?=
 =?utf-8?B?QUwxdXVSazY0SnN5RVNFVlQ0WDNJU0pPVDdqVWtYVndNQUsyWlgxQzJNZGZq?=
 =?utf-8?B?NTR4eTVJN1N4RGd6Q240Nmc3YmE1c0QxUVQwa3VFdkgyckpZQzFjVWwvSWx2?=
 =?utf-8?B?ZFJaOGdwdFFhMEZhWVlGQ1N3MXk0VXRCc0gycHVVdXhFcThsTnhQeEZ3cFls?=
 =?utf-8?B?eDdHSi95TUFSdk9wZEhveUczQSttUHRtdkxOVU4rMGxCL3EyS3J2V00yeGpq?=
 =?utf-8?B?Rk95b3BMR1RrZm5jTUV2NUZCaDZlWkZpeFNJVjdwU2Q2L3lCajh1WUdFakRy?=
 =?utf-8?B?ZXM0SkVrV05obndqYVdTT1lydEVLQkdxR0dqa1F2STZJeE82bnYrK3VBclRl?=
 =?utf-8?B?amFMMGxzZXcxeGFldkFyMjBzSXB5Y2VheVNFZDMxWGdicytyNDhLNDlKdTEx?=
 =?utf-8?B?Q0t4YkZzbVpVa2w1LzFaeG5URkd3NElKTmpxNjFxWHkySHhWUklZNHRPRmdh?=
 =?utf-8?B?WkhqTEZUQXV4ZFh0MWI4aGxwczRGMjVKU0t0OWFEWllQeUducGh2YnU2MmYw?=
 =?utf-8?B?N0I5c3F2VWJMbEYzLzFUdmxTeVlHeDg3UDJaR2lMTElhNXlCbVJGUmhQZVkv?=
 =?utf-8?B?cG8xbVowWWlSSlcwV2N0Q0ZGN2hOQnNENUl3Zy9ydGZSVjF3QzhRYStvRngw?=
 =?utf-8?B?OU92cUNrM0I0Zk9vWEdZdVpxNHJTNDRxbWt2KzBpZjZHdERpRzVsU3pNMFo0?=
 =?utf-8?B?R1A5NFRZUENhL09PLzJQT1liQ2U0NjhMdkY0SDBOTTh2RE4vVCtRdms4L3Uy?=
 =?utf-8?B?N2NZUWhMZ253bWtKUGRMYWpneWQvekNaR3p3Sm1JUG94clhXVFQyVFM1eTd5?=
 =?utf-8?B?Q1JYbzRSekxTLzVwTVk1QlFXdkZIbjNZUklubk9rSUNnYXovVEZXdkVnZUVU?=
 =?utf-8?B?amRzY2RwSnZldzBHaXJTZGNGQmZSMFJkUVBOOHh6ZHk5ZDVUNHpDVUtJeTJ5?=
 =?utf-8?B?V2JwWDlodTNzTTVNZjgvMW9MVk5YMFJTZTVPSFYwKzFBYWNzUHE3UDFpdzBK?=
 =?utf-8?B?QkptN1dkM00wSEhDY3FaRWU3T3h4bFF2eW1rVk45Z0c0RisrNzg1Y3h0T0Yv?=
 =?utf-8?B?M1dOUnhYdkJuOHdCNjhTT0FNSjNORTdYZ0xVb2g4aWNITVVPRHFtR1RRMUFG?=
 =?utf-8?B?bm9seHNEYStsUTFndG5MUmtSSUlDa3lnKzUwS2M3YUUwMmxUczRma29ONU1W?=
 =?utf-8?B?U1FCaGMzcEJGbmJnSk14eTRRdnp5MzhDamk3a0poMVJCT20xZy9tRXNoQXpK?=
 =?utf-8?B?b0J5SUdiRk5yL0tmRkx6Q09SUlFsUWQxUHFWL1U2akZ4c3hQVFprYlU4eHVM?=
 =?utf-8?B?cjJ1ZTBDOUhUZE95WkdRbE5RK1VFQUVXME5GTk10SDlpVjd4a096M0RaMmdR?=
 =?utf-8?B?bXU2T1RhWWJsWTlvdXVyY1BCTXF3U3U1Z3JoOTNJbmg3Nk9xWk5YT3hxTmlC?=
 =?utf-8?B?YkJCR2VDMzcwRnY3MkNOUjY2UUN6dlV2ZGl6Tmd6MW41cUpVSHVlZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac58766-8fa1-4673-38ae-08de85a7c0c4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:07:47.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8csa347B9STfvHQr7E50RQZIvsE5/71s7081WwDfW/y1XhpNUZPvhqZjouSeNUKAs2KG1yHcFj3urWsJdI0lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2516

On Thu Mar 19, 2026 at 9:35 AM GMT, Benno Lossin wrote:
> From: Antonio Hickey <contact@antoniohickey.com>
>=20
> `feature(raw_ref_op)` became stable in Rust 1.82.0 which is the current
> MSRV of pin-init with no default features. Earlier Rust versions will
> now need to enable `raw_ref_op` to continue to work with pin-init.
>=20
> This reduces visual complexity and improves consistency with existing
> reference syntax.
>=20
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Closes: https://github.com/Rust-for-Linux/pin-init/issues/99
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> Link: https://github.com/Rust-for-Linux/pin-init/commit/e27763004e2f6616b=
089437fbe9b3719cd72bd5c
> [ Reworded commit message. - Benno ]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

This version looks okay to me. Why is the linked upstream version adding
RUSTC_RAW_REF_OP_IS_STABLE cfg?

Best,
Gary

> ---
>  rust/pin-init/README.md                       | 3 +--
>  rust/pin-init/examples/big_struct_in_place.rs | 1 +
>  rust/pin-init/examples/linked_list.rs         | 1 +
>  rust/pin-init/examples/mutex.rs               | 1 +
>  rust/pin-init/examples/pthread_mutex.rs       | 1 +
>  rust/pin-init/examples/static_init.rs         | 1 +
>  rust/pin-init/internal/src/init.rs            | 8 ++++----
>  rust/pin-init/src/lib.rs                      | 8 ++++----
>  8 files changed, 14 insertions(+), 10 deletions(-)


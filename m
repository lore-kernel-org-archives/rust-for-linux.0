Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021121.outbound.protection.outlook.com [52.101.95.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10326A08F;
	Sat, 14 Feb 2026 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771061657; cv=fail; b=NnYeDM+RwJThdXmbCStgVVrCJ0HkuPOruHYooNxPymRwKcm9aDRWgE272QV6KO535/+6hEes/VQQf2U02JOT1nH8lRevgAaFybKT/0hNCd/FIZiHphnkX/PjBHf1Xp9fxJbUAH0mDwH/+6HEclhVjFI4XdUTUS2I3kcXMMjPbL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771061657; c=relaxed/simple;
	bh=aL1lVNoMgcge6JU7cDtpLmcjm61J7QUoExfwSSl2o+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=lqQnzdlY7BhrvGurh2GkQK+A8535fULq9zzZY/gobB6N87yPz+UV4mv9oI93lxJ7acu0OiE/Kw78yqi3u2lRgSOWo/rnVWY/rDh0C+knlZ2xaNq0znoV46Gm05yt85BjBaRS2jW3lc4Vu3JeXi1WuVJsdJPE4dh/655tGi46fGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FSEv+Uaf; arc=fail smtp.client-ip=52.101.95.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FSEv+Uaf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szaq4cwqHPrrRBIK4u7jJ2dcKLXVJJOLRzcMipvB6o7U83oJ0VI8m7udXW4/9v2tNT6HDT4xTlahCmTWXSmTxfpshC+8n4Qezr36oUqDV5mi6V2zIwqFSLshTMR2dLrFLNiiFwIaTF6kjnxehY6yvOlORju1r2aBxF7kDHTOAXl+ChJpXPg61XGYKXbV63JZGgmOB/JrRzH+5lu7rgV0yKwCpquxrUkZMByr38GdJ9/LNAgHgW9okEVDudR5s6ydXiAM3PoXIsuOfxg103I7GfcCO33n8lV5lpT8m7qhLTGa8FaCBxDHWROneJcCOUmHUJ2Qd9L6w+tdBlDwJDsPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkONOhuYfgviykzFX94Y3qExOj6gkRjAWu0Ft1PWupw=;
 b=tYLED2OfF26uDP9f0eHvNj8DOdEHv7O4oqaiA1peShSR8nj0thfV9btsSmdskiY2H+w28V0v2g9ntzIPtARFB0fPAGdjQShsMF4fMmQSrihtlxQEX97CzEMNKtrgyIOHHBrMM0T+CLctfX2J1ApSggyEUNPfyVVvGVnyGbjich5UbUQjkPUqyBoSKAM95QaRsEwcSE2ks+dbTy6oKK+KX+tUtFUdbiz0DqoACRUjthtCVFjdOAc7uVewt+0yMksZii8SzJGK5BMubYVh7VXTV3GX+XJDyhER0aNrOrTpuyy4HpwHmcPdbaSIhPPFjelM6r3lGI1uEs7O44Kh2QOpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkONOhuYfgviykzFX94Y3qExOj6gkRjAWu0Ft1PWupw=;
 b=FSEv+Uaf6xOK1Q925vlyqwfj7n76LPoZ2Z+bHXGXxPImlfjb3YIjWiQtNNmHSS41IdYivy9qXRp2l0f9+SyoHK/L2a5/TKFHF/oa2KXaNuRys4Qlz8DmpPEDhd3M5HXyx9E4LNPtYtDqd/3+9SjcU1sgh2nUz+tRtKaxcxXDNKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:495::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 09:34:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 09:34:12 +0000
Date: Sat, 14 Feb 2026 09:34:12 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj?=
 =?UTF-8?Q?=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
In-Reply-To: <20260214092740.3201946-1-lossin@kernel.org>
References: <20260214092740.3201946-1-lossin@kernel.org>
Message-ID: <2b135df7929193c928e8a2bc2a20b7c6@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0469.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ae805a-c547-47a9-d39b-08de6bac3677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Fxs5Ptlq64Y2XUXRL60CdLUncbvq/UxqBNoLVXm7IKLNrvbFzi1Jq+e/67n?=
 =?us-ascii?Q?ww53jdBfHn9P4ZuiODx8+D4U9dyR6vZzFwIfIu9YaUSzU/qBjqtbFbyAHGMN?=
 =?us-ascii?Q?FDrGqWzg0MCg693RvRteKaB2zibKBIcxAx0JoBRn9dOIEMm2cPYBnFkaXzV8?=
 =?us-ascii?Q?RQFaTomvTdaMYYbNuGwLy09poLQcV5LqU/uRLt+CTTT53bqBxtuSmV5pLXlY?=
 =?us-ascii?Q?05f1/ZOwvB+IUWRL4rCNinl6/0OmBJWbpJjJ2cRx10X6dV0IvMQz7n88n5xN?=
 =?us-ascii?Q?ZzemflrHd1rbdO27lFus/AHYDLLoc+x30NrDZ3wWXiVA5HyVzWaRtwYJJzB+?=
 =?us-ascii?Q?Z7kpqKchkycbDm0J8paxa0s+xT6jyOtvzZr0pP/fzmPWeo25yy3ehrttr54Y?=
 =?us-ascii?Q?TvZ/FHqzD9vt7cXnKP8txwrBcPd7yhxwYv/9nLjM6YyffrOiU+2qZ9yW8eTF?=
 =?us-ascii?Q?Fv8LZ5j/6ajBBBKzRhsaEdZDYz4CZL6Ohi9DGcSk0Zq9hpJ7DME0aeOHFZRU?=
 =?us-ascii?Q?Pxl4RujVefOKGL+5uvd0VDKRTLEdN7X4O57Cu8s0lN7kXBGO8BNiZaCK3ZtW?=
 =?us-ascii?Q?0PuH+Cxeo04zMrsfDc+EvE+opK4y8vFAvlW+xuW9Ny3I68PluzENaClccCC4?=
 =?us-ascii?Q?igrmM1D7OhozQ9u/GIVoTOlkw/+nNDiLcR9628ICMggyMZ2/W3uwGwwaqpBM?=
 =?us-ascii?Q?jwXOcSeLmrAEkhb750iNj0EQHuAw/sRf+xvzRd68dUZxhPPcXOGNw9X7ltyq?=
 =?us-ascii?Q?+mL7exF9eC9YOFUos78gc9I22kAMiWdQbdmFPq2vdcD14uV82GiNKH8QDVic?=
 =?us-ascii?Q?EalGpN++fAflznI7ClEAmf6WXJsEfvLLNfqffRGWJmCLxP36CcEJtIoxsapS?=
 =?us-ascii?Q?XY/9TjJ4WhbWhWEtWZgWM4HlvyYoD1dtj/0t3z6cql2MCcy99tJZLTYqwG8o?=
 =?us-ascii?Q?2ezYO6D79NoJB/V4qNygnFrMWBCfWl+8zzze+yV/AwPvnMwx/alrCclhJ4dD?=
 =?us-ascii?Q?siZkvcVKtuIoCNVr11ilJbtkmy7aQFkKZ5Oiv9IxaRxTbp3D1yqozsDSiDqn?=
 =?us-ascii?Q?5UlYhtXm9j2kx91pQodixz7vMhQmWMiXvnXy0JTzJrwTot49dWnruhqHxxSm?=
 =?us-ascii?Q?ToTHDE9YZSjkaOaTVnHgRmyfRYqYEoqNPmsR4J9fW4rGN83NKyuLZNLKG6BB?=
 =?us-ascii?Q?0i6hz4rO9txXvpnYjGI+NMrbNk89sjkxIe+Vv5M4B7UN3BIlf3lfqezLxC73?=
 =?us-ascii?Q?UaQ98soKnJOupWDgwzfTP+UdqF9eCz29j8XTUy/M2dAqy6QXcO2AU2IOM9Pk?=
 =?us-ascii?Q?Gptl0Rwu1wymZxyfM4azU+dhDvfO79s/rrrGlXcaiTPsqWyBM3WWbe6LLouL?=
 =?us-ascii?Q?5X9/xkcR98CIxs+7UHyfGrBuTx1IgVn1lSN9A1nAGWa7pZylGL+1QMD46lX+?=
 =?us-ascii?Q?YLulA7AgKevBIpUeQD6SZhidIo80oiwy6Cp58ut5qcRIF8kWvcIdMBETiPbg?=
 =?us-ascii?Q?bdwqpTC+AQJbJTl2UQ8vWhUeP5QSIOzIf4Dg7RaGQQO8ByYpweHaCpbxLYdS?=
 =?us-ascii?Q?LonWZkGIRrgql0FZPtg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eT1gs22wcVj4myyAweTmEhG0oN5Pkrk/76TaWpk7HsOQWtTaNEYW0nuHvTFj?=
 =?us-ascii?Q?9a0EyPeHbm7aUdEwpxt1yyLyIajyZU+xg5RI8dHUPcHWfOZ+fzTp9yoAkpfx?=
 =?us-ascii?Q?845g0JhG5FO7ls9V6FRXFzkZHyTQJgJvKS6a83yAU01GvGWapYzP8q69g9Lk?=
 =?us-ascii?Q?dwWaGCuDamqlR6DuR5/Rdl79PsJG+el/RXWKkEIfq/Wd48c7QJ9EgQJmBInZ?=
 =?us-ascii?Q?m9eANYFPWQaTdTRTVtNXo3IiWlagHikc/0aNddIOPPEH71LHqv4DXP1kTcbF?=
 =?us-ascii?Q?C0UYJK3+M+L9fVF5QLZ1ama73W0If6lNv3jC0LY9srhJDaf77ZtdqI92hmga?=
 =?us-ascii?Q?hLq/Jt334SduwjMQuZu9ziHP598FXOIRrKfg7xXB8PckOZcKcB42CnCBDSN/?=
 =?us-ascii?Q?couztb+kDsefiTiq0rgEjsbj31t+7/gqVOiIRqHNFt14qlnXR7/rCJ8sCeLP?=
 =?us-ascii?Q?C9dJh35xj7mA0lPoTrAkWONK6j+vTU3Vin8xyYUQoYCN6DI2p8QRq4Yf6fh9?=
 =?us-ascii?Q?EcGrccq8pXLHCUq3T7bTJY5WZUf8H6NByKdEpuqRZ1hGs+OF3+x7HYOLv6i/?=
 =?us-ascii?Q?v/oL/tzO27RAC5XNK18/TnZp26XXa2J3uIKPGj2oH9/eNy3fC7/VoY4hRr97?=
 =?us-ascii?Q?z1ETlvcUwBco4c6yGsFh2yu/kBCxu0VIGjscl720ofxIbSJT7AjvNgFVqxqc?=
 =?us-ascii?Q?22BiOuOAbrAZ36X9wHwQZGdJ1fBdrVK+1oiEvq8S+JuEFMW/LN518q1iUMcW?=
 =?us-ascii?Q?qdWqe2MWUtHcAuwcLg3Cb87kjoQynZT4QdTe1AaT0WEYPCtOKjHUYz39DVaI?=
 =?us-ascii?Q?fVhLsrHoFQRZlg6f4SPCqaELu9yCIDIkqwYGLYCR41LIlIODyKk4SDOpza+R?=
 =?us-ascii?Q?VeGrpaUVSH2wq6EOLUiS4DKy8aPVthS56py/G8aFEpWzPn0S0dvDBZJFZWmY?=
 =?us-ascii?Q?IOjjpgwUF+BvEFAC7n45Jj4M4Kh59IaPhqUAfPOjPhaNYgr1xCCbKsZxHI0w?=
 =?us-ascii?Q?v8d0d7jbuAp4Xwfdox5ep/KHl72pQkJUzFywy4l1K7aexfHkvSGoTLAU7UJc?=
 =?us-ascii?Q?lAVPOJPoPdnIy7L24P4y+ZOOYJvv3KqbdTBEf7n7Yk1FdZDkDWEZr35Jyvzo?=
 =?us-ascii?Q?cWS4l8gkPLWQEbBl/88ulSTUubAy9L1Cl07L6nhNlhzDQd6HFK86XJ/7ZQWq?=
 =?us-ascii?Q?mGXhFCjFPEJ9MqoE6hYSDre5Y4tlWRDXsgqjti7JHS4jLlJI4fnh86oG41Hg?=
 =?us-ascii?Q?pQS3nVEgpXCqb3C808GFefCZdypf0zVbufEFlcr/x8amyCguFxlI0OEVn0PF?=
 =?us-ascii?Q?OTDUTBLp04yU9m6vY93QRNSYxbdYHOKhyPCMhL22NI+xN7X7/x44lwB7C57i?=
 =?us-ascii?Q?9KbyId1SdWYTbTF0DVY/IXUZnexpDlKbhOx9iZnvWDmgfsDqDRlVZ8jmLxwf?=
 =?us-ascii?Q?ANJHU5oIgda1/zXfdiMW/7FY2DVGWQWQx+lL4giCFcBzS7bAdoW21fWSaG1i?=
 =?us-ascii?Q?eJfmqrPKtySNKeDsqmgkpeMr88yH++s/rOIc4lgR0F4wNs96kINjHFAjHfRf?=
 =?us-ascii?Q?orL83+RuEMX1kTVgQcbC7/v+LkyPxrd5aMxRMfPhBJZpnQA19tzbUkKmF+t9?=
 =?us-ascii?Q?bgwKIQOEbIMEKCfedBoYnlLFjStjEgaEkxOUjLqRCDyZDfYgV1TMglMOF9+g?=
 =?us-ascii?Q?AU4JSXdczggj7Aezefn1LvY/2PIEXnqp6f856lVrzeCIJRGfNm/ELC5/C3fb?=
 =?us-ascii?Q?h6OX0useDA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ae805a-c547-47a9-d39b-08de6bac3677
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 09:34:12.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WBwQh3Qbp+f8Ph3vJGPTw1ycHTArKHAqi5pmCyqz6iOlYZ+EjbZ4pwNs8i9TlPziB5EOOZFNfZxcBZyT+LmaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9301

On 2026-02-14 09:27, Benno Lossin wrote:
> These callback functions take a generic `T` that is used in the body as
> the generic argument in `Registration` and `ThreadedRegistration`. Those
> types require `T: 'static`, but due to a compiler bug this requirement
> isn't propagated to the function. Thus add the bound. This was caught in
> the upstream Rust CI [1].
> 
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/rust-lang/rust/pull/149389 [1]

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/irq/request.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> index b150563fdef8..2ceeaeb0543a 100644
> --- a/rust/kernel/irq/request.rs
> +++ b/rust/kernel/irq/request.rs
> @@ -261,7 +261,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
>  /// # Safety
>  ///
>  /// This function should be only used as the callback in `request_irq`.
> -unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
> +unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
> +    _irq: i32,
> +    ptr: *mut c_void,
> +) -> c_uint {
>      // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Registration::new`
>      let registration = unsafe { &*(ptr as *const Registration<T>) };
>      // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
> @@ -480,7 +483,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
>  /// # Safety
>  ///
>  /// This function should be only used as the callback in `request_threaded_irq`.
> -unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
> +unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler + 'static>(
>      _irq: i32,
>      ptr: *mut c_void,
>  ) -> c_uint {
> @@ -496,7 +499,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
>  /// # Safety
>  ///
>  /// This function should be only used as the callback in `request_threaded_irq`.
> -unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
> +unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + 'static>(
> +    _irq: i32,
> +    ptr: *mut c_void,
> +) -> c_uint {
>      // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
>      let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
>      // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
> 
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377

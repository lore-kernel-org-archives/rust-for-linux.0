Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021142.outbound.protection.outlook.com [52.101.100.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A826735957;
	Mon, 22 Dec 2025 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766404809; cv=fail; b=CKM9HS13v319el2fyD35ER24v6JJqenc9nSR7W67VeO5y6AXQc4n8F9egCSTKoSufDaywU4VTX6EwSKMnYhXmVz8Zfv5sr92Az0/FEEzRGNp2A0KAdX5VKs0yw/+9dWTWMcMLQcgjcmhzB8HNTb/hfop9meYlDqghqTcHmwkD3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766404809; c=relaxed/simple;
	bh=R+7/eBS/tPxn155qYd4dVZoWK7osUIShH9d8I36zn7I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lfHlW+3qqtwr6IWBzKpztAQ6xoHu6KMz0f0TDRwdCZermc150FuUvQuAxTCI3uCMG6VKLylHZnoSYukeCCwkmLtzlhM8YsEglRZNUA22fkHMMqFxN9Q1AcHg9eEGhmuya2D88LKAV6DpbwBhjXU6NipXreVruLod5zf3AYcfmnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=u7a/HrZ6; arc=fail smtp.client-ip=52.101.100.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="u7a/HrZ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEwrUCtf8YJTb/nmkIAN5TtplZm71RzzNT1SxMJ4KLx3IcwKbgYOjkztgvH0DIYZXlkGmUXjeBQPQDhdRZM8gTxI3Ab19vaWxn6t9FY7csWSwhhzMjUiqI2ENwJDJP5LJLCfpLIc/HIr5vF4vqkGCSdeoZ0CfUtEMjjpp74He0RSM5kCg3c43AEb/JpNm6k6DSckYOMPNTF0EefsYjnJlFMHB/rCg1w8HvOxkdifMdkygBn775fRGPJUY0zwKyl6L5p6ctFnkxpMFcV+vqz1ZcRJPw0TwmNYHc7X687p2GMuUNVCSuyZ8Tk0DHJjXrffqt74yqHUSEdPcYzxaVdMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKfH8AnE7hmyxJ45GkIO56sfYBZ6LGgSPJae0Z8kPj8=;
 b=wxExUPZs7qNXrvpHB1ZSXi4guh6yR2SEbRodAkvQaWE/KA5oIZVAQ8bnGcJsXRskcSYm6UWc+/iOCb16hcNPVuDb1ZNbyK2Bl5QqoYVvbGUEpFJGeXsFaLtIvuxTQohzt42+a1oF/TEUcCr2z4NqaNH3VITL5FhL6hAqkiLf5c0Ic1eVyWiPyzj93v+W9PMUHl6nB08YjHRnCFSpFH9ZUheIoPNpB0IijZVF5savaM4FWmIxUkp0vWFhwfwWB3sndCSwvAAJDQ0CI3Yd1iReoDdwIkKIemLI1ZvKwovZbzuFnUn9WlsDrbNNCLpF46wO43IViBVroK0EmG9kIP8SJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKfH8AnE7hmyxJ45GkIO56sfYBZ6LGgSPJae0Z8kPj8=;
 b=u7a/HrZ60xqY4rxf1AAYWnKtjE3gHflWcfBX0SUQE71x5WIFNlydYTM8x5qQveifKGTw+N7/dDUt/i7V0m9bPl1j/u/xEranKbl+28fSg4GY18pSgNBSCpMVIJ5Fd7vZroPRrfCzwf+SDxO3Eaad0TAbKBVbXEWbo2Qda9U/cRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2320.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:117::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 12:00:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 12:00:01 +0000
Date: Mon, 22 Dec 2025 11:59:56 +0000
From: Gary Guo <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Guilherme Giacomo Simoes"
 <trintaeoitogc@gmail.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, "Tamir Duberstein" <tamird@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "David Gow" <davidgow@google.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/11] rust: macros: convert `concat_idents!` to use
 `syn`
Message-ID: <20251222115956.62c7a4e5.gary@garyguo.net>
In-Reply-To: <DF4JBGAGVKYW.367WAXDU2B0B1@kernel.org>
References: <20251211185805.2835633-1-gary@kernel.org>
	<20251211185805.2835633-8-gary@kernel.org>
	<DF4JBGAGVKYW.367WAXDU2B0B1@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2320:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4297a0-c275-4326-2bd0-08de4151a31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ie+Ne7Z/RfJPDqluoLeNOjcqBILv8+q19h1c6sGVn1P4O+POaLbzkQx5dOco?=
 =?us-ascii?Q?Nd+iALvTtRzK1otI3z2vquJ9p7Kuh2MEPdCapf0PAh+AI1/bSFoH4WszB2jE?=
 =?us-ascii?Q?GvLnr/z+Kmw3J+o6JSd+DrEGyrpaTHoiYRuIaR2mxZB9dzdToYM/SKUnMzK4?=
 =?us-ascii?Q?GZChOuBUruWyU23wUmbkI2CZu8zwm2V0hXYLjW10ZP7IvTaTal/QKDkGkx+3?=
 =?us-ascii?Q?rDzYEOjTGwycc8nwZqCR1oig3esbbqXnNYH5m/Z4AbZm01I+R7d8BhEkbuDE?=
 =?us-ascii?Q?QHRV5u3RmOYqHT3fkYgYv7q3xbvxwbxOLGM5Ng2JNxnRygZBcW6dKYNqd29f?=
 =?us-ascii?Q?VDJCzm/DMrZXlmPXg6AeqbdwK5aloI2kz57S0fl1kgiZXBq2p8TfG7KX3HwR?=
 =?us-ascii?Q?5Cru1lICU/lrm2U+5Dn9/NS7J6T6HYxlWit14wJlN2HBEMAVmQTvY3r0eN3d?=
 =?us-ascii?Q?sb/2jTj0DHCKs7UPfMZJoLla2+OsGnCDbQceUT9E+4jiVT1xQf2IRpABSnB9?=
 =?us-ascii?Q?KC9EP0QFsVVbzPOY7MrenHOyH5fqw/3n4+SCmaI5t0zIrU7AnsQA31QRGgat?=
 =?us-ascii?Q?Iita9BI0LRtHIjmq5b9iLegU8jRB3YzkcVyf550TiiP65BzdaUDmOtNIUTI8?=
 =?us-ascii?Q?XdXb4a7EybNCoRxH0mMwjBTc1+8BSn2jaVhoGL+1l+azhzM1OnWfvcYx5Y7h?=
 =?us-ascii?Q?qXsWSrO9lOko/4SD/2q+M3iHOYCP0n/WGB1xBvdsNcQjpn/ijTMDX49LxH9X?=
 =?us-ascii?Q?4a9Z2A68FzrKTDWJWB+6mMgG10BMDlsjiqRDNSBIR87vFpAOn7T2yqJTxFkO?=
 =?us-ascii?Q?ByZvP1Byr1kr96wuwslL2ixA9kFQhOq0HLrN2PMBw+mBBSCEkGp6Fl9vJ4yg?=
 =?us-ascii?Q?UTufX2FK0hSfSUKeD4yZ4bi+HIDczCCXjnv4bfZBeYrz709QSYfQu18XOJMh?=
 =?us-ascii?Q?O/b8WNo/bAVZtf/wkwcpcgwJi1M6k8xlmXuYz8ex76Wdf7ANTnuUFULJ05n1?=
 =?us-ascii?Q?bS+VNn4eAyOcjO7bSIgKFIDmPtP8K+bh8YxAE/50XflZt3iIvbei5yqwr0Be?=
 =?us-ascii?Q?sBiTkdQ2Ikdxrafy4C2vbwlnr9d/LgTGBuayR7nbPz7X9MXWOBzpSRt/9jAE?=
 =?us-ascii?Q?YLCO6Q/fpot25vFobdjcoJW7V61JfUgHTxPkHdyE4tMQKj6Kgcb/shm1t1hL?=
 =?us-ascii?Q?gCUpkgLPM96EON9TQfkB4Flq2AqQPNX6eIF9oCfNYQ2hkssXaWGdj4NDdz/4?=
 =?us-ascii?Q?8x3ijoPHIMRlzgrUz77nkbGCr8zlr1H7MG0Wujc93JGUkgOiNu6dZxJmIqsn?=
 =?us-ascii?Q?4zs9HWa6km8nJaWCKHuEShHHd/tSr6/vKrUT+rUvTUx4AK+IUnYHD6UNa2y5?=
 =?us-ascii?Q?mC0T8bBbK3EXM8o2odNj6hoF0F/OS9cb6LKJR2dmvuzjqK6j11bzYLdFWDoi?=
 =?us-ascii?Q?vp4wkREQ5yCDTckfGjlNGCTCk/yJG4aH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4MZwFRDeg4UOniVoPgKDwcaye54nLyBY4gNEEThP6uLrjAw8lfu9cfWqV714?=
 =?us-ascii?Q?QTfoOVX8fn6/AOWGbHvITOy4a3eP5DDZ2gz8L4xZNhsvOohzzPIlpcKJLEea?=
 =?us-ascii?Q?7r7VTYd2twtn3NHE0+vWbrjH9kkQ4w4vXhVWltdlpbbB2ac/e0yjYVUQ+gR8?=
 =?us-ascii?Q?02ydS4PVhMlKcxSFPbZt+mnZjv17+oGqdqMqvK5BFqqbCkKycxUzvlgehdx+?=
 =?us-ascii?Q?uPZ2LnD3gwg+fpswJOonckCjq5b+VBvW+7aEe1pdEeXz9pqW8QEZTnnc/uz1?=
 =?us-ascii?Q?An9/eDpiTOcnYLfvr9bQI41UQDy4Q/4friz/bdF58RI9OB9zDw8j/114gnyw?=
 =?us-ascii?Q?8WZvLuMraHKfFxR1hDIRt9fbIh9+NMwByRBZynj+oPMuRZ7q4VzN1saYD7yN?=
 =?us-ascii?Q?VyKrlV39qD+8u6ez4MiqQSyjaO5ETBoB4p+kA2Z997u7r7QIZHdQPdmZwYe9?=
 =?us-ascii?Q?yKPV0nDsL6Tzoe80V6isLhcTgawiEEdCDhjTT2obf6nmJi6X5ZoLcbrl12pN?=
 =?us-ascii?Q?2pApA0xi20ISe4DE9Kx07/aKWlHWeYePnCsjxNd9X/EeBzY/fHE7RN6XQkLb?=
 =?us-ascii?Q?IRJkVjheJoSFWr9zDSeooNn0QWPd/QGLWWbxwwgbbKMMUClqYRjg8BjjbOTl?=
 =?us-ascii?Q?JP0opiZlRloNSJHZ/UYfaEAHhZSZz8eVq3SUL9PfYmIvSGeCyw068jF8qa78?=
 =?us-ascii?Q?9xkNOnZ5APGJkuAV3r1ha3FzOal9yOkbaNnTZbssGmbPJGVy7mImfRdBksjH?=
 =?us-ascii?Q?Y1Lq8Tj3a4IelJiWIV7UdOkOyq3lu1Ii00k4B8LdT/hpb0lw/RfFbcNGHJtg?=
 =?us-ascii?Q?Gif8OhLYkWf8Bfwsamip4RKVIPSxXMDO1ugjBAYOXZXp3vKAEho71fNV1okx?=
 =?us-ascii?Q?L0k7fdUoVRAWtaNtdbyHt9vC9XAWUY86p4Mu78OJcseirIlDbNoFhMA0G8UQ?=
 =?us-ascii?Q?sCmENBWS6hCLS8pFjWeg71C/q0bVkrGAecIEOBGgWriwuwU3cRiwUSrJUdAh?=
 =?us-ascii?Q?HdfwlmNnckClxj6QFNL8nsE+4yNKVIAv74D32+ZQAV9iYBiZxB8HavJnJy6X?=
 =?us-ascii?Q?3AizasNOQLDC/gvR3p0SXmKL3H54jrCi85jd8H3Di2puFQwMVDlkdpoFRdRL?=
 =?us-ascii?Q?QIqyanieTy33zhUGtZJ68bcx1Qe3CsbwnxS6USwE0DJIxXQ2SfNMAhxDbh9S?=
 =?us-ascii?Q?vMSe+8LmC+YQ66bs3Q2muYR3vE3tyEEVWZQUWrf0H8YZRsVtK7gRUh9jr2x2?=
 =?us-ascii?Q?gatIIaG3jDTWqMC3TQ6Uu0RWGEbGlc//IwzObaTYGFrIb5Nm0JZd+Fp9DlRp?=
 =?us-ascii?Q?o6LzJSHufG4XE4PdYyq/LeKTai3HjzazGbo+m3iI0pqWer8pD/b+/BDnYn+q?=
 =?us-ascii?Q?puHO/UFs6Rk9w07Yw+mOc9DWIkA+JU7XsoHZ5P9LgmYBrTDm6ZM8MXzdW9YB?=
 =?us-ascii?Q?q6GUyeHLe5vHTw7Eo8y/Hg9AonZ88UvIew0GppB6em3SDVJYyKeJ11aLuA0W?=
 =?us-ascii?Q?Z+0LK5A6JzpzvY0RcjDgMmRwmfDZ5owBgXJqk2h9gvVuVepNrJketWuUdtmB?=
 =?us-ascii?Q?zfcx70JJbea7i4MFTg/MjVStEa+KnKJUb4BbT/p+U8WXcbEIYq/1g02q6Fi/?=
 =?us-ascii?Q?25BR17Ycj9ytHxfzzizaawyCuONpPu1nRpJPCdHtC9Jiwt75EDhkGgWe4BQ/?=
 =?us-ascii?Q?+kq7PmR/8RADFS4WayeyB5Y+HYKqA1excfgCHFyRmz+lA8enLGJswOB8vCij?=
 =?us-ascii?Q?vyB38DlGkQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4297a0-c275-4326-2bd0-08de4151a31b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 12:00:01.8788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkRDm/hxvTDPmBUlajMwbkSkGfGx3bgxfVFVxmJsC2h9SAQ4ldmbG8geWrrCfZEFhYWM5uZcfUy4VNnOJOCweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2320

On Mon, 22 Dec 2025 07:34:24 +0100
"Benno Lossin" <lossin@kernel.org> wrote:

> On Thu Dec 11, 2025 at 7:56 PM CET, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > This eliminates the need for `expect_punct` helper.  
> 
> This commit message could use some more details :)
> 
> > Signed-off-by: Gary Guo <gary@garyguo.net>  
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 
> > ---
> >  rust/macros/concat_idents.rs | 39 ++++++++++++++++++++++++------------
> >  rust/macros/helpers.rs       | 14 +------------
> >  rust/macros/lib.rs           |  4 ++--
> >  3 files changed, 29 insertions(+), 28 deletions(-)  
> 
> > -pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
> > -    let mut it = ts.into_iter();
> > -    let a = expect_ident(&mut it);
> > -    assert_eq!(expect_punct(&mut it), ',');
> > -    let b = expect_ident(&mut it);
> > -    assert!(it.next().is_none(), "only two idents can be concatenated");
> > +pub(crate) fn concat_idents(Input { a, b, .. }: Input) -> TokenStream {
> >      let res = Ident::new(&format!("{a}{b}"), b.span());  
> 
> There is `quote::format_ident!`, which directly returns an identifier,
> but with the span of the first of the two. Not sure if that is better.

All our use cases have a prefix concatenated to a changing identifier,
hence the existing implementation use b's span.

Best,
Gary

> 
> Cheers,
> Benno
> 
> >      TokenStream::from_iter([TokenTree::Ident(res)])
> >  }  


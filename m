Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022118.outbound.protection.outlook.com [52.101.101.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D170465D09
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876168; cv=fail; b=HVdUtR6h5d9wyz4QyrWUIkjDXMrJmLrZ8tum3zXS7b3NGN6w43OnLA6LS80ytINzUYcMzSE2vUOxu44wNp2QI34EuIlIl2/37aykJ6m0MO+X7h0NGYriDeSrqS0lkc/zNacaK5iR58I1qtxW5R6iPj3lblxKxIYKjsIL1AtTa0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876168; c=relaxed/simple;
	bh=3vec/zupEnZV74EfBrhjG21psWOL9ne0V2vPyMKMDak=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/EaJyEtiL1d5HNEA+iRZjbhbdA+2qNMSGSNCIY0wQKYbEw1lTW+ZtfHetWP98j5K43HjbOsUCVp2ujr1k0b6xV7THQ+e4yxBKxRasnc7cKdGB60tc/C0y7BNon6+Hq/mQHh9ZaIYvpTlcRaZLMn3fXONs6N0186MU/kdqUAMo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NI+Ey2Ty; arc=fail smtp.client-ip=52.101.101.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NI+Ey2Ty"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju4W89jpZIQ3Qy/aiBClwkOxrkc1WQN+ztFnkXc3GULTU4K3X7k/jwuXKvLr9C12Vb9LCn2OhrnWnWry1qVt1V0AL1bulsu4hSqgnGoBxMJmFy7hENBGfcBniKLd1BrTd9OdnlhWZHVMuBGU6O2577CsJ4jKe/0IXikOHqlQXutm0tUuKGndbPdU5AVZTyRURaphz0zj97okdIaIjJA+SNdXmseQvUEQWUc8nz3yf8r3S5gFm0v7HeglD+BNLIodb8tlDNPbo3bgtKL4fWstw6eaJ242fQ4FALOh+8+XMFex0h2Qz1ERoJg6C+06LTtZn02qkehbJvU0eY1t31nhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCCtZaL+L3efGJFfQnYSnYFFZS/CTWnmH82R9jUzT44=;
 b=H6qJyYdUWspwWU4PUSgB+arEH/BWTHkHY5o7P58IC1vmCxEtdwgmdzBGTYoA9ZjPQdS1p6MMV2ZbWqagZJxiuEFOEU4ulgu7OUJztL3724O8yYfeLgaToCgBVwxl5hL3tsB6O4GfEkoX1kBqoLVvhtH6GX4iCGkT7EK9/3BbPhJAf23pp9yYxAahUqnagyZjZ1pgbgpbtUB7Y1wCtJjYfuVvRenzw8UvxQ+gddWh6ccy+DuC8/Th/wuT6/EO8swE5AVVOO6bAgcfvEr9x1O1JdGnlCLDoiEaPRpbKMq1A1AEsJnoUcPbw83UOU9Lq3BtFinJJMwiO4K2gL+JK0XlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCCtZaL+L3efGJFfQnYSnYFFZS/CTWnmH82R9jUzT44=;
 b=NI+Ey2TygW92iFdDjxze8YRUtYE6EZh41424vrUC06Xi2PuPOq5FdOhW7w+brBsD8xmlUB4ACiUlK6uiv4g28YlYQBWOHeOsErtIQCRiCkpRH7lYE9hYxQ0yyIRhC0S9Ggx43xQYZS5Vdgne0H39QJ6sObFSOxt4xQYzjesbqzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2462.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:12a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 12:42:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:42:42 +0000
Date: Thu, 8 Jan 2026 12:42:40 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
Message-ID: <20260108124240.239a5338.gary@garyguo.net>
In-Reply-To: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
References: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2462:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd85baa-c0dd-4d42-2e92-08de4eb36a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R+fpvmvyxlkP5BeEgDalgbWCEVajPibkDy3mFqNdhL8eEKw+ehq3txyBxf5u?=
 =?us-ascii?Q?8Q4+hHxKdfn57qZWwdfhhFWETrrpXj9BqYTM9Vqkcthg40mqtltKxKR8AChl?=
 =?us-ascii?Q?q8SLeXNAGCL8SHQJ3wUfjW5jAzK2jlrcktS6FbKCdx+phUpvkWLh33YU2ohj?=
 =?us-ascii?Q?J952RNZyNG+Ma2/W9aUJPDakx3YjCgUS3Emwinm2y60+rD1eXZUL5Jy1orUG?=
 =?us-ascii?Q?R4wP1LQQOk9IaIVB34o42AV5FZ1DZwm7SuXusZkryLCBJiJcYxTniCs1NLPc?=
 =?us-ascii?Q?P3U7nKW2quMJNpf6jhV+4eNju+Q/ht7RkJD1U1/pEYR/JpMJJhmt4+ZlNUiZ?=
 =?us-ascii?Q?VVhSmP2OY9gcE2J4xAogRU9OcfuFak3O8NOfBdB01KDS+E/gimL/FsFZTD9E?=
 =?us-ascii?Q?RZ/PpFFcUXzCHuSGxt0So7p1wkgq9tqdGY8Bg8usgSTCPT/cS+GC/D1v8Lib?=
 =?us-ascii?Q?vkXCA45HHEKdO2Q1JmZRwgOYPKghgdrib/tWMjG7ulOQup4f4AIS0VglBYAP?=
 =?us-ascii?Q?obK7evrfQTYKfMOZGm3FVSKp3aVodtDgtb2qg9l0mOirVLh+foE+LYxar0ph?=
 =?us-ascii?Q?prAfRvLmxLdHehozOlunERlKSdBi46DIQzeO1UP63FEmWCX8Fptb5HHcra3l?=
 =?us-ascii?Q?FbhSWo1d8WwLfbZkLNneGBKVvgd2fPfmBhRLGuDwVMmZyikw7gCu0q9gPQPX?=
 =?us-ascii?Q?NWXoWahaIJ7gU3WJXKZVepslu+RRwoKaD213CpmjgsDjXhy7SvMyoM/pQkw2?=
 =?us-ascii?Q?YyrGCKpyQmheJjXvfAJom0mU9YW5vxGSzhoFDrKyobtwumS3BC/AsMY3DYFn?=
 =?us-ascii?Q?biP+hch7Wgb9Kvb8TK6s9UOWp2DWpIohNPcB45PV195QJFIUPqQpCa/Y1+wD?=
 =?us-ascii?Q?UFTKJAXGQzI4Qy3FLj/f8LLPPi6YWBpigomFm0R4HB8fi4AqyByF90nm4UR5?=
 =?us-ascii?Q?hED7Mf31SPR5LZO1SGETM3IJmAlaz6neBMroN1eBaRfG4r9qQmUHqLPKmHT6?=
 =?us-ascii?Q?3L0NBAhzKoE9Z1yLVdAetClvTDZ731hvKnxtoxX8TfGwAAnYXe4OTx7HbVog?=
 =?us-ascii?Q?QSJTEPr51YKbJHvfJkJVD6MsheRi7M51idxOD4nEJITRiDsu8PVwBdGSR+eO?=
 =?us-ascii?Q?BoygGR/1iC7OwBJBHoxCDskfY0HGPOqHhdFwyqOqM4CSHZpSKGKeJ15xvsNm?=
 =?us-ascii?Q?5jkKTPhMi+Ebd4S3uKgWr3Wb1VRdRJeNEbYwwGfD0/rPKZgef3x1I7+7y1tE?=
 =?us-ascii?Q?mA5DuptSr2RZ4+ibc9PQpdWq+d2zekxsyBuqWxIuLegVxpXlEviJrdovA2G8?=
 =?us-ascii?Q?Lx8cAzLvFWQnVQaFH/ahoIxJcL8tAAbb2KV1LtHupKOQitlAo+tZ/AXMSEq1?=
 =?us-ascii?Q?vGxVQB4mxhAU8NoGeoxB5f0bymtuUkg9TxtBAgx7m2rcomHji/LYIHiCeWKo?=
 =?us-ascii?Q?cViYUMcoi/0Rtdpebun4maO2zcVqyh/X7Lj8qRIT1BmFdsTy/8bklA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8PzJ3/Gd7sqOnvLQ7ZQCpiWjMHtJbyaegrE1g2wkPBX/Y6vn2qFx2AaTopRi?=
 =?us-ascii?Q?c/uIdP97QCDzbVTm73IWD6WX16zdvBVBUYCm30JiAv55o4vBYuGq0vdb/kYl?=
 =?us-ascii?Q?nlcw175l77oWuE61MxuYSje8Rn9rag2gNJVX+RKuFDpnh9GWNLeJaZms4JjQ?=
 =?us-ascii?Q?p+pYEVl4qKH7LhQeCKwuY7usMdnHr0nAhdS2OHwVJ+o7J5f6ZmEbiLsSl+1y?=
 =?us-ascii?Q?KfZnEA6YYePiXmnd40u1wwiSuHIjWRroFYXG4Js73hOlPh5fmIXdxFbXhjmC?=
 =?us-ascii?Q?bTB1VM5EQMesR/YgNLmMVv10g5BdfibePj97Qqvi+wN0zHcv7Et/m2c6HXiu?=
 =?us-ascii?Q?J7zJmtI4XH1WSOXnQvqzstYiApVGDrD4vmBDR9x9kra+gFzrWMJkl9tMCajG?=
 =?us-ascii?Q?4OliOhFVVRvFYNA+6v9tE0rwKsCrfaLWftng2M0sAp2kuRjLD7oESfdSr5QV?=
 =?us-ascii?Q?Jzi4JzfBjFF3O/jQUyBRSjTODNrFn5G0FRkpf4j/lExH4nKpsOG+Z7Tdxntu?=
 =?us-ascii?Q?87d7gJHvX/LlXWiRSgIAA/N9W5VIvz7R5n7n6oIztT525RXhfWrKHRMX1KnR?=
 =?us-ascii?Q?e2luMGeUVZ797Cktw/KEu+N8sWnbs0+U3W5loRSmJBWbpMCQsrnsfLgfy+cq?=
 =?us-ascii?Q?QaRcw11ztiYwlXGfY+r6VSxiVFgpqUCXWTexclq9G4pjINLzsBCYHnHFiNwU?=
 =?us-ascii?Q?QOcBwz8Vnc9fwV7B4jZROueNkx95B9LE66hx3um9JcqT3Wgn05BD4ER0Go4O?=
 =?us-ascii?Q?AroRjKsVTkh2lmMQyYjdBIu5YvF3k1T9zhCVfC8tbKhAv0ALpZl/bainf3iT?=
 =?us-ascii?Q?hSARaQ8/lv/NZZOKh17gK8RjmDfhd00d5WzkDnPeCPTPZUhkBHB/3R67DTf/?=
 =?us-ascii?Q?k/i5brRcn2J+zFyFJ+M6ngpYyfR6lthUiat0SqkcVmh4KS9SIwwqjd2bI+VK?=
 =?us-ascii?Q?s8Hr0yQjrJP8/Lgej68lfrnJ/O1fPM+b3WshP268IdUzs+8RqtCSwwQ+adeT?=
 =?us-ascii?Q?Ok6J8M36ZaFsSO9o8Wa2OGfN3kogujVLtSm/rmNos2XqHL+MBm9HzSmApLl5?=
 =?us-ascii?Q?t380wxit6nB7KUm0pSIW+52lFZeuVtZ0gkb8PS76zKEpLluE97tMKvrcVdPz?=
 =?us-ascii?Q?QZk9CggRzS+5WrHBhcIOYcGHAlDD+laDGIs5jRcb5QD5uvDZbaSjxRdMNgwi?=
 =?us-ascii?Q?AwvvrmPWcRfI5TiOK7Lfdk0FVnhT2diqJriXaU3mW/nrAanwslfMdAgo0+Od?=
 =?us-ascii?Q?00rN/aaYPTx1XQVkckO4auZqaHwcZxWKXNv8xef0h0GYILBEPoGYC9Ay0w7/?=
 =?us-ascii?Q?W8PKGZXwhMVRIitRYXWZ7TaKhy+XpJaEBF/zZ7K68lPZ58Ebo0bA/MhT5Oga?=
 =?us-ascii?Q?LSbXJBdslXT7d5wyEqt3oysY/LkuD2zbAkfYAY0GqqYlCcqY3bD3+jdDXoTl?=
 =?us-ascii?Q?klwHiLUXrM/fXqKmLwd+qegD772dvPh7/Un1hicV+ZTxGzr+Yo1KIcB3HEBI?=
 =?us-ascii?Q?Cl7+voj7ANWaZ0otUUiIqI/mkKat+fAK0K2G/CHi4VzcNN0nVZRPVhjZtkvP?=
 =?us-ascii?Q?mvSnWmGhQ6GVwvyzDWHEGSCb9feqRgn5DH4DiTy90swUopNOg+K+EIjd/iDK?=
 =?us-ascii?Q?WXH1vSv86uUdCWFatUiA5pnVbixDBwaBP6uPBgZK3QzDl3CQWOZdHEbYuJjK?=
 =?us-ascii?Q?WFlopE/4xyhwy8QgLNvJGEnvOsmYdUm9RU+f+YTOOed//sQFlbh8ybLJI0KP?=
 =?us-ascii?Q?DLZA6QcFgA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd85baa-c0dd-4d42-2e92-08de4eb36a7f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:42:42.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBESnD0039jfwuPN0v/Ot3Y5EViaO1n37dfIHl1MkeRXSRCSiDoShizD9KKisRUt9aTF5hat1xFnwe4k5u31fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2462

On Thu,  8 Jan 2026 10:33:50 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
> introduced by the commit aec58b48517c ("bugs/core: Extend
> __WARN_FLAGS() with the 'cond_str' parameter").
> 
> When the option is enabled, WARN splats now show the evaluated
> warn_on() condition alongside the file path, e.g.:
> 
> ------------[ cut here ]------------
> WARNING: [val == 1] linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
> Modules linked in: rust_minimal(+)
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> v2:
> - make warn_flags! convert the passed file string to bytes
> v1: https://lore.kernel.org/rust-for-linux/20251204223405.454920-1-fujita.tomonori@gmail.com/
> 
>  rust/kernel/bug.rs | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> index 36aef43e5ebe..ed943960f851 100644
> --- a/rust/kernel/bug.rs
> +++ b/rust/kernel/bug.rs
> @@ -11,9 +11,9 @@
>  #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>  #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> -        const _FILE: &[u8] = file!().as_bytes();
> +        const _FILE: &[u8] = $file.as_bytes();
>          // Plus one for null-terminator.
>          static FILE: [u8; _FILE.len() + 1] = {
>              let mut bytes = [0; _FILE.len() + 1];
> @@ -50,7 +50,7 @@ macro_rules! warn_flags {
>  #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>  #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>  
>          // SAFETY:
> @@ -75,7 +75,7 @@ macro_rules! warn_flags {
>  #[doc(hidden)]
>  #[cfg(all(CONFIG_BUG, CONFIG_UML))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          // SAFETY: It is always safe to call `warn_slowpath_fmt()`
>          // with a valid null-terminated string.
>          unsafe {
> @@ -93,7 +93,7 @@ macro_rules! warn_flags {
>  #[doc(hidden)]
>  #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          // SAFETY: It is always safe to call `WARN_ON()`.
>          unsafe { $crate::bindings::WARN_ON(true) }
>      };
> @@ -103,7 +103,7 @@ macro_rules! warn_flags {
>  #[doc(hidden)]
>  #[cfg(not(CONFIG_BUG))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {};
> +    ($file:expr, $flags:expr) => {};
>  }
>  
>  #[doc(hidden)]
> @@ -116,10 +116,16 @@ pub const fn bugflag_taint(value: u32) -> u32 {
>  macro_rules! warn_on {
>      ($cond:expr) => {{
>          let cond = $cond;
> +
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
> +        const _COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
> +        const _COND_STR: &str = file!();
> +
>          if cond {
>              const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>  
> -            $crate::warn_flags!(WARN_ON_FLAGS);
> +            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
>          }
>          cond
>      }};
> 
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb


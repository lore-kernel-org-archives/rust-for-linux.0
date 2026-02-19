Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B133EB0A;
	Thu, 19 Feb 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512267; cv=fail; b=ce9AYq4pCROSqD/gzi27MMlXheXe2orQWxzkuzv5cB+WNlHMSFrm4vXTjMBcwKTPIAJ0+eIAupbgAUH+vyzucjTn+KMIdsqBhd7w1mFvYAnc1jCTffzxgxY+o0c69pKtV12HH/P4/ViulMk4JiMnvw8Y9275ZfILqt8UOgBxz8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512267; c=relaxed/simple;
	bh=5QWVGRPeDqegSxO9fX8cJkpubbIRGyMNlN9dmpmTpGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=LXsPZF9EPspJq+D6TZYiwEjQR4kJosnCt5z4m4l1YdOR2QQ7HAz67WDyNkxc4MXU5/8AQqqIZX+h5xuCY+NA6X7vAK5WJk3z2YS55iNfAkQnOyzBGajApotAmGThmkI2KRbjjhfY++pvX6Y1kIAnkHXtu6I3FsbLhTBEeMSjba0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UEgFUnjt; arc=fail smtp.client-ip=52.101.196.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UEgFUnjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEWqoHTsN3ly5I2sIydy9y9wffYiTrySXW+yfaMbgfycw36ZbW4jP2RsSIrg5m8pPBhoRvSs1VMfBll9dshE+rNclsF4L8WX9N8W8Z0id2qqO+ktXK+XJIvIFAm+x2MoQO3xBH1g38llzt2pSi7ausXPcjW2s6hlbFV7DVGVk0C5SSPc/ek5cYHvSykZrBxoJ0rqnjYInZwELEJpmPj7d62Nw9EPDdZ0DokfmHffWqZSgU0wGhuPmd3gK6X3lst24mja2IvbRWyGGrc8H2E2Z8okGXPZVfYYDMOrB82pDUPWgE5Ebdm1TDDzHvHuc4qOGEVoWy583mZVSiFqITEYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Wr4az2g+OS4sJNq+MDCAiNLmaWh0zDDJHMB8UHazJ4=;
 b=FHk6IJ0FRjRSOM6GcOmemz/B7amsQQnssh7eq9jdXkK2+o4Oo9M+4ma1fpeZ8QJ4RssROROykFz+wj7xiqw1saNxEbJtPKWpo1t2EHtzZrwjltaG8Q7DNvV3G6icLG0MlrmLctWKQisSY1SgHGZBiTH7R+6D0LLV7sq6Cej2Un3jxBl+eMS9Oews8W2YQE6WqBTBoYqNitilFUZjAku9pT9z+Mh45oKlapPurB7eWHz+nw7OCzbr4tnHdDPWBFRZboHvY439O/gWr+SL7cC/oyJLTXa3TxPC9/hlVDzgk1fpf7JA0IAHbWVq5wu1S25BJNUcgjXkLj+7BU+fX0wX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Wr4az2g+OS4sJNq+MDCAiNLmaWh0zDDJHMB8UHazJ4=;
 b=UEgFUnjtY5S+WRulZjer6lKhqpJ6ZzjdThZmMn0tER433SQXouc3puZziOHw7yKinJ+p9fXGCeu0Lq8P8Gcu5djpkMQhuy1yNiu4aP3IGrFZBw/yUB6bLu44BlFWqOh8ai39S5dubveHBk6KavPBvWMH3jfrTj/Qsva/SL3U7Bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2583.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 14:44:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:44:22 +0000
Date: Thu, 19 Feb 2026 14:44:22 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: irq: move 'static bounds to traits
In-Reply-To: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>
References: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>
Message-ID: <7442f2b32fb502cca25d61df390021dd@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2583:EE_
X-MS-Office365-Filtering-Correlation-Id: 886673c2-6e71-42d2-7863-08de6fc55ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/N7stz2LL9bUgvGghO8jMAADt4huYB70rbW/WWPaLNPAJj5Xk8IMmkOcZu8m?=
 =?us-ascii?Q?06s3NHTgfISnNeFgrLK9QjRwMXNhbZ/IAmrpJsRw+u3xu/+Fv5tns7IKPJdh?=
 =?us-ascii?Q?ptMt6jdSFLRGJIPChy56Y7O0YDT2R7aojKMFFjI9kY1004Wf/IOk9phTinmQ?=
 =?us-ascii?Q?N2YD+X2uksVGMylo3PHCSEW/xFbEUnns4mpWPuZ7LorRrNPo2JDqlgVsmdBD?=
 =?us-ascii?Q?ayedAKtTNFPCDBMab26T4qIce8HsLwEguu5OxYML+qb7UP3OjkP8wan+SADJ?=
 =?us-ascii?Q?ENaMDQP3Yo6WlIMpicELiuUDZL/qmHftsDW1fQfmZXSiI3zCweRn64sZRIWF?=
 =?us-ascii?Q?ucRZap5dGOT0OTXKVEFKZ09ksI8pFSxVTbSPlagvzZuxvhLJQ4fO9HDEixut?=
 =?us-ascii?Q?INp+h0cRR6Qi3MRQwJoilI2nXSxGU32csW9JsSOeavIAU0OkAi0ppObusHDw?=
 =?us-ascii?Q?EdGuJ3FlCL4EBoWmKz2zOdO7Tt+n1g92Df51Uzw+qxRZDDiykz8RBJ8VHdPe?=
 =?us-ascii?Q?YwBqBxG3iXSlcpbDNDl6bNS5Wkqzthb05Xs9Lcray7S/Bp4V6LjGR7jnr20u?=
 =?us-ascii?Q?OFJiLClvOsUv1sL/DqXnA2ya5vwNwZPFaW8DBn6cr3r9blABTmZv0aV1KVXT?=
 =?us-ascii?Q?4dpmSh42gvdzAqMdJjAJnEiy4AWMz4NCRod8A3e9XsAllf+qt20nsNG6yvZn?=
 =?us-ascii?Q?MIcgP9Z2yfZiFnXRh3pVCUDiD8x9afUcKWj/bbdkLhS+CIOKx+0Fr9csOJKg?=
 =?us-ascii?Q?RhfoQdBt42SWgK0rL9w/sWVfKw9U45eZnBrrhuKTahu1XU4Mpust3rAqVVOV?=
 =?us-ascii?Q?Vd3wvVrPo0++wG+L0aHnVykZ2UBYDcm8hqdQJ10bZC41FzGX/JN4vgMwP/Ss?=
 =?us-ascii?Q?8ZDYXTJy9HhxfkPL2sTnXx7XdsCauI9VXw21Mn3iTzC67A5LUhJJ/NjcOFNF?=
 =?us-ascii?Q?CbbOKWW+nsObzOSaO8WKxG83JBCK/N+hwHe1Pp5K8JKtkU4BfM2b7I2Oo7/w?=
 =?us-ascii?Q?66Ndi/kIKB3YXFjiJ6fkxZlRpGblAONn8PU7+6Dd7PCoR1sR/ZN6E6/E+Zta?=
 =?us-ascii?Q?UX9JQ1g5fCaMdb0SOI54WI6n7MEEjt8QNcLiF0p+CCfWcB8wOFSP0R3ZYxqP?=
 =?us-ascii?Q?8uzPGu7WRQYgAsTorDGefeqdNvvj9SOBBW9OkJ31H8I+xaDxquWVb9MQgcj+?=
 =?us-ascii?Q?XEN6F8C/lS1fcm7j+gp1PE6o0/SwBSRByA31+crA5AGYXNwl3zG5Afs8uX5+?=
 =?us-ascii?Q?JLEfLIrD7tfsbho9RuiTPN0kWrSXuxEQ6XmkDsGm/fGF25Fse8/N6tq+UZZu?=
 =?us-ascii?Q?D8aqbrqa63duzEMGWXSLNNr/7QUBpQzfLLiQZPWVRJ/2AUajLa4EdyzA9Uny?=
 =?us-ascii?Q?PKoncY1BhPh6V8Ej1CMGrhHudNHoUTVW6BN9f9flf9VFO+h9GWf2m9HTqom8?=
 =?us-ascii?Q?XXV/0/dukl4wsIrCRT+SkL8ucTm068mugq4KvhC2hRRR5IgHNsqMw+HL1QAJ?=
 =?us-ascii?Q?4KgVyErWNONyLQZOaFIvsvVoUE5X3HN/wGZIhBes7pY/3DuNirTRq0cox2S4?=
 =?us-ascii?Q?EAocqi/DiQ6lWQBRWUk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y1PnHfJSP9BCP21Ayh7T8uEa9NRlAJDpVw0EknkQSWboeYghlUWgx8yH/Pd3?=
 =?us-ascii?Q?BG84tB9nqzHA1ITx84IOZEXcYFd1bvMyJUinoD+QQn8qA7TjslYSJlqbUN6B?=
 =?us-ascii?Q?aEI0NzNLOrPv1Sr96jbj/Uo2A2IYmx9EBqBps8G+d+An9Mnv7vV7CEt3jGXa?=
 =?us-ascii?Q?gPr9np+VuQfGORShCTRXrXsmEcQI4R9qz2k8t8faxs2uqvXlleo9kVQiFAXA?=
 =?us-ascii?Q?ZkJu8pKfgYnQgTqMF7iQGk9FpeRQxWRM7hMso69VSgNngUd4xbdQ5mNCLNXP?=
 =?us-ascii?Q?nbtXG9QyyFzbCdSgHqyCN0rsl0KthbdRf0R1IM9ZpLh3CNWFoR6554Lti4qv?=
 =?us-ascii?Q?sbvPOYDOwHUnVGxX240BIFTyAyrjB27M5VJyL/CxgJtx2geXkhO4YFEIJKap?=
 =?us-ascii?Q?3A/nmLBag1KuY7DZB+cQNWcQtvHPMSATLJ4YYZtDV4IZgAX6R+6zu0LKPSxO?=
 =?us-ascii?Q?mjDynAtNcdosS7K3f4BHpZmiGiXw5VS1SOll7ZqsyB7u+jPnTbW9nVL4R6P9?=
 =?us-ascii?Q?/1SLkmt9pRwNEKrUpaz5q2ih0M45dT+N0pz01NCw4x+/Csc1cb65UzkDZfXJ?=
 =?us-ascii?Q?26twb5sXetHcgehUilLTRgqTdBIygZm9WkyaP89n2eCBNui7MSTAj8Y5PvVZ?=
 =?us-ascii?Q?kIG2X6L4UTQU0HgInWO4uYTRX2aQLQs9Zx8SuX4qtYZ1F+L3UosRkDS+fFho?=
 =?us-ascii?Q?ykl2RMXypXtbr33+wLoYom1WPlDLl9wCcK+CttLnMW2ZVTg7i+DTqkyIHOXE?=
 =?us-ascii?Q?El1D28H12nFLJpsUO/LKtVXjCo0IDoRwrtbZOQbUCB4sDCM1GFAGz7n6OFRO?=
 =?us-ascii?Q?naGviCmxfYnPbJLYQ/EnxVWLdJ9redHbxQIlKv1IMICX7+0gN6/UfTXBoUif?=
 =?us-ascii?Q?bPhajxw6+a3Vk9yxGLuxRHBsK29zaOX9Xe5FCI6Sp0DjlCg9vapHmccrNR+s?=
 =?us-ascii?Q?JU8ad8/SHqSzOzd8fRAbLDVIDpM3MU97Tz7AupDYxaKk6qKceOhnQvm5sPVL?=
 =?us-ascii?Q?f/BmlPZsw121mkDTduA+7Dip9dDLR1IsKpPm6X32qHXoKaC1YrRetBwbfkaO?=
 =?us-ascii?Q?3qom/ESyjYwJpDpt1cTbCUpA26/rTHWAgbja3lWo8Efo26RvBp0dt+ZGkwOp?=
 =?us-ascii?Q?EgLNqJy8t3Au7XdvQF8wMku77BGYqHsfcQJxetMFAc1uSKaouK7mm7K3dBb4?=
 =?us-ascii?Q?WHCGhKMXczT5N3y4GSchDrf/7h6ZjlufOtmmbBwAmQuWN6bunYLCFdWLCpMt?=
 =?us-ascii?Q?ZuRvry3a4Bq1AU0joMg5vt4pztIY++b7SgZ6rw9zTYYnRCdBtesL5SUB2dfc?=
 =?us-ascii?Q?2rb7dzm+jSELdVeL1Zhy1riOO1bZilJfbU81RjFGvIK757t0/VuvbYvY8dME?=
 =?us-ascii?Q?ilDIsxze9LIUcLTAGmK7j4Qn5VVw3Alrure9fh/ZFNs9C8Eo7i7nLjamAK64?=
 =?us-ascii?Q?YZwaryIb4OIgpvCzdUJYU32YvSYkq/l2NtnEgMNAqX0lDuDSLckAed0frkj/?=
 =?us-ascii?Q?xAun6ItELIfqUhpTG++3S62nFdE/4/Bsb0HHLRuaeocOqkGO+ZEq0jVMIkKB?=
 =?us-ascii?Q?Gqcs2Q7JQP01JvNR4ifpem1/Ln7fkvN8/XhVOH397AmPqvyay/PDHTi2Huyi?=
 =?us-ascii?Q?NFxO9lyiOhDK4nY65LqdvP7eQA8dOlcXf9QgdEhZ8c8XkRc2TRM1RWWAZySf?=
 =?us-ascii?Q?r5USodOmJsMs6gbE6Q0O+qHfIMI23kTs+xlb54SrcHj7HMRtRK6a7GoMYGyb?=
 =?us-ascii?Q?pidH0ZJ3mg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 886673c2-6e71-42d2-7863-08de6fc55ee8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:44:22.5513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zfNBjzFwKL7m/u1/LkfHDPE3bv49F/LtcxIa9BAlUePnxYkU6eJ7gCsG1g5jaiCBTHsNcH1snifcxgajjqMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2583

On 2026-02-19 09:12, Alice Ryhl wrote:
> The 'static bound is required by all irq handlers, so it is simpler to
> specify it on the trait declaration instead of repeating it every time
> the trait is used as a where clause. Note that we already list Sync on
> the trait bound for the same reason.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks, this is much cleaner.

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
> Follow up to:
> https://lore.kernel.org/all/20260214092740.3201946-1-lossin@kernel.org/
> ---
>  rust/kernel/irq/request.rs | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> index 
> 2ceeaeb0543a4ef0d4f25ca600dc4770f97085c5..e207707156094b1bbf1af0292cff8ed27ea64207 
> 100644
> --- a/rust/kernel/irq/request.rs
> +++ b/rust/kernel/irq/request.rs
> @@ -27,7 +27,7 @@ pub enum IrqReturn {
>  }
> 
>  /// Callbacks for an IRQ handler.
> -pub trait Handler: Sync {
> +pub trait Handler: Sync + 'static {
>      /// The hard IRQ handler.
>      ///
>      /// This is executed in interrupt context, hence all corresponding
> @@ -45,7 +45,7 @@ fn handle(&self, device: &Device<Bound>) -> IrqReturn 
> {
>      }
>  }
> 
> -impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
> +impl<T: ?Sized + Handler, A: Allocator + 'static> Handler for Box<T, 
> A> {
>      fn handle(&self, device: &Device<Bound>) -> IrqReturn {
>          T::handle(self, device)
>      }
> @@ -182,7 +182,7 @@ pub fn irq(&self) -> u32 {
>  ///
>  /// * We own an irq handler whose cookie is a pointer to `Self`.
>  #[pin_data]
> -pub struct Registration<T: Handler + 'static> {
> +pub struct Registration<T: Handler> {
>      #[pin]
>      inner: Devres<RegistrationInner>,
> 
> @@ -195,7 +195,7 @@ pub struct Registration<T: Handler + 'static> {
>      _pin: PhantomPinned,
>  }
> 
> -impl<T: Handler + 'static> Registration<T> {
> +impl<T: Handler> Registration<T> {
>      /// Registers the IRQ handler with the system for the given IRQ 
> number.
>      pub fn new<'a>(
>          request: IrqRequest<'a>,
> @@ -261,10 +261,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> 
> Result {
>  /// # Safety
>  ///
>  /// This function should be only used as the callback in 
> `request_irq`.
> -unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
> -    _irq: i32,
> -    ptr: *mut c_void,
> -) -> c_uint {
> +unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: 
> *mut c_void) -> c_uint {
>      // SAFETY: `ptr` is a pointer to `Registration<T>` set in 
> `Registration::new`
>      let registration = unsafe { &*(ptr as *const Registration<T>) };
>      // SAFETY: The irq callback is removed before the device is 
> unbound, so the fact that the irq
> @@ -288,7 +285,7 @@ pub enum ThreadedIrqReturn {
>  }
> 
>  /// Callbacks for a threaded IRQ handler.
> -pub trait ThreadedHandler: Sync {
> +pub trait ThreadedHandler: Sync + 'static {
>      /// The hard IRQ handler.
>      ///
>      /// This is executed in interrupt context, hence all corresponding
> @@ -319,7 +316,7 @@ fn handle_threaded(&self, device: &Device<Bound>) 
> -> IrqReturn {
>      }
>  }
> 
> -impl<T: ?Sized + ThreadedHandler, A: Allocator> ThreadedHandler for 
> Box<T, A> {
> +impl<T: ?Sized + ThreadedHandler, A: Allocator + 'static> 
> ThreadedHandler for Box<T, A> {
>      fn handle(&self, device: &Device<Bound>) -> ThreadedIrqReturn {
>          T::handle(self, device)
>      }
> @@ -403,7 +400,7 @@ fn handle_threaded(&self, device: &Device<Bound>) 
> -> IrqReturn {
>  ///
>  /// * We own an irq handler whose cookie is a pointer to `Self`.
>  #[pin_data]
> -pub struct ThreadedRegistration<T: ThreadedHandler + 'static> {
> +pub struct ThreadedRegistration<T: ThreadedHandler> {
>      #[pin]
>      inner: Devres<RegistrationInner>,
> 
> @@ -416,7 +413,7 @@ pub struct ThreadedRegistration<T: ThreadedHandler 
> + 'static> {
>      _pin: PhantomPinned,
>  }
> 
> -impl<T: ThreadedHandler + 'static> ThreadedRegistration<T> {
> +impl<T: ThreadedHandler> ThreadedRegistration<T> {
>      /// Registers the IRQ handler with the system for the given IRQ 
> number.
>      pub fn new<'a>(
>          request: IrqRequest<'a>,
> @@ -483,7 +480,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> 
> Result {
>  /// # Safety
>  ///
>  /// This function should be only used as the callback in 
> `request_threaded_irq`.
> -unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler + 
> 'static>(
> +unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
>      _irq: i32,
>      ptr: *mut c_void,
>  ) -> c_uint {
> @@ -499,10 +496,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> 
> Result {
>  /// # Safety
>  ///
>  /// This function should be only used as the callback in 
> `request_threaded_irq`.
> -unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + 'static>(
> -    _irq: i32,
> -    ptr: *mut c_void,
> -) -> c_uint {
> +unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, 
> ptr: *mut c_void) -> c_uint {
>      // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in 
> `ThreadedRegistration::new`
>      let registration = unsafe { &*(ptr as *const 
> ThreadedRegistration<T>) };
>      // SAFETY: The irq callback is removed before the device is 
> unbound, so the fact that the irq
> 
> ---
> base-commit: a58b8764aed9648357b1c5b6368c9943ba33b7f9
> change-id: 20260219-irq-static-on-trait-5b267c7a4375
> 
> Best regards,

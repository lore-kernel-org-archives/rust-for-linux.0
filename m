Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020117.outbound.protection.outlook.com [52.101.195.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605501547C5;
	Sun,  5 Jan 2025 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736103844; cv=fail; b=rLP58oBrLHPEpaNwVDqIbdxvOTMjVM7Mmh+8yMyFEBvsU3yKLEPnE270xm0jn9UlBDcJQZkR2XQKs3Hrq3pt7hl6m5zDkJTEwOkH8qBCFxY9vOkkDQN9N8Th7OZc4s1H3yHDyDaVlNg7Z9kfd3/qSC6U1NuloHXc74EUgnFPvKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736103844; c=relaxed/simple;
	bh=PRi/hFpn8lUpJKu4uAZLSeKiq/0+dhxHzPvo10i2Wvk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e8HX9tbSiMn5oyZXWQAMJkyZd76fapX8xXAglP1yZlBeAwzKODSEmAKg1b+0so70aWKPv50j29Qn60TEb/J66siBksb2xJ3HEDtF54LmLCrhjqk4Bs6pE68MBVvfyFcHJ2NWrubniEbc/w5xZCriHUz0eAXdA9TcTM9Z67nGRX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=i3hJT1kn; arc=fail smtp.client-ip=52.101.195.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="i3hJT1kn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX9LYx5Q1vPHG5mHDAgbfrH2TU/GmmSHhpa9jKDe97z6a+bXSbJAWsGOlJfaazWL8qO/xhBovJLRQ8lIfS4z7fj6ezCgmFVkV0EYKf6mRBwmTwL8V0PnEv5LeQ1OiAtR4i0mxO/Zac3LvbzIkcVCh5U37D6ONKiIrTUkEGd40pLE0JiKelUSXqCqxgtIXl5xrP6+gjNr7QT8r1PoxGpYIGf+TLiGExVA/Lvgts403rW3i2oIKle8TXU2+4gRklX3hfOm5CypHcA06/M6CUnQC7WsL55kr4wvos2YTfZofLNxTebWz9Q1YqifYnC8b2bxJBRS6cN3bmqcbtZFXeKISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ6CFe00jzxOU9EY8US5HBCtUGPazYQYNnQKwOVxedE=;
 b=K3k3DvA2VT8rA1HRsTeXCyUJBLpXtvZcTmxZywBAyYgJy+qpsVBpYcCc2zvUn38d98QrvBotzfaBrWBJJ9llz6jYo2KGdp7fb+uL7Lq85/vAgzPpsl5u5/nAzX/PN01C9PxfC9LtqKyDvvuR+/RyAgXmDHUeWr1+6WxpVm9bMDDMRqwl9DeQjZcKZcVuzo6Q2j1BiGrAKDG60tcd22aRBGht8j0YJBAyAAApQEYRLpR0pTAav+WwAzUrjnjmLwk+/vtg0y05MUA9uS3tGO6ZcVjNOtLniKeGRE9rVq8n3SXnplm52EH4jawrnpPbp47nX2yzQzcnVtmAjNdWGCFkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ6CFe00jzxOU9EY8US5HBCtUGPazYQYNnQKwOVxedE=;
 b=i3hJT1knWhKRL1Zv9yVVilJkR0nZyMNdl8jG2P2vmywHniyFV7IKmGt62H/Ap9nv7l6WQfCDSL/p+fgROP3GcmD2ITcJc9Cr1FPhMWb492RDAXS12lWOVlaJ3mKXt+YPKG6c0vAYCnyLUs5WPWeOSQTWaaG409+rC+6++6MJdIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB7384.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Sun, 5 Jan
 2025 19:03:55 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 19:03:55 +0000
Date: Sun, 5 Jan 2025 19:03:39 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <20250105190339.21bc1558.gary@garyguo.net>
In-Reply-To: <Z3gXPT1HFBYpAiGz@cassiopeiae>
References: <20250103164436.96449-1-dakr@kernel.org>
	<20250103164436.96449-2-dakr@kernel.org>
	<Z3gXPT1HFBYpAiGz@cassiopeiae>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JNXP275CA0023.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::35)
 To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 87409d62-656e-4e8d-f833-08dd2dbbb38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z+jAlHCiOyH0lukPYHpxlglWQ/3olsFgCzCPnZLy1E1XYrgB89tJ+z4mFbxv?=
 =?us-ascii?Q?Icco4FBzbWBkNX3MslmyY9G15whsQLZOb/9QG09QKQB3fGVOcWX1X3syZ/Od?=
 =?us-ascii?Q?barY+w19G/bVubH2VMBJC7SMwFNebmhd78vtA/XeoMkcgC7pVj7ntrz0cvZ9?=
 =?us-ascii?Q?hoC3oRVcLUFl7iipWpgtxjr1K7/Mc3j+r2jIMX+mSVtldi3gP4iH4yEs2pJC?=
 =?us-ascii?Q?ekE8b6ydBHmdAXsUrf+nsH0c8myGGpvadm97gKC2GeGeJbFmt6zotIyx8km1?=
 =?us-ascii?Q?cge2n4NOHDxCfQOvDjviVC/Iz/XqA7U6GG8RNCB67ehzFCnzA11oAoZbIBZ7?=
 =?us-ascii?Q?cf1forBB28ZqFlUJNxY+N2nppy1K5G62vaHy12xjBoQdEnDBiF+/7XA7Rsot?=
 =?us-ascii?Q?4xyVaHA06GWBgVthIEN+Ckp6/LDD4RwOKP6n59jLDbp02SDHRxmTzhn2+IyJ?=
 =?us-ascii?Q?nrzkO09vEoeOrvb7h1+M2gDD6IZ5pjNHpTXaOqC0k7eYW0t/DYdSk69Lz0Bp?=
 =?us-ascii?Q?oYjX2KbV78IuefoW9rCIdnu0q9W9Gc9Nr0ENLBFxIa0qs6Tt4N0c7UETCda+?=
 =?us-ascii?Q?9UebWnEmayqQBqRQR1v4bN/mJyq3X0ugC6BTjw9Gifi8Qtcj1E84/vkJ/o6Z?=
 =?us-ascii?Q?tQCoP0/3BMXs8pSqZ/jilr412mEXZ7bVYKx1+YIgCafSBhMTB3oyVb2Nhxt0?=
 =?us-ascii?Q?KcNLwNlpNSOisfkU55xllnDkh/o4qcwY7q1yoUqVsbIjSQ8g3tHPuot5UN0W?=
 =?us-ascii?Q?8gT/hWnvJz+GUSNJAn+s426l3DxxAHCXN5C5DJBD0IDvdTOvPe2sad7U8Vhu?=
 =?us-ascii?Q?eDuWQyu3M2/dxgH8g3mm+SGG30zY4LSmN538mbzVuKGeiY4gokX9umUMxUlC?=
 =?us-ascii?Q?kG1VR6v5hpk8461bOtD1lT+k0PO2e2Dc5WPX5HZYREm/PbvXSZnlVWXTVJ78?=
 =?us-ascii?Q?zdA3QL1ETs/TsyHuRc/ILF3t4RQfIT6FUSXu7CBsCA4t0zDB7jhlg8k64Sht?=
 =?us-ascii?Q?EXxkFpdIB0QG9AJHCp7Jgwstp7jZlIih6qat1iJP/kW12rRN+u2O2xOD0toQ?=
 =?us-ascii?Q?c6G2L/eOOh9RcY7LBwo71F0l17QL3REddnEMVX+NvysnUddtOE797VfggAqT?=
 =?us-ascii?Q?6CU3syi4wwvfCs9MBcHtJx2VHIUunhlfXm0wyW44CWaVW4GrVzPN7/0W5Nuq?=
 =?us-ascii?Q?eJLDsAn1H3d7o8E1X0zAgOCpPA0app8G3tOgTY7srrZyIAbFIM1SahaUXVq2?=
 =?us-ascii?Q?HgdCae29EDCGRBMgmWhRp4SdVYUA8GA2E1zIga37jMkNJ/uhnx8VgBOlUskj?=
 =?us-ascii?Q?Kq8mgdGL+jmXeU4roveL8L51DrG0/OKPl4n8Zt/0yENCDpciF8WtsibGYGQf?=
 =?us-ascii?Q?mJsisgwgQwrshHJk21UX5OfVaf+d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8a72KfsVZkOGX+FICVEm34rsRVB1emUcR3uom1zDzvhOWZ5iqrnU2bZ1W2GE?=
 =?us-ascii?Q?4G8JDuQUFRwVaYziCobcKAoGgxyoOBSwCnAlUrN75Y1e0tZry4seoaCcIz6y?=
 =?us-ascii?Q?1U3h7sPkPNie4ML4kygfRjRwrXXWGLRUQXOZbaRGKfZfr7EywEhfOE7PyUcL?=
 =?us-ascii?Q?x1K5GY+lJ5jojt7zhje5M7buZHb0byJyhYOCa2L3WDJnJs/b+7YqNbNPCKli?=
 =?us-ascii?Q?GGtY4ysP3kjl5GG8FjftyxsWdnWFbFNuOH54noj56SsyAAaL1ajeqT098nrz?=
 =?us-ascii?Q?ITydVtWzGD5QpdJ+3ZTzAOIp1BKnjZXqdXKiKyk9T6H0dOE7j9f8N66/WBzH?=
 =?us-ascii?Q?RhT37LZIQQfWTctAob0yl1s2t/55abuCzSYCM05VpEYh5Mimqezo+j9bInOg?=
 =?us-ascii?Q?IrMLW1SFksW8ezMJezi1KzZw0mk4WVUOi0++0zeg7xKzLM72Sbf4Q60lCdwu?=
 =?us-ascii?Q?c0CYXZCZ610KTrmI28TnQqWNBoz/Bn/G04YxzYOyM39qtBNXyXTBQysxKXiY?=
 =?us-ascii?Q?ted4xu2CsD/AhfetG4fJdaX1Pe5XB8IKqN1jmiL5N0YE8IyWOZgNN8kihs4E?=
 =?us-ascii?Q?nf6jq+8Tk2rZ5iQQCjuaH+3xQT5FuTNauOuhKdQaOZE1qMVd12FYspLALh/v?=
 =?us-ascii?Q?jIDXM1GLuV2YSm5cHO8hDWI2JQHbiH7ZNa+uodU5YHTDvMMYlPP954dvm8K2?=
 =?us-ascii?Q?TRfNZweflxYBR/yMuDhtl5B/++YmL8hd9ncnUnQpE5xCJflbfE7v8wJFpeIC?=
 =?us-ascii?Q?0Bnlq2Q4Tg8LY4RLZbuS24h+xcufW7RJvYIwrpARgLOze3n8Gmew01DxMZif?=
 =?us-ascii?Q?ER72/BSRsYDGc47yGcgk+mMVezh/u10PevmSqvvQhdsw5nQIB7Na3qwPwolo?=
 =?us-ascii?Q?kBNz901S5kfDgQEnnOXpaLbE8Y8qai+MhZlYLafT3/epCGAhh+mT8dX90yYx?=
 =?us-ascii?Q?M6oq2FarTrcQ4qp+lpryB00Yt52vjlXOa3v4dSVXJem17EP7K+F48Znwth25?=
 =?us-ascii?Q?X16XPOnnLjKYiigzep8WbjtO3PY63Sn4xj53VYnCdL9m28DkaM/0fpBjAd+I?=
 =?us-ascii?Q?Xb5QPKjPweffZMYUnNIruPRA5WOmymkPdbdzg5QljHLdCuzDBLBQOSABRy3U?=
 =?us-ascii?Q?yzvNuP21bnXvjZxZsCRLaBuwWlzZr03xvG3RgjfanY60v1+goLO+lE4xIh9P?=
 =?us-ascii?Q?Y1n1pxuN/uBSumDEOvWQV+Nw504dAZ0RiDrcXLx18JwhGG33gYPsmHOYgba1?=
 =?us-ascii?Q?kfszzmjx3jmjaK5mT7UzNPBSpzi2uctQ7iG1wkIQhXDnn2xVqowlqlCFlead?=
 =?us-ascii?Q?Ux3mXNzJc/XpQuoW8S7/4KcTxuM0wnKL9kBS+b3DlLeIjgWt19uq8bGFj7nz?=
 =?us-ascii?Q?GK+gTTmBmjdyavrq5rqvIUPCFlQQVk8FUO5rSD0r/WHmE8EUbrb7pll30Cv2?=
 =?us-ascii?Q?o7lskvUJTa3bcpyL8gP/8Wl1M6VxhQ7RiZNRSBbAOjHwfBIIRbHHslPp+FTD?=
 =?us-ascii?Q?/4ugaAt54aV4Kfz6PHsGe0ApTZgeINofqO245djKihv1moFEk22SyZTWIIEF?=
 =?us-ascii?Q?HK7RJg0HsCxLldpjaMS8LZr9JQKQRNjyT4OyNWOLHIUAVkqcCL3CVbbsOkau?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 87409d62-656e-4e8d-f833-08dd2dbbb38a
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 19:03:55.3611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p5C7Yvs84IL2Q6d9xLgq+DmR1invYGfJ57Q6fD4ZOACp2AoEm3KZ5C3EQhU7S5gvwJqP/BUCQmYV2BxaNIbKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7384

On Fri, 3 Jan 2025 17:58:37 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> > So far `DevresInner` is kept alive, even if `Devres` is dropped until
> > the devres callback is executed to avoid a WARN() when the action has
> > been released already.
> > 
> > With the introduction of devm_remove_action_nowarn() we can remove the
> > action in `Devres::drop`, handle the case where the action has been
> > released already and hence also free `DevresInner`.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Hi Danilo,

Thanks for sending this.

Feel free to add

	Reviewed-by: Gary Guo <gary@garyguo.net>

for both patches with the `revoke_nosync` removed as you mentioned.

Best,
Gary

> > ---
> >  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
> >  1 file changed, 44 insertions(+), 12 deletions(-)
> > 
> > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > index 9c9dd39584eb..7d3daac92109 100644
> > --- a/rust/kernel/devres.rs
> > +++ b/rust/kernel/devres.rs
> > @@ -10,15 +10,19 @@
> >      bindings,
> >      device::Device,
> >      error::{Error, Result},
> > +    ffi::c_void,
> >      prelude::*,
> >      revocable::Revocable,
> >      sync::Arc,
> > +    types::ARef,
> >  };
> >  
> >  use core::ops::Deref;
> >  
> >  #[pin_data]
> >  struct DevresInner<T> {
> > +    dev: ARef<Device>,
> > +    callback: unsafe extern "C" fn(*mut c_void),
> >      #[pin]
> >      data: Revocable<T>,
> >  }
> > @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
> >      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> >          let inner = Arc::pin_init(
> >              pin_init!( DevresInner {
> > +                dev: dev.into(),
> > +                callback: Self::devres_callback,
> >                  data <- Revocable::new(data),
> >              }),
> >              flags,
> > @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> >  
> >          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
> >          // detached.
> > -        let ret = unsafe {
> > -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> > -        };
> > +        let ret =
> > +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
> >  
> >          if ret != 0 {
> >              // SAFETY: We just created another reference to `inner` in order to pass it to
> > @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> >          Ok(inner)
> >      }
> >  
> > +    fn as_ptr(&self) -> *const Self {
> > +        self as _
> > +    }
> > +
> > +    fn remove_action(&self) {
> > +        // SAFETY:
> > +        // - `self.inner.dev` is a valid `Device`,
> > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > +        //   previously,
> > +        // - `self` is always valid, even if the action has been released already.
> > +        let ret = unsafe {
> > +            bindings::devm_remove_action_nowarn(
> > +                self.dev.as_raw(),
> > +                Some(self.callback),
> > +                self.as_ptr() as _,
> > +            )
> > +        };
> > +
> > +        if ret != 0 {
> > +            // The devres action has been released already - nothing to do.
> > +            return;
> > +        }
> > +
> > +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> > +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> > +        // this reference.
> > +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
> > +
> > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > +        //
> > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > +        unsafe { self.data.revoke_nosync() };  
> 
> With this patch, this shouldn't be needed any longer -- forgot to remove it.
> 
> > +    }
> > +
> >      #[allow(clippy::missing_safety_doc)]
> >      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
> >          let ptr = ptr as *mut DevresInner<T>;
> > @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
> >  
> >  impl<T> Drop for Devres<T> {
> >      fn drop(&mut self) {
> > -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> > -        //
> > -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> > -        // necessary since we don't know when `Devres` is dropped and calling
> > -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> > -        //
> > -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > -        // anymore, hence it is safe not to wait for the grace period to finish.
> > -        unsafe { self.revoke_nosync() };
> > +        self.0.remove_action();
> >      }
> >  }
> > -- 
> > 2.47.1
> >   


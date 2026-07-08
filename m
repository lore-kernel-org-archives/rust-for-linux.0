Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACE409289;
	Wed,  8 Jul 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526093; cv=fail; b=uJcOoRd5mShmu7m/GerfN133I5Z85Px+AyxMMVFxtkVQaQ0tL1PjYZMUL7Gf8KW4uBshLuNAFo3Mb0Y1OGfNLI7w1TCjaafMxnuuNVRp0+jr2mcRi36gJ7ySBkz8DQb52cg2fUjOSEZPpbg4YaN7tPdt5DvvV4LVmOTE5fKrYl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526093; c=relaxed/simple;
	bh=SOMMlRsp/wNpPnsM/9B3uKfx80OdzzL1oAlEOavXnx8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAHi7FoG1XT0X3JSusfk5tt/Y09jtykq1PcAI5ar4iHyYFZD5iz+RBstaNgTtNl8gXMLZcYKX/ftlB3zMRAJFDBUu0ApwNtSuiI4coe2ED6wWYE8QhdSAJ3Vx1ET5mMoGfBNpqNKmbGPVR3DA5E0jFYog5Pujojjo9rgAL7pGHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gqq21Aoo; arc=fail smtp.client-ip=40.93.195.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gqq21Aoo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFwwcc9rv9gAhhrEJFVwukukDFgWGPMIlO4tRa4DLuoa5o1ZIMJS+D8z/cwHRH19AdX79mtKTfXMILkgrxVT36rkTzmodMXPIn6yEkiH41bYaYfXmA0ajbUf9TtSOWX/nA355Dp9BDviQr/VRHR9JU/5rULNK4mvTICCb/1gFVzio9tQHIkP+4oklRaqL1+lFhFuUcHExZCvECac2wAWq6tbYNppgp4n/9Y4mfm6t1FXddBea0hgB7Neh2RRKbWA5R2GwT+x5eJjoARkONxNBCm5yI21A8hydpsjSxsGIbg7IoUW5w7ruQvuzCbW8kMwitFIdUO23DansWHJAyRAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pd32QsomrUlVShbXSfD8kuz2tqc9su+pwUaOW/ZSAI=;
 b=wONuyuU4BxTj3pnmL2X8Lq8zYSbWwPezR1n3IiHHHBrmqK3fHq38/aShIgppnKzsgNmFXsU3hjzZGfRZlyXtkQCOSF7LnJnos+UAAHuOI4iwllOV0/Is/4SZC1dCTFjUvizbkHSXypTOCpScBaTUAS0kN7mNOxr7TRuj9HoAUX/xPMyIPMTjAvCCalR/tke1LBsupREpW3vgdnHp74tTyVj19Y+Vyd7GQDQB4FO99Z/XI/ecyHY3s+TahCoQsBAywfG69zwmennyfsjgJQsQIpDY8RAdZDSLhJri+K4m6pq3RbNAkfjydb3vnS/n0nVw73LWAdySvHovRFQSYc2eYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pd32QsomrUlVShbXSfD8kuz2tqc9su+pwUaOW/ZSAI=;
 b=Gqq21Aoo7uUf7OfEfzgYZteDuemX3r1ajoeSrklDv7Fivo9r99NyhiREkBjmuszOCPYgQfi0ZdbOyJ5omOixG6VOf/hBcSdVzZ3noHzURW3yOOSvzpu7fpDeNSlVeJY9hGZlV/BS1nLTif8g0uGhhIaqdKp0eJib6L0TiZfqio6jx750BVFy1BcYc6gcuGE2TyXLuXMDCZjW131UWZm+IQQwhGcMtTMLPjjG4MYG9izGq2I1U7MO55KgpywX3NTOc4QzIbzQpD0Hz8GzBqdGinaNTeiH0ChRbS7S1I9cpmXmze6C2qxgB89jbBHvJC6giw9n3djw471jbZsaOObxYQ==
Received: from SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 15:54:36 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::5b) by SJ0PR13CA0074.outlook.office365.com
 (2603:10b6:a03:2c4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 15:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 15:54:35 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Jul
 2026 08:54:05 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 08:54:04 -0700
Received: from inno-dell (10.127.8.9) by mail.nvidia.com (10.126.190.182) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Jul 2026 08:53:58 -0700
Date: Wed, 8 Jul 2026 18:53:53 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dakr@kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
	<saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
	<joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
Message-ID: <20260708185353.2dae54b6@inno-dell>
In-Reply-To: <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
References: <20260629150156.3169384-1-zhiw@nvidia.com>
	<20260629150156.3169384-2-zhiw@nvidia.com>
	<DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: ff708d59-94e4-4caa-2b8a-08dedd0935c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|13003099007|4143699003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ycLXl5Ivdg6kZA6NA8uW5kDvqjiKPxFmloY0UmqvDNSw63IU/qcKF/2M/mOJgOwZiMBLXF1b1cgkzjcVDZQWkaFNosrAejHtCflM9/EISs/QZWnWBsgzVRFHT7TRv2kmTQ3yDNJ7zycbq9qvJHrKpkrX0Jlc79USyWIUVGa/u6EVziPyR9mc9KNw31k7B5rQnSpQzwRHxEWWa29+0AqAPC/cX66a+STPybNoYDekf315WGazxXZZ36X3bFaFbOz6cQGu+wMq6c7bg3e1V8y9RV7lDJx8h49fLJTwR8ZCsLj3qxSUX4vTuddkoKFdXCQwKr1G87w+BuesT8iPRNCSXcWPLBg2Ta7VvnCZcJLSLUjnxVOGpUZzIX8Gj4Dm/gQ8dyBndORIFJkljn2S16ZtPD32XCTKky4xgKU+JvuHLevSzlYgxHPtzJZCPf0M5IJ4BLLd/0TDyF/5zpRiTvDDQkD/HB2L9sZmzX7TGgDh+kUe7P5Zx17MXFRDx3YzVI0U1bnyyxsUwlPtfWCbWwJSVxsh/7GahpfzyObExivJqn2tR684DNv4ZAulLL6hqW77/XpAI+FwI6gzX0yyHwOsGi+YSrH0EV6Eare3xQ2Y2M7d4cTwToaypF222IpYvQYitVQwCWiuq3oDfvGFHrjLcdJqoDW1Ie7gpbNc2EDtO4Pq7gp4UBKhdiFPaFcZCt99nkFNLHr7VAfHeCqoPp/11w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(13003099007)(4143699003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j7BkQn7wKwZIE91EqhTBqrCqwHrX7ldpd76S2CU6TskAI0ud9GYh9m7LGa8MWFMkEZve3u93hykG4ErFlUfA7za6uML3XmT6gemGDqZ3mc2kxpGBHGQEnLXrAhJ670pPaEH8ntI3aPYQpLX6lYacXyqW3f2KdrlnG7MKBW6PIZlPwreGs2eDY2Nvuy6ccLqQIbao9Wz2h8zpo7qN4N8nwaenFo4MiPGUWmgPSMfA7xZu43HrZARkgzQNbQWbz5eVarU7Kl3Bz5uoJSrDTxxwNLjD4rGUN7Zm1vHJk4wZhS3UR/YdAfMaH2PIH/tkJazGWbOdmS05sLh1j6qx5DPt21EwBggvzhoR9sICw6ikiyUba1OkHFHqnYFONdf800W5gseXfnP/La/TBmWtlwmmrZRrQcjwZnouDjC0CSyY62AfJKREtZ2JykyMOAClgtHC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:54:35.8913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff708d59-94e4-4caa-2b8a-08dedd0935c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

On Mon, 06 Jul 2026 13:19:17 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> Hi Zhi,
> 
> This is looking pretty good to me overall, a few remarks/questions
> below. None of these should require big changes.
> 
> On Tue Jun 30, 2026 at 12:01 AM JST, Zhi Wang wrote:
> <...>

snip

> > +
> > +        // INVARIANT: Set `registration_data` to dangling (no
> > registration yet).
> > +        // SAFETY: `this` points to the allocation just returned
> > by fwctl.
> > +        unsafe {
> > +            core::ptr::addr_of_mut!((*this).registration_data)
> > +                .write(UnsafeCell::new(NonNull::dangling()));
> > +        };
> > +
> > +        // SAFETY: `raw` owns the initial reference.
> > +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this))
> > })  
> 
> How about replacing from `if raw.is_null() ...` with something more
> functional-style:
> 
>     NonNull::new(raw.cast::<Self>())
>         .map(|this| {
>             // INVARIANT: Set `registration_data` to dangling (no
> registration yet). // SAFETY: `this` points to the allocation just
> returned by fwctl. unsafe {
>                 (&raw mut (*this.as_ptr()).registration_data)
>                     .write(UnsafeCell::new(NonNull::dangling()))
>             };
>             // SAFETY: `this` owns the initial reference.
>             unsafe { ARef::from_raw(this) }
>         })
>         .ok_or(ENOMEM)
> 
> It's not just cosmetic: it removes one call to an unsafe method
> (`NonNull::new_unchecked`), carries the fact that `this` is not NULL
> in the type system from the get-go (instead of relying on an explicit
> check), and makes the transition steps from the raw pointer to the
> `ARef` more explicit.
> 

Great idea. I eventually take Gary idea which has similar motivation
with this one. All subsequent initialization uses this NonNull value,
and NonNull::new_unchecked() is no longer needed. :)


snip
> > +    /// `dev` must be an unregistered [`Device`] that is not
> > associated with any live
> > +    /// [`Registration`], and no other thread may attempt to
> > register the same device concurrently.
> > +    pub unsafe fn new(
> > +        _parent: &'a device::Device<device::Bound>,  
> 
> Why do we need `_parent`? Is it to provide a proof that the parent
> device is bound by the time of registration? If so, there is an
> obvious loophole: this method will accept any bound device, not
> necessarily the actual parent that was passed to `Device::new`.
> 
> We should either store an `ARef<device::Device>` in `fwctl::Device` to
> perform the check at runtime, or add a requirement in the `Safety`
> paragraph that `_parent` must be the actual parent, since the method
> is already `unsafe` anyway.
> 

Good catch. I fixed this in v7 with a runtime identity check.

> > +        dev: &Device<T>,
> > +        reg_data: impl PinInit<T::RegistrationData<'a>, Error>,
> > +    ) -> Result<Self> {
> > +        let reg_data: Pin<KBox<T::RegistrationData<'a>>> =
> > KBox::pin_init(reg_data, GFP_KERNEL)?; +
> > +        // Store the registration data pointer in the device
> > before registration, so that it is
> > +        // visible once callbacks can be invoked.
> > +        //
> > +        // SAFETY: Lifetimes do not affect layout, so the pointer
> > cast is sound.
> > +        let ptr: NonNull<T::RegistrationData<'static>> =
> > +            unsafe {
> > mem::transmute(NonNull::from(Pin::get_ref(reg_data.as_ref()))) };  
> 
> The only unsafe part of this statement is the `mem::transmute`. In
> such cases, I think it is worth using an intermediate variable for the
> non-unsafe part so non-checked unsafe operations don't slip in if the
> code is modified, e.g.:
> 
>     let r = NonNull::from(Pin::get_ref(reg_data.as_ref()));
>     ...
>     let ptr: NonNull<T::RegistrationData<'static>> = unsafe {
> mem::transmute(r) }; 

Thanks for the idea. I remove the transmute entirely in v7. 

> > +
> > +        // SAFETY: No concurrent access; the device is not yet
> > registered.
> > +        unsafe { *dev.registration_data.get() = ptr };
> > +
> > +        // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
> > +        let ret = unsafe { bindings::fwctl_register(dev.as_raw())
> > };
> > +        if ret != 0 {
> > +            // SAFETY: No concurrent readers; registration failed.
> > +            unsafe { *dev.registration_data.get() =
> > NonNull::dangling() };
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +
> > +        Ok(Self {
> > +            dev: dev.into(),
> > +            _reg_data: reg_data,
> > +        })
> > +    }
> > +}
> > +
> > +impl<T: Operations> Drop for Registration<'_, T> {
> > +    fn drop(&mut self) {
> > +        // SAFETY: The Registration lifetime guarantees that the
> > parent device is still bound.
> > +        // `fwctl_unregister` takes the write lock, closes all
> > user contexts, and sets ops=NULL.
> > +        // After it returns, no callbacks can be running or will
> > run.
> > +        unsafe { bindings::fwctl_unregister(self.dev.as_raw()) };
> > +
> > +        // SAFETY: `fwctl_unregister` guarantees no concurrent
> > readers.
> > +        unsafe { *self.dev.registration_data.get() =
> > NonNull::dangling() }; +
> > +        // `self._reg_data` is dropped here, after callbacks have
> > stopped.
> > +    }
> > +}
> > +
> > +// SAFETY: `Registration` can be sent between threads; the
> > underlying fwctl_device uses internal +// locking.
> > +unsafe impl<T: Operations> Send for Registration<'_, T> {}
> > +
> > +// SAFETY: `Registration` provides no mutable access; the
> > underlying fwctl_device is protected by +// internal locking.
> > +unsafe impl<T: Operations> Sync for Registration<'_, T> {}  
> 
> IIUC all the fields of `Registration` are already `Send` and `Sync`,
> so we don't need these manual implementations.
> 

Removed in v7. 

> > +/// Internal per-FD user context wrapping `struct fwctl_uctx` and
> > `T`. +///
> > +/// Not exposed to drivers; they work with `&T` / `Pin<&mut T>`
> > directly. +#[repr(C)]
> > +#[pin_data]
> > +struct UserCtx<T: Operations> {
> > +    #[pin]
> > +    fwctl_uctx: Opaque<bindings::fwctl_uctx>,
> > +    #[pin]
> > +    uctx: T,
> > +}
> > +
> > +impl<T: Operations> UserCtx<T> {
> > +    /// # Safety
> > +    ///
> > +    /// `ptr` must point to a `fwctl_uctx` embedded in a live
> > `UserCtx<T>`.
> > +    #[inline]
> > +    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a
> > Self {
> > +        // SAFETY: The caller upholds the `UserCtx<T>` embedding
> > invariant.
> > +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self,
> > fwctl_uctx) }
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `ptr` must point to a `fwctl_uctx` embedded in a live
> > `UserCtx<T>`.
> > +    /// The caller must ensure exclusive access to the
> > `UserCtx<T>`.
> > +    #[inline]
> > +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::fwctl_uctx) ->
> > &'a mut Self {
> > +        // SAFETY: The caller upholds the embedding and
> > exclusivity invariants.
> > +        unsafe { &mut *container_of!(Opaque::cast_from(ptr), Self,
> > fwctl_uctx).cast_mut() }
> > +    }
> > +
> > +    /// Returns a reference to the fwctl [`Device`] that owns this
> > context.
> > +    #[inline]
> > +    fn device(&self) -> &Device<T> {
> > +        // SAFETY: fwctl initialises this pointer before any
> > driver callback.
> > +        let raw_fwctl = unsafe { (*self.fwctl_uctx.get()).fwctl };
> > +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>`
> > layout.
> > +        unsafe { Device::from_raw(raw_fwctl) }
> > +    }
> > +}
> > +
> > +/// Static vtable mapping Rust trait methods to C callbacks.
> > +pub struct VTable<T: Operations>(PhantomData<T>);
> > +
> > +impl<T: Operations> VTable<T> {
> > +    /// The fwctl operations vtable for this driver type.
> > +    pub const VTABLE: bindings::fwctl_ops = bindings::fwctl_ops {
> > +        device_type: T::DEVICE_TYPE as u32,
> > +        uctx_size: core::mem::size_of::<UserCtx<T>>(),  
> 
> Aren't the alignment concerns raised on [1] still valid? Since the
> user context is allocated by the C side, we need to make sure that
> Rust's alignment expectations are properly met.
> 
> [1] https://lore.kernel.org/all/DGUZ4A6W87JU.36R2KDR7YGSEX@kernel.org/
> 

Thanks for bringing this up. In v7, I got a private const helper based
on Layout::pad_to_align(), and VTable::uctx_size uses the resulting
padded size for UserCtx<T>. The same calculation is also used for the
Device<T> allocation. This should address the concern.

> > +        open_uctx: Some(Self::open_uctx_callback),
> > +        close_uctx: Some(Self::close_uctx_callback),
> > +        info: Some(Self::info_callback),
> > +        fw_rpc: Some(Self::fw_rpc_callback),
> > +    };
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `uctx` must be a valid `fwctl_uctx` embedded in a
> > `UserCtx<T>` with
> > +    /// sufficient allocated space for the uctx field.
> > +    unsafe extern "C" fn open_uctx_callback(uctx: *mut
> > bindings::fwctl_uctx) -> ffi::c_int {
> > +        const_assert!(
> > +            core::mem::offset_of!(UserCtx<T>, fwctl_uctx) == 0,
> > +            "struct fwctl_uctx must be at offset 0"
> > +        );
> > +
> > +        // SAFETY: fwctl sets this pointer before calling
> > `open_uctx`.
> > +        let raw_fwctl = unsafe { (*uctx).fwctl };
> > +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>`
> > layout.
> > +        let device = unsafe { Device::<T>::from_raw(raw_fwctl) };
> > +
> > +        // SAFETY: open_uctx is called under registration_lock
> > read; the device is registered.
> > +        let reg_data = unsafe {
> > device.registration_data_unchecked() };  
> 
> This `from_raw`..`registration_data_unchecked` sequence is performed
> by all hooks, how about factoring them out in a helper function?
> 

Done in v7.

> > +
> > +        let initializer = T::open(device, reg_data);
> > +
> > +        let uctx_offset = core::mem::offset_of!(UserCtx<T>, uctx);
> > +        // SAFETY: `uctx_size` reserves space for the full
> > `UserCtx<T>`.
> > +        let uctx_ptr: *mut T = unsafe {
> > uctx.cast::<u8>().add(uctx_offset).cast() }; +
> > +        // SAFETY: `uctx_ptr` addresses the uninitialised pinned
> > context.
> > +        match unsafe { initializer.__pinned_init(uctx_ptr.cast())
> > } {  
> 
> This `cast` is unneeded here IIUC.
> 
> > +            Ok(()) => 0,
> > +            Err(e) => e.to_errno(),
> > +        }
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> > +    unsafe extern "C" fn close_uctx_callback(uctx: *mut
> > bindings::fwctl_uctx) {
> > +        // SAFETY: fwctl keeps the owning device live for this
> > callback.
> > +        let device = unsafe { Device::<T>::from_raw((*uctx).fwctl)
> > }; +
> > +        // SAFETY: close_uctx is called under registration_lock
> > write (from fwctl_unregister) or
> > +        // under registration_lock read (from fwctl_fops_release);
> > the device is registered.
> > +        let reg_data = unsafe {
> > device.registration_data_unchecked() }; +
> > +        // SAFETY: close is called for an opened Rust user context.
> > +        let ctx = unsafe { UserCtx::<T>::from_raw_mut(uctx) };
> > +
> > +        {
> > +            // SAFETY: fwctl never moves an opened user context.
> > +            let pinned = unsafe { Pin::new_unchecked(&mut
> > ctx.uctx) };
> > +            T::close(pinned, device, reg_data);
> > +        }
> > +
> > +        // SAFETY: close is the last callback before fwctl frees
> > the allocation.
> > +        unsafe { core::ptr::drop_in_place(&mut ctx.uctx) };
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> > +    /// `length` must be a valid pointer.
> > +    unsafe extern "C" fn info_callback(
> > +        uctx: *mut bindings::fwctl_uctx,
> > +        length: *mut usize,
> > +    ) -> *mut ffi::c_void {
> > +        // SAFETY: info is called for an opened Rust user context.
> > +        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
> > +        let device = ctx.device();
> > +
> > +        // SAFETY: info is called under registration_lock read;
> > the device is registered.
> > +        let reg_data = unsafe {
> > device.registration_data_unchecked() }; +
> > +        // SAFETY: fwctl never moves an opened user context.
> > +        let pinned = unsafe { Pin::new_unchecked(&ctx.uctx) };
> > +
> > +        match T::info(pinned, device, reg_data) {
> > +            Ok(kvec) if kvec.is_empty() => {
> > +                // SAFETY: `length` is a valid out-parameter.
> > +                unsafe { *length = 0 };
> > +                // Return NULL for empty data; kfree(NULL) is safe.
> > +                core::ptr::null_mut()
> > +            }
> > +            Ok(kvec) => {
> > +                let (ptr, len, _cap) = kvec.into_raw_parts();
> > +                // SAFETY: `length` is a valid out-parameter.
> > +                unsafe { *length = len };
> > +                ptr.cast::<ffi::c_void>()
> > +            }
> > +            Err(e) => Error::to_ptr(e),
> > +        }
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> > +    /// `rpc_in` must be valid for `in_len` bytes. `out_len` must
> > be valid.
> > +    unsafe extern "C" fn fw_rpc_callback(
> > +        uctx: *mut bindings::fwctl_uctx,
> > +        scope: u32,
> > +        rpc_in: *mut ffi::c_void,
> > +        in_len: usize,
> > +        out_len: *mut usize,
> > +    ) -> *mut ffi::c_void {
> > +        let scope = match RpcScope::try_from(scope) {
> > +            Ok(s) => s,
> > +            Err(e) => return Error::to_ptr(e),
> > +        };
> > +
> > +        // SAFETY: RPC is called for an opened Rust user context.
> > +        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
> > +        let device = ctx.device();
> > +
> > +        // SAFETY: fw_rpc is called under registration_lock read;
> > the device is registered.
> > +        let reg_data = unsafe {
> > device.registration_data_unchecked() }; +
> > +        // SAFETY: fwctl passes a valid in/out buffer for this
> > callback.
> > +        let rpc_in_slice: &mut [u8] =
> > +            unsafe {
> > slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len) };  
> 
> Name nit: technically this is not just an `in` slice, since the reply
> might be written into it.
> 

I will name it as rpc_buf then. :)

> > +
> > +        // SAFETY: fwctl never moves an opened user context.
> > +        let pinned = unsafe { Pin::new_unchecked(&ctx.uctx) };
> > +
> > +        match T::fw_rpc(pinned, device, reg_data, scope,
> > rpc_in_slice) {  
> 
> The C side passes `out_len` to its callback, don't we want to do the
> same here?
> 
> > +            Ok(FwRpcResponse::InPlace(len)) => {
> > +                if len > in_len {
> > +                    return Error::to_ptr(EINVAL);
> > +                }
> > +
> > +                // SAFETY: `out_len` is valid.
> > +                unsafe { *out_len = len };
> > +                rpc_in
> > +            }
> > +            Ok(FwRpcResponse::NewBuffer(kvec)) => {
> > +                let (ptr, len, _cap) = kvec.into_raw_parts();
> > +                // SAFETY: `out_len` is valid.
> > +                unsafe { *out_len = len };  
> 
> Both arms are writing `*out_len` and require an `unsafe` statement. We
> could factor these out into a single one by returning a `(len, res)`
> tuple from the match statement, and writing `out_len` once out of it.
> 
> > +                ptr.cast::<ffi::c_void>()
> > +            }
> > +            Err(e) => Error::to_ptr(e),  
> 
> (if you follow my recommendation above, then this needs to become a
> return statement).

Done.

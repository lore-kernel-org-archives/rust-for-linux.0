Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481E3B71AA;
	Wed,  8 Jul 2026 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524112; cv=fail; b=o5YabslPjAh/qQUrDixW/CAVcBgikbPyshh0NbG6fR7jFBEdXrC5KxB1p6Mdh/MK5+enDMLZfWRzi80AolafOfEJoc6xrp3kFQeflV230jAfeVaoctOmcQZ1edq1DGHPMk8li/KIfrulFQYBX1jQJbxRZdVr7qYaIorrLYBwiEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524112; c=relaxed/simple;
	bh=hbQ9wrkz8mAjnstWiWB6H+Ke3Gl7pi0RzbE5FobvX3o=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBvSvc3kEeYyM5DMpvXlTi5t5UFmNrvUAi9NKWzvWDYKT4Yw5Tz+91eGN3UwwLmG8vj8pZGagMUPD4LVp2NPLpdoJY3yFJCjU3ceYJXALDpYQb63SsGYAaJw5Ktp/U4jszpTfE2KRTGQ0MhvqgPzA0cn/pd+OKlzZ2/fhAoCq9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gIZiX6LF; arc=fail smtp.client-ip=40.93.194.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gIZiX6LF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgTICNjR/WU5ASrxfqanz1nt4l26jBmkcHhYTsp2yxdL2gt9PNXXTYzF31oDp/4tpApjB+KaCBfmZ18d73pBT+ccXl1lIlYWdY+acb60qThAqNNTKlM8Eenl8kqjx8rpCV0I/uNbZshPt9eXp3Nro01icTcpg5dBSR4ji4zeUd8AYUdJrdvDF6y/ew6Of9a/vKpH9T6REzj3QoAsaWqujj9ITGMGCNNFTnIwCJerOk2U/V6mGYbaDP6ubKaBE6JCtoope3rxau60Tw1XC6JYiY1m6DwvN/yM/PnMMgJWuNtDjrafGOyJ6I/L5PxM7xDFFsysP0NNMOAdjCsiVEaSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaShNTqwsjmvH6+cdRPDJLnNmExIaDMCmyfuQyTSstw=;
 b=NOFhSzTQguG6hZo5pB3E7JY5+p4rX9Hw+IHh3BldjWdPzlacTeF1Zi2g60SjWmfzRbuYwPGexsKirfrdvfREgCmWh8LBrr0I3xftkfU2XPlBTdCOnsAIeopbbBCXBcv8jpuey478Sr4YKEC2MUdcbfL6TzrYWLp3+ksT5WMH7QO6GdWbAM6lzEwsvjn7EhUEeUkj8NybJpHQ0fqQyv7FnZrz1b30HqDI15LOSjnXkWU3axenk+SJeGCYrijmVBzUWFSzswbM5i+YjpFvJ8vkCOJTalgyIC/o80YShfTu3HexQlxtCfpobGFKgHOy138DZiG7Mx0Wa748TtpeXInADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaShNTqwsjmvH6+cdRPDJLnNmExIaDMCmyfuQyTSstw=;
 b=gIZiX6LF2Czs9QL2rzGPGY0jSKuf0diIVQ1sF5Obs4Uj81tXo4Rl2DfxuUlvzD8EQEfzIzHI42Pe6tw4Xsdq2b9dNK8NjBHjsKbszV4Dvuib0VKOFYlOZng6qSzBWeDxR/DhqLd+lTgeVlIkexrCP732exgl/60Rvhjks/cJoICHld8sZ+acx0GmNV6idvaq/dR02OuQOCLFKNlHqMekGaQf1tlJXotB3ItTIyq9zRF29ZYkBT1sevTybv1gNikNmy+3itcCXwGYKG0l/xvog3dcfqyxlYCv4AmVzJBkhZQZYurIiiKaCcNTkHCSWfzMGRmkbpEjgtyIZeUk36y/ng==
Received: from PH7P220CA0153.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::15)
 by DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:21:30 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::6e) by PH7P220CA0153.outlook.office365.com
 (2603:10b6:510:33b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 15:21:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 15:21:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Jul
 2026 08:21:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 08:21:10 -0700
Received: from inno-dell (10.127.8.9) by mail.nvidia.com (10.126.190.182) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Jul 2026 08:21:03 -0700
Date: Wed, 8 Jul 2026 18:20:58 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <jgg@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
	<jic23@kernel.org>, <gary@garyguo.net>, <joelagnelf@nvidia.com>,
	<aliceryhl@google.com>, <kwilczynski@kernel.org>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
Message-ID: <20260708182058.34b00370@inno-dell>
In-Reply-To: <DJQ1KX0O60J7.Q3RUZ46V153O@kernel.org>
References: <20260629150156.3169384-1-zhiw@nvidia.com>
	<20260629150156.3169384-2-zhiw@nvidia.com>
	<DJQ1KX0O60J7.Q3RUZ46V153O@kernel.org>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: e34c6863-fc66-4203-f38b-08dedd04960c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|1800799024|376014|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	bxj/IqstNnQQP/xGurTkS7Da1B7aqfFgxe5O9OykQc3MW3j9xJ9Kne3SI1xbFQHUmNJjwXJTONPEkCRMmCfXHrAkU1JrZLsnMaf9iC98100videXkf2uxlCgra7xyip4yzlmfPjiB0Ltqa8HIw2K30YTWbEkZY5wq3ROM5wHxtrAcixUxmMtiabz6AEFEwz1dv5GCeR9xnya1FBdcwe5SMv4OlHqAgAyh7vwRQk46iwPMvq/vQHOMg8sxpHxW3P6xp++4XF5ekQZOyR52V5z7UJyWgSWTXOmJyARrOxsn4lqPzinoZBOWc7UQI1tzBNuF6J7qoFWWFKIvR0NfeLc2qTK93KiKNGCEqBEvDS7Yz2SHfU0DLTmZ612MIsWZlfsAkXK3gjT8DKrX9gzpgcBNblDI5ed/KqrsKS2nUDzijitnl57XjqXwOvNjb+CCrCHzsdxwiA7fRAwlMQtLLBP7qkFQ1DNZ5S2wFXjZYsz+dd86WounKujs9y+5MOg1X25/UJf/PHFY1YJImfv6WQsk5GUH8MwCE0EvCZA73FXBT9sr1DImbnx0WkE0dNxorlcvWTJRt68LZE4JAd6QFkrgkLbPMIsloyKeKf2UJDNYsH8ySLMzVtcbjNrKD68E+UCZTvR74A76xbE7kNT4ETuO6ktV1wiaA4ys0/T+H8+TWi4me7gDja3H8vYguD8KUu5Ez2nAbVsN9O2Yi0i/HmQVA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NFBM83q4L8IIXavTK6rS1jBv/WmpIcpzFdGmjSIMUH9aoZwxBFigwYmtajVEbQdgATC4tZC4nwS8NrlczTt/MfLulOAcOC3pXJJbi2HxHNPcM8lIf55R+PCV1yUQ/jQJ5fVjeIjgUN6ZsvBXC2WcfuleomESKlSB69efm8uJiDxGuYa7kqEvNtg+yQmeV9engsHZPcKdvaRuKx9qTe6NvuTLrdVtzLwI//HJv8K1/hzFPASzRY7C61iJtaSSOXMDH9WqXaDR7K4jL5E2wRj7nP6XFKRNCN0RpsXuvcPfZsqswaxikVwAUw+anHUQneJtKclq45N4L/V0ehANendYRZQSx4/MoVyTQ+4YCvYh7F7d4h5vNOPcs0NR/ltL7W6GN5KlSDZkrV/74uxjpFE2Pve9lfTLm/JydTTDaD7rOGZZeyPMD/HlDepMMFIdgbye
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:21:29.8844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e34c6863-fc66-4203-f38b-08dedd04960c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

On Sat, 04 Jul 2026 21:42:59 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jun 29, 2026 at 5:01 PM CEST, Zhi Wang wrote:
> > Introduce safe Rust wrappers around struct fwctl_device and

snip

> 
> This also needs:
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> > Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>  
> 

Thanks, will add it.

> Few remaining nits below.
> 
> Jason, would you be fine if I take this through the DRM tree, so Nova
> can build on top of it right away, or do you want to take it through
> your fwctl tree?
> 
> > ---
> >  drivers/fwctl/Kconfig           |  12 +
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/helpers/fwctl.c            |  17 +
> >  rust/helpers/helpers.c          |   3 +-
> >  rust/kernel/fwctl.rs            | 546
> > ++++++++++++++++++++++++++++++++ rust/kernel/lib.rs              |
> >  2 + 6 files changed, 580 insertions(+), 1 deletion(-)
> >  create mode 100644 rust/helpers/fwctl.c
> >  create mode 100644 rust/kernel/fwctl.rs  
> 
> 

snip

> NIT: Do we want to add all device types even though they do not (plan
> to) have a Rust driver?
>

I think they are not intended as placeholders for future Rust drivers.
`DeviceType` models the valid `fwctl_device_type` UAPI domain, so I
kept all existing non-error values while leaving
`FWCTL_DEVICE_TYPE_ERROR` and arbitrary integers unrepresentable.

`FWCTL_DEVICE_TYPE_NOVA_CORE` has not been allocated in the C UAPI
yet, so it is intentionally not included here. I plan to add
`DeviceType::NovaCore` together with the C UAPI value and the nova-core
consumer.

Do you have any better idea about this? We don't have a dummy driver as
well...


snip

> > +    /// Called when a new user context is opened.
> > +    ///
> > +    /// Returns a [`PinInit`] initializer for `Self`. The instance
> > is dropped
> > +    /// automatically when the FD is closed (after
> > [`close`](Self::close)).
> > +    fn open<'a>(
> > +        device: &'a Device<Self>,
> > +        reg_data: &'a Self::RegistrationData<'a>,
> > +    ) -> impl PinInit<Self, Error>;  
> 
> I think this can just be
> 
> 	fn open<'a>(
> 	    device: &Device<Self>,
> 	    reg_data: &Self::RegistrationData<'a>,
> 	) -> impl PinInit<Self, Error>;
> 

Agree.

> > +impl<T: Operations> Device<T> {
> > +    /// Allocate a new fwctl device.
> > +    ///
> > +    /// Returns an [`ARef`] that can be passed to
> > [`Registration::new()`]
> > +    /// to make the device visible to userspace.
> > +    pub fn new(parent: &device::Device<device::Bound>) ->
> > Result<ARef<Self>> {
> > +        const_assert!(
> > +            core::mem::offset_of!(Self, dev) == 0,
> > +            "struct fwctl_device must be at offset 0"
> > +        );
> > +
> > +        let ops =
> > core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::<T>::VTABLE).cast_mut();
> > +
> > +        // SAFETY: `ops` is static, `parent` is bound, and `size`
> > covers the full `Device<T>`.
> > +        let raw = unsafe {
> > +            bindings::_fwctl_alloc_device(parent.as_raw(), ops,
> > core::mem::size_of::<Self>())
> > +        };
> > +
> > +        if raw.is_null() {
> > +            return Err(ENOMEM);
> > +        }
> > +
> > +        let this = raw.cast::<Self>();
> > +
> > +        // INVARIANT: Set `registration_data` to dangling (no
> > registration yet).
> > +        // SAFETY: `this` points to the allocation just returned
> > by fwctl.
> > +        unsafe {
> > +            core::ptr::addr_of_mut!((*this).registration_data)  
> 
> Here and in a few other places, this can use &raw mut instead.
> 
> > +/// Static vtable mapping Rust trait methods to C callbacks.
> > +pub struct VTable<T: Operations>(PhantomData<T>);  
> 
> Why does this need public visibility?
> 

Will fix them in the next re-spin.

> > +
> > +impl<T: Operations> VTable<T> {
> > +    /// The fwctl operations vtable for this driver type.
> > +    pub const VTABLE: bindings::fwctl_ops = bindings::fwctl_ops {
> > +        device_type: T::DEVICE_TYPE as u32,
> > +        uctx_size: core::mem::size_of::<UserCtx<T>>(),
> > +        open_uctx: Some(Self::open_uctx_callback),
> > +        close_uctx: Some(Self::close_uctx_callback),
> > +        info: Some(Self::info_callback),
> > +        fw_rpc: Some(Self::fw_rpc_callback),
> > +    };  
> 
> Same here.
> 
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
> > device.registration_data_unchecked() }; +
> > +        let initializer = T::open(device, reg_data);
> > +
> > +        let uctx_offset = core::mem::offset_of!(UserCtx<T>, uctx);
> > +        // SAFETY: `uctx_size` reserves space for the full
> > `UserCtx<T>`.
> > +        let uctx_ptr: *mut T = unsafe {
> > uctx.cast::<u8>().add(uctx_offset).cast() };  
> 
> This can use byte_add() instead.
> 
> > +            Ok(FwRpcResponse::NewBuffer(kvec)) => {
> > +                let (ptr, len, _cap) = kvec.into_raw_parts();
> > +                // SAFETY: `out_len` is valid.
> > +                unsafe { *out_len = len };
> > +                ptr.cast::<ffi::c_void>()  
> 
> This probably needs a kvec.is_empty() check, since an empty vector
> contains a dangling pointer.

Yup. Will fix above in the next re-spin.


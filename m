Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022097.outbound.protection.outlook.com [52.101.96.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A2941F7CC;
	Mon,  6 Jul 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339248; cv=fail; b=VseYHSsOqTROLUMY5sOUJNEsEB9TiM3w1Ub7wK8r3WGZL2n8Kw/Nb8TKT5wNnlqtqEkT4GO6rzMU/CdOYmamvBtssa0OVFfC8cd8HHi/PwN/BB7IXzRx1ahZ+lEGsDvBeHEnN8oJoy7DW14UFMnf85te8eltyxaPN3DnIm7HWig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339248; c=relaxed/simple;
	bh=EH6XY6JMxRHP1UAn95VoursXMFFzFvgiwoygGzJqAWI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ANBJ4Auf6bVirxryT4X7QRev9pD+U2KSFQ6NvcFQQEMzSNWrV2lDVLzusYHr9nprrN8e9npnKC4dgsXTMjq63cxbeSkh7QfEiTHvCSoMcdoZLUXRxHvFxsc2J1aqqIOwzj5vG3YI3UH9wmLP+zpyy9d12Kjci559JKN6rLsXdN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JoQ7BNfB; arc=fail smtp.client-ip=52.101.96.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JoQ7BNfB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVb8QZH4n6kimYawnm5qw6UX7Oe+XqArgNZz81T/1zLa31dqvoqrFQ1dvWpxn2raw3iwEqIXpFkF4A6qxuJWH+ykbu7A33Nr1WX3MI0CyLluwfy2ChIBD3KXi9+sKN5RZwY5uOf0Vpq0kHikCtnYSFxAKI7ETsJx0D7+760GlaTqiZH/MSUjE+r7F65rHigjSfhIxbMzWRlg+/S8YjRj7+npMa0DMjeOH+npMusn9tZCb4JNMGDRlr5E1/6jL0q6tO4/uRwjyZ+/d0zeUEeU+/Wf11+J6LZKW9YtL9P9hHC7AbPJLgb5BDjPEftPo+aTDIkuth3j8DPmoTDKaSiJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX/QoWC0JAd+YUGlTBDmPWvhtUY4ijWAcW9nDe/fpxQ=;
 b=pBI7OtVeSnI0Ke9kKxo1jnJCbN5GUEuWvGg3qeGkYgjBGHF+hWZDbi2BWHEYms5qtYP1RHim8BC6fjhg0zAnRN2UslyGhuuEBTji9uP9CvLCoqu/99fFs9SnN+1/1O878Lut6Bir+MXzY0sxxPfV60aW7TXSL5mOKiQQhrKi5aPVSbsAY6ZQYXL4moAOKIYM+HI9pJo8gZvZTXEkJvpgY8nObwZ89HxzPooySRwpJDIFOSzGvxOrG71Sz8wkFlT0XK0qDE6HP++3GMWU6N9NQScmv6oQjM3i1bnzR0qO6m1yjxAC1iKZrsuqaM+Sm5pn+wbP6yraMn4KCikBkAhB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX/QoWC0JAd+YUGlTBDmPWvhtUY4ijWAcW9nDe/fpxQ=;
 b=JoQ7BNfBPFivLzIh29iSiMWcAbt20Wy83lOcMMPvkVHoYvZmMWmtb3NFe998TjjyRjg7QMZV6h8gtY2ce3OhohdkG9hD7xXlXHmtGGJJNS/CqNdERtfl84aPnEDzhjXrVhEOtG0Zj4w+oXchHdUvikLxb4TGoRf4WWna1Qifqag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2883.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 12:00:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 12:00:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 13:00:42 +0100
Message-Id: <DJRH022OWTTK.1KPQDQHKG7CTF@garyguo.net>
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dakr@kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
 <saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260629150156.3169384-1-zhiw@nvidia.com>
 <20260629150156.3169384-2-zhiw@nvidia.com>
 <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
In-Reply-To: <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
X-ClientProxiedBy: LO4P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2883:EE_
X-MS-Office365-Filtering-Correlation-Id: a40e3590-01c5-490e-5265-08dedb5634aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10070799003|22082099003|18002099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ekVVVMN9f1C7EFbGGhgvE303a2Q/AS34LWubfHASc4KlaSgtsgUEWGO+fbydqe5uU3XCPWW2PvY/TD1OTyw2c6YFuigA/DoL6J/pd/zI8elVVwFjJ0eA40Ter5WeSDhXJz25eknqW96fWPGTPWKFS5O9p3mjuWV8zKDxw+6zDLMmU8LLkBVJzQPSVCFreBCOiu7G1BJRE3GspSTJ7QA6s/p5WBoFFEKsGhSyjXI1NPb4p4rLmmmEqd8q4+SJku3K98QMsWhkBy7KxiCv1wSKRtrrPavNJI637R6GaQpTtpwt8Yy2nG5PvS2ESn+1kj1pjxOot2Hs7sLTq4T0/p3Sv4Gheb7n6jChivnG/VwsYPq4JFSl2g1Xcr4/9AoFzc8PuF5dkcaG+AILoRC1aTSTTj3anzAiCRRIgQ7uZWxVYA9giv65FDnfH5aFgfCKmtCuxHH+YbPGDgtd8InzQvr3ffg++ecRbYC/z5PLhf1cYA1Zb3zh247Pbu7YGj9sVWX/ib3h7wbeu0UARdn7ueRPL1uEtU27oHWuNpx3XbAPTcWkOKDjhsle+94zmG8cKOi/+qmel5O212+zoVgZIUBBRdPF6oSBgr/ES5/uMLfwLscRY/mI/0nWtt6OTRUdz9ONVcFhkZe9/kyn++ahs+4IYdV2VATeVZscQ+VSUWZgrSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10070799003)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZNOUNpVzk0cWN4YkFkTEI4WlI4RTRVUEwyUTgwTW5rdHN5L0xlUkxvS0Jm?=
 =?utf-8?B?ZVBZMmRuNDh0OFVrK2hqWGZwV1ZFNWpDaVI0aU9BaDB0RDlPMkxRR0dWSlNP?=
 =?utf-8?B?MWtVKzJJdVVYRnR4SnNRRytsSlRJV1l5c2VnT055S0FkSDFlVHFmbGdTd1d4?=
 =?utf-8?B?eHlOdnlpMlZRVXdEOGZ0WHNORXpPdEF6NUFjWXZVeSt5Yi80OG1ZdVVYTHkz?=
 =?utf-8?B?RE1SOEExMWJCVmh3ZUhSMkFUdk9vcGRqUWRRR0o3NW5IYWhyNi9mWFc4TnZ6?=
 =?utf-8?B?dHNDcE9XQzZPZVg1Z0gyT2xYZk1RSTZNaTJ3clE3M1gxY3NnQVpBakp6ZitT?=
 =?utf-8?B?V2tpVVVMQXNwNGY4NS8yMDRIMjRNZVU5Z0UrSDN0aGRSaHdHdU9GMnNMbFMv?=
 =?utf-8?B?ZExpVEQ2S1RjbGxScFNReFVHVnpxZGYrRXRuZ09MVDRNNkcxVDMwZmFXOVdR?=
 =?utf-8?B?NXRxeUdYRnM4bHpVY3RZU0tNazBabTZVbjlyYnUzY1FLUC81YUxoM0JjTnhW?=
 =?utf-8?B?QkVyTExSenpBby83QXVMWXBDR1FOTGRSTWE4WlhyVDVBeER6aFUvV21Nd1J6?=
 =?utf-8?B?NU16RmE1TVhGN1BzUWhkK3I5M25yUkJSMkxlcitqUVMyaVJkS3pZZnZuNXBU?=
 =?utf-8?B?WDRLazl4Wmx6TS83Tk9YZ3hNUlBzelNiaHN4dXhrWitoYzJnQndpL0o4MjhO?=
 =?utf-8?B?U0E5S3lSd3lpVFdyZkZTeTB3MlpMWVIwVGQ0N0NoVHJVYnZvRHNhakZlaEhs?=
 =?utf-8?B?eUlFbHRubDNQbXdyRHVtTzNWcGFSNEJ0TjB6MERwVXQzdlBNbDhaTEN3WUoz?=
 =?utf-8?B?a2prdU96aDN0TmFva2NOeTlaRTNaYXpnUnhWVTFCUkVRNm5wT2x4R2crdTk4?=
 =?utf-8?B?Q29JUEU5cTdwbVg4dEsyZWxTN25teXYwL0Z0UkEwZTZUdEFseHpEU2wxcEx0?=
 =?utf-8?B?d0dFTUVCRU1WS3VtWkI3dkw4d2xhaFRCM0VST09SbTRsM0MwMW55S3dZOEtN?=
 =?utf-8?B?TEg5ZjlUNHQ1RnJoTUkvNC9lTUdSQ1k2K1c0bzRINlE5WitscnMva3pUVWhk?=
 =?utf-8?B?S1UxTXpQZmtUSjJmRFdrUlBkd0gzdDJuM2lLRUIyU0lRV1VGdUtiMS9mQis3?=
 =?utf-8?B?SVJGU3drWFYyell5MWE5dXJnMm1hMHA4VU5hNlNjckZ5MjgxQ3htQmkrRkxV?=
 =?utf-8?B?UWhxVnJzZ1ZDS20zNUcxTFBKZ3ZWT1EvYWRzZ2VjckdidWMxaEJmOXNCQWhn?=
 =?utf-8?B?VTYvemtvYjlnUURNamZ0TEVqdDFENDMyb3hZbmFnL2c1OVQxQU54dGhEU1Jn?=
 =?utf-8?B?TXZlbExWZG9oTzdDOHloZFNBMi9Ubk9nS2NJdTAwV2g4K1RvZ1NGaFIxbmxT?=
 =?utf-8?B?K2ViTFo3SjY0bTdMZXduVS81Tnl1dnZ1R3Vkelh5cEFHcnorOGNLUXlpUzNU?=
 =?utf-8?B?SFlwR3N4ZEN4b3dCMXcrVnV1L3JjYlh1S2JqZWVmdWtKZkNkdW54VWhTbTFn?=
 =?utf-8?B?VzFuSDRac25wOS9NQUZjSW9FWjE2R0pDeE4xYVVJSHZGWnBZZmpDVlp0VEo5?=
 =?utf-8?B?eVJEa0h4TGIwWUdEWTEvelhCQ1J1ckJWY3FBbk93OVpRZ2QyWVY4dytaclN2?=
 =?utf-8?B?citvODlvM3VjMTIxV2hvWW83RTl4eWE0cElUMmlRajcyeEh4VzlXcWw0NzBX?=
 =?utf-8?B?SmhOUTdUc2haK25QbWR6NHBRd3o3SUtKSkpROEFrVEFHbTNmSXowV1dQd0Vi?=
 =?utf-8?B?Sml4MFV5ZXV6aW1GbVhHWUVLTDd2TFB6TFlJbWhUU2pMMHRidWd3d0poWXZk?=
 =?utf-8?B?QURPWVFwaUxldEc0RG1FcDJzcnlPNU1DRkJoNXZ1K2xPYzh0aVJ3NVJxM3Z1?=
 =?utf-8?B?L0NhcFZ5T0NuaGR1dzlnUXlHb0xWK2FVaCtoNDdPdmtYTlF6NURmcHVCYllG?=
 =?utf-8?B?MTRPWVpjOW5GTENQQkQ0b3ZNSTBmUTVoZDdmV2ZYZyttY3pkTWhkTHJJSGVm?=
 =?utf-8?B?SXBKWFZHbUlBTHY5WllYSTlDckdqSiswSSs1Z21NRzQ0OHc1SURCMzFQS2xz?=
 =?utf-8?B?TnJPYlZ6YnNOdll3ZHMyVFZIdXN2OG9hTDZZamg3Tk1PbnFGa0M1Z05QMS9G?=
 =?utf-8?B?VjdPTG9FWEFabVVtS1VUc01sb2dqdm83WjMvQ0xQY0VwQWhYNkFzcFlUSy9l?=
 =?utf-8?B?cWR2YnIvWW80VVEvYTFpWEs4TERzUk8wSERTRGlhazh3SHcySVBlMzNhbzhB?=
 =?utf-8?B?elpUZk8wczBISy9hNUg5OG54T054OENTVTlCOXZuRHV1MGVGcFVYWFhJSEZa?=
 =?utf-8?B?WWM5SDF0MFJ4NHlIcU9YV3pPMnM1cXd4MS9iMzU0WmJRaTM2dkdYUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a40e3590-01c5-490e-5265-08dedb5634aa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:00:43.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKj5FYqhfs6QAisyT4l/PlEdj+ytel9Rzzj0dBFfhTpwGCr1lQN8yb6N/Qof1Q64o4JaGU6F8L5VXQ0o/XGHhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2883

On Mon Jul 6, 2026 at 5:19 AM BST, Alexandre Courbot wrote:
> Hi Zhi,
>
> This is looking pretty good to me overall, a few remarks/questions
> below. None of these should require big changes.
>
> On Tue Jun 30, 2026 at 12:01 AM JST, Zhi Wang wrote:
> <...>
>> +/// A fwctl device.
>> +///
>> +/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C `f=
wctl_alloc_device()` layout
>> +/// convention. Contains a pointer to the [`Registration`]'s data, set =
at registration time and
>> +/// cleared on unregistration.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `dev` is embedded at offset 0 and is initialised by fwctl.
>> +/// - The fwctl refcount owns the allocation lifetime.
>> +/// - `registration_data` is either `NonNull::dangling()` (before regis=
tration / after
>> +///   unregistration) or points to valid data owned by the [`Registrati=
on`].
>> +#[repr(C)]
>> +pub struct Device<T: Operations> {
>> +    dev: Opaque<bindings::fwctl_device>,
>> +    registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>=
>,
>> +}
>> +
>> +impl<T: Operations> Device<T> {
>> +    /// Allocate a new fwctl device.
>> +    ///
>> +    /// Returns an [`ARef`] that can be passed to [`Registration::new()=
`]
>> +    /// to make the device visible to userspace.
>> +    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<S=
elf>> {
>> +        const_assert!(
>> +            core::mem::offset_of!(Self, dev) =3D=3D 0,
>> +            "struct fwctl_device must be at offset 0"
>> +        );
>> +
>> +        let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable:=
:<T>::VTABLE).cast_mut();
>> +
>> +        // SAFETY: `ops` is static, `parent` is bound, and `size` cover=
s the full `Device<T>`.
>> +        let raw =3D unsafe {
>> +            bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::m=
em::size_of::<Self>())
>> +        };
>> +
>> +        if raw.is_null() {
>> +            return Err(ENOMEM);
>> +        }
>> +
>> +        let this =3D raw.cast::<Self>();
>> +
>> +        // INVARIANT: Set `registration_data` to dangling (no registrat=
ion yet).
>> +        // SAFETY: `this` points to the allocation just returned by fwc=
tl.
>> +        unsafe {
>> +            core::ptr::addr_of_mut!((*this).registration_data)
>> +                .write(UnsafeCell::new(NonNull::dangling()));
>> +        };
>> +
>> +        // SAFETY: `raw` owns the initial reference.
>> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this)) })
>
> How about replacing from `if raw.is_null() ...` with something more
> functional-style:
>
>     NonNull::new(raw.cast::<Self>())
>         .map(|this| {
>             // INVARIANT: Set `registration_data` to dangling (no registr=
ation yet).
>             // SAFETY: `this` points to the allocation just returned by f=
wctl.
>             unsafe {
>                 (&raw mut (*this.as_ptr()).registration_data)
>                     .write(UnsafeCell::new(NonNull::dangling()))
>             };
>             // SAFETY: `this` owns the initial reference.
>             unsafe { ARef::from_raw(this) }
>         })
>         .ok_or(ENOMEM)

I would rather do

    let this =3D NonNull::new(raw.cast::<Self>()).ok_or(ENOMEM);
    // use this

for a more linear style. Map shouldn't be needed.

Best,
Gary

>
> It's not just cosmetic: it removes one call to an unsafe method
> (`NonNull::new_unchecked`), carries the fact that `this` is not NULL in
> the type system from the get-go (instead of relying on an explicit
> check), and makes the transition steps from the raw pointer to the
> `ARef` more explicit.


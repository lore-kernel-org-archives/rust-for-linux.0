Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F318AE3;
	Mon,  6 Jul 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783311570; cv=fail; b=gOYopNeRokLZO4dRzduCWDJmsCq0pAA9RDVldPh2Q3aV2EkEgMzPfhgA8/ZkHWGWkfyI2L1OwwkA0wndw3wB/h14lf+jGgl6pSa95dBg61S5EpAtQlMp0H/0KJJ08dgqNR1aMtDDW4oprdQfHTjapJ9t2KhJvi/3DMSsxQPCGX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783311570; c=relaxed/simple;
	bh=dBKimmjJkZIFOmO4RkqtsJOnUTiQmLLAajT6ptbVng8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MO7Nch9phJQyeesdit5vYHQAZfjFwykhcZeCVZNo+p2VCfQrDoQebmPWA7oPouN8AYn9Hv8pRzlVS/nCs7Bvw3niwXcIEsMbMx8xEJccYUgOt7CiwBTCKJtQRtOJefzSLlghxUkuYZ3MkO6D8VVL+lKMpu/Y3H3h9h755tcf2qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k8dzymZY; arc=fail smtp.client-ip=52.101.52.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k8dzymZY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7sKeYzEi1osgVYZdEtQTkLnufigm4/gk6PSqB7hZ+7ih11CBrQX1wssrqWVh4Zzf+djAms82bZiRofcvggNyIIcQN30+A8jRxNd8pd9ocr2xaSZLCshiLLdtLDCs0meuH3VtMXGC4zeEi+KDJSMtmDjIvjmJzVeEcVUzORbKBLbJybwsJZlZ12brd695BTvubYRwDz9IAG/J/sBCFirp6BO7dLiUNNaWWPM6Yk4L7hCbtcp4GoeOk3Gko7fH6Uqipfz1nqUIl3Z6OZEXppvBBIY3uRIAuJeCg6ZVATCoS+c1i1R1uH+iUtmzXMW7wag/bTJMelPhfOtrr/XGXU66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya1la9z+3nMxm6rJCxqEUrLWYbtteN/BIS5PSbn8ycQ=;
 b=Oj6QuL34BFih1FuaSzLT/saot+fBD0aMc7zzrTAatOvM02RHuESgSbSwAk2ouTXbodkxwvUp9Jtoa+967IppC28DDzONv65E3xzEX1TZli77kFxv5/IEoBdA282/Wlc4Xctv71BuPENnHAKSUTbdwtzxVoTh+8/Nw8BCXe68XPGqnmSiNxazcG7NF+d6dgGrpHom0fOMUtXG6LEIkoFQ58Ix4BJQqJt+V3SiqJN9FH2nZBuLp5yfW3qOLwTfBNJysSGRtayFJBkiXoc9/9j152ua7+nJT7zbdhY9Qjg9Vcl37w918mmkngX02CeLhIWqLAL4R9R20039LeouRdJ4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya1la9z+3nMxm6rJCxqEUrLWYbtteN/BIS5PSbn8ycQ=;
 b=k8dzymZYYeU3n384QTU4N4bzx02OlHNPa0/AAKvx+eP0rh7w2yASz36eNlJi34ar3eQXMmbyuUTgZDHAwibPbN0imIcmWb+KUwBcOOTtDyjnXG3ra4iUfr/9e+wvpygif86FPDKakKB78mk84sIHdT1o2eA/fwGRl0acGyX89ZaMGQ9T0C+VqPpO0yjGU5JmQQcmez27aTzBq97LrjqGfClpOKgvWyXWvTWECv5gpiJb3TfIRF/L9a/Nqrb4D8bO9SHrEz//G+WxmADJnpW5wuDWi9a1lPfy1OTZpWo2RY1VudsgMs6q9bntSgKnVfOxHvydfDNETTFSsryE13QpCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 04:19:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 04:19:21 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 13:19:17 +0900
Message-Id: <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
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
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260629150156.3169384-1-zhiw@nvidia.com>
 <20260629150156.3169384-2-zhiw@nvidia.com>
In-Reply-To: <20260629150156.3169384-2-zhiw@nvidia.com>
X-ClientProxiedBy: OS0P286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ffcc7b-a849-49ed-50a5-08dedb15c102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|22082099003|18002099003|6133799003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	z7fHBc8kpshBRXo6+1Qk842h/wV7oJNot4POMWRBcQDkEa7x8JVvBp7Jjvyj2udHYEl6GadTJf545eWs2LAfFObk5bHOe7Yp8Do+88wxHG4bcvIwYjICxj/wk0NjCcVjmy4cmwXNKtvzjlbbZ8jfuNZXEl0XXO8g1gsU+9icQp90nBOcN8QLZ0Hy6ETgFpnZND7dfFQfpLwVKl/Bh6aSq/94xhUqLDqZNS7rC+27GnmhYV5sjnwQmerEOVgnzgMSdkoum44gzQsNcVeUvy7L5dWn3NJrFo3YWQzYYY8awblztGglWvNiGRJFK9D19K58VJNNwdSGr5ZTI16Umt44LxY18JvNM6K0U9BTz9s7L2l12R/eChfhGS6vvdeoA0upw8A7HyM3eskS/VQpJpquePqoS8WyWp9C9ASkbNNJZAj4/Yk41RaKl1HKRt1vzeY2Yua3ox7XlIKYItbeqn7wsaC76F9ZHAuphgtzRag6aVqS2siBbNWSWJqeB3Ic70haZr3ZrLpeBy5ekI8Op6Qay57PjchTUVPT0xBi/kfz2FT6D4TtFqPoVsaPWXbSVrIxI+j28IwF5+20R0gbqLqPe91hOUoMnuppwiPMPy7bmXnxqcyXGz7k8hL6SF6Kk0hcQx6RihVFzsXnc24k/GS5ZRHIVf/wUMBOrK1xzxYjhgk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(22082099003)(18002099003)(6133799003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z21pQ05oWkJ5M3FqcVJ2V2J6anhNSElVNSthcWNkZHRtM21qUFRlRFZ0dkVy?=
 =?utf-8?B?VEpCcmoxK1ZWOGlhTFh6cTdFcnhxczltZlNQcnRvOFlMREEzcTdvcTFvczRN?=
 =?utf-8?B?R2kyUGJ0c2RyeEY2c3dqYmRHOVp1aWN3ZjFmdjEwZ3IzbGV1emthbEdablZF?=
 =?utf-8?B?ZStKOHl5RzJiZEZMc3Y1NEpJbURXcDRqb29WWU1xZ1d3ZXVoVnBydkkyWVh6?=
 =?utf-8?B?NElheGhDRVlDY3M0eTBrM1o3MEJPTEgvV01QcHNhdm9TZ0NycXRVVTlPQWg5?=
 =?utf-8?B?STlGT1lFWS9JbUhRbG1CMUZlNHpKOHcxRFN3Q1dRQ1FTeE9XWXppbkhrYW9F?=
 =?utf-8?B?bi9RZWVrN09wUjlQQlFYSWxjZnpTeDJDTWI1YW9GeWtYTDRYTmE0NmNKRWMw?=
 =?utf-8?B?dHFIOUg0Z0lNbjZybXVIaW9IWVVweER5em1WTVJqMUQxQ1JrMEVicU5WRCta?=
 =?utf-8?B?Nnl1Z2tZMDYzNTg3aXlvNkU0MUt6L2s0aExMZUFxWlRjVUZjaGtxSUFxMnBj?=
 =?utf-8?B?UzFES0JsVW5YTzhFbnNveHRKSHJRSUFISkRia0l4MlJwcFkwcU5vL0NzeUgz?=
 =?utf-8?B?MUkzcjJFQVowQzZ1V2pDQWVJdGkycTVMb0trSE5Wam03YmU0UmZ3YmdKWno2?=
 =?utf-8?B?bnFiT1VzM1loeDkzcE1xOWJsNzh3N08wU1ozRmZjQ2dlTFROMVllMGhxM3BB?=
 =?utf-8?B?MWRRNlJmM1dkbnhzeTUyRHBQMlNpVWtVd2QwUG43VUdZcklnS200YWpwMmFs?=
 =?utf-8?B?ZUdMcTF3VWFPNUNQMk1tTHVadlpHWEZweitwM3JBMGRuRU8yRVlSdHhaa1Jk?=
 =?utf-8?B?N1hjdTlLVGwwS0RMUkkrZndaWHFQdkhQaGYzMm9UWGRiWXdKQ0tjdHZEMXIv?=
 =?utf-8?B?VkhJMll1RzFZYyttbVlJRDZMWU9mSWh3Mko2ek5zK2NEaEYzTFozSUViRVBq?=
 =?utf-8?B?ckJrWU5XejhhTEVaUUpFS2plV3QvSXRldk9CM1RtVDJSazdSc2Jha1hrQVl6?=
 =?utf-8?B?Z2cvY2pLcm1nMXEvNjV0blhGdm5jZjhMbkZjVEE0YXRrNXhFRkkrUTB0d2lM?=
 =?utf-8?B?MlJDZU5vcFk0dSsraE5yNEc2Z3hRU3BBemM2VEN3QUJjelNmbHgvVW9OSXBq?=
 =?utf-8?B?cENhZGNhd3lMZ3I4N3dwRS92S05TcDA4VVRvRXMwSmVHL1JES2NxcWxtem5H?=
 =?utf-8?B?OXMxREdmQWY5UzBhWm5taVJOaXdMWnZoV3djQWRCZE1hbm5wMFlLdGQ1R0hh?=
 =?utf-8?B?dFNSd3c5Z3gyRlFZeXNUbFd1dHhKdzFVSjBjNm0zZ0pmWkR0a240S3ZySDlI?=
 =?utf-8?B?UXhIS0k0ci9UZU8vMHBPVHpudlJIeTNxK2R0KzJnV3Q3Q0hWM0t2RUdrNEUv?=
 =?utf-8?B?VGpoUUFLd3BnZGlwb3dDVXJMczdqa0RwMWdiUzN6Z1N5SlpseTl3TFZPeFE5?=
 =?utf-8?B?RHo5VS9hYmxsUHZwekZ4clJjMlZjd2x6UVZiRWN0MlFnckt3YVE5TndmTTRa?=
 =?utf-8?B?dFFaVXJrL3A1ZjU3WWJrY0Fxczh3TThZZnpLeEJqd1VianRxTzVOUHRwamFQ?=
 =?utf-8?B?Vmw4Sk1VeWtIRzF4WnBQMkFiNVZ3MmpUZU05NGFDVHAwbVJPQTNWNjJkeEtm?=
 =?utf-8?B?STd5aEJRSWk0Y0Y0SjNYaytneW5DQVI5cGQzSmcyaS9EV0hGV3BVbEhya1VX?=
 =?utf-8?B?Y1QydEFiNGZjb1ora0VhQk1zdG9xcGQ0SzdJZG9wdG5mY1pWSkdORGo0NXpw?=
 =?utf-8?B?TWRNVGE5VXlOcHdGb2VaN3lScGNvK0hhVCtNbnh2MG9aYVp4YWNpMm45V1VT?=
 =?utf-8?B?eEdGL1dWSjhuWnVyZnpubkVMQy9SN0dWSGxhOE1xcnVCVlpmSGlsRUowUW5t?=
 =?utf-8?B?YURhc3FPM2Rab0lac3dKL1hQaEY1WG81TmpBKy9CYjdFNmhITDZUSG9Ga050?=
 =?utf-8?B?ZDIyZEp2RXZ4d2toOGJLZ1FXY3BoZjNvcCtmSUVJd1gyVjdMVUJKbzRtQmFU?=
 =?utf-8?B?Vmg5V25KMERTN1Z5dTBNVlhlUk1PbzhCQi9ZODYzQ1Y5TkNMYVBrYnZCSXdS?=
 =?utf-8?B?TENNSXpCNjhUeWlrcE01ZkRwbGdUa3FhN09iaVpHUHlBNWhTUnU3dHFQT1FJ?=
 =?utf-8?B?YUZVREk5QXVnWUNBZm52dTZRNExXWnhuTTR6ZWxqdm1zNk9jcVIrY01oZWJ3?=
 =?utf-8?B?ZWF1eGxsQkJWdkhCZHZzMjExNWVBc0c0NlJWSHRzNWdkUm4xcW9Lay9qTzEw?=
 =?utf-8?B?U3FXNmRteGtpOExhQkNodW9TSHpLc0JQdWZUcW9QTGhCa0N3Y0hZaFh6dGxk?=
 =?utf-8?B?RHMrUER0VjY3SE5FSFdhVmQrYnhTSHZTVUdYeEozbVFuNnpKaDFRU3U4ek81?=
 =?utf-8?Q?e1bsW1+4jUrUBwA1Dxysg/nC5mmshbz6u44OJYc+5ymvF?=
X-MS-Exchange-AntiSpam-MessageData-1: 1upC1PVD8FZyuw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ffcc7b-a849-49ed-50a5-08dedb15c102
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 04:19:21.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJBBaH4/mJVSDDbZSDuiTX72hzP/veXiorzt2+DkJw8lsjAEL/Wgmj2+bcZ/VpkoWZdfAejpLbQIZsUF1nr07w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

Hi Zhi,

This is looking pretty good to me overall, a few remarks/questions
below. None of these should require big changes.

On Tue Jun 30, 2026 at 12:01 AM JST, Zhi Wang wrote:
<...>
> +/// A fwctl device.
> +///
> +/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C `fw=
ctl_alloc_device()` layout
> +/// convention. Contains a pointer to the [`Registration`]'s data, set a=
t registration time and
> +/// cleared on unregistration.
> +///
> +/// # Invariants
> +///
> +/// - `dev` is embedded at offset 0 and is initialised by fwctl.
> +/// - The fwctl refcount owns the allocation lifetime.
> +/// - `registration_data` is either `NonNull::dangling()` (before regist=
ration / after
> +///   unregistration) or points to valid data owned by the [`Registratio=
n`].
> +#[repr(C)]
> +pub struct Device<T: Operations> {
> +    dev: Opaque<bindings::fwctl_device>,
> +    registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>=
,
> +}
> +
> +impl<T: Operations> Device<T> {
> +    /// Allocate a new fwctl device.
> +    ///
> +    /// Returns an [`ARef`] that can be passed to [`Registration::new()`=
]
> +    /// to make the device visible to userspace.
> +    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<Se=
lf>> {
> +        const_assert!(
> +            core::mem::offset_of!(Self, dev) =3D=3D 0,
> +            "struct fwctl_device must be at offset 0"
> +        );
> +
> +        let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::=
<T>::VTABLE).cast_mut();
> +
> +        // SAFETY: `ops` is static, `parent` is bound, and `size` covers=
 the full `Device<T>`.
> +        let raw =3D unsafe {
> +            bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::me=
m::size_of::<Self>())
> +        };
> +
> +        if raw.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        let this =3D raw.cast::<Self>();
> +
> +        // INVARIANT: Set `registration_data` to dangling (no registrati=
on yet).
> +        // SAFETY: `this` points to the allocation just returned by fwct=
l.
> +        unsafe {
> +            core::ptr::addr_of_mut!((*this).registration_data)
> +                .write(UnsafeCell::new(NonNull::dangling()));
> +        };
> +
> +        // SAFETY: `raw` owns the initial reference.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this)) })

How about replacing from `if raw.is_null() ...` with something more
functional-style:

    NonNull::new(raw.cast::<Self>())
        .map(|this| {
            // INVARIANT: Set `registration_data` to dangling (no registrat=
ion yet).
            // SAFETY: `this` points to the allocation just returned by fwc=
tl.
            unsafe {
                (&raw mut (*this.as_ptr()).registration_data)
                    .write(UnsafeCell::new(NonNull::dangling()))
            };
            // SAFETY: `this` owns the initial reference.
            unsafe { ARef::from_raw(this) }
        })
        .ok_or(ENOMEM)

It's not just cosmetic: it removes one call to an unsafe method
(`NonNull::new_unchecked`), carries the fact that `this` is not NULL in
the type system from the get-go (instead of relying on an explicit
check), and makes the transition steps from the raw pointer to the
`ARef` more explicit.

> +    }
> +
> +    #[inline]
> +    fn as_raw(&self) -> *mut bindings::fwctl_device {
> +        self.dev.get()
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a valid `fwctl_device` embedded in a `Device=
<T>`.

nit: missing doclink: [`Device<T>`].

> +    #[inline]
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_device) -> &'a Self=
 {
> +        // SAFETY: The caller upholds the offset-0 `Device<T>` invariant=
.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns a reference to the registration data.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure the device is registered, i.e. that this =
is called within a fwctl
> +    /// callback protected by `registration_lock`. The pointer cast from
> +    /// `RegistrationData<'static>` to `RegistrationData<'_>` is sound b=
ecause lifetimes do not
> +    /// affect layout, and the data is guaranteed alive for the duration=
 of the borrow.

The last sentence is not part of the safety contract with callers, and
is also repeated in the `SAFETY` comment (where it does belong), so it
should be removed imho.

> +    #[inline]
> +    unsafe fn registration_data_unchecked(&self) -> &T::RegistrationData=
<'_> {
> +        // SAFETY: Caller guarantees the device is registered, so the po=
inter is valid.
> +        // Lifetimes do not affect layout, so the cast is sound.
> +        unsafe { (*self.registration_data.get()).cast::<_>().as_ref() }
> +    }
> +}
> +
> +impl<T: Operations> AsRef<device::Device> for Device<T> {
> +    #[inline]
> +    fn as_ref(&self) -> &device::Device {
> +        // SAFETY: `self` contains a live fwctl_device.
> +        let dev =3D unsafe { core::ptr::addr_of_mut!((*self.as_raw()).de=
v) };

This can be

    let dev =3D unsafe { &raw mut (*self.as_raw()).dev };

> +        // SAFETY: The embedded device is initialised by fwctl.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +// SAFETY: `fwctl_get` increments the refcount of a valid fwctl_device.
> +// `fwctl_put` decrements it and frees the device when it reaches zero.
> +unsafe impl<T: Operations> AlwaysRefCounted for Device<T> {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: `self` holds a live reference.
> +        unsafe { bindings::fwctl_get(self.as_raw()) };
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The caller owns a live reference.
> +        unsafe { bindings::fwctl_put(obj.cast().as_ptr()) };
> +    }
> +}
> +
> +// SAFETY: `Device<T>` is refcounted by the fwctl core and may be releas=
ed from any thread.
> +unsafe impl<T: Operations> Send for Device<T> {}
> +
> +// SAFETY: Shared access to the embedded `fwctl_device` is protected by =
the fwctl core. The
> +// `registration_data` field is only mutated before registration and aft=
er unregistration (both
> +// single-threaded with respect to callbacks).
> +unsafe impl<T: Operations> Sync for Device<T> {}
> +
> +/// A registered fwctl device.
> +///
> +/// Carries the lifetime `'a` of the parent device to ensure that [`fwct=
l_unregister`] runs (via
> +/// [`Drop`]) before the parent driver unbinds. Owns the
> +/// [`RegistrationData`](Operations::RegistrationData) which is accessib=
le during callbacks via the
> +/// pointer stored in [`Device`].

This paragraph sounds like an implementation detail and not necessarily
useful information to users.

> +///
> +/// On drop the device is unregistered (all user contexts are closed and=
 `ops` is set to `NULL`)
> +/// and the registration data is dropped.
> +///
> +/// [`fwctl_unregister`]: srctree/drivers/fwctl/main.c
> +pub struct Registration<'a, T: Operations> {
> +    dev: ARef<Device<T>>,
> +    _reg_data: Pin<KBox<T::RegistrationData<'a>>>,
> +}
> +
> +impl<'a, T: Operations> Registration<'a, T> {
> +    /// Register a previously allocated fwctl device with the given regi=
stration data.
> +    ///
> +    /// The `reg_data` is owned by the registration and accessible durin=
g callbacks via
> +    /// `Device::registration_data_unchecked()`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must not `mem::forget()` the returned [`Registration`] o=
r otherwise prevent its
> +    /// [`Drop`] implementation from running, since `fwctl_unregister` m=
ust be called before the
> +    /// parent device is unbound.
> +    ///
> +    /// `dev` must be an unregistered [`Device`] that is not associated =
with any live
> +    /// [`Registration`], and no other thread may attempt to register th=
e same device concurrently.
> +    pub unsafe fn new(
> +        _parent: &'a device::Device<device::Bound>,

Why do we need `_parent`? Is it to provide a proof that the parent
device is bound by the time of registration? If so, there is an obvious
loophole: this method will accept any bound device, not necessarily the
actual parent that was passed to `Device::new`.

We should either store an `ARef<device::Device>` in `fwctl::Device` to
perform the check at runtime, or add a requirement in the `Safety`
paragraph that `_parent` must be the actual parent, since the method is
already `unsafe` anyway.

> +        dev: &Device<T>,
> +        reg_data: impl PinInit<T::RegistrationData<'a>, Error>,
> +    ) -> Result<Self> {
> +        let reg_data: Pin<KBox<T::RegistrationData<'a>>> =3D KBox::pin_i=
nit(reg_data, GFP_KERNEL)?;
> +
> +        // Store the registration data pointer in the device before regi=
stration, so that it is
> +        // visible once callbacks can be invoked.
> +        //
> +        // SAFETY: Lifetimes do not affect layout, so the pointer cast i=
s sound.
> +        let ptr: NonNull<T::RegistrationData<'static>> =3D
> +            unsafe { mem::transmute(NonNull::from(Pin::get_ref(reg_data.=
as_ref()))) };

The only unsafe part of this statement is the `mem::transmute`. In such
cases, I think it is worth using an intermediate variable for the
non-unsafe part so non-checked unsafe operations don't slip in if the
code is modified, e.g.:

    let r =3D NonNull::from(Pin::get_ref(reg_data.as_ref()));
    ...
    let ptr: NonNull<T::RegistrationData<'static>> =3D unsafe { mem::transm=
ute(r) };
=20
> +
> +        // SAFETY: No concurrent access; the device is not yet registere=
d.
> +        unsafe { *dev.registration_data.get() =3D ptr };
> +
> +        // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
> +        let ret =3D unsafe { bindings::fwctl_register(dev.as_raw()) };
> +        if ret !=3D 0 {
> +            // SAFETY: No concurrent readers; registration failed.
> +            unsafe { *dev.registration_data.get() =3D NonNull::dangling(=
) };
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Self {
> +            dev: dev.into(),
> +            _reg_data: reg_data,
> +        })
> +    }
> +}
> +
> +impl<T: Operations> Drop for Registration<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: The Registration lifetime guarantees that the parent =
device is still bound.
> +        // `fwctl_unregister` takes the write lock, closes all user cont=
exts, and sets ops=3DNULL.
> +        // After it returns, no callbacks can be running or will run.
> +        unsafe { bindings::fwctl_unregister(self.dev.as_raw()) };
> +
> +        // SAFETY: `fwctl_unregister` guarantees no concurrent readers.
> +        unsafe { *self.dev.registration_data.get() =3D NonNull::dangling=
() };
> +
> +        // `self._reg_data` is dropped here, after callbacks have stoppe=
d.
> +    }
> +}
> +
> +// SAFETY: `Registration` can be sent between threads; the underlying fw=
ctl_device uses internal
> +// locking.
> +unsafe impl<T: Operations> Send for Registration<'_, T> {}
> +
> +// SAFETY: `Registration` provides no mutable access; the underlying fwc=
tl_device is protected by
> +// internal locking.
> +unsafe impl<T: Operations> Sync for Registration<'_, T> {}

IIUC all the fields of `Registration` are already `Send` and `Sync`, so
we don't need these manual implementations.

> +/// Internal per-FD user context wrapping `struct fwctl_uctx` and `T`.
> +///
> +/// Not exposed to drivers; they work with `&T` / `Pin<&mut T>` directly=
.
> +#[repr(C)]
> +#[pin_data]
> +struct UserCtx<T: Operations> {
> +    #[pin]
> +    fwctl_uctx: Opaque<bindings::fwctl_uctx>,
> +    #[pin]
> +    uctx: T,
> +}
> +
> +impl<T: Operations> UserCtx<T> {
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T=
>`.
> +    #[inline]
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a Self {
> +        // SAFETY: The caller upholds the `UserCtx<T>` embedding invaria=
nt.
> +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, fwctl_uct=
x) }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T=
>`.
> +    /// The caller must ensure exclusive access to the `UserCtx<T>`.
> +    #[inline]
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a mu=
t Self {
> +        // SAFETY: The caller upholds the embedding and exclusivity inva=
riants.
> +        unsafe { &mut *container_of!(Opaque::cast_from(ptr), Self, fwctl=
_uctx).cast_mut() }
> +    }
> +
> +    /// Returns a reference to the fwctl [`Device`] that owns this conte=
xt.
> +    #[inline]
> +    fn device(&self) -> &Device<T> {
> +        // SAFETY: fwctl initialises this pointer before any driver call=
back.
> +        let raw_fwctl =3D unsafe { (*self.fwctl_uctx.get()).fwctl };
> +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layou=
t.
> +        unsafe { Device::from_raw(raw_fwctl) }
> +    }
> +}
> +
> +/// Static vtable mapping Rust trait methods to C callbacks.
> +pub struct VTable<T: Operations>(PhantomData<T>);
> +
> +impl<T: Operations> VTable<T> {
> +    /// The fwctl operations vtable for this driver type.
> +    pub const VTABLE: bindings::fwctl_ops =3D bindings::fwctl_ops {
> +        device_type: T::DEVICE_TYPE as u32,
> +        uctx_size: core::mem::size_of::<UserCtx<T>>(),

Aren't the alignment concerns raised on [1] still valid? Since the user
context is allocated by the C side, we need to make sure that Rust's
alignment expectations are properly met.

[1] https://lore.kernel.org/all/DGUZ4A6W87JU.36R2KDR7YGSEX@kernel.org/

> +        open_uctx: Some(Self::open_uctx_callback),
> +        close_uctx: Some(Self::close_uctx_callback),
> +        info: Some(Self::info_callback),
> +        fw_rpc: Some(Self::fw_rpc_callback),
> +    };
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must be a valid `fwctl_uctx` embedded in a `UserCtx<T>` w=
ith
> +    /// sufficient allocated space for the uctx field.
> +    unsafe extern "C" fn open_uctx_callback(uctx: *mut bindings::fwctl_u=
ctx) -> ffi::c_int {
> +        const_assert!(
> +            core::mem::offset_of!(UserCtx<T>, fwctl_uctx) =3D=3D 0,
> +            "struct fwctl_uctx must be at offset 0"
> +        );
> +
> +        // SAFETY: fwctl sets this pointer before calling `open_uctx`.
> +        let raw_fwctl =3D unsafe { (*uctx).fwctl };
> +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layou=
t.
> +        let device =3D unsafe { Device::<T>::from_raw(raw_fwctl) };
> +
> +        // SAFETY: open_uctx is called under registration_lock read; the=
 device is registered.
> +        let reg_data =3D unsafe { device.registration_data_unchecked() }=
;

This `from_raw`..`registration_data_unchecked` sequence is performed by
all hooks, how about factoring them out in a helper function?

> +
> +        let initializer =3D T::open(device, reg_data);
> +
> +        let uctx_offset =3D core::mem::offset_of!(UserCtx<T>, uctx);
> +        // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
> +        let uctx_ptr: *mut T =3D unsafe { uctx.cast::<u8>().add(uctx_off=
set).cast() };
> +
> +        // SAFETY: `uctx_ptr` addresses the uninitialised pinned context=
.
> +        match unsafe { initializer.__pinned_init(uctx_ptr.cast()) } {

This `cast` is unneeded here IIUC.

> +            Ok(()) =3D> 0,
> +            Err(e) =3D> e.to_errno(),
> +        }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> +    unsafe extern "C" fn close_uctx_callback(uctx: *mut bindings::fwctl_=
uctx) {
> +        // SAFETY: fwctl keeps the owning device live for this callback.
> +        let device =3D unsafe { Device::<T>::from_raw((*uctx).fwctl) };
> +
> +        // SAFETY: close_uctx is called under registration_lock write (f=
rom fwctl_unregister) or
> +        // under registration_lock read (from fwctl_fops_release); the d=
evice is registered.
> +        let reg_data =3D unsafe { device.registration_data_unchecked() }=
;
> +
> +        // SAFETY: close is called for an opened Rust user context.
> +        let ctx =3D unsafe { UserCtx::<T>::from_raw_mut(uctx) };
> +
> +        {
> +            // SAFETY: fwctl never moves an opened user context.
> +            let pinned =3D unsafe { Pin::new_unchecked(&mut ctx.uctx) };
> +            T::close(pinned, device, reg_data);
> +        }
> +
> +        // SAFETY: close is the last callback before fwctl frees the all=
ocation.
> +        unsafe { core::ptr::drop_in_place(&mut ctx.uctx) };
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> +    /// `length` must be a valid pointer.
> +    unsafe extern "C" fn info_callback(
> +        uctx: *mut bindings::fwctl_uctx,
> +        length: *mut usize,
> +    ) -> *mut ffi::c_void {
> +        // SAFETY: info is called for an opened Rust user context.
> +        let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
> +        let device =3D ctx.device();
> +
> +        // SAFETY: info is called under registration_lock read; the devi=
ce is registered.
> +        let reg_data =3D unsafe { device.registration_data_unchecked() }=
;
> +
> +        // SAFETY: fwctl never moves an opened user context.
> +        let pinned =3D unsafe { Pin::new_unchecked(&ctx.uctx) };
> +
> +        match T::info(pinned, device, reg_data) {
> +            Ok(kvec) if kvec.is_empty() =3D> {
> +                // SAFETY: `length` is a valid out-parameter.
> +                unsafe { *length =3D 0 };
> +                // Return NULL for empty data; kfree(NULL) is safe.
> +                core::ptr::null_mut()
> +            }
> +            Ok(kvec) =3D> {
> +                let (ptr, len, _cap) =3D kvec.into_raw_parts();
> +                // SAFETY: `length` is a valid out-parameter.
> +                unsafe { *length =3D len };
> +                ptr.cast::<ffi::c_void>()
> +            }
> +            Err(e) =3D> Error::to_ptr(e),
> +        }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> +    /// `rpc_in` must be valid for `in_len` bytes. `out_len` must be val=
id.
> +    unsafe extern "C" fn fw_rpc_callback(
> +        uctx: *mut bindings::fwctl_uctx,
> +        scope: u32,
> +        rpc_in: *mut ffi::c_void,
> +        in_len: usize,
> +        out_len: *mut usize,
> +    ) -> *mut ffi::c_void {
> +        let scope =3D match RpcScope::try_from(scope) {
> +            Ok(s) =3D> s,
> +            Err(e) =3D> return Error::to_ptr(e),
> +        };
> +
> +        // SAFETY: RPC is called for an opened Rust user context.
> +        let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
> +        let device =3D ctx.device();
> +
> +        // SAFETY: fw_rpc is called under registration_lock read; the de=
vice is registered.
> +        let reg_data =3D unsafe { device.registration_data_unchecked() }=
;
> +
> +        // SAFETY: fwctl passes a valid in/out buffer for this callback.
> +        let rpc_in_slice: &mut [u8] =3D
> +            unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_l=
en) };

Name nit: technically this is not just an `in` slice, since the reply
might be written into it.

> +
> +        // SAFETY: fwctl never moves an opened user context.
> +        let pinned =3D unsafe { Pin::new_unchecked(&ctx.uctx) };
> +
> +        match T::fw_rpc(pinned, device, reg_data, scope, rpc_in_slice) {

The C side passes `out_len` to its callback, don't we want to do the
same here?

> +            Ok(FwRpcResponse::InPlace(len)) =3D> {
> +                if len > in_len {
> +                    return Error::to_ptr(EINVAL);
> +                }
> +
> +                // SAFETY: `out_len` is valid.
> +                unsafe { *out_len =3D len };
> +                rpc_in
> +            }
> +            Ok(FwRpcResponse::NewBuffer(kvec)) =3D> {
> +                let (ptr, len, _cap) =3D kvec.into_raw_parts();
> +                // SAFETY: `out_len` is valid.
> +                unsafe { *out_len =3D len };

Both arms are writing `*out_len` and require an `unsafe` statement. We
could factor these out into a single one by returning a `(len, res)`
tuple from the match statement, and writing `out_len` once out of it.

> +                ptr.cast::<ffi::c_void>()
> +            }
> +            Err(e) =3D> Error::to_ptr(e),

(if you follow my recommendation above, then this needs to become a
return statement).

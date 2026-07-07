Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966F3F8890;
	Tue,  7 Jul 2026 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424033; cv=fail; b=EfdRhWU4Bhd6+UY1vPDexjvzk9W/yYeAl2f5l5y4Lz30/9THLgjLyeLCAWFPAo30RbF9PVOT53fiDFVttUxBCGfoIR73vdHaEgnyZJrFF3ZaWX0Tba2lL+zi+cnryqxzmz3m+jPjdW5/Tt6WitnFYHEHj7wG1eqwWc2+nw78HIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424033; c=relaxed/simple;
	bh=LyUIm3R9620XlKQj9Hx8vGIr6kL9SiQg3nC+zgImVPg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=m5eEjfzvNB+dvX1iEW2DRNieXv4ROvZO774v9e7bsO2qDPyNuhPWt3cm/qY0JePX0ubj4YcQH/HJYHmihLUJ9iOiTzXUoBurVnM3UR9TEHw2uQJOuUIpbZdti/vV7RVsqIKazORy9pioemUHLSsvUDoa2MP/EDn45owEbYJz+Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PV8lYvK0; arc=fail smtp.client-ip=40.93.196.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PV8lYvK0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPbmgOcXpXt0yPE+TfCwtERT8xn5HJRjGWFzj0XLkZjaQJXNt0Q2oc5p0Gdksot5mwuYtPbbYFRjRM8tRVMT4a7zubOsFUkbMvwVWx30XDjgZUh9zFMpaz2pHGk2ZuquFRbWm3fJ1m1fEPughfZFqnTbTjFdz2XyAepbxjMtG7EQwtbW1NCdLL4RpzEfQEv5JztEj0HLOwte5zA3bAp9WP06DEGO9xjtdoRdYDFbumGbHL/6RfoOeygy7qUxwVPzhP0w5FVLwOvjL/rN6gb9MKO94OmavHKvtauekcc3vRpZ9TQXaDdiZGa5+Me3+LogYR41qg8zx72R5jC21b2T9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q4nZu7TCrBMJmjCE6VshP0pculNCZWq7lucmOzCmAw=;
 b=n3d9nSCJYhPv55bVk+lIp8S3j2X0fgJS9O5BQuk6OxnYv2El3mLCqomSROevLbakfiNLQo2CJuBsoDCfg0slioHc9khjAB/xs3N05ZWi1RGyoFyXlUIMA4jSv6yGAlj5df05pTCsHP4qCudnZtPSOjZO3PsM6iZIb415Qy2Bwt9kHVyNm0m3XwY8woLS8S/1lHM5iGZhGHKIOHpY33IQtl2W99wpTzoKfOqhJ8LMCjRdyf5GDuvXdNvMtJMv3fB+/ZvIZobF8EU8L2I100UdSUuDa0Ez74CrZNeEXJd6/J6qrebeHQzhs3C41QxhhBdNTjh52q4Hl3RESNaXrhL5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q4nZu7TCrBMJmjCE6VshP0pculNCZWq7lucmOzCmAw=;
 b=PV8lYvK0ZrNtQLpQbyfBknhTI+wn9FcPvXu67FL3+8TB9vu5Tixj2RkKCbUPGX/FFxgJq9dJV1eXV/ndTS+ECLI6RHVZ5PpIdxF53hbKbJ9DbtxXYkUSIDVizE35JzgVpWC48HBDw4WBMrmV4nvJPbvmDOaqI7kH/euAMvNyughyfTKWS89RWK+lFtbPHWzYTGuxhrPvt+phEz4ZPjJwq6dPiCCEu8coskBo+9FaBUPenBvVNGpFKKZIND7rZ4kJ0kX+nLNxfpo3R7C6BOSqZS80nvLjwhW+v4f1iRjxTpot3dXXg8lgowOj+Eh+YxIQnSC525buYlpWDACA6PrP9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 11:33:46 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 11:33:46 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 20:33:40 +0900
Message-Id: <DJSB1WPVIRLZ.1Q1KR23BQTMRE@nvidia.com>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <jgg@nvidia.com>,
 <dave.jiang@intel.com>, <saeedm@nvidia.com>, <jic23@kernel.org>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260629150156.3169384-1-zhiw@nvidia.com>
 <20260629150156.3169384-2-zhiw@nvidia.com>
 <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
 <DJRH022OWTTK.1KPQDQHKG7CTF@garyguo.net>
In-Reply-To: <DJRH022OWTTK.1KPQDQHKG7CTF@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2407e3-3bb8-4f90-a595-08dedc1b9a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|23010399003|1800799024|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nXKlhSi+awTqpp3XSPUhpFEslf+HGtMhvHCLkAXmcNzSFkGxDqW2XxD8xB1PYgH6eEKuLeZ98ZtefwWD5UGPU7p7RJ5wK0We+3q69i4TGdhojmVfm5el4fWd1kcni0/quHrOZnP4PcwZQe5Be4w5Qgb9R4/iR32Qs0R2g10llSvK01q1ntxmx/x+XlfKaTSD53Myj4K5gTXFbEJhPNPGgkgcchhF8bB2FFnQ2PYtltXUHf7vsFayEzZ0RaB7vXzgv/m97k6+KUX7/Ff5vnah7L7oeuPvsVVI9QPGsjt/1t/rfLZTQIEjssQatslYh4I6B6UIPKhIGLkOEiOWelZ6svtOGH9YOs7i0Z+k8JD4c3zx2JpK5eS0x3ImNf9dD9FkFsJT2tSHga7gT06PBIsLDXSEIHh9DhuWt5eit9ttgJR0whJaGwS5yBJf+bpbwM63ALM2mF0Gyobbu6fEfrLXgPzq8SoB3xZfGM/gjevJNvGaQZ0bl+OL79W+EyKYMCTNbO2yBuzTzaGon/aybE7a2N3yZ4Am3iPNq2OSJ7yRwYQRbeHHlZujGJ+szI7hzPRCOsBh1uZ3Z5LYQOEXpsNEHEp8jPTLmweidM19sPsaxDHAUw2kKJ85XDW4C2q6EvpAM9Ou0XqgaoNt8CIXsELURk+kEFC9a6T+M4qz9FclfpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(23010399003)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFByblN1YXlreS83d0kvam40R0xmM3pIWmZQTUdsbkkxcWxDUG9xZzU2a21D?=
 =?utf-8?B?WVcybUdXTXBuVFFwTHNKT3VoOEF2aDF5Y2pCdFlramtTZFB2Q2I1djdlbjlU?=
 =?utf-8?B?eHZ5Z0lMY0Y5RTA3aU4xTkZzZHo3clhMUmJla21xNFRiQndzNXRFb1YwbG1B?=
 =?utf-8?B?eG10UndCNnN1TE8zNXBYdmhXSy9kUG1LOFR2TXhDbTNScjQyQlRCdzcxcGt3?=
 =?utf-8?B?U2NmaFV3RlVvQVZMRGJUQzJCNWpNNmJQLzZNMDBKVldZUnVOOS82NzlpMXA0?=
 =?utf-8?B?ZmY4dUFXTlVOZnhmQlcyY2VkZC92R0pVWk53RmdwUXplaTM4M1hOSDl0UzRZ?=
 =?utf-8?B?MzlKZUdxVUd0S3V0bUNzVCtjbm9MaXlzY2RPVEpwZjZxTXRyaDFoZU9FSjFJ?=
 =?utf-8?B?b3hBVXplekdzN0NUUXM5ZWV3M25FTEVKZGJ5ZzlYVVIxcUV6UXJodnJaMGl1?=
 =?utf-8?B?eGg4ODAxZ0tsNlRPM28yRlllVTd5ZVY2U29jWENwN1RjNnBqVlRMbnZoMlNl?=
 =?utf-8?B?UDcvZkdJUVJoUDRlZTNkcGo5RGFSdzBlT1B6alZBck95UVdDbU0zWlU3Zmdp?=
 =?utf-8?B?VVh1L1c4dGdkL05ZV0xVNElmNTZzVFRWWjRRMDFjMjdORytCY0RzZTZrRDZC?=
 =?utf-8?B?KzMyalJqVG4va1hDSGo0ZklKdVpQbUxwYllyamVGT0NrTllJd2xwWVFHWllF?=
 =?utf-8?B?ZjdkWW4rbllKQk5YamhsZlA5TXJCdCs0Tk5kc1J1Qjl4enR6WXVoNWpWeThJ?=
 =?utf-8?B?SnZWZ2tKQVJIM2NTdEVpdjNXbmo3UEJSOXdSalNaZXVwTzVvcnRCZDdTd3pR?=
 =?utf-8?B?NkJ2bXlDOExOajBjKzBKWE14Yjc0NUN4R3lOWVpxTkZDc29iSHhubkVvNUFt?=
 =?utf-8?B?RkxrRzBOdDhEZFBlUUhlUVArSnpOUHkxKzVzMk9ycFkzSkVYNnZxZkp1NjZw?=
 =?utf-8?B?MlcwRVdOR05RNWJ6bWtnc05DQTZ5QjduenkxRk1NZ21yTDYxc2d6S09aRGp1?=
 =?utf-8?B?cjZaaWtuajR6azRYcDFxMStNUHZRQXJmdVhIOXF4bmQ4NVVhZW9RU0V1aVJG?=
 =?utf-8?B?cExRdlp0LzhqanpJTnQwNEhiZzgxUkxVNGdMRXhXaHdVM2VNM1NzNWhqeis5?=
 =?utf-8?B?SUh1Y0NqQVZESFNOd1pqeXNOaGNaYVFmK2tIQzJqSkpFZ2ZzRVBJRTI1Mng3?=
 =?utf-8?B?TlpKQUpHcU45R2U2ejVwYnNIQjFHZGlwUmtPRHRYdi8xMldFUWQwWFYyTHVy?=
 =?utf-8?B?a1dnZnZ6ajhhV3FISXFTa3VuZXhWajZnazFSQnlZNE40dmZLcU1nT0dMRk51?=
 =?utf-8?B?OGoxRnFZeGdKczZ1V3ZKZGhYLzdRQmJ2RFNFRVFQQW9CVXJaSndGNEd3dnJV?=
 =?utf-8?B?ZmQyRTJsQzR4YmI1R0FxTVJPSEMyanRFcHFEd2oyOHprcGltUmdTZGQ2OGs4?=
 =?utf-8?B?aGN3NTh2VVNOejJGWG40WUFmUTU5c1gwQWhaUkNJMGt3MVJxK252bGZIN003?=
 =?utf-8?B?Z1RaNEpFMC9TOVJRR1NNck9ZRFBRbU9PZk9EOUtuSUhmRTBnYzdlMXMyUlQ2?=
 =?utf-8?B?ekYzc0craWNDeDFGUDNHb0tHamk1MzlobGhlSUVXdXZ2VDYxbDF3NWFlT0tC?=
 =?utf-8?B?U1BiL3ZUaElPQzZxUDlEWHBnSnZTY0d6eTloaEJIN0EyK1loVzZRSklGZWNz?=
 =?utf-8?B?dmJKK1JiQjFqdlBUbnRiaDE4VWtVR3lMa2sxUkI4cHpTNVpGSW4vVUtrNnlw?=
 =?utf-8?B?YnBOREZMYW5QWlFJZEc1VmZac2ZPK0pENmw4dkovY0F1M0FhZlRPeUtiSkt3?=
 =?utf-8?B?SDErMUUyOFZ0ODNMY1Z3V1JTUUxJMCtra0xnV2VGNFFtZVdwRVpZdkpDMUZE?=
 =?utf-8?B?bmY4KzZQbzAva0JOWDUyZUtZQ3pIRmNrUnJsQThoVUs5aDkwbllqUDcwY1Nm?=
 =?utf-8?B?YWZPc2MvMThrYmI3K1lBeHVnYkZvSUlOWHlkSkdUY05HQzlGeEU2MXVndDBP?=
 =?utf-8?B?TlNwWkdaSDV2NnNqWFYvWll3UHM3aUdtUHJsQmNTVXdhVW8xUUkxMTVmTUVK?=
 =?utf-8?B?dzZlb2gyallVVlR4RzhOUkJHTllvd29xYWZnMFFTOW0ySTVUODJqS2p3UG1Y?=
 =?utf-8?B?SHFCNHdOYmhUb0wxMG5XZ2JIcVoxWExtQitTVGZsak8vTFhEZFRMbGxEU05r?=
 =?utf-8?B?NzlyOTd4d3BMbFpNbjVGQlJhT3lDKzd4c05aRTV1cWhBYkJrczF1VGlnMHZF?=
 =?utf-8?B?SXlvTmhaRzB3SE5FTFYzUTZpZENaMGRlUDBtYWRwTFRxUjh3N1ltd1NsYjBq?=
 =?utf-8?B?eUtEeHZRT0xRLzI3d0hFQ216bEVKemo2MExIS2NRb0hJMTUvWXVyQlA5VUJR?=
 =?utf-8?Q?X0fga8YOZfPsrMyn3oSYquUM1+xLZ9l2t4FryF66i4iov?=
X-MS-Exchange-AntiSpam-MessageData-1: RCAVPTDRKqJyDQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2407e3-3bb8-4f90-a595-08dedc1b9a23
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:33:46.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlPqgR+dgLg1oiz/rdi0km4vu82E7RWAwBzAPiy3AYLd8ZetKH2FLQAac/yxdNJmHSrlDrgMgy93JEGwZgvKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598

On Mon Jul 6, 2026 at 9:00 PM JST, Gary Guo wrote:
> On Mon Jul 6, 2026 at 5:19 AM BST, Alexandre Courbot wrote:
>> Hi Zhi,
>>
>> This is looking pretty good to me overall, a few remarks/questions
>> below. None of these should require big changes.
>>
>> On Tue Jun 30, 2026 at 12:01 AM JST, Zhi Wang wrote:
>> <...>
>>> +/// A fwctl device.
>>> +///
>>> +/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C `=
fwctl_alloc_device()` layout
>>> +/// convention. Contains a pointer to the [`Registration`]'s data, set=
 at registration time and
>>> +/// cleared on unregistration.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// - `dev` is embedded at offset 0 and is initialised by fwctl.
>>> +/// - The fwctl refcount owns the allocation lifetime.
>>> +/// - `registration_data` is either `NonNull::dangling()` (before regi=
stration / after
>>> +///   unregistration) or points to valid data owned by the [`Registrat=
ion`].
>>> +#[repr(C)]
>>> +pub struct Device<T: Operations> {
>>> +    dev: Opaque<bindings::fwctl_device>,
>>> +    registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>=
>>,
>>> +}
>>> +
>>> +impl<T: Operations> Device<T> {
>>> +    /// Allocate a new fwctl device.
>>> +    ///
>>> +    /// Returns an [`ARef`] that can be passed to [`Registration::new(=
)`]
>>> +    /// to make the device visible to userspace.
>>> +    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<=
Self>> {
>>> +        const_assert!(
>>> +            core::mem::offset_of!(Self, dev) =3D=3D 0,
>>> +            "struct fwctl_device must be at offset 0"
>>> +        );
>>> +
>>> +        let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable=
::<T>::VTABLE).cast_mut();
>>> +
>>> +        // SAFETY: `ops` is static, `parent` is bound, and `size` cove=
rs the full `Device<T>`.
>>> +        let raw =3D unsafe {
>>> +            bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::=
mem::size_of::<Self>())
>>> +        };
>>> +
>>> +        if raw.is_null() {
>>> +            return Err(ENOMEM);
>>> +        }
>>> +
>>> +        let this =3D raw.cast::<Self>();
>>> +
>>> +        // INVARIANT: Set `registration_data` to dangling (no registra=
tion yet).
>>> +        // SAFETY: `this` points to the allocation just returned by fw=
ctl.
>>> +        unsafe {
>>> +            core::ptr::addr_of_mut!((*this).registration_data)
>>> +                .write(UnsafeCell::new(NonNull::dangling()));
>>> +        };
>>> +
>>> +        // SAFETY: `raw` owns the initial reference.
>>> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this)) })
>>
>> How about replacing from `if raw.is_null() ...` with something more
>> functional-style:
>>
>>     NonNull::new(raw.cast::<Self>())
>>         .map(|this| {
>>             // INVARIANT: Set `registration_data` to dangling (no regist=
ration yet).
>>             // SAFETY: `this` points to the allocation just returned by =
fwctl.
>>             unsafe {
>>                 (&raw mut (*this.as_ptr()).registration_data)
>>                     .write(UnsafeCell::new(NonNull::dangling()))
>>             };
>>             // SAFETY: `this` owns the initial reference.
>>             unsafe { ARef::from_raw(this) }
>>         })
>>         .ok_or(ENOMEM)
>
> I would rather do
>
>     let this =3D NonNull::new(raw.cast::<Self>()).ok_or(ENOMEM);
>     // use this
>
> for a more linear style. Map shouldn't be needed.

That works too, the main thing being using `NonNull` early on to avoid
the `new_unchecked`.

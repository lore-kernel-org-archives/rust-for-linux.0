Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022124.outbound.protection.outlook.com [52.101.96.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53E30C156;
	Fri, 28 Aug 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926730; cv=fail; b=HDQVU9Ttr1gkD/D2MyU9leDUIe3LgxSkxOSDh2G0kSXKLf0qEjBNxNUuDD90STyTqXUVkHMw1e+cRGx3TH/4LvJu4qdpH+ka5dy7sCXjUPUI6PWQZE1kZYqhCpMc+pYGwiLhP2UJJNrGi/pdL0y8u5FWB7Z3VzaQDtZreKK9jek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926730; c=relaxed/simple;
	bh=oNPXjgbrBFsm2RNP9OSvLFGG9Z2VByABY7PImK2EzG4=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=eOu/8ThhYT3y5i9fN0t3x1OQotPxQoZ1E9QioB7dEsulUksRqDn//tiha7IrLRq8UXKgLd/Woo7eMFdDRGzUaFR1wGrfkS4OGF26u0m0OY6n2Un0taZDB5K0Vryz8TndaiRy3tbnQ3Q4oUA8kcvQ5+KDIlynPDWd+I/pupkTYjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AVh75MV1; arc=fail smtp.client-ip=52.101.96.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AVh75MV1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtKlKEwWQ+s4BiG1wXxGqlzoBA2hMF4E+cIrhJXepb20n2RIzRiMjM0tBdRVu3DwckBhzV3bl/dE5PSGtRO22dBoVLIwIOYwjDZCiFk3/zNudbjsh8SDdvTOMFqAMtO6HtGfL9W0VPKr/Sf7CuI8LuVRg9zSAQqrNUULCWljjLlTBZ+toFrIIxrFHzxVTNfcT6BAAPDASbgkLOIlD8JxILDgeJ3GdE689dXSPfFa8BK03YlHfAUF4tGUMtQD/XitidtsduvAokyJ5ZW5mtf2ZqunKU9jzGwSux7pZDO3Gt883KRgwa4PHbnKSVqCtOcvrrwnQnWWfhraFiBSLCkNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZt1vtouPuDUpEB9LJBT7HWlFj1H32H8bAQB37Xpv80=;
 b=G9588NMi4nj0NxqMXhUQWmcWtEoQdu0NOOqYI6M0fAXmRyEGFXXqu1FcwF//xWuGJiyJXXRP/vr79L0w0hnByPCV+ciIC4IHch82kq4AJ7Z+Rj3F/ix+94ApcrDT7DbrSjSW4rfRjjFy2imfDBzvm+hFPFPIi3Sim/gyLRe18Frw4kYipKQk8t6NepP3/C/Xm8DIFX2/h9Vk6mi2Z2XXTt/mWz5mIgtyoiRQX8yv9cWWrHhm9CLiq3yBRVoDtKHWqTWO2YMsFSMinZEgK2658biUCbsc5Cex7E3yc33ex1NsRcWKco88cDtP4TRUJB31y4pVpStWW6rZdTL1yzmkPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZt1vtouPuDUpEB9LJBT7HWlFj1H32H8bAQB37Xpv80=;
 b=AVh75MV1cvHu7sRv4oSVQupQPI+O+mnKT+WP2dHHIpUN3SR7AWCWrIa8Z1MftoourkP/HBTAt9lPr/bIdWE2a0gk9rBRHwQFGTj0RBELoAwRg/amvfkwo2IWN6K7mZSzO37KzNFt+PB3L5gdLprhoLZ50MucYwCpP34KVllip8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LO7P265MB8761.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:18:40 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:18:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 15:18:39 +0100
Message-Id: <DL0N4JZSMKJ4.3SCNEZ9NL32T0@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Yury
 Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: num: add `cv!` macro to create values from
 constant expressions
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
 <20260828-cv-v1-2-694a695ff17f@garyguo.net>
In-Reply-To: <20260828-cv-v1-2-694a695ff17f@garyguo.net>
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LO7P265MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb98540-c2d9-4bfe-faa1-08df050f4230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|7416014|1800799024|10067099003|6133799003|22082099003|18002099003|56012099006|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	0l6wonPxS/AyPZ9BGMaAn+QlZiUFkCkhWDnAKb7SQaszzxdTXSFhU1et8cd79A1YNcVVrRYXAO5Ti8x7MBg13nOAJEtZvsARWQukm0vj6D88+g85q7KmuTtvPFiFLDqsQI1Dxu9ebsHsjEjfR3PAOsKeeA0pwUFgLbqmxiGZX+ufK6dSj1iFr15vSllMy7zCoXoGmVwq5rSEyjvfcIuGzykWV96ZtuuIYeCzVmrrtL8bb7GvnPdwiXkhuThmkt3WisvBRxAfp2bBT1hKHy3i5+OnXZMxcUPkP36KPu8t08R3bbzHIFNI1B72L/xwvJ/CDYx7rqa7QIBfIyELMjKEAhlypJ4zMoU/tMaZRotXPAGQqXIOnpQFHTuZsa0EP5K8d6AEC0wFz7l8H/l99G6FlHoy2wWo7gbBAvg7Swnz+y56/cb6fA4HaVFIG3njsNgsABFVie6Xs6dJBN9SJ/STuQOds3uNPdGwlroghEPWQNdf4k1z+N6FhiJpSZz33c9GgEbrZukd+k0MxFM3Vq9GYDfKZDgxqInQZ0WXsT/BlkfuY8HYwRdu3gvwjwvfjBo/J6YPZjmMddxZy5rCFGTaeQAitc0rIsGR/kie9DOPrbll4NGDv8RZ8Z2a3gWhBTE9kLEg7lHtXzsOlf+XFtSKed9ls7qp4xxZOGZ6heQm7nJavfQ7P9RAXGblwVd/S4O4yKd9xXms8Q9EM3vCBKu2Lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(7416014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZZbS96dFZVQWNoSVd1cnVrZURJWkRGRU8zUmREblRJYm9UMjczTWRQZUI0?=
 =?utf-8?B?dGU2NGdXUWZ4NzJOQzdzckd2YStWeHFuaHhBVUVqR2t6aDBOT25INHRRQkhJ?=
 =?utf-8?B?cmhlY2hzaXdhY3RiRURnekVOYWJXRDJWbFpvdUdVV0p2eE5aY2c0Sy9PUGNE?=
 =?utf-8?B?MGdUejdscXFmQ0grbzNPc0s2dUZLblFYblFFRU9EOEtSQjVPRnlYeFAwYk5t?=
 =?utf-8?B?NkUraEdEOTNweFFPTGVheDdEM25pR1B2K0p0Y1d2RThSaFkxL1BYOWRIM0Y3?=
 =?utf-8?B?bmhQZGF5SGJrUDdRbXB5d3ZKMU0vdTZ1QkRxNjZxL2pXMStTdXpkRTJrSTJJ?=
 =?utf-8?B?aFUzTnBmaDZHNzF6cnlpS003TWUzVENJYlNMVjlqemM5UVcyeEVFMkd3YjMy?=
 =?utf-8?B?RzJtcGRTWjJsZkxCdUdKaUUyOGE0ZmlCbTdUZDZoTDc0T25mbjhmWkFoYS9Z?=
 =?utf-8?B?TEFNWGR4cjU5WW43VmgyaXNmRGJDMllOR0E2RE90YTJLamJvdUJaaHNMK2ZN?=
 =?utf-8?B?NXVwbWVEYjB2S0hvR2VBYk5VRnRXd0FmTm9GM1J6M0hEbXVyZnZmTDQyQUpi?=
 =?utf-8?B?OXM0emtsR0U0Mk1OdVZSSlhORVZLNzViY0FwZVNJRkV4M2ZlSm11Z2pDT1BY?=
 =?utf-8?B?ZWZDcHJWTm9yMlZEQ0FKSzErVEJoSEJCMVVKaXpDZ2RsUkVxUWViMkxrd2tk?=
 =?utf-8?B?UDJRQmFlMFZnZGcyN0NPaCs3RUhOcHNvU2YzVXVRTkMrdWcwZjNFcFVNZ1pY?=
 =?utf-8?B?WVUxYzllZyt2aUFKblorK2F4TXUwRDQrTk4wZTdMc1NadURxY3I5bm04N1kr?=
 =?utf-8?B?VElUTGVTTGtCVXVkVXBtWUlZVEpuSGhhWFhROE1saG9Yc2FVUEUySXZqdGlR?=
 =?utf-8?B?aHBEV3ZNL1E3SXJ6OVVvN1hhUVVoemFzNFFONnBJMW9KNjk4SmR3cndTUjl3?=
 =?utf-8?B?VExKaVJKdnh5WGZCTFBYZ1R3dEc1SVFVeWlhOGUxOFJpUjNUQkpSVjZ3Y1hY?=
 =?utf-8?B?RE9hcm1senJwQ05nVjVjYUFhUHozdSsxN1NURitrRnZYWVhDVWNVSEI0a25v?=
 =?utf-8?B?blJwazJtMzJJc3hkWjdSa2FXUkZDRGc1d1VudVdyUzhrSTZ3YUtyeFVoL1lC?=
 =?utf-8?B?STNXRnBLWEhnK09XL3dKRlNzcG4xbVJFaWRmSDgzbzkySGszUWZqRzl1VTVM?=
 =?utf-8?B?S0pGT2g0SWtJd1NXTTF0UGRzdVkwNGpWTGZWNzlhenhFcjN3SmhFSURzeTNF?=
 =?utf-8?B?Sk1UdmJ6Q1lxNkZYaEt4L0NDK0VwL1NkSHZ5S2x5akhFSyt0cUdJeUR6N1ls?=
 =?utf-8?B?QVcvNFpRd1hhenRzaVNhcjlIY3ZrQzEvUVNqcjFxNCtHOU1lNUJWMk05anBG?=
 =?utf-8?B?TFZNdlZqaXBqZDlGZUxhRGtKRzBWNllkaFBaMkxkM3BNanB2NmhqSVRzYUZH?=
 =?utf-8?B?ZDNleXJyMUZPbmRKeHRaSGpkSGNyUVUxWU82WmVZZkxoU0xvZ1VoOHZLUG1t?=
 =?utf-8?B?RzMwMXBVY3JCM3RTQmhlN2h6K0NVb3pablpSV3cvSUkvZnJaNHg4Ui83TUhE?=
 =?utf-8?B?NUV6Z0dsbzBmZVh1UU9mNXZWVE5lVzd4SDJTM1M1TE0xK0xtQmI4eC93VE5v?=
 =?utf-8?B?dmMyZ0FTMnJISW1FSVUvU1F1eXlxT0k4MmU5RUtINzB3RUFVY2Rtby9CbjE0?=
 =?utf-8?B?aGdwdW94YUU1TVdvQnY0ajh4Z2QyVS8xMlJRQWVoNFh6aGx5QXAyQ2hrREsr?=
 =?utf-8?B?N3VHWmEvT25YODhtTk84Z2NpeFVRS2RzT1RobHVPVmdoZkt0em5JTkdQclQr?=
 =?utf-8?B?bGhtT1Q5U0h3R3d0ZWtZc2gvbmtUcGRhdzZzblBGMEdSZytXdTRIenU1cnpR?=
 =?utf-8?B?WjNWdDR6SG1nVFA3QjVQcDVBYzFpTjdtVmVtSC9BOFJkVTR3YnRvMm4vVGo0?=
 =?utf-8?B?Q3ZyQkdEMjV5RFl6cnBzd0hqdnNnOStDd3V5bSt0aGhsQUN3MThuY1laR1oz?=
 =?utf-8?B?Q2hkU0JuS1dzVkVqRkpvbTNMZkZja2dSSjZiYkRndVJNY2dRQ3hUMDUyU3Zs?=
 =?utf-8?B?dklVSTFEbHhGZngwZUc2THRYVlNWcVhpbG1TNkt0cnE5dXhkcFRDVXVLRjYr?=
 =?utf-8?B?b0NsNUZTUEJRWnZhRnBqVVdNOHhsRW9DTHR4Mkx1UHBpNnlPSlNXak9MNFE2?=
 =?utf-8?B?elZ5L05LazNLNnB4Y3IxUkovcXRaV3kyMXFuSWU1SWJxRUdPOUZzQjM2QUxT?=
 =?utf-8?B?eEdLYTl4Ti9QSmJLTTRKa3c5eWxpWWdxc0tJdGd5cjZoRnc2cTk4OG9SUUNv?=
 =?utf-8?B?WkhncW4yTzczeDk2YVpjb2hyL0w5TlduQVdvTERORFIrNDFGeENwUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb98540-c2d9-4bfe-faa1-08df050f4230
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:18:40.4279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cROGMtw1cwQmrg7Ohw7bz520ZIAZ8r7f1VYN1avha4t+JHy+zweRBxOEl3OP/GSZOFaH5BjmywATsvY51adCBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8761

On Fri Aug 28, 2026 at 1:03 PM BST, Gary Guo wrote:
> Currently, constructing a `NonZero` or `Bounded` from a constant is
> verbose. The former would require `const { NonZero::new(...).unwrap() }`
> and the latter require turbofish. Similarly, the `num::casts` exposes
> methods that cast numbers using turbofish syntax, which is unergonomic an=
d
> unnecessarily causes the value to flow into the type system, which is ver=
y
> restrictive without `generic_const_exprs`.
>
> Implement a macro `cv!` (short for constant value) which converts a const
> integer to types that implements `FromConst` trait and validate them duri=
ng
> const evaluation.
>
> The usage is of form
>
>     cv!(<expression>)
>
> for inferred type and
>
>     cv!(<expression> =3D> <type>)
>
> for explicit type specification.
>
> As we do not have const trait implementation yet, dark magic is used. The
> dark magic is documented in the code, but in essence it defines inherent
> `__from_const` impls on types, which can be marked const, and rely on
> Rust's method resolution algorithm to pick the correct function. Multiple
> helpers are defined to aid type inference to work properly.

Here's a generalized version that work for any trait methods (same limitati=
on,
that you cannot use this trick if you have only `T: Trait` instead of a spe=
cific
`T`):

// Inference helper.
const fn would_call<T, U, F: FnOnce(T) -> U>(_: T, _: F) -> U {
    todo!()
}

// We can have a single helper type for *all* fake const traits, as long as
// method names don't duplicate.
struct Const<T>(T);

impl<T> core::ops::Deref for Const<T> {
    type Target =3D T;
   =20
    #[inline]
    fn deref(&self) -> &T {
        &self.0
    }
}

// Const call!
macro_rules! cc {
    (($e:expr).$ident:ident($($args:tt)*)) =3D> {
        if false {
            // The normal "runtime" call path for type inference.
            would_call($e, |x| x.$ident($($args)*));
        } else {
            // Dispatch via inherent methods. Type already known with the a=
bove
            // helper!
            // A drawback here is that `$e` -> `&$e` autoref won't work her=
e, as
            // `Deref` impl is not const.
            Const($e).$ident($($args)*)
        }
    }
}

// Imagine this being an attribute macro.
macro_rules! const_trait {
    (impl const $tr:ident for $ty:ty {
        fn $method:ident(self: $self_ty:ty) $body:block
    }) =3D> {
        impl $tr for $ty {
            fn $method(self: $self_ty) {
                Const(self).$method()
            }
        }
       =20
        impl $ty {
            pub const fn $method(self: Const<$self_ty>) $body
        }
    }
}

struct MyStruct;

trait MyTrait {
    fn foo(self: Self);
}

const_trait!{
    impl const MyTrait for MyStruct {
        fn foo(self: Self) {}
    }
}

fn test() {
    const {
        let x =3D MyStruct;
        // MAGIC!
        cc!((x).foo());
    }
}

Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020108.outbound.protection.outlook.com [52.101.196.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA41799F;
	Sun, 10 May 2026 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778450732; cv=fail; b=qBJxLFAoeSEzrldV1fDI9gK3rE++C94kgWxt7BfDfghHNZwS4CFnBhHEGKk972Zj/6dZ0MUvTvDCMXoKBPpiraVP2WAvjaD8/Nd112eBqYzgNr0rSPZsHFrP2EzS6WYdSkZvzQBsRntmUCrKPCtFA5YEl3IvPE+nYBkxeJDYfZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778450732; c=relaxed/simple;
	bh=Fm8Vy81QaV1ZEKew22LOeYZMeAcfAWONoPCsFPgDbHg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bCy5/7fu+R+s7fV2xxs7hyfBZnVDvZuR3D6Ugi7GAnk+aAR+DMq/ZwZjoSz/lhxQ7AtZ8wm2OYBRJCXnMOgF9y/b5cK1/h6PCZK+q/NaoQp6HlgVlcIuBHvB17Is1CIkKJ27s6pDD5M5UXx+kWvTKIUbzTXdAIrp3z07WZT8Mms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TfcnR2or; arc=fail smtp.client-ip=52.101.196.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TfcnR2or"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNUrQSWSNcr33apvgqTg2FrgvMN+tO0aCYdfDDglCL01o9Ug+MuPt2G/+i7Y8txwg6eTuiGF25QpRru/Flwitx/cTGawOudEBN8LN3yAw/8yaJG9mkZuZ4z/cjy9pZKluI0tPLuf8JuKh5JykqOTWONc7rTM+2IbwNhlekYIjWJAmS1UsYheaR02kHYjzoEO2eL9CsratHXpWKK3/RuDPPm8YM2391HqUybPbUAkUVlyC2odU26dXytKpeqE8yVXK1ye+5ZGnWIxsFhHcY1tJKCAhGya2n69g+cGtQiogcjXaUYq5ub/alC6D7RJHG+cIvoL7bQXS8ITK1y+GMKeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AQrFNz3QeJwmMIq/7BcV2c7XvgRLNNs9+8j0L9/lYE=;
 b=Pl8jB6AfRZDOvToCVlQ9fPxcf5oiC+SG+TupFR618zP23UFMUxbVUCuP+UDmF1tLWzRflWTFngVVGPMOWhl9WbadJ4Pc3ClIugEwJD5x4N+Nli/rlDnY8tS5xTppJL0uejtFDW8CkKmt3Zdxo5WvDS2Z1TxTKiEIEFO2XQlLbTbAh6dEcM6Mjqdn7sZrnTt38+PjUyfT4xJq+HnDmBt0i50tU4d0Z5kc8d02zWpxjXKjcoyWCMr57jUiPKtDZkybmwsg02Nmb33depA1Xb9Z11l/mUeOEv85A/7Qg5ipbIlHoEY2Or35USzvy8Qb9u+1OZKptLumXqojsMfd35PsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AQrFNz3QeJwmMIq/7BcV2c7XvgRLNNs9+8j0L9/lYE=;
 b=TfcnR2or5QNlSJAJKLRDvUEdlKTeCVlK+0jpA2SoOZoQ0jQR4dYrl71ZxwpHVX2+esSk9TLQlplbS4JSr/JlJnSlWXAYhwKG0ZM1s4l7eOQ407vt1ZtffTw0l+gPnRokYdYTKkHgvAakGLmLN0MRPHc3bvWx+UGNFNibRjyuZdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 22:05:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.021; Sun, 10 May 2026
 22:05:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 May 2026 23:05:26 +0100
Message-Id: <DIFC60XM999U.2MTSTDRGJBAZH@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Alistair Francis" <alistair.francis@wdc.com>, "Mohamad Alsadhan"
 <mo@sdhn.cc>
Subject: Re: [PATCH 00/10] rust: pin-init upstream sync for v7.2 (round 1)
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
X-ClientProxiedBy: LO6P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: f1128f37-ad78-4380-9dca-08deaee03e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+0N66Bh1LSzlk4W+JvjytG+WRhBfC702RBi3BJ9sJvKysjwuv0RqiFB7JQcBjmirSUOyOdMZnVIHc3OviZTFQbH+eQp0nNO7Ako6tv+S4KmFYnvIVwVv1QznFUU+o377j2aTcNrLtIoc4JBP3I2P9uuwkitNSiJbWvaSthBOkYsfNcZT3uvY3w2q83H81vqt8Fa26a5UdxmWK71/tgUbiNFqszMQ3elLy3x9jubkDngBUCvj5q5YX/HjcZI1fi454aJFlntWwJF/GN5CkCrMqsgL0ZOKkyGBn/2D0koBDo0Mw1HrWiD9Ls5ZWVz05or06XNr3W/tUchLGRHg9nBnE5fBt8CLkkezjKreEZ3FwYtBeMwnsClaPyl6xVTb280+NHcozPEOpC5vcuhGiC9h3CWFyeeh+WaxSuIkT0VfoE6i9iJanONyncFRCLKO4P+OEX1B2Vh5St121oiFu4N0HEFZv3XfqlWkOgKnVMr2qoWWNmmg8zyFyFrD9Cnl91e08fGhtW7CA11V56evkKnOT0qZmK/nv0XYkmGE2duCXrRTlq/p3nNe+UCz+LtuRmLSzPHX6AirwuU3zkS/MVzfLgzhlqdKZlU5oaqFwrKRxbWAdox0MiO09dBpwMNix91I9yCTG06FaMqo561AKzdjuZ4uINphis0Tug7XAkLbZKG8Ul3dYfcEdf5q+iMDzcDX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkxoR2N6ZzR0Tk9BTTBGSUZTNFIvbTBoSUJDV1B1anp1Nnk4R1N6ZmhCRGp6?=
 =?utf-8?B?MXYzb3pUYjUzMGVkWlN4Mm90QVhyd2w5TVhEK1paWWY1SkpPaEJ3TldQYjQr?=
 =?utf-8?B?TTdaS1JGREpjbkJGOStyYWNVQk5qOUxyeStVSTNtSVFOamRkd3FkdmhrckUv?=
 =?utf-8?B?c2ZadU5Lb3F5RjVlekx1NWp3aEFJZTVHVGg5eStKNnBxZTNqekhpc09ZWmtk?=
 =?utf-8?B?c29RSHRiNlp4dHkvb1VqUzBjUDZseGpnOFRhakRpWTlmMVl5SHFBWUNkN0k2?=
 =?utf-8?B?dzRZYzBaaVVKOGMwRFJtMGFzazNqRlM1aG4xRTFNVFRicUVnME5oeUVDSjZG?=
 =?utf-8?B?WjF2YVJkYlI1TlZ2b2s4L1NOMmhtalFGUzlFYWlmTFRwS29ndXorQ2hGNGpM?=
 =?utf-8?B?TnZCWWZNcXhvSUVsTklaZUhKeTh0SnBNa21wUVFCUHE3Zmk1UCt0Wm1haWVk?=
 =?utf-8?B?dmR1QmZLVHpFbHRnWXBVZ20yRnNzbFQ3Rlc0azNjSjlXS2k1QjJqaFU0bXpT?=
 =?utf-8?B?NVJPMlNvQS9vMEZIOGF4bzRqQXEwYWF4c1ptaDF6VkNDVTlNZFBNZ0ppWTJI?=
 =?utf-8?B?MlZYaHV2SHAvb0FIRlpqSmViQzZlZTNUY2I1M1RBNWoyUWNzYVRaMzBVaW53?=
 =?utf-8?B?eHhodkRjTDdIMkkzQ011aGhpRzBLblhDYm41U1AwMGhIN1VFbnMvcUtGSTFs?=
 =?utf-8?B?WUl0d01FRCtTTGs3L0p3QU8vZEhsb2M4K3gxMGdGSTJPc2JrcG9ZeTNnNzI1?=
 =?utf-8?B?TmVKOUIzZFl6c0dPYnR2cnFlb0dSa085dkxRWlBsdFA5QmRzZjVYNXhpNjFV?=
 =?utf-8?B?ci9ObHl2RXV0OXhrVUkzeE5lUXlXaUV3R3Nla0lONUQ5NHMzQ0xnWkszTHBL?=
 =?utf-8?B?c2ZvOE1xV095L2tobEVOdGlROHFNbHpSTEl3Uk5BMGozekgvRDlKeDJyRzYr?=
 =?utf-8?B?dEh3S01uZ01rdXhGaW5KUzVIcGlkcTlGajBTZnEvUklhUFZCdGtrMXE0WGFK?=
 =?utf-8?B?NEtKeEcxZEVnanlaK3REVDhNVXN5UDU5bGVkMUdjdWtIcmtvaHdQajBCeEpr?=
 =?utf-8?B?U1BRQW5oOU1SZFQxSVZNdnBaeG1IRVpsZmZld25CTkY2RmxncGlSRlNmdjVu?=
 =?utf-8?B?bW9wM1YzTENTYUQ3OThvbzZvSGlqRDNHVDhOVWlIU2dmT3JyWFlkVXhFVmdt?=
 =?utf-8?B?cDEwemJ4MnRtRE9Ya0JUZnpPUExsaDZyNzR4U3U5U0luTGNXTURJOEhieEZV?=
 =?utf-8?B?MzRubVl4RlEwRnV6LzhjMXhIWlVvRXVGc2laQk14TkxFY1prMWo5dDh6MSt5?=
 =?utf-8?B?WnJ5NGtQLytYTkZadWQ4dUhPdERSZWk0akVOdjY3bmsxaFV0elp6ZzhXemVm?=
 =?utf-8?B?TVc4emZqR25FRmg1RnF6MkkzbjFqeS9UcDRPRnVXK0FSK0psYzJZdHJ4NHE4?=
 =?utf-8?B?RzZHdzVUSWIvc241MUZlZEhnelQvM091bk53T1l3dWt5d1NCcWpZdmhoZ28r?=
 =?utf-8?B?OHJnVndDbEhwSjlORHdmc3NBSG9QbWh5Y0xSeXNscTByaGoyQ2JKSTBZYVIx?=
 =?utf-8?B?K29mSGFJdGFXQjlsZXFvWlhiR3RLMlhoTGdRQWlOMG5seXlqT3pMbVBBdzVt?=
 =?utf-8?B?eEdQaEhEUTRRaXlhT1VnSVo4WTV0RkhTS3dVeHkyM1pvWkVDZ1c0R2Y4WXdu?=
 =?utf-8?B?anMvWVdDd2EwLzRzSXBSRjZYd3hETElKRWkzSURvR3BEdTFkcmh3akthTTlW?=
 =?utf-8?B?MXVDWndKcEd3cWRYYUtGMDFRUks1MERVcFpHM3RiQlZqMzd3Q2hCOXNvZkl2?=
 =?utf-8?B?YVo1MUhjUVpLWEQzVzE2dVlRNHZ1cDFkQUZQV1YzcGJUekNiNFlUWG94Vk9s?=
 =?utf-8?B?cmlWa1l3Y3daZExWdlJ4c0pqWFZ5bE12dUU1VXIwQjNyOFYvaFQzejJUZ2JO?=
 =?utf-8?B?TUxIUml6bmdJTWlzWUMwaitBVDh0SStRaGQ5OFVnMnovelA3NHc0UGJvK1Np?=
 =?utf-8?B?TWhJQ0tETXJtRlhDNVNhVU9Tclp1L2RyVktnVWNoSkZ6VHFJT0lpd1FuS1p3?=
 =?utf-8?B?VTBkOXBjcU52eEg1OVBkMGZnbzd2RXU1Snp5ZDczUnpoS2liQmZMUDRLTHUv?=
 =?utf-8?B?K2U4dFdmRU5oakhsRk0rVlZ5VHMvSDViMXp6VlJpUkg2YU1nRkRDeTN3dit1?=
 =?utf-8?B?aHFPTGU2SGR1RGUzNENIQlBJRlNpQzFNQzd1QWd0NC8xMlYxeGZNN013Rm12?=
 =?utf-8?B?bUQ3ZkFmTXRmd3JEU1l4NmJTekQvRnYwQlZ2bTV3Rzd4Mk5JZDZIN3NTQTZk?=
 =?utf-8?B?NElHRkxuQkd3d3NoVzFaaEJpZ3NjMkRHOTRMNnZJa0Z0QUpNbnZPZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f1128f37-ad78-4380-9dca-08deaee03e1d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 22:05:27.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmeN8XWEx1+/njZpM7uhqbTpy7qxuMfC6gE387d/Ywddui5i8tTdNprvaFa0XrLoVv6dfuxMXO3Uvk3g+Tw3nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7410

On Tue Apr 28, 2026 at 2:10 PM BST, Gary Guo wrote:
> Alistair Francis (1):
>       rust: pin-init: examples: mark as `#[inline]` all `From::from()`s f=
or `Error`
>
> Benno Lossin (1):
>       rust: pin-init: internal: adjust license identifier of `zeroable.rs=
`
>
> Gary Guo (5):
>       rust: pin-init: bump minimum Rust version to 1.82
>       rust: pin-init: internal: remove redundant `#[pin]` filtering
>       rust: pin-init: fix badge URL in README
>       rust: pin-init: cleanup workaround for old Rust compiler
>       rust: pin-init: internal: turn `PhantomPinned` error into warnings
>
> Mohamad Alsadhan (3):
>       rust: pin-init: cleanup `Zeroable` and `ZeroableOptions`
>       rust: pin-init: extend `impl_zeroable_option` macro to handle gener=
ics
>       rust: pin-init: internal: add missing where clause to projection ty=
pes

Applied to pin-init-next.

Best,
Gary

>
>  rust/pin-init/README.md                       |  2 +-
>  rust/pin-init/examples/big_struct_in_place.rs |  3 -
>  rust/pin-init/examples/error.rs               |  2 +
>  rust/pin-init/examples/linked_list.rs         |  2 -
>  rust/pin-init/examples/mutex.rs               |  2 -
>  rust/pin-init/examples/pthread_mutex.rs       |  2 -
>  rust/pin-init/examples/static_init.rs         |  2 -
>  rust/pin-init/internal/src/diagnostics.rs     | 14 +++++
>  rust/pin-init/internal/src/init.rs            |  9 +--
>  rust/pin-init/internal/src/lib.rs             |  1 -
>  rust/pin-init/internal/src/pin_data.rs        | 10 ++--
>  rust/pin-init/internal/src/zeroable.rs        |  2 +-
>  rust/pin-init/src/lib.rs                      | 79 ++++++++++-----------=
------
>  13 files changed, 52 insertions(+), 78 deletions(-)

Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349353C0A00;
	Tue, 18 Aug 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050152; cv=fail; b=qtNY/cnofwftstZ59LvggooJ84ZfJcqSOnYrnMot9MudE3CdHeGBXZMwzAFbmfmUsQN9QwTpWzcnC/gfynU87+M1vBMeeoLx8QqaqosZhqvnC6orVDDUDf+b97/OHFIOf3n0I/PvfwvcH+3/zbo47rlD/8QY2IuK62Ze6/XTTqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050152; c=relaxed/simple;
	bh=W/Cdzv7ELtu81FLJ6FToFJb09KKBZg75iahAmHkqtto=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Vou0EhI72qnWXS/9T9lQvRIurwUuDegJn9yYbKTZHPnl2mbEo7xga2PzuuHFEGsewjSBA55Lyx2gQPAsYHStFPw4PKAcTreZe0ImXH6ntArUUVBBnXBX4ySU/8+AFvpAo0LWqSorA+Eow6LdUAJzaXohHAz/m0sA5XH5QQ+4rYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=b/ES+hSl; arc=fail smtp.client-ip=52.101.196.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="b/ES+hSl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9UoYa2VpYiMBOArwmOBtIoCAnk9UotMUy1+Jy7W41OBtlQgXaSPuBzwVWYYCBCd6lpQ0BGVa7AzeDd+4muvcJI546JsA+HNPww6LaHGMHPvIhM46xqpBe1k9jiUEZEHjErE3GWrCuHGXbxOOltz+zI766YKmh1818vUJhD056yZd2oaaT/7qp8JSTWsWK3D3BUXFIQzpz4Ega4/bJqDHSGs37I2k3TnL+D2oG/oZ/ePN/sTNTt6yJsCy/lLLOC08JcKXnRqjrlKp2nDFKMzfk9L/AXMKPIKxO52PFuFaqjqh90XCNXqnoRSt3ybDgtDkJi9FSOUt5f93k0ovUs9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwje1VtbLwe0lhu1lEtIzof4GX7qx4sJPhcA03iJ+aA=;
 b=Hm2VNebeSw9/iVQu5zt6HY7z8lBeDYYy7nHDpN6END9r3rzCLI2H/1bBiQqMckMuORCSE4ctq2rfFqR3i18ktMk2RYsQiccxAjnY8ZjguSunfBWeEtHAjRHV/2PlQN6xgSc+AYAH1j4DevqHFL4HlnV+piV10yTiNSeIo+DunovL9OdVSEtdizpvfAC8LuOpArEz0tdJ80d+JPJn2IVi3OS/Hyw+XRIeKVEsffUarUxBjRXEPG2Gn+v2jihKLl+a++ynwBMD51Vh/wdqb2eXmChfRjzsgIeMzXU+412TGLuZubmcD3may7q7Aaps/o7Dg9TzfXr4QWt0nNqokx8TtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwje1VtbLwe0lhu1lEtIzof4GX7qx4sJPhcA03iJ+aA=;
 b=b/ES+hSlO+TLbbPD6QcOc5NU5lGnMfJCE7O6spYgEfXOtXf5RSQqEBiACOWGjG7XfzFYYgyoAWKTqVL6S/zgoNdMlgqlIR43q3Jv8h4+H4GhmuzDL4vNWfhZjopUsR/dnM3hItAp+Dbq56Y7yIYF4YMBExyDx4q4RQC1d4Tf24g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB2220.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:107::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:49:06 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:49:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 11:49:04 +0100
Message-Id: <DKS0EN4DLKW3.IB8Z5VB3B7YG@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: configfs: skip unregister after failed
 registration
From: "Gary Guo" <gary@garyguo.net>
To: <git@younes.io>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Breno
 Leitao" <leitao@debian.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
In-Reply-To: <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
X-ClientProxiedBy: LO4P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB2220:EE_
X-MS-Office365-Filtering-Correlation-Id: 877a2e19-56b5-4b56-0846-08defd1652ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|366016|7416014|376014|921020|6133799003|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	haDV12DL4LmaG2cZiBAVvMfZo7QZLcRjCMPYIVnOhnC4w4E8QxAmss86kVXFnU+lC0cY/Pjwl73I1LD4vOG+zZeRdD7jAot7wSUs6EavYssfG9AXhNpwaivOxFsll6FgJWdq/JuSMwp8ud3cP1+8RMymOwxUH0x8xeTMagpr+HrIcp1OJkQOofiANs6Yb1yLSy9tj4MCv9q7qNIMv61r38hY4dx+JicrNd90VffwfH7Jld4WYs5Vp6tJRyx0Rs1lS5SkfoLTD0/grMY1jx0IVhEEYomLEQSIJ70fCNwtJw8gaaIi1xFJgA4DoYuZ0MZwAQ0xp5QR0RRt37fcSYJvK45bC/iFFIThMgIbgZokXzDHkjW8M4rKOsms1NjQFq3qXvAnaZuCqF8IYzVIbIE/x8JozWNO7L5WOHh1ue46XJploaG+GfYQwIzfC09cb7BY2VYcgwumhDVRqaRDajgIgg7/e6vEez1LRCCJ3y6RDyvHRQqwT6Y0Ycm8a86g6juSX5DkfWw6XJJNqYnEC38R9YRVfg8PHzwVHo0/p5S/Q6PBN80gayR6cAout1c8XlTwGznkmhhlDu+tMdAW4OehiFQ1rLpdRmIR7PQhcI913qj80rG8RRmJL6ec2daH6Klc2RINRDf0J2pOc6BcGpw6/6SmkvO8e7hYTaambiixiXTB3nFDAjEbBdxVVI1Kggo3PqwTTs3jcClFAYUYJca0Gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(366016)(7416014)(376014)(921020)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzU4YmU3RXo5V2hPSGlWeURjQ2t4cGtLTlA1SGZJUGcvV3dUM1dxU2psdnFS?=
 =?utf-8?B?aElON0I1eGs1aEQvYTEvd1BTMk5ZY0dDRGxQd05OcVk5THA0R0xVaXZObnd4?=
 =?utf-8?B?NlhwNE1BZDBRdHR4Yy9CSElZYmlkRThmVnk4STNSSTZWZ0N2YlNCSysyQ1BX?=
 =?utf-8?B?RnNGNXJLY0VtVDVVZVdJRFhHU01NdzRDQ1QzclhndENHaXJWOGJGbGYxeTFv?=
 =?utf-8?B?N2g4cjhkUUZFcVdmdmV5RUNIdE5wVFdTeFA4UTlUQXZUOWgxUzJ0bTR2Qjk2?=
 =?utf-8?B?U1RaV3AyRUlxYWg3SkxCZkhHM3hBSWNKUWNPenRmRHQwZHdoWnlLR0swRGZv?=
 =?utf-8?B?WUpsWFVocDlFLzkwb3loSm92TGZTRnVsanJQV3BZOFV6ZzFKdzlxVlFHNHpz?=
 =?utf-8?B?T1VYbzFXL1E5Ny81RzRhRHlucU1vMEFKTk13RlVnekJOaWZNcFlJMFdKZ240?=
 =?utf-8?B?czAxcDFqWkFKMnliWDQxVkxSNklIUnNoYTFqNVQ2emhXRlJORUpvZHVkeWZ4?=
 =?utf-8?B?MVpKVDhVajRhMUVEWXBLUHhMSG1ZblYxdHd0bUVQRjBKSEZtU281OTRHWEZQ?=
 =?utf-8?B?Z1JSTzllbHFGQjdSRHBCd0VGcVhYdnB5SCtKRVdXdUNMRk1US044bitTWHdC?=
 =?utf-8?B?QUVJQmxZNEg1MnUzTC91YTdxRHN3MzdXYnlDZkx3dGF5WHRXelBLWjhUN3h4?=
 =?utf-8?B?VmxZb2YxanE4QzBCSTR4WUFOSis4TlhEWW1XaXAzQXZqRVlXcTMvSDhwUys5?=
 =?utf-8?B?dTJXV2h3UU1Tc3ptVUk1TWJlcEYwNEFFNjNlKzBXMjFNZDVtNkk3UDRlSmYz?=
 =?utf-8?B?MDJaL2lBb1pLQUxMd2hEUkduZTlReE1PaTdCaFlJU1lWS2RhWDNGVmJ1U2c1?=
 =?utf-8?B?QU1xMkpOUERQTlNFQ0tKSkhLdUNmUURSZmVtRGYxUkZ4ME5xRlZGWnFOcWJh?=
 =?utf-8?B?cGFzT3A4ZEJndkdtYTRaNXpud2lpSEk5Nkd1Q1dWN3I0a2FpeXdyNHF4SHk3?=
 =?utf-8?B?VThHWnZoOE4rT0lVaml5TUtXaU5oNmVHR0ZqMVFFZE1oWDhyNEZIVng3NDdV?=
 =?utf-8?B?cEd0Smpab2xvdjF3SktOcnd6ZEJDQU5hK3QvNlliUFBlREljUlR1R0IwbjlT?=
 =?utf-8?B?N3Bhc2dZQWtFaTUxSFlUcVpWY1VuT3ZvQW5BVTRmSDdsS3VzWERpY0tONWVh?=
 =?utf-8?B?akFzZ2V5TnFvUVZVVGtFcVFaQXhHU2IwVXFsSXBybHlPRzhwVStiR0VWVCtt?=
 =?utf-8?B?UWpCRThKT2hzZ2lITS9sYjc2QmFMTEtVQ2h5UEVMU3dmb2xjdFZlanJJd0h2?=
 =?utf-8?B?ejBmdXluUjc1cU04cUc5c0dsYTFBY29MSHhON2lPNkFSZGYrZGhLMHpYYlhQ?=
 =?utf-8?B?ZUc5SERVNHd3UUQxaUpVaW9wWVZHTElqVnI3NnN3THpkRnRxTUtBSFJ6d0Y5?=
 =?utf-8?B?QkI5ZFdURm9qbFRpWlJpRHNYQlVGUnZSNGRmSXA4S0Z0bzlTaFRMcFFqbUdl?=
 =?utf-8?B?QlBrWU5DSStJdUFEZDRXOTNqRHZiRUtCRVdueDJIdkhjWnltNUtWVm9mUlZm?=
 =?utf-8?B?K3hzOXJ6elNLNFVlWTRpd09OMGpFWkc4bkpKNzgranpPb3Y3SGJtRnd5bGlW?=
 =?utf-8?B?S2FjWGxqUGovZ3pXOUJpSVBRRFdjcmorYjBtd0M2aVhzdkwxRTA1ZHpIUitS?=
 =?utf-8?B?SVNzQlZtSmZ2VERkdWhqcUpXRk9VRVE1WkxEYnBwZFZZS1dtOG9yYmhaNzQy?=
 =?utf-8?B?SnJ1cFdqRzlHNkhJVW8vdzFWclpnQjBLTlpmaWhtdXFzSnl4OHN1b0dGWmh0?=
 =?utf-8?B?RU56SmI3bk1ZVmluQXN4NmNUWDRkTG0rVFhpQ0tCYW5rU3d3REVLK2M4dXBT?=
 =?utf-8?B?cllMNHlXTlQ3V0phV3YrVFJld2twYlVWOWN3L2U2aTNRTlhXS1JhdkxZUHhC?=
 =?utf-8?B?cEhaVzhJNkQ3cHNsUTFwcDB0WHBUbXBxTXVrVWVOY2R1T1JOQSs3Um53d1FZ?=
 =?utf-8?B?UEo4eGxzaFE3VFBRV05WekF3NHlDekdFRTkxSkpSV0xyeWlDOWJrNFlhN0Vx?=
 =?utf-8?B?ekxibHNkVzhia0FUdllMUTVDU1NyK0xFMzdCbkplakdwNXlsaDNncVlNZThG?=
 =?utf-8?B?Q3JhVnMxWElkb3RKeGRpZ3RmZjdVeExnZm13YkZ3SU1jZVl5Z00vYS92L2JW?=
 =?utf-8?B?UTdNc1BFK0xNc3NmV1ZWM3ZlaUwra05wQnQ2clVvUTE4RmZiL1JLWjVpK05C?=
 =?utf-8?B?OTBpUVNBdFRTRlRzL1hBWVM3QXQvY0lUeURMK0FGNzUrTXM2RkNOelh1Qjg0?=
 =?utf-8?B?OVBaVUhoMUg2eE8rbit5bEVhNHVmd0JJY2h3aG1XNHUvZUVXWXBNdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 877a2e19-56b5-4b56-0846-08defd1652ed
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:49:05.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKWY2KVTS93EQpE0bdPma0lybPrqAW2o1l/ssSwWyZkPmndbZvsM7/r4EFzSymsZeAJIIokmXWf/0tsVP5ZiEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2220

On Tue Aug 18, 2026 at 9:11 AM BST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> Subsystem::new() calls configfs_register_subsystem() from a fallible
> pin_chain callback. If registration fails, ChainPinInit drops the
> already initialized Subsystem. Its PinnedDrop currently calls
> configfs_unregister_subsystem() unconditionally.
>
> configfs_unregister_subsystem() requires registration to have completed
> and immediately dereferences the subsystem dentry. Registering a
> duplicate subsystem name returns -EEXIST before installing that dentry,
> so the cleanup path dereferences NULL and panics the kernel.
>
> Track successful registration explicitly and only unregister in that
> state. Keep mutex destruction unconditional because it is initialized
> before registration.
>
> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs=
")
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
>  rust/kernel/configfs.rs | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index cd082b83e9e7..f358e227ce09 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -130,6 +130,7 @@ pub struct Subsystem<Data> {
>      subsystem: Opaque<bindings::configfs_subsystem>,
>      #[pin]
>      data: Data,
> +    registered: bool,

No flag just for destruction. Please change new logic to avoid needing this=
.

Best,
Gary

>  }
> =20
>  // SAFETY: We do not provide any operations on `Subsystem`.
> @@ -173,12 +174,15 @@ pub fn new(
>                  }
>              ),
>              data <- data,
> +            registered: false,
>          })
> -        .pin_chain(|this| {
> +        .pin_chain(|mut this| {
>              crate::error::to_result(
>                  // SAFETY: We initialized `this.subsystem` according to =
C API contract above.
>                  unsafe { bindings::configfs_register_subsystem(this.subs=
ystem.get()) },
> -            )
> +            )?;
> +            *this.as_mut().project().registered =3D true;
> +            Ok(())
>          })
>      }
>  }
> @@ -186,8 +190,10 @@ pub fn new(
>  #[pinned_drop]
>  impl<Data> PinnedDrop for Subsystem<Data> {
>      fn drop(self: Pin<&mut Self>) {
> -        // SAFETY: We registered `self.subsystem` in the initializer ret=
urned by `Self::new`.
> -        unsafe { bindings::configfs_unregister_subsystem(self.subsystem.=
get()) };
> +        if self.registered {
> +            // SAFETY: `registered` is only set after `self.subsystem` w=
as registered.
> +            unsafe { bindings::configfs_unregister_subsystem(self.subsys=
tem.get()) };
> +        }
>          // SAFETY: We initialized the mutex in `Subsystem::new`.
>          unsafe { bindings::mutex_destroy(&raw mut (*self.subsystem.get()=
).su_mutex) };
>      }
>
> ---
> base-commit: 47f27155f17498fccb1f222f79089642337498a9
> change-id: 20260817-fix-rust-configfs-registration-state-v1-fa33fcc69673
>
> Best regards,
> -- =20
> Younes Akhouayri <git@younes.io>



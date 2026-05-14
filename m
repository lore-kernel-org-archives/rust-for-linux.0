Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CB38F23F;
	Thu, 14 May 2026 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786148; cv=fail; b=bG+Pbqyxs0Q8mw8kBUAyXgWmOmIIxiC7pm1LiiOSJ9uAdy5kahKEMgNlrtCTUxtMSjqz1hnUhJUUOc2jWsvfGHf0H7VlMwYwOFdMyi0l8gLHGKmso9djSLFfP29qviuV82z3GPRXwcJRqBm6E1vquzAhJPpilbXEx293LDI6j2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786148; c=relaxed/simple;
	bh=DmkDFu257sT0LO0YOqbfEP/rpvJDvupTI12VEg4ivFo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jkAAQ4m1b/uMLwzlUNVAs6ke/ihFg4nC3XotKW+1EsHl2npJ739/r/XMS79r9B2EcIDWKG7EciYxYBSAYU84t/mJ+s+mKocooeCVMeT5AIzBCf4eUpeQlfX5+DjyA9pQbxZPqTkcQ5TuI+89HWsvPVD+XU9vqTnpW9O+59l5w50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fIzpwsgQ; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fIzpwsgQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpIC4J7dZ6C3aaDoL/d2znDNj7xzp2Tjjj822+yrAlh1A8jKqyyECJN343CIOPucMsmZRcMXrGnPP42nh6+fF1fBTZ1vNB5HzekKmbBFKQZUCYpN7EECDhznT799qXYbGCIP96bEkOAzzuJ/RSYh+8HHF7Uy2iQD0RMMpy+r972JMRUnbI4uLB6ftsroMinW7TCRs2GePVMrLtU+ejDCYbdTrxqKpWU1xEv4bWYU8JLW67R9DPThI3VRm8CLf8DuDUHqWxvDOr/Lk4cWFnWjAuXSKeP1XiUG5qbSPpp26P6F2aMubkPVefbvM0nwGXWUFztrPPNqPKSSNjSunSiTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6+LY9/32r7tanIo6V0jkiPfTQD6DliIbwrBmPEniZg=;
 b=fNNlp32wKbqB8bjsCpTKHvm6Bey6lTazrO52VQmAiRc3nIKqNpMy24Hi8FqAKfKQlZYKzXPrW4Nb3V7R4e/dPisKcKEcgr4156fl7PCODRDPhx8aWxWBa+LnYTopeR4EK/fn0tF1i4KbesQ7FGiXFf1fg0UhMJk1ex8r5iRw+961+7l50ofF3Y5HDxoCdN4Z9nToSfNim8NKdoOLWBxHyLkhCgoztu/hICBARSKj2gpPRvmq7ejAuSjIcLdum0odPHvAvQBSfmwGCZFkHiJthL/tMiqa/j0htgJ0HuAul0PfZHNlQYXjsLC7ohOhegq8/DuedD8yTtaXTVRXn0GEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6+LY9/32r7tanIo6V0jkiPfTQD6DliIbwrBmPEniZg=;
 b=fIzpwsgQOG1sEJ5jU/TNtN8dBovOFyITu55OivgUhrifElVN7rsiX/rk+DqYkVlP/LxyW6hZm2qprN77WZvM1tTEVr2fSbMfWdE8oh2IiP4Zeh8RgShIsKEKtcCDJlu9OQimhkmRYIx9H8fIh7ITiSOaS746T3kvdc0eHyMlCP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 14 May
 2026 19:15:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 19:15:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 20:15:40 +0100
Message-Id: <DIIN281ZNCAN.3PFFJAKZXLNT8@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/8] rust: pin-init: internal: project using full slot
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
 <20260512-pin-init-sync-v1-8-81963130dfbd@garyguo.net>
In-Reply-To: <20260512-pin-init-sync-v1-8-81963130dfbd@garyguo.net>
X-ClientProxiedBy: LO2P265CA0155.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 00755ecf-95c5-4c77-2fa6-08deb1ed3095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|22082099003|4143699003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gGoJCFlFWH9eP6rOa26rv4FlJZxuEQdFbg1cUrJq+UXFIVcauLm3a9t5lelzpO4XjkjPvp69pEklA+E2QpV3ijlHwYILSGowJwyyNW57iu4Lcvn5MZwGGCg6xoIHL9c/T7wsiSHOUTKOtHuVqCNS1OYXn6U1+0Zh+dn14Ol5e4+cuewbfNuPXMuAOwXezSQhn+TZLi6oMm1sUv/RPzwNf1mKHC7+TYBdGfme/rnZGuuUDksticjpm6ahGxTlF66tiACAXv/8VkRXZ6vIKp740iXLi+LQnWxw/dvX1nhRPXE0C1yHGPx0qxXGcBKK/1fL+cmcT9bD4P2YQakQLEU3w0qy+b7wsrYGn2fhCG0nbGV8AvzvaRFchc3VTYJfYVVBDPVD4MadNGV0ofVQRT6uJTzcl4qVOHEz5boT2CfuKzQLq9YcnUjwTmIaVMgFQ4v/B1p1uZMbXqSOZBzTReDe8lCMoguq9InWMAUoIhxBD8lq9GCj2QVTrtJckyIz3xZ6/Wmwds2sYVMymCgOhpJyAZb9OzCYRNSsYdJ17tl6Ij/30z+Yy/otmlz7BfZhvUctnInCi3MZNUEK4klVk35xdhYkRxlVSPhIeUXFC9An+4iWtw3I6deuNFe93JeivYakW9GkqHc1RLcy8yuiqq3v5lD1QdAe96bhDwyr/sS+UTDNS6EPkZ8tq2HTF3PqB+Vx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(22082099003)(4143699003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2xMaDNTYUFQelNuTkhPQXAxYS81WW5EMlBIcVhWQ3k5NW1jWWFuSTBxLzJs?=
 =?utf-8?B?NDFGejJTWTRZSUdqRXRjQUEvMDg2ajFUQjhrVzFLSHd2WVpqRjE4UnJHdlNi?=
 =?utf-8?B?QXgzaWFJaVdaalZDcklWQ09haDhWSjlwaFhrNzE5cEdRZTh4bnZ4clZVbDR4?=
 =?utf-8?B?RFAvdTBFUmVTOVA3TWViRTA0a0UrZ0JDazlUVDRkUHIyNG1xeUVXS1kwSGlG?=
 =?utf-8?B?N3JCVVZ2eFNzRjQvSXF1eVdFSThVR3ZaOTlybnByWEJjV2pFaGNISS9oWlFn?=
 =?utf-8?B?RzZhWlJmRWdQQTl4Tnp6bFM5VFU5c1NGbW9TYWR4d2hZcWdtbDZpSHU1MmV3?=
 =?utf-8?B?b2tWYTJIMVAzaFdpaitTY0xlck16SGVLTnltemVzWVZidS9mdmlkMldUZHRj?=
 =?utf-8?B?ZzNBNXRkZnR6QkNxY2lWdG1YVjVrZ0g0bWJLRHJHZEVnV1l2Q29aTHhtZ0tC?=
 =?utf-8?B?Q25DYlBLYjRTL1FZNVZxZTZNdkNmcFB3TGNlNGd5OGZLUkc5ZWVDSDBQbkdM?=
 =?utf-8?B?VFBWSk5NZmFUbXBYY3krWXV1bjdEVmJXeW5uejVpZTl6a2dkYXhHTE51ZXZW?=
 =?utf-8?B?eHZIQUNqZFNRb3c2dytHU1lVRjh5N1ZHTkdyVGJhQTV3UDFBcmNBbmFqUnA4?=
 =?utf-8?B?Qkc2cXFXYW5vcjhNWFdkMGRRMzE3SVk4NkhCMXhwYU4wRTZDejJMSUpmcDlY?=
 =?utf-8?B?MG1xYXlyZUpIUXdYVFByMEwycHRxVTN0Y2ZmRTFIYi9YcFQ4YUN6ekVENFBl?=
 =?utf-8?B?ZFd6VWRhUytlcXpMR2pJSnhUMGtLS1pnR2tJQTJvZXFNdE8wZXlEVGFhZ0tE?=
 =?utf-8?B?dzJTSm1jalhpMkg0V3Z0YXhRcFd6K2ttMDdsaW8yeXlVb1dWS3NIakk5andn?=
 =?utf-8?B?SzJuL2lJa2VRQmJPcmRQZ0MvN0pCUEQ3YmJ4N1A0b1p5RFdRZkJaa2tjY1NT?=
 =?utf-8?B?ZXVGbmh0UERrSGl2ZnJZY05paDZRbGtvbTJ2d3hzMytTR0xsdUt6dFJhMW1x?=
 =?utf-8?B?cE8yTzBQVitubGhmazU2TnpMMUZiT05DTTBUUjVwTjdwTVJYcXAvbFNGaEVE?=
 =?utf-8?B?VlB6ZUNBcHh1aEc1K284TUxOY1ZIYzJRWXJISEphWldDbGxENjM2ZTFhMkMz?=
 =?utf-8?B?UUN4ZDFITGJVZFBuOEp2RHRlMjF1c215ano5K1lPTnhIUlBiVEcyRlFvc1o3?=
 =?utf-8?B?ZVd0cEFJenpWU0J5clF6UnhoUHVITTVmazUvZVRkUlJRc2FRdWJvVlVtM1JG?=
 =?utf-8?B?VUowc1FWQzFuKzNOK0t3NnEwNDBRWmEwMzMvaHE5NXNWVkxiRWhyc2VvRzN5?=
 =?utf-8?B?VllSc29PTlNGNDFnWUd0dU00V3d5S1BuVWdMeXF0REQ0S0tOWUpaVTZCc3Bs?=
 =?utf-8?B?dnM2VUZZSmNHUGdTZ2UwZWRtakVEYU9oZE5WZTNiRlNZMGJVcmpvbWswdlAw?=
 =?utf-8?B?TFNXYnMyYlpOOGFUd3RoejZUNnFTS09JdS9rZlg4dUJCSUdFY2REZmdWNUF0?=
 =?utf-8?B?dlJETGlzbUxxQUc5bzYwaTdtb1RMbS9YZFVQODdkblYydmRNRlQremIwRVlS?=
 =?utf-8?B?YkZicWZkQm5Uelp3aCtCdmN5Q2NubExzMVZJNHZRTW5tbVVCSVFvS1pGL09o?=
 =?utf-8?B?V0xHdW9IOGl3MmNLdGZMUllyc29SUUxpTVFwL2VxMnZWUWtKWU8rZVlZL0J4?=
 =?utf-8?B?Sjg3aE5JZUU5QU1sVks0WkU4S2xndmRXMU16bjhZRENOQUFraEpTR0hCZU16?=
 =?utf-8?B?VVpuM2UxZ3dCZXh5VVdjaGZScUQ2VGFiVUw1S1k0VmJMY2tRQTYvSElVc3lh?=
 =?utf-8?B?bGg3WisxK21kYm50WmhIQWVhZFBENWFWZng5OHV0UXpYdlJUbDErTkMwUnRl?=
 =?utf-8?B?YlF5WW52Y3poMTcwL0NtOWQ2TGVyY0wrRzRHSU5OanhzeDFTcm5sVTl3K2ZL?=
 =?utf-8?B?eDJZZDEySHB4SFowcUFnN2djQWEvb0JsbWZaMWJDalVFYitDUndJeWR6dXNK?=
 =?utf-8?B?UktpeHVGbjgzNmJQZkViNjk2NDBpcHdyYXc5M084QkZseDdzSmdNTkZCTE1u?=
 =?utf-8?B?VGdDYVF4TUtOWHd1c3oyMll5a0JpNGE1ejlUMDhid3ZITStYRm9xeXpYWWhD?=
 =?utf-8?B?VjNnUEdmeW1yY0VyN1dEYUw2ZlZSclczVEVleDJ1eC9UMjhXVXJnUFhrTUQz?=
 =?utf-8?B?TjJsRWRaY1dqMlJ4T01GcWM4aUpMcTA3WFVWNjhjZnphRGYwS2Njc3F0YVNT?=
 =?utf-8?B?Sk1pWTcyRC9GeGs2TVJGR093ZlIyU1I5R3Y2dzhyNWwxaTFITjM4UXZFNE5y?=
 =?utf-8?B?L2RyYitkNTZvWVBNeXFVTjJQUEd5K2t2MWN3Z0FGS25odjdyZU1GQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 00755ecf-95c5-4c77-2fa6-08deb1ed3095
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 19:15:41.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XINkLYYzaFbWutDKwLnbuGfUFg8+hrEJ1ML/wtkO7VE4z35HPM3Gl6SSyXPeZ3T9tJZf9AOnhjULAvBDnQn8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5770

On Tue May 12, 2026 at 1:09 PM BST, Gary Guo wrote:
> Instead of projecting using pointer to a field project the full slot. Thi=
s
> further shifts the code generation from the initializer site to the struc=
t
> definition site, which means less code is generated overall.
>
> It also makes the safety comment easier to justify, as now the projection
> is done by the `#[pin_data]` macro which has full visibility of pinnednes=
s
> of fields.
>
> The field alignment could also be checked on the `#[pin_data]` side;
> however, since `init!()` macro works for other type of structs, we cannot
> remove the alignment check from `init!`/`pin_init!` side anyway, so I opt=
ed
> to still keep the alignment check in init.rs.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/pin-init/internal/src/init.rs     |  5 ++---
>  rust/pin-init/internal/src/pin_data.rs | 12 ++++++------
>  rust/pin-init/src/lib.rs               |  2 +-
>  3 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index e6f5ea06f91b..699b105570a5 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -245,12 +245,11 @@ fn init_fields(
>          let slot =3D if pinned {
>              quote! {
>                  // SAFETY:
> -                // - `&raw mut (*slot).#ident` points to the `#ident` fi=
eld of `slot`.
> -                // - `&raw mut (*slot).#ident` is valid.
> +                // - `slot` is valid and properly aligned.
>                  // - `make_field_check` checks that `&raw mut (*slot).#i=
dent` is properly aligned.
>                  // - `make_field_check` prevents `#ident` from being use=
d twice, therefore
>                  //   `(*slot).#ident` is exclusively accessed and has no=
t been initialized.
> -                (unsafe { #data.#ident(&raw mut (*#slot).#ident) })
> +                (unsafe { #data.#ident(#slot) })
>              }
>          } else {
>              quote! {
> diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/inter=
nal/src/pin_data.rs
> index 3278a54510e1..a3431863f5d6 100644
> --- a/rust/pin-init/internal/src/pin_data.rs
> +++ b/rust/pin-init/internal/src/pin_data.rs
> @@ -377,21 +377,21 @@ fn generate_the_pin_data(
>              quote! {
>                  /// # Safety
>                  ///
> -                /// - `slot` points to a `#ident` field of a pinned stru=
ct that this `__ThePinData`
> -                ///   describes.
> -                /// - `slot` is a valid, properly aligned and points to =
uninitialized and
> -                ///   exclusively accessed memory.
> +                /// - `slot` is valid and properly aligned.
> +                /// - `(*slot).#field_name` is properly aligned.
> +                /// - `(*slot).#field_name` points to uninitialized and =
exclusively accessed
> +                ///    memory.

This line has an extra space. Sometimes visually aligning doesn't mean it
actually is :)

I'll fix this up when applying.

Best,
Gary

>                  #(#attrs)*
>                  #[inline(always)]
>                  #vis unsafe fn #field_name(
>                      self,
> -                    slot: *mut #ty,
> +                    slot: *mut #struct_name #ty_generics,
>                  ) -> ::pin_init::__internal::Slot<::pin_init::__internal=
::#pin_marker, #ty> {
>                      // SAFETY:
>                      // - If `#pin_marker` is `Pinned`, the corresponding=
 field is structurally
>                      //   pinned.
>                      // - Other safety requirements follows the safety re=
quirement.
> -                    unsafe { ::pin_init::__internal::Slot::new(slot) }
> +                    unsafe { ::pin_init::__internal::Slot::new(&raw mut =
(*slot).#field_name) }
>                  }
>              }
>          })
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index e891d65cc469..c9e2cbe27915 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -868,7 +868,7 @@ macro_rules! stack_try_pin_init {
>  macro_rules! assert_pinned {
>      ($ty:ty, $field:ident, $field_ty:ty, inline) =3D> {
>          // SAFETY: This code is unreachable.
> -        let _ =3D move |ptr: *mut $field_ty| unsafe {
> +        let _ =3D move |ptr: *mut $ty| unsafe {
>              let data =3D <$ty as $crate::__internal::HasPinData>::__pin_=
data();
>              _ =3D data
>                  .$field(ptr)


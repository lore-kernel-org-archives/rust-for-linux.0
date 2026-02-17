Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B453014D29B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 02:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771296320; cv=none; b=it3Ci7WfI+SCL9s7Bq8CQZtnOfLVRG96fKWFRygfvVTZZnLLA42xWXXJcfIoJB9J296YEB8/E7s769EJp+IZmiBytsG25Y9wtJEaGWiTRUnFytiDCAzead49P1oQHk3xE8tLVqjf2NCaWL04a1LPq31LauAO1HZEND0K5Z+nXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771296320; c=relaxed/simple;
	bh=GgvTTUEhofj82MmvFgp2KlmsvDf1iEKU0xOUweYkZHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pE3KV7H453Wbo+e6jQqau+RSiE0OeO/Ey/gu1+XIJ4wyGdnc3tidLPLfxhT4y/ZqzwZFPNNPv+DPWoZ7MqEErDFwoci8b/G3Jpr7q3NI6MSnw5RE7SFEp1h/iBK0SoT8Xu2Yld5jX9UISsENuVux4lZ+kwdZnq36wIxhrxU8Y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=dKcKZI6q; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="dKcKZI6q"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5E95D240027
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 03:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1771296317; bh=9XZWY4s+zmuqMw0CXOePmBfT3kmofDaonHN6AonxRPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=dKcKZI6qH1E5SQsDISLoZ1laJUH3agWYJK5CuQEamuAIRUV7sRu9SqrHha/sw1OEy
	 diK7S8ngKSCLwFiV7gtMiHFRlSnkr1H3pMSpaYurVnxzFuTVK+d2AH2rmNy4xPuj/i
	 pfCky5Wvuc95nEzmriD4DrcA1ZV9b/bVQrNQxP9afrqlwNq+oy9vqGOTdBGSjggr3g
	 fixIESi28Us79mXLYPSZas5oq/wKQA0q6TW8KUFTy0X6QYnM/BhFRufvPJxW5N5lkc
	 UrEAm8Bk0D3BXxODtei//lPm5EWSJGITiLRZ9OKfkFiWPbvM2E3ZjXQMLSvntSyenH
	 lRQVP0H8aS+XQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fFPBg0Lwcz6trs;
	Tue, 17 Feb 2026 03:45:14 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Jesung Yang" <y.j3ms.n@gmail.com>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  "Benno
 Lossin"
 <lossin@kernel.org>,  "Andreas Hindborg" <a.hindborg@kernel.org>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  <linux-kernel@vger.kernel.org>,
  <rust-for-linux@vger.kernel.org>,  <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/4] rust: macros: add derive macro for `TryFrom`
In-Reply-To: <DGGV2METTDXF.1BCNNP5T0TPV3@nvidia.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
	<20260129-try-from-into-macro-v5-2-dd011008118c@gmail.com>
	<87h5rxuw1n.fsf@posteo.net> <DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com>
	<DGGV2METTDXF.1BCNNP5T0TPV3@nvidia.com>
Date: Tue, 17 Feb 2026 02:45:16 +0000
Message-ID: <874ingf5qe.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> On Fri Feb 6, 2026 at 6:06 AM JST, Jesung Yang wrote:
>> On Wed Feb 4, 2026 at 10:39 AM KST, Charalampos Mitrodimas wrote:
>>> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
>> [...]
>>>> +    fn impl_try_from(
>>>> +        enum_ident: &Ident,
>>>> +        variants: &[Ident],
>>>> +        repr_ty: &syn::Path,
>>>> +        input_ty: &ValidTy,
>>>> +    ) -> TokenStream {
>>>> +        let param = Ident::new("value", Span::call_site());
>>>> +
>>>> +        let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
>>>> +        let emit_cast = |variant| {
>>>> +            let variant = ::quote::quote! { #enum_ident::#variant };
>>>> +            match input_ty {
>>>> +                ValidTy::Bounded(inner) => {
>>>> +                    let base_ty = inner.emit_qualified_base_ty();
>>>> +                    let expr = parse_quote! { #variant as #base_ty };
>>>> +                    inner.emit_new(&expr)
>>>> +                }
>>>> +                ValidTy::Primitive(ident) if ident == "bool" => {
>>>> +                    ::quote::quote! { ((#variant as #repr_ty) == 1) }
>>>> +                }
>>>> +                qualified @ ValidTy::Primitive(_) => ::quote::quote! { #variant as #qualified },
>>>> +            }
>>>> +        };
>>>> +
>>>> +        let clauses = variants.iter().map(|variant| {
>>>> +            let cast = emit_cast(variant);
>>>> +            ::quote::quote! {
>>>> +                if #param == #cast {
>>>> +                    ::core::result::Result::Ok(#enum_ident::#variant)
>>>> +                } else
>>>> +            }
>>>> +        });
>>>> +
>>>> +        ::quote::quote! {
>>>> +            #[automatically_derived]
>>>> +            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
>>>> +                type Error = ::kernel::prelude::Error;
>>>> +                fn try_from(#param: #input_ty) -> Result<#enum_ident, Self::Error> {
>>>> +                    #overflow_assertion
>>>> +
>>>> +                    #(#clauses)* {
>>>> +                        ::core::result::Result::Err(::kernel::prelude::EINVAL)
>>>
>>> What happens if we need a different error type here? For example, a
>>> quick look around in nova-core's "Chipset" enum, an unrecognized chipset
>>> ID warrants ENODEV rather than EINVAL, since it's about device
>>> identification.
>>>
>>> Not sure if it fits the design, just wondering if this flexibility would
>>> be useful, but would something like an optional
>>>
>>>     error = <ERROR>
>>>
>>> in the
>>>
>>>    #[try_from(...)]
>>>
>>> attribute make sense? e.g.
>>>
>>>    #[try_from(u32, error = ENODEV)]
>>>
>>> defaulting ofcourse to EINVAL if unspecified.
>>
>> I believe this is indeed a desired change.
>>
>> Back in September, an RFC [1] using the same API (i.e., without error
>> customization) was sent; I took a quick look at the time and felt
>> everything was OK, but in hindsight, the need for this flexibility is
>> clear.
>>
>> Your proposed API looks good to me. Unless there are objections, I'll
>> move forward with this approach.
>
> One problem I can see is that ultimately the error depends on the
> context of the call, not the type itself.
>
> Nova-core's `Chipset` returning `ENODEV` is a bit too opportunistic to
> me - the only place where we are doing the conversion is within probe,
> and that's the error that probe is expected to return. But in another
> context (say, validating some user input), `EINVAL` could be the right
> error to return.
>
> There is technically only one reason for the derived `TryFrom`
> implementations to fail, and that's because the passed value doesn't
> exist in the enum. So really what we would ideally want here is a
> conversion method returning an `Option`, like enumn's `n` [1], that we
> `ok_or` into the correct error for the context.

Good one yes. This is a cleaner approach. Decoupling the error from the
type and letting the caller decode via ok_or looks better to me.

>
> But short of that, I guess we could also have a dedicated, single-value
> error type for derived `TryFrom` implementations that we `map_err`. That
> type could even have an `Into<Error>` implementation that converts it to
> `EINVAL` by default, as that's going to be the most common case.
>
> ... but if we do that, that's not very different from returning `EINVAL`
> and having callers `map_err` on that when they need it.
>
> [1] https://docs.rs/enumn/latest/enumn/

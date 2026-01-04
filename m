Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893D6280308
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 23:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767570261; cv=none; b=dbftAthjiFYrn6EzFUGlGpR4Wjk/O/YKTfKCoDXe4iUyx0GdOv0v2hjzaEiUw6D5dX7dh44ODd70AJybfj9iNbs6KneBOk2Z9h+lO8PMDkfBwnOek0NyFDxLDY1GnW30pjKU9OBhf8+Zqg5uLEZm0mKri4PW/SdPnFxAckYH0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767570261; c=relaxed/simple;
	bh=p306LGy9eyHijx4jtMFK/9mzd15/zQrT57WNykUTQAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeemKmuX4Hnp4ohHuynvFxL5h7lDvSCVtURtukfvS1V7gyV3GbpDvf7tzitPR9vOOmEQQ0PVpVzKUJWSzXoJY4ej4w96YAmrWCQ3X+VrUnJmf2EP+jnlFUZgYGORJ6we5nDDI28MSgpkiAPUp1CwLzfRsKc9oTWvGK5TuF7lJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFO5Cso3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFO5Cso3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37d275cb96cso126093411fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767570258; x=1768175058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwHMhGA+OGxFsPqS+gadiDszFLzctoJHxAFwyBwL5ow=;
        b=AFO5Cso3xWamk3aAjID4gVgSvat9pX/8+WXVhv0se1w9B36Y4EoNPE6KY4jU+EEEo7
         OXI4RIAtXninFFy1CMLpTpOEwa8Cc2z2zNlAFN3KBFtOWyFKNk783r94sxwpab/rPw73
         2cWG42UlUAqNwR/mL3IvShyr/4c92UB24r66agHRDXJz1oU6WtMbLD7Jx2FzvY7pxLx0
         1EdADw7HKh6S3N4HO59G4sKGYDN2eYGVPPnKLcW+7J8m/Yq+UlVwPIc98/FnPIQ6eRAb
         kKbvpqRAValZCSXZURTlWwQUxe/Js1S6Is/aOyZsYToKN0/B396+c44jsDOk4JwaIZKG
         IA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767570258; x=1768175058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwHMhGA+OGxFsPqS+gadiDszFLzctoJHxAFwyBwL5ow=;
        b=DMQ/xDHYz6j/YwkPZ9mkBE9HlfLa3jn9LLEukrxCX1F48BW7Q9T9AWqZA3/SQ7Rj2V
         QFPFgYn8LL/RDBo+ii2/UIxEwetOtShBmVgiXHBB/znvt56jnohwM/9rhystby6BD8s6
         A0CFJvt/tooCUL4cR9iD6brZnTUUBum3HkZLU1v5vmdR8c3OCkpOqj9qKnPMl+KegQ7l
         xwRYh4wt43Y404kgDVaoe6Ia6exyh8HghCxDSqVUgJFMAtY79JRx8unuzBwmZugAvD+r
         9m+Rdr4i5eIFLaTo1Ysc6tI6EhiEc83yQ5Ha7G/5ExRei66ZT0uJCTb0WROOVwRSVxzm
         pf4A==
X-Forwarded-Encrypted: i=1; AJvYcCX0gmueFnkww9crYLwvG17ufFK+DgyKFT+zFjv116Ao1KTHEFi/nZWyIwoRnL2HPeOYjKAjz3dMHsTAReAPsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTk02TqlCTgAT9miFpznS7FhU11araY54qhejHLEemfGYGd4q
	OQnd4H0ScdykqODMOINRK8PAsY6BbjJ7ys8ul+MZPfxZaNNln/ac92qUzh6MS1J793emelMFB/e
	fvfNegzqB45s6se+F0WJq+1i7oQDLRyA=
X-Gm-Gg: AY/fxX7XZ+AAXFfkh+OHVj4mnx9WTTk2HVDec+modQtjAuCxC/x2xwjiax07Gq57RIy
	G3vjZWl1ZxHoKaRA15xvowtv80XI4IYE5225XDkz5kf1NPJlVgh/PaF1iVu9fAIbc5Tc83u46qJ
	ocF7Xne99c4I4IwpW76AalOPIdozLRBhNauDmXOUDZ4eqT6W1XGZhQRnWX3CUTh18DdaJL7mR3X
	0TB7FWGKblegS8eO40c23bDP1U6HzUbPicVQcsH1YoUZCZXcv3aeRVmod5Y00U2aeTYaz6P2l8n
	d7iIU/XytFA7R7BE2aZO8XNZRqZP6O1Y1uhhrPmV7/096RqaIjWKVjq+CdQ0JlFGIe+pNkyr3NK
	snxHCsQn9wvaBGvgFA7juCJcVnyIsWQHrEyIMCnAodSbNgVR3CtXC
X-Google-Smtp-Source: AGHT+IGuPXba3z676DlVj61wJCekKitKvtqU0BKt1o39uHMbQ3Gl9Z09lZ4ePwCUOEShjHGlrnmGWmO4NBXpCNDJB9w=
X-Received: by 2002:a2e:8a94:0:b0:37a:29b5:e62c with SMTP id
 38308e7fff4ca-38121552fd5mr132780531fa.5.1767570257433; Sun, 04 Jan 2026
 15:44:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-12-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-12-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 18:43:41 -0500
X-Gm-Features: AQt7F2paFES2E6TsHfyG09C6nDI2aB8-aBBa0kRt5qNHk6sNb4ZmZsDDv-QPdI8
Message-ID: <CAJ-ks9nF00Nn1oRFu+5AWi37WbvJUWJcWwHdA24nyc3TyUdiew@mail.gmail.com>
Subject: Re: [PATCH 11/11] rust: kunit: use `pin_init::zeroed` instead of
 custom null value
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:36=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> The last null element can be created (constly) using `pin_init::zeroed`,
> so prefer to use it instead of adding a custom way of building it.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/kernel/kunit.rs | 26 +-------------------------
>  rust/macros/kunit.rs |  4 ++--
>  2 files changed, 3 insertions(+), 27 deletions(-)
>
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 79436509dd73d..034158cdaf06b 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -192,9 +192,6 @@ pub fn is_test_result_ok(t: impl TestResult) -> bool =
{
>  }
>
>  /// Represents an individual test case.
> -///
> -/// The [`kunit_unsafe_test_suite!`] macro expects a NULL-terminated lis=
t of valid test cases.
> -/// Use [`kunit_case_null`] to generate such a delimiter.
>  #[doc(hidden)]
>  pub const fn kunit_case(
>      name: &'static kernel::str::CStr,
> @@ -215,27 +212,6 @@ pub const fn kunit_case(
>      }
>  }
>
> -/// Represents the NULL test case delimiter.
> -///
> -/// The [`kunit_unsafe_test_suite!`] macro expects a NULL-terminated lis=
t of test cases. This
> -/// function returns such a delimiter.
> -#[doc(hidden)]
> -pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
> -    kernel::bindings::kunit_case {
> -        run_case: None,
> -        name: core::ptr::null_mut(),
> -        generate_params: None,
> -        attr: kernel::bindings::kunit_attributes {
> -            speed: kernel::bindings::kunit_speed_KUNIT_SPEED_NORMAL,
> -        },
> -        status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
> -        module_name: core::ptr::null_mut(),
> -        log: core::ptr::null_mut(),
> -        param_init: None,
> -        param_exit: None,
> -    }
> -}
> -
>  /// Registers a KUnit test suite.
>  ///
>  /// # Safety
> @@ -254,7 +230,7 @@ pub const fn kunit_case_null() -> kernel::bindings::k=
unit_case {
>  ///
>  /// static mut KUNIT_TEST_CASES: [kernel::bindings::kunit_case; 2] =3D [
>  ///     kernel::kunit::kunit_case(kernel::c_str!("name"), test_fn),
> -///     kernel::kunit::kunit_case_null(),
> +///     pin_init::zeroed(),
>  /// ];
>  /// kernel::kunit_unsafe_test_suite!(suite_name, KUNIT_TEST_CASES);
>  /// ```
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index 516219f5b1356..fd2cfabfaef76 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -74,7 +74,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module=
: ItemMod) -> Result<Toke
>      // static mut TEST_CASES: [::kernel::bindings::kunit_case; 3] =3D [
>      //     ::kernel::kunit::kunit_case(::kernel::c_str!("foo"), kunit_ru=
st_wrapper_foo),
>      //     ::kernel::kunit::kunit_case(::kernel::c_str!("bar"), kunit_ru=
st_wrapper_bar),
> -    //     ::kernel::kunit::kunit_case_null(),
> +    //     ::pin_init::zeroed(),
>      // ];
>      //
>      // ::kernel::kunit_unsafe_test_suite!(kunit_test_suit_name, TEST_CAS=
ES);
> @@ -159,7 +159,7 @@ macro_rules! assert_eq {
>      processed_items.push(parse_quote! {
>          static mut TEST_CASES: [::kernel::bindings::kunit_case; #num_tes=
ts_plus_1] =3D [
>              #(#test_cases,)*
> -            ::kernel::kunit::kunit_case_null(),
> +            ::pin_init::zeroed(),
>          ];
>      });
>      processed_items.push(parse_quote! {
> --
> 2.51.2
>
>

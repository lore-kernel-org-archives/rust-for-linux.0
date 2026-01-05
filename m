Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677B32F0C78
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607247; cv=none; b=rMERHK2prOBmIFyk9qldUpOBBDkD8phmepIcg9oqCok2jpWBbZ0KPrxoGQGXr1w8cVOEcGNxrY0zCUNXRWHQ5WE+YRLD3wwPlEcUgQ18LIsv5x4uGehp9cbYo1oZmkFsM1tN6zFm32Dw/KLVXmYMGIFbAwtKXdR3JNOWfyAMjeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607247; c=relaxed/simple;
	bh=Lk2vefzPYk8JDEjlXCDCMU5zYNBeXd2t0uuQrBPtwHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfHUsOOJpDADev+S6NNOXbARIsYZKZb8+43sXsVbM1UmUHYsIa+K3tDgChdONdOjGBjri3HzzjFbfguwJYpzDFqTsAwHiBiGUZhonQL+uHUOE5dMTfZwwI9fL/h8nZx38dKAl/ztqHw0I4avEdqiK3w85NEUSdnAfEYgRodtpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=18UYnazB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="18UYnazB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso6852754f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 02:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767607244; x=1768212044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo3wlUSLhpLMGkUK1K/hCh7spCd54eDChkCASoYRAao=;
        b=18UYnazBztcFWdhgADpZGqkroPVkWUIOWaBvCidy9lTITLfpnksUvRJpTkEqZ9eAJQ
         5tb4mYbKJEFRTfaFxK5W91QQ0tEalR884fuBR5RhlVEBFlEChLuSeOrHIxhFAaWOzeFm
         rn+aZs04qIXF3v3kgHNKuvt/x1r7Pewddjnay+SA08RGZbz9Fsz5vUHhv0ZgH36AEiVW
         iL+F3h2wXM1wcPZMhkoMUJE8/OUesy/21fsuzgA/abVG2FUujj1PmqcN/TbJ+dgw0L2Y
         b3EiEf7D0jl3ZqR3dfWSHtknXS//+nO/UDhrFJdE+BjHrpFnUOD7NCObhsQYeVQaOA6E
         mQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607244; x=1768212044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo3wlUSLhpLMGkUK1K/hCh7spCd54eDChkCASoYRAao=;
        b=U2jroxP7Nt6rPmH6MAN2XqcsOaHKVtJxWtpoZwOZdeawTDmzu67FP1OxEoy1D3FyHU
         83VpxsVtMUq/Nv8syGHErOigVA4HHjZwGCNMDM4adCpzbFC3n4tYxaK44KQlK6OXsUUX
         sEV0UORCEZJC6ZJ55wrco8ik1NPNTnTnTILLMCVDYNAEj1xFSNSxcUkoz5kFMD1W9JBI
         d6SDm1d+37mhQ69vgqPKqHmTVBzmvp/TMeAJIyCmDVVya9XAeTVseZq/w36crw8tDtOy
         IgXsQvIodHwNXRWNxXjPUpwmdQSBQKNu2ZNWCUYNOXMFEW4tsNkrjJ8UqS2gv3HHqq8f
         6jUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO/CCIemjcXLzxTElPBQz+B6UwLKNhUWXm9pD92msFCgn/nc9fRRhMY0NvULH5rkMuoFg+KVACOojE7DBYOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUskQbvLxCmoxLecqdlOCz3Q/iBjL2SMOx7pO8gzagC+JJWwzt
	WSBwuGi6VbdbhzCBJq+drAhILbBpRLcIOpQFrW2PH2S2/A15s0Duq4jas+ggnQMrn73BoYJz9zM
	ZPpoT93ASDogbR6as7Erei7dxkutUPL3iIEwUX6F3
X-Gm-Gg: AY/fxX41SerEknyz1M0kIR45dteg8dsWh/UR2uIKeXz1NP7PPJycPyKg9+29gz0+0VU
	u49FDWto89TjqXM6jemdgMLoso/q8IUNbKM9RB3EWT4DaWILVDdkeijM3rmYD2DXbz8oyxp91to
	mUNr1gnOnKMkYcfFy3DwbNvCehyH8t15l9/izFIGezeeer9rLkfwwoL7uNHu1iVuUFC3xOTD+mH
	1Ksraqb/t9UIDBdhX8I0RSDh6GlkVzmr5CqNGraB6mmgawq3g14nUAFstqnMbgkXklTZz/KxAto
	LoPN
X-Google-Smtp-Source: AGHT+IEk/KbaNuOT0iuCyqwY9Pz+2sczSCzCJ1UhBNsAdo2TBn+/BTEAZanNkG8EVJUkxrv6mh56iqt8+7JgU0hnSS4=
X-Received: by 2002:a5d:5f49:0:b0:42c:b8fd:21b4 with SMTP id
 ffacd0b85a97d-4324e709d72mr66643775f8f.57.1767607243104; Mon, 05 Jan 2026
 02:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-kunit-v1-1-39d999672f35@gmail.com>
In-Reply-To: <20251222-cstr-kunit-v1-1-39d999672f35@gmail.com>
From: David Gow <davidgow@google.com>
Date: Mon, 5 Jan 2026 18:00:30 +0800
X-Gm-Features: AQt7F2p5BSBpH94kbfHCYnx8HOFtX0dUS5b39-lEHnKudFaZabGIcBEkjGXYfO4
Message-ID: <CABVgOSncpskFNk0LOd3ZsrYcj9yAWLaFowo_rSLcvwKiKME=aA@mail.gmail.com>
Subject: Re: [PATCH] rust: kunit: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e254130647a1214c"

--000000000000e254130647a1214c
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Dec 2025 at 20:28, Tamir Duberstein <tamird@kernel.org> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

Sorry for the delay: this looks good to me.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  rust/kernel/kunit.rs        | 11 ++++-------
>  rust/macros/kunit.rs        | 10 +++++-----
>  scripts/rustdoc_test_gen.rs |  4 ++--
>  3 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 79436509dd73..21aef6c97325 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -9,9 +9,6 @@
>  use crate::fmt;
>  use crate::prelude::*;
>
> -#[cfg(CONFIG_PRINTK)]
> -use crate::c_str;
> -
>  /// Prints a KUnit error-level message.
>  ///
>  /// Public but hidden since it should only be used from KUnit generated code.
> @@ -22,7 +19,7 @@ pub fn err(args: fmt::Arguments<'_>) {
>      #[cfg(CONFIG_PRINTK)]
>      unsafe {
>          bindings::_printk(
> -            c_str!("\x013%pA").as_char_ptr(),
> +            c"\x013%pA".as_char_ptr(),
>              core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
> @@ -38,7 +35,7 @@ pub fn info(args: fmt::Arguments<'_>) {
>      #[cfg(CONFIG_PRINTK)]
>      unsafe {
>          bindings::_printk(
> -            c_str!("\x016%pA").as_char_ptr(),
> +            c"\x016%pA".as_char_ptr(),
>              core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
> @@ -60,7 +57,7 @@ macro_rules! kunit_assert {
>                  break 'out;
>              }
>
> -            static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
> +            static FILE: &'static $crate::str::CStr = $file;
>              static LINE: i32 = ::core::line!() as i32 - $diff;
>              static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
>
> @@ -253,7 +250,7 @@ pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
>  /// }
>  ///
>  /// static mut KUNIT_TEST_CASES: [kernel::bindings::kunit_case; 2] = [
> -///     kernel::kunit::kunit_case(kernel::c_str!("name"), test_fn),
> +///     kernel::kunit::kunit_case(c"name", test_fn),
>  ///     kernel::kunit::kunit_case_null(),
>  /// ];
>  /// kernel::kunit_unsafe_test_suite!(suite_name, KUNIT_TEST_CASES);
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index b395bb053695..3d7724b35c0f 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -102,8 +102,8 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
>      // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut ::kernel::bindings::kunit) { bar(); }
>      //
>      // static mut TEST_CASES: [::kernel::bindings::kunit_case; 3] = [
> -    //     ::kernel::kunit::kunit_case(::kernel::c_str!("foo"), kunit_rust_wrapper_foo),
> -    //     ::kernel::kunit::kunit_case(::kernel::c_str!("bar"), kunit_rust_wrapper_bar),
> +    //     ::kernel::kunit::kunit_case(c"foo", kunit_rust_wrapper_foo),
> +    //     ::kernel::kunit::kunit_case(c"bar", kunit_rust_wrapper_bar),
>      //     ::kernel::kunit::kunit_case_null(),
>      // ];
>      //
> @@ -133,7 +133,7 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
>          writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
>          writeln!(
>              test_cases,
> -            "    ::kernel::kunit::kunit_case(::kernel::c_str!(\"{test}\"), {kunit_wrapper_fn_name}),"
> +            "    ::kernel::kunit::kunit_case(c\"{test}\", {kunit_wrapper_fn_name}),"
>          )
>          .unwrap();
>          writeln!(
> @@ -143,7 +143,7 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
>  #[allow(unused)]
>  macro_rules! assert {{
>      ($cond:expr $(,)?) => {{{{
> -        kernel::kunit_assert!("{test}", "{path}", 0, $cond);
> +        kernel::kunit_assert!("{test}", c"{path}", 0, $cond);
>      }}}}
>  }}
>
> @@ -151,7 +151,7 @@ macro_rules! assert {{
>  #[allow(unused)]
>  macro_rules! assert_eq {{
>      ($left:expr, $right:expr $(,)?) => {{{{
> -        kernel::kunit_assert_eq!("{test}", "{path}", 0, $left, $right);
> +        kernel::kunit_assert_eq!("{test}", c"{path}", 0, $left, $right);
>      }}}}
>  }}
>          "#
> diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
> index be0561049660..967064ebd391 100644
> --- a/scripts/rustdoc_test_gen.rs
> +++ b/scripts/rustdoc_test_gen.rs
> @@ -174,7 +174,7 @@ pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
>      macro_rules! assert {{
>          ($cond:expr $(,)?) => {{{{
>              ::kernel::kunit_assert!(
> -                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $cond
> +                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $cond
>              );
>          }}}}
>      }}
> @@ -184,7 +184,7 @@ macro_rules! assert {{
>      macro_rules! assert_eq {{
>          ($left:expr, $right:expr $(,)?) => {{{{
>              ::kernel::kunit_assert_eq!(
> -                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
> +                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
>              );
>          }}}}
>      }}
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-kunit-be68dd8cfbd5
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

--000000000000e254130647a1214c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgS2rxeX6xkmR/7N7bjCOz+McBXhlM
NcVyvQHwXlgJ7w4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
MTA1MTAwMDQ0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAMUrlAiVEJraKe1F76Hnmco+vHfucUuiLVbXrepBK57gOzPhbfnlkj6cS/FGaHyXy
wNhpALObSi3jYXeYzmyKqfNpNEmbjDG7IRGuU+A04sN+1vWbBP6TaBni0sNbZHvlxJE1o7gwHuyv
FSdKs+9sYf7jn33PPFExk/e8Bs4hp/kO0J3w/iWg65Tmh52lDTbyZENxur8o9jNQ5IiBwlKrKE7i
Oq4Wwjnr75rCMuCs6+MkCd85QhTgZPzzjp2LAfqP1Tw+h4FYd2GN4wZf3dadbxdfpKUaOhPIo3sN
plkSVDmtZGfCpEs8Vmc059YY01OlibLDyHyYzl/BjLaNVSwagQ==
--000000000000e254130647a1214c--

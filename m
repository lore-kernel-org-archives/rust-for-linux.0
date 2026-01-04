Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E252566F7
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767570217; cv=none; b=Vcv5QgKuv7/UQOiSK19si9YFeY0mHmehchQtmPbk/WIwua31SA3IMI7ePteywVovD6Mi5sGf0EYPICWoq1DtC1Qpr/G5OOdX+ukwEQNPAAIOCzvUEs2mW8EEKJZfP7vTGwETZdOd4hO9ak2dN6ti4c7goAlcshjUlPlNmpfcB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767570217; c=relaxed/simple;
	bh=kAu8A0okyB9sbYwPfvDhpVuyamTl79WrqrtJc7O+YmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+Qk3L8Cr/CMW74CjWdsSJYn02FbUb+eKnOGz22wkUv0w1AeEMqgdk+4m8BYcmFudV3rnKfkTrCwlwe3CxYE7xIXxz9uN357M6v2cMA8L0WIrsB0QWtW8iW1kcPN40nABPy/0N/xCSwl7lPq5VSW0UJjDfODGm+yAZ9c6nhnZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw9KKYqs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw9KKYqs"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so14377205e87.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 15:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767570214; x=1768175014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbOOCMg+gybu8FWsopE1tBuCcuJn40dEsRAeRzGkOGg=;
        b=Mw9KKYqs0v9IXCl0j+uRcQXq7FOXhMD0H1aSLIOherDbSaccZsmTpqBP5OU+814EUk
         T6j7Mv/nocO7z6XvgYgzfQEYiwt6/wqCSPpRbGO6l1bQSModfRVtGS8CF7w2bZCu3vIj
         SQKH1Zu8Xs0lj4g+S7cO47YqB9ZlDRcEwWSVekQmsTloToksgSWN3W2upNmwTJBtkkLY
         QF+19EhSb72xDwHyjkYCmeCKHnwnE43lGpJTZr5mq/ZsGbAA59iqh89Y3DjxN8ev9G4S
         +dOdPdPS1h+edEvAy+CohkLEjV0svc+kb2QIF47qiYOJ7PF2TmdA7D4clGOckZdE2mvK
         Ozvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767570214; x=1768175014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbOOCMg+gybu8FWsopE1tBuCcuJn40dEsRAeRzGkOGg=;
        b=pFoPKPP4E4b8/YqzEnflbrtiCDKoe9a0lUBolnnO3v+tZ3z7LGwJHobfeWp5nQN8kE
         HZWalKW2GUlqtdhPKpgMfs57XtR9TxLmlmy5yue3uV2Z3Fmn2N+K8VgEo/NtY2FRUbqH
         zn9iFaKplGSy/LwLgmta0dQzafz3vPTGoLxhh42Wd7K3IWlDMeDOXgAQpKT/QdGotkeh
         ZC+cZrffmNzEQjre3qnp90zJ8nKD1OFLuzK7FTkk4mDMJjIwkjl8IVRHveNi9TeJSBTN
         oxa8wi3Cn8r90ePHrg9tCxDANUNjzBgCCFXtibj91t9GzZh4fpyLA3uwKuk4E0Rp0Jwb
         vCyg==
X-Forwarded-Encrypted: i=1; AJvYcCXLzRvsUg8880vMhwbuwu7asyCersw65geCp0vklrqqNN6UCvzq4FjbLXEYWwPw07z74DKSFi8oIBsCTEm3Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxpBZdfXEvpzjGr8iuKfDm6BNts6p5Vs4+apu+i1HnSqFGOaF
	kFUZhVgFlozQVLZNEhJwzMs/bH35Jpq6O/6YcxGIjsYJXaQetsPxXgsBbU6WorL1y5HQyhl7iQy
	gBw1RvtBTIuoI7c4IjsFDmsSdZMUlml4=
X-Gm-Gg: AY/fxX5ogd1CG3qPRbwmrp5EaOl4v/0/k7NpN8sTiUZBuilpJ3Fa0Ye/zSTHGz2XOVZ
	HoNjrTag1/fJXj7DNFefeD4Ic7Fe5y7CKM8a/dipNrCj95LD5Lmktl+tjB2LafdK/b5B8DCv2sp
	mn/jQe34CS4blFZt47SY1+1k7bkOBjECGa0YG7CMlU60Rg3jWMIBH4bAwgs4lVwSLmwHW5ODuBR
	Qy50qTX1gp0Gj0gTGjRWpAD0FifrsQFDXOfj9EBUJr8REHbXZ/+ftIwXAQr6ijX7PO+Zzdvt7Lj
	TO5eSyEi8A6yW6T2uZnfpVKxtP3OpXSBnohj3y1jAVqRM3v/7sBQYOkecq74F87Ckt1rk4L1Rz4
	L1jVo59qy0k3K5B9WuXf2u7Ggr9XKIvODS1eBXChSfw==
X-Google-Smtp-Source: AGHT+IGCCAHdnB+BddizzjSyY/MQLg4auE04K6QBwwcyaI1exBUbRFibFEcX95XaAcAIzV+a03dMC7Rd3DAKUGxxr7Q=
X-Received: by 2002:a2e:a552:0:b0:37b:9771:4f41 with SMTP id
 38308e7fff4ca-38121699ac6mr154611501fa.37.1767570213779; Sun, 04 Jan 2026
 15:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-11-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-11-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 18:42:57 -0500
X-Gm-Features: AQt7F2p-H9uoY922nVLi-SVTwnbDYUAbTyRHx6PRGtm9pOx_F-bU05iScT0JAIk
Message-ID: <CAJ-ks9m8+XnMpQtp1G3Fqx7fw-BGSu6oZZSEws_iTbO3Ze0KOw@mail.gmail.com>
Subject: Re: [PATCH 10/11] rust: macros: rearrange `#[doc(hidden)]` in
 `module!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:30=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This `#[doc(hidden)]` can just be applied on a module to hide anything
> within.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/macros/module.rs | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index d6298d04c86f4..75a4eae5610cd 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -71,7 +71,6 @@ fn emit_base(&mut self, field: &str, content: &str, bui=
ltin: bool) {
>          );
>          self.ts.extend(quote! {
>              #cfg
> -            #[doc(hidden)]
>              #[cfg_attr(not(target_os =3D "macos"), link_section =3D ".mo=
dinfo")]
>              #[used(compiler)]
>              pub static #counter: [u8; #length] =3D *#string;
> @@ -375,6 +374,7 @@ impl ::kernel::ModuleMetadata for #type_ {
>          }
>
>          // Double nested modules, since then nobody can access the publi=
c items inside.
> +        #[doc(hidden)]
>          mod __module_init {
>              mod __module_init {
>                  use pin_init::PinInit;
> @@ -384,7 +384,6 @@ mod __module_init {
>                  // This may be best done another way later on, e.g. as a=
 new modinfo
>                  // key or a new section. For the moment, keep it simple.
>                  #[cfg(MODULE)]
> -                #[doc(hidden)]
>                  #[used(compiler)]
>                  static __IS_RUST_MODULE: () =3D ();
>
> @@ -397,7 +396,6 @@ mod __module_init {
>                  /// This function must not be called after module initia=
lization, because it may be
>                  /// freed after that completes.
>                  #[cfg(MODULE)]
> -                #[doc(hidden)]
>                  #[no_mangle]
>                  #[link_section =3D ".init.text"]
>                  pub unsafe extern "C" fn init_module() -> ::kernel::ffi:=
:c_int {
> @@ -408,14 +406,12 @@ mod __module_init {
>                  }
>
>                  #[cfg(MODULE)]
> -                #[doc(hidden)]
>                  #[used(compiler)]
>                  #[link_section =3D ".init.data"]
>                  static __UNIQUE_ID___addressable_init_module: unsafe ext=
ern "C" fn() -> i32 =3D
>                      init_module;
>
>                  #[cfg(MODULE)]
> -                #[doc(hidden)]
>                  #[no_mangle]
>                  #[link_section =3D ".exit.text"]
>                  pub extern "C" fn cleanup_module() {
> @@ -429,7 +425,6 @@ pub extern "C" fn cleanup_module() {
>                  }
>
>                  #[cfg(MODULE)]
> -                #[doc(hidden)]
>                  #[used(compiler)]
>                  #[link_section =3D ".exit.data"]
>                  static __UNIQUE_ID___addressable_cleanup_module: extern =
"C" fn() =3D cleanup_module;
> @@ -438,7 +433,6 @@ pub extern "C" fn cleanup_module() {
>                  // and the identifiers need to be unique.
>                  #[cfg(not(MODULE))]
>                  #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
> -                #[doc(hidden)]
>                  #[link_section =3D #initcall_section]
>                  #[used(compiler)]
>                  pub static #ident_initcall: extern "C" fn() ->
> @@ -449,7 +443,6 @@ pub extern "C" fn cleanup_module() {
>                  ::core::arch::global_asm!(#global_asm);
>
>                  #[cfg(not(MODULE))]
> -                #[doc(hidden)]
>                  #[no_mangle]
>                  pub extern "C" fn #ident_init() -> ::kernel::ffi::c_int =
{
>                      // SAFETY: This function is inaccessible to the outs=
ide due to the double
> @@ -459,7 +452,6 @@ pub extern "C" fn #ident_init() -> ::kernel::ffi::c_i=
nt {
>                  }
>
>                  #[cfg(not(MODULE))]
> -                #[doc(hidden)]
>                  #[no_mangle]
>                  pub extern "C" fn #ident_exit() {
>                      // SAFETY:
> --
> 2.51.2
>

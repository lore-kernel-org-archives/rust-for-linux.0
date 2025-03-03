Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ADF23957C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042510; cv=none; b=KGPbUziDqs+1HAUaiXI3uyA1Ofxd7ys9PRk6Jh7UCMmjllRVFxwX74XMW4MlHUNp1xb1AlMd9+KRwkdul99OofTUKni1+MaZue6X1V4kZ77LFcU/z41RNaXSLNnJd3NUWAXd/8bEDkhx6F990cPosXhzySQGp1wt1z0Y92mVM8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042510; c=relaxed/simple;
	bh=FV0AMXP2plgQ+6X5x5sS4h/E9JkH8Jx7ZwLybj2GHcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKcgKGfNVDoOceD8gVDBwxgFMW1qqh2s0QNRW0m8a7s03lBhNoxT2Hd6RTzibsKh3duZwu+NaiYvZpInXrX9JQOjeAhnELgRvJTLTvkpKhKE09TxktlQLLZ1FUVrp0SLnGNcblssyb1wY/9p4/WUDyamGjEmb4mv7aGTJ6xli/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=atuko3OM; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="atuko3OM"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f4434b5305so43611777b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 14:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1741042508; x=1741647308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsORS7Y/VoLn8iE6xrSTP5GOFu3anHKEztygS4ARAzc=;
        b=atuko3OMuoBz3M8LQtPH5T/blMmnfG/pMclyA6oWZsL/vtwG+Q0vl3DoLc+AhhtddT
         ZgQTKtkenmfV9rf0t5H+Nja4KOJfROLi+nZvlIjd+K3VX47myciX4rJcrLqCoTWzb+nC
         G3s0fXm75FEizTCevZPrKSK/N6kQ/+g/sEHSEuFUbTwiFCDsLCKV3POnZI1X/8ZZPhc9
         hLCBxkKTwePc0zGerA9BhVEFCAwD91CZLUAd8iiuwSTNOEsMD8RMxFZ/9Tpj0bMJaKMW
         93Y0origjL0yPlr9s5ijGsI6eZ6frktvV3kPrp4xiFoz3lmn+MFHQ/QRo+T4eUVsIzBW
         Wz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042508; x=1741647308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsORS7Y/VoLn8iE6xrSTP5GOFu3anHKEztygS4ARAzc=;
        b=A4JetfKeWTGpd6j0JIF+1IbEsfGXjXImULnidtrKFGYLo8TVozPjlzDd+W6J1m0YXA
         wle1L77XPjkZcqUie2fPAKejOm7dtlPygZpCs3S+K54nA2jvaYqNGRYd5TVcnflKmm17
         JO3zZEz3RgwT78KWQ9hefWUPDuVmgR/2viKqdBg0gA0pzevf7yz0HLe2TYdaMhc2tGuz
         zffjBAvCkLNqGcKtkAieF2ebRCxE9PrLJyMK7T58hOsLbrFjHgvWPqKKsHbJpELw8U4x
         5UuMwTk0bD17QrSpuIoNatKx2T8FDQ7S/JnvBMvBulQREOtTPvD6BIRZli5U8/McXdM5
         alRg==
X-Forwarded-Encrypted: i=1; AJvYcCWRQ2AMncAr2p9FYSftXuSVoz1WIrXdRiXZnVIYHEoBnMn5aU4N70aJ37nm0u3w2fVn0wWOxKOk6boQZGEpyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1+7bmUCFV4itzib+gwtzlOIdRl+6WHDiUSvDny+xJs39ae4z
	oMTcyg671e6+JVKlPSn4RbQoaefIw6yJEImQaV5MB2ha+CogstxJW2AFhhtCcSX/lqIJgF9ZRt4
	WxtVX73XEe3KkMSE2K56jDtpUk19vphMNvIjO
X-Gm-Gg: ASbGnctq1Z5fePnCZlSwiGjl9ZsEGgIhN0NhHqhd5CLdI76ryDrbo+yKfY0OLQHDHWy
	b9WJwG2mEjfEsksZE/y/mjowyVaKr14PXe6ifbMmQKG5KLrAu1oqV+bYsK/ePxpZWRDqzTkL0KJ
	kNv+2gBkIvMCXJrHhhW1/sMNaYWg==
X-Google-Smtp-Source: AGHT+IE6rf8uW5Ake0yIOw7LcxxwfLNQ7aN2DZQJSmlz7GVUFfcRLmQdGJcdT3Qfu+CP0SMft2VWYj9dKOHeWHzxgUA=
X-Received: by 2002:a05:690c:3686:b0:6fb:b4e7:1471 with SMTP id
 00721157ae682-6fd49f9f825mr204154037b3.7.1741042508271; Mon, 03 Mar 2025
 14:55:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-inline-securityctx-v1-1-fb7b9b641fdf@google.com>
In-Reply-To: <20250303-inline-securityctx-v1-1-fb7b9b641fdf@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 3 Mar 2025 17:54:57 -0500
X-Gm-Features: AQ5f1Jr5IfzltzAXVNhmGo-A7qd4NzIh3iaT1pjM1-RaMmUpgWxt70koGP_h_PA
Message-ID: <CAHC9VhSo3aGsJVd=a3MTeakgU66oTN86oh5sZE8P4ghSk8Rx2g@mail.gmail.com>
Subject: Re: [PATCH] lsm: rust: mark SecurityCtx methods inline
To: Alice Ryhl <aliceryhl@google.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 10:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I'm seeing Binder generating calls to methods on SecurityCtx such as
> from_secid and drop without inlining. Since these methods are really
> simple wrappers around C functions, mark the methods to inline to avoid
> generating these useless small functions.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/security.rs | 5 +++++
>  1 file changed, 5 insertions(+)

While this isn't specific to your patch, Casey's comment about "free"
vs "release" is something to keep in mind when working on the LSM
bindings; what happens inside the individual LSMs for a given LSM hook
can vary quite a bit.

I also saw a similar Rust patch where a commenter suggested using
"impersonal facts" in the commit description and I believe that is a
good idea here as well.

Beyond those nitpicks, this looks okay to me based on my *extremely*
limited Rust knowledge.  With the minor requested changes in place,
would you prefer me to take this via the LSM tree, or would you prefer
it to go up to Linus via a more Rust-y tree?

> diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
> index 25d2b1ac3833..243211050526 100644
> --- a/rust/kernel/security.rs
> +++ b/rust/kernel/security.rs
> @@ -23,6 +23,7 @@ pub struct SecurityCtx {
>
>  impl SecurityCtx {
>      /// Get the security context given its id.
> +    #[inline]
>      pub fn from_secid(secid: u32) -> Result<Self> {
>          // SAFETY: `struct lsm_context` can be initialized to all zeros.
>          let mut ctx: bindings::lsm_context =3D unsafe { core::mem::zeroe=
d() };
> @@ -35,16 +36,19 @@ pub fn from_secid(secid: u32) -> Result<Self> {
>      }
>
>      /// Returns whether the security context is empty.
> +    #[inline]
>      pub fn is_empty(&self) -> bool {
>          self.ctx.len =3D=3D 0
>      }
>
>      /// Returns the length of this security context.
> +    #[inline]
>      pub fn len(&self) -> usize {
>          self.ctx.len as usize
>      }
>
>      /// Returns the bytes for this security context.
> +    #[inline]
>      pub fn as_bytes(&self) -> &[u8] {
>          let ptr =3D self.ctx.context;
>          if ptr.is_null() {
> @@ -61,6 +65,7 @@ pub fn as_bytes(&self) -> &[u8] {
>  }
>
>  impl Drop for SecurityCtx {
> +    #[inline]
>      fn drop(&mut self) {
>          // SAFETY: By the invariant of `Self`, this frees a context that=
 came from a successful
>          // call to `security_secid_to_secctx` and has not yet been destr=
oyed by
>
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250303-inline-securityctx-6fc1ca669156
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>

--=20
paul-moore.com

Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC192BF006
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754960605; cv=none; b=XGyFEcsK36D+IPzsJ7080PTr3HtQWtYyEJTVbVgu2Ibhv5BwdwpKBhilnx0EMgQoHNzEJ0V0FEFxK5G5GzooN9LePfCjlTX7bIAfJSnKLU7NVR7N/ipi3AMhkgeDmw6hEyA6siQVGhBRFZX2o8Cgmly6SeZrJHh3ItX6roUIblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754960605; c=relaxed/simple;
	bh=TkzV1QKaLX5KO/cgQ1/PYPcvVk41hW8Wc7iucPax0uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PW+/xw/LGjytIv+GlQO53QCHx/PSzVcai88UCXK6VjPZpmwpFB5NBZFnBXSl7vlm3dSnH+71xKldaeg+dpfbX4lEH0fK5IPeOF9A+1G7/V6YnXRdTJBUV8pnjd+kyrXkHC03qGxboR3ivCmLISCr04HM8JawWXbnGP0hQn8MtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpXJMXXi; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpXJMXXi"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-433f599d5b9so3284482b6e.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754960603; x=1755565403; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu7Cld25qTDhA1/DaYRistKjD1SkNhH9N8NVThhyaY4=;
        b=lpXJMXXiVtHAB7IXuc0OXk2PqygcfgSwGvHAzIukqCR2HurYrAbHERdSCkNmhFryBq
         Qi5TE6/NudrR2eiRE4bRHtG9h10s81AXyTRHd+8BLbqDic0fw2ApNYS34CwX4xBTeqH6
         oLWHNmmtsC5TlKyifQ0hfnRJ4h70VC2qjrITRmWvTQ8czP/kCNOzSLok7s5ptp0GTZ1B
         mX5zRN4EZtBopdfYliLNdb1EP79iIJQoXY9NKZux3nOE7zp6C5AVMtC4lHz7+RD7ztVQ
         p8HdgzInFz1ZO+MTSNaZS5K+BpA92ZZhwlNTpHe4DmjgFq3Xth3Z1Gt2JlLpNls7Y9wl
         XDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754960603; x=1755565403;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu7Cld25qTDhA1/DaYRistKjD1SkNhH9N8NVThhyaY4=;
        b=n2u7OL5qGuZs1FinOu96zlITsY1596fu3wPj/E+8uLqGLWgXUjjy7ZQerNGRhbxZM5
         UQSFCirHoN7Kc3y0CmjmeEtHPd9frg3XKfPXa0ze8lu8ThqjwtYl4SPalP14LOl6sgjO
         FNp81rnc6rnVfCyTR5ehJzTtydUGelyeUpSSvPQP/nfTx1OB8GZ/TOTpZd0Ojhu1dtlS
         QdQTqeFIuntWMGbGWnKY8sr2LfwqUVAItQ+MZIr2uFbMBQ8inVVu3ELY0efE9tnkeaZn
         dJylK8b1Je2Y4qenOeWq+aQIHy2GBop5bFov0O+scPmp+XFd9VSoCrZYOHBhJTJialt6
         yiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM1P7zo+w6b/QgI6R2iTJOVI6x6TRKexmNkbq92Ab4iJaGTDUi3pmXS+7oCbAtcV+z3/k/H5LFw1YghYp2PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyauH+T7Mqa1XNomR05jP/sG0KA9ANVzZzc/KuuDtohE18oS5Wq
	zgYMMB5U+kGiK5KeX5FstbyoazLZ+hz+p5cuquTw+6umeczqTC58Fhu8hMKVwSrDpmAGu/VzBvZ
	s9cJXfuW3dnguKETc6dDikZFXOZef5+4=
X-Gm-Gg: ASbGncsxHhB7wjBFZx7CtD8v8Ig7BCzJ5mvsdzkFsu5jn1rOvwUyF3ZeJciJUnHe3L8
	d1Q2wyNbuYE4QZUqkYOhGefynE0r6B4bqVMzlfsTDgY/AVLekHw6yMEr7bXWehQhbPQ0f383w+P
	GDRZsgmYj8w+OpP+NqNYz+flffM3HI91hFmDCRXg2n8vLnjtd4p7cxqcHHq0A83gmProNaDhxrR
	ZV0XSjwTwv7dnkWIAs=
X-Google-Smtp-Source: AGHT+IGgs1wEZ5LXnkyua15UsD3eqUuRVXc9ZG/3ZEzyLND/fFEAqELjZCI+9FVcQXJOVyrSqBVEZ2fSMeuDbONnRtg=
X-Received: by 2002:a05:6808:1308:b0:435:77d7:e89d with SMTP id
 5614622812f47-435c91e4582mr1069368b6e.31.1754960602643; Mon, 11 Aug 2025
 18:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com> <20250726183552.23098-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250726183552.23098-4-marcelomoreira1905@gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 11 Aug 2025 22:03:11 -0300
X-Gm-Features: Ac12FXw3Whf008cjcOdn4h5QXF4P-17ot7Z2RaCRFG7XZG0ffy_apKfVt4rczbk
Message-ID: <CAPZ3m_h1HPPx4hjS9w42b4UyHccXjNiUJyq71TtucFhERtJfNw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] rust: revocable: Documents RevocableGuard
 invariants/safety and refine Deref safety
To: aliceryhl@google.com, lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 26 de jul. de 2025 =C3=A0s 15:36, Marcelo Moreira
<marcelomoreira1905@gmail.com> escreveu:
>
> Refinements include:
> - `RevocableGuard`'s invariants are updated to precisely state that
>   `data_ref` is valid as long as the RCU read-side lock is held.
> - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
>   requiring callers to guarantee the validity of the raw pointer and
>   RCU read-side lock lifetime.
> - The `SAFETY` comment in `Revocable::try_access` is refined for
>   clarity, now explicitly stating how `Self`'s type invariants
>   and the RCU read-side lock together ensure data validity for reads.
> - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
>   is refined.
>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 6d8e9237dbdf..a2aa7989231a 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -106,9 +106,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Sel=
f> {
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
>          if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> +            // SAFETY: `self.data` is valid for reads because of `Self`'=
s type invariants:
> +            // `self.is_available` is true and the RCU read-side lock is=
 held by `guard`.
> +            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
>          } else {
>              None
>          }
> @@ -233,7 +233,7 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// # Invariants
>  ///
> -/// The RCU read-side lock is held while the guard is alive.
> +/// - `data_ref` is a valid pointer for as long as the RCU read-side loc=
k is held.
>  pub struct RevocableGuard<'a, T> {
>      // This can't use the `&'a T` type because references that appear in=
 function arguments must
>      // not become dangling during the execution of the function, which c=
an happen if the
> @@ -245,7 +245,13 @@ pub struct RevocableGuard<'a, T> {
>  }
>
>  impl<T> RevocableGuard<'_, T> {
> -    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
> +    /// Creates a new `RevocableGuard`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `data_ref` is a valid pointer to a `T` =
object,
> +    /// and that it remains valid for as long as the returned `Revocable=
Guard` is alive.
> +    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
>          Self {
>              data_ref,
>              _rcu_guard: rcu_guard,
> @@ -258,8 +264,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>      type Target =3D T;
>
>      fn deref(&self) -> &Self::Target {
> -        // SAFETY: By the type invariants, we hold the rcu read-side loc=
k, so the object is
> -        // guaranteed to remain valid.
> +        // SAFETY: `self.data_ref` is valid because of `Self`'s type inv=
ariants,
> +        // and the active RCU read-side lock held via `_rcu_guard`, ensu=
ring the data's accessibility.
>          unsafe { &*self.data_ref }
>      }
>  }
> --
> 2.50.1
>

Hello guys, how are you? :)
Are you still reviewing the patch?

If you need any more changes, let me know :D
Thanks!

--=20
Cheers,
Marcelo Moreira

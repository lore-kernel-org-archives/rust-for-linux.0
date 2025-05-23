Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2FC22615
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959225; cv=none; b=pT9nkbVw/i+BrVqSLqDX8575BDNHJ80M1who099PKpgfXv01yeQ9rnzkyu8bcAyYAYq1Eb2kqWXPwAgsGcx4zlBNuBBAXFFtlz43Uh22FxX4B4BlF6lNhLoeWqJj34UTvIfRHHtTc7HsSvXHhSKc7tqZ+8sMAd31ZRHbW8xW94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959225; c=relaxed/simple;
	bh=rst0/M9sDykPTp06oKAZBNlgwDpIbTMSzfWhSKgBtbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1wIhqrNsN5HdF0NsxQhilW+1pccfTKcJy8WSuvVX3rrQn82WZfP+SWzMGbjtSiJaAgwcsmGEJg10wcUKzjFkNHaYSz5dsP8EP6qDmY0HBYac4fUkTcABKcHCKOklEGB/iAeNVM1yeieOw3ZGxSbqAqIws6rfXiHPBvomtExfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpOJP8nz; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpOJP8nz"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2db9e29d3bcso2648739fac.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 17:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747959222; x=1748564022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVsgWhpRYvtdlITuRBXbwTjOq8o/UaeIMccIM0WPVe8=;
        b=cpOJP8nzhkGHJh/MAJhqpTFFDYNZpFg+oxnGT4U4TKx0BH3HNypFTuoWg+d9+PD/Zg
         l4LlLMYq6z3qZa4NzfmBE0iFFdIU/0iDXTUucJgT+69sgxZhAGeONjlZGD0Fv5EUkfqQ
         oAsWfSNYlpy8bB78dxT3P1i/Awrim9bA95f0Jk6a8VWl2B4J/T1Fh1pEzMZW/cjW5ko+
         UKCZBKNShnz0N3//y9/0mcNWtC/eTV+i5epG4IE2PjYzZA/NM2aSYmOrtUbBi3ZJdaoD
         0uYx9Wz9o1SSxM+rKVnWDdUZRUGWCircEDxlZ4el59SlbmKJVTxq/e5HbTjZmnMGGPyQ
         4dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959222; x=1748564022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVsgWhpRYvtdlITuRBXbwTjOq8o/UaeIMccIM0WPVe8=;
        b=YYKBiAsoEeKLdD5zWKAvV+oIo48QHChXldkQXXiclwXQUhBpjyDQXJoEob24CVLx6h
         LvQ32o/AAgrHWpTEguYLtOdD22bHuDKN+HKTTfZEZYO0YMc1j3gyt+jtdM3SJvN576dG
         o90iWJLPZE79H/KYY9t65MAWRAblMWq4X2LW4/LK23+C/kOv7CUEj1VBu9CmMcKKXHUl
         FcA2IoXI7r2DALfbbzHkH2wexNyhT1TanEwSkz+XayR3pHvOC6ajWiLmNYq52AJtSheD
         M6X4Umq+fUWIlcWJ7eHHkfORLf3ynyE+kjOp3crfVZ51Nk9lTCBe4Yf0lq2zEKzPhees
         wIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8x5L/lxkLAqALhS1egdu/ujjaQC9M5I+BHc4vsqHX6OqiM0bCLC0FWalZANL3Z6bBL/34m7Up96QzdOfVmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TA67XjMN5OQTpV2YtcYVEpXqKfjvCr2XFq0XwSPlIG+C6PJW
	zEY96kHTPLsvGQtHMgQHHSPX7V5yc5rpAYs9KOWX5KrWJ47OoFetN4nUtAZ37rCP4wisMTZhagI
	E05tRaCF7r8Q5EH19ENFE8eh6KwigfpU=
X-Gm-Gg: ASbGncto9rNQRnhOZmB+FFLGXkp2BCGAi8ZCmpRe3vuVfwFj3fDkdjLoErnFalFinhr
	S4qNxv+bTxrB8QI516DLBPdRATokpwgB6PCMiOmvfzIGQCTzSVtaajS3wEnAWa0XIU9KW0bl3hg
	XPGGTt/45W3vGj0SebpCW6wjvbpC1xMTw+2SSnm6fs2zVn
X-Google-Smtp-Source: AGHT+IGd55b0sZSomD/WG3O3kWu4Oa2dyLscoAQxoAT6h3OTeJAtRaokwX6kXpuxFqFKtuMVrqLbOc3TGlRvoTR67Hk=
X-Received: by 2002:a05:6870:6191:b0:2c2:3e54:553 with SMTP id
 586e51a60fabf-2e3c1ed25d4mr16851015fac.28.1747959222083; Thu, 22 May 2025
 17:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux> <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
In-Reply-To: <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 22 May 2025 21:13:30 -0300
X-Gm-Features: AX0GCFs6CiOuXbALz3PSzIn221oJ7SuLny8l_W7DaxSPxO6clQIFyTIrNFWSd1M
Message-ID: <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, benno.lossin@proton.me, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for the discussions. I was reading them one by one and
trying to consolidate the ideas.
I am preparing a new patch version focused on improving everything
that was discussed.

Before submitting the patch, I would like to understand if things are
clear to me. Here is what I am preparing:

1. Refined `Revocable<T>` Invariants, suggested by Benno:
Proposed Documentation:
/// # Invariants
///
/// - `data` is valid for reads in two cases:
/// - while `is_available` is true, or
/// - while the RCU read-side lock is taken and it was acquired while
`is_available` was `true`.
/// - `data` is valid for writes when `is_available` was atomically
changed from `true` to `false`.


 2. Updated try_access and try_access_with_guard Safety Comments:
Proposed Documentation:
// INVARIANT: `self.data` is valid for reads because
`self.is_available` is true,
// and the RCU read-side lock ensures this condition is maintained
during access.

These comments now directly reference the new Revocable<T> read invariants.
This addresses the  point about justifying the access to data via the
invariants,
especially considering the RCU read-side lock.


3. Clarified revoke_internal for SYNC =3D false and swap correction
Proposed Documentation:
 if self.is_available.swap(false, Ordering::Relaxed) {
 if SYNC {
                // SAFETY: Just an FFI call, there are no further requireme=
nts.
                unsafe { bindings::synchronize_rcu() };
 }  else {
       // This branch for `revoke_nosync` requires the caller to prove
that `data`
       // can be dropped immediately without waiting for any RCU grace peri=
od.
}
// SAFETY: We know `self.data` is valid because only one CPU can succeed th=
e
// `swap` above that takes `is_available` from `true` to `false`.
 unsafe { drop_in_place(self.data.get()) };
   }
}

I've added a  comment for the SYNC =3D false branch (used by revoke_nosync)=
.
This explicit else block, even if semantically empty of executable code, is=
 for
documenting the unsafe contract for revoke_nosync(). It  states that the ca=
ller
must prove data safety since no RCU grace period is awaited, aligning with
Danilo's explanation of revoke_nosync's purpose. Additionally, I've correct=
ed
the comment from compare_exchange to swap to accurately reflect the
atomic operation used.


4. Documented RevocableGuard<'_, T> Invariants and PhantomData Adjustment
Proposed Documentation:
/// # Invariants
///
/// - The RCU read-side lock is held for the lifetime of this guard.
/// - `data_ref` points to valid data for the lifetime of this guard.
pub struct RevocableGuard<'a, T> {
    data_ref: *const T,
    _rcu_guard: rcu::Guard,
    _p: PhantomData<&'a T>,
}

This adds the # Invariants section for RevocableGuard, as we agreed it shou=
ld
state its guarantees, including the RCU read-side lock. The adjustment of
_p: PhantomData<&'a ()> to _p: PhantomData<&'a T> is a minor improvement in
type-level documentation, making the lifetime dependency more explicit to t=
he
Rust compiler and future readers.


5. Revised RevocableGuard Deref Safety Comment
Proposed Documentation:
fn deref(&self) -> &Self::Target {
        // SAFETY: By the invariants of `RevocableGuard`, the RCU
read-side lock is held,
        // and `data_ref` points to valid data for the lifetime of this gua=
rd.
        unsafe { &*self.data_ref }
    }

The // SAFETY: comment for Deref is updated to refer to the RevocableGuard'=
s new
invariants, providing a justification for the unsafe dereference.


6. PinnedDrop for Revocable<T> Safety Documentation & Readability
Proposed Documentation:
let p =3D unsafe { self.get_unchecked_mut() };
        if *p.is_available.get_mut() {
            // INVARIANT: `is_available` is true, so `data` is valid for re=
ads.
            // SAFETY: `self.data` is valid for writes because
`is_available` was atomically changed from true to false
            // in `PinnedDrop::drop`, and only one thread can do it
now as we have `&mut self`.
            // This ensures `data` is valid for writes in this
context, allowing `drop_in_place`.
            unsafe { drop_in_place(p.data.get()) };
        }

The // INVARIANT: and // SAFETY: comments within the PinnedDrop
implementation are
updated to reflect the new write invariant of Revocable<T>, justifying
the drop_in_place call.


Please let me know if something is wrong or unnecessary... I'll try to
rephrase if appropriate. Tks :D

---
Cheers,
Marcelo Moreira :-)


Em seg., 19 de mai. de 2025 =C3=A0s 09:26, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Mon May 19, 2025 at 1:37 PM CEST, Danilo Krummrich wrote:
> > On Mon, May 19, 2025 at 01:10:32PM +0200, Benno Lossin wrote:
> >> On Mon May 19, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
> >> > On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
> >> > Why not? Please show me a case where `is_available` is false, but I =
can still
> >> > technically access data (without violating a safety requirement).
> >>
> >>     let r: Arc<Revocable<i32>> =3D ...;
> >>     let guard =3D r.try_access().unwrap(); // nobody else is holding a=
 reference, so this can't fail
> >>
> >>     let r2 =3D r.clone();
> >>
> >>     // I know we don't have threads, but I don't want to have to look =
up
> >>     // how to use the workqueue or something else...
> >>     thread::spawn(move || {
> >>         r2.revoke();
> >>     });
> >>
> >>     for _ in 0..10_000_000 {
> >>         // do some non-sleeping work that takes a while
> >>     }
> >>
> >>     // now the thread above has executed `self.is_available.swap(false=
, Ordering::Relaxed)`
> >>     // in `revoke_internal` and is waiting for the `synchronize_rcu` c=
all to return.
> >>     // but we can still access `guard`:
> >>
> >>     pr_info!("{}", &*guard);
> >
> > Which is perfectly correct, you're right. I think I was too focused on =
the
> > optimization case. :-)
>
> And I was assuming the example was obvious with just saying "But the
> `is_available` atomic *can* be altered during the usage of `data`." :-)
>
> >> > However, this invariant does not need to be fulfilled for access() a=
nd
> >>
> >> Where is `access()` defined?
> >
> > https://gitlab.freedesktop.org/drm/nova/-/commit/46f91addfabbd4109fb648=
76a032ae4a4a924919
>
> "Reviewed-by: Benno Lossin <benno.lossin@proton.me>" huh, I already
> forgot about the patch... But that also shouldn't be difficult to
> support with the right invariant.
>
> >> > revoke_nosync(), because it would circumvent their purpose, i.e. cas=
es where an
> >> > abstraction can prove that there can't be a concurrent user of the d=
ata or a
> >> > concurrent user revoking the data respectively.
> >>
> >> Yes. How about something like "`data` is valid while `is_available` is
> >> true. It also is valid if the RCU read-side lock is being held and it
> >> was taken while `is_available` was true."?
> >>
> >> That should also cover the "nobody else is accessing this" case.
> >
> > Sounds good to me!
>
> I'm not happy with the sentence structure, so how about:
>
> * `data` is valid for reads in two cases:
>     * while `is_available` is true, or
>     * while the RCU read-side lock is taken and it was acquired while `is=
_available` was `true`.
> * `data` is valid for writes when `is_available` was atomically changed f=
rom `true` to `false`.
>
> The last one is needed in order to call `drop_in_place`.
>
> ---
> Cheers,
> Benno

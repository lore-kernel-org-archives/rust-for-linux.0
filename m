Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340738FA6
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989783; cv=none; b=EDsa1doaApePniwaJkgjVkDmVBayG41yKa91AAvsPfYYOEIrFz08h/vm/2HD25xfS0izzxWGtAax5aP/HdTOLhnrFnTs3c/dNf7R0I18C+kQc/7t/ObCBu/Kj3NusSuocSJDUWpRRj0KhOQuIt+ujQvmMMoUwZ+eF1womRLVlz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989783; c=relaxed/simple;
	bh=16Fw6yJHs5tHc5W7VB0ZGnOAeG73IaGsWoRy5IXyoeE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ZMCD9p0QlXrnbTp/lBoZtDfDXFI0kUKdE0tpMqunXQHtaQArytyYA4Y5dFR2JbCEH9vt4tqJxH4PUMmY5R+BZXSvrmsypWChvIKyUIjhcMG75Pd7d1Cig5TbWv3bjfESGh5AMHd5ODUyJCCmO16jw+3HsUYF7PKU9LKPHdLjIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTNGv9Q9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTNGv9Q9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B392AC4CEE9;
	Fri, 23 May 2025 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747989782;
	bh=16Fw6yJHs5tHc5W7VB0ZGnOAeG73IaGsWoRy5IXyoeE=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=fTNGv9Q9VCTV8TdZMW8wizxI/zSxaEpoXDB2FdmUFwYvj5tpnQ/jme6mEXWHdReBn
	 +b7hlJ9yeqANk1NZQ5106e17ADGdMfA85kFxvCBg/myZW187IY736LtrrnLbnEVnKN
	 bhaApLX+Av0YHRwFhyjKQN5Qf3ivhClI4TYmlG4cHlBuz/ygrkP+uUBqGa8RYSizS8
	 x4QJrlMio9ZTOSM68Es6qJk5oJV83cy9txMoloqFsP7rAk08GNZG95BsF+uf2J/VRb
	 lkC1lf4R8U7/6kEQKwNmkXmFDS4vdU0aHWAzXc8KeZ+TRAPGNF+TT2xoyDK0eMdxCv
	 pVlCWS9cywgrw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 10:42:58 +0200
Message-Id: <DA3ENUO97I6D.234AA7I97AV62@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <benno.lossin@proton.me>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
In-Reply-To: <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>

On Fri May 23, 2025 at 2:13 AM CEST, Marcelo Moreira wrote:
> Thanks a lot for the discussions. I was reading them one by one and
> trying to consolidate the ideas.
> I am preparing a new patch version focused on improving everything
> that was discussed.
>
> Before submitting the patch, I would like to understand if things are
> clear to me. Here is what I am preparing:
>
> 1. Refined `Revocable<T>` Invariants, suggested by Benno:
> Proposed Documentation:
> /// # Invariants
> ///
> /// - `data` is valid for reads in two cases:
> /// - while `is_available` is true, or
> /// - while the RCU read-side lock is taken and it was acquired while
> `is_available` was `true`.
> /// - `data` is valid for writes when `is_available` was atomically
> changed from `true` to `false`.

A few comments:

* your email client seems to wrap this line :(
* the "two cases" should be indented, as they logically belong to the
  bullet point above.
* the information for writing `data` needs to be changed according to
  what I suggested in reply to Danilo

>  2. Updated try_access and try_access_with_guard Safety Comments:
> Proposed Documentation:
> // INVARIANT: `self.data` is valid for reads because
> `self.is_available` is true,
> // and the RCU read-side lock ensures this condition is maintained
> during access.

I'm missing the context *where* this invariant comment is placed. Maybe
send the patch with the modification or send a link to a branch where
you have the commit.

> These comments now directly reference the new Revocable<T> read invariant=
s.
> This addresses the  point about justifying the access to data via the
> invariants,
> especially considering the RCU read-side lock.
>
>
> 3. Clarified revoke_internal for SYNC =3D false and swap correction
> Proposed Documentation:
>  if self.is_available.swap(false, Ordering::Relaxed) {
>  if SYNC {
>                 // SAFETY: Just an FFI call, there are no further require=
ments.
>                 unsafe { bindings::synchronize_rcu() };

@Boqun: is this true?

If the answer is yes, then we should add this as a safe function in the
rcu module.

>  }  else {
>        // This branch for `revoke_nosync` requires the caller to prove
> that `data`
>        // can be dropped immediately without waiting for any RCU grace pe=
riod.

I'm not sure that having a single function that does the revocation, but
has this going on is a good idea. The safety requirements will be pretty
complex.

@Danilo what do you think of inlining this function?

> }
> // SAFETY: We know `self.data` is valid because only one CPU can succeed =
the
> // `swap` above that takes `is_available` from `true` to `false`.
>  unsafe { drop_in_place(self.data.get()) };
>    }
> }
>
> I've added a  comment for the SYNC =3D false branch (used by revoke_nosyn=
c).
> This explicit else block, even if semantically empty of executable code, =
is for
> documenting the unsafe contract for revoke_nosync(). It  states that the =
caller
> must prove data safety since no RCU grace period is awaited, aligning wit=
h
> Danilo's explanation of revoke_nosync's purpose. Additionally, I've corre=
cted
> the comment from compare_exchange to swap to accurately reflect the
> atomic operation used.
>
>
> 4. Documented RevocableGuard<'_, T> Invariants and PhantomData Adjustment
> Proposed Documentation:
> /// # Invariants
> ///
> /// - The RCU read-side lock is held for the lifetime of this guard.
> /// - `data_ref` points to valid data for the lifetime of this guard.
> pub struct RevocableGuard<'a, T> {
>     data_ref: *const T,
>     _rcu_guard: rcu::Guard,
>     _p: PhantomData<&'a T>,
> }

I think we can change this type to:

    pub struct RevocableGuard<'a, T> {
        data: &'a T,
        _rcu_guard: rcu::Guard,
    }

And then we don't need any invariants :)

> This adds the # Invariants section for RevocableGuard, as we agreed it sh=
ould
> state its guarantees, including the RCU read-side lock. The adjustment of
> _p: PhantomData<&'a ()> to _p: PhantomData<&'a T> is a minor improvement =
in
> type-level documentation, making the lifetime dependency more explicit to=
 the
> Rust compiler and future readers.
>
>
> 5. Revised RevocableGuard Deref Safety Comment
> Proposed Documentation:
> fn deref(&self) -> &Self::Target {
>         // SAFETY: By the invariants of `RevocableGuard`, the RCU
> read-side lock is held,
>         // and `data_ref` points to valid data for the lifetime of this g=
uard.
>         unsafe { &*self.data_ref }

With the above change, this body becomes `self.data` :)

>     }
>
> The // SAFETY: comment for Deref is updated to refer to the RevocableGuar=
d's new
> invariants, providing a justification for the unsafe dereference.
>
>
> 6. PinnedDrop for Revocable<T> Safety Documentation & Readability
> Proposed Documentation:
> let p =3D unsafe { self.get_unchecked_mut() };
>         if *p.is_available.get_mut() {
>             // INVARIANT: `is_available` is true, so `data` is valid for =
reads.
>             // SAFETY: `self.data` is valid for writes because
> `is_available` was atomically changed from true to false

This is wrong? It still is `true`?

>             // in `PinnedDrop::drop`, and only one thread can do it
> now as we have `&mut self`.
>             // This ensures `data` is valid for writes in this
> context, allowing `drop_in_place`.
>             unsafe { drop_in_place(p.data.get()) };
>         }
>
> The // INVARIANT: and // SAFETY: comments within the PinnedDrop
> implementation are
> updated to reflect the new write invariant of Revocable<T>, justifying
> the drop_in_place call.
>
>
> Please let me know if something is wrong or unnecessary... I'll try to
> rephrase if appropriate. Tks :D

It already looks much better than what we have currently. It's fine to
send a patch that's still needing review (and it makes it easier to
review when I have the full context). So I'd just do that and we go from
there. We're only on v2 on this one and I have seen patches go into the
double digits, so don't worry about that.

---
Cheers,
Benno

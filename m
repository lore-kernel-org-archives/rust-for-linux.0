Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BB130A73
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990561; cv=none; b=BtOV28sU3piTvBxhGNcUPuBiN+BT0gniJ2w1Suz/rNiLUDgE4euwPPlygjrFEr3usadSv7kcktwukG9Jc87xsSLVZgwoM95YnzQA9WTFBySKGITExH9Vd9tF/4S8oXsfekSXBBFUhbNHC4UFbiZa6ESnAEqyVzeiKad8ue66pHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990561; c=relaxed/simple;
	bh=9SoaVeXOrVydbuPq1K22nEmDYqKFXWQrFUdTaVSVQbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rv6c1VIFVN+UVvaoZ6t0qChgt/UNx95hz0d3sdy2uIJkXxBqrhEEemSLwlEGlEV+WQ3xV3aGhg2GYqaT3NWQdunbwcc40oIlB71vLFFY7nzzRcssJNTJyEPiP1XGrYKcTIxymtozhazMh/O93YWfx52Gl02Ufog2JZBDjMuYT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drHUrEIs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drHUrEIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2996C4CEE9;
	Fri, 23 May 2025 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990560;
	bh=9SoaVeXOrVydbuPq1K22nEmDYqKFXWQrFUdTaVSVQbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drHUrEIsQLTkJQQ82Box+uV+7cjOn/mvP0dwnFRQ1MRoToklmBKfblIkeLNK0BqB+
	 OGuXZu5wpEY1VPP8How8Lwc+L9+cVRCbUEjqflLbZgvkkeSyJ/iGNrk/kUhyYgeWuh
	 mCudayXFKQaBn5AAGW9dhuOJh6fJmd30U5kLmDohNkukKFKZOIHngKmVPeypuPP4VK
	 prHa294fR5OUivCp2KwQdbWb4Fa+BNJaOLvEqKl8MYC5DjxKlz1FWh9k6e4nwejbBq
	 7F93eewYzQ0O96VKnLiMvaExluFuZOZjtc1yGd/twnl9J9nBk72pWMcvHQJ/exhFly
	 6s/Y5u6Y/s/JQ==
Date: Fri, 23 May 2025 10:55:56 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aDA4HIOL-g37cvpy@cassiopeiae>
References: <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
 <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
 <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
 <DA3ENUO97I6D.234AA7I97AV62@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA3ENUO97I6D.234AA7I97AV62@kernel.org>

On Fri, May 23, 2025 at 10:42:58AM +0200, Benno Lossin wrote:
> On Fri May 23, 2025 at 2:13 AM CEST, Marcelo Moreira wrote:
> > 3. Clarified revoke_internal for SYNC = false and swap correction
> > Proposed Documentation:
> >  if self.is_available.swap(false, Ordering::Relaxed) {
> >  if SYNC {
> >                 // SAFETY: Just an FFI call, there are no further requirements.
> >                 unsafe { bindings::synchronize_rcu() };
> 
> @Boqun: is this true?
> 
> If the answer is yes, then we should add this as a safe function in the
> rcu module.

I think it's a case for Klint, since synchronize_rcu() must not be called from
atomic context, since it may block. Otherwise, there shouldn't be any additional
requirements.

> >  }  else {
> >        // This branch for `revoke_nosync` requires the caller to prove
> > that `data`
> >        // can be dropped immediately without waiting for any RCU grace period.
> 
> I'm not sure that having a single function that does the revocation, but
> has this going on is a good idea. The safety requirements will be pretty
> complex.
> 
> @Danilo what do you think of inlining this function?

Sure, if it makes documentation significantly easier, which seems to be the
case, then it's probably worth.

> > 4. Documented RevocableGuard<'_, T> Invariants and PhantomData Adjustment
> > Proposed Documentation:
> > /// # Invariants
> > ///
> > /// - The RCU read-side lock is held for the lifetime of this guard.
> > /// - `data_ref` points to valid data for the lifetime of this guard.
> > pub struct RevocableGuard<'a, T> {
> >     data_ref: *const T,
> >     _rcu_guard: rcu::Guard,
> >     _p: PhantomData<&'a T>,
> > }
> 
> I think we can change this type to:
> 
>     pub struct RevocableGuard<'a, T> {
>         data: &'a T,
>         _rcu_guard: rcu::Guard,
>     }
> 
> And then we don't need any invariants :)

Agreed, let's make this change in a separate patch please.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F15268FC8
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654655; cv=none; b=qZmF0NMePxrqTo49pJRUq/Nz/6RvoBrbkDjQBUyr5FyNwWqjIyseOvN6lB8OmGuwaBwMHCk60NuHRkQtnCCVwhxAZaydMC2m9qRzEg7Tc9TLzx/OxzYj0pbRA9URN8Uqdq9z9TAre/qE6MLbI97CNPW4v5VCy8QAuMd3kt3RJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654655; c=relaxed/simple;
	bh=aa1VISchFVQGEEO+PHHT8+XHayl0PsAfOAIwoXJWS4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkrA/EZZZFIwFa47QJV5enuhpUU4wjBxjZaxHjQXVUxrbAU5d8LdSC9HEH/6luEzLFp+vCg6IHxBYbhqIIYq9QvAb7/L9Rd/zGHprOT6bKUu9lwGt3TEKNCpmX/p3ITdvom/XuGlGjA2oHb/wyogCul6WCDqe9OL2Rm2AUybi6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n634viO+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n634viO+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297BFC4CEE4;
	Mon, 19 May 2025 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747654654;
	bh=aa1VISchFVQGEEO+PHHT8+XHayl0PsAfOAIwoXJWS4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n634viO+7JvWOh6EFJUsdVpx+RXJwH4tY+jmEO7DDU9v30L4JOw3W6K8f0CbBo/4/
	 MTy4AdO66xs3r+GoNGv1U6nOj8BiyBpRmjdgFf7OuANPDwvPK+MR2AqTHur8dR7hq3
	 tXwbA1B3WdkwAu16ccaQGnyhosp2NW8eSGuVr57ISJp/Nq4BnJbHV7RYBrEfhHpFOS
	 /enpGrLBd2oUClAgNbQNAYAHl2aMj1h8GR+cx+C5TdPKtcEwl8tX9dq5XuYByv9Hdt
	 4lBcs/X7SMHr0fEZ7PJLgtd8G4g4ndh3VM6JS99yRHrMtvZhWldFyt1X7rkUffNCdX
	 astR9wyZkxUSw==
Date: Mon, 19 May 2025 13:37:30 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aCsX-k0K_jqLvD4e@pollux>
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
 <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
 <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>

On Mon, May 19, 2025 at 01:10:32PM +0200, Benno Lossin wrote:
> On Mon May 19, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
> > On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
> > Why not? Please show me a case where `is_available` is false, but I can still
> > technically access data (without violating a safety requirement).
> 
>     let r: Arc<Revocable<i32>> = ...;
>     let guard = r.try_access().unwrap(); // nobody else is holding a reference, so this can't fail
> 
>     let r2 = r.clone();
> 
>     // I know we don't have threads, but I don't want to have to look up
>     // how to use the workqueue or something else...
>     thread::spawn(move || {
>         r2.revoke();
>     });
> 
>     for _ in 0..10_000_000 {
>         // do some non-sleeping work that takes a while
>     }
> 
>     // now the thread above has executed `self.is_available.swap(false, Ordering::Relaxed)`
>     // in `revoke_internal` and is waiting for the `synchronize_rcu` call to return.
>     // but we can still access `guard`:
> 
>     pr_info!("{}", &*guard);

Which is perfectly correct, you're right. I think I was too focused on the
optimization case. :-)

> > However, this invariant does not need to be fulfilled for access() and
> 
> Where is `access()` defined?

https://gitlab.freedesktop.org/drm/nova/-/commit/46f91addfabbd4109fb64876a032ae4a4a924919

> > revoke_nosync(), because it would circumvent their purpose, i.e. cases where an
> > abstraction can prove that there can't be a concurrent user of the data or a
> > concurrent user revoking the data respectively.
> 
> Yes. How about something like "`data` is valid while `is_available` is
> true. It also is valid if the RCU read-side lock is being held and it
> was taken while `is_available` was true."?
> 
> That should also cover the "nobody else is accessing this" case.

Sounds good to me!

> > An example of revoke_nosync() is the original Devres implementation [1].
> > However, this was re-worked with [2] to use a different logic that doesn't need
> > revoke_nosync() anymore.
> >
> > Actually, "doesn't need revoke_nosync()" isn't exactly true. We would still
> > benefit from revoke_nosync(), but the implementation in [2] triggers the devres
> > C callback from drop() and the devres C callback calls revoke().
> >
> > If we'd had a way to know that the devres C callback has been triggered due
> > drop(), we could use revoke_nosync() in this case as an optimization.
> 
> Yeah that sounds like a plausible option. Given that, I think the
> following kind of function could be useful on `Revocable`: a safe
> `revoke_` function that takes `&mut self` and thus doesn't need to use
> RCU (since we have a unique mutable reference, only we have access).
> 
> Do you have any other uses of `revoke_nosync` that do not have
> (potential) access to `&mut Revocable`?

I could imagine abstractions that use Revocable with some external lock
protecting the data for instance. But this could probably be solved otherwise
with LockedBy.

> > [1] commit 76c01ded724b ("rust: add devres abstraction")
> > [2] commit 8ff656643d30 ("rust: devres: remove action in `Devres::drop`")

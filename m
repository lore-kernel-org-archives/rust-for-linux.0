Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E38272E6E
	for <rust-for-linux@vger.kernel.org>; Fri,  9 May 2025 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785412; cv=none; b=buH4p8H7AyvlBfMaPSosCauDeLyswu0OJrMezsP5ICR2mluQfN31/njSPiZOZbCEjU4RcXjq+ETIdzd4DwsBHGbnVT/mJHggPZoTYtLAbPOPDAXwVpIQ8UGg7yhS1l82zrPP41c33qr7UYvQ0QFHJsiia4aZQr4uh3Ov6A6BCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785412; c=relaxed/simple;
	bh=Cg1PerX+80u2a4rjEfgGAe2MBEjSVrQf20bM2PnE1cM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=NdPR+QfTIZbmeEzZNgTQCReZeIr2wfP7PwiVMzMG6N097hXi6sEucGHr1QZ8yQ2+pfEpU8n/JHEKyGaPCgyv7LkWC8YN7dYME/P/4jagU4OZZQjylpdKctJLQLf0nSPoNejb0G94hwunsOS8y6+gUu4+m7NTkIoJEEgdEBue5KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLLKr8hc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLLKr8hc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC6EC4CEE4;
	Fri,  9 May 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746785412;
	bh=Cg1PerX+80u2a4rjEfgGAe2MBEjSVrQf20bM2PnE1cM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jLLKr8hckIVPDNLpwN4VUAR1/AUVYQYlndtUjfeYrZZxaWF6BP5+5FD6V/LtyPL/p
	 vf6B0ovD8N+Uu8oVeBZ9vfTTDhd0NRuii/7sZ1pOFcyzSybu0kLRL59focHzOT3bld
	 kmTEDxXso+GYvT090G2DEoHF3cDLd0U2at1+0cU0qBxXJp7iC04/QWnyFW/D2aJl4E
	 5i8PaEjUMZbKaqTOwzSYlFyfl9Vim4d1WYSXoC1Mp2ehTOE9ifb/lJbJELjo/HbiDA
	 qBVBFibWq8pfUnmwQfGtkjVwqm8PcNYlzTzXDMkc4KdikqHRy7yqDlLM5SI2TC7ezW
	 FfBBXhm3gvu0Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 May 2025 12:10:08 +0200
Message-Id: <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250503145307.68063-1-marcelomoreira1905@gmail.com>

On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
> The Revocable type in rust/kernel/revocable.rs lacked a comprehensive
> documentation of its safety invariants, specifically regarding the
> validity of the wrapped data and the necessity of holding the RCU
> read-side lock for access. This patch addresses this by:
>
> - Adding an '# Invariants' section to the documentation of `Revocable<T>`
>   clarifying that `data` is valid if and only if `is_available` is true,
>   and that access to `data` requires holding the RCU read-side lock.
> - Adding '// INVARIANT:' comments in `try_access` and `try_access_with_gu=
ard`
>   to explicitly refer to these invariants before accessing the underlying=
 data.
> - Adding an '# Invariants' section to the documentation of `RevocableGuar=
d<'_, T>`
>   documenting that the RCU read-side lock is held for the lifetime of the=
 guard
>   and that `data_ref` points to valid data during this time.
> - Updating the safety comment in the `Deref` implementation of `Revocable=
Guard`
>   to explicitly mention the relevant invariants.
>
> Changes in v2:

The changelog should not be part of the commit message, instead place it
below the `---`, but before any file diff. It then will only appear in
the email and not the commit message.

Another thing: could you please CC Danilo Krummrich the next time you
send this patch? I think he should also take a look at this.

>
> - Refined the wording of the invariants in `Revocable<T>` to be more dire=
ct
>   and address feedback regarding the phrase 'must occur'.
> - Added '// INVARIANT:' comments in `try_access` and `try_access_with_gua=
rd`
>   as suggested by reviewers.
> - Added the missing invariant for `RevocableGuard<'_, T>` regarding the
>   validity of `data_ref`.
> - Updated the safety comment in the `Deref` implementation of `RevocableG=
uard`
>   to refer to the new invariant.
>
> Reported-by: Benno Lossin <benno.lossin@proton.me>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---

^^ right here would be the place for the changelog.

>  rust/kernel/revocable.rs | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)

It seems to me that you sent this patch on top of your previous one [1].
Normally, one doesn't do that and instead sends the patch based on a tag
(like `v6.15-rc4`) or the subsystems `-next` branch (so in our case
`rust-next`). So a new version should not rely on any previous one.

[1]: https://lore.kernel.org/all/20250501005726.744027-1-marcelomoreira1905=
@gmail.com

> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 2da3e9460c07..7ef2f34782b4 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -64,12 +64,11 @@
>  ///
>  /// # Invariants
>  ///
> -/// - The wrapped object `data` is valid if and only if `is_available` i=
s `true`.
> -/// - Access to `data` must occur only while holding the RCU read-side l=
ock (e.g., via
> -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`])=
.
> -/// - Once `is_available` is set to `false`, further access to `data` is=
 disallowed,
> -///   and the object is dropped either after an RCU grace period (in [`r=
evoke`]),
> -///   or immediately (in [`revoke_nosync`]).
> +/// - `data` is valid if and only if `is_available` is true.
> +/// - Access to `data` requires holding the RCU read-side lock.

I'm not sure what the correct wording here should be. The current
wording makes the `revoke_internal` function illegal, as it doesn't hold
the read-side lock, but still accesses `data`.

Maybe @Danilo can help here, but as I understand it, the value in `data`
is valid for as long as the rcu read-side lock is held *and* if
`is_available` was true at some point while holding the lock.

> +/// - Once is_available is set to false, further access to data is disal=
lowed,
> +///   and the object is dropped either after an RCU grace period (in [re=
voke]),
> +///   or immediately (in [revoke_nosync]).

Several missing `

>  #[pin_data(PinnedDrop)]
>  pub struct Revocable<T> {
>      is_available: AtomicBool,
> @@ -106,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Sel=
f> {
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
>          if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> +            // INVARIANT: Since `self.is_available` is true, `self.data`=
 is valid. The
> +            // RCU read-side lock held by `guard` ensures that `self.dat=
a` remains valid for
> +            // the lifetime of the guard.
>              Some(RevocableGuard::new(self.data.get(), guard))
>          } else {
>              None
> @@ -124,8 +124,10 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_=
, T>> {
>      /// object.
>      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -=
> Option<&'a T> {
>          if self.is_available.load(Ordering::Relaxed) {
> -            // SAFETY: Since `self.is_available` is true, data is initia=
lised and has to remain
> -            // valid because the RCU read side lock prevents it from bei=
ng dropped.
> +            // SAFETY:

Empty SAFETY comment?

> +            // INVARIANT: Since `self.is_available` is true, `self.data`=
 is valid. The
> +            // RCU read-side lock held by `_guard` ensures that `self.da=
ta` remains valid for
> +            // the lifetime of the returned reference.
>              Some(unsafe { &*self.data.get() })
>          } else {
>              None
> @@ -200,7 +202,8 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// # Invariants
>  ///
> -/// The RCU read-side lock is held while the guard is alive.
> +/// The RCU read-side lock is held for the lifetime of this guard.
> +/// `data_ref` points to valid data for the lifetime of this guard.

Please use a bullet point list.

---
Cheers,
Benno

>  pub struct RevocableGuard<'a, T> {
>      data_ref: *const T,
>      _rcu_guard: rcu::Guard,
> @@ -221,8 +224,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>      type Target =3D T;
> =20
>      fn deref(&self) -> &Self::Target {
> -        // SAFETY: By the type invariants, we hold the rcu read-side loc=
k, so the object is
> -        // guaranteed to remain valid.
> +        // SAFETY: By the invariant of `Revocable`, `self.data_ref` is v=
alid because the
> +        // RCU read-side lock is held for the lifetime of this guard.
>          unsafe { &*self.data_ref }
>      }
>  }


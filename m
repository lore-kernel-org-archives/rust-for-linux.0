Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349523EA8B
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 20:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307386; cv=none; b=ThfR6S4Xk+FMZvF+6mRY6r3IoK7DEf751iYVoyuUnhIpEgqf7Wd12Dz5d3xhDJJtrZvuVjnJoTzlqKyqG+t091z1undyYwHf4uB57Fon44Plve+zhFShnIGch0FMCH9q3WREL8Pz/BbraRRxkYlZKseAJUIsU8OVpHgr5BoTikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307386; c=relaxed/simple;
	bh=FIs5/rjNjcmbGOHIPEouyXKjCNT0AhtnNoMewkq7HBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSOdmpge8xUDJgWXdrgW1btOyyiw3k5lUXyWb9kNi9QFv5Vt7+db7dsNy2Z48xShAtSEc80bJAx6njeVFZKeZ93zjLROIaCpn2Gc6Cq95HXD7Blc6Np2pcIfxA17fKdNM6xP7HjCztOEzWu6wNahaKXaE9pqzLYFZR2zvmaSp58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9OG/bj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9OG/bj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AE31F000E9;
	Sun,  9 Aug 2026 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307385;
	bh=ZrnrWK2sh3kxoSNDWTv+YiqCJ357Bfg0zyjzQjODgtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9OG/bj6Hw4ipWq24Neb7ba1mBF9fBbyLzaIYlrkSyDMKJxXcWDLDVLGDHQhAsjjD
	 X1JObw4e9vPNfPgK58QLOIwD9+Jqm7wSvlnrT0cAfZ9ed5icSdpjo8QdpxKi9T8oUU
	 uQmUAXfkN7plhDjhzADSPDnyrUQczj28AbP35q/lKwtIF3cUsPxB/BbwfVQztF8W8/
	 JFzDa+g9eev8C6TBf7rCwOW7NbFv3LZ7WIW+y+JNcb4qEwct/BMG1IlWX1/xwz77Dk
	 ZN1GbxwNXhHTouFUXFIfFquhBfam/Qt8oChLxO77Tsd2h0NOoHi3RCujvFWbE2cLR3
	 oAWH1wEYm9VKA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C7768F40066;
	Sun,  9 Aug 2026 16:29:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 09 Aug 2026 16:29:43 -0400
X-ME-Sender: <xms:N-N4aiqeshGEIO9GySvP4fiEwh1y5lrqqiVI8tR_mTAD5QKUWImEEQ>
    <xme:N-N4aqBfRQ87n_wQY1LkFqcKL0yF5XScISwTo6WSR7_bqzwtPqI56FGyd-ETsiWEI
    4RLJFQiJ4WwRSWZwQj6He2yMNrf8J0ROuIC0TWaASfL7rwrk8NA>
X-ME-Received: <xmr:N-N4avu08otzmN0qwE-TLM8eP0mCLaTWbiUh8omUUmJ1uROFpP7UUTY1GgHu2qnNcb5DOqkyaVDBSoKRaYOLe5dXK6FUXqK3>
X-ME-Proxy-Cause: dmFkZTEr1yu5qXK2KCH600ySazCbmYlz9hoXToKppI0FC4JHXgaBkNfDfO0Rsc81gzqd/y
    ZcC0R+kBhyttk6sSZmvEJzojohlYuJzV5O2p/JA/Ep8SNP8864ZnEXA3XW4veMtZuo/ehf
    ByhxYeVV400edHnfudw6iH5mGpNfFQJPP4G3AtTECNFGaTM0WBnobrgBk/FEnH+ZDUOSgg
    Ef4RaYaPrkONS6/CrE2d3r5K+FlNibBD+Pl1+IVDewuuqoewsPWuy05YQ1Xb/r4GgWnuv/
    7+vlDMf4J/2WQTfvrbV9OiD4Ge0tDxGr+JycuZX0ZRezAEv+Hi2JA9xoWDj0KpM618OYpT
    7Hyj7h5vzlosjkDaHOOCG0ZqpULYFuK1zLmMLWze5FqdWVo5zRtDyljf95hPgoQ5b+kgK5
    ZcO83ug/lmMC4V4UFOgim+ExUO+xKo/Ojfxh+TYD93wOvqsCSvSzvOEbBlBmAiUgQvM0S1
    +WMFpfldSYEKoJnwMC9ZHiqtR+hwCW1UfVgpNGi1Vo+4eExC3ZxclnooXgYEYeVh+20QxB
    Hw7ok0JygD7j2slrXSwb59aSpQq+kY/NK79mWwhTo718UVYg/revfnfXKv4bUk7g49cyz5
    7erTHqYWM/ZP5LUSTLy1SEKG0EilVCa+DjVmaLs6XZLEL3HHlNJSjuiLB6TQ
X-ME-Proxy: <xmx:N-N4ahYPjWIdxScNOVJoFX2ifYlbPHNiEDB9GWsuxRVEaeWnnxtq5w>
    <xmx:N-N4ajE2kow0uMfa0mRWu5NeKgbc6cjdBeeDk_sJalKosLalJCEpcA>
    <xmx:N-N4asrinlfvfYr-5z615XQSmO8IQO3SFBNZeA_7bexIKga9Dh5faA>
    <xmx:N-N4amyulQYNiuPPjjnXs0uV4Ec6IoNIjNLF_iD2v1_N3BlA8DaQQw>
    <xmx:N-N4auMKRQVhxar59fvJWt3dlD98qKdhMFaWkoNeQNC9ioqV9ab7pRGR>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Aug 2026 16:29:43 -0400 (EDT)
Date: Sun, 9 Aug 2026 13:29:42 -0700
From: Boqun Feng <boqun@kernel.org>
To: Harish C S <harish.cs.ss24@gmail.com>
Cc: ojeda@kernel.org, gary@garyguo.net, aliceryhl@google.com,
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org,
	acourbot@nvidia.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: improve `Arc` documentation links
Message-ID: <anjjNlRqHgDpnJjV@tardis.local>
References: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
 <20260711144721.39185-1-harish.cs.ss24@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711144721.39185-1-harish.cs.ss24@gmail.com>

On Sat, Jul 11, 2026 at 08:17:21PM +0530, Harish C S wrote:
> The `Arc` documentation has a few mentions that do not follow the
> surrounding style: a plain `Arc` without an intra-doc link and a
> lower-case "arc".
> 
> Use intra-doc links for rustdoc references to `Arc` and spell internal
> comments consistently as `Arc`, matching nearby docs.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1240
> Signed-off-by: Harish C S <harish.cs.ss24@gmail.com>

Thanks!

Acked-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> ---
> Changes in v2:
> - Use full name in the patch author and Signed-off-by trailer.
> 
>  rust/kernel/sync/arc.rs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 5ac4961b7cd2..76a153e01283 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -154,7 +154,7 @@ impl<T: ?Sized> ArcInner<T> {
>      ///
>      /// # Safety
>      ///
> -    /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the `Arc` must
> +    /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the [`Arc`] must
>      /// not yet have been destroyed.
>      unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
>          let refcount_layout = Layout::new::<Refcount>();
> @@ -253,7 +253,7 @@ unsafe fn from_inner(inner: NonNull<ArcInner<T>>) -> Self {
>  
>      /// Convert the [`Arc`] into a raw pointer.
>      ///
> -    /// The raw pointer has ownership of the refcount that this Arc object owned.
> +    /// The raw pointer has ownership of the refcount that this [`Arc`] object owned.
>      pub fn into_raw(self) -> *const T {
>          let ptr = self.ptr.as_ptr();
>          core::mem::forget(self);
> @@ -261,7 +261,7 @@ pub fn into_raw(self) -> *const T {
>          unsafe { core::ptr::addr_of!((*ptr).data) }
>      }
>  
> -    /// Return a raw pointer to the data in this arc.
> +    /// Return a raw pointer to the data in this [`Arc`].
>      pub fn as_ptr(this: &Self) -> *const T {
>          let ptr = this.ptr.as_ptr();
>  
> @@ -305,7 +305,7 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
>  
>      /// Converts this [`Arc`] into a [`UniqueArc`], or destroys it if it is not unique.
>      ///
> -    /// When this destroys the `Arc`, it does so while properly avoiding races. This means that
> +    /// When this destroys the [`Arc`], it does so while properly avoiding races. This means that
>      /// this method will never call the destructor of the value.
>      ///
>      /// # Examples
> @@ -345,11 +345,11 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
>  
>          // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
>          // return without further touching the `Arc`. If the refcount reaches zero, then there are
> -        // no other arcs, and we can create a `UniqueArc`.
> +        // no other `Arc`s, and we can create a `UniqueArc`.
>          if refcount.dec_and_test() {
>              refcount.set(1);
>  
> -            // INVARIANT: We own the only refcount to this arc, so we may create a `UniqueArc`. We
> +            // INVARIANT: We own the only refcount to this `Arc`, so we may create a `UniqueArc`. We
>              // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
>              // their values.
>              Some(Pin::from(UniqueArc {
> -- 
> 2.50.1 (Apple Git-155)

Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489A2F656A;
	Sat,  6 Dec 2025 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028798; cv=none; b=TCG4Qc4emvp7qYwfdcc8oTubm7QeixdVGv8AnFs00IPQMXf9NlqgXbj6TrDL+72LQ1CXIo7V3Qgak3OGVYlriI44I9ww3JSrU+rdlbw0uHgMULS8TH5+xDWT4qUpTNVDyUVzKlXdMRQR5kQlzAbDJKMBza5HRt2AhDj2sw+1MeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028798; c=relaxed/simple;
	bh=P9l+s4BeKIPswuOwOmZ8c/CKAkxXrs9ABxvVdfhwr1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJdvqr4OlVsPgLwLBKWM5O55bXrPxHYQG4Cs+al9Ac+iiktzuuR339/ltYF2ZLbtr7jfPVs1nkLixKp2bHyblp4KmcQHFqEvCGipef2Wul8t9YSpRK9ElZnPA5duc8Jydy5zX1m0w5IY/pHseKzFsaEd/ZUNdX9ePy5+njWNHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=SmEphrvg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LXW5bzIX; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="SmEphrvg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LXW5bzIX"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EC9187A0083;
	Sat,  6 Dec 2025 08:46:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 06 Dec 2025 08:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765028794; x=1765115194; bh=4oCR8QuC/k
	bl5GjCWF6w7wf5pC9iRc8I5CDDR7QSefA=; b=SmEphrvgOGCaKt5HCtMUrP00nR
	PaM0g7VDfIDZfmkFFdgi+F0whXrhjpOVqC8LB4mGWjs9/dlZBrPY6ku1Gu25itdV
	fn/VFcp+tlO28xU2PxBg0Fj82KOH4/uCvPNg6Umjt8zqcoP+8MoxEUCkN/ii87U/
	pJJXYcQNUavoscMaP/VeIPMhRj4rdBIFD8xe8NfsP/pBEko51IDBwKHBzZ7abk4m
	/cgyEJW7sOfhh7eXU0953mcBHqs83MZIPPsAylWYNUSFxGF23mcVJ0GII7jBBouh
	gq6H6logf4hlzhv9jQHLBPgxumsOCRjvr62F211rfd6oy8jLOsvdngIxgJeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765028794; x=1765115194; bh=4oCR8QuC/kbl5GjCWF6w7wf5pC9iRc8I5CD
	DR7QSefA=; b=LXW5bzIXkF/rzQJYiG9LSqlH3VCzd5+fD7P3P5u8B9+UzfoiO0V
	ZbzvLMGwhqQ715eO06t9AAg4+WlycGyJ5ccFGg4Jt+rYDhJi59chysTNdreEL/oF
	Re7cpTUn0mwjy1+KculXtaUgeMaHh+vbme4tMnjQids458ju7qwfyvLMN+txsXop
	Hf+/+9OCrE87rStDuIlkpa9D8uf2NZM7oKGQU9fQIdBEsM0LanAMgwkXuG2EQcxd
	CvM1eSx3Bq23R0V6OPyXWoWDpwYbr+Yt99v6oJfnmK3TM+efRPprYzFCA06t6etT
	IYHpxWaBr5hpBgDIx86Q1v15t5umLfBP0kw==
X-ME-Sender: <xms:uTM0afF4PO54fFr2HUg_A_1p8eaCCgTejw9fURjzxyc8quJrz2Mt_g>
    <xme:uTM0aRP45EKLX5RZXtCa0u9FY4y7_I1ppWwAV1W_aHTSzj7Bl2mHWAyn5LejeBhjz
    MSDed4mHO-RQs0SciK2wJQHiQosw0WM7kZgfHB-yOBiyfOuNEUGZVs>
X-ME-Received: <xmr:uTM0aevCDrYK_0tNOFyPijnoVxwOAN-tO-9OJ_JFOCWXvrdlbKzWXYtxO9vhZr3nD_Gu_KKBopWambbPs-NSdy7l-ryqrsyRb2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduuddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlh
    eslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlh
    hitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghnihgvlhdrrghl
    mhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurghkrheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprh
    gtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
X-ME-Proxy: <xmx:uTM0afLvrk7c6a7QlQHcVA5UKqpWW_xZaHR4frBnfiXekHFAvroK3Q>
    <xmx:uTM0aUfvb1dMAyFXl7D3Wnzap7SkuT1tLVQVK4E9U1pk8mihC1BM4w>
    <xmx:uTM0aaLyQMF4akamENeQQJfWbXYn7RA2lrfC9sJCH0AEXb6HbkE0ZQ>
    <xmx:uTM0aeAauhTn4ZNFc5qJtmAGtB3bqTDl4YhO9fynvYKWqbsdzdd2Qw>
    <xmx:ujM0aRLEcK_kjPJ7ddX1XLpVZ4ViE_nJoeI61bVSZuGnlP425PklA291>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Dec 2025 08:46:33 -0500 (EST)
Date: Sat, 6 Dec 2025 14:46:32 +0100
From: Janne Grunau <j@jannau.net>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	"open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 4/8] rust: gem: Introduce DriverObject::Args
Message-ID: <20251206134632.GB1097212@robin.jannau.net>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202220924.520644-5-lyude@redhat.com>

On Tue, Dec 02, 2025 at 05:03:30PM -0500, Lyude Paul wrote:
> This is an associated type that may be used in order to specify a data-type
> to pass to gem objects when construction them, allowing for drivers to more
> easily initialize their private-data for gem objects.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
> ---
> V3:
> * s/BaseDriverObject/DriverObject/
> V4:
> * Fix leftover reference to BaseObjectDriver in rustdoc for
>   DriverObject::Args
> V6:
> * Fix build errors in Tyr
> 
>  drivers/gpu/drm/nova/gem.rs |  5 +++--
>  drivers/gpu/drm/tyr/gem.rs  |  3 ++-
>  rust/kernel/drm/gem/mod.rs  | 13 ++++++++++---
>  3 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450b..173077eeb2def 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -18,8 +18,9 @@ pub(crate) struct NovaObject {}
>  
>  impl gem::DriverObject for NovaObject {
>      type Driver = NovaDriver;
> +    type Args = ();
>  
> -    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
> +    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> impl PinInit<Self, Error> {
>          try_pin_init!(NovaObject {})
>      }
>  }
> @@ -33,7 +34,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self
>              return Err(EINVAL);
>          }
>  
> -        gem::Object::new(dev, aligned_size)
> +        gem::Object::new(dev, aligned_size, ())
>      }
>  
>      /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 1273bf89dbd5d..bb5e7871efa94 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -11,8 +11,9 @@ pub(crate) struct TyrObject {}
>  
>  impl gem::DriverObject for TyrObject {
>      type Driver = TyrDriver;
> +    type Args = ();
>  
> -    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
> +    fn new(_dev: &TyrDevice, _size: usize, _args: ()) -> impl PinInit<Self, Error> {

nit: should the type for _args be Self::Args for consistency?

>          try_pin_init!(TyrObject {})
>      }
>  }
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index ec3c1b1775196..4bcaee2d4b308 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -64,8 +64,15 @@ pub trait DriverObject: Sync + Send + Sized {
>      /// Parent `Driver` for this object.
>      type Driver: drm::Driver;
>  
> +    /// The data type to use for passing arguments to [`DriverObject::new`].
> +    type Args;
> +
>      /// Create a new driver data object for a GEM object of a given size.
> -    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
> +    fn new(
> +        dev: &drm::Device<Self::Driver>,
> +        size: usize,
> +        args: Self::Args,
> +    ) -> impl PinInit<Self, Error>;
>  
>      /// Open a new handle to an existing object, associated with a File.
>      fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
> @@ -244,11 +251,11 @@ impl<T: DriverObject> Object<T> {
>      };
>  
>      /// Create a new GEM object.
> -    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
> +    pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: T::Args) -> Result<ARef<Self>> {
>          let obj: Pin<KBox<Self>> = KBox::pin_init(
>              try_pin_init!(Self {
>                  obj: Opaque::new(bindings::drm_gem_object::default()),
> -                data <- T::new(dev, size),
> +                data <- T::new(dev, size, args),
>              }),
>              GFP_KERNEL,
>          )?;
> -- 
> 2.52.0

Reviewed-by: Janne Grunau <j@jananu.net>

Janne

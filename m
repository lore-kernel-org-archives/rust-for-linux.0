Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B971E3DFC;
	Mon, 20 Jan 2025 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393892; cv=none; b=sr0PwzFDK+ttUGN8Sx3n8y8whyGIfRMnoGg7AHZH3iCJ63IfPFLYZR1MyrCNBa2Gg1oYLGIaeiUb9npYhQVGRgsMEEid93+dug9xVgf6dmYdAtYbumEjB4AjbHkFQO6S6A1DDjLXtuabWdTMLiTGIJ01jUGDwe/GsWopjBIkPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393892; c=relaxed/simple;
	bh=whkAGLLY2zsgHaCaIXhdFFqTQG8hm2kbm9oMuCjXpZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqh5B8TTgD90UAIK7IldhCXlGqXIkMwRZjpWlShrr7EHZlx5LgnU+ELk+BkZBv3FsCzMUtELFLtgxJ5Bwcno/1bWDB1cR1Wtbqz+od6ewOrJa3APaaM0vK0WjUD2JFDqhdRy8akD8T2UbNry2rQMxv2rbrL7ujbPfJsuKARyB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXQLwm/z; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXQLwm/z"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7be6fdeee35so68401085a.1;
        Mon, 20 Jan 2025 09:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737393890; x=1737998690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn+39XZ3B605S599JymoaGJ0plX6xxseRRjgcam9dyQ=;
        b=IXQLwm/zKSwezEsBAVAGZaniw/SrQqPTlQ2hikHgtKwFHFUtGsv5WbqlFSKGj7tP8V
         RVOxyGVM+7k3BUyujZdjTczRzYwtyyuPURGA91djdSZWkQPyvQWMUq0voc7T23dHlvn5
         43yjJT088SDNf7NRkTVNQjleI3FB1VYW1xPr0lq+G6mhBYHiV5cYSHzIDkHne0yOlCEw
         tqO48bzlLkigRLJK65PojwDqscEnDZaIndWViaBtyJzZ1OZye5rTrmOKZlyh9tKwTEwN
         DXqL1vL+rlQkXmEdbB2IJvtI9H2GHZflODuLLYjAhhl5fB6pP9i+iifgQbf7xfgRCkkB
         ztIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393890; x=1737998690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn+39XZ3B605S599JymoaGJ0plX6xxseRRjgcam9dyQ=;
        b=gyUvfxjex724lvs06FLqC/PGPq97JhJHv+awntbel8vF95wkiZicaqruBFqzJ0yhRn
         fEA/JpTxdSwiD9DCkE7pH0RZs/jaDkrG7fz6PWSczXqNLgN08rUxDyUg3R4M07f2kWIg
         lf31XWrdESVFnszQhypxKByhXpT5at+1uWybuO64fFGIba2jFBfwbxBjWtKds13b61d9
         Iw+WZ0tI6cj6awGV0ja64sgLNhNRrThg+j0F5pdQVdFOmXaKIhr32L+/cDJtUy0NHZgl
         Fv93N73JJX81qrgsZvEXAV5sH+fMa+Hsb/p0O9TbVgwDT6BErH+BPLOl+N5+OiOY6RZS
         sO+A==
X-Forwarded-Encrypted: i=1; AJvYcCWgHPitE4yas2mlEYFDIOMJp6I5wfzGvKWbUAXFWkdcVquGOmBm1LTP5IFtrm/cP+FRR3KGGZSHM5TASt8/fbs=@vger.kernel.org, AJvYcCXb9bR2UemG9oHiYwCkG3HQuuXnNVhMdYjNnnpPTWeHia4yfiVL9M0CE1l/RtJB9knHsoSMTU1d3z+U514=@vger.kernel.org
X-Gm-Message-State: AOJu0YylTwA3FpoiFc3VYuzDK0Hc6aoKaWcg67kaergtLkn9LkOmfq4b
	a5R1BkXKxbraTYQZMw4BrUZPC+yX3QOwurFkQaWskOY6w+aOYzuV
X-Gm-Gg: ASbGncv/gLkDjPe/IEaWY/EZpp1BILO0gu9HJFYFPrKUyRnDjyhUiztAIez4eXJ5i11
	M0u2i8jNdvJ9RIHbiEFn93D7806HODl6xUUk8ko1oHvSn8YnkxYA0FH9Ff2m2AkESmIOJRb49Bf
	BJtUgaHWFjWpTMUQxpQe5TaySLPlK0z4zbeVB3aFdBXPsP0Ox5Iw/DJdwyhLl4UBTcjV+FasXKw
	Cg/cxvxkL6Up46nNeihShOZdhta0hQDb7nbyciWu6kiNdeq5BCU24g8BwznW2nN8jZE+Kn4fmTc
	J8s2Iwgblb8S+lqfBr4yeE5jD5dMCVrLDoHlXI85FUff7qpmOapnDvksnh97
X-Google-Smtp-Source: AGHT+IGm8548vq+JvKjFdT9jzghs4BQpPOm/+RR6mMwR3iONEOBcNa3zmRiGcrUPL2oApOpU4zXtzg==
X-Received: by 2002:a05:620a:2906:b0:7b6:773f:4bd9 with SMTP id af79cd13be357-7be6324fbf7mr2148414085a.42.1737393889622;
        Mon, 20 Jan 2025 09:24:49 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147436dsm467581985a.7.2025.01.20.09.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:24:49 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 73E871200043;
	Mon, 20 Jan 2025 12:24:48 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 20 Jan 2025 12:24:48 -0500
X-ME-Sender: <xms:4IaOZzVu0STxd_xtKxBz99AH7OHFn0HpKnYVEZ9b3peUf9SpErS6FQ>
    <xme:4IaOZ7mmAa0uH6kizRUQbzfg2CyYT9i5hgxfd95pN53YE6sDY_VbXL36CHr__2PB1
    a3ENKFbSafwI5CtxA>
X-ME-Received: <xmr:4IaOZ_aKaj26OTtGa2CXV5apFBgPbawaSNK6CHXpu2Asw8J8xPblDDi5Z8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiledgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhep
    fffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnh
    hguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhn
    peeiuefhgfdulefhvedtteelffehfffgudejvedtudfhueevfedtteeukeeuvdffgfenuc
    ffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrihhonecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmth
    hprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddq
    sghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsg
    gprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhi
    shhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghn
    nhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsoh
    hrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:4IaOZ-Wa4ZJGE4JSHiCgiKc36F-yU0SbIfEBoITV59T0ecc7KMsVEQ>
    <xmx:4IaOZ9l1mNiOeWaj3koq9geYj6H6nscuvpyr34SrdI4isSVAhqdRGQ>
    <xmx:4IaOZ7e_vYVbecUYmWi0Q4nkfa-enkzwFCzZ-ZZuPSXVhNRBxRhKaQ>
    <xmx:4IaOZ3GcWk1kWLYh_pisSfEkYa-lP4p77kClhaDCcfYfzrgwPUSLnQ>
    <xmx:4IaOZ_nu_pbXgIwwySMayeK4lDS4nQeYWBj7VIlEWgT2dz4k3e8yjkCn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jan 2025 12:24:47 -0500 (EST)
Date: Mon, 20 Jan 2025 09:24:30 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/3] rust: add Aliased type
Message-ID: <Z46Gzg_5kv-MwZNL@boqun-archlinux>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>

Hi Christian,

[Cc Daniel and Danilo]

Thanks for the patch!

On Sun, Jan 19, 2025 at 11:11:13PM +0100, Christian Schrefl wrote:
> This type is useful for cases where a value might be shared with C code
> but not interpreted by it.
> In partiquarly this is added to for data that is shared between a Driver
> and a MiscDevice implementation.
> 
> Similar to Opaque but guarantees that the value is initialized and the
> inner value is dropped when Aliased is dropped.
> 
> This was origianally proposed for the IRQ abstractions [0], but also
> useful for other cases where Data may be aliased, but is always valid
> and automatic drop is desired.
> 
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
>  rust/kernel/types.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 3aea6af9a0bca70ee42b4bad2fe31a99750cbf11..5640128c9a9055476a0040033946ba6caa6e7076 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -528,3 +528,43 @@ pub enum Either<L, R> {
>  /// [`NotThreadSafe`]: type@NotThreadSafe
>  #[allow(non_upper_case_globals)]
>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
> +
> +/// Stores a value that may be aliased.
> +///
> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
> +/// Call the Drop implementation of T when dropped.
> +#[repr(transparent)]
> +pub struct Aliased<T> {

As I already mentioned [1], the name `Aliased` is more reflecting the
fact that this wrapper will avoid generating the "noalias" attribute(?)
on the reference/pointer to the type rather than an intuitive idea about
"why or when do I need this". Moreover, I think the argument about the
naming of the counterpart in unstable Rust (UnsafePinned) makes sense to
me [2]: this type alone won't prevent `&mut Aliased` getting `swap`, and
it has to be used with `Pin`.

Therefore, I think we should use a different name, perhaps
`(Always)Shared`, or just use `UnsafePinned`, or, as always, looking
fowards to a better name from anybody ;-)

[1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
[2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming

Regards,
Boqun

> +    value: UnsafeCell<T>,
> +    _pin: PhantomPinned,
> +}
> +
> +impl<T> Aliased<T> {
> +    /// Creates a new `Aliased` value.
> +    pub const fn new(value: T) -> Self {
> +        Self {
> +            value: UnsafeCell::new(value),
> +            _pin: PhantomPinned,
> +        }
> +    }
> +    /// Create an `Aliased` pin-initializer from the given pin-initializer.
> +    pub fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        // SAFETY:
> +        // In case of an error in value the error is returned, otherwise the slot is fully initialized,
> +        // since value is initialized and _pin is a Zero sized type.
> +        // The pin invariants of value are upheld, since no moving occurs.
> +        unsafe { init::pin_init_from_closure(move |slot| value.__pinned_init(Self::raw_get(slot))) }
> +    }
> +    /// Returns a raw pointer to the opaque data.
> +    pub const fn get(&self) -> *mut T {
> +        UnsafeCell::get(&self.value).cast::<T>()
> +    }
> +
> +    /// Gets the value behind `this`.
> +    ///
> +    /// This function is useful to get access to the value without creating intermediate
> +    /// references.
> +    pub const fn raw_get(this: *const Self) -> *mut T {
> +        UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
> +    }
> +}
> 
> -- 
> 2.48.1
> 

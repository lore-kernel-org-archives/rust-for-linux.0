Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F545C70E
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Oct 2026 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299252; cv=pass; b=ltRgXby0D4BUszedDjr4j5tH9+7MekvJRXpnSFWk78IJ79MBKlKshevjv8P9LoULrwwPDj9enWebK4RozVEs9Wcrzy5sIL7/Y6zl9mIeeDvUPTmWVjgkOZyYvfxhyR7m8WYRw/Pbagn2VhB1KaiTXfYZNdkMvcZBHl5nkyyPx4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299252; c=relaxed/simple;
	bh=mvR8e6XwLGU4EOXD7ls+rbR/5w5VBav0d8Qk+350o88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBWaNUY0VI8evI8MvFXGJpcje38yqc1HncA0mKh4h/0XCKuovoHk2vl1Iskd9s4M7HYbGH4QAC9mCqonsV2u/nkLGvHO/0YMN/k5zBEUeNh5vM0fhu9iSsiBOm7WRF5I7txpWY6A+Vk9bxfuY3CuHsb0Xv8cq5hd48jTKT3VGwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIOMtZXN; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIOMtZXN"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8252259f6d2so682403a34.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Oct 2026 08:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299250; cv=none;
        d=google.com; s=arc-20260327;
        b=lZmtF0UPjJFtH33Vvxfbn3Mnaaz4RwjpfKY6Zs5BUqWAHz8UuMRpbTXZ6MGgyfUP7i
         MvrwQ59gBGI2tsez5GsVTLDiIG91Nq55Bs1N5uX6sePz31FzRpv9GDqYn188miNQn3iT
         CsymQLijHbnCd9ItgqTtqnQFapOHAFqQWpBA2Y/1mqRF/61o954F52UMwLNCsJAETC8O
         K9dE+cAOBSdNdNWJPedOx6hPFRarDfz4Y3uO3aH3Y6RDr29H+R+5HjKg37dT/ibXrO3G
         9G68Ez6UDAY8RyN4+Adu4saghyzZfNIG9/kLj7CZMgAX3fCzLzIEm4lxywGTjob1bDJS
         ZTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hunAm3sfdDLBt2CtfN5QW1dy32vmczfmYId9wuMqDN0=;
        fh=0487dADrPQjdYzMtxVOZDFVgkZctKFRoby0oS2wv968=;
        b=VepLVc7VSP4B9k05SHHGAGezLmlo3F5tUg7X5aT9pfpYGcF611i6uDS6Lin3+Qhk6+
         /4yVykr44RORkgarMod51Z4KhOHOycypuND7o3BgaBnSPW2JK1Gl8/+7V66UhK39mn1/
         hLECU4WhhzKhfa+U3MrU3DDx07gTY76y3Ylx45irZ7Y5+9zEKFvD/gpIn2Prsb1m1PpU
         QrjO+NMQpBxmuEbkX28F+9uLTOL8zmoed9dLthqytfjvyqf3nkRnH8eAm8iuep71FH1z
         WzJIWss0w8+DlyBnJm/gcerB5cqAgfGlHfcg85/ErGSxQ/ntA+Q3f/x3e0cSBzz7ii8P
         +1Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299250; x=1791904050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hunAm3sfdDLBt2CtfN5QW1dy32vmczfmYId9wuMqDN0=;
        b=mIOMtZXNM4pVrPd/UT+YaCQnBBua9FMRL33Td9UWmuqz4jG/quOPv8lxNZB/mBb0kc
         V1MP/oTv2jmCKwGxaNpusCNHvbJfK2qnwUJgRubTveetXlBPA1RkF6fiNr6QTcL07Cwt
         fyubf4M19PNewX38Xt89bNFGrWE3F7ToIsJt6VAjL+T58Cw0gT7uOkO3BzcsgjICFKy+
         OMbqWabzzXE8W7hDVah1oYUZMlmoYL2FitvbU4Auu6uRA0f+LWhmBIuZYC+H1NLxjJdq
         KhzfpuXIvhKRRtciwHH/PoNSQj+eHd32rJZ18CO8uu7BXtyUmdnE8jEXuajdhrn9TgNZ
         D5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299250; x=1791904050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hunAm3sfdDLBt2CtfN5QW1dy32vmczfmYId9wuMqDN0=;
        b=x9Ps5qCHT6H8x/dETC8+sgrYsWoDvFYBvIsemjIMRUtQEFI5YJUYeNG+KhQWlbC/w9
         Pp54YSh5cESLXDX29FkWFCL4DpjobxxpcF4mfkxjARHe6F4iygRgGQxtGCsuX0do0uyX
         4swnzOAZ82IaJLMVFzTUrraKxrvgYlJbBooVtPoTsia1dl5X6PJD89jDvD18JHsULYC5
         gRUIdF56JvAwltbszuq/R3OmuWSORPwEwcIxwHOzfAW4VB5v10nZTwOVlvrtFUjfsbb7
         OBKXc7hKXjuGzAoVKwW6IWJLbIP0msIK5OXUJVVQL6lCrLHJbhpGesKd6l6w1/LFp9Lv
         sQoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwux9uz7mCFaAixXILlT3O3BAF/5CAkyOIz8axRIcjM/2mf3c4PP3f17g+JqZv5SswK2BarwMGTG1p3jEApMQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k6s5AY6d4TmMq3qLmaAVO3FXqqPo07pwDWyztqTcxQ3IuukBc6
	FZulAs2fhKVQnF5LH4tXv4dexpPnCDVkVKwsgDbwJQgpl7UvoMbwxH6XKFBSqmn3FDOYk++7Rjc
	wxDPqnNs2x4RT34YA3MhycZuVS8MnTF4=
X-Gm-Gg: AYBFou2CKHr9OZGeAHt1xsiuJAdTFt2TLikH/X2kjrnsCJKTVLWqua7hvWZLXZgnqEh
	U0F51MpsIaoHRpEzID36vP0oz8BcqJgEio77OoXaq0N+yZiZsEV47PoKlEMLjdPblAr4eQEZJiY
	L+Gx3KiyV6vcHlHDyu913/y+Rq7f3pBh4qXQLtWq/shpQKGSLJC7uAYdATzq1Mlnl6s5NvyBmv3
	aQvYWnXOg7WkUYL2uubEwCh5eXUWbmzlRJP1nU7bDzTEobf7j4573+9HpjVffdlR48jXVtmSZpm
	wm4/Ui9EInU5zt9AfceSJGiSiluhks0AVt6XkaeNK/yQneUHHRMwiOM29Bvblxi6N3f+Ng8Rj3w
	CprRO19l9HC4xfg==
X-Received: by 2002:a05:6820:81c9:b0:6b7:46fa:169a with SMTP id
 006d021491bc7-6e5552968bcmr1134418eaf.47.1791299249802; Tue, 06 Oct 2026
 08:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908203157.1271219-1-georgeandrout13@gmail.com>
In-Reply-To: <20260908203157.1271219-1-georgeandrout13@gmail.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 6 Oct 2026 11:07:19 -0400
X-Gm-Features: AclHuK_IJugFu9Uj9xCurjumWQdLggd0Ix3vurHFpmzAMJYObMwl7ozds_jSXoI
Message-ID: <CAESH5ofXxViFgEUOw8c3wLurgj1dzdA=j-5KaabdF1Uxzx=EuA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: id_pool: document panics in `find_unused_id` and `release_id`
To: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:32=E2=80=AFPM Georgios Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> `find_unused_id()` calls `Bitmap::next_zero_bit()` and `release_id()`
> calls `Bitmap::clear_bit()`, both of which panic when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled and the index is out of
> bounds. Neither `IdPool` method documents this.
>
> Add the missing `# Panics` sections and state the bounds requirement
> on `offset` and `id`.
>
> Fixes: 2cdae413cd3e ("rust: add dynamic ID pool abstraction for bitmap")
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> ---
> Changes in v2:
> - Use "within bounds" instead of "in bounds", following feedback from
>   Alexandre Courbot.
> - Add Fixes:, treating the documentation hole as a bug [1].
> - Link to v1: https://lore.kernel.org/rust-for-linux/20260829153442.20799=
-1-georgeandrout13@gmail.com/
>
> [1] https://lore.kernel.org/rust-for-linux/CANiq72mgZg-QBy4gwzHmD4gJm4wSc=
ktfpdDtyZt3Zijk83h2CA@mail.gmail.com/
> ---
>  rust/kernel/id_pool.rs | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 384753fe0e44..ae6960d7f638 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
>      /// Finds an unused ID in the bitmap.
>      ///
>      /// Upon success, returns its index. Otherwise, returns [`None`]
> -    /// to indicate that a [`Self::grow_request`] is needed.
> +    /// to indicate that a [`Self::grow_request`] is needed. `offset` mu=
st be
> +    /// within bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `offset` =
is out
> +    /// of bounds.
>      #[inline]
>      #[must_use]
>      pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'=
_>> {
> @@ -236,6 +242,13 @@ pub fn find_unused_id(&mut self, offset: usize) -> O=
ption<UnusedId<'_>> {
>      }
>
>      /// Releases an ID.
> +    ///
> +    /// The `id` must be within bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `id` is o=
ut of
> +    /// bounds.
>      #[inline]
>      pub fn release_id(&mut self, id: usize) {
>          self.map.clear_bit(id);
>
> base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> --
> 2.47.3
>

Hi,

Just checking if there are any remaining concerns with this patch, or if
it can be picked up.

Thanks,
Georgios

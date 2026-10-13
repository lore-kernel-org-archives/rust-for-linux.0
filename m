Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48920125F
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895219; cv=pass; b=oeYvdCa+HKnXaw4klXcv6lRqWf3P7L9die9HqQFGEcNbGDJdz8w86cnHB7SgtHiG62s0npisi0uFBhHaKbzQnUcnXedJzn5bYsjGr07/xt+oKIlO0Q6TbpUuD5pEGi5IoJUtRqDD3+N4fozl6D3Xrp7ugNLEF44moF0UDgBy6B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895219; c=relaxed/simple;
	bh=2xcKVenmsOkTL/dR7a9UaRkSdDoYvwvb2hQq8wsPR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiUKUUjG9ss7LigCBx7DgfzkTzWsX5+1JkoqVX8WZWABwPcTrWyWY0Czw18fnGBmN2513kxAiQC1NV44v0+Vp03eW2oYUIrLAWiDfP1rPVlPKYkO8grWjE7bMLss52785g1Ku0V4+bQJBYep+wirrweIX3COILNxtWehnxy4nvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8DrU4pZ; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8DrU4pZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2069363f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895216; cv=none;
        d=google.com; s=arc-20260327;
        b=CoJwpufqJzbFlibehqOYu1jBmR5Z7ahmZ0798ymiXYoH/4jOsgN9TRG17Ieq33KjbO
         XU1dBCImG5gJB0/Gb9KLb+s8rItjULOfPK4BhrAYBEmpOzjnJZRd1B8tViN8GEkUNdhb
         7zJcvYt2R4X6oVr+5o0f3Ye+Kc2VkDFCfEjcyO+CTbsBSp58nsZALTvx6CBfRRrkOlnj
         ULAWfUPeB2l0VNizsji86/F+G1zw7F6S67QwWNr7JLLmoTc8ICLDMhrZM7ULkW+K+1gC
         GBebbDBzzIny0OF6l30JFvfTxDBgspaFIpFcGG85AiFGt0gUWDxVCkD5FdS8QlX277mb
         v0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        fh=/6eWd9ov8pDOn9mmyWW7D+TkJqI7vqHkQW7BfBmzm8E=;
        b=FF/pUgTKSMbhB5WfqVpYhUOx2JU4LhEjSyDps7XoA4SGfaBNdTUbWDB2rhUeZi8zrU
         ojvtuugOVQtTLOY5aALDefNIg11wY67/fkTW3Lc7TEVNj6DK/UU9Ld1TLahqLN2nf8kK
         7f+1+eqYnl89AJSDoV8Igm52RZ5UapBOJtkSyKCpK7jB58/QHB47TDwTtKU4wnOPIkP1
         pjVZrB1lL1EvOHLS5AR5lrOg50Dkrs9eljhxK+OiW+5yPPE+1Z7MV7aWndZZnAmRcvSV
         GX9unln/dw6odWSV9azyIhG4e8lIErP0HJ6EpXaenNEz1XVlmZpZUWUOKtpuYQty8Q2A
         CsJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895216; x=1792500016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=L8DrU4pZy6lObZsY3CcCLNFY6pLCfmuKnb5MhJbhxEbXnEtHWeVBDHA/xYQ6FC4TGL
         V5XNDn8fJdNx/uI3DEUeswYU8Kolgk7PP8Jfz5PL9EDloPkBgLKpL2UHOxWv4PmG0LOk
         5T8mw6OC03YMpzP/Bu22TpMc4b8HYLJcJwHEXWKXyGTtTmAvoxlwCfHV/rsgAPAKu5Bj
         WkBrlHdIBl+eclwY7V97giPr9FpbVb0wVkAEJxHwM7JI1YsENcXY0LUXsFKnzKGYbZXy
         INifoEBz8db9sTW33xlVj6OnsCVhVtIyZx3x71VRWhc4Xnfc/3oytpCoro0rd982wx3T
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895216; x=1792500016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=LsLhOhgo10gNShwkqUkixqMRjs5rQ7Q3qAUH+ieUECYgbd1WW638RhlVplijHd01d6
         LfcPapGnvihEYJGKCYNoFJTLCJQSumnVHHxIlylx+wHONN8soxwQj/7CSlLpkhleK763
         oRKDqI4MZYm1X/EKw+w+UFu/TNb5E2oQKZlM/BNMg8hy2y6Bqmxwf4fP2TciY5c+KVLI
         ypnR7oItMIPAXPzrBFoklFzzqVf1hXLn1lNoPg63N2MvBQplEdNTF161OGiEUYPERX4v
         ctUG+1XDJnQzAGznpM+Dt/POTSXaJMDEo//H1efi8d3GPYEeYaDmWB8HujzAWh5w4l0p
         vCXA==
X-Forwarded-Encrypted: i=1; AKwUvBzt+I4BSxLJM7I+eROY0FYU/UGAD+Ju/uAuNNqsoQW8XB6vgqxVEXCxVacLJRidP+5srJY7cZGhM5qX4sXJSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfI51VItlZqcoLszzlSlJtjmU0z7awxhGl7Dy/IeNo7TCBzR38
	QUSrwzhTwq96znKL8KnsVWc0pVbiKZPViy5pD7cgKxgh4/oKOjvhroui4VVyBNVRUteoyFFV0sB
	Q89b0jeUY7tw+JvMJIr45vIcn2Os1ivzmXAu1sNcF
X-Gm-Gg: AYBFou3zRQgvowb3peDQmMFmO/FU+wGJRen4Uz12w5/lzHrTJqL6njhUF4rFu5B1NVA
	sMSKDtXNKUHd61KZD7F3fGwVeSjvZmthliXwxzRChJIvU3LqRvkO8YdajpW7acB3IdbDWirc+TF
	AOjr5o/MSAgbvoE3lRp8vxaZJ5fOI+FWq0jMr7YOA62fHq16YxCGoQcFMKJvhTt1RFa0k7cHPzr
	MQlKh4CMN9RMF9rwQu5rzo+QJTEVfFWWhcrqql5mzkd5NLCr/g6GaJoB3pccP1YuDZt2BWQJPzE
	2qQN2MdhWb3ga77ZB0YktMMVdCM79+9dhpffTI8BqnNpkvFHtZcsK3yBIHHsWVL83qhJs3MUE+w
	aKJocDzLty3DCboGBm79u9X0=
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48dbad3c1e2mr17146863f8f.47.1791895214991; Tue, 13 Oct 2026
 05:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
 <as4DdRqFKxuJNDnS@elver.google.com> <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
In-Reply-To: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 14:40:01 +0200
X-Gm-Features: AclHuK-baEW0UEHM2ney0XhOi65COv0qWM-kqnIhtWfQmlen933Tf5epqt03if4
Message-ID: <CAH5fLgh=TkPnycdZ8_yQKaVeufN1YUS-MTo3EoMVhZzOdpKwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Looks like it, and we need this patch to use system_dfl_wq:
> >
> >
> > From: Marco Elver <elver@google.com>
> > Date: Tue, 13 Oct 2026 10:05:52 +0000
> > Subject: [PATCH] rust: workqueue: add system_dfl()
> >
> > The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> > (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> > system_{unbound}_wq is used")).
> >
> > Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  rust/kernel/workqueue.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 7e253b6f299c..e46d3acf903d 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
> >      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> >  }
> >
> > +/// Returns the system default work queue (`system_dfl_wq`).
> > +///
> > +/// Workers are not bound to any specific CPU, not concurrency managed=
, and all queued work items
> > +/// are executed immediately as long as `max_active` limit is not reac=
hed and resources are
> > +/// available.
> > +pub fn system_dfl() -> &'static Queue {
> > +    // SAFETY: `system_dfl_wq` is a C global, always available.
> > +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> > +}
> > +
> >  /// Returns the system freezable work queue (`system_freezable_wq`).
> >  ///
> >  /// It is equivalent to the one returned by [`system`] except that it'=
s freezable.
> > --
> > 2.56.0.385.gd3acb90ef8-goog
>
> This is:
>
>   https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@ke=
rnel.org/
>
> i.e. we have had a warning like that in one of our current tests for a
> while, it would be nice to clean it up:
>
>     workqueue: work func
>     _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtN=
tNtBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
>     enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Cc'ing workqueue: Tejun and Lai.

I was actually working on resending that workqueue patch series, but I
think this particular patch should be split out as a separate fix, so
I'll go ahead and do that.

Alice

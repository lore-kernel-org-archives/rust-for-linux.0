Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AB438736A
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075640; cv=none; b=rElt/yji5ufSJZi9jPdsAUbtrtG6GnrXw5m6YIuxTn4jwXFNQt7LitNNFyHZDRotg6SJO64PHNjXkX8YnfF9eHKooXmF0GDIwuMZp0Mht74emm5eRYH0QvWc8xVnaqJY8sTMELHUw2zIYF0EH7yUcM+ogkDiy4704byQnMUGgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075640; c=relaxed/simple;
	bh=GgADrub1g4FXQiLnn4LEUgo9LFB1ETRDIU9Hd1IlEMc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OBAI1PnS0pBRWjHK4wN4sjl99ymLUzool46ZeVseZW08BfXgnuFU4wnYp4SS/mEuBoh9L1+c3SJGtXQN0UP6Gn6SOPtt1FFCJ5ZWbla68GKrx/398VIgVPG6IL/TC2ZFq5/VUuiEHzOTPWewjr130MplrLud0KfM4qvzu++KyW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mMOOflH2; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mMOOflH2"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-68f9f08cfcaso6231334a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 00:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781075636; x=1781680436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgADrub1g4FXQiLnn4LEUgo9LFB1ETRDIU9Hd1IlEMc=;
        b=mMOOflH2oMuge/4RKAX3GooQSFbkCNiEXbAUBGSqRR1SfJdsspht2MvyVBVFBufSVU
         bv5hR5B2MUQGklZHKhG7IAMJduYvejIlB7yKjcp+tf5+esx9Zg8oACwT2vsopPSJIDq2
         pT/l1ASoNuLTm/B7E/A0Om6GFrRDcOe2E0H5dQe8EHjZsr+9w41Oy7WyEhYMQhCD69Wi
         uVxSdAcSCDlJ1Z0Q52BrIqw7TX1BGroJsCtwcrkQR6GsPQSVBVX8lTrWwk/Nhmf/so4Z
         5FG7FrVjCXVpkn1bQFNaPMFalFsAXymXNPyW0dx89hR1RHBKeghEVm+PN2HS68miOc86
         RxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075636; x=1781680436;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgADrub1g4FXQiLnn4LEUgo9LFB1ETRDIU9Hd1IlEMc=;
        b=PXk1nx93IBHbqIOlNgVoen5y1M9Xs+6IyctRudR3YutjyO9EIIJQiPuVVEnvJpF5pe
         fjcCcdp1AismuG5KhD2HfJI18p06m1ir9/H5Y01MP1vIlWVD6BWoLe7oGR/7Puy2fjdg
         tQruzPKxyi3+yunMn59PrpKhnKbVb3QkAC53IyrZIBJvHcihYVp33J8I3iMvBqMCEssz
         +VC1WLC4yTIoLPrHRi2L/QpgZDeQnijOp5I+lFSGZOs3EYY70yo2IJCqkwBQ7wvoVvBq
         GLIDPWPJHfxPmI+CMQWt7gAw0RcM730MDRCD9Lg5ti4fcJjhpL0ntlzsYPYieEmFljJa
         gigQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xGWLGUYCK5kqM1muF7VGp1Wr/Vn89nNA9+6XWlZOne/WBZjyxO2cke2FdrseUYfH+0W1iYVkAax1H5tzj7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjURCl3XsbdK3O3azqTm8kU1ZrHqCaUAPAO+vEBo8SnTm8rnB1
	EMro9mI8KqbMsdR3FqbwvAs8K806GDusxYgjDj2GaENrsBQvHLROVG9owfMv6JqQ1y3gW54lYKC
	tZhHeXGrBLg8X7hd5Hw==
X-Received: from edai32.prod.google.com ([2002:a05:6402:f20:b0:68c:5e5a:6095])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:518f:b0:691:b5aa:5a7b with SMTP id 4fb4d7f45d1cf-69238635440mr3224327a12.17.1781075636160;
 Wed, 10 Jun 2026 00:13:56 -0700 (PDT)
Date: Wed, 10 Jun 2026 07:13:54 +0000
In-Reply-To: <CABCJKucVW-FF2sti9gVoKkp-StLMof7kSqisbmUvjyEAaKLuTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609003256.1829625-4-samitolvanen@google.com>
 <20260609003256.1829625-6-samitolvanen@google.com> <CABCJKucVW-FF2sti9gVoKkp-StLMof7kSqisbmUvjyEAaKLuTw@mail.gmail.com>
Message-ID: <aikOstbyTYGuV8xp@google.com>
Subject: Re: [PATCH v3 2/2] rust: drm: gpuvm: require Send and Sync for
 GpuVm's shared data
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 06:54:28PM -0700, Sami Tolvanen wrote:
> On Mon, Jun 8, 2026 at 5:33=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
> >
> > GpuVm implements Send and Sync unconditionally, but it shares and drops
> > T::VmBoData and T::Object across threads: obtain() can return ARefs to
> > the same bo on several threads, and deferred_cleanup() drops them on
> > whichever thread calls it. This is unsound unless both are Send + Sync,
> > so bound both impls accordingly.
>=20
> Sashiko keeps finding more issues here. For the benefit of those not
> subscribed to dri-devel:
>=20
> > This is a pre-existing issue, but does GpuVm also need Send + Sync boun=
ds
> > for T::VaData here?
> >
> > Since GpuVm<T> explicitly bypasses the lack of Send on VaData,
> > UniqueRefGpuVm<T> automatically derives Send. This allows safe code to =
map
> > a VA containing !Send data on one thread, send the UniqueRefGpuVm<T> to
> > another thread, and unmap the VA there.
> >
> > Unmapping via sm_unmap() returns a GpuVaRemoved<T> which drops the !Sen=
d
> > VaData on the wrong thread, potentially causing data races.
>=20
> Looking at the code, UniqueRefGpuVm seems like a better place for this
> than GpuVm. However, before I go add another patch to the series, I
> wonder if it would make more sense to just add these bounds to the
> DriverGpuVm trait instead? I'd be happy to hear some non-AI thoughts
> about this too.

Adding bounds on the trait does sound like a good idea for simplicity.
It's not like we're ever going to use GPUVM with non-thread-safe types.

If it's help, note that you can use `where GpuVm<T>: Send` bounds or
similar to "reuse" the implementations elsewhere. For example,
GpuVmBo<T> being Sync requires GpuVm<T> being Sync because of the
GpuVmBo::gpuvm() method, so you can use `where GpuVm<T>: Send` as a
bound to directly express that if you want.

But if we just add bounds to the trait, it may not be necessary.

Alice

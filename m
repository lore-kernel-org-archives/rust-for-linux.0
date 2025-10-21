Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6272DC353
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053828; cv=none; b=XudVWEul3ef1+FpKk+ccP5rAjKHOESnrKymJgCbPSXZOFs+wKw8nLTrGPR+YfEDwWAlNcdiA1HxB5HRe2HY625JECox8NRz+8SbVj9fkUFWzLhmbYSpKc7tWg6zWIaxuWGXoi+r6oO5miBaHcG5J5G3SPnmeIYTR/HdmTNJaHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053828; c=relaxed/simple;
	bh=AtVGhYFh437q8W5WmFUyTtQrh9cab72NfJvdwed6k/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h8LHKp79CVHQ2IjKfNRMqo1o/rhRk1WWAM9bgmrOI7NnLS2bJT+S18fzEAQ8M3+Az/gOHKXOznVHRZeuLxyj8VdjaaypEdIb3CuxYF0K39CvJJS0S9uswEm520lCKONPEsy7ELzawoarS8Gf46XcT7cUQmHwyQwMhRd1HWoxYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y/gtwCi7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y/gtwCi7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-471148ad64aso23295835e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761053825; x=1761658625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Kqt67P5hzlBZ//74kVgmzA6U5uQp3sNCk9uO9xfvb8=;
        b=y/gtwCi7eNsbs7RLuuagvFTuqnQW2/gn7jbNln2yESKcC3Gms61cgjDVTUB886ae9K
         aUQqCP+WLS7O3SwYWCkAQThHMvpVMGeS9ofBHEU9LF+feb8mdbwVEJgK0B0w9rdNs7wI
         T81mFZAVCVSCa/dPmPUSpbHDtH+yZ036CfuJdPmSE8VFs+cWiJbUQATlx4GmjYwMg2aV
         hF/IR9cSL9oxLzA5uv2MGbAd0nek0usmGqbmopU5eXNzprwuaWhKoCWpyy5UrbYSgOKY
         rxsz7JO603vZObvtkGHk0NgDIZwsE+h2cjIi5oQNmithqne0tZntNgEsT/v9cwXq1imO
         yzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053825; x=1761658625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Kqt67P5hzlBZ//74kVgmzA6U5uQp3sNCk9uO9xfvb8=;
        b=XjsiS9Cjkg95H1xhIBXpY23OFhXU9MSrmiDujBicCbE0izlFKJtXptB8DDXey3D/Cc
         IGuyxewyFfRi4FZCh61fzgRTPVXNW0mjpvZlUPi3+9ADMvoWJbS38kJbddP5vN8NNeo0
         VLBV8Iawypi5O2Xzg96ycCq2MURX2o7QPbAI60LfP4qMJAfbQL2n379BI0Loy295qoCS
         3pGI5mQy4jM+gFgRwwV6OUwRuYJK0XTJb/5uRlwm062OpQ//MhglW0/4npJy7sbTYWrQ
         DZ1roxK+DeHiimeJCLsTjKpncIdmyeN3IwquDN5qW8Ia4zJ+H0W9EvblppFc1BCByo/U
         HlFw==
X-Forwarded-Encrypted: i=1; AJvYcCVbszDLh+zFkAyC2LkQYzntplWP/W8k2ey2Xhq2/7/ZChrV7SE6ZCCQkw6o52LypqKCZqFs7QywCaFU13Itow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/jJfK1b8olwl7ZjOOhd4Mp/y9xkD7NKe5T3//AzaLIg8pKn6
	fEOSeOXUw1IN1hCgkaJFmLOy9/3wqBzhUklCBaaTw64Sv878op8HAsfa75PZsH+i3dFJsj0hbWF
	q9vZJy24Fp9YOBcCfbw==
X-Google-Smtp-Source: AGHT+IHRWWwYo+RUBWuqiEoo9mYQLp/w5WREpiW+BZGiWPDvEU4xwiB1VUEgH9NndADC6yrrO0oDwzHnhBOaEuc=
X-Received: from wmvs1.prod.google.com ([2002:a05:600d:8221:b0:46e:2121:d406])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1988:b0:471:1387:376a with SMTP id 5b1f17b1804b1-4711791c661mr135006705e9.28.1761053824704;
 Tue, 21 Oct 2025 06:37:04 -0700 (PDT)
Date: Tue, 21 Oct 2025 13:37:03 +0000
In-Reply-To: <CACQBu=VLPGq0nx6PJSnw3YBhMe4QKHiiFG0k9_Kwayj9w6nfLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020-binder-bitmap-v1-0-879bec9cddc1@google.com>
 <20251020-binder-bitmap-v1-2-879bec9cddc1@google.com> <CACQBu=VLPGq0nx6PJSnw3YBhMe4QKHiiFG0k9_Kwayj9w6nfLQ@mail.gmail.com>
Message-ID: <aPeMf6C-dRI5OlTE@google.com>
Subject: Re: [PATCH 2/2] rust_binder: use bitmap for allocation of handles
From: Alice Ryhl <aliceryhl@google.com>
To: Burak Emir <bqe@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 05:06:26PM +0200, Burak Emir wrote:
> On Mon, Oct 20, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > To find an unused Binder handle, Rust Binder currently iterates the
> > red/black tree from the beginning until it finds a gap in the keys. Thi=
s
> > is extremely slow.
> >
> > To improve the performance, add a bitmap that keeps track of which
> > indices are actually in use. This allows us to quickly find an unused
> > key in the red/black tree.
> >
> > This logic matches the approach used by C Binder. It was chosen
> > partially because it's the most memory efficient solution.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/android/binder/process.rs | 110 ++++++++++++++++++++++++++++++=
+-------
> >  1 file changed, 90 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder=
/process.rs
> > index f13a747e784c84a0fb09cbf47442712106eba07c..357ba1b577c73ad3f2b525a=
8573424420577e92d 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -16,6 +16,7 @@
> >
> >  use kernel::{
> >      bindings,
> > +    bitmap::BitmapVec,
> >      cred::Credential,
> >      error::Error,
> >      fs::file::{self, File},
> > @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInfo {
> >  struct ProcessNodeRefs {
> >      /// Used to look up nodes using the 32-bit id that this process kn=
ows it by.
> >      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIST_PR=
OC }>>,
> > +    /// Used to quickly find unused ids in `by_handle`.
> > +    handle_present: BitmapVec,
>=20
> Are you going to delete rust/kernel/id_pool.rs, too?
>=20
> I have no opinion on whether having an abstraction vs inlining the
> functionality is worth it. I mean just in order to avoid id_pool.rs
> hanging around as dead code.

No I should be using it in Binder. I forgot to update the code to use
it.

Alice

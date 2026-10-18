Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD9445AFE
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792312028; cv=none; b=fv5h/+BxcjQNoZhAXkD4TLVKJtEqTupdqjP9OjVVctWmJoBHumNwI8DIlcbRkuNcm58gaB0aYHuyFZE/UafTI6FYnQupPLD0gaddbBtBvGSofCXJqWUcrMw44eU5TPt7BL4elvD2L8B68Kbdjxqfi3yWiUNdZX8a2j0tSbeF1PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792312028; c=relaxed/simple;
	bh=OU2RgGcn5fSxNJyu4xx+Tr5/huDJO1BJBxy1gAUCxSA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b6OisGOnR42PwcVDf5fpuo6VGJO3mp3Ng3qU6U9HE46bh1h05p99NRV2WE9dZspOegxi02d+u73TR7PGG0EzZTT4x7tMS7p2OPej9KHLownj3ssMSau2HfltIuFH0hzZCQWqx6BIzLomP6w1QxQxmu5FccGHYFyW0pwwfedOo1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RodOpz+m; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RodOpz+m"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e8c76334fso97139466b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792312020; x=1792916820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QkOWVJGDMEJpVMoa9QrtOzGeGfuXdeF8I51bc2Lb2JM=;
        b=RodOpz+maGi0rM7MTP6+yZjcb4sqGvSPZA46RMBB4ATUOCCDB5uelUHmn5/U8YuyE7
         9iubk1/ZOMuQZs9/mM0iAzlGVWcujieyZp7xhwNQcbv9+r7R4jQL2pS7iHX/aZVT3r37
         1/tj1gfCp01l4hRJEPn3VJJN0nTBO09jReMGS1Mm80AyfRMXSF+S3HK1COjZV3/E99RY
         sSurxkjqLIh+QHoc/AheWzK9TblBKnbKkTvTNR4W+v+qN/tN1yWStAgdDBTaV84YtGxT
         GRzLgUiuDRZrAMQNY5uAKeH5b0UdXV1SaQOZDwSUgeGb5wKEhBxzkyCLbC9uDOYtpvMT
         B1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792312020; x=1792916820;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkOWVJGDMEJpVMoa9QrtOzGeGfuXdeF8I51bc2Lb2JM=;
        b=BNX7UrFAfZyhALhsgBmQIjKY8f26y5sx6QgTbjvpwRTBshvQFKMTP6y58U1OVDlUkV
         hLel+UqjiPN1c0I6vifydsy3jpaN8AqJ7dDtIKIT2TmK/stenYN81RNaXLFY4QdFT5cX
         c2xSzrcLudufQuj4lzSM2B9FpzS+8uzo1ZIRP+xAa1bW6K/dcfuL7q5uUgiO+jK1nQhn
         Mdc2Dl/ghua/Bz1yufYOiIsBl7Lod45LBdMTGRKbG03zk/2eGcpsZZKfHZpiqBWJBk7P
         ig7FS+1vVOenT7HRcq1E6J3TNUa7yrFlYH/FDph+CAylpm8nB5u02f/z0dvULoQSGaD0
         rNHw==
X-Forwarded-Encrypted: i=1; AKwUvByxDi/CiF8lSxKy4ytOgp6sJptCXLBj7p7kzNlDdUlvd3ST3binXXs7wMJci0JUNLZQ+h6NvG2Ow1JXLrQPBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzYZmFTFKjAPaAdWANr7/dnwTpXvA9I31oIL4XCLEngKgsXdV5
	VH24OpnkefAYMuZAdAOscog9MFSkvnFvR5FLkRcdgeogN69/RdEWHzFRN9s+uxHgUlHcXQlFVgC
	MujyGtXuElytyfLiRrw==
X-Received: from ejzu11.prod.google.com ([2002:a17:906:c40b:b0:c42:1a41:d93])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7946:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c419eb33ac1mr311884866b.28.1792312019486;
 Sun, 18 Oct 2026 01:26:59 -0700 (PDT)
Date: Sun, 18 Oct 2026 08:26:58 +0000
In-Reply-To: <CABdmKX1fLKvC_TnO3g_DkPjcfoXiU2rM-Fa+ZjriYctVQPkFTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
 <20261016-binder-memcg-v1-2-d659b8ae088b@google.com> <CABdmKX1fLKvC_TnO3g_DkPjcfoXiU2rM-Fa+ZjriYctVQPkFTQ@mail.gmail.com>
Message-ID: <atSC0lHwc7N_6rVv@google.com>
Subject: Re: [PATCH 2/2] rust_binder: charge allocated pages to memcg
From: Alice Ryhl <aliceryhl@google.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:41:55AM -0700, T.J. Mercier wrote:
> On Fri, Oct 16, 2026 at 6:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Pages allocated for a binder VMA are currently not charged to any memor=
y
> > cgroup. Thus, use `Page::alloc_page_memcg()` to charge them to the
> > owning process's `mm_struct`.
> >
> > Suggested-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/android/binder/page_range.rs | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/android/binder/page_range.rs b/drivers/android/bin=
der/page_range.rs
> > index 52ffbf3504e7..57da47243967 100644
> > --- a/drivers/android/binder/page_range.rs
> > +++ b/drivers/android/binder/page_range.rs
> > @@ -27,7 +27,7 @@
> >      ffi::{c_ulong, c_void},
> >      mm::{virt, Mm, MmWithUser},
> >      new_mutex, new_spinlock,
> > -    page::{Page, PAGE_SHIFT, PAGE_SIZE},
> > +    page::{MemcgAllocError, Page, PAGE_SHIFT, PAGE_SIZE},
> >      prelude::*,
> >      str::CStr,
> >      sync::{aref::ARef, Mutex, SpinLock},
> > @@ -399,7 +399,16 @@ pub(crate) fn use_range(&self, start: usize, end: =
usize) -> Result<()> {
> >      /// Assumes that `i` is in bounds.
> >      #[cold]
> >      unsafe fn use_page_slow(&self, i: usize) -> Result<()> {
> > -        let new_page =3D Page::alloc_page(GFP_KERNEL | __GFP_HIGHMEM |=
 __GFP_ZERO)?;
> > +        let new_page =3D Page::alloc_page_memcg(GFP_KERNEL | __GFP_HIG=
HMEM | __GFP_ZERO, &self.mm)
>=20
> Not related to this change, but I think it might be better to ditch
> GFP_KERNEL | __GFP_HIGHMEM and use GFP_HIGHUSER. We're already mapping
> this into userspace (and now charging the memcg for it).
>=20
> Is current the sender here? If memory.high is exceeded, current gets
> blamed for it in try_charge_memcg()'s done_restock section. So if it's
> the sender, that's not exactly what we want since the sender would be
> throttled for it. So I think this depends on
> https://lore.kernel.org/all/20261010210957.1350874-4-shakeel.butt@linux.d=
ev/.

Yes, current is the sender process here, allocating a page on behalf
of the recipient process (`self.mm`).

Because current is the sender, I don't think we want GFP_HIGHUSER: the
only difference between GFP_KERNEL | __GFP_HIGHMEM and GFP_HIGHUSER is
__GFP_HARDWALL, which enforces current's cpuset (current->mems_allowed)
in cpuset_current_node_allowed(). Enforcing a hardwall against the
sender's cpuset when allocating a page for the recipient doesn't seem
right.

And yes, it looks like we do indeed depend on Shakeel's patch.

Alice

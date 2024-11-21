Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C55FEED
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183701; cv=none; b=mXYstfnrntqrfj6WdqDZ1l0mHYFWQwojj8tY6+jINjCm6ZHLLgqFRUUdErEBIkEVDf57K3N7bQZPUEbRq46dgd5jDZLIkgzZ2fvRE0MqMmtglaIm9mnHOrWkucBwkDmucvx2aQPZ5xkGhH2qSCcJP+c1xrrxfweIkjtC/pzUwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183701; c=relaxed/simple;
	bh=yBbdsApvfHb/NGOGR5y/qA9wfZsvXHVzSmYceufkpJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqHVhHlbHncq3EyKeaJbULbSmMivUOAVMaYXdIvVkNebopsXfBHihuImqhX4P1fLKnOu+7yoQWdLPho+pSfJtEnBFLNSherxKaT0uH7J6fw/UjmBeljBsCWGY8G7UOlLZj1xf72m5dATyrDLO0fpPN9ZjENpfD1NC5Bq3u88Kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vpoOriIc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vpoOriIc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3825c05cc90so247538f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 02:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732183697; x=1732788497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuqAwFP3qXJbhgF+m94fzJxlivQXEpF5fDoudxVSxdg=;
        b=vpoOriIc0J3hEVW4viNZwu753akxblUz/Ji6IGGnPVbn7Ln7mJNZ4pZ/bdMpHUquSq
         2ZYwClmrniQ4+QWUOJsxDgwBMpovjsLr8Nriq8jYImW+9Mt2aF0Oyl1nDL1Hy2aWdwrs
         CJ17cvqXwp2DKOQ7FI0GouyGmhGvGASXfKPXviTztHuMId9rIXjiTzaxLInZ0hPSdFa8
         6Yi/E61ORXXuW3ZbOfXoecVgqCOMqHxZ0nTuiK4OTIx5dzN36PzwAGbzJ8Oxr24rLJX3
         sM+f6Ap6lWeIWmVr1nv4PaWk3hVDzC69f6JJEy6rtatbknbVDa9ZWA3osU7AKLggu5nV
         Rz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732183697; x=1732788497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuqAwFP3qXJbhgF+m94fzJxlivQXEpF5fDoudxVSxdg=;
        b=hJou/7y0pn6kgc2AqlQmt5hTuq59gf9B418Ne0a0rimSyuSaf8sj7tjAyeGllYUg5o
         WSUpNz5a6uWQvtosWkA32/TfBl3XjK3fUoAJGbVjWDuQ32nPHgcvcYSeTN6ko6oudMtM
         PLxqPxlGtDVP/AxCVwGWRbLr7Qe90YdYKNP6AzbEtkCQWXTbeSSxmOtHSZUZYQcycP6S
         ELocC68zFHkyNeyLTp09fmfCcFPU4TKZcloJhcjbvT25ySoBV4jzQTPa6DkR3S3dUcGE
         ea1oCcJazVaax1G+d6o/Ca6UxJiBsQHEbsMhCgRaOUrdTVdK6LpmZ+Xo5STJmUeJGK9l
         yYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRkoONJGmQNKRgN9qIqkmaZhtm3H1HjueQrfZ187TzrN1taDX+hvuWWp2aTzFIqqKtPaFH+rA9DRvvZkpQ1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7GS8t2/sP4aivUmkhDsCnufUMDIPl5ngytKkNJ62/bvQMhZA
	SMasg89aRjg39hHNgqCF0wz5u7XLEG6yImOMGKvYC9+wGkGs/8QKnHoKhErlrvIpFqoQk+MeTXA
	YefsuL9xqAu4QCG4+rlDjXgji2vjEl4O+LUo8
X-Google-Smtp-Source: AGHT+IGfL/ASasP7Bf+YpdHopthl9ENVqGb52IIvzrlZxcW0+1CQTsIidejsTxMVAFwQUIeUIXHTNsPRRrhQUzoCXzM=
X-Received: by 2002:a5d:64c2:0:b0:382:4b5c:418c with SMTP id
 ffacd0b85a97d-38254b20878mr5116380f8f.55.1732183697395; Thu, 21 Nov 2024
 02:08:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com> <20241120-vma-v8-7-eb31425da66b@google.com>
 <bd95657f-0fcf-4c13-a02a-d7293aa5f5ea@lucifer.local>
In-Reply-To: <bd95657f-0fcf-4c13-a02a-d7293aa5f5ea@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Nov 2024 11:08:05 +0100
Message-ID: <CAH5fLgjz7nd2DfqKJfDKFpODJ_TUMP1omN+7DqTnpqTNrXTC6g@mail.gmail.com>
Subject: Re: [PATCH v8 7/7] rust: miscdevice: add mmap support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 9:07=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Nov 20, 2024 at 02:50:01PM +0000, Alice Ryhl wrote:
> > Using the vma support introduced by the previous commit, introduce mmap
> > support for miscdevices. The mmap call is given a vma that is undergoin=
g
> > initial setup, so the VmAreaNew type is used.
>
> Again, I'd be explicit about the VMA being passed to a struct
> file_operations->mmap() hook on mmap. Otherwise this seems super vague to
> me!

I wasn't sure if vmas could be constructed in any context other than
mmap. Will reword.

> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/miscdevice.rs | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > index 7e2a79b3ae26..4e4b9476e092 100644
> > --- a/rust/kernel/miscdevice.rs
> > +++ b/rust/kernel/miscdevice.rs
> > @@ -11,6 +11,7 @@
> >  use crate::{
> >      bindings,
> >      error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
> > +    mm::virt::VmAreaNew,
> >      prelude::*,
> >      str::CStr,
> >      types::{ForeignOwnable, Opaque},
> > @@ -110,6 +111,11 @@ fn release(device: Self::Ptr) {
> >          drop(device);
> >      }
> >
> > +    /// Handle for mmap.
> > +    fn mmap(_device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>, _vma=
: &VmAreaNew) -> Result {
>
> You will have to help me with this :) ForeignOwnable, Borrowed<'_>, _vma =
I'm a
> bit lost here!

When you implement the Miscdevice for your own type, you write a block
like this one:

impl Miscdevice for MyType {
    type Ptr =3D Arc<MyType>;
    ...
}

Here Arc is a pointer type (very similar to ARef) that represents
ownership over a refcount to a refcounted value.

In this case:
* Self refers to MyType.
* Self::Ptr refers to Arc<MyType>
* <Self::Ptr as ForeignOwnable>::Borrowed<'_> refers to ArcBorrow<MyType>

The last step is resolved to ArcBorrow<MyType> because of this impl
block in rust/kernel/sync/arc.rs:

impl<T: 'static> ForeignOwnable for Arc<T> {
    type Borrowed<'a> =3D ArcBorrow<'a, T>;
    ...
}

Note that Self::Ptr is short-hand for <Self as Miscdevice>::Ptr.

> > +        kernel::build_error(VTABLE_DEFAULT_ERROR)
>
> What is this? Is this not yet implemented or something, and this is a
> placeholder or something?

It's a build-time assertion that this function is dead-code eliminated.

There are two cases:
* Either the driver does not override mmap. In this case, we store a
null pointer in the fops table.
* Or the driver overrides mmap with their own implementation. In this
case, we store a function pointer to whichever implementation they
provided.
In neither case is the above function present anywhere in the final executa=
ble.

Alice

Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A413328FC
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575506; cv=none; b=QjjbJUb5PfOc9/GrEboviIyUWUECiC3dsg9GJDD8ddAE/ulJJFrZoc6yJOAOXETsf7/ogtmg3EluknFZ5KAByjo3FCLORQB5bT1VX2FK/HGCvHZwzKHtKpl9kSbIRd7K9mPjS2y1OKhphsEhaTquDIMJWWbbBeA3lRnVeuksw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575506; c=relaxed/simple;
	bh=01+8JfL5Hs4jbP5GUEH74yNqWgRnrF2S83HDOgriL1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dPV/8ayzqmWO6XAKgnUfaLNOqlMjsmswyrNTz7plxq4KTQgRTEWTRvRh4w6gHtiak6u39m1TV9PQ6pMzlKJ+4og7PaJuhLFPu21ORkAEjOQ5ovikpmEET/aRfSGygsn4L5lxbRHMUYuaXyWmev3LuISymS3HpCjw8eoOr9YZ80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zzv1V2K8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zzv1V2K8"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806b12ad3fso12471005e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 00:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771575502; x=1772180302; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vT1vNk+ignNIrARqY/24E4GTmpP0zmMbEtNGPGXPf3U=;
        b=Zzv1V2K8z02tm9zdAX5b6dTHPwU3KXJCW5xAA7F+6lUmeNHrIUAmPsaYnoQGuBKK7N
         PBevSzQOit2ovZDiwLyw9fV+cly0UjFBxcbShvwa58I2nCwwPaKiXrFl9a6hCXke3Tvz
         o3j2EqjGlcLZoRf5kAzOW8vDumd2l+QaCyQ385b1oJlwAzTiRM1r+RNuFUKgJpJ5lBKb
         NSUUQu2fPUwseCbYuddDjS+3YjrScWOf9I4FW6He5xZZl1M7gKwjAbaCJ2O+pYxRclR8
         4DWV5JxGZkxtbTXklsRLMgyHaDqsKS9p2lvEhdWnVtdMn7/bRW9NGsJ2wbSotXffRoiL
         G2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771575502; x=1772180302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vT1vNk+ignNIrARqY/24E4GTmpP0zmMbEtNGPGXPf3U=;
        b=hZIV4Wrw21w/br9H0PzLy+PK4VNvI4GVYVd5ksORLaTkhIkWA7hMyUHQjeCdIGq8q+
         Zvuq5g23V8nOk8Etnnxrt1Rby/IFzTJdgJsTHD8h+KFnUJRVnDEc7VX8dYlhDNvNfpok
         F3z19y0CbiGLfHTSGZGWd+foGJBc5beSzZ9d5RJgWe/AD/1LZwFxSmwFjmfokJv4+e3m
         QymQwsDRos7ZSd5lGjh0/wQ26/50iwO5FOuMkcf2DGXt1jElFBoQEna1AAYKIwvYAv89
         4Ff+NCLuzMeLH6JEA6bxSN5BuSz546KYXIIvCsmgrVnCLeJhWC0OuDdWCEGpmT3YUAxI
         84Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWu1HV6Iuc7f21dth7Jg8SSZxskSwl1+YNycmiuEWPFchMsAk7/yssUQtsXplzS7awMqpYN52wfYyJgM34UGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz97LYSQD710hm9095ohOXyCJSnXfkWN18NeenvwTTp15rYNcMQ
	GWK/4HYn8Eu/sRFT/KS5CU0BvRmcWz1r1heXQ9GusxMB2jTyLI5iM/NcT5aVYh508pzoPhEYnyc
	+EJC/3nvs5JIHV55DQA==
X-Received: from wmjs18.prod.google.com ([2002:a7b:c392:0:b0:482:dff5:2424])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c3:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-483a55343c9mr16652245e9.21.1771575501977;
 Fri, 20 Feb 2026 00:18:21 -0800 (PST)
Date: Fri, 20 Feb 2026 08:18:21 +0000
In-Reply-To: <DGJKZHBSGKKF.2S8URAVPODWJP@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com> <aZLc0YMHd8C0bVD2@google.com>
 <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com> <aZLzBP_v6JlTR9WB@google.com>
 <DGGBVOL5XZ5B.NIXE0JCEBJC2@nvidia.com> <DGJKZHBSGKKF.2S8URAVPODWJP@nvidia.com>
Message-ID: <aZgYzbsVr2uKZUOP@google.com>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 20, 2026 at 03:38:46PM +0900, Alexandre Courbot wrote:
> On Mon Feb 16, 2026 at 7:52 PM JST, Alexandre Courbot wrote:
> > On Mon Feb 16, 2026 at 7:35 PM JST, Alice Ryhl wrote:
> >> On Mon, Feb 16, 2026 at 06:36:29PM +0900, Alexandre Courbot wrote:
> >>> On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
> >>> > On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
> >>> >> I/O accesses are defined by the following properties:
> >>> >> 
> >>> >> - For reads, a start address, a width, and a type to interpret the read
> >>> >>   value as,
> >>> >> - For writes, the same as above, and a value to write.
> >>> >> 
> >>> >> Introduce the `IoRef` trait, which allows implementing types to specify
> >>> >> the address a type expects to be accessed at, as well as the width of
> >>> >> the access, and the user-facing type used to perform the access.
> >>> >> 
> >>> >> This allows read operations to be made generic with the `read` method
> >>> >> over an `IoRef` argument.
> >>> >> 
> >>> >> Write operations need a value to write on top of the `IoRef`: fulfill
> >>> >> that purpose with the `IoWrite`, which is the combination of an `IoRef`
> >>> >> and a value of the type it expects. This allows write operations to be
> >>> >> made generic with the `write` method over a single `IoWrite` argument.
> >>> >> 
> >>> >> The main purpose of these new entities is to allow register types to be
> >>> >> written using these generic `read` and `write` methods of `Io`.
> >>> >> 
> >>> >> Co-developed-by: Gary Guo <gary@garyguo.net>
> >>> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >>> >> ---
> >>> >>  rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>> >>  1 file changed, 243 insertions(+)
> >>> >> 
> >>> >> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> >>> >> index b150743ffa4f..6da8593f7858 100644
> >>> >> --- a/rust/kernel/io.rs
> >>> >> +++ b/rust/kernel/io.rs
> >>> >> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
> >>> >>      unsafe fn io_write(&self, value: T, address: usize);
> >>> >>  }
> >>> >>  
> >>> >> +/// Reference to an I/O location, describing the offset, width, and return type of an access.
> >>> >
> >>> > In the next patch you implement this for usize, but here you say it's a
> >>> > reference to an I/O location. I'm pretty sure usize is not a reference
> >>> > to an I/O location.
> >>> 
> >>> Methods like `read_u8` use a `usize` to reference the location we want
> >>> to read, so aren't they in that context?
> >>
> >> Oh .. I wouldn't use the word "reference" like that. How about "index"
> >> instead?
> >
> > "index" looks more accurate indeed for something that is not a pointer
> > type.
> 
> Actually this creates a bit of confusion in `register.rs`, where we have
> arrays of registers, which `RegisterArrayRef` was built using the index
> of a particular register within that array. If we rename `IoRef` to
> `IoIndex` and transitively `RegisterArrayRef` to `RegisterArrayIndex`,
> we now have an index that takes an index...
> 
> Besides `IoRef` is more than just an index - it is also an access width,
> and a type to convert that access from/to. Would `IoSpec` and
> `specification` be acceptable?

Not using "index" make sense to me, but I don't really understand how
"spec" fits in either. How about "place" or "location"?

Alice

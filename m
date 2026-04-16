Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706086341
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322790; cv=none; b=B5Y7N1Np4WCern6uXb97ZcIwfdlf2+ds8MWEvpUVxDyFMkqRCyXBDHJLz/9amrSQKpmGbiTw69YUmfXAPOIXY75LrhPalAmw/CUcWPJfcCWhYpGd0ExLfkwZiFvBc4Jx1mTkdXwQlh983Bs58asVKgpHnWB89CWSlqiW/Ebx6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322790; c=relaxed/simple;
	bh=osa/wtOqVSu/A+mS8MJxXf1eJNAapoVRgn26WEjvBmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NeG6AdGTr5IYCYtzyny0QTEGS0ieDaVURam6YxWg+rNTpVuhY0i/UhvvpEuoekFDAkEXJxmFVRSvSWcya3Id8TITwYIWfkIHMakUHzja9uEddI8cpPjdK6gPb4/dnvBtBo6FK+FqgINzjqNgk6Uy+A7igMoPR/pOGkIO12SsSPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pebqwl4w; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pebqwl4w"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d705eaa64so5757818f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 23:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776322788; x=1776927588; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5aFmDnuvFPblx4c0gjd64DFbv9jYF68Xx/BpImY+Xk=;
        b=pebqwl4wk3XglnhLiwd85MS0nfs2OvZkLwFUiOyRdfwCQYRp28wc84LQakIyjxa6qj
         jUAI0tOuboI9CVV2NBl7fJS7MJz9v1DO3WZuw1Ol5jCK78fRIHvkH/mFGu7ZaSoIAvfF
         zefjjs03znlvg1pD7tgpwmH+mWKYAburd5Rcoa1dosUhWB+fuAHCMAhesdu5q8I984zR
         YywXPuHmRvETT/9FMnzi2aDTqfoCgUaIGRY7Gk6ldOBl6b89irSB6NQAYXkt78RK7A08
         HJrnDqANwt3uCjqphW0lFqVB8MoMs57KrW4RsJHGtmfFE0d+TU+oKgX8aAQiXQRk4REJ
         n9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322788; x=1776927588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5aFmDnuvFPblx4c0gjd64DFbv9jYF68Xx/BpImY+Xk=;
        b=f+1KrSM6to20iUdlBNe39fOfxCepxB9H4W3f7JPNZ66Vp7onBthLak4xU+qjqYbMwg
         Zq6+G1N5eEey6+Lor/idEbaNh7q04sH4kdI2Ycgccm5TYbxSh6p16+Gf/ouvM1kgERQW
         LxldcaWvXJf7zDOaNmaRgozEUPWeLoBWhmd3ssCZH+871o9a2sUUTn3lgmx1IosbTPaZ
         OpWVS3QXtBEDDschu9iL8g8hE67kBRLEsTp2Q7UzymLAaHcLjGmtzgeGP851XGjbuZMY
         cIoy9LwwMkR7K5+wyLrHXCb8BhsM6SGgBhNcz3GqwlnRafKkdKzh6uidLZYWkZ4MdIyM
         q0og==
X-Forwarded-Encrypted: i=1; AFNElJ+iUPaH64yM7Ttf1axcJomlYHmxJ3maaz9TGOnA65y/tkRnXE6ZKoTxlEcE2WcA1dWuf/E2kqfpBfhNlXDs7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw7cbvFiVn2ECnh4rI0NIl+PkIY4iOCMvxfV7BB0iVH9afe654
	8MsS/1N0h8RKsF3lTm79PR6f16yYK5JrknKDVDjfegUWdGw2NKkZs7u0IKEXUjo2o4uFV7L5Qoa
	2aT7a9iQ9Ihob/f83jQ==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:488:e127:aca1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a415:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488d67bf7c7mr256452475e9.4.1776322787516;
 Wed, 15 Apr 2026 23:59:47 -0700 (PDT)
Date: Thu, 16 Apr 2026 06:59:46 +0000
In-Reply-To: <aeBM8fTW46H9RNg7@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <20260409-bitfield-v2-2-23ac400071cb@nvidia.com> <aeBM8fTW46H9RNg7@yury>
Message-ID: <aeCI4giN1TEL_uJn@google.com>
Subject: Re: [PATCH v2 2/3] rust: bitfield: Add KUNIT tests for bitfield
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 10:44:01PM -0400, Yury Norov wrote:
> On Thu, Apr 09, 2026 at 11:58:48PM +0900, Alexandre Courbot wrote:
> > From: Joel Fernandes <joelagnelf@nvidia.com>
> > 
> > Add KUNIT tests to make sure the macro is working correctly.
> > 
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > [acourbot: update code to latest bitfield! macro.]
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >  rust/kernel/bitfield.rs | 318 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 318 insertions(+)
> > 
> > diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> > index f5948eec8a76..9ab8dafff36c 100644
> > --- a/rust/kernel/bitfield.rs
> > +++ b/rust/kernel/bitfield.rs
> > @@ -489,3 +489,321 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
> >          }
> >      };
> >  }
> > +
> > +#[::kernel::macros::kunit_tests(kernel_bitfield)]
> 
> Reading the Documentation/rust/testing.rst, and can't understand how
> should one configure it to _not_ build the tests? This should be the
> default behavior.
> 
> There's half a dozen already existing unit tests, and I didn't find
> a mechanism to individually control them.

If you want this set of kunit tests to have its own config option, then
you can declare a Kconfig option for it and do this:

#[cfg(CONFIG_MY_RUST_KCONFIG_OPTION)]
#[kunit_tests(kernel_bitfield)]
mod tests {
    ...
}

Alice

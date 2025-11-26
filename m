Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABE299ABF
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764164176; cv=none; b=bkBjhB88b7kOgKBGSfZHkR9i//o+Jb1XQuYaWG9tOZMcJbZ0An8ICcVOvi24NnsJhQhrPn6HS2U7+jx2ZF7cZUmzrtB/ic7xFa7KUI98aFKwUnd5dM9a8hYYttI3I3P+91MHxtYEiC0Lcj42gUNkpYTL+IxcxSSRjk3J6BFJRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764164176; c=relaxed/simple;
	bh=Q6jMTc5YxTG5bt+aP6gHm/pR13wIgVuPqr1uOjrePl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wb9RPgFgoKTpDFiiHBO1rbUW6judoC6JZjZweSlH9q9q/xudBfrp5Sp4popwI4hLCQh7pkBUJXcjngEHP1UaLXD3F2ptJyUe6Q7Zb7+5hisOUDT9y5XgAB7HdhxXiyZc9UH1emSLGOWEuR+lCAah2Sm3osMSBFs1YHIrpXdqyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u5gjN1Ls; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u5gjN1Ls"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a0ddd1d4so61145145e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764164171; x=1764768971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8o5oQFKTnZYDsBsx/PuxZXI29/RuyX5KMdnVdIm3yc=;
        b=u5gjN1LsBrZ2rOCJoB0OEDs4JtwNN5RMspaoEGSvhxe33svMcXm2eSMBaNBKnIdJqS
         9IvozIcvCnrAeSqpMn8iUEaHJUQoAjTwEiXAAX5A7kS4LDyBINjom12x4RKqCDKiDzN5
         jVNqFG7DmbSQDR+yx9WtLC+ZzQGeN44MAvqUSR3VE1bWFbTZMLTRmQk6yyEGgt5yglH+
         Gzs0fym0X9S5R4m4eVwb0pn/ui1PDBARI1VwZ2e4iLVW8Wyz3zyUtCGXF64PRxuThz0+
         pXjjXh6+uzX6TYf+1VdASiffQj9bS02aewYfn+O+ID/JcSubW1FzoK4+plVWvLZOfI5k
         V8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164171; x=1764768971;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q8o5oQFKTnZYDsBsx/PuxZXI29/RuyX5KMdnVdIm3yc=;
        b=ZH5swnkwjqgw6hnD9UGWU93wGTV5T4GKw+LGekaMSAiYnfpGWj6DvWh8E+kuYWvk3m
         SasVdErxs65heQkGZG9HOt3ZqvtiWEeryQMIHj6CBq3PJ2IlfsfrCrHv+5aoc5Mygz/C
         zkzjXsdqmGsZpL6kNJEubal4FCz2j/TOEieFdmOOJv8lo7dA3qp2ZMxZYAlzo9fHbP3x
         BXwtW0VNC6u6lFurIls6W2X3Mrj2f+2V0uUpcrPGM6PxJljmCu84sOIB2E8XnEbsoOCq
         5cdaiuXIBziyJnv/XbiXjxkYsbpyyIcOy7xqW/ICA2SoN5TBQ//VskSBJnJHgE8ETeAa
         7+WA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Kp0jB0d78J6Ir2L9oQWXxfhEZoCqEFea5GuJggvbKzKWuHeUYJ6+DVTgMX4k0kMejTNYFtHEgSYCiv8o9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxF7xASVnHpwhkuCQIHqMRdTu4CgA9W/VXWScGPIcxk8gkVJg
	BmBpkML1e1GgJ+Jw+DKl+zg3wm5TffRqrbvEZs0WxJPX128DvBTvY8YjKMHbugnN3qidLtRq+R9
	mk6hp71Y+6QlT8XQz2Q==
X-Google-Smtp-Source: AGHT+IHen7o1Czj6RjgQRXRqkTbhtMnJFEarMgnQPY2qznUW0hQvxakckzeXCkXRtdO8m2SgjikqhLj8GFnp7XM=
X-Received: from wmqh18.prod.google.com ([2002:a05:600c:3512:b0:475:dfb5:f4be])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350e:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477c10e2a64mr169973505e9.13.1764164171266;
 Wed, 26 Nov 2025 05:36:11 -0800 (PST)
Date: Wed, 26 Nov 2025 13:36:10 +0000
In-Reply-To: <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com> <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com> <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com> <aSbOWhKIpCBm0NKL@google.com> <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com>
Message-ID: <aScCSnRIsRjLrccU@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:22:14PM +0900, Alexandre Courbot wrote:
> On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
> > On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> >> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> >> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@=
nvidia.com> wrote:
> >> >>
> >> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourb=
ot@nvidia.com> wrote:
> >> >> >>
> >> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> >> >              return Err(EINVAL);
> >> >> >> >          }
> >> >> >> >
> >> >> >> > +        let aligned_size =3D page_align(size);
> >> >> >>
> >> >> >> `page_align` won't panic on overflow, but it will still return a=
n
> >> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which =
let's
> >> >> >> you return an error when an overflow occurs.
> >> >> >
> >> >> > The Rust implementation of page_align() is implemented as (addr +
> >> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on over=
flow
> >> >> > if the appropriate config options are enabled.
> >> >>
> >> >> That's right, I skimmed its code too fast. ^_^; All the more reason=
 to
> >> >> use `Alignment`.
> >> >
> >> > Alignment stores values that are powers of two, not multiples of PAG=
E_SIZE.
> >>=20
> >> Isn't PAGE_SIZE always a power of two though?
> >
> > Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
> > It sounds like you have something different in mind than what I thought=
.
>=20
> I thought we could just do something like this:
>=20
>     use kernel::ptr::{Alignable, Alignment};
>=20
>     let aligned_size =3D size
>         .align_up(Alignment::new::<PAGE_SIZE>())
>         .ok_or(EOVERFLOW)?;
>=20
> (maybe we could also have that `Alignment<PAGE_SIZE>` stored as a const
> in `page.rs` for convenience, as it might be used often)

If you're trying to round up a number to the next multiple of PAGE_SIZE,
then you should use page_align() because that's exactly what the
function does.

If you think there is something wrong with the design of page_align(),
change it instead of reimplemtning it.

Alice

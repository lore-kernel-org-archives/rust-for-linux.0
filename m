Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966C2D5C86
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536530; cv=none; b=nDci1q+tg66XWqgaqumKuS7d3i4275TV8F51dsUZxbI5DpkNolSLH5X0C+/+YWJ3pUWbkKB5LirpLgo/un34eGE5bbBqQ29S4iUvpHrrRDNlgQviu9NMey86u0p9ftGC6taxpWub0nbqGheEgECRVc7gjvs0NaZR53AJf5DHPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536530; c=relaxed/simple;
	bh=dTgTTekmxvYFyU1wf5c+kV3AYkcY9Wjc6oM0kcxyHp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyP4xHuILsJb8cTGm/SfDrQEbbgGIFE5PQOvDoQX/tth/o1mK1tljDH09XEJ1bbyqAu/4zR9herWmB2pp3F7PFjCAIoYZvRxdjQcvfuEloLDfY+yAjvqXIU9c6BddFXRn1BKmOXHr250OAo/Y25hzU1h8olf+Dif813xLe4qPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2ClzqLI; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2ClzqLI"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b31a665ba5so23640885a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 23:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763536528; x=1764141328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RztZt4XiHVQAhFDtWIn/8/R28dG2GfiQhQXwxaBFoHk=;
        b=X2ClzqLITxLV5kGEWzaKSy39bKMFyER8JBGNVERmXzG5JmZ9V7JjkbPQEAdNpwOMco
         cn+fE/9N55JQMHgZ1+rYgKXXqMAwKWYhqRbEtOgjZ53QiOzwQ+GD4ZN0yNTys8qbQLBN
         9OZU94J378tMVvorvL+eLiMzg96yqqr3vEoDUMcvC/pJbFcR6XONc5NdihApu8aNonIa
         pF86B5BuZX8i3Jz8+BHYfECbntcTVLRXVryQJhVjYh4vrjy3jeXLAohqEq0VqcJRaGBc
         6eZUPaL/Qd6cVfQMUSmLCh1k5zAeEwoI+vtUFTW2AIgz1YpyyWX/EWN7DgCk54sLEiWt
         hFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763536528; x=1764141328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RztZt4XiHVQAhFDtWIn/8/R28dG2GfiQhQXwxaBFoHk=;
        b=whvoIWUz+piXqiK83/0dsOxRmwUg1MakLU2rlETqbI/pK6DhZ5erplxlda6kWI25O5
         mb8wr2l6LNiWOCbmRV8Ced2XbGkYvtXSfEs14yAfNVW3RC9nu53EvVUgBrKOnQyzbYrA
         U3CM+Ls2IgWPtSnhRzSahCSr3d9GeP//keQoK913iegKkX/zpFz54R3uwttqahdHXSn5
         WQsP6EIU8UlT/95gf0UXTENzgD/DS1c/+Lb21zEhSri7QjJ4MAoUOmK/KriQSuAu5QEm
         +LVNf69BZVZbxV1DtEiNOQIsI/TwHLN1GbdyjxdKJUF+1zJbKbl606lGv8ZutMnmPdoH
         hvRA==
X-Forwarded-Encrypted: i=1; AJvYcCWVkza1ciauTlqwlK3xpstz7ZEOXP5xWIopzxZAkVFaCeFtoHiA80zYRUHrMHpP6Jzs5U9u1PZz5ExUDRkQzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YPbmMeye/oKZYgXj3Q/7fNEjQzGKjb+L/eWt1lFg8mhdBmr3
	tp2ueQVDxCsO/gfDaNzRcxuqMuogXPOmPK/TUxkZpGShrQJSjgLs2756Kt7bG2a3Pc4x9uB2ubm
	Cf7yECWgHO5VMt+blimiNcKvsDHvxHDI=
X-Gm-Gg: ASbGnctNT01RZXKUeGsayhH7gzhDJvQBPmhqhaoC2NGJIan9avKYgMTJR9OcGKQILXZ
	ijAzyblhKd72WuiXOIY03qcx23cwlBLrTAMMemi/iHec3zd5BSnN7dBAv9N8eCj5xBawEdPAhT4
	ncz/TgCzFS+rV4Vbp3ZpCmhk06yDa31ey8KPKKeMhhyqfm+phuEsVKvd/9EgUbUmLGHnlOF2DK9
	c/6wp5J1CIsosSU0rXucSHtwlvh6vFt1memYHJhzAGIR87nKBZ+wiKWOkjT2S234h1WKeTx7ee5
	tiW9
X-Google-Smtp-Source: AGHT+IG3QDknExP/8mIQtUFmNmcMUX1vzTMPVwUQ0aAeVW3/Zos4M8agM6ps/VGUfva3me6w9arUYBckgCDdieDTCzQ=
X-Received: by 2002:a05:620a:284b:b0:8b1:ac18:acce with SMTP id
 af79cd13be357-8b2c31597bamr2209229685a.28.1763536527723; Tue, 18 Nov 2025
 23:15:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106035435.619949-1-jhubbard@nvidia.com> <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com> <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
 <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com> <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
 <ff7f82b7-d812-4ccf-b5c7-263f0baaac3b@nvidia.com>
In-Reply-To: <ff7f82b7-d812-4ccf-b5c7-263f0baaac3b@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Nov 2025 17:15:16 +1000
X-Gm-Features: AWmQ_bnHxY6TQMxiEW7Eu-Igfx2YIxLCLAdnQpZnqsMumZLTkRG6wcMLwie2xEY
Message-ID: <CAPM=9tw=n08NhAdFNHV7k=1CKz=nHPxu2bcXuNX8ObjAg1u+Kg@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 17:08, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/18/25 7:15 PM, Dave Airlie wrote:
> > On Wed, 19 Nov 2025 at 12:46, Alexandre Courbot <acourbot@nvidia.com> wrote:
> ...
> >>> Maybe let's just do the long lists of chipsets for now...?
> >>
> >> Yeah, I've hit this issue as well. The compiler might remove that
> >> limitation in the future, or maybe we can craft a `chipset_range!()`
> >> macro that hides the messy casting, but this exhaustive listing also has
> >> the benefit of forcing us to consider every critical site whenever we
> >> support a new chipset so I'm actually not too bothered by it.
> >
> > I wrote some macros in my nova-core-experiments, had
> > chipset_before/after/range I think
> >
>
> aha, I was afraid someone was going to say "macros" out loud, at some
> point. And now you've gone and done it. :)
>
> Well, I think we probably want:
>
> a) The ability to clearly specify a chipset range, and
>
> b) For extra credit, maybe: also be able to specify entire GPU
> architectures, and architecture ranges.
>
> ...again, without too much extraneous noise at the call sites: the goal is
> to read it easily:
>
>      GA102..=GA104 | Architecture::Blackwell
>
>
> for example. Macros are going to require that to be less clean, but
> let me poke around and see.

https://gitlab.freedesktop.org/nouvelles/kernel/-/blob/nova-core-experiments-fsp-boot/drivers/gpu/nova-core/gpu.rs?ref_type=heads#L96

is what I did, but yeah probably not going to get nice ranges like that.

Dave.

Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C33139F
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 02:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715049224; cv=none; b=uCIhIzVd5sWVVPXIPqXGCi8aY7xJHQMk2nSdxP6jPNQwU5LN4JzVHui1hqtwEifUFLNnthJsnMGznGohIua/C7y4FZemXASXzaGsM3T4BLUkTyZ3sCmtaVRyJIxkz29Yuj/tvAN+fIujlBpzN3IfALYdioOuAV8N2lV5gNVdn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715049224; c=relaxed/simple;
	bh=cy0RnY+sEmubLwznltaFLcyAjMBvue6vqOQLVzazx1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQYYajf8lE99Mb0Y7cfGWPh1B9zCd193fsCVyiR851zCmT7C8n84azApeseB4WcJvgj4fvkOLl+BaXuilB19klSA5LrVonkMTxxNWWAwwaJ16cvk5v8IpNz6Dc2G2n9BCA2L9bukrFApDAUQiH4a0NcDQVEFWJkojf6APQLrASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWU09ps6; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWU09ps6"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de60380c04aso3230386276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 19:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715049222; x=1715654022; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B7DocpVd9pCf0JgpqP84BAvtKOiwCB6k5y6br9f2i54=;
        b=ZWU09ps6jF8kajunx6Fc4LZWympYHxg2HihZd34Uc5d/goYTwaNSGNMCVkg9rP5GIo
         EnHhth000o2bRjefoQYbrsuVfHDfAVXP7VaEbIcojNqKLciljdgNksjvtYsa5tmHNlKL
         3tMlg8Op4vGVK9BLrDPMVHWG0jDolKqQWQA8VfUYSd5/Op/6AawLyWBoMyhz8EsDs9hH
         Um9QWgnax+GCu9RodQtucx4VMaWVrECHi2NZC5e3g/+zL7FDz+WnRCshaNMm850LLayP
         ndKshv+Q1oBpcNOPGmKxJq8yOEyIHF0NdLm44bKP28FurkjQZYVjcqD1Ybcnz9EtJJcE
         iUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715049222; x=1715654022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7DocpVd9pCf0JgpqP84BAvtKOiwCB6k5y6br9f2i54=;
        b=QAdWCvt30bhHeszszA21WCKEuB57PUCpyBnKpugGFl/0VMRXDTdTJBaaFdfwcsmz2E
         UOJYOf0HGw/BfoxaY2E0wutOeKXj8Q1+kpJSV0HPEEL7XMZH6imelYMzNVrfLpMGbJ6z
         otkRgyCzIXnkncCwWii0hpLFBEtYXluT6//cq4WU4kNyq39GT8gBHpgbwvJ1jOzkqYL5
         OS9eUQ0F9TAb+z648IfKe5lgb2ZMce/QgwplaR/zE9VmVgWJ8kMZvZW/pHVnQthp0nj7
         0iYBIlrs9qlTPVISn1HrGxfVpChky1nFr4TDRavR5ikzMFgvzNXKi9burdl7FRMqdmMg
         DC4w==
X-Forwarded-Encrypted: i=1; AJvYcCW/0B82xaoWvWRE7B39YqCcgAwU9+zcaUc3bZ7GA53dU25d95UJdZRgA1oskMsHHxDV1wtREw3ZZyeF/bcEs/seSuR/c1Ddx6QYSCBzEyA=
X-Gm-Message-State: AOJu0YyburYES1jFrjaxPRluTvjBWmQG22uikdHuKElFqJaw9MVvGsAG
	PD7bGPtOZ3I9crTW/4Mzk+UACIlK0ZaatS6aDeWpvWRrMIIYvOAWRkfgrVbrFHcgJd7KbzQ41PB
	7EDcua/eGEChXqxBBTQy9gXXl4hs=
X-Google-Smtp-Source: AGHT+IG3LJk1zvaoP0RA/45Hv7583f5Ec5vxzt5UWa9idhjYhz8o8WvPdDm1P3Kfvo+6qwIwJjjZOlWbPswNrfBvbSU=
X-Received: by 2002:a81:92c1:0:b0:618:ce10:2fcd with SMTP id
 j184-20020a8192c1000000b00618ce102fcdmr12330395ywg.26.1715049221973; Mon, 06
 May 2024 19:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com> <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com> <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
 <CAMwc25oNYPkHTm2NoCiP2Yc0K1J_JVPpv3gS5+9O2kwveLYgCw@mail.gmail.com>
In-Reply-To: <CAMwc25oNYPkHTm2NoCiP2Yc0K1J_JVPpv3gS5+9O2kwveLYgCw@mail.gmail.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Mon, 6 May 2024 23:33:31 -0300
Message-ID: <CANeycqq6KBqBiX-ckm9MEGW+JcynvjAw2TJa0K2-mGgN5snZsA@mail.gmail.com>
Subject: Re: some aside maintainer advice (was Re: [PATCH v3] rust: alloc: fix
 dangling pointer in VecExt<T>::reserve())
To: David Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 May 2024 at 21:36, David Airlie <airlied@redhat.com> wrote:
>
> > On Mon, 6 May 2024 at 12:22, Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > On 5/6/24 16:11, Wedson Almeida Filho wrote:
[snip]
> > > > I still think this should be an `if`.
> > >
> > > Is there any benefit using an if here, or is that your personal preference?
> >
> > Readability.
> >
> > I don't remember ever seeing anyone implement a != 0 comparison with a
> > match or switch.
> >
> > But if you insist on innovating on what seems poor style to me, go
> > ahead. I'll fix it later.
>
> I'd like to just respond with a bit of maintainer experience here,
> please try and use less suggestive language and more requirements
> language in reviews if you want to see something change.

Thanks for the advice.

I don't want to be intransigent though: if there's a real need for
this to be a 'match', I of course wouldn't mind it (though I don't
believe one exists).

> "I still think this should be an 'if'" allows for disagreement and
> discussion, but clearly in some cases you want to directly inform the
> patch submitter of some maintainer requirement, I consider stylistic
> preference one of those cases.

By any chance, have you seen the thread that precedes this comment (in
v2)? In case you haven't, check it out here:
https://lore.kernel.org/rust-for-linux/ZjFq1uVXi4k1jjQc@pollux/

Between sending this response and sending a v3 that completely ignores
the discussion, he waited a grand total of 16 hours.

> If you are in the position as a code maintainer that you say "do
> whatever, I'll just fix it up myself later", it comes across as
> passive aggressive, whereas you could just have said that in the
> initial review,  "change this to an if for consistent style" or
> because of maintainer preference it leaves out any ambiguity that you
> want to be see the change in order to merge it. In my experience most
> contributors will just make changes and move on, and are happy with
> less ambiguity.

The latest exchange didn't lead me to believe this contributor "would
just make changes and move on" (as you suggest above), so I had two
options: reject the patch or accept it and change the style later.
Since I obviously want the fix and for him to be properly credited (as
he deserves and insisted that it be by means of his own commit -- see
the discussion in v1, of which I wasn't part), I chose the second
option because Miguel and I want to finalize the changes for 6.10 now.

> I'd suggest if we wanted to establish conventions and rules around if
> vs match we should hash it out on zulip and update some docs
> somewhere, or we can just leave it as is and have maintainers state
> their requirements to avoid ambiguity.

Zulip? :)

Cheers,
-Wedson

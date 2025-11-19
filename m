Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CCF2DCBE0
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522157; cv=none; b=k8TYI4FhOJI3dx9UvJNKDWOEC7VuhaVM1+Fo/JIMI9/shAbY+VGvNf77RUtRHDtfy+5yloLIzqVbN8BZ2tjCv6QGpBUbpo6lfWk48wjbKb88d2YMSwmrpzFn6Myqst8/tx0qs1d9+TVLsVHnUvcHzvED+OyTOyugHZJh5sX8wlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522157; c=relaxed/simple;
	bh=TwNYHe8MOOZkGWLDPYZO63Ib5ji71hB/aJklCQrDyvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nr6iTfn62I0MoDy2LaPdME9P0BGjQ38uUJQoM89Yk86AvOPqoWg5+oSjl2Cy+UkvvHHq5SFjSAx6wDMiUYkRwloY4brlLCpYJOFPY4giTxXC12jfkE/7CGeLZmxKSIQ0fIiVyssoTs4IPPFnD0ZJ7nUarAJFWVlu3lZRbO7cBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsGZ32H/; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsGZ32H/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4eda6a8cc12so59238961cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 19:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763522154; x=1764126954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdkFpA9LcDgJX0rBlic+VP+aw8vNvuzktSwkK96kTPE=;
        b=OsGZ32H/dNBNlpe7fT2sjenSailMk2JW90G3rEJjYOutd3IIePfU9Vnb/hGTFLXiVL
         +IydXiHo3ZGFaSTHZtpuWIcMQFYo9jWI/fio2pScz+0UvMh4V27xitsjsK0yQATZL8Kb
         GCzFNpOT1Ocvrlmh3+EzoKbZG/yiaLg/JJCV9kK9Nbw0XaK6WPjh4NVmmOr/EynEwPpG
         K01WC4K2Ps3YsX1f48V4ETmriuvZkwGHf0P/T7kvyOHCkncg4q4ES9t8Hidp7L7HHg2O
         9UThwcQu/kqekxaMyU2qyywfFnH5/6dLa88eJ0ELsvuYpFoAu43kUyPfsKKev6Z3uROA
         a7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763522154; x=1764126954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdkFpA9LcDgJX0rBlic+VP+aw8vNvuzktSwkK96kTPE=;
        b=LZTTMRfSnKJP5ZEaKRPWCzBc3HxwbE+6n4KybZ10qsFOoImaZyo/FXBl58nlKnZVY+
         4yrhEYE74h1Yq6uJ1Yzm1eSYWjaCfynVBrBhU0vwE3aXW9W8VheuBRp6ip0d2WfpDj7y
         5bnfXllpY9W9YVztWi3Ux4JO5CQQF3+LF1XS/1NaPHcC+I0220Asxe4NKfERXGVfZET6
         /WBbaO/sorPnNea05rbHkXajcnTy4QPCV0j6TnGeRCf7w8iUSNkqfF74mK/QeE+FqOta
         NQmLGeX+iOZ8a00+W3k4ay8I65vyRDhhwiysWV8WUupo0Qy4N1+Ls4kSbHwnWqAOv3KQ
         5bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Zy5YeRG7Q7grxDWFe4OxubBJijxz5zOnVFzub2CWslm9h2JutXOXevy15OB7Iy9JU+wTGtcPqdGAwTMrXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKuOSLLgPMa0JLXDQHCNOM6LJqcmPyg60rxSk91ZagB2K5Gue
	ObCLdCJOwskeMglM0xr5l6GWsRNZU3gaarnJD/gH9djJUuKHW+Ma9tiMl66bbAXZR+CSM8qIGlf
	/oo5/SYXL64SSFl7oTtdI+x0is9ydgbU=
X-Gm-Gg: ASbGnctDTYldctZaffUFcXpJFpz+uRi+GmnBlx0ZiWaDPtSadT3UswVTkbNT5mfaxIp
	UPTZComngJcIEe2BSQRBrBQMYvXE5f4WkW8/nJPxgJo3q2aFSl8b5i1Ep47gIz3QfNVVILMuVuM
	Hp3sMPU4WQLfESko+kalWXdyVpd2/wDQExhynxkDKVGVsTxPmTEZIh7sB1K5PP8txVJi3XWjod9
	/7FU/gT3Tn4GgZSQd99ah+UonlrNEkF0UtGZRdppvUjNyT49Yf7Qrno342bnzkVwaqEYA==
X-Google-Smtp-Source: AGHT+IGeDZHTrPjqqdp3o3sxjOKCtQBz7sj/TpB6Z6nlFrDNsPxslnJOd859WIU5BNxRnzFzEuPJZ0Xqs+h4S1i7AE8=
X-Received: by 2002:ac8:7f51:0:b0:4ee:1c3f:ed27 with SMTP id
 d75a77b69052e-4ee1c3fef41mr122957391cf.17.1763522154435; Tue, 18 Nov 2025
 19:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106035435.619949-1-jhubbard@nvidia.com> <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com> <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
 <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
In-Reply-To: <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Nov 2025 13:15:43 +1000
X-Gm-Features: AWmQ_blBiOF3xgOhXiBt3avEraQ-3HOhBcxTdL-0cZbCju_5ZMqtH5u8L8OOHUE
Message-ID: <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
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

On Wed, 19 Nov 2025 at 12:46, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> On Wed Nov 19, 2025 at 10:46 AM JST, John Hubbard wrote:
> > On 11/6/25 2:24 PM, John Hubbard wrote:
> >> On 11/6/25 6:44 AM, Timur Tabi wrote:
> >>> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
> >>>>       let hal = match chipset {
> >>>> -        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
> >>>> => {
> >>>> +        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
> >>>> +        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
> >>>>               KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
> >>>>           }
> >>>
> >>> Maybe combine patches 2 and 3?  Also, maybe this should be a range check, instead of listing
> >>> every since version?  It seems like everything past GA100 uses the GA102 HAL.
> >>>
> >>
> >> Sure, I can combine the patches.
> >>
> >> I'm not sure why I've been wary of using ranges for these arch's.
> >> I'll try it out.
> >
> > Now I know. :)  Unlike C, Rust does *not* like it when we try to
> > treat enums as integers. Casting or other (messier) approaches are
> > required, and in no case is the end result a more readable on-screen
> > experience. At least not so far.
> >
> > It is possible to mix in Architecture (Turing, Ampere, etc) checks,
> > but I'm not sure that is worth the additional clutter.
> >
> > Maybe let's just do the long lists of chipsets for now...?
>
> Yeah, I've hit this issue as well. The compiler might remove that
> limitation in the future, or maybe we can craft a `chipset_range!()`
> macro that hides the messy casting, but this exhaustive listing also has
> the benefit of forcing us to consider every critical site whenever we
> support a new chipset so I'm actually not too bothered by it.

I wrote some macros in my nova-core-experiments, had
chipset_before/after/range I think

Dave.

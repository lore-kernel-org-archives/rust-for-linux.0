Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C265B279DCC
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130136; cv=none; b=XlyKWtvF8X4NPa6JPI27ggaBBgp1bZ4+aIEuN138B5vNM0XFQ/o50QMNpP6dYku3MAeNb23x+vXbEv9YTo2+FNExJXiupsMvkMT+Y7bXy+r6Zh6QrdP9XPNGFza5DVjjl/wlmsgJWnu0/HeNn7Z/9ZW2rZUZAXaTykSQQQrER4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130136; c=relaxed/simple;
	bh=gsFKplm+aAGN2TTWLd5cPwWGFcZzpqzKphldaJZG+ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KihvluongUR+Yl8CI8nGbnMsdCJwEkiQk3O/r4Jqj7OewEv3II1Qs9MWIowlwTSl3GKSPGVG20YQ4j/Ep19sUx3GzDXJOkolJyls3KL2eiBa/TkFiwOCklbDxKlwIufpI/Rh3BE5kJPRtMqKkw6duYBGy0k4gmA4eYl3hgTCRZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOcHnm8w; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOcHnm8w"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bd266f6fc0so12723005ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130134; x=1779734934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ssSrwxKRBuP3dItchoNca7SeIWgJGFfcgOMVqAx4Uo=;
        b=SOcHnm8wr3GhnDlSJDYoNg/eHoF0DSQTV/nTkAJz9L/iq1BQ2SXp0fMYcVwAGiUtSC
         5sJ+2EMnrdMyeHVX1KT1fEJlM8wwt0B2K2wz5vsEuU8l2S5+B8Tkqon2kH5G5q5K+bFX
         8Yiq2sxidT/AFnlJhrhKW1DkbeKh4t93QCjR3WOSiEIJaaqsE6yNzNePe9jNB+Biqnwj
         zMyNrf9BQzirCcdTbyKOznNniMbkwBZkQ0xrAOqLdCen2yDEPVqzRoJAwnkGsQJuiGyG
         ia/wobG5TmUej9Tg6ILHX6IwMY2K6u0Uai6SF26bqRDbtg5n+mxZgyr2RXFQL3FvwoC/
         OKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130134; x=1779734934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ssSrwxKRBuP3dItchoNca7SeIWgJGFfcgOMVqAx4Uo=;
        b=VfQpAc2w9qN+cFFUZvsVCBPiIgbm4HcEpR+F0wUXlJ/Ga6rTfGZ8V5fXW0PTvMUKYO
         z+x5ZVkBXd7H4JOj+oo7ZHAYVKA99gnG/y31K7cpSzb8xvDp4Sry/uZr89hjtveYUKAg
         9GtvyWV3GcVcLwTrpsxVEu7+mMBMSC8sAL9tyUUszx2HOIh5/crqCVY1R9xtmJz7PI6Z
         Qu2yGhFY3JJ4aA6GVU5ObcGTXyL9W7wWZbGLRcrze8oBQ0N3lfhuOy44HELzMWx59KWK
         yOAVl63QzErWAh1LPAeYdldR3/bJu2vulSE6Krvx6sbBZDqtceM4sZreieahoGG26OCE
         5Qyw==
X-Forwarded-Encrypted: i=1; AFNElJ8YWnGbhlkp9i0QHlmtResfxJMAk6yQUN5ybfGUiQPhLfcAOGy61ZLligeq4V0GBAhs6DVaSoAfhB8K4tPv0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+rz1y6fT7YEbkvPd7mOWjLQKR6BJySNxGq94MaYJgoqmKgnMo
	2S2yu1Tv3gLDej12PSINdUx9KEQIF6niwLSWjkwowz5IBVs/d/Gle47WzKTGSLeX
X-Gm-Gg: Acq92OHd8QQgCztYkDePE1QFvzLDNTDwpJOJ5cBwl/hKidLdUxBsCHyOxNSKhO5N0+G
	whaf1/2yCrU0B6smXnXjyFMfp0ZewPGQHbUWT72R9rQfIyMz0Xbs4Gvo6WKH/0cMcn2bd26kwLb
	YR+NXeCttT9AkziGrObwPHiuf6l7Z74bWHwErqMxCbFm6GKX9wERSv+iZEq5bzgxbc8HtKxJ46k
	QyL0xQKfeFHLpUdsnGPXDE66UOLGlChZz/22vDv6db4vF7uZ7aa/vjHHCnkRJ7jxwGLzWq/v0Rv
	RE+BvCszjQy/NQxSEvxf2ldC8qDDZ4i5t3OVJFD6ZawKCqwjGIAPXrNshv5R/kv/sdz9Il1HUls
	GDBQd4/D9EGN75V9oG/r55yChZtkdadqmqTwTChEZMnfs8TmIrzRhi6OWtBZNDI02M0uRkEc4xT
	aoIj3FoUgVBFXfk0C8QVQ9FB7zug==
X-Received: by 2002:a17:902:76c1:b0:2ba:6ffa:bded with SMTP id d9443c01a7336-2bd7e9c5790mr132687625ad.37.1779130134122;
        Mon, 18 May 2026 11:48:54 -0700 (PDT)
Received: from fedora ([49.36.193.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11b495sm165337945ad.69.2026.05.18.11.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:48:53 -0700 (PDT)
Date: Tue, 19 May 2026 00:23:03 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: tglx@kernel.org, peterz@infradead.org, ojeda@kernel.org,
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] rust: cpu: use `unsafe_precondition_assert!`
Message-ID: <agtgD3wqjTvcldGx@fedora>
References: <20260518174414.204573-1-ritvikfoss@gmail.com>
 <CANiq72=5PUubJDYD57yhEC117tzNo9h6d=7f8OiengaExmGnyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=5PUubJDYD57yhEC117tzNo9h6d=7f8OiengaExmGnyQ@mail.gmail.com>

On Mon, May 18, 2026 at 07:51:28PM +0200, Miguel Ojeda wrote:
> On Mon, May 18, 2026 at 7:40 PM Ritvik Gupta <ritvikfoss@gmail.com> wrote:
> >
> > Replace `debug_assert!` invocations with
> > `unsafe_precondition_assert!` in `from_i32_unchecked`
> > and `from_u32_unchecked` unsafe functions.
> 
> Thanks for the patch!
> 
> This should mention that we are adding messages too. That could
> actually be a second patch in the series to make it even clearer, but
> it is not a big a deal either way (and perhaps `rustfmt` makes that
> first patch not that clean due to the line wrapping anyway).
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1232
> 
> > -use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
> > +use crate::{bindings, device::Device, error::Result, prelude::ENODEV, unsafe_precondition_assert};
> 
> We should probably put it in the prelude along the others -- the
> easier it is to type, the better, to encourage its use.
> 
> Do you want to add a first patch in the series doing that?
> 

Sure! In v2 series, I'll add the first patch that adds `unsafe_precondition_assert!` to the prelude and
second patch that uses it.

> > +            "CpuId::from_i32_unchecked requires a valid 'id' (i.e., `0 <= id < nr_cpu_ids()`)"
> 
> This seems to mix Markdown backquotes with single quotes, and then
> doesn't use backquotes in the first part. Could we make it consistent
> if we are adding the messages? e.g.
> 
>     "`CpuId::from_i32_unchecked` requires a valid `id` (i.e., `0 <= id
> < nr_cpu_ids()`)"
> 

Sure, will fix :)

> Sashiko has also spotted a copy-paste error in the one below.
> 
> Cheers,
> Miguel

Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFDB2DF12F
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692307; cv=pass; b=G/UVmg6ntniEVzX0keGMlTSP8O7vNsGIewosavUxMYF5XkGCdlLKCoTlBK1lPn+c8lLPFOONs+i4Fl86qyNPi+HoUHj8OWgQe7PuWSXZFBQ2enqK7sEZxPGLY+/znHdV5Jv0Qkz9OJ15QyTSHR6gj/b3JCNK4pPhnhV615dR8SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692307; c=relaxed/simple;
	bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiSTbxIQpMlj5YQpz35jsF+6HN3V0pgmIQE2klDFbKf9Q1ENfN2aell7pGgbiMqVauK4IHOyjswlRDRjyWP4nM90Mo6aFQPrjisRb1rILX+22w2K5keRpnlIecIIBd2lAjGNV5xvb58NywtisC/gIbNOOgjFmOMnSlLJoI/jqrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egQVyFmW; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egQVyFmW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38096590070so217169a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783692305; cv=none;
        d=google.com; s=arc-20260327;
        b=XFt469kql84UXYQ7tsGmIyd+9Zpdf3gmw1mt15Zd+LOZmh+ZXkwtzsSyqWpcfkwgPc
         GpxnEpTbjPlDkhysaLCKit5JUukC8bjPo9YV6X4TGQlgIpAoAzSaRqurxLsAHIUs6NN9
         V7NKD0xrVz+0Bno5Qp6pyb2NpfpAO+cD9nf/zAK7Irjlbw970zyiPqlVe8i3mQ/ILpZi
         qs1g25vubHMZMIuvim+8d7uaegAYNUaj5rxXejsJx2usIbNwvuvL0BX5lJwRQVfwF/t2
         +bw7WXl5bD5+X/z2CRUl8NwxsXe4TFYT86rm1G8Q+fJm8WfDefzsGaanVxFcaLyflhZO
         ht4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
        fh=Vn1UVd3/kq2Amo+3hyC8ugWN4rNjAjUDCEe5aFORvlk=;
        b=qVOlAtQQFjsTTsbpJPbUdIWy/bfIlCGgQCCFNRlrUyrg+cHC/B0TNFUd+O2AMadE30
         gvPbsC5AIulwAJozyDfS/qBKvtLZMYI2ZMr768TKXjok3lukKg0bNyG4lr0YmsHUjZiF
         jEqHrgOJ8gJj0TbcvRG22A63BRYYVSxxpCAIE4vN8FbsbiD+EPYrMXhRgz07yhSl/n/H
         XRegzYpFT5xLNrOa1KanSk+UQrB/tugGrGTTEbj1X8MdgxwMmc3EKrN5VZM+QbkBUBTw
         j4qXKrdGp/vzjekkxtt8+oRO0fCe4VGwNzbpLcwrwwMqWVehSNCWxhwfRgQYIr/Irgom
         CB6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692305; x=1784297105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
        b=egQVyFmWYNlVV3v78nnSOzK4zoR/Hxfpvvr7ctsq6PfDPcLN1dmEpD9RzN8bjJdOz0
         RTpmwYCUHybd1PLRRYV328xtD4sGhVnOZTK8mJfiL1BMBJ735NcViXht7AhGZuhuEpDx
         bPCFeZ2dM4Bbd7k0lMgWt2rnkbt6Oy2D3sGCVe3CNR+1bhN+Cw2R84/OUST5Jh8jk1Vo
         1G8I/DxAh0cZNdKdJWAUXaJIK6uZniPHPS7N7bOXUdrC5TUcvFtgNV88y/XVe+cLp9KH
         oF4ioJG6Qk+KFV57OfN3ppxlHDm1eDAkJybjKmSl++PteKjGK5uCbeQzJNAOHUCwf1BK
         3Adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692305; x=1784297105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
        b=AJvVIU0JLdgOADfOspJQl27Atsk4pLygNdzrGbqSXNvBbObKpUeb9beVPrn48HNmhr
         PJFd849cPZQG2FCaJGYz8jKcsct1/zikPoeGn+Ut8ZdegguwwmFEkQcsKVXSwnXU/oc+
         MPkccvOMpSesccxWAM5pighUPaOLQDiy+yYxUY7fSJfW05xo34QUXLfCbNztkv7pxtjS
         aFfYBI02dQlQNSH3hw9aRVeSVLlyg9JNaejc+isewFzjV6lZe9RQJquhKKXdNFndsyDJ
         jtoA5+g6Ry/M/QSDKT9uTzMUKFXGNE8JnksvdMbSdNbX6StfKB1pOi8QpgYtQgrYcxmZ
         7tgg==
X-Forwarded-Encrypted: i=1; AHgh+RrOmXw0bLb4tveaiKHBR7hTsOrfT+VQBUkHhhr4VhXqUjPHEhY2jaBd8Ysl9hgBPoWrQMPbOUWMTCYiwy9M0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/XzFoxEmoNpEiLGg1WVtxYCxWPxsADsFChl66EENWEiVOZhcB
	PZlc9u3W2ly7G3ZoNLNligpYGhe99Z8dq2iYc4zFBzyZ21qWcmpHrg19yopOEZyMciiXDEDvJ/N
	VtAIQdAYhNepy/22IQLlraGXVJlSxh30=
X-Gm-Gg: AfdE7cn1DU+qaqF3cjk41hGRVZm/8HRa0hsBLgTzcriUj+LcLOnk2YQ6tCpYdZe3yNa
	ujbEMY3ZCSHYUOosIyS4dgdUQGUuBwsBAViSj1Ic+2jjZpss7LPNfqNiyClp5xxlmjg1Ps1Pmxd
	34Of2O7/U2vaDvD643TmpTlR127LsjhAC7bpe9MbjYLV/M8LchotY5npNbd3VXmvB2uznCp/UGe
	UP9bK9sEhfWOkrajFwMkJ/DmPXwPXvdTqLrrRYMSOSGeUh4K3zDkZH5rZSO0oCgH/aNXCpXqRJN
	p0p1gBLqnPDsLvm2XYpDNA50fwY6jYL85wjN7xsgVClewHYqiNyoN9cYaY294wb+2mh1wziNhD9
	Yb+LtGpeIgmQD
X-Received: by 2002:a17:90a:d888:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-38a21af4f70mr6170112a91.7.1783692305278; Fri, 10 Jul 2026
 07:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org> <20260406095820.465994-2-ojeda@kernel.org>
 <CANiq72=mCc3XQ-fpkxBdEVkjDyt4tKzrdCuWgqMkQOyqBMej3w@mail.gmail.com> <DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net>
In-Reply-To: <DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 16:04:53 +0200
X-Gm-Features: AUfX_mzejtr7NyRI1E2Lyx1jl6eWlUosGgZmdyaCHgMs0L4rP9NPA4uFjFJCVKc
Message-ID: <CANiq72m37+nKB_L5W3EraM5APnG+pEPemadF3sEt3fud_qKNpw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:00=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It might worth adding a user for this too in v3. `warn_flags!()` would be=
 a good
> example.

+1, yeah.

We will need to go back to v1 or similar (simpler now with the new
MSRV), because if I recall correctly, I noticed at some point that v3
wouldn't actually generate the same assembly, which is why I didn't
apply it yet. I have to re-recheck and send a new one.

Cheers,
Miguel

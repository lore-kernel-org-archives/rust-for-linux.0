Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035428A1CC
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761081988; cv=none; b=NfsGAmsttIAIXv2doLewJWtonPZINZPsNbocrKhuLgoFMYQxFM6zxuQ873kTg5Q8jJ3xcsIHAGfb5ngsl5BXD5/S54PCgBOPkprQZif4uaVXzilroavGdRD4HVCTn5BcixNw78nZDg9mQ8Ft+WKPmFYl82yDRfejdRH/8Ko8/Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761081988; c=relaxed/simple;
	bh=fk4uDHBJ7seBjI9wBGl6e9lK7q/Nv9TIYlYWxndM84s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfY/vA1k2H5ncZ2YpWYUisj5Dncv5GORwseORJWBOapqwfDpjjieFJC0JSVyq+Bfg+3kydemtYdkCHhWoHGM00ZGuHOUN+Xi2uSpD+ZjcRs2MulCbLLFS1ZrSoODEyZGipEVZ2n0xagexMzwRz401LFAOUfwGrXBWPcovy4pnKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZ97+p0r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZ97+p0r"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63c2b48c201so1659a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761081985; x=1761686785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fk4uDHBJ7seBjI9wBGl6e9lK7q/Nv9TIYlYWxndM84s=;
        b=UZ97+p0roE8xztzXGDJzWe4bui6rJO4WpILhIXPHY2SG/i9k4LbD0uzC1NVa0Usvxa
         4bWIzp1biTjkrCmJvYVAEj0HkF0wX9SwKCI8foGlJKbqzQjyYWydGMki66fuN5L+/RPx
         5gNtmc/RN4d+h1xsvyadWMY9mPAPfg9L6kVfERpG9dmiJnh5pJdx6l0o8X5GFk21lJxN
         8U+wr0p9FCYczU0YAa35dy1KmluPnUPYUx5KKqyoHUmvl+dIEDcK0n5U25gyc0yXm3HB
         NKNZqC4sv3cpIJj7/otvG3Us3l+PefxCnDjdQVWGoURbPykTZSLvjLL9f1ia06fvfaif
         40YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761081985; x=1761686785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fk4uDHBJ7seBjI9wBGl6e9lK7q/Nv9TIYlYWxndM84s=;
        b=MJTVedolRlzACqgut0DNIBB/OXBQ//l4icHXv2ulgE+AI2kXfKsk+T61qbiNF96kvC
         d/LptyVTfoMFc66oMG8nLe80UhewnePpqfq4IXoHdyfV5sFis1LF0ea6vL5/8M2kgsti
         HIqSpntiqPbe0zpyBQjJugRlB6XhwiMvsUiuomUAfpD4AN/98Pu3Er3yT7+gfYZkbM5r
         uz7vAYPWuyjQ0WPV7MSW22+MzG96zhpNf1rdEpyNipKnwA5lYfdoP4pPITtcPPzWElzw
         jcKUNT/r34qk8DbY7s6iDpXrBcUsaPlAxPiZbuC/XcfHisIoBDurM/LX0LmiYH6ikD7z
         Pc7g==
X-Forwarded-Encrypted: i=1; AJvYcCVfXbSI88DHgt01eirTQmYjqzTHV6LTQmqYuBYz9km9IUtQUlh7MgptTHnUL/tGdeNDZ01f64/5FCHNrj0C+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYXhZ/LHk+62JbVi2O2xmvfRmqB+KXhfO2/yhiujwRb4MJ1rdb
	kL9QnjZl+fGKYzaLZr++nFvRv/5sk5T4lo4MaomHWTP/xq1yqUwc9+0aiw5pQ7+SRUGw3FNW7kE
	462RdnbmebWaFIM4sNnH+P6z07kCsFPULDi+bMHmf
X-Gm-Gg: ASbGnctN317DZWsj5iGEWJ2Ya33Yx1zjsMGRU3lNW+TN2nXPFSa6fOfSIvtTNtjunMy
	sX/H1mDPtL6DIqzWXr+i1KSxOUbth4ezGFzo40wakk7E2h9vVbC9pHG+fHuXM3zj05X5rDOE4qN
	aQC/1+LvFURE/tstrTKKczlvlh6qHDUnhdx1YhbtfxsSpvBsYmBFRQ0l5+pph8FurgvHO05Q/y4
	Wm+Z51aBrGg4UYIM5up6bRyGNIxBOzzbw/gXvJq2XQEm1xQm2CDIdkg2gmYhOwPL1W2cLo7RyFB
	DrEISxFPyi37oi0=
X-Google-Smtp-Source: AGHT+IHIK7LRKircy3o7ZXU64JDEZ1svJocF6KUfMmgbCGzy8S1rqeS98AsrhAAzTWhtg1sLGH+a+O1AV1PvLhW6NO8=
X-Received: by 2002:a05:6402:a18e:b0:63c:11a5:3b24 with SMTP id
 4fb4d7f45d1cf-63e1d96bb8dmr8627a12.1.1761081984441; Tue, 21 Oct 2025 14:26:24
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <2025102150-maturely-squiggle-f87e@gregkh>
In-Reply-To: <2025102150-maturely-squiggle-f87e@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 21 Oct 2025 14:26:12 -0700
X-Gm-Features: AS18NWC-1jwJmoNEc6IBrfF-BcQRCnK47G8SMuewBFW-uaWirgjur0uX31H4tG0
Message-ID: <CAGSQo00J6SjVLBDFHYqwVZ7x_5nT8L=RQEHTfAe43CoDuo0q3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Binary Large Objects for Rust DebugFS
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 12:10=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Oct 21, 2025 at 12:26:12AM +0200, Danilo Krummrich wrote:
> > This series adds support for exposing binary large objects via Rust deb=
ugfs.
> >
> > The first two patches extend UserSliceReader and UserSliceWriter with p=
artial
> > read/write helpers.
> >
> > The series further introduces read_binary_file(), write_binary_file() a=
nd
> > read_write_binary_file() methods for the Dir and ScopedDir types.
> >
> > It also introduces the BinaryWriter and BinaryReader traits, which are =
used to
> > read/write the implementing type's binary representation with the help =
of the
> > backing file operations from/to debugfs.
> >
> > Additional to some more generic blanked implementations for the BinaryW=
riter and
> > BinaryReader traits it also provides implementations for common smart p=
ointer
> > types.
> >
> > Both samples (file-based and scoped) are updated with corresponding exa=
mples.
> >
> > A branch containing the patches can be found in [1].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/=
?h=3Ddebugfs_blobs
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Matthew Maurer <mmaurer@google.com>

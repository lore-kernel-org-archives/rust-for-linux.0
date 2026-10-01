Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D604350E59B
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862225; cv=pass; b=KweODj1R7X00GI9EeQgODmA6PBE6pDBPdoykXAswtjlD8FtYcGJwpnPWYAwQS05p3oAfXwqk6Ge6L5LqMYU3ojjKUYnl8Eieu7nxap2O9SBFQMde4uHDVxq/pK+96ebcJn/9HDuCdLrt6Jhu7x5y3h0PdqbGMf35gHFnLcbyxRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862225; c=relaxed/simple;
	bh=H942DdgplYjE1m4Z1C25g9bIj6fhk/3ChJ6y1dd69ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ne11EME1S1Q7/2RbvsCxEh//vZlmXZQjsXFn50eNwuvOWtkoQ8sI33++9cI7bXcPyq574GYW8YVyQXi/mziF8D3JUC2wQ/iORamQM6B9Fu3yPcm8QoL60UtJd2+publn4+BDLg+s2nSb8nRSsdr7EuJ3FbHg9im6OtvoY+coU0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=twMmdzeA; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="twMmdzeA"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af0707d41so1502874f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 06:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790862220; cv=none;
        d=google.com; s=arc-20260327;
        b=K99e8Wy8lhX3mnDwxUXzAPMX+gq3q+k7+xD4SmdzLekHfObED01K5Es7wUl8ieTCat
         ZYp5NoHjSaHezbh5bKfrdvKh5uKXwJlko2+s3mHUXxDofc7eOPmGBaBCq9rjW17enH7E
         v2oMZWKfucqLavO4LgCxoWfeETFcX9eo+wAbUrhqMt2wrGi51+e8Uv/grbNZ7JLDBUC8
         HSYll7GwsJVOeo3cjTFuT63xyPckF9iDcGVt0KBm1Y7BcCODvLN5v8PKvGKBBD9+w2I7
         g2thG7idjgnQnVpvJ7dKJv0Sgd1+0R62v7h9qu6BFVoALronusPI+Vt/DyD7NXqg9xSB
         FF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uc8EFV3gFR6UdowGpvG9mlcPbI0S1kV27i2pdS0bYjI=;
        fh=uUJ4gII1694qaezI2s7XFUSaHOupI0Usi6npa66NZuI=;
        b=b5TlKJeM944XcDTeowYDbaeKwfuVxj5fsgF4M6bApjRolm0t/nlAFDtUrjDmtCeikj
         fy/alvycWP9cuRS3NLVtNj9bMWP0wWujAUzWjFweIjCKQIHVR3Kj6jKWGabPEVg9jAB5
         SKkrmsiSmgj1LCVaKn6j1xt0trUDBQqE4o4A8gfGljeC7u/40/4pfQwaFcXVnr3q3EC0
         jYPhsjEq9QG7mnVjhOqqyXaYvPTtw0omXX432i4sCEzOWwLHWlXPK31TH/oG6KrflLZm
         nrdzizRFKZ+t0fXNq3yR2xR2m7NeQ57ha9CpBsKsNgAmIJy7KX+XZK5QFkgzrqBh7zdP
         WRvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790862220; x=1791467020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uc8EFV3gFR6UdowGpvG9mlcPbI0S1kV27i2pdS0bYjI=;
        b=twMmdzeAdWYxHc+aiKUETneDeiDyvtCcG8NMLWGRQ4dtnzBUcm6/TwgJ330SP8ZPnh
         i5tprmJoXPwDgBCxcD8v+3gOmWTnqKQ864ReFFgTmLRDbhbEWpCjzjZ9Zeys0ApwVgxy
         7h6mio27RuR/fEMosI68uzDawkuhBeE+aEiDTF5QkF+IgvAK1JCeH5dTrmvKdS/nt83I
         jSl1VLN7Y88xbXCbGEutWs+tWpDcAdPlPfSBu3MxrQPyOLGpjXwuZePiOQOX/GJYIvmM
         3m1P4BhkUKOLDK2cOiVziKBCFhnPKVCaKGt7FPohk/KpdUWyix2zrzfvjqhVTdmn443a
         w2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862220; x=1791467020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uc8EFV3gFR6UdowGpvG9mlcPbI0S1kV27i2pdS0bYjI=;
        b=VYHpDR5Ays3nGnJ92acW6AqHZGk77zrY55qfZExgia066akFAfLyPeyHf5j/3YQlIO
         wHw6diuID2YFmc4d+CqS+w3wDlcI1euXnMGpEBxOc44eOvFolooIBUwoywP/uGBdi15p
         kfyFJ/3y651RkT4LgL8MqxUm0DD4Xxqv7aUX2eejsOklGASS14W3iL/U5Vt0tCteWa2U
         OGWJ3/lFX8H+fHSQSl0n6hNeFEtQMKWO1U47YIBLznf5bzfKq464G9LW39FBWbfAGAU6
         gfKkQ5O6a3fQExe+3dMYlRMp90W2d4tVaNxd9Fbn+B7WGwVLgpFHiKc7dnolbtvliKWi
         L7sg==
X-Forwarded-Encrypted: i=1; AKwUvBxpC5smuA7KBvoTn+slCKRGg4CkHBiACcqn3+4KvCywVS5s7wROMGEGyvR6oEGss+4M70oZzwLUZjHFS1x4+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdbY/HWWoqy4oVSlnrlTqkiZkFbl0PKjRHsTwTdkSb/dKBC2Lt
	5Ogtq03fMSKgypAIgDXQdFvO9CHGoAyPam7NZLELTiSHyNuzud2VEOCSlqvbMyloT3y1SCxkU3C
	kUOLlQfsd29MeU84ro2JvdVVahqLvBFRgK2G2PR5uZIU48GNApk84zHauWXI=
X-Gm-Gg: AYBFou3c8RC0gfJ4KLsCfcSqc0ZpGhu/hFHVd8o00BXOllqYBmyQIO+8vvhd2Z/afmn
	g6xkHa29uELejRZUqMiP3+yFzKjnASXvdxmyYh6WLQ0zXB5Otw8phvOy+vbSP18FgRnfZdnIzoH
	2shav6S1jJ+twChHH9KOfVZI48y8N4G/yUjk8Pk6Cv6oCl6pJpj2oBOmsGLF0w/tHokWY6xibDH
	Br886zaXE+I3fjOLJvFNn8IOkrmpgrwi+AbAhfqw2d3jpF3nfh/Hk0SSRVs+/lRwowvGJvjDksF
	dZHndJe1hppy75ct16IRjI6wILFm4v8Ftk1t5cmOSTrPjgxCamoZzlo0jW+n+4PwEWfVP2Tbq3M
	RTIdW9ba/y4nvfpg723NLttQNcO600DJiqxXhAkYJ3H6/9L1rEV0=
X-Received: by 2002:a5d:588c:0:b0:488:80bb:d14c with SMTP id
 ffacd0b85a97d-48b067b5c63mr7039150f8f.5.1790862219570; Thu, 01 Oct 2026
 06:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831052635.42417-1-nenkov2004@gmail.com> <20260831054920.42550-1-nenkov2004@gmail.com>
 <2026100156-strongly-plural-e7f1@gregkh>
In-Reply-To: <2026100156-strongly-plural-e7f1@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Oct 2026 15:43:25 +0200
X-Gm-Features: AclHuK-JgNuCEKzv_oDPeieF0TCT5U4OIu-QevALTW5aMRozO0q80VSA0jAWOMo
Message-ID: <CAH5fLgh5MRMRJfym-Cv=P_bqCzZ+jXh=ieTD=hPX4KrktKtBiA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: binder: Use lower bound for node debug lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nenkov2004@gmail.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 31, 2026 at 07:49:20AM +0200, nenkov2004@gmail.com wrote:
> > From: Hristos Nenkov <nenkov2004@gmail.com>
> >
> > The Binder node debug lookup currently walks the process node RBTree
> > from the beginning until it finds the first node pointer greater than
> > the requested pointer.
> >
> > Use RBTree::cursor_lower_bound() to start the lookup at the relevant
> > tree position instead. When the lower-bound key is equal to the
> > requested pointer, inspect the next node to preserve the existing
> > strictly-greater-than semantics.
> >
> > This changes the tree lookup from a linear scan to an O(log n) search
> > without changing the returned node semantics.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1249
> > Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
> > ---
> >  drivers/android/binder/process.rs | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
>
> This does not apply to the char-misc-testing branch :(

Please check this instead:
https://lore.kernel.org/all/20260814215145.2050599-1-rafael@rcpassos.me/

This one is a duplicate, and I prefer the other one.

Alice

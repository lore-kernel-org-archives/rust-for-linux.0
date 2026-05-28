Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB64317164
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952965; cv=pass; b=I43tcGHtdrPB1fqQ5AtS/XdvTdTHoAGeW0CLFbvTCYbr2IF8hj6l8sBlECsKkwCy3W3G4lQ4fZ5yBow+lcQQ7s6Km+s9HEw79C135O8HzSzRv9hJsVF5tBaPXPZLUzmDVYmG9AZiYIwhZIB0Rb+M+ldzdsoV4WgvK96xsb1yFLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952965; c=relaxed/simple;
	bh=hWcA/Jdomeam4kc70leLH77uwg8xZA8/MZGdzCMmpks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyvMxnXh5i8iIuuSnM5OCbBDRn7JQEBQcB7oKg/1jsPHBB/Cy1aeo1SLaqlQCRGN38K2Tq/zv9iC3PEU125jUMexNYKGXCHjfjPi6XnqKXh6q2nLiz23vgoYraUlMX0nShrybZ2ObgN1xcwYVTK7Iy0LPC7ghVDFeSENS8fsTq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfW3yzkK; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfW3yzkK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304dc707bfbso11920eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 00:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779952964; cv=none;
        d=google.com; s=arc-20240605;
        b=YqsIc0Sss9GYti/hvoB2zGa1KXEiRM00YSY+HLmKOLP+v2sZ92zUFkSU+FOOlA36o6
         sGo25XNKrxLge/9RXO+hEuod9ZH9AC/VTBJJYMd+4VCMD2uYOOKQxVasXyour054761L
         5PtVOW2nFD4TfkLZqevV9+BoBAm/M2IMgIYdzE/3PVNsEHrFGRKrAj090iZkSM0qR9h5
         te/giblWSCPK1dn23RxDZwnIFYBg6FAGBfdROpZfELtL8r/s1IK31RgsVpDShmZfjDH/
         AG6vPZkHZpnZJFcosXOd5VuNX2XjA81dHWEJ3N8iFilfPmrfgdoakMgASGaYAx8cL+U3
         Bwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMnKlWxCY/+1GhRWPt544lPDFtnUff7dJFrRIxp1dWs=;
        fh=ivUQJ78rSkiucjoYfbwzpKbV0Zh8sD/vapfBZ4tgxdg=;
        b=fjFOw+IvaKtZ6YBp8l5i/1JC8/3Y2A/PhuqHo+qf2jm3OzJ3pvQkp/Cn4OQboqfSAX
         kZxsB0AwMtVv8o20pi0lH63H4H6npPEikvzu3CkybM3JeiKkaxaGzdC3cTBS94mmA1nH
         RWrs7Uvanh8JDcteaFJwrYMuAcKZ6EfC8dHnukneuXAFRiVCzPBISa2SL/b+Ug9X8A/c
         NMVzHa2m3hnmaiSxDecSc/mo9yfMQOGWg4cIlVKzr6lYQDeGbApz08CwX0llizg12aG2
         SJrsqj9vYWiRFthkPKA7BtDGER9eB0IVCD+zw8Ud8AgxBP+kAXShSOWbFJWKoRGB1Xff
         QFtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779952964; x=1780557764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMnKlWxCY/+1GhRWPt544lPDFtnUff7dJFrRIxp1dWs=;
        b=NfW3yzkKTO0eQk9g3uYvMh0WtwA37PCjkq9V2uqO0ziUx34ZmcF3mqh4DsfQFz7v/C
         3X6Zfi+OsEGvIJv1pThdQzvB5Qe/Or+MF+PdrigfQ3d5V4hv091G0lVsw/X77LyX9qkq
         j0Gx73EpKlEdwlmWd7AR3VJafFpoNZdzM3L88Z6Ktpsmirg7wRVUXk9iFb7tGFsTgs9G
         QXhJp1TD/Afrq3EdFK4TJXRfkncUru7l+KpyuKg2E/WW4dZGvBIu1zljL0dT4ZqiJdVG
         7rw9lUurgKMhm4E5fvXiXE3UfLSzAB/NIRMs7ZZ2oG2ACvrybY6ZoeYKaSAhuPSYsM8M
         fDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952964; x=1780557764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMnKlWxCY/+1GhRWPt544lPDFtnUff7dJFrRIxp1dWs=;
        b=e1on2doZpGGYoNLWo81kciishFDyvFWbPwWz/yXU3c1mNUSSyzIaZ30xNAPdvrITqq
         AYr7+GOo/it7Y6Ur/RMJwYCMi63/QhhZcihCB2d49yYcR+Nxym9RU7xiEX/q0fq8S0Um
         CAGb7AujRhCAeqy8liuVWVLmT+ujyQDDYeem/X8WjHI41UZC49WRsaBx4nNObJTOlvAZ
         pZFIy+YgGG1ICIRGX/+SfsiqsxYQI/320t4Bi0GGdPA09ZSr3UcMLxD1k2ooh9xlZ1NJ
         UDfVLuD9j3efxNSj5jAJPWw1CyUlNrK3B4t5QmjsR9STSrdHHSQHXpoQpXtccp/BV/rI
         3f4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pUBwEGiIyQrFCAU8MHAyvyv/ASuVKp80whvHcdGFKOSC0bOGGKnsQu8yIZoRbUehRQXkegICp2MwA3BhYLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBs/OENEpA69kHDI209C1iy5r2EtvF0VIm2h2XsUwv6d5Rsyo
	asftjrDAlVhH3/nDufXy9IgwKhRJh95kK2ruY5IYp3R952JPAg3IIywJnlI50JYSWoGqnLkOGdU
	qNG/Va0vjTF8K8UakzFweVRdd8wvKMrA8cJBl
X-Gm-Gg: Acq92OH1qG1GYvErKoQutizYzsIz03jxALAGpQmGWfiT2e9IcvEe6d6ekwi6bN4STls
	qdigBwKQCy7laOVc8m51LVp/RMoSvsxko4xpuw+1KytAGTrFRpaHVwBxDSu52fodi4WH53jNnCa
	pjlCE1JOd8x+tHA8An8RJw/+Va8BVUY1FqdeFDm7Jn2pdwMbOqofO2qYAjuHWGlADRtUFNgDmaA
	pKA2oWVAD6jwmhZokED9HKLHLbDa9fyIb4QT1drA3u2hlbFrKLozskzcVeJWcRjRLkp3yjbLOIQ
	v4TgOuOgMCWkBQRCiqlWI4UYtlMrDsYBb9KWiPfHq05GK0Vg2/maDB5iZpUCy2g3sASMBI2fkjr
	EQbN6uKmIu0PiKYNnBwX1Q+LqpJo3BU3Cxpem3zAW73rD
X-Received: by 2002:a05:7300:1496:b0:304:8361:a8a7 with SMTP id
 5a478bee46e88-3048361af34mr3809620eec.4.1779952963671; Thu, 28 May 2026
 00:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
In-Reply-To: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 09:22:31 +0200
X-Gm-Features: AVHnY4I6oIW3zBw9jPnRTR4wEl8EOAz2Ezw6z0v81WcoSkqQ_LyCTT5fYHJi5Ik
Message-ID: <CANiq72=pTmG8qkdqXj7vw7e4QTzccjaz8ny38iL_9V_ramLHAw@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: add is_vmalloc_addr wrapper for NOMMU builds
To: shivamkalra98@zohomail.in, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Linux-MM <linux-mm@kvack.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 8:54=E2=80=AFPM Shivam Kalra via B4 Relay
<devnull+shivamkalra98.zohomail.in@kernel.org> wrote:
>
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> Commit 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> introduced a call to bindings::is_vmalloc_addr(). However, this
> fails to compile on architectures where CONFIG_MMU is disabled,
> resulting in the following build error:
>
>     error[E0425]: cannot find function is_vmalloc_addr in crate bindings
>
> When CONFIG_MMU is not set, is_vmalloc_addr() is defined as a
> static inline function in <linux/mm.h> that unconditionally
> returns false. Because bindgen skips static inline functions
> when generating bindings, the symbol is completely missing from
> the Rust bindings crate.
>
> Fix this by providing a C helper wrapper, rust_helper_is_vmalloc_addr(),
> in rust/helpers/vmalloc.c. This ensures the function is reliably
> exposed to Rust regardless of the MMU configuration. On NOMMU builds,
> this allows KVVec::shrink_to() to successfully compile and correctly
> route all allocations through the kmalloc realloc path.
>
> Fixes: 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605220811.LRplxeBR-lkp@i=
ntel.com/
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>

Applied to `rust-fixes` -- thanks everyone!

    [ Pasted exact compiler output and expanded it. - Miguel ]

The compiler output did not seem to be an exact copy paste for some
reason (at least from my testing when reproducing the issue), so I
updated the compiler output.

Cheers,
Miguel

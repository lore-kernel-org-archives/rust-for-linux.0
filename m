Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D43CEBB7
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785583; cv=none; b=WrV8O8SMLKWGegwlq6IO/9K3SNSOGdZCZtmTVHHUjuv+DKUVBRsEFiQLU8pUO1JKsrYak/gL5ZVJOBNiL6G9ucdy5AH/dUyXpwlMnfGCIgskBfL/AECNonK9uANSauNfkxTTF1aA8bXvKLFe1A7jNxJQ3l98/KN68y2g1ks1GO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785583; c=relaxed/simple;
	bh=Iz39VoQcC2EnN23JBnYwOZYmPqabSxCe/ZNcxzWbq8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTWu1Hbr9ghm+jbXqmn+nA7Wc37ZNj/Zd0D03rDk0f4IiA/TZnj4E3kSiBTPYYkx05jMjWrtOWcdAAK3LY+kCIrqSIMTCLzIPyedLNV4rgZ6ZE/jfE47FkcgnnoiUPKHmmlM4dgGddXob2oxhj86fAOS/Ttxcwu+q9LDSqXlSa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i09STYma; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i09STYma"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8419ab3a297so656181b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779785581; x=1780390381; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=InJMAp5dveD8bJ+7VPqWcHSAuX65wXSmTpY0vYoc1U0=;
        b=i09STYmatpNodIYUdUlm5qOVlrjejo/YR/7Alb0aGVDQVXb5xeqll9GmhmvjZAfUkS
         IJmG4fB63Ur25vfnuY8bhzOUftTaE+JzJ1F/YCgO3QJOid1DJim90I5VD11AdYJ3TdFs
         wmUxJyHqEdf0tnb8N6mOjVdD0VOtbw0AoA9We6jupmECoOYZMOiMN0SzafeDyen3JuJD
         iqYfkQUUKpcejRod1aBbOBeRVaXXect/dCSRmGS8m7tjSYc0P6gNoyG6XRgcESkxkJps
         k++MMruGPjdOPGmub09LV2GFtuRzpNjHubnZLsxQG/sQ/xbR+BrJqGcZVXV0j33mRxKq
         +VUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785581; x=1780390381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InJMAp5dveD8bJ+7VPqWcHSAuX65wXSmTpY0vYoc1U0=;
        b=JYoxh0YXWtysQjf72K/afUFzDenywmhQ7tCQOzxpmeOTLlKas2NyVTFl8RvS4vuSeo
         OFuOZOQ79msD4+lUSDNMAgSv9JCIp5Igv3pYpjAEXnRc4Lrfk/77IABLD4U1gUBZjiai
         b+WmE6WayAOcfs/HkFtqRZV2vt9zs5meIXBDlUlTs3WJ1s+NpZ9h/rAwZh3dD4cP/95Y
         J5H9JZCsXg4jQ+W8esU0WIqgNfaZG5vPb9HO3HeiWbE0m/80N7Rv7hO0a/QuyTOjONLH
         MytNa6lBlwG/J7a0/oGUyb+anVwHoN7m1mYZ1OdpOlQ8lJkIaPWvyusE/sArhvNc7EoV
         SVfw==
X-Forwarded-Encrypted: i=1; AFNElJ/n5lkQqGTsoNmBG/EJoPwlPuNEjkfsJ6ZqwOqlH4S5ZDvEMSCGurZZsloD+VKSEjxdXa+/eFmmHoRdC922vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytZWUQPDRyWOMnDwQHwdkXorfHv/giLSKuG3NGBknRIPmMj29r
	0ipv9hBDcCMMhMgeXZILk97r358qjLoBFQFMVuPBt0JRonNlgT8kuSwp
X-Gm-Gg: Acq92OHKapDGWXmfIfqMUlPoSSTfVww8udojx0caji457OzNhB2AyqNaj6CP0custdH
	rj5Dt5QPF1fbIbfMioDhtRd2GqCjIwRcXniyxqCC80Exdc16RpWhT0sjDmWgDTwmazSIFkYQk5z
	o/4ROymfYs/M4ObnFVQ/XFel6lviR+nt+Gs1YWk3SfK800dP0sNTDPTCogMcxpc/hr0EkhCQ6SB
	KkzJEgnD+zFGhfYkBLPDaUqspQiSqRKrlccLDcdtoIwWctOlECfPitQCTbntvoPwyXqp7i8QxCC
	0kDG5uSluPtJKiDbPxmwJdGTjfok3I3C4l4uQNk/p+eusK2uoXatXYQfYT2IAZvVSPIfQ6ejSuF
	1EbmU7dSpCXjDae9YXDsjdZyozOggQy3lhwQ+Qnsh8wkBgECcIeqcw1QHslACxJRekHy4OZWM5n
	2u8MuJvFvSKtU6mBJ57Bv3u2Tw6Ykhj8xZoqnpUOHlgidAcQEp3imtHvQNtP0LDiJeq7g=
X-Received: by 2002:a05:6a00:2da4:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-8415f19e22fmr16062880b3a.20.1779785581098;
        Tue, 26 May 2026 01:53:01 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b06fa2sm13385336b3a.23.2026.05.26.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:53:00 -0700 (PDT)
Date: Tue, 26 May 2026 14:22:49 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>

On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
> On Wed, May 20, 2026 at 8:48 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > Minimum `rustc` version required for powerpc is 1.95 as some critical
> > features required for compiling rust code for kernel are not there.
> 
> Which critical features?
Hey Miguel,

Right now i can only think of inline asm. I can rerun the whole thing
with 1.85 and figure out the issues with 1.85. I'll get back on this.

>
> > For example Stable inline asm support which got merged in 1.95.
> 
> It is not needed that the support is stable, but rather that
> everything you may need works.
> 
I wanted inline asm be stable, I was skeptical about inline asm to be
unstable and potentially messing up the whole system. That's the reason
I waited for the stable support to get merged before sending out this
patch series.

> From a quick test (with a dummy example that may not be
> representative), ppc64 inline assembly seems to work for a long time,
> way before Rust 1.95.
> 
> So, which is the actual version that it is needed? i.e. 1.95.0 doesn't
> seem to be required at least due to that.
> 
Yeah it may be true. I'll test out the 1.85 rustc and come back with the
results.

> That is why I am asking about the critical features above, because it
> may be that this works since earlier versions.
> 
> (I wonder if this patch and s390's similar one influenced each other?)
>
I am not aware of s390x way of approaching support for rust so can't say
anything about that.

> Thanks!
> 
> Cheers,
> Miguel

Regards,
Mukesh


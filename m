Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F952BE7AC
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709055; cv=none; b=oh5YtSbz+9Sci91daSWMaWk0gvZmNjLCp+8hlhCdMrfmvi8ASiCrKPGYhFQ2nWVtDdwBL5+aXiRleTRDh2rCP9QFTA31WSvKrAT6FZeECLFKqKeMtAgLI23lvKU/zdRciPlH9a6eYOziieM1J26fOe12ob4GBXYYb5RyLverFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709055; c=relaxed/simple;
	bh=7ZcDPOPqqkFXd1DkSIusAok4l3dIR7MVGZ1CdQ4xmyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEGiQPlcaTqE1bKLNL59ais+1SxLG8OtnKm4Y473QWUMHtJxc4KPpU/TIU+8WVCeai9InpBgWY8I9NakP0FQy4F7xb1BTHAMfXvvr+t7R9k9vLlN25Uv9U2v6JhAMtJOqEhc6Ctfid6wB1OuNcNCSguRiNxsoblnNph9a1yh72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqx+bVJe; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqx+bVJe"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so5494535eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 21:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782709054; x=1783313854; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQD/rHZj3a8p2S8n+F8bG5yMjsLxWvoQVhtFef2fXlQ=;
        b=mqx+bVJeIMxJFPgOkJb44Wi0Dg0iX81QrtXAufMz/qsu5NBB/pJu27Zi3EcK9NImn1
         lcA/+mZVB4Aw8fIVyejnsAuqIZyCbcHpzxRWjOnuoKWadSwOLWyLYhI7YjyKdE4DeoEe
         UBK2qve6KzXojbcLMBmx4oB7gwJzQj02tg8N1RH8vXrY9n/y/b5hWr7Zlk4He7hoxTK+
         mFbnn5aCMQb3P0zHzdRzbirLojb87pbE5LXv9jbi+U4RdttnmUyIIjTzCB95ql465JCM
         Dt9GAyAxm2dFcrstAlHMNr6lQlm8QvKSL5BSKGqpK4g/K3Fnv/GfQyxF3pg7pDnmAvVW
         mFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709054; x=1783313854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQD/rHZj3a8p2S8n+F8bG5yMjsLxWvoQVhtFef2fXlQ=;
        b=IyvvlAyA6fHo2ZF5+NK1T3Z7KqE9YRLKVBplCeVBf4lw9kpuOwHbNKHTgrTkc/xrfi
         wrDEVAh2jOChNYMg/4YUkRkl/yKFNY4wKJyojywB7ZBxAKyhHgij/WOhNeGUpFtL6zdP
         btM/0GorLQmh0/42vI11KQOf9KuKaxz45N0NjxT3QckENBiFb19cNsca5Pj4EypUTg2p
         6G5cS2BgF05Gq76F8mUCYROTVQ4wbdd7MTCM1AFeOHGshB41ZM0+WcQ4hX5USz4HUkHT
         QYgkRCrUxIzpUud+5PzvZ6k03mfIna8TCIMNQXFh6hYAnchvAeNEwpbLti2C8hfigEfw
         LmCA==
X-Forwarded-Encrypted: i=1; AHgh+Rpmm282YrefsQS571ZebermrP1V52dN/ggDx3EK2W0lUtnSPWMnL4QRXFKJUDjV38qajjKcQ/shAMAZDnT1rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypUdkqO6qbP57W3iQG9B/yhOwexBejoHww4kjDcQWaxBUQ09p3
	shG9zSDAwrBVXHHq9i3hwD3f1/2CXl3aTfpMmwiC0+ogycTOA28zve37
X-Gm-Gg: AfdE7cmamUxyw+OC61Upp5h5BPNIQB7vA9VbhYrKYG1RCqrxp4AKM8Cxk0ItHMz1Q2g
	FQrxzcvQzBNv/sfd/3MNnYbVSST4i7uRUT1SQrIl8Ks7xlcXWZ6GjDFmXJVoz+Hd5Qal544Hu08
	r4Bc/ddwTG3q2XQpNGtMhZ05oIt0aGAjiGD/pDv83H2Bckvu3m2JvfrtAcnw92gHjZbx8WYATLc
	HNfvq+WpWoSELu8zEl8mvP4g+buLF8wMwkvli37/+XMcFgGUCu2rrN+miymeXUwdy2cdHKM57ZR
	NKyBgeyO/ENS4JoBsfoE/XYKxyj8x7fU0JFw7jRSi0nTUQwAh+QW3xx0dXCABbSEwGuKtdxeZW9
	e5Kj9ETabTHgBkwThzLVdpKiqlHmhBQY6d/Q46GXxQ2urHKdk/Nd3p8rmAPpBm1wCyGm9TxZzaH
	Zp1Lt7RJ5yp2i/H9TU4nhrwkbeWDUcjB4QHOtvnqxaE3EgXxBnASRQWASddQhRulbLYClo+Q4=
X-Received: by 2002:a05:7300:e8a9:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-30c84b2c0c8mr15331021eec.5.1782709053542;
        Sun, 28 Jun 2026 21:57:33 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm39851291eec.27.2026.06.28.21.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:57:33 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:27:19 +0530
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
Message-ID: <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>

On Fri, Jun 26, 2026 at 12:17:50PM +0200, Miguel Ojeda wrote:
> On Fri, Jun 26, 2026 at 8:50 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > This corresponds to a floating point instruction. Although we have
> > disabled fpu, vsx and altivec we are still generating these. Seems like
> > we have some issue with the rustc here. I didn't dive deeper into this.
> >
> > Is it ok if we keep 1.95 as base for powerpc64le?
> 
> It may be that it is generated but unused (we have that issue
> elsewhere -- see e.g. `rust/compiler_builtins.rs`).
> 
> Having said that, if 1.95 is fine for the powerpc arch maintainers,
> then that is fine (s390 also used a higher minimum -- please see the
> recent change in `scripts/min-tool-version.sh`).
> 
> But please try to bisect upstream Rust to see where the change
> happened, i.e. what is the root cause? e.g. `core` changes, `rustc`
> changes, built-in LLVM changes... It could be that it is not tied to
> the `rustc` version but LLVM's.
> 
> Cheers,
> Miguel
Hey Miguel, 

Sure i'll bisect. Meanwhile i would still like to get this upstream.

Hey @Madhavan,

Can we pick this version up for ppc?

Regards,
Mukesh

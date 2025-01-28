Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAC1A0711
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063747; cv=none; b=nIJxh1588aMNR0+apY2+zWaDHKrmAfqkRP/84i/yL0k+pjNH8ngmZjLmFNoFRAHrxz8UJh4W6NSTJ3Rwi+t4eK1yMEdzCIUttrumUBeOdWmTluRGP0TvXgTcL7NRP4rcYdtVWYbbPAIOYwhEXVU9gc/R9mJIfpKp1VOPU9qCN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063747; c=relaxed/simple;
	bh=MQ1iUQwLMRV/zV3x6BcXaZfwt3maRdq9s6tt3xO4WDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VB+TZa5cRWFjKFVFhTNF7UeZZH0Yti1wLI3pKLHRZWWKf4GgLrxIkfu2p/UPWL3+HkPTrGu+nuh+e7+HMCpNkT0Hi3o2qp7o7yBmmdh3Ie7Y0/T+h6ZRWPEvHGV3cU8vPu8eDf8zNIgVAIVslkIHkhDm/7Xf/PvtBJFVDuyPA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dz5c5Fru; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dz5c5Fru"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43626213fffso40763145e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 03:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738063743; x=1738668543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9auZBtVLoQnDOV9i2UvIW8ly8htsTm5kjvaoa/9TBk4=;
        b=Dz5c5FrutVvv4FP/oM09crDxMpM+grxqL/R/eoW/fJI2BtLAHmZekdKNK4xiomQVB8
         LYVcNE83Fpg3pWnkJ8Z+2S2HBrQtnTgKnkbAPz6KVNI0CMUlR12VZEp5XMRitOUD7J3j
         zJLqhK13UahZqnGNJWfBTEdVeD26FsdHTm3KabOPUTb5+Q6dRFUE8K0MP1IbMMc+ylVn
         QnrYsaBhwuEvbymY2rBj8iUpek7Jz6rdq72lIELxI0IYvfhoo4rqyJztoM3T1Bg9hQ8j
         2aaVXyZ/9PVTOY28nT58s4bmukQQ8YKKdSHIoOW5RAtFlB769gOH2UrVgMoiTlAs5FQ3
         oBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063743; x=1738668543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9auZBtVLoQnDOV9i2UvIW8ly8htsTm5kjvaoa/9TBk4=;
        b=QOPGbak9w9qHVH8MtY7YFVpbqk65aVTCA7RYTozFmoXk7oj6FPiR98XkiYsO3usP2q
         ihXWMlnrhv/D7U5PtxiPqbv2FMTuEiMIEdaSSuTF7k7yMVPNrbnYxaz8twBLJ22tfGG9
         vFJNJSt/Flcav0k9/hP/OZ+M0Sl7/BiATmJKxBYVjhy9JsUP+S5RIIMY1B0378/5vs+p
         pR4VSkJOYxyAXONzy3PSIjenufmPPDBAh02u8T0U6QYz8jg2tsO9oaGS3kaATB1zHURZ
         toKZpqUOAdFhy3D/rHXzvdxPlnvI9O0+wcPKDra0stk4bBLQFylHhiWJykCQgVZmukMg
         VdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTdeqP1zUhDREJzCRq4OL5BpLiBAkW25QzyKeu07NdsxJ7yfBKE1iDbtbQyeWIFdbDbrBaztVilzPjcyCQ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvlo709nY0h+eh9NowjzcFnUoVz6cxikE2jzHa0eg/4ExH1P3
	prJRXqvrsHQi93pPRAuqpYURZc62Rpk6Oo+oFURcfepdTQXIlqeStRIec9bcfdwqqJMxqHbG5gk
	aFRVJShF7bCZI/eYXrJg9CGvVUtxe9je5bbv5fjmJapAhxyjVyw==
X-Gm-Gg: ASbGncuuJPBuANcPuEHcuQLK8OSKZzfGvYCoxr+b1u60RbQAcIvJj40BpEg2xpMDyZy
	xk3cgLmkN7jX7V2IC12m/eft2EhcNP9ORKtQKQX4Wo4Gn7PgO/XKsQi4Gjsrug8aQG0EwhOp3mR
	T432Xxl3G0q317PhXVz/E4opQzHQ==
X-Google-Smtp-Source: AGHT+IEqIp9lI+kIFIHbiFrLcWIiIELhYivZqeABp7GjPgpw0qgG8OMV0dMUTO8sXAohUjeQ5p9eBj4wzrdT4zuaQQI=
X-Received: by 2002:a5d:5f56:0:b0:38a:88ac:ee69 with SMTP id
 ffacd0b85a97d-38c49a37d3amr2659372f8f.13.1738063743439; Tue, 28 Jan 2025
 03:29:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <0E0FC88B-95C0-4DBE-B497-AF9101BACE70@collabora.com> <CAH5fLgiW6n82hMhbmJ-ynd6329mEDFX6TzxXQZaaoG47HAWWcA@mail.gmail.com>
 <95382414-7A44-45A4-8F3F-C6D755422AD5@collabora.com> <CAH5fLgjZiux1_=dNuZN+7SEY6fUGMDNLoJNTwmHcB=WbKChwzw@mail.gmail.com>
 <D3CC752A-8FE3-4B2A-93A2-7FEC2EC3940E@collabora.com>
In-Reply-To: <D3CC752A-8FE3-4B2A-93A2-7FEC2EC3940E@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 28 Jan 2025 12:28:51 +0100
X-Gm-Features: AWEUYZkkM6g8-lhFT6JLvjZgwZWEQJiOHCo71FDcsZysQyh8T480nt-6d21OeqU
Message-ID: <CAH5fLgg+Su4FWXB23Zd=oQw_xEzBKRqpTujQiiOKDOYqqXheCQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	dakr@kernel.org, robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 11:37=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> >
> > I mean, I imagine that you could make the syntax
> > `dma_read!(my_alloc[7])` read the entire struct. I'm not sure which
> > safe methods you are referring to, because right now there is only the
> > unsafe as_slice().
> >
> > Alice
>
> I mean this:
>
> +    /// Writes data to the region starting from `offset`. `offset` is in=
 units of `T`, not the
> +    /// number of bytes.
> +    pub fn write(&self, src: &[T], offset: usize) -> Result {
> +        if offset + src.len() >=3D self.count {
> +            return Err(EINVAL);
> +        }
> +        // SAFETY:
> +        // - The pointer is valid due to type invariant on `CoherentAllo=
cation`
> +        // and we've just checked that the range and index is within bou=
nds.
> +        // - `offset` can't overflow since it is smaller than `self.coun=
t` and we've checked
> +        // that `self.count` won't overflow early in the constructor.
> +        unsafe {
> +            core::ptr::copy_nonoverlapping(src.as_ptr(), self.cpu_addr.a=
dd(offset), src.len())
> +        };
> +        Ok(())
> +    }
> +}
>
> =E2=80=A6and the similar read() method that was apparently removed, i.e.:
>
> +    /// Reads data from the region starting from `offset` as a slice.
> +    /// `offset` and `count` are in units of `T`, not the number of byte=
s.
> +    ///
> +    /// Due to the safety requirements of slice, the data returned shoul=
d be regarded by the
> +    /// caller as a snapshot of the region when this function is called,=
 as the region could
> +    /// be modified by the device at anytime. For ringbuffer type of r/w=
 access or use-cases
> +    /// where the pointer to the live data is needed, `start_ptr()` or `=
start_ptr_mut()`
> +    /// could be used instead.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that no hardware operations that involve the=
 buffer are currently
> +    /// taking place while the returned slice is live.
> +    pub unsafe fn read(&self, offset: usize, count: usize) -> Result<&[T=
]> {
> +        if offset + count >=3D self.count {
> +            return Err(EINVAL);
> +        }
> +        // SAFETY: The pointer is valid due to type invariant on `Cohere=
ntAllocation`,
> +        // we've just checked that the range and index is within bounds.=
 The immutability of the
> +        // of data is also guaranteed by the safety requirements of the =
function.
> +        Ok(unsafe { core::slice::from_raw_parts(self.cpu_addr.wrapping_a=
dd(offset), count) })
> +    }
>
> I don=E2=80=99t think there=E2=80=99s anything wrong with these, so maybe=
 your solution can come in as a convenience
> when one wants to save on the amount of copying? IMHO the two methods abo=
ve co-exist with what
> you propose.
>
> The unsafe `as_slice()` and `as_slice_mut()` should also stay, in my opin=
ion. They can be used, for example,
> in codec drivers.

Agreed, there is nothing wrong with the safe write that was here
previously, or the current unsafe functions.

Alice

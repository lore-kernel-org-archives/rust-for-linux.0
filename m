Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDD1F12FE
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444564; cv=none; b=hJiLJwu9AK65swgQFt04/UfEx5rYBCeG4f6l0fxTe31/h015YFyH7cKNP7QXZ9lsmXfvQzhM/Jh3hAlqEgi5VtXcXmoEJnBiWq4CRMUO1q43Llbj8JXvWTD+anaf+QROwtenYvLpjTLTV0bhxSLZ5ZQ7YdPMnv0eEeFonfEIxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444564; c=relaxed/simple;
	bh=ahxj2ZuvgdqAbrr9kxcrRePlld8qQb0+q5BUmhEK5wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhFV9n45DiwPeUuOXF6p4X2gd+IaxErqeqEP5JafFWoDjuJE+NpmDfNJ+invlmGG6ys4v58l950ik5MWk3Jt1buBEaqBmyQkEHCLHs1bOWHT96e5WXp0BAA9XPlICwYNOntoGaMhTzr11BA6TKP0U3j8wrCLF//fyz1FSmHAi5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=TuXGk3Y7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="TuXGk3Y7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e27c75f4so4116649f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 06:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1734444561; x=1735049361; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCGlkgVuqQzqrbUexKTG0Z2+N/cbqdQ/0IOQRwtrcEU=;
        b=TuXGk3Y7kJCwkDR6prqC5HtJcTVU1vfxAabD7zILKtwDWf/tatSIUO33CbNjR/3Jr1
         vCAeSRsRcYlL4JE01X8nYKOR71ZT9xKIhe8Dw6FnlKKMzO1IKn9UdxGdc69ZT0WROywj
         vvkI0fvi2GmfVaDHkBcvIsryUNR4LbJIhIPbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444561; x=1735049361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCGlkgVuqQzqrbUexKTG0Z2+N/cbqdQ/0IOQRwtrcEU=;
        b=j5mFjULc5kkM1v/OIaEh9M3LKxUpQ3Jgp7DVLtLIod7Gw2zsuzNR+zQQdir+gbUqto
         n6UGUzCA/zCGXwOP28EP/ggOfEkbmOi8XA75iLRXvsTSFgvCaJfcTUlQglvZLLORRgp0
         zf672F6UDU6wqcc38FZHG4KKPgN751ROW4KatKydrabDJBlGgkbDZ3UipergSUvD/HQ2
         Q7TBqQks8p9V827q3rVZYwa4rwMM6taZe8tFWWYCFrpn2RArzKHIXXSLwDB4DxMdpd5N
         QOGEADDCRJ20ZFB4vCGUOduKSytJ8lza6LMfHlzfZkjCz3/WYO1WtioBSI1h8Ea0Nr13
         Hfng==
X-Forwarded-Encrypted: i=1; AJvYcCU4R8MtGBYfRMe/Dgwfr8po9yo3fMpAPzM5JmhEStsn8+uKpY9bz2Ng8KlKmqBUWc7FXlHcDhioWYH9zPA0Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9aEixIxqkqbq93pdZ1x48LpcKopoKIujB949wAOZBOqu8UiC+
	G/X9eGA5AVuZnGtQ/M9JumOVAwGoLNECss8oWULB29PyfPzMrlbU3D/aF8g/uwc=
X-Gm-Gg: ASbGncswwytVz8ILfKKUZGlq9JVve+2URZHeopjaAc+tBH21pn+t28zRvfT0FeuYQbS
	JDiY+vDL4hU5sIdSfNBnkG6GA+iT89nfEeBG2hZ1/pd8QvZ+J00C/NzZpt6o1tPPorf4nSLDSjb
	d6jBVwsT5fYRiU3S7gFG3JXCq86R+SMS8sChSa9kmjCRDOupV1SaXO7MuTmUGU931JUD5cUzTnV
	blKxjGai9GWaYDWGiPG2PNgBQZoNeTJ6k3a9RXekuZ3VK5lPAwaBjb4hDEkmi0Xm3uk
X-Google-Smtp-Source: AGHT+IGnRQychXs+K5YClf+sKZxkZMessKx1cEMa9+lNbZSGPCGrEsRoDJCorxXBGuSk5UpMIG9gVw==
X-Received: by 2002:a5d:6d03:0:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-3888e0b98d0mr12740846f8f.45.1734444560749;
        Tue, 17 Dec 2024 06:09:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80605casm11402211f8f.86.2024.12.17.06.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:09:20 -0800 (PST)
Date: Tue, 17 Dec 2024 15:09:17 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg KH <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
Message-ID: <Z2GGDVytlj5enrUC@phenom.ffwll.local>
Mail-Followup-To: Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
 <2024121324-overdue-giggly-bdb8@gregkh>
 <87frmrepo5.fsf@kernel.org>
 <CAH5fLgh+iOefU3vG=e8aAFhcKh0W=6M0odUt3s_wfDKW+rGNOg@mail.gmail.com>
 <8734ireo4o.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734ireo4o.fsf@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Fri, Dec 13, 2024 at 01:57:59PM +0100, Andreas Hindborg wrote:
> Alice Ryhl <aliceryhl@google.com> writes:
> 
> > On Fri, Dec 13, 2024 at 1:24 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>
> >> "Greg KH" <gregkh@linuxfoundation.org> writes:
> >>
> >> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
> >> >> This series extends the `module!` macro with support module parameters.
> >> >
> >> > Eeek, why?
> >> >
> >> > Module parameters are from the 1990's, back when we had no idea what we
> >> > were doing and thought that a simple "one variable for a driver that
> >> > controls multiple devices" was somehow a valid solution :)
> >> >
> >> > Please only really add module parameters if you can prove that you
> >> > actually need a module parameter.
> >>
> >> I really need module parameters to make rust null block feature
> >> compatible with C null block.
> >
> > Instead of providing module parameters to Rust code, you could
> > implement that part of Rust nullblk in C. That way, you discourage
> > future Rust drivers from using module parameters without making it
> > impossible to have them in Rust nullblk.
> 
> If the opinion of the community is really to phase out module parameters
> for all new drivers (is it?), I can maybe move the code in question into
> the Rust null_blk driver.
> 
> I was kind of looking forward to having zero unsafe code in the driver
> though.
> 
> On the other hand, rust null block might not be the only "rewrite in rust and keep
> compatibility" project to ever see the light of day.

We still have tons of module parameters with the _unsafe annotations,
because they're really convenient for debugging and testing. Yes they're
hacks, yes you cannot use them for production, but they're useful.

So for drivers I'd say we definitely want to keep modules parameters
around, they're just too convenient compared to debugfs, especially when
it's things you have to set before the driver binds to the device.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

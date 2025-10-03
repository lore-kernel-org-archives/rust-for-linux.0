Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0CA203706
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Oct 2025 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759518985; cv=none; b=FwuJ/3bBIj/UI5IZQPfz5aLzq9zaOyXIYw6hr1ScgW02XVQbd2hRiT/zocKKZXLY9o9KuU0KMxIeBtegcNmX20SCyYBUHEZK9VFgqSI31EMxmYX58Y1/WkcrK43JT8iik18YIkFOJsJ8lnFrSaxcWtdWXee9sDBiLbIlKkWXgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759518985; c=relaxed/simple;
	bh=tVL9p+nxl4y9c+ghVq3bDJ/Nc31UcENUohwqCzhd3MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9rMWLI4Ey4bseXh0anb8Dw/OPx6G1XWvIK1ljOVylVFQ/tieIEJr+Cp/6wziXwNuzVvPQbaHdeESFYK5+EWA9dxiY/EAMaJOwevIo+fmQO5/f5hs3WC2gYTCFTzy3s1XC2KbM2abpV6n5fBnJn68XfSwsQtlNsm34PqfgW0Ckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkGQ0oWh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkGQ0oWh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso21238595e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Oct 2025 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759518982; x=1760123782; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CokE/k3sp2q5WMd7ECWNZXq4ObJTrjeetW4zf4kEWnA=;
        b=gkGQ0oWhqqkicVvhl/wFrNDqchmoEXRkcnXCSuEO8zVP+R7ygdOD23Ax5ujlX7iLLX
         W9lffsbkvFmc5XQvcj+1x0mArr67JqWrVRCyaHu6y0SYJbQFdthybHDyElGBBs4FJoLi
         7LKQURLzFq4DbD90hwsKwh5uYn8szWWceEKWYsbPeZtLAEddTeYPaUc2Oz9qbUZbIXJe
         FBoeGzHFvWB4zmVScg/ArFgqgESi07ulID1NemZEKAGihRU9tWsKEmJGByyxLIHTBFO6
         seou0XKxhrn8OuF07KsjyAV5a4K7HgjzV+QjG3KUvFnb/7CTbgkaYa7AVIPAo+I1qcx6
         Rbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759518982; x=1760123782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CokE/k3sp2q5WMd7ECWNZXq4ObJTrjeetW4zf4kEWnA=;
        b=b0H99LRTy1zRT0eSCNRNrdTW892rAVFUdZgA3iuOxZsgPEUJ5OHMwiaiLEEVuws9oF
         suashUs7JFTrDP79mge0ldFBA/Fb2C7kcHOtzAAY7XsW6pqql3TlWB54T7rawg+ny0by
         Pm85FLPN/6pdKlhATrx9MgE6l926R4pNNv7YG/Kz/ASYiVkGDnwjnLYiRZ3Wd4Xkkca7
         J2ZFrimndemCIb6RtwBV86x0KN2i+qAcON5kiym6qXpBoTp3DD9AiybLzMpINA1C6HZ+
         M6C5x/JYw/xCln7hj+yLd6Vg+N5dhPf+mCYHeHoEKXqqVO8JLRnEHYaOwrCReggx4vhG
         4r4g==
X-Gm-Message-State: AOJu0YwgnDNKnou6QcZAY7ZXyNAHLOnp6xxMwk4cAclLiRV7aXgNH3YR
	Z9nuLh+H71zBwb6UhmRwWNALjlhECjKmcy1CbBJ+Ej5TiYZnoM8fjs8IcRt8TljqH5sOU+nqz1I
	s7aiy
X-Gm-Gg: ASbGncsudR15VYeLkQOz/mWC1GkiJgD4VCbKn+i2TR8vYH7cUkXl0tU/1TGdtm3PSL3
	RnH+86p++XeuD84Brru1PtEi3efVc7My+m693+G6ddCPDnxH1e/JxUbs5epLPw0Tyqjb/CDU1s8
	J1DRa2ZP8zXoOWxZUGyt0v327BROoEo8sTvBgbgXIwSuEpkvKBli65uOAGpY0o9O/bVlpBcmU3X
	wIBnSxA5rnvwDhPooPZ8t39KSyB95EhAYqW3Q+EyRtb5yn9A6twfND1DHj+Gr9JaXhjzmPdnDvK
	i8MrJJ84ZhklV/TuKLpaXBbk8qDQE9/hY/NaRoYOeCTmJX0YibpKeDwVz/UV6ebmfMMX/Bu3BtP
	vM7IVV2ufnmcEDkoQVAM94uJx559hbbQbH1iLF/cJc27cMIsF7Q8/u+Me
X-Google-Smtp-Source: AGHT+IFLZ0QvjwytGIsmgaGtzccZXtbd+f+pX+ocyHIDpS87vpgHFmVAbVGZfoGdGaZFuMKKHMJw+g==
X-Received: by 2002:a05:600c:c4aa:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-46e71146819mr29095885e9.31.1759518982081;
        Fri, 03 Oct 2025 12:16:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619b8507sm140813195e9.3.2025.10.03.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:16:21 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:16:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 2
Message-ID: <aOAhAaUQdrFjJMk9@stanley.mountain>
References: <aN6qWFc6hIcbRU1o@sirena.org.uk>
 <aN7cRUOxq-zwCoZN@stanley.mountain>
 <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>
 <aN91pwLmB_2TwK77@stanley.mountain>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN91pwLmB_2TwK77@stanley.mountain>

On Fri, Oct 03, 2025 at 10:05:11AM +0300, Dan Carpenter wrote:
> On Thu, Oct 02, 2025 at 11:35:10PM +0200, Miguel Ojeda wrote:
> > On Thu, Oct 2, 2025 at 10:10 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > >   RUSTC L rust/core.o
> > > error: cannot find a built-in macro with name `define_opaque`
> > >     --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
> > >      |
> > > 1757 | /     pub macro define_opaque($($tt:tt)*) {
> > > 1758 | |         /* compiler built-in */
> > > 1759 | |     }
> > >      | |_____^
> > >
> > 
> > Thanks Dan.
> > 
> > Hmm... Strange, it is the `core` library, which comes with the
> > compiler and thus should always work.
> > 
> > So it sounds like a mismatch between the binary used and the sources
> > of the standard library (or perhaps other kind of mismatch, like the
> > wrong edition being passed, but from a quick look it doesn't seem like
> > it).
> > 
> > I will try to reproduce it. Did you happen to recently upgrade the
> > toolchain(s) or something like that, by chance? Are you using the
> > Debian packages?
> 
> Yes.  I am using the debian packages.  To be honest, I don't know it I
> broke it with an update.  It's possible.  I am all the way updated with
> `apt dist-upgrade`.
> 
> I'm on rustc version 1.87.0+dfsg1-1.
> 

It's fixed in today's linux-next.

I did go back and confirm that it was definitely something in the kernel
yesterday.  But it's fixed now, so no worries.

regards,
dan carpenter


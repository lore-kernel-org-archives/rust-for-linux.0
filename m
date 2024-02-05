Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A12C190
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144403; cv=none; b=PEds+yso+EzdTUGh9pClIoOI6pxqe+bpfmJbTcA1y4M5Nl/C7SB5N9Nu5jsnQVF8nDz88f6ajcnaeYbr43GnXc2IkYL6FGnPcboRnG0eb1dWeWXGfxs0lNaDdIgDSZVh4aIDJW6I/hlX+QNhwhiSh24OXyfrpf21hMb86Qg81gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144403; c=relaxed/simple;
	bh=YcvanB4jdszk6JqDPQ7fTpSSQj43jNNPDCWY9Z5u5rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h22eEsoR50cDLDNwB2QFPxHEfk/hCkpzwd5jVCuZjW7/OEy7viAncRqE27X6BjDxxLgALVNjfihWU802WMQ9EM+sHTysISnedTbz5Adabz0oo6fgS49FoZlzDfM2F8UMYyQkm3t9tdJNwnZZMx9De1ggnJ9vIGnbCPqiTdWXPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtTEm0Ca; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtTEm0Ca"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bfd0e99154so201708139f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707144401; x=1707749201; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SGwUTtGeibSiNnaKrYoED8DZ5uZu6cG51vLuMqWir0A=;
        b=mtTEm0CanGV6H+8H2/EQc/r6fDzlCzJC7nruXusRCyiefHK7HtqN7DblRE7IEkzAcl
         6wScWTidvngARYOwwdpcQzJfbj9iTp5Ax382YM5dktT1fuECoflmHbI4B5GJ2D1jwoLr
         2T35+NOThvxibo1qrY1XdwojbNrytSu+JOv5DRoJXusHjFchYPze4MioN2PJYJ7mptig
         A5+VZ3t+rinaoy/QBIdH/cUvBi3HQfTTO7G0jHzi/KefEdXi1hQKOg9j0fXAnh/idwzv
         Pm5OyTUy9bKKxHPxC/NOvRhd8Gjo0VSITIhyFjR9AEd77+24aDorM7+XnTbhzfLLoNOU
         75CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707144401; x=1707749201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGwUTtGeibSiNnaKrYoED8DZ5uZu6cG51vLuMqWir0A=;
        b=fRkfd4OakHz39Eud9H52H+m+2AoUe+2eIJR5eJh8eWHgOxAKyAOH9dsnVdor3ZlgLv
         BEdmuzhUuV7QaeOAlxwK7NjynDjwVACNBPhS6G5oEFYxCvMPmMTfVA8+6mxHBdmzz1f0
         4fpa4XjYcrF7dqUI/m9n7xD7Ebh9bhuuThsRGBGy3lUgocWDnljZADEMV9sIIWG/wy7h
         0f9Qcq0MwIOxBhx192M3kKgaTJzpcF7JcGDOX0lS/V74zrrEemJ+cKEvwetBPz5+LKeW
         xq4EJ0hflvbYhsIu/BykykTYCRc19xGRUT80S7e7/Phi8G74ZkJhlG9sdOuQ/e2bnGyV
         ZP2w==
X-Gm-Message-State: AOJu0Ywj9c9B5AipSauvK4YdVwEKl6QV7sKrXhQGH1UNnS9v38vU52y0
	ncSEc0TdhktKO6SZhZ1fTYATyG1REto2Ov72ASFepmescEXmDFs3p+oxNDAXs5A=
X-Google-Smtp-Source: AGHT+IFqPnw8kBCUIv31vakJ9nlM/mVmyovMmQLT20USbQPe/u4h69wZoC9j67kbGnAnwnHECdIcSQ==
X-Received: by 2002:a5e:c241:0:b0:7c3:e397:23da with SMTP id w1-20020a5ec241000000b007c3e39723damr2099707iop.17.1707144400627;
        Mon, 05 Feb 2024 06:46:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWZT5s/a8vamts/fyt/dUID43xMVn2cg6mjeVkoRu7XZ4mNSRIXEw7NdUQr6ENlCO4SscAr3UzMoJZq/8+RuO8C0Tscvq6DJ3UuaT0JIBJzk3UlnOwCRq7f+jUoziDX4OcQwGkXNYFgi2NHvQ==
Received: from fedora-laptop (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id q27-20020a02cf1b000000b004713c126865sm31814jar.112.2024.02.05.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 06:46:40 -0800 (PST)
Date: Mon, 5 Feb 2024 07:46:38 -0700
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Subject: Re: [PATCH] rust: place generated init_module() function in
 .init.text
Message-ID: <20240205144638.GB296718@fedora-laptop>
References: <20240203182735.295946-1-tahbertschinger@gmail.com>
 <CAH5fLggUe-O8Zh+y-Lh7pquRNEWsEorkoT=xXjjOC-Cp7gcwyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggUe-O8Zh+y-Lh7pquRNEWsEorkoT=xXjjOC-Cp7gcwyA@mail.gmail.com>

On Mon, Feb 05, 2024 at 10:45:19AM +0100, Alice Ryhl wrote:
> On Sat, Feb 3, 2024 at 7:28 PM Thomas Bertschinger
> <tahbertschinger@gmail.com> wrote:
> >
> > diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> > index d62d8710d77a..d09be1bee397 100644
> > --- a/rust/macros/module.rs
> > +++ b/rust/macros/module.rs
> > @@ -225,6 +225,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
> >              #[cfg(MODULE)]
> >              #[doc(hidden)]
> >              #[no_mangle]
> > +            #[link_section = \".init.text\"]
> >              pub extern \"C\" fn init_module() -> core::ffi::c_int {{
> >                  __init()
> >              }}
> 
> Perhaps this function should be made unsafe? I don't think there's
> currently anything preventing safe non-init Rust code from calling it
> directly as-is.
> 
> Alice

That's a good point. That makes sense to me; I can work on a v2 that does
this.

- Thomas Bertschinger

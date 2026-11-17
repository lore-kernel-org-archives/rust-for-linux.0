Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949112;
	b=tAnm2qtcKjUPrgRYrCxBuHZvh02MW+Qz/etuhzEb9ctMwrL+uu6FLjf+2rW0ayK9pDTo
	 EiJlbPMNJKCOZow/L3c41tma/ZK+wdCq27JaFceVegVQ1uDHaJdUWUp0i5wcTqOz6YTqH
	 rw8bfkwrtA9MmDSwYsflgMMjhyTW2XNeEvEuuvzmopCvB8EvWPBskzr3Snqro3C1lMROL
	 dErfuwj23KQEpzrOENxome03LKeG9LOxyvw7HFoR7iMgKRn2VU+ZOuvNVsJ8VQK2+V5gE
	 oDFnF8Q1RPL1LFYFvb+uoqdQTJ3QYdnsAWgHKzsX6ftykC0/Fu74iq4UN5cetC8/qTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
	b=L/IBPWTFSWluL6Zlz0XDoNDqJ1UCHL1+NAuehfyQuvTKjLch8FI9xbGDUtYnErHEx/v2
	 ZoNwfnBGpVtkbubqUVM8L7mt3UCuy4o9VfKrcbg+G0+IV3kfzJzGEaXDFkJ02GqIDoCOM
	 lMZmANTYrWg9EEinYKR44fiCmWXDLZgjXii7aQgxSex46VPnO2M5pbxSFYGaY0yQ3edL8
	 ScKU5+6hYMo9ab45H81z18/VjCtHBfpRz59Ct8bydtpOtgN8kxwFYz+sxSeUyT5j5mqfW
	 t/yLsLhu+0nAzj9IxO/Xh6o+LAbMPZ4d3WLEuuUoOkeSJ49kU2u14T6tZXZGLeZXB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEoG3bbe;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D2606A31C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 20:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEoG3bbe
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-499ca65ae87so58439f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949110; x=1795553910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
        b=BEoG3bbe+X44bTop85+JzGGwfeJez2VhBfP3wsedmgzc9Pq3AU7HvUtvfqz6q5ng7R
         vgXiokxG1NRobsTwMDn/FBLpEwCXDkFf5N0UzWcqum0rRdnPstluxWLUDGDK89O5r27/
         /AnPPVXhnzJbdaxuYmkpwnVB1SUkOiT6hS5cgzU0sp9WzvzQwaxfrcWKhixpJKKF6TCO
         QgtehKvx6RFHC35+VTRAqleyCLh/dCYMJqwtx18o35SUKQ4+K286LfykVDYMpXSVgzDt
         GeLCfwr9HmhEOeDf0Ynovdj/MHacld6x6QomeRn3xAQ94SDVf8MqKsQxlP2qpJtYWuvv
         V1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949110; x=1795553910;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
        b=OGEf8aPy1L5iIwkxVpEd5W98hnWPkBZtaL3yOZLMPXzIhuVu3HoYH57/D2Ca5/ystB
         2lcYCxXwN1/AHN3ANwvg032z1B6etgzMwcjRrOtidnnZmmTUs0RrwHIE6arI2nwAE41A
         UTOdwJJDZ9upFlHDIaNBdc82ejDUsrO7PHpfNPjpvyh1+Sa8PWYhFziqKeqaKSShLyCM
         wntwVxdHkafSGVUzyXzme6bL1lRgrFP+rIfWf4y5uMNew4kjgiEc8LfsymH+SNP290Ef
         X62X07GhE+2+1vrFuuEm+P3oTqPYOG0h5M+Tb7wTN8Uh6XJblYh5FiN6TXXPOFhk9bUd
         MYlg==
X-Forwarded-Encrypted: i=1; AL+hErE76rJjTGHHF6//lqjZuH/Lz31fvu0JdvlOutAHvjxFf4u8SJoa6iFmMsK8gBWEbPhOBDvhWR7Wgjav2oqY8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9W/q73HoEMOQtXEyocDjcdo7SZDaFMOHG0+DA9Sm6gLgKLfpca
	VgI6uiyOlVT+FyrZZPVEW+OyjPNzu05NlLcl+12frhe7yt+YJc1TnOSge5Ej0SILbNjlF4F8IBI
	J9m7mbNxuVo405rUqFQ==
X-Received: from wrcz19.prod.google.com ([2002:a05:6000:4553:b0:497:e67e:6f53])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr8397843f8f.1.1794949110053;
 Tue, 17 Nov 2026 12:58:30 -0800 (PST)
Date: Tue, 17 Nov 2026 20:58:29 +0000
In-Reply-To: <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com> <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
Message-ID: <avy_9SPRaPSKD8b4@google.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > The LLVM fix itself is trivial, and it looks like a pull request for
> > it already exists. I assume we'll want to drop this flag for fixed
> > LLVM versions when they're available.
>=20
> I will link it in the commit message when I pick it up soon -- already
> did in https://github.com/Rust-for-Linux/linux/issues/1132.
>=20
> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/iss=
ues/2.
>=20
> The `-Zmerge-functions` flag is internal but has been there since Rust
> 1.34.0 in upstream commit:
>=20
>   b91d211b4030 ("Add a target option "merge-functions" taking values
> in ("disabled", "trampolines", or "aliases (the default)) to allow
> targets to opt out of the MergeFunctions LLVM pass. Also add a
> corresponding -Z option with the same name and values.")
>=20
> so that should be fine, but I will ping upstream Rust so that they are
> aware we are using it.
>=20
> And, yeah, agreed, we probably should remove the flag conditionally
> later on, to confirm the bug is gone etc.

Function merging should also be disabled with gendwarfksyms. It causes
faux::Registration::as_raw() and Page::as_ptr() to get merged, which
incorrectly causes the former to get the CRC of the latter.

Alice

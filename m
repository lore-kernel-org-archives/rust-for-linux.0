Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419A221F21
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479003; cv=none; b=akoGrDPaJXWMpWYE/Qg/Z8qCWsQqf6b1gn5xvI7bWg7dh+y5TlkIyi22PDDu1Dna3D+Av3QvZH1D0GRhMYcUQVOgqzBUadKqbL9WManrx8HeVZsZNDB4L/98yJCzxwGoJz7QgW1qZDZpoafT2dC5ez5M6/XccnPRtwlrXaThJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479003; c=relaxed/simple;
	bh=S9T/qBL+z4aNd6M0Hkz2pYEIkgtE38X3OTfgtg4dx7c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ebMgsTfY5sylazdZEArYrAFp1/RJzZwS1cWb74CjfcAXDlMLR1W9AiNUlK/c/84fD41BHOoiU5OGQ2+Ca8PUTdqSwdF5TFbEJ2wYHmy+tdUh8qX6k4k6r3VPz8zJ6FdNDZmOKGJWktksMTRaNDkdwtm8mUvwne5xxIaGCbzXkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I8jBjX0C; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I8jBjX0C"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912d9848a7so995209f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742479000; x=1743083800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWWAhmzvNwlqSFcvmaCbepdAYIL6fnNZCCrItGOwILo=;
        b=I8jBjX0CNcMzw4nly5M5euWr4s1AomnOZikZCs4AhYo35H1WlvSQkF67ZT6XMVFEuB
         WJN+LCfdxGw2g7k2UIP1uc6B2tF+xkKgwq/8YcI2t+FxfWuC1fD+YZkDjz5S2AvzLWaz
         mkvH+uS4/p5RS69qMmouGPhS7SJOmubS+eVWs3yAIs8xPeFY1Y7S0e+DD3U62vFbFW1u
         Kc3ggIzSQmdsN+cTsnOMpLikbi1iQF5PAgfSE1bLQZ0eSEjhAcZBgBaOYfCrOmLptg0w
         kHVw/h3N/siEMaZoHQmEEFttcHJcDBxCEt7kwd01oM6i04OrhAI3mRe+kxy2saFnWClM
         PsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479000; x=1743083800;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kWWAhmzvNwlqSFcvmaCbepdAYIL6fnNZCCrItGOwILo=;
        b=AyCPu3VXSoqWq3pmKqlaKJuV0c7TnlfXGjKd37n7puiCAlVOPvZzJxW1zslToWGtIg
         aHEExYJIfeg6dgaP57QiOPGY9FuMGIB/VTlSDZWsjTrZf2ylgS2Re50EHZJIKR++e+w+
         E4dHf2lX0QTkodDCmaQhN31TIBgVBnX9ZgA0QHLTOkj6YcTVcIypK05VGNb+HpNTsOHV
         jvLMWN3QBqljXI4HQ+rQRMPZX192P/5aYqdh/WxX9rwq12D4zo3ftiDT5HQGhT798nzp
         0EKa3YxWFQk+D5AEpb0Bu1tdE0BhgC5XJ0o6CBOk9MPJF5PmJsDQVOnj9TEHnu9+WMAd
         X5oA==
X-Forwarded-Encrypted: i=1; AJvYcCXFMwmDn2cp+YWfEL+0TDyJchhGhvcZNlBon1MyT4VIjYGfubMBWd+d0LR54f2wyafKymlOjIT1LrUr36z55A==@vger.kernel.org
X-Gm-Message-State: AOJu0YymVGBuh+clq9DiyiX9IdJ+xfh+PxwfP0MYNeYhIZveDlTLCsEh
	47a986feQHMMdhnaifqMg237SwnU6SWc0lXKhHoGwLFHTfic907DJxkR1iqgljbXAcApqWjTFKM
	rzhXa/X7bXP+YTA==
X-Google-Smtp-Source: AGHT+IFGmucGm31xquzCIdMPfx+iY6I4pvpkEGnfiBPJy7YBlidkxn1rhz3SbgkwfrscFWZRuiT3zZv9bZSaQQs=
X-Received: from wmbfl10.prod.google.com ([2002:a05:600c:b8a:b0:43c:f122:1874])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1f88:b0:399:6d6a:90d9 with SMTP id ffacd0b85a97d-39979586b74mr3303422f8f.18.1742478999908;
 Thu, 20 Mar 2025 06:56:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:56:38 +0000
In-Reply-To: <Z9wHv-2HXfoYZFmk@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250319203112.131959-1-dakr@kernel.org> <20250319203112.131959-2-dakr@kernel.org>
 <Z9vTDUnr-G4vmUqS@google.com> <CAH5fLggvFanUvysDkZiLqFz4Ay7XSP5LF3CvxBU3xgWE3PSZXQ@mail.gmail.com>
 <Z9wHv-2HXfoYZFmk@pollux>
Message-ID: <Z9wellJ7Rsm6Wvd-@google.com>
Subject: Re: [PATCH 1/4] rust: device: implement Device::parent()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 01:19:11PM +0100, Danilo Krummrich wrote:
> On Thu, Mar 20, 2025 at 09:40:45AM +0100, Alice Ryhl wrote:
> > On Thu, Mar 20, 2025 at 9:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > On Wed, Mar 19, 2025 at 09:30:25PM +0100, Danilo Krummrich wrote:
> > > > Device::parent() returns a reference to the device' parent device, =
if
> > > > any.
> > > >
> > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > ---
> > > >  rust/kernel/device.rs | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > > > index 21b343a1dc4d..76b341441f3f 100644
> > > > --- a/rust/kernel/device.rs
> > > > +++ b/rust/kernel/device.rs
> > > > @@ -65,6 +65,19 @@ pub(crate) fn as_raw(&self) -> *mut bindings::de=
vice {
> > > >          self.0.get()
> > > >      }
> > > >
> > > > +    /// Returns a reference to the parent device, if any.
> > > > +    pub fn parent<'a>(&self) -> Option<&'a Self> {
> > > > +        // SAFETY: By the type invariant `self.as_raw()` is always=
 valid.
> > > > +        let parent =3D unsafe { *self.as_raw() }.parent;
> > >
> > > This means:
> > > 1. Copy the entire `struct device` onto the stack.
> > > 2. Read the `parent` field of the copy.
> > >
> > > Please write this instead to only read the `parent` field:
> > > let parent =3D unsafe { *self.as_raw().parent };
> >=20
> > Sorry I meant (*self.as_raw()).parent
>=20
> Good catch, thanks!=20

With that fixed you may add
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

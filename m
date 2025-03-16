Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42EA1863E
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742126899; cv=none; b=PDiFwydvTh9+fpZC7dHF32XHcMg+q1BNTNZDHMueYR28xFg+uLuRtzqy0FwaPucPicj6WMknfXVYX2Mdcm4e0ojnJNd4BXJiT9qNgn/+MMa9PtEtmeqKcyIE0M5/pBZiLuIIkaoKXhH9fXsnJFKbsKwd8RnUaGHvm1zQ8yDvcl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742126899; c=relaxed/simple;
	bh=YQFQRKcN0MuiinwM/PmvVQ2irw30ti1YB/66SVC99tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr+3mZvFUiDqhFpH4o3fKLk2uRSIFHtGtop3XRrNO4F1kLADN4CW4YsvQvIaQFQUDxvKKTpybdDOUv0xXCaM6fpJfk7lYukkepi69d38zRKzFpFe/L/6KCEUS8kNNY1HteuEDR2mFQSN8InG2ZQmS7DIvwpOqm2IIPP5mq9ezv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3GFOc+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3GFOc+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B767BC4CEDD;
	Sun, 16 Mar 2025 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742126899;
	bh=YQFQRKcN0MuiinwM/PmvVQ2irw30ti1YB/66SVC99tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k3GFOc+hp8GcBL+MsRAho4hDY9Xds3FvdSMu80srJdluHWRf3zyVVT4T4MkwCimgr
	 MnYDkPiKZsOvf7qU0YEhLYwD1lsdbRtjibpEVowT5bQHg3umKqljp28dcc7aEWjNc5
	 /eQyh6ZhuZcEn2tWQ5Gp3jtpo1cZvslGKTQ9ZPjWb2V1XFXu58Jd3fUJRkfRdP/0zj
	 vVVoA05kJHz2KeEJqRn37IAsLptj1t7Ts6y2d3O+rjMYNMl2m8DDzcxVxGWua058lu
	 NgnW2JqCbfpPQYxobURxarSXTcUthBvJrlA9dHyef1M4jG7zx8QfSzbHDDzI9Q10a+
	 stmeI8mOP84CQ==
Date: Sun, 16 Mar 2025 13:08:13 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9a_Lf1kTknUrDrZ@pollux>
References: <20250315154436.65065-1-dakr@kernel.org>
 <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux>
 <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>

> On Sat, Mar 15, 2025 at 12:06 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Sat, Mar 15, 2025 at 11:45 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > >
> > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > index ae9d072741ce..8540d9e2b717 100644
> > > --- a/rust/kernel/alloc/kvec.rs
> > > +++ b/rust/kernel/alloc/kvec.rs
> > > @@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
> > >      ///
> > >      /// - `new_len` must be less than or equal to [`Self::capacity`].
> > >      /// - If `new_len` is greater than `self.len`, all elements within the interval
> > > -    ///   [`self.len`,`new_len`) must be initialized.
> > > +    ///   [`self.len`,`new_len`) must be initialized,
> >
> > Why a comma here? There's a period on the previous list item, and a
> > period seems more appropriate before the next item.
> 
> Did you see this one? Was it intentional?

Yes, it's the continuation of the sentence of the previous one.

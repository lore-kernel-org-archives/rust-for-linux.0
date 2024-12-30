Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73319ABA3
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Dec 2024 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575836; cv=none; b=Ojh16F4ck3XSc0REazvw4lPCsOnip5R+7VIlsHnK3QJBaNcMz2LcT2FgK11f3xhMgeBwk+SrOdYU7EBj+An3w9J16v7byHiibbbwDNZG0vIJTfWXvGLCLcDoNBum46VOd6mRnQLY44o4gmRfpRehiA0v/iXHtF7KCHE9GCj9Wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575836; c=relaxed/simple;
	bh=rbDaczH5dpREIoVQEct3GxBCn1eIrIUzpUMxumUdRIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzxWJ7aqlCeuLDuekdPZIVSGT92Sc1p8a2VO6y0a92ux8HGHkM5mkJAYYSC1yCpi9LxHicszEJ6ICNZK2J9T8I4J4k8M73ZIyYoW3vvtwayOuvrojIsE5m++NLC0verOC6TCtcIgluvX2pli43XLoCl+vi1UqTEORwqpqdeT9WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ludjNJ6G; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ludjNJ6G"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f8524f23so1019584785a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Dec 2024 08:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735575834; x=1736180634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAxY7Vi94CMhBeJccum4UKJeyjsrRgZGF7GZ0UbQzn4=;
        b=ludjNJ6GjjH7SFYd64/BqvRtYHDJACXLD59HHZNfib5jIvUwe4uhGuHS1cyzaVko2N
         TkL/SVIgXoIcJZWrZ3KxZE60pFVjU35RMkVCpeEzs9pIKb/QH8NLZoHsCkJieboggCP6
         D3eTgg5v1gMN26MIhc0m3AFEa2DwvRaoTMM4UOm2qeaU1wZnJbu+K7kdcUKY+LJkgFVd
         DsvANcT2FJZziN37gbm8mCwXNVvkwZldWuQC2XBFTmhefeb89NpfLN+MkGE84DB0p5UU
         gWQKeXo9kb7hehK3ILKrDp+5NjFRCVmz2SEVyBXmugwxvc+TPaNXu2/83NQkdg6HAqgp
         Ymcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735575834; x=1736180634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAxY7Vi94CMhBeJccum4UKJeyjsrRgZGF7GZ0UbQzn4=;
        b=fv+sQV39z2HRwbg+tW7IO92LX+p2cJfymxtF5RgXDkt+RXnvMj3HtAbd0JP9aifFJj
         AN096liyIj/y12r2euUYqJDucHcTKmv0WE7t6QyqJZgXU9IVzrVoD8ZdCsniskdwuJzk
         zSnUYkpi7nZDs4+yZWLMWU2iSWyIrufgsdi6N7fM05HhGUrZGrlq6tpYIQws+VDfe8R8
         NRjB9wrS0jOHSOLhIiRDlnrNxE6yznh21AXwYvL+xT8ErEQraMWFmMjc6hPw90RtU+FV
         GhiHFy7JxNamCJtRwRzR7qZI/5PUQBoX0VB2ajNFcZlpWHx5orXSastSeuvkwpQMoXdw
         PVDw==
X-Forwarded-Encrypted: i=1; AJvYcCWL7noRXE3h+VfD2A/1MhbPLjPZB7WC7axmqQm77D1tLLPgp6t53D+hNxhbarZg0PX7StaH6F4MEnXA1KQKsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyRTgW15KSBanTuyVATKQnes8Q2lMqNcHTipEd3YfR8zFOUfv6
	9f51/F9n8FfS/SLYf5bvfypg2Rj9ZWUOc/dHGzjTsqPsmNwL1B85
X-Gm-Gg: ASbGncvACvszWx3sJOoUck7fiFXs5ZTNaVdwiTzf2z8OGf2XWCV81DQ9mygKG6APrkZ
	uMrTw6qbe8AtsXWiL+u7QjBaGZPOOeenR64WBesHM8e/vmBtlmVZ5r/+6mLdA3oWaU0BBTR5g0f
	P62ja2wtMiKjUm6L0iIfV/b+n8EmEG/SIbqDVvKDS4j9Ikn9BQthUVR9+7PX075uEuFc3ZqU/rM
	kTzH/rekhSjDPnRv3GxJ1lPXZ6XxdY3Kk4V5MavXuR6cTWYsyIFEzPvv+Gg1RkzPT0i1gANY8Zk
	BUWe1JPouBbmINdZB6XmpqyBcQ1uCWvVDj7cePGJrkliHDI=
X-Google-Smtp-Source: AGHT+IE/pMNpCukH21YMRybN3Z6tHwMR+8fTmViwioA1hw7YZXJzE+Sr7H8/jPHqRd7RsT/z0M7s7w==
X-Received: by 2002:a05:620a:468a:b0:7b1:52a9:ae15 with SMTP id af79cd13be357-7b9ba716abfmr5849040685a.9.1735575832475;
        Mon, 30 Dec 2024 08:23:52 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4cbb6dsm930898485a.102.2024.12.30.08.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 08:23:52 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 60BEE120007E;
	Mon, 30 Dec 2024 11:23:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 30 Dec 2024 11:23:51 -0500
X-ME-Sender: <xms:F8lyZ_Wa6guxVK-cAaRCXIjxW-y-LIkRl02Ng24KpWPJavRQ0fJh1A>
    <xme:F8lyZ3k07nFMzCpCtNHKdsT3cWi95G4bUyCgfWF9qQ6NBCEZx3F_DPZBu5W_v2_WE
    5KxZ92cDCco1ByWdA>
X-ME-Received: <xmr:F8lyZ7Zlfcqd9ZycyaUS8Bnnfh90ClrSpAR5sJ2i0y5e6oEi-E0yehu02Qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddviedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeduudfhvddttedvheeigeehgfejvdejhfefiedt
    heeijedtueffgeeuvdeiteeiffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhrvg
    gruggvrhdrrhgvrggunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqie
    elvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdr
    tghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheprghlihgtvgesrhihhhhlrdhiohdprhgtphhtthhopehf
    vghlihhpvggrghhgghgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoh
    epsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggv
    nhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomh
X-ME-Proxy: <xmx:F8lyZ6U-cb3Sdl8E433CCGkHAfffovbSnLzOxatYrofplONBUm0dlA>
    <xmx:F8lyZ5mu33k9l_djbuXEfII5PXnQKvDxOUbUPSfgpjaXCi2pZmv3yQ>
    <xmx:F8lyZ3dpDf-4lSKpyvID1grZW3lIZ8NmtODAraHUfil5vBQtbiLH3A>
    <xmx:F8lyZzFjyINzY1jO1KNh4lFaXITuhgTVhc54WhjyE9dwwV6toI7GhQ>
    <xmx:F8lyZ7kOTR3qWDlmxFk4-S-TClqMiNXMtqdtqK1lsSgqMcpOl5H_v6xF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Dec 2024 11:23:50 -0500 (EST)
Date: Mon, 30 Dec 2024 08:23:19 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <alice@ryhl.io>
Cc: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: Re: [PATCH] rust: generalize userSliceReader to support any Vec
Message-ID: <Z3LI981PbEwMts1-@boqun-archlinux>
References: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>
 <Z2hKTPIBaJ2K9HJn@boqun-archlinux>
 <7fee31c8-6319-44d5-b01c-7f5022054e10@ryhl.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fee31c8-6319-44d5-b01c-7f5022054e10@ryhl.io>

On Mon, Dec 30, 2024 at 02:21:39PM +0100, Alice Ryhl wrote:
> On 12/22/24 6:20 PM, Boqun Feng wrote:
> > On Sun, Dec 22, 2024 at 01:37:02PM -0300, Filipe Xavier wrote:
> > > The UserSliceReader::read_all function is currently restricted to use
> > > only Vec with the kmalloc allocator.
> > > However, there is no reason for this limitation.
> > > This patch generalizes the function to accept any Vec regardless of the
> > > allocator used.
> > > 
> > 
> > Interesting idea, however...
> > 
> > > Link: https://github.com/Rust-for-Linux/linux/issues/1136
> > > Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> > > ---
> > >   rust/kernel/uaccess.rs | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > index cc044924867b89f6116c7f9ec216d8cea2b3f8d7..719b0a48ff5550acc19f2e607c0a09f818145def 100644
> > > --- a/rust/kernel/uaccess.rs
> > > +++ b/rust/kernel/uaccess.rs
> > > @@ -5,7 +5,7 @@
> > >   //! C header: [`include/linux/uaccess.h`](srctree/include/linux/uaccess.h)
> > >   use crate::{
> > > -    alloc::Flags,
> > > +    alloc::{Allocator, Flags},
> > >       bindings,
> > >       error::Result,
> > >       ffi::c_void,
> > > @@ -127,7 +127,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self {
> > >       /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
> > >       ///
> > >       /// Fails with [`EFAULT`] if the read happens on a bad address.
> > > -    pub fn read_all(self, buf: &mut KVec<u8>, flags: Flags) -> Result {
> > > +    pub fn read_all<A: Allocator>(self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
> > >           self.reader().read_all(buf, flags)
> > >       }
> > > @@ -281,7 +281,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
> > >       /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
> > >       ///
> > >       /// Fails with [`EFAULT`] if the read happens on a bad address.
> > > -    pub fn read_all(mut self, buf: &mut KVec<u8>, flags: Flags) -> Result {
> > > +    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
> > 
> > ... what if the copy hit a page fault because the target memory (e.g. a
> > VVec) is not mapped? Would copy_from_user() handle this? Or would it
> > return a different error code than `EFAULT`?
> How could the memory not be mapped? A vector lets us obtain a &[u8] to the
> memory, which isn't valid if it's not mapped.
> 

I mistakenly thought that vmalloc()'d memory can be swapped out, which
is not the case. So you're right the memory must be mapped.

But the usage question still exists: do you have an usage case for
reading userspace memory into a `VVec`?

Regards,
Boqun

> Alice

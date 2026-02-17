Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC32FE593;
	Tue, 17 Feb 2026 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319854; cv=none; b=CIoTXeMHixMCcbnbijNLsfHiFSXEAEZRhFdba7McmIGVoGtKW40mQ2uHVUqUGrWP5HLIPuvC5i8nRV+zvImWTchmdwF14yZfkEJ/eK2dXGM3JksuWDyaRyh7/RbHc4EtcgRQY/IE5hraFf2bdWLahRF+7nPgOuKwf2pF7NFbTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319854; c=relaxed/simple;
	bh=FK8HEp1MtP9smfJ/su3Qtt0DpWL4giBXluxVWOSq4g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFCbPyl/IUS/8dsbr0tqCbufMM90HndIVt1Ebt4yu104j5IsNhksBrcTaXWbKYlJWJ2M2dm/5on2qOkSndi4jC+Kpdqq8K4dkwkV10i8nEAbPXr3f6Dx7r341AxF17MOLk+K+8EzPmBnJlf+65/ccKjx1UcatLh03eAxdiJRUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QZlDrP5Y; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QZlDrP5Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NMcaCvJ+VsP6giBf7ZN1YSDtg3HQ/fOah5gzjE9s5r8=; b=QZlDrP5Y0JpwgCqf29i4FnN/Nu
	Iko1dF7HxW+ARiccGLYmXJN4amHanoHJai1FlCcBNgV8bZyS1klk8UZ+N8f5TBumj2ZEsJTPZd0Wi
	jtfcFU1AnXOOo1bGYjaIDGWRAsa0RmO7y2FY1qvHeMk4W33YFQLt8/S6O4aeApNth5zqEj6QjFVmu
	EVe90V71dcXClO75FXC4DyHGhKSFwS3oTLcn1jBvGZmEF/RnPKrC5UqVejsEDxJkW6C1UasvQxvuP
	o+zZTCYXTAnga9lWEf6E9rrJZaXTLL4C6d2P2BG+m3dNUqUm1Zb+L96JExEZd1OuCJM4UJAAd70eR
	ZLFszwEg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCu-0000000Fe2o-2CHV;
	Tue, 17 Feb 2026 09:17:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CA152300CDE; Tue, 17 Feb 2026 10:17:23 +0100 (CET)
Date: Tue, 17 Feb 2026 10:17:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260217091723.GU1395266@noisy.programming.kicks-ass.net>
References: <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY9HD7nH5A-DtgmR@tardis.local>

On Fri, Feb 13, 2026 at 07:45:19AM -0800, Boqun Feng wrote:

> > > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > > to be 'BBBB'. The resulting copy can be any combination of
> > > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > > 
> 
> The idea is if using Rust's own `core::ptr::copy()` or
> `core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
> not semantically guaranteed atomic per byte (i.e. tearing can happen at
> bit level, because they are not designed for using in case of data
> races, and there is no defined asm implementation of them, compilers can
> do anything).

How the heck would they do out-of-thin-air? Any memcpy() implementation
that can cause that is insane and broken.

Compilers are broken crap if they do this.

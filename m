Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC3308F1D;
	Mon, 27 Apr 2026 23:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332942; cv=pass; b=lfPzecRp3nMkrDZcB9riD51rz15l9ymny1DNHQBKKFfVA+WCJhOhQB5olvtkt0mwCaEOwzhxEVDR2hkV5O8uzCUAB0oMHV1TttAa6tQFoVEXgu24NiAAk3Lw1l6rBOGHmAdoAGU5Cru4iCtQg+H32Omz5oE1BkwKK/Q7csMyQhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332942; c=relaxed/simple;
	bh=p8YKRzNC4H4aZ+5w8ufJ9P6l16Ymqg4vCjqGWWFej8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4SJjesHYKWPHUaFfO1Fsn++xUIFYt6wxrQUHExk0p9qBlMQCIlNAjmV8Oq+S+a0SiALV3gOsPMal8TDU9T9B+4OvUfQ9cQTLqPRwl1Ze0wOEEP7ucCCAy5uutSNSPqowpG5gBdLd5qIRUGeSa+AeJ29kySSR5oKGpYi7Nm+/TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Xb37mK1D; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Xb37mK1D"
ARC-Seal: i=1; a=rsa-sha256; t=1777332899; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BcnRHPIiiBm5tCMtlluGbcYewlliZpLdfV8SB+yRH0qoRW77iY81WBryS+nLt2ORRm3LShucm26ONvYO+xNc56KuPBmYoYYqSqx52G5P6JyWiepHNaBdMUpvo9p+XX+Vaf1D55kEgXIEii2cLbrMxjpjv12ZuYwbKeEHOZjoKk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777332899; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/OKreltVIsD6CRR65BkfC8xOBzUvWe2zt4X90eQRyNc=; 
	b=mXxunB0fmFoQZnSoysCp5ylS7rlckqttx0zXxNI2ctf5oPSw/ywvFjaAuZyYEsJUXL/Vn6JrqnsUxVlZgNssx99AWqLzuctsW3JDlCqwd5iUX7qASkr5GNv1dikKxWToHPLGYbcE5hDbaE5ctgHbbbUmh5KgPxAXTjh8m2N2gqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777332899;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=/OKreltVIsD6CRR65BkfC8xOBzUvWe2zt4X90eQRyNc=;
	b=Xb37mK1De3SuIePEZp1/H/OFVyhn9LgJYOLar0NwcXVkPTUyQDh/bv9OjwmSfZO9
	XUbC9nsSNUoS4NWWeeZoyBBTaCpSu8Ifr8pvfJZ2i7uONBdPJE/DKMa6+v6g/adaaPI
	8FR7dwmbEIznmbAv5UfmgNumTKD6MiuOU+mESsOk=
Received: by mx.zohomail.com with SMTPS id 1777332896974532.1895203699219;
	Mon, 27 Apr 2026 16:34:56 -0700 (PDT)
Date: Mon, 27 Apr 2026 16:34:55 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com,
	beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com,
	work@onurozkan.dev, alvin.sun@linux.dev
Subject: Re: [PATCH v4 19/20] rust: time: add arch_timer_get_rate wrapper
Message-ID: <ae_yn9kSEY_ryFBQ@um790>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
 <20260424-b4-fw-boot-v4-v4-19-a5d91050789d@collabora.com>
 <CAH5fLgjV17zrsSQ7xD4dpeXjRJFLSR4Er-fsr3vhLg_5EF_ziQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjV17zrsSQ7xD4dpeXjRJFLSR4Er-fsr3vhLg_5EF_ziQ@mail.gmail.com>

On Mon, Apr 27, 2026 at 09:53:42AM +0200, Alice Ryhl wrote:
> On Sat, Apr 25, 2026 at 1:39 AM Deborah Brouwer
> <deborah.brouwer@collabora.com> wrote:
> >
> > Provide a safe Rust wrapper for arch_timer_get_rate().
> >
> > The underlying C helper returns 0 when the ARM architectural timer
> > is not available or not yet initialized. Map this to Option<u32> to
> > make the absence of a valid rate explicit to Rust callers.
> >
> > This allows Rust drivers to query the system timer frequency and
> > select appropriate time sources when programming hardware timeouts.
> >
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  rust/kernel/time.rs | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> > index 6ea98dfcd027..03ce96450fc8 100644
> > --- a/rust/kernel/time.rs
> > +++ b/rust/kernel/time.rs
> > @@ -359,6 +359,35 @@ fn div(self, rhs: Self) -> Self::Output {
> >      }
> >  }
> >
> > +/// Returns the ARM architecture timer frequency in Hz, if available.
> > +///
> > +/// This function queries the system-wide ARM architecture timer frequency.
> > +/// The architecture timer provides a consistent time source across all CPU cores.
> > +///
> > +/// Returns `None` if:
> > +/// - The ARM architecture timer is not available (`CONFIG_ARM_ARCH_TIMER` not enabled)
> > +/// - The timer rate is zero (not initialized)
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::time::arch_timer_get_rate;
> > +///
> > +/// if let Some(rate) = arch_timer_get_rate() {
> > +///     // Use `rate`.
> > +/// }
> > +/// ```
> > +pub fn arch_timer_get_rate() -> Option<u32> {
> > +    // SAFETY: The C API is available in all configs; when CONFIG_ARM_ARCH_TIMER
> > +    // is disabled, the header provides a stub returning 0.
> 
> The stub is inline, so to call it you must define a helper for this
> function. This code will not compile if CONFIG_ARM_ARCH_TIMER is not
> set.

Thanks, I have fixed this and will send it in the next version.

> 
> Alice

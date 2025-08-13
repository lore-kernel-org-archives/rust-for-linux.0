Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD821BF58
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087375; cv=none; b=eoYlhC3ECR2ymkCFVj5ZO8C4PBVW6hdOQ9R3VNdfdAsWpxhSq++Q84sLKF1Lg6YJepnH2wBqO6T/BVhBO7RQ+ZyEJs2Sbzz+X4bxo+ZOT2+6lFgJjLmn/qezPEPxemD4SpKdz6r6eVUS0CPgtZ7h0kB2sL6Mi11iXhHTM5rf9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087375; c=relaxed/simple;
	bh=KTxhxErkoGgk/leFb1vBfn7BgYRjz8Airvmxh2BK/so=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FJlOftIbGMFjoy3loPtOCFhZwIc9SuO7RiUzDHCzmEp9BTSA0wgel6L8aCBDw79FlmsQqnQ9Y3E36WVHTZItBOqOiAveMMEhZAgDP/DnwD5gmwJD/NEJ0T+16qJV84O8VaVcqrbwA1IZRyVnG38WpwS+NmqwIlLyaPeuvhjyGek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XbTwTFmm; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XbTwTFmm"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b783265641so1342810f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755087372; x=1755692172; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aAcPy6OOvaDLuQladKA+UxyQehpIidG6jH1BCeWHQN8=;
        b=XbTwTFmmbHI5J3agCyaBGjc5d4WYnjRRJtHLO3V0bI95ko4skDPrXR5L7dhz3qoccV
         JUfcsuB8TldH0d0cRTa5Stg/iVeStSAHanr9Vk06QxUynCxt8HtWLnzl8j0PwplaefTx
         fqe/7VjNgySAV/HcVD2fkuu/DLbkZ9sZJg875Q0gEEFTMe92PBGYc+I3n3BMvkmtwWvw
         q7nyuz2dL/fUUz8giOxHvkusFWCpi8UtJEwIR3CV+oKJvsGLeumcGMf9s1qKfQj7ltyi
         UdPeZY/KhWyiVoBKlaRnTPfjL8ArmkQW+JupUE07rJ3FqUXFvvHEEBF4Ws0sw8gIUjwW
         NZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087372; x=1755692172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAcPy6OOvaDLuQladKA+UxyQehpIidG6jH1BCeWHQN8=;
        b=lHXyLHPw6N7E8vPInTIGCRIDSDak9RknyOoyXz/sCpHspzxnYoP0lFVFzz/vvPocQ5
         WwfR1FpJbLCR82O4L6aJub6fkdHqq3fiZCV2L5YhqAEk11/OwwuHR/2kKhboYUnO7Gt5
         i20RcAnd00gNJ/yL1RLBq8kCXog2e9aQmQG/JvfHutsRal/cIeau0qOo+2IXmTVvlkYj
         ofgsu/Uo6PmMSjJdhTefr95nufcub2i0xGUEdTynMk8UGtcC+w26i8528XQIHAYfOUJa
         BnMUlETqOZgIggUBPGV6rjH+Wg8x5LRyfW+Z4JgORIcHM2nq1kJ6l+yLqPr6Chqc0QFO
         +qLA==
X-Forwarded-Encrypted: i=1; AJvYcCUme12+o2bKzVxLeFBmlFTJhGSVTjR+LEY8zrQ/Y7lLvPxAvcA+upxf2XnhGTpZLyiMravTUYnSd7JQkwiSHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZzsiAhT400dgZRPK5u/vHJQfC0cz8Ou2fkrdtW8tRG9htE52
	AwVeaXg6VdClkuy9qe7kEjhY57uQ50KrUnEXpiXUPznM2CuO8/D1YZ+31+dgQtZdI37la9j2cly
	FzBXNlp4kKywzNAc82Q==
X-Google-Smtp-Source: AGHT+IHQ0m8F2SjtH5Qg/7q2hHM6FptOekHUq3DOw5fmB7MUe0ubMRTJVwa0W90hEX/2RnQENQYYs5PVkQXrucY=
X-Received: from wrbed6.prod.google.com ([2002:a05:6000:20c6:b0:3b7:84f0:22c7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:238a:b0:3b9:53c:24a4 with SMTP id ffacd0b85a97d-3b917eb4a14mr2231295f8f.39.1755087372444;
 Wed, 13 Aug 2025 05:16:12 -0700 (PDT)
Date: Wed, 13 Aug 2025 12:16:11 +0000
In-Reply-To: <DC19IMWVL93E.S1AO2KPXB3HU@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250813-iov-iter-v4-0-c4f1932b05ef@google.com>
 <20250813-iov-iter-v4-1-c4f1932b05ef@google.com> <DC19IMWVL93E.S1AO2KPXB3HU@kernel.org>
Message-ID: <aJyCC9E1kr4onwJ3@google.com>
Subject: Re: [PATCH v4 1/4] rust: iov: add iov_iter abstractions for ITER_SOURCE
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 13, 2025 at 01:27:41PM +0200, Danilo Krummrich wrote:
> On Wed Aug 13, 2025 at 10:27 AM CEST, Alice Ryhl wrote:
> > +    /// Read data from this IO vector and append it to a vector.
> > +    ///
> > +    /// Returns the number of bytes that have been copied.
> > +    #[inline]
> > +    pub fn copy_from_iter_vec<A: Allocator>(
> > +        &mut self,
> > +        out: &mut Vec<u8, A>,
> > +        flags: Flags,
> > +    ) -> Result<usize> {
> > +        out.reserve(self.len(), flags)?;
> > +        let len = self.copy_from_iter_raw(out.spare_capacity_mut()).len();
> > +        // SAFETY: `Self::copy_from_iter_raw` guarantees that the first `len` bytes of the spare
> > +        // capacity have been initialized.
> 
> Technically, this covers the safety requirements from inc_len(). However, do we
> want to provide a list of justifications if the unsafe functions has a list of
> requirements, such that they are easier to match?

I will reword to:

// SAFETY:
// - `len` is the length of a subslice of the spare capacity, so `len`
//   is at most the length of the spare capacity.
// - `Self::copy_from_iter_raw` guarantees that the first `len` bytes of
//   the spare capacity have been initialized.

Ok?

> > +        unsafe { out.inc_len(len) };
> > +        Ok(len)
> > +    }
> 
> Either way,
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

Alice

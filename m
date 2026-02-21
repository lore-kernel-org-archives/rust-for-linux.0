Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425C5A930
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771663392; cv=none; b=ZWsfInQrrr2FxtSJ/ay9STYZcJKZkfEtxY57Sg38sz3vON9CUAHN5+SOuiF80wI87u2n0POaQg14aEkA1H8URR/voNbfRxiXuMOJCdm3aCLq/D83497HD9xOdaLDcaATBxqUUmerLPv1N8JB7+5JAOp2O5OxxikGm8lmD3b3gIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771663392; c=relaxed/simple;
	bh=GatSdbu3Cxzh1BhHt9Nrd2UzxFhJ/XWk1amcznPRydo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JvH3xfLuPoIMCJ5+oURvmp4KnY0xO84lNWV7PP2wUOFLJlVNRwDVeP7G2++/2wyOXRfqGHsOsnVJSKOlGTLlo8fdgHUQTl5wuJV38Z2dKVdW63nma/RnyBoiQV98EijXkKgdna0CezxpTzAJN+4W3V7yLHSNBZYdIYKL9sMqfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJWh46oK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJWh46oK"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso30876295e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771663389; x=1772268189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI1u65dUKTPlQPt6U/0xJyIkF4F/BeJUkS8IGT0Cslk=;
        b=PJWh46oKd8V/2tTBsa7r3jYa+0wqbK9mnYhIC+OfcFesx+5E1/d452rH6F2LOOSAsB
         tWrmT1rrH7LaqPrxrxhLk+/VUHZJN82/22hA3lsU/VipLP2L13UalGZ3PEYf3/eSh+Xg
         l+buN/IL4NghZ0Np9/2AlPiDPaMci94YVxJ5wkLmIgxG4kUzXHFfiJArUATKsQvJykjH
         UPiNqJvX1uprZmnLE8Qm0sAL5r9T5ujSqXOBss/Z/KeUpgpD9tmTHrM4/LACHErUU8ZO
         jlK1NYKkg4gdvzRzVQACQfqLnx/HvHN+1p6EN3/WliARuwrPbvb6XqFEUJ7PV9UOVNLM
         zgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663389; x=1772268189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TI1u65dUKTPlQPt6U/0xJyIkF4F/BeJUkS8IGT0Cslk=;
        b=gpZ3D06zFPp6gJEr+fQ5RyxbgvxDz360AJvG5YZN6CkvEr8DJF58vS9dctCASXZgxb
         a5iXKcTHKSYS6JojIH6rbySUDUq2AeRgQGUrEyMifnEDxFzFofB5OTD4BZ66BI9T7z0d
         l/aOHdLCNacT5K3foUuLuEzML2l3BDTwpj0+3S2Wssru7u52HiNXSzbU4YFHclvZ6ZPj
         sJoF+HSeV0NBcAb/grNDy8kms2j8QdQR+sDfPFiEmW0AfwBq6B5Q667LCoVvsejKYwNv
         X4FfeHdBcIZm8K8vD5lNMSoePMg0tJz1pQKtcm6atAa5cVb+/lndxuMRavpW493EB87C
         WpDA==
X-Forwarded-Encrypted: i=1; AJvYcCVExuzVxselz/NZtYBO5SZDDVBSJlihYgfEVuQ/ueUXTlwkaKSHvaXTQVmg5eeY49hVk5u94/ScWZDzOAI4Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYN16YTOsM90QZxiaiBTaLdJdd5BGlMVkNzIxggDlK2CaOZSFu
	EsCQw/Orup0R4jkAHWTz95euAua6HPCh/1VaYGtKsFvq6McCFnMpktJlkgx5KhvFLkn6on6kRKX
	c1Wxunxe/zopfirWSuw==
X-Received: from wmbdo20.prod.google.com ([2002:a05:600c:6814:b0:480:6c79:b533])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr37449865e9.25.1771663388514;
 Sat, 21 Feb 2026 00:43:08 -0800 (PST)
Date: Sat, 21 Feb 2026 08:43:07 +0000
In-Reply-To: <DGJVC2YUHIK7.37Q47DI7QQK32@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com> <aZLc0YMHd8C0bVD2@google.com>
 <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com> <aZLzBP_v6JlTR9WB@google.com>
 <DGGBVOL5XZ5B.NIXE0JCEBJC2@nvidia.com> <DGJKZHBSGKKF.2S8URAVPODWJP@nvidia.com>
 <aZgYzbsVr2uKZUOP@google.com> <DGJVC2YUHIK7.37Q47DI7QQK32@nvidia.com>
Message-ID: <aZlwG3wK5w-IV18x@google.com>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 20, 2026 at 11:45:25PM +0900, Alexandre Courbot wrote:
> On Fri Feb 20, 2026 at 5:18 PM JST, Alice Ryhl wrote:
> > On Fri, Feb 20, 2026 at 03:38:46PM +0900, Alexandre Courbot wrote:
> >> On Mon Feb 16, 2026 at 7:52 PM JST, Alexandre Courbot wrote:
> >> > On Mon Feb 16, 2026 at 7:35 PM JST, Alice Ryhl wrote:
> >> >> On Mon, Feb 16, 2026 at 06:36:29PM +0900, Alexandre Courbot wrote:
> >> >>> On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
> >> >>> > On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
> >> >>> >> I/O accesses are defined by the following properties:
> >> >>> >> 
> >> >>> >> - For reads, a start address, a width, and a type to interpret the read
> >> >>> >>   value as,
> >> >>> >> - For writes, the same as above, and a value to write.
> >> >>> >> 
> >> >>> >> Introduce the `IoRef` trait, which allows implementing types to specify
> >> >>> >> the address a type expects to be accessed at, as well as the width of
> >> >>> >> the access, and the user-facing type used to perform the access.
> >> >>> >> 
> >> >>> >> This allows read operations to be made generic with the `read` method
> >> >>> >> over an `IoRef` argument.
> >> >>> >> 
> >> >>> >> Write operations need a value to write on top of the `IoRef`: fulfill
> >> >>> >> that purpose with the `IoWrite`, which is the combination of an `IoRef`
> >> >>> >> and a value of the type it expects. This allows write operations to be
> >> >>> >> made generic with the `write` method over a single `IoWrite` argument.
> >> >>> >> 
> >> >>> >> The main purpose of these new entities is to allow register types to be
> >> >>> >> written using these generic `read` and `write` methods of `Io`.
> >> >>> >> 
> >> >>> >> Co-developed-by: Gary Guo <gary@garyguo.net>
> >> >>> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >> >>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> >>> >> ---
> >> >>> >>  rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >>> >>  1 file changed, 243 insertions(+)
> >> >>> >> 
> >> >>> >> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> >> >>> >> index b150743ffa4f..6da8593f7858 100644
> >> >>> >> --- a/rust/kernel/io.rs
> >> >>> >> +++ b/rust/kernel/io.rs
> >> >>> >> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
> >> >>> >>      unsafe fn io_write(&self, value: T, address: usize);
> >> >>> >>  }
> >> >>> >>  
> >> >>> >> +/// Reference to an I/O location, describing the offset, width, and return type of an access.
> >> >>> >
> >> >>> > In the next patch you implement this for usize, but here you say it's a
> >> >>> > reference to an I/O location. I'm pretty sure usize is not a reference
> >> >>> > to an I/O location.
> >> >>> 
> >> >>> Methods like `read_u8` use a `usize` to reference the location we want
> >> >>> to read, so aren't they in that context?
> >> >>
> >> >> Oh .. I wouldn't use the word "reference" like that. How about "index"
> >> >> instead?
> >> >
> >> > "index" looks more accurate indeed for something that is not a pointer
> >> > type.
> >> 
> >> Actually this creates a bit of confusion in `register.rs`, where we have
> >> arrays of registers, which `RegisterArrayRef` was built using the index
> >> of a particular register within that array. If we rename `IoRef` to
> >> `IoIndex` and transitively `RegisterArrayRef` to `RegisterArrayIndex`,
> >> we now have an index that takes an index...
> >> 
> >> Besides `IoRef` is more than just an index - it is also an access width,
> >> and a type to convert that access from/to. Would `IoSpec` and
> >> `specification` be acceptable?
> >
> > Not using "index" make sense to me, but I don't really understand how
> > "spec" fits in either. How about "place" or "location"?
> 
> Well it's a specification of how to access an I/O area... kind of.
> 
> "Location" sounds good too, and abbreviates nicely to "Loc", let me see
> how that looks in practice.

Ok, I like location too.

Alice

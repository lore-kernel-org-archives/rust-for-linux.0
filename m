Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5805224F0
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Mar 2024 02:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709863464; cv=none; b=POQLDu0jR1IWE7N+2isllUYlkjy3EKeaWqMDaxmi/pATAP9xke8ywzyBRxYRO4imzbS3+j+lz+7IHqAoou3n1V5bSFb5SQCBN/JYth8+PX0/N7IfFRYgixQr13UndAkI6+nS5mgeFBOWoNqDqEYn9EXq8He76hmTx77dPZy0+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709863464; c=relaxed/simple;
	bh=LNChI/bDv/sWVPlnNFplRS+fOZG6dkv/hkAd8G4MR8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HssoZPlZtMipWh/ODZJkMYElrBe2nJy/ECrqDCBj/YfzwYCbYXAIfXvv8IN2j9HgTy4K3Wq0Wn/Yx8yAACCEpoxjvCHI+y/kVbZ/IPjo2bOnlM3TSxtq9YGLO30js311B/SUbQg3CdQ5IgqrYNlbtqzJmiizLTQ0YADZly6GLwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XOO9zRyW; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XOO9zRyW"
Date: Thu, 7 Mar 2024 21:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709863454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9PiUndr45S+vzs9M4BY0xWx9Q6LSRxjPFwpGH0rrUqk=;
	b=XOO9zRyWT0q3K01U8/NR6mnOgXDj9VVmATWb4yjAULN1z4e5hEWs7JsCUb7+dVUvsHI+oA
	OqLP5RD/rQH2d1kLWalYL+3zuE43s2gJXNXYHWkhGIkNXoVSOVHmxJbP5uUo+dgrINQGZb
	Ehx26SA204dvPQdCNV47fOe2DnKVW5Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: Ariel Miculas <ariel.miculas@gmail.com>, 
	rust-for-linux@vger.kernel.org
Subject: rust traits in kernel (was: bcachefs meeting)
Message-ID: <np7mqkkrnpvi4stflwkrrw7uew4fgkt6iqynmoiirxg4sdsjpj@dwnx334lctpk>
References: <hveywufltgcwqs6gciwuqyse7gv3k6fhvqftnjtc6no76ajdhb@6ro24ggp6qdp>
 <CAPDJoNunCinSA9Y=V5yEiFzTc7QU71Z=XKicJKNCQhDJEm0ROg@mail.gmail.com>
 <20240308003235.GA66553@fedora-laptop>
 <eqixbuwkcqmllbkoszgxxkyo6rj2izq3h5c4m7jtehbbyzqyt5@7upygcsju5ge>
 <20240308014248.GB66553@fedora-laptop>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308014248.GB66553@fedora-laptop>
X-Migadu-Flow: FLOW_OUT

On Thu, Mar 07, 2024 at 06:42:48PM -0700, Thomas Bertschinger wrote:
> On Thu, Mar 07, 2024 at 08:02:14PM -0500, Kent Overstreet wrote:
> > That works - you guys want to pick the time then? I'm the more flexible
> > one.
> > 
> How about Wednesday after 8pm UTC, or Thursday after 9:30pm UTC, or
> any time on Friday?
> 
> > > I'll give a quick update on what I've been working on since it's been a
> > > bit since I've shared anything concrete. I'm trying to create generally
> > > useful Rust wrappers for the debugfs_*() functions. Currently, working
> > > on:
> > > 
> > > debugfs_create_file_from_iter(parent_dentry, &T)
> > > 
> > > where T implements IntoIter and T::item implements Display.
> > > 
> > > This should create a debugfs file where read() returns the Display
> > > format of each item of the iterator. Bcachefs definitely wants this for
> > > the btree iterators, but I think this seems like a generally useful tool
> > > so it would be nice to try to make a good generic interface.
> > > 
> > > Right now I am working through some interesting lifetime / ownership
> > > issues that this presents. I can share more details in IRC or in our
> > > meeting, and hopefully will share something concrete with the mailing
> > > lists soon, once I have the code working and presentable.
> > 
> > Ok, that should work.
> > 
> > Did you consider the bytestream iterator approach? That's a more low
> > levnel approach, but it feels to me like something we're going to want
> > too. But if this seems like the most straightforward appraoch this
> > totally works.
>  
> That's a good point, the bytestream approach is more versatile. I have
> thought about it a little but I have not attempted to implement it yet,
> but I can try implementing it and see if it's cleaner that the iterator
> approach.
> 
> I think we would want something like the BufRead trait to make that
> work. The std::io::BufRead trait isn't available in the kernel so a
> similar trait would need to be defined. If it is defined, then
>
> debugfs_create_file_from_bufread(...)
> 
> should hopefully be pretty straightforward to implement.

yeah, that does look like what we want. Let's see if we can find out
what'll be required to pull it in, it shouldn't be much code.

> > 
> > How are the lifetime issues looking? 
> 
> This works by passing a pointer to the object that implements
> IntoIterator through the struct inode's private data, and then in the
> open() method I try to dereference that pointer and call the type's
> into_iter() method to get an iterator. A pointer to that iterator
> object is then passed via the struct file's private data to read().
> 
> The problem is that Rust refuses to call into_iter() on the dereferenced
> raw pointer because into_iter() requires taking ownership of the object,
> but Rust (correctly, from a memory safety point of view) refuses to take
> ownership of an object behind a raw pointer--even in an unsafe block. Of
> course, I know that the IntoIterator object was allocated on the Rust
> side in the first place but the compiler doesn't know that.
> 
> I think the most straightforward solution is to require that the
> IntoIterator object also implement Clone and then clone() it. But it
> might also be possible to also use another layer of indirection with an
> Rc<> or Arc<>, but I haven't explored that solution yet.

IntoIterator isn't the only way of getting an iterator. This comes up
with vectors as well, where often you want to be able to iterate over a
vector without consuming it.

So vectors have a .iter() method that returns an iterator that just
takes a reference to the original vector. I don't think there's a
standard trait for this "borrowed iterator" method, but it's a standard
thing for container objects - that's what we'll want to do here.

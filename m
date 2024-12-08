Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A859513B2B6
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733666213; cv=none; b=VqKf7rpBVfWPGjqJidDTQ5K3v1Oolo4x3FuPEsz+pOkUm5xhKOqmyJ9ccfsQwFXkGkPi4S8uLhIweTjXvwZ+MXnkR+kOlEDwOo6bbrJ9aPBoHQl0LBPsvt5uRuZIMPi3Jd6UGt6fvVeLCnh2sMQtypawlGCz9vkXRZvEmQQxvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733666213; c=relaxed/simple;
	bh=/VahnDBTY/YZyFdn8LC/kCtZXXLc89ClwsT68tW0tBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsTUUxs2mt8kkyqC4r5IeNzVVUrKHh9bGj18LcOtumFwnZC9u03+mUhIOxfI+tv2kUw2hgAVq8RBebLBhMn4R/cOMxY2CPL+e18bJXE/HyjC6HXXkrPL78fuNrYQ1xGdxJbd77fZdBBYb8vr7FdKf0lxlxz5pFWx9cZD9XQmvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KHPUzzD9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KHPUzzD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69157C4CED2;
	Sun,  8 Dec 2024 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733666213;
	bh=/VahnDBTY/YZyFdn8LC/kCtZXXLc89ClwsT68tW0tBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHPUzzD933jG0ZEgCZeL4U4Qo+UagHx7anoIQUrjpM2iKKv5LBj7bIWcHDjhvafdN
	 remdHmABP3lvdeWka9jQOksfUemrGWXW8MFyxXifQERM+nz68S6ZfkkH9pAKN8pX75
	 9rCP+VsX/Xir+5ByZlL50+uBSajZmod08R/3nR9o=
Date: Sun, 8 Dec 2024 14:56:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] rust: kernel: kobject: basic sysfs implementation
Message-ID: <2024120805-header-mantra-50fc@gregkh>
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <20241208131545.386897-3-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208131545.386897-3-daniel@sedlak.dev>

Some more review after I saw your examples:

On Sun, Dec 08, 2024 at 02:15:44PM +0100, Daniel Sedlak wrote:
> +/// Attribute represents a file in a directory.

Not always, but sometimes, be careful here :)

> +#[macros::vtable]
> +pub trait KObjectTextAttribute<K>
> +where
> +    Self: Sized,
> +{
> +    /// File permissions.
> +    const MODE: Mode = Mode::from_u16(0o777);
> +
> +    /// Name of the file in the sysfs.
> +    const NAME: &'static CStr;

No.  Well yes.   Kind of.  Why aren't you wrapping "struct attribute"
here instead?

> +
> +    /// Gets called when the read is called on the file.
> +    fn show(this: &mut K) -> Result<CString> {
> +        let _ = this;
> +        Err(EIO)
> +    }
> +
> +    /// Gets called when the write is called on the file.
> +    fn store(this: &mut K, input: &CStr) -> Result {
> +        let _ = this;
> +        let _ = input;
> +        Err(EIO)
> +    }

I see you called this "Text" attribute, but yet that's not what the
kernel calls them in the C side.  Again, let's not create multiple names
for the same thing as that's going to cause nothing but headaches for
decades as most of us flit from both C and Rust constantly.

Naming matters, be consistent.

Also, attributes in the kernel do NOT have show/store functions by
default.  The "wrapper" attribute type has them.  So again, be very
careful here.

sysfs/kobjects are tricky and slippery and take advantage of some crazy
things in C (i.e. object structure layouts and looney casts "just
because we know what we are doing".)  Representing this in rust is also
going to have those same types of issues, so watch out.  You simplified
it all here, but note that the C side is complex for real reasons (i.e.
we started out simple, and then got complex to solve real problems.)  Be
aware of our history here first please and don't make the same mistakes
we did in our youth, you have the benifit of learning from how foolish
we were back then :)

> +}
> +
> +#[doc(hidden)]
> +struct TextAttributeVTable<K, A: KObjectTextAttribute<K>>(PhantomData<(A, K)>);
> +#[doc(hidden)]
> +impl<K, A: KObjectTextAttribute<K>> TextAttributeVTable<K, A> {
> +    #[doc(hidden)]
> +    const fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +    unsafe extern "C" fn show_callback(
> +        kobj: *mut bindings::kobject,
> +        _attr: *mut bindings::kobj_attribute,
> +        buf: *mut core::ffi::c_char,
> +    ) -> isize {
> +        match A::show(
> +            &mut unsafe { &mut *container_of!(kobj, KObject<K>, pointer).cast_mut() }.data,
> +        ) {
> +            Ok(cstring) => unsafe {
> +                bindings::sized_strscpy(buf.cast(), cstring.as_char_ptr(), PAGE_SIZE)
> +            },
> +            Err(error) => error.to_errno() as isize,
> +        }
> +    }

You should ALWAYS call sysfs_emit() when printing out data (for a
variety of reasons).  Here you are hard-coding the PAGE_SIZE reference
of the buffer that the kobject core gave you, are you SURE that is
always going to work?  Please just use the apis the C code gives you and
don't attempt to re-write them (again, learn from our mistakes of the
past...

thanks,

greg k-h

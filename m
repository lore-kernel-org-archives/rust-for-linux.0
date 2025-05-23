Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF0C296D39
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020160; cv=none; b=OglDUR8D5YzpKV9/D5Cz5qgslwkLKFuoUowx31aFCII/ZKHS9vN1xUEgLnCCi/SPi7tSSK2m0qJKJsda+xpin9zxo7gm82PR5FiZBJdZ6GDVL23GySfEtBVHAXF7kXDEFveNJGixMRXTJJwo25b3/C67ZOWYHijYHV0BbXR5chM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020160; c=relaxed/simple;
	bh=WVWQKxqG+FpH6GE7401b3rIGays+LPsslUkI2QpOKzs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ubRkWmkzt98y2WqZycSCXB9IwP1gtrmilbhKi+KHmfH6rnsTO7V2X/oe7FN9I+Cq0vSvPFrzvcnv305ynwLkgxpwZ/h9HRrsOe0EEkCkePUqFa9hnWcECzZZBzVUNclY+HujH3z4DW5h2z/FHopTi0VufEmIX4lOraBAujcO5NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OO1O7phQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OO1O7phQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so111625e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748020155; x=1748624955; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeyrU6ihUOv7KqWWz1p9e6DbN9Pt2P+pS2ZdWD92t/M=;
        b=OO1O7phQXfDBtyVVY7Zb2nDqH+97BPoh0iZfHrWNK4l6fscggdx7otwIb7812p8CQn
         wCalNmOVlh4FItEnyjsmkGcyizkCntU8CSBZfKO7YYDVWI97lO5bDD2XrZzthZMDDeXH
         c2llGxB+2ycNvkzZSrIF/kUyVjNHSSIaVO8euPhzv3bTHinT4zY5yrIQh+wrx+838cbn
         ywG7osOd/CGjl80r6LeLwuxZFiorcLUEGGlrYVjmcgelUUxlcNXR7XZ86dP3G0yK+UNq
         cPkIVeAnv4IWCVPFBw5inP2Yx5Fcqp7V9+cWnExAAB4QcYyyxvTD7YdClrI5dg0cGZAf
         +TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020155; x=1748624955;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeyrU6ihUOv7KqWWz1p9e6DbN9Pt2P+pS2ZdWD92t/M=;
        b=eL9yqZ01CM8g84uneeS+b/8iI+BN2xah26PRM2airnErcoq/1kT5gP+EotBvxSKjTR
         ohqjdMTY1SU4/RpB6kEG3gaLx/p1K1uK8qL48uF4g0/6x1/MCBkPQy916+RmdbpQcTGv
         WVfQac2rzYkCUIQrS5KWDHaV42VVF1hBwgWyELN2TehrrtReQEekhBU92qbuEfBbtjrx
         egZSj2fJILBBLsdY3mk9Ek1jCN4zK8qd1E7SmltyFW3/4VglbdvOs/340ClwgUIbLtel
         nmnqBdnh/gY/yA4PU9lDFL/bHgcN+t9y3RElI2SZwT2Yy6UkSzmX+J+7Or97VJFpWRyN
         p+0g==
X-Forwarded-Encrypted: i=1; AJvYcCWXaswjs107T2aE9k9c8GcpZ0P/Z+LjWMhJEm4XoRcfrBuxBn0+lirq+goWkyJl+tgLIRCJ3PQtlhDHgUOMIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy87c+yZZ77zATvQHDem48kPAyO/qOct5jtMIID1szmDG4BOC9o
	x1MBMgMqKuOwn5oPKWNFW6mmNzzpPYaeCO9m+ClHacMPIcWIRUX6zB0krJwxcZGxT1W039ze9jC
	zABKmG+wO8c0wfFZVFg==
X-Google-Smtp-Source: AGHT+IH22jb4uk96yNrxEQNQqwHHhsvR6djTUWAm/j6Chz4UPuVDJRi15o7AU2ZtMYCQKWFNTFN3OgAf1RaMVwc=
X-Received: from wmla24.prod.google.com ([2002:a05:600d:2398:b0:43c:eba5:f9b3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e09:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-44b6ed45bbamr57117065e9.31.1748020155519;
 Fri, 23 May 2025 10:09:15 -0700 (PDT)
Date: Fri, 23 May 2025 17:09:13 +0000
In-Reply-To: <aDBC__rflS8625Vb@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2025051524-festival-afterglow-8483@gregkh> <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux> <aC5XDi7SaDJeUaAC@google.com> <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com> <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae> <2025052330-reverence-slideshow-d498@gregkh> <aDBC__rflS8625Vb@cassiopeiae>
Message-ID: <aDCrufEjtJeGjO6z@google.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benno Lossin <lossin@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 23, 2025 at 11:42:23AM +0200, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 11:14:23AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 22, 2025 at 07:53:49PM +0200, Danilo Krummrich wrote:
> > > On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
> > > > If you really want to delete a debugfs file that you have created in the
> > > > past, then look it up and delete it with the call that is present for
> > > > that.
> > > 
> > > This is promoting a C pattern (which for C code obviously makes a lot of sense),
> > > i.e. we have a function that creates a thing and another function that removes
> > > the thing given a handle of the created thing. Whether the handle is valid is
> > > the responsibility of the caller.
> > > 
> > > In this case the handle would be the filename. For instance:
> > > 
> > > 	debugfs_create_file("foo", parent, ...);
> > > 	debugfs_remove(debugfs_lookup("foo", parent));
> > > 
> > > This leaves room to the caller for making mistakes, e.g. if the caller makes a
> > > typo in the filename. In this case we wouldn't even recognize it from the return
> > > value, since there is none.
> > > 
> > > In Rust, we do things differently, i.e. we wrap things into an object that
> > > cleans up itself, once it goes out of scope. For instance:
> > > 
> > > 	let file = debugfs::File::new("foo", parent);
> > > 
> > > Subsequently we store file in a structure that represents the time we want this
> > > file to exist. Once it goes out of scope, it's removed automatically.
> > > 
> > > This is better, since we can't make any mistakes anymore, i.e. we can't mess up
> > > the filename or pass the wrong parent to clean things up.
> > > 
> > > Depending on whether the above was a misunderstanding and depending on how you
> > > think about it with this rationale, I have quite some more reasons why we don't
> > > want to have files / directories around in the filesystem without a
> > > corresponding object representation in Rust.
> > > 
> > > But before I write up a lot more text, I'd like to see if we're not already on
> > > the same page. :-)
> > 
> > Ok, let's knock up the api here first before worrying about the
> > implementation, as we seem to all be a bit confused as to what we want
> > to do.
> > 
> > Ideally, yes, I would like to NOT have any rust structure represent a
> > debugfs file, as that is the way the C api has been evolving.  We are
> > one step away from debugfs_create_file() being a void function that
> > doesn't return anything, and I don't want to see us go "backwards" here.
> > 
> > But the main reason I did that work was to keep people from trying to
> > determine if a file creation worked or not and to do different logic
> > based on that.  I think the Rust api CAN do both here, as you and Alice
> > have explained, so we should be ok.
> > 
> > So how about this for an example api, two structures, debugfs::Directory
> > and debugfs::File, which have only two types of operations that can be
> > done on them:
> > 
> > To create a debugfs directory, we do:
> > 
> > 	let my_dir = debugfs::Directory::new("foo_dir", parent);
> > 
> > There is no other Directory method, other than "drop", when the object
> > goes out of scope, which will clean up the directory and ALL child
> > objects at the same time (implementation details to be figured out
> > later.)
> > 
> > That will ALWAYS succeed no matter if the backend debugfs call failed or
> > not, and you have no way of knowing if it really did create something or
> > not.  That directory you can then use to pass into debugfs file or
> > directory creation functions.
> > 
> > Same for creating a debugfs file, you would do something like:
> > 
> > 	let my_file = debugfs::File::new("foo_file", my_dir);
> > 
> > depending on the "file type" you want to create, there will be different
> > new_* methods (new_u32, new_u64, etc.).
> > 
> > which also ALWAYS succeeds.  And again, as you want to keep objects
> > around, you have to have a reference on it at all times for it to exist
> > in the filesystem.  If you drop it, then it too will be removed from
> > debugfs.
> 
> Great! That's exactly what I think the API should look like as well. :-)
> 
> > And again, that's the only operation you can do on this object, there
> > are no other methods for it other than "new" and "drop".
> 
> We probably still want
> 
> 	let foo_dir = my_dir.subdir("foo_dir")
> 	foo_dir.file("foo_file")
> 
> for convinience, rather than having to call
> 
> 	let bar_dir = Dir::new("foo_dir", my_dir)
> 	File::new("bar_file", bar_dir)
> 
> all the time. But otherwise, sounds reasonable to me.
> 
> > Now there are issues with implementation details here like:
> >   - Do you want to keep the list of file and dir objects in the rust
> >     structure to manually clean them up when we go to drop the
> >     directory?
> >   - Do we want to force all files to be dropped before the directory?
> >     Or do we want to just let the C side clean it all up automagically
> >     instead?
> > and other things like that, but we can argue about that once we settle
> > on the outward-facing api first.
> 
> The only thing I don't want to is to allow to leak files or directories, i.e.
> 
> 	File::new("bar_file", bar_dir).leak()
> 
> which keeps the file in the filesystem, but takes away the handle from the Rust
> side, such that it won't be removed from the filesystem anymore when the handle
> goes out of scope, which can cause nasty bugs. But I think there isn't any
> benefit to allow this anyways and it isn't needed with reference counting.

Why not have leak() for files only? That way, the files still go away
when you drop the directory, and you don't have to keep around a bunch
of File objects in your Rust structs.

Alice

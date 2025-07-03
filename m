Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A42E03F6
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Jul 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536983; cv=none; b=HaL8XCvsosElwSSdJuxhO947Xv+zSwCfUGHMmYjZhoZKzg/BcGEqcePugSdLiV21dOfzndedELP7ezClxyn9DW/QgQ0tBp3oEDD21sB1HUv3ih05+RzVtP2Hh36McAsIkFMqBuzKIn9jUnPw6cEpP4x/UOgAvvRr5p83EAvk/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536983; c=relaxed/simple;
	bh=Obh6DD9vix+TIBwQQYvbpQ2RjdqyGcCDt1xJHHQRTDI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o5cbkCsuLz3qQgpAE96SFqECxYwa0ulNH8nko7GLem28da8lz+wrBYbkUDYJXoE3QYFJiBd6TJFTS7RDZoRF/Axr+UL8UTONWEokro8X+B2ygczkBOsDhzPug752/S7V0zES8D7DCi+el/SJ9hFBdei/pJLQ5RY9/qlldcmf6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwDpfGF/; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwDpfGF/"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6090274dd37so5236049a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Jul 2025 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751536980; x=1752141780; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqGaJD9/W4j+MwX6QlvRgP3GnrOVCmaSlWQ5633fypg=;
        b=TwDpfGF/wyk7p9LUqkLZhaZGwPPjTq+uqDNqhL0/+0ymddwFeWgvfT1kFZX0/77qtJ
         6WFvwpiL6xNlIDs0FbwUtJLTggoltTJSjsr6/yAjCC8YEgQth2MBlA3+NYeN+PlT4Zj5
         g/fMB32+i67k2Dzy02cuHym5/kw6WeYEGZc5PDFX/H7RiMY7jC8Un5NxErf2AEOmjk61
         8xUITplwIc9dtN0YCk9A++WduhD+PPqthT6QevVRUBqYTTzHrxEfWO3N+CqwrGvwckjp
         n50WaycIUuzdKJGWCMzpLRl2DsiUwMmWSwDXLo2lSxiiyTPsSa2QpZkveHCk13EP90MT
         3Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536980; x=1752141780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqGaJD9/W4j+MwX6QlvRgP3GnrOVCmaSlWQ5633fypg=;
        b=mOpM+uR239G5sljuczvbkLWQxol84jXZ/iNd5NU49Qd+Krd6GzlKCV20w3FxbDAiOe
         nJTfS4gSWi12ypZtOXCPgtDOdhfBUxyUt+sLE3/heXld+JauxD6SafYqgg3VprPfLwtf
         SwkOGewN6Bj3Si020Jn4WPiMqxq+5f4g7w+YxqesSv4hoLSqUqGZk/dInBnEPYqfRVpN
         GobSFbwRI7+G9KWYWpbzWnmf6W3eOXbwil5ebEOcX7/KlJAV3B4k1KfAi3o8vAOXhzKF
         sovPiGby1Sk39GosLWdUIjYOgI3pL3bMO/WTbLDBb+N+9S0PI67WeHTOekfzdim9bTN9
         Dhrw==
X-Forwarded-Encrypted: i=1; AJvYcCU3SJxILPpctXAct3HdGIcMMi/wLZQBJl4PQeIMdQvkF15LBtQe/brI4e0qkxFk5VRKBzH4L9uaX3HCdy12zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCt+oTS257S0QW+XN/jRY1ZxEFxWXelGsKjJVjLx1l9wcuQ89
	0lpARhRCGRrzEEBLQXDU13tmiS3zjEtsK9LeS/5oxgEL85o86yjHatQy5DUMcB8berYFcBJ2kUa
	KTnsgrn+ASs7hy7S6mg==
X-Google-Smtp-Source: AGHT+IF2s93ihLX1PXkClG9cJiSTZ35qsjoCiFotxikRqPbGr/bigMKo3h5oYLJkMHWpg4yl3gvHTgjJVd/9b/U=
X-Received: from edba15.prod.google.com ([2002:a50:c30f:0:b0:601:dd78:8e2f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:b6e:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-60e5350016dmr4264704a12.33.1751536979907;
 Thu, 03 Jul 2025 03:02:59 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:02:58 +0000
In-Reply-To: <aGP6d2-jJy5rtjMK@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
 <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org> <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org> <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh> <aGP6d2-jJy5rtjMK@pollux>
Message-ID: <aGZVUqangIR-c4aW@google.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 01, 2025 at 05:10:47PM +0200, Danilo Krummrich wrote:
> On Tue, Jul 01, 2025 at 04:21:56PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 01, 2025 at 04:13:28PM +0200, Danilo Krummrich wrote:
> > > Instead this should just be:
> > > 
> > > 	struct GPU {
> > > 	   fw: debugfs::File<Firmware>,
> > > 	}
> > > 
> > > and then I would initialize it the following way:
> > > 
> > > 	let fw = KBox::new(Firmware::new(), GFP_KERNEL)?;
> > > 	let file = dir.create_file("firmware", fw);
> > > 
> > > 	// debugfs::File<Firmware> dereferences to Firmware
> > > 	file.do_something();
> > > 
> > > 	// Access to fw is prevented by the compiler, since it has been moved
> > > 	// into file.
> > > 
> > > This is much better, since now I have the guarantee that my Firmare instance
> > > can't out-live the GPU instance.
> > 
> > That's better, yes, but how would multiple files for the same
> > "structure" work here?  Like a debugfs-file-per-field of a structure
> > that we often have?
> 
> That is a very good question and I thought about this as well, because with only
> the current API this would require us to have more and more dynamic allocations
> if we want to have a more fine grained filesystem representations of structures.
> 
> The idea I have for this is to use pin-init, which we do in quite some other
> places as well.
> 
> I think we can add an additional API like this:
> 
> 	impl Dir {
> 	   pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl PinInit<Self> {
> 	      pin_init!(Self {
> 	         data <- data,
> 	         ...
> 	      })
> 	   }
> 	}
> 
> This allows us to do things like:
> 
> 	#[pin_data]
> 	struct Firmware {
> 	   #[pin]
> 	   minor: debugfs::File<u32>,
> 	   #[pin]
> 	   major: debugfs::File<u32>,
> 	   #[pin]
> 	   buffer: debugfs::File<[u8]>,
> 	}
> 
> 	impl Firmware {
> 	   pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<Self> {
> 	      pin_init!(Self {
> 	         minor <- dir.create_file("minor", 1),
> 	         major <- dir.create_file("major", 2),
> 	         buffer <- dir.create_file("buffer", buffer),
> 	      })
> 	   }
> 	}
> 
> 	// This is the only allocation we need.
> 	let fw = KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
> 
> With this everything is now in a single allocation and since we're using
> pin-init, Dir::create_file() can safely store pointers of the corresponding data
> in debugfs_create_file(), since this structure is guaranteed to be pinned in
> memory.
> 
> Actually, we can also implement *only this*, since with this my previous example
> would just become this:
> 
> 	struct GPU {
> 	   fw: debugfs::File<Firmware>,
> 	}
> 
> 	let file = dir.create_file("firmware", Firmware::new());
> 	let file = KBox::pin_init(file, GFP_KERNEL)?;
> 
> 	// debugfs::File<Firmware> dereferences to Firmware
> 	file.do_something();
> 
> Given that, I think we should change things to use pin-init right away for the
> debugfs::File API.

Does this actually work in practice for anything except immutable data?
I mean, let's take Rust Binder as an example and lets say that I want to
expose a directory for each Process object with some of the fields
exposed. Let's just simplify Rust Binder a bit and only include some of
the fields:

#[pin_data]
struct Process {
    task: ARef<Task>,
    #[pin]
    inner: SpinLock<ProcessInner>,
}

pub(crate) struct ProcessInner {
    threads: RBTree<i32, Arc<Thread>>,
    nodes: RBTree<u64, DArc<Node>>,
    requested_thread_count: u32,
    max_threads: u32,
    started_thread_count: u32,
}

Rust Binder already does expose some debugging data through a file
system, though it doesn't do so using debugfs. It exposes a lot of data,
but among them are the pid, the number of threads and nodes, as well as
the values of requested_thread_count, started_thread_count, and
max_threads.

Now, we run into problem number one: pinning is not supported inside
mutexes. But let's say we solved that and we could do this:

#[pin_data]
struct Process {
    task: File<ARef<Task>>, // prints the pid
    #[pin]
    inner: SpinLock<ProcessInner>,
}

pub(crate) struct ProcessInner {
    threads: File<RBTree<i32, Arc<Thread>>>, // prints the count
    nodes: File<RBTree<u64, DArc<Node>>>, // prints the count
    requested_thread_count: File<u32>,
    max_threads: File<u32>,
    started_thread_count: File<u32>,
}

However, this still doesn't work! Debugfs may get triggered at any time
and need to read these fields, and there's no way for it to take the
spinlock with the above design - it doesn't know where the spinlock is.
For the integers I guess we could make them atomic to allow reading them
in parallel with mutation, but that option is not available for the
red/black trees.

What is the intended solution in this case? If the argument is that this
is a rare case, then keep in mind that this is a real-world example of
debugging information that we actually expose today in a real driver.
With Matt's current approach, it's relatively easy - just store a bunch
of File<Arc<Process>> instances somewhere and define each one to take
the mutex and print the relevant value.

Alice

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9C1BDF8
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="u4/UIe8K"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d3ae326f6so111776695e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 06:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704293836; x=1704898636; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=pQTqVvJgYqipQ+GYYDXyw49lEwzsJ9fsRMKHZqrhmSc=;
        b=u4/UIe8K5rL/3qlTgs/xsxfsS+6wcMhhNxqX4t01I1rNsuVt5XQbhKFVH7NheDbJo9
         BU1kvbW+C7ROVmIInpjQ/xadHjF/MufA+ZMnX7S27h62Ako+xtvUFIdDiCF1gyCYLh+S
         vVrrd5omm+IqHNbx00xxlDEaKqzkP5ISh+qnpic+BAoOR044vgpBf0zrhNOKwt3sO3/3
         hWGvfQF6+BRzqjdZjvIh9T9nlTjzOCj1JiNjtsRQlxPi13rC6Z7Rdd3uhUfYl5XIX9AB
         duxvaVh/mgELKPtPuIjwlCUzVMN7qYExEaKQHUwVRuNWJjiQfnmnO3aWynKMJQtntNQu
         RWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293836; x=1704898636;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQTqVvJgYqipQ+GYYDXyw49lEwzsJ9fsRMKHZqrhmSc=;
        b=BxvjlQGV+BWd2QD5cUmN99SGXAAC+DuiwvDuphhO9RcT6O/rEkicsbGdy/N6etjuf7
         Uit8tgXeAPZVx/1xqcs8CslHzZw/ZQTafZwJblHO2d3sduFFA0+xG5SN3TmBBeJ15/zf
         5MNJVzLK64EPsavcKGSTrwcPbivANGIRaNBHf1Pe1B0JygKqhZxbvmnqDHqqrg1OxPCy
         ezfshWa9Om+1bK39M1Rd3LNXkT5qdVDJP3G1RoYg5lcKbdIkis34jf7Z08BJcYF7V5Ta
         3GGLoqZk7acuaoyKhzXpXqM3j9Uo/ixj27h1jtEQOijwBInIqNqxvXRfTmA5G4xX6iQ4
         REFA==
X-Gm-Message-State: AOJu0YxPZNfOaFvewW6BnfxyqFn5ZIJmrZ/AYEJQ9SQDXaeH4Zm61FNu
	E6tPdm/RodnqlJJUozfTmTCO0HmMytV73Q==
X-Google-Smtp-Source: AGHT+IFLmwZaEFfFSVUUg/paJv8p8DIpGUuFQ/ewjmwXCucafcFvvY2jpjsj2+4KDqD9PRZDI0L7vQ==
X-Received: by 2002:a05:600c:5409:b0:40b:5e21:ec34 with SMTP id he9-20020a05600c540900b0040b5e21ec34mr10927147wmb.102.1704293836639;
        Wed, 03 Jan 2024 06:57:16 -0800 (PST)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b0040d839de5c2sm2514713wme.33.2024.01.03.06.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:16 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-18-wedsonaf@gmail.com>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 17/19] rust: fs: allow per-inode data
Date: Wed, 03 Jan 2024 15:39:50 +0100
In-reply-to: <20231018122518.128049-18-wedsonaf@gmail.com>
Message-ID: <87y1d64g9e.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

[...]

> @@ -239,6 +255,16 @@ pub fn new<T: FileSystem + ?Sized>(module: &'static ThisModule) -> impl PinInit<
>              unsafe { T::Data::from_foreign(ptr) };
>          }
>      }
> +
> +    unsafe extern "C" fn inode_init_once_callback<T: FileSystem + ?Sized>(
> +        outer_inode: *mut core::ffi::c_void,
> +    ) {

A docstring with intended use for this function would be nice.

> +        let ptr = outer_inode.cast::<INodeWithData<T::INodeData>>();
> +
> +        // SAFETY: This is only used in `new`, so we know that we have a valid `INodeWithData`
> +        // instance whose inode part can be initialised.

What does "This" refer to here?

> +        unsafe { bindings::inode_init_once(ptr::addr_of_mut!((*ptr).inode)) };
> +    }
>  }
>  
>  #[pinned_drop]
> @@ -280,6 +306,15 @@ pub fn super_block(&self) -> &SuperBlock<T> {
>          unsafe { &*(*self.0.get()).i_sb.cast() }

I would prefer the target type of the cast to be explicit.

[...]

>  
>  impl<T: FileSystem + ?Sized> NewINode<T> {
>      /// Initialises the new inode with the given parameters.
> -    pub fn init(self, params: INodeParams) -> Result<ARef<INode<T>>> {
> -        // SAFETY: This is a new inode, so it's safe to manipulate it mutably.
> -        let inode = unsafe { &mut *self.0 .0.get() };
> +    pub fn init(self, params: INodeParams<T::INodeData>) -> Result<ARef<INode<T>>> {
> +        let outerp = container_of!(self.0 .0.get(), INodeWithData<T::INodeData>, inode);
> +
> +        // SAFETY: This is a newly-created inode. No other references to it exist, so it is
> +        // safe to mutably dereference it.
> +        let outer = unsafe { &mut *outerp.cast_mut() };

Same

[...]

> @@ -766,6 +822,61 @@ impl<T: FileSystem + ?Sized> Tables<T> {
>          shutdown: None,
>      };
>  
> +    unsafe extern "C" fn alloc_inode_callback(
> +        sb: *mut bindings::super_block,
> +    ) -> *mut bindings::inode {
> +        // SAFETY: The callback contract guarantees that `sb` is valid for read.
> +        let super_type = unsafe { (*sb).s_type };
> +
> +        // SAFETY: This callback is only used in `Registration`, so `super_type` is necessarily
> +        // embedded in a `Registration`, which is guaranteed to be valid because it has a
> +        // superblock associated to it.
> +        let reg = unsafe { &*container_of!(super_type, Registration, fs) };
> +
> +        // SAFETY: `sb` and `cache` are guaranteed to be valid by the callback contract and by
> +        // the existence of a superblock respectively.
> +        let ptr = unsafe {
> +            bindings::alloc_inode_sb(sb, MemCache::ptr(&reg.inode_cache), bindings::GFP_KERNEL)
> +        }
> +        .cast::<INodeWithData<T::INodeData>>();
> +        if ptr.is_null() {
> +            return ptr::null_mut();
> +        }
> +        ptr::addr_of_mut!((*ptr).inode)
> +    }
> +
> +    unsafe extern "C" fn destroy_inode_callback(inode: *mut bindings::inode) {
> +        // SAFETY: By the C contract, `inode` is a valid pointer.
> +        let is_bad = unsafe { bindings::is_bad_inode(inode) };
> +
> +        // SAFETY: The inode is guaranteed to be valid by the callback contract. Additionally, the
> +        // superblock is also guaranteed to still be valid by the inode existence.
> +        let super_type = unsafe { (*(*inode).i_sb).s_type };
> +
> +        // SAFETY: This callback is only used in `Registration`, so `super_type` is necessarily
> +        // embedded in a `Registration`, which is guaranteed to be valid because it has a
> +        // superblock associated to it.
> +        let reg = unsafe { &*container_of!(super_type, Registration, fs) };
> +        let ptr = container_of!(inode, INodeWithData<T::INodeData>, inode).cast_mut();

Same

> +
> +        if !is_bad {
> +            // SAFETY: The code either initialises the data or marks the inode as bad. Since the
> +            // inode is not bad, the data is initialised, and thus safe to drop.
> +            unsafe { ptr::drop_in_place((*ptr).data.as_mut_ptr()) };
> +        }
> +
> +        if size_of::<T::INodeData>() == 0 {
> +            // SAFETY: When the size of `INodeData` is zero, we don't use a separate mem_cache, so
> +            // it is allocated from the regular mem_cache, which is what `free_inode_nonrcu` uses
> +            // to free the inode.
> +            unsafe { bindings::free_inode_nonrcu(inode) };
> +        } else {
> +            // The callback contract guarantees that the inode was previously allocated via the
> +            // `alloc_inode_callback` callback, so it is safe to free it back to the cache.
> +            unsafe { bindings::kmem_cache_free(MemCache::ptr(&reg.inode_cache), ptr.cast()) };

Same

BR Andreas


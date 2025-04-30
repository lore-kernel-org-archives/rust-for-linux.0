Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E94190676
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025859; cv=none; b=o/P2zs4kED5pKRp5mFGwFJ6TijuLQcRGx6i5MB/xy/atMx5AmAh5bn7B5tZyfR39y3JfqkEKF72A2BgkA009jHUHZWL5DE2AZ0i4ly20CENkhHQW6IKYvkNujJOEHPE1U9VGlZqmPEdS4/X8Kubr1EYI4BtsJQrw4yCNKBCtuy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025859; c=relaxed/simple;
	bh=Q7ULWrwV/Ds5hyfQiDZ2WUbNBn+35UNVwvoumJ4KQuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za4ZzSYHThSsTYWrA9Puv3Ve60wD39CbhWaBC48IiXa2MV+dNvUGzSBFoKgNvHyn92Q29wV/JeJuU11kij+u8MydS3nZg6qfxaq90qeN+pfwpMbubZ1Z0Y9suyVBO673g8XfsJiy0Fs7VwLAn71MylkVc57SD1/zx4DsfLtG90A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZ3qrFvT; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZ3qrFvT"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4774611d40bso592671cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746025857; x=1746630657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGLsDsRyVtGMtJrAdQ6aTqwgR9IuQ99vMNfBN6aVAhs=;
        b=LZ3qrFvTzsWDPW+apguQGg0x+ZiZxoRDI6H8PS1FfIta4oLrZL6Nqvp86N2OMn3dwF
         Aus3TTuMldJcLV/sVI462ZtCLEmRdgtOBYwBnCfCNtjXhTp8MqIF1NA4UpzWdNGSzFua
         7Dbpphrp/AhPd3Wu79+e16oQSPntrlcvqT60R2ZyHpwGn5Wo2FuUULAByW0mOmoNhEhX
         CSrvbfQKPvnXo230hdf5x8op0S4M+ZuQ8UGPC9BTnRK3AXDtW5ltPeuQ7USEaJZa6+US
         vuEHByWHtya96SwkD1Uq84yubdtuvM+3UOY+jZXv3E8hGMT/767J01+0lc14xIM/mjI1
         xrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025857; x=1746630657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGLsDsRyVtGMtJrAdQ6aTqwgR9IuQ99vMNfBN6aVAhs=;
        b=gYjCkiC8tXy8b/bwdR/QJJEVzYzb5WStNp0QtCesMnTzhh71Qw5Yr+OuVok+25AOfu
         NQ3HOC+9tYeqzl5DCMAfbl5I6Iu8APoncDE7cFJDORKTwOZpcO5HxWOY/LBHy8TuDr/b
         KbFoZHB3JoQSWlUoGfxnODNuwqre0rva1DRncZUifZokkEAa2OZlEN+Mv8Wlz0GVE0cD
         M8fvqtBfNIEXIfnFsXX/E9EACwkK0nkM5+srTaAXdU6s1si0wcI1eQ7XBZVIW6TYLzdw
         ZGGg6//u/kjIzI6rzcnsdnymdxwBHsgdpHNZ+0bZEacheKoK5l05jSlbyrPY3EQqwybB
         U5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkyGyJYpjm9LBgZBLYReNnpIOGySnGsLCSdfvwLFvXhgK3IZxcPDTtXkZCp23xBs1mMw6YeBrbp2ZiGfbtZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5xXYQqeQ7UFZhtzQpP0fbxgGOpMODkuWZR3b465WnF8ZdspB
	NeerMnYTafmSkQWS6g1eWAR/jBhLZHdVUnrcrTYQUK1nv6HASv7Rre7KoaRc/2aT66YR2xuZSJh
	W2ZcllGCRk/ueB4GVGffJcFpCsX7nSoOnAhd7
X-Gm-Gg: ASbGnctlQVNX6b4FoaggtoADz9EhiU4c4enYg1i57+RAeSNnmxDFJn4rJqlk+SJtP9q
	YmivczKA69WXhK+wXHQtnjRfFFCcHmDF+25KznNqlrerubYGRyGetG1PHZHHw6PXW5Oank+5mtO
	ednvPMW7uhBFmzQYFDGIl8aV2bRJW3p8WvMximW7EFeyl+6lxX4uU=
X-Google-Smtp-Source: AGHT+IEzUE/HJxpRUWYcnbQL8lTMYBvSLNwbtEboX98Yu7xYLyPfkgA+GUOExnn0jN/Lds5vJg3ipvF1R/4hZmW3U5E=
X-Received: by 2002:a05:622a:408:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-489ddae52bamr4464701cf.29.1746025856924; Wed, 30 Apr 2025
 08:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-1-6b6e7cb7929f@google.com> <2025043021-plaza-grip-2916@gregkh>
In-Reply-To: <2025043021-plaza-grip-2916@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:10:44 -0700
X-Gm-Features: ATxdqUFyoYWcrX7k2AT4KidTQ3yFbHZAtR8N0WOUET6xSpojSVmlDQCRUyLSxwI
Message-ID: <CAGSQo00Kg2QV56LYFg6nRY+yS2KtiVAPaggKaKFCdprjBfXCcA@mail.gmail.com>
Subject: Re: [PATCH 1/8] rust: debugfs: Bind DebugFS directory creation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 29, 2025 at 11:15:55PM +0000, Matthew Maurer wrote:
> > The basic API relies on `dput` to prevent leaks. Use of `debugfs_remove=
`
> > is delayed until the more full-featured API, because we need to avoid
> > the user having an reference to a dir that is recursively removed.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> First off, many thanks for doing this.  I like this in general, but I
> have loads of specific questions/comments.  Don't take that as a
> criticism of this feature, I really want these bindings to be in the
> tree and work hopefully better/cleaner than the userspace ones do.
>
> First off, the main "rule" of debugfs is that you should NEVER care
> about the return value of any debugfs function.  So much so that the C
> side hides errors almost entirely where possible.  I'd like to see this
> carried through to the Rust side as well, but I think you didn't do that
> for various "traditional" reasons.

Sure, I mostly had to do error checking because I was using an
`ARef<Dir>` to represent a directory, which meant that the underlying
directory needed to be a valid pointer. Given that you've said that
the returned `dentry *` should never be used as an actual `dentry`,
only as an abstract handle to a DebugFS object, that requirement goes
away, and I can remove the error handling code and always successfully
return a `Dir`, even in cases where an error has occurred.

>
> Wait, what?  Why would an explicit drop(parent) be required here?  That
> feels wrong, and way too complex.  Why can't you rely on the child
> creation to properly manage this if needed (hint, it shouldn't be.)

The explicit `drop` is not required for normal usage, it was intended
to be illustrative - I was trying to explain what the semantics would
be if the parent `dentry` was released before the child was. As
before, now that the child will not be an `ARef<Dir>`, and so not
assumed to be a valid `dentry` pointer, this example won't be relevant
anymore.

>
> Why do you want this wrapped?  And I think you "wrapped" it wrong here.
> When the object is "gone" it should have called
> debugfs_remove_recursive(), not dput(), in order to properly drop
> everything.  Where is that call happening?
>
> The debugfs core already handles the reference counting of this object,
> please don't add some extra reference count calls with dput/get, that's
> just going to be a mess.
>
> You should NEVER be encoding the fact that the return value of a
> debugfs_*() call is a dentry.  Just treat that as an opaque pointer that
> just happens to have a common name that might refer to something else.
> That pointer can be passed back into other debugfs functions, and THAT
> IS IT.  No checking for it, no passing it to any vfs functions, or
> anything else.
>
> So the dput() stuff here should not be present at all (hint, no C code
> that used debugfs ever calls that, so the rust bindings shouldn't
> either.)
>

I incorrectly assumed that if a `dentry *` was being returned, then at
some point it would be used as a `dentry *` rather than as a
debugfs-only handle. I bound it into an `ARef` to avoid backing myself
into a corner later if someone needed to use the `dentry *` for
something, but if that's against the API contract of DebugFS, I can
avoid it entirely.

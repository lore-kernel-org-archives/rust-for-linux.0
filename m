Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F634F96A5
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688930; cv=pass; b=Tc/pmfa8rOU1+LFz3wXoSV2P/FdmlMaL1MYjSCymfOOnpSpQJZokzx/IFI4sXrBU6VqKSFkw9iHoU9EIg562udU8TtKhexPSXAUopi0897jCu9DQbqNwSjv7tQZ1MRUGFzBkCz+8rz4JeiZU8z+7siGGzwzKGulLWMO3mhTytwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688930; c=relaxed/simple;
	bh=Pr5ObivNdgC6TpXZVCnYFfdYZPpZOxjA6yMjAIcM9dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTB2Xm/onPhClFiKK9wfIn2c3h3rg/ygA1liWNFen06fd2o7q1+WowVAHQrIbfT/eBXsxjDIXkg4FFjx8affkzYTO7vPUsvuBaT6QH4g5b/0DivI9Z77RXhE22/mPrZqQ9ZPg8UGmPkqD8PfMZB8bQ5dw8K/zvyoyB9oeBr7z/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvEmHdbc; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvEmHdbc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so24023965e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 06:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688927; cv=none;
        d=google.com; s=arc-20260327;
        b=C4Em3gT8jSX9fIC6iDzR1+LPiZW5iAQW7x8O20WLsRYSyDTfm8/HdrpLyPVK6QtAve
         onAGoxVAlcRJ8lgeHp0+Mzdk/xJApC9iB3qkHYdo/ScqQCoJVazqH9jBKfRNhytSLC0u
         cAw2qANb0ML7AfRvjPnx/64gBtqGLFwzAUFiyg67Tas9uJ9hpmplAneG4CpHRxzu+qTf
         iC1A3DC4MgMoy4HYqi+WgiDTrTNTcVcVoDdaS1kbadIJTE1BMsZXWfgHhFmboi0TgR/O
         JLyvbBWEG79frY4PWObu3vxStcCYK4tjuE6Qmz9n988r2kHPwWWmvj6E0/SfO8nvXfcv
         y9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KO35IpzQU2wUiVLnR02rlEk4h+IQIikt7twWTAwFAKQ=;
        fh=sK+Vz+KlRYUtFUeosyoiXVNR7lDJINztM7RsIqXo/MA=;
        b=jlkcT0Gj4XcYu+FKlbZnDH75yBpeG3BUg2dkWtVWMw+gdpMUThoao7IBBjX8+dh368
         h9n3el47hhjV6mk+l3ss21nOC+qzfTiQI7c17PgfVv2QgvQUb9sGZsYGgriM1d6cMf4Y
         U8km1kuK9l6kZEDcIbrLY6XCwOCjfyerJZB5v84j2wnCNYqWDuzpRKfbUsAWE6wp0k4V
         jtcxcmmR81kE4wrb9d/7zpqzcKqwEPbJfy+shYJXZw501hwUdoZ/z5tKOhjJhCrBWHRe
         agGknDRmhsVrMPHHkXwRgb61xiu6CF6TC0tlcy7o1SzaPllZCE0N9sKtvjdQyJMABsyR
         MDFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790688927; x=1791293727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KO35IpzQU2wUiVLnR02rlEk4h+IQIikt7twWTAwFAKQ=;
        b=EvEmHdbcZDRHlEJ1LoV5GlDXcMmhPdyd0VSyzRrMHlI6gmcvwvnLcqcWWim2wZkPMQ
         6ZMcYREQOZR8VX+PYbb4a0Fj1+5fZVGQM6Aid1DH80mbLCbc1jWrRNSN3Ac3L/3Q7BQn
         uSlp02A8tYtW0MVceWT5UhlV0VVRb1gNZLVVzTG21ibrkkNdLa0DKYm1xCD58HVsaiMh
         46YsaIkQS0T8gWe0XcIqrczCr2fQywNarlVffqqhl7DAEF/LeFZ2TNpWdlmcvBMG94Qc
         RqBzigkbtX6H2f7/Pu6jZejNTf/xb2ZGe+8t7WQyLVQ7BbwLozY3ma964vcsmQH21Sm3
         wNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688927; x=1791293727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO35IpzQU2wUiVLnR02rlEk4h+IQIikt7twWTAwFAKQ=;
        b=NrC35/8fmNkukar6iHAwrxhs2W6LAW3jBmRHA/lODO6deIjm0bNV5TxJX7gFHCtUJx
         qjOoD0Bj3bkho6cBW2KO9obqhA6v9Ieg71cQKTR4/e5Dch1UlhyWxn1XGDz+k5yrDJ5D
         f/M4P6nGh9a9miD+zSy6c6ZoAATxD4Bw+3s8q+HglRgCb579dflJOGGMNBWA1YSI7pxk
         ySnt2ckP+zGxAo4rul9JFyYj5RhhmMTs7jR+NgIMys/i3DtFbRZuL+CUv1vxz9e5Y7JN
         vvuTvgWpKWEN+tMMG88999sSSn8CJMq4m3QLGz+hi6gKOjPjhrNynwX6YX769WvZ3dmW
         WEBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoZmvvMIsdl7IWPJ0gGLSIRFe9X7o7nbI+pYEyNglOCfUyMJvO1EZEpY2gj9GUbnSB5I0tHQJxccweucdZ8g==@vger.kernel.org
X-Gm-Message-State: AFuF++lCvhwNEKKt9xIO8C8cFm7gNCC5nPvphSWeXuui2ZjGUwAxCVO1
	Rh3hTzpM8Mi8+fGkyRRhHAGvY3xt2lNkQXromCi+oKipcuyjlkYdvyQBnO9opWRY+CjA8+qgVJB
	DQC4mURjzW+PiEdbw+ILF7ODBTlioI2Gh3Vy47FwT
X-Gm-Gg: AYBFou1+mp9xwD4LRNRexxkZg4GKM4WeVBBXzf1xOgHbqk+Qzz1C8ZTZOD4iTx2crET
	ZPX1CVdyjTBsCK2ZM0fEzXkvacLT30BcaErlIHADuVlQ013zHg8oucW6D6KJp9GYkFmNFYDBV2L
	OG0K31dJa5nBOffT3U2AgLlN1tYWECaN9owVt1LWTDR9EjeQ/XO76sODLM1kMUWkw29eYR0CQYI
	bpA2ShHiwKyp0chYA9zvRoZZiG0lp11lgkLt3C7AIYSNTNAJRKPShZ0dQwUPac17OCx3XuVvOxU
	PQn9WFvW+WXWQC0e+3Q/J7nB/fhXKC06iJIt0x98avJgCs+x9qduVSoNuBZ/Zo+2Y6hf3Z6Qf9/
	qgspBVK8GLqOQuu5WIr05LRVy5jYZxkwppaY4FFI7mPSP+Y3uYwt0
X-Received: by 2002:a05:600c:4e08:b0:49e:817a:ca7 with SMTP id
 5b1f17b1804b1-49fe66d05cbmr252109515e9.8.1790688926718; Tue, 29 Sep 2026
 06:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923022339.3340694-1-georgeandrout13@gmail.com>
 <arThye_219ruNbM2@google.com> <20260925-stellen-brummen-festrede-266af0305ac7@brauner>
 <20260929044843.GA3909609@ZenIV> <art7swUNAa3AyUrL@google.com> <20260929132839.GA989762@ZenIV>
In-Reply-To: <20260929132839.GA989762@ZenIV>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Sep 2026 15:35:13 +0200
X-Gm-Features: AclHuK8Z-kW-zwNhccfDW8-lP45SgDWDrvmNfYKPjY5D3ROZthqWW7EWiceXvYE
Message-ID: <CAH5fLgis-9ibYAEK-shQtwg_08Le-JDYChS77LugEhgZ=T+z8Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: file: handle fd table teardown in file
 descriptor APIs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Jan Kara <jack@suse.cz>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:28=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Tue, Sep 29, 2026 at 08:49:55AM +0000, Alice Ryhl wrote:
>
> > So, I previously wrote some code that could invoke filp_close() to clos=
e
> > a given fd ... from a workqueue. This was in the scenario where the
> > process dies and the usual cleanup function gets called deferred from a
> > workqueue instead of from the ioctl like usual.
>
> Huh?
>
> 1) filp_close(file, NULL) doesn't do _anything_ to any descriptor tables;
> the only requirements are that it should happen in _some_ thread context
> (workqueue is fine) and that caller should not be holding any locks that
> might be taken by ->flush() of the file in question (for a workqueue
> callback it's fine as long as the callback itself is not holding any
> of those).
>
> 2) any caller of filp_close(file, files_struct) must obviously guarantee
> that files_struct won't be freed under it; passing current->files from
> workqueue is safe in that respect, but obviously bogus.  Note that
> descriptor table in question will *still* not be accessed; it serves
> only as an opaque tag that identifies POSIX locks (and dnotify_struct
> instances) related to the descriptor table in question.  IF you have
> just manually removed the file in question from descriptor table
> (file_close_fd()), you must call filp_close() passing it the same
> descriptor table while that descriptor table is still guaranteed to
> be alive.
>
> Rationale is memory safety, actually - for POSIX locks descriptor table
> serves as lock owner; the reference is opaque, but we don't want to have
> it outlive freeing and reuse of the object it's pointing to.  So anything
> that removes some file reference from a descriptor table is responsible
> for corresponding filp_close() call done *before* the descriptor table
> is gone.
>
> Note that we only need to take care of the reference we remove from
> descriptor table; files_struct destructor will call filp_close() for
> anything still referenced from it.
>
> Places where file reference is removed from the table:
>         * do_close_on_exec(); filp_close() called in the same loop as
> clearing the descriptor table slot.
>         * do_dup2() in case the new slot had already been in use;
> filp_close() called just before return.
>         * file_close_fd_locked() callers. Three of those call filp_close(=
)
> as soon as they drop ->files_lock (close_fd(), __range_close() and
> io_uring io_close()).  Remaining caller (close_fd_locked()) leaves that t=
o
> _its_ callers (binder_deferred_fd_close() and its equivalent Rust-side).
>
> Again, normally both removal from descriptor table and filp_close() are
> done by the same primitive...
>
> > In this case the correct behavior was just to do nothing.
>
> ... leaking an opened file?  IDGI...
>
> > It was a very easy mistake to make, and if such mistakes lead to null
> > ptr derefs or worse, then I think it's worth doing something to reduce
> > the bad consequences from this kind of mistake.

Sorry I mixed it up ... the code called file_close_fd() and then
filp_close() with current->files. The important call here is the
file_close_fd() one, not the filp_close() one.

Alice

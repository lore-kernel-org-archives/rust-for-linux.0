Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0E1684B0;
	Tue, 14 Jan 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736868711; cv=none; b=VdpdMBba+vd0pu2bSutG07Agw58OEi5p8dB2uPaA095oRblRZ9MNuOJgFORSLzi5Wbs+MJcgdqJH4GQUy51kNVsq4dnY4S/dEmAn+9fzPHGFt+sID3RUKt01dlJo0x7qTWpTgvUt4yB0lKpP9m6u0LUruWltyvKuYsPHr/xHWSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736868711; c=relaxed/simple;
	bh=jREDVBL4PCFWz9O/gmQ2NotYwF2wr5i8o0RDokQWzpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSOY8tripBBEbmZ5NE3m2Hqrx79DqG5NDt+rY2hX+SvDp0BQnCEoVXhmOwLuBxW6lPxISTjTon5gji1Awt+ADfn0DDWYymLkAvxr5MBViU5hmJ0DxbF2OjQ8398UEknIr6+XURCD2wM63yjmZmhWNFqXlWgV6YOLw37pD8tNZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYnJUlMF; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYnJUlMF"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6dd01781b56so64518286d6.0;
        Tue, 14 Jan 2025 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736868708; x=1737473508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4YGqaBjrL5N1TiL6bnUVKqifu+Ce60WP5265OR5kAs8=;
        b=FYnJUlMFXd+U2Y7w0pAzo94GnAgkBw3NafrhclXkE57MoAbmJ5kkfNOcOECi6TqaaJ
         1mtI4U3o0KSvEVwE4/YM8ZfJV2UjCymdAukJmHDE/P4MmE2sVQ/ghzryxWGbbT7TssFJ
         4a33kHu0PIQGarrc0ci5Y1SNyTZfTQRsVSnGr+TLyYzVkdhQl0GDAkUSjeblq95PqEav
         XVH7FA9PWMedUXT/LtiAPPcUEnYAPrZIK5Y+LAvif3ZLlOlhSkceYcMtGGyqpuzU6xBO
         QaAhtH+sCyXk27rrJoohG4uWSWr4QEZpDRs50jfaiSWIkjpl49/yPQnhJkKOx5ieUV7/
         fbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736868708; x=1737473508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YGqaBjrL5N1TiL6bnUVKqifu+Ce60WP5265OR5kAs8=;
        b=Y7HPuIAuufSVOR4t+dc4guWPIOV8qp9mKbYkDrifgZWx6A5dBUs68w+5vr3B0N8NkK
         5F7lTMbOJXro74zb4Y/49r7uC0xPzjcrPvjmj8rKXbKO8PQ+yDcwpJ+14b2UJ16dh0pt
         /2TnW2hHnhVIdvcF/ElTslRnIa1mMnNQKP7DmCKqYxBX93lf/byt1nTir3YqkKkRAWRA
         bxDGci/EgsnTVTR4E+M9MWfOxj2Qpg7JxBaQ3Ai3Wkagxm4HVVW9VSDTpLm9lyvl6i69
         c2MTfp41F75fzx6btFf6s1Npe69/NXbg1vIKAAKeg3fXacXzh8b/Kf92mAjZDUbQPyHg
         V2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe9BHlUipJTzAB68d2O/kune+nJ8V2VZ59Pwfd7yZjAtrCQ4Es8SIzQJrGaJLMEf2FYr5tcz+fNis3hoU=@vger.kernel.org, AJvYcCWkWWRTt3dnjQO+QFQFscF19FKKDNsmIK9Skwbko8jWV6iKvkohgli7hR3JeQekCGqGIm/1rWQ1jpICyh3QcLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXoO016/PfX8WSWJ83ZCHaaytLALKW0Mlb8wdhBgL9PWIazEDl
	lba4/hMBntWcZHL7O+69BxEqZXuweqDkamfE5mM9usH6akG0NWCR
X-Gm-Gg: ASbGncv2QmnLBqKWpePgLf/3j2f2P73RMFxticBCPvI+WbITg3hz1AWbIQdLWBNMIN8
	/wfEjjutJ2UBdSpilb6AQ8RmU99aowbWAB6axRXPk9nCrhcT5rtfwvENxKa/OhBKHe5To1bZgu9
	szZilCSx92i0ovVwB60nY0Ji3R9jQd8h1ZMEV+fRSRUd1KX9cMF1l6JwUpIQfsgvIKqmO/iXFl5
	m2lE87STwQO/nR4S9+VK0ubDrJejwY84C3e+iptrMkfcVScxiMvGqkbHdPMYqS1X5ElMbquGB8P
	RQ2l6Mm60apdBMX1YgZwn4tdSoeoy+aoe0gdwj6Hp8Pl8Ts=
X-Google-Smtp-Source: AGHT+IHzBG/FLEMK050VdhMv0b8TqzaFK952QqudUpznb/pNNsKQV4bAqSp3RRURwZglCPvFSrYVkQ==
X-Received: by 2002:ad4:560f:0:b0:6e1:5076:c3ff with SMTP id 6a1803df08f44-6e15076c864mr160477066d6.36.1736868708145;
        Tue, 14 Jan 2025 07:31:48 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e19084d07dsm374156d6.35.2025.01.14.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:31:47 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id DE0C2120006A;
	Tue, 14 Jan 2025 10:31:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jan 2025 10:31:46 -0500
X-ME-Sender: <xms:YoOGZxKHxcdmy13M921tL8FAZmnf5RXI0Pmrvsu6WwTKVQ-VlAZS2Q>
    <xme:YoOGZ9LKAu-62amZfXCvlgOuop3IWWb3KPt7Y845JtiYWyjACxTuXdUp2_vnxgjO9
    Ow1XGqbbYeI_pKoxg>
X-ME-Received: <xmr:YoOGZ5tfYVMrTC2DEBza7RpLzruIxSy20oHauW-PidUPvODsdZNdaEYsssg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    fihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlohhrvghniihord
    hsthhorghkvghssehorhgrtghlvgdrtghomhdprhgtphhtthhopehvsggrsghkrgesshhu
    shgvrdgtiidprhgtphhtthhopehjhhhusggsrghrugesnhhvihguihgrrdgtohhmpdhrtg
    hpthhtoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepgh
    hrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:YoOGZyZjIs6Fo-t1VwiVixcluRsrKyfvPPh2ArVCY7FtRfrGL0noRw>
    <xmx:YoOGZ4YfBEHcCdkWkSbTTGsGZPMA2-X57UD_QZBCUvKJA6ntDlsnFQ>
    <xmx:YoOGZ2BsgicDdVcVPfg_lwutnZkePBsqZm_4kjcFbusQNqy3UoZxfQ>
    <xmx:YoOGZ2b2A5t-ciPQ02TQguHO7nwOJSAG_fEdXoe_MoMCsGM3Ku3Gdg>
    <xmx:YoOGZ0payDKTn2XUOwUsjETuEmb5Konq8c4ZEAT0-f3FsUNZDO-srFnO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 10:31:46 -0500 (EST)
Date: Tue, 14 Jan 2025 07:30:30 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v11 8/8] task: rust: rework how current is accessed
Message-ID: <Z4aDFk_BcSt5RZtO@boqun-archlinux>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <20241211-vma-v11-8-466640428fc3@google.com>
 <Z2C6eAMnniTnxTX3@tardis.local>
 <CAH5fLgg=+Y=v=X50VdaCWwRRRUpKzGvBB-ND+4LHx9CNeThVDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgg=+Y=v=X50VdaCWwRRRUpKzGvBB-ND+4LHx9CNeThVDg@mail.gmail.com>

On Mon, Jan 13, 2025 at 11:30:05AM +0100, Alice Ryhl wrote:
> On Tue, Dec 17, 2024 at 12:40 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Wed, Dec 11, 2024 at 10:37:12AM +0000, Alice Ryhl wrote:
> > > Introduce a new type called `CurrentTask` that lets you perform various
> > > operations that are only safe on the `current` task. Use the new type to
> > > provide a way to access the current mm without incrementing its
> > > refcount.
> > >
> > > With this change, you can write stuff such as
> > >
> > >       let vma = current!().mm().lock_vma_under_rcu(addr);
> > >
> > > without incrementing any refcounts.
> > >
> > > This replaces the existing abstractions for accessing the current pid
> > > namespace. With the old approach, every field access to current involves
> > > both a macro and a unsafe helper function. The new approach simplifies
> > > that to a single safe function on the `CurrentTask` type. This makes it
> > > less heavy-weight to add additional current accessors in the future.
> > >
> > > That said, creating a `CurrentTask` type like the one in this patch
> > > requires that we are careful to ensure that it cannot escape the current
> > > task or otherwise access things after they are freed. To do this, I
> > > declared that it cannot escape the current "task context" where I
> > > defined a "task context" as essentially the region in which `current`
> > > remains unchanged. So e.g., release_task() or begin_new_exec() would
> > > leave the task context.
> > >
> > > If a userspace thread returns to userspace and later makes another
> > > syscall, then I consider the two syscalls to be different task contexts.
> > > This allows values stored in that task to be modified between syscalls,
> > > even if they're guaranteed to be immutable during a syscall.
> > >
> > > Ensuring correctness of `CurrentTask` is slightly tricky if we also want
> > > the ability to have a safe `kthread_use_mm()` implementation in Rust. To
> > > support that safely, there are two patterns we need to ensure are safe:
> > >
> > >       // Case 1: current!() called inside the scope.
> > >       let mm;
> > >       kthread_use_mm(some_mm, || {
> > >           mm = current!().mm();
> > >       });
> > >       drop(some_mm);
> > >       mm.do_something(); // UAF
> > >
> > > and:
> > >
> > >       // Case 2: current!() called before the scope.
> > >       let mm;
> > >       let task = current!();
> > >       kthread_use_mm(some_mm, || {
> > >           mm = task.mm();
> > >       });
> > >       drop(some_mm);
> > >       mm.do_something(); // UAF
> > >
> > > The existing `current!()` abstraction already natively prevents the
> > > first case: The `&CurrentTask` would be tied to the inner scope, so the
> > > borrow-checker ensures that no reference derived from it can escape the
> > > scope.
> > >
> > > Fixing the second case is a bit more tricky. The solution is to
> > > essentially pretend that the contents of the scope execute on an
> > > different thread, which means that only thread-safe types can cross the
> > > boundary. Since `CurrentTask` is marked `NotThreadSafe`, attempts to
> > > move it to another thread will fail, and this includes our fake pretend
> > > thread boundary.
> > >
> > > This has the disadvantage that other types that aren't thread-safe for
> > > reasons unrelated to `current` also cannot be moved across the
> > > `kthread_use_mm()` boundary. I consider this an acceptable tradeoff.
> > >
> > > Cc: Christian Brauner <brauner@kernel.org>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/mm.rs   |  22 ----
> > >  rust/kernel/task.rs | 284 ++++++++++++++++++++++++++++++----------------------
> > >  2 files changed, 167 insertions(+), 139 deletions(-)
> > >
> > > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > > index 50f4861ae4b9..f7d1079391ef 100644
> > > --- a/rust/kernel/mm.rs
> > > +++ b/rust/kernel/mm.rs
> > > @@ -142,28 +142,6 @@ fn deref(&self) -> &MmWithUser {
> > >
> > >  // These methods are safe to call even if `mm_users` is zero.
> > >  impl Mm {
> > > -    /// Call `mmgrab` on `current.mm`.
> > > -    #[inline]
> > > -    pub fn mmgrab_current() -> Option<ARef<Mm>> {
> > > -        // SAFETY: It's safe to get the `mm` field from current.
> > > -        let mm = unsafe {
> > > -            let current = bindings::get_current();
> > > -            (*current).mm
> > > -        };
> > > -
> > > -        if mm.is_null() {
> > > -            return None;
> > > -        }
> > > -
> > > -        // SAFETY: The value of `current->mm` is guaranteed to be null or a valid `mm_struct`. We
> > > -        // just checked that it's not null. Furthermore, the returned `&Mm` is valid only for the
> > > -        // duration of this function, and `current->mm` will stay valid for that long.
> > > -        let mm = unsafe { Mm::from_raw(mm) };
> > > -
> > > -        // This increments the refcount using `mmgrab`.
> > > -        Some(ARef::from(mm))
> > > -    }
> > > -
> >
> > This is removed because of no user? If so, maybe don't introduce this at
> > all in the earlier patch of this series? The rest looks good to me.
> 
> I guess I can drop the temporary introduction of this. It's here due
> to the history of this series where originally it only had
> mmgrab_current, and Binder would use that. But with this patch, you

As someone who usually dig a lot of history in git, I would like to see
the drop of the temporary introduction ;-) If you're going to rebase,
please see whether the drop can be done easily, thanks! Not a block
issue though.

With or without the change, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> can use CurrentTask::mm() + ARef::from() to do the same thing. For
> Binder, the difference doesn't matter, but the latter is more powerful
> as you can access the current task's mm_struct without incrementing
> refcounts.
> 
> Alice

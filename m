Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792453602;
	b=OyfofnNF9GpZ2oZZjO2K+R+2K72q7sqjQJ9EvYFnoNTqEpwHpm8EEVlh31ZxbWabz51V
	 AridFz0gsQ6fR/CB7mtp77V7LvvgiGQzULVVpgLjkPvSUkXwdFycif3W/c5uqkVFe9kSZ
	 h9ir/cbEQRS0REtqdU5RlUaqChY8KbW0nOFB0zDxkPlfoneAhAwTJFENxvP4ZCi/hFQv2
	 3/pXNIOmm7G9JoAhraV5J29zdqd9MrLjjeoazTL6QwiBBmsOLcBUve5G3JJcRkofnbu7k
	 IzHr/5DvQ9qg7EJyjy0Ku/O50SVudvyYzsCdBMFguInDRzI5FKz2e8prDtHbKXaMXXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453602;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp;
	bh=onuj2J6Sp1nzMr+n0/d2KIqzuI4vHkm2dSFnJgrZrn0=;
	b=DsknevXSL+qGsCDlHbYSbimEEzJGwkaDMtmdEt3KgnYjnvjK5N5ToIyTLXQDRg7MqGK5
	 ObZLJf53whmtcPZ8TkqVb3yBDnnjsR+AyM/rn3tq968nvWPZOdtCB+OmKNWk3BDQsMlgH
	 xZEMNL4OWiGhbIA+pNuIM2rSjW4LrjuppGrWCF+2pkaoPj/BFjuKRRa2er0GErjBb7Anb
	 qUX0ZWMNbJAtZiYfM1cma0xjncbZ7TIKDVyyKRfHOrmDdilN7VxEc14kOUxE4oNylqJiE
	 a+BsLy6uquhaDdu2sA3pp96f8U4GKgk7LZkVNYjPjO5gQanQMi5ifTBuJ8JcKRoQZ2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TqLUt9K2;
	arc=fail smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28D606A31C;
	Mon, 19 Oct 2026 23:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB28D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TqLUt9K2
ARC-Seal: i=1; a=rsa-sha256; t=1792453569; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pm8RCnbSmW42Zm4mUc39fL8ACyz3UOg9Y49HC0FdyqaTld3VMQBsYHQNgyYFJio8UiJ+tdU8jr8ujad5PYYc2oL39/AqpDWLa7P5ZRdP0P33p350XTXPI2bUhv8FbIwQWZLme4ZVUyYAMi5n9wgkSAy03qOhZ3W495CCim7XVMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792453569; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=onuj2J6Sp1nzMr+n0/d2KIqzuI4vHkm2dSFnJgrZrn0=; 
	b=UCWdiYMt9ie/kifUQ1PSVr3qLwdMnxKUyNBT7/hUaGlkKI5ajJTZNwPdUVr6GyP8XdxRgLFln8oGqmD3oFeu0EBNsGd2JTlUTloff5x8CMYHVCL3uMh24h+JhDSBR1XSAPKzj5x7teVO3afsSrZwO0gVonTwqd5wm00vjQSb/UM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792453569;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=onuj2J6Sp1nzMr+n0/d2KIqzuI4vHkm2dSFnJgrZrn0=;
	b=TqLUt9K2fqcHxAbZkMh+UgfJVlD3MR4NaDZuoROmNvkdM1kGH4NTpLSITY8jBgzr
	GZ75sDSegBP+dpOfpGGk2BYDMJl1sAVzPzynrJF1gKXFggsRJkQFpmnxpLBsBNyC+Fn
	iVvTxLdtXXHxbJEHsBNihgXNRRRpVC5/aW5PF5IY=
Received: by smtp.zohomail.com with SMTPS id 1792453568024484.06943358185936;
	Mon, 19 Oct 2026 16:46:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:46:07 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/2] drm/tyr: allow userspace buffers to be mismatched
Message-ID: <atarvxFKYYuHhXGQ@um790>
References: <20261016-b4-dev_query_fixes-v3-0-f8071cda3515@collabora.com>
 <20261016-b4-dev_query_fixes-v3-2-f8071cda3515@collabora.com>
 <atXOd-EeFkdA-trn@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXOd-EeFkdA-trn@google.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/292.448.41

On Mon, Oct 19, 2026 at 08:01:59AM +0000, Alice Ryhl wrote:
> On Fri, Oct 16, 2026 at 01:44:21PM -0700, Deborah Brouwer wrote:
> > Allow userspace to provide a buffer that is smaller or larger than the
> > object that the kernel expects to write into it.
> > 
> > Set a minimum buffer size to match those in PANTHOR_UOBJ_MIN_SIZE. If
> > userspace provides at least the minimum buffer size, then simply write
> > until the buffer is full.
> > 
> > If userspace provides a larger buffer than necessary, then zero out the
> > remaining buffer.
> > 
> > This ensures UAPI compatibility with Panthor.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/file.rs | 47 +++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 39 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
> > index 9f60a90d4948..a153aa453ed1 100644
> > --- a/drivers/gpu/drm/tyr/file.rs
> > +++ b/drivers/gpu/drm/tyr/file.rs
> > @@ -1,11 +1,18 @@
> >  // SPDX-License-Identifier: GPL-2.0 or MIT
> >  
> > +use core::mem::{
> > +    offset_of,
> > +    size_of_val, //
> > +};
> 
> size_of_val is present in kernel::prelude::* and does not need explicit
> import.

Ack, will fix in next version.

> 
> > +    transmute::AsBytes,
> 
> Usie the trait from zerocopy instead.

If this other series making zerocopy available to Tyr gets merged,
then I could rebase this series on it and switch over to IntoBytes:

https://lore.kernel.org/rust-for-linux/20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com/T/#m9a9a24e0cf1ae10451e3fc84955873b405d0da0b

> 
> > +    let mut writer = UserSlice::new(UserPtr::from_addr(usr_dst as usize), size).writer();
> 
> On 32-bit this will truncate upper bits. I guess that probably matches
> what Panthor does. Is it what we want?

Yes, that's what Panthor does; it uses the "u64_to_user_ptr()" macro to do
this deliberately.

Since UserPtr only accepts a usize argument, I have to cast in Tyr,
but instead, what do you think if I added another method to UserPtr
to accept a u64 address and cast it to usize just like in the C macro.
Something like:

    /// Create a `UserPtr` from a u64 userspace address.
    ///
    /// Deliberately truncate upper bits for 32-bit systems.
    #[doc(alias = "u64_to_user_ptr")]
    #[inline]
    pub fn from_u64(addr: u64) -> Self {
        Self::from_addr(addr as usize)
    }

> 
> Alice

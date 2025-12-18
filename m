Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E6C2DF3F2
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766050814; cv=none; b=mhC6lKmOOtISywu6CBNxUcCX7QYxyNeDIK8WHcqLpsuMM/RBE8XzG05+Eu8ZVRmsfehdruV7flcP6Jci7q2u/jib7G3epbnBtrNrFn0lBU93Ixcpa3CyGIP5NAe6xAxYsG9I7WnBjiyvEkwafgZD1oh2n4o5C4bRomFMJ4kOaqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766050814; c=relaxed/simple;
	bh=kw99CZ6VErZHARNPDm5gv9tWcubRwTnXuIl8lydkx3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fCVf5spmH/rKxoosgzpaq2n48WslxUXTpHAG74ZLhj0m41RsSig7GAJX/eUgsJyOzetC4tcNtHpaWFBQ8WuARa7tSJsMdcXnuFLBxjGe/FcUVekQSzDe+VtdfyrQP5u61p32u6kmlVKOGVVkYyAZJt5ZqYZOcrSfL+xk3N4JTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHY/NIT6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHY/NIT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E966C4CEFB;
	Thu, 18 Dec 2025 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766050809;
	bh=kw99CZ6VErZHARNPDm5gv9tWcubRwTnXuIl8lydkx3g=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=OHY/NIT6Ow5kInnxL9eF94GYantJTnHTEgpfVN81AMbIolrWTTawcpyk8mB2k/wE/
	 z7SXmVYMaNGVbq4EQd6wjb7ialrP0MbCd256J4GT81Cce5f3ncN2XAigwuENDAum7P
	 z470N0arGQp6r1wFyQQHGXAJuWzu9TvZLosFR9jeUmWiaxZQ6KIbw5XbJdY7fWoPmB
	 q/CI9FeV+1uV85qkEE45XXD204fuu2h/3n8+PXRtbmGwrDrW/9LxMZs+4Cn+NfWWvt
	 wIIKXLUGnnErz8jsReEOn0cKEl6K+8RK/B2yaXU3gzJWzzr2Pe7uFLRbHpjqeHR8kU
	 Wg6c+FNgm1wUA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 10:40:05 +0100
Message-Id: <DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org>
Subject: Re: [PATCH v3 2/9] rust: debugfs: add lookup contructor
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, "Alice Ryhl" <aliceryhl@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Matthew Maurer"
 <mmaurer@google.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-3-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-3-ttabi@nvidia.com>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> Add a new constructor for Dir that uses the debugfs_lookup() API to
> obtain a reference to an existing debugfs directory entry.
>
> The key difference from Dir::new() and Dir::subdir() is the cleanup
> semantics: when a Dir obtained via lookup() is dropped, it calls
> dput() to release the reference rather than debugfs_remove() which
> would delete the directory.
>
> To implement this cleanup distinction, the Entry class now includes
> an is_lookup boolean that specifies how the entry was created and
> therefore how it should be dropped.

I have two main comments about this.

(1) I think it would be better to wrap "lookup entries" into a new type in =
order
to account for the fact that they do not behave like regular entries. I.e. =
when
a "lookup entry" is dropped, it does not cause the entry to disappear from =
the
file system. Analogously, when the regular entry is dropped it disappears f=
rom
the file system regardless of whether a "lookup entry" still has a referenc=
e
count.

(2) The commit message lacks the motiviation for adding this functionality,
which is only for the purpose of a workaround of an unrelated limitation wi=
th
accessing the fields of a module structure (which Gary already works on a
solution for).

I understand it might take a while until the solution Gary works on is read=
y and
I'm perfectly fine with a temporary workaround. But, this workaround has to=
 be
on nova-core only and not introduce a feature in core code that in the near
future becomes dead code.

If we have a use-case for lookup() elsewhere, I'd like to see it first. But=
 if
we don't I prefer not to add this feature as a pure workaround for somethin=
g
else.

In fact, I think that debugfs_lookup() rarely is the correct solution and m=
ore
often indicates some kind of (design) issue, like in this case.

- Danilo

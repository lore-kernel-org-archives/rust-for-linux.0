Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E1F2F8E85
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578012; cv=none; b=QMNmBLiuHas8hzIImK/dRzw51l2E2tVmRp3YsdYPYcRA48xzCNEJyJBUuIMP1NVm8+R7E1HUe42I8FopgqQAdyyuDnsx34c9mwpCN6h+TwLiJP4Dmdz5GD9KQnt4jHiQWRUehI52aKS01KAAnCkmAwPlBpB6EjHPHMimYdimttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578012; c=relaxed/simple;
	bh=Zu5taXm24mxSieNPyOjH5tj/MGFFD+5dd6eSBEBdSTI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t0DStkHdbie7u7tmbWGAqCpz/kOh4O8+VHinZ0PHFySQZvRPoaHIUt51ZrJTZSNIHOSqhgZON5ZFXUzU7Vah4zkHAudHTpYZdk5lpyzEsEzaQkuPplNcingGujtZfpivVfQ1HxyWeSqztNPgzR8FCZAp0aRVgztEuO26CzSXYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnFpPHa9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnFpPHa9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5451F00898;
	Fri,  9 Oct 2026 20:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791578011;
	bh=FrUzvPqSc6+QZhxIsT53b/sW/BbNgjvyStU8GSvhN8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EnFpPHa9Z0NiEs5t6+pWbUg337VzNdUvSQGwOUy3aE8vFpWQBF6BXUuJGq3YIFg78
	 NxjMzG0SzPeTKPGpMCgmx2yMqA1kia98qmZ8EZqmu41Td9k4oGpe1hgpLbMbV07hzL
	 4xB1+JImtqAxYzoj+QSqMj7t4lGJGeo3F4kUfYhFLWfvGl48lQ7UNbG3o3wXrQXrLA
	 IRoPW7ke2sTioFX8AxqEO4YrLauxt9RlgxWUcW2nffjC2BLvB49q6uQ/H/6v4/X5fn
	 bCPHmq6/ipJeYWd/iqrmE7RZTEYhIHE94FFmwMwo+hdZN11X8bzEjz/7XlWj93XLxg
	 49m3TqYtOH6qA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Priya Bala Govindasamy <pgovind2@uci.edu>,
 Breno Leitao <leitao@debian.org>
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu, ojeda@kernel.org
Subject: Re: [PATCH 0/1] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
In-Reply-To: <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net>
References: <cUqSvTsTaMYu_TRrAABCYTNz0HZf5JeFdIq_Vv4e_-GFMgI5NwVfZJDcy8CTgc4fH_1OoiiMg2I2LIzQX1y3Rg==@protonmail.internalid>
 <cover.1790981219.git.pgovind2@uci.edu> <87v77bcg0m.fsf@kernel.org>
 <87se2fca48.fsf@kernel.org>
 <3RuaIprV4H3e3FnKKFRDbFLoX28Pw2JicqOEgLLCMKEKZgl1LnWvQ6lYh-fgzYC2fgCEnRLhsmFWgq9opqQNEg==@protonmail.internalid>
 <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net>
Date: Fri, 09 Oct 2026 22:32:54 +0200
Message-ID: <87mrsmd37t.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Oct 9, 2026 at 1:49 PM BST, Andreas Hindborg wrote:
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>
>> Actually there may be a problem, but I think it may be in C configfs. If
>> you take a look at the function that reads data from the iov_iter:
>>
>>   static int fill_write_buffer(struct configfs_buffer *buffer,
>>             struct iov_iter *from)
>>   {
>>     int copied;
>>
>>     if (!buffer->page)
>>       buffer->page = kmalloc(PAGE_SIZE, GFP_KERNEL); // <- HERE
>>     if (!buffer->page)
>>       return -ENOMEM;
>>
>>     copied = copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from);
>>     buffer->needs_read_fill = 1;
>>     /* if buf is assumed to contain a string, terminate it by \0,
>>     * so e.g. sscanf() can scan the string easily */
>>     buffer->page[copied] = 0;
>>     return copied ? : -EFAULT;
>>   }
>>
>> This function does not zero the page that is written into. This,
>> combined with the buffer being per file handle means that you can read
>> the original data in the page. The `kmalloc` should be probably be
>> replaced with a `kzalloc`. This should be a problem for C modules as
>> well.
>
> Why is this an issue? The extra uninitialized bytes should not be used.

I guess you are right. In C, a driver just promise to not read beyond
the write count. At any rate, it is a cheap defensive mechanism to
kzalloc this buffer. It would prevent leaking uninitialized data to user
space under a wrong length returned by the `show` implementation after a
`store` operation.

In rust it is an issue because the *driver* _may_ read the uninitialized
bytes.

So we can fix it on the Rust side with this patch from Priya. Or we can
initialize the buffer on allocation in C.

For the record, I did not notice that the buffer is per file open, which
is why the bug is here in the first place.

@Breno, should we zero this buffer on initialization on the C side, or
do we just zero the buffer before calling into Rust driver code?

Best regards,
Andreas Hindborg



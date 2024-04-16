Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E8585953
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713261210; cv=none; b=GcIuEOsFjyM6gPVC+tKO5+u3MZ7pGe7B7EbEbswbgNQllEppImbE5j+D4NXwEOD6b+T52qvWyy1mInoumxzVWDQAjRU8YoyT/5RyyFon6ZU4gqN1wWsAIwnwrNZJkFUHU+nK2Ex8pZdcGXQXhIG/RoVQ7ILldk3y7qhBdxOuNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713261210; c=relaxed/simple;
	bh=+ks73W1omqYfmJvTwfhN753jtSbBbxFN221Kk1utxwY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BmL12tqHPgNXuZdNED40jkkIFlhGGC8NBlRR4aHYVJYPZkoeMi36ECiNLLVGLa8xQBZb/uk8xye6yFFVzjpGksWAIowuNVuBaC1O29BBtGN6aIQChSo+K2sCIqRGk7WiSDLChAad3haXR8j9NiHsZ6ZGdJBWbVYWpmYprUqp4qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j2FfJYFS; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j2FfJYFS"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-516d2c322d5so3943492e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713261207; x=1713866007; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxdCRYYXGANGytr9D/dXdYZGmP8QPln1sFHz1kYy8RA=;
        b=j2FfJYFSSK+ZhF2A6r10hk8CLu9maZpWXEf1Fep1M6Ge9H52RIftK0aErA4aaKkQBT
         DF8x2qw+jdxo/RZzs2APKyhYwy8Aouzf5dad1lsdBbGahgprnckkCSr8FnPAOB6TiTTB
         B5uiyCXklB5GrnzZVYy5x3pc+gFwQ3hQ32w4TtVF+HX+XAQbaaoowcpGXAQI3c3RBmWq
         FQuLr14m37mxduyNzVJCby4kHL4f+A/EM8g5PiHG7uem2L2Q1q580PCzzVomy5PwUn5/
         nOLoUCP29I8DBtBY+kumpfiKsIsGybfw0CYf+hixf8Jjx1trH2qkvt66U0eWMFSUtwg0
         yEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713261207; x=1713866007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxdCRYYXGANGytr9D/dXdYZGmP8QPln1sFHz1kYy8RA=;
        b=TRpEyZaPVIdnbqkGtoWUsjUdkj5Nnf1gZ/LNjjVNMjOXpDUS+qSUioKLH1dZqcmR0u
         EhusXOz9g8aYM75N6b3Ql1/G7GQOJfgbiKZOVH5tL+CrOSazhIfr6lDj8MZYHTmgAsNL
         EldtwaCZcAWBykPdlljSR83ahLaGfH9HwjHAfSAeNleLcCRxi9D8Ci7DMYJlMmERfY0U
         hExWPVVw3OI1iAHyf14lpXVukS0M/dAenf8gpb7J1NMRHjOS+bTagjQaODrF2Bfq2Ryl
         ODDglqnojg/8Lbh5xoWOqW3ECLlyEruHjuavX+GjPfK2NssT+BY4IKXVxWK2VwRA2yed
         /3dA==
X-Forwarded-Encrypted: i=1; AJvYcCW4DidbVvIxBOjz9Wia+tpi9i4xu5/Om5bNHkJg5I4KqeJz89BhbPFgGz92n3eQn/knHQKSneLrtoPp+xgCBEKgwFELhXMVOGsl6sfNTg0=
X-Gm-Message-State: AOJu0Yx+KFbveHftK7EZC5Bt9B+jpz+WOW0Rs7VGc6UTjXHaVcKjA/Fe
	mOZhDO8ERnEOYpk8sOVWi0Mb78pOA0yp1UIwoOCAQVFRFHpkyI5EDbwaz/VDCSXSVouuYV+ZoI1
	WZjin4NQpqQfL9g==
X-Google-Smtp-Source: AGHT+IGpPtly0O4lKmm2yAf8fr9xPygMFFUf09ZonUzlU30soeqhDzuRYrLmXwh9qvhO3H43GdRtnBrPRPBC5Kk=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:951:b0:518:cc3d:45d1 with SMTP
 id u17-20020a056512095100b00518cc3d45d1mr6198lft.11.1713261206597; Tue, 16
 Apr 2024 02:53:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 09:53:23 +0000
In-Reply-To: <Zh2hw0uQrkN5yVVA@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Zh2hw0uQrkN5yVVA@boqun-archlinux>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240416095323.1107928-1-aliceryhl@google.com>
Subject: Re: [PATCH v5 1/4] rust: uaccess: add userspace pointers
From: Alice Ryhl <aliceryhl@google.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@samsung.com, akpm@linux-foundation.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, arnd@arndb.de, arve@android.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, brauner@kernel.org, cmllamas@google.com, 
	gary@garyguo.net, gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	keescook@chromium.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	maco@android.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Boqun Feng <boqun.feng@gmail.com> writes:
> On Mon, Apr 15, 2024 at 07:13:53AM +0000, Alice Ryhl wrote:
>> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>> 
>> A pointer to an area in userspace memory, which can be either read-only
>> or read-write.
>> 
>> All methods on this struct are safe: attempting to read or write on bad
>> addresses (either out of the bound of the slice or unmapped addresses)
>> will return `EFAULT`. Concurrent access, *including data races to/from
>> userspace memory*, is permitted, because fundamentally another userspace
>> thread/process could always be modifying memory at the same time (in the
>> same way that userspace Rust's `std::io` permits data races with the
>> contents of files on disk). In the presence of a race, the exact byte
>> values read/written are unspecified but the operation is well-defined.
>> Kernelspace code should validate its copy of data after completing a
>> read, and not expect that multiple reads of the same address will return
>> the same value.
>> 
>> These APIs are designed to make it difficult to accidentally write
>> TOCTOU bugs. Every time you read from a memory location, the pointer is
>> advanced by the length so that you cannot use that reader to read the
>> same memory location twice. Preventing double-fetches avoids TOCTOU
>> bugs. This is accomplished by taking `self` by value to prevent
>> obtaining multiple readers on a given `UserSlicePtr`, and the readers
>> only permitting forward reads. If double-fetching a memory location is
>> necessary for some reason, then that is done by creating multiple
>> readers to the same memory location.
>> 
>> Constructing a `UserSlicePtr` performs no checks on the provided
>> address and length, it can safely be constructed inside a kernel thread
>> with no current userspace process. Reads and writes wrap the kernel APIs
>> `copy_from_user` and `copy_to_user`, which check the memory map of the
>> current process and enforce that the address range is within the user
>> range (no additional calls to `access_ok` are needed).
>> 
>> This code is based on something that was originally written by Wedson on
>> the old rust branch. It was modified by Alice by removing the
>> `IoBufferReader` and `IoBufferWriter` traits, and various other changes.
>> 
>> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Thanks!
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks for taking a look!

>> ---
>>  rust/helpers.c         |  14 +++
>>  rust/kernel/lib.rs     |   1 +
>>  rust/kernel/uaccess.rs | 304 +++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 319 insertions(+)
>> 
> [...]
>> +    /// Reads raw data from the user slice into a kernel buffer.
>> +    ///
>> +    /// Fails with `EFAULT` if the read happens on a bad address.
> 
> ... we probably want to mention that `out` may get modified even in
> failure cases.

Will do.

>> +    pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
>> +        // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
>> +        // `out`.
>> +        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
>> +        self.read_raw(out)
>> +    }
>> +
> [...]
>> +
>> +impl UserSliceWriter {
> [...]
>> +
>> +    /// Writes raw data to this user pointer from a kernel buffer.
>> +    ///
>> +    /// Fails with `EFAULT` if the write happens on a bad address.
> 
> Same here, probably mention that: the userspace memory may be modified
> even in failure cases.

Will do.

> Anyway, they are not correctness critical, so we can do these in later
> patches.

It looks like I'll have to send another version anyway due to the
conflict with [1], so I can take care of it.

Alice

[1]: https://lore.kernel.org/rust-for-linux/20240328013603.206764-1-wedsonaf@gmail.com/
